local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

local LibGT = LibStub("LibGroupTalents-1.0")

if not LibGT then 
  print(L["Error failed to load LibGroupTalents"]) 
  return 
end

local g_bUseDrumOfKing = false
local g_raid_has_disc = false

local g_playersInfo = {}
local g_assigedTanks = {}

local g_paladinInfo = {}
local g_druidInfo   = {}
local g_priestInfo  = {}
local g_warriorInfo = {}


local function RRI_UpdateRoleType(unitId, name, role, playerInfo)
  local roleType = "DPS"
  local roleTypeIdx = ""
  if role == "MAINTANK" or role == "MAINASSIST" then
    roleType = "TANKER"
    playerInfo.numTanker = playerInfo.numTanker + 1
    roleTypeIdx = roleType .. playerInfo.numTanker
  elseif role == "HEALER" then
    roleType = "HEALER"
    playerInfo.numHealer = playerInfo.numHealer + 1
    roleTypeIdx = roleType .. playerInfo.numHealer
  else
    roleType = "DPS"
    playerInfo.numDps = playerInfo.numDps + 1
    roleTypeIdx = roleType .. playerInfo.numDps
  end

  playerInfo.totalNum = playerInfo.totalNum + 1
  
  playerInfo.data[roleTypeIdx] = { name = name, id = unitId, role = roleType}
end

function RRI_InitializeRaidRosterInfo()
  local isRaid  = UnitInRaid("player")

  local raid_size = isRaid and GetNumRaidMembers() or GetNumPartyMembers() + 1
  local prefix_unitId = isRaid and "raid" or "party"

  wipe(g_playersInfo)
  wipe(g_assigedTanks)
  for i = 1, raid_size do
    local unitId = prefix_unitId .. i
    local name, _, subgroup, _, _, className, _, _, _, tanker, _ = GetRaidRosterInfo(i)
    if tanker == nil then tanker = "" end
    if tanker == "MAINTANK" or tanker == "MAINASSIST" then
      g_assigedTanks[tanker] = { name = name, className = className, guid = UnitGUID(unitId)}
    end

    local role = LibGT:GetUnitRole(unitId)
    if role == nil then role = "tbd" end
    local data = { name = name, subgroup = subgroup, className = className, tanker = tanker, role = role }

    -- print("unitId: " .. unitId .. ", name:" .. data.name .. " , subgroup: " .. data.subgroup .. ", role:" .. data.role .. ", className: " .. data.className .. ", tanker: " .. data.tanker )
    g_playersInfo[unitId] = data
  end
end

function RRI_GetRaidRosterInfo()
  if next(g_playersInfo) == nil then
    printf(L["Fatal - Failed to load roster info"])
    return
  end

  wipe(g_paladinInfo)
  wipe(g_druidInfo)
  wipe(g_priestInfo)
  wipe(g_warriorInfo)
  g_raid_has_disc = false

  g_paladinInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_druidInfo   = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_priestInfo  = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_warriorInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }  

  local isRaid  = UnitInRaid("player")

  local raid_size = isRaid and GetNumRaidMembers() or GetNumPartyMembers() + 1
  local prefix_unitId = isRaid and "raid" or "party"

  for i = 1, raid_size do
    local unitId     = prefix_unitId .. i
    local name       = g_playersInfo[unitId].name
    local subgroup   = g_playersInfo[unitId].subgroup
    local className  = g_playersInfo[unitId].className
    local tanker     = g_playersInfo[unitId].tanker
    local talentRole = g_playersInfo[unitId].role
    local role       = tanker == "" and "DPS" or tanker

    if name then
      if className == "PALADIN" then
        if subgroup == 5 or ( talentRole == "healer" ) then role = "HEALER" end
        RRI_UpdateRoleType(unitId, name, role, g_paladinInfo)
      elseif className == "DRUID" then
        if subgroup == 5 or ( talentRole == "healer" ) then role = "HEALER" end
        RRI_UpdateRoleType(unitId, name, role, g_druidInfo)
      elseif className == "PRIEST" then
        if subgroup == 5 or ( talentRole == "healer" ) then role = "HEALER" end
        local talent = select(3, LibGT:GetTalentTabInfo(unitId, 1))
        if talent and talent >= 51 and role == "HEALER" then  g_raid_has_disc = true end
        RRI_UpdateRoleType(unitId, name, role, g_priestInfo)
      elseif className == "WARRIOR" then
        RRI_UpdateRoleType(unitId, name, role, g_warriorInfo)
      end

      --print("unitId: " .. unitId .. ", name:" .. name .. ", role:" .. role .. ", class: " .. className)
    end
  end
end

function RRI_AreTankersInRaid()
  return g_assigedTanks["MAINTANK"] ~= nil and g_assigedTanks["MAINASSIST"] ~= nil
end

function RRI_GetPaladinInfo()
  return g_paladinInfo
end

function RRI_GetDruidInfo()
  return g_druidInfo
end

function RRI_GetTankerInfo(param)
  if param == "MT" then 
    return g_assigedTanks["MAINTANK"]
  elseif param == "OT" then
    return g_assigedTanks["MAINASSIST"]
  else
    return nil
  end
end


