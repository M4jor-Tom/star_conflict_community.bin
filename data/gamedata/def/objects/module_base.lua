--################################################# MISC #################################################--

Def.OW_BasePart =
{
	as_world				= true,
	class					= "ScBaseEntity",
	base_type				= ai.BaseSlotType.BASE,
	in_editor				= true,
	damageable				= false,
	maxViewDist				= 5000,
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model					= "models/objects/constructor/empire/constructor_emp_central",
	
    uiName					= "station_EMPIRE",
    
	appearance_time			= 3,
	
    death_effect	        = "particles/explosions/objects/explosion_big",
	death_sound             = "sound/explosion/ship_big_expl",
	
	slot_bones = 
	{
		--[ ai.BaseSlot.BASE_01 ]		= "link1",
		--[ ai.BaseSlot.BASE_02 ]		= "link2",
	},
}

Def.OW_BasePart_Prec =
{
	inherit					= "OW_BasePart",
    death_effect	        = "particles/explosions/alien_explosion_huge_01",
}

Def.OW_BaseWeapon_Rocket =
{
	inherit					= "Turret_RocketGun",
	base_type				= ai.BaseSlotType.GUN,
	in_editor				= false,
	
	health 					= 30000*3,
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 20.0,
	dispersion				= 1.0,
	max_range				= 300,
	max_rot_speed			= 40,
	
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 0,
}

Def.OW_BaseWeapon_Rocket_Thermal =
{
	inherit					= "OW_BaseWeapon_Rocket",
	damage_thermal			= 2000*1.5,
}

Def.OW_BaseWeapon_Rocket_Emp =
{
	inherit					= "OW_BaseWeapon_Rocket",
	damage_emp				= 1800*1.5,
}

Def.OW_BaseWeapon_Turret =
{
	inherit					= "Turret_FlakGun",
	base_type				= ai.BaseSlotType.GUN,
	in_editor				= false,
	
	health 					= 20000*3,
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 200.0,
	dispersion				= 1.5, -- deg
	max_range				= 150,
	max_rot_speed			= 90,	-- deg per second
	
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 0,
}

Def.OW_BaseWeapon_Rail =
{
	inherit					= "OW_BaseWeapon_Turret",
	damage_kinetic			= 500*1.5,
}

Def.OW_BaseWeapon_Emp =
{
	inherit					= "OW_BaseWeapon_Turret",
	damage_emp				= 750*1.5,
}

Def.OW_BaseWarp = 
{
	as_world				= true,
	class					= "ScBaseEntity",
	base_type				= ai.BaseSlotType.WARP,
	in_editor				= false,
	damageable				= false,
	maxViewDist				= 5000,
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model					= "models/objects/jump_gates/mediumwarpgate_imper/mediumwarpgate_imper",
	
	work_sound				= "sound/gadgets/warpgate/wg_work_loop", 
    
	appearance_time			= 3,
	
    death_effect	        = "particles/explosions/shp_exp_big_02",
	death_sound             = "sound/explosion/ship_big_expl",
}

--################################################# EMPIRE #################################################--

Def.OW_BaseWeapon_Rocket_Emp =
{
	inherit				= "OW_BaseWeapon_Rocket_Thermal",
	uiName				= "PoliceRocketTurret",
	model				= "models/turret/rocket_launcher/rocket_launcher_2",
}

Def.OW_BaseWeapon_Rail_Emp =
{
	inherit				= "OW_BaseWeapon_Rail",
	uiName				= "PoliceTurret",
	model				= "models/turret/round_railgun01/round_railgun01",
}

Def.OW_BasePart_Central_Emp = 
{
	inherit				= "OW_BasePart",
	vision_always 		= true,
	hud_ico				= "hud_police_icon",
	hudType				= "default",
	uiName				= "station_EMPIRE",
    model				= "models/objects/constructor/empire/constructor_emp_central",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
 		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
		[ ai.BaseSlot.GUN_01 ]		= "gun1",
		[ ai.BaseSlot.GUN_02 ]		= "gun2",
		[ ai.BaseSlot.GUN_03 ]		= "gun3",
		[ ai.BaseSlot.GUN_04 ]		= "gun4",
		[ ai.BaseSlot.GATE_01 ]		= "gate1",
		[ ai.BaseSlot.GATE_02 ]		= "gate2",
	},
}

