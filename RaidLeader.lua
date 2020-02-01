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

function RLF_OnEvent(frame, event)
  if event == "ADDON_LOADED" then
    local r = RaidLeaderData.recruitInfo
    UIDropDownMenu_SetText(RaidLeader_Gear_DropDownMenu, r.gear)
    UIDropDownMenu_SetText(RaidLeader_Zone_DropDownMenu, r.zone .. r.sub)

    RL_CHECKBUTTON_LANGUAGE:SetChecked(RaidLeaderData.useKorean)
    RL_CHECKBUTTON_USE_SDBM:SetChecked(RaidLeaderData.useSDBM)
    RL_CHECKBUTTON_NEED_HEALER:SetChecked(r.needHealer)
    RL_CHECKBUTTON_NEED_TANKER:SetChecked(r.needTanker)

    SDBM_UseDBM(RaidLeaderData.useSDBM)
  elseif event == "RAID_ROSTER_UPDATE" then
    RRI_InitializeRaidRosterInfo()
    RRI_GetRaidRosterInfo()
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
  frame:SetScript("OnEvent", RLF_OnEvent)
end

