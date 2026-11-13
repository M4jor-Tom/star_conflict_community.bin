--
PvE_ST = {}

PvE_ST_Container = 
{
	aPhases = {  		
		[ 1 ] = 
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				--bRandomBoss = true,
				DialogsOnStart = {	
				{ 1, "contractor", "pve_stealth_seek1"},
				{ 10, "contractor", "pve_stealth_seek2"},
						},
				specificDef	= "VitalPoint_PVE_wreck", --нужно будет вписать сюда специальный деф мин, на базе маяка.
				count		= 1,--3,
				nRoundPhase	= 1,	
				additionalFunc = { 
					Func = function( self, curPhase )
						local vitals = GetEntitiesByDef( "VitalPoint_PVE_bigship_building_2_stealth" )
	
						for i, vital in ipairs( vitals ) do
							Entities[ vital ]:ShowInHud( false )
							Entities[ vital ]:FullActivate( true )
						end
						
						vitals = GetEntitiesByDef( "VitalPoint_PVE_wreck" )
	
						for i, vital in ipairs( vitals ) do
							Entities[ vital ]:ShowInHud( false )
							Entities[ vital ]:Remove( )
						end
						
						--[[vitals = GetEntitiesByDef( "VitalPoint_PVE_wreck_fake" )
	
						for i, vital in ipairs( vitals ) do
							Entities[ vital ]:ShowInHud( false )
							Entities[ vital ]:FullActivate( true )
						end]]
					end,	
				},
			},
		[ 2 ] = 
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				--bRandomBoss = true,
				DialogsOnStart = {	
				{ 1, "contractor", "pve_stealth_deactivate_generators"},
				{ 10, "contractor", "pve_stealth_deactivate_generators2"},
						},
				specificDef	= "VitalPoint_PVE_bigship_building_2_stealth", --нужно будет вписать сюда специальный деф мин, на базе маяка.
				count		= 1,--2,
				nRoundPhase	= 2,
			},
		[ 3 ] = 
			{
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				sync_UI_Timer = 5,
				DialogsOnStart = {	
					{ 5, "contractor", "pve_stealth_exterminate"},
				},		
				nRoundPhase	= 3,	
				waves = 
				{				
					{	def = "StealthPve_F3_S", count = 6, spawn_warp = false, delay = 5, },
					{	def = "StealthPve_F3_M", count = 4, spawn_warp = false, delay = 5, },
					{	def = "StealthPve_F3_L", count = 2, spawn_warp = false, delay = 5, },
					
				},		
				additionalFunc = { 
					Func = function( self, curPhase )
						local vitals = GetEntitiesByDef( "VitalPoint_PVE_bigship_building_2_stealth1" )
	
						for i, vital in ipairs( vitals ) do
							Entities[ vital ]:ShowInHud( false )
							Entities[ vital ]:FullActivate( false )
						end
						local vitals = GetEntitiesByDef( "PvE_EnergyGeneratorBig_stealthPVE" )
	
						for i, vital in ipairs( vitals ) do
							Entities[ vital ]:ShowInHud( false )
							Entities[ vital ]:FullActivate( true )
						end
					end,	
				},
			},
		[ 4 ] = 
			{
				sRoundType 	= "vitals",
				bCountBar	= true,
				--bRandomBoss = true,
				DialogsOnStart = {	
				{ 1, "contractor", "pve_stealth_activate_generators"},
						},
				specificDef	= "PvE_EnergyGeneratorBig_stealthPVE", --нужно будет вписать сюда специальный деф мин, на базе маяка.
				count		= 1,--2,
				nRoundPhase	= 4,		
			},
		[ 5 ] = 
			{
				sRoundType 	= "kill2",
				bCountBar	= true,
				progressCount = 0,
				queueMob	= 1,
				sync_UI_Timer = 5,
				DialogsOnStart = {	
				{ 1, "contractor", "pve_stealth_boss"},
				{ 10, "trashmaster", "pve_stealth_boss2"},
				{ 20, "contractor", "pve_stealth_boss3"},
				},		
				nRoundPhase	= 5,	
				waves = 
				{				
					{	def = "Ship_StealthPVE_Boss_Trash", count = 1, spawn_warp = false, delay = 5, },
					{	def = "Stealh_Pve_Healer", count = 2, spawn_warp = false, delay = 5, },
					
				},
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
			BossBots	= {},
		},
	[ 3 ] = 
		{
			MeatBots_t1 = {},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
			BossBots	= {},
		},
	[ 4 ] = 
		{
			MeatBots_t1 = {"StealthPVE_F4_Mob1", "StealthPVE_F4_Mob2", "StealthPVE_F4_Mob3", "StealthPVE_F4_Mob4",},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
			BossBots	= {},
		},	
	[ 5 ] = 
		{
			MeatBots_t1 = {},	
			MeatBots_t2 = {},	
			EliteBots = {},	
			Executor = {}, 
			BossBots	= {},
		},
	},
	
}

