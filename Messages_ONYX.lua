local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

RL_ZONE_ONYX_BOSS = { "READY", "HEAD" };

RL_ZONE_INFOS["ONYX"] = { 
	{ name = L["BOSS"], id = "RL_ZONE_ONYX_BOSS", commands = RL_ZONE_ONYX_BOSS };
};

RL_ZONE_TEXT_ENG["ONYX"] = {
	RL_ZONE_ONYX_BOSS_READY = "Ready";
	RL_ZONE_ONYX_BOSS_HEAD = "Head";
};

RL_ZONE_TEXT_KOR["ONYX"] = {
	RL_ZONE_ONYX_BOSS_READY = "전투준비";
	RL_ZONE_ONYX_BOSS_HEAD = "머리";
};


RL_ZONE_MSG_ENG["ONYX"] = {
	RL_ZONE_ONYX_BOSS_READY_MSG = "Listen Up! MT/OT stay together, others stack together under boss";
	RL_ZONE_ONYX_BOSS_HEAD_MSG = "Stack together under boss and DPS";
};

RL_ZONE_MSG_KOR["ONYX"] = {
	RL_ZONE_ONYX_BOSS_READY_MSG = "맨탱/부탱 같이 붙어서 있으시고, 나머지는 모두 보스밑에 모여서 공격해주세요.";
	RL_ZONE_ONYX_BOSS_HEAD_MSG = "모두 보스밑에 모여서 공격해주세요.";
};

local L = RL_ZONE_MSG_ENG["ONYX"]
RL_ZONE_TOOLTIP_ENG["ONYX"] = {
	RL_ZONE_ONYX_BOSS_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_ONYX_BOSS_READY_MSG"] .. "\'";
	RL_ZONE_ONYX_BOSS_HEAD_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_ONYX_BOSS_HEAD_MSG"] .. "\'";
};

L = RL_ZONE_MSG_KOR["ONYX"]
RL_ZONE_TOOLTIP_KOR["ONYX"] = {
	RL_ZONE_ONYX_BOSS_READY_TOOLTIP = "\'" .. L["RL_ZONE_ONYX_BOSS_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ONYX_BOSS_HEAD_TOOLTIP = "\'" .. L["RL_ZONE_ONYX_BOSS_HEAD_MSG"] .. "\' 를 공격대 경보한다.";
};