Def.OW_BasePart_Antena_Emp = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UTILITY,
    model				= "models/objects/constructor/empire/constructor_emp_antena",
    death_effect	    = "particles/explosions/shp_exp_big_02",
}

Def.OW_BasePart_Attacking01_Emp = 
{
	inherit				= "OW_BasePart",
	uiName				= "station_EMPIRE",
	model				= "models/objects/constructor/empire/constructor_emp_attacking",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.GUN_01 ]		= "gun1",
		[ ai.BaseSlot.GUN_02 ]		= "gun2",
		[ ai.BaseSlot.GUN_03 ]		= "gun3",
		[ ai.BaseSlot.GUN_04 ]		= "gun4",
	},
}

Def.OW_BasePart_Attacking02_Emp = 
{
	inherit				= "OW_BasePart",
	uiName				= "station_EMPIRE",
    model				= "models/objects/constructor/empire/constructor_emp_attacking_02",
    death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.GUN_01 ]		= "gun1",
		[ ai.BaseSlot.GUN_02 ]		= "gun2",
		[ ai.BaseSlot.GUN_03 ]		= "gun3",
		[ ai.BaseSlot.GUN_04 ]		= "gun4",
	},
	physics				= { solid_type = solid.model, },
}

Def.OW_BasePart_Bridge01_Emp = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/empire/constructor_emp_bridge_01",
    death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.WARP_01 ]	= "link1",
	},
}

Def.OW_BasePart_Bridge02_Emp = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UPLINK,
    model				= "models/objects/constructor/empire/constructor_emp_bridge_02",
    death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
	},
}

Def.OW_BasePart_Factory01_Emp = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/empire/constructor_emp_factory",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

-- Больше подходит как финальный декор, лучше x2
Def.OW_BasePart_Factory02_Emp = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/empire/constructor_emp_factory_2",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Flag_Emp = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UTILITY,
    model				= "models/objects/constructor/empire/constructor_emp_flag",
    death_effect	    = "particles/explosions/shp_exp_big_02",
	physics				= { solid_type = solid.model, },
}

Def.OW_BasePart_Hangar_Emp = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/empire/constructor_emp_hangar",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.GATE_01 ]		= "gate1",
		[ ai.BaseSlot.GATE_02 ]		= "gate3",
		[ ai.BaseSlot.GATE_03 ]		= "gate4",
	},
}

Def.OW_BasePart_Livebase01_Emp = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/empire/constructor_emp_livebase",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.GATE_01 ]		= "gate1",
	},
}

Def.OW_BasePart_Livebase02_Emp = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/empire/constructor_emp_livebase2",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Livebase03_Emp = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/empire/constructor_emp_livebase3",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Livebase04_Emp = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/empire/constructor_emp_livebase4",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Livebase05_Emp = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/empire/constructor_emp_livebase5",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
	physics = { solid_type = solid.model, },
}

Def.OW_BasePart_Livebase06_Emp = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/empire/constructor_emp_livebase6",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
	physics				= { solid_type = solid.model, },
}

Def.OW_BasePart_Platform01_Emp = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/empire/constructor_emp_platform",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
 		[ ai.BaseSlot.LOOT_01 ]     = "loot",
	},
}

Def.OW_BasePart_Platform02_Emp = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/empire/constructor_emp_platform_02",
    death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
 		[ ai.BaseSlot.LOOT_01 ]     = "loot",
	},
}

Def.OW_BasePart_Repair_Emp = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/empire/constructor_emp_repair",
    death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link2",
 		[ ai.BaseSlot.UTILITY_01 ]	= "unit1",
	},
}

Def.OW_BasePart_BridgeBase_Emp = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UPLINK,
    model				= "models/objects/constructor/empire/constructor_emp_bridgebase",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.GATE_01 ]		= "gate1",
		[ ai.BaseSlot.GATE_02 ]		= "gate2",
		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
	},
}

Def.OW_BasePart_BaseWarp_Emp = 
{
	inherit					= "OW_BaseWarp",

	base_type				= ai.BaseSlotType.WARP,
	model					= "models/objects/jump_gates/big_jumpgate/big_jumpgate_empire_02",

}

--################################################# PIRATE #################################################--

Def.OW_BaseWeapon_Rocket_Pir =
{
	inherit				= "OW_BaseWeapon_Rocket_Emp",
	uiName				= "PirateTurret",
	model				= "models/turret/rocket_launcher/rocket_launcher_pirate_2",
}

