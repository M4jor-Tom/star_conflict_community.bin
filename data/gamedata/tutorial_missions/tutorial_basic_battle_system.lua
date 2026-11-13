TutorialMissions.basic_battle_system = 

{
	desc 					= "",
	type					= "BATTLE_SYSTEM",
	time_to_next_objective 	= 2.0,
	
	
	objectives = 
	{
		-- лок обьекта.
		[ 1 ] =
				
		{
			type = "LOCK_TARGETS",
			uiObjectiveDesc = "tutorial_battle_system_objective1_desc", 
			player_spawn_group 		= 0,
			
			targets =
			{
				{ target = "Cargo", def = "CargoShipTutorial", path = "PathObject1", closed_path = true, },
			},
			
			disabled_player_movement = Vec3( 1, 1, 1 ),
			disable_player_modules = { ai.SpaceShipModuleSlot.ACTIVE_01, ai.SpaceShipModuleSlot.ACTIVE_02, ai.SpaceShipModuleSlot.SPECIAL, ai.SpaceShipModuleSlot.SECONDARY_WEAPON, },
		},
		
		-- полет к объекту.
		[ 2 ] = 
		
		{
			type = "REACH_POSITION",

			uiObjectiveDesc = "tutorial_battle_system_objective2_desc", 
				
			targets = 
			{
				{ target = "Cargo", area_size = 200, need_to_spawn = false, },
			},
			
			disable_player_modules = { ai.SpaceShipModuleSlot.ACTIVE_01, ai.SpaceShipModuleSlot.ACTIVE_02, ai.SpaceShipModuleSlot.SPECIAL, ai.SpaceShipModuleSlot.SECONDARY_WEAPON, },
			
		},
		
		-- уничтожение движущегося обьекта
		[ 3 ] = 
		
		{
			type = "DESTROY_TARGETS",

			uiObjectiveDesc = "tutorial_battle_system_objective3_desc", 

			targets = 
			{
				{ target = "Cargo", need_to_spawn = false },
			},
			
			disable_player_modules = { ai.SpaceShipModuleSlot.ACTIVE_01, ai.SpaceShipModuleSlot.ACTIVE_02, ai.SpaceShipModuleSlot.SPECIAL, ai.SpaceShipModuleSlot.SECONDARY_WEAPON, },
		},
		
		-- убийство обьекта ракетами.
		[ 4 ] = 
		
		{
			type = "DESTROY_TARGETS",

			uiObjectiveDesc = "tutorial_battle_system_objective4_desc", 

			targets = 
			{
				{ target = "Agent", def = "Ship_Bot_LargeHull_Tutorial_R3_L_T4", ai_enabled = false, spawn_group = 0, },
			},
			
			disable_player_special = true,
			disable_player_modules = { ai.SpaceShipModuleSlot.ACTIVE_01, ai.SpaceShipModuleSlot.ACTIVE_02, ai.SpaceShipModuleSlot.SPECIAL, },
		},
		
		-- использование активных модулей.
		[ 5 ] = 
		
		{
			type = "DESTROY_TARGETS",

			uiObjectiveDesc = "tutorial_battle_system_objective5_desc", 
			
			start_event = 
			{
				{  target = "PlasmaGun1", action = "FullActivate", },
				{  target = "PlasmaGun2", action = "FullActivate", },
			},
			
			targets = 
			{
				{ target = "PlasmaGun1", ai_enabled = true, },
				{ target = "PlasmaGun2", ai_enabled = true, },
			},
			
			disable_player_special = true,
			reset_player_modules = true,
			disable_player_modules = { ai.SpaceShipModuleSlot.SPECIAL, ai.SpaceShipModuleSlot.SECONDARY_WEAPON, },
		},
		
		-- использование спец. модуля.
		[ 6 ] = 
		
		{
			type = "REACH_POSITION",

			uiObjectiveDesc = "tutorial_battle_system_objective6_desc", 

			targets = 
			{
				{ target = "Agent1", def = "Ship_Bot_LargeHull_Tutorial_R1_L_T4",  area_size = 150, spawn_group = 1, ai_enabled = true, },
			},
			
			reset_player_modules = true,
		},
		
		-- используя стелс долететь до корабля
		--[[[ 7 ] = 
		
		{
			type = "REACH_POSITION",

			uiObjectiveDesc = "tutorial_battle_system_objective7_desc", 

			targets = 
			{
				{ target = "Agent", def = "Ship_Bot_Tutorial_R3_L_T4", },
			},
			
			disable_player_active_modules = { ai.SpaceShipModuleSlot.ACTIVE_03, ai.SpaceShipModuleSlot.ACTIVE_04, },
		},--]]
		
		-- уничтожить вражеский корабль комбинируя активные модули, и ракеты.
		[ 7 ] = 
		
		{
			type = "DESTROY_TARGETS",

			uiObjectiveDesc = "tutorial_battle_system_objective8_desc", 

			targets = 
			{
				{ target = "Agent1", need_to_spawn = false, ai_enabled = true, },
			},
		},
	},
}