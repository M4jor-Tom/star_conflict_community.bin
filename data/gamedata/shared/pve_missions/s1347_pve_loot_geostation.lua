--
PvE_LGS_H = {}

PvE_LGS_H_Container = 
{
	aPhases = {  		
		[ 1 ] = 
			{ 
				sRoundType 	= "transport",	
				DialogsOnStart = {	
					{ 5, "fed_engineer", "pve_geostation_kill_transport" },
				},
				nRoundPhase	= 1,	
				bCountBar	= true,
				transport 	= { "Transport1", "Transport2", "Transport3", "Transport4", "Transport5", "Transport6" },
				needAssistance = {
					{ 
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_L_T2",
					},
					{
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_L_T2",
					},
					{
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_L_T2",
					},
					{
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_L_T2",
					},
					{
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_L_T2",
					},
					{
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_M_T2",
						"Ship_Bot_CargoDefeder_L_T2",
					},
				}, 
				nextSpawn	= { 5, 15, 10, 15, 5, 20 },
				sTargetDef 	= "CargoShipTeam2", -- целевой деф, может быть враждебным и союзным
				tSpeed		= 0.1, --целевая скорость транспортника
				nMaxSpeed	= 10,
				bEscapeResult= false, -- флаг на результат ухода транспорта
				bDeadResult	= true, -- флаг на результат смерти транспорта
				timer		= 10,
				tId			= nil,	
				EscapeToEnd = 2,
				additionalFunc = { 
					Func = function( self, curPhase )
					
						local roketTurs = GetEntitiesByDef( "Turret_Team2_Pve_RocketGun_shadow" )
						for i, tur in ipairs( roketTurs ) do
							local pos = Entities[ tur ]:GetPos()
							local rot = Entities[ tur ]:GetRot()
							Entities[ tur ]:Remove()
							
							local turretRocket = ai.Spawn( "Turret_Team2_PveGeoStation_Standart_T2_RocketGun" )
							turretRocket:SetPos( pos )
							turretRocket:SetRot( rot )	
						end
						
						local railTurs = GetEntitiesByDef( "Turret_Team2_Pve_AiRailgun_shadow" )
						for i, tur in ipairs( railTurs ) do 
							local pos = Entities[ tur ]:GetPos()
							local rot = Entities[ tur ]:GetRot()
							Entities[ tur ]:Remove()
							
							local turretRail = ai.Spawn( "Turret_Team2_Pve_StationRailgun" )
							turretRail:SetPos( pos )
							turretRail:SetRot( rot )	
						end				
					end,
				},			
			},
		[ 2 ] = 
			{
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "fed_engineer", "pve_geostation_destroy_turrets" },
				},
				sTargetDef	= { "Turret_Team2_PveGeoStation_Standart_T2_RocketGun", }, -- целевой деф для уничтожения
				tCount		= 10,
				nRoundPhase	= 2,
				PossibleEvents= { },
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},
				additionalFunc = { 
					Func = function( self, curPhase )
						Entities[ "EnergyGenerator1" ]:SetDamageable( true )						
						Entities[ "EnergyGenerator1" ]:ShowInHud( true )
					end,
				},	
			},
		[ 3 ] = 
			{
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "fed_engineer", "pve_geostation_destroy_generator" },
				},
				sTargetDef	= { "PvE_Gen_EnergyGenerator2", }, -- целевой деф для уничтожения
				tCount		= 1,
				nRoundPhase	= 3,
				PossibleEvents= { },
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},
			},
		[ 4 ] = 
			{ 
				sRoundType 	= "transport",	
				DialogsOnStart = {	
					{ 1, "sch_tana", "pve_geostation_save_transport1" },
					{ 1, "fed_engineer", "pve_geostation_save_transport2" },
					{ 1, "fed_engineer", "pve_geostation_save_transport3" },
				},
				nRoundPhase	= 4,	
				bCountBar	= true,
				transport 	= { "Transport7", "Transport8", "Transport9" },
				nextSpawn	= { 2, 1, 80 },
				sTargetDef 	= "CargoShipTeam1", -- целевой деф, может быть враждебным и союзным
				tSpeed		= 0.1, --целевая скорость транспортника
				nMaxSpeed	= 10,
				bEscapeResult= true, -- флаг на результат ухода транспорта
				bDeadResult	= false, -- флаг на результат смерти транспорта
				timer		= 5,
				tId			= nil,
				EscapeToEnd = 1,
				bWaitForAllTransp = true,
			},
		},	
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
		aWaves = {
		[ 1 ] = 
			{
				MeatBots_t1 = { "Ship_Bot_StationDefeder_S_T2", "Ship_Bot_StationDefeder_M_T2" },	
				MeatBots_t2 = { },	
				EliteBots = { },	
				Executor = {}, 
			},
		[ 2 ] = 
			{
				MeatBots_t1 = { "Ship_Bot_StationDefeder_S_T2", "Ship_Bot_StationDefeder_M_T2" },	
				MeatBots_t2 = { },	
				EliteBots = { },	
				Executor = {}, 
			},
		[ 3 ] = 
			{
				MeatBots_t1 = { "Ship_Bot_StationDefeder_S_T2", "Ship_Bot_StationDefeder_M_T2" },	
				MeatBots_t2 = { },	
				EliteBots = { },	
				Executor = {}, 
			},
		[ 4 ] = 
			{
				MeatBots_t1 = { "Ship_Bot_StationDefeder_S_T2", "Ship_Bot_StationDefeder_M_T2" },	
				MeatBots_t2 = { },	
				EliteBots = { "Ship_Bot_StationCaptain_R2_M_T2" },	
				Executor = {}, 	
			},
		},
}	


