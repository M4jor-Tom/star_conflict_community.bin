--- базовые пресеты для крафтовых эсминцев
ModulePresets.Ship_H_T3={}
ModulePresets.Ship_H_T3.ship_def = "Ship_Race1_H_T3"
ModulePresets.Ship_H_T3.munition={}
ModulePresets.Ship_H_T3.munition[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_PlasmaUp1_Basic_T3_Mk3"	--"WeaponMod_RailUp1_Basic_T3_Mk3" --#72196
ModulePresets.Ship_H_T3.munition[ai.MunitionBayType.MBT_SECONDARY] = "DestrMunition_SectorShield_T3_Mk3"
ModulePresets.Ship_H_T3.modules={}
ModulePresets.Ship_H_T3.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_OrbGun_T3_Mk1"	--"Weapon_RailgunDestr_T3_Mk1"

ModulePresets.Ship_H_T4={}
ModulePresets.Ship_H_T4.ship_def = "Ship_Race1_H_T4"
ModulePresets.Ship_H_T4.munition={}
ModulePresets.Ship_H_T4.munition[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_PlasmaUp1_Basic_T4_Mk3"
ModulePresets.Ship_H_T4.munition[ai.MunitionBayType.MBT_SECONDARY] = "DestrMunition_SectorShield_T4_Mk3"
ModulePresets.Ship_H_T4.modules={}
ModulePresets.Ship_H_T4.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_OrbGun_T4_Mk1"

ModulePresets.Ship_H_T5={}
ModulePresets.Ship_H_T5.ship_def = "Ship_Race1_H_T5"
ModulePresets.Ship_H_T5.munition={}
ModulePresets.Ship_H_T5.munition[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_PlasmaUp1_Basic_T5_Mk3"
ModulePresets.Ship_H_T5.munition[ai.MunitionBayType.MBT_SECONDARY] = "DestrMunition_SectorShield_T5_Mk3"
ModulePresets.Ship_H_T5.modules={}
ModulePresets.Ship_H_T5.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_OrbGun_T5_Mk1"

-- #106359 Специальный пресет для выдачи новым игрокам
ModulePresets.Ship_Race2_H_T3_StartPack = {
	ship_def = "Ship_Race1_H_T3",
	modules = {
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_RailgunDestr_T3_Mk3",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] = "Module_TachRay_T3_Mk3",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] = "Module_TurretPlasma_T3_Mk3",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] = "Module_TurretThermo_T3_Mk3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] = "Module_AdaptiveBigShieldBoost_T3_Mk3",
        [ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ] = "Module_AddShldGen_T3_Mk3",
        [ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ] = "Module_CapacitorRecharging_T3_Mk3",
        [ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ] = "Module_ExtCapacitorBattary_T3_Mk3",
        [ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] = "ModulePassive_CollisionComp_T3_Mk3",
        [ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ] = "ModulePassive_ArmorPlates_T3_Mk3",
        [ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ] = "ModulePassive_ResistHullKinetic_T3_Mk3",
        [ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ] = "ModulePassive_ResistHullThermal_T3_Mk3",
        [ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_RangeMasterUnit_T3_Mk3",
        [ ai.SpaceShipModuleSlot.CPU_MOD_02 ] = "ModulePassive_TurboScanner_T3_Mk3",
	},
	munition = {
		[ ai.MunitionBayType.MBT_PRIMARY ] = "WeaponMod_RailUp1_Basic_T3_Mk3",
		[ ai.MunitionBayType.MBT_SECONDARY ] = "DestrMunition_SectorShield_T3_Mk3"
	}
}

Def.Weapon_RailgunDestr_T2 =
{
	inherit		= "Weapon_RailgunDestr_T3_Mk1",
	storeItemId = 0,

	barrel_rot_speed		= 60,
	barrel_rot_speed_fire	= 10,
	fire_rate				= 90,
}

Def.Weapon_LaserBlaster_T2 =
{
	inherit		= "Weapon_LaserBlaster_T3_Mk1",
	storeItemId = 0,

	barrel_rot_speed		= 60,
	barrel_rot_speed_fire	= 10,
	fire_rate_add			= 100,
}

--- ручные пресеты для эсминцев ботов
-- для т2 без лишних модулей и пассивок
Def.Module_Special_Empty =	---#65786 Заглушка для обязательного, как оказалось, спецмодуля
{
	class				= "SpaceShipModule",
	in_editor			= false,
	module_type			= ai.ModuleType.SPECIAL,

	class_mask			= ai.ShipClass.HUGE,
	item_subtype		= ItemSubtype.EnergyReroute,
	
	default_icon		= "ItemSubtype_EnergyReroute_Engine_Module",
	uiName 				= "Module_EnergyReroute_FEngine",
	uiDesc 				= "itemSubType_EnergyReroute_desc_woParams",
}

Def.Ship_Race1_H_T3_5low = 
{
	inherit		= "Ship_Race1_H_T3",
	ship_def	= "Ship_Race1_H_T3",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.25,
	shield_max_mul	= 0.25,
	
	--hull_health										= 11111,
	--shield_max										= 1100,
	--energy_max										= 950,
	--energy_regen 									= 6.46,
	--shield_regen									= 0.0,
	--max_speed 										= 70,
	--boost_maxspeed_coef								= 1.2,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_RailgunDestr_T2",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_TurretThermo_T3_Mk1",--"Module_TachRay_T3_Mk1", "Module_TurretPlasma_T3_Mk1", "Module_Teleporter_T3_Mk1", "Module_RocketSilo_T3_Mk1", "Module_TurretThermo_T3_Mk1", "Module_AdaptiveBigShieldBoost_T3_Mk1"
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_RocketSilo_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_AdaptiveBigShieldBoost_T3_Mk1",
		
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_PassiveArmor_T5_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]	= "ModulePassive_PassiveArmor_T5_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]	= "ModulePassive_PassiveArmor_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CuttedShieldHolder_T3_Epic",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_AdaptiveForceField_T3_Mk1",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "Module_AdaptiveForceField_T3_Mk3",

		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T3_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_CmplxBatt_T5_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_DoomBoost_T3_Mk1",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_SafeBoost_T5_set1",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "",

		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]	= "",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_02 ]	= "",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_03 ]	= "",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",	--Module_EnergyReroute
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T3_Mk3",	---MunitionSectorShield

}


Def.Ship_Race2_H_T3_5low = 
{
	inherit		= "Ship_Race2_H_T3",
	ship_def	= "Ship_Race2_H_T3",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.25,
	shield_max_mul	= 0.25,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_LaserBlaster_T2",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_RocketSilo_T3_Mk1",--"Module_TachRay_T3_Mk1", "Module_TurretPlasma_T3_Mk1", "Module_Teleporter_T3_Mk1", "Module_RocketSilo_T3_Mk1", "Module_TurretThermo_T3_Mk1", "Module_AdaptiveBigShieldBoost_T3_Mk1"
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_TurretThermo_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_AdaptiveBigShieldBoost_T3_Mk1",
		
		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T3_Mk3",
} 


