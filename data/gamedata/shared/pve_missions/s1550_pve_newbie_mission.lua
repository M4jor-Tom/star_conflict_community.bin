-- T1 Mission
PvE_Missions.bigship_newbie_mission = 
{
	levelName = "s1550_pve_newbie_mission",
	scenario_description = { "bigship_building_str1", "bigship_building_str2", "bigship_building_str3" },
	need_spawn_warp = true,

	desc = "",
	--exp_mul = "",
	--min_iLvl = 30, 
	item_lvl = 16, -- параметр для начисления награды.
	rank  = 1,  -- параметр для попадания в очередь.
	rank_max = 1, -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.low[3],	--?
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	
	turret_health_coef = 0.6,
	turret_damage_coef = 0.5,
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SECTOR_DEFENCE",
			exp_reward_portion = 1,
			cred_reward_portion = 1,
			loot_attempts_reward = 0,
			player_spawn_group = 0,
			--loot_tables = {{"PVE_T1_PassiveSet"}},
		
			uiRoundName = "pve_bigship_newbie_rname",
			uiRoundDesc = "pve_bigship_newbie_rdesc", 
			uiAnomalydDesc = "pve_bigship_r1_easy_adesc", 
			start_sentence = "CMDR_BLACKWOOD_DEFENCE",
			
			modifiers =
			{
				{ spell = "Pve_HealShield",	caster_group = 1, }, 
				{ spell = "Pve_HealHull", caster_group = 1, },  	
			},

			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 8,
				
					{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 0, spawn_warp = true, delay = 3, }, -- все боты для пве 1 ранга.
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 0, spawn_warp = true, delay = 3, }, 
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 0, spawn_warp = true, delay = 5, },
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 0, spawn_warp = true, delay = 15, },
					{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 0, spawn_warp = true, delay = 15, },
					{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 0, spawn_warp = true, delay = 15, },
					{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 0, spawn_warp = true, delay = 30, },
					{	def = "Bot_NB_Meat_Bot_L_T1_2", count = 2, spawn_group = 0, spawn_warp = true, delay = 30, },
				},
				[ 2 ] = --36
				{
					max_agents_at_same_time = 8,
					
					{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 1, spawn_warp = true, delay = 5, },
					{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 1, spawn_warp = true, delay = 5, },
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 1, spawn_warp = true, delay = 5, },
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 2, spawn_warp = true, delay = 15, },
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 1, spawn_warp = true, delay = 15, },
					{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 1, spawn_warp = true, delay = 15, },
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 1, spawn_warp = true, delay = 30, },
					{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 2, spawn_group = 1, spawn_warp = true, delay = 25, },
					{	def = "Bot_NB_Meat_Bot_L_T1_2", count = 2, spawn_group = 1, spawn_warp = true, delay = 30, },
				},
				[ 3 ] = --31
				{
					max_agents_at_same_time = 4,
				
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 2, spawn_warp = true, delay = 5, },
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 4, spawn_group = 3, spawn_warp = true, delay = 5, },
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 1, spawn_group = 3, spawn_warp = true, delay = 5, },
					{	def = "Bot_NB_Meat_Bot_L_T1_2", count = 2, spawn_group = 2, spawn_warp = true, delay = 5, },
					{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 2, spawn_group = 2, spawn_warp = true, delay = 15, },
					--{	def = "Ship_Bot1_EasyMediumMeat_R2_M_T1", count = 1, spawn_group = 2, spawn_warp = true, delay = 15, },
					--{	def = "Ship_Bot1_EasyElite_R2_M_T2", count = 1, spawn_group = 2, spawn_warp = true, delay = 30, },
					{	def = "Bot_NB_Meat_Boss_L_T1", count = 1, spawn_group = 2, spawn_warp = true, delay = 25, },
				},
			},
		},
	},
}