--
PvE_RPB = {}
-- HARD MISSIONS

PvE_RPB_Container = 
{
	aPhases = {  		
		[ 1 ] = 
			{
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				sync_UI_Timer = 5,
				DialogsOnStart = {	
					{ 5, "le_vasseur", "pve_rescue_pirates_base_wave1", "cmd/pve/pirate_base/pirates_base_wave1", 20 },
				},		
				nRoundPhase	= 1,	
				waves = 
				{				
					{	def = "Ship_Gen_Easy_Meat_Pirate_S", count = 4, delay = 5, }, 
					{	def = "Ship_Gen_Easy_Meat_Pirate_M", count = 4, delay = 5, }, 
					{	def = "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", count = 1, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_L", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_S", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_M", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_L", count = 4, delay = 10, },
					{	def = "Ship_Gen_Easy_Elite_Pirate_Recon_S", count = 1, delay = 10, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_S", count = 4, delay = 5, }, 
					{	def = "Ship_Gen_Easy_Meat_Pirate_M", count = 4, delay = 5, }, 
					{	def = "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", count = 1, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_L", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_S", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_M", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_L", count = 4, delay = 10, },
					{	def = "Ship_Gen_Easy_Elite_Pirate_Recon_S", count = 1, delay = 10, },
					
				},		
			},
		[ 2 ] = --заглушка
			{
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				DialogsOnStart = {	
					{ 1, "le_vasseur", "pve_rescue_pirates_base_wave2", "cmd/pve/pirate_base/pirates_base_wave2", 20 },
				},		
				nRoundPhase	= 1,	
				waves = 
				{				
					{	def = "Ship_Gen_Easy_Meat_Pirate_S", count = 4, delay = 5, }, 
					{	def = "Ship_Gen_Easy_Meat_Pirate_M", count = 4, delay = 5, }, 
					{	def = "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", count = 1, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_L", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_S", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_M", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_L", count = 4, delay = 10, },
					{	def = "Ship_Gen_Easy_Elite_Pirate_Recon_S", count = 1, delay = 10, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_S", count = 4, delay = 5, }, 
					{	def = "Ship_Gen_Easy_Meat_Pirate_M", count = 4, delay = 5, }, 
					{	def = "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", count = 1, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_L", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_S", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_M", count = 4, delay = 5, },
					{	def = "Ship_Gen_Easy_Meat_Pirate_L", count = 4, delay = 10, },
					{	def = "Ship_Gen_Easy_Elite_Pirate_Recon_S", count = 1, delay = 10, },
					{	def = "Ship_rescue_Boss_Empire_Destroyer", count = 1, delay = 10, },
					
				},		
			},
		[ 3 ] = 
			{
				sRoundType 	= "transport",	
				DialogsOnStart = {	
					{ 1, "le_vasseur", "pve_rescue_pirates_base_transport_1", "cmd/pve/pirate_base/pirates_base_transport1", 20 },
				},
				nRoundPhase	= 2,	
				bCountBar	= true,
				transport 	= { "Transport1" },
				nextSpawn	= { 1 },
				sTargetDef 	= "CargoShipPirateRescue", -- целевой деф, может быть враждебным и союзным
				tSpeed		= 0.17, --целевая скорость транспортника
				nMaxSpeed	= 10,
				bEscapeResult= true, -- флаг на результат ухода транспорта
				bDeadResult	= false, -- флаг на результат смерти транспорта
				timer		= 20,
				tId			= nil,	
				switchNPhase= { 4, 5, },
				additionalFunc = { 
					Func = function( self, curPhase )
						SV_Pve_SetSpawnGroup( 2 )
						--[[if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].result == false then
							local vitals = GetEntitiesByDef( "PvE_Gen_VitalGenerator" )

							for l = 1, 5 do
								local selectedId = PvE_Func:RandomFromList( vitals )
								curPhase.tId[ l ] = selectedId
								Entities[ selectedId ]:ShowInHud( true )
								Entities[ selectedId ]:FullActivate( true )
								PvE_Func:RemoveFromList( vitals, selectedId )
							end							
						end]]
				end,},
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
					{
						sRoundType 	= "vitals",
						bCountBar	= true,
						bRandomBoss = true,
						DialogsOnStart = {	
							{ 1, "le_vasseur", "pve_rescue_pirates_base_deactivate_generators_1", "cmd/pve/pirate_base/deactivate_generators1", 20 },
						},
						specificDef	= "PvE_Gen_VitalGenerator2", --нужно будет вписать сюда специальный деф мин, на базе маяка.
						count		= 4,
						nRoundPhase	= 4,	
					},	
					{ 
						sRoundType 	= "defense",
						bCountBar	= true,
						bRandomBoss = true,
						sTargetDef	= "PvE_DemolishDockingBay_Ally_RPB",
						nWoWMsgTimer= 30, 
						nRoundPhase	= 3,	
						DialogsOnStart = {	
							{ 1, "le_vasseur", "pve_rescue_pirates_base_defense_2", "cmd/pve/pirate_base/pirates_base_defence2", 20 },
						},
						timer		= 120,	
					},	
				},
			},
		[ 4 ] = 
			{ 
				sRoundType 	= "defense",
				bCountBar	= true,
				bRandomBoss = true,
				sTargetDef	= "PvE_DemolishDockingBay_Ally_RPB",
				nWoWMsgTimer= 30, 
				nRoundPhase	= 3,	
				DialogsOnStart = {	
					{ 1, "le_vasseur", "pve_rescue_pirates_base_defense_1", "cmd/pve/pirate_base/pirates_base_defence1", 20 },
				},
				timer		= 120,
				
				switchNPhase= { 5, },
				--[[additionalFunc = { 
					Func = function( self, curPhase )
						if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].result == false then
							local vitals = GetEntitiesByDef( "PvE_Gen_VitalGenerator" )
							for l = 1, 5 do
								local selectedId = PvE_Func:RandomFromList( vitals )
								curPhase.tId[ l ] = selectedId
								Entities[ selectedId ]:ShowInHud( true )
								Entities[ selectedId ]:FullActivate( true )
								PvE_Func:RemoveFromList( vitals, selectedId )
							end
						end	
				end,},]]
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
					{
						sRoundType 	= "vitals",
						bCountBar	= true,
						bRandomBoss = true,
						DialogsOnStart = {	
							{ 1, "le_vasseur", "pve_rescue_pirates_base_deactivate_generators_2", "cmd/pve/pirate_base/deactivate_generators2", 20 },
						},
						specificDef	= "PvE_Gen_VitalGenerator2", --нужно будет вписать сюда специальный деф мин, на базе маяка.
						count		= 4,
						nRoundPhase	= 4,	
					},	
				},	
			},
		[ 5 ] = 
			{
				sRoundType 	= "transport",	
				DialogsOnStart = {	
					{ 1, "le_vasseur", "pve_rescue_pirates_base_transport_2", "cmd/pve/pirate_base/pirates_base_transport2", 20 },
				},
				nRoundPhase	= 2,	
				bCountBar	= true,
				bRandomBoss = true,
				transport 	= { "Transport2" },
				nextSpawn	= { 1 },
				sTargetDef 	= "CargoShipPirateRescue", -- целевой деф, может быть враждебным и союзным
				tSpeed		= 0.17, --целевая скорость транспортника
				nMaxSpeed	= 10,
				bEscapeResult= true, -- флаг на результат ухода транспорта
				bDeadResult	= false, -- флаг на результат смерти транспорта
				timer		= 20,
				tId			= nil,	
				additionalFunc = { 
					Func = function( self, curPhase )
						SV_Pve_SetSpawnGroup( 3 )
				end,	
				},
			},
		},	
		
	mobs = 
	{
		MeatBots = {  },										
		EliteBots	= {  },
		BossBots	= {  },
	},
	
	aPortals = {
		[19] = {
		cPortal = "portal_19",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_19",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[20] = {
		cPortal = "portal_20",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_20",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
	},
		
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {
	[ 1 ] = 
		{
			MeatBots_t1 = {},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		},
	[ 2 ] = 
		{
			MeatBots_t1 = {},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		},
	[ 3 ] = 
		{
			MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },	
			MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },
			EliteBots = { "Ship_Gen_Easy_Elite_Pirate_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_Pirate_EMC_Chameleon_S",  },		
			Executor = { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" }, 
		},	
	[ 4 ] = 
		{
			MainPortalTagPoints = {"spawn_spot_20",},
			portalTagPoints = {"spawn_spot_20","spawn_spot_19",},
			MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },	
			MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },
			EliteBots = { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Pirate_Recon_S",  },		
			Executor = { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" }, 
			BossBots	= {"Ship_rescue_Boss_Jericho_Destroyer"},
		},	
	[ 5 ] = 
		{
			MainPortalTagPoints = {"spawn_spot_19",},
			portalTagPoints = {"spawn_spot_19","spawn_spot_20",},
			MeatBots_t1 = { "Ship_Gen_Easy_Meat_Pirate_S", "Ship_Gen_Easy_Meat_Pirate_M", "Ship_Gen_Easy_Meat_Pirate_L" },	
			MeatBots_t2 = { "Ship_Gen_Easy_Meat_Pirate_Heal_L", "Ship_Gen_Easy_Meat_Pirate_Guard_L", "Ship_Gen_Easy_Meat_Pirate_Saboteur_S", "Ship_Gen_Easy_Meat_Pirate_Silence_S", "Ship_Gen_Easy_Meat_Pirate_Command_Attacker_M", "Ship_Gen_Easy_Meat_Pirate_Tackler_M" },
			EliteBots = { "Ship_Gen_Easy_Elite_Pirate_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Pirate_Hiller_L",  },	
			Executor = { "Ship_Gen_Easy_Elite_Pirate_Saboteur_Executor" }, 
			BossBots	= {"Ship_rescue_Boss_Federation_Destroyer"},
		},
	},
	
}

