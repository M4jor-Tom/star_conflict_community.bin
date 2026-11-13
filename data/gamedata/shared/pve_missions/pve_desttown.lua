lua_debug = false

PvE_Desttown = {}

PvE_Container = 
{
	aPhases = {  
		[ 1 ] = { 
				sRoundType 	= "destroyer", -- указываем тип фазы
				bCountBar	= true,
				DialogsOnStart = {	
					{ 1, "mercenary", "pve_gen_desttown_generators" },
				},
				sTargetDef	= { "PvE_Gen_EnergyGenerator1", }, -- целевой деф для уничтожения
				tCount		= 2, -- сколько объектов уничтожить нужно
				nRoundPhase		= 1, -- запуск конкретной фазы ПвЕ из кода
				PossibleEvents= { "Desttown_Goblin", },
			},
		[ 2 ] = { 
				--настройки фазы
				sRoundType 	= "transport", -- указываем тип фазы
				nRoundPhase	= 2,
				bEscapeResult= false, -- флаг на результат ухода транспорта
				bDeadResult	= true, -- флаг на результат смерти транспортаcurPhase.
				bHPBar = true,
				--настройка цели фазы
				transport 	= "Transport1", -- указываем название сквада с транспортом
				sTargetDef 	= "CargoShip_Gen_Wrecker", -- целевой деф, может быть враждебным и союзным
				aTransportEngines	= { "CargoShip_Engines_01", "CargoShip_Engines_02" },
				tSpeed		= 0.1, --целевая скорость транспортника
				nMaxSpeed	= 15,
				--эвенты
				PossibleEvents		= { "Desttown_Event_Beacon", },
				--говорящие головы
				DialogsOnStart = {	
					{ 1, "mercenary", "pve_gen_desttown_convoy_destroy_1" },
				},
				--заменяемые фазы
				switchNPhase= { 3, 4, 5 }, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
					{
						sRoundType 	= "vitals", -- указываем тип фазы. Для маяков всегда в начале раунда сформирована таблица, местоположение маяка определяется его фазой.
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_radar_shotdown" },
						},
						nRoundPhase	= 6,
					},
					{
						sRoundType 	= "transport",
						transport 	= "Transport2",
						tSpeed		= 1,
						nMaxSpeed	= 15,
						sMining		= "RW_Bomb",
						PossibleEvents	= { "Desttown_Grab_Hero", },
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_convoy_destroy_2" },
						},
						sTargetDef 	= "CargoShip_Gen_Undead",
						bTransportShield= true,
						bHPBar 		= true,
						bEscapeResult= false, -- флаг на результат ухода транспорта
						bDeadResult	= true, -- флаг на результат смерти транспорта
						nRoundPhase	= 7,
						switchNPhase= { 5, 6 },
						tSwitchTable= 
						{
							{						
								sRoundType 	= "vitals",
								DialogsOnStart = {	
									{ 1, "eventgirl", "pve_gen_desttown_radar_3" },
								},
								sTargetDef	= "PvE_Gen_RadarStation",
								count	= 1,
								nRoundPhase	= 14,
								PossibleEvents	= { "Desttown_Defuse_bombs", },
							},
							{
								sRoundType 	= "destroyer",
								tCount		= 1,
								DialogsOnStart = {	
									{ 1, "eventgirl", "pve_gen_desttown_docks_destroy_4" },
								},
								bHPBar		= true,
								sTargetDef	= { "PvE_DemolishDockingBay_Enemy", },
								sReplaceObject = "DockingBay2", -- указывается имя заменяемого объекта
								nRoundPhase	= 8,
								bRandomBoss = true,
								ruins		= "PvE_Gen_DockingBayRuins",
								phaseId		= 3,
							},
						},
					},
					{
						sRoundType 	= "destroyer",
						tCount		= 1,
						sTargetDef	= { "PvE_DemolishDockingBay_Enemy", },
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_docks_destroy_1" },
						},
						sReplaceObject = "DockingBay2", -- указывается имя заменяемого объекта
						bHPBar		= true,
						ruins		= "PvE_Gen_DockingBayRuins", 
						nRoundPhase	= 8,
						bRandomBoss = true,
						PossibleEvents	= { "Desttown_Defuse_bombs", },
						phaseId		= 2,
					},
				},
			},
		[ 3 ] = { 
				sRoundType		= "transport", -- тип фазы
				transport 	= "Transport3", -- имя сквада
				aDropTable	= {
					phase 	= 1, -- номер фазы из таблицы tSwitchTable
					count	= 10, -- сколько объектов надо дропнуть
					dropDef	= "LootCrate_Gen_PvE_Mines", -- что надо дропнуть
				},
				tSpeed		= 1,
				nMaxSpeed	= 16,
				DialogsOnStart = {	
					{ 1, "eventgirl", "pve_gen_desttown_convoy_1" },
				},
				sTargetDef 		= "CargoShip_Gen_Sapper",
				bEscapeResult= true,
				bDeadResult	= false,
				bHPBar 		= true,
				nRoundPhase	= 3,
				switchNPhase= { 4, 5, 6 },
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
					{
						sRoundType 	= "mines", 
						sTargetDef	= "PvE_Debrissite_Bomb",
						bombHolo	= "PvE_Debrissite_Bomb",
						mines		= "LootCrate_Gen_PvE_Mines",
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_mines" },
						},
						tTrigger	= "BombBuilderTrigger",		
						nRoundPhase	= 9,
						PossibleEvents	= { "Desttown_Grab_Hero", },
					},
					{
						sRoundType 	= "vitals",
						bCountBar	= true,
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_shield_generators" },
						},
						sTargetDef 		= "PvE_Gen_BeaconsGen",
						count		= 3,
						nRoundPhase	= 10,
						PossibleEvents	= { "Desttown_Defuse_bombs", },
					},
					{
						sRoundType 	= "destroyer",
						tCount		= 1,
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_radar_generator" },
						},
						sTargetDef 	= { "PvE_Gen_EnergyGenerator", }, -- указывается имя заменяемого объекта
						shield		= "SpaceShieldJericho1",
						nRoundPhase	= 11,
						bRandomBoss = true,
						phaseId		= 4,
					}
				},	
			},
		[ 4 ] = { 
				sRoundType 	= "towerDefense",
				PossibleEvents	= { "Desttown_Grab_Hero", },
				bHPBar	= true,
				sTargetDef	= { "PvE_DemolishDockingBay_Ally", },
				tTrigger= "TurretBuilderTrigger",
				sReplaceObject = "DockingBay2", -- указывается имя заменяемого объекта
				DialogsOnStart = {	
					{ 1, "eventgirl", "pve_gen_desttown_towerdefense" },
				},
				timer	= 180,
				ruins			= "PvE_Gen_DockingBayRuins", 
				nRoundPhase		= 4,	
				switchNPhase= { 5, 6, 7 },		
				tSwitchTable =
				{
					{
						sRoundType 	= "vitals",
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_radar_1" },
						},					
						sTargetDef	= "PvE_Gen_RadarStation",
						count		= 1,
						nRoundPhase	= 12,
						PossibleEvents	= { "Desttown_Defuse_bombs", },
					},
					{
						sRoundType 	= "defense",
						sTargetDef	= "PvE_Gen_DemolishRadarStation",
						replaceObjectFromPhase = 5,
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_defense" },
						},
						timer		= 180,
						nRoundPhase	= 13,
						bRandomBoss = true,
						phaseId		= 5,
					},
				},
			},
		[ 5 ] = { 
				sRoundType 	= "transport",
				nRoundPhase	= 5,
				transport 	= "Transport4",
				PossibleEvents	= { "Desttown_Defuse_bombs", },
				tSpeed		= 1,
				nMaxSpeed	= 16,
				DialogsOnStart = {	
					{ 1, "eventgirl", "pve_gen_desttown_convoy_2" },
				},
				sTargetDef 	= "CargoShip_Gen_Sapper",
				bEscapeResult= true,
				bDeadResult	= false,
				bRandomBoss = true,
				bHPBar 		= true,
				switchNPhase= { 6, 7 },
				phaseId		= 1,
				tSwitchTable =
				{
					{
						sRoundType 		= "destroyer",
						tCount			= 1,
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_docks_destroy_3" },
						},
						bHPBar			= true,
						sTargetDef		= { "PvE_DemolishDockingBay_Enemy", },
						replaceObjectFromPhase = 4,
						ruins			= "PvE_Gen_DockingBayRuins",
						nRoundPhase		= 8,
					},
					{
						sRoundType 	= "vitals",
						DialogsOnStart = {	
							{ 1, "eventgirl", "pve_gen_desttown_radar_2" },
						},
						sTargetDef	= "PvE_Gen_RadarStation",
						count		= 1,
						nRoundPhase	= 12,
						bRandomBoss = true,
						phaseId		= 6,
					},
				},
			},
		},
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {},
}