Def.Ship_Race3_H_T3_5low = 
{
	inherit		= "Ship_Race3_H_T3",
	ship_def	= "Ship_Race3_H_T3",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.25,
	shield_max_mul	= 0.25,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_LaserBlaster_T2",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_RocketSilo_T3_Mk1",--"Module_TachRay_T3_Mk1", "Module_TurretPlasma_T3_Mk1", "Module_Teleporter_T3_Mk1", "Module_RocketSilo_T3_Mk1", "Module_TurretThermo_T3_Mk1", "Module_AdaptiveBigShieldBoost_T3_Mk1"
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_TurretThermo_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_AdaptiveBigShieldBoost_T3_Mk1",
		
		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T3_Mk3",
} 

-- t2 low
Def.Ship_Race1_H_T3_5low2 = 
{
	inherit		= "Ship_Race1_H_T3",
	ship_def	= "Ship_Race1_H_T3",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= -1,
	shield_max_mul	= -1,
	plasma_damage_mul = -1,
	railgun_damage_mul = -1,
	laser_damage_mul = -1,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_RailgunDestr_T2",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Empty_PvE",--"Module_TachRay_T3_Mk1", "Module_TurretPlasma_T3_Mk1", "Module_Teleporter_T3_Mk1", "Module_RocketSilo_T3_Mk1", "Module_TurretThermo_T3_Mk1", "Module_AdaptiveBigShieldBoost_T3_Mk1"
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_Empty_PvE",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Empty_PvE",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_AdaptiveBigShieldBoost_T3_Mk1",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",	--Module_EnergyReroute
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T3_Mk3",	---MunitionSectorShield

}


Def.Ship_Race2_H_T3_5low2 = 
{
	inherit		= "Ship_Race2_H_T3",
	ship_def	= "Ship_Race2_H_T3",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= -1,
	shield_max_mul	= -1,
	plasma_damage_mul = -1,
	railgun_damage_mul = -1,
	laser_damage_mul = -1,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_LaserBlaster_T2",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Empty_PvE",--"Module_TachRay_T3_Mk1", "Module_TurretPlasma_T3_Mk1", "Module_Teleporter_T3_Mk1", "Module_RocketSilo_T3_Mk1", "Module_TurretThermo_T3_Mk1", "Module_AdaptiveBigShieldBoost_T3_Mk1"
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_Empty_PvE",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Empty_PvE",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_AdaptiveBigShieldBoost_T3_Mk1",
		
		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T3_Mk3",
} 


Def.Ship_Race3_H_T3_5low2 = 
{
	inherit		= "Ship_Race3_H_T3",
	ship_def	= "Ship_Race3_H_T3",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= -1,
	shield_max_mul	= -1,
	plasma_damage_mul = -1,
	railgun_damage_mul = -1,
	laser_damage_mul = -1,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_LaserBlaster_T2",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Empty_PvE",--"Module_TachRay_T3_Mk1", "Module_TurretPlasma_T3_Mk1", "Module_Teleporter_T3_Mk1", "Module_RocketSilo_T3_Mk1", "Module_TurretThermo_T3_Mk1", "Module_AdaptiveBigShieldBoost_T3_Mk1"
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_Empty_PvE",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Empty_PvE",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_AdaptiveBigShieldBoost_T3_Mk1",
		
		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T3_Mk3",
} 


-- t3
Def.Ship_Race1_H_T3_5 = 
{
	inherit		= "Ship_Race1_H_T3",
	ship_def	= "Ship_Race1_H_T3",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.5,
	shield_max_mul	= 0.5,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_RailgunDestr_T3_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_TurretThermo_T3_Epic",--"Module_TachRay_T3_Epic", "Module_TurretPlasma_T3_Epic", "Module_Teleporter_T3_Epic", "Module_RocketSilo_T3_Epic", "Module_TurretThermo_T3_Epic", "Module_AdaptiveBigShieldBoost_T3_Epic"
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_RocketSilo_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_TachRay_T3_Epic",

		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_AutoRepairUnit_T3_Epic",

		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CuttedShieldHolder_T3_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T3_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ExtCapacitorBattary_T3_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T3_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_BoostersOverloader_T3_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T3_Epic",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T3_Mk3",
}


Def.Ship_Race2_H_T3_5 = 
{
	inherit		= "Ship_Race2_H_T3",
	ship_def	= "Ship_Race2_H_T3",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.5,
	shield_max_mul	= 0.5,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_RailgunDestr_T3_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_TurretThermo_T3_Epic",--"Module_TachRay_T3_Epic", "Module_TurretPlasma_T3_Epic", "Module_Teleporter_T3_Epic", "Module_RocketSilo_T3_Epic", "Module_TurretThermo_T3_Epic", "Module_AdaptiveBigShieldBoost_T3_Epic"
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_RocketSilo_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_TachRay_T3_Epic",

		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_AutoRepairUnit_T3_Epic",

		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CuttedShieldHolder_T3_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T3_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ExtCapacitorBattary_T3_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T3_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_BoostersOverloader_T3_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T3_Epic",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T3_Mk3",
}


Def.Ship_Race3_H_T3_5 = 
{
	inherit		= "Ship_Race3_H_T3",
	ship_def	= "Ship_Race3_H_T3",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.5,
	shield_max_mul	= 0.5,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_RailgunDestr_T3_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_TurretThermo_T3_Epic",--"Module_TachRay_T3_Epic", "Module_TurretPlasma_T3_Epic", "Module_Teleporter_T3_Epic", "Module_RocketSilo_T3_Epic", "Module_TurretThermo_T3_Epic", "Module_AdaptiveBigShieldBoost_T3_Epic"
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_RocketSilo_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_TachRay_T3_Epic",

		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_AutoRepairUnit_T3_Epic",

		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CuttedShieldHolder_T3_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T3_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ExtCapacitorBattary_T3_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T3_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_BoostersOverloader_T3_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T3_Epic",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T3_Mk3",
}


--t4
Def.Ship_Race1_H_T4_5 = 
{
	inherit		= "Ship_Race1_H_T4",
	ship_def	= "Ship_Race1_H_T4",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.75,
	shield_max_mul	= 0.75,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_LaserBlaster_T4_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Javelin_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_TurretThermo_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_TachRay_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_AutoRepairUnit_T4_Epic",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]	= "ModulePassive_ResistHullKinetic_T4_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]	= "ModulePassive_ResistHullThermal_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T4_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_CuttedShieldHolder_T4_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ExtCapacitorBattary_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_BoostersOverloader_T4_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T4_Epic",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T4_Mk3",	---MunitionSectorShield
} 


