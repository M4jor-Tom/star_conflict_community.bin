Def.LootCrate_Base =
{
	class = "LootCrate",
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
}

Def.LootCrate_Static =
{
	inherit = "LootCrate_Base",
	model = "models/objects/gameplay/loot_box/loot_box",
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	uiName = "LootCrate_LootBox",
}

Def.LootCrate_Dynamic =
{
	inherit = "LootCrate_Base",

	physics = { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 100, damping = 0.4, rot_damping = 0.4, },
	model = "models/objects/gameplay/loot_box/loot_box",
	health = 3000,
	damageable = false,
	uiName = "LootCrate_LootBox",

	owner_effect = "particles/other/loot_owner_highlight",
}

-- используется для дропа квестовых вещей
Def.LootCrate_Quest =
{
	inherit = "LootCrate_Static",
}

-- используется для генерации ящиков выпадаемых из игроков
Def.LootCrate_PlayerLootDrop =
{
	inherit 	= "LootCrate_Dynamic",
	in_editor	= false,
	damageable  = false,
}

-- используется для генерации ящиков с секретными документами выпадаемыми из игроков
Def.LootCrate_PlayerLootDropSDLootCrate = 
{
	inherit 	= "LootCrate_Dynamic",
	in_editor	= false,
	damageable  = false,

	uiName		= "Loot_SecretDocument",
	vision_always = true,
	hudType 	= "default",
	hud_ico		= "secretDocs",
}

-- используется для генерации ящиков с секретными документами выпадаемыми из игроков
Def.LootCrate_PlayerLootDropSDCargoShip = 
{
	inherit 	= "LootCrate_Dynamic",
	in_editor	= false,
	damageable  = false,

	uiName		= "Loot_SecretDocument_Armada_name",
	vision_always = true,
	hudType 	= "default",
	hud_ico		= "secretDocs",
}


Def.LootCrate_OW2_Ore =
{
	inherit = "LootCrate_Dynamic",
	model = "models/objects/gameplay/loot_minerals/crystal_mineral_01",
	physics = { solid_type = solid.model, static = false, material = "Rock", mass = 100, damping = 0.4, rot_damping = 0.4, },
}

Def.LootCrate_OW2_GreenOre =
{
	inherit = "LootCrate_Dynamic",
	model = "models/objects/gameplay/minerals/crystal_loot",
	physics = { solid_type = solid.model, static = false, material = "Rock", mass = 100, damping = 0.4, rot_damping = 0.4, },
}


Def.LootCrate_OW2_Crystal =
{
	inherit = "LootCrate_Dynamic",
	--model = "models/objects/gameplay/loot_minerals/crystal_mineral_04",
	model = "mapskit/maps/models/asteroids_rocks/mining_rocks/oskolok/oskolok_mineral",
	physics = { solid_type = solid.model, static = false, material = "Rock", mass = 100, damping = 0.4, rot_damping = 0.4, },
}

Def.LootCrate_OW2_Lava =
{
	inherit = "LootCrate_Dynamic",
	model = "models/objects/gameplay/loot_minerals/gold_mineral_01",
	physics = { solid_type = solid.model, static = false, material = "Rock", mass = 100, damping = 0.4, rot_damping = 0.4, },
}

--"LootCrate_OW2_Ore_Common"	"Руда"
--"LootCrate_OW2_Ore_Common_CrystalShard"	"Богатая руда"
Def.LootCrate_OW3_OrePoor =
{
	inherit = "LootCrate_OW2_Ore",
	loot_table = "OW3_OrePoor",
	uiName = "LootCrate_OW2_Ore_Common",
}
Def.LootCrate_OW3_OreNormal =
{
	inherit = "LootCrate_OW2_Ore",
	loot_table = "OW3_OreNormal",
	uiName = "LootCrate_OW2_Ore_Common",
}
Def.LootCrate_OW3_OreRich =
{
	inherit = "LootCrate_OW2_Lava",
	loot_table = "OW3_OreRich",
	model = "mapskit/maps/models/asteroids_rocks/mining_rocks/rich/rich_mineral",
	uiName = "LootCrate_OW2_Ore_Common_CrystalShard",
}
Def.LootCrate_OW3_OreUltraRich =
{
	inherit = "LootCrate_OW2_Crystal",
	loot_table = "OW3_OreUltraRich",
	model = "mapskit/maps/models/asteroids_rocks/mining_rocks/rich/rich_mineral",
	uiName = "LootCrate_OW2_Ore_Common_CrystalShard",
}

