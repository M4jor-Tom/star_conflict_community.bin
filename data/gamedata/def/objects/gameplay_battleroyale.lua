Def.BR_SafeZone =
{
	class = "SafeZone",

	states =
	{
		{
			spell = "BR_SafeZone0",
			radius = 2200,
			duration = 150,
		},
		{
			spell = "BR_SafeZone1",
			radius = 1000,
			duration = 150,
		},
		{
			spell = "BR_SafeZone2",
			radius = 500,
			duration = 50,
		},
		{
			spell = "BR_SafeZone2",
			radius = 0,
		},
	},

	radius_dec = 10,

	sphere_effect = "particles/gadget/huge/hg_zone",
	bound_effect = "",
	max_distance_to_bound_effect = 3000,
	always_visible = true,
	bound_sound = "sound/game/death_sphere",

	uiName = "HG_SafeZone_name",

	nebula = "Effects_Nebula_HGZone",
}

Spell.BR_SafeZone0 =
{
	aura = ai.Aura.HULL_BURN_PERIODIC,
	target = { target = ai.SpellTargetGeneral.CASTER },
	aura_target = ai.SpellTarget.SHIPS_OUTSIDE,
	aura_range = 1,
	aura_param = 0.01,
	period = 1,
	hud_visible = false,

	aura_sound = "sound/aura/voidzone",
}

Spell.BR_SafeZone1 =
{
	aura = ai.Aura.HULL_BURN_PERIODIC,
	target = { target = ai.SpellTargetGeneral.CASTER },
	aura_target = ai.SpellTarget.SHIPS_OUTSIDE,
	aura_range = 1,
	aura_param = 0.05,
	period = 1,
	hud_visible = false,

	aura_sound = "sound/aura/voidzone",
}

Spell.BR_SafeZone2 =
{
	aura = ai.Aura.HULL_BURN_PERIODIC,
	target = { target = ai.SpellTargetGeneral.CASTER },
	aura_target = ai.SpellTarget.SHIPS_OUTSIDE,
	aura_range = 1,
	aura_param = 0.2,
	period = 1,
	hud_visible = false,

	aura_sound = "sound/aura/voidzone",
}

Spell.BR_Knockdown =	-- вызывается из кода
{
    influence = ai.Spell.CAST_SPELLS,
	spells= { 'BR_Knockdown_SlowMovement', 'BR_Knockdown_DisableBoost', "BR_Knockdown_DisableModules",
		"BR_Knockdown_DisableWeapon", "BR_Knockdown_Invulnerability", "BR_Knockdown_RestoreHealth" },
}

Spell.BR_Knockdown_SlowMovement =
{
    isBuff = false,
    aura = ai.Aura.SLOW_MOVEMENT,
    target = ai.SpellTarget.CASTER,
    aura_param = 3,
	hud_visible = false,
	gameplay_specific   = true,

	--aura_sound = "sound/game/agony",
	aura_sound 		= "sound/aura/stun",
	aura_fx			= "particles/gadget/special/doctor_damage_debuff",
}

Spell.BR_Knockdown_DisableBoost = {
	target=ai.SpellTarget.CASTER,
	aura=ai.Aura.DISABLE_BOOST,
	isBuff=false,
	hud_visible = false,
	gameplay_specific = true,
}

Spell.BR_Knockdown_DisableModules = {
	target=ai.SpellTarget.CASTER,
	aura=ai.Aura.DISABLE_MODULES,
	isBuff=false,
	hud_visible = false,
	gameplay_specific = true,
}

Spell.BR_Knockdown_DisableWeapon = {
	target=ai.SpellTarget.CASTER,
	aura=ai.Aura.DISABLED_WEAPON,
	isBuff=false,
	hud_visible = false,
	gameplay_specific = true,
}

Spell.BR_Knockdown_Invulnerability = {
	target=ai.SpellTarget.CASTER,
	aura=ai.Aura.INVULNERABILITY,
	duration = 1,
	isBuff=false,
	hud_visible = false,
	gameplay_specific = true,
}

--[[Spell.BR_Knockdown_RestoreHealthDelay = {
	target=ai.SpellTarget.CASTER,
	aura=ai.Aura.CAST_SPELL_IN_THE_END,
	target_spell	= "BR_Knockdown_RestoreHealth",
	duration = 0.9,--перед выключением неуязвимости восстанавливаем все hp
	isBuff=false,
	hud_visible = false,
	gameplay_specific = true,
}]]

Spell.BR_Knockdown_RestoreHealth = {
	target=ai.SpellTarget.CASTER,
	influence		= ai.Spell.HEAL_HULL,
	influence_param = 100000000, -- HACK: восстанавливаем все здоровье
	isBuff=false,
	hud_visible = false,
}

-- один из вариантов кораблей (не используется)
Def.Ship_BR_Level1 =
{
	inherit = "Ship_Medium",
	storeItemId			= 0,
	race                = ai.Race.EMPIRE,

	hull_health         = 20000,
	energy_max          = 200,
	shield_max			=0,--500,
	

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
	boost_energy_cost_per_second    = 10,

	hull_resist_kinetic = 10,
	hull_resist_emp     = 10,
	hull_resist_thermal = 10,
	contact_damage_cf   = 300,
	hull_regen          = 0,
	shield_regen        = 0,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_BR_Gun",
		--[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_BallLauncher",
		--[ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_Harpoon",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ]		= "",
	},


	slot_bones =
	{
		[ai.SpaceShipModuleSlot.ACTIVE_01]="active_up_1",
		[ai.SpaceShipModuleSlot.ACTIVE_02]="active_up_2",
		[ai.SpaceShipModuleSlot.ACTIVE_03]="active_up_3",
		[ai.SpaceShipModuleSlot.ACTIVE_04]="active_up_4",
	},
	--[[slot_bones[ai.SpaceShipModuleSlot.SHIELD_MOD_01]="root",
	slot_bones[ai.SpaceShipModuleSlot.SHIELD_MOD_02]="root",
	slot_bones[ai.SpaceShipModuleSlot.ARMOR_MOD_01]="root",
	slot_bones[ai.SpaceShipModuleSlot.ENGINE_MOD_01]="root",
	slot_bones[ai.SpaceShipModuleSlot.ENGINE_MOD_02]="root",
	slot_bones[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]="root",
	slot_bones[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]="root",
	slot_bones[ai.SpaceShipModuleSlot.CPU_MOD_01]="root",
	slot_bones[ai.SpaceShipModuleSlot.CPU_MOD_02]="root",]]
	--default_rocket_munition = "Football_ball",

	ship_name = "Ship_FirstLevel",

	vision_radius = 0,
}

-- Jaguar
Def.Ship_BR_Race3_M_T5_Craft =
{
	inherit="Ship_Race3_M_T5_Craft",
	cant_be_bought	= true,
	premiumPrice	= 999999,
	storeItemId		= 0,
	
	contact_damage_cf = 10,
	
	shield_max				= 0,
	shield_regen			= 0,
	shield_resist_kinetic	= 30,
	shield_resist_emp		= -30,
	shield_resist_thermal	= 0,
	
	hull_health				= 4915,
	hull_resist_kinetic		= -30,
	hull_resist_emp			= 30,
	hull_resist_thermal		= 0,
	
	max_speed = 30,
	boost_energy_cost_per_second = 175,
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ]		= "Module_HunterZone_T4_Mk1",
		[ ai.SpaceShipModuleSlot.SPECIAL ]			= "Module_CloakingDevice_Basic_T5_Mk3",
	},

	slot_bones =
	{
		[ai.SpaceShipModuleSlot.ACTIVE_01]="active_up_1",
		[ai.SpaceShipModuleSlot.ACTIVE_02]="active_up_2",
		[ai.SpaceShipModuleSlot.ACTIVE_03]="active_up_3",
		[ai.SpaceShipModuleSlot.ACTIVE_04]="active_up_4",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]="root",

		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]="",
	},

	strafe_speed_mul	= 0.4,
}

