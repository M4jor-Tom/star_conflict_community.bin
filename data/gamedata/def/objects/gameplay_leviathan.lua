Def.Ship_Leviathan_S =
{
	inherit							= "Alien_T5",
	storeItemId						= 0,
	
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	hull_health						= 600000*0.68*0.3,--150000,
	shield_max						= 315000*0.68*0.3,--80000,
	energy_max						= 10000,
	hull_health_mul					= 0,
	shield_max_mul					= 0,
	energy_max_mul					= 0,
	
	shield_resist_kinetic			= 50*0.7,
	shield_resist_emp				= 70*0.7,
	shield_resist_thermal			= 50*0.7,
	hull_resist_kinetic				= 70*0.7,
	hull_resist_emp					= 50*0.7,
	hull_resist_thermal				= 50*0.7,
	
	shield_regen					= 400,
	hull_regen						= 200,
	energy_regen					= 6,

	vision_radius					= 1200,
	
	max_speed 						= 65, 	-- максимальная скорость (в м/с) 
	acceleration 					= 30*0.8, 	-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,  		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.9,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.2,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 12,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 48,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 65,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 8,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.8,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 14,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 18,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.8,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 20*0.7*1.25*0.8,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 40,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 45,
	decel_x							= 20,
	max_yspeed						= 20*0.7*1.25*0.8,
	accel_y0						= 40,
	accel_y1						= 45,
	decel_y							= 20,
	
	rot_xmaxspeed					= 132,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 140*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 90*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 200*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 132,
	rotaccel_y0						= 140*2,
	rotaccel_y1						= 90*2,
	rotdecel_y						= 200*2,
	rot_zmaxspeed					= 78,
	rotaccel_z0						= 150*2,
	rotaccel_z1						= 150*2,
	rotdecel_z						= 500*2,
	
	contact_damage_min_speed		= 100,
	contact_damage_cf				= 0,
	
	crowd_control_coef				= 0.5,
	cooldown_debuff_reduce_coef		= 0.2,
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]			= "root",
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_ReaverGun_Prec",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 	= "Module_SinglePortal_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 	= "Module_EnergyLance_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 	= "Module_PlasmaWeb_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 	= "Module_Camouflage_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 	= "Module_FakeShips_Prec",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 	 	= "Module_JumpForward_Prec",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] 	 		= "Module_EnemyScanner_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ] 	 	= "Module_BuffLowHealth_75_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ] 	 	= "Module_BuffLowHealth_50_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ] 	 	= "Module_BuffLowHealth_25_Prec",
	},
	
	default_rocket_munition 		= "SpaceMissile_MagnetMine_Prec",
	
	uiName							= "Alien_guard",
	ship_name						= "Alien_guard",--"Infected_ship",
	
	relationship_group				= ai.RelationshipGroups.Alien,
	ship_class						= ai.ShipClass.SMALL,
	signature						= ai.Signature.SMALL,
	role							= ai.ShipRoles.RECON,
	rank							= 17,
	race							= ai.Race.SPECIAL,
	
	special_grades					= ai.DONT_INHERIT,
	
	hud_ico							= "nlo_2",
	hangarIco						= "Ship_Leviathan_S",
	default_icon					= "shopIco_Ship_Leviathan_S",
	hangarIcoSmall					= "Ship_Leviathan_S_small",
}

Def.Ship_Leviathan_M =
{
	inherit							= "Ship_Precursor_Interceptor",
	storeItemId						= 0,
	
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	hull_health						= 1000000*0.64*0.7,--200000*1.5,
	shield_max						= 200000*0.64*0.7,--35000*1.5,
	hull_health_mul					= 0,
	shield_max_mul					= 0,
	
	shield_resist_kinetic			= 80*0.7,
	shield_resist_emp				= 100*0.7,
	shield_resist_thermal			= 80*0.7,
	hull_resist_kinetic				= 100*0.7,
	hull_resist_emp					= 80*0.7,
	hull_resist_thermal				= 80*0.7,
	
	shield_regen					= 800,
	hull_regen						= 200,
	energy_regen					= 6,

	vision_radius					= 2400,
	
	max_speed 						= 42, 	-- максимальная скорость (в м/с) 
	acceleration 					= 16, 	-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 1.2, 		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.6,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.1,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 12,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 48,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 65,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 8,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.8,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 14,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 15,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.8,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 13*0.7*1.25,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 19,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 19,
	decel_x							= 7,
	max_yspeed						= 13*0.7*1.25,
	accel_y0						= 19,
	accel_y1						= 19,
	decel_y							= 7,
	
	rot_xmaxspeed					= 85,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 110*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 90*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 200*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 85,
	rotaccel_y0						= 110*2,
	rotaccel_y1						= 90*2,
	rotdecel_y						= 200*2,
	rot_zmaxspeed					= 85,
	rotaccel_z0						= 80*2,
	rotaccel_z1						= 75*2,
	rotdecel_z						= 500*2,
	
	contact_damage_min_speed		= 100,
	contact_damage_cf				= 0,
	
	crowd_control_coef				= 0.5,
	cooldown_debuff_reduce_coef		= 0.2,
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]			= "root",
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_ScoutGun_Prec",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 		= "Module_Overcharge_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 			= "Module_Pulsar_Prec_M",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 			= "Module_WolfPack_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 			= "Module_Cloaking_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 			= "Module_MultiPortal_Prec",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 	 	= "Module_JumpForward_Prec",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] 	 		= "Module_EnemyScanner_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ] 	 	= "Module_BuffLowHealth_75_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ] 	 	= "Module_BuffLowHealth_50_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ] 	 	= "Module_BuffLowHealth_25_Prec",
	},
	
	default_rocket_munition 		= "GuidedDrone_Alien2D_Prec",
	
	cam_config						= "cam_ship_ufo",
	
	uiName							= "AI_crystal_bot",
	ship_name						= "AI_crystal_bot",
	
	relationship_group				= ai.RelationshipGroups.Alien,
	ship_class						= ai.ShipClass.MEDIUM,
	signature						= ai.Signature.MEDIUM,
	role							= ai.ShipRoles.TACKLER,
	rank							= 17,
	race							= ai.Race.SPECIAL,
	
	hud_ico							= "nlo_2",
	hangarIco						= "Ship_Leviathan_M",
	default_icon					= "shopIco_Ship_Leviathan_M",
	hangarIcoSmall					= "Ship_Leviathan_M_small",
}

Def.Ship_Leviathan_L =
{
	inherit							= "Ship_Precursor_Predator",
	storeItemId						= 0,
	
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	hull_health						= 1700000*0.72*1.2,--200000*2,
	shield_max						= 300000*0.72*1.2,--35000*2,
	hull_health_mul					= 0,
	shield_max_mul					= 0,
	
	shield_resist_kinetic			= 120,
	shield_resist_emp				= 150,
	shield_resist_thermal			= 120,
	hull_resist_kinetic				= 150,
	hull_resist_emp					= 120,
	hull_resist_thermal				= 120,
	
	shield_regen					= 1000,
	hull_regen						= 100,
	energy_regen					= 6,

	vision_radius					= 3600,
	
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
	
	crowd_control_coef				= 0.5,
	cooldown_debuff_reduce_coef		= 0.2,
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]			= "root",
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_AlienGun_Prec",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 		= "Module_TimeBomb_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 			= "Module_Pulsar_Prec_L",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 			= "Module_StasisGun_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 			= "Module_TRay_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 			= "Module_HackWeapon_Prec",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 	 	= "Module_JumpForward_Prec",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] 	 		= "Module_EnemyScanner_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ] 	 	= "Module_BuffLowHealth_75_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ] 	 	= "Module_BuffLowHealth_50_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ] 	 	= "Module_BuffLowHealth_25_Prec",
	},
	
	default_rocket_munition 		= "GuidedDrone_Alien2D_L_Prec",
	max_controlled_drones			= 4,
	
	cam_config						= "cam_ship_large_prec",
	
	uiName							= "Alien_predator",
	ship_name						= "Alien_predator",
	
	relationship_group				= ai.RelationshipGroups.Alien,
	ship_class						= ai.ShipClass.LARGE,
	signature						= ai.Signature.LARGE,
	role							= ai.ShipRoles.GUARD,
	rank							= 17,
	race							= ai.Race.SPECIAL,
	
	hud_ico							= "nlo_2",
	hangarIco						= "Ship_Leviathan_L",
	default_icon					= "shopIco_Ship_Leviathan_L",
	hangarIcoSmall					= "Ship_Leviathan_L_small",
}

