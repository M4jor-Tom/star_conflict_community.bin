Def.Pilot =
{
	class 		= "BaseEntity",
	in_editor	= false,
	model		= "models/characters/pilot/pilot01",
	shadowCaster = false,
}

-- специальный объект, используемый для освещения для конкурсной карты.
Def.Special_Light_House = 
{
	class		=	"BaseEntity",
	in_editor	=	true,
	model		=	"models/objects/illuminate/lighthouse_01/lighthouse_01",
	physics		=	{ solid_type = solid.compound_model, mass = 10000, material = "Metal", },
}

---------------- DEBRIS ----------------
Def.Debris_Asteroid = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
	model		=	"models/objects/asteroids/asteroid_01",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "Rock", },
	uiName	 	=	"Debris",
	
	glow_intensity = 0, --SC-114939
}

Def.Debris_Asteroid_p4 = 
{
	class		=	"SpaceAsteroid",
	in_editor	=	true,
	model		=	"mapskit/maps/models/asteroids_rocks/asteroid_rock01",
	physics		=	{ solid_type = solid.model, material = 'Rock', mass = 1000, material = "Rock", },
	uiName	 	=	"Debris",
	
	glow_intensity = 0, --SC-114939
}
--[[
Def.Debris_Debris01 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_01",
	physics		=	{ solid_type = solid.model, mass = 10000, },
	uiName	 	=	"Debris",
}
]]

Def.Debris_Debris02 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
--	model		=	"models/objects/satellite/satellite",
	model		=	"models/objects/wrecks/debris_02",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris03 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
--	model		=	"models/objects/satellite/satellite",
	model		=	"models/objects/wrecks/debris_03",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris04 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
--	model		=	"models/objects/satellite/satellite",
	model		=	"models/objects/wrecks/debris_04",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris05 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
--	model		=	"models/objects/satellite/satellite",
	model		=	"models/objects/wrecks/debris_05",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

--[[
Def.Debris_Debris06 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_06",
	physics		=	{ solid_type = solid.model, mass = 10000, },
	uiName	 	=	"Debris",
}
]]

Def.Debris_Debris07 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_07",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris08 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
	model		=	"models/objects/satellite/satellite",
--	model		=	"models/objects/wrecks/debris_08",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris09 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
	model		=	"models/objects/satellite/satellite",
--	model		=	"models/objects/wrecks/debris_09",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris10 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_10",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris11 = 
{
	class		=	'SpaceAsteroid',  
	in_editor	=	true,
	model		=	"mapskit/maps/models/containers/bs_const_plank01", 
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris12 = 
{
	class		=	'SpaceAsteroid',  
	in_editor	=	true,
	model		=	"mapskit/maps/models/containers/bs_const_plank02", 
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris13 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
	model		=	"mapskit/maps/models/containers/bs_const_cube_big01",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Debris_Debris14 = 
{
	class		=	'SpaceAsteroid',
	in_editor	=	true,
	model		=	"mapskit/maps/models/containers/bs_const_cube_big02",
	physics		=	{ solid_type = solid.model, mass = 10000, material = "ShipMetalMk1", },
	uiName	 	=	"Debris",
}

Def.Jer_outpost_p12 =
{
	class = "BaseEntity",
	in_editor	=	true,

	damageable	=	false,
	model		=	"mapskit/maps/models/jer_outpost/jer_outpost_p12",
	physics		=	{ solid_type = solid.box, static = true, },
}

Def.Jer_outpost_p13 =
{
	class = "BaseEntity",
	in_editor	=	true,

	damageable	=	false,
	model		=	"mapskit/maps/models/jer_outpost/jer_outpost_p13",
	physics		=	{ solid_type = solid.box, static = true, },
}

Def.Debris_PandoraShining = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/maps/models/energy_geiser/pandora_shining",
}

Def.Debris_PandoraSun = 
{
	class = "BaseEntity",
	in_editor	=	true,
	model		=	"mapskit/maps/models/energy_geiser/pandora_sun",
}

Def.PvE_Geostation_Crusher = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/maps/models/imper_station/rock_crusher/crusher",
}

Def.PvE_Geostation_Diafragma = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/maps/models/imper_station/rock_crusher/diafragma",
}


---------------- WRECKS ----------------
Def.Wreck_GreenGuard_L = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_5/wrecks/wrecks_25",	
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_R1_S = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_1/wrecks/r1_wreck_s",	
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_R1_M = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_1/wrecks/r1_wreck_m",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_UFOBall = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/specialships/ship_ball/ship_ball_wreck",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}
	
Def.Wreck_R1_L = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_1/wrecks/r1_wreck_l",
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_R1_XL = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	--model		=	"models/ships/race_1/wrecks/r1_h_ostov",
	model		=	"models/ships/race_1/wrecks/r1_wreck_h",
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
    children	= {
					{ effect = "particles/explosions/shp_exp_huge_02", joint = "root" },
                  },
}

Def.Wreck_R2_S = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_2/wrecks/r2_wreck_s",
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_R2_M = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_2/wrecks/r2_wreck_m",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}
	
Def.Wreck_R2_L = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_2/wrecks/r2_wreck_l",
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_R3_S = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_3/wrecks/r3_wreck_s",
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_R3_M = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_3/wrecks/r3_wreck_m",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}
	
Def.Wreck_R3_L = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_3/wrecks/r3_wreck_l",
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.LeaderWreck =
{
	class		=	"ShipWreck",
	in_editor	=	false,
	model 		= 	"models/objects/container/container",
	physics		=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
}

Def.Wreck_R5_M = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_5/wrecks/r5_wreck_m",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}
Def.Wreck_R5_S = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_5/wrecks/r5_wreck_s",
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_R5_S_GreenRecon = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_damage",
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_R5_L = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_5/wrecks/r5_wrecks_l",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.Wreck_R5_H = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_5/wrecks/r5_wrecks_h",
	physics		=	{ solid_type = solid.model, mass = 8000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
	children	= {
					{ effect = "particles/explosions/shp_exp_huge_02", joint = "root" },
                  },
}

Def.Wreck_Saturn_H = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/specialships/destroyer_ring/destroyer_ring_damage",
	physics		=	{ solid_type = solid.model, mass = 8000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
	children	= {
					{ effect = "particles/explosions/shp_exp_huge_02", joint = "root" },
                  },
}

Def.Wreck_Station = 
{
	class		=	'BaseEntity',
	in_editor	=	false,
	--remove_timeout = 20,
	model		=	"models/ships/race_5/wrecks/r5_wreck_station_2",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck",
	death_fade_time = 3.5,
}

Def.Wreck_UFO_L = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/specialships/ship_ufo/ship_ufo_wreck",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
	children =
	{				
		{	effect = "particles/explosions/objects/brokenparts_fire_small", joint = "fx1"	},
		{	effect = "particles/explosions/objects/brokenparts_fire_small", joint = "fx2"	},
		{	effect = "particles/explosions/objects/brokenparts_fire_small", joint = "fx3"	},
	}
}

Def.Wreck_Hammerhead_L = 
{
	class		=	'ShipWreck',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_3/wrecks/r3_wreck_l_flat",
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

---------------- DECOR ----------------

Def.R5_m_unique = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/ships/race_5/m/r5_m_unique",
	network_sync	=	false,
}

Def.R5_scout_decor_unique = 
{
	class			=	"ScBaseEntity",--'BaseEntity',	
	model			=	"models/modules/decorative/bat/bat",
	network_sync	=	false,
}

Def.R5_engineer_decor_unique = 
{
	class			=	"ScBaseEntity",--'BaseEntity',	
	model			=	"models/modules/decorative/dron_decor/dron_decor",
	network_sync	=	false,
}

Def.CrossoutBeepHorn = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/crossout_assets/beep_horn",
	network_sync	=	false,
}

Def.CrossoutHorns = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/crossout_assets/horns",
	network_sync	=	false,
}

Def.CrossoutEagleSign = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/crossout_assets/eagle_sign",
	network_sync	= 	false,
}

Def.Moon_Rover = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/lunokhod/lunokhod",
	network_sync	=	false,
}

Def.Empire_Sign = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/fraction_sings/empire_sign",
	network_sync	=	false,
}

Def.Federation_Sign = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/fraction_sings/federation_sign",
	network_sync	=	false,
}

Def.Jericho_Sign = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/fraction_sings/jericho_sign",
	network_sync	=	false,
}

Def.Ellydium_Sign = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/fraction_sings/ellydium_sign",
	network_sync	=	false,
}

Def.SC_Logo = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/starconflict_logo/starconflict_logo",
	network_sync	=	false,
}

Def.SC_Glove_01 =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/glove_01/glove_01",
	network_sync	=	false,
}

Def.SC_Moon_Decor =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/moon/moon_decor",
	network_sync	=	false,
}

Def.Crystal_Shard = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/crystals/crystals",
	network_sync	=	false,
	
	children =
	{				
		{	effect = "particles/decorative/crystal", joint = "fx"	},
	}
}

Def.Direct_Hit = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/rocket/rocket",
	network_sync	=	false,
	
	children =
	{				
		{	effect = "particles/decorative/rocket_sparks", joint = "fx"	},
	}
}

Def.Cool_Down =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/misc/null_object",
	network_sync	=	false,
	
	children =
	{				
		{	effect = "particles/gadget/enhanced_shooting_weapon", joint = "root"	},
	}
}

Def.Police_Lights =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/misc/null_object",
	network_sync	=	false,
	
	children =
	{				
		{	effect = "particles/ships/police_lights", joint = "root"	},
	}
}

Def.Jericho_Logo =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/misc/null_object",
	network_sync	=	false,
	
	children =
	{				
		{	effect = "particles/ships/jer_logo2", joint = "root"	},
	}
}

Def.Satellite =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/satellite/satellite",
	network_sync	=	false,
}

Def.Pirate_Arm = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/pirate_arm/pirate_arm",
	network_sync	=	false,
}

Def.Sundial = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/sundial/sundial",
	network_sync	=	false,
}

Def.Blades = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/blades/blades",
	network_sync	=	false,
}

Def.Phoenix_Wings = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/phoenix_wings/phoenix_wings",
	network_sync	=	false,
}

Def.Shark = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/shark/shark",
	network_sync	=	false,
}

Def.Trophy_Decor = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/trophy/trophy_decor",
	network_sync	=	false,
}

Def.Spring_Scull = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/spring_scull/spring_scull_decor",
	network_sync	=	false,
}

Def.SC_Logo_on_Shield = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/corporation_decors/shield",
	network_sync	=	false,
}

Def.PlagueDoctor_Mask =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/plague_doctor_mask/plague_doctor_mask",
	network_sync	=	false,
	death_custom_fx	=	"particles/decorative/skull_smoke",
	death_custom_fx_fade_dist_min =	35,
	death_custom_fx_fade_dist_max =	45,
}

Def.Neon_Rocket = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/neon_rocket/neon_rocket",
	network_sync	=	false,
}

Def.Snowman = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/snowman/snowman",
	network_sync	=	false,
}

Def.Utility_Bag = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/utility_bag/utility_bag",
	network_sync	=	false,
}

Def.Antler = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/antler/antler",
	network_sync	=	false,
}

Def.Flaming_Star = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/star/star",
	network_sync	=	false,
	children =
	{				
		{	effect = "particles/decorative/star", joint = "rot_y"	},
	}
}

Def.Christmas_Ball = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/christmas_ball/christmas_ball",
	network_sync	=	false,
}

Def.Sentinel_Tournament_Cup =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/tournament/tournament_decor",
	network_sync	=	false,
}

Def.Vostok =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/vostok/vostok1",
	network_sync	=	false,
}

Def.Pearl =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/pearl/pearl",
	network_sync	=	false,
}

Def.Fire_Bird =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/fire_bird/fire_bird",
	network_sync	=	false,
	children =
	{				
		{	effect = "particles/decorative/fire_bird", joint = "root"	},
	}
}

Def.Astronaut =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/astronaut/astronaut",
	network_sync	=	false,
}

Def.Exotic_Ikebana =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/exotic_ikebana/exotic_ikebana",
	network_sync	=	false,
}

Def.Octo =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/octo/octo",
	network_sync	=	false,
}

Def.Tropick_Fish =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/tropick_fish/tropick_fish",
	network_sync	=	false,
}

Def.Trophy_Decor_21 =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/trophy/trophy_decor_21",
	network_sync	=	false,
}

Def.Tournament_Decor_Beacon =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/tournament/tournament_decor_beacon",
	network_sync	=	false,
}

Def.LevitatingCrystal =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/crystals/levitating_crystal",
	network_sync	=	false,
}

Def.ModernHead =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/head/head",
	network_sync	=	false,
}

Def.Spiked =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/spiked/spiked",
	network_sync	=	false,
}

Def.Dragon = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/dragon/dragon",
	network_sync	=	false,
	death_custom_fx	=	"particles/decorative/dragon_burned",
	death_custom_fx_fade_dist_min =	35,
	death_custom_fx_fade_dist_max =	45,
	children =
	{				
		{	effect = "particles/decorative/dragon", joint = "fx"	},
	}
}

Def.AlienShrine =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/alien_shrine/alien_shrine",
	network_sync	=	false,
}

Def.Totem =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/totem/totem",
	network_sync	=	false,
}

Def.Rhomb =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/rhomb/rhomb",
	network_sync	=	false,
}

Def.Heart =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/heart/heart",
	network_sync	=	false,
	death_custom_fx	=	"particles/decorative/heart_neon",
	death_custom_fx_fade_dist_min =	30,
	death_custom_fx_fade_dist_max =	40,
}

Def.Rabbit =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/rabbit/rabbit",
	network_sync	=	false,
}

Def.Sakura =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/sakura/sakura",
	network_sync	=	false,
}

Def.Wishes =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/wishes/wishes",
	network_sync	=	false,
}

Def.Fox =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/fox/fox",
	network_sync	=	false,
}

Def.Torch =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/torch/torch",
	network_sync	=	false,
	children =
	{				
		{	effect = "particles/decorative/torch", joint = "root"	},
	}
}

Def.Lamp =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/lamp/lamp",
	network_sync	=	false,
}

Def.Reactor =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/reactor/reactor",
	network_sync	=	false,
}

Def.NewRose =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/newrose/new_rose",
	network_sync	=	false,
}

Def.Trophy_Decor_22 =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/trophy/trophy_decor_22",
	network_sync	=	false,
}

Def.CutCube =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/cut_cube/cut_cube",
	network_sync	=	false,
}

Def.Owl =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/owl/owl",
	network_sync	=	false,
}

Def.Antipode =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/antipode/antipode",
	network_sync	=	false,
}

Def.Plexus =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/plexus/plexus",
	network_sync	=	false,
}

Def.Chained =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/chained/chained",
	network_sync	=	false,
}

Def.Covered =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/covered/covered",
	network_sync	=	false,
}

Def.Eye =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/eye/eye",
	network_sync	=	false,
}

Def.Spider =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/spider/spider",
	network_sync	=	false,
}

Def.Black_Relay =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/black_relay/black_relay",
	network_sync	=	false,
}

Def.Cocoon =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/cocoon/cocoon",
	network_sync	=	false,
}

Def.Anchor =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/anchor/anchor",
	network_sync	=	false,
}

Def.Snorkel =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/snorkel/snorkel",
	network_sync	=	false,
}

Def.Stooge =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/stooge/stooge",
	network_sync	=	false,
}

Def.Nautilus =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/nautilus/nautilus",
	network_sync	=	false,
}
Def.Feather =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/feather/feather",
	network_sync	=	false,
}
Def.DrillDecor =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/drill/drill",
	network_sync	=	false,
}

Def.Inner_Glow =
{
	class			=	"ScBaseEntity",
	model			=	"models/modules/decorative/inner_glow/inner_glow",
	network_sync	=	false,
	children =
	{				
		{	effect = "particles/decorative/inner_glow", joint = "fx"	},
	}
}

Def.Icicle =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/icicle/icicle",
	network_sync	=	false,
}

Def.Tree =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/tree/tree",
	network_sync	=	false,
}

Def.Last_Phase =
{
	class			=	"ScBaseEntity",
	model			=	"models/modules/decorative/last_phase/last_phase",
	network_sync	=	false,
}

Def.Crystal_Aurora =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/crystal_aurora/crystal_aurora",
	network_sync	=	false,
}

Def.Polaris =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/polaris/polaris",
	network_sync	=	false,
}

Def.Crystalopter =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/dragonfly/dragonfly",
	network_sync	=	false,
}

Def.Malachite =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/malachite/malachite",
	network_sync	=	false,
}

Def.Pteryx =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/pteryx/pteryx",
	network_sync	=	false,
}

Def.Beak =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/beak/beak",
	network_sync	=	false,
}

Def.DinoToy =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/dino/dino",
	network_sync	=	false,
}

Def.Space_day_2023 =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/space_day_2023/space_day_2023",
	network_sync	=	false,
}

Def.Shellfish = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/shellfish/shellfish", 
	network_sync	=	false,
}

Def.Vibrance = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/vibrance/vibrance", 
	network_sync	=	false,
}

Def.Crest = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/crest/crest", 
	network_sync	=	false,
}

Def.Spines = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/spines/spines", 
	network_sync	=	false,
}

Def.Dome = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/dome/dome", 
	network_sync	=	false,
}

Def.Paw = 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/paw/paw", 
	network_sync	=	false,
}

Def.Pickaxe =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/pickaxe/pickaxe",
	network_sync	=	false,
}

--- Декоры BP12_1 / SUM23_1 "Грани риска. Первый этап"
 
Def.Brassknuckles =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/brassknuckles/brassknuckles",
	network_sync	=	false,
}

Def.Money_Skull =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/money_skull/money_skull",
	network_sync	=	false,
}

Def.Money_Dog =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/money_dog/money_dog",
	network_sync	=	false,
}

Def.Smugglerbox =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/smugglerbox/smugglerbox",
	network_sync	=	false,
}

--- декор Трофей Космобольца 2023

Def.Trophy_Decor_23 =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/trophy/trophy_decor_23",
	network_sync	=	false,
}

--- Декоры BP12_2 / SUM23_2 "Грани риска. Второй этап" SC-117635
 
Def.Shellgame =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/shellgame/shellgame",
	network_sync	=	false,
}

Def.Money_Hand =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/money_hand/money_hand",
	network_sync	=	false,
}

Def.Death_Drum =
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/death_drum/death_drum",
	network_sync	=	false,
}

Def.Wings = -- !!! ЗАГОТОВКА !!! ДЕФ БУДЕТ МЕНЯТЬСЯ КОГДА К.Ч. ОПРЕДЕЛИТСЯ !!!
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/wings/wings", -- !!! ЗАГОТОВКА !!! ДЕФ БУДЕТ МЕНЯТЬСЯ КОГДА К.Ч. ОПРЕДЕЛИТСЯ !!!
	network_sync	=	false,
}

--- Декоры BP13_1 / AUT23_1 "Древний инстинкт. Первая фаза" SC-117869
 
Def.Saint_Head = -- Последний судья
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/saint_head/saint_head",
	network_sync	=	false,
	children = 
	{
		{ effect = "particles/decorative/saint_head", joint = "root" },
	},
}

Def.Coffin = -- Груз 273
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/coffin/coffin",
	network_sync	=	false,
	children =
	{				
		{	effect = "particles/decorative/coffin", joint = "root"	},
	}
}

Def.Kunai = -- Кокон монарха
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/kunai/kunai",
	network_sync	=	false,
}

Def.Crown = -- Венок Катрины
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/crown/crown",
	network_sync	=	false,
	death_custom_fx	=	"particles/decorative/skull_crown",
	death_custom_fx_fade_dist_min =	35,
	death_custom_fx_fade_dist_max =	45,
}

--- SC-117611 Декор для Mauler
Def.Connector = -- Коннектор судьбы
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/connector/connector",
	network_sync	=	false,
}

--- Декоры BP13_2 / AUT23_2 "Древний инстинкт. Вторая фаза" SC-117870
 
