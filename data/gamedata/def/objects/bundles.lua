BundleStoreItemIdCounter = 210000
function Bundles_GetNextStoreItemId()
	BundleStoreItemIdCounter = BundleStoreItemIdCounter + 1
	return BundleStoreItemIdCounter
end

Def.BundleBase = 
{
	in_editor			= false,
	is_bundle			= true,
	stacks				= false,
	shopCategory		= "OFFICE",
	shopSubCategory		= "BUNDLES",
}

-- Что указывается в параметрах			str_param 		и	int_param:
-- 		fixed_contents:
-- ai.BundleContent.VESSEL:				имя вещи			---------
-- ai.BundleContent.EXP:				---------			---------
-- ai.BundleContent.CUSTOM_ELEMENT:		имя элемента		---------
-- ai.BundleContent.TITLE:				---------			id титула
-- ai.BundleContent.ACCOUNT_AURA:		имя ауры			---------
-- ai.BundleContent.INVENTORY_EXT:		---------			уровень инвентаря
-- ai.BundleContent.CRAFT_RESOURCE:		имя вещи			---------
-- ai.BundleContent.EVENT_CREDITS		---------			---------
-- ai.BundleContent.AVATAR				имя вещи			---------
-- ai.BundleContent.MOTTO				имя вещи			---------

-- random_contents:
-- ai.BundleContent.ITEM:				имя вещи			позолота
-- ai.BundleContent.EXP:				---------			---------
-- ai.BundleContent.CRAFT_RESOURCE:		имя вещи			---------
-- ai.BundleContent.BLUEPRINT:			имя вещи			---------
-- ai.BundleContent.VESSEL_BUDGET:    	---------			--------- 
-- ai.BundleContent.ACCOUNT_AURA:		имя ауры			---------
-- ai.BundleContent.EVENT_CREDITS		---------			---------
-- ai.BundleContent.AUTOGEN				имя автоген-класса	ранг



-- Пример бандла
--[[
Def.BundleTest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	-- и остальные стандартные магазинные параметры типа cant_be_bought
	uiName				= "BundleTest_name",
	uiDesc				= "BundleTest_desc",
	cant_be_bought 		= true,
	uiPromo 			= "BundleTest_promo",
	premiumPriceTotal 	= 2500,

	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race3_L_T2_Premium",	price_weight = 0.2, },
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race3_L_T3",	price_weight = 0.2, },
		{ type = ai.BundleContent.EXP,		amount = 50000,									},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "MPreset_01",	price_weight = 0.2, },
		--{ type = ai.BundleContent.TITLE,	amount = 1,		int_param = PlayerTitleId.DEVELOPER,	price_weight = 0.1, },
		--{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "Steamer_1",		price_weight = 0.25, },
		--{ type = ai.BundleContent.INVENTORY_EXT,	amount = 1,	int_param = 4,				price_weight = 0.35, },
		{ type = ai.BundleContent.AUTOGEN,	amount = 1,		str_param = "COMMON",	int_param = 10,	price_weight = 0.2, },	-- str_param - класс автогена из AutogenClass, int_param - ранг модуля
	},
	
	random_contents = 
	{
		{
			{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Weapon_Plasmagun_Heavy_T3_Epic",	int_param = 1,	drop_weight = 0.50, },
			{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Weapon_Plasmagun_Heavy_T3_Rare",	int_param = 0,	drop_weight = 0.50, },
			{ type = ai.BundleContent.AUTOGEN,	amount = 1,	str_param = "COMMON",							int_param = 10,	price_weight = 0.2, },	-- str_param - класс автогена из AutogenClass, int_param - ранг модуля
		},
		
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Plasmagun_Heavy_T4_Epic",	int_param = 1,	drop_weight = 0.50, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Plasmagun_Heavy_T4_Rare",	int_param = 0,	drop_weight = 0.50, },
		},
	},
}
]]

Def.Bundle_For_Testers = 
{
    inherit				= "BundleBase",
    premiumPrice		= 99999999,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_For_Testers",
    uiDesc				= "Bundle_For_Testers",
    cant_be_bought 		= true,
    uiPromo 			= "",
    default_icon		= "",
	can_be_sent_by_mail	= false,

    fixed_contents = 
    {
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "football_cup",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "football_craft",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ScrapAttractor_T4_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ScrapAttractor_T4_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ScrapAttractor_T5_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Battery",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Common_fuel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Computing_chip",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Explosion",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Iridium_girder",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 9999,	str_param = "Iridium_monocrystall",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Iridium_plate",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Processor_block",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Pure_silicon",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Screened_battery",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Tungsten_plate",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ow_Crystal_shard",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ow_Ice_block",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ow_Impure_iridium",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ow_Osmium_ore",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ow_Pure_iridium",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ow_Quartz_crystal",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ow_Silicon_wafer",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ow_Tungsten_ore",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Race2_L_T5_Francisca",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Race3_L_T5_Comodo",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race1_L_T3_Pirate",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race1_L_T5_PremUniq",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race1_M_T1_Premium",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race2_L_T1_Premium",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race2_M_T4_PremUniq",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race2_S_T5_Premium",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race3_L_T3_Pirate",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race3_L_T3_PremUniq",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race3_M_T4_PremUniq",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race3_S_T1_Premium",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_Ship_Race3_S_T4_PremUniq",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_armor",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_base",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_capacitor",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_destr",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_destr4",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_engine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_shield",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 9999,	str_param = "Aliens_ship_part",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "MediumCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_destr5",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_cpu_H_Emp",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "SmallCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_cpu_H_Jer",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Destroyer_T5_Fed_Activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Destroyer_T5_Jer_Activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 9999,	str_param = "AlienCompositeAlloy",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "FormPattern_Alien_Fighter",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_l_t4_pu_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race2_m_t4_pu_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_l_t4_pu_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race2_m_t4_pu_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race2_m_t4_pu_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_l_t4_pu_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "LaserBlaster_T5_cooler",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "LaserBlaster_T4_cooler",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "LaserBlaster_T3_cooler",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "LaserBlaster_T5_resonator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "LaserBlaster_T3_resonator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "LaserBlaster_T4_resonator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RailgunDestr_T3_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RailgunDestr_T4_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RailgunDestr_T5_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RailgunDestr_T3_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RailgunDestr_T4_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RailgunDestr_T5_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "DestrResonatingLaser_lens",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "DestrResonatingLaser_impulsesupply",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "KineticFloatingCrit_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "KineticFloatingCrit_heattransfer",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Teleporter_T3_projector",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Teleporter_T4_projector",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Teleporter_T5_projector",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Teleporter_T3_stabilizer",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Teleporter_T4_stabilizer",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Teleporter_T5_stabilizer",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RocketSilo_T4_launcher",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RocketSilo_T5_launcher",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RocketSilo_T4_rotor",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RocketSilo_T5_rotor",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "GravityAnomaly_T4_matterconverter",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "GravityAnomaly_T5_matterconverter",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "GravityAnomaly_T4_lens",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "GravityAnomaly_T5_lens",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "PushRay_T5_emitter",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "PushRay_T5_powersupply",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Javelin_T5_projector",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Javelin_T5_shell",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Javelin_T4_projector",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Javelin_T4_shell",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "MovementRestrictor_capacitor",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "MovementRestrictor_emitter",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "DestrBeamDrone_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "DestrBeamDrone_launcher",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "IsotopeHarvester_rotor",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "IsotopeHarvester_plasmainductor",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "DestrDeadlyTrap_trapstorage",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "DestrDeadlyTrap_launcher",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "EnemyResistReductor_corecpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "EnemyResistReductor_scanner",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ShieldHealOnEnemyDeath_capacitor",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ShieldHealOnEnemyDeath_device",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "CoolantSystemIdle_grapheneplate",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "CoolantSystemIdle_refrigerant",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "green_tree_activator_1",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "green_tree_activator_2",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "green_tree_activator_3",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "green_tree_activator_4",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "green_tree_activator_5",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "green_tree_activator_Rare",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "FormPattern_Alien_Scout",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Internal_Equipment_ScoutCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Lightweight_Plates_ScoutCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Lifesupporting_System_ScoutCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RailVolcano_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "LargeCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_l_t4_spiral_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_l_t4_spiral_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_l_t4_spiral_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race3_l_t4_shuttle_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race3_l_t4_shuttle_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race3_l_t4_shuttle_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "storage_crystals",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "AcceleratedAmplifyer_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "OverheatingLaser_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Destroyer_T5_Emp_CPU",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Destroyer_T5_Fed_CPU",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Destroyer_T5_Jer_CPU",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Destroyer_T5_Emp_Activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ScrapAttractor_T3_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ScrapAttractor_T3_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "entangled_shards",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "cascade_crystals",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ScrapAttractor_T5_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Lifesupporting_System_EngineerCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "ship_part_craft_cpu_H_Fed",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Internal_Equipment_EngineerCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "FormPattern_Alien_Engineer",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Control_Interface_EngineerCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "Lightweight_Plates_EngineerCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "AlienCorpse",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "AlienPizzaSlice",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_m_t5_granite_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_m_t5_granite_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_m_t5_granite_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_l_t5_project_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_l_t5_project_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_l_t5_project_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race3_s_t5_spike_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race3_s_t5_spike_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race3_s_t5_spike_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race3_m_t5_wolfhound_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race3_m_t5_wolfhound_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race3_m_t5_wolfhound_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race2_s_t5_zhen_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race2_s_t5_zhen_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race2_s_t5_zhen_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race2_m_t5_singularity_hull",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race2_m_t5_singularity_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race2_m_t5_singularity_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "FrontLineCannon_T3_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "FrontLineCannon_T4_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "FrontLineCannon_T5_barrel",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "FrontLineCannon_T3_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "FrontLineCannon_T4_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "FrontLineCannon_T5_charger",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_s_t5_herald_activator",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "unstable_crystals",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "HugeCabine",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 9999,	str_param = "pve_resource",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "race1_s_t5_herald_cpu",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RocketSilo_T3_launcher",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "RocketSilo_T3_rotor",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "hunger_craft",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "resource_zeta_final_add_1",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "resource_zeta_final_add_2",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "resource_zeta_final_add_3",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "resource_zeta_final_add_4",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "resource_zeta_final_2",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "resource_zeta_final_1",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 999,	str_param = "resource_zeta_main",},
        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 99,	str_param = "race2_l_t5_craftuniq_part",},
    },
}

-- Arc DLCs
Def.Bundle_Arc_DLC_Merc1 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 4800,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Merc1_name",
	uiDesc				= "Bundle_Arc_DLC_Merc1_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 4800,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.MERCENARY,	price_weight = 0.48, }, 
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Steamer_1",				price_weight = 0.49, },
		--{ type = ai.BundleContent.INVENTORY_EXT,	amount = 1,		int_param = 25,							price_weight = 0.01, }, -- Расширение склада. Закомментировано, в рамках тикета SC-120256 Расширение склада за Галактические стандарты («голду»)
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_grid01",				price_weight = 0.01, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_tech01",				price_weight = 0.01, },
	},
}

Def.Bundle_Arc_DLC_Merc2 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 12000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Merc2_name",
	uiDesc				= "Bundle_Arc_DLC_Merc2_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 12000,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.SPACE_WOLF,	price_weight = 0.14, }, 
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Steamer_2",				price_weight = 0.13, },
		--{ type = ai.BundleContent.INVENTORY_EXT,	amount = 1,		int_param = 25,							price_weight = 0.01, }, -- Расширение склада. Закомментировано, в рамках тикета SC-120256 Расширение склада за Галактические стандарты («голду»)
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_grid01",				price_weight = 0.01, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_tech01",				price_weight = 0.01, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race1_M_T3_Steam",	price_weight = 0.1, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race3_S_T2_Steam",	price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Berzerker",				price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Bulldog",					price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Evil_heart",				price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Pacific",					price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "White_wolf",				price_weight = 0.1, },
	},
}

Def.Bundle_Arc_DLC_Merc3 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 20000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Merc3_name",
	uiDesc				= "Bundle_Arc_DLC_Merc3_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 20000,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.ELITE_PILOT,	price_weight = 0.14, },
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Steamer_3",				price_weight = 0.13, },
		--{ type = ai.BundleContent.INVENTORY_EXT,	amount = 1,		int_param = 25,							price_weight = 0.01, }, -- Расширение склада. Закомментировано, в рамках тикета SC-120256 Расширение склада за Галактические стандарты («голду»)
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_grid01",				price_weight = 0.01, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_tech01",				price_weight = 0.01, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race1_S_T2_Steam",	price_weight = 0.05, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race3_M_T3_Steam",	price_weight = 0.05, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_M_T3_Steam",	price_weight = 0.05, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_L_T2_Steam",	price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Cross_skull",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Devil",					price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Empire_Elite",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Federation_elite",			price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Holy_skull",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Jericho_elite",			price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Mechanist",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Nemesis",					price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Pilot_skull",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Radiation",				price_weight = 0.05, },
	},
}

Def.Bundle_Arc_DLC_Pirate1 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 4800,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Pirate1_name",
	uiDesc				= "Bundle_Arc_DLC_Pirate1_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 4800,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.CORSAIR,		price_weight = 0.23, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_grid01",				price_weight = 0.01, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_tech01",				price_weight = 0.01, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race3_M_T2_Pirate",	price_weight = 0.25, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Golden_axe",				price_weight = 0.25, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Half_skull",				price_weight = 0.25, },
	},
}

Def.Bundle_Arc_DLC_Pirate2 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 12000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Pirate2_name",
	uiDesc				= "Bundle_Arc_DLC_Pirate2_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 12000,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.DESPERADO,	price_weight = 0.09, },
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Pirate_1",					price_weight = 0.09, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_grid01",				price_weight = 0.01, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_tech01",				price_weight = 0.01, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race3_S_T3_Pirate",	price_weight = 0.1, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race3_L_T3_Pirate",	price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Golden_axe",				price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Jericho_dream",			price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Pirate_flag",				price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Old_roger",				price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Saber_cross",				price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Trefoil",					price_weight = 0.1, },
	},
}

Def.Bundle_Arc_DLC_Pirate3 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 20000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Pirate3_name",
	uiDesc				= "Bundle_Arc_DLC_Pirate3_desc",
	cant_be_bought 		= false, --true,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 20000,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.PIRATE_BARON,	price_weight = 0.17, },
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Pirate_2",					price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_grid01",				price_weight = 0.01, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "OWDLC_tech01",				price_weight = 0.01, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race1_S_T3_Pirate",	price_weight = 0.05, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race1_L_T3_Pirate",	price_weight = 0.05, },
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race1_M_T2_Pirate",	price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Red_beard",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Pirate_flag_neon",			price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Raven",					price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "New_roger",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Mad_monkey",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Hook",						price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Doom",						price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Ciber_eagle",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Ciber_skull",				price_weight = 0.05, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Trefoil",					price_weight = 0.05, },
	},
}

-- new Arc 2015

Def.Bundle_Arc_DLC_Fleet1 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 8500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Fleet1_name",
	uiDesc				= "Bundle_Arc_DLC_Fleet1_desc",
	cant_be_bought 		= false, --true,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 8500,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		-- Loki 1199руб/24,99$
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race1_M_T4_Steam",	price_weight = 1.00, },
	},
}

Def.Bundle_Arc_DLC_Fleet2 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 2100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Fleet2_name",
	uiDesc				= "Bundle_Arc_DLC_Fleet2_desc",
	cant_be_bought 		= false, --true,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 2100,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		-- Razor 499руб/10,49$
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_M_T2_Steam",	price_weight = 1.00, },
	},
}

Def.Bundle_Arc_DLC_Fleet3 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 4070,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Fleet3_name",
	uiDesc				= "Bundle_Arc_DLC_Fleet3_desc",
	cant_be_bought 		= false, --true,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 4070,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		-- Blood Tormentor 899руб/18,99$
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_L_T4_Pirate",	price_weight = 1.00, },
	},
}

Def.Bundle_Arc_DLC_Fleet4 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 8000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Fleet4_name",
	uiDesc				= "Bundle_Arc_DLC_Fleet4_desc",
	cant_be_bought 		= false, --true,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 8000,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		-- Sawtooth 1199руб/24,99$
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_M_T4_Pirate",	price_weight = 1.00, },
	},
}

Def.Bundle_Arc_DLC_Fleet5 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 8250,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Fleet5_name",
	uiDesc				= "Bundle_Arc_DLC_Fleet5_desc",
	cant_be_bought 		= false, --true,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 8250,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		-- Cutter 1199руб/24,99$
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_S_T4_Pirate",	price_weight = 1.00, },
	},
}

Def.Bundle_Arc_DLC_Fleet6 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 8900,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Fleet6_name",
	uiDesc				= "Bundle_Arc_DLC_Fleet6_desc",
	cant_be_bought 		= false, --true,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 8900,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		-- Mauler 1499руб/31,49$
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_L_T5_Steam",	price_weight = 1.00, },
	},
}

Def.Bundle_Arc_DLC_Dogs1 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 4070,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Dogs1_name",
	uiDesc				= "Bundle_Arc_DLC_Dogs1_desc",
	cant_be_bought 		= false, --true,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 4070,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		-- Nyx 899руб/18,99$
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_S_T3_Pirate",	price_weight = 1.00, },
	},
}

Def.Bundle_Arc_DLC_Ufo1 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Arc_DLC_Ufo1_name",
	uiDesc				= "Bundle_Arc_DLC_Ufo1_desc",
	cant_be_bought 		= false, --true,
	uiPromo 			= "bandle_1",
	premiumPriceTotal 	= 5000,
	default_icon		= "dlcIco",
	hiddenInShop		= true,
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_UFO_L_GUARD_Rank5",	price_weight = 1.00, },
	},
}

Def.Bundle_Secret_Chest_T5 = 
{
	inherit				= "BundleBase",
	price				= 1000000000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Secret_Chest_T5_name",
	uiDesc				= "Bundle_Secret_Chest_T5_desc",
	cant_be_bought 		= false,
	hiddenInShop		= true,
	uiPromo 			= "bandle_22",
	default_icon		= "dlcIco",
	is_rewardable 		= true,

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,str_param = "AlienCompositeAlloy", },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Aliens_ship_part", },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Iridium_monocrystall", },
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 5,     str_param = "Aliens_ship_part",         drop_weight = 1, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 5,     str_param = "Iridium_monocrystall",     drop_weight = 1, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 20,    str_param = "AlienCompositeAlloy",  drop_weight = 1, },
		},
	},
}

-- Day 1-5 chest
Def.Bundle_DailyChest_T1 = 
{
	inherit				= "BundleBase",
	price				= 1000000000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_DailyChest_T1_name",
	uiDesc				= "Bundle_DailyChest_T1_desc",
	cant_be_bought 		= false,
	hiddenInShop		= true,
	uiPromo 			= "bandle_18",
	default_icon		= "dlcIco",
	is_rewardable 		= true,

	random_contents = 
	{
		{
			{ type = ai.BundleContent.EXP,				amount = 5000, 		drop_weight = 0.5,	},
			{ type = ai.BundleContent.EXP,				amount = 20000, 	drop_weight = 0.02,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,			str_param = "DailySynergy25",	drop_weight = 0.8,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,			str_param = "DailySynergy35",	drop_weight = 0.15,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,			str_param = "DailyCredits25",	drop_weight = 0.8,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,			str_param = "DailyCredits35",	drop_weight = 0.15,	},
		},
	},
}