Def.Ship_Leviathan_H =
{
	inherit							= "Alien_Leader",
	storeItemId						= 0,
	
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	hull_health						= 2000000*0.60,--200000*2.5,
	shield_max						= 350000*0.60,--35000*2.5,
	hull_health_mul					= 0,
	shield_max_mul					= 0,
	
	shield_resist_kinetic			= 180*0.35,
	shield_resist_emp				= 220*0.35,
	shield_resist_thermal			= 180*0.35,
	hull_resist_kinetic				= 220*0.35,
	hull_resist_emp					= 180*0.35,
	hull_resist_thermal				= 180*0.35,
	
	shield_regen					= 1500,
	hull_regen						= 100,
	energy_regen					= 6,

	vision_radius					= 500,
	
	max_speed 						= 12, 		-- максимальная скорость (в м/с) 
	acceleration 					= 5.5,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.8,		-- множитель к максимальной скорости поворота во время буста 
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
	
	max_xspeed						= 7*0.7*1.25,	-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 9,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 10,
	decel_x							= 3,
	max_yspeed						= 7*0.7*1.25,
	accel_y0						= 9,
	accel_y1						= 10,
	decel_y							= 3,
	
	rot_xmaxspeed					= 30,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 20*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 15*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 50*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 30,
	rotaccel_y0						= 20*2,
	rotaccel_y1						= 15*2,
	rotdecel_y						= 50*2,
	rot_zmaxspeed					= 36,
	rotaccel_z0						= 25*2,
	rotaccel_z1						= 25*2,
	rotdecel_z						= 500*2,
	
	contact_damage_min_speed		= 100,
	contact_damage_cf				= 0,
	
	weapon_slots					= 1,
	fire_sectors					= { 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, },
	fire_sector_incline				= 0,
	
	crowd_control_coef				= 0.5,
	cooldown_debuff_reduce_coef		= 0.2,
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]			= "root",
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_AlienGun2_Prec",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 	= "Module_SectorShield",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 		= "Module_PhaseBuff_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 			= "Module_Pulsar_Prec_H",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 			= "Module_EntityRay_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 			= "Module_RocketSilo_Prec",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 			= "Module_GravyGenerator_Prec",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 	 	= "Module_JumpForward_Prec",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] 	 		= "Module_EnemyScanner_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ] 	 	= "Module_BuffLowHealth_75_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ] 	 	= "Module_BuffLowHealth_50_Prec",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ] 	 	= "Module_BuffLowHealth_25_Prec",
	},
	
	default_rocket_munition 		= "DestrMunition_SectorShield_Prec",
	
	uiName							= "Alien_leader",
	ship_name						= "Alien_leader",
	
	relationship_group				= ai.RelationshipGroups.Alien,
	ship_class						= ai.ShipClass.HUGE,
	signature						= ai.Signature.HUGE,
	role							= ai.ShipRoles.OVERSEER,
	rank							= 17,
	race							= ai.Race.SPECIAL,
	
	hud_ico							= "nlo_2",
	hangarIco						= "Ship_Leviathan_H",
	default_icon					= "shopIco_Ship_Leviathan_H",
	hangarIcoSmall					= "Ship_Leviathan_H_small",
	
	children=
	{
		{ def = "PrecLargeEngine", joint = "fx1"},
		{ def = "PrecLargeFx", joint = "fx2"}, 
		{ def = "PrecLargeFx", joint = "fx3"}, 
		{ def = "PrecLargeFx", joint = "fx4"}, 
		{ def = "PrecLargeFx", joint = "fx5"}, 
		{ def = "PrecLargeFx", joint = "fx6"}, 
		{ def = "PrecLargeFx", joint = "fx7"}, 
		{ def = "PrecLargeFx", joint = "fx8"}, 
		{ def = "PrecLargeFx", joint = "fx9"}, 
		{ def = "PrecLargeFx", joint = "fx10"}, 
		{ def = "PrecLargeFx", joint = "fx11"}, 
		{ def = "PrecLargeFx", joint = "fx12"}, 
		{ def = "PrecLargeFx", joint = "fx13"},
	},
}

Def.Weapon_ReaverGun_Prec =
{
	inherit								= "Weapon_ReaverGun_T4",
	
	damage_emp		 					= 1500,
	
	fire_rate							= 90,
	
	projectile_speed					= 700,
	
	item_subtype						= ItemSubtype.ReaverGunPrec,
	
	default_icon						= "ItemSubtype_Weapon_ReaverGun_Prec",
}

Def.Weapon_ScoutGun_Prec =
{
	inherit								= "Weapon_ScoutGun",
	
	damage_emp		 					= 1500*1.1,
	
	max_range							= 600,

	projectile_speed					= 700,
	
	dispersion_max 						= 1.5,
	dispersion_add						= 0.30,
	dispersion_sub 						= 0.50,
	
	heat_max 							= 60,
	heat_add 							= 2.5,
	heat_sub 							= 15,  	
	overheat_time 						= 1,
	
	item_subtype						= ItemSubtype.ReaverGunPrec,
	
	default_icon						= "ItemSubtype_Weapon_ReaverGun_Prec",
}

Def.Weapon_AlienGun_Prec =
{
	inherit								= "Weapon_AlienGun_T4",

	item_subtype						= ItemSubtype.AlienGunPrec,
	
	damage_emp							= 2100,
	
	projectile_speed					= 300,
	
	projectile							= "Projectile_AlienGun_Prec",

	shot_once_sound 					= "sound/weapons/aliengun/ag_prec_shot",
	
	default_icon						= "ItemSubtype_Weapon_AlienGun_Prec",
}

Def.Projectile_AlienGun_Prec =
{
	inherit								= "Projectile_AlienGun",
	angular_velocity					= 6*0.8,
}

Def.Weapon_AlienGun2_Prec =
{
	inherit								= "Weapon_AlienGun2_T4",
	class_mask							= ai.DONT_INHERIT,
	
	item_subtype						= ItemSubtype.AlienGunPrec,
	
	damage_emp							= 4000,
	
	projectile_speed					= 350,
	
	projectile							= "Projectile_AlienGun2_Prec",
	
	default_icon						= "ItemSubtype_Weapon_AlienGun_Prec",
	
	shot_once_sound 					= "sound/weapons/aliengun/ag2_prec_shot",
	
}

Def.Projectile_AlienGun2_Prec =
{
	inherit								= "Projectile_AlienGun2",
	angular_velocity					= 30*0.8,
}

Def.SpaceMissile_MagnetMine_Prec =
{
	inherit								= "SpaceMissile_MagnetMine_T5_Mk3",
	storeItemId							= 0,
	
	empty_holder_cooldown				= 120,
	
	alien_damage_coef					= 1,
	crystal_damage_coef					= 1.8,
	
	item_subtype						= ItemSubtype.MagnetMinePrec,
	
	default_icon						= "SpaceMissile_MagnetMine_Prec",
}

Def.SinglePortalPrec = 
{
	class								= "TeleportGate",
	in_editor							= false,
	
	model								= "models/shields/teleport_single",
	
	teleport_cooldown					= 2,
	teleport_check_box_scale			= 0.9,
	--teleport_last_damage_time_min		= 0,
	teleport_reset_control				= false, -- если true, то корабль после телепорта корабль будет иметь нулевую скорость и будет направлен от ворот
	teleport_offset						= -3, -- дополнительное смещение корабля в направлении от ворот
	
	teleport_owner_only					= true,
	in_fx 								= "particles/gadget/teleport_alien",
	out_fx 								= "particles/gadget/teleport_alien",
	in_sound							= "sound/gadgets2/PortalGate_warp",
	out_sound							= "sound/gadgets2/PortalGate_warp",
	work_sound 							= "sound/gadgets2/SinglePortal_start_loop",
	
	children = 
	{
		{ effect = "particles/gadget/teleport_object_alien", joint = "root" },
	}
}

