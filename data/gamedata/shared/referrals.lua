
ProgramId = 
{
	NEWBIE_REWARD_1	= 0,
	OLDIE_REWARD_1	= 1,
	OLDIE_REWARD_2	= 2,
	OLDIE_REWARD_3	= 3,
}

--[[ExampleReward = 
{
	credits			= 5,
	gold		 	= 5,
	vessel_exp		= 5000,
	sticker			= "Billiard_01",
	tokens			= 5,
	premium			= 24,
	module			= "Weapon_Railgun_Basic_T1_Mk1",
	module_enchants	= 1, -- 1 или 0, применяется к указанному выше модулю
}]]

--[[Reward_RNew =  -- Старые награды за рефералы
{
	gold		 	= 100,
}

Reward_RNew_T2 = 
{
	premium			= 72,
}

Reward_ROld_T2 = 
{
	gold			= 50,
}

Reward_ROld_T3 = 
{
	gold			= 250,
}

Reward_ROld_Final = 
{
	gold		 	= 500,
}]]


Reward_Newbie_boy =  
{
	premium		 	= 72,
}

Reward_Oldie_1 = 
{
	premium			= 24,
}

Reward_Oldie_2 = 
{
	premium			= 48,
}

Reward_Oldie_3 = 
{
	premium			= 72,
}





-- ВНИМАНИЕ! Изменения этих параметров войдут в силу только после перезапуска сервера
ReferralsSettings = 
{
	referrer_gold_bonus_rate	= 0,
	
	-- возможные условия для программ:
	-- ai.GameEvent.ACCOUNT_RANK_UP
	-- ai.GameEvent.PLAY_GAME
	-- ai.GameEvent.WIN_GAME
	
	--[[programs = 
	{
		[ ProgramId.NEWBIE_REWARD_1 ] = 
		{
		-- 100 голды новому игроку при регистрации
			required_action		= ai.GameEvent.ACCOUNT_RANK_UP,
			required_value		= 1,
			rewards_referee 	= Reward_RNew,
		},
		
		[ ProgramId.OLDIE_REWARD_1 ] = 
		{
		-- 2 дня премиума при достижении рефералом 4 ранга
			required_action		= ai.GameEvent.ACCOUNT_RANK_UP,
			required_value		= 6,
			rewards_referrer 	= Reward_ROld_T2,
		},
		
		[ ProgramId.OLDIE_REWARD_2 ] = 
		{
		-- 5 дней премиума при достижении рефералом 7 ранга
			required_action		= ai.GameEvent.ACCOUNT_RANK_UP,
			required_value		= 9,
			rewards_referrer 	= Reward_ROld_T3,
		},
	
		[ ProgramId.OLDIE_REWARD_3 ] = 
		{
		-- 500 GS при достижении рефералом 10 ранга
			required_action		= ai.GameEvent.ACCOUNT_RANK_UP,
			required_value		= 12,
			rewards_referrer 	= Reward_ROld_Final,
		},]]
		
		programs = 
	{
		[ ProgramId.NEWBIE_REWARD_1 ] = 
		{
		-- 3 дня премиума новичку при старте с реферала
			required_action		= ai.GameEvent.ACCOUNT_RANK_UP,
			required_value		= 1,
			rewards_referee 	= Reward_Newbie_boy,
		},
		
		[ ProgramId.OLDIE_REWARD_1 ] = 
		{
		-- 1 день премиума при достижении новичком 6 ранга
			required_action		= ai.GameEvent.ACCOUNT_RANK_UP,
			required_value		= 6,
			rewards_referrer 	= Reward_Oldie_1,
		},
		
		[ ProgramId.OLDIE_REWARD_2 ] = 
		{
		-- 2 дня премиума при достижении новичком 9 ранга
			required_action		= ai.GameEvent.ACCOUNT_RANK_UP,
			required_value		= 9,
			rewards_referrer 	= Reward_Oldie_2,
		},
	
		[ ProgramId.OLDIE_REWARD_3 ] = 
		{
		-- 3 дня премиума при достижении новичком 12 ранга
			required_action		= ai.GameEvent.ACCOUNT_RANK_UP,
			required_value		= 12,
			rewards_referrer 	= Reward_Oldie_3,
		},
		
		--[[пример программы
		[ ProgramId.EXAMPLE_PROGRAM_1 ] = 
		{
			-- что нужно сделать
			-- в данном случае, докачаться до какого-то ранга (с любой расой)
			required_action		= ai.GameEvent.ACCOUNT_RANK_UP,
			
			-- сколько/как/с-каким-условием
			-- в данном случае, до какого ранга нужно докачаться
			required_value		= 2,
			
			-- награда приглашенному (только 1 раз)
			rewards_referee 	= ExampleReward,
			
			-- награда пригласившему (каждый раз)
			rewards_referrer	= ExampleReward,
		},]]--
	},
}