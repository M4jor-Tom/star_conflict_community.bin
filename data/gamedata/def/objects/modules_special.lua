Def.Module_MicroWarp =
{
	class			= "MicroWarpDrive",
	in_editor		= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,

	energy_prepare	= 0,		-- энергия требуемая для подготовительного разгона
	energy_activate = 30,		-- энергия требуемая для активации
	cooldown		= 30,

	prep_time		= 1,		-- время разгона
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
	work_sound 						= "sound/gadgets2/SinglePortal_start_loop",

	ui_name			= "MicroWarpDrive",
	
	uiName 			= "Special_MicroWarp_Base",
	uiDesc 			= "Special_MicroWarp_Base_Desc",
	
	item_subtype 	= ItemSubtype.MicroWarp,

	default_icon		= "ItemSubtype_MicroWarp",
}

--,быстрее уход, но дольше перезарядка
Def.Module_MicroWarp_Legion = 
{
	inherit 		= "Module_MicroWarp",
	prep_time		= 0.6,		-- время разгона
	cooldown		= 35,
	
	prep_loop		= "sound/gadgets/legion_warp_prep",
	active_loop		= "sound/gadgets/legion_warp_active",
	stop_sound		= "sound/gadgets/warp_stop",
	fail_sound		= "sound/gadgets/warp_fail",

	uiName 			= "Special_MicroWarp_Faction1",
	uiDesc 			= "Special_MicroWarp_Faction1_Desc",
}

--Запрет лока всем кто остался на (4) сек в р 750 м, но дольше перезарядка
Def.Module_MicroWarp_Warden = 
{
	inherit 		= "Module_MicroWarp",
	spell_on_warp	= "MicroWarpDisableLock", -- в момент отварпа.
	cooldown		= 35,
	
	uiName 			= "Special_MicroWarp_Faction2",
	uiDesc 			= "Special_MicroWarp_Faction2_Desc",
}


-- При использовании, корабль становится N секунд невидим для электронных систем врага. Его метка пропадает с hud вражеских кораблей.
-- после активации из невидимости нельзя выбить в течении 2 секунд 
-- cvar sv_shipStealthViewDist  
Def.Module_CloakingDevice =
{
	class				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.MEDIUM,
	
	item_subtype		= ItemSubtype.CloakingDevice,
	
	ui_name				= "Cloaking Device",
	
	uiName 				= "Special_CloakingDevice_Base",
	uiDesc 				= "Special_CloakingDevice_Base_Desc",
	
	cooldown			= 35.0,
	energy_cost 		= 60.0,

	
	--trigger_aura			= true,
	spell				= "Cloaking",
	deactivate_spell 	= "Bonus_damage",
	
--  activate_effect		= "particles/weapons/ship_explosion",
	activate_sound		= "sound/gadgets/stealth_on",
	deactivate_sound	= "sound/gadgets/stealth_off",
--	work_sound			= "",

	default_icon		="ItemSubtype_CloakingDevice",
}

--12 сек невидимость (-1/3). но перезарядка 25
Def.Module_CloakingDevice_Armada = 
{
	class				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.MEDIUM,
	
	item_subtype		= ItemSubtype.CloakingDevice,
	
	spell				= "Cloaking_Faction1", 
	deactivate_spell	= "Bonus_damage",
	cooldown			= 25.0,
	energy_cost 		= 60.0,
	
	activate_sound		= "sound/gadgets/stealth_on",
	deactivate_sound	= "sound/gadgets/stealth_off",
	default_icon		= "ItemSubtype_CloakingDevice",
	
	uiName 				= "Special_CloakingDevice_Faction1",
	uiDesc 				= "Special_CloakingDevice_Faction1_Desc",
}

--нельзя выбить из клоки повреждениями, но перезарядка немного дольше
Def.Module_CloakingDevice_Avangard = 
{
	class				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.MEDIUM,
	
	item_subtype		= ItemSubtype.CloakingDevice,
	
	--stealth_ignore_damage = true, --более не используется #64709
	spell				= "Cloaking_Ignore_Damage",
	cooldown			= 40.0,
	energy_cost 		= 60.0,	
	
	deactivate_spell 	= "Bonus_damage_avangard",

	activate_sound		= "sound/gadgets/stealth_on",
	deactivate_sound	= "sound/gadgets/stealth_off",
	default_icon		= "ItemSubtype_CloakingDevice",
	
	uiName 				= "Special_CloakingDevice_Faction2",
	uiDesc 				= "Special_CloakingDevice_Faction2_Desc",
}

--
--[[ Def.Module_FrigateDrone =
{
	class				= "FrigateDroneModule",
	in_editor			= false,

	model				= "models/modules/m_class/frigdrone/m_c_frigdrone_orbit",
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,
	ui_name				= "FrigateDrone",

	cooldown			= 10.0,
	energy_cost			= 10.0,
	energy_cost_per_second = 30.0,

	activate_effect		= "",
	activate_module_effect = "",

	
	ui_ico =
	{
		target_system 	= { tex = "ship_LARGE", },
	},
	
	heal_per_second = 0.0,
	anti_missile_radius = 0.0,
	anti_missile_cooldown = 5.0,
	
	drone_num		= 2,
	activate_entity_health	= 500,
	fire_rate		= 100.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 100,
	max_range		= 200,
	projectile_speed = 180,
	
	damage_kinetic	= 0,
	damage_emp		= 0,
	damage_thermal	= 300,
	projectile		= "Projectile_Dron_Plasma",
} ]]


-- дрон инженерного фрегата. берется по умолчанию
-- но можно вбить в модуль поле drone_def
Def.FrigateDrone =
{
	class			= "Satellite",
	in_editor		= false,
	hack_immune 	= true,
	
	
	model			= "models/modules/m_class/frigdrone/frigdrone", 
	physics			= { solid_type = solid.sphere, kinematic = true, material = "ShipMetalMk1", mass = 1000000, hitbox = true, },

	signature		= ai.Signature.TINY,
	
	death_effect	= "particles/explosions/healing_bot",
	death_sound		= "sound/explosion/drone_expl",

	max_rot_speed	= 200,	-- deg per second
	max_yaw			= 120,
	min_yaw			= -120,
	max_pitch		= 90,
	min_pitch		= -70,	
	
	shot_effect 	= "particles/weapons/drongun/muzzle_frigate",
	shot_once_sound 	= "sound/gadgets/FrigateDrone/fd_shot_once",
	heal_beam_fx	= "particles/gadget/drone_shield_ray",
	heal_sound		= "sound/gadgets/FrigateDrone/fd_heal",
	
	anti_missile_beam_fx = "particles/other/vp_beam_red",
	anti_missile_sound = "sound/explosion/drone_expl",
	
	children 	= 	
					{
						{ effect ="particles/ships/drone_engine", joint = "fx1" },
						{ effect ="particles/ships/drone_engine", joint = "fx2" },
						{ effect ="particles/ships/drone_engine", joint = "fx3" },
					},
}
Def.SatelliteHolder = 
{
    class = "ScBaseEntity",
    model = "models/objects/green_drones/green_drones_orbits",
}
Def.BrokkDrone = 
{
	inherit				= "FrigateDrone",
	model				= "models/modules/m_class/brokk_drone/brokk_drone",
	children 	= 	
					{
						{ effect ="particles/ships/drone_engine_brokk", joint = "fx1" },
					},
}
Def.PhoenixDrone = 
{
	inherit				= "FrigateDrone",
	model				= "models/ships/race_4/l/race4_l_phoenix_drone",
	children 	= 	
					{
						{ effect ="particles/null", joint = "fx1" },
						{ effect ="particles/null", joint = "fx2" },
						{ effect ="particles/null", joint = "fx3" },
					},
 }

Def.GreenFrigateDrone = 
{
	inherit		= "FrigateDrone",
	model		= "models/objects/green_drones/dron_shooter",
	death_effect	= "particles/explosions/shp_exp_mid_alien",
	children 			=
	{
		{ effect	= "particles/gadget/drone_shooter_engine", joint = "fx1" },
	},
}

Def.GreenFrigateDroneAssistant = 
{
	inherit		= "FrigateDrone",
	model		= "models/objects/green_drones/dron_engineer",
	death_effect	= "particles/explosions/shp_exp_mid_alien",
	shot_effect = "particles/weapons/blaster/neutron_muzzle",
	children = 
	{
		{ effect = "particles/gadget/drone_asistant_engine", joint = "fx1" },
	},	
	launch_speed = 90,
}
Def.GreenFrigateDroneAssistantOnAlly = 
{
	inherit		= "FrigateDrone",
	model		= "models/objects/green_drones/dron_engineer",
	death_effect	= "particles/explosions/shp_exp_mid_alien",
	shot_effect = "particles/weapons/blaster/neutron_muzzle",
	children = 
	{
		{ effect = "particles/gadget/drone_asistant_engine", joint = "fx1" },
	},	
	launch_speed = 90,
	damage_thermal = 500

}

--
Def.Module_Disintegrator = 
{
	class			= "Disintegrator",
	in_editor		= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,

	cooldown			= 1.0,
	energy_cost 		= 60.0,
	energy_cost_per_second = 0.0,

	item_subtype		= ItemSubtype.Disintegrator,
	
	fire_rate			= 20.0,
	max_range			= 2000,
	damage_thermal		= 300,	
	zoom_value			= 3.0,
	projectile_speed	= 2000,
	hit_effect          = "particles/weapons/sniper/hit",
	impact_type			= "disintegrator",
	
	shot_beam			= "particles/weapons/sniper/beam",
	aim_beam			= "particles/weapons/sniper/targeting",
--	shot_once_sound		= "sound/weapons/turret/turret_oneshot",
	ready_sound			= "sound/gadgets/disintegrator/dis_ready",
	zoom_changed_sound	= "sound/gadgets2/AdvancedZoom",
	
	aim_flare_size		= 0.4,
	aim_flare_nebulosity= 0.5,
	aim_flare_angle		= 20.0,
	aim_flare_color		= "255 50 50 80",
}


--
Def.Module_Disintegrator_Warden = 
{
	inherit				= "Module_Disintegrator",
	spell_on_hit		= "Disintegrator_Dot",
}


--[[Def.DroneSwarm =
{
	class 				= "Swarm",

	drone				= "SwarmDrone",
	drone_amount		= 1,
	drone_min_speed		= 1,
	drone_max_speed		= 1,
	dron_acceleration	= 1,

	radius				= 3.0,
}]]

--[[Def.SwarmTurret =
{
	class					= "GuidedDrone",
	in_editor				= false,
	
	-- model				= "models/turret/huge_module_drone/dron",
	model					= "models/objects/green_drone/green_drone_connected",
	--model					= "models/weapons/drones/sentry_drone/sentry_drone",
	physics					= { solid_type = solid.sphere, hitbox = true, material = "Metal", mass = 100,  damping = 0.01, rot_damping = 0.01,  },

	signature				= ai.Signature.TINY,
	health 					= 2000, --500
	ttl						= 30,
	
	
	death_effect			= "particles/explosions/big_fire_alien_2",
	death_sound				= "sound/explosion/drone_expl",
	
	weapon_slots			= 1,
	primary_weapon			= "Weapon_GreenTurretDroneWeaponWeak",
	--projectile				= "Projectile_SentryDron",
	
	max_speed				= 0,
	max_rot_speed			= 180,	-- deg per second, поворот модели дрона (учитывает физику при повороте)
	max_aim_rot_speed		= 180, -- скорость поворота прицела дрона
	
	uiName 					= "GreenTurretDrone_name",
	default_icon			= "ItemSubtype_DestrBeamDrone",
	--дамаг надо указывать в дроне а не в пушке, а то не дамагает
	damage_thermal			= 400,
}]]

Def.SwarmDrone =
{
	class 				= "BaseEntity",
	model				= "models/objects/green_drones/drones_swarm/single_drone",
	network_sync			=	false,
}

Def.SwarmShield =
{
	model = "models/shields/swarm_shield",
	ignore_transparency = true,
}

Def.SwarmPackBase =
{
	class					= "SwarmPack",
	signature				= ai.Signature.SMALL,
	--model				= "models/misc/r5_drone_test", -- модель из 20 дронов
	--model				= "models/objects/green_drones/drones_swarm/drones", -- анимированная модель из 150 дронов
	--model				= "models/objects/green_drones/drones_swarm/drone_swamp", -- 350
	model				= "models/objects/green_drones/drones_swarm/drone_swarm_1", -- 1000
	--model				= "models/objects/green_drones/drones_swarm/drone_swarm_vx",
	--model					= "models/weapons/drones/attack_drone/attack_drone",
	--model					= "models/objects/green_drones/drones_swarm/single_drone",
	--model					= "models/objects/green_drones/drones_swarm/drones",
	
	--physics					= { solid_type = solid.sphere, sphere_radius = 4, kinematic = true, hitbox = true, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	physics					= { solid_type = solid.sphere, sphere_radius = 3.25, hitbox = true, material = "Swarm", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	
	radar_vison				= ai.ShieldRadarVisionMode.PASS,
	weapon_mode				= ai.ShieldWeaponMode.BLOCK_ENEMY,
	--effect				= "particles/gadget/alien_voidzone2"
	--effect					= "particles/gadget/swarm/swarm",
	--effect_low_hp			= "particles/gadget/swarm/swarm_lowhp",

	transformation_sound 		= "sound/swarm/swarm_transform",
	idle_sound			= "sound/swarm/swarm_idle",
	shot_once_sound 		= "sound/swarm/swarm_shot_small",
	

	bound_effect_radius		= 4.0, -- переопределяет размер эффектов, размер которых зависит от размера ограничивающей объект сферы
	shield_bound_effect_radius = 15.0,
	turret_bound_effect_radius = 10.0,

	mark_frames_size		= 4.0, -- переопределяет размер рамок в HUD

	health 					= 22000, ----!   общее для роя 20000 
	health_regen			= 325,----!   общее для роя   500
	start_work_health_percent = 0.5,
	min_health_percent		= 0.15, -- минимальное количество HP в процентах от максимального в каждом режиме

	max_length				= 17,
	guard_sphere_speed		= 3, --20  -- скорость вращения вокруг
	reg_k					= 2, --0.03, --0.01, --0.5  -- регулятор для красоты? скорость не максимальная?  max( reg_k * dist , max_speed ) наркоманский коэффициент торможения
	rot_reg_k				= 3,
	acceleration			= 70, 
	max_rot_speed			= 180,	-- deg per second
	max_aim_rot_speed		= 270,
	bone_deviation			= 2.0,--2.5,--4.0,
	
	--режим 1
	guard_ring_radius		= 20,--20.0,  -- крутится?
	guard_range				= 150.0,   -- нападет ----!
	guard_max_range			= 200.0,  -- преследует/возвращается

	-- альтернативный варинат через дроны -??
	drone					= "",--"SwarmDrone",
	drone_amount			= 1,

	head_group_amount		= 3,

	drone_scale				= 5.5, --2.5
	drone_glow_intensity	= 1,--,130.0, --30
	drone_max_speed			= 20.0,--0.1,
	drone_acceleration		= 30.0, --0.1
	shield_drone_acceleration = 1, -- ускорение в режиме щита
	drone_cognitive_coef	= 0,
	drone_social_coef		= 0,
	drone_home_coef			= 10,
	drone_elope_coef		= 0,
	drone_rand_vel_coef		= 1,
	drone_neighbour_amount	= 30,
	
	smart_shield_radius		= 3.25,  --#90547

	--Стрельба роем #0103883
	projectile					= "Projectile_Swarm",
	no_friendly_fire 			= true, --ТАКЖЕ И ДЛЯ 1.3
	
	--shot_health_cost_percent	= 0.07,
	--damage_thermal			= 900 * 4 * 1.45,
	--fire_rate					= 18,
	--projectile_speed			= 325,
	--optimal_range				= 450,
	--max_range					= 600,  

	spell_on_attack 		= "SwarmBaseDamage", -- спелл которым атакует рой
	state_control_aura_range_coef = 1.5, -- увеличение радиуса spell_on_attack при ручном управлении
	--spell_on_attack 		= "TestDamage123",
	
	attack_time				= 3,
	attack_period			= 5,

	vision_radius					= 250,

	max_speed						= 50,--70,  ----! общее для модуля
 
	max_rearspeed					= 8,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.8,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 14,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 15,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.8,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???

	max_xspeed						= 10,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 19,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 19,
	decel_x							= 7,
	max_yspeed						= 10,
	accel_y0						= 19,
	accel_y1						= 19,
	decel_y							= 7,
	
	rot_xmaxspeed					= 120,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 140*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 85*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 200*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 120,
	rotaccel_y0						= 140*2,
	rotaccel_y1						= 85*2,
	rotdecel_y						= 200*2,
	rot_zmaxspeed					= 100,
	rotaccel_z0						= 150*2,
	rotaccel_z1						= 150*2,
	rotdecel_z						= 500*2,

	--attack_sound					= "sound/ambient/alien_portal_loop",
	hack_immune						= true,
	
	uiName 							= "SwarmPack",

	--trail_effect 					= "particles/ships/ship_trail",
	--trail_color 					= "4 95 184 100",
	--trail_size 						= 0.15,
	
	--remote_control_range	= 700,  -- перешло в модуль
	--remote_control_zone_leave_timeout = 12, -- перешло в модуль
	
	trail_effect 			= "particles/ships/ship_trail_swarm",
	trail_color 			= "4 184 95 100",
	trail_size 				= 0.08,
	
	min_distance_to_owner	= 6,
	death_effect			= "particles/gadget/swarm/swarm_explosion",
	death_sound				=	"sound/explosion/swarm_explosion",
}

Def.SwarmPack =
{
	inherit  				= "SwarmPackBase",

	mode					= 0,	-- SMM_GUARD

	model				= "models/objects/green_drones/drones_swarm/drone_swarm_1",
	shield_model			= "models/shields/shield_r5_h",
	turret_model			= "models/shields/turret_r5_h",
	
	--shield_health_scale		= 10, -- количество HP в процентах от health
	--turret_health_scale		= 0.5, -- количество HP в процентах от health
	shield_resist			= 300,  ---250
	turret_resist			= -25,

	-- расположение дронов на поверхности щита-сферы. Остальные дроны скрываются
	-- root щита должен быть в центре сферы
    shield_scheme = {
        --circle0 = { amount = 1, angle = 0, },
        circle0 = { amount = 24, angle = 55, }, -- 25
        --circle2 = { amount = 51, angle = 75, },
    },
	shield_radius = 11, --12
	shield_drones_offset = 6.88291, -- смещаем кольцо дронов по оси z так, чтобы оно было на руте модели ( 12* cos(pi*55/180) = 6.88291 )

	shield = "SwarmShield",
	shield_start_effect		= "particles/gadget/swarm_shield_start",
	shield_end_effect		= "particles/gadget/swarm_shield_end",


	turret_scheme = {
        circle0 = { amount = 1, angle = 180, },
        circle1 = { amount = 7, angle = 155, },
        circle2 = { amount = 16, angle = 130, },
    },
	turret_radius = 8,
	turret_drones_offset 	= -6.0,
	turret_collision_radius	= 3.0,
	

	turret_max_fire_angle	= 15,
	
	attack_time				= 6,
	attack_period			= 5,

	--3 режим
	turret_shot_once_sound	= "sound/swarm/swarm_shot",
	warming_sound			= "sound/swarm/swarm_charge",
	turret_projectile		= "Projectile_Swarm13",
	shot_effect 			= "particles/weapons/big/swarm_turret_muzzle",
	warming_up_effect		= "particles/weapons/big/swarm_turret_warmup",
	control_range			= 1000,
	turret_fire_rate		= 15,
	warming_up_time			= 4,
	dispersion				= 1,
	turret_optimal_range	= 340, --450,
	turret_max_range		= 450, --600,
	turret_projectile_speed	= 260,
	turret_damage_thermal	= 900 * 4 * 1.35, --5220/4=1305
}

Def.SwarmPack2 =
{
	inherit  					= "SwarmPackBase",

	mode						= 1,	-- SMM_BALANCE

	model						= "models/objects/green_drones/drones_swarm/drone_swarm_45x8", -- 1000

	--guard_spiral_radius = 5,
	--guard_spiral_height = 20.0,
	--guard_spiral_offset = 5.0,
	--guard_spiral_turn_amount = 1.0,
	--guard_spiral_rot_speed	= 4, --20  -- скорость вращения вокруг

	--escort_offset_0				= Vec3(1, 1, -8),
	--escort_offset_1				= Vec3(-2, -3, -1),
	--escort_offset_2				= Vec3(3, 1, 5),

	spell_on_attack 				= "Swarm2BaseDamage",
	state_control_aura_range_coef 	= 1.2,
	
	reg_k							= 5.5,--2,
	rot_reg_k						= 10,--3
	acceleration					= 140,--70
	max_speed						= 45,--50
	rot_xmaxspeed					= 160,--120

	-- Настройки фазы 2
	attack_time					= 6,
	attack_period				= 6,
	attack_target_range			= 450,--370,
	attack_target_max_range		= 550,--450,
	fly_in_sphere_radius		= 60,
	fly_in_sphere_rot_speed		= 20,

	-- Настройки фазы 3
	defence_sphere_radius				= 15,
	defence_sphere_range				= 125,
	defence_sphere_max_range			= 150,
	defence_sphere_rot_speed			= 2,
	defence_sphere_attack_time			= 6,
	defence_sphere_attack_period		= 8,
	defence_sphere_attack_damage_mul	= -1,
	defence_sphere_speed_mul			= 1.8,
}

Def.SwarmPack3 =
{
	inherit  					= "SwarmPackBase",

	mode						= 2,	-- SMM_SKILL
	model				= "models/objects/green_drones/drones_swarm/drone_swarm_3",

	boost_engine_scheme = {
        circle0 = { amount = 1, angle = 180, },
		circle1 = { amount = 11, angle = 160, },
    },
	boost_engine_radius = 1,
	boost_engine_drones_offset1 = Vec3( -8.0, -5, -20 ),
	boost_engine_drones_offset2 = Vec3( 8.0, -5, -20 ),
	boost_effect = "particles/gadget/swarm/swarm_drone_engine",
	boost_length = 1.0,
	boost_min_length_factor = 0.25,
	boost_width = 1.0,
	boost_min_width_factor = 1.0,
	boost_connection_beam_effect	= "particles/gadget/swarm/swarm_drone_engine_beam",
	boost_offset_coef = 1.0,
	boost_beam_capacitor_bone = "root",
	
	boost_min_distance_to_owner	= 10.0,
	

	-- настройки девиации движков
	boost_max_speed			= 20.0,--0.1,
	boost_acceleration		= 1.0, --0.1
	boost_home_coef			= 10,
	boost_elope_coef		= 1,
	boost_rand_vel_coef		= 1,
	boost_deviation			= 1,

	ball_scheme = {
        circle0 = { amount = 1, angle = 180, },
        circle1 = { amount = 6, angle = 130, },
		circle2 = { amount = 10, angle = 90, },
		circle3 = { amount = 6, angle = 50, },
		circle4 = { amount = 1, angle = 0, },
    },
	ball_radius = 4,
	ball_collision_radius = 4.5,
	ball_speed = 700.0,
	ball_max_range = 600.0,
	ball_bulding_time = 0.2,
	ball_effect = "particles/gadget/swarm/swarm_drone_projectile",
		

	ball_hit_sound 	= "sound/explosion/swarm_explosion",
	ball_death_sound = "sound/explosion/swarm_explosion",

	cloud_scheme = {
        circle0 = { amount = 1, angle = 180, },
        circle1 = { amount = 6, angle = 130, },
		circle2 = { amount = 10, angle = 90, },
		circle3 = { amount = 6, angle = 50, },
		circle4 = { amount = 1, angle = 0, },
    },
	cloud_radius = 0, --35,				-- радиус сферы, на поверхности которой располагаются группы дронов
	cloud_radius_deviation = 10,
	cloud_angle_deviation = 25,
	cloud_building_time = 10,

	cloud_drone_group_radius = 30, --25.0, -- радиус каждой группы дронов
	cloud_dbg_radius = 50.0, -- только для отображения отладочной сферы, чтобы удобно было настраивать распределение дронов

	spell_on_attack 				= "Swarm3BaseDamage",
	spell_on_cloud					= "Spell_BallHitAndCloud",
	--spell_on_ball_hit				= "Spell_SwarmOnBallHit",
}


Def.Module_Swarm = 
{
	class 				= "SwarmModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,
	
	cooldown			= 0.5,
	energy_cost 		= 120.0,

	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/swarm/swarm_mode",

	spell0 				= "PhaseShield_Phase1_0",   -- бафф корабля в 1.0  -- ресист  35
	spell1 				= "PhaseShield_Phase1_1",   -- бафф корабля в 1.1  -- ресист  100
	spell2				= "PhaseShield_Phase1_2",   -- бафф корабля в 1.2  -- ресист  50
	spell3 				= "PhaseShield_Phase1_3",   -- бафф корабля в 1.3  -- спид    20% (ресист 0)
	
	item_subtype		= ItemSubtype.Swarm,
	
	default_icon		= "ItemSubtype_Swarm_Phase1",
	ui_ico_0			= { target_system = { tex = "ItemSubtype_Swarm_Phase0", }, },
	ui_ico_1			= { target_system = { tex = "ItemSubtype_Swarm_Phase1", }, },
	ui_ico_2			= { target_system = { tex = "ItemSubtype_Swarm_Phase2", }, },
	ui_ico_3			= { target_system = { tex = "ItemSubtype_Swarm_Phase3", }, },
	
	--drone				= "SwarmDrone",
	--drone_amount		= 5,
	swarm_pack			= "SwarmPack",
	pack_amount			= 1,

	attach_bone			= "root",	
	shield				= "DestrMunition_SectorShield_T4_Mk3",
	spawn_shield_offset	= Vec3( 0, 0, -20 ),  -- меняется физика, а не рой

--	turret				= "SwarmTurret",
--	spawn_turret_offset	= Vec3( 0, 0, -20 ),

	uiName 				= "Special_Swarm",
	uiDesc 				= "Special_Swarm_desc",

}
Def.Module_Swarm2  =
{
	inherit  			= "Module_Swarm",

	swarm_pack			= "SwarmPack2",

	spell1 				= "PhaseShield_Phase2_1",   -- бафф корабля в 2.1  -- ресист 125,
	additional_spell1	= "PhaseShield_Phase2_1_add", --реген 400/c 
	spell2				= "PhaseShield_Phase2_2",   -- бафф корабля в 2.2  -- скорость, повороты +10%
	spell3 				= "PhaseShield_Phase2_3",   -- бафф корабля в 2.3  -- скорость, повороты +10%

	item_subtype		= ItemSubtype.Swarm2,

	default_icon		= "ItemSubtype_Swarm2_Phase1",
	ui_ico_1			= { target_system = { tex = "ItemSubtype_Swarm2_Phase1", }, },
	ui_ico_2			= { target_system = { tex = "ItemSubtype_Swarm2_Phase2", }, },
	ui_ico_3			= { target_system = { tex = "ItemSubtype_Swarm2_Phase3", }, },
	uiName 				= "Special_Swarm2",
	uiDesc 				= "Special_Swarm2_desc",

	pack_amount			= 3,
}
Def.Module_Swarm3 =
{
	inherit  			= "Module_Swarm",

	swarm_pack			= "SwarmPack3",
	
	spell1 				= "PhaseShield_Phase3_1",   -- бафф корабля в 3.1  -- ресист,
	additional_spell1	= "PhaseShield_Phase3_1_add", --скорость
	spell2				= "PhaseShield_Phase3_1",   -- бафф корабля в 3.2  -- ресист, скорость
	spell3 				= "PhaseShield_Phase3_3",   -- бафф корабля в 3.3  -- 

	item_subtype		= ItemSubtype.Swarm3,
	
	default_icon		= "ItemSubtype_Swarm3_Phase1",
	ui_ico_1			= { target_system = { tex = "ItemSubtype_Swarm3_Phase1", }, },
	ui_ico_2			= { target_system = { tex = "ItemSubtype_Swarm3_Phase2", }, },
	ui_ico_3			= { target_system = { tex = "ItemSubtype_Swarm3_Phase3", }, },
	uiName 				= "Special_Swarm3",
	uiDesc 				= "Special_Swarm3_desc",

	cloud_cooldown		= 3.5,

}
Def.Projectile_Swarm13 =
{
	inherit 					= "Weapon_BaseRocket",
	model 						= "models/objects/green_drones/drones_swarm/single_drone",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	is_guided					= true,
	angular_velocity			= 12,
	--random_trajectory 			= true,
	
	detonation_radius			= 5,
	
	explosion_blast_wave 		= "Blastwave_Swarm13",-- "Blastwave_MagneticGun", --Blastwave_Swarm13
	--spell						= "ZoneCleaner",

	flare_color					= "255 255 191 150",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound					= "sound/swarm/swarm_rocket_fly",
	effect 						= "particles/weapons/big/swarm_turret_projectile",
	impact_type 				= "rocket",
	--inherit_speed				= true,

}
Def.Blastwave_Swarm13  =
{
	class						= "BlastWave",
	in_editor					= false,
	blast_maxDistance			= 10,
	apply_damage				= true,
	apply_shake 				= false,

	effect 						= "particles/explosions/expl_2_alien",
	
	light_color 				= "192 255 192 255",
	light_radius 				= 18,
	light_time 					= 0.2,
	sound 						= "sound/explosion/SmartRocket_expl",
}

Def.Projectile_Swarm =
{
	inherit 					= "Weapon_BaseRocket",
	model 						= "models/objects/green_drones/drones_swarm/single_drone",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	--is_guided					= true,
	--angular_velocity			= 12,
	--random_trajectory 			= true,
	
	detonation_radius			= 5,
	
	explosion_blast_wave 		= "Blastwave_Swarm",

	flare_color					= "3 64 40 24",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,
	effect 						= "particles/gadget/swarm/swarm_drone_small_projectile",
	impact_type 				= "rocket",
}
Def.Blastwave_Swarm  =
{
	class						= "BlastWave",
	in_editor					= false,
	blast_maxDistance			= 10,
	apply_damage				= true,
	apply_shake 				= false,

	effect 						= "particles/gadget/swarm/swarm_drone_small_hit",
	
	light_color 				= "3 64 40 255",
	light_radius 				= 8,
	light_time 					= 0.2,
	sound 						= "sound/explosion/SmartRocket_expl",
}

Def.Blastwave_Swarm32 =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 25,
	apply_damage				= false,
	apply_shake 				= true,
	
	intensity					= 50,
	--damage_kinetic			= 3500,
	self_damage_coef			= 0,
}

--  ресист 150
Def.Module_PhaseShield_Raid = 
{
	class 				= "PhaseShield",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,
	
	cooldown			= 0.3,
	energy_cost 		= 120.0,

	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",
	
	spell0 				= "PhaseShield_Phase1_",
	spell1				= "PhaseShield_Phase0_",
	spell2 				= "PhaseShield_Phase2_",
	
	item_subtype		= ItemSubtype.PhaseShield,
	
	default_icon		= "ItemSubtype_PhaseShield",
	ui_ico_0			= { target_system = { tex = "ItemSubtype_PhaseShield_Phase1", }, },
	ui_ico_1			= { target_system = { tex = "ItemSubtype_PhaseShield", }, },
	ui_ico_2			= { target_system = { tex = "ItemSubtype_PhaseShield_Phase2", }, },
	
	uiName 				= "Special_PhaseShield_guard",
	uiDesc 				= "Special_PhaseShield_guard_Desc",
}


-- дамаг 15% ресист 120
Def.Module_PhaseShield = 
{
	inherit 			= "Module_PhaseShield_Raid",
	spell_on_hit		= "PhaseShield_Tank_Buff",   --  При поглощении щитом соответствующего урона, поднять урон основного оружия корабля на 15%, на 5 секунд. 
	spell0 				= "PhaseShield_Phase1",
	spell1				= "PhaseShield_Phase0",
	spell2 				= "PhaseShield_Phase2",	
}


-- восстановление энергии ресист 120
Def.Module_PhaseShield_Technologists = 
{
	inherit 			= "Module_PhaseShield_Raid",
	--hull_heal_coef		= 0.15,  -- Технологи: При поглощении щитом соответствующего урона, N% абсорбированного урона чинят корпус.
	spell_on_hit		= "PhaseShield_Energy_Buff",   --восстановление энергии при поглащении урона
	spell0 				= "PhaseShield_Phase1",
	spell1				= "PhaseShield_Phase0",
	spell2 				= "PhaseShield_Phase2",		
}


Def.Module_PhaseShield_Tank =
{
	inherit 			= "Module_PhaseShield",
	spell_on_hit		= "PhaseShield_Tank_Buff",   --  При поглощении щитом соответствующего урона, поднять урон основного оружия корабля на 5%, на 5 секунд. 
	--hull_heal_coef		= 0.1,  --  При поглощении щитом соответствующего урона, N% абсорбированного урона чинят корпус.
	energy_cost			= 120,
	cooldown			= 0.3,
	
	item_subtype		= ItemSubtype.PhaseShield,
	
	class_mask			= ai.ShipClass.LARGE,
	
	default_icon		= "ItemSubtype_PhaseShield",

	uiName 				= "Special_PhaseShield_guard",
	uiDesc 				= "Special_PhaseShield_guard_Desc",
}




--
Def.Module_EnergyLance_Raid = 
{
	inherit 			= "Module_EnergyLance",
	piercing_coef		= 0.3,   -- Рейд: часть повреждений наносится в обход щита сразу в корпус
}


--
Def.Module_EnergyLance_Technologists = 
{
	inherit 			= "Module_EnergyLance",
	live_steal_coef		= 0.7,  -- Технологи: часть нанесенных повреждений возвращаются кораблю-носителю оружия в виде корпуса.
}


--
Def.Module_GuidedMissile = 
{
	class 				= "GuidedMissileModule",
	
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,
	
	cooldown			= 5.0,
	energy_cost 		= 60.0,
	
	--activate_effect		= "",
	--activate_module_effect = "",
	activate_sound		= "sound/weapons/rockets/gm_launch",
	
	item_subtype		= ItemSubtype.GuidedMissile,
	

	projectile			= "GuidedMissile",
	explosion_blast_wave = "GuidedMissileBlastWave",
}


--
Def.Module_MIRVMissile = 
{
	class 				= "MIRVModule",
	
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,
	
	cooldown			= 5.0,
	energy_cost 		= 60.0,
	
	--activate_effect		= "",
	--activate_module_effect = "",
	activate_sound		= "sound/weapons/rockets/gm_launch",
	
	item_subtype		= ItemSubtype.GuidedMissile,
	

	projectile						= "GuidedMissile",
	secondary_projectile			= "SpaceMissile_AAMu_T1_Mk1",
	secondary_activation_cooldown 	= 2.0,
	explosion_blast_wave 			= "GuidedMissileBlastWave",
}


-- управляемая ракета для спецмодуля
Def.GuidedMissile =
{
	inherit 			= "Weapon_BaseRocket",
	in_editor			= false,

	model 				=	"models/weapons/missiles/guided_missile",

	detonation_radius 	= 0,
	--rocket_class		= ai.RocketClass.LARGE,
	
	speed 				= 78,--65, --63
	angular_velocity	= 16.5,--15,
	max_range			= 1000,
	
	--effect				= "particles/weapons/guided/trail",
   	work_sound			= "sound/weapons/rockets/gm_rocket_fly",
	spectate_work_sound = "sound/weapons/rockets/gm_engine_loop",
	jam_screen_effect	= "particles/screen/whiteout",

	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	flare_color			= "255 255 255 255",
	--missile_defence_immune = true,
}

Def.GuidedMissile_T1 = 
{
	inherit 			= "GuidedMissile",
	spell 				= "GuidedMissile_T1",
	max_range			= 700,	
}

Def.GuidedMissile_T2 = 
{
	inherit 			= "GuidedMissile",
	spell 				= "GuidedMissile_T2",
	max_range			= 800,
	angular_velocity	= 18.15,
}

Def.GuidedMissile_T3 = 
{
	inherit 			= "GuidedMissile",
	spell 				= "GuidedMissile_T3",
	angular_velocity	= 19.8,
}

Def.GuidedMissile_T4 = 
{
	inherit 			= "GuidedMissile",
	spell 				= "GuidedMissile_T4",
	angular_velocity	= 21.45,
}

Def.GuidedMissile_T5 = 
{
	inherit 			= "GuidedMissile",
	spell 				= "GuidedMissile_T5",
	angular_velocity	= 23.1,
}

Def.GuidedMissile_Faction1 = 
{
	inherit 			= "GuidedMissile",
	speed 				= 78,--60, -- 70
	angular_velocity	= 27.5,
}



--
Def.GuidedMissileBlastWave = 
{
	class 				= "BlastWave",
	in_editor			= false,
	effect				= "particles/weapons/guided/explosion",
	
	intensity			= 100,
	damage_thermal		= 12000,
	
	blast_maxDistance	= 20,
	
	light_radius		= 20.0,
	light_color			= "255 100 0 255",
	light_time			= 0.8,
    sound  				= "sound/explosion/big_rocket_expl",
}

Def.Module_GuidedMissile_Exorcist =
{
	--inherit				= "Module_GuidedMissile",
	
	class 				= "GuidedMissileModule",
	
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,
	
	cooldown			= 16,
	energy_cost 		= 60.0,
	
	--activate_effect		= "",
	--activate_module_effect = "",
	activate_sound		= "sound/weapons/rockets/gm_launch",
	
	item_subtype		= ItemSubtype.Exorcist_GuidedMissile,
	
	--spell 				= "Spell_Exorxist_GuidedMissile",
	

	projectile			= "Projectile_GuidedMissile_Exorcist",
	explosion_blast_wave = "BlastWave_Exorcist_GuidedMissile",
	
	default_icon		= "ItemSubtype_ExorcistSpecial",	
}

Def.Projectile_GuidedMissile_Exorcist = 
{

	inherit 			= "Weapon_BaseRocket",
	class						= "Rocket",
	in_editor			= false,

	model 				=	"models/weapons/missiles/guided_missile",

	detonation_radius 	= 0,
	--rocket_class		= ai.RocketClass.LARGE,
	
	speed 				= 78,--65, --63
	angular_velocity	= 30.5,--15,
	max_range			= 1000,
	
	--effect				= "particles/weapons/guided/trail",
   	work_sound			= "sound/weapons/rockets/gm_rocket_fly",
	spectate_work_sound = "sound/weapons/rockets/gm_engine_loop",
	jam_screen_effect	= "particles/screen/whiteout",

	spell_on_launch 	= "Spell_Exorxist_GuidedMissile",
	--spell_on_launch	= "Spell_BasheGun_Cast1",

	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	flare_color			= "255 255 255 255",
}

Def.BlastWave_Exorcist_GuidedMissile = 
{
	inherit				= "GuidedMissileBlastWave",
	damage_thermal		= 10000,
}


Def.Module_BlackoutGenerator = 
{
	class				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,
	
	cooldown			= 10.0,
	energy_cost 		= 10.0,
	energy_cost_per_second = 0.0,
	
	spell				= "BlackoutGenerator",
	deactivate_spell	= "BlackoutGenerator_Stun",
	
	activate_sound		= "sound/gadgets/blackout/bo_activate",

	item_subtype		= ItemSubtype.BlackoutGenerator,
	default_icon		= "ItemSubtype_BlackoutGenerator",

}

Def.Module_EnergyShieldCommander = 
{
	class				= "ActiveModule",
	in_editor			= false,
	item_subtype		= ItemSubtype.EnergyShieldCommander,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.MEDIUM,

	cooldown			= 30.0,
	--cooldown			= 1.0,
	--energy_cost 		= 10.0,
	--energy_cost_per_second = 0.0,
	
	spell				= "EnergyShieldCommander",
	
	activate_sound		= "sound/gadgets/energy_shield_commander",
--	deactivate_sound	= "",
--	work_sound			= "",
	
	default_icon		= "ItemSubtype_EnergyShieldCommander",

	uiName 				= "Special_EnergyShieldCommander",
	uiDesc 				= "Special_EnergyShieldCommander_Desc",
}

Def.Module_FrontEnergyShield =
{
	class				= "ActiveModule",
	activate_entity		= "FrontEnergyShield",
	attach_bone			= "root",
	spawn_offset 		= Vec3( 0, 0, 0 ),
	cooldown			= 20,
	in_editor			= false,
	activate_sound 		= "sound/gadgets/energy_shield_commander",
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.MEDIUM,
	
	--spell				= "FrontEnergyShield",
	
	item_subtype		= ItemSubtype.FrontEnergyShield,	
	default_icon		= "ItemSubtype_FrontEnergyShield",
	
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

Def.FrontEnergyShield =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	class_mask		= ai.ShipClass.MEDIUM,
	
	
	damage_to_ship_energy_coef = 0.033333333333,
	damageable 		= true,
	health 			= 1000,
	ttl				= 10,
	active_aura		= "FrontEnergyShield",
	
	hack_immune 	= true,
	
	model			= "models/shields/shield_front",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "EnergyShield", },
	effect			= "FrontShieldEffect",
	death_sound		= "sound/explosion/drone_expl",
	uiName 			= "FrontEnergyShield",
	default_icon	= "ItemSubtype_FrontEnergyShield",
	
	start_sound  	= 	"sound/destroyer/SShield_activate",
	end_sound	=	"sound/destroyer/SShield_off",
	death_sound	=	"sound/destroyer/SShield_off",
	is_shield		= true, --#
}