Def.Module_SinglePortal_Prec =
{
	class								= "TeleportGateModule",
	in_editor							= false,

	spawn_offset						= Vec3( 0, 0, -20 ),
	check_collision_box_extents			= Vec3( 0.3, 0.3, 25.0 ), -- для проверки коллизии

	energy_cost 						= 56,
	cooldown							= 40,
	
	activate_sound						= "sound/gadgets2/SinglePortal_activate",
	
	gate								= "SinglePortalPrec",
	straight_teleport					= true, -- если true, то создаются сразу два портала на расстоянии teleport_range_max, если ничего не мешает и на меньшем расстоянии, если есть препятствие.
	teleport_range_min					= 100,
	teleport_range_max					= 700, -- если ноль, то расстояние не ограничено(только для straight_teleport = false)
	teleport_gate_ttl					= 60,
	replace_extra_teleport_lines		= true, -- если true, то старые порталы уничтожаются при превышении максимального количества
	teleport_line_max					= 1, -- максимальное количество открытых телепортов(пар порталов)
	
	teleport_owner_only					= true,
	
	item_subtype						= ItemSubtype.SinglePortalPrec,
	
	default_icon						= "Module_SinglePortal_Prec",
}

Spell.Spell_JumpForward_Prec =
{
	influence_param				= -100,
	influence 					= ai.Spell.REVERSE_THRUSTER,
	target 						= ai.SpellTarget.CASTER,
	cast_fx						= "particles/gadget/jump_green",
	cast_position_fx 			= "particles/gadget/jump_green",
	cast_sound 					= "sound/el_modules/GreenJumpOnStrafe",
	fish_eye_time				= "0.5",
	fish_eye_max				= "0.25",
	
	--> урон_по_цели_будет = базовый_урон * ( 1 + текущее_расстояние_телепорта / Расстояние_увеличения_урона )
	base_damage 				= 2500, -- базовый_урон
	dist_damage 				= 150, -- Расстояние_увеличения_урона
}

Def.Module_JumpForward_Prec =
{
	class 						= "SpaceShipModule",
	in_editor 					= false,

	cooldown					= 18,
	show_cooldown_status		= true,
	--is_fast_movement			= true,
	double_up_spell				= "Spell_JumpForward_Prec",
	--silence_as_active_module	= true,
	owner_collision_absorb_damage	= true,
	--spell_on_owner_collision		= "Spell_RamHull_debuff_Prec",
	
	item_subtype				= ItemSubtype.PassiveJumpPrec,
	
	default_icon				= "Module_JumpForward_Prec",
}

--[[
Spell.Spell_RamHull_debuff_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.STUN,
	target =
	{
		target							= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target							= ai.SpellTarget.HOLDER,

	duration							= 1/5000,  -- 5000урона_от_столкновения = 1 сек

	isBuff								= false,
	ignore_additional_power				= true,
	diminish_control_aura				= false,
		
}
]]

Spell.Spell_PlasmaWeb_Prec =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.DAMAGE_THERMAL_SCALED,
	target						= ai.SpellTarget.LOCKED_TARGET,
	aura_target					= ai.SpellTarget.HOLDER,
	target_range				= 350,
	
	aura_param					= 870,

	duration					= 12,
	period						= 1,
	isBuff						= false,
	ignore_subtype				= true,
	
	period_module_fx = "particles/gadget/damage_alien",
	period_module_my_fx = "particles/gadget/damage_alien",
	
	ui_ico =
	{
		target_system			= { tex = "Module_PlasmaWeb_Prec", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.DAMAGE_THERMAL_SCALED,
			aura_target					= ai.SpellTarget.HOLDER,
			
			scale_on_weapon				= true,
			
			aura_param					= 2000,
			
			min_speed_percent			= 0.75,
			
			duration					= 12,
			period						= 1,
			isBuff						= false,
			ignore_subtype				= true,
			
			use_dead_engine_effects		= false,
			aura_sound 					= "sound/gadgets/MovementRestrictor/alarm",
			
			ui_ico =
			{
				target_system			= { tex = "Module_PlasmaWeb_Prec", },
			},
		},
	}
}

Spell.Spell_PlasmaWeb_Prec_Vampire =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.HEAL_ON_HIT_SCALED,
	target						= ai.SpellTarget.LOCKED_TARGET,
	aura_target					= ai.SpellTarget.CASTER,
	target_range				= 350,
	scale_on_weapon				= true,
	
	aura_param					= 1,

	duration					= 12,

	isBuff						= true,
	hud_visible_holder			= true,
	isBuff_holder				= false,
	ignore_subtype				= true,
	aura_target_fx				= "particles/gadget/hull_heal",
	
	ui_ico =
	{
		target_system			= { tex = "Module_PlasmaWeb_Prec", },
	},
}

Def.Module_PlasmaWeb_Prec =
{
	class							= "ActiveModule",
	in_editor 						= false,
	
	energy_cost						= 55,
	cooldown						= 45,
	
	spell							= "Spell_PlasmaWeb_Prec",
	additional_spell				= "Spell_PlasmaWeb_Prec_Vampire",
	
	activate_sound					= "sound/gadgets2/ChargedPW_activate",
	item_subtype					= ItemSubtype.PlasmaWebPrec,
	
	default_icon					= "Module_PlasmaWeb_Prec",
	influence_type_color			= InfluenceTypeColor.DAMAGE_TERMAL,
}

Spell.Spell_Camouflage_Prec =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.ANTI_RADAR,
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,

	duration					= 32,
	
	dispell_flag				= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	dispell_timeout				= 2,

	isBuff						= true,
	ignore_subtype				= true,
	
	--gameplay_specific			= true,
	
	
	aura_fx 					= "StealthEffectAlien",
	
	ui_ico =
	{
		target_system			= { tex = "Module_Camouflage_Prec", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.INVULNERABILITY,
			aura_target					= ai.SpellTarget.HOLDER,
			
			duration					= 0.5,

			isBuff						= true,
			ignore_subtype				= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_Camouflage_Prec", },
			},
		},
	}
}

Def.Module_Camouflage_Prec =
{
	class							= "ActiveModule",
	in_editor 						= false,
	
	energy_cost						= 120,
	cooldown						= 50,
	
	spell							= "Spell_Camouflage_Prec",
	
	item_subtype					= ItemSubtype.CamouflagePrec,
	
	default_icon					= "Module_Camouflage_Prec",
	influence_type_color			= InfluenceTypeColor.BUFF_ABILITY,
--	activate_sound 					= "sound/el_modules/ElCommonActivate",
	}


Spell.Spell_Cloaking_Prec =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.STEALTH,
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,

	duration					= 45,
	
	dispell_flag				= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_DAMAGE,
	dispell_timeout				= 2,

	isBuff						= true,
	
	gameplay_specific			= true,
	
	aura_start_sound			= "sound/gadgets/stealth_on",
	aura_end_sound 				= "sound/gadgets/stealth_off",
	
	ui_ico =
	{
		target_system			= { tex = "Module_Cloaking_Prec", },
	},
}

Spell.Spell_Cloaking_PelengKiller_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.CAST_SPELL_PERIODIC,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,
	
	target_spell						= "Spell_Cloaking_PelengKiller_End_Prec",
	
	duration 							= 45,
	period 								= 3,
	
	dispell_flag						= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_DAMAGE,
	dispell_timeout						= 2,

	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "Module_Cloaking_Prec", },
	},
}

Spell.Spell_Cloaking_PelengKiller_End_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	target								= ai.SpellTarget.CASTER,	
	aura_target =
	{
		class 							= ai.SpellTargetClass.TURRET + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.GUIDED_DRONE,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		area 							= ai.SpellTargetArea.AROUND,
		misc							= ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},

	aura_param							= 100,
	aura_range							= 100,
	
	duration 							= 3,
	period 								= 1,
	
	isBuff								= false,
	
	period_sound 						= "sound/gadgets/pulsar/alien_pulsar_period",
	period_holder_sound					= "sound/gadgets/pulsar/alien_pulsar_fire",

	period_fx							= "particles/gadget/pulsars/pulsar_alien_hit",
	period_my_fx      					= "particles/gadget/pulsars/pulsar_alien_hit", 
	period_beam_fx 						= "particles/gadget/pulsars/pulsar_alien_beam",
	
	ui_ico =
	{
		target_system					= { tex = "Module_Cloaking_Prec", },
	},
}

