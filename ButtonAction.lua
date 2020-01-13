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

local toggle_hc_nm = 0
function RLF_Button_SetHC_NM_OnClick(id)
  local enDiff = { nm10 = 1, nm25 = 2, hc10 = 3, hc25 = 4}
  local r = RaidLeaderData.recruitInfo

  if r.zone == "" then
    print(L["Choose instance first"])
    return
  end

  local isInstance, _ = IsInInstance();
  if isInstance then
    local difficulty=GetInstanceDifficulty()
    if difficulty == enDiff.nm10 then
      SetRaidDifficulty(enDiff.hc10)
    elseif difficulty == enDiff.nm25 then
      SetRaidDifficulty(enDiff.hc25)
    elseif difficulty == enDiff.hc10 then
      SetRaidDifficulty(enDiff.nm10)
    elseif difficulty == enDiff.hc25 then
      SetRaidDifficulty(enDiff.nm25)
    end
  else
    print(L["Not In Instance, so just toggle"])
    local raid_size= tonumber(string.sub(r.sub, 1, 2))
    if raid_size == 10 then
      if toggle_hc_nm == 1 then 
        SetRaidDifficulty(enDiff.nm10)
      else
        SetRaidDifficulty(enDiff.hc10)
      end
    else
      if toggle_hc_nm == 1 then 
        SetRaidDifficulty(enDiff.nm25)
      else
        SetRaidDifficulty(enDiff.hc25)
      end
    end
    toggle_hc_nm = (toggle_hc_nm + 1) % 2
  end
end


function RLF_Button_SetMT_OT_OnClick(id)

  RLF_Button_RaidWarning_OnClick(id)
  if id == "RL_BUTTON_SET_MT" then
    SetRaidTarget("target", 7);
    print(L["Please type /mt to assign MT"])
  elseif id == "RL_BUTTON_SET_OT" then
    SetRaidTarget("target", 6);
    print(L["Please type /ma to assign OT"])
  end
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

    SendChatMessage(RLL[combatMsgId], msgChannel);
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
  { name = "TOC",    zoneId = 543, sub = {"10nm", "10hc", "25nm", "25hc"}, resv = "<B+P+O Resv>", 
    weekly = "", achieve = "|cffffff00|Hachievement:3812:0700000000194F14:1:01:01:20:4294967295:0:0:0|h[십자군 사령관의 부름 (25인)]|h|r"},
  { name = "ICC",    zoneId = 604, sub = {"10nm", "10nm/hc", "10hc", "25nm", "25nm/hc", "25hc"}, resv = "<B+P Resv>",
    weekly = "", achieve = "|cffffff00|Hachievement:4637:0700000000194F14:1:01:04:20:4294967295:0:0:0|h[영웅: 리치 왕의 몰락 (25인)]|h|r"},
  { name = "RS",     zoneId = 609, sub = {"10nm", "10hc", "25nm", "25hc"}, resv = "Nothing Resv",
    weekly = "", achieve = "|cffffff00|Hachievement:4816:0700000000194F14:1:12:30:19:4294967295:0:0:0|h[영웅: 황혼의 파괴자 (25인)]|h|r"},
  { name = "VOA",    zoneId = 532, sub = {"10", "25"}, resv = "", weekly = "", achieve = ""},
  { name = "NAXX",   zoneId = 535, sub = {"10", "25", "10 weekly", "25 weekly"}, resv = "",
    weekly = "|cffffff00|Hquest:24580:80|h[Anub'Rekhan Must Die!]|h|r", 
    achieve = "|cffffff00|Hachievement:577:07000000003E75A3:1:12:31:19:4294967295:0:0:0|h[낙스라마스의 몰락 (25인)]|h|r"},
  { name = "OS",     zoneId = 531, sub = {"10", "25", "10 weekly", "25 weekly"}, resv = "<Satchel Resv>" ,
    weekly = "|cffffff00|Hquest:24579:80|h[Sartharion Must Die!]|h|r", 
    achieve = "|cffffff00|Hachievement:2054:0700000000194F14:1:01:02:20:4294967295:0:0:0|h[황혼 지대 (25인)]|h|r"},
  { name = "Onyxia", zoneId = 0,   sub = {"10", "25"}, resv = "", weekly = "", 
    achieve = "|cffffff00|Hachievement:4397:07000000003E75A3:1:01:05:20:4294967295:0:0:0|h[오닉시아의 둥지 (25인)]|h|r"},
  { name = "Ulduar", zoneId = 529, sub = {"10", "25"}, resv = "", weekly = "", 
    achieve = "|cffffff00|Hachievement:2895:07000000003E75A3:1:01:05:20:4294967295:0:0:0|h[울두아르의 비밀 (25인)]|h|r"},
};

