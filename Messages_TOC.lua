local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

RL_ZONE_TOC_NORTHREND = { "READY", "FLAME", "AGGRO", "HEAD", "POISON", "MOVE", "ENRAGE" };
RL_ZONE_TOC_JARAXXUS = { "READY", "CUT_SPEEL", "FLAME", "OVERHEAL", "ADD"};
RL_ZONE_TOC_CHAMPIONS = { "READY", "DISPELL", "DPS"};
RL_ZONE_TOC_TWIN = { "READY", "LIGHT", "DARK"};
RL_ZONE_TOC_ANUBARAK = { "READY", "ICE", "INTERRUPT", "ADD", "STOP_HEAL", "DPS"};

RL_ZONE_INFOS["TOC"] = { 
	{ name = L["Northrend Beasts"], id = "RL_ZONE_TOC_NORTHREND", commands = RL_ZONE_TOC_NORTHREND };
	{ name = L["Lord Jaraxxus"], id = "RL_ZONE_TOC_JARAXXUS", commands = RL_ZONE_TOC_JARAXXUS };
	{ name = L["Champions"], id = "RL_ZONE_TOC_CHAMPIONS", commands = RL_ZONE_TOC_CHAMPIONS };
	{ name = L["Twin Val\'kyr"], id = "RL_ZONE_TOC_TWIN", commands = RL_ZONE_TOC_TWIN };
	{ name = L["Anub\'arak"], id = "RL_ZONE_TOC_ANUBARAK", commands = RL_ZONE_TOC_ANUBARAK };
};

RL_ZONE_TEXT_ENG["TOC"] = {
	RL_ZONE_TOC_NORTHREND_READY = "Ready";
	RL_ZONE_TOC_NORTHREND_FLAME = "Flame";
	RL_ZONE_TOC_NORTHREND_AGGRO = "Rot. Aggro";
	RL_ZONE_TOC_NORTHREND_HEAD = "Boss Head";
	RL_ZONE_TOC_NORTHREND_POISON = "Poison";
	RL_ZONE_TOC_NORTHREND_MOVE = "Move";
	RL_ZONE_TOC_NORTHREND_ENRAGE = "Enrage";

	RL_ZONE_TOC_JARAXXUS_READY = "Ready";
	RL_ZONE_TOC_JARAXXUS_CUT_SPEEL = "Cut Spell";
	RL_ZONE_TOC_JARAXXUS_FLAME = "Flame";
	RL_ZONE_TOC_JARAXXUS_OVERHEAL = "OverHeal";
	RL_ZONE_TOC_JARAXXUS_ADD = "Aggro ADD";

	RL_ZONE_TOC_CHAMPIONS_READY = "Ready";
	RL_ZONE_TOC_CHAMPIONS_DISPELL = "Dispell";
	RL_ZONE_TOC_CHAMPIONS_DPS = "DSP Mark";

	RL_ZONE_TOC_TWIN_READY = "Ready";
	RL_ZONE_TOC_TWIN_LIGHT = "Light";
	RL_ZONE_TOC_TWIN_DARK  = "Dark";

	RL_ZONE_TOC_ANUBARAK_READY = "Ready";
	RL_ZONE_TOC_ANUBARAK_ICE = "Ice";
	RL_ZONE_TOC_ANUBARAK_INTERRUPT = "Cut Spell";
	RL_ZONE_TOC_ANUBARAK_ADD = "Aggro ADD";
	RL_ZONE_TOC_ANUBARAK_STOP_HEAL = "Stop Heal";
	RL_ZONE_TOC_ANUBARAK_DPS = "DPS";
};

