
Titles = {}

-- ВНИМАНИЕ! Нельзя менять номера и порядок титулов или комментировать/удалять их. Добавлять новые титулы можно только в конец.
-- 127 is the limit for now
PlayerTitleId =
{
    NO_TITLE            = 0,

    DEVELOPER           = 1,
    TESTER              = 2,
    MERCENARY           = 3,
    SPACE_WOLF          = 4,
    ELITE_PILOT         = 5,
    BATTLE_MASTER       = 6,
    DAMAGE_DEALER       = 7,
    BERSERK             = 8,
    KILLING_BLOWS       = 9,
    SHIP_COLLECTOR      = 10,
    SPACE_INVADER       = 11,
    SC_VETERAN          = 12,
    CORSAIR             = 13,
    DESPERADO           = 14,
    PIRATE_BARON        = 15,
    KD_BADDIE           = 16,
    KD_BIOLOGIST        = 17,
    KD_FRESHMAN         = 18,
    KD_SENIOR           = 19,
    KD_GRIND            = 20,
    KD_META             = 21,
    WITCH_HUNTER        = 22,
    OBT_PARTICIPANT     = 23,
    NY_COLD_BLOOD       = 24,
    DEV_HELPER          = 25,
    ULTIMATE_PLAYER     = 26,
    CHILD_PROTECTOR     = 27,
    CHAMP_WINNER        = 28,
    TRUE_TEACHER        = 29,
    ALIENATED           = 30,
    RATED_TOP1          = 31,
    RATED_TOP2          = 32,
    RATED_TOP3          = 33,
    IMMORTAL            = 34,
    RATING_RANK1        = 35,
    RATING_RANK2        = 36,
    RATING_RANK3        = 37,
    CONQUEROR           = 38,
    VANQUISHER          = 39,
    NY_META_TITLE       = 40,
    LEAGUE_1PLACE       = 41,
    LEAGUE_2PLACE       = 42,
    LEAGUE_3PLACE       = 43,
    LEAGUE_TOPN         = 44,
    LEAGUE_PLAYED       = 45,
    BARON_ELITE         = 46,
    CYBERLORD           = 47,
    PACIFIST            = 48,
    BARON_PET           = 49,
    XENO_PILOT          = 50,
    SANTA_HELPER        = 51,
    CROSSOUT_BETATEST   = 52,
    FORERUNNER          = 53,
    ADVISOR             = 54,
    GUARDIAN            = 55,
    STRATEGIST          = 56,
    TRAIN               = 57,
    PROMISING_ONE       = 58,
    EVOLUTION_MASTER    = 59,
    SUPER_TESTER        = 60,
    TOP100              = 61,
    DIRECTOR            = 62,
    TOURNAMENT_1        = 63,
    TOURNAMENT_2        = 64,
    TOURNAMENT_3        = 65,
    LEVEL_15            = 66,
    LEVEL_20            = 67,
    LEVEL_25            = 68,
    THARGA              = 69,
    CS1                 = 70,
    CS2                 = 71,
    CS3                 = 72,
    CS4                 = 73,
    CS5                 = 74,
    FOOL1               = 75,
    FOOL2               = 76,
    FOOL3               = 77,
    FOOL4               = 78,
    FOOL5               = 79,
    FOOL6               = 80,
    UNK_PERSON          = 81,
    MICHMAN             = 82,
    FOOTBALL            = 83,
    HUNGER_GAMES        = 84,
    BATTLE_PASS1        = 85,
    BATTLE_PASS2        = 86,
    BATTLE_PASS3        = 87,
    BATTLE_PASS4        = 88,
    BATTLE_PASS5        = 89,
    BATTLE_PASS6        = 90,
    KILLER              = 91,
    DEATH               = 92,
    MAGNIFICENT         = 93,
    INFORMATOR          = 94,
    BEST_OF_THE_BEST    = 95,
    GENERAL             = 96,
    ADMIRAL             = 97,
    MAJOR               = 98,
    CUSTODIAN           = 99,
    NY2019              = 100,
	HELPER_QUEEN		= 101,
	HELPER_CUSTODIAN	= 102,
	HELPER_OVERPETTER	= 103,
	HELPER_DOCTOR		= 104,
	HELPER_PRECURSOR	= 105,
	HELPER_LAMER		= 106,
	HELPER_SWEETHEART	= 107,
	HELPER_ENGINEER		= 108,
	HELPER_HIIRAGI		= 109,
	HELPER_BRAHMAN		= 110,
	HELPER_HURMAN		= 111,

	HELPER_PUNISHER		= 112,
	HELPER_MEMELORD		= 113,
	HELPER_ANNOYING_BAGUETTE = 114,
	HELPER_YEETMASTER	= 115,
	HELPER_BRAINSTORMER	= 116,

	TURNAMENT_SPIRIT	= 117,
	TURNAMENT_SNOWMAN	= 118,
	TURNAMENT_NY_KNIFE	= 119,
	TURNAMENT_HOLIDAYMASTER	= 120,
	TURNAMENT_WARLIKE	= 121,
	TURNAMENT_EXPLOSIVE	= 122,
	
	GRANIT				= 123,
	FIRST_GRADE			= 124,
	DAREDEVIL			= 125,
	FLASH				= 126,
	
    BATTLE_PASS_20_1    = 127,
    BATTLE_PASS_20_2    = 128,
	
	HALLOWEEN_2020		= 129,
	NEW_2021_YEAR		= 130,
	
	TURNAMENT_BESTGIFT	= 131,
	TURNAMENT_SNOWBALL	= 132,
	TURNAMENT_WARMSWEATER	= 133,
	TURNAMENT_TWINKLE	= 134,
	
	BATTLE_PASS_NY21_1	= 135,
	BATTLE_PASS_NY21_2	= 136,
	
	UNIVERCEVOICE		= 137,
	
	HOPEUNIVERSE		= 138,
	THREATFIGHTER		= 139,
	
	STARCAPTAIN			= 140,
	FIELDMARSHAL		= 141,
	GALLEON				= 142,
	JUNG				= 143,
	MORIARTY			= 144,
	LORDWORLD			= 145,
	
	SPACETRUCK			= 146,
	
	BATTLE_PASS_SUM21_1	= 147,
	BATTLE_PASS_SUM21_2	= 148,
	
	TURNAMENT_CHILLER	= 149,
	TURNAMENT_DJ		= 150,
	TURNAMENT_PARTYANIMAL	= 151,
	TURNAMENT_CHARMER	= 152,
	TURNAMENT_LOTS		= 153,
	
	EXECUTOR			= 154,
	EXECUTIONER			= 155,
	GRIM_REAPER			= 156,
	MADMAN				= 157,
	SOUL_OF_WRATH		= 158,
	INESCAPABLE_ROCK	= 159,
	WARRIOR				= 160,
	COMBAT_MASTER		= 161,
	FLAME_OF_REVENGE	= 162,
	FILIBUSTER			= 163,
	ANARCHIST			= 164,
	JOLLY_ROGER			= 165,
	PRIVATEER			= 166,
	GENTLEMAN_OF_FORTUNE = 167,
	SPACE_THUNDERSTORM	= 168,
	
	PUMPKIN 			= 169,
	SCYTHEMAN			= 170,
	
	ANNIVERSARY_10Y_1	= 171,
	ANNIVERSARY_10Y_2	= 172,
	ANNIVERSARY_10Y_3	= 173,
	ANNIVERSARY_10Y_4	= 174,
	ANNIVERSARY_10Y_5	= 175,
	
	TREASURE_HUNTER		= 176,
	
	BATTLE_PASS_NY22_1	= 177,
	BATTLE_PASS_NY22_2	= 178,
	
	AI					= 179,
	PYROMANIAC			= 180,
	WIZARD				= 181,
	SMARTIE				= 182,
	STAR				= 183,
	ALPHACRYS			= 184,
	
	BATTLE_PASS_SPR22_1	= 185,
	BATTLE_PASS_SPR22_2	= 186,
	
	COOKIE_PILOT		= 187,
	
	HERO				= 188,
	REAL_HERO			= 189,
	
	BATTLE_PASS_SUM22_1	= 190,
	BATTLE_PASS_SUM22_2	= 191,
	
	TRUTHSEEKER			= 192,
	
	ABSOLUTE_HERO		= 193,
	
	TOUR_1				= 194,
	TOUR_2				= 195,
	TOUR_3				= 196,
	TOUR_4				= 197,
	TOUR_5				= 198,
	
	BLACKRR_1			= 199,
	BLACKRR_2			= 200,
	BLACKRR_3			= 201,
	
	HALLOWEEN_2022		= 202,
	
	BATTLE_PASS_AUT22_1	= 203,
	BATTLE_PASS_AUT22_2	= 204,
	
	HALLOWEEN_CULTIST	= 205,
	
	HOLIDAY_1			= 206,
	HOLIDAY_2			= 207,
	HOLIDAY_3			= 208,
	HOLIDAY_4			= 209,
	HOLIDAY_5			= 210,
	HOLIDAY_6			= 211,
	HOLIDAY_7			= 212,
	HOLIDAY_8			= 213,
	HOLIDAY_9			= 214,
	HOLIDAY_10			= 215,
	HOLIDAY_11			= 216,
	
	HERO_1				= 217,
	HERO_2				= 218,
	HERO_3				= 219,
	HERO_4				= 220,
	HERO_5				= 221,
	HERO_6				= 222,
	HERO_7				= 223,
	HERO_8				= 224,
	HERO_9				= 225,
	HERO_10				= 226,
	
	NEW_2022_YEAR		= 227,
	BATTLE_PASS_NY23_1  = 228,
	BATTLE_PASS_NY23_2  = 229,
	
	DRAGONFLY_1  		= 230,
	DRAGONFLY_2  		= 231,
	DRAGONFLY_3  		= 232,
	BATTLE_PASS_SPR23_1  = 233,
	BATTLE_PASS_SPR23_2  = 234,
	WASP_1  			= 235,
	WASP_2  			= 236,
	WASP_3  			= 237,
	TEMPLE_1  			= 238,
	TEMPLE_2  			= 239,
	TEMPLE_3  			= 240,
	MAZE_1  			= 241,
	MAZE_2  			= 242,
	MAZE_3  			= 243,
	PAPER_1  			= 244,
	PAPER_2  			= 245,
	PAPER_3  			= 246,
	CYNING_1  			= 247,
	MJOLNIR_1  			= 248,
	KRAKEN_1  			= 249,
	PEREGRINE_1			= 250,
	JAGUAR_1  			= 251,
	OCTOPUS_1  			= 252,
	CALTROP_1  			= 253,
	SAWONE_1  			= 254,
	RONIN_1  			= 255,
	BRAINS_1  			= 256,
	BRAINS_2  			= 257,
	BRAINS_3  			= 258,
	APRIL23_EGG			= 259,
	ENCOUNTER_1  		= 260,
	ENCOUNTER_2  		= 261,
	ENCOUNTER_3  		= 262,
	SUPPORT_1  			= 263,
	SUPPORT_2  			= 264,
	SUPPORT_3  			= 265,
	CORNER_1  			= 266,
	CORNER_2  			= 267,
	CORNER_3  			= 268,
	CORNER_4  			= 269,
	CORNER_5  			= 270,
	CORNER_6  			= 271,
	CORNER_7  			= 272,
	CORNER_8  			= 273,
	CORNER_9  			= 274,
	BATTLE_PASS_SUM23_1  = 275,
	BATTLE_PASS_SUM23_2  = 276,
	GALACTIC_SURFER = 277,
	BATTLE_PASS_AUT23_1  = 278,
	BATTLE_PASS_AUT23_2  = 279,
	HALLOWEEN_2023		= 280,
	COSMIC_HORROR		= 281,
	BATTLE_PASS_NY24_1  = 282,
	BATTLE_PASS_NY24_2  = 283,
	EVENT_PASS_NY24_3	= 284,
	VALENTINE_NY24_4	= 285,	
	BATTLE_PASS_SPR24_1  = 286,
	BATTLE_PASS_SPR24_2  = 287,
	EVENT_PASS_SPR24_3	= 288,
	COZY_CORNER_1		= 289,
	COZY_CORNER_2		= 290,
	COZY_CORNER_3		= 291,
	COZY_CORNER_4		= 292,
	COZY_CORNER_5		= 293,
	COZY_CORNER_6		= 294,
	BATTLE_PASS_SUM24_1  = 295,
	BATTLE_PASS_SUM24_2  = 296,
	EVENT_PASS_SUM24_3	= 297,
	TOURNAMENT_HELLRIDER  = 298,
	TOURNAMENT_TOXICVOMIT	= 299,
    OWFEST_24	= 300,
	TIN10	= 301,
	BATTLE_PASS_AUT24_1  = 302,
	BATTLE_PASS_AUT24_2  = 303,
	EVENT_PASS_AUT24_3	= 304,
	HALLOWEEN_2024		= 305,
	BATTLE_PASS_NY25_1  = 306,
	BATTLE_PASS_NY25_2  = 307,
	EVENT_PASS_NY25_3	= 308,
	NEW_2025_YEAR		= 309,
	TOURNAMENT_2025_CENSORED = 310,
	EVENT_PASS_NY25_4	= 311,
	BATTLE_PASS_SPR25_1  = 312,
	BATTLE_PASS_SPR25_2  = 313,
	EVENT_PASS_SPR25_3	= 314,
	EGGROLLER2025  = 315,
	TOURNAMENT_2025_NEKOPARA = 316,
	TOURNAMENT_2025_SCP = 317,
	TOURNAMENT_2025_RAIDEN = 318,
	TOURNAMENT_2025_FALLING = 319,
	BATTLE_PASS_SUM25_1  = 320,
	BATTLE_PASS_SUM25_2  = 321,
	EVENT_PASS_SUM25_3	= 322,
	HIDDEN_SEEKER_2025  = 323,
	ROP2025_CONTEMPLATOR	= 324,
	ROP2025_WITNESS  = 325,
	TIN11	= 326,
	BATTLE_PASS_AUT25_1  = 327,
	BATTLE_PASS_AUT25_2  = 328,
	EVENT_PASS_AUT25_3	= 329,
	HALLOWEEN_2025		= 330,	
	TOURNAMENT_AUT2025_ELITE = 331,
	TOURNAMENT_AUT2025_CHEATER = 332,
	BATTLE_PASS_NY26_1  = 333,
	BATTLE_PASS_NY26_2  = 334,
	EVENT_PASS_NY26_3	= 335,	
	NEW_2026_YEAR		= 336,
	EVENT_PASS_NY26_4	= 337,
	BATTLE_PASS_SPR26_1  = 338,
	BATTLE_PASS_SPR26_2  = 339,	
	EVENT_PASS_SPR26_3	= 340,
	BATTLE_PASS_SUM26_1  = 341,
	BATTLE_PASS_SUM26_2  = 342,	
	EVENT_PASS_SUM26_3	= 343,		

}

