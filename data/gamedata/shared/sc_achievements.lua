
Achievements = {}

-- ВНИМАНИЕ! Получение ачивментов можно ограничивать по геймплеям с помощью параметра 'gameplays'.
-- Значения брать из ai.GameplayMask в constants.lua
-- Если параметр не указан, ачивмент можно получить в любом геймплее, за исключением тренировочных/обучающих.

-- ВНИМАНИЕ! Возможные значения для параметра value_type:
-- ai.AchievementValueType = 
-- {
-- 	CUMULATIVE	= 1, -- накопительное - прогресс ачивки сдвигается вперед каждый раз, когда совершается требуемое действие
-- 	HIGHEST		= 2, -- наибольшее ("рекорд") - прогресс ачивки сдвигается вперед только когда побит предыдущий результат по требуемоему действию
-- 	LIST		= 3, -- список (максимум 32 элемента) - прогресс ачивки сдвигается вперед каждый раз, когда выполняется одно из требуемых действий
-- }

-- Активные геймплеи:
-- ai.Gameplay.CAPTURE_THE_BASE
-- ai.Gameplay.CONTROL, ai.Gameplay.SENTINEL, ai.Gameplay.KING_OF_THE_HILL, ai.Gameplay.BOMB_THE_BASE 
-- ai.Gameplay.PVE_MISSION, ai.Gameplay.FREE_SPACE
--- ai.Gameplay.CLANSHIP, CAPTURE_THE_BASE_2

--coop_vs_ai = false, -- ачивку нельзя получить в режиме "Против ИИ"



Achievements[ ai.AchievementId.FLEET ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= { ai.Gameplay.CAPTURE_THE_BASE, },
	
	numerical_conditions = 
	{
		{
			-- сколько процентов маяка должен игрок "снять", чтобы захват засчитался
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 1.0,
		},
		
		{
			-- сколько маяков нужно захватить описанным в numerical_conditions[1] способом
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 3,
		},
	},
	
	ranks = 
	{
		{
			steam_id	= "ACHIEV_FLEET_R1",
			points		= 10,
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[2]
		},
	},
}

Achievements[ ai.AchievementId.BERSERK ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= ai.GameplayGroups.pvp,

	numerical_conditions = 
	{
		{
			-- сколько процентов от общего дамага команды нужно нанести
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 0.5,
		},
		
		{
			-- сколько игроков (не ботов) должно быть в команде игрока, включая его самого
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 4,
		}
	},
	
	ranks = 
	{
		{
			steam_id	= "ACHIEV_BERSERK_R1",
			points		= 10,
			value 		= 1, -- сколько боев нужно сыграть с условиями в numerical_conditions
			reward_title = PlayerTitleId.BERSERK,
		},
	},
}

Achievements[ ai.AchievementId.BLITZ ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= 	{ ai.Gameplay.CAPTURE_THE_BASE, },

	numerical_conditions = 
	{
		{
			-- за сколько секунд нужно выиграть
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= 180,
		}
	},
	
	ranks = 
	{
		{
			steam_id	= "ACHIEV_BLITZ_R1",
			points		= 10,
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
		},
	},
}

Achievements[ ai.AchievementId.FLAWLESS_VICTORY ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	numerical_conditions = 
	{
		{
			-- сколько раз можно умереть в бою
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= 0,
		},
	},
	
	ranks = 
	{
		{
			steam_id	= "ACHIEV_FLAWLESS_VICTORY_R1",
			points		= 10,
			value 		= 1, -- сколько боев нужно провести с выполнением условия в numerical_conditions[1]
		},
	},
}

Achievements[ ai.AchievementId.SET_TOGETHER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= { ai.Gameplay.CAPTURE_THE_BASE, },

	ranks = 
	{
		{
			steam_id	= "ACHIEV_SET_TOGETHER_R1",
			points		= 10,
			value 		= 1,
		},
	},
}

Achievements[ ai.AchievementId.DAMAGE_DEALER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "WEAPON",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,

	ranks = 
	{
		{
			steam_id	= "ACHIEV_DAMAGE_DEALER_R1",
			points		= 10,
			value 		= 100000,
		},
		
		{
			steam_id	= "ACHIEV_DAMAGE_DEALER_R2",
			points		= 10,
			value 		= 1000000,
		},
		
		{
			steam_id	= "ACHIEV_DAMAGE_DEALER_R3",
			points		= 20,
			value 		= 5000000,
		},
		
		{
			steam_id	= "ACHIEV_DAMAGE_DEALER_R4",
			points		= 30,
			value 		= 20000000,
			reward_title = PlayerTitleId.DAMAGE_DEALER,
		},
	},
}

Achievements[ ai.AchievementId.HACKER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			=
	{ 
		ai.Gameplay.CAPTURE_THE_BASE, 
	}, 

	ranks = 
	{
		{
			steam_id	= "ACHIEV_HACKER_R1",
			points		= 10,
			value 		= 1000,
		},
		
		{
			steam_id	= "ACHIEV_HACKER_R2",
			points		= 10,
			value 		= 5000,
		},
		
		{
			steam_id	= "ACHIEV_HACKER_R3",
			points		= 20,
			value 		= 25000,
		},
		
		{
			steam_id	= "ACHIEV_HACKER_R4",
			points		= 30,
			value 		= 100000,
		},
	},
}

Achievements[ ai.AchievementId.REPAIRER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			=
	{
		ai.Gameplay.CAPTURE_THE_BASE,
	},
	
	ranks = 
	{
		{
			steam_id	= "ACHIEV_REPAIRER_R1",
			points		= 10,
			value 		= 1000,
		},
		
		{
			steam_id	= "ACHIEV_REPAIRER_R2",
			points		= 10,
			value 		= 5000,
		},
		
		{
			steam_id	= "ACHIEV_REPAIRER_R3",
			points		= 20,
			value 		= 25000,
		},
		
		{
			steam_id	= "ACHIEV_REPAIRER_R4",
			points		= 30,
			value 		= 100000,
		},
	},
}

Achievements[ ai.AchievementId.ROCKETEER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "WEAPON",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{
		{
			steam_id	= "ACHIEV_ROCKETEER_R1",
			points		= 10,
			value 		= 500,
		},
		
		{
			steam_id	= "ACHIEV_ROCKETEER_R2",
			points		= 10,
			value 		= 1000,
		},
		
		{
			steam_id	= "ACHIEV_ROCKETEER_R3",
			points		= 20,
			value 		= 5000,
		},
		
		{
			steam_id	= "ACHIEV_ROCKETEER_R4",
			points		= 30,
			value 		= 10000,
		},
	},
}

Achievements[ ai.AchievementId.GRENADIER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "WEAPON",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,

	ranks =
	{
		{
			steam_id	= "ACHIEV_GRENADIER_R1",
			points		= 10,
			value 		= 200,
		},
		
		{
			steam_id	= "ACHIEV_GRENADIER_R2",
			points		= 10,
			value 		= 500,
		},
		
		{
			steam_id	= "ACHIEV_GRENADIER_R3",
			points		= 20,
			value 		= 2000,
		},
		
		{
			steam_id	= "ACHIEV_GRENADIER_R4",
			points		= 30,
			value 		= 5000,
		},
	},
}

Achievements[ ai.AchievementId.NUCLEAR_OUTRAGE ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "WEAPON",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	item_subtype 		= ItemSubtype.SpaceMissile_Nuke,

	ranks = 
	{
		{
			steam_id	= "ACHIEV_NUCLEAR_OUTRAGE_R1",
			points		= 10,
			value 		= 50,
		},
		
		{
			steam_id	= "ACHIEV_NUCLEAR_OUTRAGE_R2",
			points		= 10,
			value 		= 250,
		},
		
		{
			steam_id	= "ACHIEV_NUCLEAR_OUTRAGE_R3",
			points		= 20,
			value 		= 1000,
		},
		
		{
			steam_id	= "ACHIEV_NUCLEAR_OUTRAGE_R4",
			points		= 30,
			value 		= 3000,
		},
	},
}

Achievements[ ai.AchievementId.BARNACLE ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "MODULE",
	gameplays 			= ai.GameplayGroups.pvp,
	item_subtype 		= ItemSubtype.SpyDrone,
	coop_vs_ai 			= false,

	ranks = 
	{
		{
			steam_id	= "ACHIEV_BARNACLE_R1",
			points		= 10,
			value 		= 10,
		},
		
		{
			steam_id	= "ACHIEV_BARNACLE_R2",
			points		= 10,
			value 		= 100,
		},
		
		{
			steam_id	= "ACHIEV_BARNACLE_R3",
			points		= 20,
			value 		= 500,
		},
		
		{
			steam_id	= "ACHIEV_BARNACLE_R4",
			points		= 30,
			value 		= 2000,
		},
	},
}

Achievements[ ai.AchievementId.ANTIAIRCRAFTER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "MODULE",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,

	ranks =
	{
		{
			steam_id	= "ACHIEV_ANTIAIRCRAFTER_R1",
			points		= 10,
			value 		= 20,
		},
		
		{
			steam_id	= "ACHIEV_ANTIAIRCRAFTER_R2",
			points		= 10,
			value 		= 100,
		},
		
		{
			steam_id	= "ACHIEV_ANTIAIRCRAFTER_R3",
			points		= 20,
			value 		= 500,
		},
		
		{
			steam_id	= "ACHIEV_ANTIAIRCRAFTER_R4",
			points		= 30,
			value 		= 1000,
		},
	},
}

-- победы в день космонавтики
Achievements[ ai.AchievementId.SPACE_RACE ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	gameplays 			= ai.GameplayGroups.pvp,
	ranks =
	{
		{
			steam_id	= "ACHIEV_SPACE_RACE_R1",
			value 		= 5,
			points		= 10,
		},
	},
}

Achievements[ ai.AchievementId.SC_TESTER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",

	ranks = 
	{
		{
			--steam_id	= "ACHIEV_SC_TESTER_R1",
			value 		= 1,
			points		= 0,
		},
	},
}

Achievements[ ai.AchievementId.SC_VETERAN ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",

	ranks = 
	{
		{
			--steam_id	= "ACHIEV_SC_VETERAN_R1",
			value 		= 1,
			points		= 0,
		},
	},
}

-- участник ЗБТ
Achievements[ ai.AchievementId.CBT_PARTICIPANT ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",

	ranks = 
	{
		{
			--steam_id	= "ACHIEV_CBT_PARTICIPANT_R1",
			value 		= 1,
			points		= 0,
		},
	},
}

-- годовщина игры
Achievements[ ai.AchievementId.SC_ANNIVERSARY ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	item_subtype 		= ItemSubtype.SpaceMissile_Fireworks_Prize, 
	
	ranks = 
	{
		{
			--steam_id	= "ACHIEV_SC_ANNIVERSARY_R1",
			value 		= 1, -- сколько раз нужно нанести урон сопернику праздничными ракетами
			points		= 10,
		},
	},
}

Achievements[ ai.AchievementId.SPACE_MISSION ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	
	ranks = 
	{
		{
			steam_id	= "SPACE_MISSION_R1",
			points		= 10,
			value 		= 3, -- сколько раз нужно полностью пройти пве миссию
		},
		
		{
			steam_id	= "SPACE_MISSION_R2",
			points		= 10,
			value 		= 10,
		},
		
		{
			steam_id	= "SPACE_MISSION_R3",
			points		= 20,
			value 		= 50,
		},
		
		{
			steam_id	= "SPACE_MISSION_R4",
			points		= 30,
			value 		= 100,
		},
	},
}


-- 23 февраля
Achievements[ ai.AchievementId.FEBRUARY_23 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	gameplays 			= ai.GameplayGroups.pvp,
	
	ranks = 
	{
		{
			value 					= 10,
			points					= 10,
			reward_custom_element	= "Defender_star",
		},
	},
}


-- 8 марта
Achievements[ ai.AchievementId.MARCH_8 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	str_eq_condition	= { "March_8_Heart", },
	
	ranks = 
	{
		{
			value 					= 8,
			points					= 10,
			reward_custom_element	= "March_8_Heart_01",
		},
	},
}



--
Achievements[ ai.AchievementId.SHIP_COLLECTOR ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "SHIPS",
	
	ranks = 
	{
		{
			steam_id	= "SHIP_COLLECTOR_1_R1",
			points		= 10,
			value 		= 10,
		},
		
		{
			steam_id	= "SHIP_COLLECTOR_2_R1",
			points		= 10,
			value 		= 20,
		},
		
		{
			steam_id	= "SHIP_COLLECTOR_3_R1",
			points		= 10,
			value 		= 30,
		},
		
		{
			steam_id	= "SHIP_COLLECTOR_4_R1",
			points		= 10,
			value 		= 40,
		},
		
		{
			steam_id	= "SHIP_COLLECTOR_5_R1",
			points		= 10,
			value 		= 50,
		},
		
		{
			steam_id	= "SHIP_COLLECTOR_6_R1",
			points		= 10,
			value 		= 60,
		},
		
		{
			steam_id	= "SHIP_COLLECTOR_7_R1",
			points		= 10,
			value 		= 70,
		},
		
		{
			steam_id	= "SHIP_COLLECTOR_8_R1",
			points		= 10,
			value 		= 80,
		},
		
		{
			steam_id	= "SHIP_COLLECTOR_9_R1",
			points		= 10,
			value 		= 90,
		},
		
		{
			steam_id	= "SHIP_COLLECTOR_10_R1",
			points		= 10,
			value 		= 100,
			reward_title = PlayerTitleId.SHIP_COLLECTOR,	
		},
		
	},	
}



