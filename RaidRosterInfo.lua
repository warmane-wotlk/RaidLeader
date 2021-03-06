local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

local LibGT = LibStub("LibGroupTalents-1.0")

if not LibGT then 
  print(L["Error failed to load LibGroupTalents"]) 
  return 
end

local testMode       = false
local g_raid_has_disc = false

local g_playersInfo  = {}
local g_assigedTanks = {}
local g_foundTanks   = {}
local g_healersInfo  = {}

local g_paladinInfo  = {}
local g_druidInfo    = {}
local g_priestInfo   = {}
local g_warriorInfo  = {}
local g_warlockInfo  = {}


local g_deadRaiderInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }

local g_bloodlustInfo  = { ready = true, timestamp = 0 }
local g_soulstoneInfo  = {}
local g_resurrectInfo  = {}
local bRaidRosterInitialize = false

function RRI_SaveVariablesData()
  RaidLeaderData.cooldown.bloodlust = g_bloodlustInfo
  RaidLeaderData.cooldown.soulstone = g_soulstoneInfo
  RaidLeaderData.cooldown.resurrect = g_resurrectInfo
end

function RRI_LoadSavedVariablesData()
  g_bloodlustInfo = RaidLeaderData.cooldown.bloodlust
  g_soulstoneInfo = RaidLeaderData.cooldown.soulstone
  g_resurrectInfo = RaidLeaderData.cooldown.resurrect
end

local function RRI_UpdateRoleType(unitId, name, role, className, playerInfo)
  local roleType = "DPS"
  local roleTypeIdx = ""
  if role == "MAINTANK" or role == "MAINASSIST" or role == "tank" or role == "TANKER" then
    roleType = "TANKER"
    playerInfo.numTanker = playerInfo.numTanker + 1
    roleTypeIdx = roleType .. playerInfo.numTanker
  elseif role == "HEALER" or role == "healer" then
    roleType = "HEALER"
    playerInfo.numHealer = playerInfo.numHealer + 1
    roleTypeIdx = roleType .. playerInfo.numHealer
  else
    roleType = "DPS"
    playerInfo.numDps = playerInfo.numDps + 1
    roleTypeIdx = roleType .. playerInfo.numDps
  end

  playerInfo.totalNum = playerInfo.totalNum + 1
  playerInfo.data[roleTypeIdx] = { name = name, id = unitId, role = roleType, className = className}
end

local function RRI_InitializeRaidRosterInfo()
--  RL_INFO(L["Update Raid Roaster Info"])
  bRaidRosterInitialize = true

  local isRaid  = UnitInRaid("player")

  local raid_size = isRaid and GetNumRaidMembers() or GetNumPartyMembers() + 1
  local prefix_unitId = isRaid and "raid" or "party"

  wipe(g_playersInfo)
  wipe(g_assigedTanks)
  wipe(g_healersInfo)
  wipe(g_foundTanks)
  for i = 1, raid_size do
    local unitId = prefix_unitId .. i
    local guid   = UnitGUID(unitId)
    local name, _, subgroup, _, _, className, _, _, _, tanker, _ = GetRaidRosterInfo(i)

    if name then
      if tanker == nil then tanker = "" end
      if tanker == "MAINTANK" or tanker == "MAINASSIST" then
        g_assigedTanks[tanker] = { name = name, className = className, guid = guid}
      end

      local role = LibGT:GetUnitRole(unitId)
      if role == nil then role = "tbd" end

      if role == "caster" or role == "melee" then role = "DPS" end
      local data = { unitId = unitId, guid = guid, subgroup = subgroup, className = className, tanker = tanker, role = role }

      --RL_INFO("unitId: " .. unitId .. ", name:" .. tostring(name) .. " , subgroup: " .. subgroup .. ", role:" .. tostring(role) .. ", className: " .. className .. ", tanker: " .. tostring(tanker) )
      g_playersInfo[name] = data

      if role == "healer" then
        table.insert(g_healersInfo, { name = name, className = className, guid = guid})
      elseif role == "tank" then
        table.insert(g_foundTanks, { name = name, className = className, guid = guid})
      end
    end
  end
end