PvE_Desttown.aWaves = {}

PvE_Desttown.aWaves.easy = {
	[ 1 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_S", "Ship_Gen_Easy_Meat_M", "Ship_Gen_Easy_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Heal_L", "Ship_Gen_Easy_Meat_Guard_L", "Ship_Gen_Easy_Meat_Saboteur_S", "Ship_Gen_Easy_Meat_Silence_S", "Ship_Gen_Easy_Meat_Command_Attacker_M", "Ship_Gen_Easy_Meat_Tackler_M" },				
				EliteBots	= {},				
			},

	[ 2 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_S", "Ship_Gen_Easy_Meat_M", "Ship_Gen_Easy_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Heal_L", "Ship_Gen_Easy_Meat_Guard_L", "Ship_Gen_Easy_Meat_Saboteur_S", "Ship_Gen_Easy_Meat_Silence_S", "Ship_Gen_Easy_Meat_Command_Attacker_M", "Ship_Gen_Easy_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Command_Sniper_M", "Ship_Gen_Easy_Elite_Atacker_Angry_M", "Ship_Gen_Easy_Elite_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Recon_S", "Ship_Gen_Easy_Elite_Guard_Hook_L", "Ship_Gen_Easy_Elite_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Hiller_L", },
			},
	[ 3 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_S", "Ship_Gen_Easy_Meat_M", "Ship_Gen_Easy_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Heal_L", "Ship_Gen_Easy_Meat_Guard_L", "Ship_Gen_Easy_Meat_Saboteur_S", "Ship_Gen_Easy_Meat_Silence_S", "Ship_Gen_Easy_Meat_Command_Attacker_M", "Ship_Gen_Easy_Meat_Tackler_M" },				
				EliteBots	= {  "Ship_Gen_Easy_Elite_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Recon_S", "Ship_Gen_Easy_Elite_Guard_Hook_L", "Ship_Gen_Easy_Elite_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Hiller_L", },
			},
	[ 4 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_S", "Ship_Gen_Easy_Meat_M", "Ship_Gen_Easy_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Heal_L", "Ship_Gen_Easy_Meat_Guard_L", "Ship_Gen_Easy_Meat_Saboteur_S", "Ship_Gen_Easy_Meat_Silence_S", "Ship_Gen_Easy_Meat_Command_Attacker_M", "Ship_Gen_Easy_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Command_Sniper_M", "Ship_Gen_Easy_Elite_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Recon_S", "Ship_Gen_Easy_Elite_Guard_Hook_L", "Ship_Gen_Easy_Elite_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Hiller_L", },
			},
	[ 5 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_S", "Ship_Gen_Easy_Meat_M", "Ship_Gen_Easy_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Heal_L", "Ship_Gen_Easy_Meat_Guard_L", "Ship_Gen_Easy_Meat_Saboteur_S", "Ship_Gen_Easy_Meat_Silence_S", "Ship_Gen_Easy_Meat_Command_Attacker_M", "Ship_Gen_Easy_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Command_Sniper_M", "Ship_Gen_Easy_Elite_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Recon_S", "Ship_Gen_Easy_Elite_Guard_Hook_L", "Ship_Gen_Easy_Elite_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Hiller_L", },
				BossBots	= { "Ship_Gen_Easy_Boss_Federation_Destroyer", "Ship_Gen_Easy_Boss_Predator" },
			},
	[ 6 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_S", "Ship_Gen_Easy_Meat_M", "Ship_Gen_Easy_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Heal_L", "Ship_Gen_Easy_Meat_Guard_L", "Ship_Gen_Easy_Meat_Saboteur_S", "Ship_Gen_Easy_Meat_Silence_S", "Ship_Gen_Easy_Meat_Command_Attacker_M", "Ship_Gen_Easy_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Command_Sniper_M", "Ship_Gen_Easy_Elite_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Recon_S", "Ship_Gen_Easy_Elite_Guard_Hook_L", "Ship_Gen_Easy_Elite_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Hiller_L", },
			},
	[ 7 ] = { 
				MeatBots_t1 = { "Ship_Gen_Easy_Meat_S", "Ship_Gen_Easy_Meat_M", "Ship_Gen_Easy_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Easy_Meat_Heal_L", "Ship_Gen_Easy_Meat_Guard_L", "Ship_Gen_Easy_Meat_Saboteur_S", "Ship_Gen_Easy_Meat_Silence_S", "Ship_Gen_Easy_Meat_Command_Attacker_M", "Ship_Gen_Easy_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Easy_Elite_Command_Sniper_M", "Ship_Gen_Easy_Elite_Atacker_Angry_M", "Ship_Gen_Easy_Elite_Tackler_Invisible_M", "Ship_Gen_Easy_Elite_EMC_Chameleon_S", "Ship_Gen_Easy_Elite_Saboteur_Bomb_S", "Ship_Gen_Easy_Elite_Recon_S", "Ship_Gen_Easy_Elite_Guard_Hook_L", "Ship_Gen_Easy_Elite_Sniper_Chameleon_L", "Ship_Gen_Easy_Elite_Hiller_L", },
			},
}

