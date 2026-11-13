--
PvE_Missions.pve_dreadnought_defense_t2 = 
{
	levelName = "pve_dreadnought_defense",
	scenario_description = { "loot_geostation_str1", "loot_geostation_str2", "loot_geostation_str3" },
	need_spawn_warp = true,

	desc = "",
	--exp_mul = "",
	--min_iLvl = 30, 
	item_lvl = 20, -- параметр для начисления награды.
	rank  = 4, -- параметр для попадания в очередь.
	rank_max = 9, -- параметр для выбора миссии на карте галактики.
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	turret_damage_coef = 0.7,
	turret_health_coef = 1.4,
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "TRANSPORT_ATTACK",
			exp_reward_portion = 1,
			cred_reward_portion = 1,
			loot_attempts_reward = 0,
			player_spawn_group = 0,
		
			uiRoundName = "pve_loot_geostation_r1_rname",
			uiRoundDesc = "pve_loot_geostation_r1_rdesc", 
			uiAnomalydDesc = "pve_loot_geostation_r1_adesc", 
			
			start_sentence = "CMDR_PVE_START_ROUND_TRANSPORT_ATTACK",
			
			modifiers =
			{
				{ spell = "Pve_HealHull",	caster_group = 1, }, -- 1 players team, AI team 
				{ spell = "Pve_BuffDamage",	caster_group = 1, },
				{ spell = "Pve_HealShield",	caster_group = 1, },
				
			},
			
			start_event = 
			{
				{  target = "RocketGun1", action = "FullDeactivate", },
				{  target = "RocketGun2", action = "FullDeactivate", },
				{  target = "RocketGun3", action = "FullDeactivate", },
				{  target = "RocketGun4", action = "FullDeactivate", },
				{  target = "RocketGun5", action = "FullDeactivate", },
				{  target = "RocketGun6", action = "FullDeactivate", },
				{  target = "RocketGun7", action = "FullDeactivate", },
				{  target = "RocketGun8", action = "FullDeactivate", },
				{  target = "RocketGun9", action = "FullDeactivate", },
				{  target = "RocketGun10", action = "FullDeactivate", },
				{  target = "StationRailgun1", action = "FullDeactivate", },
				{  target = "StationRailgun2", action = "FullDeactivate", },
				{  target = "StationRailgun3", action = "FullDeactivate", },
				{  target = "StationRailgun4", action = "FullDeactivate", },
				{  target = "StationRailgun5", action = "FullDeactivate", },
				{  target = "StationRailgun6", action = "FullDeactivate", },
				{  target = "StationRailgun7", action = "FullDeactivate", },
				{  target = "StationRailgun8", action = "FullDeactivate", },
				{  target = "StationRailgun9", action = "FullDeactivate", },
				{  target = "StationRailgun10", action = "FullDeactivate", },
				{  target = "StationRailgun11", action = "FullDeactivate", },
				{  target = "StationRailgun12", action = "FullDeactivate", },
				{  target = "StationRailgun13", action = "FullDeactivate", },
				{  target = "StationRailgun14", action = "FullDeactivate", },
				{  target = "StationRailgun15", action = "FullDeactivate", }, 
				{  target = "Jumpgate1", action = "FullDeactivate", },
			},
			
			waves =
			{
				[ 1 ] = -- 36
				{
					max_agents_at_same_time = 1,	
					
					{	def = "Ship_Bot_CargoDefeder_M_T2", count = 2, spawn_group = 0, spawn_warp = false, delay = 5, },
				},
			},
		
		
			transport_to_fail = 3, 
			transport = 
			{
				{	def = "TestAsteroidCargo",	 path = "TransportPath6", delay = 0, warp_in_effect = true, },
				{	def = "TestHugeCargo",		 path = "TransportPath1", delay = 5, warp_in_effect = true, },
				{	def = "TestAvanpostCargo",	 path = "TransportPath2", delay = 20, warp_in_effect = true, },
				{	def = "TestAsteroidCargo",	 path = "TransportPath10", delay = 30, warp_in_effect = true, },
				{	def = "TestAvanpostCargo",	 path = "TransportPath4", delay = 45, warp_in_effect = true, },
				{	def = "TestHugeCargo",		 path = "TransportPath5", delay = 50, warp_in_effect = true, },
				{	def = "TestAsteroidCargo",	 path = "TransportPath7", delay = 65, warp_in_effect = true, },
				{	def = "TestHugeCargo",		 path = "TransportPath3", delay = 75, warp_in_effect = true, },
				{	def = "TestAvanpostCargo",	 path = "TransportPath6", delay = 85, warp_in_effect = true, },
				{	def = "TestAsteroidCargo",	 path = "TransportPath8", delay = 95, warp_in_effect = true, },
				{	def = "TestHugeCargo",		 path = "TransportPath9", delay = 105, warp_in_effect = true, },
				{	def = "TestAvanpostCargo",	 path = "TransportPath2", delay = 120, warp_in_effect = true, },
				{	def = "TestAsteroidCargo",	 path = "TransportPath1", delay = 125, warp_in_effect = true, },
			},
		},			
	},
}