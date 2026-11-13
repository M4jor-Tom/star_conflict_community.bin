--[[
	настройки системы "переговоров в бою"
	
	каждая запись(табличка) это возможное событие на которое может быть проиграно разное сообщение.
	делятся на 4 канала (channel):
	1. Бортовой компьютер.
		начинаются с префикса ANCR_*
		имеет наивысший приоритет
	2. Командир. 
		начинаются с префикса CMDR_*
		игнорируется если уже что-то играется на канале1 (Бортовой компьютер)
		если нужно проиграть что-то на канале1 (Бортовой компьютер), то (Командир) приглушается до громкости commander_mute_volume
	3. NPC. для FreeSpace (полиция, транспортники, пираты)
		начинаются с префикса NPC_*
		игнорируется если уже что-то играется на канале1 (Бортовой компьютер)
		если нужно проиграть что-то на канале1 (Бортовой компьютер), то (NPC) приглушается до громкости commander_mute_volume
	4. Напарники.
		начинаются с префикса TEAM_*
		игнорируются если уже что-то играется на канале1 (Бортовой компьютер) или на канале2 (Командир) или на канале3 (NPC)
		останавливаются если начинает что-то играться на канале1 (Бортовой компьютер) или на канале2 (Командир) или на канале3 (NPC)
	5. Сообщение в ангаре
		начинаются с префикса HANGAR_*
		тграется независимо от других каналов (теоретически не должен пересекаться с ними)
	
	общие параметры:
		timeout 		- таймаут для этого типа сообщений, т.е. если сообщение проигралось, то сообщеия этого же типа не будут проигрываться
		в течении указанного времени
		channel_timeout - если сообщение проигралось, то сообщения на этом же канале не будут проигрываться в течении указанного времени
		enqueue 		- если в момент события играется другое сообщение, то сообщение будет положено в очередь и проиграется когда будет возможность 
						  в текущей реализации длина очереди равна 1. и новые события всегда замещают предыдущие события в очереди
		ignore_channel_timeout - это событие игнорирует channel_timeout поставленный другим событием
		
		voice1, voice2, voice3, ... - звуки для разных голосов. 
			для (Бортовой компьютер) имеет смысл указывать только voice1.
			для (Командир) голос выбираейтся рандомно и фиксируется до конца боя.
			для (NPC) голос выбираейтся рандомно и фиксируется за кораблем до конца боя.
			для (Напарники) голос выбираейтся рандомно и фиксируется за кораблем до конца боя.
		
		int_radius	 	- переопределение параметра teammate_int_radius для конкретного события
		ext_radius	 	- переопределение параметра teammate_ext_radius для конкретного события
			
	для удобства тестирования можно выставить cvar ai_debugSentences
]]

--
SentenceDef = 
{
	-- настройки
	teammate_int_radius = 200, 		-- минимальный радиус на котором не будут игнорироваться сообщения команды, не обязательно должны быть видимы камерой 
	teammate_ext_radius = 350,		-- максимальны радиус на котором не будут игнорироваться сообщения команды, должны быть видимы камерой
	commander_mute_volume = 0.5,	-- громкость до которой приглушать командира, когда начинает играться бортовой компьютер
	team_random_timeout = 110.0,		-- проигрывать событие TEAM_COMBAT_RANDOM если давно никто ничего не говорил
	teammate_voice_abort_sound = "sound/vo/radio_end", -- звук который проигрывается если союзник который говорил неожиданно погиб
	teammate_voice_noise_sound = "sound/vo/noise", -- звук который проигрывается паралельно с тем как говорит союзник (4 канал) #17318
	
	-- специфические настройки для разных языков
	language_RUSSIAN = 
	{
		prefix = "ru_voice/vo/ru/",	-- префикс для звуков
		ancr_voice_num = 1,			-- максимальное число голосов категории (Бортовой компьютер) для этого языка
		cmdr_voice_num = 3,			-- максимальное число голосов категории (Командир) для этого языка
		team_voice_num = 8,			-- максимальное число голосов категории (Напарники) для этого языка
		npc_voice_num  = 3,         -- максимальное число голосов категории (NPC) для этого языка
	},
	
	language_ENGLISH = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
		npc_voice_num  = 1,
	},

	language_FRENCH = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,

	},

	language_GERMAN = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},

	language_SPANISH = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},
	
	language_CHINESE = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},
	
	language_PORTUGUESE = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},
	
	language_TURKISH = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},
	
	language_POLISH = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},
	
	language_HUNGARIAN = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},
	
	language_CZECH = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},
	
	language_UKRAINIAN = 
	{
		prefix = "en_voice/vo/ru/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},
	
	language_JAPANESE = 
	{
		prefix = "en_voice/vo/en/",
		ancr_voice_num = 1,
		cmdr_voice_num = 3,
		team_voice_num = 8,
	},
}


--Бортовой компьютер. Предупреждение о влете в зону поражения разлетевшихся бомб
SentenceDef.ANCR_BOMB_DETECTED = 
{
	enqueue = true,
	timeout = 10.0,	
	voice1 = "cv/danger",

}
	

--Бортовой компьютер. Наш виталпойнт захвачен 
SentenceDef.ANCR_ALLY_POINT_CAPTURED =
{
	enqueue = true,
	voice1 = "cv/our_point_captured",

	gameplays_exclude = { ai.Gameplay.CLANSHIP },
}


-- Бортовой компьютер. Мы потеряли все виталпойнты 
SentenceDef.ANCR_ALL_ALLY_POINT_CAPTURED =
{
	enqueue = true,
	voice1 = "cv/all_our_point_captured",
}


-- Бортовой компьютер. Вражеский виталпойнт захвачен 
SentenceDef.ANCR_ENEMY_POINT_CAPTURED =
{
	enqueue = true,
	voice1 = "cv/enemy_point_captured",

	gameplays_exclude = { ai.Gameplay.CLANSHIP },
}


-- Бортовой компьютер. Все вражеские виталпойнты захвачены
SentenceDef.ANCR_ALL_ENEMY_POINT_CAPTURED =
{
	voice1 = "cv/all_enemy_point_captured",
}


-- Бортовой компьютер. Когда маяк захватывается из ничьего в наш
SentenceDef.ANCR_ALLY_CAPTURE_NEUTRAL_POINT =
{
	voice1 = "cv/capture_neutral_point",			

	gameplays_exclude = { ai.Gameplay.CLANSHIP },
}


-- Бортовой компьютер. Вражеский корабль уничтожен игроком
SentenceDef.ANCR_PLAYER_DESTROY_ENEMY_SHIP =
{
	timeout = 10.0,	
	voice1 = "cv/enemy_ship_destroyed",
}


-- Бортовой компьютер. Критическое состояние корабля (на всякий случай, хотя вполне достаточно пищания)
--SentenceDef.ANCR_HULL_CRITICAL =
--{
--	timeout = 10.0,
--	voice1 = "sound/vo/cv/ship_critical",
--}


-- Бортовой компьютер. Щиты уничтожены 
SentenceDef.ANCR_SHIELD_DESTROYED =
{
	timeout = 30.0,	
	voice1 = "cv/shields_down",
}


-- Бортовой компьютер. incoming missile
SentenceDef.ANCR_INCOMING_MISSILE =
{
	timeout = 10.0,	
	voice1 = "cv/incoming_missile",
}


-- Бортовой компьютер. Потеряна связь с кораблем (на момент черного экрана гибели) 
SentenceDef.ANCR_LOST_CONNECTION_WITH_SHIP =
{
	enqueue = true,
	timeout = 30.0,
	voice1 = "cv/communication_lost",
}


-- Бортовой компьютер. Применение спец способности босса
SentenceDef.ANCR_PVE_BOSS_SPEC_ABILITY =
{
--	enqueue = true,
	timeout = 30.0,
	voice1 = "cv/danger",
}


-- Бортовой компьютер. Запрос разрешения на стыковку
SentenceDef.ANCR_REQUEST_DOCK = 
{
}

-- Бортовой компьютер. Проход сквозь гейт
SentenceDef.ANCR_REQUEST_JUMP = 
{
}


-- Бортовой компьютер. Низкий уровень топлива для прыжка
SentenceDef.ANCR_LOW_FUEL = 
{
}


-- Бортовой компьютер. Сканирование обломков и подобного
SentenceDef.ANCR_START_SCANNING = 
{
}


