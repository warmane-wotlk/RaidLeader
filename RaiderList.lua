local L  = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

local buttonDeadListObj = {}

local frameSize = { x = 185, y = 70 }
local buttonSize = { x = 110, y = 23 }
local ptStart = { x = 115, y = -22 }

local ptNext = { dx = buttonSize.x - 2, dy = 0 + buttonSize.y }
local frameGapY = ptNext.dy

local deadRaidersList = {}

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
  
  local roleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  roleText:SetPoint("CENTER", frame, "TOPLEFT", x-71, y+2)
  roleText:SetText(L[buttonObj[id].obj.role])

  button:SetScript("OnClick", callback_OnClick)

  return button, roleText
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

  y = y - ptNext.dy * i

  if buttonDeadListObj[buttonId] then
     buttonDeadListObj[buttonId].obj = deadRaidersList[i]
     buttonDeadListObj[buttonId].frame:SetText(deadRaidersList[i].name)
     buttonDeadListObj[buttonId].frame:Show()
  else
     buttonDeadListObj[buttonId] = { frame = {}, textobj = {}, obj = deadRaidersList[i] }
     buttonDeadListObj[buttonId].frame, buttonDeadListObj[buttonId].textobj = RL_RaiderList_CreateButton(self, buttonDeadListObj, buttonId, x, y, RL_DeadListFrame_Buttons_OnClick)
  end  

  fy = fy + frameGapY * (#deadRaidersList - 1 )

  RL_DeadListFrame:SetSize(fx, fy)  
end

function RL_DeadListFrame_AddDeadRaider(name)
	if #deadRaidersList > 10 then return end

	local role = RRI_AddDeadRaiderInfo(name)

	if role then
		table.insert(deadRaidersList, { name = name, role = role } )
		RL_DeadListFrame_AddButtons(RL_DeadListFrame)
	end
end

local function RL_DeadListFrame_GetAllDeadRaiders()
	wipe(deadRaidersList)

	local deadRaiderInfo = RRI_UpdateAllDeadRaiderInfo()
	if deadRaiderInfo.totalNum == 0 then return end

	local orders = RRI_GetIdxOrder(deadRaiderInfo)
	local total = deadRaiderInfo.totalNum > 10 and 10 or deadRaiderInfo.totalNum

	for i = 1, total do
		deadRaidersList[i] = { name = deadRaiderInfo.data[orders[i]].name, role = deadRaiderInfo.data[orders[i]].role }
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
  	RL_RaiderList_RaidWarning(RL.druidCombatResurrect:format(druid, name))
  else
  	RL_RaiderList_RaidWarning(RL.NodruidCombatResurrect)
  end
end

local function RL_DeadListFrame_BuildButtons(self)
  for _, button in pairs(buttonDeadListObj) do
    button.frame:Hide()
    button.textobj:Hide()
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
      buttonDeadListObj[buttonId].textobj:SetText(deadRaidersList[i].role)
      buttonDeadListObj[buttonId].textobj:Show()
    else
      buttonDeadListObj[buttonId] = { frame = {}, textobj = {}, obj = deadRaidersList[i] }
      buttonDeadListObj[buttonId].frame, buttonDeadListObj[buttonId].textobj = RL_RaiderList_CreateButton(self, buttonDeadListObj, buttonId, x, y, RL_DeadListFrame_Buttons_OnClick)
    end

    y = y - ptNext.dy
  end

  fy = fy + frameGapY * (#deadRaidersList - 1 )

  RL_DeadListFrame:SetSize(fx, fy)  
end

local function RL_SoulStoneFrame_BuildButtons(self)
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

function RL_DeadListFrame_OnEvent(frame, event, ...)
end

function RL_DeadListFrame_OnLoad(self)
	RL_DeadListFrame_Header:SetText(L["Combat Resurrect"])

	self:SetMovable(true)
	self:EnableMouse(true)
	self:SetScript("OnMouseDown", function() self:StartMoving() end)
	self:SetScript("OnMouseUp",   function() self:StopMovingOrSizing() end)
	self:SetScript("OnEvent", RL_DeadListFrame_OnEvent)
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
		printf(i .. "-" .. v.name .. ", " .. v.role)
	end
end
