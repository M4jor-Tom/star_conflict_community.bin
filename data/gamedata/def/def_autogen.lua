-- ----------------------------------------------------------------------------
--
-- Created: 12-Sep-2019
-- Copyright © 2019, Targem LLC. All rights reserved.
-- 
-- Autogen defs
--
-- ----------------------------------------------------------------------------

--######################## BASE DEFS ########################--

Def.Module_Autogen_Default =
{
	class 							= "SpaceShipModule",
	item_lvl						= 15,
	cant_be_bought 					= true,
	module_type						= ai.ModuleType.AUTOGEN,
	item_subtype					= ItemSubtype.AutogenDefault,
	default_icon					= "autogen_default",
	uiName 							= "Module_Autogen_Default",
	shopCategory					= "AUTOGEN",
	isAutogenBase					= true,
	
	spell_on_weapon_hit_timeout		= 1,
	
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	price							= 0,
	tier							= 1,
	rank_min						= 1,
	rank_max						= 17,
}

Def.AG_Base_NoHack =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	spell_on_weapon_hit_if_hacked	= false,
	spell_on_secondary_hit_if_hacked= false,
	spell_on_weapon_crit_if_hacked	= false,
}

Def.AG_Base_Low_Health =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	cooldown						= 80,
	show_cooldown_status			= true,
	
	max_health_spell_cancel			= false,
	max_health_percent				= 0.35,
}

Def.AG_Base_Mid_Health =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	cooldown						= 80,
	show_cooldown_status			= true,
	
	max_health_spell_cancel			= false,
	max_health_percent				= 0.6,
}

Def.AG_Base_OnEnemyDeath = 
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,

	spell_on_death_trigger_target =
	{
		class						= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area						= ai.SpellTargetArea.AROUND,
		relationship				= ai.SpellTargetRelationship.ENEMY,
		vitality					= ai.SpellTargetVitality.DEAD,
	},
	spell_on_death_trigger_range	= 200,
}

Def.AG_Base_OnShotWithCooldown = 
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,

	spell_on_weapon_hit_timeout		= 0.5,
}

Def.AG_Base_OnShotWithCooldown_NoHack = 
{
	inherit							= "AG_Base_NoHack",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,

	spell_on_weapon_hit_timeout		= 0.5,
}


Def.AG_Base_ReplaceDmgType_Emp = 
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,

	replace_damage_type				= ai.DamageType.EMP,
}

Def.AG_Base_ReplaceDmgType_Thermal = 
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,

	replace_damage_type				= ai.DamageType.THERMAL,
}

Def.AG_Base_ReplaceDmgType_Kinetic = 
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,

	replace_damage_type				= ai.DamageType.KINETIC,
}

Def.AG_Base_Disabled_Shield =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	cooldown 						= 50,
	show_cooldown_status 			= true,
	
	--shield_disabled_spell 		= "Spell_Unlock",
}

Def.AG_Base_Percent_Shield =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	cooldown 						= 2,
	show_cooldown_status 			= false,
	
	max_shield_percent				= 0.4,
	max_shield_activation_time		= 0.5,
	--spell_on_max_shield_plus		= "GreenRegenShield",
	--spell_on_max_shield_minus		= "GreenRegenShield",
	
	--max_shield_spell_cancel		= false,
}

Def.AG_Base_Percent_Speed =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	cooldown 						= 2,
	show_cooldown_status 			= false,
	
	max_speed_percent				= 0.9,
	max_speed_activation_time		= 0.5,
	--spell_on_max_speed_plus		= "Lynx2Shield",
	--spell_on_max_speed_minus		= "Lynx2Shield",
}

Def.AG_Base_Percent_Speed_Slowdown =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	cooldown 						= 2,
	show_cooldown_status 			= false,
	
	max_speed_percent				= 0.9,
	max_speed_activation_time		= 0.5,
	max_speed_deactivation_time		= 1,
	--spell_on_max_speed_plus		= "Lynx2Shield",
	--spell_on_max_speed_minus		= "Lynx2Shield",
}

