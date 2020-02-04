local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

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

local previousInstanceId = 0
function RLF_OnEvent(frame, event)
  -- printf(event .. ", " .. GetCurrentMapAreaID())
  if event == "ADDON_LOADED" then
    local r = RaidLeaderData.recruitInfo
    UIDropDownMenu_SetText(RaidLeader_Gear_DropDownMenu, r.gear)
    UIDropDownMenu_SetText(RaidLeader_Zone_DropDownMenu, r.zone .. r.sub)

    RL_CHECKBUTTON_LANGUAGE:SetChecked(RaidLeaderData.useKorean)
    RL_CHECKBUTTON_USE_SDBM:SetChecked(RaidLeaderData.useSDBM)
    RL_CHECKBUTTON_NEED_HEALER:SetChecked(r.needHealer)
    RL_CHECKBUTTON_NEED_TANKER:SetChecked(r.needTanker)

    SDBM_UseDBM(RaidLeaderData.useSDBM)

    RaidLeaderData.instance = { inside = false, zone = "", sub = "" }
  elseif event == "RAID_ROSTER_UPDATE" then
    RRI_InitializeRaidRosterInfo()
    RRI_GetRaidRosterInfo()
  elseif event == "WORLD_MAP_UPDATE" then
    local instancdId = GetCurrentMapAreaID()
    local r = RaidLeaderData.recruitInfo

    if RLU_CheckInstances(instancdId) then
      if ((previousInstanceId ~= instancdId) or (previousInstanceId == instancdId and r.zoneId ~= instancdId )) then
        previousInstanceId = instancdId
        RLU_UpdateInstanceInfo()
        local zone, sub = RLU_GetCurrentInstanceInfo()
        r.zone = zone
        r.sub  = sub
        
        UIDropDownMenu_SetText(RaidLeader_Zone_DropDownMenu, r.zone .. r.sub)
        RL_Zone_Reflesh_GUI()
      end
    else
        RLU_SetIsInstance(false)
    end
  end
end

function RLF_OnLoad(frame)
  print("RaidLeader Loaded - /rld to bring it up")
  RL_TEXT_DRUM_OF_KING:SetText(L["Drums of the Wild"])
  RL_TEXT_USE_KOREAN:SetText(L["Use Korean"])
  RL_TEXT_USE_SDBM:SetText(L["Use SDBM"])

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
  frame:RegisterEvent("ADDON_LOADED" )         -- Fired when saved variables are loaded
  frame:RegisterEvent("RAID_ROSTER_UPDATE")
  frame:RegisterEvent("WORLD_MAP_UPDATE")
  frame:SetScript("OnEvent", RLF_OnEvent)
end