Def.OW_BaseWeapon_Rail_Pir =
{
	inherit				= "OW_BaseWeapon_Rail_Emp",
	uiName				= "PirateTurret",
	model				= "models/turret/round_railgun01/round_railgun01",
}

Def.OW_BasePart_Central_Pir = 
{
	inherit				= "OW_BasePart_Central_Emp",
	hud_ico				= "hud_police_icon",
	uiName				= "EventPirateBase_a",
	model				= "models/objects/constructor/pirate/constructor_pirate_central",
}

Def.OW_BasePart_Antena_Pir = 
{
	inherit				= "OW_BasePart_Antena_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_antena",
}

Def.OW_BasePart_Attacking01_Pir = 
{
	inherit				= "OW_BasePart_Attacking01_Emp",
	uiName				= "EventPirateBase_a",
	model				= "models/objects/constructor/pirate/constructor_pirate_attacking",
}

Def.OW_BasePart_Attacking02_Pir = 
{
	inherit				= "OW_BasePart_Attacking02_Emp",
	uiName				= "EventPirateBase_a",
	model				= "models/objects/constructor/pirate/constructor_pirate_attacking_02",
}

Def.OW_BasePart_Bridge01_Pir = 
{
	inherit				= "OW_BasePart_Bridge01_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_bridge_01",
}

Def.OW_BasePart_Bridge02_Pir = 
{
	inherit				= "OW_BasePart_Bridge02_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_bridge_02",
}

Def.OW_BasePart_Factory01_Pir = 
{
	inherit				= "OW_BasePart_Factory01_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_factory",
}

Def.OW_BasePart_Factory02_Pir = 
{
	inherit				= "OW_BasePart_Factory02_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_factory_2",
}

Def.OW_BasePart_Flag_Pir = 
{
	inherit				= "OW_BasePart_Flag_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_flag",
}

Def.OW_BasePart_Hangar_Pir = 
{
	inherit				= "OW_BasePart_Hangar_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_hangar",
}

Def.OW_BasePart_Livebase01_Pir = 
{
	inherit				= "OW_BasePart_Livebase01_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_livebase",
}

Def.OW_BasePart_Livebase02_Pir = 
{
	inherit				= "OW_BasePart_Livebase02_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_livebase2",
}

Def.OW_BasePart_Livebase03_Pir = 
{
	inherit				= "OW_BasePart_Livebase03_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_livebase3",
}

Def.OW_BasePart_Livebase04_Pir = 
{
	inherit				= "OW_BasePart_Livebase04_Emp",
    model				= "models/objects/constructor/pirate/constructor_pirate_livebase4",
}

Def.OW_BasePart_Livebase05_Pir = 
{
	inherit				= "OW_BasePart_Livebase05_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_livebase5",
}

Def.OW_BasePart_Livebase06_Pir = 
{
	inherit				= "OW_BasePart_Livebase06_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_livebase6",
}

Def.OW_BasePart_Platform01_Pir = 
{
	inherit				= "OW_BasePart_Platform01_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_platform",
}

Def.OW_BasePart_Platform02_Pir = 
{
	inherit				= "OW_BasePart_Platform02_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_platform_02",
}

Def.OW_BasePart_Repair_Pir = 
{
	inherit				= "OW_BasePart_Repair_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_repair",
}

Def.OW_BasePart_BridgeBase_Pir = 
{
	inherit				= "OW_BasePart_BridgeBase_Emp",
	model				= "models/objects/constructor/pirate/constructor_pirate_bridgebase",
}

Def.OW_BasePart_BaseWarp_Pir = 
{
	inherit					= "OW_BasePart_BaseWarp_Emp",
}

--################################################# FEDERATION #################################################--

Def.OW_BaseWeapon_Rocket_Fed =
{
	inherit				= "OW_BaseWeapon_Rocket_Thermal",
	uiName				= "PoliceRocketTurret",
	model				= "models/turret/rocket_launcher/rocket_launcher_2",
}

Def.OW_BaseWeapon_Rail_Fed =
{
	inherit				= "OW_BaseWeapon_Rail",
	uiName				= "PoliceTurret",
	model				= "models/turret/round_railgun01/round_railgun01",
}