Def.LootCrate_OW3_GoldNugget = 
{
	inherit = "LootCrate_OW2_Crystal",
	loot_table = "OW3_GoldNugget",
	model = "mapskit/maps/models/asteroids_rocks/mining_rocks/gold/gold_mineral",
	uiName = "LootCrate_OW2_Ore_Common_CrystalShard",
}


Def.LootCrate_OW3_PoorMetalJunk =
{
	inherit			= "LootCrate_Dynamic",
	loot_table		= "OW3_PoorMetalJunk",
	uiName			= "LootCrate_PoorMetalJunk",
	in_editor		= false,
	damageable		= false,
}

Def.LootCrate_OW3_NormalMetalJunk =
{
	inherit			= "LootCrate_OW3_PoorMetalJunk",
	loot_table		= "OW3_NormalMetalJunk",
	uiName			= "LootCrate_NormalMetalJunk",
}
Def.LootCrate_OW3_GoodMetalJunk =
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	loot_table 		= "OW3_GoodMetalJunk",
	uiName 			= "LootCrate_GoodMetalJunk",
}
Def.LootCrate_OW3_GoodEventRevard =  -- эквивалент монику /20 иридиума / 2кк / какие то рецепты?
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	loot_table 		= "OW3_GoodEventRevard",
	uiName 			= "LootCrate_GoodEventRevard",
}

Def.LootCrate_OW3_Smuggling =
{
	inherit			= "LootCrate_Dynamic",
	loot_table		= "OW3_GoodEventRevard",
	uiName			= "LootCrate_OW3_Smuggling",
	in_editor		= false,
	damageable		= false,
}

Def.LootCrate_OW3_PirateBossEvent =
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	loot_table 		= "OW3_PirateBossEvent",  
	uiName 			= "LootCrate_PirateBossEvent",
}
Def.LootCrate_OW3_PirateBossEvent05 =
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	loot_table 		= "OW3_PirateBossEvent05",  --50% евент лут
	uiName 			= "LootCrate_PirateBossEvent",
}
Def.LootCrate_EventStory_Record = 
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	loot_table 		= "OW3_EventStory_Record",
	uiName 			= "LootCrate_GoodEventRevard",
}
Def.LootCrate_AlienLootQuest = 
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	loot_table 		= "OW3_AlienLootQuest",
	uiName 			= "LootCrate_GoodEventRevard",
}
Def.LootCrate_CyberLootQuest = 
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	loot_table 		= "OW3_CyberLootQuest",
	uiName 			= "LootCrate_GoodEventRevard",
}
Def.LootCrate_RobCaravanQuest = 
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	loot_table 		= "OW3_RobCaravanQuest",
	uiName 			= "LootCrate_GoodEventRevard",
}
Def.LootCrate_NewWeapons100 =  -- какие то эвенты подбодрить (пока не используем)
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	physics			= { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 100, damping = 0.4, rot_damping = 0.4, },
	loot_table 		= "OW3_NewWeapons100",
	uiName 			= "LootCrate_GoodEventRevard",
}
Def.LootCrate_NewWeapons20 = -- 5% шанс с киберов, 50% шанс с босса 
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	physics			= { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 100, damping = 0.4, rot_damping = 0.4, },
	loot_table 		= "OW3_NewWeapon20",
	uiName 			= "LootCrate_GoodEventRevard",
}
Def.LootCrate_TornadoModules = -- с пиратов
{
	inherit 		= "LootCrate_OW3_PoorMetalJunk",
	physics			= { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 100, damping = 0.4, rot_damping = 0.4, },
	loot_table 		= "OW3_TornadoModules",
	uiName 			= "LootCrate_GoodEventRevard",
}