--сундук на офер на 5 ранге (бустер офер)
Def.Bundle_StarterPack_Offer_T3_chest_real = 
{
	inherit				= "BundleBase",
	premiumPrice		=  3000,
	storeItemId			=  Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_StarterPack_Offer_T3_chest_name",
	uiDesc				= "Bundle_StarterPack_Offer_T3_chest_desc",
	--cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "bandle_42_sml_offer",
	uiPromo 			= "bandle_42",
	required_account_aura	= "Bundle_StarterPack_Offer_T3_chest",

		ui_content = --иконки
	{
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Railgun_Basic_T2_Epic",			is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Railgun_Sniper_T2_Epic",		is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldRestoreMedium_T3_Epic",	is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RepairDrones_m_T3_Epic",		is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_Standart_T2_Prem",		is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Plasmagun_Sniper_T2_Epic",		is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Basic_T3_Epic",			is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldRestoreSmall_T3_Epic",	is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RepairDrones_s_T3_Epic",		is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_AAMKin_T2_Prem",			is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Plasmagun_Basic_T3_Epic",		is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Economic_T2_Epic",		is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldRestoreLarge_T3_Epic",	is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RepairDrones_l_T3_Epic",		is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_Cruise_T2_Prem",			is_elite = true, },
		},		
	},
	
		random_contents = --рандомный дроп (но фиксированый для этого ящика)
	{
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Railgun_Basic_T2_Epic",			drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Railgun_Sniper_T2_Epic",		drop_weight = 1, },
		},
		{	
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldRestoreMedium_T3_Epic",	drop_weight = 1, },
		},
		{		
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RepairDrones_m_T3_Epic",		drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_Standart_T2_Prem",		drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Plasmagun_Sniper_T2_Epic",		drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Basic_T3_Epic",			drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldRestoreSmall_T3_Epic",	drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RepairDrones_s_T3_Epic",		drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_AAMKin_T2_Prem",			drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Plasmagun_Basic_T3_Epic",		drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Economic_T2_Epic",		drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldRestoreLarge_T3_Epic",	drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RepairDrones_l_T3_Epic",		drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_Cruise_T2_Prem",			drop_weight = 1, },
		},
	},

}

--сундук на офер на 8 ранге (бустер офер)
Def.Bundle_Rank8_BoosterPack_Offer_T3_chest_real = 
{
	inherit				= "BundleBase",
	premiumPrice		=  5000,
	storeItemId			=  Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_StarterPack_Offer_T3_chest_name",
	uiDesc				= "Bundle_StarterPack_Offer_T3_chest_desc",
	--cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "bandle_44_sml_offer",
	uiPromo 			= "bandle_44",
	required_account_aura	= "Bundle_Rank8_BoosterPack_Offer_T3_chest",

		ui_content = --иконки
	{
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Plasmagun_Autofire_T3_Epic",			is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Economic_T3_Epic",				is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Heavy_T3_Epic",					is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Railgun_Sniper_T3_Epic",				is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Sniper_T3_Epic",					is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_T3_Epic",						is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldVampire_T4_Epic",					is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldHavoc_T3_Epic",					is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_SniperFastShot_T3_Epic",				is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_AchillesTargetingUnit_T4_Epic",			is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_Eagleeye_T4_Epic",						is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RemoteRepairDrones_T4_Epic",			is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_StasisGenerator_T3_Epic",				is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_GuidedDron_T3_Epic",					is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_MissileDefenceType1_T3_Epic",			is_elite = true, },	
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_Standart_T3_Prem",				is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_AAMKin_T3_Prem",					is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_Cruise_T3_Prem",					is_elite = true, },			
		},		
	},
	
		random_contents = --рандомный дроп (но фиксированый для этого ящика)
	{
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Plasmagun_Autofire_T3_Epic",			drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Economic_T3_Epic",				drop_weight = 1, },
		},
		{	
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Heavy_T3_Epic",					drop_weight = 1, },
		},
		{		
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Railgun_Sniper_T3_Epic",				drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Laser_Sniper_T3_Epic",					drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_T3_Epic",						drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_Standart_T3_Prem",				drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_AAMKin_T3_Prem",					drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "SpaceMissile_Cruise_T3_Prem",					drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldVampire_T4_Epic",					drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_ShieldHavoc_T3_Epic",					drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_SniperFastShot_T3_Epic",				drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_AchillesTargetingUnit_T4_Epic",			drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_Eagleeye_T4_Epic",						drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RemoteRepairDrones_T4_Epic",			drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_StasisGenerator_T3_Epic",				drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_GuidedDron_T3_Epic",					drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_MissileDefenceType1_T3_Epic",			drop_weight = 1, },
		},		
	},

}

--сундук на офер на 8 ранге (эсминец офер)
Def.Bundle_Rank8_SupressorPack_Offer_T3_chest_real = 
{
	inherit				= "BundleBase",
	premiumPrice		=  5000,
	storeItemId			=  Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Rank8_SupressorPack_Offer_T3_chest_name",
	uiDesc				= "Bundle_Rank8_SupressorPack_Offer_T3_chest_desc",
	--cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "bandle_43_sml_offer",
	uiPromo 			= "bandle_43",
	required_account_aura	= "Bundle_Rank8_SupressorPack_Offer_T3_chest",

		ui_content = --иконки
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_destr",	is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_TachRay_T3_Epic",				is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RocketSilo_T3_Epic",			is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_LaserBlaster_T3_Epic",			is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_RailgunDestr_T3_Epic",			is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "WeaponMod_LaserUp1_Basic_T3_Prem",		is_elite = true, },
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "WeaponMod_RailUp1_Basic_T3_Prem",		is_elite = true, },			
		},		
	},
	
		random_contents = --рандомный дроп (но фиксированый для этого ящика)
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_destr",	drop_weight = 1, },
		},	
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_TachRay_T3_Epic",				drop_weight = 1, },
		},
		{	
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Module_RocketSilo_T3_Epic",			drop_weight = 1, },
		},
		{		
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_LaserBlaster_T3_Epic",			drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_RailgunDestr_T3_Epic",			drop_weight = 1, },
		},	
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "WeaponMod_LaserUp1_Basic_T3_Prem",		drop_weight = 1, },
		},
		{			
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "WeaponMod_RailUp1_Basic_T3_Prem",		drop_weight = 1, },
		},
	},
}
--[[
Def.Bundle_GreenScoutNodes_T2_StarterPack = 
{
	inherit				= "BundleBase",
	price				= 50000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GreenScoutNodes_T2_StarterPack_name",
	uiDesc				= "Bundle_GreenScoutNodes_T2_StarterPack_desc",
	--cant_be_bought 		= false,
	--hiddenInShop		= true,
	uiPromo 			= "bandle_49",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_GreenScoutNodes_T2_StarterPack_Discount",	
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "green_tree_activator_Rare", is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_1", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_2", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_3", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_4", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_5", 	}, 
		},
	},
	
	random_contents = 
		
	{
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_1", drop_weight = 1,}, }, 
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_2", drop_weight = 1,}, }, 
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_3", drop_weight = 1,}, }, 
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_4", drop_weight = 1,}, },  
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "green_tree_activator_5", drop_weight = 1,}, },  
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "green_tree_activator_Rare", drop_weight = 1,}, }, 
	},
}
]]
Def.Bundle_GreenScoutCabine_T2 = 
{
	inherit				= "BundleBase",
	tokenPrice			= 200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GreenScoutCabine_T2_name",
	uiDesc				= "Bundle_GreenScoutCabine_T2_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "Bundle_GreenScoutCabine",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_GreenScoutCabine_T2_Discount",	
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "FormPattern_Alien_Scout", is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Internal_Equipment_ScoutCabine", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Control_Interface_ScoutCabine", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lightweight_Plates_ScoutCabine", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lifesupporting_System_ScoutCabine", 	}, 
		},
	},
	
	random_contents = 
		
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Internal_Equipment_ScoutCabine", drop_weight = 1, }, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Control_Interface_ScoutCabine", drop_weight = 1, }, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lightweight_Plates_ScoutCabine", drop_weight = 1, },  
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lifesupporting_System_ScoutCabine", drop_weight = 1, },  
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "FormPattern_Alien_Scout", drop_weight = 0.7, },  
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Internal_Equipment_ScoutCabine", drop_weight = 1, }, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Control_Interface_ScoutCabine", drop_weight = 1, }, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lightweight_Plates_ScoutCabine", drop_weight = 1, },  
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lifesupporting_System_ScoutCabine", drop_weight = 1, },  
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "FormPattern_Alien_Scout", drop_weight = 0.7, },  
		},
	},
}

Def.Bundle_GreenScoutCabine_T3 = 
{
	inherit				= "BundleBase",
	price				= 50000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GreenScoutCabine_T3_name",
	uiDesc				= "Bundle_GreenScoutCabine_T3_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "Bundle_GreenScoutCabine",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_GreenScoutCabine_T3_Discount",	
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "FormPattern_Alien_Scout", is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Internal_Equipment_ScoutCabine", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Control_Interface_ScoutCabine", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lightweight_Plates_ScoutCabine", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lifesupporting_System_ScoutCabine", 	}, 
		},
	},
	
	random_contents = 
		
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Internal_Equipment_ScoutCabine", drop_weight = 1,}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Control_Interface_ScoutCabine", drop_weight = 1,}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lightweight_Plates_ScoutCabine", drop_weight = 1,},  
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lifesupporting_System_ScoutCabine", drop_weight = 1,},  
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "FormPattern_Alien_Scout", drop_weight = 1,},  
		},
	},
}

Def.Bundle_GreenScoutCabine_T3_GS = 
{
	inherit				= "BundleBase",
	premiumPrice		= 300,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GreenScoutCabine_T3_GS_name",
	uiDesc				= "Bundle_GreenScoutCabine_T3_GS_desc",
	cant_be_bought 		= true,
	--hiddenInShop		= true,
	uiPromo 			= "Bundle_GreenScoutCabine",
	default_icon		= "dlcIco",
	--required_account_aura	= "Bundle_GreenScoutCabine_T3_Discount",	
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "FormPattern_Alien_Scout", is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Internal_Equipment_ScoutCabine", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Control_Interface_ScoutCabine", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lightweight_Plates_ScoutCabine", 	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lifesupporting_System_ScoutCabine", 	}, 
		},
	},
	
	random_contents = 
		
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Internal_Equipment_ScoutCabine", drop_weight = 1, }, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Control_Interface_ScoutCabine", drop_weight = 1, }, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lightweight_Plates_ScoutCabine", drop_weight = 1, },  
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Lifesupporting_System_ScoutCabine", drop_weight = 1, },  
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "FormPattern_Alien_Scout", drop_weight = 0.7, }, 
		},
	},
}

Def.Bundle_RailVolcano_T2 = 
{
	inherit				= "BundleBase",
	price				= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_RailVolcano_T2_name",
	uiDesc				= "Bundle_RailVolcano_T2_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_RailVolcano_T2_Active",	
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T2_Mk1", is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "RailVolcano_charger", 	}, 
		},
	},
	
	random_contents = 
		
	{
		{	{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T2_Mk1", drop_weight = 1, }, },
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "RailVolcano_charger", drop_weight = 1, }, },
	},
}

Def.Bundle_RailVolcano_T3 = 
{
	inherit				= "BundleBase",
	price				= 300000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_RailVolcano_T3_name",
	uiDesc				= "Bundle_RailVolcano_T3_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_RailVolcano_T3_Active",	
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T3_Mk1", is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "RailVolcano_charger", 	}, 
		},
	},
	
	random_contents = 
		
	{
		{	{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T3_Mk1", drop_weight = 1, }, },
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "RailVolcano_charger", drop_weight = 1, }, },
	},
}

Def.Bundle_RailVolcano_T4 = 
{
	inherit				= "BundleBase",
	price				= 500000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_RailVolcano_T4_name",
	uiDesc				= "Bundle_RailVolcano_T4_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_RailVolcano_T4_Active",	
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T4_Mk1", is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "RailVolcano_charger", 	}, 
		},
	},
	
	random_contents = 
		
	{
		{	{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T4_Mk1", drop_weight = 1, }, },
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "RailVolcano_charger", drop_weight = 1, }, },
	},
}

Def.Bundle_RailVolcano_T5 = 
{
	inherit				= "BundleBase",
	price				= 900000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_RailVolcano_T5_name",
	uiDesc				= "Bundle_RailVolcano_T5_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_RailVolcano_T5_Active",	
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T5_Mk1", is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "RailVolcano_charger", 	}, 
		},
	},
	
	random_contents = 
		
	{
		{	{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T5_Mk1", drop_weight = 1, }, },
		{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "RailVolcano_charger", drop_weight = 1, }, },
	},
}

Def.Bundle_Iridium_ScrapAttractor_T3 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 200,
    storeItemId             = Bundles_GetNextStoreItemId(),
    uiName                  = "Bundle_Iridium_ScrapAttractor_T3_name",
    uiDesc                  = "Bundle_IridiumDrop_desc",
    cant_be_bought          = false,
    --hiddenInShop            = true,
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_ScrapAttractor_T3_Discount",

    ui_content =
    {
        {
            { type = ai.BundleContent.BLUEPRINT , amount = 1, str_param = "BP_Weapon_ScrapAttractor_T3_Mk1", is_elite = true,  },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T3_barrel",  },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T3_charger",  },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T3_barrel", drop_weight=0.4, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T3_charger", drop_weight=0.4, },
            { type = ai.BundleContent.BLUEPRINT , amount = 1, str_param = "BP_Weapon_ScrapAttractor_T3_Mk1", drop_weight=0.2, },
        },
    },
}

--
Def.Bundle_Iridium_ScrapAttractor_T4 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 200,
    storeItemId             = Bundles_GetNextStoreItemId(),
    uiName                  = "Bundle_Iridium_ScrapAttractor_T4_name",
    uiDesc                  = "Bundle_IridiumDrop_desc",
    cant_be_bought          = false,
    --hiddenInShop            = true,
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_ScrapAttractor_T4_Discount",

    ui_content =
    {
        {
            { type = ai.BundleContent.BLUEPRINT , amount = 1, str_param = "BP_Weapon_ScrapAttractor_T4_Mk1", is_elite = true,  },
			{ type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T4_barrel",  },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T4_charger",  },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T4_barrel", drop_weight=0.4, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T4_charger", drop_weight=0.4, },
            { type = ai.BundleContent.BLUEPRINT , amount = 1, str_param = "BP_Weapon_ScrapAttractor_T4_Mk1", drop_weight=0.2, },
        },
    },
}

--
Def.Bundle_Iridium_ScrapAttractor_T5 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 200,
    storeItemId             = Bundles_GetNextStoreItemId(),
    uiName                  = "Bundle_Iridium_ScrapAttractor_T5_name",
    uiDesc                  = "Bundle_IridiumDrop_desc",
    cant_be_bought          = false,
    --hiddenInShop            = true,
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_ScrapAttractor_T5_Discount",

    ui_content =
    {
        {
            { type = ai.BundleContent.BLUEPRINT , amount = 1, str_param = "BP_Weapon_ScrapAttractor_T5_Mk1", is_elite = true,  },
			{ type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T5_barrel",  },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T5_charger",  },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T5_barrel", drop_weight=0.4, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ScrapAttractor_T5_charger", drop_weight=0.4, },
            { type = ai.BundleContent.BLUEPRINT , amount = 1, str_param = "BP_Weapon_ScrapAttractor_T5_Mk1", drop_weight=0.2, },
        },
    },
}

Def.Bundle_PalomMKII_details = 
{
	inherit				= "BundleBase",
	price				= 120000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_PalomMKII_details_name",
	uiDesc				= "Bundle_PalomMKII_details_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_26",
	default_icon		= "dlcIco",
	required_account_aura	= "Palom_new_player",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Iridium_monocrystall", is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Explosion"			},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Pure_silicon"		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Iridium_plate"		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Tungsten_plate"	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Processor_block"	},
		},
	},
	
	random_contents =
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE , amount = 10, str_param = "Iridium_monocrystall", drop_weight=1, 	},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE , amount = 10, str_param = "Explosion", drop_weight=1, 			},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE , amount = 10, str_param = "Pure_silicon", drop_weight=1, 			},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE , amount = 10, str_param = "Iridium_plate", drop_weight=1, 		},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE , amount = 10, str_param = "Tungsten_plate", drop_weight=1,		},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE , amount = 10, str_param = "Processor_block", drop_weight=1, 		},
		},
	},
}

Def.Bundle_Sai_Build = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Sai_Build_T3_name",
	uiDesc				= "Bundle_Sai_Build_T3_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_26",
	premiumPriceTotal 	= 1500,
	default_icon		= "dlcIco",
	required_account_aura = "Rank_9_builds_Sai",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ProtonWall_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EmergencyBarrier_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdaptiveForceField_T4_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RotationThruster_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FakeShips_T4_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WideScanner_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyDrone_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Autofire_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ArmorPlates_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRestoreSmall_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Shift_T3_Mk3", int_param = 1, },
		},
	},
	
	random_contents = 
	{
		{
				{ type = ai.BundleContent.EXP,	amount = 500, 		drop_weight = 30,	},
				{ type = ai.BundleContent.EXP,	amount = 10000, 	drop_weight = 10,	},
				{ type = ai.BundleContent.EXP,	amount = 100000, 	drop_weight = 5,	},
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ProtonWall_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EmergencyBarrier_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdaptiveForceField_T4_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RotationThruster_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FakeShips_T4_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WideScanner_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyDrone_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Autofire_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ArmorPlates_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRestoreSmall_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Shift_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
	},
}

Def.Bundle_Styx_Build = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Styx_Build_T3_name",
	uiDesc				= "Bundle_Styx_Build_T3_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_26",
	premiumPriceTotal 	= 1500,
	default_icon		= "dlcIco",
	required_account_aura = "Rank_9_builds_Styx",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RepairRay_l_T4_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RotationThruster_T3_Mk3", int_param = 1,  },
		    { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_CompositeArmor_T4_Mk3", int_param = 1,  },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WideScanner_T3_Mk3", int_param = 1,   },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ExtCapacitorBattary_T3_Mk3", int_param = 1,  },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CuttedShieldHolder_T4_Mk3", int_param = 1,  },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldEmitter_T3_Mk3", int_param = 1,  },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdaptiveArmorBoost_T3_Mk3", int_param = 1,   },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RemoteRepairDrones_T3_Mk3", int_param = 1,   },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_HeavyArmor_T3_Mk3", int_param = 1,  },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Nanobots_Cloud_T4_Mk3", int_param = 1,  },
		},
	},
	
	random_contents = 
	{
		{
			{ type = ai.BundleContent.EXP,	amount = 500, 		drop_weight = 30,	},
			{ type = ai.BundleContent.EXP,	amount = 10000, 	drop_weight = 10,	},
			{ type = ai.BundleContent.EXP,	amount = 100000, 	drop_weight = 5,	},
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RepairRay_l_T4_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RotationThruster_T3_Mk3", int_param = 1,  drop_weight = 1, },
		},
		{
		    { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_CompositeArmor_T4_Mk3", int_param = 1,  drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WideScanner_T3_Mk3", int_param = 1,   drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ExtCapacitorBattary_T3_Mk3", int_param = 1,  drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CuttedShieldHolder_T4_Mk3", int_param = 1,  drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldEmitter_T3_Mk3", int_param = 1,  drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdaptiveArmorBoost_T3_Mk3", int_param = 1,   drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RemoteRepairDrones_T3_Mk3", int_param = 1,   drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_HeavyArmor_T3_Mk3", int_param = 1,  drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Nanobots_Cloud_T4_Mk3", int_param = 1,  drop_weight = 1, },
		},
	},
}

Def.Bundle_Parallax_Build = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Parallax_Build_T3_name",
	uiDesc				= "Bundle_Parallax_Build_T3_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_26",
	premiumPriceTotal 	= 1500,
	default_icon		= "dlcIco",
	required_account_aura = "Rank_9_builds_Parallax",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ProtonWall_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EmergencyBarrier_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdaptiveForceField_T4_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BoostBan_T4_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RotationThruster_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Heavy_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_GuidedDron_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_AutoRepairUnit_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RepairDrones_m_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRestoreMedium_T3_Mk3", int_param = 1, },
		},
	},
	
	random_contents = 
	{
		{
			{ type = ai.BundleContent.EXP,	amount = 500, 		drop_weight = 30,	},
			{ type = ai.BundleContent.EXP,	amount = 10000, 	drop_weight = 10,	},
			{ type = ai.BundleContent.EXP,	amount = 100000, 	drop_weight = 5,	},
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ProtonWall_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EmergencyBarrier_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdaptiveForceField_T4_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BoostBan_T4_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RotationThruster_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Heavy_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_GuidedDron_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_AutoRepairUnit_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RepairDrones_m_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRestoreMedium_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
	},
}

