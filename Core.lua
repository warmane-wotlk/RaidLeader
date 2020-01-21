
RaidLeaderData = {
	version     = "v0.5";
	useKorean   = false;
	recruitInfo = { zone = "", sub = "", gear = "5.0k+", needHealer = true, needTanker = true };
};

-- Zone Frame variable
RL_ZONE_INFOS = {}
RL_ZONE_TEXT_ENG = {}
RL_ZONE_TEXT_KOR = {}
RL_ZONE_MSG_ENG = {}
RL_ZONE_MSG_KOR = {}
RL_ZONE_TOOLTIP_ENG = {}
RL_ZONE_TOOLTIP_KOR = {}

function RL_Zone_Infos(zoneName)
	return RL_ZONE_INFOS[zoneName]
end

-- utility
function printf(...) SELECTED_CHAT_FRAME:AddMessage('|cff0061ff[RaidLeader]: '..format(...)) end