-- Поле name - текстовое имя тайтла (экспортится в xml и используется в админке), скажите мне (Коршунов Д.) если захотите убрать его

Titles[ PlayerTitleId.DEVELOPER ] =
{
    name = "Developer",
    hiden = true,
}

Titles[ PlayerTitleId.TESTER ] =
{
    name = "Tester",
    hiden = true,
}

Titles[ PlayerTitleId.MERCENARY ] =
{
    name = "Mercenary",
    hiden = true,
}

Titles[ PlayerTitleId.SPACE_WOLF ] =
{
    name = "SpaceWolf",
    hiden = true,
}

Titles[ PlayerTitleId.ELITE_PILOT ] =
{
    name = "ElitePilot",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_MASTER ] =
{
    name = "BattleMaster",
}

Titles[ PlayerTitleId.DAMAGE_DEALER ] =
{
    name = "DamageDealer",
}

Titles[ PlayerTitleId.BERSERK ] =
{
    name = "Berserk",
}

Titles[ PlayerTitleId.KILLING_BLOWS ] =
{
    name = "KillingBlows",
}

Titles[ PlayerTitleId.SHIP_COLLECTOR ] =
{
    name = "ShipCollector",
}

Titles[ PlayerTitleId.SPACE_INVADER ] =
{
    name = "SpaceInvader",
}