Def.Ship_BR_Singularity =
{
	inherit="Ship_Race2_M_T5_Singularity",
	cant_be_bought	= true,
	premiumPrice	= 999999,
	storeItemId		= 0,

	-- contact_damage_min_speed=3,
	-- contact_damage_cf=80,
	contact_damage_cf = 10,
	-- min_hull_damage_for_death=0.31,
	-- max_hull_damage_for_death=0.33,
	--cargo_hold_size=8,
	-- role=ai.ShipRoles.TACKLER,
	-- mastery_bonus=2.2,
	-- rank=16,
	-- ship_class=ai.ShipClass.MEDIUM,	
	
	-- это возможно пригодится
	-- energy_regen=4.318,
	-- energy_max=635,
	
	shield_max				= 0,--8190,
	shield_regen			= 0,--127.5,
	shield_resist_kinetic	= 30,
	shield_resist_emp		= -30,
	shield_resist_thermal	= 0,
	
	-- у иерихона сильные щиты, а раз их не будет, то возможно стоит поднять прочность корпуса
	hull_health				= 4220,
	hull_resist_kinetic		= -30,
	hull_resist_emp			= 30,
	hull_resist_thermal		= 0,
	
	max_speed=30,
	boost_energy_cost_per_second=175.2,
	
	-- death_wreck="Wreck_R2_M",
	-- race=ai.Race.JERICHO,
	-- default_custom_elements={
		-- [ai.VesselCustomSlot.MATERIAL_0]="Default_Race2_m_singularity_r1",
		-- [ai.VesselCustomSlot.MATERIAL_1]="Default_Race2_m_singularity_g1",
		-- [ai.VesselCustomSlot.MATERIAL_2]="Default_Race2_m_singularity_b1",
	-- },

	-- customization_groups=
	-- {
		-- [ ai.VesselCustomSlot.MATERIAL_0 ]={VesselCustomElementsGroups.DEFAULT},
		-- [ ai.VesselCustomSlot.MATERIAL_1 ]={VesselCustomElementsGroups.DEFAULT},
		-- [ ai.VesselCustomSlot.MATERIAL_2 ]={VesselCustomElementsGroups.DEFAULT},
		-- [ ai.VesselCustomSlot.MPRESET_0 ]={VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.LINES},
	-- },

	-- cam_config="cam_ship_medium_jer",
	-- model="models/ships/race_2/m/race2_m_singularity",
	-- hangarIco="Race2_M_T5_Snglrt",
	-- default_icon="shopIco_Ship_Race2_M_T5_Snglrt",
	-- hangarIcoSmall="Race2_M_T5_Snglrt_small",
	-- base_preset="Ship_Race2_M_T5_Singularity_Preset1",
	-- item_subtype=ItemSubtype.Ship,
	-- craftable=true,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "",
		[ ai.SpaceShipModuleSlot.SPECIAL ]	= "Module_CloakingDevice_Singularity",
	},

	slot_bones =
	{
		[ai.SpaceShipModuleSlot.ACTIVE_01]="active_up_1",
		[ai.SpaceShipModuleSlot.ACTIVE_02]="active_up_2",
		[ai.SpaceShipModuleSlot.ACTIVE_03]="active_up_3",
		[ai.SpaceShipModuleSlot.ACTIVE_04]="active_up_4",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]="root",

		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]="",
	},

	-- cpu_grades=designers.cpu_medium_grades,
	-- armor_grades=designers.armor_grades,
	-- shield_grades=designers.shield_grades,
	-- capacitor_grades=designers.capacitor_medium_race2_singularity,
	-- engine_grades=designers.engine_medium_race2_singularity,

	-- lock_time_mul		= -1,
	-- max_speed_mul		= 0.05,
	strafe_speed_mul	= 0.4,

	--SpecialModulesVariants={ "Module_CloakingDevice_Basic_T5_Mk1", "Module_CloakingDevice_Singularity" },
	-- special_grades=
	-- {
		-- [2]=ShipSpecBonus.TACKLER_BASE,
		-- [4]=ShipSpecBonus.SET_SNGLRT_4,
		-- [8]=ShipSpecBonus.SET_SNGLRT_8,
	-- },
	-- ship_name="Ship_Race2_M_T5_Singularity",
}

-- Def.Ship_BR_Singularity2 =
-- {
	-- cant_be_bought					= true,
	-- premiumPrice					= 999999,
	-- storeItemId=0,
	
	-- inherit="Ship_BR_Singularity",
	-- ship_name="Ship_Race2_M_T5_Singularity",
-- }

-- Hammerhead
Def.Ship_BR_Race3_L_T5_CraftUniq =
{
	inherit 		= "Ship_Race3_L_T5_CraftUniq",
	cant_be_bought	= true,
	premiumPrice	= 999999,
	storeItemId		= 0,

	-- contact_damage_min_speed=3,
	contact_damage_cf = 10,
	-- min_hull_damage_for_death=0.31,
	-- max_hull_damage_for_death=0.33,
	--cargo_hold_size = 12,
	-- role=ai.ShipRoles.ENGINEER,
	-- mastery_bonus=2.2,
	-- base_preset="Ship_Race3_L_T5_Craft_Preset1",
	-- rank=17,
	-- ship_class=ai.ShipClass.LARGE,
	
	-- это возможно пригодится
	-- energy_regen=7.446,
	-- energy_max=1095,
	
	shield_max				= 0, 
	shield_regen			= 0,
	shield_resist_kinetic	= 30,
	shield_resist_emp     	= -30,
	shield_resist_thermal	= 0,
	
	hull_health				= 11865,
	hull_resist_kinetic		= -30,
	hull_resist_emp			= 30,
	hull_resist_thermal		= 0,
	
	max_speed 		= 30, --25.88
	boost_energy_cost_per_second	= 245.6,	
	deceleration					= 0.8,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 7,		-- 8 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 7,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 1,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???

	
	-- death_wreck="Wreck_Hammerhead_L",
	-- broken_parts={[ 1 ] = { model = "models/ships/race_3/wrecks/r3_wreck_l_wingl", effect = "particles/explosions/debris_trail", angle = 180, pos = Vec3( 5.4337, 0.1166, -0.0219 ), dumping = 0.3, speed = 10.0, speed_deviation = 7, speed_inherit = 1.0, ttl = 7, }, [ 2 ] = { model = "models/ships/race_3/wrecks/r3_wreck_l_wingr", effect = "particles/explosions/debris_trail", angle = 180, pos = Vec3( -5.3955, 0.3131, -0.0238 ), dumping = 0.3, speed = 10.0, speed_deviation = 7, speed_inherit = 1.0, ttl = 7, }, },
	-- race=ai.Race.FEDERATION,
	-- default_custom_elements={
		-- [ai.VesselCustomSlot.MATERIAL_0]="Default_Race3_I_hammerhead_r1",
		-- [ai.VesselCustomSlot.MATERIAL_1]="Default_Race3_I_hammerhead_g1",
		-- [ai.VesselCustomSlot.MATERIAL_2]="Default_Race3_I_hammerhead_b1",
	-- },
	-- customization_groups={
		-- [ ai.VesselCustomSlot.MATERIAL_0 ]={VesselCustomElementsGroups.DEFAULT},
		-- [ ai.VesselCustomSlot.MATERIAL_1 ]={VesselCustomElementsGroups.DEFAULT},
		-- [ ai.VesselCustomSlot.MATERIAL_2 ]={VesselCustomElementsGroups.DEFAULT},
		-- [ ai.VesselCustomSlot.MPRESET_0 ]={VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.CAMOUFLAGE},
	-- },
	-- cam_config="cam_ship_large_oculus_up",
	-- model="models/ships/race_3/l/r3_l_hammerhead/r3_l_hammerhead",
	-- hangarIco="Ship_Race3_L_T5_CraftUniq",
	-- default_icon="shopIco_Ship_Race3_L_T5_CraftUniq",
	-- hangarIcoSmall="Ship_Race3_L_T5_CraftUniq_small",
	
	-- item_subtype=ItemSubtype.Ship,
	-- craftable=true,
	slot_bones=
	{
		[ai.SpaceShipModuleSlot.ACTIVE_01]="active_up_1",
		[ai.SpaceShipModuleSlot.ACTIVE_02]="active_up_2",
		[ai.SpaceShipModuleSlot.ACTIVE_03]="active_up_3",
		[ai.SpaceShipModuleSlot.ACTIVE_04]="active_up_4",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]="root",
		[ai.SpaceShipModuleSlot.SPECIAL]="container",
		
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]="",
	},
	-- cpu_grades=designers.cpu_large_grades,
	-- armor_grades=designers.armor_grades_federation,
	-- shield_grades=designers.shield_grades,
	-- capacitor_grades=designers.capacitor_race3_l_craftuniq_grades,
	-- engine_grades=designers.engine_large_race3_craftuniq_grades,
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 			= "Module_Screen_T5_Mk1", --"Module_WarpGate_T5_Mk1", --
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_SmallBattleStation",
	},
	
	-- это можно взять и у оригинального корабля
	-- max_speed_mul=0.05,
	-- strafe_speed_mul=0.15,
	
	rot_speed_mul		= 0.15,	--у него стандартно 0.15
	strafe_speed_mul	= 0.7, 	--у него стандартно 0.15
	
	
	--SpecialModulesVariants={ "Module_FrigateDrone_T5_Base_WithBox", "Module_SmallBattleStation" }
	-- special_grades=
	-- {
		-- [2]=ShipSpecBonus.ENGINEER_BASE,
		-- [4]=ShipSpecBonus.SET_HAMMERHEAD_4,
		-- [8]=ShipSpecBonus.SET_HAMMERHEAD_8,
	-- },
	-- ship_name="Ship_Race3_L_T5_CraftUniq"
}

