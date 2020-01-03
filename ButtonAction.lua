
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

function RLF_Button_SetLootMethod_OnLeave()
  GameTooltip:Hide()
end

function RLF_Button_LootThreshold_OnClick(id)
  local level = { RL_BUTTON_LOOT_THRESHOLD2=2, RL_BUTTON_LOOT_THRESHOLD3=3, RL_BUTTON_LOOT_THRESHOLD4=4 }
  SetLootThreshold(level[id]);
end

function RLF_Button_SetLeader_OnClick()
  PromoteToLeader("target");
end

function RLF_Button_Invite_OnClick()
  InviteUnit("target")
end

function RLF_Button_FloodOn_OnClick()
  Buff_Get_Paladin_Orders()
end

toggle = true
function RLF_Button_FloodOff_OnClick()
  print("set toggle - " .. tostring(toggle))
  Buff_SetLanguageKorean(toggle)
  toggle =  not toggle  
end

function RLF_Button_Show_ToolTip(param)
  local strToolTips = { 
      RL_BUTTON_BLOODLUST = "";
      RL_BUTTON_CLEAR_ICONS = "";
      RL_BUTTON_CLOSE  = "Close";
      RL_BUTTON_COMBAT_RESS = "";
      RL_BUTTON_CURE  = "";
      RL_BUTTON_DISPELL = "";
      RL_BUTTON_DPS_ADD  = "";
      RL_BUTTON_FLOOD_OFF = "turn off finding people";
      RL_BUTTON_FLOOD_ON = "find the raiders";
      RL_BUTTON_GROUP_LOOT = "Set to group loot";
      RL_BUTTON_FREEFORALL_LOOT = "Set to free for all";
      RL_BUTTON_INVITE = "Invite target player";
      RL_BUTTON_KICK = "Kick target from raid or group";
      RL_BUTTON_LOOT_THRESHOLD2 = "Set loot threshold to uncommon";
      RL_BUTTON_LOOT_THRESHOLD3 = "Set loot threshold to rare";
      RL_BUTTON_LOOT_THRESHOLD4 = "Set loot threshold to epic";
      RL_BUTTON_MASTER_LOOT = "Set to master loot";
      RL_BUTTON_MOVE_UR_ASS = "";
      RL_BUTTON_RC = "";
      RL_BUTTON_SET_LEADER = "Promote target to leader";
      RL_BUTTON_STOP_DPS = "";
      RL_BUTTON_TRANSPARENCY = "Change Transperency - use left/right mouse click";
  };

  if strToolTips[param] then
    GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
    GameTooltip:SetText( strToolTips[param] )
    GameTooltip:Show()
  end
end

function RLF_Button_Hide_ToolTip()
  GameTooltip:Hide()
end