--
Achievements[ ai.AchievementId.KILLING_BLOWS ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "WEAPON",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,

	ranks = 
	{
		{
			steam_id	= "ACHIEV_KILLING_BLOWS_R1", 
			value 		= 20,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_KILLING_BLOWS_R2", 
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_KILLING_BLOWS_R3", 
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_KILLING_BLOWS_R4", 
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_KILLING_BLOWS_R5", 
			value 		= 2000,
			points		= 20,
		},
		
		{
			steam_id	= "ACHIEV_KILLING_BLOWS_R6", 
			value 		= 4000,
			points		= 30,
			reward_title = PlayerTitleId.KILLING_BLOWS,
		},
		
	},	
	
}


--
Achievements[ ai.AchievementId.BATTLE_MASTER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays 			= ai.GameplayGroups.pvp,
	category			= "TACTIC",
	coop_vs_ai 			= false,
	ranks = 
	{
		{
			steam_id	= "ACHIEV_BATTLE_MASTER_R1", 
			value 		= 1,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_BATTLE_MASTER_R2", 
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_BATTLE_MASTER_R3",
			value 		= 50,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_BATTLE_MASTER_R4",
			value 		= 200,
			points		= 20,
		},
		
		{
			steam_id	= "ACHIEV_BATTLE_MASTER_R5", 
			value 		= 500,
			points		= 30,
			reward_title = PlayerTitleId.BATTLE_MASTER,
		},
		
	},	
}


--
Achievements[ ai.AchievementId.SPACE_INVADER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,

	ranks = 
	{	
		{
			steam_id	= "ACHIEV_SPACE_INVADER_R1", 
			value 		= 1,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_SPACE_INVADER_R2", 
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_SPACE_INVADER_R3", 
			value 		= 20,
			points		= 10,
		},
		
		{
			steam_id	= "ACHIEV_SPACE_INVADER_R4", 
			value 		= 50,
			points		= 20,
		},
		
		{
			steam_id	= "ACHIEV_SPACE_INVADER_R5", 
			value 		= 100,
			points		= 30,
			reward_title = PlayerTitleId.SPACE_INVADER,
		},
		
	},
}


--
Achievements[ ai.AchievementId.PIRATEBAY ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,

	ranks = 
	{	
		{
			steam_id	= "PIRATEBAY_R1", 
			value 		= 1,
			points		= 0,
		},
	},
}


--
Achievements[ ai.AchievementId.USEFUL_DROP ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	numerical_conditions = 
	{
		{
			-- минимальный уровень рарности полутанного предмета
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 3,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно полутать предмет в PvP/PvE
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.MONEYMAKER ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 100000,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.ALIENDESTSTATION ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s1340_aliendestsatation", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.DEVILSJAW ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s1338_devilsjaw", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.ASTEROIDCITY ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s1420_ceres3_asteroidcity", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.NORTHMSITE ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s1420_ceres3_northmsite", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.ANOMALY ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s1338_pandora_anomaly", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.DREADNWRECK ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s1338_pandora_dreadnwreck", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.ALIENDEBRIS13 ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s1340_thar_aliendebris13", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.BARRIERDEBRIS ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s8256_thar_barrierdebris", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.GASGIANT ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s1340_thar_gasgiant", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.LAVASTONE ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s8256_thar_lavastone", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.THRESHOLD ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "s8256_thar_threshold", },
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.SYNERGETIC ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "SHIPS",
	-- subCategory			= "SYNERGY", пока 1 тип достижений в категории синергия, данная категория не актуальна.
	
	ranks = 
	{
		{
			steam_id	= "SYNERGETIC_1_R1",
			value 		= 5,
			points		= 10,
		},
	
		{
			steam_id	= "SYNERGETIC_2_R1",
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "SYNERGETIC_3_R1",
			value 		= 25,
			points		= 10,
		},
	
		{
			steam_id	= "SYNERGETIC_4_R1",
			value 		= 30,
			points		= 10,
		},
	
		{
			steam_id	= "SYNERGETIC_5_R1",
			value 		= 50,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.RANK_EMP ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.HIGHEST,
	
	ranks = 
	{
		{
			value 		= 2,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.RANK_FED ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.HIGHEST,
	
	ranks = 
	{
		{
			value 		= 2,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.RANK_JER ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.HIGHEST,
	
	ranks = 
	{
		{
			value 		= 2,
			points		= 10,
		},
	},
}

-- ачивки на получение новой лояльности у легиона
Achievements[ ai.AchievementId.LOYALTY_LEG ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 2147483647, -- максимальное значение int32, чтобы никто пока не получил ачивку
			points		= 0,
		},
	},
}

-- ачивки на получение новой лояльности у варденов
Achievements[ ai.AchievementId.LOYALTY_WAR ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 2147483647, -- максимальное значение int32, чтобы никто пока не получил ачивку
			points		= 0,
		},
	},
}

-- ачивки на получение новой лояльности у армада
Achievements[ ai.AchievementId.LOYALTY_ARM ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 2147483647, -- максимальное значение int32, чтобы никто пока не получил ачивку
			points		= 0,
		},
	},
}

-- ачивки на получение новой лояльности у авангарада
Achievements[ ai.AchievementId.LOYALTY_AVA ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 2147483647, -- максимальное значение int32, чтобы никто пока не получил ачивку
			points		= 0,
		},
	},
}

-- ачивки на получение новой лояльности у рейда
Achievements[ ai.AchievementId.LOYALTY_RAI ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 2147483647, -- максимальное значение int32, чтобы никто пока не получил ачивку
			points		= 0,
		},
	},
}

-- ачивки на получение новой лояльности у технологов
Achievements[ ai.AchievementId.LOYALTY_TEC ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 2147483647, -- максимальное значение int32, чтобы никто пока не получил ачивку
			points		= 0,
		},
	},
}

-- победы за империю
Achievements[ ai.AchievementId.CHAMPION_EMP ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

-- победы за федерацию
Achievements[ ai.AchievementId.CHAMPION_FED ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

-- победы за иерихон
Achievements[ ai.AchievementId.CHAMPION_JER ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}
	
-- килл\ассист кораблей империи
Achievements[ ai.AchievementId.DESTROY_EMP ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

-- килл\ассист кораблей федерации
Achievements[ ai.AchievementId.DESTROY_FED ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

-- килл\ассист кораблей иерихона
Achievements[ ai.AchievementId.DESTROY_JER ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}


--
Achievements[ ai.AchievementId.ASSISTANCE ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.DESTROY_SMALL ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.DESTROY_MEDIUM ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.DESTROY_LARGE ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.ROCKING_SMALL ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.ROCKING_MEDIUM ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.ROCKING_LARGE ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

-- Первое сентября

Achievements[ ai.AchievementId.KD_BADDIE ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	subCategory			= "KNOWLEDGE_DAY",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
			reward_title = PlayerTitleId.KD_BADDIE,
		},
	},
}

--
Achievements[ ai.AchievementId.KD_BIOLOGIST ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	subCategory			= "KNOWLEDGE_DAY",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	numerical_conditions = 
	{
		{
			-- сколько кораблей нужно убить в одном бою
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 5,
		},
	},
		
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 10,
			reward_title = PlayerTitleId.KD_BIOLOGIST,
		},
	},
}

--
Achievements[ ai.AchievementId.KD_FRESHMAN ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	subCategory			= "KNOWLEDGE_DAY",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	numerical_conditions = 
	{
		{
			-- минимальный разрешенный ранг корабля игрока
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 1,
		},
		
		{
			-- максимальный разрешенный ранг корабля игрока
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= 9,
		},
	},
	
	ranks = 
	{
		{
			value 		= 5, -- сколько боев нужно выиграть с условиями в numerical_conditions
			points		= 10,
			reward_title = PlayerTitleId.KD_FRESHMAN,
		},
	},
}

--
Achievements[ ai.AchievementId.KD_SENIOR ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	subCategory			= "KNOWLEDGE_DAY",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	numerical_conditions = 
	{
		{
			-- минимальный разрешенный ранг корабля игрока
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 10,
		},
		
		{
			-- максимальный разрешенный ранг корабля игрока
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= 17,
		},
	},
	
	ranks = 
	{
		{
			value 		= 5, -- сколько боев нужно выиграть с условиями в numerical_conditions
			points		= 10,
			reward_title = PlayerTitleId.KD_SENIOR,
		},
	},
}

--
Achievements[ ai.AchievementId.KD_GRIND ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	subCategory			= "KNOWLEDGE_DAY",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	numerical_conditions = 
	{
		{
			-- на кораблях какой роли нужно убивать
			comparison	= ai.Comparison.EQUAL,
			value 		= ai.ShipRoles.SNIPER,
		},
	},
	
	ranks = 
	{
		{
			value 		= 20, -- сколько нужно набрать киллов с условием в numerical_conditions[1]
			points		= 10,
			reward_title = PlayerTitleId.KD_GRIND,
		},
	},
}

--
Achievements[ ai.AchievementId.KD_BULLY ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	subCategory			= "KNOWLEDGE_DAY",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{
		{
			value 		= 10,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.KD_HEAD ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	subCategory			= "KNOWLEDGE_DAY",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{
		{
			value 		= 10,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.KD_TEACHER ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	subCategory			= "KNOWLEDGE_DAY",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{
		{
			value 		= 10,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.KD_META ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.ACHIEVEMENT,
	category			= "LIFETIME",
	
	parts = 
	{
		ai.AchievementId.KD_BADDIE,
		ai.AchievementId.KD_BIOLOGIST,
		ai.AchievementId.KD_FRESHMAN,
		ai.AchievementId.KD_SENIOR,
		ai.AchievementId.KD_GRIND,
		ai.AchievementId.KD_BULLY,
		ai.AchievementId.KD_HEAD,
		ai.AchievementId.KD_TEACHER,
	},
	
	ranks = 
	{
		{
			value 					= 8,
			points					= 30,
			reward_title 			= PlayerTitleId.KD_META,
			reward_custom_element	= "Sensei",
		},
	},
}

-- за код с игромира
Achievements[ ai.AchievementId.PROMO_IGROMIR ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	str_eq_condition	= { "FE0F5CF1-FBC8-4935-BCDB-BB7DDDFD2CD5", "B949BF2C-406A-428E-A031-FBDAE7E45FE3", "F52730E4-9296-4B27-9D6C-04C129F7F20E", "52B8BF80-A632-4E73-9E6A-60CEBBE30926", "5337253C-A530-4859-B95A-1672E2A6B742", }, -- guids of yuplay promo packs
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- Open World --

-- Использовать джамп-гейты в открытом мире 
Achievements[ ai.AchievementId.JUMP_AROUND ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "JUMP_AROUND_R1", 
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "JUMP_AROUND_R2", 
			value 		= 50,
			points		= 10,
		},
		
		{
			steam_id	= "JUMP_AROUND_R3", 
			value 		= 250,
			points		= 10,
		},
		
		{
			steam_id	= "JUMP_AROUND_R4", 
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "JUMP_AROUND_R5", 
			value 		= 5000,
			points		= 10,
		},
		
		{
			steam_id	= "JUMP_AROUND_R6", 
			value 		= 10000,
			points		= 20,
		},	
	},
}

-- Лутать объекты(loot) в открытом мире
Achievements[ ai.AchievementId.MARAUDER ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "MARAUDER_R1", 
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "MARAUDER_R2", 
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "MARAUDER_R3", 
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "MARAUDER_R4", 
			value 		= 2500,
			points		= 10,
		},
		
		{
			steam_id	= "MARAUDER_R5", 
			value 		= 5000,
			points		= 10,
		},
		
		{
			steam_id	= "MARAUDER_R6", 
			value 		= 10000,
			points		= 20,
		},
	},
}

-- достижение на открытие зон фронтиров И\И\Ф
Achievements[ ai.AchievementId.SPACE_PROBE ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SPACE_ZONE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	parts = 
	{
		-- Frontier zone_id локаций
		SpaceZone.Empire_Frontier.zone_id,
		SpaceZone.Federation_Frontier.zone_id,
		SpaceZone.Jericho_Frontier.zone_id,
		SpaceZone.Jericho_PirateBay.zone_id,
	},
	
	ranks = 
	{
		{
			steam_id	= "SPACE_PROBE_R1", 
			value 		= 4, -- кол-во локаций
			points		= 10,
		},
	},
}

-- достижение на обнраужение имперских зон опенспейса 
Achievements[ ai.AchievementId.SPACE_PROBE_EMP ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SPACE_ZONE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	parts = 
	{
		-- Империя zone_id локаций
		SpaceZone.Empire_IlayStation3.zone_id,
		SpaceZone.Empire_IlayGateSirus2.zone_id,
		SpaceZone.Empire_IlayGateSirus.zone_id,
		SpaceZone.Empire_IlayGateSirus3.zone_id,
		SpaceZone.Empire_SirusDebrissite.zone_id,
		SpaceZone.Empire_IlayStation2.zone_id,
		SpaceZone.Empire_IlayMiningsite.zone_id,
		SpaceZone.Empire_IlayGateRex3.zone_id,
		SpaceZone.Empire_IlayGateRex.zone_id,
		SpaceZone.Empire_IlayGateRex2.zone_id,
		SpaceZone.Empire_RexFallenScrapyard.zone_id,
		SpaceZone.Empire_BigshipBuilding.zone_id,
		SpaceZone.Empire_CaptureRepairbase.zone_id,
	},
	
	ranks = 
	{
		{
			steam_id	= "SPACE_PROBE_EMP_R1", 
			value 		= 13, -- кол-во локаций
			points		= 10,
		},
	},
}

-- достижение на обнраужение федератских зон опенспейса 
Achievements[ ai.AchievementId.SPACE_PROBE_FED ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SPACE_ZONE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	parts = 
	{
		-- Федерация zone_id локаций
		SpaceZone.Federation_NalnifanShipyard2.zone_id,
		SpaceZone.Federation_NalnifanShipyard.zone_id,
		SpaceZone.Federation_NalnifanGateLumen.zone_id,
		SpaceZone.Federation_LumenConstructionsite2.zone_id,
		SpaceZone.Federation_LumenConstructionsite3.zone_id,
		SpaceZone.Federation_LumenConstructionsite.zone_id,
		SpaceZone.Federation_NalnifanShipyard3.zone_id,
		SpaceZone.Federation_NalnifanGateCarib.zone_id,
		SpaceZone.Federation_CaribWaterharvest2.zone_id,
		SpaceZone.Federation_CaribWaterharvest3.zone_id,
		SpaceZone.Federation_CaribWaterharvest.zone_id,
		SpaceZone.Federation_Geostation.zone_id,
		SpaceZone.Federation_AsteroidBuilding.zone_id,
	},
	
	ranks = 
	{
		{
			steam_id	= "SPACE_PROBE_FED_R1", 
			value 		= 13, -- кол-во локаций
			points		= 10,
		},
	},
}

-- достижение на обнраужение иерихонских зон опенспейса  
Achievements[ ai.AchievementId.SPACE_PROBE_JER ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SPACE_ZONE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	parts = 
	{
		-- Иерихон zone_id локаций
		SpaceZone.Jericho_IsidStation3.zone_id,
		SpaceZone.Jericho_IsidStation2.zone_id,
		SpaceZone.Jericho_IsidGasharvest.zone_id,
		SpaceZone.Jericho_IsidMiningsite.zone_id,
		SpaceZone.Jericho_IsidMiningsite2.zone_id,
		SpaceZone.Jericho_IsidMiningsite3.zone_id,
		SpaceZone.Jericho_IsidGateMaseera.zone_id,
		SpaceZone.Jericho_MaseeraGateIsid.zone_id,
		SpaceZone.Jericho_MaseeraGateIsid2.zone_id,
		SpaceZone.Jericho_MaseeraGateIsid3.zone_id,
		SpaceZone.Jericho_MaseeraTerramorphingsite.zone_id,
		SpaceZone.Jericho_JerichoBase.zone_id,
	},
	
	ranks = 
	{
		{
			steam_id	= "SPACE_PROBE_JER_R1", 
			value 		= 12, -- кол-во локаций
			points		= 10,
		},
	},
}

--  Пролететь километры в опенспейсе
Achievements[ ai.AchievementId.MILEAGE ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "MILEAGE_R1", 
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "MILEAGE_R2",
			value 		= 10000,
			points		= 10,
		},
		
		{
			steam_id	= "MILEAGE_R3",
			value 		= 50000,
			points		= 10,
		},
		
		{
			steam_id	= "MILEAGE_R4",
			value 		= 100000,
			points		= 10,
		},
		
		{
			steam_id	= "MILEAGE_R5",
			value 		= 250000,
			points		= 10,
		},
		
		{
			steam_id	= "MILEAGE_R6",
			value 		= 500000,
			points		= 20,
		},
	},
}

-- Киллы/ассисты в открытом мире
Achievements[ ai.AchievementId.FREE_KILLS ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "FREE_KILLS_R1",
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "FREE_KILLS_R2",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "FREE_KILLS_R3",
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "FREE_KILLS_R4",
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "FREE_KILLS_R5",
			value 		= 3000,
			points		= 20,
		},
	
	},
}