RL_ZONE_TEXT_KOR["TOC"] = {
	RL_ZONE_TOC_NORTHREND_READY = "전투준비";
	RL_ZONE_TOC_NORTHREND_FLAME = "바닥";
	RL_ZONE_TOC_NORTHREND_AGGRO = "어글교환";
	RL_ZONE_TOC_NORTHREND_HEAD = "보스머리";
	RL_ZONE_TOC_NORTHREND_POISON = "독해제";
	RL_ZONE_TOC_NORTHREND_MOVE = "이동";
	RL_ZONE_TOC_NORTHREND_ENRAGE = "격노해제";

	RL_ZONE_TOC_JARAXXUS_READY = "전투준비";
	RL_ZONE_TOC_JARAXXUS_CUT_SPEEL = "화염구차단";
	RL_ZONE_TOC_JARAXXUS_FLAME = "바닥";
	RL_ZONE_TOC_JARAXXUS_OVERHEAL = "오버힐";	
	RL_ZONE_TOC_JARAXXUS_ADD = "탱 여군주";

	RL_ZONE_TOC_CHAMPIONS_READY = "전투준비";
	RL_ZONE_TOC_CHAMPIONS_DISPELL = "해제/차단";
	RL_ZONE_TOC_CHAMPIONS_DPS = "해골 공격";

	RL_ZONE_TOC_TWIN_READY = "전투준비";
	RL_ZONE_TOC_TWIN_LIGHT = "빛 속성";
	RL_ZONE_TOC_TWIN_DARK  = "어둠 속성";

	RL_ZONE_TOC_ANUBARAK_READY = "전투준비";
	RL_ZONE_TOC_ANUBARAK_ICE = "동토처리";
	RL_ZONE_TOC_ANUBARAK_INTERRUPT = "스킬차단";
	RL_ZONE_TOC_ANUBARAK_ADD = "쫄 어글";
	RL_ZONE_TOC_ANUBARAK_STOP_HEAL = "힐 조심";
	RL_ZONE_TOC_ANUBARAK_DPS = "극딜";
};


RL_ZONE_MSG_ENG["TOC"] = {
	RL_ZONE_TOC_NORTHREND_READY_MSG = "In 1st boss, don\'t stand on the flame. In 2nd boss, attack the Acidmaw first. Whoever gets the Paralytic Toxin move to the tanker having Burning Bile. In 3rd boss, please evade from boss's rush";
	RL_ZONE_TOC_NORTHREND_FLAME_MSG = "Don\'t stand on the flame";
	RL_ZONE_TOC_NORTHREND_AGGRO_MSG = "Tankers, change the aggro";
	RL_ZONE_TOC_NORTHREND_HEAD_MSG = "Tankers, stay the boss's head to opposite side of raiders";
	RL_ZONE_TOC_NORTHREND_POISON_MSG = "Whoever gets the Paralytic Toxin move to the tanker having Burning Bile.";
	RL_ZONE_TOC_NORTHREND_MOVE_MSG = "Move!!! Be not crashed by IceHowl boss ";
	RL_ZONE_TOC_NORTHREND_ENRAGE_MSG = "Hunter/Rogue, please clear the Enrage by Tranquilizing Shot/Shiv";

	RL_ZONE_TOC_JARAXXUS_READY_MSG = "Rogue/Warrior/DK interrupt Fel Fireball skill, Don\'t stand on the flame and Overheal on the raider who has Incinerate Flesh";
	RL_ZONE_TOC_JARAXXUS_CUT_SPEEL_MSG = "Rogue/Warrior/DK interrupt Fel Fireball skill";
	RL_ZONE_TOC_JARAXXUS_FLAME_MSG = "Don\'t stand on the flame";
	RL_ZONE_TOC_JARAXXUS_OVERHEAL_MSG = "Overheal on the raider who has Incinerate Flesh";
	RL_ZONE_TOC_JARAXXUS_ADD_MSG = "OT takes Mistress of Pain and Nuke her";

	RL_ZONE_TOC_CHAMPIONS_READY_MSG = "Nuke Skel Mark({rt8}) first and do your best to survive with your best skill";
	RL_ZONE_TOC_CHAMPIONS_DISPELL_MSG = "Priest use Massive Dispell and others interrupt the skill";
	RL_ZONE_TOC_CHAMPIONS_DPS_MSG = "Nuke Skel Mark({rt8}) first";

	RL_ZONE_TOC_TWIN_READY_MSG = "OT takes Light and All takes Dark. We will dps Lightbane near Light Portal.";
	RL_ZONE_TOC_TWIN_LIGHT_MSG = "Change to Light";
	RL_ZONE_TOC_TWIN_DARK_MSG  = "Change to Dark";

	RL_ZONE_TOC_ANUBARAK_READY_MSG = "Be on the ICE, Hunter/DK drop the ICE ball and don\'t heal over 50% of health";
	RL_ZONE_TOC_ANUBARAK_ICE_MSG = "Hunter/DK, drop the ICE ball";
	RL_ZONE_TOC_ANUBARAK_INTERRUPT_MSG = "Interrupt Nerubian Dark Strike skill";
	RL_ZONE_TOC_ANUBARAK_ADD_MSG = "OT, takes Nerubian Spider and Nuke them quickly";
	RL_ZONE_TOC_ANUBARAK_STOP_HEAL_MSG = "Don\'t heal over 50% of health, but keep heal Tanker over 50%";
	RL_ZONE_TOC_ANUBARAK_DPS_MSG = "Need your best DPS!!!";
};

