PvE_JB_H = {}

PvE_Container4 = 
{
	aPhases = {  
		[ 1 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "jer_major", "pve_jericho_base_breaker_warp" },
				},
				sTargetDef	= { "PvE_Gen_MainGateBlocker", }, -- целевой деф для уничтожения
				tCount		= 1,
				nRoundPhase	= 1,
				nWoWMsgTimer= 30, 
				PossibleEvents= { },
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},
			},
		[ 2 ] = --заглушка на время полета астероида
			{
				sRoundType 	= "custom",
				timer		= 10,			
				nRoundPhase	= 2,		
				result		= false, 
				DialogsOnStart = {	
					{ 1, "jer_major", "pve_jericho_base_broken_warp" },
				},
				additionalFunc = { 
					Func = function( self, curPhase )
						Entities[ "PirateAvanpost2" ]:ShowInHud( true )
						Entities[ "PirateAvanpost3" ]:ShowInHud( true )
						Entities[ "PirateAvanpost2" ]:SetDamageable( true )
						Entities[ "PirateAvanpost3" ]:SetDamageable( true )
					end,
				},
			},
		[ 3 ] = 
			{
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "jer_major", "pve_jericho_base_break_avanpost" },
				},
				DialogOnProgress = {				
					[ 1 ] = { 
						{ 1, "jer_major", "pve_jericho_base_break_avanpost_progress" },
					},	
				},
				sTargetDef	= { "PvE_JerichoAvanpost", }, -- целевой деф для уничтожения
				tCount		= 2,
				nRoundPhase	= 3,
				nWoWMsgTimer= 30, 
				PossibleEvents= { },
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},	
				additionalFunc = { 
					Func = function( self, curPhase )
						SV_Pve_SetSpawnGroup( 1 )
						Entities[ "Jericho_holder1" ]:FullActivate( true )
						Entities[ "Jericho_holder2" ]:FullActivate( true )
						Entities[ "Jericho_holder3" ]:FullActivate( true )
						Entities[ "Jericho_holder4" ]:FullActivate( true )
						Entities[ "Jericho5" ]:FullActivate( true )
						Entities[ "Jericho6" ]:FullActivate( true )
						Entities[ "Jericho7" ]:FullActivate( true )
						Entities[ "Jericho8" ]:FullActivate( true )
						Entities[ "Jericho9" ]:FullActivate( true )
						Entities[ "Jericho10" ]:FullActivate( true )
						Entities[ "Jericho11" ]:FullActivate( true )
						Entities[ "Jericho12" ]:FullActivate( true )
						Entities[ "Jericho13" ]:FullActivate( true )
						Entities[ "SpaceShield6" ]:FullActivate( true )
						Entities[ "EnergyGeneratorLong2" ]:FullActivate( true )
						Entities[ "SpaceShield5" ]:FullActivate( true )
				end,},
			},
		[ 4 ] = 
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				DialogsOnStart = {	
					{ 1, "jer_major", "pve_jericho_base_vitals1" },
				},
				DialogOnProgress = {				
					[ 1 ] = { 
						{ 1, "jer_major", "pve_jericho_base_vitals1_progress" },
					},	
				},
				specificDef	= "VitalPoint_PvE_Jerichobase_ControlStationA",
				count		= 1,
				nRoundPhase	= 4,		
			},
		[ 5 ] = 
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				DialogsOnStart = {	
					{ 1, "jer_major", "pve_jericho_base_vitals2" },
				},
				specificDef	= "VitalPoint_PvE_Jerichobase_ControlStationB",
				count		= 2,
				nRoundPhase	= 5,
				additionalFunc = { 
					Func = function( self, curPhase )
						for i = 1, 12 do
							Entities[ "EntityBuilderTrigger"..i ]:Activate()
						end
						SV_Pve_SetSpawnGroup( 2 )
				end,
				},		
			},
		[ 6 ] = 
			{
				sRoundType 	= "transport",	
				DialogsOnStart = {	
					{ 1, "jer_major", "pve_jericho_base_defence_radar" },
				},
				DialogOnProgress = {				
					[ 1 ] = { 
						{ 1, "jer_major", "pve_jericho_base_defence_radar_progress" },
					},	
				},
				nRoundPhase	= 6,	
				bCountBar	= true,
				transport 	= { "Transport1", "Transport2", "Transport3" },
				nextSpawn	= { 15, 25, 25 },
				sTargetDef 	= "CargoShipTeam2_Jericho_T2", -- целевой деф, может быть враждебным и союзным
				tSpeed		= 0.1, --целевая скорость транспортника
				nMaxSpeed	= 10,
				EscapeToEnd	= 1,
				bEscapeResult= false, -- флаг на результат ухода транспорта
				bDeadResult	= true, -- флаг на результат смерти транспорта
				timer		= 20,
				tId			= nil,	
				additionalFunc = { 
					Func = function( self, curPhase )
						Entities[ "PrisonGenerator1" ]:ShowInHud( true )
						Entities[ "PrisonGenerator2" ]:ShowInHud( true )
						Entities[ "PrisonGenerator1" ]:SetDamageable( true )
						Entities[ "PrisonGenerator2" ]:SetDamageable( true )
				end,	
				},
			},	
		[ 7 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "jer_major", "pve_jericho_base_break_broker" },
				},
				DialogOnProgress = {				
					[ 1 ] = { 
						{ 1, "sch_admiral", "pve_jericho_base_break_broker_progress1", "sound", 10 }, 
						{ 10, "sch_kate", "pve_jericho_base_break_broker_progress2", "sound", 10 },
						{ 10, "sch_admiral", "pve_jericho_base_break_broker_progress3", "sound", 10 }, 
						{ 10, "jer_major", "pve_jericho_base_break_broker_progress4", "sound", 10 },
					},		
				},		
				sTargetDef	= { "PvE_Gen_SignalBlocker", }, -- целевой деф для уничтожения
				tCount		= 2,
				nRoundPhase	= 7,
				nWoWMsgTimer= 30, 
				PossibleEvents= { },
				switchNPhase= {}, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},
			},
		[ 8 ] = 
			{
				sRoundType 	= "transport",	
				DialogsOnStart = {	
					{ 1, "jer_major", "pve_jericho_base_defence_radar2" },
				},
				nRoundPhase	= 8,	
				bCountBar	= true,
				transport 	= { "Transport4", "Transport5", "Transport6", },
				nextSpawn	= { 15, 15, 30 },
				sTargetDef 	= "CargoShipTeam2_Jericho_T2", -- целевой деф, может быть враждебным и союзным
				tSpeed		= 0.1, --целевая скорость транспортника
				nMaxSpeed	= 10,
				EscapeToEnd	= 1,
				bEscapeResult= false, -- флаг на результат ухода транспорта
				bDeadResult	= true, -- флаг на результат смерти транспорта
				timer		= 20,
				tId			= nil,		
			},	
		},	
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {
	[ 1 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Jerico_Low_Plasma_T2", "Ship_Bot_Jerico_Low_PlasmaB_T2" },	
			MeatBots_t2 = { "Ship_Bot_Jerico_Middle_Sniper_T2", },	
			EliteBots = { },	
			Executor = {}, 
		},
	[ 2 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Jerico_Low_Plasma_T2", "Ship_Bot_Jerico_Low_PlasmaB_T2" },	
			MeatBots_t2 = { "Ship_Bot_Jerico_Middle_Sniper_T2", },	
			EliteBots = { "Ship_Bot_Jerico_High_Plasma_T2", "Ship_Bot_Jerico_Elite_Laser_T2", "Ship_Bot_Jerico_Elite_Plasma_T2" },	
			Executor = {}, 
		},
	[ 3 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Jerico_Low_Plasma_T2", "Ship_Bot_Jerico_Low_PlasmaB_T2" },	
			MeatBots_t2 = { "Ship_Bot_Jerico_Middle_Sniper_T2", },	
			EliteBots = { "Ship_Bot_Jerico_High_Plasma_T2", "Ship_Bot_Jerico_Elite_Laser_T2", "Ship_Bot_Jerico_Elite_Plasma_T2" },	
			Executor = {}, 
		},
	[ 4 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Jerico_High_Laser_T2", "Ship_Bot_Jerico_Middle_Railgun_T2", "Ship_Bot_Jerico_Low_Laser_T2", "Ship_Bot_Jerico_Low_PlasmaB_T2" },	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		},
	[ 5 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Jerico_High_Laser_T2", "Ship_Bot_Jerico_Middle_Railgun_T2", "Ship_Bot_Jerico_Low_Laser_T2", "Ship_Bot_Jerico_Low_PlasmaB_T2" },	
			MeatBots_t2 = { "Ship_Bot_Jerico_Low_Railgun_T2", "Ship_Bot_Jerico_Middle_Sniper_T2", "Ship_Bot_Jerico_High_Plasma_T2" },	
			EliteBots = { "Ship_Bot_Jerico_Elite_Plasma_T2", "Ship_Bot_Jerico_Elite_Railgun_T2", "Ship_Bot_Jerico_Elite_Laser_T2", },	
			Executor = {}, 
		},
	[ 6 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Jerico_Low_Laser_T2", "Ship_Bot_Jerico_Low_Railgun_T2", "Ship_Bot_Jerico_Low_PlasmaB_T2" },	
			MeatBots_t2 = { "Ship_Bot_Jerico_Middle_Railgun_T2", "Ship_Bot_Jerico_High_Laser_T2" },	
			EliteBots = { "Ship_Bot_Jerico_Elite_Laser_T2", "Ship_Bot_Jerico_Elite_Railgun_T2" },
			Executor = {}, 	
		},
	[ 7 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Jerico_Low_Laser_T2", "Ship_Bot_Jerico_Low_Railgun_T2", "Ship_Bot_Jerico_Low_PlasmaB_T2" },	
			MeatBots_t2 = { "Ship_Bot_Jerico_Middle_Railgun_T2", "Ship_Bot_Jerico_High_Laser_T2" },	
			EliteBots = { "Ship_Bot_Jerico_Elite_Laser_T2", "Ship_Bot_Jerico_Elite_Railgun_T2" },
			Executor = {}, 	
		},
	[ 8 ] = 
		{
			MeatBots_t1 = { "Ship_Bot_Jerico_Low_Laser_T2", "Ship_Bot_Jerico_Low_Railgun_T2", "Ship_Bot_Jerico_Low_PlasmaB_T2" },	
			MeatBots_t2 = { "Ship_Bot_Jerico_Middle_Railgun_T2", "Ship_Bot_Jerico_High_Laser_T2" },	
			EliteBots = { "Ship_Bot_Jerico_Elite_Laser_T2", "Ship_Bot_Jerico_Elite_Railgun_T2" },
			Executor = {}, 	
		},
	},
}