-- T1 Mission
PvE_Missions.rescue_pirates_base = 
{
	levelName = "pve_rescue_pirates_base",
	scenario_description = { "pve_rescue_pirates_base_str1", "pve_rescue_pirates_base_str2", "pve_rescue_pirates_base_str3" },
	need_spawn_warp = true,

	desc = "",
	resurrection_attempts = 5,
	item_lvl = 10, -- параметр для начисления награды.
	accountRank = 8,
	rank  = 1,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.low[3],
	bot_difficulty = 0, -- параметр задающий сложность ботов.
	disabled = false,
	waves_ui_hide = true,
	
	turret_health_coef = 0.3,
	turret_damage_coef = 0.6,	--#79539
	
	difficulty = "easy",
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	event_loot_attempts = 3,
	squads = {				
		{
			name = "Transport1",
	 		relationship_group = 1,
			spawn_spot = "Team1Group1",
			route = "TransportPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipPirateRescue", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},		
		{
			name = "Transport2",
	 		relationship_group = 1,
			spawn_spot = "Team1Group1",
			route = "TransportPath2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 12000,			
			cargoship = "CargoShipPirateRescue", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			precache_defs = { "Ship_rescue_Boss_Empire_Destroyer", "Ship_Gen_Easy_Elite_Pirate_Command_Sniper_M", "Bonus_PVE_Heal_S", "Bonus_PVE_Damage_Self", "Bonus_PVE_Shield_S", "Bonus_PVE_SpeedUp", "Bonus_PVE_Shield_All", "Bonus_PVE_Heal_All",},
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "pve_rescue_pirates_base_r1_rdesc", 
			start_sentence = "CMDR_BLACKWOOD_DEFENCE",
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			modifiers =
			{
				
			},
			
			phases = 
 			{
    			[ 1 ] = {},
				[ 2 ] = {},	
				[ 3 ] = {},	
				[ 4 ] = {},	
				[ 5 ] = {},	
            },
			
			start_event = 
			{
			},

			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 25,
				
					{	def = "Ship_Bot_EasySmallMeat_R3_S_T1", count = 4, spawn_group = 0, spawn_warp = true, delay = 99999999999999999999999999999999999999999999999, }, 
				},
			},
		},	
	},
}