-- Убивать(килл и ассист дамагом) игроков с высокой кармой в открытом мире 
Achievements[ ai.AchievementId.KILL_GOOD_GUYS ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	numerical_conditions = 
	{
		{
			-- какой уровень кармы должен быть у убитого игрока
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 5,
		},
	},
		
	ranks = 
	{
		{
			steam_id	= "KILL_GOOD_GUYS_R1",
			value 		= 1, -- сколько нужно набрать киллов с условием в numerical_conditions[1]
			points		= 10,
		},
	},
}

-- Убивать(килл и ассист дамагом) игроков с низкой кармой в открытом мире 
Achievements[ ai.AchievementId.KILL_BAD_GUYS ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	numerical_conditions = 
	{
		{
			-- какой уровень кармы должен быть у убитого игрока
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= -5,
		},
	},
	
	ranks = 
	{
		{
			steam_id	= "KILL_BAD_GUYS_R1",
			value 		= 1, -- сколько нужно набрать киллов с условием в numerical_conditions[1]
			points		= 10,
		},
	},
}

-- Убивать(килл и ассист дамагом) пиратские корабли в открытом мире 
Achievements[ ai.AchievementId.MILITIA_SHIPS ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "MILITIA_SHIPS_R1",
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_SHIPS_R2",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_SHIPS_R3",
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_SHIPS_R4",
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_SHIPS_R5",
			value 		= 10000,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_SHIPS_R6",
			value 		= 25000,
			points		= 20,
		},
	},
}

-- Убивать(килл и ассист дамагом) пиратские турели в открытом мире 
Achievements[ ai.AchievementId.MILITIA_TURRETS ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "MILITIA_TURRETS_R1",
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_TURRETS_R2",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_TURRETS_R3",
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_TURRETS_R4",
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_TURRETS_R5",
			value 		= 3000,
			points		= 10,
		},
		
		{
			steam_id	= "MILITIA_TURRETS_R6",
			value 		= 5000,
			points		= 20,
		},
	},
}

-- Убивать(килл и ассист дамагом) полицейские корабли в открытом мире 
Achievements[ ai.AchievementId.MAFIOSO_SHIPS ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "MAFIOSO_SHIPS_R1",
			value 		= 1,
			points		= 10,
		},
		
		{
			steam_id	= "MAFIOSO_SHIPS_R2",
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "MAFIOSO_SHIPS_R3",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "MAFIOSO_SHIPS_R4",
			value 		= 250,
			points		= 10,
		},
		
		{
			steam_id	= "MAFIOSO_SHIPS_R5",
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "MAFIOSO_SHIPS_R6",
			value 		= 1000,
			points		= 20,
		},
		
	},
}

-- Убивать(килл и ассист дамагом) полицейские турели в открытом мире 
Achievements[ ai.AchievementId.MAFIOSO_TURRETS ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "MAFIOSO_TURRETS_R1",
			value 		= 1,
			points		= 10,
		},
		
		{
			steam_id	= "MAFIOSO_TURRETS_R2",
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "MAFIOSO_TURRETS_R3",
			value 		= 50,
			points		= 10,
		},
		
		{
			steam_id	= "MAFIOSO_TURRETS_R4",
			value 		= 250,
			points		= 10,
		},
		
		{
			steam_id	= "MAFIOSO_TURRETS_R5",
			value 		= 500,
			points		= 20,
		},
	},
}

-- Убивать(килл и ассист дамагом) транспортные корабли в открытом мире 
Achievements[ ai.AchievementId.BANDIT ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "BANDIT_R1",
			value 		= 1,
			points		= 10,
		},
		
		{
			steam_id	= "BANDIT_R2",
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "BANDIT_R3",
			value 		= 50,
			points		= 10,
		},
		
		{
			steam_id	= "BANDIT_R4",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "BANDIT_R5",
			value 		= 250,
			points		= 10,
		},
		
		{
			steam_id	= "BANDIT_R6",
			value 		= 500,
			points		= 20,
		},
	},
}

-- Получить высокий уровень кармы 
Achievements[ ai.AchievementId.GOOD_GUY ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.HIGHEST,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "GOOD_GUY_R1",
			value 		= 1, -- требуемый уровень положительной кармы
			points		= 10,
		},
		
		{
			steam_id	= "GOOD_GUY_R2",
			value 		= 2,
			points		= 10,
		},
			
		{
			steam_id	= "GOOD_GUY_R3",
			value 		= 3,
			points		= 20,
		},
		
		{
			steam_id	= "GOOD_GUY_R4",
			value 		= 4,
			points		= 30,
		},
		
		{
			steam_id	= "GOOD_GUY_R5",
			value 		= 5,
			points		= 50,
		},
	},

}

-- Получить низкий уровень кармы 
Achievements[ ai.AchievementId.BAD_GUY ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.HIGHEST,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "BAD_GUY_R1",
			value 		= 1, -- требуемый уровень отрицательной кармы
			points		= 10,
		},
		
		{
			steam_id	= "BAD_GUY_R2",
			value 		= 2,
			points		= 10,
		},
			
		{
			steam_id	= "BAD_GUY_R3",
			value 		= 3,
			points		= 20,
		},
		
		{
			steam_id	= "BAD_GUY_R4",
			value 		= 4,
			points		= 30,
		},
		
		{
			steam_id	= "BAD_GUY_R5",
			value 		= 5,
			points		= 50,
		},
	},
}