Def.OW_BasePart_Central_Fed = 
{
	inherit				= "OW_BasePart",
	vision_always 		= true,
	hud_ico				= "hud_police_icon",
	hudType				= "default",
	uiName				= "station_FEDERATION",
    model				= "models/objects/constructor/federation/constructor_fed_central",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
 		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
		[ ai.BaseSlot.GUN_01 ]		= "gun1",
		[ ai.BaseSlot.GUN_02 ]		= "gun2",
		[ ai.BaseSlot.GUN_03 ]		= "gun3",
		[ ai.BaseSlot.GUN_04 ]		= "gun4",
		[ ai.BaseSlot.GATE_01 ]		= "gate1",
	},
}

Def.OW_BasePart_Antena_Fed = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UTILITY,
    model				= "models/objects/constructor/federation/constructor_fed_antena",
    death_effect	    = "particles/explosions/shp_exp_big_02",
}

Def.OW_BasePart_Attacking01_Fed = 
{
	inherit				= "OW_BasePart",
	uiName				= "station_FEDERATION",
	model				= "models/objects/constructor/federation/constructor_fed_attacking_01",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.GUN_01 ]		= "gun1",
		[ ai.BaseSlot.GUN_02 ]		= "gun2",
		[ ai.BaseSlot.GUN_03 ]		= "gun3",
		[ ai.BaseSlot.GUN_04 ]		= "gun4",
		[ ai.BaseSlot.GUN_05 ]		= "gun5",
		[ ai.BaseSlot.GUN_06 ]		= "gun6",
		[ ai.BaseSlot.GUN_07 ]		= "gun7",
		[ ai.BaseSlot.GUN_08 ]		= "gun8",
	},
}

Def.OW_BasePart_Bridge01_Fed = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/federation/constructor_fed_bridge_01",
    death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.WARP_01 ]	= "link1",
	},
}

Def.OW_BasePart_Bridge02_Fed = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/federation/constructor_fed_bridge_02",
    
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
	},
}

Def.OW_BasePart_Bridge03_Fed = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UPLINK,
    model				= "models/objects/constructor/federation/constructor_fed_bridge_03",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
	},
}

Def.OW_BasePart_Bridge04_Fed = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UPLINK,
    model				= "models/objects/constructor/federation/constructor_fed_bridge_04",
	death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
	},
}

Def.OW_BasePart_Bridge05_Fed = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UPLINK,
    model				= "models/objects/constructor/federation/constructor_fed_h_03",
	death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.UPLINK_01 ]	= "link1",
	},
}

Def.OW_BasePart_Factory01_Fed = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/federation/constructor_fed_factory_01",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Factory02_Fed = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/federation/constructor_fed_factory_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Flag_Fed = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UTILITY,
    model				= "models/objects/constructor/federation/constructor_fed_flag",
    death_effect	    = "particles/explosions/shp_exp_big_02",
}

Def.OW_BasePart_Hangar_Fed = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/federation/constructor_fed_hangar",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.GATE_01 ]		= "gate1",
	},
}

Def.OW_BasePart_Livebase01_Fed = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/federation/constructor_fed_h_01",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Livebase02_Fed = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/federation/constructor_fed_h_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Livebase03_Fed = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/federation/constructor_fed_h_03",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Platform01_Fed = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/federation/constructor_fed_platform_02",
	death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
 		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
	},
}

Def.OW_BasePart_Repair_Fed = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/federation/constructor_fed_repair",

	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
 		[ ai.BaseSlot.UTILITY_01 ]	= "flag",
	},
}

Def.OW_BasePart_BaseWarp_Fed = 
{
	inherit					= "OW_BaseWarp",

	base_type				= ai.BaseSlotType.WARP,
	model					= "models/objects/constructor/federation/constructor_fed_gate",
	
	--work_sound				= "sound/gadgets/warpgate/wg_work_loop", 
	
}

--################################################# JERICHO #################################################--

Def.OW_BaseWeapon_Rocket_Jer =
{
	inherit				= "OW_BaseWeapon_Rocket_Thermal",
	uiName				= "PoliceRocketTurret",
	model				= "models/turret/rocket_launcher/rocket_launcher_2",
}

Def.OW_BaseWeapon_Rail_Jer =
{
	inherit				= "OW_BaseWeapon_Rail",
	uiName				= "PoliceTurret",
	model				= "models/turret/round_railgun01/round_railgun01",
}

