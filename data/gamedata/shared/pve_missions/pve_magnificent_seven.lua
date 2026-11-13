--
PvE_MS = {}

PvE_MS_Container = 
{
	aPhases = {  		
		[ 1 ] = 
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				--bRandomBoss = true,
				DialogsOnStart = {	
				{ 1, "Jer_Voice", "pve_magnificent_seven_deactivate_generators"},
				{ 10, "fed_captain", "pve_magnificent_seven_deactivate_generators2"},
						},
				specificDef	= "VitalPoint_PVE_bigship_building_2", --нужно будет вписать сюда специальный деф мин, на базе маяка.
				count		= 4,
				nRoundPhase	= 1,	
				additionalFunc = { 
					Func = function( self, curPhase )
						local pos = Vec3(1058, -321, -365)
						local dir = Vec3(-0.2877, -0.5548, 0.7806)
						designers:AddBot( "Ship_MagSev_pilot_1", pos, 1, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir)
						end,	
				},
			},
		[ 2 ] = --заглушка
			{
				playlist = "RaidMusic_special",
				important_playlist = true,
				sRoundType 	= "defense",
						bCountBar	= true,
						--bRandomBoss = true,
						sTargetDef	= "PvE_EnergyGeneratorBig_magsev",
						nWoWMsgTimer= 30, 
						nRoundPhase	= 2,	
						DialogsOnStart = {	
							{ 1, "Jer_Voice", "pve_magnificent_seven_defense"},
							{ 10, "fed_captain", "pve_magnificent_seven_defense2"},
							{ 20, "philip_k_dry", "pve_magnificent_seven_defense3"},
						},
						timer		= 120,		
				
				additionalFunc = { 
					Func = function( self, curPhase )
						Entities[ "SignalBlocker1" ]:ShowInHud( true )
						Entities[ "SignalBlocker2" ]:ShowInHud( true )
						Entities[ "SignalBlocker1" ]:FullActivate( true )
						Entities[ "SignalBlocker2" ]:FullActivate( true )	
						end,
				},
			},
		[ 3 ] = 
			{ 
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				DialogsOnStart = {	
					{ 1, "fed_captain", "pve_magnificent_seven_break" },
				},
				sTargetDef	= { "PvE_Gen_SignalBlocker", }, -- целевой деф для уничтожения
				tCount		= 2,
				nRoundPhase	= 3,
				nWoWMsgTimer= 30,  
				aDropTable	= {
									count	= 10, -- сколько объектов надо дропнуть
									dropDef	= "LootCrate_Gen_PvE_Mines", -- что надо дропнуть
								},	
				additionalFunc = { 
					Func = function( self, curPhase )
						local pos = Vec3(1058, -321, -365)
						local dir = Vec3(-0.2877, -0.5548, 0.7806)
						designers:AddBot( "Ship_MagSev_pilot_2", pos, 1, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir)
						if PvE_Mission.aPhases[ PvE_Mission.nCurPhase + 1 ].sRoundType == "mines" then
							local loot, p, pos, j
							pos = Entities[ "MinesSpawner1" ]:GetPos()
							j = curPhase.aDropTable.count
							for i = 1, j do
								loot = ai.Spawn( curPhase.aDropTable.dropDef )
								p = pos
								p.x = p.x + math.random( 30 ) - 15
								p.y = p.y + math.random( 10 )
								p.z = p.z + math.random( 30 ) - 15
								loot:SetPos( p )
							end	
							local sideTurbottom = GetEntitiesByDef( "Turret_Team2_Pve_Jericho_MagSev_bottom" )
							for i, bottom in ipairs( sideTurbottom ) do
								Entities[ bottom ]:SetDamageable( true )
								Entities[ bottom ]:ShowInHud( true )
								Entities[ bottom ]:FullActivate( true )
							end
							local sideTurbottomS = GetEntitiesByDef( "ClanShip_SideTurret_MagSev_bottom" )
							for i, bottom in ipairs( sideTurbottomS ) do
								Entities[ bottom ]:SetDamageable( true )
								Entities[ bottom ]:ShowInHud( true )
								Entities[ bottom ]:FullActivate( true )
							end
						end
					end,
				},	
			},
		[ 4 ] = 
			{ 
				playlist = "RaidMusic_special",
				important_playlist = true,
				sRoundType 	= "mines",
				sTargetDef = "PvE_Debrissite_Bomb", 
				bombHolo = "PvE_Debrissite_Bomb", 
				mines = "LootCrate_Gen_PvE_Mines", 
				DialogsOnStart = {	
							{ 1, "Jer_Voice", "pve_magnificent_seven_mines"},
							{ 10, "fed_captain", "pve_magnificent_seven_mines2"},
							{ 20, "spike_beagle", "pve_magnificent_seven_mines3"},
						},
				tTrigger = "BombBuilderTrigger",
				bCountBar	= true,	
				--bRandomBoss = true,
				nRoundPhase = 4,
				additionalFunc = { 
					Func = function( self, curPhase )
						local pos = Vec3(1058, -321, -365)
						local dir = Vec3(-0.2877, -0.5548, 0.7806)
						designers:AddBot( "Ship_MagSev_pilot_3", pos, 1, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir)
						local mainTur = GetEntitiesByDef( "PvE_Gen_Dreadnought_MainTurret_MagSev" )
						
						for i, main in ipairs( mainTur ) do
							Entities[ main ]:Stop()
							Entities[ main ]:SetDamageable( true )
							Entities[ main ]:ShowInHud( true )
						end
						
						local sideTurtop = GetEntitiesByDef( "Turret_Team2_Pve_Jericho_MagSev_top" )
						
						for i, top in ipairs( sideTurtop ) do
							Entities[ top ]:SetDamageable( true )
							Entities[ top ]:ShowInHud( true )
							Entities[ top ]:FullActivate( true )
						end
						
						local sideTurtopS = GetEntitiesByDef( "ClanShip_SideTurret_MagSev_top" )
						
						for i, top in ipairs( sideTurtopS ) do
							Entities[ top ]:SetDamageable( true )
							Entities[ top ]:ShowInHud( true )
							Entities[ top ]:FullActivate( true )
						end
					end,
				},
			},
		[ 5 ] = 
			{ 
				playlist = "RaidMusic_special",
				important_playlist = true,
				sRoundType 	= "destroyer",
				bCountBar	= true,	
				bRandomBoss = true,
				DialogsOnStart = {	
					{ 1, "Coordinator", "pve_magnificent_seven_disarm" },
					{ 10, "Coordinator", "pve_magnificent_seven_disarm2"},
					{ 20, "fed_captain", "pve_magnificent_seven_disarm3"},
					{ 30, "peter_keel", "pve_magnificent_seven_disarm4"},
				},
				sTargetDef	= { "PvE_Gen_Dreadnought_MainTurret_MagSev", }, -- целевой деф для уничтожения
				tCount		= 6,
				nRoundPhase	= 5,
				nWoWMsgTimer= 30,
			},
			
		},	
		
	mobs = 
	{
		MeatBots = {  },										
		EliteBots	= {  },
		BossBots	= {  },
	},
	
		
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {
	[ 1 ] = 
		{
			MeatBots_t1 = {"Ship_Jericho_Troop_M1_T1", "Ship_Jericho_Troop_M2_T1", "Ship_Jericho_Troop_M3_T1", "Ship_Jericho_Troop_M4_T1"},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		},
	[ 2 ] = 
		{
			MeatBots_t1 = {"Ship_Jericho_Troop_M1_T1", "Ship_Jericho_Troop_M2_T1", "Ship_Jericho_Troop_M3_T1", "Ship_Jericho_Troop_M4_T1"},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
		},
	[ 3 ] = 
		{
			MeatBots_t1 = {"Ship_Jericho_Troop_M1_T1", "Ship_Jericho_Troop_M2_T1", "Ship_Jericho_Troop_M3_T1", "Ship_Jericho_Troop_M4_T1"},	
			MeatBots_t2 = {"Ship_Jericho_Troop_M1_T2",},	
			EliteBots = {},	
			Executor = {}, 
		},	
	[ 4 ] = 
		{
			MeatBots_t1 = {"Ship_Jericho_Troop_M1_T1", "Ship_Jericho_Troop_M2_T1", "Ship_Jericho_Troop_M3_T1", "Ship_Jericho_Troop_M4_T1"},	
			MeatBots_t2 = {"Ship_Jericho_Troop_M1_T2", "Ship_Jericho_Troop_M2_T2"},	
			EliteBots = {},	
			Executor = {}, 
			BossBots	= {},
		},	
	[ 5 ] = 
		{
			MeatBots_t1 = {"Ship_Jericho_Troop_M1_T1", "Ship_Jericho_Troop_M2_T1", "Ship_Jericho_Troop_M3_T1", "Ship_Jericho_Troop_M4_T1"},	
			MeatBots_t2 = {"Ship_Jericho_Troop_M1_T2", "Ship_Jericho_Troop_M2_T2"},	
			EliteBots = {},	
			Executor = {}, 
			BossBots	= {"Ship_Jericho_Troop_M1_T3"},
		},
	},
	
}