Def.AG_Base_Percent_Energy =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	--cooldown 						= 2,
	show_cooldown_status 			= true,
	
	max_energy_percent				= 0.4,
	--spell_on_max_energy_plus		= "GreenRegenShield",
	--spell_on_max_energy_minus		= "GreenRegenShield",
	--max_energy_spell_cancel		= false --Не снимать, если энергия выше пороговой
}

Def.AG_Base_OnDamage_Shield =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	--cooldown 						= 30,
	show_cooldown_status 			= true,
	
	charge_damage					= 4000,
	charge_mask						= ai.ChargeType.DAMAGE_SHIP_SHIELD,
	--charge_spell_on_damage		= "GreenRegenShield",
	charge_cooldown_enabled			= true,
}

Def.AG_Base_Collision_Shield =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	cooldown 						= 2,
	show_cooldown_status 			= false,
	
	max_shield_percent				= 0.4,
	max_shield_activation_time		= 0.5,
	spell_on_max_shield_plus		= "Spell_AG_ShieldCollisionImmune",
}

Def.AG_Base_Swap_Shield =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	cooldown 						= 50,
	show_cooldown_status 			= true,
	
	shield_disabled_spell 			= "Spell_AG_SwapShield",
}

--######################## BALANCED ########################--

Def.AG_Base_Balanced =
{
	inherit							= "Module_Autogen_Default",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
}

Def.AG_Base_Balanced_Dispersion =
{
	inherit							= "AG_Base_Balanced",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	obligatory_mod					= "dispersion_mul",
}

Def.AG_Base_Balanced_CritChance =
{
	inherit							= "AG_Base_Balanced",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	obligatory_mod					= "crit_chance_add",
}

Def.AG_Base_Balanced_CritDamage =
{
	inherit							= "AG_Base_Balanced",
	ods_export						= true, -- чтобы storeItemId вписало уникальный
	storeItemId						= 1,
	
	obligatory_mod					= "crit_damage_add",
}


--######################## WEAPONS ########################--

Def.AG_Weapon_RandomRockets =
{
	inherit						= "Module_Autogen_Default",
	ods_export					= true, -- чтобы storeItemId вписало уникальный
	storeItemId					= 1,

	class 						= "AutoGun",
	
	cycle_barrels 				= true,
	
	fire_rate					= 30,
	dispersion					= 0.33, 
	
	optimal_range				= 100,
	max_range					= 200,
	projectile_speed 			= 300,
	
	damage_thermal				= 100,
	
	--crit_chance					= 0.0,
	
	--heat_add 					= 0,
	
	no_friendly_fire			= true,
	--guide_rocket_to_point		= true,
	guide_to_hit_target			= true,
	
	shot_once_sound				= "sound/weapons/FlameThrower/ft_fire",
	
	projectile					= "AG_Projectile_RandomRockets",
	shot_effect					= "particles/weapons/devostator_muzzle",
	muzzleflash_color = { kinetic = "255 154 82 64", emp = "255 154 82 64", thermal = "255 154 82 64", },
	muzzleflash_radius 			= 20,
}

Def.AG_Projectile_RandomRockets =
{
	inherit						= "Weapon_BaseRocket",
	model 						= "",
	explosion_blast_wave		= "AG_Blastwave_RandomRockets",
	override_blast_wave_damage	= true,
	
	detonation_radius			= 4,

	flare_color					= "255 255 191 150",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,
	effect						= "particles/weapons/other/magnetic_projectile",
	
	work_sound					= "sound/weapons/smartRocket/smr_fly",
	
	missile_defence_immune 		= true,
	missile_detection_immune	= true,
	disable_concussion_sound	= true,
	
	is_guided 					= true,
	angular_velocity			= 35,
	random_trajectory 			= true,
	
	impact_type 				= "rocket",
	inherit_speed				= true,
}

Def.AG_Blastwave_RandomRockets =
{
	class						= "BlastWave",
	in_editor					= false,
	
	blast_maxDistance			= 5,
	apply_damage				= true,

	effect						= "particles/explosions/devostrator_explosion",
	light_color 				= "255 126 128 100",
	light_radius 				= 18,
	light_time 					= 0.2,
	sound 						= "sound/explosion/SmartRocket_expl",
}