--- лут автогена  с киберов  
Def.LootCrate_autogen_rnd_poor_13 =  --
{
	inherit 		= "LootCrate_Base",
	class			= "PersonalLootCrate",
	--physics 		= { solid_type = solid.model, static = true, material = "ShipMetalMk3",  },
	physics 		= { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 10000, damping = 0.8, rot_damping = 0.8,  },
	--model 			= "models/objects/gameplay/loot_box/loot_box",
	model 			= "models/objects/gameplay/loot_box/loot_box_opened",
	damageable 		= false,
	owner_effect 	= "particles/other/loot_owner_highlight",
	loot_table 		= "OW3_autogen_rnd_poor_13",
	uiName 			= "LootCrate_LootBox",
}
--- лут автогена  с  алиенов элиты
Def.LootCrate_autogen_rnd_poor_18 = 
{
	inherit 		= "LootCrate_autogen_rnd_poor_13",
	loot_table 		= "OW3_autogen_rnd_poor_18",
	physics 		= { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 10000, damping = 0.8, rot_damping = 0.8,  },
}
--- лут автогена  с алиенов
Def.LootCrate_autogen_BALANCED_5 = 
{
	inherit 		= "LootCrate_autogen_rnd_poor_18",
	loot_table 		= "OW3_autogen_BALANCED5",
}

--- лут автогена  с  кибер элиты
Def.LootCrate_autogen_BALANCED_18 = 
{
	inherit 		= "LootCrate_autogen_rnd_poor_18",
	loot_table 		= "OW3_autogen_BALANCED18",
}
--- лут автогена  с  слабых боссов
Def.LootCrate_autogen_SPECIAL_11 = 
{
	inherit 		= "LootCrate_autogen_rnd_poor_13",
	loot_table 		= "OW3_autogen_SPECIAL11",
--	uiName 			= "OW3_autogen_SPECIAL11",
}
--- лут автогена  с  средних боссов
Def.LootCrate_autogen_SPECIAL_18 = 
{
	inherit 		= "LootCrate_autogen_rnd_poor_13",
	loot_table 		= "OW3_autogen_SPECIAL18",
}
--- лут автогена  с  сильных боссов
Def.LootCrate_autogen_DOUBLE_13 = 
{
	inherit 		= "LootCrate_autogen_rnd_poor_13",
	loot_table 		= "OW3_autogen_DOUBLE13",
}
--- лут автогена  с  супер-чина боссов
Def.LootCrate_autogen_DOUBLE_18 =  
{
	inherit 		= "LootCrate_autogen_rnd_poor_13",
	loot_table 		= "OW3_autogen_DOUBLE18",
}



Def.LootCrate_OW2_GoodJunk1 =
{
	inherit = "LootCrate_Static",
	loot_table = "OW2_GoodJunk1",
	uiName = "LootCrate_T5_Junk",
}

Def.LootCrate_OW2_GoodJunk2 =
{
	inherit = "LootCrate_Static",
	loot_table = "OW2_GoodJunk2",
	uiName = "LootCrate_T5_Junk",
}

Def.LootCrate_OW2_GoodJunk3 =
{
	inherit = "LootCrate_Static",
	loot_table = "OW2_GoodJunk3",
	uiName = "LootCrate_T5_Junk",
}

Def.LootCrate_OW2_GoodJunk4 =
{
	inherit = "LootCrate_Static",
	loot_table = "OW2_GoodJunk4",
	uiName = "LootCrate_T5_Junk",
}

Def.LootCrate_OW2_GoodJunk5 =
{
	inherit  = "LootCrate_Static",
	loot_table = "OW2_GoodJunk5",
	uiName = "LootCrate_T5_Junk",
}

Def.LootCrate_OW2_GoodJunk6 =
{
	inherit = "LootCrate_Static",
	loot_table = "OW2_GoodJunk6",
	uiName = "LootCrate_T5_Junk",
}

Def.LootCrate_OW2_Ore_Common =
{
	inherit = "LootCrate_OW2_Ore",
	loot_table = "OW2_Ore_Common",
	uiName = "LootCrate_OW2_Ore_Common",
}

Def.LootCrate_OW2_Ore_Common_ImpureIridium =
{
	inherit = "LootCrate_OW2_Ore",
	loot_table = "OW2_Ore_Common_ImpureIridium",
	model		=	"mapskit/maps/models/asteroids_rocks/mining_rocks/vanadii/vanadii_mineral",
	uiName = "LootCrate_OW2_Ore_Common_ImpureIridium",
}

