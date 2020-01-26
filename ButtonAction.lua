local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

--------------------------------------------------------
-- ms change variable
local sep = '[%s-_,.]';

local mschange_message_patterns = {
  'i roll'..sep,
  'roll'..sep,
  'my ms is'..sep,
  'my ms'..sep,
  'ms'..sep,
  'ms change'..sep,
  'mschange'..sep,
  '주특'..sep,
  '주특변경'..sep,
};

mschange_channel_listeners = {
  ['CHAT_MSG_RAID'] = {},
  ['CHAT_MSG_WHISPER'] = {},
};

mschange_messages = {}

function RLF_ChangeButtonText(button, param)
  local font = button:GetNormalFontObject();
  if param == "OFF" then
    button:SetNormalFontObject("GameFontNormal");
  elseif font then
    font:SetTextColor(0.25, 1, 0, 1);
    button:SetNormalFontObject(font);
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

    local msg = RLL[combatMsgId]
    if msg ~= nil then
      SendChatMessage(msg, msgChannel);
    else
      SendChatMessage(param, msgChannel);
    end
  end
end


-- My MS Change Popup
function RL_Callback_Update_MyMS(...)
  local data = ...
  if data ~= nil then
    mschange_messages[UnitName("player")] = data
  end
end

function RL_GetMyMSChange()
  RLF_OpenInputBox(L["My MS Change"], L["Type my MS Change if you want"], RL_Callback_Update_MyMS)
end

-----------------------------------
-- MS Change
local function find_mschange(message, pattern_table)
  local found = false;
  for _, pattern in ipairs(mschange_message_patterns) do

    message = string.lower(message)
    local result = string.find(message, pattern)

    -- If a raid was found then save it to our list of roles and continue.
    if result == 1 then
      found = true;
      
      -- Remove the substring from the message
      message = string.gsub(message, pattern, '')
      break  
    end
  end
  
  if not found then
    return nil;
  end
  
  return message;
end

local function is_mschange_channel(channel)
  return channel == 'CHAT_MSG_RAID' or channel == 'CHAT_MSG_WHISPER';
end

local function RL_event_handler(self, event, message, sender)
  if is_mschange_channel(event) then
      local foundMsg = find_mschange(message)
      if foundMsg then
        mschange_messages[sender] = foundMsg
      end
  end
end

local timerMsChange = {}

function RL_Disable_MSChange_Listen()
  for channel, listener in pairs(mschange_channel_listeners) do
    RL_remove_event_listener(channel, listener)
    wipe(mschange_channel_listeners[channel])
  end

  RLF_ChangeButtonText(RL_BUTTON_MS_CHANGE, "OFF")

  RL_kill_timer(timerMsChange)
  wipe(timerMsChange)
end

local function RL_Expire_MSChange_Timer()
  printf(L["Expire MS Change Time"])
  RL_Disable_MSChange_Listen()
end

function RL_Enable_MSChange_Listen()
  RL_GetMyMSChange()
  for channel, listener in pairs(mschange_channel_listeners) do
    if table.getn(listener) == 0 then
      mschange_channel_listeners[channel] = RL_add_event_listener(channel, RL_event_handler)
    end
  end

  RLF_ChangeButtonText(RL_BUTTON_MS_CHANGE, "ON")

  timerMsChange = RL_set_timer(60, RL_Expire_MSChange_Timer, false)
end

local function RL_Clear_MSChange_Info()
  RL_Disable_MSChange_Listen()

  printf(L["Reset MS Change Informations"])
  wipe(mschange_messages)
end

-- Button Action -------------------------------------------------------------------------------------------
--
--
function RLF_Button_MS_Change_Notify_OnClick(id)
  local msg = ""
  for name, ms in pairs(mschange_messages) do
    msg = msg .. name .. "(" .. ms .. ")" .. "//"
  end

  if msg == "" then
    local RLL = RL_LoadRaidWarningData()
    msg = RLL["NO MS Change"]
    RLF_Button_RaidWarning_OnClick(msg)
  else
    RLF_Button_RaidWarning_OnClick(id)
    RLF_Button_RaidWarning_OnClick(string.sub(msg,1,-3))
  end
end

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
    printf(L["Choose instance first"])
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
    printf(L["Not In Instance, so just toggle"])
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


function RLF_Button_Notify_MT_OT_OnClick(id)
  RRI_InitializeRaidRosterInfo()
  
  if RRI_AreTankersInRaid() == false then
    printf(L["Please assign tanker with /mt /ma"])
    return
  end
  
  local mt = RRI_GetTankerInfo("MT")
  local ot = RRI_GetTankerInfo("OT")

  SetRaidTarget(mt.name, 7);
  SetRaidTarget(ot.name, 6);

  local msg = "MT(" .. mt.name .. ") // OT (" .. ot.name .. ")"
  RLF_Button_RaidWarning_OnClick(id)
  RLF_Button_RaidWarning_OnClick(msg)
