local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

RL_ZONE_RS_BALTHARUS = { "READY", "AWAY", "CLONE" };
RL_ZONE_RS_SAVIANA = { "READY", "ENRAGE", "AWAY" };
RL_ZONE_RS_ZARITHRIAN = { "READY", "ADD" };
RL_ZONE_RS_HALION = { "READY", "MOVE", "DISPELL", "PORTAL", "STOP_DPS", "BOSS" };

RL_ZONE_INFOS["RS"] = { 
	{ name = L["Baltharus the Warborn"], id = "RL_ZONE_RS_BALTHARUS", commands = RL_ZONE_RS_BALTHARUS };
	{ name = L["Saviana Ragefire"], id = "RL_ZONE_RS_SAVIANA", commands = RL_ZONE_RS_SAVIANA };
	{ name = L["General Zarithrian"], id = "RL_ZONE_RS_ZARITHRIAN", commands = RL_ZONE_RS_ZARITHRIAN };	
	{ name = L["Halion"], id = "RL_ZONE_RS_HALION", commands = RL_ZONE_RS_HALION };
};

RL_ZONE_TEXT_ENG["RS"] = {
	RL_ZONE_RS_BALTHARUS_READY = "Ready";
	RL_ZONE_RS_BALTHARUS_AWAY = "Away";
	RL_ZONE_RS_BALTHARUS_CLONE = "DPS Clone";
	RL_ZONE_RS_SAVIANA_READY = "Ready";
	RL_ZONE_RS_SAVIANA_ENRAGE = "Enrage";
	RL_ZONE_RS_SAVIANA_AWAY = "Away";
	RL_ZONE_RS_ZARITHRIAN_READY = "Ready";
	RL_ZONE_RS_ZARITHRIAN_ADD = "Take Add";
	RL_ZONE_RS_HALION_READY = "Ready";
	RL_ZONE_RS_HALION_MOVE = "Move Opp";
	RL_ZONE_RS_HALION_DISPELL = "Move/Dispell";
	RL_ZONE_RS_HALION_PORTAL = "Portal";
	RL_ZONE_RS_HALION_STOP_DPS = "Inside No DPS";
	RL_ZONE_RS_HALION_BOSS = "DPS Boss";
};

RL_ZONE_TEXT_KOR["RS"] = {
	RL_ZONE_RS_BALTHARUS_READY = "전투준비";
	RL_ZONE_RS_BALTHARUS_AWAY = "멀리 벗어남";
	RL_ZONE_RS_BALTHARUS_CLONE = "복제 탱";
	RL_ZONE_RS_SAVIANA_READY = "전투준비";
	RL_ZONE_RS_SAVIANA_ENRAGE = "격노 해제";
	RL_ZONE_RS_SAVIANA_AWAY = "멀리 벗어남";
	RL_ZONE_RS_ZARITHRIAN_READY = "전투준비";
	RL_ZONE_RS_ZARITHRIAN_ADD = "쫄 탱";
	RL_ZONE_RS_HALION_READY = "전투준비";
	RL_ZONE_RS_HALION_MOVE = "반대로 이동";
	RL_ZONE_RS_HALION_DISPELL = "이동/해제";
	RL_ZONE_RS_HALION_PORTAL = "포탈 입장";
	RL_ZONE_RS_HALION_STOP_DPS = "내부 딜중지";
	RL_ZONE_RS_HALION_BOSS = "보스 딜";
};


