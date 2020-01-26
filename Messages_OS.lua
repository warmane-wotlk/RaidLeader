local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

RL_ZONE_OS_DRAKE = { "READY", "DRAKE", "PORTAL", "CURSE", "FLAME" };


RL_ZONE_INFOS["OS"] = { 
	{ name = L["ALL"], id = "RL_ZONE_OS_DRAKE", commands = RL_ZONE_OS_DRAKE };
};

RL_ZONE_TEXT_ENG["OS"] = {
	RL_ZONE_OS_DRAKE_READY = "READY";
	RL_ZONE_OS_DRAKE_DRAKE = "Dps DRAKE";
	RL_ZONE_OS_DRAKE_PORTAL = "in Portal";
	RL_ZONE_OS_DRAKE_CURSE = "Cure Curse";
	RL_ZONE_OS_DRAKE_FLAME = "Flame";
};

RL_ZONE_TEXT_KOR["OS"] = {
	RL_ZONE_OS_DRAKE_READY = "전투준비";
	RL_ZONE_OS_DRAKE_DRAKE = "딜 보스";
	RL_ZONE_OS_DRAKE_PORTAL = "포탈 입장";
	RL_ZONE_OS_DRAKE_CURSE = "저주해제";
	RL_ZONE_OS_DRAKE_FLAME = "화염피해";
};


local CL = RL_LoadRaidWarningData()
RL_ZONE_MSG_ENG["OS"] = {
	RL_ZONE_OS_DRAKE_READY_MSG = "Start to Nuke BOSS. Mage/Druid please focuse on curing curse. All move faster";
	RL_ZONE_OS_DRAKE_DRAKE_MSG = "Not get into the Portal, Just DPS Drake !!!";
	RL_ZONE_OS_DRAKE_PORTAL_MSG = "ALL Get into the Portal except Tanker and clear the Mob there.";
	RL_ZONE_OS_DRAKE_CURSE_MSG = CL["RL_BUTTON_CURE_CURSE_MSG"];
	RL_ZONE_OS_DRAKE_FLAME_MSG = "Evade Flame!!";
};

RL_ZONE_MSG_KOR["OS"] = {
	RL_ZONE_OS_DRAKE_READY_MSG = "레이드 시작합니다. 법사님/드루님-저주해제 바로바로 해주세요. 집중하고 빠르게 이동해주세요.";
	RL_ZONE_OS_DRAKE_DRAKE_MSG = "드레이크(용) 그냥 잡습니다. 포탈 들어가지 마세요.";
	RL_ZONE_OS_DRAKE_PORTAL_MSG = "탱커를 제외하고, 모두 포탈안으로 들어가서 몹 잡아주세요.";
	RL_ZONE_OS_DRAKE_CURSE_MSG = CL["RL_BUTTON_CURE_CURSE_MSG"];
	RL_ZONE_OS_DRAKE_FLAME_MSG = "화염 피해주세요.";

};

local TL = RL_LoadRaidWarningTooltipData()
local L = RL_ZONE_MSG_ENG["OS"]
RL_ZONE_TOOLTIP_ENG["OS"] = {
	RL_ZONE_OS_DRAKE_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_OS_DRAKE_READY_MSG"] .. "\'";
	RL_ZONE_OS_DRAKE_DRAKE_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_OS_DRAKE_DRAKE_MSG"] .. "\'";
	RL_ZONE_OS_DRAKE_PORTAL_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_OS_DRAKE_PORTAL_MSG"] .. "\'";
	RL_ZONE_OS_DRAKE_CURSE_TOOLTIP = TL["RL_ZONE_OS_DRAKE_CURSE_TOOLTIP"];
	RL_ZONE_OS_DRAKE_FLAME_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_OS_DRAKE_FLAME_MSG"] .. "\'";
};

L = RL_ZONE_MSG_KOR["OS"]
	RL_ZONE_TOOLTIP_KOR["OS"] = {
	RL_ZONE_OS_DRAKE_READY_TOOLTIP = "\'" .. L["RL_ZONE_OS_DRAKE_READY_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_OS_DRAKE_DRAKE_TOOLTIP = "\'" .. L["RL_ZONE_OS_DRAKE_DRAKE_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_OS_DRAKE_PORTAL_TOOLTIP = "\'" .. L["RL_ZONE_OS_DRAKE_PORTAL_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_OS_DRAKE_CURSE_TOOLTIP = TL["RL_ZONE_OS_DRAKE_CURSE_TOOLTIP"];
	RL_ZONE_OS_DRAKE_FLAME_TOOLTIP = "\'" .. L["RL_ZONE_OS_DRAKE_FLAME_MSG"] .. "\' 를 공격대 경보한다.";	
};



