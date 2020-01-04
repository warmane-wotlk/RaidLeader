local L = LibStub("AceLocale-3.0"):GetLocale("RaidLeader", true)

-- Button Action -------------------------------------------------------------------------------------------
--
function RLF_Button_Close_OnClick()
  if RaidLeader_Frame:IsVisible() then
    RaidLeader_Frame:Hide()
    if Addon_Frame:IsVisible() then
      Addon_Frame:Hide();
    end
  end
end


function RLF_Button_Transparency_OnClick()
  RL_BUTTON_TRANSPARENCY:HookScript ("OnClick", function(self, button) if button == "RightButton" then RaidLeader_Frame:SetAlpha(1) end end)
  RL_BUTTON_TRANSPARENCY:HookScript ("OnClick", function(self, button) if button == "LeftButton" then RaidLeader_Frame:SetAlpha(0.5) end end);  
end

function RLF_Button_Kick_OnClick()
  UninviteUnit("target")
end

function RLF_Button_SetLootMethod_OnClick(id)
  local loot = {RL_BUTTON_MASTER_LOOT="master", RL_BUTTON_GROUP_LOOT="group", RL_BUTTON_FREEFORALL_LOOT="freeforall"}
  if loot[id] == "master" then
    SetLootMethod("master", "target")
  else
    SetLootMethod(strLoot[id])
  end
end

function RLF_Button_LootThreshold_OnClick(id)
  local level = { RL_BUTTON_LOOT_THRESHOLD2=2, RL_BUTTON_LOOT_THRESHOLD3=3, RL_BUTTON_LOOT_THRESHOLD4=4 }
  SetLootThreshold(level[id]);
end

-- say raid warning message
function RLF_Button_Combat_Msg_OnClick(param)
  if param then
  	local combatMsgId = param .. "_MSG"
	SendChatMessage(L[combatMsgId], "RAID_WARNING");  
  end
end

function RLF_Button_SetLeader_OnClick()
  PromoteToLeader("target");
end

function RLF_Button_Invite_OnClick()
  InviteUnit("target")
end

function RLF_Button_AutoFlood_OnClick(param)
  if param == "RL_BUTTON_FLOOD_ON" then
    Buff_Get_Paladin_Orders()
  else
  end
end

-- show tooltip
function RLF_Button_Show_ToolTip(param)
  if param then
  	local toolTipId = param .. "_TOOLTIP"
    GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
    GameTooltip:SetText( L[toolTipId] )
    GameTooltip:Show()
  end
end

function RLF_Button_Hide_ToolTip()
  GameTooltip:Hide()
end

-- change button text
function RLF_Button_SetText_OnLoad(self, param)
  self:SetText(L[param])
end