PvE_Desttown.aWaves.hard = {
	[ 1 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_S", "Ship_Gen_Meat_M", "Ship_Gen_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Heal_L", "Ship_Gen_Meat_Guard_L", "Ship_Gen_Meat_Saboteur_S", "Ship_Gen_Meat_Silence_S", "Ship_Gen_Meat_Command_Attacker_M", "Ship_Gen_Meat_Tackler_M" },				
				EliteBots	= {},				
			},

	[ 2 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_S", "Ship_Gen_Meat_M", "Ship_Gen_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Heal_L", "Ship_Gen_Meat_Guard_L", "Ship_Gen_Meat_Saboteur_S", "Ship_Gen_Meat_Silence_S", "Ship_Gen_Meat_Command_Attacker_M", "Ship_Gen_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Command_Sniper_M", "Ship_Gen_Elite_Atacker_Angry_M", "Ship_Gen_Elite_EMC_Chameleon_S", "Ship_Gen_Elite_Saboteur_Bomb_S", "Ship_Gen_Elite_Recon_S", "Ship_Gen_Elite_Guard_Hook_L", "Ship_Gen_Elite_Sniper_Chameleon_L", "Ship_Gen_Elite_Hiller_L", },
			},
	[ 3 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_S", "Ship_Gen_Meat_M", "Ship_Gen_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Heal_L", "Ship_Gen_Meat_Guard_L", "Ship_Gen_Meat_Saboteur_S", "Ship_Gen_Meat_Silence_S", "Ship_Gen_Meat_Command_Attacker_M", "Ship_Gen_Meat_Tackler_M" },				
				EliteBots	= {  "Ship_Gen_Elite_Tackler_Invisible_M", "Ship_Gen_Elite_EMC_Chameleon_S", "Ship_Gen_Elite_Saboteur_Bomb_S", "Ship_Gen_Elite_Recon_S", "Ship_Gen_Elite_Guard_Hook_L", "Ship_Gen_Elite_Sniper_Chameleon_L", "Ship_Gen_Elite_Hiller_L", },
			},
	[ 4 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_S", "Ship_Gen_Meat_M", "Ship_Gen_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Heal_L", "Ship_Gen_Meat_Guard_L", "Ship_Gen_Meat_Saboteur_S", "Ship_Gen_Meat_Silence_S", "Ship_Gen_Meat_Command_Attacker_M", "Ship_Gen_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Command_Sniper_M", "Ship_Gen_Elite_Atacker_Angry_M", "Ship_Gen_Elite_Tackler_Invisible_M", "Ship_Gen_Elite_EMC_Chameleon_S", "Ship_Gen_Elite_Saboteur_Bomb_S", "Ship_Gen_Elite_Recon_S", "Ship_Gen_Elite_Guard_Hook_L", "Ship_Gen_Elite_Sniper_Chameleon_L", "Ship_Gen_Elite_Hiller_L", },
			},
	[ 5 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_S", "Ship_Gen_Meat_M", "Ship_Gen_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Heal_L", "Ship_Gen_Meat_Guard_L", "Ship_Gen_Meat_Saboteur_S", "Ship_Gen_Meat_Silence_S", "Ship_Gen_Meat_Command_Attacker_M", "Ship_Gen_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Command_Sniper_M", "Ship_Gen_Elite_Atacker_Angry_M", "Ship_Gen_Elite_Tackler_Invisible_M", "Ship_Gen_Elite_EMC_Chameleon_S", "Ship_Gen_Elite_Saboteur_Bomb_S", "Ship_Gen_Elite_Recon_S", "Ship_Gen_Elite_Guard_Hook_L", "Ship_Gen_Elite_Sniper_Chameleon_L", "Ship_Gen_Elite_Hiller_L", },
				BossBots	= { "Ship_Gen_Boss_Federation_Destroyer", "Ship_Gen_Boss_Predator" },
			},
	[ 6 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_S", "Ship_Gen_Meat_M", "Ship_Gen_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Heal_L", "Ship_Gen_Meat_Guard_L", "Ship_Gen_Meat_Saboteur_S", "Ship_Gen_Meat_Silence_S", "Ship_Gen_Meat_Command_Attacker_M", "Ship_Gen_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Command_Sniper_M", "Ship_Gen_Elite_Atacker_Angry_M", "Ship_Gen_Elite_Tackler_Invisible_M", "Ship_Gen_Elite_EMC_Chameleon_S", "Ship_Gen_Elite_Saboteur_Bomb_S", "Ship_Gen_Elite_Recon_S", "Ship_Gen_Elite_Guard_Hook_L", "Ship_Gen_Elite_Sniper_Chameleon_L", "Ship_Gen_Elite_Hiller_L", },
			},
	[ 7 ] = { 
				MeatBots_t1 = { "Ship_Gen_Meat_S", "Ship_Gen_Meat_M", "Ship_Gen_Meat_L" },
				MeatBots_t2 = { "Ship_Gen_Meat_Heal_L", "Ship_Gen_Meat_Guard_L", "Ship_Gen_Meat_Saboteur_S", "Ship_Gen_Meat_Silence_S", "Ship_Gen_Meat_Command_Attacker_M", "Ship_Gen_Meat_Tackler_M" },				
				EliteBots	= { "Ship_Gen_Elite_Command_Sniper_M", "Ship_Gen_Elite_Atacker_Angry_M", "Ship_Gen_Elite_Tackler_Invisible_M", "Ship_Gen_Elite_EMC_Chameleon_S", "Ship_Gen_Elite_Saboteur_Bomb_S", "Ship_Gen_Elite_Recon_S", "Ship_Gen_Elite_Guard_Hook_L", "Ship_Gen_Elite_Sniper_Chameleon_L", "Ship_Gen_Elite_Hiller_L", },
			},
}