Def.Ship_Race2_H_T4_5 = 
{
	inherit		= "Ship_Race2_H_T4",
	ship_def	= "Ship_Race2_H_T4",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.75,
	shield_max_mul	= 0.75,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_RailgunDestr_T4_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_RocketSilo_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_TurretThermo_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_GravityAnomaly_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_AutoRepairUnit_T4_Epic",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]	= "ModulePassive_ResistHullKinetic_T4_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]	= "ModulePassive_ResistHullThermal_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T4_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_CuttedShieldHolder_T4_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ExtCapacitorBattary_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_BoostersOverloader_T4_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T4_Epic",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T4_Mk3",	---MunitionSectorShield
} 


Def.Ship_Race3_H_T4_5 = 
{
	inherit		= "Ship_Race3_H_T4",
	ship_def	= "Ship_Race3_H_T4",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.75,
	shield_max_mul	= 0.75,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_OrbGun_T4_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Javelin_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_RocketSilo_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_Teleporter_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_AutoRepairUnit_T4_Epic",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]	= "ModulePassive_ResistHullKinetic_T4_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]	= "ModulePassive_ResistHullThermal_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T4_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_CuttedShieldHolder_T4_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ExtCapacitorBattary_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_BoostersOverloader_T4_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T4_Epic",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T4_Mk3",	---MunitionSectorShield
} 


--t5
Def.Ship_Race1_H_T5_5 = 
{
	inherit		= "Ship_Race1_H_T5",
	ship_def	= "Ship_Race1_H_T5",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 1,
	shield_max_mul	= 1,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_LaserBlaster_T5_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Javelin_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_TurretThermo_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_TachRay_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_AutoRepairUnit_T5_Epic",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]	= "ModulePassive_ResistHullKinetic_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T5_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_CuttedShieldHolder_T5_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ExtCapacitorBattary_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_BoostersOverloader_T5_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T5_Epic",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T5_Mk3",	---MunitionSectorShield
} 

Def.Ship_Race2_H_T5_5 = 
{
	inherit		= "Ship_Race2_H_T5",
	ship_def	= "Ship_Race2_H_T5",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 1,
	shield_max_mul	= 1,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_RailgunDestr_T5_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_RocketSilo_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_TurretThermo_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_GravityAnomaly_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_AutoRepairUnit_T5_Epic",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]	= "ModulePassive_ResistHullKinetic_T5_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]	= "ModulePassive_ResistHullThermal_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T5_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_CuttedShieldHolder_T5_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ExtCapacitorBattary_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_BoostersOverloader_T5_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T5_Epic",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T5_Mk3",	---MunitionSectorShield
} 


Def.Ship_Race3_H_T5_5 = 
{
	inherit		= "Ship_Race3_H_T5",
	ship_def	= "Ship_Race3_H_T5",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.75,
	shield_max_mul	= 0.75,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_OrbGun_T5_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Javelin_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_RocketSilo_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "Module_Teleporter_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_AutoRepairUnit_T5_Epic",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]	= "ModulePassive_ResistHullKinetic_T5_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]	= "ModulePassive_ResistHullThermal_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T5_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_CuttedShieldHolder_T5_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CmplxBatt_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ExtCapacitorBattary_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_BoostersOverloader_T5_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T5_Epic",

		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "DestrMunition_SectorShield_T5_Mk3",	---MunitionSectorShield
} 




---------------------------------------- Пресеты для ботов на зелёных кораблях
-- #76741
Def.Ship_Race5_M_ATTACK_Rank6_5 = 
{
	inherit		= "Ship_Race5_M_ATTACK_Rank6",
	ship_def	= "Ship_Race5_M_ATTACK_Rank6",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 1,
	shield_max_mul	= 1,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Railgun_Basic_T2_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Eagleeye_T2_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_AdaptiveArmorBoost_T2_Epic",

		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]	= "Module_EnemyAnalyzer_T3_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "Module_AdaptiveMembrane_T3_Epic",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_FocusShieldCharge_T3_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T3_Epic",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_GreenBoostOptimizer_T3_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_Standart_T2_Mk3",
}

Def.Ship_Race5_S_SCOUT_Rank6_5 = 
{
	inherit		= "Ship_Race5_S_SCOUT_Rank6",
	ship_def	= "Ship_Race5_S_SCOUT_Rank6",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 1,
	shield_max_mul	= 1.5,
	uiName = "Green_Scout",

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Plasmagun_Basic_T2_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_SpyDrone_T2_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_AdaptiveArmorBoost_T2_Epic",
		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_FocusShieldCharge_T3_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T3_Epic",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_GreenBoostOptimizer_T3_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_AAMu_T2_Mk3",
}


Def.Ship_Race5_M_ATTACK_Rank9_5 = 
{
	inherit		= "Ship_Race5_M_ATTACK_Rank9",
	ship_def	= "Ship_Race5_M_ATTACK_Rank9",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 2,
	shield_max_mul	= 2,
	uiName = "Green_Attack",
	--loot_crate = "", 
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Railgun_Basic_T3_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Eagleeye_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_AdaptiveArmorBoost_T3_Epic",

		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]	= "Module_EnemyAnalyzer_T3_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "Module_AdaptiveMembrane_T3_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_FocusShieldCharge_T3_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T3_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_GreenBoostOptimizer_T3_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_Standart_T3_Mk3",
}

Def.Ship_Race5_M_ATTACK_Rank9_ow = 
{
	inherit		= "Ship_Race5_M_ATTACK_Rank9_5",
}

Def.Ship_Race5_S_SCOUT_Rank9_5 = 
{
	inherit		= "Ship_Race5_S_SCOUT_Rank9",
	ship_def	= "Ship_Race5_S_SCOUT_Rank9",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 2,
	shield_max_mul	= 2.5,
	uiName = "Green_Scout",

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_FunnyDoubleMissile_T4_Epic",	--Weapon_Plasmagun_Basic_T3_Epic

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_SpyDrone_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_AdaptiveArmorBoost_T3_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_FocusShieldCharge_T3_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T3_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_GreenBoostOptimizer_T3_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_AAMu_T3_Mk3",
}

Def.Ship_Race5_S_SCOUT_Rank9_ow = 
{
	inherit		= "Ship_Race5_S_SCOUT_Rank9_5",
}

Def.Ship_Race5_M_ATTACK_Rank12_5 = 
{
	inherit		= "Ship_Race5_M_ATTACK_Rank12",
	ship_def	= "Ship_Race5_M_ATTACK_Rank12",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 3,
	shield_max_mul	= 3,
	railgun_damage_mul = 1.5,
	plasma_damage_mul = 1.5,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_HeatingGun_T4_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Eagleeye_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_AdaptiveArmorBoost_T4_Epic",

		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]	= "Module_EnemyAnalyzer_T4_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "Module_AdaptiveMembrane_T3_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_FocusShieldCharge_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T4_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_GreenBoostOptimizer_T4_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_Standart_T4_Mk3",
}