Def.OW_BasePart_Central_Jer = 
{
	inherit				= "OW_BasePart",
	vision_always 		= true,
	hud_ico				= "hud_police_icon",
	hudType				= "default",
	uiName				= "station_JERICHO",
    model				= "models/objects/constructor/jericho/constructor_jer_central",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.GUN_01 ]		= "gun1",
		[ ai.BaseSlot.GUN_02 ]		= "gun2",
		[ ai.BaseSlot.GUN_03 ]		= "gun3",
		[ ai.BaseSlot.GUN_04 ]		= "gun4",
	},
}

Def.OW_BasePart_Antena_Jer = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UTILITY,
    model				= "models/objects/constructor/jericho/constructor_jer_antena",
    death_effect	    = "particles/explosions/shp_exp_big_02",
}

Def.OW_BasePart_Attacking01_Jer = 
{
	inherit				= "OW_BasePart",
	uiName				= "station_JERICHO",
	model				= "models/objects/constructor/jericho/constructor_jer_attacking",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.GUN_01 ]		= "gun1",
		[ ai.BaseSlot.GUN_02 ]		= "gun2",
		[ ai.BaseSlot.GUN_03 ]		= "gun3",
		[ ai.BaseSlot.GUN_04 ]		= "gun4",
		[ ai.BaseSlot.GUN_05 ]		= "gun5",
		[ ai.BaseSlot.GUN_06 ]		= "gun6",
		[ ai.BaseSlot.GUN_07 ]		= "gun7",
		[ ai.BaseSlot.GUN_08 ]		= "gun8",
	},
}

Def.OW_BasePart_Bridge01_Jer = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/jericho/constructor_jer_bridge_01",
	
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
	},
}

Def.OW_BasePart_Bridge02_Jer = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UPLINK,
    model				= "models/objects/constructor/jericho/constructor_jer_bridge_02",
    death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
	},
	physics				= { solid_type = solid.model, },
}

Def.OW_BasePart_Bridge03_Jer = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/jericho/constructor_jer_bridge_03",
    death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
	physics				= { solid_type = solid.model, },
}

Def.OW_BasePart_Bridge04_Jer = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/jericho/constructor_jer_bridge_04",
	death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.WARP_01 ]	= "link1",
	},
}

Def.OW_BasePart_Bridge05_Jer = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UPLINK,
    model				= "models/objects/constructor/jericho/constructor_jer_bridge_05",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
		[ ai.BaseSlot.BASE_04 ]		= "link4",
		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
	},
}

Def.OW_BasePart_Factory01_Jer = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/jericho/constructor_jer_factory_01",
	death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Factory02_Jer = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/jericho/constructor_jer_factory_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Flag_Jer = 
{
	inherit				= "OW_BasePart",
	base_type			= ai.BaseSlotType.UTILITY,
    model				= "models/objects/constructor/jericho/constructor_jer_flag",
    death_effect	    = "particles/explosions/shp_exp_big_02",
}

Def.OW_BasePart_Hangar_Jer = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/jericho/constructor_jer_hangar",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.GATE_01 ]		= "gate1",
		[ ai.BaseSlot.GATE_02 ]		= "gate2",
		[ ai.BaseSlot.GATE_03 ]		= "gate3",
	},
}

Def.OW_BasePart_Livebase01_Jer = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/jericho/constructor_jer_livebase_01",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Livebase02_Jer = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/jericho/constructor_jer_livebase_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Livebase03_Jer = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/jericho/constructor_jer_livebase_03",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
	},
}

Def.OW_BasePart_Platform01_Jer = 
{
	inherit				= "OW_BasePart",
	model				= "models/objects/constructor/jericho/constructor_jer_platform",
	death_effect	    = "particles/explosions/shp_exp_big_02",
	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
 		[ ai.BaseSlot.UPLINK_01 ]	= "bridge_link1",
		[ ai.BaseSlot.LOOT_01 ]		= "loot",
	},
}

Def.OW_BasePart_Repair_Jer = 
{
	inherit				= "OW_BasePart",
    model				= "models/objects/constructor/jericho/constructor_jer_repair",

	slot_bones = 
	{
		[ ai.BaseSlot.BASE_01 ]		= "link1",
		[ ai.BaseSlot.BASE_02 ]		= "link2",
		[ ai.BaseSlot.BASE_03 ]		= "link3",
		[ ai.BaseSlot.UTILITY_01 ]	= "flag",
 		[ ai.BaseSlot.UTILITY_02 ]	= "antena",
	},
}