Def.Dreamcatcher = -- Октагон Ананси
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/dreamcatcher/dreamcatcher",
	network_sync	=	false,
	death_custom_fx	=	"particles/decorative/dream_catcher",
	death_custom_fx_fade_dist_min =	35,
	death_custom_fx_fade_dist_max =	45,
}

Def.Lunnica = -- Кровавая луна
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/lunnica/lunnica",
	network_sync	=	false,
}

Def.Sence_Tree = -- Древо смыслов
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/sence_tree/sence_tree",
	network_sync	=	false,
}

Def.Death_Flower = -- Цветок скорби
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/death_flower/death_flower",
	network_sync	=	false,
}

--- Декоры BP14_1 / NY24_1 "Секреты предтечей". Первая фаза. SC-118208
 
Def.Fan = -- Призыватель ветров
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/fan/fan",
	network_sync	=	false,
}

Def.Chest = -- Тайник ванов
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/chest/chest",
	network_sync	=	false,
}

Def.Spheres_Chinese = -- Глаза Юн
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/spheres/spheres",
	network_sync	=	false,
	children =
	{				
		{	effect = "particles/decorative/spheres", joint = "fx"	},
	}
}

Def.Fly_Lantern = -- Дэнлон/Denglong
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/fly_lantern/fly_lantern",
	network_sync	=	false,
	death_custom_fx	=	"particles/decorative/fly_lantern_death_effect",
	death_custom_fx_fade_dist_min =	35,
	death_custom_fx_fade_dist_max =	45,
	children =
	{				
		{	effect = "particles/decorative/fly_latern", joint = "fx"	},
	}
}

--- Декоры BP14_2 / NY24_2 "Секреты предтечей". Вторая фаза. SC-118348
 
Def.BP14_Cloud = -- Дар небес
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp14_cloud/bp14_cloud",
	network_sync	=	false,
	death_custom_fx = "particles/decorative/cloud",
	death_custom_fx_fade_dist_min =	35,
	death_custom_fx_fade_dist_max =	45,
}

Def.BP14_Gong = -- Вызов на бой
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp14_gong/bp14_gong",
	network_sync	=	false,
}

Def.BP14_Umbrella = -- Солнечная батарейка
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp14_umbrella/bp14_umbrella",
	network_sync	=	false,
	uiName 			= 	"BP14_Umbrella",
	
	spell_approach = "Spell_shipChild_Umbrella",
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.BP14_Umbrella, -- нужен чтобы ауры не стакались на Торнадо
}

Def.BP14_Hairpin = -- Модный прикид
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp14_hairpin/bp14_hairpin",
	network_sync	=	false,

}

--- Декоры BP15_1 / SPR24_1 "Скачок в бездну.". Первая фаза. SC-118487
 
Def.BP15_Dna = -- Двойная спираль
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp15_dna/bp15_dna",
	network_sync	=	false,

}

Def.BP15_Arc = -- Стабилизированный элемент
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp15_arc/bp15_arc",
	network_sync	=	false,
}

Def.BP15_Warnsign = -- Биологическая опасность
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp15_warnsign/bp15_warnsign",
	network_sync	=	false,
	death_custom_fx	=	"particles/decorative/biohazard",
	death_custom_fx_fade_dist_min =	35,
	death_custom_fx_fade_dist_max =	45,
	
}

Def.BP15_Rift = -- Полураспад
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp15_rift/bp15_rift",
	network_sync	=	false,

}

--- SC-118784 Декор "Сим" для корабля Vigilant

Def.Sim = -- Свет Истины
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/sim/sim",
	network_sync	=	false,
}

--- SC-118721 Декор "Солнечная система" для 12 апреля 2024

Def.Solar_System_2024 = -- Солнечная система
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp_15_solarsystem/solar_system_bp",
	network_sync	=	false,
	children	= {
					{ effect = "particles/decorative/solar_system", joint = "root", },
                  },
}

--- Декоры BP15_2 / SPR24_2 "Скачок в бездну.". Вторая фаза. SC-118843
 
Def.BP15_Rod = -- Столпы созидания
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp_15_rod/bp_15_rod",
	network_sync	=	false,
	children	= {
					{ effect = "particles/decorative/bp15_rod_lightnings", joint = "turn", },
                  },
}

Def.BP15_Crystalbrain = -- Разделённый разум (+FX)
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp_15_crystalbrain/bp_15_crystalbrain",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/brain_explode",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
}

Def.BP15_Pyramids = -- Постоянство времени
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp_15_pyramids/bp_15_pyramids",
	network_sync	=	false,
	death_custom_fx	=	"particles/decorative/biohazard",
	death_custom_fx_fade_dist_min =	35,
	death_custom_fx_fade_dist_max =	45,
	
}

Def.BP15_Atom = -- Ядро творения
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp15_atom/bp15_atom",
	network_sync	=	false,

}

--- SC-118621 Декоры. Боевой пропуск "Неведомые горизонты. Первая фаза": BP16_1 / SUM24_1. Лето 2024.
 
Def.BP16_Whirligig = -- Гипнотическая юла
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp16_whirligig/bp16_whirligig",
	network_sync	=	false,

}

Def.BP16_Jestercap = -- Шапка шута
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp16_jestercap/bp16_jestercap",
	network_sync	=	false,
}

Def.BP16_Trick = -- Фокус не по плану
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp16_trick/bp16_trick",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/ufo_trick",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,

}

Def.BP16_Drum = -- Тревожный Барабан
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp16_drum/bp16_drum",
	network_sync	=	false,

}

--- SC-118978 Уникальный декор Трофей Космобольца 2024

Def.Trophy_Decor_24 = -- Трофей Космобольца 2024
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/trophy/trophy_decor_24",
	network_sync	=	false,
}

--- SC-118837 Декоры. Боевой пропуск "Неведомые горизонты. Вторая фаза": BP16_2 / SUM24_2. Лето 2024.
 
Def.BP16_Airballoon = -- Аэростат
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp16_airballoon/bp16_airballoon",
	network_sync	=	false,
	children =
	{				
		{	effect = "particles/decorative/fire_airballoon", joint = "exhaust"	},
	}

}

Def.BP16_Shootinggallery = -- Тир (+ Победный VFX)
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp16_shootinggallery/bp16_shootinggallery",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/bp16_shootinggallery",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
}

Def.BP16_Carousel = -- Карусель
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp16_carousel/bp16_carousel",
	network_sync	=	false,
	children =
	{				
		{	effect = "particles/decorative/engine_carousel", joint = "exhaust"	},
		{	effect = "particles/decorative/engine_carousel", joint = "exhaust1"	},
		{	effect = "particles/decorative/engine_carousel", joint = "exhaust2"	},
		{	effect = "particles/decorative/engine_carousel", joint = "exhaust3"	},
	}
}

Def.BP16_Monkey = -- Мартышка
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp16_monkey/bp16_monkey",
	network_sync	=	false,

}

--- SC-118962 Декоры. Боевой пропуск "Сердце тьмы. Первая фаза". BP17_1 / AUT24_1. Осень 2024.
 
Def.BP17_Flora = -- Механо-лотос
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp17_flora/bp17_flora",
	network_sync	=	false,

}

Def.BP17_Repairrobot = -- BD-8 (+ Победный VFX)
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp17_repairrobot/bp17_repairrobot",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/repair_robot",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,

}

Def.BP17_Bird = -- Орлуша
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp17_bird/bp17_bird",
	network_sync	=	false,

}

Def.BP17_Gardener = -- Кинетоскоп
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp17_gardener/bp17_gardener",
	network_sync	=	false,

}

--- SC-119095 Декоры. Боевой пропуск "Сердце тьмы. Вторая фаза". BP17_2 / AUT24_2. Осень 2024.
 
Def.BP17_Cat = -- К9 (+ Победный VFX)
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp17_cat/bp17_cat",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/claw",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
}

Def.BP17_Dragonfly = -- Люминокрыл 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp17_dragonfly/bp17_dragonfly",
	network_sync	=	false,

}

Def.BP17_Spider = -- Ткач Реальности
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp17_spider/bp17_spider",
	network_sync	=	false,

}

Def.BP17_IBM = -- Партнёр 01.01
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp17_ibm/bp17_ibm",
	network_sync	=	false,
	children =
	{				
		{	effect = "particles/decorative/robot_emotional", joint = "exhaust"	},
	}

}

--- SC-119173 Декоры. Боевой пропуск "Забытые звезды. Первая фаза". BP18_1 / NY24_1. Зима 2024.
 
Def.BP18_Amazon = -- Амазон 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp18_amazon/bp18_amazon",
	network_sync	=	false,

}

Def.BP18_Snake = -- Кецаль (+ Победный VFX)
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp18_snake/bp18_snake",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/snake_kill",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
	children = 
	{
	
		{ effect = "particles/decorative/bp18_snake_glow", joint = "exhaust"	},
	}

}

Def.BP18_Dualmask = -- Дуальная маска
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp18_dualmask/bp18_dualmask",
	network_sync	=	false,

}

Def.BP18_Totem = -- Тотем огня
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp18_totem/bp18_totem",
	network_sync	=	false,
	children = 
	{
	
		{ effect = "particles/decorative/bp18_totem_fire", joint = "exhaust"	},
	}

}

--- SC-119282 Декоры. Боевой пропуск "Забытые звезды. Вторая фаза". BP18_2 / NY24_2. Зима 2024.
 
Def.BP18_Robot = -- Сгибатель (+ Победный VFX)
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp18_robot/bp18_robot",
    killer_custom_fx	=	"particles/decorative/bender",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
}

Def.BP18_Portal = -- Древние врата 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp18_portal/bp18_portal",
	network_sync	=	false,
	children = 
	{
	
		{ effect = "particles/decorative/portal", joint = "fx"	},
	}
}

Def.BP18_Mask = -- Ах-Пуч
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp18_mask/bp18_mask",
	network_sync	=	false,

}

Def.BP18_Quetzal = -- Амару
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp18_quetzal/bp18_quetzal",
	network_sync	=	false,

}

--- SC-119398 Декоры. Боевой пропуск "Союзники и соперники. Первая фаза". BP19_1 / SPR25_1. Весна 2025.
 
Def.BP19_Vynil = -- Винил
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp19_vynil/bp19_vynil",
	network_sync	=	false,
}

Def.BP19_Kinescope = -- Даю настройку! (+ Победный VFX (killer_custom_fx))
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp19_kinescope/bp19_kinescope",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/bp19_kinescope",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
}

Def.BP19_Radiolamp = -- Ламповая технология
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp19_radiolamp/bp19_radiolamp",
	network_sync	=	false,
}

Def.BP19_Object = -- Звёздный трекбол
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp19_object/bp19_object",
	network_sync	=	false,
	
	spell_approach = "Spell_shipChild_BP19_Object",
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.BP19_Object, -- нужен чтобы ауры не стакались на Торнадо
	
	uiName = "BP19_Object"
}

--- SC-119498 Декоры. Боевой пропуск "Союзники и соперники. Вторая фаза". BP19_2 / SPR25_2. Весна 2025.
 
Def.BP19_Quartz = -- iSCreen-333 Pro (+ Победный VFX (killer_custom_fx))
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp19_quartz/bp19_quartz",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/old_film_explosion",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
}

Def.BP19_Fab = -- Кузькина мачеха 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp19_fab/bp19_fab",
	network_sync	=	false,

}

Def.BP19_Ufo = -- Главный по тарелочкам
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp19_ufo/bp19_ufo",
	network_sync	=	false,
	children = 
	{
		{ effect = "particles/decorative/radar", joint = "cap"	},
	}
}

Def.BP19_Monoplane = -- Илюша
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp19_monoplane/bp19_monoplane",
	network_sync	=	false,
	
	uiName = "BP19_Object"
}

--- SC-119538 Декор на 12-е апреля, Весна 2025.

Def.BP19_Astronaut = -- Алексей Архипович (или "60 лет")
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp19_astronaut/bp19_astronaut",
	network_sync	=	false,
}

--- SC-119590 Декоры. Боевой пропуск "Предания древних. Первая фаза". BP20_1 / SUM25_1. Лето 2025.
 
Def.BP20_Epichero = -- Велес
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp20_epichero/bp20_epichero",
	network_sync	=	false,

}

Def.BP20_Goose = -- Гуси-лебеди (+ Победный VFX (killer_custom_fx))
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp20_goose/bp20_goose",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/bp20_goose",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,

}

Def.BP20_Handiwork = -- Прялка Мокоши
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp20_handiwork/bp20_handiwork",
	network_sync	=	false,

}

Def.BP20_Lizard = -- Малахитница
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp20_lizard/bp20_lizard",
	network_sync	=	false,
	
	uiName = "BP20_Object"
}

--- SC-119802 Уникальный декор Трофей Космобольца 2025

Def.Trophy_Decor_25 = -- Трофей Космобольца 2024
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/trophy/trophy_decor_25",
	network_sync	=	false,
}

--- SC-119651 Декоры. Боевой пропуск "Союзники и соперники. Вторая фаза". BP20_2 / SUM25_2. Лето 2025.
 
Def.BP20_Chicken = -- Курочка Ряба (+ Победный VFX (killer_custom_fx))
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp20_chicken/bp20_chicken",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/bp20_chicken",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,

}

Def.BP20_Izba = -- Дом Солнца 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp20_izba/bp20_izba",
	network_sync	=	false,

}

Def.BP20_Wheel = -- Супрядки

{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp20_wheel/bp20_wheel",
	network_sync	=	false,

}

Def.BP20_Bull = -- Дымковский бычок
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp20_bull/bp20_bull",
	network_sync	=	false,

}

--- SC-119778 Декоры. Боевой пропуск "Опустошенные миры. Первая фаза". BP21_1 / AUT25_1. Осень 2025.
 
Def.BP21_Helmet = -- Шлем Валькирии
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp21_helmet/bp21_helmet",
	network_sync	=	false,

}

Def.BP21_Talharpa = -- Тальхарпа 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp21_talharpa/bp21_talharpa",
	network_sync	=	false,

}

Def.BP21_Hammer = -- Молот Тора (+ Победный VFX (killer_custom_fx))

{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp21_hammer/bp21_hammer",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/hammer",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,

}

Def.BP21_Megalith = -- Мегалит
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp21_megalith/bp21_megalith",
	network_sync	=	false,

}

--- SC-120019 Декор + Победный VFX. Ежеквартальный Видеоконкурс «ФИЛЬМ СЕЗОНА».

Def.Film = -- Фильммейкер
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/film/film",
	network_sync	=	false,
	uiName 			= 	"shipChild_Film",
	
	killer_custom_fx	=	"particles/decorative/film_crab",
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
	
	spell_approach = "Spell_shipChild_Film",
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.shipChild_Film, -- нужен чтобы ауры не стакались на Торнадо
}

--- SC-119798 Декоры. Боевой пропуск "Опустошенные миры. Вторая фаза". BP21_2 / AUT25_2. Осень 2025.
 
Def.BP21_Drakkar = -- Драккар (+ эффект-модификатор)
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp21_drakkar/bp21_drakkar",
	network_sync	=	false,
	uiName 			= 	"shipChild_BP21_Drakkar",
	
	spell_approach = "Spell_shipChild_Drakkar",
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.BP21_Drakkar, -- нужен чтобы ауры не стакались на Торнадо
}

Def.BP21_Figurine = -- Хильдисвини
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp21_figurine/bp21_figurine",
	network_sync	=	false,

}

Def.BP21_Shield = -- Щит Хранителя

{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp21_shield/bp21_shield",
	network_sync	=	false,

}

Def.BP21_Anvil = -- Наковальня двергов
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp21_anvil/bp21_anvil",
	network_sync	=	false,

}

--- SC-119953 Декоры. Боевой пропуск "Перекрёсток галактик. Первая фаза". BP22_1 / NY26_1. Зима 2025 - 26
 
Def.BP22_Desertmask = -- Пустынник
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp22_desertmask/bp22_desertmask",
	network_sync	=	false,
	uiName 			= 	"shipChild_BP22_Desertmask",

}

Def.BP22_Cube = -- Куб Агонии
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp22_cube/bp22_cube",
	network_sync	=	false,

}

Def.BP22_Decoy = -- Ударник (+ Победный VFX (killer_custom_fx))

{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp22_decoy/bp22_decoy",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/bp22_worms",
	killer_custom_fx_fade_dist_min =	30,
	killer_custom_fx_fade_dist_max =	40,
}

Def.BP22_Vehicle = -- Сборщик
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp22_vehicle/bp22_vehicle",
	network_sync	=	false,

}

--- SC-120060 Вещь Т-825. Концепт-арт и модель декора на Хелоуинский ивент пасс, Осень 2025.

Def.Halloween_25 = -- Вещь Т-825
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/halloween_25/halloween_25",
	network_sync	=	false,
	uiName 			= 	"shipChild_Halloween_25",
	
	spell_approach = "Spell_shipChild_Halloween25",
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.Halloween_25, -- нужен чтобы ауры не стакались на Торнадо	
}

--- SC-120065 Декоры. Боевой пропуск "Перекрёсток галактик. Вторая фаза". BP22_2 / NY26_2. Зима 2025 - 26.
 
Def.BP22_Seal = -- Печать Императора (+ Победный VFX (killer_custom_fx))
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp22_seal/bp22_seal",
	network_sync	=	false,
	uiName 			= 	"BP22_Seal",
	killer_custom_fx	=	"particles/decorative/bp22_lion",
	killer_custom_fx_fade_dist_min =	30,
	killer_custom_fx_fade_dist_max =	40,
	
	spell_approach = "Spell_shipChild_Seal", -- +5ед резита корпуса на все 
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.BP22_Seal, -- нужен чтобы ауры не стакались на Торнадо
}

Def.BP22_Water = -- Вода жизни
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp22_water/bp22_water",
	network_sync	=	false,
	
	uiName 			= 	"BP22_Water",
	spell_approach = "Spell_shipChild_Water", -- +10% регена щита на все 
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.BP22_Water, -- нужен чтобы ауры не стакались на Торнадо
}

Def.BP22_Emblem = -- Вычислитель Ментата

{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp22_emblem/bp22_emblem",
	network_sync	=	false,
	
	uiName 			= 	"BP22_Emblem",
	spell_approach = "Spell_shipChild_Emblem", -- +5% входящего ремонта
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.BP22_Emblem, -- нужен чтобы ауры не стакались на Торнадо	
}

Def.BP22_Floatlamp = -- Парящая лампа
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp22_floatlamp/bp22_floatlamp",
	network_sync	=	false,
	
	uiName 			= 	"BP22_Floatlamp",
	spell_approach = "Spell_shipChild_Floatlamp", -- +5ед энергии в секунду
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.BP22_Floatlamp, -- нужен чтобы ауры не стакались на Торнадо	
}

--- SC-120209 Декоры. Боевой пропуск "Раскол альянсов". Первая фаза BP23_1 / SPR26_1. Весна 2026.
 
Def.BP23_Blade = -- Триада возмездия 
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp23_blade/bp23_blade",
	network_sync	=	false,

}

Def.BP23_Coin = -- Золотой стандарт (+ Победный VFX (killer_custom_fx))
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp23_coin/bp23_coin",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/bp23_coin",
	killer_custom_fx_fade_dist_min =	30,
	killer_custom_fx_fade_dist_max =	40,
}

Def.BP23_Book = -- Оптический анализатор

{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp23_book/bp23_book",
	network_sync	=	false,

}

Def.BP23_Board = -- Авангард-R
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp23_board/bp23_board",
	network_sync	=	false,

}

--- SC-120290 Декоры. Боевой пропуск "Раскол альянсов". Вторая фаза BP23_2 / SPR26_2. Весна 2026.
 
Def.BP23_Capsule = -- Энерго-капсула
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp23_capsule/bp23_capsule",
	network_sync	=	false,

}

Def.BP23_Crystal = -- Кристалл-анемон
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp23_crystal/bp23_crystal",
	network_sync	=	false,
}

Def.BP23_Banner = -- Имперский вымпел (+ Победный VFX (killer_custom_fx))

{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp23_banner/bp23_banner",
	network_sync	=	false,
	killer_custom_fx	=	"particles/decorative/bp23_angry_bird",
	killer_custom_fx_fade_dist_min =	30,
	killer_custom_fx_fade_dist_max =	40,
}

