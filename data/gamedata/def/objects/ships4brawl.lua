Def.Ship1_GTDMBrawl = -- ударка
{
	inherit = "Ship_Race1_M_T5_Premium", -- Штурмовик ударный Империи Spark, R15, "золотой" 
	storeItemId = 0,
	energy_max_mul		= 0.25,
	energy_regen_mul	= 0.25,

--[[
    hull_health         = 20000,
    shield_max          = 500,
    energy_max          = 200,

    max_speed           = 10,
    deceleration        = 0.5,
    decel_afterburning  = 8,
    acceleration        = 5,
    reverse_accel       = 5,
    boost_accel_coef    = 8,
    max_xspeed          = 1.75,
    accel_x0            = 3.75,
    accel_x1            = 3.75,
    decel_x             = 1.5,
    max_yspeed          = 1.75,
    accel_y0            = 3.75,
    accel_y1            = 3.75,
    decel_y             = 1.5,
    boost_maxspeed_coef = 3,
    rot_speed_mul       = 1.2,
    strafe_speed_mul    = 0.5,

    energy_regen                    = 1,
    boost_energy_cost_per_second    = 110,

    hull_resist_kinetic = 1000,
    hull_resist_emp     = 1000,
    hull_resist_thermal = 1000,
    contact_damage_cf   = 0,
    hull_regen          = 1000,
    shield_regen        = 50,
]]
    default_modules =
    {
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_RocketLauncher",
		
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Laser_Heavy_T5_Epic",
		[ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_TimeBoost_T5_Base",
-- 		
		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Eagleeye_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_RepairDrones_m_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Invulnerability_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_Decay_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "Module_PhobosHullRestore_T4_Epic",		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "ModulePassive_CompositeArmor_T5_Epic",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "ModulePassive_ResistHullKinetic_T5_Epic",
		
		-- [ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_SpecialToArmorRestore_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_AdaptiveForceField_T3_Mk1",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "Module_AdaptiveForceField_T3_Mk3",

		--[ ai.SpaceShipModuleSlot.CAPACITOR ]	= "Module_TestDestructible",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "ModulePassive_EmergencyBarrier_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ImplsDischarger_T5_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_ExternalCooler_T3_Epic",
--		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_SafeBoost_T5_set1",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_WideScanner_T5_Epic",
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ] = "ModulePassive_CoProcessor_T5_Epic",
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ] = "ModulePassive_RangeMasterUnit_T5_Epic",
    },

    default_rocket_munition = "SpaceMissile_Kinetic_T5_Mk3",
	munition = { --?? работает ли?
		[ ai.MunitionBayType.MBT_PRIMARY ] = "WeaponMod_LaserUp1_Basic_T5_Mk3",
		[ ai.MunitionBayType.MBT_SECONDARY ] = "SpaceMissile_Kinetic_T5_Mk3",
	},

--    use_team_skin = true,
--    mark_effect =  { s1 = "particles/gadget/football/football_mark_blue", s2 = "particles/gadget/football/football_mark_red", },--Effects_Mark,--"particles/gadget/football/football_mark_blue",
--    mark_effect_offset = 5,

--    ship_name = "Ship_Football",
}

Def.Ship2_GTDMBrawl = -- дальнобой
{
    inherit = "Ship_Race1_L_T5_Premium", -- Фрегат дальнобойный Империи Black Dragon, R15, "золотой"
	storeItemId = 0,
	energy_max_mul		= 0.25,
	energy_regen_mul	= 0.25,

    default_modules =
    {
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_RocketLauncher",
		
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Laser_Sniper_T5_Epic",
        [ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_Disintegrator_T5_Base",
		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_SniperFastShot_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_CivilianRepair_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_ReverseThruster_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_Camouflage_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_HeavyArmor_T5_Epic",		--
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "ModulePassive_CompositeArmor_T5_Epic",--
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "ModulePassive_ResistHullKinetic_T5_Epic",
		
		-- [ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_SpecialToArmorRestore_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_AdaptiveForceField_T3_Mk1",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "Module_AdaptiveForceField_T3_Mk3",

		--[ ai.SpaceShipModuleSlot.CAPACITOR ]	= "Module_TestDestructible",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "ModulePassive_EmergencyBarrier_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_ImplsDischarger_T5_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_ExternalCooler_T3_Epic",
--		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_SafeBoost_T5_set1",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_BattleScanner_T5_Epic",
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ] = "Module_SpaceScan_T5_Prem",
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ] = "Module_SpaceScan_T5_Prem",
    },

    default_rocket_munition = "SpaceMissile_MineField_T5_Mk3",
	munition = { --?? работает ли?
		[ ai.MunitionBayType.MBT_PRIMARY ] = "WeaponMod_LaserFocus_Basic_T5_Mk3",
		[ ai.MunitionBayType.MBT_SECONDARY ] = "SpaceMissile_MineField_T5_Epic",
	},
}

