--Константы дизайнеров для ОМ 3.0
-- ----------------------------------------------------------------------------
if not designers then	--guard	
	-- ----------------------------------------------------------------------------
	-- TODO comment this
	designers = {}
end


designers.EventsConst = {
	-- места спавна
	[ "Gate" ] 				= 1,  -- любые ворота  все энтити класса "JumpDockLocation"  + все базе_ентити с  "JumpGate" в имени
	[ "NearPlayer" ] 		= 2, --!!! не реализовано
	[ "NearAnyPlayer" ] 	= 3,
	[ "AwayGate" ] 			= 4, -- "далекие" ворота 
	[ "AwayWayPoint" ] 		= 5, -- "далекая" точка на случайном пути 
	[ "RideWay" ]			= 6,  --  Специально подготовленный "вей" под гонки
	[ "AnyBigSpace" ]		= 7, -- любое большое пространство
	[ "AnyPlatform" ]		= 8, -- свободная плоскость Mission.map.platformSpace, { pos = pos, normal = normal, normal_gun = vecs.tmp1:GetNormalized(), material = material, } )
	[ "AnyRockPlatform" ]	= 9, -- свободная плоскость Mission.map.platformSpace, { pos = pos, normal = normal, normal_gun = vecs.tmp1:GetNormalized(), material = "Rock", } )
	[ "AnyPathStart" ]		= 10, -- начало случайного пути длиннее 5 точек
	[ "OwnerStationPos" ]	= 11, -- место под станцию
	[ "OwnerStationHangar" ]= 12, -- место где рождаются корабли владельцев
	[ "AttackerStationPos" ]= 13, -- место под станцию нападающей стороны
	[ "AttackerStationHangar" ]= 14, -- место где рождаются корабли владельцев
	[ "PirateSpawn" ]		= 15,  -- Spawn локации которые начинаются с pirate_spawn    и лежат в  Mission.map.spawnPirates
	[ "AnyNearBigSpace" ]	= 16, -- большое пространство рядом с целью ()
	[ "ShortPathStart" ]	= 17, -- самый короткий из " [ "AnyPathStart" ]		= 10, -- начало случайного пути  (5+)"
	[ "LongPathStart" ]		= 18, -- самый длинный из " [ "AnyPathStart" ]		= 10, -- начало случайного пути "
	[ "AwayBasesGate" ]		= 19, -- "далекие" ворота  "от всех баз"(если есть) (4км), если условие не выполняется, то случайные ворота
	--[ "AllyStationPos" ]	= 20, -- союзная станция
	--[ "AllyStationHangar" ]	= 21, -- место где рождаются корабли союзная станция
	--[ "EnemyStationPos" ]	= 22, -- вражеская станция
	--[ "EnemyStationHangar" ]= 23, -- место где рождаются корабли вражеская станция
	[ "FactionStationPos" ]	= 24, -- 
	[ "FactionStationHangar" ]	= 25, -- 
	[ "AlienStationPos" ]	= 26, -- 
	[ "AlienStationHangar" ]= 27, -- 
	[ "PirateStationPos" ]	= 28, -- 
	[ "PirateStationHangar" ]= 29, -- 
	[ "NearestPoint" ]		= 30,
	 
	[ "TargetPlayerRandom" ]= 100, -- цель эвента( не используется как позиция ) -- любой игрок 
	
	-- тип эвента (алгоритм обработки)
--	[ "Boss" ] = 100,
	[ "Ride" ] = 1001,
--	[ "WaveDefend" ] = 102,
--	[ "Common" ] = 103, -- что то вроде случайного дрона
}

designers.DialogType =
{
	ALL  					= 1,
	ALL_IN_RADIUS 			= 2,
	CURRENT_PLAYER			= 3, -- участник события
	ALL_FRIENDLY			= 4,
	ALL_FRIENDLY_IN_RADIUS	= 5,
	WINNER_NUMBER			= 6,
	PLAYER_WITH_POINTS		= 7,
}

designers.loyality_names = 
{
	[0] = "empire_loyality_name", 
	[1] = "fed_loyality_name",
	[2] = "jer_loyality_name",
	[3] = "crystal_loyality_name",
	[4] = "pirate_loyality_name",
}

designers.loyality_params =
{
	min = -100000,
	max = 600000,
	
	factions_default	= 10000,
	pirate_default		= -10000,
	green_default		= -100000,
	
	relationships_update_timer	= 5,
	
	loyalty_reward_change			= -50,
	loyalty_reward_kill				= -125,
	loyalty_reward_kill_enemy		= 75,
	
	no_police_level		= 5,
}