Def.Module_EnergyShieldCommander_Faction1 = 
{
	class				= "ActiveModule",
	in_editor			= false,
	item_subtype		= ItemSubtype.EnergyShieldCommander,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.MEDIUM,

	cooldown			= 35.0,
	--energy_cost 		= 10.0,
	--energy_cost_per_second = 0.0,
	
	spell				= "EnergyShieldCommander_Faction1", --перекрывается спеллом из экспорта
	additional_spell	= "Bonus_damage",
	
	--activate_effect		= "particles/gadget/shield_boost",
	activate_sound		= "sound/gadgets/energy_shield_commander",
--	deactivate_sound	= "",
--	work_sound			= "",
	
	default_icon		= "ItemSubtype_EnergyShieldCommander",

	uiName 				= "Special_EnergyShieldCommander",
	uiDesc 				= "Special_EnergyShieldCommander_Desc",
}

Def.Module_EnergyShieldCommander_Faction2 = 
{
	class				= "ActiveModule",
	in_editor			= false,
	item_subtype		= ItemSubtype.EnergyShieldCommander,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.MEDIUM,

	cooldown			= 35.0,
	--energy_cost 			= 10.0,
	--energy_cost_per_second 	= 0.0,
	
	spell				= "EnergyShieldCommander_Faction2", --перекрывается спеллом из экспорта
	additional_spell	= "Energy_renew",
	
	--activate_effect		= "particles/gadget/shield_boost",
	activate_sound		= "sound/gadgets/energy_shield_commander",
--	deactivate_sound	= "",
--	work_sound			= "",
	
	default_icon		= "ItemSubtype_EnergyShieldCommander",

	uiName 				= "Special_EnergyShieldCommander",
	uiDesc 				= "Special_EnergyShieldCommander_Desc",
}

Def.Module_Empty_Special = 
{
	class				= "ActiveModule",
	in_editor			= false,
	item_subtype		= ItemSubtype.EmptySpecial,
	
	module_type			= ai.ModuleType.SPECIAL,
	--class_mask			= ai.ShipClass.MEDIUM,
	
	default_icon		= "ItemSubtype_EnergyShieldCommander",

	uiName 				= "Special_ModuleEmptySpecial",	
}

---   ПЕРЕНЕСТИ МОДЕЛЬ В СПЕЦМОДУЛЬ НЕЛЬЗЯ!!! так как спецмодули одинаковые для всех кораблей, и записаны в базу как дефы, а модели разные
--Спец модуль для дестроера
-- Баланс в сторону регена щита
Def.Module_EnergyReroute =  -- = Module_EnergyReroute_FShield
{
	class 				= "PhaseShield",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.HUGE,
	
	cooldown			= 0.3,
	energy_cost 		= 120.0,

	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",
	
	spell0 				= "EnergyReroute_PhaseSpeed", --PhaseShield_Phase0
	spell1				= "EnergyReroute_PhaseDamage",
	spell2 				= "EnergyReroute_PhaseShield_max",
	
	item_subtype		= ItemSubtype.EnergyReroute,
	
	default_icon		= "ItemSubtype_EnergyReroute_Shield_Module",
	ui_ico_0			= { target_system 	= { tex = "ItemSubtype_EnergyReroute_Engine", }, },
	ui_ico_1			= { target_system 	= { tex = "ItemSubtype_EnergyReroute_Weapon", }, },
	ui_ico_2			= { target_system 	= { tex = "ItemSubtype_EnergyReroute_ShieldMax", }, },
	
	--uiName 				= "Special_EnergyReroute",
	--uiDesc 				= "Special_EnergyReroute_Desc",
	use_phase_effect 	= false,
	uiName 				= "Module_EnergyReroute_FShield",
}

-- Баланс в сторону оружия
Def.Module_EnergyReroute_FWeapon = 
{
	class 				= "PhaseShield",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.HUGE,
	
	cooldown			= 0.3,
	energy_cost 		= 120.0,

	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",
	
	spell0 				= "EnergyReroute_PhaseSpeed", --PhaseShield_Phase0
	spell1				= "EnergyReroute_PhaseDamage_max",
	spell2 				= "EnergyReroute_PhaseShield",
	
	item_subtype		= ItemSubtype.EnergyReroute,
	
	default_icon		= "ItemSubtype_EnergyReroute_Weapon_Module",
	ui_ico_0			= { target_system 	= { tex = "ItemSubtype_EnergyReroute_Engine", }, },
	ui_ico_1			= { target_system 	= { tex = "ItemSubtype_EnergyReroute_WeaponMax", }, },
	ui_ico_2			= { target_system 	= { tex = "ItemSubtype_EnergyReroute_Shield", }, },
	
	use_phase_effect 	= false,
	
	uiName 				= "Module_EnergyReroute_FWeapon",
}

-- Баланс в сторону регена скорости
Def.Module_EnergyReroute_FEngine = 
{
	class 				= "PhaseShield",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.HUGE,
	
	cooldown			= 0.3,
	energy_cost 		= 120.0,

	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",
	
	spell0 				= "EnergyReroute_PhaseSpeed_max", --PhaseShield_Phase0
	spell1				= "EnergyReroute_PhaseDamage",
	spell2 				= "EnergyReroute_PhaseShield",
	
	item_subtype		= ItemSubtype.EnergyReroute,
	
	default_icon		= "ItemSubtype_EnergyReroute_Engine_Module",
	ui_ico_0			= { target_system 	= { tex = "ItemSubtype_EnergyReroute_EngineMax", }, },
	ui_ico_1			= { target_system 	= { tex = "ItemSubtype_EnergyReroute_Weapon", }, },
	ui_ico_2			= { target_system 	= { tex = "ItemSubtype_EnergyReroute_Shield", }, },
	
	use_phase_effect 	= false,
		
	uiName 				= "Module_EnergyReroute_FEngine",
}