Def.Ship3_GTDMBrawl = -- дивер
{
    inherit = "Ship_Race3_S_T5_Premium", -- Перехватчик диверсии Федерации Golden Eagle, R15, "золотой"
    storeItemId = 0,
	energy_max_mul		= 0.25,
	energy_regen_mul	= 0.25,

    default_modules =
    {
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_RocketLauncher",
		
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Plasmagun_Autofire_T5_Epic",
        [ ai.SpaceShipModuleSlot.SPECIAL ] 				= "Module_PlasmaWeb_T5_Base",
		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_AchillesTargetingUnit_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_RepairDrones_s_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Chameleon_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_DiverTransparency_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_HeavyArmor_T5_Epic",		--
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "ModulePassive_CompositeArmor_T5_Epic",--
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "ModulePassive_ResistHullKinetic_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_NewShield_T5_Epic",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_AdaptiveForceField_T3_Mk1",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "Module_AdaptiveForceField_T3_Mk3",

		--[ ai.SpaceShipModuleSlot.CAPACITOR ]	= "Module_TestDestructible",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "ModulePassive_EmergencyBarrier_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "ModulePassive_WeaponCoolant_T5_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_RotationThruster_T5_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T5_Epic",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "ModulePassive_CollisionComp_T5_Epic",
		
--		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_SafeBoost_T5_set1",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= 
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_WideScanner_T5_Epic",
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ] = "ModulePassive_CoProcessor_T5_Epic",
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ] = "ModulePassive_HardCrit_T5_Epic",
    },

    default_rocket_munition = "SpaceMissile_AAMKin_T5_Mk3",
	munition = { --?? работает ли?
		[ ai.MunitionBayType.MBT_PRIMARY ] = "WeaponMod_PlasmaSupernova_Basic_T5_Mk3",
		[ ai.MunitionBayType.MBT_SECONDARY ] = "SpaceMissile_AAMKin_T3_Mk3",
	},
}

Def.Ship4_GTDMBrawl = -- прикрыван
{
    inherit = "Ship_Race2_L_T5_Premium", -- Фрегат прикрытия Иерихона Patriarch, R15, "золотой"
    storeItemId = 0,
	energy_max_mul		= 0.25,
	energy_regen_mul	= 0.25,


    default_modules =
    {
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_RocketLauncher",
		
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Plasmagun_Sniper_T5_Epic",
        [ ai.SpaceShipModuleSlot.SPECIAL ] 				= "Module_PhaseShield_T5_Base",
		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Hook_T4_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_MissileDefenceType1_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_BoostJammerAOE_T5_Epic",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_ShieldChargeLarge_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_HeavyArmor_T5_Epic",		--
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "ModulePassive_CompositeArmor_T5_Epic",--
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "ModulePassive_ResistHullKinetic_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_ShieldAdaptation_T5_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "ModulePassive_ResistShieldKin_T5_Epic",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "ModulePassive_ResistShldThermal_T5_Epic",

		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "ModulePassive_AccelerationCoil_T5_Epic",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "ModulePassive_AccelerationCoil_T5_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_ExternalCooler_T3_Epic",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T5_Epic",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "ModulePassive_CollisionComp_T5_Epic",
		
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_RangeMasterUnit_T5_Epic",
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ] = "ModulePassive_CoProcessor_T5_Epic",
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ] = "ModulePassive_WideScanner_T5_Epic",
    },

    default_rocket_munition = "SpaceMissile_Torpedo_T5_Mk3",
	munition = { --?? работает ли?
		[ ai.MunitionBayType.MBT_PRIMARY ] = "WeaponMod_PlasmaFast_Basic_T5_Mk3",
		[ ai.MunitionBayType.MBT_SECONDARY ] = "SpaceMissile_Torpedo_T5_Mk3",
	},
}

