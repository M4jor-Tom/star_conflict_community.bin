-- Специальные объекты для различных PvP-геймплеев

---------------- Capture the Base ----------
--
Def.CtF_Flag =
{
	class		=	"InteractiveEntity",
	in_editor	=	false,
	model		=	"models/shields/sphereshield",
	physics		=	{ solid_type = solid.sphere, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
}

--
Def.CtF_Base =
{
	class		=	"InteractiveEntity",
	in_editor	=	false,
	model		=	"models/objects/vital_point/control_station/control_station",
	physics		=	{ solid_type = solid.compound_model, static = true, material = "Metal" },
}


---------------- Bomb the Base ----------

--
Def.BtB_Bomb =
{
	class					=	"AnimatedEntity",
	in_editor				=	false,
	model					=	"models/objects/gameplay/bombball/bombball_orbit",
	--model					=	"models/objects/gameplay/bombball/bombball_halloween_orbit", -- тыквы на Halloween, SC-118097, SC-119273
	--model 					=	"models/objects/gameplay/bombball/bombball_ballon_orbit", -- воздушные шарики на 1 апреля, SC-114709, SC-116196
	physics					=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	
	interaction_distance	= 	35,

	detonation_time				=	5,
	reset_time					=	60,
	inactive_after_drop_time	=	2,

	hudType					=	"bomb",
	uiName 					=	"Bomb_name",
}


--
Def.BtB_BombSite =
{
	class					=	"BaseEntity",
	in_editor				=	false,
	model					=	"models/objects/vital_point/control_tower/control_tower",

	network_sync			=	true,

	physics					=	{ solid_type = solid.compound_model, static = true, material = "Metal" },

	interaction_distance	=	50,
	interaction_priority	=   ai.InteractionPriority.HIGH,
	explosion_danger_sound	=	"sound/game/explosion_danger_sound",
	hudType					=	"bomb_site",
}


--
Def.BtB_BombSite_Team1_A =
{
	inherit				= "BtB_BombSite",
	in_editor			= true,
	relationship_group	= 1,
	uiName			= "BeaconA",
}

Def.BtB_BombSite_Team1_B =
{
	inherit				= "BtB_BombSite",
	in_editor			= true,
	relationship_group	= 1,
	uiName			= "BeaconB",
}

Def.BtB_BombSite_Team1_C =
{
	inherit				= "BtB_BombSite",
	in_editor			= true,
	relationship_group	= 1,
	uiName			= "BeaconC",
}


--
Def.BtB_BombSite_Team2_A =
{
	inherit				= "BtB_BombSite",
	in_editor			= true,
	relationship_group	= 2,
	uiName			= "BeaconA",
}

Def.BtB_BombSite_Team2_B =
{
	inherit				= "BtB_BombSite",
	in_editor			= true,
	relationship_group	= 2,
	uiName			= "BeaconB",
}

Def.BtB_BombSite_Team2_C =
{
	inherit				= "BtB_BombSite",
	in_editor			= true,
	relationship_group	= 2,
	uiName			= "BeaconC",
}



-- Деф для взрыва Бомбы в геймплее Bomb_the_Base
Def.Gameplay_BombExplosion =
{
	intensity =	3000,
	damage_emp = 3000,
	blast_maxDistance =	100,
	class =	"BlastWave",
	in_editor = false,
	
	effect = "particles/weapons/nuke/explosion",
	sound = "sound/explosion/NukeBomb_expl",
	light_color = "255 100 0 255",
	light_radius = 250,
	light_time = 1.0,
	
	default_icon = "damage_explosionBlastwave",	
	uiName = "damage_gameplayBomb",				-- для нормального отображения в DeathRecap
}

Def.Ship_Bot_ClanShipDrone_Empire = {
	inherit 			= "Ship_Race1_M_T3",	--M
	ship4bot			= true,
	default_modules		= {		
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_ClanShipDrone_Heavy",	--T5
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_Empty_PvE",	
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01] 			= "ModulePassive_ClanShipDrone_CollisionComp"
	},
	rocket_ammo2_count	= 0,
	death_blast_wave	= "SmallShipExplodeBlastWavePVE",
	storeItemId			= 0,
	uiName				= "ClanShipDrone",
	vision_radius 		= 100, 
	pve_ship_level		= ai.PveShipLevel.NORMAL,
	on_death_damage_to_clanship = 1,
	hull_health_mul		= -0.5,
	shield_health_mul	= -0.5,
	max_speed			= 40,
	death_wreck			="",
	ship_tier			= 5,
	is_gameplay_drone	= true,
	energy_regen		= 4.692,
	energy_max			= 690,
	shield_max			= 4260,
	shield_regen		= 122.9,
	shield_resist_kinetic= 30,
	shield_resist_emp	= -30,
	shield_resist_thermal= 0,
	hull_health			= 6685,
	hull_resist_kinetic	= -15,
	hull_resist_emp		= 45,
	hull_resist_thermal	= 15,
}

