Mission = 
{
	squads = 
	{
		-- патруль полиции 1
		{
			name = "Police_TestPatrol1",
			relationship_group = ai.RelationshipGroups.Police, -- значение берется из ai.RelationshipGroups (cosmos_constants.lua)
			spawn_spot = "police_spawn_spot1", -- имя места рождения, у спаун спота должен быть указан spawn_area = true (есть пример в spawnspots.lua)
			route = "police_path1", -- имя пути (PathObject) на карте
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = 1, -- задержка перед первым спауном
			respawn_interval = 40, -- время через которое респавнится патруль если был уничтожен/улетел

			-- описания кораблей в отряде
			-- первый параметр - прототип корабля
			-- второй параметр - позиция в строю (относительно оси движения)

			members = 
			{
				-- первый уровень отряда
				{
					{ "Federation_Police_Guard_Lvl2_T4", Vec3( 0, 0, 0 ), },
					{ "Federation_Police_Guard_Lvl1_T4", Vec3( 0, -10, -10 ), },
					{ "Federation_Police_Guard_Lvl1_T4", Vec3( 10, 0, 10 ), },
					{ "Federation_Police_Guard_Lvl1_T4", Vec3( -10, 0, 10 ), },
					{ "Federation_Police_Guard_Lvl1_T4", Vec3( 10, 0, -10 ), },
				},
			},
		},

		-- караван 1
		{
			name = "Transport_Escort1",
	 		relationship_group = ai.RelationshipGroups.Transport,
			spawn_spot = "escort_spawn_spot1",
			route = "transport_path1", 
			squad_type = ai.AISquadType.CONVOY,
			respawn_interval = 80,
			cargoship = "Empire_CargoShip_T4", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{
				{
					{ "Empire_Cargo_Guard_T4", Vec3( 0, -20, -20 ), },
					{ "Empire_Cargo_Guard_T4_S", Vec3( 20, 0, 20 ), },
					{ "Empire_Cargo_Guard_T4_L", Vec3( -20, 0, 20 ), },
					{ "Empire_Cargo_Guard_T4_P", Vec3( 20, 0, -20 ), },
				},		
			},
		},
		
		-- караван 2
		{
			name = "Transport_Escort2",
	 		relationship_group = ai.RelationshipGroups.Transport,
			spawn_spot = "escort_spawn_spot2",
			route = "transport_path2", 
			squad_type = ai.AISquadType.CONVOY,
			respawn_interval = 90,
			cargoship = "Empire_CargoShip_T4", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{
				{
					{ "Empire_Cargo_Guard_T4", Vec3( 0, -20, -20 ), },
					{ "Empire_Cargo_Guard_T4_S", Vec3( 20, 0, 20 ), },
					{ "Empire_Cargo_Guard_T4_L", Vec3( -20, 0, 20 ), },
					{ "Empire_Cargo_Guard_T4_P", Vec3( 20, 0, -20 ), },
				},		
			},
		},
		

		-- пиратский патруль 1
		{
			name = "Pirate_Test1",
	 		relationship_group = ai.RelationshipGroups.Pirate,
			spawn_spot = "pirate_spawn_spot1",
			route = "pirate_path1", 
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = 5, -- задержка перед первым спауном
			respawn_interval = 50,
			
			members = 
			{
				{
					-- третий параметр обозначает "небоевой корабль"
					{ "Pirate_Captain_Bot_Lvl1_T3", Vec3( 0, 0, 0 ), },
					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 0, -10, -10 ), },
					{ "Pirate_Fast_Patrol_Lvl2_T3", Vec3( 10, 0, 10 ), },
					{ "Pirate_Fast_Patrol_Lvl2_T3", Vec3( -10, 0, 10 ), },
					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 10, 0, -10 ), },
				},		
			},
		},
		
		-- пиратский патруль 2
		{
			name = "Pirate_Test2",
	 		relationship_group = ai.RelationshipGroups.Pirate,
			spawn_spot = "pirate_spawn_spot2",
			route = "pirate_path2", 
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = 3, -- задержка перед первым спауном
			respawn_interval = 60,
			
			members = 
			{
				{
					-- третий параметр обозначает "небоевой корабль"
					{ "Pirate_Captain_Bot_Lvl1_T3", Vec3( 0, 0, 0 ), },
					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 0, -10, -10 ), },
					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 10, 0, 10 ), },
					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( -10, 0, 10 ), },