-- T1 Mission
PvE_Missions.stealth = 
{
	levelName = "pve_stealth",
	scenario_description = { "pve_stealth_str1", "pve_stealth_str2", "pve_stealth_str3" },
	need_spawn_warp = true,
	--game_duration  = 60*60*1 + 60*59,
	desc = "",
	resurrection_attempts = 2,
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
	
	playlist = "RaidMusic_default",
	
	squads = {				
		{
			name = "Transport1",
	 		relationship_group = 2,
			spawn_spot = "Team2Group1",
			route = "PathObject1", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = false,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 1,			
			cargoship = "CargoShipStealth", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "Transport2",
	 		relationship_group = 2,
			spawn_spot = "Team2Group2",
			route = "PathObject2", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = false,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 1,			
			cargoship = "CargoShipStealth", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "Transport3",
	 		relationship_group = 2,
			spawn_spot = "Team2Group3",
			route = "PathObject3", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = false,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 1,			
			cargoship = "CargoShipStealth", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
			members = 
			{	
				{		
				},			
			},
		},
		
		{
			name = "Transport4",
	 		relationship_group = 2,
			spawn_spot = "Team2Group4",
			route = "PathObject4", 
			squad_type = ai.AISquadType.CONVOY, --PATROL CONVOY
			spawn_by_mission = false,
			collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN,
			first_spawn_delay = 1,
			respawn_time = 1,			
			cargoship = "CargoShipStealth", -- каргошип, который будет двигаться по тому же маршруту с отрядом
			
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
			precache_defs = { "StealthPve_F3_S", "StealthPve_F3_M", "StealthPve_F3_L", "Ship_StealthPVE_Boss_Trash", "StealthPVE_F4_Mob1", "StealthPVE_F4_Mob2", "StealthPVE_F4_Mob3", "StealthPVE_F4_Mob4", "StealhPve_Hunter", "StealhPve_Hunter2", "Stealh_Pve_Healer"},
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "pve_stealth_r1_rdesc", 
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

function PvE_ST:OnStart()

	--[[local vitals_fake = GetEntitiesByDef( "VitalPoint_PVE_wreck_fake" )
	
	for i, vital in ipairs( vitals_fake ) do
		Entities[ vital ]:ShowInHud( false )
		Entities[ vital ]:FullActivate( false )
	end]]


	local vitals = GetEntitiesByDef( "VitalPoint_PVE_wreck" )
	
	table.insert( PvE_Mission.aPhases[ 1 ].tId, 255 )
	
	for i, vital in ipairs( vitals ) do
		table.insert( PvE_Mission.aPhases[ 1 ].tId, vital )
	end
	
	local vitals = GetEntitiesByDef( "VitalPoint_PVE_bigship_building_2_stealth" )
	
	for i, vital in ipairs( vitals ) do
		Entities[ vital ]:ShowInHud( false )
		Entities[ vital ]:FullActivate( false )
	end
	
	local vitals = GetEntitiesByDef( "PvE_EnergyGeneratorBig_stealthPVE" )
	
	for i, vital in ipairs( vitals ) do
		Entities[ vital ]:ShowInHud( false )
		Entities[ vital ]:FullActivate( false )
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
	
	-----------------------
end

PvE_ST_StealthParams = 
{
	BSpawnPrefix		= "Spawn_AI", -- префикс точек спавна охотников, к нему будут добавлятся числа при поиске спавнов
	
	BSeekers =  -- боты в стелс стадиях, которые могут обнаружить игроков, дефы (вписать патрули и ботов из BHunters)
	{
		"CargoShipStealth", 
		"StealhPve_Hunter",
		"StealhPve_Hunter2",
		"StealhPve_Hunter3",
		
	},
	
	BHuntersPhase = 0, -- уровень погони за игроками в BHunters
	BHunters = -- боты которые заспавнились при обнаружении игроков и атакуют их, дефы / по хорошему писать одинаковые дефы рядом
	-- ботам выставлять параметры
	-- avtomat = "PveStealth_AttackAndPatrol", -- автомат поведения ботов
	-- adv_pathConfig = {"Path","cycle"}, -- используемые пути, где Path - имя пути (можно записать несколько), "cycle" - параметр для зацикливания таблицы, иначе боты отТПшиваются с карты после завершения всех путей
	{ -- боты должны иметь уникальные дефы, чтобы не пресекаться с другими мобами, тк есть проверка их наличия на карте, если они будут живы, то новые не заспавнятся
		[ 0 ] = { },
		[ 1 ] =
		{ 
			"StealhPve_Hunter",
			"StealhPve_Hunter",
			"StealhPve_Hunter",
			"StealhPve_Hunter",
		},
		[ 2 ] =
		{ 
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
		},
		[ 3 ] =
		{ 
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
			"StealhPve_Hunter2",
		},
	},
	BHuntersPack = {}, -- сюда сохраняются все охотники после спавна
	DetectedPlayers = { }, -- обнаруженные игроки / формат {id, chaseTimer, playerId}
	BHuntersHealthTable = { }, -- таблица актуального хп охотников
	
	phaseUpdPeriod = 2, -- период обновления
	phaseUpdTimer = 0,
	detectionRange = 250, -- расстояние обнаружения игроков в метрах
	detectionRangeAntiRadarMul = 0.5, -- расстояние обнаружения игроков под радарной невидимостью
	
	chaseTimer = 60, -- таймер в течении которого за игроком будут гонятся охотники
	chaseStealthMul = 1.5, -- насколько быстрее таймер будет исходить при невидимости (радарной или полной)
	
	wavesPeriod = 90, -- время через которое заспавнится новая волна, если игроки бегают от неё слишком долго, если 0, то не считает
	wavesTimer = 0,
	
	detectionRangeSignatureCoefs = -- насколько увеличивается радиус обнаружения в зависимости от сигнатуры / работает через умножение
	{
		[ai.Signature.HUGE] 	= 1.5,
		[ai.Signature.LARGE] 	= 1.3,
		[ai.Signature.MEDIUM]	= 1,
		[ai.Signature.SMALL]	= 0.8,
		[ai.Signature.TINY]		= 0.1,
	},
	
	endStealth = false, -- флаг об окончании стелса
	
	ChaseOnMessage = "msg_steath_detection", --сообщение об обнаружении
	ChaseOffMessage = "msg_steath_escape", --сообщение об окончании преследования
	ChaseLvlInc		= "msg_steath_alarm_inc", -- сообщение об увеличении погони
	ChaseIntensLvls	= { -- сообщения об уровне погони, в процентах от максимума
		{ val = 100, str = "msg_steath_alarm_high" },
		{ val = 60,	str = "msg_steath_alarm_middle" },
		{ val = 20, str = "msg_steath_alarm_low" },
	}
}

PvE_Missions.stealth.rounds[ 1 ].SV_OnUpdateRound = function ( self, dt, curPhase )

	local players = GetAllPlayersInfo()
	local playersId = {}
	local player_count = 0
		for i, player in ipairs( players ) do
			if Entities[ player.entityId ] and not Entities[ player.entityId ]:IsDead() and not player.isBot then
				playersId[ i ] = player.entityId
				player_count = player_count+1
			end	
		end
		
	-----------------------
	-- Блок проверки игроков на то обнаружили их боты или нет
	
	if curPhase == 1 then -- обновления конкретно в первой фазе
		PvE_ST:StealthPhase( dt, curPhase )
	end
	
	if curPhase == 2 then -- обновления конкретно в первой фазе
		PvE_ST:StealthPhase( dt, curPhase )
	end
	
	if curPhase > 2 then 
		PvE_ST:AfterStealthPhase( dt, curPhase )
	end

	-----------------------
	
	return PvE_ST:OnUpdate( dt )
end	

function PvE_ST:OnUpdate( dt )
	return PvE_Func:OnUpdate( dt )
	
end

function PvE_ST:StealthPhase( dt, curPhase )
	if ( PvE_ST_StealthParams.phaseUpdTimer > PvE_ST_StealthParams.phaseUpdPeriod ) then 		
		PvE_ST_StealthParams.phaseUpdTimer = 0
		if PvE_ST_StealthParams.BSeekers[curPhase] and PvE_ST_StealthParams.BHunters[curPhase] then
			PvE_ST:StealthPhaseUpdate( dt, curPhase )
		end
	else
		PvE_ST_StealthParams.phaseUpdTimer = PvE_ST_StealthParams.phaseUpdTimer + dt
	end
end 

function PvE_ST:AfterStealthPhase( dt, curPhase )
	if ( PvE_ST_StealthParams.phaseUpdTimer > PvE_ST_StealthParams.phaseUpdPeriod ) then 		
		PvE_ST_StealthParams.phaseUpdTimer = 0
		if not PvE_ST_StealthParams.endStealth then -- всех живых охотников отправляем убивать игроков
			local players = GetAllPlayersInfo()
			PvE_ST_StealthParams.DetectedPlayers = {}
			
			for i, player in ipairs( players ) do
				local e = Entities[ player.entityId ]
				table.insert( PvE_ST_StealthParams.DetectedPlayers, {id = player.entityId, chaseTimer = 10000, playerId = player.playerId} )
			end
		
			for _, bot in pairs ( PvE_ST_StealthParams.BHuntersPack ) do 
				bot.stealthTargetId = PvE_ST:DetectedPlayersIdList( )
			end 
			
			PvE_ST_StealthParams.endStealth = true
		else 
			for i, _ in ipairs( PvE_ST_StealthParams.DetectedPlayers ) do
				PvE_ST:UpdatePlayersShips( i )
				for _, bot in pairs ( PvE_ST_StealthParams.BHuntersPack ) do 
					bot.stealthTargetId = PvE_ST:DetectedPlayersIdList( )
				end 
			end
		end
	else
		PvE_ST_StealthParams.phaseUpdTimer = PvE_ST_StealthParams.phaseUpdTimer + dt
	end
end 

function PvE_ST:StealthPhaseUpdate( dt, curPhase )
	
	--обновляем таймеры погони на обнаруженных игроках
	PvE_ST:SubChaseTimerOnDetectedPlrs( )
	
	-- записываем всех обнаруженных игроков (обнаруживают боты из таблицы BSeekers)
	local detectedPlayers = PvE_ST:CheckPlayersStealth( PvE_ST_StealthParams.BSeekers )
		
	-- проверяем что игрок еще не был обнаружен в этой фазе ранее, добавляем в список обнаруженных, если нужно
	for _, player in ipairs( detectedPlayers ) do 
		local PlrWasNotAdded = true
		local dpid = player.playerId

		for i, dptab in ipairs( PvE_ST_StealthParams.DetectedPlayers ) do
			if dptab.playerId == dpid then
				PlrWasNotAdded = false
				-- обновляем время погони за этим игроком на максимальный
				PvE_ST_StealthParams.DetectedPlayers[i].chaseTimer = PvE_ST_StealthParams.chaseTimer
				PvE_ST_StealthParams.DetectedPlayers[i].id = player.entityId
				break
			end
			--SV_ShowWowMsg( dptab.playerId, PvE_ST_StealthParams.ChaseOnMessage, false, 299, {}, 3 )
		end
			
		if PlrWasNotAdded then
			PvE_ST:AddDetectedPlayerToList( player.entityId, PvE_ST_StealthParams.chaseTimer, dpid )
		end	
	end
	
	PvE_ST:UpdateChaseMobs( )

end

-- Добавляем игока в таблицу обнаруженных
function PvE_ST:AddDetectedPlayerToList( entityid, chaseTime, pId )
	local eid = entityid or nil
	local cTimer = chaseTime or PvE_ST_StealthParams.chaseTimer or nil
	local plrId = pId or nil
	if eid and cTimer and plrId then
		table.insert( PvE_ST_StealthParams.DetectedPlayers, {id = entityid, chaseTimer = chaseTime, playerId = plrId} )
		SV_ShowWowMsg( plrId, PvE_ST_StealthParams.ChaseOnMessage, false, 299, {}, 4, "sound/ui/lootScanSuccess" ) -- "sound/ui/apply" "sound/ui/cancel"
	else
		sys.logError("AddDetectedPlayerToList: Player wasn't added to DetectedPlayers list, wrong params of player!")
	end
end

function PvE_ST:UpdateChaseMobs( ) -- обновляет состояния погони на всех охотниках
	
	-- Проверяем жив ли хоть один из охотников, обновляем их таблицу погони; если нет живых, то проверяем таблицу игроков и спавним новых охотников, если нужно + поднимаем уровень тревоги
	local AllHuntersDead = true
	local chaseLevel = PvE_ST_StealthParams.BHuntersPhase

	for _, bot in pairs( PvE_ST_StealthParams.BHuntersPack ) do 
	
		local botId = bot.entityId
		
		if Entities[botId] then 
			PvE_ST:ChangeBotAgroTable( botId, PvE_ST:DetectedPlayersIdList( ) )
			AllHuntersDead = false
		end
	end
	
	--если охотников нет, то создаем их
	if AllHuntersDead and #PvE_ST_StealthParams.DetectedPlayers > 0 and #PvE_ST_StealthParams.BHuntersPack < 33 then
		PvE_ST:IncChaseLevel( )
		--спавним новый пак с нужной агротаблицей
		PvE_ST:SpawnPackOnPoint( PvE_ST_StealthParams.BHunters[PvE_ST_StealthParams.BHuntersPhase], PvE_ST_StealthParams.BSpawnPrefix )
	end 
end

-- обновляем таблицу погони
function PvE_ST:ChangeBotAgroTable( botId, tab )
	if botId and type(botId) == "number" and AID:GetBot( botId ) then
		local bot = AID:GetBot( botId )
		bot.stealthTargetId = tab
	end
end

-- удаляем цель из всех агро таблиц
function PvE_ST:RemoveTargetIdFromAgroTable( targetId )
	for i, bot in pairs( PvE_ST_StealthParams.BHuntersPack ) do
		if bot.behavior_targetId == targetId then
			bot.behavior_targetId = -1
			AID:GetTargetForBot( AID:GetShip( bot ), bot )
		end
	end
end

function PvE_ST:CheckPlayersStealth( seekersDefs ) -- возвращает список обнаруженных игроков / seekersDefs - таблица дефов ботов, которые ищут игроков
	
	local detectedPlayers = { }	
	
	if type(seekersDefs) == "table" then
		for _, def in ipairs( seekersDefs ) do
			if not ( type(def) == "string") then
				sys.logError("Func PvE_ST:CheckPlayersStealth supposed var seekersDefs will be string or table of strings")
				return {}
			end
		end
	elseif not ( type(def) == "string" )then
		sys.logError("Func PvE_ST:CheckPlayersStealth supposed var seekersDefs will be string or table of strings")
		return {}
	end
	
	local players = GetAllPlayersInfo()
	local playersEnt = {}
	
	for i, player in ipairs( players ) do -- проверяем, что игрок не бот и жив
		local e = Entities[ player.entityId ]
		if e and not e:IsDead() and not player.isBot then
			playersEnt[ i ] = e
		end	
	end
	
	for _, class in pairs( { "CargoShip", "SpaceShip"} ) do
		for _, shipId in pairs( GetEntitiesByClass( class ) ) do 
			local shipEnt = Entities[shipId]
			
			-- проверяем все живые корабли с конкретными дефами 
			for _, def in pairs( seekersDefs ) do
			
				if shipEnt:GetDefName() == def then
					local shipPos = shipEnt:GetPos()
					
					local healthChangeCoef = 1
					
					if #PvE_ST_StealthParams.DetectedPlayers < 1 then 
						local shipHealth = shipEnt:GetHealth()
						local shipHealthOld = PvE_ST_StealthParams.BHuntersHealthTable[shipId]
						if shipHealthOld then 
							if (shipHealthOld - shipHealth) > 3000 then
								healthChangeCoef = 2
								PvE_ST_StealthParams.BHuntersHealthTable[shipId] = shipHealth
							end
						else 
							table.insert(PvE_ST_StealthParams.BHuntersHealthTable, shipId, shipHealth)
						end
					end

					-- проверяем расстояние от бота до игрока
					for i, player in pairs( players ) do
						
						local e = Entities[ player.entityId ]
						if e and not e:IsDead() and not player.isBot then
							
							-- умножаем дальность обнаружения на коэф сигнатуры игрока
							local detectionSinatureMul = PvE_ST_StealthParams.detectionRangeSignatureCoefs[ Def[ e:GetDefName() ].signature ]
							local detectionRange = PvE_ST_StealthParams.detectionRange * detectionSinatureMul * healthChangeCoef
							detectionRange = detectionRange * detectionRange
							local detectionRangeAR = detectionRange * PvE_ST_StealthParams.detectionRangeAntiRadarMul
							
							local dist = SquareLen( e:GetPos(), shipPos )
							
							if ( detectionRange > dist and not( e:CheckAura( ai.Aura.STEALTH ) ) ) or ( e:CheckAura( ai.Aura.ANTI_RADAR ) and detectionRangeAR > dist ) then 
								sys.log("Player ".. player.nickName .." in range of seekers vision radius" )
								-- проверяем прямую видимость
								local ent, pos, normal = TraceLine( shipPos, e:GetPos(),  true )

								if not pos then -- значит ни во что не уперся и дошел до цели
									-- Игрок обнаружен							
									table.insert(detectedPlayers , player )
									sys.log("Player " .. player.nickName .. " was detected by seeker!" ) 
								end
							end
						end
					end
				end
			end
		end
	end
	
	return  detectedPlayers
end

function PvE_ST:SpawnPackOnPoint( packTable, pointPrefix )

	local spawnList = PvE_ST:GetAllEntitiesByPrefix( pointPrefix, "TagPoint" )
	
	local packAvt
	local spawnPos, point, dir, spawn
	if spawnList and #spawnList > 0 then
		
		-- выберем случайный спавн
		spawn = spawnList[ math.random( 1, #spawnList ) ]
		spawnPos = spawn:GetPos()
		dir	= (Vec3( 0, 0, 0 ) - spawnPos):GetNormalized() --:GetDir()

		local pack = designers:AddPack( packTable, spawnPos, ai.RelationshipGroups.Pirate, "pack " .. tostring ( AID.max_packId + 1 ) .." : ", dir) -- в p таблица кораблей (Ent)
		designers:AddPackInAID( pack, packAvt ) -- таблица кораблей и таблица бехевиоров. вносим в систему аид-бехевиаров
		
		-- прописываем ботам список целей
		for _, hunter in pairs ( pack ) do 
			PvE_ST:ChangeBotAgroTable( hunter:GetId(), PvE_ST:DetectedPlayersIdList( ) )
		end 
		
		PvE_ST_StealthParams.BHuntersPack = {}
		
		for _, bot in pairs ( AID.bots ) do 
			if not bot.isDead and bot.stealthTargetId then
				table.insert( PvE_ST_StealthParams.BHuntersPack, bot )
			end 
		end 
		
	else 
		sys.logError("Map has no spawns for hunters!")
	end
	
	-- обнуляем таймер до спавна следующей волны, если за игроками гоняются слишком долго
	PvE_ST_StealthParams.wavesTimer = 0

end

function PvE_ST:GetAllEntitiesByPrefix( prefix, class )
	local aclass = class or "SpawnSpot"
	local i, pid
	local res = {}
	for i, pid in pairs( GetEntitiesByClass( aclass ) ) do
		local name = prefix..i
		if Entities[ name ] then
			table.insert( res, Entities[ name ] )
		end
	end
	return res
end

-- уменьшает тймеры погони на игроках, исключает игроков с истекшим таймером
function PvE_ST:SubChaseTimerOnDetectedPlrs( )

	local PVEchaseTimer = PvE_ST_StealthParams.chaseTimer
	for i, tab in ipairs( PvE_ST_StealthParams.DetectedPlayers ) do 
		playerEnt = Entities[tab.id]
		local cTimer = 0
		
		-- меняем таймер погони игрока
		if playerEnt then 
			if ( playerEnt:CheckAura( ai.Aura.STEALTH ) or playerEnt:CheckAura( ai.Aura.ANTI_RADAR ) ) then 
				cTimer = tab.chaseTimer - PvE_ST_StealthParams.phaseUpdPeriod * PvE_ST_StealthParams.chaseStealthMul
			else 
				cTimer = tab.chaseTimer - PvE_ST_StealthParams.phaseUpdPeriod
			end
		else -- игрок умер или сменил корабль
			cTimer = tab.chaseTimer * PvE_ST:UpdatePlayersShips( i ) - PvE_ST_StealthParams.phaseUpdPeriod
		end
		
		if cTimer > 0 then
			PvE_ST_StealthParams.DetectedPlayers[i].chaseTimer = cTimer
			
			-- отсчет сообщения об уровне погони
			if math.fmod (cTimer, 10) < 2  or cTimer > (PvE_ST_StealthParams.chaseTimer - 3 ) then
				local chaseIntens = math.ceil (cTimer * 100 / PVEchaseTimer) 
				local chaseSting = ""
				
				for _, lvl in pairs( PvE_ST_StealthParams.ChaseIntensLvls ) do
					if chaseIntens < lvl.val then 
						chaseSting = lvl.str
					else
						break
					end
				end
				SV_ShowWowMsg( tab.playerId, chaseSting, false, 297, {}, 3.5 )
			end
			
		else 
			PvE_ST:RemoveTargetIdFromAgroTable( PvE_ST_StealthParams.DetectedPlayers[i].id )
			table.remove (PvE_ST_StealthParams.DetectedPlayers, i)
			SV_ShowWowMsg( tab.playerId, PvE_ST_StealthParams.ChaseOffMessage, true, 300, {}, 4, "sound/ui/apply" ) 
		end
	end
	
	PvE_ST:SubTimerToNextWave()
end

function PvE_ST:IncChaseLevel( )
	PvE_ST_StealthParams.BHuntersPhase = math.min ( (PvE_ST_StealthParams.BHuntersPhase + 1), (#PvE_ST_StealthParams.BHunters) )
	for _, player in ipairs( GetAllPlayersInfo() ) do 
		SV_ShowWowMsg( player.playerId, PvE_ST_StealthParams.ChaseLvlInc, false, 298, {}, 3, "sound/ui/lootScanSuccess" )
	end	
end

-- таймер на прилет следующих мобов, если за игроками гоняются уже долго (но не спавнит если уже достигнута последняя волна)
function PvE_ST:SubTimerToNextWave( )
	if #PvE_ST_StealthParams.DetectedPlayers < 1 then
		PvE_ST_StealthParams.wavesTimer = 0
	elseif PvE_ST_StealthParams.wavesPeriod > 0 and PvE_ST_StealthParams.BHuntersPhase < #PvE_ST_StealthParams.BHunters then
		if PvE_ST_StealthParams.wavesPeriod < PvE_ST_StealthParams.wavesTimer and #PvE_ST_StealthParams.BHuntersPack < 33 then 
		
			PvE_ST:IncChaseLevel( )
			--спавним новый пак с нужной агротаблицей
			PvE_ST:SpawnPackOnPoint( PvE_ST_StealthParams.BHunters[PvE_ST_StealthParams.BHuntersPhase], PvE_ST_StealthParams.BSpawnPrefix )
		else
			-- приближаем время прилета следующих охотников
			PvE_ST_StealthParams.wavesTimer = PvE_ST_StealthParams.wavesTimer + PvE_ST_StealthParams.phaseUpdPeriod
		end
	end
end

function PvE_ST:UpdatePlayersShips( index ) -- обновляет id кораблей обнаруженных игроков на которых они сейчас летают
	local players = GetAllPlayersInfo()
	local playerAlive = 1
	local NeedHuntersUpdate = false 
	for _, player in ipairs ( players ) do 
		if PvE_ST_StealthParams.DetectedPlayers[index].playerId == player.playerId then 
			if Entities[player.entityId] then 
				PvE_ST_StealthParams.DetectedPlayers[index].id = player.entityId
				return playerAlive
			else 
				playerAlive = 0
				return playerAlive
			end
		end
	end
end

function PvE_ST:DetectedPlayersIdList( )
	local res = {}
	for i, tab in ipairs( PvE_ST_StealthParams.DetectedPlayers ) do 
		table.insert( res, tab.id )
	end
	return res
end

-------------
for i, phase in ipairs( PvE_ST_Container.aWaves ) do 

	for j, group in pairs( phase ) do
		for k, mob in ipairs( group ) do 
			if PvE_Func:FindValue( PvE_Missions.stealth.rounds[ 1 ].precache_defs, mob ) == false then
				table.insert( PvE_Missions.stealth.rounds[ 1 ].precache_defs, mob )
			end	
		end	
	end
end

PvE_Missions.stealth.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_Func:SV_GetFinishRewardCoefs( self, roundsFinished )
end

PvE_Missions.stealth.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_Func:GetBaseLootAttempts(self, roundsFinished)
end