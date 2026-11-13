--
PvE_FS_H = {}

PvE_FS_H_Container = 
{
	aPhases = {  		
		[ 1 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "fed_major", "pve_frozen_station_break_generators_1" },
					{ 1, "fed_major", "pve_frozen_station_break_generators_2" },
					{ 1, "ellidium_girl", "pve_frozen_station_break_generators_3" },
				},
				sTargetDef	= { "PvE_FrozenStation_EnergyGenerator_easy", }, -- целевой деф для уничтожения
				tCount		= 2,
				nRoundPhase	= 1,
				PossibleEvents= { },
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},
				additionalFunc = { 
					Func = function( self, curPhase )
						sys.concmd( "e_event SpaceShield1 Fadeout" )
						SV_Pve_SetSpawnGroup( 1 )
				end,	
				},
			},
		[ 2 ] = 
			{
				sRoundType 	= "transport",	
				DialogsOnStart = {	
					{ 5, "fed_major", "pve_frozen_station_save_transport_1" },
					{ 1, "ellidium_girl", "pve_frozen_station_save_transport_2" },
				},
				nRoundPhase	= 2,	
				bCountBar	= true,
				transport 	= { "Transport1", "Transport2", "Transport3" },
				nextSpawn	= { 30, 30, 30 },
				sTargetDef 	= "DescentCargoTeam1_T2", -- целевой деф, может быть враждебным и союзным
				tSpeed		= 0.1, --целевая скорость транспортника
				nMaxSpeed	= 10,
				bEscapeResult= true, -- флаг на результат ухода транспорта
				bDeadResult	= false, -- флаг на результат смерти транспорта
				EscapeToEnd = 2,
				timer		= 20,
				tId			= nil,	
				additionalFunc = { 
					Func = function( self, curPhase )
						SV_Pve_SetSpawnGroup( 2 )
				end,	
				},
			},
		[ 3 ] = -- прилет риверов
			{ 
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				DialogsOnStart = {	
					{ 1, "fed_major", "pve_frozen_station_kill_all_1" },
					{ 1, "sch_jackson", "pve_frozen_station_kill_all_2" },
					{ 1, "ellidium_girl", "pve_frozen_station_kill_all_3" },
				},		
				nRoundPhase	= 3,	
				waves = 
				{				
					{	def = "Alien_Scout_PvE_FS1_T2", count = 2, delay = 5, }, 			
					{	def = "Alien_Scout_PvE_FS1_T2", count = 1, delay = 10, },				
					{	def = "Alien_Scout_PvE_FS1_T2", count = 2, delay = 10, },				
					{	def = "Alien_Scout_PvE_FS1_T2", count = 3, delay = 15, },
				},	
				
				additionalFunc = {
					Func = function( self, curPhase )
					end
				},
			},
		[ 4 ] = -- прилет риверов
			{ 
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				nRoundPhase	= 4,	
				queueMob	= 1,
				DialogsOnStart = {	
					{ 1, "fed_major", "pve_frozen_station_kill_all2_1" },
					{ 1, "ellidium_girl", "pve_frozen_station_kill_all2_2" },
				},		
				waves = 
				{						
					{	def = "Alien_Scout_PvE_FS1_T2", count = 2, spawn_warp = true, delay = 5, },				
					{	def = "Alien_Scout_PvE_FS1_T2", count = 2, spawn_warp = true, delay = 10, },				
					{	def = "Alien_Scout_PvE_FS2_T2", count = 2, spawn_warp = true, delay = 10, },	
					{	def = "Alien_Scout_PvE_FS2_T2", count = 3, spawn_warp = true, delay = 15, },
					{	def = "Alien_Scout_PvE_FS3_T2", count = 1, spawn_warp = true, delay = 10, }, 
				},	
				
				additionalFunc = {
					Func = function( self, curPhase )
					end
				},
			},			
		},	
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {
	[ 1 ] = 
		{			
			MeatBots_t1 = { "Ship_Bot_FrozenStationDefender_S_T2", "Ship_Bot_FrozenStationDefender_S2_T2" },	
			MeatBots_t2 = { "Ship_Bot_FrozenStationDefender_L_T2", "Ship_Bot_FrozenStationDefender_M_T2", "Ship_Bot_FrozenStationDefender_M2_T2" },	
			EliteBots = { "Ship_Bot_FrozenStationDefender_L2_T2" },	
			Executor = {}, 
		},
	[ 2 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_FrozenStationDefender_S_T2", "Ship_Bot_FrozenStationDefender_M_T2", "Ship_Bot_FrozenStationDefender_S2_T2" },	
			MeatBots_t2 = { "Ship_Bot_FrozenStationCaptain_R2_M_T2", "Ship_Bot_FrozenStationDefender_M2_T2", "Ship_Bot_FrozenStationDefender_L_T2" },	
			EliteBots = { "Ship_Bot_FrozenStationCaptain_R_M_T2", "Ship_Bot_FrozenStationDefender_L2_T2" },	
			Executor = {}, 
		},
	[ 3 ] = 
		{
			MeatBots_t1 = {},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		},
	[ 4 ] = 
		{
			MeatBots_t1 = {},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		}	
	},
}

