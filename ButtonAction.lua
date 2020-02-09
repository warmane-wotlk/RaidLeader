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

local mschange_channel_listeners = {
  ['CHAT_MSG_RAID'] = {},
  ['CHAT_MSG_WHISPER'] = {},
};

local mschange_messages = {}
local userFlood_messages = ""
local timerMsChange = {}
local timerPull = {}

function RLF_ChangeButtonText(button, param)
  local font = button:GetNormalFontObject();
  if param == "OFF" then
    button:SetNormalFontObject("GameFontNormal");
  elseif font then
    font:SetTextColor(0.25, 1, 0, 1);
    button:SetNormalFontObject(font);
  end
end

function RLF_RaidWarning(msg)
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

  -- split msg if it found "\n".
  -- english only 255 bytes(char), unicode support only 125 char.
  local s = 1

  while true do
    local m, _ = string.find(msg, "\n", s)
    
    if m == nil then
      SendChatMessage(string.sub(msg,s), msgChannel)
      break
    else
      SendChatMessage(string.sub(msg,s,m-1), msgChannel)
    end
    s   = m + 1
  end  
end

-- say raid warning message
function RLF_Button_RaidWarning_OnClick(param)
  if param then
    local combatMsgId = param .. "_MSG"
    local RLL = RL_LoadRaidWarningData()
    local msg = RLL[combatMsgId]
    if msg then
      RLF_RaidWarning(msg);
    else
      RLF_RaidWarning(param);
    end
  end
end

function RLF_Button_Bloodlust_OnClick(param)
  local ready, readyTime = RRI_IsBloodlustReady()

  if ready then
    RLF_Button_RaidWarning_OnClick(param)
  else
    RL_INFO(L.infoBloodlustReady:format(readyTime))
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
  RLF_OpenInputBox(L["My MS Change"], L["Type your MS Change if you want"], "", RL_Callback_Update_MyMS)
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

function RL_SetUseSDBM(useSDBM)
  RaidLeaderData.useSDBM = useSDBM
  SDBM_UseDBM(useSDBM)
end

function RL_SetLanguageKorean(isKorean)
  RaidLeaderData.useKorean = isKorean
end

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
  RL_INFO(L["Expire MS Change Time"])
  RL_Disable_MSChange_Listen()
  return true
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

  RL_INFO(L["Reset MS Change Informations"])
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
    RL_INFO(L["Choose instance first"])
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
    RL_INFO(L["Not In Instance, so just toggle"])
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
  if RRI_AreTankersInRaid() < RLU_GetRequiredTanks() then
    RL_INFO(L["Please assign tanker with /mt /ma"])
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
    RL_INFO(L["Please choose the target"])
    return
  end

  RLF_Button_RaidWarning_OnClick(id)

  local playerName = UnitName("player")
  if id == "RL_BUTTON_SET_MT" then
    SetRaidTarget("target", 7);
    SendChatMessage(L["Please type /mt to assign MT"], "WHISPER", GetDefaultLanguage("player"), playerName)
    RL_INFO(L["Please type /mt to assign MT"])
  elseif id == "RL_BUTTON_SET_OT" then
    SetRaidTarget("target", 6);
    SendChatMessage(L["Please type /ma to assign OT"], "WHISPER", GetDefaultLanguage("player"), playerName)
    RL_INFO(L["Please type /ma to assign OT"])
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


-- not use
function RLF_Button_SetLeader_OnClick()
  if UnitInRaid("target") == nil then
    local RLL = RL_LoadRaidWarningData()
    RL_INFO(RLL["RL_BUTTON_SET_LEADER_MSG"]);
  else
    PromoteToLeader("target");
  end
end

function RLF_Button_Invite_OnClick()
  InviteUnit("target")
end


function RL_RaidZoneButton_OnClick(frame, arg1, arg2)
  -- can't hanle check mark at level 2
	--UIDropDownMenu_SetSelectedID(RaidLeader_Zone_DropDownMenu, frame:GetID())
  UIDROPDOWNMENU_SHOW_TIME = 1
  if RaidLeaderData.recruitInfo.zone ~= arg1 or RaidLeaderData.recruitInfo.sub ~= arg2 then    
    RL_Clear_MSChange_Info()
    RLF_Button_AutoFlood_OnClick("RL_BUTTON_FLOOD_OFF")

    RaidLeaderData.recruitInfo.zone   = arg1
    RaidLeaderData.recruitInfo.sub    = arg2
    RaidLeaderData.recruitInfo.zoneId = RLU_GetZoneId(arg1)
  
    UIDropDownMenu_SetText(RaidLeader_Zone_DropDownMenu, arg1 .. arg2)

    RL_Zone_Reflesh_GUI()
  end
end