Def.Module_Cloaking_Prec =
{
	class							= "ActiveModule",
	in_editor 						= false,
	
	energy_cost						= 120,
	cooldown						= 60,
	
	spell							= "Spell_Cloaking_Prec",
	additional_spell				= "Spell_Cloaking_PelengKiller_Prec",
	
	item_subtype					= ItemSubtype.CloakingPrec,
	
	default_icon					= "Module_Cloaking_Prec",
	influence_type_color			= InfluenceTypeColor.BUFF_ABILITY,
}

Def.DestrMunition_SectorShield_Prec =
{
	class								= "ScBaseEntity",
	module_type							= ai.ModuleType.MUNITION,

	ttl									= 18,
	
	in_editor							= false,
	hack_immune 						= true,
	model								= "models/shields/shield_r5_h",
	physics								= { solid_type = solid.model, material = "GiantShield", mass = 100, static_collision = false},
	children =
	{
		--{ effect						= "particles/gadget/swarm_shield_start" },
		{ def							= "PrecShield" },
	},
	--death_effect						= "particles/gadget/swarm_shield_end",
	--end_effect							= "particles/gadget/swarm_shield_end",
	weapon_mode							= ai.ShieldWeaponMode.BLOCK_ENEMY,
	radar_vison							= ai.ShieldRadarVisionMode.BLOCK_ENEMY,
	
	item_subtype						= ItemSubtype.SectorShieldPrec,
	
	default_icon						= "DestrMunition_SectorShield_Prec",
	
	start_sound  	= 	"sound/destroyer/SShield_activate",
	end_sound	=	"sound/destroyer/SShield_off",
}

Def.PrecShield =
{
	model = "models/shields/sectorshield_alien",
}

Def.MultiPortalPrec = 
{
	class								= "TeleportGate",
	in_editor							= false,
	
	model								= "models/shields/teleport_single",
	
	teleport_cooldown					= 2,
	teleport_check_box_scale			= 0.9,
	--teleport_last_damage_time_min		= 0,
	teleport_reset_control				= false, -- если true, то корабль после телепорта корабль будет иметь нулевую скорость и будет направлен от ворот
	teleport_offset						= -3, -- дополнительное смещение корабля в направлении от ворот
	
	teleport_owner_only					= true,
	in_fx 								= "particles/gadget/teleport_alien",
	out_fx 								= "particles/gadget/teleport_alien",
	in_sound							= "sound/el_modules/GreenJumpOnStrafe",
	out_sound							= "sound/el_modules/GreenJumpOnStrafe",
	work_sound 							= "sound/gadgets2/MultuPortal_prec_loop",
	work_effect 						= "particles/gadget/teleport_object_alien",
	
	children = 
	{
		{ effect = "particles/gadget/alien_object", joint = "root" },
	}
}

Def.Module_MultiPortal_Prec =
{
	class								= "TeleportGateModule",
	in_editor							= false,

	spawn_offset						= Vec3( 0, 0, -20 ),
	check_collision_box_extents			= Vec3( 0.766, 0.342, 2.0 ), -- для проверки коллизии

	energy_cost 						= 56,
	cooldown							= 40,
	
	activate_sound						= "sound/gadgets2/SinglePortal_activate",

	gate								= "MultiPortalPrec",
	straight_teleport					= false, -- если true, то создаются сразу два портала на расстоянии teleport_range_max, если ничего не мешает и на меньшем расстоянии, если есть препятствие.
	teleport_range_min					= 30,
	teleport_range_max					= 0, -- если ноль, то расстояние не ограничено(только для straight_teleport = false)
	teleport_gate_ttl					= 60,
	replace_extra_teleport_lines		= true, -- если true, то старые порталы уничтожаются при превышении максимального количества
	teleport_line_max					= 1, -- максимальное количество открытых телепортов(пар порталов)
	
	teleport_owner_only					= true,
	
	item_subtype						= ItemSubtype.MultiPortalPrec,
	
	default_icon						= "Module_MultiPortal_Prec",
	influence_type_color				= InfluenceTypeColor.BUFF_ABILITY,
}

Def.Module_TimeBomb_Prec = 
{
	class								= "ActiveModule",
	in_editor							= false,
	
	cooldown							= 52,
	energy_cost 						= 120,
	
	spell								= "Spell_TimeBomb_Start_Prec",
	deactivate_spell					= "Spell_TimeBomb_Prec",
	
	--activate_sound						= "sound/gadgets/blackout/bo_activate",
	
	item_subtype						= ItemSubtype.TimeBombPrec,
	
	default_icon						= "Module_TimeBomb_Prec",
}

Spell.Spell_TimeBomb_Start_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.SLOW_MOVEMENT,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	aura_param							= 1,
	duration							= 3,
	
	isBuff								= true,
	
	aura_fx								= "particles/gadget/alien_debuff_prepare",
	
	ui_ico =
	{
		target_system					= { tex = "Module_TimeBomb_Prec", },
	},
}

Spell.Spell_TimeBomb_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.FIRE_RATE_MOD,
	target								= ai.SpellTarget.CASTER,
	aura_target =
	{
		class							= ai.SpellTargetClass.SHIP,
		area							= ai.SpellTargetArea.AROUND,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_param 							= -3,
	aura_range							= 250,

	isBuff								= false,
	hud_visible 						= true,
	isBuff_holder						= true,
	hud_visible_holder					= true,
	gameplay_specific					= true,
	
	duration							= 8,
	
	isBuff								= false,
	
	ui_ico =
	{
		target_system					= { tex = "Module_TimeBomb_Prec", },
	},
	
	additional_auras = 
	{
		{
			aura						= ai.Aura.SLOW_MOVEMENT,
			aura_target =
			{
				class					= ai.SpellTargetClass.SHIP,
				area					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY,
			},
			aura_range					= 250,
			aura_param 					= 3,
			duration					= 8,
			isBuff						= false,
			hud_visible 				= true,
			isBuff_holder				= true,
			hud_visible_holder			= true,
			gameplay_specific			= true,
			
			ui_ico =
			{
				target_system					= { tex = "Module_TimeBomb_Prec", },
			},
		},
		{
			aura						= ai.Aura.SLOW_MANEUVER,
			aura_target =
			{
				class					= ai.SpellTargetClass.SHIP,
				area					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY,
			},
			aura_range					= 250,
			aura_param 					= 3,
			duration					= 8,
			isBuff						= false,
			hud_visible 				= true,
			isBuff_holder				= true,
			hud_visible_holder			= true,
			gameplay_specific			= true,
			
			ui_ico =
			{
				target_system					= { tex = "Module_TimeBomb_Prec", },
			},
		},
		{
			aura						= ai.Aura.REDUCE_ROT_SPEED,
			aura_target =
			{
				class					= ai.SpellTargetClass.SHIP,
				area					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY,
			},
			aura_range					= 250,
			aura_param 					= 3,
			duration					= 8,
			isBuff						= false,
			hud_visible 				= true,
			isBuff_holder				= true,
			hud_visible_holder			= true,
			gameplay_specific			= true,
			
			ui_ico =
			{
				target_system					= { tex = "Module_TimeBomb_Prec", },
			},
		},
	},
	
	cast_fx								= "particles/gadget/alien_debuff_wave",
	aura_target_fx						= "particles/gadget/slow_movement",
	aura_start_sound					= "sound/gadgets/stealth_on",
	aura_end_sound 						= "sound/gadgets/stealth_off",
}

Def.Module_GravyGenerator_Prec = 
{
	class 								= "ActiveModule",
	in_editor 							= false,

	track 								= ai.TrackMode.AIM,
	stop_barrels						= ai.BarrelsStopMode.ACTIVE,
	
	cooldown 							= 46,
	energy_cost 						= 75,
	
	spell 								= "Spell_GravyGenerator_Start_Prec",
	deactivate_spell					= "Spell_GravyGenerator_Prec",

	activate_sound						= "sound/destroyer/GravyAnomaly_activation",

	activate_beam_fx					= "particles/gadget/huge/gravy_green_beam",

	activate_beam_duration				= 1,
	
	item_subtype						= ItemSubtype.GravyGeneratorPrec,
	
	default_icon						= "Module_GravyGenerator_Prec",
	influence_type_color				= InfluenceTypeColor.DAMAGE_KINETIC,
}