--контейнер миссии
PvE_Mission.aMissions = {	
		[ 1 ] = "pve_desttown_waves_hard",
		[ 2 ] = "pve_desttown_waves_easy",
	}
	
PvE_Mission.buildConteiner = {

	[ "BombBuilderTrigger1" ] = "BombBuild1",
	[ "BombBuilderTrigger2" ] = "BombBuild2",
	[ "BombBuilderTrigger3" ] = "BombBuild3",
	[ "BombBuilderTrigger4" ] = "BombBuild4",
	
}	
PvE_Mission.container	= {}
PvE_Mission.nPvETimer	= 0
PvE_Mission.aAdditionalTargetId	= {}
PvE_Mission.aSapperPlayers = {} -- список игроков с минами
PvE_Mission.nCurPhase 	= 0
PvE_Mission.vitals 		= {}
PvE_Mission.nVitalsTotal = 8
PvE_Mission.aVitalsInGame = {}
PvE_Mission.nVitalCurrent = 0
PvE_Mission.nPhasesComplete = 0
PvE_Mission.bFocusPoints = true
PvE_Mission.aRandomPoints = {} -- список точек на карте в которых может разместиться рандомный эвент, считаем что их всегда 10 и называются они posN

--easy mission
PvE_Missions.pve_desttown_waves_easy = 
{
	-- "все корабли почти равны"
	rank_scale_spells = BuffByRankPVE, --BuffByRank,  -- бафф усиляющий корабли низкого ранга против ботов  (ранг боя чит цваром cvars.sv_mmBattleRank =15 при загрузке миссии)
	
	levelName = "pve_desttown",
	scenario_description = { "pve_desttown_str1", "pve_desttown_str2", "pve_desttown_str3" },
	need_spawn_warp = true,
	waves_ui_hide = true,
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	desc = "",
	resurrection_attempts = 5,
	item_lvl = 10, -- параметр для начисления награды.
	rank = 1,  -- параметр для попадания в очередь.
	accountRank = 8,
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	disabled = false,
	difficulty = "easy",
	
	HudDialogs = {},
	
	turret_health_coef = 0.7,
	turret_damage_coef = 0.7,	
	
	-- дополняются скриптом!!!
	squads = {
		{
			name = "Transport1",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Wrecker", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Undead", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport3",
	 		relationship_group = 1,
			spawn_spot = "Team1Group1",
			route = "TransportPath3", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Sapper", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport4",
	 		relationship_group = 1,
			spawn_spot = "Team1Group1",
			route = "TransportPath4", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Sapper", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Dread1",
	 		relationship_group = 1,
			spawn_spot = "Team1Group1",
			route = "Dreadnought_path1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Dreadnought", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},		
		
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
	},
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			precache_defs = {
				"Ship_Gen_Event_Goblin",
				"Ship_Gen_Meat_S",
				"Ship_Gen_Meat_M",
				"Ship_Gen_Meat_L",
				"Ship_Gen_Meat_Heal_L",
				"Ship_Gen_Meat_Guard_L",
				"Ship_Gen_Meat_Saboteur_S",
				"Ship_Gen_Meat_Silence_S",
				"Ship_Gen_Meat_Command_Attacker_M",
				"Ship_Gen_Meat_Tackler_M",
				"Ship_Gen_Elite_Command_Sniper_M",
				"Ship_Gen_Elite_Atacker_Angry_M",
				"Ship_Gen_Elite_Tackler_Invisible_M",
				"Ship_Gen_Elite_EMC_Chameleon_S",
				"Ship_Gen_Elite_Saboteur_Bomb_S",
				"Ship_Gen_Elite_Recon_S",
				"Ship_Gen_Elite_Guard_Hook_L",
				"Ship_Gen_Elite_Sniper_Chameleon_L",
				"Ship_Gen_Elite_Hiller_L",
				"Ship_Gen_Boss_Empire_Destroyer",
				"Ship_Gen_Boss_Federation_Destroyer",
				"Ship_Gen_Boss_Jericho_Destroyer",
				"Ship_Gen_Boss_Predator",
				"Ship_Gen_Boss_WazGot",
				"PvE_Gen_EnergyGenerator1",
				"PvE_Gen_DemolishRadarStation",
				"PvE_Gen_Portal",
				"PvE_Gen_RadarStation",
				"PvE_DemolishDockingBay_Enemy",
				"PvE_DemolishDockingBay_Ally",
				"PvE_Gen_DockingBayRuins",
				"PvE_FrozenStation_EnergyGenerator_hard",
				"CargoShip_Gen_Wrecker",
				"CargoShip_Gen_Sapper",
				"CargoShip_Gen_Undead",
				"SpaceShieldJericho1",
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"BtB_Bomb",
			},
			exp_reward_portion = 3,
			cred_reward_portion = 8,
			loot_attempts_reward = 4,
			player_spawn_group = 1,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "wave_nalnifan_gate_lumen_r1_rdesc",
			start_sentence = "CMDR_GEN_PVE_START_ROUND",

			modifiers =
			{
			},
			
			start_event = 
			{
			},

			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 14,
				
					{	def = "Ship_Bot_TrueMeat_R3_S_T1", count = 1, spawn_group = 2, spawn_warp = true, delay = 9999, }, 
				},
			},
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
				[ 9 ] = {},	
				[ 10 ] = {},	
				[ 11 ] = {},	
				[ 12 ] = {},	
				[ 13 ] = {},	
				[ 14 ] = {},	
            },
		},	
	},
}

