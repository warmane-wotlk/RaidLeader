
RaidLeaderData = {
	version     = "v0.5";
	useKorean   = false;
	recruitInfo = { zone = "", sub = "", gear = "5.0k+", needHealer = true, needTanker = true };
};


function printf(...) SELECTED_CHAT_FRAME:AddMessage('|cff0061ff[RaidLeader]: '..format(...)) end