-- Корабли для обновлённой потасовки "ПРОМО-ВЫЖИВАНИЕ" (с осени 2024: BP17 - AUT24)

Def.ShipS_GTDMBrawl = -- Перехватчик
{
	inherit = "Ship_UFOBall_Brawl", -- КРАСНЫЙ ШАР Apeiron. 
	engine_grades=designers.engine_m_ufoballR,
    storeItemId = 0,
	ship_name = "ShipS_GTDMBrawl",
------ Настраиваемыче параметры корабля (НАЧАЛО БЛОКА)	

	--hull_health         = 20000,
    --shield_max          = 500,
    --energy_max          = 200,
	
	vision_radius_mul	= 0.5, -- увеличена дальность радаров +50%
    --max_speed           = 10,
    --deceleration        = 0.5,
    --decel_afterburning  = 8,
    --acceleration        = 5,
    --reverse_accel       = 5,
    --boost_accel_coef    = 8,
    --max_xspeed          = 1.75,
    --accel_x0            = 3.75,
    --accel_x1            = 3.75,
    --decel_x             = 1.5,
    --max_yspeed          = 1.75,
    --accel_y0            = 3.75,
    --accel_y1            = 3.75,
    --decel_y             = 1.5,
    --boost_maxspeed_coef = 3,
    --rot_speed_mul       = 1.2,
    --strafe_speed_mul    = 0.5,

    --energy_regen                    = 1,
    --boost_energy_cost_per_second    = 110,
	energy_max_mul		= 0.25,
	energy_regen_mul	= 0.25,	

    --hull_resist_kinetic = 1000,
    --hull_resist_emp     = 1000,
    --hull_resist_thermal = 1000,
    --contact_damage_cf   = 0,
    --hull_regen          = 1000,
    --shield_regen        = 50,	

------ Настраиваемыче параметры корабля (КОНЕЦ БЛОКА)		

    default_modules =
    {
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_RocketLauncher",
		
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_FireGunBall_BRAWL",
        [ ai.SpaceShipModuleSlot.SPECIAL ] 				= "Module_BallWarp",
		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_FireArrow_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_GlassAttraction_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Chameleon_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_FakeShipBackstab_BRAWL",
		
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_AutoRepairUnit_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "ModulePassive_CompositeArmor_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "ModulePassive_GreenArmorFocusResist_T5_Rel",
		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "ModulePassive_ResistShieldEMP_T5_Rel",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "ModulePassive_ResistShldThermal_T5_Rel",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "Module_JerichoShld_T5_Rel",

		--[ ai.SpaceShipModuleSlot.CAPACITOR ]	= "Module_TestDestructible", -- этот модуль не включается, тестовый
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "ModulePassive_EmergencyBarrier_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "ModulePassive_WeaponCoolant_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_KatalizatorInjector_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "ModulePassive_CollisionComp_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_CoProcessor_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_02 ] = "ModulePassive_CoProcessor_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_03 ] = "ModulePassive_HardCrit_T5_Epic",
    },

    default_rocket_munition = "SpaceMissile_GravyBlock_BRAWL",
	munition = { --?? работает ли?
		[ ai.MunitionBayType.MBT_PRIMARY ] = "WeaponMod_LaserUp1_Basic_T5_Mk3",
		[ ai.MunitionBayType.MBT_SECONDARY ] = "SpaceMissile_GravyBlock_BRAWL",
	},

------ Персонализация корабля, если нужна (НАЧАЛО БЛОКА)