--
PvE_Missions.pve_jericho_base_t2 = 
{
	levelName = "pve_jericho_base",
	scenario_description = { "jericho_base_str1", "jericho_base_str2", "jericho_base_str3" },

	event_loot_attempts = 3,
	desc = "",
	resurrection_attempts = 5,
	accountRank = 6,
	rank  = 1,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.med[3],
	item_lvl = 10, -- параметр для начисления награды.
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	disabled = false,
	waves_ui_hide = true,

	turret_health_coef = 0.2,
	turret_damage_coef = 0.1,
	need_spawn_warp = true,
	
	difficulty = "easy",
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	squads = {
		{
			name = "MobileSpawn",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath1",
			squad_type = ai.AISquadType.PATROL,
			spawn_by_PvE_Mission = true,
			spawn_ignore_collision = true,
			first_spawn_delay = 15000,
			respawn_time = 10000,
			players_first = true,
			
			members = 
			{	
				{
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, 0, 20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 20, -20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( -20, -20, 0 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, -20, 20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, 20, 0 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( -20, 0, -20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, -20, -20 ) },
				},
			},			
		},	
		{
			name = "Transport1",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2_Jericho_T2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			route = "TransportPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2_Jericho_T2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2_Jericho_T2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			route = "TransportPath2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2_Jericho_T2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			route = "TransportPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2_Jericho_T2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			route = "TransportPath3", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShipTeam2_Jericho_T2", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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

			uiRoundDesc = "pve_jericho_r1_rdesc", 
			start_sentence = "CMDR_PVE_START_ROUND_BREACH",
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			precache_defs = 
			{
				"Ship_Bot_Jerico_Low_Plasma_T2", 
				"Ship_Bot_Jerico_Low_PlasmaB_T2",
				"Ship_Bot_Jerico_Middle_Sniper_T2",	
				"Ship_Bot_Jerico_High_Plasma_T2", 
				"Ship_Bot_Jerico_Low_Laser_T2", 
				"Ship_Bot_Jerico_Elite_Plasma_T2", 
				"Ship_Bot_Jerico_Low_Railgun_T2", 
				"Ship_Bot_Jerico_Middle_Railgun_T2", 
				"Ship_Bot_Jerico_High_Laser_T2",
				"Ship_Bot_Jerico_Elite_Laser_T2", 
				"Ship_Bot_Jerico_Elite_Railgun_T2",
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
			},
			modifiers =
			{
				{ spell = "Pve_HealHull_T2",	caster_group = 1, }, -- 1 players team, AI team
				{ spell = "Pve_HealShield_T2",	caster_group = 1, },
			},

			sabotage_list = { "PirateAvanpost1", "PirateAvanpost2", "PirateAvanpost3", },
			
			phases = 
 			{
    			[ 1 ] = {},
				[ 2 ] = {},	
				[ 3 ] = {},	
				[ 4 ] = {},	
				[ 5 ] = {},	
				[ 6 ] = {},	
				[ 7 ] = {},	
				[ 8 ] = {},	
            },
			
			start_event = 
			{
				{  target = "EnergyGeneratorLong2", action = "DisableAssociatedSpawn", },
				{  target = "EnergyGeneratorLong3", action = "DisableAssociatedSpawn", },
				{  target = "ActiveJumpgate1", action = "FullDeactivate", },		
				{  target = "ActiveJumpgate2", action = "FullDeactivate", },
				{  target = "ActiveJumpgate3", action = "FullDeactivate", },
				{  target = "Station1", action = "FullActivate", },			
				{  target = "SpaceShield5", action = "FullDeactivate", },		
				{  target = "SpaceShield6", action = "FullDeactivate", },	
				{  target = "SpaceShield7", action = "FullDeactivate", },
				{  target = "EnergyGeneratorLong2", action = "FullDeactivate", },			
				{  target = "JerichoControlStationA1", action = "FullDeactivate", },	
				{  target = "JerichoControlStationB1", action = "FullDeactivate", },
				{  target = "JerichoControlStationC1", action = "FullDeactivate", },
				{  target = "JerichoControlStationA1", action = "HideFromHud", },	
				{  target = "JerichoControlStationB1", action = "HideFromHud", },
				{  target = "JerichoControlStationC1", action = "HideFromHud", },				
				{  target = "PirateAvanpost1", action = "FullActivate", },  
				{  target = "PirateAvanpost2", action = "FullActivate", },
				{  target = "PirateAvanpost3", action = "FullActivate", },
				{  target = "PirateAvanpost2", action = "DisableAssociatedSpawn", },
				{  target = "PirateAvanpost3", action = "DisableAssociatedSpawn", },				
				{  target = "PoliceTurret1", action = "FullDeactivate", },	
				{  target = "PoliceTurret2", action = "FullDeactivate", },
				{  target = "PoliceTurret3", action = "FullDeactivate", },
				{  target = "PoliceTurret4", action = "FullDeactivate", },
				{  target = "PoliceTurret5", action = "FullDeactivate", },
				{  target = "PoliceTurret6", action = "FullDeactivate", },
				{  target = "PoliceTurret7", action = "FullDeactivate", },
				{  target = "PoliceTurret8", action = "FullDeactivate", },
				{  target = "PoliceTurret9", action = "FullDeactivate", },
				{  target = "PoliceTurret10", action = "FullDeactivate", },			
			  	{  target = "EntityBuilderTrigger1", action = "DeactivateTrigger", },							
			  	{  target = "EntityBuilderTrigger2", action = "DeactivateTrigger", },			
			  	{  target = "EntityBuilderTrigger3", action = "DeactivateTrigger", },
			  	{  target = "EntityBuilderTrigger4", action = "DeactivateTrigger", },
			  	{  target = "EntityBuilderTrigger5", action = "DeactivateTrigger", },
			  	{  target = "EntityBuilderTrigger6", action = "DeactivateTrigger", },
			  	{  target = "EntityBuilderTrigger7", action = "DeactivateTrigger", },
			  	{  target = "EntityBuilderTrigger8", action = "DeactivateTrigger", },		
			  	{  target = "EntityBuilderTrigger9", action = "DeactivateTrigger", },			
				{  target = "EntityBuilderTrigger10", action = "DeactivateTrigger", },
				{  target = "EntityBuilderTrigger11", action = "DeactivateTrigger", },
				{  target = "EntityBuilderTrigger12", action = "DeactivateTrigger", },										
			},

			waves =
			{
				[ 1 ] = -- 36
				{
					max_agents_at_same_time = 14,
					
					{	def = "Ship_Bot_Jerico_Low_Plasma_T2", count = 4, spawn_group = 6, spawn_warp = true, delay = 99999, },
				-- --	{	def = "Ship_Bot_Jerico_Low_Plasma_T2", count = 4, spawn_group = 6, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost1", },
				-- --	{	def = "Ship_Bot_Jerico_Low_PlasmaB_T2", count = 4, spawn_group = 6, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost1", },
				-- --	{	def = "Ship_Bot_Jerico_Middle_Sniper_T2", count = 2, spawn_group = 6, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost1", },
				-- --	{	def = "Ship_Bot_Jerico_Elite_Plasma_T2", count = 2, spawn_group = 6, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost1", },
					-- {	def = "Ship_Bot_Jerico_Elite_Laser_T2", count = 2, spawn_group = 6, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost1", },
					
					-- {	def = "Ship_Bot_Jerico_Low_Plasma_T2", count = 2, spawn_group = 6, spawn_warp = true, delay = 10, require_entity = "PirateAvanpost1", },
					-- {	def = "Ship_Bot_Jerico_Low_PlasmaB_T2", count = 2, spawn_group = 6, spawn_warp = true, delay = 10, require_entity = "PirateAvanpost1", },
					-- {	def = "Ship_Bot_Jerico_Middle_Sniper_T2", count = 4, spawn_group = 6, spawn_warp = true, delay = 10, require_entity = "PirateAvanpost1", },
					-- {	def = "Ship_Bot_Jerico_Elite_Plasma_T2", count = 4, spawn_group = 6, spawn_warp = true, delay = 10, require_entity = "PirateAvanpost1", },
					-- {	def = "Ship_Bot_Jerico_Elite_Laser_T2", count = 2, spawn_group = 6, spawn_warp = true, delay = 20, require_entity = "PirateAvanpost1", },
					
				-- --	{	def = "Ship_Bot_Jerico_Low_Plasma_T2", count = 4, spawn_group = 1, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost2", },
				-- --	{	def = "Ship_Bot_Jerico_Middle_Sniper_T2", count = 4, spawn_group = 1, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost2", },
				-- --	{	def = "Ship_Bot_Jerico_High_Plasma_T2", count = 2, spawn_group = 1, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost2", },
				-- --	{	def = "Ship_Bot_Jerico_Elite_Plasma_T2", count = 2, spawn_group = 1, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost2", },
					-- {	def = "Ship_Bot_Jerico_Elite_Laser_T2", count = 2, spawn_group = 1, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost2", },
					
					-- {	def = "Ship_Bot_Jerico_Low_Plasma_T2", count = 2, spawn_group = 1, spawn_warp = true, delay = 10, require_entity = "PirateAvanpost2", },
					-- {	def = "Ship_Bot_Jerico_Middle_Sniper_T2", count = 2, spawn_group = 1, spawn_warp = true, delay = 10, require_entity = "PirateAvanpost2", },
					-- {	def = "Ship_Bot_Jerico_High_Plasma_T2", count = 4, spawn_group = 1, spawn_warp = true, delay = 10, require_entity = "PirateAvanpost2", },
					-- {	def = "Ship_Bot_Jerico_Elite_Plasma_T2", count = 4, spawn_group = 1, spawn_warp = true, delay = 10, require_entity = "PirateAvanpost2", },
					-- {	def = "Ship_Bot_Jerico_Elite_Laser_T2", count = 2, spawn_group = 1, spawn_warp = true, delay = 20, require_entity = "PirateAvanpost2", },
					
				-- --	{	def = "Ship_Bot_Jerico_Low_Plasma_T2", count = 4, spawn_group = 2, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost3", },
				-- --	{	def = "Ship_Bot_Jerico_High_Plasma_T2", count = 4, spawn_group = 2, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost3", },
				-- --	{	def = "Ship_Bot_Jerico_Elite_Plasma_T2", count = 2, spawn_group = 2, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost3", },
				-- --	{	def = "Ship_Bot_Jerico_Elite_Laser_T2", count = 2, spawn_group = 2, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost3", },
					
					-- {	def = "Ship_Bot_Jerico_Elite_Laser_T2", count = 4, spawn_group = 2, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost3", },
					-- {	def = "Ship_Bot_Jerico_Low_Plasma_T2", count = 2, spawn_group = 2, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost3", },
					-- {	def = "Ship_Bot_Jerico_High_Plasma_T2", count = 2, spawn_group = 2, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost3", },
					-- {	def = "Ship_Bot_Jerico_Elite_Plasma_T2", count = 4, spawn_group = 2, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost3", },
					-- {	def = "Ship_Bot_Jerico_Elite_Laser_T2", count = 4, spawn_group = 2, spawn_warp = true, delay = 0, require_entity = "PirateAvanpost3", },
				},
				
			},
		},
	}	
}

PvE_Missions.pve_jericho_base_t2.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_JB_H:OnUpdate( dt )
end

function PvE_JB_H:OnStart()
	
	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()

	Entities[ "PrisonGenerator1" ]:ShowInHud( false )
	Entities[ "PrisonGenerator2" ]:ShowInHud( false )
	Entities[ "PrisonGenerator1" ]:SetDamageable( false )
	Entities[ "PrisonGenerator2" ]:SetDamageable( false )
	
	Entities[ "PirateAvanpost2" ]:ShowInHud( false )
	Entities[ "PirateAvanpost3" ]:ShowInHud( false )
	Entities[ "PirateAvanpost2" ]:SetDamageable( false )
	Entities[ "PirateAvanpost3" ]:SetDamageable( false )
end

function PvE_JB_H:OnUpdate( dt )

	return PvE_Func:OnUpdate( dt )
end

PvE_Missions.pve_jericho_base_t2.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.pve_jericho_base_t2.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end