Def.BP23_Locator = -- Локатор
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp23_locator/bp23_locator",
	network_sync	=	false,

}

--- SC-120476 Декор "Клешня Ветерана". Финал 2026.

Def.Veteran_LClaw = -- КЛЕШНЯ ЛЕВАЯ (по курсу)
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/claw2026/veteran_leftclaw", -- для тестов, потом прописать годное "models/modules/decorative/claw2026/veteran_lclaw"
	network_sync	=	false,
	uiName 			= 	"shipChild_Veteran_LClaw",
	
	killer_custom_fx	=	"particles/decorative/film_crab", -- пока поставлен VFX от декора "Фильммейкер" (Def.Film) SC-120140
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
	
	spell_approach = "Spell_LClaw", -- пока поставлены модификаторы от декора "Фильммейкер" (Def.Film): на 10% снижение скорости нагрева орудий и захвата маяков
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.Veteran_LClaw, -- нужен чтобы ауры не стакались на Торнадо
}

Def.Veteran_RClaw = -- КЛЕШНЯ ПРАВАЯ (по курсу)
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/claw2026/veteran_rightclaw", -- для тестов, потом прописать годное "models/modules/decorative/claw2026/veteran_rclaw"
	network_sync	=	false,
	uiName 			= 	"shipChild_Veteran_RClaw",
	
	killer_custom_fx	=	"particles/decorative/film_crab", -- пока поставлен VFX от декора "Фильммейкер" (Def.Film) SC-120140
	killer_custom_fx_fade_dist_min =	35,
	killer_custom_fx_fade_dist_max =	45,
	
	spell_approach = "Spell_RClaw", -- пока поставлены модификаторы от декора "Фильммейкер" (Def.Film): на 10% снижение скорости нагрева орудий и захвата маяков
	spell_approach_trigger_radius = 100.0,
	spell_approach_respawn_timer = 3,
	item_subtype = ItemSubtype.Veteran_RClaw, -- нужен чтобы ауры не стакались на Торнадо	
}

--- SC-120371 Декоры. Боевой пропуск "Наследие предтеч". Первая фаза BP24_1 / SUM26_1. Лето 2026.
 
Def.BP24_Detector = -- Детектор Предтеч
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp24_detector/bp24_detector",
	network_sync	=	false,

}

Def.BP24_Sphere = -- Дайс Предтеч
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp24_sphere/bp24_sphere",
	network_sync	=	false,
}

Def.BP24_Mask = -- Маска Предтеч

{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp24_mask/bp24_mask",
	network_sync	=	false,
}

Def.BP24_Eye = -- Цифровое Око
{
	class			=	"ScBaseEntity",--'BaseEntity',
	model			=	"models/modules/decorative/bp24_eye/bp24_eye",
	network_sync	=	false,

}

---------------- SHIELDS ----------------

Def.ShieldBlue =
{
	class		=	'BaseEntity',
	in_editor	=	false,
	model		=	"models/shields/sphereshield",
}

Def.ShieldHuge =
{
	class		=	'BaseEntity',
	in_editor	=	false,
	model		=	"models/shields/hugesphereshield",
}

Def.Object_SpaceShield = 
{
	class 		= "SpaceShield",
	in_editor	= true,
	maxViewDist = 999999,
	physics		=	{ solid_type = solid.sphere, static = true, material = "EnergyShield", },

	light_color			= "91 176 128 255",
	texture				= "models/shields/shield_pattern_cyan",
	fadeout_anim		= "dacegikmoquazaamaamaaj",
	fadeout_duration	= 3.0,
	shield_fadeout_sound = "sound/ambient/pirate_shield_off",
}

Def.Object_SpaceShieldJericho = 
{
	class 		= "SpaceShield",
	in_editor	= true,
	maxViewDist = 999999,
	physics		=	{ solid_type = solid.sphere, static = true, material = "EnergyShield", },

	light_color			= "170 110 90 255",
	texture				= "models/shields/shield_pattern_jericho",
	fadeout_anim		= "dacegikmoquazaamaamaaj",
	fadeout_duration	= 3.0,
	shield_fadeout_sound = "sound/ambient/jericho_shield_off",
}

Def.Object_SpaceShieldJerichoFastFade = 
{
	class 		= "SpaceShield",
	in_editor	= true,
	maxViewDist = 999999,
	physics		=	{ solid_type = solid.sphere, static = true, material = "EnergyShield", },

	light_color			= "170 110 90 255",
	texture				= "models/shields/shield_pattern_jericho",
	fadeout_anim		= "dacegikmoquazaamaamaaj",
	fadeout_duration	= 0.1,
	shield_fadeout_sound = "sound/ambient/jericho_shield_off",
}

Def.Object_SpaceShield_AttachEffect = 
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	
	children = 
	{
		{ effect = "particles/areal/shield_generator", },
	},
}

Def.Object_SpaceShield_AttachEffectJer = 
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	
	2
}

Def.Object_Hangar_Laser = 
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	
	children = 
	{
		{ effect = "particles/areal/piratebay_laser", },
	},
}

Def.Menu_model =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/mm_model",
}

Def.rDrone =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"models/objects/drone_repair/drone_repair",
}

---------------- HANGARS ----------------

--- Federation Hangar ---

Def.Menu_model_hangar_sfincter_effect = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.45,
	effect_user2 = 0.45,
}

Def.Menu_model_hangar_sfincter_ShipEngine =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/m/r3_m_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_effect", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_sfincter_Ship_jerico =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/m/race2_m_t1",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_sfincter_ShipEngine", joint = "boost_2" },
	}
}
Def.Menu_model_hangar_sfincter_Ship_empire =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/m/race1_m_t1",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_sfincter_ShipEngine", joint = "boost_2" },
		--{ effect = "particles/gadget/confetti", joint = "root" },
	}
}

-- Корабль вылетающий прямо из сфинктера в федерацком ангаре

Def.Menu_model_hangar_sfincter=
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/sfincter/sfincter",
	
	children = 
	{
		{ def = "Menu_model_hangar_cellship_fed1", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_cellship_fed1 =
{
	class = "AnimatedEntity",
	model = "models/ships/race_3/m/race3_m_t5_craft_hangar",
	in_editor	=	false,
	children = 
	{
		{ def = "Menu_model_hangar_cellship_engmdl_fed1", joint = "engine_1" },
		{ def = "Menu_model_hangar_cellship_engmdl_fed1", joint = "engine_2" },
		{ def = "Menu_model_hangar_cellship_boostmdl_fed1", joint = "boost_1" },
		{ def = "Menu_model_hangar_cellship_boostmdl_fed1", joint = "boost_2" },
		{ def = "Menu_model_hangar_cellship_boostmdl_fed1", joint = "boost_3" },
		{ def = "Menu_model_hangar_cellship_boostmdl_fed1", joint = "boost_4" },
	}
}

Def.Menu_model_hangar_cellship_engmdl_fed1 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/m/r3_ship_fed_zim_eng",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_eng_fed1", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_cellship_eng_fed1 =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.28,
	effect_user2 = 0.28,
}

Def.Menu_model_hangar_cellship_boostmdl_fed1 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/m/r3_ship_fed_zim_boost",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_boost_fed1", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_cellship_boost_fed1 =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.08,
	effect_user2 = 0.08,
}

--- Корабли летающие в дали в федерацком ангаре

Def.Menu_model_hangar_FlyingAnim_fed =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/hng_ships_animation/hng_ships_animation",
	
	children = 
	{
		{ def = "Menu_model_hangar_FlyingAnim_Ship1_fed", joint = "ship1" },
		{ def = "Menu_model_hangar_FlyingAnim_Ship2_fed", joint = "ship2" },
		{ def = "Menu_model_hangar_FlyingAnim_Ship3_fed", joint = "ship3" },
	}
}

Def.Menu_model_hangar_FlyingAnim_Ship1_fed =
{
	class = "AnimatedEntity",
	model = "models/ships/race_3/m/race3_m_t4_hangar",
	in_editor	=	false,
	children = 
	{
		{ model = "models/ships/race_3/m/r3_m_boost1_l", joint = "boost_1"},
		{ model = "models/ships/race_3/m/r3_m_boost1_r", joint = "boost_2"},
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_fed", joint = "engine_1"},
	}
}

Def.Menu_model_hangar_FlyingAnim_Ship2_fed =
{
	class = "AnimatedEntity",
	model = "models/ships/race_3/m/race3_m_t5_hangar",
	in_editor	=	false,
	children = 
	{
		{ model = "models/ships/race_3/m/r3_m_boost1_l", joint = "boost_1"},
		{ model = "models/ships/race_3/m/r3_m_boost1_r", joint = "boost_2"},
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_fed", joint = "engine_1"},
	}
}

Def.Menu_model_hangar_FlyingAnim_Ship3_fed =
{
	class = "AnimatedEntity",
	model = "models/ships/race_3/m/race3_m_t2_hangar",
	in_editor	=	false,
	children = 
	{
		{ model = "models/ships/race_3/m/r3_m_boost1_l", joint = "boost_1"},
		{ model = "models/ships/race_3/m/r3_m_boost1_r", joint = "boost_2"},
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_fed", joint = "engine_1"},
	}
}

Def.Menu_model_hangar_FlyingAnim_ShipEngine_fed =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/m/r3_m_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_fedeng", joint = "exhaust" },
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_fedt", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_FlyingAnim_ShipEngine_fedt =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_trail",
	effect_user2 = 0.1,
	effect_color = "0 4 26 100",
}

Def.Menu_model_hangar_FlyingAnim_ShipEngine_fedeng =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.45,
	effect_user2 = 0.45,
}

--

Def.Menu_model_hangar_cell =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/cell/cell",
	
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_Ship_jericho", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_cellleft=
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/cell_left/cell_left",
	
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_Ship_jericho", joint = "ship_joint" },
	}
}

-- Корабль 1 залетающий в боксы в федерацком ангаре

Def.Menu_model_hangar_cellfed =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/cell/cell",
	
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_Ship_fed", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_sfincter_Ship_fed =
{
	class = "AnimatedEntity",
	model		=	"models/ships/race_3/m/race3_m_t1_hangar",
	in_editor	=	false,
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_boostmdll_fed", joint = "boost_1" },
		{ def = "Menu_model_hangar_sfincter_boostmdlr_fed", joint = "boost_2" },
		--{ effect = "particles/gadget/confetti", joint = "root" },
		{ def = "Menu_model_hangar_sfincter_engmdl_fed", joint = "engine_1" },
	}
}

Def.Menu_model_hangar_sfincter_engmdl_fed =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/m/r3_m_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_eng_fed", joint = "exhaust" },
		{ def = "Menu_model_hangar_sfincter_eng_fed", joint = "exhaust_1" },
	},
}

Def.Menu_model_hangar_sfincter_eng_fed = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.18,
	effect_user2 = 0.24,
}

Def.Menu_model_hangar_sfincter_boostmdll_fed =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/m/r3_m_boost1_l",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_boost_fed", joint = "exhaust" },
		{ def = "Menu_model_hangar_sfincter_boost_fed", joint = "exhaust_1" },
	},
}

Def.Menu_model_hangar_sfincter_boostmdlr_fed =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/m/r3_m_boost1_r",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_boost_fed", joint = "exhaust" },
		{ def = "Menu_model_hangar_sfincter_boost_fed", joint = "exhaust_1" },
	},
}

Def.Menu_model_hangar_sfincter_boost_fed = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.12,
	effect_user2 = 0.16,
}

-- Корабль 2 залетающий в боксы в федерацком ангаре

Def.Menu_model_hangar_cellleftfed =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/cell_left/cell_left",
	
	children = 
	{
		{ def = "Menu_model_hangar_cellship_fed2", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_cellship_fed2 =
{
	class = "AnimatedEntity",
	model		=	"models/ships/race_3/s/race3_s_t5_craft_hangar",
	in_editor	=	false,
	children = 
	{
		{ def = "Menu_model_hangar_cellship_engmdl_fed2", joint = "engine_1" },
		{ def = "Menu_model_hangar_cellship_boostmdl_fed2", joint = "boost_1" },
		{ def = "Menu_model_hangar_cellship_boostmdl_fed2", joint = "boost_2" },
	}
}

Def.Menu_model_hangar_cellship_engmdl_fed2 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/s/r3_s_craft_eng",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_eng_fed2", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_cellship_eng_fed2 =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.12,
	effect_user2 = 0.16,
}

Def.Menu_model_hangar_cellship_boostmdl_fed2 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/s/r3_s_craft_boost",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_boost_fed2", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_cellship_boost_fed2 =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.08,
	effect_user2 = 0.12,
}

--- Jericho Hangar ---

Def.Menu_model_hangar_sfincter_effect_jericho = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_r4",
	effect_user1 = 0.15,
	effect_user2 = 0.15,
}

Def.Menu_model_hangar_sfincter_ShipEngine_jericho =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_2/m/r2_m_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_effect_jericho", joint = "exhaust" },
		--{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_jertrail", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_sfincter_Ship_jericho =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_2/m/race2_m_t1",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_ShipEngine_jericho", joint = "boost_1" },
		{ def = "Menu_model_hangar_sfincter_ShipEngine_jericho", joint = "boost_2" },
	}
}

-- Корабль вылетающий прямо из сфинктера в ерихонском ангаре

Def.Menu_model_hangar_sfincter_jericho =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/sfincter/sfincter_jericho",
	
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_ship_jer", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_sfincter_ship_jer =
{
	class = "AnimatedEntity",
	model = "models/ships/race_2/m/race2_m_dragonfly_hangar",
	in_editor	=	false,
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_engmdl_jer", joint = "engine_1" },
		{ def = "Menu_model_hangar_sfincter_boostmdll_jer", joint = "boost_1" },
		{ def = "Menu_model_hangar_sfincter_boostmdlr_jer", joint = "boost_2" },
		{ def = "Menu_model_hangar_sfincter_boostmdlr_jer", joint = "boost_3" },
		{ def = "Menu_model_hangar_sfincter_boostmdlr_jer", joint = "boost_4" },
		--{ effect = "particles/gadget/confetti", joint = "root" },
	}
}

Def.Menu_model_hangar_sfincter_engmdl_jer =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_2/m/r2_m_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_eng_jer", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_sfincter_eng_jer = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_r4",
	effect_user1 = 0.12,
	effect_user2 = 0.2,
}

Def.Menu_model_hangar_sfincter_boostmdll_jer =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_2/m/r2_m_boost1_l",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_boost_jer", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_sfincter_boostmdlr_jer =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_2/m/r2_m_boost1_r",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_boost_jer", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_sfincter_boost_jer = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_r4",
	effect_user1 = 0.12,
	effect_user2 = 0.2,
}

--- Корабли летающие в дали в ерихонском ангаре

Def.Menu_model_hangar_FlyingAnim_ShipEngine_jericho =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_2/m/r2_m_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_jereng", joint = "exhaust" },
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_jertrail", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_FlyingAnim_ShipEngine_jereng =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_r4",
	effect_user1 = 0.25,
	effect_user2 = 0.25,
}

Def.Menu_model_hangar_FlyingAnim_ShipEngine_jertrail =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_trail",
	effect_user2 = 0.1,
	effect_color = "50 0 0 100",
}

Def.Menu_model_hangar_FlyingAnim_Ship1_jericho =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_2/m/race2_m_t4_hangar",
	children = 
	{
		{ model = "models/ships/race_2/m/r2_m_boost1_l", joint = "boost_1"},
		{ model = "models/ships/race_2/m/r2_m_boost1_r", joint = "boost_2"},
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_jericho", joint = "engine_1"},
	}
}

Def.Menu_model_hangar_FlyingAnim_Ship2_jericho =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_2/m/race2_m_t5_hangar",
	children = 
	{
		{ model = "models/ships/race_2/m/r2_m_boost1_l", joint = "boost_1"},
		{ model = "models/ships/race_2/m/r2_m_boost1_r", joint = "boost_2"},
		{ model = "models/ships/race_2/m/r2_m_boost1_l", joint = "boost_3"},
		{ model = "models/ships/race_2/m/r2_m_boost1_r", joint = "boost_4"},
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_jericho", joint = "engine_1"},
	}
}

Def.Menu_model_hangar_FlyingAnim_Ship3_jericho =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_2/m/race2_m_t2_hangar",
	children = 
	{
		{ model = "models/ships/race_2/m/r2_m_boost1_l", joint = "boost_1"},
		{ model = "models/ships/race_2/m/r2_m_boost1_r", joint = "boost_2"},
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_jericho", joint = "engine_1"},
	}
}

Def.Menu_model_hangar_FlyingAnim_jericho =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/hng_ships_animation/hng_ships_animation",
	
	children = 
	{
		{ def = "Menu_model_hangar_FlyingAnim_Ship1_jericho", joint = "ship1" },
		{ def = "Menu_model_hangar_FlyingAnim_Ship2_jericho", joint = "ship2" },
		{ def = "Menu_model_hangar_FlyingAnim_Ship3_jericho", joint = "ship3" },
	}
}

Def.Menu_model_hangar_cell_jericho=
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/cell/cell_jericho",
	
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_Ship_jericho", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_cellleft_jericho=
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/cell_left/cell_left_jericho",
	
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_Ship_jericho", joint = "ship_joint" },
	}
}

--- Empire Hangar ---
Def.Menu_model_hangar_sfincter_effect_empire = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_y3",
	effect_user1 = 0.25,
	effect_user2 = 0.25,
}

Def.Menu_model_hangar_sfincter_ShipEngine_empire =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/m/r1_m_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_effect_empire", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_sfincter_Ship_empire =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/m/race1_m_t1",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_ShipEngine_empire", joint = "boost_1" },
		{ def = "Menu_model_hangar_sfincter_ShipEngine_empire", joint = "boost_2" },
	}
}

-- Корабль вылетающий прямо из сфинктера в имперском ангаре

Def.Menu_model_hangar_sfincter_empire =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/sfincter/sfincter_empire",
	
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_ship_emp", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_sfincter_ship_emp =
{
	class = "ScBaseEntity",
	model = "models/ships/race_1/m/race1_m_t1_m2_hangar",
	in_editor	=	false,
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_engmdl_emp", joint = "engine_1" },
		{ def = "Menu_model_hangar_sfincter_boostmdl_emp", joint = "boost_1" },
		{ def = "Menu_model_hangar_sfincter_boostmdl_emp", joint = "boost_2" },
		{ def = "Menu_model_hangar_sfincter_boostmdl_emp", joint = "boost_4" },
		--{ effect = "particles/gadget/confetti", joint = "root" },
	}
}

Def.Menu_model_hangar_sfincter_engmdl_emp =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/m/race1_m_t1_m2_eng",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_eng_emp", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_sfincter_eng_emp = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_y3",
	effect_user1 = 0.2,
	effect_user2 = 0.16,
}

Def.Menu_model_hangar_sfincter_boostmdl_emp =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/m/race1_m_t1_m2_boost",
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_boost_emp", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_sfincter_boost_emp = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_y3",
	effect_user1 = 0.12,
	effect_user2 = 0.12,
}

-- Корабли летающие в дали в имперском ангаре

Def.Menu_model_hangar_FlyingAnim_empire =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/hng_ships_animation/hng_ships_animation",
	
	children = 
	{
		{ def = "Menu_model_hangar_FlyingAnim_Ship1_empire", joint = "ship1" },
		{ def = "Menu_model_hangar_FlyingAnim_Ship2_empire", joint = "ship2" },
		{ def = "Menu_model_hangar_FlyingAnim_Ship3_empire", joint = "ship3" },
	}
}

Def.Menu_model_hangar_FlyingAnim_Ship1_empire =
{
	class = "AnimatedEntity",
	model		=	"models/ships/race_1/m/race1_m_t4_hangar",
	in_editor	=	false,
	children = 
	{
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_empire", joint = "engine_1"},
	}
}

Def.Menu_model_hangar_FlyingAnim_Ship2_empire =
{
	class = "AnimatedEntity",
	model		=	"models/ships/race_1/m/race1_m_t3_hangar",
	in_editor	=	false,
	children = 
	{
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_empire", joint = "engine_1"},
	}
}

