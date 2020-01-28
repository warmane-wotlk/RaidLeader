local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

RL_ZONE_ICC_MARROWGAR = { "READY", "STACK", "FLAME" };
RL_ZONE_ICC_LADY = { "READY", "SPIRIT", "INTERRUPT", "CYCLONE", "DARNAVAN", "MD_TOT"};
RL_ZONE_ICC_GUNSHIP = { "READY", "NO_PET", "AGGRO", "JUMP", "WAIT", "RETURN" };
RL_ZONE_ICC_DEATHBRINGER = { "READY", "AGGRO", "ICETRAP", "HEAL", "HOP", "ADD"};
RL_ZONE_ICC_FESTERGUT = { "READY", "SPREAD", "SPORE", "GREEN", "AGGRO", "NO_SPORE"};
RL_ZONE_ICC_ROTFACE = { "READY", "SPREAD", "OOZE", "ACID", "RUN" };
RL_ZONE_ICC_PROFESSOR = { "READY", "DRIBBLE", "MOVE", "GREEN", "RED", "HOP", "AGGRO"};
RL_ZONE_ICC_COUNCIL = { "READY", "KINETIC", "RUN", "NO_AOE" };
RL_ZONE_ICC_BLOODQUEEN = { "READY", "LINK", "RUN", "BITE", "DISPELL" };
RL_ZONE_ICC_DREAMWALKER = { "READY", "SUPPRESSOR", "ABOM_AOE", "PORTAL" };
RL_ZONE_ICC_SINDRAGOSA = { "READY", "BEACON", "HIDE", "HOF", "NO_DPS", "DEBUFF", "SINGLE_TOMB" };
RL_ZONE_ICC_LICHKING = { "READY", "PLAGUE", "ENRAGE", "ICE_SPHERE", "BACK_LICH", "DEFILE", "SOAKING"};

RL_ZONE_INFOS["ICC"] = { 
	{ name = L["Marrowgar"], id = "RL_ZONE_ICC_MARROWGAR", commands = RL_ZONE_ICC_MARROWGAR };
	{ name = L["Lady"], id = "RL_ZONE_ICC_LADY", commands = RL_ZONE_ICC_LADY };
	{ name = L["GunShip"], id = "RL_ZONE_ICC_GUNSHIP", commands = RL_ZONE_ICC_GUNSHIP };
	{ name = L["DeathBringer"], id = "RL_ZONE_ICC_DEATHBRINGER", commands = RL_ZONE_ICC_DEATHBRINGER };
	{ name = L["Festergut"], id = "RL_ZONE_ICC_FESTERGUT", commands = RL_ZONE_ICC_FESTERGUT };
	{ name = L["Rotface"], id = "RL_ZONE_ICC_ROTFACE", commands = RL_ZONE_ICC_ROTFACE };
	{ name = L["Professor"], id = "RL_ZONE_ICC_PROFESSOR", commands = RL_ZONE_ICC_PROFESSOR };
	{ name = L["Council"], id = "RL_ZONE_ICC_COUNCIL", commands = RL_ZONE_ICC_COUNCIL };
	{ name = L["BloodQueen"], id = "RL_ZONE_ICC_BLOODQUEEN", commands = RL_ZONE_ICC_BLOODQUEEN };
	{ name = L["Dreamwalker"], id = "RL_ZONE_ICC_DREAMWALKER", commands = RL_ZONE_ICC_DREAMWALKER };
	{ name = L["Sindragosa"], id = "RL_ZONE_ICC_SINDRAGOSA", commands = RL_ZONE_ICC_SINDRAGOSA };
	{ name = L["Lich King"], id = "RL_ZONE_ICC_LICHKING", commands = RL_ZONE_ICC_LICHKING };
};

RL_ZONE_TEXT_ENG["ICC"] = {
	RL_ZONE_ICC_MARROWGAR_READY = "Ready";
	RL_ZONE_ICC_MARROWGAR_STACK = "Stack";
	RL_ZONE_ICC_MARROWGAR_FLAME = "Flame";

	RL_ZONE_ICC_LADY_READY = "Ready";
	RL_ZONE_ICC_LADY_SPIRIT = "Spirit";
	RL_ZONE_ICC_LADY_INTERRUPT = "Cut Spell";
	RL_ZONE_ICC_LADY_CYCLONE = "Cyclone";
	RL_ZONE_ICC_LADY_DARNAVAN = "Darnavan";
	RL_ZONE_ICC_LADY_MD_TOT = "MD/TOT";

	RL_ZONE_ICC_GUNSHIP_READY = "Ready";
	RL_ZONE_ICC_GUNSHIP_NO_PET = "No Pet";
	RL_ZONE_ICC_GUNSHIP_AGGRO = "Aggro";
	RL_ZONE_ICC_GUNSHIP_JUMP = "Jump";
	RL_ZONE_ICC_GUNSHIP_WAIT = "Wait";
	RL_ZONE_ICC_GUNSHIP_RETURN = "Return";

	RL_ZONE_ICC_DEATHBRINGER_READY = "Ready";
	RL_ZONE_ICC_DEATHBRINGER_AGGRO = "Aggro";
	RL_ZONE_ICC_DEATHBRINGER_ICETRAP = "IceTrap";
	RL_ZONE_ICC_DEATHBRINGER_HEAL = "OverHeal";
	RL_ZONE_ICC_DEATHBRINGER_HOP = "HOP";
	RL_ZONE_ICC_DEATHBRINGER_ADD = "ADD";

	RL_ZONE_ICC_FESTERGUT_READY = "Ready";
	RL_ZONE_ICC_FESTERGUT_SPREAD = "Spread";
	RL_ZONE_ICC_FESTERGUT_SPORE = "Spore";
	RL_ZONE_ICC_FESTERGUT_GREEN = "Flood";
	RL_ZONE_ICC_FESTERGUT_AGGRO = "Aggro";
	RL_ZONE_ICC_FESTERGUT_NO_SPORE = "NO Spore";

	RL_ZONE_ICC_ROTFACE_READY = "Ready";
	RL_ZONE_ICC_ROTFACE_SPREAD = "Spread";
	RL_ZONE_ICC_ROTFACE_OOZE = "Ooze";
	RL_ZONE_ICC_ROTFACE_ACID = "Acid";
	RL_ZONE_ICC_ROTFACE_RUN = "Run";

	RL_ZONE_ICC_PROFESSOR_READY = "Ready";
	RL_ZONE_ICC_PROFESSOR_DRIBBLE = "Dribble";
	RL_ZONE_ICC_PROFESSOR_MOVE = "Evade Gas";
	RL_ZONE_ICC_PROFESSOR_GREEN = "Green Ooze";
	RL_ZONE_ICC_PROFESSOR_RED = "Red Ooze";
	RL_ZONE_ICC_PROFESSOR_HOP = "HOP";
	RL_ZONE_ICC_PROFESSOR_AGGRO = "Aggro";

	RL_ZONE_ICC_COUNCIL_READY = "Ready";
	RL_ZONE_ICC_COUNCIL_KINETIC = "Kinetic";
	RL_ZONE_ICC_COUNCIL_RUN = "Run";
	RL_ZONE_ICC_COUNCIL_NO_AOE = "NO AOE";

	RL_ZONE_ICC_BLOODQUEEN_READY = "Ready";
	RL_ZONE_ICC_BLOODQUEEN_LINK = "Link";
	RL_ZONE_ICC_BLOODQUEEN_RUN = "Run";
	RL_ZONE_ICC_BLOODQUEEN_BITE = "Bite";
	RL_ZONE_ICC_BLOODQUEEN_DISPELL = "Dispell";

	RL_ZONE_ICC_DREAMWALKER_READY = "Ready";
	RL_ZONE_ICC_DREAMWALKER_SUPPRESSOR = "Suppressor";
	RL_ZONE_ICC_DREAMWALKER_ABOM_AOE = "AOE Abom";
	RL_ZONE_ICC_DREAMWALKER_PORTAL = "Portal";

	RL_ZONE_ICC_SINDRAGOSA_READY = "Ready";
	RL_ZONE_ICC_SINDRAGOSA_BEACON = "Beacon";
	RL_ZONE_ICC_SINDRAGOSA_HIDE = "Hide";
	RL_ZONE_ICC_SINDRAGOSA_HOF = "HOF Tank";
	RL_ZONE_ICC_SINDRAGOSA_NO_DPS = "NO Dps";
	RL_ZONE_ICC_SINDRAGOSA_DEBUFF = "Debuff";
	RL_ZONE_ICC_SINDRAGOSA_SINGLE_TOMB = "1Tomb";

	RL_ZONE_ICC_LICHKING_READY = "Ready";
	RL_ZONE_ICC_LICHKING_PLAGUE = "Plague";
	RL_ZONE_ICC_LICHKING_ENRAGE = "Enrage";
	RL_ZONE_ICC_LICHKING_ICE_SPHERE = "IceSphere";
	RL_ZONE_ICC_LICHKING_BACK_LICH = "Back_Lich";
	RL_ZONE_ICC_LICHKING_DEFILE = "Defile";
	RL_ZONE_ICC_LICHKING_SOAKING = "Soaking";
};

