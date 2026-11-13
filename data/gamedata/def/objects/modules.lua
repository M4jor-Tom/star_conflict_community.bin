--
Def.SpaceShipModule =
{
	class		= "SpaceShipModule",
	in_editor	= false,
}


Def.TestAuraHolder =
{
	class 		= "AuraHolderEntity",
	in_editor	= false,
	model 		= "models/misc/no_model",
	health 		= 100,
	damageable	= true,
	physics		=	{ solid_type = solid.box, static = true, hitbox = true, },
}


Def.Module_EmergencyBarrier =
{
	class 		= "SpaceShipModule",
	in_editor	= false,
	cooldown	= 30,
	emergency_barrier_spell = "EmergencyBarrier",
	activate_sound = "sound/gadgets/EmergencyBarrier",
}

Def.Module_IndestructibleShield =
{
	class 		= "SpaceShipModule",
	in_editor	= false,
	cooldown	= 30,
	shield_disabled_spell = "EmergencyBarrier",
	activate_sound = "sound/gadgets/EmergencyBarrier",
}

Def.Module_StaticShield =
{
	class 		= "ActiveModule",
	in_editor	= false,
	cooldown	= 1,

	activate_entity	= "StaticShield",
	activate_entity_ttl = 20,
	activate_entity_max = 3,
	activate_entity_health = 40000,
	--	attach_bone = "root",
	spawn_offset = Vec3( 0, 0, -32 ),
	spawn_dir_to_aim = true,
}

Def.StaticShield =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/shields/shield_stationary",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	children =
	{
		{ effect		= "particles/gadget/shield_stationary_start" },
	},
	death_sound		= "sound/explosion/drone_expl",
	death_effect	= "particles/gadget/shield_stationary_end",
	end_effect		= "particles/gadget/shield_stationary_end",
	uiName 			= "StaticShield",
	item_subtype 	= ItemSubtype.Screen,
	show_after 		= 0.2,
	radar_vison		= ai.ShieldRadarVisionMode.PASS,
	weapon_mode		= ai.ShieldWeaponMode.BLOCK_ENEMY,
}


Def.Module_InfoBarrier =
{
	class 		= "ActiveModule",
	in_editor	= false,
	cooldown	= 1,

	activate_entity	= "InfoBarrier",
	activate_entity_ttl = 30,
	activate_entity_max = 1,
	--activate_entity_health = 10000,
	--	attach_bone = "root",
	spawn_offset = Vec3( 0, 0, -50 ),
	spawn_dir_to_aim = true,
}

Def.InfoBarrier =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/shields/info_barrier_v2",--"models/shields/info_barrier",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	children =
	{
		--{ effect		= "particles/gadget/info_barrier", joint = "root" },
		{ effect		= "particles/gadget/info_barrier_v2", joint = "root" },
	},
	death_sound		= "sound/explosion/drone_expl",
	--death_effect	= "particles/gadget/info_barrier_end",
	--end_effect	= "particles/gadget/info_barrier_end",
	death_effect	= "particles/gadget/info_barrier_end_v2",
	end_effect		= "particles/gadget/info_barrier_end_v2",
	uiName 			= "InfoBarrier",
	item_subtype 	= ItemSubtype.InfoBarrier,
	show_after 		= 0.0,
	radar_vison		= ai.ShieldRadarVisionMode.BLOCK_ENEMY,
	weapon_mode		= ai.ShieldWeaponMode.PASS,
}

Def.Module_WarpGate =
{
	class 		= "ActiveModule",
	in_editor	= false,
	cooldown	= 30,
	activate_entity	= "WarpGate",
	activate_entity_max = 1, -- максимум 8
	activate_entity_ttl = 30,
	activate_entity_health = 10000,
	energy_cost = 100,
	check_spawn_collision = true,

	--energy_cost_per_second = 10, -- реализовано но не используется в этом модуле
	activate_sound = "sound/gadgets/warpgate/wg_activate",

	spawn_offset = Vec3( 0, 0, -75 ),
}


Def.WarpGate =
{
	class		= "WarpGate",
	in_editor	= false,
	uiName		= "Module_WarpGate",
	model		= "models/modules/m_active/warpgate/warpgate",
	physics		= { solid_type = solid.model, kinematic = true, hitbox = true, },
	warp_distance = 500,
	warp_cooldown = 0.5,
	work_sound 	= "sound/gadgets/warpgate/wg_work_loop",
	warp_sound 	= "sound/gadgets/warpgate/ship_warp_out",

	health		= 1,
	damageable	= true,
	hudType		= "default",

	warp_forward = false,
	warp_check_angle = 45,
	warp_check_box_scale = 0.7,

	death_effect = "particles/gadget/drone_overcharge",

	children =
	{
		{ effect = "particles/gadget/warpgate_beacon", joint = "g1_m" },
		{ effect = "particles/gadget/warpgate_beacon", joint = "g2_m" },
		{ effect = "particles/gadget/warpgate_beacon", joint = "g3_m" },
		{ effect = "particles/gadget/warpgate_beacon", joint = "g4_m" },
		{ effect = "particles/gadget/warpgate_center", joint = "main" },
	}
}

Def.Module_WarpGateSet =
{
	inherit = "Module_WarpGate",
	activate_entity = "WarpGateSet",
}

Def.WarpGateSet =
{
	inherit = "WarpGate",
	warp_distance = 550,
}

--[[
-- эксперименты с модулем выставляющим дрона.
Def.Module_TurretDron =
{
	class 		= "ActiveModule",
	in_editor	= false,
	cooldown	= 30,
	activate_entity	= "TurretDron",
	activate_entity_max = 1, -- максимум 8
	--activate_entity_ttl = 30,
	activate_entity_health = 10000,
	energy_cost = 250,
	--energy_cost_per_second = 20, -- реализовано но не используется в этом модуле
--	activate_sound = "sound/gadgets/warpgate/wg_activate",
}

Def.TurretDron =
{
	class 			= "Turret",
	in_editor		= false,
	model			= "models/modules/m_class/frigdrone/frigdrone",

	physics			= { solid_type = solid.model, kinematic = true, material = "Metal" },
	--health 			= 1, --берется от родителя
	damageable		= true,

	fire_rate		= 20.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 150,
	max_range		= 200,
	projectile_speed = 1000,

	damage_kinetic	= 0,
	damage_emp		= 0,
	damage_thermal	= 1000,
	signature		= ai.Signature.SMALL,

	max_rot_speed	= 30,	-- deg per second

	projectile		= "Projectile_Dron_Plasma",
	shot_effect 	= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/turret/turret_oneshot",
	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound		= "sound/explosion/drone_expl",


}
 ]]


Def.Module_Test =
{
	class		= "ActiveModule",
	in_editor	= false,
	spell		= "Test",
}


Def.Module_ForceBarrier =
{
	class		= "ActiveModule",
	in_editor	= false,
	activate_entity	= "ForceBarrier",
	activate_entity_ttl = 5,
	spawn_offset = Vec3( 0, 0, -10 ),
	spawn_dir_to_target = true,
	attach_bone = "root",
	cooldown	= 5,
}

Def.ForceBarrier =
{
	class		= "BaseEntity",
	in_editor	= false,
	model		= "models/shields/static_shield_blue",
	physics		= { solid_type = solid.model, kinematic = true, hitbox = true, },
}

Def.Module_DynamicShield =
{
	class		= "ActiveModule",
	in_editor	= false,
	activate_entity	= "DynamicShield",
	activate_entity_ttl = 5,
	spawn_offset = Vec3( 0, 0, -10 ),
	attach_bone = "root",
	cooldown	= 10,

	ai_usage			= ai.AiBehavior.SHIELD,
}

Def.DynamicShield =
{
	class		= "BaseEntity",
	in_editor	= false,
	model		= "models/shields/static_shield_blue",
	physics		= { solid_type = solid.model, material = "ShipMetalMk3", mass = 100, static_collision = false },
}


--
Def.Module_EnergyLance =
{
	class 				= "EnergyLance",
	in_editor			= false,

	class_mask			= ai.ShipClass.SMALL,

	cooldown			= 8.0,
	energy_cost 		= 60.0,
	work_time			= 3.0,

	damage_box_size		= Vec3( 3.0, 1.0, 10.5 ), -- ширина, высота, вперед

	-- damage per second
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 8000, -- в секунду
	spell				= "Spell_EnergyLance",

	--work_effect			= "",
	--work_sound			= "",
	--activate_effect		= "",
	--activate_module_effect = "",
	--activate_sound		= "",
}


--
Def.Module_SentryDrone =
{
	class					= "ActiveModule",
	in_editor				= false,
	class_mask				= ai.ShipClass.LARGE,

	cooldown				= 1.0,
	energy_cost				= 10.0,
	--energy_cost_per_second	= 25.0,

	activate_effect			= "",
	activate_module_effect	= "",

	activate_entity			= "SentryDrone1",
	activate_entity_health 	= 1000,
	spawn_offset 			= Vec3( 0, -5, 4 ),
	check_spawn_collision 	= true,

	-- drone parameters
	max_speed				= 0,
	max_rot_speed			= 0,	-- deg per second
	max_aim_rot_speed		= 60,

	fire_rate				= 20,
	dispersion				= 0.25,
	optimal_range			= 180,
	max_range				= 225,

	projectile_speed		= 400,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 200,
}


--
Def.SentryDrone =
{
	class					= "GuidedDrone",
	in_editor				= false,

	model					= "models/weapons/drones/sentry_drone/sentry_drone",
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },

	signature				= ai.Signature.SMALL,

	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound				= "sound/explosion/drone_expl",

	projectile				= "Projectile_SentryDron",
	shot_effect 			= "particles/weapons/drongun/muzzle",

	shot_once_sound 		= "sound/weapons/turret/turret_oneshot",

	max_speed				= 0,
	max_rot_speed			= 0,	-- deg per second
	max_aim_rot_speed		= 180,
	uiName 					= "SentryDrone_name",
}
Def.SentryDrone1 =
{
	inherit 				= "SentryDrone",
	active_spell			= 'Tackler_SlowManeuver', --!!!
}

--
Def.GuidedDrone =
{
	class					= "GuidedDrone",
	in_editor				= false,

	model					= "models/weapons/drones/attack_drone/attack_drone",

	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 100, },

	signature				= ai.Signature.SMALL,

	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound				= "sound/explosion/drone_expl",

	projectile				= "Projectile_Dron_Plasma",
	shot_effect 			= "particles/weapons/drongun/muzzle",

	shot_once_sound 		= "sound/weapons/turret/turret_oneshot",

	trail_effect 			= "particles/ships/ship_trail",
	trail_color 			= "4 95 184 100",
	trail_size 				= 0.05,

	max_speed				= 30,
	acceleration			= 20,
	max_rot_speed			= 180,	-- deg per second
	max_aim_rot_speed		= 270,

	control_range			= 1000,
	fire_rate				= 60,
	dispersion				= 1,
	optimal_range			= 50,
	max_range				= 100,
	projectile_speed		= 200,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 0,

	uiName 					= "itemSubType_BasicGuidedDron",
	uiDesc 					= "itemSubType_BasicGuidedDron_desc",
}


----------------------------------------------------------------------------------
Def.Module_SentryDroneRL =
{
	inherit 				= "Module_SentryDrone",
	activate_entity			= "SentryDroneRL",

	fire_rate				= 18,
	dispersion				= 0,
	optimal_range			= 300,
	max_range				= 350,


	--projectile_speed		= 250,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 200,
	damage_thermal			= 0,
	max_aim_rot_speed		= 45,
	projectile_speed		= 85,
}

Def.SentryDroneRL =
{

	inherit 				= "SentryDrone",
	model					= "models/objects/vital_point/new_year_drone/new_year_drone",
	active_spell			= 'Tackler_DisableJump',
	--хотел ракету но она не летает
	--projectile				= "SpaceMissile_SD_RL",
	--projectile				= "Projectile_SentryDron",
	projectile				= "Projectile_Plasma_Heavy",
	uiName 					= "SentryDroneRL_name",
}

 --[[
Def.SpaceMissile_SD_RL =
{
	inherit			= "SpaceMissile_Torpedo_T1_Mk1",
	detonation_radius	= 15,
	speed			= 30,
	is_guided		= true,
	max_range		= Def.Module_SentryDroneRL.max_range + 5,
}
  ]]---------------------------------------------------------------------------------
Def.Module_HealBot =
{
	class 				= "ActiveModule",
	in_editor			= false,
	cooldown			= 30,

	--activate_entity_max 		= 1, -- максимум 8
	--activate_entity_ttl 		= 30,
	--activate_entity_health 	= 3000,
	energy_cost 			= 100,
	--energy_cost_per_second	= 50.0,
	check_spawn_collision 		= true,

	spell				= "HealBot",
	--activate_entity		= "HealBot",
	item_subtype			= ItemSubtype.ShieldRayLarge,
	spawn_offset 			= Vec3( 0, -3, 1 ),



	activate_sound 			= "sound/gadgets/warpgate/wg_activate",
}



Def.HealBot =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= true,
	health 				= 3000,
	--model				= "models/objects/gameplay/bombball/bombball_orbit",
	model				= "models/weapons/drones/healbot/healbot",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,   damping = 0.4, rot_damping = 0.4, } ,
	--physics			= { solid_type = solid.box,  hitbox = true,  material = "Metal", mass = 1000, }, --kinematic = true,

	hudType 			= "default",

	uiName 				= "Module_ShieldRayLarge",
	uiDesc 				= "Module_ShieldRayLarge_Desc",

	children =
	{
		{ effect		= "particles/gadget/healing_aura" }, -- joint = "g1_m"
	},
	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",

}


Def.HealBot_Armor =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= true,
	health 				= 3000,
	--model				= "models/objects/gameplay/bombball/bombball_orbit",
	model				= "models/weapons/drones/healbot/healbot",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	--physics			= { solid_type = solid.box,  hitbox = true,  material = "Metal", mass = 1000, }, --kinematic = true,
	hudType 			= "default",

	uiName 				= "Module_RepairRayLarge",
	uiDesc 				= "Module_RepairRayLarge_Desc",

	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
}

Def.SpyBeaconAnalyse =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= true,
	health 				= 1750,
	--model				= "models/objects/gameplay/bombball/bombball_orbit",
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	--physics			= { solid_type = solid.box, kinematic = true, hitbox = true,  material = "Metal", mass = 1000, },
	hudType 			= "default",

	uiName 				= "Module_SpyBeaconAnalyse",
	uiDesc 				= "Module_SpyBeacon_Desc",

	death_effect			= "particles/explosions/big_fire_2",
	death_sound			= "sound/explosion/drone_expl",
}

Def.SpyBeacon =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= true,
	health 				= 1750,
	--model				= "models/objects/gameplay/bombball/bombball_orbit",
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	--physics			= { solid_type = solid.box, kinematic = true, hitbox = true,  material = "Metal", mass = 1000, },
	hudType 			= "default",

	uiName 				= "Module_SpyBeacon",
	uiDesc 				= "Module_SpyBeacon_Desc",

	death_effect			= "particles/explosions/big_fire_2",
	death_sound			= "sound/explosion/drone_expl",
}

--------------------
Def.Module_MissileDefence =
{
	class 				= "MissileDefence",
	in_editor			= false,
	beam_duration		= 0.1,
	track_all			= true,
	cooldown			= 45,  -- время после отключения модуля до нового включения
	activation_range	= 300,
	energy_cost			= 200,
	max_range			= 20,
	duration 			= 15, -- время активной работы
	beam_cooldown 		= 1, -- время между сбитиями ракет
}


Def.Module_R2D2Sniper =
{
	class 				= "ActiveModule",
	in_editor			= false,
	cooldown			= 10,

	energy_cost 			= 100,
	--check_spawn_collision 	= true,

	spell				= "R2D2_",

	item_subtype			= ItemSubtype.ShieldRayLarge,

	--activate_sound 		= "sound/gadgets/warpgate/wg_activate",
}

Def.Module_ReverseThruster =
{
	class 		= "ActiveModule",
	in_editor		= false,
	cooldown		= 5,
--	activate_entity	= "CurvedSpace",
--	activate_entity_max = 1, -- максимум 8
--	activate_entity_ttl = 5,
--	activate_entity_health = 10000,
	energy_cost 	= 100,
	spell				= "Spell_ReverseThruster",
	is_fast_movement	= true,
--	check_spawn_collision = true,

	--energy_cost_per_second = 10, -- реализовано но не используется в этом модуле
--	activate_sound	= "sound/gadgets/warpgate/wg_activate",
	--activate_fx		=  = "particles/gadget/drone_overcharge",

--	spawn_offset 	= Vec3( 0, 0, -15 ),

}

Def.Module_SpaceScan =
{
	class 				= "SpaceShipModule",
	tier				= 4,
	item_lvl			= 15,
	--price				= 300000,
	cant_be_bought 		= true,
	drop_weight			= 0,
	crit_chance_add  	= 0.05,
	default_icon		= "ItemSubtype_ScoutScanner",
	module_type			= ai.ModuleType.CPU_MOD,
	item_subtype		= ItemSubtype.SpaceScaner,
	shopCategory		= "SHIP_MOD",
	shopSubCategory		= "COMP_MOD",
	is_space_scanner	= true, -- модуль является сканером.
	space_scanner_free_space_only = true, -- сканер работает только в FreeSpace режиме.
	space_scanner_can_see_invisible_enemies_only = false, -- игнорировать видимых врагов.
	--space_scanner_distance = 750, -- дистанция сканирования.
	miningBonus			= 5, -- дает 5% бонусного перегрева "без взрыва"
	--storeItemId			= 10148,
	--uiName 	=
	--uiDesc    =
}

Def.Module_SpaceScan_Newbie =
{
	class 				= "SpaceShipModule",
	tier				= 4,
	item_lvl			= 15,
	--price				= 300000,
	cant_be_bought 		= true,
	drop_weight			= 0,
	crit_chance_add  	= 0.05,
	default_icon		= "ItemSubtype_ScoutScanner",
	module_type			= ai.ModuleType.CPU_MOD,
	item_subtype		= ItemSubtype.SpaceScan_Newbie,
	shopCategory		= "SHIP_MOD",
	shopSubCategory		= "COMP_MOD",
	is_space_scanner	= true, -- модуль является сканером.
	space_scanner_free_space_only = false, -- сканер работает только в FreeSpace режиме.
	space_scanner_can_see_invisible_enemies_only = true, -- игнорировать видимых врагов.
	space_scanner_distance = 750, -- дистанция сканирования.
	miningBonus			= 5, -- дает 5% бонусного перегрева "без взрыва"
	--storeItemId			= 10148,
	--uiName 	=
	--uiDesc    =
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,	
}
 --[[ Def.Module_SpaceScan_t3 = {
	inherit 			= "Module_SpaceScan",
	tier				= 3,
	premiumPrice		= 1000,
	cant_be_bought 		= false,
}
Def.Module_SpaceScan_t4 = {
	inherit 			= "Module_SpaceScan",
	tier				= 4,
	premiumPrice		= 1700,
	cant_be_bought 		= false,
}
Def.Module_SpaceScan_t5 = {
	inherit 			= "Module_SpaceScan",
	tier				= 5,
	premiumPrice		= 3000,
	cant_be_bought 		= false,
}
  ]]

 --[[
Def.CurvedSpace =
{
	class			= "WarpGate",
	in_editor		= false,
	uiName		= "Module_WarpGate",
	model		= "models/modules/m_active/warpgate/warpgate_reverse",
	physics		= { solid_type = solid.model, kinematic = true, hitbox = true, },
	warp_distance 	= 350,
	warp_cooldown 	= 0.5,
	work_sound 	= "sound/gadgets/warpgate/wg_work_loop",

	warp_forward 	= true,
	warp_check_angle = 90,
	warp_check_box_scale = 4,

	children =
	{
		{ effect = "particles/gadget/warpgate_center", joint = "main" },
	}
}
  ]]

Def.Module_testWarp =
{
	class			= "MicroWarpDrive",
	in_editor		= false,

	energy_prepare	= 0,		-- энергия требуемая для подготовительного разгона
	energy_activate 	= 30,		-- энергия требуемая для активации
	cooldown		= 60,

	prep_time		= 3,		-- время разгона
	prep_maxspeed_mul = 1.2,	-- во сколько раз увеличивать допустимую максимальную скорость при разгоне
	prep_accel_mul	= 2.0,		-- во сколько раз увеличивать ускорение при разгоне

	accel_time		= 2.0,		-- время сколько будет действовать
	maxspeed_mul	= 28.0,		-- во сколько раз увеличивать допустимую максимальную скорость
	accel_mul		= 5000.0,	-- во сколько раз увеличивать ускорение
	auto_disable_time = 0.55,	-- за T*<текущая_скорость> метров до препятствия автоматически выходит из варпа

	prep_loop		= "sound/gadgets/warp_prep",
	active_loop		= "sound/gadgets/warp_active",
	stop_sound		= "sound/gadgets/warp_stop",
	fail_sound		= "sound/gadgets/warp_fail",

	ui_name		= "MicroWarpDrive",

	uiName 		= "Special_MicroWarp_Base",
	uiDesc 		= "Special_MicroWarp_Base_Desc",

	item_subtype 	= ItemSubtype.MicroWarp,

	default_icon	= "ItemSubtype_MicroWarp",
}


Def.Module_FakeShips =  --#37141
{
	class			= "SpaceShipModule",
	--tier				= 4,
	--item_lvl			= 15,
	--cant_be_bought 		= true,
	--drop_weight			= 0,

	spawn_clones	= 1,
	spawn_clones_radius = 1.5,
	clones_power = 1,
	clones_ttl  = 20,
	--death_blast_wave_clone = "BlastWave_SM_Torpedo_T5_C"
}

Def.BlastWave_FakeShip = {  --BlastWave_SM_Torpedo_T5_C
	intensity		= 45,
	damage_emp		= 2500,
	blast_maxDistance= 40,
	blast_minDistance= 2,
	light_radius	= 20,
	light_time		= 0.8,
	class			= "BlastWave",
	apply_damage	= true,
	uiName			= "BlastWave_SM_Torpedo_T5_C",
	effect = "particles/explosions/shp_exp_hologram",
}


Def.Module_ShieldHavoc =  --#53981
{
	class			= "ActiveModule",
	--tier				= 4,
	--item_lvl			= 15,
	--cant_be_bought 		= true,
	--drop_weight			= 0,
	cooldown			= 5,
	energy_cost 		= 10,
	spell				= "ShieldHavoc",
}


Def.Module_TestDestructible =
{
	class = "ActiveModule",

	physics = {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	model = "models/objects/gameplay/ice/icicles/icicles_01",

	damageable = true,
	health = 5000,
	health_regen = 10,

	damage_to_host = 1000,
	death_wreck = "Destroyer_Life_Small_Wreck15",
	death_spell = "Invulnerability_T5_Prem",
	death_effect = "particles/explosions/objects/alien_destroyer_explosion",
	death_sound = "sound/weapons/ny/ny_rocket_explosion",

	spell = "Shift_T1_Rare",
}


Def.Module_SectorShield_Base =
{
	class 		= "ActiveModule",
	in_editor	= false,
	cooldown	= 15,
	--ammo		= 0,

	--signature	=	ai.Signature.TINY,

	--activate_entity	= "StaticShield",
	--activate_entity	= "DynamicHardShield",
	--activate_entity_ttl = 15, -- переезжает в сущность как ttl
	--activate_entity_ttl				= 3,
	activate_entity_max = 2,
	energy_cost			= 1500,
	item_subtype		= ItemSubtype.OverseerEntitySpawner,


	--activate_entity_health = 15000,
	block_friendly_projectile=false,
	attach_bone = "root",
	spawn_offset = Vec3( 0, 0, -18 ),
	spawn_dir_to_aim = true,
	check_spawn_collision = true,

	module_type = ai.ModuleType.SECONDARY_WEAPON,

	cant_be_bought = true,
	--storeItemId = 7947,
	--price = 1,
	--tier = 5,
	--item_lvl = 23,
	--item_subtype = ItemSubtype.Suicide,
	--mark = 1,
	--rank = 13,

	default_icon		= "ItemSubtype_ScoutScanner",
	--item_subtype=ItemSubtype.ProtonWall
}
Def.Module_SectorShield =
{
	inherit				= "Module_SectorShield_Base",
	cooldown			= 10,
	energy_cost			= 1500,
}
Def.Module_SectorShield4 =
{
	inherit				= "Module_SectorShield_Base",
	cooldown			= 10,
	energy_cost			= 1600,
}
Def.Module_SectorShield5 =
{
	inherit				= "Module_SectorShield_Base",
	cooldown			= 10,
	energy_cost			= 1700,
}

Def.Module_SectorShield_Federation =
{
	inherit				= "Module_SectorShield_Base",
	cooldown			= 5,
	activate_entity_max = 3,
}
Def.Module_SectorShield_Federation4 =
{
	inherit				= "Module_SectorShield_Base",
	cooldown			= 5,
	activate_entity_max = 3,
	energy_cost			= 1600,
}
Def.Module_SectorShield_Federation5 =
{
	inherit				= "Module_SectorShield_Base",
	cooldown			= 5,
	activate_entity_max = 3,
	energy_cost			= 1700,
}
Def.Module_SectorShield_Jericho =
{
	inherit				= "Module_SectorShield_Base",
	cooldown			= 8,
	energy_cost			= 800,
}
Def.Module_SectorShield_Jericho4 =
{
	inherit				= "Module_SectorShield_Base",
	cooldown			= 8,
	energy_cost			= 900,
}
Def.Module_SectorShield_Jericho5 =
{
	inherit				= "Module_SectorShield_Base",
	cooldown			= 8,
	energy_cost			= 1000,
}

Def.MunitionSectorShield =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	class_mask		= ai.ShipClass.HUGE,
	MunitionBayType = ai.MunitionBayType.MBT_SECONDARY,

	hack_immune			= true,
	damageable 		= true,
	health 			= 5000,
	ttl				= 20,
	hack_immune		= true,

	model			= "models/shields/sector_shield",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	radar_vison		= ai.ShieldRadarVisionMode.PASS,
	weapon_mode		= ai.ShieldWeaponMode.BLOCK_ENEMY,
	
	children =
	{
		{ effect		= "particles/gadget/sector_shield_start" },
	},
	death_sound		= "sound/explosion/drone_expl",
	uiName 			= "StaticShield",
	--show_after 		= 0.2,
	default_icon	= "ItemSubtype_MunitionSectorShield",
	start_sound  	= 	"sound/destroyer/SShield_activate",
	end_sound	=	"sound/destroyer/SShield_off",
	death_sound	=	"sound/destroyer/SShield_off",
	death_effect	= "particles/gadget/sector_shield_end",
	end_effect	= "particles/gadget/sector_shield_end",
}

Def.Module_TRay =
{
	class 			= "ActiveModule",
	in_editor 		= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 1500*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 5000,
	model 			= "models/turret/huge_module_spindle/spindle",
	stop_barrels	= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	--death_wreck  	= "models/modules/m_active/m_a_gadget_buff",
	death_wreck 	= "Module_Wreck",

	cooldown		= 40,
	energy_cost		= 1200,
	--trigger_aura 	= true,

	spell 			= "TRay",
	deactivate_spell= "TRay2",

	activate_sound 	= "sound/destroyer/TRay_fire",

	--model 		= "models/weapons/rail_guns/power/rg_experimental",
	--model = "models/objects/gameplay/ice/icicles/icicles_01",

	--work_beam_fx	= "particles/other/dreadnought_plasma_beam",

	default_icon 	= "ItemSubtype_ColdRay",

	--check_aim_orientation = true,
	check_aim_orientation_angle = 110,
	track 			= ai.TrackMode.AIM,
	barrel_rot_speed = 180,

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance = 0,
}


Def.Module_DTurret =
{
	class 		= "FiringModule",
	in_editor 	= false,

	signature			= ai.Signature.TINY,
	physics 			= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 			= true,
	health 				= 1000*2.6, --500
	health_regen 		= 25*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 		= 5000,
	model 				= "models/turret/huge_module_quadro/quadro",
	death_wreck 		= "Module_Wreck",

	track 				= ai.TrackMode.ENEMY,
	--check_aim_orientation = true,
	check_aim_orientation_angle = 90,
	barrel_rot_speed 	= 90,

	--model 				= "models/weapons/rail_guns/power/rg_experimental",

	optimal_range 		= 150,
	max_range 			= 150 * 1.33,

	fire_rate 			= 90,
	--fire_rate_add 		= 30,
	--fire_rate_max 		= 30,
	dispersion			= 1,

	damage_thermal		= 300,

	-- auto_shoot 			= true, --#83218 теперь используется поле shoot_mode
	shoot_mode = ai.FiringModuleShootMode.AUTO, --#83218 теперь используется поле shoot_mode
	projectile 			= "Projectile_DestroyerTurret",
	active_projectile 	= "Projectile_DestroyerTurretA",
	projectile_speed	= 450,
	shot_effect 		= "particles/weapons/blaster/dturret_muzzle",
	long_shot_effects = true,
	duration 			= 8,
	energy_cost 		= 400,
	cooldown 			= 35,
	muzzleflash_color = { kinetic = "255 0 0 100", emp = "255 0 0 100", thermal = "255 0 0 100", },
	muzzleflash_radius 		= 20,
	muzzleflash_time 		= 0.1,

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance = 0,
}
--
Def.Projectile_DestroyerTurret=
{
	inherit				= "Projectile_Dron_Plasma",
	model 				= "",
	effect 				= "particles/weapons/blaster/neutron_projectile",
	hit_effect			= "particles/weapons/blaster/dturret_explosion",
}
Def.Projectile_DestroyerTurretA =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "",
	explosion_blast_wave= "Blastwave_DestroyerTurretA",
	override_blast_wave_damage = true,

	detonation_radius	= 2,

	damage_mul  		= 0.75,
	fire_rate_mul		= 1,

	flare_color			= "255 100 100 100",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/blaster/dturret_projectile_2",
--	work_sound			= "",
	missile_defence_immune 	= true,
}


Def.Blastwave_DestroyerTurretA =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 100, -- работает из модуля
	blast_maxDistance	= 10,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/weapons/blaster/dturret_explosion",
	light_color 		= "255 0 0 100",
	light_radius 		= 10,
	light_time 			= 0.3,
	sound 				= "sound/explosion/nanobot_expl",
}

Def.Module_DTurret_Plasma =
{
	class 		= "FiringModule",
	in_editor 	= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 1000*2.6, --500
	health_regen 	= 25*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 5000,
	--model 			= "models/turret/huge_module_martair/martair",
	model 			= "models/turret/huge_module_mt12/mt12",
	death_wreck 	= "Module_Wreck",

	track 				= ai.TrackMode.ENEMY,
	--check_aim_orientation = true,
	check_aim_orientation_angle = 90,
	barrel_rot_speed 	= 90,

	--model 				= "models/weapons/rail_guns/power/rg_experimental",

	optimal_range 		= 338,
	max_range 			= 338 * 1.33,

	fire_rate 			= 60,
	--fire_rate_add 		= 60,
	--fire_rate_max 		= 60,
	dispersion			= 1,

	damage_emp			= 750,

	-- auto_shoot 			= true, --#83218 теперь используется поле shoot_mode
	shoot_mode = ai.FiringModuleShootMode.AUTO, --#83218 теперь используется поле shoot_mode
	projectile 			= "Projectile_DestroyerTurretA_P",
	active_projectile 	= "Projectile_DestroyerTurretA_PH",
	projectile_speed	= 200,
	shot_effect 		= "particles/weapons/other/pturret_muzzle",

	duration 			= 6,
	energy_cost 		= 400,
	cooldown 			= 24,

	muzzleflash_color = { kinetic = "128 190 255 100", emp = "128 190 255 100", thermal = "128 190 255 100", },
	muzzleflash_radius 		= 30,
	muzzleflash_time 		= 0.1,

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance = 0,
}
Def.Projectile_DestroyerTurretA_P =
{
	inherit				= "Projectile_Plasma_Light",
	model 				= "",
	effect 				= "particles/weapons/other/pturret_projectile",
	hit_effect			= "particles/weapons/other/pturret_explosion",
}

Def.Projectile_DestroyerTurretA_PH =
{
	inherit				= "Projectile_SingularityCannon",
	model 				= "",
	effect 				= "particles/weapons/other/pturret_projectile_2",
	hit_effect			= "particles/weapons/other/pturret_explosion_2",
	damage_mul  		= 3,
	--fire_rate_mul		= 1,
}

Def.Module_Teleporter =
{
	class 		= "FiringModule",
	in_editor 	= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2000*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 6000,
	--model 			= "models/turret/huge_active_module/huge_active_module",
	model 			= "models/turret/huge_module_martair/martair",
	death_wreck 	= "Module_Wreck",

	shot_once_sound = "sound/destroyer/teleporter_fire",


	--check_aim_orientation = true,
	check_aim_orientation_angle = 110,
	track 		= ai.TrackMode.AIM,
	barrel_rot_speed = 135,

	--model 		= "models/weapons/rail_guns/power/rg_experimental",

	max_range 	= 300,

	projectile = "Projectile_Teleport",

	energy_cost = 2000,
	cooldown = 45,

	module_type = ai.ModuleType.ACTIVE,

	damage_emp = 1000,

	projectile_speed = 70,

	default_icon 	= "ItemSubtype_WarpGate",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance = 0,
	shoot_mode = ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode
}


Def.Projectile_Teleport =
{
	inherit				= "Weapon_BaseRocket",
	class 				= "TeleportingProjectile",
	--physics 		= { mass = 50000, material = "Metal", solid_type = solid.box }, --solid_type = solid.model


	--model 				= "models/weapons/missile_rocket",
	explosion_blast_wave		= "Blastwave_Teleport",
	override_blast_wave_damage	= true,

	detonation_radius	= 3,

	flare_color			= "155 150 240 15",
	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/gadget/teleport_object",

	in_sound           = "sound/destroyer/teleporter_in",
	out_sound           = "sound/destroyer/teleporter_out",

	teleport_time = 0.3,
	missile_defence_immune 		= true,
	missile_detection_immune 	= true,
	impact_type 				= "plasma",

	in_fx 	= "particles/gadget/teleport",
	out_fx 	= "particles/gadget/teleport",
}

Def.Blastwave_Teleport  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 5000,
	blast_minDistance		= 3,
	blast_maxDistance		= 8,
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/smart_explosion",
	light_color 			= "160 160 255 100",
	light_radius 			= 18,
	light_time 				= 1.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}

--- 66727: Зеленые корабли: Разведка Нарождающаяся звезда
Def.Module_GrowingStar =
{
	inherit 			= "Weapon_Base",
	---class 				= "SingularityCannon",
	--storeItemId	 = 0,
	in_editor			= false,
	--cant_be_bought = true,
	model				= "",

	class				= "FiringModule",

	cooldown			= 20,
	energy_cost 		= 100.0,
	--energy_cost_per_second = 0.0,

	projectile 			= "Projectile_GrowingStar",
	projectile_speed 	= 70,   -- 5 секунд лета
				--track 				= ai.TrackMode.OFFSET,   --  у художников косые модели поэтому бажит.
				--track_offset 		= Vec3( 0, 0, -1 ), -- направление вперёд
	--check_aim_orientation = true,
	--check_aim_orientation_angle = 180,
	track 		= ai.TrackMode.AIM,
	barrel_rot_speed = 360,

	--fire_rate 			= 60,
	dispersion			= 0,

	optimal_range		= 350,
	max_range			= 350,  -- 5 секунд лета

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 10,
	damage_thermal		= 0,
	-- trigger_projectile	= true, --детонировать заряд при повторном нажатии модуля --#83218 теперь используется поле shoot_mode
	shoot_mode = ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
}

Def.Projectile_GrowingStar =
{
	inherit				= "Weapon_BaseRocket",
	model				= "",
	explosion_blast_wave = "Blastwave_GrowingStar",
	override_blast_wave_damage = true,

	spell_on_launch		= "Spell_GrowingStar", --

	detonation_radius	= 1,
	max_owner_distance	= 50,--75,
	--projectile_power_charge_coef = 10,
	power_charge_coef 	= 10, -- +урон в секунду
	range_charge_coef	= 25, -- +радиус в секунду
	charge_blastwave 	= true, -- +урон передать в взрыв

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/big/growing_projectile",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
}

Def.Blastwave_GrowingStar =
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 0.25,
	constant_damage		= false, --blast_minDistance работает с этим флагом онли
	blast_maxDistance	= 0.9,--1,		-- 0.1+ time*range_charge_coef   -- max = 53
	self_damage_coef	= 0, --не дамагаем себя.

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	effect 				= "particles/weapons/big/growing_explosion",
	light_color 		= "220 60 60 100",
	light_radius 		= 10,
	light_time 			= 0.5,
	sound 				= "sound/explosion/big_rocket_expl",
}
-----------
-- #62313: Зеленый корабль Разведка: маяк отступления

Def.Module_Return =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type 			= ai.ModuleType.ACTIVE,

	activate_entity 		= "ReturnPoint",
	deactivate_spell		= "ReturnPoint_Weakness", 
	--spell					= "SmartBomb_T1_Mk1",

	spawn_offset 			= Vec3( 0, -1, -5 ),

	energy_cost 			= 20,
	cooldown 				= 20,
	activate_sound 			= "sound/gadgets/common_activate",
	default_icon 			= "ItemSubtype_WarpGate",
}


Def.ReturnPoint =
{
	class 					= "TeleportingProjectile",

	--model = "models/turret/huge_module_drone/dron",
	--physics = { solid_type = solid.sphere, hitbox = true, kinematic = true },
	model					= "particles/models/green_beacon",
	effect 					= "particles/gadget/greenship_retreat_idle",
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", static = true, hitbox = true, }, -- если сделать реальную физику как у SpyBeacon, то возврат не работает, вообще это "пуля" так что с физикой тут какая то неразбериха.
	hudType 				= "default",
	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound				= "sound/explosion/drone_expl",

	speed 					= 0, -- чтобы не двигалось
	--explosion_blast_wave = nil,
	--detonation_radius = 0, -- и не взрывалось само

	time_to_live 			= 90,
	max_owner_distance		= 750,
	health 					= 3500,
	damageable 				= true,
	missile_defence_immune 		= true,
	missile_detection_immune 	= true,

	teleport_preparation_time = 1.5, -- [новое] время подготовки к прыжку после деактивации модуля
	teleport_on_ttl 		= false, -- [новое] телепортировать или нет по истечению времени жизни (по умолчанию true)
	teleport_radius 		= 20,	-- радиус
	teleport_target 		= {-- таргеты как в аурах (таблица)
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			vitality		= ai.SpellTargetVitality.ALIVE,
			misc			= ai.SpellTargetMisc.ALLY_OR_NOT_CIVILIAN,	-- #SC-97502 действует на дружественную, либо враждебную/нейтральную цель без "защиты странции", соответственно не действует на вражескую/нейтральную цель "под защитой станции"
		},


	in_sound				= "sound/destroyer/teleporter_in",
	out_sound				= "sound/destroyer/teleporter_out",

	hack_immune				= true,

	--in_blastwave = "BlastWave_SM_Fireworks_T1_Mk1", -- [новое] бластвейв в месте пропадания корабля (out_blastwave - в месте появления)

	teleport_time 			=	 0.3, -- 0.2 это время самого телепорта (точнее, время эффекта растворения/появления), по умолчанию 1

	in_fx 					= "particles/gadget/teleport",
	out_fx 					= "particles/gadget/teleport",

	flare_color				= "0 0 0 0", -- убрал засветку ракетную

	uiName 					= "ReturnPoint",
	uiDesc 					= "ReturnPoint_Desc",
}


Def.Module_RocketSilo =
{
	class		= "FiringModule",
	in_editor 	= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2000*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 6000,
--	model 			= "models/turret/huge_active_module/huge_active_module",
	model 			= "models/turret/msl_01/msl_01",
	death_wreck  	= "Module_Wreck",

	--check_aim_orientation = true,
	check_aim_orientation_angle = 100,
	barrel_rot_speed = 90,

	cooldown	= 35,
	energy_cost = 1000,
	track 		= ai.TrackMode.AIM,
--	model 		= "models/weapons/rail_guns/power/rg_experimental",
	max_range	= 1000,
	stop_barrels	= ai.BarrelsStopMode.ACTIVE,
-----
	damage_thermal	= 1100,
	dispersion		= 25,   -- Это пишется в тултипе      --до  #68720   было   25
	target_cone_angle = 25, -- Это угол самонаведения
	ammo			= 24,
	--no_friendly_fire = true,
	-- auto_shoot_active = true, --#83218 теперь используется поле shoot_mode
	shoot_mode = ai.FiringModuleShootMode.BURST, --#83218 теперь используется поле shoot_mode
	fire_rate 	= 360,
	--target_cone_angle = 30,
	max_projectiles_per_target = 3,
	--acceleration_time = 2,
-----
	projectile = "Projectile_RocketSilo",
	projectile_speed = 90,

	default_icon 	= "ItemSubtype_SpaceMissile_Fireworks",
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 		= 10,
	muzzleflash_time 		= 1.0,
	long_shot_effects = true,
	shot_effect = "particles/weapons/destroyer_rocket_start",
	shot_once_sound = "sound/destroyer/RocketSilo_launch",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance = 0,
}

--
Def.Projectile_RocketSilo =
{
	inherit				= "Weapon_BaseRocket",
	model 			= "models/weapons/bs_torpedo_mid",
	--model 				= "models/weapons/bs_torpedo",
	explosion_blast_wave = "Blastwave_RocketSilo",
	override_blast_wave_damage = true,

	detonation_radius	= 8,
	
	acceleration_time = 0.75,

	angular_velocity	= 50,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/destroyer_rocket_trail",
	is_guided 			= true,
	random_trajectory	=  true,
}


Def.Blastwave_RocketSilo =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 20,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= true,

	--effect 				= "particles/explosions/destroyer_rocket_explosion",
	effect = "particles/explosions/big_fire_2",
	light_color 		= "255 160 80 100",
	light_radius 		= 12,
	light_time 			= 0.5,
	sound 				= "sound/explosion/small_rocket_expl",
}

Def.Module_GravyAnomaly =
{
	class 			= "ActiveModule",
	in_editor 		= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2000*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 6000,
	module_death_effect 	= "particles/explosions/huge_capacitor_expl_hemisphere",
	--model 			= "models/turret/huge_active_module/huge_active_module",
	model 			= "models/turret/huge_module_mt13_g/mt13_g",
	death_wreck  	= "Module_Wreck",

	track 			= ai.TrackMode.AIM,
	--check_aim_orientation = true,
	check_aim_orientation_angle = 110,
	barrel_rot_speed = 90,
	stop_barrels	= ai.BarrelsStopMode.ACTIVE,
	cooldown 		= 60,
	--cooldown 		= 10,
	energy_cost 	= 15,
	spell 			= "SpellGravyAnomaly_V2_Start",
	deactivate_spell = "SpellGravyAnomaly_V2_End",


	module_type = ai.ModuleType.ACTIVE,
	activate_sound = "sound/destroyer/GravyAnomaly_activation",

	activate_beam_fx		= "particles/gadget/huge/gravy_anomaly_beam",
	activate_module_effect	= "particles/gadget/huge/gravy_anomaly_beam_muzzle",

	activate_beam_duration = 5,

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance = 0,
}

Def.Module_PushRay =
{
	class 			= "ActiveModule",
	in_editor 		= false,

	signature		= ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2000*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 6000,
	model 			= "models/turret/huge_module_magnifer/magnifer",
	death_wreck  	= "Module_Wreck",
	stop_barrels	= ai.BarrelsStopMode.ACTIVE,

	--check_aim_orientation = true,
	check_aim_orientation_angle = 110,
	track 			= ai.TrackMode.AIM,
	barrel_rot_speed = 720,

	cooldown 		= 35,
	energy_cost 	= 1500,

	spell 			= "PushRay",
	default_icon 	= "ItemSubtype_GravitationAnalyzer",

	activate_sound = "sound/destroyer/PushRay_fire",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance = 0,
}

Def.Module_AdaptiveBigShieldBoost =
{
	class 			= "ActiveModule",
	in_editor		= false,

	signature		= ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	trigger_aura 	= true,
	health 			= 3000*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 10000,
	model 			= "models/turret/huge_module_shield_gen/shield_gen",
	death_wreck 	= "Module_Wreck",


	cooldown 		= 35,
	energy_cost 	= 500,

	spell 			= "AdaptiveBigShieldBoost_T1_Mk1",
	spell_on_equip	= "Equip_AdaptiveBigShieldBoost_T3_Mk1",
	--default_icon 	= "ItemSubtype_GravitationAnalyzer",
}


----------------------------------
Def.Module_Javelin =
{
	class		= "FiringModule",
	in_editor 	= false,

	item_subtype	= ItemSubtype.Javelin,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2000*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 6000,
--	model 			= "models/turret/huge_active_module/huge_active_module",
	model 			= "models/turret/huge_module_magnifer/magnifer",
	death_wreck  	= "Module_Wreck",

	--check_aim_orientation = true,
	check_aim_orientation_angle = 100,
	barrel_rot_speed = 90,

	cooldown	= 7,
	energy_cost = 1800,
	track 		= ai.TrackMode.AIM,
--	model 		= "models/weapons/rail_guns/power/rg_experimental",
	max_range	= 5000,
-----
	damage_emp	= 100,
	dispersion	= 0,   -- Это пишется в тултипе
	--ammo		= 1,
	--fire_rate 	= 10,
	--target_cone_angle = 1,
	--max_projectiles_per_target = 1,
	--acceleration_time = 2,
-----
	projectile = "Projectile_Javelin",
	projectile_speed = 175,

	default_icon 	= "ItemSubtype_SpaceMissile_Fireworks",

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 		= 5,
	muzzleflash_time 		= 1.0,
	long_shot_effects = true,
	shot_effect = "particles/weapons/big/plasma_javelin_muzzle",
	oriented_shot_effects = false,
	shot_once_sound = "sound/gadgets/javelin/javelin_fire",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance = 0,
}

--
Def.Projectile_Javelin =
{
	inherit				= "Weapon_BaseRocket",
	--model 				= "models/weapons/bs_torpedo_small",
	--model 				= "models/weapons/bs_torpedo",

	spell 				= "Javelin_Weaknes",

	explosion_blast_wave = "Blastwave_Javelin",
	override_blast_wave_damage = true,

	detonation_radius	= 10,

	angular_velocity	= 1,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/big/plasma_javelin",

	is_guided = true,
}


Def.Blastwave_Javelin =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 30,
	blast_minDistance	= 10,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/weapons/big/plasma_javelin_explosion",
	light_color 		= "255 160 80 100",
	light_radius 		= 12,
	light_time 			= 0.5,
	sound 				= "sound/explosion/big_rocket_expl",
	--sound 					= "sound/explosion/SmartRocket_expl",
}

Def.DestrHealBot =
{
	class				= "ScBaseEntity",--"AuraHolderEntity",
	--network_sync		= true,
	MunitionBayType 	= ai.MunitionBayType.MBT_SECONDARY,

	hack_immune			= true,
	in_editor			= false,
	damageable			= true,
	health 				= 3000,
	ttl					= 25,
	hack_immune			= true,

	--model				= "models/objects/gameplay/bombball/bombball_orbit",
	model				= "models/weapons/drones/healbot/healbot",
	signature			= ai.Signature.TINY,
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000, damping = 0.4, rot_damping = 0.4, hitbox = true },
	--physics			= { solid_type = solid.box,  hitbox = true,  material = "Metal", mass = 1000, }, --kinematic = true,

	hudType 			= "minor", --"loot_crate",--Turret",--"loot_crate",--minor",

	uiName 				= "itemSubtype_DestrMunition_HealBot",
	--uiDesc 			= "DestrHealBot_Desc",		 --Module_ShieldRayLarge_Desc

	death_effect		= "particles/explosions/shp_exp_small_02",
	active_aura			= "DestrHealStation",

	start_sound  		= "sound/destroyer/DestrHealBot_activate",
--	end_sound			= "",
	death_sound			= "sound/explosion/drone_expl",
}

Def.TestDestDroneSpawn =
{
	inherit = "Module_CrystalConeDrone",
	activate_entity			= "DestrBeamDrone",
}

Def.Module_DestrBeamDrone =
{
	class				= "FiringModule",
	in_editor 			= false,

	signature			= ai.Signature.TINY,
	physics 			= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 			= true,
	health 				= 2500*2.6, --500
	health_regen 		= 40*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 		= 6000,
	model 				= "models/turret/huge_module_drone/gun_dron",
	death_wreck  		= "Module_Wreck",

	check_aim_orientation_angle = 100,
	barrel_rot_speed 	= 90,

	cooldown			= 7,
	energy_cost 		= 180,
	track 				= ai.TrackMode.AIM,
	stop_barrels_on_activate = true,
-----
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 100,

	dispersion			= 0,   -- Это пишется в тултипе

-----
	projectile 			= "Projectile_DestrBeamDrone",
	projectile_speed 	= 175,
	max_range			= 350,

	default_icon 		= "ItemSubtype_SpaceMissile_Fireworks",

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 	= 5,
	muzzleflash_time 	= 1.0,
	long_shot_effects 	= true,
	shot_effect 		= "particles/weapons/huge_module_drone/turret_muzzle",
	oriented_shot_effects = false,
	shot_once_sound 	= "sound/weapons/rockets/barrage",
}

Def.Projectile_DestrBeamDrone =
{
	inherit				= "Weapon_BaseRocket",
	--model 				= "models/weapons/bs_torpedo_small",
	--model 				= "models/weapons/bs_torpedo",
	model				= "models/turret/huge_module_drone/dron",

	--spell 				= "DestrBeamDrone",
	death_entity		= "DestrBeamDrone",

	explosion_blast_wave = "Blastwave_DestrBeamDrone",
	override_blast_wave_damage = true,

	missile_defence_immune 		= true,
	missile_detection_immune 	= true,

	detonation_radius	= 10,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/rockets/rocket_fly",
	is_guided = false,

	effect = "particles/weapons/esminec_drone_trail",
}

Def.Blastwave_DestrBeamDrone =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 10,
	blast_minDistance	= 5,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/explosions/big_fire_2",
	light_color 		= "255 160 80 100",
	light_radius 		= 12,
	light_time 			= 0.5,
	sound 				= "sound/explosion/rocket_expl",
}

Def.DestrBeamDrone =
{
	class					= "GuidedDrone",
	in_editor				= false,

	model					= "models/turret/huge_module_drone/dron", --
	--model					= "models/weapons/drones/sentry_drone/sentry_drone",
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 100,  damping = 0.01, rot_damping = 0.01,  },

	signature				= ai.Signature.TINY,
	health 					= 2000, --500
	ttl						= 20,


	death_effect			= "particles/explosions/big_fire_2",
	death_sound				= "sound/explosion/drone_expl",

	weapon_slots			= 1,
	primary_weapon			= "Weapon_LaserBasicDestrDrone",
	--projectile				= "Projectile_SentryDron",

	max_speed				= 0,
	max_rot_speed			= 180,	-- deg per second, поворот модели дрона (учитывает физику при повороте)
	max_aim_rot_speed		= 180, -- скорость поворота прицела дрона

	uiName 					= "DestrBeamDrone_name",
	default_icon			= "ItemSubtype_DestrBeamDrone",
	--дамаг надо указывать в дроне а не в пушке, а то не дамагает
	damage_thermal			= 395,
}

Def.Weapon_LaserBasicDestrDrone ={
	fire_rate				= 160,
	impulse_time			= 1,
	dispersion				= 0,
	dispersion_max			= 0,
	optimal_range			= 177,
	max_range				= 235,
	--damage_thermal			= 395, берется из самого дрона ( #66287 )
	--crit_chance				= 0.05,
	--crit_damage				= 0.5,
	--heat_max				= 10,
	--heat_add				= 1,
	--heat_sub				= 4,
	--overheat_time			= 1.25,
	inherit					= "Weapon_AutoGun",
	default_icon			= "ItemSubtype_DestrBeamDrone",
	projectile				= "Projectile_Neutron",
	projectile_speed		= 400,
	item_subtype			= ItemSubtype.LaserBasic,
	module_type				= ai.ModuleType.WEAPON,
	weapon_class			= ai.WeaponClass.LASER,
	shot_effect 			= "particles/weapons/huge_module_drone/drone_muzzle",
	shot_loop_sound = "",
	shot_once_sound = "sound/weapons/laser/econ",
	uiName = "DestrBeamDrone_name",
}


Def.Module_UnicEMPAbsorb	={
	class					= "ActiveModule",
	mark					= 1,
	tier					= 3,
	price					= 210375,
	item_lvl				= 19,
	rank					= 7,
	cooldown				= 15,
	energy_cost				= 100,
	spell					= "UnicEMPAbsorb", -- EMP_ABSORB_TO_SHIELD
--	class_mask=ai.ShipClass.SMALL+ai.ShipClass.LARGE + ai.ShipClass.MEDIUM
	--required_ship			= 'Ship_Race3_L_T3_PremUniq',

	module_type 			= ai.ModuleType.ACTIVE,
	default_icon			= "ItemSubtype_AdaptiveArmorBoost",
--	shopCategory				= "ACTIVE_MODULES",
--	shopSubCategory			= "ACTIVE_SURVIVAL",
	item_subtype			= ItemSubtype.EMPAbsorb,
	activate_sound 			= "sound/gadgets/common_activate"
}

----------------------------------
Def.Module_Vortex =
{
	class					= "FiringModule",
	in_editor 				= false,

	item_subtype			= ItemSubtype.Vortex,

	--model 					= "models/turret/huge_module_magnifer/magnifer",
	--model 					= "models/weapons/plasma/power/pl_precursors",
	model 					= "models/weapons/plasma/power/vortex",

	--spell_on_hit			= "Vortex_Huge",

	--check_aim_orientation 	= true,
	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 1390,

	cooldown				= 3,
	energy_cost 			= 18,
	track 					= ai.TrackMode.AIM,

	max_range				= 400,
-----
	damage_kinetic			= 0,
	dispersion				= 0,   -- Это пишется в тултипе
	--ammo		= 1,
	--fire_rate 	= 10,
	--target_cone_angle = 1,
	--max_projectiles_per_target = 1,
	--acceleration_time = 2,
-----
	projectile 			= "Projectile_Vortex",
	projectile_speed 	= 90,

	default_icon 		= "ItemSubtype_SpaceMissile_Fireworks",

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 	= 5,
	muzzleflash_time 	= 1.0,
	long_shot_effects 	= true,
	shot_effect 		= "particles/weapons/vortex/muzzle",
	oriented_shot_effects = false,
	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",

}
--
Def.Projectile_Vortex =
{
	inherit				= "Weapon_BaseRocket",

	explosion_blast_wave = "Blastwave_Vortex",
	override_blast_wave_damage = true,

	--spell		= { "Vortex_Huge", "Vortex" },
	--spell				= "Vortex",

	detonation_radius	= 2,

	angular_velocity	= 1,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/vortex/projectile",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
	is_guided 			= true,
}
Def.Blastwave_Vortex =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 3,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= false,

	effect 				= "particles/weapons/vortex/explosion",
	light_color 		= "55 60 220 100",
	light_radius 		= 10,
	light_time 			= 0.5,
	sound 				= "sound/gadgets/Vortex/Vortex_explosion",
}

Def.Module_PairsShield =
{
	class				= "ActiveModule",
	--tier				= 4,
	--item_lvl			= 15,
	--cant_be_bought 		= true,
	--drop_weight			= 0,
	target_ally			= true,
	cooldown			= 5,
	energy_cost 		= 10,
	spell				= "PairsShield_Host",
	additional_spell	= "PairsShield_Target",
}
Def.PairsShield_HostShield =
{
	class 				= "ScBaseEntity",

	health 				= 500, --
	ttl					= 5,
	damageable			= true,
	network_sync 		= true,

	spell_on_ttl		= "Bonus_damage",
	effect = "particles/gadget/pshield_1",

	ui_color			= 0xFFFFCCFF,
--  explosion_on_ttl
--  spell_on_death
--  explosion
}

-- 61675: Phoenix - Модуль "Запутыватель частиц"
 --ai.Aura.SHIELD_LINK и ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET
Def.Module_LinkShield =
{
	class				= "ActiveModule",
	--tier				= 4,
	--item_lvl			= 15,
	--cant_be_bought 		= true,
	--drop_weight			= 0,
	trigger_aura		= true,
	--model = "models/shields/linkshield",

	target_ally			= true,
	cooldown			= 5,
	energy_cost_per_second = 10,
	spell				= "LinkShield",
	additional_spell	= "Bonus_damage",
}

Def.Module_TractorBeam =
{
	class				= "ActiveModule",
	--tier				= 4,
	--item_lvl			= 15,
	--cant_be_bought 		= true,
	--drop_weight			= 0,

	cooldown			= 5,
	energy_cost			= 10,
	spell				= "TractorBeam",
--	additional_spell	= "Bonus_damage",
	trigger_aura		= true,
	work_beam_fx		= "particles/gadget/tractor_beam",
}

Def.Module_RestoringIons =
{
	class				= "ActiveModule",
	--tier				= 4,
	--item_lvl			= 15,
	--cant_be_bought 		= true,
	--drop_weight			= 0,
	--target_ally			= true,
	spell				= "RestoringIons_StartSpell",
	cooldown			= 15,
	energy_cost 			= 10,
--	sound				= "sound/gadgets/rest_ions/rest_ions_activation",

}
Def.RestoringIons_Shell =
{
	class 				= "ScBaseEntity",
	health 				= 2000, --
	ttl					= 3,
	damageable			= true,
	network_sync 		= true,
	spell_on_ttl		= "RestoringIons_EndSpell",
	model				= "models/ships/race_4/l/race4_l_reaper_shield",
	death_effect		= "particles/ships/race4_l_reaper_shield_destroy",
	ui_color			= 0xFFEEFFCC,
--  explosion_on_ttl
--  spell_on_death
--  explosion
}

-- #62296
Def.Module_PulsarShield =
{
	class		 = "SpaceShipModule",

	in_editor	 = "false",


	module_type = ai.ModuleType.SHIELD_MOD,
	--item_subtype	= ItemSubtype.PulsarShield,
	--default_icon	= "ItemSubtype_ExtShld",
	--store_path = "/PASSIVE MODULES/SHIELD_MOD",
	shopCategory = "SHIP_MOD",
	shopSubCategory = "SHIELD_MOD",

	shield_resist_kinetic_add = 15,
	shield_resist_emp_add = 15,
	shield_resist_thermal_add = 15,
	spell_on_equip = "Spell_PulsarShield",
}


Def.Module_Kukan =
{
	class 				= "SpaceShipModule",
	in_editor			= false,
	spell_on_equip 		= "Kukan",
	item_subtype		= ItemSubtype.ReaperArmour,
	--aura_target_offset 	= Vec3( 0, 0, -10 ),  #70073
}

Def.Module_CapacitorCooldown =
{
	class				= "SpaceShipModule",

	--cant_be_bought		= true,
	in_editor			= false,
	--storeItemId			= 0,

	cooldown_mul		= -0.25,
	---default_icon		= "ItemSubtype_ExtCapacitorBattary",
	module_type			= ai.ModuleType.CAPACITOR_MOD,
	---item_subtype		= ItemSubtype.ExtCapacitorBattary,
	store_path			= "/PASSIVE MODULES/CAPACITOR_MOD",
	shopCategory		= "SHIP_MOD",
	shopSubCategory		= "CAPACITOR_MOD",
}


Def.Module_FotonVortex =
{
	class					= "FiringModule",
	in_editor 				= false,

	---item_subtype			= ItemSubtype.Vortex,

	---model 					= "models/weapons/plasma/power/vortex",

	spell_on_hit			= "FotonVortex",

	--check_aim_orientation 	= true,
	--check_aim_orientation_angle = 180,
	--barrel_rot_speed 		= 90,

	cooldown				= 1,
	energy_cost 			= 50,
	--track 					= "aim",

	max_range				= 290,
-----
	damage_kinetic			= 0,
	dispersion				= 0,   -- Это пишется в тултипе
	--ammo		= 1,
	--fire_rate 	= 10,
	--target_cone_angle = 1,
	--max_projectiles_per_target = 1,
	--acceleration_time = 2,
-----
	projectile 			= "Projectile_FotonVortex",
	projectile_speed 	= 455,

	default_icon 		= "ItemSubtype_SpaceMissile_Fireworks",

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 	= 2,
	muzzleflash_time 	= 1.0,
	long_shot_effects 	= true,
	--shot_effect 		= "particles/weapons/vortex/muzzle",
	oriented_shot_effects = false,
	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
}

--
Def.Projectile_FotonVortex =
{
	inherit				= "Weapon_BaseRocket",

	explosion_blast_wave = "Blastwave_FotonVortex",
	override_blast_wave_damage = true,

	--spell		= { "Vortex_Huge", "Vortex" },
	--spell				= "FotonVortex",

	detonation_radius	= 2,

	--angular_velocity	= 1,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/other/fotonvortex_projectile",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
	--is_guided 			= true,
}

Def.Blastwave_FotonVortex =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 3,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= false,

	effect 				= "particles/weapons/other/fotonvortex_explosion",
	light_color 		= "220 60 60 100",
	light_radius 		= 10,
	light_time 			= 0.5,
	sound 				= "sound/gadgets/Vortex/Vortex_explosion",
}



---#62799 спецабилка для Перехватчик РЭБ Иерихона "Karud" 15й ранг
Def.Module_WeaponHacker =
{
	class				= "ActiveModule",
	in_editor			= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,

	cooldown			= 10.0,
	energy_cost 		= 10.0,
	--energy_cost_per_second = 0.0,

	spell				= "Spell_WeaponHacker",
	additional_spell	= "Spell_NoFireWeapon",

	activate_sound		= "sound/gadgets/common_activate",

	item_subtype		= ItemSubtype.WeaponHacker,
	default_icon		= "ItemSubtype_BlackoutGenerator",

	work_beam_fx	   = "particles/gadget/weaponhacker_beam",
}

---#62298 крик для  Ударный штурмовик Империи "Ghost"
Def.Module_Scream =
{
	inherit 			= "Weapon_Base",
	---class 				= "SingularityCannon",
	--storeItemId	 = 0,
	in_editor	 = false,
	--cant_be_bought = true,
	--model				= "models/weapons/plasma/power/orb_gun",

	class				= "FiringModule",

	cooldown			= 20,
	energy_cost 		= 100.0,
	--energy_cost_per_second = 0.0,

	projectile 			= "Projectile_Scream",
	projectile_speed 	= 300,
	track = ai.TrackMode.AIM,
	--track_offset = Vec3( 0, 0, -1000 ), -- направление вперёд
	barrel_rot_speed = 360,

	--fire_rate 			= 60,
	dispersion			= 0,

	optimal_range		= 207,
	max_range			= 275,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 833,
	damage_thermal		= 0,

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
}

Def.Projectile_Scream =
{
	--inherit				= "Weapon_BaseRocket",
	inherit				= "Projectile_SingularityCannon",
	--detonation_radius	= 0.1,

	flare_color			= "0 0 255 25",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,


	spell_on_launch	= "Spell_Scream", --!!!

	work_sound 	    = "sound/gadgets/Vortex/vortex_fly",
	effect 			= "particles/weapons/big/scream_projectile",

	--explosion_blast_wave 		= "Blastwave_Scream",
	--override_blast_wave_damage	= true,
	kill_effect_on_remove 		= true,
}

Def.Blastwave_Scream =
{
	class					= "BlastWave",
	in_editor				= false,

	--damage_emp				= 200,
	blast_maxDistance		= 7,
	apply_damage			= true,

	effect 					= "particles/weapons/big/scream_explosion",
	light_color 			= "160 160 255 100",
	light_radius 			= 50,
	light_time 				= 0.4,
	sound 					= "sound/gadgets/Vortex/Vortex_explosion",
}

--
Def.Module_CrystalHamstring =
{
	inherit 			= "Weapon_Base",
	---class 			= "SingularityCannon",
	in_editor	 		= false,
	--model				= "models/weapons/plasma/power/orb_gun",

	class				= "FiringModule",

	cooldown			= 20,

	energy_cost 		= 100.0,

	projectile 			= "Projectile_CrystalHamstring",
	projectile_speed 	= 350,

	--track 				= ai.TrackMode.OFFSET,
	--track_offset 		= Vec3( 0, 0, -1 ), -- направление вперёд

	track 				= ai.TrackMode.AIM,
	check_aim_orientation_angle = 180,
	barrel_rot_speed 	= 360,

	fire_rate 			= 60,
	dispersion			= 0,

	optimal_range		= 207,
	max_range			= 300,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 833,
	damage_thermal		= 0,

	shot_once_sound 	= "sound/el_modules/CrystalHamstring",
}

Def.Projectile_CrystalHamstring =
{
	--inherit			= "Weapon_BaseRocket",
	inherit				= "Projectile_SingularityCannon",
	--detonation_radius	= 0.1,
	damage_radius		= 25,

	flare_color			= "0 0 255 25",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,

	spell_on_launch		= "Spell_CrystalHamstring", --!!!

--	work_sound			= "sound/gadgets/Vortex/vortex_fly",
	effect 				= "particles/weapons/big/hamstring_projectile",
	singularity_hit_fx 	= "particles/empty",

	--explosion_blast_wave 		= "Blastwave_Scream",
	--override_blast_wave_damage	= true,
	kill_effect_on_remove 		= false,
}


--- #62798 Перехватчик РЭБ Иерихона "Karud". Пассивный модуль. Щит
Def.Module_ThermalUnlock =
{
	shield_resist_thermal_add=40,
	class="SpaceShipModule",
	module_type=ai.ModuleType.SHIELD_MOD,
	in_editor=false,
	default_icon="ItemSubtype_ResistShldThermal",

	shopCategory="SHIP_MOD",
	shopSubCategory="SHIELD_MOD",
	item_subtype=ItemSubtype.ResistShldThermal,

	shield_disabled_spell 		= "Spell_Unlock",
	cooldown 	= 50, --??
	show_cooldown_status 		= true,
	--cooldown_spell = "EmergencyBarrierCooldown",
}

--- #64192: Alienn Summer Part 4&5. Пассивный модуль чужих
Def.Module_GreenArmorFocusResist =
{

	focus_spell 			= "Spell_GreenArmorFocusResist",

	hull_resist_kinetic_add	= 8,
	hull_resist_emp_add		= 8,
	hull_resist_thermal_add	= 8,

	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	in_editor				= false,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
}

--- #64191: Alienn Summer. Part 4&5. Активный модуль чужих
Def.Module_EnergyReflector =
{
	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 60,
	energy_cost_additional	= 0.50,
	param_modificator 		= 0.27,

	cooldown				= 10,
	spell					= "Spell_EnergyReflResist",
	additional_spell 		= "Spell_EnergyReflector",

	check_aim_orientation_angle = 360,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 1000,

	check_aim_orientation 	= true,

	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/destroyer/TRay_fire",
}

Def.Module_G2D2 =
{
	class 		= "FiringModule",
	in_editor 	= false,
	model 			= "models/weapons/plasma/power/vortex",

	track 				= ai.TrackMode.ENEMY,
	--check_aim_orientation = true,
	check_aim_orientation_angle = 90,
	barrel_rot_speed 	= 270,

	optimal_range 		= 150,
	max_range 			= 150 * 1.33,

	fire_rate 			= 60,
	--fire_rate_add 		= 60,
	--fire_rate_max 		= 60,
	dispersion			= 1,

	damage_thermal		= 500,

	-- auto_shoot 			= true, --#83218 теперь используется поле shoot_mode
	shoot_mode = ai.FiringModuleShootMode.AUTO, --#83218 теперь используется поле shoot_mode
	projectile 			= "Projectile_G2D2_P",
	active_projectile 	= "Projectile_G2D2_PH",
	projectile_speed	= 400,
	shot_effect 		= "particles/weapons/blaster/dturret_muzzle",

	duration 			= 6,
	energy_cost 		= 400,
	cooldown 			= 24,

	muzzleflash_color = { kinetic = "255 0 0 100", emp = "255 0 0 100", thermal = "255 0 0 100", },
	muzzleflash_radius 		= 30,
	muzzleflash_time 		= 0.1,

	shot_once_sound = "sound/weapons/laser/sniper",
}
Def.Projectile_G2D2_P =
{
	inherit				= "Projectile_LaserSniper",
--	effect 				= "particles/weapons/other/pturret_projectile",
--	hit_effect			= "particles/weapons/other/pturret_explosion",
}
Def.Projectile_G2D2_PH =
{
	inherit				= "Projectile_LaserSniper",--"Projectile_SingularityCannon",
--	effect 				= "particles/weapons/other/pturret_projectile_2",
--	hit_effect			= "particles/weapons/other/pturret_explosion_2",
	--damage_mul  		= 3,
	fire_rate_mul		= 5,
}

Def.EmergencyShell_Shield =
{
	class 				= "ScBaseEntity",
	health 				= 500, --
	ttl					= 10,
	damageable			= true,
	network_sync 		= true,
	ui_color			= 0xFFFFCCFF,
}

Def.Shell_GuardShield =
{
	class 				= "ScBaseEntity",
	health 				= 500, --
	ttl					= 10,
	damageable			= true,
	network_sync 		= true,

	model				= "models/ships/race_3/l/r3_l_shuttle_shield",

   children =
	{
		{ effect        = "particles/other/shuttle_shield_cord" , joint = "fx01"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx02"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx03"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx04"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx05"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx06"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx07"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx08"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx09"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx010"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx011"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx012"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx013"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx014"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx015"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx016"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx017"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx018"},
        { effect        = "particles/other/shuttle_shield_cord" , joint = "fx019"},
	},

	ui_color			= 0xFFFFCCFF,
}

Def.Shell_GreenShield =
{
	class 				= "ScBaseEntity",
	health 				= 500, --
	ttl					= 10,
	damageable			= true,
	network_sync 		= true,

	ui_color			= 0xFFFFCCFF,
	effect              = "particles/gadget/alien_mass_shield_hit",
}

Def.Shell_CoverShield =
{
	class 				= "ScBaseEntity",
	health 				= 500, --
	ttl					= 10,
	damageable			= true,
	network_sync 		= true,

	ui_color			= 0xFFFFCCFF,
	effect              = "particles/gadget/pshield_1",
	work_sound			= "sound/ufo_modules/covershield_loop",	
}

Def.Module_CrystalConeDrone =
{
	inherit 				= "Module_SentryDrone",
	activate_entity			= "CrystalConeDrone",
	activate_entity_health	= 1200,

	--fire_rate				= 12,
	--dispersion				= 0,

	class_mask 				= ai.ShipClass.SMALL+ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,

	activate_sound		= "sound/el_modules/CrystalConeDrone",

	--projectile_speed		= 250,
	--damage					= 0,
	--damage_kinetic			= 0,
	--damage_emp				= 200,
	damage_thermal			= 200,
	max_aim_rot_speed		= 0,
	max_rot_speed			= 25,
	--projectile_speed		= 85,
}

Def.CrystalConeDrone =
{
	class					= "GuidedDrone",
	in_editor				= false,

	model 					= "models/objects/green_drones/dron_shooter",
	physics					= { solid_type = solid.model, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },

	signature				= ai.Signature.TINY,
	--health 					= 1000, --500
	ttl						= 40,

	remove_effect 			= "particles/explosions/shp_exp_mid_alien",
	death_effect 			= "particles/explosions/shp_exp_mid_alien",
	death_sound				= "sound/explosion/drone_expl",

	weapon_slots			= 1,
	primary_weapon			= "Weapon_CrystalConeDrone", --  "Weapon_CrystalConeDrone",

	max_speed			= 0,
	--max_rot_speed			= 16,	-- deg per second -- не заметил работы
	--max_aim_rot_speed		= 0, -- работает
	
	signature_damage_coefs	= BlastWaveSignatureCoef,

	uiName 					= "SentryDrone_name",
	children =
	{
		{ effect 	= "particles/gadget/green_drone_appier", joint = "root" },
	}
}


Def.Weapon_CrystalConeDrone =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	fire_rate				= 45,

	dispersion				= 0.1,

--	optimal_range			= 230,
--	max_range				= 300,
	projectile_speed		= 600,--300,

	optimal_range			= 345,
	max_range				= 450,

	damage_thermal			= 10,
	crit_chance				= 0.0,
	crit_damage				= 0.0,

	--model					= "models/weapons/lasers/sniper/l_training",
	module_type				= ai.ModuleType.WEAPON,
	projectile				= "Projectile_CrystalConeDrone",
	shot_effect 			= "particles/weapons/alien/crystal_muzzle",
	muzzleflash_color = { kinetic = "32 128 64 100", emp = "32 128 64 100", thermal = "32 128 64 100", },
	muzzleflash_radius 		= 4,

	--signature_damage_coefs	= BlastWaveSignatureCoef,

	shot_once_sound 		= "sound/el_modules/CrystalConeDrone_shot",
}

Def.Projectile_CrystalConeDrone =
{
	class					= "ChainLightningProjectile",
	link_range 				= 50,
	chaing_damage			= { 1, 0.75,  },
	chain_target			= {
		class 				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 		= ai.SpellTargetRelationship.ENEMY,
		},
	shield_subtypes 		= { ItemSubtype.SectorShield, ItemSubtype.Screen, },
			--[[
			добавил класс ChainLightningProjectile
			у него:
			link_range - макс расстояние между врагами в цепочке
			chaing_damage - массив из коэффициентов, на которые будет умножаться дамаг для врагов в цепочке
			chain_target - тип целей аналогично аурам (новый формат)
			 ]]
	hitbox_min 				= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max				= Vec3( 0.1, 0.1, 0.1 ),

	effect 					= "particles/weapons/alien/crystalconedrone_projectile",
	beam_fx 				= "particles/weapons/alien/crystalconedrone_beam",
	chain_hit_fx 			= "particles/weapons/alien/crystal_beam_hit",

	detonation_radius		= 1,

	flare_color				= "255 150 100 15",
	flare_size				= 0.0, --0
	flare_angle				= 180,
	flare_nebulosity		= 0.1,--0.1,
	
	--reflection_immune		= true,
}

--67134: Зеленые корабли: Ударный Активный модуль: "Ионный поток"
--
Def.Module_IonStream =
{
	inherit 			= "Weapon_Base",
	---class 			= "SingularityCannon",
	in_editor	 		= false,
	--model				= "models/weapons/plasma/power/orb_gun",

	class				= "FiringModule",

	cooldown			= 5,

	energy_cost 		= 10.0,

	projectile 			= "Projectile_IonStream",
	-- trigger_projectile 	= true,  -- прожектайл можно активировать #67134 --#83218 теперь используется поле shoot_mode
	shoot_mode = ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode
	projectile_deactivate_spell = "IonStream",
	projectile_deactivate_ttl = 1.5,  --столько прожектайл будет жить после деактивации
	projectile_speed 	= 100,
	track 				= ai.TrackMode.AIM,
	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 360,

	fire_rate 			= 60,
	dispersion			= 0,

	optimal_range		= 500,
	max_range			= 500,
	projectile_auto_deactivate_time = 8,

	--damage_kinetic		= 0,
	damage_emp			= 0,
	--damage_thermal		= 0,

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
}

Def.Projectile_IonStream =
{
	--inherit			= "Weapon_BaseRocket",
	inherit				= "Projectile_SingularityCannon",
	--detonation_radius	= 0.1,
	damage_radius		= 0.1,

	flare_color			= "0 0 255 25",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,

	--spell_on_launch		= "Spell_CrystalHamstring", --!!!

	work_sound			= "sound/gadgets/Vortex/vortex_fly",
	--effect 				= "particles/weapons/big/hamstring_projectile",
	effect 				= "particles/weapons/big/scream_projectile",
	singularity_hit_fx 	= "particles/empty",

	--explosion_blast_wave 		= "Blastwave_Scream",
	--override_blast_wave_damage	= true,
	kill_effect_on_remove 		= false,
}

----------------------------------------------------------------------------------------------------------------
--#68249
Def.Module_CrystalSpit =
{
	class					= "FiringModule",
	in_editor 				= false,

	item_subtype			= ItemSubtype.CrystalSpit,

	--model 					= "models/turret/huge_module_magnifer/magnifer",
	--model 					= "models/weapons/plasma/power/pl_precursors",
	--model 					= "models/weapons/plasma/power/vortex",

	--spell_on_hit			= "Vortex_Huge",

	--check_aim_orientation 	= true,
	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 90,

	cooldown				= 3,
	energy_cost 			= 18,
	hull_cost 				= 10,
	track 					= ai.TrackMode.AIM,


	projectile 				= "Projectile_CrystalSpit",
	projectile_speed 		= 85,
	max_range				= 85 * 3,  -- 3 сек летит. 75 - скорость
-----
	--damage_kinetic			= 0,
	dispersion				= 0,   -- Это пишется в тултипе

	default_icon 			= "ItemSubtype_SpaceMissile_Fireworks",

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 		= 5,
	muzzleflash_time 		= 1.0,
	long_shot_effects 		= true,
	shot_effect 			= "particles/weapons/vortex/muzzle",
	oriented_shot_effects 	= false,
	shot_once_sound 		= "sound/gadgets/Vortex/Vortex_fire",

}
--
Def.Projectile_CrystalSpit =
{
	inherit					= "Projectile_SingularityCannon",

	spell_on_launch			= "Spell_CrystalSpitBase",	--Spell_CrystalSpit",
	death_entity			= "CrystalSpit_Bonus",
	power_charge_coef		= 0.25,						--> при этом сила хила (аура_парам) ентити зависит от = константа + нанесенный_урон*коэффициент
	charge_bonus 			= true,
	spell_charge_coef		= 0.25, -- временно дубль с power_charge_coef до патча 1.4.2

	missile_detection_immune = true,
	disable_concussion_sound = true,
	missile_defence_immune 	= true,

	flare_color				= "255 235 180 10",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
	effect 					= "particles/weapons/other/crystalspit_projectile",
	work_sound				= "sound/gadgets/Vortex/vortex_fly",
}
Def.CrystalSpit_Bonus =
{
	class 					= "ScBaseEntity",
	in_editor				= true,
	hudType					= "default",
	hud_visibility_type 	= "minor",
--	damageable		= true,
--	health 			= 10000,
	uiName					= "Bonus_HealHull_name",

	model					= "models/misc/crystalspit",

	max_detection_distance 	= 350.0,
	vision_radius_coef 		= 0,

	effect = "particles/weapons/other/crystalspit_bonus",

	spell_approach_owner_only 	= true,
	spell_approach				= "BonusSpit_HealHull",
	spell_approach_trigger_radius = 20.0,
	spell_approach_respawn_timer = 0, --#54254  бонус должен удалятся
	ttl 						= 45,

	death_effect 				 = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
}



------------------------------------------------
--66856: Зеленые корабли: Разведка активка Зеленые выбросы
Def.Module_FuelEmissions =
{
	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 60,

	cooldown				= 10,
	spell					= "Spell_FuelEmissions",

	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/el_modules/fuel_em",
}

Def.Module_GreenBeacon =
{
	class 				= "ActiveModule",
	in_editor			= false,
	cooldown			= 30,

	--activate_entity_max 		= 1, -- максимум 8
	--activate_entity_ttl 		= 30,
	--activate_entity_health 	= 3000,
	energy_cost 			= 10,
	--energy_cost_per_second	= 50.0,
	check_spawn_collision 		= true,

	spell				= "Spell_GreenBeacon",
	--activate_entity		= "HealBot",
	item_subtype			= ItemSubtype.GreenBeacon,
	spawn_offset 			= Vec3( 0, -3, 1 ),
	model 					= "models/weapons/plasma/power/vortex",

	activate_sound 			= "sound/gadgets/warpgate/wg_activate",
}
Def.SpyGreenBeacon =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= true,
	health 				= 1750,
	--model				= "models/weapons/drones/spyradar/spyradar",
	model				= "particles/models/green_beacon",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	hudType 			= "default",
	uiName 				= "Module_SpyBeaconGreen",
	uiDesc 				= "Module_SpyBeaconGreen_Desc",
	children =
	{
		{ effect		= "particles/other/green_beacon" }, -- joint = "g1_m"
	},
	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
}
-----------------------------------
--#66724: Зеленые корабли: Разведка Дрон-компаньон
Def.Module_Companion =
{
	class 					= "CompanionDroneModule",
	in_editor 				= false,

	energy_cost				= 10,
	cooldown				= 40,

	activate_entity			= "Companion",
	spell_when_module		= "Companion_Buff", -- спелл должен работать только пока дрон "прицеплен"

	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/destroyer/TRay_fire",

}

Def.Companion =
{
	class					= "GuidedDrone",
	in_editor				= false,

	--model					= "models/weapons/drones/sentry_drone/sentry_drone",
	model					= "models/objects/green_drones/dron_shooter", -- too small 1.2
	physics					= { solid_type = solid.model, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },

	death_effect			= "particles/explosions/shp_exp_mid_alien",
	death_sound				= "sound/explosion/drone_expl",

	projectile				= "Projectile_SentryDron",
	shot_effect 			= "particles/weapons/drongun/muzzle",

	shot_once_sound 		= "sound/weapons/turret/turret_oneshot",

	signature				= ai.Signature.TINY,
	health 					= 500, --500

	max_speed				= 55,--65,
	acceleration			= 65*0.9,
	max_rot_speed			= 360*0.85*0.9,	-- deg per second --
	max_aim_rot_speed		= 720,  -- скорость поворота дрона по его оси  -- если меньше 400 то дрон иногда не успевает доворачивать и никогда не стреляет.

	weapon_slots			= 1,
	primary_weapon			= "Weapon_Companion",

	damage_emp				= 10,

	control_range			= 160,--500,
	--fire_rate				= 1,
	--dispersion				= 3,
	--optimal_range			= 30,
	--max_range				= 300,
	--projectile_speed		= 100,

	teleport_dist			= 300,--500,		-- расстояние с которого дрон телепортируется, если следует за кораблем, работает только если есть CompanionDroneModule
	spell 					= "Companion_Debuff",		-- спел который накладывает дрон на target, работает только если есть CompanionDroneModule

	uiName 					= "Companion_name",
	children 			=
		{
				{ 	effect	="particles/gadget/drone_shooter_engine", joint = "fx1" },
		},
}
Def.Weapon_Companion = {
	inherit					= "Weapon_AutoGun",
	fire_rate				= 90,
	projectile_speed		= 400,
	dispersion				= 2,
	optimal_range			= 120,
	max_range				= 200,
	crit_chance				= 0,
	crit_damage				= 0,
--	model="models/weapons/plasma/econom/pl_training"
	--weapon_class=ai.WeaponClass.PLASMAGUN
	projectile				= "Projectile_HeatingGun",
	shot_effect 			= "particles/weapons/alien/heatinggun_muzzle",
	muzzleflash_color = { kinetic = "130 255 172 48", emp = "130 255 172 48", thermal = "130 255 172 48", },
	muzzleflash_radius 		= 8,
}


--#65308: Активный модуль для разведчика 8 ранг Федерация
Def.Module_AoeStealthDrone =
{
	cooldown = 40,
	energy_cost = 40,
	spell= "Spell_AoeStealthDrone",
	activate_entity_health = 2000,
	check_spawn_collision = true,
--	inherit = "Module_HealBot",
	item_subtype = ItemSubtype.CloakingDevice,
--	activate_sound 			= "",

	class 				= "ActiveModule",
	in_editor			= false,
	check_spawn_collision 		= true,
	spawn_offset 			= Vec3( 0, -3, 1 ),
}

Def.AoeStealthDrone =
{
	inherit 			= "SpyBeacon",
	uiName 				= "Module_AoeStealthDrone",
	uiDesc 				= "Module_AoeStealthDrone_Desc",
	--model				= "models/shields/sphere_stealth",
	--physics			= { solid_type = solid.none, static = true },
	model				= "models/modules/cloaking_field_generator/cloaking_field_generator",
	default_custom_elements = {"Modules_CloakingFieldGenerator_r1", "Modules_CloakingFieldGenerator_g1", "Modules_CloakingFieldGenerator_b1"}, --работает ли?
}

Def.Module_ScoutChameleon =
{
	class 					= "ActiveModule",
	in_editor 				= false,

	cooldown 				= 20,
	energy_cost 			= 40,
	spell					= "Spell_ScoutChameleon",
	additional_spell		= "ScoutChameleonSmallWarp",
	
	is_fast_movement		= true,
}

--#65300: Пассивный модуль (двигатель) для разведчика Федерация
Def.Module_Movement_Damage_Buff =
{

	spell_on_max_speed_plus			= "Spell_Movement_Damage_Buff",
	max_speed_percent		= 0.9,
	cooldown				= 1.5,

	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	in_editor				= false,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",
	unique_equip			= true,
}

Def.Module_DestrMovementRestrictor =
{
	class			= "FiringModule",
	in_editor 		= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2000*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 6000,
	module_death_effect 	= "particles/explosions/huge_capacitor_expl_hemisphere",
	--model 			= "models/turret/huge_active_module/huge_active_module",
	model 			= "models/turret/huge_module_mt13_g/mt13_g",
	death_wreck  	= "Module_Wreck",

	track 			= ai.TrackMode.AIM,
	--check_aim_orientation = true,
	check_aim_orientation_angle = 110,
	barrel_rot_speed = 90,
	-- stop_barrels	= ai.BarrelsStopMode.ACTIVE,
	cooldown 		= 60,
	--cooldown 		= 10,
	energy_cost 	= 15,

	projectile 			= "Projectile_DestrMovementRestrictor",
	projectile_speed 	= 350,

	optimal_range		= 308,
	max_range			= 410,

	muzzleflash_color = { kinetic = "220 78 53 100", emp = "220 78 53 100", thermal = "220 78 53 100", },
	muzzleflash_radius = 25,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 0,
	shot_once_sound 	= "sound/gadgets/MovementRestrictor/mr_fire",
	shot_effect 		= "particles/weapons/big/restrictor_muzzle",
	--shot_beam_fx		= "particles/weapons/big/gravy_stick_beam",
}

Def.Projectile_DestrMovementRestrictor =
{
	--inherit				= "Weapon_BaseRocket",
	inherit				= "Projectile_SingularityCannon",
	--detonation_radius	= 0.1,

	flare_color			= "0 0 255 25",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,


	spell_on_launch	= "MovementLeadsToDamage", ---EDIT!!!!!!!!!

	work_sound 	    	= "sound/gadgets/Vortex/vortex_fly",
	effect 				= "particles/weapons/big/restrictor_projectile",
	singularity_hit_fx 	= "particles/empty",
	hit_effect			= "particles/weapons/big/restrictor_explosion",

	--explosion_blast_wave 		= "Blastwave_Scream",
	--override_blast_wave_damage	= true,
	kill_effect_on_remove 		= false,

}

Def.Module_ShieldHealOnEnemyDeath =
{
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	in_editor				= false,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "SHIELD_MOD",

	spell_on_death_someone	= "ShieldHealOnEnemyDeath",
	spell_on_death_trigger_target	= --здесь нужен area = ai.SpellTargetArea.AROUND к spell_on_death_trigger_range
	{
		class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area = ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL + ai.SpellTargetRelationship.ALLY,
		vitality = ai.SpellTargetVitality.DEAD,
	},
	spell_on_death_trigger_range	= 300,
}

Def.Module_CommandCritAura =
{
	class 				= "ActiveModule",
	in_editor			= false,
	cooldown			= 45,
	energy_cost			= 205,
	model				= "models/modules/m_active/m_a_gadget_buff",
	module_type			= ai.ModuleType.ACTIVE,
	spell_on_equip		= "EquippedPassiveCommandCrit",
	spell				= "ActiveCommandCrit",
	activate_sound		= "sound/gadgets/CommandCrit/CommandCrit",
	activate_effect		= "particles/gadget/jericho_module_activation",
	item_subtype		= ItemSubtype.CommandCritAura,
}

Def.Module_UrgentCapacitorCharge =
{
	spell_on_max_energy_minus			= "UrgentCapacitorCharge",
	max_energy_percent		= 0.2,
	cooldown				= 28,

	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	in_editor				= false,
	max_energy_spell_cancel = false,
	hide_diminishing_string = true,
	unique_equip			= true,
}

Def.Module_OrbofJeriho =
{
	class			= "FiringModule",
	in_editor 		= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2000*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 6000,
	module_death_effect 	= "particles/explosions/huge_capacitor_expl_hemisphere",
	--model 			= "models/turret/huge_active_module/huge_active_module",
	model 			= "models/turret/huge_module_mt13_g/mt13_g",
	death_wreck  	= "Module_Wreck",

	track 			= ai.TrackMode.AIM,
	--check_aim_orientation = true,
	check_aim_orientation_angle = 110,
	barrel_rot_speed = 90,
	-- stop_barrels	= ai.BarrelsStopMode.ACTIVE,
	cooldown 		= 6,
	--cooldown 		= 10,
	energy_cost 	= 15,

	projectile 			= "Projectile_OrbofJeriho",
	projectile_speed 	= -75,
	projectile_power_charge_coef = 3,
	projectile_spell_charge_coef = 1.5, --коэфициент на который домножится influence_param в спеле из прожектайла
	max_range			= 410,

	muzzleflash_color = { kinetic = "220 78 53 100", emp = "220 78 53 100", thermal = "220 78 53 100", },
	muzzleflash_radius = 25,

	--damage				= 0,
	--damage_kinetic		= 0,
	--damage_emp			= 0,
	--damage_thermal		= 0,
	shot_once_sound 	= "sound/gadgets/IsotopeHarvester/ih",
	--shot_effect 		= "particles/weapons/big/restrictor_muzzle",
	shot_effect 		= "particles/gadget/jericho_module_muzzle",
	--shot_beam_fx		= "particles/gadget/jericho_active_module_beam",
	launch_beam_fx		= "particles/gadget/jericho_module_beam",

	item_subtype		= ItemSubtype.IsotopeHarvester,
	children =
	{
		{
			effect = "particles/gadget/jericho_module_fx",
			joint = "fire_01",
		}
	},
}

Def.Projectile_OrbofJeriho =
{
	inherit				= "Weapon_BaseRocket",
	angular_velocity	= 120,
	is_guided			= true,
	flare_color			= "0 0 255 25",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	missile_detection_immune 	= true,
	disable_concussion_sound = true,
	missile_defence_immune 	= true,

	spell_on_launch		= "OrbofJeriho",

	work_sound 	    	= "sound/gadgets/IsotopeHarvester/ih_sphere_fly",
	effect 				= "particles/gadget/jericho_active_module_sphere",
	--singularity_hit_fx 	= "particles/gadget/jericho_active_module_sphere_end",
	--hit_effect			= "particles/gadget/jericho_active_module_sphere_end",

	kill_effect_on_remove 		= false,
	spell				= "OrbofJerihoHeal",
	charge_spell		= true,
	immunity_to_shooter_time = 0,
}

Def.Module_DestrDeadlyTrap =
{
	class				= "FiringModule",
	in_editor 			= false,

	signature			= ai.Signature.TINY,
	physics 			= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 			= true,
	health 				= 2500*2.6, --500
	health_regen 		= 40*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 		= 6000,
	model 				= "models/turret/biglightninggun/biglightninggun",
	death_wreck  		= "Module_Wreck",

	check_aim_orientation_angle = 100,
	barrel_rot_speed 	= 90,

	cooldown			= 2,
	energy_cost 		= 180,
	track 				= ai.TrackMode.AIM,
	stop_barrels_on_activate = true,
-----
	-- damage				= 0,
	-- damage_kinetic		= 0,
	-- damage_emp			= 0,
	damage_thermal		= 100,

-----
	projectile 			= "Projectile_DestrDeadlyTrap",
	projectile_speed 	= 175,
	max_range			= 400, --350,

	default_icon 		= "ItemSubtype_SpaceMissile_Fireworks",

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 	= 5,
	muzzleflash_time 	= 1.0,
	long_shot_effects 	= true,
	shot_effect 		= "particles/weapons/huge_module_drone/turret_muzzle",
	oriented_shot_effects = false,
	shot_once_sound 	= "sound/weapons/rockets/javelin_launch",
	ammo				= 3,
	ammo_regen_time		= 20,
	
	children =
	{
		{
			effect = "particles/other/gun_lightning",
			joint = "joint2",
		}
	},
}

Def.Projectile_DestrDeadlyTrap =
{
	--inherit				= "Projectile_BasicRailgun",
	inherit				= "Weapon_BaseRocket",
	model				= "models/turret/biglightninggun/h_mine",

	death_entity		= "DestrDeadlyTrap",

	--explosion_blast_wave = "Blastwave_DestrBeamDrone",
	--override_blast_wave_damage = true,

	missile_defence_immune 		= true,
	missile_detection_immune 	= true,

	--detonation_radius	= 10,

	flare_color			= "255 100 100 0",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	effect 				= "particles/weapons/esminec_mine_trail",
	work_sound			= "sound/weapons/rockets/mine_fly",
	--effect 				= "particles/weapons/big/plasma_javelin",
	is_guided = false,
}

Def.DestrDeadlyTrap =
{
	class				= "MineTrap",
	model				= "models/turret/biglightninggun/h_mine",
	signature			= ai.Signature.SMALL,
	health 				= 1750,
	damageable			= true,
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000, },
	target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
	},
	radius				= 50,
	launch_time			= 2.5,
	ttl					= 120,--120
	explosion_on_ttl	= "BlastWaveTrap",
	active_aura			= "MineTrapCloaking",
	spell_aura_target	= true, --может быть целью спелов

	--отображение в HUD
	hudType 			= "default",
	uiName 				= "DestrDeadlyTrap_name",
	default_icon		= "ItemSubtype_DestrDeadlyTrap",

	start_sound 		= "sound/weapons/mine/mine_start",

	spell_on_death		= "SpilledRadioactiveSubstance",
	launch_effect		= "particles/weapons/esminec_mine_activate"
}

Def.BlastWaveTrap =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 1500,
	blast_maxDistance	= 50,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/explosions/explosion_big1",

	sound 				= "sound/explosion/mine_expl",
}

Def.Module_EnemyResistReductor =
{
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	in_editor				= false,
	spell_on_equip			= "EnemyResistReduction",
	unique_equip			= true, --не более одного в вооружении
}

Def.Module_BarrelDistractionShot =
{
	class 				= "ActiveModule",
	in_editor			= false,
	cooldown			= 45,
	energy_cost			= 205,
	model				= "models/modules/m_active/m_a_gadget_buff",
	module_type			= ai.ModuleType.ACTIVE,
	spell				= "BarrelShotAndSelfBuff",
	activate_sound          	= "sound/gadgets/common_activate",
	--activate_effect		= "particles/gadget/jericho_module_activation",
}

Def.Module_ExtendedBallisticsCPU =
{
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	in_editor				= false,
	item_subtype			= ItemSubtype.ExtendedBallisticsCPU,
	spell_on_kill			= "ExpertShooter",
	unique_equip			= true, --не более одного в вооружении
}

Def.Module_AoEPassiveHeal = --#73108 лечить щиты и корпус всех вокруг для тира 1
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	in_editor				= false,
	spell_on_equip			= "PassiveHealoverTime",
	item_subtype			= ItemSubtype.AoEHealPassive,
	uiName					= "itemSubType_AoEPassiveHeal",
	uiDesc					= "itemSubType_AoEPassiveHeal",
}

Def.Module_AoEPassiveHeal_T2 = --#73108 лечить щиты и корпус всех вокруг для тира 2
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	in_editor				= false,
	spell_on_equip			= "PassiveHealoverTime_T2",
	item_subtype			= ItemSubtype.AoEHealPassive,
	uiName					= "itemSubType_AoEPassiveHeal",
	uiDesc					= "itemSubType_AoEPassiveHeal",
}

Def.Module_AoEPassiveHeal_T3 = --#73108 лечить щиты и корпус всех вокруг для тира 3
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	in_editor				= false,
	spell_on_equip			= "PassiveHealoverTime_T3",
	item_subtype			= ItemSubtype.AoEHealPassive,
	uiName					= "itemSubType_AoEPassiveHeal",
	uiDesc					= "itemSubType_AoEPassiveHeal",
}

Def.Module_AoEDamageOverFirerate = --#73108 увеличить дамаг, снизить fire rate
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	in_editor				= false,
	spell_on_equip			= "DamageOverFirerate",
	item_subtype			= ItemSubtype.AoEDamageOverFirerate,
	work_beam_fx			= "particles/gadget/exhaustion_beam",
}

Def.Module_BotToughtnessOnActivation = --#73108 увеличение резистов щита и корпуса всем вокруг если подбит
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	activate_module_effect = "particles/gadget/default_module_work",
	class = "ActiveModule",
	cooldown = 4,
	in_editor = false,
	model = "models/modules/m_active/m_a_gadget_buff",
	module_type = ai.ModuleType.ACTIVE,
	spell = "FillerHealSpell",
	additional_spell = "BotShieldUp",
	item_subtype = ItemSubtype.ToughnessOnHullLoss,
}

Def.Module_BotToughtnessOnNonStopActivation = --#73108 увеличение резистов щита и корпуса всем вокруг по CD
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	inherit = "Module_BotToughtnessOnActivation",
	spell = "FillerDamageSpell",
	item_subtype = ItemSubtype.ToughnessOnCD,
}

Def.Module_BotGivesStealthToAllies =  --#73108 стелс всех вокруг, кроме себя
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	activate_module_effect = "particles/gadget/default_module_work",
	class = "ActiveModule",
	cooldown = 20,
	in_editor = false,
	model = "models/modules/m_active/m_a_gadget_buff",
	module_type = ai.ModuleType.ACTIVE,
	spell = "FillerDamageSpell", --основной спелл, пока там ауры, которые знает бот, он будет юзать модуль
	additional_spell = "BotAoEStealthExceptSelf", --спелл со стелсом
	item_subtype = ItemSubtype.BotAoEStealth,
	uiName = "itemSubType_BotAoEStealth",
	uiDesc = "itemSubType_BotAoEStealth",
}

Def.Module_BotPullsTarget = --#73108 притягивание цели к кастеру, АоЕ дамаг около кастера
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	activate_module_effect = "particles/gadget/default_module_work",
	class = "ActiveModule",
	cooldown = 15,
	in_editor = false,
	model = "models/modules/m_active/m_a_gadget_buff",
	module_type = ai.ModuleType.ACTIVE,
	spell = "FillerDamageSpell", --основной спелл, пока там ауры, которые знает бот, он будет юзать модуль
	additional_spell = "BotPullsTarget", --спелл с притягиванием и АоЕ дамагом
	item_subtype = ItemSubtype.PullTarget,
	uiName 		 = "itemSubType_PullTarget",
	uiDesc       = "itemSubType_PullTarget",
}

Def.Module_BotPullsTarget_T2 = --#73108 притягивание цели к кастеру, АоЕ дамаг около кастера
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	activate_module_effect = "particles/gadget/default_module_work",
	class = "ActiveModule",
	cooldown = 15,
	in_editor = false,
	model = "models/modules/m_active/m_a_gadget_buff",
	module_type = ai.ModuleType.ACTIVE,
	spell = "FillerDamageSpell", --основной спелл, пока там ауры, которые знает бот, он будет юзать модуль
	additional_spell = "BotPullsTarget_T2", --спелл с притягиванием и АоЕ дамагом
	item_subtype = ItemSubtype.PullTarget,
	uiName 		 = "itemSubType_PullTarget",
	uiDesc       = "itemSubType_PullTarget",
}

Def.Module_BotPullsTarget_T3 = --#73108 притягивание цели к кастеру, АоЕ дамаг около кастера
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	activate_module_effect = "particles/gadget/default_module_work",
	class = "ActiveModule",
	cooldown = 15,
	in_editor = false,
	model = "models/modules/m_active/m_a_gadget_buff",
	module_type = ai.ModuleType.ACTIVE,
	spell = "FillerDamageSpell", --основной спелл, пока там ауры, которые знает бот, он будет юзать модуль
	additional_spell = "BotPullsTarget_T2", --спелл с притягиванием и АоЕ дамагом
	item_subtype = ItemSubtype.PullTarget,
	uiName 		 = "itemSubType_PullTarget",
	uiDesc       = "itemSubType_PullTarget",
}

Def.Module_BotHacksEnemies = --#73108 модуль на помехи у целей в некотором радиусе вокруг кастера
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	activate_module_effect = "particles/gadget/default_module_work",
	class = "ActiveModule",
	cooldown = 15,
	in_editor = false,
	model = "models/modules/m_active/m_a_gadget_buff",
	module_type = ai.ModuleType.ACTIVE,
	spell = "FillerDamageSpell", --основной спелл, пока там ауры, которые знает бот, он будет юзать модуль
	additional_spell = "BotHackSystems", --спелл с помехами
	item_subtype = ItemSubtype.HackEnemies,
	uiName		 = "itemSubType_HackEnemies",
	uiDesc		 = "itemSubType_HackEnemies",
}

Def.Module_AoEPassiveDamage = --#73108 дамагать всех вокруг
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	in_editor				= false,
	spell_on_equip			= "AoEBotDamage",
	item_subtype			= ItemSubtype.AoEBotDamage,
	uiName					= "itemSubType_AoEBotDamage",
	uiDesc					= "itemSubType_AoEBotDamage",
}

Def.Module_AoEPassiveDamage_T2 = --#73108 дамагать всех вокруг
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	in_editor				= false,
	spell_on_equip			= "AoEBotDamage_T2",
	item_subtype			= ItemSubtype.AoEBotDamage,
	uiName					= "itemSubType_AoEBotDamage",
	uiDesc					= "itemSubType_AoEBotDamage",
}

Def.Module_AoEPassiveDamage_T3 = --#73108 дамагать всех вокруг
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	in_editor				= false,
	spell_on_equip			= "AoEBotDamage_T3",
	item_subtype			= ItemSubtype.AoEBotDamage,
	uiName					= "itemSubType_AoEBotDamage",
	uiDesc					= "itemSubType_AoEBotDamage",
}

Def.Module_SpeedHealOnAssist = --прототип модуля на командный штурмовик с выбором цели-союзника
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	activate_module_effect = "particles/gadget/default_module_work",
	class = "ActiveModule",
	cooldown = 5,
	in_editor = false,
	model = "models/modules/m_active/m_a_gadget_buff",
	module_type = ai.ModuleType.ACTIVE,
	spell = "SpeedHealOnAssist",
	item_subtype = ItemSubtype.HackEnemies, --заменить
}

Def.Module_ShieldedTaunt = --#73982
{
	class = "ActiveModule",
	cooldown = 15,
	in_editor = false,
	spell = "ShieldedTaunt",
	additional_spell = "AoETaunt_ShieldHeal_OnCaster",
	item_subtype = ItemSubtype.ShieldedTaunt,
	model = "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_ProtectiveShield =
{
	class = "ActiveModule",
	cooldown = 15,
	in_editor = false,
	spell = "ProtectiveShield",
	item_subtype = ItemSubtype.ProtectiveShield,
	additional_spell = "ProtectiveShieldRegen",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 				= "sound/gadgets/ProtectiveShield/ps",

}

Def.Module_SystemsRecharger = --#73951
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	in_editor				= false,
	item_subtype			= ItemSubtype.SystemsRecharger,
	module_deploy_cooldown_mul			= -0.25,
	module_deploy_energy_cost_mul			= 0.25,
}

Def.Module_SpaceShift =
{
	cant_be_bought 		= true,
	--hide_from_player	= true,

	class				= "ActiveModule",
	cooldown 			= 26,
	in_editor			= false,
	module_type			= ai.ModuleType.ACTIVE,
	spell 				= "SpaceShiftWarp",
	additional_spell	= "SpaceShiftInvisibility",
	item_subtype		= ItemSubtype.SpaceShift,
	default_icon		= "ItemSubtype_SpaceShift",

	item_lvl			= 21,
	rank				= 10,
	energy_cost			= 106,
	required_role		= ai.ShipRoles.SCOUT,
	class_mask			= ai.ShipClass.SMALL,
	required_ship		= "Ship_Race1_L_T4_CraftUniq_small",

	is_fast_movement	= true,
}

Def.Module_SmallSpiralMine =
{
	cant_be_bought 		= true,
	class 		= "ActiveModule",
	in_editor	= false,
	cooldown	= 9,
	activate_entity = "SmallSpiralMine",
	activate_entity_max = 3,
	spawn_offset = Vec3( 0, -3, 1 ),
	spawn_dir_to_aim = true,
	item_subtype		= ItemSubtype.SmallSpiralMine,

	item_lvl			= 21,
	rank				= 10,
	energy_cost			= 106,
	required_role			= ai.ShipRoles.SCOUT,
	class_mask			= ai.ShipClass.SMALL,
	required_ship			= "Ship_Race1_L_T4_CraftUniq_small",
	default_icon		= "ItemSubtype_SmallSpiralMine",
	activate_sound 			= "sound/gadgets/SpiralMine/sm_start",
}

Def.SmallSpiralMine =
{
	class				= "MineTrap",
	model				= "models/turret/biglightninggun/h_mine",
	signature			= ai.Signature.SMALL,
	health 				= 1750,
	damageable			= true,
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000, },
	target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
	},
	radius				= 40,
	launch_time			= 1.0,
	ttl					= 120,
	explosion_on_ttl	= "BlastWave_SmallSpiralMine",
	active_aura			= "SmallSpiralMineCloaking",
	spell_aura_target	= true, --может быть целью спелов

	--отображение в HUD
	hudType 			= "default",
	uiName 				= "DestrDeadlyTrap_name",
	default_icon		= "ItemSubtype_DestrDeadlyTrap",

	-- start_sound 		= "sound/weapons/mine/mine_start",
	launch_effect		= "particles/gadget/mine_deploy",
	default_icon		= "ItemSubtype_SmallSpiralMine",
}

Def.BlastWave_SmallSpiralMine =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 4400,
	blast_maxDistance	= 40,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/explosions/explosion_big1",

	sound 				= "sound/explosion/mine_expl",
}

Def.Module_Overshield =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,

	class				= "FiringModule",

	cooldown			= 20,
	energy_cost 		= 100.0,
	hull_cost			= 200,

	projectile 			= "Projectile_Overshield",
	projectile_speed 	= 300,
	track 				= ai.TrackMode.AIM,

	dispersion			= 0,

	optimal_range		= 375,
	max_range			= 500,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 0,
	shot_once_sound = "sound/el_modules/overshield_shot",
}

Def.Projectile_Overshield =
{
	--inherit				= "Weapon_BaseRocket",
	inherit				= "Projectile_SingularityCannon",
	--detonation_radius	= 0.1,

	flare_color			= "0 0 255 25",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,

	spell_on_launch	= "ShieldUpMult", --!!!

	work_sound 	    = "sound/el_modules/overshield_fly",
	effect 			= "particles/gadget/alien_mass_shield_projectile",
	hit_effect	= "particles/gadget/alien_mass_shield_death",

	--explosion_blast_wave 		= "Blastwave_Scream",
	--override_blast_wave_damage	= true,
	kill_effect_on_remove 		= true,
}

Def.Module_CleanceTest =
{
	cant_be_bought = true,
	hide_from_player = true,
	class = "ActiveModule",
	cooldown = 5,
	in_editor = false,
	spell = "CleanseTarget",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 				= "sound/gadgets/common_activate",
	item_subtype = ItemSubtype.SystemsRecharger,
}

Def.Module_StunTest =
{
	cant_be_bought = true,
	hide_from_player = true,
	class = "ActiveModule",
	cooldown = 2,
	in_editor = false,
	spell = "CommandShieldEnemyEnergySink",
	-- model = "models/modules/m_active/m_a_gadget_pulsar",
	-- activate_sound 				= "sound/gadgets/common_activate",
	item_subtype = ItemSubtype.SystemsRecharger,
}

Def.Module_SelfStunTest =
{
	cant_be_bought = true,
	hide_from_player = true,
	class = "ActiveModule",
	cooldown = 5,
	in_editor = false,
	spell = "StunSelfTest",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 				= "sound/gadgets/common_activate",
	item_subtype = ItemSubtype.SystemsRecharger,
}

Def.Module_GreenRegenShield = --#70965
{
	class 						= "SpaceShipModule",
	in_editor					= false,
	max_shield_percent			= 0.4,
	max_shield_activation_time	= 0.5,
	spell_on_max_shield_plus	= "GreenRegenShield",
	item_subtype 				= ItemSubtype.HackSystems,
	module_type					= ai.ModuleType.SHIELD_MOD,
}

Def.Module_EmergencyTeleporter = --#71644
{
	class = "ActiveModule",
	cooldown = 5,
	hull_cost = 500,
	in_editor = false,
	spell = "EmergencyTeleportHolder",
--	additional_spell = "EmergencyTeleportHolder_",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 				= "sound/gadgets/common_activate",
	item_subtype = ItemSubtype.HackSystems,
}

Def.Module_GreenGravyPush =
{
	class = "ActiveModule",
	cooldown = 5,
	hull_cost = 2000,
	spell = "GreenGravyPush", --"GreenGravyPushMult",
	--additional_spell = "GreenGravyPush_ScrapRegen",
	item_subtype = ItemSubtype.HackSystems,
	activate_sound = "sound/el_modules/GreenGravyPush",
}

Def.Module_ShieldRegenRedirect =
{
	cant_be_bought 			= true,
	hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	in_editor				= false,
	item_subtype			= ItemSubtype.SystemsRecharger,
	shield_to_hull_regen_transfer_coef = 0.5,
	unique_equip			= true,
}

Def.Module_HeatGunControl = --#77431
{
	-- cant_be_bought 			= true,
	-- hide_from_player		= true,
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	in_editor				= false,
	item_subtype			= ItemSubtype.HeatGunControl,
	heat_add_mul			= -2,
	damage_mul				= -0.0526,
	unique_equip			= true,
}

Def.Module_CrystallRedirect =
{
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	in_editor				= false,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "SHIELD_MOD",

	spell_on_death_someone	= "CrystallRedirectMult",
	spell_on_death_trigger_target	= --здесь нужен area = ai.SpellTargetArea.AROUND к spell_on_death_trigger_range
	{
		class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area = ai.SpellTargetArea.AROUND,
		-- relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality = ai.SpellTargetVitality.DEAD,
	},
	spell_on_death_trigger_range	= 175,
	unique_equip			= true,
}


Def.Module_HullTransfer =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	item_subtype			= ItemSubtype.SystemsRecharger,
	cooldown 				= 5,
	spell					= "HullTransfer",
	trigger_aura 			= true,
	spell_on_equip_inactive	= "SelfPassiveHullTransferRepl",
	work_beam_fx = "particles/gadget/heal_ray",

	activate_sound 	=	 "sound/el_modules/HullTransfer",


}

Def.Module_HullTransferSoundTest =
{
	inherit					= "Module_HullTransfer",
	spell					= "HullTransferTest",
}

Def.Module_HullResistStation =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	item_subtype			= ItemSubtype.HackSystems,
	cooldown 				= 10,
	hull_cost				= 250,
	spell					= "HullResistAoe",
	activate_entity_health	= 2000,
	check_spawn_collision	= true,
	spawn_offset			= Vec3(0, -3, 1),
	activate_sound 	=	 "sound/gadgets/FrigateDrone/fd_launch",
	default_custom_elements =
	{
		[ai.VesselCustomSlot.MATERIAL_0] = "Default_r5_l_t1_b1",
		[ai.VesselCustomSlot.MATERIAL_1] = "Default_r5_l_t1_r1",
		[ai.VesselCustomSlot.MATERIAL_2] = "Default_r5_l_t1_g1",
	}
}

Def.HullResistStation =
{
	inherit 			= "SpyBeacon",
	uiName 				= "Module_HullResistStation",
	uiDesc 				= "Module_HullResistStation_Desc",
	-- model				= "models/modules/cloaking_field_generator/cloaking_field_generator",
	model				= "models/modules/m_active/elidium_modules/protector_device",
	death_effect        = "particles/explosions/shp_exp_mid_alien",
	death_sound			= "sound/explosion/HullResistStation",
}

Def.Module_GreenPlatform =
{
	inherit 				= "Module_SentryDrone",
	activate_entity			= "GreenPlatform",

	fire_rate				= 12,
	dispersion				= 0,
	optimal_range			= 300,
	max_range				= 350,


	--projectile_speed		= 250,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 200,
	damage_thermal			= 0,
	max_aim_rot_speed		= 15,
	projectile_speed		= 85,
}

Def.GreenPlatform =
{

	inherit 				= "SentryDrone",
	model					= "models/ships/race_5/l/r5_l_t1_station_mod0",
	-- active_spell			= 'Tackler_DisableJump',
	--хотел ракету но она не летает
	--projectile				= "SpaceMissile_SD_RL",
	--projectile				= "Projectile_SentryDron",
	projectile				= "Projectile_Plasma_Heavy",
	uiName 					= "SentryDroneRL_name",
	children 	= {
	
		{ model ="models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs", joint = "main" },
		{ model ="models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs", joint = "main_b" },
		{ model ="models/ships/race_5/l/r5_l_t1_station_mod1_2_stubs", joint = "main" },
		{ model ="models/ships/race_5/l/r5_l_t1_station_mod1_2_stubs", joint = "main_b" },
		{ model ="models/ships/race_5/l/r5_l_t1_station_mod1_3_stubs", joint = "main" },
		{ model ="models/ships/race_5/l/r5_l_t1_station_mod1_3_stubs", joint = "main_b" },
		{ model ="models/ships/race_5/l/r5_l_t1_station_mod23_stubs", joint = "main" },
		
		{ model ="models/weapons/wazgot_station_guns/station_turret", joint = "turret_fl" },
		{ model ="models/weapons/wazgot_station_guns/station_turret", joint = "turret_fr" },
		{ model ="models/weapons/wazgot_station_guns/station_turret", joint = "turret_bl" },
		{ model ="models/weapons/wazgot_station_guns/station_turret", joint = "turret_br" },
		
		-- { model ="models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs_turret", joint = "turret_fl" },
		-- { model ="models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs_turret", joint = "turret_fr" },
		-- { model ="models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs_turret", joint = "turret_bl" },
		-- { model ="models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs_turret", joint = "turret_br" },
		
		{ model ="models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs_turret", joint = "gun_l" },
		{ model ="models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs_turret", joint = "gun_r" },
	
	},
}

Def.Module_GreenBattleStation =
{
	cant_be_bought = true,
	hide_from_player = true,
	class = "BattleStationModule",
	--required_ship = "Ship_Race5_L_ENGINEER_Rank5",
	mark = 7,
	price = 10000,
	premiumPrice = 200,
	tier = 5,
	item_lvl = 30,
	rank = 15,
	-- storeItemId = 1000,
	ods_export = true,
	
	module_type = ai.ModuleType.ACTIVE,
	item_subtype = ItemSubtype.GreenBattleStation,
	station = "GreenBattleStation",
	spawn_offset = Vec3( 0, -6, -15 ),
	
	cooldown 	= 15,
	energy_cost = 400,
	hull_cost 	= 1000,
	
	default_icon = "ItemSubtype_GreenPlatform",
	activate_sound = "sound/el_modules/ElCommonActivate",	
--	additional_cmd_activate_sound = "sound/destroyer/RocketSilo_launch",
	additional_cmd_ui_name = "BattleStation",
}


Def.GreenBattleStation =
{
	fire_sectors = {2,1,1,2,2,2,2,1,1,2},
	class = "BattleStation",
	model = "models/ships/race_5/l/r5_l_t1_station_mod0",
	physics = { solid_type = solid.model, static = true, mass = 90000000, material = "Metal", damping = 0.95,},
	health = 12000, -- позже переопределится, здесь для "проверяльщиков".
	orphan_spell = "BattleStation_SlowMode",
	hudType = "default",
	damageable = true,
	signature	=	ai.Signature.MEDIUM,
	owner_distance = 200, -- максимальное расстояние до хозяина, на котором станциия находится в "активном сотсоянии" (лечится, строится и т.п.)
	orphan_time = 40, -- время через которое станция самоуничтожится, если хозяин находится за пределами owner_distance
	appear_time = 2, -- время появления из эффекта стелса при спавне
	death_wreck = "",
	death_sound = "sound/explosion/ship_big_expl",
	--test
	--owner_distance = 1, 
	--orphan_time = 10,
	--death_blast_wave = "BlastWave_ProximityMineGreen_T3",
	death_effect = "particles/explosions/objects/greenbattlestation_explosion",
	uiName = "GreenBattleStation",
	
	broken_parts = 
	{
		{ def = "Wreck_Station",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1, dumping = 1.0, speed = 0, speed_deviation = 0, speed_inherit = 1, ttl = 5, },
	},
	
	slots =
	{
		{
			bones = { 
				{ "gun_r", "gun_l" } 
			},
		},
		{
			bones = { 
				{"turret_fl", "turret_fr", "turret_bl", "turret_br"},
				{ "main", "main_b" },
			},
			stub = {
				"models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs_turret",
				"models/ships/race_5/l/r5_l_t1_station_mod1_stubs",
			}
		},
		{
			bones = { {"main"} },
			stub = {"models/ships/race_5/l/r5_l_t1_station_mod23_stubs"},
		},
	},

	upgrades =
	{
		{
			health = 12000,
			heal_cost = 130,
			heal_speed = 300,
			modifications = -- список дефов возможных модификаций, одна из них будет выбрана при апгрейде до этого (не следующего) уровня
			{
				{ 
					def = "Weapon_PlatformDefaultLaser", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/weapons/wazgot_station_guns/station_laser1", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 0, -- слот, в который устанаваливатся эта модификация

				},
			},
		},
		{
			health = 15000,
			heal_cost = 130,
			heal_speed = 373,
			build_cost = 25, -- количество энергии в секунду, расходуемое хозяином на строительство апгрейда станции
			build_time = 10, -- время апгрейда
			modifications = -- список дефов возможных модификаций, одна из них будет выбрана при апгрейде до этого (не следующего) уровня
			{
				{ 
					def = "Weapon_PlatformRailGun", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/weapons/wazgot_station_guns/station_kinetic", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 0, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage1",
				},
				{ 
					def = "Weapon_PlatformPlasmaGunExplosive", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/weapons/wazgot_station_guns/station_torped", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 0, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage1",
				},
				{ 
					def = "Weapon_PlatformLaserShortRange", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/weapons/wazgot_station_guns/station_laser2", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 0, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage1",
				},
				{ 
					def = "Weapon_PlatformPlasmaGunShortRange", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/weapons/wazgot_station_guns/station_plasm", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 0, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage1",
				},
			},
		},
		{
			health = 20000,
			heal_cost = 190,
			heal_speed = 400,
			build_cost = 25, -- количество энергии в секунду, расходуемое хозяином на строительство апгрейда станции
			build_time = 10, -- время апгрейда
			modifications = -- список дефов возможных модификаций, одна из них будет выбрана при апгрейде до этого (не следующего) уровня
			{
				{ 
					def = "Turret_Platform", -- дефы модификаций должны быть без моделей! Кроме турелей, у турелей должны быть модели в дефе
					models =
					{
						"models/weapons/wazgot_station_guns/station_turret", -- модели для групп костей, должно быть равно количеству групп
						"models/ships/race_5/l/r5_l_t1_station_mod1_1",
					},
					slot = 1, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage2_3",
				},
				{ 
					def = "PlatformModule_SelfShield", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs_turret",
						"models/ships/race_5/l/r5_l_t1_station_mod1_2", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 1, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage2_3",
				},
				{ 
					def = "PlatformModule_SelfResist", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_5/l/r5_l_t1_station_mod1_1_stubs_turret",
						"models/ships/race_5/l/r5_l_t1_station_mod1_3", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 1, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage2_3",
				},
			},
		},
		{
			health = 25000,
			heal_cost = 130,
			heal_speed = 450,
			build_cost = 25, -- количество энергии в секунду, расходуемое хозяином на строительство апгрейда станции
			build_time = 10, -- время апгрейда
			modifications = -- список дефов возможных модификаций, одна из них будет выбрана при апгрейде до этого (не следующего) уровня
			{
				{ 
					def = "PlatformModule_EnemySlowField", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_5/l/r5_l_t1_station_mod3_1",
					},
					slot = 2, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage2_3",
				},
				{ 
					def = "PlatformModule_AllyRepairField", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_5/l/r5_l_t1_station_mod2_1",
					},
					slot = 2, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage2_3",
				},
				{ 
					def = "PlatformModule_AllyShieldEmitterField", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_5/l/r5_l_t1_station_mod2_2",
					},
					slot = 2, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage2_3",
				},
				{ 
					def = "PlatformModule_AllyEnergyEmitterField", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_5/l/r5_l_t1_station_mod2_3",
					},
					slot = 2, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage2_3",
				},
				{ 
					def = "PlatformModule_AntiFocusField", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_5/l/r5_l_t1_station_mod3_2",
					},
					slot = 2, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/station/stage2_3",
				},
			},
		}
	}
}

Def.Turret_Platform =
{
	class = "Turret",
	damage_emp = 275,
	damage_kinetic = 0,
	damage_thermal = 0,
	-- damageable = true,
	death_effect = "particles/explosions/objects/explosion_tiny",
	death_sound = "sound/explosion/turret_expl",
	dispersion = 0,
	fire_rate = 60,
	health = 1,
	-- hudType = "default",
	-- hud_visibility_type = "minor",
	max_range = 250,
	max_rot_speed = 90,
	
	model = "models/weapons/wazgot_station_guns/station_turret",
	
	optimal_range = 250,
	-- physics = 
	-- {
		-- material = "Metal",
		-- solid_type = 1,
		-- static = true,
	-- },
	projectile = "Projectile_TurretPlatform",
	projectile_speed = 300,
	-- relationship_group = 2,
	shot_effect = "particles/weapons/alien/alien_platform_plasma_turret_muzzle",
	shot_once_sound = "sound/weapons/turret/railgun_oneshot",
	uiName = "Turret_Platform",
	default_icon = "Station_ico_Turret_Platform",
	ui_ico 			= { target_system 	= { tex = "Station_ico_Turret_Platform", }, },
}

Def.PlatformModule_SelfShield = --#73192 модуль станции: предотвращение получения станцией урона (шкура-щит)
{
	class					= "SpaceShipModule",
	spell_on_equip			= "GreenPlatform_SelfShield",
	default_icon = "Station_ico_SelfShield",
	ui_ico 			= { target_system 	= { tex = "Station_ico_SelfShield", }, },
	uiName = "PlatformModule_SelfShield",
}

Def.PlatformShellShield = --#73192
{
	class 				= "ScBaseEntity",
	health 				= 500, --
	ttl					= 10,
	damageable			= true,
	network_sync 		= true,
	ui_color			= 0xFFFFCCFF,
}

Def.PlatformModule_SelfResist = --#73192 модуль станции: увеличение прочности станции
{
	class					= "SpaceShipModule",
	spell_on_equip			= "GreenPlatform_SelfResist",
	default_icon = "Station_ico_SelfResist",
	ui_ico 			= { target_system 	= { tex = "Station_ico_SelfResist", }, },
	uiName = "PlatformModule_SelfResist",
}

Def.PlatformModule_EnemySlowField = --#73192 модуль станции: замедляющее поле
{
	class					= "SpaceShipModule",
	spell_on_equip			= "GreenPlatform_EnemySlowField",
	default_icon = "Station_ico_EnemySlowField",
	ui_ico 			= { target_system 	= { tex = "Station_ico_EnemySlowField", }, },
	uiName = "PlatformModule_EnemySlowField",
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3", },
}

Def.PlatformModule_AllyRepairField = --#73192 модуль станции: ремонт корпуса
{
	class					= "SpaceShipModule",
	spell_on_equip			= "GreenPlatform_AllyRepairField",
	default_icon = "Station_ico_AllyRepairField",
	ui_ico 			= { target_system 	= { tex = "Station_ico_AllyRepairField", }, },
	uiName = "PlatformModule_AllyRepairField",
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3", },
}

Def.PlatformModule_AllyShieldEmitterField = --#73192 модуль станции: восполнение щитов
{
	class					= "SpaceShipModule",
	spell_on_equip			= "GreenPlatform_AllyShieldEmitterField",
	default_icon = "Station_ico_AllyShieldEmitterField",
	ui_ico 			= { target_system 	= { tex = "Station_ico_AllyShieldEmitterField", }, },
	uiName = "PlatformModule_AllyShieldEmitterField",
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3", },
}

Def.PlatformModule_AllyEnergyEmitterField = --#73192 модуль станции: восполнение щитов
{
	class					= "SpaceShipModule",
	spell_on_equip			= "GreenPlatform_AllyEnergyEmitterField",
	default_icon = "Station_ico_AllyEnergyEmitterField",
	ui_ico 			= { target_system 	= { tex = "Station_ico_AllyEnergyEmitterField", }, },
	uiName = "PlatformModule_AllyEnergyEmitterField",
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3", },
}

Def.PlatformModule_AntiFocusField = --#73192 модуль станции: предотвращает негативные воздействия
{
	class					= "SpaceShipModule",
	spell_on_equip			= "GreenPlatform_AntiFocusField",
	default_icon = "Station_ico_BattleBuff",
	ui_ico 			= { target_system 	= { tex = "Station_ico_BattleBuff", }, },
	uiName = "PlatformModule_AntiFocusField",
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3", },
}

Def.Module_SelfEcmHackTest =
{
	cant_be_bought = true,
	hide_from_player = true,
	class = "ActiveModule",
	cooldown = 5,
	in_editor = false,
	spell = "EcmHack",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 				= "sound/gadgets/common_activate",
	item_subtype = ItemSubtype.SystemsRecharger,
}

Def.Module_ManueverOnModuleActivation = 
{
	-- cant_be_bought = true,
	-- hide_from_player = true,
	-- class = "SpaceShipModule",
	-- module_type = ai.ModuleType.ENGINE_MOD,
	-- spell_on_equip = "ManueverOnModuleActivation",
	cant_be_bought = true,
	hide_from_player = true,
	class = "ActiveModule",
	cooldown = 5,
	in_editor = false,
	spell = "ManueverOnModuleActivation",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 				= "sound/gadgets/common_activate",
	item_subtype = ItemSubtype.SystemsRecharger,
}

Def.Module_SpikeRam = 
{
	-- cant_be_bought = true,
	-- hide_from_player = true,
	-- class = "SpaceShipModule",
	-- module_type = ai.ModuleType.ENGINE_MOD,
	-- spell_on_equip = "ManueverOnModuleActivation",
	cant_be_bought = true,
	hide_from_player = true,
	class = "ActiveModule",
	cooldown = 5,
	in_editor = false,
	spell = "SpikeRam",
	-- additional_spell = "SpikeRamImmune", --FORTIFICATION, STASIS и INVULNERABILIRY не подходят
	model = "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 				= "sound/gadgets/common_activate",
	item_subtype = ItemSubtype.SystemsRecharger,
}

Def.Module_SpikeRam2 =
{
	class			= "MicroWarpDrive",
	in_editor		= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,

	energy_prepare	= 0,		-- энергия требуемая для подготовительного разгона
	energy_activate = 30,		-- энергия требуемая для активации
	cooldown		= 5,

	prep_time		= 1,		-- время разгона
	prep_maxspeed_mul = 0.5,	-- во сколько раз увеличивать допустимую максимальную скорость при разгоне
	prep_accel_mul	= 2.0,		-- во сколько раз увеличивать ускорение при разгоне
	
	accel_time		= 3,		-- время сколько будет действовать
	maxspeed_mul	= 2.0,		-- во сколько раз увеличивать допустимую максимальную скорость
	accel_mul		= 2,	-- во сколько раз увеличивать ускорение
	auto_disable_time = 0.55,	-- за T*<текущая_скорость> метров до препятствия автоматически выходит из варпа

	prep_loop		= "sound/gadgets/warp_prep",
	active_loop		= "sound/gadgets/warp_active",
	stop_sound		= "sound/gadgets/warp_stop",
	fail_sound		= "sound/gadgets/warp_fail",

	ui_name			= "MicroWarpDrive",
	
	uiName 			= "Special_MicroWarp_Base",
	uiDesc 			= "Special_MicroWarp_Base_Desc",
	
	item_subtype 	= ItemSubtype.MicroWarp,

	default_icon		= "ItemSubtype_MicroWarp",
}

-- Def.Module_CageTrap = 
-- {
-- 	inherit = "Module_SentryDrone",
-- 	activate_entity = "CageTrapHolder",
-- }

-- Def.CageTrapHolder = 
-- {
-- 	inherit = "SentryDrone",
-- 	model = "models/modules/m_active/elidium_modules/protector_device",
-- 	active_spell = "CageTrap",
-- }

Def.Module_CageTrapMine =
{
	class 		= "ActiveModule",
	in_editor	= false,
	cooldown	= 9,
	activate_entity = "CageTrapMine",
	activate_entity_max	= 2,
	spawn_offset = Vec3( 0, -2, -3 ),
	spawn_dir_to_aim = true,
	item_subtype		= ItemSubtype.SystemsRecharger,
	
	activate_sound 			= "sound/gadgets/SpiralMine/sm_start",
}

Def.CageTrapMine =
{
	class				= "MineTrap",
	model				= "models/turret/biglightninggun/h_mine",
	signature			= ai.Signature.SMALL,
	health 				= 6000,
	damageable			= true,
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000, },
	target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
	},
	radius				= 40,
	launch_time			= 2.5,
	ttl					= 120,
	spell_on_ttl		= "CageTrap",
	active_aura			= "StealthandWarpDisable",
	spell_aura_target	= true, --может быть целью спелов

	--отображение в HUD
	hudType 			= "default",
	uiName 				= "CageTrapMine_name",
	default_icon		= "ItemSubtype_DestrDeadlyTrap",

	-- start_sound 		= "sound/weapons/mine/mine_start",
	launch_effect		= "particles/gadget/mine_deploy",
	default_icon		= "ItemSubtype_SmallSpiralMine",
}

Def.CageTrapMineActiveHolder = 
{
	class				= "AuraHolderEntity",
	damageable			= true,
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
	health				= 6000,
	hudType				= "default",
	in_editor			= false,
	model				= "models/turret/biglightninggun/h_mine",
	physics				= {damping = 0.4, mass = 1000, material = "ShipMetalMk3", rot_damping = 0.4, solid_type = 4, },
	-- uiDesc				= "Module_ShieldRayLarge_Desc",
	uiName				= "CageTrapMine_name",
	work_sound 			= "sound/gadgets2/CageTrapMine_loop",
}

Def.Module_NoiseSuppressor = --#83046
{
	class 				= "ActiveModule",
	in_editor			= false,
	item_subtype		= ItemSubtype.ShieldChargesDestr,
	spell				= "NoiseSuppressor",
	cooldown			= 35,
}

Def.Module_TestFxTeleport = --временный деф --#71644
{
	class = "ActiveModule",
	cooldown = 5,
	spell = "UntouchableGhostHolder",
	item_subtype = ItemSubtype.HackSystems,
}

Def.Module_TeleportTest = --временный деф --#71644
{
	class = "ActiveModule",
	cooldown = 5,
	spell = "EmergencyTeleport",
	item_subtype = ItemSubtype.HackSystems,
}

Def.Module_InterceptorsOnSpeedResists = 
{
	cant_be_bought = true,
	hide_from_player = true,
	class = "SpaceShipModule",
	-- default_icon = "ItemSubtype_AdaptiveForceField",
	item_lvl = 28.3,
	item_subtype = ItemSubtype.InerceptorsOnShipResists,
	mark = 7,
	max_speed_percent = 0.9,
	module_type = ai.ModuleType.CAPACITOR_MOD,
	premiumPrice = 200,
	price = 10000,
	rank = 7,
	shopCategory = "SHIP_MOD",
	shopSubCategory = "CAPACITOR_MOD",
	spell_on_max_speed_plus = "MaxSpeedPlus100ShieldHull",
	-- storeItemId = 1000,
	store_path = "/PASSIVE MODULES/CAPACITOR_MOD",
	tier = 3,
	class_mask = ai.ShipClass.SMALL,
	ods_export = true, -- чтобы storeItemId вписало уникальный
	unique_equip = true,
	uiDesc = "itemSubType_AdaptiveMembrane_desc",
}

Def.Module_DroneBuff =
{
	-- cant_be_bought = true,
	-- hide_from_player = true,
	unique_equip					= true,
	class 							= "SpaceShipModule",
	spell_on_equip					= "DroneBuff",
}

Def.Module_PassiveOvercharge = 
{
	cant_be_bought 					= true,
	hide_from_player 				= true,
	class 							= "SpaceShipModule",
	spell_on_max_health_minus 		= "TimeBoost_Wolfhound",
	max_health_percent				= 0.35,--0.5,
	-- cooldown						= 25, --без него лучше
}

Def.Module_PassiveDisintegaratorBoost = 
{
	-- cant_be_bought 					= true,
	-- hide_from_player 				= true,
	class 							= "SpaceShipModule",
	disintegrator_fire_rate_mul 	= 0.3,
	unique_equip					= true,
}

Def.Module_ProtectiveFire = 
{
	-- cant_be_bought 					= true,
	-- hide_from_player 				= true,
	class 							= "SpaceShipModule",
	spell_on_death_someone	= "ProtectiveFire",
	spell_on_death_trigger_target	= --здесь нужен area = ai.SpellTargetArea.AROUND к spell_on_death_trigger_range
	{
		class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area = ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY,
		vitality = ai.SpellTargetVitality.DEAD,
	},
	spell_on_death_trigger_range	= 250,
	unique_equip = true,
}

Def.Module_OnMaxSpeed =
{
	class = "SpaceShipModule",
	default_icon = "ItemSubtype_GreenComputerOverload",
	item_subtype = 806,
	max_speed_percent = 0.9,
	module_type = 14,
	spell_on_max_speed_plus = "WeaponSelfOnSpeedPowerInit",
}

Def.Module_RotSpeedOnMdlActivation =
{
	class = "SpaceShipModule",
	item_subtype = ItemSubtype.HackSystems,
	spell_on_module_activate  = "RotSpeedOnMdlActivation",
	spell_on_special_activate = "RotSpeedOnMdlActivation",
	unique_equip = true,
}

Def.Module_SwapTeleport = 
{
	class = "ActiveModule",
	cooldown = 5,
	spell = "PreSwap",
	additional_spell = "PreSwap_Self",
	item_subtype = ItemSubtype.HackSystems,
	--deactivate_spell = "GuardSwap",
	activate_sound = "sound/ufo_modules/PositionSwap_activation",
}

-- переделан #0083846
-- Def.Module_StasisFixRay = 
-- {
-- 	class = "ActiveModule",
-- 	cooldown = 1,
-- 	spell = "VisionNullifier",
-- 	item_subtype = ItemSubtype.HackSystems,
-- 	work_beam_fx = "particles/gadget/boostban_beam",
-- }

Def.Proto_SwapTeleport = 
{
	class = "ActiveModule",
	cooldown = 5,
	spell = "GuardSwap",
	item_subtype = ItemSubtype.HackSystems,
}

Def.Module_EnergyNullifier = 
{
	class = "ActiveModule",
	cooldown = 1,
	spell = "EnergyNullifier",
	item_subtype = ItemSubtype.HackSystems,
	activate_sound = "sound/ufo_modules/ufo_common_activation",
}

Def.Module_WeaknessDetector =
{
	class = "ActiveModule",
	cooldown = 12,
	spell = "WeaknessDetector",
	item_subtype = ItemSubtype.HackSystems,
	--work_beam_fx = "particles/gadget/scan_beam",
	activate_sound = "sound/gadgets/common_activate",
}

Def.Module_HackAimingProtocol =
{
	class = "SpaceShipModule",
	default_icon = "ItemSubtype_HackAimingProtocol",
	item_subtype = 806,
	module_type = 14,
	emergency_barrier_spell = "HackAimingProtocol_main",
	cooldown	= 30,
	show_cooldown_status = true,
}

Def.Module_Multishot =
{
	cant_be_bought = true,

	default_icon = "ItemSubtype_Multishot",
	-- module_type = ai.ModuleType.SPECIAL,
	-- item_subtype = ItemSubtype.RocketWolfhound,
	-- class_mask = ai.ShipClass.MEDIUM,
	-- tier = 5,

	-- acceleration_time = 2,
	-- ammo = 6,
	shoot_mode = ai.FiringModuleShootMode.CHARGED_VOLLEY, --#83032

	target_cone_angle = 37.5,
	max_charge_time = 3.5,
	min_target_charge_time = 0.5,
	max_target_charge_time = 5,
	charge_damage_kinetic_per_second = 2500,
	charge_beam_fx = "particles/weapons/sniper/targeting",
	model = "models/modules/m_active/m_a_sharpshooter",
	max_targets = 4,

	-- barrel_rot_speed = 90,
	-- check_aim_orientation_angle = 180,
	class = "FiringModule",
	cooldown = 25,
	crit_chance = 0,
	-- damage_thermal = 550,
	dispersion = 0,
	energy_cost = 100,
	fire_rate = 300,
	-- inherit = "Module_RocketSilo",
	-- long_shot_effects = true,
	-- max_projectiles_per_target = 2,
	max_range = 550,
	-- stop_barrels = 1,
	-- target_cone_angle = 60,
	projectile = "Projectile_Multishot",
	projectile_speed = 475,
	track = ai.TrackMode.AIM,
	-- track_offset = Vec3( 0, 0, -1000 ),
	
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius = 10,
	muzzleflash_time = 1,
	shot_effect = "particles/gadget/multishot_muzzle",
	shot_once_sound = "sound/destroyer/RocketSilo_launch",
	activate_sound = "sound/gadgets/common_activate",
}

Def.Projectile_Multishot = 
{
	apply_shake = true,
	class = "Rocket",
	effect = "particles/gadget/multishot_projectile",
	fixedInheritance = true,
	hit_effect = "particles/gadget/multishot_hit",
	hitbox_max = Vec3( 0.2000, 0.2000, 0.2000 ),
	hitbox_min = Vec3( -0.2000, -0.2000, -0.2000 ),
	impact_type = "lasersniper",
	in_editor = false,
	inherit = "Projectile_Plasma_Default",
	mass = 0.05,
	shadowCaster = false,
	smooth_effect_param = true,

	--rocket_params:
	explosion_blast_wave = "Blastwave_Multishot",
	model 				= "models/misc/invisible_model",
	missile_defence_immune = true,
	missile_detection_immune = true,
	override_blast_wave_damage = true,
	is_guided 			= true,
	angular_velocity	= 80,
	flare_size			= 0.0,
}

Def.Blastwave_Multishot = 
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 10,
	blast_minDistance = 2,
	class = "BlastWave",
	damage_kinetic = 1000,
	-- effect = "particles/explosions/artillery_fire",
	in_editor = false,
	-- sound = "sound/explosion/small_rocket_expl",
}

Def.Module_RocketRedirection = 
{
	class = "ActiveModule",
	cooldown = 5,
	spell = "RocketRedirection",
	item_subtype = ItemSubtype.HackSystems,
	activate_sound = "sound/ufo_modules/RocketRedirection",
}

Def.SoundTestModule_RocketRedirection = 
{
	class = "ActiveModule",
	cooldown = 5,
	spell = "RocketRedirection_Test",
	item_subtype = ItemSubtype.HackSystems,
	activate_sound = "sound/ufo_modules/RocketRedirection",
}

Def.Module_EMIMine = 
{
	class 					= "ActiveModule",
	in_editor 				= false,
	item_subtype			= ItemSubtype.HackSystems,
	cooldown 				= 20,
	spell					= "EMIMine",
	-- activate_entity 		= "CageTrapMine",
	activate_entity_health	= 2000,
	check_spawn_collision	= true,
	spawn_offset			= Vec3(0, -3, 1),
	activate_sound 		= "sound/gadgets/FrigateDrone/fd_launch",
	
	default_custom_elements =
	{
		[ai.VesselCustomSlot.MATERIAL_0] = "Default_r5_l_t1_b1",
		[ai.VesselCustomSlot.MATERIAL_1] = "Default_r5_l_t1_r1",
		[ai.VesselCustomSlot.MATERIAL_2] = "Default_r5_l_t1_g1",
	}
}

Def.EMIMine_Blastwave = 
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 112.5,
	class = "BlastWave",
	damage_emp = 5,
	effect = "particles/explosions/explosion_huge_emp",
	in_editor = false,
	light_color = "140 240 140 100",
	light_radius = 15,
	light_time = 0.9,
	sound 	= "sound/explosion/emi_mine_explosion",
}

Def.EMIMine =
{
	inherit 			= "SpyBeacon",
	uiName 				= "EMIMine",
	uiDesc 				= "EMIMine_Desc",
	--model				= "models/shields/sphere_stealth",
	--physics			= { solid_type = solid.none, static = true },
	model				= "models/modules/cloaking_field_generator/cloaking_field_generator",
	work_sound 			= "sound/weapons/mine/emi_mine_idle",

}

Def.Module_EngineHack = 
{
	class 					= "ActiveModule",
	in_editor 				= false,
	item_subtype			= ItemSubtype.HackSystems,
	cooldown 				= 5,
	spell					= "EngineHack",
	activate_sound 		= "sound/gadgets/common_activate",
}

------------------------------
--****************************************************************************************************************
-- переработка серебра
--****************************************************************************************************************
------------------------------
-- деймос  #76773
Def.Module_RageBoost =
{
	class					= "MicroWarpDrive",
	in_editor				= false,
	module_type				= ai.ModuleType.ACTIVE,
	--module_type			= ai.ModuleType.SPECIAL,

	energy_prepare			= 200,		-- энергия требуемая для подготовительного разгона
	energy_activate 		= 0,		-- энергия требуемая для активации
	cooldown				= 30,

	prep_time				= 1.5,		-- время разгона
	prep_maxspeed_mul 		= 2,	-- во сколько раз увеличивать допустимую максимальную скорость при разгоне
	prep_accel_mul			= 3.0,		-- во сколько раз увеличивать ускорение при разгоне

	accel_time				= 2,		-- время сколько будет действовать
	maxspeed_mul			= 7.0,		-- во сколько раз увеличивать допустимую максимальную скорость
	accel_mul				= 5000.0,	-- во сколько раз увеличивать ускорение
	auto_disable_time 		= 0.55,	-- за T*<текущая_скорость> метров до препятствия автоматически выходит из варпа

	prep_loop				= "sound/gadgets/warp_prep",
	active_loop				= "sound/gadgets/warp_active",
	stop_sound				= "sound/gadgets/warp_stop",
	fail_sound				= "sound/gadgets/warp_fail",

	--spell_on_warp 			= "RageBoost", --убрано так как наследуется еще и в другом модуле от этого же
}
--  деймос  #76780
Def.Module_DeimosEmitter =
{
	class 				= "SpaceShipModule",
	in_editor			= false,
	spell_on_equip 		= "DeimosEmitter",
}


Def.Module_Decay =
{
	class				= "ActiveModule",
	cooldown 			= 2,
	in_editor			= false,
	module_type			= ai.ModuleType.ACTIVE,
	spell 				= "Decay_Creator", --"Bleeding_Creator" "Bleeding"
	activate_sound 		= "sound/gadgets/common_activate",
}

Def.Module_Lynx2Shield =
{
	class 							= "SpaceShipModule",
	spell_on_max_speed_plus 		= "Lynx2Shield",
	max_speed_percent 				= 0.9,
	cooldown						= 1.5,
}


--
Def.Module_CripplingClaws =
{
	inherit 			= "Weapon_Base",
	---class 			= "SingularityCannon",
	in_editor	 		= false,
	--model				= "models/weapons/plasma/power/orb_gun",

	class				= "FiringModule",

	cooldown			= 20,

	energy_cost 		= 100.0,

	projectile 			= "Projectile_CripplingClaws",
	projectile_speed 	= 450,

	--track 				= ai.TrackMode.OFFSET,
	--track_offset 		= Vec3( 0, 0, -1 ), -- направление вперёд

	track 				= ai.TrackMode.AIM,
	check_aim_orientation_angle = 180,
	barrel_rot_speed 	= 360,
	model 					= "models/weapons/plasma/power/vortex",

	fire_rate 			= 60,
	dispersion			= 0,

	optimal_range		= 207,
	max_range			= 225,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 833,
	damage_thermal		= 0,

	shot_once_sound 	= "sound/el_modules/CrystalHamstring",
}

Def.Projectile_CripplingClaws = --CrystalHamstring
{
	class					= "SingularityProjectile",
	in_editor				= false,

	hitbox_min 				= Vec3( -0.5, -0.5, -0.5 ),
	hitbox_max				= Vec3( 0.5, 0.5, 0.5 ),
	impact_type 			= "singularity",

	--detonation_radius	= 0.1,
	damage_radius			= 50,

	flare_color				= "0 0 255 25",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,

	spell_on_launch			= "CripplingClaws", --!!!

	effect 					= "particles/weapons/big/hamstring_blue_projectile",
	singularity_hit_fx 		= "particles/empty",
	hit_effect				= "particles/weapons/plasma/hit",
	kill_effect_on_remove 	= false,

	singularity_hit_sound	= "sound/hit/plasma-ShipMetalMk1",
	--work_sound 	    = "",
}

Def.Module_HerculesOrb =
{
	class					= "FiringModule",
	in_editor 				= false,

	model 					= "models/weapons/plasma/power/vortex",

	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 180,

	cooldown				= 3,
	energy_cost 			= 18,
	track 					= ai.TrackMode.AIM,

	projectile 				= "Projectile_HerculesOrb",
	projectile_speed 		= -100,
	--projectile_power_charge_coef = 0.95,
	--projectile_spell_charge_coef = 0.95, --коэфициент на который домножится influence_param в спеле из прожектайла
	max_range				= 300,

	muzzleflash_color = { kinetic = "220 78 53 100", emp = "220 78 53 100", thermal = "220 78 53 100", },
	muzzleflash_radius 		= 25,

	--damage				= 0,
	--damage_kinetic		= 0,
	--damage_emp			= 0,
	--damage_thermal		= 0,
	shot_once_sound 	= "sound/gadgets/IsotopeHarvester/ih",
	launch_beam_fx		= "particles/weapons/big/herculesorb_beam",
}

Def.Projectile_HerculesOrb =
{
	inherit				= "Weapon_BaseRocket",
	angular_velocity	= 120,
	is_guided			= true,
	flare_color			= "0 0 255 0",
	flare_size			= 0.00,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	model 				= "",
	missile_detection_immune = true,
	disable_concussion_sound = true,
	missile_defence_immune 	= true,

	spell_on_launch		= "HerculesOrb",--"OrbofJeriho",

	work_sound 			= "sound/gadgets/IsotopeHarvester/ih_sphere_fly",
	effect 				= "particles/weapons/big/herculesorb_projectile2",

	kill_effect_on_remove 		= false,
	spell				= "HerculesOrbFinal",--OrbofJerihoHeal",
	--charge_spell		= true,
}


Def.Module_WolfRun =
{
	class 							= "SpaceShipModule",
	in_editor						= false,
	rot_speed_mul					= 0.25,

	max_shield_percent				= 0.5,
	max_shield_activation_time		= 0.5, -- программисты сказали что такое время должен быть кондишен для срабатывания spell_on_max_shield_plus
	spell_on_max_shield_plus		= "WolfRun",
}


Def.Module_WolfPack =
{
	class				= "FiringModule",
	in_editor 			= false,

	model 				= "models/weapons/plasma/power/vortex",
	--check_aim_orientation = true,
	check_aim_orientation_angle = 180,
	barrel_rot_speed 	= 1000,

	cooldown			= 5,
	energy_cost 		= 10,
	track 				= ai.TrackMode.AIM,
	max_range			= 375,
	stop_barrels		= ai.BarrelsStopMode.ACTIVE,
-----
	damage_emp			= 1100,
	dispersion			= 25,   -- Это пишется в тултипе      --до  #68720   было   25
	target_cone_angle 	= 25, -- Это угол самонаведения
	ammo				= 4,
	-- auto_shoot_active 	= true,  --#83218 теперь используется поле shoot_mode
	shoot_mode = ai.FiringModuleShootMode.BURST, --#83218 теперь используется поле shoot_mode
	fire_rate 			= 180,
	--target_cone_angle = 30,
	max_projectiles_per_target = 2,
-----
	--projectile 			= "Projectile_RocketSilo",
	--projectile 			= "SpaceMissile_Standart_T2_Mk1",
	--projectile 			= "Projectile_BubbleGunBubble",
	projectile 			= "Projectile_WolfPack",
	projectile_speed 	= 120,

	default_icon 		= "ItemSubtype_SpaceMissile_Fireworks",
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 	= 10,
	muzzleflash_time 	= 1.0,
	long_shot_effects 	= true,
	shot_effect 		= "particles/weapons/destroyer_rocket_start",

	shot_once_sound 			= "sound/gadgets/WolfPack/wp",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance 		= 0,
}

Def.Projectile_WolfPack =
{
	class						= "Rocket",
	explosion_blast_wave		= "Blastwave_WolfPack",
	override_blast_wave_damage 	= true,
	--missile_defence_immune 		= true,
	--missile_detection_immune	= true,
	acceleration_time 	= 1,

	angular_velocity			= 90,
	is_guided					= true,
	time_to_live				= 7,

	effect 						= "particles/weapons/mid/wolf_projectile",

	detonation_radius			= 3,

	flare_color					= "55 50 250 0",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,
--	whiz_sound 					= "sound/whiz/energy2",
--	whiz_sound_radius 			= 40,
	work_sound 					= "sound/gadgets/Vortex/vortex_fly",

}

Def.Blastwave_WolfPack =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 100,
	blast_maxDistance		= 10,
	apply_damage			= true,

	effect 					= "particles/weapons/mid/wolf_explosion",
	light_color 			= "160 232 255 128",
	light_radius 			= 10,
	light_time 				= 0.2,
	sound 					= "sound/explosion/PlasmaVolley_expl",
}

Def.Module_AchillesPylum =
{
	class					= "FiringModule",
	in_editor 				= false,

	item_subtype			= ItemSubtype.AchillesPylum,


	cooldown				= 3,
	energy_cost 			= 18,
	
	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 360,
	track 					= ai.TrackMode.AIM, --ai.TrackMode.OFFSET,
	--track_offset 			= Vec3( 0, 0.06, -1000 ), -- направление вперёд

	projectile 				= "Projectile_AchillesPylum",
	projectile_speed 		= 85,
	max_range				= 300,
-----
	dispersion				= 0,   -- Это пишется в тултипе

	default_icon 			= "ItemSubtype_AchillesPylum",

	muzzleflash_color = { kinetic = "155 234 130 25", emp = "155 234 130 25", thermal = "155 234 130 25", },
	muzzleflash_radius 		= 15,
	muzzleflash_time 		= 2.0,
	long_shot_effects 		= true,
	shot_effect 			= "particles/weapons/vortex/muzzle",
	oriented_shot_effects 	= false,
	shot_once_sound 		= "sound/gadgets/AchillesPylum/ap_fire",
	model 					= "models/weapons/plasma/power/vortex",
}
--
Def.Projectile_AchillesPylum =
{
	inherit					= "Projectile_SingularityCannon",

	spell_on_launch			= "AchillesPylum",	--Spell_CrystalSpit",

	missile_detection_immune = true,
	disable_concussion_sound = true,
	missile_defence_immune 	= true,

	flare_color				= "155 235 130 10",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
	--effect 					= "particles/weapons/alien/alien_gun_projectile",
	effect 					= "particles/weapons/big/plasma_orb",


}


--#78482
Def.Module_SupportReinforce =
{
	class				= "ActiveModule",
	target_ally			= true,
	cooldown			= 5,
	energy_cost 		= 10,
	--aura_execution_delay = 1, -- !!!
	spell				= "SupportReinforcePrepare",  -- телепортирует кастера к дружественной цели
	deactivate_spell	= "SupportReinforce",  -- телепортирует кастера к дружественной цели
	additional_spell	= "SupportReinforce_DefencePart", -- дает шкуру на себя и на дружественную цель
}
Def.SupportReinforce_Shield =
{
	class 				= "ScBaseEntity",

	health 				= 1000, --
	ttl					= 10,
	damageable			= true,
	network_sync 		= true,

	effect 				= "particles/gadget/pshield_1",

	ui_color			= 0xFFFFCCFF,
}

Def.Module_EnergyOptimus =
{
	class 							= "SpaceShipModule",
	in_editor						= false,
	energy_max_mul					= 0.1,

	spell_on_equip					= "EnergyOptimus",
}

Def.Module_KatanaEnergy =
{
	class 							= "SpaceShipModule",
	rot_speed_mul					= 0.25,
	spell_on_max_speed_plus			= "KatanaEnergy",
	max_speed_percent				= 0.9,
	cooldown						= 1.5,
}

--#78480
--Воруем энергию у врагов в 750-1000метров (все время)
Def.Module_FireStealingPot =
{
	class 					= "SpaceShipModule",
	spell_on_equip			= "FireStealingPot",
	--spell_on_equip			= "KatanaEnergy",
}

Def.Module_BushidoCall = {
	class 					= "SpaceShipModule",
	--spell_on_equip			= "FireStealingPot",
	--spell_on_equip			= "KatanaEnergy",
	emergency_barrier_spell	= "BushidoCall",
	cooldown				= 10,
}

--в тонком длинном луче сжигает щиты врагов и потом немного корпуса				#78469
Def.Module_HerculesGust = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "HerculesGust",
	deactivate_spell		= "HerculesGust_End",

	activate_sound 			= "sound/gadgets/HerculesGust/hg_activate",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
}

--
Def.Module_MacheteFury = {
	class 					= "ActiveModule",
	cooldown				= 4,   --35  длительность 8
	energy_cost				= 50,
	energy_cost_additional 	= 0.2,  -- не сжигает то, что ниже 20%
	param_modificator		= 0.000625,  -- aura_param = aura_param + param_modificator*"количество дополнительной энергии"  (из расчета бонусная энергия =400)  --FIRE_RATE_MOD  хочется 0.0 - 0.25, на себя бонус .35, на других бонус 0

	module_type				= ai.ModuleType.ACTIVE,

	spell 					= "MacheteFury",
	additional_spell		= "MacheteFury_Ally",

	activate_sound 		= "sound/gadgets/common_activate",
}

--все время дает носителю +15 - 20 % урона.   при активации на 12 секунд дает всем союзникам в радиусе 4600м +75% скорости полета снаряда.
--#78373
Def.Module_FastShootAxe= {
	class 					= "ActiveModule",
	cooldown				= 4,   --35  длительность 8
	energy_cost				= 50,
	module_type				= ai.ModuleType.ACTIVE,

	spell 					= "FastShootAxe",
	spell_on_equip			= "FastShootAxe_Self",

	activate_sound 		= "sound/gadgets/common_activate",
}


Def.Module_MacheteBox = {
	class 					= "ActiveModule",
	cooldown				= 4,   --35  длительность 8
	energy_cost				= 50,
	module_type				= ai.ModuleType.ACTIVE,
	spawn_offset 			= Vec3( 0, -1.5, 2 ),
	spell 					= "MacheteBox",

	activate_sound 			= "sound/gadgets/common_activate",
}
Def.MacheteBox =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= true,
	health 				= 4000,
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	--physics			= { solid_type = solid.box, kinematic = true, hitbox = true,  material = "Metal", mass = 1000, },
	hudType 			= "default",
	uiName 				= "itemSubType_MacheteBox",
	uiDesc 				= "itemSubType_MacheteBox_desc_woParams",

	death_effect		= "particles/explosions/big_fire_2",
	death_sound			= "sound/explosion/drone_expl",
}


Def.Module_KatanaRiposte = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "KatanaRiposte",
	additional_spell		= "KatanaRiposte_Self",

	activate_sound 			= "sound/gadgets/KatanaRiposte",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
}


--#78479
--Стреляет генератором пульсара (уничтожим сверх лехко)
------------------
Def.Module_PrometheusPot = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "PrometheusPot",
	
	activate_sound 			= "sound/gadgets/common_activate",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
}
Def.PrometheusPot =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= false,
	health 				= 300,
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	--physics			= { solid_type = solid.box, kinematic = true, hitbox = true,  material = "Metal", mass = 1000, },
	hudType 			= "default",
	uiName 				= "Module_PrometheusPot",
	uiDesc 				= "Module_PrometheusPot_Desc",
	death_effect		= "particles/explosions/big_fire_2",
	death_sound			= "sound/explosion/drone_expl",

	uiName 				= "PrometheusPot_name",
}
--[[
Этот кусок PrometheusPot на другой механике - через прожектайл, на случай если спелл где то не заработает.
Def.Module_PrometheusPot =
{
	class					= "FiringModule",
	in_editor 				= false,

	--spell_on_hit			= "PrometheusPot",

	--check_aim_orientation 	= true,
	--check_aim_orientation_angle = 180,
	--barrel_rot_speed 		= 90,

	cooldown				= 5,
	energy_cost 			= 5,
	--track 					= "aim",

	max_range				= 400,
-----
	damage_kinetic			= 0,
	dispersion				= 0,
-----
	projectile 				= "Projectile_PrometheusPot",
	projectile_speed 		= 800,

	long_shot_effects 		= true,
	shot_effect 			= "particles/weapons/vortex/muzzle",
	oriented_shot_effects 	= false,

	shot_once_sound 		= "sound/gadgets/Vortex/Vortex_fire",
}

--
Def.Projectile_PrometheusPot =
{
	inherit					= "Weapon_BaseRocket",
	spell					= "PrometheusPot",

	explosion_blast_wave 	= "Blastwave_PrometheusPot",
	override_blast_wave_damage = true,

	detonation_radius	= 2,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/other/fotonvortex_projectile",
}

Def.Blastwave_PrometheusPot =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 0,
	apply_damage		= false,
	apply_shake 		= false,

	effect 				= "particles/weapons/other/fotonvortex_explosion",
	light_color 		= "220 60 60 100",
	light_radius 		= 10,
	light_time 			= 0.5,
	sound 				= "sound/gadgets/Vortex/Vortex_explosion",
}
 ]]


-- #78487
-- вокруг выбранной точки отталкиваются враги,  получая урон  //  на себя накидывается шкура
Def.Module_KatanaSPush = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",

	cooldown				= 5,
	energy_cost				= 10,

	spell 					= "KatanaSPush",
	additional_spell 		= "KatanaSShell",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
	activate_sound = "sound/el_modules/GreenGravyPush",
}

Def.KatanaSPush_Shell =
{
	class 				= "ScBaseEntity",

	health 				= 500,
	ttl					= 5,
	damageable			= true,
	network_sync 		= true,

	effect = "particles/gadget/pshield_1",

	ui_color			= 0xFFFFCCFF,
}

--#0080145: Заграды Активка на Lynx-M (CatConcentration)
Def.Module_CatConcentration= {
	class 					= "ActiveModule",
	model 					= "models/weapons/plasma/power/vortex",

	cooldown				= 5,
	energy_cost				= 10,

	spell 					= "CatConcentration",
	additional_spell 		= "CatConcentration_Self",

	activate_sound 		= "sound/gadgets/common_activate",
}


Def.Module_GuidedDronFoxSlow =
{
	class					= "ActiveModule",

	cooldown				= 5.0,
	energy_cost				= 10.0,
	--energy_cost_per_second	= 25.0,

	activate_entity			= "Drone_GuidedDronFoxSlow",--"SentryDrone1",
	activate_entity_health 	= 3000,
	spawn_offset 			= Vec3( 0, -3, 1 ),
	check_spawn_collision 	= true,
	activate_entity_ttl		= 5,


	-- drone parameters
	max_speed				= 0,
	max_rot_speed			= 0,	-- deg per second
	max_aim_rot_speed		= 60,

	fire_rate				= 25,
	dispersion				= 0.25,
	optimal_range			= 180,
	max_range				= 225,

	projectile_speed		= 300,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 100,
}
Def.Drone_GuidedDronFoxSlow =
{
	inherit 				= "SentryDrone",
	active_spell			= 'GuidedDronFoxSlow',
	--ttl						= 20,
}



Def.Module_FoxMShot = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	--model 					= "models/weapons/plasma/power/vortex",
	model 					= "models/modules/m_active/m_a_gadget_shield",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "FoxMShot_Self",
	deactivate_spell		= "FoxMShot",

	activate_sound 			= "sound/destroyer/TRay_fire",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
	activate_module_effect = "particles/weapons/laser/hercules_ray1_charge",
}


Def.Module_FoxEscapeFromBattle  = {
	class 					= "ActiveModule",
	in_editor 				= false,

	model 					= "models/weapons/plasma/power/vortex",

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "FoxEscapeFromBattle_Hide",
	additional_spell		= "FoxEscapeFromBattle",
	deactivate_spell		= "FoxEscapeFromBattle1",
	
	item_subtype			= ItemSubtype.FoxEscapeFromBattle,

	activate_sound 			= "sound/gadgets/common_activate",
}




--KatanaMineLayer

Def.Module_KatanaMineLayer =
{
	class					= "FiringModule",
	in_editor 				= false,

	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 360,

	cooldown				= 3,
	energy_cost 			= 10,

	projectile 				= "Projectile_KatanaMineLayer",
	projectile_speed 		= 120,
	max_range				= 250,
-----
	--damage_kinetic			= 0,
	dispersion				= 0,   -- Это пишется в тултипе
	track 					= ai.TrackMode.AIM, --ai.TrackMode.OFFSET,
	--track_offset 			= Vec3( 0, 0, -1000 ), -- направление вперёд, сведение стволов 1000 м
	shoot_mode				= ai.FiringModuleShootMode.TRIGGER_PROJECTILE,

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 		= 5,
	muzzleflash_time 		= 1.0,
	long_shot_effects 		= true,
	shot_effect 			= "particles/weapons/vortex/muzzle",
	oriented_shot_effects 	= false,
	shot_once_sound 		= "sound/gadgets/Vortex/Vortex_fire",
}
--
Def.Projectile_KatanaMineLayer =
{
	inherit 				= "Weapon_BaseRocket",

	--spell_on_launch			= "Spell_CrystalSpitBase",	--Spell_CrystalSpit",
	death_entity			= "MineField_KatanaMineLayer",

	missile_detection_immune= true,
	explosion_blast_wave	= "BlastWave_KatanaMineLayer",

	flare_color				= "255 170 191 255",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,

	work_sound				= "sound/weapons/smartRocket/smr_fly",
	effect 					= "particles/weapons/katana_minelayer/rocket_trail",
	impact_type 			= "rocket",
}
Def.MineField_KatanaMineLayer = {
	class					= "Minefield",
	field_radius			= 60,
	max_mines				= 4,
	time_to_live			= 20,
	period					= 1,
	repeat_period			= 3,
	spell 					= "KatanaMineLayer",
	explosion_blast_wave	= "BlastWave_KatanaMineLayer",

	use_team_skin			= true,
	shot_effect_s1 			= "particles/weapons/katana_minelayer/minefield_deploy_friendly",
	work_effect_s1 			= "particles/weapons/katana_minelayer/minefield_friendly",
	shot_effect_s2 			= "particles/weapons/katana_minelayer/minefield_deploy",
	work_effect_s2 			= "particles/weapons/katana_minelayer/minefield",
	launch_sound 			= "sound/gadgets/FrigateDrone/fd_launch",
	model 					= "models/misc/invisible_model",
	uiName					= "itemSubType_KatanaMineLayer",
	default_icon			= "ItemSubtype_KatanaMineLayer",
}
Def.BlastWave_KatanaMineLayer =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 200,
	blast_maxDistance		= 20,
	apply_damage			= true,

	effect 					= "particles/weapons/katana_minelayer/explosion",
	light_color 			= "160 232 255 128",
	light_radius 			= 10,
	light_time 				= 0.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}


--HorrorHowl
---
Def.Module_HorrorHowl = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "HorrorHowl",

	activate_sound 			= "sound/destroyer/TRay_fire",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
}


--при активации, начинается "этап подготовки", если во время этого этапа корабль летит по прямой (или стоит), то есть вектор направления корабля не меняется сильнее чем на некоторую альфу, то начинается этап 2, иначе работа модуля прекращается.
--этап 2: модуль стреляет ракетой в направлении вектора корабля (вперед)
Def.Module_PlasmaTorpedoGenerator =
{
	class					= "FiringModule",
	in_editor 				= false,

	check_aim_orientation_angle = 90, --??
	barrel_rot_speed 		= 360,  --??
	track 					= ai.TrackMode.OFFSET,
	--track_offset 			= Vec3( 0, 0.08, -1 ),
	track_offset 			= Vec3( 0, 0.0, -1000 ),

	preparation_time		= .85,
	preparation_max_rotation_angle = 8, -- Это пишется в тултипе

	cooldown				= 3,
	energy_cost 			= 10,

	projectile 				= "Projectile_PlasmaTorpedoGenerator",
	projectile_speed 		= 120,
	max_range				= 250,
-----
	--damage_kinetic			= 0,
	dispersion				= 1,   

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 		= 5,
	muzzleflash_time 		= 1.0,
	long_shot_effects 		= true,
	shot_effect 			= "particles/weapons/plasma_torpedo_generator/muzzle",
	oriented_shot_effects 	= true,
	shot_once_sound 		= "sound/gadgets/Vortex/Vortex_fire",

	activate_effect 		= "particles/weapons/plasma_torpedo_generator/activation",
}
--
Def.Projectile_PlasmaTorpedoGenerator =
{
	inherit 				= "Weapon_BaseRocket",

	--spell_on_launch			= "Spell_CrystalSpitBase",	--Spell_CrystalSpit",
	--death_entity			= "MineField_KatanaMineLayer",

	--missile_detection_immune= true,
	explosion_blast_wave	= "BlastWave_PlasmaTorpedoGenerator",
	--disable_concussion_sound = true,
	--missile_defence_immune 	= true,

	override_blast_wave_damage 	= true,

	flare_color				= "255 170 191 255",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,

	work_sound				= "sound/weapons/smartRocket/smr_fly",
	effect 					= "particles/weapons/plasma_torpedo_generator/projectile",
	impact_type 			= "rocket",
}

Def.BlastWave_PlasmaTorpedoGenerator =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_minDistance		= 5, --20 у круизки,
	blast_maxDistance		= 45, --20 у круизки,
	constant_damage			= false, --blast_minDistance работает с этим флагом онли
	apply_damage			= true,

	effect 					= "particles/weapons/plasma_torpedo_generator/explosion",
	light_color 			= "160 232 255 128",
	light_radius 			= 10,
	light_time 				= 0.2,
	sound 					= "sound/explosion/PlasmaVolley_expl",
}



Def.Module_DiverTransparency = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	ignore_silence			= true,

	spell 					= "DiverTransparency",
	additional_spell		= "DiverTransparency_Weak",

	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_HardRadiation = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,
	
	track 		= ai.TrackMode.OFFSET,
	track_offset 	= Vec3( 0, 0, -1000 ), -- направление вперёд

	spell 					= "HardRadiation",

	activate_sound 			= "sound/gadgets/common_activate",
	activate_beam_fx = "particles/gadget/plasma_web_beam_once",
}


Def.Module_ScoutChameleonCommon = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "ScoutChameleonCommon",

	activate_sound 			= "sound/gadgets/common_activate",
}


--#0081005: Диверсант активка на корабль Dagger V (Backstab)
Def.Module_Backstab = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "Backstab",
	additional_spell		= "Backstab_ShieldHardness",

	activate_sound 			= "sound/gadgets/common_activate",
}

--#0081006: Диверсант активка на корабль Ricasso (RadiationCloud)
Def.Module_RadiationCloud = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "RadiationCloud",

	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_EnergyDiversion = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "EnergyDiversion",
	additional_spell		= "EnergyDiversion_Burn",

	activate_sound 			= "sound/gadgets/common_activate",
	
	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
}

Def.Module_SaveJump = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "SaveJump",
	additional_spell		= "SaveJump_HullRestore",

	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_ChaosSpawner = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "ChaosSpawner",

	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_RadiationWeapon =
{
	class				= "ActiveModule",
	cooldown 			= 2,
	energy_cost			= 10,
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	module_type			= ai.ModuleType.ACTIVE,

	spell 				= "RadiationWeapon",

	activate_sound 		= "sound/gadgets/common_activate",
}

Def.Module_ReactorSpark =
{
	class 					= "SpaceShipModule",
	spell_on_equip			= "ReactorSpark",
}

Def.Module_NewShield =
{
	class 					= "SpaceShipModule",
	spell_on_death_someone	= "NewShield",
	spell_on_death_trigger_target	= --здесь нужен area = ai.SpellTargetArea.AROUND к spell_on_death_trigger_range
	{
		class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area = ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL + ai.SpellTargetRelationship.ALLY,
		vitality = ai.SpellTargetVitality.DEAD,
	},
	spell_on_death_trigger_range	= 150,
	cooldown						= 20,
	spell_on_death_someone_cooldown_enable = true,
}

Def.Module_FocusedScaner =
{
	class 					= "SpaceShipModule",
	spell_on_equip			= "FocusedScaner",
}

Def.Module_SpyBeaconAnalyse =
{
	class 				= "ActiveModule",
	in_editor			= false,
	cooldown			= 3,

	energy_cost 			= 10,
	check_spawn_collision 		= true,

	spell					= "Spell_SpyBeaconAnalyse",
	spawn_offset 			= Vec3( 0, -3, 1 ),
	model 					= "models/weapons/plasma/power/vortex",

	activate_sound 			= "sound/gadgets/warpgate/wg_activate",
}


Def.Module_ScoutReturn =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type 			= ai.ModuleType.ACTIVE,

	activate_entity 		= "ScoutReturn_Point",
	--spell					= "SmartBomb_T1_Mk1",
	deactivate_spell		= "ScoutReturn", 


	spawn_offset 			= Vec3( 0, -1, -5 ),

	energy_cost 			= 20,
	cooldown 				= 20,
	activate_sound 			= "sound/gadgets/common_activate",
}
Def.ScoutReturn_Point =
{
	class 				= "TeleportingProjectile",
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", static = true, hitbox = true, }, -- если сделать реальную физику как у SpyBeacon, то возврат не работает, вообще это "пуля" так что с физикой тут какая то неразбериха.
	hudType 			= "default",
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",

	speed 				= 0, -- чтобы не двигалось
	--explosion_blast_wave = nil,
	--detonation_radius = 0, -- и не взрывалось само

	time_to_live 		= 90,
	health 				= 500,
	damageable 			= true,
	missile_defence_immune 		= true,
	missile_detection_immune 	= true,

	teleport_preparation_time = 1.5, -- [новое] время подготовки к прыжку после деактивации модуля
	teleport_on_ttl 	= false, -- [новое] телепортировать или нет по истечению времени жизни (по умолчанию true)
	teleport_radius 	= 1,	-- радиус
	teleport_target 	= {-- таргеты как в аурах (таблица)
			target 			= ai.SpellTargetGeneral.CASTER,
			--class 			= ai.SpellTargetClass.SHIP,
			--area			= ai.SpellTargetArea.AROUND,
			--vitality		= ai.SpellTargetVitality.ALIVE,
		},
	in_sound			= "sound/destroyer/teleporter_in",
	out_sound			= "sound/destroyer/teleporter_out",

	hack_immune			= true,
	teleport_time 		= 0.3, -- 0.2 это время самого телепорта (точнее, время эффекта растворения/появления), по умолчанию 1

	in_fx 				= "particles/gadget/teleport",
	out_fx 				= "particles/gadget/teleport",

	flare_color			= "0 0 0 0", -- убрал засветку ракетную

	uiName 				= "ReturnPoint",
	uiDesc 				= "ReturnPoint_Desc",
}


Def.Module_HoloSpy =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type 			= ai.ModuleType.ACTIVE,

	activate_entity 		= "HoloSpy_Point",
	spell					= "HoloSpy_Start",
	deactivate_spell		= "HoloSpy_End", 


	spawn_offset 			= Vec3( 0, -1, -1 ),

	energy_cost 			= 20,
	cooldown 				= 3,
	activate_sound 			= "sound/gadgets/common_activate",
}
Def.HoloSpy_Point =
{
	class 				= "TeleportingProjectile",
	model 				= "models/misc/invisible_model",
	--model				= "models/weapons/drones/spyradar/spyradar",
	--physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", static = true, hitbox = true, }, -- если сделать реальную физику как у SpyBeacon, то возврат не работает, вообще это "пуля" так что с физикой тут какая то неразбериха.
	--hudType 			= "default",
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",

	speed 				= 0, -- чтобы не двигалось
	--explosion_blast_wave = nil,
	--detonation_radius = 0, -- и не взрывалось само

	time_to_live 		= 15,
	--health 				= 500,
	--damageable 			= true,
	missile_defence_immune 		= true,
	missile_detection_immune 	= true,

	teleport_preparation_time = 0.25, -- [новое] время подготовки к прыжку после деактивации модуля
	teleport_on_ttl 	= true, -- [новое] телепортировать или нет по истечению времени жизни (по умолчанию true)
	teleport_radius 	= 1,	-- радиус
	teleport_target 	= {-- таргеты как в аурах (таблица)
			target 			= ai.SpellTargetGeneral.CASTER,
			--class 			= ai.SpellTargetClass.SHIP,
			--area			= ai.SpellTargetArea.AROUND,
			--vitality		= ai.SpellTargetVitality.ALIVE,
		},
	in_sound			= "sound/destroyer/teleporter_in",
	out_sound			= "sound/destroyer/teleporter_out",

	hack_immune			= true,
	teleport_time 		= 0.3, -- 0.2 это время самого телепорта (точнее, время эффекта растворения/появления), по умолчанию 1

	in_fx 				= "particles/gadget/teleport",
	out_fx 				= "particles/gadget/teleport",

	flare_color			= "0 0 0 0", -- убрал засветку ракетную

	uiName 				= "ReturnPoint",
	uiDesc 				= "ReturnPoint_Desc",
}



Def.Module_TeamGuide = {
	class				= "ActiveModule",
	cooldown 			= 2,
	energy_cost			= 10,
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	module_type			= ai.ModuleType.ACTIVE,

	spell 				= "TeamGuide",
	additional_spell 	= "TeamGuide_Self",

	activate_sound 		= "sound/gadgets/common_activate",
}

Def.Module_SpyDroneShieldThief = {
	class				= "ActiveModule",
	cooldown 			= 2,
	energy_cost			= 10,
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	module_type			= ai.ModuleType.ACTIVE,

	spell 				= "SpyDroneShieldThief",

	activate_sound 		= "sound/gadgets/common_activate",
} 

Def.Module_FakeShipsUpgraded = {
	class				= "ActiveModule",
	spawn_clones		= 2,
	spawn_clones_radius	= 1.5,
	clones_power		= 1,
	clones_ttl			= 20, --переопределяется
	activate_sound 		= "sound/gadgets/common_activate",
}


Def.Module_HealBanHaze = {
	class				= "ActiveModule",
	cooldown 			= 2,
	energy_cost			= 10,
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	module_type			= ai.ModuleType.ACTIVE,

	spell 				= "HealBanHaze",
	additional_spell	= "HealBanHaze_Damage",

	activate_sound 		= "sound/gadgets/common_activate",
} 

Def.Module_HealEnergyBanHaze = {
	class				= "ActiveModule",
	cooldown 			= 2,
	energy_cost			= 10,
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	module_type			= ai.ModuleType.ACTIVE,

	spell 				= "HealEnergyBanHaze",
	additional_spell	= "HealEnergyBanHaze_Energy",

	activate_sound 		= "sound/gadgets/common_activate",
} 

Def.Module_BlackBomb =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	class				= "FiringModule",

	cooldown			= 2,
	energy_cost 		= 10.0,

	projectile 			= "Projectile_BlackBomb",
	projectile_speed 	= 0.4,   -- 5 секунд лета. Влияет на параметр "ttl", рассчитываемый по формуле "max_range" / "projectile_speed" (файл item_tooltips.lua, строка 17609)
	max_range			= 1,  -- 5 секунд лета. Влияет на параметр "ttl", рассчитываемый по формуле "max_range" / "projectile_speed" (файл item_tooltips.lua, строка 17609)
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,

	dispersion			= 0,
	crit_chance			= 0,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 10,
	damage_thermal		= 0,
	-- trigger_projectile	= true, --детонировать заряд при повторном нажатии модуля --#83218 теперь используется поле shoot_mode
	shoot_mode = ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
}

Def.Projectile_BlackBomb =
{
	inherit				= "Weapon_BaseRocket",
	model				= "",
	explosion_blast_wave = "Blastwave_BlackBomb",
	override_blast_wave_damage = true,

	spell_on_launch		= "BlackBomb", --

	detonation_radius	= 1,
	max_owner_distance	= 100,
	power_charge_coef 	= 1000, -- +урон в секунду
	range_charge_coef	= 40, -- +радиус в секунду. Влияет на параметр "cloud_size", рассчитываемый по формуле "ttl" * "range_charge_coef" (файл item_tooltips.lua, строка 17639)
	charge_blastwave 	= true, -- +урон передать в взрыв

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/big/black_bomb_projectile",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
}

Def.Blastwave_BlackBomb = --GrowingStar
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 0.25,
	constant_damage		= false, --blast_minDistance работает с этим флагом онли
	blast_maxDistance	= 1,		-- 0.1+ time*range_charge_coef   -- max = 151
	self_damage_coef	= 0, --не дамагаем себя.

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	effect 				= "particles/weapons/big/black_bomb_explosion",
	light_color 		= "220 60 60 100",
	light_radius 		= 10,
	light_time 			= 0.5,
	sound 				= "sound/explosion/big_rocket_expl",
}

Def.Module_FuelEmissionsScout =
{
	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 10,

	cooldown				= 2,
	spell					= "FuelEmissionsScout",

	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/el_modules/fuel_em",
}

Def.HealBotMMM = 
{
	inherit = "HealBot",
	spell = "MMM",
}

Def.Module_DodgeDrive =
{
	class 						= "SpaceShipModule",
	in_editor 					= false,


	cooldown					= 2,
	cooldown_on_equip			= 10, -- нельзя использовать после рождения
	show_cooldown_status		= true,
	is_fast_movement			= true,
	double_left_spell 			= "DodgeDrive_l",
	double_right_spell 			= "DodgeDrive_r",
	double_up_spell				= "DodgeDrive_up",
	double_down_spell			= "DodgeDrive_down",
	silence_as_active_module	= true,
}


Def.Module_SaveBack = {
	class 					= "SpaceShipModule",
	--spell_on_equip			= "FireStealingPot",
	--spell_on_equip			= "KatanaEnergy",
	emergency_barrier_spell	= "SaveBack",
	cooldown				= 10,
	show_cooldown_status	= true,
}

Def.Module_ReflectorResonance = {
	class 					= "SpaceShipModule",
	shield_disabled_spell	= "ReflectorResonance",
	show_cooldown_status	= true,
	cooldown				= 10,
}

Def.Module_ShellRestoration = {
	class 					= "SpaceShipModule",
	spell_on_special_activate = "ShellRestoration",
	show_cooldown_status	= true,
	cooldown				= 10,
}

Def.Module_HackWeapon =
{
	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 10,

	cooldown				= 2,
	spell					= "HackWeapon",
	-- additional_spell		= "HackWeapon_Self",
	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_DisableWeapon = 
{
	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 10,

	cooldown				= 2,
	spell					= "DisableWeapon",
	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
	activate_effect 		= "particles/gadget/disable_weapon_wave",
}

Def.Module_EnlargeActiveCooldown =
{
	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 10,
	
	ignore_silence			= true,

	cooldown				= 20,
	spell					= "EnlargeActiveCooldown0",
	--additional_spell		= "EnlargeActiveCooldown_Self",
	additional_spell		= "ECMCommon",

	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
}

 Def.Module_HackEntity = 
 {
 	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 10,
	
	cooldown				= 6,
	spell					= "HackEntity",
	additional_spell		= "HackEntity_Self",
	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
 }
 
Def.Module_DisableWeaponFireRate = 
{
 	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 10,
	
	cooldown				= 35, --35
	spell					= "DisableWeaponFireRate",
	--additional_spell		= "HackEntity_Self",
	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_Blind = 
{
 	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 10,
	
	cooldown				= 2, --9
	spell					= "Blind",
	additional_spell		= "ECMCommon",
	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_TacticalCalculation = {
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_max_speed_minus 	= "TacticalCalculation",
	max_speed_percent			= 0.1,
	max_speed_activation_time	= 1,   -- 
	--show_cooldown_status	= true,
	--cooldown				= 10,
}

Def.Module_WeaknessSense = {
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_death_someone 		= "WeaknessSense",
	spell_on_death_trigger_target	= --здесь нужен area = ai.SpellTargetArea.AROUND к spell_on_death_trigger_range
	{
		class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area = ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ENEMY,
		vitality = ai.SpellTargetVitality.DEAD,
	},
	spell_on_death_trigger_range	= 1000,
}

Def.Module_SuperChamelion = {
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_max_speed_minus 	= "SuperChamelion",
	max_speed_percent			= 0.05,
	max_speed_activation_time	= 3, --
	--show_cooldown_status	= true,
	--cooldown				= 10,
}


Def.Module_SniperDamageZone  = 
{
	class 					= "ActiveModule",
	in_editor 				= false,

	energy_cost				= 10,
	
	cooldown				= 2, --9
	spell					= "SniperDamageZone",
	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_SmallReverseThruster  =
{
	class 					= "ActiveModule",
	in_editor				= false,
	cooldown				= 5,
	energy_cost 			= 10,
	spell					= "SmallReverseThruster_Weakness",
	deactivate_spell		= "SmallReverseThruster",
	activate_sound 			= "sound/gadgets/common_activate",
	is_fast_movement		= true,
}

Def.Module_EngineAmplifier  =
{
	class 					= "ActiveModule",
	in_editor				= false,
	cooldown				= 5,
	energy_cost 			= 10,
	spell					= "EngineAmplifier",
	activate_sound 			= "sound/gadgets/common_activate",
}


Def.Module_SniperDefender =
{
	inherit 				= "Module_SentryDrone",
	activate_entity			= "SniperDefender",

	cooldown				= 5,
	energy_cost 			= 10,
	
	fire_rate				= 220,
	dispersion				= 0.1,
	optimal_range			= 208,--125,
	max_range				= 250,
	
	spell					= "SniperDefender",
	activate_entity_health	= 1000,
	spawn_offset 			= Vec3( 0, 75, -8 ),
	check_spawn_collision 	= true,
	activate_entity_ttl		= 180,



	--projectile_speed		= 250,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 10,
	max_aim_rot_speed		= 270,
	projectile_speed		= 1000,
	
	activate_sound 			= "sound/gadgets/common_activate",
}

Def.SniperDefender =
{
	inherit 				= "SentryDrone",
	model					= "models/objects/vital_point/new_year_drone/new_year_drone",
	--active_spell			= 'Tackler_DisableJump',
	--хотел ракету но она не летает
	--projectile				= "SpaceMissile_SD_RL",
	--projectile				= "Projectile_SentryDron",
	projectile				= "Projectile_Dron_Plasma",
	uiName 					= "SniperDefender_name",
}

Def.Module_WeaponAmplifier =
{
	class 					= "ActiveModule",
	in_editor				= false,
	cooldown				= 5,
	energy_cost 			= 10,
	spell					= "WeaponAmplifier",
	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_HugeHullDevastator =
{
	class 					= "ActiveModule",
	in_editor				= false,
	cooldown				= 5,
	energy_cost 			= 10,
	spell					= "HugeHullDevastator",
	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_FocusedRay  =
{
	class 			= "ActiveModule",
	in_editor 		= false,

	model 					= "models/weapons/plasma/power/vortex",

	cooldown		= 4,
	energy_cost		= 12,
	
	check_aim_orientation_angle = 180,
	track 			= ai.TrackMode.AIM,
	barrel_rot_speed = 360,
	--stop_barrels 	= ai.BarrelsStopMode.ACTIVE,

	spell 			= "FocusedRay", -- TRay
	--spell 			= "TRay", -- 

	activate_sound 	= "sound/destroyer/TRay_fire",

	default_icon 	= "ItemSubtype_ColdRay",
}

Def.Module_HackRocket = {
	class 				= "ActiveModule",
	in_editor 			= false,

	model 				= "models/weapons/plasma/power/vortex",

	cooldown			= 4,
	energy_cost			= 12,
	
	spell 				= "HackRocket", 
	activate_sound 		= "sound/gadgets/common_activate",
}
Def.Blastwave_HackRocket =   --   Если в SECONDARY_WEAPON установлен модуль RocketLauncher и в качестве боеприпасов используются ракеты (Rocket), то порождается blastwave из ракет. Если blastwave отсутствует или установлен другой модуль, то порождается blastwave, прописанный в поле explosion_blast_wave спелла.
{
	class				= "BlastWave",
	in_editor			= false,
	damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 27,
	apply_damage		= true,
	apply_shake 		= true,
	effect 				= "particles/explosions/big_fire_2",
	light_color 		= "255 230 80 100",
	light_radius 		= 30,
	light_time 			= 0.5,
	sound 				= "sound/explosion/mine_expl",
}

Def.Module_BeaconActiveSilence = {
	class 					= "ActiveModule",
	in_editor 				= false,

	model 					= "models/weapons/plasma/power/vortex",

	cooldown				= 4,
	energy_cost				= 12,

	spell 					= "BeaconActiveSilence",


	--activate_entity			= "BeaconActiveSilence",

	activate_entity_health	= 300,
	spawn_offset 			= Vec3( 0, -4, -4 ),
	check_spawn_collision 	= true,
	--activate_entity_ttl		= 12,

	activate_sound 		= "sound/gadgets/common_activate",
}

Def.BeaconActiveSilence =
{
	class				= "AuraHolderEntity",

	in_editor			= false,
	damageable			= true,
	health 				= 400,
--[[		ttl					= 5,
	]]

	model				= "models/weapons/drones/healbot/healbot",
	signature			= ai.Signature.TINY,
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000, damping = 0.4, rot_damping = 0.4, hitbox = true },
	--physics			= { solid_type = solid.box,  hitbox = true,  material = "Metal", mass = 1000, }, --kinematic = true,

	--hudType 			= "minor", --"loot_crate",--Turret",--"loot_crate",--minor",
	hudType				= "default",
  	hud_visibility_type = "minor",

	uiName 				= "BeaconActiveSilence",
	--uiDesc 			= "DestrHfauealBot_Desc",		 --Module_ShieldRayLarge_Desc

	death_effect		= "particles/explosions/shp_exp_small_02",
--	end_sound			= "",
	death_sound			= "sound/explosion/drone_expl",
}
--Module_SpeedInsteadShield_T1_Mk1
Def.Module_SpeedInsteadShield = 
{
	class 						= "SpaceShipModule",
	in_editor 					= false,
	shield_disabled_spell 		= "SpeedInsteadShield",
	cooldown					= 10,
	show_cooldown_status 		= true,
}

Def.Module_EnergyFlowBalancer = 
{
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_equip 				= "EnergyFlowBalancer",
}

Def.Module_BindingShield = 
{
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_equip 				= "BindingShield",
}


Def.Module_DronDamageMod = 
{
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_equip 				= "DronDamageMod",
}

Def.Module_PreparationAdaptation =
{
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_max_speed_minus 	= "PreparationAdaptation",
	max_speed_percent			= 0.35,--0.15,--0.05,
	max_speed_activation_time	= 1,
}


Def.Module_DivineStorm = {
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 100,
	energy_cost_additional		= 0, -- не сжигает то, что ниже 0%
	param_modificator			= 3,  --  увеличивает aura_param и influence_param на param_modificator*"количество дополнительной энергии" 

	
	spell 						= "DivineStorm", 
	additional_spell			= "DivineStorm1", 
	activate_sound 				= "sound/gadgets/common_activate",
}

--------------------------
Def.Module_ParticleExplosion =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	class				= "FiringModule",

	cooldown			= 2,
	energy_cost 		= 10.0,

	projectile 			= "Projectile_ParticleExplosion",
	projectile_speed 	= 300,  -- 5 секунд лета
	max_range			= 500,  -- 5 секунд лета
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,

	dispersion			= 0,
	crit_chance			= 0,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 6000,
	damage_thermal		= 0,
	-- trigger_projectile	= true, --детонировать заряд при повторном нажатии модуля --#83218 теперь используется поле shoot_mode
	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
}

Def.Projectile_ParticleExplosion =
{
	inherit				= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave = "Blastwave_ParticleExplosion",
	override_blast_wave_damage = true,

	spell 				= "ParticleExplosion",

	detonation_radius	= 1,

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_mid",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
}

Def.Blastwave_ParticleExplosion = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 5,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 60,
	self_damage_coef	= 0,
	
	--damage_emp			= 5000,
	
	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	effect 				= "particles/explosions/explosion_big2_emp",
	light_color 		= "140 190 255 100",
	light_radius 		= 40,
	light_time 			= 0.5,
	sound 				= "sound/explosion/big_rocket_expl",
}

Def.Module_MatterFlow = {
	class 					= "ActiveModule",
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 2,
	energy_cost				= 10,
	energy_cost_per_second 	= 150,
	
	trigger_aura 			= true,

	spell 					= "MatterFlow",

	--activate_sound 			= "sound/destroyer/TRay_fire",
	activate_sound 				= "sound/gadgets/common_activate",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
}

Def.Module_Primary2HullRestore = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "Primary2HullRestore", 
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_DivineSave = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 3,
	energy_cost					= 10,
	target_ally					= true,
	
	spell 						= "DivineSave", 
	additional_spell 			= "DivineSave_",

	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_CoupleSupport = 
{
	class 				= "PhaseModule",
	in_editor			= false,
	
	cooldown			= 0.5,
	energy_cost 		= 10.0,
	target_ally			= true,

	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",

	--spell				= "CoupleSupport_",
	spell0 				= "CoupleSupport1",
	spell1				= "CoupleSupport2",
	--spell2 				= "PhaseShield_Phase2_",
	
	--item_subtype		= ItemSubtype.PhaseShield,
	
	default_icon		= "ItemSubtype_CoupleSupport",
	ui_ico_0			= { target_system = { tex = "ItemSubtype_CoupleSupport1", }, },
	ui_ico_1			= { target_system = { tex = "ItemSubtype_CoupleSupport2", }, },
	--ui_ico_2			= { target_system = { tex = "ItemSubtype_PhaseShield_Phase2", }, },
}


--------------------------
Def.Module_CalibrationGrenade =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	--model 				= "models/modules/m_active/m_a_gadget_shield",
	class				= "FiringModule",

	cooldown			= 2,
	energy_cost 		= 10.0,

	projectile 			= "Projectile_CalibrationGrenade",
	projectile_speed 	= 300,  
	max_range			= 450,  
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,

	dispersion			= 0,
	crit_chance			= 0,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 5000,
	damage_thermal		= 0,
	-- trigger_projectile	= true, --детонировать заряд при повторном нажатии модуля --#83218 теперь используется поле shoot_mode
	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
}

Def.Projectile_CalibrationGrenade =
{
	inherit				= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave = "Blastwave_CalibrationGrenade",
	override_blast_wave_damage = true,

	spell 				= "CalibrationGrenade",

	detonation_radius	= 1,

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_mid",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
}

Def.Blastwave_CalibrationGrenade = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 5,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 75,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	effect 				= "particles/explosions/explosion_big2_emp",
	light_color 		= "140 190 255 100",
	light_radius 		= 40,
	light_time 			= 0.5,
	sound 				= "sound/explosion/big_rocket_expl",
}
--надо ли? давайте нет
--[[
Def.CalibrationGrenade =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= true,
	model				= "models/weapons/drones/healbot/healbot",
	signature			= ai.Signature.TINY,
	physics				= { solid_type = solid.sphere, material = "Metal", mass = 1000, damping = 0.4, rot_damping = 0.4, hitbox = true },
	hudType				= "default",
  	hud_visibility_type = "minor",
	uiName 				= "CalibrationGrenade",
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
}
]]

Def.Module_MultiPurposeAdaptor =
{
	class 						= "SpaceShipModule",
	in_editor 					= false,
	--супер ресист на термал если на скорости, если энергия на максимуме + крит
	spell_on_max_energy_plus 	= "MultiPurposeAdaptor_Crit",
	max_energy_percent 			= 0.95,
	spell_on_max_speed_plus		= "MultiPurposeAdaptor_Resist",
	max_speed_percent			= 0.95,
	cooldown					= 0,
}

Def.Module_Jump2Dude = 
{
	class 						= "ActiveModule",
	in_editor 					= false,
	target_ally					= true,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "Jump2Dude", 
	additional_spell			= "Jump2Dude1", 
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_PrimaryNanoRobots = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "PrimaryNanoRobots",--Primary2HullRestore 
	spell_on_equip				= "PrimaryNanoRobots_Passive", 
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_AdditionalShield =
{
	class 						= "SpaceShipModule",
	in_editor 					= false,
	shield_disabled_spell		= "AdditionalShield",
	cooldown					= 10,
}
Def.Shell_AdditionalShield =
{
	class 				= "ScBaseEntity",

	health 				= 500, --
	ttl					= 5,
	damageable			= true,
	network_sync 		= true,

	--spell_on_ttl		= "Bonus_damage",
	effect = "particles/gadget/pshield_1",

	ui_color			= 0xFFFFCCFF,
}

Def.Module_SafeSpecial = {
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_special_activate	= "SafeSpecial"
	--cooldown					= 1,
}

Def.Module_RebalancedDefense =  {
	class 						= "SpaceShipModule",
	in_editor 					= false,
	max_speed_mul				= 0.07,
	acceleration_mul			= 0.1,
	spell_on_max_speed_minus	= "RebalancedDefense",
	max_speed_percent 			= 0.2,
	--cooldown					= 1,
}

Def.Module_ShieldAdaptation = {
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_equip				= "ShieldAdaptation",
}

Def.Module_AdaptiveFire = {
	class 						= "SpaceShipModule",
	in_editor 					= false,
	focus_spell					= "AdaptiveFire",
}

Def.Module_ShieldRecycler = {
	class 						= "SpaceShipModule",
	in_editor 					= false,
	shield_regen_mul			= 0.2,
	
	spell_on_death_someone 		= "ShieldRecycler",
	spell_on_death_trigger_target	= --здесь нужен area = ai.SpellTargetArea.AROUND к spell_on_death_trigger_range
	{
		class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area = ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ALLY,
		vitality = ai.SpellTargetVitality.DEAD,
	},
	spell_on_death_trigger_range	= 300,
}

Def.Module_AdaptiveDefense  =
{
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_equip				= "AdaptiveDefense1",  -- бафаем друзей вокруг
	focus_spell					= "AdaptiveDefense", -- бафаем себя по количеству входящего урона
}

Def.Module_Hook = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "Hook0",
	additional_spell			= "Hook_Self",
	activate_sound 				= "sound/gadgets/common_activate",
	--work_beam_fx 				= "particles/gadget/attraction_beam",
}

Def.Module_SpaceSqueezer = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "SpaceSqueezer",
	additional_spell			= "SpaceSqueezer_Self",
	deactivate_spell			= "SpaceSqueezer1",
	activate_sound 				= "sound/gadgets/common_activate",
	--work_beam_fx				= "particles/gadget/exhaustion_beam_energy",
}

Def.Module_EnhanceWeapon = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "EnhanceWeapon",
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_MissileReflector = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "MissileReflector",
	additional_spell			= "MissileReflector_Self",
	activate_sound 				= "sound/gadgets/common_activate",
}


Def.Module_SafeAcceleration = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "SafeAcceleration",
	activate_sound 				= "sound/gadgets/common_activate",
	--activate_module_effect 		= "particles/gadget/default_module_work",
}


Def.Module_RocketRing  =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	class				= "FiringModule",

	cooldown			= 2,
	energy_cost 		= 10.0,

	projectile 			= "Projectile_RocketRing",
	
	projectile_speed 	= 200,  
	max_range			= 450,  
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,

	dispersion			= 0,
	crit_chance			= 0,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 3000,
	damage_thermal		= 0,
	-- trigger_projectile	= true, --детонировать заряд при повторном нажатии модуля --#83218 теперь используется поле shoot_mode
	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode
	detonate_at_point 	= true,

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
}
Def.Projectile_RocketRing =
{
	inherit				= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo_big",
	explosion_blast_wave = "Blastwave_RocketRing",
	override_blast_wave_damage = true,
	missile_defence_immune = true,	
	missile_detection_immune = true,
	detonation_timeout	= 0.1,

	--spell 				= "CalibrationGrenade",
	detonation_radius	= 1,

	detonate_on_distance= 60,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.
	child_rockets =
	{
	    rocket = "Projectile_RocketRing1",
	    --rocket = "SpaceMissile_Standart_T1_Mk1",

	    sphere_radius = 3, -- опционально
	    
	    -- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
	    -- Общее количество ракет не должно превышать 20
	    scheme = {
	        circle0 = { amount = 1, angle = 0, },
	        --circle1 = { amount = 3, angle = 7, }, -- опционально
	        circle1 = { amount = 12, angle = 90, }, -- опционально
	        --circle3 = { amount = 6, angle = 120, }, -- опционально
	    },

	    --описание целей для управляемых ракет. Поддерживается не более 10 целей
	    direct_to_target = {
	        class = ai.SpellTargetClass.SHIP,
	        area = ai.SpellTargetArea.AROUND,
	        relationship = ai.SpellTargetRelationship.ENEMY,
	    },
	    direct_range = 150, -- радиус поиска целей для управляемых ракет
	    max_rockets_per_target = 3, -- количество управляемых ракет на одну цель
	    
	},

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_mid",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
}
Def.Projectile_RocketRing1 =
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_RocketRingFinal",
	model				= "models/weapons/bs_torpedo_small",
	override_blast_wave_damage = true,
	detonation_radius	= 10,
	--projectile_speed 	= 300,  
	max_range			= 250,  
	speed 				= 90,
	angular_velocity 	= 120,
	is_guided 			= true,
	
	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "plasma",
}
Def.Blastwave_RocketRing = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 10,
	--constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 18,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	--damage_kinetic 		= 100,

	effect = "particles/explosions/explosion_big2_emp",
	light_color = "140 140 240 100",
	light_radius = 30,
	light_time = 0.8,
	sound 				= "sound/explosion/big_rocket_expl",
}
Def.Blastwave_RocketRingFinal = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 3,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 15,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	--damage_kinetic 		= 100,

	effect = "particles/explosions/expl_1_energy",
	light_color = "140 140 240 100",
	light_radius = 15,
	light_time = 0.8,
	sound 				= "sound/explosion/big_rocket_expl",
}

Def.Module_Immortality = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "Immortality",
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_RamCharge = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "RamCharge",
	additional_spell			= "RamCharge_Self",
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_HunterZone = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "HunterZone",
	additional_spell			= "HunterZone_Self",
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_LanceWeakness = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "LanceWeakness",
	additional_spell			= "LanceWeakness_Self",
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_CivilianRepair = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1, --  15   (15/12)
	energy_cost					= 10, -- 4/5 от пула перехвата
	
	spell 						= "CivilianRepair",
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_LossOfSignatures = 
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/weapons/plasma/power/vortex",

	cooldown					= 1,
	energy_cost					= 10,
	
	spell 						= "LossOfSignatures",
	additional_spell			= "LossOfSignatures_HealBan",
	ignore_silence				= true,
	activate_sound 				= "sound/gadgets/common_activate",
}

Def.Module_EnginePowerRedistributor = 
{
	class = "SpaceShipModule",
	item_subtype = ItemSubtype.HackSystems,
	cooldown_mul = -0.176, -- -15%
	spell_on_module_activate  = "EnginePowerRedistributor",
	spell_on_special_activate = "EnginePowerRedistributor",
	unique_equip = true,
}

Def.Module_PowerInstabilityShot =
{
	class 					= "ActiveModule",
	in_editor				= false,
	item_subtype 			= ItemSubtype.HackSystems,
	cooldown				= 5,
	energy_cost 			= 10,
	spell					= "PowerInstabilityShoter",
	activate_sound 			= "sound/gadgets/common_activate",
}

Def.Module_SmokeRocket = --#88160: Активный модуль для командника: дымовая граната
{
	class					= "FiringModule",
	shoot_mode				= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --повторная активация детонирует прожектайл
	in_editor 				= false,

	model 					= "models/weapons/plasma/power/vortex",

	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 180,

	cooldown				= 3,
	energy_cost 			= 10,
	track 					= ai.TrackMode.AIM,

	projectile 				= "Projectile_SmokeRocket",
	projectile_speed 		= 100,
	max_range				= 300,

	muzzleflash_color = { kinetic = "220 78 53 100", emp = "220 78 53 100", thermal = "220 78 53 100", },
	muzzleflash_radius 		= 25,

	--damage				= 0,
	--damage_kinetic		= 0,
	--damage_emp			= 0,
	--damage_thermal		= 0,
	shot_once_sound 	= "sound/weapons/rockets/rocket_aamu_t3_launch",
	launch_beam_fx		= "particles/weapons/big/herculesorb_beam",
}

Def.Projectile_SmokeRocket = --#88160: Активный модуль для командника: дымовая граната
{
	inherit					= "Weapon_BaseRocket",
	model 					= "models/weapons/bs_torpedo_small",
	-- model				= "models/turret/huge_module_drone/dron",

	explosion_blast_wave 	= "Blastwave_SmokeRocket",
	override_blast_wave_damage = true,

	missile_defence_immune 	= false,
	missile_detection_immune = true,

	detonation_radius		= 10,
	is_guided 				= false,
	spell					= "SmokeByRocket",
	death_entity			= "SmokeSphere",

	flare_color				= "255 235 180 10",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,

	work_sound				= "sound/weapons/rockets/rocket_fly",

	effect 					= "particles/weapons/missile/rocket_trail_small",
}

Def.SmokeSphere =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	--class_mask		= ai.ShipClass.MEDIUM,
	
	
	-- damage_to_ship_energy_coef = 0.033333333333,
	damageable 		= false,
	--health 			= 50000,
	ttl				= 10,
	
	hack_immune 	= true,

	--death_sound		= "sound/explosion/drone_expl",
	--default_icon	= "ItemSubtype_FrontEnergyShield",
	
	--start_sound  	= 	"sound/destroyer/SShield_activate",
	--end_sound	=	"sound/destroyer/SShield_off",
	--death_sound	=	"sound/destroyer/SShield_off",
	-- is_shield		= true, --#

	--model			= "models/shields/shield_cover",
	physics			= { solid_type = solid.sphere, sphere_radius = 75,  hitbox = true, kinematic = true, }, -- material = "GiantShield", kinematic = true,
	smart_shield_radius	= 75,  --#90547  --Используется, чтобы определить, влетает пуля(или лазер) в щит снаружи или вылетает из него.
	radar_vison		= ai.ShieldRadarVisionMode.BLOCK,    
		-- ai.ShieldRadarVisionMode.PASS - пропускает все,  
		-- ai.ShieldRadarVisionMode.BLOCK - блокирует все, 
		-- ai.ShieldRadarVisionMode.BLOCK_ENEMY - блокирует радарную видимость врагов.
	weapon_mode		= ai.ShieldWeaponMode.PASS,

	-- death_effect	= "particles/gadget/cover_shield_end",
	-- end_effect		= "particles/gadget/cover_shield_end",
	-- uiName 			= "GigantShield",
	show_after 		= 0.2,
	
	
}

Def.Blastwave_SmokeRocket = --#88160: Активный модуль для командника: дымовая граната
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 10,
	blast_minDistance	= 5,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/areal/spacedust_explosion",
	light_color 		= "255 160 80 100",
	light_radius 		= 12,
	light_time 			= 0.5,
	sound 				= "sound/explosion/smoke_rocket_expl",
}



Def.Module_AttrackerField = --#87316: Толкающее поле для прикрытия.
{
	class					= "FiringModule",
	shoot_mode				= ai.FiringModuleShootMode.SINGLE_SHOT, --повторная активация детонирует прожектайл
	in_editor 				= false,

	model 					= "models/weapons/plasma/power/vortex",

	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 180,

	cooldown				= 3,
	energy_cost 			= 10,
	track 					= ai.TrackMode.AIM,

	projectile 				= "Projectile_AttrackerField",
	projectile_speed 		= 100,
	max_range				= 275,

	muzzleflash_color = { kinetic = "220 78 53 100", emp = "220 78 53 100", thermal = "220 78 53 100", },
	muzzleflash_radius 		= 25,

	--damage				= 0,
	--damage_kinetic		= 0,
	damage_emp			= 1000,
	--damage_thermal		= 0,
	shot_once_sound 	= "sound/gadgets/IsotopeHarvester/ih",
	--launch_beam_fx		= "particles/weapons/big/herculesorb_beam",
}

Def.Projectile_AttrackerField = 
{
	class					= "SingularityProjectile",
	in_editor				= false,

	hitbox_min 				= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max				= Vec3( 0.1, 0.1, 0.1 ),
	impact_type 			= "singularity",

	--detonation_radius	= 0.1,
	damage_radius			= 20,

	flare_color				= "0 0 255 25",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,

	spell_on_pass			= "AttrackerField",
	spell_on_pass_radius	= 20,
	-- spell_on_launch			= "AttrackerField", --!!!

	effect 					= "particles/gadget/attrracker_projectile",
	singularity_hit_fx 		= "particles/empty",
	hit_effect				= "particles/weapons/plasma/hit",
	kill_effect_on_remove 	= false,

	singularity_hit_sound	= "sound/hit/plasma-ShipMetalMk1",
	--work_sound 	    = "",

}

Def.Module_EnergyInducedShield =
{
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	in_editor				= false,
	item_subtype			= ItemSubtype.ExtendedBallisticsCPU,
	spell_on_equip			= "AddShieldResust",
	unique_equip			= true, --не более одного в вооружении
}

Def.Module_DetectionBeacon = 
{
	class 					= "ActiveModule",
	in_editor				= false,
	item_subtype 			= ItemSubtype.HackSystems,
	cooldown				= 5,
	energy_cost 			= 10,
	spell					= "DetectionBeacon",
	activate_sound 			= "sound/gadgets/common_activate",
}

--SNIPER_OVERLOAD +SNIPER_DEFENCE_IMMUNE

Def.Module_SafeSniper = 
{
	class 					= "ActiveModule",
	in_editor				= false,
	item_subtype 			= ItemSubtype.SafeSniper,
	cooldown				= 5,
	energy_cost 			= 10,
	spell					= "SafeSniper",
	additional_spell		= "SafeSniper1",
	activate_sound 			= "sound/gadgets/common_activate",
}


Def.Module_CooldownDownOnEnemyDeath = {
	class 						= "SpaceShipModule",
	in_editor 					= false,
--	shield_regen_mul			= 0.2,
	
	spell_on_death_someone 		= "CooldownDownOnEnemyDeath",--"CooldownDownOnEnemyDeath",
	spell_on_death_trigger_target	= --здесь нужен area = ai.SpellTargetArea.AROUND к spell_on_death_trigger_range
	{
		class 		= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area 		= ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ENEMY,
		vitality 	= ai.SpellTargetVitality.DEAD,
		misc		= ai.SpellTargetMisc.DEBUFFED_BY_CASTER,
	},
	spell_on_death_trigger_range	= 250,
}

Def.Module_SpecialStunClone =  --#37141
{
--inherit	= "Module_FakeShips_T4_Mk1",
	class					= "ActiveModule",
	--tier					= 4,
	--item_lvl				= 15,
	--cant_be_bought 			= true,
	--drop_weight				= 0,
	cooldown				= 35,
	energy_cost				= 100,
	
	item_subtype 			= ItemSubtype.SpecialStunClone,
	module_type				= ai.ModuleType.SPECIAL,
--

	spawn_guided_clone		= true,
	
	spell 					= "SpecialStunClone",


	spell_on_clone_death	="SpecialStunClone_Stun",
	guided_clone_detonation_radius = 8,
	--spawn_clones	= nil,
	spawn_clones_radius 	= 1.5,
	clones_power 			= 1,
	clones_ttl  			= 10,
	
	--death_blast_wave_clone =  "BlastWave_SM_DoomDay_T5", -- прописано в шипс луа.
	default_icon 			= "ItemSubtype_SpecialStunClone",

	-- Cybersport restrictions
	ods_export		= true,
	storeItemId		= 1,
	tier			= 4,
	item_lvl		= 23,
	rank_min		= 1,
	rank_max		= 17,
	premiumPrice	= 99999,
	cant_be_bought	= true,
}


Def.Module_TurningTide =
{
	class				= "FiringModule",
	in_editor 			= false,

	model 				= "models/weapons/plasma/power/vortex",
	--check_aim_orientation = true,

	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 380,


	cooldown			= 35,--20, -- кд запускается после отработки спелла (+7 сек)
	energy_cost 		= 200,
	track 				= ai.TrackMode.AIM,
	max_range			= 300, --2.5cek
	--stop_barrels		= ai.BarrelsStopMode.ACTIVE,
-----
	damage_emp			= 0, --1100,
	dispersion			= 0,   -- Это пишется в тултипе      --до  #68720   было   25
	--target_cone_angle 	= 25, -- Это угол самонаведения
	--ammo				= 3,
	-- auto_shoot_active 	= true,  --#83218 теперь используется поле shoot_mode
	--shoot_mode = ai.FiringModuleShootMode.SINGLE_SHOT,
	shoot_mode 			= ai.FiringModuleShootMode.AUTO_CHARGE_DAMAGE,
	damage_charge_max	= 1500, --1500,
	damage_charge_mask  = ai.ChargeType.DAMAGE_SHIP,--DAMAGE_SHIP_SHIELD, --ai.ChargeType.DAMAGE_SHIP, -- - тип урона:  #86742
	duration			= 7,
	--spell				= "TurningTide_Self", --   Спелл не работает !!!1
	additional_spell	= "TurningTide_Self", -- HunterZone_Self
	--fire_rate 			= 180,
	--target_cone_angle = 30,
	--max_projectiles_per_target = 1,
-----
	projectile 			= "Projectile_TurningTide",
	projectile_speed 	= 150, --2.5cek

	default_icon 		= "ItemSubtype_TurningTide",
	item_subtype 		= ItemSubtype.TurningTide,
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 	= 10,
	muzzleflash_time 	= 1.0,
	long_shot_effects 	= true,
	shot_effect 		= "particles/weapons/destroyer_rocket_start",
	activate_sound 			= "sound/gadgets/common_activate", --?

	shot_once_sound 			= "sound/gadgets/WolfPack/wp",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance 		= 0,
	activate_effect = "particles/gadget/turning_tide",
	
	module_type			= ai.ModuleType.SPECIAL,
	
	-- Cybersport restrictions
	ods_export		= true,
	storeItemId		= 1,
	tier			= 5,
	item_lvl		= 23,
	rank_min		= 1,
	rank_max		= 17,
	premiumPrice	= 99999,
	cant_be_bought	= true,
}



Def.Projectile_TurningTide = 
{
	class					= "SingularityProjectile",
	in_editor				= false,
	
	spell_on_launch			= "TurningTide",

	hitbox_min 				= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max				= Vec3( 0.1, 0.1, 0.1 ),
	impact_type 			= "singularity",

	--detonation_radius	= 0.1,
	damage_radius			= 20,

	flare_color				= "0 0 255 25",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,

--	spell_on_pass			= "AttrackerField",
--	spell_on_pass_radius	= 20,
-- spell_on_launch			= "AttrackerField",

	--effect 					= "particles/weapons/big/hamstring_blue_projectile",
	effect 			= "particles/gadget/turning_tide_projectile",
	singularity_hit_fx 		= "particles/empty",
	hit_effect				= "particles/weapons/plasma/hit",
	kill_effect_on_remove 	= false,

	singularity_hit_sound	= "sound/hit/plasma-ShipMetalMk1",
	--work_sound 	    = "",
	impact_type 	= "singularity",

	work_sound 	    = "sound/weapons/singularity/sg_fly",

	
--	singularity_hit_fx = "particles/empty",
--	singularity_hit_sound = "sound/hit/singularity_ship",
}
--[[
Def.Projectile_TurningTide2 =
{
	class						= "Rocket",
	explosion_blast_wave		= "Blastwave_TurningTide",
	override_blast_wave_damage 	= true,
	--missile_defence_immune 		= true,
	--missile_detection_immune	= true,
	acceleration_time 	= 1,

	--angular_velocity			= 70,
	--is_guided					= true,
	--time_to_live				= 7,

	effect 						= "particles/weapons/mid/wolf_projectile",

	detonation_radius			= 3,

	flare_color					= "55 50 250 0",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,
--	whiz_sound 					= "sound/whiz/energy2",
--	whiz_sound_radius 			= 40,
	work_sound 					= "sound/gadgets/Vortex/vortex_fly",

}

Def.Blastwave_TurningTide =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 100,
	blast_maxDistance		= 5,
	apply_damage			= true,

	effect 					= "particles/weapons/mid/wolf_explosion",
	light_color 			= "160 232 255 128",
	light_radius 			= 10,
	light_time 				= 0.2,
	sound 					= "sound/explosion/PlasmaVolley_expl",
}
]]


Def.Module_LandingTurret = 
{
	class 						= "LandingModule",
	in_editor 					= false,
	
	--trigger_aura	= true,

	
	max_speed 					= 60, -- допустимая скорость посадки,
	landing_max_range			= 35, -- максимальная высота над поверхностью [1, 100],
	landing_max_angle 			= 45, -- максимальный угол от нормали к поверхности [1, 45],
	landing_pos_offset 			= 1.6,  -- высота корабля над поверхностью, когда корабль посажен.

	--model 						= "models/weapons/plasma/power/vortex",
	
	cooldown					= 25,   --  30
	energy_cost					= 150,  --  200
	item_subtype				= ItemSubtype.LandingTurret,
	
	spell 						= "LandingTurret",
--	additional_spell				= "LandingTurret",
	
	activate_entity				= "AuraHolderShieldLandingTurret",
	--attach_bone
	activate_entity_ttl			= 23,
	--activate_entity_health
	
	--deactivate_spell			= "SpaceSqueezer1",
	activate_sound 				= "sound/gadgets2/DisintegratorRay_Landing/dr_activate",
	deactivate_landing_sound 			= "sound/gadgets2/DisintegratorRay_Landing/dr_deactivate",

	default_icon				= "ItemSubtype_LandingTurret",
	ui_ico_0					= { target_system = { tex = "ItemSubtype_LandingTurret", }, },
	ui_ico_1					= { target_system = { tex = "Action_Landing", }, },
	
	module_type			= ai.ModuleType.SPECIAL,
	
	-- Cybersport restrictions
	ods_export		= true,
	storeItemId		= 1,
	tier			= 5,
	item_lvl		= 23,
	rank_min		= 1,
	rank_max		= 17,
	premiumPrice	= 99999,
	cant_be_bought	= true,
}


Def.AuraHolderShieldLandingTurret =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	--class_mask		= ai.ShipClass.MEDIUM,
	
	
	-- damage_to_ship_energy_coef = 0.033333333333,
	damageable 		= true,
	health 			= 45000,
	ttl				= 23,
	
	hack_immune 	= true,

	start_sound  	= 	"sound/destroyer/SShield_activate",
	end_sound	=	"sound/destroyer/SShield_off",
	death_sound	=	"sound/destroyer/SShield_off",
	is_shield		= true, --#

	model			= "models/shields/turret_shield",
	--model			= "models/shields/shield_stationary",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	smart_shield_radius = 10,  --#90547
	radar_vison		= ai.ShieldRadarVisionMode.PASS,
	weapon_mode		= ai.ShieldWeaponMode.BLOCK_ENEMY,

	-- death_effect	= "particles/gadget/cover_shield_end",
	-- end_effect		= "particles/gadget/cover_shield_end",
	-- uiName 			= "GigantShield",
	show_after 		= 0.2,
	children = 
	{
		{ effect	= "particles/gadget/stationary_turret", },
	}
}
--AuraHolderShieldLandingTurret
--model			= "models/shields/shield_cover",


Def.Module_PiligrimShield2Speed =  {
	class 						= "SpaceShipModule",
	in_editor 					= false,
	max_speed_mul				= 0.07,
	acceleration_mul			= 0.07,
	spell_on_max_shield_minus	= "PiligrimShield2Speed",
	max_shield_percent 			= 0.75,
	--cooldown					= 1,
}

Def.PlatformCompanion =
{
	class					= "GuidedDrone",
	in_editor				= false,

	--model					= "models/weapons/drones/sentry_drone/sentry_drone",
	model					= "models/objects/green_drones/dron_shooter", -- too small 1.2
	physics					= { solid_type = solid.model, material = "ShipMetalMk3", mass = 100,  damping = 0.4, rot_damping = 0.4,  },

	death_effect			= "particles/explosions/shp_exp_mid_alien",
	death_sound				= "sound/explosion/drone_expl",

	projectile				= "Projectile_PlatformCompanion",
	shot_effect 			= "particles/weapons/drongun/muzzle",

	shot_once_sound 		= "sound/weapons/turret/turret_oneshot",

	signature				= ai.Signature.TINY,
	health 					= 500, --500

	max_speed				= 30,--45,
	acceleration			= 25,
	max_rot_speed			= 320,	-- deg per second --
	max_aim_rot_speed		= 720,  -- скорость поворота дрона по его оси  -- если меньше 400 то дрон иногда не успевает доворачивать и никогда не стреляет.

	weapon_slots			= 1,
	primary_weapon			= "Weapon_Companion",

	damage_emp				= 10,

	control_range			= 320,--500,
	--fire_rate				= 1,
	--dispersion				= 3,
	--optimal_range			= 30,
	--max_range				= 300,
	--projectile_speed		= 100,

	teleport_dist			= 650,		-- расстояние с которого дрон телепортируется, если следует за кораблем, работает только если есть CompanionDroneModule
	--spell 					= "Companion_Debuff",		-- спел который накладывает дрон на target, работает только если есть CompanionDroneModule

	hudType					= "default",

	uiName 					= "Companion_name",
	children 			=
		{
				{ 	effect	="particles/gadget/drone_shooter_engine", joint = "fx1" },
		},
		
	default_icon			= "ItemSubtype_LandingTurret",
}

Def.Projectile_PlatformCompanion =
{
	inherit					= "Projectile_SentryDron",
	projectile_speed		= 650,
	speed					= 650,
}

Def.Module_LandingPlatform =
{
	class						= "LandingPlatformModule",

	model						= "models/modules/m_active/elidium_modules/landing_platform",
	--model						= "models/turret/huge_module_landingplatform/landing_platform",
	
	signature		= ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 3000*2.6, --500
	health_regen 	= 75*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 4000,
	death_wreck 	= "Module_Wreck",
--	trigger_aura 	= true,

	drone						= "PlatformCompanion",
	drone_prodaction_time		= 25,
	drone_guard_range			= 100, -- радиус охранной зоны, в пределах которой дрон защищает корабль, если он не посажен на платформу и модуль не активирован.
	drone_control_range			= 300, -- радиус зоны, в пределах которой дрон может атаковать цель, когда модуль активирован
	drone_pos_offset			= Vec3( 0, 0.5, 0 ),
	drone_landing_range			= 75,
	--spell_on_guest				= "", --???

	spell_on_equip	 			= "LandingPlatform_Buff2Landed_Res", -- спел на эсминец для гостей платформы
	spell_on_parent 			= "LandingPlatform_Buff2Parent", -- спелл когда на платформе сидит алли
	spell_on_landed_ship 		= "LandingPlatform_Buff2Guest",   -- спелл на гостя - алли
	spell_on_landed_drone 		= "LandingPlatform_Heal2Drone",   -- пока дрон сидит его хилим  ---Не работает!!1
	spell_on_drone_take_off 	= "LandingPlatform_Buff2Drone",  -- только что взлетевший дрон жарит ярче

	--cooldown				= 10,


	out_sound			= "sound/gadgets2/LandingMultyPlatform/lmp_landing",
	take_off_sound			= "sound/gadgets2/LandingMultyPlatform/lmp_takeoff",
	activate_attack_sound 		= "sound/gadgets2/LandingMultyPlatform/lmp_activate",
	deactivate_attack_sound		= "sound/gadgets2/LandingMultyPlatform/lmp_deactivate",
	
	default_icon			= "ItemSubtype_LandingTurret",

	interaction_distance 	= 15,
	interacting_fx			= "particles/gadget/drone_beam", 
	uiInteract				= "Capture_ShieldGenerator",



	in_fx					= "particles/gadget/teleport",
	out_fx					= "particles/gadget/teleport",
	landed_entity_fx		= "particles/gadget/landing_platform/landing_platform_l",
	
	additional_cmd_activate_sound = "sound/gadgets2/lp_add_activate",
	additional_cmd_ui_name = "LandingPlatform",
	
	ship_class_restrictions = --ограничение размера кораблей которым доступна посадка (для конкретных слотов)
	{
		Ship_Race1_H_T5_Event =
		{
			[ ai.SpaceShipModuleSlot.ACTIVE_01 ] = ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
			[ ai.SpaceShipModuleSlot.ACTIVE_02 ] = ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
		},
	},
	
	rot_params = {
		[ai.ShipClass.SMALL]	= { rot_max_speed = 100, rot_accel = 100, rot_decel = 300, },
		[ai.ShipClass.MEDIUM]	= { rot_max_speed = 65, rot_accel = 65, rot_decel = 195, },
		[ai.ShipClass.LARGE]	= { rot_max_speed = 25, rot_accel = 25, rot_decel = 75, },
	},
}

Def.Module_SwarmControl = --#102435
{
	class				= "RemoteSwarm",
	
	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2500*2.6, --500
	health_regen 	= 48.5, --35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 5000,
	model 			= "models/modules/m_active/elidium_modules/swarm_control",
	death_wreck 	= "Module_Wreck",
	
	cooldown			= 1,
	energy_cost 		= 185,
	
	activate_damage_mul	= 0.5,
	
	remote_control_range	= 700,
	remote_control_zone_leave_timeout = 7,
	
	spell = "LandingPlatform_Buff2Parent", -- в экселе другой спелл: нарастающий ремонт корпуса хозяина на 20 сек
	--additional_spell = "LandingPlatform_Buff2Parent",
	

	--item_subtype		= ItemSubtype.RemoteDisintegrator,

	activate_sound		= "sound/swarm/swarm_activate",
	deactivate_sound	= "sound/swarm/swarm_deactivate",
}

---------------------------------------------------------------------------------
Def.Module_BFG  =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	class				= "FiringModule",
	
--	model 				= "models/weapons/plasma/power/vortex",
	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2500*2.6, --500
	health_regen 	= 48.5, --35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 5000,
	--model 			= "models/turret/huge_module_spindle/spindle",
	model 			= "models/modules/m_active/elidium_modules/bfg",
	stop_barrels	= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,
	death_wreck 	= "Module_Wreck",

	cooldown			= 2,
	energy_cost 		= 10.0,

	projectile 			= "Projectile_BFG",
	
	projectile_speed 	= 600,  
	max_range			= 450,  
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 90,
	check_aim_orientation_angle = 110,

	dispersion			= 0,
	crit_chance			= 0,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 3000,
	-- trigger_projectile	= true, --детонировать заряд при повторном нажатии модуля --#83218 теперь используется поле shoot_mode
	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode
	detonate_at_point 	= true,

	shot_once_sound 	= "sound/gadgets2/bfg_fire",
	shot_effect 		= "particles/weapons/big/bfg_muzzle",
	
	item_subtype		= ItemSubtype.BFG,
}
Def.Projectile_BFG =
{
	--inherit				= "Weapon_BaseRocket",
	class =	"Rocket",
	impact_type = "rocket",

	explosion_blast_wave = "Blastwave_BFG",
	override_blast_wave_damage = true,
	missile_defence_immune = true,	
	missile_detection_immune = true,
	detonation_timeout	= 0,

	spell 				= "BFG_Big",
	
	detonation_radius	= 1,

	detonate_on_distance= 19, --10!! -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.
	child_rockets =
	{
	    rocket = "Projectile_BFG1",
	    --rocket = "SpaceMissile_Standart_T1_Mk1",

	    sphere_radius = 3, -- опционально
	    
	    -- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
	    -- Общее количество ракет не должно превышать 20
	    scheme = {
	        circle0 = { amount = 1, angle = 0, },
	        circle1 = { amount = 4, angle = 45, }, -- опционально
	        circle2 = { amount = 6, angle = 90, }, -- опционально
			circle3 = { amount = 4, angle = 135, }, -- опционально
	        circle4 = { amount = 1, angle = 179, }, -- опционально
	    },

	    --описание целей для управляемых ракет. Поддерживается не более 10 целей
	    direct_to_target = {
	        class = ai.SpellTargetClass.SHIP,
	        area = ai.SpellTargetArea.AROUND,
	        relationship = ai.SpellTargetRelationship.ENEMY,
	    },
	    direct_range = 100, -- радиус поиска целей для управляемых ракет
	    max_rockets_per_target = 1, -- количество управляемых ракет на одну цель
	    
	},

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/big/bfg_projectile_big",
	hit_effect			= "",
	work_sound			= "sound/gadgets2/bfg_fly",
}
Def.Projectile_BFG1 =
{
	--inherit				= "Weapon_BaseRocket",
	class 				= "Rocket",
	impact_type 		= "rocket",
	
	explosion_blast_wave = "Blastwave_BFGFinal",
	
	override_blast_wave_damage = true,
	detonation_radius	= 10,
	--projectile_speed 	= 300,  
	max_range			= 55,  
	speed 				= 11,
	angular_velocity 	= 30,
	is_guided 			= true,
	
	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	
	--spell 				= "BFG",

	effect 				= "particles/weapons/big/bfg_projectile",
	impact_type 		= "plasma",
}
Def.Blastwave_BFG = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 14,
	--constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 22,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	--damage_kinetic 		= 100,
	effect 				= "particles/weapons/big/bfg_explosion_big",
	light_color = "165 255 130 100",
	light_radius = 100,
	light_time = 1.0,
	sound 				= "sound/explosion/bfg_expl",

}
Def.Blastwave_BFGFinal = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 3,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 15,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	--damage_kinetic 		= 100,

	effect 				= "particles/weapons/big/bfg_explosion",
	light_color = "165 255 130 100",
	light_radius = 60,
	light_time = 0.7,
	sound 				= "sound/explosion/bfg_small_expl",
}

Def.Module_DevastatorGun =
{
	class 			= "ActiveModule",
	in_editor 		= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2500*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 5000,
	model 			= "models/modules/m_active/elidium_modules/devastator_gun",
	stop_barrels	= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,
	death_wreck 	= "Module_Wreck",

	check_aim_orientation_angle = 110,
	track 			= ai.TrackMode.AIM,
	barrel_rot_speed = 90,
	crit_chance = 0,

	cooldown		= 3, --35
	energy_cost		= 10, --1000

	spell 			= "DevastatorGun_Start",
	deactivate_spell= "DevastatorGun_End",

	activate_sound 	= "sound/gadgets2/devastatorGun_fire",

	default_icon 	= "ItemSubtype_DevastatorGun",
}

---------------------------------------------------------------------------------------
--
--  прыжок с ловушкой
--
---------------------------------------------------------------------------------------

Def.Module_CageJump =
{
	class 			= "ActiveModule",
	in_editor 		= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 3500*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 5000,
	model 			= "models/modules/m_active/elidium_modules/cage_jump",
--	stop_barrels	= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,
	death_wreck 	= "Module_Wreck",
--[[
	check_aim_orientation_angle = 110,
	track 			= ai.TrackMode.AIM,
	barrel_rot_speed = 90,
	crit_chance = 0,
]]
	cooldown		= 9, --35
	energy_cost		= 10, --1000

	spell		= "Spell_CageJumpPrepare",
	--additional_spell = "Spell_CageJumpJump",
	deactivate_spell= "Spell_CageJump_Main",
	is_fast_movement = true,

-- 	activate_entity = "CageTrapMine", 
	--spawn_offset = Vec3( 0, -6, 2 ),
	--spawn_dir_to_aim = true, 
	--item_subtype		= ItemSubtype.SystemsRecharger,
	activate_sound 			= "sound/gadgets2/cageJump_activate",
	default_icon 	= "ItemSubtype_CageJump",
}

Def.CageJumpHolder = 
{
	class				= "AuraHolderEntity",
	damageable			= true,
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
	health				= 8000,
	hudType				= "default",
	in_editor			= false,
	model				= "particles/models/green_beacon",
	physics				= { damping = 0.4, mass = 1000, material = "ShipMetalMk3", rot_damping = 0.4, solid_type = 4, },
	-- uiDesc			= "Module_ShieldRayLarge_Desc",
	uiName				= "CageJumpHolder_name",
	work_sound 			= "sound/gadgets2/CageTrapMine_loop",
}

Def.Module_AprilDrone = --#108446
{
	--cant_be_bought 			= true,
	--hide_from_player		= true,
	class					= "DeliveryDroneModule",
	in_editor				= false,
	item_subtype			= ItemSubtype.AprilDrone,
	cooldown				= 10,
	range					= 500,
	cone_radius				= 20,
	drone					= "AprilDrone",
	parcel					= "April_PizzaCrate",
	parcel_delivered_sound	=  "sound/gadgets2/april_drone_delivered",
	activate_sound 			= "sound/destroyer/DestrHealBot_activate",
	damage_thermal			= 500,
}

Def.AprilDrone =
{
	in_editor		= false,
	inherit 		= "GuidedDrone",
	--model			= "models/modules/m_class/brokk_drone/brokk_drone", 
	--model			= "models/objects/vital_point/drone_postman/drone_postman", 
	
	signature		= ai.Signature.TINY,
	
	death_effect	= "particles/explosions/shp_exp_small_02",
	death_sound		= "sound/explosion/drone_expl",
	
	max_speed				= 50,
	acceleration			= 30,
	max_rot_speed			= 180,	-- deg per second
	max_aim_rot_speed		= 270,
	
	control_range			= 150,
	
	fire_rate				= 60,
	dispersion				= 1,
	optimal_range			= 50,
	max_range				= 100,
	projectile_speed		= 200,
	damage_thermal			= 1500,
	
	teleport_dist			= 99999,
	
	shot_effect 	= "particles/weapons/drongun/muzzle_frigate",
	shot_once_sound 	= "sound/gadgets/FrigateDrone/fd_shot_once",
	
	parcel_attach_offset	= Vec3( 0, 0, -2 ),
	parcel_attach_bone		= "root",
	parcel_detach_range 	= 10,
	parcel_delivered_sound	= "sound/swarm/swarm_activate",
	ttl 					= 45,
	health					= 2500,
	
	uiName 			= "AprilDrone_name",
}

Def.April_Pizza =
{
	class 					= "ScBaseEntity",
	in_editor				= true,
	hudType					= "default",
	hud_visibility_type 	= "minor",
	uiName					= "April_Pizza_name",

	model					= "models/objects/gameplay/event/event_aprile_pizza_rocket/event_aprile_pizza_bonus",

	max_detection_distance 	= 350.0,
	vision_radius_coef 		= 0,

	children = 
	{
		{ effect = { s1 = "particles/objects/bonuses/armor_restore_exp", s2 = "particles/null", default = "particles/null" }, joint = "root" },
	},
	
	use_team_skin = true,
	
	--spell_approach_owner_only 	= true,
	only_for_friends			= true,
	spell_approach				= "April_Food_Bonus",
	spell_approach_trigger_radius = 5.0,
	spell_approach_respawn_timer = 0,
	ttl 						= 45,

	death_effect 				 = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
}

Def.April_PizzaCrate = 
{
	class					= "SpellCrate",
	spell					= "April_FoodBox_Bonus",
	active_on_spawn			= false,
	only_for_friends		= true,
	uiName					= "April_Pizza_name",

	model					= "models/objects/gameplay/event/event_aprile_pizza/event_aprile_pizza",

	max_detection_distance 	= 250.0,
	vision_radius_coef 		= 0,

	children = 
	{
		{ effect = { s1 = "particles/objects/bonuses/alien_armor_restore_exp", s2 = "particles/null", default = "particles/objects/bonuses/alien_armor_restore_exp_white" }, joint = "root" },
	},
	
	only_for_friends = true,
	use_team_skin = true,

	ttl 						= 75,

	death_effect 			= "particles/ships/looted",
	take_sound				= "sound/game/bonus_take",
}

-- прототип для предсмертного баффа
Def.Module_BuffNearDeath =  
{
	cant_be_bought 					= true,
	hide_from_player 				= true,
	class 							= "SpaceShipModule",
	spell_on_max_health_minus 		= "BuffNearDeath_big",
	max_health_percent				= 0.25,
	cooldown						= 25, --без него лучше иногда, но тут оставим
}

Def.Module_ComboRestore =
{
	class		 				= "ActiveModule",
	in_editor	 				= false,
	
	model 					= "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 			= "sound/gadgets/common_activate",
	
	cooldown					= 8,
	energy_cost 				= 60,

	spell						= "Spell_ComboRestore",
}

Def.Module_Stealth =
{
	class 					= "ActiveModule",
	in_editor 				= false,

	model 					= "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 			= "sound/gadgets/common_activate",

	cooldown				= 4,
	energy_cost				= 10,

	spell 					= "Spell_StealthShip",
}

Def.HealParts =
{
	class 					= "ScBaseEntity",
	in_editor				= true,
	hudType					= "default",
	hud_visibility_type 	= "minor",
	--uiName					= "April_Pizza_name",

	model					= "models/objects/gameplay/bonuses/combo_restore",

	max_detection_distance 	= 350.0,
	vision_radius_coef 		= 0,

	children = 
	{
		{ effect = { s1 = "particles/objects/bonuses/combo_restore_exp", s2 = "particles/null", default = "particles/null" }, joint = "root" },
		{ effect = { s1 = "particles/objects/bonuses/combo_restore", s2 = "particles/null", default = "particles/null" }, joint = "joint1" },
	},
	
	use_team_skin = true,
	
	--spell_approach_owner_only 	= true,
	only_for_friends			= true,
	spell_approach				= "Spell_HealParts",
	spell_approach_trigger_radius = 25.0,
	spell_approach_respawn_timer = 0,
	ttl 						= 45,

	death_effect 				 = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
}

Def.DestrAnomalyBot =
{
	class				= "ScBaseEntity",--"AuraHolderEntity",
	--network_sync		= true,
	MunitionBayType 	= ai.MunitionBayType.MBT_SECONDARY,

	hack_immune			= true,
	in_editor			= false,
	damageable			= true,
	health 				= 3000,
	ttl					= 25,
	hack_immune			= true,

	model				= "models/weapons/drones/anomaly_bot/anomaly_bot",
	signature			= ai.Signature.TINY,
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000, damping = 0.4, rot_damping = 0.4, hitbox = true },

	hudType 			= "minor",

	uiName 				= "itemSubtype_DestrMunition_AnomalyBot",

	death_effect		= "particles/explosions/shp_exp_small_02",
	active_aura			= "Spell_DestrAnomalyBot",

	start_sound  			= "sound/destroyer/DestrHealBot_activate",
	death_sound			= "sound/explosion/drone_expl",
	work_sound 			= "sound/gadgets2/DestrAnomalyBot",
}

Def.Module_SwarmRocket = 
{
	cant_be_bought 					= true,
	hide_from_player				= true,
	class							= "SpaceShipModule",
	module_type						= ai.ModuleType.CPU_MOD,
	in_editor						= false,
	item_subtype					= ItemSubtype.SwarmRocket,
	controlled_swarm_can_shoot		= true,
	swarm_shot_health_cost_percent	= 0.08,
	swarm_projectile_speed			= 700,
	swarm_projectile_damage_kinetic	= 200,
	swarm_projectile_fire_rate		= 36,
	swarm_projectile_optimal_range	= 350,
	swarm_projectile_max_range		= 400,
	unique_equip					= true,
}

Def.Module_DeathSwarm = 
{
	cant_be_bought 					= true,
	hide_from_player				= true,
	class							= "SpaceShipModule",
	module_type						= ai.ModuleType.CAPACITOR_MOD,
	in_editor						= false,
	item_subtype					= ItemSubtype.DeathSwarm,
	emergency_swarm					= true,
	emergency_swarm_effect			= "particles/explosions/shp_exp_huge_dying",
	emergency_swarm_sound			= "sound/swarm/PreDeath_detonation",
	emergency_swarm_damage_mul		= 3,
	emergency_swarm_duration		= 25,
	unique_equip					= true,
}

Def.Module_EntityRay =
{
	class 					= "ActiveModule",
	in_editor				= false,
	
	cant_be_bought 			= true,
	hide_from_player		= true,
	
	model 					= "",
	
	cooldown				= 20, --Всегда больше суммарного времени работы спеллов (чтобы холдеры не спавнились друг в друге)
	energy_cost				= 10,
	
	spell		 			= "Spell_EntityRayPrepare",
}

Def.EntityRayHolder = 
{
	class				= "AuraHolderEntity",
	damageable			= true,
	hack_immune			= true,
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
	health				= 11000,
	hudType				= "default",
	in_editor			= false,
	model				= "particles/models/green_beacon",
	signature			=	ai.Signature.TINY,
	physics				= { damping = 0.4, mass = 1000, material = "ShipMetalMk3", rot_damping = 0.4, solid_type = 4, },
	uiName				= "Character_MonsterSphere",
}

Def.EntityRayHolderInvul = 
{
	inherit				= "EntityRayHolder",
	damageable			= false,
}

Def.Module_RepairDrones_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 4,	
	item_lvl				= 25,
	in_editor				= false,
	
	rank_min				= 1,
	rank_max				= 17,
	
	cooldown				= 1,
	energy_cost				= 100,
	
	spell					= "RepairDrones_st",
	
	class					= "ActiveModule",
	module_type				= ai.ModuleType.ACTIVE,
	
	item_subtype			= ItemSubtype.RepairDronesSt,

	model					= "models/modules/m_active/m_a_gadget_buff",
	default_icon			= "ItemSubtype_RepairDronesLarge",
	influence_type_color	= InfluenceTypeColor.REPAIR_HULL,
}

Def.Module_HullDevastator_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 4,	
	item_lvl				= 25,
	in_editor				= false,
	
	rank_min				= 1,
	rank_max				= 17,
	
	cooldown				= 1,
	energy_cost				= 10,
	
	spell					= "HullDevastator_st",
	
	class					= "ActiveModule",
	module_type				= ai.ModuleType.ACTIVE,
	
	item_subtype			= ItemSubtype.HullDevastatorSt,
	
	model					= "models/modules/m_active/m_a_gadget_buff",
	default_icon			= "ItemSubtype_GravityAnomaly",
	influence_type_color	= InfluenceTypeColor.DEBUFF_DAMAGE,
}

Def.Module_ShieldDevastator_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 4,	
	item_lvl				= 25,
	in_editor				= false,
	
	rank_min				= 1,
	rank_max				= 17,
	
	cooldown				= 1,
	energy_cost				= 10,
	
	spell					= "ShieldDevastator_st",
	
	class					= "ActiveModule",
	module_type				= ai.ModuleType.ACTIVE,
	
	item_subtype			= ItemSubtype.ShieldDevastatorSt,
	
	model					= "models/modules/m_active/m_a_gadget_buff",
	default_icon			= "ItemSubtype_GravityAnomaly",
	influence_type_color	= InfluenceTypeColor.DEBUFF_DAMAGE,
}

Def.Module_NoRestoreEnergy_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 4,	
	item_lvl				= 25,
	in_editor				= false,
	
	rank_min				= 1,
	rank_max				= 17,
	
	cooldown				= 1,
	energy_cost				= 100,
	
	spell					= "NoRestoreEnergy_st",
	
	class					= "ActiveModule",
	module_type				= ai.ModuleType.ACTIVE,
	
	item_subtype			= ItemSubtype.NoRestoreEnergySt,
	
	model					= "models/modules/m_active/m_a_gadget_buff",
	default_icon			= "ItemSubtype_EnergyReflector",
	influence_type_color	= InfluenceTypeColor.DEBUFF_STAT,
}

Def.Module_NoCooldown_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 4,	
	item_lvl				= 25,
	in_editor				= false,
	
	rank_min				= 1,
	rank_max				= 17,
	
	cooldown				= 1,
	energy_cost				= 100,
	
	spell					= "NoCooldown_st",
	additional_spell		= "MissileReload",	
	
	class					= "ActiveModule",
	module_type				= ai.ModuleType.ACTIVE,
	
	item_subtype			= ItemSubtype.NoCooldownSt,
	
	model					= "models/modules/m_active/m_a_gadget_buff",
	default_icon			= "ItemSubtype_EnlargeActiveCooldown",
	influence_type_color	= InfluenceTypeColor.BUFF_STAT,
}

Def.ModulePassive_ArmorPlates_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 4,	
	item_lvl				= 25,
	in_editor				= false,
	
	rank_min				= 1,
	rank_max				= 17,

	hull_health_mul			= 100,
	
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	default_icon			= "ItemSubtype_ArmorPlates",
	
	item_subtype			= ItemSubtype.ProtectionSt,
}

Def.ModulePassive_RangeMasterUnit_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 4,	
	item_lvl				= 25,
	
	rank_min				= 1,
	rank_max				= 17,

	optimal_range_mul		= 5,
	max_range_mul			= 5,

	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	default_icon			= "ItemSubtype_RangeMasterUnit",

	item_subtype			= ItemSubtype.RangeMasterSt,
}

Def.ModulePassive_MaxSpeed_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 4,	
	item_lvl				= 25,
	
	rank_min				= 1,
	rank_max				= 17,

	max_speed_mul			= 5,
	strafe_speed_mul		= 3,
	acceleration_mul		= 6,
	reverse_accel			= 100,
	
	show_cooldown_status	= true,
	cooldown				= 3,
	double_down_spell		= "MaxSpeed_brake_st",

	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	default_icon			= "ItemSubtype_SpeedInsteadShield",

	item_subtype			= ItemSubtype.MaxSpeedSt,
}

Def.ModulePassive_RocketPower_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 4,	
	item_lvl				= 25,
	
	rank_min				= 1,
	rank_max				= 17,

	rocket_damage_coef_mul	= 100,
	damage_mul				= 100,

	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	default_icon			= "ItemSubtype_MovementDamageBuff",

	item_subtype			= ItemSubtype.RocketPowerSt,
}

Def.Module_PortalGate =
{
	class								= "TeleportGateModule",
	in_editor							= false,

	spawn_offset						= Vec3( 0, 0, -20 ),
	check_collision_box_extents			= Vec3( 0.766, 0.342, 2.0 ), -- для проверки коллизии

	cooldown							= 1,
	
	activate_sound						= "sound/gadgets/FrigateDrone/fd_launch",
	
	gate								= "PortalGate",
	straight_teleport					= false, -- если true, то создаются сразу два портала на расстоянии teleport_range_max, если ничего не мешает и на меньшем расстоянии, если есть препятствие.
	teleport_range_min					= 50,
	teleport_range_max					= 0, -- если ноль, то расстояние не ограничено(только для straight_teleport = false)
	teleport_gate_ttl					= 180,
	replace_extra_teleport_lines		= true, -- если true, то старые порталы уничтожаются при превышении максимального количества
	teleport_line_max					= 1, -- максимальное количество открытых телепортов(пар порталов)
	
	installation_spell					= "Spell_PortalGate",
}

Def.PortalGate = 
{
	class								= "TeleportGate",
	in_editor							= false,
	
	model								= "models/objects/jump_gates/portal/portal",
	--death_effect						= "particles/gadget/uniquehardshield_start",
	--end_effect						= "particles/gadget/uniquehardshield_start",
	
	teleport_cooldown					= 1,
	teleport_check_box_scale			= 0.7,
	teleport_last_damage_time_min		= 0,
	teleport_reset_control				= true, -- если true, то корабль после телепорта корабль будет иметь нулевую скорость и будет направлен от ворот
	teleport_offset						= 0, -- дополнительное смещение корабля в направлении от ворот
	
	teleport_owner_only					= false,
	
	hudType								= "default",
	hud_visibility_type 				= "minor",
	uiName 								= "itemSubType_PortalGate",
	damageable							= false,
	
	in_fx 								= "particles/gadget/teleport",
	out_fx 								= "particles/gadget/teleport",
	work_effect 						= "particles/gadget/teleport_gate",
	
	in_sound							= "sound/gadgets2/PortalGate_warp",
	out_sound							= "sound/gadgets2/PortalGate_warp",
	work_sound 							= "sound/gadgets/warpgate/wg_work_loop",
}

Def.BattleDroneMedium =
{
	class					= "GuidedDrone",
	in_editor				= false,

	model					= "models/objects/ships_huge/prec_ship/prec_drone2_little",

	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 100, },

	signature				= ai.Signature.TINY,

	death_effect			= "particles/explosions/alien_explosion_small_01",


	projectile				= "Projectile_DronAlien_Plasma",
	shot_effect 			= "particles/weapons/alien/alien_engeneer_muzzle",

	death_sound				= "sound/explosion/drone_expl",
	launch_sound			= "sound/gadgets/FrigateDrone/fd_launch",
	shot_once_sound         = "sound/weapons/aliengun/ag_drone_shot",

	trail_effect 			= "particles/ships/ship_trail_inverse",
	trail_color 			= "4 184 55 100",
	trail_size 				= 0.05,

	max_speed				= 40,
	acceleration			= 28,
	max_rot_speed			= 200,	-- deg per second
	max_aim_rot_speed		= 270,

	control_range			= 1000,
	fire_rate				= 60,
	dispersion				= 1,
	optimal_range			= 50,
	max_range				= 100,
	projectile_speed		= 200,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 0,
	
	uiName 					= "GreenBattleDrone_name",
	children = 
	{
		{ effect = "PrecDroneEngine1", joint = "eng" },
	},
}

Def.BattleDroneLarge =
{
	inherit					= "BattleDroneMedium",

	model					= "models/objects/ships_huge/prec_ship/prec_drone2_little",

	projectile				= "Projectile_CruiserAlienPlasma",
	shot_effect 			= "particles/weapons/drongun/muzzle",

	shot_once_sound 		= "sound/weapons/CrystalSparks/cs_shot",
	launch_sound 			= "sound/gadgets/FrigateDrone/fd_launch",
	death_sound				= "sound/explosion/drone_expl",

	max_speed				= 30,
	acceleration			= 20,
	max_rot_speed			= 160,	-- deg per second
	max_aim_rot_speed		= 320,
}

Def.BattleDroneHuge =
{
	class					= "GuidedDrone",
	in_editor				= false,

	model					= "models/objects/ships_huge/prec_ship/prec_drone3",

	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 100, },

	signature				= ai.Signature.TINY,

	death_effect			= "particles/explosions/shp_exp_small_02",

	projectile				= "Projectile_DronAlien_Plasma",
	shot_effect 			= "particles/weapons/alien/alien_engeneer_muzzle",

	death_sound				= "sound/explosion/drone_expl",
	launch_sound			= "sound/gadgets/FrigateDrone/fd_launch",
	shot_once_sound 		= "sound/weapons/CrystalSparks/cs_shot",
	--start_sound 			= "sound/gadgets/FrigateDrone/fd_launch",

	max_speed				= 0,
	acceleration			= 0,
	max_rot_speed			= 0,	-- deg per second
	max_aim_rot_speed		= 360,

	control_range			= 1000,
	fire_rate				= 60,
	dispersion				= 1,
	optimal_range			= 50,
	max_range				= 100,
	projectile_speed		= 200,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 0,
	
	contact_min_damage		= 5,
	contact_damage_cf 		= 5,
	
	uiName 					= "itemSubType_DestrMunition_BattleDroneHuge",
	children = 
	{
		{ effect = "PrecDroneEngine1", joint = "eng" },
	},
}

Def.Module_CookCannon =
{
	class							= "FiringModule",
	in_editor 						= false,

	signature						= ai.Signature.TINY,
	physics 						= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 						= true,
	health 							= 2500,
	health_regen 					= 35*2,
	damage_to_host 					= 5000,
	model 							= "models/modules/m_active/cook_cannon/cook_cannon",
	death_wreck  					= "Module_Wreck",

	check_aim_orientation_angle 	= 100,
	barrel_rot_speed				= 90,

	cooldown						= 35,
	energy_cost 					= 1000,
	track 							= ai.TrackMode.AIM,
	stop_barrels					= ai.BarrelsStopMode.NONE,

	damage_thermal					= 1100,
	dispersion						= 1,
	ammo							= 2,
	no_friendly_fire				= true,
	shoot_mode						= ai.FiringModuleShootMode.BURST,
	fire_rate 						= 300,
	
	optimal_range 					= 350,
	max_range 						= 350 * 1.33,

	projectile						= "Projectile_CookCannon",
	projectile_speed				= 550,

	muzzleflash_color = { kinetic = "255 182 128 255", emp = "255 182 128 255", thermal = "255 182 128 255", },
	muzzleflash_radius 				= 45,
	muzzleflash_time 				= 1.0,
	long_shot_effects				= true,
	shot_effect						= "particles/weapons/artillery_big_muzzle",
	shot_once_sound					= "sound/weapons/xo/cook_cannon_shot",
	activate_sound 					= "sound/weapons/xo/CookCannon_reload",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance						= 0,
}

Def.Projectile_CookCannon =
{
	inherit				= "Projectile_Artillery",
	explosion_blast_wave	= "Blastwave_CookCannon",
	work_sound 		= "sound/weapons/xo/bullet_fly",
	flare_color			= "255 214 155 25",
	flare_size			= 0.05, --0.15
	flare_angle			= 180,
	flare_nebulosity	= 1.0,
	effect 				= "particles/weapons/railgun/railgun_destr_projectile",
}

Def.Blastwave_CookCannon = 
{
	inherit				= "Blastwave_Artillery_Base",
	blast_maxDistance	= 30,
	sound 			= "sound/hit/xo_common",
	light_radius 		= 20,
	light_time 			= 0.8,
	effect 				= "particles/explosions/explosion_big4",
	light_color 		= "255 182 128 100",
}

Def.Module_SphereShield = 
{
	cant_be_bought 			= true,
	class					= "ActiveModule",
	activate_entity			= "SphereShield",
	attach_bone				= "root",
	spawn_offset 			= Vec3( 0, 0, 0 ),
	cooldown				= 40,
	in_editor				= false,
	
	activate_entity_ttl		= 20,
	activate_entity_health	= 5000,
	activate_entity_max		= 1,
	activate_sound 			= "sound/gadgets/common_activate",
	
	spell					= "Spell_SphereShield",

	energy_cost 			= 180,
}

Def.SphereShield =
{
	class 			= "ScBaseEntity",

	in_editor		= false,

	damageable 		= true,
	ttl				= 25,
	
	hack_immune 	= true,

	death_sound		= "sound/explosion/drone_expl",
	default_icon	= "ItemSubtype_FrontEnergyShield",
	
	start_sound  	= "sound/destroyer/SShield_activate",
	end_sound		= "sound/destroyer/SShield_off",
	death_sound		= "sound/destroyer/SShield_off",

	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	radar_vison		= ai.ShieldRadarVisionMode.PASS,
	weapon_mode		= ai.ShieldWeaponMode.BLOCK_ENEMY,

	model			= "models/shields/shield_cover_sphere",
	
	is_shield		= true,
	smart_shield_radius	= 35,  --#90547
	ignore_transparency = true,
	show_after 		= 0.2,
	children = 
	{
		{ def		= "SphereShieldAuraHolder", },
		{ effect	= "particles/gadget/cover_shield_holder", },
	}
}

Def.SphereShieldAuraHolder =
{
	class 			= "AuraHolderEntity",

	in_editor		= false,
	
	model 			= "models/misc/invisible_model",

	damageable 		= false,
	ttl				= 25,
	
	hack_immune 	= true,
	
	spell_on_spawn	= "Spell_SphereShield_Resist",
}

Def.Module_AdvancedHeal =
{
	class 						= "SpaceShipModule",
	in_editor 					= false,
	spell_on_equip			 	= "Spell_AdvancedHeal",
}

Def.Module_DistStation =
{
	class						= "FiringModule",
	in_editor 					= false,
	
	--check_aim_orientation_angle = 180,
	--barrel_rot_speed 			= 1000,

	cooldown					= 25,
	energy_cost 				= 100,
	
	max_range					= 200,
	
	track 						= ai.TrackMode.AIM,
	shoot_mode					= ai.FiringModuleShootMode.SINGLE_SHOT,

	damage_thermal				= 500,

	projectile 					= "Projectile_DistStation",
	projectile_speed 			= 120,

	default_icon 				= "ItemSubtype_SpaceMissile_Fireworks",
	
	model 						= "models/weapons/plasma/power/vortex",
	
	muzzleflash_color			= { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 			= 10,
	muzzleflash_time 			= 1.0,
	long_shot_effects 			= true,
	shot_effect 				= "particles/weapons/destroyer_rocket_start",

	shot_once_sound 			= "sound/gadgets2/Diststation_launch",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance 		= 0,
}

Def.Projectile_DistStation =
{
	inherit						= "Weapon_BaseRocket",
	
	model						= "models/weapons/bs_torpedo",

	explosion_blast_wave		= "Blastwave_DistStation",
	override_blast_wave_damage	= true,

	missile_defence_immune 		= true,
	missile_detection_immune 	= true,

	detonation_radius			= 10,
	
	spell						= "Spell_DistStation",

	flare_color					= "255 235 180 10",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound					= "sound/weapons/rockets/rocket_disstation_fly",
	is_guided					= false,

	effect						= "particles/weapons/esminec_drone_trail",
}

Def.Blastwave_DistStation =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 10,
	blast_minDistance			= 5,
	apply_damage				= true,
	apply_shake 				= true,

	effect 						= "particles/explosions/big_fire_2",
	light_color 				= "255 160 80 100",
	light_radius 				= 12,
	light_time 					= 0.5,
	sound 						= "sound/explosion/sparks_expl",
}

Def.DistStation =
{
	class						= "AuraHolderEntity",
	in_editor					= false,
	damageable					= true,
	health 						= 3000,

	model						= "models/weapons/drones/healbot/healbot",
	physics						= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },

	hudType 					= "default",

	uiName 						= "DistStationEntity",

	death_effect				= "particles/explosions/shp_exp_small_02",
	death_sound					= "sound/explosion/drone_expl",
}

Def.Module_FreezingSniper =
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 				= "sound/gadgets/common_activate",

	cooldown					= 30,
	energy_cost					= 100,
	item_subtype	= ItemSubtype.FreezingSniper,

	spell 						= "Spell_FreezingSniper",
}

Def.Module_AdvancedZoom = 
{
	class							= "SpaceShipModule",
	in_editor						= false,

	disintegrator_zoom_min_coef		= 0.6,
	disintegrator_zoom_max_coef		= 3,
	disintegrator_zoom_steps_num	= 3,
}

Def.Module_ReserveShipSwitch = 
{
	class							= "ReserveShipSwitch",
	in_editor						= false,
	
	cooldown						= 4.5,
	energy_cost						= 100,
	
	item_subtype 					= ItemSubtype.ReserveShipSwitch,
	
	default_icon					= "ItemSubtype_ReserveShipSwitch",
}

Def.Module_ReserveShipOrder = 
{
	class							= "ReserveShipOrder",
	in_editor						= false,
	
	item_subtype 					= ItemSubtype.ReserveShipOrder,
	
	cooldown						= 1,
	energy_cost						= 50,
	
	target_range					= 700,
	cone_radius						= 20,
	
	default_icon					= "ItemSubtype_ReserveShipOrder",
	ui_ico_0						= { target_system = { tex = "ItemSubtype_ReserveShipOrder2", }, },	-- охрана дружественной цели
	ui_ico_1						= { target_system = { tex = "ItemSubtype_ReserveShipOrder3", }, },	-- атака залоченной цели
	ui_ico_2						= { target_system = { tex = "ItemSubtype_ReserveShipOrder4", }, },	-- полет в заданную позицию
	ui_ico_3						= { target_system = { tex = "ItemSubtype_ReserveShipOrder5", }, },	-- охрана позиции
	ui_ico_4						= { target_system = { tex = "ItemSubtype_ReserveShipOrder", }, },	-- охрана владельца
	ui_ico_5						= { target_system = { tex = "ItemSubtype_ReserveShipOrder6", }, },	-- бот уничтожен
	
	defend_marker					= "ui/textures/target_mark_2",
	attack_marker					= "ui/textures/target_mark_3",
	move_to_pos_marker				= "ui/textures/target_mark_4",
	defend_pos_marker				= "ui/textures/target_mark_5",
	
	state_change_sound				= "sound/gadgets2/VesselSwitchBack/vsb_ship_order",
}

Def.Module_ActiveTimeBoost =
{
	class 						= "ActiveModule",
	in_editor 					= false,

	model 						= "models/modules/m_active/m_a_gadget_buff",
	activate_sound				= "sound/gadgets/timeboost_on",

	cooldown					= 40,
	energy_cost					= 100,

	spell 						= "Spell_ActiveTimeBoost",
}

Def.Missile_CageTrapMine =
{
	class					= "MineTrap",
	model					= "models/turret/biglightninggun/h_mine",

	health 					= 6000,
	damageable				= true,
	
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000, },
	target =
	{
		class 				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		vitality			= ai.SpellTargetVitality.ALIVE,
		area				= ai.SpellTargetArea.AROUND,
	},
	
	radius					= 40,
	launch_time				= 2.5,
	ttl						= 120,
	
	--отображение в HUD
	hudType 				= "default",
	uiName 					= "itemSubType_SpaceMissile_CageTrapMine",

	spell_on_ttl			= "Spell_CageTrapMine",
	spell_aura_target		= true, --может быть целью спелов

	default_icon			= "ItemSubtype_SmallSpiralMine",

	check_spawn_collision	= true,
	spawn_offset			= Vec3( 0, -2, -3 ),
	spawn_dir_to_aim		= true,
}

Def.Missile_CageTrapMine_Holder = 
{
	class					= "AuraHolderEntity",
	damageable				= true,
	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound				= "sound/explosion/drone_expl",
	health					= 3500,
	in_editor				= false,
	model					= "models/turret/biglightninggun/h_mine",
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000, },
	work_sound 				= "sound/gadgets2/CageTrapMine_loop",
	
	--отображение в HUD
	hudType 				= "default",
	uiName 					= "itemSubType_SpaceMissile_CageTrapMine",
}

Def.Module_HarpoonGun =
{
    inherit             = "Weapon_Base",
    class               = "HarpoonGun",
	in_editor			= false,
	module_type				= ai.ModuleType.ACTIVE,
    cooldown            = 30, --40
    energy_cost         = 150,
	energy_cost_per_second = 70,
	
	activate_entity_ttl = 15, --длительность работы (было 12)

    projectile          = "Projectile_HarpoonHook",
    projectile_speed    = 600, --600
    optimal_range       = 250,	--60
    max_range           = 250,	--200
    track               = ai.TrackMode.AIM,
    barrel_rot_speed    = 360,

    --need_shield_coef              = 0.25,
    reduce_cooldown_if_blank_shot = 1, 

    no_attach_rope_to_static	= true,
    no_attach_rope_to_allies	= true,
    no_attach_rope_to_ships		= false,
	no_attach_rope_to_neutrals	= true,
	attach_rope_to_ship_root = true,

    dispersion          = 0,
    crit_chance			= 0,

    shoot_mode          = ai.FiringModuleShootMode.SINGLE_SHOT, --#83218

	model 				= "models/modules/m_active/spear/spear_gadget",
    shot_once_sound     = "sound/gadgets2/HarpoonGun/hg_shot",
    default_icon        = "ItemSubtype_HarpoonGun",
    item_subtype        = ItemSubtype.HarpoonGun,
    connection_beam_fx  = "particles/gadget/hack_beam_blue",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	--class_mask=ai.ShipClass.SMALL,
	--required_role = ai.ShipRoles.RECON,
	--required_ship	= "Ship_Race1_S_T5_CorLegibus",			
}

Def.Projectile_HarpoonHook =
{
	inherit        		= "Weapon_BaseRocket", --"Projectile_Plasma_Default",
    model          		= "models/objects/gameplay/ball/rope/harpoon",
	
	is_guided			= true;
	
	angular_velocity    = 50,
	hitbox_min 			= Vec3( -0.4, -0.4, -0.4 ), -- -0.2
	hitbox_max			= Vec3( 0.4, 0.4, 0.4 ),	-- 0.2
	
	apply_shake			= true,
	spell 				= "HarpoonHook_CastSpells",
	
	hit_effect			= "particles/weapons/plasma/hit",
    effect         		= "particles/weapons/missile/rocket_trail_small",
    death_entity   		= "HarpoonGun_Rope",
    impact_type    		= "plasma",
}

Def.HarpoonGun_Rope =
{
    class                       = "Rope",
    in_editor                   = false,
    model                       = "models/objects/gameplay/ball/rope/rope_football",
    detach_sound                = "sound/gadgets2/HarpoonGun/hg_detach",

    rope_max_absolute_stretch   = 100, --10
    rope_max_relative_stretch   = 200, --2
    rope_min_mass               = 30,
    rope_max_mass               = 800,
    rope_mass_coef              = 0.15,
    rope_coil_needs_length_min 	= 15,
    rope_coil_speed = 14,--10

    use_team_skin = true,

    hardness_time = 10000, --1
}

Def.Module_RocketMine  =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	model 				= "models/turret/huge_module_drone/gun_dron",
	class				= "FiringModule",
	item_subtype        = ItemSubtype.RocketMine,

	cooldown			= 2,
	energy_cost 		= 10.0,

	projectile 			= "Projectile_RocketMine_Torpedo",
	
	projectile_speed 	= 200,  
	max_range			= 450,  
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,
	
	signature			= ai.Signature.TINY,
	physics 			= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 			= true,
	health 				= 3600*2.6, --500
	health_regen 		= 40*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 		= 3000,
	death_wreck  		= "Module_Wreck",

	check_aim_orientation_angle = 100,
	barrel_rot_speed 	= 90,

	dispersion			= 0,
	crit_chance			= 0,
	explosion_blast_wave = "Blastwave_RocketMine_Mine",
	damage				= 0,
	damage_kinetic		= 0,
	--damage_emp			= 3000,
	damage_emp			= 1000,
	-- trigger_projectile	= true, --детонировать заряд при повторном нажатии модуля --#83218 теперь используется поле shoot_mode
	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",

	detonate_at_point = true,
}

Def.Projectile_RocketMine_Torpedo = --неуправляемая торпеда которую выпускает модуль
{
	inherit				= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo_big",
	explosion_blast_wave = "Blastwave_RocketMine",
	override_blast_wave_damage = true,
	missile_defence_immune = true,	
	missile_detection_immune = true,
	detonation_timeout	= 0.1,

	detonation_radius	= 1,

	detonate_on_distance= 30,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.

	is_guided = true,
	child_rockets =
	{
	    rocket = "Projectile_RocketMine_Rocket",

	    sphere_radius = 3, -- из сферы какого радиуса начнется разлет
		
	    -- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
	    -- Общее количество ракет не должно превышать 20
	    scheme = { 
	        circle0 = { amount = 24, angle = 90, }, -- опционально

		},
		
		target_pos_scheme = {
			circle0 = { amount = 1, angleX = 0, radius = 0, },
			circle1 = { amount = 1, angleX = 0, radius = 100, },
			circle2 = { amount = 2, angleX = 30, radius = 50, },
			circle3 = { amount = 4, angleX = 60, startAngleZ = 45, radius = 100, },
			circle4 = { amount = 9, angleX = 90, startAngleZ = 90, radius = 100, },
			circle5 = { amount = 4, angleX = 120, startAngleZ = 135, radius = 100, },
			circle6 = { amount = 2, angleX = 150, startAngleZ = 180, radius = 50, },
			circle7 = { amount = 1, angleX = 180, radius = 100, },
		},			
		death_entity_ttl_add_min = 0.1,
		death_entity_ttl_add_max = 0.4,	  
	},

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_mid",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
}

Def.Projectile_RocketMine_Rocket = -- ракеты которые летят к своей позиции после взрыва торпеды 
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "",
	model				= "models/weapons/missile_torpedo2",
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 0,
	override_blast_wave_damage = true,
	detonation_radius	= 15,  
	max_range			= 400,  
	speed 				= 50,
	angular_velocity 	= 375,
	is_guided 			= true,
	use_pathfinder 		= true,
	
	flare_color			= "255 170 191 0",
	flare_size			= 0.0,
	flare_angle			= 180,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "plasma",
	hack_immune 		= true,
	death_entity		= "RocketMine_Mine",
	--death_entity_max_deviation = 20,
}

Def.RocketMine_Mine = -- ракеты которые появляются при достижении своей позиции
{
	inherit			= "Weapon_BaseRocket",
	storeItemId		= 0,
	cant_be_bought	= true,
	time_to_live	= 6.5,	
	model			= "models/weapons/missile_torpedo2",
	detonation_radius = 0,
	speed 			= 0,
	effect 			= "particles/weapons/nuke/workflare",
	work_sound 		= "",
	detection_radius= 120,
	flare_size		=1,
	flare_occl_size	=1,
	flare_aspect	=1,
	flare_angle		=180,
	flare_color 	= "255 150 100 5",
	flare_warp		=0.1,
	hack_immune 	= true,
	spell			= "Spell_RocketMine",
	explosion_blast_wave ="Blastwave_RocketMine_Mine",
}

Def.Blastwave_RocketMine_Mine = 
{
	class				= "BlastWave",
	in_editor			= false,
	intensity			= 200,
	blast_minDistance	= 50,
	blast_maxDistance	= 100,
	constant_damage		= false, --blast_minDistance работает только с этим флагом (false)

	self_damage_coef	= 0.75,

	apply_damage		= true,

	damage_emp		= 16500,
	clanship_damage_coef = 0.1,
	effect 		 =  "particles/weapons/nuke/explosion_emp",
	light_color  = "140 240 140 100",
	light_radius = 15,
	light_time   = 0.9,
	sound 		 = "sound/explosion/big_rocket_expl",
}

Def.Module_EmperorsRobe =
{
 	class 					= "InvisibleEmperorModule",
	in_editor 				= false,
	
	trigger_aura			= true,

	signature		= ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	trigger_aura 	= true,
	health 			= 3600*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 3500,
	model 			= "models/turret/huge_module_shield_gen/shield_gen2",
	death_wreck 	= "Module_Wreck",

	energy_cost_per_second  = 84,
	cooldown				= 25,
	
	spell					= "Spell_EmperorsRobe",
	spell_on_flying_drone	= "Spell_EmperorsRobe_Drone",
	
	activate_sound		= "sound/gadgets/stealth_on",
	deactivate_sound	= "sound/gadgets/stealth_off",
	
	item_subtype			= ItemSubtype.EmperorsRobe,
}

Def.Module_LootMailer =
{
	class					= "ActiveModule",
	in_editor				= false,
	module_type				= ai.ModuleType.ACTIVE,
	cooldown				= 1.0,
	energy_cost				= 10.0,
	
	activate_effect			= "",
	activate_module_effect	= "",

	activate_entity			= "LootMailer",
	activate_entity_ttl		= 40,
	activate_entity_max		= 1,
	activate_sound 			= "sound/gadgets/common_activate",
	
	only_freespace_module = true,
	
	spawn_offset 			= Vec3( 0, -5, 1 ),
	check_spawn_collision 	= true,
	
	item_subtype			= ItemSubtype.LootMailer,
}

Def.LootMailer =
{
	class					= "ScBaseEntity",
	--class					= "GuidedDrone",
	--inherit					= "OpenWorld_LootMailer",
	in_editor				= false,
	model					= "models/objects/vital_point/drone_postman/drone_postman",
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 5000,  damping = 50, rot_damping = 0.4,  },

	signature				= ai.Signature.TINY,

		
	damageable 		= false,
	hack_immune 						= true,
	
	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound				= "sound/explosion/drone_expl",
	
	mailer_interaction_only_friends = true,
    mailer_remove_after_interaction = true,
	
	mailer_tax				= 0.15,
	mailer_interaction_time	= 5,
	
	uiName 					= "SentryDrone_name",
}

Def.Module_ProtozanCamouflage  =
{
	class 					= "ActiveModule",
	in_editor				= false,
	trigger_aura			= true,
	cooldown				= 30,
	energy_cost_per_second 	= 10,
	spell					= "Protozan_WeaponModificator_Inc",
	deactivate_spell 		= "Protozan_WeaponModificator_Dec",
	activate_sound 			= "sound/gadgets/common_activate",
	module_type				= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.ProtozanCamouflage,
}

Def.Module_Sehrimnir  =
{
	class 					= "ActiveModule",
	-- AdaptiveShieldBoost
	in_editor				= false,
	trigger_aura			= true,
	cooldown				= 45,
	energy_cost_per_second 	= 250,
	spell					= "Spell_Sehrimnir_ShieldAdd",
	activate_sound 			= "sound/gadgets/common_activate",
	module_type				= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.Sehrimnir,
}

Def.Module_Albiero_S_Warp =
{
	class 					= "MicroWarpDrive",
	in_editor				= false,
	cant_be_bought 			= true,
	
	module_type				= ai.ModuleType.ACTIVE,
	required_role			= ai.ShipRoles.SCOUT,
	class_mask				= ai.ShipClass.SMALL,
	required_ship			= "Ship_Race3_H_T5_Uniq_small",
	
	energy_prepare			= 0,		-- энергия требуемая для подготовительного разгона
	energy_activate 		= 30,		-- энергия требуемая для активации
	cooldown				= 30,
	
	prep_time				= 1,		-- время разгона
	prep_maxspeed_mul		= 1.2,	-- во сколько раз увеличивать допустимую максимальную скорость при разгоне
	prep_accel_mul			= 2.0,		-- во сколько раз увеличивать ускорение при разгоне
	
	accel_time				= 2.0,		-- время сколько будет действовать
	maxspeed_mul			= 28.0,		-- во сколько раз увеличивать допустимую максимальную скорость
	accel_mul				= 5000.0,	-- во сколько раз увеличивать ускорение
	auto_disable_time		= 0.55,	-- за T*<текущая_скорость> метров до препятствия автоматически выходит из варпа
	
	prep_loop				= "sound/gadgets/warp_prep",
	active_loop				= "sound/gadgets/warp_active",
	stop_sound				= "sound/gadgets/warp_stop",
	fail_sound				= "sound/gadgets/warp_fail",
	work_sound 				= "sound/gadgets2/SinglePortal_start_loop",
	
	item_subtype			= ItemSubtype.Albiero_MicroWarp,
	default_icon			= "ItemSubtype_Albiero_MicroWarp",
	influence_type_color	= InfluenceTypeColor.BUFF_ABILITY,
}

Def.Module_Albiero_S_Cloak =
{
	class					= "ActiveModule",
	in_editor				= false,
	cant_be_bought 			= true,
	
	module_type				= ai.ModuleType.ACTIVE,
	required_role			= ai.ShipRoles.SCOUT,
	class_mask				= ai.ShipClass.SMALL,
	required_ship			= "Ship_Race3_H_T5_Uniq_small",
	
	energy_cost				= 106,
	
	cooldown 				= 40,

	spell 					= "Spell_Albiero_S_Cloak",
	
	activate_sound 			= "sound/gadgets/common_activate",
	
	item_subtype			= ItemSubtype.Albiero_Cloak,
	default_icon			= "ItemSubtype_Albiero_Cloak",	
	influence_type_color	= InfluenceTypeColor.BUFF_ABILITY,
}

Def.Module_MoleScanner =
{
	class 					= "SpaceShipModule",
	in_editor				= false,
	cant_be_bought 			= true,
	
	module_type				= ai.ModuleType.CPU_MOD,
	required_role			= ai.ShipRoles.ENGINEER,
	class_mask				= ai.ShipClass.LARGE,
	required_ship			= "Ship_Race3_L_T5_Mole",
	
	unique_equip			= true,
	
	spell_on_equip			= "Spell_MoleScanner_Ping",
	
	item_subtype			= ItemSubtype.MoleScanner,
	default_icon			= "ItemSubtype_WideScanner",
}

Def.Module_DroneField  =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	model 				= "models/turret/huge_module_drone/gun_dron",
	class				= "FiringModule",
	item_subtype        = ItemSubtype.DroneField,

	cooldown			= 2,
	energy_cost 		= 10.0,

	projectile 			= "Projectile_DroneField_Main",
	
	projectile_speed 	= 200,  
	max_range			= 450,  
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,
	
	signature			= ai.Signature.TINY,
	physics 			= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 			= true,
	health 				= 3600*2.6, --500
	health_regen 		= 40*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 		= 3000,
	death_wreck  		= "Module_Wreck",

	check_aim_orientation_angle = 100,
	barrel_rot_speed 	= 90,

	dispersion			= 0,
	crit_chance			= 0,
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 1000,
	
	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode
	shot_effect = "particles/weapons/destroyer_rocket_start",
	shot_once_sound 	= "sound/weapons/rockets/OmegaB_launch",
	--explosion_blast_wave = "Blastwave_DroneField_Main",

	detonate_at_point	= true,
}

Def.Projectile_DroneField_Main = --неуправляемая торпеда которую выпускает модуль
{
	inherit						= "Weapon_BaseRocket",
	
	model						= "models/weapons/bs_torpedo_big",
	
	explosion_blast_wave		= "Blastwave_DroneField_Main",
	
	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	hack_immune					= true,
	
	detonation_timeout			= 0.1,
	detonation_radius			= 1,

	detonate_on_distance		= 30,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.

	is_guided					= true,
	child_rockets =
	{
	    rocket = "Projectile_DroneField_DroneRocket",
	
	    sphere_radius = 3, -- из сферы какого радиуса начнется разлет
		
	    -- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
	    -- Общее количество ракет не должно превышать 20
	    scheme = { 
	        circle0 = { amount = 16, angle = 90, }, -- опционально
	
		},
		
		target_pos_scheme = {
			circle0 = { amount = 1, angleX = 0, radius = 100, },
			circle1 = { amount = 2, angleX = 30, radius = 50, },
			circle2 = { amount = 2, angleX = 60, startAngleZ = 45, radius = 100, },
			circle3 = { amount = 6, angleX = 90, startAngleZ = 90, radius = 100, },
			circle4 = { amount = 2, angleX = 120, startAngleZ = 135, radius = 100, },
			circle5 = { amount = 2, angleX = 150, startAngleZ = 180, radius = 50, },
			circle6 = { amount = 1, angleX = 180, radius = 100, },
		},

		death_entity_ttl_add_min = 0.1,
		death_entity_ttl_add_max = 0.4,			
	},

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	
	effect 				= "particles/weapons/missile/rocket_trail_mid",
	work_sound			= "sound/weapons/rockets/rocket_fly",
}

Def.Blastwave_DroneField_Main = 
{
	class					= "BlastWave",
	in_editor				= false,
	
	apply_damage			= true,
	constant_damage			= false, --blast_minDistance работает только с этим флагом (false)
	
	damage_emp				= 8500,
	
	intensity				= 200,
	blast_minDistance		= 20,
	blast_maxDistance		= 50,
	self_damage_coef		= 0.75,
	clanship_damage_coef	= 0.1,
	
	effect 		 			= "particles/explosions/explosion_huge_emp",
	light_color  			= "140 175 240 100",
	light_radius 			= 150,
	light_time   			= 1.0,
	sound 		 			= "sound/explosion/big_rocket_expl",
}

Def.Projectile_DroneField_DroneRocket = -- ракеты-дроны, которые летят к своей позиции после взрыва торпеды 
{
	inherit						= "Weapon_BaseRocket",
	
	model						= "models/weapons/drones/sleeping_drone/sleeping_drone",
	
	explosion_blast_wave		= "",
	
	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	hack_immune					= true,
	
	damage						= 0,
	damage_kinetic				= 0,
	damage_emp					= 0,
	damage_thermal				= 0,
	
	detonation_radius			= 15,  
	max_range					= 400,  
	speed 						= 50,
	angular_velocity 			= 375,
	is_guided 					= true,
	use_pathfinder 				= true,
	
	flare_color					= "255 170 191 0",
	flare_size					= 0.0,
	flare_angle					= 180,

	work_sound					= "sound/weapons/rockets/DroneRocket_fly",
	--effect 						= "particles/ships/sleeping_drone_trail",
	impact_type 				= "plasma",
	hack_immune 				= true,
	
	death_entity				= "Mine_DroneField_SleepingDrone",
	death_entity_max_deviation	= 15,
	children =
	{
		{ effect		= "particles/ships/sleeping_drone_engine", joint = "exhaust_1"  },
	},
}

Def.Mine_DroneField_SleepingDrone = -- ракеты которые появляются при достижении своей позиции
{
	inherit						= "Weapon_BaseRocket",
	
	model						= "models/weapons/drones/sleeping_drone/sleeping_drone",
	
	explosion_blast_wave 		= "",
	
	override_blast_wave_damage	= true,
	missile_detection_immune	= true,
	hack_immune					= true,
	
	damage						= 0,
	damage_kinetic				= 0,
	damage_emp					= 0,
	damage_thermal				= 0,
	
	speed 						= 0,
	
	--effect 						= "particles/weapons/nuke/workflare",
	work_sound 					= "",
	
	detect_target_in_radius		= true,
	detection_radius			= 120,
	detonation_radius			= 80,
	
	detonation_timeout			= 3,
	
	flare_size					= 0.0,
	flare_occl_size				= 1,
	flare_aspect				= 1,
	flare_angle					= 180,
	flare_color 				= "255 150 100 0",
	flare_warp					= 0.1,
	
	time_to_live				= 30,
	
	death_entity_on_auto_detonate = "Drone_DroneField_Active",
	play_death_effect_on_distance = true,
	death_effect				= "particles/explosions/big_fire_2",
	death_sound					= "sound/explosion/drone_expl",
	
	children = 
	{
		{ effect = { s1 = "particles/null", s2 = "particles/weapons/nuke/workflare", default = "particles/null" }, joint = "root" },
	},
	use_team_skin = true,
}

Def.Drone_DroneField_Active =
{
	class						= "GuidedDrone",
	in_editor					= false,

	model						= "models/weapons/drones/sleeping_drone/sleeping_drone",

	physics						= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 100, },

	signature					= ai.Signature.SMALL,

	death_effect				= "particles/explosions/big_fire_2",
	death_sound					= "sound/explosion/drone_expl",
	remove_effect				= "particles/explosions/big_fire_2",
	remove_sound				= "sound/explosion/drone_expl",

	projectile					= "Projectile_BasicPlasma", --Projectile_PlasmaBlaster
	shot_effect 				= "particles/weapons/drongun/muzzle",

	shot_once_sound 			= "sound/weapons/turret/turret_oneshot",

	trail_effect 				= "particles/ships/ship_trail",
	trail_color 				= "4 95 184 100",
	trail_size 					= 0.1,

	max_speed					= 45,
	acceleration				= 30,
	max_rot_speed				= 200,	-- deg per second
	max_aim_rot_speed			= 285,
	
	control_range				= 400,
	fire_rate					= 45,
	dispersion					= 1,
	optimal_range				= 50,
	max_range					= 100,
	projectile_speed			= 350,
	damage_emp					= 900,
	
	health 						= 800,

	uiName 						= "itemSubType_BasicGuidedDron",
	uiDesc 						= "itemSubType_BasicGuidedDron_desc",
	
	ttl							= 30,
	
	max_ttl_after_owner_death	= 10,
	defence_position			= true,
	signature_damage_coefs		= BlastWaveSignatureCoef,
	children =
	{
		{ effect		= "particles/ships/sleeping_drone_engine", joint = "exhaust_1"  },
	},
}

Def.SpaceMissile_ProximityMine_Albireo =
{
	inherit						= "SpaceMissile_ProximityMine_T5_Epic",
	holder_size					= 2,
	cooldown					= 7,
	empty_holder_cooldown		= 45,
	storeItemId					= 0,
	outdated					= false,
}

Def.Module_ThorStasis =  
{
	class 							= "SpaceShipModule",
	in_editor						= false,
	
	max_health_percent				= 0.50,
	spell_on_max_health_minus 		= "Spell_ThorStasis",
	
	max_health_spell_cancel			= false,
	
	cooldown						= 45,
}

Def.Module_MassEnergyLeak =  
{
	class 							= "ActiveModule",
	in_editor						= false,
	cant_be_bought 					= true,
	
	energy_cost						= 200,
	
	cooldown						= 45,
	
	spell 							= "Spell_MassEnergyLeak",
	
	activate_sound 					= "sound/gadgets/common_activate",
}

--
Def.Module_EnergyLanceAura =
{
	class 							= "EnergyLance",
	in_editor						= false,
	cant_be_bought 					= true,

	cooldown						= 15,
	energy_cost 					= 200,
	work_time						= 8,

	damage_box_size					= Vec3( 15.0, 15.0, 13.0 ), -- ширина, высота, вперед
	damage_box_offset				= Vec3( 0.0, 0.0, 5.0 ),

	damage_thermal					= 4000,

	spell							= "Spell_EnergyLanceAura",
	activate_sound 					= "sound/gadgets/EnergyLanceAura/ela_activation",
}

Def.Module_SpecialRestore =  
{
	class 							= "SpaceShipModule",
	in_editor						= false,
	
	spell_on_special_activate		= "Spell_SpecialRestore",
	
	cooldown						= 30,
}

Def.Module_ThrasherActive =
{
	class 		= "ActiveModule",
	item_subtype		= ItemSubtype.ThrasherActive,
	in_editor	= false,
	cooldown	= 45,
	activate_entity	= "ThrasherGate",
	activate_entity_max = 1, -- максимум 8
	activate_entity_ttl = 3,
	--activate_entity_health = 10000,
	energy_cost = 500,
	check_spawn_collision = true,
	duration = 6,
	spell	= "Spell_ThrasherGate",
	additional_spell = "Spell_ThrasherBooster",


	--energy_cost_per_second = 10, -- реализовано но не используется в этом модуле
	activate_sound = "sound/gadgets/warpgate/wg_activate",

	spawn_offset = Vec3( 0, 0, -50 ),
}
Def.ThrasherGate =
{
	class		= "WarpGate",
	in_editor	= false,
	uiName		= "Module_WarpGate",
	model		= "models/modules/m_active/warpgate/warpgate",
	physics		= { solid_type = solid.model, kinematic = true, hitbox = true, },
	warp_distance = 80,
	warp_cooldown = 0.5,
	work_sound 	= "sound/gadgets/warpgate/wg_work_loop",
	warp_sound 	= "sound/gadgets/warpgate/ship_warp_out",

	health		= 10000,
	damageable	= false,
	hudType		= "default",

	warp_forward = false,
	warp_check_angle = 45,
	warp_check_box_scale = 1,

	death_effect = "particles/gadget/drone_overcharge",

	children =
	{
		{ effect = "particles/gadget/warpgate_center_pirate", joint = "main" },
	}
}

Def.Module_Snowfall =
{	
	module_type 	= ai.ModuleType.CPU_MOD,
	item_subtype	= ItemSubtype.Snowfall,
	class 			= "SpaceShipModule",
	in_editor		= false,
	beacon_capture_mul		= 0.15,
	crowd_control_coef_mul 	= -0.4,
	default_icon			= "ItemSubtype_Snowfall",
}

Def.Module_TyphonActive =  
{
	class 			= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor		= false,
	item_subtype 	= ItemSubtype.TyphonActive,
	
	energy_cost		= 400,
	cooldown		= 45,
	
	spell			= "TyphonActive",
	ignore_silence	= true,
	activate_sound = "sound/gadgets/Invulnerability",
	
	default_icon	= "ItemSubtype_TyphonActive",
}

Def.Module_Sneeze = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor		= false,
	item_subtype 	= ItemSubtype.Sneeze,
	cooldown				= 20,
	energy_cost				= 100,
	
	influence_type_color = InfluenceTypeColor.DAMAGE_TERMAL,
	
	spell		 			= "Sneeze_1",
	default_icon 			= "ItemSubtype_Sneeze",
	
}

Def.Sneezer = 
{
	class				= "AuraHolderEntity",
	damageable			= false,
	hack_immune			= true,
	in_editor			= false,
}

-- Активка для крафта Прикрытия 15 ранга
Def.Module_Ronin_Stealth =  
{
	class 			= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor		= false,
	item_subtype 	= ItemSubtype.Ronin_Stealth,
	
	trigger_aura	= true,
	energy_cost		= 200,
	energy_cost_per_second = 100,
	cooldown		= 45,
	
	spell			= "Ronin_Stealth",
	
	
	activate_sound = "sound/gadgets/Invulnerability",
	model 						= "models/modules/m_active/m_a_gadget_pulsar",
	default_icon	= "ItemSubtype_Ronin_Stealth",
	influence_type_color		= InfluenceTypeColor.BUFF_STAT,
	
}


--Калтроп активка мина со станом

Def.Module_Caltrop_StanMine =
{
	class				= "FiringModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 			= false,

	cooldown			= 40,
	energy_cost 		= 180,
	
-----
	projectile 			= "Projectile_Caltrop_StanMine",
	projectile_speed 	= 0,
	max_range			= 0, --350,

	item_subtype 	= ItemSubtype.Caltrop_StanMine,
	
	default_icon	= "ItemSubtype_Caltrop_StanMine",
	influence_type_color		= InfluenceTypeColor.DEBUFF_STAT,
	activate_sound = "sound/gadgets/common_activate",
	model 				= "models/modules/m_active/m_a_gadget_pulsar",

}

Def.Projectile_Caltrop_StanMine =
{
	inherit				= "Weapon_BaseRocket",
	death_entity		= "Caltrop_StanMine",
	missile_defence_immune 		= true,
	missile_detection_immune 	= true,

}

Def.Caltrop_StanMine =
{
	--inherit					= "SpaceMissile_ProximityMine_T5_Epic",
	class					= "Minefield",
	field_radius			= 20,
	max_mines				= 1,
	time_to_live			= 30,
	-- period					= 1,
	-- repeat_period			= 1,
	spell 					= "Caltrop_MineStun",
	explosion_blast_wave	= "BlastWave_StanMine",

	use_team_skin			= true,
	shot_effect_s1 			= "particles/gadget/mine_friendly",
	work_effect_s1 			= "particles/gadget/mine_friendly",
	shot_effect_s2 			= "particles/gadget/mine",
	work_effect_s2 			= "particles/gadget/mine",
	
	--uiName					= "itemSubType_Caltrop_StanMine",
	default_icon			= "ItemSubtype_Caltrop_StanMine",
	uiName					= "ItemSubtype_Caltrop_StanMine",
}

Def.BlastWave_StanMine =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 100,
	blast_maxDistance		= 20,
	apply_damage			= true,

	--effect 					= "particles/weapons/katana_minelayer/explosion",
	effect 					 =  "particles/weapons/nuke/explosion_emp",
	light_color 			 = "140 240 140 100",
	light_radius 			= 10,
	light_time 				= 0.2,
	sound 					= "sound/explosion/SmartRocket_expl",
	uiName					= "ItemSubtype_Caltrop_StanMine",
}


--Peregrine активка разбрасывает радарные помехи

Def.Module_Peregrine_Emissions =
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype 	= ItemSubtype.Peregrine_Emissions,

	energy_cost				= 60,

	cooldown				= 40,
	spell					= "Peregrine_Emissions",
	additional_spell		= "Peregrine_debuff",

	model 					= "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 			= "sound/el_modules/fuel_em",
	default_icon	= "ItemSubtype_Peregrine_Emissions",
	influence_type_color		= InfluenceTypeColor.DEBUFF_STAT,
	

}

-- Модуль Jaguar дрон
Def.Module_Jaguar_SlowerDrone =
{	
	inherit = "Module_SentryDrone",
	
	
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype 	= ItemSubtype.Jaguar_SlowerDrone,
	
	activate_entity			= "Jaguar_SlowerDrone",
	activate_entity_health 	= 2000,
	
	cooldown				= 40,
	energy_cost				= 110,
	
	fire_rate				= 200,
	dispersion				= 0.25,
	
	projectile_speed		= 600,
	damage_thermal			= 0,
	damage_kinetic			= 600,
	
	model 				= "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 			= "sound/gadgets/common_activate",
	default_icon	= "ItemSubtype_Jaguar_SlowerDrone",
	influence_type_color		= InfluenceTypeColor.DAMAGE_KINETIC,

}

Def.Jaguar_SlowerDrone =
{
	inherit 				= "SentryDrone",
	projectile				= "Projectile_Jaguar_SlowerDrone",
	signature				=	ai.Signature.TINY,
	uiName 					= "JaguarDrone_name",
	self_damage_coef		= 0, --не дамагаем себя.
}

Def.Projectile_Jaguar_SlowerDrone  =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave= "Blastwave_Sparks_Cannon",
	override_blast_wave_damage = true,
	
	detonation_radius	= 3.6,--

	flare_color			= "255 190 140 15",
	flare_size			= 0.15,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/devostrator_trail",	
	missile_defence_immune 	= true,
		
	disable_concussion_sound = true,
}



-- Cyning ускоряет захват маяка, режет скорострельность

Def.Module_Cyning_Capturer = {
	class 					= "ActiveModule",
	in_editor 				= false,
	item_subtype 	= ItemSubtype.Cyning_Capturer,
	module_type		= ai.ModuleType.ACTIVE,

	model 					= "models/modules/m_active/m_a_gadget_pulsar",

	cooldown				= 40,
	energy_cost				= 10,

	spell 					= "Cyning_Capturer",
	additional_spell		= "Cyning_Capturer1",

	model 				= "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 			= "sound/gadgets/common_activate",
	default_icon	= "ItemSubtype_Cyning_Capturer",
	influence_type_color		= InfluenceTypeColor.BUFF_ABILITY,
	
}


--Кракен усиливает снаряд дезы
Def.Module_KrakenMode  = 
{
	class 					= "ActiveModule",
	in_editor 				= false,
	item_subtype 	= ItemSubtype.KrakenMode,
	module_type		= ai.ModuleType.ACTIVE,

	trigger_aura			= true,
	cooldown				= 40,
	energy_cost_per_second 	= 30,
	
	spell					= "KrakenMode",
	deactivate_spell		= "KrakenMode_dec",
	
	
	default_icon	= "ItemSubtype_KrakenMode",
	influence_type_color		= InfluenceTypeColor.BUFF_ABILITY,
	model 				= "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 			= "sound/gadgets/common_activate",
	
}

--САВАН скорострельность бафает

Def.Module_SawOne_FireRate =  
{
	class 			= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor		= false,
	item_subtype 	= ItemSubtype.SawOne_FireRate,
	
	energy_cost		= 400,
	cooldown		= 45,
	
	spell			= "SawOne_FireRate",
	additional_spell = "SawOne_RangeMode",
	
	default_icon	= "ItemSubtype_SawOne_FireRate",
	influence_type_color		= InfluenceTypeColor.BUFF_DAMAGE,
	model 				= "models/modules/m_active/m_a_gadget_pulsar",
	activate_sound 			= "sound/gadgets/common_activate",
	
}


--Mjolnir удар от заряда
Def.Module_MjolnirHook = 
{

	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.ACTIVE,
	
	cooldown					= 45,
	energy_cost					= 40,

	charge_spell_on_damage		= "MjolnirHook_charge",
	charge_damage		= 3000,
	charge_mask			= ai.ChargeType.OUTGOING_DAMAGE_SHIP,
	consume_aura		= ai.Aura.CHARGE_SPELL,
	spell 						= "MjolnirHook",
	
	activate_beam_fx				= "particles/gadget/jericho_module_beam",
	activate_sound					= "sound/gadgets/common_activate",
		
		
	item_subtype				= ItemSubtype.MjolnirHook,
	
	default_icon				= "ItemSubtype_MjolnirHook",
	influence_type_color		= InfluenceTypeColor.DAMAGE_KINETIC,
	model 					= "models/weapons/plasma/power/vortex",

}

-- Octopus Хилящий луче

Def.Module_Octopus_HealFlow = 
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.ACTIVE,
	item_subtype				= ItemSubtype.Octopus_HealFlow,

	model 					= "models/weapons/plasma/power/vortex",


	cooldown				= 2,
	energy_cost				= 10,
	energy_cost_per_second 	= 500,
	
	trigger_aura 			= true,

	spell 					= "HealFlow",
	additional_spell		= "HealSheeldFlow",

	default_icon				= "ItemSubtype_Octopus_HealFlow",
	influence_type_color		= InfluenceTypeColor.REPAIR_HULL,
	activate_sound 				= "sound/gadgets/common_activate",
	model 					= "models/weapons/plasma/power/vortex",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
	

}

Def.Module_SeeressDrug =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type 			= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.SeeressDrug,

	activate_entity 		= "SeeressDrug",
	deactivate_spell		= "SeeresDrug_NoRadar", 
	--spell					= "SmartBomb_T1_Mk1",

	spawn_offset 			= Vec3( 0, -1, -5 ),

	energy_cost 			= 20,
	cooldown 				= 20,
	activate_sound 			= "sound/gadgets/common_activate",
	default_icon 			= "ItemSubtype_SeeressDrug",
	
	-- ods_export				= true,
	-- storeItemId				= 1,
	-- cant_be_bought			= true,
	-- premiumPrice			= 999999,
	-- tier					= 5,	
	-- item_lvl				= 25,
	-- in_editor				= false,
	-- rank_min				= 1,
	-- rank_max				= 17,
	-- class_mask=ai.ShipClass.SMALL,
	-- required_role = ai.ShipRoles.SCOUT,
}


Def.SeeressDrug =
{
	class 				= "TeleportingProjectile",
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", static = true, hitbox = true, }, -- если сделать реальную физику как у SpyBeacon, то возврат не работает, вообще это "пуля" так что с физикой тут какая то неразбериха.
	hudType 			= "default",
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",

	speed 					= 0, -- чтобы не двигалось
	--explosion_blast_wave = nil,
	--detonation_radius = 0, -- и не взрывалось само

	time_to_live 			= 90,
	max_owner_distance		= 750,
	health 					= 2500,
	damageable 				= true,
	missile_defence_immune 		= true,
	missile_detection_immune 	= true,

	teleport_preparation_time = 1.5, -- [новое] время подготовки к прыжку после деактивации модуля
	teleport_on_ttl 		= false, -- [новое] телепортировать или нет по истечению времени жизни (по умолчанию true)
	teleport_radius 		= 30,	-- радиус
	teleport_target 		= {-- таргеты как в аурах (таблица)
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			vitality		= ai.SpellTargetVitality.ALIVE,
			misc			= ai.SpellTargetMisc.ALLY_OR_NOT_CIVILIAN + ai.SpellTargetMisc.EXCLUDE_CASTER,	-- #SC-97502 действует на дружественную, либо враждебную/нейтральную цель без "защиты странции", соответственно не действует на вражескую/нейтральную цель "под защитой станции"
		},


	in_sound				= "sound/destroyer/teleporter_in",
	out_sound				= "sound/destroyer/teleporter_out",

	hack_immune				= true,

	--in_blastwave = "BlastWave_SM_Fireworks_T1_Mk1", -- [новое] бластвейв в месте пропадания корабля (out_blastwave - в месте появления)

	teleport_time 			=	 0.2, -- 0.2 это время самого телепорта (точнее, время эффекта растворения/появления), по умолчанию 1

	in_fx 					= "particles/gadget/teleport",
	out_fx 					= "particles/gadget/teleport",

	flare_color				= "0 0 0 0", -- убрал засветку ракетную

	uiName 					= "ReturnPoint",
	uiDesc 					= "ReturnPoint_Desc",
}

Def.Module_HeliconModule =
{
	class 					= "ActiveModule",
	in_editor				= false,
	module_type 			= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.HeliconModule,
	cooldown				= 35,
	energy_cost 			= 100,
	spell					= "HeliconModule",
	activate_sound 			= "sound/gadgets/common_activate",
	default_icon 			= "ItemSubtype_HeliconModule",
}

Def.Module_SeeressEngMod = --Инжектор тетраоксида Сересс
{

	--inherit					= "Module_BoostersOverloader_T5_Epic",
	item_subtype			= ItemSubtype.BoostersOverloader,
	
	max_speed_mul 			= 0.05,
	strafe_accel_mul		= 0.587,
	acceleration_mul		= 0.587,
	boost_energy_cost_per_second_mul = -0.1111111,
	
	
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	in_editor				= false,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",
	
	default_icon			= "ItemSubtype_BoostersOverloader",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
}

Def.Module_SeeressArmMod = --Улучшенные пилоны Сересс
{
	--inherit					= "ModulePassive_FastMissileRacks_T5_Epic",
	
	hull_resist_add 		= 15,
	rocket_cooldown_coef_mul= -0.32,
	item_subtype			= ItemSubtype.SeeressArmMod,
	
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	in_editor				= false,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,
	default_icon			= "ItemSubtype_FastMissileRacks",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
}

Def.Module_UpgradedSpecial_mk1 = -- разгон спецмодуля, пассивка корабля Cerbirus. через таблицу не экспортится, пришлось сделать через отдельные спеллы
{
	class 					= "SpaceShipModule",
	in_editor				= false,
	item_subtype			= ItemSubtype.UpgradedSpecial,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	module_type				= ai.ModuleType.ARMOR_MOD,
	spell_on_equip			= "UpgradedSpecial",
	activate_sound 			= "sound/gadgets/common_activate",
	
}

Def.Module_UpgradedSpecial_Rare =
{
	inherit					= "Module_UpgradedSpecial_mk1",
	spell_on_equip			= "UpgradedSpecial_Rare",
}

Def.Module_UpgradedSpecial_mk3 =
{
	inherit					= "Module_UpgradedSpecial_mk1",
	spell_on_equip			= "UpgradedSpecial_mk3",
}

Def.Module_UpgradedSpecial_Epic =
{
	inherit					= "Module_UpgradedSpecial_mk1",
	spell_on_equip			= "UpgradedSpecial_Epic",
}

Def.Module_UpgradedSpecial_Rel =
{
	inherit					= "Module_UpgradedSpecial_mk1",
	spell_on_equip			= "UpgradedSpecial_Rel",
}

Def.Module_BaphometModule =
{
	class 					= "ActiveModule",
	in_editor				= false,
	module_type 			= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.BaphometModule,
	cooldown				= 35,
	energy_cost 			= 100,
	spell					= "BaphometVampiredebuff",
	additional_spell		= "BaphometVampirebuff",
	activate_sound 			= "sound/gadgets/common_activate",
	--activate_beam_fx				= "particles/gadget/jericho_module_beam",
	default_icon 			= "ItemSubtype_BaphometModule",
	
}

Def.Module_MagnitkaHadrian =
{
	class 					= "ActiveModule",
	in_editor				= false,
	module_type 			= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.MagnitkaHadrian,
	cooldown				= 35,
	energy_cost 			= 100,
	spell					= "MagnitkaHadrian",
	--additional_spell		= "BaphometVampirebuff",
	activate_sound 			= "sound/gadgets/common_activate",
	--activate_beam_fx				= "particles/gadget/jericho_module_beam",
	default_icon 			= "ItemSubtype_MagnitkaHadrian",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.COMMAND,
	required_ship	= "Ship_Race1_M_T5_Hadrian",	
	
}

Def.Module_ManulShields =
{
	class 					= "ActiveModule",
	in_editor				= false,
	module_type 			= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.ManulShields,
	cooldown				= 40,
	energy_cost 			= 250,
	spell					= "Spell_ManulShields",
	additional_spell		= "Spell_ManulShieldsBuff",
	
	activate_sound 			= "sound/gadgets/common_activate",
	--activate_beam_fx				= "particles/gadget/jericho_module_beam",
	default_icon 			= "ItemSubtype_BaphometModule",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,

}

Def.Module_DragonFlashControl = 
{
	class				= "RemoteSwarm",
	module_type 			= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.DragonFlashControl,
	
	cooldown			= 30,
	energy_cost 		= 185,
	
	activate_damage_mul	= 0.5,
	
	remote_control_range	= 700,
	remote_control_zone_leave_timeout = 7,

	
	spell = "Spell_DragonFlashControlResist",
	
	spell_on_max_speed_plus = "Spell_DragonFlashControl", -- спелл катуется из дрона а не модуля. вписал для тултипа
	max_speed_activation_time = 600,
	max_speed_percent		= 1,

	activate_sound		= "sound/gadgets2/DragonFlash/df_activate",
	deactivate_sound	= "sound/gadgets2/DragonFlash/df_deactivate",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.ENGINEER,
	required_ship	= "Ship_Race5_L_T5_Salamander",
}

Def.Module_DragonFlashRangeMaster = 
{
	
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	in_editor				= false,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	--unique_equip			= true,
	default_icon			= "ItemSubtype_DragonFlashRangeMaster",
	item_subtype			= ItemSubtype.DragonFlashRangeMaster,
	
	optimal_range_mul		= 0.3999,
	max_range_mul			= 0.3999,
	damage_mul				= -0.070,
	
	controlled_swarm_can_shoot		= true,
	swarm_shot_health_cost_percent	= 00,
	swarm_projectile_speed			= 400,
	swarm_projectile_damage_thermal	= 3200,
	swarm_projectile_fire_rate		= 40,
	swarm_projectile_optimal_range	= 200,
	swarm_projectile_max_range		= 200,
	unique_equip					= true,
	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,

	class_mask				= ai.ShipClass.LARGE,
	required_role 			= ai.ShipRoles.ENGINEER,
	required_ship			= "Ship_Race5_L_T5_Salamander",
	
}

Def.Module_DragonAdaptiveForceShield = 
{
	
	class					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	in_editor				= false,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "SHIELD_MOD",
	unique_equip			= true,
	default_icon			= "ItemSubtype_DragonAdaptiveForceShield",
	item_subtype			= ItemSubtype.DragonAdaptiveForceShield,
	
	max_speed_percent		= 0.90,
	spell_on_max_speed_plus = "Spell_DragonAdaptiveForceShield",
	

	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,

	class_mask				= ai.ShipClass.LARGE,
	required_role 			= ai.ShipRoles.ENGINEER,
	required_ship			= "Ship_Race5_L_T5_Salamander",
	
}

Def.Module_HeartCooldownerDec =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type 			= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.HeartCooldownerDec,
	
	--energy_cost				= 120,
	energy_cost_per_second 	= 70,
	trigger_aura 			= true,
	
	cooldown				= 2,
	spell					= "Spell_HeartCooldownerDec",

	work_beam_fx = "particles/gadget/exhaustion_beam_energy_pink",
	
	default_icon	= "ItemSubtype_HeartCooldownerDec",
	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
}

Def.Module_CorVulnusCPU = --CPU CorVulnus
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.CorVulnusCPU,
	in_editor				= false,
	
	crowd_control_coef_mul = -0.774,
	
	spell_on_equip			= "Spell_CorVulnusCPU",	
		
	default_icon			= "ItemSubtype_CorVulnusCPU",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.ECM,
	required_ship	= "Ship_Race1_S_T5_CorVulnus",
}	

Def.Module_GreenSouls = 
{
	
	class				= "ActiveModule",
	in_editor			= false,	
	module_type			= ai.ModuleType.ACTIVE,	
		item_subtype		= ItemSubtype.GreenSouls,	
	
	
	energy_cost 		= 400,
	hull_cost_per_second = 1000,
	trigger_aura 			= true,
	cooldown			= 45,

	spell				= "Spell_GreenSouls",	
	work_beam_fx = "particles/gadget/alien_beam_souls",
	
	model 					= "models/weapons/plasma/power/vortex",
	work_sound 		= "sound/gadgets2/GreenSouls_loop",
	
	default_icon		= "ItemSubtype_GreenSouls",
		
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,	
}


Def.Module_GreenChargeFlow = 
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.ACTIVE,
	item_subtype				= ItemSubtype.GreenChargeFlow,


	model 					= "models/modules/m_active/elidium_modules/ion_flow",

	cooldown				= 45,
	-- energy_cost				= 10,
	 energy_cost_per_second 	= 150,
	
	hull_cost_per_second	= 450,
	
	trigger_aura 			= true,

	spell 					= "Spell_GreenChargeFlow",
	--additional_spell		= "HealSheeldFlow",

	default_icon				= "ItemSubtype_GreenChargeFlow",
	work_sound 		= "sound/gadgets2/GreenChargeFlow",
	model 					= "models/modules/m_active/elidium_modules/crystal_rage_mode",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,	

}

Def.Module_GreenCommanderBuffer = 
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.ACTIVE,
	item_subtype				= ItemSubtype.GreenCommanderBuffer,

	model 					= "models/weapons/plasma/power/vortex",


	cooldown				= 40,
	energy_cost				= 180,
	--energy_cost_per_second 	= 75,
	
	hull_cost				= 600,
	
	spell 					= "Spell_GreenCommanderBuffer",
	--spell_on_equip_inactive	= "Spell_GreenCommanderResist",

	default_icon				= "ItemSubtype_GreenCommanderBuffer",

	activate_sound 				= "sound/gadgets/common_activate",
	model 					= "models/modules/m_active/elidium_modules/crystal_rage_mode",

	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,	

}

Def.Module_GreenCommanderEmergency =
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.GreenCommanderEmergency,
	in_editor	= false,
	
	cooldown	= 45,
	show_cooldown_status = true,
	crowd_control_coef_mul 	= -0.25,
	spell_on_max_health_minus 		= "Spell_GreenCommanderEmergency",
	max_health_percent				= 0.325,
	--activate_sound = "sound/gadgets/EmergencyBarrier",
	
	default_icon			= "ItemSubtype_GreenCommanderEmergency",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,	
}

Def.Module_GreenCommanderHullRep =
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.GreenCommanderHullRep,
	in_editor	= false,
	
	
	spell_on_equip	= "Spell_GreenCommanderHullRep",
	
	default_icon			= "ItemSubtype_GreenCommanderHullRep",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,	
}

Def.Module_GreenCapFirerate =
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",
	unique_equip			= true,
	item_subtype			= ItemSubtype.GreenCapFirerate,
	in_editor	= false,
	
	
	spell_on_equip				= "Spell_GreenEngineFirerate_min",
	spell_on_max_speed_plus 	= "Spell_GreenEngineFirerate_max",
	--spell_on_max_speed_minus	= "Spell_GreenEngineCooller_min",
	max_speed_percent  			= 0.5,

	default_icon			= "ItemSubtype_GreenCapFirerate",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
		
}

Def.Module_BarkBomb =
{
	class = "FiringModule",
	module_type = ai.ModuleType.ACTIVE,
	item_subtype = ItemSubtype.BarkBomb,
	
	cooldown = 40,
	crit_chance = 0,
	damage_thermal = 20000,
	dispersion = 0,
	
	energy_cost = 150,
	fire_rate = 90,

	max_range = 200,

	projectile = "Projectile_BarkBomb",
	
	projectile_speed = 15,
	track = ai.TrackMode.OFFSET,--ai.TrackMode.AIM,
	
	track_offset = Vec3( 0, -300, -1000 ),
	
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius = 10,
	muzzleflash_time = 1,
	--shot_effect = "particles/weapons/destroyer_rocket_start",
	shot_once_sound = "sound/gadgets2/BarkBomb_launch",
	
	default_icon			= "ItemSubtype_BarkBomb",
	
	-- Cybersport restrictions
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	
}

Def.Projectile_BarkBomb =
{
	inherit				= "Weapon_BaseRocket",

	model 			= "models/weapons/bs_fab/bs_fab",
	explosion_blast_wave = "Blastwave_BarkBomb",
	override_blast_wave_damage = true,
	is_guided 			= false,
	missile_defence_immune		= true,
	detonation_radius	= 20,

	effect 				= "particles/gadget/barkbomb_deploy",
	flare_color			= "255 190 140 15",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	
	work_sound 	    = "nil",
}

Def.Blastwave_BarkBomb =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 30,
	blast_minDistance	= 30,
	apply_damage		= true,
	apply_shake 		= true,
	
	effect = "particles/explosions/explosion_bark_bomb",
	light_color 		= "255 160 80 100",
	light_radius 		= 12,
	light_time 			= 0.5,
	sound 				= "sound/explosion/big_rocket_expl",
}

Def.Module_ShrikeHealAll =
{
	class			= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype	= ItemSubtype.ShrikeHealAll,
	
	
	--energy_cost		= 120,
	energy_cost_per_second 	= 300,
	
	trigger_aura 			= true,
	cooldown		= 40,
	
	spell			= "Spell_ShrikeHealAll",

	default_icon	= "ItemSubtype_ShrikeHealAll",

	activate_sound		= "sound/gadgets/ShieldWall/sw_activate",
	
		-- Cybersport restrictions
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
}

Def.Module_ShrikeAttraction =
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.ShrikeAttraction,
	in_editor	= false,
	
	hull_health_mul			= 0.35,
	max_speed_mul			= 0.05,
	spell_on_equip	= "Spell_ShrikeAttraction",
	
	default_icon			= "ItemSubtype_ShrikeAttraction",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,	
}

Def.Module_ShrikeCrit =
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.ShrikeCrit,
	in_editor	= false,
	
	crit_damage_add			= -0.3,
 	crit_chance_add 		= 0.2,
	
	default_icon			= "ItemSubtype_ShrikeCrit",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,	
}

Def.Module_PilumAntiHeat = 
{
 	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.PilumAntiHeat,
	
	in_editor 				= false,

	energy_cost				= 10,
		cooldown				= 2, --9
	
	spell					= "Spell_PilumAntiHeat",
	additional_spell		= "Spell_PilumAntiHeatDamageMul",
	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
	
	default_icon			= "ItemSubtype_PilumAntiHeat",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	required_ship	= "Ship_Race2_S_T5_Pilum",
}

Def.Module_PilumSpecialDamage =
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.PilumSpecialDamage,
	in_editor	= false,
	
	crit_damage_add			= 0.15,
 
	spell_on_special_activate = "Spell_PilumSpecialDamage",
	
	default_icon			= "ItemSubtype_PilumSpecialDamage",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	required_ship	= "Ship_Race2_S_T5_Pilum",
}

Def.Module_Heliboom = 
{
 	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.Heliboom,
	
	in_editor 				= false,

	energy_cost				= 300,
	cooldown				= 20, --9
	
	spell					= "Spell_heliboom",
	--additional_spell		= "Spell_PilumAntiHeatDamageMul",
	
	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/common_activate",
	
	default_icon			= "ItemSubtype_Heliboom",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.SNIPER,
	required_ship	= "Ship_Race5_L_T5_Helios",
}

Def.Blastwave_Heliboom =
{
	class							= "BlastWave",
	in_editor						= false,

	--damage_emp						= 10000,
	damage_kinetic						= 8000,
	blast_maxDistance				= 10,
	blast_minDistance				= 8,
	apply_damage					= true,
	apply_shake 					= true,

	effect							= "particles/gadget/damage_emp_sphere_blue",
	light_color						= "50 100 255 150",
	light_radius					= 20,
	light_time						= 0.8,
	sound							= "sound/explosion/plasma_rocket_expl",
}

Def.Module_HeliAntiRadar =
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CPU_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.HeliAntiRadar,
	in_editor	= false,
	
	spell_on_max_speed_minus 	= "Spell_HeliAntiRadar",
	max_speed_percent			= 0.05,
	max_speed_activation_time	= 5, --
 
		
	default_icon			= "ItemSubtype_HeliAntiRadar",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.SNIPER,
	required_ship	= "Ship_Race5_L_T5_Helios",
}

Def.Module_HeliAccelerationCoil =
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.HeliAccelerationCoil,
	in_editor	= false,
	
	projectile_speed_mul	= 0.4,
	energy_regen_mul		= -0.15,
 
		
	default_icon			= "ItemSubtype_HeliAccelerationCoil",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.SNIPER,
	required_ship	= "Ship_Race5_L_T5_Helios",
}

Def.Module_PsiloiStarSail = 
{
	class					= "ActiveModule",
	in_editor				= false,
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.PsiloiStarSail,
	
	activate_entity			= "PsiloiStarSail",
	activate_entity_ttl		= 12,
	spawn_offset			= Vec3( 0, 0, -16 ),
	--spawn_offset			= Vec3( 0, 1, -10 ),
	--spawn_dir_to_target	= true,
	attach_bone				= "root",

	
	cooldown			= 40,
	energy_cost 		= 100.0,
	energy_cost_per_second = 30,
	trigger_aura		 = true,	
	
	spell 					= "Spell_PsiloiStarSail_New",
	additional_spell		= "Spell_PsiloiStarSail_FireRate",
	check_spawn_collision = true,
	
	activate_sound		= "sound/gadgets2/PsiloiStarSail_activate",
	deactivate_sound	= "sound/gadgets2/PsiloiStarSail_deactivate",
	--activate_beam_fx		= "particles/gadget/tractor_beam",
	
	--trigger_aura			= true,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
	required_ship	= "Ship_Race1_S_T5_Psiloi",
}

Def.PsiloiStarSail = 
{
	class		= "BaseEntity",
	in_editor	= false,
	hack_immune = true,
	radar_vison		= ai.ShieldRadarVisionMode.BLOCK_ENEMY,
	--model		= "models/shields/uniquehardshield",
	model		= "particles/models/psiloi_sail_model",	
	--model		= "models/shields/uniquehardshield",
	physics		= { solid_type = solid.model, hitbox = true, material = "GiantShield", mass = 10, static_collision = false },
	children =
	{
		{ effect		= "particles/gadget/psiloi_star_sail" },
	},
	
	end_effect		= "particles/gadget/psiloi_star_sail_start",
	weapon_mode		= ai.ShieldWeaponMode.BLOCK_ENEMY,

	is_shield_with_ship_collision = true,
	is_shield						= true,
	ignore_transparency = true, -- SC-114509
}

Def.Module_PsiloiSafeEngine = -- дает реген энергии, за счет макс. скорсти
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.PsiloiSafeEngine,
	in_editor	= false,
	
	rot_speed_mul			= -0.1,
	energy_regen_mul 		= 0.4,
		
	default_icon			= "ItemSubtype_HeliAccelerationCoil",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
	required_ship	= "Ship_Race1_S_T5_Psiloi",
}

Def.Module_PsiloiAutoEmergency =
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.PsiloiAutoEmergency,
	in_editor	= false,
	
	cooldown				 = 60,
	
	emergency_barrier_spell = "Spell_PsiloiAutoEmergency",
	show_cooldown_status	= true,	
	
	activate_sound = "sound/gadgets/EmergencyBarrier",
	default_icon			= "ItemSubtype_PsiloiAutoEmergency",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
	required_ship	= "Ship_Race1_S_T5_Psiloi",
}


Def.Module_BasheActive =
{
	class		= "FiringModule",
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype 	= ItemSubtype.BasheActive,
	in_editor 	= false,

	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 9360, --500
	health_regen 	= 78,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 3000,

	model 			= "models/modules/m_active/module_serpent/module_serpent",
	death_wreck  	= "Module_Wreck",
	
	--additional_spell = "Spell_WebPropulsion",


	check_aim_orientation_angle = 90,
	barrel_rot_speed = 60,

	cooldown	= 35,
	energy_cost = 1000,
	track 		= ai.TrackMode.ENEMY,

	max_range	= 1000,

	damage_emp	= 12000,

	shoot_mode = ai.FiringModuleShootMode.SINGLE_SHOT, 
	fire_rate 	= 20,

	max_projectiles_per_target = 1,

	projectile = "Projectile_DestrActive",
	projectile_speed = 900,

	default_icon 	= "ItemSubtype_BasheActive",
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 		= 10,
	muzzleflash_time 		= 1.0,
	long_shot_effects = true,
	shot_effect = "particles/weapons/other/bashee_lightning_muzzle",
	shot_once_sound = "sound/destroyer/RocketSilo_launch",

	crit_chance = 0,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,
	required_ship	= "Ship_Race5_H_T5_Bashe",
}

Def.Module_BashePassive1 = --CPU BASHE
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.BashePassive1,
	in_editor				= false,
	
	spell_on_equip			= "Spell_BasheCpuDamage_dec",
	
	default_icon			= "ItemSubtype_BashePassive1",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,
	required_ship	= "Ship_Race5_H_T5_Bashe",
}

Def.Module_BashePassive2 = --ARMOR BASHE
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.BashePassive2,
	in_editor				= false,
	
	hull_resist_add			= 15,
	hull_health_mul			= 0.2,	
	
	default_icon			= "ItemSubtype_BashePassive2",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,
	required_ship	= "Ship_Race5_H_T5_Bashe",
}



Def.Projectile_DestrActive =
{
	class					= "ChainLightningProjectile",
	link_range 				= 1000, -- макс расстояние между врагами в цепочке
	chaing_damage			= { 1, 0.5, 0.5, 0.5, }, -- - массив из коэффициентов, на которые будет умножаться дамаг для врагов в цепочке
	chain_target			= --тип целей аналогично аурам (новый формат)
		{ 
		class 				= ai.SpellTargetClass.SHIP,-- +  ai.SpellTargetClass.ScBaseEntity,
		relationship 		= ai.SpellTargetRelationship.ENEMY,
		misc 				= ai.SpellTargetMisc.VISIBLE,
		},
	--shield_subtypes 		= { ItemSubtype.SectorShield, ItemSubtype.Screen, },

	hitbox_min 				= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max				= Vec3( 0.1, 0.1, 0.1 ),
	
	--effect 					= "particles/weapons/alien/crystal_projectile",
	effect 			        = "particles/weapons/other/bashee_lightning_projectile",
	beam_fx 				= "particles/weapons/other/bashee_lightning_beam",
	chain_hit_fx 			= "particles/weapons/other/bashee_lightning_hit",
	
	detonation_radius		= 1,

	flare_color				= "255 150 100 15",
	flare_size				= 0.0, --0
	flare_angle				= 180,
	flare_nebulosity		= 0.1,--0.1,

	impact_type			= "disintegrator",
	work_sound 		= "sound/gadgets/disintegrator/dis_fly",
	--reflection_immune		= true,
}

Def.Module_PerseiActive = {
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype 	= ItemSubtype.PerseiActive,	
	in_editor 				= false,

	--model 					= "models/turret/huge_module_spindle/spindle",
	model 					= "models/weapons/plasma/power/vortex",
	--stop_barrels			= ai.BarrelsStopMode.ACTIVE_DEACTIVATE,

	cooldown				= 30,
	energy_cost				= 120,
	energy_cost_per_second  = 100,
	
	trigger_aura			= true,
	spell 					= "Spell_PerseiActive",
	additional_spell		= "Spell_PerseiActive2",

	activate_sound 			= "sound/gadgets2/PerseiActive/pa_activation",
	work_sound				= "sound/destroyer/TRay_beam",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.TACKLER,
	required_ship	= "Ship_Race3_M_T5_Persei",
}

Def.Module_PerseiPassive1 = --ENGINE Persei
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.PerseiPassive1,
	in_editor				= false,
	

	rot_speed_mul			= 0.30,
	max_speed_mul			= 0.15,
	
	cooldown				= 5,
	show_cooldown_status	= true,
	
	default_icon			= "ItemSubtype_PerseiPassive1",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.TACKLER,
	required_ship	= "Ship_Race3_M_T5_Persei",
}
	
Def.Module_PerseiPassive2 = --CAPACITOR Persei
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.PerseiPassive2,
	in_editor				= false,
	
	fire_rate_mul			= 0.4,	
	energy_max_mul 			= -0.8,
		
	default_icon			= "ItemSubtype_PerseiPassive2",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.TACKLER,
	required_ship	= "Ship_Race3_M_T5_Persei",
}	

-------------------------- СЕТЫ НОВЫЕ ---------------------------------
Def.Module_EngineSetTest =
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",


	item_subtype			= ItemSubtype.EngineSetTest,
	in_editor				= false,
	
	part_of_set				= "test_set_3",

	rot_speed_mul			= 0.01,

	
	cooldown				= 5,

	
	default_icon			= "ItemSubtype_EngineSetTest",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	-- class_mask=ai.ShipClass.MEDIUM,
	-- required_role = ai.ShipRoles.TACKLER,
	-- required_ship	= "Ship_Race3_M_T5_Persei",
}

Def.Module_CapSetTest = --CAPACITOR 
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",

	part_of_set				= "test_set_3",

	item_subtype			= ItemSubtype.CapSetTest,
	in_editor				= false,
	
	rot_speed_mul			= 0.01,

		
	default_icon			= "ItemSubtype_CapSetTest",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
}	

Def.Module_GG_InvinsibleCone = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.GG_InvinsibleCone,


	model = "models/modules/m_active/elidium_modules/ion_flow",
	activate_module_effect = "particles/gadget/default_module_work",


	cooldown				= 40,
	energy_cost				= 10,
	energy_cost_per_second	= 120,
	hull_cost				= 800,
	trigger_aura			= true,

	spell 					= "Spell_GG_InvinsibleCone",
	

	activate_sound 			= "sound/destroyer/TRay_fire",

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,
	
	default_icon	= "ItemSubtype_GG_InvinsibleCone",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,

}

Def.Module_GG_Hipnodancer = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.GG_Hipnodancer,


	model = "models/modules/m_active/elidium_modules/crystal_rage_mode",
	activate_module_effect = "particles/gadget/default_module_work",


	cooldown				= 40,
	energy_cost				= 10,

	spell 					= "Spell_GG_Hipnodancer",
	additional_spell		= "Spell_GG_HipnodancerClean",

	activate_sound 			= "sound/destroyer/TRay_fire",
	
	default_icon	= "ItemSubtype_GG_Hipnodancer",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,

}

Def.Module_GG_Pulsar = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.GG_Pulsar,


	
	model = "models/modules/m_active/elidium_modules/crystal_rage_mode",
	activate_module_effect = "particles/gadget/default_module_work",

	trigger_aura			= true,
	cooldown				= 40,
	

	spell 					= "Spell_GG_PulsarDMG",
	additional_spell		= "Spell_GG_Pulsar",
	activate_sound 			= "sound/destroyer/TRay_fire",
	
	default_icon	= "ItemSubtype_GG_Pulsar",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,

}

Def.Module_GG_CamoCPU = --CPU_MOD Green Guard
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.GG_CamoCPU,
	in_editor				= false,
	
	spell_on_equip			= "Spell_GG_CamoCPU",
	crit_chance_add				= 0.15,
	
	default_icon			= "ItemSubtype_GG_CamoCPU",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,

}

Def.Module_GG_HullBlast = --ARMOR_MOD Green Guard
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.GG_HullBlast,
	in_editor				= false,
	
	hull_health_mul			= 0.3,
		
	spell_on_max_health_minus	= "Spell_GG_HullBlast",
	max_health_percent			= 0.2,

	
	cooldown					= 60,
	show_cooldown_status		= true,
	
	default_icon			= "ItemSubtype_GG_HullBlast",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,

}

Def.Blastwave_GG_HullBlast =
{
	class							= "BlastWave",
	in_editor						= false,

	damage_emp						= 18000,
	blast_maxDistance				= 170,
	blast_minDistance				= 60,
	apply_damage					= true,
	apply_shake 					= true,
	self_damage_coef				= 0,

	effect							= "particles/gadget/damage_emp_sphere_red_small",
	light_color						= "50 100 255 150",
	light_radius					= 20,
	light_time						= 0.8,
	sound							= "sound/explosion/plasma_rocket_expl",
}

Def.Blastwave_GG_HullBlast_T4_Mk1 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 12000,
}

Def.Blastwave_GG_HullBlast_T4_Mk2 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 14000,
}

Def.Blastwave_GG_HullBlast_T4_Mk3 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 15000,
}

Def.Blastwave_GG_HullBlast_T4_Mk4 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 16000,
}

Def.Blastwave_GG_HullBlast_T4_Mk5 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 18000,
}

Def.Blastwave_GG_HullBlast_T5_Mk1 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 15000,
}

Def.Blastwave_GG_HullBlast_T5_Mk2 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 16000,
}

Def.Blastwave_GG_HullBlast_T5_Mk3 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 17000,
}

Def.Blastwave_GG_HullBlast_T5_Mk4 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 18000,
}

Def.Blastwave_GG_HullBlast_T5_Mk5 = 
{
	inherit							= "Blastwave_GG_HullBlast",
	damage_emp						= 20000,
}

Def.Module_GG_ShellOvercharge = --SHIELD_MOD Green Guard
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "SHIELD_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.GG_ShellOvercharge,
	in_editor				= false,
	
	shield_resist_emp_add		= 0.3,
	
	shield_disabled_spell		= "Spell_GG_ShellOvercharge",	

	
	cooldown					= 40,
	show_cooldown_status		= true,
	
	default_icon			= "ItemSubtype_GG_ShellOvercharge",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,

}

Def.GG_ShellOvercharge =
{
	class 				= "ScBaseEntity",
	health 				= 50000, --
	ttl					= 12,
	spell_on_ttl		= "Spell_GG_ShellOvercharge_Bonus",
	damageable			= true,
	network_sync 		= true,
	effect = "particles/gadget/pshield_1",
	ui_color			= 0xFFFFCCFF,
}



Def.Module_HellasMine =
{
	class				= "FiringModule",
	in_editor 			= false,
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.HellasMine,	
	
	check_aim_orientation_angle = 100,
	barrel_rot_speed 	= 90,

	cooldown			= 5,
	energy_cost 		= 180,
	
	track = ai.TrackMode.OFFSET,--ai.TrackMode.AIM,
	track_offset = Vec3( 0, -0, -1000 ),
-----
	-- damage				= 0,
	-- damage_kinetic		= 0,
	-- damage_emp			= 0,
	damage_thermal		= 100,

-----
	projectile 			= "Projectile_HallasMine",
	projectile_speed 	= 300,
	max_range			= 250, --350,

	default_icon 		= "ItemSubtype_HellasMine",

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 	= 5,
	muzzleflash_time 	= 1.0,
	long_shot_effects 	= true,
	shot_effect 	= "particles/weapons/drongun/muzzle",
	oriented_shot_effects = false,
	shot_once_sound 	= "sound/weapons/rockets/javelin_launch",
	ammo				= 4,
	ammo_regen_time		= 30,
	
	-- children =
	-- {
		-- {
			-- effect = "particles/other/gun_lightning",
			-- joint = "joint2",
		-- }
	-- },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.ENGINEER,
	required_ship	= "Ship_Race3_L_T5_Hellas",
}

Def.Projectile_HallasMine =
{
	--inherit				= "Projectile_BasicRailgun",
	inherit				= "Weapon_BaseRocket",
	model				= "models/turret/biglightninggun/h_mine",

	death_entity		= "HallasMine",

	--explosion_blast_wave = "Blastwave_DestrBeamDrone",
	--override_blast_wave_damage = true,

	missile_defence_immune 		= true,
	missile_detection_immune 	= true,

	--detonation_radius	= 10,

	flare_color			= "255 100 100 0",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	effect 				= "particles/weapons/esminec_mine_trail",
	work_sound			= "sound/weapons/rockets/mine_fly",
	--effect 				= "particles/weapons/big/plasma_javelin",
	is_guided = false,
}

Def.HallasMine =
{
	class				= "MineTrap",
	model				= "models/turret/biglightninggun/h_mine",
	signature			= ai.Signature.SMALL,
	health 				= 1750,
	damageable			= true,
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000, },
	target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
	},
	radius				= 50,
	launch_time			= 2.5,
	ttl					= 180,--120
	explosion_on_ttl	= "BlastWave_HallasMine",
	active_aura			= "Spell_HallasMine",
	spell_aura_target	= true, --может быть целью спелов

	--отображение в HUD
	hudType 			= "default",
	uiName 				= "HallasMine_name",
	default_icon		= "ItemSubtype_HallasMine",

	start_sound 		= "sound/weapons/mine/mine_start",

	--spell_on_death		= "SpilledRadioactiveSubstance",
	launch_effect		= "particles/weapons/esminec_mine_activate"
}

Def.BlastWave_HallasMine =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 12000,
	blast_maxDistance	= 50,
	apply_damage		= true,
	apply_shake 		= true,
	self_damage_coef	= 0,
	
	effect 				= "particles/explosions/explosion_big1",

	sound 				= "sound/explosion/mine_expl",
}

Def.Module_HellasCap = --CAPACITOR Hellas
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.HellasCap,
	in_editor				= false,
	
	
	spell_on_equip = "Spell_HellasCap",


	energy_max_mul 			= 0.5,
		
	default_icon			= "ItemSubtype_HellasCPU",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.ENGINEER,
	required_ship	= "Ship_Race3_L_T5_Hellas",
}	


Def.Module_HellasEng = --Engine Hellas
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.HellasEng,
	in_editor				= false,

	max_speed_mul 			= 0.2,
	hull_resist_add			= 30,
	
		
	default_icon			= "ItemSubtype_HellasHull",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.ENGINEER,
	required_ship	= "Ship_Race3_L_T5_Hellas",
}	

Def.Module_BarkArmor = -- Armor Bark
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.BarkArmor,
	in_editor				= false,
	
	hull_resist_add 			= 20,
	
		
	default_icon			= "ItemSubtype_BarkArmor",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race1_M_T5_Bark",
}	

Def.Module_BarkCPU = --CPU_MOD Bark
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.BarkCPU,
	in_editor				= false,
	
	spell_on_special_activate  = "Spell_MissileReloadBark",	
	cooldown		= 180,
	show_cooldown_status = true,
	
	crit_chance_add				= 0.05,
	
	default_icon			= "ItemSubtype_BarkCPU",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race1_M_T5_Bark",
}

Def.Module_Starpain = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.AthlantaCone,

	model = "models/modules/m_active/elidium_modules/crystal_rage_mode",
	activate_module_effect = "particles/gadget/default_module_work",

	trigger_aura			= true,
	cooldown				= 40,

	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,	

	spell 					= "Spell_AtlantaStarpain",
	--additional_spell		= "Spell_GG_Pulsar",
	activate_sound 			= "sound/destroyer/TRay_fire",
	
	default_icon	= "ItemSubtype_Starpain",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
}

Def.Module_Nemesis = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.AthlantaCone,

	model = "models/modules/m_active/elidium_modules/crystal_rage_mode",
	activate_module_effect = "particles/gadget/default_module_work",

	trigger_aura			= true,
	cooldown				= 40,
	
	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,

	spell 					= "Spell_AtlantaNemesis",
	--additional_spell		= "Spell_GG_Pulsar",
	activate_sound 			= "sound/destroyer/TRay_fire",
	
	default_icon	= "ItemSubtype_Nemesis",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
}

Def.Module_Thunder = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.AthlantaCone,

	model = "models/modules/m_active/elidium_modules/crystal_rage_mode",
	activate_module_effect = "particles/gadget/default_module_work",

	trigger_aura			= true,
	cooldown				= 40,
	
	check_aim_orientation_angle = 180,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 360,

	spell 					= "Spell_AtlantaThunder",
	--additional_spell		= "Spell_GG_Pulsar",
	activate_sound 			= "sound/destroyer/TRay_fire",
	
	default_icon	= "ItemSubtype_Thunder",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
}

Def.Module_HerConcentration = --CPU_MOD Hercules
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.HerConcentration,
	in_editor				= false,
	
	spell_on_equip  = "Spell_HerConcentration",	
	
	crit_chance_add				= 0.05,
	
	default_icon			= "ItemSubtype_HerConcentration",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	--required_role = ai.ShipRoles.ATTACK,
	--required_ship	= "Ship_Race1_M_T5_Bark",

}

Def.Module_AmberShell = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.AmberShell,

	model = "models/modules/m_active/elidium_modules/crystal_rage_mode",
	activate_module_effect = "particles/gadget/default_module_work",

	cooldown				= 30,
	
	spell 					= "Spell_AmberShell",

	activate_sound 			= "sound/destroyer/TRay_fire",
	
	default_icon	= "ItemSubtype_AmberShell",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.TACKLER,
	required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.Shell_AmberShell =
{
	class 				= "ScBaseEntity",

	health 				= 500, --
	ttl					= 20,
	damageable			= true,
	network_sync 		= true,

	-- spell_on_ttl		= "Bonus_damage",
	-- effect = "particles/gadget/pshield_1",

	ui_color			= 0xFFFFCCFF,

}

Def.Module_AmberFrontShield =
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.AmberFrontShield,
	
	cooldown	= 20,
	energy_cost = 120,

	activate_entity	= "AmberFrontShield",
	activate_entity_ttl = 15,
	activate_entity_max = 3,
	activate_entity_health = 40000,
	--	attach_bone = "root",
	spawn_offset = Vec3( 0, 0, -32 ),
	spawn_dir_to_aim = true,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.TACKLER,
	required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.AmberFrontShield =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/shields/shield_amber",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	children =
	{
		{ effect		= "particles/gadget/sector_shield_red_start" },
	},
	death_sound		= "sound/explosion/drone_expl",
	death_effect	= "particles/gadget/sector_shield_red_end",
	end_effect		= "particles/gadget/sector_shield_red_end",
	uiName 			= "StaticShield",
	item_subtype 	= ItemSubtype.Screen,
	show_after 		= 0.2,
	radar_vison		= ai.ShieldRadarVisionMode.PASS,
	weapon_mode		= ai.ShieldWeaponMode.BLOCK_ENEMY,

}

Def.Module_AmberShield = --Щит Амбер
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "SHIELD_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.AmberShield,
	in_editor				= false,
	
	spell_on_no_firing		= "Spell_AmberShield",
	cooldown				= 8,
	
	default_icon			= "",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.TACKLER,
	required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.Module_AmberCPU = --CPU Amber
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.AmberCPU,
	in_editor				= false,

	lock_time_mul			= -1,
	spell_on_module_activate = "Spell_AmberCPU",
	
	cooldown				= 40,
	show_cooldown_status	= true,
	
	default_icon			= "",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.TACKLER,
	required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.Module_AthlantaSoulOvercharge = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.AthlantaSoul,

	model = "models/modules/m_active/elidium_modules/crystal_rage_mode",
	activate_module_effect = "particles/gadget/default_module_work",

	cooldown				= 40,
	
	spell 					= "Spell_AthlantaSoulOvercharge",

	activate_sound 			= "sound/destroyer/TRay_fire",
	
	default_icon	= "ItemSubtype_AthlantaSoulOvercharge",
	uiName 			= "Module_AthlantaSoulOvercharge",
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	-- class_mask=ai.ShipClass.MEDIUM,
	-- required_role = ai.ShipRoles.TACKLER,
	-- required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.Projectile_AthlantaSoulOvercharge =
{
	inherit						= "Weapon_BaseRocket",
	
	-- explosion_blast_wave 		= "Blastwave_DroneScavenger",
	-- override_blast_wave_damage 	= true,
	
	--detonation_radius			= 4,
	
	speed					= 60, -- из модуля
	max_range				= 300,
	angular_velocity			= 180,
	is_guided					= true,
	use_pathfinder 				= true,
	--max_range					= 300, -- из модуля должно
	model						= "models/objects/green_drones/dron_engineer",
	
	spell					= "Spell_AthlantaSoul_Overcharge",
	
	missile_defence_immune		= true,
	missile_detection_immune	= true,


	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	work_sound			= "sound/el_modules/DroneScavenger_fly",
	children = 
	{
		{ effect = "particles/gadget/athlanta_overcharge_missile", joint = "fx1" },
	},	
}

Def.Module_AthlantaSoulStealth = 
{
	inherit				= "Module_AthlantaSoulOvercharge",
	spell 					= "Spell_AthlantaSoulStealth",
	default_icon	= "ItemSubtype_AthlantaSoulStealth",
	uiName 			= "Module_AthlantaSoulStealth",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
}	

Def.Projectile_AthlantaSoulStealth =
{
	inherit						= "Projectile_AthlantaSoulOvercharge",
	spell					= "Spell_AthlantaSoul_Stealth",
	
	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	work_sound			= "sound/el_modules/DroneScavenger_fly",
	children = 
	{
		{ effect = "particles/gadget/athlanta_stealth_missile", joint = "fx1" },
	},	
}	

Def.Module_AthlantaSoulInvul = 
{
	inherit				= "Module_AthlantaSoulOvercharge",
	spell 					= "Spell_AthlantaSoulInvul",
	default_icon	= "ItemSubtype_AthlantaSoulInvul",
	uiName 			= "Module_AthlantaSoulInvul",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
}	

Def.Projectile_AthlantaSoulInvul =
{
	inherit						= "Projectile_AthlantaSoulOvercharge",
	spell					= "Spell_AthlantaSoul_Invul",
	
	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	work_sound			= "sound/el_modules/DroneScavenger_fly",
	children = 
	{
		{ effect = "particles/gadget/athlanta_invul_missile", joint = "fx1" },
	},	
}	

Def.Module_CinquedeaBlackout = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.CinquedeaBlackout,

	
	cooldown			= 30.0,
	energy_cost 		= 120.0,
	energy_cost_per_second = 40.0,
	trigger_aura		= true,
	
	spell				= "Spell_CinquedeaBlackout",
	additional_spell	= "Spell_CinquedeaBlackout2",
	
	
	activate_sound 				= "sound/gadgets/ProtectiveShield/ps",
	deactivate_sound	= "sound/gadgets2/PsiloiStarSail_deactivate",

	default_icon		= "ItemSubtype_CinquedeaBlackout",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	-- class_mask=ai.ShipClass.SMALL,
	-- required_role = ai.ShipRoles.ECM,
	-- required_ship	= "Ship_Race2_S_T5_Cinquedea",

}

Def.Module_CinquedeaEng = --Engine Cinquedea
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.CinquedeaEng,
	in_editor				= false,

	strafe_speed_mul		= 0.2,
	strafe_accel_mul 		= 0.35,

		
	default_icon			= "ItemSubtype_CinquedeaEng",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.ECM,
	required_ship	= "Ship_Race2_S_T5_Cinquedea",
}	

Def.Module_CinquedeaCap = --CAPACITOR Cinquedea
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.CinquedeaCap,
	in_editor				= false,
	
	shield_regen_mul 			= 0.2,
	damage_mul				= 0.15,
		
	default_icon			= "ItemSubtype_CinquedeaCap",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.ECM,
	required_ship	= "Ship_Race2_S_T5_Cinquedea",
}	

Def.Module_AtlantaCPU_emp = --CPU Amber
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.AtlantaCPU,
	in_editor				= false,

	crit_chance_add			= 0.05,
	spell_on_special_activate = "Spell_AtlantaCPU_emp",
	
	cooldown				= 40,
	show_cooldown_status	= true,
	
	default_icon			= "ItemSubtype_AtlantaCPU_emp",
	uiName					= "Module_AtlantaCPU_emp_T5_Mk1_Name",
	uiDesc					= "Module_AtlantaCPU_emp_T5_Mk1_Desc",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	-- class_mask=ai.ShipClass.MEDIUM,
	-- required_role = ai.ShipRoles.TACKLER,
	-- required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.Module_AtlantaCPU_thermal = --CPU Amber
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.AtlantaCPU,
	in_editor				= false,

	crit_chance_add			= 0.05,
	spell_on_special_activate = "Spell_AtlantaCPU_thermal",
	
	cooldown				= 40,
	show_cooldown_status	= true,
	
	default_icon			= "ItemSubtype_AtlantaCPU_thermal",
	uiName					= "Module_AtlantaCPU_thermal_T5_Mk1_Name",
	uiDesc					= "Module_AtlantaCPU_thermal_T5_Mk1_Desc",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	-- class_mask=ai.ShipClass.MEDIUM,
	-- required_role = ai.ShipRoles.TACKLER,
	-- required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.Module_AtlantaCPU_kinet = --CPU Amber
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.AtlantaCPU,
	in_editor				= false,

	crit_chance_add			= 0.05,
	spell_on_special_activate = "Spell_AtlantaCPU_kinet",
	
	cooldown				= 40,
	show_cooldown_status	= true,
	
	default_icon			= "ItemSubtype_AtlantaCPU_kinet",
	uiName					= "Module_AtlantaCPU_kinet_T5_Mk1_Name",
	uiDesc					= "Module_AtlantaCPU_kinet_T5_Mk1_Desc",		
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	-- class_mask=ai.ShipClass.MEDIUM,
	-- required_role = ai.ShipRoles.TACKLER,
	-- required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.Module_atmodebuf =
{
	class 				= "SpaceShipModule",
	in_editor			= false,
	spell_on_equip 		= "Kukan",
	item_subtype		= ItemSubtype.atmodebuf,
	--aura_target_offset 	= Vec3( 0, 0, -10 ),  #70073
}

Def.Module_AceFrost = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.CinquedeaBlackout,

	
	cooldown			= 30.0,
	energy_cost 		= 120.0,
	energy_cost_per_second = 40.0,
	trigger_aura		= true,
	
	spell				= "Spell_AceFrost_Cast",

	activate_sound 				= "sound/gadgets/ProtectiveShield/ps",
	deactivate_sound	= "sound/gadgets2/PsiloiStarSail_deactivate",

	default_icon		= "ItemSubtype_CinquedeaBlackout",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	 class_mask=ai.ShipClass.SMALL,
	 required_role = ai.ShipRoles.RECON,
	 required_ship	= "Ship_Race5_S_T5_Ace",

}


Def.Module_AceFreezeMine =
{
	class 					= "FiringModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.AceFreezeMine,

	acceleration_time = 2,
	ammo = 10,
	shoot_mode = ai.FiringModuleShootMode.VOLLEY, --#83218
	volley_size = 1,

	cooldown = 35,
	crit_chance = 0,
	damage_thermal = 0,
	dispersion = 0,
	fire_rate = 105,
	
	energy_cost = 100,

	projectile = "Projectile_AceFreezeMine",
	projectile_speed = 10,
	max_range				= 1,
	
	track = ai.TrackMode.OFFSET,--ai.TrackMode.AIM,
	track_offset = Vec3( 0, 0, -1000 ),
	
	spell	= "Spell_AceFreezeMine", -- FiringModule не кастует спелл, он здесь для тултипа
	
	--additional_spell = "WolfhoundOvercharge",
	
	--muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius = 10,
	muzzleflash_time = 1,
	
	--shot_effect = "particles/weapons/destroyer_rocket_start",
	shot_once_sound = "sound/destroyer/RocketSilo_launch",
	
	default_icon		= "ItemSubtype_AceFreezeMine",	
	-- Cybersport restrictions
	ods_export		= true,
	storeItemId		= 1,
	tier			= 5,
	item_lvl		= 23,
	rank_min		= 1,
	rank_max		= 17,
	premiumPrice	= 99999,
	cant_be_bought	= true,
	
	 class_mask=ai.ShipClass.SMALL,
	 required_role = ai.ShipRoles.RECON,
	 required_ship	= "Ship_Race5_S_T5_Ace",
}

Def.Projectile_AceFreezeMine =
{
	inherit				= "Weapon_BaseRocket",
	model 			= "",
	explosion_blast_wave = "",
	override_blast_wave_damage = true,

	death_entity			= "AceFreezeMine_minefield",

	detonation_radius	= 8,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	--effect 				= "particles/weapons/missile/rocket_trail_small",
	is_guided 			= false,
	-- random_trajectory	=  true,
}

Def.AceFreezeMine_minefield =
{
	max_mines			= 2,

	time_to_live		= 20,
	period				= 0.3,
	repeat_period 		= 0.3,
	holder_size			= 6,
	field_radius			= 45,

	use_team_skin		= true,
	class				= "Minefield",
	stacks				= false,
	default_icon		= "ItemSubtype_AceFreezeMine",
	explosion_blast_wave= "BlastWave_AceFreezeMine",
	
	spell 					= "Spell_AceFreezeMine",
	
	effect = "particles/explosions/persei_gun_mine_explosion", --SE
	light_color = "255 218 185 200",
	light_radius = 20,
	light_time = "0.4",
	
	uiName					= "AceFreezeMine_minefield",

	launch_sound = "sound/gadgets/FrigateDrone/fd_launch",
	shot_effect_s1 			= "particles/weapons/mine_deploy_friendly",
	work_effect_s1 			= "particles/weapons/gun_minefield_friendly",
	shot_effect_s2 			= "particles/weapons/mine_deploy",
	work_effect_s2 			= "particles/weapons/gun_minefield",
	death_sound			= "sound/explosion/drone_expl",
	ui_color			= 0xFFEEFFCC,
}

Def.BlastWave_AceFreezeMine =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 800,
	blast_maxDistance		= 20,
	apply_damage			= true,
	self_damage_coef		= 0,
	intensity				= false,
	apply_shake				= false,
	
	effect 					= "particles/weapons/katana_minelayer/explosion_violet",
	light_color 			= "160 232 255 128",
	light_radius 			= 10,
	light_time 				= 0.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}

Def.Module_AceCPU = --CPU ACE
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.AceCPU,
	in_editor				= false,

	crit_damage_add			= 1,
	crit_chance_add			= -0.2,
	damage_mul				= -0.2,
	
	default_icon			= "ItemSubtype_AceCPU",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	 class_mask=ai.ShipClass.SMALL,
	 required_role = ai.ShipRoles.RECON,
	 required_ship	= "Ship_Race5_S_T5_Ace",
}

Def.Module_AceEngine = --ENGINE ACE
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.AceEngine,
	in_editor				= false,

	--max_speed_mul			= 0.2,
	spell_on_max_speed_plus = "Spell_AceEngine",
	max_speed_percent		 = 1.01,
	
	
	default_icon			= "ItemSubtype_AceEngine",
	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	 class_mask=ai.ShipClass.SMALL,
	 required_role = ai.ShipRoles.RECON,
	 required_ship	= "Ship_Race5_S_T5_Ace",
}

Def.Module_CarolDeadShot =
{
	class 					= "FiringModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.CarolDeadShot,

	acceleration_time = 2,
	--ammo = 1,
	shoot_mode = ai.FiringModuleShootMode.SINGLE_SHOT, --#83218
	volley_size = 1,
	 barrel_rot_speed = 360,
	 check_aim_orientation_angle = 180,

	cooldown = 12,
	energy_cost = 300,
	crit_chance = 0,
	damage_thermal = 5000,
	dispersion = 0,

	fire_rate = 90,
	max_range = 800,
	-- stop_barrels = 1,
	-- target_cone_angle = 60,
	projectile = "Projectile_CarolDeadShot",
	projectile_speed = 800,
	track = ai.TrackMode.AIM, 
	
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius = 10,
	muzzleflash_time = 1,
	shot_effect = "particles/weapons/destroyer_rocket_start",
	shot_once_sound = "sound/destroyer/RocketSilo_launch",
	
	additional_spell	= "Spell_CarolDeadShot",
	
	-- Cybersport restrictions
	ods_export		= true,
	storeItemId		= 1,
	tier			= 5,
	item_lvl		= 23,
	rank_min		= 1,
	rank_max		= 17,
	premiumPrice	= 99999,
	cant_be_bought	= true,
}

Def.Projectile_CarolDeadShot =
{
	inherit				= "Weapon_BaseRocket",
	model 			= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave = "Blastwave_CarolDeadShot",
	override_blast_wave_damage = true,

	detonation_radius	= 8,

	--angular_velocity	= 32.5,--50,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_small",
	is_guided 			= false,
	-- random_trajectory	=  true,
}

Def.Blastwave_CarolDeadShot =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 20,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= true,
	
	effect = "particles/explosions/big_fire_2",
	light_color 		= "255 160 80 100",
	light_radius 		= 12,
	light_time 			= 0.5,
	sound 				= "sound/explosion/small_rocket_expl",
}

Def.Module_CarolShield = --Carolingian shield
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "SHIELD_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.CarolShield,
	in_editor				= false,

	spell_on_equip		=	"Spell_CarolShield",
	shield_resist_emp_add		= -10,
	shield_resist_kinetic_add	= -10,
	shield_resist_thermal_add	= -10,
	
	default_icon			= "ItemSubtype_CarolShield",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	 class_mask=ai.ShipClass.LARGE,
	 required_role = ai.ShipRoles.SNIPER,
	 required_ship	= "Ship_Race2_L_T5_Carolingian",
}

Def.Module_CarolHull = --Carolingian armor
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.CarolHull,
	in_editor				= false,

	spell_on_max_health_minus		=	"Spell_CarolHull",
	max_health_percent				= 	0.7,
	
	default_icon			= "ItemSubtype_CarolHull",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	 class_mask=ai.ShipClass.LARGE,
	 required_role = ai.ShipRoles.SNIPER,
	 required_ship	= "Ship_Race2_L_T5_Carolingian",
}

Def.Module_AtlantaCap = -- Capacitor Atlanta
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.AtlantaCap,
	in_editor				= false,


	spell_on_max_energy_minus = "Spell_AtlantaCap",
	max_energy_percent		= 0.7,

	
	
	default_icon			= "ItemSubtype_AtlantaCPU_kinet",
	--uiName					= "Module_AtlantaCPU_kinet_T5_Mk1_Name",
	--uiDesc					= "Module_AtlantaCPU_kinet_T5_Mk1_Desc",		
	
	-- ods_export				= true,
	-- storeItemId				= 1,
	-- cant_be_bought			= true,
	-- premiumPrice			= 999999,
	-- tier					= 5,	
	-- item_lvl				= 25,
	-- in_editor				= false,
	-- rank_min				= 1,
	-- rank_max				= 17,
	-- class_mask=ai.ShipClass.MEDIUM,
	-- required_role = ai.ShipRoles.TACKLER,
	-- required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.Module_AtlantaCapWeap = -- Capacitor Atlanta
{
	inherit 		= "Module_AtlantaCap",	
	uiName					= "Module_AtlantaCapWeap_T5_Epic_Name",
	uiDesc					= "Module_AtlantaCapWeap_T5_Epic_Desc",	
}

Def.Module_AtlantaCapRocket = -- Capacitor Atlanta
{
	inherit 		= "Module_AtlantaCap",	
	uiName					= "Module_AtlantaCapRocket_T5_Epic_Name",
	uiDesc					= "Module_AtlantaCapRocket_T5_Epic_Desc",	
}

Def.Module_AtlantaCapModuleDmg = -- Capacitor Atlanta
{
	inherit 		= "Module_AtlantaCap",	
	uiName					= "Module_AtlantaCapModuleDmg_T5_Epic_Name",
	uiDesc					= "Module_AtlantaCapModuleDmg_T5_Epic_Desc",	
}

Def.Module_GlassAttraction =
{
	--inherit 			= "Weapon_Base",
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	class				= "FiringModule",
	
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.GlassAttraction,

	cooldown			= 10,
	energy_cost 		= 100.0,

	projectile 			= "Projectile_GlassAttraction",
	projectile_speed 	= 300,  -- 5 секунд лета
	max_range			= 700,  -- 5 секунд лета
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,

	dispersion			= 0,
	crit_chance			= 0,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 6000,
	damage_thermal		= 0,
	-- trigger_projectile	= true, --детонировать заряд при повторном нажатии модуля --#83218 теперь используется поле shoot_mode
	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
	default_icon			= "ItemSubtype_GlassAttraction",	

}

Def.Projectile_GlassAttraction =
{
	inherit				= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave = "Blastwave_GlassAttraction",
	override_blast_wave_damage = true,

	spell 				= "Spell_GlassAttraction",

	detonation_radius	= 1,

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_mid",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
}

Def.Blastwave_GlassAttraction = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 5,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 60,
	self_damage_coef	= 0,
	
	--damage_emp			= 5000,
	
	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	effect 				= "particles/explosions/explosion_big2_emp",
	light_color 		= "140 190 255 100",
	light_radius 		= 40,
	light_time 			= 0.5,
	sound 				= "sound/explosion/big_rocket_expl",
}

Def.Module_GlassArmor =
{
	class 				= "SpaceShipModule",
	in_editor			= false,
	spell_on_equip 		= "Spell_GlassArmor",
	item_subtype		= ItemSubtype.GlassArmor,
	--aura_target_offset 	= Vec3( 0, 0, -10 ),  #70073
}

Def.Module_UBallDeathRay =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.UBallDeathRay,

	energy_cost				= 60,
	energy_cost_additional	= 0.50,
	param_modificator 		= 0.27,

	cooldown				= 10,
	spell					= "Spell_DeathRay",
	--additional_spell 		= "Spell_EnergyReflector",

	check_aim_orientation_angle = 360,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 1000,

	check_aim_orientation 	= true,

	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/destroyer/TRay_fire",
	default_icon			= "ItemSubtype_UBallDeathRay",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race5_M_T5_Apeiron",
}

Def.Module_UballRocketRing  =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	module_type		= ai.ModuleType.ACTIVE,
	class				= "FiringModule",
	item_subtype			= ItemSubtype.UballRocketRing,

	cooldown			= 40,
	energy_cost 		= 10.0,

	projectile 			= "Projectile_UBallRocketRing",
	
	projectile_speed 	= 200,  
	max_range			= 1,  
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,

	dispersion			= 0,
	crit_chance			= 0,

	damage				= 0,
	damage_kinetic		= 500,
	damage_emp			= 0,
	damage_thermal		= 0,
	
	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, 
	detonate_at_point 	= true,

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
	
	default_icon			= "ItemSubtype_UballRocketRing",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race5_M_T5_Apeiron",
}
Def.Projectile_UBallRocketRing =
{
	inherit				= "Weapon_BaseRocket",

	override_blast_wave_damage = true,
	missile_defence_immune = true,	
	missile_detection_immune = true,

	child_rockets =
	{
	    rocket = "Projectile_UBallRocketRing1",

	    sphere_radius = 3, -- опционально
	    
	    -- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
	    -- Общее количество ракет не должно превышать 20
	    scheme = {
	        circle0 = { amount = 6, angle = 90, },
	        --circle1 = { amount = 3, angle = 7, }, -- опционально
	        circle1 = { amount = 6, angle = 90, }, -- опционально
	        --circle3 = { amount = 6, angle = 120, }, -- опционально
	    },

	    --описание целей для управляемых ракет. Поддерживается не более 10 целей
	    direct_to_target = {
			target	= ai.SpellTargetGeneral.LOCKED_TARGET,
	        class = ai.SpellTargetClass.SHIP,
	        area = ai.SpellTargetArea.AROUND,
	        relationship = ai.SpellTargetRelationship.ENEMY,
	    },
	    direct_range = 400, -- радиус поиска целей для управляемых ракет
	    max_rockets_per_target = 12, -- количество управляемых ракет на одну цель
	    
	},

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_mid",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
}
Def.Projectile_UBallRocketRing1 =
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_RocketRingFinal",
	model				= "models/weapons/bs_torpedo_small",
	override_blast_wave_damage = true,
	detonation_radius	= 10,
	--projectile_speed 	= 300,  
	max_range			= 500,  
	speed 				= 90,
	angular_velocity 	= 90,
	is_guided 			= true,
	
	missile_defence_immune = false,
	missile_detection_immune = false,
	
	
	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "plasma",
}

Def.Blastwave_RocketRingFinal = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 3,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 15,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	--damage_kinetic 		= 100,

	effect = "particles/explosions/expl_1_energy",
	light_color = "140 140 240 100",
	light_radius = 15,
	light_time = 0.8,
	sound 				= "sound/explosion/big_rocket_expl",
}

Def.Module_UballShield = -- Apeiron shield
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "SHIELD_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.UballShield,
	in_editor				= false,

	--spell_on_equip				= "Spell_UballShield",
	spell_on_max_shield_minus		=	"Spell_UballShield",
	max_shield_percent			=	0.15,
	
	cooldown					= 40,
	show_cooldown_status		= true,
	max_shield_spell_cancel = false,
	
	unique_equip			= true,
	hide_diminishing_string = true,	
	
	default_icon			= "ItemSubtype_UballShield",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race5_M_T5_Apeiron",
}

Def.Module_UballHull = --Apeiron armor
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.UballHull,
	in_editor				= false,

	decel_afterburning_mul	= 1,
	boost_accel_coef_mul 		= 1,
	--accel_mul				= 1,
	--reverse_accel_mul		= 1,
	
	default_icon			= "ItemSubtype_UballHull",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race5_M_T5_Apeiron",
}

Def.Module_SaturnBubbleGum =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.SaturnBubbleGum,

	energy_cost				= 60,
	cooldown				= 10,

	spell					= "Spell_SaturnBubbleGum",

	-- check_aim_orientation_angle = 360,
	-- track 					= ai.TrackMode.AIM,
	-- barrel_rot_speed 		= 1000,

	check_aim_orientation 	= true,

	model 					= "models/modules/m_active/module_destroyerring/module_destroyerring",
	
	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 2000*2.6, --500
	health_regen 	= 35*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 6000,
	module_death_effect 	= "particles/explosions/huge_capacitor_expl_hemisphere",

	death_wreck  	= "Module_Wreck",	
	
	activate_sound 			= "sound/destroyer/TRay_fire",
	default_icon			= "ItemSubtype_SaturnBubbleGum",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,
	--required_ship	= "Ship_Race5_HUGE_SATURN_Rank9",
}

Def.Blastwave_SaturnBubbleGum = 
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 50,
	class = "BlastWave",
	damage_emp = 5,
	
	self_damage_coef = 0,
	effect = "particles/explosions/explosion_huge_emp",
	in_editor = false,
	light_color = "140 240 140 100",
	light_radius = 15,
	light_time = 0.9,
	sound 	= "sound/explosion/emi_mine_explosion",
}

Def.Module_SaturnMine =
{
	class 					= "FiringModule",
	in_editor 				= false,
	module_type		= ai.ModuleType.ACTIVE,
	item_subtype			= ItemSubtype.SaturnMine,
	
	projectile 			= "Projectile_SaturnMine",
	projectile_speed 	= 0,
	
	track 				= ai.TrackMode.AIM,
	check_aim_orientation_angle = 360,
	barrel_rot_speed 	= 360,

	energy_cost				= 2000,
	cooldown				= 40,

	fire_rate 			= 1,
	dispersion			= 0,
	
	damage_thermal		= 12000,	
	
	projectile_speed 	= 1,  
	max_range			= 4,

	--spell					= "Spell_SaturnMine",

	check_aim_orientation 	= true,

	model 					= "models/modules/m_active/module_destroyerring/module_destroyerring",
	
	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 8000, --500
	health_regen 	= 133.333,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 6000,
	module_death_effect 	= "particles/explosions/huge_capacitor_expl_hemisphere",

	death_wreck  	= "Module_Wreck",	
	
	activate_sound 			= "sound/destroyer/TRay_fire",
	default_icon			= "ItemSubtype_SaturnMine",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,
	--required_ship	= "Ship_Race5_HUGE_SATURN_Rank9",
}

Def.Projectile_SaturnMine =
{
	inherit 				= "Weapon_BaseRocket",

	--spell_on_launch			= "Spell_CrystalSpitBase",	
	spell 					= "Spell_SaturnMine",

	--ttl	= 4,

	missile_defence_immune = true,
	missile_detection_immune = false,
	
	explosion_blast_wave	= "Blastwave_SaturnMine",

	flare_color				= "255 170 191 0",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,

	work_sound 			= "sound/weapons/mine/emi_mine_idle",
	model				= "models/modules/cloaking_field_generator/cloaking_field_generator",
	impact_type 			= "rocket",
}


Def.Blastwave_SaturnMine =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 12000,

	blast_maxDistance	= 55,
	apply_damage		= true,
	apply_shake 		= false,
	apply_torque 			= false,
	self_damage_coef	= 0,

	effect 				= "particles/explosions/explosion_huge_emp",
	light_color 		= "102 180 255 255",
	light_radius 		= 500,
	light_time 			= 0.8,
	sound 				= "sound/explosion/chargegun_expl",
}

Def.Module_SaturnHull = --Saturn armor
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.SaturnHull,
	in_editor				= false,

	spell_on_no_firing		= "Spell_SaturnHull",
	cooldown				= 8,
	
	default_icon			= "ItemSubtype_SaturnHull",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,
	--required_ship	= "Ship_Race5_M_T5_Apeiron",
}

Def.Module_SaturnEngine = -- скорость и повороты при активации см
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.SaturnEngine,
	in_editor	= false,
	
	-- rot_speed_mul			= 0.1,
	-- max_speed_mul	 		= 0.1,
		
	-- spell_on_equip			= "Spell_SaturnEngineOnEquip",	
	spell_on_special_activate = "Spell_SaturnEngine",	
	--cooldown				= 30,
	--show_cooldown_status	= true,
		
	default_icon			= "ItemSubtype_SaturnEngine",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,
	--required_ship	= "Ship_Race1_S_T5_Psiloi",
}

Def.Module_CorV2_TPAlly = 
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.CorV2_TPAlly,

	
	cooldown			= 100.0,
	energy_cost 		= 120.0,
	
	spell				= "Spell_CorV2_TpPrep",
	additional_spell	= "Spell_CorV2_Teleport1",

	
	--activate_sound 				= "sound/gadgets/ProtectiveShield/ps",
	deactivate_sound	= "sound/gadgets2/PsiloiStarSail_deactivate",

	default_icon		= "ItemSubtype_CorV2_TPAlly",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
	required_ship	= "Ship_Race1_S_T5_CorLegibus",	
}

-- 

Def.Module_CorV2CPU = --CorV2 CPU
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.CorV2CPU,
	in_editor				= false,

	
	spell_on_kill			= "Spell_CorV2CPU",
	
	default_icon			= "ItemSubtype_CorV2CPU",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
	required_ship	= "Ship_Race1_S_T5_CorLegibus",	
}

Def.Module_CorV2Cap = --CorV2 Capacitor
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.CorV2Cap,
	in_editor				= false,
	
	spell_on_max_shield_minus	= "Spell_CorV2Cap_shield",
	max_shield_percent			= 0.2,
	spell_on_max_health_minus	= "Spell_CorV2Cap_hull",
	max_health_percent			= 0.5,
	
	
	default_icon			= "ItemSubtype_CorV2Cap",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
	required_ship	= "Ship_Race1_S_T5_CorLegibus",	
}

Def.Module_AthlantaDroneS =
{
	class					= "ActiveModule",
	module_type				= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.AthlantaDroneS,


	cooldown				= 1.0,
	energy_cost				= 10.0,
	--energy_cost_per_second	= 25.0,

	activate_effect			= "",
	activate_module_effect	= "",

	activate_entity			= "AthlantaDroneS",
	activate_entity_health 	= 6000,
	activate_entity_ttl		= 50,
	spawn_offset 			= Vec3( 0, -5, 4 ),
	check_spawn_collision 	= true,

	-- drone parameters
	max_speed				= 0, --45,
	acceleration 			= 0,
	max_rot_speed			= 120,	-- deg per second
	max_aim_rot_speed		= 60,

	fire_rate				= 120,
	dispersion				= 0.25,
	optimal_range			= 200,
	max_range				= 200,

	projectile_speed		= 1200,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 600,
	
	default_icon			= "ItemSubtype_AthlantaDroneS",		
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	-- required_role = ai.ShipRoles.SCOUT,
	-- required_ship	= "Ship_Race1_S_T5_CorLegibus",		
}


--
Def.AthlantaDroneS =
{
	class					= "GuidedDrone",
	in_editor				= false,

	model					= "models/weapons/drones/sentry_drone/sentry_drone",
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },

	damageable				= true,

	signature				= ai.Signature.SMALL,
	
	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound				= "sound/explosion/drone_expl",

	projectile				= "Projectile_SentryDron",
	shot_effect 			= "particles/weapons/drongun/muzzle",
	
	active_spell			= 'Spell_AthlantaDroneS',

	shot_once_sound 		= "sound/weapons/turret/turret_oneshot",

	max_speed				= 0,
	max_rot_speed			= 0,	-- deg per second
	max_aim_rot_speed		= 180,
	uiName 					= "SentryDrone_name",
}

Def.Module_AthlantaDroneM =
{
	inherit					= "Module_AthlantaDroneS",
	
	item_subtype			= ItemSubtype.AthlantaDroneM,
	
	damage_kinetic			= 600,
	damage_emp				= 0,
	damage_thermal			= 0,
	
	fire_rate				= 120,	
	
	activate_entity			= "AthlantaDroneM",	
	
	default_icon			= "ItemSubtype_AthlantaDroneM",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,	
	class_mask				= ai.ShipClass.MEDIUM,		
}	

Def.AthlantaDroneM =
{
	inherit					= "AthlantaDroneS",
	active_spell			= 'Spell_AthlantaDroneM',

	projectile				= "Projectile_BasicRailgunPirate",
	shot_effect = "particles/weapons/railgun/muzzle_axe",
	shot_once_sound = "sound/weapons/railgun/basic",
}	

Def.Module_AthlantaDroneL =
{
	inherit					= "Module_AthlantaDroneS",
	
	item_subtype			= ItemSubtype.AthlantaDroneL,
	
	damage_kinetic			= 0,
	damage_emp				= 600,
	damage_thermal			= 0,	
	
	activate_entity			= "AthlantaDroneL",	
	
	default_icon			= "ItemSubtype_AthlantaDroneL",	

	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,	
	class_mask				= ai.ShipClass.LARGE,		
}	

Def.AthlantaDroneL =
{
	inherit					= "AthlantaDroneS",
	active_spell			= 'Spell_AthlantaDroneL',
	
	projectile				= "Projectile_HeavyPlasma",
	shot_effect 			= "", --"particles/weapons/drongun/muzzle",	
	shot_once_sound = "sound/weapons/plasmagun/basic",	
}	

Def.Module_GRCrystallEmission =
{
	class					= "ActiveModule",
	module_type				= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.GRCrystallEmission,

	hull_cost				= 10,

	cooldown				= 30,
	spell					= "Spell_GRCrystallEmissionPeriod",
	--additional_spell		= "Spell_GRCrystallEmissionPeriod2",

	model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/el_modules/fuel_em",
	
	default_icon			= "ItemSubtype_GRCrystallEmission",	

	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	--required_ship	= "Ship_Race1_S_T5_CorLegibus",		
}

Def.Module_GREnergyLance =
{
	class 				= "EnergyLance",
	module_type				= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.GREnergyLance,

	class_mask			= ai.ShipClass.SMALL,

	cooldown			= 8.0,
	energy_cost 		= 60.0,
	work_time			= 4.0,

	damage_box_size		= Vec3( 3.0, 1.0, 10.5 ), -- ширина, высота, вперед

	-- damage per second
	damage_kinetic		= 2500,
	damage_emp			= 2500,
	damage_thermal		= 2500, -- в секунду
	
	spell				= "Spell_GREnergyLance",

	activate_effect = "particles/gadget/spire_alien",
	activate_sound = "sound/gadgets/EnergyLance/el_activation",
	--work_effect			= "",
	--work_sound			= "",
	--activate_effect		= "",
	--activate_module_effect = "",
	--activate_sound		= "",
	
	default_icon			= "ItemSubtype_GREnergyLance",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	--required_ship	= "Ship_Race1_S_T5_CorLegibus",		
}

Def.Module_GRChameleon =
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.GRChameleon,
	
	cooldown			= 40.0,
	energy_cost 		= 120.0,
	hull_cost			= 300,
	hull_cost_per_second = 150,
	
	trigger_aura		= true,
	
	spell				= "Spell_GRChameleon",
	--additional_spell	= "Spell_CorV2_Teleport1",
	
	
	activate_sound 				= "sound/gadgets/ProtectiveShield/ps",
	deactivate_sound	= "sound/gadgets2/PsiloiStarSail_deactivate",

	default_icon		= "ItemSubtype_GRChameleon",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	--required_ship	= "Ship_Race1_S_T5_CorLegibus",	
}

Def.Module_GREmergrncy = --CorV2 Capacitor
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CAPACITOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "CAPACITOR_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.GREmergrncy,
	in_editor				= false,
	
	emergency_barrier_spell = "Spell_GREmergrncy",
	activate_sound = "sound/gadgets/EmergencyBarrier",
	
	cooldown				= 10,
	show_cooldown_status	= true,
	
	default_icon			= "ItemSubtype_GREmergrncy",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	--required_role = ai.ShipRoles.RECON,
	--required_ship	= "Ship_Race1_S_T5_CorLegibus",	
}

Def.GREmergrncyHolder =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= true,
	health 				= 1750,
	--model				= "models/objects/gameplay/bombball/bombball_orbit",
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	signature			=	ai.Signature.TINY,	
	--physics			= { solid_type = solid.box, kinematic = true, hitbox = true,  material = "Metal", mass = 1000, },
	hudType 			= "default",

	uiName 				= "GREmergrncyHolder",
--	uiDesc 				= "Module_SpyBeacon_Desc",

	death_effect			= "particles/explosions/big_fire_2",
	death_sound			= "sound/explosion/drone_expl",
}

Def.Module_GRForceField =  
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.SHIELD_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "SHIELD_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.GRForceField,
	in_editor				= false,

	--spell_on_equip				= "Spell_UballShield",
	focus_spell					= "Spell_GRForceField",
	
	shield_resist_emp_add		= 20,
	shield_resist_kinetic_add	= 20,
	shield_resist_thermal_add	= 20,
	
	unique_equip			= true,
	hide_diminishing_string = true,	
	
	default_icon			= "ItemSubtype_GRForceField",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	-- required_ship	= "Ship_Race5_M_T5_Apeiron",
}

Def.Module_GRJumpDrive = -- скорость и повороты при активации см
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.ENGINE_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "ENGINE_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.GRJumpDrive,
	in_editor	= false,
	
	double_down_spell				= "Spell_GRJumpDriveCast",
	
	show_cooldown_status	= true,
	cooldown				= 40,
	
	default_icon			= "ItemSubtype_GRJumpDrive",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	-- required_ship	= "Ship_Race5_M_T5_Apeiron",
}

Def.Module_GreenReconBoom =
{
    inherit             = "Weapon_Base",
    class               = "FiringModule",
	in_editor			= false,
	module_type				= ai.ModuleType.ACTIVE,
    item_subtype        = ItemSubtype.GreenReconBoom,	
	
    cooldown            = 30, --40
    energy_cost         = 150,
	hull_cost			 = 2000,
 
 

    projectile          = "Projectile_GreenReconBoom",
    projectile_speed    = 300, --600
    optimal_range       = 1000,	--60
    max_range           = 1000,	--200
    track               = ai.TrackMode.AIM,
    barrel_rot_speed    = 360,
	
	damage_kinetic		= 8000,
 
	spell_on_hit 				= "Spell_GreenReconBoom",
    dispersion          = 0,
    crit_chance			= 0,

    shoot_mode          = ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218

	model 				= "models/modules/m_active/spear/spear_gadget",
    shot_once_sound     = "sound/gadgets2/HarpoonGun/hg_shot",
    default_icon        = "ItemSubtype_GreenReconBoom",


	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	-- required_ship	= "Ship_Race5_M_T5_Apeiron",		
}

Def.Projectile_GreenReconBoom =
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_GreenReconBoom",
	model				= "models/weapons/bs_torpedo_small",
	override_blast_wave_damage = true,
	detonation_radius	= 10,
	--projectile_speed 	= 300,  
	max_range			= 250,  
 
	--angular_velocity 	= 120,
	is_guided 			= false,
	
	missile_defence_immune = true,
	missile_detection_immune = true,
	

	
	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "plasma",
}

Def.Blastwave_GreenReconBoom = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 10,
	--constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 35,
	self_damage_coef	= 1,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	--damage_kinetic 		= 100,

	effect = "particles/explosions/explosion_big2_emp",
	light_color = "140 140 240 100",
	light_radius = 30,
	light_time = 0.8,
	sound 				= "sound/explosion/big_rocket_expl",
}


---------------------------------------------------------------------
Def.Module_BallWarp = 
{
	class					= "ActiveModule",
	module_type				= ai.ModuleType.SPECIAL,
	in_editor 				= false,
 	cant_be_bought 				= true,
	item_subtype		= ItemSubtype.BallWarp,

	energy_cost			= 50,
	default_icon		= "ItemSubtype_BallWarp",

	activate_sound 		= "sound/gadgets2/Microwarp_winter_activate",
	
	cooldown			= 30,
	
	spell_on_equip		= "Spell_WarpBall_DriveATTRACT_ONEQUIP",
	spell				= "Spell_WarpBall_Drive1",  -- Spell_WarpBall_Drive1
	additional_spell	= "Spell_WarpBall_DriveATTRACT",
	
	is_fast_movement= true,
}

Def.Module_GlassAttraction_BRAWL =
{
	inherit 			= "Module_GlassAttraction",
	projectile 			= "Projectile_GlassAttraction_BRAWL",	
	
	damage_emp			= 2000,
	default_icon			= "ItemSubtype_GlassAttraction",
	uiName				= "GlassAttractionBRAWL_Name",
}	

Def.Projectile_GlassAttraction_BRAWL =
{
	inherit				= "Projectile_GlassAttraction",
	
	
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 2000,
	damage_thermal		= 0,
	spell 				= "Spell_GlassAttraction_BRAWL",
}	

Def.Module_FakeShipBackstab_BRAWL =
{
	inherit 			= "Module_FakeShipBackstab",
	module_type				= ai.ModuleType.ACTIVE,
	item_subtype 			= ItemSubtype.FakeShipBackstabBRAWL,

	clones_ttl  			= 20,

	spell 					= "Spell_FakeShipBackstab_stealth_BRAWL",
	additional_spell		= "Spell_FakeShipBackstabBRAWL",		
	
	default_icon 			= "ItemSubtype_FakeShipBackstabBRAWL",	
}

Def.Module_Chameleon_BRAWL =
{
	class 					= "ActiveModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.Chameleon,
	
	cooldown			= 40.0,
	energy_cost 		= 120.0,
	
	spell				= "Spell_Chameleon_BRAWL",
	--additional_spell	= "Spell_CorV2_Teleport1",
	
	
	activate_sound 				= "sound/gadgets/ProtectiveShield/ps",
	deactivate_sound	= "sound/gadgets2/PsiloiStarSail_deactivate",

	default_icon		= "ItemSubtype_Chameleon",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	-- class_mask=ai.ShipClass.SMALL,
	-- required_role = ai.ShipRoles.SCOUT,
	-- required_ship	= "Ship_Race1_S_T5_CorLegibus",	
}


Def.Module_StoneShield_BRAWL =
{
	inherit 			= "Weapon_Base",
	item_subtype 			= ItemSubtype.StoneShieldBRAWL,
	
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
 	class				= "FiringModule",

	cooldown			= 20,
	energy_cost 		= 100.0,

	projectile 			= "Projectile_StoneShield_BRAWL",
	projectile_speed 	= 150,  
	max_range			= 30,  
	
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 1200,

	dispersion			= 0,
	crit_chance			= 0,
	
	additional_spell	= "Spell_StoneShield_BRAWL",

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 0,

	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode

	--shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
	
	default_icon		= "ItemSubtype_StoneShield",	
}

Def.Projectile_StoneShield_BRAWL =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/misc/invisible_model",
	override_blast_wave_damage = true,

	--spell 				= "CalibrationGrenade",

	detonation_radius	= 1,
	death_entity		= "StoneShield_BRAWL",	

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/null",
}

Def.StoneShield_BRAWL =
{
	class 				= "ScBaseEntity",
	health 				= 10000, --
	ttl					= 5,
	
	in_editor		= false,
	
	physics				= { solid_type = solid.model, hitbox = false, mass = 100005, material = "Metal", damping = 10.3, rot_damping = 10.3, },
	damageable			= true,
	network_sync 		= true,
	
	hack_immune			= true,
	
	radar_vison		= ai.ShieldRadarVisionMode.BLOCK_ENEMY,
	
	
	model				= "models/weapons/asteroid_helios/asteroid_helios2",
	death_effect		= "particles/explosions/explosion_death_heliroid",
	death_sound			= "sound/explosion/drone_expl",
	ui_color			= 0xFFEEFFCC,
}

Def.Module_FireArrow_BRAWL =
{
	class = "FiringModule",
	module_type = ai.ModuleType.ACTIVE,
	item_subtype = ItemSubtype.FireArrowBRAWL,
	
	acceleration_time = 2,
	ammo = 3,
	shoot_mode = ai.FiringModuleShootMode.VOLLEY, --#83218
	volley_size = 1,
	track = ai.TrackMode.AIM,

	cooldown = 40,
	energy_cost = 100,
	
	crit_chance = 0,
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 2000,
	
	dispersion = 0,
	fire_rate = 90,
	max_range = 2000,

	projectile = "Projectile_FireArrow_BRAWL",
	projectile_speed = 200,
	
	spell_on_hit = "Spell_FireArrowOnHit_BRAWL",
	
	
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius = 10,
	muzzleflash_time = 1,
	
	shot_once_sound = "sound/gadgets2/pilums/pilums_shot",
	default_icon = "ItemSubtype_FireArrow",
}

Def.Projectile_FireArrow_BRAWL =
{
	inherit				= "Weapon_BaseRocket",
	
	model 				= "models/misc/invisible_model",
	death_entity_on_static_hit = "FireArrow_BRAWL",
	explosion_blast_wave = "Blastwave_FireArrow_BRAWL",
	--override_blast_wave_damage = true,
	
	missile_defence_immune 		= true,
	missile_detection_immune 	= true,
	
	detonation_radius	= 12,
	
	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	max_range 			= 350,
	
	work_sound			= "sound/gadgets2/pilums/pilums_arrow_fly",
	is_guided = false,
	
	effect = "particles/events/steel_balls/spear_red_projectile",
}

Def.Blastwave_FireArrow_BRAWL =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 10,
	blast_minDistance	= 5,
	apply_damage		= true,
	apply_shake 		= true,

	effect = "particles/events/steel_balls/spear_red_hit",
	light_color 		= "255 94 79 100",
	light_radius 		= 25,
	light_time 			= 0.5,
	sound 				= "sound/explosion/pilum_expl",
}

Def.FireArrow_BRAWL =
{
	class = "AuraHolderTrigger",

	radius = 50,
	density = 0.75,
	model = "models/misc/invisible_model",
	spell = "Spell_FireArrow_BRAWL",
	effect = "particles/events/steel_balls/spear_red_spell",
}

Def.Module_FreezingArrow_BRAWL =
{
	inherit				= "Module_FireArrow_BRAWL",
	item_subtype = ItemSubtype.FreezingArrowBRAWL,
	
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 1000,
	damage_thermal		= 0,
	
	projectile = "Projectile_FreezingArrow_BRAWL",

	spell_on_hit = "Spell_FreezingArrowOnHit_BRAWL",

	default_icon = "ItemSubtype_FreezingArrow",	
}

Def.Projectile_FreezingArrow_BRAWL =
{
	inherit				= "Projectile_FireArrow_BRAWL",
	death_entity_on_static_hit = "FreezingArrow_BRAWL",

	explosion_blast_wave = "Blastwave_FreezingArrow_BRAWL",

	effect = "particles/events/steel_balls/spear_blue_projectile",
}

Def.Blastwave_FreezingArrow_BRAWL =
{
	inherit				= "Blastwave_FireArrow_BRAWL",
	in_editor			= false,
	light_color 		= "79 195 255 100",
	effect = "particles/events/steel_balls/spear_blue_hit",

}

Def.FreezingArrow_BRAWL =
{
	inherit				= "FireArrow_BRAWL",

	model = "models/misc/invisible_model",
	spell = "Spell_FreezingArrowStatic_BRAWL",
	effect = "particles/events/steel_balls/spear_blue_spell",
}

Def.Module_HealArrow_BRAWL =
{
	inherit				= "Module_FireArrow_BRAWL",
	item_subtype = ItemSubtype.HealArrowBRAWL,
	
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 1000,
	
	projectile = "Projectile_HealArrow_BRAWL",

	spell_on_hit = "Spell_HealArrowOnHit_BRAWL",

	default_icon = "ItemSubtype_HealArrow",		
}

Def.Projectile_HealArrow_BRAWL =
{
	inherit				= "Projectile_FireArrow_BRAWL",
	death_entity_on_static_hit = "HealArrow_BRAWL",

	explosion_blast_wave = "Blastwave_HealArrow_BRAWL",

	effect = "particles/events/steel_balls/spear_green_projectile",
}

Def.Blastwave_HealArrow_BRAWL =
{
	inherit				= "Blastwave_FireArrow_BRAWL",
	in_editor			= false,
	light_color 		= "162 255 79 100",
	effect = "particles/events/steel_balls/spear_green_hit",

}

Def.HealArrow_BRAWL =
{
	inherit				= "FireArrow_BRAWL",

	model = "models/misc/invisible_model",
	spell = "Spell_HealArrowStatic_BRAWL",
	effect = "particles/events/steel_balls/spear_green_spell",
}


------------------------------------------------------ END BRAWL

Def.Module_ChaosFreeFly =
{
	class 					= "PhaseModule",
	module_type		= ai.ModuleType.ACTIVE,
	in_editor 				= false,
	item_subtype			= ItemSubtype.ChaosFreeFly,
	
	cooldown			= 0.3,
	energy_cost 		= 120.0,
	energy_cost_per_second = 100,
	
	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",

	--spell				= "CoupleSupport_",
	spell0 				= "Spell_ChaosFreeFlyDMG",
	spell1				= "Spell_ChaosFreeFlySpeed",
	--spell2 				= "Spell_ChaosFreeFlySpeed",
	
	
	default_icon		= "ItemSubtype_ChaosFreeFlySpeed",
	ui_ico_0			= { target_system = { tex = "ItemSubtype_ChaosFreeFlySpeed", }, },
	ui_ico_1			= { target_system = { tex = "ItemSubtype_ChaosFreeFlyDMG", }, },
	--ui_ico_2			= { target_system = { tex = "ItemSubtype_ChaosFreeFlyDMG", }, },

	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race1_M_T5_Chaos",	
}

Def.Module_ChaosHull = -- 
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.ARMOR_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "HULL_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.ChaosHull,
	in_editor	= false,
	
	rocket_cooldown_coef_mul	= -0.5,
	spell_on_max_health_minus	= "Spell_ChaosHull",
	
	max_health_percent		= 0.5,
	
	-- show_cooldown_status	= true,
	-- cooldown				= 40,
	
	default_icon			= "ItemSubtype_ChaosHull",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race1_M_T5_Chaos",	
}

Def.Module_ChaosCPU = -- 
{
	class 		= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	unique_equip			= true,

	item_subtype			= ItemSubtype.ChaosCPU,
	in_editor	= false,
	
	crit_chance_add			= 0.1,
	crit_damage_add			= 0.2,
	
	spell_on_equip				= "Spell_ChaosCPU",
	
	default_icon			= "ItemSubtype_ChaosCPU",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race1_M_T5_Chaos",	
}