-- написан ручками, тестовые ентити к адвенчерам

Def.Ship_Adventure_A =
{
	inherit					= "Ship_Race2_S_T5",
	ship_name				= "Ship_Adventure_A",
	storeItemId				= 0,
	
	ow_script_report_heal	= true,
	ow_script_report_damage	= true,
	
	--entity_tags				= { "alpha", "boss" },
	--config = { Vec3(), Vec3(), "cycle", 220, "despawn" },
	avtomat = "Ride",
}


Def.Ship_Adventure_B =
{
	inherit					= "Ship_Race2_S_T5",
	ship_name				= "Ship_Adventure_B",
	storeItemId				= 0,
	
	ow_script_report_heal	= true,
	ow_script_report_damage	= true,
	
	entity_tags				= { "beta", "boss" },
}

-- Объект для квестового подбора
Def.Adventure_LootCrate_Generic =  --контейнер для предмета
{
	class = "LootCrate",
	in_editor = true,

	interaction_distance = 30.0,
	interacting_fx = "particles/ships/looting",
	interacting_success_fx = "particles/ships/looted",

	max_detection_distance = 200.0,
	vision_radius_coef = 0.5,
	glow_effect = "particles/other/loot_highlight",
	owner_effect = "particles/other/loot_owner_highlight",
	glare_color = 3,

	--loot_table = "TestLootTable",
	
	physics = { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 100, damping = 0.4, rot_damping = 0.4, },
	model = "models/objects/gameplay/loot_box/loot_box",
	health = 3000,
	damageable = false,

	uiName = "LootCrate",
	hudType = "loot_crate",
}

Def.AdventureItem_Base =  --предмет в контейнере
{
	class				= "BaseEntity",
	adventure_fake_item = true,	-- не хранится вообще ни где, но сообщение о том, что предмет взят идут.
	in_editor			= false,
	cant_be_bought		= true,
}

Def.AdventureItem_EIS3_SearchCargo = 
{
	inherit			= "AdventureItem_Base",
	default_icon	= "Quest_container_biomaterials_ico",
	uiName			= "AdvItem_EIS3_SearchCargo",
	uiDesc			= "AdvItem_EIS3_SearchCargo_desc",
}

Def.AdventureItem_JIS_Mineral = 
{
	inherit			= "AdventureItem_Base",
	default_icon	= "Tungsten_plate_ico",
	uiName			= "ow_QuestLootJericho_s3",
	uiDesc			= "ow_QuestLootJericho_s3_desc",
}

Def.AdventureItem_FNS_CartelClue = 
{
	inherit			= "AdventureItem_Base",
	default_icon	= "ow_Communication_system_ico",
	uiName			= "AdvItem_FNS_CartelClue",
	uiDesc			= "AdvItem_FNS_CartelClue_desc",
}
--

Def.Adventure_Loot_A = 
{
	inherit			= "AdventureItem_Base",
	default_icon	= "ow_CPU_ico",
	uiName			= "ow_Techs_Coded_Message_name",
	uiDesc			= "ow_Techs_Coded_Message_desc",
}


Def.Adventure_Loot_B = 
{
	inherit			= "AdventureItem_Base",
	default_icon	= "ow_CPU_ico",
	uiName			= "ow_Techs_Cypher_List_name",
	uiDesc			= "ow_Techs_Cypher_List_desc",
}

Def.Adventure_Loot_Empire_Guardian17_2 = 
{	
	default_icon	= "ow_CPU_ico",
	uiName			= "ow_Techs_Coded_Message_name",
	uiDesc			= "ow_Techs_Coded_Message_desc",
}
---------------------------------------
-- Объект для квестового взаимодействия
Def.OpenWorld_AdventureObject_Base =
{
	class					= "AdventureObject",
	in_editor				= false,
	damageable				= false,
	interaction_distance	= 50,
	max_detection_distance	= 500,
	auto_interaction		= false,
	interaction_time		= 0.75,
	hudType 				= "loot_crate",
	interacting_fx			= "particles/ships/looting",
	interacting_success_fx	= "particles/ships/looted",
	spawn_effect 			= "particles/other/wave_portal_open",
	glow_effect				= "particles/other/loot_highlight",
	entity_tags 			= {},
}
-- Объект для квестового подбора
Def.OpenWorld_AdventureObject_Deactivatable =
{
	inherit					= "OpenWorld_AdventureObject_Base",
	interaction_deactivate	= true,
	respawn_time			= 45,
}
--
Def.OpenWorld_AdventureObject_HiddenWithFX =
{
	inherit					= "OpenWorld_AdventureObject_Base",
	auto_interaction		= false,
	--interaction_time		= 0.05,
	interaction_distance	= 50000,
	max_detection_distance	= 50000,
	maxViewDist 			= 0.1,
	model					= "models/weapons/drones/spyradar/spyradar",
	physics					= { solid_type = solid.none, material = "Metal", static = true, },
	
	hudType 				= "default",
	--interacting_fx			= "",
	--interacting_success_fx	= "",
	spawn_effect 			= "",
	glow_effect				= "",
}

Def.Adventure_TagPoint = 
{
	--inherit				= "OpenWorld_AdventureObject_Base",
	class				= 'TagPoint',
	in_editor			= true,
	entity_tags 		= {},
}

Def.Adventure_Object_A = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	model						= "models/weapons/drones/healbot/healbot",
	physics						= { solid_type = solid.sphere, material = "Metal", static = true,  },
	interacting_success_sound	= "sound/game/openspace_quest/healbot_activation",

	uiName						= "OpenWorld_Quest_Tut",
	interaction_time			= 0.25,
	entity_tags					= { "alpha" },
}


Def.Adventure_Object_B = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	model						= "models/objects/gameplay/minerals/craft_loot",
	physics						= { solid_type = solid.sphere, material = "Metal", static = true,  },
	interacting_success_sound	= "sound/game/openspace_quest/healbot_activation",

	uiName						= "OpenWorld_QuestLoot_1",
	interaction_time			= 0.25,
	entity_tags					= { "beta" },
}

Def.Adventure_InteractObject_A = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/weapons/drones/healbot/healbot",
	physics						= { solid_type = solid.sphere, material = "Metal", static = true,  },
	interacting_success_sound	= "sound/game/openspace_quest/healbot_activation",

	uiName						= "OpenWorld_Quest_Tut",
	interaction_time			= 1,
	entity_tags					= { "alpha" },
}

Def.AdventureInteractObject_EIS2_EnergyStation = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/vital_point/energy_station/energy_station",	
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",
	interaction_distance		= 80,
	entity_tags					= { "alpha" },
	interaction_time			= 8,
	
	children = 
	{
		{ effect = "particles/objects/generator_lightning2", joint = "fx1" },
		{ effect = "particles/objects/generator_lightning2", joint = "fx2" },
		{ effect = "particles/objects/generator_lightning", joint = "fx3" },
		{ effect = "particles/objects/generator_lightning", joint = "fx4" },
	},

	uiName			= "OpenWorld_QuestEmpire_s2d",
}

Def.AdventureInteractObject_EIS3_SearchCargo = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	--model						= "models/objects/gameplay/prec_obj/prec_obj",
	--physics						= { solid_type = solid.model, static = true, material = "Rock" },
	model						= "models/objects/gameplay/loot_debris/loot_debris03",
	physics						= { solid_type = solid.sphere, material = "Metal", static = true,  },
	--entity_tags					= { "alpha" },
	interaction_time			= 4,

	uiName			= "AdvObj_EIS3_SearchCargo",
}

Def.AdventureInteractObject_FF_Container = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/global_world/empire_object/empire_loot_01",
	physics						= { solid_type = solid.sphere, static = true, material = "Metal" },
	entity_tags					= { "alpha" },
	interaction_time			= 2,

	uiName			= "AdvObj_FF_Container",
}

Def.AdventureInteractObject_JIGM_Tracker = 
{
	inherit						= "OpenWorld_AdventureObject_Deactivatable",
	in_editor					= true,
	model						= "models/weapons/drones/spyradar/spyradar",
	physics						= { solid_type = solid.sphere, material = "Metal", static = true, },
	entity_tags					= { "alpha" },
	interaction_time			= 4,
	interaction_distance		= 30,
	uiName			= "AdvObj_JIGM_Tracker",
}

Def.AdventureInteractObject_EBB_Gate = --Empire_BigshipBuilding.zone_id=207
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/shields/gate",
	physics						= { solid_type = solid.cube, material = "Metal", static = true, },
	entity_tags					= { "alpha" },
	interaction_time			= 5,
	interaction_distance		= 50,
	uiName			= "AdvObj_Tracker",
}

Def.AdventureInteractObject_JIS_Mineral = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/gameplay/minerals/craft_loot",
	physics						= { solid_type = solid.model, static = true, material = "Rock"},
	interaction_time			= 3,
	interaction_distance		= 50,
	uiName			= "OpenWorld_QuestLootJericho_s3",
}

Def.AdventureInteractObject_FNS_FedShipWreck = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/ships/race_3/wrecks/r3_wreck_m",
	physics						= { solid_type = solid.model, static = true, material = "Rock"},
	uiName						= "AdvObj_FNS_FedShipWreck",
	interaction_time			= 5,
	interaction_distance		= 50,
}

Def.AdventureInteractObject_FEIA_MineCrystal = 
{
	inherit						= "OpenWorld_AdventureObject_HiddenWithFX",
	in_editor					= true,
	model						= "models/objects/gameplay/loot_debris/loot_debris03",
	interaction_distance		= 50,
	interaction_time			= 10,
	interaction_deactivate		= true,
	respawn_time				= 15,
	uiName						= "AdvObj_FEIA_MineCrystal",
}

Def.AdventureInteractObject_FEIA_1_Escape = 
{
	inherit						= "OpenWorld_AdventureObject_HiddenWithFX",
	in_editor					= true,
	interaction_distance		= 0.1,
	interacting_fx				= "",
	interacting_success_fx		= "",

	uiName			= "AdvObj_Destination",
}

Def.AdventureInteractObject_WGR_Tracker = 
{
	inherit						= "AdventureInteractObject_JIGM_Tracker",
}

Def.AdventureObject_MJR_BigBattery = 
{
	class 				= "Turret",
	in_editor			= true,
	damageable			= true,
	--pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 				= 300000,
	--special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	
	model			= "mapskit/maps/models/bigship/power_block2_big", 
	physics				= { solid_type = solid.model, static = true, material = "Metal" },

	death_effect		= "particles/explosions/objects/explosion_big",
	death_sound			= "sound/explosion/ship_expl",
	broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 10, 3, 23 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 2 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( -6, 3, -21 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 3 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 0, 3, 3 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
	},

	notAlwaysVisible = true,
	relationship_group 	= ai.RelationshipGroups.Police,
	hack_immune		= true,
	respawn_time		= 20,
	uiName 				= "AdvObj_MJR_EnergyBlock",
} 

Def.AdventureInteractObject_MJR_GazStation = 
{
	inherit						= "OpenWorld_AdventureObject_HiddenWithFX",
	in_editor					= true,
	interaction_distance		= 0.1,
	interacting_fx				= "",
	interacting_success_fx		= "",
	model			= "mapskit/maps/models/bigship/power_block2_big",
	uiName			= "AdvObj_Destination",
}

Def.AdventureInteractObject_PikabuShip = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	interaction_distance		= 0.1,
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	model			= "models/ships/specialships/ship_ufo/ship_ufo_wreck",
	uiName			= "AdvObj_Destination",
}

Def.AdventureInteractObject_Pikabu_Beacon = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= false,
	interaction_distance		= 60,
	interaction_time			= 5,
	hudType 					= "default",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",
	uiName						= "AdventureInteractObject_Pikabu_Beacon",
}
Def.AdventureInteractObject_Pikabu_Beacon_first_1 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_first_2 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_first_3 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_first_4 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_second_1 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_second_2 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_second_3 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_second_4 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_third_1 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_third_2 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_third_3 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_third_4 = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}
Def.AdventureInteractObject_Pikabu_Beacon_other = 
{
	inherit						= "AdventureInteractObject_Pikabu_Beacon",
	in_editor					= true,
}

Def.AdventureInteractObject_NewGroundQuest_1 = 
{
	inherit						= "OpenWorld_AdventureObject_Deactivatable",
	in_editor					= true,
	model						= "models/objects/gameplay/quest/parts_key_crystal/crystal1",
	physics						= { solid_type = solid.sphere, material = "Metal", static = true, },
	interaction_time			= 5,
	interaction_distance		= 30,
	max_detection_distance		= 200,
	uiName			= "AdvObj_NewGround_Shard",
}
Def.AdventureInteractObject_NewGroundQuest_2 = 
{
	inherit						= "AdventureInteractObject_NewGroundQuest_1",
	model						= "models/objects/gameplay/quest/parts_key_crystal/crystal2",
	in_editor					= true,
}
Def.AdventureInteractObject_NewGroundQuest_3 = 
{
	inherit						= "AdventureInteractObject_NewGroundQuest_1",
	model						= "models/objects/gameplay/quest/parts_key_crystal/crystal3",
	in_editor					= true,
}
Def.AdventureInteractObject_NewGroundQuest_4 = 
{
	inherit						= "AdventureInteractObject_NewGroundQuest_1",
	model						= "models/objects/gameplay/quest/parts_key_crystal/crystal4",
	in_editor					= true,
}
Def.AdventureInteractObject_NewGroundQuest_5 = 
{
	inherit						= "AdventureInteractObject_NewGroundQuest_1",
	model						= "models/objects/gameplay/quest/parts_key_crystal/crystal5",
	in_editor					= true,
}
Def.AdventureInteractObject_NewGroundQuest_6 = 
{
	inherit						= "AdventureInteractObject_NewGroundQuest_1",
	model						= "models/objects/gameplay/quest/parts_key_crystal/crystal6",
	in_editor					= true,
}
Def.AdventureInteractObject_NewGroundQuest_End = 
{
	inherit						= "OpenWorld_AdventureObject_Deactivatable",
	in_editor					= true,
	model						= "models/weapons/drones/spyradar/spyradar",
	physics						= { solid_type = solid.sphere, material = "Metal", static = true, },
	interaction_time			= 5,
	interaction_distance		= 30,
	uiName			= "AdventureGiver_LarrySeldon",
	respawn_time			= 300,
}

Def.AdventureInteractObject_BRRace_MeetingPoint = 
{
	inherit						= "OpenWorld_AdventureObject_HiddenWithFX",
	in_editor					= true,
	model						= "models/objects/gameplay/loot_debris/loot_debris03",
	uiName						= "AdvObj_BRRace_MeetingPoint",
	max_detection_distance		= 1,
	class = "ScBaseEntity",
}
Def.AdventureInteractObject_BRRace_MeetingPointFed = 
{
	inherit						= "AdventureInteractObject_BRRace_MeetingPoint",
}
Def.AdventureInteractObject_BRRace_MeetingPointEmp = 
{
	inherit						= "AdventureInteractObject_BRRace_MeetingPoint",
}

Def.AdventureInteractObject_BRRace_GiveCase = 
{
	inherit						= "OpenWorld_AdventureObject_HiddenWithFX",
	in_editor					= true,
	model						= "models/objects/gameplay/loot_debris/loot_debris03",
	interaction_distance		= 30,
	interaction_time			= 5,
	uiName						= "AdvObj_BRRace_GiveCase",
	max_detection_distance		= 1,
}

Def.AdventureInteractObject_BRRace_Case = 
{
	inherit	= "OpenWorld_AdventureObject_Deactivatable",
	interaction_time			= 3,
	interaction_distance		= 30,
	respawn_time				= 15,
	--physics = { solid_type = solid.sphere, static = true, material = "ShipMetalMk3", mass = 1000, damping = 0.4, rot_damping = 0.4, },
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	model = "models/objects/gameplay/loot_box/loot_box",
	damageable = false,
	uiName = "AdventureInteractObject_BRRace_Case",
}

