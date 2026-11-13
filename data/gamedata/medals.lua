-- Категории медалей
MedalsInfo =
{
	categories =
	{
		{
			name = "FIRST", -- медали за конкурентные достижения
		},
		{
			name = "BEACON", -- медали за захват маяков
		},
		{
			name = "MULTIKILLS", -- медали за быстрое уничтожение противника
		},
		{
			name = "SPREE", -- медали за серийные достижения
		},
		{
			name = "INTERCEPTOR", -- медали пилотам перехватчиков
		},
		{
			name = "ATTACKSHIP", -- медали пилотам штурмовиков
		},
		{
			name = "FRIGATE", -- медали пилотам фрегатов
		},
--		{
--			name = "HUGE", -- медали пилотам дестроерам
--		},
		{
			name = "RAILGUN", -- медали за использование кинетики
		},
		{
			name = "PLASMAGUN", -- медали за использование плазмы
		},
		{
			name = "LASER", -- медали за использование лазеров
		},
		{
			name = "SPECIAL", -- медали за использование спец. модулей
		},
		{
			name = "DRONES", -- медали за убийство дронов
		},
		{
			name = "SPECIALKILLS", -- медали за уничтожение противника при определенных условиях
		},
		{
			name = "SURVIVE", -- медали за выживание в бою
		},
		{
			name = "OTHERS", -- медали вне категорий
		},
	}
}



