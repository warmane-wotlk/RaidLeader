local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

local beaconTargets = {}
local gasSporeTargets = {}
local phase = 1
local inCombat = false
local f = CreateFrame("Frame")

local function SDBM_SendChatMessage(msg)
	if UnitInRaid("player") == nil then
		msgChannel = "PARTY"
	else 
		local rank = select(2, GetRaidRosterInfo(GetNumRaidMembers()))

		if rank == nil or rank ~= 0 then
			msgChannel = "RAID_WARNING"
		else
			msgChannel = "RAID"
		end
	end

    SendChatMessage(msg, msgChannel);
end

local function SDBM_sort_by_group(n1, n2)
	return RRI_GetRaidSubgroup(n1) < RRI_GetRaidSubgroup(n2)
end


local function SDBM_SetIcon(playerName, num)
	SetRaidTarget(playerName, num)
end

local function SDBM_WarnBeaconTargets()
	local ML = RL_LoadRaidWarningData()
	local msg = ""

	local beaconIcons = 8
	local separate = ""

	if #beaconTargets == 1 then
	    for i, name in ipairs(beaconTargets) do
			SDBM_SetIcon(name, beaconIcons)
			SDBM_SendChatMessage(ML.warningBeaconAlone:format(name, beaconIcons))
	    end
	else
		table.sort(beaconTargets, SDBM_sort_by_group)    
		if #beaconTargets == 2 then
			separate = " ----- "
			for i, name in ipairs(beaconTargets) do
				SDBM_SetIcon(name, beaconIcons)
				msg = msg .. name .. "({rt"  .. tostring(beaconIcons) .. "})"
	      		if i == 1 then
	        		msg = msg .. separate
	      		end
	      		beaconIcons = beaconIcons - 1	
			end
		elseif #beaconTargets == 5 then
			separate = " -- "
			for i, name in ipairs(beaconTargets) do
				SDBM_SetIcon(name, beaconIcons)
				msg = msg .. name .. "({rt"  .. tostring(beaconIcons) .. "})"
				if i == 2 or i == 3 then
					msg = msg .. separate
				else
					msg = msg .. ","
				end
				beaconIcons = beaconIcons - 1		
			end
	    	msg = string.sub(msg, 1, -2)
		elseif #beaconTargets == 6 then
			separate = " -- "
			for i, name in ipairs(beaconTargets) do
				SDBM_SetIcon(name, beaconIcons)
				msg = msg .. name .. "({rt"  .. tostring(beaconIcons) .. "})"
				if i % 2 == 0 then
					msg = msg .. separate
				else
					msg = msg .. ","
				end
				beaconIcons = beaconIcons - 1		
			end
	    	msg = string.sub(msg, 1, -1*string.len(separate)-1)
		else
			printf(L["Error! Unknown # of beacon: "] .. tostring(#beaconTargets))
			table.wipe(beaconTargets)
			return
		end

		SDBM_SendChatMessage(ML["stack together in orders"])
		SDBM_SendChatMessage(msg)
	end
end

function SDBM_WarnGasSporeTargets()
	local ML = RL_LoadRaidWarningData()
	local msg = ""
	local places = {ML["left"], ML["tanker"], ML["right"], ML["door"], ML["tanker"]}
	local pos = 0
	local icon = { 1, 8, 2}
	
	local difficulty = RLU_GetDifficulty()
	if (difficulty == "normal10" or difficulty == "heroic10") then
		pos = 3
	end

	for i, name in pairs(gasSporeTargets) do
		SendChatMessage(ML.wispGasSpore:format(icon[i], places[pos+i]), "WHISPER", GetDefaultLanguage("player"), name)
		msg = msg ..name .. " ==> " .. places[pos+i] .. "({rt" .. tostring(icon[i]) .. "}),"
		if i >= 3 then break end
	end
	SDBM_SendChatMessage(warningGasSpore)
	SDBM_SendChatMessage(string.sub(msg, 1, -2))
end

local function SDBM_GetUnitCreatureId(uId)
	local guid = UnitGUID(uId)
	return (guid and tonumber(guid:sub(9, 12), 16)) or 0
end

local function SDBM_UNIT_HEALTH(uId)
	if uId == nil then return end
	local creatureId = SDBM_GetUnitCreatureId(uId)
	if creatureId == 36853 then 	-- sindragosa
		if UnitHealth(uId) / UnitHealthMax(uId) <= 0.35 then
			phase = 2
		else
			phase = 1
		end
	end
end

local function SDBM_SPELL_AURA_APPLIED(spellID, destName)
	local ML = RL_LoadRaidWarningData()
	if spellID == 70126 then
		beaconTargets[#beaconTargets + 1] = destName
		SendChatMessage(ML.wispBeacon, "WHISPER", GetDefaultLanguage("player"), destName)
		if phase == 1 then
			local difficulty = RLU_GetDifficulty()
			if (difficulty == "normal25" and #beaconTargets >= 5) or (difficulty == "heroic25" and #beaconTargets >= 6) or ((difficulty == "normal10" or difficulty == "heroic10") and #beaconTargets >= 2) then
				SDBM_WarnBeaconTargets()
			end
		elseif phase == 2 then--Phase 2 there is only one icon/beacon, don't use sorting method if we don't have to.
			SDBM_WarnBeaconTargets()
		end
	elseif (spellID == 70447) or (spellID == 72836) or (spellID == 72837) or (spellID == 72838) then    --Green Slime
--		SendChatMessage(ML.wispBeacon, "WHISPER", GetDefaultLanguage("player"), destName)
		SDBM_SetIcon(destName, 8)
		SDBM_SendChatMessage(ML.warningGreenOoze:format(destName, 8))
	elseif (spellID == 70672) or (spellID == 72455) or (spellID == 72832) or (spellID == 72833) then	--Red Slime
		SendChatMessage(ML.wispRedOoze, "WHISPER", GetDefaultLanguage("player"), destName)
		SDBM_SetIcon(destName, 7)
		SDBM_SendChatMessage(ML.warningRedOoze:format(destName, 7))
	elseif (spellID == 69674) or (spellID == 71224) or (spellID == 73022) or (spellID == 73023) then    --Mutated Infection
		SendChatMessage(ML.wispMutatedInfection, "WHISPER", GetDefaultLanguage("player"), destName)
		SDBM_SetIcon(destName, 8)
		SDBM_SendChatMessage(ML.warningMutatedInfection:format(destName, 8))
	elseif spellID == 69279 then --gas spore
		gasSporeTargets[#gasSporeTargets + 1] = destName
		local difficulty = RLU_GetDifficulty()
		if ( (difficulty == "normal25" or difficulty == "heroic25") and #gasSporeTargets >= 3) or ((difficulty == "normal10" or difficulty == "heroic10") and #beaconTargets >= 2) then
			SDBM_WarnGasSporeTargets()
		end
	end
end

local function SDBM_SPELL_AURA_REMOVED(spellID, destName)
	if spellID == 70126 then
		for _, name in ipairs(beaconTargets) do
			SDBM_SetIcon(name, 0)
		end
		table.wipe(beaconTargets)
	elseif (spellID == 70447) or (spellID == 72836) or (spellID == 72837) or (spellID == 72838) then    --Green Slime
		SDBM_SetIcon(destName, 0)
	elseif (spellID == 70672) or (spellID == 72455) or (spellID == 72832) or (spellID == 72833) then	--Red Slime
		SDBM_SetIcon(destName, 0)
	elseif (spellID == 69674) or (spellID == 71224) or (spellID == 73022) or (spellID == 73023) then    --Mutated Infection
		SDBM_SetIcon(destName, 0)
	elseif spellID == 69279 then --gas spore
		for _, name in ipairs(gasSporeTargets) do
			SDBM_SetIcon(name, 0)
		end
		table.wipe(gasSporeTargets)
	end
end

local function SDBM_COMBAT_LOG_EVENT_UNFILTERED(timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)
	local spellID, spellName, spellSchool, auraType = ...

	-- printf("[eventType:" .. eventType .. "] - spellID: " .. spellID .. ", to: " .. ( destName and destName or "none") )
	if eventType == "SPELL_AURA_APPLIED" then
		SDBM_SPELL_AURA_APPLIED(spellID, destName)	
	elseif eventType == "SPELL_AURA_REMOVED" then
		SDBM_SPELL_AURA_REMOVED(spellID, destName)
	end
end

function SDBM_UseDBM(use)
	if use then
		f:RegisterEvent("UNIT_HEALTH")
		f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	else
		f:UnregisterEvent("UNIT_HEALTH")
		f:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	end
end

function SDBM_OnCombatStart()
	printf("SDBM_OnCombatStart")
	if not inCombat then
		phase = 1
		inCombat = true
		table.wipe(beaconTargets)
		table.wipe(gasSporeTargets)
	end
end

function SDBM_OnCombatEnd()
	printf("SDBM_OnCombatEnd")
	inCombat = false
end

f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:SetScript("OnEvent", function(self, event, ...)
	if event == "UNIT_HEALTH" then
		local unit = select(1, ...)
		SDBM_UNIT_HEALTH(unit)
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		SDBM_COMBAT_LOG_EVENT_UNFILTERED(...)
	elseif event == "PLAYER_REGEN_DISABLED" then
		SDBM_OnCombatStart()
	elseif event == "PLAYER_REGEN_ENABLED" then
		printf("UnitAffectingCombat - " .. tostring(UnitAffectingCombat("player")))
		SDBM_OnCombatEnd()
	end
end)
