
RaidLeaderData = {
	useKorean = false;
  recruitInfo = { zone = "", sub = "", gear = ""};
};

function RLF_OnLoad(frame)
  print("RaidLeader Loaded - /rld to bring it up")
  if frame:IsVisible() then
    frame:Hide()
  end

  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:SetScript("OnMouseDown",function()frame:StartMoving()end)
  frame:SetScript("OnMouseUp",function()frame:StopMovingOrSizing()end)

  RaidLeaderData.recruitInfo = { zone = "", sub = "", gear = ""}

  -- slash commands
  --
  SlashCmdList["SLASH_RAIDLEADER_BUFFORDER"] = function()
    Buff_Get_Paladin_Orders()
  end

  SlashCmdList["SLASH_RAIDLEADER_GUI_POPUP"] = function() 
    RLF_Toggle() 
  end

  SLASH_RAIDLEADER_BUFFORDER1   = "/rld_buff"
  SLASH_RAIDLEADER_GUI_POPUP1   = "/raidleader"
  SLASH_RAIDLEADER_GUI_POPUP2   = "/rld"

end

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