RL_ZONE_MSG_KOR["TOC"] = {
	RL_ZONE_TOC_NORTHREND_READY_MSG = "첫번째 보스(고르목)에서는 바닥 조심하시고, 2번째 보스(산성아귀/공포비늘)에서는 모두 산성아귀 부터 공격합니다. 탱커님들은 머리를 공대원 반대로 유지해주세요.\n마비독 대상자는 불타는 답즘 가진 탱커님쪽으로 가서 해제받으세요. 3번째 보스(얼음울음)에서는 절대 보스 돌진을 회피해주세요.";
	RL_ZONE_TOC_NORTHREND_FLAME_MSG = "바닥!!! 바닥에 서 계시지 마세요.";
	RL_ZONE_TOC_NORTHREND_AGGRO_MSG = "탱커님 어글 교환합니다.";
	RL_ZONE_TOC_NORTHREND_HEAD_MSG = "보스 머리를 공대원 반대로 유지해주세요.";
	RL_ZONE_TOC_NORTHREND_POISON_MSG = "마비독 대상자는 불타는 답즘 가진 탱커님쪽으로 가서 해제받으세요";
	RL_ZONE_TOC_NORTHREND_MOVE_MSG = "돌진에 부딛히지 마세요.";
	RL_ZONE_TOC_NORTHREND_ENRAGE_MSG = "낭꾼님, 평정사격으로 격노해제해주세요.";

	RL_ZONE_TOC_JARAXXUS_READY_MSG = "지옥 화염구 차단, 군단 불꽃 바닥 조심하시고, 살점소각 대상자 오버힐로 디버프 제거해주세요.";
	RL_ZONE_TOC_JARAXXUS_CUT_SPEEL_MSG = "도적,전사,죽기님, 지옥 화염구차단해주세요.";
	RL_ZONE_TOC_JARAXXUS_FLAME_MSG = "군단 불꽃 바닥 조심!!! 바닥에 서 계시지 마세요.";
	RL_ZONE_TOC_JARAXXUS_OVERHEAL_MSG = "살점소각 걸린 대상에게 오버힐해서 디버프 제거해주세요.";
	RL_ZONE_TOC_JARAXXUS_ADD_MSG = "부탱님, 고통의 여군주 맡아주시고, 모두 빨리 처치해주세요";

	RL_ZONE_TOC_CHAMPIONS_READY_MSG = "해골 마크({rt8}) 부터 공격해주시고, 각자 생존기를 모두 사용하시고, 최대한 살아남도록 해주세요.";
	RL_ZONE_TOC_CHAMPIONS_DISPELL_MSG = "사제님 대규모 무효화 사용하시고, 각자 메즈 스킬 알아서 사용해주세요.";
	RL_ZONE_TOC_CHAMPIONS_DPS_MSG = "해골 마크({rt8}) 점사해주세요.";

	RL_ZONE_TOC_TWIN_READY_MSG = "부탱님 빛 속성선택해주시고, 나머지는 모두 어둠 속성 선택해 주시고, 빛 속성 포탈 근처에서 피욜라 라이트베인을 공격하시면 됩니다.";
	RL_ZONE_TOC_TWIN_LIGHT_MSG = "빛 속성으로 변경해주세요. (탱커 제외)";
	RL_ZONE_TOC_TWIN_DARK_MSG  = "어둠 속성으로 변경해주세요. (탱커 제외)";

	RL_ZONE_TOC_ANUBARAK_READY_MSG = "항상 얼음 바닥위에 있어주세요. 헌터/죽기님 아이스 잘 떨어뜨려주시고요. 3페이즈때 힐러님들 50%이상 힐하지 마세요.";
	RL_ZONE_TOC_ANUBARAK_ICE_MSG = "헌터/죽기님 아이스 볼 잘 떨어뜨려주시고요.";
	RL_ZONE_TOC_ANUBARAK_INTERRUPT_MSG = "네루비안의 어둠의 일격 차단해주세요.";
	RL_ZONE_TOC_ANUBARAK_ADD_MSG = "부탱님, 네루비안 쫄 보스 근처로 데려와주시고, 극딜해주세요.";
	RL_ZONE_TOC_ANUBARAK_STOP_HEAL_MSG = "힐러님들 체력의 50%이상 치유하지 마세요. 탱커는 계속 치유해주세요.";
	RL_ZONE_TOC_ANUBARAK_DPS_MSG = "극딜이 필요합니다.!!!";
};

