
RaidLeaderData = {
  version     = "v0.2";
	useKorean   = false;
	recruitInfo = { zone = "", sub = "", gear = "5.0k+", needHealer = true, needTanker = true };
};

function RLF_Toggle()
  if not RaidLeader_Frame:IsVisible() then
    RaidLeader_Frame:Show()
  else
    RaidLeader_Frame:Hide()
  end
end 

function RL_GetGlobalChannelNumber()
    local chanList = { GetChannelList() }
    for i=1, #chanList, 2 do
        if chanList[i+1] == "global" then
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
    RL_CHECKBUTTON_NEED_HEALER:SetChecked(r.needHealer)
    RL_CHECKBUTTON_NEED_TANKER:SetChecked(r.needTanker)
  end
end

function RLF_OnLoad(frame)
  print("RaidLeader Loaded - /rld to bring it up")

  -- slash commands
  SlashCmdList["RAIDLEADER_GUI_POPUP"] = function()
    RLF_Toggle()
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
  frame:SetScript("OnEvent", RLF_OnEvent)
end

