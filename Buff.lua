
local LibGT = LibStub("LibGroupTalents-1.0")

if not LibGT then 
  print("Error failed to load LibGroupTalents") 
  return 
end


local g_bUseDrumOfKing = false
local g_raid_tanker_mt
local g_raid_tanker_ot
local g_raid_has_disc = false

local g_paladinInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
local g_druidInfo   = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
local g_priestInfo  = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
local g_warriorInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }

-- return Orders -- TANKER1, TANKER2, ... , HEALER1, HEALER2, ..., DPS1, DPS2 ...
local function Buff_GetIdxOrder(playerInfo)
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


local function Buff_UpdateRoleType(unitId, name, role, playerInfo)
  local roleType = "DPS"
  local roleTypeIdx = ""
  if role == "MAINTANK" or role == "MAINASSIST" then
    if role == "MAINTANK" then
      g_raid_tanker_mt = name
    else
      g_raid_tanker_ot = name
    end
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


local function Buff_UpdateRaidRosterInfo()
  g_paladinInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_druidInfo   = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_priestInfo  = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  g_warriorInfo = { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }  

  local isParty = UnitInParty("player")
  local isRaid  = UnitInRaid("player")

  local raid_size = isRaid and GetNumRaidMembers() or GetNumPartyMembers() + 1
  local prefix_unitId = isRaid and "raid" or "party"

  for i = 1, raid_size do
    local unitId = prefix_unitId .. i
    local name, _, subgroup, _, _, fileName, _, _, _, role, _ = GetRaidRosterInfo(i)

    if i == raid_size then unitId = "player" end

    if name then
      if not role then role = "DPS" end

      if fileName == "PALADIN" then
        local talent = select(3, LibGT:GetTalentTabInfo(unitId, 1))
        if subgroup == 5 or ( talent and talent >= 51 ) then role = "HEALER" end
        Buff_UpdateRoleType(unitId, name, role, g_paladinInfo)
      elseif fileName == "DRUID" then
        local talent = select(3, LibGT:GetTalentTabInfo(unitId, 3))
        if subgroup == 5 or ( talent and talent >= 51 ) then role = "HEALER" end
        Buff_UpdateRoleType(unitId, name, role, g_druidInfo)
      elseif fileName == "PRIEST" then
        local talent = select(3, LibGT:GetTalentTabInfo(unitId, 3))
        if subgroup == 5 or ( talent and talent < 51 ) then role = "HEALER" end
        talent = select(3, LibGT:GetTalentTabInfo(unitId, 1))
        if talent and talent >= 51 then  g_raid_has_disc = true end
        Buff_UpdateRoleType(unitId, name, role, g_priestInfo)
      elseif fileName == "WARRIOR" then
        Buff_UpdateRoleType(unitId, name, role, g_warriorInfo)
      end

      --print("unitId: " .. unitId .. ", name:" .. name .. ", role:" .. role .. ", class: " .. fileName)      
    end
  end
end