Def.Ship_Race5_S_SCOUT_Rank12_5 = 
{
	inherit		= "Ship_Race5_S_SCOUT_Rank12",
	ship_def	= "Ship_Race5_S_SCOUT_Rank12",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 3,
	shield_max_mul	= 4,
	plasma_damage_mul	= 1.5,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_FunnyDoubleMissile_T4_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_SpyDrone_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_AdaptiveArmorBoost_T4_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_FocusShieldCharge_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T4_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_GreenBoostOptimizer_T4_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_AAMu_T4_Mk3",
}

Def.Ship_Race5_M_ATTACK_Rank15_5 = 
{
	inherit		= "Ship_Race5_M_ATTACK_Rank15",
	ship_def	= "Ship_Race5_M_ATTACK_Rank15",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 4,
	shield_max_mul	= 4,
	plasma_damage_mul = 2,
	railgun_damage_mul = 2,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_HeatingGun_T5_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Eagleeye_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_AdaptiveArmorBoost_T5_Epic",

		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]	= "Module_EnemyAnalyzer_T5_Epic",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "Module_AdaptiveMembrane_T5_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_FocusShieldCharge_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T5_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_GreenBoostOptimizer_T5_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_Standart_T5_Mk3",
}

Def.Ship_Race5_S_SCOUT_Rank15_5 = 
{
	inherit		= "Ship_Race5_S_SCOUT_Rank15",
	ship_def	= "Ship_Race5_S_SCOUT_Rank15",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 4,
	shield_max_mul	= 5,
	plasma_damage_mul	= 2,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_FunnyDoubleMissile_T5_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_SpyDrone_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_AdaptiveArmorBoost_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "Module_AdaptiveMembrane_T5_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_FocusShieldCharge_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T5_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_GreenBoostOptimizer_T5_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_AAMu_T5_Mk3",
}


Def.Ship_Race5_L_ENGINEER_Rank6_5 = 
{
	inherit		= "Ship_Race5_L_ENGINEER_Rank6",
	ship_def	= "Ship_Race5_L_ENGINEER_Rank6",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 0.25,
	shield_max_mul	= 0.25,
	laser_damage_mul	= -0.5,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Laser_Basic_T2_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_ShieldEmitter_T2_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_RemoteRepairDrones_T2_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T2_Epic",

	},

	default_rocket_munition 						= "SpaceMissile_Cruise_T2_Mk3",
}

Def.Ship_Race5_L_ENGINEER_Rank9_5 = 
{
	inherit		= "Ship_Race5_L_ENGINEER_Rank9",
	ship_def	= "Ship_Race5_L_ENGINEER_Rank9",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 1,
	shield_max_mul	= 1,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Laser_Basic_T3_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_ShieldEmitter_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_RemoteRepairDrones_T3_Epic",

		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]	= "Module_EnemyAnalyzer_T3_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "Module_AdaptiveMembrane_T3_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CuttedShieldHolder_T4_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_ExtCapacitorBattary_T3_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_EmergencyShell_T3_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_RotationThruster_T3_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_Cruise_T3_Mk3",
}

Def.Ship_Race5_L_ENGINEER_Rank12_5 = 
{
	inherit		= "Ship_Race5_L_ENGINEER_Rank12",
	ship_def	= "Ship_Race5_L_ENGINEER_Rank12",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 1.75,
	shield_max_mul	= 1.75,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_GreenHealRailgun_T4_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_ShieldEmitter_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_RemoteRepairDrones_T4_Epic",

		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]	= "Module_EnemyAnalyzer_T4_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "Module_AdaptiveMembrane_T3_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CuttedShieldHolder_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_ExtCapacitorBattary_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_EmergencyShell_T4_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_RotationThruster_T4_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_Cruise_T4_Mk3",
}

Def.Ship_Race5_L_ENGINEER_Rank15_5 = 
{
	inherit		= "Ship_Race5_L_ENGINEER_Rank15",
	ship_def	= "Ship_Race5_L_ENGINEER_Rank15",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 2.5,
	shield_max_mul	= 2.5,
	plasma_damage_mul = 0.25,
	railgun_damage_mul = 0.25,
	laser_damage_mul = 0.25,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_GreenHealRailgun_T5_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_ShieldEmitter_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_RemoteRepairDrones_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_HullResistStation_T5_Epic",

		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]	= "Module_EnemyAnalyzer_T5_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "Module_AdaptiveMembrane_T5_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CuttedShieldHolder_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_ExtCapacitorBattary_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_EmergencyShell_T5_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_RotationThruster_T5_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_Cruise_T5_Mk3",
}

Def.Ship_Race5_L_ENGINEER_ow = 
{
	inherit		= "Ship_Race5_L_ENGINEER_Rank9",
	ship_def	= "Ship_Race5_L_ENGINEER_Rank9",
	ship4bot	= true,
	storeItemId = 0,
	hull_health_mul	= 2,
	shield_max_mul	= 2,
	uiName = "Green_Engineer",
	--loot_crate = "", 
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Laser_Basic_T3_Epic",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_ShieldEmitter_T3_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_RemoteRepairDrones_T3_Epic",

		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]	= "",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "Module_AdaptiveMembrane_T3_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CuttedShieldHolder_T4_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_ExtCapacitorBattary_T3_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_RotationThruster_T3_Epic",

		--[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_Special_Empty",
	},

	default_rocket_munition 						= "SpaceMissile_Cruise_T3_Mk3",
}


