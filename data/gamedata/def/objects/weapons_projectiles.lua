Def.Projectile_Nail_Default =
{
	class			= "Projectile",
	in_editor		= false,
	mass			= 0.05, -- 5 ќчень тр€сет малые корабли!!!1
	effect			= "particles/weapons/railgun/projectile",
	
	hitbox_min 		= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max		= Vec3( 0.1, 0.1, 0.1 ),
	
	apply_shake		= true,
}

Def.Projectile_Plasma_Default =
{
	class			= "Projectile",
	in_editor		= false,
	mass			= 0.05,
--    work_sound = "sound/weapons/plasma_fly",
	hitbox_min 		= Vec3( -0.2, -0.2, -0.2 ),
	hitbox_max		= Vec3( 0.2, 0.2, 0.2 ),
	
	apply_shake		= true,
	
	hit_effect		= "particles/weapons/plasma/hit",
	effect 			= "particles/weapons/plasma/projectile2",
}

Def.Projectile_Beam_Default =
{
	class			= "Projectile",
	in_editor		= false,
}


Def.Projectile_Nail_Iron =
{
	inherit			= "Projectile_Nail_Default",
	--model			= "models/weapons/plasma_red_medium",
	
	hit_effect				= "particles/weapons/railgun/hit",
	hit_ship_effect 		= "particles/weapons/railgun/hit_ship",
	hit_shield_effect 		= "particles/weapons/railgun/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/railgun/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/railgun/hit_crit_shield",
	
	--effect            	= "particles/weapons/railgun/railgun_destr3_projectile",
	effect            	= "particles/weapons/railgun/railgun_pirate_projectile",
	shadowCaster		= false,
	impact_type 		= "railgun",
}




Def.Projectile_Nail_Iron_Light =
{
	inherit			= "Projectile_Nail_Default",
	--model			= "models/weapons/plasma_red_medium",
	
	hit_effect		= "particles/weapons/railgun/hit",
	--effect            	= "particles/weapons/railgun_trail",
	shadowCaster		= false,
	impact_type 		= "railgun",
}

Def.Projectile_Nail_Iron_Medium =
{
	inherit			= "Projectile_Nail_Default",
	hit_effect		= "particles/weapons/railgun/hit",
	shadowCaster		= false,
	impact_type 		= "railgun",
}
-- Minigun
Def.Projectile_Nail_Iron_Heavy =
{
	inherit				= "Projectile_Nail_Default",
	hit_effect			= "particles/weapons/railgun/hit",
	--hit_effect		= "particles/weapons/fireworks/newyear1_explosion", --New Year
	effect         	    = "particles/weapons/railgun/projectile_yellow",
	--effect            = "particles/weapons/fireworks/newyear1_projectile", --New Year
	shadowCaster		= false,
	impact_type 		= "railgun",
}
-- Minigun projectile for T5
Def.Projectile_Nail_Iron_Heavy_T5 =
{
	inherit				= "Projectile_Nail_Default",
	hit_effect			= "particles/weapons/railgun/hit",
	--hit_effect		= "particles/weapons/fireworks/newyear1_explosion", --New Year
	effect         	    = "particles/weapons/railgun/projectile_yellow_2",
	--effect            = "particles/weapons/fireworks/newyear1_projectile", --New Year
	shadowCaster		= false,
	impact_type 		= "railgun",
}

Def.Projectile_Plasma_Light =
{
	inherit			= "Projectile_Plasma_Default",
	shadowCaster		= false,
	impact_type 		= "plasma",
	
	hit_effect				= "particles/weapons/plasma/hit",
	hit_ship_effect 		= "particles/weapons/plasma/hit_ship",
	hit_shield_effect 		= "particles/weapons/plasma/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/plasma/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/plasma/hit_crit_shield",
	effect 					= "particles/weapons/plasma/plasma_heavy_projectile",
}

Def.Projectile_Plasma_Medium =
{
	inherit			= "Projectile_Plasma_Default",

	shadowCaster		= false,
	mass			= 0.05,
	impact_type 		= "plasma",
}
	
Def.Projectile_Plasma_Heavy =
{
	inherit			= "Projectile_Plasma_Default",
	shadowCaster		= false,
	mass			= 0.05,
	impact_type 		= "plasma",
}