RL_ZONE_TEXT_KOR["ICC"] = {
	RL_ZONE_ICC_MARROWGAR_READY = "전투준비";
	RL_ZONE_ICC_MARROWGAR_STACK = "보스아래";
	RL_ZONE_ICC_MARROWGAR_FLAME = "바닥주의";

	RL_ZONE_ICC_LADY_READY = "전투준비";
	RL_ZONE_ICC_LADY_SPIRIT = "불타는 영혼";
	RL_ZONE_ICC_LADY_INTERRUPT = "차단";
	RL_ZONE_ICC_LADY_CYCLONE = "회오리";
	RL_ZONE_ICC_LADY_DARNAVAN = "다르나반";
	RL_ZONE_ICC_LADY_MD_TOT = "눈속/속거";

	RL_ZONE_ICC_GUNSHIP_READY = "전투준비";
	RL_ZONE_ICC_GUNSHIP_NO_PET = "팻 제거";
	RL_ZONE_ICC_GUNSHIP_AGGRO = "어글";
	RL_ZONE_ICC_GUNSHIP_JUMP = "점프";
	RL_ZONE_ICC_GUNSHIP_WAIT = "대기";
	RL_ZONE_ICC_GUNSHIP_RETURN = "복귀";

	RL_ZONE_ICC_DEATHBRINGER_READY = "전투준비";
	RL_ZONE_ICC_DEATHBRINGER_AGGRO = "어글교환";
	RL_ZONE_ICC_DEATHBRINGER_ICETRAP = "얼덫";
	RL_ZONE_ICC_DEATHBRINGER_HEAL = "오버 힐";
	RL_ZONE_ICC_DEATHBRINGER_HOP = "보손";
	RL_ZONE_ICC_DEATHBRINGER_ADD = "쫄 처리";

	RL_ZONE_ICC_FESTERGUT_READY = "전투준비";
	RL_ZONE_ICC_FESTERGUT_SPREAD = "산개";
	RL_ZONE_ICC_FESTERGUT_SPORE = "포자";
	RL_ZONE_ICC_FESTERGUT_GREEN = "탱탱볼";
	RL_ZONE_ICC_FESTERGUT_AGGRO = "어글교환";
	RL_ZONE_ICC_FESTERGUT_NO_SPORE = "NO 포자";

	RL_ZONE_ICC_ROTFACE_READY = "전투준비";
	RL_ZONE_ICC_ROTFACE_SPREAD = "산개";
	RL_ZONE_ICC_ROTFACE_OOZE = "녹쫄뭉침";
	RL_ZONE_ICC_ROTFACE_ACID = "녹색바닥";
	RL_ZONE_ICC_ROTFACE_RUN = "오즈폭발";

	RL_ZONE_ICC_PROFESSOR_READY = "전투준비";
	RL_ZONE_ICC_PROFESSOR_DRIBBLE = "보스이동";
	RL_ZONE_ICC_PROFESSOR_MOVE = "바닥조심";
	RL_ZONE_ICC_PROFESSOR_GREEN = "녹쫄";
	RL_ZONE_ICC_PROFESSOR_RED = "빨쫄";
	RL_ZONE_ICC_PROFESSOR_HOP = "보손";
	RL_ZONE_ICC_PROFESSOR_AGGRO = "어글교환";

	RL_ZONE_ICC_COUNCIL_READY = "전투준비";
	RL_ZONE_ICC_COUNCIL_KINETIC = "요동구술";
	RL_ZONE_ICC_COUNCIL_RUN = "도망";
	RL_ZONE_ICC_COUNCIL_NO_AOE = "NO 광딜";

	RL_ZONE_ICC_BLOODQUEEN_READY = "전투준비";
	RL_ZONE_ICC_BLOODQUEEN_LINK = "링크";
	RL_ZONE_ICC_BLOODQUEEN_RUN = "어둠 도망";
	RL_ZONE_ICC_BLOODQUEEN_BITE = "물기";
	RL_ZONE_ICC_BLOODQUEEN_DISPELL = "공포 대응";

	RL_ZONE_ICC_DREAMWALKER_READY = "전투준비";
	RL_ZONE_ICC_DREAMWALKER_SUPPRESSOR = "억제자";
	RL_ZONE_ICC_DREAMWALKER_ABOM_AOE = "광역 벌레";
	RL_ZONE_ICC_DREAMWALKER_PORTAL = "포탈";

	RL_ZONE_ICC_SINDRAGOSA_READY = "전투준비";
	RL_ZONE_ICC_SINDRAGOSA_BEACON = "무덤만들기";
	RL_ZONE_ICC_SINDRAGOSA_HIDE = "무덤뒤 숨기";
	RL_ZONE_ICC_SINDRAGOSA_HOF = "자유의 손길";
	RL_ZONE_ICC_SINDRAGOSA_NO_DPS = "딜 스탑";
	RL_ZONE_ICC_SINDRAGOSA_DEBUFF = "디버프확인";
	RL_ZONE_ICC_SINDRAGOSA_SINGLE_TOMB = "1인 봉화";

	RL_ZONE_ICC_LICHKING_READY = "전투준비";
	RL_ZONE_ICC_LICHKING_PLAGUE = "역병";
	RL_ZONE_ICC_LICHKING_ENRAGE = "격노해제";
	RL_ZONE_ICC_LICHKING_ICE_SPHERE = "얼음구슬";
	RL_ZONE_ICC_LICHKING_BACK_LICH = "리치왕 뒤";
	RL_ZONE_ICC_LICHKING_DEFILE = "파멸";
	RL_ZONE_ICC_LICHKING_SOAKING = "소킹";
};