Def.LootCrate_OW2_Ore_Common_SiliconWafer =
{
	inherit = "LootCrate_OW2_Ore",
	loot_table = "OW2_Ore_Common_SiliconWafer",
	model		= "mapskit/maps/models/asteroids_rocks/mining_rocks/kremnii/kremnii_mineral",
	uiName = "LootCrate_OW2_Ore_Common_SiliconWafer",
}

Def.LootCrate_OW2_Ore_Common_TungstenOre =
{
	inherit = "LootCrate_OW2_Crystal",
	loot_table = "OW2_Ore_Common_TungstenOre",
	model		= "mapskit/maps/models/asteroids_rocks/mining_rocks/grafit/grafit_mineral",
	uiName = "LootCrate_OW2_Ore_Common_TungstenOre",
}

Def.LootCrate_OW2_Ore_Common_CrystalShard =
{
	inherit = "LootCrate_OW2_Crystal",
	loot_table = "OW2_Ore_Common_CrystalShard",
	uiName = "LootCrate_OW2_Ore_Common_CrystalShard",
}

Def.LootCrate_OW2_Ore_Common_OsmiumOre =
{
	inherit = "LootCrate_OW2_Ore",
	loot_table = "OW2_Ore_Common_OsmiumOre",
	model		=	"mapskit/maps/models/asteroids_rocks/mining_rocks/osmii/osmii_mineral",
	uiName = "LootCrate_OW2_Ore_Common_OsmiumOre",
}

Def.LootCrate_OW2_Ore_Only_ImpureIridium =
{
	inherit = "LootCrate_OW2_Ore",
	loot_table = "OW2_Ore_Only_ImpureIridium",
	model		=	"mapskit/maps/models/asteroids_rocks/mining_rocks/vanadii/vanadii_mineral",
	uiName = "LootCrate_OW2_Ore_Only_ImpureIridium",
}

Def.LootCrate_OW2_Ore_Only_SiliconWafer =
{
	inherit = "LootCrate_OW2_GreenOre",
	loot_table = "OW2_Ore_Only_SiliconWafer",
	model		= "mapskit/maps/models/asteroids_rocks/mining_rocks/kremnii/kremnii_mineral",
	uiName = "LootCrate_OW2_Ore_Only_SiliconWafer",
}

Def.LootCrate_OW2_Ore_Only_TungstenOre =
{
	inherit 	= "LootCrate_OW2_Lava",
	loot_table 	= "OW2_Ore_Only_TungstenOre",
	uiName 		= "LootCrate_OW2_Ore_Only_TungstenOre",
	model		= "mapskit/maps/models/asteroids_rocks/mining_rocks/grafit/grafit_mineral",
}

Def.LootCrate_OW2_Ore_Only_CrystalShard =
{
	inherit = "LootCrate_OW2_Crystal",
	loot_table = "OW2_Ore_Only_CrystalShard",
	uiName = "LootCrate_OW2_Ore_Only_CrystalShard",
}

Def.LootCrate_OW2_Ore_Only_OsmiumOre =
{
	inherit = "LootCrate_OW2_Ore",
	loot_table = "OW2_Ore_Only_OsmiumOre",
	model		=	"mapskit/maps/models/asteroids_rocks/mining_rocks/osmii/osmii_mineral",
	uiName  = "LootCrate_OW2_Ore_Only_OsmiumOre",
}

Def.LootCrate_OW2_Ore_Only_Irirdim_Silicon =
{
	inherit = "LootCrate_OW2_GreenOre",
	loot_table = "OW2_Ore_Only_Irirdim_Silicon",
	uiName = "LootCrate_OW2_Ore_Only_Irirdim_Silicon",
}

Def.LootCrate_OW2_Ore_Only_Silicon_Tungsten =
{
	inherit = "LootCrate_OW2_Lava",
	loot_table = "OW2_Ore_Only_Silicon_Tungsten",
	uiName = "LootCrate_OW2_Ore_Only_Silicon_Tungsten",
}

Def.LootCrate_OW2_Ore_Only_Tungsten_Crystal =
{
	inherit = "LootCrate_OW2_Lava",
	loot_table = "OW2_Ore_Only_Tungsten_Crystal",
	uiName = "LootCrate_OW2_Ore_Only_Tungsten_Crystal",
}