local function RRI_GetRaidRosterInfo()
  if next(g_playersInfo) == nil then
    RL_INFO(L["Fatal - Failed to load roster info"])
    return
  end

  wipe(g_paladinInfo)
  wipe(g_druidInfo)
  wipe(g_priestInfo)
  wipe(g_warriorInfo)
  wipe(g_warlockInfo)

  g_raid_has_disc = false

  g_paladinInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_druidInfo   = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_priestInfo  = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_warriorInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_warlockInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }

  for name, player in pairs(g_playersInfo) do    
    local unitId     = player.unitId
    local name       = name
    local subgroup   = player.subgroup
    local className  = player.className
    local tanker     = player.tanker
    local talentRole = player.role
    local role       = ( tanker == nil or tanker == "" ) and "DPS" or tanker

    if name then
      if className == "PALADIN" then
        if subgroup == 5 or ( talentRole == "healer" ) then role = "HEALER" end
        RRI_UpdateRoleType(unitId, name, role, className, g_paladinInfo)
      elseif className == "DRUID" then
        if subgroup == 5 or ( talentRole == "healer" ) then role = "HEALER" end
        RRI_UpdateRoleType(unitId, name, role, className, g_druidInfo)
      elseif className == "PRIEST" then
        if subgroup == 5 or ( talentRole == "healer" ) then role = "HEALER" end
        local talent = select(3, LibGT:GetTalentTabInfo(unitId, 1))
        if talent and talent >= 51 and role == "HEALER" then  g_raid_has_disc = true end
        RRI_UpdateRoleType(unitId, name, role, className, g_priestInfo)
      elseif className == "WARRIOR" then
        RRI_UpdateRoleType(unitId, name, role, className, g_warriorInfo)
      elseif className == "WARLOCK" then
        RRI_UpdateRoleType(unitId, name, role, className, g_warlockInfo)
      end

      --print("unitId: " .. unitId .. ", name:" .. name .. ", role:" .. role .. ", class: " .. className)
    end
  end
end

function RRI_UpdateRaidRosterInfo(bForce)
  if bForce or not bRaidRosterInitialize then
    RRI_InitializeRaidRosterInfo()
    RRI_GetRaidRosterInfo()
  end
end

function RRI_AreTankersInRaid()
  local tankers = 0
  local mt = g_assigedTanks["MAINTANK"] and g_assigedTanks["MAINTANK"] or g_foundTanks[1]
  local ot = g_assigedTanks["MAINASSIST"] and g_assigedTanks["MAINASSIST"] or g_foundTanks[2]

  if mt then tankers = tankers + 1 end
  if ot then tankers = tankers + 1 end

  return tankers
end

function RRI_GetPaladinInfo()
  return g_paladinInfo
end

function RRI_GetDruidInfo()
  return g_druidInfo
end

function RRI_GetHealersInfo()
  return g_healersInfo
end

function RRI_GetFoundTankInfo()
  return g_foundTanks
end

function RRI_GetAssignedTankInfo()
  return g_assigedTanks
end

function RRI_GetRaidPlayerInfo()
  return g_playersInfo
end


function RRI_Get2NonPallyHealersForFestergut()
  local healers = {}
  local pallyHealer = ""
  local n = 1
  for _,v in pairs(g_healersInfo) do
    if v.className == "PALADIN" then
      pallyHealer = v.name
    else
      healers[n] = v.name
      n = n + 1
    end
  end
  if n == 2 then
    healers[2] = pallyHealer
  end

  return healers
end

function RRI_GetTankerInfo(param)
  if param == "MT" then 
    return g_assigedTanks["MAINTANK"] and g_assigedTanks["MAINTANK"] or g_foundTanks[1]
  elseif param == "OT" then
    return g_assigedTanks["MAINASSIST"] and g_assigedTanks["MAINASSIST"] or g_foundTanks[2]
  else
    return nil
  end
end

function RRI_GetRaidSubgroup(name)
  name = name or UnitName("player")
  return (g_playersInfo[name] and g_playersInfo[name].subgroup) or 0  
end

-- return Orders -- TANKER1, TANKER2, ... , HEALER1, HEALER2, ..., DPS1, DPS2 ...
function RRI_GetIdxOrder(playerInfo)
  local idxOrders = {}
  local idx = 1

  for i = 1, playerInfo.numTanker do
    idxOrders[idx] = "TANKER" .. i
    idx = idx + 1
  end

  for i = 1, playerInfo.numHealer do
    idxOrders[idx] = "HEALER" .. i
    idx = idx + 1
  end

  for i = 1, playerInfo.numDps do
    idxOrders[idx] = "DPS" .. i
    idx = idx + 1
  end

  return idxOrders
end

function RRI_GetDeadRaiderInfo()
  return g_deadRaiderInfo
end