--hard mission
PvE_Missions.pve_desttown_waves_hard = 
{
	-- "все корабли почти равны"
	rank_scale_spells = BuffByRankPVE, --BuffByRank,  -- бафф усиляющий корабли низкого ранга против ботов  (ранг боя чит цваром cvars.sv_mmBattleRank =15 при загрузке миссии)

	levelName = "pve_desttown",
	scenario_description = { "pve_desttown_str1", "pve_desttown_str2", "pve_desttown_str3" },
	need_spawn_warp = true,
	waves_ui_hide = true,
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	desc = "",
	resurrection_attempts = 2,
	item_lvl = 28, -- параметр для начисления награды.
	accountRank = 12,
	rank  = 6,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	bot_difficulty = 2, -- параметр задающий сложность ботов.
	disabled = false,
	difficulty = "hard",

	HudDialogs = {},

	turret_health_coef = 1.0,
	turret_damage_coef = 1.0,	
	event_loot_attempts = 3,
	
	-- дополняются скриптом!!!
	squads = {
		{
			name = "Transport1",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn1",
			route = "TransportPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Wrecker", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Undead", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport3",
	 		relationship_group = 1,
			spawn_spot = "Team1Group1",
			route = "TransportPath3", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Sapper", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Transport4",
	 		relationship_group = 1,
			spawn_spot = "Team1Group1",
			route = "TransportPath4", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Sapper", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		
		{
			name = "Dread1",
	 		relationship_group = 1,
			spawn_spot = "Team1Group1",
			route = "Dreadnought_path1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Dreadnought", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},		
		
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
	},
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			precache_defs = {
				"Ship_Gen_Event_Goblin",
				"Ship_Gen_Meat_S",
				"Ship_Gen_Meat_M",
				"Ship_Gen_Meat_L",
				"Ship_Gen_Meat_Heal_L",
				"Ship_Gen_Meat_Guard_L",
				"Ship_Gen_Meat_Saboteur_S",
				"Ship_Gen_Meat_Silence_S",
				"Ship_Gen_Meat_Command_Attacker_M",
				"Ship_Gen_Meat_Tackler_M",
				"Ship_Gen_Elite_Command_Sniper_M",
				"Ship_Gen_Elite_Atacker_Angry_M",
				"Ship_Gen_Elite_Tackler_Invisible_M",
				"Ship_Gen_Elite_EMC_Chameleon_S",
				"Ship_Gen_Elite_Saboteur_Bomb_S",
				"Ship_Gen_Elite_Recon_S",
				"Ship_Gen_Elite_Guard_Hook_L",
				"Ship_Gen_Elite_Sniper_Chameleon_L",
				"Ship_Gen_Elite_Hiller_L",
				"Ship_Gen_Boss_Empire_Destroyer",
				"Ship_Gen_Boss_Federation_Destroyer",
				"Ship_Gen_Boss_Jericho_Destroyer",
				"Ship_Gen_Boss_Predator",
				"Ship_Gen_Boss_WazGot",
				"PvE_Gen_EnergyGenerator1",
				"PvE_Gen_DemolishRadarStation",
				"PvE_Gen_Portal",
				"PvE_Gen_RadarStation",
				"PvE_DemolishDockingBay_Enemy",
				"PvE_DemolishDockingBay_Ally",
				"PvE_Gen_DockingBayRuins",
				"PvE_FrozenStation_EnergyGenerator_hard",
				"CargoShip_Gen_Wrecker",
				"CargoShip_Gen_Sapper",
				"CargoShip_Gen_Undead",
				"SpaceShieldJericho1",
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"BtB_Bomb",
			},
			exp_reward_portion = 3,
			cred_reward_portion = 8,
			loot_attempts_reward = 3,
			player_spawn_group = 1,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			uiRoundDesc = "wave_nalnifan_gate_lumen_r1_rdesc", 
			start_sentence = "CMDR_GEN_PVE_START_ROUND",

			modifiers =
			{
			},
			
			start_event = 
			{
			},

			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 14,
				
					{	def = "Ship_Bot_TrueMeat_R3_S_T1", count = 1, spawn_group = 2, spawn_warp = true, delay = 9999, }, 
				},
			},
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
				[ 9 ] = {},	
				[ 10 ] = {},	
				[ 11 ] = {},	
				[ 12 ] = {},	
				[ 13 ] = {},	
				[ 14 ] = {},	
            },
		},	
	},
}