-- Бортовой компьютер. Когда после лута трюм стал полный
SentenceDef.ANCR_CARGO_HOLD_BECAME_FULL = 
{
}


-- Бортовой компьютер. Когда не хватило места для лута
SentenceDef.ANCR_CARGO_HOLD_IS_FULL = 
{
}


-- Бортовой компьютер. Пошло вторжение пришельцев
SentenceDef.ANCR_INVASION = 
{
	timeout = 30.0,
	voice1 = "cv/danger",
}

--------------------------------
--КОМАНДИР
--------------------------------

SentenceDef.CMDR_GAMEPLAY_START_ZOMBIE = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/zombie/zmb_gameplay_start",
	voice2 = "cmd/zombie/zmb_gameplay_start",
	voice3 = "cmd/zombie/zmb_gameplay_start",
}

SentenceDef.CMDR_ZOMBIE_NEW_TARGET = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/zombie/zmb_new_target",
	voice2 = "cmd/zombie/zmb_new_target",
	voice3 = "cmd/zombie/zmb_new_target",
}

SentenceDef.TEAM_ZOMBIE_TRANSFORMATION = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/zombie/zmb_new_target",
	voice2 = "cmd/zombie/zmb_new_target",
	voice3 = "cmd/zombie/zmb_new_target",
}

SentenceDef.CMDR_ZOMBIE_FIRST_ZOMBIE = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/zombie/zmb_first_zombie",
	voice2 = "cmd/zombie/zmb_first_zombie",
	voice3 = "cmd/zombie/zmb_first_zombie",
}

SentenceDef.CMDR_ZOMBIE_CAPTURE_POINTS = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/zombie/zmb_capture_points",
	voice2 = "cmd/zombie/zmb_capture_points",
	voice3 = "cmd/zombie/zmb_capture_points",
}

SentenceDef.CMDR_ZOMBIE_PROTECT_POINTS = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/zombie/zmb_protect_points",
	voice2 = "cmd/zombie/zmb_protect_points",
	voice3 = "cmd/zombie/zmb_protect_points",
}

SentenceDef.CMDR_ZOMBIE_VICTORY_VITALPOINTS_DEAD = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/zombie/zmb_win_vitalpoints_dead",
	voice2 = "cmd/zombie/zmb_win_vitalpoints_dead",
	voice3 = "cmd/zombie/zmb_win_vitalpoints_dead",
}

SentenceDef.CMDR_ZOMBIE_VICTORY_TIME_UP = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/zombie/zmb_win_time_up",
	voice2 = "cmd/zombie/zmb_win_time_up",
	voice3 = "cmd/zombie/zmb_win_time_up",
}

SentenceDef.CMDR_ZOMBIE_DEFEAT_HUNTERS_DEAD = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/v4/defeat_koth",
	voice2 = "cmd/v4/defeat_koth",
	voice3 = "cmd/v4/defeat_koth",
}

SentenceDef.CMDR_ZOMBIE_DEFEAT_HUNTERS_ALIVE = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/zombie/zmb_defeat_hunters_alive",
	voice2 = "cmd/zombie/zmb_defeat_hunters_alive",
	voice3 = "cmd/zombie/zmb_defeat_hunters_alive",
}

-------

SentenceDef.CMDR_ALLY_SHIELD_GENERATOR_DESTROYED = 
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/ally_shield_emit_destr",
	voice2 = "cmd/dread/ally_shield_emit_destr",
	voice3 = "cmd/dread/ally_shield_emit_destr",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}

SentenceDef.CMDR_ALLY_TICKET_TOWER_DESTROYED = 
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/ally_tower_destr",
	voice2 = "cmd/dread/ally_tower_destr",
	voice3 = "cmd/dread/ally_tower_destr",

	gameplays_include = { ai.Gameplay.CLANSHIP },
}

SentenceDef.CMDR_ALLY_TURRET_POWER_DESTROYED = 
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/main_calibre_destr",
	voice2 = "cmd/dread/main_calibre_destr",
	voice3 = "cmd/dread/main_calibre_destr",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}

SentenceDef.CMDR_ENEMY_SHIELD_GENERATOR_DESTROYED =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/enemy_key_obj_disabled",
	voice2 = "cmd/dread/enemy_key_obj_disabled",
	voice3 = "cmd/dread/enemy_key_obj_disabled",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}
SentenceDef.CMDR_ALLY_SHIELD_GENERATOR_DESTROYED =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/ally_shield_emit_destr",
	voice2 = "cmd/dread/ally_shield_emit_destr",
	voice3 = "cmd/dread/ally_shield_emit_destr",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}
SentenceDef.CMDR_ENEMY_TURRET_POWER_DESTROYED =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/enemy_key_obj_disabled",
	voice2 = "cmd/dread/enemy_key_obj_disabled",
	voice3 = "cmd/dread/enemy_key_obj_disabled",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}
SentenceDef.CMDR_ALLY_TURRET_POWER_DESTROYED =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/main_calibre_destr",
	voice2 = "cmd/dread/main_calibre_destr",
	voice3 = "cmd/dread/main_calibre_destr",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}
SentenceDef.CMDR_ENEMY_TICKET_TOWER_DESTROYED =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/enemy_key_obj_disabled",
	voice2 = "cmd/dread/enemy_key_obj_disabled",
	voice3 = "cmd/dread/enemy_key_obj_disabled",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}
SentenceDef.CMDR_ALLY_TICKET_TOWER_DESTROYED =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/ally_tower_destr",
	voice2 = "cmd/dread/ally_tower_destr",
	voice3 = "cmd/dread/ally_tower_destr",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}

SentenceDef.CMDR_ALLY_MANY_CLANSHIP_TICKETS = 
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/ally_many_tickets",
	voice2 = "cmd/dread/ally_many_tickets",
	voice3 = "cmd/dread/ally_many_tickets",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}

SentenceDef.CMDR_ENEMY_MANY_CLANSHIP_TICKETS = 
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/enemy_many_tickets",
	voice2 = "cmd/dread/enemy_many_tickets",
	voice3 = "cmd/dread/enemy_many_tickets",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}

SentenceDef.CMDR_ALLY_FEW_CLANSHIP_TICKETS = 
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/ally_few_tickets",
	voice2 = "cmd/dread/ally_few_tickets",
	voice3 = "cmd/dread/ally_few_tickets",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}

SentenceDef.CMDR_ENEMY_FEW_CLANSHIP_TICKETS = 
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/enemy_few_tickets",
	voice2 = "cmd/dread/enemy_few_tickets",
	voice3 = "cmd/dread/enemy_few_tickets",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}

SentenceDef.CMDR_GAMEPLAY_START_CLANSHIP = 
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/gameplay_start",
	voice2 = "cmd/dread/gameplay_start",
	voice3 = "cmd/dread/gameplay_start",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}


SentenceDef.CMDR_VICTORY_CLANSHIP_DESTROYED =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/win_ship_destr",
	voice2 = "cmd/dread/win_ship_destr",
	voice3 = "cmd/dread/win_ship_destr",
	
	gameplays_include = { ai.Gameplay.CLANSHIP },
}

SentenceDef.CMDR_DEFEAT_CLANSHIP_DESTROYED =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/defeat_ship_destr",
	voice2 = "cmd/dread/defeat_ship_destr",
	voice3 = "cmd/dread/defeat_ship_destr",

	gameplays_include = { ai.Gameplay.CLANSHIP },
}


SentenceDef.CMDR_VICTORY_CLANSHIP_SCORE_REACHED =
{
	enqueue = true,
	ignore_channel_timeout = true,
	
	voice1 = "cmd/dread/win_score_reached",
	voice2 = "cmd/dread/win_score_reached",
	voice3 = "cmd/dread/win_score_reached",
}


SentenceDef.CMDR_DEFEAT_CLANSHIP_SCORE_REACHED =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/dread/defeat_score_reached",
	voice2 = "cmd/dread/defeat_score_reached",
	voice3 = "cmd/dread/defeat_score_reached",
}


SentenceDef.CMDR_PVE_RAID_START_ROUND =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/v4/raid_gameplay_start",
	voice2 = "cmd/v4/raid_gameplay_start",
	voice3 = "cmd/v4/raid_gameplay_start",

}

SentenceDef.CMDR_PVE_RAID_PHASE2 =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/v4/raid_phase2",
	voice2 = "cmd/v4/raid_phase2",
	voice3 = "cmd/v4/raid_phase2",

}