Def.AG_Weapon_ChargedRail =
{
	inherit						= "Module_Autogen_Default",
	ods_export					= true, -- чтобы storeItemId вписало уникальный
	storeItemId					= 1,

	class 						= "AutoGun",
	
	fire_rate					= 60,
	dispersion					= 0.25, 
	
	optimal_range				= 200,
	max_range					= 400,
	projectile_speed 			= 700,
	
	damage_kinetic				= 200,
	
	crit_chance					= 0.0,
	
	heat_add 					= 0,
	
	charge_min					= 1,
	charge_max					= 3,
	damage_charge_deminishing	= 0.8,
	
	shot_once_sound				= "sound/weapons/railgun/sniper",
	
	projectile					= "AG_Projectile_ChargedRail",
	shot_effect					= "particles/weapons/railgun/muzzle_axe",
	muzzleflash_color 			= { kinetic = "230 164 120 128", emp = "230 164 120 128", thermal = "230 164 120 128", },
	muzzleflash_radius 			= 20,
}

Def.AG_Projectile_ChargedRail =
{
	inherit						= "Projectile_Nail_Default",

	hit_effect					= "particles/weapons/railgun/hit",
	effect						= "particles/weapons/railgun/railgun_sniper_projectile",
	
	shadowCaster				= false,
    impact_type					= "railgun",
}

Def.AG_Weapon_ChargedThunder =  
{
	inherit						= "Module_Autogen_Default",
	ods_export					= true, -- чтобы storeItemId вписало уникальный
	storeItemId					= 1,
	
	class 						= "ChargableGun",

	fire_rate 					= 60,
	dispersion					= 0,
	
	optimal_range				= 450,
	max_range					= 450 * 1.3,
	
	projectile_speed 			= 80,
	
	damage_thermal				= 820,
	
	--shot_loop_sound 			= "sound/weapons/chargeblast/cb_charge",

	charge_levels = {
		{
			time				= 3,
			projectile			= "AG_Projectile_ChargedThunder",
			speed_mul			= 0,
			damage_mul			= 0,
		},
		{
			time				= 8,
			projectile			= "AG_Projectile_ChargedThunder",
			speed_mul			= 3,
			damage_mul			= 2,
		},
		{
			time				= 13,
			projectile			= "AG_Projectile_ChargedThunder",
			speed_mul			= 4,
			damage_mul			= 4,
		},
		{
			time				= 18,
			projectile			= "AG_Projectile_ChargedThunder",
			speed_mul			= 5,
			damage_mul			= 6,
		},
	},
	shot_effect 				= "particles/weapons/zonecleaner_muzzle",
}

Def.AG_Projectile_ChargedThunder =
{
	inherit						= "Projectile_Nail_Default",
	
	hit_effect					= "particles/weapons/zonecleaner_explosion",
	effect 						= "particles/weapons/sniper/projectile",
	shadowCaster				= false,
	impact_type					= "disintegrator",
	work_sound 					= "sound/gadgets/disintegrator/dis_fly",

	shot_once_sound				= "sound/gadgets/disintegrator/dis_fire_autogen",
}