Def.LootCrate_OW2_Ore_Only_Crystal_Osmium =
{
	inherit = "LootCrate_OW2_Crystal",
	loot_table = "OW2_Ore_Only_Crystal_Osmium",
	uiName = "LootCrate_OW2_Ore_Only_Crystal_Osmium",
}

Def.LootCrate_OW2_TreasureChest =
{
	inherit = "LootCrate_Static",
	model = "models/objects/gameplay/loot_box/loot_box",
	loot_table = "OW2_TreasureChest",
	uiName = "LootCrate_T4",
	max_detection_distance = 100.0,
}

Def.OpenWorld_QuestLootLunar_cq34 =
{
	inherit = "LootCrate_Dynamic",
	loot_table = "OpwenWorld_QuestLunar",
	model = "models/objects/gameplay/loot_box/loot_box",
	physics = { solid_type = solid.model, static = true, material = "Metal"},
	uiName = "ow_QuestLootLunar_cq34",
	required_item = "ow_QuestLootLunar_cq34key",
	default_icon = "Pirates_broken_railgun_ico_1",
}

-- Лут выпадающий из кораблей по системе #0083783: Контролируемый дроп в Открытом мире
Def.LootCrate_OW2_LootDebris_Base2 =
{
	inherit = "LootCrate_Static",
	model = "models/objects/gameplay/loot_box/loot_box",
	uiName = "LootCrate_LootBox",
}
Def.LootCrate_Loot_4_ranks_2_3 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_4_ranks_2_3",
}
Def.LootCrate_Loot_16_ranks_3_4 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_16_ranks_3_4",
}
Def.LootCrate_Loot_28_ranks_4_4 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_28_ranks_4_4",
}
Def.LootCrate_Loot_40_ranks_4_5 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_40_ranks_4_5",
}
Def.LootCrate_Loot_52_ranks_5_5 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_52_ranks_5_5",
}
Def.LootCrate_Loot_64_ranks_5_6 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_64_ranks_5_6",
}
Def.LootCrate_Loot_76_ranks_6_6 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_76_ranks_6_6",
}
Def.LootCrate_Loot_88_ranks_6_6 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_88_ranks_6_6",
}
Def.LootCrate_Loot_100_ranks_6_7 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_100_ranks_6_7",
}
Def.LootCrate_Loot_112_ranks_7_7 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_112_ranks_7_7",
}
Def.LootCrate_Loot_124_ranks_7_7 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_124_ranks_7_7",
}
Def.LootCrate_Loot_136_ranks_7_8 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_136_ranks_7_8",
}
Def.LootCrate_Loot_148_ranks_8_8 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_148_ranks_8_8",
}
Def.LootCrate_Loot_160_ranks_8_8 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_160_ranks_8_8",
}
Def.LootCrate_Loot_172_ranks_8_8 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_172_ranks_8_8",
}
Def.LootCrate_Loot_184_ranks_8_9 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_184_ranks_8_9",
}
Def.LootCrate_Loot_196_ranks_9_9 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_196_ranks_9_9",
}
Def.LootCrate_Loot_208_ranks_9_9 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_208_ranks_9_9",
}
Def.LootCrate_Loot_220_ranks_9_9 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_220_ranks_9_9",
}
Def.LootCrate_Loot_232_ranks_9_10 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_232_ranks_9_10",
}
Def.LootCrate_Loot_244_ranks_10_10 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_244_ranks_10_10",
}
Def.LootCrate_Loot_256_ranks_10_10 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_256_ranks_10_10",
}
Def.LootCrate_Loot_268_ranks_10_11 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_268_ranks_10_11",
}
Def.LootCrate_Loot_280_ranks_11_11 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_280_ranks_11_11",
}
Def.LootCrate_Loot_292_ranks_11_11 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_292_ranks_11_11",
}
Def.LootCrate_Loot_304_ranks_12_12 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_304_ranks_12_12",
}
Def.LootCrate_Loot_316_ranks_12_12 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_316_ranks_12_12",
}
Def.LootCrate_Loot_328_ranks_12_12 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_328_ranks_12_12",
}
Def.LootCrate_Loot_340_ranks_12_13 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_340_ranks_12_13",
}
Def.LootCrate_Loot_352_ranks_13_13 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_352_ranks_13_13",
}
Def.LootCrate_Loot_364_ranks_13_13 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_364_ranks_13_13",
}
Def.LootCrate_Loot_376_ranks_13_14 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_376_ranks_13_14",
}
Def.LootCrate_Loot_388_ranks_14_14 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_388_ranks_14_14",
}
Def.LootCrate_Loot_400_ranks_14_14 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_400_ranks_14_14",
}
Def.LootCrate_Loot_412_ranks_14_15 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2", 
	loot_table = "Loot_412_ranks_14_15",
}
Def.LootCrate_Loot_424_ranks_15_15 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_424_ranks_15_15",
}
Def.LootCrate_Loot_436_ranks_15_15 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_436_ranks_15_15",
}
Def.LootCrate_Loot_448_ranks_15_15 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_448_ranks_15_15",
}
Def.LootCrate_Loot_460_ranks_15_17 =
{
	inherit = "LootCrate_OW2_LootDebris_Base2",
	loot_table = "Loot_460_ranks_15_17",
}