RL_ZONE_MSG_ENG["RS"] = {
	RL_ZONE_RS_BALTHARUS_READY_MSG = "Guys, spread out from each raider. When you get the DEBUFF, be away from monster. OT should take the clone and All just dps on BOSS";
	RL_ZONE_RS_BALTHARUS_AWAY_MSG = "Whoever got the debuff, get away from any monster";
	RL_ZONE_RS_BALTHARUS_CLONE_MSG = "OT takes an aggro of Clone and be away from Baltharus";	
	RL_ZONE_RS_SAVIANA_READY_MSG = "RDPS/Healer take the longest distance from boss. Hunter/Rogue uses Tranquilizing Shot/Shiv when Saviana use enrage. Whoever got the debuff, get away from people";
	RL_ZONE_RS_SAVIANA_ENRAGE_MSG = "Hunter/Rogue, please clear the Enrage by Tranquilizing Shot/Shiv";
	RL_ZONE_RS_SAVIANA_AWAY_MSG = "Whoever got the debuff, get away from people";
	RL_ZONE_RS_ZARITHRIAN_READY_MSG = "MT takes BOSS and OT takes ADD.";
	RL_ZONE_RS_ZARITHRIAN_ADD_MSG = "OT, take an aggro on ADD and bring them to Boss";
	RL_ZONE_RS_HALION_READY_MSG = "It has 3 phases and Whoever got the Mark of Consumption(1Phase)/Soul Consumption(2Phase) moves to the edge and then Priest/Mage/Shammy, dispell him";
	RL_ZONE_RS_HALION_MOVE_MSG = "Move to the opposite";
	RL_ZONE_RS_HALION_DISPELL_MSG = "Whoever got the Mark of Consumption(1Phase)/Soul Consumption(2Phase) moves to the edge and then Priest/Mage/Shammy, dispell him";
	RL_ZONE_RS_HALION_PORTAL_MSG = "In Phase1, ALL get into the portal, in Phase2, Inner team stay there and Outer team get out.";
	RL_ZONE_RS_HALION_STOP_DPS_MSG = "Don't dps BOSS inside";
	RL_ZONE_RS_HALION_BOSS_MSG = "DPS BOSS Again";	
};

RL_ZONE_MSG_KOR["RS"] = {
	RL_ZONE_RS_BALTHARUS_READY_MSG = "공대원들은 각자 거리를 벌리고 탱/딜/힐하세요. 디버프에 걸린 대상은 재빠르게 몹으로부터 멀리 떨어져서, 딜(원거리)/힐 해주세요.\n부탱이 바로 분신 도발하여 본체로부터 떨어지게 하고, 모두 본체만 공격해주세요.";
	RL_ZONE_RS_BALTHARUS_AWAY_MSG = "디버프 걸리신분, 몹으로부터 벗어나서 멀리 떨어져서, 원딜/힐 해주세요.";
	RL_ZONE_RS_BALTHARUS_CLONE_MSG = "부탱님, 복제된 몹 어글 잡아서 보스(발타루스)에게서 멀리 떨어지세요.";	
	RL_ZONE_RS_SAVIANA_READY_MSG = "원거리 딜러+힐러는 최대 사거리를 유지하면서 딜/힐을 해야 합니다. 일정 시간 후에 레이지파이어는 격노(광폭화류)를 합니다. 낭꾼은 평정사격을 해주시고, 탱커는 생존기 사용하세요.\n페이지파이어가 공중에 떠있을때 임의의 공대원 대상(다수)에게 화염계열의 디버프를 걸게 됩니다. 디버프에 걸린 대상자는 재빠르게 공대진영으로부터 멀리 떨어져야 합니다";
	RL_ZONE_RS_SAVIANA_ENRAGE_MSG = "낭꾼님, 평정사격으로 격노 해제해주세요.";
	RL_ZONE_RS_SAVIANA_AWAY_MSG = "디버프 걸리신분, 무리에서 벗어나서 멀리 떨어지세요.";
	RL_ZONE_RS_ZARITHRIAN_READY_MSG = "맨탱님이 보스잡고, 부탱님이 쫄 잡으면 됩니다.";
	RL_ZONE_RS_ZARITHRIAN_ADD_MSG = "부탱님, 잡몹 어글잡아 보스쪽으로 이동해주시고, 딜러들 광딜해주세요.";
	RL_ZONE_RS_HALION_READY_MSG = "3페이즈로 구성되며, 연소의 징표(1페이즈)/영혼 소진(2페이즈) 대상자는 최대한 외곽으로 가시고, 사제님/법사님/주술님, 마법/저주 해제해주세요.";
	RL_ZONE_RS_HALION_MOVE_MSG = "신속히 반대편으로 이동하세요.";
	RL_ZONE_RS_HALION_DISPELL_MSG = "연소의 징표(1페이즈)/영혼 소진(2페이즈) 대상자는 최대한 외곽으로 가시고, 사제님/법사님/주술님, 마법/저주 해제해주세요.";
	RL_ZONE_RS_HALION_PORTAL_MSG = "1페이즈에서는 모두 포탈로 들어가세요. 2페이즈에서는 내부조는 그대로, 외부조는 밖으로 나가세요.";
	RL_ZONE_RS_HALION_STOP_DPS_MSG = "내부조, 보스 공격 중지해주세요.";
	RL_ZONE_RS_HALION_BOSS_MSG = "보스 공격해주세요.";	
};