SentenceDef.CMDR_PVE_RAID_PHASE3 =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/v4/raid_phase3",
	voice2 = "cmd/v4/raid_phase3",
	voice3 = "cmd/v4/raid_phase3",

}

SentenceDef.CMDR_PVE_RAID2_FINAL =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/v4/raid2_final",
	voice2 = "cmd/v4/raid2_final",
	voice3 = "cmd/v4/raid2_final",

}

SentenceDef.CMDR_PVE_WAVE_BOSS =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/v4/pve_survive_boss",
	voice2 = "cmd/v4/pve_survive_boss",
	voice3 = "cmd/v4/pve_survive_boss",

}

SentenceDef.CMDR_PVE_START_ROUND_JERICHO_CAPTURE =
{
	enqueue = true,
	ignore_channel_timeout = true,

	voice1 = "cmd/v4/pve_jericho_capture_round_start",
	voice2 = "cmd/v4/pve_jericho_capture_round_start",
	voice3 = "cmd/v4/pve_jericho_capture_round_start",
}


SentenceDef.CMDR_PVE_START_ROUND_JERICHO_TRANSPORT =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_jericho_transport_round_start",
	voice2 = "cmd/v4/pve_jericho_transport_round_start",
	voice3 = "cmd/v4/pve_jericho_transport_round_start",
}



SentenceDef.CMDR_BLACKWOOD_DEFENCE = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_blackwood_defence_start",
	voice2 = "cmd/v6/pve_blackwood_defence_start",
	voice3 = "cmd/v4/pve_blackwood_defence_start",
}


SentenceDef.CMDR_GAMEPLAY_START_TUTORIAL_BASICS =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/tutorial/start1",
    voice2 = "cmd/tutorial/start1",
    voice3 = "cmd/tutorial/start1",
}

SentenceDef.CMDR_GAMEPLAY_START_TUTORIAL_BATTLE_SYSTEM =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/tutorial/start2",
    voice2 = "cmd/tutorial/start2",
    voice3 = "cmd/tutorial/start2",
}

SentenceDef.CMDR_TUTORIAL_VICTORY =

{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/tutorial/victory",
    voice2 = "cmd/tutorial/victory",
    voice3 = "cmd/tutorial/victory",
}

SentenceDef.CMDR_TUTORIAL_DEFEAT =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/tutorial/defeat",
    voice2 = "cmd/tutorial/defeat",
    voice3 = "cmd/tutorial/defeat",
}

-- Командир. Подбадривания в момент начала раунда (Capture the Base)
SentenceDef.CMDR_GAMEPLAY_START_CAPTURE_THE_BASE =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/gameplay_start",
    voice2 = "cmd/v2/gameplay_start",
    voice3 = "cmd/v3/gameplay_start",
}


-- Командир. Подбадривания в момент начала раунда (Control)
SentenceDef.CMDR_GAMEPLAY_START_CONTROL =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/gameplay_start",
    voice2 = "cmd/v2/gameplay_start",
    voice3 = "cmd/v3/gameplay_start",
}


-- Командир. Подбадривания в момент начала раунда (Sentinel)
SentenceDef.CMDR_GAMEPLAY_START_SENTINEL =
{
   enqueue = true,
   ignore_channel_timeout = true,
   voice1 = "cmd/v1/gameplay_start_sentinel",
   voice2 = "cmd/v2/gameplay_start_sentinel",
   voice3 = "cmd/v3/gameplay_start_sentinel",
}


-- Командир. Подбадривания в момент начала раунда (Bomb the Base)
SentenceDef.CMDR_GAMEPLAY_START_BOMB_THE_BASE =
{
	voice1 = "cmd/v4/bomb_gameplay_start",
	voice2 = "cmd/v4/bomb_gameplay_start",
	voice3 = "cmd/v5/bomb_gameplay_start",
}


-- Командир. Подбадривания в момент начала раунда (Close distance, атакующие)
SentenceDef.CMDR_CD_BOMBER_START =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/bomb_gameplay_start",
	voice2 = "cmd/v4/bomb_gameplay_start",
	voice3 = "cmd/v4/bomb_gameplay_start",
}

-- Командир. Подбадривания в момент начала раунда (Close distance, защищающиеся)
SentenceDef.CMDR_CD_DEFENDERS_START =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/start_round_sector_defence",
	voice2 = "cmd/v4/start_round_sector_defence",
	voice3 = "cmd/v6/start_round_sector_defence",
}


-- Командир. Подбадривания в момент начала раунда (King of the hill)
SentenceDef.CMDR_GAMEPLAY_START_KING_OF_THE_HILL =
{
	voice1 = "cmd/v4/koth_start",
	voice2 = "cmd/v4/koth_start",
	voice3 = "cmd/v4/koth_start",
}

-- Командир. Подбадривания в момент начала раунда (Team Death Match)
SentenceDef.CMDR_GAMEPLAY_START_TDM =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/tdm_gameplay_start",
	voice2 = "cmd/tdm_gameplay_start",
	voice3 = "cmd/tdm_gameplay_start",
}



-- Командир. Победа по фрагам
SentenceDef.CMDR_VICTORY_NO_SHIPS_LEFT =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/win_frag",
    voice2 = "cmd/v2/win_frag",
    voice3 = "cmd/v3/win_frag",

}


-- Командир. Победа по захваченым виталпойнтам
SentenceDef.CMDR_VICTORY_POINTS_CAPTURED =
{
	enqueue = true,
	ignore_channel_timeout = true,
    voice1 = "cmd/v1/win_point_captured", 
    voice2 = "cmd/v2/win_point_captured", 
    voice3 = "cmd/v3/win_point_captured", 
}


-- Командир. Победа по истечению таймера
SentenceDef.CMDR_VICTORY_TIME_UP =
{
	 enqueue = true,
	 ignore_channel_timeout = true,
     voice1 = "cmd/v1/win_time_up", 
     voice2 = "cmd/v2/win_time_up", 
     voice3 = "cmd/v3/win_time_up", 
}


-- Командир. Победа, набрано необходимое число очков в режиме Control
SentenceDef.CMDR_VICTORY_CONTROL_SCORE_REACHED =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/win_score_reached", 
    voice2 = "cmd/v2/win_score_reached", 
    voice3 = "cmd/v3/win_score_reached", 
}


-- Командир. Победа, база уничтожена в режиме Bomb the Base
SentenceDef.CMDR_VICTORY_BASE_BOMBED =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/victory_base_bombed", 
    voice2 = "cmd/v4/victory_base_bombed", 
    voice3 = "cmd/v4/victory_base_bombed", 
}


-- Командир. Победа, набрано необходимое число очков в режиме KingOfTheHill
SentenceDef.CMDR_VICTORY_KING_SCORE_REACHED = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/victory_koth", 
    voice2 = "cmd/v4/victory_koth", 
    voice3 = "cmd/v4/victory_koth", 
}

-- Командир. Победа, набрано необходимое число очков в режиме TeamDeathMatch
SentenceDef.CMDR_VICTORY_TDM_SCORE_REACHED = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/win_tdm", 
    voice2 = "cmd/win_tdm", 
    voice3 = "cmd/win_tdm", 
}


-- Командир. Поражение по фрагам
SentenceDef.CMDR_DEFEAT_NO_SHIPS_LEFT =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/defeat_frag",
    voice2 = "cmd/v2/defeat_frag",
    voice3 = "cmd/v3/defeat_frag",
}


-- Командир. Поражение по захваченым виталпойнтам
SentenceDef.CMDR_DEFEAT_POINTS_CAPTURED =
{
	enqueue = true,
	ignore_channel_timeout = true,
    voice1 = "cmd/v1/defeat_point_captured",
    voice2 = "cmd/v2/defeat_point_captured",
    voice3 = "cmd/v3/defeat_point_captured",
}


-- Командир. Поражение по истечению таймера
SentenceDef.CMDR_DEFEAT_TIME_UP =
{
	enqueue = true,
	ignore_channel_timeout = true,
    voice1 = "cmd/v1/defeat_time_up",
    voice2 = "cmd/v2/defeat_time_up",
    voice3 = "cmd/v3/defeat_time_up",
}


-- Командир. Поражение, набрано необходимое число очков в режиме Control
SentenceDef.CMDR_DEFEAT_CONTROL_SCORE_REACHED =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/defeat_score_reached",
    voice2 = "cmd/v2/defeat_score_reached",
    voice3 = "cmd/v3/defeat_score_reached",
}