-- test code
function RRI_test_UpdateDeadRaider()
  local healers = 0
  local tankers = 0
  local total   = 0
  for i,v in pairs(g_deadRaiderInfo.data) do
    if v.role == "HEALER" then healers = healers + 1
    elseif v.role == "TANKER" then tankers = tankers + 1
    end 
    total = total + 1
  end
  g_deadRaiderInfo.totalNum = total
  g_deadRaiderInfo.numHealer = healers
  g_deadRaiderInfo.numTanker = tankers
  g_deadRaiderInfo.numDps = total - healers - tankers

  return g_deadRaiderInfo
end


function RRI_UpdateAllDeadRaiderInfo()
  if testMode then return RRI_test_UpdateDeadRaider() end

  wipe(g_deadRaiderInfo)
  g_deadRaiderInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  for n,v in pairs(g_playersInfo) do
    if UnitIsDeadOrGhost(n) then
      local role = v.tanker and v.tanker or v.role
      RRI_UpdateRoleType(v.unitId, n, role, v.className, g_deadRaiderInfo)
    end
  end
  return g_deadRaiderInfo
end

function RRI_AddDeadRaiderInfo(name)
  for _,v in pairs(g_deadRaiderInfo.data) do
    if name == v.name then return nil, nil end
  end

  for n,v in pairs(g_playersInfo) do
    --print("name: " .. n ..", tanker:" .. tostring(v.tanker) .. ", role: " .. tostring(v.role))
    if n == name then
      local role = (v.tanker ~= nil and v.tanker ~= "") and v.tanker or v.role
      RRI_UpdateRoleType(v.unitId, n, role, v.className, g_deadRaiderInfo)
      return role, v.className
    end
  end

  return nil, nil
end

function RRI_ResetCombatBasedInfo()
  wipe(g_resurrectInfo)
  wipe(g_soulstoneInfo)
  g_bloodlustInfo.ready = true
  g_bloodlustInfo.timestamp = 0
end

------- combat ress
function RRI_SetDruidCRCooldown(name, timestamp)
  if g_druidInfo.data == nil or not next(g_druidInfo.data) then return end

  for _, v in pairs(g_druidInfo.data) do
    if v.name == name then
      g_resurrectInfo[name] = { name = name, ready = false, timestamp = timestamp, called = false, destName = "" }
      break
    end
  end
end

function RRI_GetNextCRAvailableDruid(destName)
  if g_druidInfo.data == nil or not next(g_druidInfo.data) then return nil end

  for _, v in pairs(g_druidInfo.data) do
    local CR = g_resurrectInfo[v.name]
    if CR == nil or ( CR.ready and 
      ( not CR.called or ( CR.called and (CR.destName == nil or CR.destName == "" or CR.destName == destName))) ) then
      if UnitIsDeadOrGhost(v.name) == nil and UnitIsConnected(v.name) then
        g_resurrectInfo[v.name] = { name = v.name, ready = true, timestamp = 0, called = true, destName = destName }
        return v.name
      end
    end
  end
  return nil
end

function RRI_UpdateDruidCRCooldown(timestamp)
  if not next(g_resurrectInfo) then return end

  local COOLDOWN_10_MINS = 600
  for _, CR in pairs(g_resurrectInfo) do
    if CR and CR.ready == false and (timestamp - CR.timestamp) > COOLDOWN_10_MINS then
      CR.ready = true
      CR.timestamp = 0
    end
  end  
end

------- soul stone
function RRI_SetWarlockSSCooldown(name, timestamp)
  if g_warlockInfo.data == nil or not next(g_warlockInfo.data) then return end

  for _, v in pairs(g_warlockInfo.data) do
    if v.name == name then
      g_soulstoneInfo[name] = { name = name, ready = false, timestamp = timestamp, called = false, destName = "" }
      break
    end
  end
end

function RRI_GetNextAvailableSSWarlock(destName)
  if g_warlockInfo.data == nil or not next(g_warlockInfo.data) then return nil end

  for _, v in pairs(g_warlockInfo.data) do
    local SS = g_soulstoneInfo[v.name]
    if SS == nil or ( SS.ready and
      ( not SS.called or ( SS.called and (SS.destName == nil or SS.destName == "" or SS.destName == destName))) ) then
      if UnitIsDeadOrGhost(v.name) == nil and UnitIsConnected(v.name) then
        g_soulstoneInfo[v.name] = { name = v.name, ready = true, timestamp = 0, called = true, destName = destName }
        return v.name
      end
    end
  end
  return nil