local L = RL_ZONE_MSG_ENG["TOC"]
RL_ZONE_TOOLTIP_ENG["TOC"] = {
	RL_ZONE_TOC_NORTHREND_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_NORTHREND_READY_MSG"] .. "\'";
	RL_ZONE_TOC_NORTHREND_FLAME_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_NORTHREND_FLAME_MSG"] .. "\'";
	RL_ZONE_TOC_NORTHREND_AGGRO_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_NORTHREND_AGGRO_MSG"] .. "\'";
	RL_ZONE_TOC_NORTHREND_HEAD_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_NORTHREND_HEAD_MSG"] .. "\'";
	RL_ZONE_TOC_NORTHREND_POISON_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_NORTHREND_POISON_MSG"] .. "\'";
	RL_ZONE_TOC_NORTHREND_MOVE_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_NORTHREND_MOVE_MSG"] .. "\'";
	RL_ZONE_TOC_NORTHREND_ENRAGE_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_NORTHREND_ENRAGE_MSG"] .. "\'";

	RL_ZONE_TOC_JARAXXUS_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_JARAXXUS_READY_MSG"] .. "\'";
	RL_ZONE_TOC_JARAXXUS_CUT_SPEEL_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_JARAXXUS_CUT_SPEEL_MSG"] .. "\'";
	RL_ZONE_TOC_JARAXXUS_FLAME_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_JARAXXUS_FLAME_MSG"] .. "\'";
	RL_ZONE_TOC_JARAXXUS_OVERHEAL_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_JARAXXUS_OVERHEAL_MSG"] .. "\'";
	RL_ZONE_TOC_JARAXXUS_ADD_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_JARAXXUS_ADD_MSG"] .. "\'";

	RL_ZONE_TOC_CHAMPIONS_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_CHAMPIONS_READY_MSG"] .. "\'";
	RL_ZONE_TOC_CHAMPIONS_DISPELL_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_CHAMPIONS_DISPELL_MSG"] .. "\'";
	RL_ZONE_TOC_CHAMPIONS_DPS_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_CHAMPIONS_DPS_MSG"] .. "\'";

	RL_ZONE_TOC_TWIN_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_TWIN_READY_MSG"] .. "\'";
	RL_ZONE_TOC_TWIN_LIGHT_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_TWIN_LIGHT_MSG"] .. "\'";
	RL_ZONE_TOC_TWIN_DARK_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_TWIN_DARK_MSG"] .. "\'";

	RL_ZONE_TOC_ANUBARAK_READY_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_ANUBARAK_READY_MSG"] .. "\'";
	RL_ZONE_TOC_ANUBARAK_ICE_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_ANUBARAK_ICE_MSG"] .. "\'";
	RL_ZONE_TOC_ANUBARAK_INTERRUPT_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_ANUBARAK_INTERRUPT_MSG"] .. "\'";
	RL_ZONE_TOC_ANUBARAK_ADD_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_ANUBARAK_ADD_MSG"] .. "\'";
	RL_ZONE_TOC_ANUBARAK_STOP_HEAL_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_ANUBARAK_STOP_HEAL_MSG"] .. "\'";
	RL_ZONE_TOC_ANUBARAK_DPS_TOOLTIP = "Raid warning - \'" .. L["RL_ZONE_TOC_ANUBARAK_DPS_MSG"] .. "\'";
};