Def.Module_MovementChargesDestr = 
{
	--inherit				= "Module_EnergyReroute",
	
	class 				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.HUGE,
	
	cooldown			= 7,
	energy_cost 		= 120.0,
	
	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",		
	item_subtype		= ItemSubtype.MovementChargesDestr,	
	default_icon		= "ItemSubtype_MovementChargesDestr",	
	uiName 				= "Module_MovementChargesDestr",
	
	charge_spell_on_max_speed_plus = "DestrMovementCharge",
	max_speed_percent	= 0.9,
	charge_time			= 12,
	consume_aura		= ai.Aura.CHARGE,
	spell				= "DestrDamageChargeToBuff",
	activate_sound		= "sound/gadgets/common_activate",
	spell_on_equip		= "Spell_MovementChargesDestr",
	
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

Def.Module_DestrSiegeMode =
{
	class				= "ActiveModule",
	cooldown			= 5,
	energy_cost			= 120,
	trigger_aura		= true,
	spell				= "DestrSiegeMode",
	module_type			= ai.ModuleType.SPECIAL,
	activate_sound 		= "sound/gadgets/SiegeMode/sm_activate",
	
	item_subtype		= ItemSubtype.DestrSiegeMode,	
	default_icon		= "ItemSubtype_DestrSiegeMode",
}

Def.Module_ShieldChargesDestr = 
{
	class 				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.HUGE,
	
	cooldown			= 6,
	energy_cost 		= 745,
	
	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",		
	item_subtype		= ItemSubtype.ShieldChargesDestr,	
	default_icon		= "ItemSubtype_ShieldChargesDestr",	
	uiName 				= "Module_ShieldChargesDestr",
	
	charge_spell_on_damage = "DestrShieldDamageCharge",
	charge_damage		= 10000,
	charge_mask			= ai.ChargeType.DAMAGE_SHIP_SHIELD,
	consume_aura		= ai.Aura.CHARGE,
	spell				= "DestrChargetoEmpDamage",
	additional_spell	= "DestrShieldHealSelf",
	spell_on_equip = "Spell_TyrantShieldResist",
	activate_sound		= "sound/gadgets/ShieldChargesDestr/scd_fire",
	work_beam_fx		= "particles/gadget/jericho_module_beam",
	
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

Def.Module_DestrSpellOnChannel = 
{
	class 				= "ActiveModule",
	in_editor			= false,
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.HUGE, --!!!!!
	item_subtype		= ItemSubtype.DestrSpellOnChannel,
	default_icon		= "ItemSubtype_DestrSpellOnChannel",	
	
	spell				= "DamageAndEnergyBurnOnChannel",
	spell_on_equip		= "Spell_VigilantHullResist",
	
	cooldown			= 20,
	energy_cost			= 1350, --1350
	activate_sound 			= "sound/gadgets/SpellOnChannel/soc_fire",
	work_beam_fx		= "particles/gadget/esminec_specmodule_beam2",
	
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


Def.Module_ShieldWall={
	class			= "ActiveModule",
	item_subtype	= ItemSubtype.ShieldWall,
	energy_cost		= 400,
	cooldown		= 30,
	spell			= 'ShieldUniqueTank_Taunt',
	additional_spell= 'ShieldUniqueTank_Wall',
	module_type		= ai.ModuleType.SPECIAL,
	--uiName			= "Special_ShieldWall_Base"
	--uiDesc			= "Special_TimeBoost_Base_Desc"
	default_icon	= "ItemSubtype_ShieldWall",
	
	--activate_effect		= "particles/gadget/shield_boost",
	activate_sound		= "sound/gadgets/ShieldWall/sw_activate",
	
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


-- модуль риппера
Def.Module_GigantShield = {
	class					= "ActiveModule",
	item_subtype			= ItemSubtype.GigantShield,
	energy_cost				= 400,
	cooldown				= 18*2,
	spell					= 'GigantShieldSpeed',
	spell_on_equip			= 'GigantShieldResist',
	
	-- генерация щита
	activate_entity			= "GigantShield",
	activate_entity_ttl 	= 8, --5
	activate_entity_max 	= 1,
	activate_entity_health 	= 60000, --13000,
	attach_bone 			= "root",
	spawn_offset 			= Vec3( 0, 0, -1 ),
	--spawn_dir_to_aim = true,
	
	module_type				= ai.ModuleType.SPECIAL,
	--uiName					= "Special_ShieldWall_Base"
	--uiDesc					= "Special_TimeBoost_Base_Desc"
	default_icon			= "ItemSubtype_GigantShield",
	
	--activate_effect			= "particles/gadget/shield_boost",
	activate_sound			= "sound/gadgets/ShieldWall/sw_activate",
	
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

Def.GigantShield = 
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/shields/shield_giant3",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	children = 
	{
		{ effect = "particles/gadget/shield_giant" },
		{ effect = "particles/gadget/shield_giant_haze", joint = "fx1" },
		{ effect = "particles/gadget/shield_giant_haze", joint = "fx2" },
		{ effect = "particles/gadget/shield_giant_start", joint = "root" },		
	},
	death_sound		= "sound/explosion/drone_expl",
	death_effect	= "particles/gadget/shield_giant_end",
	end_effect		= "particles/gadget/shield_giant_end",
	uiName 			= "GigantShield",
	show_after 		= 0.2,
	ignore_transparency = true,
}

--
Def.Model_MegalodonShield =
{
	class				= "AnimatedEntity",
	precache_skins		= true,
	model				= "models/ships/race_3/l/r3_l_megalodon_shield",
}

Def.Model_MegalodonShieldEmi =
{
	class				= "AnimatedEntity",
	precache_skins		= true,
	model				= "models/ships/race_3/l/r3_l_megalodon_shield_emi",
}

Def.Model_ReaperShield =
{
	class				= "AnimatedEntity",
	precache_skins		= true,
	model				= "models/ships/race_4/l/race4_l_reaper_shield",
}

Def.Model_ReaperShieldHealing =
{
	class				= "AnimatedEntity",
	precache_skins		= true,
	model				= "models/ships/race_4/l/race4_l_reaper_shield_healing",
}


Def.Module_EnergyLance_TimeBoost = {
	class 				= "EnergyLance",
	in_editor			= false,
	
	cooldown			= 25,--12+5,
	energy_cost 		= 60.0,
	work_time			= 5.0,
	
	damage_box_size		= Vec3( 7.0, 1.0, 7.0 ),  -- ширина, высота, вперед
	
	-- damage per second
--	damage_kinetic		= 0,
	damage_emp			= 7500,
--	damage_thermal		= 6000, -- в секунду
	
	default_icon 		= 'ItemSubtype_EnergyLance_TimeBoost',
	item_subtype		= ItemSubtype.EnergyLance_TimeBoost,
	
	spell				= 'TimeBoost_T4_Short',
	uiName				= 'Special_EnergyLance_TimeBoost',
	uiDesc				= 'Special_EnergyLance_TimeBoost_desc',
	
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

Def.Model_ArcherShield =
{
	class				= "AnimatedEntity",
	precache_skins		= true,
	model				= "models/ships/race_3/m/archer_shield",
}


-----------------------------------------
--70073: Зеленые корабли: Разведка "Спецмодуль-базовый: Прыжок с ускорением команды"
Def.Module_MicroWarpTunnel =
{
	class				= "ActiveModule",
	in_editor			= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,
	spell				= "MicroWarpTunnel",
	additional_spell	= 'CrystalJump',
	is_fast_movement	= true,
	

	cooldown			= 35,
	energy_cost			= 30,

	--uiName 				= "Special_MicroWarp_Base",
	--uiDesc 				= "Special_MicroWarp_Base_Desc",
	
	item_subtype 		= ItemSubtype.MicroWarpTunnel,

	default_icon		= "ItemSubtype_MicroWarp",
	activate_effect		= "particles/gadget/dash_green",
}

--[[
Def.Module_MicroWarpTunnel =
{
	class			= "MicroWarpDrive",
	in_editor		= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,
	spell				= "MicroWarpTunnel",

	energy_prepare	= 0,		-- энергия требуемая для подготовительного разгона
	energy_activate = 30,		-- энергия требуемая для активации
	cooldown		= 40,

	prep_time		= 0.5,		-- время разгона
	prep_maxspeed_mul = 1.5,	-- во сколько раз увеличивать допустимую максимальную скорость при разгоне
	prep_accel_mul	= 3.0,		-- во сколько раз увеличивать ускорение при разгоне
	
	accel_time		= 1.25,		-- время сколько будет действовать
	maxspeed_mul	= 100.0,		-- во сколько раз увеличивать допустимую максимальную скорость
	accel_mul		= 5000.0,	-- во сколько раз увеличивать ускорение
	auto_disable_time = 0,	--0.55-- за T*<текущая_скорость> метров до препятствия автоматически выходит из варпа

	prep_loop		= "sound/gadgets/warp_prep",
	active_loop		= "sound/gadgets/warp_active",
	stop_sound		= "sound/gadgets/warp_stop",
	fail_sound		= "sound/gadgets/warp_fail",

	ui_name			= "MicroWarpDrive",
	
	uiName 			= "Special_MicroWarp_Base",
	uiDesc 			= "Special_MicroWarp_Base_Desc",
	
	item_subtype 	= ItemSubtype.MicroWarpTunnel,

	default_icon		= "ItemSubtype_MicroWarp",
}

]]


Def.Module_MicroWarpDamage =
{
	class				= "ActiveModule",
	in_editor			= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,
	spell				= "MicroWarpDamageArray",
	additional_spell	= 'CrystalJumpDamage',
	
	cooldown			= 10,
	energy_cost			= 30,

	--uiName 				= "Special_MicroWarp_Base",
	--uiDesc 				= "Special_MicroWarp_Base_Desc",
	
	--item_subtype 		= ItemSubtype.MicroWarpTunnel,
	activate_effect		= "particles/gadget/jump_green",
	default_icon		= "ItemSubtype_MicroWarp",
	
	is_fast_movement	= true,
}


-----------------------------------------
--69585: Зеленые корабли: Разведка "Распрыги"
Def.Module_CrystalJumpSeries = 
{
	class					= "ActiveModule",
	--item_subtype			= ItemSubtype.CrystalAttackerCloud,
	energy_cost				= 10,
	cooldown				= 1,

	--additional_spell		= 'CrystalAttackerCloud_Restore',
	
	ammo 					= 4, -- колчество использований -- 68014: Активный модуль для эсминца империи 14 ранг
	ammo_regen_time 		= 20, -- раз в это время будет восстанавливаться один патрон, если их текущее колчество меньше ammo
--
	spell_coefs 			= { 0, 0, 0.33, 1, 2, 3, 4, 4, }, -- массив дополнительных мультипликаторов усиления спелла ( в данном случае  увеличения дальности следующего прыжка и усиления дамага войд зоны )
	spell_coef_change_time  = 5,-- время сколько действует и стакается усиление
	spell					= 'Damage_CrystalJumpSeries',
	additional_spell		= 'CrystalJumpSeries',
	is_fast_movement		= true,

	
	module_type				= ai.ModuleType.SPECIAL,
	--uiName					= "Special_ShieldWall_Base"
	--uiDesc					= "Special_TimeBoost_Base_Desc"
	default_icon			= "ItemSubtype_GigantShield",
	
	activate_effect			= "particles/gadget/dash_green",
	--activate_effect			= "particles/gadget/jump_green",
	--activate_sound			= "sound/el_modules/CrystalAttackerCloud",
	
}

----------------------------------------------
--66062: Зеленые корабли: Разведка отмотка времени
Def.Module_BackwardTime = 
{
	class					= "TimeLeapModule",
	energy_cost				= 10,
	cooldown				= 5,
	cooldown_on_equip		= 10,
	
	max_leap_time			= 8, -- величина отмотки (в секундах)
	transition_time 		= 1.5, -- время отмотки, т.е. сколько времени будет отматываться max_leap_time
	safe_exit_time 			= 2, -- время допустимого нахождения в коллизии после завершения отмотки. Если после истечения этого времени корабль будет продолжать находиться внутри коллизии, то он взорвётся.
	
	module_type				= ai.ModuleType.SPECIAL,
	--uiName					= "Special_ShieldWall_Base"
	--uiDesc					= "Special_TimeBoost_Base_Desc"
	default_icon			= "ItemSubtype_GigantShield",
	
	spell_on_equip			= 'BackwardTime_Buff',
	
	activate_screen_effect	= "particles/screen/rewind_screen",
	activate_leap_effect 	= "particles/gadget/greenship_time_reverse_begin",
	deactivate_leap_effect	= "particles/gadget/greenship_time_reverse_end",
	activate_sound			= "sound/el_modules/BackwardTime",
	deactivate_leap_sound 	= "sound/gadgets/warpgate/ship_warp_out",
	
}


----------------------------------------------
--  
Def.Module_CrystalAttackerCloud = 
{
	class					= "ActiveModule",
	item_subtype			= ItemSubtype.CrystalAttackerCloud,
	energy_cost				= 200,
	cooldown				= 15,
	spell					= 'CrystalAttackerCloud_Damage_R9',
	additional_spell		= 'CrystalAttackerCloud_Restore',
	
	module_type				= ai.ModuleType.SPECIAL,
	--uiName					= "Special_ShieldWall_Base"
	--uiDesc					= "Special_TimeBoost_Base_Desc"
	default_icon			= "ItemSubtype_GigantShield",
	
	--activate_effect			= "particles/gadget/shield_boost",
	activate_sound			= "sound/el_modules/CrystalAttackerCloud",
}


--#64791
--Спец абилка зеленго ударника (базовая):
--    "Кристаллы падальщики"
--        стреляем во врага ракетой("контейнер с кристаллоидами") со слабым самонаведением (F) (ракету можно уничтожить)
--        на цели появляется ДОТ
--        если цель умирает, пока дот не кончился, то "кристаллоиды" возвращаются,
--            и чинят корабль хозяина на ХХХ единиц
-----------------------------------------------------
Def.Module_DroneScavenger ={
	class					= "FiringModule",
	in_editor 				= false,
	item_subtype			= ItemSubtype.DroneScavenger,
	energy_cost				= 40,
	cooldown				= 3,
	module_type				= ai.ModuleType.SPECIAL,
	default_icon			= "ItemSubtype_DroneScavenger",
	
	--spell_on_hit			= { "DroneScavenger", "DroneScavengerReturnTrigger" },
	--check_aim_orientation 	= true,
	--check_aim_orientation_angle = 180,
	--barrel_rot_speed 		= 90,
	--track 					= "aim",

	max_range				= 500,
-----
	damage_thermal 			= 300, 
	dispersion				= 0,   -- Это пишется в тултипе

	projectile 				= "Projectile_DroneScavenger", --"SpaceMissile_Standart_T1_Mk3",--"Projectile_DroneScavenger",
	projectile_speed 		= 400,
	
	
	-- не настроено (эффект/звуки)
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 		= 2,
	muzzleflash_time 		= 1.0,
	long_shot_effects 		= true,
	--shot_effect 		= "particles/weapons/vortex/muzzle",
	oriented_shot_effects 	= false,
	shot_once_sound 		= "sound/el_modules/DroneScavenger_shot",
	
	--uiName			= "Special_ShieldWall_Base"
	--uiDesc			= "Special_TimeBoost_Base_Desc"
}

--
Def.Projectile_DroneScavenger =
{
	inherit						= "Weapon_BaseRocket",
	
	explosion_blast_wave 		= "Blastwave_DroneScavenger",
	override_blast_wave_damage 	= true,
	
	detonation_radius			= 4,
	
	--speed					= 10, -- из модуля
	angular_velocity			= 360,
	is_guided					= true,
	use_pathfinder 				= true,
	--max_range					= 300, -- из модуля должно
	model						= "models/objects/green_drones/dron_engineer",
	
	
	--физика и нанесение урона не работает для коммон прожектайлов.
	--physics						= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 10000, },
	--physics					= { solid_type = solid.sphere, material = "Metal", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	--damageable					= true,
	--health						= 1500,
	--hudType 					= "default", 
	
	missile_defence_immune		= true,
	missile_detection_immune	= true,

	-- не настроено (эффект/звуки)
	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	work_sound			= "sound/el_modules/DroneScavenger_fly",
	children = 
	{
		{ effect = "particles/gadget/drone_scavenger_engine", joint = "fx1" },
	},	
}

Def.Blastwave_DroneScavenger =
{
	class				= "BlastWave",
	in_editor			= false,


	blast_maxDistance	= 5,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= false,

	--не настроено (эффект/звуки)
	effect 				= "particles/gadget/drone_scavenger_explosion",
	light_color 		= "220 60 60 100",
	light_radius 		= 10,
	light_time 			= 0.5,
	sound 				= "sound/gadgets/Vortex/Vortex_explosion",
}

Def.Projectile_DroneScavengerReturn =
{
	inherit						= "Projectile_DroneScavenger",
	angular_velocity			= 360,
	override_blast_wave_damage = false,
	spell						= "DroneScavengerHeal",
	--health						= 500,
	--hudType 					= "default", 
}

----------------------------------------------------------------------
--68252: Спецмодуль для зеленого ударника 5
-----------
--
Def.Module_CrystalFrySatellites = 
{
	class				= "FighterDroneModule",
	in_editor			= false,

	module_type			= ai.ModuleType.SPECIAL,
	--class_mask			= ai.ShipClass.LARGE,

	cooldown			= 10.0,
	energy_cost 		= 60.0,
	hull_cost			= 1000,

	item_subtype		= ItemSubtype.CrystalFrySatellites,
	
	drone_ttl 			= 7,
	drone_num			= 3,
	activate_entity_health		= 2000,
	drone_deactivate_spell = "FrySatelliteRestore",--- спелл, который скастуется на корабль при ручной деактивации на каждого дрона спелл.
	
	drone_def			= "FrySatellite",
	
	model				= "models/modules/m_class/frigdrone/m_c_frigdrone_orbit",
	
	dispersion			= 1,
	optimal_range		= 150,
	max_range			= 175,
	damage_thermal		= 4,
	fire_rate			= 240,
	--[[fire_rate			= 20.0,
	max_range			= 2000,
	damage_thermal		= 300,	
	zoom_value			= 3.0,
	projectile_speed	= 2000,
	hit_effect          = "particles/weapons/sniper/hit",
	impact_type			= "disintegrator",
	
	shot_beam			= "particles/weapons/sniper/beam",
	aim_beam			= "particles/weapons/sniper/targeting",
	
	aim_flare_size		= 0.4,
	aim_flare_nebulosity= 0.5,
	aim_flare_angle		= 20.0,
	aim_flare_color		= "255 50 50 80",]]
	activate_drone_effect = "particles/gadget/green_drone_appier",
	deactivate_drone_effect = "particles/gadget/green_drone_disappier",

	activate_sound 	= "sound/el_modules/ElCommonActivate",

}	

Def.FrySatellite = 
{
	inherit				= "FrigateDrone",
	model 				= "models/objects/green_drones/dron_shooter",
	children 			=
		{
				{ 	effect	="particles/gadget/drone_shooter_engine", joint = "fx1" },
		},
	weapon_slots		= 1,
	
	primary_weapon		= "Weapon_FrySatellite", --Weapon_Laser_Basic_T1_Mk1
	death_effect		= "particles/explosions/shp_exp_mid_alien",
	death_sound		= "sound/el_modules/FrySatelliteRestore_expl",
	
	max_rot_speed			= 180,	-- deg per second
	max_aim_rot_speed		= 180,
}

Def.Weapon_FrySatellite = 
{
	fire_rate			= 240,
	impulse_time		= 1,
	dispersion			= 0,
	crit_chance			= 0,
	crit_damage			= 0,
	optimal_range		= 150,
	max_range			= 175,
	inherit				= "Weapon_LaserGun", --"Weapon_LaserGun",
	uiName 				= "itemSubType_CrystalFrySatellites",
	
	beam_fx 			= "particles/weapons/laser/laser_drone_green",
	fire_fx 			= "particles/weapons/laser/laser_drone_green_muzzle",
	hit_fx 				= "particles/weapons/laser/laser_drone_green_muzzle",
	hit_shield_fx 		= "particles/weapons/laser/laser_drone_green_muzzle",
	hit_crit_shield_fx 	= "particles/weapons/laser/laser_drone_green_muzzle",
	end_fx 				= "particles/weapons/laser/laser_drone_green_muzzle",
	hit_metal_fx 		= "particles/weapons/laser/laser_drone_green_muzzle",
	hit_ship_fx 		= "particles/weapons/laser/laser_drone_green_muzzle",
	hit_crit_ship_fx 	= "particles/weapons/laser/laser_drone_green_muzzle", 
	shot_loop_sound		= "sound/weapons/laser/FrySatellite",
	impact_type 		= "laser",
	muzzleflash_color = { kinetic = "196 255 196 64", emp = "196 255 196 64", thermal = "196 255 196 64", },
}

Def.Module_DisintegratorPhasedEfficiency =
{
	activate_sound = "sound/gadgets/disintegrator/dis_activate",
	deactivate_sound = "sound/gadgets/disintegrator/dis_deactivate",
	ready_sound = "sound/gadgets/disintegrator_ph/dis_ph_ready",
	shot_once_sound = "sound/gadgets/disintegrator_ph/dis_ph_fire",
	work_sound = "sound/gadgets/disintegrator_ph/dis_ph_work_loop_p",
	
	aim_beam = "particles/weapons/sniper/targeting",
	hit_effect = "particles/weapons/sniper/hit",
	--shot_beam = "particles/weapons/sniper/beam",
	
	aim_flare_angle = 20,
	aim_flare_color = "255 50 50 80",
	aim_flare_nebulosity = 0.5,
	aim_flare_size = 0.4,
	
	class = "Disintegrator",
	class_mask = ai.ShipClass.LARGE,
	cooldown = 3,
	damage_thermal = 6432,--7758,
	default_icon = "ItemSubtype_DisintegratorPhased",
	energy_cost = 180, --166,
	fire_rate = 20,	
	impact_type = "disintegrator",
	item_lvl = 21,
	item_subtype = ItemSubtype.DisintegratorPhased,
	max_range = 1200,
	module_type = ai.ModuleType.SPECIAL,
	optimal_range = 1000,
	projectile = "Projectile_Disintegrator",
	projectile_speed = 1190,
	
	spell_on_hit = "SpellOnHit_Disintegrator_T4_Base",
	tier = 4,
	uiDesc = "Module_DisintegratorPhasedEfficiency_Desc",
	uiName = "Module_DisintegratorPhasedEfficiency",
	zoom_value = 4,
	
	damage_coefs = {1, 1.5, 2.5},
	damage_coef_change_time = 6,
	
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

Def.Module_ShieldSuppressor = 
{
	class = "ActiveModule",
	class_mask = ai.ShipClass.LARGE,
	default_icon = "ItemSubtype_ShieldSuppressor",
	cooldown = 45,
	energy_cost = 300,
	in_editor = false,
	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.ShieldSuppressor,
	spell = "ShieldSupressor_Counter",
	additional_spell = "ShieldandHullFortify",
	spell_on_equip = "ShieldSupressor",
	tier = 4,
	
	uiDesc = "Module_ShieldSuppressor_Desc",
	uiName = "Module_ShieldSuppressor",
	
	cooldown_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	min_targets_count= 0,
	cooldown_target_range = 150,
	cooldown_coef_per_target = -0.6,
	activate_sound 			= "sound/gadgets/common_activate",
	
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

Def.Module_VesselSwitch = 
{
	class = "ReserveSpaceShip",
	class_mask = ai.ShipClass.LARGE,
	default_icon = "ItemSubtype_VesselSwitch1",
	cooldown = 35,
	energy_cost = 300,
	in_editor = false,
	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.VesselSwitch,
	spell = "SpiralShield",
	destruction_time = 3,
	tier = 4,
	model = "models/ships/race_1/s/r1_s_spiral",
	children = 
	{
		{ model = "models/ships/race_1/s/r1_s_spiral_eng", joint = "engine_1" },
		{ model = "models/ships/race_1/s/r1_s_spiral_boost", joint = "boost_1" },
		{ model = "models/ships/race_1/s/r1_s_spiral_cap", joint = "capacitor_1" },
	},
	uiDesc = "Module_VesselSwitch_Desc",
	uiName = "Module_VesselSwitch",
	spaceship = "Ship_Race1_L_T4_CraftUniq_small",
	activate_sound 			= "sound/gadgets/common_activate",
	stealth_param1 = 0.2,
	stealth_param2 = 1.1,
	explosion_danger_effect = "particles/gadget/explosion_alarm",

	activate_sound 			= "sound/gadgets/VesselSwitch/vs_activate",
	explosion_danger_sound  	= "sound/gadgets/VesselSwitch/vs_detonation",
	
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

Def.Module_VesselSwitchBack = 
{
	class = "ReserveSpaceShip",
	class_mask = ai.ShipClass.LARGE,
	default_icon = "ItemSubtype_VesselSwitch2",
	cooldown = 35,
	in_editor = false,
	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.VesselSwitch,
	tier = 4,
	-- stealth_param1 = -100,
	-- stealth_param2 = 1,
	uiDesc = "Module_VesselSwitchBack_Desc",
	uiName = "Module_VesselSwitch",
	
	controlled_returning_ship = true,
	

	return_sound 			= "sound/gadgets/VesselSwitch/vs_back",
	fuel_transfer_amount = 20,
}

--Прототип #74578
Def.PlasmaWeb_MoveRestrictor = 
{
	activate_beam_fx = "particles/gadget/plasma_web_beam_once",
	activate_sound = "sound/gadgets/plasmaweb_shot",
	class = "ActiveModule",
	cooldown = 10,
	default_icon = "ItemSubtype_PlasmaWeb",
	energy_cost = 50,
	item_subtype = ItemSubtype.PlasmaWeb,
	module_type = ai.ModuleType.SPECIAL,
	spell = "PlasmaWeb_T4_Base",
	additional_spell = "PlasmaWebRestrictor",
	uiDesc = "Special_PlasmaWeb_Base_Desc",
	uiName = "Special_PlasmaWeb_Base",
}

Def.TestModule_GreenEngineerScrap =
{
	cant_be_bought = true,
	hide_from_player = true,
	
	class				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	
	item_subtype		= ItemSubtype.CloakingDevice,
	
	ui_name				= "Cloaking Device",
	
	uiName 				= "Special_CloakingDevice_Base",
	uiDesc 				= "Special_CloakingDevice_Base_Desc",
	
	cooldown			= 2,
	
	ammo				= 3, -- максимальное количество патронов
	ammo_regen_time		= 30, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	ammo_regen_max		= 1, 
	ammo_start			= 0, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	scrap_spawn_distance = 500, -- расстояние для спавна бонуса
	--trigger_aura			= true,
	spell				= "Cloaking",
	
--  activate_effect		= "particles/weapons/ship_explosion",
	activate_sound		= "sound/gadgets/stealth_on",
	deactivate_sound	= "sound/gadgets/stealth_off",
--	work_sound			= "",

	default_icon		="ItemSubtype_CloakingDevice",
}

Def.Module_GreenDrones = --спецмодуль зеленого инженера
{
	class				= "FrigateDroneModule",
	class_mask			= ai.ShipClass.LARGE,
	in_editor			= false,
	module_type			= ai.ModuleType.SPECIAL,
	item_subtype			= ItemSubtype.GreenDrones,
	model				= "models/objects/green_drones/green_drones_orbits",
	
	damage_emp			= 100,
	fire_rate			= 100,
	damage_to_heal_coef		= 0.3,
	dispersion			= 0,
	optimal_range			= 150,
	max_range			= 200,
	activate_entity_health			= 3000,
	drone_num			= 4,
	projectile 			= "Projectile_Dron_Plasma",
	projectile_speed 		= 320,
	-- drone_respawn_period	 	= 1, --не работает, число дронов = числу деталей
	activation_projectile		= "GreenDroneRocket",
	drone_def			= "GreenFrigateDrone",
	
	no_friendly_fire 	= true,
	
	-- uiName 				= "Special_CloakingDevice_Base",
	-- uiDesc 				= "Special_CloakingDevice_Base_Desc",
	cooldown			= 7,	
	ammo				= 4, -- максимальное количество патронов
	ammo_regen_time		= 27,--30, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	ammo_regen_max		= 2, 
	ammo_start			= 0, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	scrap_spawn_distance = 400, -- расстояние для спавна бонуса
	--trigger_aura			= true,
	-- spell				= "Cloaking",	
--	activate_sound		= "sound/el_modules/ElCommonActivate",
	default_icon		="ItemSubtype_GreenDrones",
	need_scrap			= true,
}

Def.GreenDroneRocket = 
{
	model				= "models/objects/green_drones/dron_shooter",
	angular_velocity 	= 100,
	cant_be_bought 		= true,
	class 				= "Rocket",
	default_icon 		= "ItemSubtype_GreenDrones",
	detonation_radius 	= 8,
	effect 				= "particles/gadget/green_drone_rocket_engine",
	explosion_blast_wave = "Blastwave_GreenDroneRocket",
	flare_angle 		= 180,
	flare_aspect 		= 1,
	flare_color 		= "255 150 100 5",
	flare_nebulosity 	= 0.2,
	flare_occl_size 	= 1,
	flare_size 			= 0,
	flare_warp			= 0.1,
	impact_type 		= "rocket",
	in_editor 			= false,
	is_guided 			= true,
	launch_sound 		= "sound/el_modules/gd_rocket_launch",
	max_range 			= 400,
	-- module_type = 3,
	speed 				= 150,
	work_sound 			= "sound/weapons/rockets/rocket_nurs_fly",
	spell 				= "GreenDroneHealMult",
	children 			=
		{
				{ 	effect	="particles/gadget/drone_shooter_engine", joint = "fx1" },
		},
	uiName = "Projectile_GreenDroneRocket",
}

Def.Blastwave_GreenDroneRocket = 
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 35,
	class = "BlastWave",
	damage_emp = 1000,
	effect = "particles/explosions/big_fire_alien_2",
	in_editor = false,
	light_color = "140 240 140 100",
	light_radius = 15,
	light_time = 0.9,
	sound 	= "sound/explosion/rocket_expl",
	self_damage_coef = 0,
}

Def.Module_FollowerDrone = --спецмодуль зеленого инженера #71601
{
	-- cant_be_bought = true,
	hide_from_player	= true,	
	class				= "FrigateDroneModule",
	in_editor			= false,	
	module_type			= ai.ModuleType.SPECIAL,	
	item_subtype		= ItemSubtype.FollowerDrone,	
	model				= "models/objects/green_drones/green_drones_orbits",
	-- ui_name				= "Cloaking Device",	
	-- uiName 				= "Special_CloakingDevice_Base",
	-- uiDesc 				= "Special_CloakingDevice_Base_Desc",	
	cooldown			= 1,	
	ammo				= 4, -- максимальное количество патронов
	ammo_regen_time		= 18, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	ammo_regen_max		= 2, 
	ammo_start			= 1, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	scrap_spawn_distance = 500, -- расстояние для спавна бонуса
	drone_num			= 4,
	--trigger_aura			= true,
	spell				= "SendDrone",
	activate_sound			= "sound/el_modules/gd_rocket_launch",
	additional_spell		= "DroneHealAlly",
	drone_def			= "GreenFrigateDroneAssistant",
	activate_entity_health			= 3000,
	
	damage_thermal			= 100,
	fire_rate			= 100,
	dispersion			= 0,
	optimal_range			= 150,
	max_range			= 200,
	damage_to_shield_coef		= 0.3,
	projectile 			= "Projectile_Dron_Plasma_Green",
	projectile_speed 	= 550,
	need_scrap			= true,
	tooltip_param_drone_coef	= 0.4, --нужно только для тултипа
}

Def.Module_SendDrone = --дебажный модуль для #71601
{
	class = "ActiveModule",
	cooldown = 10,
	item_subtype = ItemSubtype.PlasmaWeb,
	spell = "SendDrone",
}

Def.Module_UntouchableGhost = --спецмодуль зеленого инженера --#71636
{
	-- cant_be_bought = true,
	hide_from_player = true,	
	class				= "FrigateDroneModule",
	in_editor			= false,	
	module_type			= ai.ModuleType.SPECIAL,	
	item_subtype		= ItemSubtype.CloakingDevice,
	model				= "models/objects/green_drones/green_drones_orbits",
	activate_drone_effect	= "particles/gadget/drone_overcharge",
	-- ui_name				= "Cloaking Device",	
	-- uiName 				= "Special_CloakingDevice_Base",
	-- uiDesc 				= "Special_CloakingDevice_Base_Desc",	
	cooldown			= 4,	
	ammo				= 4, -- максимальное количество патронов
	ammo_regen_time		= 45, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	ammo_regen_max		= 2, 
	ammo_start			= 1, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	scrap_spawn_distance = 500, -- расстояние для спавна бонуса
	--trigger_aura			= true,
	spell 				= "UntouchableGhostHolder",
	drone_def			= "GreenFrigateDrone",
--  activate_effect		= "particles/weapons/ship_explosion",
--	activate_sound		= "sound/el_modules/UntouchableGhost",
	default_icon		="ItemSubtype_UntouchableGhost",
	need_scrap			= true,
	drone_num			= 4,
	
	damage_thermal			= 100,
	fire_rate			= 100,
	dispersion			= 0,
	optimal_range			= 150,
	max_range			= 200,
	projectile 			= "Projectile_Dron_Plasma_Green",
	projectile_speed 	= 550,
	need_scrap			= true,
}

Def.Module_GreenTurret = --спецмодуль зеленого инженера --#71617
{
	class				= "FrigateDroneModule",
	class_mask			= ai.ShipClass.LARGE,
	in_editor			= false,
	module_type			= ai.ModuleType.SPECIAL,
	item_subtype			= ItemSubtype.GreenDrones,
	model				= "models/objects/green_drones/green_drones_orbits",
	item_subtype		= ItemSubtype.GreenTurret,
	
	damage_thermal		= 100,
	fire_rate			= 100,
	-- damage_to_heal_coef		= 0.66,
	dispersion			= 0,
	optimal_range			= 150,
	max_range			= 200,
	activate_entity_health			= 3000,
	drone_num			= 4,
	projectile 			= "Projectile_Dron_Plasma_Green",
	projectile_speed 		= 320,
	-- drone_respawn_period	 	= 1, --не работает, число дронов = числу деталей
	activation_projectile		= "Projectile_GreenTurretDrone",
	drone_def			= "GreenFrigateDrone",
	
	
	-- uiName 				= "Special_CloakingDevice_Base",
	-- uiDesc 				= "Special_CloakingDevice_Base_Desc",
	cooldown			= 5,	
	ammo				= 4, -- максимальное количество патронов
	ammo_regen_time		= 21,--30, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	ammo_regen_max		= 2, 
	ammo_start			= 0, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	scrap_spawn_distance = 400, -- расстояние для спавна бонуса
	--trigger_aura			= true,
	-- spell				= "Cloaking",	
--	activate_sound		= "sound/el_modules/ElCommonActivate",
	default_icon		="ItemSubtype_GreenDrones",
	need_scrap			= true,
	-- track 				= ai.TrackMode.AIM,
	activation_projectile_is_directed_to_aim = true,
}

Def.Projectile_GreenTurretDrone =
{
	inherit				= "Weapon_BaseRocket",
	--model 				= "models/weapons/bs_torpedo_small",
	--model 				= "models/weapons/bs_torpedo",
	-- model				= "models/turret/huge_module_drone/dron",
	model					= "models/objects/green_drones/dron_shooter",
	--spell 				= "DestrBeamDrone",
	death_entity		= "GreenTurretDrone",
	death_entity_on_static_hit = "GreenTurretDroneStatic",

	explosion_blast_wave = "Blastwave_GreenTurretDrone",
	override_blast_wave_damage = true,
	
	missile_defence_immune 		= true,
	missile_detection_immune 	= true,
	
	detonation_radius	= 10,
	
	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	max_range 			= 350,
	
	work_sound			= "sound/el_modules/GreenTurret_fly",
	is_guided = false,
	
	effect = "particles/gadget/green_drone_rocket_engine",
}

Def.Blastwave_GreenTurretDrone =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 10,
	blast_minDistance	= 5,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/explosions/big_fire_alien_2",
	light_color 		= "255 160 80 100",
	light_radius 		= 12,
	light_time 			= 0.5,
	sound 				= "sound/explosion/PlasmaVolley_expl",
}

Def.GreenTurretDrone =
{
	class					= "GuidedDrone",
	in_editor				= false,
	
	-- model					= "models/turret/huge_module_drone/dron",
	model					= "models/objects/green_drone/green_drone_connected",
	--model					= "models/weapons/drones/sentry_drone/sentry_drone",
	physics					= { solid_type = solid.sphere, material = "Metal", mass = 100,  damping = 0.01, rot_damping = 0.01,  },

	signature				= ai.Signature.TINY,
	health 					= 3750, --500
	ttl						= 30,
	
	
	death_effect			= "particles/explosions/big_fire_alien_2",
	death_sound				= "sound/explosion/drone_expl",
	
	weapon_slots			= 1,
	primary_weapon			= "Weapon_GreenTurretDroneWeaponWeak",
	--projectile				= "Projectile_SentryDron",
	
	max_speed				= 0,
	max_rot_speed			= 180,	-- deg per second, поворот модели дрона (учитывает физику при повороте)
	max_aim_rot_speed		= 180, -- скорость поворота прицела дрона
	
	uiName 					= "GreenTurretDrone_name",
	default_icon			= "ItemSubtype_DestrBeamDrone",
	--дамаг надо указывать в дроне а не в пушке, а то не дамагает
	damage_thermal			= 400,
}

Def.GreenTurretDroneStatic =
{
	class					= "GuidedDrone",
	in_editor				= false,
	
	--model 				= "models/objects/green_drones/dron_shooter",
	--model			= "models/modules/m_class/frigdrone/frigdrone", 
	--model					= "models/turret/huge_module_drone/dron",
	model					= "models/objects/green_drone/green_drone_spider", -- !!!ругается на model token
	--model					= "models/weapons/drones/sentry_drone/sentry_drone",
	physics					= { solid_type = solid.model, material = "ShipMetalMk1", mass = 10000,  damping = 0.01, rot_damping = 0.01,  },

	signature				= ai.Signature.TINY,
	health 					= 7500, --500
	ttl						= 60,
	
	
	death_effect			= "particles/explosions/big_fire_alien_2",
	death_sound				= "sound/explosion/drone_expl",
	
	weapon_slots			= 1,
	--primary_weapon			= "Weapon_LaserBasicDestrDrone",
	primary_weapon			= "Weapon_GreenTurretDroneWeaponStrong", -- основное
	--projectile				= "Projectile_SentryDron",
	relative_aim_default    = Vec3(0, 100, 0),

	max_speed				= 0,
	max_rot_speed			= 0,	-- deg per second, поворот модели дрона (учитывает физику при повороте)
	max_aim_rot_speed		= 180, -- скорость поворота прицела дрона
	
	uiName 					= "GreenTurretDrone_name",
	default_icon			= "ItemSubtype_DestrBeamDrone",
	--дамаг надо указывать в дроне а не в пушке, а то не дамагает
	damage_thermal			= 600,
}

Def.Weapon_GreenTurretDroneWeaponWeak =
{
	inherit 				= "Weapon_Base",
	--class 					= "LaserGun",
	class 					= "AutoGun",
	fire_rate				= 60,

	--model					= "models/objects/green_drone/green_drone_spider",
	--model 					= "models/weapons/assault_railgun/assault1",

	dispersion				= 0,	
	
--	optimal_range			= 230,
--	max_range				= 300,
	projectile_speed		= 600,
	
	optimal_range			= 240,
	max_range				= 320,

	barrel_rot_speed		= 180,
	
	damage_thermal			= 0,
	crit_chance				= 0.0,
	crit_damage				= 0.0,
	
	--model					= "models/weapons/lasers/sniper/l_training",
	module_type				= ai.ModuleType.WEAPON,
	--projectile				= "Projectile_CrystalConeDrone",
	projectile		= "Projectile_GreenWeaponTurretDrone",
	shot_effect 			= "particles/weapons/alien/reaver_gun_muzzle",
	muzzleflash_color = { kinetic = "175 255 175 50", emp = "175 255 175 50", thermal = "175 255 175 50", },
	muzzleflash_radius 		= 5,
	
	-- signature_damage_coefs	= BlastWaveSignatureCoef,
	
	shot_once_sound 		= "sound/el_modules/CrystalConeDrone_shot",
}

Def.Weapon_GreenTurretDroneWeaponStrong =
{
	inherit 				= "Weapon_GreenTurretDroneWeaponWeak",
	model					= "models/objects/green_drone/green_drone_gun",
	fire_rate				= 80,
	dispersion				= 1,
}

Def.Projectile_GreenWeaponTurretDrone =
{
	apply_shake = true,
	class = "Projectile",
	effect = "particles/weapons/alien/reaver_gun_projectile",
	hit_effect = "particles/weapons/alien/reaver_gun_hit",
	hitbox_max = Vec3( 0.1000, 0.1000, 0.1000 ),
	hitbox_min = Vec3( -0.1000, -0.1000, -0.1000 ),
	impact_type = "railgun",
	in_editor = false,
	mass = 0.05,
	shadowCaster = false,
	hit_effect				= "particles/weapons/alien/reaver_gun_hit",
	hit_ship_effect 		= "particles/weapons/alien/reaver_gun_hit",
	hit_shield_effect 		= "particles/weapons/alien/reaver_gun_hit",
	hit_crit_ship_effect 	= "particles/weapons/alien/reaver_gun_hit",
	hit_crit_shield_effect 	= "particles/weapons/alien/reaver_gun_hit",
}

Def.Module_GreenHealThrower = --#71732 спецмодуль, зеленый инженер, кидает хилки
{
    -- class	= "FiringModule",
    -- item_subtype	= ItemSubtype.HealThrower,
	
	class				= "FrigateDroneModule",
	model				= "models/objects/green_drones/green_drones_orbits",
	module_type			= ai.ModuleType.SPECIAL,
	item_subtype		= ItemSubtype.GreenHealThrower,
	
    cooldown	= 6,
	projectile 			= "Projectile_Dron_Plasma_Green",
	projectile_speed 		= 320,
    -- max_range	= 200, -- 3 сек летит. 20 - скорость
	
	damage_thermal		= 100,
	fire_rate			= 100,
	dispersion			= 0,
	optimal_range			= 150,
	max_range			= 200,
    
    ammo	= 4, -- максимальное количество патронов
    ammo_regen_time	= 25,--30, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
    ammo_regen_max	= 2, 
    ammo_start	= 1, -- стартовое кличество патронов (по умолчанию максимальное)
    ammo_cost	= 1, -- стоимость активации (по умолчанию 1)
    
	activation_projectile		= "Projectile_GreenHealThrower", --"GreenDroneRocket",
	
	drone_def			= "GreenFrigateDrone",
	
    -- default_icon = "ItemSubtype_SpaceMissile_Fireworks",
	need_scrap			= true,
    activation_projectile_is_directed_to_aim = true,
}
--
Def.Projectile_GreenHealThrower =
{
    class			= "Rocket", --activation_projectile из FrigateDroneModule стрелять умеет только ракетами
    death_entity	= "Bonus_GreenCrystalHeal",
	
	explosion_blast_wave = "Blastwave_GreenHealThrower", --если не делаем модель
	override_blast_wave_damage = true,
	
	max_range 			= 250,
	speed 				= 150,
    
    missile_detection_immune = true,
    disable_concussion_sound = true,
    missile_defence_immune = true,

	launch_sound = "sound/el_modules/gd_rocket_launch",
	work_sound = "sound/el_modules/GreenTurret_fly",
	
	
	transparent_for_not_friends = true,
    
    -- effect = "particles/objects/bonuses/armor_restore",
    model	= "models/objects/green_drones/dron_shooter",
    -- model	= "models/objects/gameplay/bonuses/armor_restore",
	--use_team_skin = true,
	effect = "particles/gadget/green_drone_rocket_engine",
   -- {
	--	{ effect = { s1 = "particles/objects/bonuses/armor_restore_exp", s2 = "particles/objects/bonuses/quad_damage_exp" }, joint = "joint4" },
   -- }
}

Def.Blastwave_GreenHealThrower = 
{
	inherit			= "Blastwave_GreenTurretDrone",
	blast_maxDistance	= 1.7,
	blast_minDistance	= 1.7,
	apply_damage		= false,
	apply_shake 		= false,
	
}

Def.Bonus_GreenCrystalHeal =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	uiName			= "Bonus_GreenCrystalHeal_name",
	
    -- model	= "models/objects/green_drones/dron_shooter",
    model	= "models/objects/gameplay/bonuses/crystal_armor_restore",

    -- max_detection_distance = 500.0,
	-- vision_radius_coef = 0.5,	
	
	spell_approach	= "Bonus_GreenCrystalHeal",
	spell_approach_trigger_radius = 25.0,
	spell_approach_respawn_timer = 0,
	ttl = 105,
	
	only_for_friends = true,

	death_effect = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
	use_team_skin = true,
	
	children = 
	{
		{ effect = { s1 = "particles/objects/bonuses/alien_armor_restore_exp", s2 = "particles/objects/bonuses/alien_armor_restore_exp_white", default = "particles/objects/bonuses/alien_armor_restore_exp_white" }, joint = "root" },
		{ effect = { s1 = "particles/objects/bonuses/alien_armor_restore", s2 = "particles/objects/bonuses/alien_armor_restore_white", default = "particles/objects/bonuses/alien_armor_restore_white" }, joint = "main" },
	}
}

Def.Module_DestructionPreventor = --спецмодуль зеленого инженера
{
	-- cant_be_bought = true,
	hide_from_player = true,	
	class				= "ActiveModule",
	in_editor			= false,	
	module_type			= ai.ModuleType.SPECIAL,	
	item_subtype		= ItemSubtype.CloakingDevice,	
	ui_name				= "Cloaking Device",	
	uiName 				= "Special_CloakingDevice_Base",
	uiDesc 				= "Special_CloakingDevice_Base_Desc",	
	cooldown			= 2,	
	ammo				= 3, -- максимальное количество патронов
	ammo_regen_time		= 30, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	ammo_regen_max		= 1, 
	ammo_start			= 0, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	scrap_spawn_distance = 500, -- расстояние для спавна бонуса
	--trigger_aura			= true,
	spell				= "Cloaking",	
--  activate_effect		= "particles/weapons/ship_explosion",
	activate_sound		= "sound/gadgets/stealth_on",
	deactivate_sound	= "sound/gadgets/stealth_off",
--	work_sound			= "",
	default_icon		="ItemSubtype_CloakingDevice",
}

Def.DronesModuleTest =
{
	activate_drone_beam_fx = "particles/gadget/drone_beam",
	activate_drone_effect = "particles/gadget/drone_overcharge",
	activate_sound = "sound/gadgets/FrigateDrone/fd_launch",
	class = "FrigateDroneModule",
	class_mask = 4,
	cooldown = 3,
	damage_thermal = 295.425,
	default_icon = "ItemSubtype_FrigateDrone",
	dispersion = 1,
	activate_entity_health = 2169.375,
	drone_num = 8,
	drone_respawn_period = 35,
	energy_cost = 250,
	fire_rate = 100,
	fixedInheritance = true,
	heal_per_second = 125,
	in_editor = false,
	item_lvl = 15,
	item_subtype = 405,
	max_range = 195,
	model = "models/objects/green_drones/green_drones_orbits",
	module_type = 15,
	ods_export = true,
	optimal_range = 150,
	projectile = "Projectile_Dron_Plasma",
	projectile_speed = 430,
	spell = "FrigateDrone_T1_Base",
	tier = 1,
	uiDesc = "Special_FrigateDrone_Base_Desc",
	uiName = "Special_FrigateDrone_Base",
	drone_def = "GreenFrigateDrone",
}

Def.Module_RocketWolfhound =
{
	default_icon = "ItemSubtype_RocketWolfhound",
	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.RocketWolfhound,
	class_mask = ai.ShipClass.MEDIUM,
	tier = 5,

	acceleration_time = 2,
	ammo = 6,
	shoot_mode = ai.FiringModuleShootMode.VOLLEY, --#83218
	volley_size = 2,
	-- barrel_rot_speed = 90,
	-- check_aim_orientation_angle = 180,
	class = "FiringModule",
	cooldown = 35,
	crit_chance = 0,
	damage_thermal = 2000,
	dispersion = 0,
	energy_cost = 100,
	fire_rate = 90,
	-- inherit = "Module_RocketSilo",
	-- long_shot_effects = true,
	-- max_projectiles_per_target = 2,
	max_range = 500,
	-- stop_barrels = 1,
	-- target_cone_angle = 60,
	projectile = "Projectile_RocketWolfhound",
	projectile_speed = 130,
	track = ai.TrackMode.OFFSET,--ai.TrackMode.AIM,
	track_offset = Vec3( 0, 0, -1000 ),
	additional_spell = "WolfhoundOvercharge",
	
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius = 10,
	muzzleflash_time = 1,
	shot_effect = "particles/weapons/destroyer_rocket_start",
	shot_once_sound = "sound/destroyer/RocketSilo_launch",
	
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

Def.Projectile_RocketWolfhound =
{
	inherit				= "Weapon_BaseRocket",
	model 			= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave = "Blastwave_RocketWolfhound",
	override_blast_wave_damage = true,

	detonation_radius	= 8,

	angular_velocity	= 32.5,--50,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_small",
	is_guided 			= true,
	-- random_trajectory	=  true,
}

Def.Blastwave_RocketWolfhound =
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

Def.Module_ChargedPlasmaWeb = 
{
	class 				= "ActiveModule",
	
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	-- class_mask			= ai.ShipClass.HUGE,
	
	-- cooldown			= 6,
	-- energy_cost 		= 745,
	
	activate_sound		= "sound/gadgets2/ChargedPW_activate",		
	item_subtype		= ItemSubtype.ChargedPlasmaWeb,	
	-- default_icon		= "ItemSubtype_ShieldChargesDestr",	
	-- uiName 				= "Module_ShieldChargesDestr",
	-- spell_on_death		= "DamagedCharge",

	spell_on_death_someone	= "ChargeOnKill",
	spell_on_death_trigger_target	= --здесь нужен area = ai.SpellTargetArea.AROUND к spell_on_death_trigger_range
	{
		class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area = ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality = ai.SpellTargetVitality.DEAD,
	},
	spell_on_death_trigger_range	= 350,

	consume_aura		= ai.Aura.CHARGE_SPELL,
	spell				= "ChargedPlasmaWeb",
}

Def.Module_ECMHack1 = 
{
	cant_be_bought = true,
	
	default_icon = "ItemSubtype_ECMHack",
	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.ECMHack,
	class_mask = ai.ShipClass.SMALL,
	tier = 5,
	energy_cost = 90,
	class = "ActiveModule",
	cooldown = 25,
	in_editor = false,
	spell = "EcmHideandHack",
	activate_sound 				= "sound/gadgets/common_activate",
	item_subtype = ItemSubtype.ECMHack,
	
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

Def.Module_ECMHack = 
{
	class				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,
	
	cooldown			= 45.0,
	energy_cost 		= 90.0,
	--energy_cost_per_second = 0.0,
	
	spell				= "BlackoutGenerator",--"BlackoutGenerator",
	additional_spell	= "BlackoutGeneratorGapCloser",
	deactivate_spell	= "ECMHack",--"BlackoutGenerator_Stun",
	
	activate_sound		= "sound/gadgets/blackout/bo_activate",

	item_subtype = ItemSubtype.ECMHack,
	default_icon = "ItemSubtype_ECMHack",
	
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

Def.Module_CloakingDevice_Singularity =
{
	cant_be_bought 		= true,
	class				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.MEDIUM,
	
	item_subtype		= ItemSubtype.LongCloakingDevice,
	
	cooldown			= 25.0,
	energy_cost 		= 120,
	
	--trigger_aura			= true,
	spell				= "CloakingSingularity",
	additional_spell	= "CloakingSingularityN",
	deactivate_spell 	= "Bonus_damage",
	-- deactivate_spell 	= "Bonus_damage",
	
--  activate_effect		= "particles/weapons/ship_explosion",
	activate_sound		= "sound/gadgets/stealth_on",
	deactivate_sound	= "sound/gadgets/stealth_off",
--	work_sound			= "",

	default_icon		="ItemSubtype_LongCloakingDevice",
	
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

--#83796
Def.Module_CoverShieldProto = 
{
	cant_be_bought 		= true,
	class				= "ActiveModule",
	activate_entity		= "CoverShieldProto",
	attach_bone			= "root",
	spawn_offset 		= Vec3( 0, 0, 0 ),
	cooldown			= 20,
	in_editor			= false,

	energy_cost 		= 180,
	--module_type			= ai.ModuleType.SPECIAL,
	--class_mask			= ai.ShipClass.MEDIUM,	
	
	item_subtype		= ItemSubtype.CoverShield,	
	default_icon		= "ItemSubtype_FrontEnergyShield",	
	-- activate_effect 	= "particles/gadget/cover_shield_start",
	-- model				= "models/ships/specialships/ship_ufo/ship_ufo_flaps",
}
Def.Module_CoverShieldProto2 = 
{
	inherit				= "Module_CoverShieldProto",
	activate_entity		= "CoverShieldProto2",
}
Def.Module_CoverShieldProto4 = 
{
	inherit				= "Module_CoverShieldProto",
	activate_entity		= "CoverShieldProto4",
}

Def.CoverShieldProto =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	--class_mask		= ai.ShipClass.MEDIUM,
	
	
	-- damage_to_ship_energy_coef = 0.033333333333,
	damageable 		= true,
	health 			= 50000,
	ttl				= 15,
	
	hack_immune 	= true,

	death_sound		= "sound/explosion/drone_expl",
	default_icon	= "ItemSubtype_FrontEnergyShield",
	
	start_sound  	= 	"sound/destroyer/SShield_activate",
	end_sound	=	"sound/destroyer/SShield_off",
	death_sound	=	"sound/destroyer/SShield_off",
	-- is_shield		= true, --#

	--model			= "models/shields/shield_cover",	
	--model			= "models/shields/turret_shield",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	radar_vison		= ai.ShieldRadarVisionMode.PASS,
	weapon_mode		= ai.ShieldWeaponMode.BLOCK_ENEMY,
	--model			= "models/shields/shield_cover_sphere",
	--physics			= { solid_type = solid.sphere, sphere_radius = 40, kinematic = true, hitbox = true, material = "GiantShield", },

	model			= "models/shields/shield_cover_sphere",
	
	
	is_shield		= true, --#?
	smart_shield_radius	= 32,  --#90547


	-- death_effect	= "particles/gadget/cover_shield_end",
	-- end_effect		= "particles/gadget/cover_shield_end",
	-- uiName 			= "GigantShield",
	show_after 		= 0.2,
	children = 
	{
		{ effect	= "particles/gadget/cover_shield_holder", },
	}
}
Def.CoverShieldProto2 = {
	inherit	=	"CoverShieldProto",
	model			= "models/shields/shield_cover_sphere2",
	smart_shield_radius	= 65,
}
Def.CoverShieldProto4 = {
	inherit	=	"CoverShieldProto",
	model			= "models/shields/shield_cover_sphere4",
	smart_shield_radius	= 130,
}


Def.Module_CoverShield = 
{
	cant_be_bought 		= true,
	class 				= "ActiveModule",
	cooldown			= 5,
	spell				= "CoverShield",
	additional_spell	= "CoverShieldSelfShieldRegen",
	item_subtype		= ItemSubtype.CoverShield,
	model				= "models/ships/specialships/ship_ufo/ship_ufo_flaps",

	activate_sound 		= "sound/ufo_modules/ufo_common_activation",
}

Def.Module_EnhancedShooting = 
{
	class = "ActiveModule",
	cooldown = 28,
	spell = "EnhancedShooting",
	item_subtype = ItemSubtype.EnhancedShooting,
	default_icon = "ItemSubtype_EnhancedShooting",
	-- trigger_aura = true,
	-- energy_cost_per_second = 40,
	activate_sound 		= "sound/gadgets/common_activate",
	energy_cost 		= 350,
	
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

Def.Module_RemoteDisintegrator = --#82982
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	-- model 				= "models/weapons/plasma/power/vortex",
	class				= "RemoteDisintegrator",

	cooldown			= 20,
	energy_cost 		= 185,

	projectile 			= "Projectile_RemoteDisintegrator",
	projectile_speed 	= 480, 
	optimal_range		= 260, 
	max_range			= 260, 
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,

	dispersion			= 0,
	crit_chance			= 0,

	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 0,
	shoot_mode 			= ai.FiringModuleShootMode.SINGLE_SHOT, --#83218

	shot_once_sound 	= "sound/destroyer/RocketSilo_launch",
	default_icon		= "ItemSubtype_RemoteDisintegrator",
	item_subtype		= ItemSubtype.RemoteDisintegrator,
	connection_beam_fx	= "particles/gadget/hack_beam_blue",

	-- Cybersport restrictions
	ods_export		= true,
	storeItemId		= 1,
	tier			= 5,
	item_lvl		= 23,
	rank_min		= 1,
	rank_max		= 17,
	premiumPrice	= 99999,
	cant_be_bought	= true,
--	additional_cmd_activate_sound = "sound/destroyer/RocketSilo_launch",
	additional_cmd_ui_name = "RemoteDisintegrator",
}

Def.Projectile_RemoteDisintegrator = --#82982
{
	inherit				= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave = "Blastwave_RemoteDisintegrator",
	override_blast_wave_damage = true,
	detonation_radius	= 1,

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_small",
	work_sound			= "sound/el_modules/GreenTurret_fly",
	death_entity		= "RemoteDisintegratorDrone",
	
	reflection_immune	= true,
}

Def.Blastwave_RemoteDisintegrator = --#82982
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 5,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 50,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	effect 				= "particles/gadget/rdesintegrator_appear",
	light_color 		= "140 190 255 100",
	light_radius 		= 40,
	light_time 			= 0.5,
	sound 				= "sound/explosion/plasma_rocket_expl",
}

Def.RemoteDisintegratorDrone = --#82982
{
	class					= "GuidedDrone",
	in_editor				= false,

	model					= "models/modules/remote_disintegrator/remote_disintegrator", --
	--model					= "models/weapons/drones/sentry_drone/sentry_drone",
	physics					= { solid_type = solid.sphere, material = "Metal", mass = 100,  damping = 0.01, rot_damping = 0.01,  },

	signature				= ai.Signature.TINY,
	health 					= 5000, --500
	-- ttl						= 30,


	death_effect			= "particles/explosions/big_fire_2",
	death_sound				= "sound/explosion/drone_expl",

	weapon_slots			= 1,
	primary_weapon			= "RemoteDisintegrator",
	--projectile				= "Projectile_SentryDron",

	max_speed				= 0,
	max_rot_speed			= 180,	-- deg per second, поворот модели дрона (учитывает физику при повороте)
	max_aim_rot_speed		= 180, -- скорость поворота прицела дрона

	uiName 					= "RemoteDisintegrator_name",
	default_icon			= "ItemSubtype_DestrBeamDrone",

	owner_distance = 285, -- пп. 7-8
	orphan_time = 0.5, -- пп. 7-8
	vision_radius = 500,
	activate_sound  = "",
	deactivate_sound = "",
}

Def.RemoteDisintegrator = --#82982
{
	class = "Disintegrator",
	cooldown = 3,
	damage_thermal = 9900+3000, -- настроено по "эпическому" оружию +300
	default_icon = "ItemSubtype_Disintegrator",
	fire_rate = 18,
	impact_type = "disintegrator",
	in_editor = false,
	inherit = "Module_Disintegrator",
	max_range = 1200,
	optimal_range = 1000,
	projectile = "Projectile_RDisintegrator",
	projectile_speed = 950,

	spell_on_hit = "SpellOnHit_RemoteDisintegrator",
	zoom_value = 4,
	uiDesc = "Special_Disintegrator_Base_Desc",
	uiName = "Special_Disintegrator_Base",

	aim_beam = "particles/weapons/sniper/targeting",
	aim_flare_angle = 20,
	aim_flare_color = "255 50 50 80",
	aim_flare_nebulosity = 0.5,
	aim_flare_size = 0.4,
	hit_effect = "particles/weapons/sniper/hit",
	shot_beam = "particles/weapons/sniper/beam",

	shot_once_sound = "sound/gadgets/disintegrator/dis_fire",
	activate_sound = "sound/gadgets2/RemoteDisintegrator_activate",
	deactivate_sound = "sound/gadgets2/RemoteDisintegrator_activate",
	ready_sound = "sound/gadgets/disintegrator/dis_ready",
	work_sound = "sound/gadgets/disintegrator/dis_work_loop_p",
	zoom_changed_sound = "sound/gadgets2/AdvancedZoom",
}

Def.Projectile_RDisintegrator = 
{
	apply_shake = true,
	class = "Projectile",
	effect = "particles/weapons/sniper/projectile",
	hit_effect = "particles/weapons/sniper/hit",
	hitbox_max = Vec3( 0.1000, 0.1000, 0.1000 ),
	hitbox_min = Vec3( -0.1000, -0.1000, -0.1000 ),
	impact_type = "disintegrator",
	in_editor = false,
	mass = 0.05,
	shadowCaster = false,
	work_sound = "sound/gadgets/disintegrator/dis_fly",
}

Def.Module_ClusterTorpedo = --#87502
{
	class 				= "GuidedMissileModule",
	class_mask			= ai.ShipClass.LARGE,
	cooldown 			= 16,
	default_icon 		= "ItemSubtype_ClusterTorpedo",
	energy_cost 		= 230,
	-- explosion_blast_wave = "BlastWave_GuidedMissile_T5_Base",
	item_subtype 		= ItemSubtype.ClusterTorpedo,
	module_type 		= ai.ModuleType.SPECIAL,
	projectile 			= "Projectile_ClusterTorpedo",
	explosion_blast_wave = "BlastWave_ClusterTorpedo", -- тут для масштабируемого тултипа

	activate_sound 		= "sound/weapons/rockets/gm_launch",
	
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

Def.Projectile_ClusterTorpedo = 
{
	angular_velocity = 21,
	class = "Rocket",
	death_sound = "sound/explosion/small_rocket_expl",
	detonation_radius = 0,
	effect = "particles/weapons/missile/rocket_trail_mid",
	fixedInheritance = true,
	flare_angle = 180,
	flare_color = "255 100 100 10",
	flare_nebulosity = 0.2,
	flare_size = 0.1,
	impact_type = "rocket",
	in_editor = false,
	inherit = "GuidedMissile",
	jam_screen_effect = "particles/screen/whiteout",
	max_range = 1000,
	model = "models/weapons/missiles/guided_missile",
	rocket_direct_hit_sound = "sound/hit/rocket_direct_hit",
	spectate_work_sound = "sound/weapons/rockets/gm_engine_loop",
	speed = 65,
	spell = "ClusterTorpedo_ThermalDamage_Huge",
	work_sound = "sound/weapons/rockets/gm_rocket_fly",
	-- переехало в модуль explosion_blast_wave = "BlastWave_ClusterTorpedo",
	--explosion_blast_wave = "BlastWave_ClusterTorpedo",

	-- damage_thermal = 8600, --11250 столько урона суммарно надо при попадании всеми наведенными дочерними ракетами, при прямом попадании - меньше 
	-- override_blast_wave_damage = true,

	--функционал разделяющихся боеголовок #84301
	-- detonate_on_distance= 60,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать, неактуально(?) для ракеты, которой управляет игрок
	child_rockets =
	{
	    rocket = "Projectile_ClusterTorpedoC",
	    --rocket = "SpaceMissile_Standart_T1_Mk1",

	    sphere_radius = 3, -- опционально
	    
	    -- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
	    -- Общее количество ракет не должно превышать 20
	    scheme = {
	        circle0 = { amount = 1, angle = 0, },
	        circle1 = { amount = 4, angle = 35, }, -- опционально
	    },

		--описание целей для управляемых ракет. Поддерживается не более 10 целей
		direct_to_target = {
			class 					= ai.SpellTargetClass.SHIP,
			area 					= ai.SpellTargetArea.AROUND,
			relationship 			= ai.SpellTargetRelationship.ENEMY,
			misc					= ai.SpellTargetMisc.NOT_CLOAKED,
	    },
	    direct_range = 300, -- радиус поиска целей для управляемых ракет
	    max_rockets_per_target = 3, -- количество управляемых ракет на одну цель	    
	},
}

Def.Projectile_ClusterTorpedoC =
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_ClusterTorpedoC",
	model				= "models/weapons/bs_torpedo_small",
	detonation_radius	= 6,
	max_range			= 300,  
	speed 				= 78,
	angular_velocity 	= 90,
	is_guided 			= true,
	-- damage_thermal 		= 3750,
	-- override_blast_wave_damage = true,
	
	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "plasma",
}

Def.BlastWave_ClusterTorpedo = 
{
	blast_maxDistance = 18.5,
	blast_minDistance = 15,
	constant_damage = false,
	class = "BlastWave",
	effect = "particles/explosions/explosion_big1",
	fixedInheritance = true,
	in_editor = false,
	inherit = "GuidedMissileBlastWave",
	intensity = 100,
	light_color = "255 100 0 255",
	light_radius = 20,
	light_time = 0.8,
	ods_export = true,
	sound = "sound/explosion/big_rocket_expl",
	damage_thermal = 8000,
}

Def.Blastwave_ClusterTorpedoC = 
{
	apply_damage = true,
	apply_shake = false,
	apply_torque = false,
	blast_maxDistance = 20,
	blast_minDistance = 3,
	class = "BlastWave",
	constant_damage = false,
	effect = "particles/explosions/explosion_big1",
	fixedInheritance = true,
	in_editor = false,
	light_color = "140 140 240 100",
	light_radius = 15,
	light_time = 0.8,
	self_damage_coef = 0,
	sound = "sound/explosion/big_rocket_expl",
	damage_thermal 		= 4500,
}

Def.Module_EnemyModuleWasteCD = 
{
	class = "ActiveModule",
	cooldown = 20,
	spell = "EnemyModuleWasteCDMult",
	item_subtype = ItemSubtype.HackSystems,
}

Def.Module_FrigateDrone_T5_Base_WithBox =
{
	inherit						= "Module_FrigateDrone_T5_Base",
	
	model						= "models/ships/race_3/l/r3_l_hammerhead/r3_l_hammerhead_container_closed",
	--[[
	children = 
	{
		{ model = "models/ships/race_3/l/r3_l_hammerhead/r3_l_hammerhead_container_closed", joint = "root" },
	},
	]]
}

Def.Module_SmallBattleStation =
{
	class						= "BattleStationModule",
	cant_be_bought				= true,
	hide_from_player			= true,
	in_editor					= false,
	
	module_type					= ai.ModuleType.SPECIAL,
	item_subtype				= ItemSubtype.SmallBattleStation,
	
	
	model						= "models/ships/race_3/l/r3_l_hammerhead/r3_l_hammerhead_container_closed",
	module_appear_time			= 1,
	
	cooldown					= 35,
	
	station						= "SmallBattleStation",
	spawn_offset				= Vec3( 0, -3.16, -0.4 ),
	check_spawn_collision 		= true,
	
	default_icon				= "ItemSubtype_SmallBattleStation",
	
	activate_sound				= "sound/el_modules/ElCommonActivate",
	
--	additional_cmd_activate_sound = "sound/destroyer/RocketSilo_launch",
	additional_cmd_ui_name = "BattleStation",
}

Def.SmallBattleStation =
{
	class						= "BattleStation",
	in_editor					= false,
	
	model						= "models/ships/race_3/l/r3_l_hammerhead/r3_l_hammerhead_container",
	physics 					= { solid_type = solid.model, static = true, mass = 90000000, material = "Metal", damping = 0.95,},
	damageable					= true,
	health						= 20000,
	
	fire_sectors				= { 2, 1, 1, 2, 2, 0, 0, 0, 0, 0 },
	
	signature					= ai.Signature.MEDIUM,
	hudType						= "default",
	uiName						= "itemSubType_SmallBattleStation",

	owner_distance				= 200, -- максимальное расстояние до хозяина, на котором станциия находится в "активном сотсоянии" (лечится, строится и т.п.)
	orphan_time					= 360, -- время через которое станция самоуничтожится, если хозяин находится за пределами owner_distance
	appear_time					= 0, -- время появления из эффекта стелса при спавне
	
	orphan_spell				= "BattleStation_SlowMode",

	death_wreck = "",
	death_sound = "sound/explosion/ship_expl",
	death_effect = "particles/explosions/shp_exp_big_02",
	
	--broken_parts = 
	--{
	--	{ def = "Wreck_Station",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.1, dumping = 1.0, speed = 0, speed_deviation = 0, speed_inherit = 1, ttl = 5, },
	--},
	
	slots =
	{
		{
			bones = { 
				{ "gun_f", "gun_b" } 
			},
		},
		{
			bones = { 
				{ "gun_r", "gun_l" } 
			},
			stub = {
				"models/turret/msl_01/msl_01",
			},
		},
		{
			bones = { 
				{ "main", },
			},
			stub = {
				"models/ships/race_3/l/r3_l_hammerhead/projector_stubs",
			},
		},
	},

	upgrades =
	{
		{
			health = 20000,
			heal_cost = 130,
			heal_speed = 160,
			modifications = -- список дефов возможных модификаций, одна из них будет выбрана при апгрейде до этого (не следующего) уровня
			{
				{ 
					def = "SmallBattleStation_Gun", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/weapons/nailgun/nail3", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 0, -- слот, в который устанаваливатся эта модификация
				},
			},
		},
		{
			health = 30000,
			heal_cost = 130,
			heal_speed = 200,
			build_cost = 20, -- количество энергии в секунду, расходуемое хозяином на строительство апгрейда станции
			build_time = 10, -- время апгрейда
			modifications = -- список дефов возможных модификаций, одна из них будет выбрана при апгрейде до этого (не следующего) уровня
			{
				{ 
					def = "SmallBattleStation_Turret_Thermal", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/turret/msl_01/msl_01", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 1, -- слот, в который устанаваливатся эта модификация
				},
				{ 
					def = "SmallBattleStation_Turret_Emp", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/turret/msl_01/msl_01", -- модели для групп костей, должно быть равно количеству групп
					},
					slot = 1, -- слот, в который устанаваливатся эта модификация
				},
			},
		},
		{
			health = 40000,
			heal_cost = 130,
			heal_speed = 250,
			build_cost = 20, -- количество энергии в секунду, расходуемое хозяином на строительство апгрейда станции
			build_time = 10, -- время апгрейда
			modifications = -- список дефов возможных модификаций, одна из них будет выбрана при апгрейде до этого (не следующего) уровня
			{
				{ 
					def = "PlatformModule_BonusSpawner", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_3/l/r3_l_hammerhead/projector",
					},
					slot = 2, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/gadgets2/SmallBattleStation_deploy",
				},
				{ 
					def = "PlatformModule_DroneSpawner", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_3/l/r3_l_hammerhead/projector",
					},
					slot = 2, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/gadgets2/SmallBattleStation_deploy",
				},
				{ 
					def = "PlatformModule_BonusOnDroneSpawner", -- дефы модификаций должны быть без моделей!
					models =
					{
						"models/ships/race_3/l/r3_l_hammerhead/projector",
					},
					slot = 2, -- слот, в который устанаваливатся эта модификация
					deploy_sound = "sound/gadgets2/SmallBattleStation_deploy",
				},
			},
		},
	}
}

Def.SmallBattleStation_Gun =
{
	class						= "AutoGun",
	in_editor					= false,
	
	damage_kinetic				= 1000,
	
	fire_rate					= 60,
	
	crit_chance					= 0.07,
	crit_damage					= 0.5,

	dispersion					= 0.25,
	dispersion_max				= 0.25,
	
	optimal_range				= 200,
	max_range					= 250,
	
	projectile_speed			= 690,
	
	projectile					= "Projectile_SniperRailgun",
	
	shot_effect 				= "particles/weapons/railgun/muzzle_axe",
	shot_once_sound				= "sound/weapons/minigun/minigun",
	muzzleflash_color			= { kinetic = "220 190 120 128", },
	muzzleflash_radius			= 15,
	
	uiName						= "Weapon_Factory_railgun",
	default_icon				= "ItemSubtype_SmallBattleStation",
	ui_ico 						= { target_system 	= { tex = "ItemSubtype_SmallBattleStation", }, },
}

Def.SmallBattleStation_Turret_Thermal =
{
	class						= "Turret",
	in_editor					= false,
	
	damage_thermal				= 3000,
	
	fire_rate					= 20,
	
	crit_chance					= 0,

	dispersion					= 0,
	
	optimal_range				= 250,
	max_range					= 300,
	
	projectile_speed			= 200,
	
	model						= "models/turret/msl_01/msl_01",
	
	projectile					= "Projectile_SmallStationTurret_Thermal",
	
	shot_effect					= "particles/weapons/destroyer_rocket_start",
	shot_once_sound				= "sound/destroyer/RocketSilo_launch",
	muzzleflash_color			= { thermal = "255 214 190 25", },
	muzzleflash_radius			= 10,
	muzzleflash_time 			= 1.0,
	long_shot_effects			= true,
	
	uiName						= "Station_Rockets_Thermal",

	--default_icon				= "Station_ico_Rockets_Thermal",
	default_icon				= "ItemSubtype_SmallBattleStation",
	--ui_ico 						= { target_system 	= { tex = "Station_ico_Rockets_Thermal", }, },
	ui_ico 						= { target_system 	= { tex = "ItemSubtype_SmallBattleStation", }, },
}

Def.Projectile_SmallStationTurret_Thermal =
{
	inherit						= "Weapon_BaseRocket",
	model 						= "models/weapons/bs_torpedo_mid",
	override_blast_wave_damage	= true,

	detonation_radius			= 8,

	angular_velocity			= 40,

	flare_color					= "255 235 180 10",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,
	effect 						= "particles/weapons/missile/destroyer_rocket_trail",
	--is_guided 					= true,
	random_trajectory			= true,
	explosion_blast_wave		= "Blastwave_SmallStationTurret_Thermal",
}

Def.Blastwave_SmallStationTurret_Thermal =
{
	inherit						= "Blastwave_RocketSilo",

	effect						= "particles/explosions/big_fire_2",
	light_color 				= "255 160 80 100",
	light_radius 				= 12,
	light_time 					= 0.5,
	sound 						= "sound/explosion/small_rocket_expl",
}

Def.SmallBattleStation_Turret_Emp =
{
	inherit						= "SmallBattleStation_Turret_Thermal",
	
	damage_thermal				= 0,
	damage_emp					= 2100,
	
	optimal_range				= 300,
	max_range					= 350,
	
	projectile					= "Projectile_SmallStationTurret_Emp",
	
	uiName						= "Station_Rockets_Emp",
	--default_icon				= "Station_ico_Rockets_Emp",
	default_icon				= "ItemSubtype_SmallBattleStation",
	--ui_ico 						= { target_system 	= { tex = "Station_ico_Rockets_Emp", }, },
	ui_ico 						= { target_system 	= { tex = "ItemSubtype_SmallBattleStation", }, },
}

Def.Projectile_SmallStationTurret_Emp =
{
	inherit						= "Projectile_SmallStationTurret_Thermal",
	explosion_blast_wave		= "Blastwave_SmallStationTurret_Emp",
}

Def.Blastwave_SmallStationTurret_Emp =
{
	inherit						= "Blastwave_SmallStationTurret_Thermal",

	effect						= "particles/explosions/expl_1_energy",
	light_color					= "50 100 255 150",
	light_radius				= 20,
	light_time					= 0.8,
	sound						= "sound/explosion/plasma_rocket_expl",
}

Def.PlatformModule_BonusSpawner =
{
	class						= "FactoryModule",
	cant_be_bought				= true,
	hide_from_player			= true,
	in_editor					= false,
	
	--physics					= { solid_type = solid.model, static = true, material = "Metal", },
	
	cooldown					= 25,
	
	bonus_level1				= "PlatformModule_Bonus_Lvl1",
	bonus_level2				= "PlatformModule_Bonus_Lvl2",
	bonus_level3				= "PlatformModule_Bonus_Lvl3",
	
	bonus_upgrade_time			= 10,
	
	spawn_offset				= Vec3( 0, 1.0, 0 ),
	children =
	{
		{ effect = "particles/other/hologram_heal", joint = "root" },
	},
	
	uiName						= "PlatformModule_BonusSpawner",
	--default_icon				= "Station_ico_BonusSpawner",
	default_icon				= "ItemSubtype_SmallBattleStation",
	--ui_ico 						= { target_system 	= { tex = "Station_ico_BonusSpawner", }, },
	ui_ico 						= { target_system 	= { tex = "ItemSubtype_SmallBattleStation", }, },
}

Def.PlatformModule_Bonus_Lvl1 = 
{
	class 								= "SpellCrate",
	in_editor							= false,
	--hudType							= "default",
	--hud_visibility_type 				= "minor",
	--uiName							= "Bonus_HealHull_name",
	
	--model								= "models/objects/gameplay/bonuses/armor_restore_size04",
	model								= "models/misc/invisible_model",

    max_detection_distance				= 500.0,
	vision_radius_coef					= 0.5,
	
	spell								= "Spell_PlatformModule_Bonus_Lvl1",
	active_on_spawn						= true,
	only_for_friends					= true,
	
	use_team_skin						= true,
	uiName								= "PlatformModule_BonusSpawner",
	
	--ttl 								= 75,

	children = 
	{
		--[1] = { effect = "particles/gadget/aura_wave", joint = "root" },
		[1] = { def = "Effects_StationGlow1", joint = "root" },
	},

	death_effect 						= "particles/ships/looted",
	take_sound							= "sound/game/bonus_take",
}

Def.PlatformModule_Bonus_Lvl2 = 
{
	inherit								= "PlatformModule_Bonus_Lvl1",
	spell								= "Spell_PlatformModule_Bonus_Lvl2",
	
	children = 
	{
		[1] = { def = "Effects_StationGlow2", joint = "root" },
	},
}

Def.PlatformModule_Bonus_Lvl3 = 
{
	inherit								= "PlatformModule_Bonus_Lvl2",
	spell								= "Spell_PlatformModule_Bonus_Lvl3",
	
	children = 
	{
		[1] = { def = "Effects_StationGlow3", joint = "root" },
	},
}

Def.PlatformModule_DroneSpawner =
{
	class						= "FactoryModule",
	cant_be_bought				= true,
	hide_from_player			= true,
	in_editor					= false,
	
	--physics					= { solid_type = solid.model, static = true, material = "Metal", },
	
	cooldown					= 25,
	
	drone						= "PlatformModule_Drone",
	max_drones					= 3,
	damage_thermal				= 1000,
	
	spawn_offset				= Vec3( 0, 1.0, 0 ),
	
	uiName						= "PlatformModule_DroneSpawner",
	--default_icon				= "Station_ico_DroneSpawner",
	default_icon				= "ItemSubtype_SmallBattleStation",
	--ui_ico 						= { target_system 	= { tex = "Station_ico_DroneSpawner", }, },
	ui_ico 						= { target_system 	= { tex = "ItemSubtype_SmallBattleStation", }, },
	children =
	{
		{ effect = "particles/other/hologram_drone", joint = "root" },
	},
}

Def.PlatformModule_Drone =
{
	inherit 					= "GuidedDrone",
	in_editor					= false,
	
	signature					= ai.Signature.TINY,
	
	death_effect				= "particles/explosions/shp_exp_small_02",
	death_sound					= "sound/explosion/drone_expl",
	
	max_speed					= 35,
	acceleration				= 20,
	max_rot_speed				= 200,	-- deg per second
	max_aim_rot_speed			= 300,
	
	control_range				= 350,
	
	fire_rate					= 80,
	dispersion					= 1,
	optimal_range				= 50,
	max_range					= 100,
	projectile_speed			= 200,
	
	shot_effect 				= "particles/weapons/drongun/muzzle_frigate",
	shot_once_sound 			= "sound/gadgets/FrigateDrone/fd_shot_once",

	ttl 						= 90,
	health						= 8000,
}

Def.PlatformModule_BonusOnDroneSpawner =
{
	class						= "FactoryModule",
	cant_be_bought				= true,
	hide_from_player			= true,
	in_editor					= false,
	
	--physics						= { solid_type = solid.model, static = true, material = "Metal", },
	
	cooldown					= 25,
	
	drone						= "PlatformModule_Drone_Bonus",
	max_drones					= 3,
	damage_thermal				= 1000*0.75,
	spawn_offset				= Vec3( 0, 1.0, 0 ),
	
	parcel						= "PlatformModule_Bonus_OnDrone",
	
	max_health_percent			= 0.50,
	range						= 350,
	
	uiName						= "PlatformModule_BonusDroneSpawner",
	--default_icon				= "Station_ico_BonusDroneSpawner",
	default_icon				= "ItemSubtype_SmallBattleStation",
	--ui_ico 						= { target_system 	= { tex = "Station_ico_BonusDroneSpawner", }, },
	ui_ico 						= { target_system 	= { tex = "ItemSubtype_SmallBattleStation", }, },
	children =
	{
		{ effect = "particles/other/hologram_droneheal", joint = "root" },
	},
}

Def.PlatformModule_Drone_Bonus =
{
	inherit 					= "PlatformModule_Drone",
	
	parcel_attach_offset		= Vec3( 0, 0, -2 ),
	parcel_attach_bone			= "root",
	parcel_detach_range 		= 10,
	parcel_delivered_sound		= "sound/swarm/swarm_activate",
	
	apply_parcel_to_recipient	= true,
	max_speed					= 64,
	
	control_range				= 200,
	
	ttl 						= 90*0.75,
	health						= 8000*0.75,
	
	uiName 						= "AprilDrone_name",
}

Def.PlatformModule_Bonus_OnDrone = 
{
	class 								= "SpellCrate",
	in_editor							= false,
	--hudType							= "default",
	--hud_visibility_type 				= "minor",
	--uiName							= "Bonus_HealHull_name",
	
	model								= "models/objects/gameplay/bonuses/armor_restore_size04",

    max_detection_distance				= 500.0,
	vision_radius_coef					= 0.5,
	
	spell								= "Spell_PlatformModule_Bonus_Drone",
	active_on_spawn						= false,
	only_for_friends					= true,
	
	use_team_skin						= true,
	
	ttl 								= 75,
	
	uiName								= "AprilDrone_name",

	children = 
	{
		--[1] = { effect = { s1 = "particles/gadget/aura_wave", s2 = "particles/null", default = "particles/gadget/aura_wave" }, joint = "root4" },
		[1] = { effect = { s1 = "particles/objects/bonuses/armor_restore_exp", s2 = "particles/null", default = "particles/objects/bonuses/armor_restore_exp" }, joint = "root4" },
		--{ effect = { s1 = "particles/objects/bonuses/armor_restore", s2 = "particles/null", default = "particles/objects/bonuses/armor_restore" }, joint = "joint4" },
	},

	death_effect 						= "particles/ships/looted",
	take_sound							= "sound/game/bonus_take",
}

Def.Module_CommandShieldRecharger = 
{
	class 				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	-- class_mask			= ai.ShipClass.HUGE,
	
	cooldown			= 6,
	energy_cost 		= 200,
	
	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",
	item_subtype		= ItemSubtype.ShieldChargesDestr,
	default_icon		= "ItemSubtype_ShieldChargesDestr",
	uiName 				= "Module_ShieldChargesDestr",
	
	charge_spell_on_damage = "CommandCharge",
	charge_damage		= 1000,
	charge_mask			= ai.ChargeType.DAMAGE_SHIP_SHIELD,
	consume_aura		= ai.Aura.SHIELD_RESIST_ALL,
	spell				= "CommandShieldEnemyEnergySink",
	additional_spell	= "CommandShieldRecharger",
	-- activate_sound		= "sound/gadgets/ShieldChargesDestr/scd_fire",
	-- work_beam_fx		= "particles/gadget/jericho_module_beam",
}

Def.Module_UniqueHardShield = 
{
	class					= "ActiveModule",
	in_editor				= false,
	activate_entity			= "UniqueHardShield",
	activate_entity_ttl		= 15,
	spawn_offset			= Vec3( 0, 0, -14 ),
	--spawn_dir_to_target	= true,
	attach_bone				= "root",
	cooldown				= 1,--16,
	
	spell 					= "Spell_UniqueHardShield",
	spell_on_equip			= "Spell_UniqueHardShield_Passive",
	
	activate_sound		= "sound/destroyer/SShield_activate",
	deactivate_sound	= "sound/destroyer/SShield_off",
	
	--trigger_aura			= true,
}

Def.UniqueHardShield = 
{
	class		= "ScBaseEntity",
	in_editor	= false,
	hack_immune = true,
	model		= "models/shields/uniquehardshield",
	physics		= { solid_type = solid.compound_model, material = "GiantShield", mass = 100, static_collision = false },
	children =
	{
		{ effect		= "particles/gadget/uniquehardshield_start" },
	},
	death_effect	= "particles/gadget/uniquehardshield_start",
	end_effect		= "particles/gadget/uniquehardshield_start",
	weapon_mode		= ai.ShieldWeaponMode.BLOCK_ENEMY,
	radar_vison		= ai.ShieldRadarVisionMode.PASS,
	is_shield_with_ship_collision = true,
	ignore_transparency = true, -- SC-114509
}

Def.Module_SinglePortal =
{
	cant_be_bought 						= true,
	class								= "TeleportGateModule",
	in_editor							= false,
	
	module_type							= ai.ModuleType.SPECIAL,
	
	item_subtype						= ItemSubtype.SinglePortal,

	spawn_offset						= Vec3( 0, 0, -20 ),
	check_collision_box_extents			= Vec3( 0.3, 0.3, 30.0 ), -- для проверки коллизии

	energy_cost 						= 56,
	cooldown							= 40,
	
	activate_sound						= "sound/gadgets2/SinglePortal_activate",
	
	gate								= "SinglePortal",
	straight_teleport					= true, -- если true, то создаются сразу два портала на расстоянии teleport_range_max, если ничего не мешает и на меньшем расстоянии, если есть препятствие.
	teleport_range_min					= 50,
	teleport_range_max					= 550, -- если ноль, то расстояние не ограничено(только для straight_teleport = false)
	teleport_gate_ttl					= 100,
	replace_extra_teleport_lines		= true, -- если true, то старые порталы уничтожаются при превышении максимального количества
	teleport_line_max					= 1, -- максимальное количество открытых телепортов(пар порталов)

	default_icon						= "ItemSubtype_SinglePortal",
	
	-- Cybersport restrictions
	ods_export							= true,
	storeItemId							= 1,
	tier								= 5,
	item_lvl							= 23,
	rank_min							= 1,
	rank_max							= 17,
	premiumPrice						= 99999,
	cant_be_bought						= true,
}

Def.SinglePortal = 
{
	class								= "TeleportGate",
	in_editor							= false,
	
	model								= "models/shields/teleport_single",
	--effect 							= "particles/gadget/teleport_object",
	--death_effect						= "particles/gadget/uniquehardshield_start",
	--end_effect						= "particles/gadget/uniquehardshield_start",
	
	hudType								= "default",
	hud_visibility_type 				= "major",
	uiName 								= "SinglePortalGate",
	damageable							= false,
	
	teleport_cooldown					= 10,
	teleport_check_box_scale			= 0.6*1.7,
	--teleport_last_damage_time_min		= 5,
	teleport_reset_control				= false, -- если true, то корабль после телепорта корабль будет иметь нулевую скорость и будет направлен от ворот
	teleport_offset						= -3, -- дополнительное смещение корабля в направлении от ворот
	
	teleport_owner_only					= true,
	in_fx 							= "particles/gadget/teleport",
	out_fx 							= "particles/gadget/teleport",
	in_sound						= "sound/gadgets2/PortalGate_warp",
	out_sound						= "sound/gadgets2/PortalGate_warp",
	work_sound 						= "sound/gadgets2/SinglePortal_start_loop",
	use_team_skin						= true,
	
	children = 
	{
		{ effect = { s1 = "particles/gadget/teleport_object", s2 = "particles/gadget/teleport_object_enemy", default = "particles/gadget/teleport_object" }, joint = "root" },
	}
}

Def.Module_BulletTime = 
{
	class				= "ActiveModule",
	spell				= "Spell_BulletTime",
	cooldown			= 28,
	energy_cost 		= 300,
	
	module_type			= ai.ModuleType.SPECIAL,
}

Def.Module_CookSpeedUp =
{
	cant_be_bought 		= true,
	class				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	
	item_subtype		= ItemSubtype.CookSpeedUp,
	
	cooldown			= 40,
	energy_cost 		= 120,
	
	spell				= "Spell_CookSpeedUp",
	
	activate_sound		= "sound/gadgets2/CookSpeedUp_activate",

	default_icon		= "ItemSubtype_CookSpeedUp",
	
	-- Cybersport restrictions
	ods_export			= true,
	storeItemId			= 1,
	tier				= 5,
	item_lvl			= 23,
	rank_min			= 1,
	rank_max			= 17,
	premiumPrice		= 99999,
	cant_be_bought		= true,
}

Def.Module_Engineer_PhaseBuff =
{
	cant_be_bought 					= true,
	class							= "PhaseModule",
	in_editor						= false,
	
	module_type						= ai.ModuleType.SPECIAL,
	
	cooldown						= 0.5,
	energy_cost 					= 120,
	
	spell0 							= "Spell_Engineer_PhaseBuff0",
	spell1							= "Spell_Engineer_PhaseBuff1",
	spell2 							= "Spell_Engineer_PhaseBuff2",
	
	activate_effect					= "",
	activate_module_effect			= "",
	activate_sound					= "sound/gadgets/PhaseShield/ps_activate",

	item_subtype					= ItemSubtype.EngineerPhaseBuff,
	default_icon					= "Module_Engineer_PhaseBuff_Phase0",
	ui_ico_0						= { target_system = { tex = "Module_Engineer_PhaseBuff_Phase0", }, },
	ui_ico_1						= { target_system = { tex = "Module_Engineer_PhaseBuff_Phase1", }, },
	ui_ico_2						= { target_system = { tex = "Module_Engineer_PhaseBuff_Phase2", }, },
	
	-- Cybersport restrictions
	ods_export						= true,
	storeItemId						= 1,
	tier							= 5,
	item_lvl						= 23,
	rank_min						= 1,
	rank_max						= 17,
	premiumPrice					= 99999,
	cant_be_bought					= true,
}

Def.Module_VesselSwitch_Double = 
{
	cant_be_bought 					= true,
	class							= "ReserveSpaceShip",
	in_editor						= false,
	
	module_type						= ai.ModuleType.SPECIAL,
	
	cooldown						= 30,
	energy_cost 					= 200,
	
	bot_respawn_time				= 35,
	
	spaceship						= "Ship_Race3_M_T5_CraftUniq_small",
	spaceship2						= "Ship_Race3_M_T5_CraftUniq_small_2",

	item_subtype					= ItemSubtype.VesselSwitchDouble,
	default_icon					= "ItemSubtype_VesselSwitch_Double",
	model							= "models/ships/race_3/m/tornado/r3_m_tornado_one",
	--explosion_danger_effect		= "particles/gadget/explosion_alarm",

	activate_sound 					= "sound/gadgets2/VesselSwitchBack/vsb_activate",

}

Def.Module_VesselSwitchBack_Double = 
{
	cant_be_bought 					= true,
	class							= "ReserveSpaceShip",
	in_editor						= false,
	
	module_type						= ai.ModuleType.SPECIAL,
	
	cooldown						= Def.Module_VesselSwitch_Double.cooldown,
	
	reserve_spaceship				= Def.Module_VesselSwitch_Double.spaceship,
	reserve_spaceship2				= Def.Module_VesselSwitch_Double.spaceship2,
	bot_respawn_time				= 35,
	bot_respawn_offset				= 10,
	ai_preset						= "Bot_Tornado",

	item_subtype					= ItemSubtype.VesselSwitchDouble,
	default_icon					= "ItemSubtype_VesselSwitch_Double2",
	uiDesc							= "itemSubType_VesselSwitchDouble_desc_2",
	
	in_fx							= "particles/gadget/teleport",
	out_fx							= "particles/gadget/teleport",
	switch_screen_fx				= "particles/screen/glitch",

	in_sound					= "sound/gadgets2/VesselSwitchBack/teleporter_in",
	out_sound					= "sound/gadgets2/VesselSwitchBack/teleporter_out",
	switch_sound					= "sound/gadgets2/VesselSwitchBack/vsb_switch",

--	activate_sound 					= "sound/gadgets/VesselSwitch/vs_activate",
	return_sound 					= "sound/gadgets2/VesselSwitchBack/vsb_back",
}

Def.Module_DisintegratorRay_Landing = 
{
	cant_be_bought 					= true,
	class 							= "LandChargeLaser",
	in_editor 						= false,
	
	module_type						= ai.ModuleType.SPECIAL,
	
	cooldown						= 5,
	energy_cost						= 150,
	
	damage_thermal					= 4500,
	
	fire_rate						= 30,
	
	optimal_range					= 1200,
	max_range						= 1200,
	
	laser_activation_time			= 4, -- время перехода в режим дезинтегратора
	
	charging_time					= 0.6, -- время расхода зарядки
	charging_damage_coef			= 0.10, -- коэффициент урона в режиме зарядки
	charging_fire_rate				= 200, -- с какой будут отображаться значения урона в режиме зарядки
	
	barrel_rot_speed_fire			= 1120, -- скорость поворота луча в заряженном состоянии
	barrel_rot_speed_charged_coef	= 1, -- коэффициент скорости поворота в начале зарядки
	
	max_speed 						= 60, -- допустимая скорость посадки,
	landing_max_range 				= 35, -- максимальная высота над поверхностью [1, 100],
	landing_max_angle 				= 45, -- максимальный угол от нормали к поверхности [1, 45],
	landing_pos_offset 				= 1.6,  -- высота корабля над поверхностью, когда корабль посажен.
	
	item_subtype					= ItemSubtype.LandingDisintegrator,
	
	spell 							= "Spell_LandingDisintegrator",
	spell_on_hit					= "Spell_LandingDisShot",
	
	
	
	default_icon					= "ItemSubtype_LandingDisintegrator",
	ui_ico_0						= { target_system = { tex = "ItemSubtype_LandingDisintegrator", }, },
	ui_ico_1						= { target_system = { tex = "Action_Landing", }, },
	
	impact_type 					= "disintegrator",
	
	zoom_value						= 3.0,
	
	damage_color 					= { kinetic = "255 213 128 255", emp = "60 102 227 255", thermal = "227 60 60 255", },
	muzzleflash_color				= { thermal = "255 128 128 255", },
	beam_fx							= "particles/weapons/laser/laser_fusion_beam",
	fire_fx							= "",
	hit_fx							= "particles/weapons/laser/hit",
	shot_beam_fx					= "particles/weapons/laser/hercules_ray2",
	
	shot_loop_sound					= "sound/weapons/laser/SpikeOnSpeedLaser",
	shot_once_sound					= "sound/gadgets2/DisintegratorRay_Landing/ds_final_fire",
	work_sound 					= "sound/gadgets/disintegrator/dis_work_loop_p",
	activate_sound 					= "sound/gadgets2/DisintegratorRay_Landing/dr_activate",
	deactivate_landing_sound 			= "sound/gadgets2/DisintegratorRay_Landing/dr_deactivate",
	ready_sound					= "sound/gadgets2/DisintegratorRay_Landing/dr _ready",
	zoom_changed_sound				= "sound/gadgets2/AdvancedZoom",
}

Def.Module_AvengersPlasmaWeb = 
{
	cant_be_bought 					= true,
	class 							= "ActiveModule",
	in_editor 						= false,
	
	module_type						= ai.ModuleType.SPECIAL,
	
	cooldown						= 45,
	energy_cost						= 45,
	
	spell							= "AvengersPlasmaWeb",
	additional_spell				= "AvengersPlasmaWeb_MoveRestrictor",
	
	item_subtype					= ItemSubtype.AvengersPlasmaWeb,
	default_icon					= "ItemSubtype_PlasmaWeb",

	activate_beam_fx				= "particles/gadget/plasma_web_beam_once",
	activate_sound					= "sound/gadgets/plasmaweb_shot",
}

Def.Module_AvengersTimeBoost = 
{
	cant_be_bought 					= true,
	class 							= "ActiveModule",
	in_editor 						= false,
	
	module_type						= ai.ModuleType.SPECIAL,
	
	cooldown						= 35,
	energy_cost						= 70,
	
	spell							= "AvengersTimeBoost",
	
	item_subtype					= ItemSubtype.AvengersTimeBoost,
	default_icon					= "ItemSubtype_TimeBoost",

	activate_sound					= "sound/gadgets/timeboost_on",
}

Def.Module_AvengersGuidedMissile = 
{
	cant_be_bought 					= true,
	class 							= "GuidedMissileModule",
	in_editor 						= false,
	
	module_type						= ai.ModuleType.SPECIAL,

	item_lvl						= 19,
	
	cooldown						= 12,
	energy_cost						= 190,

	projectile						= "AvengersGuidedMissile",
	explosion_blast_wave			= "BlastWave_AvengersGuidedMissile",
	
	item_subtype					= ItemSubtype.AvengersGuidedMissile,
	default_icon					= "ItemSubtype_GuidedMissile",

	activate_sound					= "sound/weapons/rockets/gm_launch",
}

Def.AvengersGuidedMissile = 
{
	inherit 						= "GuidedMissile_T3",
	spell 							= "AvengersGuidedMissile",
}

Def.BlastWave_AvengersGuidedMissile =
{
	inherit							= "BlastWave_GuidedMissile_T3_Base",
	damage_thermal					= 11000, --6200
}

Def.Module_BackShieldModule = 
{
	cant_be_bought 					= true,
	class 							= "BackShieldModule",
	in_editor 						= false,
	
	activate_entity					= "BackShield",
	module_type						= ai.ModuleType.SPECIAL,
	
	spell 							= "Spell_BackShield",
	spell_on_equip					= "Spell_BackShield_Resist_Passive",
	
	ignore_silence					= true,
	
	cooldown						= 15,
	energy_cost						= 300,
	
	dead_zone_angle 				= 8,
	radius 							= 12,
	max_rot_speed					= 50,	--макс скорость поворота щита --было 40
	max_parent_speed 				= 3,  	--при какой скорости корабля достигается max скорость поворота щита --было 1
	
	item_subtype					= ItemSubtype.BackShieldModule,
	default_icon					= "ItemSubtype_BackShieldModule",

	activate_sound					= "sound/gadgets2/BackShieldModule_activate",
	deactivate_sound				= "sound/destroyer/SShield_off",
}

Def.BackShield = 
{
	class							= "ScBaseEntity",
	in_editor						= false,
	hack_immune 					= true,
	model							= "models/shields/shield_raven",
	physics							= { solid_type = solid.model, material = "GiantShield", kinematic = true, hitbox = true, },
	--[[children =
	{
		{ effect					= "particles/gadget/uniquehardshield_start" },
	},
	death_effect					= "particles/gadget/uniquehardshield_start",
	end_effect						= "particles/gadget/uniquehardshield_start",
	]]
	
	ttl 							= 15, --при изменении поменять в Spell_BackShield и Spell_BackShield_Speed

	weapon_mode						= ai.ShieldWeaponMode.BLOCK_ENEMY,
	radar_vison						= ai.ShieldRadarVisionMode.PASS,
	is_shield						= true,
}


Def.Module_LandingMultiPlatformModule =
{
	class						= "LandingMultiPlatformModule",
	
	platform_1_bone = "platform",
	platform_2_bone = "platform1",
	platform_3_bone = "platform2", --2
	platform_4_bone = "platform3", --3
	
	energy_cost						= 500,

	drone						= "LandingMultiPlatform_Drone",
	drone_prodaction_time		= 25, --25,
	drone_guard_range			= 100, -- радиус охранной зоны, в пределах которой дрон защищает корабль, если он не посажен на платформу и модуль не активирован.
	drone_control_range			= 500, -- радиус зоны, в пределах которой дрон может атаковать цель, когда модуль активирован
	drone_pos_offset			= Vec3( 0, 1.08, 0 ),
	drone_landing_range			= 75,
	
	--spell_on_guest				= "", --???
	--spell_on_parent 			= "LandingPlatform_Buff2Parent4Guest", -- спелл когда на платформе сидит алли
	--spell_on_landed_ship 		= "LandingPlatform_Buff2GuestShip",   -- спелл на гостя - алли -- референс со спела LandingPlatform_Buff2Guest
	--spell_on_drone_take_off 	= "LandingPlatform_Buff2Drone",  -- только что взлетевший дрон жарит ярче
	
	spell_depends_on_guests		= "LandingPlatform_Buff2Parent4AllyNearby", -- перенакладывается, если что-то взлетает или садиться с платформ модуля или с LandingPlatformModule
	work_spell	 				= "LandingPlatform_Buff2Landed", -- вместо spell_on_equip
	additional_work_spell		= "LandingPlatform_CastBoostAlly",
	spell_on_landed_drone 		= "LandingPlatform_Heal2Drone_Emperor",   -- спел на дронов, пока сидят на платформе
	
	default_icon				= "ItemSubtype_LandingMultiPlatformModule",

	interaction_distance 		= 15,
	interacting_fx				= "particles/gadget/drone_beam", 
	uiInteract					= "Capture_ShieldGenerator",
	
	--additional_cmd_activate_sound 	= "sound/gadgets2/lp_add_activate",
	additional_cmd_ui_name 			= "LandingMultiPlatformModule",
	additional_cmd_cooldown 		= 7,

	out_sound			= "sound/gadgets2/LandingMultyPlatform/lmp_landing",
	take_off_sound			= "sound/gadgets2/LandingMultyPlatform/lmp_takeoff",
	activate_attack_sound 		= "sound/gadgets2/LandingMultyPlatform/lmp_activate",
	deactivate_attack_sound		= "sound/gadgets2/LandingMultyPlatform/lmp_deactivate",

	in_fx						= "particles/gadget/teleport",
	out_fx						= "particles/gadget/teleport",
	landed_entity_fx			= "particles/gadget/landing_platform/landing_platform",
	item_subtype				= ItemSubtype.LandingMultiPlatformModule,
	
	rot_params = {
		[ai.ShipClass.SMALL]	= { rot_max_speed = 100, rot_accel = 100, rot_decel = 300, },
		[ai.ShipClass.MEDIUM]	= { rot_max_speed = 65, rot_accel = 65, rot_decel = 195, },
		[ai.ShipClass.LARGE]	= { rot_max_speed = 25, rot_accel = 25, rot_decel = 75, },
	},
	
	ui_ico_0 = { target_system 	= { tex = "ItemSubtype_LandingMultiPlatformModule", }, },
    ui_ico_1 = { target_system 	= { tex = "ItemSubtype_LandingMultiPlatformModuleActive", }, },
}

Def.LandingMultiPlatform_Drone =
{
	class					= "GuidedDrone",
	in_editor				= false,

	model					= "models/weapons/drones/sentry_drone/sentry_drone",
	--model					= "models/objects/green_drones/dron_shooter", -- too small 1.2
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },

	death_effect			= "particles/explosions/shp_exp_small_02",
	death_sound				= "sound/explosion/drone_expl",

	projectile				= "Projectile_SentryDron",
	shot_effect 			= "particles/weapons/drongun/muzzle",

	signature				= ai.Signature.SMALL,
	health 					= 4000, --1000

	max_speed				= 27,--30,
	acceleration			= 10,
	max_rot_speed			= 180,	-- deg per second --
	max_aim_rot_speed		= 420,  -- скорость поворота дрона по его оси  -- если меньше 400 то дрон иногда не успевает доворачивать и никогда не стреляет.

	weapon_slots			= 1,
	primary_weapon			= "Weapon_LandingMultiPlatform_Drone",

	damage_thermal			= 1300, --1100
	fire_rate				= 45, --10
	dispersion				= 1.5,
	optimal_range			= 150,
	max_range				= 180,
	projectile_speed		= 650,

	control_range			= 460,	--530,
	teleport_dist			= 550,		-- расстояние с которого дрон телепортируется, если следует за кораблем, работает только если есть CompanionDroneModule
	--spell 					= "Companion_Debuff",		-- спел который накладывает дрон на target, работает только если есть CompanionDroneModule

	hudType					= "default",

	uiName 					= "MultiCompanion_name",
	-- эффект двигателя
	-- children 			=
		-- {
				-- { 	effect	="particles/gadget/drone_shooter_engine", joint = "joint1" },
				-- { 	effect	="particles/gadget/drone_shooter_engine", joint = "joint2" },
		-- },
	kill_on_silence_owner	= false,
}

Def.Weapon_LandingMultiPlatform_Drone = {
	inherit					= "Weapon_AutoGun",
	fire_rate				= 45,
	projectile_speed		= 650,
	optimal_range			= 150,
	max_range				= 180,
	crit_chance				= 0,
	crit_damage				= 0,
	
	dispersion				= 1.5,
	projectile				= "Projectile_SentryDron",
	shot_effect 			= "particles/weapons/drongun/muzzle",
	shot_once_sound 		= "sound/weapons/turret/lmp_drone_shot",
	
	default_icon			= "ItemSubtype_LandingMultiPlatformModule",
}

Def.Module_TimeBoostPlusDamage = -- "форсирование систем" на 50%, но кулдаун меньше
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 25,
	energy_cost					= 100,
	
	spell						= "Spell_TimeBoostPlusDamage",
	item_subtype				= ItemSubtype.TimeBoostPlusDamage,
	default_icon				= "ItemSubtype_TimeBoostPlusDamage",

	activate_sound				= "sound/gadgets/timeboost_on",
}

Def.Module_MassPlasmaWeb = -- Плазменная сеть, действующая на нескольких противников
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 35,
	energy_cost					= 50,
	
	spell						= "Spell_MassPlasmaWeb",
	item_subtype				= ItemSubtype.MassPlasmaWeb,
	default_icon				= "ItemSubtype_MassPlasmaWeb",
	
	activate_sound 				= "sound/gadgets/plasmaweb_shot",
	activate_beam_fx			= "particles/gadget/plasma_web_beam_once",
}

Def.Module_PlagueDoctor = -- Спецмодуль для чумного доктора
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 35,
	energy_cost					= 50,
	
	spell						= "PlagueDoctor",
	item_subtype				= ItemSubtype.PlagueDoctor,
	default_icon				= "ItemSubtype_PlagueDoctor",
	
	activate_sound 				= "sound/gadgets2/Overcharge_Prec_activate",
	activate_beam_fx			= "particles/gadget/special/doctor_debuff_beam",
}