Def.Bundle_NukemI_Build = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NukemI_Build_T3_name",
	uiDesc				= "Bundle_NukemI_Build_T3_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_26",
	premiumPriceTotal 	= 1500,
	default_icon		= "dlcIco",
	required_account_aura = "Rank_9_builds_NukemI",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EmergencyBarrier_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Invulnerability_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RotationThruster_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_CompositeArmor_T4_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WideScanner_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Laser_Heavy_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RepairDrones_m_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_HeavyArmor_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Afterburner_T3_Mk3", int_param = 1, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Eagleeye_T3_Mk3", int_param = 1, },
		},
	},
	
	random_contents = 
	{
		{
			{ type = ai.BundleContent.EXP,	amount = 500, 		drop_weight = 30,	},
			{ type = ai.BundleContent.EXP,	amount = 10000, 	drop_weight = 10,	},
			{ type = ai.BundleContent.EXP,	amount = 100000, 	drop_weight = 5,	},
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EmergencyBarrier_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Invulnerability_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RotationThruster_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_CompositeArmor_T4_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WideScanner_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Laser_Heavy_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RepairDrones_m_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_HeavyArmor_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Afterburner_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Eagleeye_T3_Mk3", int_param = 1, drop_weight = 1, },
		},
	},
}

-- Оффер для 7го ранга, модули с синергией
Def.Rank_9_builds_auras = 
{
	inherit				= "BundleBase",
	price				= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Rank_9_builds_auras_name",
	uiDesc				= "Rank_9_builds_auras_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
	required_account_aura = "Rank_9_builds_All",
	
	random_contents = 
	{
		{
			{ price_weight = 0.0 },
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Rank_9_builds_Sai",	drop_weight = 1, }
		},
		{
			{ price_weight = 0.0 },
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Rank_9_builds_Styx",	drop_weight = 1, }
		},
		{
			{ price_weight = 0.0 },
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Rank_9_builds_Parallax",	drop_weight = 1, }
		},
		{
			{ price_weight = 0.0 },
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Rank_9_builds_NukemI",	drop_weight = 1, }
		},
	},
}

-- Бандл награда за покупку золота
Def.Bundle_Chest_Gold_Reward = 
{
	inherit				= "BundleBase",
	premiumPrice		= 100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Chest_Gold_Reward_name",
	uiDesc				= "Bundle_Chest_Gold_Reward_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	uiPromo 			= "bandle_11",
	premiumPriceTotal 	= 100,
	default_icon		= "dlcIco",
	is_rewardable 		= true,
	
	random_contents = 
	{
		{
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_AchillesTargetingUnit_T5_Craft", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Afterburner_T5_Craft", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_AchillesTargetingUnit_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_CommandWeaknessAnalyzer_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_CoolantSystemIdle_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_DestrBeamDrone_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_DestrDeadlyTrap_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_DestrMovementRestrictor_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_Eagleeye_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_EnergyReflector_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_GravityAnomaly_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_IonRay_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_IsotopeHarvester_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_Javelin_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_MissileDefenceType1_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_PushRay_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_RocketSilo_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_ShieldEmitter_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_ShieldHealOnEnemyDeath_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_Shift_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_SniperOverload_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_TargetPainter_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Module_Teleporter_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_ModulePassive_EnemyResistReductor_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_ModulePassive_GreenArmorFocusResist_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_ReverseThruster_T5", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_ShieldEmitter_T5_Craft", int_param = 1, drop_weight = 0.05, },
		},
		{
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Cold_Ray_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_CrystallSparks_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_DestrResonatingLaser_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Fly_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_ForkLaser_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_GreenGravityAnomaly_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_KineticFloatingCrit_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Laser_Basic_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Laser_Economic_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Laser_Heavy_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Laser_Sniper_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_LaserBlaster_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Minigun_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Nanobots_Cloud_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Phaser_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_PlasmaBlade_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Plasmagun_Autofire_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Plasmagun_Basic_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Plasmagun_Heavy_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Plasmagun_Sniper_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Radiation_Beam_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Railgun_Autofire_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Railgun_Basic_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Railgun_Heavy_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Railgun_Sniper_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_RailgunDestr_T5_Mk1", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_SmartRL_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_Sparks_Cannon_T5_Rel", int_param = 1, drop_weight = 0.05, },
			{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_SuppressingFire_T5_Rel", int_param = 1, drop_weight = 0.05, },
		},
	},
}


Def.Bundle_Resource_Chest_T1 =
{
    inherit             = "BundleBase",
    price               = 2000000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_Resource_Chest_T1_name",
    uiDesc              = "Bundle_Resource_Chest_T1_desc",
    cant_be_bought      = false,
    uiPromo             = "bandle_6",
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Crystal_shard", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Osmium_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Silicon_wafer", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Tungsten_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Impure_iridium", },
        },
    },

    random_contents =
    {
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Crystal_shard", drop_weight = 1, }, },
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Osmium_ore", drop_weight = 1, }, },
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Silicon_wafer", drop_weight = 1, }, },
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Tungsten_ore", drop_weight = 1, }, },
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "ow_Impure_iridium", drop_weight = 1, }, },
    },
}

Def.Bundle_LevelUp_T5 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 50000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_LevelUp_T5_name",
	uiDesc				= "Bundle_LevelUp_T5_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_11",
	required_account_aura	= "Bundle_LevelUp_T5_Discount",

	ui_content = 
	{
		{	
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_hull",	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_cpu",	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_activator",	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_hull",	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_cpu",	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_activator",	},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_capacitor",},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_shield",},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_cpu",},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_engine",},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_armor",},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,str_param = "Iridium_monocrystall",},
		},
	},

	random_contents = 
		{
			{
				{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_hull",	drop_weight = 1.0,	},
				{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_cpu",	drop_weight = 1.0,	},
				{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_activator",	drop_weight = 1.0,	},
				{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_hull",	drop_weight = 1.0,	},
				{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_cpu",	drop_weight = 1.0,	},
				{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_activator",	drop_weight = 1.0,	},
			},
			{
				{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,str_param = "Iridium_monocrystall",	drop_weight = 1, },
			},
			{
				{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_capacitor",	drop_weight = 1.0,	},
				{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_shield",	drop_weight = 1.0,	},
				{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_cpu",	drop_weight = 1.0,	},
				{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_engine",	drop_weight = 1.0,	},
				{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_armor",	drop_weight = 1.0,	},
			},
		},
}

-- New Raid Rewards
Def.Bundle_GreenScoutAbility_v2_1_T5 = 
{
	inherit				= "BundleBase",
	tokenPrice			= 100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GreenScoutAbility_1_T5_name",
	uiDesc				= "Bundle_GreenScoutAbility_1_T5_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bundle_ellidium",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_GreenScoutAbility_v2_1_T5_Active",
		
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "entangled_shards",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "cascade_crystals",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "storage_crystals",		is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "unstable_crystals",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,str_param = "AlienCompositeAlloy",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "Aliens_ship_part",	},

			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Plasma_Alien_Killer",	},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Laser_Alien_Killer",		},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Rail_Alien_Killer",		},

			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Tungsten_plate",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Explosion",		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Iridium_plate",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Computing_chip",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Pure_silicon",		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",		},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "entangled_shards",		drop_weight = 1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "cascade_crystals",		drop_weight = 1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "storage_crystals",		drop_weight = 1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "unstable_crystals",	drop_weight = 1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,str_param = "AlienCompositeAlloy",	drop_weight = 2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2, str_param = "Aliens_ship_part",		drop_weight = 2,	},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Tungsten_plate",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Explosion",						drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Iridium_plate",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Computing_chip",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,	str_param = "Pure_silicon",						drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",					drop_weight = 1.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",					drop_weight = 1.0,	}, 
		},
		{	
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Plasma_Alien_Killer",	drop_weight = 1,	},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Laser_Alien_Killer",		drop_weight = 1,	},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Rail_Alien_Killer",		drop_weight = 1,	},
		},
	},
}

Def.Bundle_GreenScoutAbility_v2_2_T5 = 
{
	inherit				= "BundleBase",
	tokenPrice			= 100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GreenScoutAbility_2_T5_name",
	uiDesc				= "Bundle_GreenScoutAbility_2_T5_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bundle_ellidium",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_GreenScoutAbility_v2_2_T5_Active",
		
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 30,	str_param = "AlienCompositeAlloy", 	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "AlienCompositeAlloy", 	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 30,	str_param = "Aliens_ship_part",		is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",		is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "Aliens_ship_part",		is_elite = true,	},

			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Plasma_Alien_Killer",	},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Laser_Alien_Killer",		},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Rail_Alien_Killer",		},

			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Tungsten_plate",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Explosion",		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Iridium_plate",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Computing_chip",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Pure_silicon",		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "Processor_block",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "Screened_battery",		},
		},
	},
	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 30,	str_param = "AlienCompositeAlloy",		drop_weight = 0.5,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "AlienCompositeAlloy",		drop_weight = 1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 30,	str_param = "Aliens_ship_part",			drop_weight = 0.25,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",			drop_weight = 3,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "Aliens_ship_part",			drop_weight = 4,	},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Tungsten_plate",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Explosion",						drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Iridium_plate",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Computing_chip",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Pure_silicon",						drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "Processor_block",					drop_weight = 1.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "Screened_battery",					drop_weight = 1.0,	}, 
		},
		{	
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Plasma_Alien_Killer",	drop_weight = 1,	},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Laser_Alien_Killer",		drop_weight = 1,	},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Rail_Alien_Killer",		drop_weight = 1,	},
		},
	},
}

Def.Bundle_GreenScoutAbility_v2_3_T5 = 
{
	inherit				= "BundleBase",
	tokenPrice			= 100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GreenScoutAbility_3_T5_name",
	uiDesc				= "Bundle_GreenScoutAbility_3_T5_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bundle_ellidium",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_GreenScoutAbility_v2_3_T5_Active",
		
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "RailVolcano_charger", 				is_elite = true,},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10, str_param = "Iridium_monocrystall",			is_elite = true,},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5, str_param = "Iridium_monocrystall",				is_elite = true,},
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1, str_param = "BP_Weapon_RailVolcano_T2_Mk1",},
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T3_Mk1",},
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1, str_param = "BP_Weapon_RailVolcano_T4_Mk1",},
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T5_Mk1",},

			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Plasma_Alien_Killer",	},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Laser_Alien_Killer",		},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Rail_Alien_Killer",		},

			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Tungsten_plate",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Explosion",		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Iridium_plate",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Computing_chip",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Pure_silicon",		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Processor_block",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Screened_battery",	},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "RailVolcano_charger", 	drop_weight = 1, 	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,str_param = "Iridium_monocrystall",	drop_weight = 0.25,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,str_param = "Iridium_monocrystall",	drop_weight = 7,	},
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T4_Mk1", drop_weight = 0.1, },
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T5_Mk1", drop_weight = 0.1, },
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T2_Mk1", drop_weight = 0.1, },
			{ type = ai.BundleContent.BLUEPRINT,		amount = 1,	str_param = "BP_Weapon_RailVolcano_T3_Mk1", drop_weight = 0.1, },
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Tungsten_plate",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Explosion",						drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Iridium_plate",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Computing_chip",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 15,	str_param = "Pure_silicon",						drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Processor_block",					drop_weight = 1.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Screened_battery",					drop_weight = 1.0,	}, 
		},
		{	
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Plasma_Alien_Killer",	drop_weight = 0.5,	},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Laser_Alien_Killer",		drop_weight = 0.5,	},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Rail_Alien_Killer",		drop_weight = 0.5,	},
		},
	},
}

-- PremShips Event Bundles
--
Def.Bundle_Xeno_KingDvergr_Race1_S_T1 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 300,
    uiName          = "Bundle_Xeno_KingDvergr_Race1_S_T1_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T1_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T1_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Siegfried_Race1_L_T1 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 300,
    uiName          = "Bundle_Xeno_Siegfried_Race1_L_T1_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T1_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T1_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Scout_Race1_S_T2 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 450,
    uiName          = "Bundle_Xeno_Scout_Race1_S_T2_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T2_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T2_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Kalah_Race1_M_T2 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 450,
    uiName          = "Bundle_Xeno_Kalah_Race1_M_T2_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    --cant_be_bought  = true,
	hiddenInShop	= true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T2_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T2_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Trooper_Race1_L_T2 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 450,
    uiName          = "Bundle_Xeno_Trooper_Race1_L_T2_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T2_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T2_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Deimon_Race1_S_T3 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 610,
    uiName          = "Bundle_Xeno_Deimon_Race1_S_T3_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T3_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T3_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_NukemI_Race1_M_T3 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 610,
    uiName          = "Bundle_Xeno_NukemI_Race1_M_T3_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T3_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T3_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Sigurdr_Race1_L_T3 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 610,
    uiName          = "Bundle_Xeno_Sigurdr_Race1_L_T3_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T3_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T3_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Leonina_Race1_S_T4 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1240,
    uiName          = "Bundle_Xeno_Leonina_Race1_S_T4_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    --cant_be_bought  = true,
	hiddenInShop	= true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T4_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T4_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Orelus_Race1_M_T4 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1240,
    uiName          = "Bundle_Xeno_Orelus_Race1_M_T4_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T4_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T4_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Atlas_Race1_L_T4 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1240,
    uiName          = "Bundle_Xeno_Atlas_Race1_L_T4_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T4_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T4_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Berserker_Race1_S_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_Berserker_Race1_S_T5_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T5_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T5_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Spark_Race1_M_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_Spark_Race1_M_T5_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T5_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T5_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_BlackDragon_Race1_L_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_BlackDragon_Race1_L_T5_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T5_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T5_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_BlackDeath_Race2_S_T1 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 300,
    uiName          = "Bundle_Xeno_BlackDeath_Race2_S_T1_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T1_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T1_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_BlackHort_Race2_M_T1 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 300,
    uiName          = "Bundle_Xeno_BlackHort_Race2_M_T1_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T1_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T1_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Talon_Race2_S_T2 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 450,
    uiName          = "Bundle_Xeno_Talon_Race2_S_T2_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T2_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T2_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Neuron_Race2_M_T2 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 450,
    uiName          = "Bundle_Xeno_Neuron_Race2_M_T2_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T2_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T2_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_CrusQ_Race2_L_T2 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 450,
    uiName          = "Bundle_Xeno_CrusQ_Race2_L_T2_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_L_T2_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_L_T2_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Spirit_Race2_S_T3 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 610,
    uiName          = "Bundle_Xeno_Spirit_Race2_S_T3_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T3_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T3_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Strong_Race2_M_T3 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 610,
    uiName          = "Bundle_Xeno_Strong_Race2_M_T3_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T3_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T3_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_CrusA_Race2_L_T3 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 610,
    uiName          = "Bundle_Xeno_CrusA_Race2_L_T3_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_L_T3_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_L_T3_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_KevlarHa_Race2_S_T4 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1240,
    uiName          = "Bundle_Xeno_KevlarHa_Race2_S_T4_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T4_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T4_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Flamberge_Race2_M_T4 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1240,
    uiName          = "Bundle_Xeno_Flamberge_Race2_M_T4_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T4_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T4_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Scimitar_Race2_L_T4 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1240,
    uiName          = "Bundle_Xeno_Scimitar_Race2_L_T4_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_L_T4_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_L_T4_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Excalibur_Race2_M_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_Excalibur_Race2_M_T5_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    --cant_be_bought  = true,
	hiddenInShop	= true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T5_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T5_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Patriarch_Race2_L_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_Patriarch_Race2_L_T5_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_L_T5_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_L_T5_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_TigerM15A3_Race3_M_T1 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 300,
    uiName          = "Bundle_Xeno_TigerM15A3_Race3_M_T1_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    --cant_be_bought  = true,
	hiddenInShop	= true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T1_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T1_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_RaptorM2_Race3_L_T1 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 300,
    uiName          = "Bundle_Xeno_RaptorM2_Race3_L_T1_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T1_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T1_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_BladeofAressa_Race3_S_T2 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 450,
    uiName          = "Bundle_Xeno_BladeofAressa_Race3_S_T2_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T2_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T2_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Rhino_Race3_M_T2 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 450,
    uiName          = "Bundle_Xeno_Rhino_Race3_M_T2_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T2_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T2_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Honor_Race3_L_T2 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 450,
    uiName          = "Bundle_Xeno_Honor_Race3_L_T2_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T2_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T2_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_EagleB_Race3_S_T3 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 610,
    uiName          = "Bundle_Xeno_EagleB_Race3_S_T3_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
   -- cant_be_bought  = true,
	hiddenInShop	= true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T3_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T3_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Parallax_Race3_M_T3 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 610,
    uiName          = "Bundle_Xeno_Parallax_Race3_M_T3_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T3_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T3_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Valor_Race3_L_T3 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 610,
    uiName          = "Bundle_Xeno_Valor_Race3_L_T3_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T3_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T3_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Konkistador_Race3_S_T4 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1240,
    uiName          = "Bundle_Xeno_Konkistador_Race3_S_T4_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T4_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T4_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Panther_Race3_M_T4 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1240,
    uiName          = "Bundle_Xeno_Panther_Race3_M_T4_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T4_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T4_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Polus_Race3_L_T4 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1240,
    uiName          = "Bundle_Xeno_Polus_Race3_L_T4_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T4_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T4_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_GoldenEagle_Race3_S_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_GoldenEagle_Race3_S_T5_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T5_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T5_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Rockwell_Race3_M_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_Rockwell_Race3_M_T5_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T5_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_M_T5_Premium", price_weight = 1, }, },
}

--
Def.Bundle_Xeno_Mammoth_Race3_L_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_Mammoth_Race3_L_T5_name",
    uiDesc          = "Bundle_Xeno_PremiumShips_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_46",
    default_icon    = "dlcIco",
    ui_content      = { { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T5_Premium", }, }, },
    fixed_contents  = { { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T5_Premium", price_weight = 1, }, },
}

-- Special Ships Token Bundles
--
Def.Bundle_Tokens_Gargoyle_T4 = 
{
	inherit				= "BundleBase",
	tokenPrice			= 100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Tokens_Gargoyle_T4_name",
	uiDesc				= "Bundle_Tokens_SpecialShips_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_Tokens_Gargoyle_T4_Active",
		
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_activator",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_cpu",	},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_hull",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_cpu",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_activator",	drop_weight = 1.0,	},
		},
	},
}

--
Def.Bundle_Tokens_Dart_T4 = 
{
	inherit				= "BundleBase",
	tokenPrice			= 100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Tokens_Dart_T4_name",
	uiDesc				= "Bundle_Tokens_SpecialShips_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bandle_45",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_Tokens_Dart_T4_Active",
		
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_activator",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_cpu",	},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_hull",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_cpu",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_activator",	drop_weight = 1.0,	},
		},
	},
}

--
Def.Bundle_Tokens_Spiral_T4 = 
{
	inherit				= "BundleBase",
	tokenPrice			= 200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Tokens_Spiral_T4_name",
	uiDesc				= "Bundle_Tokens_SpecialShips_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bandle_50",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_Tokens_Spiral_T4_Active",
		
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_activator",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_cpu",	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_Weapon_OverheatingLaser_T4_Mk1", },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "OverheatingLaser_barrel",	},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_hull",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_cpu",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_activator",	drop_weight = 0.5,	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_Weapon_OverheatingLaser_T4_Mk1", drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "OverheatingLaser_barrel",	drop_weight = 1.0,	},
		},
	},
}

--
Def.Bundle_Tokens_Shuttle_T4 = 
{
	inherit				= "BundleBase",
	tokenPrice			= 200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Tokens_Shuttle_T4_name",
	uiDesc				= "Bundle_Tokens_SpecialShips_desc",
	--cant_be_bought 	= false,
	--hiddenInShop		= true,
	uiPromo 			= "bandle_51",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_Tokens_Shuttle_T4_Active",
		
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_activator",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_cpu",	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_Weapon_AcceleratedAmplifyer_T4_Mk1", },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "AcceleratedAmplifyer_barrel",	},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_hull",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_cpu",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_activator",	drop_weight = 0.5,	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_Weapon_AcceleratedAmplifyer_T4_Mk1", drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "AcceleratedAmplifyer_barrel",	drop_weight = 1.0,	},
		},
	},
}

Def.Bundle_Spiral_Parts_Fixed =
{
    inherit             = "BundleBase",
    premiumPrice        = 9500,
    premiumPriceTotal   = 9500,
    cant_be_bought      = true,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_Spiral_Parts_Fixed_name",
    uiDesc              = "Bundle_Spiral_Parts_Fixed_desc",
    uiPromo             = "bandle_50",
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_spiral_activator", is_elite = true, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_spiral_hull", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_spiral_cpu", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "OverheatingLaser_barrel", },
            { type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_OverheatingLaser_T4_Mk1", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_spiral_hull" },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_spiral_cpu" },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_spiral_activator" },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "OverheatingLaser_barrel" },
        { type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_OverheatingLaser_T4_Mk1" },
    },
}

