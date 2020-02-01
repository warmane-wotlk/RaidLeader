local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

RaidLeaderData = {
	version     = "v0.7";
	useKorean   = false;
  useSDBM     = false;
	recruitInfo = { zone = "", sub = "", gear = "5.0k+", needHealer = true, needTanker = true };
};

-- Utility --------------
function RLU_GetDifficulty()
  local _, instanceType, difficulty, _, _, playerDifficulty, isDynamicInstance = GetInstanceInfo()
  if difficulty == 1 then -- 10 men
    return playerDifficulty == 0 and "normal10" or playerDifficulty == 1 and "heroic10" or "unknown"
  elseif difficulty == 2 then -- 25 men
    return playerDifficulty == 0 and "normal25" or playerDifficulty == 1 and "heroic25" or "unknown"
  end
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

-- utility
function printf(...) SELECTED_CHAT_FRAME:AddMessage('|cff0061ff[RaidLeader]: '..format(...)) end