Def.AG_Weapon_RocketWall = {	
	inherit						= "Module_Autogen_Default",
	ods_export					= true, -- чтобы storeItemId вписало уникальный
	storeItemId					= 1,
	
	class 						= "AutoGun",

	cycle_barrels				= true,
	
	guide_rocket_to_point		= true,
	
	--heat_max 					= 10,
	--heat_add 					= 10,
	--heat_sub 					= 1,
	
	fire_rate 					= 1,
	
	optimal_range				= 150,
	max_range					= 200,
	
	projectile 					= "AG_Projectile_RocketWall",
	shot_once_sound 			= "sound/weapons/smartRocket/smr",
	projectile_speed			= 75,	
	
	damage_thermal				= 500,
	no_friendly_fire 			= true,
	
	shot_effect 				= "particles/weapons/devostator_muzzle",
	muzzleflash_color 			= { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 			= 8,
}

Def.AG_Projectile_RocketWall =
{
	inherit 					= "Weapon_BaseRocket",
	model						= "models/weapons/bs_torpedo_mid",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,

	is_guided					= true,
	angular_velocity			= 0,

	detonation_timeout			= 0.2,
	detonation_radius			= 1,

	detonate_on_distance		= 100,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.
	child_rockets =
	{
		rocket					= "AG_Projectile_RocketWall1",

		sphere_radius			= 1,
		scheme =
		{
			circle0				= { amount = 4, angle = 15, },
		},
	},
	
	explosion_blast_wave 		= "AG_Blastwave_RocketWall",

	flare_size					= 0.0,
	flare_color					= "255 170 191 0",

	work_sound					= "sound/weapons/smartRocket/smr_fly",
	
	effect 						= "particles/weapons/missile/rocket_trail_mid",
	impact_type 				= "rocket",
}

Def.AG_Projectile_RocketWall1 =
{
	inherit 					= "Weapon_BaseRocket",
	model						= "models/weapons/bs_torpedo_mid",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	
	is_guided					= true,
	angular_velocity			= 0,

	detonation_timeout			= 0.1,
	detonation_radius			= 2,
	max_range					= 50,
	
	speed						= 50,

	detonate_on_distance		= 60,
	child_rockets =
	{
		rocket					= "AG_Projectile_RocketWall2",

		sphere_radius			= 1,
		scheme =
		{
			circle0				= { amount = 3, angle = 25, },
		},
	},
	
	explosion_blast_wave 		= "AG_Blastwave_RocketWall",

	flare_size					= 0.0,
	flare_color					= "255 170 191 0",

	work_sound					= "sound/weapons/smartRocket/smr_fly",
	
	effect 						= "particles/weapons/missile/rocket_trail_small",
	impact_type 				= "rocket",
}

Def.AG_Projectile_RocketWall2 =
{
	inherit 					= "Weapon_BaseRocket",
	model						= "models/weapons/bs_torpedo_mid",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	
	is_guided					= true,
	angular_velocity			= 0,

	detonation_timeout			= 0.1,
	detonation_radius			= 2,
	max_range					= 50,
	
	speed						= 40,

	detonate_on_distance		= 60,
	
	explosion_blast_wave 		= "AG_Blastwave_RocketWall1",

	flare_size					= 0.0,
	flare_color					= "255 170 191 0",

	work_sound					= "sound/weapons/smartRocket/smr_fly",
	
	effect 						= "particles/weapons/missile/rocket_trail_small",
	impact_type 				= "rocket",
}

Def.AG_Blastwave_RocketWall =
{
	class						= "BlastWave",
	in_editor					= false,

	damage_thermal				= 10,
	blast_maxDistance			= 5,
	apply_damage				= true,
	apply_shake 				= false,

	effect 						= "particles/explosions/artillery_big_fire",
	light_color 				= "255 226 178 100",
	light_radius 				= 18,
	light_time 					= 0.2,
	sound 						= "sound/explosion/SmartRocket_expl",
}
Def.AG_Blastwave_RocketWall1 =
{
	inherit						= "Blastwave_Artillery_Base",
	blast_maxDistance			= 30,
	sound 						= "sound/hit/xo_common",
	light_radius 				= 20,
	light_time 					= 0.8,
	effect 						= "particles/explosions/explosion_big4",
	light_color 				= "255 182 128 100",
}

Def.AG_Weapon_LightningGun = 
{
	inherit						= "Module_Autogen_Default",
	ods_export					= true, -- чтобы storeItemId вписало уникальный
	storeItemId					= 1,

	class 						= "LaserGunRay",
	
	damage_emp					= 200,
	
	fire_rate 					= 60,
	
	impulse_time 				= 0.2,
	
	optimal_range 				= 50,
	max_range 					= 300,
	
	link_range 					= 30,
	chaing_damage				= { 1, 0.75, 0.5, 0.25 },
	chain_target =
	{ 
		class 					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 			= ai.SpellTargetRelationship.ENEMY,
	},
	shield_subtypes 			= { ItemSubtype.SectorShield, ItemSubtype.Screen, },
	
	shot_energy_cost			= 50,
	
	muzzleflash_radius 			= 20,
	impact_type 				= "plasma",
	damage_color		 		= { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "228 109 69 255", },
	muzzleflash_color 			= { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 140 101 255", },
	beam_fx 					= "particles/weapons/alien/forklaser_beam",
	beam_start_fx				= "particles/weapons/alien/forklaser_beam",
	fire_fx						= "",
	hit_fx 						= "particles/weapons/alien/forklaser_hit_2",
	
	shot_once_sound 			= "sound/weapons/laser/ForkLaser_fire",
}

Def.AG_Weapon_ThunderGun =
{
	inherit						= "Module_Autogen_Default",
	ods_export					= true, -- чтобы storeItemId вписало уникальный
	storeItemId					= 1,

	class 						= "ForkGun",

	damage_emp					= 200,

	dispersion 					= 5,

	fire_rate 					= 30,
	
	optimal_range 				= 75,
	max_range 					= 300,
	
	target_energy_cost 			= 100,
	shot_energy_cost			= 30,
	
	focus_distance				= 6,
	
	damage_color		 		= { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "228 109 69 255", },
	muzzleflash_color 			= { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 140 101 255", },
	muzzleflash_radius 			= 20,
	shot_beam_fx 	        	= "particles/weapons/alien/forklaser_beam",
	hit_fx 						= "",

	shot_once_sound 			= "sound/weapons/laser/ForkLaser_fire",
	
	impact_type 				= "plasma",
}

Def.AG_Weapon_ChainBuckshot =
{
	inherit						= "Module_Autogen_Default",
	ods_export					= true, -- чтобы storeItemId вписало уникальный
	storeItemId					= 1,

	class 						= "AutoGun",
	
	is_shotgun					= true,
	
	fire_rate					= 60,

	cycle_barrels 				= true,

	dispersion					= 10,	
	
	optimal_range				= 100,
	max_range					= 200,
	
	projectile_speed			= 400,
	
	damage_kinetic				= 200,
	
	heat_max					= 10,
	heat_add					= 8,
	heat_sub					= 8,
	
	projectile					= "AG_Projectile_ChainBuckshot",
	shot_effect 				= "particles/weapons/alien/crystal_muzzle",
	muzzleflash_color			= { kinetic = "32 128 64 100" },
	muzzleflash_radius 			= 4,
	shot_once_sound 			= "sound/weapons/CrystalSparks/cs_shot",
}

Def.AG_Projectile_ChainBuckshot =
{
	class						= "ChainLightningProjectile",
	link_range 					= 40,
	chaing_damage				= { 1, 0.75, 0.5 },
	chain_target =
	{ 
		class 					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	shield_subtypes 			= { ItemSubtype.SectorShield, ItemSubtype.Screen, },
	
	effect 						= "particles/weapons/alien/crystal_projectile", --particles/weapons/nanobots_trail
	beam_fx 					= "particles/weapons/alien/crystal_beam",
	chain_hit_fx 				= "particles/weapons/alien/crystal_beam_hit",

	flare_color					= "255 150 100 15",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	impact_type 				= "CrystallSparks",
	--reflection_immune			= true,
}

--######################## ADDITIONAL DEFS ########################--

Def.AG_GravityBomb_BlastWave =
{
	class						= "BlastWave",
	apply_damage				= true,
	apply_torque				= false,
	
	no_friendly_fire			= true,
	self_damage_coef			= 0,
	
	blast_maxDistance			= 40,
	blast_minDistance			= 10,

	--effect 						= "particles/weapons/nuke/explosion",
	effect 						= "particles/explosions/explosion_huge_emp",
	sound						= "sound/explosion/gravyBomb_expl",

	intensity					= 70,
	damage_emp					= 3000,

	light_color					= "255 225 154 255",
	light_radius				= 350,
	light_time					= 2.0,
}

Def.AG_Bonus_BlastWave =
{
	class						= "BlastWave",
	apply_damage				= false,
	apply_shake					= false,
	blast_maxDistance			= 5,
	blast_minDistance			= 5,
	effect 						= "particles/ships/looted",
	--sound						= "sound/explosion/drone_expl",
	light_color 				= "100 100 100 100",
	light_radius 				= 30,
	light_time 					= 0.5,
}

Def.AG_Bonus_HealAll =
{
	inherit						= "Weapon_BaseRocket",
	detonation_radius			= 5,
	speed						= 100,
	is_guided					= true,
	use_pathfinder 				= true,
	angular_velocity			= 150,
	max_range					= 400,
	model						= "models/objects/gameplay/bonuses/combo_restore",
	explosion_blast_wave		= "AG_Bonus_BlastWave",
	
	flare_color					= "255 100 100 100",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,
	work_sound					= "",
	missile_defence_immune 		= true,
	missile_detection_immune	= true,
	
	disable_concussion_sound	= true,
	spell_sound_instead_of_blastwave_sound	= true,
	
	spell						= "Spell_AG_Bonus_HealAll",
	--[[
	children = 
	{
		{ effect = "particles/objects/bonuses/combo_restore_exp", joint = "root" },
		{ effect = "particles/objects/bonuses/combo_restore", joint = "joint1" },
	},
	]]
	effect						= "particles/objects/bonuses/combo_restore_exp",
}

Def.AG_Bonus_Damage =
{
	inherit						= "AG_Bonus_HealAll",

	model						= "models/objects/gameplay/bonuses/quad_damage",
	
	spell						= "Spell_AG_Bonus_Damage",
	--[[
	children = 
	{
		{ effect = "particles/objects/bonuses/quad_damage", joint = "joint1" },
		{ effect = "particles/objects/bonuses/quad_damage_exp", joint = "root1" },
	}
	]]
	effect = "particles/objects/bonuses/quad_damage_exp"
}

Def.AG_Blastwave_Thermal =
{
	class						= "BlastWave",
	in_editor					= false,
	
	blast_maxDistance			= 5,
	apply_damage				= true,
	apply_torque				= true,

	intensity					= 50,
	damage_thermal				= 100,

	effect						= "particles/explosions/devostrator_explosion",
	light_color 				= "255 126 128 100",
	light_radius 				= 18,
	light_time 					= 0.2,
	sound 						= "sound/explosion/FunnyDouble_expl",
}

Def.AG_Bonus_QuadDamage = 
{
	class 								= "ScBaseEntity",
	in_editor							= true,
	hudType								= "default",
	hud_visibility_type					= "minor",
	uiName								= "Bonus_QuadDamage_name",
	
	model								= "models/objects/gameplay/bonuses/quad_damage",
	
    max_detection_distance				= 500.0,
	vision_radius_coef					= 0.5,
	
	spell_approach						= "Bonus_QuadDamage",
	spell_approach_trigger_radius		= 20.0,
	spell_approach_respawn_timer		= 0,
	
	ttl									= 15,

	death_effect						= "particles/ships/looted",
	spell_approach_trigger_sound		= "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/quad_damage", joint = "joint1" },
		{ effect = "particles/objects/bonuses/quad_damage_exp", joint = "root1" },
	}
}

Def.AG_Bonus_SpeedUp = 
{
	class 								= "ScBaseEntity",
	in_editor							= false,
	hudType								= "default",
	hud_visibility_type 				= "minor",
	uiName								= "Bonus_SpeedUp_name",
	model								= "models/objects/gameplay/bonuses/speed_booster",

    max_detection_distance				= 500.0,
	vision_radius_coef					= 0.5,
	
	spell_approach						= "Bonus_SpeedUp",
	spell_approach_trigger_radius		= 20.0,
	spell_approach_respawn_timer		= 0,
	
	ttl									= 15,

	death_effect						= "particles/ships/looted",
	spell_approach_trigger_sound		= "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/speed_booster", joint = "joint3" },
		{ effect = "particles/objects/bonuses/speed_booster_exp", joint = "root3" },
	}
}