Def.AdventureInteractObject_BRRace_CaseDrop = 
{
	inherit	= "AdventureInteractObject_BRRace_Case", -- не должен быть Deactivatable
	respawn_time				= 150,
	--physics = { solid_type = solid.sphere, static = false, material = "ShipMetalMk3", mass = 1000, damping = 0.4, rot_damping = 0.4, },
}

Def.AdventureInteractObject_BRRace_PirateBase = 
{
	class 			= "Turret",
	model			= "models/objects/vital_point/control_tower/control_tower",
	in_editor		= true,
	health			= 850000,
	respawn_time	= 120,
	uiName			= "OpenWorld_Quest_Empire_gr2do",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable		= true,
	hudType			= "default",
	maxViewDist		= 5000,
	relationship_group	= ai.RelationshipGroups.Pirate,
	
	death_effect	= "particles/explosions/objects/tower_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 0, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 0, -15, 0 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 0 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 5, -10, 0 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 05, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, -30, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},
}

Def.AdventureInteractObject_AriadnaSun = 
{
	inherit						= "OpenWorld_AdventureObject_Deactivatable",
	in_editor					= true,
	model						= "models/objects/gameplay/quest/parts_key_crystal/crystal1",
	physics						= { solid_type = solid.sphere, material = "Metal", static = true, },
	interaction_time			= 1,
	interaction_distance		= 1000,
	max_detection_distance		= 100,
	uiName			= "AdvObj_NewGround_Shard",
}

Def.AdventureInteractObject_AriadnaSignal = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	--in_editor					= true,
	model						= "models/objects/vital_point/control_tower/control_tower",	
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",
	interaction_time			= 4,
	interaction_distance		= 30,
	entity_tags					= { "alpha" },

	uiName			= "AdvObj_AriadnaSignal",
}

Def.AdventureInteractObject_Prefinal_Emp_Ship = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/gameplay/open_world/federation/federartion_ship_001",	
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",
	interaction_time			= 10,
	interaction_distance		= 30,
	entity_tags					= { "alpha" },

	uiName			= "AdvObj_Prefinal_Emp_Ship",
}

Def.AdventureInteractObject_Prefinal_Avanpost = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/vital_point/blockpost/blockpost_pirate",
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	interaction_time			= 10,
	interaction_distance		= 40,
	max_detection_distance		= 20,
	uiName			= "AdvObj_Prefinal_Avanpost",
}

Def.Turret_Pirate_Barge_JerTurret_Prefinal =
{
	inherit 		= "Turret_Pirate_Barge_JerTurret_T3",
	relationship_group = 1,
	damageable		= false,
	
}

Def.Turret_Pirate_Barge_Rocket_Prefinal =
{
	inherit 		= "Turret_Pirate_Barge_Rocket_T3",
	relationship_group = 1,
	damageable		= false,
	
}

Def.Turret_Pirate_Barge_BigJerTurret_Prefinal =
{
	inherit 		= "Turret_Pirate_Barge_BigJerTurret_T3",
	relationship_group = 1,
	damageable		= false,
	
}

Def.AdventureInteractObject_Prefinal_Runaway = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat",
	
	
	
	damageable_groups =
	{
		[ ai.DamageableGroup.ENGINE1 ] =
		{
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig1", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig2", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig3", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig4", }, -- двигатель без звука
			--{ def = "Pirate_Barge_EngineSound", joint = "dvig4" }, -- звук отдельно
		 -- здесь энтити со звуком уничтожится автоматически после уничтожения последнего двигателя
		}
	},	
	
	children =
	{			
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun1" },
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun2" },	
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun3" },
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun4" },	
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun5" },
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun6" },	
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun7" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun8" },	
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun9" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun10" },	
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun11" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun12" },		
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun13" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun14" },	
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun15" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun16" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun17" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun18" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun19" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun20" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun21" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun22" },	
		--{ def = "AuraEngineHurt", joint = "big_trigger" },	
		{ effect = "particles/ships/cargo_antenna", joint = "fx1" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx2" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx3" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx4" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx5" },
		--{ def = "AuraReactorHurt", joint = "zone_trigger" },
	},
	
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	interaction_time			= 10,
	interaction_distance		= 60,
	max_detection_distance		= 100,
	uiName			= "AdvObj_Prefinal_Runaway",
}

Def.AdventureInteractObject_Prefinal_Emp_Freighter = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	interaction_time			= 4,
	interaction_distance		= 30,
	max_detection_distance		= 100,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_Prefinal_Emp_Freighter",
}

Def.AdventureInteractObject_Prefinal_Fed_Freighter = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	interaction_time			= 4,
	interaction_distance		= 30,
	max_detection_distance		= 100,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_Prefinal_Fed_Freighter",
}

Def.AdventureInteractObject_Prefinal_Fed_Agent = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	interaction_time			= 4,
	interaction_distance		= 30,
	max_detection_distance		= 100,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_Prefinal_Fed_Freighter_Agent",
}

Def.AdventureInteractObject_Prefinal_Container = 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/vital_point/blockpost/fed_blockpost_mini",
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	interaction_time			= 1,
	interaction_distance		= 30,
	max_detection_distance		= 50,
	uiName			= "AdvObj_Prefinal_Container",
}

Def.AdventureInteractObject_Prefinal_Jer_Ship = -- SC-118410 тестовый объект, корабль Иерихона.
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat",
	
	
	
	damageable_groups =
	{
		[ ai.DamageableGroup.ENGINE1 ] =
		{
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig1", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig2", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig3", }, -- двигатель без звука
			{ def = "Pirate_Barge_Engine_T3", joint = "dvig4", }, -- двигатель без звука
			--{ def = "Pirate_Barge_EngineSound", joint = "dvig4" }, -- звук отдельно
		 -- здесь энтити со звуком уничтожится автоматически после уничтожения последнего двигателя
		}
	},	
	
	children =
	{			
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun1" },
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun2" },	
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun3" },
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun4" },	
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun5" },
		{ def = "Turret_Pirate_Barge_JerTurret_Prefinal", joint = "gun6" },	
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun7" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun8" },	
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun9" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun10" },	
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun11" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun12" },		
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun13" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun14" },	
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun15" },
		{ def = "Turret_Pirate_Barge_Rocket_Prefinal", joint = "gun16" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun17" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun18" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun19" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun20" },	
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun21" },
		{ def = "Turret_Pirate_Barge_BigJerTurret_Prefinal", joint = "gun22" },	
		--{ def = "AuraEngineHurt", joint = "big_trigger" },	
		{ effect = "particles/ships/cargo_antenna", joint = "fx1" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx2" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx3" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx4" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx5" },
		--{ def = "AuraReactorHurt", joint = "zone_trigger" },
	},
	
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	interaction_time			= 4,
	interaction_distance		= 30,
	max_detection_distance		= 100,
	maxViewDist 	= 999999, 
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_Prefinal_Runaway",
}

Def.AdventureInteractObject_Prefinal_Jer_Beacon = -- SC-118410 тестовый объект, маяк в фазы 4 и 6 Иерихона.
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/vital_point/control_tower/control_tower",	
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",
	interaction_time			= 4,
	interaction_distance		= 30,
	entity_tags					= { "alpha" },

	uiName			= "AdvObj_Prefinal_Jer_Beacon",
}

Def.AdventureInteractObject_Prefinal_Jer_Cryst = -- SC-118410 тестовый объект, маяк киберов с зелёным свечением в фазы 7 и 9 Иерихона.
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "mapskit/maps/models/precursors/pc_mayak", -- какой-то объект кристаллидов, мобов кристаллидов, а не пиратов 
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (pc_mayak) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 4,
	interaction_distance		= 60,
	max_detection_distance		= 100,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_Prefinal_Jer_Cryst",
}

Def.AdventureInteractObject_Prefinal_Jer_Cryst2 = -- SC-118410 тестовый объект, маяк киберов с зелёным свечением в фазы 7 и 9 Иерихона.
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "mapskit/maps/models/precursors/pc_mayak", -- какой-то объект кристаллидов, мобов кристаллидов, а не пиратов 
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (pc_mayak) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 4,
	interaction_distance		= 60,
	max_detection_distance		= 100,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_Prefinal_Jer_Cryst",
}

-- SC-119558 FelixFlex_2025. Добавить в ОМ несколько сущностей. Февральская суета 2025. (НАЧАЛО БЛОКА) 

Def.AdventureInteractObject_FelixFlex_2025_Man = -- тестовый объект 1, останки Максима Кометы.
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/gameplay/car/man_wreck", -- останки Космонавта в шлеме... models\objects\gameplay\car\man_wreck
	physics						= { solid_type = solid.model, material = "Rock", static = true, },
	-- children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (останки) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 5,
	interaction_distance		= 30,
	max_detection_distance		= 100,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_FelixFlex_2025_Man",
}

Def.AdventureInteractObject_FelixFlex_2025_Car = -- тестовый объект 2, Tesla Roadster Илона Маска.
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/gameplay/car/car_wreck", -- останки Tesla Roadster models\objects\gameplay\car\car_wreck
	physics						= { solid_type = solid.model, material = "Metal", static = true, },
	-- children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (останки) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 5,
	interaction_distance		= 30,
	max_detection_distance		= 100,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_FelixFlex_2025_Car",
}

Def.AdventureInteractObject_FelixFlex_2025_Radar = -- тестовый объект 2, Tesla Roadster Илона Маска.
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/objects/global_world/radar_station/radar_station_01", -- малая Радарная станция models\objects\global_world\radar_station\radar_station_01
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true, },
	-- children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (останки) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 5,
	interaction_distance		= 60,
	max_detection_distance		= 150,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_FelixFlex_2025_Radar",
}

-- SC-119558 FelixFlex_2025. Добавить в ОМ несколько сущностей. Февральская суета 2025. (КОНЕЦ БЛОКА) 

----------------------------------------------------------------------------
-- SC-118793 Финальный рейд-приключение "Возвращение Предтеч" (НАЧАЛО БЛОКА)