-- Убить все классы в одном бою 
Achievements[ ai.AchievementId.ALL_SIZES ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	numerical_conditions = 
	{
		{
			-- какие классы кораблей нужно убить в одном бою
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.LARGE,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.ROCKING_LASER ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.ROCKING_PLASMA ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.ROCKING_RAIL ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SPONGE ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	numerical_conditions = 
	{
		{
			-- сколько урона нужно поглотить относительно суммарного запаса хп корабля, не умерев
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 10,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.MOST_EFFECTIVE ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.DESTROY_STASIS ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	item_subtype 		= ItemSubtype.StasisGenerator,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHARPSHOOTER ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	item_subtype		= ItemSubtype.Disintegrator,
	
	numerical_conditions = 
	{
		{
			-- сколько кораблей нужно убить в одном бою, не промахнувшись
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 3,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.OVERCHARGER ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	item_subtype		= ItemSubtype.TimeBoost,
	
	numerical_conditions = 
	{
		{
			-- сколько кораблей нужно убить, не умерев
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 5,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SPIDER_SHIP ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	item_subtype		= ItemSubtype.PlasmaWeb,
	
	numerical_conditions = 
	{
		{
			-- сколько кораблей нужно убить в одном бою
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 5,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.FROM_STEALTH ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	item_subtype		= ItemSubtype.CloakingDevice,
	
	numerical_conditions = 
	{
		{
			-- сколько кораблей нужно убить в одном бою
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 3,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.GUIDED_DEATH ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	item_subtype		= ItemSubtype.GuidedMissile,
	
	numerical_conditions = 
	{
		{
			-- сколько кораблей нужно убить, не умерев
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 5,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.STUNNING_SHIP ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	item_subtype		= ItemSubtype.BlackoutGenerator,
	
	numerical_conditions = 
	{
		{
			-- сколько кораблей нужно застанить за один раз
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 5,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 10,
		},
	},
}

-- For 4 battle slot
Achievements[ ai.AchievementId.FULL_HOUSE ] = 
{
	category			= "SHIPS",
	value_type			= ai.AchievementValueType.HIGHEST,
	
	ranks = 
	{
		{
			steam_id	= "FULL_HOUSE_R1",
			value 		= 4,
			points		= 10,
		},
	},
}

-- старая лояльность. получить 15 ранг со всеми фракциями.
Achievements[ ai.AchievementId.VETERAN_DISLOYAL ] = 
{
	invisible_by_default = true,
	category			= "GREAT",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- старая лояльность. получить каокй-нибудь ранг с любой из фракций
Achievements[ ai.AchievementId.VETERAN_LOYAL ] = 
{
	invisible_by_default = true,
	category			= "GREAT",
	value_type			= ai.AchievementValueType.HIGHEST,
	
	ranks = 
	{
		{
			value 		= 3, -- ai.Reputation.Sergeant
			points		= 0,
		},
		
		{
			value 		= 6, -- ai.ReputationRank.Midshipman, 
			points		= 0,
		},
		
		{
			value 		= 9, -- ai.Reputation.ThirdLieutenant, 
			points		= 0,
		},
		
		{
			value 		= 12, -- ai.Reputation.LtCommander, 
			points		= 0,
		},
		
		{
			value 		= 15, -- ai.Reputation.Commodore, 
			points		= 0,
		},
	},
}

-- на заработанную лояльность
Achievements[ ai.AchievementId.LOYALTY_TOTAL ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 2147483647, -- максимальное значение int32, чтобы никто пока не получил ачивку
			points		= 0,
		},
	},
}

-- дается за доступ к опенворлд. на 01,11,13 за месяц премиума
Achievements[ ai.AchievementId.PREMIUM_ACCESS ] = 
{
	--invisible_by_default = true,
	category			= "GREAT",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 6000,
			points		= 0,
			--reward_premium_access = true, -- это какаято древняя дичь, типа "пускать ли игрока в OW..."	(см. тикет SC-120396 и комментарий SC-37110#focus=Comments-4-392019.0-0)
		},
	},
}

--
Achievements[ ai.AchievementId.WITCH_HUNT ] = 
{
	category			= "LIFETIME",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_ROLE,
	item_subtype 		= ItemSubtype.SpaceMissile_Helloween,
	
	parts = 
	{
		ai.ShipRoles.ECM,
		ai.ShipRoles.SCOUT,
		ai.ShipRoles.RECON,
		ai.ShipRoles.ATTACK,
		ai.ShipRoles.COMMAND,
		ai.ShipRoles.TACKLER,
		ai.ShipRoles.SNIPER,
		ai.ShipRoles.GUARD,
		ai.ShipRoles.ENGINEER,
	},
	
	ranks = 
	{
		{
			value 		= 9,
			points		= 10,
			reward_title = PlayerTitleId.WITCH_HUNTER,
		},
	},
}

-- участник обт
Achievements[ ai.AchievementId.OBT_PARTICIPANT ] = 
{
	invisible_by_default = true,
	category			= "GREAT",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.OBT_PARTICIPANT,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_EMP_1 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "EMP_SHIP_RANKS", 
	
	parts = 
	{
		"Ship_Race1_M_T1",
		"Ship_Race1_L_T1",
		"Ship_Race1_M_T1_Faction1",
		"Ship_Race1_S_T1_Faction1",
	},
	
	ranks = 
	{	
		{
			steam_id	= "SHIPS_EMP_1_R1",
			value 		= 4,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_EMP_2 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "EMP_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race1_L_T1_Faction1",
		"Ship_Race1_M_T1_Faction2",
		"Ship_Race1_M_T2",
		"Ship_Race1_S_T1_Faction2",
		"Ship_Race1_L_T1_Faction2",
		"Ship_Race1_S_T2",
		"Ship_Race1_L_T2",
		"Ship_Race1_L_T2_Faction1",
		"Ship_Race1_M_T2_Faction1",
		"Ship_Race1_S_T2_Faction1",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_EMP_2_R1",
			value 		= 10,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_EMP_3 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "EMP_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race1_L_T2_Faction2",
		"Ship_Race1_M_T2_Faction2",
		"Ship_Race1_S_T2_Faction2",
		"Ship_Race1_L_T3",
		"Ship_Race1_M_T3",
		"Ship_Race1_S_T3",
		"Ship_Race1_L_T3_Faction1",
		"Ship_Race1_M_T3_Faction1",
		"Ship_Race1_S_T3_Faction1",
		"Ship_Race1_M_T3_Faction3",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_EMP_3_R1",
			value 		= 10,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_EMP_4 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "EMP_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race1_L_T3_Faction2",
		"Ship_Race1_M_T3_Faction2",
		"Ship_Race1_S_T3_Faction2",
		"Ship_Race1_L_T4",
		"Ship_Race1_L_T4_Faction1",
		"Ship_Race1_M_T4",
		"Ship_Race1_M_T4_Faction1",
		"Ship_Race1_S_T4",
		"Ship_Race1_S_T4_Faction1",
		"Ship_Race1_L_T4_Faction2",
		"Ship_Race1_M_T4_Faction2",
		"Ship_Race1_S_T4_Faction2",
	},
	
	ranks = 
	{	
		{
			steam_id	= "SHIPS_EMP_4_R1",
			value 		= 12,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_EMP_5 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "EMP_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race1_L_T5",
		"Ship_Race1_M_T5",
		"Ship_Race1_S_T5",
		"Ship_Race1_L_T5_Faction1",
		"Ship_Race1_M_T5_Faction1",
		"Ship_Race1_S_T5_Faction1",
		"Ship_Race1_L_T5_Faction2",
		"Ship_Race1_M_T5_Faction2",
		"Ship_Race1_S_T5_Faction2",
	},
	
	ranks = 
	{		
		{
			steam_id	= "SHIPS_EMP_5_R1",
			value 		= 9,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_FED_1 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "FED_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race3_M_T1",
		"Ship_Race3_L_T1",
		"Ship_Race3_L_T1_Faction1",
		"Ship_Race3_M_T1_Faction1",
		"Ship_Race3_S_T1",
	},
	
	ranks = 
	{		
		{
			steam_id	= "SHIPS_FED_1_R1",
			value 		= 5,
			points		= 10,
		},
		
	},
}

--
Achievements[ ai.AchievementId.SHIPS_FED_2 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "FED_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race3_L_T1_Faction2",
		"Ship_Race3_M_T1_Faction2",
		"Ship_Race3_M_T2",
		"Ship_Race3_S_T1_Faction1",
		"Ship_Race3_L_T2",
		"Ship_Race3_L_T2_Faction1",
		"Ship_Race3_M_T2_Faction1",
		"Ship_Race3_S_T1_Faction2",
		"Ship_Race3_S_T2",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_FED_2_R1",
			value 		= 9,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_FED_3 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "FED_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race3_L_T2_Faction2",
		"Ship_Race3_M_T2_Faction2",
		"Ship_Race3_S_T2_Faction2",
		"Ship_Race3_L_T3",
		"Ship_Race3_M_T3",
		"Ship_Race3_S_T2_Faction1",
		"Ship_Race3_L_T3_Faction1",
		"Ship_Race3_M_T3_Faction1",
		"Ship_Race3_S_T3",
		"Ship_Race3_M_T3_Faction3",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_FED_3_R1",
			value 		= 10,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_FED_4 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "FED_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race3_L_T3_Faction2",
		"Ship_Race3_M_T3_Faction2",
		"Ship_Race3_S_T3_Faction1",
		"Ship_Race3_S_T3_Faction2",
		"Ship_Race3_L_T4",
		"Ship_Race3_L_T4_Faction2",
		"Ship_Race3_M_T4",
		"Ship_Race3_M_T4_Faction1",
		"Ship_Race3_S_T4",
		"Ship_Race3_S_T4_Faction2",
		"Ship_Race3_L_T4_Faction1",
		"Ship_Race3_M_T4_Faction2",
		"Ship_Race3_S_T4_Faction1",
	},
	
	ranks = 
	{		
		{
			steam_id	= "SHIPS_FED_4_R1",
			value 		= 13,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_FED_5 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "FED_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race3_L_T5",
		"Ship_Race3_M_T5",
		"Ship_Race3_S_T5",
		"Ship_Race3_L_T5_Faction2",
		"Ship_Race3_M_T5_Faction1",
		"Ship_Race3_S_T5_Faction2",
		"Ship_Race3_L_T5_Faction1",
		"Ship_Race3_M_T5_Faction2",
		"Ship_Race3_S_T5_Faction1",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_FED_5_R1",
			value 		= 9,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_JER_1 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "JER_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race2_M_T1",
		"Ship_Race2_L_T1",
		"Ship_Race2_M_T1_Faction1",
		"Ship_Race2_S_T1",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_JER_1_R1",
			value 		= 4,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_JER_2 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "JER_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race2_L_T1_Faction1",
		"Ship_Race2_M_T2",
		"Ship_Race2_S_T1_Faction1",
		"Ship_Race2_L_T1_Faction2",
		"Ship_Race2_M_T2_Faction1",
		"Ship_Race2_S_T1_Faction2",
		"Ship_Race2_L_T2",
		"Ship_Race2_M_T2_Faction2",
		"Ship_Race2_S_T2",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_JER_2_R1",
			value 		= 9,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_JER_3 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "JER_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race2_L_T2_Faction1",
		"Ship_Race2_L_T2_Faction2",
		"Ship_Race2_M_T3",
		"Ship_Race2_S_T2_Faction1",
		"Ship_Race2_L_T3",
		"Ship_Race2_M_T3_Faction1",
		"Ship_Race2_S_T2_Faction2",
		"Ship_Race2_S_T3",
		"Ship_Race2_L_T3_Faction1",
		"Ship_Race2_L_T3_Faction2",
		"Ship_Race2_M_T3_Faction2",
		"Ship_Race2_S_T3_Faction1",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_JER_3_R1",
			value 		= 12,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_JER_4 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "JER_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race2_L_T4",
		"Ship_Race2_M_T4",
		"Ship_Race2_S_T3_Faction2",
		"Ship_Race2_L_T4_Faction1",
		"Ship_Race2_M_T4_Faction1",
		"Ship_Race2_S_T4",
		"Ship_Race2_S_T4_Faction2",
		"Ship_Race2_L_T4_Faction2",
		"Ship_Race2_M_T4_Faction2",
		"Ship_Race2_S_T4_Faction1",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_JER_4_R1",
			value 		= 10,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_JER_5 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_NAME,
	category			= "SHIPS",
	subCategory			= "JER_SHIP_RANKS",
	
	parts = 
	{
		"Ship_Race2_L_T5",
		"Ship_Race2_M_T5",
		"Ship_Race2_S_T5",
		"Ship_Race2_L_T5_Faction1",
		"Ship_Race2_M_T5_Faction1",
		"Ship_Race2_S_T5_Faction2",
		"Ship_Race2_L_T5_Faction2",
		"Ship_Race2_M_T5_Faction2",
		"Ship_Race2_S_T5_Faction1",
	},
	
	ranks = 
	{
		{
			steam_id	= "SHIPS_JER_5_R1",
			value 		= 9,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.SHIPS_SMALL ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "SHIPS",
	subCategory			= "SHIP_CLASS",
	
	ranks = 
	{
		{
			value 		= 5,
			points		= 10,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 20,
			points		= 10,
		},
		
		{
			value 		= 30,
			points		= 10,
		},	
	},
}

--
Achievements[ ai.AchievementId.SHIPS_MEDIUM ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "SHIPS",
	subCategory			= "SHIP_CLASS",
	
	ranks = 
	{
		{
			value 		= 5,
			points		= 10,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 20,
			points		= 10,
		},
		
		{
			value 		= 30,
			points		= 10,
		},	
	},
}

--
Achievements[ ai.AchievementId.SHIPS_LARGE ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "SHIPS",
	subCategory			= "SHIP_CLASS",
	
	ranks = 
	{
		{
			value 		= 5,
			points		= 10,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 20,
			points		= 10,
		},
		
		{
			value 		= 30,
			points		= 10,
		},	
	},
}

--
Achievements[ ai.AchievementId.ROLES_ROYCE ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SHIP_ROLE,
	category			= "SHIPS",
	
	parts = 
	{
		ai.ShipRoles.ECM,
		ai.ShipRoles.SCOUT,
		ai.ShipRoles.RECON,
		ai.ShipRoles.ATTACK,
		ai.ShipRoles.COMMAND,
		ai.ShipRoles.TACKLER,
		ai.ShipRoles.SNIPER,
		ai.ShipRoles.GUARD,
		ai.ShipRoles.ENGINEER,
		ai.ShipRoles.OVERSEER,
	},
	
	ranks = 
	{
		{
			steam_id	= "ROLES_ROYCE_R1",
			value 		= 9,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.GOLDEN_RIDE ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",
	
	ranks = 
	{
		{
			steam_id	= "GOLDEN_RIDE_R1",
			value 		= 1,
			points		= 0,
		},
	},
}

-- достижение за больше всего захваченных секторов Имперской корпорацией
Achievements[ ai.AchievementId.CONQUEROR_S1_EMP ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- достижение за больше всего захваченных секторов Федеративной корпорацией
Achievements[ ai.AchievementId.CONQUEROR_S1_FED ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- достижение за больше всего захваченных секторов Иерихонской корпорацией
Achievements[ ai.AchievementId.CONQUEROR_S1_JER ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- достижение, которое выдается хотя бы за один захваченный сектор.
Achievements[ ai.AchievementId.CONQUEROR_S1 ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
		},
	},
}

Achievements[ ai.AchievementId.NY_COLD_BLOOD ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	subCategory			= "NEW_YEAR",
	
	ranks = 
	{
		{
			value 		= 9,
			points		= 0,
			reward_title = PlayerTitleId.NY_COLD_BLOOD,
		},
	},
}

-- достижение за полное прохождение игры (прокачка всех серебряных кораблей)
Achievements[ ai.AchievementId.ULTIMATE_PLAYER ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.ULTIMATE_PLAYER,
		},
	},
}

-- пилот миллионого призыва, выдается 1000 игроков (#36844)
Achievements[ ai.AchievementId.ONE_MLN_REG ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- "Элитный пилот" миллионного призыва, выдается миллионому игроку(#36844)
Achievements[ ai.AchievementId.ONE_MLN_PILOT ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	category			= "GREAT",
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 0,
		},
	},
} 

-- достижение на посещение всех ангаров в опенспейсе.
Achievements[ ai.AchievementId.SPACE_DOCKER ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.SPACE_ZONE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	parts = 
	{
		-- Стартовые ангары zone_id локаций
		SpaceZone.Empire_HomeWorld.zone_id,
		SpaceZone.Federation_HomeWorld.zone_id,
		SpaceZone.Jericho_HomeWorld.zone_id,
	},
	
	ranks = 
	{
		{
			steam_id	= "SPACE_DOCKER_R1",
			value 		= 3, -- кол-во локаций
			points		= 10,
		},
	},
}

-- достижение на сбор конкретного лута в опенспейсе
Achievements[ ai.AchievementId.SPACE_BUM ] = 
{
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.ITEM_NAME,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	parts = 
	{
		"ow_Rare_T3_1",
		"ow_Rare_T3_2",
		"ow_Rare_T3_3",
		"ow_Rare_T3_4",
		"ow_Rare_T4_1",
		"ow_Rare_T4_2",
		"ow_Rare_T4_3",
		"ow_Rare_T4_4",
		"ow_Rare_T5_1",
		"ow_Rare_T5_2",
		"ow_Rare_T5_3",
		"ow_Rare_T5_4",
	},
	
	ranks = 
	{
		{
			steam_id	= "SPACE_BUM_R1",
			value 		= 12, -- кол-во собранных предметов
			points		= 10,
		},
	},
}

--[[ достижение на сбор конкретного лута в опенспейсе
Achievements[ ai.AchievementId.SPACE_BUM_EMP ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.ITEM_NAME,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	parts = 
	{
		"ow_Rare_T3_1",
		"ow_Rare_T3_2",
		"ow_Rare_T3_3",
		"ow_Rare_T3_4",
		"ow_Rare_T4_1",
		"ow_Rare_T4_2",
		"ow_Rare_T4_3",
		"ow_Rare_T4_4",
		"ow_Rare_T5_1",
		"ow_Rare_T5_2",
		"ow_Rare_T5_3",
		"ow_Rare_T5_4",
	},
	
	ranks = 
	{
		{
			value 		= 12, -- кол-во собранных предметов
			points		= 10,
		},
	},
}

--достижение на сбор конкретного лута в опенспейсе
Achievements[ ai.AchievementId.SPACE_BUM_FED ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.ITEM_NAME,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	parts = 
	{
		"ow_Rare_T3_1",
		"ow_Rare_T3_2",
		"ow_Rare_T3_3",
		"ow_Rare_T3_4",
		"ow_Rare_T4_1",
		"ow_Rare_T4_2",
		"ow_Rare_T4_3",
		"ow_Rare_T4_4",
		"ow_Rare_T5_1",
		"ow_Rare_T5_2",
		"ow_Rare_T5_3",
		"ow_Rare_T5_4",
	},
	
	ranks = 
	{
		{
			value 		= 1, -- кол-во собранных предметов
			points		= 10,
		},
	},
}


Achievements[ ai.AchievementId.SPACE_BUM_JER ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.ITEM_NAME,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	parts = 
	{
		"ow_Rare_T3_1",
		"ow_Rare_T3_2",
		"ow_Rare_T3_3",
		"ow_Rare_T3_4",
		"ow_Rare_T4_1",
		"ow_Rare_T4_2",
		"ow_Rare_T4_3",
		"ow_Rare_T4_4",
		"ow_Rare_T5_1",
		"ow_Rare_T5_2",
		"ow_Rare_T5_3",
		"ow_Rare_T5_4",
	},
	
	ranks = 
	{
		{
			value 		= 1, -- кол-во собранных предметов
			points		= 10,
		},
	},
}--]]

-- достижение на убийство "пришельцев"
Achievements[ ai.AchievementId.REPELLENT ] = 
{
	--disabled			= true,
	category			= "OPENWORLD",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays			= {	ai.Gameplay.FREE_SPACE,	},
	
	ranks = 
	{	
		{
			steam_id	= "REPELLENT_R1",
			value 		= 1,
			points		= 10,
		},
		
		{
			steam_id	= "REPELLENT_R2",
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "REPELLENT_R3",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "REPELLENT_R4",
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "REPELLENT_R5",
			value 		= 1000,
			points		= 10,
		},		
		
		{
			steam_id	= "REPELLENT_R6",
			value 		= 10000,
			points		= 10,
		},
		
		{
			steam_id	= "REPELLENT_R7",
			value 		= 25000,
			points		= 20,
		},
	},
}


--
Achievements[ ai.AchievementId.CHILD_PROTECTOR ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	
	numerical_conditions = 
	{
		{
			-- разница в Akari-рейтингах игроков #52184 уже в игровом рейтинге.
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 1000,	--300
		},
	},
		
	ranks = 
	{
		{
			value 		= 1, -- кол-во побед в скваде с условием, описанным в numerical_conditions[1]
			points		= 10,
			reward_title = PlayerTitleId.CHILD_PROTECTOR,
		},
	},
}

--
Achievements[ ai.AchievementId.LBRD_TOP_1 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	
	--str_eq_condition	= { "leaderboard_name", },
	numerical_conditions = 
	{
		{
			-- место в лидерборде, которое нужно занять по его окончании
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= 10,
		},
	},
		
	ranks = 
	{
		{
			value 		= 1, -- сколько раз нужно выполнить условие в numerical_conditions[1]
			points		= 0,
		},
	},
}

--
Achievements[ ai.AchievementId.SPACE_ACHIEVER ] = 
{
	value_type			= ai.AchievementValueType.HIGHEST,
	category			= "GREAT",
	
	ranks = 
	{
		{
			value 		= 1000, -- сколько очков достижений нужно набрать
			points		= 0,
			--reward_premium_access = true, -- это какаято древняя дичь, типа "пускать ли игрока в OW..."	(см. тикет SC-120396 и комментарий SC-37110#focus=Comments-4-392019.0-0)
		},
	},
}

-- Наставничество
-- Победы учеников
Achievements[ ai.AchievementId.TEACHING_WINS ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{
		{
			steam_id	= "TEACHING_WINS_R1",
			value 		= 100, -- в базе 100 для тестов ставим 1
			points		= 20,
			--reward_custom_element	= "USSR", -- стикер ("флог СССР") ВАЖНО!!! КАСТОМКА (стикер/краска/покраска/декор) В НАГРАДЕ МОЖЕТ БЫТЬ ТОЛЬКО ОДНА (остальные коментируем. иначе выдаст только нижнюю)
			--reward_custom_element	= "Mosaic_02", -- покраска ("Оранжевый витраж")
			--reward_custom_element	= "Matt_Dawning_Red", -- краска ("Цвет долгой весны") ВАЖНО!!! КАСТОМКА (стикер/краска/покраска/декор) В НАГРАДЕ МОЖЕТ БЫТЬ ТОЛЬКО ОДНА (остальные коментируем. иначе выдаст только нижнюю)
			--reward_custom_element	= "BP18_Robot", -- декор ("Сгибатель")
			reward_ship				= "Ship_Race1_M_T1_Premium", -- корабль (Ghost)
			--reward_title 			= PlayerTitleId.SUPER_TESTER, -- титул "Офицер ЕЦН"
			--reward_premium_access	= true, -- НЕТ, это не "месяц Премиум-лицензии", это какаято древняя дичь, типа "пускать ли игрока в OW..."	(см. тикет SC-120396 и комментарий SC-37110#focus=Comments-4-392019.0-0)		
		},	
	}
}
	
-- Достижение учениками рангов
Achievements[ ai.AchievementId.TEACHING_RANKS ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	--disabled			= true,
	category			= "TACTIC",
	
	numerical_conditions = 
	{
		{
			-- какой ранг должен набрать ученик
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 6,
		},
	},
	
	ranks = 
	{
		{
			steam_id	= "TEACHING_RANKS_R1",
			value 		= 50, -- сколько раз нужно выполнить условие в numerical_conditions[1] | в базе 50 для тестов ставим 1
			points		= 40,
			--reward_custom_element	= "USSR", -- стикер ("флаг СССР")
			--reward_custom_element	= "Mosaic_02", -- покраска ("Оранжевый витраж")
			--reward_custom_element	= "BP19_Matt_19_LightTeal", -- краска ("Бергамот")
			reward_custom_element	= "BP20_Goose", -- декор ("Гуси-лебеди") ВАЖНО!!! КАСТОМКА (стикер/краска/покраска/декор) В НАГРАДЕ МОЖЕТ БЫТЬ ТОЛЬКО ОДНА (остальные коментируем. иначе выдаст только нижнюю)
			--reward_ship			= "Ship_Race3_M_T4_PremUniq", -- корабль (Stingray)
			--reward_title 			= PlayerTitleId.SUPER_TESTER, -- титул "Офицер ЕЦН"
			--reward_premium_access	= true, -- НЕТ, это не "месяц Премиум-лицензии", это какаято древняя дичь, типа "пускать ли игрока в OW..."	(см. тикет SC-120396 и комментарий SC-37110#focus=Comments-4-392019.0-0)
		},
	},
}

-- Победы в скваде вместе с учениками (не используется >>> c 26.08.2025 включено)
Achievements[ ai.AchievementId.TEACHING_TRAINS ] = 
{
	--disabled			= true, -- c 26.08.2025 включено (закомментирована строка)
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC", -- при включении достижения строка раскомментирована
	
	ranks = 
	{
		{
			steam_id	= "TEACHING_TRAINS_R1",
			value 		= 10, -- в базе 10 для тестов ставим 1
			points		= 20, -- очки допуска Пилота в награду за получение достижения
			
			--reward_custom_element	= "USSR", -- стикер ("флаг СССР")
			--reward_custom_element	= "Mosaic_02", -- покраска ("Оранжевый витраж")
			reward_custom_element	= "Matt_Dawning_Red", -- краска ("Цвет долгой весны") ВАЖНО!!! КАСТОМКА (стикер/краска/покраска/декор) В НАГРАДЕ МОЖЕТ БЫТЬ ТОЛЬКО ОДНА (остальные коментируем. иначе выдаст только нижнюю)
			--reward_custom_element	= "BP18_Robot", -- декор ("Сгибатель")
			--reward_ship			= "Ship_Race1_L_T5_PremUniq", -- корабль (Brokk)
			--reward_title 			= PlayerTitleId.SUPER_TESTER, -- титул "Офицер ЕЦН"
			--reward_premium_access	= true, -- НЕТ, это не "месяц Премиум-лицензии", это какаято древняя дичь, типа "пускать ли игрока в OW..."	(см. тикет SC-120396 и комментарий SC-37110#focus=Comments-4-392019.0-0)
		},
	}
}

-- Лайки в скваде с учениками, один лайк - один ученик
Achievements[ ai.AchievementId.TEACHING_LIKES ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{
		{
			steam_id	= "TEACHING_LIKES_R1",
			value 		= 20, -- в базе 20 для тестов ставим 1
			points		= 20,
			--reward_custom_element	= "USSR", -- стикер ("флаг СССР")
			reward_custom_element	= "Crossout_BloodHand02", -- покраска ("Тихий холм") ВАЖНО!!! КАСТОМКА (стикер/краска/покраска/декор) В НАГРАДЕ МОЖЕТ БЫТЬ ТОЛЬКО ОДНА (остальные коментируем. иначе выдаст только нижнюю)
			--reward_custom_element	= "Matt_Dawning_Red", -- краска ("Цвет долгой весны")
			--reward_custom_element	= "BP18_Robot", -- декор ("Сгибатель")
			--reward_title 			= PlayerTitleId.SUPER_TESTER, -- титул "Офицер ЕЦН"
			--reward_ship			= "Ship_Race1_L_T5_PremUniq", -- корабль (Brokk)
			--reward_premium_access	= true, -- НЕТ, это не "месяц Премиум-лицензии", это какаято древняя дичь, типа "пускать ли игрока в OW..."	(см. тикет SC-120396 и комментарий SC-37110#focus=Comments-4-392019.0-0)
		},
	}
}

-- метаачивка за наставничество
Achievements[ ai.AchievementId.TEACHING_META ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.ACHIEVEMENT,
	--disabled			= true,
	category			= "TACTIC",
	
	parts = 
	{
		ai.AchievementId.TEACHING_WINS,
		ai.AchievementId.TEACHING_RANKS,
		ai.AchievementId.TEACHING_LIKES,
		ai.AchievementId.TEACHING_TRAINS
	},
	
	ranks = 
	{
		{
			steam_id	= "TEACHING_META_R1",
			value 		= 4,
			points		= 40,

			reward_custom_element	= "Tutorship", -- стикер ("Наставник") ВАЖНО!!! КАСТОМКА (стикер/краска/покраска/декор) В НАГРАДЕ МОЖЕТ БЫТЬ ТОЛЬКО ОДНА (остальные коментируем. иначе выдаст только нижнюю)
			--reward_custom_element	= "Crossout_BloodHand02", -- покраска ("Тихий холм")
			--reward_custom_element	= "Matt_Dawning_Red", -- краска ("Цвет долгой весны")
			--reward_custom_element	= "BP18_Robot", -- декор ("Сгибатель")
			reward_title 			= PlayerTitleId.TRUE_TEACHER,
			reward_ship				= "Ship_Race5_L_ENGINEER_Rank5", -- добавить выдачу корабль (Waz'Got, 5 ранга)
			--reward_premium_access	= true, -- -- НЕТ, это не "месяц Премиум-лицензии", это какаято древняя дичь, типа "пускать ли игрока в OW..."	(см. тикет SC-120396 и комментарий SC-37110#focus=Comments-4-392019.0-0) 
		},
	}
}

-- великое достижение на убийство пришельцев до релиза игры #43348
Achievements[ ai.AchievementId.ALIENATED ] = 
{
	invisible_by_default = true,
	category			= "GREAT",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{	
		{
			value 		= 10,
			points		= 0,
			reward_title = PlayerTitleId.ALIENATED,
		}
	},
}

-- Орден за вооружение
Achievements[ ai.AchievementId.MEDALS_GROUP_1 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "MEDAL",
	str_eq_condition	= { "RAILGUN", "PLASMAGUN", "LASER", }, 
	
	ranks = 
	{
		{
			steam_id	= "MEDALS_GROUP_1_R1",
			value 		= 10,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_1_R2",
			value 		= 50,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_1_R3",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_1_R4",
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_1_R5",
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_1_R6",
			value 		= 2500,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_1_R7",
			value 		= 5000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_1_R8",
			value 		= 10000,
			points		= 20,
		},
	},
}


-- Орден за пилотирование
Achievements[ ai.AchievementId.MEDALS_GROUP_2 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "MEDAL",
	str_eq_condition	= { "INTERCEPTOR", "ATTACKSHIP", "FRIGATE", }, 
	
	ranks = 
	{
		{
			steam_id	= "MEDALS_GROUP_2_R1",
			value 		= 50,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_2_R2",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_2_R3",
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_2_R4",
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_2_R5",
			value 		= 2500,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_2_R6",
			value 		= 5000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_2_R7",
			value 		= 10000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_2_R8",
			value 		= 25000,
			points		= 20,
		},
	},
}


-- Орден за убийство
Achievements[ ai.AchievementId.MEDALS_GROUP_3 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "MEDAL",
	str_eq_condition	= { "MULTIKILLS", "SPREE", "SPECIALKILLS", "SPECIAL", }, 
	
	ranks = 
	{
		{
			steam_id	= "MEDALS_GROUP_3_R1",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_3_R2",
			value 		= 250,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_3_R3",
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_3_R4",
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_3_R5",
			value 		= 5000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_3_R6",
			value 		= 10000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_3_R7",
			value 		= 50000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_3_R8",
			value 		= 100000,
			points		= 20,
		},
	},
}


-- Орден за захват
Achievements[ ai.AchievementId.MEDALS_GROUP_4 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "MEDAL",
	str_eq_condition	= { "DRONES", "BEACON", }, 
	
	ranks = 
	{
		{
			steam_id	= "MEDALS_GROUP_4_R1",
			value 		= 50,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_4_R2",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_4_R3",
			value 		= 500,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_4_R4",
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_4_R5",
			value 		= 2500,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_4_R6",
			value 		= 5000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_4_R7",
			value 		= 10000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_4_R8",
			value 		= 15000,
			points		= 20,
		},
	},
}


-- Орден за захват
Achievements[ ai.AchievementId.MEDALS_GROUP_5 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "MEDAL",
	str_eq_condition	= { "FIRST", "SURVIVE", "OTHERS", }, 
	
	ranks = 
	{
		{
			steam_id	= "MEDALS_GROUP_5_R1",
			value 		= 100,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_5_R2",
			value 		= 250,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_5_R3",
			value 		= 1000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_5_R4",
			value 		= 2500,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_5_R5",
			value 		= 5000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_5_R6",
			value 		= 10000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_5_R7",
			value 		= 25000,
			points		= 10,
		},
		
		{
			steam_id	= "MEDALS_GROUP_5_R8",
			value 		= 40000,
			points		= 20,
		},
	},
}


Achievements[ ai.AchievementId.RAID_1_WIN ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	str_eq_condition	= { "pve_raid", },

	ranks = 
	{	
		{
			value 		= 1,
			points		= 20,
		},
	},
}


Achievements[ ai.AchievementId.RAID_1_HARD ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	str_eq_condition	= { "pve_raid", },

	numerical_conditions = 
	{
		{
			-- сколько раз можно умереть в бою с боссом
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= 0,
		},
	},
	
	ranks = 
	{
		{
			points		= 30,
			value 		= 1, -- сколько боев нужно провести с выполнением условия в numerical_conditions[1]
		},
	},
}


Achievements[ ai.AchievementId.RAID_1_IMMORTAL ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	str_eq_condition	= { "pve_raid", },

	numerical_conditions = 
	{
		{
			-- сколько раз можно умереть в бою с боссом
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= 0,
		},
	},
	
	ranks = 
	{
		{
			points		= 50,
			value 		= 1, -- сколько боев нужно провести с выполнением условия в numerical_conditions[1]
			reward_title = PlayerTitleId.IMMORTAL,
		},
	},
}

-- 
Achievements[ ai.AchievementId.EFF_RATING ] = 
{
	--disabled			= true,
	value_type			= ai.AchievementValueType.HIGHEST,
	category			= "TACTIC",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{	
		{
			value 		= 2500,
			points		= 10,
			reward_title = PlayerTitleId.RATING_RANK1,
		},
		
		{
			value 		= 5000,
			points		= 10,
			reward_title = PlayerTitleId.RATING_RANK2,
		},
		
		{
			value 		= 7500,
			points		= 10,
			reward_title = PlayerTitleId.RATING_RANK3,
			
		},
	},
}

-- За контроль минимум одного сектора в старой БЗС #47016
Achievements[ ai.AchievementId.CONQUEROR_S2 ] = 
{
	--disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			
		},
	},
}


-- За контроль максимального кол-ва секторов в БЗС, топ-3 корпораций. #47016
Achievements[ ai.AchievementId.CONQUEROR_S2_TOP ] = 
{
	--disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.CONQUEROR,
		},
	},
}


-- Всем игрокам в корпорациях, которые набрали больше 1000 очков влияния #47016
Achievements[ ai.AchievementId.INFLUENCE_S2 ] = 
{
	--disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- Всем игрокам в корпорациях, попавших в топ-10 лидерборда, по количеству очков влияния #47016
Achievements[ ai.AchievementId.INFLUENCE_S2_TOP ] = 
{
	--disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.VANQUISHER,
		}, 
	},
}

-- достижение за доигранные в БзС бои. #47016
Achievements[ ai.AchievementId.CHALLENGER_S2 ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	
	invisible_by_default = true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- достижение для дня валентина. #49272
Achievements[ ai.AchievementId.CRUSHING ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	
	numerical_conditions = 
	{
		{
			-- за сколько секунд до смерти засчитывается (при ассисте)
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= 3.0,
		},
	},
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
		},
	},
}

--
Achievements[ ai.AchievementId.CS_BUILDER ] = 
{
	disabled			= true,
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- Достижение на выполнение ПвП-квестов "охота на мисс Саммер", в рамках летнего эвента. #53067
Achievements[ ai.AchievementId.SUMMER_PVP ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,
		
	ranks = 
	{
		{
			value 		= 1, 
			points		= 0,
		},
		
		{
			value 		= 10, 
			points		= 0,
		},
		
		{
			value 		= 20, 
			points		= 0,
		},
		
		{
			value 		= 30, 
			points		= 0,
		},
	},
}

-- Достижение на выполнение ПвЕ-квестов "охота на мисс Саммер", в рамках летнего эвента. #53067
Achievements[ ai.AchievementId.SUMMER_PVE ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 1, 
			points		= 0,
		},
		
		{
			value 		= 10, 
			points		= 0,
		},
		
		{
			value 		= 20, 
			points		= 0,
		},
		
		{
			value 		= 30, 
			points		= 0,
		},
	},
}

-- Достижение на выполнение ОВ-квестов "охота на мисс Саммер", в рамках летнего эвента. #53067
Achievements[ ai.AchievementId.SUMMER_OW ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,
	
	ranks = 
	{
		{
			value 		= 1, 
			points		= 0,
		},
		
		{
			value 		= 10, 
			points		= 0,
		},
		
		{
			value 		= 20, 
			points		= 0,
		},
		
		{
			value 		= 30, 
			points		= 0,
		},
	},
}

-- Мета достижение за выполнение всех ПвП, ПвЕ и ОВ квестов "охота на мисс Саммер", в рамках летнего эвента. #53067
Achievements[ ai.AchievementId.SUMMER_META ] =
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.ACHIEVEMENT,
	category			= "GREAT",
	invisible_by_default = true,
	
	parts = 
	{
		ai.AchievementId.SUMMER_PVP,
		ai.AchievementId.SUMMER_PVE,
		ai.AchievementId.SUMMER_OW,
	},
	
	ranks = 
	{
		{
			value 					= 3,
			points					= 0,
			reward_ship			= "Ship_Race2_S_T3_Pirate",
		},
	},
}

-- достижение за прохождение ПвЕ-миссии на карте планет_вар. во время хеллоуинского эвента
Achievements[ ai.AchievementId.PVE_PLANETWAR_WIN  ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	invisible_by_default = true,
	str_eq_condition	= { "pve_wave_planet_war", },

	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
		},
	},
}

Achievements[ ai.AchievementId.LEAGUE_WIN_1  ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	disabled			= true, --отключил в связи с окончанием тестового сезона лиг
	invisible_by_default = true,

	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
		},
	},
}

Achievements[ ai.AchievementId.LEAGUE_WIN_2  ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "GREAT",
	disabled			= true, --отключил в связи с окончанием тестового сезона лиг
	invisible_by_default = true,

	ranks = 
	{	
		{
			value 		= 50,
			points		= 0,
		},
	},
}

-- достижение НГ эвента, за 7 квестов на килл агентов в ПвЕ-миссии
Achievements[ ai.AchievementId.NY_QUEST_1 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type 			= ai.AchievementPartType.QUEST,
	category			= "GREAT",
	subCategory			= "NEW_YEAR",
	
	parts = 
	{
		QuestId.NY_DAILY_1,
		QuestId.NY_DAILY_2,
		QuestId.NY_DAILY_3,
		QuestId.NY_DAILY_4,
		QuestId.NY_DAILY_5,
		QuestId.NY_DAILY_6,
		QuestId.NY_DAILY_7,
	},
	
	ranks = 
	{	
		{
			value 		= 7,
			points		= 0,
		},
	},
}

-- достижение НГ эвента, за 4 квеста на карте с упавшим дредноутом.
Achievements[ ai.AchievementId.NY_QUEST_2 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type 			= ai.AchievementPartType.QUEST,
	category			= "GREAT",
	subCategory			= "NEW_YEAR",
	
	parts = 
	{
		QuestId.NY_DAILY_8,
		QuestId.NY_DAILY_9,
		QuestId.NY_DAILY_10,
		QuestId.NY_DAILY_11,
	},
	
	ranks = 
	{	
		{
			value 		= 4,
			points		= 0,
		},
	},
}

-- достижение НГ эвента, за 2 квеста на пролет по точкам в открытом мире
Achievements[ ai.AchievementId.NY_QUEST_3 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type 			= ai.AchievementPartType.QUEST,
	category			= "GREAT",
	subCategory			= "NEW_YEAR",
	
	parts = 
	{
		QuestId.NY_DAILY_12,
		QuestId.NY_DAILY_13,
	},
	
	ranks = 
	{	
		{
			value 		= 2,
			points		= 0,
		},
	},
}

-- достижение НГ эвента, за 1 победу на карте da_deathstar
Achievements[ ai.AchievementId.NY_QUEST_4 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type 			= ai.AchievementPartType.QUEST,
	category			= "GREAT",
	subCategory			= "NEW_YEAR",
	
	parts = 
	{
		QuestId.NY_DAILY_14,
		QuestId.NY_DAILY_15,
		QuestId.NY_DAILY_16,
		QuestId.NY_DAILY_17,
	},
	
	ranks = 
	{	
		{
			value 		= 4,
			points		= 0,
		},
	},
}

-- достижение НГ эвента, за выполнение поручения в фриспейсе
Achievements[ ai.AchievementId.NY_QUEST_5 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type 			= ai.AchievementPartType.QUEST,
	category			= "GREAT",
	subCategory			= "NEW_YEAR",
	
	parts = 
	{
		QuestId.NY_DAILY_19,
		QuestId.NY_DAILY_20,
		QuestId.NY_DAILY_21,
		QuestId.NY_DAILY_22,
		QuestId.NY_DAILY_23,
	},
	
	ranks = 
	{	
		{
			value 		= 5,
			points		= 0,
		},
	},
}

-- достижение НГ эвента, за убийство агентов мисс саммер
Achievements[ ai.AchievementId.NY_QUEST_6 ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type 			= ai.AchievementPartType.QUEST,
	category			= "GREAT",
	subCategory			= "NEW_YEAR",
	
	parts = 
	{
		QuestId.NY_DAILY_24,
		QuestId.NY_DAILY_25,
		QuestId.NY_DAILY_26,
		QuestId.NY_DAILY_27,
		QuestId.NY_DAILY_28,
		--QuestId.NY_DAILY_29,
		--QuestId.NY_DAILY_30,
	},
	
	ranks = 
	{	
		{
			value 		= 5,
			points		= 0,
		},
	},
}

-- мета достижение за выполнение всех достижений нового года.
Achievements[ ai.AchievementId.NY_META ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type			= ai.AchievementPartType.ACHIEVEMENT,
	category			= "GREAT",
	
	parts = 
	{
		ai.AchievementId.NY_QUEST_1,
		--ai.AchievementId.NY_QUEST_2, выключил достижение из мета ачивки, т.к. тяжело получить казуалам.
		ai.AchievementId.NY_QUEST_3,
		ai.AchievementId.NY_QUEST_4,
		ai.AchievementId.NY_QUEST_5,
		ai.AchievementId.NY_QUEST_6,
		ai.AchievementId.NY_COLD_BLOOD,
	},
	
	ranks = 
	{
		{
			value 					= 6,
			points					= 0,
			reward_title 			= PlayerTitleId.NY_META_TITLE,
		},
	},
}


-- достижение на выживание эсминца в победном бою.
Achievements[ ai.AchievementId.DESTROYER_ALIVE ] =
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "SHIPS",
	subCategory			= "DESTROYER",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{
		{
			value 		= 1,
			points		= 10,
		},
	},
}

-- достижение на убийство кораблей на эсминце
Achievements[ ai.AchievementId.DESTROYER_KILLS ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "SHIPS",
	subCategory			= "DESTROYER",
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
		},
		
		{
			value 		= 5,
			points		= 10,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 50,
			points		= 10,
		},
		
		{
			value 		= 100,
			points		= 20,
		},
		
		{
			value 		= 1000,
			points		= 30,
		},
	},
}

-- одержите победы на эсминце
Achievements[ ai.AchievementId.DESTROYER_WINS ] = 
{
	category			= "SHIPS",
	subCategory			= "DESTROYER",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	gameplays 			= ai.GameplayGroups.pvp,
	coop_vs_ai 			= false,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 50,
			points		= 10,
		},
		
		{
			value 		= 100,
			points		= 20,
		},
	},
}

-- убейте вражеские эсминцы, пилотируя свой
Achievements[ ai.AchievementId.DESTROYER_KILL_DESTROYER ] = 
{
	category			= "SHIPS",
	subCategory			= "DESTROYER",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 50,
			points		= 10,
		},
		
		{
			value 		= 100,
			points		= 20,
		},
	},
}

-- получите эсминец
Achievements[ ai.AchievementId.SHIPS_HUGE ] = 
{
	category			= "SHIPS",
	subCategory		= "DESTROYER",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
		},
		
		{
			value 		= 2,
			points		= 10,
		},
		
		{
			value 		= 3,
			points		= 10,
		},
	},
}

-- нанесите Х урона пилотируя эсминец
Achievements[ ai.AchievementId.DESTROYER_DAMAGE ] = 
{
	category			= "SHIPS",
	subCategory		= "DESTROYER",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{	
		{
			value 		= 50000,
			points		= 10,
		},
		
		{
			value 		= 250000,
			points		= 10,
		},
		
		{
			value 		= 1000000,
			points		= 10,
		},
		
		{
			value 		= 3000000,
			points		= 20,
		},
	},
}

-- пройдите спецоперацию на эсминце. 
Achievements[ ai.AchievementId.DESTROYER_RAID ] = 
{
	category			= "SHIPS",
	subCategory		= "DESTROYER",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
		},
	},
}

-- прокачайте синергию у эсминцев.
Achievements[ ai.AchievementId.DESTROYER_SYNERGETIC ] = 
{
	category			= "SHIPS",
	subCategory		= "DESTROYER",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
		},
		
		{
			value 		= 2,
			points		= 10,
		},
		
		{
			value 		= 3,
			points		= 10,
		},
	},
}

-- уничтожьте Х кораблей чужих в опенспейсе летая на эсминце решили отключить данный тип ачивок.
Achievements[ ai.AchievementId.DESTROYER_ALIEN_KILLER ] = 
{
	disabled			= true,
	invisible_by_default = true,
	category			= "SHIPS",
	subCategory		= "DESTROYER",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
		},
		
		{
			value 		= 5,
			points		= 0,
		},
		
		{
			value 		= 10,
			points		= 0,
		},
		
		{
			value 		= 100,
			points		= 0,
		},
		
		{
			value 		= 1000,
			points		= 0,
		},
	},
}