-- Командир. Поражение, база уничтожена в режиме Bomb the Base
SentenceDef.CMDR_DEFEAT_BASE_BOMBED =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/defeat_base_bombed",
    voice2 = "cmd/v4/defeat_base_bombed",
    voice3 = "cmd/v4/defeat_base_bombed",
}


-- Командир. Поражение, набрано необходимое число очков в режиме KingOfTheHill
SentenceDef.CMDR_DEFEAT_KING_SCORE_REACHED =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/defeat_koth", 
    voice2 = "cmd/v4/defeat_koth", 
    voice3 = "cmd/v4/defeat_koth", 
}

-- Командир. Поражение, набрано необходимое число очков в режиме TeamDeathMatch
SentenceDef.CMDR_DEFEAT_TDM_SCORE_REACHED =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/defeat_tdm_noship",
	voice2 = "cmd/defeat_tdm_noship",
	voice3 = "cmd/defeat_tdm_noship",
}


-- Командир. Ничья
SentenceDef.CMDR_DRAW =
{
    enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/draw",
	voice2 = "cmd/v2/draw",
	voice3 = "cmd/v3/draw",
}


-- Командир. победа в ПВЕ матче. Проигрывается вне зависимости от причин победы.
SentenceDef.CMDR_PVE_VICTORY = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/pve_win",
    voice2 = "cmd/v2/pve_win",
    voice3 = "cmd/v3/pve_win",

}


-- Командир. Поражение в ПВЕ по убитым кораблям
SentenceDef.CMDR_PVE_DEFEAT_NO_SHIPS_LEFT =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/defeat_pve_noship",
    voice2 = "cmd/v2/defeat_pve_noship",
    voice3 = "cmd/v3/defeat_pve_noship",

}


-- Командир. Поражение в ПВЕ матче по захваченым виталпойнтам
SentenceDef.CMDR_PVE_DEFEAT_POINTS_CAPTURED =
{
	enqueue = true,
	ignore_channel_timeout = true,
    voice1 = "cmd/v1/defeat_pve_point_captured",
    voice2 = "cmd/v2/defeat_pve_point_captured",
    voice3 = "cmd/v3/defeat_pve_point_captured",
}


-- Командир. Поражение в ПВЕ необходимое число транспортников долетело
SentenceDef.CMDR_PVE_DEFEAT_TRANSPORT_ARRIVED =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_defeat_transport_arrived",
    voice2 = "cmd/v4/pve_defeat_transport_arrived",
    voice3 = "cmd/v4/pve_defeat_transport_arrived",
}


-- Командир. Поражение в ПВЕ много союзных транспортников уничтожено
SentenceDef.CMDR_PVE_DEFEAT_TRANSPORT_DEAD =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_defeat_transport_arrived",
    voice2 = "cmd/v4/pve_defeat_transport_arrived",
    voice3 = "cmd/v4/pve_defeat_transport_arrived",
}


-- Командир. Наш виталпойнт остался без защитных дронов
SentenceDef.CMDR_ALLY_POINT_NO_DRONES_LEFT_0 =
{
	ignore_channel_timeout = true,
    voice1 = "cmd/v1/ally_point_no_drones_left_a",
    voice2 = "cmd/v2/ally_point_no_drones_left_a",
    voice3 = "cmd/v3/ally_point_no_drones_left_a",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}


-- Командир. Наш виталпойнт остался без защитных дронов
SentenceDef.CMDR_ALLY_POINT_NO_DRONES_LEFT_1 =
{
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/ally_point_no_drones_left_b",
    voice2 = "cmd/v2/ally_point_no_drones_left_b",
    voice3 = "cmd/v3/ally_point_no_drones_left_b",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}


-- Командир. Наш виталпойнт остался без защитных дронов
SentenceDef.CMDR_ALLY_POINT_NO_DRONES_LEFT_2 =
{
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/ally_point_no_drones_left_c",
    voice2 = "cmd/v2/ally_point_no_drones_left_c",
    voice3 = "cmd/v3/ally_point_no_drones_left_c",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}


-- Командир. Наш виталпойнт остался без защитных дронов
SentenceDef.CMDR_ALLY_POINT_NO_DRONES_LEFT_3 =
{
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/ally_point_no_drones_left_d",
    voice2 = "cmd/v2/ally_point_no_drones_left_d",
    voice3 = "cmd/v3/ally_point_no_drones_left_d",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}


-- Командир. Убийство первого противника
SentenceDef.CMDR_FIRST_ENEMY_KILL =
{
	enqueue = true,
    voice1 = "cmd/v1/first_killed",
    voice2 = "cmd/v2/first_killed",
    voice3 = "cmd/v3/first_killed",

}


-- Командир. Взят первый виталпойнт
SentenceDef.CMDR_FIRST_ENEMY_POINT_CAPTURED =
{
	enqueue = true,
	ignore_channel_timeout = true,
    voice1 = "cmd/v1/first_enemy_point_captured",
    voice2 = "cmd/v2/first_enemy_point_captured",
    voice3 = "cmd/v3/first_enemy_point_captured",

}

 
-- Командир. Осталось захватить последний виталпойнт
SentenceDef.CMDR_LAST_ENEMY_POINT_LEFT =
{
	enqueue = true,
	ignore_channel_timeout = true,
    voice1 = "cmd/v1/last_enemy_point",
    voice2 = "cmd/v2/last_enemy_point",
    voice3 = "cmd/v3/last_enemy_point",

}


-- Командир. У нас остался один виталпойнт
SentenceDef.CMDR_LAST_ALLY_POINT_LEFT_0 =
{
	enqueue = true,
    voice1 = "cmd/v1/last_ally_point_left_a",
    voice2 = "cmd/v2/last_ally_point_left_a",
    voice3 = "cmd/v3/last_ally_point_left_a",

}


-- Командир. У нас остался один виталпойнт
SentenceDef.CMDR_LAST_ALLY_POINT_LEFT_1 =
{
	enqueue = true,
    voice1 = "cmd/v1/last_ally_point_left_b",
    voice2 = "cmd/v2/last_ally_point_left_b",
    voice3 = "cmd/v3/last_ally_point_left_b",

}


-- Командир. У нас остался один виталпойнт
SentenceDef.CMDR_LAST_ALLY_POINT_LEFT_2 =
{
	enqueue = true,
    voice1 = "cmd/v1/last_ally_point_left_c",
    voice2 = "cmd/v2/last_ally_point_left_c",
    voice3 = "cmd/v3/last_ally_point_left_c",

}


-- Командир. У нас остался один виталпойнт
--SentenceDef.CMDR_LAST_ALLY_POINT_LEFT_3 =
--{
--    voice1 = "",
--    voice2 = "",
--	enqueue = true,
--}


-- Командир. У команды противника осталось меньше 10% кораблей
SentenceDef.CMDR_ENEMY_REMAIN_FEW_SHIPS =
{
    timeout = 200.0,
	enqueue = true,
    ignore_channel_timeout = true,
    voice1 = "cmd/v1/enemy_few_ships_left",
    voice2 = "cmd/v2/enemy_few_ships_left",
    voice3 = "cmd/v3/enemy_few_ships_left",
	
}


-- Командир. У нашей комнады осталось меньше 10% кораблей
SentenceDef.CMDR_ALLY_REMAIN_FEW_SHIPS =
{
	enqueue = true,
    ignore_channel_timeout = true,
    voice1 = "cmd/v1/ally_few_ships_left",
    voice2 = "cmd/v2/ally_few_ships_left",
    voice3 = "cmd/v3/ally_few_ships_left",

}


-- Командир. Команде противника осталось набрать меньше 10% очков контроля
SentenceDef.CMDR_ENEMY_REMAIN_FEW_CONTROL_SCORE =
{
	enqueue = true,
    ignore_channel_timeout = true,
    voice1 = "cmd/v1/enemy_remain_few_score",
    voice2 = "cmd/v2/enemy_remain_few_score",
    voice3 = "cmd/v3/enemy_remain_few_score",
}


-- Командир. Нашей комнады осталось набрать меньше 10% очков контроля
SentenceDef.CMDR_ALLY_REMAIN_FEW_CONTROL_SCORE =
{
	enqueue = true,
    ignore_channel_timeout = true,
    voice1 = "cmd/v1/ally_remain_few_score",
    voice2 = "cmd/v2/ally_remain_few_score",
    voice3 = "cmd/v3/ally_remain_few_score",
}