Def.Projectile_Dron_Plasma =
{
	inherit			= "Projectile_Plasma_Default",
	effect 			= "particles/weapons/drongun/projectile",
	hit_effect		= "particles/weapons/railgun/hit",
	--hit_effect				= "particles/weapons/guided/explosion_old", --HITTEST
	--hit_effect				= "particles/weapons/guided/explosion", --HITTEST
	--hit_effect				= "particles/weapons/guided/explosion_nuke", --HITTEST
	shadowCaster		= false,
	impact_type 		= "plasma",
	
	uiName			= "DroidTurret_Projectile",	
}
Def.Projectile_Dron_Plasma_Green =
{
	inherit			= "Projectile_Plasma_Default",
	effect 			= "particles/weapons/other/follower_drone_projectile",
	hit_effect		= "particles/weapons/blaster/dturret_explosion",
	--hit_effect		= "particles/weapons/mid/wolf_explosion", --HITTEST
	
	shadowCaster		= false,
	impact_type 		= "plasma",
	
	uiName			= "DroidTurret_Projectile",	
}
Def.Projectile_DronLowRes =
{
	class					= "Rocket",
	
	hitbox_min 				= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max				= Vec3( 0.1, 0.1, 0.1 ),
	
	explosion_blast_wave	= "Blastwave_DronLowRes",
	effect 					= "particles/weapons/suppressing_projectile",
	override_blast_wave_damage = true,
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	
	detonation_radius		= 1,

	flare_color				= "255 150 100 15",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
	spell 					= "MeltingFire",
	
	projectile_speed  		= 500,
	

}

Def.Blastwave_DronLowRes  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 1,
	blast_maxDistance		= 5,
	apply_damage			= true,
	apply_shake 			= false,

	effect 					= "particles/weapons/suppressing_hit",
	light_color 			= "255 128 128 20",
	light_radius 			= 8,
	light_time 				= 0.4,
	sound 					= "sound/weapons/suppress/suppr_hit",
}


Def.Projectile_Neutron =
{
	inherit					= "Projectile_Plasma_Default",
	effect 					= "particles/weapons/blaster/neutron_projectile",
	hit_effect				= "particles/weapons/blaster/dturret_explosion",
	smooth_effect_param 	= true,
	
	shadowCaster		= false,
	impact_type 		= "lasersniper",
}

Def.Projectile_LaserSniper =
{
	inherit					= "Projectile_Plasma_Default",
	effect 					= "particles/weapons/blaster/neutron_projectile",
	hit_effect				= "particles/weapons/blaster/dturret_explosion",
	hit_ship_effect 		= "particles/weapons/blaster/dturret_explosion",
	hit_shield_effect 		= "particles/weapons/blaster/dturret_explosion",
	hit_crit_ship_effect 	= "particles/weapons/blaster/dturret_explosion",
	hit_crit_shield_effect 	= "particles/weapons/blaster/dturret_explosion",
	smooth_effect_param 	= true,
	
	shadowCaster		= false,
	impact_type 		= "lasersniper",
}

Def.Projectile_SentryDron =
{
	inherit			= "Projectile_Plasma_Default",
	effect 			= "particles/weapons/drongun/projectile_sentry",
	hit_effect		= "particles/weapons/railgun/hit",
	
	shadowCaster		= false,
	impact_type 		= "plasma",
}


Def.Projectile_Disintegrator =
{
	inherit			= "Projectile_Nail_Default",
	--model			= "models/weapons/plasma_red_medium",
	
	hit_effect		= "particles/weapons/sniper/hit",
	effect 			= "particles/weapons/sniper/projectile",
	shadowCaster		= false,
	impact_type		= "disintegrator",
	work_sound 		= "sound/gadgets/disintegrator/dis_fly",
}



------------------

Def.Projectile_BasicPlasma =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect				= "particles/weapons/plasma/hit",
	
	hit_ship_effect 		= "particles/weapons/plasma/hit_ship",
	hit_shield_effect 		= "particles/weapons/plasma/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/plasma/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/plasma/hit_crit_shield",
	effect 					= "particles/weapons/plasma/projectile2",
	
	shadowCaster			= false,
	impact_type 			= "plasma",

}

Def.Projectile_TurretPlasma =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/plasma/hit",
	effect 			= "particles/weapons/plasma/plasma_turret_projectile",
	
	shadowCaster		= false,
	impact_type 		= "plasma",
}

Def.Projectile_DreadTurretPlasma =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/plasma/hit",
	effect 			= "particles/weapons/plasma/plasma_turret_projectile",
	
	shadowCaster		= false,
	impact_type 		= "plasma",
	
	hitbox_min 		= Vec3( -1.6, -1.6, -1.6 ),
	hitbox_max		= Vec3( 1.6, 1.6, 1.6 ),
}

Def.Projectile_HeavyPlasma =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/plasma/hit",
	effect 			= "particles/weapons/plasma/plasma_heavy_projectile",
	
	shadowCaster		= false,
	impact_type 		= "plasma",
}