Spell.Spell_GravyGenerator_Start_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	target								= ai.SpellTarget.AIM_POS,
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.SC_BASE_ENTITY,
		area 							= ai.SpellTargetArea.AROUND,
		relationship					= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	
	target_range						= 600.0,
	
	aura_param							= 25,
	aura_range							= 300,
	duration							= 1,
	period								= 0.2,
	
	isBuff								= false,
	
	ignore_stacks						= true,
	ignore_subtype						= true,
	
	aura_holder_def						= "AuraHolderEntityHackImmune",

	holder_sound 						= "sound/destroyer/GravyAnomaly_activation",
	aura_fx 							= "particles/gadget/huge/gravy_green_beam_end",
	
	ui_ico =
	{
		target_system					= { tex = "Module_GravyGenerator_Prec", },
	},
}

Spell.Spell_GravyGenerator_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.SHIP_ATTRACTION,
	target								= ai.SpellTarget.AIM_POS,
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP,
		area 							= ai.SpellTargetArea.AROUND,
		relationship					= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	
	target_range						= 600.0,

	aura_param							= 1,
	aura_range							= 300,
	aura_param_add						= 1.9,
	aura_range_add						= -20,
	duration							= 10,
	
	isBuff								= false,
	
	ignore_stacks						= true,
	ignore_subtype						= true,
	
	aura_holder_def						= "AuraHolderEntityHackImmune",
	
	holder_spell_in_the_end				= "Spell_GravyGenerator_End_Prec",
	
	ui_ico =
	{
		target_system					= { tex = "Module_GravyGenerator_Prec", },
	},

	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
			aura_target =
			{
				class					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.GUIDED_DRONE,
				area					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			},

			aura_param					= 30,
			aura_range					= 200,
			aura_param_add				= 27,
			aura_range_add				= -15,
			duration					= 10,
			period						= 0.5,

			isBuff						= false,

			aura_fx						= "particles/explosions/explosion_big3_alien",
			
			ui_ico =
			{
				target_system					= { tex = "Module_GravyGenerator_Prec", },
			},
		},
	},
	
	holder_sound 						= "sound/destroyer/GravyAnomaly_loop",
	aura_fx								= "particles/gadget/huge/gravy_green_hole",
	nebula								= "Effects_Nebula_GravyAnomalyAlien",
}

Spell.Spell_GravyGenerator_End_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.SHIP_ATTRACTION,
	target								= ai.SpellTarget.AIM_POS,
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP,
		area 							= ai.SpellTargetArea.AROUND,
		relationship					= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	
	target_range						= 600.0,

	aura_param							= -500,
	aura_range							= 300,
	duration							= 2,
	
	isBuff								= false,
	
	ignore_stacks						= true,
	ignore_subtype						= true,
	
	aura_holder_def						= "AuraHolderEntityHackImmune",
	
	ui_ico =
	{
		target_system					= { tex = "Module_GravyGenerator_Prec", },
	},

	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
			aura_target =
			{
				class					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.GUIDED_DRONE,
				area					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			},

			aura_param					= 1000,
			aura_range					= 250,
			duration					= 2,
			period						= 0.5,

			isBuff						= false,
			
			ui_ico =
			{
				target_system					= { tex = "Module_GravyGenerator_Prec", },
			},
		},
	},
	
	cast_sound 							= "sound/explosion/ship_big_expl",
	cast_position_fx					= "particles/explosions/alien_nuke",
}

Def.Module_EntityRay_Prec =  
{
	inherit 							= "Module_EntityRay",
	
	cooldown							= 40, --Всегда больше суммарного времени работы спеллов (чтобы холдеры не спавнились друг в друге)
	energy_cost							= 1000,
	
	spell		 						= "Spell_EntityRayPrepare_Prec",
	
	item_subtype						= ItemSubtype.EntityRayPrec,
	
	default_icon						= "Module_EntityRay_Prec",
	influence_type_color				= InfluenceTypeColor.DAMAGE_TERMAL,
}

Def.EntityRayHolder_Prec = 
{
	inherit								= "EntityRayHolder",
	health								= 30000,
	uiName								= "EntityRayHolder_Prec",
	work_sound 							= "sound/gadgets/warpgate/wg_work_loop",
}

Def.EntityRayHolderInvul_Prec = 
{
	inherit								= "EntityRayHolderInvul",
	uiName								= "EntityRayHolder_Prec",
	work_sound 							= "sound/gadgets/warpgate/wg_work_loop",
}

Spell.Spell_EntityRayPrepare_Prec =
{
	inherit								= "Spell_EntityRayPrepare",
	
	aura_holder_def						= "EntityRayHolder_Prec",
	aura_holder_attach_bone				= "root",
	aura_holder_offset					= Vec3( 0, 0, -17 ),

	aura_range							= 600,
	aura_extra_radius					= 20,

	aura_param							= 370,
	duration 							= 4,
	period								= 0.5,
	
	aura_target_offset					= Vec3( 0, 0, -50 ),

	holder_spell_in_the_end				= "Spell_EntityRay_Prec",
	holder_spell_on_cancel				= "Spell_EntityRay_Blast_Prec",
	
	ui_ico =
	{
		target_system					= { tex = "Module_EntityRay_Prec", },
	},
}

Spell.Spell_EntityRay_Prec =
{
	inherit								= "Spell_EntityRay",

	aura_holder_def						= "EntityRayHolderInvul_Prec",
	aura_holder_attach_bone				= "root",
	aura_holder_offset					= Vec3( 0, 0, -17 ),
	
	aura_range							= 600,
	aura_extra_radius					= 20,
	
	aura_param							= 5000,
	aura_param_add						= 5250,
	duration 							= 2,
	period								= 0.4,
	
	aura_target_offset					= Vec3( 0, 0, -50 ),
	
	ui_ico =
	{
		target_system					= { tex = "Module_EntityRay_Prec", },
	},
}

Spell.Spell_EntityRay_Blast_Prec =
{
	inherit								= "Spell_EntityRay_Blast",
	aura_target =
	{
		class							= ai.SpellTargetClass.SHIP,
		area							= ai.SpellTargetArea.AROUND,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_range 							= 80,
	aura_param							= 10000,
	duration							= 1,
	period								= 0.5,
	
	ui_ico =
	{
		target_system					= { tex = "Module_EntityRay_Prec", },
	},
}

Def.Module_RocketSilo_Prec = 
{
	class								= "FiringModule",
	in_editor 							= false,

	cooldown							= 32,
	energy_cost							= 1000,
	
	track 								= ai.TrackMode.AIM,
	max_range							= 300,
	stop_barrels						= ai.BarrelsStopMode.ACTIVE,

	damage_thermal						= 1900,
	dispersion							= 25,
	target_cone_angle					= 45,
	ammo								= 10,

	shoot_mode							= ai.FiringModuleShootMode.BURST,
	fire_rate 							= 240,
	max_projectiles_per_target			= 2,

	projectile							= "VolleyGuidedRocket_Prec",
	projectile_speed					= 85,

	muzzleflash_color = { kinetic = "255 150 100 15", emp = "255 150 100 15", thermal = "255 150 100 15", },
	muzzleflash_radius 					= 10,
	muzzleflash_time 					= 1.0,
	long_shot_effects					= true,
	shot_once_sound						= "sound/weapons/rockets/WolfPack_Prec",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance							= 0,
	
	item_subtype						= ItemSubtype.RocketSiloPrec,
	
	default_icon						= "Module_RocketSilo_Prec",
	influence_type_color				= InfluenceTypeColor.DAMAGE_TERMAL,
}

Def.VolleyGuidedRocket_Prec =
{
	inherit 							= "Module_Gen_VolleyGuidedRocket_Mob",
	model								= "models/objects/ships_huge/prec_ship/prec_drone2_little",
	physics								= { solid_type = solid.sphere, kinematic = true, material = "ShipMetalMk3", mass = 10000, hitbox = true, sphere_radius = 8, },
	
	is_guided							= true,
	random_trajectory					= true,
	use_pathfinder 						= true,
	angular_velocity					= 75*0.66,
	damageable							= true,
	health								= 35000,
	speed								= 50*0.66,
	
	max_range							= 900,
	time_to_live						= 15,
	
	missile_defence_immune				= false,
	missile_detection_immune			= false,
	children = 
	{
		[1] = { def = "PrecRocketSmall", joint = "eng" },
		[2] = { effect = "particles/null", joint = "eng" },
	},
}

Def.Module_EnemyScanner_Prec =
{
	class 								= "SpaceShipModule",
	in_editor 							= false,

	spell_on_equip						= "Spell_EnemyScanner_Prec",
	
	item_subtype						= ItemSubtype.PassiveScannerPrec,
	
	default_icon						= "Module_JumpForward_Prec",
}

Spell.Spell_EnemyScanner_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.CAST_SPELL_PERIODIC,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	target_spell						= "Spell_EnemyScanner_Ping_Prec",
	period								= 10,
	
	isBuff								= true,
	gameplay_specific					= true,
	period_sound 			= "sound/gadgets2/EnemyScanner_Prec",
	
	ui_ico =
	{
		target_system					= { tex = "Module_EnemyScanner_Prec", },
	},
}