Def.Bundle_Shuttle_Parts_Fixed =
{
    inherit             = "BundleBase",
    premiumPrice        = 9500,
    premiumPriceTotal   = 9500,
    cant_be_bought      = true,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_Shuttle_Parts_Fixed_name",
    uiDesc              = "Bundle_Shuttle_Parts_Fixed_desc",
    uiPromo             = "bandle_51",
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race3_l_t4_shuttle_activator", is_elite = true,	},
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race3_l_t4_shuttle_hull", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race3_l_t4_shuttle_cpu", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "AcceleratedAmplifyer_barrel", },
            { type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_AcceleratedAmplifyer_T4_Mk1", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race3_l_t4_shuttle_hull" },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race3_l_t4_shuttle_cpu" },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race3_l_t4_shuttle_activator" },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "AcceleratedAmplifyer_barrel" },
        { type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_Weapon_AcceleratedAmplifyer_T4_Mk1" },
    },
}

Def.Bundle_Irridium_Monocrystal_Chest_Shop =
{
    inherit                 = "BundleBase",
    tokenPrice              = 1500,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    uiName                  = "Bundle_Irridium_Monocrystal_Chest_name",
    uiDesc                  = "Bundle_Irridium_Monocrystal_Chest_Shop_desc",
    uiPromo                 = "Bundle_Irridium_Monocrystal_Chest_ico",
    default_icon            = "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "Iridium_monocrystall", is_elite = true, },
        },
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Osmium_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Silicon_wafer", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Tungsten_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Impure_iridium", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Crystal_shard", },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "Iridium_monocrystall", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Osmium_ore", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Silicon_wafer", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Tungsten_ore", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Impure_iridium", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Crystal_shard", },
    },
}

Def.Bundle_Aliens_ship_part_Chest_Shop =
{
    inherit                 = "BundleBase",
    tokenPrice              = 1000,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    uiName                  = "Bundle_Aliens_ship_part_Chest_name",
    uiDesc                  = "Bundle_Aliens_ship_part_Chest_Shop_desc",
    uiPromo                 = "Bundle_Aliens_ship_part_Chest_ico",
    default_icon            = "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "Aliens_ship_part", is_elite = true, },
        },
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Osmium_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Silicon_wafer", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Tungsten_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Impure_iridium", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Crystal_shard", },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "Aliens_ship_part", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Osmium_ore", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Silicon_wafer", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Tungsten_ore", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Impure_iridium", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Crystal_shard", },
    },
}

Def.Bundle_Iridium_Overseer_T3 =
{
    inherit             = "BundleBase",
    price               = 1000000000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    cant_be_bought      = true,
    hiddenInShop        = true,
    hiddenNotification  = true,
    is_rewardable       = true,

    random_contents =
    {
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T3_1_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T3_2_open", drop_weight = 1, },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Daily_Pvp_open", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Daily_Raid_open", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Daily_Pve_open", price_weight = 0.34, },
    },
}

Def.Bundle_Iridium_Overseer_T4 =
{
    inherit             = "BundleBase",
    price               = 1000000000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    cant_be_bought      = true,
    hiddenInShop        = true,
    hiddenNotification  = true,
    is_rewardable       = true,

    random_contents =
    {
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T3_1_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T4_1_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T4_3_open", drop_weight = 1, },
        },
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T3_2_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T4_2_open", drop_weight = 1, },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Daily_Pvp_open", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Daily_Raid_open", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Daily_Pve_open", price_weight = 0.34, },
    },
}

Def.Bundle_Iridium_Overseer_T5 =
{
    inherit             = "BundleBase",
    price               = 1000000000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    cant_be_bought      = true,
    hiddenInShop        = true,
    hiddenNotification  = true,
    is_rewardable       = true,

    random_contents =
    {
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T3_1_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T4_1_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T5_1_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T5_2_open", drop_weight = 1, },
        },
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T4_2_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T5_3_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T5_4_open", drop_weight = 1, },
			{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T3_2_open", drop_weight = 1, },
        },
        {    
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T4_3_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T5_5_open", drop_weight = 1, },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T5_6_open", drop_weight = 1, },
			{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T5_7_open", drop_weight = 1, },
			{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Iridium_Overseer_T5_8_open", drop_weight = 1, },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Daily_Pvp_open", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Daily_Raid_open", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Bundle_Daily_Pve_open", price_weight = 0.34, },
    },
}

Def.Bundle_Iridium_Overseer_T3_1 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 200,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T3_1_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T3_1_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "LaserBlaster_T3_cooler", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "LaserBlaster_T3_resonator", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "RailgunDestr_T3_charger", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "RailgunDestr_T3_barrel", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "RocketSilo_T3_rotor", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "LaserBlaster_T3_cooler", drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "LaserBlaster_T3_resonator", drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "RailgunDestr_T3_charger", drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "RailgunDestr_T3_barrel", drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "RocketSilo_T3_rotor", drop_weight = 1.0, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T3_2 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 200,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T3_2_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T3_2_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "RocketSilo_T3_launcher", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "FrontLineCannon_T3_barrel", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "FrontLineCannon_T3_charger", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "Teleporter_T3_projector", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "Teleporter_T3_stabilizer", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "RocketSilo_T3_launcher", drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "FrontLineCannon_T3_barrel", drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "FrontLineCannon_T3_charger", drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "Teleporter_T3_projector", drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "Teleporter_T3_stabilizer", drop_weight = 1.0, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T4_1 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 300,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T4_1_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T4_1_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "GravityAnomaly_T4_matterconverter", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "GravityAnomaly_T4_lens", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Teleporter_T4_stabilizer", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Teleporter_T4_projector", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Javelin_T4_shell", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "GravityAnomaly_T4_matterconverter", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "GravityAnomaly_T4_lens", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Teleporter_T4_stabilizer", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Teleporter_T4_projector", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Javelin_T4_shell", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T4_2 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 300,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T4_2_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T4_2_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Javelin_T4_projector" },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "LaserBlaster_T4_resonator" },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "LaserBlaster_T4_cooler" },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketSilo_T4_rotor" },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketSilo_T4_launcher" },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Javelin_T4_projector", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "LaserBlaster_T4_resonator", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "LaserBlaster_T4_cooler", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketSilo_T4_rotor", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketSilo_T4_launcher", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T4_3 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 300,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T4_3_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T4_3_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RailgunDestr_T4_barrel" },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RailgunDestr_T4_charger" },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "FrontLineCannon_T4_barrel" },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "FrontLineCannon_T4_charger" },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RailgunDestr_T4_barrel", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RailgunDestr_T4_charger", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "FrontLineCannon_T4_barrel", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "FrontLineCannon_T4_charger", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T5_1 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 400,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T5_1_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T5_1_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrBeamDrone_cpu", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrBeamDrone_launcher", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrResonatingLaser_impulsesupply", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrResonatingLaser_lens", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "PushRay_T5_emitter", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "PushRay_T5_powersupply", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrBeamDrone_cpu", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrBeamDrone_launcher", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrResonatingLaser_impulsesupply", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrResonatingLaser_lens", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "PushRay_T5_emitter", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "PushRay_T5_powersupply", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T5_2 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 400,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T5_2_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T5_2_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ShieldHealOnEnemyDeath_capacitor", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ShieldHealOnEnemyDeath_device", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Teleporter_T5_projector", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Teleporter_T5_stabilizer", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "CoolantSystemIdle_refrigerant", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "CoolantSystemIdle_grapheneplate", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ShieldHealOnEnemyDeath_capacitor", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "ShieldHealOnEnemyDeath_device", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Teleporter_T5_projector", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Teleporter_T5_stabilizer", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "CoolantSystemIdle_refrigerant", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "CoolantSystemIdle_grapheneplate", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T5_3 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 400,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T5_3_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T5_3_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "MovementRestrictor_emitter", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "MovementRestrictor_capacitor", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrDeadlyTrap_trapstorage", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrDeadlyTrap_launcher", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "GravityAnomaly_T5_matterconverter", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "GravityAnomaly_T5_lens", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "MovementRestrictor_emitter", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "MovementRestrictor_capacitor", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrDeadlyTrap_trapstorage", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "DestrDeadlyTrap_launcher", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "GravityAnomaly_T5_matterconverter", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "GravityAnomaly_T5_lens", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T5_4 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 400,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T5_4_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T5_4_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "EnemyResistReductor_corecpu", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "EnemyResistReductor_scanner", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "IsotopeHarvester_plasmainductor", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "IsotopeHarvester_rotor", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Javelin_T5_shell", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Javelin_T5_projector", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "EnemyResistReductor_corecpu", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "EnemyResistReductor_scanner", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "IsotopeHarvester_plasmainductor", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "IsotopeHarvester_rotor", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Javelin_T5_shell", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "Javelin_T5_projector", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T5_5 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 400,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T5_5_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T5_5_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "KineticFloatingCrit_heattransfer", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "KineticFloatingCrit_barrel", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "LaserBlaster_T5_resonator", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "LaserBlaster_T5_cooler", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RailgunDestr_T5_barrel", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "KineticFloatingCrit_heattransfer", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "KineticFloatingCrit_barrel", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "LaserBlaster_T5_resonator", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "LaserBlaster_T5_cooler", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RailgunDestr_T5_barrel", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T5_6 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 400,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T5_6_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T5_6_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RailgunDestr_T5_charger", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketSilo_T5_rotor", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketSilo_T5_launcher", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "FrontLineCannon_T5_barrel", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "FrontLineCannon_T5_charger", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RailgunDestr_T5_charger", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketSilo_T5_rotor", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketSilo_T5_launcher", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "FrontLineCannon_T5_barrel", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "FrontLineCannon_T5_charger", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T5_7 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 400,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T5_7_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T5_7_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RelicGun_T5_barrel", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RelicGun_T5_charger", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketMine_cpu", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketMine_launcher", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RelicGun_T5_barrel", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RelicGun_T5_charger", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketMine_cpu", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "RocketMine_launcher", drop_weight = 1, },
        },
    },
}

Def.Bundle_Iridium_Overseer_T5_8 =
{
    inherit                 = "BundleBase",
    tokenPrice              = 400,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
    uiName                  = "Bundle_Iridium_Overseer_T5_8_name",
    uiDesc                  = "Bundle_Iridium_Overseer_desc",
    uiPromo                 = "bundle_ellidium",
    default_icon            = "dlcIco",
    required_account_aura   = "Bundle_Iridium_Overseer_T5_8_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "OmegaB_T5_corpus", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "OmegaB_T5_fastening", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "EmperorsRobe_power", },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "EmperorsRobe_circle", },
        },
    },

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "OmegaB_T5_corpus", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "OmegaB_T5_fastening", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "EmperorsRobe_power", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "EmperorsRobe_circle", drop_weight = 1, },
        },
    },
}

Def.Bundle_Daily_Pvp =
{
    inherit               = "BundleBase",
    premiumPrice          = 2500,
    storeItemId           = Bundles_GetNextStoreItemId(),
    cant_be_bought        = true,
    hiddenInShop          = false,
    uiName                = "Bundle_Daily_Pvp_name",
    uiDesc                = "Bundle_Daily_Pvp_desc",
    uiPromo               = "bundle_Daily_Pvp",
    default_icon          = "dlcIco",
    required_account_aura = "Bundle_Daily_Pvp_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Daily_Pvp", },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Daily_Brawl", },
        },
    },
    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Daily_Pvp", price_weight = 0.5, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Daily_Brawl", price_weight = 0.5, },
    },
}

Def.Bundle_Daily_Raid =
{
    inherit               = "BundleBase",
    premiumPrice          = 2500,
    storeItemId           = Bundles_GetNextStoreItemId(),
    cant_be_bought        = true,
    hiddenInShop          = false,
    uiName                = "Bundle_Daily_Raid_name",
    uiDesc                = "Bundle_Daily_Raid_desc",
    uiPromo               = "bundle_Daily_Raid",
    default_icon          = "dlcIco",
    required_account_aura = "Bundle_Daily_Raid_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Raid_Loot", },
        },
    },
    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Raid_Loot", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "RW_Loot", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "RP_Loot", price_weight = 0.34, },
    },
}

Def.Bundle_Daily_Pve =
{
    inherit               = "BundleBase",
    premiumPrice          = 2500,
    storeItemId           = Bundles_GetNextStoreItemId(),
    cant_be_bought        = true,
    hiddenInShop          = false,
    uiName                = "Bundle_Daily_Pve_name",
    uiDesc                = "Bundle_Daily_Pve_desc",
    uiPromo               = "bundle_Daily_Pve",
    default_icon          = "dlcIco",
    required_account_aura = "Bundle_Daily_Pve_open",

    ui_content =
    {
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Daily_Pve", },
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Daily_Coop", },
        },
    },
    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Daily_Pve", price_weight = 0.5, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Daily_Coop", price_weight = 0.5, },
    },
}

-- Бандл созданный в качестве награду за квест, вместо 500 голды
-- SC-112339 Аналог замены вознаграждения за 500 ГС
Def.Bundle_QuestGoldReplacer =
{
    inherit = "BundleBase",
    price = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_QuestGoldReplacer_name",
    uiDesc = "Bundle_QuestGoldReplacer_desc",
    uiPromo = "bundle_ellidium",
    default_icon = "dlcIco",
    required_account_aura = "Bundle_QuestGoldReplacer",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 40, str_param = "Iridium_monocrystall", is_elite = true, },
        },
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Tungsten_plate", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Explosion", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Iridium_plate", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Computing_chip", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Pure_silicon", },
        },
        {
            { type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_LaserUp1_Basic_T5_Prem", },
            { type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_PlasmaUp1_Basic_T5_Prem", },
            { type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_RailUp1_Basic_T5_Prem", },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 40, str_param = "Iridium_monocrystall", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Tungsten_plate", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Explosion", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Iridium_plate", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Computing_chip", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Pure_silicon", },
        { type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_LaserUp1_Basic_T5_Prem" },
        { type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_PlasmaUp1_Basic_T5_Prem" },
        { type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_RailUp1_Basic_T5_Prem" },
    },
}

--сундук за победу в клановой войне #SC-111857
Def.Bundle_ClanWar_Win = 
{
	inherit				= "BundleBase",
	price				=  1000000000,
	storeItemId			=  Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_ClanWar_Win_chest_name",
	uiDesc				= "Bundle_ClanWar_Win_chest_desc",
	uiPromo 			= "bundle_equipment_parts",
	default_icon		= "dlcIco",
	required_account_aura	= "Bundle_ClanWar_Win",

		ui_content = --иконки
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Camouflage_GeometryCamo01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Camouflage_GeometryCamo02", },

			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Signs_01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Signs_02", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Signs_03", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Armor02_2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SC_Logo_on_Shield", },

	        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutBeepHorn", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutEagleSign", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutHorns", },

			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Plasma_Huge_Killer",},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Laser_Huge_Killer",},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Rail_Huge_Killer",},

			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "SpaceMissile_HealParts_T5_Mk3",},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "SpaceMissile_ResistSub_T5_Mk3",},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "SpaceMissile_ChildRockets_T5_Mk3",},
			{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "DestrMunition_AnomalyBot_T5_Mk3",},

			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 10,     str_param = "Aliens_ship_part",},
			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 10,     str_param = "Iridium_monocrystall",},
			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 5,      str_param = "Aliens_ship_part",},
			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 5,      str_param = "Iridium_monocrystall",},

			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_capacitor",},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_shield",},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_cpu",},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_engine",},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_armor",},	

			{ type = ai.BundleContent.AUTOGEN,			amount = 1, str_param = "BALANCED",		int_param = 17},
			{ type = ai.BundleContent.AUTOGEN,			amount = 1, str_param = "SPECIAL",		int_param = 17},
			{ type = ai.BundleContent.AUTOGEN,			amount = 1, str_param = "DOUBLE",		int_param = 17},
		},		
	},
	
		random_contents = --рандомный дроп (но фиксированый для этого ящика)
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Camouflage_GeometryCamo01", 	drop_weight = 40, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Camouflage_GeometryCamo02", 	drop_weight = 20, },
			
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Signs_01", 	drop_weight = 3, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Signs_02", 	drop_weight = 3, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Signs_03", 	drop_weight = 3, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Armor02_2", 	drop_weight = 7, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SC_Logo_on_Shield", 	drop_weight = 70, },

	        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutBeepHorn",			drop_weight = 1, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutEagleSign",			drop_weight = 1, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutHorns",				drop_weight = 1, },

			{ type = ai.BundleContent.ITEM, amount = 10,	str_param = "WeaponMod_Plasma_Huge_Killer",		drop_weight = 30,	},
			{ type = ai.BundleContent.ITEM,	amount = 10,	str_param = "WeaponMod_Laser_Huge_Killer",		drop_weight = 30,	},
			{ type = ai.BundleContent.ITEM,	amount = 10,	str_param = "WeaponMod_Rail_Huge_Killer",		drop_weight = 30,	},

			{ type = ai.BundleContent.ITEM,	amount = 10,	str_param = "SpaceMissile_HealParts_T5_Mk3",		drop_weight = 30,	},
			{ type = ai.BundleContent.ITEM,	amount = 10,	str_param = "SpaceMissile_ResistSub_T5_Mk3",		drop_weight = 30,	},
			{ type = ai.BundleContent.ITEM,	amount = 10,	str_param = "SpaceMissile_ChildRockets_T5_Mk3",		drop_weight = 30,	},
			{ type = ai.BundleContent.ITEM,	amount = 10,	str_param = "DestrMunition_AnomalyBot_T5_Mk3",		drop_weight = 30,	},

			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 10,     str_param = "Aliens_ship_part",    drop_weight = 100, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 10,     str_param = "Iridium_monocrystall",drop_weight = 100, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 5,      str_param = "Aliens_ship_part",    drop_weight = 100, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,   amount = 5,      str_param = "Iridium_monocrystall",drop_weight = 100, },

			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_capacitor",drop_weight = 20,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_shield",	drop_weight = 20,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_cpu",		drop_weight = 20,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_engine",	drop_weight = 20,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "ship_part_craft_armor",	drop_weight = 20,	},
			
			{ type = ai.BundleContent.AUTOGEN,			amount = 1, str_param = "BALANCED",	int_param = 17,	drop_weight = 50,	},
			{ type = ai.BundleContent.AUTOGEN,			amount = 1, str_param = "SPECIAL",	int_param = 17,	drop_weight = 50,	},
			{ type = ai.BundleContent.AUTOGEN,			amount = 1, str_param = "DOUBLE",	int_param = 17,	drop_weight = 50,	},
		},
	},
}

Def.Bundle_TestAutogen =
{
    inherit         = "BundleBase",
    price           = 100,
    storeItemId     = Bundles_GetNextStoreItemId(),
    uiName          = "Bundle_TestAutogen_name",
    uiDesc          = "Bundle_TestAutogen_desc",
    cant_be_bought  = true,
    uiPromo         = "",
    default_icon    = "dlcIco",
    hiddenInShop    = false,

    fixed_contents =
    {
        { type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "COMMON", int_param = 9 },
        { type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "BALANCED", int_param = 9 },
        { type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "SPECIAL", int_param = 9 },
        { type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "DOUBLE", int_param = 9 },
		{ type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "COMMON", int_param = 17 },
        { type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "BALANCED", int_param = 17 },
        { type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "SPECIAL", int_param = 17 },
        { type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "DOUBLE", int_param = 17 },
    },

    ui_content =
    {
        {
            { type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "COMMON", int_param = 9 },
			{ type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "BALANCED", int_param = 9 },
			{ type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "SPECIAL", int_param = 9 },
			{ type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "DOUBLE", int_param = 9 },
        },
    },
}

Def.Bundle_QuestEvent_Birthday2020 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_QuestEvent_Birthday2020_name",
    uiDesc = "Bundle_QuestEvent_Birthday2020_desc",
    uiPromo = "bandle_42_01_04_2017",
    default_icon = "dlcIco",
    required_account_aura = "Bundle_QuestEvent_Birthday2020",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_FleurDeLys01", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_FleurDeLys01", price_weight = 1, },
    },
}


--
Def.Bundle_Xeno_Monocrystals_500 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 500,
    uiName          = "Bundle_Xeno_Monocrystals_name",
    uiDesc          = "Bundle_Xeno_Monocrystals_desc", 
    cant_be_bought  = true,
    uiPromo         = "Bundle_Irridium_Monocrystal_Chest_ico",
    default_icon    = "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 35, str_param = "Iridium_monocrystall", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 35, str_param = "Iridium_monocrystall", },
    },
}


