--
Def.LootCrate_SecretDocument_Empire =
{
	inherit 	= "LootCrate_Static",
	loot_defs	= {"Loot_SecretDocument_Empire", "Loot_SecretDocument_Empire2", },
	model		= "models/ships/race_1/s/race1_s_t2_damaged",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	
	children =
    {
		{ model = "models/ships/race_1/s/race1_s_eng1", joint = "engine_1" },
		{ model = "models/ships/race_1/s/race1_s_capacitor1", joint = "capacitor_1", },
		{ model = "models/ships/race_1/s/race1_s_boost1_l", joint = "boost_1" },
		{ model = "models/ships/race_1/s/race1_s_boost1_r", joint = "boost_2" },
		{ effect = "particles/other/beacon", joint = "root",	},
	},
	
	vision_always = true,
	hudType 	= "default",
	hud_ico		= "secretDocs",
	work_sound = "sound/game/openspace_quest/quest_ship_idle", 
	
	spawn_effect = "particles/other/wave_portal_open",
	--spawn_sound = "",
	
	uiName		= "Loot_SecretDocument_Empire",
}

--
Def.LootCrate_SecretDocument_Jericho =
{
	inherit 	= "LootCrate_Static",
	loot_defs	= {"Loot_SecretDocument_Jericho", "Loot_SecretDocument_Jericho2", },
	model		= "models/ships/race_2/s/race2_s_t2_damaged",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	
	children =
    {
		{ model = "models/ships/race_2/s/r2_s_eng1", joint = "engine_1" },
		{ model = "models/ships/race_2/s/r2_s_capacitor1", joint = "capacitor_1", }, 
		{ model = "models/ships/race_2/s/r2_s_boost1_l", joint = "boost_1" },
		{ model = "models/ships/race_2/s/r2_s_boost1_r", joint = "boost_2", },
		{ effect = "particles/other/beacon", joint = "root",	},
	},
	
	vision_always = true,
	hudType 	= "default",
	hud_ico		= "secretDocs",
	work_sound = "sound/game/openspace_quest/quest_ship_idle", 

	spawn_effect = "particles/other/wave_portal_open",
	--spawn_sound = "",
	
	uiName		= "Loot_SecretDocument_Jericho",
}

--
Def.LootCrate_SecretDocument_Federation =
{
	inherit 	= "LootCrate_Static",
	loot_defs	= {"Loot_SecretDocument_Federation", "Loot_SecretDocument_Federation2", },
	model		= "models/ships/race_3/s/race3_s_t2_damaged",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	
	children =
    {
		{ model = "models/ships/race_3/s/r3_s_eng1", joint = "engine_1" },
		{ model = "models/ships/race_3/s/r3_s_eng1", joint = "engine_2" },
		{ model = "models/ships/race_3/s/r3_s_capacitor1", joint = "capacitor_1", }, 
		{ model = "models/ships/race_3/s/r3_s_t1_boost1_l", joint = "boost_1" },
		{ model = "models/ships/race_3/s/r3_s_t1_boost1_r", joint = "boost_2", },
		{ effect = "particles/other/beacon", joint = "root",	},
	},
	
	vision_always = true,
	hudType 	= "default",
	hud_ico		= "secretDocs",
	work_sound = "sound/game/openspace_quest/quest_ship_idle", 

	spawn_effect = "particles/other/wave_portal_open",
	--spawn_sound = "",
	
	uiName		= "Loot_SecretDocument_Federation", 
}

-- 
Def.Loot_SecretDocument_Empire =
{
	inherit			= "Junk_Base",

	unique_loot		= ai.UniqueLootType.SECRET_DOC_LOOT_CRATE,
	
	default_icon 	= "Token_drop_T2",
	uiName			= "Loot_SecretDocument_Empire",
	uiDesc			= "Loot_SecretDocument_Empire_short_desc",
}

Def.Loot_SecretDocument_Event =
{
	inherit			= "Junk_Base",

	unique_loot		= ai.UniqueLootType.SECRET_DOC_CARGO_SHIP,
	
	default_icon 	= "Token_drop_T3",
	uiName			= "Loot_SecretDocument_Empire",
	uiDesc			= "Loot_SecretDocument_Empire_short_desc",
}

Def.Loot_SecretDocument_Empire2 =
{
	inherit			= "Loot_SecretDocument_Empire",

}
	
Def.Loot_SecretDocument_Legion =
{
	inherit			= "Loot_SecretDocument_Empire",

	unique_loot		= ai.UniqueLootType.SECRET_DOC_CARGO_SHIP,
	default_icon 	= "Token_drop_T3",
}
	
Def.Loot_SecretDocument_Warden =
{
	inherit			= "Loot_SecretDocument_Empire2",

	unique_loot		= ai.UniqueLootType.SECRET_DOC_CARGO_SHIP,
	default_icon 	= "Token_drop_T3",
}
	
-- 
Def.Loot_SecretDocument_Federation =
{
	inherit			= "Junk_Base",
	
	unique_loot		= ai.UniqueLootType.SECRET_DOC_LOOT_CRATE,
	
	default_icon	= "Token_drop_T2",
	uiName			= "Loot_SecretDocument_Federation",
	uiDesc			= "Loot_SecretDocument_Federation_short_desc",
}

Def.Loot_SecretDocument_Federation2 =
{
	inherit			= "Loot_SecretDocument_Federation",

}

Def.Loot_SecretDocument_Armada =
{
	inherit			= "Loot_SecretDocument_Federation",

	unique_loot		= ai.UniqueLootType.SECRET_DOC_CARGO_SHIP,
	default_icon 	= "Token_drop_T3",
}

Def.Loot_SecretDocument_Avangard =
{
	inherit			= "Loot_SecretDocument_Federation2",

	unique_loot		= ai.UniqueLootType.SECRET_DOC_CARGO_SHIP,
	default_icon 	= "Token_drop_T3",
}

-- 
Def.Loot_SecretDocument_Jericho =
{
	inherit			= "Junk_Base",
	
	unique_loot		= ai.UniqueLootType.SECRET_DOC_LOOT_CRATE,
	
	default_icon 	= "Token_drop_T2",
	uiName			= "Loot_SecretDocument_Jericho",
	uiDesc			= "Loot_SecretDocument_Jericho_short_desc",
}

Def.Loot_SecretDocument_Jericho2 =
{
	inherit			= "Loot_SecretDocument_Jericho",

}

Def.Loot_SecretDocument_Raid =
{
	inherit			= "Loot_SecretDocument_Jericho",

	unique_loot		= ai.UniqueLootType.SECRET_DOC_CARGO_SHIP,
	default_icon 	= "Token_drop_T3",
}

Def.Loot_SecretDocument_Technologist =
{
	inherit			= "Loot_SecretDocument_Jericho2",

	unique_loot		= ai.UniqueLootType.SECRET_DOC_CARGO_SHIP,
	default_icon 	= "Token_drop_T3",
}