end


function RLF_Button_SetMT_OT_OnClick(id)
  if UnitInRaid("target") == nil then
    printf(L["Please choose the target"])
    return
  end

  RLF_Button_RaidWarning_OnClick(id)

  local RLL = RL_LoadRaidWarningData()
  local playerName = UnitName("player")
  if id == "RL_BUTTON_SET_MT" then
    SetRaidTarget("target", 7);
    SendChatMessage(L["Please type /mt to assign MT"], "WHISPER", GetDefaultLanguage("player"), playerName)
    printf(L["Please type /mt to assign MT"])
  elseif id == "RL_BUTTON_SET_OT" then
    SetRaidTarget("target", 6);
    SendChatMessage(L["Please type /ma to assign OT"], "WHISPER", GetDefaultLanguage("player"), playerName)
    printf(L["Please type /ma to assign OT"])
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



-- not use
function RLF_Button_SetLeader_OnClick()
  if UnitInRaid("target") == nil then
    local RLL = RL_LoadRaidWarningData()
    printf(RLL["RL_BUTTON_SET_LEADER_MSG"]);
  else
    PromoteToLeader("target");
  end
end

function RLF_Button_Invite_OnClick()
  InviteUnit("target")
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
  { name = "ONYXIA", zoneId = 0,   sub = {"10", "25"}, resv = "", weekly = "", 
    achieve = "|cffffff00|Hachievement:4397:07000000003E75A3:1:01:05:20:4294967295:0:0:0|h[오닉시아의 둥지 (25인)]|h|r"},
  { name = "ULDUAR", zoneId = 529, sub = {"10", "25"}, resv = "", weekly = "", 
    achieve = "|cffffff00|Hachievement:2895:07000000003E75A3:1:01:05:20:4294967295:0:0:0|h[울두아르의 비밀 (25인)]|h|r"},
};

-- frame:GetID() == arg1
function RL_RaidZoneButton_OnClick(frame, arg1, arg2, checked)
  -- can't hanle check mark at level 2
	--UIDropDownMenu_SetSelectedID(RaidLeader_Zone_DropDownMenu, frame:GetID())
  UIDROPDOWNMENU_SHOW_TIME = 1
  if RaidLeaderData.recruitInfo.zone ~= arg1 or RaidLeaderData.recruitInfo.sub ~= arg2 then    
    RL_Clear_MSChange_Info()
    RLF_Button_AutoFlood_OnClick("RL_BUTTON_FLOOD_OFF")

    RaidLeaderData.recruitInfo.zone = arg1
    RaidLeaderData.recruitInfo.sub  = arg2
    
    RL_Zone_Reflesh_GUI()
  end
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
    if curr_size >= raid_size then
      curr_size = raid_size - 1
    end
    reqMembers = " (" .. curr_size .. "/" .. tostring(raid_size) .. ")"
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

local bAutoFloodOn = false

-- JoinChannelByName does not work
function RLF_Button_AutoFlood_OnClick(id)
  if id == "RL_BUTTON_FLOOD_ON" then
    
    local globalChannelNum = RL_GetGlobalChannelNumber()
    if globalChannelNum == -1 then
      printf(L["WOW Error! Need to relog!"])
    elseif globalChannelNum == 0 then
      printf(L["Please join global channel and then try again"])
	  elseif RaidLeaderData.recruitInfo.zone == "" then
	    printf(L["Please choose the raid instance"])
    else
      local raidfindMsg = _GetRaidFindMessage()
      SlashCmdList["AUTOFLOODSETMESSAGE"](raidfindMsg)

      if bAutoFloodOn == false then
        SlashCmdList["AUTOFLOODSETCHANNEL"](globalChannelNum)
        SlashCmdList["AUTOFLOODSETRATE"](20)      
        SlashCmdList["AUTOFLOOD"]("on")
        RLF_ChangeButtonText(RL_BUTTON_FLOOD_ON, "ON")
      end      
      bAutoFloodOn = true
    end
  else
    SlashCmdList["AUTOFLOOD"]("off")
    RLF_ChangeButtonText(RL_BUTTON_FLOOD_ON, "OFF")
    bAutoFloodOn = false
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

function RLF_Button_DBM_Pull_OnClick(id)
  SlashCmdList["DEADLYBOSSMODS"]("pull 10")
  RLF_Button_RaidWarning_OnClick(id)
end

function RLF_Button_Paladin_Buff_OnClick(id)
  RRI_InitializeRaidRosterInfo()
  
  if RRI_AreTankersInRaid() == false then
    printf(L["Please assign tanker with /mt /ma"])
    return
  end

  -- Get raid info
  RRI_GetRaidRosterInfo()
  local buffMsg = Buff_Get_Paladin_Orders()
  RLF_Button_RaidWarning_OnClick(buffMsg)
end
