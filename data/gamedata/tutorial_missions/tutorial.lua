TutorialMissions = {}


--
sys.execscript( 'gamedata/tutorial_missions/tutorial_basic_controls.lua' )
sys.execscript( 'gamedata/tutorial_missions/tutorial_basic_battle_system.lua' )

-- корабль для обучения управлению.
Def.Ship_Tutorial_Race1_M_T3_Faction2 =
{
	inherit			  = "Ship_Race1_M_T3_Faction2",
	storeItemId 	  = 0,
	hull_health       = 5000,
	shield_max		  = 5000,
	energy_max		  = 5000,
	energy_regen	  = 100,
	contact_damage_cf = 0,
	max_speed		  = 30,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "Module_CloakingDevice_Tutoriial",
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] 	 = "Weapon_Laser_Heavy_T4_Tutorial",
	},
}

Def.Module_CloakingDevice_Tutoriial =
{
	inherit	 = "Module_CloakingDevice",
	class	 = "SpaceShipModule",
}

Def.Weapon_Plasmagun_Autofire_T4_Tutorial =
{
	inherit	 	= "Weapon_Plasmagun_Autofire_T4_Epic",
	damage_emp	= 90,
	storeItemId = 0,
	drop_weight = 0,
	heat_add	= 0.3,
	dispersion  = 0.45,
	dispersion_max = 1.2,
}

Def.Weapon_Laser_Heavy_T4_Tutorial =
{
	inherit	 	= "Weapon_Laser_Heavy_T4_Epic",
	--damage_emp	= 90,
	storeItemId = 0,
	drop_weight = 0,
	heat_add	= 0,
	dispersion  = 0,
	dispersion_max = 0,
}

-- корабль игрока для обучения стрельбе.
Def.Tutorial_Ship =
{
	--inherit			  = "Ship_Race3_M_T5_Wolfhound",
	inherit			  = "Ship_Race3_M_T5_Craft",
	storeItemId 	  = 0,
	hull_health       = 5000,
	shield_max		  = 5000,
	energy_max		  = 5000,
	energy_regen	  = 100, 
	contact_damage_cf = 0,
	max_speed		  = 25,
	default_rocket_munition = "SpaceMissile_Standart_T4_Tutorial", 
	
	spawn_warp_effect_end = "particles/weapons/alien/reaver_gun_muzzle",
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 		 = "Module_RocketWolfhound",
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] 	 = "Weapon_Railgun_Basic_T4_Tutorial2",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]			 = "Module_RepairDrones_m_T5_Mk1",
	--	[ ai.SpaceShipModuleSlot.ACTIVE_02 ]			 = "Module_ShieldRestoreMedium_Tutorial",
	}, 
	
	default_custom_elements =
	 {
		[ai.VesselCustomSlot.MATERIAL_0] = "Default_Race3_m_wolfhound_b3",
		[ai.VesselCustomSlot.MATERIAL_1] = "Matt_Yellow02",
		[ai.VesselCustomSlot.MATERIAL_2] = "Matt_Yellow02",
		[ai.VesselCustomSlot.ARMOR_0] = "Carbon",
	},
}

Def.Weapon_Railgun_Basic_T4_Tutorial2 =
{
	inherit	 	= "Weapon_Railgun_Basic_T5_Mk1",
	damage_kinetic	= 300,
	storeItemId = 0,
	drop_weight = 0,
	heat_add	= 0.5,
	dispersion  = 0.45,
	dispersion_max = 2.0,
	optimal_range = 210,
	max_range = 245,
	fire_rate	= 150,
	cycle_barrels = true,
}

Def.Module_Tutorial_CloakingDevice =
{
	inherit				= "Module_CloakingDevice",
	cooldown			= 3.0,
	spell				= "Cloaking_Tutorial",
}

Def.Module_ShieldRestoreMedium_Tutorial =
{
	
	inherit		= "Module_ShieldRestoreMedium_T4_Epic",
	cooldown	= 10,
	energy_cost = 20,
	spell		= "ShieldRestoreMedium_Tutorial",
	storeItemId = 0,
	drop_weight = 0,
	
}

