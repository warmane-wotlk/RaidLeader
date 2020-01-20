
RL_ZONE_ICC_MARROWGAR = { "READY", "STACK" };
RL_ZONE_ICC_LADY = { "READY", "STACK" };
RL_ZONE_ICC_GUNSHIP = { "READY", "STACK" };
RL_ZONE_ICC_DEATHBRINGER = { "READY", "STACK" };
RL_ZONE_ICC_FESTERGUT = { "READY", "STACK" };
RL_ZONE_ICC_ROTFACE = { "READY", "STACK" };
RL_ZONE_ICC_PROFESSOR = { "READY", "STACK" };
RL_ZONE_ICC_COUNCIL = { "READY", "STACK" };
RL_ZONE_ICC_BLOODQUEEN = { "READY", "STACK" };
RL_ZONE_ICC_DREAMWALKER = { "READY", "STACK" };
RL_ZONE_ICC_SINDRAGOSA = { "READY", "STACK" };
RL_ZONE_ICC_LICHKING = { "READY", "STACK" };

RL_ZONE_ICC_INFO = { 
	{ name = "Marrowgar", id = "RL_ZONE_ICC_MARROWGAR", commands = RL_ZONE_ICC_MARROWGAR };
	{ name = "Lady", id = "RL_ZONE_ICC_LADY", commands = RL_ZONE_ICC_LADY };
	{ name = "GunShip", id = "RL_ZONE_ICC_GUNSHIP", commands = RL_ZONE_ICC_GUNSHIP };
	{ name = "DeathBringer", id = "RL_ZONE_ICC_DEATHBRINGER", commands = RL_ZONE_ICC_DEATHBRINGER };
	{ name = "Festergut", id = "RL_ZONE_ICC_FESTERGUT", commands = RL_ZONE_ICC_FESTERGUT };
	{ name = "Rotface", id = "RL_ZONE_ICC_ROTFACE", commands = RL_ZONE_ICC_ROTFACE };
	{ name = "Professor", id = "RL_ZONE_ICC_PROFESSOR", commands = RL_ZONE_ICC_PROFESSOR };
	{ name = "Council", id = "RL_ZONE_ICC_COUNCIL", commands = RL_ZONE_ICC_COUNCIL };
	{ name = "BloodQueen", id = "RL_ZONE_ICC_BLOODQUEEN", commands = RL_ZONE_ICC_BLOODQUEEN };
	{ name = "Dreamwalker", id = "RL_ZONE_ICC_DREAMWALKER", commands = RL_ZONE_ICC_DREAMWALKER };
	{ name = "Sindragosa", id = "RL_ZONE_ICC_SINDRAGOSA", commands = RL_ZONE_ICC_SINDRAGOSA };
	{ name = "Lich King", id = "RL_ZONE_ICC_LICHKING", commands = RL_ZONE_ICC_LICHKING };
};

RL_ZONE_TEXT_ENG = {
	RL_ZONE_ICC_MARROWGAR_READY = "Ready";
	RL_ZONE_ICC_MARROWGAR_STACK = "Stack";
};

RL_ZONE_TEXT_KOR = {
	RL_ZONE_ICC_MARROWGAR_READY = "준비";
	RL_ZONE_ICC_MARROWGAR_STACK = "뭉치기";
};


RL_ZONE_MSG_ENG = {
	RL_ZONE_ICC_MARROWGAR_READY_MSG = "Listen Up! MT/OT stay together, others stack together under boss";
	RL_ZONE_ICC_MARROWGAR_STACK_MSG = "Stack together under boss and DPS";
};

RL_ZONE_MSG_KOR = {
	RL_ZONE_ICC_MARROWGAR_READY_MSG = "맨탱/부탱 같이 붙어서 있으시고, 나머지는 모두 보스밑에 모여서 공격해주세요.";
	RL_ZONE_ICC_MARROWGAR_STACK_MSG = "모두 보스밑에 모여서 공격해주세요.";
};

local L = RL_ZONE_MSG_ENG
RL_ZONE_TOOLTIP_ENG = {
	RL_ZONE_ICC_MARROWGAR_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_ICC_MARROWGAR_READY_MSG"] .. "\'";
	RL_ZONE_ICC_MARROWGAR_STACK_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_ICC_MARROWGAR_STACK_MSG"] .. "\'";
};

L = RL_ZONE_MSG_KOR
RL_ZONE_TOOLTIP_KOR = {
	RL_ZONE_ICC_MARROWGAR_READY_TOOLTIP = "\'" .. L["RL_ZONE_ICC_MARROWGAR_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_MARROWGAR_STACK_TOOLTIP = "\'" .. L["RL_ZONE_ICC_MARROWGAR_STACK_MSG"] .. "\' 를 공격대 경보한다.";
};

function RL_Zone_LoadButtonText()
  if GetLocale() == "koKR" then
    return RL_ZONE_TEXT_KOR
  else
    return RL_ZONE_TEXT_ENG
  end
end


function RL_Zone_LoadRaidWarningData()
  if RaidLeaderData.useKorean then
    return RL_ZONE_MSG_KOR
  else
    return RL_ZONE_MSG_ENG
  end
end

function RL_Zone_LoadRaidWarningTooltipData()
  if RaidLeaderData.useKorean then
    return RL_ZONE_TOOLTIP_KOR
  else
    return RL_ZONE_TOOLTIP_ENG
  end
end