--
Def.Bundle_Xeno_Monocrystals_1000 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1000,
    uiName          = "Bundle_Xeno_Monocrystals_name",
    uiDesc          = "Bundle_Xeno_Monocrystals_desc", 
    cant_be_bought  = true,
    uiPromo         = "Bundle_Irridium_Monocrystal_Chest_ico",
    default_icon    = "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 80, str_param = "Iridium_monocrystall", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 80, str_param = "Iridium_monocrystall", },
    },
}


--
Def.Bundle_Xeno_AliensShipParts_500 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 500,
    uiName          = "Bundle_Xeno_AliensShipParts_name",
    uiDesc          = "Bundle_Xeno_AliensShipParts_desc", 
    cant_be_bought  = true,
    uiPromo         = "Bundle_Aliens_ship_part_Chest_ico",
    default_icon    = "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 40, str_param = "Aliens_ship_part", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 40, str_param = "Aliens_ship_part", },
    },
}


--
Def.Bundle_Xeno_AliensShipParts_1000 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1000,
    uiName          = "Bundle_Xeno_AliensShipParts_name",
    uiDesc          = "Bundle_Xeno_AliensShipParts_desc", 
    cant_be_bought  = true,
    uiPromo         = "Bundle_Aliens_ship_part_Chest_ico",
    default_icon    = "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 100, str_param = "Aliens_ship_part", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 100, str_param = "Aliens_ship_part", },
    },
}


--
Def.Bundle_Xeno_Endeavour = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 180,
    uiName          = "Bundle_Xeno_Endeavour_name",
    uiDesc          = "Bundle_Xeno_Endeavour_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_51",
    default_icon    = "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_activator",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_cpu",	},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_hull",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_cpu",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_activator",	drop_weight = 0.5,	},
		},
	},
}


--
Def.Bundle_Xeno_Spiral = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 180,
    uiName          = "Bundle_Xeno_Spiral_name",
    uiDesc          = "Bundle_Xeno_Spiral_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_50",
    default_icon    = "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_activator",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_cpu",	},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_hull",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_cpu",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_activator",	drop_weight = 0.5,	},
		},
	},
}


--
Def.Bundle_Xeno_Dart = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 165,
    uiName          = "Bundle_Xeno_Dart_name",
    uiDesc          = "Bundle_Xeno_Dart_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_45",
    default_icon    = "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_activator",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_cpu",	},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_hull",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_cpu",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_activator",	drop_weight = 0.5,	},
		},
	},
}


--
Def.Bundle_Xeno_Gargoyle = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 165,
    uiName          = "Bundle_Xeno_Gargoyle_name",
    uiDesc          = "Bundle_Xeno_Gargoyle_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_47",
    default_icon    = "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_activator",	is_elite = true,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_cpu",	},
		},
	},

	random_contents = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_hull",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_cpu",	drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_activator",	drop_weight = 0.5,	},
		},
	},
}

--
Def.Bundle_QuestEvent_StayHome =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_QuestEvent_StayHome_name",
    uiDesc = "Bundle_QuestEvent_StayHome_desc",
    uiPromo = "bandle_30",
    default_icon = "dlcIco",
    required_account_aura = "Bundle_QuestEvent_StayHome",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, amount = 1, int_param = 60 * 60 * 24 },
    },
}


--
Def.Bundle_GoldShips_Monocrystals = 
{
    inherit         		= "BundleBase",
    storeItemId     		= Bundles_GetNextStoreItemId(), 
    premiumPrice    		= 99999999,
    uiName          		= "Bundle_Xeno_Monocrystals_GoldShip_name",
    uiDesc          		= "Bundle_Xeno_Monocrystals_GoldShip_desc", 
	required_account_aura	= "GoldShipForFree",	
    uiPromo         		= "Bundle_Irridium_Monocrystal_Chest_ico",
    default_icon    		= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 120, str_param = "Iridium_monocrystall", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 120, str_param = "Iridium_monocrystall", },
    },
}

--
Def.Bundle_GoldShips_AliensShipParts = 
{
    inherit         		= "BundleBase",
    storeItemId     		= Bundles_GetNextStoreItemId(), 
    premiumPrice    		= 99999999,
    uiName          		= "Bundle_Xeno_AliensShipParts_GoldShip_name",
    uiDesc          		= "Bundle_Xeno_AliensShipParts_GoldShip_desc", 
	required_account_aura	= "GoldShipForFree",	
    uiPromo         		= "Bundle_Aliens_ship_part_Chest_ico",
    default_icon    		= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 150, str_param = "Aliens_ship_part", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 150, str_param = "Aliens_ship_part", },
    },
}

--
Def.Bundle_GoldShips_Monocrystals2 = 
{
    inherit         		= "BundleBase",
    storeItemId     		= Bundles_GetNextStoreItemId(), 
    premiumPrice    		= 99999999,
    uiName          		= "Bundle_Xeno_Monocrystals_GoldShip_name",
    uiDesc          		= "Bundle_Xeno_Monocrystals_GoldShip_desc", 
	required_account_aura	= "GoldShipForFree2",	
    uiPromo         		= "Bundle_Irridium_Monocrystal_Chest_ico",
    default_icon    		= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 120, str_param = "Iridium_monocrystall", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 120, str_param = "Iridium_monocrystall", },
    },
}

--
Def.Bundle_GoldShips_AliensShipParts2 = 
{
    inherit         		= "BundleBase",
    storeItemId     		= Bundles_GetNextStoreItemId(), 
    premiumPrice    		= 99999999,
    uiName          		= "Bundle_Xeno_AliensShipParts_GoldShip_name",
    uiDesc          		= "Bundle_Xeno_AliensShipParts_GoldShip_desc", 
	required_account_aura	= "GoldShipForFree2",	
    uiPromo         		= "Bundle_Aliens_ship_part_Chest_ico",
    default_icon    		= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 150, str_param = "Aliens_ship_part", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 150, str_param = "Aliens_ship_part", },
    },
}

--
Def.Bundle_Xeno_PirateWeapon_PlasmaSniper = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1000,
    uiName          = "Bundle_Xeno_PirateWeapon_PlasmaSniper_name",
    uiDesc          = "Bundle_Xeno_PirateWeapon_PlasmaSniper_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_1",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Sniper_T5_Pirate", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Sniper_T5_Pirate", int_param = 1, },
    },
}


--
Def.Bundle_Xeno_PirateWeapon_RailSniper = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1000,
    uiName          = "Bundle_Xeno_PirateWeapon_RailSniper_name",
    uiDesc          = "Bundle_Xeno_PirateWeapon_RailSniper_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_1",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Sniper_T5_Pirate", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Sniper_T5_Pirate", int_param = 1, },
    },
}


--
Def.Bundle_Xeno_PirateWeapon_RailAuto = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1000,
    uiName          = "Bundle_Xeno_PirateWeapon_RailAuto_name",
    uiDesc          = "Bundle_Xeno_PirateWeapon_RailAuto_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_1",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Autofire_T5_Pirate", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Autofire_T5_Pirate", int_param = 1, },
    },
}


--
Def.Bundle_Xeno_PirateRocket_HealParts = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1200,
    uiName          = "Bundle_Xeno_PirateRocket_HealParts_name",
    uiDesc          = "Bundle_Xeno_PirateRocket_HealParts_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_1",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_SpaceMissile_HealParts_T5_Mk3", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_SpaceMissile_HealParts_T5_Mk3", int_param = 1, },
    },
}


--
Def.Bundle_Xeno_PirateRocket_ResistSub = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1200,
    uiName          = "Bundle_Xeno_PirateRocket_ResistSub_name",
    uiDesc          = "Bundle_Xeno_PirateRocket_ResistSub_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_1",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_SpaceMissile_ResistSub_T5_Mk3", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_SpaceMissile_ResistSub_T5_Mk3", int_param = 1, },
    },
}


--
Def.Bundle_Xeno_PirateRocket_ChildRockets = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1200,
    uiName          = "Bundle_Xeno_PirateRocket_ChildRockets_name",
    uiDesc          = "Bundle_Xeno_PirateRocket_ChildRockets_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_1",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_SpaceMissile_ChildRockets_T5_Mk3", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_SpaceMissile_ChildRockets_T5_Mk3", int_param = 1, },
    },
}


--
Def.Bundle_Xeno_PirateRocket_AnomalyBot = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1400,
    uiName          = "Bundle_Xeno_PirateRocket_AnomalyBot_name",
    uiDesc          = "Bundle_Xeno_PirateRocket_AnomalyBot_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_1",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_DestrMunition_AnomalyBot_T5_Mk3", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_DestrMunition_AnomalyBot_T5_Mk3", int_param = 1, },
    },
}


--
Def.Bundle_Xeno_GoldModule_Scanner_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_GoldModule_Scanner_T5_name",
    uiDesc          = "Bundle_Xeno_GoldModule_Scanner_T5_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_11",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpaceScan_T5_Prem", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpaceScan_T5_Prem", int_param = 1, },
    },
}


--
Def.Bundle_Xeno_GoldModule_Hull_T5 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1800,
    uiName          = "Bundle_Xeno_GoldModule_Hull_T5_name",
    uiDesc          = "Bundle_Xeno_GoldModule_Hull_T5_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_11",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ExtendedHull_T5", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ExtendedHull_T5", int_param = 1, },
    },
}

--
Def.Bundle_Metallic_Blue = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    premiumPrice	= 15000,
	premiumPriceTotal = 15000,
    uiName          = "Bundle_Metallic_Blue_name",
    uiDesc          = "Bundle_Metallic_Paint_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_21",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue3", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue",				price_weight = 0.33, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue2",				price_weight = 0.33, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue3",				price_weight = 0.34, },
    },
}

--
Def.Bundle_Metallic_YellowGreen = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    premiumPrice	= 20000,
	premiumPriceTotal = 20000,
    uiName          = "Bundle_Metallic_YellowGreen_name",
    uiDesc          = "Bundle_Metallic_Paint_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_21",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Green", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Yellow", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Khaki", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Orange", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Green",				price_weight = 0.25, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Yellow",				price_weight = 0.25, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Khaki",				price_weight = 0.25, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Orange",				price_weight = 0.25, },
    },
}

--
Def.Bundle_Metallic_Pink = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    premiumPrice	= 25000,
	premiumPriceTotal = 25000,
    uiName          = "Bundle_Metallic_Pink_name",
    uiDesc          = "Bundle_Metallic_Paint_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_21",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Lavender", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Lilac", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Pink", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Pink2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Red", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Lavender",			price_weight = 0.20, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Lilac",				price_weight = 0.20, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Pink",				price_weight = 0.20, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Pink2",				price_weight = 0.20, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Red",				price_weight = 0.20, },
    },
}

Def.Bundle_Metallic_PinkBlueYellowGreen = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    premiumPrice	= 45000,
	premiumPriceTotal = 45000,
    uiName          = "Bundle_Metallic_PinkBlueYellowGreen_name",
    uiDesc          = "Bundle_Metallic_Paint_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_21",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Lavender", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Lilac", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Pink", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Pink2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Red", },
		},
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Green", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Yellow", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Khaki", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Orange", },
        },
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue3", },
		},
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Lavender",			price_weight = 0.09, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Lilac",				price_weight = 0.09, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Pink",				price_weight = 0.09, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Pink2",				price_weight = 0.09, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Red",				price_weight = 0.08, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue",				price_weight = 0.08, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue2",				price_weight = 0.08, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Blue3",				price_weight = 0.08, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Green",				price_weight = 0.08, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Yellow",				price_weight = 0.08, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Khaki",				price_weight = 0.08, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Matt_Metallic_Orange",				price_weight = 0.08, },
		
    },
}

--
Def.Bundle_SpaceExplorerKit = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    premiumPrice	= 20000,
	premiumPriceTotal = 20000,
    uiName          = "Bundle_SpaceExplorerKit_name",
    uiDesc          = "Bundle_SpaceExplorerKit_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_11",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpaceScan_T5_Prem", int_param = 1, is_elite = true, },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ExtendedHull_T5", int_param = 1, is_elite = true, },
			{ type = ai.BundleContent.AUTOGEN, amount = 3, str_param = "DOUBLE", int_param = 17 },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 100, str_param = "Aliens_ship_part", },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 100, str_param = "Iridium_monocrystall", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpaceScan_T5_Prem", int_param = 1, },
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_ExtendedHull_T5", int_param = 1, },
		{ type = ai.BundleContent.AUTOGEN, amount = 3, str_param = "DOUBLE", int_param = 17},
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 100, str_param = "Aliens_ship_part", },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 100, str_param = "Iridium_monocrystall", },
    },
}

--
Def.Bundle_YoungEngineer = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    premiumPrice	= 8000,
	premiumPriceTotal = 8000,
    uiName          = "Bundle_YoungEngineer_name",
    uiDesc          = "Bundle_YoungEngineer_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_22",
	default_icon	= "dlcIco",
	
    ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,		str_param = "ship_part_craft_shield",	drop_weight = 1.0, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,		str_param = "ship_part_craft_capacitor",	drop_weight = 1.0, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,		str_param = "ship_part_craft_engine",	drop_weight = 1.0, },
		},
	},
	fixed_contents = 
	{
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,		str_param = "ship_part_craft_shield",	drop_weight = 1.0, },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,		str_param = "ship_part_craft_capacitor",	drop_weight = 1.0, },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 3,		str_param = "ship_part_craft_engine",	drop_weight = 1.0, },
	},
}

--
Def.Bundle_NeurosurgeonKit = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    premiumPrice	= 4000,
	premiumPriceTotal = 4000,
    uiName          = "Bundle_NeurosurgeonKit_name",
    uiDesc          = "Bundle_NeurosurgeonKit_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_42_1",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1, str_param = "resource_zeta_final_1", },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1, str_param = "resource_zeta_final_2", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1, str_param = "resource_zeta_final_1", },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1, str_param = "resource_zeta_final_2", },
    },
}

--
Def.Bundle_WinterPaintKit = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    premiumPrice	= 20000,
	premiumPriceTotal = 20000,
    uiName          = "Bundle_WinterPaintKit_name",
    uiDesc          = "Bundle_WinterPaintKit_desc", 
    cant_be_bought  = true,
	uiPromo 		= "bandle_19",
	default_icon	= "dlcIco",
	
    ui_content = 
    {
        {
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "SteamWinterSale_IceCrystal", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "SteamWinterSale_Snow02", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Ice_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "IceCrystalBlack", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Gzhel", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "SteamWinterSale_Snow_l", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "SteamWinterSale_IceCrystal",			price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "SteamWinterSale_Snow_l",				price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "SteamWinterSale_Snow02",				price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Ice_1",				price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "IceCrystalBlack",		price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Gzhel",				price_weight = 0.20, },
    },
}

local bp_aura = "BattlePass_AditionalCell_SUM2026"

--
Def.Bundle_BattlePass_AditionalCell_Resource_Chest =
{
    inherit                 = "BundleBase",
    eventPrice    			= 100,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
	hiddenInShop            = false,
	cant_be_bonus			= true,
    uiName                  = "Bundle_BattlePass_AditionalCell_Resource_Chest_name",
    uiDesc                  = "Bundle_BattlePass_AditionalCell_Resource_Chest_desc",
    uiPromo                 = "bandle_6",
    default_icon            = "dlcIco",
    required_account_aura   = bp_aura,

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Crystal_shard", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Osmium_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Silicon_wafer", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Tungsten_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Impure_iridium", },
        },
    },
    fixed_contents =
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Crystal_shard", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Osmium_ore", 	 },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Silicon_wafer", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Tungsten_ore",  },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 50, str_param = "ow_Impure_iridium", }, 
    },
}

Def.Bundle_BattlePass_AditionalCell_Monocrystall =
{
    inherit                 = "BundleBase",
    eventPrice    			= 100,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
	cant_be_bonus			= true,
    uiName                  = "Bundle_BattlePass_AditionalCell_Monocrystall_name",
    uiDesc                  = "Bundle_BattlePass_AditionalCell_Monocrystall_desc",
    uiPromo                 = "Bundle_Irridium_Monocrystal_Chest_ico",
    default_icon            = "dlcIco",
    required_account_aura   = bp_aura,

    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Iridium_monocrystall" },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Iridium_monocrystall", },
    },
}

Def.Bundle_BattlePass_AditionalCell_Xenocrystal =
{
    inherit                 = "BundleBase",
    eventPrice    			= 100,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
	cant_be_bonus			= true,
    uiName                  = "Bundle_BattlePass_AditionalCell_Xenocrystal_name",
    uiDesc                  = "Bundle_BattlePass_AditionalCell_Xenocrystal_desc",
    uiPromo                 = "Bundle_Aliens_ship_part_Chest_ico",
    default_icon            = "dlcIco",
    required_account_aura   = bp_aura,

    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1000, str_param = "Aliens_ship_part" },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1000, str_param = "Aliens_ship_part", },
    },
}

Def.Bundle_BattlePass_AditionalCell_Exp =
{
    inherit                 = "BundleBase",
    eventPrice    			= 100,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
	cant_be_bonus			= true,
    uiName                  = "Bundle_BattlePass_AditionalCell_Exp_name",
    uiDesc                  = "Bundle_BattlePass_AditionalCell_Exp_desc",
    uiPromo                 = "bandle_17",
    default_icon            = "dlcIco",
    required_account_aura   = bp_aura,

    ui_content = 
    {
        {
            { type = ai.BundleContent.EXP,	amount = 2500000, },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.EXP,	amount = 2500000, },
    },
}

Def.Bundle_BattlePass_AditionalCell_Cred =
{
    inherit                 = "BundleBase",
    eventPrice    			= 100,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
	cant_be_bonus			= true,
    uiName                  = "Bundle_BattlePass_AditionalCell_Cred_name",
    uiDesc                  = "Bundle_BattlePass_AditionalCell_Cred_desc",
    uiPromo                 = "bandle_11",
    default_icon            = "dlcIco",
    required_account_aura   = bp_aura,

    ui_content = 
    {
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePass_AditionalCell_CredBoost", },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePass_AditionalCell_CredBoost", price_weight = 1, },
    },
}

Def.Bundle_BattlePass_AditionalCell_WeaponMod =
{
    inherit                 = "BundleBase",
    eventPrice    			= 100,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = false,
    hiddenInShop            = false,
	cant_be_bonus			= true,
    uiName                  = "Bundle_BattlePass_AditionalCell_WeaponMod_name",
    uiDesc                  = "Bundle_BattlePass_AditionalCell_WeaponMod_desc",
    uiPromo                 = "bandle_11",
    default_icon            = "dlcIco",
    required_account_aura   = bp_aura,

    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 100, str_param = "WeaponMod_BattlePass_part", },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 100, str_param = "WeaponMod_BattlePass_part",},
    },
}

Def.Bundle_BattlePass_AditionalCell_Treasure =
{
    inherit                 = "BundleBase",
    eventPrice    			= 50,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = true, -- Скрыто из-за ввода сундука с картами сокровищ. Перед возвращением нужно увеличить кол-во ресурсов, непопулярный сундук получился
	--cant_be_bonus			= true,
    uiName                  = "Bundle_BattlePass_AditionalCell_Treasure_name",
    uiDesc                  = "Bundle_BattlePass_AditionalCell_Treasure_desc",
    uiPromo                 = "bandle_6",
    default_icon            = "dlcIco",
    required_account_aura   = bp_aura,

    random_contents =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "TreasurePice", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "TreasurePice", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "TreasurePice", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 2, str_param = "TreasurePice_Fake", drop_weight = 1, },
            { type = ai.BundleContent.CRAFT_RESOURCE , amount = 1, str_param = "TreasurePice_Fake", drop_weight = 1, },
        },
    },
}