-- Ачивка за первое место в сезоне Лиг
Achievements[ ai.AchievementId.LEAGUE_1PLACE ]= 
{

	category			= "GREAT",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.LEAGUE_1PLACE,
		},

	},
}

-- Ачивка за второе место в сезоне Лиг
Achievements[ ai.AchievementId.LEAGUE_2PLACE ]= 
{

	category			= "GREAT",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.LEAGUE_2PLACE,
		},

	},
}

-- Ачивка за третье место в сезоне Лиг
Achievements[ ai.AchievementId.LEAGUE_3PLACE ]= 
{

	category			= "GREAT",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.LEAGUE_3PLACE,
			
		},

	},
}

-- Ачивка за выход в плейофф Лиг
Achievements[ ai.AchievementId.LEAGUE_TOPN ]= 
{

	category			= "LEAGUES",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	str_eq_condition	= { "league_rating", },
	
		numerical_conditions = 
	{
		{
			-- с первого по какое место в лидерборде выдается ачивка
			comparison	= ai.Comparison.LESSER_OR_EQUAL,
			value 		= 8,
		},
	},
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.LEAGUE_TOPN,
		},

	},
}

-- Великое достижение за участие в тестовом сезоне Лиг
Achievements[ ai.AchievementId.LEAGUE_PLAYED ]= 
{

	category			= "GREAT",
	value_type			= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default = true,
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.LEAGUE_PLAYED,
		},

	},
}

