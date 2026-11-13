Def.Ship_MechFighter =
{
	inherit							= "Ship_Large_Tank",
	storeItemId						= 0,
	
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	hull_health						= 20000,
	shield_max						= 5000,
	energy_max						= 1000,
	hull_health_mul					= 0,
	shield_max_mul					= 0,
	energy_max_mul					= 0,
	
	shield_resist_kinetic			= 0,
	shield_resist_emp				= 0,
	shield_resist_thermal			= 0,
	hull_resist_kinetic				= 0,
	hull_resist_emp					= 0,
	hull_resist_thermal				= 0,
	
	shield_regen					= 1500,
	hull_regen						= 35,
	energy_regen					= 3,

	vision_radius					= 1200,
	
	max_speed 						= 24, 		-- максимальная скорость (в м/с) 
	acceleration 					= 8,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2.7,		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.9,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.2,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 32,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 130,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 130,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 4,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.95,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 0.3,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 5.7,		-- 8 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 5.7,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 1,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 9*0.7*1.25,	-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 12,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 12,
	decel_x							= 3,
	max_yspeed						= 9*0.7*1.25,
	accel_y0						= 12,
	accel_y1						= 12,
	decel_y							= 3,
	
	rot_xmaxspeed					= 50,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 30*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 18*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 50*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 50,
	rotaccel_y0						= 30*2,
	rotaccel_y1						= 18*2,
	rotdecel_y						= 50*2,
	rot_zmaxspeed					= 56,
	rotaccel_z0						= 30*2,
	rotaccel_z1						= 25*2,
	rotdecel_z						= 500*2,
	
	contact_damage_min_speed		= 100,
	contact_damage_cf				= 0,
	
	weapon_slots 					= 1,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "root",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "root",

 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "root",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "root",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "root",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "root",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "root",
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "root",
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_MechFighter_Sword",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]		= "Module_MechFighter_Shield",
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_MechFighter_Speed",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]			= "Module_MechFighter_EnergyBoost",
	},
	
	default_rocket_munition 							= "MechFighter_Shield",
	
	cpu_grades						= designers.cpu_large_grades,
	armor_grades					= designers.armor_grades,
	shield_grades					= designers.shield_grades,
	capacitor_grades				= designers.capacitor_large_mech,
	engine_grades					= designers.engine_large_r1_craftSpec,
	
	default_custom_elements =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 ]				= "Default_Premium_r1_i1",
		[ ai.VesselCustomSlot.MATERIAL_1 ]				= "Default_Premium_r1_i2",
		[ ai.VesselCustomSlot.MATERIAL_2 ]				= "Default_Premium_r1_i3",
	},

	customization_groups =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 ]				={VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_1 ]				={VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_2 ]				={VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MPRESET_0 ]				={VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.CAMOUFLAGE},
	},
	
	uiName							= "MechFighter",
	ship_name						= "MechFighter",
	
	ship_class						= ai.ShipClass.LARGE,
	signature						= ai.Signature.LARGE,
	role							= ai.ShipRoles.GUARD,
	rank							= 17,
	race							= ai.Race.SPECIAL,
	
	special_grades					= ai.DONT_INHERIT,
	
	model							= "models/characters/robot_event/robot_event",
	death_wreck						= "Wreck_R1_L",
	cam_config						= "cam_ship_large_imp",
	
	is_sword_robot					= true,
	
	hud_ico							= "nlo_2",
	hangarIco						= "Ship_MechFighter",
	default_icon					= "shopIco_MechFighter",
	hangarIcoSmall					= "Ship_MechFighter_small",
}

Def.Weapon_MechFighter_Sword =
{
	in_editor						= false,
	cant_be_bought					= true,
	
	inherit							= "Weapon_AutoGun",
	
	fire_rate						= 60,
	projectile_speed				= 60,
	optimal_range					= 7,
	max_range						= 8,
	damage_kinetic					= 30000,
	crit_chance						= 0.05,
	crit_damage						= 0.5,
	
	shot_energy_cost				= 240,
	
	track 							= ai.TrackMode.AIM,
	max_aim_yaw						= 4, -- (в градусах)
	max_aim_pitch  					= 4, -- (в градусах)

	heat_overcharge					= false,

	projectile						= "Projectile_MechFighter_Sword",
	
	shot_once_sound					= "sound/weapons/rockets/pizza_rocket_launch",
}