-- frame:GetID() == arg1
function RL_RaidZoneButton_OnClick(frame, arg1, arg2, checked)
  -- can't hanle check mark at level 2
	--UIDropDownMenu_SetSelectedID(RaidLeader_Zone_DropDownMenu, frame:GetID())
  UIDROPDOWNMENU_SHOW_TIME = 1
  RaidLeaderData.recruitInfo.zone = arg1
  RaidLeaderData.recruitInfo.sub  = arg2
  UIDropDownMenu_SetText(RaidLeader_Zone_DropDownMenu, arg1 .. arg2)
end

function RLF_Button_SelectRaid_OnClick()
  UIDROPDOWNMENU_SHOW_TIME = 1
	ToggleDropDownMenu(1, nil, RaidLeader_Zone_DropDownMenu, self, 0, 0);
end

function RLF_Button_SelectRaid_Initialize(frame, level, menuList)
  UIDropDownMenu_SetWidth(RaidLeader_Zone_DropDownMenu, 110)  

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
  local r = RaidLeaderData.recruitInfo
  local isRaid  = UnitInRaid("player")
  local curr_size = isRaid and GetNumRaidMembers() or GetNumPartyMembers() + 1
  local raid_size= tonumber(string.sub(r.sub, 1, 2))
  local reqMembers = ""
  local reqRoles = ""

  if r.needHealer and r.needTanker then
	reqRoles = "ALL"
  elseif r.needHealer then
	reqRoles = "HEAL/DPS"
  elseif r.needTanker then
	reqRoles = "TANK/DPS"
  else
	reqRoles = "DPS"
  end

  if raid_size <= 2 * curr_size then
    reqMembers = " (" .. curr_size .. "/" .. string.sub(r.sub, 1, 2) .. ")"
  else
    reqMembers = ""
  end

  local resv    = ""
  local weekly  = ""
  local achieve = ""
  for i = 1, #raidZoneInfos do
   if raidZoneInfos[i].name == r.zone then
      resv    = raidZoneInfos[i].resv
      weekly  = raidZoneInfos[i].weekly
      achieve = raidZoneInfos[i].achieve
      break
   end
  end

  local quest = ""
  if select(2, string.find(r.sub, "weekly")) ~= nil then     quest = weekly
  else                                                       quest = achieve  end
  
  local msg = "LFM " .. r.zone .. r.sub .. " " .. quest .. " Need " .. r.gear .. " " .. reqRoles .. reqMembers .. " " .. resv
  return msg
end

-- JoinChannelByName does not work
function RLF_Button_AutoFlood_OnClick(param)
  if param == "RL_BUTTON_FLOOD_ON" then
    
    local globalChannelNum = RL_GetGlobalChannelNumber()
    if globalChannelNum == 0 then
      print(L["Please join global channel and then try again"])
	elseif RaidLeaderData.recruitInfo.zone == "" then
	  print(L["Please choose the raid instance"])
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

-- Gear Dropdown menu
function RL_RaidGearButton_OnClick(frame, arg1, arg2, checked)
  RaidLeaderData.recruitInfo.gear = arg1
  UIDropDownMenu_SetText(RaidLeader_Gear_DropDownMenu, arg1)
  UIDROPDOWNMENU_SHOW_TIME = 1
end

function RLF_Button_SelectGear_OnClick()
  UIDROPDOWNMENU_SHOW_TIME = 1
  ToggleDropDownMenu(1, nil, RaidLeader_Gear_DropDownMenu, self, 0, 0);
end

function RLF_Button_SelectGear_Initialize(frame, level, menuList)
  UIDropDownMenu_SetText(RaidLeader_Gear_DropDownMenu, RaidLeaderData.recruitInfo.gear)
  UIDropDownMenu_SetWidth(RaidLeader_Gear_DropDownMenu, 60)  

  local raidGearInfos = { "4.0k+", "4.5k+", "4.7k+", "5.0k+", "5.3k+", "5.5k+", "5.6k+", "5.7k+", "5.8k+", "5.9k+", 
                          "6.0k+", "6.1k+", "6.2k+", "6.3k+" }
  local info = UIDropDownMenu_CreateInfo()
  for i = 1, #raidGearInfos do
    info.text     = raidGearInfos[i]
    info.checked  = false
    info.arg1     = raidGearInfos[i]
    info.func     = RL_RaidGearButton_OnClick
    UIDropDownMenu_AddButton(info, 1)
  end
end

-- Autoflood option
function RLF_Button_AutoFlood_option_OnClick(id, checked)
	if id == "RL_CHECKBUTTON_NEED_HEALER" then
		RaidLeaderData.recruitInfo.needHealer = (checked ~= nil)
	elseif id == "RL_CHECKBUTTON_NEED_TANKER" then
		RaidLeaderData.recruitInfo.needTanker = (checked ~= nil)
	end
end