-- !теперь это чисто т5 вариант
PvE_Missions.pve_raid =
{
	levelName = "pve_raid",
	scenario_description = { "pve_raid_str1", "pve_raid_str2", "pve_raid_str3" },
	need_spawn_warp = true,
	is_boss = true,

	desc = "",
	resurrection_attempts = 2,
	is_raid = true,
	disabled = false,

	--exp_mul = "",
	--min_iLvl = 30, 
	rank  = 10, -- параметр для попадания в очередь. __t5 (тут надо бы 12)
	item_lvl = 25, -- параметр для начисления награды.
	rank_max = 17, -- параметр для выбора миссии на карте галактики.
	bot_difficulty = 2, -- параметр задающий сложность ботов.
	max_loot_attempts_special = 2,
	event_loot_attempts = 3,

	playlist = "RaidMusic_default",

	zone_id = SpaceZone.Empire_IlayMiningsite.zone_id,

	turret_health_coef = 1.2,
	turret_damage_coef = 1.3,

	override_ai_type = ai.Gameplay.MISSION_SCRIPT,

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
			cargoship = "AlienCruiser", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			despawn_portal = "cruiser_portal_out",
			
			members =
			{
				{
				},
			},
		},
	},
	rounds = 
	{
		[ 1 ] =
		{
			type = "SURVIVE",
			exp_reward_portion = 4,
			cred_reward_portion = 4,
			loot_attempts_reward = 4,
			player_spawn_group = 0,

			uiRoundDesc = "raid_r1_rdesc", 

			loot_tables = { { "PVE_T1_PassiveSet" }, { "PVE_T2_ActiveSet" }, { "PVE_T3_Raid_TokenSet" }, { "PVE_T4_Raid_TokenSet" },{ "PVE_T5_Raid_TokenSet" } },
			--win_loot_tables = { { "resource_zeta_add_1_high" }, { "resource_zeta_add_1_high" }, { "resource_zeta_add_1_high" }, { "resource_zeta_add_1_high" },{ "resource_zeta_add_1_high" } },
			win_loot_tables = { { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" }, { "resource_zeta_add_1_low" },{ "resource_zeta_add_1_low" } },
			start_sentence = "CMDR_PVE_RAID_START_ROUND",
			--start_sentence = "CMDR_PVE_START_ROUND_BREACH",

			modifiers =
			{
				--{ spell = "Pve_HealHull_T2",	caster_group = 1, }, -- 1 players team, AI team
				--{ spell = "Pve_HealShield_T2",	caster_group = 1, },
				{ spell = "Pve_Capture_Speed_Mod",	caster_group = 1, },				
			},
			
			precache_defs =
			{
				"xSpaceMissile_Nuke_Raid_Pve",
			},

			start_event = -- не нужно, зашит в pve_mission.lua
			{		
				--{  target = "alien_portal2", action = "FullDeactivate", },
				--{  target = "MegaBomb1", action = "FullDeactivate", },				
			},
			waves =
			{
				[ 1 ] = 
				{
				--[[	boss = { squad = "Transport_Alien", spawn_warp = true, delay = 0, },]]--
					max_agents_at_same_time = 24,	--#60685 лимит энтити превышаем

					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, spawn_group = 9, spawn_warp = true,  delay = 20000, ui_notification = true,},

					{	def = "Alien_Scout_Raid1", count = 4, spawn_group = 4, spawn_warp = true, delay = 0, },
					{	def = "Alien_Scout_Raid1", count = 4, spawn_group = 5, spawn_warp = true, delay = 0, },
					{	def = "Alien_Scout_Raid2", count = 4, spawn_group = 4, spawn_warp = true, delay = 10, },
					{	def = "Alien_Scout_Raid3", count = 2, spawn_group = 5, spawn_warp = true, delay = 15, },
					{	def = "Alien_Scout_Raid4", count = 2, spawn_group = 5, spawn_warp = true, delay = 0, },

					{	def = "Alien_Scout_Raid1", count = 4, spawn_group = 3, spawn_warp = true, delay = 0, },
					{	def = "Alien_Scout_Raid1", count = 4, spawn_group = 2, spawn_warp = true, delay = 0, },
					{	def = "Alien_Scout_Raid2", count = 4, spawn_group = 3, spawn_warp = true, delay = 10, },
					{	def = "Alien_Scout_Raid3", count = 2, spawn_group = 2, spawn_warp = true, delay = 15, },
					{	def = "Alien_Scout_Raid4", count = 2, spawn_group = 2, spawn_warp = true, delay = 0, },
				},
			},
			phases = 
 				{
    			[ 1 ] = 
     				{
					
     			    -- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_kill_list = 
						{
						value = { "phase1end", },
						next_phase = 2,
						},
					},
    			[ 2 ] = 
     				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID_PHASE2",
     			    -- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_kill_list = 
						{
						value = { "cruiser_portal", },
						next_phase = 3,
						},
						-- end_time =
					    -- {
        				-- value = 90, -- секунды
						-- next_phase = 2,
						-- },
   			        },
                	    
     			[ 3 ] = 
    				{
    				-- тот же функционал action event-ов, что и в самом раунде
         			-- start_event = 
         			-- {
						-- {  target = "cruiser_portal", action = "Remove", },
        			-- },
					
					--start_squads = { "Transport_Alien", },
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_boss_hull = 
						{
						value = 0.9,
						next_phase = 5,
						},
    				},
    			[ 4 ] = 
    				{
					
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
						end_time =
					    {
        				value = 75, -- секунды без щита
						next_phase = 5,
						},
						
						end_boss_hull = 
						{
						value = 0.15,
						next_phase = 6,
						},
    				},	
				[ 5 ] = 
    				{
					
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
						end_time =
					    {
        				value = 45, -- секунды в щите
						next_phase = 4,
						},
						
						end_boss_hull = 
						{
						value = 0.15,
						next_phase = 6,
						},
    				},	
				[ 6 ] = 
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID_PHASE3",
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
						--{  target = "escort_spawn_spot1", action = "FullActivate", },
        			},
					-- надо отдельно решить фейлить ли рейд если за минуту не добили крейсер.
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_time = 
					    {
        				value = 90, -- секунды
						next_phase = 7,
						},
    				},	
				[ 7 ] = 
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
						--{  target = "escort_spawn_spot1", action = "FullActivate", },
        			},
					-- надо отдельно решить фейлить ли рейд если за минуту не добили крейсер.
    				},	
                },
		},    
	},
}