PvE_Mission.nCurPhase = 0

function PvE_RPB:OnStart()

	local vitals = GetEntitiesByDef( "PvE_Gen_VitalGenerator2" )
	
	for i, vital in ipairs( vitals ) do
		Entities[ vital ]:ShowInHud( false )
		Entities[ vital ]:FullActivate( false )
	end
	
	Entities[ "DockingBay3" ]:ShowInHud( false )
	Entities[ "DockingBay3" ]:SetDamageable( false )
	
	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 600
	
	PvE_Mission.iWaveMobs 	= 27
	PvE_Mission.initMobs 	= 27
	PvE_Mission.iMaxMobs 	= 20
	PvE_Mission.iNeed2Boss 	= -1
	PvE_Mission.iNeed2Elite = 27
	PvE_Mission.try			= 1
	PvE_Mission.previousMobId = -1
	PvE_Mission.iKilled = 0
	PvE_Mission.waveCut = 
	{
		[ "iNeed2Boss" ] = 0,
		[ "iNeed2Elite" ] = 0,
		[ "iEventWave" ] = 0,
		[ "repairsGroup" ] = 0,
	}
end	

PvE_Missions.rescue_pirates_base.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )
	return PvE_RPB:OnUpdate( dt )
end	

function PvE_RPB:OnUpdate( dt )

	return PvE_Func:OnUpdate( dt )
	
end

for i, phase in ipairs( PvE_RPB_Container.aWaves ) do 

	for j, group in pairs( phase ) do
		for k, mob in ipairs( group ) do 
			if PvE_Func:FindValue( PvE_Missions.rescue_pirates_base.rounds[ 1 ].precache_defs, mob ) == false then
				table.insert( PvE_Missions.rescue_pirates_base.rounds[ 1 ].precache_defs, mob )
			end	
		end	
	end
end

PvE_Missions.rescue_pirates_base.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.rescue_pirates_base.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end