Titles[ PlayerTitleId.SC_VETERAN ] =
{
    name = "ScVeteran",
    hiden = true,
}

Titles[ PlayerTitleId.CORSAIR ] =
{
    name = "Corsair",
    hiden = true,
}

Titles[ PlayerTitleId.DESPERADO ] =
{
    name = "Desperado",
    hiden = true,
}

Titles[ PlayerTitleId.PIRATE_BARON ] =
{
    name = "PirateBaron",
    hiden = true,
}

Titles[ PlayerTitleId.KD_BADDIE ] =
{
    name = "KdBaddie",
}

Titles[ PlayerTitleId.KD_BIOLOGIST ] =
{
    name = "KdBiologist",
}

Titles[ PlayerTitleId.KD_FRESHMAN ] =
{
    name = "KdFreshman",
}

Titles[ PlayerTitleId.KD_SENIOR ] =
{
    name = "KdSenior",
}

Titles[ PlayerTitleId.KD_GRIND ] =
{
    name = "KdGrind",
}

-- звание за мета достижение за 1ое сентября
Titles[ PlayerTitleId.KD_META ] =
{
    name = "KdMeta",
}

Titles[ PlayerTitleId.WITCH_HUNTER ] =
{
    name = "WitchHunter",
}

Titles[ PlayerTitleId.OBT_PARTICIPANT ] =
{
    name = "ObtParticipant",
    hiden = true,
}

-- звание за выполнение 9 НГ квестов.
Titles[ PlayerTitleId.NY_COLD_BLOOD ] =
{
    name = "ColdBlood",
}

Titles[ PlayerTitleId.DEV_HELPER ] =
{
    name = "DevHelper",
    hiden = true,
}

Titles[ PlayerTitleId.ULTIMATE_PLAYER ] =
{
    name = "UltimatePlayer",
    hiden = true,
}


Titles[ PlayerTitleId.CHILD_PROTECTOR ] =
{
    name = "ChildProtector",
}

Titles[ PlayerTitleId.CHAMP_WINNER ] =
{
    name = "ChampionshipWinner",
    hiden = true,
    duration = 168, 
}

Titles[ PlayerTitleId.TRUE_TEACHER ] =
{
    name = "TrueTeacher",
}

Titles[ PlayerTitleId.ALIENATED ] =
{
    name = "AlienKiller",
    hiden = true,
}
--
Titles[ PlayerTitleId.RATED_TOP1 ] =
{
    name = "RatedTop1",
    hiden = true,
    duration = 168, 
}

Titles[ PlayerTitleId.RATED_TOP2 ] =
{
    name = "RatedTop2",
    hiden = true,
    duration = 168, 
}

Titles[ PlayerTitleId.RATED_TOP3 ] =
{
    name = "RatedTop3",
    hiden = true,
    duration = 168, 
}

-- звание за прохождение спецоперации с осквернителем без смертей
Titles[ PlayerTitleId.IMMORTAL ] =
{
    name = "Immortal",
}

Titles[ PlayerTitleId.RATING_RANK1 ] =
{
    name = "RatingRank1",
    hiden = true,
}

Titles[ PlayerTitleId.RATING_RANK2 ] =
{
    name = "RatingRank2",
    hiden = true,
}

Titles[ PlayerTitleId.RATING_RANK3 ] =
{
    name = "RatingRank3",
    hiden = true,
}

Titles[ PlayerTitleId.CONQUEROR ] =
{
    name = "Conqueror",
    hiden = true,
}

Titles[ PlayerTitleId.VANQUISHER ] =
{
    name = "Vanquisher",
    hiden = true,
}

-- звание за выполнение НГ цепочки.
Titles[ PlayerTitleId.NY_META_TITLE ] =
{
    name = "NY_META_TITLE",
}

-- Leagues titles

Titles[ PlayerTitleId.LEAGUE_1PLACE ] =
{
    name = "LEAGUE_1PLACE",
}

Titles[ PlayerTitleId.LEAGUE_2PLACE ] =
{
    name = "LEAGUE_2PLACE",
}

Titles[ PlayerTitleId.LEAGUE_3PLACE ] =
{
    name = "LEAGUE_3PLACE",
}

Titles[ PlayerTitleId.LEAGUE_TOPN ] =
{
    name = "LEAGUE_TOPN",
}

Titles[ PlayerTitleId.LEAGUE_PLAYED ] =
{
    name = "LEAGUE_PLAYED",
    hiden = true,    
}

Titles[ PlayerTitleId.BARON_ELITE ] =
{
    name = "BARON_ELITE",
}

Titles[ PlayerTitleId.CYBERLORD ] =
{
    name = "CYBERLORD",
}

Titles[ PlayerTitleId.PACIFIST ] =
{
    name = "PACIFIST",
}

Titles[ PlayerTitleId.BARON_PET ] =
{
    name = "BARON_PET",
}

Titles[ PlayerTitleId.XENO_PILOT ] =
{
    name = "XENO_PILOT",
}

Titles[ PlayerTitleId.SANTA_HELPER ] =
{
    name = "SANTA_HELPER",
}

Titles[ PlayerTitleId.CROSSOUT_BETATEST ] =
{
    name = "CROSSOUT_BETATEST",
    hiden = true,
}

-- Титулы по дате регистрации (Др SC 5 лет)
Titles[ PlayerTitleId.FORERUNNER ] =
{
    name = "FORERUNNER",
    hiden = true,
}

Titles[ PlayerTitleId.ADVISOR ] =
{
    name = "ADVISOR",
    hiden = true,
}

Titles[ PlayerTitleId.GUARDIAN ] =
{
    name = "GUARDIAN",
    hiden = true,
}

Titles[ PlayerTitleId.STRATEGIST ] =
{
    name = "STRATEGIST",
    hiden = true,
}

Titles[ PlayerTitleId.TRAIN ] =
{
    name = "TRAIN",
    hiden = true,
}

Titles[ PlayerTitleId.PROMISING_ONE ] =
{
    name = "PROMISING_ONE",
    hiden = true,
}

Titles[ PlayerTitleId.EVOLUTION_MASTER ] = 
{
    name = "EVOLUTION_MASTER",
}