PvE_Missions.pve_frozen_station_t2 = 
{
	levelName = "pve_frozen_station",
	scenario_description = { "frozen_station_str1", "frozen_station_str2", "frozen_station_str3" },
	event_loot_attempts = 3,
	need_spawn_warp = true,
	
	desc = "",
	resurrection_attempts = 5,
	item_lvl = 10, -- параметр для начисления награды.
	accountRank = 6,
	rank  = 1,  -- 4 параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- 9 параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.med[3],
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	disabled = false,
	waves_ui_hide = true,

	difficulty = "easy",
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,

	squads = {				
		{
			name = "Transport1",
	 		relationship_group = 1,
			spawn_spot = "Team1Group14",
			route = "TransportPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "DescentCargoTeam1_T2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "Transport2",
	 		relationship_group = 1,
			spawn_spot = "Team1Group14",
			route = "TransportPath2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "DescentCargoTeam1_T2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport3",
	 		relationship_group = 1,
			spawn_spot = "Team1Group14",
			route = "TransportPath3", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "DescentCargoTeam1_T2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			loot_attempts_reward = 3,
			player_spawn_group = 0,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			uiRoundDesc = "pve_frozen_station_r1_rdesc", 

			start_sentence = "CMDR_PVE_START_ROUND_SABOTAGE",

			precache_defs = {
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"Alien_Scout_PvE_FS1_T2",
				"Alien_Scout_PvE_FS2_T2",
				"Alien_Scout_PvE_FS3_T2",
				"Shell_Prec",
			},
			
			modifiers =
			{
				{ spell = "Pve_HealHull",	caster_group = 1, }, -- 1 players team, AI team
				{ spell = "Pve_HealShield",	caster_group = 1, }, 
			},
			start_sentence = "CMDR_PVE_START_ROUND_SABOTAGE",
			sabotage_list = { "EnergyGenerator3", "EnergyGenerator4", },

			phases = 
 			{
    			[ 1 ] = {},
				[ 2 ] = {},	
				[ 3 ] = {},	
				[ 4 ] = {},	
            },			
			start_event = 
			{

			},

			waves =
			{
				[ 1 ] = -- 36
				{
					max_agents_at_same_time = 14,
					{	def = "Alien_Scout_PvE_FS1_T2", count = 1, spawn_group = 13, spawn_warp = true, delay = 999999999999999999999999999999999, }, 					
				},
			},
		},		
	},	
}

PvE_Missions.pve_frozen_station_t2.rounds[ 1 ].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_FS_H:OnUpdate( dt )
end

PvE_Mission.nCurPhase = 0

function PvE_FS_H:OnStart()
	
	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 600

end

function PvE_FS_H:OnUpdate( dt )

	return PvE_Func:OnUpdate( dt )
	
end

for i, phase in ipairs( PvE_FS_H_Container.aWaves ) do 

	for j, group in pairs( phase ) do
		for k, mob in ipairs( group ) do 
			if PvE_Func:FindValue( PvE_Missions.pve_frozen_station_t2.rounds[ 1 ].precache_defs, mob ) == false then
				table.insert( PvE_Missions.pve_frozen_station_t2.rounds[ 1 ].precache_defs, mob )
			end	
		end	
	end
end

PvE_Missions.pve_frozen_station_t2.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.pve_frozen_station_t2.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end