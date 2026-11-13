--﻿--
Def.CargoShip =
{
	class 			= "CargoShip",
	in_editor		= false,
	model			= "models/objects/ships_huge/freighter_imper/freighter_imper",
	object_tag 		= ai.ObjectTag.TRANSPORT,
	

	hudType 		= "default",
	signature		= ai.Signature.HUGE,
	
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk3", mass = 1000000, },
	damageable		= true,

	maxViewDist		= 3000,
	health 			= 10000,
	max_lin_speed	= 10,
	max_rot_speed	= 10,	-- deg per second

	death_effect	= "particles/empty",
	death_sound		= "sound/explosion/cargoship_expl",
	work_sound      = "sound/engine/cargoship_loop",

	death_wreck		= "CargoShipWreck",

	uiName			= "CargoShip",

	trail_effect = "particles/ships/ship_trail",
	trail_size = 0.1,
	trail_color = "5 17 197 100",
	
	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/gadgets/pve_ship_warp_in",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/gadgets/pve_ship_warp_out",
	
	children =
	{
		{	def = "Engine_empire_xxl", joint = "exhaust_1",	},
		{	def = "Engine_empire_xl", joint = "exhaust_2",	},
		{	def = "Engine_empire_xl", joint = "exhaust_3",	},
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},
	},
}

--
Def.CargoShipWreck =
{
	class 			= "BaseEntity",
	in_editor		= false,
	model			= "models/objects/ships_huge/freighter_imper/freighter_imper_wreck",
	physics			= { solid_type = solid.compound_model, dynamic = true, material = "Metal", mass = 50000, },
	remove_timeout	= 60.0,	--#74497 Уменьшил до минуты
	maxViewDist		= 3000,
	children =
	{
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_1"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_2"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_3"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_4"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_5"	},
		{	effect = "particles/explosions/objects/cargoship_explosion", joint = "root"	},
	},
	uiName 		= 	"ShipWreck",
}

--
Def.PvE_DockingBay =
{
	class 			= "AnimatedEntity",
	in_editor		= true,
	maxViewDist		= 5000,
	model			= "mapskit/maps/models/imper_station/docking_bay_huge/docking_bay_huge",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal", },
}
-- грузовой корабль игроков для геймплея на geostation т1-т2
Def.CargoShipTeam1 =
{
	inherit		= "CargoShip",
	relationship_group = 1,
	health 			= 100000,	--- #62763 было 75000, но ботам выдали ракеты
	max_lin_speed	= 14,

	uiName			= "CargoShip",
	hud_ico 		= "hud_cargo_ship_icon",
	
	children = 
	{
		{	def = "Engine_pirate_xxl",	joint = "exhaust_1",	},
		{	def = "Engine_pirate_xl",	joint = "exhaust_2",	},
		{	def = "Engine_pirate_xl",	joint = "exhaust_3",	},
		{	def = "Engine_pirate_l",	joint = "exhaust_4",	},
		{	def = "Engine_pirate_l",	joint = "exhaust_5",	},

		{	effect = "particles/ships/transport_lights",joint = "light_1",	},
		{	effect = "particles/ships/transport_lights",joint = "light_2",	},
		{	effect = "particles/ships/transport_lights",joint = "light_3",	},
		{	effect = "particles/ships/transport_lights",joint = "light_4",	},
	},	
}

-- грузовой корабль AI для геймплея на geostation т1-т2
Def.CargoShipTeam2 =
{
	inherit		= "CargoShip",
	relationship_group = 2,
	health 			= 80000,
	max_lin_speed	= 7,
	points_reward_kill = 200,
	points_reward_assist_damage = 100,
	points_reward_assist_debuff = 50,
	signature		= ai.Signature.HUGE,

	uiName			= "CargoShip",
	hud_ico 		= "hud_cargo_ship_icon",
	
	trail_effect = "particles/ships/ship_trail",
	trail_size = 0.1,
	trail_color = "185 21 41 100",
	
	children = 
	{
		{	def = "Engine_empire_xxl", joint = "exhaust_1",	},
		{	def = "Engine_empire_xl", joint = "exhaust_2",	},
		{	def = "Engine_empire_xl", joint = "exhaust_3",	},
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},

		{	effect = "particles/ships/transport_lights",joint = "light_1",	},
		{	effect = "particles/ships/transport_lights",joint = "light_2",	},
		{	effect = "particles/ships/transport_lights",joint = "light_3",	},
		{	effect = "particles/ships/transport_lights",joint = "light_4",	},
	},	
}

-- грузовой корабль игроков для геймплея на piratebay t4-t5
Def.CargoShipPirateTeam1 =
{
	inherit		= "CargoShip",
	relationship_group = 1,
	health 			= 220000,
	max_lin_speed	= 12,

	children =
	{
		{	def = "Engine_empire_xxl", joint = "exhaust_1",	},
		{	def = "Engine_empire_xl", joint = "exhaust_2",	},
		{	def = "Engine_empire_xl", joint = "exhaust_3",	},
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},
	},

	uiName			= "CargoShip",
	hud_ico 		= "hud_cargo_ship_icon",
}

-- грузовой корабль игроков для геймплея на rescue_pirates_base
Def.CargoShipPirateRescue =
{
	inherit		= "CargoShip",
	relationship_group = 1,
	health 			= 60000,
	max_lin_speed	= 12,

	children =
	{
		{	def = "Engine_empire_xxl", joint = "exhaust_1",	},
		{	def = "Engine_empire_xl", joint = "exhaust_2",	},
		{	def = "Engine_empire_xl", joint = "exhaust_3",	},
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},
	},

	uiName			= "CargoShip",
	hud_ico 		= "hud_cargo_ship_icon",
}

Def.CargoShipStealth =
{
	inherit		= "CargoShip",
	relationship_group = 1,
	health 			= 6000000,
	max_lin_speed	= 12,

	children =
	{
		{	def = "Engine_empire_xxl", joint = "exhaust_1",	},
		{	def = "Engine_empire_xl", joint = "exhaust_2",	},
		{	def = "Engine_empire_xl", joint = "exhaust_3",	},
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},
	},

	uiName			= "CargoShip_Stealth",
	hud_ico 		= "hud_cargo_ship_icon",
}

-- деф для туториального корабля
Def.CargoShipTutorial =
{
	inherit		= "CargoShip",
	relationship_group = 2,
	health 			   = 6800,	-- #53519
	max_lin_speed	   = 12,
	signature		   = ai.Signature.HUGE,

	uiName			= "Training_target",
	hud_ico 		= "hud_cargo_ship_icon",
}

-- грузовой корабль AI для геймплея на Jericho_Base т2
Def.CargoShipTeam2_Jericho_T2 =
{
	relationship_group = 2,
	health 			= 110000,
	max_lin_speed	= 6,
	points_reward_kill = 200,
	points_reward_assist_damage = 100,
	points_reward_assist_debuff = 50,
	signature		= ai.Signature.HUGE,

	uiName			= "CargoShip_bomb",
	
	class 			= "CargoShip",
	hudType 		= "default",	-- #49787
	in_editor		= false,
	model			= "models/objects/ships_huge/freighter_imper/freighter_imper",
	object_tag 		= ai.ObjectTag.TRANSPORT,

	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000, },
	damageable		= true,

	maxViewDist		= 3000,
	max_rot_speed	= 10,	-- deg per second

	death_effect	= "particles/empty",
	death_sound		= "sound/explosion/cargoship_expl",
	work_sound      = "sound/engine/cargoship_loop",

	death_wreck		= "CargoShipWreck",

	hud_ico 		= "hud_cargo_ship_icon",
	
	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/gadgets/pve_ship_warp_in",
	warp_out_effect	= "particles/explosions/objects/explosion_big",
	warp_out_sound	= "sound/explosion/cargoship_expl",

	children =
	{
		{	def = "Engine_empire_xxl", joint = "exhaust_1",	},
		{	def = "Engine_empire_xl", joint = "exhaust_2",	},
		{	def = "Engine_empire_xl", joint = "exhaust_3",	},
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},
	},
	
}


-- грузовой корабль AI для геймплея на debrissite т2
Def.CargoShipTeam2_Debrissite_T2 =
{
	inherit		= "CargoShipTeam2_Jericho_T2",
	health 			= 1000000,
	max_lin_speed	= 25,
	points_reward_kill = 50,
	points_reward_assist_damage = 350,
}