Spell.Spell_EnemyScanner_Ping_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.SPY_DRONE,
	target								= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		area 							= ai.SpellTargetArea.AROUND,
		misc							= ai.SpellTargetMisc.NOT_CLOAKED,
	},

	aura_range							= 250,
	duration							= 1,
	
	isBuff								= false,
	gameplay_specific					= true,
	hud_visible 						= false,
	
	--cast_sound							= "sound/gadgets2/EnemyScanner_Prec",
	
	ui_ico =
	{
		target_system					= { tex = "Module_EnemyScanner_Prec", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.SPY_DRONE,
			aura_target =
			{
				class 					= ai.SpellTargetClass.SHIP,
				relationship			= ai.SpellTargetRelationship.ENEMY,
				area 					= ai.SpellTargetArea.AROUND,
			},

			aura_range					= 120,
			duration					= 1,

			isBuff						= false,
			
			gameplay_specific			= true,
			hud_visible 				= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_EnemyScanner_Prec", },
			},
		},
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.SPY_DRONE,
			aura_target =
			{
				class 					= ai.SpellTargetClass.SHIP,
				relationship			= ai.SpellTargetRelationship.ENEMY,
				misc					= ai.SpellTargetMisc.NEAREST,
			},

			duration					= 2.5,

			isBuff						= false,
			
			gameplay_specific			= true,
			hud_visible 				= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_EnemyScanner_Prec", },
			},
		},
	},
}

Def.Module_FakeShips_Prec =
{
	class								= "ActiveModule",
	in_editor 							= false,
	
	cooldown							= 35,
	energy_cost							= 75,
	
	spawn_clones						= 1,
	spawn_clones_radius					= 20,
	clones_power						= 1,
	clones_ttl							= 20,
	
	spell								= "Spell_FakeShips_Prec",
	
	activate_sound 						= "sound/el_modules/ElCommonActivate",
	
	item_subtype						= ItemSubtype.FakeShipsPrec,
	
	default_icon						= "Module_FakeShips_Prec",
	influence_type_color				= InfluenceTypeColor.BUFF_ABILITY,
}

Spell.Spell_FakeShips_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.STEALTH,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	duration							= 10,
	
	dispell_flag						= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_DAMAGE,
	dispell_timeout						= 2,

	isBuff								= true,
	gameplay_specific					= true,
	
	aura_start_sound					= "sound/gadgets/stealth_on",
	aura_end_sound 						= "sound/gadgets/stealth_off",
	
	ui_ico =
	{
		target_system					= { tex = "Module_FakeShips_Prec", },
	},
}

Def.Module_EnergyLance_Prec =
{
	class 								= "EnergyLance",
	in_editor							= false,

	cooldown							= 35,
	energy_cost 						= 60,
	work_time							= 4,

	damage_box_size						= Vec3( 3.0, 1.0, 10 ),

	damage_thermal						= 17500*0.7,

	activate_sound						= "sound/gadgets/EnergyLance/el_activation",
	
	item_subtype						= ItemSubtype.EnergyLancePrec,
	
	default_icon						= "Module_EnergyLance_Prec",
	influence_type_color				= InfluenceTypeColor.DAMAGE_TERMAL,
}

Def.Module_Overcharge_Prec =
{
	class								= "ActiveModule",
	in_editor 							= false,
	
	cooldown							= 35,
	energy_cost							= 75,
	
	spell								= "Spell_Overcharge_Prec",
	
	ignore_silence						= true,
	
	activate_sound 						= "sound/gadgets2/Overcharge_Prec_activate",
	
	item_subtype						= ItemSubtype.OverchargePrec,
	
	default_icon						= "Module_Overcharge_Prec",
}

Spell.Spell_Overcharge_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.OVERCHARGE,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	aura_param							= 0.5,
	duration							= 15,

	isBuff								= true,
	
	cleanse_on_apply					= true,
	
	aura_fx								= "particles/gadget/overdrive",
--	aura_start_sound					= "sound/gadgets/stealth_on",
--	aura_end_sound 						= "sound/gadgets/stealth_off",
	
	ui_ico =
	{
		target_system					= { tex = "Module_Overcharge_Prec", },
	},
}

Def.Module_WolfPack_Prec = 
{
	class								= "FiringModule",
	in_editor 							= false,

	cooldown							= 37,
	energy_cost							= 90,
	
	track 								= ai.TrackMode.AIM,
	max_range							= 200,
	stop_barrels						= ai.BarrelsStopMode.NONE,

	damage_thermal						= 2200,
	dispersion							= 30,
	target_cone_angle					= 30,
	ammo								= 3,

	shoot_mode							= ai.FiringModuleShootMode.BURST,
	fire_rate 							= 200,
	max_projectiles_per_target			= 1,

	projectile							= "VolleyGuidedRocket_Prec",
	projectile_speed					= 85,

	muzzleflash_color = { kinetic = "255 150 100 15", emp = "255 150 100 15", thermal = "255 150 100 15", },
	muzzleflash_radius 					= 10,
	muzzleflash_time 					= 1.0,
	long_shot_effects					= true,
	shot_once_sound						= "sound/weapons/rockets/WolfPack_Prec",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance							= 0,
	
	item_subtype						= ItemSubtype.WolfPackPrec,
	
	default_icon						= "Module_WolfPack_Prec",
	influence_type_color				= InfluenceTypeColor.DAMAGE_TERMAL,
}

Def.Module_StasisGun_Prec  =
{
	class								= "FiringModule",
	in_editor 							= false,

	cooldown							= 32,
	energy_cost							= 90,
	
	track 								= ai.TrackMode.AIM,
	max_range							= 200,
	stop_barrels						= ai.BarrelsStopMode.NONE,

	damage_emp							= 1000,

	shoot_mode							= ai.FiringModuleShootMode.SINGLE_SHOT,
	fire_rate 							= 200,

	projectile							= "Projectile_StasisGun_Prec",
	projectile_speed					= 60,

	muzzleflash_color = { kinetic = "255 150 100 15", emp = "255 150 100 15", thermal = "255 150 100 15", },
	muzzleflash_radius 					= 10,
	muzzleflash_time 					= 1.0,
	shot_once_sound 					= "sound/gadgets2/StasisGun_Prec",
	shot_effect 						= "particles/weapons/big/bfg_muzzle",

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance							= 0,
	
	item_subtype						= ItemSubtype.StasisGunPrec,
	
	default_icon						= "Module_StasisGun_Prec",
	influence_type_color				= InfluenceTypeColor.DEBUFF_DAMAGE,
}

Def.Projectile_StasisGun_Prec =
{
	inherit								= "Weapon_BaseRocket",
	class								= "Rocket",
	impact_type							= "rocket",

	explosion_blast_wave				= "Blastwave_StasisGun_Prec",
	override_blast_wave_damage			= true,
	missile_defence_immune				= true,	
	missile_detection_immune			= true,
	detonation_timeout					= 0,

	spell 								= "Spell_StasisGun_Prec",
	spell_on_launch						= "Spell_StasisGun_Flying_Prec",
	
	detonation_radius					= 1,

	detonate_on_distance				= 15,

	flare_color							= "155 135 250 10",
	flare_size							= 0.0,
	flare_angle							= 180,
	flare_nebulosity					= 0.1,
	effect 								= "particles/weapons/big/alien_big_projectile",
	hit_effect							= "",
	work_sound							= "sound/gadgets2/bfg_fly",
}