--    use_team_skin = true,
--    mark_effect =  { s1 = "particles/gadget/football/football_mark_blue", s2 = "particles/gadget/football/football_mark_red", },--Effects_Mark,--"particles/gadget/football/football_mark_blue",
--    mark_effect_offset = 5,
	
	default_custom_elements = -- краски корабля
	{		
	 [ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_Craft_r1_3",
	 [ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Matt_Red01",
	 [ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_specialships_shipball_b1",
	}, 	
    ship_name = "Ship_UFOBall_RED",
	hangarIco="Ship_UFOBall_RED", -- Иконка в ангаре и окне выбора кораблей, 125х73
	hangarIcoSmall="Ship_UFOBall_RED_small" -- Mалая иконка в списке кораблей в боях, 33х26	

------ Персонализация корабля, если нужна (КОНЕЦ БЛОКА)	

}

Def.ShipM_GTDMBrawl = -- Штурмовик 
{
	inherit = "Ship_UFOBall_Brawl", -- СИНИЙ ШАР Apeiron  
	storeItemId = 0,
	engine_grades=designers.engine_m_ufoballB,
	ship_name = "ShipM_GTDMBrawl",
------ Настраиваемыче параметры корабля (НАЧАЛО БЛОКА)	

	--hull_health         = 20000,
    --shield_max          = 500,
    --energy_max          = 200,
	
	vision_radius_mul	= 0.5, -- увеличена дальность радаров +50%
    --max_speed           = 10,
    --deceleration        = 0.5,
    --decel_afterburning  = 8,
    --acceleration        = 5,
    --reverse_accel       = 5,
    --boost_accel_coef    = 8,
    --max_xspeed          = 1.75,
    --accel_x0            = 3.75,
    --accel_x1            = 3.75,
    --decel_x             = 1.5,
    --max_yspeed          = 1.75,
    --accel_y0            = 3.75,
    --accel_y1            = 3.75,
    --decel_y             = 1.5,
    --boost_maxspeed_coef = 3,
    --rot_speed_mul       = 1.2,
    --strafe_speed_mul    = 0.5,

    --energy_regen                    = 1,
    --boost_energy_cost_per_second    = 110,
	energy_max_mul		= 0.25,
	energy_regen_mul	= 0.25,	

    --hull_resist_kinetic = 1000,
    --hull_resist_emp     = 1000,
    --hull_resist_thermal = 1000,
    --contact_damage_cf   = 0,
    --hull_regen          = 1000,
    --shield_regen        = 50,	

------ Настраиваемыче параметры корабля (КОНЕЦ БЛОКА)		

    default_modules =
    {
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_RocketLauncher",
		
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_FreezeGunBall_BRAWL",
        [ ai.SpaceShipModuleSlot.SPECIAL ] 				= "Module_BallWarp",
 		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_FreezingArrow_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_GlassAttraction_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Chameleon_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_FakeShipBackstab_BRAWL",
		
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "Module_UballHull_T5_Epic",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "ModulePassive_AutoRepairUnit_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "ModulePassive_GreenArmorFocusResist_T5_Rel",
		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CuttedShieldHolder_T5_Rel",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_UballShield_T5_Epic",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "Module_AdaptiveForceField_T3_Mk3",

		--[ ai.SpaceShipModuleSlot.CAPACITOR ]	= "Module_TestDestructible", -- этот модуль не включается, тестовый
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_AtlantaCapWeap_T5_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_CmplxBatt_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_RotationThruster_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_BoostersOverloader_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "ModulePassive_CollisionComp_T5_Rel",
		
		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_CoProcessor_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_02 ] = "ModulePassive_CoProcessor_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_03 ] = "ModulePassive_RangeMasterUnit_T5_Epic",
    },

    default_rocket_munition = "SpaceMissile_GravyBlock_BRAWL",
	munition = { --?? работает ли?
		[ ai.MunitionBayType.MBT_PRIMARY ] = "WeaponMod_LaserUp1_Basic_T5_Mk3",
		[ ai.MunitionBayType.MBT_SECONDARY ] = "SpaceMissile_GravyBlock_BRAWL",
	},

------ Персонализация корабля, если нужна (НАЧАЛО БЛОКА)

--    use_team_skin = true,
--    mark_effect =  { s1 = "particles/gadget/football/football_mark_blue", s2 = "particles/gadget/football/football_mark_red", },--Effects_Mark,--"particles/gadget/football/football_mark_blue",
--    mark_effect_offset = 5,
	
	default_custom_elements = -- краски корабля
	{		
	 [ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Matt_Blue03",
	 [ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Matt_Blue01",
	 [ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_specialships_shipball_b1",
	}, 	
    ship_name = "Ship_UFOBall_BLUE",
	hangarIco="Ship_UFOBall_BLUE", -- Иконка в ангаре и окне выбора кораблей, 125х73
	hangarIcoSmall="Ship_UFOBall_BLUE_small" -- Mалая иконка в списке кораблей в боях, 33х26	

------ Персонализация корабля, если нужна (КОНЕЦ БЛОКА)	
	
}

Def.ShipL_GTDMBrawl = -- Эсминец (или фрегат)
{
	inherit = "Ship_UFOBall_Brawl", -- ЗЕЛЁНЫЙ ШАР Apeiron 
	engine_grades=designers.engine_m_ufoballG,	
	storeItemId = 0,
	ship_name = "ShipL_GTDMBrawl",
------ Настраиваемыче параметры корабля (НАЧАЛО БЛОКА)	

	--hull_health         = 110000,
    --shield_max          = 40000,
    --energy_max          = 200,

	vision_radius_mul	= 0.5,
    --max_speed           = 10,
    --deceleration        = 0.5,
    --decel_afterburning  = 8,
    --acceleration        = 5,
    --reverse_accel       = 5,
    --boost_accel_coef    = 8,
    --max_xspeed          = 1.75,
    --accel_x0            = 3.75,
    --accel_x1            = 3.75,
    --decel_x             = 1.5,
    --max_yspeed          = 1.75,
    --accel_y0            = 3.75,
    --accel_y1            = 3.75,
    --decel_y             = 1.5,
    --boost_maxspeed_coef = 3,
    --rot_speed_mul       = 1.2,
    --strafe_speed_mul    = 0.5,

    --energy_regen                    = 1,
    --boost_energy_cost_per_second    = 110,
	energy_max_mul		= 0.25,
	energy_regen_mul	= 0.25,	

    --hull_resist_kinetic = 1000,
    --hull_resist_emp     = 1000,
    --hull_resist_thermal = 1000,
    --contact_damage_cf   = 0,
    --hull_regen          = 1000,
    --shield_regen        = 50,	

------ Настраиваемыче параметры корабля (КОНЕЦ БЛОКА)		

-- для НОДАвого (напр. "Зелёного") корабля прописываются кости (для остальных блок "slot_bones" комментируем). Прописывается вместе с "default_slot_mask" (см ниже)
--[[
	slot_bones = 
	{
		[ai.SpaceShipModuleSlot.ACTIVE_01] = "active_up_1",
		[ai.SpaceShipModuleSlot.ACTIVE_02] = "active_up_2",
		[ai.SpaceShipModuleSlot.ACTIVE_03] = "active_up_3",
		[ai.SpaceShipModuleSlot.ACTIVE_04] = "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01] = "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02] = "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03] = "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01] = "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02] = "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03] = "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01] = "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02] = "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03] = "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] = "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02] = "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03] = "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02] = "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03] = "root"
	},
]]
    default_modules =
    {
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_RocketLauncher",
		
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_HealGunBall_BRAWL",
        [ ai.SpaceShipModuleSlot.SPECIAL ] 				= "Module_BallWarp",
		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_HealArrow_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_GlassAttraction_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Chameleon_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_FakeShipBackstab_BRAWL",
		
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "Module_SaturnHull_T5_Epic",		
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "ModulePassive_ResistHullThermal_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "ModulePassive_CompositeArmor_T5_Rel",
		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "ModulePassive_ResistShieldEMP_T5_Rel",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_ExtremeShieldCharge_T5_Epic",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "Module_FocusShieldCharge_T5_Epic",

		--[ ai.SpaceShipModuleSlot.CAPACITOR ]	= "Module_TestDestructible", -- этот модуль не включается, тестовый
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "ModulePassive_WeaponCoolant_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "ModulePassive_WeaponCoolant_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_SaturnEngine_T5_Epic",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_GreenFastProjectile_T5_Epic",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "",
		
		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_CoProcessor_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_02 ] = "ModulePassive_CoProcessor_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_03 ] = "ModulePassive_WideScanner_T5_Rel",
    },

    default_rocket_munition = "SpaceMissile_GravyBlock_BRAWL",
	munition = { --?? работает ли?
		[ ai.MunitionBayType.MBT_PRIMARY ] = "WeaponMod_LaserUp1_Basic_T5_Mk3",
		[ ai.MunitionBayType.MBT_SECONDARY ] = "SpaceMissile_GravyBlock_BRAWL",
	},