-- Paladin Buffer/Auroa order
function Buff_Get_Paladin_Orders()
  local buffMsg = "Paladin Buff Order : "
  local buffOrder
  local _RL = RL_LoadPaladinBuffData()

  -- Update raid info
  Buff_UpdateRaidRosterInfo()

  local roleOrders = Buff_GetIdxOrder(g_paladinInfo)

  if g_paladinInfo.totalNum == 1 then
    local data = g_paladinInfo.data[ roleOrders[1] ]
    if data then
      if g_bUseDrumOfKing then
        buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"]
      else
        buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"]
      end
    end
  elseif g_paladinInfo.totalNum == 2 then
    if g_paladinInfo.numTanker == 0 then
      local data = g_paladinInfo.data[ roleOrders[1] ]
      if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
      data = g_paladinInfo.data[ roleOrders[2] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
    else
      local data = g_paladinInfo.data[ roleOrders[1] ]
      if g_bUseDrumOfKing and not g_raid_has_disc then
        if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
      else
        if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
      end        
      data = g_paladinInfo.data[ roleOrders[2] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
    end
  elseif g_paladinInfo.totalNum == 3 then
    if g_paladinInfo.numTanker == 0 then
      local data = g_paladinInfo.data[ roleOrders[1] ]
      if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
      data = g_paladinInfo.data[ roleOrders[2] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
      data = g_paladinInfo.data[ roleOrders[3] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
    else
      if g_raid_has_disc then
        if g_paladinInfo.numTanker == 2 and g_paladinInfo.numHealer == 1 then
          local data = g_paladinInfo.data[ roleOrders[1] ]
          if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
          data = g_paladinInfo.data[ roleOrders[2] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
          data = g_paladinInfo.data[ roleOrders[3] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
        else
          local data = g_paladinInfo.data[ roleOrders[1] ]
          if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
          data = g_paladinInfo.data[ roleOrders[2] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
          data = g_paladinInfo.data[ roleOrders[3] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
        end
      else
        if g_paladinInfo.numTanker == 2 and g_paladinInfo.numHealer == 1 then
          local data = g_paladinInfo.data[ roleOrders[1] ]
          if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
          data = g_paladinInfo.data[ roleOrders[2] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
          data = g_paladinInfo.data[ roleOrders[3] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
        else
          local data = g_paladinInfo.data[ roleOrders[1] ]
          if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
          data = g_paladinInfo.data[ roleOrders[2] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
          data = g_paladinInfo.data[ roleOrders[3] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
        end        
      end
    end
  elseif g_paladinInfo.totalNum >= 4 then
    if g_paladinInfo.numTanker == 0 then
      local data = g_paladinInfo.data[ roleOrders[1] ]
      if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
      data = g_paladinInfo.data[ roleOrders[2] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
      data = g_paladinInfo.data[ roleOrders[3] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
    else
      if g_paladinInfo.numTanker == 1 and g_paladinInfo.numHealer == 1 then
        local data = g_paladinInfo.data[ roleOrders[1] ]
        if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
        data = g_paladinInfo.data[ roleOrders[2] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
        data = g_paladinInfo.data[ roleOrders[3] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_FIRE"] end
        data = g_paladinInfo.data[ roleOrders[4] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_FROST"] end
      else
        local data = g_paladinInfo.data[ roleOrders[1] ]
        if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
        data = g_paladinInfo.data[ roleOrders[2] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_FIRE"] end
        data = g_paladinInfo.data[ roleOrders[3] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
        data = g_paladinInfo.data[ roleOrders[4] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_FROST"] end
      end        
    end
  end

  if buffOrder then
    local chatType = "RAID_WARNING"
    buffMsg = buffMsg .. buffOrder
    SendChatMessage(buffMsg, chatType)
  else
    print(L["No Pally here"])
  end
end



--[[
---------------------- test code -------------------

-- testCase format : xMxTxHxDxKxC   
-- (M -- total, T -- tanker, H -- healer, D -- DPS, K -- drum of King, C -- DISC )
function Buff_Test_UpdateRaidRosterInfo(testCase)
  g_paladinInfo =  { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  
  local totalNum = testCase:sub(1,1)
  local numTanker = testCase:sub(3,3)
  local numHealer = testCase:sub(5,5)
  local numDps = testCase:sub(7,7)
  g_bUseDrumOfKing = testCase:sub(9,9) == "1"
  g_raid_has_disc = testCase:sub(11,11) == "1"

  print("total:" .. g_paladinInfo.totalNum .. ", Tanker:" .. numTanker .. " ,Healer:" .. numHealer .. ", DPS:" .. numDps .. ", Drum:" .. tostring(g_bUseDrumOfKing) .. ", disc:" .. tostring(g_raid_has_disc) )

  for i = 1, numTanker do
    local unitId = "raid" .. i
    local name = "TANKER" .. i
    local role = "MAINTANK"
    Buff_UpdateRoleType(unitId, name, role, g_paladinInfo)
  end

  for i = 1, numHealer do
    local unitId = "raid" .. i
    local name = "HEALER" .. i
    local role = "HEALER"
    Buff_UpdateRoleType(unitId, name, role, g_paladinInfo)
  end

  for i = 1, numDps do
    local unitId = "raid" .. i
    local name = "DPS" .. i
    local role = "DPS"
    Buff_UpdateRoleType(unitId, name, role, g_paladinInfo)
  end  

  --print("g_paladinInfo.totalNum: " .. g_paladinInfo.totalNum)
end


testCase1 = {"1M1T0H0D0K0C", "1M0T1H0D0K0C", "1M0T0H1D0K0C",
            "1M1T0H0D1K0C", "1M0T1H0D1K0C", "1M0T0H1D1K0C"}

testCase2 = {"2M2T0H0D0K0C", "2M1T1H0D0K0C", "2M1T0H1D0K0C",
            "2M0T2H0D0K0C", "2M0T1H1D0K0C", "2M0T0H2D0K0C",
            "2M2T0H0D1K0C", "2M1T1H0D1K0C", "2M1T0H1D1K0C",
            "2M0T2H0D1K0C", "2M0T1H1D1K0C", "2M0T0H2D1K0C",
            "2M2T0H0D0K1C", "2M1T1H0D0K1C", "2M1T0H1D0K1C",
            "2M0T2H0D0K1C", "2M0T1H1D0K1C", "2M0T0H2D0K1C",
            "2M2T0H0D1K1C", "2M1T1H0D1K1C", "2M1T0H1D1K1C",
            "2M0T2H0D1K1C", "2M0T1H1D1K1C", "2M0T0H2D1K1C"}
            
testCase3 = {                "3M2T1H0D0K0C", "3M2T0H1D0K0C",
            "3M1T2H0D0K0C", "3M1T1H1D0K0C", "3M1T0H2D0K0C",
            "3M0T3H0D0K0C", "3M0T2H1D0K0C", "3M0T1H2D0K0C",
            "3M0T0H3D0K0C", 
                            "3M2T1H0D0K1C", "3M2T0H1D0K1C",
            "3M1T2H0D0K1C", "3M1T1H1D0K1C", "3M1T0H2D0K1C",
            "3M0T3H0D0K1C", "3M0T2H1D0K1C", "3M0T1H2D0K1C",
            "3M0T0H3D0K1C"}

testCase4 = {"4M2T2H0D0K0C", "4M2T1H1D0K0C", "4M2T0H2D0K0C",
            "4M1T3H0D0K0C", "4M1T2H1D0K0C", "4M1T1H2D0K0C",
            "4M1T0H3D0K0C", "4M0T4H0D0K0C", "4M0T3H1D0K0C",
            "4M0T2H2D0K0C", "4M0T1H3D0K0C", "4M0T0H4D0K0C"}

testCase = { testCase1, testCase2, testCase3, testCase4 }
for k = 1, 4 do
  for i = 1, table.getn(testCase[k]) do
    -- print(testCase[k][i])
    Buff_Get_Paladin_Orders(testCase[k][i])
  end
end

--]]