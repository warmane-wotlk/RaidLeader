local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

local buttonDeadListObj = {}
local itemPosition = GetLocale() == "koKR" and 17 or 0

local frameSize = { x = 195-itemPosition, y = 70 }
local buttonSize = { x = 100, y = 23 }
local ptStart = { x = 132 - itemPosition, y = -45 }

local ptNext = { dx = buttonSize.x - 2, dy = 0 + buttonSize.y }
local frameGapY = ptNext.dy

local deadRaidersList = {}

local classTypeIconCoord = {
  WARRIOR     = {l=0.00, r=0.25, t=0.00, b=0.25},
  MAGE        = {l=0.25, r=0.50, t=0.00, b=0.25},
  ROGUE       = {l=0.50, r=0.75, t=0.00, b=0.25},
  DRUID       = {l=0.75, r=1.00, t=0.00, b=0.25},

  HUNTER      = {l=0.00, r=0.25, t=0.25, b=0.50},
  SHAMAN      = {l=0.25, r=0.50, t=0.25, b=0.50},
  PRIEST      = {l=0.50, r=0.75, t=0.25, b=0.50},
  WARLOCK     = {l=0.75, r=1.00, t=0.25, b=0.50},

  PALADIN     = {l=0.00, r=0.25, t=0.50, b=0.75},
  DEATHKNIGHT = {l=0.25, r=0.50, t=0.50, b=0.75},
}

local function RL_RaiderList_CreateButton(frame, buttonObj, id, x, y, callback_OnClick)
  local button = CreateFrame("Button", id, frame, UIPanelButtonTemplate)
  button:SetPoint("CENTER", frame, "TOPLEFT", x, y)
  button:SetWidth(buttonSize.x)
  button:SetHeight(buttonSize.y)
 
  button:SetText(buttonObj[id].obj.name)
  button:SetNormalFontObject("GameFontNormal")

  local ntex = button:CreateTexture()
  ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
  ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints() 
  button:SetNormalTexture(ntex)
  
  local htex = button:CreateTexture()
  htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
  htex:SetTexCoord(0, 0.625, 0, 0.6875)
  htex:SetAllPoints()
  button:SetHighlightTexture(htex)
  
  local ptex = button:CreateTexture()
  ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
  ptex:SetTexCoord(0, 0.625, 0, 0.6875)
  ptex:SetAllPoints()
  button:SetPushedTexture(ptex)

  -- text
  local roleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  roleText:SetPoint("LEFT", frame, "TOPLEFT", 15, y+2)
  if buttonObj[id].obj.role and buttonObj[id].obj.role ~= "" then 
    roleText:SetText(L[buttonObj[id].obj.role])
  else
    roleText:SetText(L["tbd"])
  end
  button:SetScript("OnClick", callback_OnClick)

  -- Texture
  local classIcon = frame:CreateTexture("CLASS_ICON", "OVERLAY")
  classIcon:SetWidth(20)
  classIcon:SetHeight(20)
  local coord = classTypeIconCoord[buttonObj[id].obj.class]
  if coord then
    classIcon:SetTexCoord(coord.l, coord.r, coord.t, coord.b)
  else
    classIcon:SetTexCoord(0.50, 0.75, 0.5, 0.75)
  end
  classIcon:SetPoint("CENTER", frame, "TOPLEFT", 70-itemPosition, y+2)
  classIcon:SetTexture("Interface\\GLUES\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES")

  return button, roleText, classIcon
end

local function RL_RaiderList_RaidWarning(msg)
	local msgChannel = "PARTY"
	if UnitInRaid("player") then
		local rank = select(2, GetRaidRosterInfo(GetNumRaidMembers()))

		if rank == nil or rank ~= 0 then
			msgChannel = "RAID_WARNING"
		else
			msgChannel = "RAID"
		end
	end

	SendChatMessage(msg, msgChannel)
end