Def.Ship_Bot_ClanShipDroneBig_Empire = {
	inherit 			= "Ship_Race1_L_T3",
	ship4bot			= true,
	default_modules		= {		
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_ClanShipDrone_Laser",
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_Empty_Special",	
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01] 			= "ModulePassive_ClanShipDrone_CollisionComp"
	},
	rocket_ammo2_count	= 0,
	death_blast_wave	= "SmallShipExplodeBlastWavePVE",
	storeItemId			= 0,
	uiName				= "ClanShipDrone",
	vision_radius 		= 100, 
	pve_ship_level		= ai.PveShipLevel.NORMAL,
	on_death_damage_to_clanship = 1,
	hull_health_mul		= 1.5,
	shield_health_mul	= 1.5,
	max_speed			= 30,	
	death_wreck			="",
	ship_tier			= 5,
	is_gameplay_drone	= true,
	energy_regen		= 6.12,
	energy_max			= 900,
	shield_max			= 5315,
	shield_regen		= 114.4,
	shield_resist_kinetic= 30,
	shield_resist_emp	= -30,
	shield_resist_thermal= 0,
	hull_health			= 11745,
	hull_resist_kinetic	= -15,
	hull_resist_emp		= 45,
	hull_resist_thermal	= 15,
}

Def.Ship_Bot_ClanShipDrone_Jericho = {
	inherit 			= "Ship_Race2_M_T3",
	ship4bot			= true,
	default_modules		= {		
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Plasmagun_Heavy_T5_Mk1",
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_Empty_Special",	
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01] 			= "ModulePassive_ClanShipDrone_CollisionComp"
	},
	rocket_ammo2_count	= 0,
	death_blast_wave	= "SmallShipExplodeBlastWavePVE",
	storeItemId			= 0,
	uiName				= "ClanShipDrone",
	vision_radius 		= 100, 
	pve_ship_level		= ai.PveShipLevel.NORMAL,
	on_death_damage_to_clanship = 1,
	hull_health_mul		= -0.5,
	shield_health_mul	= -0.5,
	max_speed			= 30,	
	death_wreck			="",
	ship_tier			= 5,
	is_gameplay_drone	= true,
	energy_regen		= 3.74,
	energy_max			= 550,
	shield_max			= 7455,
	shield_regen		= 116.1,
	shield_resist_kinetic= 55,
	shield_resist_emp	= -5,
	shield_resist_thermal= 25,
	hull_health			= 3845,
	hull_resist_kinetic	= -5,
	hull_resist_emp		= 55,
	hull_resist_thermal	= 25,
}

Def.Ship_Bot_ClanShipDroneBig_Jericho = {
	inherit 			= "Ship_Race2_L_T3",
	ship4bot			= true,
	default_modules		= {		
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_ClanShipDrone_JerichoLaser",
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_Empty_Special",	
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01] 			= "ModulePassive_ClanShipDrone_CollisionComp"	
	},
	rocket_ammo2_count	= 0,
	death_blast_wave	= "SmallShipExplodeBlastWavePVE",
	storeItemId			= 0,
	uiName				= "ClanShipDrone",
	vision_radius 		= 100, 
	pve_ship_level		= ai.PveShipLevel.NORMAL,
	on_death_damage_to_clanship = 1,
	hull_health_mul		= 1.5,
	shield_health_mul	= 1.5,
	max_speed			= 30,	
	death_wreck			="",
	ship_tier			= 5,
	is_gameplay_drone	= true,
	energy_regen		= 5.61,
	energy_max			= 825,
	shield_max			= 19240,
	shield_regen		= 105.7,
	shield_resist_kinetic= 15,
	shield_resist_emp	= -45,
	shield_resist_thermal= -15,
	hull_health			= 12425,
	hull_resist_kinetic	= -15,
	hull_resist_emp		= 45,
	hull_resist_thermal	= 15,
}

Def.Ship_Bot_ClanShipDrone_Federation = {
	inherit 			= "Ship_Race3_M_T3",
	ship4bot			= true,
	default_modules		= {		
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Plasmagun_Heavy_T5_Mk1", --бонус федерации "крутые дроны"	--T4
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_Empty_Special",	
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01] 			= "ModulePassive_ClanShipDrone_CollisionComp"
	},
	rocket_ammo2_count	= 0,
	death_blast_wave	= "SmallShipExplodeBlastWavePVE",
	storeItemId			= 0,
	uiName				= "ClanShipDrone",
	vision_radius 		= 100, 
	pve_ship_level		= ai.PveShipLevel.NORMAL,
	on_death_damage_to_clanship = 1,
	--hull_health_mul		= -0.5, --бонус федерации "крутые дроны"
	--shield_health_mul	= -0.5,
	damage_mul 			= 0.5,
	max_speed			= 30,
	death_wreck			="",
	ship_tier			= 5,
	is_gameplay_drone	= true,
	energy_regen		= 4.692,
	energy_max			= 690,
	shield_max			= 4605,
	shield_regen		= 122.9,
	shield_resist_kinetic= 40,
	shield_resist_emp	= -20,
	shield_resist_thermal= 10,
	hull_health			= 4910,
	hull_resist_kinetic	= -5,
	hull_resist_emp		= 55,
	hull_resist_thermal	= 25,
}