-- грузовой корабль для прототипа ПвЕ рейда
Def.AlienCruiser =
{
	relationship_group = ai.RelationshipGroups.Alien, -- alien
	health 			= 180000000,
	crowd_control_coef = 0,	--- #59363
	--health 			= 50,
	max_lin_speed	= 12,
	points_reward_kill = 300,
	points_reward_assist_damage = 9500,
	points_reward_assist_debuff = 200,
	signature		= ai.Signature.HUGE,

	uiName			= "AlienCruiser",
	
	class 			= "CargoShip",
	hudType 		= "default",	-- #49787
	in_editor		= false,
	model			= "models/objects/ships_huge/prec_cruiser/prec_cruiser",

	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000, },
	damageable		= true,

	maxViewDist		= 3000,
	max_rot_speed	= 2,	-- deg per second

	death_effect	= "",
	death_sound		= "sound/raid/boss_death",
	work_sound      = "sound/raid/boss_engine",

	death_wreck		= "AlienCruiserExpl",

	hud_ico 		= "nlo_2",

	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/raid/boss_call",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/raid/boss_call",
	
	shield_def		= "Cruiser_Shield",
	shield_activate_sound = "sound/raid/boss_shield_on",
	shield_deactivate_sound = "sound/raid/boss_shield_off",
	anger_sound = "sound/raid/boss_call",
	anger_health_percent = { 0.85, 0.7, 0.5, 0.3, 0.15, 0.05 },
	
	gameplay_coef_group_id	= 0,

	broken_parts = 
	{
		{ def = "AlienCruiser_Wreck1",	debris = false, pos = Vec3( 0, 89, -29 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.075, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck2", 	debris = false, pos = Vec3( 13, 52, -32 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck3",  debris = false, pos = Vec3( 7, -7, -40 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.05, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck4",  debris = false, pos = Vec3( -19, -12, -46 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.1, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck5",  debris = false, pos = Vec3( 25, 12, -36 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		--{ def = "AlienCruiser_Wreck6",  debris = false, pos = Vec3( -15, 45, -22 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck7",  debris = false, pos = Vec3( 0, -45, -61 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.1, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck8",  debris = false, pos = Vec3( 0, -89, -17 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck9",  debris = false, pos = Vec3( 0, 12, 12 ), angle = 360,ang_speed_deviation = 0.01, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck10",  debris = false, pos = Vec3( 0, 12, 22 ), angle = 360,ang_speed_deviation = 0.01, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		--
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -2, 10, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -4, -10, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		--
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -43, 20, -42 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( -25, 45, -22 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( -41, 20, -41 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -15, 3, -42 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( 15, 3, -42 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -15, 40, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( 15, 40, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( 0, 31, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0.05, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( 0, -5, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
	},
	
	children =
	{		
		{ def = "Turret_CruiserAlienSmall", joint = "gun_1" },
		{ def = "Turret_CruiserAlienSmall", joint = "gun_2" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_3" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_4" },
		{ def = "Turret_CruiserAlien", joint = "gun_5" },
		{ def = "Turret_CruiserAlien", joint = "gun_6" },
		{ def = "TurretPlasma_CruiserAlien", joint = "gun_7" },
		{ def = "TurretPlasma_CruiserAlien", joint = "gun_8" },
		{ def = "Turret_CruiserAlien", joint = "gun_9" },
		{ def = "Turret_CruiserAlien", joint = "gun_10" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_11" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_12" },
		{ def = "Turret_CruiserAlienSmall", joint = "gun_13" },
		{ def = "Turret_CruiserAlienSmall", joint = "gun_14" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_15" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_16" },

		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_17" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_18" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_19" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_20" },

		{def = "PrecCruiserEngine",	joint = "engine_1"},
		{effect = "particles/objects/prec_cruiser_engine_aura",	joint = "engine_1"},
		{def = "PrecCruiserEngineEx",	joint = "exhaust_1"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_2"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_2"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_3"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_3"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_4"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_4"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_5"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_5"},
		{def = "PrecCruiserTrail",	joint = "exhaust_1"},
		{def = "PrecCruiserTrail",	joint = "exhaust_2"},
		{def = "PrecCruiserTrail",	joint = "exhaust_3"},
		{def = "PrecCruiserTrail",	joint = "exhaust_4"},
		{def = "PrecCruiserTrail",	joint = "exhaust_5"},

		-- кости fx с 1 по 6 пока сделал как движки
		{def = "PrecCruiserEngineExSmall",	joint = "fx_1"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_2"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_3"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_4"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_5"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_6"},
		{def = "PrecCruiserTrail",	joint = "fx_1"},
		{def = "PrecCruiserTrail",	joint = "fx_2"},
		{def = "PrecCruiserTrail",	joint = "fx_3"},
		{def = "PrecCruiserTrail",	joint = "fx_4"},
		{def = "PrecCruiserTrail",	joint = "fx_5"},
		{def = "PrecCruiserTrail",	joint = "fx_6"},

	},
}

Def.AlienCruiser_t3 =
{
	health 			= 30000000,
	crowd_control_coef = 0,	--- #59363
	shield_def		= "Cruiser_Shield_RW_t3",

	relationship_group = ai.RelationshipGroups.Alien, -- alien
	max_lin_speed	= 20,
	points_reward_kill = 300,
	points_reward_assist_damage = 9500,
	points_reward_assist_debuff = 200,
	signature		= ai.Signature.HUGE,

	uiName			= "AlienDestroyer",	--AlienCruiser
	
	class 			= "CargoShip",
	--hudType 		= "default",	-- #49787
	in_editor		= false,

	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer",
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000, },
	damageable		= false,

	maxViewDist		= 3000,
	max_rot_speed	= 2,	-- deg per second

	death_effect	= "",
	death_wreck		= "AlienDestroyerExpl",
	death_sound		= "sound/raid/boss_death",
	work_sound      = "sound/raid/boss_engine",

	hud_ico 		= "nlo_2",
	
	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/raid/boss_call2",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/raid/boss_call2",
	
	shield_activate_sound = "sound/raid/boss_shield_on",
	shield_deactivate_sound = "sound/raid/boss_shield_off",
	anger_sound = "sound/raid/boss_call2",
	anger_health_percent = { 0.7, 0.5, 0.3, 0.1 },

	broken_parts = 
	{
		{ def = "AlienDestroyer_Wreck01",  debris = false, pos = Vec3( 96, 28, -102 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R FRONT
		{ def = "AlienDestroyer_Wreck09",  debris = false, pos = Vec3( 64, 22, -14 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R BACK
		
		{ def = "AlienDestroyer_Wreck13",  debris = false, pos = Vec3( -66, 23, -9 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L BACK
		{ def = "AlienDestroyer_Wreck17",  debris = false, pos = Vec3( -97, 27, -132 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L FRONT
		
		{ def = "AlienDestroyer_Wreck02",  debris = false, pos = Vec3( 93, -24, -138 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R FRONT
		{ def = "AlienDestroyer_Wreck04",  debris = false, pos = Vec3( 93, -29, -78 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R MID
		{ def = "AlienDestroyer_Wreck10",  debris = false, pos = Vec3( 67, -23, -16 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R BACK
		
		{ def = "AlienDestroyer_Wreck14",  debris = false, pos = Vec3( -68, -24, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L BACK
		{ def = "AlienDestroyer_Wreck18",  debris = false, pos = Vec3( -98, -28, -96 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L FRONT
		
		--бошка
		{ def = "AlienDestroyer_Wreck11",  debris = false, pos = Vec3( 23, 0, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА R
		{ def = "AlienDestroyer_Wreck12",  debris = false, pos = Vec3( -30, 0, -25 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА L
		
		--пропадают сразу
		{ def = "AlienDestroyer_Wreck05",  debris = false, pos = Vec3( 98, 0, -68 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник R пропадают сразу
		{ def = "AlienDestroyer_Wreck16",  debris = false, pos = Vec3( -100, 0, -69 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник L пропадают сразу
		
		--мелочь
		--{ def = "AlienDestroyer_Wreck08",  debris = false, pos = Vec3( 76, 0, -100 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- косточка R
		--{ def = "AlienDestroyer_Wreck19",  debris = false, pos = Vec3( -53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа L
		{ def = "AlienDestroyer_Wreck07",  debris = false, pos = Vec3( 53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа R
		{ def = "AlienDestroyer_Wreck06",  debris = false, pos = Vec3( 20, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа R
		{ def = "AlienDestroyer_Wreck20",  debris = false, pos = Vec3( -130, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа L
		{ def = "AlienDestroyer_Wreck03",  debris = false, pos = Vec3( 70, -22, -145 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- B R треугольник спереди
		
		--Вместо части обломки
		--{ def = "AlienDestroyer_Wreck15",  debris = false, pos = Vec3( -94, 31, -76 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- T L MID	
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( -94, 31, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -94, 31, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck04", debris = false, pos = Vec3( -94, 31, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 31, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( -94, 33, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( -94, 33, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( -94, 33, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -94, 33, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( -94, 33, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 29, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 29, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( -94, 29, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck14", debris = false, pos = Vec3( -94, 29, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck15", debris = false, pos = Vec3( -94, 29, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck16", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck17", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
	},
	
	children =
	{		
		{effect = "particles/ships/destroyer_engine",	joint = "root"},
		{effect = "particles/ships/destroyer_engine_small",	joint = "fx1"},
		{effect = "particles/ships/destroyer_engine_small",	joint = "fx2"},

		{ def = "Alien_Destroyer_Life_01_T3", joint = "life1" },
		{ def = "Alien_Destroyer_Life_02_T3", joint = "life2" },
		{ def = "Alien_Destroyer_Life_03_T3", joint = "life3" },
		{ def = "Alien_Destroyer_Life_04_T3", joint = "life4" },

		{ def = "Alien_Destroyer_Hearth_T3", joint = "life1" },
		{ def = "Alien_Destroyer_SmallHearth_T3", joint = "life2" },
		{ def = "Alien_Destroyer_SmallHearth_T3", joint = "life3" },
		{ def = "Alien_Destroyer_Hearth_T3", joint = "life4" },

	},
}

Def.AlienCruiser_t5 =
{
	health 			= 75000000,	--х20
	crowd_control_coef = 0,	--- #59363
	shield_def		= "Cruiser_Shield_RW_t5",

	relationship_group = ai.RelationshipGroups.Alien, -- alien
	max_lin_speed	= 20,
	points_reward_kill = 300,
	points_reward_assist_damage = 9500,
	points_reward_assist_debuff = 200,
	signature		= ai.Signature.HUGE,

	uiName			= "AlienDestroyer",	--AlienCruiser
	
	class 			= "CargoShip",
	--hudType 		= "default",	-- #49787
	in_editor		= false,

	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer",
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000, },
	damageable		= false,

	maxViewDist		= 3000,
	max_rot_speed	= 2,	-- deg per second

	death_effect	= "",
	death_wreck		= "AlienDestroyerExpl",
	death_sound		= "sound/raid/boss_death",
	work_sound      = "sound/raid/boss_engine",

	hud_ico 		= "nlo_2",

	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/raid/boss_call2",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/raid/boss_call2",
	
	shield_activate_sound = "sound/raid/boss_shield_on",
	shield_deactivate_sound = "sound/raid/boss_shield_off",
	anger_sound = "sound/raid/boss_call2",
	anger_health_percent = { 0.7, 0.5, 0.3, 0.1 },

	broken_parts = 
	{
		{ def = "AlienDestroyer_Wreck01",  debris = false, pos = Vec3( 96, 28, -102 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R FRONT
		{ def = "AlienDestroyer_Wreck09",  debris = false, pos = Vec3( 64, 22, -14 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R BACK
		
		{ def = "AlienDestroyer_Wreck13",  debris = false, pos = Vec3( -66, 23, -9 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L BACK
		{ def = "AlienDestroyer_Wreck17",  debris = false, pos = Vec3( -97, 27, -132 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L FRONT
		
		{ def = "AlienDestroyer_Wreck02",  debris = false, pos = Vec3( 93, -24, -138 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R FRONT
		{ def = "AlienDestroyer_Wreck04",  debris = false, pos = Vec3( 93, -29, -78 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R MID
		{ def = "AlienDestroyer_Wreck10",  debris = false, pos = Vec3( 67, -23, -16 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R BACK
		
		{ def = "AlienDestroyer_Wreck14",  debris = false, pos = Vec3( -68, -24, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L BACK
		{ def = "AlienDestroyer_Wreck18",  debris = false, pos = Vec3( -98, -28, -96 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L FRONT
		
		--бошка
		{ def = "AlienDestroyer_Wreck11",  debris = false, pos = Vec3( 23, 0, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА R
		{ def = "AlienDestroyer_Wreck12",  debris = false, pos = Vec3( -30, 0, -25 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА L
		
		--пропадают сразу
		{ def = "AlienDestroyer_Wreck05",  debris = false, pos = Vec3( 98, 0, -68 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник R пропадают сразу
		{ def = "AlienDestroyer_Wreck16",  debris = false, pos = Vec3( -100, 0, -69 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник L пропадают сразу
		
		--мелочь
		--{ def = "AlienDestroyer_Wreck08",  debris = false, pos = Vec3( 76, 0, -100 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- косточка R
		--{ def = "AlienDestroyer_Wreck19",  debris = false, pos = Vec3( -53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа L
		{ def = "AlienDestroyer_Wreck07",  debris = false, pos = Vec3( 53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа R
		{ def = "AlienDestroyer_Wreck06",  debris = false, pos = Vec3( 20, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа R
		{ def = "AlienDestroyer_Wreck20",  debris = false, pos = Vec3( -130, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа L
		{ def = "AlienDestroyer_Wreck03",  debris = false, pos = Vec3( 70, -22, -145 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- B R треугольник спереди
		
		--Вместо части обломки
		--{ def = "AlienDestroyer_Wreck15",  debris = false, pos = Vec3( -94, 31, -76 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- T L MID	
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( -94, 31, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -94, 31, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck04", debris = false, pos = Vec3( -94, 31, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 31, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( -94, 33, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( -94, 33, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( -94, 33, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -94, 33, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( -94, 33, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 29, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 29, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( -94, 29, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck14", debris = false, pos = Vec3( -94, 29, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck15", debris = false, pos = Vec3( -94, 29, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck16", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck17", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
	},

	children =
	{		
		{effect = "particles/ships/destroyer_engine",	joint = "root"},
		{effect = "particles/ships/destroyer_engine_small",	joint = "fx1"},
		{effect = "particles/ships/destroyer_engine_small",	joint = "fx2"},

		{ def = "Alien_Destroyer_Life_01_T5", joint = "life1" },
		{ def = "Alien_Destroyer_Life_02_T5", joint = "life2" },
		{ def = "Alien_Destroyer_Life_03_T5", joint = "life3" },
		{ def = "Alien_Destroyer_Life_04_T5", joint = "life4" },

		{ def = "Alien_Destroyer_Hearth_T5", joint = "life1" },
		{ def = "Alien_Destroyer_SmallHearth_T5", joint = "life2" },
		{ def = "Alien_Destroyer_SmallHearth_T5", joint = "life3" },
		{ def = "Alien_Destroyer_Hearth_T5", joint = "life4" },
	},

}

-- Для эвента в опенспейсе - копия с рейда pve_raid_waterharvest
Def.AlienCruiser_EventDestroyer =
{
	health 			= 1000000000,	--100M test, 1G live
	crowd_control_coef = 0,	--- #59363
	shield_def		= "Cruiser_Shield_RW_t5",

	relationship_group = ai.RelationshipGroups.Alien, -- alien
	max_lin_speed	= 5,	--20
	points_reward_kill = 300,
	points_reward_assist_damage = 9500,
	points_reward_assist_debuff = 200,
	signature		= ai.Signature.HUGE,
	path_end_deactivate	= false,	-- летает бесконечно, телепортируется с конца в начало

	uiName			= "AlienDestroyer",	--AlienCruiser
	
	class 			= "CargoShip",
	--hudType 		= "default",	-- #49787
	in_editor		= false,

	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer",
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000, },
	damageable		= false, -- теперь только через туррельки и ядра
	hudType			= "major",
	hud_visibility_type = "major", 
	vision_always = true,

	maxViewDist		= 5000,
	max_rot_speed	= 2,	-- deg per second

	death_effect	= "",
	death_wreck		= "AlienDestroyerExpl",
	death_sound		= "sound/raid/boss_death",
	work_sound      = "sound/raid/boss_engine",

	hud_ico 		= "nlo_2",

	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/raid/boss_call2",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/raid/boss_call2",
	
	shield_activate_sound = "sound/raid/boss_shield_on",
	shield_deactivate_sound = "sound/raid/boss_shield_off",
	anger_sound = "sound/raid/boss_call2",
	anger_health_percent = { 0.7, 0.5, 0.3, 0.1 },

	broken_parts = 
	{
		{ def = "AlienDestroyer_Wreck01",  debris = false, pos = Vec3( 96, 28, -102 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R FRONT
		{ def = "AlienDestroyer_Wreck09",  debris = false, pos = Vec3( 64, 22, -14 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R BACK
		
		{ def = "AlienDestroyer_Wreck13",  debris = false, pos = Vec3( -66, 23, -9 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L BACK
		{ def = "AlienDestroyer_Wreck17",  debris = false, pos = Vec3( -97, 27, -132 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L FRONT
		
		{ def = "AlienDestroyer_Wreck02",  debris = false, pos = Vec3( 93, -24, -138 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R FRONT
		{ def = "AlienDestroyer_Wreck04",  debris = false, pos = Vec3( 93, -29, -78 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R MID
		{ def = "AlienDestroyer_Wreck10",  debris = false, pos = Vec3( 67, -23, -16 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R BACK
		
		{ def = "AlienDestroyer_Wreck14",  debris = false, pos = Vec3( -68, -24, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L BACK
		{ def = "AlienDestroyer_Wreck18",  debris = false, pos = Vec3( -98, -28, -96 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L FRONT
		
		--бошка
		{ def = "AlienDestroyer_Wreck11",  debris = false, pos = Vec3( 23, 0, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА R
		{ def = "AlienDestroyer_Wreck12",  debris = false, pos = Vec3( -30, 0, -25 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА L
		
		--пропадают сразу
		{ def = "AlienDestroyer_Wreck05",  debris = false, pos = Vec3( 98, 0, -68 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник R пропадают сразу
		{ def = "AlienDestroyer_Wreck16",  debris = false, pos = Vec3( -100, 0, -69 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник L пропадают сразу
		
		--мелочь
		--{ def = "AlienDestroyer_Wreck08",  debris = false, pos = Vec3( 76, 0, -100 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- косточка R
		--{ def = "AlienDestroyer_Wreck19",  debris = false, pos = Vec3( -53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа L
		{ def = "AlienDestroyer_Wreck07",  debris = false, pos = Vec3( 53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа R
		{ def = "AlienDestroyer_Wreck06",  debris = false, pos = Vec3( 20, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа R
		{ def = "AlienDestroyer_Wreck20",  debris = false, pos = Vec3( -130, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа L
		{ def = "AlienDestroyer_Wreck03",  debris = false, pos = Vec3( 70, -22, -145 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- B R треугольник спереди
		
		--Вместо части обломки
		--{ def = "AlienDestroyer_Wreck15",  debris = false, pos = Vec3( -94, 31, -76 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- T L MID	
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( -94, 31, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -94, 31, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck04", debris = false, pos = Vec3( -94, 31, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 31, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( -94, 33, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( -94, 33, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( -94, 33, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -94, 33, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( -94, 33, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 29, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 29, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( -94, 29, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck14", debris = false, pos = Vec3( -94, 29, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck15", debris = false, pos = Vec3( -94, 29, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck16", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck17", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
	},

	children =
	{		
		{effect = "particles/ships/destroyer_engine",	joint = "root"},
		{effect = "particles/ships/destroyer_engine_small",	joint = "fx1"},
		{effect = "particles/ships/destroyer_engine_small",	joint = "fx2"},

		{ def = "Alien_Destroyer_Life_01_T5", joint = "life1" },
		{ def = "Alien_Destroyer_Life_02_T5", joint = "life2" },
		{ def = "Alien_Destroyer_Life_03_T5", joint = "life3" },
		{ def = "Alien_Destroyer_Life_04_T5", joint = "life4" },

		{ def = "Alien_Destroyer_Hearth_T5", joint = "life1" },
		{ def = "Alien_Destroyer_SmallHearth_T5", joint = "life2" },
		{ def = "Alien_Destroyer_SmallHearth_T5", joint = "life3" },
		{ def = "Alien_Destroyer_Hearth_T5", joint = "life4" },
	},

}

for i = 1, 46 do
	---if i==3 or i==5 then
		---Def.AlienCruiser_EventDestroyer.children[#Def.AlienCruiser_EventDestroyer.children+1] = { def = "RW_BlackHoleHealth_T4", joint = "gun_0"..i }
	---else
		Def.AlienCruiser_EventDestroyer.children[#Def.AlienCruiser_EventDestroyer.children+1] = { def = "Turret_CruiserAlien_T4L", joint = "gun_0"..i }
		Def.AlienCruiser_EventDestroyer.children[#Def.AlienCruiser_EventDestroyer.children+1] = { def = "Turret_CruiserAlien_OW", joint = "gun_0"..i }
	---end
end

for i = 1, 10 do
	s = ""
	if i<=4 then
		s = "_Life_0"..i
		Def.AlienCruiser_EventDestroyer.children[#Def.AlienCruiser_EventDestroyer.children+1] = { def = "Turret_CruiserAlien_MegaLaser"..s, joint = "life"..i }
	else
		Def.AlienCruiser_EventDestroyer.children[#Def.AlienCruiser_EventDestroyer.children+1] = { def = "Turret_CruiserAlien_MegaLaser", joint = "life"..i.."_gun" }
	end
end


Def.AlienCruiserCompaign = 
{
	relationship_group = ai.RelationshipGroups.Alien, -- alien
	health 			= 70000000,
	crowd_control_coef = 0,	--- #59363
	--health 			= 50,
	max_lin_speed	= 12,
	points_reward_kill = 300,
	points_reward_assist_damage = 9500,
	points_reward_assist_debuff = 200,
	signature		= ai.Signature.HUGE,

	uiName			= "AlienCruiser",
	
	class 			= "CargoShip",
	hudType 		= "default",	-- #49787
	in_editor		= false,
	model			= "models/objects/ships_huge/prec_cruiser/prec_cruiser",

	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000, },
	damageable		= true,

	maxViewDist		= 3000,
	max_rot_speed	= 2,	-- deg per second

	death_effect	= "",
	death_sound		= "sound/raid/boss_death",
	work_sound      = "sound/raid/boss_engine",
	death_wreck		= "AlienCruiserExpl",

	hud_ico 		= "nlo_2",

	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/raid/boss_call",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/raid/boss_call",
	
	anger_sound = "sound/raid/boss_call",
	anger_health_percent = { 0.85, 0.7, 0.5, 0.3, 0.15, 0.05 },

	broken_parts = 
	{
		{ def = "AlienCruiser_Wreck1",	debris = false, pos = Vec3( 0, 89, -29 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.075, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck2", 	debris = false, pos = Vec3( 13, 52, -32 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck3",  debris = false, pos = Vec3( 7, -7, -40 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.05, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck4",  debris = false, pos = Vec3( -19, -12, -46 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.1, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck5",  debris = false, pos = Vec3( 25, 12, -36 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		--{ def = "AlienCruiser_Wreck6",  debris = false, pos = Vec3( -15, 45, -22 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck7",  debris = false, pos = Vec3( 0, -45, -61 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.1, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck8",  debris = false, pos = Vec3( 0, -89, -17 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck9",  debris = false, pos = Vec3( 0, 12, 12 ), angle = 360,ang_speed_deviation = 0.01, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck10",  debris = false, pos = Vec3( 0, 12, 22 ), angle = 360,ang_speed_deviation = 0.01, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		--
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -2, 10, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -4, -10, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		--
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -43, 20, -42 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( -25, 45, -22 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( -41, 20, -41 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -15, 3, -42 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( 15, 3, -42 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -15, 40, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( 15, 40, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( 0, 31, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0.05, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( 0, -5, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
	},
	
	children =
	{		
		{ def = "Turret_CruiserAlienSmall", joint = "gun_1" },
		{ def = "Turret_CruiserAlienSmall", joint = "gun_2" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_3" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_4" },
		{ def = "Turret_CruiserAlien", joint = "gun_5" },
		{ def = "Turret_CruiserAlien", joint = "gun_6" },
		{ def = "TurretPlasma_CruiserAlien", joint = "gun_7" },
		{ def = "TurretPlasma_CruiserAlien", joint = "gun_8" },
		{ def = "Turret_CruiserAlien", joint = "gun_9" },
		{ def = "Turret_CruiserAlien", joint = "gun_10" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_11" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_12" },
		{ def = "Turret_CruiserAlienSmall", joint = "gun_13" },
		{ def = "Turret_CruiserAlienSmall", joint = "gun_14" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_15" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_16" },

		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_17" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_18" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_19" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_20" },

		{def = "PrecCruiserEngine",	joint = "engine_1"},
		{effect = "particles/objects/prec_cruiser_engine_aura",	joint = "engine_1"},
		{def = "PrecCruiserEngineEx",	joint = "exhaust_1"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_2"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_2"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_3"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_3"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_4"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_4"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_5"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_5"},
		{def = "PrecCruiserTrail",	joint = "exhaust_1"},
		{def = "PrecCruiserTrail",	joint = "exhaust_2"},
		{def = "PrecCruiserTrail",	joint = "exhaust_3"},
		{def = "PrecCruiserTrail",	joint = "exhaust_4"},
		{def = "PrecCruiserTrail",	joint = "exhaust_5"},

		-- кости fx с 1 по 6 пока сделал как движки
		{def = "PrecCruiserEngineExSmall",	joint = "fx_1"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_2"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_3"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_4"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_5"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_6"},
		{def = "PrecCruiserTrail",	joint = "fx_1"},
		{def = "PrecCruiserTrail",	joint = "fx_2"},
		{def = "PrecCruiserTrail",	joint = "fx_3"},
		{def = "PrecCruiserTrail",	joint = "fx_4"},
		{def = "PrecCruiserTrail",	joint = "fx_5"},
		{def = "PrecCruiserTrail",	joint = "fx_6"},

	},

}

Def.EventAlienCruiser = 
{
	inherit				= "AlienCruiserCompaign",
	health 				= 500000,
	plasma_damage_mul	= -200,
	railgun_damage_mul	= -200,
	laser_damage_mul 	= -200,
	children =
	{		
		{ def = "Turret_EventCruiserAlienSmall", joint = "gun_1" },
		{ def = "Turret_EventCruiserAlienSmall", joint = "gun_2" },
		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_3" },
		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_4" },
		{ def = "Turret_EventCruiserAlien", joint = "gun_5" },
		{ def = "Turret_EventCruiserAlien", joint = "gun_6" },
		{ def = "TurretPlasma_EventCruiserAlien", joint = "gun_7" },
		{ def = "TurretPlasma_EventCruiserAlien", joint = "gun_8" },
		{ def = "Turret_EventCruiserAlien", joint = "gun_9" },
		{ def = "Turret_EventCruiserAlien", joint = "gun_10" },
		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_11" },
		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_12" },
		{ def = "Turret_EventCruiserAlienSmall", joint = "gun_13" },
		{ def = "Turret_EventCruiserAlienSmall", joint = "gun_14" },
		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_15" },
		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_16" },

		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_17" },
		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_18" },
		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_19" },
		{ def = "TurretPlasma_EventCruiserAlienSmall", joint = "gun_20" },
	}
}

Def.AlienDestroyer_Wreck01 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_01",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx4"},
				},
}

Def.AlienDestroyer_Wreck02 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_02",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
				},
}

Def.AlienDestroyer_Wreck03 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_03",
}

Def.AlienDestroyer_Wreck04 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_04",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs_big",	joint = "fx1"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
				},
}

Def.AlienDestroyer_Wreck05 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	--physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_05",
    death_fade_time = 2.0,
}
Def.AlienDestroyer_Wreck06 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_06",
}
Def.AlienDestroyer_Wreck07 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_07",
}
Def.AlienDestroyer_Wreck08 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_08",
}
Def.AlienDestroyer_Wreck09 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_09",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs_big",	joint = "fx1"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
				},
}
Def.AlienDestroyer_Wreck10 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_10",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
				},
}
Def.AlienDestroyer_Wreck11 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_11",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx4"},
				},
}
Def.AlienDestroyer_Wreck12 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_12",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs_big",	joint = "fx2"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx4"},
				},
}
Def.AlienDestroyer_Wreck13 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_13",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
				},
}
Def.AlienDestroyer_Wreck14 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_14",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
				},
}
Def.AlienDestroyer_Wreck15 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_15",
}
Def.AlienDestroyer_Wreck16 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	--physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_16",
    death_fade_time = 2.0,
}
Def.AlienDestroyer_Wreck17 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_17",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
				},
}
Def.AlienDestroyer_Wreck18 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_18",
	children = 	{
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx4"},
					{effect = "particles/explosions/objects/brokenparts_alien_fireballs_big",	joint = "fx5"},
				},
}
Def.AlienDestroyer_Wreck19 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_19",
}
Def.AlienDestroyer_Wreck20 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_20",
}



Def.AlienCruiser_t4 =
{
	health 			= 55000000,
	crowd_control_coef = 0,	--- #59363
	shield_def		= "Cruiser_Shield_RW_t4",

	relationship_group = ai.RelationshipGroups.Alien, -- alien
	max_lin_speed	= 20,
	points_reward_kill = 300,
	points_reward_assist_damage = 9500,
	points_reward_assist_debuff = 200,
	signature		= ai.Signature.HUGE,

	uiName			= "AlienDestroyer",	--AlienCruiser
	
	class 			= "CargoShip",
	--hudType 		= "default",	-- #49787
	in_editor		= false,

	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer",
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000, },
	damageable		= false,

	maxViewDist		= 3000,
	max_rot_speed	= 2,	-- deg per second

	death_effect	= "",
	death_wreck		= "AlienDestroyerExpl",
	death_sound		= "sound/raid/boss_death",
	work_sound      = "sound/raid/boss_engine",

	hud_ico 		= "nlo_2",

	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/raid/boss_call2",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/raid/boss_call2",
	
	shield_activate_sound = "sound/raid/boss_shield_on",
	shield_deactivate_sound = "sound/raid/boss_shield_off",
	anger_sound = "sound/raid/boss_call2",
	anger_health_percent = { 0.7, 0.5, 0.3, 0.1 },

	broken_parts = 
	{
		{ def = "AlienDestroyer_Wreck01",  debris = false, pos = Vec3( 96, 28, -102 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R FRONT
		{ def = "AlienDestroyer_Wreck09",  debris = false, pos = Vec3( 64, 22, -14 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R BACK
		
		{ def = "AlienDestroyer_Wreck13",  debris = false, pos = Vec3( -66, 23, -9 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L BACK
		{ def = "AlienDestroyer_Wreck17",  debris = false, pos = Vec3( -97, 27, -132 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L FRONT
		
		{ def = "AlienDestroyer_Wreck02",  debris = false, pos = Vec3( 93, -24, -138 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R FRONT
		{ def = "AlienDestroyer_Wreck04",  debris = false, pos = Vec3( 93, -29, -78 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R MID
		{ def = "AlienDestroyer_Wreck10",  debris = false, pos = Vec3( 67, -23, -16 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R BACK
		
		{ def = "AlienDestroyer_Wreck14",  debris = false, pos = Vec3( -68, -24, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L BACK
		{ def = "AlienDestroyer_Wreck18",  debris = false, pos = Vec3( -98, -28, -96 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L FRONT
		
		--бошка
		{ def = "AlienDestroyer_Wreck11",  debris = false, pos = Vec3( 23, 0, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА R
		{ def = "AlienDestroyer_Wreck12",  debris = false, pos = Vec3( -30, 0, -25 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА L
		
		--пропадают сразу
		{ def = "AlienDestroyer_Wreck05",  debris = false, pos = Vec3( 98, 0, -68 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник R пропадают сразу
		{ def = "AlienDestroyer_Wreck16",  debris = false, pos = Vec3( -100, 0, -69 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник L пропадают сразу
		
		--мелочь
		--{ def = "AlienDestroyer_Wreck08",  debris = false, pos = Vec3( 76, 0, -100 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- косточка R
		--{ def = "AlienDestroyer_Wreck19",  debris = false, pos = Vec3( -53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа L
		{ def = "AlienDestroyer_Wreck07",  debris = false, pos = Vec3( 53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа R
		{ def = "AlienDestroyer_Wreck06",  debris = false, pos = Vec3( 20, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа R
		{ def = "AlienDestroyer_Wreck20",  debris = false, pos = Vec3( -130, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа L
		{ def = "AlienDestroyer_Wreck03",  debris = false, pos = Vec3( 70, -22, -145 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- B R треугольник спереди
		
		--Вместо части обломки
		--{ def = "AlienDestroyer_Wreck15",  debris = false, pos = Vec3( -94, 31, -76 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- T L MID	
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( -94, 31, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -94, 31, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck04", debris = false, pos = Vec3( -94, 31, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 31, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( -94, 33, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( -94, 33, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( -94, 33, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -94, 33, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( -94, 33, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 29, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 29, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( -94, 29, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck14", debris = false, pos = Vec3( -94, 29, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck15", debris = false, pos = Vec3( -94, 29, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck16", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck17", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
	},
	
	children =
	{		
		{effect = "particles/ships/destroyer_engine",	joint = "root"},
		{effect = "particles/ships/destroyer_engine_small",	joint = "fx1"},
		{effect = "particles/ships/destroyer_engine_small",	joint = "fx2"},

		{ def = "Alien_Destroyer_Life_01_T4", joint = "life1" },
		{ def = "Alien_Destroyer_Life_02_T4", joint = "life2" },
		{ def = "Alien_Destroyer_Life_03_T4", joint = "life3" },
		{ def = "Alien_Destroyer_Life_04_T4", joint = "life4" },

		{ def = "Alien_Destroyer_Hearth_T4", joint = "life1" },
		{ def = "Alien_Destroyer_SmallHearth_T4", joint = "life2" },
		{ def = "Alien_Destroyer_SmallHearth_T4", joint = "life3" },
		{ def = "Alien_Destroyer_Hearth_T4", joint = "life4" },
	},
}

for i = 1, 46 do
	if i==3 or i==5 then
		Def.AlienCruiser_t3.children[#Def.AlienCruiser_t3.children+1] = { def = "RW_BlackHoleHealth_T3", joint = "gun_0"..i }
		Def.AlienCruiser_t4.children[#Def.AlienCruiser_t4.children+1] = { def = "RW_BlackHoleHealth_T4", joint = "gun_0"..i }
		Def.AlienCruiser_t5.children[#Def.AlienCruiser_t5.children+1] = { def = "RW_BlackHoleHealth_T5", joint = "gun_0"..i }

		--Def.AlienCruiser_t3.children[#Def.AlienCruiser_t3.children+1] = { effect = "particles/objects/prec_ship_purple", joint = "gun_0"..i }
		--Def.AlienCruiser_t4.children[#Def.AlienCruiser_t4.children+1] = { effect = "particles/objects/prec_ship_purple", joint = "gun_0"..i }
		--Def.AlienCruiser_t5.children[#Def.AlienCruiser_t5.children+1] = { effect = "particles/objects/prec_ship_purple", joint = "gun_0"..i }
	else
		Def.AlienCruiser_t3.children[#Def.AlienCruiser_t3.children+1] = { def = "Turret_CruiserAlien_T3L", joint = "gun_0"..i }
		Def.AlienCruiser_t3.children[#Def.AlienCruiser_t3.children+1] = { def = "Turret_CruiserAlien_T3R", joint = "gun_0"..i }

		Def.AlienCruiser_t4.children[#Def.AlienCruiser_t4.children+1] = { def = "Turret_CruiserAlien_T4L", joint = "gun_0"..i }
		Def.AlienCruiser_t4.children[#Def.AlienCruiser_t4.children+1] = { def = "Turret_CruiserAlien_T4R", joint = "gun_0"..i }

		Def.AlienCruiser_t5.children[#Def.AlienCruiser_t5.children+1] = { def = "Turret_CruiserAlien_T5L", joint = "gun_0"..i }
		Def.AlienCruiser_t5.children[#Def.AlienCruiser_t5.children+1] = { def = "Turret_CruiserAlien_T5R", joint = "gun_0"..i }
	end
end

for i = 1, 10 do
	s = ""
	if i<=4 then
		s = "_Life_0"..i
		Def.AlienCruiser_t3.children[#Def.AlienCruiser_t3.children+1] = { def = "Turret_CruiserAlien_MegaLaser"..s, joint = "life"..i }
		Def.AlienCruiser_t4.children[#Def.AlienCruiser_t4.children+1] = { def = "Turret_CruiserAlien_MegaLaser"..s, joint = "life"..i }
		Def.AlienCruiser_t5.children[#Def.AlienCruiser_t5.children+1] = { def = "Turret_CruiserAlien_MegaLaser"..s, joint = "life"..i }
	else
		-- if i<=8 then
			-- Def.AlienCruiser_t3.children[#Def.AlienCruiser_t3.children+1] = { def = "VitalPoint_ShieldPortal_RW", joint = "life"..i.."_gun" }
			-- Def.AlienCruiser_t4.children[#Def.AlienCruiser_t4.children+1] = { def = "VitalPoint_ShieldPortal_RW", joint = "life"..i.."_gun" }
			-- Def.AlienCruiser_t5.children[#Def.AlienCruiser_t5.children+1] = { def = "VitalPoint_ShieldPortal_RW", joint = "life"..i.."_gun" }

			--Def.AlienCruiser_t3.children[#Def.AlienCruiser_t3.children+1] = { effect = "particles/objects/prec_ship_purple", joint = "life"..i.."_gun" }
			--Def.AlienCruiser_t4.children[#Def.AlienCruiser_t4.children+1] = { effect = "particles/objects/prec_ship_purple", joint = "life"..i.."_gun" }
			--Def.AlienCruiser_t5.children[#Def.AlienCruiser_t5.children+1] = { effect = "particles/objects/prec_ship_purple", joint = "life"..i.."_gun" }
		--end

		Def.AlienCruiser_t3.children[#Def.AlienCruiser_t3.children+1] = { def = "Turret_CruiserAlien_MegaLaser", joint = "life"..i.."_gun" }
		Def.AlienCruiser_t4.children[#Def.AlienCruiser_t4.children+1] = { def = "Turret_CruiserAlien_MegaLaser", joint = "life"..i.."_gun" }
		Def.AlienCruiser_t5.children[#Def.AlienCruiser_t5.children+1] = { def = "Turret_CruiserAlien_MegaLaser", joint = "life"..i.."_gun" }
	end
end

Def.AlienCruiser_Wreck1 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck1",
	children = 
	{
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
	},
}
Def.AlienCruiser_Wreck2 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck2",
	children = 
	{
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
	},
}
Def.AlienCruiser_Wreck3 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck3",
	children = 
	{
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs_big",	joint = "fx1"},
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx3"},
	},
}
Def.AlienCruiser_Wreck4 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck4",
	children = 
	{
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx2"},
	},
}
Def.AlienCruiser_Wreck5 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck5",
	death_fade_time = 2.0,
}
Def.AlienCruiser_Wreck6 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck6",
	children = 
	{
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
	},
}
Def.AlienCruiser_Wreck7 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck7",
	children = 
	{
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs",	joint = "fx1"},
	},
}
Def.AlienCruiser_Wreck8 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck8",
	children = 
	{
		{effect = "particles/explosions/objects/brokenparts_alien_fireballs_big",	joint = "fx1"},
	},
}
Def.AlienCruiser_Wreck9 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck9",
	death_fade_time 	= 2.0,
}
Def.AlienCruiser_Wreck10 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck10",
	death_fade_time 	= 1.75,
}

-- десантный корабль игроков для frozen_station
Def.DescentCargoTeam1_T2 =
{
	inherit		= "CargoShip",
	relationship_group = 1,
	health 			= 150000,	--- #62763 у ботов ракеты, было 100к
	max_lin_speed	= 12,
	max_rot_speed	= 5,	-- deg per second

	uiName			= "DescentCargo",
	hud_ico 		= "hud_cargo_ship_icon",
}

Def.DescentCargoTeam1_T4 =
{
	inherit		= "DescentCargoTeam1_T2",
	health 			= 300000,
}

-- эвентовый дрон, который является по сути секретными документами
Def.EventDrone =
{
	inherit			= "CargoShip",
	signature		= ai.Signature.MEDIUM,
	relationship_group = ai.RelationshipGroups.Alien,
	health 			= 75000,
	max_lin_speed	= 10,
	
	damageable		= false,
	
	interaction 	= true,
	loot_items 		= {"Loot_SecretDocument_Legion", "Loot_SecretDocument_Warden", "Loot_SecretDocument_Armada", "Loot_SecretDocument_Avangard", "Loot_SecretDocument_Raid", "Loot_SecretDocument_Technologist"},

	uiName			= "EventDrone",
	hud_ico 		= "secretDocs",	-- чтобы было понятно, что это надо лутать, а не стрелять
	model			= "models/objects/ships_huge/prec_ship/prec_drone2", 
	physics			= { solid_type = solid.model, material = "ShipMetalMk1", mass = 1000, },
}

-- тестовый каргошип, увеличенный в 2 раза
Def.TestHugeCargo =
{
	inherit			= "CargoShip",
	health 			= 600000,
	--health 			= 1000,
	max_lin_speed	= 10,
	max_rot_speed	= 2,
	damageable		= true,
	in_editor		= false,
	death_effect	= "particles/explosions/objects/freighter_pirat_explosion",
	dying_health_percent = 0.1,
	dying_effect 	= "particles/explosions/objects/dying_fire",
	
	hudType 		= "default",
	death_wreck		= "",
	
	uiName			= "CargoShip_pirate",
	hud_ico 		= "boss_station",
	model			= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat", 
	children =
	{		
		{ def = "Pirate_Barge_Engine",	joint = "dvig1",	},
		{ def = "Pirate_Barge_Engine",	joint = "dvig2",	},
		{ def = "Pirate_Barge_Engine",	joint = "dvig3",	},
		{ def = "Pirate_Barge_Engine",	joint = "dvig4",	},		
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun1" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun2" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun3" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun4" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun5" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun6" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun7" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun8" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun9" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun10" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun11" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun12" },		
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun13" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun14" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun15" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun16" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun17" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun18" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun19" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun20" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun21" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun22" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun23" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun24" },
		{ effect = "particles/ships/cargo_antenna", joint = "fx1" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx2" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx3" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx4" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx5" },
		{ def = "AuraReactorHurt", joint = "zone_trigger" },
		--{ effect = "particles/explosions/objects/freighter_pirat_explosion2", joint = "root" },
	},

	broken_parts = 
	{
		-- front
		{ def = "Pirate_Barge_Wreck2",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--big front
		{ def = "Pirate_Barge_Wreck5",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, }, --front big half
		-- back
		{ def = "Pirate_Barge_Wreck6",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--big back
		{ def = "Pirate_Barge_Wreck9",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--back
		-- mid 
		{ def = "Pirate_Barge_Wreck7",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--mid top
		{ def = "Pirate_Barge_Wreck10",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--mid side
		-- barrels right
		{ def = "Pirate_Barge_Wreck21",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck22",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck23",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		-- barrels left
		{ def = "Pirate_Barge_Wreck24",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck25",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		-- mid top debris
		{ def = "Pirate_Barge_Wreck28",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		

		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -35, 0, -60 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -30, 5, -30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -30, -15, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -30, -25, 30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 35, 0, -60 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 30, -20, -30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 30, 0, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 30, -10, 30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, 20, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, -45, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, -45, 60 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, 0, -150 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, 0, 150 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		
		{ def = "Pirate_Barge_WreckDebris2",  debris = false, pos = Vec3( 0, -60, -15 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris2",  debris = false, pos = Vec3( 0, -60, -15 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
	},	
}

-- Пиратская баржа для волнового ПвЕ
Def.PvE_wave_HugeCargo_T1 =
{
	inherit			= "PvE_wave_HugeCargo_T3",
	health 			= 500000,
	
	damageable_groups =
	{
		[ ai.DamageableGroup.ENGINE1 ] =
		{
			{ def = "Pirate_Barge_Engine_T1", joint = "dvig1", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T1", joint = "dvig2", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T1", joint = "dvig3", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T1", joint = "dvig4", }, -- двигатель без звука
			{ def = "Pirate_Barge_EngineSound", joint = "dvig4" }, -- звук отдельно
		 -- здесь энтити со звуком уничтожится автоматически после уничтожения последнего двигателя
		}
	},	
	
	children =
	{			
		{ def = "Turret_Pirate_Barge_JerTurret_T1", joint = "gun1" },
		{ def = "Turret_Pirate_Barge_JerTurret_T1", joint = "gun2" },	
		{ def = "Turret_Pirate_Barge_JerTurret_T1", joint = "gun3" },
		{ def = "Turret_Pirate_Barge_JerTurret_T1", joint = "gun4" },	
		{ def = "Turret_Pirate_Barge_JerTurret_T1", joint = "gun5" },
		{ def = "Turret_Pirate_Barge_JerTurret_T1", joint = "gun6" },	
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun7" },
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun8" },	
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun9" },
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun10" },	
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun11" },
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun12" },		
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun13" },
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun14" },	
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun15" },
		{ def = "Turret_Pirate_Barge_Rocket_T1", joint = "gun16" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T1", joint = "gun17" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T1", joint = "gun18" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T1", joint = "gun19" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T1", joint = "gun20" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T1", joint = "gun21" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T1", joint = "gun22" },
		{ def = "AuraEngineHurt_T1", joint = "big_trigger" },		
		{ effect = "particles/ships/cargo_antenna", joint = "fx1" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx2" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx3" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx4" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx5" },
		{ def = "AuraReactorHurt", joint = "zone_trigger" },
	},
}

Def.PvE_wave_HugeCargo_T0 =
{
	inherit			= "PvE_wave_HugeCargo_T3",
	health 			= 180000,
	
	damageable_groups =
	{
		[ ai.DamageableGroup.ENGINE1 ] =
		{
			{ def = "Pirate_Barge_Engine_T0", joint = "dvig1", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T0", joint = "dvig2", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T0", joint = "dvig3", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T0", joint = "dvig4", }, -- двигатель без звука
			{ def = "Pirate_Barge_EngineSound", joint = "dvig4" }, -- звук отдельно
		 -- здесь энтити со звуком уничтожится автоматически после уничтожения последнего двигателя
		}
	},	
	
	children =
	{			
		{ def = "Turret_Pirate_Barge_JerTurret_T0", joint = "gun1" },
		{ def = "Turret_Pirate_Barge_JerTurret_T0", joint = "gun2" },	
		{ def = "Turret_Pirate_Barge_JerTurret_T0", joint = "gun3" },
		{ def = "Turret_Pirate_Barge_JerTurret_T0", joint = "gun4" },	
		{ def = "Turret_Pirate_Barge_JerTurret_T0", joint = "gun5" },
		{ def = "Turret_Pirate_Barge_JerTurret_T0", joint = "gun6" },	
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun7" },
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun8" },	
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun9" },
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun10" },	
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun11" },
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun12" },		
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun13" },
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun14" },	
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun15" },
		{ def = "Turret_Pirate_Barge_Rocket_T0", joint = "gun16" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T0", joint = "gun17" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T0", joint = "gun18" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T0", joint = "gun19" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T0", joint = "gun20" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T0", joint = "gun21" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T0", joint = "gun22" },
		{ def = "AuraEngineHurt_T1", joint = "big_trigger" },		
		{ effect = "particles/ships/cargo_antenna", joint = "fx1" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx2" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx3" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx4" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx5" },
		{ def = "AuraReactorHurt", joint = "zone_trigger" },
	},
}

Def.PvE_wave_HugeCargo_T3 =
{
	inherit			= "CargoShip",
	health 			= 2000000,
	crowd_control_coef = 0,	--- #59363
	max_lin_speed	= 1000,
	lin_acceleration = 99999,
	max_rot_speed	= 2,
	damageable		= true,
	in_editor		= false,
	death_effect	= "particles/explosions/objects/freighter_pirat_explosion",
	dying_health_percent = 0.2,
	dying_effect 	= "particles/explosions/objects/dying_fire",
	trail_effect 	= "",
	
	hudType 		= "default",
	death_wreck		= "",
	target_def = "Helpers_DistPoint", -- #73847
	
	uiName			= "CargoShip_pirate",
	hud_ico 		= "boss_station",
	model			= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat", 
	
	damageable_groups =
	{
		[ ai.DamageableGroup.ENGINE1 ] =
		{
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig1", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig2", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig3", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig4", }, -- двигатель без звука
			{ def = "Pirate_Barge_EngineSound", joint = "dvig4" }, -- звук отдельно
		 -- здесь энтити со звуком уничтожится автоматически после уничтожения последнего двигателя
		}
	},	
	
	children =
	{			
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun1" },
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun2" },	
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun3" },
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun4" },	
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun5" },
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun6" },	
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun7" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun8" },	
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun9" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun10" },	
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun11" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun12" },		
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun13" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun14" },	
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun15" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun16" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun17" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun18" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun19" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun20" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun21" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun22" },	
		{ def = "AuraEngineHurt", joint = "big_trigger" },	
		{ effect = "particles/ships/cargo_antenna", joint = "fx1" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx2" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx3" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx4" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx5" },
		{ def = "AuraReactorHurt", joint = "zone_trigger" },
	},

	broken_parts = 
	{
		-- front
		{ def = "Pirate_Barge_Wreck2",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--big front
		{ def = "Pirate_Barge_Wreck5",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, }, --front big half
		-- back
		{ def = "Pirate_Barge_Wreck6",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--big back
		{ def = "Pirate_Barge_Wreck9",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--back
		-- mid 
		{ def = "Pirate_Barge_Wreck7",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--mid top
		{ def = "Pirate_Barge_Wreck10",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--mid side
		-- barrels right
		{ def = "Pirate_Barge_Wreck21",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck22",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck23",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		-- barrels left
		{ def = "Pirate_Barge_Wreck24",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck25",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		-- mid top debris
		{ def = "Pirate_Barge_Wreck28",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		

		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -35, 0, -60 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -30, 5, -30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -30, -15, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -30, -25, 30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 35, 0, -60 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 30, -20, -30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 30, 0, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 30, -10, 30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, 20, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, -45, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, -45, 60 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, 0, -150 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, 0, 150 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		
		{ def = "Pirate_Barge_WreckDebris2",  debris = false, pos = Vec3( 0, -60, -15 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris2",  debris = false, pos = Vec3( 0, -60, -15 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
	},	
}

Def.PvE_wave_HugeCargo_T5 =
{
	inherit			= "PvE_wave_HugeCargo_T3",
	health 			= 3600000,
	
	damageable_groups =
	{
		[ ai.DamageableGroup.ENGINE1 ] =
		{
			{ def = "Pirate_Barge_Engine_T5", joint = "dvig1", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T5", joint = "dvig2", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T5", joint = "dvig3", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T5", joint = "dvig4", }, -- двигатель без звука
			{ def = "Pirate_Barge_EngineSound", joint = "dvig4" }, -- звук отдельно
		 -- здесь энтити со звуком уничтожится автоматически после уничтожения последнего двигателя
		}
	},		
	
	children =
	{			
		{ def = "Turret_Pirate_Barge_JerTurret_T5", joint = "gun1" },
		{ def = "Turret_Pirate_Barge_JerTurret_T5", joint = "gun2" },
		{ def = "Turret_Pirate_Barge_JerTurret_T5", joint = "gun3" },
		{ def = "Turret_Pirate_Barge_JerTurret_T5", joint = "gun4" },
		{ def = "Turret_Pirate_Barge_JerTurret_T5", joint = "gun5" },
		{ def = "Turret_Pirate_Barge_JerTurret_T5", joint = "gun6" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun7" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun8" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun9" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun10" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun11" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun12" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun13" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun14" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun15" },
		{ def = "Turret_Pirate_Barge_Rocket_T5", joint = "gun16" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T5", joint = "gun17" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T5", joint = "gun18" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T5", joint = "gun19" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T5", joint = "gun20" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T5", joint = "gun21" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T5", joint = "gun22" },
		{ def = "AuraEngineHurt", joint = "big_trigger" },
		{ effect = "particles/ships/cargo_antenna", joint = "fx1" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx2" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx3" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx4" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx5" },
		{ def = "AuraReactorHurt", joint = "zone_trigger" },
	},
}

Def.EngineHurt =
{
	inherit				=	"TriggerHurt",
	in_editor			=	false,
	spell_on_spawn		= "Plasma_beem",
	
	uiName				= "ReiderBargeEngine",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 14.0, 180.0, 14.0 ),
	max_dps				= 4000,
	min_dps				= 4000,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
}

Def.EngineHurt_T1 =
{
	inherit				=	"TriggerHurt",
	in_editor			=	false,
	spell_on_spawn		= "Plasma_beem",
	
	uiName				= "ReiderBargeEngine",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 14.0, 180.0, 14.0 ),
	max_dps				= 400,
	min_dps				= 400,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
}


Def.AuraEngineHurt =
{
	inherit				=	"TriggerHurt",
	in_editor			=	false,
	---spell_on_spawn		= "Plasma_beem", -- триггерхарты не умеют такое
	
	uiName				= "ReiderBargeEngine",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 70.0, 110.0, 70.0 ),
	max_dps				= 1000,
	min_dps				= 2000,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
	children 			= 	{
								{effect = "particles/areal/radiation_engine_haze",	joint = "root"},
							},
}

Def.AuraEngineHurt_T1 =
{
	inherit				=	"TriggerHurt",
	in_editor			=	false,
	---spell_on_spawn		= "Plasma_beem", -- триггерхарты не умеют такое
	
	uiName				= "ReiderBargeEngine",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 70.0, 110.0, 70.0 ),
	max_dps				= 200,
	min_dps				= 200,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
	children 			= 	{
								{effect = "particles/areal/radiation_engine_haze",	joint = "root"},
							},
}

Def.AuraReactorHurt =
{
	inherit				= "TriggerHurt",
	in_editor			= false,
	
	uiName				= "OAA_MainGenerator_name",
	touch_sound 		= "sound/hit/s8256_plasma_hit",
	box_dimensions 		= Vec3( 45.0, 50.0, 100.0 ),
	max_dps				= 120,
	min_dps				= 120,
	damage_type			= 3,
	physics				= { solid_type = solid.none, static = false, kinematic = true, },
	children =
	{
		{ effect = "particles/areal/radiation_cargoship_haze",	joint = "root" },
	},
}

-- FREIGHTRER IMPER WRECKS
-- Main
Def.Pirate_Barge_Wreck1 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_02",
}
Def.Pirate_Barge_Wreck2 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_02",
	children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx1"},
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx2"},
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx3"},
							},
}
Def.Pirate_Barge_Wreck5 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_05",
	children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx1"},
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx2"},
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx3"},
							},
}
Def.Pirate_Barge_Wreck6 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_06",
	children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx1"},
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx2"},
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx3"},
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx4"},
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx5"},
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx6"},
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx7"},
							},
}
Def.Pirate_Barge_Wreck9 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_09",
	children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx1"},
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx2"},
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx3"},
							},
}
Def.Pirate_Barge_Wreck7 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_07",
}
Def.Pirate_Barge_Wreck10 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_10",
}

-- Barrels
Def.Pirate_Barge_Wreck21 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_21",
	children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx1"},
							},
}
Def.Pirate_Barge_Wreck22 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_21",
	children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx2"},
							},
}
Def.Pirate_Barge_Wreck23 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_21",
		children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx3"},
							},
}
Def.Pirate_Barge_Wreck24 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_26",
	children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx1"},
							},
}
Def.Pirate_Barge_Wreck25 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_26",
	children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs_big",	joint = "fx2"},
							},
}
Def.Pirate_Barge_Wreck26 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_26",
			children 			= 	{
								{effect = "particles/explosions/objects/brokenparts_fireballs",	joint = "fx3"},
							},
}

Def.Pirate_Barge_Wreck28 =
{
	inherit				= "Pirate_Barge_Wreck1",
	model				= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_wreck_28",
}
---
Def.Pirate_Barge_Engine_T1 = 
{
	inherit					= "Pirate_Barge_Engine_T3",
	death_damage_to_parent	= 15000,
	health					= 25000,
	children =
	{		
		{ effect = "particles/ships/engine_cargo_mid",	joint = "dvig1", },	
		{ def = "EngineHurt_T1",	joint = "triger",	},	
	},	
}

Def.Pirate_Barge_Engine_T0 = 
{
	inherit					= "Pirate_Barge_Engine_T3",
	death_damage_to_parent	= 6000,
	health					= 10000,

	children =
	{		
		{ effect = "particles/ships/engine_cargo_mid",	joint = "dvig1", },	
		{ def = "EngineHurt_T1",	joint = "triger",	},	
	},	
}

Def.Pirate_Barge_Engine_T3 =
{
	class 			= "ScBaseEntity",
	spell_aura_target = true, ---#66194
	hack_immune		= true, -- #71642
	signature		= ai.Signature.HUGE,

	in_editor		= false,
		
	model			= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_dvigatel",
	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "Metal", mass = 1000, }, 
	damageable		= true,
	hudType			= "default",
	death_damage_to_parent	= 100000,
	health			= 75000,
	wreck			= "Pirate_Barge_EngineWreck",
	maxViewDist 	= 5000,
	uiName			= "ReiderBargeEngine",

	death_effect	= "particles/explosions/objects/explosion_mid",
	death_sound		= "sound/explosion/turret_expl",
	--work_sound	= "sound/engine/pirate_ship_engine",			
	
	children =
	{		
		{ effect = "particles/ships/engine_cargo_mid",	joint = "dvig1", },	
		{ def = "EngineHurt",	joint = "triger",	},	
	},	
}

Def.Pirate_Barge_Engine_T5 = 
{
	inherit					= "Pirate_Barge_Engine_T3",
	death_damage_to_parent	= 100000,
	health					= 150000,
}

Def.Pirate_Barge_Engine_OW =
{
	inherit 		= "Pirate_Barge_Engine_T3",
	death_damage_to_parent 	= 100000,
	respawn_time	= 90,
}


Def.Pirate_Barge_EngineSound =
{
	class 			= "ScBaseEntity",
	work_sound		= "sound/engine/pirate_ship_engine",		
}

Def.Pirate_Barge_EngineWreck =
{
	class 			= "ScBaseEntity",
	in_editor		= false,
		
	model			= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_dvigatel_wreck_2",
	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "Metal", mass = 1000,  }, 
	damageable		= false,
	maxViewDist 	= 5000,
	uiName			= "BeaconA",
	children =
	{		
		{ effect = "particles/explosions/objects/freighter_pirat_dead_engine", joint = "fx" },
	},
}

Def.PvE_wave_Pirate_Station =
{
	inherit			= "CargoShip",
	health 			= 1000000,
	max_lin_speed	= 10,
	max_rot_speed	= 2,
	damageable		= true,
	in_editor		= false,
	death_effect	= "",
	dying_health_percent = 0.2,
	dying_effect 	= "particles/explosions/objects/dying_fire",
	trail_effect 	= "",
	
	hudType 		= "default",
	death_wreck		= "",
	
	uiName			= "CargoShip_pirate",
	hud_ico 		= "boss_station",
	model			= "models/objects/ships_huge/pirat/pirat_station/pirat_station", 
	
	damageable_groups =
	{
		[ ai.DamageableGroup.ENGINE1 ] =
		{
			{ def = "Pirate_Barge_Engine", joint = "dvig1", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine", joint = "dvig2", }, -- двигатель без звука
			{ def = "Pirate_Barge_EngineSound", joint = "dvig1" }, -- звук отдельно
		 -- здесь энтити со звуком уничтожится автоматически после уничтожения последнего двигателя
		},

		[ ai.DamageableGroup.ENGINE2 ] =
		{
			{ def = "Pirate_Barge_Engine", joint = "dvig3", }, -- двигатель без звука
			{ def = "Pirate_Barge_EngineSound", joint = "dvig3" }, -- звук отдельно
		 -- здесь энтити со звуком уничтожится автоматически после уничтожения последнего двигателя
		}		
	},		
	
	children =
	{		
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun1" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun2" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun3" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun4" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun5" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun6" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun7" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun8" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun9" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun10" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun11" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun12" },		
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun13" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun14" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun15" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun16" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun17" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun18" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun19" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun20" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun21" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun22" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun23" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun24" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun25" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun26" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun27" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun28" },	
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun29" },
		{ def = "Turret_Pirate_Barge_JerTurret", joint = "gun30" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun31" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun32" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun33" },
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun34" },	
		{ def = "Turret_Pirate_Barge_Rocket", joint = "gun35" },	
		{ def = "Turret_Pirate_Barge_PlasmaCannon", joint = "big_gun1" },
		{ def = "Turret_Pirate_Barge_PlasmaCannon", joint = "big_gun2" },	
		{ def = "Turret_Pirate_Barge_PlasmaCannon", joint = "big_gun3" },
		{ def = "Turret_Pirate_Barge_PlasmaCannon", joint = "big_gun4" },	
		{ def = "Turret_Pirate_Barge_PlasmaCannon", joint = "big_gun5" },	
	},

	broken_parts = 
	{
		-- front
		{ def = "Pirate_Barge_Wreck2",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--big front
		{ def = "Pirate_Barge_Wreck3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--front small half
		{ def = "Pirate_Barge_Wreck5",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, }, --front big half
		{ def = "Pirate_Barge_Wreck4",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--top front
		-- back
		{ def = "Pirate_Barge_Wreck6",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--big back
		{ def = "Pirate_Barge_Wreck9",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--back
		-- mid 
		{ def = "Pirate_Barge_Wreck7",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--mid top
		--{ def = "Pirate_Barge_Wreck8",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 999, },--mid bottom --NOOO
		{ def = "Pirate_Barge_Wreck10",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--mid side
		-- barrels
		{ def = "Pirate_Barge_Wreck21",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck22",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck23",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck24",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck25",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck26",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		-- mid top debris
		{ def = "Pirate_Barge_Wreck27",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180,  },
		{ def = "Pirate_Barge_Wreck28",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck29",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck30",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck31",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck32",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		--{ def = "TestHugeCargo_Wreck",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.0,dumping = 0.5, speed = 0.5, speed_deviation = 0.3, speed_inherit = 1.0, ttl = 8, },
	},	
}

-- тестовый аванпост притворяющийся каргошипом
Def.TestAvanpostCargo =
{
	inherit			= "CargoShip",
	health 			= 500000,
	max_lin_speed	= 25,	-- совпадает с астеройдами
	damageable		= true,
	in_editor		= false,
	
	hudType 		= "default",
	
	uiName			= "",
	hud_ico					= "hud_pirate_icon",
	physics					= { solid_type = solid.compound_model, static = false, material = "Metal" },
	model					= "models/objects/vital_point/blockpost/blockpost_pirate",
	
	children = 
	{
		{ def = "OpenWorld_PirateRocketTurret", 		joint = "gun_1" },
		{ def = "OpenWorld_PirateTurret", 				joint = "gun_2" },
		{ def = "OpenWorld_PirateTurret", 				joint = "gun_3" },
		{ def = "OpenWorld_PirateRocketTurret", 		joint = "gun_4" },
		{ effect = "particles/ships/blockpost_lights", joint = "light_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_2" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_3" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_4" },
	},

	warp_out_effect	= "",
	warp_out_sound	= "sound/explosion/cargoship_expl",
}

-- тестовый астеройд притворяющийся каргошипом
Def.TestAsteroidCargo =
{
	inherit			= "CargoShip",
	health 			= 500000,
	max_lin_speed	= 25,	-- совпадает с астеройдами
	damageable		= true,
	in_editor		= false,
	
	hudType 		= "default",
	
	uiName			= "",
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Rock", mass = 1000000, },
	model			= "models/objects/asteroids/asteroid_set_02", 
	
	warp_out_effect	= "",
	warp_out_sound	= "sound/explosion/cargoship_expl",
}

Def.Ship_Gen_Boss_Cruiser = 
{
	inherit			= "PvE_wave_HugeCargo_T3",
}

Def.CargoShip_Gen_Wrecker = 
{
	inherit			= "CargoShip",
	health 			= 600000,
	hud_ico 		= "boss_station",
	max_lin_speed	= 16,
	in_editor		= true,
	
	model			= "models/objects/ships_huge/freighter_imper/freighter_imper_02",
	object_tag 		= ai.ObjectTag.TRANSPORT,
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk3", mass = 1000000, },
	
	children =
	{
		{	def = "CargoShip_Engines_01", joint = "engine_01",	},
		{	def = "CargoShip_Engines_01", joint = "engine_02",	},
		{	def = "CargoShip_Engines_02", joint = "engine_03",	},	
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},
	},
}

Def.CargoShip_Engines_01 = 
{
	class 			= "ScBaseEntity",
	model			= "models/objects/ships_huge/freighter_imper/engine_01",
	
	spell_aura_target = true, ---#66194
	hack_immune		= true, -- #71642
	signature		= ai.Signature.SMALL,

	in_editor		= false,
		
	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "Metal", mass = 1000, }, 
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "major",
	death_damage_to_parent	= 50000,
	health			= 30000,
	maxViewDist 	= 5000,
	uiName			= "ReiderBargeEngine",

	death_effect	= "particles/explosions/objects/explosion_tiny",
	death_sound		= "sound/explosion/turret_expl",
	work_sound		= "sound/engine/cargoship_loop",	
	wreck			= "Effects_EngineWreck",
	
	children =
	{
		{	def = "Engine_empire_xl", joint = "engine",	},
	}
}

Def.CargoShip_Engines_02 = 
{
	class 			= "ScBaseEntity",
	model			= "models/objects/ships_huge/freighter_imper/engine_02",
	
	spell_aura_target = true, ---#66194
	hack_immune		= true, -- #71642
	signature		= ai.Signature.SMALL,

	in_editor		= false,
		
	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "Metal", mass = 1000, }, 
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "major",
	death_damage_to_parent	= 50000,
	health			= 30000,
	maxViewDist 	= 5000,
	uiName			= "ReiderBargeEngine",

	death_effect	= "particles/explosions/objects/explosion_tiny",
	death_sound		= "sound/explosion/turret_expl",
	work_sound	= 	"sound/engine/cargoship_loop",	
	wreck			= "Effects_EngineWreck",		
	
	children =
	{		
		{ def = "Engine_empire_xxl", joint = "engine",	},
	},		
}


Def.Effects_EngineWreck =
{
	class = "EffectEntity",
	effect = "particles/explosions/cargoship_engine_destroyed",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.CargoShip_Gen_Undead = 
{
	inherit			= "CargoShip",
	health 			= 600000,
	hud_ico 		= "boss_station",
	max_lin_speed	= 13,
	in_editor		= true,
	shield_def		= "CargoShipShield",
	
	model			= "models/objects/ships_huge/freighter_imper/freighter_imper_02",
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk3", mass = 1000000, },
	
	children =
	{
		{	def = "CargoShip_Engines_01", joint = "engine_01",	},
		{	def = "CargoShip_Engines_01", joint = "engine_02",	},
		{	def = "CargoShip_Engines_02", joint = "engine_03",	},	
		{	def = "Engine_empire_l",	  joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	  joint = "exhaust_5",	},
	},
}

Def.CargoShip_Gen_Sapper = 
{
	inherit			= "CargoShip",
	health 			= 250000,
	hud_ico 		= "boss_station",
	max_lin_speed	= 16,
}


Def.CargoShip_Dreadnought = 
{
	inherit			= "CargoShip",
	max_lin_speed	= 100,
	model			= "models/ships/bigship/bigship_empire_01",
	damageable		= false,
	maxViewDist 	= 500000,
	uiName			= "tooltip_ship_dreadnought",
	spell_aura_target = true, ---#66194
	hack_immune		= true, -- #71642
	signature		= ai.Signature.HUGE,
	
	physics			= { solid_type = solid.compound_model, static = false, kinematic = true, material = "Metal" },

	
	children =
	{
		{	def = "PvE_Gen_Dreadnought_Dred02", joint = "root",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun1",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun2",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun3",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun4",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun5",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun6",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun7",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun8",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun13",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun14",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun15",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun16",	},
		{	def = "PvE_Gen_Dreadnought_MainTurret", joint = "gun9",	},
		{	def = "PvE_Gen_Dreadnought_MainTurret", joint = "gun10",	},
		{	def = "PvE_Gen_Dreadnought_MainTurret", joint = "gun23",	},
	}
}

Def.CargoShip_OW_Dreadnought = 
{
	inherit			= "CargoShip",
	max_lin_speed	= 100,
	damageable		= false,
	maxViewDist 	= 500000,
	uiName			= "tooltip_ship_dreadnought",
	spell_aura_target = true, ---#66194
	hack_immune		= true, -- #71642

	model			= "models/objects/ships_huge/freighter_imper/freighter_imper",
	object_tag 		= ai.ObjectTag.TRANSPORT,

	hudType 		= "default",
	signature		= ai.Signature.HUGE,
	
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk3", mass = 1000000, },

	children =
	{
	
	}
}

Def.PvE_Gen_DockingBayRuins =
{
	class 			= "AnimatedEntity",
	in_editor		= true,
	maxViewDist		= 5000,
	model			= "mapskit/maps/models/imper_station/docking_bay_huge/docking_bay_huge",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal", },
	
	children = 
	{
		{ def = "FireDockingBay", 		joint = "docking" },
	},	
}

Def.CargoShip_Gen_Kamikaze = 
{
	inherit			= "CargoShip",
	health 			= 200000,
	hud_ico 		= "boss_station",
	max_lin_speed	= 7,
	in_editor		= true,
}

Def.PvE_Gen_Allidium_Dread2 = 
{
	class 				= "PathMovementEntity",
	max_lin_speed	= 700,
	max_rot_speed	= 6,	-- deg per second
	path_end_deactivate	= false,
	damageable			= false,
	model			= "models/ships/bigship/allidium/allidium_ship_pered",
	
	maxViewDist		= 3000,
	in_editor		= true,
	
	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/gadgets/pve_ship_warp_in",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/gadgets/pve_ship_warp_out",
	
	work_sound      = "sound/engine/cargoship_loop",

	death_wreck		= "CargoShipWreck",

	uiName 			= "tooltip_ship_dreadnought",

	trail_effect = "particles/ships/ship_trail",
	trail_size = 0.1,
	trail_color = "5 17 197 100",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 10000, material = "Metal" },
	children =
	{
		{	def = "PvE_Gen_Allidium_Dread02", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Dread03", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Dread04", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Dread05", joint = "root",	},
		{	def = "PvE_Gen_Average_Turret2", joint = "gun_01",	},
		{	def = "PvE_Gen_Average_Turret2", joint = "gun_02",	},
		{	def = "PvE_Gen_Average_Turret2", joint = "gun_03",	},
		{	def = "PvE_Gen_Average_Turret2", joint = "gun_04",	},
		{	def = "PvE_Gen_Average_Turret2", joint = "gun_05",	},
		{	def = "PvE_Gen_Average_Turret2", joint = "gun_06",	},
		{	def = "PvE_Gen_Average_Turret2", joint = "gun_07",	},
		{	def = "PvE_Gen_Average_Turret2", joint = "gun_08",	},
		{	def = "Effects_Dreadnought_EngineBlueMid", joint = "engine_03",	},
		{	def = "Effects_Dreadnought_EngineBlueBig", joint = "engine_04",	},
		{	def = "Effects_Dreadnought_EngineBlueSmall", joint = "engine_01",	},
		{	def = "Effects_Dreadnought_EngineBlueSmall", joint = "engine_02",	},
		{	def = "Effects_Dreadnought_EngineBlueSmall", joint = "engine_05",	},
		{	def = "Effects_Dreadnought_EngineBlueSmall", joint = "engine_06",	},
	},	
	relationship_group 	= 1,
}

Def.PvE_Gen_Movement_Asteroid =
{
	class 			= "CargoShip",
	in_editor		= false,
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_8", 
	

	hudType 		= "default",
	signature		= ai.Signature.HUGE,
	
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Rock", mass = 1000000, },
	damageable		= true,

	maxViewDist		= 3000,
	health 			= 500000,
	max_lin_speed	= 25,
	max_rot_speed	= 10,	-- deg per second

	death_sound		= "sound/raid/big_asteroid_explosion",
	death_effect	= "particles/explosions/asteroid_explosion_grey",
	work_sound      = "",

	death_wreck		= "",

	uiName			= "MovingAsteroid",

	trail_effect = "",
	
	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/raid/big_enemy_warp",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/gadgets/pve_ship_warp_out",
}

Def.PvE_Gen_Wave_Barque_T3 =
{
	inherit			= "CargoShip",
	health 			= 2000000,
	crowd_control_coef = 0,	--- #59363
	max_lin_speed	= 15,
	lin_acceleration = 99999,
	max_rot_speed	= 2,
	damageable		= true,
	in_editor		= false,
	death_effect	= "particles/explosions/objects/freighter_pirat_explosion",
	dying_health_percent = 0.2,
	dying_effect 	= "particles/explosions/objects/dying_fire",
	trail_effect 	= "",
	warp_in_sound	= "sound/raid/big_enemy_warp",
	
	hudType 		= "default",
	death_wreck		= "",
	target_def 		= "Helpers_DistPoint", -- #73847
	
	uiName			= "CargoShip_pirate",
	hud_ico 		= "boss_station",
	model			= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat", 
	
	damageable_groups =
	{
		[ ai.DamageableGroup.ENGINE1 ] =
		{
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig1", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig2", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig3", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig4", }, -- двигатель без звука
			{ def = "Pirate_Barge_EngineSound", joint = "dvig4" }, -- звук отдельно
		 -- здесь энтити со звуком уничтожится автоматически после уничтожения последнего двигателя
		}
	},	
	
	children =
	{			
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun1" },
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun2" },	
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun3" },
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun4" },	
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun5" },
		{ def = "Turret_Pirate_Barge_JerTurret_T3", joint = "gun6" },	
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun7" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun8" },	
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun9" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun10" },	
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun11" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun12" },		
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun13" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun14" },	
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun15" },
		{ def = "Turret_Pirate_Barge_Rocket_T3", joint = "gun16" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun17" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun18" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun19" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun20" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun21" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_T3", joint = "gun22" },	
		{ def = "AuraEngineHurt", joint = "big_trigger" },	
		{ effect = "particles/ships/cargo_antenna", joint = "fx1" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx2" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx3" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx4" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx5" },
		{ def = "AuraReactorHurt", joint = "zone_trigger" },
	},

	broken_parts = 
	{
		-- front
		{ def = "Pirate_Barge_Wreck2",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--big front
		{ def = "Pirate_Barge_Wreck5",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, }, --front big half
		-- back
		{ def = "Pirate_Barge_Wreck6",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--big back
		{ def = "Pirate_Barge_Wreck9",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--back
		-- mid 
		{ def = "Pirate_Barge_Wreck7",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--mid top
		{ def = "Pirate_Barge_Wreck10",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },--mid side
		-- barrels right
		{ def = "Pirate_Barge_Wreck21",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck22",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck23",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		-- barrels left
		{ def = "Pirate_Barge_Wreck24",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_Wreck25",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		-- mid top debris
		{ def = "Pirate_Barge_Wreck28",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		

		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -35, 0, -60 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -30, 5, -30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -30, -15, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( -30, -25, 30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 35, 0, -60 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 30, -20, -30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 30, 0, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 30, -10, 30 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, 20, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, -45, 0 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, -45, 60 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, 0, -150 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris1",  debris = false, pos = Vec3( 0, 0, 150 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		
		{ def = "Pirate_Barge_WreckDebris2",  debris = false, pos = Vec3( 0, -60, -15 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
		{ def = "Pirate_Barge_WreckDebris2",  debris = false, pos = Vec3( 0, -60, -15 ), ang_speed_deviation = 2,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 180, },
	},	
}

Def.CargoShip_Gen_Repairs = 
{
	inherit			= "CargoShip",
	path_end_deactivate	= false,
	health 			= 200000,
	hud_ico 		= "boss_station",
	max_lin_speed	= 7,
	in_editor		= true,
	relationship_group 	= 1,
}

Def.CargoShip_Gen_Barque2 = 
{
	inherit			= "CargoShip",
	path_end_deactivate	= false,
	health 			= 200000,
	hud_ico 		= "boss_station",
	max_lin_speed	= 7,
	in_editor		= true,
	relationship_group 	= 1,
	model			= "models/objects/ships_huge/pirat/pirat_station/pirat_station", 
	

	hudType 		= "default",
	signature		= ai.Signature.HUGE,
	
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Rock", mass = 1000000, },
}

--экспериментальные дредноуты
Def.PvE_Gen_Dreadnought_Dred01 = 
{
	class 				= "PathMovementEntity",
	max_lin_speed	= 700,
	max_rot_speed	= 6,	-- deg per second
	path_end_deactivate	= false,
	in_editor		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_empire_01",
	relationship_group 	= 2,
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },
	children =
	{
		{	def = "PvE_Gen_Dreadnought_Dred02", joint = "root",	},
		{	def = "PvE_Gen_DreadGen", joint = "energy23",	},
		{	def = "PvE_Gen_DreadGen", joint = "gun12",	},
		{	def = "PvE_Gen_DreadGen", joint = "shield",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun1",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun2",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun3",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun4",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun5",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun6",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun7",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun8",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun13",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun14",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun15",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun16",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun17",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun18",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun19",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun20",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun21",	},
		{	def = "PvE_Gen_Average_Turret1", joint = "gun22",	},
		{	def = "PvE_Gen_Dreadnought_MainTurret", joint = "gun9",	},
		{	def = "PvE_Gen_Dreadnought_MainTurret", joint = "gun10",	},
		{	def = "PvE_Gen_Dreadnought_MainTurret", joint = "gun23",	},
	},	
	uiName 			= "tooltip_ship_dreadnought"
}

Def.OW_Dreadnought_MainTurret = 
{
	inherit 					= "ClanShip_MainTurret",
	maxViewDist					= 999999,
	clan_ship_charge_effect		= ai.DONT_INHERIT,
	clan_ship_beam_effect		= ai.DONT_INHERIT,
}

Def.CargoShip_Dreadnought_OW_Emp = 
{
	inherit					= "CargoShip",
	
	in_editor				= false,
	maxViewDist				= 999999,
	model					= "mapskit/maps/open_world/empire/ilay_clanbigship/dreadnought_04",
	
	physics					= { solid_type = solid.none, kinematic = true, },

	damageable				= false,
	hack_immune				= true,
	
	max_lin_speed			= 15,
	lin_acceleration		= 99999,
	max_rot_speed			= 10,
	
	path_end_deactivate		= true,
	
	warp_in_effect			= "particles/other/wave_portal_open",
	warp_in_sound			= "sound/raid/big_enemy_warp",
	warp_out_effect			= "particles/other/wave_portal_open",
	warp_out_sound			= "sound/gadgets/pve_ship_warp_out",
	
	trail_effect 			= "",
	
	death_wreck				= "",
	
	hudType					= ai.DONT_INHERIT,
	hud_visibility_type 	= ai.DONT_INHERIT,
	uiName					= "tooltip_ship_dreadnought",
	
	children =
	{
		{	def = "OW_Dreadnought_MainTurret", joint = "gun_1",	},
		{	def = "OW_Dreadnought_MainTurret", joint = "gun_2",	},
		{	def = "OW_Dreadnought_MainTurret", joint = "gun_3",	},
		{	def = "Effects_Dreadnought_EngineRedC2", joint = "back", },
	},
}

Def.CargoShip_Dreadnought_OW_Fed =
{
	inherit			= "CargoShip_Dreadnought_OW_Emp",
	model			= "models/ships/bigship/bigship_fed_2",
	children =
	{
		{	def = "OW_Dreadnought_MainTurret", joint = "gun_1",	},
		{	def = "OW_Dreadnought_MainTurret", joint = "gun_2",	},
		{	def = "OW_Dreadnought_MainTurret", joint = "gun_3",	},
		{	def = "Effects_Dreadnought_EngineRedC2", joint = "back", },
	},
}

Def.CargoShip_Dreadnought_OW_Jer =
{
	inherit			= "CargoShip_Dreadnought_OW_Emp",
	model			= "models/ships/bigship/bigship_jer_2",
	children =
	{
		{	def = "OW_Dreadnought_MainTurret", joint = "gun_1",	},
		{	def = "OW_Dreadnought_MainTurret", joint = "gun_2",	},
		{	def = "OW_Dreadnought_MainTurret", joint = "gun_3",	},
		{	def = "Effects_Dreadnought_EngineRedC2", joint = "back", },
	},
}

Def.CargoShip_Emp =
{
	inherit			= "CargoShip",
	uiName			= "CargoShip_Emp",
}

Def.CargoShip_Fed =
{
	inherit			= "CargoShip",
	uiName			= "CargoShip_Fed",
}

Def.CargoShip_Jer =
{
	inherit			= "CargoShip",
	uiName			= "CargoShip_Jer",
}

Def.CargoShip_Pir =
{
	inherit			= "CargoShip",
	uiName			= "CargoShip_Pir",
}