Def.Menu_model_hangar_FlyingAnim_Ship3_empire =
{
	class = "AnimatedEntity",
	model		=	"models/ships/race_1/m/race1_m_t5_hangar",
	children = 
	{
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_empire", joint = "engine_1"},
	}
}

Def.Menu_model_hangar_FlyingAnim_ShipEngine_empire =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/m/r1_m_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_empeng", joint = "exhaust" },
		{ def = "Menu_model_hangar_FlyingAnim_ShipEngine_emptrail", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_FlyingAnim_ShipEngine_emptrail =
{
	class = "EffectEntity",
	effect_color = "121 36 1 100",
	effect = "particles/ships/ship_trail",
	effect_user2 = 0.1,
}

Def.Menu_model_hangar_FlyingAnim_ShipEngine_empeng =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_y3",
	effect_user1 = 0.3,
	effect_user2 = 0.3,
}

-- Корабль 1 залетающий в боксы в имперском ангаре

Def.Menu_model_hangar_cell_empire =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/cell/cell_empire",
	
	children = 
	{
		{ def = "Menu_model_hangar_cellship_emp", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_cellship_emp =
{
	class = "AnimatedEntity",
	model		=	"models/ships/race_1/m/race1_m_t2m2_hangar",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_engmdl_emp", joint = "engine_1" },
		{ def = "Menu_model_hangar_cellship_boostmdl_emp", joint = "boost_1" },
		{ def = "Menu_model_hangar_cellship_boostmdl_emp", joint = "boost_2" },
	}
}

Def.Menu_model_hangar_cellship_engmdl_emp =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/m/race1_m_t2m2_eng",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_eng_emp", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_cellship_eng_emp =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_y1",
	effect_user1 = 0.15,
	effect_user2 = 0.15,
}

Def.Menu_model_hangar_cellship_boostmdl_emp =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/m/race1_m_t2m2_boost",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_boost_emp", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_cellship_boost_emp =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_y1",
	effect_user1 = 0.03,
	effect_user2 = 0.03,
}

-- Корабль 2 залетающий в боксы в имперском ангаре

Def.Menu_model_hangar_cellleft_empire =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/cell_left/cell_left_empire",
	
	children = 
	{
		{ def = "Menu_model_hangar_cellship_emp2", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_cellship_emp2 =
{
	class = "AnimatedEntity",
	model	= "models/ships/race_1/s/race1_s_t5_hangar",
	in_editor	=	false,
	children = 
	{
		{ def = "Menu_model_hangar_cellship_engmdl_emp2", joint = "engine_1" },
		{ def = "Menu_model_hangar_cellship_boostmdll_emp2", joint = "boost_1" },
		{ def = "Menu_model_hangar_cellship_boostmdlr_emp2", joint = "boost_2" },
		{ def = "Menu_model_hangar_cellship_boostmdll_emp2", joint = "boost_3" },
		{ def = "Menu_model_hangar_cellship_boostmdlr_emp2", joint = "boost_4" },
	}
}

Def.Menu_model_hangar_cellship_engmdl_emp2 =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/s/race1_s_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_eng_emp2", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_cellship_eng_emp2 =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_y3",
	effect_user1 = 0.11,
	effect_user2 = 0.11,
}

Def.Menu_model_hangar_cellship_boostmdll_emp2 =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/s/race1_s_boost1_l",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_boost_emp2", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_cellship_boostmdlr_emp2 =
{
	class = "AnimatedEntity",
	in_editor	=	false,
	model		=	"models/ships/race_1/s/race1_s_boost1_r",
	children = 
	{
		{ def = "Menu_model_hangar_cellship_boost_emp2", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_cellship_boost_emp2 =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_y3",
	effect_user1 = 0.07,
	effect_user2 = 0.07,
}

--- Other ---

Def.Menu_model_hangar_sfincter_funny =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/sfincter/sfincter_funny",
	
	children = 
	{
		{ def = "Menu_model_hangar_sfincter_Ship", joint = "ship_joint" },
	}
}

Def.Menu_model_hangar_robot1 =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/serv_robot/serv_robot",
}

Def.Menu_model_hangar_qrobot =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/qrobot/qrobot",
}

Def.Menu_model_hangar_hand =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/hand/hand",
}

Def.Menu_model_hangar_human =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/human/human",
	--model		=	"mapskit/mainmenu/models/human_ny/human_ny", -- New Year
}

Def.Menu_model_hangar_humaninscrub =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/human/humaninscrub",
}

Def.Menu_model_hangar_woman =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/woman/woman", 
	--model		=	"mapskit/mainmenu/models/woman_ny/woman_ny", -- New Year
}

Def.Menu_model_hangar_human_ny =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/human_ny/human_ny",
}

Def.Menu_model_hangar_woman_ny =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/woman_ny/woman_ny",
}

Def.Test_point = 
{
	class		=	"ScBaseEntity",
	in_editor	=	false,
--	model		= "models/characters/pilot/pilot01",
--	model		=	"models/objects/illuminate/lighthouse_01/lighthouse_01",
--	physics		=	{ solid_type = solid.compound_model, mass = 10000, material = "Metal", },
}

Def.Test_smuggler =
{
	inherit			= "CargoShip",
	relationship_group 	= ai.RelationshipGroups.Pirate,
	health 			= 70000,
	max_lin_speed		= 7,
	children = {},
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", },
	model			= "models/ships/race_2/m/race2_m_t4_premium",
	death_wreck		= "Wreck_R2_M",
}

--типа прицел майнинга
Def.Test_PointTarget =
{
	class					=	"ScBaseEntity",
	in_editor				=	false,
	health 					= 500, --50000
	damageable				= true,
	hudType 				= "default",
	relationship_group 		= 15, --ai.RelationshipGroups.Neutral1, --ai.RelationshipGroups.Pirate,
	--effect 				= "particles/other/singularity_cannon_projectile_red",
	--physics				= { solid_type = solid.sphere, static = true, material = "EnergyShield", },
	model					= "models/objects/gameplay/bombball/bombball_orbit",
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk1", static = true, },
	uiName					= "DummyTarget",
}

--Сущность для определения секретной точки (rare_crate.lua)
Def.PointRareCrate =
{
	class		=	"ScBaseEntity",
	in_editor	=	false,
}

-- Обломки генератора предтеч
Def.Debris_Precursor_Wreck1 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck01",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}
Def.Debris_Precursor_Wreck2 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck02",
	physics				= { solid_type = solid.model, mass = 2000, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Wreck3 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck03",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Wreck4 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck04",
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Wreck5 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck05",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Wreck6 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck06",
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Wreck7 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck07",
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Wreck9 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck09",
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_WreckPlate =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck_plate",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Gen_Connector =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_gen_connector",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Gen_Base =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_gen_generatorbase",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Gen_Supports =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_gen_supports",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Gen_Minigen =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_minigen",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_WreckPlate2 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_wreck_plate2",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_WreckBalk1 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_balk01",
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_WreckBalk2 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_balk02",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_BottomFull =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_bottom_full",
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_BottomBroken =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_bottom_broken",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Plate1 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_plates01",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Plate2 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_plates02",
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Plate3 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_plates03",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Plate4 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_plates04",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Plate5 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_plates05",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Plate6 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_plates06",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Plate7 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_plates07",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Debris_Precursor_Plate8 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "mapskit/maps/models/precursors/pc_plates08",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}

Def.Lamp01 =
{
	class 				= "BaseEntity",
	in_editor			= true,
	model				= "models/objects/illuminate/lamp_01/lamp_01",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
}
Def.MonitorBig =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "models/objects/illuminate/monitor/jer_monitor_big",
}
-------- TEST items
Def.Dummy_R1_S = 
{
	class		=	'ShipWreck',
	model		=	"models/ships/race_1/s/race1_s_t1",	
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
}
Def.Dummy_R1_M = 
{
	class		=	'ShipWreck',
	model		=	"models/ships/race_1/m/race1_m_t3",	
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
}
Def.Dummy_R1_L = 
{
	class		=	'ShipWreck',
	model		=	"models/ships/race_1/l/race1_l_t3",	
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
}
Def.fedHungarTool =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "models/characters/fed/fed_mercenary_tool",
}
Def.FedMercenaryMan =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "models/characters/fed/fed_mercenary_man",
}
Def.DrillStation =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "mapskit/maps/models/drill/drill",
	children 	= 	{{ effect ="particles/areal/drill_rocks", joint = "drill_fx" },},
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
}
Def.CrystalSmall =
{
	class 		= "BaseEntity",
	in_editor	= true,
	model		= "mapskit/maps/models/crystal/crystal_s",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist = 999999,
}
Def.CrystalMedium =
{
	class 		= "BaseEntity",
	in_editor			= true,
	damageable			= true,
	model		= "mapskit/maps/models/crystal/crystal_m",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist = 999999,
}

Def.CrystalBig =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	damageable			= true,
	model		= "mapskit/maps/models/crystal/crystal_b",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist = 999999,
	health 			= 300000,
	signature		= ai.Signature.HUGE,
	hudType			= "default",
	hud_visibility_type = "major",
	vision_always 		= true,
	relationship_group 	= 1,
	hack_immune		= true,
}

Def.Drillbot =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "mapskit/maps/models/drill/drill_bot",
	children 	= 	{{ effect ="particles/areal/drill_crystals", joint = "drill_fx" },},
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.Precursors_AnimatedCore =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "mapskit/maps/models/precursors/pc_animated_core",
	children 	= 	{{ effect ="particles/areal/huge_stuff/precursors_core", joint = "root" },},
	physics		= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Precursors_AnimatedRocks =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "mapskit/maps/models/precursors/pc_animated_rocks",
	physics		= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Platform_EmpDreadnought =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "models/objects/gameplay/platform/bs_platform_empire",
	physics		= { solid_type = solid.model, static = true, material = "Metal" },
}

Def.Platform_FedDreadnought =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "models/objects/gameplay/platform/bs_platform_fed",
	physics		= { solid_type = solid.model, static = true, material = "Metal" },
}

Def.Platform_JerDreadnought =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "models/objects/gameplay/platform/bs_platform_jericho",
	physics		= { solid_type = solid.model, static = true, material = "Metal" },
}

Def.Postament_JerAchive =
{
	class 		= "BaseEntity",
	in_editor	= true,
	model		= "models/objects/gameplay/dreadnought_achieve/dreadnought_achieve_01",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist = 999999,
	--children 	= 	{{ def ="Postament_JerHologramShip2", joint = "root" },},
}

Def.Postament_JerHologramShip2 =
{
	class 		= "ScBaseEntity",
	model		= "models/misc/hologram_ship_2",
	skin		= "jer",
	maxViewDist = 999999,
	children 	= 	{{ effect ="particles/gadget/hologram_distortion_jer", joint = "center" },},
}

Def.Postament_FedAchive =
{
	class 		= "BaseEntity",
	in_editor	= true,
	model		= "models/objects/gameplay/dreadnought_achieve/dreadnought_achieve_03",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist = 999999,
	--children 	= 	{{ def ="Postament_FedHologramShip2", joint = "root" },},
}

Def.Postament_FedHologramShip2 =
{
	class 		= "ScBaseEntity",
	model		= "models/misc/hologram_ship_2",
	skin		= "fed",
	maxViewDist = 999999,
	children 	= 	{{ effect ="particles/gadget/hologram_distortion_fed", joint = "center" },},
}

Def.Postament_EmpAchive =
{
	class 		= "BaseEntity",
	in_editor	= true,
	model		= "models/objects/gameplay/dreadnought_achieve/dreadnought_achieve_02",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist = 999999,
	--children 	= 	{{ def ="Postament_EmpHologramShip2", joint = "root" },},
}

Def.Postament_EmpHologramShip2 =
{
	class 		= "ScBaseEntity",
	model		= "models/misc/hologram_ship_2",
	skin		= "default",
	maxViewDist = 999999,
	children 	= 	{{ effect ="particles/gadget/hologram_distortion", joint = "center" },},
}

--сосульки
Def.Special_Icicles01 =
{
	class 			= "ScBaseEntity",
	model			= "models/objects/gameplay/ice/icicles/icicles_01",
	maxViewDist 	= 999999,
	in_editor		= true,
	health 			= 1,
	damageable		= true,
	physics			= { solid_type = solid.model, material = "Rock", static = true, },
}

Def.Special_Icicles02 =
{
	class 			= "ScBaseEntity",
	model			= "models/objects/gameplay/ice/icicles/icicles_02",
	maxViewDist 	= 999999,
	in_editor		= true,
	health 			= 1,
	damageable		= true,
	physics			= { solid_type = solid.model, material = "Rock", static = true, },
}

Def.Special_Icicles03 =
{
	class 			= "ScBaseEntity",
	model			= "models/objects/gameplay/ice/icicles/icicles_03",
	maxViewDist 	= 999999,
	in_editor		= true,
	health 			= 1,
	damageable		= true,
	physics			= { solid_type = solid.model, material = "Rock", static = true, },
}

Def.Special_Icicles04 =
{
	class 			= "ScBaseEntity",
	model			= "models/objects/gameplay/ice/icicles/icicles_04",
	maxViewDist 	= 999999,
	in_editor		= true,
	health 			= 1,
	damageable		= true,
	physics			= { solid_type = solid.model, material = "Rock", static = true, },
}

Def.Special_Icicles05 =
{
	class 			= "ScBaseEntity",
	model			= "models/objects/gameplay/ice/icicles/icicles_05",
	maxViewDist 	= 999999,
	in_editor		= true,
	health 			= 1,
	damageable		= true,
	physics			= { solid_type = solid.model, material = "Rock", static = true, },
}

Def.Special_Icicles06 =
{
	class 			= "ScBaseEntity",
	model			= "models/objects/gameplay/ice/icicles/icicles_06",
	maxViewDist 	= 999999,
	in_editor		= true,
	health 			= 1,
	damageable		= true,
	physics			= { solid_type = solid.model, material = "Rock", static = true, },
}

Def.Special_Icicles07 =
{
	class 			= "ScBaseEntity",
	model			= "models/objects/gameplay/ice/icicles/icicles_07",
	maxViewDist 	= 999999,
	in_editor		= true,
	health 			= 1,
	damageable		= true,
	physics			= { solid_type = solid.model, material = "Rock", static = true, },
}

Def.Special_Icicles08 =
{
	class 			= "ScBaseEntity",
	model			= "models/objects/gameplay/ice/icicles/icicles_08",
	maxViewDist 	= 999999,
	in_editor		= true,
	health 			= 1,
	damageable		= true,
	physics			= { solid_type = solid.model, material = "Rock", static = true, },
}

Def.Crane_Crane =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "models/objects/gameplay/crane/crane",
	physics			= { solid_type = solid.none, static = true },	
	
	children = 
	{
		{ def = "Crane_Box_01", joint = "Box1" },
		{ def = "Crane_Box_02", joint = "Box2" },
		{ def = "Crane_Box_03", joint = "Box3" },
		{ def = "Crane_Box_04", joint = "Box4" },
		{ def = "Crane_Podemnik", joint = "Podemnik" },
		{ def = "Crane_Rotate", joint = "Rotate" },		
	},	
}

--
Def.Crane_Box_01 =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	model			= "models/objects/gameplay/crane/crane_box_01", 
	physics			= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 100000000, },
}

Def.Crane_Box_02 =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	model			= "models/objects/gameplay/crane/crane_box_02", 
	physics			= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 100000000, },
}

Def.Crane_Box_03 =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	model			= "models/objects/gameplay/crane/crane_box_03", 
	physics			= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 100000000, },
}

Def.Crane_Box_04 =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	model			= "models/objects/gameplay/crane/crane_box_04", 
	physics			= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 100000000, },
}

Def.Crane_Podemnik =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	model			= "models/objects/gameplay/crane/crane_podemnik", 
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
}

Def.Crane_Rotate =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	model			= "models/objects/gameplay/crane/crane_rotate", 
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
}

Def.gameplay_fan01 = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	physics		= { solid_type = solid.model, static = true, material = "Metal"  },
	model		=	"models/objects/gameplay/fan/fan_01",
}

Def.gameplay_fan02 = 
{
	class 		= "AnimatedEntity",
	in_editor	=	true,
	model		=	"models/objects/gameplay/fan/fan_02",
}

Def.Effects_Dreadnought_PlanetWarEngine =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/planetwar_engine",
	children 	= 	{{ def ="Effects_Dreadnought_PlanetWarEngineEffect", joint = "fx1" },},
	maxViewDist = 999999,
}

Def.Effects_Dreadnought_PlanetWarEngineEffect =
{
	class = "EffectEntity",
	effect = "particles/ships/planetwar_engine",
	in_editor	= true,
	maxViewDist = 999999,
}

--- Federation Hangar POLICE ---

Def.Menu_model_hangar_portal_hangar_effect = 
{
	class = "EffectEntity",
	in_editor = true,
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.3,
	effect_user2 = 0.3,
}

Def.Menu_model_hangar_portal_smoke = 
{
	class = "EffectEntity",
	in_editor = true,
	effect = "particles/ships/ship_smoke",
}

Def.Menu_model_hangar_portal_hangar_effect_pl = 
{
	class = "EffectEntity",
	in_editor = true,
	--effect = "particles/ships/police_lights",
}

Def.Menu_model_hangar_portal_hangar_police_trail = 
{
	class = "EffectEntity",
	in_editor = true,
	--effect = "particles/ships/blue_ship_trail_police",
}

Def.Menu_model_hangar_portal_hangar_ShipEngine =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"models/ships/race_3/m/r3_m_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_effect", joint = "exhaust" },
	}
}

Def.Menu_model_hangar_portal_hangar_effect_weapon = 
{
	class = "EffectEntity",
	in_editor = true,
	--effect = "particles/weapons/plasma_hangar_police",
}

Def.Menu_model_hangar_portal_hangar_Ship1 =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"models/ships/race_3/l/race3_m_t4",
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_2" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "engine_1" },
		--{ def = "Menu_model_hangar_portal_hangar_police_trail", joint = "engine_1" },
		
	}
}

Def.Menu_model_hangar_portal_hangar_Ship3 =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"models/ships/race_2/l/race2_l_t1",
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_2" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "engine_1" },
		--{ def = "Menu_model_hangar_portal_hangar_police_trail", joint = "engine_1" },
		{ def = "Menu_model_hangar_portal_smoke", joint = "rcs_6" },
	}
}	
Def.Menu_model_hangar_portal_hangar_Ship5_police =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"models/ships/race_2/m/race2_m_t4_police",
	children = 
	{
	    { def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_2" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "engine_1" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_weapon", joint = "gun_3" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_weapon", joint = "gun_2" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_pl", joint = "police_fx1" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_pl", joint = "police_fx2" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_pl", joint = "capacitor_1" },
		--{ def = "Menu_model_hangar_portal_hangar_police_trail", joint = "engine_1" },

	}
}	

Def.Menu_model_hangar_ship_federation =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	precache_skins	=	true,
	model		=	"mapskit/mainmenu/models/sfincter/ship_fed",
	
	children = 
	{
	--	{ def = "Menu_model_hangar_portal_hangar_Ship2", joint = "ship_connect1" },
		{ def = "Menu_model_hangar_portal_hangar_Ship5_police", joint = "ship_connect2" },
		{ def = "Menu_model_hangar_portal_hangar_Ship5_police", joint = "ship_connect3" },
		{ def = "Menu_model_hangar_portal_hangar_Ship5_police", joint = "ship_connect4" },
		
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_2" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "engine_1" },
		--{ def = "Menu_model_hangar_portal_hangar_police_trail", joint = "engine_1" },
		{ def = "Menu_model_hangar_portal_smoke", joint = "boost_1" },
	}
}