Def.SpaceMissile_Standart_T4_Tutorial =
{
	inherit 			  = "SpaceMissile_Standart_T4_Mk3",
	explosion_blast_wave  = "BlastWave_SM_Standart_T4_Tutorial",
	storeItemId 		  = 0,
	drop_weight			  = 0,
	empty_holder_cooldown = 5,
}

Def.BlastWave_SM_Standart_T4_Tutorial = 
{
	inherit = "BlastWave_SM_Standart_T4_Mk3",
	damage_thermal = 6000,
}


-- обломки для опенворлда, заправка
Def.Tutorial_CargoWreck =
{
	class		= 'ScBaseEntity',
	hudType			= "default",
	hud_visibility_type = "minor",
	damageable		= false,
	in_editor	=	true,
	model		=	"models/objects/ships_huge/freighter_imper/freighter_imper_wreck",
	physics		= { solid_type = solid.compound_model, static = true, material = "ShipMetalMk1" },

	children =
	{
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_1"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_2"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_3"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_4"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_5"	},
	},
	uiName			= "CargoShipWreck",

}

Def.Tutorial_WreckDebris1 =
{
	class		= 'ScBaseEntity',
	in_editor	=	true,
	hudType			= "default",
	hud_visibility_type = "minor",
	damageable		= false,
	model		=	"models/objects/wrecks/debris_01",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	uiName			= "CargoShipWreck",
}

Def.Weapon_ReaverGun_Tutorial =
{
	inherit				= "Weapon_ReaverGun_PvE_T4",
	projectile			= "Projectile_ReaverGun_AntiHuge",
	fire_rate			= 2,	---45, #61630 борьба с лишними пульками
	damage_emp		 	= 100,
	projectile_speed 	= 300, ---200, --475.0,
	crit_chance 		= 0.2,
}

Def.Weapon_AlienGun_Tutorial =
{
	inherit				= "Weapon_AlienGun_T4",
	fire_rate			= 10,
	damage_emp		 	= 250,
	uiName 				= "AlienGun",
	projectile			= "Projectile_AlienGun_Tutorial",
}

Def.Projectile_AlienGun_Tutorial  =
{
	inherit			= "Projectile_AlienGun",
	flare_size			= 0.2,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	angular_velocity= 10,
}

Def.Weapon_AlienGun2_Tutorial =
{
	inherit				= "Weapon_AlienGun_T4",
	cycle_barrels 		= true,
	projectile			= "Projectile_AlienGun_Tutorial",
	fire_rate			= 10,
	damage_emp			= 350,		--- 4000
	projectile_speed	= 90,	
}

-- дроны охотников в рейде
Def.GuidedDrone_Hunter_Tutorial =
{
	inherit					= "GuidedDrone_Raid_Pve",
	in_editor				= false,

	damageable				= true,
	health					= 1000,

	fire_rate				= 10,
	dispersion				= 1,
	optimal_range			= 150,
	max_range				= 250,
	projectile_speed		= 50,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 100,
	damage_thermal			= 0,
	uiName 					= "DroidAlien_name",
}

Def.Bonus_Tutorial_HealHull = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	damageable		= false,
	uiName			= "Bonus_HealHull_name",
	
	model			= "models/objects/gameplay/bonuses/armor_restore",

	vision_radius_coef = 0.5,
	
	
	-- spell_approach	= "Bonus_HealHull",
	-- spell_approach_trigger_radius = 20.0,
	-- spell_approach_respawn_timer = 3.5 * 60,

	death_effect = "particles/ships/looted",
	death_sound = "sound/game/bonus_take",
	
	children = 
	{
		{ effect = "particles/objects/bonuses/armor_restore", joint = "joint4" },
		{ effect = "particles/objects/bonuses/armor_restore_exp", joint = "root4" },
	}
}