Def.AG_Bonus_HealHull = 
{
	class 								= "ScBaseEntity",
	in_editor							= false,
	hudType								= "default",
	hud_visibility_type 				= "minor",
	uiName								= "Bonus_HealHull_name",
	
	model								= "models/objects/gameplay/bonuses/armor_restore",

    max_detection_distance				= 500.0,
	vision_radius_coef					= 0.5,
	
	spell_approach						= "Bonus_HealHull",
	spell_approach_trigger_radius 		= 20.0,
	spell_approach_respawn_timer		= 0,
	
	ttl									= 15,

	death_effect						= "particles/ships/looted",
	spell_approach_trigger_sound		= "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/armor_restore", joint = "joint4" },
		{ effect = "particles/objects/bonuses/armor_restore_exp", joint = "root4" },
	}
}

Def.AG_Bonus_HealShield = 
{
	class 								= "ScBaseEntity",
	in_editor							= false,
	hudType								= "default",
	hud_visibility_type 				= "minor",
	uiName								= "Bonus_HealShield_name",
	
	model								= "models/objects/gameplay/bonuses/shield_restore",

    max_detection_distance				= 500.0,
	vision_radius_coef					= 0.5,
	
	spell_approach						= "Bonus_HealShield",
	spell_approach_trigger_radius 		= 20.0,
	spell_approach_respawn_timer		= 0,
	
	ttl									= 15,

	death_effect						= "particles/ships/looted",
	spell_approach_trigger_sound		= "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/shield_restore", joint = "joint4" },
		{ effect = "particles/objects/bonuses/shield_restore_exp", joint = "root4" },
	}
}

