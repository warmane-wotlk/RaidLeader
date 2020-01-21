
RL_ZONE_TOC_MARROWGAR = { "READY", "STACK" };
RL_ZONE_TOC_LADY = { "READY", "SPIRIT", "DARNAVAN"};
RL_ZONE_TOC_GUNSHIP = { "READY", "JUMP", "WAIT", "AGGRO" };
RL_ZONE_TOC_DEATHBRINGER = { "READY", "STACK" };
RL_ZONE_TOC_FESTERGUT = { "READY", "STACK" };
RL_ZONE_TOC_ROTFACE = { "READY", "STACK" };
RL_ZONE_TOC_PROFESSOR = { "READY", "STACK" };
RL_ZONE_TOC_COUNCIL = { "READY", "STACK" };
RL_ZONE_TOC_BLOODQUEEN = { "READY", "STACK" };
RL_ZONE_TOC_DREAMWALKER = { "READY", "STACK" };
RL_ZONE_TOC_SINDRAGOSA = { "READY", "STACK" };
RL_ZONE_TOC_LICHKING = { "READY", "STACK" };

RL_ZONE_TOC_INFO = { 
	{ name = "Marrowgar", id = "RL_ZONE_TOC_MARROWGAR", commands = RL_ZONE_TOC_MARROWGAR };
	{ name = "Lady", id = "RL_ZONE_TOC_LADY", commands = RL_ZONE_TOC_LADY };
	{ name = "GunShip", id = "RL_ZONE_TOC_GUNSHIP", commands = RL_ZONE_TOC_GUNSHIP };
	{ name = "DeathBringer", id = "RL_ZONE_TOC_DEATHBRINGER", commands = RL_ZONE_TOC_DEATHBRINGER };
	{ name = "Festergut", id = "RL_ZONE_TOC_FESTERGUT", commands = RL_ZONE_TOC_FESTERGUT };
	{ name = "Rotface", id = "RL_ZONE_TOC_ROTFACE", commands = RL_ZONE_TOC_ROTFACE };
	{ name = "Professor", id = "RL_ZONE_TOC_PROFESSOR", commands = RL_ZONE_TOC_PROFESSOR };
	{ name = "Council", id = "RL_ZONE_TOC_COUNCIL", commands = RL_ZONE_TOC_COUNCIL };
	{ name = "BloodQueen", id = "RL_ZONE_TOC_BLOODQUEEN", commands = RL_ZONE_TOC_BLOODQUEEN };
	{ name = "Dreamwalker", id = "RL_ZONE_TOC_DREAMWALKER", commands = RL_ZONE_TOC_DREAMWALKER };
	{ name = "Sindragosa", id = "RL_ZONE_TOC_SINDRAGOSA", commands = RL_ZONE_TOC_SINDRAGOSA };
	{ name = "Lich King", id = "RL_ZONE_TOC_LICHKING", commands = RL_ZONE_TOC_LICHKING };
};

RL_ZONE_TEXT_ENG = {
	RL_ZONE_TOC_MARROWGAR_READY = "Ready";
	RL_ZONE_TOC_MARROWGAR_STACK = "Stack";
	RL_ZONE_TOC_LADY_READY = "Ready";
	RL_ZONE_TOC_LADY_SPIRIT = "Spirit";
	RL_ZONE_TOC_LADY_DARNAVAN = "Darnavan";
	RL_ZONE_TOC_GUNSHIP_READY = "Ready";
	RL_ZONE_TOC_GUNSHIP_JUMP = "Jump";
	RL_ZONE_TOC_GUNSHIP_WAIT = "Wait";
	RL_ZONE_TOC_GUNSHIP_AGGRO = "Aggro";
};

RL_ZONE_TEXT_KOR = {
	RL_ZONE_TOC_MARROWGAR_READY = "Ready";
	RL_ZONE_TOC_MARROWGAR_STACK = "Stack";
	RL_ZONE_TOC_LADY_READY = "Ready";
	RL_ZONE_TOC_LADY_SPIRIT = "Spirit";
	RL_ZONE_TOC_LADY_DARNAVAN = "Darnavan";
	RL_ZONE_TOC_GUNSHIP_READY = "Ready";
	RL_ZONE_TOC_GUNSHIP_JUMP = "Jump";
	RL_ZONE_TOC_GUNSHIP_WAIT = "Wait";
	RL_ZONE_TOC_GUNSHIP_AGGRO = "Aggro";
};