Def.Module_SpikedShield = -- Уникальный спецмодуль для эсминца Relic
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	activate_entity			= "SpikedShield",
	spawn_offset			= Vec3( 0, 0, 0 ),
	attach_bone				= "root",
	
	cooldown					= 30,
	energy_cost					= 700,
	
	additional_spell			= "Spell_SpikedShield_Resist",
	item_subtype				= ItemSubtype.SpikedShield,
	default_icon				= "ItemSubtype_SpikedShield",
}

Def.Module_SpikedShield_Switch = -- Уникальный спецмодуль для эсминца Relic
{
	module_type			= ai.ModuleType.SPECIAL,
	class				= "ActiveModule",
	in_editor 					= false,
	cant_be_bought 				= true,

	energy_cost			= 1000,
	--cooldown			= 3,
	
	trigger_aura			= true,
	energy_cost_per_second 	= 220,
	
	activate_entity			= "SpikedShield_Switch",
	spawn_offset			= Vec3( 0, 0, 0 ),
	attach_bone				= "root",

	activate_sound		= "sound/destroyer/SShield_activate",
	deactivate_sound	= "sound/destroyer/SShield_off",
	
	ammo				= 15,-- максимальное количество патронов
	ammo_regen_time		= 4, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	--ammo_regen_max		= 10, 
	ammo_start			= 15, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 0, -- стоимость активации (по умолчанию 1)
	ammo_cost_per_second= 1, -- раз в секунду отнимается указанное число ammo
	
	spell		= "Spell_SpikedShield_Switch_Resist",
	additional_spell = "Spell_SpikedShield_Switch_ShieldRegen",
	
	item_subtype			= ItemSubtype.SpikedShield_Switch,
	default_icon			= "ItemSubtype_SpikedShield",
}