-- Mole
Def.Ship_BR_Race3_L_T5_Mole =
{
	inherit 		= "Ship_Race3_L_T5_Mole",
	cant_be_bought	= true,
	premiumPrice	= 999999,
	storeItemId		= 0,

	-- contact_damage_min_speed=3,
	contact_damage_cf = 10,
	-- min_hull_damage_for_death=0.31,
	-- max_hull_damage_for_death=0.33,
	--cargo_hold_size = 12,
	-- role=ai.ShipRoles.ENGINEER,
	-- mastery_bonus=2.2,
	-- base_preset="Ship_Race3_L_T5_Craft_Preset1",
	-- rank=17,
	-- ship_class=ai.ShipClass.LARGE,
	
	-- это возможно пригодится
	-- energy_regen=7.446,
	-- energy_max=1095,
	
	shield_max				= 0, 
	shield_regen			= 0,
	shield_resist_kinetic	= 30,
	shield_resist_emp     	= -30,
	shield_resist_thermal	= 0,
	
	hull_health				= 7000,
	hull_resist_kinetic		= -30,
	hull_resist_emp			= 30,
	hull_resist_thermal		= 0,
	
	max_speed 		= 30, --25.88
	--boost_energy_cost_per_second	= 245.6,	
	deceleration					= 0.8,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 7,		-- 8 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 8,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 1,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???

	slot_bones=
	{
		[ai.SpaceShipModuleSlot.ACTIVE_01]="active_up_1",
		[ai.SpaceShipModuleSlot.ACTIVE_02]="active_up_2",
		[ai.SpaceShipModuleSlot.ACTIVE_03]="active_up_3",
		[ai.SpaceShipModuleSlot.ACTIVE_04]="active_up_4",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]="root",
		
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]="",
	},

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 			= "Module_WarpGate_T5_Mk1", --"Module_WarpGate_T5_Mk1", --
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_MoleSendDrone_BR",
	},
	
	-- это можно взять и у оригинального корабля
	-- max_speed_mul=0.05,
	-- strafe_speed_mul=0.15,
	
	rot_speed_mul		= 0.25,	
	strafe_speed_mul	= 0.8, 	
}
Def.Module_MoleSendDrone_BR = 
{
	inherit				= "Module_MoleSendDrone",
	
	item_subtype		= ItemSubtype.MoleSendDrone,	
	default_icon		= "ItemSubtype_MoleSendDrone",
		
	energy_cost 		= 300,
	
	cooldown			= 15,	
	ammo				= 2, -- максимальное количество патронов
	ammo_regen_time		= 50, -- раз в это время будет восстанавливаться один патрон, если их количество меньше ammo_regen_max
	ammo_regen_max		= 2, 
	ammo_start			= 0, -- стартовое кличество патронов (по умолчанию максимальное)
	ammo_cost			= 1, -- стоимость активации (по умолчанию 1)
	drone_num			= 2,
	
	spell				= "Spell_Mole_SendDrone_BR",
	drone_def			= "MoleDrone_OnParent_BR",
	activate_entity_health			= 3000,
	heal_per_second	= 30,
}

Def.MoleDrone_OnParent_BR =
{
	inherit				= "FrigateDrone",
	heal_per_second = 30,
	launch_speed = 70, -- скорость полета в заклинании SEND_SATELLITE
	use_phase_heal_only = true,
}
Def.MoleDrone_BR =
{
	inherit				= "FrigateDrone",
	heal_per_second = 100,
	use_phase_heal_only = true,
	launch_speed = 70, -- скорость полета в заклинании SEND_SATELLITE

	use_phase_heal_only	= true,

	emergency_spell = "Spell_Mole_CastHeal_BR",
	emergency_spell_threshold = 0.3,
	emergency_spell_cooldown = 50,
}

Spell.Spell_Mole_SendDrone_BR={}
Spell.Spell_Mole_SendDrone_BR.ods_export=true
Spell.Spell_Mole_SendDrone_BR.inherit="Spell_Mole_SendDrone"
Spell.Spell_Mole_SendDrone_BR.drone_def="MoleDrone_BR"
Spell.Spell_Mole_SendDrone_BR.drone_ttl=15
Spell.Spell_Mole_SendDrone_BR.target_range=200

Spell.Spell_Mole_CastHeal_BR={}
Spell.Spell_Mole_CastHeal_BR.ods_export=true
Spell.Spell_Mole_CastHeal_BR.inherit="Spell_Mole_CastHeal"
Spell.Spell_Mole_CastHeal_BR.spells={}
Spell.Spell_Mole_CastHeal_BR.spells[1]='Spell_Mole_EmergencyHullHeal_BR'
Spell.Spell_Mole_CastHeal_BR.spells[2]='Spell_Mole_EmergencyShieldHeal_BR'

Spell.Spell_Mole_EmergencyHullHeal_BR={}
Spell.Spell_Mole_EmergencyHullHeal_BR.ods_export=true
Spell.Spell_Mole_EmergencyHullHeal_BR.inherit="Spell_Mole_SendDrone"
Spell.Spell_Mole_EmergencyHullHeal_BR.influence_param=2000

Spell.Spell_Mole_EmergencyShieldHeal_BR={}
Spell.Spell_Mole_EmergencyShieldHeal_BR.ods_export=true
Spell.Spell_Mole_EmergencyShieldHeal_BR.inherit="Spell_Mole_SendDrone"
Spell.Spell_Mole_EmergencyShieldHeal_BR.influence_param=2000


-- Dyrnwyn
Def.Ship_BR_Race1_S_T5_Herald =
{
	inherit			= "Ship_Race1_S_T5_Herald",
	cant_be_bought	= true,
	premiumPrice	= 999999,
	storeItemId		= 0,

	-- contact_damage_min_speed=5,
	contact_damage_cf=10,
	-- min_hull_damage_for_death=0.31,
	-- max_hull_damage_for_death=0.33,
	-- --cargo_hold_size=3,
	-- role=ai.ShipRoles.ECM,
	-- mastery_bonus=2.05,
	-- base_preset="Ship_Race1_S_T5_Craft_Preset1",
	-- rank=17,
	-- ship_class=ai.ShipClass.SMALL,

	-- это возможно пригодится
	-- energy_regen=2.108,
	-- energy_max=310,
	
	shield_max				= 0,
	shield_regen			= 0,
	shield_resist_kinetic	= 30,
	shield_resist_emp		= -30,
	shield_resist_thermal	= 0,
	
	hull_health				= 5510,
	hull_resist_kinetic		= -15,
	hull_resist_emp			= 45,
	hull_resist_thermal		= 15,
	
	max_speed=30,
	boost_energy_cost_per_second=89.9,

	-- death_wreck="Wreck_R1_S",
	-- race=ai.Race.EMPIRE,
	-- default_custom_elements={
		-- [ai.VesselCustomSlot.MATERIAL_0]="Default_Race1_s_dyrnwin_r1",
		-- [ai.VesselCustomSlot.MATERIAL_1]="Default_Race1_s_dyrnwin_g1",
		-- [ai.VesselCustomSlot.MATERIAL_2]="Default_Race1_s_dyrnwin_b1",
	-- },
	-- customization_groups={
		-- [ ai.VesselCustomSlot.MATERIAL_0 ]={VesselCustomElementsGroups.DEFAULT},
		-- [ ai.VesselCustomSlot.MATERIAL_1 ]={VesselCustomElementsGroups.DEFAULT},
		-- [ ai.VesselCustomSlot.MATERIAL_2 ]={VesselCustomElementsGroups.DEFAULT},
		-- [ ai.VesselCustomSlot.MPRESET_0 ]={VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.CAMOUFLAGE},
	-- },
	-- cam_config="cam_ship_small_ver2",
	-- model="models/ships/race_1/s/r1_s_dyrnwyn",
	-- hangarIco="Race1_S_T5_Hearld",
	-- default_icon="shopIco_Ship_Race1_T5_Hearld",
	-- hangarIcoSmall="Race1_S_T5_Hearld_small",
	
	-- item_subtype=ItemSubtype.Ship,
	-- craftable=true,
	--slot_bones={},
	slot_bones={
		[ai.SpaceShipModuleSlot.ACTIVE_01]="active_up_1",
		[ai.SpaceShipModuleSlot.ACTIVE_02]="active_up_2",
		[ai.SpaceShipModuleSlot.ACTIVE_03]="active_up_3",
		[ai.SpaceShipModuleSlot.ACTIVE_04]="active_up_4",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]="root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]="root",
		
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]="",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]="",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]="",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]="",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]="",
	},
	--max_craft_slots=-1,
	-- cpu_grades=designers.cpu_small_grades,
	-- armor_grades=designers.armor_grades,
	-- shield_grades=designers.shield_grades,
	-- capacitor_grades=designers.capacitor_small_r1_Herald,
	-- engine_grades=designers.engine_r1_Herald,
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 			= "Module_IonRay_T5_Mk1", --Module_LossOfSignatures_BR
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_SpecialStunClone_BR",
	},
	--need_level_to_open=7,
	
	-- lock_time_mul=-1,
	-- damage_mul=0.07,
	-- beacon_capture_mul=0.2,
	-- max_speed_mul=0.05,
	strafe_speed_mul = 0.3,
	
	--SpecialModulesVariants={ "Module_BlackoutGenerator_T5_Base", "Module_SpecialStunClone" }
	-- special_grades={
		-- [2]=ShipSpecBonus.ECM_BASE,
		-- [4]=ShipSpecBonus.SET_HERALD4,
		-- [8]=ShipSpecBonus.SET_HERALD8,
	-- },
	-- ship_name="Ship_Race1_S_T5_Herald",
}

