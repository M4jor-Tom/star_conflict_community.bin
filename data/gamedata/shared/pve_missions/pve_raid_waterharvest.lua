-- имена заменены чтобы не попортить при стабилизации старый рейд, который ещё неизвестно сколько будет на лайве.

-- Общий контейнер
PvE_RW = {
	nPhase = -2,	-- это необходимо для запуска настройки
	nTimeToLeave = 75,
	nWin = 0, -- победили ли игроки (для награды похоже важно)

	-- константы фаз, чтобы не работать по цифрам
	nCruiserSpawn	= 1,
	nPortalClose	= 11,	-- фейковая фаза для сентенса
	nTorpedSpawn	= 10,	-- залп торпедами, wow всегда есть
	nShieldOn		= 2,
	nShieldOff		= 3,
	nGunSpawn		= 4,
	nRocketSpawn	= 5,
	nLaserSpawn		= 6,
	nStunSpawn		= 7,
	nFinishHim		= 8,
	nCruiserOut		= 9,
	
	nAvanpostAlive	= 0,
	
	aPortalType = {1,2,3,1,2,3,1,2,3}, -- тут и число порталов и набор патрулей из массива ниже
	aMembers = {
	--1й набор патрулей
		{
			{
					{ "Alien_Kamikadze_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 0, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, 20, -20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, -20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, -20, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, 0, -20 ) },
			},
			{
					{ "Alien_Biomorph_Large_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Reaver_RW" , Vec3( 0, 20, -20 ) },
					{ "Alien_Reaver_RW" , Vec3( 20, 0, 20 ) },
			},
			{
					{ "Alien_Boss_RW" , Vec3( 0, 0, 0 ) },
			},
			{
					{ "Alien_Predator2" , Vec3( 0, 0, 0 ) },
					{ "Alien_Leader2S" , Vec3( 20, 0, 20 ) },
					{ "Alien_Leader2S" , Vec3( 0, 20, -20 ) },
					{ "Alien_Biomorph_Large_RW" , Vec3( -20, -20, 0 ) },
					{ "Alien_Biomorph_Large_RW" , Vec3( 0, -20, 20 ) },
					{ "Alien_Biomorph_Large_RW" , Vec3( 20, 20, 0 ) },
			},
		},

	--2й набор патрулей
		{
			{
					{ "Alien_Reaver_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Reaver_RW" , Vec3( 20, 0, 20 ) },
			},
			{
					{ "Alien_Kamikadze_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 0, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, 20, -20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, -20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, -20, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 20, 0 ) },
			},
			{
					{ "Alien_Biomorph_Large_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Reaver_RW" , Vec3( 0, 20, -20 ) },
					{ "Alien_Reaver_RW" , Vec3( 20, 0, 20 ) },
			},
			{
					{ "Alien_Predator2" , Vec3( 0, 0, 0 ) },
					{ "Alien_Leader2S" , Vec3( 20, 0, 20 ) },
					{ "Alien_Leader2S" , Vec3( 0, 20, -20 ) },
					{ "Alien_Biomorph_Large_RW" , Vec3( -20, -20, 0 ) },
					{ "Alien_Biomorph_Large_RW" , Vec3( 0, -20, 20 ) },
					{ "Alien_Biomorph_Large_RW" , Vec3( 20, 20, 0 ) },
			},
		},

	--3й набор патрулей
		{
			{
					{ "Alien_Boss_RW" , Vec3( 0, 0, 0 ) },
			},
			{
					{ "Alien_Reaver_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Reaver_RW" , Vec3( 20, 0, 20 ) },
					{ "Alien_Reaver_RW" , Vec3( 0, 20, -20 ) },
					{ "Alien_Reaver_RW" , Vec3( -20, -20, 0 ) },
			},
			{
					{ "Alien_Kamikadze_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 0, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, 20, -20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, -20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, -20, 20 ) },
			},
			{
					{ "Alien_Predator2" , Vec3( 0, 0, 0 ) },
					{ "Alien_Leader2S" , Vec3( 20, 0, 20 ) },
					{ "Alien_Leader2S" , Vec3( 0, 20, -20 ) },
					{ "Alien_Biomorph_Large_RW" , Vec3( -20, -20, 0 ) },
					{ "Alien_Biomorph_Large_RW" , Vec3( 0, -20, 20 ) },
					{ "Alien_Biomorph_Large_RW" , Vec3( 20, 20, 0 ) },
			},
		},

	},
}


-- !теперь это чисто т5 вариант
PvE_Missions.pve_raid_waterharvest_t5 =
{
	levelName = "pve_raid_waterharvest",
	scenario_description = { "pve_raid_waterharvest_str1", "pve_raid_waterharvest_str2", "pve_raid_waterharvest_str3" },
	need_spawn_warp = true,
	is_boss = true,
	waves_ui_hide = true,

	desc = "",
	resurrection_attempts = 2,
	is_raid = true,
	disabled = false,

	--exp_mul = "",
	--min_iLvl = 30, 
	rank  = 13,  -- параметр для попадания в очередь.	__t5 (тут надо бы 12)
	item_lvl = 25, -- параметр для начисления награды.
	rank_max = 17, -- параметр для выбора миссии на карте галактики.
	bot_difficulty = 2, -- параметр задающий сложность ботов.
	max_loot_attempts_special = 3,
	event_loot_attempts = 3,

	playlist = "RaidMusic_default",
	
	zone_id = SpaceZone.Federation_CaribWaterharvest.zone_id,
	avanpost_prefix = "RaidAvanpost",
	avanpost_def = "RW_PoliceAvanpost",
	avanpost_count = 8,
	
	turret_health_coef = 1,
	turret_damage_coef = 1,
	
	-- дополняются скриптом!!!
	squads = 
	{
		{
			name = "Transport_Alien",
			boss = true,
	 		relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "escort_spawn_spot1",
			route = "alien_cruiser_path1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			--spawn_ignore_collision = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1500,
			respawn_time = 12000,			
			cargoship = "AlienCruiser_t5", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			despawn_portal = "cruiser_portal_out",
			
			members = 
			{
				{
				},
			},
		},

		{
			name = "Zombie",
	 		relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "zombie_spawn_spot",
			route = "alien_path1",
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			spawn_ignore_collision = true,
			first_spawn_delay = 15000,
			respawn_time = 10000,
			players_first = true,
			
			members = 
			{	
				{
					--{ "Alien_Kamikadze_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 0, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, 20, -20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, -20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, -20, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, 0, -20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, -20, -20 ) },
				},
			},
		},
	},
	
	rounds = 
	{
	
		[ 1 ] = 
	
		{	
			type = "SURVIVE",
			precache_defs = {"Cruiser_Shield_RW_t5", "Cruiser_Torpedo_RW", "RW_Bomb", },

			exp_reward_portion = 4,
			cred_reward_portion = 4,
			loot_attempts_reward = 5,
			player_spawn_group = 0,

			uiRoundDesc = "raid_waterharvest_r1_rdesc", 

			loot_tables = { { "PVE_T1_PassiveSet" }, { "PVE_T2_ActiveSet" }, { "PVE_T3_Raid_TokenSet" }, { "PVE_T4_Raid_TokenSet" }, {"PVE_T5_Raid_TokenSet" } },
			--win_loot_tables = { { "resource_zeta_add_1_high" }, { "resource_zeta_add_1_high" }, { "resource_zeta_add_1_high" }, { "resource_zeta_add_1_high" },{ "resource_zeta_add_1_high" } },
			win_loot_tables = { { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" },{ "resource_zeta_add_1_low" } },
			start_sentence = "CMDR_PVE_RAID_START_ROUND",

			modifiers =
			{
				--{ spell = "Pve_Capture_Speed_Mod",	caster_group = 1, },
			},

			start_event = -- не нужно, зашит в pve_mission.lua
			{
			},
			
			waves =
			{
				[ 1 ] = 
				{
					max_agents_at_same_time = 32,
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, spawn_group = 9, spawn_warp = true,  delay = 20000, ui_notification = true,},
				},
			},
			phases = 
 			{
    			[ PvE_RW.nCruiserSpawn ] =	--1
				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID_PHASE2",
         			start_event = {},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
       				end_kill_list = {
						value = { "cruiser_portal", },
							next_phase = PvE_RW.nPortalClose,
							},
					},
				[ PvE_RW.nPortalClose ] = -- 11, фейковая фаза чисто чтобы сентенс проигрался 1 раз в момент закрытия портала
					{
						start_sentence = "CMDR_PVE_RAID_PHASE2",
					},	
				[ PvE_RW.nTorpedSpawn ] = {}, -- 10 Залп торпедами и ждём урон
				[ PvE_RW.nShieldOn ] = {},	-- 2 Щиты с лазерами
				[ PvE_RW.nShieldOff ] = {},	-- 3 черная дыра
     			[ PvE_RW.nGunSpawn ] = {}, -- 4 пулемёты
     			[ PvE_RW.nRocketSpawn ] = {}, -- 5 ракеты
     			[ PvE_RW.nLaserSpawn ] = {}, -- 6 мегалазер
     			[ PvE_RW.nStunSpawn ] = {}, -- 7 станящие шары
				[ PvE_RW.nFinishHim ] =  -- 8 улетаем 
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID2_FINAL",
       				end_time = 
					    {
        				value = PvE_RW.nTimeToLeave, -- секунды
						next_phase = PvE_RW.nCruiserOut,
						},
    				},	
				[ PvE_RW.nCruiserOut ] = -- 9 провал рейда
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
    				},
                },
		},    
	},
}


--
PvE_Missions.pve_raid_waterharvest_t4 = 
{
	levelName = "pve_raid_waterharvest",
	scenario_description = { "pve_raid_waterharvest_str1", "pve_raid_waterharvest_str2", "pve_raid_waterharvest_str3" },
	need_spawn_warp = true,
	is_boss = true,
	waves_ui_hide = true,

	desc = "",
	resurrection_attempts = 2,
	is_raid = true,
	disabled = false,

	--exp_mul = "",
	--min_iLvl = 30, 
	rank  = 10,  -- параметр для попадания в очередь.
	item_lvl = 23, -- параметр для начисления награды.
	rank_max = 12, -- параметр для выбора миссии на карте галактики. __t4
	bot_difficulty = 2, -- параметр задающий сложность ботов.
	max_loot_attempts_special = 3,
	event_loot_attempts = 3,

	playlist = "RaidMusic_default",
	
	zone_id = SpaceZone.Federation_CaribWaterharvest.zone_id,
	avanpost_prefix = "RaidAvanpost",
	avanpost_def = "RW_PoliceAvanpost",
	avanpost_count = 8,

	turret_health_coef = 1,
	turret_damage_coef = 1,
	
	-- дополняются скриптом!!!
	squads = 
	{
		{
			name = "Transport_Alien",
			boss = true,
	 		relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "escort_spawn_spot1",
			route = "alien_cruiser_path1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			--spawn_ignore_collision = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1500,
			respawn_time = 12000,			
			cargoship = "AlienCruiser_t4", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			despawn_portal = "cruiser_portal_out",
			
			members = 
			{
				{
				},
			},
		},

		{
			name = "Zombie",
	 		relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "zombie_spawn_spot",
			route = "alien_path1",
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			spawn_ignore_collision = true,
			first_spawn_delay = 15000,
			respawn_time = 10000,
			players_first = true,
			
			members = 
			{	
				{
					--{ "Alien_Kamikadze_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 0, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, 20, -20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, -20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, -20, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, 0, -20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, -20, -20 ) },
				},
			},
		},
	},
	rounds =
	{
		[ 1 ] =
		{
			type = "SURVIVE",
			precache_defs = {"Cruiser_Shield_RW_t4", "Cruiser_Torpedo_RW_t4", "RW_Bomb", },

			exp_reward_portion = 4,
			cred_reward_portion = 4,
			loot_attempts_reward = 5,
			player_spawn_group = 0,

			uiRoundDesc = "raid_waterharvest_r1_rdesc", 

			loot_tables = { { "PVE_T1_PassiveSet" }, { "PVE_T2_ActiveSet" }, { "PVE_T3_Raid_TokenSet" }, { "PVE_T4_Raid_TokenSet" }, {"PVE_T5_Raid_TokenSet" } },
			--win_loot_tables = { { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" },{ "resource_zeta_add_1_low" } },
			win_loot_tables = { { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" },{ "resource_zeta_add_1_low" } },
			start_sentence = "CMDR_PVE_RAID_START_ROUND",
			
			modifiers =
			{
				--{ spell = "Pve_Capture_Speed_Mod",	caster_group = 1, },
			},
			
			start_event = -- не нужно, зашит в pve_mission.lua
			{		
			},
			
			waves =
			{
				[ 1 ] = 
				{
					max_agents_at_same_time = 32,
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, spawn_group = 9, spawn_warp = true,  delay = 20000, ui_notification = true,},
				},
			},
			phases = 
 			{
    			[ PvE_RW.nCruiserSpawn ] =	--1
				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID_PHASE2",
         			start_event = {},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
       				end_kill_list = {
						value = { "cruiser_portal", },
							next_phase = PvE_RW.nPortalClose,
							},
					},
				[ PvE_RW.nPortalClose ] = -- 11, фейковая фаза чисто чтобы сентенс проигрался 1 раз в момент закрытия портала
					{
						start_sentence = "CMDR_PVE_RAID_PHASE2",
					},	
				[ PvE_RW.nTorpedSpawn ] = {}, -- 10 Залп торпедами и ждём урон
				[ PvE_RW.nShieldOn ] = {},	-- 2 Щиты с лазерами
				[ PvE_RW.nShieldOff ] = {},	-- 3 черная дыра
     			[ PvE_RW.nGunSpawn ] = {}, -- 4 пулемёты
     			[ PvE_RW.nRocketSpawn ] = {}, -- 5 ракеты
     			[ PvE_RW.nLaserSpawn ] = {}, -- 6 мегалазер
     			[ PvE_RW.nStunSpawn ] = {}, -- 7 станящие шары
				[ PvE_RW.nFinishHim ] =  -- 8 улетаем 
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID2_FINAL",
       				end_time = 
					    {
        				value = PvE_RW.nTimeToLeave, -- секунды
						next_phase = PvE_RW.nCruiserOut,
						},
    				},	
				[ PvE_RW.nCruiserOut ] = -- 9 провал рейда
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
    				},
                },
		},    
	},
}


--
PvE_Missions.pve_raid_waterharvest_t3 = 
{
	levelName = "pve_raid_waterharvest",
	scenario_description = { "pve_raid_waterharvest_str1", "pve_raid_waterharvest_str2", "pve_raid_waterharvest_str3" },
	need_spawn_warp = true,
	is_boss = true,
	waves_ui_hide = true,

	desc = "",
	resurrection_attempts = 2,
	is_raid = true,
	disabled = false,

	--exp_mul = "",
	--min_iLvl = 30, 
	rank  = 7,  -- параметр для попадания в очередь. __t3
	item_lvl = 21, -- параметр для начисления награды.
	rank_max = 9, -- параметр для выбора миссии на карте галактики. __t3
	bot_difficulty = 2, -- параметр задающий сложность ботов.
	max_loot_attempts_special = 3,
	event_loot_attempts = 1,

	playlist = "RaidMusic_default",

	zone_id = SpaceZone.Federation_CaribWaterharvest.zone_id,
	avanpost_prefix = "RaidAvanpost",
	avanpost_def = "RW_PoliceAvanpost",
	avanpost_count = 8,

	turret_health_coef = 1,
	turret_damage_coef = 1,
	
	-- дополняются скриптом!!!
	squads = 
	{
		{
			name = "Transport_Alien",
			boss = true,
	 		relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "escort_spawn_spot1",
			route = "alien_cruiser_path1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			--spawn_ignore_collision = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1500,
			respawn_time = 12000,
			cargoship = "AlienCruiser_t3", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			despawn_portal = "cruiser_portal_out",
			
			members = 
			{
				{
				},
			},
		},

		{
			name = "Zombie",
	 		relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "zombie_spawn_spot",
			route = "alien_path1",
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			spawn_ignore_collision = true,
			first_spawn_delay = 15000,
			respawn_time = 10000,
			players_first = true,
			
			members = 
			{	
				{
					--{ "Alien_Kamikadze_RW" , Vec3( 0, 0, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 0, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, 20, -20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, -20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 0, -20, 20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, 20, 0 ) },
					{ "Alien_Kamikadze_RW" , Vec3( -20, 0, -20 ) },
					{ "Alien_Kamikadze_RW" , Vec3( 20, -20, -20 ) },
				},
			},
		},
	},
	
	rounds = 
	{
	
		[ 1 ] = 
	
		{	
			type = "SURVIVE",
			precache_defs = {"Cruiser_Shield_RW_t3", "Cruiser_Torpedo_RW_t3", },

			exp_reward_portion = 4,
			cred_reward_portion = 4,
			loot_attempts_reward = 5,
			player_spawn_group = 0,

			uiRoundDesc = "raid_waterharvest_r1_rdesc", 

			loot_tables = { { "PVE_T1_PassiveSet" }, { "PVE_T2_ActiveSet" }, { "PVE_T3_Raid_TokenSet" }, {"PVE_T4_Raid_TokenSet" }, { "PVE_T5_Raid_TokenSet" } },
			--win_loot_tables = { { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" },{ "resource_zeta_add_1_low" } },
			start_sentence = "CMDR_PVE_RAID_START_ROUND",
			win_loot_tables = { { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" },{ "resource_zeta_add_1_low" } },
			modifiers =
			{
				--{ spell = "Pve_Capture_Speed_Mod",	caster_group = 1, },
			},
			
			start_event = -- не нужно, зашит в pve_mission.lua
			{
			},
			
			waves =
			{
				[ 1 ] =
				{
					max_agents_at_same_time = 32,
					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, spawn_group = 9, spawn_warp = true,  delay = 20000, ui_notification = true,},
				},
			},
			phases = 
 			{
    			[ PvE_RW.nCruiserSpawn ] =	--1
					{
						playlist = "RaidMusic_special",
						important_playlist = true,
						start_event = {},
						 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
						end_kill_list = {
							value = { "cruiser_portal", },
							next_phase = PvE_RW.nPortalClose,
							},
					},
				[ PvE_RW.nPortalClose ] = -- 11, фейковая фаза чисто чтобы сентенс проигрался 1 раз в момент закрытия портала
					{
						start_sentence = "CMDR_PVE_RAID_PHASE2",
					},	
				[ PvE_RW.nTorpedSpawn ] = {}, -- 10 Залп торпедами и ждём урон
				[ PvE_RW.nShieldOn ] = {},	-- 2 Щиты с лазерами
				[ PvE_RW.nShieldOff ] = {},	-- 3 черная дыра
     			[ PvE_RW.nGunSpawn ] = {}, -- 4 пулемёты
     			[ PvE_RW.nRocketSpawn ] = {}, -- 5 ракеты
     			[ PvE_RW.nLaserSpawn ] = {}, -- 6 мегалазер
     			[ PvE_RW.nStunSpawn ] = {}, -- 7 станящие шары
				[ PvE_RW.nFinishHim ] =  -- 8 улетаем 
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID2_FINAL",
       				end_time = 
					    {
        				value = PvE_RW.nTimeToLeave, -- секунды
						next_phase = PvE_RW.nCruiserOut,
						},
    				},	
				[ PvE_RW.nCruiserOut ] = -- 9 провал рейда
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
    				},
                },
		},    
	},
}



--============================================================================================================================================================================
--============================================================================================================================================================================

-- установка состава патрулей, для т4-т3 пока убрал, мешается только
--[[
local iPortal, iPatrol, nSet, a
for iPortal = 1, #PvE_RW.aPortalType do
	nSet = PvE_RW.aPortalType[iPortal]
	for iPatrol = 1, #PvE_RW.aMembers[nSet] do
		a = {
			name = "Alien_Patrol"..iPortal.."_"..iPatrol,
			relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "alien_spawn_spot"..iPortal,
			route = "alien_path1",
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			respawn_time = 12000,
			players_first = true,
			members = {},
		}
		table.insert(a.members, PvE_RW.aMembers[nSet][iPatrol])
		table.insert(PvE_Missions.pve_raid_waterharvest_t5.squads, a)
	end
end
]]--



--============================================================================================================================================================================
--============================================================================================================================================================================
--============================================================================================================================================================================

-- Настройки зависят от тира рейда. __t3 __t4
function PvE_RW:RaidSet(nTier)

	-- добавил для #82779
	if Game_IsServer() then	-- зачищаем возможные остатки информации от предыдущих пве на клиентах
		sys.log( "================ CL_PveEventsReset server" )
		ServerLuaRpcEx( 32, "CL_PveEventsReset")
	else
		sys.log( "================ CL_PveEventsReset client" )
		CL_PveEventsReset()
	end

	--tt PvE_RW.testState = 2	
	PvE_RW.nTier = nTier

	if PvE_RW.testState then
		PvE_RW.nPlayerCount = PvE_RW.testState
	else
		PvE_RW.nPlayerCount = 12
	end
	sys.log( "================PvE_RW:RaidSet( nTier = %d )", nTier )
	
	PvE_RW.nSquadRespawn = 60
	PvE_RW.nMaxAlivePortal = nTier -- 5 максимальное число открытых порталов
	--PvE_RW.aWow = {"", "RW_ShieldOff", "RW_CruiserEnrage", "RW_ShieldOff", "RW_BombSpawn", "RW_PortalSpawn", "RW_CruiserEnrage", "RW_FinishHim", "RW_GunSpawn"}
	PvE_RW.aWow = {"", "RW_ShieldOn", "RW_ShieldOff", "", "RW_RocketSpawn", "RW_LaserSpawn", "RW_StunSpawn", "RW_FinishHim", "", "", "", ""}
	
	-- переключение фаз на остаток hp (отсортировать по убыванию), true - это фаза не стартует и не проигрывается wow
	-- 2 - ракеты, 3 - инверторы, 4 - спецоружие, 5- порталы, 6 - убегание
	if PvE_RW.nTier == 3 then
		PvE_RW.aPhases = {
			--PvE_RW.nCruiserSpawn
			{100, PvE_RW.nTorpedSpawn, true},
			{100, PvE_RW.nGunSpawn, true},
			{90, PvE_RW.nShieldOn}, -- в скрипте фазы пауза на переключение фаз, пока не спадёт щит
			{90, PvE_RW.nTorpedSpawn, true},
			{90, PvE_RW.nShieldOff}, -- при взрыве щита
			--{80, PvE_RW.nShieldOff}, -- дубль для обновления туррелей (wow не будет ибо фаза не сменилась)
			{70, PvE_RW.nGunSpawn},	-- в скрипте фазы 10 сек. пауза на запуск следующей фазы
			{70, PvE_RW.nTorpedSpawn, true},
			{70, PvE_RW.nGunSpawn, true}, -- без wow сообщения, фаза не стартует!
			--{60, PvE_RW.nGunSpawn}, -- дубль для обновления туррелей
			{50, PvE_RW.nTorpedSpawn},
			{50, PvE_RW.nLaserSpawn},
			--{40, PvE_RW.nLaserSpawn}, -- дубль для обновления туррелей
			{30, PvE_RW.nTorpedSpawn},
			{30, PvE_RW.nRocketSpawn},
			--{20, PvE_RW.nRocketSpawn}, -- дубль для обновления туррелей
			{10, PvE_RW.nFinishHim},
		}
	else
		PvE_RW.aPhases = {
			--PvE_RW.nCruiserSpawn
			{100, PvE_RW.nTorpedSpawn, true},
			{100, PvE_RW.nGunSpawn, true},
			{90, PvE_RW.nShieldOn}, -- в скрипте фазы пауза на переключение фаз, пока не спадёт щит
			{90, PvE_RW.nTorpedSpawn, true},
			{90, PvE_RW.nShieldOff}, -- при взрыве щита
			{80, PvE_RW.nShieldOff}, -- дубль для обновления туррелей (wow не будет ибо фаза не сменилась)
			{70, PvE_RW.nGunSpawn},	-- в скрипте фазы 10 сек. пауза на запуск следующей фазы
			{70, PvE_RW.nTorpedSpawn, true},
			{70, PvE_RW.nGunSpawn, true}, -- без wow сообщения, фаза не стартует!
			{60, PvE_RW.nGunSpawn}, -- дубль для обновления туррелей
			{50, PvE_RW.nTorpedSpawn},
			{50, PvE_RW.nLaserSpawn},
			{40, PvE_RW.nLaserSpawn}, -- дубль для обновления туррелей
			{30, PvE_RW.nTorpedSpawn},
			{30, PvE_RW.nRocketSpawn},
			{20, PvE_RW.nRocketSpawn}, -- дубль для обновления туррелей
			{10, PvE_RW.nFinishHim},
		}
	end

	PvE_RW.nLastPhase = 0	-- текущая фаза в таблице выше
	PvE_RW.isPhaseStarted = true	-- запустилась ли фаза, сразу после переключения фазы её надо что-либо сделать и потом уже мониторить окончание фазы (true по умолчанию чтобы 1я фаза торпед в списке не стартовала и не вырубала излучатели)
		
	PvE_RW.nPortalToSpawn = 2 -- 3 число порталов, которое надо спавнить в фазе порталов
	PvE_RW.nBombToSpawn	= 3 -- 5+ число черных дыр, которое надо спавнить в фазе инверторов
	PvE_RW.nPortalToSpawnWithBomb = 2 -- число порталов с дырами

	--nExtraBombSpawn = 0, -- 6 если живых игроков больше, то в фазе щита заспавнится бомба
	-- тип цели nTargetType: 0 -под себя, 1 - ближдняя цель, 2 - дальняя цель, 3 рандом, 4 аванпост,  -1 - мегаядерку в конкретной точке заспавнить, -2 спелл, -3 спелл от летящей ракеты!
	if nTier == 5 then -- различия в ракетах
		PvE_RW.LaserGunDef = "Weapon_LaserGun_RW"
		PvE_RW.LaserGunBigDef = "Weapon_LaserGunBig_RW"
		PvE_RW_ShieldAura = "SmartBombShield_RW_T5"
		PvE_RW.LaserDir = 1.05	-- разница между направлениями стрельбы и на цель
		PvE_RW.LaserMaxDist = 700 -- максимальное расстояние наведения лазеров
		
		PvE_RW.aRockets =
		{
			-- {
				-- defName = "xSpaceMissile_Raid_W_Stun",
				-- nTargetType = 3,
				-- nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				-- nLaunched = 0,	-- сколько ракет уже выпущено
				-- nRespawn = 1,
				-- nRespawnPack = 10,
				-- nTimer = 0,
				-- nPhase	= PvE_RW.nStunSpawn,
			-- },
			-- {
				-- defName = "StunZone_Raid_W",
				-- nRespawn = 1,
				-- nTargetType = -3,
				-- parent = "xSpaceMissile_Raid_W_Stun",
				-- nTimer = 0,
			-- },
			{
				defName = "SmartBombClose_RW_T5",
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0,
			},
			{
				defName = "SmartBombClose_RW_T5",
				owners = {"Alien_Destroyer_Life_01_T5", "Alien_Destroyer_Life_02_T5", "Alien_Destroyer_Life_03_T5", "Alien_Destroyer_Life_04_T5", "Alien_Destroyer_Hearth_T5"},
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0,
			},
			{
				defName = "SmartBombBlackHole_RW_T5",
				owners = {"Megabomb_RW_BlackHole"},
				nRespawn = 1,
				nTargetType = -2,
				nTimer = 0,
				nPhase	= PvE_RW.nShieldOff,
			},
			{
				defName = "RW_BlackHole",
				owners = {"Megabomb_RW_BlackHole"},
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0,
				nPhase	= PvE_RW.nShieldOff,
			},
			{
				defName = "SmartBombKill_RW",
				nRespawn = 60*18,
				nTargetType = -2,
				nTimer = 0,
			},
			{
				defName = "RW_SpaceMissile_Spam",
				nRespawn = 0.4,
				nTargetType = 3,
				nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				nLaunched = PvE_RW.nPlayerCount,	-- сколько ракет уже выпущено
				aHp = {95,80,60,40,9,7,5,3,1},	-- здоровье при котором происходит заправка , доп залпы в середине фаз.
				nLastHp = 0,	-- последняя заправка ракетами
				nTimer = 0,
			},
			-- {
				-- defName = "RW_SpaceMissile_Spam",
				-- nRespawn = 0.4,
				-- nRespawnPack = 10,
				-- nPhase	= PvE_RW.nShieldOff,
				-- nTargetType = 3,
				-- nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				-- nLaunched = 0,	-- сколько ракет уже выпущено
				-- nTimer = 0,
			-- },
			{
				defName = "RW_SpaceMissile_Spam",
				def2Name = "RW_SpaceMissile_Spam_NoSound",
				nRespawn = 0.2,
				nRespawnPack = 12,
				nPhase	= PvE_RW.nRocketSpawn,
				nTargetType = 3,
				nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				nLaunched = 0,	-- сколько ракет уже выпущено
				nTimer = 0,
			},
			{
				defName = "Cruiser_Torpedo_RW",
				nRespawn = 1.5,
				nTargetType = 4,	-- рандомный аванпост (из живых) или игрок
				nCount = 1.5*PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				nLaunched = 0,	-- сколько ракет уже выпущено
				--nRespawnPack = 10,
				aHp = {90,70,50,30},	-- здоровье при котором происходит заправка
				nLastHp = 0,	-- последняя заправка ракетами
				nTimer = 0,
				nPhase	= PvE_RW.nTorpedSpawn,
			},
		}
		
		--PvE_RW.sMegaBomb = { "SmartBombFar_RW", "SmartBombFar_RW", "SmartBombFar_RW", } --"MegaBomb_Raid_Pve" был взырв стал пульсар (каждый тик отследживается скрипом пока бомба жива)
		
	elseif nTier == 4 then
		PvE_RW.LaserGunDef = "Weapon_LaserGun_RW_t4"
		PvE_RW.LaserGunBigDef = "Weapon_LaserGunBig_RW_t4"
		PvE_RW_ShieldAura = "SmartBombShield_RW_T4"
		PvE_RW.LaserDir = 1.0	-- разница между направлениями стрельбы и на цель
		PvE_RW.LaserMaxDist = 600 -- максимальное расстояние наведения лазеров

		PvE_RW.aRockets =
		{
			-- {
				-- defName = "xSpaceMissile_Raid_W_Stun",
				-- nTargetType = 3,
				-- nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				-- nLaunched = 0,	-- сколько ракет уже выпущено
				-- nRespawn = 1,
				-- nRespawnPack = 10,
				-- nTimer = 0,
				-- nPhase	= PvE_RW.nStunSpawn,
			-- },
			-- {
				-- defName = "StunZone_Raid_W",
				-- nRespawn = 1,
				-- nTargetType = -3,
				-- parent = "xSpaceMissile_Raid_W_Stun",
				-- nTimer = 0,
			-- },
			{
				defName = "SmartBombClose_RW_T4",
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0,
			},
			{
				defName = "SmartBombClose_RW_T4",
				owners = {"Alien_Destroyer_Life_01_T4", "Alien_Destroyer_Life_02_T4", "Alien_Destroyer_Life_03_T4", "Alien_Destroyer_Life_04_T4", "Alien_Destroyer_Hearth_T4"},
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0,
			},
			{
				defName = "SmartBombBlackHole_RW_T4",
				owners = {"Megabomb_RW_BlackHole"},
				nRespawn = 1,
				nTargetType = -2,
				nTimer = 0,
				nPhase	= PvE_RW.nShieldOff,
			},
			{
				defName = "RW_BlackHole",
				owners = {"Megabomb_RW_BlackHole"},
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0,
				nPhase	= PvE_RW.nShieldOff,
			},
			{
				defName = "SmartBombKill_RW",
				nRespawn = 60*18,
				nTargetType = -2,
				nTimer = 0,
			},
			{
				defName = "RW_SpaceMissile_Spam_t4",
				nRespawn = 0.4,
				nTargetType = 3,
				nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				nLaunched = PvE_RW.nPlayerCount,	-- сколько ракет уже выпущено
				aHp = {95,80,60,40,9,6,3},	-- здоровье при котором происходит заправка , доп залпы в середине фаз.
				nLastHp = 0,	-- последняя заправка ракетами
				nTimer = 0,
			},
			-- {
				-- defName = "RW_SpaceMissile_Spam_t4",
				-- nRespawn = 0.4,
				-- nRespawnPack = 10,
				-- nPhase	= PvE_RW.nShieldOff,
				-- nTargetType = 3,
				-- nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				-- nLaunched = 0,	-- сколько ракет уже выпущено
				-- nTimer = 0,
			-- },
			{
				defName = "RW_SpaceMissile_Spam_t4",
				def2Name = "RW_SpaceMissile_Spam_NoSound_t4",
				nRespawn = 0.2,
				nRespawnPack = 14,
				nPhase	= PvE_RW.nRocketSpawn,
				nTargetType = 3,
				nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				nLaunched = 0,	-- сколько ракет уже выпущено
				nTimer = 0,
			},
			{
				defName = "Cruiser_Torpedo_RW_t4",
				nRespawn = 1.5,
				nTargetType = 4,	-- рандомный аванпост (из живых) или игрок
				nCount = 1.5*PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				nLaunched = 0,	-- сколько ракет уже выпущено
				--nRespawnPack = 10,
				aHp = {90,70,50,30},	-- здоровье при котором происходит заправка
				nLastHp = 0,	-- последняя заправка ракетами
				nTimer = 0,
				nPhase	= PvE_RW.nTorpedSpawn,
			},
		}
		
		--PvE_RW.sMegaBomb = { "SmartBombFarSmall_Raid_t4", "SmartBombFarMedium_Raid_t4", "SmartBombFarLarge_Raid_t4", } --"MegaBomb_Raid_Pve" был взырв стал пульсар (каждый тик отследживается скрипом пока бомба жива)

	elseif nTier == 3 then
		PvE_RW.LaserGunDef = "Weapon_LaserGun_RW_t3"
		PvE_RW.LaserGunBigDef = "Weapon_LaserGunBig_RW_t3"
		PvE_RW_ShieldAura = "SmartBombShield_RW_T3"
		PvE_RW.LaserDir = 0.95	-- разница между направлениями стрельбы и на цель
		PvE_RW.LaserMaxDist = 550 -- максимальное расстояние наведения лазеров

		PvE_RW.aRockets =
		{
			{
				defName = "SmartBombClose_RW_T3",
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0,
			},
			{
				defName = "SmartBombClose_RW_T3",
				owners = {"Alien_Destroyer_Life_01_T3", "Alien_Destroyer_Life_02_T3", "Alien_Destroyer_Life_03_T3", "Alien_Destroyer_Life_04_T3", "Alien_Destroyer_Hearth_T3"},
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0,
			},
			{
				defName = "SmartBombBlackHole_RW_T3",
				owners = {"Megabomb_RW_BlackHole"},
				nRespawn = 1,
				nTargetType = -2,
				nTimer = 0,
				nPhase	= PvE_RW.nShieldOff,
			},
			{
				defName = "RW_BlackHole",
				owners = {"Megabomb_RW_BlackHole"},
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0,
				nPhase	= PvE_RW.nShieldOff,
			},
			{
				defName = "SmartBombKill_RW",
				nRespawn = 60*18,
				nTargetType = -2,
				nTimer = 0,
			},
			{
				defName = "RW_SpaceMissile_Spam_t3",
				nRespawn = 0.4,
				nTargetType = 3,
				nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				nLaunched = PvE_RW.nPlayerCount,	-- сколько ракет уже выпущено
				aHp = {95,80,60,40,9,5},	-- здоровье при котором происходит заправка , доп залпы в середине фаз.
				nLastHp = 0,	-- последняя заправка ракетами
				nTimer = 0,
			},
			-- {
				-- defName = "RW_SpaceMissile_Spam_t3",
				-- nRespawn = 0.4,
				-- nRespawnPack = 12,
				-- nPhase	= PvE_RW.nShieldOff,
				-- nTargetType = 3,
				-- nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				-- nLaunched = 0,	-- сколько ракет уже выпущено
				-- nTimer = 0,
			-- },
			{
				defName = "RW_SpaceMissile_Spam_t3",
				def2Name = "RW_SpaceMissile_Spam_NoSound_t3",
				nRespawn = 0.2,
				nRespawnPack = 16,
				nPhase	= PvE_RW.nRocketSpawn,
				nTargetType = 3,
				nCount = PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				nLaunched = 0,	-- сколько ракет уже выпущено
				nTimer = 0,
			},
			{
				defName = "Cruiser_Torpedo_RW_t3",
				nRespawn = 1.5,
				nTargetType = 4,	-- рандомный аванпост (из живых) или игрок
				nCount = 1.5*PvE_RW.nPlayerCount,	-- сколько ракет этих ракет в паке
				nLaunched = 0,	-- сколько ракет уже выпущено
				--nRespawnPack = 10,
				aHp = {90,70,50,30},	-- здоровье при котором происходит заправка
				nLastHp = 0,	-- последняя заправка ракетами
				nTimer = 0,
				nPhase	= PvE_RW.nTorpedSpawn,
			},
		}
		
		--PvE_RW.sMegaBomb = { "SmartBombFarSmall_Raid_Pve", "SmartBombFarMedium_Raid_Pve", "SmartBombFarLarge_Raid_Pve", } --"MegaBomb_Raid_Pve" был взырв стал пульсар (каждый тик отследживается скрипом пока бомба жива)
	end
	
	--nBombTimer = 30, -- время за которое надо убить мегабомбу - иначе она рванёт
	PvE_RW.nBombTimer = 26 -- частота пульсара (первый запуск любой мегабомбы)
	PvE_RW.nBombTimerSlow = 1 -- время для усиления ауры замедления (10 фаз замедляющей мегабомбы)
	PvE_RW.nBombTimerEx = 3 -- время до неминуемого взрыва после истечени основного таймера (чтобы пульсар отработал полностью)
	PvE_RW.nLaunchRocketsFrom = 1	-- начиная с какой ракеты в списке ракет делать отсчёт времени и запуск
	PvE_RW.nChangePhaseTimer = 12 -- время паузы между фазами по HP
	PvE_RW.nTorpedSpawnTimer = 12 -- время паузы между фазами на запуск торпед
	PvE_RW.nShieldUpTimer	= 2 -- Время поднятия щита и отрастания туррелей

-- для хака с переносом урона по неуязвимому разрушителю
--таблицы hp и урона родителю (по текам, актуально 3-5)
-- нерф т5 =====================================================================================================================================================================
--              12k,    27k,    72k
--туррели х2 (для тестов на т3 х5 и обновление посередене фазы)
rw_th = { 1,1, 60000,  100000,  180000 }
rw_tp = { 1,1, 50000,  90000, 130000 }
rw_td = { 1,1,  3000,   4000,   6000 }  -- дамаг туррелей

-- лазеры
rw_ld = { 1,1,  1200,   1800,   2800 } -- термо дамаг в сек
rw_md = { 1,1, 30000,  40000,  65000 } -- большой лазер урон 
--=====================================================================================================================================================================
--скорлупа (+время респа) 0.2 
rw_sh = { 1,1, 3200000, 5600000, 6400000 }  --health
rw_sp = { 1,1, 1000000, 1750000, 1800000 }  --damage to parent
rw_sr = { 1,1,  30,     25,     20}
--=====================================================================================================================================================================
--сердца х5 (разделено на 2 равные части сразу и при смерти)
rw_lh = { 1,1, 1200000,  1600000, 4000000 }
rw_lp = { 1,1, 3000000, 6000000, 6000000 }

--стабилизаторы х5
rw_bh = { 1,1, 240000, 640000, 1200000 }
rw_bp = { 1,1, 750000, 1500000, 3000000 }

	PvE_RW.turret_death_damage_to_parent = rw_tp[nTier]
	PvE_RW.life_death_damage_to_parent	 = rw_sp[nTier]
	PvE_RW.life_respawn	 				 = rw_sr[nTier]
	PvE_RW.hearth_death_damage_to_parent = rw_lp[nTier]
	PvE_RW.hearth_damage_to_parent_kf	 = 2000000 -- кф сразу переносимого урона по серцу 2.5
	PvE_RW.blackhole_death_damage_to_parent = rw_bp[nTier]
	
	PvE_RW.raidBuffer = BuffByAgro( {

		buffs =
		{
			"Raid_dynamic_AllBodyResist",
			"Raid_dynamic_AllDamageMod",
		},
		
		buff_level_max = 25, -- Максимальный уровень баффов
		check_period = 2, -- Каждые check_period с. проверяем, есть ли убитые раньше времени
		increase_coef = 3, -- Если да, то текущий уровень увеличивается на (increase_coef * количество целей) вплоть до buff_level_max
		increase_coef_mul_max = 2, -- Ограничитель количества целей increase_coef
		decrease_coef = 0.25, -- Если нет, то текущий уровень уменьшается на decrease_coef вплоть до 0
		
	})
end


function PvE_RW:RaidInit()
	PvE_RW.nPhase = -1

	-- сбросить таймер на пуск ракет
	for i = 1, #PvE_RW.aRockets do
		PvE_RW.aRockets[i].nTimer = 0
	end
	PvE_RW.nPortalState = 0
	PvE_RW.nPortalAlive = 0 -- число живых порталов (обновляется в апдейте)
	
	PvE_RW.nPortalCount = 0	-- было 9 отключил нафиг, не используются
	PvE_RW.aPortal = {}
	PvE_RW.aPortalBotsCount = {}
	PvE_RW.aSquadTimer = {}
	PvE_RW.aSquadState = {}
	PvE_RW.aPortalState = {}

	PvE_RW.aBots = {} -- список ботов для определения уничтожения волн
	PvE_RW.aPlayers = {} -- список игроков для определения уничтожения черными дырами

	PvE_RW.nBombCount = 1
	PvE_RW.aBomb = {}
	PvE_RW.aBombTimer = {}
	PvE_RW.nBombAlive = 0 -- число живых инверторов (обновляется в апдейте)
	PvE_RW.aBombType = {}	-- тип инвертора определяется дефом инвертора
	PvE_RW.aBombState = {}	-- соостояние инвертора (для замедлялки - номер ауры, для чёрной дыры - число убитых кораблей)
	PvE_RW.aBombTrigger = {}	-- триггерхарды через отдельные энтити сделаны, список их id
	
	PvE_RW.ShieldState = 0 -- состояние щита 0 - нет, [-1 - не пробиваемый, не используется], >0 пробиваемый
	
	PvE_RW.LaserState = 0 -- состояние лазера 0 - нет, 1 - есть
	PvE_RW.LaserCloseSpeed = 30	-- скорость перемещения лазера ед/сек (вблизи осквернителя)
	PvE_RW.LaserSpeed = 15	-- скорость перемещения лазера ед/сек (дальше от осквернителя на LaserMaxDist)
	PvE_RW.LaserDefLen	= 0.1 -- 1 Вынесение начальной точки лазера относительно позиции туррели (когда нет целей)

	PvE_RW.nAbsorb		= 10	-- радиус поглощения прожектайлов скоролупой (считается от кости)
	PvE_RW.nAbsorbOnShield = 60	-- под щитом работает лучше (даже елси нет скорлупы)
	
	PvE_RW.aAvanpost = {}	-- список аванпостов полиции
	PvE_RW.aAvanpostTimer = {} -- таймер бомб
	PvE_RW.aAvanpostBombDispenser = {} -- места спавна бомб
	PvE_RW.nAvanpostCount = 8
	PvE_RW.nAvanpostAlive = 8
	
	-- для иммитации пулемётов с перегревом, randomtime - рандомная часть перегрева
	PvE_RW.aTurretType = {
		--["G"] = {fire = 1.2, nofire = 2.1, randomtime = 0.5,},
		--["B"] = {fire = 1000, nofire = 0, randomtime = 0,},
		["L"] = {fire = 1000, nofire = 0, randomtime = 0},
		--["P"] = {fire = 1000, nofire = 0, randomtime = 0,},
		--["R"] = {fire = 0.9, nofire = 2.1, randomtime = 0.5,},
		["R"] = {fire = 0.85, nofire = 1.85, randomtime = 0.4,},
		["M"] = {fire = 1000, nofire = 0, randomtime = 0},
	}
	PvE_RW.aTurrets = {} -- id, type-тип туррели (буква G B L P R), state- сосотояние туррели 0 - не активна, 1- активна, 2-перегрев, timer = {} -- таймер, LaserId - Для лазеров
	PvE_RW.nTurrelTimer = 0		
	PvE_RW.nTurrelDelay	= 1/5	-- чтобы не каждый кадр с туррелями работать
	PvE_RW.nLaserChange	= 0.07	-- чем меньше, тем реже будут менять положение рассекатели (мегалазеры) 0 - никогда, 1 -каждый тайминг
	
	PvE_RW.aEgg = {{},{},{},{}}	-- сводная таблица id, и состояний скорлупок и сердец
	-- PvE_RW.aLife = {1,1,1,1} -- состояние скоролупок
	-- PvE_RW.aHearth = {true, true, true, true}	-- список активированных сердец
	-- PvE_RW.aHearthHealth = {}	-- хранилище здоровья сердца, после 0 оживает полностью
	-- PvE_RW.aHearthLive = {1,1,1,1}	-- номер сердца, чем больше - тем меньше будет здоровья
	PvE_RW.nHearthCount = -1 -- число живых сердец (последнее запомненное, для логгирования)

	local a = {}
	
	-- пробегаем по порталам
	for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
		p = Entities[pid]:GetName()
		a[p] = pid
	end
	
	for i=1, PvE_RW.nPortalCount do
		PvE_RW.aPortal[i] = a["alien_portal"..i] -- имена порталов должны быть только такие!
		PvE_RW.aSquadTimer[i] = -1
		PvE_RW.aSquadState[i] = 0
		PvE_RW.aPortalState[i] = false
		PvE_RW.aPortalBotsCount[i] = -1
		sys.log( "portal %d - %d", i , PvE_RW.aPortal[i])
	end
	PvE_RW.aPortal[0] = a["cruiser_portal_out"] -- это портал в который улетит осквернители и из которого полезут камикадзе
	
	-- пробегаем по мегабомбам
	for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do --было ScBaseEntity AnimatedEntity
		p = Entities[pid]:GetName()
		a[p] = pid
	end
	for i, pid in pairs( GetEntitiesByClass( "TriggerHurt" ) ) do -- для чёрных дыр
		p = Entities[pid]:GetName()
		a[p] = pid
	end
	for i, pid in pairs( GetEntitiesByClass( "SpawnSpot" ) ) do -- для камикадзе в конце
		p = Entities[pid]:GetName()
		a[p] = pid
	end

	-- места спавна бомб
	for i, pid in pairs( GetEntitiesByClass( "AnimatedEntity" ) ) do --было ScBaseEntity AnimatedEntity
		p = Entities[pid]:GetName()
		a[p] = pid
	end
	
	PvE_RW.FinalSpawn = a["zombie_spawn_spot"] -- это id перемещаемого финального спавна камикадзе
	PvE_RW.FinalSpawnCooldown = 5 -- время респавна камикадзе
	
	for i=1, PvE_RW.nBombCount do
		PvE_RW.aBomb[i] = a["MegaBomb"..i] -- имена бомб должны быть только такие!
		PvE_RW.aBombTimer[i] = 0
		PvE_RW.aBombState[i] = -1
		s = Entities[PvE_RW.aBomb[i]]:GetDefName() -- тип мегабомбы, будут различаться
		if s == "Megabomb_RW_Slow" then
			PvE_RW.aBombType[i] = 2 --замедлялка
		elseif s == "Megabomb_RW_Portal" then
			PvE_RW.aBombType[i] = 3 --генератор порталов
		elseif s == "Megabomb_RW_BlackHole" then
			PvE_RW.aBombType[i] = 4 --чёрная дыра
			--PvE_RW.aBombTrigger[i] = a["MegaTriggerHurt"..i]
		else
			PvE_RW.aBombType[i] = 1 -- обычная
		end
		sys.log( "Bomb %d - %d - %d", i , PvE_RW.aBomb[i], PvE_RW.aBombType[i])
	end

	-- триггерхартов дыры. 6 штук с учётом снижения мощности -3, для 3х теков
	for i=1, 6 do
		PvE_RW.aBombTrigger[i] = a["MegaTriggerHurt"..i]
		Entities[PvE_RW.aBombTrigger[i]]:Deactivate()	-- сразу их все отключаем
	end

	for i=1, PvE_RW.nAvanpostCount do
		PvE_RW.aAvanpost[i] = a["RaidAvanpost"..i]	--RaidAvanpost8
		PvE_RW.aAvanpostBombDispenser[i] = a["BombDispenser"..i]
	end

	sys.log( "PvE_RW.nPortalCount %d", PvE_RW.nPortalCount )
	sys.log( "PvE_RW.nAvanpostCount %d", PvE_RW.nAvanpostCount )
	
	PvE_RW.timer = 1000 -- таймер для общих нужд (пока юзаю для ожидания анимации закрытия портала крейсера, и задержка проверки на появление самого крейсера)
	PvE_RW.timer2 = 0	-- таймер для задержки респавна туррелей
	PvE_RW.nBombDelay = 0
	
	PvE_RW.isAdditionalColorRemap = false
	PvE_RW.posLastBot = false	-- позиция смерти последного бота
	PvE_RW.isZombieSpawned = true -- зомби заспавлен (не надо их пока)
	PvE_RW.pInfo = false	-- тут инфа об игроках лежит, чтобы только 1 раз за кадр запрашивать её
	PvE_RW.nDistKamikadze = 10	-- радиус самоликвидации камикадзе от любого игрока
	
	PvE_RW.bBlackHole = -10 -- не было ещё дыры и генераторы не спрятаны
	PvE_RW.nBlackHoleLive = 9990	-- время работы чёрной дыры 180
	PvE_RW.nBlackHoleKill = 10	-- сколько корабелй может убить чёрная дыра до того как закроется
	PvE_RW.nBlackHolePlayer = 10	-- сколько корабелй ботов стоит 1 корабль игрока
	PvE_RW.nBlackHoleDist = 0	-- зона уничтожения кораблей (для подсчёта пока что, ну и триггерхард поди надо так же настроить)
	
end


-- вызвать алиена с портала (елси надо активировать портал)
function PvE_RW:RaidSpawnAISquad( nPortal )
	if (nPortal > 0) and (nPortal <= PvE_RW.nPortalCount) then
		if PvE_RW.aSquadTimer[nPortal] < 0 then
			sys.log( "----------------------- show portal %d", nPortal )
			local cruiser = PvE_RW:RaidGetCruiser()
			local portal = Entities[PvE_RW.aPortal[nPortal]]
			if cruiser then
				portal:SetActivationBeamPos(cruiser:GetPos())
			else
				portal:SetActivationBeamPos(portal:GetPos())
			end
			portal:FullActivate(true)
			PvE_RW.aSquadState[nPortal] = 0 -- при открытии портала волны пускаю с начала (там ниже + 1)
			PvE_RW.nPortalAlive = PvE_RW.nPortalAlive + 1
		end
		-- пускаем следующий сквад (если не анлим порталов)
		PvE_RW.aSquadState[nPortal] = PvE_RW.aSquadState[nPortal] + 1
		
		if PvE_RW.aSquadState[nPortal] > #PvE_RW.aMembers[PvE_RW.aPortalType[nPortal]] then
			--PvE_RW.aSquadState[nPortal] = 1 -- вырубаю запуск волн после последней
		end

		if PvE_RW.aSquadState[nPortal] <= #PvE_RW.aMembers[PvE_RW.aPortalType[nPortal]] then
			sys.log( "+++++++++++++++ init patrol %d", nPortal )
			SV_Pve_AISquadSpawn( "Alien_Patrol" .. nPortal .. "_" .. PvE_RW.aSquadState[nPortal])
		else -- защита от переполнения ботами при анлиме порталов
			sys.log( "+++++++++++++++ no more patrol %d", nPortal )
		end

		PvE_RW.aSquadTimer[nPortal] = 0 -- таймер в любом случае сбросить лучше, чтобы логи не забивать
	else
		sys.log( "!!! Invalid nPortal %d", nPortal )
	end
end


function PvE_RW:BotStateUpdate(id)
	local bot, nPortal, nBest, nDist
	bot = Entities[id]
	if bot then
		if bot:GetRelationshipGroup() == ai.RelationshipGroups.Alien then
			if not bot:IsDead() then
				--sys.log( "BotName %s", bot:GetName() )
				if not PvE_RW.aBots[id] then -- бот не описан, новенький, ищем - откуда вылез
					nPortal = 0 -- номер ближайшего к боту портала
					nBest = 99999 -- минимальное расстояние до портала
					for iPortal = 1, PvE_RW.nPortalCount do
						if PvE_RW.aSquadState[iPortal] > 0 then -- портал открыт или открывается
							nDist = #(Entities[PvE_RW.aPortal[iPortal]]:GetPos() - bot:GetPos())
							if nDist < nBest then
								nBest = nDist
								nPortal = iPortal
							end
						end
					end
					
					PvE_RW.aBots[id] = {nPortal, true} -- Ближайший к боту портал, бот жив
				else
					PvE_RW.aBots[id][2] = true -- бот жив (номер портала не меняем)
					nPortal = PvE_RW.aBots[id][1]
				end
				PvE_RW.aPortalBotsCount[nPortal] = PvE_RW.aPortalBotsCount[nPortal] + 1 -- считаем сколько живых ещё ботов вылезло из портала
				PvE_RW.posLastBot = bot:GetPos()	-- запоминаем позицию живого бота
				PvE_RW.aPortalState[nPortal] = true	-- из портала кто-то да вылетал, можно будет проверять, что их всех убили

				-- Kamikadze проверяем на предмет близости к живым игрокам
				local s = bot:GetDefName()
				pos,pos2 = string.find(s,"Kamikadze")
				if pos and pos > 0 and PvE_RW.pInfo then
					-- перебираем игроков
					local i,p,d
					local botpos = bot:GetPos()
					for i, p in pairs( PvE_RW.pInfo ) do -- перебираем игроков
						local pid = p.entityId
						if pid > 0 then -- есть id корабля
							d = #(Entities[pid]:GetPos() - botpos)
							if d < PvE_RW.nDistKamikadze then
								--самоликвидация
								sys.log( "+++ Kamikadze BotName %s", bot:GetName() )
								bot:DieAndBlow()	--#97024

								-- можно и не делать ничего, в следующий кадр само посчитается
								--PvE_RW.aBots[id][2] = false -- убиваем
								--PvE_RW.aPortalBotsCount[nPortal] = PvE_RW.aPortalBotsCount[nPortal] - 1 -- этого не сичтаем за живого
								
								break -- близость с остальными игроками можно уже не смотреть
							end
						end
					end
				end
				
			end
		end
		
		-- смотрим не убила ли чёрная дыра кого-нить и в PvE_RW.aBombState плюсуем (потом это видимо будет запрашиваться у самой дыры и считаться в коде)
		if not bot:IsDead() then
			--sys.log( "BotName %s", bot:GetName() )
			if not PvE_RW.aBots[id] then -- корабль не описан, новенький, заносим в реестр
				PvE_RW.aBots[id] = {0, true} -- корабль не из портала жив
			end
			-- перебираем активные чёрные дыры и убиваем в них попавших, считая в процессе
			for i = 1, PvE_RW.nBombCount do
				--sys.log( "aBombState %d", PvE_RW.aBombState[i] )
				--sys.log( "aBombType %d", PvE_RW.aBombType[i] )
				if (PvE_RW.aBombState[i] >= 0) and (PvE_RW.aBombType[i] == 4) then
					b = Entities[PvE_RW.aBomb[i]]
					d = #(bot:GetPos() - b:GetPos())
					if d < PvE_RW.nBlackHoleDist then
						local bPos = b:GetPos() 
						local id = b:GetId()
						sys.log( "+++ BlackHole %d - BotName %s", i, bot:GetName() )
						-- бот в рандомный портал уходит и провоцирует там волну ботов новую
						local p, r
						r = math.random(#PvE_RW.aPortal)
						p = Entities[PvE_RW.aPortal[r]]
						if bot:GetRelationshipGroup() == ai.RelationshipGroups.Alien then
							bot:SetPos(p:GetPos())
							PvE_RW.aBombState[i] = PvE_RW.aBombState[i] + 1
							SV_Pve_CastSpell( "SmartBombHole_RW", id, id, b, bPos )
							PvE_RW:RaidSpawnAISquad( r )
						else
							SV_Pve_CastSpell( "SmartBombHole_RW", id, id, b, bPos )
							PvE_RW:RaidSpawnAISquad( r )
							PvE_RW.aBombState[i] = PvE_RW.aBombState[i] + PvE_RW.nBlackHolePlayer
							bot:SetPos(p:GetPos())
						end
					end
				end
			end
		end
	end
end



-- потдержка актуального состояния порталов, сквадов, ну и мегабомб до кучи
function PvE_RW:RaidUpdate( dt )

	local cruiser = PvE_RW:RaidGetCruiser()
	PvE_RW.pInfo = GetAllPlayersInfo() -- это надо каждый кадр обновлять для того чтобы камикадзе отслеживать

	-- for i, p in pairs( PvE_RW.pInfo ) do -- перебираем игроков, анализируем ауры на кораблях на невидимость
		-- local pid = p.entityId
		-- p.isVisible = true
		-- if pid > 0 then -- есть id корабля
			-- p.isVisible = not Entities[pid]:CheckAura(ai.Aura.STEALTH)
		-- end
	-- end

	-- следим за щитом
	if cruiser and not cruiser:IsDead() then
		local shield = cruiser:GetShieldEntity()
		if shield and PvE_RW.ShieldState > 0 then
			--local nShieldPortalCount = 0
			--nShieldPortalCount = PvE_RW:GetShieldPortalCount()
			-- if not PvE_RW.nShieldPortalCount then
				-- PvE_RW.nShieldPortalCount = nShieldPortalCount
			-- end
			-- if nShieldPortalCount < PvE_RW.nShieldPortalCount then
				-- shield:SetHealth(shield:GetHealth() - (PvE_RW.nShieldPortalCount - nShieldPortalCount) * 0.25 * shield:GetMaxHealth() )
				-- PvE_RW.nShieldPortalCount = nShieldPortalCount
			-- end
			if shield:GetHealth() <= 0 then
				PvE_RW.ShieldState = 0
				PvE_RW.ShieldLastPos = shield:GetPos()
				PvE_RW.ShieldLastDir = shield:GetDir()
				PvE_RW:RaidCriuserShieldDeactivate()
				--SV_Pve_EmitBlowEffect(shield)	-- взрыв щита
				
				--local id = cruiser:GetId()
				--SV_Pve_CastSpell( PvE_RW_ShieldAura, id, id, cruiser, cruiser:GetPos() )

				------cruiser:SetHealth(cruiser:GetMaxHealth() * 0.9)

				--PvE_RW.isPhaseStarted = false
				sys.log( "=== no more shield")
				--SV_Pve_StartPhase( PvE_RW.nShieldOff )
				--PvE_RW.nLastPhase = 1 -- чтобы щит не поднялся ещё раз
				PvE_RW.timer = 1	-- Разрешаем запуск следующей фазы по HP через секунду

				--[[
				local a = GetAllPlayersInfo()
				local target = false
				local r = 30
				for i, p in pairs( a ) do -- перебираем игроков
					if p.entityId then
						target = Entities[p.entityId]
						pos = target:GetPos()
						SV_Pve_LaunchRocket( "EnergyShield_Rocket" .. math.random(5), cruiser, target, pos ) -- один то осколок надо точно в игрока, а остальные так для антуража (ну и уворачиваться будет веселее)
						for ii = 1, 2+math.random(3) do
							SV_Pve_LaunchRocket( "EnergyShield_Rocket" .. math.random(5), cruiser, target, pos + Vec3(math.random(2*r) - r, math.random(2*r) - r, math.random(2*r) - r) )
						end
					end
				end
				]]--
			else
				PvE_RW.timer = 20 -- не даём запуститься следующей фазе по HP пока щит есть
				------cruiser:SetHealth(cruiser:GetMaxHealth() * (0.9 + 0.07 * shield:GetHealth()/shield:GetMaxHealth()))
			end
		end
		
		--AlienShield_Wreck	--Cruiser_Shield_RW_t3
		-- for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
			-- s = Entities[pid]:GetDefName()
			-- if s == "AlienShield_Wreck" then
				-- --Entities[pid]:SetPosDir(PvE_RW.ShieldLastPos, PvE_RW.ShieldLastDir)
				-- sys.log( "AlienShield_Wreck "..i)
				-- --break
			-- end
		-- end

	end
	
	-- набирать таймер на пуск ракет (если их надо пускать)
	if cruiser and not cruiser:IsDead() then
		for i = PvE_RW.nLaunchRocketsFrom, #PvE_RW.aRockets do
			PvE_RW.aRockets[i].nTimer = PvE_RW.aRockets[i].nTimer + dt
			
			if (not PvE_RW.aRockets[i].nPhase)
				or ((PvE_RW.aRockets[i].nPhase == PvE_RW.nPhase) and not (PvE_RW.aRockets[i].nPhase == PvE_RW.nShieldOff))
				or ((PvE_RW.aRockets[i].nPhase == PvE_RW.nShieldOff) and (PvE_RW.bBlackHole == 2)) then	-- если явно не указана фаза, или фаза совпадает (н она чёрная дыра) или чёрная дыра и дыра жива
			if PvE_RW.aRockets[i].nTimer >= PvE_RW.aRockets[i].nRespawn then
				if not PvE_RW.aRockets[i].nCount then -- нет количества
					PvE_RW.aRockets[i].nTimer = 0
					if PvE_RW.aRockets[i].nTargetType > -3 then -- обычная ракета
						if PvE_RW.aRockets[i].owners then	-- для аур не на разрушителе, пробегаемся по всем
							for iowner = 1, #PvE_RW.aRockets[i].owners do
								ownerDefName = PvE_RW.aRockets[i].owners[iowner]
								for ii, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
									p = Entities[pid]:GetDefName()
									if p == ownerDefName and Entities[pid] and not Entities[pid]:IsDead() then
										PvE_RW:RaidLaunchRocket(PvE_RW.aRockets[i].defName, PvE_RW.aRockets[i].nTargetType, false, Entities[pid])
										--break
									end
								end
							end
						else
							PvE_RW:RaidLaunchRocket(PvE_RW.aRockets[i].defName, PvE_RW.aRockets[i].nTargetType)
						end
					else -- спелл от летящей ракеты, если ракета летит
						-- смотрим ракеты
						for r, id in pairs( GetEntitiesByClass( "Rocket" ) ) do
							s = Entities[id]
							--PvE_RW.R = s
							--sys.log( "Rocket " .. s.defname )
							if s:GetDefName() == PvE_RW.aRockets[i].parent then
								PvE_RW:RaidLaunchRocket(PvE_RW.aRockets[i].defName, PvE_RW.aRockets[i].nTargetType, s:GetPos())
							end
						end
					end
				else -- ракет ограничено
					if PvE_RW.aRockets[i].nLaunched < PvE_RW.aRockets[i].nCount then
						PvE_RW.aRockets[i].nTimer = 0
						PvE_RW.aRockets[i].nLaunched = PvE_RW.aRockets[i].nLaunched + 1
						if PvE_RW.aRockets[i].nTargetType == 4 then	-- нотификация на залп торпедами, пока по типу наведения на аванпосты
							--if PvE_RW.aRockets[i].nLaunched == 1 then
								SV_Pve_ScriptedNotification("RW_TorpedSpawn")
							--end
							for ii=1, PvE_RW.nAvanpostCount do
								ap = Entities[PvE_RW.aAvanpost[ii]]
								if ap and not ap:IsDead() then
									--SV_Pve_TCSMessage( ap )	-- ping не робит что-то
								end
							end
						end
						if PvE_RW.aRockets[i].nLaunched > 1 and PvE_RW.aRockets[i].def2Name then	-- если в паке указан деф2, то все остальные ракеты пака идёт из 2го дефа (дез звука)
							PvE_RW:RaidLaunchRocket(PvE_RW.aRockets[i].def2Name, PvE_RW.aRockets[i].nTargetType)
						else
							PvE_RW:RaidLaunchRocket(PvE_RW.aRockets[i].defName, PvE_RW.aRockets[i].nTargetType)
						end
					else -- кончились, проверяем заправку
						if cruiser and PvE_RW.aRockets[i].aHp and PvE_RW.aRockets[i].nLastHp < #PvE_RW.aRockets[i].aHp then
							local hp = cruiser:GetHealth() / cruiser:GetMaxHealth() * 100
							if hp <= PvE_RW.aRockets[i].aHp[PvE_RW.aRockets[i].nLastHp + 1] then -- тут тоже надо достичь %, а не перевалить, как и при смене фаз
								PvE_RW.aRockets[i].nLastHp = PvE_RW.aRockets[i].nLastHp + 1
								PvE_RW.aRockets[i].nLaunched = 0 -- сбрасываем количество запусков
							end
						end
						if PvE_RW.aRockets[i].nRespawnPack and (PvE_RW.aRockets[i].nTimer >= PvE_RW.aRockets[i].nRespawnPack) then
							PvE_RW.aRockets[i].nTimer = 0
							PvE_RW.aRockets[i].nLaunched = 0 -- сбрасываем количество запусков
						end
					end
				end
			end
			end
		end
	end
	
	--- вырубил на фиг не используемый кусок скрипта
	-- -- считаем живых ботов, если их меньше минимума спавним следующую волну или следующий портал
	-- for id, data in pairs( PvE_RW.aBots ) do
		-- PvE_RW.aBots[id][2] = false -- отмечаем всех известных ботов мёртвыми, далее будет цикл по живым ботам 
	-- end
	-- for iPortal = 0, PvE_RW.nPortalCount do	-- с 0 для тех кто не с портала
		-- --if PvE_RW.aSquadState[iPortal] > 0 then -- портал открыт
			-- PvE_RW.aPortalBotsCount[iPortal] = 0 -- обнуляем счётчик живых ботов
		-- --end
	-- end

	-- for ii, id in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		-- PvE_RW:BotStateUpdate(id)
	-- end

	-- -- теперь порталы сами отслеживают свои волны
	-- PvE_RW.nPortalAlive = 0

	-- for iPortal = 1, PvE_RW.nPortalCount do
		-- if PvE_RW.aSquadState[iPortal] > 0 then
			-- PvE_RW.nPortalAlive = PvE_RW.nPortalAlive + 1
			-- --sys.log( "-------------- portal %d botscount %d", iPortal, PvE_RW.aPortalBotsCount[iPortal] )
			
			-- if PvE_RW.aPortalState[iPortal] and PvE_RW.aPortalBotsCount[iPortal] == 0 then -- кончилась волна
				-- sys.log( "-------------- portal %d PvE_RW.aSquadState[iPortal] = %d", iPortal, PvE_RW.aSquadState[iPortal] )
				-- PvE_RW.aPortalState[iPortal] = false -- отрубаем возможность повторной сработки пока кто-нить не вылетит из портала

				-- if PvE_RW.aSquadState[iPortal] < #PvE_RW.aMembers[PvE_RW.aPortalType[nPortal]] then -- просто пускаем следующую волну
					-- --PvE_RW:RaidSpawnAISquad( iPortal )
					-- -- отключил пока
				-- else -- портал кончился, надо закрыть
					-- PvE_RW.aSquadTimer[iPortal] = -1
					-- PvE_RW.aSquadState[iPortal] = 0
					-- sys.log( "----------------------- hide portal %d", iPortal )
					-- Entities[PvE_RW.aPortal[iPortal]]:FullActivate(false)
					-- PvE_RW.nPortalAlive = PvE_RW.nPortalAlive - 1 -- не надо считать такой портал открытым

					-- --PvE_RW:SpawnBonus() -- установка бонуса в позицию PvE_RW.posLastBot
				-- end
			-- end
		-- end
	-- end

	-- -- проверяем закрытые в ручную порталы, и делаем спавн волн по времени
	-- for i = 1, PvE_RW.nPortalCount do
		-- if PvE_RW.aSquadTimer[i] >=0 then
			-- PvE_RW.aSquadTimer[i] = PvE_RW.aSquadTimer[i] + dt
			-- --sys.log( "--- test portal %d", i )
			-- --sys.log( "--- health portal %d", PvE_RW.aPortal[i]:GetHealth() )
			-- if Entities[PvE_RW.aPortal[i]]:IsDead() then
				-- PvE_RW.aSquadTimer[i] = -1
				-- PvE_RW.aSquadState[i] = 0
				-- sys.log( "----------------------- hide portal %d", i )
				-- --sys.concmd( "e_event " .. PvE_RW.aPortal[i]:GetName() .. " FullDeactivate" )
				-- Entities[PvE_RW.aPortal[i]]:FullActivate(false)
			-- else
				-- --PvE_RW.nPortalAlive = PvE_RW.nPortalAlive + 1
			-- end
			
			-- if PvE_RW.aSquadTimer[i] >= PvE_RW.nSquadRespawn then
				-- PvE_RW:RaidSpawnAISquad( i )
			-- end
		-- end
	-- end
	
	-- PvE_RW.nBombAlive = 0	-- считаем число живых инвероторов
	-- for i = 1, PvE_RW.nBombCount do
		-- --Entities[PvE_RW.aBomb[i]]:FullActivate(false)
		-- if PvE_RW.aBombState[i] >=0 then
			-- PvE_RW.aBombTimer[i] = PvE_RW.aBombTimer[i] - dt
			-- if Entities[PvE_RW.aBomb[i]]:IsDead() or (PvE_RW.aBombType[i] == 4 and (PvE_RW.aBombState[i] >= PvE_RW.nBlackHoleKill)) then
				-- PvE_RW.aBombState[i] = -2 -- убираем совсем, деактивировать не надо уже
				-- --local b = Entities[PvE_RW.aBomb[i]]
				-- -- Entities[PvE_RW.aBomb[i]]:FullActivate(false)
				-- --b:SetHealth(b:GetMaxHealth())
				-- sys.log( "----------------------- bomb killed %d", i )
				-- if PvE_RW.aBombType[i] == 4 then
					-- --b:FullActivate(false)  -- убираем дыру, пока резко, потом анимацию
					-- --Entities[PvE_RW.aBombTrigger[i]]:Deactivate()  -- убираем триггер
					-- PvE_RW.aBombTimer[i] = -3 -- отложенное убирание самой дыры
				-- end
			-- else
				-- PvE_RW.nBombAlive = PvE_RW.nBombAlive + 1
			-- end

			-- if PvE_RW.aBombTimer[i] <= 0 then
				-- --PvE_RW.aBombTimer[i] = -3 -- ещё не взорвалась, но взрыв уже неизбежен
				-- --PvE_RW:RaidLaunchRocket( PvE_RW.sMegaBomb, -1, Entities[PvE_RW.aBomb[i]]:GetPos() )
				-- local b = Entities[PvE_RW.aBomb[i]]
				-- local bPos = b:GetPos() 
				-- local id = b:GetId()
				-- if PvE_RW.aBombType[i] == 1 then --	обычная
					-- PvE_RW.aBombTimer[i] = PvE_RW.nBombTimer -- обнуляем таймер до следующей ауры
					-- for j = 1, #PvE_RW.sMegaBomb do
						-- SV_Pve_CastSpell( PvE_RW.sMegaBomb[j], id, id, b, bPos )
					-- end
				-- elseif PvE_RW.aBombType[i] == 2 then -- замедлялка
					-- PvE_RW.aBombTimer[i] = PvE_RW.nBombTimerSlow -- обнуляем таймер до следующей ауры
					-- if PvE_RW.aBombState[i] < 10 then
						-- PvE_RW.aBombState[i] = PvE_RW.aBombState[i] + 1
					-- end
					-- SV_Pve_CastSpell( "SmartBombSlow"..PvE_RW.aBombState[i].."_RW", id, id, b, bPos )
				-- elseif PvE_RW.aBombType[i] == 3 then --	генератор порталов
					-- PvE_RW.aBombTimer[i] = PvE_RW.nBombTimer -- обнуляем таймер до следующего портала
					-- PvE_RW:RaidSpawnPortal(1) -- ближний
				-- elseif PvE_RW.aBombType[i] == 4 then --	чёрная дыра
					-- --b:FullActivate(false)  -- убираем дыру, пока резко, потом анимацию
					-- sys.log( "----------------------- BlackHole off time %d", i )
					-- --Entities[PvE_RW.aBombTrigger[i]]:Deactivate()  -- убираем триггер
					-- PvE_RW.aBombState[i] = -2
					-- PvE_RW.aBombTimer[i] = -3 -- отложенное убирание самой дыры
				-- end
			-- end
		-- end
		-- -- Дополнительная жизнь до неизбежного взрыва (для пульсара)
		-- if PvE_RW.aBombTimer[i] <=-3 then
			-- PvE_RW.aBombTimer[i] = PvE_RW.aBombTimer[i] - dt
			-- if PvE_RW.aBombTimer[i] < -3-PvE_RW.nBombTimerEx then
				-- PvE_RW.aBombTimer[i] = -1
				-- Entities[PvE_RW.aBomb[i]]:FullActivate(false)
				-- sys.log( "----------------------- bomb exploshion %d", i )
			-- end
		-- end
	-- end
	
	-- if PvE_RW.nBombAlive > 0 and not PvE_RW.isAdditionalColorRemap then
		-- --SV_Pve_SetAdditionalColorRemap( true )
		-- PvE_RW.isAdditionalColorRemap = true
	-- end

	-- if PvE_RW.nBombAlive == 0 and PvE_RW.isAdditionalColorRemap then
		-- --SV_Pve_SetAdditionalColorRemap( false )
		-- PvE_RW.isAdditionalColorRemap = false
	-- end

	-- Аванпосты
	local nAvanpostAlive = 0
	for i=1, PvE_RW.nAvanpostCount do
		ap = Entities[PvE_RW.aAvanpost[i]]
		if ap and not ap:IsDead() then
			nAvanpostAlive = nAvanpostAlive + 1
			
			if PvE_RW.nTier > 3 then -- решили что на т3 это не надо
				if not PvE_RW.aAvanpostTimer[i] then
					PvE_RW.aAvanpostTimer[i] = 5 -- начальное время для появления бомбы
				end

				local nBombCount = 0
				for ii, id in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
					if Entities[ id ]:GetDefName() == "RW_Bomb"then
						nBombCount = nBombCount + 1
					end
				end

				if (PvE_RW.aAvanpostTimer[i] <=0) and (nBombCount < 20) then	-- лимит так то 32, но 12 может быть на руках
					sys.log( "----------------------- bomb spawn %d", i )
					PvE_RW.aAvanpostTimer[i] = 120 -- время респа бомбы, вынести в константы
					SV_Pve_SpawnBomb( "RW_Bomb", Entities[PvE_RW.aAvanpostBombDispenser[i]]:GetPos() + Vec3(0,8,0), Vec3(1,0,0) )
				else
					-- надо проверить что предыдущую бобму взяли
					local btimer = true
					for ii, id in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
						e = Entities[ id ]
						if e:GetDefName() == "RW_Bomb" and #(e:GetPos() - Entities[PvE_RW.aAvanpostBombDispenser[i]]:GetPos())<10 then
							btimer = false
							break
						end
					end
					if btimer then
						PvE_RW.aAvanpostTimer[i] = PvE_RW.aAvanpostTimer[i] - dt
					end
				end
			else -- нет бомб не нужен и диспенсер
				local d = Entities[PvE_RW.aAvanpostBombDispenser[i]]
				if d then
					d:Remove()
				end
			end
		else -- спавны бомб убрать
			local d = Entities[PvE_RW.aAvanpostBombDispenser[i]]
			if d then
				d:Remove()
			end
		end
	end
	if nAvanpostAlive < PvE_RW.nAvanpostAlive then
		PvE_RW.nAvanpostAlive = nAvanpostAlive
		SV_Pve_ScriptedNotification("RW_AvanpostDead"..nAvanpostAlive)
	end

	if nAvanpostAlive == 0 and PvE_RW.nPhase < PvE_RW.nFinishHim then
		if not PvE_RW.nLeaveTimer then
			PvE_RW.nLeaveTimer = 3 -- время разглядеть сообщение о том, что все форпосты уничтожены
		else
			PvE_RW.nLeaveTimer = PvE_RW.nLeaveTimer - dt
		end
			
		if PvE_RW.nLeaveTimer < 0 then
			--SV_Pve_ScriptedNotification("RW_AllAvanpostDead")
			
			--if PvE_RW.nTier == 5 then
			--else
				PvE_RW.nLastPhase = 999	-- отключаю автоматику по смене фаз от HP
				SV_Pve_StartPhase( PvE_RW.nFinishHim ) -- убегает с текущим HP
				PvE_RW.isPhaseStarted = false
			--end
			--!!! тут надо другую причину указать и текст подправить, да и тут не осквернитель уже!
		end
	end

	
	-- -- зомби, надо переделать на спавн в точке не оживлённого некоторое время игрока, зомбей сделать штуки 3 (3й смертельный)
	-- if not PvE_RW.isZombieSpawned then
		-- -- место последнего кила (пока алиена)
		-- local n = 0
		-- local s
		-- for i, id in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
			-- s = Entities[ id ]
			-- if not s:IsDead() and s:GetRelationshipGroup() == ai.RelationshipGroups.Alien then
				-- n = n + 1
				-- PvE_RW.posLastBot = s:GetPos()	-- запоминаем позицию живого бота
			-- end
		-- end
		
		-- if n == 0 and PvE_RW.posLastBot then
			-- for i, id in pairs( GetEntitiesByClass( "SpawnSpot" ) ) do
				-- s = Entities[id]
				-- if s:GetName() == "zombie_spawn_spot" then
					-- s:SetPos(PvE_RW.posLastBot)
				-- end
			-- end

			-- sys.log( "+++++++++++++++ Zombie")
			-- SV_Pve_AISquadSpawn( "Zombie")
		-- end
	-- end

	
	--яйца и сердца (респавн, если не убегает уже)
	---PvE_RW.bHearthInfo - уничтожены все яйца, больши их не обрабатываем вообще!
	local nHearthCount = 0 -- число живых сердец (вынес наружу на всякий пожарный)
	if cruiser and not cruiser:IsDead() and not PvE_RW.bHearthInfo then --and cruiser:GetHealth()/cruiser:GetMaxHealth() > 0.01 * PvE_RW.nTier then
		
		-- для чита на абсорб
		local r = PvE_RW.nAbsorb
		if cruiser:GetShieldEntity() and PvE_RW.ShieldState > 0 then
			r = PvE_RW.nAbsorbOnShield -- под щитом
		end
		
		if PvE_RW.nHearthCount == -1 then	-- инициализация
			for iEgg = 1, 4 do
				PvE_RW.aEgg[iEgg] = {
					idLife = 0,
					idHearth = 0,
					lstate = 1,
					lactive = 1,	-- можно отключить респавн скорлупы на фазу рассекателей, выставив 0
					ltimer = 0,		-- таймер на респ скорлупок брать из PvE_RW.life_respawn
					hstate = 1,
					hhealth = 0,
					hdamage = 0, -- уже перенесено дамага в разрушитель
					hlive = 1,
				}
				for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
					if Entities[pid]:GetDefName() == "Alien_Destroyer_Life_0"..iEgg.."_T"..PvE_RW.nTier then
						PvE_RW.aEgg[iEgg].idLife = pid
					end
					if (Entities[pid]:GetDefName() == "Alien_Destroyer_Hearth_T"..PvE_RW.nTier or Entities[pid]:GetDefName() == "Alien_Destroyer_SmallHearth_T"..PvE_RW.nTier )and #(Entities[pid]:GetPos() - cruiser:GetBoneWorldPos("life"..iEgg)) < 10 then
						PvE_RW.aEgg[iEgg].idHearth = pid
						--PvE_RW.aEgg[iEgg].hhealth = Entities[pid]:GetMaxHealth()
					end
				end
			end
		end

		for iEgg = 1, 4 do
			-- скорлупки
			if PvE_RW.aEgg[iEgg].lstate > -100 then -- скорлупа должна быть физически
				local idLife = PvE_RW.aEgg[iEgg].idLife
				if not idLife then
					sys.log( "!!!!!!!!!!!!! idLife not found %d", iEgg )
					break
				end
				
				local Life = Entities[idLife]
				if not Life then
					sys.log( "!!!!!!!!!!!!! life not found %d", iEgg )
					break
				end

				if Life:IsDead() then ---(PvE_RW.aEgg[iEgg].lactive == 1) and
					if PvE_RW.aEgg[iEgg].lstate == 1 then
						if not cruiser.damagable then	-- хак с проносом дамага в неуязвимого разрушителя
							cruiser:SetHealth(cruiser:GetHealth() - PvE_RW.life_death_damage_to_parent)
						end
						PvE_RW.aEgg[iEgg].lstate = 0
						PvE_RW.aEgg[iEgg].ltimer = PvE_RW.life_respawn
						PvE_RW.aEgg[iEgg].hstate = 2 -- Только что убили скорлупу, надо сердце включить
						sys.log( "=== Life is dead %s", Life:GetDefName() )
					elseif (PvE_RW.aEgg[iEgg].lstate == 0) and (PvE_RW.aEgg[iEgg].lactive == 1) then
						if PvE_RW.aEgg[iEgg].ltimer <= 0 then
							PvE_RW.aEgg[iEgg].lstate = 1
							Life:FullActivate(true)
							sys.log( "=== Life is alive %s", Life:GetDefName() )
						else
							PvE_RW.aEgg[iEgg].ltimer = PvE_RW.aEgg[iEgg].ltimer - dt
						end
					end
				end

				if (PvE_RW.nPhase == PvE_RW.nLaserSpawn) and (PvE_RW.aEgg[iEgg].lactive == 1) then -- хаки на скорлупу (при мегалазерах убрать, а потом вернуть те что убирались выше т3)
					PvE_RW.aEgg[iEgg].lactive = 0
					-- не убираем больше скорлупу!!!
					-- if PvE_RW.aEgg[iEgg].lstate == 1 then 
						--- Life:FullActivate(false)
						-- PvE_RW.aEgg[iEgg].lstate = 0 -- убрали скорлупу
						-- PvE_RW.aEgg[iEgg].hstate = 2 -- Только что убрали скорлупу, надо сердце включить
					-- end
					sys.log( "=== %s, FullActivate(false) state %d", Life:GetDefName(), PvE_RW.aEgg[iEgg].lstate )
				elseif (PvE_RW.aEgg[iEgg].lactive == 0) and (not (PvE_RW.nPhase == PvE_RW.nLaserSpawn)) and (PvE_RW.nTier > 3) then
					-- тут надо ещё проверить поведение на т4, т5
					Life:FullActivate(true)
					PvE_RW.aEgg[iEgg].lstate = 1
					PvE_RW.aEgg[iEgg].ltimer = 0
					PvE_RW.aEgg[iEgg].lactive = 1
					sys.log( "=== %s, FullActivate(true)", Life:GetDefName() )
				end

				if PvE_RW.aEgg[iEgg].lstate == 1 then
					-- нашлось, значит яйцо живое ещё
					nHearthCount = nHearthCount + 1 -- сердце внутри скорлупы есть
				end
			end -- обработка скорлупы

			-- чит на поглащение прожектайлов игроков скорлупой
			if (PvE_RW.aEgg[iEgg].lstate == 1) or (cruiser:GetShieldEntity() and PvE_RW.ShieldState > 0) then
				for ii, pid in pairs( GetEntitiesByClass( "Projectile" ) ) do
					if (Entities[pid]:GetRelationshipGroup() == 1) and #(Entities[pid]:GetPos() - cruiser:GetBoneWorldPos("life"..iEgg)) < r then
						--sys.log( "=== absorb projectile "..Entities[pid]:GetDefName().." %d", Entities[pid]:GetRelationshipGroup())
						Entities[pid]:Remove()
					end
				end
			end

			-------------------------------------------------------------------------------------------------------------------------------------
			-- сердца
			
			if (PvE_RW.aEgg[iEgg].lstate > -100) and (PvE_RW.aEgg[iEgg].hstate > -100) then -- сердце должно быть физически
				local idHearth = PvE_RW.aEgg[iEgg].idHearth
				if not idHearth then
					sys.log( "!!!!!!!!!!!!! idHearth not found %d", iEgg )
					break
				end
				
				local Hearth = Entities[idHearth]
				if not Hearth then
					sys.log( "!!!!!!!!!!!!! Hearth not found %d", iEgg )
					break
				end
				
				if Hearth:IsDead() and (PvE_RW.aEgg[iEgg].hstate == 1) then
					PvE_RW.aEgg[iEgg].hstate = 0
					PvE_RW.aEgg[iEgg].hlive = PvE_RW.aEgg[iEgg].hlive + 1	-- следующая жизнь у сердца
					PvE_RW.aEgg[iEgg].hhealth = Hearth:GetMaxHealth()*2/(PvE_RW.aEgg[iEgg].hlive+1) -- будет меньше здоровья у такого сердца
					sys.log( "== Hearth is dead")

					if not cruiser.damagable then	-- хак с проносом дамага в неуязвимого разрушителя
						cruiser:SetHealth(cruiser:GetHealth() - PvE_RW.hearth_death_damage_to_parent)
					end

					if PvE_RW.nTier < 5 then
						PvE_RW.aEgg[iEgg].lstate = -100 -- скорлупа больше не отрастёт
						PvE_RW.aEgg[iEgg].hstate = -100 -- сердце тоже больше не отрастёт
						Life = Entities[PvE_RW.aEgg[iEgg].idLife] -- почему-то тут уже Life не доступен
						sys.log( "=== %s, FullActivate(false) remove Life", Life:GetDefName() )
						Life:FullActivate(false)
					end
				end
				
				if (PvE_RW.aEgg[iEgg].lstate == 1) and (PvE_RW.aEgg[iEgg].hstate == 1) then -- прячем сердце (одновременно со скорлупой показывать не надо)
					sys.log( "============ off hearth"..iEgg)
						
					PvE_RW.aEgg[iEgg].hhealth = Hearth:GetHealth() -- запоминаем здоровье
					Hearth:FullActivate(false)
					PvE_RW.aEgg[iEgg].hstate = 0

				elseif (PvE_RW.aEgg[iEgg].hstate == 2) then	-- только что убили/убрали сокрлупу, надо заспавнить сердце
					sys.log( "============ on hearth"..iEgg)
					Hearth:FullActivate(true)
					Hearth:SetHealth(PvE_RW.aEgg[iEgg].hhealth)
					PvE_RW.aEgg[iEgg].hstate = 1

					-- рой бидрил
					sys.log( "------------------------------------------ roi")
					--for ii = 1, 10 do
						--PvE_RW:RaidLaunchRocket( "RW_SpaceMissile_Spam_NoSound_t3", 3, Hearth:GetPos())
						--PvE_RW:RaidLaunchRocket( "Cruiser_Torpedo_RW_Roi", 6, false, Hearth )
					--end
				end -- изменение в сердце

				if PvE_RW.aEgg[iEgg].hstate == 1 then
					nHearthCount = nHearthCount + 1 -- сердце живо
					
					local hcurrent = Hearth:GetHealth()
					local hmax = Hearth:GetMaxHealth()--PvE_RW.aEgg[iEgg].hhealth
					local hdamage = (hmax - hcurrent) / hmax - PvE_RW.aEgg[iEgg].hdamage --hmax - hcurrent - PvE_RW.aEgg[iEgg].hdamage
					if hdamage > 0 then
						PvE_RW.aEgg[iEgg].hdamage = PvE_RW.aEgg[iEgg].hdamage + hdamage
						if not cruiser.damagable then	-- хак с проносом дамага в неуязвимого разрушителя
							cruiser:SetHealth(cruiser:GetHealth() - PvE_RW.hearth_damage_to_parent_kf * hdamage) --#####
						end
					end
				end
			end -- обработка сердца
		end -- пробег по яйцам
		
		if not (PvE_RW.nHearthCount == nHearthCount) then
			sys.log( "==== nHearthCount change from=%d, to=%d", PvE_RW.nHearthCount, nHearthCount)
			PvE_RW.nHearthCount = nHearthCount
		end
	end

	--- помираем?
	if cruiser and not cruiser:IsDead() then
		if PvE_RW.bHearthInfo or (nHearthCount == 0) then
			if not PvE_RW.bHearthInfo then -- это 1 разовая акция не обратимая, бобик уже почти сдох после этого.
				sys.log( "==== kill destroyer, no one hearth alive")
				PvE_RW.bHearthInfo = true
				PvE_RW.nLastPhase = 999	-- отключаю автоматику по смене фаз от HP
				SV_Pve_StartPhase( PvE_RW.nFinishHim ) -- убегает с текущим уменьшающимся HP
				PvE_RW.isPhaseStarted = false
			end
			if not PvE_RW.nHearthDamage then
				local d = (cruiser:GetHealth() - cruiser:GetMaxHealth()*0.045)/PvE_RW.nTimeToLeave	---#58324
				if d<0 then d = 0 end
				PvE_RW.nHearthDamage = d
			end
			cruiser:SetHealth(cruiser:GetHealth() - dt * PvE_RW.nHearthDamage) -- нет сердец, дохнет до 5% к воротам --сам 0.5% в секунду cruiser:GetMaxHealth()/200
			-- тут можно реген сделать в зависимости от количества сердец, если их >0
		end
	end

	
	-- туррели
	if cruiser and not cruiser:IsDead() then
		PvE_RW.nTurrelTimer = PvE_RW.nTurrelTimer + dt
		
		if PvE_RW.nTurrelTimer > PvE_RW.nTurrelDelay then
			local nPumping = 0 -- накачка черной дыры лазерами
			for id, t in pairs(PvE_RW.aTurrets) do
				if t.state > 0 then -- пуха активна
					if PvE_RW.aTurretType[t.stype] then
						if Entities[id] and Entities[id]:IsDead() then
							if not cruiser.damagable then	-- хак с проносом дамага в неуязвимого разрушителя
								cruiser:SetHealth(cruiser:GetHealth() - PvE_RW.turret_death_damage_to_parent)
								t.state = 0
							end
						end
						if not Entities[id] then
							sys.log( "================ turret not found %d ", id)
							break
						elseif t.stype == "L" or t.stype == "M" then
							if Entities[id] and Entities[id]:IsDead() then
								t.state = 0
								if t.LaserId then
									Entities[t.LaserId]:Remove()
									t.LaserId = false
								end
							else
								local bexit = false
								if t.stype == "M" then	-- дополнительно смотрим для мегалазеров на яйцах - живы ли их яйца
									local s = Entities[id]:GetDefName()
									for iEgg = 1, 4 do
										if s == "Turret_CruiserAlien_MegaLaser_Life_0"..iEgg then
											--sys.log( "found LifeMegaLaser "..s)
											if not (PvE_RW.aEgg[iEgg].hstate == 1) then -- сердца нет, убираем мегалазер
												sys.log( "remove megalaser Hearth is dead "..s)
												t.state = 0
												bexit = true
												if t.LaserId then
													Entities[t.LaserId]:Remove()
													t.LaserId = false
												end
											end
											break
										end
									end
								end
								if bexit then
									break
								end
								bexit = false -- дальше это начальное наведение
								-- отдельная логика наведения лазеров
								--sys.log( "================ turret id = %d , stype = %s, LaserId = %d", id, t.stype, t.LaserId)
								if not t.LaserId then
									sys.log( "================ laser not found %d ", id)
									break
								end
								l = Entities[t.LaserId]
								if not l then
									sys.log( "================ laser entiti found %d ", id)
									break
								end
								l:Activate(true) -- перенёс сюда, чтобы успела пушка навестись хоть чуть чуть
								local tpos = Entities[id]:GetPos() + PvE_RW.aTurrets[id].offset	-- учитываем смещение для лазеров
								--l:SetPos(tpos)	--#53621
								if not t.LaserPos then
									t.LaserPos = tpos + PvE_RW.aTurrets[id].offset * PvE_RW.LaserDefLen * PvE_RW.LaserMaxDist
									if tpos == t.LaserPos then
										t.LaserPos = t.LaserPos + Vec3(1,0,0) -- инициализируемся в себя + защита от 0го вектора
									end
									----sys.log( "================ laser init %d ", id)
									----sys.log( "================ t.LaserPos %d %d %d", t.LaserPos.x, t.LaserPos.y, t.LaserPos.z)
									bexit = true
								end
								local i, p, d, dp, dir, pos, ppos, d2
								local tdir = Entities[id]:GetDir()	-- направление туррели (меняется т.к. осквернитель поворачивается)
								--tdir = tdir * (1/#tdir) -- направление стрельбы туррели
								local dmin = PvE_RW.LaserMaxDist -- максимальное расстояние наведения
								local pmin = 0
								local amin = PvE_RW.LaserDir -- минимальное отклонение от центрального направления стрельбы туррели
								local apmin = 0 -- номер игрока 
								local a = {}
								-- ищем ближайшего игрока к точке луча
								for i, p in pairs( PvE_RW.pInfo ) do -- перебираем игроков
									local pid = p.entityId
									if pid > 0 then -- есть id корабля
										ppos = Entities[pid]:GetPos()
										dp = ppos - t.LaserPos
										d = #(dp) -- расстояние от точки луча
										d2 = #(ppos - tpos) -- расстояние от туррели
										dir = ppos - tpos
										if #dir == 0 then -- добавил защиту от деления на 0, мало ли
										else
											dir = dir * (1/#dir) -- направление на цель
										end
										local ddir = #(tdir - dir)
										if (ddir < PvE_RW.LaserDir) and (d2 < PvE_RW.LaserMaxDist) then
											if not Entities[pid]:CheckAura(ai.Aura.STEALTH) then 	-- видимость лазеры проверяют
												if (d < dmin) then
													dmin = d
													pmin = pid
												end
												if ddir < amin then
													amin = ddir
													apmin = pid
												end
												a[#a+1] = pid
											end
										else
											---sys.log( "============ laser %d ddir=%d d2=%d pid=%d PvE_RW.LaserDir=%d", id, ddir*1000, d2, pid, PvE_RW.LaserDir*1000)
										end
									end
								end
								
								local aimid = 0	-- Для мониторинга целеуказания лазеров ввожу #83797
								
								if (PvE_RW.nPhase == PvE_RW.nLaserSpawn) and (t.stype == "M") then -- фаза рассекателей (мегалазеры)
									if (math.random() < PvE_RW.nLaserChange) or (t.LaserPos == tpos + Vec3(1,0,0)) then
										-- тут водим рассекателями
										local dir2
										if #a > 0 then	-- есть цели, берём рандомную
											pid = a[math.random(#a)]
											ppos = Entities[pid]:GetPos() + Entities[pid]:GetLinearVelocity() * 0.5	-- с предикшеном на полсекунды
											dir2 = ppos - tpos
										else -- целей нет, водим просто
											repeat
												dir2 = Vec3(math.random()-0.5, math.random()-0.5, math.random()-0.5) * 2
											until #dir2 > 0.01 --выбираем рандомное направление, не 0
										end
										dir2 = dir2 * (1/#dir2) -- нормализуем
										
										if #(tdir - dir2) > PvE_RW.LaserDir then	-- проверяем отклонение
											dir2 = dir2 + tdir
										end
										
										if #dir2 < 0.01 then	-- оставляем дефолтное направление
											dir2 = tdir
										end
										
										pos = tpos + dir2 * 2000
									end
								elseif apmin > 0 then	-- теперь приоритеная цель прямо покурсу, а не та, к которой луч ближе
									pos = Entities[apmin]:GetPos() + Entities[apmin]:GetLinearVelocity() * (PvE_RW.nTurrelDelay/2) -- предикшен
									aimid = apmin
								-- elseif pmin > 0 then
									-- pos = Entities[pmin]:GetPos() + Entities[pmin]:GetLinearVelocity() * (PvE_RW.nTurrelDelay/2) -- предикшен
								-- elseif PvE_RW.nPhase == PvE_RW.nShieldOff then -- фаза черной дыры (вырубил логику накачки, ибо не понятно)
									-- pos = cruiser:GetBoneWorldPos("black") -- нет целей, наводимся на дыру, накачка
									-- nPumping = nPumping + 1
								else
									pos = Entities[id]:GetPos()
									pos = pos + PvE_RW.aTurrets[id].offset * PvE_RW.LaserDefLen * PvE_RW.LaserMaxDist	-- нет целей, убирать лазер ( в позицию 2 ) (pos - cruiser:GetPos())
									-- пока тут разное смещение, в туррелях честное, а в мегалазерах от центра осквернителя!
									aimid = -1
									----sys.log( "================ laser %d offset=%d,%d,%d", id, PvE_RW.aTurrets[id].offset.x, PvE_RW.aTurrets[id].offset.y, PvE_RW.aTurrets[id].offset.z)
								end
								--dp = pos - t.LaserPos
								--d = #(dp)
								
								--local dist = #(Entities[id]:GetPos() - pos) -- дистанция до цели от лазера
								--local speed = PvE_RW.LaserSpeed * dist/PvE_RW.LaserMaxDist + PvE_RW.LaserCloseSpeed * (1-dist/PvE_RW.LaserMaxDist)
								
								--if d > speed * PvE_RW.nTurrelTimer then
									--pos = t.LaserPos + dp * (speed * PvE_RW.nTurrelTimer / d)
								--end
								
								if bexit then
									l:ForceSetAimPos(t.LaserPos)
									---sys.log( "================ laser init %d ", id)
								elseif pos and not(pos == t.LaserPos) then -- а не всегда меняем теперь
									-- тут тоже надо защиту от 0-го вектора!
									if #(tpos - pos) > 1 then	-- #83797 в коде видимо что-то починилии и прицеливание стало работать без смещения по крейсеру.
										l:ForceSetAimPos(pos)
									else
										l:ForceSetAimPos(pos + Vec3(1,0,0))
									end
									-- if #(tpos - (pos - l:GetPos() + cruiser:GetPos())) > 1 then 	-- последствия #53621
										-- l:ForceSetAimPos(pos - l:GetPos() + cruiser:GetPos())
									-- else
										-- l:ForceSetAimPos(pos - l:GetPos() + cruiser:GetPos() + Vec3(1,0,0))
									-- end
									t.LaserPos = pos
									----sys.log( "================ laser reposition %d to=%d", id, aimid)
								end
							end
						end
						
						t.timer = t.timer + PvE_RW.nTurrelTimer
						if t.state == 1 and t.timer > PvE_RW.aTurretType[t.stype].fire then -- перегрев
							t.timer = math.random() * PvE_RW.aTurretType[t.stype].randomtime
							t.state = 2
							Entities[id]:EnableAiThink(false)
						elseif t.state == 2 and t.timer > PvE_RW.aTurretType[t.stype].nofire then -- остыло
							t.timer = 0
							t.state = 1
							Entities[id]:EnableAiThink(true)
						end
					else
						sys.log( "================ unknown turret type %s ", t.stype)
					end
				end --if t.state > 0
			end --for

			PvE_RW.nTurrelTimer = 0 -- посчитали и сбросили
			-- if (PvE_RW.nPhase == PvE_RW.nShieldOff) and (nPumping == 0) then -- фаза черной дыры, а поддержки лазеров нет (вырубил)
				-- sys.log( "=== no more laser pumping, BlackHole off")
				-- SV_Pve_StartPhase( PvE_RW.nGunSpawn )
				-- PvE_RW.nLastPhase = PvE_RW.nLastPhase + 1 -- чтобы дыра ещё не включилась
			-- end
		end --if
	end


	-- чёрная дыра
	local b = Entities[PvE_RW.aBombTrigger[PvE_RW.nTier+1]]
	local b2 = Entities[PvE_RW.aBombTrigger[PvE_RW.nTier-2]]
	local bh = Entities[PvE_RW.aBomb[1]]

	if cruiser then
		if PvE_RW.bBlackHole == 1 then -- поступила команда, надо врубить дыру и колорремап
			sys.log( "BlackHole on" )
			PvE_RW.bBlackHole = 2
			SV_Pve_SetAdditionalColorRemap(true)
			b:Activate()
			bh:FullActivate(true)

			-- врубаем стабилизаторы чёрной дыры
			for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
				if Entities[pid]:GetDefName() == "RW_BlackHoleHealth_T"..PvE_RW.nTier then
					Entities[pid]:FullActivate(true)
				end
			end
			
			PvE_RW.nBlackHoleHealth = 2
		end

		if PvE_RW.bBlackHole == 2 then -- дыра есть
		
			cruiser:SetTargetSpeed( 3 )

			local pos = cruiser:GetBoneWorldPos("black")
			b:SetPos(pos)
			b2:SetPos(pos)
			bh:SetPosDir(pos, cruiser:GetDir())

			-- проверяем живы ли генераторы
			local nHealth = 0
			for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
				if Entities[pid]:GetDefName() == "RW_BlackHoleHealth_T"..PvE_RW.nTier then
					if Entities[pid]:GetHealth()>0 then
						nHealth = nHealth + 1
					end
				end
			end
			if PvE_RW.nBlackHoleHealth > nHealth then -- надо обновить число генераторов и снять hp
				PvE_RW.nBlackHoleHealth = nHealth
				if not cruiser.damagable then	-- хак с проносом дамага в неуязвимого разрушителя
					cruiser:SetHealth(cruiser:GetHealth() - PvE_RW.blackhole_death_damage_to_parent)
				end
				b:Deactivate()
				b2:Activate() -- включаем слабую дыру
			end

			if (nHealth == 0) or (PvE_RW.nPhase == PvE_RW.nFinishHim) then -- нет генераторов - нет дыры, или уже убегаем
				sys.log( "set BlackHole off, generators count = %d", nHealth)
				PvE_RW.bBlackHole = -100
				cruiser:SetTargetSpeed( 20 )
				if nHealth == 0 then
					SV_Pve_ScriptedNotification("RW_GunSpawn")
				end
				--SV_Pve_StartPhase(PvE_RW.nGunSpawn)
				--PvE_RW.nLastPhase = PvE_RW.nLastPhase + 1
				--PvE_RW.timer = PvE_RW.nChangePhaseTimer -- и таймер
				--PvE_RW.isPhaseStarted = false
			end
		end

		-- стабилизаторы вырубаем в начле и в конце
		if PvE_RW.bBlackHole < 0 then
			PvE_RW.bBlackHole = - PvE_RW.bBlackHole
			sys.log( "BlackHole off" )
			for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
				if Entities[pid]:GetDefName() == "RW_BlackHoleHealth_T"..PvE_RW.nTier then
					Entities[pid]:FullActivate(false)
				end
			end
		end
	elseif PvE_RW.bBlackHole == 2 then -- крейсера нет, а дыра есть, надо убрать
		sys.log( "no cruiser BlackHole off" )
		PvE_RW.bBlackHole = 100
	end
	
	if PvE_RW.bBlackHole == 100 then	-- вырубаем саму дыру, и колорремап
		PvE_RW.bBlackHole = 101
		sys.log( "BlackHole remove deactivate!!!" )
		SV_Pve_SetAdditionalColorRemap(false)
		b:Deactivate()
		b2:Deactivate()
		bh:FullActivate(false)
	end
end


-- активация рандомного портала
function PvE_RW:RaidSpawnPortal(nType)	-- false - рандом, 1-ближний, 2-средний, 3-дальний
	-- ищем ближайший портал (парочку) и запускаем нужный сквады !!!
	sys.log( "Portal Spawn" )

	local cruiser = PvE_RW:RaidGetCruiser()
	local nPortalMin = 0
	local nPortalMax = 0
	local nPortalMid = 0
	local nMinDistance = 999999
	local nMaxDistance = 0
	local nMidDistance = 999999
	local d
	local nActive = 0
	
	if nActive > PvE_RW.nMaxAlivePortal then
		sys.log( "!!! Maximum Portal is Spawn" )
		return
	end

	if cruiser and nType then
		for i = 1, PvE_RW.nPortalCount do
			if PvE_RW.aSquadTimer[i] < 0 then 
				d = #(Entities[PvE_RW.aPortal[i]]:GetPos() - cruiser:GetPos())
				if d < nMinDistance then
					nPortalMin = i
					nMinDistance = d
				end
				if d > nMaxDistance then
					nPortalMax = i
					nMaxDistance = d
				end
			else
				nActive = nActive + 1
			end
		end

		for i = 1, PvE_RW.nPortalCount do
			if PvE_RW.aSquadTimer[i] < 0 then 
				d = #(Entities[PvE_RW.aPortal[i]]:GetPos() - cruiser:GetPos())
				d = (nMaxDistance-nMinDistance)/2 - d
				if d<0 then d=-d end
				if d < nMidDistance then
					nPortalMid = i
					nMidDistance = d
				end
			end
		end

		nPortal = nPortalMin -- nType == 1
		if nType == 2 then
			nPortal = nPortalMid
		end
		if nType == 3 then
			nPortal = nPortalMax
		end
		
		if nPortal > 0 then
			PvE_RW:RaidSpawnAISquad( nPortal )
		else
			sys.log( "!!! No more Portal to Spawn" )
		end
	else
		if PvE_RW.nPortalAlive < PvE_RW.nPortalCount then
			local nPortal = math.random(PvE_RW.nPortalCount-PvE_RW.nPortalAlive)
			
			-- ищем соответсвующий не открытый портал
			local n = 0
			for i = 1, PvE_RW.nPortalCount do
				if PvE_RW.aSquadTimer[i] < 0 then 
					n = n + 1
					if n == nPortal then
						PvE_RW:RaidSpawnAISquad( i )
						return
					end
				end
			end
		else
			sys.log( "!!! No more Portal to Spawn" )
			--sys.log( "!!! No cruiser - no portal" )
		end
	end
end


-- активация самой удалённой ещё не активированной бомбы
function PvE_RW:RaidSpawnBomb(isFar)
	sys.log( "Bomb Spawn" )

	local cruiser = PvE_RW:RaidGetCruiser()
	local nBombMin = 0
	local nBombMax = 0
	local nMinDistance = 999999
	local nMaxDistance = 0
	local d
	local nActive = 0
	
	if cruiser then
		for i = 1, PvE_RW.nBombCount do
			if PvE_RW.aBombState[i] == -1 then 
				d = #(Entities[PvE_RW.aBomb[i]]:GetPos() - cruiser:GetPos())
				if d < nMinDistance then
					nBombMin = i
					nMinDistance = d
				end
				if d > nMaxDistance then
					nBombMax = i
					nMaxDistance = d
				end
			end
		end
		
		if isFar then
			nBomb = nBombMax
		else
			nBomb = nBombMin
		end
		if nBomb > 0 then
			PvE_RW.aBombState[nBomb] = 0	-- включаем бомбу
			PvE_RW.aBombTimer[nBomb] = PvE_RW.nBombTimer	-- взводим таймер
			if PvE_RW.aBombType[nBomb] == 4 then
				PvE_RW.aBombTimer[nBomb] = PvE_RW.nBlackHoleLive -- чёрная дыра сразу работает, и это время жизни
				Entities[PvE_RW.aBomb[nBomb]]:FullActivate(true)
				--Entities[PvE_RW.aBombTrigger[nBomb]]:Activate()
			else
				Entities[PvE_RW.aBomb[nBomb]]:FullActivate(true)
			end
			SV_Pve_ScriptedNotification("pveRaid_BombSpawn")
		else
			sys.log( "!!! No more Bomb to Spawn" )
		end
	else
		sys.log( "!!! No cruiser - no bomb" )
	end
end


-- пуск ракеты 0- под себя, 1 - ближние цели, 2- дальние цели, 3 -рандом, 4- аванпост, 5-аванпосты/игроки -1 - мегаядерку в конкретной точке заспавнить, -2 спелл
function PvE_RW:RaidLaunchRocket( defName, nTargetType, vPos, owner )
	if defName then
		sys.log( "____________ prepear LaunchRocket "..defName )
	else
		sys.log( "____________ prepear LaunchRocket XXX")
	end

	local cruiser = PvE_RW:RaidGetCruiser()
	local target
	local aimDir

	local ncount = 0
	local alive = {}
	local adist = {}
	local middist = 0
	
	if not owner then
		owner = cruiser
	end

	if not owner or owner:IsDead() then
		sys.log( " - no owner found for %s", defName)
		return false
	end
	
	target = owner -- по умолчанию цели нет
	if nTargetType > 0 then
		
		if nTargetType >= 4 then	-- рандомно по живым аванпостам, а если таких нет то по игрокам
			for i = 1 , PvE_RW.nAvanpostCount do
				id = PvE_RW.aAvanpost[i]
				p = Entities[id]
				if p and not p:IsDead() then
					ncount = ncount + 1
					alive[ncount] = id
				end
			end
		end
		
		if nTargetType == 6 then -- торпеды по игрокам
			ncount = 0
		end
		
		if ncount==0 or nTargetType >= 5 then	-- рандом живые аванпости или игроки
			local a = GetAllPlayersInfo()
			local d
			for i, p in pairs( a ) do -- перебираем игроков
				local pid = p.entityId
				if pid > 0 and not Entities[pid]:CheckAura(ai.Aura.STEALTH) then -- есть id корабля, и корабль видно
					ncount = ncount + 1
					alive[ncount] = pid
					d = #(Entities[pid]:GetPos() - owner:GetPos())
					adist[ncount] = d
					middist = middist + d
				end
			end
		end
	
		if ncount > 0 then 
			local atarget = {} -- список подходящих целей (собирается в зависимости от типа цели nTargetType)
			local ntarget = 0
			middist = middist / ncount -- среднее расстояние от крейсера до игроков
			
			for i = 1, ncount do
				--sys.log( "dist=%d mid=%d", adist[i], middist)
				
				if (nTargetType >= 3) or ((nTargetType == 1) and (adist[i] <= middist) ) or ((nTargetType == 2) and (adist[i] >= middist)) then
					ntarget = ntarget + 1
					atarget[ntarget] = alive[i]
				end
			end
			
			if ntarget > 0 then
				target = math.random(ntarget)
				if target > ntarget then
					target = ntarget
				end
				--sys.log( "tagrget is %d", target)
				target = Entities[ atarget[target] ]
			end
		end
	end

	--aimDir = target:GetPos() -- owner:GetPos() -- направление на цель
	--aimDir = owner:GetLinearVelocity()	-- не работает на дедикейтед (на клиенте работает из-за наличия отрисовки, которой на сервере нет)
	aimDir = cruiser:GetBoneWorldPos("black") - cruiser:GetPos()	-- хак для определения направления разрушителя (работать будет только на нём)
	vel = Vec3(0,-10,0)
	if nTargetType == 6 then	-- торпеды по игрокам
		aimDir = target:GetPos() - owner:GetPos()
		local dir = owner:GetPos() - (cruiser:GetBoneWorldPos("black") + cruiser:GetPos()) * 0.5
		vPos = owner:GetPos() + dir * (15/#dir) + Vec3(math.random()-0.5,math.random()-0.5,math.random()-0.5) * 20
		vel = dir * (20/#dir) + Vec3(math.random()-0.5,math.random()-0.5,math.random()-0.5) * 10
	elseif nTargetType >= 0 then
		local dir = aimDir -- - vPos
		local d = #dir
		if d<0.1 then 
			d = 0.1
			sys.log( "+++++++++++++++++++++ self aim! %d x,y,z=%d,%d,%d", #dir, dir.x, dir.y, dir.z)
		end
		if not vPos then
			vPos = owner:GetPos()
			--sys.log( "+++++++++++++++++++++ d %d! ", #(dir * (120/d)) )
			vPos = owner:GetPos() + dir * (66/d)	-- 75 чтобы торпеды не взрывались прямо об осквернитель, потом надо точки запуска сделать на краях физики
		end
		--vPos = (owner:GetPos() + target:GetPos()) * 0.5	-- тестовый вариант
		if nTargetType == 4 then	 -- тут надо выбрать вверх или вниз отклонять ракету при запуске - смотря где цель
			--vPos = vPos + Vec3(0,-40,0) -- временный хак для торпед
			if owner:GetPos().y < target:GetPos().y then
				vel = dir*(10/d) + Vec3(0,100,0)	-- цель вверху
			else
				vel = dir*(10/d) + Vec3(0,-100,0) -- цель внизу
			end
			vel = vel + Vec3(math.random()-0.5,math.random()-0.5,math.random()-0.5) * 10	-- рандомное смещение для торпед при запуске, потом будут разные точки спавна из спец. костей.
		end
		
	end
	--sys.log( "+++++++++++++++++++++Launch! ")
	if nTargetType > 0 then
		if target == owner then
			sys.log( "invalid target! ")
		else
			SV_Pve_LaunchRocket( defName, owner, target, aimDir, vPos, vel )
		end
	elseif nTargetType >= -1 then
		SV_Pve_LaunchRocket( defName, owner, target, aimDir, vPos )
	else -- -2 спелл
		if not vPos then
			vPos = owner:GetPos()
		end
		local id = owner:GetId()
		SV_Pve_CastSpell( defName, id, id, target, vPos )
		--sys.log("spell "..defName.." %d %d %d".." ownerDefName = %s", vPos.x, vPos.y, vPos.z, owner:GetDefName())
	end

	if nTargetType == 4 then	-- пингуем аванпост елси в него запущена торпеда
		SV_Pve_TCSMessage( target )	-- ping
	end
end


function PvE_RW:SetTurret(sBigType, sSmallType)	-- установка туррелей осквернителя, большие и малые раздельно ""-нет, G,P,L, R -рандом, 2й параметр не обязателен (скопирует с 1го)
	local i,id,t,s,state
	local cruiser = PvE_RW:RaidGetCruiser()
	if not cruiser then 
		sys.log( "!!! PvE_RW:SetTurret no cruiser")
		return false
	end

	local a = {
		--{"Turret_CruiserAlien_T5G", "G", "_", "G"}, -- большие, малые, идентификатор
		{"Turret_CruiserAlien_T5R", "R", "_", "R"},
		{"Turret_CruiserAlien_T4R", "R", "_", "R"},
		{"Turret_CruiserAlien_T3R", "R", "_", "R"},
		{"Turret_CruiserAlien_T5L", "L", "_", "L"},
		{"Turret_CruiserAlien_T4L", "L", "_", "L"},
		{"Turret_CruiserAlien_T3L", "L", "_", "L"},
		{"Turret_CruiserAlien_MegaLaser", "_", "M", "M"},
		{"Turret_CruiserAlien_MegaLaser_Life_01", "_", "M", "M"},
		{"Turret_CruiserAlien_MegaLaser_Life_02", "_", "M", "M"},
		{"Turret_CruiserAlien_MegaLaser_Life_03", "_", "M", "M"},
		{"Turret_CruiserAlien_MegaLaser_Life_04", "_", "M", "M"},
	}

	if not sSmallType then 
		sSmallType = sBigType
	end
	sys.log( "2===== %s, %s",  sBigType, sSmallType)
	
	if PvE_RW.aTurretType[sBigType] and PvE_RW.aTurretType[sSmallType] then
		PvE_RW:SetTurret("Off", "Off") -- сначала зачистим ка все туррельки, а только потом заспавним новые.
	end
	
	for i, id in pairs(GetEntitiesByClass( "Turret" )) do
		t = Entities[ id ]
		s = Entities[ id ]:GetDefName()
		--sys.log( "===== %d , %d, %s, %s, %s",  i, id, Entities[ id ]:GetDefName(), sBigType, sSmallType)
		
		local bfound = false	-- все туррели должны быть из списка иначе они не отключатся
		local rdir = World2Local(cruiser:GetPos() + cruiser:GetDir(), cruiser)- World2Local(cruiser:GetPos(), cruiser)
		for ii = 1, #a do
			if s == a[ii][1] then
				bfound = true
				if not PvE_RW.aTurrets[id] then
					PvE_RW.aTurrets[id] = {stype = a[ii][4], state = 0, timer = 0}	-- тип, сосотояние, таймер
				end
				if (sBigType == a[ii][2]) or (sSmallType == a[ii][3]) then
					PvE_RW.aTurrets[id].state = 1
					t:FullActivate(true)

					if (a[ii][4] == "L" or a[ii][4] == "M" ) then
						t:EnableAiThink(false) -- не фиг и думать, туррели-заглушки для получения дамага, стреляют лучи
					end

					--sys.log( "activate turret ===== %d, %s",  id, s)
					if (a[ii][4] == "L" or a[ii][4] == "M" ) and not PvE_RW.aTurrets[id].LaserId then
					
						local dir = t:GetDir()	-- t:GetPos() - cruiser:GetPos()
						local d = #dir
						if d<0.1 then -- защита от 0го вектора (пушек без кости)
							dir = Vec3(1,0,0)
							d = 1
							sys.log( "! no bone for PvE_RW.aTurrets[id] = %d",  id)
						end
						local offset = dir * (3/d)
						PvE_RW.aTurrets[id].offset = offset -- смещение от туррели (не стреляет из физики туррели)
						PvE_RW.aTurrets[id].LaserPos = false -- чтобы при повторном включении наводилась с 0
						local laserdef = PvE_RW.LaserGunDef
						if a[ii][4] == "M" then
							laserdef = PvE_RW.LaserGunBigDef
						end

						local tpos = t:GetPos()
						--local tpos = t:GetBonePos("as_fire_01") -- cruiser:GetPos()
						--sys.log( "------------------------------------------------------------------------t:GetBonePos(fire_01) ===== %d , %d, %d, %d",  tpos.x, tpos.y, tpos.z, id)
						
						PvE_RW.aTurrets[id].LaserId = SV_Pve_SpawnLaserGun( laserdef, World2Local(tpos + offset, cruiser) , rdir , cruiser ) --#53621 World2Local(tpos + offset, cruiser) - World2Local(tpos, cruiser)
						if PvE_RW.aTurrets[id].LaserId then
							l = Entities[PvE_RW.aTurrets[id].LaserId]
							--l:SetRot(quat(1,0,0,0))
							-----l:Activate(true)
							--sys.log( "SV_Pve_SpawnLaserGun ===== %d , %d, %s",  i, id, s)
						else
							sys.log( "no LaserGun ===== %d , %d, %s",  i, id, s)
						end
					end
					--t:SetHealth(t:GetMaxHealth())
					--if t:IsDead() then
						--sys.log( "IsDead on ===== %d , %d, %s, health %d",  i, id, Entities[ id ]:GetDefName(), t:GetHealth() )
					--end
				else
					t:FullActivate(false)
					--sys.log( "Deactivate turret ===== %d, %s",  id, s)
					PvE_RW.aTurrets[id].state = 0
					if (a[ii][4] == "L" or a[ii][4] == "M" ) and PvE_RW.aTurrets[id].LaserId then
						l = Entities[PvE_RW.aTurrets[id].LaserId]
						--l:Activate(false)
						if l then
							l:Remove()
						else
							sys.log( "no remove ===== %d , %d, %s",  i, id, s)
						end
						PvE_RW.aTurrets[id].LaserId = false
					end
				end
			end
		end

		if not bfound then
			--sys.log( "!! unknown turret ===== %d, %s",  id, s)
		end
	end
end


function PvE_RW:RaidGetCruiser()
	local cruiser = false

	-- ищем крейсер
	for i, cargoid in pairs( GetEntitiesByClass( "CargoShip" ) ) do -- так то должен быть 1 и вообще не факт, что будет каргошип
		cruiser = Entities[ cargoid ]
	end

	return cruiser
end


function PvE_RW:RaidCriuserShieldPortal(isActivate)
	-- врубаем или вырубаем генераторы щита
	for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
		if Entities[pid]:GetDefName() == "VitalPoint_ShieldPortal_RW" then
			Entities[pid]:FullActivate(isActivate)
		end
	end
end

function PvE_RW:GetShieldPortalCount()
	-- считаем число активных генераторов щита
	local n = 0
	for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
		if Entities[pid]:GetDefName() == "VitalPoint_ShieldPortal_RW" then
			if Entities[pid] and Entities[pid]:IsDead() then
				Entities[pid]:FullActivate(false)
			else
				n = n + 1
			end
		end
	end
	return n
end



function PvE_RW:RaidCriuserIsShieldActive()
	local cruiser = PvE_RW:RaidGetCruiser()

	return cruiser and cruiser:IsShieldActive() 
end


function PvE_RW:RaidCriuserShieldActivate()
	local cruiser = PvE_RW:RaidGetCruiser()
	local shield = cruiser:GetShieldEntity()

	if cruiser and not cruiser:IsDead() and not cruiser:IsShieldActive() then -- активируем щит
		sys.log( "Shield ON" )
		cruiser:ActivateShield(true)
		shield:SetHealth(shield:GetMaxHealth())
		if PvE_RW.testState then
			shield:SetHealth(10000)
		end
		shield:SetDamageable(true)
		PvE_RW.ShieldState = 1
		--PvE_RW:RaidCriuserShieldPortal(true)
		return true
	end
	return false
end


function PvE_RW:RaidCriuserShieldDeactivate()
	local cruiser = PvE_RW:RaidGetCruiser()

	if cruiser and not cruiser:IsDead() and cruiser:IsShieldActive() then -- деактивируем щит
		sys.log( "Shield OFF" )
		cruiser:ActivateShield(false)
		PvE_RW.ShieldState = 0
		
		local shield = cruiser:GetShieldEntity()
		
		--PvE_RW:LaserOn(false) -- не забываем лазеры вырубить
		---PvE_RW:RaidCriuserShieldPortal(false) -- убраны из дефов разрушетелей
	end
end


-- функция вызывается каждый кадр
function PvE_RW:OnUpdateRound(self, dt, curPhase, nTier)

	local cruiser = PvE_RW:RaidGetCruiser()

	if PvE_RW.nPhase == -2 then
		PvE_RW:RaidSet(nTier)	-- в зависимости от тира, будут разные настройки

		PvE_RW:RaidInit()
	end
	
	-- отображение текущей фазы в лог (и wow сообщением)
	if not (PvE_RW.nPhase == curPhase) then
		PvE_RW.nPhase = curPhase
		----PvE_RW.isPhaseStarted = false
		--PvE_RW.nRocketTimer = 0
		sys.log( "================PvE_RW:SV_OnUpdateRound( %d )", curPhase )
		if PvE_RW.nPhase == PvE_RW.nCruiserOut then
			if PvE_RW.nWin == 0 then
				PvE_RW.nWin = -1
				if cruiser then
					PvE_RW:RaidCriuserShieldActivate() -- активируем щит
				end
				-- всё игроки проиграли, крейсер улетел
				return 2, ai.WinReason.ELIMINATION_LEADER_DEAD
			elseif PvE_RW.nWin == 1 then
				sys.log( "win message 2")
				if PvE_RW.nAvanpostAlive == 8 then
					return 1, ai.WinReason.PVE_MISSION_COMPLETE_ALT_2 -- победа
				elseif PvE_RW.nAvanpostAlive >= 4 then
					return 1, ai.WinReason.PVE_MISSION_COMPLETE_ALT_1 -- победа
				else
					return 1, ai.WinReason.PVE_MISSION_COMPLETE -- победа
				end
			end
		end
		if PvE_RW.nPhase > 0 and not (PvE_RW.aWow[PvE_RW.nPhase] == "") and (PvE_RW.isPhaseStarted == false) then
			SV_Pve_ScriptedNotification(PvE_RW.aWow[PvE_RW.nPhase])
		end

	end
	
	if curPhase == PvE_RW.nCruiserSpawn then -- появление осквернителя и закрытие портала
		
		if PvE_RW.timer >= 1000 then	-- начальное время до появления осквернителя
			PvE_RW.timer = PvE_RW.timer + dt
		end
		
		if PvE_RW.timer > 1005 then		-- запускаем осквернителя
				sys.log( "===== Alien ")
				SV_Pve_AISquadSpawn( "Transport_Alien")
				PvE_RW.timer = 999
		end

		if cruiser then
			--cruiser:SetTargetSpeed( 5 )
			if PvE_RW.timer == 999 then
				PvE_RW.timer = 100 + 5 -- длительность отсрочки перед началом анимации закрытия портала
				PvE_RW:RaidCriuserShieldActivate() -- деактивируем щит
				PvE_RW:RaidCriuserShieldDeactivate() -- деактивируем щит
				PvE_RW:SetTurret("R")	--G
				SV_Pve_ScriptedNotification("pveRaid_CruiserSpawn")

				-- вырубаем генераторы щита, пока нет щита
				for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
					if Entities[pid]:GetDefName() == "VitalPoint_ShieldPortal_RW" then
						Entities[pid]:FullActivate(false)
					end
				end

			elseif PvE_RW.timer > 0 and PvE_RW.timer < 999 then
				-- ждём пока анимация проиграется
				PvE_RW.timer = PvE_RW.timer - dt
				if PvE_RW.timer > 10 and PvE_RW.timer < 100 then
					for i, id in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
						if Entities[ id ]:GetName() == "cruiser_portal" and Entities[ id ]:GetLocalPlayTime()<0.1 then
							sys.log( "===== animation ")
							Entities[ id ]:SV_SetActivity( 8, false ) -- надо чтобы анимация закрытия была
							PvE_RW.timer = 5
						end
					end
				end
			elseif PvE_RW.timer < 0 then
				-- ищем и убираем портал из которого крейсер вылазит (дальше должна 2+1я фаза пойти и сюда уже не попадём)
				for i, id in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
					if Entities[ id ]:GetName() == "cruiser_portal" then
						Entities[ id ]:Remove()
					end
				end
			end
		end

	else
		if curPhase == PvE_RW.nTorpedSpawn then -- залп торпедами и ожидание урона 3%
			if not PvE_RW.isPhaseStarted then
				PvE_RW:SetTurret("no")
				
				PvE_RW.isPhaseStarted = true
				PvE_RW.timer = PvE_RW.nTorpedSpawnTimer	-- время паузы между переключениями фаз.
			end
			cruiser:SetTargetSpeed( 6 )
		
		elseif curPhase == PvE_RW.nShieldOn then -- щит с лазерами
			if not PvE_RW.isPhaseStarted then
				PvE_RW:RaidCriuserShieldActivate() -- активируем щит
				PvE_RW.isPhaseStarted = true
				PvE_RW.timer2 = PvE_RW.nShieldUpTimer
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 > 0 then
				PvE_RW.timer2 = PvE_RW.timer2 - dt
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 < 0 then
				PvE_RW.timer2 = 0
				-----PvE_RW:LaserOn(true) -- лазеры, которые бьют насквозь
				PvE_RW:SetTurret("L")

				PvE_RW.isPhaseStarted = true
			end
			cruiser:SetTargetSpeed( 10 )
			
		elseif curPhase == PvE_RW.nShieldOff then -- черная дыра
			if not PvE_RW.isPhaseStarted then
				PvE_RW:RaidCriuserShieldActivate() -- активируем щит для обновления пушек
				PvE_RW.isPhaseStarted = true
				PvE_RW.timer2 = PvE_RW.nShieldUpTimer
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 > 0 then
				PvE_RW.timer2 = PvE_RW.timer2 - dt
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 < 0 then
				PvE_RW.timer2 = 0
				if PvE_RW.bBlackHole == 10 then
					PvE_RW.bBlackHole = 1	-- даём команду на включение чёрной дыры
				end
				PvE_RW:SetTurret("L")
				--PvE_RW.LaserDir = 1.2	-- разница между направлениями стрельбы и на цель, 1 = 60 градусов 2- любое направление
				PvE_RW.isPhaseStarted = true
			end
			cruiser:SetTargetSpeed( 6 )
			
		elseif curPhase == PvE_RW.nGunSpawn then -- фаза пулемётов
			if not PvE_RW.isPhaseStarted then
				PvE_RW:RaidCriuserShieldActivate() -- активируем щит для обновления пушек
				PvE_RW.isPhaseStarted = true
				PvE_RW.timer2 = PvE_RW.nShieldUpTimer
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 > 0 then
				PvE_RW.timer2 = PvE_RW.timer2 - dt
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 < 0 then
				PvE_RW.timer2 = 0
				PvE_RW:SetTurret("R")	-- G

				PvE_RW.isPhaseStarted = true
			end
			cruiser:SetTargetSpeed( 6 )

		elseif curPhase == PvE_RW.nRocketSpawn then -- туррели + ракеты
			if not PvE_RW.isPhaseStarted then
				PvE_RW:RaidCriuserShieldActivate() -- активируем щит для обновления пушек
				PvE_RW.isPhaseStarted = true
				PvE_RW.timer2 = PvE_RW.nShieldUpTimer
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 > 0 then
				PvE_RW.timer2 = PvE_RW.timer2 - dt
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 < 0 then
				PvE_RW.timer2 = 0
				PvE_RW:SetTurret("R")
				
				PvE_RW.isPhaseStarted = true
			end
			cruiser:SetTargetSpeed( 10 )
		
		elseif curPhase == PvE_RW.nLaserSpawn then -- фаза мегалазера
			if not PvE_RW.isPhaseStarted then
				PvE_RW:RaidCriuserShieldActivate() -- активируем щит для обновления пушек
				PvE_RW.isPhaseStarted = true
				PvE_RW.timer2 = PvE_RW.nShieldUpTimer
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 > 0 then
				PvE_RW.timer2 = PvE_RW.timer2 - dt
			elseif PvE_RW.isPhaseStarted and PvE_RW.timer2 < 0 then
				PvE_RW.timer2 = 0
				PvE_RW:SetTurret("R", "M")	-- G

				PvE_RW.LaserCloseSpeed = 5 * PvE_RW.nTier	-- скорость перемещения лазера ед/сек (вблизи осквернителя)
				PvE_RW.LaserSpeed = 5 + PvE_RW.nTier	-- скорость перемещения лазера ед/сек (дальше от осквернителя на LaserMaxDist)
				PvE_RW.LaserDir = 1.15	-- разница между направлениями стрельбы и на цель
				PvE_RW.LaserMaxDist = 1500 -- максимальное расстояние наведения лазеров

				PvE_RW.isPhaseStarted = true
			end
			cruiser:SetTargetSpeed( 6 )

		elseif curPhase == PvE_RW.nStunSpawn then -- + станящие шары (не используется)
			if not PvE_RW.isPhaseStarted then
				PvE_RW:SetTurret("R")	-- G

				PvE_RW.isPhaseStarted = true
			end
			cruiser:SetTargetSpeed( 6 )
		
		elseif curPhase == PvE_RW.nFinishHim then -- крейсер пытается свалить в большой портал
			if not PvE_RW.isPhaseStarted then
				PvE_RW:RaidCriuserShieldDeactivate() -- деактивируем щит

				cruiser:SetTargetSpeed( 20 ) --max

				-- SC-116513 live Проблема с разрушителем | Сбрасываем контроль, чтобы портал не спавнился слишком близко
				local id = cruiser:GetId()
				SV_Pve_CastSpell( "Talent_SlowResist", id, id, cruiser, cruiser:GetPos() )
				
				SV_Pve_AISquadLeave( "Transport_Alien", PvE_RW.nTimeToLeave )
				PvE_RW:SetTurret("R")	--G
				
				sys.log( "+++++++++++++++ Zombie")
				PvE_RW.timer = 0
				
				PvE_RW.isPhaseStarted = true
			-- else
				-- if false and PvE_RW.aPortalBotsCount[0] == 0 and cruiser then -- камикадзе отключены оп просьбе Сергея
					-- if PvE_RW.timer < PvE_RW.FinalSpawnCooldown then
						-- PvE_RW.timer = PvE_RW.timer + dt
					-- else
						-- --sys.log( "+++++++++++++++ Zombie")
						-- s = Entities[PvE_RW.FinalSpawn]

						-- v = cruiser:GetLinearVelocity()	-- использовать нельзя!
						-- d = #v

						-- if d > 1 then
							-- s:SetPos(cruiser:GetPos() + v * (200/d) ) --cruiser_portal_out
							-- SV_Pve_AISquadSpawn( "Zombie")
							-- PvE_RW.timer = 0
							-- sys.log( "+++++++++++++++ Zombie spawn")
						-- else
							-- sys.log( "cruiser #cruiser:GetLinearVelocity() = %d", d)
						-- end
					-- end
				-- end
			end

			if cruiser and (cruiser:GetHealth() <= 0) and (PvE_RW.timer == 0) and (PvE_RW.nWin == 0) then -- хак на килл
				PvE_RW.nWin = 1
				sys.log( "win 1c")
				SV_Pve_KillEntity( cruiser )
				PvE_RW.timer = 1
			end
			if PvE_RW.timer > 0 then
				if PvE_RW.timer > 4 then
					sys.log( "win message")
					if PvE_RW.nAvanpostAlive == 8 then
						return 1, ai.WinReason.PVE_MISSION_COMPLETE_ALT_2 -- победа
					elseif PvE_RW.nAvanpostAlive >= 4 then
						return 1, ai.WinReason.PVE_MISSION_COMPLETE_ALT_1 -- победа
					else
						return 1, ai.WinReason.PVE_MISSION_COMPLETE -- победа
					end
				else
					PvE_RW.timer = PvE_RW.timer + dt
				end
			end
		end

		-- смотрим смену фаз по остатку HP осквернителя
		local cruiser = PvE_RW:RaidGetCruiser()
		if cruiser and PvE_RW.nLastPhase < #PvE_RW.aPhases then
			local hp = cruiser:GetHealth() / cruiser:GetMaxHealth() * 100
			if not PvE_RW.nLastHp then
				PvE_RW.nLastHp = 100
			end
			if math.round(hp) < PvE_RW.nLastHp then
				PvE_RW.nLastHp = math.round(hp)
				if PvE_RW.nLastPhase > 0 then
					--sys.log( "====================================PvE_RW.nLastPhase %d, hp = %d, PvE_RW.time = %d", PvE_RW.nLastPhase, hp, PvE_RW.timer )
				end
			end
			if PvE_RW.timer <= 0 then -- дабавил смену фаз только когда таймер выключен
				if hp <= PvE_RW.aPhases[PvE_RW.nLastPhase + 1][1] then
					PvE_RW.nLastPhase = PvE_RW.nLastPhase + 1
					if not PvE_RW.aPhases[PvE_RW.nLastPhase][3] then
						PvE_RW.isPhaseStarted = false	-- фазу меняем, но действия по запуску фаз ещё не сделаны
					end
					--sys.log( "!================PvE_RW.nLastPhase %d ", PvE_RW.nLastPhase )
					--sys.log( "!================PvE_RW.aPhases[PvE_RW.nLastPhase][2] %d ", PvE_RW.aPhases[PvE_RW.nLastPhase][2] )
					SV_Pve_StartPhase( PvE_RW.aPhases[PvE_RW.nLastPhase][2] )
					PvE_RW.timer = PvE_RW.nChangePhaseTimer -- задержка на смену фаз
					PvE_RW.timer2 = PvE_RW.nShieldUpTimer -- чтобы задержка на появление туррелей работала корректно, даже если фаза та же
					return -- обновление будет уже в новой фазе ибо не фиг
				end
			else
				PvE_RW.timer = PvE_RW.timer - dt
			end
		end
	end

	-- набирать таймер на пуск ракет/сквадов и следить не убили ли порталы (прятать тела)
	PvE_RW:RaidUpdate( dt )
	
	PvE_RW.raidBuffer:Update( dt )
end


function PvE_RW:SV_GetFinishRewardCoefs(self, nTier)
	local levelCoef = PvE_RW.raidBuffer.buff_level / PvE_RW.raidBuffer.buff_level_max
	sys.log( "================PvE_RW:SV_GetFinishRewardCoefs(self, nTier) nTier = %d, PvE_RW.nAvanpostAlive = %d, levelCoef = %d", nTier, PvE_RW.nAvanpostAlive, levelCoef )
	
	local expCoef, credCoef, loyaltyCoef
	
	-- 70% от максимума в 4 порции при 0 аванпостов
	local dolmin = 0.7
	local bestReward = 1	-- тут не доли, а кф
	if PvE_RW.nWin == 1 then
		expCoef = bestReward * (dolmin + (1-dolmin)*PvE_RW.nAvanpostAlive/PvE_RW.nAvanpostCount)
	else
		expCoef = 0.1	-- тут тоже решили с Пономарёвым оставить хоть 10%
	end
	
	-- 40% от максимума в 4 порции при 0 аванпостов
	dolmin = 0.4
	bestReward = 1
	if PvE_RW.nWin == 1 then
		credCoef = bestReward * (dolmin + (1-dolmin)*PvE_RW.nAvanpostAlive/PvE_RW.nAvanpostCount)
	else
		credCoef = 0.1
	end
	
	-- 40% от максимума при 0 аванпостов #67084
	dolmin = 0.4
	bestReward = 1
	if PvE_RW.nWin == 1 then
		loyaltyCoef = bestReward * (dolmin + (1-dolmin)*PvE_RW.nAvanpostAlive/PvE_RW.nAvanpostCount)
	else
		loyaltyCoef = 0.1
	end
	
	expCoef = expCoef * (1 + levelCoef)
	credCoef = credCoef * (1 + levelCoef)
	
	sys.log( "expCoef %0.3f, credCoef %0.3f, loyaltyCoef %0.3f", expCoef, credCoef, loyaltyCoef );
	return expCoef, credCoef--, loyaltyCoef --
end

function PvE_RW:GetBaseLootAttempts(self, nTier)
	sys.log( "================PvE_RW:GetBaseLootAttempts(self, nTier) nTier = %d, PvE_RW.nAvanpostAlive = %d", nTier, PvE_RW.nAvanpostAlive )
	
	if PvE_RW.nWin == 1 then
		return 5 --math.round(PvE_RW.nAvanpostAlive/2+1)
	else
		return 0
	end
end

function PvE_RW:GetSpecialLootAttempts(self, nTier)
	sys.log( "================PvE_RW:GetSpecialLootAttempts(self, nTier) nTier = %d, PvE_RW.nAvanpostAlive = %d", nTier, PvE_RW.nAvanpostAlive )
	
	if PvE_RW.nWin == 1 then
		if PvE_RW.nAvanpostAlive == 8 then
			return 3
		elseif PvE_RW.nAvanpostAlive >= 4 then
			return 2
		else
			return 1
		end
	else
		return 0
	end
end

-----------------------------------------------------------------------------------------------------------
-- функция вызывается каждый кадр, пока миссия активна(когда геймплей активен, после финиша не вызывается).
PvE_Missions.pve_raid_waterharvest_t5.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_RW:OnUpdateRound(self, dt, curPhase, 5)
end

PvE_Missions.pve_raid_waterharvest_t4.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_RW:OnUpdateRound(self, dt, curPhase, 4)
end

PvE_Missions.pve_raid_waterharvest_t3.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_RW:OnUpdateRound(self, dt, curPhase, 3)
end

-- модификация награды #55051
--float, float, float SV_GetFinishRewardCoefs( int roundsFinished )
--int SV_GetBaseLootAttempts( int roundsFinished )
PvE_Missions.pve_raid_waterharvest_t5.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_RW:SV_GetFinishRewardCoefs(self, 5)
end

PvE_Missions.pve_raid_waterharvest_t4.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_RW:SV_GetFinishRewardCoefs(self, 4)
end

PvE_Missions.pve_raid_waterharvest_t3.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_RW:SV_GetFinishRewardCoefs(self, 3)
end


PvE_Missions.pve_raid_waterharvest_t5.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_RW:GetBaseLootAttempts(self, 5)
end

PvE_Missions.pve_raid_waterharvest_t4.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_RW:GetBaseLootAttempts(self, 4)
end

PvE_Missions.pve_raid_waterharvest_t3.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_RW:GetBaseLootAttempts(self, 3)
end


PvE_Missions.pve_raid_waterharvest_t5.rounds[1].SV_GetSpecialLootAttempts = function( self, roundsFinished )
    return PvE_RW:GetSpecialLootAttempts(self, 5)
end

PvE_Missions.pve_raid_waterharvest_t4.rounds[1].SV_GetSpecialLootAttempts = function( self, roundsFinished )
    return PvE_RW:GetSpecialLootAttempts(self, 4)
end

PvE_Missions.pve_raid_waterharvest_t3.rounds[1].SV_GetSpecialLootAttempts = function( self, roundsFinished )
    return PvE_RW:GetSpecialLootAttempts(self, 3)
end