--######################## SHIELDS ########################--

Def.AG_Shield_Turtle = 
{
	class								= "AuraHolderEntity",
	in_editor							= false,
	
	hack_immune 						= true,
	
	--damageable						= true,
	--health							= 3000,
	
	model								= "models/shields/shield_pve_hard",
	
	physics								= { solid_type = solid.model, material = "GiantShield", mass = 100, static_collision = false },
	
	--death_effect						= "particles/gadget/uniquehardshield_start",
	--end_effect						= "particles/gadget/uniquehardshield_start",
	--death_sound						= "sound/explosion/drone_expl",
	
	start_sound  						= "sound/destroyer/SShield_activate",
	end_sound							= "sound/destroyer/SShield_off",
	death_sound							= "sound/destroyer/SShield_off",
	
	is_shield							= true,
	weapon_mode							= ai.ShieldWeaponMode.BLOCK_ENEMY,
	radar_vison							= ai.ShieldRadarVisionMode.PASS,
	--[[
	children =
	{
		{ effect = "particles/gadget/uniquehardshield_start" },
	},
	]]
	is_shield_with_ship_collision = true,
}

Def.AG_Slow_Shield = 
{
	class								= "ScBaseEntity",
	in_editor							= false,
	
	network_sync 						= true,
	
	hack_immune 						= true,
	
	damageable							= true,
	health								= 3000,
	
	start_sound  						= "sound/destroyer/SShield_activate",
	end_sound							= "sound/destroyer/SShield_off",
	death_sound							= "sound/destroyer/SShield_off",
	
	effect								= "particles/gadget/pshield_1",
	
	ui_color							= 0xFFFFCCFF,
}