Def.Module_LossOfSignatures_BR={}
Def.Module_LossOfSignatures_BR.ods_export=true
Def.Module_LossOfSignatures_BR.inherit="Module_LossOfSignatures_T5_Mk1"
Def.Module_LossOfSignatures_BR.cooldown=60
Def.Module_LossOfSignatures_BR.energy_cost=100
Def.Module_LossOfSignatures_BR.storeItemId=0

-- Спецмодуль корабля Ship_BR_Race1_S_T5_Herald
Def.Module_SpecialStunClone_BR = 
{
	inherit			= "Module_SpecialStunClone",
	cant_be_bought	= true,
	premiumPrice	= 999999,
	storeItemId		= 0,

	cooldown				= 60, --35,
	energy_cost				= 100,

	spell 					= "SpecialStunClone_BR",
}
Spell.SpecialStunClone_BR={}
Spell.SpecialStunClone_BR.ods_export=true
Spell.SpecialStunClone_BR.inherit="SpecialStunClone"
Spell.SpecialStunClone_BR.additional_auras={}
Spell.SpecialStunClone_BR.additional_auras[2]={}
Spell.SpecialStunClone_BR.additional_auras[2].aura_param=20


BR_LootSettings =
{
	-- здесь перечисляется весь лут
	-- { item = "имя дефа",
	--   pack_size = количество единиц в пакете(если не указано, то берется из дефа, по умолчанию 1),
	--   max_packs_per_crate = максимальное количество пакетов в одном ящике, по умолчанию 1 },
	description =
	{
		{ item = "CargoItem_BR_ShieldBoosterSmall", pack_size = 2, max_packs_per_crate = 4 },
		{ item = "CargoItem_BR_ShieldBoosterLarge", pack_size = 1, max_packs_per_crate = 2 },
		{ item = "CargoItem_BR_MedKitSmall", pack_size = 2, max_packs_per_crate = 4 },
		{ item = "CargoItem_BR_MedKitLarge", pack_size = 1, max_packs_per_crate = 2 },		
		--{ item = "Armor_BR_Level1", pack_amount = 100, },
		--{ item = "Armor_BR_Level4", pack_amount = 10, },
		{ item = "Shield_BR_Level1", --[[param = 10000]] },
		{ item = "Shield_BR_Level2", --[[param = 15000]] },
		{ item = "Shield_BR_Level3", --[[param = 20000]] },
		--{ item = "Shield_BR_Level4", --[[param = 25000]] },
		{ item = "Hold_BR_Level1", max_packs_per_crate = 2 },
		{ item = "Hold_BR_Level2" },
		{ item = "Hold_BR_Level3" },
		--{ item = "Hold_BR_Level4" },
		{ item = "CargoItem_BR_Proj_Kinetic", max_packs_per_crate = 3 },
		{ item = "CargoItem_BR_Proj_EMP", max_packs_per_crate = 3 },
		{ item = "CargoItem_BR_Proj_Thermal", max_packs_per_crate = 3, },
		{ item = "CargoItem_BR_Proj_Disintegrator", max_packs_per_crate = 2 },		
		{ item = "Weapon_Selector_BR_Gun2" },
		{ item = "Weapon_Selector_Railgun_Basic" },
		{ item = "Weapon_Selector_Plasmagun_Basic" },	
		{ item = "Weapon_Selector_BR_Laser_Sniper" },
		{ item = "Module_Disintegrator_BR" },
	},

	-- наборы. Один ящик может содержать только один набор
	sets =
	{
		-- 
		-- {
			-- items = {
				-- { item = "Weapon_Selector_BR_Gun2" },
				-- { item = "CargoItem_BR_Proj_Kinetic", pack_amount = 2 }, -- pack_amount по умолчанию равен 1
			-- },
			-- amount = 70, -- количество наборов (по умолчанию 1)
		-- },

		-- -- 
		{
			items = {
				{ item = "Weapon_Selector_BR_Laser_Sniper" },
				{ item = "CargoItem_BR_Proj_Thermal", pack_amount = 2 },
			},
			amount = 20,
		},

		-- 
		{
			items = {
				{ item = "Module_Disintegrator_BR" },
				--{ item = "CargoItem_BR_Proj_Disintegrator", pack_amount = 1 },
			},
			amount = 5,
		},
			
		{
			items = {
				{ item = "Weapon_Selector_Railgun_Basic" },
				{ item = "CargoItem_BR_Proj_Kinetic", pack_amount = 2 }, -- pack_amount по умолчанию равен 1
			},
			amount = 20, -- количество наборов (по умолчанию 1)
		},
		
		{
			items = {
				{ item = "Weapon_Selector_Plasmagun_Basic" },
				{ item = "CargoItem_BR_Proj_EMP", pack_amount = 2 }, -- pack_amount по умолчанию равен 1
			},
			amount = 20, -- количество наборов (по умолчанию 1)
		},
	},

	-- отдельные предметы.
	-- Не весь лут может влезть во все ящики, даже если суммарное количество пакетов соответствует
	-- колиество_ящиков * максимальное_количество_пакетов_в_ящике, так как алгоритм распределяет лут случайным образом и не
	-- учитывает, что какие-то предметы могут быть в ящике только в одном экземпляре(max_packs_per_crate=1) и для них нужно, чтобы
	-- было pack_amount количество ящиков хотя бы с одним свободным слотом.
	items =
	{
		{ item = "CargoItem_BR_ShieldBoosterSmall", pack_amount = 20, },
		{ item = "CargoItem_BR_ShieldBoosterLarge", pack_amount = 10 },
		{ item = "CargoItem_BR_MedKitSmall", pack_amount = 20, },
		{ item = "CargoItem_BR_MedKitLarge", pack_amount = 10, },
		--{ item = "Armor_BR_Level1", pack_amount = 100, },
		--{ item = "Armor_BR_Level4", pack_amount = 10, },
		{ item = "Shield_BR_Level1", pack_amount = 20 },
		{ item = "Shield_BR_Level2", pack_amount = 15 },
		{ item = "Shield_BR_Level3", pack_amount = 10 },
		--{ item = "Shield_BR_Level4", pack_amount = 2 },
		{ item = "Hold_BR_Level1", pack_amount = 20, },
		{ item = "Hold_BR_Level2", pack_amount = 15, },
		{ item = "Hold_BR_Level3", pack_amount = 10, },
		--{ item = "Hold_BR_Level4", pack_amount = 3, },
		{ item = "CargoItem_BR_Proj_Kinetic", pack_amount = 20, },
		{ item = "CargoItem_BR_Proj_EMP", pack_amount = 20, },
		{ item = "CargoItem_BR_Proj_Thermal", pack_amount = 20, },
		--{ item = "CargoItem_BR_Proj_Disintegrator", pack_amount = 3, },
		--{ item = "Weapon_Selector_BR_Gun2", param = 20, pack_amount = 10, },
		--{ item = "Module_Disintegrator_BR", param = 2, pack_amount = 10,},
	},

	-- предметы для заполнения оставшихся свободных слотов в ящиках
	--[[ fill_items =
	{
		{ item = "CargoItem_BR_MedKitSmall" },
		{ item = "CargoItem_BR_ShieldBoosterSmall" },
		
		{ item = "CargoItem_BR_Proj_Kinetic" },
		{ item = "CargoItem_BR_Proj_EMP" },
		{ item = "CargoItem_BR_Proj_Thermal" },
	} ]]
}