local L = RL_ZONE_MSG_ENG["RS"]
RL_ZONE_TOOLTIP_ENG["RS"] = {
	RL_ZONE_RS_BALTHARUS_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_BALTHARUS_READY_MSG"] .. "\'";
	RL_ZONE_RS_BALTHARUS_AWAY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_BALTHARUS_AWAY_MSG"] .. "\'";
	RL_ZONE_RS_BALTHARUS_CLONE_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_BALTHARUS_CLONE_MSG"] .. "\'";
	RL_ZONE_RS_SAVIANA_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_SAVIANA_READY_MSG"] .. "\'";
	RL_ZONE_RS_SAVIANA_ENRAGE_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_SAVIANA_ENRAGE_MSG"] .. "\'";
	RL_ZONE_RS_SAVIANA_AWAY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_SAVIANA_AWAY_MSG"] .. "\'";
	RL_ZONE_RS_ZARITHRIAN_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_ZARITHRIAN_READY_MSG"] .. "\'";	
	RL_ZONE_RS_ZARITHRIAN_ADD_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_ZARITHRIAN_ADD_MSG"] .. "\'";
	RL_ZONE_RS_HALION_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_HALION_READY_MSG"] .. "\'";
	RL_ZONE_RS_HALION_MOVE_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_HALION_MOVE_MSG"] .. "\'";
	RL_ZONE_RS_HALION_DISPELL_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_HALION_DISPELL_MSG"] .. "\'";
	RL_ZONE_RS_HALION_PORTAL_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_HALION_PORTAL_MSG"] .. "\'";
	RL_ZONE_RS_HALION_STOP_DPS_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_HALION_STOP_DPS_MSG"] .. "\'";
	RL_ZONE_RS_HALION_BOSS_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_RS_HALION_BOSS_MSG"] .. "\'";
};

L = RL_ZONE_MSG_KOR["RS"]
RL_ZONE_TOOLTIP_KOR["RS"] = {
	RL_ZONE_RS_BALTHARUS_READY_TOOLTIP = "\'" .. L["RL_ZONE_RS_BALTHARUS_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_BALTHARUS_AWAY_TOOLTIP = "\'" .. L["RL_ZONE_RS_BALTHARUS_AWAY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_BALTHARUS_CLONE_TOOLTIP = "\'" .. L["RL_ZONE_RS_BALTHARUS_CLONE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_SAVIANA_READY_TOOLTIP = "\'" .. L["RL_ZONE_RS_SAVIANA_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_SAVIANA_ENRAGE_TOOLTIP = "\'" .. L["RL_ZONE_RS_SAVIANA_ENRAGE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_SAVIANA_AWAY_TOOLTIP = "\'" .. L["RL_ZONE_RS_SAVIANA_AWAY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_ZARITHRIAN_READY_TOOLTIP = "\'" .. L["RL_ZONE_RS_ZARITHRIAN_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_ZARITHRIAN_ADD_TOOLTIP = "\'" .. L["RL_ZONE_RS_ZARITHRIAN_ADD_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_HALION_READY_TOOLTIP = "\'" .. L["RL_ZONE_RS_HALION_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_HALION_MOVE_TOOLTIP = "\'" .. L["RL_ZONE_RS_HALION_MOVE_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_RS_HALION_DISPELL_TOOLTIP = "\'" .. L["RL_ZONE_RS_HALION_DISPELL_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_HALION_PORTAL_TOOLTIP = "\'" .. L["RL_ZONE_RS_HALION_PORTAL_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_HALION_STOP_DPS_TOOLTIP = "\'" .. L["RL_ZONE_RS_HALION_STOP_DPS_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_RS_HALION_BOSS_TOOLTIP = "\'" .. L["RL_ZONE_RS_HALION_BOSS_MSG"] .. "\' 를 공격대 경보한다.";
};



