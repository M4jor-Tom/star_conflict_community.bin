lua_debug = false
time_ = 0
currentPos = nil

PvE_PlanetoidRaid = {}

circleTable = 
{
}

tMonsterPos =
{
	"MonsterPos1_1", "MonsterPos2_1", "MonsterPos3_1", "MonsterPos4_1",
}

Container_PvE_PlanetoidRaid = 
{
	aPhases = {  
		[ 1 ] = -- прилет риверов
			{ 
				sRoundType 	= "kill",
				bCountBar	= true,
				count 		= 0,
				wave		= 1,
				sTargetDef	= "Ship_Alien_Scout_PlanetoidRaid",
				DialogsOnStart = {	
					{ 1, "ellidium_girl", "raid_planetoid_p1" },
				},		
				nRoundPhase	= 1,	
				additionalFunc = {
					Func = function( self, curPhase )
						Entities[ "PortalJumpgate1" ]:FullActivate( false )
						Entities[ "PortalJumpgate3" ]:FullActivate( false )
						Entities[ "PortalJumpgate2" ]:FullActivate( true )
						Entities[ "PortalJumpgate4" ]:FullActivate( true )
					end
				},
			},
		[ 2 ] = -- прилет алиенов, последующее появление разрушителя и дредноута
			{ 
				sRoundType 	= "kill",
				bCountBar	= true,
				count 		= 0,
				wave		= 2,
				sTargetDef	= "Ship_Alien_Hunter_PlanetoidRaid",
				DialogsOnStart = {	
					{ 1, "ellidium_girl", "raid_planetoid_p2" },
				},		
				nRoundPhase	= 2,	
				additionalFunc = {
					Func = function( self, curPhase )
						Entities[ "PortalJumpgate2" ]:FullActivate( false )
						Entities[ "PortalJumpgate4" ]:FullActivate( false )
						PvE_Func:SpawnDestructor()					
						PvE_Func.DreadUpdate = PvE_Func.DreadIncoming
			
					end
				},
			},
		[ 3 ] = -- появление огромного монстра
			{
				sRoundType 	= "custom",
				DialogsOnStart = {	
					{ 1, "ellidium_girl", "raid_planetoid_p3" },
				},		
				timer		= 30,	
				dreadtimer	= 15,
				nRoundPhase	= 3,	
				additionalFunc = {
					Func = function( self, curPhase )
						Entities[ "Portal_Destroyer1" ]:FullActivate( false )
						Entities[ "Portal_Destroyer1" ]:Remove()
						if next( PvE_Mission.mainActiveTurrets ) then
							for i, turId in pairs( PvE_Mission.mainActiveTurrets ) do
								Entities[ turId ]:Stop()
							end	
						end							
						if Game_IsServer() then
							ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_SetBossId", Entities[ "Monster1" ]:GetDefName() )	--id
						else
							PvE_Common.UI.PveEvents:SetBossId( Entities[ "Monster1" ]:GetDefName() )	--id
						end	
					end
				},
			},
		[ 4 ] = 
			{
				sRoundType 	= "custom",
				timer		= 0.1,
				nRoundPhase	= 3,	
				additionalFunc = {
					Func = function( self, curPhase )
						PvE_Func:MonsterRelocate()
	
						Entities[ "Monster1" ]:SetTargetState( ai.Monster01State.DEFAULT )	
						
						local aMonster = GetEntitiesByDef( "Character_Monster" )
						
						local monster = Entities[ aMonster[ 1 ] ]
						aMonsterShields = {}
						
						for i = 1, 2 do 
							local sphere = ai.Spawn( "Character_MonsterSphere" )
							local shield = ai.Spawn( "Character_MonsterShield01" )
							local combinedShield = ai.Spawn( "Character_ShieldCombined"..i )
							local id = sphere:GetId()
							aMonsterShields[ id ] = {}
							aMonsterShields[ id ][ 1 ] = id
							aMonsterShields[ id ][ 2 ] = shield:GetId()
							aMonsterShields[ id ][ 3 ] = combinedShield:GetId()
							
							monster:AttachToBone( sphere, "cl_0"..i )
							monster:AttachToBone( shield, "cl_0"..i )
							if i == 1 then
								monster:AttachToBone( combinedShield, "cl_0"..i )
							else
								monster:AttachToBone( combinedShield, "cl_0"..i+1 )
							end				
						end		
					end
				},	
			},
		[ 5 ] = 
			{
				sRoundType 	= "custom",
				DialogsOnStart = {	
					{ 1, "irodr", "raid_planetoid_p5" },
				},						
				timer		= 16.4,
				nRoundPhase	= 5,	
				additionalFunc = {
					Func = function( self, curPhase )
						Entities[ PvE_Mission.holdMarkerId ]:FullActivate( true )
					end
				},		
			},
		[ 6 ] = 
			{
				sRoundType 	= "monster_attack",
				bCountBar	= false,
				need2recalculate = true,
				sTargetDef	= "PvE_Gen_Average_Turret2",
				DialogsOnStart = {	
					{ 1, "irodr", "raid_planetoid_p6" },
				},						
				timer		= 5,
				nRoundPhase	= 6,		
				spawnPoint	= "AlienMonsterSpawn1",		
				maxCount	= 7,
				curCount	= 0,
				spawnTimer  = 3,
				additionalFunc = {
					Func = function( self, curPhase )		
					end
				},					
			},
		[ 7 ] = 
			{
				sRoundType 	= "selector", 
				houk        = false,
				houkTimer  = 0,
				sTargetDef	= "PvE_Debrissite_Bomb",
				bombHolo	= "PvE_Debrissite_Bomb",
				character 	= "irodr", 
				text 		= "raid_planetoid_p7",
				tTrigger	= "BombBuilderTrigger",	
				selectResultId = nil,
				timer		= 30,
				nRoundPhase	= 7,	
				spawnPoint	= "AlienMonsterSpawn1",		
				maxCount	= 7,
				curCount	= 0,
				spawnTimer  = 2,
				wowTimer 	= 1,
				attackTimer = 5,
				attackDelay = 5,
				additionalFunc = {
					Func = function( self, curPhase )
						if PvE_Mission.aPhases[ 7 ].result == true then
							PvE_Func:TrippleShot()
						end
					end
				},	
			},
		[ 8 ] = 
			{
				sRoundType 	= "custom",
				nRoundPhase	= 7,
				DialogsOnStart = {	
					{ 1, "ellidium_girl", "raid_planetoid_p8" },
				},					
				timer		= 15,
				additionalFunc = {
					Func = function( self, curPhase )
						Entities[ "Monster1" ]:SetTargetState( ai.Monster01State.HIDDEN )
						if next( PvE_Mission.mainActiveTurrets ) then
							for i, turId in pairs( PvE_Mission.mainActiveTurrets ) do
								Entities[ turId ]:Stop()
							end	
						end	
					end
				},				
			},
		[ 9 ] = 
			{
				sRoundType 	= "custom",
				timer		= 11.1,
				nRoundPhase	= 9,	
				DialogsOnStart = {	
					{ 1, "irodr", "raid_planetoid_p9" },
				},								
				additionalFunc = {
					Func = function( self, curPhase )
						local monsterNetId = Entities[ "Monster1" ]:GetNetworkId()
						PvE_Func:MonsterRelocate()
						PvE_Func.DreadUpdate = PvE_Func.DreadMove
					end
				},	
			},
		[ 10 ] = 
			{
				sRoundType 	= "tongue",
				timer		= 0,
				time_		= 17,
				nRoundPhase	= 10,	
				DialogsOnStart = {	
					{ 1, "irodr", "raid_planetoid_p10" },
				},								
				additionalFunc = 
				{
					Func = function( self, curPhase )
							PvE_Mission.aPhases = sys.new( circleTable )
							PvE_Mission.nCurPhase = 3
						end
				},				
			},
		[ 11 ] = --заглушка
			{
				sRoundType 	= "custom",
				nRoundPhase	= 10,	
				timer		= 17,
				time_		= 17,
			},
		},	
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {
		[ 1 ] = 
		{ 
			MeatBots_t1 = { },
			MeatBots_t2 = { },				
			EliteBots	= { },
		},
	},
	buildConteiner = {
		[ 1 ] = "BombBuild1",
		[ 2 ] = "BombBuild2",
		[ 3 ] = "BombBuild3",
		[ 4 ] = "BombBuild4",
		[ 5 ] = "BombBuild5",
		[ 6 ] = "BombBuild6",
	},	
	
	eggs = 0,
	gunLight = {},
	
	eggsDialogs = {
		[ 0 ] = "raid_planetoid_0eggs",
		[ 1 ] = "raid_planetoid_1eggs",
		[ 2 ] = "raid_planetoid_2eggs",
		[ 3 ] = "raid_planetoid_3eggs",
		[ 4 ] = "raid_planetoid_4eggs",
		[ 5 ] = "raid_planetoid_5eggs",
		[ 6 ] = "raid_planetoid_6eggs",
	},
	
	mainTurretBreak = {
		[ 1 ] = "raid_planetoid_lost1mt",
		[ 2 ] = "raid_planetoid_lost2mt",
	},
}