end

function RRI_UpdateWarlockSSCooldown(timestamp)
  if not next(g_soulstoneInfo) then return end

  local COOLDOWN_15_MINS = 900
  for _, SS in pairs(g_soulstoneInfo) do
    if SS and SS.ready == false and (timestamp - SS.timestamp) > COOLDOWN_15_MINS then
      SS.ready = true
      SS.timestamp = 0
    end
  end
end


------- bloodlust
function RRI_SetBloodlustUsed(timestamp)
  g_bloodlustInfo = { ready = false, timestamp = timestamp }
end

function RRI_UpdateBloodlustTime(timestamp)
  local COOLDOWN_5_MINS = 300
  if g_bloodlustInfo.ready == false and (timestamp - g_bloodlustInfo.timestamp) > COOLDOWN_5_MINS then
    g_bloodlustInfo.ready = true
    g_bloodlustInfo.timestamp = 0
  end
end

function RRI_IsBloodlustReady()
  local COOLDOWN_5_MINS = 300
  local readyTime = math.floor(COOLDOWN_5_MINS - time() + g_bloodlustInfo.timestamp)
  return g_bloodlustInfo.ready, readyTime
end

-------------------------------------- TEST MODE ----------------------------------------------------
-- test combat ress
-- do /script RRI_test_build_roaster();RRI_test_build_dead()
-- do /script RL_DeadListFrame_AddDeadRaider("TestName3"), /script RL_DeadListFrame_AddDeadRaider("TestName1"), ...
-- do /script RL_DeadListFrame_Info_ShowDeadRaidersList()      for who dead
-- do /script RRI_test_show_deadlist() or /script RRI_test_build_dead()
-----------------------------------------------------------------------------------------------------
function RRI_test_Off_mode()
  testMode = false
end

function RRI_test_build_roaster()
  local className = { "PALADIN", "HUNTER", "MAGE", "DRUID", "PRIEST", "WARRIOR", "DEATHKNIGHT", "ROGUE", "WARLOCK", "SHAMAN"}

  testMode = true

  for i = 1, 25 do
    local tanker = nil
    local role = "DPS"
    local name = "TestName"..i

    if i == 6 or i == 7 then tanker = "TANKER"; role = "TANKER" end
    if (i-1)%5+1 == 5 then role = "HEALER" end

    g_playersInfo[name]= { unitId = "raid"..i, guid = "guid"..i, subgroup = (i-1)%5+1, className = className[(i-1)%#className+1], tanker = tanker, role = role }

    RL_INFO("[FD] " .. name .. ", " .. role .. ", " .. tostring((i-1)%5+1) .. ", " .. className[(i-1)%#className+1] .. ", " .. tostring(tanker) .. ", " .. role)
  end
end

function RRI_test_show_deadlist()
  RL_INFO("total/tank/healer/dps - " .. g_deadRaiderInfo.totalNum .. "/".. g_deadRaiderInfo.numTanker .. "/".. g_deadRaiderInfo.numHealer .. "/" .. g_deadRaiderInfo.numDps)

  for t,v in pairs(g_deadRaiderInfo.data) do
    RL_INFO("name: " .. v.name .. ", role: " .. v.role .. ", class: " .. v.className)
  end
end

function RRI_test_build_dead()
  for i=1, 10 do
    local name = "TestName" .. i
    RL_DeadListFrame_AddDeadRaider(name)
  end
end

function RRI_test_show_playerinfo()
  local i = 1
  for n,v in pairs(g_playersInfo) do
    RL_INFO("RosterInfo[" .. i .. "]".. tostring(n) .. " [" .. v.subgroup .. "/" ..v.className .."]" .. " ,role:" .. tostring(v.role) .. ", tank: " .. tostring(v.tanker) )
    i = i + 1
  end
end

function RRI_test_show_resurrect_info()
  for n,v in pairs(g_resurrectInfo) do
    RL_INFO(n .. ", ready: " .. tostring(v.ready) .. ", timestamp: " .. tostring(v.timestamp) .. ", called: " .. tostring(v.called) .. ", destName: " .. tostring(v.destName))
  end
end

function RRI_test_show_soulstone_info()
  for n,v in pairs(g_soulstoneInfo) do
    RL_INFO(n .. ", ready: " .. tostring(v.ready) .. ", timestamp: " .. tostring(v.timestamp) .. ", called: " .. tostring(v.called) .. ", destName: " .. tostring(v.destName))
  end
end