PvE_Missions.pve_desttown_waves_easy.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )
	return PvE_Func:OnUpdate( dt )
end

PvE_Missions.pve_desttown_waves_hard.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )
	return PvE_Func:OnUpdate( dt )
end
	
function PvE_Desttown:OnStart()
	
	PvE_Mission.nVitalsTotal = 8

	--врагов по дефолту нет - надо создать
	PvE_Mission.vitals = GetEntitiesByDef( "PvE_Gen_Station" )
	
	local mines = GetEntitiesByDef( "PvE_Debrissite_Bomb" )
	if next( mines ) then
		for i, mine in ipairs( mines ) do
			Entities[ mine ]:FullActivate( false )
		end
	end
	
	local mineTriggers = {}
	local mineTrigger
	for i = 1, 4 do
		mineTrigger = GetObjectByName( "BombBuilderTrigger"..i )
		mineTriggers[ i ] = mineTrigger:GetId()
	end	
	
	PvE_Mission.aPhases[ 3 ].tSwitchTable[ 1 ].trsId = mineTriggers
	
	if next( mineTriggers ) then
		for i, tId in ipairs( mineTriggers ) do
			Entities[ tId ]:Deactivate()
		end
	end
	
	local turId = GetEntitiesByDef( PvE_Mission.aPhases[ 4 ].sTargetDef[ 1 ] )
	
	PvE_Mission.aPhases[ 4 ].turId = turId
	
	for i, tur in ipairs( turId ) do
		Entities[ tur ]:FullActivate( false )
	end
	
	for i = 1, 6 do 
		local trigId = GetObjectByName( PvE_Mission.aPhases[ 4 ].tTrigger..i )
		PvE_Mission.aPhases[ 4 ].trsId[ i ] = trigId:GetId()
	end
	
	for i, trig in ipairs( PvE_Mission.aPhases[ 4 ].trsId ) do
		Entities[ trig ]:Deactivate( false )
	end
	
	local closestPos = Entities[ "Team1Group1" ]:GetPos()
	
	for i = 1, PvE_Mission.nVitalsTotal do
		local distMin = 50000 + i * 1000
		local distMax = 225000 + i * 1500
		local vital = PvE_Func:RandomFromList( PvE_Func:GetInRange( PvE_Mission.vitals, closestPos, distMin, distMax) )
		if not vital then
			for j = 1, 20 do	
				local distMin = 50000 + i * 1000
				local distMax = 225000 + ( j * i * 1500 )
				vital = PvE_Func:RandomFromList( PvE_Func:GetInRange( PvE_Mission.vitals, closestPos, distMin, distMax) )
				
				if vital then 
					break 
				end
			end	
		end	
		
		if vital then 
		else
			vital = PvE_Func:RandomFromList( PvE_Mission.vitals )
		end
		PvE_Mission.aVitalsInGame[ i ] = {}
		PvE_Mission.aVitalsInGame[ i ].id = vital
		PvE_Mission.aVitalsInGame[ i ].pos = Entities[ vital ]:GetPos()
		PvE_Func:RemoveFromList( PvE_Mission.vitals, vital )
		closestPos = PvE_Mission.aVitalsInGame[ i ].pos
	end

	for j, vital in pairs( PvE_Mission.vitals ) do
		Entities[ vital ]:Remove()
	end
	
	for i, vitals in pairs( PvE_Mission.aVitalsInGame ) do
		Entities[ PvE_Mission.aVitalsInGame[ i ].id ]:FullActivate( false )
		local pos = Entities[ PvE_Mission.aVitalsInGame[ i ].id ]:GetPos()
		local obj = ai.Spawn( "PvE_Gen_StationShadow" )
		obj:SetPos( pos )
		PvE_Mission.aVitalsInGame[ i ].shadow = obj:GetId()
	end
	
	local RelationshipTable = SystemGetGlobalObject( "RelationshipTable" )
	if RelationshipTable then 
		RelationshipTable:SetRelationship( 0, 2, ai.RelatioshipType.ENEMY ) -- 1 c 2 враги.
		RelationshipTable:SetRelationship( 1, 2, ai.RelatioshipType.ENEMY ) -- 1 c 2 враги.
	end
	
	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
