RaidLeader = {
	useKorean = true;
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


--------------- RaidLeaderAddon -------------------------
function RLF_Child_OnLoad(frame)
  if frame:IsVisible() then
    frame:Hide()
  end
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:SetScript("OnMouseDown",function()frame:StartMoving()end)
  frame:SetScript("OnMouseUp",function()frame:StopMovingOrSizing()end)
end

--[
function RLF_Child_OnClick()
  if not Addon_Frame:IsVisible() then
    Addon_Frame:Show();
  else
    Addon_Frame:Hide();
  end
end
--]]

function RLF_Child_OnEnter()
  GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
  GameTooltip:SetText( "More options" )
  GameTooltip:Show()
end

function RLF_Child_OnLeave()
  GameTooltip:Hide()
end