Def.Menu_model_hangar_ship_jericho =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	precache_skins	=	true,
	model		=	"mapskit/mainmenu/models/sfincter/ship_jericho",
	
	children = 
	{
	--	{ def = "Menu_model_hangar_portal_hangar_Ship2", joint = "ship_connect1" },
		{ def = "Menu_model_hangar_portal_hangar_Ship5_police", joint = "ship_connect2" },
		{ def = "Menu_model_hangar_portal_hangar_Ship5_police", joint = "ship_connect3" },
		{ def = "Menu_model_hangar_portal_hangar_Ship5_police", joint = "ship_connect4" },
		
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_2" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "engine_1" },
		--{ def = "Menu_model_hangar_portal_hangar_police_trail", joint = "engine_1" },
		{ def = "Menu_model_hangar_portal_smoke", joint = "boost_1" },
	}
}

Def.Menu_model_hangar_ship_empire =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	precache_skins	=	true,
	model		=	"mapskit/mainmenu/models/sfincter/ship_empire",
	
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_Ship5_police", joint = "ship_connect2" },
		{ def = "Menu_model_hangar_portal_hangar_Ship5_police", joint = "ship_connect3" },
		{ def = "Menu_model_hangar_portal_hangar_Ship5_police", joint = "ship_connect4" },
		
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_2" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "engine_1" },
		--{ def = "Menu_model_hangar_portal_hangar_police_trail", joint = "engine_1" },
		{ def = "Menu_model_hangar_portal_smoke", joint = "boost_1" },
	}
}

-- Садящийся и взлетаюший корабль в федерацком ангаре

Def.Menu_model_hangar_ship_down_federation=
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"models/misc/ship_up_down",
	
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_Ship2", joint = "ship" },
	}
}

Def.Menu_model_hangar_portal_hangar_Ship2 =
{
	class = "AnimatedEntity",
	model = "models/ships/race_3/l/race3_l_t1_hangar",
	in_editor	=	true,
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_boostmdl_fed", joint = "boost_1" },
		{ def = "Menu_model_hangar_portal_hangar_boostmdl_fed", joint = "boost_2" },
		{ def = "Menu_model_hangar_portal_hangar_engmdl_fed", joint = "engine_1" },
	}
}

Def.Menu_model_hangar_portal_hangar_engmdl_fed =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/l/r3_l_eng1",
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_eng_fed", joint = "exhaust" },
		{ def = "Menu_model_hangar_portal_hangar_eng_fed2", joint = "exhaust_1" },
		{ def = "Menu_model_hangar_portal_hangar_eng_fed2", joint = "exhaust_2" },
	}
}

Def.Menu_model_hangar_portal_hangar_eng_fed = 
{
	class = "EffectEntity",
	in_editor = true,
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.3,
	effect_user2 = 0.3,
}

Def.Menu_model_hangar_portal_hangar_eng_fed2 = 
{
	class = "EffectEntity",
	in_editor = true,
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.15,
	effect_user2 = 0.15,
}

Def.Menu_model_hangar_portal_hangar_boostmdl_fed =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/ships/race_3/l/r3_l_boost1",
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_boost_fed", joint = "exhaust" },
		{ def = "Menu_model_hangar_portal_hangar_boost_fed", joint = "exhaust_1" },
	}
}

Def.Menu_model_hangar_portal_hangar_boost_fed = 
{
	class = "EffectEntity",
	in_editor = true,
	effect = "particles/ships/ship_engine_b3",
	effect_user1 = 0.2,
	effect_user2 = 0.2,
}

--- Empire Hangar POLICE ---

Def.Menu_model_hangar_portal_hangar_Ship4_police =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"models/ships/race_1/m/race1_m_t4_police",
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_2" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "engine_1" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_weapon", joint = "gun_3" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_weapon", joint = "gun_2" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_pl", joint = "police_fx1" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_pl", joint = "police_fx2" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_pl", joint = "capacitor_1" },
		--{ def = "Menu_model_hangar_portal_hangar_police_trail", joint = "engine_1" },
	}
}	

Def.Menu_model_hangar_portal_hangar_empire=
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/sfincter/portal_hangar",
	
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_Ship1", joint = "ship_connect1" },
		{ def = "Menu_model_hangar_portal_hangar_Ship4_police", joint = "ship_connect2" },
		{ def = "Menu_model_hangar_portal_hangar_Ship4_police", joint = "ship_connect3" },
		{ def = "Menu_model_hangar_portal_hangar_Ship4_police", joint = "ship_connect4" },
	}
}

--- Jericho Hangar POLICE ---
Def.Menu_model_hangar_portal_hangar_Ship6_police =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"models/ships/race_3/m/race3_m_t4_police",
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_1" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "boost_2" },
		{ def = "Menu_model_hangar_portal_hangar_ShipEngine", joint = "engine_1" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_weapon", joint = "gun_3" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_weapon", joint = "gun_2" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_pl", joint = "police_fx1" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_pl", joint = "police_fx2" },
		--{ def = "Menu_model_hangar_portal_hangar_effect_pl", joint = "capacitor_1" },
		--{ def = "Menu_model_hangar_portal_hangar_police_trail", joint = "engine_1" },

	}
}

Def.Effects_PlanetWar_RadiationSteam1 =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/radiation_steam1",
	maxViewDist = 999999,
}
Def.Effects_PlanetWar_RadiationSteam2 =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/radiation_steam2",
	maxViewDist = 999999,
}
Def.Effects_PlanetWar_RadiationSteam3 =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/radiation_steam3",
	maxViewDist = 999999,
}
Def.Effects_PlanetWar_RadiationSteam4 =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/radiation_steam4",
	maxViewDist = 999999,
}

Def.Menu_model_hangar_portal_hangar_jericho=
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/sfincter/portal_hangar",
	
	children = 
	{
		{ def = "Menu_model_hangar_portal_hangar_Ship3", joint = "ship_connect1" },
		{ def = "Menu_model_hangar_portal_hangar_Ship6_police", joint = "ship_connect2" },
		{ def = "Menu_model_hangar_portal_hangar_Ship6_police", joint = "ship_connect3" },
		{ def = "Menu_model_hangar_portal_hangar_Ship6_police", joint = "ship_connect4" },
	}
}
--
Def.AnimatedWall =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "models/objects/gameplay/animated_wall/animated_wall",
	physics			= { solid_type = solid.none, static = true },	
	
	children = 
	{
		{ def = "AnimatedWall_Box_Up", joint = "up" },
		{ def = "AnimatedWall_Box_Down", joint = "down" },
	},	
}

--
Def.AnimatedWall_Box_Up =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	model			= "models/objects/gameplay/animated_wall/wall_up", 
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
}

Def.AnimatedWall_Box_Down =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	model			= "models/objects/gameplay/animated_wall/wall_down", 
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
}

Def.Flag_Flag01 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	model			= "models/objects/gameplay/fan/flag_01",
	physics			= { solid_type = solid.none, static = true },	
	
}

Def.Flag_Flag012 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	model			= "models/objects/gameplay/fan/flag_01_2",
	physics			= { solid_type = solid.none, static = true },	
	
}

Def.Flag_Flag013 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	model			= "models/objects/gameplay/fan/flag_01_3",
	physics			= { solid_type = solid.none, static = true },	
	
}

Def.Flag_Flag02 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	model			= "models/objects/gameplay/fan/flag_02",
	physics			= { solid_type = solid.none, static = true },	
	
}

Def.Flag_Flag03 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	model			= "models/objects/gameplay/fan/flag_03",
	physics			= { solid_type = solid.none, static = true },	
	
}

Def.Flag_Cabel01 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	model			= "models/objects/gameplay/fan/cabel_01",
	physics			= { solid_type = solid.none, static = true },	
	
}

Def.Flag_Cabel02 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	model			= "models/objects/gameplay/fan/cabel_02",
	physics			= { solid_type = solid.none, static = true },	
	
}

Def.Effects_PlanetWar_RadiationSteam5 =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/radiation_steam5",
	maxViewDist = 999999,
}
Def.Effects_PlanetWar_RadiationSteam6 =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/radiation_steam6",
	maxViewDist = 999999,
}
Def.Effects_PlanetWar_RadiationSteam7 =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/radiation_steam7",
	maxViewDist = 999999,
}
Def.Effects_PlanetWar_RadiationSteam8 =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/radiation_steam8",
	maxViewDist = 999999,
}

---------------------------------------------------[ Huge Ships Effects ]------------------------------------------------------

Def.Module_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/module_wreck1",
	children = 
	{
		{ effect = "particles/explosions/huge_module", joint = "fx1" },		
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "fx1" },
		
	},	
}

Def.DeadEngineDestroyerBig =
{
	class			= "EffectEntity",
	in_editor		= false,
	effect = "particles/explosions/huge_engine_destroyed",
	effect_user1 = 0.5,
}

Def.DeadEngineDestroyerMid =
{
	class			= "EffectEntity",
	in_editor		= false,
	effect = "particles/explosions/huge_engine_destroyed",
	effect_user1 = 0.4,
}

Def.DeadEngineDestroyerSmall =
{
	class			= "EffectEntity",
	in_editor		= false,
	effect = "particles/explosions/huge_engine_destroyed",
	effect_user1 = 0.3,
}

Def.DeadEngineDestroyerTiny =
{
	class			= "EffectEntity",
	in_editor		= false,
	effect = "particles/explosions/huge_engine_destroyed",
	effect_user1 = 0.2,
}

Def.Race1_H_T1_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r1_h_t1_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl1" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx1" },		
	},	
}

Def.Race1_H_T2_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r1_h_t2_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl1" },
		{ effect = "DeadEngineDestroyerMid", joint = "fx1" },		
	},	
}

Def.Race1_H_T3_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r1_h_t3_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl2" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx1" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx2" },		
	},	
}

Def.Race1_H_T4_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r1_h_t4_wreck_eng",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl1" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx1" },	
	},	
}

Def.Race1_H_Bashe_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/ships/specialships/destroyer_serpent/destroyer_serpent_engd",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl1" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx1" },	
	},	
}

Def.Race2_H_T1_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r2_h_t1_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl2" },
		--{ effect = "DeadEngineDestroyerBig", joint = "expl3" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl4" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl5" },
		{ effect = "DeadEngineDestroyerSmall", joint = "fx2" },
		{ effect = "DeadEngineDestroyerSmall", joint = "fx3" },		
	},	
}

Def.Race2_H_T2_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r2_h_t2_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl2" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx1" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx2" },		
	},	
}

Def.Race2_H_T3_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r2_h_t3_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl2" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx1" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx2" },		
	},	
}

Def.Race2_H_T4_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r2_h_t4_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl2" },
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl3" },
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl4" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx1" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx2" },	
		{ effect = "DeadEngineDestroyerTiny", joint = "fx3" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx4" },		
	},	
}

Def.Race3_H_T1_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r3_h_t1_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl2" },	
		{ effect = "DeadEngineDestroyerMid", joint = "fx1" },
		{ effect = "DeadEngineDestroyerMid", joint = "fx2" },			
	},	
}

Def.Race3_H_T2_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r3_h_t2_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl2" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl5" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl6" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl7" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl8" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx1" },	
		{ effect = "DeadEngineDestroyerTiny", joint = "fx2" },	
	},	
}

Def.Race3_H_T3_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r3_h_t3_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl2" },
		{ effect = "DeadEngineDestroyerSmall", joint = "fx1" },	
		{ effect = "DeadEngineDestroyerSmall", joint = "fx2" },	
	},	
}

Def.Halloween_H_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/halloween_h_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "eng_expl1" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx1" },	
		{ effect = "DeadEngineDestroyerTiny", joint = "fx2" },
	},	
}

Def.Race3_H_T5_Uniq_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r3_h_t4_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl2" },
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl3" },
		{ effect = "particles/explosions/huge_engine_expl_big", joint = "expl4" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx1" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx2" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx3" },
		{ effect = "DeadEngineDestroyerBig", joint = "fx4" },	
	},	
}

Def.Race1_H_T1_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r1_h_t1_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },		
	},	
}

Def.Race1_H_T3_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r1_h_t3_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },		
	},	
}

Def.Race1_H_T4_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r1_h_t4_wreck_cap",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl2" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },		
	},	
}

Def.Race1_H_Bashe_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/ships/specialships/destroyer_serpent/destroyer_serpent_capd",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl2" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },		
	},	
}

Def.Race2_H_T1_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r2_h_t1_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl2" },		
	},	
}

Def.Race2_H_T3_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r2_h_t3_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl2" },	
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },			
	},	
}

Def.Race2_H_T4_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r2_h_t4_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl2" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl3" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },
		{ effect = "particles/explosions/huge_module", joint = "fx3" },
		{ effect = "particles/explosions/huge_module", joint = "fx4" },
		{ effect = "particles/explosions/huge_module", joint = "fx5" },		
	},	
}

Def.Race3_H_T1_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r3_h_t1_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere_small", joint = "expl1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere_small", joint = "expl2" },	
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere_small", joint = "expl3" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere_small", joint = "expl4" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },	
		{ effect = "particles/explosions/huge_module", joint = "fx3" },
		{ effect = "particles/explosions/huge_module", joint = "fx4" },		
	},	
}

Def.Race3_H_T2_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r3_h_t2_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere_small", joint = "expl2" },	
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere_small", joint = "expl3" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl4" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },	
		{ effect = "particles/explosions/huge_module", joint = "fx3" },
		{ effect = "particles/explosions/huge_module", joint = "fx4" },	
		{ effect = "particles/explosions/huge_module", joint = "fx5" },
	},	
}

Def.Race3_H_T3_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r3_h_t3_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl4" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },	
		{ effect = "particles/explosions/huge_module", joint = "fx3" },
		{ effect = "particles/explosions/huge_module", joint = "fx4" },	
		{ effect = "particles/explosions/huge_module", joint = "fx5" },
	},	
}

Def.Halloween_H_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/halloween_h_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "cap_expl1" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
	},	
}

Def.Race3_H_T5_Uniq_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/r3_h_t4_cap_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl2" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl3" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },
		{ effect = "particles/explosions/huge_module", joint = "fx3" },
	},	
}

Def.Saturn_H_Capacitor_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/ships/specialships/destroyer_ring/destroyer_ring_damage_cap",
	children = 
	{
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl2" },
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_module", joint = "fx2" },
	},	
}

Def.Saturn_H_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/ships/specialships/destroyer_ring/destroyer_ring_damage_eng",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl1" },
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl2" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx1" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx2" },		
	},	
}
----------------------------------------------------------------------------------------------------------------------------

Def.gameplay_fan04 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "models/objects/gameplay/fan/fan_04",
	physics			= { solid_type = solid.none, static = true },	
	
	children = 
	{
		{ def = "gameplay_fan04fiz", joint = "rotate" },		
	},	
}

Def.gameplay_fan04fiz =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	model			= "models/objects/gameplay/fan/fan_04_fiz", 
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
}

Def.LinkShieldModel =
{
	class			= "AnimatedEntity",
	in_editor		= false,
	model 			= "models/shields/linkshield",
}

Def.Engine_empire_l = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b1",
	effect_user1 = 0.45,
	effect_user2 = 0.45,
}

Def.Engine_empire_xl = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b1",
	effect_user1 = 0.7,
	effect_user2 = 0.7,
}

Def.Engine_empire_xxl = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_b1",
	effect_user1 = 1.0,
	effect_user2 = 1.0,
}

Def.Engine_pirate_l = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_p4",
	effect_user1 = 0.45,
	effect_user2 = 0.45,
}

Def.Engine_pirate_xl = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_p4",
	effect_user1 = 0.7,
	effect_user2 = 0.7,
}

Def.Engine_pirate_xxl = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_p4",
	effect_user1 = 1.0,
	effect_user2 = 1.0,
}

--Эффекты с радиусом видимости и другое
Def.StealthEffect =
{
	class 				= "EffectEntity",
	maxViewDist			= 150, -- 10 meters = 1 unit
	effect = "particles/gadget/stealth_field",
}

--Эффекты с радиусом видимости и другое
Def.StealthEffectPersei =
{
	class 				= "EffectEntity",
	maxViewDist			= 150, -- 10 meters = 1 unit
	effect = "particles/gadget/persei_stealth_field",
}

--Эффекты с радиусом видимости и другое
Def.StealthEffectAlien =
{
	class 				= "EffectEntity",
	maxViewDist			= 150, -- 10 meters = 1 unit
	effect = "particles/gadget/stealth_field_alien",
}

Def.FrontShieldEffect =
{
	class 				= "EffectEntity",
	effect = "particles/gadget/frontshield",
	stop_on_remove = false,
}

Def.StealthWarpEffect =
{
	class 				= "EffectEntity",
	maxViewDist			= 10, -- 10 meters = 1 unit
	effect = "particles/gadget/shift_warp_ship",
}
--------------------------------------------------------------------
--Da_Deathstar assets start
--------------------------------------------------------------------
Def.Deathstar_Decor1 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/decor1",
}

Def.Deathstar_Decor1AltColor = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/decor1_altcolor",
}

Def.Deathstar_Column = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/column",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_ColumnAltColor = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/column_altcolor",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_MiniEye = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mini_eye",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_MiniEyeAltColor = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mini_eye_altcolor",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Light = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/light",
}

Def.Deathstar_LightAltColor = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/light_altcolor",
}


Def.Deathstar_DownWallsLeft2 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/downwalls_left_2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_DownWallsLeft1 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/downwalls_left_1",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_DownWallsRight2 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/downwalls_right_2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_DownWallsRight1 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/downwalls_right_1",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_PlatformUpDownLong = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/platform_updown_long",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_PlatformUp = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/platform_up",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_PlatformDown = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/platform_down",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_WallClaw = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/wallclaw",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_Spike11 = 
{
	class			= "ScBaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/spike1_1",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_Spike12 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/spike1_2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_Spike13 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/spike1_3",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_TopEye = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/topeye",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_TopEye2 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/topeye2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye1Claw = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye1_claw",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye1AltColorClaw = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye1_altcolor_claw",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye1UpDownClawbase = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye1_updown_clawbase",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye1AltColorUpDownClawbase = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye1_altcolor_updown_clawbase",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye1UpDownBase = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye1_updown_base",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye2Claw = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye2_claw",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye2AltColorClaw = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye2_altcolor_claw",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye2Clawbase = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye2_clawbase",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye3Claw = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye3_claw",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye3AltColorClaw = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye3_altcolor_claw",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye3Decor = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye3_decor",
}

Def.Deathstar_MediumEye3 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye3",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_MediumEye3AltColor = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/mediumeye3_altcolor",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Rock11 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/rock1_1",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Rock12 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/rock1_2",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Rock13 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/rock1_3",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Rock14 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/rock1_4",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Rock15 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/rock1_5",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Decor2 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/decor2",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Decor2AltColor = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/decor2_altcolor",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Decor2WithTubes = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/decor2_withtubes",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_Decor2AltColorWithTubes = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/decor2_altcolor_withtubes",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_Stone11 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/stone1_1",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Stone12 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/stone1_2",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Stone13 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/stone1_3",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Stone21 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/stone2_1",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Stone22 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/stone2_2",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_Stone23 = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/stone2_3",
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.Deathstar_TripleEye = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/tripleeye",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_TripleEyeAltColor = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/tripleeye_altcolor",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Deathstar_CenterEyeBasepart = 
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area2/da_deathstar/centereye_basepart",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
}

Def.Poezd_poezd = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	maxViewDist 	= 999999,
	model		=	"mapskit/mainmenu/models/alidium/poezd/poezd_chain",
    children    = {{ effect = "particles/other/train_projector", joint = "light_forward"},
                   { effect = "particles/other/train_projector", joint = "light_forward2"},
                   { effect = "particles/other/train_projector", joint = "light_backward"},
                   { effect = "particles/other/train_projector", joint = "light_backward2"},
				   { def = "Poezd_poezdfiz", joint = "translate" },    
    },
}

Def.Poezd_poezd22 = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	maxViewDist 	= 999999,
	model		=	"mapskit/mainmenu/models/alidium/poezd/poezd_chain22",
    children    = {{ effect = "particles/other/train_projector", joint = "light_forward"},
                   { effect = "particles/other/train_projector", joint = "light_forward2"},
                   { effect = "particles/other/train_projector", joint = "light_backward"},
                   { effect = "particles/other/train_projector", joint = "light_backward2"},
				   { def = "Poezd_poezdfiz", joint = "translate" },    
    },
}