--					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 10, 0, -10 ), },
				},		
			},
		},

		-- пиратский патруль 3
		{
			name = "Pirate_Test3",
	 		relationship_group = ai.RelationshipGroups.Pirate,
			spawn_spot = "pirate_spawn_spot3",
			route = "pirate_path3", 
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = 15, -- задержка перед первым спауном
			respawn_interval = 70,
			
			members = 
			{
				{
					-- третий параметр обозначает "небоевой корабль"
					{ "Pirate_Captain_Bot_Lvl1_T3", Vec3( 0, 0, 0 ), },
					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 0, -10, -10 ), },
					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 10, 0, 10 ), },
--					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( -10, 0, 10 ), },
--					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 10, 0, -10 ), },
				},		
			},
		},


		-- пиратский патруль 4
		{
			name = "Pirate_Test4",
	 		relationship_group = ai.RelationshipGroups.Pirate,
			spawn_spot = "pirate_spawn_spot4",
			route = "pirate_path4", 
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = 4, -- задержка перед первым спауном
			respawn_interval = 80,
			
			members = 
			{
				{
					-- третий параметр обозначает "небоевой корабль"
					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 0, 0, 0 ), },
				},		
			},
		},

		-- пиратский патруль 5
		{
			name = "Pirate_Test5",
	 		relationship_group = ai.RelationshipGroups.Pirate,
			spawn_spot = "pirate_spawn_spot5",
			route = "pirate_path5", 
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = 5, -- задержка перед первым спауном
			respawn_interval = 75,
			
			members = 
			{
				{
					-- третий параметр обозначает "небоевой корабль"
					{ "Pirate_Fast_Patrol_Lvl2_T3", Vec3( 0, 0, 0 ), },
				},		
			},
		},

		-- пиратский патруль 6
		{
			name = "Pirate_Test6",
	 		relationship_group = ai.RelationshipGroups.Pirate,
			spawn_spot = "pirate_spawn_spot6",
			route = "pirate_path6", 
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = 6, -- задержка перед первым спауном
			respawn_interval = 90,
			
			members = 
			{
				{
					-- третий параметр обозначает "небоевой корабль"
					{ "Pirate_Private_Bot_Lvl1_T2", Vec3( 0, 0, 0 ), },
				},		
			},
		},

		-- пиратский патруль 7
		{
			name = "Pirate_Test7",
	 		relationship_group = ai.RelationshipGroups.Pirate,
			spawn_spot = "pirate_spawn_spot7",
			route = "pirate_path7", 
			squad_type = ai.AISquadType.PATROL,
			first_spawn_delay = 7, -- задержка перед первым спауном
			respawn_interval = 90,
			
			members = 
			{
				{
					-- третий параметр обозначает "небоевой корабль"
					{ "Pirate_Private_Bot_Lvl2_T2", Vec3( 0, 0, 0 ), },
				},		
			},
		},
		
		-- Trigger Spawn 8
		{
			name = "Pirate8",
	 		relationship_group = ai.RelationshipGroups.Pirate,
			spawn_spot = "pirate_spawn_spot8",
			route = "pirate_path8", 
			squad_type = ai.AISquadType.PATROL,
			spawn_on_event = true,
			--first_spawn_delay = 45, -- задержка перед первым спауном
			respawn_interval = 60,
			
			members = 
			{
				{
					{ "Pirate_Fast_Patrol_Lvl2_T3", Vec3( 0, 0, 0 ), },
				},		
			},
		},	
		
	},

	LootPoint = 
	{
		{ spot_prefix = "LootPoint_Base", crate_def = "LootCrate_T4", respawn = 30, count = 2, },
		{ spot_prefix = "LootPoint_Junk", crate_def = "LootCrate_Junk1", respawn = 3, count = 15, },--50
		{ spot_prefix = "LootPoint_Junk", crate_def = "LootCrate_Junk2", respawn = 2, count = 25, },
		{ spot_prefix = "LootPoint_Mineral", crate_def = "LootCrate_Crystal1", respawn = 4, count = 15, }, -- 40
		{ spot_prefix = "LootPoint_Mineral", crate_def = "LootCrate_Crystal2", respawn = 4, count = 15, }, -- 40
		{ spot_prefix = "LootPoint_Fuel", crate_def = "LootCrate_Fuel50", respawn = 30, count = 3, }, --6
		{ spot_prefix = "LootPoint_PirateFuel", crate_def = "LootCrate_Fuel50", respawn = 60, count = 1, }, --2
	},

}