Def.AG_Shield_BlastWave =
{
	class								= "BlastWave",
	apply_damage						= true,
	apply_torque						= false,
	
	no_friendly_fire					= true,
	self_damage_coef					= 0,
	
	blast_maxDistance					= 70,
	blast_minDistance					= 10,

	effect 								= "particles/explosions/explosion_huge_emp",
	sound								= "sound/explosion/gravyBomb_expl",

	intensity							= 70,
	damage_emp							= 3500,

	light_color							= "255 225 154 255",
	light_radius						= 350,
	light_time							= 2.0,
}

Def.AG_Second_Shield = 
{
	class								= "AuraHolderEntity",
	in_editor							= false,
	
	hack_immune 						= true,
	
	damageable							= true,
	health								= 20000,
	
	ttl									= 10,
	
	model								= "models/shields/shield_cover_sphere",
	
	physics								= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	
	start_sound  						= "sound/destroyer/SShield_activate",
	end_sound							= "sound/destroyer/SShield_off",
	death_sound							= "sound/destroyer/SShield_off",
	
	weapon_mode							= ai.ShieldWeaponMode.BLOCK_ENEMY,
	radar_vison							= ai.ShieldRadarVisionMode.PASS,
	
	is_shield							= true,
	smart_shield_radius					= 35,
	
	show_after 							= 0.2,
	children = 
	{
		{ effect						= "particles/gadget/cover_shield_holder", },
	}
}