-- Орудия
Def.Weapon_BR_Gun =
{
	inherit             = "Weapon_Base",
	class               = "AutoGun",

	storeItemId 		= 0,

	cycle_barrels       = true,

	fire_rate           = 40,
	shot_energy_cost    = 0,

	dispersion          = 0.1,
	dispersion_max      = 1,
	dispersion_add      = 0.5,
	dispersion_sub      = 1,

	max_range           = 200,
	projectile_speed    = 100,

	damage_kinetic      = 3,
	damage_emp          = 3,
	damage_thermal      = 3,

	no_friendly_fire    = true,

	muzzleflash_color = { kinetic = "255 210 146 100", emp = "255 210 146 100", thermal = "255 210 146 100", },
	muzzleflash_radius  = 20,

	projectile          = "Projectile_FootballGun",

	shot_once_sound     = "sound/weapons/football_cannon/fc_shot",
	model               = "models/weapons/rail_guns/econom/rg_training",
	shot_effect         = "particles/weapons/artillery_big_muzzle",
	default_icon        = "ItemSubtype_RailgunBasic_5",
	item_subtype        = ItemSubtype.HeatingGun,
	network_sync 	    = true,
	heat_add            = 1.4285714,
	heat_sub            = 10,
	heat_max            = 10,
	overheat_time       = 1.5,
	ammo                = 15,
	--cant_be_bought      = true,
}

Def.Weapon_BR_Railgun_Basic =
{
	inherit             = "Weapon_Railgun_Basic_T5_Mk1",
	module_slot			= ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01,
	mark = 4,
	
	cant_be_bought	= true,
	premiumPrice	= 999999,
	storeItemId		= 0,
	--cycle_barrels       = true,

	--max_range         = 295,
	projectile_speed  = 710.125 * 0.8,
	--fire_rate			= 210,
	--damage_kinetic    = 144.1,
	
	projectile          = "Projectile_BR_Kinetic",

	heat_add            = 0.1,
	heat_sub            = 12.5,
	heat_max            = 10,
	overheat_time       = 1.5,

	network_sync 	    = true,

	ammo                = 80,
	ammo_regen_max		= 0,
}

Def.Weapon_BR_Plasmagun_Basic =
{
	inherit             = "Weapon_Plasmagun_Basic_T5_Mk1",
	module_slot			= ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01,
	mark = 3,
	
	cant_be_bought	= true,
	premiumPrice	= 999999,
	storeItemId		= 0,
	--cycle_barrels       = true,

	--max_range         = 260,
	--optimal_range		= 195,
	projectile_speed  = 707.25 * 0.8,
	--fire_rate			= 220,
	--damage_emp		= 178.9,
	
	projectile          = "Projectile_BR_EMP",

	heat_add            = 0.1,
	heat_sub            = 12.5,
	heat_max            = 10,
	overheat_time       = 1.5,

	network_sync 	    = true,

	ammo                = 100,
	ammo_regen_max		= 0,
}

Def.Weapon_BR_Laser_Sniper =
{
	inherit             = "Weapon_Laser_Sniper_T1_Mk1",
	mark = 5,
	storeItemId 		= 0,

	module_slot			= ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01,
	
	projectile_speed=541.5 * 0.8,
	--optimal_range=300,
	--max_range=400,
	--damage_thermal=134.9,

	projectile			= "Projectile_BR_Thermal",

	shot_effect = "particles/weapons/blaster/neutron_muzzle",
	shot_once_sound = "sound/weapons/laser/sniper",
	muzzleflash_color = { kinetic = "255 100 100 128", emp = "255 100 100 128", thermal = "255 100 100 128", },
	damage_color = { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "225 51 51 255", },
	
			

	network_sync 	    = true,
	--cant_be_bought      = true,
	ammo                = 150,
	ammo_regen_max		= 0, 
}

-- Копия Weapon_BR_Gun для теста LootCrate_Gun
Def.Weapon_BR_Gun2 =
{
	inherit             = "Weapon_Base",

	class               = "AutoGun",

	storeItemId 		= 0,

	module_slot			= ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01,

	cycle_barrels       = true,

	fire_rate           = 80,
	shot_energy_cost    = 0,

	dispersion          = 0.1,
	dispersion_max      = 1,
	dispersion_add      = 0.5,
	dispersion_sub      = 1,

	max_range           = 200,
	projectile_speed    = 100,

	damage_kinetic      = 3000,
	damage_emp          = 3000,
	damage_thermal      = 3000,

	no_friendly_fire    = true,

	muzzleflash_color = { kinetic = "255 210 146 100", emp = "255 210 146 100", thermal = "255 210 146 100", },
	muzzleflash_radius  = 20,

	projectile          = "Projectile_BR_Kinetic",

	shot_once_sound     = "sound/weapons/football_cannon/fc_shot",
	model               = "models/weapons/rail_guns/econom/rg_training",
	shot_effect         = "particles/weapons/artillery_big_muzzle",
	default_icon        = "ItemSubtype_RailgunBasic_5",
	item_subtype        = ItemSubtype.FootballGun,
	network_sync 	    = true,
	--cant_be_bought      = true,
	ammo                = 15,
	ammo_regen_max		= 0,
}


-- Щиты
Def.Shield_BR_Level1 =
{
	class			= "SpaceShipModule",

	storeItemId 	= 0,

	shield_max_add	= 4000,
	mark			= 1,
	--shield_max_mul	=	0.3,
	--module_type		= ai.ModuleType.SHIELD_MOD,
	module_slot		= ai.SpaceShipModuleSlot.SHIELD_MOD_01,
	default_icon	= "ItemSubtype_ShieldExtender",
	item_subtype	= ItemSubtype.ShieldExtender,
	network_sync	= true,
	
	--uiName 		= "Special_MicroWarp_Base",
	--uiDesc 		= "Special_MicroWarp_Base_Desc",
}

Def.Shield_BR_Level2 =
{
	inherit			= "Shield_BR_Level1",

	storeItemId 	= 0,

	shield_max_add	= 7000,
	--shield_max_mul	= 0.6,
	mark			= 6,
}

Def.Shield_BR_Level3 =
{
	inherit			= "Shield_BR_Level1",

	storeItemId 	= 0,

	shield_max_add	= 10000,
	--shield_max_mul	= 0.9,
	mark			= 7,
}

Def.Shield_BR_Level4 =
{
	inherit			= "Shield_BR_Level1",

	storeItemId 	= 0,

	shield_max_add	= 25000,
	--shield_max_mul	= 0.9,
	mark			= 5,
}

-- Было решено не использовать наборы брони
-- Def.Armor_BR_Level1 =
-- {
	-- class					= "SpaceShipModule",

	-- storeItemId 			= 0,

	-- hull_resist_kinetic_add	= 16,
	-- hull_resist_emp_add		= 16,
	-- hull_resist_thermal_add	= 16,

	-- mark					= 1,
	-- --shield_max_mul	=	0.3,
	-- --module_type				= ai.ModuleType.ARMOR_MOD,
	-- module_slot				= ai.SpaceShipModuleSlot.ARMOR_MOD_01,
	-- default_icon			= "ItemSubtype_CompositeArmor",
	-- item_subtype			= ItemSubtype.CompositeArmor,
	-- network_sync			= true,
-- }
-- Def.Armor_BR_Level2 =
-- {
	-- inherit					= "Armor_BR_Level1",

	-- storeItemId 			= 0,

	-- hull_resist_kinetic_add	= 17,
	-- hull_resist_emp_add		= 17,
	-- hull_resist_thermal_add	= 17,
	
	-- mark					= 3,
-- }
-- Def.Armor_BR_Level3 =
-- {
	-- inherit					= "Armor_BR_Level1",

	-- storeItemId 			= 0,

	-- hull_resist_kinetic_add	= 18,
	-- hull_resist_emp_add		= 18,
	-- hull_resist_thermal_add	= 18,
	
	-- mark					= 4,
-- }
-- Def.Armor_BR_Level4 =
-- {
	-- inherit					= "Armor_BR_Level1",

	-- storeItemId 			= 0,

	-- hull_resist_kinetic_add	= 19,
	-- hull_resist_emp_add		= 19,
	-- hull_resist_thermal_add	= 19,
	
	-- mark					= 5,
-- }