Def.Bundle_FootballTrophys22 =
{
    inherit                 = "BundleBase",
    premiumPrice    		= 99999999,
    storeItemId             = Bundles_GetNextStoreItemId(),
    uiName                  = "Bundle_FootballTrophys21_name",
    uiDesc                  = "Bundle_FootballTrophys21_desc",
    uiPromo                 = "bandle_11",
    default_icon            = "dlcIco",
    required_account_aura   = "FootballTrophys22",

    ui_content = 
    {
        {
            { type = ai.BundleContent.AVATAR, 			amount = 1, str_param = "Avatar_149", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Trophy_Decor_25", },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.AVATAR, 			amount = 1, str_param = "Avatar_149", 		price_weight = 0.5, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Trophy_Decor_25",	price_weight = 0.5, },
    },
}

-- ##########################################################################################
-- #	SC-115819 Освежить экономику корпораций, добавить сундуков за много ирридиума.		#
-- ##########################################################################################

local corp_cant_be_bonus = false

--
Def.Bundle_CorpEconomy_1_01 =
{
    inherit                 = "BundleBase",
    tokenPrice    			= 75,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
	hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
    uiName                  = "Bundle_CorpEconomy_1_01_name",
    uiDesc                  = "Bundle_CorpEconomy_1_01_desc",
    uiPromo                 = "bandle_42_1",
    default_icon            = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Crystal_shard", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Osmium_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Silicon_wafer", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Tungsten_ore", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Impure_iridium", },
        },
    },
    fixed_contents =
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Crystal_shard", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Osmium_ore", 	 },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Silicon_wafer", },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Tungsten_ore",  },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "ow_Impure_iridium", }, 
    },
}

Def.Bundle_CorpEconomy_1_02 =
{
    inherit                 = "BundleBase",
    tokenPrice    			= 200,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
    uiName                  = "Bundle_CorpEconomy_1_02_name",
    uiDesc                  = "Bundle_CorpEconomy_1_02_desc",
    uiPromo                 = "bandle_42_1",
    default_icon            = "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.EXP,	amount = 25000, },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.EXP,	amount = 25000, },
    },
}

Def.Bundle_CorpEconomy_1_03 =
{
    inherit                 = "BundleBase",
    tokenPrice    			= 200,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
    uiName                  = "Bundle_CorpEconomy_1_03_name",
    uiDesc                  = "Bundle_CorpEconomy_1_03_desc",
    uiPromo                 = "bandle_42_1",
    default_icon            = "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "Iridium_monocrystall" },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "Iridium_monocrystall", },
    },
}

Def.Bundle_CorpEconomy_1_04 = 
{
	inherit					= "BundleBase",
	tokenPrice 				= 1000,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_1_04_name",
	uiDesc					= "Bundle_CorpEconomy_1_04_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AUTOGEN,	amount = 5, str_param = "DOUBLE", int_param = 17	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "CorpEconomyExp30",	},			
		},
	},		
    fixed_contents =
    {
        { type = ai.BundleContent.AUTOGEN, amount = 5, str_param = "DOUBLE", int_param = 17	},
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "CorpEconomyExp30", 		price_weight = 1, },
    },
}

Def.Bundle_CorpEconomy_1_05 =
{
    inherit					= "BundleBase",
	tokenPrice 				= 600,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_1_05_name",
	uiDesc					= "Bundle_CorpEconomy_1_05_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_06", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_07", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_08", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_09", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_10", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_06", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_07", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_08", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_09", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_10", price_weight = 0.20, },
    },
}

Def.Bundle_CorpEconomy_1_06 =
{
    inherit					= "BundleBase",
	tokenPrice 				= 600,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_1_06_name",
	uiDesc					= "Bundle_CorpEconomy_1_06_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_01", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_02", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_03", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_04", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_05", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_01", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_02", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_03", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_04", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "pirate_logo_sticker_05", price_weight = 0.20, },
    },
}

Def.Bundle_CorpEconomy_1_07  = 
{
	inherit					= "BundleBase",
	tokenPrice 				= 2400,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_1_07_name",
	uiDesc					= "Bundle_CorpEconomy_1_07_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Exotic_Ikebana",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_124",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_JellyPaint_1",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_97",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.EXECUTIONER,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "CorpEconomyCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Exotic_Ikebana",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_124", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Crossout_JellyPaint_1",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_97",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.EXECUTIONER,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "CorpEconomyCredits30", 	price_weight = 0.3, },
    },
}

Def.Bundle_CorpEconomy_1_08  = 
{
	inherit					= "BundleBase",
	tokenPrice 				= 2400,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_1_08_name",
	uiDesc					= "Bundle_CorpEconomy_1_08_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Astronaut",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_125",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Football03_3",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_96",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.GRIM_REAPER,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "CorpEconomyExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Astronaut",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_125", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Crossout_Football03_3", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_96",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.GRIM_REAPER,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "CorpEconomyExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_CorpEconomy_1_09 = 
{
	inherit					= "BundleBase",
	tokenPrice				= 2400,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_1_09_name",
	uiDesc					= "Bundle_CorpEconomy_1_09_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Orange",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Yellow",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Green",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Turquoise",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Lilac",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Orange", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Yellow", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Green", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Turquoise", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Lilac", price_weight = 0.2, },
    },
}

Def.Bundle_CorpEconomy_2_01 =
{
    inherit                 = "BundleBase",
    tokenPrice    			= 150,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
    uiName                  = "Bundle_CorpEconomy_2_01_name",
    uiDesc                  = "Bundle_CorpEconomy_2_01_desc",
    uiPromo                 = "bandle_42_1",
    default_icon            = "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "Aliens_ship_part" },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "Aliens_ship_part", },
    },
}

Def.Bundle_CorpEconomy_2_02 =
{
    inherit                 = "BundleBase",
    tokenPrice    			= 200,
    storeItemId             = Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
    uiName                  = "Bundle_CorpEconomy_2_02_name",
    uiDesc                  = "Bundle_CorpEconomy_2_02_desc",
    uiPromo                 = "bandle_42_1",
    default_icon            = "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "CorpEconomyCredBoost", },
        },
    },
    fixed_contents = 
    {
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "CorpEconomyCredBoost", price_weight = 1, },
    },
}

Def.Bundle_CorpEconomy_2_03 = 
{
	inherit					= "BundleBase",
	tokenPrice 				= 640,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_2_03_name",
	uiDesc					= "Bundle_CorpEconomy_2_03_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AUTOGEN,	amount = 10, str_param = "BALANCED", int_param = 17	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "CorpEconomyExp30",	},			
		},
	},		
    fixed_contents =
    {
        { type = ai.BundleContent.AUTOGEN, amount = 10, str_param = "BALANCED", int_param = 17	},
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "CorpEconomyExp30", 		price_weight = 1, },
    },
}

Def.Bundle_CorpEconomy_2_04 = 
{
	inherit					= "BundleBase",
	tokenPrice 				= 900,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_2_04_name",
	uiDesc					= "Bundle_CorpEconomy_2_04_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AUTOGEN,	amount = 10, str_param = "SPECIAL", int_param = 17	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "CorpEconomyExp30",	},			
		},
	},		
    fixed_contents =
    {
        { type = ai.BundleContent.AUTOGEN, amount = 10, str_param = "SPECIAL", int_param = 17	},
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "CorpEconomyExp30", 		price_weight = 1, },
    },
}

Def.Bundle_CorpEconomy_2_05 =
{
    inherit					= "BundleBase",
	tokenPrice 				= 600,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_2_05_name",
	uiDesc					= "Bundle_CorpEconomy_2_05_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_9", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_8", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_7", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_6", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_5", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_9", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_8", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_7", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_6", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_5", price_weight = 0.20, },
    },
}

Def.Bundle_CorpEconomy_2_06 =
{
    inherit					= "BundleBase",
	tokenPrice 				= 600,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_2_06_name",
	uiDesc					= "Bundle_CorpEconomy_2_06_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_3",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_9", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_10", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_11", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_3", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_2", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_9", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_10", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass3_11", price_weight = 0.20, },
    },
}

Def.Bundle_CorpEconomy_2_07 = 
{
	inherit					= "BundleBase",
	tokenPrice 				= 2400,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_2_07_name",
	uiDesc					= "Bundle_CorpEconomy_2_07_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Antler",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_127",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Football03_2",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_95",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.MADMAN,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "CorpEconomyCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Antler",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_127", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Crossout_Football03_2", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_95",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.MADMAN,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "CorpEconomyCredits30", 	price_weight = 0.3, },
    },
}

Def.Bundle_CorpEconomy_2_08 = 
{
	inherit					= "BundleBase",
	tokenPrice 				= 2400,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_2_08_name",
	uiDesc					= "Bundle_CorpEconomy_2_08_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Blue",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Yellow",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Lilac",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Orange",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Pink",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Blue", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Yellow", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Lilac", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Orange", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Pink", price_weight = 0.2, },
    },
}

Def.Bundle_CorpEconomy_2_09 = 
{
	inherit					= "BundleBase",
	tokenPrice				= 2400,
	storeItemId				= Bundles_GetNextStoreItemId(),
    cant_be_bought          = true,
    hiddenInShop            = false,
	cant_be_bonus			= corp_cant_be_bonus,
	uiName					= "Bundle_CorpEconomy_2_09_name",
	uiDesc					= "Bundle_CorpEconomy_2_09_desc",
	uiPromo 				= "bandle_42_1",
	default_icon			= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Pink",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Green2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Turquoise2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Blue",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Lilac2",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Pink", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Green2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Turquoise2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Blue", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Lilac2", price_weight = 0.2, },
    },
}

Def.Bundle_NewGround_End  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NewGround_End_name",
	uiDesc				= "Bundle_NewGround_End_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	
	required_account_aura   = "NewGround_End",
	
    fixed_contents =
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 * 7 },
		{ type = ai.BundleContent.TITLE, 		amount = 1,	int_param = PlayerTitleId.TRUTHSEEKER, price_weight = 0.25,},
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "LootAttempts15", price_weight = 0.25, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Credits50x15", price_weight = 0.25, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Exp50x15", price_weight = 0.25, },
    },
}

Def.Bundle_BlackRelayRace_01  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_01_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_01",
	
    fixed_contents =
    {
        { type = ai.BundleContent.MOTTO, 			amount = 1, str_param = "Taunt_181",					price_weight = 0.1, },
    },
}

Def.Bundle_BlackRelayRace_02  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_02_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_02",
	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Black_Relay",					price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 23, str_param = "Iridium_plate",		},
    },
}

Def.Bundle_BlackRelayRace_03  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_03_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_03",
	
    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.BLACKRR_2,	price_weight = 0.2, },
    },
}

Def.Bundle_BlackRelayRace_04  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_04_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_04",
	
    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.BLACKRR_3,	price_weight = 0.2, },
    },
}

Def.Bundle_BlackRelayRace_05  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_05_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_05",
	
    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.BLACKRR_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 15, str_param = "AlienCompositeAlloy",	},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 25, str_param = "Processor_block",		},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 35, str_param = "Screened_battery",	},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 50, str_param = "Tungsten_plate",		},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 50, str_param = "Pure_silicon",		},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 50, str_param = "Explosion",			},
    },
}

Def.Bundle_BlackRelayRace_06  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_06_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_06",
	
    fixed_contents =
    {
        { type = ai.BundleContent.MOTTO, 			amount = 1, str_param = "Taunt_182",					price_weight = 0.1, },
    },
}

Def.Bundle_BlackRelayRace_07  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_07_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_07",
	
    fixed_contents =
    {
        { type = ai.BundleContent.MOTTO, 			amount = 1, str_param = "Taunt_180",					price_weight = 0.1, },
    },
}

Def.Bundle_BlackRelayRace_08  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_08_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_08",
	
    fixed_contents =
    {
        { type = ai.BundleContent.MOTTO, 			amount = 1, str_param = "Taunt_183",					price_weight = 0.1, },
    },
}

Def.Bundle_BlackRelayRace_09  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_09_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_09",
	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Black_Relay",					price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 27, str_param = "Iridium_plate",		},
    },
}

Def.Bundle_BlackRelayRace_10  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_10_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_10",
	
    fixed_contents =
    {    
        { type = ai.BundleContent.MOTTO, 			amount = 1, str_param = "Taunt_179",					price_weight = 0.1, },
    },
}

Def.Bundle_BlackRelayRace_11  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BlackRelayRace_name",
	uiDesc				= "Bundle_BlackRelayRace_11_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_BlackRelayRace_11",
	
    fixed_contents =
    {    
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_197", 				price_weight = 0.2, },
    },
}

Def.Bundle_CultisticTitle  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_CultisticTitle",
	uiDesc				= "Bundle_CultisticTitle_desc",
	uiPromo 			= "Bundle_Halloween2018_promo",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "CultisticTitle",
	
    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.HALLOWEEN_CULTIST,	price_weight = 0.2, },
    },
}

Def.Bundle_Haloween22_Witch_Revard  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Haloween22_Witch_Revard",
    uiDesc 				= "Bundle_Haloween22_Witch_Revard_desc",
	uiPromo 			= "Bundle_Halloween2018_promo",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Haloween22_Witch_Revard",
	
	random_contents = 
	{
		{	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_1",		drop_weight = 1, },	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_2",		drop_weight = 1, },	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_3",		drop_weight = 1, },	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_4",		drop_weight = 1, },	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_5",		drop_weight = 1, },
			{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Laser_Huge_Killer", 		drop_weight = 0.01, }, -- Система линз
			{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Plasma_Huge_Killer",		drop_weight = 0.01, }, -- Усиленные заряды
			{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Rail_Huge_Killer",		    drop_weight = 0.01, }, -- Бронебойные снаряды
			{ type = ai.BundleContent.ITEM, amount = 10, str_param = "SpaceMissile_DoomDay_T5",		        drop_weight = 0.01, },	-- Ракета «Апокалипсис»	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "Halloween_01",		drop_weight = 1, }, -- покраска "Котенок или жизнь!". AUT2024 (Halloween); покраска "В стране кошмаров". AUT2025 (Halloween)			

		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Iridium_monocrystall",	drop_weight = 1, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Aliens_ship_part",		drop_weight = 1, },
		},
	},
}

Def.Bundle_Haloween22_Hunter_Revard  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Haloween22_Hunter_Revard",
    uiDesc 				= "Bundle_Haloween22_Hunter_Revard_desc",
	uiPromo 			= "Bundle_Halloween2018_promo",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Haloween22_Hunter_Revard",
	
	random_contents = 
	{
		{	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_1",		drop_weight = 1, },	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_2",		drop_weight = 1, },	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_3",		drop_weight = 1, },	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_4",		drop_weight = 1, },	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "halloween2022_5",		drop_weight = 1, },
			{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Laser_Huge_Killer", 		drop_weight = 0.01, }, -- Система линз 
			{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Plasma_Huge_Killer",		drop_weight = 0.01, }, -- Усиленные заряды
			{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Rail_Huge_Killer",		    drop_weight = 0.01, }, -- Бронебойные снаряды
			{ type = ai.BundleContent.ITEM, amount = 10, str_param = "SpaceMissile_DoomDay_T5",		        drop_weight = 0.01, },	-- Ракета «Апокалипсис»	
			{ type = ai.BundleContent.CUSTOM_ELEMENT,   amount = 1,     str_param = "Halloween_01",		drop_weight = 1, }, -- покраска "Котенок или жизнь!". AUT2024 (Halloween); покраска "В стране кошмаров". AUT2025 (Halloween)				

		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Iridium_monocrystall",	drop_weight = 1, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",		drop_weight = 1, },
		},
	},
}

-- SC-118276 Квест "Эсминец Сострадания" (Rank11). Поддержка новичков. Бережный ввод в Midgame. (Эсминец Империи R-11. Brave)

