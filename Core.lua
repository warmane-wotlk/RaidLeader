local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

RaidLeaderData = {
	version     = "";
	useKorean   = false;
  useSDBM     = false;  
  instance    = { inside  = false, zone = "", sub = "" };
	recruitInfo = { zone = "", sub = "", zoneId = 0, gear = "5.0k+", needHealer = true, needTanker = true, needDps = true };
};



-- Northrend Raids
local raidZoneInfos = {
  { name = "TOC",    zoneId = 544, sub = {"10nm", "10hc", "25nm", "25hc"}, requiredTank = 2, resv = "<B+P+O Resv>", 
    weekly = "", achieve = "|cffffff00|Hachievement:3812:0700000000194F14:1:01:01:20:4294967295:0:0:0|h[십자군 사령관의 부름 (25인)]|h|r"},
  { name = "ICC",    zoneId = 605, sub = {"10nm", "10nm/hc", "10hc", "25nm", "25nm/hc", "25hc"}, requiredTank = 2, resv = "<B+P Resv>",
    weekly = "", achieve = "|cffffff00|Hachievement:4637:0700000000194F14:1:01:04:20:4294967295:0:0:0|h[영웅: 리치 왕의 몰락 (25인)]|h|r"},
  { name = "RS",     zoneId = 610, sub = {"10nm", "10hc", "25nm", "25hc"}, requiredTank = 2, resv = "Nothing Resv",
    weekly = "", achieve = "|cffffff00|Hachievement:4816:0700000000194F14:1:12:30:19:4294967295:0:0:0|h[영웅: 황혼의 파괴자 (25인)]|h|r"},
  { name = "VOA",    zoneId = 533, sub = {"10", "25"}, requiredTank = 2, resv = "", weekly = "", achieve = ""},
  { name = "NAXX",   zoneId = 536, sub = {"10", "25", "10 weekly", "25 weekly"}, requiredTank = 1, resv = "",
    weekly = "|cffffff00|Hquest:24580:80|h[Anub'Rekhan Must Die!]|h|r", 
    achieve = "|cffffff00|Hachievement:577:07000000003E75A3:1:12:31:19:4294967295:0:0:0|h[낙스라마스의 몰락 (25인)]|h|r"},
  { name = "OS",     zoneId = 532, sub = {"10", "25", "10 weekly", "25 weekly"}, requiredTank = 1, resv = "<Satchel Resv>" ,
    weekly = "|cffffff00|Hquest:24579:80|h[Sartharion Must Die!]|h|r", 
    achieve = "|cffffff00|Hachievement:2054:0700000000194F14:1:01:02:20:4294967295:0:0:0|h[황혼 지대 (25인)]|h|r"},
  { name = "ONYXIA", zoneId = 14,   sub = {"10", "25"}, requiredTank = 2, resv = "", weekly = "", 
    achieve = "|cffffff00|Hachievement:4397:07000000003E75A3:1:01:05:20:4294967295:0:0:0|h[오닉시아의 둥지 (25인)]|h|r"},
  { name = "ULDUAR", zoneId = 530, sub = {"10", "25"}, requiredTank = 2, resv = "", weekly = "", 
    achieve = "|cffffff00|Hachievement:2895:07000000003E75A3:1:01:05:20:4294967295:0:0:0|h[울두아르의 비밀 (25인)]|h|r"},
};

function RLU_GetZoneInfos()
  return raidZoneInfos
end

function RLU_GetZoneId(zoneName)
  for _,v in pairs(raidZoneInfos) do
    if v.name == zoneName then
      return v.zoneId
    end
  end
  return 0
end

function RLU_GetRequiredTanks()
  for _,v in pairs(raidZoneInfos) do
    if v.name == RaidLeaderData.recruitInfo.zone then
      return v.requiredTank
    end
  end
  return 1
end

function RLU_IsInstance()
  return RaidLeaderData.instance.inside
end

function RLU_SetIsInstance(yes)
  RaidLeaderData.instance.inside = yes
end

function RLU_GetCurrentInstanceInfo()
  return RaidLeaderData.instance.zone, RaidLeaderData.instance.sub
end

function RLU_CheckInstances(mapId)
  for _, v in ipairs(raidZoneInfos) do
    if v.zoneId == mapId then
      return true
    end
  end
  return false
end

local function _GetCurrentInstanceName(mapId)
  for _, v in ipairs(raidZoneInfos) do
    if v.zoneId == mapId then
      return v.name
    end
  end
  return nil
end

-- Utility --------------
function RLU_UpdateInstanceInfo()
  local _, instanceType, difficulty, _, _, playerDifficulty, isDynamicInstance = GetInstanceInfo()
  if instanceType == "raid" then
  
    RaidLeaderData.instance.inside = false
    RaidLeaderData.instance.zone = _GetCurrentInstanceName(GetCurrentMapAreaID())
    RaidLeaderData.instance.sub = "unknown"

    if difficulty == 1 or difficulty == 3 then -- 10 men
      RaidLeaderData.instance.inside = true
      if playerDifficulty == 0 then
        RaidLeaderData.instance.sub = "10nm"
      elseif playerDifficulty == 1 then
        RaidLeaderData.instance.sub = "10hc"
      else
        RaidLeaderData.instance.sub = "unknown"
      end
    elseif difficulty == 4 or difficulty == 2 then -- 25 men
      RaidLeaderData.instance.inside = true
      if playerDifficulty == 0 then
        RaidLeaderData.instance.sub = "25nm"
      elseif playerDifficulty == 1 then
        RaidLeaderData.instance.sub = "25hc"
      else
        RaidLeaderData.instance.sub = "unknown"
      end
    end
  end  
  --RL_INFO(tostring(RaidLeaderData.instance.zone).. RaidLeaderData.instance.sub)
end 

-- Zone Frame variable
RL_ZONE_INFOS = {}
RL_ZONE_TEXT_ENG = {}
RL_ZONE_TEXT_KOR = {}
RL_ZONE_MSG_ENG = {}
RL_ZONE_MSG_KOR = {}
RL_ZONE_TOOLTIP_ENG = {}
RL_ZONE_TOOLTIP_KOR = {}

function RL_Zone_Infos(zoneName)
	return RL_ZONE_INFOS[zoneName]
end

function RL_Zone_LoadButtonText(zoneName)
  if GetLocale() == "koKR" then
    return RL_ZONE_TEXT_KOR[zoneName]
  else
    return RL_ZONE_TEXT_ENG[zoneName]
  end
end


function RL_Zone_LoadRaidWarningData(zoneName)
  if RaidLeaderData.useKorean then
    return RL_ZONE_MSG_KOR[zoneName]
  else
    return RL_ZONE_MSG_ENG[zoneName]
  end
end

function RL_Zone_LoadRaidWarningTooltipData(zoneName)
  if RaidLeaderData.useKorean then
    return RL_ZONE_TOOLTIP_KOR[zoneName]
  else
    return RL_ZONE_TOOLTIP_ENG[zoneName]
  end
end


-- change button text
function RLF_Button_SetText_OnLoad(self, param)
  self:SetText(L[param])
end

-- utility
function RL_INFO(...) SELECTED_CHAT_FRAME:AddMessage('|cff0061ff[RL]: '..format(...)) end