Titles[ PlayerTitleId.SUPER_TESTER ] =
{
    name = "SUPER_TESTER",
    hiden = true,
}


Titles[ PlayerTitleId.TOP100 ] =
{
    name = "Top100",
    hiden = true,
}

Titles[ PlayerTitleId.DIRECTOR ] =
{
    name = "Director",
    hiden = true,
}

Titles[ PlayerTitleId.TOURNAMENT_1 ] =
{
    name = "Tournament1",
    hiden = true,
}

Titles[ PlayerTitleId.TOURNAMENT_2 ] =
{
    name = "Tournament2",
    hiden = true,
}

Titles[ PlayerTitleId.TOURNAMENT_3 ] =
{
    name = "Tournament3",
    hiden = true,
}

Titles[ PlayerTitleId.LEVEL_15 ] =
{
    name = "Level15",
}

Titles[ PlayerTitleId.LEVEL_20 ] =
{
    name = "Level20",
}

Titles[ PlayerTitleId.LEVEL_25 ] =
{
    name = "Level25",
}

Titles[ PlayerTitleId.THARGA ] =
{
    name = "Tharga",
    hiden = true,
}

Titles[ PlayerTitleId.CS1 ] =
{
    name = "Cybersport1",
    hiden = true,
}

Titles[ PlayerTitleId.CS2 ] =
{
    name = "Cybersport2",
    hiden = true,
}

Titles[ PlayerTitleId.CS3 ] =
{
    name = "Cybersport3",
    hiden = true,
}

Titles[ PlayerTitleId.CS4 ] =
{
    name = "Cybersport4",
    hiden = true,
}

Titles[ PlayerTitleId.CS5 ] =
{
    name = "Cybersport5",
    hiden = true,
}

Titles[ PlayerTitleId.FOOL1 ] =
{
    name = "AprilFool1",
    hiden = true,
}

Titles[ PlayerTitleId.FOOL2 ] =
{
    name = "AprilFool2",
    hiden = true,
}

Titles[ PlayerTitleId.FOOL3 ] =
{
    name = "AprilFool3",
    hiden = true,
}

Titles[ PlayerTitleId.FOOL4 ] =
{
    name = "AprilFool4",
    hiden = true,
}

Titles[ PlayerTitleId.FOOL5 ] =
{
    name = "AprilFool5",
    hiden = true,
}

Titles[ PlayerTitleId.FOOL6 ] =
{
    name = "AprilFool6",
    hiden = true,
}

Titles[ PlayerTitleId.UNK_PERSON ] =
{
    name = "UnknownPerson",
    hiden = true,
}

Titles[ PlayerTitleId.MICHMAN ] =
{
    name = "Michman",
    hiden = true,
}

Titles[ PlayerTitleId.FOOTBALL ] =
{
    name = "Football",
}

Titles[ PlayerTitleId.HUNGER_GAMES ] =
{
    name = "HungerGames",
}