RL_ZONE_MSG_ENG["ICC"] = {
	RL_ZONE_ICC_MARROWGAR_READY_MSG = "Listen Up! MT/OT stay together, others stack together under boss";
	RL_ZONE_ICC_MARROWGAR_STACK_MSG = "Stack together under boss and DPS";
	RL_ZONE_ICC_MARROWGAR_FLAME_MSG = "Don\'t stand on the flame";

	RL_ZONE_ICC_LADY_READY_MSG = "Ready for lady";
	RL_ZONE_ICC_LADY_SPIRIT_MSG = "Evade Vengeful Spirits. Move!! Move!!";
	RL_ZONE_ICC_LADY_INTERRUPT_MSG = "Interrupt the Frostbolt spell";
	RL_ZONE_ICC_LADY_CYCLONE_MSG = "Druid, use Cyclone on the Mind Controlled Raider";
	RL_ZONE_ICC_LADY_DARNAVAN_MSG = "Mage/Priest - take Darnavan and, dont dps Darnavan";
	RL_ZONE_ICC_LADY_MD_TOT_MSG = "Hunter/Rogue, use MD/TOT on OT";

	RL_ZONE_ICC_GUNSHIP_READY_MSG = "Ready at gunship";
	RL_ZONE_ICC_GUNSHIP_NO_PET_MSG = "Dismiss any PET.";
	RL_ZONE_ICC_GUNSHIP_RETURN_MSG = "All be BACK to the ship.";
	RL_ZONE_ICC_GUNSHIP_JUMP_MSG = "Everyone Jump from left side and Jump tanker does from right side.";
	RL_ZONE_ICC_GUNSHIP_WAIT_MSG = "Don\'t jump yet, Wait\nDon\'t jump yet, Wait\nDon\'t jump yet, Wait";
	RL_ZONE_ICC_GUNSHIP_AGGRO_MSG = "Tank at ship takes Aggro";

	RL_ZONE_ICC_DEATHBRINGER_READY_MSG = "Tanker please take aggro turn on time, Hunter use icetrap, Druid use Typoon and DPS ADD first quickly";
	RL_ZONE_ICC_DEATHBRINGER_AGGRO_MSG = "Tanker, please take turns of Aggro";
	RL_ZONE_ICC_DEATHBRINGER_ICETRAP_MSG = "Hunter, please put the ice trap near steps before ADD are spawn";
	RL_ZONE_ICC_DEATHBRINGER_HEAL_MSG = "Healers, please do overheal on the raider specifically having Boiling Blood or Mark of the Fallen Champion.";
	RL_ZONE_ICC_DEATHBRINGER_HOP_MSG = "Pally use HOP on the one having Boiling Blood. And you can delete it with Divine Shield too. ";
	RL_ZONE_ICC_DEATHBRINGER_ADD_MSG = "KILL Blood Beasts quickly, NO DPS on ADD == NO ITEM";

	RL_ZONE_ICC_FESTERGUT_READY_MSG = "RDPS/Healers attack or heal from max distance. 1 Gas Spore MUST go Tanker and the others MUST go to the Marked Healers. And The second tank must taunt at 8 stacks.";
	RL_ZONE_ICC_FESTERGUT_SPREAD_MSG = "RDPS/Healers attack or heal with max distance.";
	RL_ZONE_ICC_FESTERGUT_SPORE_MSG = "1 Gas Spore MUST go Tanker and the others MUST go to the Marked Healers.";
	RL_ZONE_ICC_FESTERGUT_GREEN_MSG = "Malleable Goo(Green Ball) is coming. Move!!!";
	RL_ZONE_ICC_FESTERGUT_AGGRO_MSG = "The second tank must taunt at 8 stacks. Use Hand of Salvation on the second tanker";
	RL_ZONE_ICC_FESTERGUT_NO_SPORE_MSG = "Ignore gas spore. Just DPS.";

	RL_ZONE_ICC_ROTFACE_READY_MSG = "원딜/힐러님들 산개해서 공격/힐하시고, 녹쪽 대상자는 바로 부탱에게 가서 녹쫄 합쳐주세요.";
	RL_ZONE_ICC_ROTFACE_SPREAD_MSG = "RDPS/Healers attack or heal with max distance.";
	RL_ZONE_ICC_ROTFACE_OOZE_MSG = "Mutated Infected player moves to OT to merge it.";
	RL_ZONE_ICC_ROTFACE_ACID_MSG = "Don\'t stand on the ooze flood";
	RL_ZONE_ICC_ROTFACE_RUN_MSG = "The Big Ooze explode soon, please move to the wall.";

	RL_ZONE_ICC_PROFESSOR_READY_MSG = "Remember this, Together on Green Ooze, Run away from Red Ooze.";
	RL_ZONE_ICC_PROFESSOR_DRIBBLE_MSG = "The Boss tanker bring the Professor near the Abom.";
	RL_ZONE_ICC_PROFESSOR_MOVE_MSG = "Watch out Malleable Goo / Choking gas bomb";
	RL_ZONE_ICC_PROFESSOR_GREEN_MSG = "STOP DPS\nSTOP DPS\nAbom makes it slow. Be ready to rush the Green Ooze. Watch out your health.";
	RL_ZONE_ICC_PROFESSOR_RED_MSG = "STOP DPS\nSTOP DPS\nAbom makes it slow. All come to the alchemy table. The RED Ooze's target must be away from it and roam around the Professor.";
	RL_ZONE_ICC_PROFESSOR_HOP_MSG = "Oh my god, Pally, use HOP (Hand of Protection";
	RL_ZONE_ICC_PROFESSOR_AGGRO_MSG = "Hunter, use Distracting Shot and use Feign Death";

	RL_ZONE_ICC_COUNCIL_READY_MSG = "Use MD/TOT on Taldaram/Valanar tanker. Don\'t let Kinetic Bomb exploded";
	RL_ZONE_ICC_COUNCIL_KINETIC_MSG = "Take care of Kinetic Bomb. Use your pet and Focus on them. Don\'t let them on the ground or explode.";
	RL_ZONE_ICC_COUNCIL_RUN_MSG = "RUN!!!\nRun away from the center.. Don\'t go to the center!!!";
	RL_ZONE_ICC_COUNCIL_NO_AOE_MSG = "Don\'t use AOE when you attack Keleseth. (Especially, Shadowmourne or Living Bomb) ";

	RL_ZONE_ICC_BLOODQUEEN_READY_MSG = "All linked player with Pact of the Darkfallen must be within 5 yards of each other. Whoever has Swarming Shadows must run along the wall. And don\'t fail on bite.";
	RL_ZONE_ICC_BLOODQUEEN_LINK_MSG = "All linked player with Pact of the Darkfallen must be within 5 yards of each other.";
	RL_ZONE_ICC_BLOODQUEEN_RUN_MSG = "Whoever has Swarming Shadows must run along the wall";
	RL_ZONE_ICC_BLOODQUEEN_BITE_MSG = "Whoever has Essence of the Blood Queen prepare to bite other player. Be near him and bite him, use 1 key.";
	RL_ZONE_ICC_BLOODQUEEN_DISPELL_MSG = "Prepare Incite Terror. Come to the center from the any flame. Priest use holy excorcism on yourself and do mass dispell.";

	RL_ZONE_ICC_DREAMWALKER_READY_MSG = "This is attack order.\nSuppressor >> Blazing Skeleton >> Blistering Zombie >> Abomination\nQuickly kill the Suppressor and use AOE when Abomination is killed.";
	RL_ZONE_ICC_DREAMWALKER_SUPPRESSOR_MSG = "Suppressor is coming after Abomination. Quickly kill Suppressor.";
	RL_ZONE_ICC_DREAMWALKER_ABOM_AOE_MSG = "Abomination will be exploded, come to there and use AOE on Rot Worms.";
	RL_ZONE_ICC_DREAMWALKER_PORTAL_MSG = "The Valithria healers should move close to these orbs and enter the portals as soon as they appear.\nCrusader Aura/Auro mastery works inside the dream, increasing movement speed.";

	RL_ZONE_ICC_SINDRAGOSA_READY_MSG = "The assigned Ice Tomb players must stand like ( 1,2 -- 3 -- 4,5 for 25),(1 - 2 for 10).";
	RL_ZONE_ICC_SINDRAGOSA_BEACON_MSG = "The assigned Ice Tomb players must stand like ( 1,2 -- 3 -- 4,5 for 25),(1 - 2 for 10).";
	RL_ZONE_ICC_SINDRAGOSA_HIDE_MSG = "Move behind Tomb to evade Icy Grip.";
	RL_ZONE_ICC_SINDRAGOSA_HOF_MSG = "Pally use the HOF(Hands of Freedom to the Sindragosa Tanker.";
	RL_ZONE_ICC_SINDRAGOSA_NO_DPS_MSG = "STOP DPS!!!\nSTOP DPS!!!\nSTOP DPS!!!";
	RL_ZONE_ICC_SINDRAGOSA_DEBUFF_MSG = "Check out your debuff (Permeating Chill/Unchained Magic), No more than 5 stack after 1 Phase.";
	RL_ZONE_ICC_SINDRAGOSA_SINGLE_TOMB_MSG = "The assigned Ice Tomb player run away from players. Fast run, run.";

	RL_ZONE_ICC_LICHKING_READY_MSG = "Be careful for the Plague and Defile.";
	RL_ZONE_ICC_LICHKING_PLAGUE_MSG = "Whoever gets Necrotic Plague run next to the adds and dispel them there.";
	RL_ZONE_ICC_LICHKING_ENRAGE_MSG = "Hunter, use Tranquilizing Shot on ADD";
	RL_ZONE_ICC_LICHKING_ICE_SPHERE_MSG = "Hunter/Warlock/Unholy DK pull your pet from Ice Sphere";
	RL_ZONE_ICC_LICHKING_BACK_LICH_MSG = "All except tanker stand behind Lich King";
	RL_ZONE_ICC_LICHKING_DEFILE_MSG = "Defile!!!\nDefile!!\nSpread out a little but not near to center.";
	RL_ZONE_ICC_LICHKING_SOAKING_MSG = "Prepare to do a soaking the Spirits";
};

