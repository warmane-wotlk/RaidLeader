local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

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

-- Paladin Buffer/Auroa order
function Buff_Get_Paladin_Orders()
  local buffOrder = ""
  local _RL = RL_LoadPaladinBuffData()
  local buffMsg = _RL["Paladin Buff Order : "]

  local paladinInfo = RRI_GetPaladinInfo()

  local roleOrders = Buff_GetIdxOrder(paladinInfo)

  if paladinInfo.totalNum == 1 then
    local data = paladinInfo.data[ roleOrders[1] ]
    if data then
      if g_bUseDrumOfKing then
        buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"]
      else
        buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"]
      end
    end
  elseif paladinInfo.totalNum == 2 then
    if paladinInfo.numTanker == 0 then
      local data = paladinInfo.data[ roleOrders[1] ]
      if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
      data = paladinInfo.data[ roleOrders[2] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
    else
      local data = paladinInfo.data[ roleOrders[1] ]
      if g_bUseDrumOfKing and not g_raid_has_disc then
        if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
      else
        if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
      end        
      data = paladinInfo.data[ roleOrders[2] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
    end
  elseif paladinInfo.totalNum == 3 then
    if paladinInfo.numTanker == 0 then
      local data = paladinInfo.data[ roleOrders[1] ]
      if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
      data = paladinInfo.data[ roleOrders[2] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
      data = paladinInfo.data[ roleOrders[3] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
    else
      if g_raid_has_disc then
        if paladinInfo.numTanker == 2 and paladinInfo.numHealer == 1 then
          local data = paladinInfo.data[ roleOrders[1] ]
          if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
          data = paladinInfo.data[ roleOrders[2] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
          data = paladinInfo.data[ roleOrders[3] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
        else
          local data = paladinInfo.data[ roleOrders[1] ]
          if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
          data = paladinInfo.data[ roleOrders[2] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
          data = paladinInfo.data[ roleOrders[3] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
        end
      else
        if paladinInfo.numTanker == 2 and paladinInfo.numHealer == 1 then
          local data = paladinInfo.data[ roleOrders[1] ]
          if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
          data = paladinInfo.data[ roleOrders[2] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
          data = paladinInfo.data[ roleOrders[3] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
        else
          local data = paladinInfo.data[ roleOrders[1] ]
          if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
          data = paladinInfo.data[ roleOrders[2] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_CLASS"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
          data = paladinInfo.data[ roleOrders[3] ]
          if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
        end        
      end
    end
  elseif paladinInfo.totalNum >= 4 then
    if paladinInfo.numTanker == 0 then
      local data = paladinInfo.data[ roleOrders[1] ]
      if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
      data = paladinInfo.data[ roleOrders[2] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
      data = paladinInfo.data[ roleOrders[3] ]
      if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_RESIST"] end
    else
      if paladinInfo.numTanker == 1 and paladinInfo.numHealer == 1 then
        local data = paladinInfo.data[ roleOrders[1] ]
        if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
        data = paladinInfo.data[ roleOrders[2] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
        data = paladinInfo.data[ roleOrders[3] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_FIRE"] end
        data = paladinInfo.data[ roleOrders[4] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_FROST"] end
      else
        local data = paladinInfo.data[ roleOrders[1] ]
        if data then buffOrder = data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOS"] .. "/" .. _RL["RL_PALADIN_AURORA_DEVO"] end
        data = paladinInfo.data[ roleOrders[2] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOK"] .. "/" .. _RL["RL_PALADIN_AURORA_FIRE"] end
        data = paladinInfo.data[ roleOrders[3] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOW"] .. "/" .. _RL["RL_PALADIN_AURORA_CONC"] end
        data = paladinInfo.data[ roleOrders[4] ]
        if data then buffOrder = buffOrder .. ", " .. data.name .. " - " .. _RL["RL_PALADIN_BLESS_GBOM"] .. "/" .. _RL["RL_PALADIN_AURORA_FROST"] end
      end        
    end
  end

  if buffOrder then
    buffMsg = buffMsg .. buffOrder
  else
    buffMsg = L["No Pally here"]
  end

  return buffMsg
end



--[[
---------------------- test code -------------------

-- testCase format : xMxTxHxDxKxC   
-- (M -- total, T -- tanker, H -- healer, D -- DPS, K -- drum of King, C -- DISC )
function Buff_Test_UpdateRaidRosterInfo(testCase)
  paladinInfo =  { totalNum=0, numTanker=0, numHealer=0, numDps=0, data={} }
  
  local totalNum = testCase:sub(1,1)
  local numTanker = testCase:sub(3,3)
  local numHealer = testCase:sub(5,5)
  local numDps = testCase:sub(7,7)
  g_bUseDrumOfKing = testCase:sub(9,9) == "1"
  g_raid_has_disc = testCase:sub(11,11) == "1"

  print("total:" .. paladinInfo.totalNum .. ", Tanker:" .. numTanker .. " ,Healer:" .. numHealer .. ", DPS:" .. numDps .. ", Drum:" .. tostring(g_bUseDrumOfKing) .. ", disc:" .. tostring(g_raid_has_disc) )

  for i = 1, numTanker do
    local unitId = "raid" .. i
    local name = "TANKER" .. i
    local role = "MAINTANK"
    Buff_UpdateRoleType(unitId, name, role, paladinInfo)
  end

  for i = 1, numHealer do
    local unitId = "raid" .. i
    local name = "HEALER" .. i
    local role = "HEALER"
    Buff_UpdateRoleType(unitId, name, role, paladinInfo)
  end

  for i = 1, numDps do
    local unitId = "raid" .. i
    local name = "DPS" .. i
    local role = "DPS"
    Buff_UpdateRoleType(unitId, name, role, paladinInfo)
  end  

  --print("paladinInfo.totalNum: " .. paladinInfo.totalNum)
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