Def.SpikedShield = 
{
	class				= "ScBaseEntity",
	in_editor			= false,
	hack_immune 		= true,
	model				= "models/shields/shield_reflect3",
	physics				= { solid_type = solid.sphere, sphere_radius = 18, material = "GiantShield", kinematic = true, hitbox = true, },
	
	children =
	{
		{ effect		= "particles/gadget/reflect_start" },
	},
	death_effect		= "particles/gadget/reflect_start",
	end_effect			= "particles/gadget/reflect_start",
	use_team_skin 	= true,
	
	
	ttl 				= 5, 
	smart_shield_radius	= 18,--16
	weapon_mode 		= ai.ShieldWeaponMode.REFLECT_ENEMY,
	radar_vison			= ai.ShieldRadarVisionMode.PASS,
	is_shield			= true,
}

Def.SpikedShield_Switch = 
{
	class				= "ScBaseEntity",
	in_editor			= false,
	hack_immune 		= true,
	model				= "models/shields/shield_reflect3",
	physics				= { solid_type = solid.sphere, sphere_radius = 18, material = "GiantShield", kinematic = true, hitbox = true, },
	children =
	{
		{ effect		= "particles/gadget/reflect_start" },
	},
	death_effect		= "particles/gadget/reflect_start",
	end_effect			= "particles/gadget/reflect_start",
	
	--ttl 				= 5, 
	smart_shield_radius	= 18,
	weapon_mode 		= ai.ShieldWeaponMode.REFLECT_ENEMY,
	radar_vison			= ai.ShieldRadarVisionMode.PASS,
	is_shield			= true,
	ignore_transparency = true, -- SC-114509
	use_team_skin = true,
}


Def.Module_IceShield = -- спецмодуль для корабля на нг 2020
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 45,
	energy_cost					= 350,
	
	spell						= "Spell_IceCast",
	spell_on_equip				= "Spell_Ice_Passive",
	additional_spell			= "Spell_IceTaunt",
	
	item_subtype				= ItemSubtype.IceShield,
	default_icon				= "ItemSubtype_IceShield",
}

Def.IceBlock =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	
	damageable 		= false,
	hack_immune 	= true,
	
	model			= "models/shields/iceshell_l",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "EnergyShield", },
	uiName 			= "FrontEnergyShield",
	default_icon	= "ItemSubtype_FrontEnergyShield",
}

Def.Module_Salyut_EnergyVamp = -- спецмодуль для корабля Салют - выкачивает энергию, замедляет поворот орудий
{
	cant_be_bought 			= true,
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type				= ai.ModuleType.SPECIAL,
	trigger_aura			= true,
	cooldown				= 50,
	energy_cost				= 60,
	play_owner_animation	= true,
	
	spell					= "Spell_Salyut_EnergyVamp",
	additional_spell		= "Spell_Salyut_EnergyVamp_Timer",
	
	item_subtype			= ItemSubtype.Salyut_EnergyVamp,
	default_icon			= "ItemSubtype_EnergyVamp",
	
	activate_sound		= "sound/gadgets2/salut_activate",
	deactivate_sound	= "sound/gadgets2/salut_deactivate",
}

Def.Module_Salyut_ForceBooster = -- спецмодуль для корабля Салют - включает буст, уменьшает маневренность
{
	cant_be_bought 			= true,
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type				= ai.ModuleType.SPECIAL,
	trigger_aura			= true,
	cooldown				= 40,
	energy_cost				= 120,
	play_owner_animation	= true,
	
	additional_spell		= "Spell_Salyut_ForceBooster_Timer",
	spell					= "Spell_Salyut_ForceBooster",
	
	item_subtype			= ItemSubtype.Salyut_ForceBooster,
	default_icon			= "ItemSubtype_ForceBooster",
	
	activate_sound		= "sound/gadgets2/salut_activate",
	deactivate_sound	= "sound/gadgets2/salut_deactivate",
}

Def.Module_Salyut_SystemsCrash = -- спецмодуль для корабля Салют - выкачивает энергию, замедляет поворот орудий
{
	cant_be_bought 			= true,
	class 					= "ActiveModule",
	in_editor 				= false,
	module_type				= ai.ModuleType.SPECIAL,
	trigger_aura			= true,
	cooldown				= 40,
	energy_cost				= 120,
	play_owner_animation	= true,
	
	additional_spell		= "Spell_Salyut_SystemsCrash_Timer",
	spell					= "Spell_Salyut_SystemsCrash",
	
	item_subtype			= ItemSubtype.Salyut_SystemsCrash,
	default_icon			= "ItemSubtype_SystemsCrash",
	
	activate_sound		= "sound/gadgets2/salut_activate",
	deactivate_sound	= "sound/gadgets2/salut_deactivate",
}

Def.Module_MoleSendDrone = 
{
	hide_from_player	= true,	
	class				= "FrigateDroneModule",
	in_editor			= false,	
	module_type			= ai.ModuleType.SPECIAL,	
	
	item_subtype		= ItemSubtype.MoleSendDrone,	
	default_icon		= "ItemSubtype_MoleSendDrone",
	
	model				= "models/objects/green_drones/green_drones_orbits",
		
	energy_cost 		=120,
	
	cooldown			= 10,	
	ammo				= 2, -- максимальное количество патронов
	ammo_regen_time		= 20, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	ammo_regen_max		= 2, 
	ammo_start			= 0, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	drone_num			= 2,
	
	spell				= "Spell_Mole_SendDrone",
	activate_sound			= "sound/el_modules/gd_rocket_launch",
	--additional_spell		= "Spell_Mole_EmergencySpell",
	drone_def			= "MoleDrone_OnParent",
	activate_entity_health			= 3000,
	heal_per_second	= 120,
	
	drone_prj			= "MoleDrone", -- для тултипа
}

Def.MoleDrone_OnParent =
{
	inherit				= "FrigateDrone",
	heal_per_second = 120,
	launch_speed = 140, -- скорость полета в заклинании SEND_SATELLITE
	use_phase_heal_only = true,
}
Def.MoleDrone =
{
	inherit				= "FrigateDrone",
	heal_per_second = 100,
	use_phase_heal_only = true,
	launch_speed = 140, -- скорость полета в заклинании SEND_SATELLITE

	use_phase_heal_only	= true,

	emergency_spell = "Spell_Mole_CastHeal",
	emergency_spell_threshold = 0.3,
	emergency_spell_cooldown = 50,
}

-- Protozan module
Def.Module_ProtozanTorpedo =
{
	class 				= "GuidedMissileModule",
	class_mask			= ai.ShipClass.LARGE,
	cooldown 			= 16, --10
	default_icon 		= "ItemSubtype_ProtozanTorpedo",
	energy_cost 		= 300,
	-- explosion_blast_wave = "BlastWave_GuidedMissile_T5_Base",
	item_subtype 		= ItemSubtype.ProtozanTorpedo,
	module_type 		= ai.ModuleType.SPECIAL,
	projectile 			= "Projectile_ProtozanTorpedo",
	explosion_blast_wave = "BlastWave_ProtozanTorpedo", -- тут для масштабируемого тултипа

	activate_sound 		= "sound/weapons/rockets/gm_launch",
	
	-- -- Cybersport restrictions
	-- ods_export		= true,
	-- storeItemId		= 1,
	-- tier			= 5,
	item_lvl		= 23, --параметр используется для маштабирования урона от взрыва
	-- rank_min		= 1,
	-- rank_max		= 17,
	-- premiumPrice	= 99999,
	-- cant_be_bought	= true,
}