local function RL_DeadListFrame_AddButtons(self)
  if not next(deadRaidersList) then return end

  -- create buttons
  local fx = frameSize.x
  local fy = frameSize.y

  local x = ptStart.x
  local y = ptStart.y
  local i = #deadRaidersList
  local buttonId  = "RL_RAIDER_DEADLIST_BUTTON_ID_" .. i

  y = y - ptNext.dy * (i-1)

  if buttonDeadListObj[buttonId] then
     buttonDeadListObj[buttonId].obj = deadRaidersList[i]
     buttonDeadListObj[buttonId].frame:SetText(deadRaidersList[i].name)
     buttonDeadListObj[buttonId].frame:Show()
     buttonDeadListObj[buttonId].textobj:SetText(L[deadRaidersList[i].role])
     buttonDeadListObj[buttonId].textobj:Show()

     local coord = classTypeIconCoord[buttonDeadListObj[buttonId].obj.class]
     if coord then
       buttonDeadListObj[buttonId].icon:SetTexCoord(coord.l, coord.r, coord.t, coord.b)
     else
       buttonDeadListObj[buttonId].icon:SetTexCoord(0.50, 0.75, 0.5, 0.75)
     end
  else
     buttonDeadListObj[buttonId] = { frame = {}, textobj = {}, icon = {}, obj = deadRaidersList[i] }
     buttonDeadListObj[buttonId].frame, buttonDeadListObj[buttonId].textobj, buttonDeadListObj[buttonId].icon = RL_RaiderList_CreateButton(self, buttonDeadListObj, buttonId, x, y, RL_DeadListFrame_Buttons_OnClick)
  end  

  fy = fy + frameGapY * (#deadRaidersList - 1 )

  RL_DeadListFrame:SetSize(fx, fy)  
end

local function RL_DeadListFrame_GetAllDeadRaiders()
	wipe(deadRaidersList)

	local deadRaiderInfo = RRI_UpdateAllDeadRaiderInfo()
	if deadRaiderInfo.totalNum == 0 then return end

	local orders = RRI_GetIdxOrder(deadRaiderInfo)
	local total = deadRaiderInfo.totalNum > 10 and 10 or deadRaiderInfo.totalNum

	for i = 1, total do
		deadRaidersList[i] = { name = deadRaiderInfo.data[orders[i]].name, role = deadRaiderInfo.data[orders[i]].role, class = deadRaiderInfo.data[orders[i]].class}
	end
end

local function RL_SoulStoneFrame_GetAllRaiders()
	--RRI_GetRaidRosterInfo()
end

function RL_DeadListFrame_Buttons_OnClick(self)
  local name = buttonDeadListObj[self:GetName()].obj.name
  local RL = RL_LoadRaidWarningData()
  local druid = RRI_GetNextCRAvailableDruid(name)

  if druid then
    local msg = RL.druidCombatResurrect:format(druid, name)
  	RL_RaiderList_RaidWarning(msg)
  else
  	RL_RaiderList_RaidWarning(RL.NodruidCombatResurrect)
  end
end

local function RL_DeadListFrame_BuildButtons(self)
  for _, button in pairs(buttonDeadListObj) do
    if next(button.frame) then button.frame:Hide() end
    if next(button.textobj) then button.textobj:Hide() end
    if next(button.icon) then button.icon:Hide() end
  end

  if not next(deadRaidersList) then return end

  -- create buttons
  local fx = frameSize.x
  local fy = frameSize.y

  local x = ptStart.x
  local y = ptStart.y
  for i = 1, #deadRaidersList do
    local buttonId  = "RL_RAIDER_DEADLIST_BUTTON_ID_" .. i

    if buttonDeadListObj[buttonId] then
      buttonDeadListObj[buttonId].obj = deadRaidersList[i]
      buttonDeadListObj[buttonId].frame:SetText(deadRaidersList[i].name)
      buttonDeadListObj[buttonId].frame:Show()
      buttonDeadListObj[buttonId].textobj:SetText(L[deadRaidersList[i].role])
      buttonDeadListObj[buttonId].textobj:Show()

      local coord = classTypeIconCoord[buttonDeadListObj[buttonId].obj.class]
      if coord then
         buttonDeadListObj[buttonId].icon:SetTexCoord(coord.l, coord.r, coord.t, coord.b)
      else
         buttonDeadListObj[buttonId].icon:SetTexCoord(0.50, 0.75, 0.5, 0.75)
      end      
    else
      buttonDeadListObj[buttonId] = { frame = {}, textobj = {}, icon = {}, obj = deadRaidersList[i] }
      buttonDeadListObj[buttonId].frame, buttonDeadListObj[buttonId].textobj, buttonDeadListObj[buttonId].icon = RL_RaiderList_CreateButton(self, buttonDeadListObj, buttonId, x, y, RL_DeadListFrame_Buttons_OnClick)
    end

    y = y - ptNext.dy
  end

  fy = fy + frameGapY * (#deadRaidersList - 1 )

  RL_DeadListFrame:SetSize(fx, fy)  
end

local function RL_SoulStoneFrame_BuildButtons(self)
end

function RL_DeadListFrame_AddDeadRaider(name)
  if #deadRaidersList >= 10 then
    RL_DeadListFrame_GetAllDeadRaiders()
    RL_DeadListFrame_BuildButtons(RL_DeadListFrame)
    RL_DeadListFrame:Show()
    return
  end

  local role, className = RRI_AddDeadRaiderInfo(name)

  if role and className then
    table.insert(deadRaidersList, { name = name, role = role, class = className} )
    RL_DeadListFrame_AddButtons(RL_DeadListFrame)
  end
end

function RL_DeadListFrame_Toggle()
  if RL_DeadListFrame:IsVisible() then
    RL_DeadListFrame:Hide()
  else
  	RL_DeadListFrame_GetAllDeadRaiders()
  	RL_DeadListFrame_BuildButtons(RL_DeadListFrame)
    RL_DeadListFrame:Show()
  end
end

function RL_SoulStoneFrame_Toggle()
  if RL_SoulStoneFrame:IsVisible() then
    RL_SoulStoneFrame:Hide()
  else
  	RL_SoulStoneFrame_GetAllRaiders()
  	RL_SoulStoneFrame_BuildButtons(RL_SoulStoneFrame)
    RL_SoulStoneFrame:Show()
  end
end

function RL_DeadListFrame_Refresh()
  RL_DeadListFrame_GetAllDeadRaiders()
  RL_DeadListFrame_BuildButtons(RL_DeadListFrame)
  RL_DeadListFrame:Show()
end

function RL_DeadListFrame_OnLoad(self)
	RL_DeadListFrame_Header:SetText(L["Combat Resurrect"])

	self:SetMovable(true)
	self:EnableMouse(true)
	self:SetScript("OnMouseDown", function() self:StartMoving() end)
	self:SetScript("OnMouseUp",   function() self:StopMovingOrSizing() end)
end


function RL_SoulStoneFrame_OnLoad(self)
	RL_SoulStoneFrame_Header:SetText(L["Put Soul Stone"])

	self:SetMovable(true)
	self:EnableMouse(true)
	self:SetScript("OnMouseDown", function() self:StartMoving() end)
	self:SetScript("OnMouseUp",   function() self:StopMovingOrSizing() end)
	--self:SetScript("OnEvent", RL_SoulStoneFrame_OnEvent)
end

function RL_DeadListFrame_Info_ShowDeadRaidersList()
	for i,v in pairs(deadRaidersList) do
		RL_INFO(i .. "-" .. v.name .. ", " .. v.role .. ", " .. v.class)
	end
end
