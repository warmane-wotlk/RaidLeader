local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

local previousInstanceId = 0
local timerCooldown = {}

function RLF_Main_Toggle()
  if not RaidLeader_Frame:IsVisible() then
    RaidLeader_Frame:Show()
  else
    RaidLeader_Frame:Hide()
  end
end 

function RL_GetGlobalChannelNumber()
    local chanList = { GetChannelList() }

    if chanList == nil then      
      return -1
    end

    for i=1, #chanList, 2 do
        if string.lower(chanList[i+1]) == "global" then
            return chanList[i]
        end
    end 
    return 0
end

local function RL_Expire_Cooldown_Timer()
  local timestamp = time()
  RRI_UpdateDruidCRCooldown(timestamp)
  RRI_UpdateBloodlustTime(timestamp)
  return false
end


local function RLF_COMBAT_LOG_EVENT_UNFILTERED(timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)
  local spellID, spellName, spellSchool, auraType = ...

  if eventType == "SPELL_RESURRECT" and spellID == 48477 then
    RRI_SetDruidCRCooldown(sourceName, timestamp)
  elseif eventType == "SPELL_AURA_APPLIED" and spellID == 2825 then
    RRI_SetBloodlustUsed(timestamp)
  elseif eventType == "UNIT_DIED" then
    RL_DeadListFrame_AddDeadRaider(destName)
  end
end

local function RLF_OnEvent(frame, event, ...)
  -- RL_INFO(event .. ", " .. GetCurrentMapAreaID() .. ", arg1: " .. tostring(arg1))
  if event == "ADDON_LOADED" and ... == "RaidLeader" then
    local r = RaidLeaderData.recruitInfo
    UIDropDownMenu_SetText(RaidLeader_Gear_DropDownMenu, r.gear)
    UIDropDownMenu_SetText(RaidLeader_Zone_DropDownMenu, r.zone .. r.sub)

    RL_CHECKBUTTON_LANGUAGE:SetChecked(RaidLeaderData.useKorean)
    RL_CHECKBUTTON_USE_SDBM:SetChecked(RaidLeaderData.useSDBM)
    RL_CHECKBUTTON_NEED_HEALER:SetChecked(r.needHealer)
    RL_CHECKBUTTON_NEED_TANKER:SetChecked(r.needTanker)
    RL_CHECKBUTTON_NEED_DPS:SetChecked(r.needDps)

    SDBM_UseDBM(RaidLeaderData.useSDBM)

    if RaidLeaderData.instance == nil then
      RaidLeaderData.instance = { inside  = false, zone = "", sub = "" }
    end
    RaidLeaderData.instance.inside = false
    RaidLeaderData.version = GetAddOnMetadata("RaidLeader", "version")

    frame:UnregisterEvent("ADDON_LOADED")
    frame.ADDON_LOADED = nil
  elseif event == "PLAYER_ENTERING_WORLD" then
    frame:RegisterEvent("RAID_ROSTER_UPDATE")
    frame:RegisterEvent("WORLD_MAP_UPDATE")

    timerCooldown = RL_set_timer(1, RL_Expire_Cooldown_Timer, true)

    frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
    frame.PLAYER_ENTERING_WORLD = nil
  elseif event == "RAID_ROSTER_UPDATE" then
    if UnitInRaid("player") then
       RRI_InitializeRaidRosterInfo()
       RRI_GetRaidRosterInfo()
    end
  elseif event == "WORLD_MAP_UPDATE" then
    local instancdId = GetCurrentMapAreaID()
    local r = RaidLeaderData.recruitInfo

    if RLU_CheckInstances(instancdId) then
      if (previousInstanceId ~= instancdId) or (previousInstanceId == instancdId and r.zoneId ~= instancdId ) then
        previousInstanceId = instancdId
        RLU_UpdateInstanceInfo()
        local zone, sub = RLU_GetCurrentInstanceInfo()
        r.zone = zone
        r.sub  = sub
        r.zoneId = RLU_GetZoneId(r.zone)

        RL_INFO(L.enterInstance:format(L[zone], sub))

        UIDropDownMenu_SetText(RaidLeader_Zone_DropDownMenu, r.zone .. r.sub)
        RL_Zone_Reflesh_GUI()

        RRI_ResetResurrectInfo()
      end
    else
        RLU_SetIsInstance(false)
    end
  elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
    RLF_COMBAT_LOG_EVENT_UNFILTERED(...)
  end
end

function RLF_OnLoad(frame)
  print("|cffFF7D0ARaidLeader|r by |cff0070DESunmudang|r Loaded - /rld to bring it up")
  RL_TEXT_DRUM_OF_KING:SetText(L["Drums of the Wild"])
  RL_TEXT_USE_KOREAN:SetText(L["Use Korean"])
  RL_TEXT_USE_SDBM:SetText(L["Use SDBM"])
  RL_Title_txt:SetText("RaidLeader-Sunmudang v" .. GetAddOnMetadata("RaidLeader", "version"))

  -- slash commands
  SlashCmdList["RAIDLEADER_GUI_POPUP"] = function()
    RLF_Main_Toggle()
  end
  SLASH_RAIDLEADER_GUI_POPUP1   = "/raidleader"
  SLASH_RAIDLEADER_GUI_POPUP2   = "/rld"
 
  -- ui
  if frame:IsVisible() then
    frame:Hide()
  end

  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:SetScript("OnMouseDown", function() frame:StartMoving() end)
  frame:SetScript("OnMouseUp",   function() frame:StopMovingOrSizing() end)
  frame:RegisterEvent("ADDON_LOADED")         -- Fired when saved variables are loaded
  frame:RegisterEvent("PLAYER_ENTERING_WORLD")
  frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
  frame:SetScript("OnEvent", RLF_OnEvent)
end