-- ящики, которые могут быть найдены с помощью сканера.
Def.LootCrate_Engineer_Event =
{
	inherit = "LootCrate_Static",
	loot_table = "OW_Engineer_Event",
	max_detection_distance = 30,
	vision_radius_coef = 0,
	isRare = true, -- for OwScanner
	uiName = "LootCrate_Craft_paradise",
}
Def.LootCrate_Craft_paradise_electrum =
{
	inherit = "LootCrate_Static",
	loot_table = "OW_Craft_paradise_electrum",
	max_detection_distance = 30,
	vision_radius_coef = 0,
	isRare = true, -- for OwScanner
	uiName = "LootCrate_Craft_paradise",
}
Def.LootCrate_Craft_paradise =
{
	inherit = "LootCrate_Static",
	loot_table = "OW_Craft_paradise",
	max_detection_distance = 30,
	vision_radius_coef = 0,
	isRare = true, -- for OwScanner
	uiName = "LootCrate_Craft_paradise",
}
Def.LootCrate_Craft_paradise_Weapon20 =
{
	inherit = "LootCrate_Static",
	loot_table = "OW3_Craft_paradise_Blueprints",
	max_detection_distance = 30,
	vision_radius_coef = 0,
	isRare = true, -- for OwScanner
	uiName = "LootCrate_Craft_paradise",
}

Def.LootCrate_newYear2020BattlePass =
{
	inherit = "LootCrate_Static",
	loot_table = "newYear2020BattlePass",
	max_detection_distance = 30,
	vision_radius_coef = 0,
	--isRare = true, -- for OwScanner
	uiName = "LootCrate_newYear2020BattlePass",
}

Def.OpenWorld_AprilCar_Loot =
{
	inherit = "LootCrate_Dynamic",
	model		= "models/objects/gameplay/car/man_wreck",
	physics		=	{ solid_type = solid.model, mass = 4600, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName = "LootCrate_AprilCar",
	default_icon = "AprilCar_man_ico",
}

Def.OpenWorld_AprilCar_Loot_1 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_1",
}

Def.OpenWorld_AprilCar_Loot_2 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_2",
}

Def.OpenWorld_AprilCar_Loot_3 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_3",
}

Def.OpenWorld_AprilCar_Loot_4 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_4",
}

Def.OpenWorld_AprilCar_Loot_5 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_5",
}

Def.OpenWorld_AprilCar_Loot_6 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_6",
}

Def.OpenWorld_AprilCar_Loot_7 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_7",
}

Def.OpenWorld_AprilCar_Loot_8 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_8",
}

Def.OpenWorld_AprilCar_Loot_9 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_9",
}

Def.OpenWorld_AprilCar_Loot_10 = 
{
	inherit = "OpenWorld_AprilCar_Loot",
	loot_table = "OpwenWorld_AprilCar_10",
}

Def.LootCrate_OW2_MoleShipPart=
{
	loot_table 	= "OW_MoleShipPart",
	inherit = "LootCrate_Dynamic",
}

Def.LootCrate_OW2_MoleShipPartNormal=
{
	loot_table 	= "OW_MoleShipPartNormal",
	inherit = "LootCrate_Dynamic",
}