------ Персонализация корабля, если нужна (НАЧАЛО БЛОКА)

--    use_team_skin = true,
--    mark_effect =  { s1 = "particles/gadget/football/football_mark_blue", s2 = "particles/gadget/football/football_mark_red", },--Effects_Mark,--"particles/gadget/football/football_mark_blue",
--    mark_effect_offset = 5,
	
	default_custom_elements = -- краски корабля
	{		
	 [ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_Prec2",
	 [ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Matt_Green02",
	 [ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_specialships_shipball_b1",
	}, 	
    ship_name = "Ship_UFOBall_GREEN",
	hangarIco="Ship_UFOBall_GREEN", -- Иконка в ангаре и окне выбора кораблей, 125х73
	hangarIcoSmall="Ship_UFOBall_GREEN_small" -- Mалая иконка в списке кораблей в боях, 33х26	

------ Персонализация корабля, если нужна (КОНЕЦ БЛОКА)	

-- для НОДАвого (напр. "Зелёного") корабля прописывается маска слота (для остальных блок "default_slot_mask" комментируем). Прописывается вместе со "slot_bones" (см выше)
--[[
    default_slot_mask = ai.SpaceShipModuleSlotMask.ACTIVE_01 + ai.SpaceShipModuleSlotMask.ACTIVE_02 + ai.SpaceShipModuleSlotMask.ACTIVE_03 + ai.SpaceShipModuleSlotMask.ACTIVE_04 + 
						ai.SpaceShipModuleSlotMask.ENGINE_MOD_01 + ai.SpaceShipModuleSlotMask.ENGINE_MOD_02 + ai.SpaceShipModuleSlotMask.ENGINE_MOD_03 + 
						ai.SpaceShipModuleSlotMask.SHIELD_MOD_01 + ai.SpaceShipModuleSlotMask.SHIELD_MOD_02 + ai.SpaceShipModuleSlotMask.SHIELD_MOD_03 + 
						ai.SpaceShipModuleSlotMask.ARMOR_MOD_01 + ai.SpaceShipModuleSlotMask.ARMOR_MOD_02 + ai.SpaceShipModuleSlotMask.ARMOR_MOD_03 + 
						ai.SpaceShipModuleSlotMask.CAPACITOR_MOD_01 + ai.SpaceShipModuleSlotMask.CAPACITOR_MOD_02 + ai.SpaceShipModuleSlotMask.CAPACITOR_MOD_03 + 
						ai.SpaceShipModuleSlotMask.CPU_MOD_01 + ai.SpaceShipModuleSlotMask.CPU_MOD_02 + ai.SpaceShipModuleSlotMask.CPU_MOD_03 + 
						ai.SpaceShipModuleSlotMask.PRIMARY_WEAPON_01 + ai.SpaceShipModuleSlotMask.SECONDARY_WEAPON + ai.SpaceShipModuleSlotMask.SPECIAL + 
						ai.SpaceShipModuleSlotMask.ENGINE + ai.SpaceShipModuleSlotMask.CAPACITOR + ai.SpaceShipModuleSlotMask.SHIELD + ai.SpaceShipModuleSlotMask.ARMOR + ai.SpaceShipModuleSlotMask.CPU 
]]
}

Def.ShipH_GTDMBrawl = -- Эсминец (или фрегат) 
{
	inherit = "Ship_UFOBall_Brawl", -- ЖЁЛТЫЙ ШАР Apeiron 
    storeItemId = 0,
	engine_grades=designers.engine_m_ufoballY,	
	ship_name = "ShipH_GTDMBrawl",
------ Настраиваемыче параметры корабля (НАЧАЛО БЛОКА)	

	--hull_health         = 90000,
    --shield_max          = 900,
    --energy_max          = 200,
	
	vision_radius_mul	= 0.5, -- увеличена дальность радаров +50%
    --max_speed           = 10,
    --deceleration        = 0.5,
    --decel_afterburning  = 8,
    --acceleration        = 5,
    --reverse_accel       = 5,
    --boost_accel_coef    = 8,
    --max_xspeed          = 1.75,
    --accel_x0            = 3.75,
    --accel_x1            = 3.75,
    --decel_x             = 1.5,
    --max_yspeed          = 1.75,
    --accel_y0            = 3.75,
    --accel_y1            = 3.75,
    --decel_y             = 1.5,
    --boost_maxspeed_coef = 3,
    --rot_speed_mul       = 1.2,
    --strafe_speed_mul    = 0.5,

    --energy_regen                    = 1,
    --boost_energy_cost_per_second    = 110,
	energy_max_mul		= 0.25,
	energy_regen_mul	= 0.25,	

    --hull_resist_kinetic = 1000,
    --hull_resist_emp     = 1000,
    --hull_resist_thermal = 1000,
    --contact_damage_cf   = 0,
    --hull_regen          = 1000,
    --shield_regen        = 50,	

------ Настраиваемыче параметры корабля (КОНЕЦ БЛОКА)	

    default_modules =
    {
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_RocketLauncher",
		
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_AsteridGunBall_BRAWL",
        [ ai.SpaceShipModuleSlot.SPECIAL ] 				= "Module_BallWarp",
		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_StoneShield_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_GlassAttraction_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Chameleon_BRAWL",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_FakeShipBackstab_BRAWL",
		
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_GreenArmorFocusResist_T5_Rel",		
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "ModulePassive_HeavyArmor_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "ModulePassive_ResistHullThermal_T5_Rel",
		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_CarolShield_T5_Epic",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "ModulePassive_ResistShieldEMP_T5_Rel",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "ModulePassive_ShieldExtender_T5_Rel",

		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "ModulePassive_AccelerationCoil_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "ModulePassive_EmergencyBarrier_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CapacitorRecharging_T5_Rel",
		
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_RotationThruster_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_RotationThruster_T5_Rel",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "ModulePassive_CollisionComp_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_RangeMasterUnit_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_02 ] = "ModulePassive_DisintegaratorBoost_T5_Rel",
		--[ ai.SpaceShipModuleSlot.CPU_MOD_03 ] = "ModulePassive_TurboScanner_T5_Rel",
    },

    default_rocket_munition = "SpaceMissile_GravyBlock_BRAWL",
	munition = { --?? работает ли?
		[ ai.MunitionBayType.MBT_PRIMARY ] = "WeaponMod_RailUp1_Basic_T5_Mk3",
		[ ai.MunitionBayType.MBT_SECONDARY ] = "SpaceMissile_GravyBlock_BRAWL",
	},

------ Персонализация корабля, если нужна (НАЧАЛО БЛОКА)

--    use_team_skin = true,
--    mark_effect =  { s1 = "particles/gadget/football/football_mark_blue", s2 = "particles/gadget/football/football_mark_red", },--Effects_Mark,--"particles/gadget/football/football_mark_blue",
--    mark_effect_offset = 5,
	
	default_custom_elements = -- краски корабля
	{		
	 [ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Matt_Yellow02",
	 [ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Matt_Pastel_Yellow",
	 [ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_specialships_shipball_b1",
	}, 	
    ship_name = "Ship_UFOBall_YELLOW",
	hangarIco="Ship_UFOBall_YELLOW", -- Иконка в ангаре и окне выбора кораблей, 125х73
	hangarIcoSmall="Ship_UFOBall_YELLOW_small" -- Mалая иконка в списке кораблей в боях, 33х26	

------ Персонализация корабля, если нужна (КОНЕЦ БЛОКА)	
}