-- Правила сортировки в интерфейсе #53367
QuestCategory =
{
    LEVEL_UP = 1,
    EVENT = 2,
    STORY = 3,
    ALERT = 4,
    CHECKLIST = 5,
    RESOURCE = 6,
    ADVENTURE = 7,
}

QuestGroupId = 
{
    INGAME_TIME_DAILY       = 0,
    INGAME_TIME_WEEKLY      = 1,
    INGAME_TIME_MONTHLY     = 2,
    RESOURCE_ELLIDIUM_2     = 3,
    BFS                     = 4,
    RESOURCE_RARERAIDCHEST  = 5,
    RESOURCE_ELLIDIUM       = 6,
    CHECKLIST_GROUP_1       = 7,
    CHECKLIST_GROUP_2       = 8,
    CHECKLIST_GROUP_3       = 9,
    XENOCHIPS_1             = 10,
    XENOCHIPS_2             = 11,
    XENOCHIPS_3             = 12,
    XENOCHIPS_4             = 13,
    EQUIPMENT_PARTS_DAILY   = 14,
    IRRIDIUM                = 15,
    FRANCISCA_1             = 16,
    FRANCISCA_2             = 17,
    HUNGER                  = 18,
    SECTOR_CONQUEST         = 19,
    HALLOWEEN_2018          = 20,
    LEAGUES                 = 21,
	BFS_GUNGNIR				= 22,
	INGAME_TIME_DAILY_1		= 23,
	INGAME_TIME_DAILY_2		= 24,
	INGAME_TIME_DAILY_3		= 25,
	PROTOZAN_LOYALTY		= 26,
	LEAGUES_MO              = 27,
	RESOURCE_ELLIDIUM_SQUAD	= 28,
	INGAME_TIME_DAILY_4		= 29,
	MARATHON_1				= 30,
	MARATHON_2				= 31,
	MARATHON_3				= 32,
	MARATHON_4				= 33,
	MARATHON_5				= 34,
	MARATHON_6				= 35,
	MARATHON_7				= 36,
	MARATHON_8				= 37,
	BLACKRR2				= 38,
	BLACKRR3				= 39,
	BLACKRR4				= 40,
	BLACKRR6				= 41,
	BLACKRR7				= 42,
	BLACKRR9				= 43,
	BLACKRR1				= 44,
	
	HALLOWEEN_CULT_MAIN		= 45,
	HALLOWEEN_WITCH_1		= 46,
	HALLOWEEN_WITCH_2 		= 47,
	HALLOWEEN_WITCH_3 		= 48,
	HALLOWEEN_HUNTER_1		= 49,
	HALLOWEEN_HUNTER_2 		= 50,
	HALLOWEEN_HUNTER_3 		= 51,
	HALLOWEEN_CULT_END		= 52,
	
	REL_RESOURCE_1			= 53,
	NEW2021YEAR_GUN_1       = 54,
	NEW2021YEAR_GUN_2       = 55,
	NEW2021YEAR_GUN_3       = 56,

--Ивенты	
	APRIL_InvasionPVP		= 57,
	
	SpaceDay_A				= 58,
	SpaceDay_B				= 59,
	Daily_Custom_Quest		= 60,

	-- Финальный рейд-приключение «Возвращение Предтеч»
	RoP2025_Hint    = 61, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер
	
	-- Группа Квестики «Папкиина Неделька» SC-119788 
	WeekyKnickers    = 62, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер

	-- Группа «Четвертак за тридцать» SC-120101 
	A25FOR30OS1    = 63, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер
	A25FOR30OS2    = 64, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер
	A25FOR30OS3    = 65, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер	
	A25FOR30PV1    = 66, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер
	A25FOR30OS4    = 67, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер
	A25FOR30OS5    = 68, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер
	A25FOR30OS6    = 69, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер	
	A25FOR30PV2    = 70, -- Группа (QuestGroupId), параметры прописаны ниже (см по def'у) - тоже нужен номер	
	
	
}

QuestGroups = {}

QuestGroups[ QuestGroupId.INGAME_TIME_DAILY ] =
{
    cooldown_offer = 24,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.INGAME_TIME_DAILY_1 ] =
{
    cooldown_offer = 24,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.INGAME_TIME_DAILY_2 ] =
{
    cooldown_offer = 24,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.INGAME_TIME_DAILY_3 ] =
{
    cooldown_offer = 24,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.INGAME_TIME_DAILY_4 ] =
{
    cooldown_offer = 24,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.INGAME_TIME_WEEKLY ] =
{
    cooldown_offer = 168,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.INGAME_TIME_MONTHLY ] =
{
    cooldown_offer = 672,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.RESOURCE_RARERAIDCHEST ] =
{
    cooldown_complete = 1,
    manual_offer = true,
}

QuestGroups[ QuestGroupId.BFS ] =
{
    cooldown_complete = 20,
    manual_offer = true,
}

QuestGroups[ QuestGroupId.BFS_GUNGNIR ] =
{
    cooldown_complete = 20,
    manual_offer = true,
}

QuestGroups[ QuestGroupId.RESOURCE_ELLIDIUM] =
{
    cooldown_complete = 20,
    manual_offer = true,
}

QuestGroups[ QuestGroupId.RESOURCE_ELLIDIUM_2 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.RESOURCE_ELLIDIUM_SQUAD] =
{
    cooldown_complete = 20,
    manual_offer = true,
}

QuestGroups[ QuestGroupId.CHECKLIST_GROUP_1 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.CHECKLIST_GROUP_2 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.CHECKLIST_GROUP_3 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.XENOCHIPS_1 ] =
{
    cooldown_offer = 20,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.XENOCHIPS_2 ] =
{
    cooldown_offer = 20,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.XENOCHIPS_3 ] =
{
    cooldown_offer = 20,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.XENOCHIPS_4 ] =
{
    cooldown_offer = 20,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.EQUIPMENT_PARTS_DAILY ] =
{
    cooldown_complete = 24,
    ship_budget = true,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.IRRIDIUM ] =
{
    cooldown_complete = 20,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.FRANCISCA_1 ] =
{
    cooldown_complete = 12,
    manual_offer = true,
}

QuestGroups[ QuestGroupId.FRANCISCA_2 ] =
{
    cooldown_complete = 12,
    manual_offer = true,
}

QuestGroups[ QuestGroupId.HUNGER ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.SECTOR_CONQUEST ] =
{
    cooldown_complete = 20,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.HALLOWEEN_2018 ] = 
{
    cooldown_offer = 24,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.LEAGUES ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.LEAGUES_MO ] =
{
    cooldown_complete = 20,
	manual_offer = true,
}

QuestGroups[ QuestGroupId.PROTOZAN_LOYALTY ] =
{
    cooldown_complete = 22,
    manual_offer = true,
}

QuestGroups[ QuestGroupId.MARATHON_1 ] =
{
    cooldown_offer = 192,
    unchangeable = true,
}
QuestGroups[ QuestGroupId.MARATHON_2 ] =
{
    cooldown_offer = 192,
    unchangeable = true,
}
QuestGroups[ QuestGroupId.MARATHON_3 ] =
{
    cooldown_offer = 192,
    unchangeable = true,
}
QuestGroups[ QuestGroupId.MARATHON_4 ] =
{
    cooldown_offer = 192,
    unchangeable = true,
}
QuestGroups[ QuestGroupId.MARATHON_5 ] =
{
    cooldown_offer = 192,
    unchangeable = true,
}
QuestGroups[ QuestGroupId.MARATHON_6 ] =
{
    cooldown_offer = 192,
    unchangeable = true,
}
QuestGroups[ QuestGroupId.MARATHON_7 ] =
{
    cooldown_offer = 192,
    unchangeable = true,
}
QuestGroups[ QuestGroupId.MARATHON_8 ] =
{
    cooldown_offer = 192,
    unchangeable = true,
}

QuestGroups[ QuestGroupId.BLACKRR1 ] =
{
    cooldown_offer = 99999,
}
QuestGroups[ QuestGroupId.BLACKRR2 ] =
{
    cooldown_offer = 99999,
}
QuestGroups[ QuestGroupId.BLACKRR3 ] =
{
    cooldown_offer = 99999,
}
QuestGroups[ QuestGroupId.BLACKRR4 ] =
{
    cooldown_offer = 99999,
}
QuestGroups[ QuestGroupId.BLACKRR6 ] =
{
    cooldown_offer = 99999,
}
QuestGroups[ QuestGroupId.BLACKRR7 ] =
{
    cooldown_offer = 99999,
}
QuestGroups[ QuestGroupId.BLACKRR9 ] =
{
    cooldown_offer = 99999,
}

QuestGroups[ QuestGroupId.HALLOWEEN_CULT_MAIN ] =
{
    cooldown_complete = 20,
	unchangeable = true,
    manual_offer = true,
}

QuestGroups[ QuestGroupId.HALLOWEEN_WITCH_1 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.HALLOWEEN_WITCH_2 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.HALLOWEEN_WITCH_3 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.HALLOWEEN_HUNTER_1 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.HALLOWEEN_HUNTER_2 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.HALLOWEEN_HUNTER_3 ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.HALLOWEEN_CULT_END ] =
{
    cooldown_complete = 20,
}

QuestGroups[ QuestGroupId.REL_RESOURCE_1 ] =
{
    cooldown_offer = 20,
	unchangeable = true,
}

QuestGroups[ QuestGroupId.NEW2021YEAR_GUN_1 ] =
{
    cooldown_offer = 4800,
	unchangeable = true,
}

QuestGroups[ QuestGroupId.NEW2021YEAR_GUN_2 ] =
{
    cooldown_offer = 4800,
	unchangeable = true,
}

QuestGroups[ QuestGroupId.NEW2021YEAR_GUN_3 ] =
{
    cooldown_offer = 4800,
	unchangeable = true,
}

QuestGroups[ QuestGroupId.APRIL_InvasionPVP ] =
{
    cooldown_complete = 20,
	unchangeable = true,
}

QuestGroups[ QuestGroupId.SpaceDay_A ] =
{
    cooldown_offer = 20,
	unchangeable = true,
}

QuestGroups[ QuestGroupId.SpaceDay_B ] =
{
    cooldown_offer = 0,
	unchangeable = true,
}

QuestGroups[ QuestGroupId.Daily_Custom_Quest ] =
{
    cooldown_offer = 20,
	unchangeable = true,
}

-- Финальный рейд-приключение «Возвращение Предтеч»

QuestGroups[ QuestGroupId.RoP2025_Hint ] =
{
    -- cooldown_complete = 24, -- Кулдаун на переыдачу (счёт с завершения)
	cooldown_offer = 24, -- Кулдаун на переыдачу  (счёт с начала квеста)
    unchangeable = true,
}

-- Группа Квестики «Папкиина Неделька» SC-119788 

QuestGroups[ QuestGroupId.WeekyKnickers ] =
{
    -- cooldown_complete = 24, -- Кулдаун на переыдачу (счёт с завершения)
	cooldown_offer = 24, -- Кулдаун на переыдачу  (счёт с начала квеста) ДЛЯ ТЕСТОВ поставлено 0 час, ПОСЛЕ ПРОВЕРОК  - НЕ ЗАБЫТЬ ВЫСТАВИТЬ 24 ЧАСА (сутки)
    unchangeable = true,
}

-- Группы «Четвертак за тридцать» SC-120101 

QuestGroups[ QuestGroupId.A25FOR30OS1 ] = -- Квесты в PvP / PvEе (Player versus...)
{
    cooldown_complete = 24 * 33, -- Кулдаун на переыдачу (счёт с завершения) Должен быть больше, чем время действия ауры A25FOR30_1 (марафона в целом) иначе можно будет взять повторно
	--cooldown_offer = 24*33, -- Кулдаун на переыдачу  (счёт с начала квеста) Должен быть больше, чем время действия ауры A25FOR30_1 (марафона в целом) иначе можно будет взять повторно
    unchangeable = true,
}

QuestGroups[ QuestGroupId.A25FOR30OS2 ] = -- Квесты в PvP / PvEе (Player versus...)
{
    --cooldown_complete = 24*32, -- Кулдаун на переыдачу (счёт с завершения) Должен быть больше, чем время действия ауры A25FOR30_2 (марафона в целом) иначе можно будет взять повторно
	cooldown_offer = 24*32, -- Кулдаун на переыдачу  (счёт с начала квеста) Должен быть больше, чем время действия ауры A25FOR30_2 (марафона в целом) иначе можно будет взять повторно
    unchangeable = true,
}

QuestGroups[ QuestGroupId.A25FOR30OS3 ] = -- Квесты в PvP / PvEе (Player versus...)
{
    --cooldown_complete = 24*31, -- Кулдаун на переыдачу (счёт с завершения) Должен быть больше, чем время действия ауры A25FOR30_3 (марафона в целом) иначе можно будет взять повторно
	cooldown_offer = 24*31, -- Кулдаун на переыдачу  (счёт с начала квеста) Должен быть больше, чем время действия ауры A25FOR30_3 (марафона в целом) иначе можно будет взять повторно
    unchangeable = true,
}

QuestGroups[ QuestGroupId.A25FOR30PV1 ] = -- Квесты в PvP / PvEе (Player versus...)
{
    -- cooldown_complete = 24, -- Кулдаун на переыдачу (счёт с завершения)
	cooldown_offer = 24, -- Кулдаун на переыдачу  (счёт с начала квеста) ДЛЯ ТЕСТОВ поставлено 0 час, ПОСЛЕ ПРОВЕРОК  - НЕ ЗАБЫТЬ ВЫСТАВИТЬ 24 ЧАСА (сутки)
    unchangeable = true,
}

QuestGroups[ QuestGroupId.A25FOR30OS4 ] = -- Квесты в PvP / PvEе (Player versus...)
{
    -- cooldown_complete = 24, -- Кулдаун на переыдачу (счёт с завершения)
	cooldown_offer = 24*17, -- Кулдаун на переыдачу  (счёт с начала квеста) Должен быть больше, чем время действия ауры A25FOR30_8 (марафона в целом) иначе можно будет взять повторно
    unchangeable = true,
}

QuestGroups[ QuestGroupId.A25FOR30OS5 ] = -- Квесты в PvP / PvEе (Player versus...)
{
    -- cooldown_complete = 24, -- Кулдаун на переыдачу (счёт с завершения)
	cooldown_offer = 24*16, -- Кулдаун на переыдачу  (счёт с начала квеста) Должен быть больше, чем время действия ауры A25FOR30_9 (марафона в целом) иначе можно будет взять повторно
    unchangeable = true,
}

QuestGroups[ QuestGroupId.A25FOR30OS6 ] = -- Квесты в PvP / PvEе (Player versus...)
{
    -- cooldown_complete = 24, -- Кулдаун на переыдачу (счёт с завершения)
	cooldown_offer = 24*15, -- Кулдаун на переыдачу  (счёт с начала квеста) Должен быть больше, чем время действия ауры A25FOR30_10 (марафона в целом) иначе можно будет взять повторно
    unchangeable = true,
}

QuestGroups[ QuestGroupId.A25FOR30PV2 ] = -- Квесты в PvP / PvEе (Player versus...)
{
    -- cooldown_complete = 24, -- Кулдаун на переыдачу (счёт с завершения)
	cooldown_offer = 24, -- Кулдаун на переыдачу  (счёт с начала квеста) ДЛЯ ТЕСТОВ поставлено 0 час, ПОСЛЕ ПРОВЕРОК  - НЕ ЗАБЫТЬ ВЫСТАВИТЬ 24 ЧАСА (сутки)
    unchangeable = true,
}

Quests = {}

QuestId =
{
    ALERT_CHEST_OW2_1041 = 0,
    ALERT_CHEST_OW2_1046 = 1,
    ALERT_CHEST_OW2_1052 = 2,
    ALERT_CHEST_OW2_1057 = 3,
    ALERT_CHEST_OW2_1062 = 4,
    ALERT_CHEST_OW2_1067 = 5,
    ALERT_CHEST_OW2_1072 = 6,
    ALERT_CHEST_OW2_1077 = 7,
    ALERT_CHEST_OW2_1082 = 8,
    ALERT_CHEST_OW2_1087 = 9,
    ALERT_CHEST_OW2_1092 = 10,
    ALERT_CHEST_OW2_1097 = 11,
    ALERT_CHEST_OW2_1103 = 12,
    ALERT_CHEST_OW2_1108 = 13,
    ALERT_CHEST_OW2_1113 = 14,
    ALERT_CHEST_OW2_1118 = 15,
    ALERT_CHEST_OW2_1123 = 16,
    ALERT_CHEST_OW2_1128 = 17,
    ALERT_CHEST_OW2_1133 = 18,
    ALERT_CHEST_OW2_1138 = 19,
    ALERT_CHEST_OW2_1143 = 20,
    ALERT_CHEST_OW2_1148 = 21,
    ALERT_CHEST_OW2_1153 = 22,
    ALERT_CHEST_OW2_1158 = 23,
    ALERT_CHEST_OW2_1163 = 24,
    ALERT_CHEST_OW2_1168 = 25,
    ALERT_CHEST_OW2_1173 = 26,
    ALERT_CHEST_OW2_1178 = 27,
    ALERT_CHEST_OW2_1184 = 28,
    ALERT_CHEST_OW2_1189 = 29,
    ALERT_CHEST_OW2_1194 = 30,
    ALERT_CHEST_OW2_1199 = 31,
    ALERT_CHEST_OW2_1204 = 32,
    ALERT_CHEST_OW2_1209 = 33,
    ALERT_CHEST_OW2_1214 = 34,
    ALERT_CHEST_OW2_1219 = 35,
    ALERT_CHEST_OW2_1224 = 36,
    ALERT_CHEST_OW2_1229 = 37,
    ALERT_CHEST_OW2_1234 = 38,
    ALERT_CHEST_OW2_1239 = 39,
    ALERT_CHEST_OW2_1244 = 40,
    ALERT_CHEST_OW2_1249 = 41,
    ALERT_CHEST_OW2_1254 = 42,
    ALERT_CHEST_OW2_1259 = 43,
    ALERT_CHEST_OW2_1264 = 44,
    ALERT_CHEST_OW2_1269 = 45,
    ALERT_CHEST_OW2_1274 = 46,
    ALERT_CHEST_OW2_1279 = 47,
    ALERT_CHEST_OW2_1284 = 48,
    CAMPAIGN_QUEST_1 = 56,
    CAMPAIGN_QUEST_10 = 57,
    CAMPAIGN_QUEST_11 = 58,
    CAMPAIGN_QUEST_12 = 59,
    CAMPAIGN_QUEST_13 = 60,
    CAMPAIGN_QUEST_14 = 61,
    CAMPAIGN_QUEST_15 = 62,
    CAMPAIGN_QUEST_16 = 63,
    CAMPAIGN_QUEST_17 = 64,
    CAMPAIGN_QUEST_18 = 65,
    CAMPAIGN_QUEST_19 = 66,
    CAMPAIGN_QUEST_2 = 67,
    CAMPAIGN_QUEST_20 = 68,
    CAMPAIGN_QUEST_21 = 69,
    CAMPAIGN_QUEST_22 = 70,
    CAMPAIGN_QUEST_23 = 71,
    CAMPAIGN_QUEST_24 = 72,
    CAMPAIGN_QUEST_25 = 73,
    CAMPAIGN_QUEST_26 = 74,
    CAMPAIGN_QUEST_27 = 75,
    CAMPAIGN_QUEST_28 = 76,
    CAMPAIGN_QUEST_29 = 77,
    CAMPAIGN_QUEST_3 = 78,
    CAMPAIGN_QUEST_30 = 79,
    CAMPAIGN_QUEST_31 = 80,
    CAMPAIGN_QUEST_32 = 81,
    CAMPAIGN_QUEST_33 = 82,
    CAMPAIGN_QUEST_34 = 83,
    CAMPAIGN_QUEST_35 = 84,
    CAMPAIGN_QUEST_36 = 85,
    CAMPAIGN_QUEST_37 = 86,
    CAMPAIGN_QUEST_38 = 87,
    CAMPAIGN_QUEST_39 = 88,
    CAMPAIGN_QUEST_4 = 89,
    CAMPAIGN_QUEST_40 = 90,
    CAMPAIGN_QUEST_41 = 91,
    CAMPAIGN_QUEST_42 = 92,
    CAMPAIGN_QUEST_43 = 93,
    CAMPAIGN_QUEST_5 = 94,
    CAMPAIGN_QUEST_6 = 95,
    CAMPAIGN_QUEST_7 = 96,
    CAMPAIGN_QUEST_8 = 97,
    CAMPAIGN_QUEST_9 = 98,
    CHECKLIST_DAMAGE_1 = 104,
    CHECKLIST_DAMAGE_2 = 105,
    CHECKLIST_DAMAGE_3 = 106,
    CHECKLIST_DAMAGE_4 = 107,
    CHECKLIST_DAMAGE_5 = 108,
    CHECKLIST_DESTROYERS_2 = 109,
    CHECKLIST_DESTROYERS_3 = 110,
    CHECKLIST_DESTROYERS_4 = 111,
    CHECKLIST_DESTROYERS_5 = 112,
    CHECKLIST_EFFICIENCY_1 = 113,
    CHECKLIST_EFFICIENCY_2 = 114,
    CHECKLIST_EFFICIENCY_3 = 115,
    CHECKLIST_EFFICIENCY_4 = 116,
    CHECKLIST_EFFICIENCY_5 = 117,
    CHECKLIST_FIGHTERS_2 = 118,
    CHECKLIST_FIGHTERS_3 = 119,
    CHECKLIST_FIGHTERS_4 = 120,
    CHECKLIST_FIGHTERS_5 = 121,
    CHECKLIST_FRIGATES_2 = 122,
    CHECKLIST_FRIGATES_3 = 123,
    CHECKLIST_FRIGATES_4 = 124,
    CHECKLIST_FRIGATES_5 = 125,
    CHECKLIST_INTERCEPTORS_2 = 126,
    CHECKLIST_INTERCEPTORS_3 = 127,
    CHECKLIST_INTERCEPTORS_4 = 128,
    CHECKLIST_INTERCEPTORS_5 = 129,
    CHECKLIST_KILLS_1 = 130,
    CHECKLIST_KILLS_2 = 131,
    CHECKLIST_KILLS_3 = 132,
    CHECKLIST_KILLS_4 = 133,
    CHECKLIST_KILLS_5 = 134,
    CHECKLIST_KINET_1 = 135,
    CHECKLIST_KINET_2 = 136,
    CHECKLIST_KINET_3 = 137,
    CHECKLIST_KINET_4 = 138,
    CHECKLIST_KINET_5 = 139,
    CHECKLIST_OS_2 = 151,
    CHECKLIST_OS_3 = 152,
    CHECKLIST_OS_4 = 153,
    CHECKLIST_OS_5 = 154,
    CHECKLIST_PLASMA_1 = 155,
    CHECKLIST_PLASMA_2 = 156,
    CHECKLIST_PLASMA_3 = 157,
    CHECKLIST_PLASMA_4 = 158,
    CHECKLIST_PLASMA_5 = 159,
    CHECKLIST_PVE_1 = 160,
    CHECKLIST_PVE_2 = 161,
    CHECKLIST_PVE_3 = 162,
    CHECKLIST_PVE_4 = 163,
    CHECKLIST_PVE_5 = 164,
    CHECKLIST_PVP_2 = 165,
    CHECKLIST_PVP_3 = 166,
    CHECKLIST_PVP_4 = 167,
    CHECKLIST_PVP_5 = 168,
    CHECKLIST_THERMAL_1 = 169,
    CHECKLIST_THERMAL_2 = 170,
    CHECKLIST_THERMAL_3 = 171,
    CHECKLIST_THERMAL_4 = 172,
    CHECKLIST_THERMAL_5 = 173,
    CHECKLIST_WINS_1 = 174,
    CHECKLIST_WINS_2 = 175,
    CHECKLIST_WINS_3 = 176,
    CHECKLIST_WINS_4 = 177,
    CHECKLIST_WINS_5 = 178,
    LEVEL_UP_CHAIN_16 = 182,
    LEVEL_UP_CHAIN_17 = 190,
    LEVEL_UP_CHAIN_18 = 191,
    LEVEL_UP_CHAIN_19 = 192,
    LEVEL_UP_CHAIN_20 = 193,
    LEVEL_UP_CHAIN_21 = 194,
    LEVEL_UP_CHAIN_22 = 195,
    LEVEL_UP_CHAIN_23 = 196,
    LEVEL_UP_CHAIN_24 = 197,
    BFS = 198,
    INGAME_TIME_2 = 199,
    INGAME_TIME_1 = 200,
    OW_ean_dmk = 201,
    OW_ean_k = 202,
    OW_eds_dmk = 203,
    OW_eds_mk = 204,
    OW_edw_dk = 205,
    OW_edw_mk = 206,
    OW_egg_dmk = 207,
    OW_egg_k = 208,
    OW_EMPIRE_1 = 209,
    OW_EMPIRE_10 = 210,
    OW_EMPIRE_11 = 211,
    OW_EMPIRE_12 = 212,
    OW_EMPIRE_14 = 213,
    OW_EMPIRE_15 = 214,
    OW_EMPIRE_2 = 215,
    OW_EMPIRE_3 = 216,
    OW_EMPIRE_4 = 217,
    OW_EMPIRE_5 = 218,
    OW_EMPIRE_6 = 219,
    OW_EMPIRE_7 = 220,
    OW_EMPIRE_8 = 221,
    OW_EMPIRE_9 = 222,
    OW_EMPIRE_bbk = 223,
    OW_EMPIRE_bbmk = 224,
    OW_EMPIRE_crk = 225,
    OW_EMPIRE_crmk = 226,
    OW_EMPIRE_gr2d = 227,
    OW_EMPIRE_gr2do = 228,
    OW_EMPIRE_gr2k = 229,
    OW_EMPIRE_gr2l = 230,
    OW_EMPIRE_gr2mk = 231,
    OW_EMPIRE_gr2pt = 232,
    OW_EMPIRE_gr3d = 233,
    OW_EMPIRE_gr3do = 234,
    OW_EMPIRE_gr3k = 235,
    OW_EMPIRE_gr3l = 236,
    OW_EMPIRE_gr3mk = 237,
    OW_EMPIRE_gr3pt = 238,
    OW_EMPIRE_grd = 239,
    OW_EMPIRE_grk = 240,
    OW_EMPIRE_grl = 241,
    OW_EMPIRE_grmk = 242,
    OW_EMPIRE_gs2d = 243,
    OW_EMPIRE_gs2do = 244,
    OW_EMPIRE_gs2k = 245,
    OW_EMPIRE_gs2l = 246,
    OW_EMPIRE_gs2mk = 247,
    OW_EMPIRE_gs2pt = 248,
    OW_EMPIRE_gs3do = 249,
    OW_EMPIRE_gs3k = 250,
    OW_EMPIRE_gs3l = 251,
    OW_EMPIRE_gs3mk = 252,
    OW_EMPIRE_gs3pt = 253,
    OW_EMPIRE_gsd = 254,
    OW_EMPIRE_gsk = 255,
    OW_EMPIRE_gsl = 256,
    OW_EMPIRE_gsmk = 257,
    OW_EMPIRE_gst = 258,
    OW_EMPIRE_msd = 259,
    OW_EMPIRE_msl = 260,
    OW_EMPIRE_rsd = 261,
    OW_EMPIRE_rsl = 262,
    OW_EMPIRE_rsmk = 263,
    OW_EMPIRE_rst = 264,
    OW_EMPIRE_s2d = 265,
    OW_EMPIRE_s2k = 266,
    OW_EMPIRE_s2l = 267,
    OW_EMPIRE_s2mk = 268,
    OW_EMPIRE_s2pt = 269,
    OW_EMPIRE_s3do = 270,
    OW_EMPIRE_s3k = 271,
    OW_EMPIRE_s3l = 272,
    OW_EMPIRE_s3mk = 273,
    OW_EMPIRE_s3t = 274,
    OW_EMPIRE_sdd = 275,
    OW_EMPIRE_sdk = 276,
    OW_EMPIRE_sdl = 277,
    OW_EMPIRE_sdmk = 278,
    OW_EMPIRE_sdpt = 279,
    OW_ept_dk = 280,
    OW_ept_mk = 281,
    OW_fac_dmk = 282,
    OW_fac_mk = 283,
    OW_fad_dk = 284,
    OW_fad_mk = 285,
    OW_FEDERATION_1 = 286,
    OW_FEDERATION_10 = 287,
    OW_FEDERATION_11 = 288,
    OW_FEDERATION_12 = 289,
    OW_FEDERATION_13 = 290,
    OW_FEDERATION_15 = 291,
    OW_FEDERATION_16 = 292,
    OW_FEDERATION_2 = 293,
    OW_FEDERATION_3 = 294,
    OW_FEDERATION_4 = 295,
    OW_FEDERATION_5 = 296,
    OW_FEDERATION_6 = 297,
    OW_FEDERATION_7 = 298,
    OW_FEDERATION_8 = 299,
    OW_FEDERATION_9 = 300,
    OW_FEDERATION_abk = 301,
    OW_FEDERATION_abmk = 302,
    OW_FEDERATION_cw2do = 303,
    OW_FEDERATION_cw2k = 304,
    OW_FEDERATION_cw2l = 305,
    OW_FEDERATION_cw2mk = 306,
    OW_FEDERATION_cw2pt = 307,
    OW_FEDERATION_cw3k = 308,
    OW_FEDERATION_cw3l = 309,
    OW_FEDERATION_cw3mk = 310,
    OW_FEDERATION_cw3pt = 311,
    OW_FEDERATION_cwd = 312,
    OW_FEDERATION_cwdo = 313,
    OW_FEDERATION_cwk = 314,
    OW_FEDERATION_cwl = 315,
    OW_FEDERATION_cwmk = 316,
    OW_FEDERATION_cwpt = 317,
    OW_FEDERATION_fsd = 318,
    OW_FEDERATION_gcd = 319,
    OW_FEDERATION_gck = 320,
    OW_FEDERATION_gcl = 321,
    OW_FEDERATION_gcmk = 322,
    OW_FEDERATION_gct = 323,
    OW_FEDERATION_gld = 324,
    OW_FEDERATION_glk = 325,
    OW_FEDERATION_gll = 326,
    OW_FEDERATION_glmk = 327,
    OW_FEDERATION_gsd = 328,
    OW_FEDERATION_gsk = 329,
    OW_FEDERATION_gsmk = 330,
    OW_FEDERATION_lc2d = 331,
    OW_FEDERATION_lc2l = 332,
    OW_FEDERATION_lc2pt = 333,
    OW_FEDERATION_lc3d = 334,
    OW_FEDERATION_lc3do = 335,
    OW_FEDERATION_lc3k = 336,
    OW_FEDERATION_lc3l = 337,
    OW_FEDERATION_lc3mk = 338,
    OW_FEDERATION_lc3t = 339,
    OW_FEDERATION_lcd = 340,
    OW_FEDERATION_lcl = 341,
    OW_FEDERATION_lcmk = 342,
    OW_FEDERATION_lcpt = 343,
    OW_FEDERATION_sh2d = 344,
    OW_FEDERATION_sh2k = 345,
    OW_FEDERATION_sh2l = 346,
    OW_FEDERATION_sh2mk = 347,
    OW_FEDERATION_sh2t = 348,
    OW_FEDERATION_sh3do = 349,
    OW_FEDERATION_sh3k = 350,
    OW_FEDERATION_sh3l = 351,
    OW_FEDERATION_sh3mk = 352,
    OW_FEDERATION_sh3pt = 353,
    OW_FEDERATION_shd = 354,
    OW_FEDERATION_shdo = 355,
    OW_FEDERATION_shk = 356,
    OW_FEDERATION_shl = 357,
    OW_FEDERATION_shmk = 358,
    OW_ffs_dk = 359,
    OW_ffs_mk = 360,
    OW_fls_dk = 361,
    OW_fls_mk = 362,
    OW_fns_dmk = 363,
    OW_fns_k = 364,
    OW_jac_dmk = 365,
    OW_jac_mk = 366,
    OW_jad_dmk = 367,
    OW_jad_mk = 368,
    OW_jbd_dmk = 369,
    OW_jbd_mk = 370,
    OW_jcc_dmk = 371,
    OW_jcc_k = 372,
    OW_JERICHO_1 = 373,
    OW_JERICHO_10 = 374,
    OW_JERICHO_11 = 375,
    OW_JERICHO_12 = 376,
    OW_JERICHO_13 = 377,
    OW_JERICHO_15 = 378,
    OW_JERICHO_2 = 379,
    OW_JERICHO_3 = 380,
    OW_JERICHO_4 = 381,
    OW_JERICHO_5 = 382,
    OW_JERICHO_6 = 383,
    OW_JERICHO_7 = 384,
    OW_JERICHO_8 = 385,
    OW_JERICHO_9 = 386,
    OW_JERICHO_ghd = 387,
    OW_JERICHO_ghdo = 388,
    OW_JERICHO_ghl = 389,
    OW_JERICHO_gi2d = 390,
    OW_JERICHO_gi2k = 391,
    OW_JERICHO_gi2l = 392,
    OW_JERICHO_gi2mk = 393,
    OW_JERICHO_gi2pt = 394,
    OW_JERICHO_gi3d = 395,
    OW_JERICHO_gi3do = 396,
    OW_JERICHO_gi3k = 397,
    OW_JERICHO_gi3l = 398,
    OW_JERICHO_gi3mk = 399,
    OW_JERICHO_gi3pt = 400,
    OW_JERICHO_gik = 401,
    OW_JERICHO_gil = 402,
    OW_JERICHO_gimk = 403,
    OW_JERICHO_git = 404,
    OW_JERICHO_gmd = 405,
    OW_JERICHO_gmdo = 406,
    OW_JERICHO_gmk = 407,
    OW_JERICHO_gml = 408,
    OW_JERICHO_gmmk = 409,
    OW_JERICHO_gmpt = 410,
    OW_JERICHO_jbd = 411,
    OW_JERICHO_jbk = 412,
    OW_JERICHO_jbmk = 413,
    OW_JERICHO_ms2k = 414,
    OW_JERICHO_ms2l = 415,
    OW_JERICHO_ms2mk = 416,
    OW_JERICHO_ms2t = 417,
    OW_JERICHO_ms3d = 418,
    OW_JERICHO_ms3l = 419,
    OW_JERICHO_ms3mk = 420,
    OW_JERICHO_ms3t = 421,
    OW_JERICHO_msd = 422,
    OW_JERICHO_msdo = 423,
    OW_JERICHO_msk = 424,
    OW_JERICHO_msl = 425,
    OW_JERICHO_msmk = 426,
    OW_JERICHO_mtd = 427,
    OW_JERICHO_mtdo = 428,
    OW_JERICHO_mtk = 429,
    OW_JERICHO_mtl = 430,
    OW_JERICHO_mtmk = 431,
    OW_JERICHO_mtt = 432,
    OW_JERICHO_s2k = 433,
    OW_JERICHO_s2l = 434,
    OW_JERICHO_s2mk = 435,
    OW_JERICHO_s2t = 436,
    OW_JERICHO_s3d = 437,
    OW_JERICHO_s3k = 438,
    OW_JERICHO_s3l = 439,
    OW_JERICHO_s3mk = 440,
    OW_JERICHO_s3pt = 441,
    OW_jls_dmk = 442,
    OW_jls_mk = 443,
    OW_jth_dk = 444,
    OW_jth_mk = 445,
    OW_WINTER_WAR_1 = 446,
    OW_WINTER_WAR_2 = 447,
    OW_WINTER_WAR_3 = 448,
    OW_WINTER_WAR_4 = 449,
    RESOURCE_ELLIDIUM_0 = 452,
    RESOURCE_ELLIDIUM_2 = 454,
    RESOURCE_ELLIDIUM_3 = 455,
    RESOURCE_RARERAIDCHEST_1 = 456,
    RESOURCE_RARERAIDCHEST_2 = 457,
    RESOURCE_RARERAIDCHEST_3 = 458,
    UFO_1 = 459,
    UFO_10 = 460,
    UFO_11 = 461,
    UFO_2 = 462,
    UFO_3 = 463,
    UFO_4 = 464,
    UFO_5 = 465,
    UFO_6 = 466,
    UFO_7 = 467,
    UFO_8 = 468,
    UFO_9 = 469,

    -- Xenochips Events
    XENOCHIPS_PVP_1_1 = 470,
    XENOCHIPS_PVP_1_2 = 471,
    XENOCHIPS_PVP_1_3 = 472,
    XENOCHIPS_PVP_2_1 = 473,
    XENOCHIPS_PVP_2_2 = 474,
    XENOCHIPS_PVP_2_3 = 475,
    XENOCHIPS_PVE_1 = 476,
    XENOCHIPS_PVE_2 = 477,
    XENOCHIPS_PVE_3 = 478,
    XENOCHIPS_OW_1 = 479,
    XENOCHIPS_OW_2 = 480,

    EQUIPMENT_PARTS_1 = 481,
    EQUIPMENT_PARTS_2 = 482,
    EQUIPMENT_PARTS_3 = 483,
    EQUIPMENT_PARTS_4 = 484,

    CONTRACT_IRRIDIUM = 485,

    LEVEL_UP_CHAIN_1 = 486,
    LEVEL_UP_CHAIN_2 = 487,
    LEVEL_UP_CHAIN_3 = 488,
    LEVEL_UP_CHAIN_4 = 489,
    LEVEL_UP_CHAIN_5 = 490,
    LEVEL_UP_CHAIN_6 = 491,
    LEVEL_UP_CHAIN_7 = 492,
    LEVEL_UP_CHAIN_8 = 493,
    LEVEL_UP_CHAIN_9 = 494,
    LEVEL_UP_CHAIN_10 = 495,
    LEVEL_UP_CHAIN_11 = 496,
    LEVEL_UP_CHAIN_12 = 497,
    LEVEL_UP_CHAIN_13 = 498,
    LEVEL_UP_CHAIN_14 = 499,
    LEVEL_UP_CHAIN_15 = 500,

    FRANCISCA_1 = 501,
    FRANCISCA_2 = 502,

    HUNGER = 503,

    --bzs quest
    SECCON_BATTLE = 504,
    FRANCISCA_1_2 = 505,
    FRANCISCA_2_2 = 506,

    HALLOWEEN_2018_1 = 507,
    HALLOWEEN_2018_2 = 508,
    HALLOWEEN_2018_3 = 509,

    SECCON_BATTLE_2 = 510,
    LEAGUES = 511,

    IMAGINARY = 512,
    OW_IMAGINARY = 513,

    --SAMPLE = 514,

    OW_EMPIRE_tsmk = 55,
    OW_EMPIRE_tsk = 99,
    OW_FEDERATION_aymk = 100,
    OW_FEDERATION_ayd = 101,
    OW_FEDERATION_ayt = 102,
    OW_FEDERATION_od = 103,
    OW_FEDERATION_ok = 179,
    OW_EMPIRE_n17mk = 180,
    OW_EMPIRE_n17pt = 181,
    OW_EMPIRE_dsk = 183,
    OW_EMPIRE_dsd = 184,
    OW_FEDERATION_tdl = 185,
    OW_FEDERATION_tdk = 186,

    OW_EMPIRE_asmk = 49,
    OW_JERICHO_lhmk = 50,
    OW_JERICHO_lhd = 51,
    OW_JERICHO_lhd2 = 52,
    ELL_2_2 = 53, -- removed
    ELL_2_3 = 54, -- removed
    GENERAL_CHAIN_14 = 187, -- removed
    GENERAL_CHAIN_15 = 188, -- removed
    GENERAL_CHAIN_16 = 189, -- removed
    RESOURCE_DESTROYERS_1 = 450, -- removed
    RESOURCE_DESTROYERS_2 = 451, -- removed
    CHECKLIST_LEAGUES_3 = 140, -- removed
    CHECKLIST_LEAGUES_4 = 141, -- removed
    CHECKLIST_LEAGUES_5 = 142, -- removed
    CHECKLIST_MAJOR_LEAGUE_3 = 143, -- removed
    CHECKLIST_MAJOR_LEAGUE_4 = 144, -- removed
    CHECKLIST_MAJOR_LEAGUE_5 = 145, -- removed
    CHECKLIST_META_1 = 146, -- removed
    CHECKLIST_META_2 = 147, -- removed
    CHECKLIST_META_3 = 148, -- removed
    CHECKLIST_META_4 = 149, -- removed
    CHECKLIST_META_5 = 150, -- removed
    RESOURCE_ELLIDIUM_1 = 453, -- removed
	
	-- Contracts
	GOLDEN_AURA			= 515,
	GOLDEN_QUEST_BP		= 519,
	
	-- Events
	BIRTHDAY2020		= 514,
	STAY_HOME			= 516,
	
	-- Gungnir
	GUNGNIR_1			= 517,
	GUNGNIR_2			= 518,
	
	-- Raven
	RAVEN_1				= 520,
	RAVEN_2				= 521,
	
	-- HALLOWEEN_2020
	HALLOWEEN_2020_1 	= 522,
	HALLOWEEN_2020_2 	= 523,
	HALLOWEEN_2020_3 	= 524,
	HALLOWEEN_2020_4 	= 525,
	HALLOWEEN_2020_5 	= 526,
	HALLOWEEN_2020_6 	= 527,
	HALLOWEEN_2020_7 	= 528,
	HALLOWEEN_2020_FINAL= 529,
	 
	 -- New 2021 year guns
	NEW2021YEAR_GUN_1	= 530,
	NEW2021YEAR_GUN_2 	= 531,
	NEW2021YEAR_GUN_3	= 532,
	 
	 -- New year 2021 marathon
	NEWYEAR_2021_1 		= 533,
	NEWYEAR_2021_2 		= 534,
	NEWYEAR_2021_3 		= 535,
	NEWYEAR_2021_4 		= 536,
	NEWYEAR_2021_5 		= 537,
	NEWYEAR_2021_6 		= 538,
	NEWYEAR_2021_7 		= 539,
	NEWYEAR_2021_FINAL	= 540,
	
	OW_April2021_1		= 541,
	OW_April2021_2		= 542,
	OW_April2021_3		= 543,
	OW_April2021_4		= 544,
	OW_April2021_5		= 545,
	OW_April2021_6		= 546,
	OW_April2021_7		= 547,
	OW_April2021_8		= 548,
	OW_April2021_9		= 549,
	OW_April2021_10		= 550,
	OW_April2021_End	= 551,
	
	SALYUT_XENO_1		= 552,
	SALYUT_XENO_2		= 553,
	SALYUT_XENO_3		= 554,
	SALYUT_XENO_4		= 555,
	
	PROTOZAN_START		= 556,
	PROTOZAN_LOYALTY_MAIN = 557,
	PROTOZAN_LOYALTY_1	= 558,
	PROTOZAN_LOYALTY_2	= 559,
	PROTOZAN_LOYALTY_3	= 560,
	PROTOZAN_LOYALTY_4	= 561,
	PROTOZAN_SKILL_E1	= 562,
	PROTOZAN_SKILL_E2	= 563,
	PROTOZAN_SKILL_E3	= 564,
	PROTOZAN_SKILL_E4	= 565,
	PROTOZAN_SKILL_H1	= 566,
	PROTOZAN_SKILL_H2	= 567,
	PROTOZAN_SKILL_H3	= 568,
	PROTOZAN_SKILL_H4	= 569,
	PROTOZAN_SKILL_H5	= 570,
	PROTOZAN_SQUAD		= 571,
	PROTOZAN_SKILL_ULTIMATE	= 572,
	
	LEAGUES_1 = 573,
	LEAGUES_2 = 574,
	LEAGUES_3 = 575,
	
	RESOURCE_ELLIDIUM_4	= 576,
	RESOURCE_ELLIDIUM_5	= 577,
	
	EVENT_PVP_1			= 578,
	EVENT_PVP_2			= 579,
	EVENT_PVP_3			= 580,
	EVENT_PVP_4			= 581,
	EVENT_PVE_1			= 582,
	EVENT_PVE_2			= 583,
	EVENT_PVE_3			= 584,
	EVENT_ALL_1			= 585,
	EVENT_ALL_2			= 586,
	EVENT_ALL_3			= 587,
	EVENT_ALL_4			= 588,
	EVENT_TASK_COMPLITE	= 589,
	
	TREASURE_CRAFT_1	= 590,
	TREASURE_CRAFT_2	= 591,
	TREASURE_CRAFT_3	= 592,
	TREASURE_CRAFT_4	= 593,
	TREASURE_CRAFT_5	= 594,
	TREASURE_CRAFT_6	= 595,
	TREASURE_CRAFT_7	= 596,
	TREASURE_CRAFT_8	= 597,
	TREASURE_1			= 598,
	TREASURE_2			= 599,
	TREASURE_3			= 600,
	TREASURE_4			= 601,
	TREASURE_5			= 602,
	TREASURE_6			= 603,
	TREASURE_7			= 604,
	TREASURE_8			= 605,
	
	OW_PiratBasePve_Treasure = 606,
	BATTLEPASS_TREASURE_QUEST = 607,
	
	OW_PikabuEvent		= 608,
	OW_PikabuEvent_1	= 609,
	OW_PikabuEvent_2	= 610,
	OW_PikabuEvent_3	= 611,
	OW_PikabuEvent_0	= 612,
	
	NEW_GROUND_START	= 613,
	NEW_GROUND_END		= 614,
	
	-- BP_DAILY_01..30	= 615..644
	
	OW_BlackRelayRace_1	= 645,
	OW_BlackRelayRace_2	= 646,
	OW_BlackRelayRace_3	= 647,
	OW_BlackRelayRace_4	= 648,
	OW_BlackRelayRace_5	= 649,
	OW_BlackRelayRace_6	= 650,
	OW_BlackRelayRace_7	= 651,
	OW_BlackRelayRace_8	= 652,
	OW_BlackRelayRace_9	= 653,
	OW_BlackRelayRace_10= 654,
	OW_BlackRelayRace_11= 655,
	
	-- Halloween cult 2022
	HALLOWEEN_HUNTER_5	= 656,
	HALLOWEEN_CULT_END	= 657,
	HALLOWEEN_WITCH_AGENT_1	= 658,
	HALLOWEEN_WITCH_AGENT_2	= 659,
	HALLOWEEN_WITCH_AGENT_3	= 660,
	HALLOWEEN_WITCH_AGENT_4	= 661,
	HALLOWEEN_WITCH_AGENT_5	= 662,
	HALLOWEEN_WITCH_AGENT_6	= 663,
	HALLOWEEN_WITCH_AGENT_7	= 664,
	HALLOWEEN_WITCH_AGENT_8	= 665,
	HALLOWEEN_WITCH_MAIN	= 666,
	HALLOWEEN_HUNTER_MAIN	= 667,
	HALLOWEEN_WITCH_1	= 668,
	HALLOWEEN_WITCH_2	= 669,
	HALLOWEEN_WITCH_3	= 670,
	HALLOWEEN_WITCH_4	= 671,
	HALLOWEEN_WITCH_5	= 672,
	HALLOWEEN_HUNTER_1	= 673,
	HALLOWEEN_HUNTER_2	= 674,
	HALLOWEEN_HUNTER_3	= 675,
	HALLOWEEN_HUNTER_4	= 676,
	
	REL_RESOURCE_PVP	= 677,
	REL_RESOURCE_PVE_S_1 = 678,
	REL_RESOURCE_PVE_S_2 = 679,
	REL_RESOURCE_PVE_S_3 = 680,
	REL_RESOURCE_PVE_S_4 = 681,
	REL_RESOURCE_PVE_S_5 = 682,
	REL_RESOURCE_PVE_S_6 = 683,
	REL_RESOURCE_PVE_S_7 = 684,
	REL_RESOURCE_PVE_S_8 = 685,
	REL_RESOURCE_PVE_S_9 = 686,
	REL_RESOURCE_PVE_H_1 = 687,
	REL_RESOURCE_PVE_H_2 = 688,
	REL_RESOURCE_PVE_H_3 = 689,
	REL_RESOURCE_PVE_H_4 = 690,
	REL_RESOURCE_PVE_H_5 = 691,
	REL_RESOURCE_PVE_H_6 = 692,
	REL_RESOURCE_PVE_H_7 = 693,
	REL_RESOURCE_PVE_H_8 = 694,
	REL_RESOURCE_PVE_H_9 = 695,
	
	--Апрель 2023 поиск яиц
	OW_April2023_main = 696,
	OW_April2023_1	= 697,
	OW_April2023_2	= 698,
	OW_April2023_3	= 699,
	OW_April2023_4	= 700,
	OW_April2023_5	= 701,
	OW_April2023_6	= 702,
	OW_April2023_7	= 703,
	OW_April2023_8	= 704,
	OW_April2023_9	= 705,
	OW_April2023_10	= 706,
	
	APRIL_Paper_invasionPVP = 707,
	
	-- День космонавтики 2023
	SpaceDay_main = 708,
	SpaceDay_1  = 709,
	SpaceDay_2	= 710,
	SpaceDay_3	= 711,
	SpaceDay_4	= 712,
	
	SpaceDay_5	= 713,
	SpaceDay_6	= 714,
	SpaceDay_7	= 715,
	SpaceDay_8	= 716,
	SpaceDay_9	= 717,
	SpaceDay_10	= 718,
	SpaceDay_11	= 719,
	SpaceDay_12	= 720,
	SpaceDay_13	= 721,
	SpaceDay_14	= 722,
	
	-- АРМАДА МЕЧТЫ (ресурсы для кораблей 15 ранга)
	
	Tier15_1 = 723,
	Tier15_2 = 724,
	Tier15_3 = 725,
	Tier15_4 = 726,
	Tier15_5 = 727,
	Tier15_6 = 728,
	Tier15_7 = 729,
	Tier15_8 = 730,
	Tier15_9 = 731,
	Tier15_10 = 732,
	Tier15_11 = 733,
	Tier15_12 = 734,
	Tier15_13 = 735,
	Tier15_14 = 736,
	Tier15_15 = 737,
	Tier15_16 = 738,
	Tier15_17 = 739,
	Tier15_18 = 740,
	Tier15_19 = 741,
	Tier15_20 = 742,
	Tier15_21 = 743,
	Tier15_22 = 744,
	Tier15_23 = 745,
	Tier15_24 = 746,
	Tier15_25 = 747,
	Tier15_26 = 748,
	Tier15_27 = 749,
	Tier15_28 = 750,
	Tier15_29 = 751,
	Tier15_30 = 752,
	Tier15_31 = 824,
	Tier15_32 = 825,
	Tier15_33 = 826,
	Tier15_34 = 827,
	Tier15_35 = 828,
	Tier15_36 = 829,
	
	-- Summer 2023 marathon
	SUMMER_2023_1 		= 753,
	SUMMER_2023_2 		= 754,
	SUMMER_2023_3 		= 755,
	SUMMER_2023_4 		= 756,
	SUMMER_2023_5 		= 757,
	SUMMER_2023_6 		= 758,
	SUMMER_2023_7 		= 759,
	SUMMER_2023_FINAL	= 760,
	
	OW_Ariadna_1 = 761,
	
	-- Ауры для купивших BattlePass_Elite в предыдущем сезоне (НАЧАЛО БЛОКА)	
	
	ELITE_DONATER_BP12_2 = 762,
	
	-- Ауры для купивших BattlePass_Elite в предыдущем сезоне (КОНЕЦ БЛОКА)

	-- Halloween cult 2023

	HALLOWEEN_WITCH_AGENT_2023_1	= 763,
	HALLOWEEN_WITCH_AGENT_2023_2	= 764,
	HALLOWEEN_WITCH_AGENT_2023_3	= 765,
	HALLOWEEN_WITCH_AGENT_2023_4	= 766,
	HALLOWEEN_WITCH_AGENT_2023_5	= 767,
	HALLOWEEN_WITCH_AGENT_2023_6	= 768,
	HALLOWEEN_WITCH_AGENT_2023_7	= 769,
	HALLOWEEN_WITCH_AGENT_2023_8	= 770,
	HALLOWEEN_WITCH_2023_MAIN	= 771,
	HALLOWEEN_HUNTER_2023_MAIN	= 772,
	HALLOWEEN_WITCH_2023_1	= 773,
	HALLOWEEN_WITCH_2023_2	= 774,
	HALLOWEEN_WITCH_2023_3	= 775,
	HALLOWEEN_WITCH_2023_4	= 776,
	HALLOWEEN_WITCH_2023_5	= 777,
	HALLOWEEN_HUNTER_2023_1	= 778,
	HALLOWEEN_HUNTER_2023_2	= 779,
	HALLOWEEN_HUNTER_2023_3	= 780,
	HALLOWEEN_HUNTER_2023_4	= 781,
	HALLOWEEN_HUNTER_2023_5	= 782,
	HALLOWEEN_CULT_2023_END	= 783,

	-- Ауры (Квесты) для получения "Эсминца Сострадания" (Rank11), SC-118276
	
	BRAVE_PILOT_INTRO = 784,
	BRAVE_PILOT = 785,	
	
	-- Марафон «Мал клоп - да могуч» 2024
	OWFEST_24_1 		= 786,
	OWFEST_24_2 		= 787,
	OWFEST_24_3 		= 788,
	OWFEST_24_4 		= 789,
	OWFEST_24_5 		= 790,
	OWFEST_24_6 		= 791,
	OWFEST_24_7 		= 792,
	OWFEST_24_FINAL	= 793,

	-- Квест Разрушитель Эсминцев (Destroyer of Destroyers) к Марафону «Мал клоп - да могуч» 2024
	OW2DESTROYER 		= 794,	

	-- Марафон «Стойкий Оловяный Пилотик» Фестиваль заданий в честь 10 лет (2024)
	TIN10_1 		= 795,
	TIN10_2 		= 796,
	TIN10_3 		= 797,
	TIN10_4 		= 798,
	TIN10_5 		= 799,
	TIN10_6 		= 800,
	TIN10_7 		= 801,
	TIN10_FINAL	= 802,
	
	-- Halloween cult 2024

	HALLOWEEN_WITCH_AGENT_2024_1	= 803,
	HALLOWEEN_WITCH_AGENT_2024_2	= 804,
	HALLOWEEN_WITCH_AGENT_2024_3	= 805,
	HALLOWEEN_WITCH_AGENT_2024_4	= 806,
	HALLOWEEN_WITCH_AGENT_2024_5	= 807,
	HALLOWEEN_WITCH_AGENT_2024_6	= 808,
	HALLOWEEN_WITCH_AGENT_2024_7	= 809,
	HALLOWEEN_WITCH_AGENT_2024_8	= 810,
	HALLOWEEN_WITCH_2024_MAIN	= 811,
	HALLOWEEN_HUNTER_2024_MAIN	= 812,
	HALLOWEEN_WITCH_2024_1	= 813,
	HALLOWEEN_WITCH_2024_2	= 814,
	HALLOWEEN_WITCH_2024_3	= 815,
	HALLOWEEN_WITCH_2024_4	= 816,
	HALLOWEEN_WITCH_2024_5	= 817,
	HALLOWEEN_HUNTER_2024_1	= 818,
	HALLOWEEN_HUNTER_2024_2	= 819,
	HALLOWEEN_HUNTER_2024_3	= 820,
	HALLOWEEN_HUNTER_2024_4	= 821,
	HALLOWEEN_HUNTER_2024_5	= 822,
	HALLOWEEN_CULT_2024_END	= 823,

	-- Финальный рейд-приключение «Возвращение Предтеч»
	ROP2025_START	= 830, ----- (830) NOTA BENE: Добавлены квесты и номера Tier15_31 - Tier15_36 в блок "-- АРМАДА МЕЧТЫ (...", выше . Следующий квест под этим сообщением будеть иметь номер 830 и далее...
	ROP2025_END		= 831,

	RoP2025HintMeter_1		= 832,
	RoP2025HintMeter_2		= 833,
	RoP2025HintMeter_3		= 834,
	RoP2025HintMeter_4		= 835,
	RoP2025HintMeter_5		= 836,
	RoP2025Hint_1	= 837,
	RoP2025Hint_2	= 838,
	RoP2025Hint_3	= 839,
	RoP2025Hint_4	= 840,
	RoP2025Hint_5	= 841,
	RoP2025Ammo_1	= 842,
	RoP2025Ammo_2	= 843,	
	RoP2025Ammo_3	= 844,	
	RoP2025Ammo_4	= 845,
	RoP2025Ammo_5	= 846,	
	RoP2025Ammo_6	= 847,	
	RoP2025Ammo_7	= 848,
	ROP2025_2_START_HIDDEN	= 849,	
	ROP2025_2_START	= 850,	

	-- SC-119788 Марафон «Квестики-Неделька». Лёгкие квесты для стимулирования ежедневного онлайна.
	
	-- «Папкина Неделька»
	WeekyKnickers_1		= 851, 
	WeekyKnickers_2		= 852,
	WeekyKnickers_3		= 853,
	WeekyKnickers_4		= 854,
	WeekyKnickers_5		= 855,
	WeekyKnickers_6		= 856,
	WeekyKnickers_7		= 857,
	WeekyKnickers_FIN	= 858,

	-- «Первые шаги»
	NewbieAffairs_1		= 859, 
	NewbieAffairs_2		= 860, 
	NewbieAffairs_3		= 861, 	

	-- «Нубова Неделька»
	NewbieKnickers_1	= 862, 
	NewbieKnickers_2	= 863,
	NewbieKnickers_3	= 864,
	NewbieKnickers_4	= 865,
	NewbieKnickers_5	= 866,
	NewbieKnickers_6	= 867,
	NewbieKnickers_7	= 868,
	NewbieKnickers_8	= 869,	
	NewbieKnickers_FIN	= 870,

	-- SC-120101 Марафон «Четвертак за тридцать». Сезонная линейка квестов для стимулирования ежедневного онлайна.
	
	A25FOR30_1			= 871, 
	A25FOR30_2			= 872, 
	A25FOR30_3			= 873, 
	A25FOR30_4			= 874, 
	A25FOR30_5			= 875, 
	A25FOR30_6			= 876, 
	A25FOR30_7			= 877, 
	A25FOR30_8			= 878, 
	A25FOR30_9			= 879, 
	A25FOR30_10			= 880, 
	A25FOR30_11			= 881,  
	A25FOR30_12			= 882,  
	A25FOR30_13			= 883, 
	A25FOR30_14			= 884, 
	A25FOR30PV1_FIN		= 885,
	A25FOR30_FINAL		= 886,

	-- Halloween cult 2025

	HALLOWEEN_WITCH_AGENT_2025_1	= 887,
	HALLOWEEN_WITCH_AGENT_2025_2	= 888,
	HALLOWEEN_WITCH_AGENT_2025_3	= 889,
	HALLOWEEN_WITCH_AGENT_2025_4	= 890,
	HALLOWEEN_WITCH_AGENT_2025_5	= 891,
	HALLOWEEN_WITCH_AGENT_2025_6	= 892,
	HALLOWEEN_WITCH_AGENT_2025_7	= 893,
	HALLOWEEN_WITCH_AGENT_2025_8	= 894,
	HALLOWEEN_WITCH_2025_MAIN	= 895,
	HALLOWEEN_HUNTER_2025_MAIN	= 896,
	HALLOWEEN_WITCH_2025_1	= 897,
	HALLOWEEN_WITCH_2025_2	= 898,
	HALLOWEEN_WITCH_2025_3	= 899,
	HALLOWEEN_WITCH_2025_4	= 900,
	HALLOWEEN_WITCH_2025_5	= 901,
	HALLOWEEN_HUNTER_2025_1	= 902,
	HALLOWEEN_HUNTER_2025_2	= 903,
	HALLOWEEN_HUNTER_2025_3	= 904,
	HALLOWEEN_HUNTER_2025_4	= 905,
	HALLOWEEN_HUNTER_2025_5	= 906,
	HALLOWEEN_CULT_2025_END	= 907,

	-- SC-120253 Тестовая линейка квестов QTEST_1 (2, 3)
	
	QTEST_1			= 908, 
	QTEST_2			= 909, 
	QTEST_3			= 910,

	--- SC-120496 Марафон «Четвертак за тридцать» SUM#1. Повторение марафонов в BP24 / SUM26

	B25FOR30PV1_FIN		= 911,	

}

-- BP_DAILY_01, BP_DAILY_02...
for n = 1, 30 do
	QuestId[string.format("BP_DAILY_%02d", n)] = 614 + n
end