-- Расширители трюма
Def.Hold_BR_Level1 =
{
	class					= "SpaceShipModule",

	storeItemId 			= 0,

	cargo_hold_add			= 2,

	mark					= 1,
	--shield_max_mul	=	0.3,
	--module_type				= ai.ModuleType.ARMOR_MOD,
	module_slot				= ai.SpaceShipModuleSlot.ARMOR_MOD_02,
	default_icon			= "ItemSubtype_CargoExtender",
	item_subtype			= ItemSubtype.ExtendedHull,
	network_sync			= true,
	
	-- uiName 		= "Special_MicroWarp_Base",
	-- uiDesc 		= "Special_MicroWarp_Base_Desc",
}

Def.Hold_BR_Level2 =
{
	inherit					= "Hold_BR_Level1",

	storeItemId 			= 0,

	cargo_hold_add			= 4,
	mark					= 6,
}


Def.Hold_BR_Level3 =
{
	inherit					= "Hold_BR_Level1",

	storeItemId 			= 0,

	cargo_hold_add			= 6,
	mark					= 7,
}

Def.Hold_BR_Level4 =
{
	inherit					= "Hold_BR_Level1",

	storeItemId 			= 0,

	cargo_hold_add			= 8,
	mark					= 5,
}


-- Типы снарядов
Def.Projectile_BR_Kinetic =
{
    inherit = "Projectile_Nail_Iron",

	storeItemId 		= 0,

    mass    = 0.7,
}
Def.Projectile_BR_EMP =
{
    inherit = "Projectile_Plasma_Light",

	storeItemId 		= 0,

    mass    = 0.7,
}
Def.Projectile_BR_Thermal =
{
    inherit = "Projectile_Nail_Iron",

	storeItemId 		= 0,

    mass    = 0.7,
}


--Модуль для выбора орудия
Def.Weapon_Selector_BR_Gun2 =
{
	class               = "WeaponSelector",

	storeItemId 		= 0,

	weapon				= "Weapon_BR_Gun2",

	--module_slot			= ai.SpaceShipModuleSlot.ACTIVE_01,
	module_type			= ai.ModuleType.ACTIVE,

	network_sync 	    = true,

	activate_sound		= "sound/gadgets/common_activate",

	equip_sound			= "sound/gadgets2/LandingMultyPlatform/lmp_landing",

	unequip_sound		= "sound/gadgets2/LandingMultyPlatform/lmp_takeoff",
}

Def.Weapon_Selector_Railgun_Basic =
{
	inherit = "Weapon_Selector_BR_Gun2",
	mark = 4,
	weapon	= "Weapon_BR_Railgun_Basic",
	default_icon="ItemSubtype_RailgunBasic_5",
	--item_subtype			= ItemSubtype.RailgunBasic,
}

Def.Weapon_Selector_Plasmagun_Basic =
{
	inherit = "Weapon_Selector_BR_Gun2",
	mark = 3,
	weapon	= "Weapon_BR_Plasmagun_Basic",
	default_icon="ItemSubtype_PlasmagunBasic_4",
	--item_subtype			= ItemSubtype.RailgunBasic,
}

Def.Weapon_Selector_BR_Laser_Sniper =
{
	inherit = "Weapon_Selector_BR_Gun2",
	mark = 5,
	weapon				= "Weapon_BR_Laser_Sniper",
	default_icon="ItemSubtype_LaserSniper",

}

Def.Module_Disintegrator_BR =
{
	inherit = "Module_Disintegrator",

	storeItemId 		= 0,

	module_type			= ai.ModuleType.ACTIVE,

	network_sync 	    = true,

	ammo                = 10,
	ammo_regen_max		= 0,
	--ammo_regen_time		= 30,

	--projectile			= "Projectile_Disintegrator", -- прописано в def_extension.lua

	item_subtype=ItemSubtype.Disintegrator,
	energy_cost=110,
	cooldown=3,
	energy_cost_per_second=0,
	zoom_value=4,
	max_range=850,
	fire_rate=18,
	optimal_range=750,
	projectile_speed=980,
	damage_thermal=5600,
	damage_thermal=5600,
	spell_on_hit="SpellOnHit_Disintegrator_T1_Base",
	--module_type=ai.ModuleType.SPECIAL,
	class_mask=ai.ShipClass.LARGE,
	default_icon="ItemSubtype_Disintegrator",
	uiName="Special_Disintegrator_Base",
	uiDesc="Special_Disintegrator_Base_Desc",
}





Def.SpaceMissile_BR_Standart =
{
	--cant_be_bought		= true,
	storeItemId			= 0,
	rank				= 14,
	rank_min			= 13,
	rank_max			= 17,
	drop_amount_min		= 10,
	drop_amount_max		= 30,
	detonation_radius	= 2,
	speed 				= 146.05,
	max_range			= 528,
	cooldown			= 6,
	holder_size			= 6,
	empty_holder_cooldown=120,
	angular_velocity	= 50,
	capacity_mod		= 2,
	flare_size			= 4,
	flare_occl_size		= 1,
	flare_aspect		= 1,
	flare_angle			= 180,
	flare_warp			= 0.1,
	outdated			= true,
	rocket_class 		= ai.RocketClass.MEDIUM,
	class_mask			= ai.ShipClass.MEDIUM,
	inherit				= "Weapon_BaseRocket",
	default_icon		= "ItemSubtype_SpaceMissile_Standart",
	module_type			= ai.ModuleType.ROCKET,
	model				= "models/weapons/missile_rocket",
	item_subtype		= ItemSubtype.SpaceMissile_Standart,
	--MunitionBayType		= ai.MunitionBayType.MBT_SECONDARY,
	explosion_blast_wave= "BlastWave_SM_Standart_T5_Prem",
	is_guided			= true,
	uiName				= "SpaceMissile_Standart_Prem",
	uiDesc				= "SpaceMissile_Standart_Prem_Desc",
}

Def.ActiveModule_BR_IonRay =
{
	inherit = "Module_IonRay_T5_Mk1",
	
	storeItemId = 0,

	--network_sync 	    = true,
	--[[
	class				= "ActiveModule",
	cooldown			= 46,
	energy_cost			= 95,
	spell				= "IonRay_T1_Rel",
	additional_spell	= "ECMCommon",
	model				= "models/modules/m_active/m_a_gadget_beamer",
	module_type			= ai.ModuleType.ACTIVE,
	default_icon		= "ItemSubtype_IonRay",
	item_subtype		= ItemSubtype.IonRay,
	influence_type_color= InfluenceTypeColor.DEBUFF_STAT,]]
}

Spell.BR_ReloadAmmo =
{	
	aura				= ai.Aura.SLOW_MOVEMENT,
	target				= ai.SpellTarget.CASTER,
	aura_param			= 1.0,

	dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	isBuff				= false,
	hud_visible			= false,

	aura_sound 			= "sound/aura/heal",

	gameplay_specific	= true,

	additional_auras = 
	{
		{
			aura				= ai.Aura.DISABLE_BOOST,
			target				= ai.SpellTarget.CASTER,
			dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			isBuff				= false,
			hud_visible			= false,
			gameplay_specific	= true,
		},
		{
			aura				= ai.Aura.DISABLED_WEAPON,
			target				= ai.SpellTarget.CASTER,
			dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			isBuff				= false,
			hud_visible			= false,
			gameplay_specific	= true,
		}
	}
}