-- Командир. До конца раунда осталось три (две) минуты 
SentenceDef.CMDR_REMAIN_LITTLE_TIME =
{
    enqueue = true,
    ignore_channel_timeout = true,
    voice1 = "cmd/v1/no_time_left",
    voice2 = "cmd/v2/no_time_left",
    voice3 = "cmd/v3/no_time_left",
}


-- Командир. Сообщение на спаун новой волны
SentenceDef.CMDR_PVE_WAVE_INCOMING = 
{
    voice1 = "cmd/v4/pve_wave_incoming",
    voice2 = "cmd/v4/pve_wave_incoming",
    voice3 = "cmd/v5/pve_wave_incoming",
}


-- Командир. Сообщение на спаун боcса
--[[SentenceDef.CMDR_PVE_BOSS_WAVE_INCOMING = 
{
   enqueue = true,
   ignore_channel_timeout = true,
   voice1 = "cmd/v4/pve_boss",
   voice2 = "cmd/v4/pve_boss",
   voice3 = "cmd/v5/pve_boss",
}
]]


-- Командир. Старт Pve раунда типа SECTOR_CAPTURE
SentenceDef.CMDR_PVE_START_ROUND_SECTOR_CAPTURE = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_round_start_sector_capture",
	voice2 = "cmd/v4/pve_round_start_sector_capture",
	voice3 = "cmd/v5/pve_round_start_sector_capture",
}

-- Командир. Старт Pve раунда типа SABOTAGE
SentenceDef.CMDR_PVE_START_ROUND_SABOTAGE = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_start_round_sabotage",
	voice2 = "cmd/v4/pve_start_round_sabotage",
	voice3 = "cmd/v5/pve_start_round_sabotage",
}


-- Командир. Старт Pve раунда типа TRANSPORT_ATTACK
SentenceDef.CMDR_PVE_START_ROUND_TRANSPORT_ATTACK = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_transport_attack",
	voice2 = "cmd/v4/pve_transport_attack",
	voice3 = "cmd/v4/pve_transport_attack",
}


-- Командир. Старт Pve раунда типа TRANSPORT_DEFENCE
SentenceDef.CMDR_PVE_START_ROUND_TRANSPORT_DEFENCE = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_transport_defence",
	voice2 = "cmd/v4/pve_transport_defence",
	voice3 = "cmd/v5/pve_transport_defence",
}


-- Командир. Старт Pve раунда типа ROUND_SURVIVE
SentenceDef.CMDR_PVE_START_ROUND_SURVIVE = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/pve/pve_survive",
	voice2 = "cmd/pve/pve_survive",
	voice3 = "cmd/pve/pve_survive",
}

-- Командир. Старт Pve раунда типа ROUND_SURVIVE NO FLAGSHIP
SentenceDef.CMDR_PVE_START_ROUND_SURVIVE_NO_FLAGSHIP = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_survive_no_flagship",
	voice2 = "cmd/v4/pve_survive_no_flagship",
	voice3 = "cmd/v4/pve_survive_no_flagship",
}


-- Командир. Старт специфического Pve раунда
SentenceDef.CMDR_PVE_START_ROUND_BREACH = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	channel_timeout = 90,
	voice1 = "cmd/v4/start_round_breach",
	voice2 = "cmd/v4/start_round_breach",
	voice3 = "cmd/v6/start_round_breach",
}


-- Командир. Старт специфического Pve раунда
SentenceDef.CMDR_PVE_START_ROUND_SECTOR_DEFENCE =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/start_round_sector_defence",
	voice2 = "cmd/v4/start_round_sector_defence",
	voice3 = "cmd/v6/start_round_sector_defence",
}


-- Командир. На спаун вражеского транспортного корабля, проигрывается каждый раз на спаун транспортника(для типа раунда TRANSPORT_ATTACK). 
SentenceDef.CMDR_PVE_ENEMY_TRANSPORT_SPAWN = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	timeout = 30.0,
	voice1 = "cmd/v4/pve_transport_arrived",
	voice2 = "cmd/v4/pve_transport_arrived",
	voice3 = "cmd/v5/pve_transport_arrived",

}

-- Командир. Старт волнового Pve раунда типа ROUND_SURVIVE
SentenceDef.CMDR_WAVE_PVE_START_ROUND = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/pve_survive_round_start",
	voice2 = "cmd/v4/pve_survive_round_start",
	voice3 = "cmd/v4/pve_survive_round_start",
}

SentenceDef.CMDR_WAVE_PW_PVE_START_ROUND = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/pve/pve_naberia_start",
	voice2 = "cmd/pve/pve_naberia_start",
	voice3 = "cmd/pve/pve_naberia_start",
}

SentenceDef.CMDR_WAVE_PW_PVE_BOSS = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/pve/pve_naberia_boss",
	voice2 = "cmd/pve/pve_naberia_boss",
	voice3 = "cmd/pve/pve_naberia_boss",
}

-- Командир. Старт генерируемого PvE
SentenceDef.CMDR_GEN_PVE_START_ROUND = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/pve/pve_monolith_start",
	voice2 = "cmd/pve/pve_monolith_start",
	voice3 = "cmd/pve/pve_monolith_start",
}

-- Командир. Старт генерируемого PvE с защитой дредноута
SentenceDef.CMDR_GEN_PVE_DREAD_DEFENSE_START_ROUND = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/pve/rock_frontier_start",
	voice2 = "cmd/pve/rock_frontier_start",
	voice3 = "cmd/pve/rock_frontier_start",
}

-- Командир. Старт генерируемого рейда с защитой дредноута
SentenceDef.CMDR_GEN_PVE_RAID_DEFENSE_START_ROUND = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/raid/s8256_planetoid_start",
	voice2 = "cmd/raid/s8256_planetoid_start",
	voice3 = "cmd/raid/s8256_planetoid_start",
}

--взорвали нашу станцию
SentenceDef.CMDR_ALLY_BOMB_SITE_DETONATED = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/ally_bomb_site_detonated",
	voice2 = "cmd/v4/ally_bomb_site_detonated",
	voice3 = "cmd/v4/ally_bomb_site_detonated",
}


--взорвали вражескую станцию
SentenceDef.CMDR_ENEMY_BOMB_SITE_DETONATED = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/enemy_bomb_site_detonated",
	voice2 = "cmd/v4/enemy_bomb_site_detonated",
	voice3 = "cmd/v4/enemy_bomb_site_detonated",
}


-- геймплей минирование. осталась наша последняя станция
SentenceDef.CMDR_ALLY_BOMB_SITE_LAST_REMAINING = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/ally_bomb_site_last_remain",
	voice2 = "cmd/v4/ally_bomb_site_last_remain",
	voice3 = "cmd/v4/ally_bomb_site_last_remain",
}


--геймплей минирование. осталась вражеская последняя станция
SentenceDef.CMDR_ENEMY_BOMB_SITE_LAST_REMAINING = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/enemy_bomb_site_last_remain",
	voice2 = "cmd/v4/enemy_bomb_site_last_remain",
	voice3 = "cmd/v4/enemy_bomb_site_last_remain",
}

-- геймплей царь горы. Следующий маяк стал активным
SentenceDef.CMDR_KING_HILL_CHANGED = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/koth_hill_changed",
	voice2 = "cmd/v4/koth_hill_changed",
	voice3 = "cmd/v4/koth_hill_changed",
}

-- Командир. уничтожен командир команды противника 
SentenceDef.CMDR_SENTINEL_ENEMY_LEADER_DEAD =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/enemy_leader_dead",
	voice2 = "cmd/v4/enemy_leader_dead",
	voice3 = "cmd/v5/enemy_leader_dead",

}


-- Командир. уничтожен командир нашей команды  
SentenceDef.CMDR_SENTINEL_ALLY_LEADER_DEAD =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v4/ally_leader_dead",
	voice2 = "cmd/v4/ally_leader_dead",
	voice3 = "cmd/v5/ally_leader_dead",

}

-- Командир, TDM. < 10 очков у команды противника
SentenceDef.CMDR_TDM_ENEMY_REMAIN_FEW_SHIPS = 
{	
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/enemy_few_ships_left",
	voice2 = "cmd/v2/enemy_few_ships_left",
	voice3 = "cmd/v3/enemy_few_ships_left",

}