--Достижения за год регистрации на юбилей ск 5 лет

Achievements[ ai.AchievementId.OLDFAG_2012 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.FORERUNNER,
		},

	},
}

Achievements[ ai.AchievementId.OLDFAG_2013 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.ADVISOR,
		},

	},
}

Achievements[ ai.AchievementId.OLDFAG_2014 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.GUARDIAN,
		},

	},
}

Achievements[ ai.AchievementId.OLDFAG_2015 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.STRATEGIST,
		},

	},
}

Achievements[ ai.AchievementId.OLDFAG_2016 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.TRAIN,
		},

	},
}

Achievements[ ai.AchievementId.OLDFAG_2017 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.PROMISING_ONE,
		},

	},
}

--Достижения за год регистрации на юбилей ск 10 лет

Achievements[ ai.AchievementId.ANNIVERSARY_10Y_2012 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.ANNIVERSARY_10Y_1,
		},

	},
}

Achievements[ ai.AchievementId.ANNIVERSARY_10Y_2015 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.ANNIVERSARY_10Y_2,
		},

	},
}

Achievements[ ai.AchievementId.ANNIVERSARY_10Y_2018 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.ANNIVERSARY_10Y_3,
		},

	},
}

Achievements[ ai.AchievementId.ANNIVERSARY_10Y_2021 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.ANNIVERSARY_10Y_4,
		},

	},
}

