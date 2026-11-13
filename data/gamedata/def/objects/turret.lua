--
Def.Turret_FlakGun = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/flak_gun/flak_gun",

	relationship_group = 0,

	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 1,
	damageable		= true,
	
	fire_rate		= 60.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 200,
	
	damage_kinetic	= 0,
	damage_emp		= 1000,
	damage_thermal	= 0,

	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_SniperRailgun",
	shot_effect 	= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/railgun/SpyDrone_rail",

	death_effect	= "particles/explosions/objects/explosion_tiny",
	death_sound		= "sound/explosion/turret_expl",
}


--
Def.Turret_Team1_FlakGun = 
{
	inherit			= "Turret_FlakGun",
	relationship_group = 1,
}

--
Def.Turret_PlasmaCannon = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/big_plasma_cannon/big_plasma_cannon",
	signature		= ai.Signature.HUGE,	---#62744 больша€ туррель, больша€ сигнатура
	relationship_group = 0,

	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	health 			= 1,
	damageable		= true,
	
	fire_rate		= 45.0,
	dispersion		= 0.0, -- deg
	max_range		= 350,

	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 200,
	
	damage_kinetic	= 0,
	damage_emp		= 2000,
	damage_thermal	= 0,

	projectile		= "Projectile_HeavyPlasma",
	shot_effect 	= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot",

	death_effect	= "particles/explosions/objects/explosion_mid",
	death_sound		= "sound/explosion/turret_expl",
	
	broken_parts = 
	{
		[ 1 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 2 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 3 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 4 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 5 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 6 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
	},
}


--
Def.Turret_RocketGun = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/rocket_launcher/rocket_launcher",

	relationship_group = 0,
	hudType 		= "default",

	physics			= { solid_type = solid.cylindery, static = true, material = "Metal" },
	health 			= 1,
	damageable		= true,
	
	fire_rate		= 120.0,
	dispersion		= 0.0, -- deg
	max_range		= 350,
	no_friendly_fire = true,

	max_rot_speed	= 30,	-- deg per second
	
	rot_sound		= "sound/weapons/turret/turret_motor",

	projectile		= "Turret_RocketGun_Missile",
	shot_effect 	= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/turret/rocketgun_oneshot",

	death_effect	= "particles/explosions/objects/explosion_small",
	death_sound		= "sound/explosion/turret_expl",
	shield_activate_sound = "sound/game/shield_activate",
    shield_deactivate_sound = "sound/game/shield_deactivate",
	
	broken_parts = 
	{
		[ 1 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 2 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 3 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 4 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 5 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 6 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
	},
}


--
Def.Turret_RocketGun_Missile = 
{
	inherit				= "Weapon_BaseRocket",
	in_editor			= false,
	model				= "models/weapons/missile_rocket",

	detonation_radius 	= 5,
	speed 				= 100,
	max_range 			= 300,
	flare_color 		= "255 150 100 15",
	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect = "particles/weapons/missile/rocket_trail_small",	
	work_sound 			= "sound/weapons/rockets/rocket_fly",

	flare_texture 		= "textures/star_smooth",
	rocket_class		= ai.RocketClass.SMALL,
	
	explosion_blast_wave= "Turret_RocketGun_Missile_BlastWave",
}


--
Def.Turret_RocketGun_Missile_BlastWave =
{
	class				= "BlastWave",
	in_editor			= false,
	intensity			= 30,
	damage_thermal		= 1200,
	blast_maxDistance	= 7.5,
	blast_minDistance	= 2,
	light_color 		= "255 100 0 100",
	light_radius 		= 20,
	light_time			= 0.8,
	effect 				= "particles/explosions/big_fire_2",
	sound				= "sound/explosion/small_rocket_expl",
}


--
Def.Turret_RailGun = 
{
	class 		= "Turret",
	in_editor		= true,
	model		= "models/turret/round_railgun01/round_railgun01", 

	relationship_group = 2,

	physics		= { solid_type = solid.model, static = true, material = "Metal" },
	health 		= 1,
	damageable	= true,
	
	fire_rate		= 60.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed 	= 200,
	
	damage_kinetic	= 0,
	damage_emp	= 1000,
	damage_thermal	= 0,

	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_HeavyRailgun", 
	shot_effect 	= "particles/weapons/drongun/muzzle",  -- заглушка
	shot_once_sound = "sound/weapons/turret/railgun_oneshot", 

	death_effect	= "particles/explosions/objects/explosion_tiny",
	death_sound	= "sound/explosion/turret_expl", 
}

Def.Turret_DummyKiller = 
{
	inherit 		= "Turret_FlakGun",
	model		= "models/turret/round_railgun01/round_railgun01", 
	--inherit 		= "Turret_PlasmaCannon",
	fire_rate		=  300.0,	
	damage_emp	= 0,
	damage		= 0.5,
	dispersion		= 1.5, -- deg
}