-- Командир, TDM. < 10 очков у нашей команды
SentenceDef.CMDR_TDM_ALLY_REMAIN_FEW_SHIPS =
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "cmd/v1/ally_few_ships_left",
	voice2 = "cmd/v2/ally_few_ships_left",
	voice3 = "cmd/v3/ally_few_ships_left",
}

-------------------------------
--NPC ПРИШЕЛЬЦЫ
-------------------------------

SentenceDef.NPC_PLAYER_ATTACK_KIBER = 
{
    timeout = 40.0,
--	no_noise = true, 
	voice1 = "alien/reaver_under_attack",
	voice2 = "alien/reaver_under_attack",
	voice3 = "alien/reaver_under_attack",
}

SentenceDef.NPC_KIBER_ATTACK_PLAYER = 
{
    timeout = 40.0,
	no_noise = true, 
	voice1 = "alien/reaver_attack_player",
	voice2 = "alien/reaver_attack_player",
	voice3 = "alien/reaver_attack_player",
}

-- NPC. пришельцы-предтечи. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_PRECURSOR = 
{
    timeout = 40.0,
	no_noise = true, 
	voice1 = "alien/prec_under_attack",
	voice2 = "alien/prec_under_attack",
	voice3 = "alien/prec_under_attack",
}

-- NPC. пришельцы-риверы. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_REAVER = 
{

	timeout = 40.0,
	no_noise = true, 
	voice1 = "alien/reaver_under_attack",
	voice2 = "alien/reaver_under_attack",
	voice3 = "alien/reaver_under_attack",
	
}


-- NPC. пришельцы-предтечи атакуют игрока
SentenceDef.NPC_PRECURSOR_ATTACK_PLAYER = 
{	
    timeout = 30.0,
	no_noise = true, 
	voice1 = "alien/prec_attack_player",
    voice2 = "alien/prec_attack_player",
    voice3 = "alien/prec_attack_player",

}

-- NPC. пришельцы-риверы атакуют игрока
SentenceDef.NPC_REAVER_ATTACK_PLAYER = 
{
	timeout = 30.0,
	no_noise = true, 
	voice1 = "alien/reaver_attack_player",
    voice2 = "alien/reaver_attack_player",
    voice3 = "alien/reaver_attack_player",

}

-- NPC. агенты атакуют игрока
SentenceDef.NPC_AGENT_ATTACK_PLAYER =  
{
	timeout = 50.0,
	no_noise = true, 
	voice1 = "agent/agent_attack_player",
    voice2 = "agent/agent_attack_player",
    voice3 = "agent/agent_attack_player",

}

-------------------------------
--NPC ВСЕ ОСТАЛЬНЫЕ
-------------------------------

-- NPC. транспорт. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_NEUTRAL_NPC =
{
    timeout = 80.0,
	voice1 = "transport/v1/transport_under_attack",
    voice2 = "transport/v2/transport_under_attack",
	voice3 = "transport/v3/transport_under_attack",
}

-- NPC. шахтеры. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_MINER =
{
}

-- NPC. охотники за наградой. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_BOUNTY_HUNTER =
{
}

-- NPC. инженеры-рабочие. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_WORKER =
{
}

-- NPC. искатели сокровищ. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_TREASURE_HUNTER =
{
}

-- NPC. торговцы-дальнобойщики. когда игрок их атакует (продублированы с транспортов)
SentenceDef.NPC_PLAYER_ATTACK_TRADER =
{
    timeout = 80.0,
	voice1 = "transport/v1/transport_under_attack",
    voice2 = "transport/v2/transport_under_attack",
	voice3 = "transport/v3/transport_under_attack",
}

-- NPC. контрабандисты. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_SMUGGLER =
{
}

-- NPC. исследователи. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_RESEARCHER =
{
}

-- NPC. сборщики мусора. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_CLEANER =
{
}

-- NPC. полиция. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_POLICE =
{
    timeout = 60.0,
	voice1 = "police/v1/police_under_attack",
    voice2 = "police/v2/police_under_attack",
	voice3 = "police/v3/police_under_attack",
}

-- NPC. транспорт. когда игрок убивает их напарника рядом
SentenceDef.NPC_PLAYER_KILL_NEUTRAL_NPC =
{
--    timeout = 100.0,
--	voice1 = "transport/v1/transport_under_attack",
--  voice2 = "transport/v2/transport_under_attack",
}

-- NPC. полиция. когда игрок убивает их напарника рядом
SentenceDef.NPC_PLAYER_KILL_POLICE  =
{
--    timeout = 100.0,
	--voice1 = "cmd/v1/enemy_few_ships_left",
    --voice2 = "cmd/v2/enemy_few_ships_left",
}

-- NPC. полиция атакует игрока
SentenceDef.NPC_POLICE_ATTACK_PLAYER =
{
    timeout = 60.0,
	int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "police/v1/police_attack_player",
    voice2 = "police/v2/police_attack_player",	
	voice3 = "police/v3/police_attack_player",
}

-- NPC. пришельцы атакуют транспортников
SentenceDef.NPC_ALIEN_ATTACK_NEUTRAL_NPC = 
{
	timeout = 60.0,
	int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "transport/v1/transport_under_alien_attack",
	voice2 = "transport/v2/transport_under_alien_attack",
	voice3 = "transport/v3/transport_under_alien_attack",
	
}

-- NPC. пришельцы атакуют торговцев
SentenceDef.NPC_ALIEN_ATTACK_TRADER = 
{
	timeout = 60.0,
	int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "transport/v1/transport_under_alien_attack",
	voice2 = "transport/v2/transport_under_alien_attack",
	voice3 = "transport/v3/transport_under_alien_attack",
	
}

-- NPC. пришельцы атакуют полицию
SentenceDef.NPC_ALIEN_ATTACK_POLICE = 
{
	timeout = 60.0,
	int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "police/v1/police_under_alien_attack",
	voice2 = "police/v2/police_under_alien_attack",
	voice3 = "police/v3/police_under_alien_attack",
	
}


-------------------------------
--ПИРАТЫ
-------------------------------

-- NPC. пираты. когда игрок их атакует
SentenceDef.NPC_PLAYER_ATTACK_PIRATE =
{
	timeout = 50.0,
	int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "pirate/v1/pirate_under_attack",
    voice2 = "pirate/v2/pirate_under_attack",
	voice3 = "pirate/v3/pirate_under_attack",
	
}
-- NPC. пираты атакуют игрока
SentenceDef.NPC_PIRATE_ATTACK_PLAYER =
{
    timeout = 50.0,
	int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "pirate/v1/pirate_attack_player",
    voice2 = "pirate/v2/pirate_attack_player",
	voice3 = "pirate/v3/pirate_attack_player",
}


-------------------------------
--НАПАРНИКИ
-------------------------------
SentenceDef.TEAM_ZOMBIE_TRANSFORMATION  =
{
	int_radius = 1000.0,
	ext_radius = 1500.0,
    voice1 = "team/zombie/zmb_transformation",
    voice2 = "team/zombie/zmb_transformation",
    voice3 = "team/zombie/zmb_transformation",
    voice4 = "team/zombie/zmb_transformation",
    voice5 = "team/zombie/zmb_transformation",
    voice6 = "team/zombie/zmb_transformation",
    voice7 = "team/zombie/zmb_transformation",
    voice8 = "team/zombie/zmb_transformation",
}


-- Напарники. Первый контакт (мало кораблей)
SentenceDef.TEAM_FIRST_CONTACT_FEW_SHIPS = 

{
	int_radius = 1000.0,
	ext_radius = 1500.0,
    voice1 = "team/v1/first_contact_few_ships",
    voice2 = "team/v2/first_contact_few_ships",
    voice3 = "team/v3/first_contact_few_ships",
    voice4 = "team/v4/first_contact_few_ships",
    voice5 = "team/v5/first_contact_few_ships",
    voice6 = "team/v6/first_contact_few_ships",
    voice7 = "team/v7/first_contact_few_ships",
    voice8 = "team/v8/first_contact_few_ships",
}