Def.Blastwave_StasisGun_Prec = 
{
	class								= "BlastWave",
	in_editor							= false,

	blast_minDistance					= 10,
	--constant_damage					= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance					= 18,
	self_damage_coef					= 0,

	apply_damage						= true,
	apply_shake 						= false,
	apply_torque						= false,

	effect 								= "particles/weapons/big/bfg_explosion_big",
	light_color							= "165 255 130 100",
	light_radius						= 100,
	light_time							= 1.0,
	sound 								= "sound/explosion/bfg_expl",

}

Spell.Spell_StasisGun_Flying_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.STASIS,
	target								= ai.SpellTarget.INFLICTOR,
	aura_target							= ai.SpellTarget.ENEMY_AROUND,

	aura_range							= 70,

	isBuff								= false,
	
	gun_spell_fx	= "particles/gadget/weapon_instability",
	aura_target_fx	= "particles/gadget/lightnings_debuff",
	
	ui_ico =
	{
		target_system					= { tex = "Module_StasisGun_Prec", },
	},
}

Spell.Spell_StasisGun_Prec = 
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.STUN,
	target								= ai.SpellTarget.ENEMY_AROUND,
	aura_target							= ai.SpellTarget.HOLDER,

	target_range 						= 45,
	duration							= 6,

	isBuff								= false,
	
	aura_target_fx						= "particles/gadget/burn_energy",
	aura_sound 							= "sound/aura/voidzone",
	ui_ico =
	{
		target_system					= { tex = "Module_StasisGun_Prec", },
	},
}

Def.Module_TRay_Prec =
{
	class 								= "ActiveModule",
	in_editor 							= false,

	cooldown							= 35,
	energy_cost							= 500,

	spell 								= "Spell_TRay_Prec",
	
	consume_aura						= ai.Aura.CHARGE_SPELL,
	item_subtype						= ItemSubtype.TRayPrec,

	activate_sound 						= "sound/gadgets2/TRay_fire_prec",

	track 								= ai.TrackMode.AIM,
	
	charge_spell_on_damage				= "Spell_TRay_Charge_Prec",
	charge_damage						= 10000,
	charge_mask							= ai.ChargeType.DAMAGE_SHIP,

	--#61927: Live: Убрать дефолтные значения пушек/модулей
	crit_chance							= 0,
	
	item_subtype						= ItemSubtype.TRayPrec,
	
	default_icon						= "Module_TRay_Prec",
	influence_type_color				= InfluenceTypeColor.DAMAGE_TERMAL,
}

Spell.Spell_TRay_Charge_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.CHARGE_SPELL,
	aura_target 						= ai.SpellTarget.HOLDER,
	target 								= ai.SpellTarget.CASTER,
	
	aura_param							= 1,
	duration							= 5,
	
	max_stacks							= 5,
	
	isBuff								= true,
	hud_visible 						= false,
	
	ui_ico =
	{
		target_system					= { tex = "Module_TRay_Prec", },
	},
}

Spell.Spell_TRay_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target =
	{
		class          					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.GUIDED_DRONE,
		area           					= ai.SpellTargetArea.IN_CYLINDER,
		relationship   					= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},

	aura_range							= 300,
	aura_extra_radius					= 20,
	
	aura_param							= 3000,
	duration 							= 2,
	period								= 0.4,
	isBuff								= false,
	
	fixed_cylinder_target				= false,
	
	nebula 								= "Effects_Nebula_TachRay",
	work_beam_fx						= "particles/weapons/laser/entity_ray_2",
	ray_shot_sound 						= "sound/destroyer/TRay2_beam",
	
	ui_ico =
	{
		target_system					= { tex = "Module_TRay_Prec", },
	},
}

Def.Module_HackWeapon_Prec =
{
	class 								= "ActiveModule",
	in_editor 							= false,

	cooldown							= 24,
	energy_cost							= 500,

	spell 								= "Spell_HackWeapon_Prec",

	activate_beam_fx					= "particles/gadget/weaponhacker_beam",
	activate_sound						= "sound/gadgets/plasmaweb_shot",
	
	item_subtype						= ItemSubtype.HackWeaponPrec,
	
	default_icon						= "Module_HackWeapon_Prec",
	influence_type_color				= InfluenceTypeColor.DEBUFF_ABILITY,
}

Spell.Spell_HackWeapon_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	target =
	{
		target 							= ai.SpellTargetGeneral.LOCKED_TARGET,
		class          					= ai.SpellTargetClass.SHIP,
		relationship   					= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura 								= ai.Aura.HACKED_WEAPON,
	aura_target							= ai.SpellTarget.HOLDER,

	target_range						= 150,
	
	duration 							= 8,

	isBuff								= false,

	diminish_control_aura				= true,
	apply_crowd_control_coef			= true,
	min_targets_count					= 0,
	gun_spell_fx	= "particles/gadget/weapon_instability",
	aura_target_fx	= "particles/gadget/lightnings_debuff",
	
	ui_ico =
	{
		target_system					= { tex = "Module_HackWeapon_Prec", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.DISABLE_MODULES,
			aura_target					= ai.SpellTarget.HOLDER,

			duration					= 8,

			isBuff						= false,
			
			diminish_control_aura		= true,
			apply_crowd_control_coef	= true,
			min_targets_count			= 0,
			
			ui_ico =
			{
				target_system			= { tex = "Module_HackWeapon_Prec", },
			},
		},
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.SPY_DRONE,
			aura_target					= ai.SpellTarget.HOLDER,

			duration					= 8,

			isBuff						= false,
			
			diminish_control_aura		= true,
			apply_crowd_control_coef	= true,
			min_targets_count			= 0,
			
			ui_ico =
			{
				target_system			= { tex = "Module_HackWeapon_Prec", },
			},
		},
	},
}

Def.Module_PhaseBuff_Prec = 
{
	class 								= "PhaseModule",
	in_editor							= false,
	
	cooldown							= 0.3,
	energy_cost 						= 120.0,

	activate_effect						= "",
	activate_module_effect				= "",
	activate_sound						= "sound/gadgets2/PhaseBuff_Prec",
	
	spell0 								= "Spell_PhaseBuff0_Prec",
	spell1								= "Spell_PhaseBuff1_Prec",
	spell2 								= "Spell_PhaseBuff2_Prec",
	
	item_subtype						= ItemSubtype.PhaseBuffPrec,
	
	default_icon						= "Module_PhaseBuff_Prec_Phase3",
	ui_ico_0							= { target_system = { tex = "Module_PhaseBuff_Prec_Phase3", }, },
	ui_ico_1							= { target_system = { tex = "Module_PhaseBuff_Prec_Phase2", }, },
	ui_ico_2							= { target_system = { tex = "Module_PhaseBuff_Prec_Phase1", }, },
}

Spell.Spell_PhaseBuff0_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.HULL_RESIST_ALL,
	aura_target							= ai.SpellTarget.HOLDER,
	aura_fx 							= "particles/gadget/alien_resist_buff",
	aura_param							= 40,
	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "Module_PhaseBuff_Prec_Phase3", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.SHIELD_RESIST_ALL,
			aura_target					= ai.SpellTarget.HOLDER,

			aura_param					= 40,

			isBuff						= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_PhaseBuff_Prec_Phase3", },
			},
		},
	},
}

Spell.Spell_PhaseBuff1_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.DAMAGE_MOD,
	aura_target							= ai.SpellTarget.HOLDER,

	aura_param							= 0.6,
	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "Module_PhaseBuff_Prec_Phase2", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.MODULE_DAMAGE_MOD,
			aura_target					= ai.SpellTarget.HOLDER,

			aura_param					= 0.6,

			isBuff						= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_PhaseBuff_Prec_Phase2", },
			},
		},
	},
}

Spell.Spell_PhaseBuff2_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.FAST_MOVEMENT,
	aura_target							= ai.SpellTarget.HOLDER,
	cast_fx 							= "particles/gadget/aura_wave_green",
	aura_param							= 0.6,
	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "Module_PhaseBuff_Prec_Phase1", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.FAST_MANEUVER,
			aura_target					= ai.SpellTarget.HOLDER,

			aura_param					= 0.6,

			isBuff						= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_PhaseBuff_Prec_Phase1", },
			},
		},
	},
}

Def.Module_Pulsar_Prec_M =
{
	class								= "ActiveModule",
	in_editor							= false,

	cooldown 							= 18,
	energy_cost							= 100,
	spell								= "Spell_Pulsar_Prec_M",
	
	trigger_aura						= true,
	
	item_subtype						= ItemSubtype.PulsarPrec,
	
	default_icon						= "Module_Pulsar_Prec_M",
	influence_type_color				= InfluenceTypeColor.DAMAGE_TERMAL,
}