Titles[ PlayerTitleId.BATTLE_PASS1 ] =
{
    name = "BattlePass1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS2 ] =
{
    name = "BattlePass2",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS3 ] =
{
    name = "BattlePass3",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS4 ] =
{
    name = "BattlePass4",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS5 ] =
{
    name = "BattlePass5",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS6 ] =
{
    name = "BattlePass6",
    hiden = true,
}

Titles[ PlayerTitleId.KILLER ] =
{
    name = "Killer",
    hiden = true,
}

Titles[ PlayerTitleId.DEATH ] =
{
    name = "Death",
    hiden = true,
}

Titles[ PlayerTitleId.MAGNIFICENT ] =
{
    name = "Magnificent",
    hiden = true,
}

-- SC-112182
Titles[ PlayerTitleId.INFORMATOR ] =
{
    name = "Informator",
    hiden = true,
}

-- SC-112293
Titles[ PlayerTitleId.BEST_OF_THE_BEST ] =
{
    name = "Best_of_the_best",
    hiden = true,
}

-- SC-112420
Titles[ PlayerTitleId.GENERAL ] =
{
    name = "General",
    hiden = true,
}

Titles[ PlayerTitleId.ADMIRAL ] =
{
    name = "Admiral",
    hiden = true,
}

Titles[ PlayerTitleId.MAJOR ] =
{
    name = "Major",
    hiden = true,
}

-- SC-112471 DLC Кустодиан. Уникальное звание
Titles[ PlayerTitleId.CUSTODIAN ] =
{
    name = "Custodian",
    hiden = true,
}

Titles[ PlayerTitleId.NY2019 ] =
{
    name = "Ny2019",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_QUEEN ] =
{
    name = "HELPER_QUEEN",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_CUSTODIAN ] =
{
    name = "HELPER_CUSTODIAN",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_OVERPETTER ] =
{
    name = "HELPER_OVERPETTER",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_DOCTOR ] =
{
    name = "HELPER_DOCTOR",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_PRECURSOR ] =
{
    name = "HELPER_PRECURSOR",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_LAMER ] =
{
    name = "HELPER_LAMER",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_SWEETHEART ] =
{
    name = "HELPER_SWEETHEART",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_ENGINEER ] =
{
    name = "HELPER_ENGINEER",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_HIIRAGI ] =
{
    name = "HELPER_HIIRAGI",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_BRAHMAN ] =
{
    name = "HELPER_BRAHMAN",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_HURMAN ] =
{
    name = "HELPER_HURMAN",
    hiden = true,
}


Titles[ PlayerTitleId.HELPER_PUNISHER ] =
{
    name = "HELPER_PUNISHER",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_MEMELORD ] =
{
    name = "HELPER_MEMELORD",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_ANNOYING_BAGUETTE ] =
{
    name = "HELPER_ANNOYING_BAGUETTE",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_YEETMASTER ] =
{
    name = "HELPER_YEETMASTER",
    hiden = true,
}

Titles[ PlayerTitleId.HELPER_BRAINSTORMER ] =
{
    name = "HELPER_BRAINSTORMER",
    hiden = true,
}


Titles[ PlayerTitleId.TURNAMENT_SPIRIT ] =
{
    name = "TURNAMENT_SPIRIT",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_SNOWMAN ] =
{
    name = "TURNAMENT_SNOWMAN",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_NY_KNIFE ] =
{
    name = "TURNAMENT_NY_KNIFE",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_HOLIDAYMASTER ] =
{
    name = "TURNAMENT_HOLIDAYMASTER",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_WARLIKE ] =
{
    name = "TURNAMENT_WARLIKE",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_EXPLOSIVE ] =
{
    name = "TURNAMENT_EXPLOSIVE",
    hiden = true,
}


Titles[ PlayerTitleId.GRANIT ] =
{
    name = "GRANIT",
    hiden = true,
}

Titles[ PlayerTitleId.FIRST_GRADE ] =
{
    name = "FIRST_GRADE",
    hiden = true,
}

Titles[ PlayerTitleId.DAREDEVIL ] =
{
    name = "DAREDEVIL",
    hiden = true,
}

Titles[ PlayerTitleId.FLASH ] =
{
    name = "FLASH",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_20_1 ] =
{
    name = "BattlePass201",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_20_2 ] =
{
    name = "BattlePass202",
    hiden = true,
}

Titles[ PlayerTitleId.HALLOWEEN_2020 ] =
{
    name = "Halloween_2020",
    hiden = true,
}

Titles[ PlayerTitleId.NEW_2021_YEAR ] =
{
    name = "New_2021_Year",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_BESTGIFT ] =
{
    name = "Bestgift",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_SNOWBALL ] =
{
    name = "Snowball",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_WARMSWEATER ] =
{
    name = "WarmSweater",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_TWINKLE ] =
{
    name = "Twinkle",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY21_1 ] =
{
    name = "Battle_Pass_ny21_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY21_2 ] =
{
    name = "Battle_Pass_ny21_2",
    hiden = true,
}

Titles[ PlayerTitleId.UNIVERCEVOICE ] =
{
    name = "UniverseVoice",
    hiden = true,
}

Titles[ PlayerTitleId.HOPEUNIVERSE ] =
{
    name = "HopeUniverse",
    hiden = true,
}

Titles[ PlayerTitleId.THREATFIGHTER ] =
{
    name = "ThreatFighter",
    hiden = true,
}

Titles[ PlayerTitleId.STARCAPTAIN ] =
{
    name = "StarCaptain",
    hiden = true,
}

Titles[ PlayerTitleId.FIELDMARSHAL ] =
{
    name = "FieldMarshal",
    hiden = true,
}

Titles[ PlayerTitleId.GALLEON ] =
{
    name = "Galleon",
    hiden = true,
}

Titles[ PlayerTitleId.JUNG ] =
{
    name = "Jung",
    hiden = true,
}

Titles[ PlayerTitleId.MORIARTY ] =
{
    name = "Moriarty",
    hiden = true,
}

Titles[ PlayerTitleId.LORDWORLD ] =
{
    name = "LordWorld",
    hiden = true,
}

Titles[ PlayerTitleId.SPACETRUCK ] =
{
    name = "Spacetruck",
    hiden = true,
}

Titles[ PlayerTitleId.COOKIE_PILOT ] =
{
    name = "Cookie_pilot",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SUM21_1 ] =
{
    name = "Battle_Pass_sum21_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SUM21_2 ] =
{
    name = "Battle_Pass_sum21_2",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_CHILLER ] =
{
    name = "TURNAMENT_CHILLER",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_DJ ] =
{
    name = "TURNAMENT_DJ",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_PARTYANIMAL ] =
{
    name = "TURNAMENT_PARTYANIMAL",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_CHARMER ] =
{
    name = "TURNAMENT_CHARMER",
    hiden = true,
}

Titles[ PlayerTitleId.TURNAMENT_LOTS ] =
{
    name = "TURNAMENT_LOTS",
    hiden = true,
}

Titles[ PlayerTitleId.EXECUTOR ] =
{
    name = "EXECUTOR",
    hiden = true,
}

Titles[ PlayerTitleId.EXECUTIONER ] =
{
    name = "EXECUTIONER",
    hiden = true,
}

Titles[ PlayerTitleId.GRIM_REAPER ] =
{
    name = "GRIM_REAPER",
    hiden = true,
}

Titles[ PlayerTitleId.MADMAN ] =
{
    name = "MADMAN",
    hiden = true,
}

Titles[ PlayerTitleId.SOUL_OF_WRATH ] =
{
    name = "SOUL_OF_WRATH",
    hiden = true,
}

Titles[ PlayerTitleId.INESCAPABLE_ROCK ] =
{
    name = "INESCAPABLE_ROCK",
    hiden = true,
}

Titles[ PlayerTitleId.WARRIOR ] =
{
    name = "WARRIOR",
    hiden = true,
}

Titles[ PlayerTitleId.COMBAT_MASTER ] =
{
    name = "COMBAT_MASTER",
    hiden = true,
}

Titles[ PlayerTitleId.FLAME_OF_REVENGE ] =
{
    name = "FLAME_OF_REVENGE",
    hiden = true,
}

Titles[ PlayerTitleId.FILIBUSTER ] =
{
    name = "FILIBUSTER",
    hiden = true,
}

Titles[ PlayerTitleId.ANARCHIST ] =
{
    name = "ANARCHIST",
    hiden = true,
}

Titles[ PlayerTitleId.JOLLY_ROGER ] =
{
    name = "JOLLY_ROGER",
    hiden = true,
}

Titles[ PlayerTitleId.PRIVATEER ] =
{
    name = "PRIVATEER",
    hiden = true,
}

Titles[ PlayerTitleId.GENTLEMAN_OF_FORTUNE ] =
{
    name = "GENTLEMAN_OF_FORTUNE",
    hiden = true,
}

Titles[ PlayerTitleId.SPACE_THUNDERSTORM ] =
{
    name = "SPACE_THUNDERSTORM",
    hiden = true,
}

Titles[ PlayerTitleId.PUMPKIN ] =
{
    name = "PUMPKIN",
    hiden = true,
}

Titles[ PlayerTitleId.SCYTHEMAN ] =
{
    name = "SCYTHEMAN",
    hiden = true,
}

Titles[ PlayerTitleId.ANNIVERSARY_10Y_1 ] =
{
    name = "ANNIVERSARY_10Y_1",
    hiden = true,
}
Titles[ PlayerTitleId.ANNIVERSARY_10Y_2 ] =
{
    name = "ANNIVERSARY_10Y_2",
    hiden = true,
}
Titles[ PlayerTitleId.ANNIVERSARY_10Y_3 ] =
{
    name = "ANNIVERSARY_10Y_3",
    hiden = true,
}
Titles[ PlayerTitleId.ANNIVERSARY_10Y_4 ] =
{
    name = "ANNIVERSARY_10Y_4",
    hiden = true,
}
Titles[ PlayerTitleId.ANNIVERSARY_10Y_5 ] =
{
    name = "ANNIVERSARY_10Y_5",
    hiden = true,
}

Titles[ PlayerTitleId.TREASURE_HUNTER ] =
{
    name = "TREASURE_HUNTER",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY22_1 ] =
{
    name = "Battle_Pass_ny22_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY22_2 ] =
{
    name = "Battle_Pass_ny22_2",
    hiden = true,
}

Titles[ PlayerTitleId.AI ] =
{
    name = "AI",
    hiden = true,
}

Titles[ PlayerTitleId.PYROMANIAC ] =
{
    name = "PYROMANIAC",
    hiden = true,
}

Titles[ PlayerTitleId.WIZARD ] =
{
    name = "WIZARD",
    hiden = true,
}

Titles[ PlayerTitleId.SMARTIE ] =
{
    name = "SMARTIE",
    hiden = true,
}

Titles[ PlayerTitleId.STAR ] =
{
    name = "STAR",
    hiden = true,
}

Titles[ PlayerTitleId.ALPHACRYS ] =
{
    name = "ALPHACRYS",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SPR22_1 ] =
{
    name = "Battle_Pass_spr22_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SPR22_2 ] =
{
    name = "Battle_Pass_spr22_2",
    hiden = true,
}

Titles[ PlayerTitleId.HERO ] =
{
    name = "HERO",
    hiden = true,
}

Titles[ PlayerTitleId.REAL_HERO ] =
{
    name = "REAL_HERO",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SUM22_1 ] =
{
    name = "Battle_Pass_sum22_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SUM22_2 ] =
{
    name = "Battle_Pass_sum22_2",
    hiden = true,
}

Titles[ PlayerTitleId.TRUTHSEEKER ] =
{
    name = "TRUTHSEEKER",
    hiden = true,
}

Titles[ PlayerTitleId.ABSOLUTE_HERO ] =
{
    name = "ABSOLUTE_HERO",
    hiden = true,
}

Titles[ PlayerTitleId.TOUR_1 ] =
{
    name = "TOUR_1",
    hiden = true,
}
Titles[ PlayerTitleId.TOUR_2 ] =
{
    name = "TOUR_2",
    hiden = true,
}
Titles[ PlayerTitleId.TOUR_3 ] =
{
    name = "TOUR_3",
    hiden = true,
}
Titles[ PlayerTitleId.TOUR_4 ] =
{
    name = "TOUR_4",
    hiden = true,
}
Titles[ PlayerTitleId.TOUR_5 ] =
{
    name = "TOUR_5",
    hiden = true,
}

Titles[ PlayerTitleId.BLACKRR_1 ] =
{
    name = "BLACKRR_1",
    hiden = true,
}
Titles[ PlayerTitleId.BLACKRR_2 ] =
{
    name = "BLACKRR_2",
    hiden = true,
}
Titles[ PlayerTitleId.BLACKRR_3 ] =
{
    name = "BLACKRR_3",
    hiden = true,
}

Titles[ PlayerTitleId.HALLOWEEN_2022 ] =
{
    name = "HALLOWEEN_2022",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_AUT22_1 ] =
{
    name = "Battle_Pass_aut22_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_AUT22_2 ] =
{
    name = "Battle_Pass_aut22_2",
    hiden = true,
}

Titles[ PlayerTitleId.HALLOWEEN_CULTIST ] =
{
    name = "HALLOWEEN_CULTIST",
    hiden = true,
    duration = 336, 
}

Titles[ PlayerTitleId.HOLIDAY_1 ] =
{
    name = "HOLIDAY_1",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_2 ] =
{
    name = "HOLIDAY_2",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_3 ] =
{
    name = "HOLIDAY_3",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_4 ] =
{
    name = "HOLIDAY_4",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_5 ] =
{
    name = "HOLIDAY_5",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_6 ] =
{
    name = "HOLIDAY_6",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_7 ] =
{
    name = "HOLIDAY_7",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_8 ] =
{
    name = "HOLIDAY_8",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_9 ] =
{
    name = "HOLIDAY_9",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_10 ] =
{
    name = "HOLIDAY_10",
    hiden = true,
}
Titles[ PlayerTitleId.HOLIDAY_11 ] =
{
    name = "HOLIDAY_11",
    hiden = true,
}

Titles[ PlayerTitleId.HERO_1 ] =
{
    name = "HERO_1",
    hiden = true,
}
Titles[ PlayerTitleId.HERO_2 ] =
{
    name = "HERO_2",
    hiden = true,
}
Titles[ PlayerTitleId.HERO_3 ] =
{
    name = "HERO_3",
    hiden = true,
}
Titles[ PlayerTitleId.HERO_4 ] =
{
    name = "HERO_4",
    hiden = true,
}
Titles[ PlayerTitleId.HERO_5 ] =
{
    name = "HERO_5",
    hiden = true,
}
Titles[ PlayerTitleId.HERO_6 ] =
{
    name = "HERO_6",
    hiden = true,
}
Titles[ PlayerTitleId.HERO_7 ] =
{
    name = "HERO_7",
    hiden = true,
}
Titles[ PlayerTitleId.HERO_8 ] =
{
    name = "HERO_8",
    hiden = true,
}
Titles[ PlayerTitleId.HERO_9 ] =
{
    name = "HERO_9",
    hiden = true,
}
Titles[ PlayerTitleId.HERO_10 ] =
{
    name = "HERO_10",
    hiden = true,
}

Titles[ PlayerTitleId.NEW_2022_YEAR ] =
{
    name = "New_2022_Year",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY23_1 ] =
{
    name = "Battle_Pass_ny23_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY23_2 ] =
{
    name = "Battle_Pass_ny23_2",
    hiden = true,
}

Titles[ PlayerTitleId.DRAGONFLY_1 ] =
{
    name = "DRAGONFLY_1",
    hiden = true,
}

Titles[ PlayerTitleId.DRAGONFLY_2 ] =
{
    name = "DRAGONFLY_2",
    hiden = true,
}

Titles[ PlayerTitleId.DRAGONFLY_3 ] =
{
    name = "DRAGONFLY_3",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SPR23_1 ] =
{
    name = "Battle_Pass_spr23_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SPR23_2 ] =
{
    name = "Battle_Pass_spr23_2",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY23_2 ] =
{
    name = "Battle_Pass_ny23_2",
    hiden = true,
}

Titles[ PlayerTitleId.WASP_1 ] =
{
    name = "WASP_1",
    hiden = true,
}

Titles[ PlayerTitleId.WASP_2 ] =
{
    name = "WASP_2",
    hiden = true,
}

Titles[ PlayerTitleId.WASP_3 ] =
{
    name = "WASP_3",
    hiden = true,
}

Titles[ PlayerTitleId.TEMPLE_1 ] =
{
    name = "TEMPLE_1",
    hiden = true,
}

Titles[ PlayerTitleId.TEMPLE_2 ] =
{
    name = "TEMPLE_2",
    hiden = true,
}

Titles[ PlayerTitleId.TEMPLE_3 ] =
{
    name = "TEMPLE_3",
    hiden = true,
}

Titles[ PlayerTitleId.MAZE_1 ] =
{
    name = "MAZE_1",
    hiden = true,
}

Titles[ PlayerTitleId.MAZE_2 ] =
{
    name = "MAZE_2",
    hiden = true,
}

Titles[ PlayerTitleId.MAZE_3 ] =
{
    name = "MAZE_3",
    hiden = true,
}

Titles[ PlayerTitleId.PAPER_1 ] =
{
    name = "PAPER_1",
    hiden = true,
}

Titles[ PlayerTitleId.PAPER_2 ] =
{
    name = "PAPER_2",
    hiden = true,
}

Titles[ PlayerTitleId.PAPER_3 ] =
{
    name = "PAPER_3",
    hiden = true,
}

Titles[ PlayerTitleId.CYNING_1 ] =
{
    name = "CYNING_1",
    hiden = true,
}

Titles[ PlayerTitleId.MJOLNIR_1 ] =
{
    name = "MJOLNIR_1",
    hiden = true,
}

Titles[ PlayerTitleId.KRAKEN_1 ] =
{
    name = "KRAKEN_1",
    hiden = true,
}

Titles[ PlayerTitleId.PEREGRINE_1 ] =
{
    name = "PEREGRINE_1",
    hiden = true,
}

Titles[ PlayerTitleId.JAGUAR_1 ] =
{
    name = "JAGUAR_1",
    hiden = true,
}

Titles[ PlayerTitleId.OCTOPUS_1 ] =
{
    name = "OCTOPUS_1",
    hiden = true,
}

Titles[ PlayerTitleId.CALTROP_1 ] =
{
    name = "CALTROP_1",
    hiden = true,
}

Titles[ PlayerTitleId.SAWONE_1 ] =
{
    name = "SAWONE_1",
    hiden = true,
}

Titles[ PlayerTitleId.RONIN_1 ] =
{
    name = "RONIN_1",
    hiden = true,
}

Titles[ PlayerTitleId.BRAINS_1 ] =
{
    name = "BRAINS_1",
    hiden = true,
}

Titles[ PlayerTitleId.BRAINS_2 ] =
{
    name = "BRAINS_2",
    hiden = true,
}

Titles[ PlayerTitleId.BRAINS_3 ] =
{
    name = "BRAINS_3",
    hiden = true,
}

Titles[ PlayerTitleId.APRIL23_EGG ] =
{
    name = "APRIL23_EGG",
    hiden = true,
}

Titles[ PlayerTitleId.ENCOUNTER_1 ] =
{
    name = "ENCOUNTER_1",
    hiden = true,
}

Titles[ PlayerTitleId.ENCOUNTER_2 ] =
{
    name = "ENCOUNTER_2",
    hiden = true,
}

Titles[ PlayerTitleId.ENCOUNTER_3 ] =
{
    name = "ENCOUNTER_3",
    hiden = true,
}

Titles[ PlayerTitleId.SUPPORT_1 ] =
{
    name = "SUPPORT_1",
    hiden = true,
}

Titles[ PlayerTitleId.SUPPORT_2 ] =
{
    name = "SUPPORT_2",
    hiden = true,
}

Titles[ PlayerTitleId.SUPPORT_3 ] =
{
    name = "SUPPORT_3",
    hiden = true,
}

Titles[ PlayerTitleId.CORNER_1 ] =
{
    name = "CORNER_1",
    hiden = true,
}

Titles[ PlayerTitleId.CORNER_2 ] =
{
    name = "CORNER_2",
    hiden = true,
}

Titles[ PlayerTitleId.CORNER_3 ] =
{
    name = "CORNER_3",
    hiden = true,
}

Titles[ PlayerTitleId.CORNER_4 ] =
{
    name = "CORNER_4",
    hiden = true,
}

Titles[ PlayerTitleId.CORNER_5 ] =
{
    name = "CORNER_5",
    hiden = true,
}

Titles[ PlayerTitleId.CORNER_6 ] =
{
    name = "CORNER_6",
    hiden = true,
}

Titles[ PlayerTitleId.CORNER_7 ] =
{
    name = "CORNER_7",
    hiden = true,
}

Titles[ PlayerTitleId.CORNER_8 ] =
{
    name = "CORNER_8",
    hiden = true,
}

Titles[ PlayerTitleId.CORNER_9 ] =
{
    name = "CORNER_9",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SUM23_1 ] =
{
    name = "Battle_Pass_sum23_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SUM23_2 ] =
{
    name = "Battle_Pass_sum23_2",
    hiden = true,
}

Titles[ PlayerTitleId.GALACTIC_SURFER ] =
{
    name = "Galactic_Surfer",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_AUT23_1 ] =
{
    name = "Battle_Pass_aut23_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_AUT23_2 ] =
{
    name = "Battle_Pass_aut23_2",
    hiden = true,
}

Titles[ PlayerTitleId.HALLOWEEN_2023 ] =
{
    name = "HALLOWEEN_2023",
    hiden = true,
}

Titles[ PlayerTitleId.COSMIC_HORROR ] =
{
    name = "COSMIC_HORROR",
    hiden = true,
}

-- SC-118303 Боевой пропуск "Секреты предтечей. Первая фаза": BP14_1 / NY24_1 Зима 2023-2024. Простой и элитный

Titles[ PlayerTitleId.BATTLE_PASS_NY24_1 ] =
{
    name = "Battle_Pass_ny24_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY24_2 ] =
{
    name = "Battle_Pass_ny24_2",
    hiden = true,
}

-- SC-118315 ИвентПасс. Архивы ЕЦН: Зимнепраздник.  BP14_3 / NY24_3. Простой и элитный

Titles[ PlayerTitleId.EVENT_PASS_NY24_3 ] =
{
    name = "Event_Pass_ny24_3",
    hiden = true,
}

-- SC-118549 Ивентпасс: "Архивы ЕЦН: Огонь любви". BP14_4 / NY24_4 2024. Валентина день 2024. Простой и Элитный

Titles[ PlayerTitleId.VALENTINE_NY24_4 ] =
{
    name = "Valentine_ny24_4",
    hiden = true,
}

-- SC-118608 Боевой пропуск "Скачок в бездну. Первая фаза": BP15_1 / SPR15_1. Весна 2024. Первый этап простой и элитный

Titles[ PlayerTitleId.BATTLE_PASS_SPR24_1 ] =
{
    name = "Battle_Pass_spr24_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SPR24_2 ] =
{
    name = "Battle_Pass_spr24_2",
    hiden = true,
}

-- SC-???? Ивениасс: "Архивы ЕЦН: Забытые сражения". BP15_3 / SPR15_3. Весна 2024. Простой и элитный

Titles[ PlayerTitleId.EVENT_PASS_SPR24_3 ] =
{
    name = "Event_Pass_spr24_3",
    hiden = true,
}

-- SC-118861 звания, которые будут доступны в качестве наград за турниры Уютного Уголка.

Titles[ PlayerTitleId.COZY_CORNER_1 ] =
{
    name = "COZY_CORNER_1",
    hiden = true,
}

Titles[ PlayerTitleId.COZY_CORNER_2 ] =
{
    name = "COZY_CORNER_2",
    hiden = true,
}

Titles[ PlayerTitleId.COZY_CORNER_3 ] =
{
    name = "COZY_CORNER_3",
    hiden = true,
}

Titles[ PlayerTitleId.COZY_CORNER_4 ] =
{
    name = "COZY_CORNER_4",
    hiden = true,
}

Titles[ PlayerTitleId.COZY_CORNER_5 ] =
{
    name = "COZY_CORNER_5",
    hiden = true,
}

Titles[ PlayerTitleId.COZY_CORNER_6 ] =
{
    name = "COZY_CORNER_6",
    hiden = true,
}

-- SC-118998 Звания (Титулы). Боевой пропуск "Неведомые горизонты": BP16 / SUM24. Лето 2024 (все фазы) + Ивентпасс "Архивы ЕЦН: Эхо империй".

Titles[ PlayerTitleId.BATTLE_PASS_SUM24_1 ] =
{
    name = "Battle_Pass_sum24_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SUM24_2 ] =
{
    name = "Battle_Pass_sum24_2",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_SUM24_3 ] =
{
    name = "Event_Pass_sum24_3",
    hiden = true,
}

-- SC-119009 Турнирные звания (за турниры). Добавить в игру (SUM 2024)

Titles[ PlayerTitleId.TOURNAMENT_HELLRIDER ] =
{
    name = "TOURNAMENT_HELLRIDER",
    hiden = true,
}

Titles[ PlayerTitleId.TOURNAMENT_TOXICVOMIT ] =
{
    name = "TOURNAMENT_TOXICVOMIT",
    hiden = true,
}

-- SC-119028 Марафон заданий в ОМ: "Мал клоп - да могуч". SUM24.

Titles[ PlayerTitleId.OWFEST_24 ] =
{
    name = "OWFest_24",
    hiden = true,
}

-- SC-119986 «Стойкий Оловяный Пилотик». Фестиваль заданий в честь 10 лет.

Titles[ PlayerTitleId.TIN10 ] =
{
    name = "Tin10",
    hiden = true,
}

-- SC-119986 Звание (титул). «Стойкий Стальной Пилотик». Фестиваль заданий в честь 11 лет Игры.

Titles[ PlayerTitleId.TIN11 ] =
{
    name = "Tin11",
    hiden = true,
}

-- SC-119227 Звания (Титулы). Боевой пропуск "Сердце тьмы": BP17 / AUT24. Осень 2024 (все фазы) + Ивентпасс "Архивы ЕЦН: Зов неизведанного".

Titles[ PlayerTitleId.BATTLE_PASS_AUT24_1 ] =
{
    name = "Battle_Pass_aut24_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_AUT24_2 ] =
{
    name = "Battle_Pass_aut24_2",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_AUT24_3 ] =
{
    name = "Event_Pass_aut24_3",
    hiden = true,
}

-- SC-119187 Зловещий марафон заданий. Разогревочный ивент перед Хеллоуином 2024

Titles[ PlayerTitleId.HALLOWEEN_2024 ] =
{
    name = "HALLOWEEN_2024",
    hiden = true,
}

-- SC-119417 Звания (Титулы). Боевой пропуск "Забытые звезды": BP18 / NY25. Зима 2024 (все фазы) + Ивентпасс "Архивы ЕЦН: Призрачный фронтир".

Titles[ PlayerTitleId.BATTLE_PASS_NY25_1 ] =
{
    name = "Battle_Pass_ny25_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY25_2 ] =
{
    name = "Battle_Pass_ny25_2",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_NY25_3 ] =
{
    name = "Event_Pass_ny25_3",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_NY25_4 ] =
{
    name = "Event_Pass_ny25_4",
    hiden = true,
}

-- SC-119413 НГ 2024-25. Новогодний марафон от Мисс Фрост! (NY2025)

Titles[ PlayerTitleId.NEW_2025_YEAR ] =
{
    name = "New_2025_Year",
    hiden = true,
}

-- SC-119484 Добавить новое турнирное звание в игру (*Зацензурено*)

Titles[ PlayerTitleId.TOURNAMENT_2025_CENSORED  ] =
{
    name = "TOURNAMENT_2025_CENSORED",
    hiden = true,
}

-- SC-119586 Звания и насмешки 1.13.2 Боевой пропуск "Союзники и соперники". BP19_1(2) - SPR25_1(2). Первая/Вторая фаза

Titles[ PlayerTitleId.BATTLE_PASS_SPR25_1 ] =
{
    name = "Battle_Pass_spr25_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SPR25_2 ] =
{
    name = "Battle_Pass_spr25_2",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_SPR25_3 ] =
{
    name = "Event_Pass_spr25_3",
    hiden = true,
}

-- Звание Яйцекат 2025 (Поиск яиц динозавров, Ивент на 1 апреля)

Titles[ PlayerTitleId.EGGROLLER2025 ] =
{
    name = "EGGROLLER2025",
    hiden = true,
}

-- SC-119681 Турнирные звания (за турниры). Добавить в игру (SPR 2025)

Titles[ PlayerTitleId.TOURNAMENT_2025_NEKOPARA ] = -- "Глава Некопары" 
{
    name = "TOURNAMENT_2025_NEKOPARA",
    hiden = true,
}

Titles[ PlayerTitleId.TOURNAMENT_2025_SCP ] = -- "SCP -"
{
    name = "TOURNAMENT_2025_SCP",
    hiden = true,
}

Titles[ PlayerTitleId.TOURNAMENT_2025_RAIDEN ] = -- "Raiden"
{
    name = "TOURNAMENT_2025_RAIDEN",
    hiden = true,
}

Titles[ PlayerTitleId.TOURNAMENT_2025_FALLING ] = -- "Падающий"
{
    name = "TOURNAMENT_2025_FALLING",
    hiden = true,
}

-- SC-119796 Звания и насмешки 1.13.7 БП "Предания древних". BP20_1(2) - SUM25_1(2) + ИП "Сезон штормов" EP20_3 - SUM25_3. Лето 2025

Titles[ PlayerTitleId.BATTLE_PASS_SUM25_1 ] =
{
    name = "Battle_Pass_sum25_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SUM25_2 ] =
{
    name = "Battle_Pass_sum25_2",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_SUM25_3 ] =
{
    name = "Event_Pass_sum25_3",
    hiden = true,
}

Titles[ PlayerTitleId.HIDDEN_SEEKER_2025 ] = -- "Падающий"
{
    name = "HIDDEN_SEEKER_2025",
    hiden = true,
}

Titles[ PlayerTitleId.ROP2025_CONTEMPLATOR ] = -- "Созерцатель"
{
    name = "ROP2025_CONTEMPLATOR",
    hiden = true,
}

Titles[ PlayerTitleId.ROP2025_WITNESS ] = -- "Свидетель Предтеч"
{
    name = "ROP2025_WITNESS",
    hiden = true,
}

-- SC-120020 Звания и насмешки 1.13.10 БП "Опустошенные миры". BP21_1(2) - AUT25_1(2) + ИП "Сезон штормов" EP21_3 - AUT25_3. Осень 2025

Titles[ PlayerTitleId.BATTLE_PASS_AUT25_1 ] =
{
    name = "Battle_Pass_aut25_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_AUT25_2 ] =
{
    name = "Battle_Pass_aut25_2",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_AUT25_3 ] =
{
    name = "Event_Pass_aut25_3",
    hiden = true,
}

--

Titles[ PlayerTitleId.HALLOWEEN_2025 ] =
{
    name = "HALLOWEEN_2025",
    hiden = true,
}

-- SC-120084 Турнирные звания и насмешки (за турниры). Добавить в игру (AUT_2025)

Titles[ PlayerTitleId.TOURNAMENT_AUT2025_ELITE ] = -- "Глава Некопары" 
{
    name = "TOURNAMENT_AUT2025_ELITE",
    hiden = true,
}

Titles[ PlayerTitleId.TOURNAMENT_AUT2025_CHEATER ] = -- "SCP -"
{
    name = "TOURNAMENT_AUT2025_CHEATER",
    hiden = true,
}

-- SC-120195 Звания и насмешки 1.13.13 (1.14.0) БП "Перекрёсток галактик". BP22_1(2) - NY26_1(2) + ИП "Утраченные созвездия" EP22_3 - NY26_3. Зима 2025 - 26

Titles[ PlayerTitleId.BATTLE_PASS_NY26_1 ] =
{
    name = "Battle_Pass_ny26_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_NY26_2 ] =
{
    name = "Battle_Pass_ny26_2",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_NY26_3 ] =
{
    name = "Event_Pass_ny26_3",
    hiden = true,
}

-- SC-120194 НГ 2025-26. Новогодний марафон от Мисс Фрост! (NY2026)

Titles[ PlayerTitleId.NEW_2026_YEAR ] =
{
    name = "New_2026_Year",
    hiden = true,
}

-- SC-120348 Ивентпасс "Архивы ЕЦН: Потерянный контакт". BP22_4 / NY26_4. Зима 2025 - 26. Звания/Титул

Titles[ PlayerTitleId.EVENT_PASS_NY26_4 ] =
{
    name = "Event_Pass_ny26_4",
    hiden = true,
}

-- SC-120401 Звания и насмешки 1.14.05: БП "Раскол альянсов". BP22_1(2) - SPR26_1(2) + ИП "Кровь Фронтира" EP23_3 - SPR26_3. Весна 2026.

Titles[ PlayerTitleId.BATTLE_PASS_SPR26_1 ] =
{
    name = "Battle_Pass_spr26_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SPR26_2 ] =
{
    name = "Battle_Pass_spr26_2",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_SPR26_3 ] =
{
    name = "Event_Pass_spr26_3",
    hiden = true,
}

-- SC-120503 Звания и насмешки 1.14.10: БП "Наследие предтеч". BP24_1(2) - SUM26_1(2) + ИП "Осколки Эдема" EP24_3 - SUM26_3. Лето 2026.

Titles[ PlayerTitleId.BATTLE_PASS_SUM26_1 ] =
{
    name = "Battle_Pass_sum26_1",
    hiden = true,
}

Titles[ PlayerTitleId.BATTLE_PASS_SUM26_2 ] =
{
    name = "Battle_Pass_sum26_2",
    hiden = true,
}

Titles[ PlayerTitleId.EVENT_PASS_SUM26_3 ] =
{
    name = "Event_Pass_sum26_3",
    hiden = true,
}