Def.Poezd_poezdfiz = 
{
	class = "AnimatedEntity",
	in_editor	=	false,
	maxViewDist 	= 999999,
	model		=	"mapskit/mainmenu/models/alidium/poezd/poezd_fiz", 
	physics		= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },
}

Def.Elevator_Elevator = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/alidium/elevator/elevators",
}

Def.Cars_Cars1 = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/alidium/car/cars1",  
}

Def.Cars_Cars2 = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/alidium/car/cars2",  
}

Def.Cars_Cars3 = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/alidium/car/cars3",  
}

Def.Cars_Cars4 = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/alidium/car/cars4",   
}

Def.Crane_CraneAnimated = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/alidium/crane/crane_01/crane_animated",    
    
}

Def.Crane_CraneAnimatedSide = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/alidium/crane/crane_01/crane_animated_side",    
    
}

Def.Crane_CranePlatform = 
{
	class = "AnimatedEntity",
	in_editor	=	true,
	model		=	"mapskit/mainmenu/models/alidium/crane/crane_01/crane_platform",
    children = 
        {            
            { effect = "PlatformEngineBig", joint = "engine1" }, 
            { effect = "PlatformEngineBig", joint = "engine2" }, 
            { effect = "PlatformEngineBig", joint = "engine3" },
            { effect = "PlatformEngineBig", joint = "engine4" },
            { effect = "PlatformEngineBig", joint = "engine5" }, 
            { effect = "PlatformEngineBig", joint = "engine6" }, 
            { effect = "PlatformEngineBig", joint = "engine7" },
            { effect = "PlatformEngineBig", joint = "engine8" },            
            { effect = "PlatformEngineSmall", joint = "engine1_small" },
            { effect = "PlatformEngineSmall", joint = "engine2_small" },
            { effect = "PlatformEngineSmall", joint = "engine3_small" },
            { effect = "PlatformEngineSmall", joint = "engine4_small" },
            { effect = "PlatformEngineSmall", joint = "engine5_small" },
            { effect = "PlatformEngineSmall", joint = "engine6_small" },
            { effect = "PlatformEngineSmall", joint = "engine7_small" },
            { effect = "PlatformEngineSmall", joint = "engine8_small" },
        }    
    
}

Def.PlatformEngineSmall = 
{
	class = "EffectEntity",
	effect = "particles/other/platform_engine",
	effect_user1 = 0.08,
	effect_user2 = 0.08,
}

Def.PlatformEngineBig = 
{
	class = "EffectEntity",
	effect = "particles/other/platform_engine",
	effect_user1 = 0.12,
	effect_user2 = 0.12,
}

--------------------------------------------------------------------
--Da_Deathstar assets end
--------------------------------------------------------------------

Def.alidium_rock01 = 
{
	class			= "BaseEntity",
	model			= "mapskit/mainmenu/models/alidium/rocks/alidium_rock_01",
}

Def.alidium_rock02 = 
{
	class			= "BaseEntity",
	model			= "mapskit/mainmenu/models/alidium/rocks/alidium_rock_02",
}

Def.alidium_rock03 = 
{
	class			= "BaseEntity",
	model			= "mapskit/mainmenu/models/alidium/rocks/alidium_rock_03",
}

Def.alidium_rock04 = 
{
	class			= "BaseEntity",
	model			= "mapskit/mainmenu/models/alidium/rocks/alidium_rock_04",
}

Def.alidium_rock05 = 
{
	class			= "BaseEntity",
	model			= "mapskit/mainmenu/models/alidium/rocks/alidium_rock_05",
}

Def.alidium_rock06 = 
{
	class			= "BaseEntity",
	model			= "mapskit/mainmenu/models/alidium/rocks/alidium_rock_06",
}

Def.alidium_rock07 = 
{
	class			= "BaseEntity",
	model			= "mapskit/mainmenu/models/alidium/rocks/alidium_rock_07",
}

-------- test def
Def.RefillStation_Test =
{
	class 			= "ScBaseEntity",
	damageable		= true,
	health 			= 10000,
	
	uiName			= "RefillStation_Test_name",
	hudType			= "default",
	hud_visibility_type = "major",
	
	physics			= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 1000, },
	model			= "models/objects/gameplay/loot_prec/loot_prec", 
	death_effect	= "particles/explosions/objects/alien_explosion",
	
	children = {{def = "PrecCruiserGun",	joint = "root"},},
}

Def.Engine_Test =
{
	class 			= "ScBaseEntity",
	damageable		= true,
	health 			= 6000,
	
	uiName			= "Engine_Test_name",
	hudType			= "default",
	hud_visibility_type = "minor",
	
	physics			= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 1000, },
	model			= "models/objects/gameplay/loot_prec/loot_prec", 
	death_effect	= "particles/explosions/objects/alien_explosion",
	
	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
}

Def.Generator_Test =
{
	class 			= "ScBaseEntity",
	damageable		= true,
	health 			= 4000,
	
	uiName			= "Generator_Test_name",
	hudType			= "default",
	hud_visibility_type = "minor",
	
	physics			= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 1000, },
	model			= "models/objects/gameplay/loot_prec/loot_prec", 
	death_effect	= "particles/explosions/objects/alien_explosion",
	
	children = {{def = "PrecCruiserGun",	joint = "root"},},
}

Def.Shield_Test =
{
	class			= "ScBaseEntity",
	damageable		= true,
	health 			= 25000,

	uiName			= "Shield_Test_name",
	hudType			= "default",
	hud_visibility_type	= "minor", 

	physics			= { solid_type = solid.sphere, kinematic = true, material = "EnergyShield", },
	model			= "models/objects/ships_huge/prec_cruiser/prec_cruiser_shield", 
}

Def.CargoShip_Test =
{
	inherit			= "OpenWorld_CargoshipBase",

	health			= 20000,
	max_lin_speed	= 10,

	shield_def		= "Shield_Test",

	damageable_groups =
	{
		[ ai.DamageableGroup.GENERATOR ] =
		{
			{ def = "Generator_Test", joint = "gun_3" },
			{ def = "Generator_Test", joint = "gun_4" },
		},
		
		[ ai.DamageableGroup.ENGINE1 ] =
		{
			{ def = "Engine_Test", joint = "gun_1" },
			{ def = "Engine_Test", joint = "gun_2" },
		},
	},
}

Def.AllidiumJumpgateFx =
{
	class			= "BaseEntity",
	model			= "models/objects/jump_gates/alidium_jumpgate/allidium_gate",
}

Def.Alidium_AlidiumJumpgate = 
{
	class			= "ScBaseEntity",
	maxViewDist 	= 999999,
	model			= "models/objects/jump_gates/alidium_jumpgate/alidium_jumpgate",
	--children   	= {{ model = "models/objects/jump_gates/alidium_jumpgate/alidium_jumpgate2", joint = "monitor_01"},}, 
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	uiName			= Alidium_AlidiumJumpgate,
    
	work_sound 		= "sound/ambient/jumpgate_loop",
	
    children = 
	{
        { model = "models/objects/jump_gates/alidium_jumpgate/alidium_jumpgate2", joint = "monitor_01"},
		{ def = "AllidiumJumpgateFx", joint = "tunell_fx" },
		{ def = "PrecProjectorBig", joint = "light_big_01" },
        { def = "PrecProjectorBig", joint = "light_big_02" },
        { def = "PrecProjectorBig", joint = "light_big_03" },
        { def = "PrecProjectorBig", joint = "light_big_04" },
        { def = "PrecProjectorMid", joint = "light_middle_01" },
        { def = "PrecProjectorMid", joint = "light_middle_02" },
        { def = "PrecProjectorSmall", joint = "light_small_01" },
        { def = "PrecProjectorSmall", joint = "light_small_02" },
        { def = "PrecProjectorSmall", joint = "light_small_03" },
        { def = "PrecProjectorSmall", joint = "light_small_04" },
        { def = "PrecProjectorSmall", joint = "light_small_05" },
        { def = "PrecProjectorSmall", joint = "light_small_06" },
        { def = "PrecProjectorSmall", joint = "light_small_07" },
        { def = "PrecProjectorSmall", joint = "light_small_08" },
        { def = "PrecProjectorSmall", joint = "light_small_09" },
        { def = "PrecProjectorSmall", joint = "light_small_10" },
        { def = "PrecProjectorBig", joint = "projector_01" },
        { def = "PrecProjectorBig", joint = "projector_02" },
        { effect = "particles/jumpgates/jumpgate_alidium_strokes", joint = "tunell_fx" },
		{ effect = "particles/jumpgates/allidium_energy_sphere", joint = "sphere_fx" },
        { effect = "particles/jumpgates/allidium_energy_tube", joint = "tube_fx" },
        
		
	}
}

Def.MicroShips_MiningsiteStationShips = 
{
	class			= "AnimatedEntity",
	model			= "models/objects/global_world/empire_object/empire_miningsite_station_01",
    in_editor	=	true,
    
    children = 
	{        
		{ effect = "particles/other/microship_engine", joint = "ship01" },
        { effect = "particles/other/microship_engine", joint = "ship02" },
        { effect = "particles/other/microship_engine", joint = "ship03" },
        { effect = "particles/other/microship_engine", joint = "ship04" },
        { effect = "particles/other/microship_engine", joint = "ship05" },
        { effect = "particles/other/microship_engine", joint = "ship06" },
        { effect = "particles/other/microship_engine", joint = "ship07" },
        { effect = "particles/other/microship_engine", joint = "ship08" },
        { effect = "particles/other/microship_engine", joint = "ship09" },
        { effect = "particles/other/microship_engine", joint = "ship010" },
        { effect = "particles/other/microship_engine", joint = "ship011" },
        { effect = "particles/other/microship_engine", joint = "ship012" },
        { effect = "particles/other/microship_engine", joint = "ship013" },
        { effect = "particles/other/microship_engine", joint = "ship014" },
        { effect = "particles/other/microship_engine", joint = "ship015" } 
	}
}

Def.MicroShips_EmpireStationShips = 
{
	class			= "AnimatedEntity",
	model			= "models/objects/global_world/empire_station/empire_station",
    in_editor	=	true,
    
    children = 
	{        
		{ effect = "particles/other/microship_engine", joint = "ship01" },
        { effect = "particles/other/microship_engine", joint = "ship02" },
        { effect = "particles/other/microship_engine", joint = "ship03" },
        { effect = "particles/other/microship_engine", joint = "ship04" },
        { effect = "particles/other/microship_engine", joint = "ship05" },
        { effect = "particles/other/microship_engine", joint = "ship06" },
        { effect = "particles/other/microship_engine", joint = "ship07" },
        { effect = "particles/other/microship_engine", joint = "ship08" },
        { effect = "particles/other/microship_engine", joint = "ship09" },
        { effect = "particles/other/microship_engine", joint = "ship010" },
        { effect = "particles/other/microship_engine", joint = "ship011" },
        { effect = "particles/other/microship_engine", joint = "ship012" },
        { effect = "particles/other/microship_engine", joint = "ship013" },
        { effect = "particles/other/microship_engine", joint = "ship014" },
        { effect = "particles/other/microship_engine", joint = "ship015" } 
	}

}

Def.DestBeamDroneEngine =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_r4",
	effect_user1 = 0.2,
	effect_user2 = 0.1,
}

Def.DestBeamDroneTail =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_trail",
	effect_user2 = 0.2,
	effect_color = "255 25 0 100",
}

--------------------------------------------------------------------
--pve_wave_planet_war assets start
--------------------------------------------------------------------
Def.PlanetWar_Building1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building1",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building3",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building4 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building4",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building5",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building6 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building6",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building7 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building7",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building8 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building8",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building9 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building9",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building10 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building10",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building11 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building11",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building12 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building12",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building13 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building13",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building14 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building14",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Building15 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/building15",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_HugeBuilding1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/hugebuilding1",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_HugeBuilding2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/hugebuilding2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Corridor1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/corridor1",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Junk1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/junk1",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Junk2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/junk2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Junk3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/junk3",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Junk4 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/junk4",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Junk5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/junk5",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Junk6 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/junk6",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Junk7 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/junk7",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Junk8 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/junk8",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Junk9 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/junk9",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.PlanetWar_Lamp1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area3/planet_war/lamp1",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
}
--------------------------------------------------------------------
--pve_wave_planet_war assets end
--------------------------------------------------------------------

Def.TestModel =
{
	health 			= 3000,
	class 			= "CargoShip",
	in_editor		= true,
	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_02", 
	physics			= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 2000000, },
	maxViewDist		= 3000,
	damageable			= true,
	death_effect	= "",
	broken_parts = 
	{
		{ def = "Destroyer_Life_Small_Wreck01",	debris = false, pos = Vec3( 0.6, 1.5, -5.3 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck02",	debris = false, pos = Vec3( 2.5, 0.7, -4.0 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck03",	debris = false, pos = Vec3( -3.3, 1.2, 0 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck04",	debris = false, pos = Vec3( -2.7, 1.0, 3.1 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck05",	debris = false, pos = Vec3( -1.6, 0.4, 5.4 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck06",	debris = false, pos = Vec3( 1.1, 0.6, 5.4 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck07",	debris = false, pos = Vec3( 3.3, 0.4, 1.8 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck08",	debris = false, pos = Vec3( 3.3, 0.9, -1.2 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck09",	debris = false, pos = Vec3( -1.3, 3.4, 1.4 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck10",	debris = false, pos = Vec3( -1.3, 2.9, 0 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck11",	debris = false, pos = Vec3( -0.6, 3.4, 0 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck12",	debris = false, pos = Vec3( 1.4, 2.9, -2.8 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck13",	debris = false, pos = Vec3( 1.9, 2.9, -1.8 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck14",	debris = false, pos = Vec3( 0.6, 3.8, 0.1 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck15",	debris = false, pos = Vec3( -0.2, 2.6, 4.0 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck16",	debris = false, pos = Vec3( 1.9, 2.7, 2.7 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Small_Wreck17",	debris = false, pos = Vec3( -2.5, 0.7, -3.8 ), ang_speed_deviation = 0,dumping = 0, speed = 0, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
	},
}

--------------------------------------------------------------------
--pvp_jungle assets start
--------------------------------------------------------------------
Def.charcter_reptile =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	maxViewDist 	= 999999,
	model		=	"models/characters/reptile/reptile_01",
		
}

Def.charcter_akula01 =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	maxViewDist 	= 999999,
	model		=	"mapskit_sample/maps/devils_rock/models/fish/akula_001",
		
}

Def.charcter_akula02 =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	maxViewDist 	= 999999,
	model		=	"mapskit_sample/maps/devils_rock/models/fish/akula_002",
		
}

Def.charcter_submarine =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	maxViewDist 	= 999999,
	model		=	"mapskit_sample/maps/devils_rock/models/fish/submarine",			
}

Def.charcter_fish01 =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	maxViewDist 	= 999999,
	model		=	"mapskit_sample/maps/devils_rock/models/fish/fish_001",
		
}

Def.charcter_kit =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	maxViewDist 	= 999999,
	model		=	"mapskit_sample/maps/devils_rock/models/fish/kit",
		
}

Def.Jungle_JRock1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_1",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_3",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock4 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_4",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_5",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock6 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_6",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock7 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_7",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock8 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_8",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock9 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_9",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock10 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_10",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock11 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_11",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock12 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_12",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock13 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_13",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock14 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_14",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock15 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_15",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock16 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_16",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock17 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_17",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock18 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_18",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock19 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_19",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock20 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_20",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock21 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_21",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock22 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_22",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock23 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_23",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock24 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_24",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock25 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_25",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock26 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_26",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock27 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_27",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock28 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_28",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock29 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_29",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock30 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_30",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock31 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_31",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JRock32 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/rock_chast_32",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_02",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_03",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation4 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_04",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_05",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation6 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_06",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation7 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_07",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation9 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_9",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation10 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_10",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation11 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_11",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation12 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_12",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStation13 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/station_13",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JStella =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/stella",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Jungle_JMonitor1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/monitor_01",
	physics			= { solid_type = solid.model, static = true, },
	in_editor	=	true,
}

Def.Jungle_JMonitor2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/monitor_02",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	in_editor	=	true,
}

Def.Jungle_JMonitor3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/monitor_03",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	in_editor	=	true,
}

Def.Jungle_JMonitor4 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/monitor_04",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	in_editor	=	true,
}

Def.Jungle_JMonitor5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/monitor_05",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	in_editor	=	true,
}

Def.Jungle_JMonitor6 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/monitor_06",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	in_editor	=	true,
}

Def.Jungle_JMonitor7 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/monitor_07",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	in_editor	=	true,
}

Def.Jungle_JEnergy =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/mars_atacks/model/jenergy",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}



Def.robots_Jtractor1 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "models/objects/robots/tractor/tractor_01",
	physics			= { solid_type = solid.none, static = true },	
	
	children = 
	{
		{ def = "robots_Jtractor11", joint = "main" },
		{ def = "robots_Jtractor12", joint = "arrow_rotate" },
		{ def = "robots_Jtractor13", joint = "arrow_elbow" },
		{ def = "robots_Jtractor14", joint = "arrow_hand_pistol" },
		{ def = "robots_Jtractor15", joint = "head_rotate" },		
	},	
}

Def.robots_Jtractor11 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/objects/robots/tractor/tractor_01_chast1",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.robots_Jtractor12 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/objects/robots/tractor/tractor_01_chast2",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.robots_Jtractor13 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/objects/robots/tractor/tractor_01_chast3",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.robots_Jtractor14 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/objects/robots/tractor/tractor_01_chast4",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.robots_Jtractor15 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/objects/robots/tractor/tractor_01_chast5",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.robots_Jtractor2 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "models/objects/robots/tractor/tractor_02",
	physics			= { solid_type = solid.none, static = true },	
	
	children = 
	{
		{ def = "robots_Jtractor21", joint = "base" },
		{ def = "robots_Jtractor22", joint = "covsh05" },
		{ def = "robots_Jtractor23", joint = "covsh06" },		
	},	
}

Def.robots_Jtractor21 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/objects/robots/tractor/tractor_02_chast1",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.robots_Jtractor22 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/objects/robots/tractor/tractor_02_chast2",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.robots_Jtractor23 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"models/objects/robots/tractor/tractor_02_chast3",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.Jungle_JMeduza11 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"mapskit/maps/area1/mars_atacks/model/meduza_01_chast1",
	physics		= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.Jungle_JMeduza1 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "mapskit/maps/area1/mars_atacks/model/meduza_01",
	physics			= { solid_type = solid.none, static = true },	
	
	children = 
	{
		{ def = "Jungle_JMeduza11", joint = "head" },		
	},	
}

Def.Jungle_JMeduza12 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"mapskit/maps/area1/mars_atacks/model/meduza_01_chast2",
	physics		= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.Jungle_JMeduza2 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "mapskit/maps/area1/mars_atacks/model/meduza_02",
	physics			= { solid_type = solid.none, static = true },	
	
	children = 
	{
		{ def = "Jungle_JMeduza12", joint = "head" },		
	},	
}

Def.Jungle_JMeduza13 =
{
	class = "ScBaseEntity",
	in_editor	=	false,
	model		=	"mapskit/maps/area1/mars_atacks/model/meduza_01_chast3",
	physics		= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
}

Def.Jungle_JMeduza3 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "mapskit/maps/area1/mars_atacks/model/meduza_03",
	physics			= { solid_type = solid.none, static = true },	
	
	children = 
	{
		{ def = "Jungle_JMeduza13", joint = "head" },		
	},	
}

Def.AllidumMap_AStation1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_02",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_03",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation302 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_03_2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation4 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_04",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation402 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_04_2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_05",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation6 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_06",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation7 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_07",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation702 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_07_2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation8 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_08",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation9 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_09",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation10 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_10",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation10z =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_10_zerkalo",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation11 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_11",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation12 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_12",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation13 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_13",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation13z =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_13_zerkalo",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation14 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_14",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation15 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_15",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation16 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_16",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation17 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_17",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation18 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_18",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation19 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_19",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation20 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_20",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation21 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_21",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation22 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_22",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation23 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_23",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AStation24 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/station_24",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_01",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_02",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_03",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka4 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_04",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_05",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka7 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_07",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka8 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_08",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka802 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_08_2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}