Def.Projectile_ProtozanTorpedo = 
{
	inherit = "GuidedMissile",
	class = "Rocket",
	death_sound = "sound/explosion/small_rocket_expl",
	detonation_radius = 0,
	effect = "particles/weapons/missile/rocket_trail_mid",
	fixedInheritance = true,
	flare_angle = 180,
	flare_color = "255 100 100 10",
	flare_nebulosity = 0.2,
	flare_size = 0.1,
	impact_type = "rocket",
	in_editor = false,
	
	jam_screen_effect = "particles/screen/whiteout",
	model = "models/weapons/missiles/guided_missile",
	rocket_direct_hit_sound = "sound/hit/rocket_direct_hit",
	spectate_work_sound = "sound/weapons/rockets/gm_engine_loop",
	spell = "ProtozanTorpedo_ThermalDamage_Huge",
	speed = 65, --65
	angular_velocity = 20, --21
	max_range = 1000,
	boost_maxspeed_coef	= 4,-- коэффициент скорости при бусте, не должен быть меньше единицы;
    boost_accel_time 	= 1,	-- время разгона с обычной скорости до скорости буста, должно быть больше нуля;
    boost_angular_velocity = 5,	-- угловая скорость при бусте, изменения пропорциональны скорости;
	acceleration_time 	= 1,	--время позле запуска, в течении которого ракету нельзя будет разгонять;
	work_sound = "sound/weapons/rockets/gm_rocket_fly",
	-- переехало в модуль explosion_blast_wave = "BlastWave_ProtozanTorpedo",
	explosion_blast_wave = "BlastWave_ProtozanTorpedo",
	explosion_blast_wave_on_hit	= "BlastWave_ProtozanTorpedo",
}

Def.BlastWave_ProtozanTorpedo = 
{
	class = "BlastWave",
	blast_maxDistance = 25,
	blast_minDistance = 25,
	constant_damage = false,
	effect = "particles/explosions/explosion_big1",
	fixedInheritance = true,
	in_editor = false,
	inherit = "GuidedMissileBlastWave",
	intensity = 100,
	light_color = "255 100 0 255",
	light_radius = 20,
	light_time = 0.8,
	ods_export = true,
	sound = "sound/explosion/big_rocket_expl",
	damage_thermal = 14800,
	--blast_maxDistance	= 35,
}

Def.Module_NaglfarClones = 
{
	cant_be_bought 			= true,
	class 					= "ActiveModule",
	in_editor						= false,
	
	module_type						= ai.ModuleType.SPECIAL,
	
	cooldown						= 50,

	
	spawn_bots              = "Ship_bot_Naglfar",
    spawn_bots_radius		= 50, -- начальный радиус сферы для поиска места спавна ботов
    spawn_bots_max_radius   = 70, -- конечный радиус сферы для поиска места спавна ботов
	
    bot_ammo_cost		= 1, -- сколько тратится снарядов на одного бота
    spawn_bots_ttl		= 50, -- время жизни ботов
    ai_preset			= "Bot_Tornado",
	
	ammo				= 8, -- максимальное количество патронов
	ammo_start			= 1, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_regen_max		= -1,
	
	spell_on_death_someone	= "NaglfarClones_AddAmmo",
	spell_on_death_trigger_target	= --здесь нужен area = ai.SpellTargetArea.AROUND к spell_on_death_trigger_range
	{
		class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area = ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL + ai.SpellTargetRelationship.ALLY,
		vitality = ai.SpellTargetVitality.DEAD,
	},
	spell_on_death_trigger_range	= 400,
	

	item_subtype					= ItemSubtype.NaglfarClones,
	default_icon					= "ItemSubtype_NaglfarClones",
	
	-- in_fx							= "particles/gadget/teleport",
	-- out_fx							= "particles/gadget/teleport",
	-- switch_screen_fx				= "particles/screen/glitch",
	
	activate_effect = "particles/gadget/special/naglfar_cast",	
	activate_sound = "sound/gadgets2/NaglfarClones_activate",
}

Def.Ship_bot_Naglfar = 
{
	inherit		= "Ship_Race2_L_T5_Naglfar",
	storeItemId = 0,
	
	hull_health										= 14000,
	shield_max										= 24000,
	energy_max										= 2000,

	--death_effect = "particles/explosions/shp_exp_big_8march",

	default_modules = {
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Gleipnir_Clone", 
		[ ai.SpaceShipModuleSlot.SPECIAL ] 			= "", 
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "",			
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "",		
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "",
		
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_NaglfarCloneHide",
	},
	
	default_rocket_munition 						= "",
	
	default_custom_elements = 
	{
		[ai.VesselCustomSlot.MATERIAL_0]	= "Default_Race2_l_naglfar_r2",
		[ai.VesselCustomSlot.MATERIAL_1]	= "Default_Race2_l_naglfar_r2",
		[ai.VesselCustomSlot.MATERIAL_2]	= "Default_Race2_l_naglfar_r2",
	},
	
	children =
	{				
		{	effect = "particles/gadget/special/naglfar_spawn", joint = "root"	},
	}
} 

Def.Weapon_Gleipnir_Clone =
{
	inherit 				= "Weapon_Gleipnir_T5_Mk1",
	cant_be_bought 			= true,
	storeItemId = 0,
	damage_kinetic			= 135,
	crit_chance				= 0,
	spell_on_hit			= "",
}

Def.Module_NaglfarCloneHide = --пассивный модуль клонов для скрытия союзников с радаров
{
	cant_be_bought 			= true,
 	class					= "SpaceShipModule",
	in_editor				= false,	
	hide_from_player		= true,
	module_type				= ai.ModuleType.CPU_MOD,
	
	item_subtype = ItemSubtype.NaglfarClones,

	spell_on_equip			= "NaglfarCloneHide",
}

Def.Module_VesselSwitch_Albiero = 
{
	class = "ReserveSpaceShip",
	class_mask = ai.ShipClass.HUGE,
	default_icon = "ItemSubtype_VesselSwitch1",
	cooldown = 35, --50
	energy_cost = 3000,
	in_editor = false,
	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.VesselSwitchAlbiero,
	
	tier = 4,
	model = "models/ships/race_3/s/r3_s_albiero/r3_s_albiero",
	children = 
	{
		{ model = "models/ships/race_3/s/r3_s_albiero/r3_s_albiero_eng", joint = "engine_1" },
		{ model = "models/ships/race_3/s/r3_s_albiero/r3_s_albiero_boost_l", joint = "boost_1" },
		{ model = "models/ships/race_3/s/r3_s_albiero/r3_s_albiero_boost_r", joint = "boost_r" },
		{ model = "models/ships/race_3/s/r3_s_albiero/r3_s_albiero_cap", joint = "capacitor_1" },
	},
	spaceship = "Ship_Race3_H_T5_Uniq_small",
	stealth_param1 = 0.2,
	stealth_param2 = 1.1,

	activate_sound 			= "sound/gadgets2/vs_albiero/vsa_activate",
	
	animated_undocking = true,
	return_reserve_ship = true,
	copy_primary_weapon = false,
	copy_secondary_weapon = false,
	
	destruction_time = 1,
	disappear_after_destruction = true,
	
	undocking_spell = "Spell_VesselSwitch_Albiero",
	
	-- Cybersport restrictions
	ods_export		= true,
	storeItemId		= 1,
	tier			= 5,
	item_lvl		= 23,
	rank_min		= 1,
	rank_max		= 17,
	premiumPrice	= 99999,
	cant_be_bought	= true,
	
	in_fx 			= "particles/gadget/teleport",
	out_fx			= "particles/gadget/teleport",
	in_sound		= "sound/gadgets2/PortalGate_warp",
	out_sound		= "sound/gadgets2/PortalGate_warp",
	
	spell_on_equip	= "Spell_VesselSwitch_Albiero_Passive",
}

Def.Module_VesselSwitchBack_Albiero = 
{
	class = "ReserveSpaceShip",
	class_mask = ai.ShipClass.HUGE,
	default_icon = "ItemSubtype_VesselSwitch2",
	cooldown = 35, --50
	in_editor = false,
	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.VesselSwitchAlbiero,
	tier = 4,
	-- stealth_param1 = -100,
	-- stealth_param2 = 1,
	
	return_reserve_ship = true,
	pre_return_spell = "Spell_VesselSwitch_Albiero",
	return_safe_speed = 20,
	controlled_returning_ship = true,
	copy_secondary_weapon = false,
	
	uiDesc = "Module_VesselSwitchAlbieroBack_Desc",

	return_sound = "sound/gadgets2/vs_albiero/vsa_back",
	
	activate_sound = "sound/gadgets/common_activate",
}

Def.Module_EnergyReroute_FEngine_Albireo = 
{
	inherit				= "Module_EnergyReroute_FEngine",
	
	model = "models/ships/race_3/s/r3_s_albiero/r3_s_albiero",
}

Def.Module_DestrSiegeModeAlbiero =
{
	inherit				= "Module_DestrSiegeMode",
	
	model = "models/ships/race_3/s/r3_s_albiero/r3_s_albiero"
}

Def.Module_ThorBlast =
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 40,
	energy_cost					= 225,
	energy_cost_per_second		= 150,
	
	trigger_aura				= true,
	
	spell						= "Spell_ThorCharging",
	
	consume_aura_on_deactivate	= ai.Aura.CHARGE_SPELL,
	deactivate_spell			= "Spell_ThorBlast",
	
	--check_aim_orientation 	= true,
	check_aim_orientation_angle = 360,
	track 						= ai.TrackMode.AIM,
	barrel_rot_speed 			= 1000,
	stop_barrels				= ai.BarrelsStopMode.NONE,
	
	item_subtype				= ItemSubtype.ThorBlast,
	default_icon				= "ItemSubtype_ThorBlast",
	
--	activate_sound				= "sound/gadgets/timeboost_on",
	model						= "models/ships/race_1/m/race1_m_t5_thor/race1_m_t5_thor_cap1",
}

Def.Module_EnergyShield_Uniq = 
{
	class						= "ActiveModule",
	in_editor					= false,
	item_subtype				= ItemSubtype.EnergyShieldCommanderUniq,
	
	module_type					= ai.ModuleType.SPECIAL,

	cooldown					= 25.0,
	energy_cost					= 350,
	
	trigger_aura				= true,
	
	ignore_silence				= true,
	
	spell						= "Spell_EnergyShield_Uniq_Shield",
	additional_spell			= "Spell_EnergyShield_Uniq_Ally",
	deactivate_spell			= "Spell_EnergyShield_Uniq_DeactivationBarier",
	
	activate_sound				= "sound/gadgets2/EnergyShield_Uniq_activate",
	
	default_icon				= "ItemSubtype_EnergyShieldCommanderUniq",
}

Def.Module_FrigatePizza_T5 =
{
	class						= "FrigateDroneModule",
	in_editor					= false,
	item_subtype				= ItemSubtype.FrigatePizza,

	module_type					= ai.ModuleType.SPECIAL,
	class_mask					= ai.ShipClass.LARGE,
	
	cooldown					= 10,
	energy_cost					= 410,
	
	heal_per_second				= 205,
	drone_num					= 2,
	activate_entity_health		= 4342,
	drone_respawn_period		= 30,
	
	model						= "models/modules/m_class/frigdrone/m_c_frigdrone_orbit",
	
	default_icon				= "ItemSubtype_FrigatePizza",
	
	drone_def					= "Drone_FrigatePizzaBox",
	
	activation_projectile		= "Projectile_FrigatePizzaBox",
	activation_projectile_detonate_at_point = true,
}

Def.Drone_FrigatePizzaBox =
{
	inherit						= "FrigateDrone",
	
	projectile					= ai.DONT_INHERIT,
	max_rot_speed				= 0,
	
	model						= "models/objects/gameplay/event/event_aprile_pizza/event_aprile_pizza",
}

Def.Projectile_FrigatePizzaBox =
{
	inherit						= "Weapon_BaseRocket",
	model						= "models/objects/gameplay/event/event_aprile_pizza/event_aprile_pizza",

	explosion_blast_wave		= "Blastwave_FrigatePizzaBox",
	
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	
	detonation_timeout			= 0.5,
	detonation_radius			= 2,
	detonate_on_distance		= 60,
	max_range 					= 350,
	
	flare_color					= "255 150 100 5",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.2,
	
	work_sound					= "sound/weapons/rockets/pizza_fly",
	launch_sound				= "sound/weapons/rockets/pizza_rocket_launch",
	is_guided					= false,
	
	effect						= "particles/weapons/missile/rocket_trail_april",
	
	child_rockets =
	{
	    rocket					= "Projectile_FrigatePizzaSlice",

	    sphere_radius			= 3,
	    
	    scheme =
		{
	        circle0				= { amount = 2, angle = 5, },
	        circle1				= { amount = 2, angle = 10, },
	        circle2				= { amount = 2, angle = 15, },
			circle3				= { amount = 2, angle = 20, },
			
			--[[
			circle0				= { amount = 1, angle = 0, },
	        circle1				= { amount = 2, angle = 45, },
	        circle2				= { amount = 3, angle = 90, },
			circle3				= { amount = 2, angle = 135, },
			]]
	    },

		direct_to_target =
		{
			class 				= ai.SpellTargetClass.SHIP,
			area 				= ai.SpellTargetArea.AROUND,
			relationship 		= ai.SpellTargetRelationship.ENEMY,
			misc				= ai.SpellTargetMisc.NOT_CLOAKED,
	    },
	    direct_range			= 150,
	    max_rockets_per_target	= 1,
	},
}

Def.Projectile_FrigatePizzaSlice =
{
	inherit						= "Weapon_BaseRocket",
	model						= "models/objects/gameplay/event/event_aprile_pizza_rocket/event_aprile_pizza_rocket",

	explosion_blast_wave		= "Blastwave_FrigatePizzaSlice",
	
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	
	detonation_radius			= 10,
	max_range 					= 100,
	speed 						= 45,
	
	flare_color					= "255 150 100 5",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.2,
	
	work_sound					= "sound/weapons/rockets/pizza_fly",
	is_guided					= true,
	angular_velocity			= 120,
	
	effect						= "particles/weapons/missile/rocket_trail_april",
	spell						= "April_Food_Freeze_T5",
}

Def.Blastwave_FrigatePizzaBox =
{
	class						= "BlastWave",
	in_editor					= false,

	damage_kinetic				= 2000, -- работает из модуля
	blast_maxDistance			= 10,
	blast_minDistance			= 5,
	apply_damage				= true,
	apply_shake 				= true,

	effect 						= "particles/explosions/pizza_box_hit",
	light_color					= "255 100 0 200",
	light_radius				= 40,
	light_time					= 0.8,
--	sound 						= "sound/explosion/pizza_rocket_expl",
	sound 						= "sound/explosion/FunnyDouble_expl",
}

Def.Blastwave_FrigatePizzaSlice =
{
	class						= "BlastWave",
	in_editor					= false,

	damage_kinetic				= 2500, -- работает из модуля
	blast_maxDistance			= 10,
	blast_minDistance			= 5,
	apply_damage				= true,
	apply_shake 				= true,

	effect 						= "particles/explosions/pizza_hit",
	light_color					= "255 100 0 200",
	light_radius				= 40,
	light_time					= 0.8,
	sound 						= "sound/explosion/pizza_rocket_expl",
}

Def.Module_PlasmaWebBlast =  
{
	class 							= "ActiveModule",
	in_editor						= false,
	item_subtype 					= ItemSubtype.PlasmaWebBlast,
	
	module_type						= ai.ModuleType.SPECIAL,
	class_mask						= ai.ShipClass.SMALL,
	
	energy_cost						= 200,
	cooldown						= 45,
	
	spell							= "Spell_PlasmaWebBlast",
	additional_spell 				= "Spell_PlasmaWebBlast_Ping",
	
	activate_beam_fx				= "particles/gadget/plasma_web_beam_once_red",
	activate_sound					= "sound/gadgets/plasmaweb_shot",
	
	default_icon					= "ItemSubtype_PlasmaWebBlast",
}

Def.Module_PlasmaWebBlastTest =  
{
	inherit							= "Module_PlasmaWebBlast",
	
	spell							= "Spell_PlasmaWebBlastTest",
	additional_spell 				= "Spell_PlasmaWebBlast_Ping",
}

Def.Blastwave_PlasmaWebBlast =
{
	class							= "BlastWave",
	in_editor						= false,

	damage_thermal					= 10000,
	blast_maxDistance				= 50,
	blast_minDistance				= 10,
	apply_damage					= true,
	apply_shake 					= true,

	effect							= "particles/gadget/damage_emp_sphere_red",
	light_color						= "50 100 255 150",
	light_radius					= 20,
	light_time						= 0.8,
	sound							= "sound/explosion/plasma_rocket_expl",
}


Def.Module_PlasmaWebStatic =  
{
	class 							= "ActiveModule",
	in_editor						= false,
	item_subtype 					= ItemSubtype.PlasmaWebStatic,
	
	module_type						= ai.ModuleType.SPECIAL,
	class_mask						= ai.ShipClass.SMALL,
	
	energy_cost						= 150,
	cooldown						= 45,
	
	spell							= "Spell_PlasmaWebStatic",
	additional_spell 				= "Spell_PlasmaWebStatic_2",
	
	activate_beam_fx				= "particles/gadget/plasma_web_beam_once",
	activate_sound					= "sound/gadgets/plasmaweb_shot",
	
	default_icon					= "ItemSubtype_PlasmaWebStatic",
}

Def.Module_SilentHunter =  
{
	class 							= "ActiveModule",
	in_editor						= false,
	item_subtype 					= ItemSubtype.SilentHunter,
	
	module_type						= ai.ModuleType.SPECIAL,
	class_mask						= ai.ShipClass.MEDIUM,
	
	energy_cost						= 150,
	cooldown						= 35,
	
	spell							= "Spell_SilentHunter",
	additional_spell 				= "Spell_SilentHunter_Ping",
	deactivate_spell				= "Spell_SilentHunter_AntiRadar",
	
	default_icon					= "ItemSubtype_SilentHunter",
}

Def.Module_CloakingDevice_Rage =  
{
	class 							= "ActiveModule",
	in_editor						= false,
	item_subtype 					= ItemSubtype.CloakingDeviceRage,
	
	module_type						= ai.ModuleType.SPECIAL,
	class_mask						= ai.ShipClass.MEDIUM,
	
	energy_cost						= 100,
	cooldown						= 35,
	
	spell							= "Spell_CloakingDeviceRage_Stealth",
	deactivate_spell 				= "Spell_CloakingDeviceRage_Overcharge",
	
	activate_sound					= "sound/gadgets/stealth_on",
	deactivate_sound				= "sound/gadgets/stealth_off",
	
	default_icon					= "ItemSubtype_CloakingDeviceRage",
}

Def.Module_ThrasherDrones = --спецмодуль зеленого инженера --#71617
{
	class				= "FrigateDroneModule",
	class_mask			= ai.ShipClass.LARGE,
	in_editor			= false,
	module_type			= ai.ModuleType.SPECIAL,
	item_subtype		= ItemSubtype.ThrasherDrones,
	model				= "models/modules/m_class/frigdrone/m_c_frigdrone_orbit",
	
	damage_thermal		= 286,
	fire_rate			= 100,
	--damage_to_heal_coef		= 0.96,
	--heal_per_second		= 50,
	dispersion			= 0,
	optimal_range		= 225,
	max_range			= 300,
	activate_entity_health	= 4100,
	drone_num			= 4,
	
	projectile 			= "Projectile_Dron_Plasma_Green",
	projectile_speed    = 320,
	activation_projectile = "Projectile_ThrasherDrone",
	drone_def			= "Drone_ThrasherDrones",
	energy_cost			= 300,
	
	cooldown			= 3, -- повторное использование дрона не раньше чем	
	ammo				= 4, -- максимальное количество патронов
	ammo_regen_time		= 35,-- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	ammo_regen_max		= 4, 
	ammo_start			= 2, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	
	--drone_respawn_period=1,
	
	--trigger_aura			= true,
	--spell				= "ThrasherDrones_Heal",
	--activate_sound		= "sound/el_modules/ElCommonActivate",
	
	default_icon		= "ItemSubtype_ThrasherDrones",
	
	track 				= ai.TrackMode.ENEMY,
	--activation_projectile_is_directed_to_aim = true,
}

Def.Drone_ThrasherDrones =
{
	inherit				= "FrigateDrone",
	model				= "models/modules/m_class/thrasher_drone/thrasher_drone",
	shot_effect 		= "particles/weapons/blaster/neutron_muzzle",
	children 	= 	
	{
		{ effect ="particles/ships/drone_engine_thrasher", joint = "fx1" },
		{ effect ="particles/ships/drone_engine_thrasher", joint = "fx2" },
	},
}

Def.Projectile_ThrasherDrone =
{
	inherit				= "Weapon_BaseRocket",
	model				= "models/modules/m_class/thrasher_drone/thrasher_drone",
	explosion_blast_wave = "Blastwave_ThrasherDrone",
	--override_blast_wave_damage = true,
	spell					= "ThrasherDrones_Blastwave", -- срабатывает при уничтожении
	
	missile_defence_immune 		= false,
	missile_detection_immune 	= false,
	no_friendly_fire 	= true,
	detonation_radius	= 10, 
	speed = 65,
	
	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	max_range 			= 350,
	
	work_sound			= "sound/el_modules/GreenTurret_fly",
	
	angular_velocity 	= 65,
	is_guided 			= true,
	use_pathfinder 		= true,
	
	uiName 				= "itemSubType_ThrasherDrones",
	
	effect = "particles/gadget/pirate_drone_rocket_engine",
}

Def.Blastwave_ThrasherDrone =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 500,
	blast_maxDistance	= 12,
	blast_minDistance	= 12,
	apply_damage		= true,
	apply_shake 		= true,
	self_damage_coef	= 0.2,

	
	effect = "particles/explosions/big_fire_2",
	light_color = "255 100 0 100",
	light_radius = 20,
	light_time = 0.8,
	sound = "sound/explosion/cb_self_expl",
}

Def.Module_MicroWarp_Winter = 
{
	module_type			= ai.ModuleType.SPECIAL,
	class				= "ActiveModule",
	in_editor 					= false,
	cant_be_bought 				= true,
	item_subtype		= ItemSubtype.MicroWarp_Winter,
	energy_cost			= 50,
	default_icon		= "ItemSubtype_MicroWarp_Winter",

	activate_sound 		= "sound/gadgets2/Microwarp_winter_activate",
	
	cooldown			= 2.5,

	ammo				= 3,-- максимальное количество патронов
	ammo_regen_time		= 25, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	--ammo_regen_max		= 10, 
	ammo_start			= 2, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	ammo_cost_per_second= 0, -- раз в секунду отнимается указанное число ammo
	
	spell				= "MicroWarp_Winter_Drive",
	additional_spell	= "MicroWarp_Winter_Radar",
	
	is_fast_movement= true,
}

Def.Module_TyphonCharge = 
{
	module_type			= ai.ModuleType.SPECIAL,
	class				= "ActiveModule",
	in_editor 			= false,
	cant_be_bought 		= true,
	item_subtype		= ItemSubtype.TyphonCharge,
	
	energy_cost			= 100,
	cooldown			= 30,
	
	spell				= "TyphonCharge_AddDamage",
	default_icon		= "ItemSubtype_TyphonCharge",
	
	activate_sound				= "sound/gadgets/timeboost_on",
}

Def.Module_Dinoshell =
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 20,
	energy_cost					= 500,

	charge_damage		= 4000,
	charge_mask			= ai.ChargeType.DAMAGE_SHIP_SHIELD,
	consume_aura		= ai.Aura.CHARGE_SPELL,
	charge_spell_on_damage		= "Dinoshell_ResistAdd",
	--spell_on_max_shield_minus	= "Dinoshell_Clean",
	--max_shield_percent			= 0.01,
	spell 						= "Dinoshell_Clean",
	additional_spell			= "Dinoshell_HealShield",
	item_subtype				= ItemSubtype.Dinoshell,
	default_icon				= "ItemSubtype_Dinoshell",
	
	activate_sound				= "sound/gadgets/timeboost_on",
}

Def.Module_MicroWarp_WASP =
{
	class			= "MicroWarpDrive",
	in_editor		= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,

	energy_prepare	= 0,		-- энергия требуемая для подготовительного разгона
	energy_activate = 30,		-- энергия требуемая для активации
	cooldown		= 15,

	prep_time		= 0.5,		-- время разгона
	prep_maxspeed_mul = 1.2,	-- во сколько раз увеличивать допустимую максимальную скорость при разгоне
	prep_accel_mul	= 2.0,		-- во сколько раз увеличивать ускорение при разгоне
	
	accel_time		= 1.2,		-- время сколько будет действовать
	maxspeed_mul	= 8.0,		-- во сколько раз увеличивать допустимую максимальную скорость
	accel_mul		= 5000.0,	-- во сколько раз увеличивать ускорение
	auto_disable_time = 0.55,	-- за T*<текущая_скорость> метров до препятствия автоматически выходит из варпа

	
	prep_loop		= "sound/gadgets/legion_warp_prep",
	active_loop		= "sound/gadgets/legion_warp_active",
	fail_sound		= "sound/game/spawn_jump_end",
	stop_sound		= "sound/game/spawn_jump_end",
	work_sound 						= "sound/gadgets2/SinglePortal_start_loop",


	
	item_subtype 	= ItemSubtype.MicroWarp_WASP,

	default_icon		= "ItemSubtype_MicroWarp_WASP",
}

Def.Module_PlasmaWebNyx = 
{

	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 45,
	energy_cost					= 40,

	charge_spell_on_damage		= "PlasmaWebNyx_add_charge",
	--damage_charge_period = 7,
	charge_damage		= 1500,
	charge_mask			= ai.ChargeType.OUTGOING_DAMAGE_SHIP,
	consume_aura		= ai.Aura.CHARGE_SPELL,
	spell 						= "PlasmaWebNyx",
	--additional_spell			= "Dinoshell_HealShield",
	
	
	activate_beam_fx				= "particles/gadget/plasma_web_beam_once",
	activate_sound					= "sound/gadgets/plasmaweb_shot",
	
	item_subtype				= ItemSubtype.PlasmaWebNyx,
	
	default_icon				= "ItemSubtype_PlasmaWebNyx",

	
}

Def.Module_MicroWarp_Sai =
{
	class			= "MicroWarpDrive",
	in_editor		= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,
	item_subtype 	= ItemSubtype.MicroWarp_Sai,

	energy_prepare	= 0,		-- энергия требуемая для подготовительного разгона
	energy_activate = 56,		-- энергия требуемая для активации
	cooldown		= 30,

	prep_time		= 1,		-- время разгона
	prep_maxspeed_mul = 1.2,	-- во сколько раз увеличивать допустимую максимальную скорость при разгоне
	prep_accel_mul	= 2.0,		-- во сколько раз увеличивать ускорение при разгоне
	
	accel_time		= 2,		-- время сколько будет действовать
	maxspeed_mul	= 8.0,		-- во сколько раз увеличивать допустимую максимальную скорость
	accel_mul		= 5000.0,	-- во сколько раз увеличивать ускорение
	auto_disable_time = 0.55,	-- за T*<текущая_скорость> метров до препятствия автоматически выходит из варпа
	
	default_icon				= "ItemSubtype_MicroWarp_Sai",
	spell_on_warp			 = "MicroWarp_sai_Stealth",
	
	prep_loop		= "sound/gadgets/legion_warp_prep",
	active_loop		= "sound/gadgets/legion_warp_active",
	fail_sound		= "sound/game/spawn_jump_end",
	stop_sound		= "sound/game/spawn_jump_end",
	work_sound 						= "sound/gadgets2/SinglePortal_start_loop",
}

Def.Module_Bootlegger_warp =
{
	class			= "ActiveModule",
	in_editor		= false,
	--inherit			= "Module_MicroWarp",
	module_type			= ai.ModuleType.SPECIAL,
	item_subtype 	= ItemSubtype.Bootlegger_warp,
	
	cooldown			= 35,
	energy_cost 		= 70.0,
	ignore_silence		= true,
	
	spell			 = "Bootlegger_warp_prep",
	additional_spell = "Bootlegger_warp_NoBomb",
	
	default_icon				= "ItemSubtype_Bootlegger_warp",
	uiName						= "ItemSubtype_Bootlegger_warp",
	
	activate_sound				= "sound/gadgets2/Bootlegger_warp_activate",
	
	is_fast_movement= true,
}

Def.Module_Palom_Shield =
{
	class 				= "PhaseShield",
	in_editor			= false,
	inherit 			= "Module_PhaseShield_Raid",
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,
	
	--cooldown			= 0.3,
	energy_cost 		= 300.0,

	spell_on_hit		= "Palom_PhaseShield_Buff",   
	spell0 				= "Palom_PhaseShield_1",
	spell1				= "Palom_PhaseShield_2",
	spell2 				= "Palom_PhaseShield_3",	
	
	item_subtype		= ItemSubtype.PalomShield,
	
	default_icon		= "ItemSubtype_PalomShield_Phase2",
	ui_ico_0			= { target_system = { tex = "ItemSubtype_PalomShield_Phase2", }, },
	ui_ico_1			= { target_system = { tex = "ItemSubtype_PalomShield", }, },
	ui_ico_2			= { target_system = { tex = "ItemSubtype_PalomShield__Phase1", }, },
	
	 uiName 				= "ItemSubtype_PalomShield",
	 uiDesc 				= "ItemSubtype_PalomShield_Desc",
}

Def.Module_Disintegrator_Helicon_t5 = 
{
	class			= "Disintegrator",
	in_editor		= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,

	cooldown			= 1.0,
	energy_cost 		= 60.0,
	energy_cost_per_second = 0.0,

	item_subtype		= ItemSubtype.Disintegrator_Helicon,
	
	fire_rate			= 300.0,
	ammo				= 7,
	ammo_regen_time		= 1.5,
	max_range			= 1200,
	damage_thermal		= 2000 * 1.2,	
	zoom_value			= 3.0,
	projectile_speed	= 1240*1.3,
	hit_effect          = "particles/weapons/sniper/hit",
	impact_type			= "disintegrator",
	spell_on_hit		= "HeliconLHdamge_t5",
	
	--projectile		= "Projectile_Photon_torpedo",
	
	shot_beam			= "particles/weapons/sniper/beam",
	aim_beam			= "particles/weapons/sniper/targeting",
--	shot_once_sound		= "sound/weapons/turret/turret_oneshot",
	ready_sound			= "sound/gadgets/disintegrator/dis_ready",
	zoom_changed_sound	= "sound/gadgets2/AdvancedZoom",
	
	aim_flare_size		= 0.4,
	aim_flare_nebulosity= 0.5,
	aim_flare_angle		= 2.0,
	aim_flare_color		= "255 50 50 80",
	
	default_icon = "ItemSubtype_Disintegrator_Helicon",
}

Def.Module_Disintegrator_Helicon_t2 =
{
	inherit 			= "Module_Disintegrator_Helicon_t5",
	max_range			= 950,
	energy_cost 		= 43,
	damage_thermal		= 1270 * 1.2,
	projectile_speed	= 1050*1.3,
}

Def.Module_Disintegrator_Helicon_t3 =
{
	inherit 			= "Module_Disintegrator_Helicon_t5",
	max_range			= 1200,
	energy_cost 		= 49,
	damage_thermal		= 1434 * 1.2,
	projectile_speed	= 1160*1.3,
}

Def.Module_Disintegrator_Helicon_t4 =
{
	inherit 			= "Module_Disintegrator_Helicon_t5",
	max_range			= 1200,
	energy_cost 		= 55,
	damage_thermal		= 1740 * 1.2,
	projectile_speed	= 1190*1.3,
}

Def.Module_GrimBlackoutGenerator = 
{
	class				= "ActiveModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.SMALL,
	
	cooldown			= 40.0,
	energy_cost 		= 50.0,
	energy_cost_per_second = 0.0,
	
	
	-- spell				= "GrimBlackoutGenerator",
	spell				= "GrimBlackoutGenerator",
	deactivate_spell	= "GrimBlackoutGenerator_Stun_AndInvul",
	
	activate_sound		= "sound/gadgets/blackout/bo_activate",

	item_subtype		= ItemSubtype.GrimBlackoutGenerator,
	default_icon		= "ItemSubtype_GrimBlackoutGenerator",

}

Def.Module_ChargedInvisible =
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 35,
	energy_cost					= 120,

	charge_damage		= 1000,
	--charge_mask			= ai.ChargeType.OUTGOING_DAMAGE_SHIP,
	charge_mask			= ai.ChargeType.DAMAGE_SHIP_SHIELD,
	consume_aura		= ai.Aura.CHARGE_SPELL,
	charge_spell_on_damage		= "ChargedInvisible_Charge",

	spell 						= "ChargedInvisible_SpeedStealth",
	deactivate_spell			= "ChargedInvisible_ResistAdd",
	
	item_subtype				= ItemSubtype.ChargedInvisible,
	default_icon				= "ItemSubtype_ChargedInvisible",
	
	activate_sound				= "sound/gadgets/timeboost_on",
}

