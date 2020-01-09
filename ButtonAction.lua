local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

-- Button Action -------------------------------------------------------------------------------------------
--
function RLF_Button_Close_OnClick()
  if RaidLeader_Frame:IsVisible() then
    RaidLeader_Frame:Hide()
  end
end

function RLF_Button_Transparency_OnClick()
  RL_BUTTON_TRANSPARENCY:HookScript ("OnClick", function(self, button) if button == "RightButton" then RaidLeader_Frame:SetAlpha(1) end end)
  RL_BUTTON_TRANSPARENCY:HookScript ("OnClick", function(self, button) if button == "LeftButton" then RaidLeader_Frame:SetAlpha(0.5) end end);  
end

function RLF_Button_Kick_OnClick()
  UninviteUnit("target")
end

function RLF_Button_SetLootMethod_OnClick(id)
  local loot = {RL_BUTTON_MASTER_LOOT="master", RL_BUTTON_GROUP_LOOT="needbeforegreed", RL_BUTTON_FREEFORALL_LOOT="freeforall"}
  if loot[id] == "master" then
    if UnitName("target") == nil then
      SetLootMethod("master", "player")
    else
      SetLootMethod("master", "target")
    end
  else
    SetLootMethod(loot[id])
  end
end

-- say raid warning message
function RLF_Button_RaidWarning_OnClick(param)
  if param then
  	local combatMsgId = param .. "_MSG"
    local RLL = RL_LoadRaidWarningData()

    SendChatMessage(RLL[combatMsgId], "RAID_WARNING");
  end
end

function RLF_Button_SetLeader_OnClick()
  if UnitInRaid("target") == nil then
    local RLL = RL_LoadRaidWarningData()
    print(RLL["RL_BUTTON_SET_LEADER_MSG"]);
  else
    PromoteToLeader("target");
  end
end

function RLF_Button_Invite_OnClick()
  InviteUnit("target")
end

-- show tooltip
function RLF_Button_Show_ToolTip(param)
  if param then
    local toolTipId = param .. "_TOOLTIP"
    local RLL = RL_LoadRaidWarningTooltipData()
    GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
    GameTooltip:SetText( RLL[toolTipId] )
    GameTooltip:Show()
  end
end

function RLF_Button_Hide_ToolTip()
  GameTooltip:Hide()
end

-- change button text
function RLF_Button_SetText_OnLoad(self, param)
  self:SetText(L[param])
end

-- Northrend Raids
local raidZoneInfos = {
  { name = "TOC",    zoneId = 543, sub = {"10nm", "10hc", "25nm", "25hc"}},
  { name = "ICC",    zoneId = 604, sub = {"10nm", "10nm/hc", "10hc", "25nm", "25nm/hc", "25hc"}},
  { name = "RS",     zoneId = 609, sub = {"10nm", "10hc", "25nm", "25hc"}},
  { name = "VOA",    zoneId = 532, sub = {"10", "25"}},
  { name = "NAXX",   zoneId = 535, sub = {"10", "25", "10 weekly", "25 weekly"}},
  { name = "OS",     zoneId = 531, sub = {"10", "25"}},
  { name = "Ulduar", zoneId = 529, sub = {"10", "25"}},
  { name = "EE",     zoneId = 527, sub = {"10", "25"}},
};

-- frame:GetID() == arg1
function RL_RaidZoneButton_OnClick(frame, arg1, arg2, checked)
  -- can't hanle check mark at level 2
	--UIDropDownMenu_SetSelectedID(RaidLeader_DropDownMenu, frame:GetID())
  RaidLeaderData.recruitInfo.zone = arg1
  RaidLeaderData.recruitInfo.sub  = arg2
  UIDropDownMenu_SetText(RaidLeader_DropDownMenu, arg1 .. arg2)
end

function RLF_Button_SelectRaid_OnClick()
	ToggleDropDownMenu(1, nil, RaidLeader_DropDownMenu, self, 0, 0);
end

function RLF_Button_SelectRaid_Initialize(frame, level, menuList)
  UIDropDownMenu_SetWidth(RaidLeader_DropDownMenu,110)

  if level == 1 then
    local info = UIDropDownMenu_CreateInfo()
    for i = 1, #raidZoneInfos do
      info.text     = raidZoneInfos[i].name
      info.hasArrow = true
      info.notCheckable = true
      info.checked  = nil
      info.value    = raidZoneInfos[i].name
      UIDropDownMenu_AddButton(info, 1)
    end
  elseif level == 2 then
    local subItems = {}
    for i = 1, #raidZoneInfos do
     if raidZoneInfos[i].name == UIDROPDOWNMENU_MENU_VALUE then
        subItems = raidZoneInfos[i].sub
        break
     end
    end

    local info = UIDropDownMenu_CreateInfo()
    for _, sub in pairs(subItems) do
      info.text     = sub
      info.hasArrow = false
      info.notCheckable = false
      info.checked  = nil
      info.func     = RL_RaidZoneButton_OnClick
      info.arg1     = UIDROPDOWNMENU_MENU_VALUE
      info.arg2     = sub
      UIDropDownMenu_AddButton(info, 2)
    end
  end
end

local function _GetRaidFindMessage()
  local reqMembers = "(3/10)"

  local r = RaidLeaderData.recruitInfo
  r.gear = "5.5k+"
  local msg = "LFM " .. r.zone .. r.sub .. " Need " .. r.gear .. " " .. reqMembers
  return msg
end

-- JoinChannelByName does not work
function RLF_Button_AutoFlood_OnClick(param)
  if param == "RL_BUTTON_FLOOD_ON" then
    
    local globalChannelNum = RL_GetGlobalChannelNumber()
    if globalChannelNum == 0 then
      print("Please join global channel and then try again")
    else
      local raidfindMsg = _GetRaidFindMessage()
      SlashCmdList["AUTOFLOODSETCHANNEL"](globalChannelNum)
      SlashCmdList["AUTOFLOODSETRATE"](20)
      SlashCmdList["AUTOFLOODSETMESSAGE"](raidfindMsg)
      SlashCmdList["AUTOFLOOD"]("on")
    end
  else
    SlashCmdList["AUTOFLOOD"]("off")
  end
end