Def.OW_BasePart_BaseWarp_Jer = 
{
	inherit					= "OW_BaseWarp",

	base_type				= ai.BaseSlotType.WARP,
	model					= "models/objects/jump_gates/big_jumpgate/big_jumpgate_jer_02",

}

--################################################# PRECURSORS #################################################--

Def.OW_BaseWeapon_Rocket_Prec =
{
	inherit					= "OW_BaseWeapon_Rocket_Emp",
	
	uiName					= "CruiserAlien_Turret_name",
	model					= "models/misc/invisible_model",
	
	physics					= { solid_type = solid.sphere, sphere_radius = 1.75, material = "GiantShield", hitbox = true, },
	
	projectile				= "Projectile_AlienGun",
	
	shot_effect 			= "particles/weapons/alien/prec_cruiser_gun_muzzle",
	death_effect			= "particles/explosions/objects/alien_explosion",
	death_sound				= "sound/explosion/drone_expl",	
	shot_once_sound 		= "sound/weapons/aliengun/ag_shot",
	rot_sound				= "sound/null",

	children				= {{def = "PrecBaseGun",	joint = "root"},},
}

Def.OW_BaseWeapon_Emp_Prec =
{
	inherit					= "OW_BaseWeapon_Emp", 
	
	uiName					= "CruiserAlien_Turret_name",
	model					= "models/misc/invisible_model",
	
	physics					= { solid_type = solid.sphere, sphere_radius = 1.75, material = "GiantShield", hitbox = true, },
	
	projectile				= "Projectile_CruiserGun",
	fire_rate				= 100,
	
	shot_effect 			= "particles/weapons/alien/prec_cruiser_gun_muzzle",
	death_effect			= "particles/explosions/objects/alien_explosion",
	death_sound				= "sound/explosion/drone_expl",	
	shot_once_sound 		= "sound/weapons/turret/alien_cruiser_oneshot", 
	rot_sound				= "sound/null",
	
	children				= {{def = "PrecBaseGun",	joint = "root"},},
}

Def.OW_BasePart_Central_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	vision_always 		= true,
	hud_ico				= "nlo_2",
	hudType				= "default",
	uiName				= "PrecursorModuleBase",
	model				= "models/objects/constructor/aliens/constructor_aliens_center",
	slot_bones = 
	{
		[ ai.BaseSlot.SIDELINK_01 ]		= "link1",
		[ ai.BaseSlot.SIDELINK_02 ]		= "link2",
		[ ai.BaseSlot.SIDELINK_03 ]		= "link3",
		[ ai.BaseSlot.SIDELINK_04 ]		= "link4",
		[ ai.BaseSlot.GATE_01 ]			= "gate1",
		[ ai.BaseSlot.GATE_02 ]			= "gate2",
		[ ai.BaseSlot.GATE_03 ]			= "gate3",
		[ ai.BaseSlot.UPLINK_01 ]		= "bridge_link1",
		[ ai.BaseSlot.GUN_01 ]			= "gun1",
		[ ai.BaseSlot.GUN_02 ]			= "gun9",
		[ ai.BaseSlot.GUN_03 ]			= "gun10",
		[ ai.BaseSlot.GUN_04 ]			= "gun11",
	},
	children =
	{				
		{	effect = "particles/other/prec_base_center", joint = "fx"	},
	}
}

Def.OW_BasePart_Bridge01_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.SIDELINK,
    model				= "models/objects/constructor/aliens/constructor_aliens_bridge0",
	slot_bones = 
	{
		[ ai.BaseSlot.UTILITY_01 ]		= "modul1",
		[ ai.BaseSlot.UTILITY_03 ]		= "modul4",
		[ ai.BaseSlot.SIDELINK_01 ]		= "link1",
		[ ai.BaseSlot.BASE_01 ]			= "link1",
	},
}

Def.OW_BasePart_Bridge02_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.SIDELINK,
    model				= "models/objects/constructor/aliens/constructor_aliens_bridge0s",
	slot_bones = 
	{
		[ ai.BaseSlot.UTILITY_01 ]		= "modul1",
		[ ai.BaseSlot.UTILITY_03 ]		= "modul4",
		[ ai.BaseSlot.SIDELINK_01 ]		= "link1",
		[ ai.BaseSlot.BASE_01 ]			= "link1",
	},
}