Def.Projectile_AutoPlasma =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/plasma/hit",
	effect 			= "particles/weapons/plasma/plasma_auto_projectile",
	
	shadowCaster		= false,
	impact_type 		= "plasma",
}

Def.Projectile_PlasmaBlaster =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/plasma/hit",
	effect 			= "particles/weapons/plasma/plasma_blaster_projectile",
	
	shadowCaster		= false,
	impact_type 		= "plasma",
}

Def.Projectile_SniperPlasma =
{
	inherit			= "Projectile_Plasma_Default",

	effect 			= "particles/weapons/plasma/plasma_sniper_projectile2",
	
	hit_effect				= "particles/weapons/plasma/hit",
	hit_ship_effect 		= "particles/weapons/plasma/hit_ship",
	hit_shield_effect 		= "particles/weapons/plasma/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/plasma/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/plasma/hit_crit_shield",
	shadowCaster		= false,
	impact_type 		= "plasma",
}

Def.Projectile_BasicRailgun =
{
	inherit					= "Projectile_Nail_Default",

	hit_effect				= "particles/weapons/railgun/hit",
	hit_ship_effect 		= "particles/weapons/railgun/hit_ship",
	hit_shield_effect 		= "particles/weapons/railgun/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/railgun/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/railgun/hit_crit_shield",
	
	effect = "particles/weapons/railgun/railgun_basic_projectile",
	
	shadowCaster	= false,
    impact_type = "railgun",
}

Def.Projectile_BuckshotRailgun =
{
	inherit			= "Projectile_Nail_Default",

	hit_effect		= "particles/weapons/railgun/hit",
	effect = "particles/weapons/railgun/railgun_buckshot_projectile",
	
	shadowCaster	= false,
    impact_type = "railgun",

	--hitbox_min 		= Vec3( -1.5, -1.5, -1 ),
	--hitbox_max		= Vec3( 1.5, 1.5, 1 ),
}

Def.Projectile_SniperRailgun =
{
	inherit			= "Projectile_Nail_Default",

	hit_effect		= "particles/weapons/railgun/hit",
	effect = "particles/weapons/railgun/railgun_sniper_projectile",
	
	shadowCaster	= false,
    impact_type = "railgun",

}

Def.Projectile_HeavyRailgun =
{
	inherit			= "Projectile_Nail_Default",

	hit_effect		= "particles/weapons/railgun/hit",
	--hit_ship_effect 		= "particles/weapons/railgun/hit_ship",
	--hit_shield_effect 		= "particles/weapons/railgun/hit_ship",
	--hit_crit_ship_effect 	= "particles/weapons/railgun/hit_crit",
	--hit_crit_shield_effect 	= "particles/weapons/railgun/hit_crit_shield",
	effect = "particles/weapons/railgun/railgun_heavy_projectile",
	
	shadowCaster	= false,
    impact_type = "railgun",
	
}

Def.Projectile_RailgunDestr =
{
	inherit			= "Projectile_Nail_Default",

	hit_effect		= "particles/weapons/railgun/hit",
	effect			= "particles/weapons/railgun/railgun_destr_projectile",
	
	shadowCaster	= false,
    impact_type = "railgun",
	
}

Def.Projectile_Blaster =
{
	--inherit			= "Projectile_Plasma_Default",
	class			= "Projectile",
	in_editor		= false,
	mass				= 0.05,
	hitbox_min 			= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max			= Vec3( 0.1, 0.1, 0.1 ),
	
	hitbox_vs_ships_min	= Vec3( -0.2, -0.2, -0.4 ),
	hitbox_vs_ships_max	= Vec3( 0.2, 0.2, 0.4 ),
	apply_shake		= true,
	
	hit_effect		= "particles/weapons/plasma/hit",
	model			= "models/weapons/blaster_bullet",
	--effect = "particles/weapons/plasma/blaster_projectile",
	
	shadowCaster	= false,
    impact_type = "plasma",

}

Def.Projectile_Autocannon =
{
	--inherit			= "Projectile_Plasma_Default",
	class			= "Projectile",
	in_editor		= false,
	mass				= 0.05,
	hitbox_min 			= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max			= Vec3( 0.1, 0.1, 0.1 ),
	
	hitbox_vs_ships_min	= Vec3( -0.2, -0.2, -0.4 ),
	hitbox_vs_ships_max	= Vec3( 0.2, 0.2, 0.4 ),
	apply_shake		= true,
	
	hit_effect		= "particles/weapons/railgun/hit",
	model			= "models/weapons/autocannon_bullet",
	--effect			= "particles/weapons/railgun/projectile",
	
	shadowCaster	= false,
    impact_type = "plasma",

}