end

--вычисление наград игроков
function PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )

	local nEventReward = 0
	local cEvent, dEvent
	local nRes = 0
	local nPhaseComplete = 0
	for i, phase in pairs( PvE_Mission.aPhases ) do
		if phase.result == true then
			nPhaseComplete = nPhaseComplete + 1
		end
	end
	
	for cEvent, dEvent in pairs( eventContainer ) do
		if dEvent.reward then -- считаем только рандомные эвенты (по крайней мере у них награда явно должна быть, хотя как пропишем)
			if dEvent.isComplete then -- + пройденные эвенты
				nEventReward = nEventReward + dEvent.reward
			end
		end
	end
	
	local k = 1 -- + math.max( 0, math.min( PvE_Mission.nPvETimer - 60*6, 60*10 ) ) / 600
	k = k * 1.3 --#79539
	PvE_Common:slog( "================ k*100 = "..k*100 ) 
	
	
	nRes = math.min( 1, 1.3 * ( nPhaseComplete/#PvE_Mission.aPhases ) + nEventReward) -- #75581
	nRes = math.max( 0, nRes )	
	
	return nRes*k, nRes*k --, nRes*k	 лояльность более не используется
end

function PvE_Func:GetBaseLootAttempts( self, roundsFinished )
	
	if PvE_Mission.nCurPhase == #PvE_Mission.aPhases then
		return 3
	elseif PvE_Mission.nCurPhase > math.ceil( #PvE_Mission.aPhases / 2 ) then
		return 1
	else 
		return 0
	end
end

PvE_Missions.pve_desttown_waves_easy.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.pve_desttown_waves_easy.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end

PvE_Missions.pve_desttown_waves_hard.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.pve_desttown_waves_hard.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end

PvE_Func:PreparePrecache( PvE_Mission.aEvents, "pve_desttown_waves_easy" )