Def.LootCrate_OW2_MoleShipPartPoor=
{
	loot_table 	= "OW_MoleShipPartPoor",
	inherit = "LootCrate_Dynamic",
}

Def.LootCrate_PikabuEvent_1 =
{
	inherit = "LootCrate_Static",
	loot_table = "OW_PikabuEvent_1",
	uiName = "LootCrate_PikabuEvent",
}
Def.LootCrate_PikabuEvent_2 =
{
	inherit = "LootCrate_Static",
	loot_table = "OW_PikabuEvent_2",
	uiName = "LootCrate_PikabuEvent",
}
Def.LootCrate_PikabuEvent_3 =
{
	inherit = "LootCrate_Static",
	loot_table = "OW_PikabuEvent_3",
	uiName = "LootCrate_PikabuEvent",
}

-- КВЕСТОВЫЙ ЛУТ (CRATE, ЯЩИКИ) В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (КОНЕЦ БЛОКА)

Def.LootCrate_RoP2025_ScoutLoaded =
{
	inherit = "LootCrate_Static",
	loot_table = "RoP2025_ScoutLoaded",
	model = "models/objects/gameplay/loot_box/loot_box",
	uiName = "LootCrate_RoP2025_ScoutLoaded",

}

Def.LootCrate_RoP2025_SpaceScanNewbie = -- "Рассвет для Hercules'а" выпадающий из Лазутчика
{
	inherit = "LootCrate_Static",
	loot_table = "RoP2025_SpaceScanNewbie",
	model = "models/objects/gameplay/loot_box/loot_box",
	uiName = "LootCrate_RoP2025_ScoutLoaded",

}

Def.LootCrate_RoP2025_MinionLoaded = -- лут из Дозорный Предтеч ("базовый" моб в Инверторе)
{
	inherit = "LootCrate_Static",
	loot_table = "RoP2025_MinionLoaded",
	model = "models/objects/gameplay/loot_box/loot_box",
	uiName = "LootCrate_RoP2025_MinionLoaded",

}

Def.LootCrate_RoP2025_GuardLoaded = -- лут из Стражник Предтеч ("тяжёлый" моб в Инверторе)
{
	inherit = "LootCrate_Static",
	loot_table = "RoP2025_GuardLoaded",
	model = "models/objects/gameplay/loot_box/loot_box",
	uiName = "LootCrate_RoP2025_GuardLoaded",

}

Def.LootCrate_RoP2025_MothershipLoaded1 = -- лут из Конкистадор (Матка) Предтеч ("ПОЖИЖЕ")
{
	inherit = "LootCrate_Static",
	loot_table = "RoP2025_MothershipLoaded1",
	model = "models/objects/gameplay/loot_box/loot_box",
	uiName = "LootCrate_RoP2025_MothershipLoaded",

}

Def.LootCrate_RoP2025_MothershipLoaded2 = -- лут из Конкистадор (Матка) Предтеч ("ПОГУЩЕ")
{
	inherit = "LootCrate_Static",
	loot_table = "RoP2025_MothershipLoaded2",
	model = "models/objects/gameplay/loot_box/loot_box",
	uiName = "LootCrate_RoP2025_MothershipLoaded",

}

Def.LootCrate_RoP2025_TaiThaqGun = -- Орудие «Tai'thaq» для Перехватчик Разведка (Роль) выпадающий из Лазутчика
{
	inherit = "LootCrate_Static",
	loot_table = "RoP2025_TaiThaqGun",
	model = "models/objects/gameplay/loot_box/loot_box",
	uiName = "LootCrate_RoP2025_ScoutLoaded",

}

-- КВЕСТОВЫЙ ЛУТ (CRATE, ЯЩИКИ) В ЭТАПАХ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 (КОНЕЦ БЛОКА)

Def.LootCrate_LootTemp_InvCrystalSnoop = -- лут из Кристаллид-ищейка (C_Crystallid_L_T5_rcii) на время фестиваля «Стойкий Стальной Пилотик», SC-119946
{
	inherit = "LootCrate_Static",
	loot_table = "LootTemp_InvCrystalSnoop",
	model = "models/objects/gameplay/loot_box/loot_box",
	uiName = "LootCrate_LootBox",

}