Def.Module_Mauler_GuidedMissile = 
{
	class 				= "GuidedMissileModule",
	
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,
	
	cooldown			= 16.0,
	energy_cost 		= 230.0,
	
	--activate_effect		= "",
	--activate_module_effect = "",
	activate_sound		= "sound/weapons/rockets/gm_launch",
	
	item_subtype		= ItemSubtype.Mauler_GuidedMissile,
	default_icon		= "ItemSubtype_Mauler_GuidedMissile",

	projectile			= "projectile_Mauler_GuidedMissile",
	explosion_blast_wave = "BlastWave_Mauler_GuidedMissile",
}

Def.projectile_Mauler_GuidedMissile =
{
	inherit 			= "Weapon_BaseRocket",
	in_editor			= false,

	model 				=	"models/weapons/missiles/guided_missile",

	detonation_radius 	= 0,
	--rocket_class		= ai.RocketClass.LARGE,
	
	speed 				= 78,--65, --63
	angular_velocity	= 23.1,--15,
	max_range			= 1000,
	
	spell 				= "Mauler_GuidedMissile",
	
	--effect				= "particles/weapons/guided/trail",
   	work_sound			= "sound/weapons/rockets/gm_rocket_fly",
	spectate_work_sound = "sound/weapons/rockets/gm_engine_loop",
	jam_screen_effect	= "particles/screen/whiteout",

	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	flare_color			= "255 255 255 255",
	--missile_defence_immune = true,
}

Def.BlastWave_Mauler_GuidedMissile = 
{
	class 				= "BlastWave",
	in_editor			= false,
	effect				= "particles/weapons/guided/explosion",
	
	intensity			= 100,
	damage_thermal		= 8540,
	
	blast_maxDistance	= 40,
	
	light_radius		= 30.0,
	light_color			= "255 100 0 255",
	light_time			= 0.8,
    sound  				= "sound/explosion/big_rocket_expl",
}

Def.Module_HadrianDefenderShield =
{
	class				= "ActiveModule",
	activate_entity		= "HadrianDefenderShield",
	attach_bone			= "root",
	spawn_offset 		= Vec3( 0, 0, 0 ),
	
	energy_cost			= 400,
	cooldown			= 30,
	in_editor			= false,
	activate_sound 		= "sound/gadgets/energy_shield_commander",
	spell 				= "HadrianDefenderShield_HullResist",
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.MEDIUM,
	
	item_subtype		= ItemSubtype.HadrianDefenderShield,	
	default_icon		= "ItemSubtype_HadrianDefenderShield",
	
}

Def.HadrianDefenderShield =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	class_mask		= ai.ShipClass.MEDIUM,

	
	damage_to_ship_energy_coef = 0.033333333333,
	-- damageable 		= true,
	-- health 			= 10000,
	ttl				= 8,
	active_aura		= "HadrianDefenderShield", -- нулвая аура для иконки времени работы
	weapon_mode 	= ai.ShieldWeaponMode.REFLECT_ENEMY,
	
	hack_immune 	= true,
	
	model			= "models/shields/shield_front",
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "EnergyShield", },
	effect			= "particles/gadget/frontshield_blue",

	
	death_sound		= "sound/explosion/drone_expl",
	
	uiName 			= "FrontEnergyShield",
	default_icon	= "ItemSubtype_HadrianDefenderShield",
	
	start_sound  	= 	"sound/destroyer/SShield_activate",
	end_sound	=	"sound/destroyer/SShield_off",
	death_sound	=	"sound/destroyer/SShield_off",
	is_shield		= true, --#
}

Def.Module_ManulsPaw  =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	item_subtype		= ItemSubtype.ManulsPaw,	
	module_type			= ai.ModuleType.SPECIAL,
	class				= "FiringModule",
	
	cooldown			= 35,
	energy_cost 		= 250.0,

	projectile 			= "Projectile_ManulsPaw",
	
	damage_emp				= 4000,
	
	projectile_speed 	= 180,  
	max_range			= 300,  
	track 				= ai.TrackMode.AIM,
	--track_offset		= Vec3( 0, 0, -10 ),
	barrel_rot_speed 	= 360,
	
	scale_on_weapon = false,
	
	spell_on_hit		= "Spell_ManulsPaw",
	additional_spell	= "Spell_ManulsPawOvercharge",
	
	shot_once_sound 	= "sound/gadgets/IsotopeHarvester/ih",
	shot_effect 		= "particles/gadget/jericho_module_muzzle",
	launch_beam_fx		= "particles/gadget/jericho_module_beam",
	
	default_icon		= "ItemSubtype_ManulsPaw",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ManulsPaw", },
	},
}

Def.Projectile_ManulsPaw =
{
	inherit				= "Weapon_BaseRocket",
	is_guided			= true,

	missile_detection_immune 	= true,
	disable_concussion_sound = true,
	missile_defence_immune 	= true,
	
	angular_velocity 	= 30,
	
	explosion_blast_wave 		= "Blastwave_ManulsPaw",

	work_sound 	    	= "sound/gadgets/IsotopeHarvester/ih_sphere_fly",
	effect = "particles/gadget/huge/gravy_anomaly_hole",
	hit_effect = "particles/weapons/alien/alien_platform_plasma_hit",

	kill_effect_on_remove 		= false,
	
	--	spell_on_hit					= "Spell_ManulsPaw",

	immunity_to_shooter_time = 0,
}

Def.Blastwave_ManulsPaw =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 4000,
	self_damage_coef		= 0, --не дамагаем себя.
	blast_maxDistance		= 7,
	apply_damage			= true,
	
	effect 					= "particles/weapons/big/plasma_orb_explosion",
	light_color 			= "200 200 255 100",
	light_radius 			= 50,
	light_time 				= 0.4,
	sound 					= "sound/explosion/SmartRocket_expl",
}

Def.Module_EnergyShieldLoki  =
{
	inherit 			= "Module_EnergyShieldCommander_T4_Base",
	in_editor			= false,
	item_subtype		= ItemSubtype.EnergyShieldLoki,	
	spell				= "Spell_EnergyShieldLoki",
	additional_spell	= "Spell_EnergyVampLoki",
	module_type			= ai.ModuleType.SPECIAL,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyShieldLoki", },
	},
	
	uiName				="ItemSubtype_EnergyShieldLoki",
	uiDesc				= "itemSubType_EnergyShieldLoki_desc",
	
}

Def.Module_DragonFlash = -------------------- Спецмодуль Salamander
{

	class 				= "SwarmModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,

	
	cooldown			= 1,
	energy_cost 		= 120.0,

	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets2/DragonFlash/df_mode",


	spell0 				= "Spell_DragonFlashsDeath",  -- мертвый или в управлении
	spell1 				= "Spell_DragonFlashsDeath",   -- режим 1
	spell2				= "Spell_DragonFlashsDeath",  -- режим 2
	spell3 				= "Spell_DragonFlashsDeath",  		-- режим 3
	
	item_subtype		= ItemSubtype.DragonFlash,
	
	default_icon		= "ItemSubtype_DragonFlash_Stage1",
	ui_ico_0			= { target_system = { tex = "ItemSubtype_DragonFlash_Stage0", }, },
	ui_ico_1			= { target_system = { tex = "ItemSubtype_DragonFlash_Stage1", }, },
	ui_ico_2			= { target_system = { tex = "ItemSubtype_DragonFlash_Stage2", }, },
	ui_ico_3			= { target_system = { tex = "ItemSubtype_DragonFlash_Stage3", }, },
	
	swarm_pack			= "DragonFlash",
	pack_amount			= 1,

	attach_bone			= "root",	


	-- uiName 				= "Special_DragonFlash",
	-- uiDesc 				= "Special_Swarm2_desc",
}

-- сам дрон
Def.DragonFlash =
{

	--общие настройки
	--inherit  					= "SwarmPackBase",
	
	class					= "SwarmPack",
	signature				= ai.Signature.SMALL,
	
	mode						= 1,	-- SMM_SKILL
	
	model				= "models/weapons/drones/chinese_drone/chinese_drone",
	signature			= ai.Signature.TINY,
	physics					= { solid_type = solid.sphere, sphere_radius = 1.25, hitbox = true, material = "ShipMetalMk3", mass = 300,  damping = 0.9, rot_damping = 0.9,  },	
	drone_scale				= 0.2,
	
	health 					= 10000, ----!   общее для роя 20000 
	health_regen			= 325,----!   общее для роя   500
	start_work_health_percent = 0.5,
	min_health_percent		= 0.15, -- минимальное количество HP в процентах от максимального в каждом режиме	
	
	-- настройки динамики и маневров
	
	reg_k							= 1,--2,
	rot_reg_k						= 150,--3
	
	acceleration					= 110,--70
	max_speed						= 80,--50

 
	max_rearspeed					= 24,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.8,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 14,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 60,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.8,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???

	max_xspeed						= 24,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 50,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 50,
	decel_x							= 7,
	max_yspeed						= 24,
	accel_y0						= 50,
	accel_y1						= 50,
	decel_y							= 7,
	
	rot_xmaxspeed					= 220,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 140*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 85*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 200*3,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 220,
	rotaccel_y0						= 140*2,
	rotaccel_y1						= 85*2,
	rotdecel_y						= 200*3,
	rot_zmaxspeed					= 220,
	rotaccel_z0						= 150*2,
	rotaccel_z1						= 150*2,
	rotdecel_z						= 500*3,
	
	-- звуки и эффекты

	shot_once_sound 		= "sound/gadgets2/DragonFlash/df_shot",

	death_sound			="sound/explosion/swarm_explosion",
	
	death_effect			= "particles/gadget/swarm/swarm_explosion",
	trail_effect 			= "particles/ships/ship_trail",
	trail_color 			= "42 149 255 155",
	trail_size 				= 0.08,
	children 			=
		{
				{ 	effect	="particles/ships/engine_h_chinese_drone", joint = "fx" },
		},
	
	uiName 							= "DragonFlash",

	guard_ring_radius		= 10,	--20.0,  -- крутится?
	guard_range				= 0.1,   -- нападет ----!
	guard_max_range			= 0.1,  -- преследует/возвращается

	spell_on_attack 				= "Spell_DragonFlashControl",  -- спелл исспользуется в реиме управления
	state_control_aura_range_coef 	= 1.2,
	


	-- спеллы для самого роя (дрона)
	spell0 = "",
	spell1 = "Spell_DragonFlashsShieldHeal", -- аое хил корпуса
	spell2 = "Spell_DragonFlashsHullHeal", -- аое хил щита Spell_DragonFlashsHullHeal
	spell3 = "Spell_DragonFlashsPulsar",	-- аое пульсар
	
	--Стрельба роем  
	projectile					= "Projectile_DragonFlash",
	no_friendly_fire 			= true, --ТАКЖЕ И ДЛЯ 1.3


	-- Настройки фазы 2
	attack_time					= 0,
	attack_period				= 0,
	attack_target_range			= 0.2,--370,
	attack_target_max_range		= 0.2,--450,
	fly_in_sphere_radius		= 1,
	fly_in_sphere_rot_speed		= 1,

	-- Настройки фазы 3
	defence_sphere_radius				= 0.2,
	defence_sphere_range				= 0.2,
	defence_sphere_max_range			= 0.2,
	defence_sphere_rot_speed			= 1,
	defence_sphere_attack_time			= 1,
	defence_sphere_attack_period		= 1,
	defence_sphere_attack_damage_mul	= 1,
	defence_sphere_speed_mul			= 118,
	
	radar_vison				= ai.ShieldRadarVisionMode.PASS,
	weapon_mode				= ai.ShieldWeaponMode.BLOCK_ENEMY,
	
	bound_effect_radius		= 4.0, -- переопределяет размер эффектов, размер которых зависит от размера ограничивающей объект сферы
	shield_bound_effect_radius = 15.0,
	turret_bound_effect_radius = 10.0,
	
	mark_frames_size		= 4.0, -- переопределяет размер рамок в HUD
	
	max_length				= 17,
	guard_sphere_speed		= 3, --20  -- скорость вращения вокруг
	
	hack_immune			= true,
}

Def.Projectile_DragonFlash =
{
	inherit 					= "Projectile_Dron_Plasma",
	class						= "Rocket",
	model 						= "models/objects/green_drones/drones_swarm/single_drone",
	shot_effect = "particles/weapons/blaster/neutron_muzzle",
	--muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 128 128 255", },
	
	
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	--is_guided					= true,
	--angular_velocity			= 12,
	--random_trajectory 			= true,
	
	detonation_radius			= 5,
	
	explosion_blast_wave 		= "Blastwave_DragonFlash",

	flare_color					= "55 190 140 15",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,
	effect 						= "particles/weapons/drongun/projectile",
	--hit_effect					= "particles/weapons/laser/hit",
	impact_type 				= "laser",
}

Def.Blastwave_DragonFlash  =
{
	class						= "BlastWave",
	in_editor					= false,
	blast_maxDistance			= 10,
	--apply_damage				= true,
	--apply_shake 				= false,
	--damage_thermal				= 1,

	-- effect 						= "particles/gadget/swarm/swarm_drone_small_hit",
	
	-- light_color 				= "3 64 40 255",
	-- light_radius 				= 8,
	-- light_time 					= 0.2,
	sound 						= "sound/hit/laser_oneshot",
}

Def.Module_HeathTaunt =
{
	class			= "ActiveModule",
	item_subtype	= ItemSubtype.HeathTaunt,
	
	
	energy_cost		= 120,
	cooldown		= 40,
	spell			= "Spell_HeathTaunt",
	additional_spell = "Spell_HeathTauntHackWeapons",
	spell_on_equip	= "Spell_HeathTauntHealTarget",

	module_type		= ai.ModuleType.SPECIAL,

	default_icon	= "ItemSubtype_HeathTaunt",
	
	work_beam_fx	   = "particles/gadget/weaponhacker_beam_pink",

	activate_sound		= "sound/gadgets/ShieldWall/sw_activate",

}

Def.Module_GreenEnergyShieldReflector =
{
	class 					= "ActiveModule",
	in_editor 				= false,
	item_subtype			= ItemSubtype.GreenEnergyShieldReflector,
	module_type				= ai.ModuleType.SPECIAL,

	--energy_cost				= 60,
	hull_cost 				= 500,
	energy_cost_per_second 	= 30,
	trigger_aura 			= true,
	-- energy_cost_additional	= 0.50,
	-- param_modificator 		= 0.27,

	cooldown				= 42,
	spell					= "Spell_GreenEnergyShieldReflector",
	--additional_spell 		= "Spell_GreenEnergyShieldReflector_reflector",

	check_aim_orientation_angle = 360,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 		= 1000,

	check_aim_orientation 	= true,
	ignore_silence			= false,

	--model 					= "models/weapons/plasma/power/vortex",
	activate_sound 			= "sound/gadgets/PhaseShield/ps_activate",
	
	default_icon	= "ItemSubtype_GreenEnergyShieldReflector",
	

}

Def.Module_GreenAIM  =
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	item_subtype		= ItemSubtype.GreenAIM,	
	module_type			= ai.ModuleType.SPECIAL,
	class				= "FiringModule",
	
	cooldown			= 40,
	energy_cost 		= 250.0,
	hull_cost 			= 300,

	projectile 			= "Projectile_GreenAIM",
	
	damage_emp				= 0,
	
	projectile_speed 	= 120,  
	max_range			= 300,  
	track 				= ai.TrackMode.AIM,
	--track_offset		= Vec3( 0, 0, -10 ),
	barrel_rot_speed 	= 360,
	
	
	scale_on_weapon = false,
	
	
	additional_spell	= "Spell_GreenAIM_ShieldOn",
	
	shot_once_sound 	= "sound/weapons/rockets/alienrocket",
	shot_effect 		= "particles/gadget/jericho_module_muzzle",
	launch_beam_fx		= "particles/gadget/jericho_module_beam",
	
	default_icon		= "ItemSubtype_GreenAIM",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenAIM", },
	},
	

}

Def.Projectile_GreenAIM =
{
	inherit				= "Weapon_BaseRocket",
	class				= "Rocket",
	is_guided			= true,
	impact_type			= "rocket",
	
	spell		= "Spell_GreenAIM",

	missile_detection_immune 	= true,
	disable_concussion_sound = true,
	missile_defence_immune 	= true,
	
	angular_velocity 	= 100,
	
	work_sound 	    	= "sound/gadgets/IsotopeHarvester/ih_sphere_fly",
	effect 					= "particles/weapons/missile/alien_rocket_trail",
	flare_angle = 180,
	flare_color = "109 145 111 15",
	flare_nebulosity = 0.2,
	flare_size = 0.4,
	--hit_effect = "particles/weapons/alien/alien_platform_plasma_hit",

	kill_effect_on_remove 		= false,
	
	
	immunity_to_shooter_time = 0,
}

Def.Module_GreenSwitcher = 
{
	class 				= "PhaseModule",
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	--class_mask			= ai.ShipClass.LARGE,
	
	cooldown			= 0.3,
	energy_cost 		= 150.0,
	hull_cost			= 300,	

	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets2/GreenSwitcher_activate",
	
	spell0 				= "Spell_GreenPhase_1", -- + урон
	spell1				= "Spell_GreenPhase_3", -- +резист
	spell2 				= "Spell_GreenPhase_2", -- + кд
	
	item_subtype		= ItemSubtype.GreenSwitcher,
	
	default_icon		= "ItemSubtype_GreenSwitcher_1",
	ui_ico_0			= { target_system = { tex = "ItemSubtype_GreenSwitcher_1", }, },
	ui_ico_1			= { target_system = { tex = "ItemSubtype_GreenSwitcher_3", }, },
	ui_ico_2			= { target_system = { tex = "ItemSubtype_GreenSwitcher_2", }, },
	
	--uiName 				= "Special_PhaseShield_guard",
	--uiDesc 				= "Special_PhaseShield_guard_Desc",
}


Def.Module_AB1 =
{
	class 		= "FiringModule",
	in_editor 	= false,
	module_type			= ai.ModuleType.SPECIAL,
	item_subtype		= ItemSubtype.AB1,
	
	model 			= "models/weapons/plasma/power/shooter_bark",
	--model 			= "models/weapons/plasma/power/vortex",
	activate_sound		= "sound/gadgets/timeboost_on",
	track 				= ai.TrackMode.ENEMY,
	--check_aim_orientation = true,
	check_aim_orientation_angle = 55,
	barrel_rot_speed 	= 720,
	
	additional_spell	= "Spell_BarkOvercharge",
	
	optimal_range 		= 200,
	max_range 			= 200,

	fire_rate 			= 300,
	--fire_rate_add 		= 60,
	--fire_rate_max 		= 60,
	dispersion			= 1,

	damage_kinetic		= 500,


	shoot_mode = ai.FiringModuleShootMode.AUTO, 
	projectile 			= "Projectile_AB1_offline",
	active_projectile 	= "Projectile_AB1_online",
	projectile_speed	= 400,
	shot_effect 		= "particles/weapons/module_ab1_muzzle",

	duration 			= 10,
	energy_cost 		= 150,
	cooldown 			= 40,

	muzzleflash_color = { kinetic = "241 186 20 100", emp = "241 186 20 100", thermal = "241 186 20 100", },
	muzzleflash_radius 		= 1,
	muzzleflash_time 		= 0.1,

	default_icon		= "ItemSubtype_AB1",
	shot_once_sound = "sound/gadgets2/ab1_shot",
}

Def.Projectile_AB1_offline =
{
	inherit				= "Projectile_LaserSniper",
	effect 				= "particles/weapons/module_ab1_projectile",
	hit_effect			= "particles/weapons/module_ab1_hit",
--	work_sound 		= "sound/weapons/xo/bullet_fly",
}
Def.Projectile_AB1_online =
{
	inherit				= "Projectile_AB1_offline",--"Projectile_SingularityCannon",
	fire_rate_mul		= 2,
}

Def.Module_ShrikeBall =
{
	class			= "ActiveModule",
	module_type		= ai.ModuleType.SPECIAL,
	item_subtype	= ItemSubtype.ShrikeBall,
	
	
	energy_cost		= 250,
	cooldown		= 40,
	
	
	spell			= "Spell_ShrikeBallCharge",
	additional_spell = "Spell_ShrikeBall_Buff",
	
	--spell_on_equip	= "Spell_ShrikeBall_equip",

	default_icon	= "ItemSubtype_ShrikeBall",
	
	--activate_effect  				= "particles/gadget/jericho_active_module_sphere",
	activate_sound		= "sound/gadgets/ShieldWall/sw_activate",

	-- children =
	-- {
		-- {
			-- effect = "particles/gadget/jericho_module_fx",
			-- joint = "fire_01",
		-- }
	-- },

}

Def.ShrikeBall = 
{
	class				= "AuraHolderEntity",
	damageable			= false,
	hack_immune			= true,
	in_editor			= false,
	
	children =
	{
		{ effect		= "particles/gadget/shrikeball_sphere" }, -- joint = "g1_m"
	},
}

Def.ShrikeBall2 = 
{
	class				= "AuraHolderEntity",
	damageable			= false,
	hack_immune			= true,
	in_editor			= false,
	
	children =
	{
		{ effect		= "particles/gadget/shrikeball_sphere2" }, -- joint = "g1_m"
	},
}

Def.Module_Pilums =
{

	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.Pilums,
	

	acceleration_time = 2,
	ammo = 3,
	shoot_mode = ai.FiringModuleShootMode.VOLLEY, --#83218
	volley_size = 1,

	class = "FiringModule",
	cooldown = 40,
	crit_chance = 0,
	damage_emp = 700,
	dispersion = 0,
	energy_cost = 100,
	fire_rate = 90,

	max_range = 2000,

	projectile = "Projectile_Pilums",
	projectile_speed = 220,
	track = ai.TrackMode.AIM,--ai.TrackMode.AIM,
	--track_offset = Vec3( 0, 0, -1000 ),
	
	spell_on_hit = "Spell_Pilums1",
	--additional_spell = "WolfhoundOvercharge",
	
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius = 10,
	muzzleflash_time = 1,
	
	shot_effect = "particles/gadget/special/pilum_module_muzzle",
	shot_once_sound = "sound/gadgets2/pilums/pilums_shot",
	default_icon = "ItemSubtype_Pilums",
}

Def.Projectile_Pilums =
{
	inherit				= "Weapon_BaseRocket",
	
	model					= "models/weapons/pilum_spear/pilum_spear",

	death_entity_on_static_hit = "Pilum",

	explosion_blast_wave = "Blastwave_Pilums",
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
	
	effect = "particles/gadget/special/pilum_module_projectile",
}

Def.Blastwave_Pilums =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 1000, -- работает из модуля
	blast_maxDistance	= 10,
	blast_minDistance	= 5,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/gadget/special/pilum_module_hit",
	light_color 		= "255 160 80 100",
	light_radius 		= 12,
	light_time 			= 0.5,
	sound 				= "sound/explosion/pilum_expl",
}

Def.Pilum =
{
	class = "AuraHolderTrigger",

	radius = 50,
	density = 0.75,
	model	= "models/weapons/pilum_spear/pilum_spear",
	effect = "particles/gadget/special/pilum_module_spell_static",
	spell = "Spell_PilumStatic",
}

Def.Module_HeliSpark = 
{
	class			= "Disintegrator",
	in_editor		= false,

	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,

	cooldown			= 3,
	energy_cost 		= 185.0,
	energy_cost_per_second = 0.0,

	item_subtype		= ItemSubtype.HeliSpark,
	
	projectile			= "Projectile_HeliosSparks",
	
	spell_on_hit		= "Spell_HeliSpark_H",
		
	fire_rate			= 20.0,
	max_range			= 1200,
	damage_emp			= 5500, --9900*0.75,	
	zoom_value			= 4.0,
	projectile_speed	= 1240, --1240,
	hit_effect          = "particles/weapons/sniper/hit",
	impact_type			= "disintegrator",
	
	shot_beam			= "particles/weapons/sniper/beam",
	aim_beam			= "particles/weapons/sniper/targeting",
--	shot_once_sound		= "sound/weapons/turret/turret_oneshot",
	ready_sound			= "sound/gadgets/disintegrator/dis_ready",
	zoom_changed_sound	= "sound/gadgets2/AdvancedZoom",
	
	aim_flare_size		= 0.4,
	aim_flare_nebulosity= 0.5,
	aim_flare_angle		= 20.0,
	aim_flare_color		= "255 50 50 80",
	
	activate_sound 		= "sound/gadgets/disintegrator/dis_activate",
	deactivate_sound	= "sound/gadgets/disintegrator/dis_deactivate",
	shot_once_sound		= "sound/gadgets/disintegrator/dis_fire",
	work_sound 			= "sound/gadgets/disintegrator/dis_work_loop_p",
	
	default_icon			= "ItemSubtype_HeliSpark",
}

Def.Projectile_HeliosSparks =
{
	class					= "ChainLightningProjectile",
	link_range 				= 60, -- макс расстояние между врагами в цепочке
	chaing_damage			= { 1, 0.6, 0.5, 0.4, }, -- - массив из коэффициентов, на которые будет умножаться дамаг для врагов в цепочке
	chain_target			= --тип целей аналогично аурам (новый формат)
		{ 
		class 				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.GUIDED_DRONE,-- +  ai.SpellTargetClass.ScBaseEntity,
		relationship 		= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		},
	shield_subtypes 		= { ItemSubtype.SectorShield, ItemSubtype.Screen, },

	hitbox_min 				= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max				= Vec3( 0.1, 0.1, 0.1 ),
	
	--effect 					= "particles/weapons/alien/crystal_projectile",
	effect 			        = "particles/weapons/sniper/projectile_blue",
	beam_fx 				= "particles/gadget/pulsars/energy_beam",
	chain_hit_fx 			= "particles/weapons/alien/crystal_beam_hit_blue",
	
	detonation_radius		= 1,

	flare_color				= "255 150 100 15",
	flare_size				= 0.0, --0
	flare_angle				= 180,
	flare_nebulosity		= 0.1,--0.1,

	impact_type			= "disintegrator",
	work_sound 		= "sound/gadgets/disintegrator/dis_fly",
	--reflection_immune		= true,
}

Def.Module_PsiloiBooster =
{
	class			= "ActiveModule",
	in_editor		= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	item_subtype 	= ItemSubtype.PsiloiBooster,
	
	activate_entity			= "PsiloiBooster2",
	activate_entity_ttl		= 15,
	spawn_offset			= Vec3( 0, 0, -3 ),
	attach_bone				= "root",
	
	--activate_beam_fx		= "particles/gadget/tractor_beam",
	--activate_beam_fx		= "particles/gadget/pulsars/pulsar_beam",
	
	check_spawn_collision = true,
	
	cooldown			= 35,
	energy_cost 		= 100.0,
	energy_cost_per_second = 70,
	
	ignore_silence		= true,
	
	spell			 = "Spell_PsiloiBooster",
	additional_spell = "Spell_NoBomb",
	trigger_aura	 = true,

	
	--work_beam_fx		= "particles/gadget/tractor_beam",
	--interacting_fx			= "particles/gadget/drone_beam", 
	
	default_icon				= "ItemSubtype_PsiloiBooster",
	
	
	activate_sound = "sound/gadgets2/PsiloiBooster_activate",
	

	is_fast_movement= true,
}



Def.PsiloiBooster = 
{
	class				= "AuraHolderEntity",
	damageable			= true,
	hack_immune			= true,
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
	health				= 11000,
	--hudType				= "default",
	in_editor			= false,
	model				= "models/ships/race_1/s/race1_s_psiloi/race1_s_psiloi_turbine",
	signature			=	ai.Signature.TINY,
	physics				= { solid_type = solid.model, damping = 0.4, mass = 100, material = "ShipMetalMk3", rot_damping = 0.4, solid_type = 4, kinematic = false, hitbox = true,},
	uiName				= "PsiloiBooster",
	
	-- contact_damage_min_speed	= 100,
	-- contact_damage_cf			= 100,
	

	
	work_sound 	= "sound/gadgets2/PsiloiBooster_work",
	death_sound			= "sound/gadgets2/PsiloiBooster_end",
	end_sound	=	"sound/gadgets2/PsiloiBooster_end",

}

Def.PsiloiBooster2 = 
{
	class				= "AuraHolderEntity",
	damageable			= true,
	hack_immune			= true,
	
	--work_beam_fx		= "particles/gadget/drone_beam", 
}

-- Def.Module_BasheSpecial = 
-- {
	
	-- class 				= "ActiveModule",
	-- in_editor			= false,
	
	-- module_type			= ai.ModuleType.SPECIAL,
	-- item_subtype 	= ItemSubtype.BasheSpecial,
	-- class_mask			= ai.ShipClass.HUGE,
	
	-- cooldown			= 45,
	-- energy_cost 		= 120.0,

	-- spawn_clones	= 1,
	-- spawn_clones_radius = 4.2,
	-- clones_power = 1,
	-- clones_ttl  = 20,	

	-- spell				= "Spell_DestrSpecial_Stealth",
	-- additional_spell	= "Spell_DestrSpecial_mov",
	
	-- activate_effect		= "",
	-- activate_module_effect = "",
	-- activate_sound		= "sound/gadgets/PhaseShield/ps_activate",		
	-- default_icon		= "ItemSubtype_BasheSpecial",	
-- }

Def.Module_BasheSpecial = 
{
	cant_be_bought 			= true,
	class 					= "ActiveModule",
	in_editor						= false,
	item_subtype					= ItemSubtype.BasheSpecial,	
	module_type						= ai.ModuleType.SPECIAL,
	
	energy_cost				= 1000,
	cooldown						= 50,

	spell				= "Spell_DestrSpecial_Stealth",
	additional_spell	= "Spell_DestrSpecial_mov",
	
	spawn_bots              = "Ship_bot_Bashe",
	
	bot_ammo_cost		= 1, -- сколько тратится снарядов на одного бота
	ammo				= 1, -- максимальное количество патронов
	ammo_start			= 1, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_regen_time		= 50,
	ammo_regen_max		= 1,
	
	
    -- spawn_bots_radius		= 0.2, -- начальный радиус сферы для поиска места спавна ботов
    -- spawn_bots_max_radius   = 0.3, -- конечный радиус сферы для поиска места спавна ботов


    spawn_bots_ttl		= 30, -- время жизни ботов
    ai_preset			= "BotsT5X_H",
	
	default_icon					= "ItemSubtype_BasheSpecial",
	
	--activate_effect = "particles/gadget/special/naglfar_cast",	
	activate_sound = "sound/gadgets2/NaglfarClones_activate",
}