RL_ZONE_MSG_KOR["ICC"] = {
	RL_ZONE_ICC_MARROWGAR_READY_MSG = "맨탱/부탱 같이 붙어서 있으시고, 나머지는 모두 보스 바로 밑에 모여서 공격해주세요.";
	RL_ZONE_ICC_MARROWGAR_STACK_MSG = "모두 보스밑에 모여서 공격해주세요.";
	RL_ZONE_ICC_MARROWGAR_FLAME_MSG = "화염 바닥에 있지마세요";

	RL_ZONE_ICC_LADY_READY_MSG = "맨탱은 오른쪽, 부탱은 왼쪽 몹을 데리고 중앙 계단밑으로 와서, 광역 한번만 해주시고, 정배자 바로 회오리해주세요.";
	RL_ZONE_ICC_LADY_SPIRIT_MSG = "불타는 영혼 피해주세요.";
	RL_ZONE_ICC_LADY_INTERRUPT_MSG = "차단조는 보스의 얼음화살을 차단해주세요.";
	RL_ZONE_ICC_LADY_CYCLONE_MSG = "드루님, 정배 대상자에게 회오리해주세요. 정배 대상자 공격하지 마세요.";
	RL_ZONE_ICC_LADY_DARNAVAN_MSG = "법사님/사제님 - 다르나반 양변/정배해주세요. 다르나반 공격하지 마세요.";
	RL_ZONE_ICC_LADY_MD_TOT_MSG = "낭꾼/도적님, 부탱에게 눈속/속거해주세요.";

	RL_ZONE_ICC_GUNSHIP_READY_MSG = "천케릭분들은 캐논에 타시고, 1-1-2 눌러주시고, 점프 탱커가 점프하면 탱커의 왼쪽으로 해서 점프하세요. 비행선에 나오는 쫄은 부탱에게 맡겨주시고, 되도록 공격하지 마세요.";
	RL_ZONE_ICC_GUNSHIP_NO_PET_MSG = "낭꾼/죽기/흑마님, 팻 해제해주세요.";
	RL_ZONE_ICC_GUNSHIP_RETURN_MSG = "본선으로 다시 복귀하세요. 점프탱커는 마지막 사람이 점프한 후 복귀해주세요.";
	RL_ZONE_ICC_GUNSHIP_JUMP_MSG = "모두 배의 왼쪽 난간에서 점프하세요. 점프 탱커는 오른쪽 난간에서 해주세요.\n점프하세요.\n점프하세요.";
	RL_ZONE_ICC_GUNSHIP_WAIT_MSG = "아직 점프하지 마세요!!!\n아직 점프하지 마세요!!!\n아직 점프하지 마세요!!!";
	RL_ZONE_ICC_GUNSHIP_AGGRO_MSG = "배에 있는 탱커님 어글 잡아주세요.";	

	RL_ZONE_ICC_DEATHBRINGER_READY_MSG = "탱님들 어글 교환 칼같이해주시고, 기사님 스턴 나눠서해주시고, 쫄 바로바로 처리해주세요. 낭꾼님은 얼덫을 계단에 설치하는 것 잊지마세요.";
	RL_ZONE_ICC_DEATHBRINGER_AGGRO_MSG = "탱님 어글 교환해주세요.";
	RL_ZONE_ICC_DEATHBRINGER_ICETRAP_MSG = "낭꾼님은 애드나오기전 5초전에 얼덫을 계단에 설치해주세요.";
	RL_ZONE_ICC_DEATHBRINGER_HEAL_MSG = "힐러님들 팍세게 오버힐해주세요. 끓는 피의 대상자/타락한 용사의 징표 대상자를 더 주의해주세요.";
	RL_ZONE_ICC_DEATHBRINGER_HOP_MSG = "끓는 피의 대상자에게 보손이나 무적/그망/등으로 해제해주세요.";
	RL_ZONE_ICC_DEATHBRINGER_ADD_MSG = "쫄(피의 괴물) 바로 공격하시고, 절대 맞서지 말고 도망가세요.";

	RL_ZONE_ICC_FESTERGUT_READY_MSG = "산개해서 공격하시고, 스포어 대상자 한명은 탱에게 나고 나머지는 힐러에게 나눠서 갑니다.";
	RL_ZONE_ICC_FESTERGUT_SPREAD_MSG = "원딜/딜러님들 산개하여 공격하세요.";
	RL_ZONE_ICC_FESTERGUT_SPORE_MSG = "스포어 대상자 1명은 탱커로 가세요. 나머지 스포어 대상자는 힐러들에게 나눠서 가세요.";
	RL_ZONE_ICC_FESTERGUT_GREEN_MSG = "탱탱볼 날아옵니다. 녹색 바닥에서 피하세요.";
	RL_ZONE_ICC_FESTERGUT_AGGRO_MSG = "탱 어글 교환합니다. 교환전 생존기 사용하세요.";
	RL_ZONE_ICC_FESTERGUT_NO_SPORE_MSG = "스포어 무시합니다. 보스 극딜하세요.";

	RL_ZONE_ICC_ROTFACE_READY_MSG = "원딜/힐러님들 산개해서 공격/힐하시고, 녹쪽 대상자는 바로 부탱에게 가서 녹쫄 합쳐주세요.";
	RL_ZONE_ICC_ROTFACE_SPREAD_MSG = "원딜/힐러님들 산개해서 공격/힐하시고, 근딜 근처로 가지 마세요.";
	RL_ZONE_ICC_ROTFACE_OOZE_MSG = "녹쪽 대상자는 바로 부탱에게 가서 녹쫄 합쳐주세요. 가는 동안에 질병해제 해주세요.";
	RL_ZONE_ICC_ROTFACE_ACID_MSG = "녹색 오염이 나옵니다. 녹색 바닥에 있지마세요.";
	RL_ZONE_ICC_ROTFACE_RUN_MSG = "녹쪽 폭발합니다. 현 위치에서 벗어나서 벽으로 빨리 이동하세요.";

	RL_ZONE_ICC_PROFESSOR_READY_MSG = "기억하세요. \'녹쪽은 뭉치고, 빨쫄은 도망갑니다.\' 딜금지 요청시 바로 딜 금지해주세요. 어봄에게 작은 성축/힘축주세요. 그리고, 바닥 잘 피하세요.";
	RL_ZONE_ICC_PROFESSOR_DRIBBLE_MSG = "보스탱님 보스를 녹색 바닥 근처로 이동시켜서 어봄이 보스 공격하도록 해주세요.";
	RL_ZONE_ICC_PROFESSOR_MOVE_MSG = "가스/탱탱볼/바닥 피해주세요.";
	RL_ZONE_ICC_PROFESSOR_GREEN_MSG = "딜금지!!\n딜금지!!\n어봄님은 슬로우/슬로우하세요. 다른분들은 녹쫄로 달려가서 공격할 준비하세요. 너무 빨리가시지도 말고, 달리기 전 자신의 체력확인하세요.";
	RL_ZONE_ICC_PROFESSOR_RED_MSG = "딜금지!!\n딜금지!!\n어봄님은 슬로우/슬로우하세요. 모두 빨쫄에서 연금대 근처로 뭉치세요. 그리고, 빨쫄 대상자는 보스 주변으로 원을 그리면서 도망가세요.";
	RL_ZONE_ICC_PROFESSOR_HOP_MSG = "이런 이런... 빨쫄 대상자에게 보손/보손 사용하세요.";
	RL_ZONE_ICC_PROFESSOR_AGGRO_MSG = "헌터님 견제사격 샷하시고, 죽척해주세요.";

	RL_ZONE_ICC_COUNCIL_READY_MSG = "켈레 보스에는 절대 광역사용하지 마세요. (어둠한 케릭, 살폭 법사 조심하세요.). 구슬처리 담당자는 구슬 잘 쳐리해주세요. 시작시 탱커님에게 눈속/속거 주고 시작하세요.";
	RL_ZONE_ICC_COUNCIL_KINETIC_MSG = "구슬 처리해주세요. 팻도 활용하여 하나 붙혀주세요.";
	RL_ZONE_ICC_COUNCIL_RUN_MSG = "절대 힐러들이 모여 있는 중앙으로 오지 마세고, 강단 쪽으로 도망가세요.";
	RL_ZONE_ICC_COUNCIL_NO_AOE_MSG = "켈레 보스에는 절대 광역사용하지 마세요. (어둠한 케릭, 살폭 법사 조심하세요.)";

	RL_ZONE_ICC_BLOODQUEEN_READY_MSG = "딜은 충분합니다. 물기 잘하시고, 모여드는 어둠 대상자는 빨리 벽면쪽으로 가시고, 암흑사도 계약 대상자들은 빨리 뭉쳐주세요.";
	RL_ZONE_ICC_BLOODQUEEN_LINK_MSG = "암흑사도의 계약이 연결된 대상자들은 서로 빨리 뭉쳐주세요.";
	RL_ZONE_ICC_BLOODQUEEN_RUN_MSG = "모여드는 어둠 대상자는 벽면쪽으로 해서 돌아서 뛰어가세요.";
	RL_ZONE_ICC_BLOODQUEEN_BITE_MSG = "피의 여왕의 정수 대상자들은 물기 준비하세요. 5초전에 미리 원하는 대상 옆에 가세요. 그리고, 1번 눌러요.";
	RL_ZONE_ICC_BLOODQUEEN_DISPELL_MSG = "공포 대비해야 합니다. 모두 어둠 근처로 벗어나서 미리 가운데로 오시고,\n사제님 본인의 공포의 수호물 거시고, 대규모 무효화해주세요.";

	RL_ZONE_ICC_DREAMWALKER_READY_MSG = "억제자 >> 타오르는 해골 >> 좀비 >> 어보미 순으로 공격해주세요. 어보미 터지기 전에 광역딜 준비해서 벌레 빨리 잡아주세요.";
	RL_ZONE_ICC_DREAMWALKER_SUPPRESSOR_MSG = "억제자 나옵니다. 억제자 바로 잡아요.";
	RL_ZONE_ICC_DREAMWALKER_ABOM_AOE_MSG = "어보미 터져서 벌레 나옵니다. 빠른 광역해주세요.";
	RL_ZONE_ICC_DREAMWALKER_PORTAL_MSG = "내부힐 담당자 차원문 근처로 미리 가서 들어갈 준비하세요. 기사님은 성전사오라/오라숙련을 이용하세요.";

	RL_ZONE_ICC_SINDRAGOSA_READY_MSG = "봉화대상자 뭉치는 것만 잘하면 됩니다. 모르시는 분 손들어 알려주세요.";
	RL_ZONE_ICC_SINDRAGOSA_BEACON_MSG = "봉화대상자는 (25인의 경우 1,2 -- 3 -- 4,5),(10인의 경우 1 - 2) 순으로 뭉쳐주세요. 1,2는 서로 겹쳐서 서주세요.";
	RL_ZONE_ICC_SINDRAGOSA_HIDE_MSG = "무덤 뒤로 숨어서 한파를 피해갑니다.";
	RL_ZONE_ICC_SINDRAGOSA_HOF_MSG = "기사님, 슬로우 걸린 보스탱에게 자유의 손길 주세요.";
	RL_ZONE_ICC_SINDRAGOSA_NO_DPS_MSG = "딜 금지!!!\n딜 금지!!!\n딜 금지!!!";
	RL_ZONE_ICC_SINDRAGOSA_DEBUFF_MSG = "자신의 디버프(사무치는 한기/해방된 마법) 확인하세요. 5스택 이상이 되면 위험합니다.";
	RL_ZONE_ICC_SINDRAGOSA_SINGLE_TOMB_MSG = "봉화 대상자는 바로 레이드 무리에서 벗어나서 나가세요. 지구를 떠나거라~~";

	RL_ZONE_ICC_LICHKING_READY_MSG = "다들 여기까지 오시느라 수고가 많습니다.\n초반 역병 대상자는 바로 뒤에 괴물쪽으로 빠져주세요. 파멸 잘 처리해주세요.";
	RL_ZONE_ICC_LICHKING_PLAGUE_MSG = "역병 대상자는 바로 뒤에 괴물쪽으로 빠져주세요.";
	RL_ZONE_ICC_LICHKING_ENRAGE_MSG = "낭꾼님, 평정사격으로 괴물의 격노해제해주세요.";
	RL_ZONE_ICC_LICHKING_ICE_SPHERE_MSG = "낭꾼/죽기/흑마님 팻 바로 빼주세요. 얼음 구슬로 가면 안됩니다.";
	RL_ZONE_ICC_LICHKING_BACK_LICH_MSG = "모두 (탱빼고) 리치 뒤로 서주세요.";
	RL_ZONE_ICC_LICHKING_DEFILE_MSG = "파멸!!!파멸!!! 미리 약산개/산개 해주세요.";
	RL_ZONE_ICC_LICHKING_SOAKING_MSG = "새우 소킹 준비하세요.";
};