--
Def.Projectile_ExplodingProjectile =
{
	class			= "ExplodingProjectile",
	in_editor		= false,

	physics			= { solid_type = solid.sphere, kinematic = true, material = "Metal" },

	hitbox_min 		= Vec3( -0.5, -0.5, -0.5 ),
	hitbox_max		= Vec3( 0.5, 0.5, 0.5 ),
	
	--impact_type 	= "plasma",
	impact_type 	= "singularity",

	hit_effect		= "particles/weapons/plasma/hit",
	effect 			= "particles/weapons/other/chargable_gun_projectile_slow",
--	work_sound 	    = "sound/weapons/singularity/sg_fly",
	--effect 			= "particles/gadget/barier",
	--effect 			= "particles/gadget/plasma_web",

	explosion 		= "Blastwave_ChargableGun_Base",
}

--
Def.Projectile_ExplodingProjectile_Fast =
{
	inherit			= "Projectile_ExplodingProjectile",
	effect 			= "particles/weapons/other/chargable_gun_projectile_fast",
	shot_once_sound = "sound/weapons/chargegun/cg_shot_fast",
	singularity_hit_sound = "sound/weapons/chargegun/cg_shot_slow",
	--uiName 			= "Projectile_ExplodingProjectile_Fast",
	impact_type 		= "plasma",
}

--
Def.Projectile_ExplodingProjectile_Slow =
{
	inherit			= "Projectile_ExplodingProjectile",
	hitbox_min 		= Vec3( -4,		-4,		-4 ),
	hitbox_max		= Vec3( 4, 		4, 		4 ),
	damage_radius	= 4,
	shot_once_sound = "sound/weapons/chargegun/cg_shot_slow",
	singularity_hit_sound = "sound/weapons/chargegun/cg_shot_slow",
	--uiName 			= "Projectile_ExplodingProjectile_Slow",
}

Def.Projectile_HeatingGun =
{
	inherit				= "Projectile_Plasma_Default",
	shadowCaster		= false,
	impact_type 		= "railgun",
	
	hit_effect				= "particles/weapons/alien/heatinggun_hit",
	effect 					= "particles/weapons/alien/heatinggun_projectile_v3",
}

Def.Projectile_SpyDroneRailgun =
{
	inherit				= "Projectile_BasicRailgun",
	hit_effect			= "particles/weapons/other/spy_hit",
	effect 				= "particles/weapons/other/spy_projectile",
}

Def.Projectile_ShieldHeal =
{
	inherit									= "Projectile_Plasma_Default",
	
	effect									= "particles/weapons/plasma/projectile_reflector",
	hit_effect								= "particles/weapons/plasma/hit",
	hit_shield_effect						= "particles/weapons/plasma/hit_shield_reflector",
	hit_ship_effect							= "particles/weapons/plasma/hit_ship_reflector",

	shadowCaster							= false,
	impact_type 							= "plasma",
}

Def.Projectile_BlastGun =
{
	class									= "Rocket",
	
	hitbox_min 								= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max								= Vec3( 0.1, 0.1, 0.1 ),
	
	explosion_blast_wave					= "Blastwave_BlastGun",
	effect 									= "particles/weapons/blaster/neutron_projectile",
	override_blast_wave_damage				= true,
	missile_defence_immune					= true,
	missile_detection_immune				= true,
	
	detonation_radius						= 14,

	flare_color								= "255 150 100 15",
	flare_size								= 0.0,
	flare_angle								= 180,
	flare_nebulosity						= 0.1,
	
	shadowCaster							= false,
	impact_type 							= "lasersniper",
}

Def.Blastwave_BlastGun  =
{
	class									= "BlastWave",
	in_editor								= false,

	blast_maxDistance						= 20,
	apply_damage							= true,
	apply_shake 							= true,
	self_damage_coef						= 0,
	effect									= "particles/explosions/devostrator_explosion",
	light_color 							= "255 126 128 100",
	light_radius 							= 18,
	light_time 								= 0.2,
	sound 									= "sound/explosion/tbg_expl",
}

Def.Projectile_Hammer =
{
	inherit									= "Projectile_Nail_Default",
	hit_effect								= "particles/empty",
	effect									= "particles/weapons/other/hammer_projectile",
	shadowCaster							= false,
    impact_type 							= "railgun",
	death_entity							= "Mine_Hammer",
	--owned_death_entity_max				= 5,
}