-- не используется и не настроено уже
xPvE_Missions = {}
xPvE_Missions.pve_raid_t4 = 
{
	levelName = "pve_raid",
	scenario_description = { "pve_raid_str1", "pve_raid_str2", "pve_raid_str3" },
	need_spawn_warp = true,
	is_boss = true,

	desc = "",
	is_raid = true,
	--exp_mul = "",
	--min_iLvl = 30, 
	rank  = 10,  -- параметр для попадания в очередь.
	item_lvl = 25, -- параметр для начисления награды.
	rank_max = 12, -- параметр для выбора миссии на карте галактики. __t4
	bot_difficulty = 2, -- параметр задающий сложность ботов.
	max_loot_attempts_special = 3,
	
	playlist = "RaidMusic_default",
	
	zone_id = SpaceZone.Empire_IlayMiningsite.zone_id,

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
			cargoship = "AlienCruiser_t3", -- каргошип, который будет двигаться по тому же маршруту с отрядом __t4
			despawn_portal = "cruiser_portal_out",
			
			members = 
			{	
				{		
				},			
			},
		},
	},
	
	rounds = 
	{
	
		[ 1 ] = 
	
		{	
			type = "SURVIVE",
			exp_reward_portion = 4,
			cred_reward_portion = 4,
			loot_attempts_reward = 5,
			player_spawn_group = 0,

			uiRoundDesc = "raid_r1_rdesc", 

			loot_tables = {
				{"PVE_T1_PassiveSet", "PVE_T1_PassiveSet", "PVE_T1_PassiveSet"},
				{"PVE_T2_ActiveSet", "PVE_T2_ActiveSet", "PVE_T2_ActiveSet"},
				{"PVE_T3_Raid_TokenSet", "PVE_T3_Raid_TokenSet", "PVE_T3_Raid_TokenSet"},
				{"PVE_T4_Raid_TokenSet", "PVE_T4_Raid_TokenSet", "PVE_T4_Raid_TokenSet"},
				{"PVE_T5_Raid_TokenSet", "PVE_T5_Raid_TokenSet", "PVE_T5_Raid_TokenSet"}
			},

			start_sentence = "CMDR_PVE_RAID_START_ROUND",
			--start_sentence = "CMDR_PVE_START_ROUND_BREACH",
			
			modifiers =
			{
				--{ spell = "Pve_HealHull_T2",	caster_group = 1, }, -- 1 players team, AI team
				--{ spell = "Pve_HealShield_T2",	caster_group = 1, },
				{ spell = "Pve_Capture_Speed_Mod",	caster_group = 1, },				
			},
			
			start_event = -- не нужно, зашит в pve_mission.lua
			{		
				--{  target = "alien_portal2", action = "FullDeactivate", },
				--{  target = "MegaBomb1", action = "FullDeactivate", },				
			},
			waves =
			{
				[ 1 ] = 
				{
				--[[	boss = { squad = "Transport_Alien", spawn_warp = true, delay = 0, },]]--
					max_agents_at_same_time = 24,

					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, spawn_group = 9, spawn_warp = true,  delay = 20000, ui_notification = true,},
					
					{	def = "Alien_Scout_Raid1", count = 6, spawn_group = 4, spawn_warp = true, delay = 0, },	-- __t4 ?
					{	def = "Alien_Scout_Raid2", count = 3, spawn_group = 4, spawn_warp = true, delay = 10, },
					{	def = "Alien_Scout_Raid3", count = 2, spawn_group = 4, spawn_warp = true, delay = 15, },
					{	def = "Alien_Scout_Raid4", count = 1, spawn_group = 4, spawn_warp = true, delay = 0, },

					{	def = "Alien_Scout_Raid1", count = 6, spawn_group = 3, spawn_warp = true, delay = 0, },
					{	def = "Alien_Scout_Raid2", count = 3, spawn_group = 3, spawn_warp = true, delay = 10, },
					{	def = "Alien_Scout_Raid3", count = 2, spawn_group = 3, spawn_warp = true, delay = 15, },
					{	def = "Alien_Scout_Raid4", count = 1, spawn_group = 3, spawn_warp = true, delay = 0, },
					
				},
			},
			phases = 
 				{
    			[ 1 ] = 
     				{
					
     			    -- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_kill_list = 
						{
						value = { "phase1end", },
						next_phase = 2,
						},
					},
    			[ 2 ] = 
     				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID_PHASE2",
     			    -- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_kill_list = 
						{
						value = { "cruiser_portal", },
						next_phase = 3,
						},
						-- end_time =
					    -- {
        				-- value = 90, -- секунды
						-- next_phase = 2,
						-- },
   			        },
                	    
     			[ 3 ] = 
    				{
    				-- тот же функционал action event-ов, что и в самом раунде
         			-- start_event = 
         			-- {
						-- {  target = "cruiser_portal", action = "Remove", },
        			-- },
					
					--start_squads = { "Transport_Alien", },
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_boss_hull = 
						{
						value = 0.9,
						next_phase = 5,
						},
    				},
    			[ 4 ] = 
    				{
					
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
						end_time =
					    {
        				value = 90,	--75, -- секунды без щита __t4
						next_phase = 5,
						},
						
						end_boss_hull = 
						{
						value = 0.15,
						next_phase = 6,
						},
    				},	
				[ 5 ] = 
    				{
					
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
						end_time =
					    {
        				value = 3,	--45, -- секунды в щите __t4
						next_phase = 4,
						},
						
						end_boss_hull = 
						{
						value = 0.15,
						next_phase = 6,
						},
    				},	
				[ 6 ] = 
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID_PHASE3",
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
						--{  target = "escort_spawn_spot1", action = "FullActivate", },
        			},
					-- надо отдельно решить фейлить ли рейд если за минуту не добили крейсер.
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_time = 
					    {
        				value = 90, -- секунды
						next_phase = 7,
						},
    				},	
				[ 7 ] = 
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
						--{  target = "escort_spawn_spot1", action = "FullActivate", },
        			},
					-- надо отдельно решить фейлить ли рейд если за минуту не добили крейсер.
    				},	
                },
		},    
	},
}


