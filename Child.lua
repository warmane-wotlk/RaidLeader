-- Author      : bozlo
-- Create Date : 1/4/2020 12:30:16 PM

-- raid select

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