-- Spell.BR_ShieldBoosterPreparing =
-- {	
	-- aura				= ai.Aura.SLOW_MOVEMENT,
	-- target				= ai.SpellTarget.CASTER,
	-- aura_param			= 3,

	-- dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	-- isBuff				= false,
	-- hud_visible			= false,
	-- gameplay_specific	= true,

	-- aura_sound 		= "sound/aura/heal",
	-- --aura_end_sound	= "sound/gadgets/timeboost_end",

	-- aura_fx 		= "particles/gadget/matter_absorber",

	-- additional_auras = 
	-- {
		-- {
			-- aura				= ai.Aura.DISABLE_BOOST,
			-- target				= ai.SpellTarget.CASTER,
			-- dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			-- isBuff				= false,
			-- hud_visible			= false,
			-- gameplay_specific	= true,
		-- },
	-- }
-- }


Spell.BR_UseConsumable =
{	
	aura				= ai.Aura.SLOW_MOVEMENT,
	target				= ai.SpellTarget.CASTER,
	aura_param			= 1.5,

	dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	isBuff				= false,
	hud_visible			= false,
	gameplay_specific	= true,

	aura_sound 		= "sound/aura/heal",
	--aura_end_sound	= "sound/gadgets/timeboost_end",

	--aura_fx 		= "particles/gadget/matter_absorber",
	aura_fx				= "particles/gadget/hull_heal",

	additional_auras = 
	{
		{
			aura				= ai.Aura.DISABLE_BOOST,
			target				= ai.SpellTarget.CASTER,
			dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			isBuff				= false,
			hud_visible			= false,
			gameplay_specific	= true,
		},
	}
}

-- Расходники
-- Восстанавливает щит
Spell.BR_ShieldBoosterSmall =
{
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.HEAL_SHIELD,
	influence_param		= 2000,

	--cast_sound			= "sound/gadgets/timeboost_end",
	influence_sound		= "sound/gadgets/IsotopeHarvester/sphere_explosion",

	cast_fx				= "particles/gadget/shield_boost",

	gameplay_specific   = true,
}


-- Восстанавливает щит
Spell.BR_ShieldBoosterLarge =
{
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.HEAL_SHIELD,
	influence_param		= 5000,

	influence_sound		= "sound/gadgets/IsotopeHarvester/sphere_explosion",

	cast_fx				= "particles/gadget/shield_boost",

	gameplay_specific   = true,
}


-- Восстанавливает корпус.
Spell.BR_MedKitSmall =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.HEAL_HULL,
	influence_param = 2000,

	influence_sound = "sound/gadgets/IsotopeHarvester/sphere_explosion",

	cast_fx			= "particles/gadget/aura_wave",
}

-- Восстанавливает корпус.
Spell.BR_MedKitLarge =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.HEAL_HULL,
	influence_param = 5000,

	influence_sound = "sound/gadgets/IsotopeHarvester/sphere_explosion",

	cast_fx			= "particles/gadget/aura_wave",
}

-- Объект из этого дефа не создается, деф используется лишь как обертка
Def.CargoItem_BR_ShieldBoosterSmall =
{
	class = "BaseEntity",
	
	influence_type_color = InfluenceTypeColor.REPAIR_SHIELD,

	spell = "BR_ShieldBoosterSmall",
	is_cargo_item = true,
	max_stacks = 6,
	activation_time = 2,
	activation_spell = "BR_UseConsumable",
	can_be_activated = true,
	default_icon		= "ItemSubtype_ShieldRestoreSmall",
	
	uiName 		= "itemSubType_ShieldRestoreSmall",
	uiDesc 		= "itemSubType_ShieldRestoreSmall_desc",
}


-- Объект из этого дефа не создается, деф используется лишь как обертка
Def.CargoItem_BR_ShieldBoosterLarge =
{
	class = "BaseEntity",
	
	influence_type_color = InfluenceTypeColor.REPAIR_SHIELD,

	spell = "BR_ShieldBoosterLarge",
	is_cargo_item = true,
	max_stacks = 2,
	activation_time = 4,
	activation_spell = "BR_UseConsumable",
	can_be_activated = true,
	default_icon		= "ItemSubtype_ShieldRestoreLarge",
	
	uiName 		= "itemSubType_ShieldRestoreLarge",
	uiDesc 		= "itemSubType_ShieldRestoreLarge_desc",
}


-- Объект из этого дефа не создается, деф используется лишь как обертка
Def.CargoItem_BR_MedKitSmall =
{
	class				= "BaseEntity",
	
	influence_type_color = InfluenceTypeColor.REPAIR_HULL,

	spell				= "BR_MedKitSmall",
	is_cargo_item		= true,
	max_stacks			= 6,
	activation_time		= 2,
	activation_spell	= "BR_UseConsumable",
	can_be_activated	= true,
	default_icon		= "ItemSubtype_RepairDronesSmall",
	
	uiName 		= "itemSubType_RepairDronesSmall",
	uiDesc 		= "itemSubType_RepairDronesSmall_desc",
}


-- Объект из этого дефа не создается, деф используется лишь как обертка
Def.CargoItem_BR_MedKitLarge =
{
	class				= "BaseEntity",
	
	influence_type_color = InfluenceTypeColor.REPAIR_HULL,

	spell				= "BR_MedKitLarge",
	is_cargo_item		= true,
	max_stacks			= 2,
	activation_time		= 4,
	activation_spell	= "BR_UseConsumable",
	can_be_activated	= true,
	default_icon		= "ItemSubtype_RepairDronesLarge",
	
	uiName 		= "itemSubType_RepairDronesLarge",
	uiDesc 		= "itemSubType_RepairDronesLarge_desc",
}


-- Объект из этого дефа не создается, деф используется лишь как обертка
Def.CargoItem_BR_Proj_Kinetic =
{
	class				= "BaseEntity",

	projectile			= "Projectile_BR_Kinetic",
	mark = 4,
	is_cargo_item		= true,
	max_stacks			= 80,
	pack_size			= 80, -- размер пакета. В ящиках указывается количество пакетов. Игрок может брать из ящика и выбрасывать из трюма по одному пакету
	activation_time		= 2,
	can_be_activated	= true,
	activation_spell	= "BR_ReloadAmmo",
	default_icon		= "ItemSubtype_RailUp1",
	uiName 				= "itemSubType_RailUp1",
}
Def.CargoItem_BR_Proj_EMP =
{
	class				= "BaseEntity",

	projectile			= "Projectile_BR_EMP",
	mark = 3,
	is_cargo_item		= true,
	max_stacks			= 100,
	pack_size			= 100, -- размер пакета. В ящиках указывается количество пакетов. Игрок может брать из ящика и выбрасывать из трюма по одному пакету
	activation_time		= 3,
	can_be_activated	= true,
	activation_spell	= "BR_ReloadAmmo",
	default_icon		= "ItemSubtype_PlasmaUp1",
	uiName 				= "itemSubType_PlasmaUp1",
}
Def.CargoItem_BR_Proj_Thermal =
{
	class				= "BaseEntity",
	mark = 5,
	projectile			= "Projectile_BR_Thermal",	
	is_cargo_item		= true,
	max_stacks			= 150,
	pack_size			= 150,
	activation_time		= 4,
	can_be_activated	= true,
	activation_spell	= "BR_ReloadAmmo",
	default_icon		= "ItemSubtype_LaserUp1",
	uiName 				= "itemSubType_LaserUp1",
}


-- Объект из этого дефа не создается, деф используется лишь как обертка
Def.CargoItem_BR_Proj_Disintegrator =
{
	class				= "BaseEntity",

	projectile			= "Projectile_Disintegrator",	
	is_cargo_item		= true,
	max_stacks			= 80,
	pack_size			= 10,
	activation_time		= 3,
	can_be_activated	= true,
	activation_spell	= "BR_ReloadAmmo",
	default_icon		= "ItemSubtype_SpaceMissile_Nuke",
}





Def.LootCrate_Gun =
{
	inherit 			= "LootCrate_Static",
	model				= "models/objects/gameplay/loot_box/loot_box",
	--loot_table	= "OW_T3_Junk",
	loot_defs		= { "Weapon_BR_Gun2", },

	loot_param		= 15, -- ammo
	--model		= "models/objects/gameplay/loot_debris/loot_debris01",
	--model          =   "models/modules/cloaking_field_generator/cloaking_field_generator",
	--model           = "models/shields/shield_cover",
	--model   = "models/objects/asteroids/asteroid_set_01",
	uiName		= "LootCrate_T1",

	--module_slot		= ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01,

	children =
	{
		--{ effect = "particles/objects/bonuses/hg/hg_bonus_orange", joint = "joint3" },
		{ effect = "particles/objects/bonuses/hg/hg_bonus_orange_sphere", joint = "root3" },
	}
}