Def.Bundle_Destroyer_Of_Mercy_Revard  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Destroyer_Of_Mercy_Revard_name",
    uiDesc 				= "Bundle_Destroyer_Of_Mercy_Revard_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "Destroyer_Of_Mercy_Revard",

    ui_content = 
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_H_T4", is_elite = true, }, -- Эсминец Brave
        },	
        {
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailgunDestr_T3_Mk1", }, -- Рельсотрон 7-11
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RocketSilo_T3_Mk1", }, -- Пусковая установка Буря 7-11			
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_GravityAnomaly_T3_Mk1", },	-- Гравитационная линза 7-11
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_TurretPlasma_T3_Mk1", },	-- Плазменная турель 7-11
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Teleporter_T4_Mk1", },	-- Проектор червоточин 10-14			
			--{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Laser_Huge_Killer", }, -- Система линз
			--{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Plasma_Huge_Killer", }, -- Усиленные заряды
			--{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Rail_Huge_Killer", }, -- Бронебойные снаряды
	
        },
--[[ -- Как заготовка блока с рандомными призами. В данном бандое достаточно и орудий/модулей.
        {
            { type = ai.BundleContent.EXP,	amount = 5000, },
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Iridium_monocrystall", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Aliens_ship_part", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "Relics_craft_part", },
			{ type = ai.BundleContent.AUTOGEN,   amount = 1, str_param = "COMMON", int_param = 11, },
        },]]
    },	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race1_H_T4",	price_weight = 0.5, }, -- Эсминец Brave
		{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Weapon_RailgunDestr_T3_Mk1",	price_weight = 0.1, }, -- Рельсотрон 7-11
		{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_RocketSilo_T3_Mk1",	price_weight = 0.1, }, -- Пусковая установка Буря 7-11		
		{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_GravityAnomaly_T3_Mk1",	price_weight = 0.1, }, -- Гравитационная линза 7-11		
		{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_TurretPlasma_T3_Mk1",	price_weight = 0.1, }, -- Плазменная турель 7-11		
		{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_Teleporter_T4_Mk1",	price_weight = 0.1, }, -- Проектор червоточин 10-14		
		--{ type = ai.BundleContent.ITEM,		amount = 10,	str_param = "WeaponMod_Laser_Huge_Killer",	price_weight = 0.25, }, -- Система линз
		--{ type = ai.BundleContent.ITEM,		amount = 10,	str_param = "WeaponMod_Plasma_Huge_Killer",	price_weight = 0.25, }, -- Усиленные заряды
		--{ type = ai.BundleContent.ITEM,		amount = 10,	str_param = "WeaponMod_Rail_Huge_Killer",	price_weight = 0.25, }, -- Бронебойные снаряды

		--{ type = ai.BundleContent.EXP,		amount = 50000,									},
		--{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "MPreset_01",	price_weight = 0.2, },
		--{ type = ai.BundleContent.TITLE,	amount = 1,		int_param = PlayerTitleId.DEVELOPER,	price_weight = 0.1, },
		--{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "Steamer_1",		price_weight = 0.25, },
		--{ type = ai.BundleContent.INVENTORY_EXT,	amount = 1,	int_param = 4,				price_weight = 0.35, },
		--{ type = ai.BundleContent.AUTOGEN,	amount = 1,		str_param = "COMMON",	int_param = 10,	price_weight = 0.2, },	-- str_param - класс автогена из AutogenClass, int_param - ранг модуля
	},
	
--[[	random_contents = -- Как заготовка блока с рандомными призами. В данном бандое достаточно и орудий/модулей. 
	{
		{	
			{ type = ai.BundleContent.EXP, amount = 2500, drop_weight = 1, },	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Iridium_monocrystall",	drop_weight = 1, },
	        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",		drop_weight = 1, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Relics_craft_part",		drop_weight = 1, },
			{ type = ai.BundleContent.AUTOGEN,   amount = 1,     str_param = "COMMON", int_param = 11,	drop_weight = 1, },	-- str_param - класс автогена из AutogenClass, int_param - ранг модуля		
		},

	},]]
}

-- Сундук "Яйцекат 2025" (Поиск яиц динозавров, Ивент на 1 апреля)

Def.Bundle_EggRoller2025  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_EggRoller2025_name",
	uiDesc				= "Bundle_EggRoller2025_desc",
	uiPromo 			= "bandle_41",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_EggRoller2025",
	
    ui_content =
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T1_Dlc", is_elite = true, }, -- Диверсант Федерации Pterosaur (ранг низкий но голдовый)
        },		
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SpikeOnSpeedLaser_T2_Mk1", }, -- Лазер Доплера 2-6 (уникалка для Pterosaur... аналог Spike)
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PlasmaTorpedoGenerator_T2_Mk1", }, -- Ролевой Активный модуль "Торпеда «Сверхнова»"	(как у Федерата 4 ур. "Swift-M")		
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Backstab_T2_Mk1", },	-- Ролевой Активный модуль "Тактический варп" (как у Иерихонца 5 ур. "Dagger V")
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_EggRoller2025", }, -- Наклейка "Яйцекат 2025" DEF 1_april_EggRoller2025
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP10_Stratum_06", }, -- Покраска "Нарядная упаковка"
			
			--{ type = ai.BundleContent.TITLE, amount = 1, int_param = PlayerTitleId.EGGROLLER2025, }, -- Титул "Яйцекат" в 2025 году решили не давать - конфликутует с титуломс "Космическкий Кулинар" идущим с достижением (а для его создания нужен Лящёв..) в общем "без 2го титула" в жтот раз
        },

    },

    fixed_contents = 
    {
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race3_S_T1_Dlc",	price_weight = 0.2, }, -- Диверсант Федерации Pterosaur (ранг низкий но голдовый)
        { type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Weapon_SpikeOnSpeedLaser_T2_Mk1",	price_weight = 0.4, }, -- Лазер Доплера 2-6 (уникалка для Pterosaur... аналог Spike)
		{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_PlasmaTorpedoGenerator_T2_Mk1",	price_weight = 0.1, }, -- Ролевой Активный модуль "Торпеда «Сверхнова»"	(как у Федерата 4 ур. "Swift-M")		
		{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_Backstab_T2_Mk1",	price_weight = 0.1, }, -- Ролевой Активный модуль "Тактический варп" (как у Иерихонца 5 ур. "Dagger V")		
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_EggRoller2025", price_weight = 0.1, }, -- Наклейка "Яйцекат 2025" DEF 1_april_EggRoller2025
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP10_Stratum_06", price_weight = 0.1, }, -- Покраска "Нарядная упаковка"
		--{ type = ai.BundleContent.TITLE, amount = 1, int_param = PlayerTitleId.EGGROLLER2025, price_weight = 0.25, }, -- Титул "Яйцекат" в 2025 году решили не давать - конфликутует с титуломс "Космическкий Кулинар" идущим с достижением (а для его создания нужен Лящёв..) в общем "без 2го титула" в жтот раз
    },
}

-- Сундук "Яйцекат 2026" (Поиск яиц динозавров, Ивент на 1 апреля)

Def.Bundle_EggRoller2026  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_EggRoller2026_name",
	uiDesc				= "Bundle_EggRoller2025_desc",
	uiPromo 			= "bandle_41",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,	
	required_account_aura   = "Bundle_EggRoller2026",
	
    ui_content =
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_S_T1_Dlc", is_elite = true, }, -- Диверсант Федерации Pterosaur (ранг низкий но голдовый)
        },		
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SpikeOnSpeedLaser_T2_Mk1", }, -- Лазер Доплера 2-6 (уникалка для Pterosaur... аналог Spike)
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PlasmaTorpedoGenerator_T2_Mk1", }, -- Ролевой Активный модуль "Торпеда «Сверхнова»"	(как у Федерата 4 ур. "Swift-M")		
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Backstab_T2_Mk1", },	-- Ролевой Активный модуль "Тактический варп" (как у Иерихонца 5 ур. "Dagger V")
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_EggRoller2026", }, -- Наклейка "Яйцекат 2026" DEF 1_april_EggRoller2026
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP10_Stratum_06", }, -- Покраска "Нарядная упаковка"
			
			--{ type = ai.BundleContent.TITLE, amount = 1, int_param = PlayerTitleId.EGGROLLER2025, }, -- Титул "Яйцекат" в 2025 году решили не давать - конфликутует с титуломс "Космическкий Кулинар" идущим с достижением (а для его создания нужен Лящёв..) в общем "без 2го титула" в жтот раз
        },

    },

    fixed_contents = 
    {
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race3_S_T1_Dlc",	price_weight = 0.2, }, -- Диверсант Федерации Pterosaur (ранг низкий но голдовый)
        { type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Weapon_SpikeOnSpeedLaser_T2_Mk1",	price_weight = 0.4, }, -- Лазер Доплера 2-6 (уникалка для Pterosaur... аналог Spike)
		{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_PlasmaTorpedoGenerator_T2_Mk1",	price_weight = 0.1, }, -- Ролевой Активный модуль "Торпеда «Сверхнова»"	(как у Федерата 4 ур. "Swift-M")		
		{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_Backstab_T2_Mk1",	price_weight = 0.1, }, -- Ролевой Активный модуль "Тактический варп" (как у Иерихонца 5 ур. "Dagger V")		
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_EggRoller2026", price_weight = 0.1, }, -- Наклейка "Яйцекат 2026" DEF 1_april_EggRoller2026
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP10_Stratum_06", price_weight = 0.1, }, -- Покраска "Нарядная упаковка"
		--{ type = ai.BundleContent.TITLE, amount = 1, int_param = PlayerTitleId.EGGROLLER2025, price_weight = 0.25, }, -- Титул "Яйцекат" в 2025 году решили не давать - конфликутует с титуломс "Космическкий Кулинар" идущим с достижением (а для его создания нужен Лящёв..) в общем "без 2го титула" в жтот раз
    },
}

-- SC-119563 Бандл с деталями оружия для спираль и эндавора

Def.Bundle_SpEndWeapon_Parts =
{
    inherit             = "BundleBase",
    premiumPrice        = 6000,
    premiumPriceTotal   = 6000,
    cant_be_bought      = true,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_SpEndWeapon_name",
    uiDesc              = "Bundle_SpEndWeapon_desc",
    uiPromo             = "bandle_50",
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.BLUEPRINT,      amount = 1, str_param = "BP_Weapon_OverheatingLaser_T4_Mk1",      },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "OverheatingLaser_barrel",                },
            { type = ai.BundleContent.BLUEPRINT,      amount = 1, str_param = "BP_Weapon_AcceleratedAmplifyer_T4_Mk1",  },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "AcceleratedAmplifyer_barrel",            },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.BLUEPRINT,      amount = 1, str_param = "BP_Weapon_OverheatingLaser_T4_Mk1",      },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "OverheatingLaser_barrel",               },
        { type = ai.BundleContent.BLUEPRINT,      amount = 1, str_param = "BP_Weapon_AcceleratedAmplifyer_T4_Mk1",  },
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "AcceleratedAmplifyer_barrel",           },
    },
}

-- Сундук "Возвращение Предтеч", в SC-118793 Финальный рейд-приключение "Возвращение Предтеч"

Def.Bundle_Rop2025_End  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Rop2025_End_name",
	uiDesc				= "Bundle_Rop2025_End_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	
	required_account_aura   = "NewGround_End",
	
    fixed_contents =
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 * 7 },
		-- { type = ai.BundleContent.TITLE, 		amount = 1,	int_param = PlayerTitleId.TRUTHSEEKER, price_weight = 0.25,},
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "LootAttempts15", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Credits50x15", price_weight = 0.33, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Exp50x15", price_weight = 0.34, },
    },
}

-- SC-119965 Созерцатель + Свидетель Предтеч. Собрать 2 набора/сундука с наградой.

Def.Bundle_Rop2025_Contemplator  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Rop2025_Contemplator_name",
	uiDesc				= "Bundle_Rop2025_Contemplator_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	
	required_account_aura   = "Aura_Rop2025_Contemplator",
	
    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.ROP2025_CONTEMPLATOR,	price_weight = 0.25, },
		--{ type = ai.BundleContent.ITEM,				amount = 1,		str_param = "ow_Light_cell_GS",	price_weight = 0.1, }, -- 1000к серебра
		--{ type = ai.BundleContent.ITEM,				amount = 1,		str_param = "ow_Precursor_Cypher",	price_weight = 0.1, }, --  Шифратор Чужих 60 tokens (иридиум)		
		{ type = ai.BundleContent.ITEM,				amount = 1,		str_param = "WeaponMod_Laser_Huge_Killer",	}, -- Система линз 			
		{ type = ai.BundleContent.ITEM,				amount = 1,		str_param = "WeaponMod_Plasma_Huge_Killer",	}, -- Усиленные заряды			
		{ type = ai.BundleContent.ITEM,				amount = 1,		str_param = "WeaponMod_Rail_Huge_Killer",	}, -- Бронебойные снаряды	
		{ type = ai.BundleContent.ITEM,				amount = 1,		str_param = "SpaceMissile_DoomDay_T5",	}, -- Ракета «Апокалипсис»				
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, 	str_param = "Metallic_01", 	price_weight = 0.25, }, -- Краска «Металлик»
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, 	str_param = "BP13_Matt_Muertos_Gray2", price_weight = 0.25, }, -- Краска «Гранитное молчание»		
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, 	str_param = "BP13_Matt_Muertos_Green1", price_weight = 0.25, }, -- Краска «Потусторонняя бирюза»				
    },
}

Def.Bundle_Rop2025_Witness  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Rop2025_Witness_name",
	uiDesc				= "Bundle_Rop2025_Witness_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	
	required_account_aura   = "Aura_Rop2025_Witness",
	
    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.ROP2025_WITNESS,	price_weight = 0.33,  },
		--{ type = ai.BundleContent.ITEM,				amount = 1,		str_param = "ow_RichReward",	price_weight = 0.1, }, -- -- 3000к серебра
		--{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "ow_Precursor_Cypher",	price_weight = 0.1, }, --  Шифратор Чужих 60 tokens (иридиум) х 10 = 600 Ирисок		
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50,	str_param = "Iridium_monocrystall",	}, -- Монокристаллы
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50,	str_param = "Aliens_ship_part",		}, -- Ксенокристаоллы

		{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Laser_Huge_Killer",	}, -- Система линз 			
		{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Plasma_Huge_Killer",	}, -- Усиленные заряды			
		{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "WeaponMod_Rail_Huge_Killer",	}, -- Бронебойные снаряды	
		{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "SpaceMissile_DoomDay_T5",	}, -- Ракета «Апокалипсис»				
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, 	str_param = "Precursor", price_weight = 0.34,  }, -- Покраска «Вторжение»
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, 	str_param = "Vostok", price_weight = 0.33,  }, -- Декор «Восток»
    },
}

-- SC-119788 Марафон «Квестики-Неделька». Лёгкие квесты для стимулирования ежедневного онлайна. Финальный сундук для «Папкина-Неделька»

Def.Bundle_WeekyKnickers_Revard  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_WeekyKnickers_Revard_name",
    uiDesc 				= "Bundle_WeekyKnickers_Revard_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "WeekyKnickers_Revard",

    ui_content = 
    {
        {
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "SpaceMissile_AnomalyRocket_T5_Mk3", }, -- Аномальная торпеда
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "SpaceMissile_CorrosiveMissile_T5_Mk3", }, -- Ракета с химическим контейнером
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "SpaceMissile_AnomalyBoom_T5_Mk3", },	-- Ракета «Аттрактор»
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "SpaceMissile_HeatMulFire_T5_Mk3", },	-- Ракета «Радиационный туман»
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "SpaceMissile_HealParts_T5_Mk3", },	-- Ремонтные ракеты
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "SpaceMissile_ResistSub_T5_Mk3", }, -- Ослабляющие ракеты
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "SpaceMissile_ChainRockets_T5_Mk3", }, -- Звезда смерти
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 750,	str_param = "Aliens_ship_part", --[[is_elite = true,]] },
			{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "WeekyKnickers_ExpCred20x5", },					
			--{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Rail_Huge_Killer", }, -- Бронебойные снаряды
	
        },
--[[ -- Как заготовка блока с рандомными призами. В данном бандое достаточно и орудий/модулей.
        {
            { type = ai.BundleContent.EXP,	amount = 5000, },
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Iridium_monocrystall", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Aliens_ship_part", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "Relics_craft_part", },
			{ type = ai.BundleContent.AUTOGEN,   amount = 1, str_param = "COMMON", int_param = 11, }, -- str_param - класс автогена из AutogenClass, int_param - ранг модуля
        },]]
    },	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "SpaceMissile_AnomalyRocket_T5_Mk3", }, -- Аномальная торпеда
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "SpaceMissile_CorrosiveMissile_T5_Mk3", }, -- Ракета с химическим контейнером
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "SpaceMissile_AnomalyBoom_T5_Mk3", },	-- Ракета «Аттрактор»
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "SpaceMissile_HeatMulFire_T5_Mk3", },	-- Ракета «Радиационный туман»
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "SpaceMissile_HealParts_T5_Mk3", },	-- Ремонтные ракеты
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "SpaceMissile_ResistSub_T5_Mk3", }, -- Ослабляющие ракеты
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "SpaceMissile_ChainRockets_T5_Mk3", }, -- Звезда смерти 
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 750,	str_param = "Aliens_ship_part", },	
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "WeekyKnickers_ExpCred20x5", price_weight = 1.0, },		
		--{ type = ai.BundleContent.ITEM,		amount = 10,	str_param = "WeaponMod_Rail_Huge_Killer",	price_weight = 0.25, }, -- Бронебойные снаряды
	},
	
--[[	random_contents = -- Как заготовка блока с рандомными призами. В данном бандое достаточно и орудий/модулей. 
	{
		{	
			{ type = ai.BundleContent.EXP, amount = 2500, drop_weight = 1, },	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Iridium_monocrystall",	drop_weight = 1, },
	        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",		drop_weight = 1, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Relics_craft_part",		drop_weight = 1, },
			{ type = ai.BundleContent.AUTOGEN,   amount = 1,     str_param = "COMMON", int_param = 11,	drop_weight = 1, },	-- str_param - класс автогена из AutogenClass, int_param - ранг модуля		
		},

	},]]
} 

-- SC-120022 Баг с уровнями допуска пилота (1>3) . Поддержка новичков. Повышение Retention D1, D7. Сундук для «NewbieAffairs_1»

Def.Bundle_NewbieHarpy_Revard  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NewbieHarpy_Revard_name",
    uiDesc 				= "Bundle_NewbieHarpy_Revard_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "NewbieHarpy_Revard",

	
    ui_content =
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_L_T1", }, -- Фрегат Дальнобойный империи Harpy 
        },
	},	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race1_L_T1",	price_weight = 1, }, -- Фрегат Дальнобойный империи Harpy 
	},
} 

-- SC-120022 Баг с уровнями допуска пилота (1>3) . Поддержка новичков. Повышение Retention D1, D7. Сундук для «NewbieAffairs_2»

Def.Bundle_NewbieKingDvergr_Revard  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NewbieKingDvergr_Revard_name",
    uiDesc 				= "Bundle_NewbieKingDvergr_Revard_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "NewbieKingDvergr_Revard",

	
    ui_content =
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T1_Premium", is_elite = true, }, -- Разведчик Империи King Dvergr (ранг низкий но голдовый)
        },
	},	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race1_S_T1_Premium",	price_weight = 1, }, -- Разведчик Империи King Dvergr (ранг низкий но голдовый)
	},
} 

-- SC-119788 Марафон «Квестики-Неделька». Лёгкие квесты для стимулирования ежедневного онлайна. «Нубова-Неделька»

Def.Bundle_NewbieKnickers_Start  = -- Сундук за выполнение NewbieKnickers_1 + аура-счётчик итогового квеста
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NewbieKnickers_Start_name",
    uiDesc 				= "Bundle_NewbieKnickers_Start_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "NewbieKnickers_Start",

	
    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Marker_01", }, -- Наклейка «Маркер»
			{ type = ai.BundleContent.ITEM, 			amount = 5, str_param = "WeaponMod_RailUp1_Basic_T5_Prem", }, -- Разрывные заряды (премиум) ранги 1-17
			{ type = ai.BundleContent.ITEM, 			amount = 5, str_param = "WeaponMod_PlasmaUp1_Basic_T5_Prem", }, -- Двойной дефлектор (премиум) ранги 1-17
			{ type = ai.BundleContent.ITEM,				amount = 5, str_param = "WeaponMod_LaserUp1_Basic_T3_Prem", }, -- Ксеноновая лампа (премиум) 1-17
			{ type = ai.BundleContent.ITEM, 			amount = 1, str_param = "SpaceMissile_Fireworks_T2_Prize", }, -- Кассета «Искра», ранги 4-6
			{ type = ai.BundleContent.ITEM, 			amount = 1, str_param = "SpaceMissile_Fireworks_T3_Prize", }, -- Кассета «Искра», ранги 7-9
			{ type = ai.BundleContent.ITEM, 			amount = 1, str_param = "SpaceMissile_Fireworks_T4_Prize", }, -- Кассета «Искра», ранги 10-12	
		
        },
	},	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Marker_01", price_weight = 0.1, }, -- Наклейка «Маркер»	
		{ type = ai.BundleContent.ITEM,				amount = 5,	str_param = "WeaponMod_RailUp1_Basic_T5_Prem",	price_weight = 0.15, }, -- Разрывные заряды (премиум) ранги 1-17
		{ type = ai.BundleContent.ITEM,				amount = 5,	str_param = "WeaponMod_PlasmaUp1_Basic_T5_Prem",	price_weight = 0.15, }, -- Двойной дефлектор (премиум) ранги 1-17
		{ type = ai.BundleContent.ITEM,				amount = 5,	str_param = "WeaponMod_LaserUp1_Basic_T3_Prem",	price_weight = 0.15, }, -- Ксеноновая лампа (премиум) 1-17
		{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "SpaceMissile_Fireworks_T2_Prize",	price_weight = 0.15, }, -- Кассета «Искра», ранги 4-6
		{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "SpaceMissile_Fireworks_T3_Prize",	price_weight = 0.10, }, -- Кассета «Искра», ранги 7-9
		{ type = ai.BundleContent.ITEM,				amount = 10,	str_param = "SpaceMissile_Fireworks_T4_Prize",	price_weight = 0.10, }, -- Кассета «Искра», ранги 10-12
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "NewbieKnickers_8Rev", price_weight = 0.10, }, -- Аура, закрывающая квестЫ ЛИНЕЙКИ NewbieKnickers_FIN
		
	},
} 

Def.Bundle_NewbieKnickers_8  = -- Сундук за выполнение NewbieKnickers_8
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NewbieKnickers_8_name",
    uiDesc 				= "Bundle_NewbieKnickers_8_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "NewbieKnickers_8",

	
    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Astronaut", }, -- Декор «Утомленный солнцем»
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Metallic_01", }, -- Краска «Металлик»
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP13_Matt_Muertos_Gray2", }, -- Краска «Гранитное молчание»
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP13_Matt_Muertos_Green1", }, -- Краска «Потусторонняя бирюза»			
			
        },
	},	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Astronaut", price_weight = 0.25, }, -- Декор «Утомленный солнцем»	
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, 	str_param = "Metallic_01", 	price_weight = 0.25, }, -- Краска «Металлик»
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, 	str_param = "BP13_Matt_Muertos_Gray2", price_weight = 0.25, }, -- Краска «Гранитное молчание»		
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, 	str_param = "BP13_Matt_Muertos_Green1", price_weight = 0.25, }, -- Краска «Потусторонняя бирюза»		

	},
} 

Def.Bundle_NewbieKnickers_Revard  = -- ФИНАЛЬНЫЙ сундук «Нубова-Неделька» за выполнение NewbieKnickers_FIN
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NewbieKnickers_Revard_name",
    uiDesc 				= "Bundle_NewbieKnickers_Revard_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "NewbieKnickers_Revard",

	
    ui_content =
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_M_T4_Pirate", is_elite = true, }, -- Заградитель Иерихона Sawtooth (ранг 11, Голдовый)
        },
	},	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race2_M_T4_Pirate",	price_weight = 1, }, -- Заградитель Иерихона Sawtooth (ранг 11, Голдовый)
	},
}

-- SC-120101 Марафон «Четвертак за тридцать». Сезонная линейка квестов для стимулирования ежедневного онлайна. Финальный сундук «30 за 25»

