
TournamentFinishRewards =
{
	finish_rewards_0 =
	{
		[ 0 ] = { gold = 0 },
		[ 1 ] = { gold = 100 },
		[ 2 ] = { gold = 200 },
		[ 3 ] = { gold = 350 },
	},
	
	finish_rewards_0_17 =
	{
		[ 0 ] = { gold = 0 },
		[ 1 ] = { gold = 150 },
		[ 2 ] = { gold = 250 },
		[ 3 ] = { gold = 400 },
	},

	finish_rewards_1 =
	{
		[ 0 ] = { token_credits = 0 },
		[ 1 ] = { token_credits = 200 },
		[ 2 ] = { token_credits = 300 },
		[ 3 ] = { token_credits = 500 },
	},
	
	finish_rewards_2 = 
	{
		[ 0 ] = { event_credits = 0 },
		[ 1 ] = { event_credits = 10 },
		[ 2 ] = { event_credits = 20 },
		[ 3 ] = { event_credits = 40 },
	},

	finish_rewards_3 =
	{
		[ 0 ] = { token_credits = 0 },
		[ 1 ] = { token_credits = 100 },
		[ 2 ] = { token_credits = 200 },
		[ 3 ] = { token_credits = 350 },
	},
	
	finish_rewards_21 =
	{
		[ 0 ] = { token_credits = 0 },
		[ 1 ] = { token_credits = 150 },
		[ 2 ] = { token_credits = 200 },
		[ 3 ] = { token_credits = 250 },
	},
}