Spell.Spell_Pulsar_Prec_M =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.GUIDED_DRONE,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		area 							= ai.SpellTargetArea.AROUND,
		misc							= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	
	aura_param							= 1400,
	aura_range							= 120,
	
	duration 							= 12,
	period 								= 1,
	
	isBuff								= false,
	
	period_sound 						= "sound/aura/spell_AG_Invul_period",
	period_holder_sound					= "sound/aura/spell_AG_Invul_period_holder",

	period_fx							= "particles/gadget/pulsars/pulsar_alien_hit",
	period_my_fx      					= "particles/gadget/pulsars/pulsar_alien_hit", 
	period_beam_fx 						= "particles/gadget/pulsars/pulsar_alien_beam",
	
	ui_ico =
	{
		target_system					= { tex = "Module_Pulsar_Prec_M", },
	},
}

Def.Module_Pulsar_Prec_L =
{
	class								= "ActiveModule",
	in_editor							= false,

	cooldown 							= 12,
	energy_cost							= 100,
	spell								= "Spell_Pulsar_Prec_L",
	
	trigger_aura						= true,
	
	item_subtype						= ItemSubtype.PulsarPrec,
	
	default_icon						= "Module_Pulsar_Prec_M",
	influence_type_color				= InfluenceTypeColor.DAMAGE_TERMAL,
}

Spell.Spell_Pulsar_Prec_L =
{
	inherit								= "Spell_Pulsar_Prec_M",
	
	aura_param							= 1500,
	aura_range							= 120,
	
	duration 							= 12,
	period 								= 1,
	
	ui_ico =
	{
		target_system					= { tex = "Module_Pulsar_Prec_M", },
	},
}

Def.Module_Pulsar_Prec_H =
{
	class								= "ActiveModule",
	in_editor							= false,

	cooldown 							= 13,
	energy_cost							= 100,
	spell								= "Spell_Pulsar_Prec_H",
	
	trigger_aura						= true,
	
	item_subtype						= ItemSubtype.PulsarPrec,
	
	default_icon						= "Module_Pulsar_Prec_M",
	influence_type_color				= InfluenceTypeColor.DAMAGE_TERMAL,
}

Spell.Spell_Pulsar_Prec_H =
{
	inherit								= "Spell_Pulsar_Prec_M",
	
	aura_param							= 1600,
	aura_range							= 150,
	
	duration 							= 12,
	period 								= 1,
	
	ui_ico =
	{
		target_system					= { tex = "Module_Pulsar_Prec_M", },
	},
}

Def.GuidedDrone_Alien2D_Prec =
{
	inherit								= "GuidedDrone_Alien2D",

	health								= 25000,

	damage_emp							= 950,
	
	control_range						= 200,
	
	holder_size							= 12,
	empty_holder_cooldown				= 200,
	
	item_subtype						= ItemSubtype.GuidedDronePrec,
	
	default_icon						= "GuidedDrone_Alien2D_Prec",
}

Def.GuidedDrone_Alien2D_L_Prec =
{
	inherit								= "GuidedDrone_Alien2D",

	health								= 50000,

	damage_emp							= 1400,
	
	control_range						= 400,
	
	holder_size							= 20,
	empty_holder_cooldown				= 200,
	
	item_subtype						= ItemSubtype.GuidedDronePrec,
	
	default_icon						= "GuidedDrone_Alien2D_Prec",
}

Def.Module_BuffLowHealth_75_Prec =  
{
	class 								= "SpaceShipModule",
	in_editor							= false,

	spell_on_max_health_minus 			= "Spell_BuffLowHealth_75_Prec",
	max_health_percent					= 0.75,
	max_health_spell_cancel				= false,
	cooldown							= 29,
	
	item_subtype						= ItemSubtype.PassiveBuff75Prec,
	
	default_icon						= "Module_BuffLowHealth_75_Prec",
}

Spell.Spell_BuffLowHealth_75_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.ENERGY_VAMPIRE_PERIODIC,
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		area 							= ai.SpellTargetArea.AROUND,
		misc							= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	
	aura_param							= 500,
	aura_range							= 200,
	
	duration 							= 5,
	period 								= 0.4,
	
	isBuff								= false,
	
	gameplay_specific					= true,
	
	period_fx							= "particles/gadget/add_energy_uncirculated",
	period_my_fx      					= "particles/gadget/add_energy_uncirculated",
	period_beam_root_fx					= "particles/gadget/pulsars/energy_burner_beam",
	
	period_holder_sound  = "",
	
	ui_ico =
	{
		target_system					= { tex = "Module_BuffLowHealth_75_Prec", },
	},
}

Def.Module_BuffLowHealth_50_Prec =  
{
	class 								= "SpaceShipModule",
	in_editor							= false,

	spell_on_max_health_minus 			= "Spell_BuffLowHealth_50_Prec",
	max_health_percent					= 0.50,
	max_health_spell_cancel				= false,
	cooldown							= 120,
	
	item_subtype						= ItemSubtype.PassiveBuff50Prec,
	
	default_icon						= "Module_BuffLowHealth_50_Prec",
}

Spell.Spell_BuffLowHealth_50_Prec =
{
	influence							= ai.Spell.APPLY_SHELL,
	target								= ai.SpellTarget.CASTER,

	shell_def 							= "Shell_Prec",
}

Def.Shell_Prec =
{
	class 								= "AuraHolderEntity", --"ScBaseEntity",
	in_editor							= false,

	spell_on_spawn						= "Spell_Shell_Prec_AntiDebuff",
	
	health 								= 300000,
	ttl									= 15,
	damageable							= true,
	network_sync 						= true,

	model								= "models/shields/shield_pve_2_shock",
	ui_color							= 0xFFEEFFCC,
	
	uiName 								= "itemSubType_PassiveBuff50Prec",
}

Spell.Spell_Shell_Prec_AntiDebuff =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.DEBUFF_IMMUNE,
	aura_target =
	{
		target							= ai.SpellTargetGeneral.PARENT,
		class 							= ai.SpellTargetClass.SHIP,
	},
	
	duration 							= 15,
	
	isBuff								= true,
	
	gameplay_specific					= true,
	
	aura_target_fx 						= "particles/gadget/alien_emergency_shell",
	aura_start_sound					= "sound/gadgets2/BuffLowHealth_shield",
	
	ui_ico =
	{
		target_system					= { tex = "Module_BuffLowHealth_50_Prec", },
	},
}

Def.Module_BuffLowHealth_25_Prec =  
{
	class 								= "SpaceShipModule",
	in_editor							= false,

	spell_on_max_health_minus 			= "Spell_BuffLowHealth_25_Prec",
	max_health_percent					= 0.25,
	max_health_spell_cancel				= false,
	cooldown							= 27,
	
	item_subtype						= ItemSubtype.PassiveBuff25Prec,
	
	default_icon						= "Module_BuffLowHealth_25_Prec",
}

Spell.Spell_BuffLowHealth_25_Prec =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.OVERCHARGE,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	aura_param							= 0.4,
	duration							= 5,

	isBuff								= true,
	
	cleanse_on_apply					= true,
	
	gameplay_specific					= true,
	
	ui_ico =
	{
		target_system					= { tex = "Module_BuffLowHealth_25_Prec", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.SHIELD_RESIST_ALL,
			aura_target					= ai.SpellTarget.HOLDER,

			aura_param					= 75,
			duration					= 5,

			isBuff						= true,
			
			gameplay_specific			= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_BuffLowHealth_25_Prec", },
			},
		},
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.HULL_RESIST_ALL,
			aura_target					= ai.SpellTarget.HOLDER,

			aura_param					= 75,
			duration					= 5,

			isBuff						= true,
			
			gameplay_specific			= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_BuffLowHealth_25_Prec", },
			},
		},
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.DAMAGE_MOD,
			aura_target					= ai.SpellTarget.HOLDER,

			aura_param					= 1,
			duration					= 5,

			isBuff						= true,
			
			gameplay_specific			= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_BuffLowHealth_25_Prec", },
			},
		},
	},
	
	aura_fx 							= "particles/gadget/damage_buff",
}