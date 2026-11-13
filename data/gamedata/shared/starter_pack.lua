--
StarterPack = {}

--
StarterPackBase = 
{
	credits			= 0,
	goldCredits		= 0,
	tokenCredits	= 0,
--	raceRep			= 500,
	resources =
	{
		--Special_recreation = 50,
	},
	items = {
--		DestrMunition_SectorShield_T3_Mk3 	= 50,
--		WeaponMod_RailUp1_Basic_T3_Mk3 		= 50,
	},
}

--
StarterPack = sys.new( StarterPackBase )

StarterPack.Vessels = 
{

	Ship_Race1_M_T1 = 
	{
--[[ 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]		= "Module_RepairDrones_m_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ]		= "Module_Eagleeye_T1_Mk1",
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Railgun_Basic_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_ArmorPlates_T1_Mk1",	--- #65513
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CapacitorRecharging_T1_Mk1",	--- #77875
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "ModulePassive_CollisionComp_T1_Mk1",	--- #77875
	
	munition =
		{
			[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_RailUp1_Basic_T1_Mk3",
			[ai.MunitionBayType.MBT_SECONDARY] = "SpaceMissile_Standart_T1_Mk3",
		}, ]]
		put_in_battle_slot							= 1,
	},
--[[ -- корабли Harpy (Ship_Race1_L_T1) + Dvergr 2 (Ship_Race1_S_T1_Faction1) + King Dvergr (Ship_Race1_S_T1_Premium) закомментированы 04.09.2025 - в рамках
	Ship_Race1_L_T1 = 
	{
		put_in_battle_slot							= 2,
	},
	Ship_Race1_S_T1_Faction1 = 
	{
		--put_in_battle_slot						= 3,
	},
	Ship_Race1_S_T1_Premium =
	{
		put_in_battle_slot							= 3,
	}, ]] -- -- корабли Harpy (Ship_Race1_L_T1) + Dvergr 2 (Ship_Race1_S_T1_Faction1) + King Dvergr (Ship_Race1_S_T1_Premium) закомментированы 04.09.2025 - в рамках

--[[ 	Ship_Race3_M_T1 = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]		= "Module_RepairDrones_m_T1_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ]		= "Module_WebPropulsion_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ]		= "Module_TargetPainter_T1_Mk1",
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Basic_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "ModulePassive_CollisionComp_T1_Mk1",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T1_Mk1",			--- #77875
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_ArmorPlates_T1_Mk1",	--- #77875
	
		munition =
		{
			[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_RailUp1_Basic_T1_Mk3",
			[ai.MunitionBayType.MBT_SECONDARY] = "SpaceMissile_Standart_T1_Mk3",
		},
		put_in_battle_slot							= 2,
	},

	Ship_Race2_M_T1 = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]		= "Module_RepairDrones_m_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ]		= "Module_ShieldRestoreMedium_T1_Mk1",		
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Basic_T1_Mk1",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T1_Mk1",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CapacitorRecharging_T1_Mk1",	--- #77875
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "ModulePassive_CollisionComp_T1_Mk1",	--- #77875
		
		munition =
		{
			[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_RailUp1_Basic_T1_Mk3",
			[ai.MunitionBayType.MBT_SECONDARY] = "SpaceMissile_Standart_T1_Mk3",
		},
		--put_in_battle_slot							= 3,
	}, ]]
	
--[[ 	Ship_Race1_H_T3 =  -- слоты пассивок {1,2,1,3,2}
	{
		preset 										= "Ship_Race2_H_T3_StartPack", --Ship_Race2_H_T3_StartPack
		put_in_battle_slot							= 3,
	},	 ]]
}
--[[ 
ModulePresets.Ship_Race2_H_T3_StartPack =
	munition = {}
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]		= "Module_TachRay_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ]		= "Module_TurretPlasma_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ]		= "Module_TurretThermo_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ]		= "Module_AdaptiveBigShieldBoost_T3_Mk1",
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_RailgunDestr_T3_Mk3",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T3_Mk1",
		
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CapacitorRecharging_T3_Mk1",	
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_ExtCapacitorBattary_T3_Mk1",	
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "ModulePassive_CollisionComp_T3_Mk1",	
		
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_ArmorPlates_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "ModulePassive_ResistHullKinetic_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "ModulePassive_ResistHullThermal_T3_Mk1",
		
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]		= "ModulePassive_RangeMasterUnit_T3_Mk1",
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ]		= "ModulePassive_TurboScanner_T3_Mk1",
		
		munition =
		{
			[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_RailUp1_Basic_T3_Mk3",
--			[ai.MunitionBayType.MBT_SECONDARY] = "DestrMunition_SectorShield_T3_Mk3",
		},
 ]]
--[[
StarterPack[ ai.Race.EMPIRE ]			= sys.new( StarterPackBase )
StarterPack[ ai.Race.FEDERATION ]		= sys.new( StarterPackBase )
StarterPack[ ai.Race.JERICHO ]			= sys.new( StarterPackBase )


--
StarterPack[ ai.Race.EMPIRE ].Vessels = {

	Ship_Race1_M_T1 = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]		= "Module_RepairDrones_m_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ]		= "Module_Eagleeye_T1_Mk1",
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Railgun_Basic_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_ArmorPlates_T1_Mk1",	--- #65513
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CapacitorRecharging_T1_Mk1",	--- #77875
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "ModulePassive_CollisionComp_T1_Mk1",	--- #77875
	
	munition =
		{
			[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_RailUp1_Basic_T1_Mk3",
			[ai.MunitionBayType.MBT_SECONDARY] = "SpaceMissile_Standart_T1_Mk3",
		},
		put_in_battle_slot							= 1,
	},
}

StarterPack[ ai.Race.FEDERATION ].Vessels = {

	Ship_Race3_M_T1 = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]		= "Module_RepairDrones_m_T1_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ]		= "Module_WebPropulsion_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ]		= "Module_TargetPainter_T1_Mk1",
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Basic_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "ModulePassive_CollisionComp_T1_Mk1",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T1_Mk1",			--- #77875
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "ModulePassive_ArmorPlates_T1_Mk1",	--- #77875
	
		munition =
		{
			[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_RailUp1_Basic_T1_Mk3",
			[ai.MunitionBayType.MBT_SECONDARY] = "SpaceMissile_Standart_T1_Mk3",
		},
		put_in_battle_slot							= 1,
	},
}

StarterPack[ ai.Race.JERICHO ].Vessels			=  {

	Ship_Race2_M_T1 = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]		= "Module_RepairDrones_m_T1_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ]		= "Module_ShieldRestoreMedium_T1_Mk1",		
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01] = "Weapon_Railgun_Basic_T1_Mk1",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AddShldGen_T1_Mk1",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_CapacitorRecharging_T1_Mk1",	--- #77875
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "ModulePassive_CollisionComp_T1_Mk1",	--- #77875
		
		munition =
		{
			[ai.MunitionBayType.MBT_PRIMARY] = "WeaponMod_RailUp1_Basic_T1_Mk3",
			[ai.MunitionBayType.MBT_SECONDARY] = "SpaceMissile_Standart_T1_Mk3",
		},
		put_in_battle_slot							= 1,
	},
}
]]