PvE_Missions.loot_geostation_normal = 
{
	levelName = "s1347_geostation",
	scenario_description = { "loot_geostation_str1", "loot_geostation_str2", "loot_geostation_str3" },
	need_spawn_warp = true,

	event_loot_attempts = 3,
	desc = "",
	resurrection_attempts = 5,
	item_lvl = 10, -- параметр для начисления награды.
	accountRank = 5,
	rank  = 1,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.med[3],
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	turret_damage_coef = 0.7,
	disabled = false,
	
	difficulty = "easy",
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,

	squads = {				
		{
			name = "Transport1",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "Transport2",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport3",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath3", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},			
		{
			name = "Transport4",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath4", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "Transport5",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath5", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport6",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath6", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},			
		{
			name = "Transport7",
	 		relationship_group = 1,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath7", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam1", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "Transport8",
	 		relationship_group = 1,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath8", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam1", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport9",
	 		relationship_group = 1,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath9", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam1", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			exp_reward_portion = 2,
			cred_reward_portion = 2,
			loot_attempts_reward = 2,
			player_spawn_group = 0,

			uiRoundDesc = "pve_loot_geostation_r1_rdesc", 
			start_sentence = "CMDR_PVE_START_ROUND_TRANSPORT_ATTACK",
			
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			precache_defs = 
			{
				"Ship_Bot_CargoDefeder_M_T2", 
				"Ship_Bot_CargoDefeder_L_T2", 
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"Turret_Team2_Pve_StationRailgun",
				"Turret_Team2_PveGeoStation_Standart_T2_RocketGun",
			},
			
			modifiers =
			{
				{ spell = "Pve_HealHull",	caster_group = 1, }, -- 1 players team, AI team 
				{ spell = "Pve_BuffDamage",	caster_group = 1, },
				{ spell = "Pve_HealShield",	caster_group = 1, },
				
			},
			
			start_event = 
			{
			},
			phases = 
 			{
    			[ 1 ] = {},
				[ 2 ] = {},	
				[ 3 ] = {},	
				[ 4 ] = {},	
            },
			
			waves =
			{
				[ 1 ] = -- 36
				{
					max_agents_at_same_time = 20,	
					{	def = "Ship_Bot_CargoDefeder_M_T2", count = 1, spawn_group = 2, spawn_warp = true, delay = 99999999, }, 
				},
			},
		},
	},
}

PvE_Mission.nCurPhase = 0

PvE_Missions.loot_geostation_normal.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_LGS_H:OnUpdate( dt )
end

function PvE_LGS_H:OnStart()

	Entities[ "EnergyGenerator1" ]:SetDamageable( false )
	Entities[ "EnergyGenerator1" ]:ShowInHud( false )

	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 600
end

function PvE_LGS_H:OnUpdate( dt )
	
	return PvE_Func:OnUpdate( dt )
	
end

for i, phase in ipairs( PvE_LGS_H_Container.aWaves ) do 

	for j, group in pairs( phase ) do
		for k, mob in ipairs( group ) do 
			if PvE_Func:FindValue( PvE_Missions.loot_geostation_normal.rounds[ 1 ].precache_defs, mob ) == false then
				table.insert( PvE_Missions.loot_geostation_normal.rounds[ 1 ].precache_defs, mob )
			end	
		end	
	end
end

PvE_Missions.loot_geostation_normal.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.loot_geostation_normal.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end