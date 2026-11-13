PvE_BB2_H = {}
-- HARD MISSIONS
PvE_Missions.bigship_building_2_hard = 
{
	levelName = "s1550_pve_bigship_building_2",
	scenario_description = { "bigship_building_2_str1", "bigship_building_2_str2", "bigship_building_2_str3" },
	
	need_spawn_warp = true,
	waves_ui_hide = true,

	desc = "",
	resurrection_attempts = 2,
	item_lvl = 28,  -- параметр для начисления награды.
	accountRank = 11,
	rank  = 6,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	disabled = false,
	-- "все корабли почти равны"
	rank_scale_spells = BuffByRankPVE, --BuffByRank,  -- бафф усиляющий корабли низкого ранга против ботов  (ранг боя чит цваром cvars.sv_mmBattleRank =15 при загрузке миссии)
	override_ai_type = ai.Gameplay.TDM,

	turret_health_coef = 8.0,
	turret_damage_coef = 30.0,
	
	squads = {},	-- заполняется скриптом

	HudDialogs = {}, -- заполняется скриптом

	difficulty = "hard",
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			exp_reward_portion = 4,
			cred_reward_portion = 4,
			loot_attempts_reward = 3,
			player_spawn_group = 0,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "pve_bigship_2_r1_rdesc", 
			start_sentence = "CMDR_BLACKWOOD_DEFENCE",

			modifiers =
			{
				{ spell = "Pve_BuffDamage",	caster_group = 1, }, -- 1 players team, AI team Pve_BuffDamage
				{ spell = "Pve_HealHull",	caster_group = 1, }, 
				--{ spell = "Pve_HealShield",	caster_group = 1, }, 
				--{ spell = "Pve_HullResist_Thermal",	caster_group = 2, },
				
			},
			precache_defs = {
			},
			
			start_event = 
			{
			},

			waves =
			{
				[ 1 ] =
				{
					max_agents_at_same_time = 14,
				
					{	def = "Ship_Pirate_Healer_M1_T1", count = 1, spawn_group = 0, spawn_warp = true, delay = 9999, },
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
				[ 7 ] =
					{
						--start_sentence = "CMDR_WAVE_PW_PVE_BOSS",
					},	
            },
		},
		
	},
}


-- T1 Mission
PvE_Missions.bigship_building_2_easy = 
{
	levelName = "s1550_pve_bigship_building_2",
	scenario_description = { "bigship_building_2_str1", "bigship_building_2_str2", "bigship_building_2_str3" },

	need_spawn_warp = true,
	waves_ui_hide = true,
	
	desc = "",
	resurrection_attempts = 5,
	item_lvl = 7, -- параметр для начисления награды.
	accountRank = 7,
	rank  = 1, --PvE_breckets.low[1],  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.low[3],
	bot_difficulty = 0, -- параметр задающий сложность ботов.
	disabled = false,
	override_ai_type = ai.Gameplay.TDM,
	
	turret_health_coef = 0.6,
	turret_damage_coef = 0.5,
	
	squads = {},	-- заполняется скриптом

	HudDialogs = {}, -- заполняется скриптом

	difficulty = "easy",
	override_ai_type = ai.Gameplay.MISSION_SCRIPT,
	event_loot_attempts = 3,
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			exp_reward_portion = 3,
			cred_reward_portion = 3,
			loot_attempts_reward = 4,
			player_spawn_group = 0,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			uiRoundDesc = "pve_bigship_2_r1_rdesc", 
			start_sentence = "CMDR_BLACKWOOD_DEFENCE",

			modifiers =
			{
				{ spell = "Pve_BuffDamage",	caster_group = 1, }, -- 1 players team, AI team Pve_BuffDamage
				{ spell = "Pve_HealHull",	caster_group = 1, }, 
				--{ spell = "Pve_HealShield",	caster_group = 1, }, 
				--{ spell = "Pve_HullResist_Thermal",	caster_group = 2, },
				
			},
			precache_defs = {
				"Bonus_PVE_Heal_S", 
				"Bonus_PVE_Damage_Self", 
				"Bonus_PVE_Shield_S",
				"Bonus_PVE_SpeedUp", 
				"Bonus_PVE_Shield_All", 
				"Bonus_PVE_Heal_All",
			},
			
			start_event = 
			{
			},

			waves =
			{
				[ 1 ] =
				{
					max_agents_at_same_time = 14,
				
					{	def = "Ship_Pirate_Healer_M1_T1", count = 1, spawn_group = 0, spawn_warp = true, delay = 9999, },
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
				[ 7 ] =
					{
						--start_sentence = "CMDR_WAVE_PW_PVE_BOSS",
					},	
            },
		},
		
	},
}




