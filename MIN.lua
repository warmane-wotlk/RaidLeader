local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

-- add this to your SavedVariables or as a separate SavedVariable to store its position
RCMD_Settings = {
	MinimapPos = 20 -- default position of the minimap icon in degrees
}

-- Call this in a mod's initialization to move the minimap button to its saved position (also used in its movement)
-- ** do not call from the mod's OnLoad, VARIABLES_LOADED or later is fine. **
function RCMD_MinimapButton_Reposition()
	RCMD_MinimapButton:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-(80*cos(RCMD_Settings.MinimapPos)),(80*sin(RCMD_Settings.MinimapPos))-52)
end

-- Only while the button is dragged this is called every frame
function RCMD_MinimapButton_DraggingFrame_OnUpdate()

	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()

	xpos = xmin-xpos/UIParent:GetScale()+70 -- get coordinates as differences from the center of the minimap
	ypos = ypos/UIParent:GetScale()-ymin-70

	RCMD_Settings.MinimapPos = math.deg(math.atan2(ypos,xpos)) -- save the degrees we are relative to the minimap center
	RCMD_MinimapButton_Reposition() -- move the button
end

-- Put your code that you want on a minimap button click here.  arg1="LeftButton", "RightButton", etc
function RCMD_MinimapButton_OnClick()
	RLF_Toggle()
end

function RCMD_MinimapButton_OnEnter()
  GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
  GameTooltip:SetText( L["Click to toggle RaidLeader"] )
  GameTooltip:Show()
end

function RCMD_MinimapButton_OnLeave()
  GameTooltip:Hide()
end