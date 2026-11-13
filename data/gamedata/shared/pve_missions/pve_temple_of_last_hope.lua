lua_debug = false

PvE_Temple_of_Last_Hope = {}

PvE_Container3 = 
{
	aPhases = {  
		[ 1 ] = 
			{ 
				sRoundType 	= "waves",
				bHPBar		= true,
				sTargetDef	= "PvE_Gen_Wave_EnergyGenerator",
				DialogsOnStart = {	
					{ 5, "jer_engineer", "wave_incoming1", "cmd/pve/temple/pve_temple_wave_start1" },
				},			
				timer		= 120,
				timeShow	= 12,
				spawnTimer	= 6,
				nHeadTimer	= 5,
				nRoundPhase	= 1,	
				key			= { "PvE_Gen_ActivatotObject", "PvE_Gen_KillAllObject", "PvE_Gen_RepairAllGens", "PvE_Gen_DebuffAllEnemy", "PvE_Gen_HackAllEnemy", "PvE_Gen_SlowAllEnemy", "PvE_Gen_BuilderObject" },
				PossibleEvents= { },
				switchNPhase= { 2 }, -- фазы под каким номером нужно заменить, в случае поражения
				tSwitchTable = -- таблица подменяемых фаз в случае поражения
				{
				},
			},
		[ 2 ] = --заглушка
			{
				sRoundType 	= "custom",
				nRoundPhase	= 1,	
				timer		= 5,
				DialogsOnStart = {	
					{ 1, "jer_engineer", "wave_end1", "cmd/pve/temple/pve_temple_wave_end1" },
				},						
				nHeadTimer	= 1, -- время в секундах до запуска говорящей головы				
				additionalFunc = 
				{
					Func = function( self, curPhase )
						if next( PvE_Mission.tId ) and Entities[ "EnergyGenerator1" ] then
							PvE_Mission.aPhases = sys.new( circleTable )
							PvE_Mission.nCurPhase = 0
							
							local params = { "try", "currentTry", "iNeed2Boss", "iNeed2Elite", "iTotalMobs", "iEventWave", "repairsGroup" }
							
							for i, param in pairs( params ) do
								PvE_Mission[ param ] = PvE_Mission[ param ] + 1
							end
							
							PvE_Mission.iWaveMobs = PvE_Mission.iTotalMobs
							
							PvE_Mission.iKilled	= 0
							local gen = Entities[ "EnergyGenerator1" ]
							--[[
							for i = 1, math.floor( PvE_Mission.try / 5 ) do
								SV_GP_CastSpell( "PvE_Waves_Passive_dynamic_AllBodyResist", gen:GetId(), gen:GetId(), gen, gen:GetPos() )
							end	
							]]
							local max = math.floor( PvE_Mission.try / 5 )
							for j = 1, math.floor( max / 100 ) do
								SV_GP_CastSpell( "PvE_Waves_Passive_dynamic_AllBodyResist_x100", gen:GetId(), gen:GetId(), gen, gen:GetPos() )
							end
							max = max % 100
							for j = 1, math.floor( max / 10 ) do
								SV_GP_CastSpell( "PvE_Waves_Passive_dynamic_AllBodyResist_x10", gen:GetId(), gen:GetId(), gen, gen:GetPos() )
							end
							max = max % 10
							for j = 1, max do
								SV_GP_CastSpell( "PvE_Waves_Passive_dynamic_AllBodyResist", gen:GetId(), gen:GetId(), gen, gen:GetPos() )
							end
	
							local startSelect = math.random( 1, 14 )
							local endSelect = math.random( 1, 14 )

							PvE_Mission.aPhases[ 1 ].DialogsOnStart[ 1 ][ 3 ] = "wave_incoming"..startSelect							
							PvE_Mission.aPhases[ 2 ].DialogsOnStart[ 1 ][ 3 ] = "wave_end"..endSelect
							PvE_Mission.aPhases[ 1 ].DialogsOnStart[ 1 ][ 4 ] = "cmd/pve/temple/pve_temple_wave_start"..startSelect
							PvE_Mission.aPhases[ 2 ].DialogsOnStart[ 1 ][ 4 ] = "cmd/pve/temple/pve_temple_wave_end"..endSelect
							sys.log("EVENT: %s; WAVE: %s; WAVECUT: %s", event, PvE_Mission.iEventWave, PvE_Mission.waveCut[ "iEventWave" ])
							if event == false and PvE_Mission.iEventWave >= PvE_Mission.waveCut[ "iEventWave" ] then
								local selectedEvent
								local events = { "Asteroid", "Barque" }
								
								for _, event_name in ipairs( events ) do
									if not eventContainer[ event_name ].isActive then
										PvE_Func:RemoveFromList( events, event_name )
									end
								end

								if next( events ) then
									local rnd = math.random( #events )
									selectedEvent = events[ rnd ]
									sys.log("RANDOM MISSION: %s, RND: %s, FROM: %s", selectedEvent, rnd, #events)
									-- PvE_Func:RemoveFromList( events, selectedEvent )
									PvE_Mission.iEventWave = 0
								end	
	
								PvE_Mission.aPhases[ 1 ].PossibleEvents = { selectedEvent }
							end				
							
							-- local repairsWaveCheck = PvE_Mission.waveCut[ "repairsGroup" ]
							
							-- if PvE_Mission.repairsGroupReadyDefeat == true then 
								-- repairsWaveCheck = repairsWaveCheck * 2 
							-- end
							
							-- if PvE_Mission.repairsGroup >= repairsWaveCheck then
								-- PvE_Mission.repairsGroupReadyDefeat = false
								-- local selectedEvent
								-- local events = { "Repairs" }
								-- repeat
									-- if not next( events ) then
										-- break										
									-- else	
										-- selectedEvent = events[ math.random( #events ) ]
										-- PvE_Func:RemoveFromList( events, selectedEvent )
									-- end	
								-- until not eventContainer[ selectedEvent ].isActive		
								-- PvE_Mission.aPhases[ 1 ].PossibleEvents = { selectedEvent }
								-- PvE_Mission.repairsGroup = 0
							-- end	
							
							SV_Pve_ResurrectPlayerShips()
						end
					end,	
				},		
			},
		[ 3 ] = --заглушка
			{
				sRoundType 	= "custom",
				nRoundPhase	= 1,	
				timer		= 17,
			},
		},	
	-- возможные для спавна мобы и доступные для запуска эвенты, привязанные к каждому маяку в фазах	
	aWaves = {},
	
	mobs = 
	{
		MeatBots = { { "Ship_Wave_Easy_Meat_Gunner_M", "Ship_Wave_Easy_Meat_Gunner_M" }, "Ship_Wave_Easy_Meat_Pirate_Silence_S", "Ship_Wave_Easy_Elite_HardShield_L", "Ship_Wave_Easy_Meat_Gunner_M", "Ship_Wave_Easy_Elite_Pirate_EMC_Chameleon_S", "Ship_Wave_Easy_Meat_Pirate_Heal_L", "Ship_Wave_Easy_Meat_Pirate_Guard_L", "Ship_Wave_Easy_Meat_Pirate_Saboteur_S", "Ship_Wave_Easy_Elite_Pirate_Saboteur_Bomb_S" },										
		EliteBots	= { "Ship_Wave_Easy_Elite_Rocket_L", "Ship_Wave_Easy_Elite_Pirate_Guard_Hook_L", "Ship_Wave_Easy_Elite_Pirate_Tackler_Invisible_M", "Ship_Wave_Easy_Elite_Pirate_Sniper_L" },
		BossBots	= { "Ship_Wave_Easy_Boss_Federation_Destroyer", "Ship_Wave_Easy_Boss_Jericho_Destroyer", "Ship_Wave_Easy_Boss_Predator", "Ship_Wave_Easy_Boss_Empire_Destroyer" },
	},
	
	roundMobs = 
	{		
	},	
}

PvE_Temple_of_Last_Hope.aWaves = {}

PvE_Temple_of_Last_Hope.aWaves.easy = 
{
	[ 1 ] = { 
				MeatBots_t1 = { },
				MeatBots_t2 = { },				
				EliteBots	= { },	
			},
	[ 2 ] = { 
				MeatBots_t1 = { },
				MeatBots_t2 = { },				
				EliteBots	= { },	
			},
	[ 3 ] = { 
				MeatBots_t1 = { },
				MeatBots_t2 = { },				
				EliteBots	= { },	
			},
}

PvE_Mission.aMissions = 
{	
	[ 1 ] = "pve_temple_of_last_hope",
}

PvE_Missions.pve_temple_of_last_hope = 
{	
	-- "все корабли почти равны"
	rank_scale_spells = BuffByRankPVE, --BuffByRank,  -- бафф усиляющий корабли низкого ранга против ботов  (ранг боя чит цваром cvars.sv_mmBattleRank =15 при загрузке миссии)
	game_duration  = 3600+1800, --60*60*1 + 60*59,
	levelName = "pve_temple_of_last_hope",
	scenario_description = { "pve_temple_of_last_hope_str1", "pve_temple_of_last_hope_str2", "pve_temple_of_last_hope_str3" },
	need_spawn_warp = false,
	waves_ui_hide = true,

	desc = "",
	resurrection_attempts = 5,
	item_lvl = 10, -- параметр для начисления награды.
	accountRank = 5,
	rank  = 1,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	bot_difficulty = 3, -- параметр задающий сложность ботов.
	disabled = false,
	difficulty = "wave",
	
	HudDialogs = 
	{
	},		
	
	turret_health_coef = 1.0,
	turret_damage_coef = 1.0,	
	
	-- дополняются скриптом!!!
	squads = {
		{
			name = "Transport1",
	 		relationship_group = 2,
			spawn_spot = "Kamikaze_spawn1",
			route = "TroopersPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Kamikaze", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		{
			name = "Asteroid1",
	 		relationship_group = 2,
			spawn_spot = "Event_spawn",
			route = "AsteroidPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "PvE_Gen_Movement_Asteroid", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		{
			name = "Asteroid2",
	 		relationship_group = 2,
			spawn_spot = "Event_spawn",
			route = "AsteroidPath2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "PvE_Gen_Movement_Asteroid", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		{
			name = "Asteroid3",
	 		relationship_group = 2,
			spawn_spot = "Event_spawn",
			route = "AsteroidPath3", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "PvE_Gen_Movement_Asteroid", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},		
		{
			name = "Barque1",
	 		relationship_group = 2,
			spawn_spot = "Event_spawn",
			route = "EventPath2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "PvE_Gen_Wave_Barque_T3", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},	
		{
			name = "Repairs1",
	 		relationship_group = 1,
			spawn_spot = "Repair_Spawn1",
			route = "RepairPath1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = true,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 10,
			respawn_time = 12000,			
			cargoship = "CargoShip_Gen_Repairs", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
				"PvE_Debrissite_Bomb",
				"PvE_Wave_EnergyStation",
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
				"PvE_Gen_RepairAllGens",
				"PvE_Gen_Movement_Asteroid",
				"PvE_Gen_DebuffAllEnemy",
			},
			exp_reward_portion = 3,
			cred_reward_portion = 8, --8
			loot_attempts_reward = 3,
			player_spawn_group = 1,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "wave_nalnifan_gate_lumen_r1_rdesc", 
			start_sentence = "",

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
				
					{	def = "Ship_Bot_TrueMeat_R3_S_T1", count = 1, spawn_group = 2, spawn_warp = true, delay = 99999999, }, 
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


PvE_Missions.pve_temple_of_last_hope.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt )
	
	if not Entities[ PvE_Mission.tId[ 1 ] ] or Entities[ PvE_Mission.tId[ 1 ] ]:IsDead() then
		return 1, ai.WinReason.PVE_MISSION_COMPLETE	
	end
	
	if PvE_Mission.activeTurretsTimer then
		if PvE_Mission.activeTurretsTimer > 0 then
			PvE_Mission.activeTurretsTimer = PvE_Mission.activeTurretsTimer - dt
		else
			for i, turet in ipairs( PvE_Mission.stationaryTurrets ) do
				Entities[ turet[ 1 ] ]:EnableAiThink( false )
			end	
			
			PvE_Mission.activeTurretsTimer = nil
		end
	end
	
	return PvE_Func:OnUpdate( dt )
end
	
function PvE_Temple_of_Last_Hope:OnStart()


	PvE_Mission.repairsGroup = 0
	PvE_Mission.repairsGroupReadyDefeat = false
	PvE_Mission.iTotalMobs  = 9 -- расчет из iWaveMobs - 1, т.к. с первой волны идет прибавка на +1
	PvE_Mission.iNeed2Boss = 0
	PvE_Mission.iNeed2Elite = 0
	PvE_Mission.iWaveMobs  = 10
	PvE_Mission.iMaxMobs = 30
	PvE_Mission.try = 1	
	PvE_Mission.currentTry = 1
	PvE_Mission.previousMobId = -1
	PvE_Mission.chance = 0
	PvE_Mission.iKilled = 0
	PvE_Mission.iEventWave = 0
	PvE_Mission.stationaryTurrets = {}
	local mineTriggers = {}
	local mineTrigger
	event = false

	PvE_Mission.nVitalsTotal = 0
	PvE_Func:PhasesSelector()
	
	PvE_Mission:OnStart()
	
	AID.max_dist = 600
	for i = 1, 10 do
		mineTrigger = GetObjectByName( "EntityBuilderTrigger"..i )
		mineTriggers[ i ] = mineTrigger:GetId()
	end		
	PvE_Mission.trsId = mineTriggers
	if next( mineTriggers ) then
		for i, tId in pairs( mineTriggers ) do
			Entities[ tId ]:Deactivate()
		end
	end
	
	local startSelect = math.random( 1, 14 )
	local endSelect = math.random( 1, 14 )

	PvE_Mission.aPhases[ 1 ].DialogsOnStart[ 1 ][ 3 ] = "wave_incoming"..startSelect							
	PvE_Mission.aPhases[ 2 ].DialogsOnStart[ 1 ][ 3 ] = "wave_end"..endSelect
	PvE_Mission.aPhases[ 1 ].DialogsOnStart[ 1 ][ 4 ] = "cmd/pve/temple/pve_temple_wave_start"..startSelect
	PvE_Mission.aPhases[ 2 ].DialogsOnStart[ 1 ][ 4 ] = "cmd/pve/temple/pve_temple_wave_end"..endSelect
	
	PvE_Func:WaveCollect()

	local targets = GetEntitiesByDef( "PvE_Gen_Wave_EnergyGenerator" )
	PvE_Mission.tId = {}
	PvE_Mission.tId[ 1 ] = targets[ math.random( #targets ) ]	
	
	local stationaryTurrets = GetEntitiesByDef( "PvE_Gen_Average_Turret1" )
	
	for i, turret in pairs( stationaryTurrets ) do
		PvE_Mission.stationaryTurrets[ i ] = {}
		PvE_Mission.stationaryTurrets[ i ][ 1 ] = turret
		Entities[ turret ]:SetDamageable( false )
		Entities[ turret ]:EnableAiThink( false )
	end		
end

PvE_Missions.pve_temple_of_last_hope.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )

	local nEventReward = 0
	local cEvent, dEvent
	local nRes = 0
	
	nRes = math.max( 0, ( PvE_Mission.try / 12 ) * ( PvE_Mission.currentTry * 0.1 ) )	
	return nRes, nRes 
end

PvE_Missions.pve_temple_of_last_hope.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
	if PvE_Mission.currentTry > 1 then
		return 3
	else
		return 0 
	end
	
end

PvE_Missions.pve_temple_of_last_hope.rounds[1].SV_GetWave = function( self )

	return PvE_Mission.try
end

function PvE_Func:WaveCollect()

	local iBoss = 1 
	local roundBoss = 1
	local iElite = 1 
	local roundElite = 1
	local iMeat = 1
	local iEvent = 1
	PvE_Mission.roundMobs = {}
	
	for i = 1, 20 do 
		if PvE_Mission.roundMobs[ i - 1 ] then	
			PvE_Mission.roundMobs[ i ] = sys.new( PvE_Mission.roundMobs[ i - 1 ] )
		else		
			PvE_Mission.roundMobs[ i ] = {}
			PvE_Mission.roundMobs[ i ].MeatBots = {}
			PvE_Mission.roundMobs[ i ].EliteBots = {}
			PvE_Mission.roundMobs[ i ].BossBots = {}
		end

		if iEvent == 6 then
			iEvent = 0
			iElite = 0 
		elseif iBoss >= 4 and PvE_Mission.mobs.BossBots[ roundBoss ] then
			table.insert( PvE_Mission.roundMobs[ i ].BossBots, PvE_Mission.mobs.BossBots[ roundBoss ]  )
			roundBoss = roundBoss + 1
			iBoss = 0
			iElite = 0
		elseif iElite == 2 and PvE_Mission.mobs.EliteBots[ roundElite ] then
			table.insert( PvE_Mission.roundMobs[ i ].EliteBots, PvE_Mission.mobs.EliteBots[ roundElite ]  )
			iElite = 0 
			roundElite = roundElite + 1
		elseif PvE_Mission.mobs.MeatBots[ iMeat ] then
			table.insert( PvE_Mission.roundMobs[ i ].MeatBots, PvE_Mission.mobs.MeatBots[ iMeat ]  )
			iMeat = iMeat + 1
		end	
		iBoss = iBoss + 1
		iElite = iElite + 1
		iEvent = iEvent + 1
	end
end	


PvE_NewEvents = {

	[ "Repairs" ] = { --ремонтная бригада
		EventTargetDefs = { "CargoShip_Gen_Repairs" },
		EventCounter	= 1,
		isEndFail	= false, -- !если время эвента вышло а союзник ещё жив - то считать выполненным
		isActive	= true,
		isStarted	= false,
		isComplete	= false,
		isFailed	= false,
		cTextOnStart = "clanShip_gather_boostRepair_caption",
		cCharacterOnStart = "jer_engineer",
		squad 		= "Repairs1",
		time_show 	= 10,
		eventRepairTime = 30,
		eventNeedToStop = true,			
		
		fStart	 =	function ( self, container, dt, curPhase, event ) -- не стандартные действия при запуске фазы
						SV_Pve_AISquadSpawn( self.squad )		
						self.eventRepairs = GetEntitiesByDef( "CargoShip_Gen_Repairs" )
						self.eventFinishPos = Entities[ "EventPoint1" ]:GetPos()
						self.EventCounterLast = self.EventCounter
						return true
					end,
		fUpdate	 = 	function ( self, container, dt, curPhase, event ) -- проверка окончания фазы (возвращает true если фаза окончена)
						if Entities[ PvE_Mission.tId[ 1 ] ] and Entities[ self.eventRepairs[ 1 ] ] then
							local pos = SquareLen( self.eventFinishPos, Entities[ self.eventRepairs[ 1 ] ]:GetPos() )
							if pos < 3000 and self.eventNeedToStop == true then		
								Entities[ self.eventRepairs[ 1 ] ]:SetTargetSpeed( 0 )
								local health = Entities[ PvE_Mission.tId[ 1 ] ]:GetHealth()
								local maxHealth = Entities[ PvE_Mission.tId[ 1 ] ]:GetMaxHealth()	
								local addationalHealth = ( maxHealth * 0.01 ) / 60				
								if health < maxHealth and self.eventRepairTime > 0 then
									Entities[ PvE_Mission.tId[ 1 ] ]:SetHealth( health + addationalHealth )
									self.eventRepairTime = self.eventRepairTime - dt
								else
									self.eventNeedToStop = false
								end
							end
						elseif not 	Entities[ PvE_Mission.tId[ 1 ] ] or Entities[ PvE_Mission.tId[ 1 ] ]:IsDead() == true then
							
							self.isFailed = true
							PvE_Mission.repairsGroupReadyDefeat = true
							return true
						end	
					end,
		fEnd	 = function ( self, container, dt, curPhase, event ) 
			self.EventTargetDefs = { "CargoShip_Gen_Repairs" }
			self.EventCounter	= 1
			self.isEndFail	= false
			self.isActive	= true
			self.isStarted	= false
			self.isComplete	= false
			self.isFailed	= false
			self.eventRepairTime = 30
			self.timer = nil
			self.nPhaseStart = nil
		end, -- не стандартные действия на окончание времени эвента
	},

	[ "Asteroid" ] = { --Союзный эсминец на подмоге
		EventTargetDefs = { "PvE_Gen_Movement_Asteroid" },
		isEndFail	= false, -- !если время эвента вышло а союзник ещё жив - то считать выполненным
		isActive	= true,
		isStarted	= false,
		isComplete	= false,
		isFailed	= false,
		EventCounter	= 1,
		time_show 	= 10,
		cTextOnStart = "wave_asteroid",
		cSoundOnStart = "cmd/pve/temple/pve_temple_event1",
		cCharacterOnStart = "jer_engineer",
		nCount	 = 0,	-- внутренняя переменная
		asteroids = { "Asteroid1", "Asteroid2", "Asteroid3" },
		
		fStart	 =	function ( self, container, dt, curPhase, event ) -- не стандартные действия при запуске фазы
						local select = math.random( #self.asteroids )
						local squad = self.asteroids[ select ]
						SV_Pve_AISquadSpawn( squad )		
						self.eventAsteroid = GetEntitiesByDef( self.EventTargetDefs[ 1 ] )	
						self.eventFinishPos = Entities[ "EventPoint1" ]:GetPos()
						return true
							
					end,
		fUpdate	 = 	function ( self, container, dt, curPhase, event ) -- проверка окончания фазы (возвращает true если фаза окончена)
						if self.eventAsteroid[ 1 ] and not Entities[ self.eventAsteroid[ 1 ] ]:IsDead() then
							local pos = SquareLen( self.eventFinishPos, Entities[ self.eventAsteroid[ 1 ] ]:GetPos() )
							if pos < 1000 then
								if Entities[ "Detonator5_Exp1" ] then
									sys.concmd( "e_event Detonator5_Exp1 EmitDeathEffectAndRemove" )
									sys.concmd( "e_event EnergyGenerator1 EmitDeathEffectAndRemove" )
									self.isFailed = true	
									return true	
								end
							end
						else
							self.isComplete = true
							return true							
						end	
					end,
		fEnd	 = function ( self, container, dt, curPhase, event ) 
			self.isEndFail	= false -- !если время эвента вышло а союзник ещё жив - то считать выполненным
			self.isActive	= true
			self.isStarted	= false
			self.isComplete	= false
			self.isFailed	= false	
			self.EventCounter	= 1		
			self.timer = nil
			self.nPhaseStart = nil
		end, -- не стандартные действия на окончание времени эвента
	},	
	
	[ "Barque" ] = { --Союзный эсминец на подмоге
		EventTargetDefs = { "PvE_Gen_Wave_Barque_T3" },
		isEndFail	= false, -- !если время эвента вышло а союзник ещё жив - то считать выполненным
		isActive	= true,
		isStarted	= false,
		isComplete	= false,
		isFailed	= false,
		EventCounter	= 1,
		time_show 	= 10,
		cTextOnStart = "wave_barque",
		cSoundOnStart = "cmd/pve/temple/pve_temple_event2",
		cCharacterOnStart = "jer_engineer",
		nCount	 = 0,	-- внутренняя переменная
		squad = "Barque1",
		
		fStart	 =	function ( self, container, dt, curPhase, event ) -- не стандартные действия при запуске фазы
						SV_Pve_AISquadSpawn( self.squad )		
						self.eventAsteroid = GetEntitiesByDef( self.EventTargetDefs[ 1 ] )	
						self.eventFinishPos = Entities[ "EventPoint1" ]:GetPos()
						return true
							
					end,
		fUpdate	 = 	function ( self, container, dt, curPhase, event ) -- проверка окончания фазы (возвращает true если фаза окончена)
						if self.eventAsteroid[ 1 ] and not Entities[ self.eventAsteroid[ 1 ] ]:IsDead() then
							local pos = SquareLen( self.eventFinishPos, Entities[ self.eventAsteroid[ 1 ] ]:GetPos() )
							if pos < 4000 then
								if Entities[ "Detonator5_Exp1" ] then
									sys.concmd( "e_event Detonator5_Exp1 EmitDeathEffectAndRemove" )
									sys.concmd( "e_event EnergyGenerator1 EmitDeathEffectAndRemove" )
									self.isFailed = true	
									return true	
								end
							end
						else
							self.isComplete = true
							return true							
						end	
					end,
		fEnd	 = function ( self, container, dt, curPhase, event ) 
			self.isEndFail	= false -- !если время эвента вышло а союзник ещё жив - то считать выполненным
			self.isActive	= true
			self.isStarted	= false
			self.isComplete	= false
			self.isFailed	= false	
			self.EventCounter	= 1		
			self.timer = nil
			self.nPhaseStart = nil
		end, -- не стандартные действия на окончание времени эвента
	},	
}

for i, group in pairs( PvE_Container3.mobs ) do 

	for j, mob in pairs( group ) do
		table.insert( PvE_Missions.pve_temple_of_last_hope.rounds[ 1 ].precache_defs, mob )
	end
end