Medals =
{
	-- kill <x> opponents within <y> seconds of each other
	[ ai.MedalType.MULTI_KILL ] =
	{
		-- time between kills
		additional_params = 15,
		category = "MULTIKILLS",
		gameplays = ai.GameplayGroups.non_open_world_or_fast,
		coop_vs_ai_levels = 4, -- длЯ режима Џротив €€ работают только первые 4 медали
		
		-- kills | exp
		[ "levels" ] =
		{
			{ 2,	20	},
			{ 3,	30	},
			{ 4,	40	},
			{ 5,	50	},
			{ 6,	60	},
			{ 7,	70	},
			{ 8,	80	},
		},
	},



	-- kill <x> opponents without dying
	[ ai.MedalType.KILLING_SPREE ] =
	{
		category = "SPREE",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 5, -- длЯ режима Џротив €€ работают только первые 4 медали
		
		-- kills | exp
		[ "levels" ] =
		{
			{ 3,	20	},
			{ 5,	30	},
			{ 7,	40	},
			{ 9,	50	},
			{ 11,	60	},
			{ 13,	70	},
			{ 15,	80	},
		},
	},



	-- assist in killing <x> opponents without dying
	[ ai.MedalType.ASSIST_SPREE ] =
	{
		category = "SPREE",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 4, -- длЯ режима Џротив €€ работают только первые 4 медали
		
		-- assists | exp
		[ "levels" ] =
		{
			{ 4,	20		},
			{ 6,	30		},
			{ 8,	40		},
			{ 10,	50		},
			{ 12,	60		},
			{ 14,	70		},
			{ 16,	80		},
		},
	},



	-- kill <y> opponents during this match while piloting a small ship
	[ ai.MedalType.SMALL_CLASS_SPREE ] =
	{
		category = "INTERCEPTOR",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 5, -- длЯ режима Џротив €€ работают только первые 4 медали
		
		-- kills | exp
		[ "levels" ] =
		{
			{ 4,	20	},
			{ 6,	30	},
			{ 8,	40	},
			{ 10,	50	},
			{ 12,	60	},
			{ 14,	70	},
			{ 16,	80	},
		},
	},



	-- kill <y> opponents during this match while piloting a medium ship
	[ ai.MedalType.MEDIUM_CLASS_SPREE ] =
	{
		category = "ATTACKSHIP",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 4, -- длЯ режима Џротив €€ работают только первые 4 медали

		-- kills | exp
		[ "levels" ] =
		{
			{ 4,	20	},
			{ 6,	30	},
			{ 8,	40	},
			{ 10,	50	},
			{ 12,	60	},
			{ 14,	70	},
			{ 16,	80	},
		},
	},



	-- kill <y> opponents during this match while piloting a large ship
	[ ai.MedalType.LARGE_CLASS_SPREE ] =
	{
		category = "FRIGATE",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 4, -- длЯ режима Џротив €€ работают только первые 4 медали
		

		-- kills | exp
		[ "levels" ] =
		{
			{ 4,	20	},
			{ 6,	30	},
			{ 8,	40	},
			{ 10,	50	},
			{ 12,	60	},
			{ 14,	70	},
			{ 16,	80	},
		},
	},



	-- kill <y> opponents during this match using railguns
	[ ai.MedalType.RAILGUN_SPREE ] =
	{
		category = "RAILGUN",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 4, -- длЯ режима Џротив €€ работают только первые 4 медали

		-- kills | exp
		[ "levels" ] =
		{
			{ 6,	20	},
			{ 8,	30	},
			{ 10,	40	},
			{ 12,	50	},
			{ 14,	60	},
			{ 16,	70	},
			{ 18,	80	},
		},
	},



	-- kill <y> opponents during this match using plasmaguns
	[ ai.MedalType.PLASMAGUN_SPREE ] =
	{
		category = "PLASMAGUN",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 4, -- длЯ режима Џротив €€ работают только первые 4 медали

		-- kills | exp
		[ "levels" ] =
		{
			{ 6,	20	},
			{ 8,	30	},
			{ 10,	40	},
			{ 12,	50	},
			{ 14,	60	},
			{ 16,	70	},
			{ 18,	80	},
		},
	},



	-- kill <y> opponents during this match using lasers
	[ ai.MedalType.LASER_SPREE ] =
	{
		category = "LASER",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 4, -- длЯ режима Џротив €€ работают только первые 4 медали
		
		-- kills | exp
		[ "levels" ] =
		{
			{ 6,	20	},
			{ 8,	30	},
			{ 10,	40	},
			{ 12,	50	},
			{ 14,	60	},
			{ 16,	70	},
			{ 18,	80	},
		},
	},



	--убийство кучи дронов 4 8 12 ... (7 уровней)
	-- kill <y> drones during this match
	[ ai.MedalType.DRONE_KILLING_SPREE ] =
	{
		category = "DRONES",
		gameplays = ai.GameplayGroups.non_open_world,

	--	gameplays = {},

		-- kills | exp
		[ "levels" ] =
		{
			{ 4,	20	},
			{ 8,	30	},
			{ 12,	40	},
			{ 16,	50	},
			{ 20,	60	},
			{ 24,	70	},
			{ 30,	80	},
		},
	},



	-- earn the first kill of a match
	[ ai.MedalType.FIRST_BLOOD ] =
	{
		category = "FIRST",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- kill an opponent while being dead
	[ ai.MedalType.KILL_FROM_THE_GRAVE ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- kill your last killer
	[ ai.MedalType.REVENGE ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- kill an opponent by colliding with him
	[ ai.MedalType.RAM ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- kill an opponent that has your ship locked while your ship is very close to death
	[ ai.MedalType.CLOSE_CALL ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- ship's health percentage
		additional_params = 0.15,
		isPercent = true,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- end an opponent's killing spree
	[ ai.MedalType.KILLJOY ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- save your teammate by killing his opponent
	[ ai.MedalType.BROS_TO_THE_END ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- teammate's health percentage
		additional_params = 0.15,
		isPercent = true,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- avenge your teammate by killing his killer
	[ ai.MedalType.AVENGER ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- time between kills (in seconds)
		additional_params = 7,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- finish this match with double digit assists and kills
	[ ai.MedalType.DOUBLE_DOUBLE ] =
	{
		category = "OTHERS",
		gameplays = ai.GameplayGroups.pvp,
		coop_vs_ai_levels = 0, -- медаль не работает  в coop_vs_ai

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	50		},
		},
	},



	-- disintegrate an opponent that is >=<y> away
	[ ai.MedalType.LONG_SHOT ] =
	{
		category = "SPECIAL",
		isDistance = true,
		gameplays = ai.GameplayGroups.non_open_world,

		-- distance (1 = 10 meters)
		additional_params = 900,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- kill an opponent in a turret mode (in disintegrator)
	[ ai.MedalType.HATE_CAMPERS ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.pvp,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- kill an opponent with your FrigateDrone
	[ ai.MedalType.HANDSFREE ] =
	{
		category = "SPECIAL",
		gameplays = ai.GameplayGroups.pvp,
		
		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},


	-- kill <y> FrigateDrones in 20 seconds
	[ ai.MedalType.LITTLE_THING_THAT_KILLED ] =
	{
		category = "MULTIKILLS",
		gameplays = ai.GameplayGroups.non_open_world,
		
		-- number of FrigateDrones to kill
		additional_params = 2,		

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- kill an opponent in a Berserk special (while locked)
	[ ai.MedalType.TORERO ] =
	{
		category = "SPECIALKILLS",

		gameplays = ai.GameplayGroups.pvp,
		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- kill an opponent that is using his MicroWarpDrive
	[ ai.MedalType.WHY_SUCH_A_HURRY ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- kill an opponent with your PlasmaWeb
	[ ai.MedalType.PLASMA_SPIDER ] =
	{
		category = "SPECIAL",
		gameplays = ai.GameplayGroups.non_open_world,

		-- PlasmaWeb item subtype (make sure to use value from 'ItemSubtype' table)
		additional_params = ItemSubtype.PlasmaWeb,
		
		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- kill an opponent which is not spotted by the radar
	[ ai.MedalType.SPOTTED ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world_or_fast,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- kill the same opponent <y> times without him killing you
	[ ai.MedalType.NEMESIS ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 2, -- только первые 2 уровнЯ медали будут работать в coop_vs_ai

		

		-- kills | exp
		[ "levels" ] =
		{
			{ 2,	20 	},
			{ 3,	30	},
			{ 4,	40	},
		},
	},



	-- kill you Nemesis
	[ ai.MedalType.NEMESIS_REVENGE ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	--первый килл дрона в матче
	-- earn the first drone kill of a match
	[ ai.MedalType.DRONE_FIRST_BLOOD ] =
	{
		category = "FIRST",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- убить сентинела
	-- killed a sentinel
	[ ai.MedalType.SENTINEL_KILLED ] =
	{
		category = "FIRST",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	100		},
		},
	},



	-- kill a healthy opponent in less then <y> seconds with no help
	[ ai.MedalType.FAST_AND_FURIOUS ] =
	{
		category = "MULTIKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- time in seconds
		additional_params = 6,
		
		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- kill an opponent with less then <y>% of health with a rocket
	[ ai.MedalType.ONE_SHOT_ROCKET ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- target's health percentage
		additional_params = 0.15,
		isPercent = true,
		
		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	-- end up killing or assisting <y> opponents after using Berserk special
	[ ai.MedalType.BLIND_RAGE ] =
	{
		category = "SPECIAL",
		gameplays = ai.GameplayGroups.pvp,

		-- number of kills
		additional_params = 2,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- убить разработчика
	-- developer killed
	[ ai.MedalType.KILLED_DEVELOPER ] =
	{
		category = "OTHERS",
		gameplays = ai.GameplayGroups.non_open_world,
		additional_params = PlayerTitleId.DEVELOPER,
		practice = true,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	100	},
		},
	},



	-- убить тестера
	-- tester killed
	[ ai.MedalType.KILLED_TESTER ] =
	{
		category = "OTHERS",
		gameplays = ai.GameplayGroups.non_open_world,
		additional_params = PlayerTitleId.TESTER,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- survive <y> * 100% of ship's health in damage
	[ ai.MedalType.BULLET_SPONGE ] =
	{
		category = "SURVIVE",
		gameplays = ai.GameplayGroups.non_open_world_or_fast,
		coop_vs_ai_levels = 3, -- в режиме против €€ выполнЯютсЯ только 3 условиЯ
		
		-- ship's full health percentage to absorb (MaxHealth * <y>) | exp
		[ "levels" ] =
		{
			{ 2,	20		},
			{ 3,	30		},
			{ 4,	40		},
			{ 5,	50		},
		},
	},



	-- activate your stealth special while locked and damaged (<=15% total health) and survive for <y> seconds
	[ ai.MedalType.HIDE_AND_SEEK ] =
	{
		category = "SURVIVE",
		gameplays = ai.GameplayGroups.non_open_world,

		-- time (in seconds)
		additional_params = 10,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- use your MicroWarpDrive while locked and damaged (<=15% total health) and survive for <y> seconds
	[ ai.MedalType.CATCH_ME_IF_YOU_CAN ] =
	{
		category = "SURVIVE",
		gameplays = ai.GameplayGroups.non_open_world,

		-- time (in seconds)
		additional_params = 10,
		
		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- was hit by PlasmaWeb while damaged (<=15% total health) and survived
	[ ai.MedalType.ANTIDOTE ] =
	{
		category = "SURVIVE",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	-- survive in a ship with less then <y>% of health for <x> seconds
	[ ai.MedalType.BBQ_SHIP ] =
	{
		category = "SURVIVE",
		gameplays = ai.GameplayGroups.non_open_world,
		coop_vs_ai_levels = 3, -- только первые 3 уровнЯ медали будут работать в coop_vs_ai
		

		-- ship's health percentage
		additional_params = 0.15,
		isPercent = true,
		
		-- seconds | exp
		[ "levels" ] =
		{
			{ 60,	50		},
			{ 120,	40		},
			{ 180,	30		},
			{ 240,	20		},
			{ 300,	10		},
		},
	},



	-- win a 1 vs >2 match
	-- Ты остался один против нескольких врагов и победил
	[ ai.MedalType.AGAINST_ALL_ODDS ] =
	{
		category = "SURVIVE",
		gameplays = ai.GameplayGroups.non_open_world_or_one_against_all,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	100	},
		},
	},



	-- не умереть ни разу за матч но иметь киллы
	-- win a match with 0 deaths and positive number of kills
	[ ai.MedalType.DIE_HARD ] =
	{
		category = "SURVIVE",
		gameplays = ai.GameplayGroups.pvp,
		coop_vs_ai_levels = 0, -- не работает в режиме "Џротив €€"

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	50		},
		},
	},



	-- родись сентинелом выживи и выйграй
	-- survived and won a match as a sentinel
	[ ai.MedalType.SENTINEL_SURVIVED_AND_WON ] =
	{
		category = "SURVIVE",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	100		},
		},
	},



	-- expose an invisible (in stealth) opponent
	[ ai.MedalType.CANT_HIDE ] =
	{
		category = "OTHERS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20 		},
		},
	},



	-- killed by collision (no attacker&assists)
	[ ai.MedalType.WALL_HUGGER ] =
	{
		category = "OTHERS",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	0		},
		},
	},



	--Первый захват витал поинта в матче
	-- earn the first vital point capture of a match
	[ ai.MedalType.VITAL_POINT_FIRST_CAPTURE ] =
	{
		category = "FIRST",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20	},
		},
	},



	-- захват нескольких маяков за матч. 5 уровней
	-- earn the first vital point capture of a match ???
	[ ai.MedalType.VITAL_POINT_CAPTURE_CHAIN ] =
	{
		category = "BEACON",
		gameplays = ai.GameplayGroups.non_open_world,

		-- captures | exp
		[ "levels" ] =
		{
			{ 2,	20		},
			{ 3,	30		},
			{ 4,	40		},
			{ 5,	50		},
			{ 6,	60		},
		},
	},



	-- ассистить разработчику
	-- assisted developer
	[ ai.MedalType.ASSISTED_DEVELOPER ] =
	{
		category = "OTHERS",
		gameplays = ai.GameplayGroups.non_open_world,
		additional_params = PlayerTitleId.DEVELOPER,
		practice = true,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	---
	[ ai.MedalType.SENTINEL_KILLED_SENTINEL ] =
	{
		category = "FIRST",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	100		},
		},
	},



	--- 50
	[ ai.MedalType.FIRST_BOMB_PICK_UP ] =
	{
		category = "FIRST",
		gameplays = ai.GameplayGroups.pvp,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},



	--- 51
	[ ai.MedalType.DANGEROUS_CARRIER ] =
	{
		category = "FIRST",
		gameplays = ai.GameplayGroups.pvp,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	30		},
		},
	},


	--- 52
	[ ai.MedalType.LONG_SHOT_ROCKET ] =
	{
		category = "SPECIAL",
		gameplays = ai.GameplayGroups.non_open_world,

		-- distance (1 = 10 meters)
		additional_params = 900,
		isDistance = true,


		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	--- 53
	[ ai.MedalType.HATE_CAMPERS_ROCKET ] =
	{
		category = "SPECIAL",
		gameplays = ai.GameplayGroups.non_open_world,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},


	
	--- 54
	[ ai.MedalType.SHIELD_PIERCING ] =
	{
		category = "SPECIAL",
		gameplays = ai.GameplayGroups.non_open_world,
		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},

	--- 55
	[ ai.MedalType.SHIELD_ABSORPTION ] =
	{
		category = "SPECIAL",
		gameplays = ai.GameplayGroups.non_open_world,
		lpIsPercent = true,
		
		-- <y> * 100% of ship's health | exp
		[ "levels" ] =
		{
			{ 0.5,	20		},
		},
	},



	--- 56
	[ ai.MedalType.SAVED_BY_THE_COCOON ] =
	{
		category = "SPECIAL",
		gameplays = ai.GameplayGroups.non_open_world,
		-- <y>% of ship's health
		additional_params = 0.2,
		isPercent = true,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},



	--- 57
	[ ai.MedalType.NOT_SO_INVULNERABLE ] =
	{
		category = "SPECIAL",
		gameplays = ai.GameplayGroups.non_open_world,
		-- time after fortification (in seconds)
		additional_params = 5,

		-- dummy | exp
		[ "levels" ] =
		{
			{ 0,	20		},
		},
	},
	
	
	--- 58
	[ ai.MedalType.RANK_IS_TOO_DAMN_HIGH ] =
	{
		category = "SPECIALKILLS",
		gameplays = ai.GameplayGroups.non_open_world,
		-- min rank difference between victim ship and attacker ship
		additional_params = 3,
		coop_vs_ai_levels = 0, -- не работает в coop_vs_ai
		
		[ "levels" ] =
		{
			{ 0,	50		},
		},
	},

	--- 59
	-- kill <y> opponents during this match while piloting a huge ship
	[ ai.MedalType.HUGE_CLASS_SPREE ] =
	{
		category = "HUGE",
		gameplays = {},

		-- kills | exp
		[ "levels" ] =
		{
			{ 2,	20	},
			{ 3,	30	},
			{ 8,	40	},
			{ 10,	50	},
			{ 12,	60	},
			{ 14,	70	},
			{ 16,	80	},
		},
	},
	
	-- 60
	-- убить врага, экипировав титул additional_params_2
	[ ai.MedalType.HALLOWEEN_WITCH ] =
	{
		category = "OTHERS",
		gameplays = ai.GameplayGroups.pvp,
		coop_vs_ai_levels = 0, -- не работает в режиме "Против ИИ"

		additional_params_2 = PlayerTitleId.HALLOWEEN_CULTIST,
		
		-- kills | exp
		[ "levels" ] =
		{
			{ 0,	5	},
		},
	},
	
	-- 61
	-- убить врага с титулом additional_params, экипировав титул additional_params_2
	[ ai.MedalType.HALLOWEEN_HUNTER ] =
	{
		category = "OTHERS",
		gameplays = ai.GameplayGroups.pvp,
		coop_vs_ai_levels = 0, -- не работает в режиме "Против ИИ"

		additional_params	= PlayerTitleId.HALLOWEEN_CULTIST,
		additional_params_2 = PlayerTitleId.WITCH_HUNTER,
		
		-- kills | exp
		[ "levels" ] =
		{
			{ 0,	15	},
		},
	},
}
