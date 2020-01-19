-- Author      : bozlo
-- Create Date : 1/4/2020 12:30:16 PM

-- raid select

function RLF_Zone_RaidWarning(param)
  if param then
    local combatMsgId = param .. "_MSG"
    local RLL = RL_Zone_LoadRaidWarningData()

    if UnitInRaid("player") == nil then
      msgChannel = "PARTY"
    else 
      local rank = select(2, GetRaidRosterInfo(GetNumRaidMembers()))

      if rank == nil or rank ~= 0 then
        msgChannel = "RAID_WARNING"
      else
        msgChannel = "RAID"
      end
    end

    local msg = RLL[combatMsgId]    
    if msg ~= nil then
      SendChatMessage(msg, msgChannel);
    else
      SendChatMessage(param, msgChannel);
    end
  end
end

function RLF_Zone_Buttons_OnClick(self)  
  RLF_Zone_RaidWarning(self:GetName())
end

function RLF_Zone_CreateButtons(id, x, y)
  local L = RL_Zone_LoadButtonText()
  local button = CreateFrame("Button", id, RL_ZoneFrame, UIPanelButtonTemplate)
  button:SetPoint("CENTER", RL_ZoneFrame, "TOPLEFT", x, y)
  button:SetWidth(75)
  button:SetHeight(23)
  
  button:SetText(L[id])
  button:SetNormalFontObject("GameFontNormal")

  local ntex = button:CreateTexture()
  ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
  ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints() 
  button:SetNormalTexture(ntex)
  
  local htex = button:CreateTexture()
  htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
  htex:SetTexCoord(0, 0.625, 0, 0.6875)
  htex:SetAllPoints()
  button:SetHighlightTexture(htex)
  
  local ptex = button:CreateTexture()
  ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
  ptex:SetTexCoord(0, 0.625, 0, 0.6875)
  ptex:SetAllPoints()
  button:SetPushedTexture(ptex)
  
  button:SetScript("OnClick", RLF_Zone_Buttons_OnClick)

  return button
end

local frameSize = { x = 250, y = 138 }
local buttonSize = { x = 75, y = 23 }
local ptStart = { x = 50, y = -107 }
local numOfButtonsInRow = 3
local ptNext = { dx = 0 + buttonSize.x, dy = 0 + buttonSize.y }
local frameGapY = ptNext.dy

local zoneName = "RL_ZONE_ICC_MARROWGAR"
local commands = RL_ZONE_ICC_INFO[zoneName]
local buttonObj = {}

function RL_Zone_OnLoad()
  local fx = frameSize.x
  local fy = frameSize.y

  local x = ptStart.x
	local y = ptStart.y
	for i = 1, #commands do
    local id = zoneName .. "_" .. commands[i]
    buttonObj[id] = RLF_Zone_CreateButtons(id, x, y)

		x = x + ptNext.dx

		if i % numOfButtonsInRow == 0 then 
			x = ptStart.x
			y = y - ptNext.dy
		end    
	end

  fy = fy + frameGapY * math.floor((#commands - 1 ) / numOfButtonsInRow)

  RL_ZoneFrame:SetSize(fx, fy)
end


function RL_ZoneFrameToggle()
  if RL_ZoneFrame:IsVisible() then
    RL_ZoneFrame:Hide()
  else
    RL_ZoneFrame:Show()
  end
end

local raidZoneBossInfos = {}


-- frame:GetID() == arg1
function RL_RaidZoneButton_OnClick(frame, arg1, arg2, checked)
  -- can't hanle check mark at level 2
  --UIDropDownMenu_SetSelectedID(RaidLeader_Zone_DropDownMenu, frame:GetID())

  UIDropDownMenu_SetText(RL_Zone_BOSS_DropDownMenu, arg1)  
end

function RLF_Button_SelectRaidBoss_OnClick()
  ToggleDropDownMenu(1, nil, RL_Zone_BOSS_DropDownMenu, self, 0, 0);
end

function RLF_Button_SelectRaidBoss_Initialize(frame, level, menuList)
--  UIDropDownMenu_SetWidth(RL_Zone_BOSS_DropDownMenu, 110)  

  local info = UIDropDownMenu_CreateInfo()
  for i = 1, #raidZoneBossInfos do
    info.text     = raidZoneInfos[i].name
    info.func     = RL_RaidZoneButton_OnClick
    info.arg1     = raidZoneInfos[i].name
    UIDropDownMenu_AddButton(info, 1)
  end
end