-- Корабль Предтеч (уничтожение которого на карте ruinsalien_crystal_iridium_invertor_r_ow (Инвертор) и является целью Ивента) АБ2024
Def.ReturnOfPrecursors_Mothership2024 =
{
	health 			= 1000000000,	--100M test, 1G live
	crowd_control_coef = 0,	--- #59363
	-- shield_def		= "Cruiser_Shield_RW_t5", 

	relationship_group = ai.RelationshipGroups.Alien, -- Neutral4 = 16 - всегда нейтрал карте, и игрокам  но не сам себе. 
	max_lin_speed	= 0,	-- корабль стоит, поэтому "ноль" АБ2024-25
	-- points_reward_kill = 300, -- очки эффективности за уничтожение АБ2024
	-- points_reward_assist_damage = 9500, -- очки эффективности за ассист АБ2024
	-- points_reward_assist_debuff = 200, -- очки эффективности за наложение дебаффа АБ2024
	signature		= ai.Signature.HUGE,
	path_end_deactivate	= false,	-- летает бесконечно, телепортируется с конца в начало (даже если неподвижен лучше это оставиь АБ2024

	uiName			= "Precursors_Mothership",	--AlienCruiser
	
	class 			= "CargoShip",
	in_editor		= true, -- true = доступен в редакторе, false = недоступен в редакторе карт

	model			= "models/ships/bigship/precursor_ship/prec_mother",
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
	damageable		= false, -- теперь только через туррельки и ядра. true = можно нанести урон, false = урон не наносится (самому кораблю) АБ2024
	--hudType					= "default",
	--hud_visibility_type 	= "minor", 
	--hudType			= "major",
	hud_visibility_type = "major", 
	vision_always = true,

	maxViewDist		= 10000,
	max_rot_speed	= 0,	-- deg per second максимальная скорость поворота

	death_effect	= "",
	death_wreck		= "AlienDestroyerExpl",
	death_sound		= "sound/raid/boss_death",
	work_sound      = "sound/raid/boss_engine",

	hud_ico 		= "nlo_2",

	warp_in_effect	= "particles/other/wave_portal_open",
	warp_in_sound	= "sound/raid/boss_call2",
	warp_out_effect	= "particles/other/wave_portal_open",
	warp_out_sound	= "sound/raid/boss_call2",
	
	shield_activate_sound = "sound/raid/boss_shield_on",
	shield_deactivate_sound = "sound/raid/boss_shield_off",
	anger_sound = "sound/raid/boss_call2",
	anger_health_percent = { 0.7, 0.5, 0.3, 0.1 }, -- посмотреть по тикетам../ но чёто увеличивается при 70%-50%-30%-10% ХП

	broken_parts = 
	{
		{ def = "AlienDestroyer_Wreck01",  debris = false, pos = Vec3( 96, 28, -102 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R FRONT
		{ def = "AlienDestroyer_Wreck09",  debris = false, pos = Vec3( 64, 22, -14 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T R BACK
		
		{ def = "AlienDestroyer_Wreck13",  debris = false, pos = Vec3( -66, 23, -9 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L BACK
		{ def = "AlienDestroyer_Wreck17",  debris = false, pos = Vec3( -97, 27, -132 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- T L FRONT
		
		{ def = "AlienDestroyer_Wreck02",  debris = false, pos = Vec3( 93, -24, -138 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R FRONT
		{ def = "AlienDestroyer_Wreck04",  debris = false, pos = Vec3( 93, -29, -78 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R MID
		{ def = "AlienDestroyer_Wreck10",  debris = false, pos = Vec3( 67, -23, -16 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B R BACK
		
		{ def = "AlienDestroyer_Wreck14",  debris = false, pos = Vec3( -68, -24, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L BACK
		{ def = "AlienDestroyer_Wreck18",  debris = false, pos = Vec3( -98, -28, -96 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- B L FRONT
		
		--бошка
		{ def = "AlienDestroyer_Wreck11",  debris = false, pos = Vec3( 23, 0, -22 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА R
		{ def = "AlienDestroyer_Wreck12",  debris = false, pos = Vec3( -30, 0, -25 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.2, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, }, -- БОШКА L
		
		--пропадают сразу
		{ def = "AlienDestroyer_Wreck05",  debris = false, pos = Vec3( 98, 0, -68 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник R пропадают сразу
		{ def = "AlienDestroyer_Wreck16",  debris = false, pos = Vec3( -100, 0, -69 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- большой подглазник L пропадают сразу
		
		--мелочь
		--{ def = "AlienDestroyer_Wreck08",  debris = false, pos = Vec3( 76, 0, -100 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- косточка R
		--{ def = "AlienDestroyer_Wreck19",  debris = false, pos = Vec3( -53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа L
		{ def = "AlienDestroyer_Wreck07",  debris = false, pos = Vec3( 53, 0, -160 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть дуги входа R
		{ def = "AlienDestroyer_Wreck06",  debris = false, pos = Vec3( 20, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа R
		{ def = "AlienDestroyer_Wreck20",  debris = false, pos = Vec3( -130, 0, -180 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- часть входа L
		{ def = "AlienDestroyer_Wreck03",  debris = false, pos = Vec3( 70, -22, -145 ), angle = 360,ang_speed_deviation = 0.5,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- B R треугольник спереди
		
		--Вместо части обломки
		--{ def = "AlienDestroyer_Wreck15",  debris = false, pos = Vec3( -94, 31, -76 ), angle = 360,ang_speed_deviation = 0.05,dumping = 0, speed = 0.5, speed_deviation = 0.3, speed_inherit = 0.95, ttl = 180, }, -- T L MID	
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( -94, 31, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -94, 31, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck04", debris = false, pos = Vec3( -94, 31, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 31, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( -94, 33, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( -94, 33, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( -94, 33, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -94, 33, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( -94, 33, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -94, 29, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -94, 29, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( -94, 29, -80 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck14", debris = false, pos = Vec3( -94, 29, -74 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck15", debris = false, pos = Vec3( -94, 29, -72 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck16", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck17", debris = false, pos = Vec3( -94, 31, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
	},

	children =
	{		
		--{effect = "particles/ships/destroyer_engine",	joint = "root"}, -- эффекты на корабле (у данного корабля нее заявлены)
		--{effect = "particles/ships/destroyer_engine_small",	joint = "fx1"},
		--{effect = "particles/ships/destroyer_engine_small",	joint = "fx2"},

		-- { def = "Alien_Destroyer_Life_01_T5", joint = "life1" },
		-- { def = "Alien_Destroyer_Life_02_T5", joint = "life2" },
		-- { def = "Alien_Destroyer_Life_03_T5", joint = "life3" },
		-- { def = "Alien_Destroyer_Life_04_T5", joint = "life4" },
		
		{ def = "ReturnOfPrecursors_BigTurret", joint = "life_gun_1" }, -- вписать деф больших пушек (life_gun_1..2) их всего 2 - поэтому прописали вручную без цикла "for i = 1, 2 do" АБ2024 
		{ def = "ReturnOfPrecursors_BigTurret", joint = "life_gun_2" }, -- вписать деф больших пушек (life_gun_1..2) их всего 2 - поэтому прописали вручную без цикла "for i = 1, 2 do" АБ2024


		{ def = "ReturnOfPrecursors_MothershipCabin", joint = "life4" }, -- Колпак кабины Корабля Предтеч 
		{ def = "ReturnOfPrecursors_MothershipCardan", joint = "life5" }, -- Кардан в кабине Корабля Предтеч
		{ def = "ReturnOfPrecursors_MothershipGear", joint = "life6" }, -- Центральный круг (шестерня) Корабля Предтеч  

		-- { def = "Alien_Destroyer_Hearth_T5", joint = "life1" },
		-- { def = "Alien_Destroyer_SmallHearth_T5", joint = "life2" },
		-- { def = "Alien_Destroyer_SmallHearth_T5", joint = "life3" },
		-- { def = "Alien_Destroyer_Hearth_T5", joint = "life4" },
	},

}

for i = 1, 30 do -- всего 30 костей для пушек, поэтому "1, 30 do"

		Def.ReturnOfPrecursors_Mothership2024.children[#Def.ReturnOfPrecursors_Mothership2024.children+1] = { def = "ReturnOfPrecursors_SmallTurret", joint = "gun_0"..i } -- вписать деф малых пушек (gun_1..30 ) Turret_CruiserAlien_T4L - пример туррели АБ2024

end

-- Малая Пушка Корабля Предтеч (1 из 30) АБ2024
Def.ReturnOfPrecursors_SmallTurret = 
{	
	class 					= "Turret",
	in_editor				= false,
	model					= "models/ships/bigship/precursor_ship/precursor_mother_gun", 
	hudType					= "default",
	hud_visibility_type 	= "minor", 
	maxViewDist		= 2000,

	relationship_group 		= ai.RelationshipGroups.Alien,
	loot_crate="LootCrate_RoP2025_MothershipLoaded1", -- прописывается какой лут выпадает из бота

	physics					= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 					= 24000000, -- в базе стояло 100 000, но поскольку тут у нас патроны дают "х50" то ставим 100 000 х 50 = 5 000 000 ("органолептисески" = 24М)
	--hull_regen = 1250000, -- восстановление корпуса на "ед. в секунду"
	damageable				= true,
	hack_immune				= true,
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 60.0, -- 60
	dispersion				= 0.0, -- deg
	optimal_range			= 400,
	max_range				= 700,
	projectile_speed 		= 300, --100
	
	damage_kinetic			= 2500,
	damage_emp				= 0000,
	damage_thermal			= 0000,
	
	max_rot_speed			= 120,	-- deg per second
	
	projectile		= "Projectile_HeavyRailgun", 

	shot_effect 			= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/turret/railgun_oneshot", 
	children 	= 	{{ effect ="particles/gadget/shere_mother_gun_small", joint = "as_fire_01" },},

	death_effect			= "particles/explosions/objects/explosion_tiny",
	death_sound	= "sound/explosion/turret_expl", 
	
	uiName 					= "Precursors_SmallTurret_name",
}

-- Большая Пушка Корабля Предтеч (1 из 2) АБ2024
Def.ReturnOfPrecursors_BigTurret = 
{	
	class 					= "Turret",
	in_editor				= false,
	model					= "models/ships/bigship/precursor_ship/precursor_mother_lifegun", -- попробовать models/characters/monster/monster_gun/monster_sphere вместо models/ships/bigship/precursor_ship/precursor_mother_lifegun
	hudType					= "default",
	hud_visibility_type 	= "minor",
	maxViewDist		= 2000,	

	relationship_group 		= ai.RelationshipGroups.Alien,
	loot_crate="LootCrate_RoP2025_MothershipLoaded2", -- прописывается какой лут выпадает из бота

	physics					= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 					= 29500000, -- в базе стояло 200 000, но поскольку тут у нас патроны дают "х50" то ставим 200 000 х 50 = 10 000 000 ("органолептисески" = 28М)
	damageable				= true,
	hack_immune				= true,
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 30.0, -- 60
	dispersion				= 0.0, -- deg
	optimal_range			= 300,
	max_range				= 500,
	projectile_speed 		= 350, --100
	
	damage_kinetic			= 3000,
	damage_emp				= 0,
	damage_thermal			= 0,
	
	max_rot_speed			= 90,	-- deg per second
	
	children 	= 	{{ effect ="particles/gadget/shere_mother_gun_big", joint = "as_fire_01" },},
	
	projectile		= "Projectile_HeavyRailgun", 

	shot_effect 			= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/turret/railgun_oneshot", 

	death_effect			= "particles/explosions/objects/explosion_tiny",
	death_sound	= "sound/explosion/turret_expl", 
	
	uiName 					= "Precursors_BigTurret_name",
}

-- Колпак кабины Корабля Предтеч 
Def.ReturnOfPrecursors_MothershipCabin = 
{	
	class 					= "ScBaseEntity",
	in_editor				= false,
	model					= "models/ships/bigship/precursor_ship/life_part4", -- путь к модели в Assets Browser'е:  models\ships\bigship\precursor_ship\life_part4
	hudType					= "default",
	hud_visibility_type 	= "minor", 

	relationship_group 		= ai.RelationshipGroups.Alien,
	--loot_crate="LootCrate_RoP2025_MothershipLoaded", -- прописывается какой лут выпадает из бота ДЛЯ ЭТОГО КЛАССА НЕ ВЫПАДАЕТ

	physics					= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 					= 70555000000, -- в базе стояло 40 000, но поскольку тут у нас патроны дают "х50" то ставим 40 000 х 50 = 2 000 000 ("органолептисески" = 700М))
	damageable				= true,
	hack_immune				= true,
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0, -- Выставить нужное в секундах или закомментировать

	death_effect			= "particles/explosions/objects/explosion_tiny",
	death_sound	= "sound/explosion/turret_expl", 
	
	uiName 					= "Precursors_MothershipCabin_name", -- не забыть создать строки
}

-- Кардан в кабине Корабля Предтеч 
Def.ReturnOfPrecursors_MothershipCardan = 
{	
	class 					= "ScBaseEntity",
	in_editor				= false,
	model					= "models/ships/bigship/precursor_ship/life_part5", -- путь к модели в Assets Browser'е:  models\ships\bigship\precursor_ship\life_part5
	hudType					= "default",
	hud_visibility_type 	= "minor", 

	relationship_group 		= ai.RelationshipGroups.Alien,
	--loot_crate="LootCrate_RoP2025_MothershipLoaded", -- прописывается какой лут выпадает из бота ДЛЯ ЭТОГО КЛАССА НЕ ВЫПАДАЕТ

	physics					= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 					= 5225000000, -- в базе стояло 40 000, но поскольку тут у нас патроны дают "х50" то ставим 40 000 х 50 = 2 000 000 ("органолептисески" = 500М)
	damageable				= true,
	hack_immune				= true,
	karma_reward_kill		= 0,	
	respawn_time 			= 120.0, -- Выставить нужное в секундах или закомментировать

	death_effect			= "particles/explosions/objects/explosion_tiny",
	death_sound	= "sound/explosion/turret_expl", 
	
	uiName 					= "Precursors_MothershipCardan_name", -- не забыть создать строки
}

--  Центральный круг (шестерня) Корабля Предтеч 
Def.ReturnOfPrecursors_MothershipGear = 
{	
	class 					= "ScBaseEntity",
	in_editor				= false,
	model					= "models/ships/bigship/precursor_ship/life_part6", -- путь к модели в Assets Browser'е:  models\ships\bigship\precursor_ship\life_part6
	hudType					= "default",
	hud_visibility_type 	= "minor", 

	relationship_group 		= ai.RelationshipGroups.Alien,

	physics					= { solid_type = solid.compound_model, material = "Metal", static = true, },
	health 					= 32100500000,
	damageable				= false,
	hack_immune				= true,
	karma_reward_kill		= 0,	
	respawn_time 			= 600.0,

	death_effect			= "particles/explosions/objects/explosion_tiny",
	death_sound	= "sound/explosion/turret_expl", 
	
	-- uiName 					= "Precursors_MothershipGear_name", -- не забыть создать строки
}

-- Союзный Дредноут Элидиума (по аналогии с Def.PvE_Gen_Allidium_Dread01 из PVE Возвращения в Эдем, карта в anvil master\work_version\pc\data\levels\area2\...s8256_pve_raid_planetoid.map, объект Dread1)

Def.ReturnOfPrecursors_Dreadnought_Allidium = 
{
	class 			= "ScBaseEntity",
	damageable		= false, -- уничтожаемость (false - "не убить")
	health 				= 1000000000,
	in_editor		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/allidium/allidium_ship_pered",

	--relationship_group = ai.RelationshipGroups.Alien, -- alien
	max_lin_speed	= 0,	-- корабль стоит, поэтому "ноль" АБ2025
	-- points_reward_kill = 300, -- очки эффективности за уничтожение АБ2025
	-- points_reward_assist_damage = 9500, -- очки эффективности за ассист АБ2024
	-- points_reward_assist_debuff = 200, -- очки эффективности за наложение дебаффа АБ2024
	signature		= ai.Signature.HUGE,
	path_end_deactivate	= false,	-- летает бесконечно, телепортируется с конца в начало (даже если неподвижен лучше это оставиь АБ2024

	uiName			= "Dreadnought_RoP2025",	-- название в UI как будет.
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },
	children =
	{
		{	def = "PvE_Gen_Allidium_Dread02", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Dread03", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Dread04", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Dread05", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Shield", joint = "root",	},
		-- {	def = "PvE_Gen_Dreadnought_AllidiumMainTurret", joint = "big_gun_01", --[[offset = Vec3(-1,0,0)]]}, -- Гравная кормовая пушка, Тут отключена - т.к. апоставлена на карте с нужным повороотом. (должна смотреть назад, чтобы не пересекаться с "шарами". offset = - смещение по осям.) 
		{	def = "ReturnOfPrecursors_AllidiumMainTurret", joint = "big_gun_02",	}, -- Главная центральная пушка
		{	def = "ReturnOfPrecursors_AllidiumMainTurret", joint = "big_gun_3",	}, -- Главная носовая пушка
		{	def = "ReturnOfPrecursors_AllidiumSmallTurret", joint = "gun_01",	}, -- малая пушка левого борта
		{	def = "ReturnOfPrecursors_AllidiumSmallTurret", joint = "gun_02",	}, -- малая пушка левого борта
		{	def = "ReturnOfPrecursors_AllidiumSmallTurret", joint = "gun_03",	}, -- малая пушка левого борта
		{	def = "ReturnOfPrecursors_AllidiumSmallTurret", joint = "gun_04",	}, -- малая пушка левого борта
		{	def = "ReturnOfPrecursors_AllidiumSmallTurret", joint = "gun_05",	}, -- малая пушка правого борта
		{	def = "ReturnOfPrecursors_AllidiumSmallTurret", joint = "gun_06",	}, -- малая пушка правого борта
		{	def = "ReturnOfPrecursors_AllidiumSmallTurret", joint = "gun_07",	}, -- малая пушка правого борта
		{	def = "ReturnOfPrecursors_AllidiumSmallTurret", joint = "gun_08",	}, -- малая пушка правого борта
	},
	relationship_group 	= ai.RelationshipGroups.Police, -- отношение к игроку и другим сущностям в локации, можно текстом ("= ai.RelationshipGroups.Alien,") Список ai.RelationshipGroups = в ...\work_version\pc\sys_data\scripts\ai\cosmos_constants.lua
	uiName 			= "tooltip_ship_dreadnought"
}

-- Большая Пушка Дредноута Элидиума, 1 из 3 (взята по аналогии с Def.PvE_Gen_Dreadnought_AllidiumMainTurret из pve_entities.lua)

Def.ReturnOfPrecursors_AllidiumMainTurret = 
{	
	-- inherit 			= "ClanShip_MainTurret",
	--[[class 					= "Turret",
	in_editor				= true, -- видна ли в Anvil'е (если false - то в списке объектов Properties (по Ctrl+P) нельзя будент выбрать, только в .luaшках прописать
	model					= "models/objects/guns/gun_02/gun_02", 
	hudType					= "default",
	hud_visibility_type 	= "minor", 

	relationship_group 		= ai.RelationshipGroups.Alien, -- отношение к игроку и другим сущностям в локации, можно и цифрой в формате "relationship_group = 7," Список ai.RelationshipGroups = в ...\work_version\pc\sys_data\scripts\ai\cosmos_constants.lua 

	physics					= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000000 },
	health 					= 100500,
	damageable				= false,  -- если false - то урон наносить нельзя и все соседние показатели (Здоровье, Карма, Респ) значения не имиеют (можно не комментировать)
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 30.0, -- 60
	dispersion				= 0.0, -- deg
	optimal_range			= 200,
	max_range				= 400,
	projectile_speed 		= 110, --100
	
	damage_kinetic			= 1840, -- подобрать под цели
	damage_emp				= 500,
	damage_thermal			= 500,
	
	max_rot_speed			= 45,	-- deg per second
	
	projectile		= "Projectile_HeavyRailgun", 

	shot_effect 			= "particles/other/dreadnought_plasma_projectile", -- было particles/weapons/drongun/muzzle 
	shot_once_sound = "sound/dreadnought/big_cannon_fire",
	rot_sound					= "sound/dreadnought/big_cannon_rotate",
	stop_sound					= "sound/dreadnought/big_cannon_stop",

	death_effect			= "particles/explosions/objects/fed_blockpost_mini_explosion",
	death_sound	= "sound/raid/raid_avanpost_explosion", ]]
	
	inherit 		= "PvE_Gen_Dreadnought_MainTurret",
	fire_delay_range			= 1, -- минимум 0, максимум fire_delay_range
	first_delay_step			= 30/3,
	volley_interval				= 30,
	clan_ship_blastwave			= "Blastwave_ClanShip_MainTurretRoP2025",
	
	projectile_damage			= 1500000, -- это только куда попадёт прожектайл
	health 						= 9999999999,
	damageable					= true,
	hack_immune					= true,
	shield_regen = 6000, -- восстановление щита на "ед. в секунду"
	hull_regen = 9500, -- восстановление корпуса на "ед. в секунду"
	model			= "models/objects/guns/gun_02/gun_02",
	hudType				= "default",
	hud_visibility_type = "minor",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000000 },
	relationship_group = ai.RelationshipGroups.Police, -- Neutral4	= 16 - всегда нейтрал карте, и игрокам  но не сам себе.
	death_sound     = "sound/raid/raid_avanpost_explosion",
	death_effect	= "particles/explosions/objects/fed_blockpost_mini_explosion",
	network_sync	= true,
	
	uiName 					= "ClanShip_MainTurret",
}

Def.Blastwave_ClanShip_MainTurretRoP2025 =
{
	inherit 	  		= "Blastwave_ClanShip_MainTurret",	
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 12000000, -- Подстраиваемся под прочность цели. У матки Предтеч: Малая пушка = 24М, Большая пушка 28М 
	blast_maxDistance	= 100,
	apply_damage		= true,
	apply_shake 		= true,
	--exp
	effect 				= "particles/other/dreadnought_plasma_hit2",
	explosion_light		= "Lights_ClanShip_MainTurretBlastwave",
	sound 				= "sound/dreadnought/big_cannon_hit",
	--
}


-- Малая Пушка Дредноута Элидиума, 1 из 8 (взята по аналогии с Def.PvE_Gen_Average_Turret2 из pve_entities.lua) 

Def.ReturnOfPrecursors_AllidiumSmallTurret = 
{	
	class 					= "Turret",
	in_editor				= false,
	model					= "models/objects/guns/gun_01/gun_01", 
	hudType					= "default",
	hud_visibility_type 	= "minor", 

	relationship_group 		= ai.RelationshipGroups.Police, -- отношение к игроку и другим сущностям в локации, можно и цифрой в формате "relationship_group = 7," Список ai.RelationshipGroups = в ...\work_version\pc\sys_data\scripts\ai\cosmos_constants.lua

	physics					= { solid_type = solid.model, kinematic = true, static = false, material = "Metal" },
	health 					= 1800000,
	damageable				= true,
	hack_immune				= true,
	shield_regen = 1600, -- восстановление щита на "ед. в секунду"
	hull_regen = 1050, -- восстановление корпуса на "ед. в секунду"
	damageable				= false,  -- если false - то урон наносить нельзя и все соседние показатели (Здоровье, Карма, Респ) значения не имиеют (можно не комментировать)
	karma_reward_kill		= 0,	
	respawn_time 			= 30.0,
	
	fire_rate				= 50.0, -- 60
	dispersion				= 0.0, -- deg
	optimal_range			= 400,
	max_range				= 500,
	projectile_speed 		= 200, --100
	
	damage_kinetic			= 3500, -- в базе стояло 50, но поскольку тут у нас патроны дают "х50" то ставим 50х50 = 2 500
	damage_emp				= 3500,
	damage_thermal			= 3500, -- в базе стояло 50, но поскольку тут у нас патроны дают "х50" то ставим 50х50 = 2 500
	
	max_rot_speed			= 60,	-- deg per second
	
	projectile		= "Projectile_DreadTurretPlasma", 

	shot_effect 			= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot", 
	rot_sound		= "sound/weapons/turret/turret_motor",

	death_effect			= "particles/explosions/objects/explosion_big",
	death_sound	= "sound/explosion/turret_expl", 
	
	uiName 					= "ClanShip_AverageTurret",
}



-- СУЩНОСТИ В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (НАЧАЛО БЛОКА)
-- ЭТАПЫ 8, 14, 18: Агент "Энигма"( level_name="excavation_elyd_empty_lunar_l_ow" | zone_id=244 )

Def.AdventureInteractObject_RoP2025_St02_Enigma = -- Космонавтик, Агент "Энигма" 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/modules/decorative/bp19_astronaut/astronaut", -- Скрюченный Гонщик models\objects\gameplay\car\man_wreck или Космонавт models\modules\decorative\bp19_astronaut\astronaut,
	physics						= { solid_type = solid.model, material = "Rock", static = true, },
	-- children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (останки) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 5,
	interaction_distance		= 5,
	max_detection_distance		= 10,
	entity_tags					= { "alpha" },
	uiName			= "AdventureInteractObject_RoP2025_St02_Enigma",
}

Def.AdventureInteractObject_RoP2025_St03_Courier = -- Челнок от Spiral (связной с которым нужно повзаимодействовать в движении)
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/ships/race_1/s/r1_s_spiral", -- Челнок от Spiral models\ships\race_1\s\r1_s_spiral
	physics						= { solid_type = solid.model, material = "Rock", static = true, },
	-- children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (останки) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 5,
	interaction_distance		= 5,
	max_detection_distance		= 15,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_RoP2025_St03_Courier",
}

Def.AdventureInteractObject_RoP2025_St67_Clock = -- Часы на Колонист-11  
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/modules/decorative/clock/clock", -- настенные часы models\modules\decorative\clock\clock
	physics						= { solid_type = solid.model, material = "Rock", static = true, },
	-- children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (останки) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 7,
	interaction_distance		= 5,
	max_detection_distance		= 10,
	entity_tags					= { "alpha" },
	uiName			= "AdvObj_RoP2025_St67_Clock",
}

Def.AdventureObject_RoP2025_IvertorAnomalyBeacon = -- Маяк наносящий урон, блокирующий выход из зоны (незльзя взаимодействовать) SC-119680 . 
{
	inherit				= "OpenWorld_IvertorAnomaly", -- основные настройки действия (радиус, сила) в Spell.Spell_OpenWorld_IvertorAnomaly
	in_editor			= true,
	damageable			= false,
	--model					= "models/weapons/drones/anomaly_bot/anomaly_bot", -- чтобы стал невидимым нужно закоментировать модель НЕ здесь а у inherit'а (Def.OpenWorld_IvertorAnomaly) в openworld_entities.lua. Здесь можно поменять, если хочу чтобы модель отличалась от inherit'а 
	--physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 90000, },
	--pve_scale_power	 	= true,
	maxViewDist			= 0,
	--health 				= 300000,
	--special_object  	= true,
	--hudType				= "default",
	--hud_visibility_type = "major",
	max_detection_distance		= 0,

	--death_effect		= "particles/explosions/objects/explosion_big",
	--death_sound			= "sound/explosion/ship_expl",
	--[[broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 10, 3, 23 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 2 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( -6, 3, -21 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 3 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 0, 3, 3 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
	},]]

	notAlwaysVisible = false,
	relationship_group 		= ai.RelationshipGroups.Alien, -- отношение к игроку и другим сущностям в локации, можно и цифрой в формате "relationship_group = 7," Список ai.RelationshipGroups = в ...\work_version\pc\sys_data\scripts\ai\cosmos_constants.lua
	--hack_immune		= true,
	--respawn_time		= 20,
	uiName 				= "AdvObj_RoP2025_IvertorAnomalyBeacon",

}

Def.AdventureInteractObject_RoP2025_St09_Ramirez = -- Спутник (В котором сидит Рмирез) 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/ships/race_5/l/r5_l_ellidium_25/engine", -- Спутник 1, 
	physics						= { solid_type = solid.model, material = "Rock", static = true, },
	-- children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (останки) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 5,
	interaction_distance		= 10,
	interaction_deactivate		= true,
	respawn_time				= 15,
	max_detection_distance		= 50,
	entity_tags					= { "alpha" },
	uiName			= "AdventureInteractObject_RoP2025_St09_Ramirez",
}

Def.AdventureObject_RoP2025_DreadAimPoint = -- Точки прицеливания Дредноута Элидиума (в этапах)  
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureInteractObject_RoP2025_CannonTrigger = -- Невидимый объект взаимодействия 
{
	inherit						= "OpenWorld_AdventureObject_Base",
	in_editor					= true,
	model						= "models/weapons/drones/spyradar/spyradar", -- модель объекта - что то максимально ималенькое, но при этом обладающнн коллизией (без которой взаимодействия не будет)
	physics						=	{ solid_type = solid.sphere, static = true, material = "Metal", }, -- конкретно у данного объекта (spyradar) физика "solid.sphere", у других может быть solid.model или solid.compound_model
	-- children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },}, -- сам объект (останки) внутри пустой, это светящееся ядро внутрь него.
	interaction_time			= 5,
	interaction_distance		= 20,
	interaction_deactivate		= true,
	respawn_time				= 300, -- Время, через которое триггер появляется снова (должно быть не менее чем респавн Ткрелей на Корабле предтеч (иначе будет бить по разрушенным)
	max_detection_distance		= 90,
	maxViewDist 				= 0.1, -- расстояние видимости минимальное, получается пот сути "невилимый объект"	
	entity_tags					= { "alpha" },
	uiName			= "AdventureInteractObject_RoP2025_CannonTrigger",
}

Def.AdventureObject_RoP2025_IvertorAnomalySpy = -- Маяк выводящий из инвиза всех, в т.ч. Singularity, невидимый (незльзя взаимодействовать) SC-119888 . 
{
	inherit				= "OpenWorld_IvertorAnomalySpy", -- основные настройки действия (радиус, сила) в Spell.Spell_OpenWorld_IvertorAnomaly
	in_editor			= true,
	damageable			= false,
	--model					= "models/weapons/drones/spyradar/spyradar", -- чтобы стал невидимым нужно закоментировать модель НЕ здесь а у inherit'а (Def.OpenWorld_IvertorAnomaly) в openworld_entities.lua. Здесь можно поменять, если хочу чтобы модель отличалась от inherit'а 
	--physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 90000, },
	--pve_scale_power	 	= true,
	maxViewDist			= 100.1,
	--health 				= 300000,
	--special_object  	= true,
	--hudType				= "default",
	--hud_visibility_type = "major",
	max_detection_distance		= 100.1, -- не нужно, чтобы он хоть както отображался на радаре

	--death_effect		= "particles/explosions/objects/explosion_big",
	--death_sound			= "sound/explosion/ship_expl",
	--[[broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 10, 3, 23 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 2 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( -6, 3, -21 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 3 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 0, 3, 3 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
	},]]

	notAlwaysVisible = false,
	relationship_group 		= ai.RelationshipGroups.Alien, -- отношение к игроку и другим сущностям в локации, можно и цифрой в формате "relationship_group = 7," Список ai.RelationshipGroups = в ...\work_version\pc\sys_data\scripts\ai\cosmos_constants.lua
	--hack_immune		= true,
	--respawn_time		= 20,
	uiName 				= "AdvObj_RoP2025_IvertorAnomalyBeacon", -- не нужно, чтобы он хоть както отображался

}

Def.AdventureObject_RoP2025_PrecFlamingHole = -- Маяк наносящий урон всем, в т.ч. Singularity, + VFX "ПОРТАЛ ОТ ВЗРЫВА КОНКИСТАДРА" (незльзя взаимодействовать) SC-119888 . 
{
	inherit				= "OpenWorld_PrecursorsFlamingHole", -- основные настройки действия (радиус, сила) в Spell.Spell_OpenWorld_IvertorAnomaly
	in_editor			= true,
	damageable			= false,
	spell_on_spawn	= "Spell_OpenWorld_IvertorAnomaly_DOOMSpells",
	model					= "models/modules/decorative/object/prec_flame", -- чтобы стал невидимым нужно закоментировать модель НЕ здесь а у inherit'а (Def.OpenWorld_IvertorAnomaly) в openworld_entities.lua. Здесь можно поменять, если хочу чтобы модель отличалась от inherit'а 
	physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 900000000, },
	--pve_scale_power	 	= true,
	maxViewDist			= 10000,
	vision_always = true,
	
	--health 				= 300000,
	--special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	max_detection_distance		= 40000, -- не нужно, чтобы он хоть както отображался на радаре
	children 	= 	{{ def ="Effects_PrecShipFlame", joint = "root" },},

	--death_effect		= "particles/explosions/objects/explosion_big",
	--death_sound			= "sound/explosion/ship_expl",
	--[[broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 10, 3, 23 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 2 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( -6, 3, -21 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 3 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 0, 3, 3 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
	},]]

	notAlwaysVisible = false,
	relationship_group 		= ai.RelationshipGroups.Alien, -- отношение к игроку и другим сущностям в локации, можно и цифрой в формате "relationship_group = 7," Список ai.RelationshipGroups = в ...\work_version\pc\sys_data\scripts\ai\cosmos_constants.lua
	--hack_immune		= true,
	--respawn_time		= 20,
	uiName 				= "AdvObj_RoP2025_PrecFlamingHole", -- не нужно, чтобы он хоть както отображался

}

Def.AdventureObject_RoP2025_PrecFlamingHoleLite =
{
	inherit				= "OpenWorld_PrecursorsFlamingHole", -- основные настройки действия (радиус, сила) в Spell.Spell_OpenWorld_IvertorAnomaly
	in_editor			= true,
	damageable			= false,
	spell_on_spawn	= "Spell_OpenWorld_IvertorAnomaly_DOOMSpellsLite",
	
	model					= "models/weapons/drones/spyradar/spyradar", -- если закоментировать модель здесь - будет невидимым 
	uiName 				= "AdvObj_RoP2025_PrecFlamingHole",
}

-- СУЩНОСТИ В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (КОНЕЦ БЛОКА)
-- SC-118793 Финальный рейд-приключение "Возвращение Предтеч" (КОНЕЦ БЛОКА)
---------------------------------------------------------------------------

------------------------------
--- Квестовые точки спавна ---

Def.AdventureSpawnPoint_Base = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureSpawnPoint_FEIA_1_MobSpawn = 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_WGR_1_MobSpawn = 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_MJR_1_MobSpawn = 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_Event_PikabuQuest = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureSpawnPoint_NewGroundQuest_Emp = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureSpawnPoint_NewGroundQuest_Fed = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureSpawnPoint_NewGroundQuest_Jer = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureSpawnPoint_BRRace_Spawn1 = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureSpawnPoint_BRRace_Spawn2 = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureSpawnPoint_BRRace_Spawn3 = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureSpawnPoint_BRRace_PathEnd = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.AdventureSpawnPoint_Ariadna_MobSpawn = 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_Prefinal_Emp_MobSpawn = 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_Prefinal_Fed_MobSpawn = 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_Prefinal_Jer_MobSpawn = -- SC-118410 тестовая точка спавна Иерихона
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

-- ТОЧКИ СПАВНА В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (НАЧАЛО БЛОКА)

Def.AdventureSpawnPoint_RoP2025_Invertor_MinionSpawn1 = -- спавн Дозорного (Малого Миньона) в Инверторе 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_Invertor_MinionSpawn2 = -- спавн Дозорного (Малого Миньона) в Инверторе 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_Invertor_GuardSpawn1 = -- спавн Стражника (Большого Миньона) в Инверторе 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St03_CourierSpawn = -- спавн Курьера Штаба ОФ в Этапе 5
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt071 = -- спавн Лазутчика предтеч в Этапе 7 (№1 из 2 в Ледовые Копи)
{
	inherit		= "AdventureSpawnPoint_Base", 
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt072 = -- спавн Лазутчика предтеч в Этапе 7 (№2 из 2 в Ледовые Копи)
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt073 = -- спавн Лазутчика предтеч в Этапе 7 (№1 из 2 в Центре Колонизации)
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt074 = -- спавн Лазутчика предтеч в Этапе 7 (№2 из 2 в Центре Колонизации)
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_ScoutEmptySpawnSt075 = -- спавн Лазутчика предтеч в Этапе 7 (№1 из 1 в Заброшеный Маяк)
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St11_Scout01 = -- спавн Лазутчика предтеч в Этапе 11 
{
	inherit		= "AdventureSpawnPoint_Base", 
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St11_Scout02 = -- спавн Лазутчика предтеч в Этапе 11 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St11_Scout03 = -- спавн Лазутчика предтеч в Этапе 11 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St11_Scout04 = -- спавн Лазутчика предтеч в Этапе 11 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St11_Scout05 = -- спавн Лазутчика предтеч в Этапе 11 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St13_CourierSpawn = -- спавн Курьера Штаба ОФ в Этапе 13
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St19_Scout01 = -- спавн Лазутчика предтеч в Этапе 19 
{
	inherit		= "AdventureSpawnPoint_Base", 
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St19_Scout02 = -- спавн Лазутчика предтеч в Этапе 19 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St19_Scout03 = -- спавн Лазутчика предтеч в Этапе 19 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St19_Scout04 = -- спавн Лазутчика предтеч в Этапе 19 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St19_Scout05 = -- спавн Лазутчика предтеч в Этапе 19 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St19_Scout06 = -- спавн Лазутчика предтеч в Этапе 19 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St23_CourierSpawn = -- спавн Курьера Штаба ОФ в Этапе 23
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St33_CourierSpawn = -- спавн Курьера Штаба ОФ в Этапе 33
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St35_Scout01 = -- спавн Лазутчика предтеч в Этапе 35 
{
	inherit		= "AdventureSpawnPoint_Base", 
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St35_Scout02 = -- спавн Лазутчика предтеч в Этапе 35 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St35_Scout03 = -- спавн Лазутчика предтеч в Этапе 35 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St41_Scout01 = -- спавн Лазутчика предтеч в Этапе 41 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St41_Scout02 = -- спавн Лазутчика предтеч в Этапе 41 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St41_Scout03 = -- спавн Лазутчика предтеч в Этапе 41 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St39_CourierSpawn = -- спавн Курьера Штаба ОФ в Этапе 39
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St47_Scout01 = -- спавн Лазутчика предтеч в Этапе 47 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St47_Scout02 = -- спавн Лазутчика предтеч в Этапе 47 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St47_Scout03 = -- спавн Лазутчика предтеч в Этапе 47 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St47_Scout04 = -- спавн Лазутчика предтеч в Этапе 47 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St47_Scout05 = -- спавн Лазутчика предтеч в Этапе 47 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St51_Scout01 = -- спавн Лазутчика предтеч в Этапе 51 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St51_Scout02 = -- спавн Лазутчика предтеч в Этапе 51 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St51_Scout03 = -- спавн Лазутчика предтеч в Этапе 51 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St53_CourierSpawn = -- спавн Курьера Штаба ОФ в Этапе 53
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St59_Scout01 = -- спавн Лазутчика предтеч в Этапе 59 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St59_Scout02 = -- спавн Лазутчика предтеч в Этапе 59 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St59_Scout03 = -- спавн Лазутчика предтеч в Этапе 59 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St59_Scout04 = -- спавн Лазутчика предтеч в Этапе 59 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St59_Scout05 = -- спавн Лазутчика предтеч в Этапе 59 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St73_Scout01 = -- спавн Лазутчика предтеч в Этапе 73 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St73_Scout02 = -- спавн Лазутчика предтеч в Этапе 73 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St73_Scout03 = -- спавн Лазутчика предтеч в Этапе 73 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St83_Scout01 = -- спавн Лазутчика предтеч в Этапе 83 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St83_Scout02 = -- спавн Лазутчика предтеч в Этапе 83 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

Def.AdventureSpawnPoint_RoP2025_St83_Scout03 = -- спавн Лазутчика предтеч в Этапе 83 
{
	inherit		= "AdventureSpawnPoint_Base",
	in_editor	= true,
}

-- ТОЧКИ СПАВНА В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (КОНЕЦ БЛОКА)

------------------------------
------ Квестовые мобы --------
Def.AdvShip_AngrySecuritySDS_M_feia = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "C_AngrySecuritySDS_M_T3_feia",
	hull_health_mul	= 1.5,
	shield_max_mul	= 1.5,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments = nil,
	karma_reward_kill	= 2,
	uiName = "AdvShip_AngrySecuritySDS_M_feia",
}

Def.AdvShip_AmbushPirate_M_wgr3 = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "C_Pirates_M_wgr3",
	hull_health_mul	= 1,
	shield_max_mul	= 1,
	plasma_damage_mul	= 1,
	railgun_damage_mul	= 1,
	laser_damage_mul	= 1,
	uiName	= "AdvShip_AmbushPirate_M_wgr3",
	loot_increments	= nil,
}

Def.AdvShip_AmbushPirate_L_wgr3 = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "C_Pirate_QuestEmpire6_wgr3",
	hull_health_mul	= 2,
	shield_max_mul	= 2,
	plasma_damage_mul	= 1.5,
	railgun_damage_mul	= 1.5,
	laser_damage_mul	= 1.5,
	uiName	= "AdvShip_AmbushPirate_L_wgr3",
	loot_increments	= nil,
}

Def.AdvShip_Ronin_S_mjr = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "C_Ronin_M_T5_mjr1",
	hull_health_mul	= 2,
	shield_max_mul	= 2,
	plasma_damage_mul	= 1.5,
	railgun_damage_mul	= 1.5,
	laser_damage_mul	= 1.5,
	uiName	= "AdvShip_Ronin_S_mjr",
	loot_increments	= nil,
}

Def.AdvShip_NewGround_H_Emp = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	storeItemId			= 0,
	inherit	= "Ship_Race1_H_T5_Uniq", --"Ship_Race1_H_T5_Uniq",
	--default_modules[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]="Weapon_Plasmagun_Autofire_Ref_C"
	hull_health_mul	= 80,
	shield_max_mul	= 80,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_NewGround_H_Emp",
}
Def.AdvShip_NewGround_M_Emp = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	storeItemId			= 0,
	inherit	= "Ship_Race1_M_T5_Faction2",--"Ship_Race1_M_T5_Faction2",
	hull_health_mul	= 10,
	shield_max_mul	= 10,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_NewGround_M_Emp",
}
Def.AdvShip_NewGround_H_Fed = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	storeItemId			= 0,
	inherit	= "Ship_Race3_H_T5_Uniq", 
	hull_health_mul	= 80,
	shield_max_mul	= 80,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_NewGround_H_Fed",
}
Def.AdvShip_NewGround_M_Fed = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	storeItemId			= 0,
	inherit	= "Ship_Race3_M_T5_Faction2",
	hull_health_mul	= 10,
	shield_max_mul	= 10,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_NewGround_M_Fed",
}
Def.AdvShip_NewGround_H_Jer = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	storeItemId			= 0,
	inherit	= "Ship_Race2_H_T5_Relic",
	hull_health_mul	= 80,
	shield_max_mul	= 80,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_NewGround_H_Jer",
}
Def.AdvShip_NewGround_M_Jer = 
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	storeItemId			= 0,
	inherit	= "Ship_Race2_M_T5_Faction2",
	hull_health_mul	= 10,
	shield_max_mul	= 10,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_NewGround_M_Jer",
}

Def.AdvShip_BlackRelayRace_Carrier =
{ 
	avtomat = "Ride",
	notAlwaysVisible = true,
	damageable		= false,
	inherit	= "Ship_OW_Fed_Guard_M1",
	hull_health_mul	= 20,
	shield_max_mul	= 20,
	plasma_damage_mul	= 1.5,
	railgun_damage_mul	= 1.5,
	laser_damage_mul	= 1.5,
	uiName	= "AdvShip_BlackRelayRace_Carrier",
	loot_increments	= nil,
	relationship_group	= ai.RelationshipGroups.Neutral3,
	physics		=	{ solid_type = solid.model, mass = 80000, material = "ShipMetalMk1", },
	karma_reward_kill	= 0,
}

Def.AdvShip_BlackRelayRace_CarrierRiding =
{ 
	avtomat = "Adv_AttackAndPatrol",
	adv_pathConfig = {"Adv_Path_BRR_1", "remove"},
	notAlwaysVisible = true,
	inherit	= "Ship_OW_Fed_Guard_M1",
	hull_health_mul	= 20,
	shield_max_mul	= 20,
	plasma_damage_mul	= 2.5,
	railgun_damage_mul	= 2.5,
	laser_damage_mul	= 2.5,
	max_speed		= 30,
	uiName	= "AdvShip_BlackRelayRace_Carrier",
	loot_increments	= nil,
	relationship_group	= ai.RelationshipGroups.Neutral3,
	karma_reward_kill	= 0,
}

Def.AdvShip_BlackRelayRace_CarrierPatrole =
{ 
	avtomat = "Adv_AttackAndPatrol",
	adv_pathConfig = {"Adv_Path_BRR_1","cycle"},
	notAlwaysVisible = true,
	inherit	= "Ship_OW_Fed_Guard_M1",
	hull_health_mul	= 20,
	shield_max_mul	= 20,
	plasma_damage_mul	= 2.5,
	railgun_damage_mul	= 2.5,
	laser_damage_mul	= 2.5,
	max_speed		= 30,
	uiName	= "AdvShip_BlackRelayRace_Carrier",
	loot_increments	= nil,
	relationship_group	= ai.RelationshipGroups.Pirate,
	karma_reward_kill	= 0,
}

Def.AdvShip_BlackRelayRace_PirateM =
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Pirate_QuestEmpire3",
	hull_health_mul	= 3,
	shield_max_mul	= 3,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	uiName	= "C_Pirate_M_T1_mer1",
	loot_increments	= nil,
	hud_ico=""
}

Def.AdvShip_BlackRelayRace_PirateS =
{ 
	avtomat = "Adv_AttackAndPatrol",
	adv_pathConfig = {"Adv_Path_BRR_1","cycle"},
	notAlwaysVisible = true,
	inherit	= "Ship_OW_Elite_Pirate_EMC_Chameleon_S",
	hull_health_mul	= 2,
	shield_max_mul	= 2,
	max_speed		= 30,
	plasma_damage_mul	= 1,
	railgun_damage_mul	= 1,
	laser_damage_mul	= 1,
	--uiName	= "AdvShip_BlackRelayRace_PirateEmp",
	loot_increments	= nil,
	hud_ico=""
}

Def.PveShip_BlackRelayRace_PirateS =
{ 
	avtomat = "PveStealth_AttackAndPatrol",
	adv_pathConfig = {"PathObject1","cycle"},
	notAlwaysVisible = true,
	inherit	= "Ship_OW_Elite_Pirate_EMC_Chameleon_S",
	hull_health_mul	= 2,
	shield_max_mul	= 2,
	max_speed		= 30,
	plasma_damage_mul	= 1,
	railgun_damage_mul	= 1,
	laser_damage_mul	= 1,
	--uiName	= "AdvShip_BlackRelayRace_PirateEmp",
	loot_increments	= nil,
	hud_ico=""
}

Def.AdvShip_BlackRelayRace_FedDestroyer = 
{ 
	avtomat = "Ride",
	notAlwaysVisible = true,
	storeItemId			= 0,
	inherit	= "Ship_Race3_H_T5", 
	hull_health_mul	= 80,
	shield_max_mul	= 80,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_NewGround_H_Fed",
	relationship_group	= ai.RelationshipGroups.Neutral3,
	physics		=	{ solid_type = solid.model, mass = 80000, material = "ShipMetalMk1", },
	default_modules = {	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_PlasmaBursts_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_RangeMasterUnit_T5_Epic",
	},
}

Def.AdvShip_BlackRelayRace_EmpDestroyer = 
{ 
	avtomat = "Ride",
	notAlwaysVisible = true,
	storeItemId			= 0,
	inherit	= "Ship_Race1_H_T5", 
	hull_health_mul	= 80,
	shield_max_mul	= 80,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_NewGround_H_Emp",
	physics		=	{ solid_type = solid.model, mass = 80000, material = "ShipMetalMk1", },
	relationship_group	= ai.RelationshipGroups.Neutral3,
	default_modules = {	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_RailgunDestr_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "ModulePassive_RangeMasterUnit_T5_Epic",
	},
}

Def.AdvShip_BlackRelayRace_Emp = 
{ 
	inherit	= "AdvShip_NewGround_M_Emp",
	relationship_group	= ai.RelationshipGroups.Neutral3,
}

Def.AdvShip_BlackRelayRace_Fed = 
{ 
	inherit	= "AdvShip_NewGround_M_Fed",
	relationship_group	= ai.RelationshipGroups.Neutral3,
}

Def.AdvShip_BlackRelayRace_Al_S = 
{ 
	inherit	= "C_Crystallid_L_T5_rpep3",
	hull_health_mul	= 7,
	shield_max_mul	= 7,
	plasma_damage_mul	= 1,
	railgun_damage_mul	= 1,
	laser_damage_mul	= 1,
	avtomat = "Adv_Attack",
	--uiName = "Alien",
}

Def.AdvShip_BlackRelayRace_Al = 
{ 
	inherit	= "Alien_Predator2",
	hull_health_mul	= 15,
	shield_max_mul	= 15,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	avtomat = "Adv_Attack",
	--uiName = "Alien",
}

Def.AdvShip_WitnessY_M = 
{ 
	inherit	= "C_Cyber_M_T5_s_jrp",
	hull_health_mul	= 7,
	shield_max_mul	= 7,
	plasma_damage_mul	= 4,
	railgun_damage_mul	= 4,
	laser_damage_mul	= 4,
	uiName = "title_HALLOWEEN_CULTIST_name",
	relationship_group	= ai.RelationshipGroups.Neutral3,
	default_custom_elements = 
	{		
		[ ai.VesselCustomSlot.MATERIAL_0 ] 			= "Default_Race3_m_wolfhound_g",
		[ ai.VesselCustomSlot.MATERIAL_1 ] 			= "Objects_Car_Green",
		[ ai.VesselCustomSlot.MATERIAL_2 ] 			= "Objects_Car_Green",
	}, 
}

Def.AdvShip_Ariadna_PirateM =
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race1_M_T3_Premium",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 3,
	shield_max_mul	= 3,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Ariadna_Pirate_Boss =
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race1_M_T3_Premium",
	--default_modules={},
	--default_modules[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]="Weapon_Railgun_Basic_T1_Mk1",
	--default_modules[ ai.SpaceShipModuleSlot.ACTIVE_01 ]="Module_Empty_PvE",
	--default_modules[ ai.SpaceShipModuleSlot.ACTIVE_02 ]="Module_Empty_PvE",
	--default_modules[ ai.SpaceShipModuleSlot.ACTIVE_03 ]="Module_Empty_PvE",
	--default_modules[ ai.SpaceShipModuleSlot.ACTIVE_04 ]="Module_Invulnerability_T1_Mk1",
	--slot_bones={},
	--slot_bones[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]="root",
	--default_modules[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]="Module_AoEPassiveDamage_T3",
	
	hud_ico="elite_flame_ico",
	uiName="AI_cyber_Flame_Elite",
	hull_health_mul	= 3,
	shield_max_mul	= 3,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Emp_PirateM =
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race3_M_T2_Pirate",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 0,
	shield_max_mul	= 0,
	plasma_damage_mul	= 0,
	railgun_damage_mul	= 0,
	laser_damage_mul	= 0,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Emp_PirateS =
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race3_S_T3_Pirate",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 0,
	shield_max_mul	= 0,
	plasma_damage_mul	= 0,
	railgun_damage_mul	= 0,
	laser_damage_mul	= 0,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Emp_PirateL =
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race3_L_T3_Pirate",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 0,
	shield_max_mul	= 0,
	plasma_damage_mul	= 0,
	railgun_damage_mul	= 0,
	laser_damage_mul	= 0,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Fed_WarriorS =
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race3_S_T4",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 0,
	shield_max_mul	= 0,
	plasma_damage_mul	= 0,
	railgun_damage_mul	= 0,
	laser_damage_mul	= 0,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Fed_WarriorM =
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race3_M_T4",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 0,
	shield_max_mul	= 0,
	plasma_damage_mul	= 0,
	railgun_damage_mul	= 0,
	laser_damage_mul	= 0,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Fed_WarriorL =
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race3_L_T4",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 4,
	shield_max_mul	= 3,
	plasma_damage_mul	= 2,
	railgun_damage_mul	= 2,
	laser_damage_mul	= 2,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Jer_WarriorS = -- SC-118410 тестовый боец Иерихона (S) на базе Kris S
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race2_S_T3_Faction2",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 2,
	shield_max_mul	= 2,
	plasma_damage_mul	= 1.3,
	railgun_damage_mul	= 1.3,
	laser_damage_mul	= 1.3,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Jer_WarriorM = -- SC-118410 тестовый боец Иерихона (M) на базе Lance Bartle
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race2_M_T4_Faction1",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 2,
	shield_max_mul	= 2,
	plasma_damage_mul	= 1.7,
	railgun_damage_mul	= 1.7,
	laser_damage_mul	= 1.7,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Jer_WarriorL = -- SC-118410 тестовый боец Иерихона (L) на базе Inquisitor AE
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race2_L_T5_Faction1",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 4,
	shield_max_mul	= 5,
	plasma_damage_mul	= 3,
	railgun_damage_mul	= 4,
	laser_damage_mul	= 4,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}
Def.AdvShip_Prefinal_Jer_PirateS = -- SC-118410 тестовый моб-пират Иерихона (S) на базе Cutter
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race2_S_T4_Pirate",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 2,
	shield_max_mul	= 2,
	plasma_damage_mul	= 1.3,
	railgun_damage_mul	= 1.3,
	laser_damage_mul	= 1.3,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Jer_PirateM = -- SC-118410 тестовый моб-пират Иерихона (M) на базе Sawtooth
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race2_M_T4_Pirate",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 2,
	shield_max_mul	= 3,
	plasma_damage_mul	= 1,
	railgun_damage_mul	= 1,
	laser_damage_mul	= 1,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Jer_PirateL = -- SC-118410 тестовый моб-пират Иерихона (L) на базе Blood Tormentor
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "Ship_Race2_L_T4_Pirate",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 4,
	shield_max_mul	= 5,
	plasma_damage_mul	= 3,
	railgun_damage_mul	= 4,
	laser_damage_mul	= 4,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Jer_CrystallidP = -- SC-118410 тестовый моб-кристалолид в фазу 8 Иерихона (L) на базе C_Crystallid_Predator_L_T5_rcet
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "C_Crystallid_Predator_L_T5_rcet",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 3,
	shield_max_mul	= 3,
	plasma_damage_mul	= 3,
	railgun_damage_mul	= 3,
	laser_damage_mul	= 3,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Jer_CyberAttacker = -- SC-118410 тестовый моб-кибер в фазу 5 Иерихона (Attacker) на базе C_CyberAttacker_M_T5_s_jrp
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "C_CyberAttacker_M_T5_s_jrp",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 5,
	shield_max_mul	= 3,
	plasma_damage_mul	= 5,
	railgun_damage_mul	= 5,
	laser_damage_mul	= 5,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

Def.AdvShip_Prefinal_Jer_CyberPatrol = -- SC-118410 тестовый моб-кибер в фазу 3 Иерихона (Patrol) на базе C_CyberPatrol_M_T5_s_jrp
{ 
	avtomat = "Adv_AttackAndRun",
	notAlwaysVisible = true,
	inherit	= "C_CyberPatrol_M_T5_s_jrp",
	hud_ico="gunship_ico",
	uiName="AI_cyber_nukem",
	hull_health_mul	= 4,
	shield_max_mul	= 3,
	plasma_damage_mul	= 4,
	railgun_damage_mul	= 4,
	laser_damage_mul	= 4,
	loot_increments	= nil,
	storeItemId			= 0,
	ship4bot=true,
	hud_ico=""
}

-- КВЕСТОВЫЙ МОБ (КОРАБЛЬ) В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (НАЧАЛО БЛОКА)

-- Stage 05 (RoP2025)
Def.AdvShip_RoP2025_St03_Courier = -- Разветчик Федератов
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St03", "cycle"},
	notAlwaysVisible = true,
	vision_always = false,
	maxViewDist		= 3000, -- для Приключения ReturnOfPrecursors2025 делаем 3000, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	max_detection_distance		= 3000, -- для Приключения ReturnOfPrecursors2025 делаем 3000, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "hud_police_icon", -- иконка над объектом (щит = полиция итп)
	storeItemId			= 0,
	inherit	= "Ship_Race3_S_T4_PremUniq", -- пока взят Федератский Разведчик R8 Nightingale хотя можно и Иерихонский Pilum: Ship_Race2_S_T5_Pilum
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= false,
	hull_health_mul	= 100,
	shield_max_mul	= 100,
	max_speed		= 45, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 5,
	railgun_damage_mul	= 3,
	laser_damage_mul	= 3,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_RoP2025_St03_Courier", -- было AdvShip_NewGround_M_Fed
}

-- Stage 07 (RoP2025)
Def.AdvShip_RoP2025_St07_ScoutEmptySt071 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St071", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 270,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 400, -- восстановление щита на "ед. в секунду"
	hull_regen = 200, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.5,
	railgun_damage_mul	= 1.5,
	laser_damage_mul	= 1.5,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St07_ScoutEmptySt072 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St072", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 270,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 400, -- восстановление щита на "ед. в секунду"
	hull_regen = 200, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.5,
	railgun_damage_mul	= 1.5,
	laser_damage_mul	= 1.5,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St07_ScoutEmptySt073 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St073", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 270,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 400, -- восстановление щита на "ед. в секунду"
	hull_regen = 200, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.5,
	railgun_damage_mul	= 1.5,
	laser_damage_mul	= 1.5,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St07_ScoutEmptySt074 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St074", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 270,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 400, -- восстановление щита на "ед. в секунду"
	hull_regen = 200, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.5,
	railgun_damage_mul	= 1.5,
	laser_damage_mul	= 1.5,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St07_ScoutEmptySt075 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St075", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 270,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 400, -- восстановление щита на "ед. в секунду"
	hull_regen = 200, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.5,
	railgun_damage_mul	= 1.5,
	laser_damage_mul	= 1.5,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St00_ScoutLoaded = -- Лазутчик Предтеч "заряженный" (с выпадающим лутом) "St00" = "любой этап (неважно)"
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St075", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 270,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 350, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.75,
	railgun_damage_mul	= 1.75,
	laser_damage_mul	= 1.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St00_RoP2025_MinionEmpty = -- Дозорный Предтеч "холостой" (с выпадающим лутом) "St00" = "любой этап (неважно)"
{ 
	avtomat = "Ride",
	--adv_pathConfig = {"Adv_Path_RoP2025_St075", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "Alien_Scout2", -- в качестве "Наследователя" взят такой (можно попробовать C_Biomorph_M_T5_rcii из Инвертора (там они "злые") - но выдаёт ошибки по костям, что не хорошо 
	model = "models/objects/ships_huge/prec_interceptor/prec_interceptor", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 550,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Alien, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 54.5,
	shield_max_mul	= 54.5,
	shield_regen = 650, -- восстановление щита на "ед. в секунду"
	hull_regen = 450, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.55,
	railgun_damage_mul	= 1.55,
	laser_damage_mul	= 1.55,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота, раскомментируем, когда нужен будет бот без лута
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_Minion", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St00_RoP2025_Minion = -- Дозорный Предтеч "заряженный" (с выпадающим лутом) "St00" = "любой этап (неважно)"
{ 
	avtomat = "Ride",
	--adv_pathConfig = {"Adv_Path_RoP2025_St075", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "Alien_Scout2", -- в качестве "Наследователя" взят такой (можно попробовать C_Biomorph_M_T5_rcii из Инвертора (там они "злые") - но выдаёт ошибки по костям, что не хорошо 
	model = "models/objects/ships_huge/prec_interceptor/prec_interceptor", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 700,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Alien, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 54.5,
	shield_max_mul	= 54.5,
	shield_regen = 30000, -- восстановление щита на "ед. в секунду" в базе стояло 600, но поскольку тут у нас патроны дают "х50" то ставим 600х50 = 30 000
	hull_regen = 17500, -- восстановление корпуса на "ед. в секунду" в базе стояло 350, но поскольку тут у нас патроны дают "х50" то ставим 350х50 = 17 500
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.35,
	railgun_damage_mul	= 1.35,
	laser_damage_mul	= 1.35,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_MinionLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_Minion", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St00_RoP2025_Guard = -- Стражник Предтеч "заряженный" (с выпадающим лутом) "St00" = "любой этап (неважно)"
{ 
	avtomat = "Ride",
	--adv_pathConfig = {"Adv_Path_RoP2025_St075", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "Alien_Predator2", -- в качестве "Наследователя" взят такой (можно попробовать C_Crystallid_L_T5_rcii из Инвертора (там они "злые") - но выдаёт ошибки по костям, что не хорошо
	model = "models/objects/ships_huge/prec_predator/prec_predator", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 700,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Alien, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 52.5,
	shield_max_mul	= 52.5,
	shield_regen = 25000, -- восстановление щита на "ед. в секунду" в базе стояло 600, но поскольку тут у нас патроны дают "х50" то ставим 600х50 = 30 000
	hull_regen = 14500, -- восстановление корпуса на "ед. в секунду" в базе стояло 350, но поскольку тут у нас патроны дают "х50" то ставим 350х50 = 17 500
	max_speed		= 42, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	default_rocket_munition="GuidedDrone_AlienRoP2025", -- меняем дрона, т.к. нам нужен более мощный и с нужным названием
	plasma_damage_mul	= 0.75,
	railgun_damage_mul	= 0.75,
	laser_damage_mul	= 0.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_GuardLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_Guard", -- было AdvShip_NewGround_M_Fed 
}

Def.GuidedDrone_AlienRoP2025 = -- Дрон Стражника Предтеч
{
	class					= "GuidedDrone",
	in_editor				= false,
	
	model			= "models/objects/ships_huge/prec_ship/prec_drone2", 
	physics			= { solid_type = solid.model, material = "ShipMetalMk1", mass = 1000, },
	maxViewDist		= 3000,
	
	damageable		= true,
	health			= 150000, -- в базе стояло 3000, но поскольку тут у нас патроны дают "х50" то ставим 3000х50 = 150 000

	points_reward_kill = 10,

	signature				= ai.Signature.SMALL,
	
	projectile			= "Projectile_DronAlien_Plasma_Invertor",
	shot_effect 		= "particles/weapons/drongun/muzzle",

	death_effect		= "particles/explosions/objects/alien_explosion",
	death_sound			= "sound/explosion/drone_expl",
	shot_once_sound     = "sound/weapons/aliengun/ag_drone_shot",

	trail_effect 			= "particles/ships/ship_trail",
	trail_color 			= "4 95 184 100",
	trail_size 				= 0.05,
	
	max_speed				= 50,
	acceleration			= 20,
	max_rot_speed			= 120,	-- deg per second
	max_aim_rot_speed		= 60,
	
	control_range			= 100,
	fire_rate				= 50,
	dispersion				= 1,
	optimal_range			= 150,
	max_range				= 250,
	projectile_speed		= 200,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 450,
	damage_thermal			= 0,

	cooldown				= 20,
	holder_size				= 2,
	is_limited				= true, -- #52035
	hack_immune 			= true,
	empty_holder_cooldown	= 120,
	stacks					= true,
	MunitionBayType			= ai.MunitionBayType.MBT_SECONDARY ,
	item_subtype			= ItemSubtype.BasicGuidedDron,
	storeItemId				= 0,

	uiName 					= "DroidAlienRoP2025_name",
}

-- Stage 11 (RoP2025)
Def.AdvShip_RoP2025_St11_Scout01 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St111", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 220,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 500, -- восстановление щита на "ед. в секунду"
	hull_regen = 300, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 70, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.75,
	railgun_damage_mul	= 1.75,
	laser_damage_mul	= 1.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St11_Scout02 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St112", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 220,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 500, -- восстановление щита на "ед. в секунду"
	hull_regen = 300, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 70, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.75,
	railgun_damage_mul	= 1.75,
	laser_damage_mul	= 1.75,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St11_Scout03 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St113", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 220,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 500, -- восстановление щита на "ед. в секунду"
	hull_regen = 300, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 70, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.75,
	railgun_damage_mul	= 1.75,
	laser_damage_mul	= 1.75,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St11_Scout04 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St114", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 220,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 500, -- восстановление щита на "ед. в секунду"
	hull_regen = 300, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 70, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.75,
	railgun_damage_mul	= 1.75,
	laser_damage_mul	= 1.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St11_Scout05 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St115", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 220,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 4.5,
	shield_max_mul	= 4.5,
	shield_regen = 500, -- восстановление щита на "ед. в секунду"
	hull_regen = 300, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 70, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.75,
	railgun_damage_mul	= 1.75,
	laser_damage_mul	= 1.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

-- Stage 13 (RoP2025)
Def.AdvShip_RoP2025_St13_Courier = -- Разветчик Федератов
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St13", "cycle"},
	notAlwaysVisible = true,
	vision_always = false,
	maxViewDist		= 2000, -- для Приключения ReturnOfPrecursors2025 делаем 2000, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	max_detection_distance		= 2000, -- для Приключения ReturnOfPrecursors2025 делаем 2000, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "hud_police_icon", -- иконка над объектом (щит = полиция итп)
	storeItemId			= 0,
	inherit	= "Ship_Race3_S_T4_PremUniq", -- пока взят Федератский Разведчик R8 Nightingale хотя можно и Иерихонский Pilum: Ship_Race2_S_T5_Pilum
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= false,
	hull_health_mul	= 100,
	shield_max_mul	= 100,
	max_speed		= 65, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 5,
	railgun_damage_mul	= 3,
	laser_damage_mul	= 3,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_RoP2025_St03_Courier", -- было AdvShip_NewGround_M_Fed
}

-- Stage 19 (RoP2025)
Def.AdvShip_RoP2025_St19_Scout01 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St191", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 220,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 65, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St19_Scout02 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St192", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 220,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 65, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St19_Scout03 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St193", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 270,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 65, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St19_Scout04 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St194", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 270,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 65, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St19_Scout05 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St195", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 65, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}
Def.AdvShip_RoP2025_St19_Scout06 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St196", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 65, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

-- Stage 23 (RoP2025)
Def.AdvShip_RoP2025_St23_Courier = -- Разветчик Федератов
{  
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St23", "cycle"},
	notAlwaysVisible = true,
	vision_always = false,
	maxViewDist		= 350, -- для Приключения ReturnOfPrecursors2025 делаем 350, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	max_detection_distance		= 350, -- для Приключения ReturnOfPrecursors2025 делаем 350, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	vision_radius = 200, -- радиус на котором бот "видит" врагов и агриться на них
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "hud_police_icon", -- иконка над объектом (щит = полиция итп)
	storeItemId			= 0,
	inherit	= "Ship_Race3_S_T4_PremUniq", -- пока взят Федератский Разведчик R8 Nightingale хотя можно и Иерихонский Pilum: Ship_Race2_S_T5_Pilum
	relationship_group = ai.RelationshipGroups.Neutral1, -- нейтрален к игроку пока его не атакуешь (после атаки становится врагом) (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true, -- а вот этот Курьер у нас "уничтожимый"
	hull_health_mul	= 75.5,
	shield_max_mul	= 20.5,
	shield_regen = 1800, -- восстановление щита на "ед. в секунду"
	hull_regen = 10, -- восстановление корпуса на "ед. в секунду"	
	--hull_resist_kinetic = 10, -- доп. сопротивление корпуса по типам урона
    --hull_resist_emp     = 1000, -- доп. сопротивление корпуса по типам урона
    --hull_resist_thermal = 10, -- доп. сопротивление корпуса по типам урона
	--shield_resist_kinetic = 10, -- доп. сопротивление щита по типам урона	
	--shield_resist_emp = 10, -- доп. сопротивление щита по типам урона
	--shield_resist_thermal = 10, -- доп. сопротивление щита по типам урона
	max_speed		= 58, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	boost_maxspeed_coef = 1.05, -- множитель к максимальной скорости на форсаже. По умолчанию 1.2 (т.е добавляет 20%) можно уменьшить, если не нужно чтобы бот на прямых разгонялся
	plasma_damage_mul	= 7,
	railgun_damage_mul	= 7,
	laser_damage_mul	= 7,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_RoP2025_St03_Courier", -- начиная с Этапа 3 (Stage 3) - название Курьера не меняем
}

-- Stage 33 (RoP2025)
Def.AdvShip_RoP2025_St33_Courier = -- Разветчик Федератов
{  
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St33", "cycle"},
	notAlwaysVisible = true,
	vision_always = false,
	maxViewDist		= 400, -- для Приключения ReturnOfPrecursors2025 делаем 400, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	max_detection_distance		= 400, -- для Приключения ReturnOfPrecursors2025 делаем 200, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	vision_radius = 200, -- радиус на котором бот "видит" врагов и агриться на них
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "hud_police_icon", -- иконка над объектом (щит = полиция итп)
	storeItemId			= 0,
	inherit	= "Ship_Race3_S_T4_PremUniq", -- пока взят Федератский Разведчик R8 Nightingale хотя можно и Иерихонский Pilum: Ship_Race2_S_T5_Pilum
	relationship_group = ai.RelationshipGroups.Neutral3, -- нейтрален к игроку пока его не атакуешь (после атаки становится врагом) (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true, -- а вот этот Курьер у нас "уничтожимый"
	hull_health_mul	= 3.5,
	shield_max_mul	= 1.55,
	shield_regen = 200, -- восстановление щита на "ед. в секунду"
	hull_regen = 2, -- восстановление корпуса на "ед. в секунду"	
	--hull_resist_kinetic = 10, -- доп. сопротивление корпуса по типам урона
    --hull_resist_emp     = 1000, -- доп. сопротивление корпуса по типам урона
    --hull_resist_thermal = 10, -- доп. сопротивление корпуса по типам урона
	--shield_resist_kinetic = 10, -- доп. сопротивление щита по типам урона	
	--shield_resist_emp = 10, -- доп. сопротивление щита по типам урона
	--shield_resist_thermal = 10, -- доп. сопротивление щита по типам урона
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	boost_maxspeed_coef = 1.05, -- множитель к максимальной скорости на форсаже. По умолчанию 1.2 (т.е добавляет 20%) можно уменьшить, если не нужно чтобы бот на прямых разгонялся
	plasma_damage_mul	= 21,
	railgun_damage_mul	= 21,
	laser_damage_mul	= 21,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_RoP2025_St03_Courier", -- начиная с Этапа 3 (Stage 3) - название Курьера не меняем
}

-- Stage 35 (RoP2025)
Def.AdvShip_RoP2025_St35_Scout01 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St351", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 3.25,
	railgun_damage_mul	= 3.25,
	laser_damage_mul	= 3.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St35_Scout02 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St352", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St35_Scout03 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St353", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 60, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

-- Stage 39 (RoP2025)
Def.AdvShip_RoP2025_St39_Courier = -- Разветчик Федератов (Курьер Бриггс)
{  
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St39", "cycle"},
	notAlwaysVisible = true,
	vision_always = false,
	maxViewDist		= 400, -- для Приключения ReturnOfPrecursors2025 делаем 400, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	max_detection_distance		= 400, -- для Приключения ReturnOfPrecursors2025 делаем 400, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	vision_radius = 200, -- радиус на котором бот "видит" врагов и агриться на них
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "hud_police_icon", -- иконка над объектом (щит = полиция итп)
	storeItemId			= 0,
	inherit	= "Ship_Race3_S_T4_PremUniq", -- пока взят Федератский Разведчик R8 Nightingale хотя можно и Иерихонский Pilum: Ship_Race2_S_T5_Pilum
	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Plasmagun_Basic_T1_Mk0",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true, -- а вот этот Курьер у нас "уничтожимый"
	hull_health_mul	= 2.5,
	shield_max_mul	= 1.55,
	shield_regen = 200, -- восстановление щита на "ед. в секунду"
	hull_regen = 2, -- восстановление корпуса на "ед. в секунду"	
	--hull_resist_kinetic = 10, -- доп. сопротивление корпуса по типам урона
    --hull_resist_emp     = 1000, -- доп. сопротивление корпуса по типам урона
    --hull_resist_thermal = 10, -- доп. сопротивление корпуса по типам урона
	--shield_resist_kinetic = 10, -- доп. сопротивление щита по типам урона	
	--shield_resist_emp = 10, -- доп. сопротивление щита по типам урона
	--shield_resist_thermal = 10, -- доп. сопротивление щита по типам урона
	max_speed		= 40, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	boost_maxspeed_coef = 1.05, -- множитель к максимальной скорости на форсаже. По умолчанию 1.2 (т.е добавляет 20%) можно уменьшить, если не нужно чтобы бот на прямых разгонялся
	plasma_damage_mul	= 3.5,
	railgun_damage_mul	= 3.5,
	laser_damage_mul	= 3.5,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_RoP2025_St03_Courier", -- начиная с Этапа 3 (Stage 3) - название Курьера не меняем
}

-- Stage 41 (RoP2025)
Def.AdvShip_RoP2025_St41_Scout01 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St411", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 300,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 55, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St41_Scout02 = -- Лазутчик Предтеч "холостой" (без выпадающего лута)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St412", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 300,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 55, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	--loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutEmpty", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St41_Scout03 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St413", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 300,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 5.5,
	shield_max_mul	= 5.5,
	shield_regen = 600, -- восстановление щита на "ед. в секунду"
	hull_regen = 500, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 55, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 2.75,
	railgun_damage_mul	= 2.75,
	laser_damage_mul	= 2.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

-- Stage 47 (RoP2025)
Def.AdvShip_RoP2025_St47_Scout01 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St471", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 3.35,
	shield_max_mul	= 3.35,
	shield_regen = 350, -- восстановление щита на "ед. в секунду"
	hull_regen = 300, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 32, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.25,
	railgun_damage_mul	= 1.25,
	laser_damage_mul	= 1.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St47_Scout02 = -- Лазутчик Предтеч "заряженный" (Пространственный сканер «голдовый» на корабли R1-3.)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St472", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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
	
	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 3.35,
	shield_max_mul	= 3.35,
	shield_regen = 350, -- восстановление щита на "ед. в секунду"
	hull_regen = 300, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 32, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.25,
	railgun_damage_mul	= 1.25,
	laser_damage_mul	= 1.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_SpaceScanNewbie", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St47_Scout03 = -- Лазутчик Предтеч "заряженный" (Пространственный сканер «голдовый» на корабли R1-3.)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St473", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 3.35,
	shield_max_mul	= 3.35,
	shield_regen = 350, -- восстановление щита на "ед. в секунду"
	hull_regen = 300, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 32, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.25,
	railgun_damage_mul	= 1.25,
	laser_damage_mul	= 1.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_SpaceScanNewbie", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St47_Scout04 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St474", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 3.75,
	shield_max_mul	= 3.75,
	shield_regen = 450, -- восстановление щита на "ед. в секунду"
	hull_regen = 350, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 35, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.75,
	railgun_damage_mul	= 1.75,
	laser_damage_mul	= 1.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St47_Scout05 = -- Лазутчик Предтеч "заряженный" (Пространственный сканер «голдовый» на корабли R1-3.)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St475", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )
	
	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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
	
	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 3.75,
	shield_max_mul	= 3.75,
	shield_regen = 450, -- восстановление щита на "ед. в секунду"
	hull_regen = 350, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 35, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 1.75,
	railgun_damage_mul	= 1.75,
	laser_damage_mul	= 1.75,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_SpaceScanNewbie", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

-- Stage 51 (RoP2025)
Def.AdvShip_RoP2025_St51_Scout01 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St511", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 12.55,
	shield_max_mul	= 12.55,
	shield_regen = 750, -- восстановление щита на "ед. в секунду"
	hull_regen = 450, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 50, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 4.05,
	railgun_damage_mul	= 4.05,
	laser_damage_mul	= 4.05,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St51_Scout02 = -- Лазутчик Предтеч "заряженный" (Пространственный сканер «голдовый» на корабли R1-3.)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St512", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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
	
	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 12.55,
	shield_max_mul	= 12.55,
	shield_regen = 750, -- восстановление щита на "ед. в секунду"
	hull_regen = 450, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 50, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 4.05,
	railgun_damage_mul	= 4.05,
	laser_damage_mul	= 4.05,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St51_Scout03 = -- Лазутчик Предтеч "заряженный" (Пространственный сканер «голдовый» на корабли R1-3.)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St513", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 250,
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 12.75,
	shield_max_mul	= 12.75,
	shield_regen = 650, -- восстановление щита на "ед. в секунду"
	hull_regen = 350, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 45, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 4.05,
	railgun_damage_mul	= 4.05,
	laser_damage_mul	= 4.05,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

-- Stage 53 (RoP2025)
Def.AdvShip_RoP2025_St53_Courier = -- Разветчик Федератов (Курьер Бриггс)
{  
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St53", "cycle"},
	notAlwaysVisible = true,
	vision_always = false,
	maxViewDist		= 400, -- для Приключения ReturnOfPrecursors2025 делаем 400, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	max_detection_distance		= 400, -- для Приключения ReturnOfPrecursors2025 делаем 400, при его сокрытии = делаем 0.1 (ОТМЕНЕНО)
	vision_radius = 200, -- радиус на котором бот "видит" врагов и агриться на них
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "hud_police_icon", -- иконка над объектом (щит = полиция итп)
	storeItemId			= 0,
	inherit	= "Ship_Race3_S_T4_PremUniq", -- пока взят Федератский Разведчик R8 Nightingale хотя можно и Иерихонский Pilum: Ship_Race2_S_T5_Pilum
	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Plasmagun_Basic_T1_Mk0",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true, -- а вот этот Курьер у нас "уничтожимый"
	hull_health_mul	= 10.55,
	shield_max_mul	= 10.55,
	shield_regen = 750, -- восстановление щита на "ед. в секунду"
	hull_regen = 450, -- восстановление корпуса на "ед. в секунду"	
	--hull_resist_kinetic = 10, -- доп. сопротивление корпуса по типам урона
    --hull_resist_emp     = 1000, -- доп. сопротивление корпуса по типам урона
    --hull_resist_thermal = 10, -- доп. сопротивление корпуса по типам урона
	--shield_resist_kinetic = 10, -- доп. сопротивление щита по типам урона	
	--shield_resist_emp = 10, -- доп. сопротивление щита по типам урона
	--shield_resist_thermal = 10, -- доп. сопротивление щита по типам урона
	max_speed		= 39, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	boost_maxspeed_coef = 1.05, -- множитель к максимальной скорости на форсаже. По умолчанию 1.2 (т.е добавляет 20%) можно уменьшить, если не нужно чтобы бот на прямых разгонялся
	plasma_damage_mul	= 15.5,
	railgun_damage_mul	= 15.5,
	laser_damage_mul	= 15.5,
	loot_increments = nil,
	karma_reward_kill	= 0,
	ship4bot=true,
	uiName = "AdvShip_RoP2025_St03_Courier", -- начиная с Этапа 3 (Stage 3) - название Курьера не меняем
}

-- Stage 59 (RoP2025) Уничтожить 5 Лазутчиков на  Экзорцисте
Def.AdvShip_RoP2025_St59_Scout01 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St591", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 450,
	vision_radius = 300, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Hostile2, -- враг всем игрокам но друг всей карте (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 2.75,
	shield_max_mul	= 2.75,
	shield_regen = 300, -- восстановление щита на "ед. в секунду"
	hull_regen = 250, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 25, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.25,
	railgun_damage_mul	= 30.25,
	laser_damage_mul	= 30.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St59_Scout02 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St592", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 450,
	vision_radius = 300, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Hostile2, -- враг всем игрокам но друг всей карте (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 2.75,
	shield_max_mul	= 2.75,
	shield_regen = 300, -- восстановление щита на "ед. в секунду"
	hull_regen = 250, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 25, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.25,
	railgun_damage_mul	= 30.25,
	laser_damage_mul	= 30.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St59_Scout03 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St593", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 450,
	vision_radius = 300, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Hostile2, -- враг всем игрокам но друг всей карте (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 2.75,
	shield_max_mul	= 2.75,
	shield_regen = 300, -- восстановление щита на "ед. в секунду"
	hull_regen = 250, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 25, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.25,
	railgun_damage_mul	= 30.25,
	laser_damage_mul	= 30.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St59_Scout04 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St594", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 450,
	vision_radius = 300, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Hostile2, -- враг всем игрокам но друг всей карте (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 2.75,
	shield_max_mul	= 2.75,
	shield_regen = 300, -- восстановление щита на "ед. в секунду"
	hull_regen = 250, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 25, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.25,
	railgun_damage_mul	= 30.25,
	laser_damage_mul	= 30.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St59_Scout05 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St595", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 450,
	vision_radius = 300, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Hostile2, -- враг всем игрокам но друг всей карте (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 2.75,
	shield_max_mul	= 2.75,
	shield_regen = 300, -- восстановление щита на "ед. в секунду"
	hull_regen = 250, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 25, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.25,
	railgun_damage_mul	= 30.25,
	laser_damage_mul	= 30.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

-- Stage 73 (RoP2025) Уничтожить 3 Лазутчиков на  Экзорцисте
Def.AdvShip_RoP2025_St73_Scout01 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St731", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 450,
	vision_radius = 300, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Hostile2, -- враг всем игрокам но друг всей карте (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 2.75,
	shield_max_mul	= 2.75,
	shield_regen = 250, -- восстановление щита на "ед. в секунду"
	hull_regen = 150, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 25, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.25,
	railgun_damage_mul	= 30.25,
	laser_damage_mul	= 30.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St73_Scout02 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St732", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 450,
	vision_radius = 300, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Hostile2, -- враг всем игрокам но друг всей карте (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 2.75,
	shield_max_mul	= 2.75,
	shield_regen = 250, -- восстановление щита на "ед. в секунду"
	hull_regen = 150, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 25, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.25,
	railgun_damage_mul	= 30.25,
	laser_damage_mul	= 30.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St73_Scout03 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St733", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_C_T5",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 450,
	vision_radius = 300, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Hostile2, -- враг всем игрокам но друг всей карте (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 2.75,
	shield_max_mul	= 2.75,
	shield_regen = 250, -- восстановление щита на "ед. в секунду"
	hull_regen = 150, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 25, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.25,
	railgun_damage_mul	= 30.25,
	laser_damage_mul	= 30.25,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_ScoutLoaded", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

-- Stage 83 (RoP2025)
Def.AdvShip_RoP2025_St83_Scout01 = -- Лазутчик Предтеч "заряженный" (с выпадающеим лутом)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St831", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_RoP2025",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
		[ai.SpaceShipModuleSlot.CPU_MOD_02] = "Module_IvertorAnomalySpy",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 400,
	vision_radius = 450, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 12.55,
	shield_max_mul	= 12.55,
	shield_regen = 1500, -- восстановление щита на "ед. в секунду"
	hull_regen = 1200, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 50, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.05,
	railgun_damage_mul	= 30.05,
	laser_damage_mul	= 30.05,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_TaiThaqGun", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St83_Scout02 = -- Лазутчик Предтеч "заряженный" (Пространственный сканер «голдовый» на корабли R1-3.)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St832", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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
	
	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_RoP2025",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
		[ai.SpaceShipModuleSlot.CPU_MOD_02] = "Module_IvertorAnomalySpy",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 400,
	vision_radius = 450, -- радиус на котором бот "видит" врагов и агриться на них	
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 12.55,
	shield_max_mul	= 12.55,
	shield_regen = 1500, -- восстановление щита на "ед. в секунду"
	hull_regen = 1200, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 50, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.05,
	railgun_damage_mul	= 30.05,
	laser_damage_mul	= 30.05,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_TaiThaqGun", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

Def.AdvShip_RoP2025_St83_Scout03 = -- Лазутчик Предтеч "заряженный" (Пространственный сканер «голдовый» на корабли R1-3.)
{ 
	avtomat = "Ride",
	adv_pathConfig = {"Adv_Path_RoP2025_St833", "cycle"}, -- универсальная сущность на разные этапы и зоны, поэтому путь не уместен (комментируем)
	inherit	= "C_Biomorph_M_T5_rcii", -- в качестве "Наследователя" взят мою их Инвертора (там они "злые")
	-- model = "models/objects/ships_huge/prec_ship/prec_drone2", -- модель если она отличается от Наследователя (в базе стояла "models/ships/race_2/m/race2_m_t3_precursor" )

	slot_bones = -- Прописаны боту все слоты под боевые модули и модификаторы (чтобы установить нужный). В принципе, если все не требуются - можно оставить только необходимые
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

	default_modules = 
	{	
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_ReaverGun_Ref_RoP2025",
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TurretPlasma_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_DTurret_Plasma",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_TurretThermo_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_SmartBomb_OW",
	--	[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_HackWeapon_Self_OW",
		[ai.SpaceShipModuleSlot.CPU_MOD_01] = "Module_StelthCourier",
		[ai.SpaceShipModuleSlot.CPU_MOD_02] = "Module_IvertorAnomalySpy",
	},
	notAlwaysVisible = true,
	vision_always = false,
	-- maxViewDist		= 3000, -- актуально для больших объектов (типа Корабля Предтеч или Дредноута), для кораблей дучше удалять или коментировать
	max_detection_distance		= 400,
	vision_radius = 450, -- радиус на котором бот "видит" врагов и агриться на них
	hud_visibility_type 		= "major", -- Виден на миникарте
	hud_ico						= "nlo_2", -- иконка над объектом (щит = полиция и т.п.) Варианты: "gunship_ico", "nlo_2",
	storeItemId			= 0,
	relationship_group = ai.RelationshipGroups.Neutral4, -- всегда нейтрал карте, и игрокам  но не сам себе (см. ..\work_version\pc\data\scripts\general\special_ow_features.lua, строки 307-404, "function Mission:SetDefaultRelationship")
    --npc_type = ai.NPCType.KIBER,
	--in_editor			= true,
	damageable			= true,
	hull_health_mul	= 12.75,
	shield_max_mul	= 12.75,
	shield_regen = 1500, -- восстановление щита на "ед. в секунду"
	hull_regen = 1200, -- восстановление корпуса на "ед. в секунду"
	max_speed		= 45, -- в игре умножается на "х10" (т.е. max_speed = 80 >>> в игре это 800 м/с = "максимальная скорость корабля на форсаже без варпа" (т.е. "мало кто сможет догнать")
	plasma_damage_mul	= 30.05,
	railgun_damage_mul	= 30.05,
	laser_damage_mul	= 30.05,
	--loot_increments = nil, -- раскомментируем, когда нужен будет бот без лута
	loot_crate="LootCrate_RoP2025_TaiThaqGun", -- прописывается какой лут выпадает из бота
	karma_reward_kill	= 0, 
	ship4bot=true,
	uiName = "AdvShip_RoP2025_ScoutLoaded", -- было AdvShip_NewGround_M_Fed 
}

-- КВЕСТОВЫЙ МОБ (КОРАБЛЬ) В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (КОНЕЦ БЛОКА)

-----------------------------
------- Квестгиверы ---------
Def.Adventure_Giver_Base	=
{
	class						= "AdventureGiverEntity",
	in_editor					= true,
	damageable					= false,
	interaction_distance		= 75,
	auto_interaction			= false,
	interacting_fx				= "particles/ships/looting",
	interacting_success_fx		= "particles/ships/looted",
	max_adventures				= 1, -- макс количество квестов в окне
	ignore_relationship_restriction = false,

	start_hour					= "2022-01-01T05:00:00Z",
	interval_hours 				= 6,

	vision_always 				= true,
	hudType						= "default",
	hud_visibility_type 		= "major",
	hud_ico						= "hud_police_icon",

	hologram_def = {
		def = "Adventure_ExclamationMark", joint = "main" , offset = Vec3(0,5,12.1),
	},
}

Def.Adventure_Giver_SirMichale =
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	physics						= { solid_type = solid.compound_model, material = "Metal", static = true,  },
	in_editor					= false,
	uiName						= "Sir Michale",
	interaction_time			= 0.25,
	interval_hours 				= 1,
	max_adventures				= 10,
	
	-- cvars.adventure_saveGiverOffers = 1 -- при 1 - сохраняются предложения, при 0 - не сохраняются
	
	adventures_to_give			= {
		--{ adventure = ai.Adventures.TestScriptStages,	weight = 1		},
		--{ adventure = ai.Adventures.TestNativeStages,	weight = 100500	},
		--{ adventure = ai.Adventures.PikabuEvent,		weight = 1		},
		{ adventure = ai.Adventures.Jericho_MendesXI_MJR_1,	weight = 1		},	
		--{ adventure = ai.Adventures.TestMechanics,	weight = 1		},	
		--{ adventure = ai.Adventures.Empire_Guardian17_wgr3_1,	weight = 1		},
		--{ adventure = ai.Adventures.Federation_NewEdem_1,		weight = 1	},
		--{ adventure = ai.Adventures.Federation_NewEdem_2,		weight = 1	},
		--{ adventure = ai.Adventures.Federation_NewEdem_3,		weight = 1	},
	},
}

Def.Adventure_Giver_EmpireMainStation = 
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	--physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal", },
	uiName						= "AdventureGiver_EmpireCoordinator_name",
	--interaction_time			= 2,
	
	max_adventures				= 3,
	adventures_to_give			= {
		{ adventure = ai.Adventures.Empire_Guardian17_2,	weight = 1	},
		{ adventure = ai.Adventures.Empire_Guardian17_3,	weight = 1	},		
		{ adventure = ai.Adventures.Empire_Guardian17_wgr3_1,		weight = 1		},
	},
}

Def.Adventure_Giver_FederationMainStation = 
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	--physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal", },
	uiName						= "AdventureGiver_FederationCoordinator_name",
	--interaction_time			= 2,
	
	max_adventures				= 3,
	adventures_to_give			= {
		{ adventure = ai.Adventures.Federation_NewEdem_1,		weight = 1	},
		{ adventure = ai.Adventures.Federation_NewEdem_2,		weight = 1	},
		{ adventure = ai.Adventures.Federation_NewEdem_3,		weight = 1	},	
		{ adventure = ai.Adventures.Federation_NewEdem_feia_1,	weight = 1	},
		{ adventure = ai.Adventures.BlackRelayRace,				weight = 100	}, -- если заккмментировать строку = Закрытие "Чёрной эстафеты" (просто Гивер квест не выдаёт), в рамках тикета SC-119445 Отключить ивент "Черная эстафета". НЕ забыть задизейблить BlackRelayRace_1 - BlackRelayRace_11 (лист ow)
	},
}

Def.Adventure_Giver_JerichoMainStation = 
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	--physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal", },
	uiName						= "AdventureGiver_JerichoCoordinator_name",
	--interaction_time			= 2,
	
	max_adventures				= 3,
	adventures_to_give			= {
		{ adventure = ai.Adventures.Jericho_MendesXI_1,	weight = 1	},
		{ adventure = ai.Adventures.Jericho_MendesXI_2,	weight = 1	},
		{ adventure = ai.Adventures.Jericho_MendesXI_3,	weight = 1	},		
		{ adventure = ai.Adventures.Jericho_MendesXI_MJR_1,		weight = 1		},
		-- { adventure = ai.Adventures.TestRestrictions,	weight = 1		},
	},
}


--[[Def.Adventure_Giver_Pikabu = 
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/objects/gameplay/pikabu_os/pikabu_os",
	--physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	physics						= { solid_type = solid.sphere, static = true, material = "Metal", },
	uiName						= "AdventureGiver_Pikabu_name",
	--interaction_time			= 2,
	hud_ico						= "",
	interaction_distance		= 30,
	interval_hours 				= 900,
	max_adventures				= 1,
	hologram_def = {
		def = "Adventure_ExclamationMark", joint = "main" , offset = Vec3(0,1.5,0),
	},
	adventures_to_give			= {
		{ adventure = ai.Adventures.PikabuEvent,	weight = 1	},
	},
}]]

Def.Adventure_Giver_LarrySeldon = 
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/weapons/drones/spyradar/spyradar",
	--physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	physics						= { solid_type = solid.sphere, static = true, material = "Metal", },
	uiName						= "AdventureGiver_LarrySeldon",
	--interaction_time			= 2,
	hud_ico						= "",
	interaction_distance		= 30,
	max_detection_distance		= 100,
	interval_hours 				= 960,
	max_adventures				= 1,
	vision_always 				= false,
	start_hour					= "2022-11-09T06:00:00Z",
	hudType						= "default",
	hud_visibility_type 		= "minor",
	hologram_def = {
		def = "Adventure_NoneMark", joint = "main" , offset = Vec3(0,1.5,0),
	},
	adventures_to_give			= {
		--{ adventure = ai.Adventures.New_ground_1,	weight = 1	},
	},
}

Def.Adventure_Giver_Ariadna = 
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	--physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal", },
	uiName						= "AdventureGiver_Ariadna",
	--interaction_time			= 2,
	hud_ico						= "",
	interaction_distance		= 30,
	interval_hours 				= 10*365*24,
	max_adventures				= 1,
	start_hour					= "2022-11-09T06:00:00Z",
	hudType						= "default",
	hud_visibility_type 		= "minor",
	hologram_def = {
		def = "Adventure_ExclamationMark", joint = "main" , offset = Vec3(0,1.5,0),
	},
	adventures_to_give			= {
		{ adventure = ai.Adventures.AriadnaTest,	weight = 100},		
	},
}

Def.Adventure_Giver_Prefinal_Emp = 
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	--physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal", },
	uiName						= "AdventureGiver_Prefinal_Emp",
	--interaction_time			= 2,
	hud_ico						= "",
	interaction_distance		= 30,
	interval_hours 				= 168,
	max_adventures				= 1,
	start_hour					= "2022-11-09T06:00:00Z",
	hudType						= "default",
	hud_visibility_type 		= "minor",
	hologram_def = {
		def = "Adventure_ExclamationMark", joint = "main" , offset = Vec3(0,1.5,0),
	},
	adventures_to_give			= {
		{ adventure = ai.Adventures.Prefinal_Emp,	weight = 100},		
	},
}

Def.Adventure_Giver_Prefinal_Fed = 
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	--physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal", },
	uiName						= "AdventureGiver_Prefinal_Fed",
	--interaction_time			= 2,
	hud_ico						= "",
	interaction_distance		= 30,
	interval_hours 				= 168,
	max_adventures				= 1,
	start_hour					= "2022-11-09T06:00:00Z",
	hudType						= "default",
	hud_visibility_type 		= "minor",
	hologram_def = {
		def = "Adventure_ExclamationMark", joint = "main" , offset = Vec3(0,1.5,0),
	},
	adventures_to_give			= {
		{ adventure = ai.Adventures.Prefinal_Fed,	weight = 100},		
	},
}

Def.Adventure_Giver_Prefinal_Jer = -- SC-118410 тестовый Иерихонский Квестгиверр
{
	inherit						= "Adventure_Giver_Base",
	model						= "models/objects/ships_huge/freighter_imper/freighter_imper",
	--physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal", },
	uiName						= "AdventureGiver_Prefinal_Jer",
	--interaction_time			= 2,
	hud_ico						= "",
	interaction_distance		= 30,
	interval_hours 				= 168,
	max_adventures				= 1,
	start_hour					= "2022-11-09T06:00:00Z",
	hudType						= "default",
	hud_visibility_type 		= "minor",
	hologram_def = {
		def = "Adventure_ExclamationMark", joint = "main" , offset = Vec3(0,1.5,0),
	},
	adventures_to_give			= {
		{ adventure = ai.Adventures.Prefinal_Jer,	weight = 100}, -- когда будет прописчано Иерихонское приключение с этим дефом - удалить федератское и раскомментировать заготовку (удалено, раскомментировано 22.11.2023)		
	},
}

-- ГИВЕР В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (НАЧАЛО БЛОКА) Коллекционер в Области раскопок №6 ( level_name="excavation_elyd_empty_lunar_l_ow" | zone_id=244 )

Def.Adventure_Giver_RoP2025_Giver = -- 
{
	inherit						= "Adventure_Giver_Base",
	in_editor					= true,	
	model						= "models/ships/race_5/l/r5_l_ellidium_25/engine", -- модель объекта (корабль или иное, с чем в локации будет взаимодействоватьб) models\ships\race_5\l\r5_l_ellidium_25\engine
	physics						=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", }, -- конкретно у данного объекта (man_wreck) физика "solid.model", у других может быть solid.compound_model - тогда комментируем эту строку и открываем нижнюю
	--physics						= { solid_type = solid.compound_model, static = true, material = "Metal", }, -- у каких то объектов может быть solid.model - тогда комментируем эту строку и открываем верхнюю 
	uiName						= "Adventure_Giver_RoP2025_Giver",
	--interaction_time			= 5,
	hud_ico						= "",
	vision_always = false,
	interaction_distance		= 5,
	max_detection_distance		= 20,	
	interval_hours 				= 960,
	max_adventures				= 1,
	start_hour					= "2025-02-25T06:00:00Z", -- дата старта (с учётом того что нужно тестерам всё проверить. Учитывая что будет запускаться с патчем то тут точность "+/- квартал"
	--hudType						= "default",
	--hud_visibility_type 		= "minor",
	--hologram_def = -- это голограмма восклицательного знака над гивером. Если не нужна то комментируем весб блок (эту строку + 3 следкющие, до закрывающей фигурной скобки)
	--{ 
	--	def = "Adventure_ExclamationMark", joint = "main" , offset = Vec3(0,1.5,0),
	--},
	hologram_def = { -- это "скрытая" голограмма восклицательного знака над гивером ("Adventure_NoneMark"). Если будет нужна - то этот блок комментируем а раскомментируем тот что выше
		def = "Adventure_NoneMark", joint = "main" , offset = Vec3(0,1.5,0),
	},
	adventures_to_give			= {
		{ adventure = ai.Adventures.RoP2025_Final,	weight = 100}, 		
	},
}

Def.Adventure_Giver_RoP2025_2_Giver = -- Гивер для 2й ЧАСТИ ПРИЛЮЧЕНИЯ
{
	inherit						= "Adventure_Giver_Base",
	in_editor					= true,	
	model						= "models/weapons/drones/spyradar/spyradar", -- модель объекта (корабль или иное, с чем в локации будет взаимодействоватьб) models\ships\race_5\l\r5_l_ellidium_25\engine
	physics						=	{ solid_type = solid.sphere, static = true, material = "Metal", }, -- конкретно у данного объекта (man_wreck) физика "solid.model", у других может быть solid.compound_model - тогда комментируем эту строку и открываем нижнюю
	--physics						= { solid_type = solid.compound_model, static = true, material = "Metal", }, -- у каких то объектов может быть solid.model - тогда комментируем эту строку и открываем верхнюю 
	uiName						= "AdventureInteractObject_RoP2025_St09_Ramirez",
	--interaction_time			= 5,
	hud_ico						= "",
	vision_always = false,
	interaction_distance		= 15,
	max_detection_distance		= 60,	
	maxViewDist 				= 100.1, -- расстояние видимости минимальное, получается пот сути "невилимый объект"
	interval_hours 				= 960,
	max_adventures				= 1,
	start_hour					= "2025-02-25T06:00:00Z", -- дата старта (с учётом того что нужно тестерам всё проверить. Учитывая что будет запускаться с патчем то тут точность "+/- квартал"
	--hudType						= "default",
	--hud_visibility_type 		= "minor",
	--[[hologram_def = { -- это голограмма восклицательного знака над гивером. Если не нужна то комментируем весб блок (эту строку + 2 следкющие, до закрывающей фигурной скобки)
		def = "Adventure_ExclamationMark", joint = "main" , offset = Vec3(0,1.5,0),
	},]]
	hologram_def = { -- это "скрытая" голограмма восклицательного знака над гивером ("Adventure_NoneMark"). Если будет нужна - то этот блок комментируем а раскомментируем тот что выше
		def = "Adventure_NoneMark", joint = "main" , offset = Vec3(0,1.5,0),
	},
	adventures_to_give			= {
		{ adventure = ai.Adventures.RoP2025_2_Final,	weight = 100}, 		
	},
}
-- ГИВЕР В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (КОНЕЦ БЛОКА)

--------------------------------
--------- Голограммы -----------
Def.Adventure_NoneMark =
{
	class				= "ScBaseEntity",
	model				= "",
	physics				= { solid_type = solid.none },
}

Def.Adventure_ExclamationMark =
{
	class				= "ScBaseEntity",
	model				= "models/objects/gameplay/signs/sign_02",
	physics				= { solid_type = solid.none },
}

Def.Adventure_QuestionMark =
{
	class				= "ScBaseEntity",
	model				= "models/objects/gameplay/signs/sign_01",
	physics				= { solid_type = solid.none },
}