local BL = RL_ZONE_MSG_ENG["ICC"]
RL_ZONE_TOOLTIP_ENG["ICC"] = {
	RL_ZONE_ICC_MARROWGAR_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_MARROWGAR_READY_MSG"] .. "\'";
	RL_ZONE_ICC_MARROWGAR_STACK_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_MARROWGAR_STACK_MSG"] .. "\'";
	RL_ZONE_ICC_MARROWGAR_FLAME_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_MARROWGAR_FLAME_MSG"] .. "\'";

	RL_ZONE_ICC_LADY_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LADY_READY_MSG"] .. "\'";
	RL_ZONE_ICC_LADY_SPIRIT_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LADY_SPIRIT_MSG"] .. "\'";
	RL_ZONE_ICC_LADY_INTERRUPT_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LADY_INTERRUPT_MSG"] .. "\'";
	RL_ZONE_ICC_LADY_CYCLONE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LADY_CYCLONE_MSG"] .. "\'";
	RL_ZONE_ICC_LADY_DARNAVAN_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LADY_DARNAVAN_MSG"] .. "\'";
	RL_ZONE_ICC_LADY_MD_TOT_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LADY_MD_TOT_MSG"] .. "\'";

	RL_ZONE_ICC_GUNSHIP_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_GUNSHIP_READY_MSG"] .. "\'";
	RL_ZONE_ICC_GUNSHIP_NO_PET_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_GUNSHIP_NO_PET_MSG"] .. "\'";	
	RL_ZONE_ICC_GUNSHIP_RETURN_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_GUNSHIP_RETURN_MSG"] .. "\'";	
	RL_ZONE_ICC_GUNSHIP_JUMP_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_GUNSHIP_JUMP_MSG"] .. "\'";
	RL_ZONE_ICC_GUNSHIP_WAIT_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_GUNSHIP_WAIT_MSG"] .. "\'";
	RL_ZONE_ICC_GUNSHIP_AGGRO_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_GUNSHIP_AGGRO_MSG"] .. "\'";	

	RL_ZONE_ICC_DEATHBRINGER_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DEATHBRINGER_READY_MSG"] .. "\'";	
	RL_ZONE_ICC_DEATHBRINGER_AGGRO_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DEATHBRINGER_AGGRO_MSG"] .. "\'";	
	RL_ZONE_ICC_DEATHBRINGER_ICETRAP_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DEATHBRINGER_ICETRAP_MSG"] .. "\'";	
	RL_ZONE_ICC_DEATHBRINGER_HEAL_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DEATHBRINGER_HEAL_MSG"] .. "\'";	
	RL_ZONE_ICC_DEATHBRINGER_HOP_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DEATHBRINGER_HOP_MSG"] .. "\'";	
	RL_ZONE_ICC_DEATHBRINGER_ADD_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DEATHBRINGER_ADD_MSG"] .. "\'";	

	RL_ZONE_ICC_FESTERGUT_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_FESTERGUT_READY_MSG"] .. "\'";	
	RL_ZONE_ICC_FESTERGUT_SPREAD_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_FESTERGUT_SPREAD_MSG"] .. "\'";	
	RL_ZONE_ICC_FESTERGUT_SPORE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_FESTERGUT_SPORE_MSG"] .. "\'";	
	RL_ZONE_ICC_FESTERGUT_GREEN_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_FESTERGUT_GREEN_MSG"] .. "\'";	
	RL_ZONE_ICC_FESTERGUT_AGGRO_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_FESTERGUT_AGGRO_MSG"] .. "\'";	
	RL_ZONE_ICC_FESTERGUT_NO_SPORE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_FESTERGUT_NO_SPORE_MSG"] .. "\'";

	RL_ZONE_ICC_ROTFACE_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_ROTFACE_READY_MSG"] .. "\'";
	RL_ZONE_ICC_ROTFACE_SPREAD_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_ROTFACE_SPREAD_MSG"] .. "\'";
	RL_ZONE_ICC_ROTFACE_OOZE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_ROTFACE_OOZE_MSG"] .. "\'";
	RL_ZONE_ICC_ROTFACE_ACID_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_ROTFACE_ACID_MSG"] .. "\'";
	RL_ZONE_ICC_ROTFACE_RUN_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_ROTFACE_RUN_MSG"] .. "\'";

	RL_ZONE_ICC_PROFESSOR_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_PROFESSOR_READY_MSG"] .. "\'";
	RL_ZONE_ICC_PROFESSOR_DRIBBLE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_PROFESSOR_DRIBBLE_MSG"] .. "\'";
	RL_ZONE_ICC_PROFESSOR_MOVE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_PROFESSOR_MOVE_MSG"] .. "\'";
	RL_ZONE_ICC_PROFESSOR_GREEN_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_PROFESSOR_GREEN_MSG"] .. "\'";
	RL_ZONE_ICC_PROFESSOR_RED_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_PROFESSOR_RED_MSG"] .. "\'";
	RL_ZONE_ICC_PROFESSOR_HOP_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_PROFESSOR_HOP_MSG"] .. "\'";
	RL_ZONE_ICC_PROFESSOR_AGGRO_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_PROFESSOR_AGGRO_MSG"] .. "\'";

	RL_ZONE_ICC_COUNCIL_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_COUNCIL_READY_MSG"] .. "\'";
	RL_ZONE_ICC_COUNCIL_KINETIC_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_COUNCIL_KINETIC_MSG"] .. "\'";
	RL_ZONE_ICC_COUNCIL_RUN_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_COUNCIL_RUN_MSG"] .. "\'";
	RL_ZONE_ICC_COUNCIL_NO_AOE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_COUNCIL_NO_AOE_MSG"] .. "\'";

	RL_ZONE_ICC_BLOODQUEEN_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_BLOODQUEEN_READY_MSG"] .. "\'";
	RL_ZONE_ICC_BLOODQUEEN_LINK_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_BLOODQUEEN_LINK_MSG"] .. "\'";
	RL_ZONE_ICC_BLOODQUEEN_RUN_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_BLOODQUEEN_RUN_MSG"] .. "\'";
	RL_ZONE_ICC_BLOODQUEEN_BITE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_BLOODQUEEN_BITE_MSG"] .. "\'";
	RL_ZONE_ICC_BLOODQUEEN_DISPELL_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_BLOODQUEEN_DISPELL_MSG"] .. "\'";

	RL_ZONE_ICC_DREAMWALKER_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DREAMWALKER_READY_MSG"] .. "\'";
	RL_ZONE_ICC_DREAMWALKER_SUPPRESSOR_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DREAMWALKER_SUPPRESSOR_MSG"] .. "\'";
	RL_ZONE_ICC_DREAMWALKER_ABOM_AOE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DREAMWALKER_ABOM_AOE_MSG"] .. "\'";
	RL_ZONE_ICC_DREAMWALKER_PORTAL_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_DREAMWALKER_PORTAL_MSG"] .. "\'";

	RL_ZONE_ICC_SINDRAGOSA_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_SINDRAGOSA_READY_MSG"] .. "\'";
	RL_ZONE_ICC_SINDRAGOSA_BEACON_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_SINDRAGOSA_BEACON_MSG"] .. "\'";
	RL_ZONE_ICC_SINDRAGOSA_HIDE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_SINDRAGOSA_HIDE_MSG"] .. "\'";
	RL_ZONE_ICC_SINDRAGOSA_HOF_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_SINDRAGOSA_HOF_MSG"] .. "\'";
	RL_ZONE_ICC_SINDRAGOSA_NO_DPS_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_SINDRAGOSA_NO_DPS_MSG"] .. "\'";
	RL_ZONE_ICC_SINDRAGOSA_DEBUFF_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_SINDRAGOSA_DEBUFF_MSG"] .. "\'";
	RL_ZONE_ICC_SINDRAGOSA_SINGLE_TOMB_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_SINDRAGOSA_SINGLE_TOMB_MSG"] .. "\'";

	RL_ZONE_ICC_LICHKING_READY_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LICHKING_READY_MSG"] .. "\'";
	RL_ZONE_ICC_LICHKING_PLAGUE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LICHKING_PLAGUE_MSG"] .. "\'";
	RL_ZONE_ICC_LICHKING_ENRAGE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LICHKING_ENRAGE_MSG"] .. "\'";
	RL_ZONE_ICC_LICHKING_ICE_SPHERE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LICHKING_ICE_SPHERE_MSG"] .. "\'";
	RL_ZONE_ICC_LICHKING_BACK_LICH_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LICHKING_BACK_LICH_MSG"] .. "\'";
	RL_ZONE_ICC_LICHKING_DEFILE_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LICHKING_DEFILE_MSG"] .. "\'";
	RL_ZONE_ICC_LICHKING_SOAKING_TOOLTIP = "Raid warning - \'" .. BL["RL_ZONE_ICC_LICHKING_SOAKING_MSG"] .. "\'";
};