--
Tournaments = 
{
	enable = true,

	rounds_num			= 3,
	round_time 			= 10,	-- 12 in minutes, not actual game duration!!!! After (this + preparation_time + game creation delay) players will be force pushed into another game!!!
	registration_time 	= 10, 	-- 10 in minutes
	preparation_time 	= 1,	-- 1 in minutes
	debriefing_time_min	= 60,	-- 60 in seconds
	debriefing_time_max	= 90,	-- 90 in seconds

	round_rewards =
	{
		[ 0 ] = { mult = 0.0 },
		[ 1 ] = { mult = 0.5 },
		[ 2 ] = { mult = 1.0 },
		[ 3 ] = { mult = 2.0 },
	},

	conditions =
	{
		--day = 0 - sunday, h,m - GMT
		{ d = 0, h = 17, m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_0_17 }, -- RU
		---{ d = 0, h = 19, m = 00, minRank = 9, maxRank = 17, botPresetName = "BotsT5E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_0_17 }, -- EU
---		{ d = 0, h = 1,  m = 00, minRank = 9, maxRank = 17, botPresetName = "BotsT5E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_0_17 }, -- US
		
		{ d = 6, h = 16, m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_0_17 }, -- RU
		---{ d = 6, h = 19, m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_3 }, -- EU
---		{ d = 6, h = 1,  m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_0 }, -- US
		


		--[[NY 2016 tournaments
		{ d = 1, h = 16, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- RU
		{ d = 1, h = 19, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- EU
		{ d = 1, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- US
		
		{ d = 2, h = 16, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- RU
		{ d = 2, h = 19, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- EU
		{ d = 2, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- US
		
		{ d = 3, h = 16, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- RU
		{ d = 3, h = 19, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- EU
		{ d = 3, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- US
		
		{ d = 4, h = 16, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- RU
		{ d = 4, h = 19, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- EU
		{ d = 4, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- US
		
		{ d = 5, h = 16, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- RU
		{ d = 5, h = 19, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- EU
		{ d = 5, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- US
		
		{ d = 6, h = 16, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- RU
		{ d = 6, h = 19, m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- EU
		{ d = 6, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, -- US ]]
		

		--[[NY 2017 tournaments
		{ d = 1, h = 18, m = 00, minRank = 4, maxRank = 6, botPresetName = "BotsT2E", npcPresetName = "BotsT2E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- RU
		{ d = 1, h = 1,  m = 00, minRank = 4, maxRank = 6, botPresetName = "BotsT2E", npcPresetName = "BotsT2E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- US
		
		{ d = 2, h = 18, m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- RU
		{ d = 2, h = 1,  m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- US
		
		{ d = 3, h = 18, m = 00, minRank = 4, maxRank = 6, botPresetName = "BotsT2E", npcPresetName = "BotsT2E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- RU
		{ d = 3, h = 1,  m = 00, minRank = 4, maxRank = 6, botPresetName = "BotsT2E", npcPresetName = "BotsT2E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- US
		
		{ d = 4, h = 18, m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- RU
		{ d = 4, h = 1,  m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- US
		
		{ d = 5, h = 18, m = 00, minRank = 4, maxRank = 6, botPresetName = "BotsT2E", npcPresetName = "BotsT2E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- RU
		{ d = 5, h = 1,  m = 00, minRank = 4, maxRank = 6, botPresetName = "BotsT2E", npcPresetName = "BotsT2E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- US
		
		{ d = 6, h = 18, m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- RU
		{ d = 6, h = 1,  m = 00, minRank = 7, maxRank = 9, botPresetName = "BotsT3E", npcPresetName = "BotsT3E", finish_rewards = TournamentFinishRewards.finish_rewards_2 }, -- US 

		
		
		{ d = 0, h = 0,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 2,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 3,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 4,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 5,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 6,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 7,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 8,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 9,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 10,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 11,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 12,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 13,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 14,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 15,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 16,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 17,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 18,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 19,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 20,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 21,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 0, h = 22,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 0, h = 23,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		
		{ d = 1, h = 0,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 2,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 3,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 4,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 5,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 6,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 7,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 8,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 9,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 10,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 11,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 12,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 13,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 14,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 15,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 16,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 17,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 18,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 19,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 20,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 21,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 1, h = 22,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 1, h = 23,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		
		{ d = 2, h = 0,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 2,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 3,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 4,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 5,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 6,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 7,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 8,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 9,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 10,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 11,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 12,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 13,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 14,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 15,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 16,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 17,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 18,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 19,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 20,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 21,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 2, h = 22,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 2, h = 23,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		
		{ d = 3, h = 0,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 2,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 3,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 4,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 5,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 6,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 7,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 8,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 9,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 10,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 11,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 12,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 13,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 14,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 15,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 16,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 17,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 18,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 19,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 20,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 21,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 3, h = 22,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 3, h = 23,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		
		{ d = 4, h = 0,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 2,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 3,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 4,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 5,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 6,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 7,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 8,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 9,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 10,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 11,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 12,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 13,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 14,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 15,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 16,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 17,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 18,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 19,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 20,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 21,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 4, h = 22,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 4, h = 23,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		
		{ d = 5, h = 0,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 2,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 3,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 4,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 5,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 6,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 7,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 8,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 9,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 10,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 11,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 12,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 13,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 14,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 15,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 16,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 17,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 18,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 19,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 20,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 21,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 5, h = 22,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 5, h = 23,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		
		{ d = 6, h = 0,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 1,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 2,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 3,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 4,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 5,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 6,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 7,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 8,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 9,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 10,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 11,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 12,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 13,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 14,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 15,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 16,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 17,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 18,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 19,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 20,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 21,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 }, 
		{ d = 6, h = 22,  m = 00, minRank = 7, maxRank = 9, finish_rewards = TournamentFinishRewards.finish_rewards_0 }, 
		{ d = 6, h = 23,  m = 00, minRank = 4, maxRank = 6, finish_rewards = TournamentFinishRewards.finish_rewards_1 },  ]]
	},
}

--
LeagueTeamSettings =
{
	max_team_size 						= 9,
	max_num_accepted_members 			= 100,
	max_num_accepted_members_for_major 	= 14,
	battle_size 						= 5,
	min_ship_rank 						= 11,
	active_time 						= {"17-18"},	--{"17-18", "18-19", "19-20"} { "3-5", "16-18", "19-20", "21-23" },	-- { "0-1", "2-3", "6-7", "8-9", "10-11", "12-13", "14-15", "17-18", "22-23" },	
	major_league_invite_penalty_time	= 48, -- in hours
}