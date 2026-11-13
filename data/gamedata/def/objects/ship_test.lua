Def.Ship_Test = 
{
	-- model="models/ships/race_5/l/r5_l_t1_ev1",
	-- engine_grades=designers.engine_r5_r5l1,
	-- capacitor_grades=designers.capacitor_large1_race5_rank5,
	inherit		= "Ship_Race5_H_T5_Bashe", -- Ship_Race2_H_T5_Relic Ship_Race1_M_T5_Hadrian Ship_Race1_S_T5_Nordstorm Ship_Race2_L_T5_Dino
	--inherit		= "Ship_Race5_M_ATTACK_Rank15_13",
	--ui_name 	= "TestShip",
	--rank 		= 15,
	storeItemId = 0,
	vision_radius_mul = 4,
	shield_resist_kinetic = 0,
	shield_resist_emp  = 0,
	shield_resist_thermal  = 0,
	hull_resist_kinetic  = 0,
	hull_resist_emp  = 0,
	hull_resist_thermal  = 0,
	hull_health = 10000000,
	
	--model 		= "models/ships/race_1/l/race1_l_t5_premium",
	--cam_config  = "cam_ship_large_imp",
	
	--hull_health										= 11111,
	--shield_max										= 1100,
	energy_max										= 20000,
	--energy_regen 									= 13.46,
	--shield_regen									= 0.0,

	--death_effect = "particles/explosions/shp_exp_big_02",
	--death_effect = "particles/explosions/shp_exp_big_8march", -- #59880
--[[
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
		[ai.SpaceShipModuleSlot.AUTOGEN_01]			= "root",
		[ai.SpaceShipModuleSlot.AUTOGEN_02]			= "root",
		[ai.SpaceShipModuleSlot.AUTOGEN_03]			= "root",
		[ai.SpaceShipModuleSlot.AUTOGEN_04]			= "root",
		[ai.SpaceShipModuleSlot.AUTOGEN_05]			= "root",
	},
	]]
	-- модуль пассивный можно одеть "на лету"
	--designers:Module( pass_module, <bone> ) Module_ExtremeShieldCharge_T2_Mk1
	----designers:Module( "Module_SafeSpecial_T2_Mk1", ai.SpaceShipModuleSlot.ARMOR_MOD_01  )

	
	default_modules = {
		--[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_RelicGun_T5_Epic", --"Weapon_Fly_T5_Mk1",
		-- [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_PlasmaSplash ",--"Weapon_PirateRail_T4_Mk1",-- "Weapon_Grab_T4_Mk1",
--"Weapon_Grab", --"Weapon_LaserHeal_T5_Epic", -- "Weapon_Nanobots_Cloud_T5_Epic", -- "Weapon_LaserHeal_T5_Epic", --"Weapon_Cold_Ray",
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_LaserBlaster_T5_Pirate",
		
		

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DragonFlashControl",			--"Module_PairsShell_T3_Mk1",--Module_TractorBeam_T3_Mk1",--"Module_TestDestructible",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_Albiero_S_Warp",		--"Module_RestoringIons_T3_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_NoCooldown_st",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_Invulnerability_T3_Epic",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_Stelth_PVE_Boss_Execut",
		

		--[ ai.SpaceShipModuleSlot.SPECIAL ] 			= "Module_DragonFlash", --"Module_LandingTurret",--"Module_RemoteDisintegrator",--"DronesModuleTest", 			--"Module_Return_5", --Module_FrigateDrone_LowRes", --"Module_GigantShield", --"Module_FrigateDrone_LowRes", --"Module_FrigateDrone_T4_LowRes", --"Module_ShieldWall", -- "Module_FrigateDrone_T5_UniqRay", --"Module_ShieldWall",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_ThorStasis",
		
	--	[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "Module_Stelth_PVE_Boss_Execut",		--
	--	[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "Module_Stelth_PVE_Boss_Execut2",--
		-- [ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "Module_EmergencyShell_T4_Mk1",
		
	--	 [ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_Stelth_PVE_Boss_shield",
	--	[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_Stelth_PVE_Boss_Execut2",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "Module_AdaptiveForceField_T3_Mk3",

		--[ ai.SpaceShipModuleSlot.CAPACITOR ]	= "Module_Stelth_PVE_Boss_shield",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_DamageSpeed_T5_set1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_CmplxBatt_T5_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_SafeBoost_T5_set1",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_CoolantSystemIdle_T5_Mk1",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_DragonFlashRangeMaster",
		--[ai.SpaceShipModuleSlot.AUTOGEN_01] = "Module_Autogen_Test",
	},
	default_rocket_munition 						= "SpaceMissile_April_T5",
	--default_rocket_munition 						= "SpaceMissile_Standart_T5_Mk1",-- "DestrMunition_SectorShield_T4_Mk3", --DestrMunition_HealBot_T4_Mk3",
	--"MunitionSectorShield",-- "DestrHealBot", 
	--capacitor_grades 								= designers.capacitor_huge_r1_t3,
	--engine_grades 									= designers.engine_huge_r1_t3, 
	
	-- default_custom_elements = 
	-- {		
		-- [ ai.VesselCustomSlot.MATERIAL_0 ] 			= "Default_Race1_Imp_1",
		-- [ ai.VesselCustomSlot.MATERIAL_1 ] 			= "Default_Race1_Imp_2",
		-- [ ai.VesselCustomSlot.MATERIAL_2 ] 			= "Default_Race1_Imp_3",
	-- }, 
	-- Decor Test
	--default_custom_elements = 
	--{		
	--	[ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_r5_m_unique_r1",
	--	[ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_r5_m_unique_g1",
	--	[ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_r5_m_unique_b1",
	--	[ ai.VesselCustomSlot.CHILD_0 		] 	= "R5_m_unique",
	--	[ ai.VesselCustomSlot.SKIN_0 		] 	= "unique",
	--}, 
	
	--max_speed 										= 70,
	--boost_maxspeed_coef								= 1.2,
	--[[
	special_grades = 
	{
		[ 1 ] = { max_speed_mul = 0.1, },
		[ 2 ] = { hull_health_mul = 1.0, },
		[ 3 ] = { shield_max_mul = 1.0, railgun_damage_mul = 1.0, },
		[ 4 ] = { energy_max_mul = 0.5, plasma_projectile_speed_mul = 1.0, },
		[ 5 ] = { spell_ecm_duration_mul = 1.0, },
		[ 6 ] = { module_ecm_energy_cost_mul = -1.0, },
	},]]
	--shield_radius 									= 4,
	--[[
	vision_radius_mul = 4,
	hull_health						= 22000,
	shield_max						= 22000,
	energy_max						= 10000,
	energy_regen					= 0.000001,
	max_speed						= 45,
	lock_time						= 0.1,]]
} 