BL = RL_ZONE_MSG_KOR["ICC"]
RL_ZONE_TOOLTIP_KOR["ICC"] = {
	RL_ZONE_ICC_MARROWGAR_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_MARROWGAR_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_MARROWGAR_STACK_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_MARROWGAR_STACK_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_MARROWGAR_FLAME_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_MARROWGAR_FLAME_MSG"] .. "\' 를 공격대 경보한다.";

	RL_ZONE_ICC_LADY_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LADY_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LADY_SPIRIT_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LADY_SPIRIT_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LADY_INTERRUPT_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LADY_INTERRUPT_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LADY_CYCLONE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LADY_CYCLONE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LADY_DARNAVAN_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LADY_DARNAVAN_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LADY_MD_TOT_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LADY_MD_TOT_MSG"] .. "\' 를 공격대 경보한다."; 

	RL_ZONE_ICC_GUNSHIP_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_GUNSHIP_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_GUNSHIP_NO_PET_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_GUNSHIP_NO_PET_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_GUNSHIP_RETURN_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_GUNSHIP_RETURN_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_GUNSHIP_JUMP_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_GUNSHIP_JUMP_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_GUNSHIP_WAIT_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_GUNSHIP_WAIT_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_GUNSHIP_AGGRO_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_GUNSHIP_AGGRO_MSG"] .. "\' 를 공격대 경보한다.";	

	RL_ZONE_ICC_DEATHBRINGER_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DEATHBRINGER_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_DEATHBRINGER_AGGRO_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DEATHBRINGER_AGGRO_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_DEATHBRINGER_ICETRAP_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DEATHBRINGER_ICETRAP_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_DEATHBRINGER_HEAL_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DEATHBRINGER_HEAL_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_DEATHBRINGER_HOP_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DEATHBRINGER_HOP_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_DEATHBRINGER_ADD_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DEATHBRINGER_ADD_MSG"] .. "\' 를 공격대 경보한다.";

	RL_ZONE_ICC_FESTERGUT_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_FESTERGUT_READY_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_FESTERGUT_SPREAD_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_FESTERGUT_SPREAD_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_FESTERGUT_SPORE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_FESTERGUT_SPORE_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_FESTERGUT_GREEN_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_FESTERGUT_GREEN_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_FESTERGUT_AGGRO_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_FESTERGUT_AGGRO_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_FESTERGUT_NO_SPORE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_FESTERGUT_NO_SPORE_MSG"] .. "\' 를 공격대 경보한다.";	

	RL_ZONE_ICC_ROTFACE_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_ROTFACE_READY_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_ROTFACE_SPREAD_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_ROTFACE_SPREAD_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_ROTFACE_OOZE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_ROTFACE_OOZE_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_ROTFACE_ACID_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_ROTFACE_ACID_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_ROTFACE_RUN_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_ROTFACE_RUN_MSG"] .. "\' 를 공격대 경보한다.";	

	RL_ZONE_ICC_PROFESSOR_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_PROFESSOR_READY_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_PROFESSOR_DRIBBLE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_PROFESSOR_DRIBBLE_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_PROFESSOR_MOVE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_PROFESSOR_MOVE_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_PROFESSOR_GREEN_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_PROFESSOR_GREEN_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_PROFESSOR_RED_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_PROFESSOR_RED_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_PROFESSOR_HOP_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_PROFESSOR_HOP_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_PROFESSOR_AGGRO_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_PROFESSOR_AGGRO_MSG"] .. "\' 를 공격대 경보한다.";	

	RL_ZONE_ICC_COUNCIL_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_COUNCIL_READY_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_COUNCIL_KINETIC_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_COUNCIL_KINETIC_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_COUNCIL_RUN_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_COUNCIL_RUN_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_COUNCIL_NO_AOE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_COUNCIL_NO_AOE_MSG"] .. "\' 를 공격대 경보한다.";	

	RL_ZONE_ICC_BLOODQUEEN_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_BLOODQUEEN_READY_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_BLOODQUEEN_LINK_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_BLOODQUEEN_LINK_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_BLOODQUEEN_RUN_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_BLOODQUEEN_RUN_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_BLOODQUEEN_BITE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_BLOODQUEEN_BITE_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_BLOODQUEEN_DISPELL_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_BLOODQUEEN_DISPELL_MSG"] .. "\' 를 공격대 경보한다.";	

	RL_ZONE_ICC_DREAMWALKER_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DREAMWALKER_READY_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_DREAMWALKER_SUPPRESSOR_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DREAMWALKER_SUPPRESSOR_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_DREAMWALKER_ABOM_AOE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DREAMWALKER_ABOM_AOE_MSG"] .. "\' 를 공격대 경보한다.";	
	RL_ZONE_ICC_DREAMWALKER_PORTAL_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_DREAMWALKER_PORTAL_MSG"] .. "\' 를 공격대 경보한다.";	

	RL_ZONE_ICC_SINDRAGOSA_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_SINDRAGOSA_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_SINDRAGOSA_BEACON_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_SINDRAGOSA_BEACON_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_SINDRAGOSA_HIDE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_SINDRAGOSA_HIDE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_SINDRAGOSA_HOF_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_SINDRAGOSA_HOF_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_SINDRAGOSA_NO_DPS_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_SINDRAGOSA_NO_DPS_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_SINDRAGOSA_DEBUFF_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_SINDRAGOSA_DEBUFF_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_SINDRAGOSA_SINGLE_TOMB_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_SINDRAGOSA_SINGLE_TOMB_MSG"] .. "\' 를 공격대 경보한다.";

	RL_ZONE_ICC_LICHKING_READY_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LICHKING_READY_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LICHKING_PLAGUE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LICHKING_PLAGUE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LICHKING_ENRAGE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LICHKING_ENRAGE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LICHKING_ICE_SPHERE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LICHKING_ICE_SPHERE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LICHKING_BACK_LICH_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LICHKING_BACK_LICH_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LICHKING_DEFILE_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LICHKING_DEFILE_MSG"] .. "\' 를 공격대 경보한다.";
	RL_ZONE_ICC_LICHKING_SOAKING_TOOLTIP = "\'" .. BL["RL_ZONE_ICC_LICHKING_SOAKING_MSG"] .. "\' 를 공격대 경보한다.";
};