-- Напарники. Первый контакт (много кораблей) (больше 30% процентов от общего количества, но не менее 2)
SentenceDef.TEAM_FIRST_CONTACT_MANY_SHIPS = 
{
	int_radius = 1000.0,
	ext_radius = 1500.0,
    voice1 = "team/v1/first_contact_many_ships",
    voice2 = "team/v2/first_contact_many_ships",
    voice3 = "team/v3/first_contact_many_ships",
    voice4 = "team/v4/first_contact_many_ships",
    voice5 = "team/v5/first_contact_many_ships",
    voice6 = "team/v6/first_contact_many_ships",
    voice7 = "team/v7/first_contact_many_ships",
    voice8 = "team/v8/first_contact_many_ships",
}
    

-- Напарники. Напарник залочен двумя или более соперниками
SentenceDef.TEAM_LOCKED_BY_TWO_ENEMIES = 
{
	timeout = 100.0,
    voice1 = "team/v1/ally_help",
    voice2 = "team/v2/ally_help",
    voice3 = "team/v3/ally_help",
    voice4 = "team/v4/ally_help",
    voice5 = "team/v5/ally_help",
    voice6 = "team/v6/ally_help",
    voice7 = "team/v7/ally_help",
    voice8 = "team/v8/ally_help",
}
 

-- Напарники. Напарник убил врага (хвастается)
SentenceDef.TEAM_KILL_ENEMY = 
{
	timeout = 30.0,
	channel_timeout = 10.0,
	voice1 = "team/v1/mate_kill_enemy",
	voice2 = "team/v2/mate_kill_enemy",
	voice3 = "team/v3/mate_kill_enemy",
    voice4 = "team/v4/mate_kill_enemy",
    voice5 = "team/v5/mate_kill_enemy",
    voice7 = "team/v7/mate_kill_enemy",
    voice8 = "team/v8/mate_kill_enemy",
}


-- Напарники. Напарник убил врага который атаковал игрока (спаситель) 
SentenceDef.TEAM_KILL_ENEMY_THAT_ATTACK_PLAYER = 
{
	timeout = 120.0,
	channel_timeout = 5.0,
	voice1 = "team/v1/savior",
	voice2 = "team/v2/savior",
	voice3 = "team/v3/savior",
    voice4 = "team/v4/savior",
    voice5 = "team/v5/savior",
    voice6 = "team/v6/savior",
    voice7 = "team/v7/savior",
    voice8 = "team/v8/savior",
    
}


-- Напарники. Наш виталпойнт(дроны) получил первый урон
SentenceDef.TEAM_ALLY_POINT_FIRST_DAMAGE = 
{
	int_radius = 300,
	ext_radius = 600,
	timeout = 30.0,
	channel_timeout = 5.0,
	voice1 = "team/v1/ally_point_first_damage",
	voice2 = "team/v2/ally_point_first_damage",
	voice3 = "team/v3/ally_point_first_damage",
    voice4 = "team/v4/ally_point_first_damage",
    voice5 = "team/v5/ally_point_first_damage",
    voice6 = "team/v6/ally_point_first_damage",
    voice7 = "team/v7/ally_point_first_damage",
    voice8 = "team/v8/ally_point_first_damage",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}


-- Напарники. Игрок убил врага
SentenceDef.TEAM_PLAYER_DESTROY_ENEMY_SHIP = 
{
	timeout = 30.0,
	channel_timeout = 10.0,
    enqueue = true,
	voice1 = "team/v1/player_kill_enemy",
	voice2 = "team/v2/player_kill_enemy",
	voice3 = "team/v3/player_kill_enemy",
    voice4 = "team/v4/player_kill_enemy",
    voice5 = "team/v5/player_kill_enemy",
    voice6 = "team/v6/player_kill_enemy",
    voice7 = "team/v7/player_kill_enemy",
    voice8 = "team/v8/player_kill_enemy",
}


-- Напарники. Рандом (играть если не проигрывались никакие фразы более одной минуты)
SentenceDef.TEAM_COMBAT_RANDOM =
{
	timeout = 100.0,
	channel_timeout = 10.0,
    int_radius = 600.0,
	ext_radius = 1200.0,
	voice1 = "team_random",
    voice2 = "team_random",
    voice3 = "team_random",
    voice4 = "team_random",
    voice5 = "team_random",
    voice6 = "team_random",
    voice7 = "team_random",
    voice8 = "team_random",
}


-- Напарники. Напарник ведет бой с дронами виталпойнта
SentenceDef.TEAM_ATTACKING_POINT_DRONE_0 =
{
	timeout = 60.0,
    int_radius = 400.0,
	ext_radius = 800.0,
	voice1 = "team/v1/mate_attack_drone_a",
	voice2 = "team/v2/mate_attack_drone_a",
	voice3 = "team/v3/mate_attack_drone_a",
    voice4 = "team/v4/mate_attack_drone_a",
    voice5 = "team/v5/mate_attack_drone_a",
    voice6 = "team/v6/mate_attack_drone_a",
    voice7 = "team/v7/mate_attack_drone_a",
    voice8 = "team/v8/mate_attack_drone_a",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}

-- Напарники. Напарник ведет бой с дронами виталпойнта
SentenceDef.TEAM_ATTACKING_POINT_DRONE_1 =
{
	timeout = 60.0,
    int_radius = 400.0,
	ext_radius = 800.0,
	voice1 = "team/v1/mate_attack_drone_b",
	voice2 = "team/v2/mate_attack_drone_b",
	voice3 = "team/v3/mate_attack_drone_b",
    voice4 = "team/v4/mate_attack_drone_b",
    voice5 = "team/v5/mate_attack_drone_b",
    voice6 = "team/v6/mate_attack_drone_b",
    voice7 = "team/v7/mate_attack_drone_b",
    voice8 = "team/v8/mate_attack_drone_b",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}

-- Напарники. Напарник ведет бой с дронами виталпойнта
SentenceDef.TEAM_ATTACKING_POINT_DRONE_2 =
{
	timeout = 60.0,
    int_radius = 400.0,
	ext_radius = 800.0,
	voice1 = "team/v1/mate_attack_drone_c",
	voice2 = "team/v2/mate_attack_drone_c",
	voice3 = "team/v3/mate_attack_drone_c",
    voice4 = "team/v4/mate_attack_drone_c",
    voice5 = "team/v5/mate_attack_drone_c",
    voice6 = "team/v6/mate_attack_drone_c",
    voice7 = "team/v7/mate_attack_drone_c",
    voice8 = "team/v8/mate_attack_drone_c",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}

-- Напарники. Напарник ведет бой с дронами виталпойнта
SentenceDef.TEAM_ATTACKING_POINT_DRONE_3 =
{
	timeout = 30.0,
    int_radius = 400.0,
	ext_radius = 800.0,
	voice1 = "team/v1/mate_attack_drone_c",
	voice2 = "team/v2/mate_attack_drone_c",
	voice3 = "team/v3/mate_attack_drone_c",
    voice4 = "team/v4/mate_attack_drone_c",
    voice5 = "team/v5/mate_attack_drone_c",
    voice6 = "team/v6/mate_attack_drone_c",
    voice7 = "team/v7/mate_attack_drone_c",
    voice8 = "team/v8/mate_attack_drone_c",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}


-- Напарники. Напарник уничтожил всех дронов виталпойнта
SentenceDef.TEAM_DESTROY_ALL_POINT_DRONES_0 = 
{
	timeout = 30.0,
    int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "team/v1/mate_destroy_all_drones_a",
	voice2 = "team/v2/mate_destroy_all_drones_a",
	voice3 = "team/v3/mate_destroy_all_drones_a",
    voice4 = "team/v4/mate_destroy_all_drones_a",
    voice5 = "team/v5/mate_destroy_all_drones_a",
    voice6 = "team/v6/mate_destroy_all_drones_a",
    voice7 = "team/v7/mate_destroy_all_drones_a",
    voice8 = "team/v8/mate_destroy_all_drones_a",

	gameplays_exclude = { ai.Gameplay.CLANSHIP },
}

-- Напарники. Напарник уничтожил всех дронов виталпойнта
SentenceDef.TEAM_DESTROY_ALL_POINT_DRONES_1 = 
{
	timeout = 30.0,
    int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "team/v1/mate_destroy_all_drones_b",
	voice2 = "team/v2/mate_destroy_all_drones_b",
	voice3 = "team/v3/mate_destroy_all_drones_b",
    voice4 = "team/v4/mate_destroy_all_drones_b",
    voice5 = "team/v5/mate_destroy_all_drones_b",
    voice6 = "team/v6/mate_destroy_all_drones_b",
    voice7 = "team/v7/mate_destroy_all_drones_b",
    voice8 = "team/v8/mate_destroy_all_drones_b",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}