Def.LootCrate_Laser_Sniper_T1_Mk1 =
{
	inherit 		= "LootCrate_Static",
	model			= "models/objects/gameplay/loot_box/loot_box",
	--loot_table	= "OW_T3_Junk",
	loot_defs		= { "Weapon_BR_Laser_Sniper", },
	--model		= "models/objects/gameplay/loot_debris/loot_debris01",
	--model          =   "models/modules/cloaking_field_generator/cloaking_field_generator",
	--model           = "models/shields/shield_cover",
	--model   = "models/objects/asteroids/asteroid_set_01",
	uiName			= "LootCrate_T1",

	--module_slot		= ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01,

	children =
	{
		--{ effect = "particles/objects/bonuses/hg/hg_bonus_orange", joint = "joint3" },
		{ effect = "particles/objects/bonuses/hg/hg_bonus_orange_sphere", joint = "root3" },
	}
}


Def.LootCrate_Rocket =
{
	inherit 		= "LootCrate_Static",
	loot_defs		= { "SpaceMissile_BR_Standart", },
	uiName		= "LootCrate_T1",

	children =
	{
		--{ effect = "particles/objects/bonuses/hg/hg_bonus_orange", joint = "joint3" },
		{ effect = "particles/objects/bonuses/hg/hg_bonus_orange_sphere", joint = "root3" },
	}
}


Def.LootCrate_Module =
{
	inherit 		= "LootCrate_Static",
	loot_defs		= { "ActiveModule_BR_IonRay", },
	uiName			= "LootCrate_T1",

	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_cyan_sphere", joint = "root3" },
	}
}

Def.LootCrate_BR_ShieldLevel1 =
{
	inherit 		= "LootCrate_Static",
	loot_defs		= { "Shield_BR_Level1", },
	uiName			= "LootCrate_T1",
	default_icon	= "ItemSubtype_ShieldExtender",
	--[[children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_cyan_sphere", joint = "root3" },
	}]]
}

Def.LootCrate_BR_ShieldLevel2 =
{
	inherit 		= "LootCrate_Static",
	loot_defs		= { "Shield_BR_Level2", },
	uiName			= "LootCrate_T1",
	default_icon	= "ItemSubtype_ShieldExtender",
}

Def.LootCrate_BR_ShieldLevel3 =
{
	inherit 		= "LootCrate_Static",
	loot_defs		= { "Shield_BR_Level3", },
	uiName			= "LootCrate_T1",
	default_icon	= "ItemSubtype_ShieldExtender",
}


Def.LootCrate_BR_Armor1 =
{
	inherit 		= "LootCrate_Static",
	loot_defs		= { "Armor_BR_Level1", },
	uiName			= "LootCrate_T1",
	default_icon	= "ItemSubtype_CompositeArmor",
}


Def.LootCrate_BR_Hold1 =
{
	inherit 		= "LootCrate_Static",
	loot_defs		= { "Hold_BR_Level1", },
	uiName			= "LootCrate_T1",
	default_icon	= "ItemSubtype_CargoExtender",
}


Def.LootCrate_BR_ShieldBoosterSmall =
{
	inherit 	= "LootCrate_Static",
	loot_defs	= { "CargoItem_BR_ShieldBoosterSmall", },
	uiName		= "LootCrate_T1",
	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
	}
}


Def.LootCrate_BR_MedKitSmall =
{
	inherit 	= "LootCrate_Static",
	loot_defs	= { "CargoItem_BR_MedKitSmall", },
	uiName		= "LootCrate_T1",

	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
	}
}


Def.LootCrate_BR_MedKitLarge =
{
	inherit 	= "LootCrate_Static",
	loot_defs	= { "CargoItem_BR_MedKitLarge", },
	uiName		= "LootCrate_T1",

	
	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
	}
}


Def.LootCrate_BR_Projectiles =
{
	inherit 	= "LootCrate_Static",
	loot_defs	= { "CargoItem_BR_Proj_Kinetic", },
	uiName		= "LootCrate_T1",

	amount		= 20,

	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
	}
}

Def.LootCrate_BR_LaserSniper_Projectiles =
{
	inherit 	= "LootCrate_Static",
	loot_defs	= { "CargoItem_BR_Proj_Thermal", },
	uiName		= "LootCrate_T1",

	amount		= 20,

	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
	}
}

Def.MultipleLootCrate_Static =
{
	class = "MultipleLootCrate",
	in_editor = false,
	model = "models/misc/cube4m",
	physics = { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 100, },

	interaction_distance = 30.0,
	interacting_fx = "particles/ships/looting",
	interacting_success_fx = "particles/ships/looted",

	max_detection_distance = 200.0,
	vision_radius_coef = 0.5,
	glow_effect = "particles/other/loot_highlight",

	loot_table = "TestLootTable",

	glare_color = 3,

	uiName = "LootCrate",
	hudType = "loot_crate",
	model = "models/objects/gameplay/loot_box/loot_box",
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	uiName = "LootCrate_LootBox",
}

Def.MultipleLootCrate_Test =
{
	inherit 	= "MultipleLootCrate_Static",
	loot_defs	= {
		
		{ item = "CargoItem_BR_ShieldBoosterSmall", amount = 7, },
		{ item = "CargoItem_BR_ShieldBoosterLarge", amount = 4, },
		{ item = "CargoItem_BR_MedKitSmall", amount = 3 },
		{ item = "CargoItem_BR_MedKitLarge", amount = 1 },		
		{ item = "Shield_BR_Level1", amount = 3, param = 9000 },
		{ item = "Shield_BR_Level2", amount = 3, param = 9000 },
		{ item = "Shield_BR_Level3", amount = 3, param = 9000 },		
		{ item = "Hold_BR_Level1", amount = 1, },
		{ item = "Hold_BR_Level2", amount = 1, },
		{ item = "Hold_BR_Level3", amount = 1, },
		{ item = "CargoItem_BR_Proj_Kinetic", amount = 500 },		
		{ item = "CargoItem_BR_Proj_Disintegrator", amount = 50 },
		{ item = "CargoItem_BR_Proj_Thermal", amount = 500 },
		{ item = "CargoItem_BR_Proj_EMP", amount = 500 },
		--{ item = "Weapon_BR_Railgun_Basic", amount = 1, param = 12 },
		--{ item = "Weapon_Selector_BR_Gun2", amount = 2, param = 12, },
		{ item = "Weapon_Selector_Railgun_Basic", amount = 1, },
		{ item = "Weapon_Selector_Plasmagun_Basic", amount = 1, },
		{ item = "Weapon_Selector_BR_Laser_Sniper", amount = 1, },		
		{ item = "Module_Disintegrator_BR", amount = 2, param = 2, },

	},
	uiName		= "LootCrate_T3_Junk",

	amount		= 20,

	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
	}
}

Def.MultipleLootCrate_TestSmall =
{
	inherit 	= "MultipleLootCrate_Static",
	loot_defs	= {
		{ item = "Shield_BR_Level1", amount = 3 },
	},
	uiName		= "LootCrate_T3_Junk",

	amount		= 20,

	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
	}
}

Def.LootCrate_BR_PlayerModuleLootDrop =
{
	inherit 	= "LootCrate_Dynamic",
	in_editor	= false,
	damageable  = false,
	use_loot_param = true,
}


Def.MultipleLootCrate_PlayerLootDrop =
{
	inherit 	= "MultipleLootCrate_Static",

	uiName		= "LootCrate_T3_Junk",

	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
	},
}

Def.MultipleLootCrate_Loot =
{
	inherit 	= "MultipleLootCrate_Static",
	uiName		= "LootCrate_T3",

	children =
	{
		{ effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
	}
}


Def.BR_ResurrectionBeacon =
{
	class 		= "ResurrectionBeacon",
	model		= "models/objects/vital_point/beacon/beacon",

	physics			= { solid_type = solid.compound_model, static = true },

	maxViewDist		= 5000,

	resurrection_sound	= "sound/dreadnought/big_cannon_charge",
	resurrect_sound		= "sound/dreadnought/big_cannon_fire",

	resurrection_beam_effect = "particles/other/dreadnought_plasma_beam",
	--death_sound		= "sound/game/vitalpoint_down",

	uiName  		= "VitalPoint",
	hudType			= "bomb_site",
	vision_always	= true,
}