function RLF_Button_SelectRaid_OnClick()
  UIDROPDOWNMENU_SHOW_TIME = 1
	ToggleDropDownMenu(1, nil, RaidLeader_Zone_DropDownMenu, self, 0, 0);
end

function RLF_Button_SelectRaid_Initialize(frame, level, menuList)
  UIDropDownMenu_SetWidth(RaidLeader_Zone_DropDownMenu, 110)  
  local raidZoneInfos = RLU_GetZoneInfos()
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
  local raidZoneInfos = RLU_GetZoneInfos()
  local r = RaidLeaderData.recruitInfo
  local isRaid  = UnitInRaid("player")
  local curr_size = isRaid and GetNumRaidMembers() or GetNumPartyMembers() + 1
  local raid_size= tonumber(string.sub(r.sub, 1, 2))
  local reqMembers = ""
  local reqRoles = ""

  if r.needHealer and r.needTanker and r.needDps then   reqRoles = "ALL"
  elseif r.needHealer and r.needDps then                reqRoles = "HEAL/DPS"
  elseif r.needTanker and r.needDps then                reqRoles = "TANK/DPS"
  elseif r.needTanker and r.needHealer then             reqRoles = "TANK/HEAL"
  elseif r.needTanker then                              reqRoles = "TANK"
  elseif r.needHealer then                              reqRoles = "HEAL"
  elseif r.needDps then                                 reqRoles = "DPS"    
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

-- My floodmsg Popup
function RL_Callback_Update_MyFloodMsg(...)
  local data = ...
  if data ~= nil then
    userFlood_messages = data

    SlashCmdList["AUTOFLOODSETMESSAGE"](userFlood_messages)

    if bAutoFloodOn == false then
      local globalChannelNum = RL_GetGlobalChannelNumber()
      SlashCmdList["AUTOFLOODSETCHANNEL"](globalChannelNum)
      SlashCmdList["AUTOFLOODSETRATE"](20)      
      SlashCmdList["AUTOFLOOD"]("on")
      RLF_ChangeButtonText(RL_BUTTON_FLOOD_ON, "ON")
    end      
    bAutoFloodOn = true
  end
end

function RL_GetMyFloodMsg()
  local raidfindMsg = _GetRaidFindMessage()
  RLF_OpenInputBox(L["Change Flood Msg"], L["Type your flood msg if you want"], raidfindMsg, RL_Callback_Update_MyFloodMsg)
end


-- JoinChannelByName does not work
function RLF_Button_AutoFlood_OnClick(id)
  if id == "RL_BUTTON_FLOOD_ON" then
    local globalChannelNum = RL_GetGlobalChannelNumber()
    if globalChannelNum == -1 then
      RL_INFO(L["WOW Error! Need to relog!"])
    elseif globalChannelNum == 0 then
      RL_INFO(L["Please join global channel and then try again"])
	  elseif RaidLeaderData.recruitInfo.zone == "" then
	    RL_INFO(L["Please choose the raid instance"])
    else
      RL_GetMyFloodMsg()      
    end
  else
    SlashCmdList["AUTOFLOOD"]("off")
    RLF_ChangeButtonText(RL_BUTTON_FLOOD_ON, "OFF")
    bAutoFloodOn = false
    userFlood_messages = ""
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
  elseif id == "RL_CHECKBUTTON_NEED_DPS" then
    RaidLeaderData.recruitInfo.needDps = (checked ~= nil)
	end
end

local dbmPulltime = 10
local function RL_Expire_DBM_Pull_Timer()
  local RLL = RL_LoadRaidWarningData()
  dbmPulltime = dbmPulltime - 1

  if dbmPulltime == 7 or dbmPulltime == 5 or dbmPulltime == 3 or dbmPulltime == 2 or dbmPulltime == 1 then
    RLF_RaidWarning(RLL.dbmPull:format(dbmPulltime))
  end

  if dbmPulltime == 0 then
    RLF_RaidWarning(RLL.dbmPullDone)
    RL_kill_timer(timerPull)
    wipe(timerPull)
    dbmPulltime = 10
    return true
  end
  return false
end

function RLF_Button_DBM_Pull_OnClick(id)
  if RaidLeaderData.useSDBM then
    timerPull = RL_set_timer(1, RL_Expire_DBM_Pull_Timer, true)
  else
    SlashCmdList["DEADLYBOSSMODS"]("pull 10")
  end
  RLF_Button_RaidWarning_OnClick(id)
end

function RLF_Button_Paladin_Buff_OnClick(id)
  if RRI_AreTankersInRaid() < RLU_GetRequiredTanks() then
    RL_INFO(L["Please assign tanker with /mt /ma"])
    return
  end

  -- Get raid info
  RRI_InitializeRaidRosterInfo()
  RRI_GetRaidRosterInfo()
  local buffMsg = Buff_Get_Paladin_Orders()
  RLF_Button_RaidWarning_OnClick(buffMsg)
end