-- Напарники. Напарник уничтожил всех дронов виталпойнта
SentenceDef.TEAM_DESTROY_ALL_POINT_DRONES_2 = 
{
	timeout = 30.0,
    int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "team/v1/mate_destroy_all_drones_c",
	voice2 = "team/v2/mate_destroy_all_drones_c",
	voice3 = "team/v3/mate_destroy_all_drones_c",
    voice4 = "team/v4/mate_destroy_all_drones_c",
    voice5 = "team/v5/mate_destroy_all_drones_c",
    voice6 = "team/v6/mate_destroy_all_drones_c",
    voice7 = "team/v7/mate_destroy_all_drones_c",
    voice8 = "team/v8/mate_destroy_all_drones_c",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },
}

-- Напарники. Напарник уничтожил всех дронов виталпойнта
SentenceDef.TEAM_DESTROY_ALL_POINT_DRONES_3 = 
{
	timeout = 30.0,
    int_radius = 500.0,
	ext_radius = 1000.0,
	voice1 = "team/v1/mate_destroy_all_drones",
	voice2 = "team/v2/mate_destroy_all_drones",
	voice3 = "team/v3/mate_destroy_all_drones",
    voice4 = "team/v4/mate_destroy_all_drones",
    voice5 = "team/v5/mate_destroy_all_drones",
    voice6 = "team/v6/mate_destroy_all_drones",
    voice7 = "team/v7/mate_destroy_all_drones",
    voice8 = "team/v8/mate_destroy_all_drones",

    gameplays_exclude = { ai.Gameplay.CLANSHIP },    
}
    
	
-- Напарники. Напарники благодарят игрока за использование на него хороших модулей
SentenceDef.TEAM_THANKS_FOR_GOOD_MODULE = 
{
	timeout = 60.0,
	channel_timeout = 10.0,
	voice1 = "team/v1/thx",
	voice2 = "team/v2/thx",
    voice3 = "team/v3/thx",
    voice4 = "team/v4/thx",
    voice5 = "team/v5/thx",
    voice6 = "team/v6/thx",
    voice7 = "team/v7/thx",
    voice8 = "team/v8/thx",

}

-- Напарники. враг уничтожил один из наших кораблей
SentenceDef.TEAM_ENEMY_KILL_ALLY_SHIP = 
{
	timeout = 60.0,
	channel_timeout = 10.0,
	voice1 = "team/v1/enemy_kill_ally_ship",
	voice2 = "team/v2/enemy_kill_ally_ship",
    voice3 = "team/v3/enemy_kill_ally_ship",
    voice4 = "team/v4/enemy_kill_ally_ship",
    voice5 = "team/v5/enemy_kill_ally_ship",
    voice6 = "team/v6/enemy_kill_ally_ship",
    voice7 = "team/v7/enemy_kill_ally_ship",
    voice8 = "team/v8/enemy_kill_ally_ship",
}


--
SentenceDef.TEAM_PLAYER_AND_ALLY_LOCK_SAME_TARGET =
{
	timeout = 60.0,
	channel_timeout = 10.0,
	voice1 = "team/v1/lock_same_target",
    voice2 = "team/v2/lock_same_target",
    voice3 = "team/v3/lock_same_target",
    voice4 = "team/v4/lock_same_target",
    voice5 = "team/v5/lock_same_target",
    voice6 = "team/v6/lock_same_target",
    voice7 = "team/v7/lock_same_target",
    voice8 = "team/v8/lock_same_target",
}


-- Напарники. Сообщение в момент прилета кораблей сопровождения. Босс.
SentenceDef.TEAM_PVE_PACK_INCOMING = 
{
	enqueue = true,
    ignore_channel_timeout = true,
    voice1 = "cmd/v4/pve_pack_incoming",
    voice2 = "cmd/v4/pve_pack_incoming",
    voice3 = "cmd/v4/pve_pack_incoming",
    voice4 = "cmd/v4/pve_pack_incoming",
    voice5 = "cmd/v4/pve_pack_incoming",
    voice6 = "cmd/v5/pve_pack_incoming",
    voice7 = "cmd/v5/pve_pack_incoming",
    voice8 = "cmd/v5/pve_pack_incoming",
}


-- #0040685
SentenceDef.TEAM_KILL_PIRATE_OR_ALIEN =
{
	
}
  
  
-------------------------------
-- Сообщение в ангаре
-------------------------------
SentenceDef.HANGAR_CHANGE_EMPIRE =
{
	enqueue = true,
	voice1 = "hv/welcome_empire", -- в Halloween - поменять на "hv/laugh" (и обратно на "hv/welcome_empire" по окончании)

}

SentenceDef.HANGAR_CHANGE_FEDERATION =
{
	enqueue = true,
	voice1 = "hv/welcome_federation", -- в Halloween - поменять на "hv/laugh" (и обратно на "hv/welcome_federation" по окончании)

}

SentenceDef.HANGAR_CHANGE_JERICHO =
{
	enqueue = true,
	voice1 = "hv/welcome_jericho", -- в Halloween - поменять на "hv/laugh" (и обратно на "hv/welcome_jericho" по окончании)

}


-- Сообщение в ангаре. Приветствие игрока при входе в игру. Звучит сразу после загрузки ангара.
SentenceDef.HANGAR_CRYSTAL_LOGIN_GREETING = 
{
	enqueue = true,
	voice1 = "hv/login_el", -- в Halloween - поменять на "hv/laugh" (и обратно на "hv/login_el" по окончании)
}


SentenceDef.HANGAR_CHANGE_CRYSTAL =
{
	enqueue = true,
	voice1 = "hv/welcome_el", -- в Halloween - поменять на "hv/laugh" (и обратно на "hv/welcome_el" по окончании)

}

SentenceDef.HANGAR_CRYSTAL_WIN_PVP =
{
	enqueue = true,
	voice1 = "hv/win_pvp_el",

}

SentenceDef.HANGAR_CRYSTAL_WIN_PVE =
{
	enqueue = true,
	voice1 = "hv/win_pve_el",
	
}

SentenceDef.HANGAR_CRYSTAL_RANK_UP =
{
	enqueue = true,
	voice1 = "hv/rank_up_el",

}

SentenceDef.HANGAR_LOGIN_GREETING =
{
	enqueue = true,
	voice1 = "hv/login", -- в Halloween - поменять на "hv/laugh" (и обратно на "hv/login" по окончании)

}

-- Сообщение в ангаре. выбор расы Империя
SentenceDef.HANGAR_SELECT_RACE_EMPIRE =
{
	enqueue = true,
	voice1 = "hv/welcome_empire",
}

-- Сообщение в ангаре. выбор расы Федерация
SentenceDef.HANGAR_SELECT_RACE_FEDERATION =
{
	enqueue = true,
	voice1 = "hv/welcome_federation",
}

-- Сообщение в ангаре. выбор расы Иерихон
SentenceDef.HANGAR_SELECT_RACE_JERICHO =
{
	enqueue = true,
	voice1 = "hv/welcome_jericho",
}


-- Сообщение в ангаре. Поздравления игрока с повышением ранга. Повысился ранг - проиграл сентенс.
SentenceDef.HANGAR_RANK_UP =
{
	enqueue = true,
	voice1 = "hv/rank_up",
}

-- Сообщение в ангаре. Поздравления игрока с победой в PVP матче
SentenceDef.HANGAR_WIN_PVP = 
{
	enqueue = true,
	voice1 = "hv/win_pvp",
}

-- Сообщение в ангаре. Поздравления игрока с победой в PVE матче.
SentenceDef.HANGAR_WIN_PVE = 
{
	enqueue = true,
	voice1 = "hv/win_pve",
}

SentenceDef.CMDR_OAA_BOSS_START = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "sg/OneAgainstAll_alien",
	voice2 = "sg/OneAgainstAll_alien",
	voice3 = "sg/OneAgainstAll_alien",
}

SentenceDef.CMDR_OAA_HUNTERS_START = 
{
	enqueue = true,
	ignore_channel_timeout = true,
	voice1 = "sg/OneAgainstAll_human",
	voice2 = "sg/OneAgainstAll_human",
	voice3 = "sg/OneAgainstAll_human",
}