RL_ZONE_MSG_ENG = {
	RL_ZONE_TOC_MARROWGAR_READY_MSG = "Listen Up! MT/OT stay together, others stack together under boss";
	RL_ZONE_TOC_MARROWGAR_STACK_MSG = "Stack together under boss and DPS";
	RL_ZONE_TOC_LADY_READY_MSG = "Ready for lady";
	RL_ZONE_TOC_LADY_SPIRIT_MSG = "Evade Spirit";
	RL_ZONE_TOC_LADY_DARNAVAN_MSG = "Mage/Priest - take Darnavan and, dont dps Darnavan";
	RL_ZONE_TOC_GUNSHIP_READY_MSG = "Ready at gunship";
	RL_ZONE_TOC_GUNSHIP_JUMP_MSG = "Everyone Jump from left";
	RL_ZONE_TOC_GUNSHIP_WAIT_MSG = "Don't jump yet, Wait";
	RL_ZONE_TOC_GUNSHIP_AGGRO_MSG = "Tank at ship takes Aggro";
};

RL_ZONE_MSG_KOR = {
	RL_ZONE_TOC_MARROWGAR_READY_MSG = "맨탱/부탱 같이 붙어서 있으시고, 나머지는 모두 보스밑에 모여서 공격해주세요.";
	RL_ZONE_TOC_MARROWGAR_STACK_MSG = "모두 보스밑에 모여서 공격해주세요.";
	RL_ZONE_TOC_LADY_READY_MSG = "여교주 갑니다.";
	RL_ZONE_TOC_LADY_SPIRIT_MSG = "새우!! 새우!!! 피해주세요.";
	RL_ZONE_TOC_LADY_DARNAVAN_MSG = "법사님/사제님 - 다르나반 양변/정배해주세요. 다르나반 공격하지 마세요.";
	RL_ZONE_TOC_GUNSHIP_READY_MSG = "건쉽 갑니다.";
	RL_ZONE_TOC_GUNSHIP_JUMP_MSG = "모두 배의 왼쪽으로 해서 점프하세요.";
	RL_ZONE_TOC_GUNSHIP_WAIT_MSG = "아직 점프하지 마세요!!!";
	RL_ZONE_TOC_GUNSHIP_AGGRO_MSG = "배에 있는 탱커님 어글 잡아주세요.";	
};

local L = RL_ZONE_MSG_ENG
RL_ZONE_TOOLTIP_ENG = {
	RL_ZONE_TOC_MARROWGAR_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_MARROWGAR_READY_MSG"] .. "\'";
	RL_ZONE_TOC_MARROWGAR_STACK_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_MARROWGAR_STACK_MSG"] .. "\'";
	RL_ZONE_TOC_LADY_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_LADY_READY_MSG"] .. "\'";
	RL_ZONE_TOC_LADY_SPIRIT_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_LADY_SPIRIT_MSG"] .. "\'";
	RL_ZONE_TOC_LADY_DARNAVAN_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_LADY_DARNAVAN_MSG"] .. "\'";
	RL_ZONE_TOC_GUNSHIP_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_GUNSHIP_READY_MSG"] .. "\'";
	RL_ZONE_TOC_GUNSHIP_JUMP_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_GUNSHIP_JUMP_MSG"] .. "\'";
	RL_ZONE_TOC_GUNSHIP_WAIT_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_GUNSHIP_WAIT_MSG"] .. "\'";
	RL_ZONE_TOC_GUNSHIP_AGGRO_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_GUNSHIP_AGGRO_MSG"] .. "\'";	
};

L = RL_ZONE_MSG_KOR
RL_ZONE_TOOLTIP_KOR = {
	RL_ZONE_TOC_MARROWGAR_READY_TOOLTIP = "\'" .. L["RL_ZONE_TOC_MARROWGAR_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_MARROWGAR_STACK_TOOLTIP = "\'" .. L["RL_ZONE_TOC_MARROWGAR_STACK_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_LADY_READY_TOOLTIP = "\'" .. L["RL_ZONE_TOC_LADY_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_LADY_SPIRIT_TOOLTIP = "\'" .. L["RL_ZONE_TOC_LADY_SPIRIT_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_LADY_DARNAVAN_TOOLTIP= "\'" .. L["RL_ZONE_TOC_LADY_DARNAVAN_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_GUNSHIP_READY_TOOLTIP = "\'" .. L["RL_ZONE_TOC_GUNSHIP_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_GUNSHIP_JUMP_TOOLTIP = "\'" .. L["RL_ZONE_TOC_GUNSHIP_JUMP_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_GUNSHIP_WAIT_TOOLTIP = "\'" .. L["RL_ZONE_TOC_GUNSHIP_WAIT_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_GUNSHIP_AGGRO_TOOLTIP = "\'" .. L["RL_ZONE_TOC_GUNSHIP_AGGRO_MSG"] .. "\' 를 공격대 경보한다.";	
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