Def.Bundle_A25FOR30_FINALRevard  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_A25FOR30_FINALRevard_name",
    uiDesc 				= "Bundle_A25FOR30_FINALRevard_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "A25FOR30_FINALRevard",

    ui_content = 
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_UFO_L_GUARD_Rank5", }, -- Фрегат прикрытия Уникальный: Object NY18
        },			
        {
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RocketRedirection_T5_Mk1", }, -- Активный модуль «ПРО «Купол»»	Т5
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyNullifier_T5_Mk1", }, -- Активный модуль «Дестабилизатор энергосистем» T5
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PositionSwap_T5_Mk1", }, -- Активный модуль «Механизм передислокации» Т5
            --{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RocketRedirection_T2_Mk1", }, -- Орудие «Плазмоиндуктор»
			
			--{ type = ai.BundleContent.ITEM, amount = 10, str_param = "SpaceMissile_CorrosiveMissile_T5_Mk3", }, -- Ракета с химическим контейнером
			--{ type = ai.BundleContent.ITEM, amount = 10, str_param = "SpaceMissile_AnomalyBoom_T5_Mk3", },	-- Ракета «Аттрактор»
			--{ type = ai.BundleContent.ITEM, amount = 10, str_param = "SpaceMissile_HeatMulFire_T5_Mk3", },	-- Ракета «Радиационный туман»
			--{ type = ai.BundleContent.ITEM, amount = 10, str_param = "WeaponMod_Rail_Huge_Killer", }, -- Бронебойные снаряды
	
        },
--[[ -- Как заготовка блока с рандомными призами. В данном бандое достаточно и орудий/модулей.
        {
            { type = ai.BundleContent.EXP,	amount = 5000, },
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Iridium_monocrystall", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 10, str_param = "Aliens_ship_part", },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 5, str_param = "Relics_craft_part", },
			{ type = ai.BundleContent.AUTOGEN,   amount = 1, str_param = "COMMON", int_param = 11, }, -- str_param - класс автогена из AutogenClass, int_param - ранг модуля
        },]]
    },	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,	amount = 1,	str_param = "Ship_UFO_L_GUARD_Rank5",	price_weight = 0.1, }, -- Фрегат прикрытия Уникальный: Object NY18

        --{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Weapon_SeeressGun_T5_Rel",	price_weight = 0.2, }, -- Орудие «Плазмоиндуктор»      
		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_RocketRedirection_T2_Mk1",	price_weight = 0.08, }, -- Активный модуль «ПРО «Купол»» Т2
		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_RocketRedirection_T3_Mk1",	price_weight = 0.08, }, -- Активный модуль «ПРО «Купол»» Т3	
		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_RocketRedirection_T4_Mk1",	price_weight = 0.08, }, -- Активный модуль «ПРО «Купол»» Т4
        { type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_RocketRedirection_T5_Mk1",	price_weight = 0.08, }, -- Активный модуль «ПРО «Купол»» Т5
        
		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_EnergyNullifier_T2_Mk1",	price_weight = 0.08, }, -- Активный модуль «Дестабилизатор энергосистем» Т2
		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_EnergyNullifier_T3_Mk1",	price_weight = 0.08, }, -- Активный модуль «Дестабилизатор энергосистем» Т3	
		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_EnergyNullifier_T4_Mk1",	price_weight = 0.08, }, -- Активный модуль «Дестабилизатор энергосистем» Т4
        { type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_EnergyNullifier_T5_Mk1",	price_weight = 0.08, }, -- Активный модуль «Дестабилизатор энергосистем» Т5

		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_PositionSwap_T3_Mk1",	price_weight = 0.08, }, -- Активный модуль «Механизм передислокации» Т3	
		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_PositionSwap_T4_Mk1",	price_weight = 0.08, }, -- Активный модуль «Механизм передислокации» Т4
        { type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_PositionSwap_T5_Mk1",	price_weight = 0.1, }, -- Активный модуль «Механизм передислокации»	Т5
		
		--{ type = ai.BundleContent.ITEM,	amount = 10,	str_param = "SpaceMissile_CorrosiveMissile_T5_Mk3", }, -- Ракета с химическим контейнером
		--{ type = ai.BundleContent.ITEM,	amount = 10,	str_param = "SpaceMissile_AnomalyBoom_T5_Mk3", },	-- Ракета «Аттрактор»
		--{ type = ai.BundleContent.ITEM,	amount = 10,	str_param = "SpaceMissile_HeatMulFire_T5_Mk3", },	-- Ракета «Радиационный туман» 
		--{ type = ai.BundleContent.ITEM,		amount = 10,	str_param = "WeaponMod_Rail_Huge_Killer",	price_weight = 0.25, }, -- Бронебойные снаряды
	},
	
--[[	random_contents = -- Как заготовка блока с рандомными призами. В данном бандое достаточно и орудий/модулей. 
	{
		{	
			{ type = ai.BundleContent.EXP, amount = 2500, drop_weight = 1, },	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Iridium_monocrystall",	drop_weight = 1, },
	        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",		drop_weight = 1, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "Relics_craft_part",		drop_weight = 1, },
			{ type = ai.BundleContent.AUTOGEN,   amount = 1,     str_param = "COMMON", int_param = 11,	drop_weight = 1, },	-- str_param - класс автогена из AutogenClass, int_param - ранг модуля		
		},

	},]]
}   

Def.Bundle_A25FOR30_1Rev  = -- Сундук за выполнение A25FOR30_1 + аура-счётчик квеста (по аналогии с Bundle_NewbieKnickers_Start) В ЛЕТНЕМ М1/М2/М3 НЕ УЧАСТВУЕТ (только М4)
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_A25FOR30_1Rev_name",
    uiDesc 				= "Bundle_A25FOR30_1Rev_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "A25FOR30_1Rev",

	
    ui_content =
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T3_PremUniq", is_elite = true, }, -- Премиальный фрегат прикрытия Федерации: Archelon 
            --{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SeeressGun_T5_Rel", }, -- Орудие «Плазмоиндуктор»
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EMPAbsorb_T3_Mk1", }, -- Активный модуль «Генератор пространственных разломов»		
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SeeressEngMod_T5_Epic", },	-- Модифицированный инжектор тетраоксида
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SeeressArmMod_T5_Epic", }, -- Модифицированные улучшенные пилоны»			
        },
	},	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race3_L_T3_PremUniq",	price_weight = 0.45, }, -- Премиальный фрегат прикрытия Федерации: Archelon
        --{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Weapon_SeeressGun_T5_Rel",	price_weight = 0.2, }, -- Орудие «Плазмоиндуктор»
		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_EMPAbsorb_T3_Mk1",	price_weight = 0.45, }, -- Активный модуль «Конвертер излучений»		
		--{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_SeeressEngMod_T5_Rel",	price_weight = 0.2, }, -- Модифицированный инжектор тетраоксида	
        --{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_SeeressArmMod_T5_Rel",	price_weight = 0.2, }, -- Модифицированные улучшенные пилоны»		
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "A25FOR30_1", price_weight = 0.10, }, -- Аура, открывающая следующий квест
		
	},
}   

Def.Bundle_A25FOR30_2Rev  = -- Сундук за выполнение A25FOR30_2 + аура-счётчик итогового квеста (по аналогии с Bundle_NewbieKnickers_Start)
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_A25FOR30_2Rev_name",
    uiDesc 				= "Bundle_A25FOR30_2Rev_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "A25FOR30_2Rev",

	
    ui_content =
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T3_PremUniq", is_elite = true, }, -- Премиальный фрегат прикрытия Федерации: Archelon 
            --{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SeeressGun_T5_Rel", }, -- Орудие «Плазмоиндуктор»
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EMPAbsorb_T3_Mk1", }, -- Активный модуль «Конвертер излучений»		
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SeeressEngMod_T5_Epic", },	-- Модифицированный инжектор тетраоксида
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SeeressArmMod_T5_Epic", }, -- Модифицированные улучшенные пилоны»
			--{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Ship_Race1_M_T5_Chaos_part",},			
        },
	},	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race3_L_T3_PremUniq",	price_weight = 0.45, }, -- Премиальный фрегат прикрытия Федерации: Archelon
        --{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Weapon_SeeressGun_T5_Rel",	price_weight = 0.2, }, -- Орудие «Плазмоиндуктор»
		{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_EMPAbsorb_T3_Mk1",	price_weight = 0.45, }, -- Активный модуль «Конвертер излучений»		
		--{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_SeeressEngMod_T5_Rel",	price_weight = 0.2, }, -- Модифицированный инжектор тетраоксида	
        --{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_SeeressArmMod_T5_Rel",	price_weight = 0.2, }, -- Модифицированные улучшенные пилоны»
		--{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Ship_Race1_M_T5_Chaos_part", }, -- Деталь для сборко корабля Chaos. КрафтРесурс НЕ должен иметь price_weight	
		
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "A25FOR30_2", price_weight = 0.10, }, -- Аура, открывающая следующий квест
		
	},
}   

Def.Bundle_A25FOR30_3Rev  = -- Сундук за выполнение A25FOR30_3 + аура-счётчик итогового квеста (по аналогии с Bundle_NewbieKnickers_Start)
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_A25FOR30_3Rev_name",
    uiDesc 				= "Bundle_A25FOR30_3Rev_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "A25FOR30_3Rev",

	
    ui_content =
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T5_Pilum", }, -- Перехватчик диверсии Иерихона: Pilum 
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FireBallThrower_T5_Mk1", }, -- Орудие «Скорострельный бластер «Инферно»»
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PilumAntiHeat_T5_Mk1", }, -- Активный модуль «Принудительный охладитель»		
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PilumSpecialDamage_T5_Mk1", }, -- Пассивный модуль «Оптимизатор теплопотоков»
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_IndestructibleShield_T5_Mk1", }, -- Пассивный модуль «Запасная система щита»		
        },
	},	
	
	fixed_contents = 
	{
        { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race2_S_T5_Pilum", price_weight = 0.2, }, -- Перехватчик диверсии Иерихона: Pilum 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FireBallThrower_T5_Mk1", price_weight = 0.16, }, -- Орудие «Скорострельный бластер «Инферно»»
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PilumAntiHeat_T5_Mk1", price_weight = 0.16, }, -- Активный модуль «Принудительный охладитель»		
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PilumSpecialDamage_T5_Mk1", price_weight = 0.16, }, -- Пассивный модуль «Оптимизатор теплопотоков»
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_IndestructibleShield_T5_Mk1", price_weight = 0.16, }, -- Пассивный модуль «Запасная система щита»
			
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "A25FOR30_3", price_weight = 0.16, }, -- Аура, открывающая "карусель квестов " A25FOR30_4...7 и квест A25FOR30_8 
		
	},
}       

Def.Bundle_A25FOR30_8Rev  = -- Сундук за выполнение A25FOR30_8 + аура-счётчик квеста (по аналогии с Bundle_NewbieKnickers_Start)
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_A25FOR30_8Rev_name",
    uiDesc 				= "Bundle_A25FOR30_8Rev_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "A25FOR30_8Rev",

	
    ui_content =
    {
        {
			{ type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T5_Bark", }, -- Штурмовик ударный уникальный: Bark-2 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_BarkCanon_T5_Mk1", }, -- Орудие «Автопушка 2M-84»
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BarkBomb_T5_Mk1", }, -- Активный модуль «ФАБ-20000»		
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BarkArmor_T5_Mk1", }, -- Пассивный модуль «Усиление пайкеритом»
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BarkCPU_T5_Mk1", }, -- Пассивный модуль «Скрытые резервы»	
        },
	},	
	
	fixed_contents = 
	{
        { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_M_T5_Bark", price_weight = 0.2, }, -- Штурмовик ударный уникальный: Bark-2 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_BarkCanon_T5_Mk1", price_weight = 0.16, }, -- Орудие «Автопушка 2M-84»
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BarkBomb_T5_Mk1", price_weight = 0.16, }, -- Активный модуль «ФАБ-20000»		
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BarkArmor_T5_Mk1", price_weight = 0.16, }, -- Пассивный модуль «Усиление пайкеритом»
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BarkCPU_T5_Mk1", price_weight = 0.16, }, -- Пассивный модуль «Скрытые резервы»
		
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "A25FOR30_8", price_weight = 0.10, }, -- Аура, открывающая следующий квест
		
	},
}   

Def.Bundle_A25FOR30_9Rev  = -- Сундук за выполнение A25FOR30_9 + аура-счётчик квеста (по аналогии с Bundle_NewbieKnickers_Start)
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_A25FOR30_9Rev_name",
    uiDesc 				= "Bundle_A25FOR30_9Rev_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "A25FOR30_9Rev",

	
    ui_content =
    {
        {
			{ type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T5_CorVulnus", }, -- Перехватчик РЭБ Империи: Cor Vulnus
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_HeartAttack_T5_Mk1", }, -- Орудие «Лазер «Мертвое сердце»»
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HeartCooldownerDec_T5_Mk1", }, -- Активный модуль «Вечное мгновение»		
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CorVulnusCPU_T5_Mk1", }, -- Пассивный модуль «Протонная стена «Cor Vulnus»»
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EngineGeneratorCorVulnus_T5_Mk1", }, -- Пассивный модуль «Дополнительный генератор «Cor Vulnus»»
        },
	},	
	
	fixed_contents = 
	{
        { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_S_T5_CorVulnus", price_weight = 0.2, }, -- Перехватчик РЭБ Империи: Cor Vulnus
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_HeartAttack_T5_Mk1", price_weight = 0.16, }, -- Орудие «Лазер «Мертвое сердце»»
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HeartCooldownerDec_T5_Mk1", price_weight = 0.16, }, -- Активный модуль «Вечное мгновение»		
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CorVulnusCPU_T5_Mk1", price_weight = 0.16, }, -- Пассивный модуль «Протонная стена «Cor Vulnus»»
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EngineGeneratorCorVulnus_T5_Mk1", price_weight = 0.16, }, -- Пассивный модуль «Дополнительный генератор «Cor Vulnus»»
		
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "A25FOR30_9", price_weight = 0.10, }, -- Аура, открывающая следующий квест
		
	},
}   

Def.Bundle_A25FOR30_10Rev  = -- Сундук за выполнение A25FOR30_10 + аура-счётчик квеста (по аналогии с Bundle_NewbieKnickers_Start)
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_A25FOR30_10Rev_name",
    uiDesc 				= "Bundle_A25FOR30_10Rev_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "A25FOR30_10Rev",

	
    ui_content =
    {
        {
			{ type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T5_Comodo", is_elite = true, }, -- Премиальный фрегат прикрытия Федерации: Boremys
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MagneticGun_T5_Mk1", }, -- Орудие «Пушка с донаводкой снарядов»
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AttrackerField_T5_Mk1", }, -- Активный модуль «Притягивающий снаряд»	
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnginePowerRedistributor_T5_Mk1", }, -- Пассивный модуль «Приоритет перезарядки»
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BarkCPU_T5_Mk1", }, -- Пассивный модуль «Скрытые резервы»	
			--{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Ship_Race1_M_T5_Chaos_part",},
        },
	},	
	
	fixed_contents = 
	{
        { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T5_Comodo", price_weight = 0.30, }, -- Премиальный фрегат прикрытия Федерации: Boremys
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MagneticGun_T5_Mk1", price_weight = 0.20, }, -- Орудие «Пушка с донаводкой снарядов»
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AttrackerField_T5_Mk1", price_weight = 0.20, }, -- Активный модуль «Притягивающий снаряд»		
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnginePowerRedistributor_T5_Mk1", price_weight = 0.20, }, -- Пассивный модуль «Приоритет перезарядки»
		--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BarkCPU_T5_Mk1", price_weight = 0.16, }, -- Пассивный модуль «Скрытые резервы»
		--{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Ship_Race1_M_T5_Chaos_part", }, -- Деталь для сборко корабля Chaos. КрафтРесурс НЕ должен иметь price_weight
		
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "A25FOR30_10", price_weight = 0.10, }, -- Аура, открывающая "карусель квестов " A25FOR30_11...14
		
	},
}

-- SC-120221 Заворачиванеие «Синих Гаек» («Значков PvE»). Борьба с дублированием аккаунтов и абьюзом Игры. 

Def.Bundle_PvE600 = -- бандл на 600 гаек ("под лимит", цена 0,833 ГС/Гайка)
{
    inherit				= "BundleBase",
    premiumPrice		= 500,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_PvE1000",
    uiDesc				= "Bundle_PvE1000",
    cant_be_bought 		= true,
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	can_be_sent_by_mail	= false,

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 600,	str_param = "pve_resource", }, -- т.н. "Гайки" ("Значки PvE") 	
        },
	},	

    fixed_contents = 
    {

        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 600,	str_param = "pve_resource",},

    },
}

Def.Bundle_PvE600 = -- бандл на 400 гаек (цена 1 ГС/Гайка)
{
    inherit				= "BundleBase",
    premiumPrice		= 400,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_PvE1000",
    uiDesc				= "Bundle_PvE1000",
    cant_be_bought 		= true,
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	can_be_sent_by_mail	= false,

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 400,	str_param = "pve_resource", }, -- т.н. "Гайки" ("Значки PvE") 	
        },
	},	

    fixed_contents = 
    {

        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 400,	str_param = "pve_resource",},

    },
}

Def.Bundle_PvE200 = -- бандл на 200 гаек (цена 1,5 ГС/Гайка)
{
    inherit				= "BundleBase",
    premiumPrice		= 300,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_PvE1000",
    uiDesc				= "Bundle_PvE1000",
    cant_be_bought 		= true,
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	can_be_sent_by_mail	= false,

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 200,	str_param = "pve_resource", }, -- т.н. "Гайки" ("Значки PvE") 	
        },
	},	

    fixed_contents = 
    {

        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 200,	str_param = "pve_resource",},

    },
}

Def.Bundle_PvE50 = -- бандл на 50 гаек (цена 2 ГС/Гайка)
{
    inherit				= "BundleBase",
    premiumPrice		= 100,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_PvE1000",
    uiDesc				= "Bundle_PvE1000",
    cant_be_bought 		= true,
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	can_be_sent_by_mail	= false,

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50,	str_param = "pve_resource", }, -- т.н. "Гайки" ("Значки PvE") 	
        },
	},	

    fixed_contents = 
    {

        { type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50,	str_param = "pve_resource",},

    },
} 

-- Тестовый бандл с зелёным кораблём (Ze'Ta) и открытыми НОДАми 

Def.Bundle_ZeTa_Revard  = -- ФИНАЛЬНЫЙ сундук «Нубова-Неделька» за выполнение NewbieKnickers_FIN
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_ZeTa_Revard_name",
    uiDesc 				= "Bundle_ZeTa_Revard_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "ZeTa_Revard",

	
    ui_content =
    {
        {
            { type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race5_H_OVERSEER_Rank9", --[[is_elite = true,]] }, -- Эсминец Эллидиума Ze'Ta ("Голдовость" в UI - закомментирована)
        },
	},	
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race5_H_OVERSEER_Rank9", shouldUnlockAllNodes = "true",	price_weight = 1, }, -- -- Эсминец Эллидиума Ze'Ta
	},
}  

-- SC-120526 Открыть Главный калибр для Black Ghost. Через труд и только обладателям BG.

Def.Bundle_CookCannon_Rev  = -- Сундук выдающий Главный калибр для Black Ghost
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_CookCannon_Rev_name",
    uiDesc 				= "Bundle_CookCannon_Rev_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "A25FOR30_2Rev",

	
    ui_content =
    {
        {
            --{ type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race3_L_T3_PremUniq", is_elite = true, }, -- Премиальный фрегат прикрытия Федерации: Archelon 
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CookCannon_T5_Mk1", }, -- Модуль «Главный калибр»
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_Laser_Huge_Killer", }, -- Система линз 
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_Plasma_Huge_Killer", }, -- Усиленные заряды
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_Rail_Huge_Killer", }, -- Бронебойные снаряды				
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EMPAbsorb_T3_Mk1", }, -- Активный модуль «Конвертер излучений»		
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SeeressEngMod_T5_Epic", },	-- Модифицированный инжектор тетраоксида
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SeeressArmMod_T5_Epic", }, -- Модифицированные улучшенные пилоны»
			--{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Ship_Race1_M_T5_Chaos_part",},			
        },
	},	
	
	fixed_contents = 
	{
		--{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race3_L_T3_PremUniq",	price_weight = 0.45, }, -- Премиальный фрегат прикрытия Федерации: Archelon
        { type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_CookCannon_T5_Mk1",	price_weight = 0.25, }, -- Модуль «Главный калибр»
		{ type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_Laser_Huge_Killer", 		drop_weight = 0.25, }, -- Система линз 
		{ type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_Plasma_Huge_Killer",		drop_weight = 0.25, }, -- Усиленные заряды
		{ type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_Rail_Huge_Killer",		    drop_weight = 0.25, }, -- Бронебойные снаряды		
		--{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_EMPAbsorb_T3_Mk1",	price_weight = 0.45, }, -- Активный модуль «Конвертер излучений»		
		--{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_SeeressEngMod_T5_Rel",	price_weight = 0.2, }, -- Модифицированный инжектор тетраоксида	
        --{ type = ai.BundleContent.ITEM,	amount = 1,		str_param = "Module_SeeressArmMod_T5_Rel",	price_weight = 0.2, }, -- Модифицированные улучшенные пилоны»
		--{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Ship_Race1_M_T5_Chaos_part", }, -- Деталь для сборко корабля Chaos. КрафтРесурс НЕ должен иметь price_weight	
		
		--{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "A25FOR30_2", price_weight = 0.10, }, -- Аура, открывающая следующий квест
		
	},
}   