L = RL_ZONE_MSG_KOR["TOC"]
RL_ZONE_TOOLTIP_KOR["TOC"] = {
	RL_ZONE_TOC_NORTHREND_READY_TOOLTIP = "\'" .. L["RL_ZONE_TOC_NORTHREND_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_NORTHREND_FLAME_TOOLTIP = "\'" .. L["RL_ZONE_TOC_NORTHREND_FLAME_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_NORTHREND_AGGRO_TOOLTIP = "\'" .. L["RL_ZONE_TOC_NORTHREND_AGGRO_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_NORTHREND_HEAD_TOOLTIP = "\'" .. L["RL_ZONE_TOC_NORTHREND_HEAD_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_NORTHREND_POISON_TOOLTIP = "\'" .. L["RL_ZONE_TOC_NORTHREND_POISON_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_NORTHREND_MOVE_TOOLTIP = "\'" .. L["RL_ZONE_TOC_NORTHREND_MOVE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_NORTHREND_ENRAGE_TOOLTIP = "\'" .. L["RL_ZONE_TOC_NORTHREND_ENRAGE_MSG"] .. "\' 를 공격대 경보한다.";


	RL_ZONE_TOC_JARAXXUS_READY_TOOLTIP = "\'" .. L["RL_ZONE_TOC_JARAXXUS_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_JARAXXUS_CUT_SPEEL_TOOLTIP = "\'" .. L["RL_ZONE_TOC_JARAXXUS_CUT_SPEEL_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_JARAXXUS_FLAME_TOOLTIP = "\'" .. L["RL_ZONE_TOC_JARAXXUS_FLAME_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_JARAXXUS_OVERHEAL_TOOLTIP = "\'" .. L["RL_ZONE_TOC_JARAXXUS_OVERHEAL_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_JARAXXUS_ADD_TOOLTIP = "\'" .. L["RL_ZONE_TOC_JARAXXUS_ADD_MSG"] .. "\' 를 공격대 경보한다.";

	RL_ZONE_TOC_CHAMPIONS_READY_TOOLTIP = "\'" .. L["RL_ZONE_TOC_CHAMPIONS_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_CHAMPIONS_DISPELL_TOOLTIP = "\'" .. L["RL_ZONE_TOC_CHAMPIONS_DISPELL_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_CHAMPIONS_DPS_TOOLTIP = "\'" .. L["RL_ZONE_TOC_CHAMPIONS_DPS_MSG"] .. "\' 를 공격대 경보한다.";

	RL_ZONE_TOC_TWIN_READY_TOOLTIP = "\'" .. L["RL_ZONE_TOC_TWIN_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_TWIN_LIGHT_TOOLTIP = "\'" .. L["RL_ZONE_TOC_TWIN_LIGHT_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_TWIN_DARK_TOOLTIP = "\'" .. L["RL_ZONE_TOC_TWIN_DARK_MSG"] .. "\' 를 공격대 경보한다.";

	RL_ZONE_TOC_ANUBARAK_READY_TOOLTIP = "\'" .. L["RL_ZONE_TOC_ANUBARAK_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_ANUBARAK_ICE_TOOLTIP = "\'" .. L["RL_ZONE_TOC_ANUBARAK_ICE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_ANUBARAK_INTERRUPT_TOOLTIP = "\'" .. L["RL_ZONE_TOC_ANUBARAK_INTERRUPT_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_ANUBARAK_ADD_TOOLTIP = "\'" .. L["RL_ZONE_TOC_ANUBARAK_ADD_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_ANUBARAK_STOP_HEAL_TOOLTIP = "\'" .. L["RL_ZONE_TOC_ANUBARAK_STOP_HEAL_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_TOC_ANUBARAK_DPS_TOOLTIP = "\'" .. L["RL_ZONE_TOC_ANUBARAK_DPS_MSG"] .. "\' 를 공격대 경보한다.";
};