Def.Ship_Bot_ClanShipDroneBig_Federation = {	-- Big
	inherit 			= "Ship_Race3_L_T3",
	ship4bot			= true,
	default_modules		= {		
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_ClanShipDrone_FedLaser", --бонус федерации "крутые дроны"	--T4
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_Empty_Special",	
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01] 		= "ModulePassive_ClanShipDrone_CollisionComp"	
	},
	rocket_ammo2_count	= 0,
	death_blast_wave	= "SmallShipExplodeBlastWavePVE",
	storeItemId			= 0,
	uiName				= "ClanShipDrone",
	vision_radius 		= 100+10, 
	pve_ship_level		= ai.PveShipLevel.NORMAL,
	on_death_damage_to_clanship = 1,
	hull_health_mul		= 2.5+0.25,--бонус федерации "крутые дроны" #65691 отдельно апнул их на 10%
	shield_health_mul	= 2.5+0.25,
	damage_mul 			= 0.5+0.05+0.38, --#72633: Увеличить дпс дронов федератского дредноута на 25%.
	max_speed			= 30+3,
	death_wreck			="",
	ship_tier			= 5,
	is_gameplay_drone	= true,	
	energy_regen		= 7.038,
	energy_max			= 1035,
	shield_max			= 10850,
	shield_regen		= 114.4,
	shield_resist_kinetic= 30,
	shield_resist_emp	= -30,
	shield_resist_thermal= 0,
	hull_health			= 11405,
	hull_resist_kinetic	= -15,
	hull_resist_emp		= 45,
	hull_resist_thermal	= 15,
}

--------------------------------
--ДЕФЫ ДЛЯ РЕЖИМА ЗАХВАТ ФРАГА--
--------------------------------

Def.FragJar =
{
	class = "ScBaseEntity",
	model = "models/objects/gameplay/bonuses/quad_damage",

	effect			= "particles/objects/bonuses/quad_damage",
	glow_effect 	= "particles/objects/bonuses/quad_damage_exp",

}


Def.FragBase_Team1 = 
{
	inherit			= "VitalPoint_Recaptureable",

	relationship_group 	= 1,		
	damageable		= false,
	recaptureable	= false,
	
	frag_base = true,
	turret_def1 	= "",
	turret_def2 	= "",
	turret_def3 	= "",
	turret_def4 	= "",
	interaction_distance	= 	70,
	frag_base 		= true,

	children =
	{
		{ def = "FragBaseSpawn", joint = "root" }
	}
}

Def.FragBase_Team2 = 
{
	inherit			= "VitalPoint_Recaptureable",

	relationship_group 	= 2,		
	damageable		= false,
	recaptureable	= false,
	
	frag_base 		= true,	
	turret_def1 	= "",
	turret_def2 	= "",
	turret_def3 	= "",
	turret_def4 	= "",
	interaction_distance	= 	70,
	frag_base 		= true,

	children =
	{
		{ def = "FragBaseSpawn", joint = "root" }
	}
}

Def.FragBaseSpawn = 
{
	class = "SpawnSpot",	

	spawn_type	= SPAWN_SPACE_SHIP,
	spawn_area	= true,	
}

-------------------------------------------------------------
------ Деф для ослабления радаров на БЗС
---#65691
Def.ClanShip_AntiRadarAuraHolder =
{
	class 			= "AuraHolderEntity",
	in_editor 		= true,
	spell_on_spawn	= "ClanShip_AntiRadar",
	
	uiName			= "ClanShip_AntiRadarAuraHolder",
}

Def.PvE_Stealth_AntiradarAuraHolder =
{
	class 			= "AuraHolderEntity",
	in_editor 		= true,
	spell_on_spawn	= "PvE_Stealth_Antiradar",
	
	uiName			= "PvE_Stealth_AntiradarAuraHolder",
}

------ Деф для ослабления фрегатов на порталах
---#SC-113964
Def.Anomaly_AntiFrigatAuraHolder =
{
	class 			= "AuraHolderEntity",
	in_editor 		= true,
	spell_on_spawn	= "Portals_AntiFrigat",
	
	uiName			= "Portals_AntiFrigatAuraHolder",
}

Def.OW_BR_AntiRadarAuraHolder =
{
	class 			= "AuraHolderEntity",
	in_editor 		= true,
	spell_on_spawn	= "OW_BR_AntiRadar",
	
	uiName			= "ClanShip_AntiRadarAuraHolder",
}