PvE_Mission.buildConteiner = {

	[ "BombBuilderTrigger1" ] = "BombBuild1",
	[ "BombBuilderTrigger2" ] = "BombBuild2",
	[ "BombBuilderTrigger3" ] = "BombBuild3",
	[ "BombBuilderTrigger4" ] = "BombBuild4",
	[ "BombBuilderTrigger5" ] = "BombBuild5",
	[ "BombBuilderTrigger6" ] = "BombBuild6",
	
}	

-- T1 Mission
PvE_Missions.magnificent_seven = 
{
	levelName = "pve_magnificent_seven",
	scenario_description = { "pve_magnificent_seven_str1", "pve_magnificent_seven_str2", "pve_magnificent_seven_str3" },
	need_spawn_warp = true,
	--game_duration  = 60*60*1 + 60*59,
	desc = "",
	resurrection_attempts = 5,
	item_lvl = 10, -- параметр для начисления награды.
	accountRank = 5,
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
	
	playlist = "RaidMusic_default",
	
	squads = {				
		
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
			precache_defs = {
			},
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "pve_magnificent_seven_r1_rdesc", 
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

function PvE_MS:OnStart()

	local vitals = GetEntitiesByDef( "VitalPoint_PVE_bigship_building_2" )
	
	for i, vital in ipairs( vitals ) do
		Entities[ vital ]:ShowInHud( false )
		Entities[ vital ]:FullActivate( false )
	end
	
	Entities[ "EnergyGeneratorBig" ]:ShowInHud( false )
	Entities[ "EnergyGeneratorBig" ]:SetDamageable( false )
	
	local blockers = GetEntitiesByDef( "PvE_Gen_SignalBlocker" )
	
	for i, blocker in ipairs( blockers ) do
		Entities[ blocker ]:ShowInHud( false )
		Entities[ blocker ]:SetDamageable( false )
	end
	
	local mines = GetEntitiesByDef( "PvE_Debrissite_Bomb" )
	if next( mines ) then
		for i, mine in ipairs( mines ) do
			Entities[ mine ]:FullActivate( false )
		end
	end
	
	local mineTriggers = {}
	local mineTrigger
	for i = 1, 6 do
		mineTrigger = GetObjectByName( "BombBuilderTrigger"..i )
		mineTriggers[ i ] = mineTrigger:GetId()
	end	
	
	PvE_Mission.aPhases[ 4 ].trsId = mineTriggers
	
	if next( mineTriggers ) then
		for i, tId in ipairs( mineTriggers ) do
			Entities[ tId ]:Deactivate()
		end
	end
	
	local mainTur = GetEntitiesByDef( "PvE_Gen_Dreadnought_MainTurret_MagSev" )
	for i, main in ipairs( mainTur ) do
		--Entities[ main ]:Stop()
		Entities[ main ]:SetDamageable( false )
		Entities[ main ]:ShowInHud( false )
	end
	
	local sideTurtop = GetEntitiesByDef( "Turret_Team2_Pve_Jericho_MagSev_top" )
	for i, top in ipairs( sideTurtop ) do
		Entities[ top ]:SetDamageable( false )
		Entities[ top ]:ShowInHud( false )
		Entities[ top ]:FullActivate( false )
	end
	
	local sideTurtopS = GetEntitiesByDef( "ClanShip_SideTurret_MagSev_top" )
	for i, top in ipairs( sideTurtopS ) do
		Entities[ top ]:SetDamageable( false )
		Entities[ top ]:ShowInHud( false )
		Entities[ top ]:FullActivate( false )
	end
	
	local sideTurbottom = GetEntitiesByDef( "Turret_Team2_Pve_Jericho_MagSev_bottom" )
	for i, bottom in ipairs( sideTurbottom ) do
		Entities[ bottom ]:SetDamageable( false )
		Entities[ bottom ]:ShowInHud( false )
		Entities[ bottom ]:FullActivate( false )
	end
	
	local sideTurbottomS = GetEntitiesByDef( "ClanShip_SideTurret_MagSev_bottom" )
	for i, bottom in ipairs( sideTurbottomS ) do
		Entities[ bottom ]:SetDamageable( false )
		Entities[ bottom ]:ShowInHud( false )
		Entities[ bottom ]:FullActivate( false )
	end
	
	
	
	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 1000
	
	PvE_Mission.iWaveMobs 	= 5
	PvE_Mission.initMobs 	= 5
	PvE_Mission.iMaxMobs 	= 5
	PvE_Mission.iNeed2Boss 	= -1
	PvE_Mission.iNeed2Elite = 5
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

PvE_Missions.magnificent_seven.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )
	return PvE_MS:OnUpdate( dt )
end	

function PvE_MS:OnUpdate( dt )

	return PvE_Func:OnUpdate( dt )
	
end

for i, phase in ipairs( PvE_MS_Container.aWaves ) do 

	for j, group in pairs( phase ) do
		for k, mob in ipairs( group ) do 
			if PvE_Func:FindValue( PvE_Missions.magnificent_seven.rounds[ 1 ].precache_defs, mob ) == false then
				table.insert( PvE_Missions.magnificent_seven.rounds[ 1 ].precache_defs, mob )
			end	
		end	
	end
end

PvE_Missions.magnificent_seven.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.magnificent_seven.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end