Def.Ship_bot_Bashe = 
{
	inherit		= "Ship_Race5_H_T5_Bashe",
	storeItemId = 0,
	
	hull_health										= 50000,
	shield_max										= 50000,
	energy_max										= 2000,


	default_modules = {
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_BasheGun_Clone", 
		[ ai.SpaceShipModuleSlot.SPECIAL ] 			= "", 
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "",			
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "",		
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "",
		
		--[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_NaglfarCloneHide",
	},
	
	default_rocket_munition 						= "",
	
	default_custom_elements = 
	{
		[ai.VesselCustomSlot.MATERIAL_0]	= "Default_specialships_destroyerserpent_r1",
		[ai.VesselCustomSlot.MATERIAL_1]	= "Default_specialships_destroyerserpent_g1",
		[ai.VesselCustomSlot.MATERIAL_2]	= "Default_specialships_destroyerserpent_b1",
	},
	
		death_wreck			= "",	
	
	-- children =
	-- {				
		-- {	effect = "particles/gadget/special/naglfar_spawn", joint = "root"	},
	-- }
} 

Def.Weapon_BasheGun_Clone =  
{
	inherit 				= "Weapon_SingularityCannon",
	cant_be_bought 			= true,
	storeItemId = 0,
	
	fire_rate				= 30,
	projectile_speed 		= 200, --380
	projectile 				= "Projectile_BasheGun_Clone",
	damage_emp				= 0,
	
	heat_max 			= 100,
	heat_add 			= 1,
	heat_sub 			= 20,
	overheat_time		= 0,
	

	
	shot_loop_sound 		= "sound/weapons/ProtozanBlaster/pb_charge",
	shot_beam_fx 		= "particles/weapons/other/proto_beam",
	
}

Def.Projectile_BasheGun_Clone =
{
	inherit			= "Projectile_BasheGun_noCharge",
	spell_on_launch	= "Spell_BasheGun_Clone",
}

Def.Module_PerseiSpecial = 
{
	class 						= "LandingModule",
	in_editor 					= false,
	
	
	max_speed 					= 60, -- допустимая скорость посадки,
	landing_max_range			= 35, -- максимальная высота над поверхностью [1, 100],
	landing_max_angle 			= 45, -- максимальный угол от нормали к поверхности [1, 45],
	landing_pos_offset 			= 1.6,  -- высота корабля над поверхностью, когда корабль посажен.

	--model 						= "models/weapons/plasma/power/vortex",
	
	cooldown					= 25,   --  30
	energy_cost					= 150,  --  200
	item_subtype				= ItemSubtype.PerseiSpecial,
	
	spell 	= "Spell_PerseiSpecial_antirader",
	
	--deactivate_spell			= "SpaceSqueezer1",
	activate_sound 				= "sound/gadgets2/PerseiSpecial/ps_activate",
	deactivate_landing_sound 			= "sound/gadgets2/PerseiSpecial/ps_deactivate",

	--default_icon				= "ItemSubtype_PerseiSpecial",
	default_icon				= "ItemSubtype_PerseiSpecial",
	ui_ico_0					= { target_system = { tex = "ItemSubtype_PerseiSpecial", }, },
	ui_ico_1					= { target_system = { tex = "ItemSubtype_PerseiSpecial_Action", }, },
	
	module_type			= ai.ModuleType.SPECIAL,
	

}

Def.PerseiSpecial_Mine = 
{
	class				= "AuraHolderEntity",
	damageable			= false,
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
	--health				= 6000,
	-- hudType				= "default",
	in_editor			= false,
	--model				= "models/turret/biglightninggun/h_mine",
	--physics				= {damping = 0.4, mass = 10000, material = "ShipMetalMk3", rot_damping = 0.4, solid_type = 4, },
	-- uiDesc				= "Module_ShieldRayLarge_Desc",
	uiName				= "CageTrapMine_name",
	work_sound 			= "sound/gadgets2/PerseiSpecial/PerseiSpecial_Mine_loop",
}

Def.Module_GG_TimeBomb =
{
	class			= "ActiveModule",
	item_subtype	= ItemSubtype.GG_TimeBomb,
	module_type		= ai.ModuleType.SPECIAL,
	
	energy_cost		= 120,
	energy_cost_per_second = 100,
	hull_cost				= 1500,
	hull_cost_per_second	= 120,
	

	cooldown		= 60,
	spell			= "Spell_GreenGuard_TB2",
	--additional_spell = "Spell_GG_TimeBomb_resistBonus",
	spell_on_equip	= "Spell_GG_TimeBomb_resistBonus",
	
	trigger_aura	= true,

	work_effect 				= "particles/areal/areal_time_alien_guard",

	
	default_icon	= "ItemSubtype_GG_TimeBomb",
	
	--work_beam_fx	   = "particles/gadget/weaponhacker_beam_pink",

	activate_sound		= "sound/gadgets/ShieldWall/sw_activate",
	
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
	required_role = ai.ShipRoles.GUARD,
	
}

Def.Module_GG_PhaseShield = 
{
	class 				= "PhaseShield",
	in_editor			= false,
	item_subtype	= ItemSubtype.GG_PhaseShield,
	module_type			= ai.ModuleType.SPECIAL,

	
	cooldown			= 0.3,
	energy_cost 		= 120.0,
	hull_cost			= 500,

	activate_effect		= "",
	activate_module_effect = "",
	activate_sound		= "sound/gadgets/PhaseShield/ps_activate",
	
	spell_on_hit		= "Spell_GG_PhaseShield_HitBuff",
	spell0 				= "Spell_GG_PhaseShield_emp",
	spell1				= "Spell_GG_PhaseShield_Thermal",
	spell2 				= "Spell_GG_PhaseShield_Kinetic",
	
	default_icon		= "ItemSubtype_GreenGuard_PhaseShield_Phase1",
	ui_ico_0			= { target_system = { tex = "ItemSubtype_GreenGuard_PhaseShield_Phase1", }, },
	ui_ico_1			= { target_system = { tex = "ItemSubtype_GreenGuard_PhaseShield", }, },
	ui_ico_2			= { target_system = { tex = "ItemSubtype_GreenGuard_PhaseShield_Phase2", }, },
	

	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 15,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.GUARD,
}

Def.Module_GG_DamageBoost =
{
	class			= "ActiveModule",
	item_subtype	= ItemSubtype.GG_DamageBoost,
	module_type		= ai.ModuleType.SPECIAL,

	
	energy_cost		= 500,
	hull_cost		= 1500,
	cooldown		= 60,
	
	charge_damage		= 3000,
	--charge_mask			= ai.ChargeType.OUTGOING_DAMAGE_SHIP,
	charge_mask			= ai.ChargeType.OUTGOING_DAMAGE_SHIP,
	consume_aura		= ai.Aura.CHARGE_SPELL,
	charge_spell_on_damage		= "Spell_GG_DamageBoost_CargeResist",	
	
	spell			= "Spell_GG_DamageBoostClean",
	additional_spell = "Spell_GG_DamageBoost",
	-- spell_on_equip	= "Spell_HeathTauntHealTarget",
	
	--work_effect 				= "particles/areal/areal_gravyanomaly",

	default_icon	= "ItemSubtype_GG_DamageBoost",
	
	--work_beam_fx	   = "particles/gadget/weaponhacker_beam_pink",

	activate_sound		= "sound/gadgets/ShieldWall/sw_activate",
	
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
	required_role = ai.ShipRoles.GUARD,
	
}

Def.Module_HallasManAIM =
{
	class			= "ActiveModule",
	item_subtype	= ItemSubtype.HallasManAIM,
	module_type		= ai.ModuleType.SPECIAL,

	
	energy_cost		= 120,
	cooldown		= 50,
	
	
	
	spell			= "Spell_HallasManAIM",
	additional_spell = "Spell_HallasManAIM_CleanLaser",

	default_icon	= "ItemSubtype_HallasManAIM",
	

	activate_sound		= "sound/gadgets/ShieldWall/sw_activate",
	
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
	required_role = ai.ShipRoles.GUARD,
	
}

Def.Module_AmberLanding = 
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
	item_subtype				= ItemSubtype.AmberLanding,
	
	spell 						= "Spell_AmberLanding",
--	additional_spell				= "LandingTurret",
	
	--activate_entity				= "AuraHolderShieldLandingTurret",
	--attach_bone
	--activate_entity_ttl			= 8,
	--activate_entity_health
	
	--deactivate_spell			= "SpaceSqueezer1",
	activate_sound 				= "sound/gadgets2/DisintegratorRay_Landing/dr_activate",
	deactivate_landing_sound 			= "sound/gadgets2/DisintegratorRay_Landing/dr_deactivate",

	default_icon				= "ItemSubtype_AmberLanding",
	ui_ico_0					= { target_system = { tex = "ItemSubtype_AmberLanding", }, },
	ui_ico_1					= { target_system = { tex = "ItemSubtype_AmberLanding_Action", }, },
	
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

Def.Module_CinquedeaAIM =
{
	class = "FiringModule",
	in_editor 					= false,
	module_type			= ai.ModuleType.SPECIAL,
	item_subtype		= ItemSubtype.CinquedeaAIM,

	shoot_mode = ai.FiringModuleShootMode.CHARGED_VOLLEY, --#83032

	target_cone_angle = 180,
	max_charge_time = 5,
	min_target_charge_time = 1,
	max_target_charge_time = 5,
	charge_damage_emp_per_second = 1100,
	max_targets = 8,
	
	dispersion = 0,
	energy_cost = 100,
	fire_rate = 300,
	max_range = 300,
	
	projectile = "Projectile_CinquedeaAIM",
	projectile_speed = 150,
	track = ai.TrackMode.AIM,
		
	charge_beam_fx = "particles/gadget/huge/gravy_anomaly_beam",

	cooldown = 45,
	crit_chance = 0,

	additional_spell = "Spell_CinquedeaAIM_Self",
		
	default_icon				= "ItemSubtype_CinquedeaAIM",	
		
	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius = 10,
	muzzleflash_time = 1,
	shot_effect = "particles/gadget/multishot_muzzle",
	shot_once_sound = "sound/destroyer/RocketSilo_launch",
	activate_sound = "sound/gadgets/common_activate",
}

Def.Projectile_CinquedeaAIM = 
{
	apply_shake = true,
	class = "Rocket",
	
	spell	= "Spell_CinquedeaAIM_Debuff",

	effect = "particles/weapons/plasma/plasma_guard_projectile",

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
	explosion_blast_wave = "Blastwave_CinquedeaAIM",
	model 				= "models/misc/invisible_model",
	missile_defence_immune = true,
	missile_detection_immune = true,
	override_blast_wave_damage = true,
	is_guided 			= true,
	angular_velocity	= 80,
	flare_size			= 0.0,
}

Def.Blastwave_CinquedeaAIM = 
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 10,
	blast_minDistance = 2,
	class = "BlastWave",
	--damage_kinetic = 1000,
	-- effect = "particles/explosions/artillery_fire",
	in_editor = false,
	-- sound = "sound/explosion/small_rocket_expl",
}

Def.Module_GuidedMissile_Carolingian =
{
	--inherit				= "Module_GuidedMissile",
	
	class 				= "GuidedMissileModule",
	
	in_editor			= false,
	
	module_type			= ai.ModuleType.SPECIAL,
	class_mask			= ai.ShipClass.LARGE,
	
	cooldown			= 16,
	energy_cost 		= 300.0,
	
	--activate_effect		= "",
	--activate_module_effect = "",
	activate_sound		= "sound/weapons/rockets/gm_launch",
	
	item_subtype		= ItemSubtype.Carolingian_GuidedMissile,
	

	--damage_kinetic		= 10000,	

	projectile			= "Projectile_GuidedMissile_Carolingian",
	explosion_blast_wave = "BlastWave_Carolingian_GuidedMissile",
	
	default_icon		= "ItemSubtype_Carolingian_GuidedMissile",	
}

Def.Projectile_GuidedMissile_Carolingian = 
{

	inherit 			= "GuidedMissile",
	--class						= "Rocket",
	in_editor			= false,

	--model 				=	"models/weapons/missiles/guided_missile",
	model = "models/weapons/bs_torpedo_mid",
	spell 				= "Spell_Carolingian_GuidedMissile",
	detonation_radius 	= 0,
	--rocket_class		= ai.RocketClass.LARGE,
	
	speed 				= 78,--65, --63
	angular_velocity	= 30.5,--15,
	max_range			= 1000,
	
	effect = "particles/weapons/missile/rocket_trail_mid",
	
   	work_sound			= "sound/weapons/rockets/gm_rocket_fly",
	spectate_work_sound = "sound/weapons/rockets/gm_engine_loop",
	jam_screen_effect	= "",

	--spell_on_launch 	= "Spell_Carolingian_GuidedMissile",
	--spell_on_launch	= "Spell_BasheGun_Cast1",

		flare_angle = 180,
		flare_color = "255 100 100 10",
		flare_size = 0.1,
		flare_nebulosity = 0.2,
}

Def.BlastWave_Carolingian_GuidedMissile = 
{
	inherit				= "GuidedMissileBlastWave",
	blast_maxDistance	= 12,
	damage_thermal		= 0,
	damage_kinetic		= 10000,
}

Def.Module_FakeShipBackstab =  
{
	class					= "ActiveModule",

	cooldown				= 40,
	energy_cost				= 100,
	
	item_subtype 			= ItemSubtype.FakeShipBackstab,
	module_type				= ai.ModuleType.SPECIAL,


	--spawn_guided_clone		= true,
	spell 					= "Spell_FakeShipBackstab_stealth",
	additional_spell				= "Spell_FakeShipBackstab",	


	spawn_clones		= 1,
	--spell_on_clone_death	="SpecialStunClone_Stun",
	--guided_clone_detonation_radius = 8,
	--spawn_clones	= nil,
	 spawn_clones_radius 	= 1.5,
	 clones_power 			= 1,
	 clones_ttl  			= 12,

	default_icon 			= "ItemSubtype_FakeShipBackstab",


}

Def.Module_Glass_BlackoutGenerator =  
{
	inherit = "Module_BlackoutGenerator_T4_Base",
	item_subtype		= ItemSubtype.Glass_BlackoutGenerator,	
	
	spell	= "Spell_Glass_BlackoutGenerator",
	deactivate_spell	= "Spell_Glass_BlackoutGeneratorInvulnerability",
	default_icon 			= "ItemSubtype_Glass_BlackoutGenerator",
	uiName					= "Module_BlackoutGeneratorGlass_Name",
	uiDesc					= "Module_BlackoutGeneratorGlass_Desc",
}

Def.Module_Glass_TimeBoost =  
{
	inherit = "Module_TimeBoost_T4_Base",
	spell	= "Spell_Glass_TimeBoost",
	
	activate_sound = "sound/el_modules/GreenTimeBoost",	
	default_icon 			= "ItemSubtype_Glass_TimeBoost",
		uiName					= "Module_TimeBoostGlass_Name",
	uiDesc					= "Module_TimeBoostGlass_Desc",
}

Def.Module_Glass_Disintegrator =  
{
	inherit = "Module_Disintegrator_T4_Base",
	item_subtype		= ItemSubtype.Glass_Disintegrator,
	
	projectile			= "Projectile_Disintegrator",
	
	spell_on_hit		= "Spell_Glass_Disintegrator",
	
	activate_sound 		= "sound/gadgets/disintegrator/dis_activate",
	deactivate_sound	= "sound/gadgets/disintegrator/dis_deactivate",
	shot_once_sound		= "sound/gadgets/disintegrator/dis_fire",
	work_sound 			= "sound/gadgets/disintegrator/dis_work_loop_p",
	
	default_icon 			= "ItemSubtype_Glass_Disintegrator",
		uiName					= "Module_Disintegrator_Name",
	uiDesc					= "Module_Disintegrator_Desc",
}

Def.Projectile_Glass_Disintegrator =
{
	inherit			= "Projectile_Disintegrator",
	--model			= "models/weapons/plasma_red_medium",
	--class			= "Rocket",	
	
	--spell 					= "SuppressingFire",
	
	hit_effect		= "particles/weapons/sniper/hit",
	effect 			= "particles/weapons/sniper/projectile",
	shadowCaster		= false,
	impact_type		= "disintegrator",
	work_sound 		= "sound/gadgets/disintegrator/dis_fly",
}

Def.Module_Glass_MicroWarp =  
{
	inherit = "Module_MicroWarp_Basic_T4_Mk1",
	--spell	= "Module_MicroWarp_Basic_T4_Mk1",
	prep_time		= 0.6,		-- время разгона
	spell_on_warp	= "Spell_Glass_MicroWarp", -- в момент отварпа. не ломается от столкновений
	prep_loop		= "sound/gadgets/legion_warp_prep",
	
	-- max_speed_percent= 1.2,
	-- spell_on_max_speed_plus = "Spell_Glass_MicroWarp",
	
	default_icon 			= "ItemSubtype_Glass_MicroWarp",
		uiName					= "ModuleMicroWarpGlass_Name",
	uiDesc					= "Module_MicroWarpGlass_Desc",
}

Def.Module_Glass_CloakingDevice =  
{
	inherit = "Module_CloakingDevice_Basic_T4_Mk1",
	spell				= "Spell_Glass_Cloaking",
	deactivate_spell 	= "Bonus_damage",
	
	activate_sound = "sound/gadgets/stealth_on",
	deactivate_sound = "sound/gadgets/stealth_off",	
	default_icon 			= "ItemSubtype_Glass_CloakingDevice",
		uiName					= "Module_CloakingDeviceGlass_Name",
	uiDesc					= "Module_CloakingDeviceGlass_Desc",
}

Def.Module_Glass_FrigateDrone =  
{
	inherit = "Module_FrigateDrone_T4_Base",
	ammo	= 4,
	drone_num = 4,
	ammo_regen_time = 16,
	ammo_regen_max	= 4,
	ammo_start	= 2,
	damage_thermal = 200,
	
	drone_respawn_period = 16,

	spell	= "Spell_Glass_FrigateDrone",
	
	activate_sound		= "sound/gadgets/FrigateDrone/fd_launch",
	activate_drone_effect = "particles/gadget/drone_overcharge",
	activate_drone_beam_fx = "particles/gadget/drone_beam",
	
	default_icon 			= "ItemSubtype_Glass_FrigateDrone",
		uiName					= "Module_FrigateDroneGlass_Name",
	uiDesc					= "Module_FrigateDroneGlass_Desc",
}

Def.Module_Glass_PlasmaWeb =  
{
	inherit = "Module_PlasmaWeb_T4_Base",
	spell				= "Spell_Glass_PlasmaWeb",
	additional_spell	= "Spell_Glass_PlasmaWeb2",


	activate_beam_fx = "particles/gadget/plasma_web_beam_once",
	activate_sound = "sound/gadgets/plasmaweb_shot",
	default_icon 			= "ItemSubtype_Glass_PlasmaWeb",
		uiName					= "Module_PlasmaWebGlass_Name",
--	uiDesc					= "Module_PlasmaWebGlass_Desc",
}

Def.Module_Glass_EnergyShieldCommander =  
{
	inherit = "Module_EnergyShieldCommander_T4_Base",
	spell				= "Spell_Glass_EnergyShieldCommander",
	default_icon 			= "ItemSubtype_Glass_EnergyShieldCommander",
		uiName					= "Module_EnergyShieldCommanderGlass_Name",
	uiDesc					= "Module_EnergyShieldCommanderGlass_Desc",
}

Def.Module_Glass_PhaseShield =  
{
	inherit = "Module_PhaseShield_T4_Base",
	spell0 				= "Spell_Glass_PhaseShield_Phase1",
	spell1				= "Spell_Glass_PhaseShield_Phase0",
	spell2 				= "Spell_Glass_PhaseShield_Phase2",	
	
	default_icon 			= "ItemSubtype_Glass_PhaseShield0",
	ui_ico_0			= { target_system = { tex = "ItemSubtype_Glass_PhaseShield1", }, },
	ui_ico_1			= { target_system = { tex = "ItemSubtype_Glass_PhaseShield0", }, },
	ui_ico_2			= { target_system = { tex = "ItemSubtype_Glass_PhaseShield2", }, },
	
		uiName					= "Module_PhaseShieldGlass_Name",
	uiDesc					= "Module_PhaseShieldGlass_Desc",
}

Def.Module_UballTimeBoost = 
{
	cant_be_bought 					= true,
	class 							= "ActiveModule",
	in_editor 						= false,
	
	module_type						= ai.ModuleType.SPECIAL,
	
	cooldown						= 20,
	energy_cost						= 70,
	energy_cost_per_second			= 300,
	
	trigger_aura					= true,
	spell							= "Spell_UFOBall_TimeBoost",
	
	item_subtype					= ItemSubtype.UballTimeBoost,
	default_icon					= "ItemSubtype_UballTimeBoost",

	activate_sound					= "sound/gadgets/timeboost_on",
}

Def.Module_SaturnAOEDamage =
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 40,
	energy_cost					= 1000,

	charge_damage			= 10000,
	charge_mask			= ai.ChargeType.OUTGOING_DAMAGE_SHIP,
	consume_aura		= ai.Aura.CHARGE_SPELL,

	charge_spell_on_damage		= "Spell_SaturnCharge1",

	spell 						= "Spell_SaturnClean1",
	additional_spell			= "Spell_SaturnAOEDamage",
	item_subtype				= ItemSubtype.SaturnCharge1,
	default_icon				= "ItemSubtype_SaturnAOEDamage",
	
	activate_sound				= "sound/gadgets/timeboost_on",
}

Def.Module_SaturnModuleDamage =
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 40,
	energy_cost					= 1000,

	charge_damage			= 10000,
	charge_mask			= ai.ChargeType.OUTGOING_DAMAGE_SHIP,
	consume_aura		= ai.Aura.CHARGE_SPELL,

	charge_spell_on_damage		= "Spell_SaturnCharge2",

	spell 						= "Spell_SaturnClean2",
	additional_spell			= "Spell_SaturnModuleDamage",
	item_subtype				= ItemSubtype.SaturnCharge2,
	default_icon				= "ItemSubtype_SaturnModuleDamage",
	
	activate_sound				= "sound/gadgets/timeboost_on",
}

Def.Module_SaturnDamage =
{
	cant_be_bought 				= true,
	class 						= "ActiveModule",
	in_editor 					= false,
	module_type					= ai.ModuleType.SPECIAL,
	
	cooldown					= 40,
	energy_cost					= 1000,

	charge_damage			= 10000,
	charge_mask			= ai.ChargeType.OUTGOING_DAMAGE_SHIP,
	consume_aura		= ai.Aura.CHARGE_SPELL,

	charge_spell_on_damage		= "Spell_SaturnCharge3",

	spell 						= "Spell_SaturnClean3",
	additional_spell			= "Spell_SaturnDamageBuff",
	item_subtype				= ItemSubtype.SaturnCharge3,
	default_icon				= "ItemSubtype_SaturnDamage",
	
	activate_sound				= "sound/gadgets/timeboost_on",
}

Def.Module_CorV2Clone =   
{
 
	class					= "ActiveModule",
 
	cooldown				= 35,
	energy_cost				= 100,
	
	item_subtype 			= ItemSubtype.CorV2Clone,
	module_type				= ai.ModuleType.SPECIAL,
--

	spawn_guided_clone		= true,
	
	spell 					= "Spell_CorV2_self",
	
	deactivate_spell		= "Spell_CorV2_Self2",

	spell_on_clone_death	="Spell_CorV2_AOE",
	guided_clone_detonation_radius = 8,
	--spawn_clones	= nil,
	spawn_clones_radius 	= 1.5,
	clones_power 			= 1,
	clones_ttl  			= 15,
	
	--shared_cooldown_id		= 1,
	
	death_blast_wave_clone =  "Blastwave_CorV32", -- 
	default_icon 			= "ItemSubtype_CorV2_Clone",

	-- Cybersport restrictions
	-- ods_export		= true,
	-- storeItemId		= 1,
	-- tier			= 4,
	-- item_lvl		= 23,
	-- rank_min		= 1,
	-- rank_max		= 17,
	-- premiumPrice	= 99999,
	-- cant_be_bought	= true,
}

Def.Blastwave_CorV32 =
{   
	intensity		= 45,
	damage_emp		= 18000,
	blast_maxDistance= 40,
	blast_minDistance= 2,
	light_radius	= 20,
	light_time		= 0.8,
	class			= "BlastWave",
	apply_damage	= true,
	uiName			= "BlastWave_SM_Torpedo_T5_C",
	effect = "particles/explosions/shp_exp_hologram",
	sound 				= "sound/explosion/big_rocket_expl",	
}

Def.Module_GreenReconPlasmaWeb = 
{
	activate_beam_fx = "particles/gadget/plasma_web_beam_once",
	activate_sound = "sound/gadgets/plasmaweb_shot",

	in_editor 					= false,	
	class = "ActiveModule",
	module_type = ai.ModuleType.SPECIAL,	
	
	cooldown = 40,

	energy_cost = 50,
	hull_cost	= 500,
	
	item_subtype = ItemSubtype.GreenReconPlasmaWeb,

	spell = "Spell_GreenReconPlasmaWeb",
	additional_spell = "Spell_GreenReconPlasmaWebHEAL",
	
	default_icon = "ItemSubtype_GreenReconPlasmaWeb",
}



Def.Module_GreenReconCloseWeap = 
{
	in_editor 					= false,
	class = "ActiveModule",	
	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.GreenReconCloseWeap,
	
	cooldown = 40,
	--trigger_aura = true,

	hull_cost	= 500,

	-- charge_damage		= 2000,
	-- charge_mask			= ai.ChargeType.OUTGOING_DAMAGE_SHIP,
	-- consume_aura		= ai.Aura.CHARGE_SPELL,
	-- charge_spell_on_damage		= "Spell_GreenReconCrystalRecCahrge",
	
	spell	= "Spell_GreenReconCloseWeap_poriodic",

	activate_sound = "sound/gadgets/plasmaweb_shot",	
	
	default_icon = "ItemSubtype_GreenReconCloseWeap",
}

Def.Module_GreenReconFetters = 
{
	in_editor 					= false,
	class = "ActiveModule",	
	module_type = ai.ModuleType.SPECIAL,
	item_subtype = ItemSubtype.GreenReconFetters,
	
	cooldown = 40,

	energy_cost	= 120,
	hull_cost	= 500,

	spell	= "Spell_GreenReconFetters",
	additional_spell = "Spell_GreenReconFetters_HEAL",

	activate_sound = "sound/gadgets/plasmaweb_shot",	
	--work_beam_fx = "particles/gadget/alien_beam_souls",
	
	
	default_icon = "ItemSubtype_GreenReconFetters",
}

Def.Module_GreenReconHarpoon =
{
    inherit             = "Weapon_Base",
    class               = "HarpoonGun",
    item_subtype        = ItemSubtype.GreenReconHarpoon,	
	in_editor			= false,
	module_type				= ai.ModuleType.SPECIAL,
    cooldown            = 30, --40
    energy_cost         = 150,
	hull_cost			 = 300,
	hull_cost_per_second = 150,
	
	activate_entity_ttl = 20, --длительность работы (было 12)

    projectile          = "Projectile_GreenReconHarpoon",
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

	--spell_on_equip		= "Spell_GreenReconCloseWeap_poriodic",

    dispersion          = 0,
    crit_chance			= 0,

    shoot_mode          = ai.FiringModuleShootMode.SINGLE_SHOT, --#83218

	model 				= "models/modules/m_active/spear/spear_gadget",
    shot_once_sound     = "sound/gadgets2/HarpoonGun/hg_shot",
    default_icon        = "ItemSubtype_GreenReconHarpoon",

    connection_beam_fx  = "particles/gadget/hack_beam_looped",
	

}

Def.Projectile_GreenReconHarpoon =
{
	inherit        		= "Weapon_BaseRocket", --"Projectile_Plasma_Default",
    model          		= "models/objects/gameplay/ball/rope/harpoon",
	
	is_guided			= true;
	
	angular_velocity    = 50,
	hitbox_min 			= Vec3( -0.4, -0.4, -0.4 ), -- -0.2
	hitbox_max			= Vec3( 0.4, 0.4, 0.4 ),	-- 0.2
	
	apply_shake			= true,
	spell				= "Spell_GreenReconHarpoon1",
	
	missile_defence_immune = true,
	missile_detection_immune = true,
	
	hit_effect			= "particles/weapons/plasma/hit",
    effect         		= "particles/weapons/missile/rocket_trail_small",
    death_entity   		= "GreenReconHarpoon_Rope",
    impact_type    		= "plasma",
}

Def.GreenReconHarpoon_Rope =
{
    class                       = "Rope",
    in_editor                   = false,
    model                       = "models/objects/gameplay/ball/rope/rope_football",
    detach_sound                = "sound/gadgets2/HarpoonGun/hg_detach",

    rope_max_absolute_stretch   = 10, --10
    rope_max_relative_stretch   = 200, --2
    rope_min_mass               = 1,
    rope_max_mass               = 8000,
    rope_mass_coef              = 1.15,
    rope_coil_needs_length_min 	= 30,
    rope_coil_speed = 1,--10
	
	--spell						= "Spell_GreenReconHarpoon",

    use_team_skin = true,

    hardness_time = 10000, --1
}

Def.Module_Stuka =
{
	class						= "LandingMultiPlatformModule",
	
	platform_1_bone = "platform_1_bone",
	--platform_2_bone = "platform1",
	--platform_3_bone = "platform2", --2
	--platform_4_bone = "platform3", --3
	
	energy_cost						= 500,

	drone						= "LandingMultiPlatform_Drone",
	drone_prodaction_time		= 25, --25,
	drone_guard_range			= 100, -- радиус охранной зоны, в пределах которой дрон защищает корабль, если он не посажен на платформу и модуль не активирован.
	drone_control_range			= 500, -- радиус зоны, в пределах которой дрон может атаковать цель, когда модуль активирован
	drone_pos_offset			= Vec3( 0, 1.08, 0 ),
	drone_landing_range			= 75,
	
	--spell_on_guest				= "", --???
	--spell_on_parent 			= "LandingPlatform_Buff2Parent4Guest", -- спелл когда на платформе сидит алли
	--spell_on_landed_ship 		= "LandingPlatform_Buff2GuestShip",   -- спелл на гостя - алли -- референс со спела LandingPlatform_Buff2Guest
	--spell_on_drone_take_off 	= "LandingPlatform_Buff2Drone",  -- только что взлетевший дрон жарит ярче
	
	spell_depends_on_guests		= "LandingPlatform_Buff2Parent4AllyNearby", -- перенакладывается, если что-то взлетает или садиться с платформ модуля или с LandingPlatformModule
	work_spell	 				= "LandingPlatform_Buff2Landed", -- вместо spell_on_equip
	additional_work_spell		= "LandingPlatform_CastBoostAlly",
	spell_on_landed_drone 		= "LandingPlatform_Heal2Drone_Emperor",   -- спел на дронов, пока сидят на платформе
	
	default_icon				= "ItemSubtype_LandingMultiPlatformModule",

	interaction_distance 		= 15,
	interacting_fx				= "particles/gadget/drone_beam", 
	uiInteract					= "Capture_ShieldGenerator",
	
	--additional_cmd_activate_sound 	= "sound/gadgets2/lp_add_activate",
	additional_cmd_ui_name 			= "LandingMultiPlatformModule",
	additional_cmd_cooldown 		= 7,

	out_sound			= "sound/gadgets2/LandingMultyPlatform/lmp_landing",
	take_off_sound			= "sound/gadgets2/LandingMultyPlatform/lmp_takeoff",
	activate_attack_sound 		= "sound/gadgets2/LandingMultyPlatform/lmp_activate",
	deactivate_attack_sound		= "sound/gadgets2/LandingMultyPlatform/lmp_deactivate",

	in_fx						= "particles/gadget/teleport",
	out_fx						= "particles/gadget/teleport",
	
	landed_entity_fx			= "particles/gadget/landing_platform/landing_platform",
	item_subtype				= ItemSubtype.LandingMultiPlatformModule,
	
	rot_params = {
		[ai.ShipClass.SMALL]	= { rot_max_speed = 100, rot_accel = 100, rot_decel = 300, },
		-- [ai.ShipClass.MEDIUM]	= { rot_max_speed = 65, rot_accel = 65, rot_decel = 195, },
		-- [ai.ShipClass.LARGE]	= { rot_max_speed = 25, rot_accel = 25, rot_decel = 75, },
	},
	
	ui_ico_0 = { target_system 	= { tex = "ItemSubtype_LandingMultiPlatformModule", }, },
    ui_ico_1 = { target_system 	= { tex = "ItemSubtype_LandingMultiPlatformModuleActive", }, },
}

Def.Module_AB2Stuka =
{
	class 		= "FiringModule",
	in_editor 	= false,
	module_type			= ai.ModuleType.SPECIAL,
	item_subtype		= ItemSubtype.AB2Stuka,
	
	model 			= "models/weapons/plasma/power/shooter_bark",
	--model 			= "models/weapons/plasma/power/vortex",
	activate_sound		= "sound/gadgets/timeboost_on",
	track 				= ai.TrackMode.ENEMY,
	--check_aim_orientation = true,
	check_aim_orientation_angle = 55,
	barrel_rot_speed 	= 720,
	
	--additional_spell	= "Spell_AB2Stuka_overcharge",
	
	optimal_range 		= 200,
	max_range 			= 200,

	fire_rate 			= 250,
 
	dispersion			= 5,

	damage_emp		= 250,


	shoot_mode = ai.FiringModuleShootMode.AUTO, 
	projectile 			= "Projectile_AB2Stuka_offline",
	active_projectile 	= "Projectile_AB2Stuka_online",
	projectile_speed	= 400,
	shot_effect 		= "particles/weapons/module_ab1_muzzle",

	duration 			= 10,
	energy_cost 		= 150,
	cooldown 			= 40,

	muzzleflash_color = { kinetic = "241 186 20 100", emp = "241 186 20 100", thermal = "241 186 20 100", },
	muzzleflash_radius 		= 1,
	muzzleflash_time 		= 0.1,

	default_icon		= "ItemSubtype_AB2Stuka",
	shot_once_sound = "sound/gadgets2/ab1_shot",
}

Def.Projectile_AB2Stuka_offline =
{
	inherit				= "Projectile_LaserSniper",
	effect 				= "particles/weapons/plasma/plasma_electric_projectile", --"particles/weapons/blaster/neutron_projectile",
	
	hit_effect			= "particles/weapons/module_ab1_hit",
--	work_sound 		= "sound/weapons/xo/bullet_fly",
}
Def.Projectile_AB2Stuka_online =
{
	inherit				= "Projectile_AB2Stuka_offline",--"Projectile_SingularityCannon",
	class				= "Rocket",
	fire_rate_mul		= 2,
	spell				= "Spell_AB2Stuka",
	explosion_blast_wave= "Blastwave_AB2Stuka",
	missile_defence_immune 	= true,
}

Def.Blastwave_AB2Stuka =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_emp		= 120,
	blast_maxDistance	= 20,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= false,
	self_damage_coef	= 0,

	-- effect 				= "particles/explosions/artillery_fire",
	-- light_color 		= "255 182 128 100",
	-- light_radius 		= 20,
	-- light_time 			= 0.8,
	-- sound 				= "sound/explosion/small_rocket_expl",
}