-- не используется и не настроено уже
xPvE_Missions.pve_raid_t3 = 
{
	levelName = "pve_raid",
	scenario_description = { "pve_raid_str1", "pve_raid_str2", "pve_raid_str3" },
	need_spawn_warp = true,
	is_boss = true,

	desc = "",
	is_raid = true,
	--exp_mul = "",
	--min_iLvl = 30, 
	rank  = 6,  -- параметр для попадания в очередь. __t3
	item_lvl = 25, -- параметр для начисления награды.
	rank_max = 15, -- параметр для выбора миссии на карте галактики. __t3
	bot_difficulty = 2, -- параметр задающий сложность ботов.
	max_loot_attempts_special = 3,
	
	playlist = "RaidMusic_default",
	
	zone_id = SpaceZone.Empire_IlayMiningsite.zone_id,

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
			cargoship = "AlienCruiser_t3", -- каргошип, который будет двигаться по тому же маршруту с отрядом __t3
			despawn_portal = "cruiser_portal_out",
			
			members = 
			{	
				{		
				},			
			},
		},
	},
	
	rounds = 
	{
	
		[ 1 ] = 
	
		{	
			type = "SURVIVE",
			exp_reward_portion = 4,
			cred_reward_portion = 4,
			loot_attempts_reward = 4,
			player_spawn_group = 0,

			uiRoundDesc = "raid_r1_rdesc", 

			loot_tables = {
				{"PVE_T1_PassiveSet", "PVE_T1_PassiveSet", "PVE_T1_PassiveSet"},
				{"PVE_T2_ActiveSet", "PVE_T2_ActiveSet", "PVE_T2_ActiveSet"},
				{"PVE_T3_Raid_TokenSet", "PVE_T3_Raid_TokenSet", "PVE_T3_Raid_TokenSet"},
				{"PVE_T4_Raid_TokenSet", "PVE_T4_Raid_TokenSet", "PVE_T4_Raid_TokenSet"},
				{"PVE_T5_Raid_TokenSet", "PVE_T5_Raid_TokenSet", "PVE_T5_Raid_TokenSet"}
			},

			start_sentence = "CMDR_PVE_RAID_START_ROUND",
			--start_sentence = "CMDR_PVE_START_ROUND_BREACH",
			
			modifiers =
			{
				--{ spell = "Pve_HealHull_T2",	caster_group = 1, }, -- 1 players team, AI team
				--{ spell = "Pve_HealShield_T2",	caster_group = 1, },
				{ spell = "Pve_Capture_Speed_Mod",	caster_group = 1, },				
			},
			
			start_event = -- не нужно, зашит в pve_mission.lua
			{		
				--{  target = "alien_portal2", action = "FullDeactivate", },
				--{  target = "MegaBomb1", action = "FullDeactivate", },				
			},
			waves =
			{
				[ 1 ] = 
				{
				--[[	boss = { squad = "Transport_Alien", spawn_warp = true, delay = 0, },]]--
					max_agents_at_same_time = 16,

					{	def = "Ship_Bot_EasyMediumMeat_R2_M_T1", count = 1, spawn_group = 9, spawn_warp = true,  delay = 20000, ui_notification = true,},
					
					{	def = "Alien_Scout_Raid1", count = 4, spawn_group = 4, spawn_warp = true, delay = 0, },	-- __t3
					{	def = "Alien_Scout_Raid2", count = 2, spawn_group = 4, spawn_warp = true, delay = 10, },
					{	def = "Alien_Scout_Raid3", count = 1, spawn_group = 4, spawn_warp = true, delay = 15, },
					{	def = "Alien_Scout_Raid4", count = 1, spawn_group = 4, spawn_warp = true, delay = 0, },

					{	def = "Alien_Scout_Raid1", count = 4, spawn_group = 3, spawn_warp = true, delay = 0, },
					{	def = "Alien_Scout_Raid2", count = 2, spawn_group = 3, spawn_warp = true, delay = 10, },
					{	def = "Alien_Scout_Raid3", count = 1, spawn_group = 3, spawn_warp = true, delay = 15, },
					{	def = "Alien_Scout_Raid4", count = 1, spawn_group = 3, spawn_warp = true, delay = 0, },
					
				},
			},
			phases = 
 				{
    			[ 1 ] = 
     				{
					
     			    -- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_kill_list = 
						{
						value = { "phase1end", },
						next_phase = 2,
						},
					},
    			[ 2 ] = 
     				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID_PHASE2",
     			    -- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_kill_list = 
						{
						value = { "cruiser_portal", },
						next_phase = 3,
						},
						-- end_time =
					    -- {
        				-- value = 90, -- секунды
						-- next_phase = 2,
						-- },
   			        },
                	    
     			[ 3 ] = 
    				{
    				-- тот же функционал action event-ов, что и в самом раунде
         			-- start_event = 
         			-- {
						-- {  target = "cruiser_portal", action = "Remove", },
        			-- },
					
					--start_squads = { "Transport_Alien", },
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_boss_hull = 
						{
						value = 0.9,
						next_phase = 5,
						},
    				},
    			[ 4 ] = 
    				{
					
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
						end_time =
					    {
        				value = 120,	--75, -- секунды без щита __t3
						next_phase = 5,
						},
						
						end_boss_hull = 
						{
						value = 0.15,
						next_phase = 6,
						},
    				},	
				[ 5 ] = 
    				{
					
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
        			},
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
						end_time =
					    {
        				value = 3,	--45, -- секунды в щите __t3
						next_phase = 4,
						},
						
						end_boss_hull = 
						{
						value = 0.15,
						next_phase = 6,
						},
    				},	
				[ 6 ] = 
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
					start_sentence = "CMDR_PVE_RAID_PHASE3",
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
						--{  target = "escort_spawn_spot1", action = "FullActivate", },
        			},
					-- надо отдельно решить фейлить ли рейд если за минуту не добили крейсер.
        			 -- условия окончания фазы. достаточно выполниться любому из них. можно указывать любые комбинации.
        				end_time = 
					    {
        				value = 90, -- секунды
						next_phase = 7,
						},
    				},	
				[ 7 ] = 
    				{
					playlist = "RaidMusic_special",
					important_playlist = true,
    				-- тот же функционал action event-ов, что и в самом раунде
         			start_event = 
         			{
						--{  target = "escort_spawn_spot1", action = "FullActivate", },
        			},
					-- надо отдельно решить фейлить ли рейд если за минуту не добили крейсер.
    				},	
                },
		},    
	},
}