Achievements[ ai.AchievementId.ANNIVERSARY_10Y_2022 ]= 
{

	category				= "GREAT",
	value_type				= ai.AchievementValueType.CUMULATIVE,
	invisible_by_default 	= true,
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
			reward_title = PlayerTitleId.ANNIVERSARY_10Y_5,
		},

	},
}

-- достижение для дня валентина для корабля Thar'ga #0072619
Achievements[ ai.AchievementId.CRUSHING_SHIP ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	str_eq_condition 	= { "Ship_Race5_M_ATTACK_Rank5", },
	
	numerical_conditions = 
	{
		{
			-- за сколько секунд до смерти засчитывается (при ассисте)
			comparison			= ai.Comparison.LESSER_OR_EQUAL,
			value 				= 3.0,
		},
	},
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 0,
		},
	},
}

-- #0088986: Добавить вознаграждение за получение высоких рангов аккаунта
Achievements[ ai.AchievementId.ACCOUNT_RANK ] =
{
	value_type			= ai.AchievementValueType.HIGHEST,
	category			= "LIFETIME",

	ranks =
	{
		{
			value 		= 15,
			points		= 10,
			reward_title = PlayerTitleId.LEVEL_15,
		},
		
		{
			value 		= 20,
			points		= 10,
			reward_title = PlayerTitleId.LEVEL_20,
		},
		
		{
			value 		= 25,
			points		= 10,
			reward_title = PlayerTitleId.LEVEL_25,
		},
	},
}

-- #0095978: Футбол 2: сделать ачивмент за победы в футболе
Achievements[ ai.AchievementId.FOOTBALL_CHAMPION ] =
{
    value_type = ai.AchievementValueType.CUMULATIVE,
    category = "LIFETIME",

    ranks =
    {
        {
            value = 250,
            points = 10,
            reward_title = PlayerTitleId.FOOTBALL,
        },
    },
}


-- сколько миссий в бесконечной пве поднято до 2-го уровня
Achievements[ ai.AchievementId.UNLIM_PVE_MISSION_LEVEL_1 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	subCategory			= "UNLIM_PVE",

	numerical_conditions = 
	{
		{
			-- до этого значения нужно поднять уровень миссии
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 2,
		},
	},
	
	ranks = 
	{
		{
			value 		= 1,	-- сколько миссий нужно поднять до уровня из условия в numerical_conditions
			points		= 5,
		},
		
		{
			value 		= 3,
			points		= 10,
		},
		
		{
			value 		= 5,
			points		= 15,
		},

		{
			value 		= 10,
			points		= 20,
		},
	},
}


-- сколько миссий в бесконечной пве поднято до 10-го уровня
Achievements[ ai.AchievementId.UNLIM_PVE_MISSION_LEVEL_2 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	subCategory			= "UNLIM_PVE",

	numerical_conditions = 
	{
		{
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 10,	-- до этого значения нужно поднять уровень миссии
		},
	},
	
	ranks = 
	{
		{
			value 		= 1,	-- сколько миссий нужно поднять до уровня из условия в numerical_conditions
			points		= 5,
		},
		
		{
			value 		= 3,
			points		= 10,
		},
		
		{
			value 		= 5,
			points		= 15,
		},

		{
			value 		= 10,
			points		= 20,
		},
	},
}

-- сколько миссий в бесконечной пве поднято до 20-го уровня
Achievements[ ai.AchievementId.UNLIM_PVE_MISSION_LEVEL_3 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	subCategory			= "UNLIM_PVE",

	numerical_conditions = 
	{
		{
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 20,	-- до этого значения нужно поднять уровень миссии
		},
	},
	
	ranks = 
	{
		{
			value 		= 1,	-- сколько миссий нужно поднять до уровня из условия в numerical_conditions
			points		= 5,
		},
		
		{
			value 		= 3,
			points		= 10,
		},
		
		{
			value 		= 5,
			points		= 15,
		},

		{
			value 		= 10,
			points		= 20,
		},
	},
}

-- сколько миссий в бесконечной пве поднято до 30-го уровня
Achievements[ ai.AchievementId.UNLIM_PVE_MISSION_LEVEL_4 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	subCategory			= "UNLIM_PVE",

	numerical_conditions = 
	{
		{
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 30,	-- до этого значения нужно поднять уровень миссии
		},
	},
	
	ranks = 
	{
		{
			value 		= 1,	-- сколько миссий нужно поднять до уровня из условия в numerical_conditions
			points		= 5,
		},
		
		{
			value 		= 3,
			points		= 10,
		},
		
		{
			value 		= 5,
			points		= 15,
		},

		{
			value 		= 10,
			points		= 20,
		},
	},
}

-- сколько миссий в бесконечной пве поднято до 40-го уровня
Achievements[ ai.AchievementId.UNLIM_PVE_MISSION_LEVEL_5 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	subCategory			= "UNLIM_PVE",

	numerical_conditions = 
	{
		{
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 40,	-- до этого значения нужно поднять уровень миссии
		},
	},
	
	ranks = 
	{
		{
			value 		= 1,	-- сколько миссий нужно поднять до уровня из условия в numerical_conditions
			points		= 5,
		},
		
		{
			value 		= 3,
			points		= 10,
		},
		
		{
			value 		= 5,
			points		= 15,
		},

		{
			value 		= 10,
			points		= 20,
		},
	},
}

-- сколько миссий в бесконечной пве поднято до 50-го уровня
Achievements[ ai.AchievementId.UNLIM_PVE_MISSION_LEVEL_6 ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "PVE",
	subCategory			= "UNLIM_PVE",

	numerical_conditions = 
	{
		{
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 50,	-- до этого значения нужно поднять уровень миссии
		},
	},
	
	ranks = 
	{
		{
			value 		= 1,	-- сколько миссий нужно поднять до уровня из условия в numerical_conditions
			points		= 5,
		},
		
		{
			value 		= 3,
			points		= 10,
		},
		
		{
			value 		= 5,
			points		= 15,
		},

		{
			value 		= 10,
			points		= 20,
		},
	},
}

