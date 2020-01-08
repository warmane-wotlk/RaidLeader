local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

-- Button Action -------------------------------------------------------------------------------------------
--
function RLF_Button_Close_OnClick()
  if RaidLeader_Frame:IsVisible() then
    RaidLeader_Frame:Hide()
    if Addon_Frame:IsVisible() then
      Addon_Frame:Hide();
    end
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
    print("combatMsgId: " .. combatMsgId)
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
	{ name = L["TOC10"], zoneId = 543, shortName = "TOC", num = 10 },
	{ name = L["TOC25"], zoneId = 543, shortName = "TOC", num = 25 },
	{ name = L["ICC10"], zoneId = 604, shortName = "ICC", num = 10 },
	{ name = L["ICC25"], zoneId = 604, shortName = "ICC", num = 25 },
	{ name = L["RS10"], zoneId = 609, shortName = "RS", num = 10 },
	{ name = L["RS25"], zoneId = 609, shortName = "RS", num = 25 },
	{ name = L["VOA10"], zoneId = 532, shortName = "VOA", num = 10 },
	{ name = L["VOA25"], zoneId = 532, shortName = "VOA", num = 25 },
	{ name = L["NAXX10"], zoneId = 535, shortName = "NAXX", num = 10 },
	{ name = L["NAXX25"], zoneId = 535, shortName = "NAXX", num = 25 },
	{ name = L["OS10"], zoneId = 531, shortName = "OS", num = 10 },
	{ name = L["OS25"], zoneId = 531, shortName = "OS", num = 25 },
	{ name = L["UL10"], zoneId = 529, shortName = "Ulduar", num = 10 },
	{ name = L["UL25"], zoneId = 529, shortName = "Ulduar", num = 25 },
	{ name = L["EE10"], zoneId = 527, shortName = "EOE", num = 10 },
	{ name = L["EE25"], zoneId = 527, shortName = "EOE", num = 25 },
};

-- frame:GetID() == arg1
function RL_RaidZoneButton_OnClick(frame, arg1, arg2, checked)
	UIDropDownMenu_SetSelectedID(RaidLeader_DropDownMenu, frame:GetID())
end

local function RL_LoadRaidZones()
  local info = UIDropDownMenu_CreateInfo()
  for i = 1, table.getn(raidZoneInfos) do
    info.text = raidZoneInfos[i].shortName .. raidZoneInfos[i].num
    info.func = RL_RaidZoneButton_OnClick
    info.checked = nil
    info.arg1 = i
    UIDropDownMenu_AddButton(info)
  end
end

function RLF_Button_SelectRaid_OnClick()
	ToggleDropDownMenu(1, nil, RaidLeader_DropDownMenu, self, 0, 0);
end

function RLF_Button_SelectRaid_OnLoad()
  UIDropDownMenu_SetWidth(RaidLeader_DropDownMenu,110)
	UIDropDownMenu_SetText(RaidLeader_DropDownMenu, "select instance")
	RL_LoadRaidZones()
end


-- JoinChannelByName does not work
function RLF_Button_AutoFlood_OnClick(param)
  if param == "RL_BUTTON_FLOOD_ON" then
    
    local globalChannelNum = RL_GetGlobalChannelNumber()
    if globalChannelNum == 0 then
      print("Please join global channel and then try again")
    else
      local raidfindMsg = "LFM ICC25 Need All 6.3k+"
      SlashCmdList["AUTOFLOODSETCHANNEL"](globalChannelNum)
      SlashCmdList["AUTOFLOODSETRATE"](20)
      SlashCmdList["AUTOFLOODSETMESSAGE"](raidfindMsg)
      SlashCmdList["AUTOFLOOD"]("on")
    end
  else
    SlashCmdList["AUTOFLOOD"]("off")
  end
end