designers.loyality_levels = 
{
	{ min_loyalty = nil,		bonus = -1,		relationship = 2,	}, -- LVL1, ENEMY, DEFAULT
	{ min_loyalty = -20000,		bonus = -0.5,	relationship = 2,	}, -- LVL2, ENEMY
	{ min_loyalty = 0,			bonus = 0,		relationship = 1,	}, -- LVL3, NEUTRAL
	{ min_loyalty = 10000,		bonus = 0.2,	relationship = 1,	}, -- LVL4, NEUTRAL
	{ min_loyalty = 100000,		bonus = 0.6,	relationship = 0,	}, -- LVL5, FRIEND
	{ min_loyalty = 300000,		bonus = 1,		relationship = 0,	}, -- LVL6, FRIEND
}

designers.factions_params =
{
	[ 0 ] =	{ rel_group = 17,	enemies = { 4, }, 			}, -- Empire
	[ 1 ] =	{ rel_group = 18,	enemies = { 4, }, 			}, -- Federation
	[ 2 ] =	{ rel_group = 19,	enemies = { 4, }, 			}, -- Jericho
	[ 3 ] =	{ rel_group = 21,	enemies = { 0, 1, 2, 4 },	}, -- Cyber2
	[ 4 ] =	{ rel_group = 20,	enemies = { 0, 1, 2, },		}, -- Enclave
}

designers.LootByTag = 
{
	[ "piratElite" ] = { 
		{ loot = "LootCrate_OW3_GoodMetalJunk", chance = 0.15 }, -- когда умрет корабль с тагом пират( piratElite ) создастся лут из этого сета с вероятностью 
		{ loot = "LootCrate_autogen_rnd_poor_18", chance = 0.2 },  
		{ loot = "LootCrate_autogen_BALANCED_18", chance = 0.03 },
	},
	[ "pirat" ] = { 
		{ loot = "LootCrate_OW3_PoorMetalJunk", chance = 0.2 },  --
		{ loot = "LootCrate_NewWeapons20", chance = 0.05 },  --
		{ loot = "LootCrate_autogen_rnd_poor_13", chance = 0.05 },  -- дебаг
		{ loot = "LootCrate_autogen_BALANCED_5", chance = 0.1 }, 
	},
	[ "npc" ] = { 
		{ loot = "LootCrate_OW3_PoorMetalJunk", chance = 0.2 },  --
	},
	[ "invader" ] = {  -- киберы в рамках эвента
		{ loot = "LootCrate_NewWeapons20", chance = 0.03 },  --
		{ loot = "LootCrate_autogen_rnd_poor_13", chance = 0.01 },  -- дебаг
	},
	
	[ "cyberElite" ] = { -- киберы в рамках эвента
		{ loot = "LootCrate_autogen_BALANCED_18", chance = 0.01 },  -- дебаг
	},
	
	[ "boss" ] = {  -- любые боссы
		{ loot = "LootCrate_NewWeapons20", chance = 0.5 },  
		{ loot = "LootCrate_TornadoModules", chance = 0.05 },
	},
	
	[ "alienMeat" ] = {  -- алиены в рамках эвента
		{ loot = "LootCrate_autogen_BALANCED_5", chance = 0.05 },  
	},

	[ "alienElite" ] = {  -- алиены в рамках эвента
		{ loot = "LootCrate_autogen_rnd_poor_18", chance = 0.05 },  
	}, 
}

if not ( UI and UI.scriptedChatMsgTypes ) then
	if not UI then
		UI = {}
	end
	UI.scriptedChatMsgTypes =
	{
		REWARD = 1,
		EVENT = 2,
	}
end 

designers.StarSettings = {
												-- * - 1 звезда за криминал
	{ timeout = 3 * 60	, karmaChange = -30, },	--** - за падение кармы на 30+ за следующую 3 минуту
	{ timeout = 3 * 60	, karmaChange = -50, 	events = { [0] = {"Police_empRaid2"}, [1] = {"Police_fedRaid2"}, [2] = {"Police_jerRaid2"}, }, },	--*** - за падение кармы на 50+ за следующую 3 минуту
	{ timeout = 5 * 60	, karmaChange = -70, 	events = { [0] = {"Police_empRaid3"}, [1] = {"Police_fedRaid3"}, [2] = {"Police_jerRaid3"}, }, },	--**** - за падение кармы на 70+ за следующие 5 минуты
	{ timeout = 10 * 60	, karmaChange = -120, 	events = { [0] = {"Police_empRaid4"}, [1] = {"Police_fedRaid4"}, [2] = {"Police_jerRaid4"}, }, },	--***** - за падение кармы на 120+ за следующие 10 минуты
	{ timeout = 10 * 60	, 						events = { [0] = {"Police_empRaid5"}, [1] = {"Police_fedRaid5"}, [2] = {"Police_jerRaid5"}, }, }, -- c 5 звезд выше не идем , но после таймаута теряем все, если карма не поменялась
}