---------------------------------------- Крафтовые пресеты с пушкой/ракетами и патронами тоже здесь буду пока делать, основные пресеты пока заняты, а этот файл загружается после
-- #73987
ModulePresets.Ship_Race1_L_T4_CraftUniq_Preset1={}
ModulePresets.Ship_Race1_L_T4_CraftUniq_Preset1.ship_def = "Ship_Race1_L_T4_CraftUniq"
ModulePresets.Ship_Race1_L_T4_CraftUniq_Preset1.munition={}
ModulePresets.Ship_Race1_L_T4_CraftUniq_Preset1.munition[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_LaserUp1_Basic_T4_Mk3"
ModulePresets.Ship_Race1_L_T4_CraftUniq_Preset1.munition[ai.MunitionBayType.MBT_SECONDARY] = "SpaceMissile_Cruise_T4_Mk3"
ModulePresets.Ship_Race1_L_T4_CraftUniq_Preset1.modules={}
ModulePresets.Ship_Race1_L_T4_CraftUniq_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Laser_Basic_T4_Mk1"

ModulePresets.Ship_Race3_L_T4_CraftUniq_Preset1={}
ModulePresets.Ship_Race3_L_T4_CraftUniq_Preset1.ship_def = "Ship_Race3_L_T4_CraftUniq"
ModulePresets.Ship_Race3_L_T4_CraftUniq_Preset1.munition={}
ModulePresets.Ship_Race3_L_T4_CraftUniq_Preset1.munition[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_LaserUp1_Basic_T4_Mk3"
ModulePresets.Ship_Race3_L_T4_CraftUniq_Preset1.munition[ai.MunitionBayType.MBT_SECONDARY] = "SpaceMissile_Cruise_T4_Mk3"
ModulePresets.Ship_Race3_L_T4_CraftUniq_Preset1.modules={}
ModulePresets.Ship_Race3_L_T4_CraftUniq_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Laser_Basic_T4_Mk1"


-- #85568 89562 В корабли вставляю новые-эксклюзивные модули сразу при покупке
ModulePresets.Ship_Race1_S_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_CorrosiveGunScout_T4_Mk1"
ModulePresets.Ship_Race2_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_MacheteFury_T2_Mk1"
ModulePresets.Ship_Race2_S_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_NewShield_T3_Mk1"
ModulePresets.Ship_Race2_S_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_NewShield_T5_Mk1"
ModulePresets.Ship_Race3_L_T2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_SafeSpecial_T2_Mk1"
ModulePresets.Ship_Race3_L_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_SafeSpecial_T4_Mk1"
ModulePresets.Ship_Race3_S_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_ReactorSpark_T2_Mk1"	--fix
ModulePresets.Ship_Race3_S_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_ReactorSpark_T4_Mk1"	--fix
ModulePresets.Ship_Race1_L_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SniperDamageZone_T2_Mk1"
ModulePresets.Ship_Race1_L_T4_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SniperDamageZone_T4_Mk1"
ModulePresets.Ship_Race2_S_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_SuddenFire_T4_Mk1"
ModulePresets.Ship_Race2_S_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_SuddenFire_T5_Mk1"
ModulePresets.Ship_Race1_M_T3_Faction3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_AchillesPylum_T3_Mk1"
ModulePresets.Ship_Race1_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_AchillesPylum_T5_Mk1"
ModulePresets.Ship_Race2_M_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_FastShootAxe_T1_Mk1"
ModulePresets.Ship_Race2_M_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_FastShootAxe_T4_Mk1"
ModulePresets.Ship_Race2_S_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_RadiationWeapon_T4_Mk1"
ModulePresets.Ship_Race2_S_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_SaveBack_T3_Mk1"
ModulePresets.Ship_Race2_L_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_EngineAmplifier_T3_Mk1"
ModulePresets.Ship_Race2_L_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_EngineAmplifier_T5_Mk1"
ModulePresets.Ship_Race1_L_T3_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "Module_UpgradedSpecial_T3_Mk1"
ModulePresets.Ship_Race2_M_T4_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HunterZone_T4_Mk1"
ModulePresets.Ship_Race3_S_T3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SaveJump_T3_Mk1"
ModulePresets.Ship_Race1_M_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_PrometheusFire_T3_Mk1"
ModulePresets.Ship_Race1_M_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_PrometheusFire_T5_Mk1"
ModulePresets.Ship_Race3_M_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_BattleShield_T3_Mk1"
ModulePresets.Ship_Race3_M_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_BattleShield_T5_Mk1"
ModulePresets.Ship_Race1_S_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_ExhaustZone_T2_Mk1"
ModulePresets.Ship_Race1_S_T5_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_ExhaustZone_T5_Mk1"
ModulePresets.Ship_Race2_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_MacheteSmartRL2_T2_Mk1"
ModulePresets.Ship_Race2_M_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_MacheteSmartRL2_T5_Mk1"
ModulePresets.Ship_Race1_S_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SpyBeaconAnalyse_T1_Mk1"
ModulePresets.Ship_Race1_S_T5_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SpyBeaconAnalyse_T5_Mk1"
ModulePresets.Ship_Race3_L_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_BindingShield_T2_Mk1"
ModulePresets.Ship_Race3_L_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_BindingShield_T4_Mk1"
ModulePresets.Ship_Race2_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_TarZone_T2_Mk1"
ModulePresets.Ship_Race2_M_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_TarZone_T5_Mk1"
ModulePresets.Ship_Race2_L_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_EnhanceWeapon_T2_Mk1"
ModulePresets.Ship_Race2_S_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_RailActiveSuppressor_T3_Mk1"
ModulePresets.Ship_Race2_S_T5_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_RailActiveSuppressor_T5_Mk1"
ModulePresets.Ship_Race1_S_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_EnemyInfoCheck_T3_Mk1"
ModulePresets.Ship_Race3_M_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_Lynx2Shield_T2_Mk1"
ModulePresets.Ship_Race3_M_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_Lynx2Shield_T4_Mk1"
ModulePresets.Ship_Race1_L_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SmallReverseThruster_T2_Mk1"
ModulePresets.Ship_Race1_L_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SmallReverseThruster_T4_Mk1"
ModulePresets.Ship_Race1_S_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_EnergyBlaster_T4_Mk1"
ModulePresets.Ship_Race1_S_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_EnergyBlaster_T5_Mk1"
ModulePresets.Ship_Race1_S_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Blind_T3_Mk1"
ModulePresets.Ship_Race2_S_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_IndestructibleShield_T4_Mk1"
ModulePresets.Ship_Race1_L_T3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_WeaponAmplifier_T3_Mk1"
ModulePresets.Ship_Race1_L_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_PrimaryNanoRobots_T4_Mk1"
ModulePresets.Ship_Race3_S_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_WeaknessScoutPlasma_T3_Mk1"
ModulePresets.Ship_Race3_S_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_WeaknessScoutPlasma_T5_Mk1"
ModulePresets.Ship_Race1_L_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "Module_MultiPurposeAdaptor_T4_Mk1"
ModulePresets.Ship_Race2_L_T3_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_ShieldAdaptation_T3_Mk1"
ModulePresets.Ship_Race2_L_T5_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_ShieldAdaptation_T5_Mk1"
ModulePresets.Ship_Race1_L_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_PreparationAdaptation_T4_Mk1"
ModulePresets.Ship_Race3_L_T2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SpaceSqueezer_T2_Mk1"
ModulePresets.Ship_Race3_L_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SpaceSqueezer_T4_Mk1"
ModulePresets.Ship_Race3_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_GuidedDronFoxSlow_T2_Mk1"
ModulePresets.Ship_Race3_M_T4_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_GuidedDronFoxSlow_T5_Mk1"
ModulePresets.Ship_Race1_S_T3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_FakeShipsUpgraded_T3_Mk1"
ModulePresets.Ship_Race3_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_PlasmaHunterGun_T2_Mk1"
ModulePresets.Ship_Race3_M_T5_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_PlasmaHunterGun_T5_Mk1"
ModulePresets.Ship_Race3_L_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_AdaptiveDefense_T4_Mk1"
ModulePresets.Ship_Race2_M_T3_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_KatanaEnergy_T3_Mk1"
ModulePresets.Ship_Race2_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_KatanaEnergy_T5_Mk1"
ModulePresets.Ship_Race3_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_EnergyBurner_T2_Mk1"
ModulePresets.Ship_Race3_M_T4_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_EnergyBurner_T5_Mk1"
ModulePresets.Ship_Race1_S_T2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_DisableWeapon_T2_Mk1"
ModulePresets.Ship_Race3_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_ActiveHunting_T2_Mk1"
ModulePresets.Ship_Race3_M_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_ActiveHunting_T5_Mk1"
ModulePresets.Ship_Race1_S_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_LaserVUX_T3_Mk1"
ModulePresets.Ship_Race1_S_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_LaserVUX_T5_Mk1"
ModulePresets.Ship_Race3_L_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_PlasmaGuard_T2_Mk1"
ModulePresets.Ship_Race3_L_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_PlasmaGuard_T5_Mk1"
ModulePresets.Ship_Race1_L_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ZoneCleaner_T2_Mk1"
ModulePresets.Ship_Race1_L_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ZoneCleaner_T5_Mk1"
ModulePresets.Ship_Race3_S_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HardRadiation_T2_Mk1"
ModulePresets.Ship_Race3_S_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HardRadiation_T5_Mk1"
ModulePresets.Ship_Race3_S_T2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_TeamGuide_T2_Mk1"
ModulePresets.Ship_Race1_S_T4_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_DodgeDrive_T4_Mk1"
ModulePresets.Ship_Race2_S_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_BlastWeaponDestructor_T3_Mk1"
ModulePresets.Ship_Race2_L_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_JerichoTrumpets_T3_Mk1"
ModulePresets.Ship_Race2_L_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_JerichoTrumpets_T5_Mk1"
ModulePresets.Ship_Race3_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_ShieldRenew_T3_Mk1"
ModulePresets.Ship_Race3_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_ShieldRenew_T5_Mk1"
ModulePresets.Ship_Race2_L_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_AdditionalShield_T2_Mk1"
ModulePresets.Ship_Race2_L_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_RebalancedDefense_T3_Mk1"
ModulePresets.Ship_Race2_L_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_RebalancedDefense_T4_Mk1"
ModulePresets.Ship_Race3_S_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SpyDroneShieldThief_T3_Mk1"
ModulePresets.Ship_Race3_S_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SpyDroneShieldThief_T5_Mk1"
ModulePresets.Ship_Race3_L_T3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_CalibrationGrenade_T3_Mk1"
ModulePresets.Ship_Race3_L_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_CalibrationGrenade_T5_Mk1"
ModulePresets.Ship_Race3_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_FoxMShot_T2_Mk1"
ModulePresets.Ship_Race3_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_FoxMShot_T5_Mk1"
ModulePresets.Ship_Race3_S_T3_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_FrontReaperGun_T3_Mk1"
ModulePresets.Ship_Race3_S_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_FrontReaperGun_T5_Mk1"
ModulePresets.Ship_Race1_M_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HerculesOrb_T1_Mk1"
ModulePresets.Ship_Race1_M_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HerculesOrb_T4_Mk1"
ModulePresets.Ship_Race3_M_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_StunningSpurt_T3_Mk1"
ModulePresets.Ship_Race1_M_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_RangeMasterPlus_T2_Mk1"
ModulePresets.Ship_Race1_M_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_RangeMasterPlus_T4_Mk1"
ModulePresets.Ship_Race3_L_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_NanobotsCritAdaptive_T3_Mk1"
ModulePresets.Ship_Race3_M_T3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_WolfPack_T3_Mk1"
ModulePresets.Ship_Race3_M_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_WolfPack_T5_Mk1"
ModulePresets.Ship_Race2_L_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HugeHullDevastator_T3_Mk1"
ModulePresets.Ship_Race3_S_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_PlasmaTorpedoGenerator_T2_Mk1"	--fix
ModulePresets.Ship_Race3_S_T4_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_PlasmaTorpedoGenerator_T4_Mk1"
ModulePresets.Ship_Race2_S_T2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_EnlargeActiveCooldown_T2_Mk1"
ModulePresets.Ship_Race2_S_T4_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_EnlargeActiveCooldown_T4_Mk1"
ModulePresets.Ship_Race2_M_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_BushidoCall_T3_Mk1"
ModulePresets.Ship_Race1_L_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_FocusedRay_T3_Mk1"
ModulePresets.Ship_Race1_L_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_CoupleSupport_T3_Mk1"
ModulePresets.Ship_Race1_S_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HackRocket_T4_Mk1"
ModulePresets.Ship_Race3_M_T3_Faction3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HorrorHowl_T3_Mk1"
ModulePresets.Ship_Race3_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HorrorHowl_T5_Mk1"
ModulePresets.Ship_Race3_L_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_SpeedInsteadShield_T1_Mk1"
ModulePresets.Ship_Race3_L_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_SpeedInsteadShield_T5_Mk1"
ModulePresets.Ship_Race2_S_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_EnemyActiveSuppression_T3_Mk1"
ModulePresets.Ship_Race2_S_T5_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_EnemyActiveSuppression_T5_Mk1"
ModulePresets.Ship_Race1_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_DeimosRageOnEnemy_T2_Mk1"
ModulePresets.Ship_Race1_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_DeimosRageOnEnemy_T5_Mk1"
ModulePresets.Ship_Race2_L_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SafeAcceleration_T3_Mk1"
ModulePresets.Ship_Race2_L_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SafeAcceleration_T5_Mk1"
ModulePresets.Ship_Race2_S_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_DisableWeaponFireRate_T3_Mk1"
ModulePresets.Ship_Race1_L_T2_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_TacticalCalculation_T2_Mk1"
ModulePresets.Ship_Race1_L_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_TacticalCalculation_T4_Mk1"
ModulePresets.Ship_Race3_S_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_BlackBomb_T4_Mk1"
ModulePresets.Ship_Race1_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_DeimosFace_T2_Mk1"
ModulePresets.Ship_Race1_L_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ChainLaser_T4_Mk1"
ModulePresets.Ship_Race1_S_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "Module_ShellRestoration_T4_Mk1"
ModulePresets.Ship_Race1_S_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "Module_ShellRestoration_T5_Mk1"
ModulePresets.Ship_Race2_M_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_AxeShot_T1_Mk1"
ModulePresets.Ship_Race2_M_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_AxeShot_T4_Mk1"
ModulePresets.Ship_Race2_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_ShieldThermoGuard_T2_Mk1"
ModulePresets.Ship_Race2_M_T5_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_ShieldThermoGuard_T5_Mk1"
ModulePresets.Ship_Race3_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ForkLaserFoxM_T2_Mk1"
ModulePresets.Ship_Race3_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ForkLaserFoxM_T5_Mk1"
ModulePresets.Ship_Race3_M_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_CritPlasmaWolfM_T3_Mk1"
ModulePresets.Ship_Race3_L_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_DivineSave_T3_Mk1"
ModulePresets.Ship_Race3_L_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_DivineSave_T4_Mk1"
ModulePresets.Ship_Race3_M_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_CatConcentration_T1_Mk1"
ModulePresets.Ship_Race3_M_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_CatConcentration_T4_Mk1"
ModulePresets.Ship_Race3_S_T3_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_HardCrit_T3_Mk1"
ModulePresets.Ship_Race3_S_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_HardCrit_T5_Mk1"
ModulePresets.Ship_Race2_M_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_KatanaPrepare_T3_Mk1"
ModulePresets.Ship_Race2_M_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_KatanaPrepare_T5_Mk1"
ModulePresets.Ship_Race1_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ForkLaserLight_T2_Mk1"
ModulePresets.Ship_Race1_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ForkLaserLight_T5_Mk1"
ModulePresets.Ship_Race2_L_T3_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_MirvRocket_T3_Mk1"
ModulePresets.Ship_Race2_L_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_MirvRocket_T5_Mk1"
ModulePresets.Ship_Race1_M_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SupportReinforce_T3_Mk1"
ModulePresets.Ship_Race3_L_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_RamCharge_T4_Mk1"
ModulePresets.Ship_Race1_S_T3_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "ModulePassive_RocketFit_T3_Mk1"
ModulePresets.Ship_Race1_S_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "ModulePassive_RocketFit_T5_Mk1"
ModulePresets.Ship_Race3_L_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_ShieldRecycler_T3_Mk1"
ModulePresets.Ship_Race1_S_T4_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HealBanHaze_T4_Mk1"
ModulePresets.Ship_Race1_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "Module_DeimosEmitter_T2_Mk1"
ModulePresets.Ship_Race1_M_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "Module_DeimosEmitter_T4_Mk1"
ModulePresets.Ship_Race2_L_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Hook_T2_Mk1"
ModulePresets.Ship_Race2_L_T5_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Hook_T4_Mk1"
ModulePresets.Ship_Race2_L_T4_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Immortality_T4_Mk1"
ModulePresets.Ship_Race1_S_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HealEnergyBanHaze_T4_Mk1"
ModulePresets.Ship_Race1_M_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_FireStealingPot_T3_Mk1"
ModulePresets.Ship_Race2_M_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_KatanaSPush_T3_Mk1"
ModulePresets.Ship_Race3_L_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_LaserHealNormal_T2_Mk1"
ModulePresets.Ship_Race3_L_T5_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_LaserHealNormal_T5_Mk1"
ModulePresets.Ship_Race2_S_T3_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_ReflectorResonance_T3_Mk1"
ModulePresets.Ship_Race2_S_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_ReflectorResonance_T5_Mk1"
ModulePresets.Ship_Race1_L_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_EnergyFlowBalancer_T2_Mk1"
ModulePresets.Ship_Race1_L_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_EnergyFlowBalancer_T5_Mk1"
ModulePresets.Ship_Race1_L_T2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SniperDefender_T2_Mk1"
ModulePresets.Ship_Race1_L_T5_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_SniperDefender_T5_Mk1"
ModulePresets.Ship_Race1_L_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_FocusedDefence_T3_Mk1"
ModulePresets.Ship_Race1_L_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_FocusedDefence_T5_Mk1"
ModulePresets.Ship_Race2_L_T2_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_WeaknessSense_T2_Mk1"
ModulePresets.Ship_Race2_L_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_WeaknessSense_T5_Mk1"
ModulePresets.Ship_Race3_M_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_CripplingClaws_T2_Mk1"
ModulePresets.Ship_Race3_M_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_CripplingClaws_T4_Mk1"
ModulePresets.Ship_Race3_L_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_RocketRing_T3_Mk1"
ModulePresets.Ship_Race3_L_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_RocketRing_T5_Mk1"
ModulePresets.Ship_Race2_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_MacheteCuttingEdge_T2_Mk1"
ModulePresets.Ship_Race2_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_MacheteCuttingEdge_T5_Mk1"
ModulePresets.Ship_Race1_S_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_ScoutChameleonCommon_T2_Mk1"
ModulePresets.Ship_Race1_M_T3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_PrometheusPot_T3_Mk1"
ModulePresets.Ship_Race1_M_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_PrometheusPot_T5_Mk1"
ModulePresets.Ship_Race2_S_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HackEntity_T3_Mk1"
ModulePresets.Ship_Race2_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_EnergyOptimus_T2_Mk1"
ModulePresets.Ship_Race2_M_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_EnergyOptimus_T4_Mk1"
ModulePresets.Ship_Race2_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_MacheteBox_T2_Mk1"
ModulePresets.Ship_Race2_M_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_MacheteBox_T5_Mk1"
ModulePresets.Ship_Race3_S_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_FuelEmissionsScout_T4_Mk1"
ModulePresets.Ship_Race1_L_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_MatterFlow_T2_Mk1"
ModulePresets.Ship_Race1_L_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_MatterFlow_T5_Mk1"
ModulePresets.Ship_Race3_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_FoxEscapeFromBattle_T3_Mk1"
ModulePresets.Ship_Race3_M_T5_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_FoxEscapeFromBattle_T5_Mk1"
ModulePresets.Ship_Race2_M_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_KatanaMineLayer_T3_Mk1"
ModulePresets.Ship_Race2_M_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_KatanaMineLayer_T5_Mk1"
ModulePresets.Ship_Race2_S_T3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HackWeapon_T3_Mk1"
ModulePresets.Ship_Race2_S_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HackWeapon_T5_Mk1"
ModulePresets.Ship_Race1_S_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_BeaconActiveSilence_T4_Mk1"
ModulePresets.Ship_Race1_L_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Jump2Dude_T4_Mk1"
ModulePresets.Ship_Race3_S_T3_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_ChaosSpawner_T4_Mk1"
ModulePresets.Ship_Race1_M_T3_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_PrometeusCunning_T3_Mk1"
ModulePresets.Ship_Race1_M_T5_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_PrometeusCunning_T5_Mk1"
ModulePresets.Ship_Race2_L_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_MissileReflector_T3_Mk1"
ModulePresets.Ship_Race2_L_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_MissileReflector_T4_Mk1"
ModulePresets.Ship_Race3_L_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Primary2HullRestore_T2_Mk1"
ModulePresets.Ship_Race3_L_T5_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Primary2HullRestore_T5_Mk1"
ModulePresets.Ship_Race1_S_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_ScoutReturn_T2_Mk1"
ModulePresets.Ship_Race1_S_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_ScoutReturn_T5_Mk1"
ModulePresets.Ship_Race3_S_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_CritChecker_T3_Mk1"
ModulePresets.Ship_Race3_S_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_CritChecker_T4_Mk1"
ModulePresets.Ship_Race1_L_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_LastHope_T2_Mk1"
ModulePresets.Ship_Race1_L_T5_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_LastHope_T5_Mk1"
ModulePresets.Ship_Race1_M_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_LengtheningBeam_T4_Mk1"
ModulePresets.Ship_Race1_M_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HerculesGust_T2_Mk1"
ModulePresets.Ship_Race1_M_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_HerculesGust_T4_Mk1"
ModulePresets.Ship_Race2_M_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_LanceWeakness_T4_Mk1"
ModulePresets.Ship_Race2_S_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Backstab_T2_Mk1"
ModulePresets.Ship_Race2_S_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Backstab_T4_Mk1"
ModulePresets.Ship_Race1_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_DeimosWarp_T2_Mk1"
ModulePresets.Ship_Race1_M_T4_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_DeimosWarp_T4_Mk1"
ModulePresets.Ship_Race2_S_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_RadiationCloud_T3_Mk1"
ModulePresets.Ship_Race2_S_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_RadiationCloud_T5_Mk1"
ModulePresets.Ship_Race3_L_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_ParticleExplosion_T2_Mk1"
ModulePresets.Ship_Race3_M_T3_Preset1.modules[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "Module_WolfRun_T3_Mk1"
ModulePresets.Ship_Race2_S_T2_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_WeaponSuppression_T3_Mk1"
ModulePresets.Ship_Race2_S_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "Module_WeaponSuppression_T4_Mk1"
ModulePresets.Ship_Race1_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Decay_T3_Mk1"
ModulePresets.Ship_Race1_M_T5_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_Decay_T5_Mk1"
ModulePresets.Ship_Race3_S_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_EnergyDiversion_T3_Mk1"
ModulePresets.Ship_Race3_S_T5_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_EnergyDiversion_T5_Mk1"
ModulePresets.Ship_Race2_L_T4_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_SuperChamelion_T4_Mk1"
ModulePresets.Ship_Race3_L_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_DivineStorm_T1_Mk1"
ModulePresets.Ship_Race3_L_T4_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_DivineStorm_T4_Mk1"
ModulePresets.Ship_Race2_L_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_BinaryHardener_T2_Mk1"
ModulePresets.Ship_Race2_L_T4_Preset1.modules[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "Module_BinaryHardener_T4_Mk1"
ModulePresets.Ship_Race2_L_T3_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_AdaptiveFire_T3_Mk1"
ModulePresets.Ship_Race2_L_T5_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_AdaptiveFire_T5_Mk1"
ModulePresets.Ship_Race3_L_T3_Preset1.modules[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_DronDamageMod_T3_Mk1"
ModulePresets.Ship_Race2_M_T3_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_KatanaRiposte_T3_Mk1"
ModulePresets.Ship_Race2_M_T5_Preset1.modules[ai.SpaceShipModuleSlot.ACTIVE_01] = "Module_KatanaRiposte_T5_Mk1"
ModulePresets.Ship_Race1_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "Module_PhobosHullRestore_T2_Mk1"
ModulePresets.Ship_Race1_M_T4_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "Module_PhobosHullRestore_T4_Mk1"

--95260 Новая раскладка пушек, до 7го ранга
--Империя
--Перехваты
ModulePresets.Ship_Race1_S_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Laser_Economic_T2_Mk1"
ModulePresets.Ship_Race1_S_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Autofire_T3_Mk1"
ModulePresets.Ship_Race1_S_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Plasmagun_Autofire_T3_Mk1"
ModulePresets.Ship_Race1_S_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_LaserVUX_T3_Mk1"

--Штурмы
ModulePresets.Ship_Race1_M_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Plasmagun_Heavy_T1_Mk1"
ModulePresets.Ship_Race1_M_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Sniper_T2_Mk1"
ModulePresets.Ship_Race1_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_SmartRL_T3_Mk1"
ModulePresets.Ship_Race1_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ForkLaserLight_T2_Mk1"
ModulePresets.Ship_Race1_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Laser_Heavy_T3_Mk1"

--фрегаты
ModulePresets.Ship_Race1_L_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Plasmagun_Sniper_T2_Mk1"
ModulePresets.Ship_Race1_L_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ZoneCleaner_T2_Mk1"
ModulePresets.Ship_Race1_L_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Heavy_T3_Mk1"
ModulePresets.Ship_Race1_L_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Laser_Sniper_T3_Mk1"
ModulePresets.Ship_Race1_L_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Minigun_T3_Mk1"

--Федерация
--перехваты
ModulePresets.Ship_Race3_S_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Laser_Economic_T2_Mk1"
ModulePresets.Ship_Race3_S_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Autofire_T3_Mk1"
ModulePresets.Ship_Race3_S_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Plasmagun_Autofire_T3_Mk1"
ModulePresets.Ship_Race3_S_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_WeaknessScoutPlasma_T3_Mk1"

--Штурмы
ModulePresets.Ship_Race3_M_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Sniper_T2_Mk1"
ModulePresets.Ship_Race3_M_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Plasmagun_Heavy_T2_Mk1"
ModulePresets.Ship_Race3_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_PlasmaHunterGun_T2_Mk1"
ModulePresets.Ship_Race3_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_ForkLaserFoxM_T2_Mk1"
ModulePresets.Ship_Race3_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Cold_Ray_T3_Mk1"

--Фрегаты
ModulePresets.Ship_Race3_L_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Plasmagun_Sniper_T2_Mk1"
ModulePresets.Ship_Race3_L_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_LaserHealNormal_T2_Mk1"
ModulePresets.Ship_Race3_L_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_PlasmaGuard_T2_Mk1"
ModulePresets.Ship_Race3_L_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Heavy_T3_Mk1"
ModulePresets.Ship_Race3_L_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_NanobotsCritAdaptive_T3_Mk1"

--Иерихон
--Перехват
ModulePresets.Ship_Race2_S_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Laser_Economic_T2_Mk1"
ModulePresets.Ship_Race2_S_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Autofire_T3_Mk1"
ModulePresets.Ship_Race2_S_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Plasmagun_Autofire_T3_Mk1"
ModulePresets.Ship_Race2_S_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_RailActiveSuppressor_T3_Mk1"

--Штурмы
ModulePresets.Ship_Race2_M_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_AxeShot_T1_Mk1"
ModulePresets.Ship_Race2_M_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_MacheteSmartRL2_T2_Mk1"
ModulePresets.Ship_Race2_M_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Sniper_T2_Mk1"
ModulePresets.Ship_Race2_M_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_MacheteCuttingEdge_T2_Mk1"
ModulePresets.Ship_Race2_M_T3_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_SmartRL_T3_Mk1"

--Фрегат
ModulePresets.Ship_Race2_L_T1_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Plasmagun_Sniper_T2_Mk1"
ModulePresets.Ship_Race2_L_T1_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Heavy_T3_Mk1"
ModulePresets.Ship_Race2_L_T2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Laser_Sniper_T3_Mk1"
ModulePresets.Ship_Race2_L_T2_Faction1_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_JerichoTrumpets_T3_Mk1"
ModulePresets.Ship_Race2_L_T2_Faction2_Preset1.modules[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Minigun_T3_Mk1"