Def.Projectile_MechFighter_Sword =
{
	class							= "Projectile",
	in_editor						= false,
	mass							= 5,
	
	--effect						= "particles/weapons/railgun/projectile",
	hitbox_min 						= Vec3( -1, -1, -0.3 ),
	hitbox_max						= Vec3( 1, 1, 0.3 ),
			
	apply_shake						= true,
	
	hit_effect						= "particles/weapons/railgun/hit",
	hit_ship_effect 				= "particles/weapons/railgun/hit_ship",
	hit_shield_effect 				= "particles/weapons/railgun/hit_ship",
	hit_crit_ship_effect 			= "particles/weapons/railgun/hit_crit",
	hit_crit_shield_effect 			= "particles/weapons/railgun/hit_crit_shield",
	
	shadowCaster					= false,
	impact_type 					= "railgun",
	
	inherit_speed					= true,
}

Def.Module_MechFighter_Shield = 
{
	class							= "ActiveModule",
	in_editor						= false,
	
	activate_entity_max				= 1,
	
	energy_cost						= 250,
	cooldown						= 5,
	
	block_friendly_projectile		= true,
	
	--spawn_offset					= Vec3( 0, 0, -14 ),

	attach_bone						= "root",
	
	check_spawn_collision 			= true,
	
	activate_sound					= "sound/destroyer/SShield_activate",
	deactivate_sound				= "sound/destroyer/SShield_off",
	
	--trigger_aura					= true,
}

Def.MechFighter_Shield = 
{
	class							= "AuraHolderEntity",
	in_editor						= false,
	hack_immune 					= true,
	model							= "models/characters/robot_event/shield",
	physics							= { solid_type = solid.model, material = "GiantShield", mass = 100, static_collision = true },
	
	health 							= 20000,
	ttl								= 3,
	damageable						= true,
	network_sync 					= true,
	
	weapon_mode						= ai.ShieldWeaponMode.BLOCK,
	radar_vison						= ai.ShieldRadarVisionMode.PASS,
	
	spell_on_spawn					= "Spell_MechFighter_Shield",
}

Spell.Spell_MechFighter_Shield =
{
	influence						= ai.Spell.APPLY_AURA,
	target							= ai.SpellTarget.CASTER,
	aura 							= ai.Aura.DISABLED_WEAPON,
	aura_target =
	{
		target						= ai.SpellTargetGeneral.PARENT,
		class 						= ai.SpellTargetClass.SHIP,
	},
	
	duration 						= 3,
	
	isBuff							= false,
	
	hud_visible						= false,
	
	gameplay_specific				= true,
}

Def.Module_MechFighter_Speed =
{
	class								= "ActiveModule",
	in_editor 							= false,
	
	energy_cost							= 150,
	cooldown							= 5,
	trigger_aura						= true,
	energy_cost_per_second				= 100,
	
	spell								= "Spell_MechFighter_Speed",
	
	activate_sound 						= "sound/gadgets/common_activate",
	
	item_subtype						= 9000,
}

Spell.Spell_MechFighter_Speed =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.FAST_MOVEMENT,
	target								= ai.SpellTarget.SELF,
	aura_target							= ai.SpellTarget.HOLDER,

	aura_param							= 1.77,

	isBuff								= true,
	
	aura_start_sound					= "sound/gadgets/stealth_on",
	aura_end_sound 						= "sound/gadgets/stealth_off",
}

Def.Module_MechFighter_EnergyBoost =
{
	class								= "ActiveModule",
	in_editor 							= false,
	
	energy_cost							= 1,
	cooldown							= 90,
	
	spell								= "Spell_MechFighter_EnergyBoost",
	
	activate_sound 						= "sound/gadgets/common_activate",
}

Spell.Spell_MechFighter_EnergyBoost =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.ADD_ENERGY_PERIODIC,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	aura_param							= 100,
	period								= 0.2,
	duration							= 4,

	isBuff								= true,
	
	aura_target_fx						= "particles/gadget/hull_heal",
}