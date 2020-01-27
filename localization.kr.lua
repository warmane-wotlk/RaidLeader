local L = LibStub("AceLocale-3.0"):NewLocale("RaidLeader", "koKR", false)

if L then
	-- during raid - common
	L["RL_BUTTON_BLOODLUST"] = "블러드"
	L["RL_BUTTON_COMBAT_RESS"] = "전부"
	L["RL_BUTTON_CURE_DISEASE"]  = "질병"
	L["RL_BUTTON_CURE_POISON"]  = "독해제"
	L["RL_BUTTON_CURE_CURSE"]  = "저주해제"
	L["RL_BUTTON_DISPELL"] = "마법해제"
	L["RL_BUTTON_DPS_ADD"]  = "딜! 쫄"
	L["RL_BUTTON_MOVE_UR_ASS"] = "움직여"
	L["RL_BUTTON_STOP_DPS"] = "딜! 금지"
	L["RL_BUTTON_WIPE"]  = "WIPE"
	L["RL_BUTTON_MD_TOT"]  = "눈속/속거"
	L["RL_BUTTON_TANK_AGGRO"]  = "어글"
	L["RL_BUTTON_DPS_BOSS"] = "딜! 보스"

	-- boss
	L["RL_BUTTON_HOP"]  = "보손"
	L["RL_BUTTON_HOF"]  = "자손"
	L["RL_BUTTON_FROST_TRAP"]  = "얼덫"
	L["RL_BUTTON_CYCLONE"]  = "회오리"
	L["RL_BUTTON_TYPOON"]  = "태풍"
	L["RL_BUTTON_DARNAVAN"]  = "다르나반"
	L["RL_BUTTON_SHACKLE"]  = "속박"

	-- before raid
	L["RL_BUTTON_READYCHECK"] = "전준"
	L["RL_BUTTON_PONY_OFF"] = "포니 오라"
	L["RL_BUTTON_DISARM_TRAP"]  = "트랩 해제"
	L["RL_BUTTON_SUMMON"] = "소환"
	L["RL_BUTTON_PALADIN_BUFF"] = "기사 버프"
	L["RL_BUTTON_ETC_BUFF"] = "기타 버프"
	L["RL_BUTTON_FOOD"] = "음식"
	L["RL_BUTTON_MS_CHANGE"] = "주특 변경"
	L["RL_BUTTON_RAID_START"] = "레이드시작"
	L["RL_BUTTON_ROLL_NOW"] = "전리품분배"
	L["RL_BUTTON_HERO_MODE"] = "영웅 모드"
	L["RL_BUTTON_SOULSTONE"] = "영석"
	L["RL_BUTTON_PORTAL"] = "포탈"
	L["RL_BUTTON_SHARE_QUEST"] = "퀘스트"
	L["RL_BUTTON_DBM_PULL"] = "DBM Pull"
	L["RL_BUTTON_MS_CHANGE_NOTIFY"] = "주특 공지"

    -- marks
	L["RL_BUTTON_CLEAR_ICONS"] = "마크 해제"


	-- general
	L["RL_BUTTON_FLOOD_OFF"] = "광고 중단"
	L["RL_BUTTON_FLOOD_ON"] = "공대 광고"
	L["RL_BUTTON_MASTER_LOOT"] = ""
	L["RL_BUTTON_SET_LEADER"] = ""
	L["RL_BUTTON_GROUP_LOOT"] = ""
	L["RL_BUTTON_FREEFORALL_LOOT"] = ""
	L["RL_BUTTON_SET_MT"] = "맨탱"
	L["RL_BUTTON_SET_OT"] = "부탱"
	L["RL_BUTTON_NOTIFY_MT_OT"] = "탱 공지"

	L["RL_BUTTON_TRANSPARENCY"] = "-"
	L["RL_BUTTON_CLOSE"]  = "닫기"
	L["RL_BUTTON_SET_HC_NM"] = "영웅/일반"
	L["RL_CHECKBUTTON_NEED_HEALER"] = "Healer"
	L["RL_CHECKBUTTON_NEED_TANKER"] = "Tanker"
	L["RL_BUTTON_CALL_BOSS_FRAME"] = "보스프레임"

	-- zone name
	L["EE10"] = "영원의 눈 - 10인"
	L["UL10"] = "울두아르 - 10"
	L["OS10"] = "흑요석 - 10"
	L["VOA10"] = "아카본 - 10n"
	L["NAXX10"] = "낙스마스 - 10"
	L["TOC10"] = "십자군 - 10"
	L["ICC10"] = "얼음왕관 - 10"
	L["RS10"] = "루비성소 - 10"
	L["EE25"] = "영원의 눈 - 25"
	L["UL25"] = "울두아르 - 25"
	L["OS25"] = "흑요석 - 25"
	L["VOA25"] = "아카본 - 25"
	L["NAXX25"] = "낙스마스 - 25"
	L["TOC25"] = "십자군 - 25"
	L["ICC25"] = "얼음왕관 - 25"
	L["RS25"] = "루비성소 - 25"

	-- print
	L["Choose instance first"] = "레이드 지역명을 선택해주세요."
	L["Not In Instance, so just toggle"] = "레이드 인스턴스가 아님으로 그냥 토글합니다."
	L["No Pally here"] = "성기사가 없습니다."
	L["Please join global channel and then try again"] = "global 채널에 참여 후 공대 모집해주세요."
	L["Please choose the raid instance"] = "레이드 인스턴스를 선택 후 공대 모집해주세요."
	L["Please type /mt to assign MT"] = "맨탱 지정을 위해서 /mt를 입력하세요. (취소는 /clearmt)"
	L["Please type /ma to assign OT"] = "부탱 지정을 위해서 /ma를 입력하세요. (취소는 /clearma)"
	L["Click to toggle RaidLeader"] = "RaidLeader 화면을 on/off 합니다."
	L["Error failed to load LibGroupTalents"] = "LibGroupTalents가 libs퐅더밑에 없습니다."
	L["Please choose the target"] = "목표를 먼저 설정해주세요."
	L["Reset MS Change Informations"] = "주특 변경정보를 초기화했습니다."
	L["Expire MS Change Time"] = "주특 변경 시간(1분)이 끝났습니다."

	L["Type my MS Change if you want"] = "변경하고자 하는 당신의 주특정보를 넣으세요."
	L["My MS Change"] = "주특 변경"
	L["Fatal - Failed to load roster info"] = "에러 - 공격대 정보를 읽어오는데 실패."
	L["Please assign tanker with /mt /ma"] = "맨탱의 경우 /mt, 부탱의 경우 /ma를 이용해서 탱커를 지정해주세요. (취소는 /clearmt, /clearma)"
	L["WOW Error! Need to relog!"] = "월드오브워크래프트 에러 - 재접해주세요."
	L["ERROR - Failed to create button with "] = "ERROR - 버튼 생성 실패함 "
	L["Drums of the Wild"] = "\'야생의 북\' 사용"


	-- boss
	L["Marrowgar"] = "매로우"
	L["Lady"] = "여교주"
	L["GunShip"] = "건쉽"
	L["DeathBringer"] = "사울팽"
	L["Festergut"] = "구린속"
	L["Rotface"] = "썩얼" 
	L["Professor"] = "교수"
	L["Council"] = "피의 의회"
	L["BloodQueen"] = "라나텔" 
	L["Dreamwalker"] = "드림워커"
	L["Sindragosa"] = "신드라고사"
	L["Lich King"] = "리치 왕"

	L["ALL"] = "모두"
	L["BOSS"] = "보스"

	-- Naxxramas
	L["Anub\'Rekhan"] = "아눕레칸"
	L["Grand Widow Faerlina"] = "귀부인 팰리나"
	L["Maexxna"] = "맥스나"
	L["Noth the Plaguebringer"] = "역병술사 노스"
	L["Heigan the Unclean"] = "부정의 헤이건"
	L["Loatheb"] = "로데브"
	L["Instructor Razuvious"] = "훈련교관 라주비어스"
	L["Gothik the Harvester"] = "영혼 착취자 고딕"
	L["The Four Horsemen"] = "4인의 기사단"
	L["Patchwerk"] = "패치워크"
	L["Grobbulus"] = "그라불루스"
	L["Gluth"] = "글루스"
	L["Thaddius"] = "타디우스"
	L["Sapphiron"] = "사피론"
	L["Kel\'Thuzad"] = "켈투자드"	

	-- VOA
	L["Ice Watcher"] = "얼음의 탈라본"
	L["Flame Watcher"] = "화염의 코란론"
	L["Storm Watcher"] = "폭풍의 에말론"
	L["Stone Watcher"] = "바위의 아카본"

	-- Ulduar
	L["Flame Leviathan"] = "거대 화염전차"
	L["Ignis the Furnace Master"] = "이그니스"
	L["Razorscale"] = "칼날 비늘"
	L["XT-002 Deconstructor"] = "XT-002 해체자"
	L["Assembly of Iron"] = "무쇠 평의회"
	L["Kologarn"] = "콜로간"
	L["Auriaya"] = "아우리아야"
	L["Freya"] = "프레이야"
	L["Hodir"] = "호디르"
	L["Mimiron"] = "미미론"
	L["Thorim"] = "토림"
	L["General Vezax"] = "장군 베작스"
	L["Yogg-Saron"] = "요그사론"
	L["Algalon the Observer"] = "알갈론"	

	-- RS
	L["General Zarithrian"] = "자라스리안"
	L["Baltharus the Warborn"] = "발타루스"
	L["Saviana Ragefire"] = "사비아나"
	L["Halion"] = "할리온"

	-- TOC
	L["Northrend Beasts"] = "노스렌드의 야수"
	L["Lord Jaraxxus"] = "군주 자락서스"
	L["Champions"] = "진영대표용사"
	L["Twin Val\'kyr"] = "발키르 쌍둥이"
	L["Anub\'arak"] = "아눕아락"
end


