local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

RL_ZONE_VOA_ICE = { "READY", "ADD" };
RL_ZONE_VOA_FLAME = { "READY", "FLAME"};
RL_ZONE_VOA_STORM = { "READY"};
RL_ZONE_VOA_STONE = { "READY"};


RL_ZONE_INFOS["VOA"] = { 
	{ name = L["Ice Watcher"], id = "RL_ZONE_VOA_ICE", commands = RL_ZONE_VOA_ICE };
	{ name = L["Flame Watcher"], id = "RL_ZONE_VOA_FLAME", commands = RL_ZONE_VOA_FLAME };
	{ name = L["Storm Watcher"], id = "RL_ZONE_VOA_STORM", commands = RL_ZONE_VOA_STORM };
	{ name = L["Stone Watcher"], id = "RL_ZONE_VOA_STONE", commands = RL_ZONE_VOA_STONE };
};

RL_ZONE_TEXT_ENG["VOA"] = {
	RL_ZONE_VOA_ICE_READY = "Ready";
	RL_ZONE_VOA_ICE_ADD = "dps ADD";
	RL_ZONE_VOA_FLAME_READY = "Ready";
	RL_ZONE_VOA_FLAME_FLAME = "Flame";
	RL_ZONE_VOA_STORM_READY = "Ready";
	RL_ZONE_VOA_STONE_READY = "Ready";
};

RL_ZONE_TEXT_KOR["VOA"] = {
	RL_ZONE_VOA_ICE_READY = "전투준비";
	RL_ZONE_VOA_ICE_ADD = "쫄 공격";
	RL_ZONE_VOA_FLAME_READY = "전투준비";
	RL_ZONE_VOA_FLAME_FLAME = "바닥 주의";
	RL_ZONE_VOA_STORM_READY = "전투준비";
	RL_ZONE_VOA_STONE_READY = "전투준비";
};


RL_ZONE_MSG_ENG["VOA"] = {
	RL_ZONE_VOA_ICE_READY_MSG = "Ready";
	RL_ZONE_VOA_ICE_ADD_MSG = "dps ADD";
	RL_ZONE_VOA_FLAME_READY_MSG = "Ready";
	RL_ZONE_VOA_FLAME_FLAME_MSG = "Evade Frame";
	RL_ZONE_VOA_STORM_READY_MSG = "Ready";
	RL_ZONE_VOA_STONE_READY_MSG = "Ready";
};

RL_ZONE_MSG_KOR["VOA"] = {
	RL_ZONE_VOA_ICE_READY_MSG = "전투준비";
	RL_ZONE_VOA_ICE_ADD_MSG = "쫄 공격";
	RL_ZONE_VOA_FLAME_READY_MSG = "Evade Flame";
	RL_ZONE_VOA_FLAME_FLAME_MSG = "Ready";
	RL_ZONE_VOA_STORM_READY_MSG = "전투준비";
	RL_ZONE_VOA_STONE_READY_MSG = "Ready";
};

local L = RL_ZONE_MSG_ENG["VOA"]
RL_ZONE_TOOLTIP_ENG["VOA"] = {
	RL_ZONE_VOA_ICE_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_VOA_ICE_READY_MSG"] .. "\'";
	RL_ZONE_VOA_ICE_ADD_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_VOA_ICE_ADD_MSG"] .. "\'";
	RL_ZONE_VOA_FLAME_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_VOA_FLAME_READY_MSG"] .. "\'";
	RL_ZONE_VOA_FLAME_FLAME_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_VOA_FLAME_FLAME_MSG"] .. "\'";
	RL_ZONE_VOA_STORM_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_VOA_STORM_READY_MSG"] .. "\'";
	RL_ZONE_VOA_STONE_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_VOA_STONE_READY_MSG"] .. "\'";

};

L = RL_ZONE_MSG_KOR["VOA"]
RL_ZONE_TOOLTIP_KOR["VOA"] = {
	RL_ZONE_VOA_ICE_READY_TOOLTIP = "\'" .. L["RL_ZONE_VOA_ICE_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_VOA_ICE_ADD_TOOLTIP = "\'" .. L["RL_ZONE_VOA_ICE_ADD_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_VOA_FLAME_READY_TOOLTIP = "\'" .. L["RL_ZONE_VOA_FLAME_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_VOA_FLAME_FLAME_TOOLTIP = "\'" .. L["RL_ZONE_VOA_FLAME_FLAME_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_VOA_STORM_READY_TOOLTIP = "\'" .. L["RL_ZONE_VOA_STORM_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_VOA_STONE_READY_TOOLTIP = "\'" .. L["RL_ZONE_VOA_STONE_READY_MSG"] .. "\' 를 공격대 경보한다.";
};