Def.AllidumMap_ABalka9 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_09",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka10 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_10",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka11 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_11",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka11z =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_11_zerkalo",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka12 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_12",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka13 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_13",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka14 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_14",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka15 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_15",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka16 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_16",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka17 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_17",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka18 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_18",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka19 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_19",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka20 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_20",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka21 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_21",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka22 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_22",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka23 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_23",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka24 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_24",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka25 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_25",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka26 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_26",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka27 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_27",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka28 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_28",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka29 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_29",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka30 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_30",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka31 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_31",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka32 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_32",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka33 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_33",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka34 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_34",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka35 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_35",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka353 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_35_3",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka36 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_36",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka362 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_36_2",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka37 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_37",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka38 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_38",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka39 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_39",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka40 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_40",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka41 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_41",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka42 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_42",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ABalka44 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/balka_44",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ADetail1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/detail_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ADetail2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/detail_02",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ADetail3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/detail_03",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_ADetail5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/detail_05",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AShip1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/ship_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_01",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_02",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_03",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor4 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_04",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_05",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor6 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_06",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor7 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_07",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor8 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_08",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor9 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_09",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor10 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_10",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor11 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_11",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor12 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_12",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor13 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_13",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor14 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_14",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor15 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_15",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor16 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_16",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor17 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_17",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor18 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_18",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor19 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_19",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor20 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_20",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor21 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_21",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor22 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_22",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor23 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_23",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor24 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_24",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor25 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_25",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor26 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_26",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor27 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_27",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor28 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_28",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor29 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_29",
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_AMonitor30 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/allidium_in_danger/models/monitor_30",
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world = true,
}

Def.AllidumMap_APlatforma1 =
{
	class			= "BaseEntity",
	model			= "mapskit/mainmenu/models/alidium/platform/platform_08/platform_08",
	maxViewDist 	= 999999,
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	in_editor	=	true,
	as_world = true,
}


---------------- PVEWRECKS ----------------

--Мелкая часть обшивки
Def.SmallWreckDebris1 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/cargoship_debris_1_small",
}

--Обломок с конструкциями
Def.SmallWreckDebris2 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/cargoship_debris_2_small",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "root" },
	}
}


--Вертикальная палка
Def.SmallWreckDebris3 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/cargoship_debris_3_small",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "fx1" },
	}
}

--Часть обшивки
Def.Pirate_Barge_WreckDebris1 =
{
	inherit		= "Pirate_Barge_Wreck1",
	model		= "models/objects/wrecks/cargoship_debris_1",
}

--Палка
Def.Pirate_Barge_WreckDebris2 =
{
	inherit		= "Pirate_Barge_Wreck1",
	model		= "models/objects/wrecks/cargoship_debris_2",
}

Def.AlienDestroyerExpl =
{
	class 		= "ScBaseEntity",
	in_editor			= false,
	model		= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck_expl",
	maxViewDist			= 99999,
	children = 
	{
		{ effect = "AlienDestroyerExpl1", joint = "expl1" },
		{ effect = "AlienDestroyerExpl2", joint = "expl2" },
		{ effect = "AlienDestroyerExpl2", joint = "expl4" },
		{ effect = "AlienDestroyerExpl2", joint = "expl6" },
		{ effect = "AlienDestroyerExpl2", joint = "expl8" },
		{ effect = "AlienDestroyerExpl3", joint = "expl3" },
		{ effect = "AlienDestroyerExpl3", joint = "expl5" },
		{ effect = "AlienDestroyerExpl3", joint = "expl7" },
		{ effect = "AlienDestroyerExpl3", joint = "expl9" },
		{ effect = "particles/explosions/objects/alien_destroyer_explosion_big", joint = "expl10" },
	}
}

Def.AlienDestroyerExpl1 = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_destroyer_explosion",
	effect_user1 = 0.41,
	effect_user2 = 0.10,
	effect_user3 = 0.40,
	maxViewDist	= 99999,
}

Def.AlienDestroyerExpl2 = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_destroyer_explosion",
	effect_user1 = 0.255,
	effect_user2 = 0.728,
	effect_user3 = 0.078,
	maxViewDist	= 99999,
}

Def.AlienDestroyerExpl3 = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_destroyer_explosion",
	effect_user1 = 0.118,
	effect_user2 = 0.727,
	effect_user3 = 0.087,
	maxViewDist	= 99999,
}

Def.AlienCruiserExpl =
{
	class 		= "ScBaseEntity",
	in_editor			= false,
	model		= "models/objects/ships_huge/prec_cruiser/prec_cruiser_wreck_expl",
	maxViewDist			= 99999,
	children = 
	{
		{ effect = "AlienCruiserExpl1", joint = "expl1" },
		{ effect = "AlienCruiserExpl2", joint = "expl2" },
		{ effect = "AlienCruiserExpl3", joint = "expl3" },
		{ effect = "particles/explosions/objects/alien_destroyer_explosion_big", joint = "root" },
	}
}

Def.AlienCruiserExpl1 = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_cruiser_explosion",
	effect_user1 = 0.24,
	effect_user2 = 0.69,
	effect_user3 = 0.36,
	maxViewDist	= 99999,
}

Def.AlienCruiserExpl2 = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_cruiser_explosion",
	effect_user1 = 0.13,
	effect_user2 = 0.69,
	effect_user3 = 0.26,
	maxViewDist	= 99999,
}

Def.AlienCruiserExpl3 = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_cruiser_explosion",
	effect_user1 = 0.13,
	effect_user2 = 0.61,
	effect_user3 = 0.27,
	maxViewDist	= 99999,
}
-------------------------------------------

Def.Megabomb_RW_test = 
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	health 				= 3000,
	
	maxViewDist		= 5000,
	model			= "mapskit/maps/models/precursors/pc_animated_core_small",
	
	children 	= 	{{ effect ="particles/objects/alien_invertor_core", joint = "root" },},
	physics		= { solid_type = solid.model, static = true, material = "Rock" },
	
	death_effect	= "particles/explosions/objects/alien_invertor_explosion",
	death_sound		= "sound/explosion/alien_bomb_expl",
	work_sound		= "sound/raid/megabomb_raid_idle",
	
	vision_always = true,
} 

Def.Logic_Fog = 
{
	class				= "Fog",
	in_editor			= true,
	damageable			= false,
	effect				= "particles/areal/fog20",
	maxViewDist			= 5000,
	vision_always 		= true,
	radius				= 20,
}

Def.Logic_InvisibleFog_rad10 = 
{
	class				= "Fog",
	in_editor			= true,
	damageable			= false,
	radius				= 10,
}

Def.Logic_InvisibleFog_rad30 = 
{
	class				= "Fog",
	in_editor			= true,
	damageable			= false,
	radius				= 30,
}

Def.Logic_InvisibleFog_rad40 = 
{
	class				= "Fog",
	in_editor			= true,
	damageable			= false,
	radius				= 30,
}

Def.AllidumMap_ShipGass1 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/dreadnoughtbattle/allidium/allidium_yard/models/balka_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.AllidumMap_ShipGass2 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/dreadnoughtbattle/allidium/allidium_yard/models/barrel_01",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.AllidumMap_ShipGass3 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/dreadnoughtbattle/allidium/allidium_yard/models/barrel_02",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.AllidumMap_ShipGass4 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/dreadnoughtbattle/allidium/allidium_yard/models/barrel_04",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.AllidumMap_ShipGass5 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/dreadnoughtbattle/allidium/allidium_yard/models/station_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.AllidumMap_ShipGass6 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/dreadnoughtbattle/allidium/allidium_yard/models/balka_02",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.CargoShipShield =
{
	class			= "ScBaseEntity",
	remove_on_death = false,
	--full_activate_revive = true,
	model			= "models/shields/shield_cover",
	physics			= { solid_type = solid.model, kinematic = true, material = "EnergyShield", mass = 1000000, },
	--as_static		= true,
	in_editor		= false,

	hudType					= "default",
	hud_visibility_type 	= "minor", 

	relationship_group = ai.RelationshipGroups.Pirate,
	--network_sync	= false,
	--shield_activate_sound = "sound/raid/boss_shield_on",
	--shield_deactivate_sound = "sound/raid/boss_shield_off",

	health 			= 100000,
	damageable		= true,
	uiName 			= "Destroyer_Shield_name",
	
	death_effect	= "particles/ships/destroyer_shield_end",
	activate_after 	= 0.5,
	-- children = 
	-- {
		-- { effect		= "particles/ships/destroyer_shield_start" },
	-- },
	uiName 			= "Cruiser_Shield",
	
	hack_immune		= true,
}

Def.Character_Monster = 
{
	class = "Monster01",
	in_editor	=	true,
	model		=	"models/characters/monster/monster_01",
	maxViewDist 	= 999999,
	network_sync	= true,	
	relationship_group = ai.RelationshipGroups.Alien,
	health			= 6,
	uiName				= "Character_Monster",
}

Def.Character_Monster2 = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/monster_02",
	maxViewDist 	= 999999,
	network_sync	= true,
}

Def.Character_Monster3 = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/monster_03",
	maxViewDist 	= 999999,
	network_sync	= true,
}

Def.Character_Monster4 = 
{
	class = "Monster04",
	in_editor	=	true,
	model		=	"models/characters/monster/monster_04",
	maxViewDist 	= 999999,
	network_sync	= true,
	relationship_group = ai.RelationshipGroups.Alien,
	rot_speed 		= 4,
	children = 
	{
		{	def = "CucumberAura", joint = "spine09",	},
		{	def = "MonsterHurt1", joint = "spine08",	},
		{	def = "MonsterHurt2", joint = "spine08",	},
		{	def = "MonsterHurt3", joint = "trighurt",	},
		{	def = "MonsterHurt4", joint = "trighurt",	},
		{	def = "Character_monster4fiz", joint = "spine09",	},
	},
}

Def.Character_MonsterShield01 = 
{
	class = "BaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/shield_001",
	physics			= { solid_type = solid.compound_model, static = false, kinematic = true, material = "Rock", mass = 100000 },
	maxViewDist 	= 999999,
	network_sync	= true,
}

Def.Character_MonsterSphere = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/sphere_001",
	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "EnergyShield", mass = 100000 },
	maxViewDist 	= 999999,
	health 			= 200000,
	damageable		= true,
	network_sync	= true,
	relationship_group = ai.RelationshipGroups.Alien,
	hudType				= "default",
	hud_visibility_type = "minor",
	uiName 			= "Character_MonsterSphere",
	
	gameplay_coef_group_id		= 0,
	gameplay_coef_min_lifetime	= 10,

}

Def.Character_Dummy = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/ships/bigship/precursor_ship/precursor_ship",
	maxViewDist 	= 999999,
	network_sync	= true,
}

Def.Character_ShieldCombined1 = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/combined",
	maxViewDist 	= 999999,
	network_sync	= true,
	hudType			= "default",
	hud_visibility_type = "major",
	death_sound     = "sound/raid/raid_avanpost_explosion",
	broken_parts = 
	{
		{ def = "Character_ShieldLeftWreck1",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ShieldLeftWreck2",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ShieldLeftWreck3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ShieldLeftWreck4",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
	},	
}

Def.Character_ShieldLeftWreck1 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/shield_left_wreck1",
	children = 	{
					{def = "MonsterExplosion",	joint = "fx1"},
					{def = "MonsterExplosionFireballs",	joint = "fx1"},
				},
}

Def.Character_ShieldLeftWreck2 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/shield_left_wreck2",
	children = 	{
					{def = "MonsterExplosion",	joint = "fx1"},
					{def = "MonsterExplosionFireballs",	joint = "fx2"},
					{def = "MonsterExplosionFireballs",	joint = "fx3"},
				},
}

Def.Character_ShieldLeftWreck3 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/shield_left_wreck3",
	children = 	{
					{def = "MonsterShieldShpereExplosion",	joint = "fx1"},
					{def = "MonsterExplosionFireballs",	joint = "fx2"},
					{def = "MonsterExplosionFireballs",	joint = "fx3"},
				},
}

Def.Character_ShieldLeftWreck4 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/shield_left_wreck4",
	children = 	{
					{def = "MonsterExplosion",	joint = "fx1"},
					{def = "MonsterExplosionFireballs",	joint = "fx2"},
				},	
}

Def.Character_ShieldCombined2 = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/combined_02",
	maxViewDist 	= 999999,
	network_sync	= true,
	hudType			= "default",
	hud_visibility_type = "major",
	death_sound     = "sound/raid/raid_avanpost_explosion",
	broken_parts = 
	{
		{ def = "Character_ShieldRightWreck1",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ShieldRightWreck2",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ShieldRightWreck3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ShieldRightWreck4",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ShieldRightWreck5",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
	},	
}

Def.Character_ShieldRightWreck1 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/shield_right_1",
	children = 	{
					{def = "MonsterExplosionFireballs",	joint = "fx1"},
				},
}

Def.Character_ShieldRightWreck2 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/shield_right_2",
	children = 	{
					{def = "MonsterShieldShpereExplosion",	joint = "fx1"},
					{def = "MonsterExplosion",	joint = "fx2"},
					{def = "MonsterExplosion",	joint = "fx3"},
					{def = "MonsterExplosionFireballs",	joint = "fx3"},
				},
}

Def.Character_ShieldRightWreck3 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/shield_right_3",
	children = 	{
					{def = "MonsterExplosionFireballs",	joint = "fx1"},
				},
}

Def.Character_ShieldRightWreck4 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/shield_right_4",
	children = 	{
					{def = "MonsterExplosion",	joint = "fx1"},
					{def = "MonsterExplosionFireballs",	joint = "fx2"},
				},
}

Def.Character_ShieldRightWreck5 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/shield_right_5",
}

Def.Character_Claw01 = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/claw_01",
	maxViewDist 	= 999999,
	network_sync	= true,	
	children = 	
	{
		{	def = "MonsterHurt5", joint = "root",	},
		{	def = "PvE_Gen_Knock", joint = "root",	},
	},
	broken_parts = 
	{
		{ def = "Character_ClawLeftWreck1",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ClawLeftWreck2",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ClawLeftWreck3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
	},		
}

Def.Character_Claw02 = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/claw_02",
	maxViewDist 	= 999999,
	network_sync	= true,
	children = 	
	{
		{	def = "MonsterHurt5", joint = "root",	},
		{	def = "PvE_Gen_Knock", joint = "root",	},
	},
	broken_parts = 
	{
		{ def = "Character_ClawRightWreck1",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ClawRightWreck2",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ClawRightWreck3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
		{ def = "Character_ClawRightWreck4",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 1, speed_deviation = 0, speed_inherit = 1, ttl = 999, },
	},	
}

Def.Character_ClawRightWreck1 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/claw_right_wreck1",
	children = 	{
					{def = "MonsterShieldShpereExplosion",	joint = "fx1"},
					{def = "MonsterExplosion",	joint = "fx2"},
				},
}

Def.Character_ClawRightWreck2 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/claw_right_wreck2",
	children = 	{
					{def = "MonsterShieldShpereExplosion",	joint = "fx1"},
					{def = "MonsterExplosion",	joint = "fx2"},
				},
}

Def.Character_ClawRightWreck3 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/claw_right_wreck3",
	children = 	{
					{def = "MonsterExplosion",	joint = "fx1"},
					{def = "MonsterExplosion",	joint = "fx2"},
					{def = "MonsterShieldShpereExplosion",	joint = "fx3"},
					{def = "MonsterExplosion",	joint = "fx4"},
					{def = "MonsterExplosion",	joint = "fx5"},
					{def = "MonsterExplosion",	joint = "fx6"},
					{def = "MonsterExplosion",	joint = "fx7"},
				},
}

Def.Character_ClawRightWreck4 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/claw_right_wreck4",
	children = 	{
					{def = "MonsterExplosion",	joint = "fx1"},
				},
}

Def.Character_ClawLeftWreck1 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/claw_left_wreck1",
	children = 	{
				{def = "MonsterShieldShpereExplosion",	joint = "fx1"},
				{def = "MonsterExplosion",	joint = "fx2"},
				{def = "MonsterExplosion",	joint = "fx3"},
				{def = "MonsterExplosion",	joint = "fx4"},
				{def = "MonsterExplosion",	joint = "fx5"},
				{def = "MonsterExplosion",	joint = "fx6"},
			},
}

Def.Character_ClawLeftWreck2 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/claw_left_wreck2",
	children = 	{
			{def = "MonsterShieldShpereExplosion",	joint = "fx1"},
			{def = "MonsterExplosion",	joint = "fx2"},
			{def = "MonsterExplosion",	joint = "fx3"},
			{def = "MonsterExplosion",	joint = "fx4"},
			{def = "MonsterExplosion",	joint = "fx5"},
		},
}

Def.Character_ClawLeftWreck3 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 999999,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/characters/monster/claw_left_wreck3",
}

Def.Character_monster4fiz = 
{
	class = "BaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/tongue_fiz",
	physics			= { solid_type = solid.compound_model, static = false, kinematic = true, material = "Rock", mass = 1000000, },
	maxViewDist 	= 999999,
	network_sync	= true,
}

Def.Character_GunBacklight = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/gun_backlight",
	maxViewDist 	= 999999,
	network_sync	= true,
}

Def.Character_HoldBacklight = 
{
	class = "ScBaseEntity",
	in_editor	=	true,
	model		=	"models/characters/monster/effect_ploshadka",
	maxViewDist 	= 999999,
	network_sync	= true,
}

-- Станции для открытого мира - Конструктор

Def.OpenWorld_Empire_Asteroid01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/asteroid_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/asteroid_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/asteroid_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/asteroid_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid05 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/asteroid_005",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid06 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/asteroid_006",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid07 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_asteroid_007",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid08 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_asteroid_008",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid09 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_asteroid_009",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid010 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_asteroid_010",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid011 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_asteroid_011",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_Asteroid012 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_asteroid_012",
	physics			= { solid_type = solid.compound_model, static = true, material = "Rock" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EBalka01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_balka_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EBox01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_box_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EMinig01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_minig_st_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EMinig02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_minig_st_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EMinig03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_minig_st_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EMinig04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_minig_st_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EPlatform01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_platform_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
	as_world 		= true,
}

Def.OpenWorld_Empire_ERing01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ring_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_ERing02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ring_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_ERing02_Stealth =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ring_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
	uiName 			= "StealthPVE_BOSS_name",
}

Def.OpenWorld_Empire_EShip01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ship_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EShip02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ship_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EShip03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ship_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EShip04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ship_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EWreckShip01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ship_wr_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EWreckShip02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ship_wr_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EWreckShip03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_ship_wr_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EStation01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_station_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EStation02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_station_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EStation03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_station_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EStation04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_station_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EStation05 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_station_005",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EStation06 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_station_006",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EStation07 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_station_007",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_ETransportnik01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_transportnik_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_ETunnel01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_tunnel_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_ETunnel02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_tunnel_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_ETunnel03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_tunnel_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_ETunnel04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_tunnel_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Empire_EWreck01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_wreck_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FBuilding01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_building_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FBuilding02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_building_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FBuilding03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_building_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FBuilding04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_building_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FBuilding05 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_building_005",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FBuilding06 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_building_006",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FBuilding07 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_building_007",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FPlatform01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_platform_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FPlatform02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_platform_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FPlatform03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_platform_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FPlatform04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_platform_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}


Def.OpenWorld_Federation_FPlatform05 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_platform_005",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FShip01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_ship_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FStation01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_station_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FStation02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_station_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FStation03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_station_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FStation04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_station_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FStation05 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_station_005",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FStation06 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_station_006",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FStation07 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_station_007",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FStation08 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_station_008",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FWreck01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_wreck_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Federation_FWreck02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/federation/federartion_wreck_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JPlatform01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_platform_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JPlatform02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_platform_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JShip01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_ship_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation05 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_005",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation06 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_006",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation07 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_007",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation08 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_008",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation09 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_009",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation10 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_010",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation11 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_011",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JStation12 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_station_012",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JWreckStation01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_wr_station_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JWreckStation02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_wr_station_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JWreckStation03 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_wr_station_003",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JWreckStation04 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_wr_station_004",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