PvE_Missions.pve_planetoidraid = 
{
	levelName = "s8256_pve_raid_planetoid",
	scenario_description = { "pve_raid_planetoid_str1", "pve_raid_planetoid_str2", "pve_raid_planetoid_str3" },
	need_spawn_warp = true,
	waves_ui_hide = true,
	max_loot_attempts_special = 3,
	event_loot_attempts = 3,
	
	--game_duration = 60 * 25,

	is_raid = true,
	disabled = false,
	desc = "",
	resurrection_attempts = 2,
	item_lvl = 24, -- параметр для начисления награды.
	rank  = 13,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	difficulty = "hard",
	
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	
	playlist = "RaidMusic_default",
	
	HudDialogs = 
	{
		{
			{ character = "mercenary", text = "PvE_Missionave_planet_war_phase_0", }, -- 0
		},
		{
			{ character = "ellidium_girl", text = "raid_planetoid_p1", }, -- 1
		},
		{
			{ character = "ellidium_girl", text = "raid_planetoid_p2", }, -- 2
		},
		{
			{ character = "ellidium_girl", text = "raid_planetoid_p3", }, -- 3
		},
		{
			{ character = "eventgirl", text = "raid_planetoid_p4", }, -- 4
		},
		{
			{ character = "pve_irodr", text = "raid_planetoid_p5", }, -- 5 -- goblin S
		},
		{
			{ character = "pve_irodr", text = "raid_planetoid_p6", }, -- 6 -- goblin C
		},
		{
			{ character = "pve_irodr", text = "raid_planetoid_p7", }, -- 7 -- goblin f
		},
		{
			{ character = "ellidium_girl", text = "raid_planetoid_p8", }, -- 8 
		},
		{
			{ character = "pve_irodr", text = "raid_planetoid_p9", }, -- 9 
		},			
		{
			{ character = "pve_irodr", text = "raid_planetoid_p10", }, -- 10
		},			

		
		
		{
			{ character = "pve_irodr", text = "raid_planetoid_0eggs", }, -- 11s
		},			
		{
			{ character = "pve_irodr", text = "raid_planetoid_1eggs", }, -- 12f
		},			
		{
			{ character = "pve_irodr", text = "raid_planetoid_2eggs", }, -- 13c
		},			
		
		
		
		
	--порядковые заглушки
		
		{
			{ character = "pve_irodr", text = "raid_planetoid_3eggs", }, -- 11s
		},			
		{
			{ character = "pve_irodr", text = "raid_planetoid_4eggs", }, -- 12f
		},			
		{
			{ character = "pve_irodr", text = "raid_planetoid_5eggs", }, -- 13c
		},
		{
			{ character = "pve_irodr", text = "raid_planetoid_lost1mt", }, -- 11s
		},			
		{
			{ character = "pve_irodr", text = "raid_planetoid_lost2mt", }, -- 12f
		},			
		{
			{ character = "pve_irodr", text = "raid_planetoid_lost2mt", }, -- 13c
		},	
		{
			{ character = "pve_irodr", text = "pve_gen_empfrontier_mt_gen_destroy2", }, -- 11s
		},			
		{
			{ character = "jericho_officer", text = "pve_gen_empfrontier_mt_destroy2", }, -- 12f
		},			
		{
			{ character = "jericho_officer", text = "pve_wave_planet_war_phase_22", }, -- 13c
		},
		{
			{ character = "general_soldier", text = "pve_gen_empfrontier_barque2", }, -- 11s
		},			
		{
			{ character = "jericho_officer", text = "pve_gen_empfrontier_survive2", }, -- 12f
		},			
		{
			{ character = "jericho_officer", text = "pve_gen_empfrontier_vitals2", }, -- 13c
		},			
		
		
		-- дополнительные эвенты
		-- сбор самоуничтожающихся контейнеров
		
		{
			{ character = "pve_briggs", text = "pve_gen_desttown_event_goblin_start", }, -- 14s
		},			
		{
			{ character = "pve_briggs", text = "pve_gen_desttown_event_goblin_fail", }, -- 15f
		},			
		{
			{ character = "pve_briggs", text = "pve_gen_desttown_event_goblin_complit", }, -- 16c
		},	
		
		--эвент уничтожение маяка (глушилки)
		{
			{ character = "sch_jackson", text = "pve_gen_desttown_event_kill_start", }, -- 14s
		},			
		{
			{ character = "sch_jackson", text = "pve_gen_desttown_event_kill_fail", }, -- 15f
		},			
		{
			{ character = "sch_jackson", text = "pve_gen_desttown_event_kill_complit", }, -- 16c
		},	
		
		--эвент уничтожение вражеского босса (аддишионал)
		{
			{ character = "broker", text = "pve_gen_desttown_event_beacon_start", }, -- 14s
		},			
		{
			{ character = "broker", text = "pve_gen_desttown_event_beacon_fail", }, -- 15f
		},			
		{
			{ character = "broker", text = "pve_gen_desttown_event_beacon_complit", }, -- 16c
		},
		
		--эвент на кристаллидов (2 мини босса - они бьют всех)
		{
			{ character = "pve_lang", text = "pve_gen_desttown_event_hero_start", }, -- 14s
		},			
		{
			{ character = "pve_lang", text = "pve_gen_desttown_event_hero_fail", }, -- 15f
		},			
		{
			{ character = "pve_lang", text = "pve_gen_desttown_event_hero_complit", }, -- 16c
		},
		
		--эвент на уничтожение отряда сбежавших иерихонцев
		{
			{ character = "pve_lang", text = "pve_gen_desttown_event_supressor_start", }, -- 14s
		},			
		{
			{ character = "pve_lang", text = "pve_gen_desttown_event_supressor_fail", }, -- 15f
		},			
		{
			{ character = "pve_lang", text = "pve_gen_desttown_event_supressor_complit", }, -- 16c
		},
		
		--эвент на уничтожение отряда алиенов (бьют всех)
		{
			{ character = "umc_dispatch", text = "pve_gen_desttown_event_bombs_start", }, -- 14s
		},			
		{
			{ character = "umc_dispatch", text = "pve_gen_desttown_event_bombs_fail", }, -- 15f
		},			
		{
			{ character = "umc_dispatch", text = "pve_gen_desttown_event_bombs_complit", }, -- 16c
		},
		
		--эвакуация тела с поля боя
		{
			{ character = "emp_captain", text = "pve_gen_empfrontier_mines2", }, -- 14s
		},			
		{
			{ character = "emp_captain", text = "pve_gen_empfrontier_barque3", }, -- 15f
		},			
		{
			{ character = "emp_captain", text = "pve_gen_empfrontier_survive3", }, -- 16c
		},
		
		--союзный эсминец
		{
			{ character = "pve_lang", text = "pve_wave_planet_war_phase_47", }, -- 14s
		},			
		{
			{ character = "pve_lang", text = "pve_wave_planet_war_phase_48", }, -- 15f
		},			
		{
			{ character = "pve_lang", text = "pve_wave_planet_war_phase_49", }, -- 16c
		},
	},		
	
	turret_health_coef = 1.0,
	turret_damage_coef = 1.0,	
	
	-- дополняются скриптом!!!
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
			name = "Transport_Alien",
			--boss = true,
	 		relationship_group = ai.RelationshipGroups.Alien,
			spawn_spot = "escort_spawn_spot1",
			route = "alien_cruiser_path1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			--spawn_ignore_collision = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1500,
			respawn_time = 12000,			
			cargoship = "PvE_Gen_Raid_Cruiser", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			--despawn_portal = "cruiser_portal_out",
			
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
			precache_defs = {
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"BtB_Bomb",
				"PvE_Gen_Raid_Cruiser",
				"Turret_MonsterGun",
				"Static_MonsterEgg",
				"Character_MonsterSphere",
				"Character_MonsterShield01",
				"Character_ShieldCombined",
				"TurretPlasma_Monster",
				"TurretPlasma_Monster",
				"Character_GunBacklight",
				"Character_HoldBacklight",			
				"Ship_Alien_Predator_PlanetoidRaid",
				"Character_ShieldCombined1",
				"Character_MonsterSphere",
				"Character_ShieldCombined2",
				"LootCrate_Gen_Raid_AnimMines",
				"LootCrate_Gen_Raid_Mine",
				"LootCrate_Gen_Raid_AttachedMine",
			},
			exp_reward_portion = 3,
			cred_reward_portion = 8,
			loot_attempts_reward = 4,
			player_spawn_group = 1,
			loot_tables = { { "PVE_T1_PassiveSet" }, { "PVE_T2_ActiveSet" }, { "PVE_T3_Raid_TokenSet" }, { "PVE_T4_Raid_TokenSet" }, { "PVE_T5_Raid_TokenSet" } },
			win_loot_tables = { { "resource_zeta_add_1" }, { "resource_zeta_add_1" }, { "resource_zeta_add_1" }, { "resource_zeta_add_1" },{ "resource_zeta_add_1" } },

			uiRoundDesc = "wave_nalnifan_gate_lumen_r1_rdesc", 
			start_sentence = "CMDR_GEN_PVE_RAID_DEFENSE_START_ROUND",

			modifiers =
			{
			--	{ spell = "RamCharge_Self_PvE",	caster_group = 1, },
			},
			
			start_event = 
			{
			},
			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 14,
					{	def = "Ship_Alien_Scout_PlanetoidRaid", count = 1, spawn_group = 4, spawn_warp = true, delay = 0, },
					{	def = "Ship_Alien_Scout_PlanetoidRaid", count = 1, spawn_group = 2, spawn_warp = true, delay = 3, },
					{	def = "Ship_Alien_Scout_PlanetoidRaid", count = 1, spawn_group = 4, spawn_warp = true, delay = 7, },
					{	def = "Ship_Alien_Scout_PlanetoidRaid", count = 1, spawn_group = 4, spawn_warp = true, delay = 10, },
					{	def = "Ship_Alien_Scout_PlanetoidRaid", count = 1, spawn_group = 2, spawn_warp = true, delay = 12, },
					{	def = "Ship_Alien_Scout_PlanetoidRaid", count = 1, spawn_group = 2, spawn_warp = true, delay = 14, },
					{	def = "Ship_Alien_Scout_PlanetoidRaid", count = 1, spawn_group = 4, spawn_warp = true, delay = 17, },
				},
				[ 2 ] =
				{
					max_agents_at_same_time = 14,
					{	def = "Ship_Alien_Hunter_PlanetoidRaid", count = 1, spawn_group = 1, spawn_warp = true, delay = 0, },
					{	def = "Ship_Alien_Hunter_PlanetoidRaid", count = 1, spawn_group = 3, spawn_warp = true, delay = 3, },
					{	def = "Ship_Alien_Hunter_PlanetoidRaid", count = 1, spawn_group = 3, spawn_warp = true, delay = 5, },
					{	def = "Ship_Alien_Hunter_PlanetoidRaid", count = 1, spawn_group = 1, spawn_warp = true, delay = 8, },
					{	def = "Ship_Alien_Hunter_PlanetoidRaid", count = 1, spawn_group = 1, spawn_warp = true, delay = 11, },
					{	def = "Ship_Alien_Hunter_PlanetoidRaid", count = 1, spawn_group = 3, spawn_warp = true, delay = 14, },
				},
				[ 3 ] =
				{
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

PvE_Missions.pve_planetoidraid.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )

	if dreadInitTimer then
		dreadInitTimer = dreadInitTimer - dt
		if dreadInitTimer <= 0 then
			local mainTur = GetEntitiesByDef( "Raid_Dreadnought_AllidiumMainTurret" )
			for i, main in ipairs( mainTur ) do
			--	Entities[ main ]:FullActivate( false )
			end			
			dreadInitTimer = nil
		end
	end	
	
	if next( PvE_Mission.aMinions ) then	
		for n, mobId in pairs( PvE_Mission.aMinions ) do
			local mob = AID:GetBot( mobId )
			if mob.isDead == true then
				local mine = ai.Spawn( "LootCrate_Gen_Raid_Mine" )
				if mob.pos then
					mine:SetPos( mob.pos )
				end	
				table.insert( aDreadMines, mine:GetId() )
				PvE_Func:RemoveFromList( PvE_Mission.aMinions, mobId )
			end
		end 
	end	
	
	local eggs_loaded = false
	
	if PvE_Mission.eggs < 6 and next( PvE_Mission.aSapperPlayers ) then
		for k, player in pairs( PvE_Mission.aSapperPlayers ) do
			if Entities[ player[ 1 ] ] and not Entities[ player[ 1 ] ]:IsDead() then
				local markerPos = Entities[ PvE_Mission.holdMarkerId ]:GetPos() 
				local playerPos = Entities[ player[ 1 ] ]:GetPos() 
				local sl = SquareLen( markerPos, playerPos )
				if sl < 200 and PvE_Mission.lastEggId ~= player[ 3 ] then
					if PvE_Mission.eggs < 6 then
						PvE_Mission.eggs = PvE_Mission.eggs + 1
					end
					local mine = ai.GetNetworkEntity( player[ 3 ] )
					PvE_Func:RemoveFromList( aDreadMines, mine:GetId() )
					PvE_Mission.lastEggId = player[ 3 ]
					PvE_Func:RemoveBomb( player[ 1 ] )
					PvE_Mission.aSapperPlayers[ k ] = nil
					eggs_loaded = true
				end
			elseif not Entities[ player[ 1 ] ] or Entities[ player[ 1 ] ]:IsDead() then
				PvE_Mission.aSapperPlayers[ k ] = nil
			end
		end

		if eggs_loaded then
			local text_id = PvE_Mission.eggsDialogs[ PvE_Mission.eggs ]
			local nTimer = 1
			if next( DialogsUpdate ) then 
				nTimer = DialogsUpdate[ #DialogsUpdate ][ 5 ]
				if not nTimer then
					sys.log( string.format("Error in dialog: text_id %s, nTimer %s", text_id, nTimer ) )
				end
			end
			dialogToInsert = { nTimer, "irodr", text_id, }
			table.insert( DialogsUpdate, dialogToInsert )
			eggs_loaded = false
		end

		if PvE_Mission.eggs >= 6 then
			Entities[ PvE_Mission.holdMarkerId ]:FullActivate( false )
			
			for u, p in pairs( PvE_Mission.aSapperPlayers ) do
				local bombNetId = PvE_Mission.aSapperPlayers[ p[ 1 ] ][ 3 ]
				local bomb = ai.GetNetworkEntity( bombNetId )
				if bomb and bomb:GetParent() == Entities[ PvE_Mission.aSapperPlayers[ p[ 1 ] ][ 1 ] ] then
					Entities[ p[ 1 ] ]:RemoveChild( bomb )							
				end	
				PvE_Mission.aSapperPlayers[ u ] = nil
			end
			PvE_Mission.readyToExplodeMines = sys.new( aDreadMines )
			
			for i, mine in pairs( aDreadMines ) do
				PvE_Mission.readyToExplodeMines[ i ] = {}
				PvE_Mission.readyToExplodeMines[ i ][ 1 ] = sys.new( mine )
				PvE_Mission.readyToExplodeMines[ i ][ 2 ] = 10
				SV_SetHudMarkTimer( Entities[ mine ]:GetNetworkId(), PvE_Mission.readyToExplodeMines[ i ][ 2 ] )
			end
			PvE_Mission.aMinions = {}
			aDreadMines = {}
		end

	end

	if next( PvE_Mission.readyToExplodeMines ) then
		for i, mine in pairs( PvE_Mission.readyToExplodeMines ) do
			PvE_Mission.readyToExplodeMines[ i ][ 2 ] = PvE_Mission.readyToExplodeMines[ i ][ 2 ] - dt
			if PvE_Mission.readyToExplodeMines[ i ][ 2 ] < 0 then
				local obj = Entities[ PvE_Mission.readyToExplodeMines[ i ][ 1 ] ]
				if obj then
					SV_GP_CastSpell( "RaidMineExplode", obj:GetId(), obj:GetId(), obj, obj:GetPos() )
					obj:Remove()			
				else
					sys.out( "id_not_found_"..PvE_Mission.readyToExplodeMines[ i ][ 1 ] )
					PvE_Mission.readyToExplodeMines[ i ] = nil				
				end
			end
		end
	end
	
	if next( PvE_Mission.mainActiveTurrets ) then
		for i, turId in pairs( PvE_Mission.mainActiveTurrets ) do
			local tur = Entities[ turId ]
			local hp = tur:GetHealth() / tur:GetMaxHealth()
			if hp < 0.3 then
				PvE_Func:RemoveFromList( PvE_Mission.mainActiveTurrets, turId )
				tur:Stop()
				tur:SetDamageable( false )
				tur:ShowInHud( false )
				
				local text_id = PvE_Mission.mainTurretBreak[ 3 - #PvE_Mission.mainActiveTurrets ]
				if text_id then
					local nTimer = 1
					if next( DialogsUpdate ) then 
						nTimer = DialogsUpdate[ #DialogsUpdate ][ 5 ]
					end
					dialogToInsert = { nTimer, "irodr", text_id, }
					table.insert( DialogsUpdate, dialogToInsert )
				end	
				local smoke = ai.Spawn( "Smoke_MainTurret" )
				tur:AttachToBone( smoke, "root" )
			end
		end
	else
		return 2, ai.WinReason.PVE_MISSION_COMPLETE	
	end
	
	if monsterHealth <= 0 then
		if PvE_Mission.nCurPhase >= 9 then
			PvE_PlanetoidRaid.Finished = true
			return 1, ai.WinReason.PVE_MISSION_COMPLETE	
		end
	end
	
	if next( aMonsterShields ) then
		for i, sphere in pairs( aMonsterShields ) do
			if Entities[ sphere[ 1 ] ] then
			else
				Entities[ sphere[ 2 ] ]:Remove()
				local name = Entities[ sphere[ 3 ] ]:GetName()
				sys.concmd( "e_event "..name.." EmitDeathEffectAndRemove" )
				aMonsterShields[ i ] = nil
			end
		end	
	end
		
	PvE_Func:DreadUpdate( dt )
	
	PvE_Func:Damage2Monster()
	
	PvE_PlanetoidRaid.raidBuffer:Update( dt )
	
	return PvE_Func:OnUpdate( dt )
end
	
function PvE_PlanetoidRaid:OnStart()

	dreadInitTimer = 0.3
	aMonsterShields = {}
	aDreadMines = {}
	PvE_Mission.aSapperPlayers = {}
	PvE_Mission.aMinions = {}
	objArray = {}
	carryDamage = 0
	rightClaw = 0
	leftClaw = 0
	PvE_Mission.lastEggId = -1
	PvE_Mission.eggTriggerId = Entities[ "EggsTrigger1" ]:GetId()
	PvE_Mission.readyToExplodeMines = {}

	transportMoveSent = false
	transportStopSent = false
	
	PvE_Mission.EngineNameEffects = {
	}
	
	Entities[ "Dread1" ]:AttachToBone( Entities[ PvE_Mission.eggTriggerId ], "zona" )
	
	PvE_Mission.mainActiveTurrets = {}
	
	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 600
	
	Entities[ "PortalJumpgate2" ]:FullActivate( false )
	Entities[ "PortalJumpgate4" ]:FullActivate( false )
	
	Entities[ "Dread1" ]:FullActivate( false )
	
	local mainTur = GetEntitiesByDef( "Raid_Dreadnought_AllidiumMainTurret" )
	for i, main in ipairs( mainTur ) do
		Entities[ main ]:Stop()
		Entities[ main ]:FullActivate( false )
	end
	
	PvE_Mission.mainActiveTurrets = mainTur
	
	local Tur = GetEntitiesByDef( "PvE_Gen_Average_Turret2" )
	for i, main in ipairs( Tur ) do
		Entities[ main ]:FullActivate( false )
	end
	
	Entities[ "Portal_Destroyer1" ]:FullActivate( false )
	
	local mineTriggers = {}
	local mineTrigger
	for i = 1, 6 do
		mineTrigger = GetObjectByName( "BombBuilderTrigger"..i )
		mineTriggers[ i ] = {} 
		mineTriggers[ i ][ 1 ] = mineTrigger:GetId()
		mineTriggers[ i ][ 2 ] = Entities[ PvE_Mission.buildConteiner[ i ] ]:GetId()
		mineTriggers[ i ][ 3 ] = Entities[ "Bomb"..i ]:GetId()
	end	
	
	PvE_Mission.selectorTriggers = mineTriggers
	
	if next( mineTriggers ) then
		for i, tId in ipairs( mineTriggers ) do
			Entities[ tId[ 1 ] ]:Deactivate()
			Entities[ "Bomb"..i ]:FullActivate( false )
		end
	end			
	
	local mines = GetEntitiesByDef( "PvE_Debrissite_Bomb" )
	if next( mines ) then
		for i, mine in ipairs( mines ) do
			Entities[ mine ]:FullActivate( false )
		end
	end		
	
	
	local aMonster = GetEntitiesByDef( "Character_Monster" )
	
	local monster = Entities[ aMonster[ 1 ] ]	
	
	local point1 = Entities[ "Aim_Point1" ]
	local point2 = Entities[ "Aim_Point2" ]
	local point3 = Entities[ "Aim_Point3" ]
	local point4 = Entities[ "AlienMonsterSpawn1" ]
	
	monster:AttachToBone( point1, "right_attack" )
	monster:AttachToBone( point2, "center_attack" )
	monster:AttachToBone( point3, "right_attack1" )
	monster:AttachToBone( point4, "mobs_spawn" )
	
	monster:AttachToBone( Entities[ "Claw1" ], "r_hand" )
	monster:AttachToBone( Entities[ "Claw2" ], "l_hand" )
	
	local holdMarker = ai.Spawn( "Character_HoldBacklight" )
	Entities[ "Dread1" ]:AttachToBone( holdMarker, "zona" )

	if Game_IsServer() then
		ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_EffectStop" )	--id
	else
		CL_EffectStop( )	--id
	end	
	
	PvE_Mission.holdMarkerId = holdMarker:GetId()
	holdMarker:FullActivate( false )
	
	local aCucumberAura = GetEntitiesByDef( "CucumberAura" )
	
	local cucumberAura = Entities[ aCucumberAura[ 1 ] ]
	
	SV_GP_CastSpell( "CucumberSpell", cucumberAura:GetId(), cucumberAura:GetId(), cucumberAura, cucumberAura:GetPos() )

	PvE_PlanetoidRaid.raidBuffer = BuffByAgro( {

		buffs =
		{
			"Raid_dynamic_AllBodyResist",
			"Raid_dynamic_AllDamageMod",
		},
		
		buff_level_max = 25, -- Максимальный уровень баффов
		check_period = 2, -- Каждые check_period с. проверяем, есть ли убитые раньше времени
		increase_coef = 2.5, -- Если да, то текущий уровень увеличивается на (increase_coef * количество целей) вплоть до buff_level_max
		increase_coef_mul_max = 3, -- Ограничитель количества целей increase_coef
		decrease_coef = 0.12, -- Если нет, то текущий уровень уменьшается на decrease_coef вплоть до 0
		
	})
end

PvE_Missions.pve_planetoidraid.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
	
	local expCoef, credCoef
	local levelCoef = PvE_PlanetoidRaid.raidBuffer.buff_level / PvE_PlanetoidRaid.raidBuffer.buff_level_max
	sys.log( "================PvE_RW:SV_GetFinishRewardCoefs(self) mainActiveTurrets = %d, levelCoef = %d", #PvE_Mission.mainActiveTurrets, levelCoef )
	
	-- 70% от максимума в 4 порции при 0 аванпостов
	local dolmin = 0.7
	local bestReward = 1	-- тут не доли, а кф
	if PvE_PlanetoidRaid.Finished == true then
		expCoef = bestReward * (dolmin + (1-dolmin)*#PvE_Mission.mainActiveTurrets)
	else
		expCoef = 0.1
	end
	
	-- 40% от максимума в 4 порции при 0 аванпостов
	dolmin = 0.4
	bestReward = 1
	if PvE_PlanetoidRaid.Finished == true then
		credCoef = bestReward * (dolmin + (1-dolmin)*#PvE_Mission.mainActiveTurrets)
	else
		credCoef = 0.1
	end
	
	expCoef = expCoef * (1 + levelCoef)
	credCoef = credCoef * (1 + levelCoef)

	return expCoef, credCoef
	
end

PvE_Missions.pve_planetoidraid.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )

	if PvE_PlanetoidRaid.Finished then
		return 4
	else 
		return 1
	end
	
end

function PvE_Func:AimPoints( pack )
	for i, v in pairs( GetEntitiesByDef( "ClanShip_AimPointShield" ) ) do
		local resPos = Entities[ pack[ i ] ]:GetPos()
		Entities[ v ]:SetPos( resPos )
	end
end

function PvE_Func:DreadUpdate( dt )
end	

function PvE_Func:MonsterRelocate( point )
	
	local tNewPos = sys.new( tMonsterPos )
	
	if currentPos then
		PvE_Func:RemoveFromList( tNewPos, currentPos )
		currentPos = PvE_Func:RandomFromList( tNewPos )
	else
		currentPos = "MonsterPos1_1"
	end
	
	local resPos = Entities[ currentPos ]:GetPos()
	local dreadPos = Entities[ "Dread1" ]:GetPos()
	Entities[ "Monster1" ]:SetPosDir( resPos, Vec3( dreadPos.x - resPos.x, resPos.y - resPos.y, dreadPos.z - resPos.z ):GetNormalized() )
	return true
end

function PvE_Func:TrippleShot()
	if next( PvE_Mission.mainActiveTurrets ) then
		for i, turId in pairs( PvE_Mission.mainActiveTurrets ) do
			Entities[ turId ]:Start()
		end	
	end	
	
	local damageCoef = 1
	
	if PvE_Mission.eggs >= 6 then
		damageCoef = 2
		PvE_Mission.eggs = 0
		Entities[ PvE_Mission.holdMarkerId ]:FullActivate( true )
	end
	
	local targetId = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].selectResultId
	local name = Entities[ targetId ]:GetName() 
	if name == "BombBuilderTrigger1" or name == "BombBuilderTrigger4" then
		local pack = { "Aim_Point1", "Aim_Point1", "Aim_Point1" }
		PvE_Func:AimPoints( pack )
		
		if leftClaw then 
			leftClaw = leftClaw + damageCoef
		end	
	elseif name == "BombBuilderTrigger2" or name == "BombBuilderTrigger5" then
		local pack = { "Aim_Point2", "Aim_Point2", "Aim_Point2" }
		PvE_Func:AimPoints( pack )
	elseif name == "BombBuilderTrigger3" or name == "BombBuilderTrigger6" then
		local pack = { "Aim_Point3", "Aim_Point3", "Aim_Point3" }
		PvE_Func:AimPoints( pack )
		
		if rightClaw then
			rightClaw = rightClaw + damageCoef
		end	
	end
	carryDamage = damageCoef
	
end

function PvE_Func:Damage2Monster()

	if carryDamage > 0 then
		local turrets = 0
		for i, turId in pairs( PvE_Mission.mainActiveTurrets ) do
			if Entities[ turId ]:IsStopped() == true then
				turrets = turrets + 1
			end
		end
		if turrets == #PvE_Mission.mainActiveTurrets then
			monsterHealth = monsterHealth - carryDamage
			carryDamage = 0
			Entities[ "Monster1" ]:SetHealth( monsterHealth )
			if leftClaw and leftClaw >= 2 then
				sys.concmd( "e_event Claw1 EmitDeathEffectAndRemove" )
				leftClaw = nil
				local id = Entities[ "BombBuilderTrigger1" ]:GetId()
				PvE_Func:FindAndRemoveInArray( PvE_Mission.selectorTriggers, id, 1 )
				
				local id = Entities[ "BombBuilderTrigger4" ]:GetId()
				PvE_Func:FindAndRemoveInArray( PvE_Mission.selectorTriggers, id, 1 )
			end	
			if rightClaw and rightClaw >= 2 then
				sys.concmd( "e_event Claw2 EmitDeathEffectAndRemove" )
				rightClaw = nil
				local id = Entities[ "BombBuilderTrigger3" ]:GetId()
				PvE_Func:FindAndRemoveInArray( PvE_Mission.selectorTriggers, id, 1 )
				
				local id = Entities[ "BombBuilderTrigger6" ]:GetId()
				PvE_Func:FindAndRemoveInArray( PvE_Mission.selectorTriggers, id, 1 )
			end				
		end		
	end	
end

function PvE_Func:FindAndRemoveInArray( array, objectId, index )

	for i, value in pairs( array ) do
		if value[ 1 ] == objectId then
			table.remove( array, 1 )
		end
	end
end

function PvE_Func:DreadIncoming( dt )
	
	local dread = Entities[ "Dread1" ]
	
	if dread:IsHidden() == false then
		local startPos = dread:GetPos()
		local finishPos = Entities[ "TagPoint3" ]:GetPos()
		local resSpeed = #( 1.5*( startPos - finishPos ) )	
		dread:SetTargetSpeed( resSpeed )
	end
	
	if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer then
		PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer = PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer - dt
		if PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer < 13 and PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer > 5 then
			if dread:IsHidden() == true then
				objArray = {}
				dread:FullActivate( true )
				dread:SetPathByName( "PathObject1" )	
				local mainTur = GetEntitiesByDef( "Raid_Dreadnought_AllidiumMainTurret" )
				for i, main in ipairs( mainTur ) do
					Entities[ main ]:FullActivate( true )
					if i == 3 then
						Entities[ "Dread1" ]:AttachToBone( Entities[ main ], "big_gun_3" )
					else	
						Entities[ "Dread1" ]:AttachToBone( Entities[ main ], "big_gun_0"..i )
					end			


					local defs = { "Effects_Dreadnought_EngineBlueSmall", "Effects_Dreadnought_EngineBlueMid", "Effects_Dreadnought_EngineBlueBig" }
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_FindEffects", defs )	--id
					else
						CL_FindEffects( defs )	--id
					end	
					
					if Game_IsServer() then
						ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_EffectStart", PvE_Mission.EngineNameEffects )	--id
					else
						CL_EffectStop( PvE_Mission.EngineNameEffects )	--id
					end	
				end
				local k = 1
				for i = 1, 2 do
					for j, turId in ipairs( PvE_Mission.mainActiveTurrets ) do
						local tur = Entities[ turId ]
						local trig = Entities[ "BombBuilderTrigger"..k ]
						tur:AttachToBone( trig, "Selector_1" )
						local bomb = Entities[ "Bomb"..k ]
						tur:AttachToBone( bomb, "Selector_1" )
						local bombBuild = Entities[ "BombBuild"..k ]
						tur:AttachToBone( bombBuild, "Selector_1" )
						k = k + 1
					end
				end		


				local l = 1
				for i = 1, 2 do
					for i = 1, 3 do
						local light = ai.Spawn( "Character_GunBacklight" )
						PvE_Mission.gunLight[ l ] = light:GetId()
						if i == 3 then
							Entities[ "Dread1" ]:AttachToBone( light, "big_gun_3" )
						else	
							Entities[ "Dread1" ]:AttachToBone( light, "big_gun_0"..i )
						end	
						l = l + 1
					end
				end

				for i, gunId in ipairs( PvE_Mission.gunLight ) do
					Entities[ gunId ]:FullActivate( false )
				end		
	
				local mineTriggers = PvE_Mission.selectorTriggers

				if next( mineTriggers[ 1 ] ) then
					for i, trig in ipairs( mineTriggers ) do
						Entities[ trig[ 1 ] ]:Deactivate()
					end
				end
		
				dreadInitTimer = 0.3
				
			end	
		elseif PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer < 5 then
			local mainTur = GetEntitiesByDef( "Raid_Dreadnought_AllidiumMainTurret" )
			for i, main in ipairs( mainTur ) do
				Entities[ main ]:Start()
				local Tur = GetEntitiesByDef( "PvE_Gen_Average_Turret2" )
				for i, main in ipairs( Tur ) do
					Entities[ main ]:FullActivate( true )
				end
			end
			dread:SetTargetSpeed( 0 )
			Entities[ "Dread1" ]:SetPathByName( "PathObject2", true )
			PvE_Mission.aPhases[ PvE_Mission.nCurPhase ].dreadtimer = nil				
			if Game_IsServer() then
				ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_EffectStop", PvE_Mission.EngineNameEffects )	--id
			else
				CL_EffectStop( PvE_Mission.EngineNameEffects )	--id
			end	
		end	
	else			
		return true
	end	
end

function PvE_Func:SpawnDestructor()

	SV_Pve_AISquadSpawn( "Transport_Alien" )

	local transport = GetEntitiesByDef( "PvE_Gen_Raid_Cruiser" )
	
	Entities[ transport[ 1 ] ]:SetTargetSpeed( 1 )
	
	Entities[ "Portal_Destroyer1" ]:FullActivate( true )
	
	local pos = Entities[ "DestructorSpawn" ]:GetPos()
	local rot = Entities[ "Portal_Destroyer1" ]:GetRot()
	for i, v in pairs( GetEntitiesByDef( "ClanShip_AimPointShield" ) ) do
		Entities[ v ]:SetPos( pos )
	end
end

function PvE_Func:DreadMove( dt )
	local dread = Entities[ "Dread1" ]
	local dreadPos = dread:GetPos()
	local monsterPos = Entities[ "Monster1" ]:GetPos()
	monsterPos = Vec3( monsterPos.x, dreadPos.y, monsterPos.z )
	if #( dreadPos - monsterPos ) < 2675 then
		dread:SetTargetSpeed( 0 )		
		if transportStopSent == false then
			if Game_IsServer() then
				ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_EffectStop", PvE_Mission.EngineNameEffects )	--id
			else
				CL_EffectStop( PvE_Mission.EngineNameEffects )	--id
			end	
			transportMoveSent = false
			transportStopSent = true
		end	
	else
		dread:SetTargetSpeed( 60 )	
		if transportMoveSent == false then
			if Game_IsServer() then
				ServerLuaRpcEx( ai.MAX_PLAYERS, "CL_EffectStart", PvE_Mission.EngineNameEffects )	--id
			else
				CL_EffectStop( PvE_Mission.EngineNameEffects )	--id
			end	
			transportStopSent = false
			transportMoveSent = true
		end	
	end
end

function PvE_PlanetoidRaid:GetSpecialLootAttempts(self)
	sys.log( "================PvE_PlanetoidRaid:GetSpecialLootAttempts(self)" )
	if PvE_PlanetoidRaid.Finished then
		sys.log( "================ 0 " )
		return 3
	else
		sys.log( "================ 3 " )
		return 0
	end
end

PvE_Missions.pve_planetoidraid.rounds[1].SV_GetSpecialLootAttempts = function( self, roundsFinished )
    return PvE_PlanetoidRaid:GetSpecialLootAttempts( self, 5 )
end

function CL_EffectStop( )
		
	for i, name in ipairs( PvE_Mission.EngineNameEffects ) do
		Entities[ name ]:Stop()
	end
end

function CL_EffectStart( )
		
	for i, name in ipairs( PvE_Mission.EngineNameEffects ) do
		Entities[ name ]:Start()
	end
end

function CL_FindEffects( array )
	PvE_Mission.EngineNameEffects = {}
	for i, name in ipairs( array ) do
		local ids = GetEntitiesByDef( name )
		for j, id in ipairs( ids ) do
			table.insert( PvE_Mission.EngineNameEffects, id )
		end	
	end
end