-----------------------------------------------------------------------------------------------------------
-- Контейнер карты, на все миссии
PvE_bb2 = {
	nPhase = 0,	-- это необходимо для запуска настройки
	
	nTier = 0,	-- текущий тир
	
	aMissions = {	-- для автозаполнения squads (до кучи можно там-же и запуск обработчиков наград и самих по-кадровых обработчиков сделать)
		[1] = "bigship_building_2_easy",
		[5] = "bigship_building_2_hard",
	},
	
	nRandomEliteChance = 0.1,	-- вероятность добавления элитного бота/отряда в патрули из списка aRandomSpawn
	cRandomElite = "RandomElite", -- список элитников
	aRandomSpawn = { RandomSpawn = true }, -- в эти патрули может быть добавлен элитник, формат имя = true !
	
	-- таблица патрулей с идентификаторами (крутостью), в каждом могут быть варианты патруля, которые выбираются рандомно
	aPatrols = {
		[1] = {	-- для каждого тека (тира) своя, 
		
			["RandomElite"] = {	-- они добавятся к патрулям типа RandomSpawn во время инициализации патрулей с указанной вероятностью
				{
					{ "Ship_Pirate_Healer_M1_Elite_T1" , Vec3( 0, 0, 0 ) },
				},
				{
					{ "Ship_Pirate_Gravity_M1_Elite_T1" , Vec3( 0, 0, 0 ) },
				},
				-- { -- убираю с т1 ибо итак ни хрена не понятно а тут ещё и интерфейс пропадает #80767
					-- { "Ship_Pirate_Hijack_M1_Elite_T1" , Vec3( 0, 0, 0 ) },
				-- },
				{
					{ "Ship_Flame_Flame_M2_Elite_T1" , Vec3( 0, 0, 0 ) },
				},
			},

			["FinalBoss"] = {
				{
					{ "Ship_Race3_H_T3_M1_T1_Boss" , Vec3( 0, 15, 10 ), },	-- босс теперь первый в патруле отмеченном как босс (в портале)
					{ "Ship_Pirate_Healer_M2_T1" , Vec3( -15, 0, 0 ) },
					{ "Ship_Pirate_DD_M1_T1" , Vec3( -15, 0, 0 ) },
				},
			},
			
			["RandomSpawn"] = {
				{
					{ "Ship_Pirate_Healer_M2_T1" , Vec3( -15, 0, 0 ) },
					{ "Ship_Pirate_Healer_M1_T1" , Vec3( 0, -15, 10 ) },
				},
				
				{
					{ "Ship_Pirate_Tank_M2_T1" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_Tank_M2_T1" , Vec3( -15, 0, 0 ) },	
				},
				
				{
					{ "Ship_Pirate_Debuff_M1_T1" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_Debuff_M2_T1" , Vec3( -15, 0, 0 ) },	
				},
				
				{
					{ "Ship_Pirate_DD_M1_T1" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_DD_M2_T1" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Pirate_Speed_M1_T1" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_Speed_M2_T1" , Vec3( -15, 0, 0 ) },	
				},
				
				{
					{ "Ship_Pirate_Snip_M1_T1" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_Snip_M2_T1" , Vec3( -15, 0, 0 ) },
				},
			},
		},

		[5] = {	-- для каждого тека своя, 
			
			["RandomElite"] = {	-- они добавятся к патрулям типа RandomSpawn во время инициализации патрулей с указанной вероятностью
				{
					{ "Ship_Pirate_Healer_M1_Elite_T3" , Vec3( 0, 0, 0 ) },
				},
				{
					{ "Ship_Pirate_Stealth_M2_Elite_T3" , Vec3( 0, 0, 0 ) },
				},
				{
					{ "Ship_Pirate_Gravity_M1_Elite_T3" , Vec3( 0, 0, 0 ) },
				},
				{
					{ "Ship_Pirate_Hijack_M1_Elite_T3" , Vec3( 0, 0, 0 ) },
				},
				{
					{ "Ship_Flame_Flame_M2_Elite_T3" , Vec3( 0, 0, 0 ) },
				},
			},

			["FinalBoss"] = {
				{
					{ "Ship_Race3_H_T3_M1_T3_Boss" , Vec3( 0, 15, 10 ), },	-- босс теперь первый в патруле отмеченном как босс (в портале)
					{ "Ship_Pirate_Healer_M1_Elite_T3" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_DD_M1_T3" , Vec3( -15, 0, 0 ) },
				},
			},
			
			["RandomSpawn"] = {
				{
					{ "Ship_Pirate_Healer_M2_T3" , Vec3( -15, 0, 0 ) },
					{ "Ship_Pirate_Healer_M1_T3" , Vec3( 0, -15, 10 ) },
				},
				
				{
					{ "Ship_Pirate_Tank_M2_T3" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_Tank_M2_T3" , Vec3( -15, 0, 0 ) },
					{ "Ship_Pirate_Tank_M1_T3" , Vec3( 15, 15, 10 ) },	
				},
				
				{
					{ "Ship_Pirate_Debuff_M1_T3" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_Debuff_M2_T3" , Vec3( -15, 0, 0 ) },	
				},
				
				{
					{ "Ship_Pirate_DD_M1_T3" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_DD_M2_T3" , Vec3( -15, 0, 0 ) },
				},
				
				{
					{ "Ship_Pirate_Speed_M1_T3" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_Speed_M2_T3" , Vec3( -15, 0, 0 ) },	
				},
				
				{
					{ "Ship_Pirate_Snip_M1_T3" , Vec3( 0, 0, 0 ) },
					{ "Ship_Pirate_Snip_M2_T3" , Vec3( -15, 0, 0 ) },
					{ "Ship_Pirate_Snip_M1_T3" , Vec3( 15, 15, 10 ) },	 
				},
			},
		},
	},				
	
	
	-- список порталов, имя должно совпадать с именем портала на карте
	aPortals = {
		[1] = {
			cPortal = "portal_1",
			--- ? тайминги и сами анимации SV_SetActivity( "8", false )
			cSpawn	= "spawn_spot_1",
			cPatrol = "RandomSpawn",	-- идентификатор типа патруля из таблицы aPatrols (если не указано, но есть каргошип - то просто одинокий каргошип)
			nCount = 1,	-- количество вылетов патруля из портала, но можно не указывать, 1 по умолчанию
			--- cargoship =  "PvE_wave_HugeCargo_T0", -- каргошипы не вариативны - но охрана может быть вариативной
			--- route	= "", -- ? дефолтный путь не понятно какой
			--- boss = true, -- не обязательный параметр
			--- relationship_group = 2, -- по умолчанию 2 (враг, ещё варианты: 1-свой ?, 6-алиен)
		},
		
		[2] = {
			cPortal = "portal_2",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_2",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[3] = {
			cPortal = "portal_3",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_3",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		--[[[4] = {
		cPortal = "portal_4",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_4",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[5] = {
		cPortal = "portal_5",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_5",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[6] = {
		cPortal = "portal_6",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_6",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[7] = {
		cPortal = "portal_7",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_7",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[8] = {
		cPortal = "portal_8",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_8",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},]]
		
		[9] = {
			cPortal = "portal_9",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_9",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[10] = {
			cPortal = "portal_10",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_10",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[11] = {
			cPortal = "portal_11",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_11",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[12] = {
			cPortal = "portal_12",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_12",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[13] = {
			cPortal = "portal_13",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_13",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[14] = {
			cPortal = "portal_14",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_14",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[15] = {
			cPortal = "portal_15",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_15",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[16] = {
			cPortal = "portal_16",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_16",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[17] = {
			cPortal = "portal_17",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_17",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[18] = {
			cPortal = "portal_18",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_18",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
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
		
		[21] = {
		cPortal = "portal_21",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_21",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[22] = {
		cPortal = "portal_22",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_22",	--#81115
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[23] = {
		cPortal = "portal_23",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_23",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		--[[[24] = {
			cPortal = "portal_24",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_24",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[25] = {
			cPortal = "portal_25",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_25",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[26] = {
			cPortal = "portal_26",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_26",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[27] = {
			cPortal = "portal_27",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_27",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[28] = {
			cPortal = "portal_28",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_28",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},]]
		
		[29] = {
			cPortal = "portal_29",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_29",
			cPatrol = "RandomSpawn",
			nCount = 1,
		},
		
		[30] = {
			cPortal = "portal_30",
			--- ? тайминги и сами анимации
			cSpawn = "spawn_spot_30",
			cPatrol = "FinalBoss",
			nCount = 1,
			boss = true,	-- скрипт по этому параметру отрабатывает
		},
		
	},
	
	-- волны
	nWaitWaveTime			= 5, -- время между волнами
	nClosePortalTime		= 5, -- время до закрытия портала после появления (у нас все порталы в волнах такие)
	nCurrentWave			= 0, -- номер текущей волны
	nTimerWave				= 0, -- таймер запуска волны
	bChangeWave 			= true, -- для смены волны надо поставить в true и обработчик волн найдёт следующую волну (если есть) и запустит её, для первого запуска тоже надо true
	
	nBotsCountToRespawn 	= 3, -- количество ботов при котором запустится таймер респавна волны (если он указан у волны), этот параметр сделан общим
		
	aWaves = {
		[1] = {
			aMainPortals = {},
			aPortals = {1,2,3,},	-- из них рандомно выберутся
			nMinPortals = 1,
			nMaxPortals = 2,
			nPhase = 1,
			n = 1,
			nCount = 99,	-- сколько раз запустится эта же волна
			nRespawnTimer = 35, --  через какое время будет принудительный респаун, защита от "оставил 1го бота и летаю на расслабоне"
		},
		
		--[[[2] = {
			aMainPortals = {},
			aPortals = {4,5,6,7,8,}, -- из них рандомно выберутся
			nMinPortals = 1,
			nMaxPortals = 2,
			nPhase = 2,
			n = 1,
			nCount = 99,
			nRespawnTimer = 40,
		},]]
		
		[2] = {
			aMainPortals = {},
			aPortals = {9,10,11,12,13,},	-- из них рандомно выберутся
			nMinPortals = 1,
			nMaxPortals = 3,
			nPhase = 2,
			n = 1,
			nCount = 99,
			nRespawnTimer = 45,
		},
		
		[3] = {
			aMainPortals = {},
			aPortals = {14,15,16,17,18,},	-- из них рандомно выберутся
			nMinPortals = 1,
			nMaxPortals = 3,
			nPhase = 3,
			n = 1,
			nCount = 99,
			nRespawnTimer = 55,
		},
		
		[4] = {
			aMainPortals = {},
			aPortals = {19,20,21,22,23,},	-- из них рандомно выберутся
			nMinPortals = 1,
			nMaxPortals = 3,
			nPhase = 4,
			n = 1,
			nCount = 99,
			nRespawnTimer = 65,
		},
		
		--[[[6] = {
			aMainPortals = {},
			aPortals = {24,25,26,27,28,},	-- из них рандомно выберутся
			nMinPortals = 2,
			nMaxPortals = 3,
			nPhase = 6,
			n = 1,
			nCount = 99,
			nRespawnTimer = 40,
		},]]
		
		[5] = { -- BossWave
			aMainPortals = {30,},
			aPortals = {29,},	-- из них рандомно выберутся
			nMinPortals = 1,
			nMaxPortals = 1,
			nPhase = 5,
			n = 1,
			nCount = 1,
		},
		
	},
	
	nWaitEventTime = 5, -- время старта эвента (появления головы) после старта фазы
	nMinRandomEvents = 1, -- во время скриптовой подстановки патрулей к обычным эвентам будут добавлены рандомные (в те фазы, которые это допускают)
	nMaxRandomEvents = 3,
	aEvents = {
		["Antenna"] = {
			nPhaseStart = 3,
			nPhaseEnd	= 4,
			EventTimer 	= 360, 
			EventTargetDefs = {"Beacon_alarm_pve"},
			isStarted	= false,
			isComplete	= false,
			isFailed	= false,
			isEndFail	= true, -- если время эвента вышло а сосотояние эвента не определено, зафейлить эвент (или закомплитить)
			reward 		= 0.1,
			-- тут надо как-то головы описать (не обязательные)
			cDialogOnStart 		= "PvE_Event1S",
			cDialogOnFailed 	= "PvE_Event1F",
			cDialogOnComplit 	= "PvE_Event1C",
			
			nCount	 = 0,	-- внутренняя переменная
			fStart	 = function (self, container, dt, curPhase, nTier, event)
							self.nAntenna = math.random(3)
							local i, pid, p
							for i, pid in pairs( GetEntitiesByClass( "Turret" ) ) do
								p = Entities[pid]:GetName()
								if p == "antenna" then
									self.antenna = Entities[pid]
									self.antenna:FullActivate(true)
								end
							end
							for i, pid in pairs( GetEntitiesByClass( "BaseEntity" ) ) do
								p = Entities[pid]:GetName()
								if p == "Beacon_alarm"..self.nAntenna then
									self.shadow = Entities[pid]
									self.antenna:SetPos(self.shadow:GetPos())
									self.shadow:Remove()
								end
							end
							return true
						end, -- не стандартные действия при запуске эвента
			fUpdate	 = 	function (self, container, dt, curPhase, nTier)
							if self.antenna then
								if self.antenna:GetHealth() <= 0 then
									return true
									
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier, event) end, -- не стандартные действия на окончание времени эвента
		},
	
	},	
	
	aPhases = {
		[1] = { -- фазы обязательно номерованы подряд и не повторяются, иначе надо переделывать награды и возможно местами логику работы!
			-- голова на старте (показывается если прописана, для использования разных голов в зависимости от эвента лучше делать либо разные фазы - либо использовать fStart)
			isStarted	= false,
			cDialogOnStart = "PvE_Phase1", -- при начале фазы покажет голову, а если не указать - то не покажет.
			cDialogAfterStart = "PvE_Phase2",
			nNextPhase	= 2,
			bRandomEvent = true,	-- в этой фазе может запуститься рандомный эвент
			fStart	 =	function (self, container, dt, curPhase, nTier) -- не стандартные действия при запуске фазы
							--PvE_Common:slog("random "..dt*100000)
							math.randomseed(math.floor(dt*100000))
							-- активировать маяк 1 (чужой, который надо захватывать)
								-- ищем на сцене объект по имени и активируем его, логично такой поиск желать 1 раз (сохранить уже прямую ссылку на объект)
							local i, pid, p
							for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
								p = Entities[pid]:GetName()
								if p == "beacon_test1" then
									self.beacon = Entities[pid]
										if not PvE_Mission.aPhases[ curPhase ].tId then
											PvE_Mission.aPhases[ curPhase ].tId = {}
										end
									PvE_Mission.aPhases[ curPhase ].tId[ i ] = pid
									self.beacon:FullActivate(true)
								end
							end
							for i, pid in pairs( GetEntitiesByClass( "BaseEntity" ) ) do
								p = Entities[pid]:GetName()
								if p == "shadow_test1" then
									self.shadow = Entities[pid]
									self.shadow:Remove()
								end
							end
							if not self.beacon then
								PvE_Common:slog("no beacon with name beacon_test1 in phase 1")
							end
							return true
						end,
			fUpdate	 = 	function (self, container, dt, curPhase, nTier) -- проверка окончания фазы (возвращает true если фаза окончена)
							if self.beacon then
								if self.beacon:GetHealth() <= 0 then
									return true
								-- else
									-- PvE_Common:slog("beacon self.beacon:GetRelationshipGroup() = "..self.beacon:GetRelationshipGroup().." health="..self.beacon:GetHealth(), 9 ,50)
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier)
							--self.beacon:FullActivate(false)
						end, -- не стандартные действия на окончание фазы
		},
		
		[2] = {
			-- голова на старте (показывается если прописана, для использования разных голов в зависимости от эвента лучше делать либо разные фазы - либо использовать fStart)
			isStarted	= false,
			cDialogOnStart = "PvE_Phase3",
			cDialogAfterStart = "PvE_Phase4",
			nNextPhase	= 3,
			bRandomEvent = true,	-- в этой фазе может запуститься рандомный эвент
			fStart	 =	function (self, container, dt, curPhase, nTier) -- не стандартные действия при запуске фазы
							-- активировать маяк 1 (чужой, который надо захватывать)
								-- ищем на сцене объект по имени и активируем его, логично такой поиск желать 1 раз (сохранить уже прямую ссылку на объект)
							local i, pid, p
							for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
								p = Entities[pid]:GetName()
								PvE_Mission.aPhases[ curPhase ].tId[ i ] = pid
								if p == "beacon_test3" then
									self.beacon = Entities[pid]
									self.beacon:FullActivate(true)
								end
							end
							for i, pid in pairs( GetEntitiesByClass( "BaseEntity" ) ) do
								p = Entities[pid]:GetName()
								if p == "shadow_test3" then
									self.shadow = Entities[pid]
									self.shadow:Remove()
								end
							end
							if not self.beacon then
								PvE_Common:slog("no beacon with name beacon_test1 in phase 3")
							end
							return true
						end,
			fUpdate	 = 	function (self, container, dt, curPhase, nTier) -- проверка окончания фазы (возвращает true если фаза окончена)
							if self.beacon then
								if self.beacon:GetHealth() <= 0 then
									return true
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier)
							--self.beacon:FullActivate(false)
						end, -- не стандартные действия на окончание фазы
		},
		
		[3] = {
			-- голова на старте (показывается если прописана, для использования разных голов в зависимости от эвента лучше делать либо разные фазы - либо использовать fStart)
			isStarted	= false,
			cDialogOnStart = "PvE_Phase5",
			cDialogAfterStart = "PvE_Phase6",
			nNextPhase	= 4,
			bRandomEvent = false,	-- в этой фазе может запуститься рандомный эвент
			precache_defs = {"Turret_Team2_Pve_AiRailgun_bb2_1", "Turret_Team2_Pve_AiRailgun_bb2_3", "Turret_Team2_Pve_AiRailgun_bb2_5"},
			fStart	 =	function (self, container, dt, curPhase, nTier) -- не стандартные действия при запуске фазы
							-- активировать маяк 1 (чужой, который надо захватывать)
								-- ищем на сцене объект по имени и активируем его, логично такой поиск желать 1 раз (сохранить уже прямую ссылку на объект)
							local i, pid, p
							-- for i, pid in pairs( GetEntitiesByClass( "Turret" ) ) do
								-- p = Entities[pid]:GetName()
								-- if p == "AiRailgun" then
									-- self.beacon = Entities[pid]
									-- self.beacon:FullActivate(true)
								-- end
							-- end
							
							local y = 0
							for i, pid in pairs( GetEntitiesByClass( "BaseEntity" ) ) do
								p = Entities[pid]:GetDefName()
								if p == "Turret_Team2_Pve_AiRailgun_shadow" then
									if y==0 then 
										self.shadow = Entities[pid]
										local pos = self.shadow:GetPos()
										local rot = self.shadow:GetRot()
										self.shadow:SetPos( Vec3(5000,0,0) ) -- хак на случай если Remove плохо синхронизируется по сети
										self.shadow:Remove()
										
										local turret = ai.Spawn("Turret_Team2_Pve_AiRailgun_bb2_"..nTier)
										turret:SetPos(pos)
										turret:SetRot(rot)
										--Entities[pid]:FullActivate(true)
									end
									y = y + 1
									if y>2 then y=0 end
								end
							end
							
							local i, pid, p
							for i, pid in pairs( GetEntitiesByClass( "Turret" ) ) do
								p = Entities[pid]:GetName()
								if p == "Turret_Beacon_bb21" then
									PvE_Mission.aPhases[ curPhase ].tId[ i ] = pid
									self.beacon = Entities[pid]
									self.beacon:FullActivate(true)
								end
							end
							for i, pid in pairs( GetEntitiesByClass( "BaseEntity" ) ) do
								p = Entities[pid]:GetDefName()
								if p == "Beacon_alarm_pve_2_shadow" then
									self.shadow = Entities[pid]
									self.shadow:Remove()
								end
							end
							if not self.beacon then
								PvE_Common:slog("no beacon with name TowerStation1 in phase 4")
							end

							-- надо двигать SpawnTeam1_1 на место SpawnTeam1_3 (SpawnSpot) после 3й волны
							sys.log( "--- Spawn move...")
							-- local as = {}
							-- local i, pid, p
							
							-- -- пробегаем по спавнам
							-- for i, pid in pairs( GetEntitiesByClass( "SpawnSpot" ) ) do
								-- p = Entities[pid]:GetName()
								-- as[p] = pid
								-- --sys.log( "--- Spawn:"..p)
							-- end
							
							-- if as["SpawnTeam1_1"] and as["SpawnTeam1_3"] then
								-- Entities[as["SpawnTeam1_1"]]:SetPos(Entities[as["SpawnTeam1_3"]]:GetPos())
								-- Entities[as["SpawnTeam1_1"]]:SetRot(Entities[as["SpawnTeam1_3"]]:GetRot())
								-- sys.log( "--- Spawn moved")
							-- else
								-- sys.log( "--- Spawn not found")
							-- end
							SV_Pve_SetSpawnGroup( 1 )
							
							return true
						end,
			fUpdate	 = 	function (self, container, dt, curPhase, nTier) -- проверка окончания фазы (возвращает true если фаза окончена)
							if self.beacon then
								if self.beacon:GetHealth() <= 0 then
									return true
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier)
							--self.beacon:FullActivate(false)
						end, -- не стандартные действия на окончание фазы
		},
		
		[4] = {
			-- голова на старте (показывается если прописана, для использования разных голов в зависимости от эвента лучше делать либо разные фазы - либо использовать fStart)
			isStarted	= false,
			cDialogOnStart = "PvE_Phase7",
			cDialogAfterStart = "PvE_Phase8", 
			nNextPhase	= 5,
			bRandomEvent = true,
			fStart	 =	function (self, container, dt, curPhase, nTier) -- не стандартные действия при запуске фазы
							-- активировать маяк 1 (чужой, который надо захватывать)
								-- ищем на сцене объект по имени и активируем его, логично такой поиск желать 1 раз (сохранить уже прямую ссылку на объект)
							local i, pid, p
							for i, pid in pairs( GetEntitiesByClass( "Turret" ) ) do
								p = Entities[pid]:GetName()
								if p == "Turret_Beacon_bb22" then
									PvE_Mission.aPhases[ curPhase ].tId[ i ] = pid
									self.beacon = Entities[pid]
									self.beacon:FullActivate(true)
								end
							end
							for i, pid in pairs( GetEntitiesByClass( "BaseEntity" ) ) do
								p = Entities[pid]:GetDefName()
								if p == "Beacon_alarm_pve_2_shadow" then
									self.shadow = Entities[pid]
									self.shadow:Remove()
								end
							end
							if not self.beacon then
								PvE_Common:slog("no beacon with name TowerStation2 in phase 5")
							end
							return true
						end,
			fUpdate	 = 	function (self, container, dt, curPhase, nTier) -- проверка окончания фазы (возвращает true если фаза окончена)
							if self.beacon then
								if self.beacon:GetHealth() <= 0 then
									return true
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier)
							--self.beacon:FullActivate(false)
						end, -- не стандартные действия на окончание фазы
		},
		
		[5] = {
			-- голова на старте (показывается если прописана, для использования разных голов в зависимости от эвента лучше делать либо разные фазы - либо использовать fStart)
			isStarted	= false,
			cDialogOnStart = "PvE_Phase9",
			cDialogAfterStart = "PvE_Phase10",
			--nNextPhase	= 6,
			bRandomEvent = true,
			fStart	 =	function (self, container, dt, curPhase, nTier) -- не стандартные действия при запуске фазы
							self.boss = nil
							-- тут надо проверить эвент Антенна и если он выполнен - убрать лишний портал у волны
							if container.aEvents["Antenna"].isComplete then
								container.aWaves[5].nMinPortals = 0
								container.aWaves[5].nMaxPortals = 0
							end
							return true
						end,
			fUpdate	 = 	function (self, container, dt, curPhase, nTier) -- проверка окончания фазы (возвращает true если фаза окончена)
							local i, pid, p
							
							if not self.boss then
								for i, pid in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
									p = Entities[pid]:GetDefName()
									if p == "Ship_Race3_H_T3_M1_T1_Boss" or p == "Ship_Race3_H_T3_M1_T2_Boss" or p == "Ship_Race3_H_T3_M1_T3_Boss" then -- все теки надо учитывать
										self.boss = pid -- запоминать можно только id, никаких энтити
										PvE_Mission.aPhases[ curPhase ].tId[ i ] = pid
									end
								end
							end
							
							if self.boss then
								if not Entities[self.boss] or Entities[self.boss]:IsDead() then
									--return 1, ai.WinReason.PVE_MISSION_COMPLETE это должен OnUpdateRound вернуть
									return true
								end
							end
						end,
			fEnd	 = function (self, container, dt, curPhase, nTier)
							--self.beacon:FullActivate(false)
							PvE_Common.nWinCommand = 1	-- игроки победили, обарабатывается в base.lua PvE_Common.OnUpdateRound
							PvE_Common.nWinReason = ai.WinReason.PVE_MISSION_COMPLETE
						end, -- не стандартные действия на окончание фазы
		},
		
	},
	
	-- для всего этого надо заложить диалоги, по порядку, хотя и не все могут быть задействованы в конкретной миссии
	-- PvE_Phase0					= { hud_dialog = 0, },
	-- PvE_Phase1					= { hud_dialog = 1, },
	-- PvE_Phase2					= { hud_dialog = 2, },
	-- PvE_Phase3					= { hud_dialog = 3, },
	-- PvE_Phase4					= { hud_dialog = 4, },
	-- PvE_Phase5					= { hud_dialog = 5, },
	-- PvE_Phase6					= { hud_dialog = 6, },
	-- PvE_Phase7					= { hud_dialog = 7, },
	-- PvE_Phase8					= { hud_dialog = 8, },
	-- PvE_Phase9					= { hud_dialog = 9, },
	-- PvE_Phase10					= { hud_dialog = 10, },

	-- PvE_Event1S					= { hud_dialog = 11, },
	-- PvE_Event1F					= { hud_dialog = 12, },
	-- PvE_Event1C					= { hud_dialog = 13, },
	-- PvE_Event2S					= { hud_dialog = 14, },
	-- PvE_Event2F					= { hud_dialog = 15, },
	-- PvE_Event2C					= { hud_dialog = 16, },
	-- PvE_Event3S					= { hud_dialog = 17, },
	-- PvE_Event3F					= { hud_dialog = 18, },
	-- PvE_Event3C					= { hud_dialog = 19, },
	-- PvE_Event4S					= { hud_dialog = 20, },
	-- PvE_Event4F					= { hud_dialog = 21, },
	-- PvE_Event4C					= { hud_dialog = 22, },
	-- PvE_Event5S					= { hud_dialog = 23, },
	-- PvE_Event5F					= { hud_dialog = 24, },
	-- PvE_Event5C					= { hud_dialog = 25, },

	--PvE_RandomEvent1S			= { hud_dialog = 26,	priority = 40, },
	--PvE_RandomEvent1F			= { hud_dialog = 27,	priority = 30, },
	--PvE_RandomEvent1C			= { hud_dialog = 28,	priority = 20, },
	--PvE_RandomEvent2S			= { hud_dialog = 29,	priority = 40, },
	--PvE_RandomEvent2F			= { hud_dialog = 30,	priority = 30, },
	--PvE_RandomEvent2C			= { hud_dialog = 31,	priority = 20, },
	--PvE_RandomEvent3S			= { hud_dialog = 32,	priority = 40, },
	--PvE_RandomEvent3F			= { hud_dialog = 33,	priority = 30, },
	--PvE_RandomEvent3C			= { hud_dialog = 34,	priority = 20, },
	--PvE_RandomEvent4S			= { hud_dialog = 35,	priority = 40, },
	--PvE_RandomEvent4F			= { hud_dialog = 36,	priority = 30, },
	--PvE_RandomEvent4C			= { hud_dialog = 37,	priority = 20, },
	--PvE_RandomEvent5S			= { hud_dialog = 38,	priority = 40, },
	--PvE_RandomEvent5F			= { hud_dialog = 39,	priority = 30, },
	--PvE_RandomEvent5C			= { hud_dialog = 40,	priority = 20, },
	--PvE_RandomEvent6S			= { hud_dialog = 41,	priority = 40, },
	--PvE_RandomEvent6F			= { hud_dialog = 42,	priority = 30, },
	--PvE_RandomEvent6C			= { hud_dialog = 43,	priority = 20, },
	--PvE_RandomEvent7S			= { hud_dialog = 44,	priority = 40, },
	--PvE_RandomEvent7F			= { hud_dialog = 45,	priority = 30, },
	--PvE_RandomEvent7C			= { hud_dialog = 46,	priority = 20, },
	--PvE_RandomEvent8S			= { hud_dialog = 47,	priority = 40, },
	--PvE_RandomEvent8F			= { hud_dialog = 48,	priority = 30, },
	--PvE_RandomEvent8C			= { hud_dialog = 49,	priority = 20, },
	--PvE_RandomEvent9S			= { hud_dialog = 50,	priority = 40, },
	--PvE_RandomEvent9F			= { hud_dialog = 51,	priority = 30, },
	--PvE_RandomEvent9C			= { hud_dialog = 52,	priority = 20, },
	--PvE_RandomEvent10S			= { hud_dialog = 53,	priority = 40, },
	--PvE_RandomEvent10F			= { hud_dialog = 54,	priority = 30, },
	--PvE_RandomEvent10C			= { hud_dialog = 55,	priority = 20, },
	
	-- тут с Нулевой (0) - это важно, но при этом нулевая - всегда пустая, чтобы не допускать разногласий в номере фазы и диалога.
	HudDialogs = 
	{
		{
			{ character = "mercenary", text = "pve_wave_planet_war_phase_0", }, -- всегда пусто
		},	
		{
			{ character = "mercenary", text = "pve_wave_planet_war_phase_1", }, -- 1
		},		
		{
			{ character = "mercenary", text = "pve_wave_planet_war_phase_2", }, -- 2
		},	
		{
			{ character = "pve_coordinator", text = "pve_wave_planet_war_phase_3", }, -- 3
		},
		{
			{ character = "mercenary", text = "pve_wave_planet_war_phase_4", }, -- 4
		},	
		{
			{ character = "pve_coordinator", text = "pve_wave_planet_war_phase_5", }, -- 5
		},	
		{
			{ character = "mercenary", text = "pve_wave_planet_war_phase_6", }, -- 6
		},	
		{
			{ character = "mercenary", text = "pve_wave_planet_war_phase_7", }, -- 7
		},			
		{
			{ character = "pve_coordinator", text = "pve_wave_planet_war_phase_8", }, -- 8
		},			
		{
			{ character = "pve_coordinator", text = "pve_wave_planet_war_phase_9", }, -- 9
		},			
		{
			{ character = "mercenary", text = "pve_wave_planet_war_phase_10", }, -- 10
		},			

		
		
		{
			{ character = "mercenary", text = "pve_wave_planet_war_phase_11", }, -- 11s
		},			
		{
			{ character = "pve_coordinator", text = "pve_wave_planet_war_phase_12", }, -- 12f
		},			
		{
			{ character = "pve_coordinator", text = "pve_wave_planet_war_phase_13", }, -- 13c
		},			
		
		
		
		
	--порядковые заглушки
		
		{
			{ character = "general_soldier", text = "pve_wave_planet_war_phase_14", }, -- 11s
		},			
		{
			{ character = "jericho_officer", text = "pve_wave_planet_war_phase_15", }, -- 12f
		},			
		{
			{ character = "jericho_officer", text = "pve_wave_planet_war_phase_16", }, -- 13c
		},
		{
			{ character = "general_soldier", text = "pve_wave_planet_war_phase_17", }, -- 11s
		},			
		{
			{ character = "jericho_officer", text = "pve_wave_planet_war_phase_18", }, -- 12f
		},			
		{
			{ character = "jericho_officer", text = "pve_wave_planet_war_phase_19", }, -- 13c
		},	
		{
			{ character = "general_soldier", text = "pve_wave_planet_war_phase_20", }, -- 11s
		},			
		{
			{ character = "jericho_officer", text = "pve_wave_planet_war_phase_21", }, -- 12f
		},			
		{
			{ character = "jericho_officer", text = "pve_wave_planet_war_phase_22", }, -- 13c
		},
		{
			{ character = "general_soldier", text = "pve_wave_planet_war_phase_23", }, -- 11s
		},			
		{
			{ character = "jericho_officer", text = "pve_wave_planet_war_phase_24", }, -- 12f
		},			
		{
			{ character = "jericho_officer", text = "pve_wave_planet_war_phase_25", }, -- 13c
		},			
		
		
		-- дополнительные эвенты
		-- сбор самоуничтожающихся контейнеров
		
		{
			{ character = "pve_briggs", text = "pve_wave_planet_war_phase_26", }, -- 14s
		},			
		{
			{ character = "pve_briggs", text = "pve_wave_planet_war_phase_27", }, -- 15f
		},			
		{
			{ character = "pve_briggs", text = "pve_wave_planet_war_phase_28", }, -- 16c
		},	
		
		--эвент уничтожение маяка (глушилки)
		{
			{ character = "umc_dispatch", text = "pve_wave_planet_war_phase_29", }, -- 14s
		},			
		{
			{ character = "umc_dispatch", text = "pve_wave_planet_war_phase_30", }, -- 15f
		},			
		{
			{ character = "umc_dispatch", text = "pve_wave_planet_war_phase_31", }, -- 16c
		},	
		
		--эвент уничтожение вражеского босса (аддишионал)
		{
			{ character = "jer_captain", text = "pve_wave_planet_war_phase_32", }, -- 14s
		},			
		{
			{ character = "jer_captain", text = "pve_wave_planet_war_phase_33", }, -- 15f
		},			
		{
			{ character = "jer_captain", text = "pve_wave_planet_war_phase_34", }, -- 16c
		},
		
		--эвент на кристаллидов (2 мини босса - они бьют всех)
		{
			{ character = "scientist", text = "pve_wave_planet_war_phase_35", }, -- 14s
		},			
		{
			{ character = "sch_crystallid", text = "pve_wave_planet_war_phase_36", }, -- 15f
		},			
		{
			{ character = "sch_crystallid", text = "pve_wave_planet_war_phase_37", }, -- 16c
		},
		
		--эвент на уничтожение отряда сбежавших иерихонцев
		{
			{ character = "jer_major", text = "pve_wave_planet_war_phase_38", }, -- 14s
		},			
		{
			{ character = "jer_captain", text = "pve_wave_planet_war_phase_39", }, -- 15f
		},			
		{
			{ character = "jer_captain", text = "pve_wave_planet_war_phase_40", }, -- 16c
		},
		
		--эвент на уничтожение отряда алиенов (бьют всех)
		{
			{ character = "sch_crystallid", text = "pve_wave_planet_war_phase_41", }, -- 14s
		},			
		{
			{ character = "sch_crystallid", text = "pve_wave_planet_war_phase_42", }, -- 15f
		},			
		{
			{ character = "sch_crystallid", text = "pve_wave_planet_war_phase_43", }, -- 16c
		},
		
		--эвакуация тела с поля боя
		{
			{ character = "emp_captain", text = "pve_wave_planet_war_phase_44", }, -- 14s
		},			
		{
			{ character = "emp_captain", text = "pve_wave_planet_war_phase_45", }, -- 15f
		},			
		{
			{ character = "emp_captain", text = "pve_wave_planet_war_phase_46", }, -- 16c
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
	
	-- награда в луте только при победе, в серебре = пройденные фазы и евенты / их общее количество
	-- #75563 теперь 70% за все фазы и по 10% за эвент c долей награды 1 - максимум 30%
	SV_GetFinishRewardCoefs = function (self, nTier, roundsFinished)
		local nPhaseComplete = 0
		local nEventReward = 0
		--local nCount = #self.aPhases
		local nRes = 0
		
		PvE_Common:slog( "================SV_GetFinishRewardCoefs(self, nTier) nTier = " .. nTier .. ", roundsFinished = " .. roundsFinished )
		if roundsFinished > 0 then	-- победа, награда за все фазы
			nPhaseComplete = #self.aPhases
		else
			if self.nPhaseComplete then -- пройденные фазы
				nPhaseComplete = self.nPhaseComplete	-- заполняется автоматически при выполнении условий завершения фазы, так что читами даже не проверить
			end
		end
		
		local cEvent, dEvent
		for cEvent, dEvent in pairs(self.aEvents) do
			if dEvent.reward then -- считаем только рандомные эвенты (по крайней мере у них награда явно должна быть, хотя как пропишем)
				--nCount = nCount + dEvent.reward
				if dEvent.isComplete then -- + пройденные эвенты
					nEventReward = nEventReward + dEvent.reward
				end
			end
		end
		
		--if nCount > 0 then
			nRes = math.min( 1, 0.6 * (nPhaseComplete/#self.aPhases) + nEventReward) -- #75581
			nRes = math.max( 0, nRes )
		--end
		
		PvE_Common:slog( "================ nRes*100 = " .. nRes*100 .. ", nPhaseComplete = " .. nPhaseComplete .. ", nEventReward = " .. nEventReward)	-- .. ", nCount = " .. nCount )
		
		-- #75358 увиличиваем награду елси долго мучались >6 мин, по 10% минута, но максимум х2
		local k = 1 --+ math.max(0, math.min(PvE_Common.nPvETimer - 60*6, 60*10)) / 600
		-- if nTier > 1 then
			-- k = k * 1.5 --#79539
		-- end
		PvE_Common:slog( "================ k*100 = "..k*100 ) 
		
		return nRes*k, nRes*k--, nRes*k
	end,
	
	
	SV_GetBaseLootAttempts = function (self, nTier, roundsFinished)
		local nPhaseComplete = 0
		local nCount = #self.aPhases
		local nRes = 0
		
		PvE_Common:slog( "================SV_GetBaseLootAttempts(self, nTier) nTier = " .. nTier .. ", roundsFinished = " .. roundsFinished )
		if roundsFinished > 0 then	-- победа, награда за все фазы
			nPhaseComplete = #self.aPhases
		else
			if self.nPhaseComplete then -- пройденные фазы
				nPhaseComplete = self.nPhaseComplete	-- заполняется автоматически при выполнении условий завершения фазы, так что читами даже не проверить
			end
		end
		
		if nCount > 0 then
			nRes = math.min( 1, nPhaseComplete / nCount )
			nRes = math.max( 0, nRes )
		end
		
		PvE_Common:slog( "================ nRes*100 = " .. nRes*100 .. ", nPhaseComplete = " .. nPhaseComplete .. ", nCount = " .. nCount )

		return math.floor(4 * nRes)
	end,

}


	-- кастомные эвенты, следует вставить в код позже

-----------------------------------------------------------------------------------------------------------
-- функция заполняет сквады и организует запуск OnUpdateRound которая уже вызывается каждый кадр, пока миссия активна(когда геймплей активен, после финиша не вызывается).
PvE_Common:SetSquads(PvE_bb2)

PvE_BB2_H.aWaves = {}

PvE_BB2_H.aWaves.easy = 
{
	[ 1 ] = 
		{
			MeatBots_t1 = { },	
			MeatBots_t2 = { },	
			EliteBots = { },
			Executor = {}, 
		},
	[ 2 ] = 
		{
			MeatBots_t1 = { },	
			MeatBots_t2 = { },	
			EliteBots = { },
			Executor = {}, 
		},
	[ 3 ] = 
		{
			MeatBots_t1 = { },	
			MeatBots_t2 = { },	
			EliteBots = { },
			Executor = {}, 
		},
	[ 4 ] = 
		{
			MeatBots_t1 = { },	
			MeatBots_t2 = { },	
			EliteBots = { },
			Executor = {}, 
		},
	[ 5 ] = 
		{
			MeatBots_t1 = { },	
			MeatBots_t2 = { },	
			EliteBots = { },
			Executor = {}, 
		},
}