Def.Blastwave_Hammer =
{
	class									= "BlastWave",
	in_editor								= false,

	blast_maxDistance						= 30,
	blast_minDistance						= 2,
	apply_damage							= true,
	apply_shake 							= true,
	
	damage_thermal							= 1200,

	effect 									= "particles/explosions/expl_5_termo",
	light_color 							= "255 182 128 100",
	light_radius 							= 20,
	light_time 								= 0.5,
	sound 									= "sound/explosion/small_rocket_expl",
}

Def.Mine_Hammer =
{
	inherit									= "Weapon_BaseRocket",
	
	model									= "models/misc/invisible_model",
	
	explosion_blast_wave 					= "Blastwave_Hammer",
	--override_blast_wave_damage			= true,
	
	missile_defence_immune 					= true, -- ПРО не трогает мины
	
	speed 									= 0,
	
	effect 									= "particles/weapons/other/hammer_workflare",
	work_sound 								= "",
	
	detonation_radius						= 30,
	detonation_timeout						= 0.2,
	
	flare_size								= 0.0,
	flare_occl_size							= 1,
	flare_aspect							= 1,
	flare_angle								= 180,
	flare_color 							= "255 150 100 0",
	flare_warp								= 0.1,
	
	time_to_live							= 4,
}

Def.Projectile_ThorHammer =
{
	inherit 								= "Weapon_BaseRocket",
	model									= "",
	
	override_blast_wave_damage 				= true,
	missile_defence_immune 					= true,	
	missile_detection_immune 				= true,
	is_guided								= true,
	angular_velocity						= 600,
	
	explosion_blast_wave_on_hit				= "Blastwave_ThorHammer",
	explosion_blast_wave 					= "Blastwave_ThorHammer_Dissapear",

	flare_color								= "156 150 180 0",
	flare_size								= 0.0,
	flare_angle								= 180,
	flare_nebulosity						= 0.1,

	work_sound								= "sound/weapons/ThorHammer/th_fly",
	effect 									= "particles/weapons/special/hammer_projectile",
	impact_type 							= "rocket",
	
	detonation_radius						= 4.5,
	hitbox_min 								= Vec3( -2.5, -2.5, -2.5 ),
	hitbox_max								= Vec3( 2.5, 2.5, 2.5 ),

	child_rockets =
	{
		rocket								= "Projectile_ThorHammer_Back",
		echo_radius							= 0,
		echo_rocket_if_reflected			= false,
	},
}

Def.Projectile_ThorHammer_Back =
{
	inherit									= "Weapon_BaseRocket",
	model									= "",
	
	missile_defence_immune					= true,	
	missile_detection_immune 				= true,
	is_guided								= true,
	angular_velocity						= 600,
	
	explosion_blast_wave 					= "Blastwave_ThorHammer_Dissapear",
	override_blast_wave_damage				= false,
	
	flare_color								= "156 150 180 0",
	flare_size								= 0.0,
	flare_angle								= 180,
	flare_nebulosity						= 0.1,

	work_sound								= "sound/weapons/smartRocket/smr_fly",
	effect 									= "particles/weapons/special/hammer_projectile",
	impact_type 							= "rocket",
	
	--detonation_radius						= 3.5,
	detonate_on_distance					= 5.5,
	--detonation_timeout						= 1,
	--hitbox_min 							= Vec3( -2, -2, -0.1 ),
	--hitbox_max							= Vec3( 2, 2, 0.1 ),
	max_range								= 1000,  
	speed 									= 250,
	
	spell									= "Spell_ThorHammer",
	spell_on_owner_hit_only					= true,
	
	disable_concussion_sound				= true,
}

Def.Blastwave_ThorHammer  =
{
	class									= "BlastWave",
	in_editor								= false,

	blast_minDistance						= 3,
	blast_maxDistance						= 8,
	apply_damage							= true,
	apply_shake 							= true,

	effect 									= "particles/weapons/special/hammer_explosion",
	light_color 							= "28 150 180 100",
	light_radius 							= 18,
	light_time 								= 1.2,
	sound 									= "sound/explosion/SmartRocket_expl",
}

Def.Blastwave_ThorHammer_Dissapear  =
{
	class									= "BlastWave",
	in_editor								= false,

	blast_maxDistance						= 5,
	apply_damage							= false,
	apply_shake 							= false,

	--effect 									= "particles/weapons/smart_explosion",
	light_color 							= "28 150 180 100",
	light_radius 							= 18,
	light_time 								= 1.2,
	sound 									= "sound/hit/LoudEcho_Back",
}

Def.Projectile_SmartShotgun =
{
	inherit			= "Projectile_BuckshotRailgun",
	hit_effect		= "particles/weapons/railgun/hit_ship",
	effect          = "particles/weapons/railgun/railgun_axe_projectile",
}