-- до какого уровня прокачан бафф 1 игрока в бесконечной пве
Achievements[ ai.AchievementId.UNLIM_PVE_PLAYER_LEVEL_1 ] = 
{
	value_type			= ai.AchievementValueType.HIGHEST,
	category			= "PVE",
	subCategory			= "UNLIM_PVE",

	ranks = 
	{
		{
			value 		= 5,	-- до какого уровня надо прокачать бафф
			points		= 5,
		},
		
		{
			value 		= 20,
			points		= 5,
		},
		
		{
			value 		= 40,
			points		= 5,
		},

		{
			value 		= 60,
			points		= 10,
		},
		
		{
			value 		= 80,
			points		= 10,
		},
		
		{
			value 		= 100,
			points		= 10,
		},
		
		{
			value 		= 150,
			points		= 20,
		},
	},
}

-- до какого уровня прокачан бафф 2 игрока в бесконечной пве
Achievements[ ai.AchievementId.UNLIM_PVE_PLAYER_LEVEL_2 ] = 
{
	value_type			= ai.AchievementValueType.HIGHEST,
	category			= "PVE",
	subCategory			= "UNLIM_PVE",
	
	ranks = 
	{
		{
			value 		= 5,	-- до какого уровня надо прокачать бафф
			points		= 5,
		},
		
		{
			value 		= 20,
			points		= 5,
		},
		
		{
			value 		= 40,
			points		= 5,
		},

		{
			value 		= 60,
			points		= 10,
		},
		
		{
			value 		= 80,
			points		= 10,
		},
		
		{
			value 		= 100,
			points		= 10,
		},
		
		{
			value 		= 150,
			points		= 20,
		},
	},
}

Achievements[ ai.AchievementId.OAA_KILL_TARGET ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= { ai.Gameplay.ONE_AGAINST_ALL, },
	
	ranks = 
	{
		{
			value 		= 5,	-- до какого уровня надо прокачать бафф
			points		= 5,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 20,
			points		= 20,
		},

		{
			value 		= 50,
			points		= 30,
		},
	},
}

Achievements[ ai.AchievementId.OAA_KILL_HUNTERS ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= { ai.Gameplay.ONE_AGAINST_ALL, },
	
	ranks = 
	{
		{
			value 		= 5,	-- до какого уровня надо прокачать бафф
			points		= 5,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 20,
			points		= 20,
		},

		{
			value 		= 50,
			points		= 30,
		},
	},
}

Achievements[ ai.AchievementId.OAA_KILL_BOSS ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= { ai.Gameplay.ONE_AGAINST_ALL, },
	
	ranks = 
	{
		{
			value 		= 5,	-- до какого уровня надо прокачать бафф
			points		= 5,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 20,
			points		= 20,
		},

		{
			value 		= 50,
			points		= 30,
		},
	},
}

Achievements[ ai.AchievementId.OAA_PROTECT_TARGET ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "TACTIC",
	gameplays 			= { ai.Gameplay.ONE_AGAINST_ALL, },
	
	ranks = 
	{
		{
			value 		= 5,	-- до какого уровня надо прокачать бафф
			points		= 5,
		},
		
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 20,
			points		= 20,
		},

		{
			value 		= 50,
			points		= 30,
		},
	},
}

-- #0110211: Сделать ачивку на голодные игры.
Achievements[ ai.AchievementId.HUNGER_GAMES_CHAMPION ] =
{
    value_type = ai.AchievementValueType.CUMULATIVE,
    category = "LIFETIME",

    ranks =
    {
        {
            value = 42,
            points = 10,
            reward_title = PlayerTitleId.HUNGER_GAMES,
        },
    },
}

-- Достигнут максимальный уровень на этапе 1 в событии BattlePass
Achievements[ ai.AchievementId.BATTLE_PASS_STAGE_1 ] =
{
    value_type = ai.AchievementValueType.HIGHEST,
    category = "LIFETIME",

    ranks =
    {
        {
            value = 1,
            points = 10,
        },
    },
}

-- Достигнут максимальный уровень на этапе 2 в событии BattlePass
Achievements[ ai.AchievementId.BATTLE_PASS_STAGE_2 ] =
{
    value_type = ai.AchievementValueType.HIGHEST,
    category = "LIFETIME",

    ranks =
    {
        {
            value = 1,
            points = 10,
        },
    },
}

-- Достигнут максимальный уровень на этапе 3 в событии BattlePass
Achievements[ ai.AchievementId.BATTLE_PASS_STAGE_3 ] =
{
    value_type = ai.AchievementValueType.HIGHEST,
    category = "LIFETIME",

    ranks =
    {
        {
            value = 1,
            points = 10,
        },
    },
}


-- максимальная пройденная волна в волновой пве
Achievements[ ai.AchievementId.WAVE_PVE_MAX_WAVE_1 ] =
{
	value_type = ai.AchievementValueType.HIGHEST,
	category	= "PVE",
	subCategory	= "WAVE_PVE",
	
	ranks =
	{
		{
			value = 10,	-- цель - пройти эту волну
			points = 5,
		},
	},
}

-- максимальная пройденная волна в волновой пве
Achievements[ ai.AchievementId.WAVE_PVE_MAX_WAVE_2 ] =
{
	value_type = ai.AchievementValueType.HIGHEST,
	category	= "PVE",
	subCategory	= "WAVE_PVE",
	
	ranks =
	{
		{
			value = 20, -- цель - пройти эту волну
			points = 5,
		},
	},
}

-- максимальная пройденная волна в волновой пве
Achievements[ ai.AchievementId.WAVE_PVE_MAX_WAVE_3 ] =
{
	value_type = ai.AchievementValueType.HIGHEST,
	category	= "PVE",
	subCategory	= "WAVE_PVE",
		
	ranks =
	{
		{
			value = 30, -- цель - пройти эту волну
			points = 5,
		},
	},
}

-- максимальная пройденная волна в волновой пве
Achievements[ ai.AchievementId.WAVE_PVE_MAX_WAVE_4 ] =
{
	value_type = ai.AchievementValueType.HIGHEST,
	category	= "PVE",
	subCategory	= "WAVE_PVE",
	
	ranks =
	{
		{
			value = 40, -- цель - пройти эту волну
			points = 5,
		},
	},
}

-- максимальная пройденная волна в волновой пве
Achievements[ ai.AchievementId.WAVE_PVE_MAX_WAVE_5 ] =
{
	value_type = ai.AchievementValueType.HIGHEST,
	category	= "PVE",
	subCategory	= "WAVE_PVE",
	
	ranks =
	{
		{
			value = 50, -- цель - пройти эту волну
			points = 10,
		},
	},
}

-- достижение за апрельскую потасовку
Achievements[ ai.AchievementId.ATDM_KILLS ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	gameplays 			= ai.GameplayGroups.april,
	coop_vs_ai 			= false,
	ranks = 
	{	
		{
			value 		= 10,
			points		= 10,
		},
		
		{
			value 		= 100,
			points		= 20,
		},
		
		{
			value 		= 300,
			points		= 30,
		},
	},
}

Achievements[ ai.AchievementId.APRIL_CTRL_CAPTURE_VP ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	gameplays 			= ai.GameplayGroups.april,
	
	numerical_conditions = 
	{
		{
			-- сколько процентов маяка должен игрок "снять", чтобы захват засчитался
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 0.3,
		},
		
		{
			-- сколько маяков нужно захватить описанным в numerical_conditions[1] способом
			comparison	= ai.Comparison.GREATER_OR_EQUAL,
			value 		= 1,
		},
	},
	
	ranks = 
	{
		{
			points		= 10,
			value 		= 10, -- сколько раз нужно выполнить условие в numerical_conditions[2]
		},
		{
			points		= 20,
			value 		= 30, -- сколько раз нужно выполнить условие в numerical_conditions[2]
		},
		{
			points		= 30,
			value 		= 100, -- сколько раз нужно выполнить условие в numerical_conditions[2]
		},
	},
}

Achievements[ ai.AchievementId.AUTOGEN_DM_KILLS ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	gameplays 			= { ai.Gameplay.AUTOGEN_DM, },
	coop_vs_ai 			= false,
	ranks = 
	{	
		{
			value 		= 100,
			points		= 10,
		},
		
		{
			value 		= 250,
			points		= 20,
		},
		
		{
			value 		= 500,
			points		= 40,
		},
	},
}

Achievements[ ai.AchievementId.THREE_TEAMS_DM_WIN ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	gameplays 			= { ai.Gameplay.THREE_TEAMS_DM, },
	coop_vs_ai 			= false,
	ranks = 
	{	
		{
			value 		= 5,
			points		= 10,
		},
		
		{
			value 		= 10,
			points		= 20,
		},
		
		{
			value 		= 40,
			points		= 40,
		},
	},
}

Achievements[ ai.AchievementId.FIND_CAR ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type 			= ai.AchievementPartType.QUEST,
	category			= "OPENWORLD",
	invisible_by_default = true,
	
	parts = 
	{
		QuestId.OW_April2021_End,
	},
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
			reward_title 			= PlayerTitleId.SPACETRUCK,
		},
	},
}

Achievements[ ai.AchievementId.APRIL_2023_FIND_EGG ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type 			= ai.AchievementPartType.QUEST,
	category			= "OPENWORLD",
	invisible_by_default = true,
	
	parts = 
	{
		QuestId.OW_April2023_main,
	},
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
			reward_title 			= PlayerTitleId.APRIL23_EGG,
		},
	},
}

Achievements[ ai.AchievementId.FIND_COOKIE_PILOT ] = 
{
	value_type			= ai.AchievementValueType.LIST,
	part_type 			= ai.AchievementPartType.QUEST,
	category			= "OPENWORLD",
	invisible_by_default = true,
	
	parts = 
	{
		QuestId.OW_PikabuEvent,
	},
	
	ranks = 
	{	
		{
			value 		= 1,
			points		= 10,
			reward_title 			= PlayerTitleId.COOKIE_PILOT,
		},
	},
}

Achievements[ ai.AchievementId.CLOSE_DISTANCE_WIN ] = 
{
	value_type			= ai.AchievementValueType.CUMULATIVE,
	category			= "LIFETIME",
	gameplays 			= { ai.Gameplay.CLOSE_DISTANCE, },
	coop_vs_ai 			= false,
	ranks = 
	{	
		{
			value 		= 5,
			points		= 10,
		},
		
		{
			value 		= 15,
			points		= 20,
		},
		
		{
			value 		= 30,
			points		= 40,
		},
	},
}

-- дредноуты SC-111587
local BFS = {
	BFS_WIN				= {2,10,50,250,1000,5000}, -- победа в завоевании, прогресс на 1
	BFS_DIVERSANT		= {2,10,50,250,1000,5000}, -- захват охладителя/командной рубки/эмиттера щита, прогресс на 1;
	BFS_BOMBER			= {2,10,50,250,1000,5000}, -- заложить бомбу на вражеском дредноуте, прогресс на 1;
	BFS_ANTI_TORPEDO	= {10,100,1000,10000}, -- сбить торпеду, прогресс на 1;
	BFS_EARN_PRESSURE	= {1000,10000,100000,1000000,10000000}, -- получение индивидуальных очков влияния, прогресс на количество очков;
	BFS_KILL_STUFF		= {10,100,1000,10000}, -- уничтожение всякого убиваемого на дредноуте, за что дают очки захвата (кроме туррелей), прогресс на 1;
	BFS_KILL_TURRET		= {10,100,1000,10000}, -- уничтожение туррели, прогресс на 1;
	BFS_KILL_PLAYER		= {2,10,100,1000,10000}, -- убийство игрока, прогресс на 1;
	BFS_KILL_DRONE		= {10,100,1000,10000}, -- убийство дрона, прогресс на 1;
}

for aname, a in pairs(BFS) do
	Achievements[ ai.AchievementId[aname]] =
	{
		value_type = ai.AchievementValueType.CUMULATIVE,
		category	= "BFS",
		--subCategory	= aname,
		gameplays	= {	ai.Gameplay.CLANSHIP, },
		
		ranks = {}
	}
	for i = 1, #a do
		Achievements[ ai.AchievementId[aname]].ranks[i] =
			{
				value = a[i],
				points = 5 * i,
			}
	end
end

-- Порталы SC-111587
local ARENA = {
	ARENA_WIN			= {2,10,50,250,1000,5000}, -- победа в порталах, прогресс на 1
	ARENA_EARN_PRESSURE = {1000,10000,100000,1000000,10000000}, -- получение индивидуальных очков влияния, прогресс на количество очков;
	ARENA_CAPTURE_VP	= {2,10,50,250,1000,5000}, -- захват маяки, прогресс на 1;
	ARENA_KILL_PLAYER	= {2,10,100,1000,10000}, -- убийство игрока, прогресс на 1;
	ARENA_KILL_DRONE	= {10,100,1000,10000}, -- уничтожение охранного дрона, прогресс на 1;
}

for aname, a in pairs(ARENA) do
	Achievements[ ai.AchievementId[aname]] =
	{
		value_type = ai.AchievementValueType.CUMULATIVE,
		category	= "ARENA",
		--subCategory	= aname,
		gameplays	= {	ai.Gameplay.CAPTURE_THE_BASE, },
		
		ranks = {}
	}
	for i = 1, #a do
		Achievements[ ai.AchievementId[aname]].ranks[i] =
			{
				value = a[i],
				points = 5 * i,
			}
	end
end
