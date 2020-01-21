-- Author      : bozlo
-- Create Date : 1/4/2020 12:30:16 PM

local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

local raidZoneBossInfos = {}
local zoneName = ""
local buttonObj = {}
local selectedBoss = {}
local selectedBossIdx = 1

function RL_ZoneFrameToggle()
  if RL_ZoneFrame:IsVisible() then
    RL_ZoneFrame:Hide()
  else
    RL_ZoneFrame:Show()
  end
end

function RLF_Zone_RaidWarning(param)
  if param then
    local combatMsgId = param .. "_MSG"
    local RLL = RL_Zone_LoadRaidWarningData(zoneName)

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

  RLF_Zone_RaidWarning(buttonObj[self:GetName()].id)
end

local function RLF_Zone_CreateButton(id, x, y)
  local ZL = RL_Zone_LoadButtonText(zoneName)
  local button = CreateFrame("Button", id, RL_ZoneFrame, UIPanelButtonTemplate)
  button:SetPoint("CENTER", RL_ZoneFrame, "TOPLEFT", x, y)
  button:SetWidth(75)
  button:SetHeight(23)
 
  button:SetText(ZL[buttonObj[id].id])
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

local function RL_Zone_UpdateTitle()
  if zoneName == "" then
    RL_ZoneFrame_Header:SetText("No Zone Info")
  else
    RL_ZoneFrame_Header:SetText(zoneName .. RaidLeaderData.recruitInfo.sub)
  end
end

local function RL_Zone_UpdateButtons(id)
  -- hide all of buttons
  for _, button in pairs(buttonObj) do
    button.frame:Hide()
  end

  if raidZoneBossInfos == nil or not next(raidZoneBossInfos) then return end

  if id < 1 then    id = 1 end
  if id > #raidZoneBossInfos then id = #raidZoneBossInfos end

  selectedBossIdx = id
  selectedBoss = raidZoneBossInfos[id]

  -- create buttons
  local commands = selectedBoss.commands

  local fx = frameSize.x
  local fy = frameSize.y

  local x = ptStart.x
  local y = ptStart.y
  for i = 1, #commands do
    local commandId = selectedBoss.id .. "_" .. commands[i]
    local buttonId  = "RL_ZONE_BOSS_BUTTON_ID_" .. i

    if buttonObj[buttonId] then
      local ZL = RL_Zone_LoadButtonText(zoneName)
      buttonObj[buttonId].id = commandId
      buttonObj[buttonId].frame:SetText(ZL[buttonObj[buttonId].id])
      buttonObj[buttonId].frame:Show()
    else
      buttonObj[buttonId] = { frame = {}, id = commandId }
      buttonObj[buttonId].frame = RLF_Zone_CreateButton(buttonId, x, y)
    end

    x = x + ptNext.dx

    if i % numOfButtonsInRow == 0 then
      x = ptStart.x
      y = y - ptNext.dy
    end    
  end

  fy = fy + frameGapY * math.floor((#commands - 1 ) / numOfButtonsInRow)

  RL_ZoneFrame:SetSize(fx, fy)  
end

local function RL_Zone_Initialize()
  zoneName = RaidLeaderData.recruitInfo.zone
  if zoneName == "" then return end
  raidZoneBossInfos = RL_Zone_Infos(zoneName)

  RL_Zone_UpdateTitle()

  RL_Zone_UpdateButtons(1)
end

local function RLF_Zone_OnEvent(frame, event)
  if event == "PLAYER_LOGIN" then
    RL_Zone_Initialize()

    UIDropDownMenu_Initialize(RL_Zone_BOSS_DropDownMenu, RL_Button_SelectRaidBoss_Initialize, nil)
    UIDropDownMenu_SetText(RL_Zone_BOSS_DropDownMenu, selectedBoss.name)
  end
end

function RLF_Button_Boss_Move_OnClick(id)
  local newId = selectedBossIdx - 1
  if id == "RL_ZONE_BOSS_RIGHT" then
    newId = selectedBossIdx + 1
  end

  RL_Zone_UpdateButtons(newId)
  UIDropDownMenu_SetText(RL_Zone_BOSS_DropDownMenu, selectedBoss.name)
end

function RL_Zone_OnLoad(frame)
  SlashCmdList["RAIDLEADER_CHILD"] = function()
    RL_ZoneFrameToggle()
  end
  SLASH_RAIDLEADER_CHILD1   = "/rlc"

  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:SetScript("OnMouseDown", function() frame:StartMoving() end)
  frame:SetScript("OnMouseUp",   function() frame:StopMovingOrSizing() end)
  frame:RegisterEvent("PLAYER_LOGIN" )         -- Fired when saved variables are loaded
  frame:SetScript("OnEvent", RLF_Zone_OnEvent)
end

-- Dropdown Frame
function RL_RaidZoneBossButton_OnClick(frame, arg1, arg2, checked)
  UIDropDownMenu_SetText(RL_Zone_BOSS_DropDownMenu, arg1)
  RL_Zone_UpdateButtons(arg2)
end

function RL_Button_SelectRaidZoneBoss_OnClick(frame)
  ToggleDropDownMenu(1, nil, RL_Zone_BOSS_DropDownMenu, frame, 0, 0);
end

function RL_Button_SelectRaidBoss_Initialize(frame, level, menuList)
  if raidZoneBossInfos == nil or not next(raidZoneBossInfos) then return end

  local info = UIDropDownMenu_CreateInfo()
  for i = 1, #raidZoneBossInfos do
    info.text     = raidZoneBossInfos[i].name
    info.func     = RL_RaidZoneBossButton_OnClick
    info.arg1     = raidZoneBossInfos[i].name
    info.arg2     = i
    UIDropDownMenu_AddButton(info, 1)
  end
end

function RL_Zone_Reflesh_GUI()
  RL_ZoneFrame:GetScript("OnEvent")(RL_ZoneFrame, "PLAYER_LOGIN");
end