Def.OpenWorld_Jericho_JWreckStation05 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/jericho/jericho_wr_station_005",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor		= true,
	as_world 		= true,
}

------------------------------------------------------------------------------------------------------

Def.OpenWorld_Empire_EBalka02 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_balka_002",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.OpenWorld_Empire_EBox01 =
{
	class			= "BaseEntity",
	model			= "models/objects/gameplay/open_world/empire/empire_objects/empire_box_001",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Alidium_TurretSmall =
{
	class			= "BaseEntity",
	model			= "models/objects/guns/gun_01/gun_01",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Alidium_TurretBig =
{
	class			= "BaseEntity",
	model			= "models/objects/guns/gun_02/gun_02",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Farm_Farm001 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/farm/models/farm_01",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
	maxViewDist 	= 999999,
	in_editor	=	false,
}

Def.Farm_Farm003 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/farm/models/farm_03",
	physics		= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk1", mass = 100000000, },	
	maxViewDist 	= 999999,
	in_editor	=	false,
}

Def.Farm_Farm01 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
 	model			= "mapskit/maps/area1/farm/models/farm_rotator",
-- 	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	children = 
	{
		{ def = "Farm_Farm001", joint = "rotation" },
	},	
}

Def.Farm_Farm02 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/farm/models/farm_02",
 	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Farm_Farm03 =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "mapskit/maps/area1/farm/models/farm_rotator",
-- 	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	children = 
	{
		{ def = "Farm_Farm003", joint = "rotation" },
	},	
}

Def.Farm_Farm04 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/farm/models/farm_04",
 	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Farm_Farm05 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/farm/models/farm_05",
 	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Farm_Sphere01 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/farm/models/sphere_01",
--	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}

Def.Farm_Sphere02 =
{
	class			= "BaseEntity",
	model			= "mapskit/maps/area1/farm/models/sphere_02",
 	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist 	= 999999,
	in_editor	=	true,
}


Def.Constructor_1_01 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_01",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_10 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_10",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_100 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_100",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_101 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_101",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_102 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_102",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_103 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_103",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_104 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_104",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_105 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_105",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_106 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_106",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_107 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_107",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_108 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_108",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_109 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_109",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_11 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_11",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_110 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_110",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_111 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_111",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_112 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_112",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_113 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_113",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_114 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_114",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_115 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_115",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_116 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_116",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_117 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_117",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_118 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_118",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_119 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_119",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_12 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_12",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_120 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_120",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_121 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_121",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_122 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_122",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_123 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_123",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_124 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_124",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_125 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_125",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_126 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_126",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_127 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_127",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_128 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_128",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_129 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_129",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_13 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_13",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_1_130 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_130",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_131 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_131",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_132 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_132",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_14 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_14",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_15 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_15",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_16 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_16",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_17 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_17",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_18 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_18",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_19 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_19",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_02 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_02",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_20 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_20",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_21 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_21",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_22 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_22",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_23 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_23",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_24 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_24",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_25 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_25",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_26 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_26",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_27 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_27",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_28 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_28",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_29 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_29",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_03 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_03",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_30 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_30",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_31 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_31",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_32 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_32",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_33 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_33",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_34 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_34",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_35 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_35",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_36 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_36",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_37 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_37",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_38 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_38",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_39 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_39",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_04 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_04",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_1_40 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_40",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_41 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_41",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_42 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_42",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_43 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_43",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_44 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_44",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_45 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_45",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_46 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_46",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_47 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_47",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_48 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_48",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_49 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_49",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_05 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_05",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_50 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_50",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_51 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_51",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_52 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_52",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_53 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_53",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_54 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_54",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_55 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_55",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_56 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_56",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_57 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_57",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_58 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_58",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_59 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_59",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_06 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_06",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_60 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_60",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_61 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_61",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_62 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_62",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_63 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_63",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_64 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_64",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_65 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_65",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_66 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_66",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_67 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_67",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_1_68 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_68",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_69 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_69",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_07 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_07",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_70 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_70",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_71 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_71",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_72 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_72",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_73 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_73",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_74 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_74",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_75 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_75",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_76 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_76",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_77 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_77",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_78 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_78",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_79 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_79",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_08 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_08",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_80 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_80",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_81 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_81",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_82 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_82",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_83 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_83",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_84 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_84",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_85 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_85",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_86 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_86",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_87 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_87",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_88 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_88",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_89 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_89",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_09 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_09",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_90 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_90",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_91 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_91",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_92 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_92",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_93 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_93",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_94 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_94",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_95 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_95",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_96 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_96",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_97 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_97",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_98 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_98",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_99 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_99",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_balka1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_balka1",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_platform1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_platform1",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_platform2 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_platform2",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_platform3 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_platform3",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_1_platform4 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_platform4",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_platform5 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_platform5",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_1_ring = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_1/constuctor_a_ring",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_1",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}


Def.Constructor_2_10 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_10",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_11 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_11",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_12 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_12",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_13 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_13",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_14 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_14",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_15 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_15",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_16 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_16",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_17 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_17",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_18 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_18",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_2_19 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_19",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_2 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_2",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_20 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_20",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_21 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_21",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_22 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_22",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_23 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_23",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_24 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_24",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_25 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_25",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_26 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_26",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_27 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_27",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_28 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_28",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_29 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_29",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_3 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_3",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_30 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_30",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_31 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_31",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_32 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_32",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_33 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_33",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_34 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_34",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_35 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_35",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_36 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_36",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_37 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_37",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_38 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_38",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_39 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_39",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_4 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_4",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_40 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_40",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_41 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_41",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_42 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_42",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_43 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_43",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_44 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_44",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_2_45 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_45",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_46 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_46",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_2_47 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_47",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_48 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_48",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_49 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_49",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_5 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_5",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_50 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_50",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_51 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_51",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_52 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_52",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_53 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_53",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_54 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_54",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_55 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_55",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_56 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_56",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_2_57 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_57",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_58 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_58",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_59 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_59",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_6 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_6",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_60 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_60",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_61 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_61",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_62 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_62",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_63 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_63",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_64 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_64",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_65 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_65",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_66 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_66",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_67 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_67",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_68 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_68",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_69 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_69",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_7 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_7",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_70 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_70",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_71 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_71",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_72 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_72",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_73 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_73",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_74 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_74",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_2_75 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_75",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_76 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_76",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_77 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_77",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_78 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_78",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_79 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_79",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_8 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_8",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_80 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_80",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_81 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_81",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_82 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_82",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_83 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_83",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_84 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_84",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_85 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_85",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_2_86 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_86",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_87 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_87",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_88 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_88",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_89 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_89",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_9 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_9",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_90 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_90",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_91 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_91",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_92 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_92",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_93 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_93",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_94 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_94",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_95 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_95",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_96 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_96",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_97 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_97",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_98 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_98",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_2_99 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_2/constructor_b_99",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}


Def.Constructor_3_1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_1",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_10 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_10",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_11 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_11",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_12 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_12",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_13 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_13",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_14 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_14",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_15 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_15",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_16 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_16",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_17 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_17",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_18 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_18",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_19 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_19",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_2 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_2",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_20 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_20",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_21 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_21",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_22 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_22",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_23 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_23",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_24 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_24",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}
Def.Constructor_3_24Monitors = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_24_monitors",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = false,
		kinematic = true, 
		material = "ShipMetalMk3", 
		mass = 1000000,
	},
}

Def.Constructor_3_25 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_25",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_26 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_26",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_27 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_27",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_28 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_28",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_29 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_29",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_3 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_3",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_30 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_30",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_31 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_31",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_32 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_32",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_33 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_33",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_34 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_34",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_35 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_35",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_36 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_36",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_37 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_37",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_38 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_38",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_39 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_39",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_4 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_4",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_40 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_40",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_41 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_41",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_42 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_42",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_43 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_43",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_44 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_44",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_45 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_45",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_46 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_46",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_47 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_47",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_48 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_48",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_49 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_49",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_5 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_5",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_50 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_50",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_51 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_51",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_6 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_6",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_3_7 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_7",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_8 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_8",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_3_9 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_3/constructor_c_9",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}
Def.Constructor_4_1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_1",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_4_10 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_10",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_4_11 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_11",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_12 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_12",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_13 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_13",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_14 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_14",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_15 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_15",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_16 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_16",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_17 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_17",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_18 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_18",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_19 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_19",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_2 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_2",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_20 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_20",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_21 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_21",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_22 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_22",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_23 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_23",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_24 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_24",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_25 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_25",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_26 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_26",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_27 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_27",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_28 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_28",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_29 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_29",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_3 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_3",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_30 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_30",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_31 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_31",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_32 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_32",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_33 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_33",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_4_34 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_34",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_35 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_35",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_36 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_36",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_37 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_37",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_38 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_38",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_39 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_39",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_4_4 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_4",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_40 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_40",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_41 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_41",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_42 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_42",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_43 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_43",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_44 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_44",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_45 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_45",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_46 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_46",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_47 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_47",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_48 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_48",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_49 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_49",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_5 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_5",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_50 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_50",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_51 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_51",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_52 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_52",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_4_53 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_53",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_4_54 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_54",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_55 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_55",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_4_56 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_56",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_57 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_57",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_58 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_58",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_4_59 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_59",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_6 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_6",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_60 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_60",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_61 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_61",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_62 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_62",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_63 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_63",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_64 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_64",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_65 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_65",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_4_66 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_66",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_4_67 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_67",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_68 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_68",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_69 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_69",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_7 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_7",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_70 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_70",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_71 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_71",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_72 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_72",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_73 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_73",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_74 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_74",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_4_8 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_8",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_4_9 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_4/constructor_d_9",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}


Def.Constructor_5_1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_1",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_10 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_10",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_11 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_11",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_12 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_12",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_13 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_13",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_5_14 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_14",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_15 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_15",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_5_16 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_16",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_5_17 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_17",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_5_18 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_18",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_19 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_19",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_2 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_2",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_20 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_20",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_21 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_21",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_22 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_22",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_23 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_23",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_5_24 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_24",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_25 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_25",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_26 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_26",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_27 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_27",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_28 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_28",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_29 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_29",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_3 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_3",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_30 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_30",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_31 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_31",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_32 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_32",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_33 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_33",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_34 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_34",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_35 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_35",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_36 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_36",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_37 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_37",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_38 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_38",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_39 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_39",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_5_4 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_4",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_40 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_40",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_41 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_41",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_42 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_42",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_5 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_5",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_5_6 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_6",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_7 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_7",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_8 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_8",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_5_9 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_5/constructor_e_9",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_1",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_10 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_10",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_11 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_11",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_12 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_12",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_13 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_13",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_6_14 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_14",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_15 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_15",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_16 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_16",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_17 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_17",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_18 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_18",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_19 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_19",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_2 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_2",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_20 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_20",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_21 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_21",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_22 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_22",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_23 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_23",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_24 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_24",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_3 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_3",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_4 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_4",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_5 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_5",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_6 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_6",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_7 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_7",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_8 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_8",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_6_9 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_6/constructor_f_9",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_1",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_7_10 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_10",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_100 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_100",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_101 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_101",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_102 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_102",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_103 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_103",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_104 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_104",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_105 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_105",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_106 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_106",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_107 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_107",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_11 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_11",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_12 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_12",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_13 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_13",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_14 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_14",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_15 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_15",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_16 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_16",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_7_17 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_17",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_18 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_18",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_19 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_19",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_2 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_2",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_20 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_20",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_21 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_21",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_22 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_22",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_23 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_23",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_24 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_24",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_25 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_25",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_26 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_26",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_27 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_27",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_28 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_28",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_29 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_29",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_3 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_3",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_7_30 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_30",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_31 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_31",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_32 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_32",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_33 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_33",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_34 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_34",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_35 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_35",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_36 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_36",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_37 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_37",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_38 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_38",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_39 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_39",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_4 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_4",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_40 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_40",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_41 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_41",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_42 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_42",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_43 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_43",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_44 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_44",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_45 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_45",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_46 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_46",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_47 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_47",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_48 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_48",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_49 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_49",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_5 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_5",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_7_50 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_50",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_51 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_51",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_52 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_52",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_53 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_53",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_54 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_54",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_55 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_55",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_56 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_56",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_57 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_57",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_58 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_58",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_59 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_59",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_7_6 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_6",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_60 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_60",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_61 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_61",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_62 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_62",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_63 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_63",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_64 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_64",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_65 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_65",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_66 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_66",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_67 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_67",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_68 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_68",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_69 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_69",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_7 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_7",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_70 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_70",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_71 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_71",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_72 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_72",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_73 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_73",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_74 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_74",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_75 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_75",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_76 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_76",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_77 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_77",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_78 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_78",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_79 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_79",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_7_8 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_8",
	physics = 
	{
		material = "Metal",
		solid_type = solid.model,
		static = true,
	},
}

Def.Constructor_7_80 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_80",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_81 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_81",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_82 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_82",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_83 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_83",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_84 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_84",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_85 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_85",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_86 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_86",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_87 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_87",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_88 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_88",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_7_89 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_89",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_7_9 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_9",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_90 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_90",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_7_91 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_91",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_92 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_92",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_7_93 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_93",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_94 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_94",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_95 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_95",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_96 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_96",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_97 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_97",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_98 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_98",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_7_99 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_7/constructor_g_99",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_1",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_10 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_10",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_11 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_11",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_12 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_12",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_13 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_13",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_14 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_14",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_15 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_15",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_16 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_16",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_17 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_17",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_18 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_18",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_19 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_19",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_2 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_2",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_20 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_20",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_8_21 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_21",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_22 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_22",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_8_23 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_23",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_8_24 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_24",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_8_25 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_25",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_8_26 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_26",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_27 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_27",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_28 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_28",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_29 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_29",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_3 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_3",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_30 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_30",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_31 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_31",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_32 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_32",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_33 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_33",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_34 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_34",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_35 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_35",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_36 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_36",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_37 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_37",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_38 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_38",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_39 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_39",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_4 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_4",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_40 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_40",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_41 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_41",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_42 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_42",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_43 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_43",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_44 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_44",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_45 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_45",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_46 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_46",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_47 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_47",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_48 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_48",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_49 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_49",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_5 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_5",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_6 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_6",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_7 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_7",
	physics = 
	{
		material = "Metal",
		solid_type = 3,
		static = true,
	},
}

Def.Constructor_8_8 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_8",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_8_9 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/constructor_8/constructor_h_9",
	physics = 
	{
		material = "Metal",
		solid_type = 2,
		static = true,
	},
}

Def.Constructor_Billboard_Billboard62 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/billboard/billboard_62",
}

Def.Module_Portal =
{
	class = "AnimatedEntity",
	in_editor	=	true,
	maxViewDist 	= 999999,
	model		=	"models/objects/jump_gates/portal/portal",
		
}

Def.UniqBoss_Engine_Wreck =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/ships/race_4/h/race4_h_t1_craftuniq_boss_eng_wreck",
	children = 
	{
		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl1" },
 		{ effect = "particles/explosions/huge_engine_expl_mid", joint = "expl2" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl5" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl6" },
		{ effect = "DeadEngineDestroyerTiny", joint = "fx1" },	 
		{ effect = "DeadEngineDestroyerTiny", joint = "fx2" },	
	},	
}


Def.EnergyGenerator = 
{
	class				= "ScBaseEntity", --"ScBaseEntity",
	in_editor			= true,
	maxViewDist			= 5000,
	
	model			= "models/objects/gameplay/generator/generator_01", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	work_sound	= "sound/ambient/frozen_generator_loop",	
	
} 

Def.EnergyGeneratorDestroy =
{
	as_world 		= true,
	class 			= "BaseEntity",
	in_editor		= true,
	model			= "models/objects/gameplay/generator/generator_01_wreck",
	--physics			= { solid_type = solid.compound_model, dynamic = true, material = "Metal", mass = 50000, },
	maxViewDist		= 3000,
}

Def.AnomalyTest = 
{
	class		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/shields/shield_cover_sphere",
	physics		= { solid_type = solid.model, mass = 10000, material = "Rock", },
	health 		= 1000,
	damageable	= true,
	death_effect = "particles/explosions/objects/alien_anomaly_explosion",
	children 	= 
	{
		{ effect = "particles/objects/alien_anomaly", joint = "root" },
	},	
}

Def.BeaconTest = 
{
	class		= "ScBaseEntity",
	in_editor	= true,
	model = "models/misc/invisible_model",
	physics		= { solid_type = solid.sphere, sphere_radius = 1.75,  kinematic = true, material = "GiantShield", mass = 1000000, hitbox = true, },
	health 		= 1000,
	damageable	= true,
	death_effect = "particles/explosions/objects/alien_sphere_mid_explosion",
	children 	= 	{
						{ def ="AlienBeaconMid", joint = "root" },
						{ def ="CoverShieldCyber", joint = "root" },
					},
}

Def.Constructor_decals_1 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_01",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_2 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_02",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_3 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_03",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_4 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_04",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_5 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_05",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_6 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_06",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_7 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_07",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_8 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_08",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_9 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_09",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_10 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_10",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_11 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_11",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_12 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_12",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_13 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_13",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_14 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_14",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_15 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_15",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_16 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_16",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_17 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_17",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_18 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_18",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_19 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_19",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_20 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_20",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_21 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_21",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_22 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_22",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_23 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_23",
	physics = 
	{
		material = "Metal",
		solid_type = 1,
		static = true,
	},
}

Def.Constructor_decals_24 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_24",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_25 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_25",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_26 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_26",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_27 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_27",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_28 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_28",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_29 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_29",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_30 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_30",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_31 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_31",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_32 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_32",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_33 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_33",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_34 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_34",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_35 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_35",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_36 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_36",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Constructor_decals_37 = 
{
	as_world = true,
	class = "BaseEntity",
	in_editor = true,
	maxViewDist = 999999,
	model = "models/objects/constructor/decal/constructor_decal_37",
	physics = 
	{
		material = "Metal",
		solid_type = solid.none,
		static = true,
	},
}

Def.Dreadnought_StaticDred_Team1_2 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	as_world 		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_empire_02",
	skin 			= "s1",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 			= "tooltip_ship_dreadnought",
}

Def.Dreadnought_StaticDred_Team1_1 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	as_world 		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_empire_01",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 			= "tooltip_ship_dreadnought",
	children =
	{
		{	def = "Dreadnought_StaticDred_Team1_2", joint = "root",	},
	},	
	skin 			= "s1",
}

Def.Dreadnought_StaticDred_Team2_2 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	as_world 		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_empire_02",
	skin 			= "s2",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 			= "tooltip_ship_dreadnought",
}

Def.Dreadnought_StaticDred_Team2_1 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	as_world 		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_empire_01",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 			= "tooltip_ship_dreadnought",
	children =
	{
		{	def = "Dreadnought_StaticDred_Team2_2", joint = "root",	},
	},	
	skin 			= "s2",
}

-- обломки для стелса
Def.Stealth_WreckDebris1 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_01",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world 		= true,
}

-- обломки для стелса
Def.Stealth_WreckDebris2 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_02",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world 		= true,
}

-- обломки для стелса
Def.Stealth_WreckDebris3 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_03",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world 		= true,
}

-- обломки для стелса
Def.Stealth_WreckDebris4 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_04",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world 		= true,
}

-- обломки для стелса
Def.Stealth_WreckDebris5 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_05",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world 		= true,
}

-- обломки для стелса
Def.Stealth_WreckDebris6 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_06",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world	= 	true,
}

-- обломки для стелса
Def.Stealth_WreckDebris7 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_07",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world 		= true,
}

-- обломки для стелса
Def.Stealth_WreckDebris8 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_08",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world 		= true,
}

-- обломки для стелса
Def.Stealth_WreckDebris9 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_09",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world 		= true,
}

-- обломки для стелса
Def.Stealth_WreckDebris10 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_10",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	as_world 		= true,
}