-- формирование состава аддов в порталах
local iportal
local ipatrol
local amembers = {
		{
				{ "Alien_Scout_Raid2" , Vec3( 0, 0, 0 ) },	---#61630
				---{ "Alien_Scout_Raid1" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid1" , Vec3( -10, 0, -10 ) },
		},
		{
				{ "Alien_Scout_Raid3" , Vec3( 0, 0, 0 ) },	---#61630
				{ "Alien_Scout_Raid2" , Vec3( 0, 10, -10 ) },	--#60685
				--{ "Alien_Scout_Raid1" , Vec3( 10, 0, 10 ) },	--#60685
				--{ "Alien_Scout_Raid1" , Vec3( -10, -10, 0 ) },
		},
		{
				{ "Alien_Scout_Raid4" , Vec3( 0, 0, 0 ) },	--#60685
				--{ "Alien_Scout_Raid2" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid2" , Vec3( -10, -10, 0 ) },
		},
		{
				{ "Alien_Scout_Raid5" , Vec3( 0, 0, 0 ) },	--#60685
				--{ "Alien_Scout_Raid3" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid2" , Vec3( -10, -10, 0 ) },
		},
	}
	
local amembers_t4 = {
		{
				{ "Alien_Scout_Raid1" , Vec3( 0, 0, 0 ) },
				{ "Alien_Scout_Raid1" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid1" , Vec3( -10, 0, -10 ) },
		},
		{
				{ "Alien_Scout_Raid2" , Vec3( 0, 0, 0 ) },
				{ "Alien_Scout_Raid1" , Vec3( 0, 10, -10 ) },
				{ "Alien_Scout_Raid1" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid1" , Vec3( -10, -10, 0 ) },
		},
		{
				{ "Alien_Scout_Raid3" , Vec3( 0, 0, 0 ) },
				--{ "Alien_Scout_Raid2" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid2" , Vec3( -10, -10, 0 ) },
		},
		{
				{ "Alien_Scout_Raid4" , Vec3( 0, 0, 0 ) },
				--{ "Alien_Scout_Raid3" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid2" , Vec3( -10, -10, 0 ) },
		},
	}
	
local amembers_t3 = {
		{
				{ "Alien_Scout_Raid1" , Vec3( 0, 0, 0 ) },
				--{ "Alien_Scout_Raid1" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid1" , Vec3( -10, 0, -10 ) },
		},
		{
				{ "Alien_Scout_Raid1" , Vec3( 0, 0, 0 ) },
				{ "Alien_Scout_Raid1" , Vec3( 0, 10, -10 ) },
				--{ "Alien_Scout_Raid1" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid1" , Vec3( -10, -10, 0 ) },
		},
		{
				{ "Alien_Scout_Raid2" , Vec3( 0, 0, 0 ) },
				{ "Alien_Scout_Raid1" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid2" , Vec3( -10, -10, 0 ) },
		},
		{
				{ "Alien_Scout_Raid3" , Vec3( 0, 0, 0 ) },
				--{ "Alien_Scout_Raid3" , Vec3( 10, 0, 10 ) },
				--{ "Alien_Scout_Raid2" , Vec3( -10, -10, 0 ) },
		},
	}
	
for iportal = 1, 9 do
	for ipatrol = 1, 4 do
		a = {
			name = "Alien_Patrol"..iportal.."_"..ipatrol,
			relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "alien_spawn_spot"..iportal,
			route = "alien_path1", --..iportal,
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			respawn_time = 12000,
			--players_first = true,
			members = {},
		}
		table.insert(a.members, amembers[ipatrol])
		table.insert(PvE_Missions.pve_raid.squads, a)

		a_t4 = {
			name = "Alien_Patrol"..iportal.."_"..ipatrol,
			relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "alien_spawn_spot"..iportal,
			route = "alien_path1", --..iportal,
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			respawn_time = 12000,
			--players_first = true,
			members = {},
		}
		table.insert(a_t4.members, amembers_t4[ipatrol])
--		table.insert(PvE_Missions.pve_raid_t4.squads, a_t4)

		a_t3 = {
			name = "Alien_Patrol"..iportal.."_"..ipatrol,
			relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "alien_spawn_spot"..iportal,
			route = "alien_path1", --..iportal,
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			respawn_time = 12000,
			--players_first = true,
			members = {},
		}
		table.insert(a_t3.members, amembers_t3[ipatrol])
--		table.insert(PvE_Missions.pve_raid_t3.squads, a_t3)
	end
end


-- Общий контейнер
PvE_Raid = {
	nPhase = -2,	-- это необходимо для запуска настройки
}
	
-- Настройки зависят от тира рейда. __t3 __t4
function PvE_Raid:RaidSet(nTier)
	sys.log( "================PvE_Raid:RaidSet( nTier = %d )", nTier )
	PvE_Raid.nSquadRespawn = 20
	PvE_Raid.nAliveAliensToSpawnCruiser = 2 -- сколько должно остаться живых алиенов чтобы заспавнился крейсер
	PvE_Raid.nSquadCountInPortal = 4 -- количество волн аддов из 1 портала
	PvE_Raid.nMaxAlivePortal = nTier-1 -- #60685 5 максимальное число открытых порталов
	PvE_Raid.noLimit = false -- в конце игнорим предел открытых порталов, но и не спавним алиенов сверх цикла
	if nTier == 5 then
		PvE_Raid.nExtraPortalSpawn = 0 -- 6 если живых игроков больше, то в фазе щита заспавнится 2й портал
		PvE_Raid.EnableShield = true
		PvE_Raid.aWow = {"", "", "", "pveRaid_ShieldOff", "pveRaid_PortalSpawn", "pveRaid_FinishHim", ""}
		PvE_Raid.aMegaBombHp = {70, 50, 30, }
	else
		PvE_Raid.nExtraPortalSpawn = 999 -- 6 если живых игроков больше, то в фазе щита заспавнится 2й портал
		PvE_Raid.EnableShield = false
		PvE_Raid.aWow = {"", "", "", "", "pveRaid_PortalSpawn", "pveRaid_FinishHim", ""}
		PvE_Raid.aMegaBombHp = {}
	end

	--nExtraBombSpawn = 0, -- 6 если живых игроков больше, то в фазе щита заспавнится бомба
	-- тип цели nTargetType: 0 -под себя, 1 - ближдняя цель, 2 - дальняя цель, 3 рандом, -1 - мегаядерку в конкретной точке заспавнить, -2 спелл
	if nTier == 5 then
		PvE_Raid.aRockets =
		{
			{
				defName = "xSpaceMissile_Nuke_Raid_Pve",
				nRespawn = 12,
				nTargetType = 0,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_Pve",
				nRespawn = 15,
				nTargetType = 2,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_Pve",
				nRespawn = 15,
				nTargetType = 2,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_Pve_Slow",
				nRespawn = 15,
				nTargetType = 1,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_Pve_Slow",
				nRespawn = 15,
				nTargetType = 1,
				nTimer = 0
			},
			{
				defName = "SmartBombClose_Raid_Pve",
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0
			},
			{
				defName = "SmartBombKill_Raid_Pve",
				nRespawn = 60*18,
				nTargetType = -2,
				nTimer = 0
			},
		}
		
		PvE_Raid.sMegaBomb = { "SmartBombFarSmall_Raid_Pve", "SmartBombFarMedium_Raid_Pve", "SmartBombFarLarge_Raid_Pve", "SmartBombFarHuge_Raid_Pve", } --"MegaBomb_Raid_Pve" был взырв стал пульсар (каждый тик отследживается скрипом пока бомба жива)
		PvE_Raid.nBombDelayTime = 15
		
	elseif nTier == 4 then
		PvE_Raid.aRockets =
		{
			{
				defName = "xSpaceMissile_Nuke_Raid_Pve",
				nRespawn = 12,
				nTargetType = 0,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_t4",
				nRespawn = 15,
				nTargetType = 2,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_t4",
				nRespawn = 15,
				nTargetType = 2,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_t4_Slow",
				nRespawn = 15,
				nTargetType = 1,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_t4_Slow",
				nRespawn = 15,
				nTargetType = 1,
				nTimer = 0
			},
			{
				defName = "SmartBombClose_Raid_t4",
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0
			},
			{
				defName = "SmartBombKill_Raid_Pve",
				nRespawn = 60*18,
				nTargetType = -2,
				nTimer = 0
			},
		}
		
		PvE_Raid.sMegaBomb = { "SmartBombFarSmall_Raid_t4", "SmartBombFarMedium_Raid_t4", "SmartBombFarLarge_Raid_t4", "SmartBombFarHuge_Raid_t4", } --"MegaBomb_Raid_Pve" был взырв стал пульсар (каждый тик отследживается скрипом пока бомба жива)
		PvE_Raid.nBombDelayTime = 15

	elseif nTier == 3 then
		PvE_Raid.aRockets =
		{
			{
				defName = "xSpaceMissile_Nuke_Raid_Pve",
				nRespawn = 12,
				nTargetType = 0,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_t3",
				nRespawn = 18,
				nTargetType = 2,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_t3",
				nRespawn = 18,
				nTargetType = 2,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_Pve_t3",
				nRespawn = 18,
				nTargetType = 1,
				nTimer = 0
			},
			{
				defName = "xSpaceMissile_ThermalDamageZone_Raid_Pve_t3",
				nRespawn = 18,
				nTargetType = 1,
				nTimer = 0
			},
			{
				defName = "SmartBombClose_Raid_t3",
				nRespawn = 10,
				nTargetType = -2,
				nTimer = 0
			},
			{
				defName = "SmartBombKill_Raid_Pve",
				nRespawn = 60*18,
				nTargetType = -2,
				nTimer = 0
			},
		}
		
		PvE_Raid.sMegaBomb = { "SmartBombFarSmall_Raid_Pve", "SmartBombFarMedium_Raid_Pve", "SmartBombFarLarge_Raid_Pve", "SmartBombFarHuge_Raid_Pve", } --"MegaBomb_Raid_Pve" был взырв стал пульсар (каждый тик отследживается скрипом пока бомба жива)
		PvE_Raid.nBombDelayTime = 9999
	end
	
	--nBombTimer = 30, -- время за которое надо убить мегабомбу - иначе она рванёт
	PvE_Raid.nBombTimer = 16 -- частота пульсара
	PvE_Raid.nBombTimerEx = 1 -- время до неминуемого взрыва после истечени основного таймера (не используется)
	PvE_Raid.nTimeToLeave = 89
	
	PvE_Raid.raidBuffer = BuffByAgro( {

		buffs =
		{
			"Raid_dynamic_AllBodyResist",
			"Raid_dynamic_AllDamageMod",
		},
		
		buff_level_max = 25, -- Максимальный уровень баффов
		check_period = 3, -- Каждые check_period с. проверяем, есть ли убитые раньше времени
		increase_coef = 1.5, -- Если да, то текущий уровень увеличивается на (increase_coef * количество целей) вплоть до buff_level_max
		increase_coef_mul_max = 3, -- Ограничитель количества целей increase_coef
		decrease_coef = 0.35, -- Если нет, то текущий уровень уменьшается на decrease_coef вплоть до 0
		
	})
end


function PvE_Raid:RaidInit()
	PvE_Raid.nPhase = -1

	-- сбросить таймер на пуск ракет
	for i = 1, #PvE_Raid.aRockets do
		PvE_Raid.aRockets[i].nTimer = 0
	end
	PvE_Raid.nPortalState = 0
	
	PvE_Raid.nPortalCount = 9
	PvE_Raid.aPortal = {}
	PvE_Raid.aSquadTimer = {}
	PvE_Raid.aSquadState = {}

	PvE_Raid.nBombCount = 15
	PvE_Raid.aBomb = {}
	PvE_Raid.aBombTimer = {}
	
	local a = {}
	
	-- пробегаем по порталам
	for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
		p = Entities[pid]:GetName()
		a[p] = pid
	end
	
	for i=1, PvE_Raid.nPortalCount do
		PvE_Raid.aPortal[i] = a["alien_portal"..i] -- имена порталов должны быть только такие!
		PvE_Raid.aSquadTimer[i] = -1
		PvE_Raid.aSquadState[i] = 0
		sys.log( "portal %d - %d", i , PvE_Raid.aPortal[i])
	end
	
	-- пробегаем по мегабомбам
	PvE_Raid.nLastHp = 0
	for i, pid in pairs( GetEntitiesByClass( "Turret" ) ) do --было ScBaseEntity AnimatedEntity #65520
		p = Entities[pid]:GetName()
		a[p] = pid
	end
	
	for i=1, PvE_Raid.nBombCount do
		PvE_Raid.aBomb[i] = a["MegaBomb"..i] -- имена бомб должны быть только такие!
		PvE_Raid.aBombTimer[i] = -1
		sys.log( "Bomb %d - %d", i , PvE_Raid.aBomb[i])
	end

	sys.log( "PvE_Raid.nPortalCount %d", PvE_Raid.nPortalCount )
	if PvE_Raid.nPortalCount > 0 then
		--for i = 1, 2 do
			--PvE_Raid:RaidSpawnAISquad( 1 )
		--end
	end
	
	PvE_Raid.timer = 1000 -- таймер для общих нужд (пока юзаю для ожидания анимации закрытия портала крейсера, и задержка проверки на появление самого крейсера)
	PvE_Raid.nBombDelay = 0
	
	PvE_Raid.isAdditionalColorRemap = false
end

-- вызвать алиена с портала (елси надо активировать портал)
function PvE_Raid:RaidSpawnAISquad( nPortal )
	if (nPortal > 0) and (nPortal <= PvE_Raid.nPortalCount) then
		if PvE_Raid.aSquadTimer[nPortal] < 0 then
			sys.log( "----------------------- show portal %d", nPortal )
			local cruiser = PvE_Raid:RaidGetCruiser()
			local portal = Entities[PvE_Raid.aPortal[nPortal]]
			if cruiser then
				portal:SetActivationBeamPos(cruiser:GetPos())
			else
				portal:SetActivationBeamPos(portal:GetPos())
			end
			portal:FullActivate(true)
		end
		-- пускаем следующий сквад (если не анлим порталов)
		PvE_Raid.aSquadState[nPortal] = PvE_Raid.aSquadState[nPortal] + 1
		if PvE_Raid.aSquadState[nPortal] > PvE_Raid.nSquadCountInPortal and not PvE_Raid.noLimit then
			PvE_Raid.aSquadState[nPortal] = 1
		end

		if PvE_Raid.aSquadState[nPortal] <= PvE_Raid.nSquadCountInPortal then
			sys.log( "+++++++++++++++ init patrol %d", nPortal )
			SV_Pve_AISquadSpawn( "Alien_Patrol" .. nPortal .. "_" .. PvE_Raid.aSquadState[nPortal])
		else -- защита от переполнения ботами при анлиме порталов
			sys.log( "+++++++++++++++ no more patrol %d", nPortal )
		end

		PvE_Raid.aSquadTimer[nPortal] = 0 -- таймер в любом случае сбросить лучше, чтобы логи не забивать
	else
		sys.log( "!!! Invalid nPortal %d", nPortal )
	end
end

-- поддержка актуального состояния порталов, сквадов, ну и мегабомб до кучи
function PvE_Raid:RaidUpdate( dt )
	local nActiveBombCount = 0
	
	-- набирать таймер на пуск ракет
	for i = 1, #PvE_Raid.aRockets do
		PvE_Raid.aRockets[i].nTimer = PvE_Raid.aRockets[i].nTimer + dt
	end

	for i = 1, PvE_Raid.nPortalCount do
		if PvE_Raid.aSquadTimer[i] >=0 then
			PvE_Raid.aSquadTimer[i] = PvE_Raid.aSquadTimer[i] + dt
			--sys.log( "--- test portal %d", i )
			--sys.log( "--- health portal %d", PvE_Raid.aPortal[i]:GetHealth() )
			if Entities[PvE_Raid.aPortal[i]] and Entities[PvE_Raid.aPortal[i]]:IsDead() then
				PvE_Raid.aSquadTimer[i] = -1
				PvE_Raid.aSquadState[i] = 0
				sys.log( "----------------------- hide portal %d", i )
				--sys.concmd( "e_event " .. PvE_Raid.aPortal[i]:GetName() .. " FullDeactivate" )
				Entities[PvE_Raid.aPortal[i]]:FullActivate(false)
			end
			
			if PvE_Raid.aSquadTimer[i] >= PvE_Raid.nSquadRespawn then
				PvE_Raid:RaidSpawnAISquad( i )
			end
		end
	end
	
	for i = 1, PvE_Raid.nBombCount do
		if PvE_Raid.aBombTimer[i] >=0 then
			PvE_Raid.aBombTimer[i] = PvE_Raid.aBombTimer[i] + dt
			if Entities[PvE_Raid.aBomb[i]] and Entities[PvE_Raid.aBomb[i]]:IsDead() then
				PvE_Raid.aBombTimer[i] = -2 -- убираем совсем, деактивировать не надо уже
				--local b = Entities[PvE_Raid.aBomb[i]]
				-- Entities[PvE_Raid.aBomb[i]]:FullActivate(false)
				--b:SetHealth(b:GetMaxHealth())
				sys.log( "----------------------- bomb killed %d", i )
			else
				nActiveBombCount = nActiveBombCount + 1
			end

			if PvE_Raid.aBombTimer[i] >= PvE_Raid.nBombTimer then
				--PvE_Raid.aBombTimer[i] = -3 -- ещё не взорвалась, но взрыв уже неизбежен
				--PvE_Raid:RaidLaunchRocket( PvE_Raid.sMegaBomb, -1, Entities[PvE_Raid.aBomb[i]]:GetPos() )
				PvE_Raid.aBombTimer[i] = 0 -- обнуляем таймер до следующей ауры
				local b = Entities[PvE_Raid.aBomb[i]]
				local vPos = b:GetPos() 
				local id = b:GetId()
				for j = 1, #PvE_Raid.sMegaBomb do
					SV_Pve_CastSpell( PvE_Raid.sMegaBomb[j], id, id, b, vPos )
				end
			end
		end
		-- Дополнительная жизнь до неизбежного взрыва (отключено)
		if PvE_Raid.aBombTimer[i] <=-3 then
			PvE_Raid.aBombTimer[i] = PvE_Raid.aBombTimer[i] - dt
			if PvE_Raid.aBombTimer[i] < -3-PvE_Raid.nBombTimerEx then
				PvE_Raid.aBombTimer[i] = -1
				Entities[PvE_Raid.aBomb[i]]:FullActivate(false)
				sys.log( "----------------------- bomb exploshion %d", i )
			end
		end
	end
	
	if nActiveBombCount > 0 and not PvE_Raid.isAdditionalColorRemap then
		SV_Pve_SetAdditionalColorRemap( true )
		PvE_Raid.isAdditionalColorRemap = true
	end

	if nActiveBombCount == 0 and PvE_Raid.isAdditionalColorRemap then
		SV_Pve_SetAdditionalColorRemap( false )
		PvE_Raid.isAdditionalColorRemap = false
	end
	
	-- Проверяем состояние алиена, и спавним мегабомбы на отметках hp зашитых в aMegaBombHp
	local cruiser = PvE_Raid:RaidGetCruiser()
	if cruiser and PvE_Raid.nLastHp < #PvE_Raid.aMegaBombHp then
		local hp = cruiser:GetHealth() / cruiser:GetMaxHealth() * 100
		if hp < PvE_Raid.aMegaBombHp[PvE_Raid.nLastHp + 1] then
			PvE_Raid.nLastHp = PvE_Raid.nLastHp + 1
			PvE_Raid:RaidSpawnBomb(true)
		end
	end
end

-- активация рандомного портала
function PvE_Raid:RaidSpawnPortal(isFar, isMid)
	-- ищем ближайший портал (парочку) и запускаем нужный сквады !!!
	sys.log( "Portal Spawn" )

	local cruiser = PvE_Raid:RaidGetCruiser()
	local nPortalMin = 0
	local nPortalMax = 0
	local nPortalMid = 0
	local nMinDistance = 999999
	local nMaxDistance = 0
	local nMidDistance = 999999
	local d
	local nActive = 0
	
	if cruiser then
		for i = 1, PvE_Raid.nPortalCount do
			if PvE_Raid.aSquadTimer[i] < 0 then 
				d = #(Entities[PvE_Raid.aPortal[i]]:GetPos() - cruiser:GetPos())
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

		for i = 1, PvE_Raid.nPortalCount do
			if PvE_Raid.aSquadTimer[i] < 0 then 
				d = #(Entities[PvE_Raid.aPortal[i]]:GetPos() - cruiser:GetPos())
				d = (nMaxDistance-nMinDistance)/2 - d
				if d<0 then d=-d end
				if d < nMidDistance then
					nPortalMid = i
					nMidDistance = d
				end
			end
		end

		--local nPortal = math.floor( PvE_Raid.nPortalCount * math.random() ) + 1
		--if nPortal > PvE_Raid.nPortalCount then
			--nPortal = PvE_Raid.nPortalCount
		--end
		
		nPortal = nPortalMin
		if isFar then
			nPortal = nPortalMax
		end
		if isMid then
			nPortal = nPortalMid
		end
		
		if nPortal > 0 then
			if nActive > PvE_Raid.nMaxAlivePortal and not PvE_Raid.noLimit then
				sys.log( "!!! Maximum Portal is Spawn" )
				return
			end
			PvE_Raid:RaidSpawnAISquad( nPortal )
		else
			sys.log( "!!! No more Portal to Spawn" )
		end
	else
		sys.log( "!!! No cruiser - no portal" )
	end
end

-- активация самой удалённой ещё не активированной бомбы
function PvE_Raid:RaidSpawnBomb(isFar)
	sys.log( "Bomb Spawn" )

	local cruiser = PvE_Raid:RaidGetCruiser()
	local nBombMin = 0
	local nBombMax = 0
	local nMinDistance = 999999
	local nMaxDistance = 0
	local d
	local nActive = 0
	
	if cruiser then
		for i = 1, PvE_Raid.nBombCount do
			if PvE_Raid.aBombTimer[i] == -1 then 
				d = #(Entities[PvE_Raid.aBomb[i]]:GetPos() - cruiser:GetPos())
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
			PvE_Raid.aBombTimer[nBomb] = 0
			Entities[PvE_Raid.aBomb[nBomb]]:FullActivate(true)
			SV_Pve_ScriptedNotification("pveRaid_BombSpawn")
		else
			sys.log( "!!! No more Bomb to Spawn" )
		end
	else
		sys.log( "!!! No cruiser - no bomb" )
	end
end

-- пуск ракеты 0- под себя, 1 - ближние цели, 2- дальние цели, 3 -рандом, -1 - мегаядерку в конкретной точке заспавнить, -2 спелл
function PvE_Raid:RaidLaunchRocket( defName, nTargetType, vPos )
	if defName then
		sys.log( "____________ prepear LaunchRocket "..defName )
	else
		sys.log( "____________ prepear LaunchRocket XXX")
	end

	local owner = 0
	local target = 0
	local aimDir

	local ncount = 0
	local alive = {}
	local adist = {}
	local middist = 0
	
	owner = PvE_Raid:RaidGetCruiser()

	if not owner or owner:IsDead() then
		sys.log( "!!!!!!!!!!!!!!!!!!!No cruiser found ")
		return false
	end
	
	target = owner -- по умолчанию цели нет
	if nTargetType > 0 then
		local a = GetAllPlayersInfo()
		local d
		for i, p in pairs( a ) do -- перебираем игроков
			local pid = p.entityId
			if pid > 0 then -- есть id корабля
				ncount = ncount + 1
				alive[ncount] = pid
				d = #(Entities[pid]:GetPos() - owner:GetPos())
				adist[ncount] = d
				middist = middist + d
			end
		end
	
		if ncount > 0 then 
			local atarget = {} -- список подходящих целей (собирается в зависимости от типа цели nTargetType)
			local ntarget = 0
			middist = middist / ncount -- среднее расстояние от крейсера до игроков
			
			for i = 1, ncount do
				if (nTargetType == 3) or ((nTargetType == 1) and (adist[i] <= middist) ) or ((nTargetType == 2) and (adist[i] >= middist)) then
					ntarget = ntarget + 1
					atarget[ntarget] = alive[i]
				end
			end
			
			if ntarget > 0 then
				target = math.floor( ntarget * math.random() ) + 1
				if target > ntarget then
					target = ntarget
				end
				target = Entities[ atarget[target] ]
			end
		end
	end

	aimDir = target:GetPos() + Vec3(1,0,0) -- owner:GetPos() -- направление на цель
	if nTargetType >= 0 then
		vPos = owner:GetPos() + Vec3(1,1,0)
	end
	--sys.log( "+++++++++++++++++++++Launch! ")
	if nTargetType >= -1 then
		SV_Pve_LaunchRocket( defName, owner, target, aimDir, vPos )
	else -- -2 спелл
		if not vPos then
			vPos = owner:GetPos()
		end
		local id = owner:GetId()
		SV_Pve_CastSpell( defName, id, id, target, vPos )
	end
end

function PvE_Raid:RaidGetCruiser()
	local cruiser = false

	-- ищем крейсер
	for i, cargoid in pairs( GetEntitiesByClass( "CargoShip" ) ) do -- так то должен быть 1 и вообще не факт, что будет каргошип
		cruiser = Entities[ cargoid ]
	end

	return cruiser
end

function PvE_Raid:RaidCriuserIsShieldActive()
	local cruiser = PvE_Raid:RaidGetCruiser()

	return cruiser and cruiser:IsShieldActive() 
end

function PvE_Raid:RaidCriuserShieldActivate()
	local cruiser = PvE_Raid:RaidGetCruiser()

	if cruiser and not cruiser:IsDead() and not cruiser:IsShieldActive() then -- активируем щит
		sys.log( "Shield ON" )
		cruiser:ActivateShield(true)
		return true
	end
	return false
end

function PvE_Raid:RaidCriuserShieldDeactivate()
	local cruiser = PvE_Raid:RaidGetCruiser()

	if cruiser and not cruiser:IsDead() and cruiser:IsShieldActive() then -- деактивируем щит
		sys.log( "Shield OFF" )
		cruiser:ActivateShield(false)
	end
end

-- функция вызывается каждый кадр
function PvE_Raid:OnUpdateRound(self, dt, curPhase, nTier)

	if PvE_Raid.nPhase == -2 then
		PvE_Raid:RaidSet(nTier)	-- в зависимости от тира, будут разные настройки

		PvE_Raid:RaidInit()
	end
	
	-- набирать таймер на пуск ракет/сквадов и следить не убили ли порталы (прятать тела)
	PvE_Raid:RaidUpdate( dt )
	
	-- отображение текущей фазы в лог (и wow сообщением)
	if not (PvE_Raid.nPhase == curPhase) then
		PvE_Raid.nPhase = curPhase
		--PvE_Raid.nRocketTimer = 0
		sys.log( "================PvE_Raid:SV_OnUpdateRound( %d )", curPhase )
		if PvE_Raid.nPhase == 7 then
			if PvE_Raid:RaidGetCruiser() then
				--PvE_Raid:Remove()
				PvE_Raid:RaidCriuserShieldActivate() -- активируем щит
			end
			PvE_Raid.isFailed = true
			return 2, ai.WinReason.ELIMINATION_LEADER_DEAD --- #66722 ФЛАГМАНУ УДАЛОСЬ СКРЫТЬСЯ!
		end
		if PvE_Raid.nPhase > 0 and not (PvE_Raid.aWow[PvE_Raid.nPhase] == "") then
			SV_Pve_ScriptedNotification(PvE_Raid.aWow[PvE_Raid.nPhase])
		end

	end
	
	if (curPhase == 1) or (curPhase == 2) then -- только туррели
		
		if PvE_Raid.timer >= 1000 then
			PvE_Raid.timer = PvE_Raid.timer + dt
		end
		
		if PvE_Raid.timer > 1005 then
			-- смотрим сколько осталось живых алиенов и если меньше нормы - запускаем крейсер
			local n = 0
			local s
			for i, id in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
				s = Entities[ id ]
				if s and not s:IsDead() and s:GetRelationshipGroup() == ai.RelationshipGroups.Alien then
					n = n + 1
				end
			end
			if n <= PvE_Raid.nAliveAliensToSpawnCruiser then
				sys.log( "===== Alien ")
				SV_Pve_AISquadSpawn( "Transport_Alien")
				PvE_Raid.timer = 999
				-- ищем и убираем туррель (дальше должна 2я фаза пойти и сюда уже не попадём)
				for i, id in pairs( GetEntitiesByClass( "Turret" ) ) do
					if Entities[ id ]:GetName() == "phase1end" then
						Entities[ id ]:Remove()
					end
				end
			end
		end

		if PvE_Raid:RaidGetCruiser() then
			if PvE_Raid.timer == 999 then
				-- ищем и проигрываем анимацию
				--for i, id in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
					--if Entities[ id ]:GetName() == "cruiser_portal" then
						--Entities[ id ]:SetActivity( "NONE" )
						--Entities[ id ]:SV_SetActivity( 8, false )
						PvE_Raid.timer = 100 + 5 -- длительность отсрочки перед началом анимации закрытия портала
						PvE_Raid:RaidCriuserShieldActivate() -- деактивируем щит
						PvE_Raid:RaidCriuserShieldDeactivate() -- деактивируем щит
						SV_Pve_ScriptedNotification("pveRaid_CruiserSpawn")
					--end
				--end
			elseif PvE_Raid.timer > 0 and PvE_Raid.timer < 999 then
				-- ждём пока анимация проиграется
				PvE_Raid.timer = PvE_Raid.timer - dt
				if PvE_Raid.timer > 10 and PvE_Raid.timer < 100 then
					for i, id in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
						if Entities[ id ]:GetName() == "cruiser_portal" and Entities[ id ]:GetLocalPlayTime()<0.1 then
							sys.log( "===== animation ")
							Entities[ id ]:SV_SetActivity( 8, false ) -- надо чтобы анимация закрытия была
							PvE_Raid.timer = 5
						end
					end
				end
			elseif PvE_Raid.timer < 0 then
				-- ищем и убираем портал из которого крейсер вылазит (дальше должна 2+1я фаза пойти и сюда уже не попадём)
				for i, id in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
					if Entities[ id ]:GetName() == "cruiser_portal" then
						Entities[ id ]:Remove()
					end
				end
			end
		end

	elseif curPhase == 3 then -- во 2+1й фазе туррели + ракеты
		for i = 2, #PvE_Raid.aRockets do
			if PvE_Raid.aRockets[i].nTimer >= PvE_Raid.aRockets[i].nRespawn then
				PvE_Raid.aRockets[i].nTimer = 0
				PvE_Raid:RaidLaunchRocket(PvE_Raid.aRockets[i].defName, PvE_Raid.aRockets[i].nTargetType)
			end
		end
		
	elseif curPhase == 4 then -- в 3+1й фазе туррели + ракеты + ядерки
		for i = 1, #PvE_Raid.aRockets do
			if PvE_Raid.aRockets[i].nTimer >= PvE_Raid.aRockets[i].nRespawn then
				PvE_Raid.aRockets[i].nTimer = 0
				PvE_Raid:RaidLaunchRocket(PvE_Raid.aRockets[i].defName, PvE_Raid.aRockets[i].nTargetType)
			end
		end

		PvE_Raid:RaidCriuserShieldDeactivate() -- деактивируем щит
		PvE_Raid.nPortalState = 0 -- можно снова активировать портал
		
		-------------------------------------------------------------------------------------------------------------
		-- 24.09.2018 #98816
		-------------------------------------------------------------------------------------------------------------
		local cruiser = PvE_Raid:RaidGetCruiser()
		if cruiser then
			if not PvE_Raid.nLastHealth then	-- начинаем считать повреждения для досрочного включения щита
				PvE_Raid.nLastHealth = cruiser:GetHealth()
				PvE_Raid.nHealthLeft = 0
			else
				PvE_Raid.nHealthLeft = PvE_Raid.nLastHealth - cruiser:GetHealth()
				if PvE_Raid.nHealthLeft/cruiser:GetMaxHealth() > 0.3 then -- принудительно включаем щит досрочно
					PvE_Raid.nLastHealth = nil	-- сбрасываем переменую чтобы после выключения щита снова можно было подсчитывать поврежения
					sys.log( "--------- HeathLeft Shield " )
					SV_Pve_StartPhase(5)
				end
			end
		end
		-------------------------------------------------------------------------------------------------------------

	elseif curPhase == 5 then -- в 4+1й фазе щит и портал
		if PvE_Raid.EnableShield then
			PvE_Raid:RaidCriuserShieldActivate() -- активируем щит
		end
		if PvE_Raid.nPortalState == 0 then -- если порталы не запущены
			PvE_Raid.nPortalState = 1
			PvE_Raid:RaidSpawnPortal()
			PvE_Raid.nBombDelay = PvE_Raid.nBombDelayTime -- ставим задержку на спавн мегабомбы
			
			local a = GetAllPlayersInfo()
			local ncount = 0
			for i, p in pairs( a ) do -- перебираем игроков
				local pid = p.entityId
				if pid > 0 then -- есть id корабля
					ncount = ncount + 1
				end
			end
			if ncount > PvE_Raid.nExtraPortalSpawn then -- 2й портал (вдали) если живых игроков больше нормы 1
				PvE_Raid:RaidSpawnPortal()
			end
		end

		if PvE_Raid.nPortalState <= 1 then -- если порталы не запущены
			PvE_Raid.nBombDelay = PvE_Raid.nBombDelay - dt
			if PvE_Raid.nBombDelay < 0 then -- бомба если живых игроков больше нормы 2
				PvE_Raid:RaidSpawnBomb(true)
				PvE_Raid.nPortalState = 2
			end
		end

	elseif curPhase == 6 then -- в 5+1й фазе крейсер пытается свалить в большой портал
		-- включаем остатки бомб и все порталы
		if PvE_Raid.nPortalState < 3 then -- если порталы не запущены
			PvE_Raid.nPortalState = 3
			PvE_Raid:RaidCriuserShieldDeactivate() -- деактивируем щит
			SV_Pve_AISquadLeave( "Transport_Alien", PvE_Raid.nTimeToLeave )
			
			PvE_Raid.noLimit = true -- отрубаем лимит по порталам
			--for i = 1, PvE_Raid.nBombCount do
				--PvE_Raid:RaidSpawnBomb()
			--end
			for i = 1, PvE_Raid.nPortalCount do
				PvE_Raid:RaidSpawnPortal()
			end
		end
	end

	PvE_Raid.raidBuffer:Update( dt )
	
	AID:Update( dt )	
end


function PvE_Raid:GetSpecialLootAttempts(self)
	sys.log( "================PvE_Raid:GetSpecialLootAttempts(self)" )
	if PvE_Raid.isFailed then
		sys.log( "================ 0 " )
		return 0
	else
		sys.log( "================ 2 " )
		return 2
	end
end


-----------------------------------------------------------------------------------------------------------
-- функция вызывается каждый кадр, пока миссия активна(когда геймплей активен, после финиша не вызывается).
PvE_Missions.pve_raid.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_Raid:OnUpdateRound(self, dt, curPhase, 5)
end

-- PvE_Missions.pve_raid_t4.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	-- return PvE_Raid:OnUpdateRound(self, dt, curPhase, 4)
-- end

-- PvE_Missions.pve_raid_t3.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	-- return PvE_Raid:OnUpdateRound(self, dt, curPhase, 3)
-- end

PvE_Missions.pve_raid.rounds[1].SV_GetSpecialLootAttempts = function( self, roundsFinished )
    return PvE_Raid:GetSpecialLootAttempts(self, 5)
end

PvE_Missions.pve_raid.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
	
	local expCoef, credCoef
	local levelCoef = PvE_Raid.raidBuffer.buff_level / PvE_Raid.raidBuffer.buff_level_max
	sys.log( "================PvE_RW:SV_GetFinishRewardCoefs(self, nTier) nTier = %d, levelCoef = %d", nTier, levelCoef )
	
	local dolmin = 0.7
	local bestReward = 1
	if PvE_PlanetoidRaid.Finished == true then
		expCoef = bestReward * dolmin
	else
		expCoef = 0.1
	end
	
	dolmin = 0.4
	bestReward = 1
	if PvE_PlanetoidRaid.Finished == true then
		credCoef = bestReward * dolmin
	else
		credCoef = 0.1
	end
	
	expCoef = expCoef * (1 + levelCoef)
	credCoef = credCoef * (1 + levelCoef)

	return expCoef, credCoef
	
end