Def.OW_BasePart_Bridge03_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.SIDELINK,
    model				= "models/objects/constructor/aliens/constructor_aliens_bridge1",
	slot_bones = 
	{
		[ ai.BaseSlot.UTILITY_01 ]		= "modul3",
		[ ai.BaseSlot.SIDELINK_01 ]		= "link1",
		[ ai.BaseSlot.BASE_01 ]			= "link1",
	},
}

Def.OW_BasePart_Bridge04_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.SIDELINK,
    model				= "models/objects/constructor/aliens/constructor_aliens_bridge1s",
	slot_bones = 
	{
		[ ai.BaseSlot.UTILITY_01 ]		= "modul3",
		[ ai.BaseSlot.SIDELINK_01 ]		= "link1",
		[ ai.BaseSlot.BASE_01 ]			= "link1",
	},
}

Def.OW_BasePart_Bridge05_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.SIDELINK,
    model				= "models/objects/constructor/aliens/constructor_aliens_bridge2",
	slot_bones = 
	{
		[ ai.BaseSlot.UTILITY_01 ]		= "modul1",
		[ ai.BaseSlot.UTILITY_02 ]		= "modul3",
		[ ai.BaseSlot.SIDELINK_01 ]		= "link1",
		[ ai.BaseSlot.BASE_01 ]			= "link1",
	},
}

Def.OW_BasePart_Bridge06_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.SIDELINK,
    model				= "models/objects/constructor/aliens/constructor_aliens_bridge2s",
	slot_bones = 
	{
		[ ai.BaseSlot.UTILITY_01 ]		= "modul1",
		[ ai.BaseSlot.UTILITY_02 ]		= "modul3",
		[ ai.BaseSlot.SIDELINK_01 ]		= "link1",
		[ ai.BaseSlot.BASE_01 ]			= "link1",
	},
}

Def.OW_BasePart_Bridge07_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	model				= "models/objects/constructor/aliens/constructor_aliens_beacon",
	slot_bones = 
	{
		[ ai.BaseSlot.SIDELINK_01 ]		= "link5",
		[ ai.BaseSlot.SIDELINK_02 ]		= "link6",
		[ ai.BaseSlot.SIDELINK_03 ]		= "link7",
	},
}

Def.OW_BasePart_Attacking01_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.UTILITY,
	model				= "models/objects/constructor/aliens/constructor_aliens_attack",
	slot_bones = 
	{
		[ ai.BaseSlot.GUN_01 ]			= "gun1",
		[ ai.BaseSlot.GUN_02 ]			= "gun2",
		[ ai.BaseSlot.GUN_03 ]			= "gun3",
		[ ai.BaseSlot.GUN_04 ]			= "gun4",
		[ ai.BaseSlot.GUN_05 ]			= "gun5",
		[ ai.BaseSlot.GUN_06 ]			= "gun6",
		[ ai.BaseSlot.GUN_07 ]			= "gun7",
		[ ai.BaseSlot.GUN_08 ]			= "gun8",
	},
}

Def.OW_BasePart_Hangar_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.UTILITY,
	model				= "models/objects/constructor/aliens/constructor_aliens_hangar",
	slot_bones = 
	{
		[ ai.BaseSlot.GATE_01 ]			= "gate1",
		[ ai.BaseSlot.GATE_02 ]			= "gate2",
	},
	children =
	{				
		{	effect = "particles/other/prec_base_hangar", joint = "gate1"	},
	}
}

Def.OW_BasePart_BaseWarp_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.UTILITY,
	model				= "models/objects/constructor/aliens/constructor_aliens_portal",
	slot_bones = 
	{
		[ ai.BaseSlot.GATE_01 ]			= "gate1",
		[ ai.BaseSlot.GATE_02 ]			= "gate4",
		[ ai.BaseSlot.GATE_03 ]			= "gate5",
	},
}

Def.OW_BasePart_Repair_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.UTILITY,
	model				= "models/objects/constructor/aliens/constructor_aliens_repair",
}

Def.OW_BasePart_Antena_Prec = 
{
	inherit				= "OW_BasePart_Prec",
	base_type			= ai.BaseSlotType.UPLINK,
    model				= "models/objects/constructor/aliens/constructor_aliens_warehouse",
}