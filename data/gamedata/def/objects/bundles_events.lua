
-- Halloween 2018
Def.Bundle_Halloween2018 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 666,
	storeItemId			= Bundles_GetNextStoreItemId(),
	-- и остальные стандартные магазинные параметры типа cant_be_bought
	uiName				= "Bundle_Halloween2015_name",
	uiDesc				= "Bundle_Halloween2015_desc",
	cant_be_bought 		= true,
	uiPromo 			= "Bundle_Halloween2018_promo",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Pumpkin",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_1",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_2",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_3",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_4",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_5",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_6",},
		},
	},
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Pumpkin",	price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_1", price_weight = 0.14,	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_2", price_weight = 0.14,	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_3", price_weight = 0.14,	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_4", price_weight = 0.14,	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_5", price_weight = 0.14,	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "halloween2018_6", price_weight = 0.14,	},
	},
}

-- Halloween 2019
Def.Bundle_Halloween2019 =
{
    inherit = "BundleBase",
    premiumPrice = 666,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween2019_name",
    uiDesc = "Bundle_Halloween2019_desc",
    cant_be_bought = true,
    uiPromo = "Bundle_Halloween2018_promo",
    default_icon = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_DirtyWhite", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_6", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_7", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_8", },
        },
    },

    fixed_contents =
    {     
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_DirtyWhite", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_1", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_2", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_3", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_6", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_7", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2019_8", price_weight = 0.14, },
    },
}

Def.Bundle_OldHalloweenContent = 
{
	inherit				= "BundleBase",
	premiumPrice		= 66,
	storeItemId			= Bundles_GetNextStoreItemId(),
	-- и остальные стандартные магазинные параметры типа cant_be_bought
	uiName				= "Bundle_OldHalloweenContent_name",
	uiDesc				= "Bundle_OldHalloweenContent_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "bats_01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "death_01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fireball_01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "skull_001", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "spiders_01", },
		},
	},
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "bats_01", price_weight = 0.2, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "death_01", price_weight = 0.2, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fireball_01", price_weight = 0.2, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "skull_001", price_weight = 0.2, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "spiders_01", price_weight = 0.2,},
	},
}

Def.Bundle_May9 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 9,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_May9_name",
	uiDesc				= "Bundle_May9_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bundle_may9",
	default_icon		= "dlcIco",
	premiumPriceTotal 	= 9,
--	rank 		= 4,
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "may9",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Star_01",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,		str_param = "Preset9May",	},
		},
	},
		
	fixed_contents = 
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "may9",	price_weight = 0.33, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Star_01",	price_weight = 0.33, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Preset9May",	price_weight = 0.33, },
	},
}

Def.Bundle_Halloween2016 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 666,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Halloween2015_name",
	uiDesc				= "Bundle_Halloween2015_desc",
	cant_be_bought 		= true,
	uiPromo 			= "Bundle_Halloween2016_promo",
	premiumPriceTotal 	= 666,
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Pumpkin",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "bats_01",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "death_01",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "fireball_01",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "skull_001",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "spiders_01",},
		},
	},
	
	fixed_contents = 
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Pumpkin",	price_weight = 0.5, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "bats_01",	price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "death_01",	price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fireball_01",	price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "skull_001",	price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "spiders_01",	price_weight = 0.1, },
	},
}

 -- Заготовки для сундук NewYear 2017
 -- Наклейки в сундук
Def.Bundle_sticker_Snowflake_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_sticker_Snowflake_T5_chest_name",
	uiDesc				= "Bundle_sticker_Snowflake_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "bandle_NY_2_2017_large",

	fixed_contents = --фиксированный дроп
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Snowflake",	price_weight = 0.05, },
	},
	random_contents = --рандомный дроп
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 3.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 3.0,	},
		},
	},
}

Def.Bundle_sticker_Snowman_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_sticker_Snowman_T5_chest_name",
	uiDesc				= "Bundle_sticker_Snowman_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "bandle_NY_2_2017_large",

	fixed_contents = --фиксированный дроп
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Snowman",	price_weight = 0.05, },
	},
	random_contents = --рандомный дроп
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 3.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 3.0,	},
		},
	},
}

Def.Bundle_sticker_Sox_14_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_sticker_Sox_14_T5_chest_name",
	uiDesc				= "Bundle_sticker_Sox_14_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "bandle_NY_2_2017_large",

	fixed_contents = --фиксированный дроп
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Sox_14",	price_weight = 0.05, },
	},
	random_contents = --рандомный дроп
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 3.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 3.0,	},
		},
	},
}

Def.Bundle_sticker_SantaSled_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_sticker_SantaSled_T5_chest_name",
	uiDesc				= "Bundle_sticker_SantaSled_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "bandle_NY_2_2017_large",

	fixed_contents = --фиксированный дроп
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "santasled",	price_weight = 0.05, },
	},
	random_contents = --рандомный дроп
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 3.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 3.0,	},
		},
	},
}

Def.Bundle_sticker_Rudolf_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_sticker_Rudolf_T5_chest_name",
	uiDesc				= "Bundle_sticker_Rudolf_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "bandle_NY_2_2017_large",

	fixed_contents = --фиксированный дроп
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Rudolf",	price_weight = 0.05, },
	},
	random_contents = --рандомный дроп
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 3.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 3.0,	},
		},
	},
}

Def.Bundle_sticker_CristhmasTree_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_sticker_CristhmasTree_T5_chest_name",
	uiDesc				= "Bundle_sticker_CristhmasTree_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "bandle_NY_2_2017_large",

	fixed_contents = --фиксированный дроп
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "cristhmastree",	price_weight = 0.05, },
	},
	random_contents = --рандомный дроп
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 3.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 3.0,	},
		},
	},
}

Def.Bundle_sticker_SantaPirat_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_sticker_SantaPirat_T5_chest_name",
	uiDesc				= "Bundle_sticker_SantaPirat_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "bandle_NY_2_2017_large",

	fixed_contents = --фиксированный дроп
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "santapirat",	price_weight = 0.05, },
	},
	random_contents = --рандомный дроп
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 3.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 3.0,	},
		},
	},
}

Def.Bundle_sticker_Gifts_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_sticker_Gifts_T5_chest_name",
	uiDesc				= "Bundle_sticker_Gifts_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "bandle_NY_2_2017_large",

	fixed_contents = --фиксированный дроп
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "gifts",	price_weight = 0.05, },
	},
	random_contents = --рандомный дроп
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 3.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 3.0,	},
		},
	},
}

Def.Bundle_sticker_CoockieMan_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_sticker_CoockieMan_T5_chest_name",
	uiDesc				= "Bundle_sticker_CoockieMan_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "bandle_NY_2_2017_large",

	fixed_contents = --фиксированный дроп
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "coockieman",	price_weight = 0.05, },
	},
	random_contents = --рандомный дроп
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 3.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 3.0,	},
		},
	},
}



-- новый сундук на Новый год 2017
--[[
Def.Bundle_NewYear_2017_Santa_T5 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 250,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NewYear_2017_Santa_name",
	uiDesc				= "Bundle_NewYear_2017_Santa_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_1_2017",
	premiumPriceTotal 	= 250,
	default_icon		= "bundle_NY_2017_ico_small",
	
	ui_content = --иконки
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_hull", is_elite = true,},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_cpu", is_elite = true,},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_activator",	is_elite = true, },
		},		
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_hull", is_elite = true,},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_cpu", is_elite = true,},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_activator", is_elite = true,},
		},		
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Snowman",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Snowflake",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Sox_14",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Rudolf",},
		},		
		{
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "NewYear2017_experience",},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "NewYear2017_Damage",},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "NewYear2017_Speed",},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "NewYear2017_credits",},
		},
	},
	
	random_contents = --рандомный дроп
	{
		{	-- отсюда начинаются сундуки с найклейками
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "sticker_Snowflake_chest_Discount",	drop_weight = 0.05, }, 
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "sticker_Snowman_chest_Discount",	drop_weight = 0.05, }, 
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "sticker_Sox_14_chest_Discount",	drop_weight = 0.05, }, 
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "sticker_SantaSled_chest_Discount",	drop_weight = 0.05, }, 
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "sticker_Rudolf_chest_Discount",	drop_weight = 0.05, }, 
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "sticker_CristhmasTree_chest_Discount",	drop_weight = 0.05, }, 
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "sticker_SantaPirat_chest_Discount",	drop_weight = 0.05, }, 
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "sticker_Gifts_chest_Discount",		drop_weight = 0.05, }, 
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "sticker_CoockieMan_chest_Discount",	drop_weight = 0.05, }, 
		},		
		{  -- отсюда начинаются ауры для игрока
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "NewYear2017_credits", drop_weight = 0.05, }, -- кредиты
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "NewYear2017_experience", drop_weight = 0.05, },  -- опыт
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "NewYear2017_Damage", drop_weight = 0.05, }, -- дамаг
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "NewYear2017_Speed", drop_weight = 0.05, }, -- скорость
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "NewYear2017_ShieldResist", drop_weight = 0.05, }, -- щит резист
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "NewYear2017_HullResist", drop_weight = 0.05, }, -- корпус резист
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "NewYear2017_RepBoost15wide", drop_weight = 0.01, }, -- лояльность+опыт для всей команды
		},	
		{	--отсюда начинаются уникальные партсы для кораблей
			{ type = ai.BundleContent.DUMMY, drop_weight = 15,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_hull",		drop_weight = 6,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_cpu",		drop_weight = 5,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_activator",	drop_weight = 1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_hull",		drop_weight = 5,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_cpu",		drop_weight = 6,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_activator",	drop_weight = 1,	},
		},
		{
			{ type = ai.BundleContent.DUMMY, drop_weight = 4,	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_Weapon_KineticCDRbyCrit_T4_Mk1",				drop_weight = 1,	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_Module_CommandCritAura_T4_Mk1",					drop_weight = 2,	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_Module_UrgentCapacitorCharge_T4_Mk1",			drop_weight = 2,	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_Weapon_ElectricPotentialInductor_T4_Mk1",		drop_weight = 1,	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_Module_BarrelDistractionShot_T4_Mk1",			drop_weight = 2,	},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_ModulePassive_ExtendedBallisticsCPU_T4_Mk1",	drop_weight = 2,	},
		},
	},
}
]]

-- EventCredits chests
-- Bundle_NY2017_T1_Common - мутаген + композит
-- Bundle_NY2017_T1_Rare - матрица кабины + уникальная покраска
-- Bundle_NY2017_T1_Exchange - обмен золота на эвентовую валюту
-- #68574
-- AlienCompositeAlloy, Aliens_ship_part, 

Def.Bundle_NY2017_T1_Common = 
{
	inherit				= "BundleBase",
	eventPrice 			= 20,
	--premiumPrice		= 666,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2017_T1_Common_name",
	uiDesc				= "Bundle_NY2017_T1_Common_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_36",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "AlienCompositeAlloy", 			is_elite = true,},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "Aliens_ship_part",	 },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",	 },
		},
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T3",	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T4",	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T5",	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T3",		},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T4",		},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T5",		},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T3",				},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T4",				},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T5",				},
		},
	},
	
	random_contents = 
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "AlienCompositeAlloy",	 drop_weight = 3.0,	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "Aliens_ship_part",	 drop_weight = 20.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",	 drop_weight = 5.0,		},
		},
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T3",		drop_weight = 0.5,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T4",		drop_weight = 0.4,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T5",		drop_weight = 0.3,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T3",			drop_weight = 0.5,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T4",			drop_weight = 0.4,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T5",			drop_weight = 0.3,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T3",					drop_weight = 0.5,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T4",					drop_weight = 0.4,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T5",					drop_weight = 0.3,	},
		},
	},
}

Def.Bundle_NY2017_T1_Common3 = 
{
	inherit				= "BundleBase",
	eventPrice 			= 20,
	--premiumPrice		= 666,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2017_T1_Common_name",
	uiDesc				= "Bundle_NY2017_T1_Common3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_36",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,				amount = 1,		str_param = "FormPattern_Alien_Fighter", 	is_elite = true,},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "AlienCompositeAlloy", 			is_elite = true,},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "Aliens_ship_part",	 },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",	 },
		},
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T3",	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T4",	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T5",	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T3",		},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T4",		},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T5",		},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T3",				},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T4",				},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T5",				},
		},
	},
	
	random_contents = 
	{
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "AlienCompositeAlloy",	 drop_weight = 3.0,	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "FormPattern_Alien_Fighter",	 drop_weight = 3.0,	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "Aliens_ship_part",	 drop_weight = 20.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "Aliens_ship_part",	 drop_weight = 5.0,		},
		},
		{
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T3",		drop_weight = 0.5,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T4",		drop_weight = 0.4,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SmartRocketLauncher_NY_T5",		drop_weight = 0.3,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T3",			drop_weight = 0.5,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T4",			drop_weight = 0.4,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_SuppressingGun_NY_T5",			drop_weight = 0.3,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T3",					drop_weight = 0.5,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T4",					drop_weight = 0.4,	},
			{ type = ai.BundleContent.ITEM,	amount = 1,	str_param = "Weapon_Minigun_NY_T5",					drop_weight = 0.3,	},
		},
	},
}

Def.Bundle_NY2017_T1_Exchange =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 6000,
    premiumPriceTotal = 6000,
    cant_be_bought = true,
    cant_be_bought_on_event_credits_limit = true,

    multi_buy = "Bundle_NY2017_T1_Exchange_x5",

    uiName = "Bundle_NY2017_T1_Exchange_name",
    uiDesc = "Bundle_NY2017_T1_Exchange_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 40, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 40, drop_weight = 1, }, }, },
}

Def.Bundle_NY2017_T1_Exchange_x5 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 27000,
    premiumPriceTotal = 27000,

    cant_be_bought = true,
    cant_be_bought_on_event_credits_limit = true,
    hiddenInShop = true,

    uiName = "Bundle_NY2017_T1_Exchange_x5_name",
    uiDesc = "Bundle_NY2017_T1_Exchange_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 200, drop_weight = 1, }, }, },
}

Def.Bundle_March8_T1 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1900*1.2,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_March8_T1_name",
	uiDesc				= "Bundle_March8_T1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_8March_1_2017",
	premiumPriceTotal 	= 1900*1.2,
	default_icon		= "dlcIco",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "wom_01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "wom_02", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "wom_03", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "wom_04", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "WomansDay_2017", },
		},
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Valentine01", },
        },
	},
		
	fixed_contents = 
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "wom_01", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "wom_02", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "wom_03", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "wom_04", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "WomansDay_2017", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Valentine01", price_weight = 0.2, },
	},
}

--Chest on 1 april 2017--!!
--Chest for SALE
Def.Bundle_GiftsforSale_april_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1400,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GiftsforSale_1april_T5_chest_name",
	uiDesc				= "Bundle_GiftsforSale_1april_T5_chest_desc",
	cant_be_bought 		= true,
	hiddenInShop		= false,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_42_01_04_2017",
	default_icon		= "bandle_42_01_04_2017_large",

		ui_content = --иконки
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_01", is_elite = true,},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_02",	is_elite = true, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_03",	is_elite = true, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_04",	is_elite = true, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_05",	is_elite = true, },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_06",	is_elite = true, },
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",		},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",	}, 
		},		
	},
	
		fixed_contents = --фиксированный дроп
	{

			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_01",					price_weight = 0.16,	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_02",					price_weight = 0.16,	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_03",					price_weight = 0.16,	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_04",					price_weight = 0.16,	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_05",					price_weight = 0.16,	}, 
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_06",					price_weight = 0.16,	}, 
	
	},


		random_contents = --рандомный дроп
		
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Tungsten_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Explosion",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Iridium_plate",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Computing_chip",				drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Pure_silicon",					drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Processor_block",				drop_weight = 5.0,	}, 
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Screened_battery",				drop_weight = 5.0,	}, 
		},
	},
	
}

--Chests for Quest
Def.Bundle_GiftsforSale_1april_day1_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 9999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GiftsforSale_1april_T5_chest_name",
	uiDesc				= "Bundle_GiftsforSale_1april_T5_chest_desc",
	--cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_42_01_04_2017",
	default_icon		= "bandle_42_01_04_2017_large",

		ui_content = --иконки
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_01", is_elite = true,},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_02",	is_elite = true, },
		},		
	},

		fixed_contents =
	{

		
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_01",					price_weight = 0.5,	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_02",					price_weight = 0.5,	},
		
	},

}

Def.Bundle_GiftsforSale_1april_day2_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 9999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GiftsforSale_1april_T5_chest_name",
	uiDesc				= "Bundle_GiftsforSale_1april_T5_chest_desc",
	--cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_42_01_04_2017",
	default_icon		= "bandle_42_01_04_2017_large",

		ui_content = --иконки
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_03", is_elite = true,},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_04",	is_elite = true, },
 
		},		
	},

		fixed_contents =
	{

		
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_03",					price_weight = 0.5,	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_04",					price_weight = 0.5,	},
		
	},

}

Def.Bundle_GiftsforSale_1april_day3_T5_chest = 
{
	inherit				= "BundleBase",
	premiumPrice		= 9999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_GiftsforSale_1april_T5_chest_name",
	uiDesc				= "Bundle_GiftsforSale_1april_T5_chest_desc",
	--cant_be_bought 		= true,
	hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_42_01_04_2017",
	default_icon		= "bandle_42_01_04_2017_large",

		ui_content = --иконки
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_05", is_elite = true,},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_06",	is_elite = true, },

		},		
	},

		fixed_contents =
	{

		
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_05",					price_weight = 0.5,	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "fools_day_06",					price_weight = 0.5,	},
		
	},

}

-- #0091066: Сделать бандл с наклейками и скинами на 12 апреля
Def.Bundle_April_12_2018 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 2400,
    premiumPriceTotal   = 2400,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April_12_2018_name",
    uiDesc              = "Bundle_April_12_2018_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "R1_ENGINEER_12APRIL", },
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "R3_GUARD_12APRIL", },
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_01", },
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_02", },
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_03", },
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_04", },
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_05", },
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_06", },
        },
    },

    fixed_contents = 
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "R1_ENGINEER_12APRIL", price_weight = 0.1 },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "R3_GUARD_12APRIL", price_weight = 0.1 },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_01", price_weight = 0.1 },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_02", price_weight = 0.1 },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_03", price_weight = 0.1 },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_04", price_weight = 0.1 },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_05", price_weight = 0.1 },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "c02_cosmos_06", price_weight = 0.3 },
    },
}

-- SC-113324 12 апреля. Праздничные наклейки
Def.Bundle_April_12_2019 =
{
    inherit             = "BundleBase",
    premiumPrice        = 2400,
    premiumPriceTotal   = 2400,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April_12_2019_name",
    uiDesc              = "Bundle_April_12_2019_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_05", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_6", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "c02_cosmos_04", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_9", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "c02_cosmos_06", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_ScaleFish01", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_5", price_weight = 0.13 },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_05", price_weight = 0.13 },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_6", price_weight = 0.13 },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "c02_cosmos_04", price_weight = 0.13 },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_9", price_weight = 0.13 },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "c02_cosmos_06", price_weight = 0.13 },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_ScaleFish01", price_weight = 0.22, },
    },
}

--
Def.Bundle_Xeno_April12 = 
{
    inherit         = "BundleBase",
    storeItemId     = Bundles_GetNextStoreItemId(), 
    eventPrice      = 1000,
    uiName          = "Bundle_Xeno_April12_name",
    uiDesc          = "Bundle_Xeno_April12_desc", 
    cant_be_bought  = true,
    uiPromo         = "bandle_41",
    default_icon    = "bandle_41",
	
    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Satellite", is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Satellite", price_weight = 1, },
    },
}

-- #0090516 Подготовить бандл на 1 апреля с наклейками
Def.Bundle_April1_2018 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 1900,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_April1_2018_name",
	uiDesc				= "Bundle_April1_2018_desc",
	cant_be_bought 		= true,
	premiumPriceTotal 	= 1900,
	uiPromo 			= "bandle_41",
	default_icon		= "bandle_41",

	ui_content =
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "baby", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "hate_aliens", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "smile", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "today", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "victory", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "zzz", },
		},
	},

	fixed_contents = 
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "baby", price_weight = 0.17, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "hate_aliens", price_weight = 0.17, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "smile", price_weight = 0.17, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "today", price_weight = 0.17, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "victory", price_weight = 0.17, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "zzz", price_weight = 0.15, },
	},
}

-- #0108737: наклееки к 1 апреля
Def.Bundle_April1_2019 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 2900,
    premiumPriceTotal   = 2900,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April1_2019_name",
    uiDesc              = "Bundle_April1_2019_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_6", },
        },
    },

    fixed_contents = 
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_1", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_2", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_3", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_4", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_5", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_6", price_weight = 0.25, },
    },
}

-- SC-113213 1 апреля. Набор с краской и наклейками
Def.Bundle_April1_2020 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 1900*1.2,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April1_2020_name",
    uiDesc              = "Bundle_April1_2020_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2020_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2020_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2020_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "fools_day_03", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_4", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Armor02", },
        },
    },

    fixed_contents = 
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2020_1", price_weight = 0.13, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2020_2", price_weight = 0.13, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2020_3", price_weight = 0.13, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "fools_day_03", price_weight = 0.13, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_3", price_weight = 0.13, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2019_4", price_weight = 0.13, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Armor02", price_weight = 0.22, },
    },
}

--[[ Birhtday 2018 Bundle
Def.Bundle_Birhtday2018_T1 = 
{
	inherit				= "BundleBase",
	eventPrice			= 100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Birhtday2018_T1_name",
	uiDesc				= "Bundle_Birhtday2018_T1_desc",
	cant_be_bought 		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_40",

	ui_content = 
	{
		{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "SClogo",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_01",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_02",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_03",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_04",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_05",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_06",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_07",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_08",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_09",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_10",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_11",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_12",	},
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_13",	},
		},
	},	
		
	fixed_contents = 
	{
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "SClogo",	price_weight = 0.08, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_01",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_02",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_03",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_04",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_05",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_06",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_07",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_08",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_09",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_10",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_11",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_12",	price_weight = 0.07, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "birthday_2018_13",	price_weight = 0.07, },
	},
}]]

Def.Bundle_NY2017_T1_Exchange_sale = 
{
	inherit				= "BundleBase",
	premiumPrice		= 200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2017_T1_Exchange_name",
	uiDesc				= "Bundle_NY2017_T1_Exchange_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_35",
	default_icon		= "dlcIco",
	premiumPriceTotal 	= 200,
	required_account_aura	= "Event_credits_discount_50",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.EVENT_CREDITS,	amount = 5, },
		},
	},
	
	random_contents =
	{
		{
			{ type = ai.BundleContent.EVENT_CREDITS,	amount = 5,		drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Event_credits_discount_50_2",	drop_weight = 1, }
		},
	},

}

Def.Bundle_NY2017_T1_Exchange_sale_2 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2017_T1_Exchange_name",
	uiDesc				= "Bundle_NY2017_T1_Exchange_desc",
	cant_be_bought 		= false,
	uiPromo 			= "bandle_35",
	default_icon		= "dlcIco",
	premiumPriceTotal 	= 200,
	required_account_aura	= "Event_credits_discount_50_2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.EVENT_CREDITS,	amount = 5, },
		},
	},
	
	random_contents =
	{
		{
			{ type = ai.BundleContent.EVENT_CREDITS,	amount = 5,		drop_weight = 1, },
		},
		{
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Event_credits_discount_50",	drop_weight = 1, }
		},
	},
	
}

-- NY 2018
Def.Bundle_NY2018_Pizza_T1_Chest1 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest1_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest1_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienCorpse",	},
		},		
	},
	
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienCorpse",	drop_weight = 1.0,	},	},	
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest2 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest2_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest2_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "NewYear14_Stars",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
		},		
	},
	
	fixed_contents = 	{	{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "NewYear14_Stars",	price_weight = 0.05, }, },
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest3 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest3_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest3_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
			{ type = ai.BundleContent.EVENT_CREDITS,	amount = 30, },
		},		
	},
	
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
			{	{ type = ai.BundleContent.EVENT_CREDITS,	amount = 30,	drop_weight = 1, }, 	},
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest4 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest4_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest4_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_03",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
		},		
	},
	
	fixed_contents = 	{	{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_03",	price_weight = 0.05, }, },
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest5 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest5_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest5_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_11",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
		},		
	},
	
	fixed_contents = 	{	{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_11",	price_weight = 0.05, }, },
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest6 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest6_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest6_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
			{ type = ai.BundleContent.EVENT_CREDITS,	amount = 30, },
		},		
	},
	
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
			{	{ type = ai.BundleContent.EVENT_CREDITS,	amount = 30,	drop_weight = 1, }, 	},
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest7 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest7_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest7_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_12",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
		},		
	},
	
	fixed_contents = 	{	{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_12",	price_weight = 0.05, }, },
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest8 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest8_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest8_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
			{ type = ai.BundleContent.EVENT_CREDITS,	amount = 30, },
		},		
	},
	
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
			{	{ type = ai.BundleContent.EVENT_CREDITS,	amount = 30,	drop_weight = 1, }, 	},
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest9 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest9_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest9_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_13",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
		},		
	},
	
	fixed_contents = 	{	{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_13",	price_weight = 0.05, }, },
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest10 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest10_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest10_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Gzhel",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
			{ type = ai.BundleContent.EVENT_CREDITS,	amount = 40, },
		},		
	},
	
	fixed_contents = 	{	{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Gzhel",	price_weight = 0.05, }, },
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
			{	{ type = ai.BundleContent.EVENT_CREDITS,	amount = 40,	drop_weight = 1, }, 	},
		},
}

--
Def.Bundle_NY2018_Pizza_T1_Chest11 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Pizza_T1_Chest11_name",
	uiDesc				= "Bundle_NY2018_Pizza_T1_Chest1_desc",
	cant_be_bought 		= false,
	--hiddenInShop		= true,
	default_icon		= "dlcIco",
	uiPromo 			= "bandle_41",
	required_account_aura	= "Bundle_NY2018_Pizza_T1_Chest11_Discount",

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_19",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	},
			{ type = ai.BundleContent.EVENT_CREDITS,	amount = 50, },
		},		
	},
	
	fixed_contents = 	{	{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ny_2018_19",	price_weight = 0.05, }, },
	random_contents = 	
		{	
			{	{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "AlienPizzaSlice",	drop_weight = 1.0,	},	},	
			{	{ type = ai.BundleContent.EVENT_CREDITS,	amount = 50,	drop_weight = 1, }, 	},
		},
}

-- NY 2018 Event

Def.Bundle_NY2018_T1_1 = 
{
	inherit				= "BundleBase",
	eventPrice 			= 200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_T1_1_name",
	uiDesc				= "Bundle_NY2018_T1_1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_64",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_hull", is_elite = true,},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_hull", 	is_elite = true,},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_hull",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_hull",	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "ship_part_Ship_Race3_L_T3_PremUniq",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race3_L_T3_PremUniq",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "ship_part_Ship_Race3_L_T3_PremUniq",	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "ship_part_Ship_Race3_S_T4_PremUniq",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race3_S_T4_PremUniq",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "ship_part_Ship_Race3_S_T4_PremUniq",	},
		},
	},
	
	random_contents = 
	{
		{	
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_hull",	 drop_weight = 3.0,	}, -- new BP here
		},
		{	
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_hull",	 drop_weight = 3.0,	}, -- new BP here
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race2_m_t4_pu_hull",		drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race1_l_t4_pu_hull",		drop_weight = 1.0,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race1_l_t4_spiral_hull",	drop_weight = 1.0,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race3_l_t4_shuttle_hull",	drop_weight = 1.0,	},	
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "ship_part_Ship_Race3_L_T3_PremUniq",		drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race3_L_T3_PremUniq",	drop_weight = 5.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "ship_part_Ship_Race3_L_T3_PremUniq",	drop_weight = 2.0,	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,	str_param = "ship_part_Ship_Race3_S_T4_PremUniq",		drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race3_S_T4_PremUniq",	drop_weight = 5.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "ship_part_Ship_Race3_S_T4_PremUniq",	drop_weight = 2.0,	},
		},
	},
}

Def.Bundle_NY2018_T1_2 = 
{
	inherit				= "BundleBase",
	eventPrice 			= 200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_T1_2_name",
	uiDesc				= "Bundle_NY2018_T1_2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_63",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_cpu", is_elite = true,},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_cpu", 	is_elite = true,},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_cpu",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_cpu",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_cpu",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_cpu",	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "ship_part_Ship_Race3_S_T1_Premium",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race3_S_T1_Premium",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "ship_part_Ship_Race3_S_T1_Premium",	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "ship_part_Ship_Race3_M_T4_PremUniq",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race3_M_T4_PremUniq",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "ship_part_Ship_Race3_M_T4_PremUniq",	},
		},
	},
	
	random_contents = 
	{
		{	
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_cpu",	 drop_weight = 3.0,	}, -- new BP here
		},
		{	
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_cpu",	 drop_weight = 3.0,	}, -- new BP here
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race2_m_t4_pu_cpu",		drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race1_l_t4_pu_cpu",		drop_weight = 1.0,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race1_l_t4_spiral_cpu",	drop_weight = 1.0,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race3_l_t4_shuttle_cpu",	drop_weight = 1.0,	},	
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "ship_part_Ship_Race3_S_T1_Premium",		drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race3_S_T1_Premium",	drop_weight = 5.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "ship_part_Ship_Race3_S_T1_Premium",	drop_weight = 2.0,	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 5,		str_param = "ship_part_Ship_Race3_M_T4_PremUniq",		drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race3_M_T4_PremUniq",	drop_weight = 5.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20,	str_param = "ship_part_Ship_Race3_M_T4_PremUniq",	drop_weight = 2.0,	},
		},
	},
}

Def.Bundle_NY2018_T1_3 = 
{
	inherit				= "BundleBase",
	eventPrice 			= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_T1_3_name",
	uiDesc				= "Bundle_NY2018_T1_3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_62",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_activator", is_elite = true,},
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_activator", 	is_elite = true,},
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race2_m_t4_pu_activator",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_pu_activator",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race1_l_t4_spiral_activator",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "race3_l_t4_shuttle_activator",	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race1_L_T5_PremUniq",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 25,	str_param = "ship_part_Ship_Race1_L_T5_PremUniq",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50,	str_param = "ship_part_Ship_Race1_L_T5_PremUniq",	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race2_S_T5_Premium",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 25,	str_param = "ship_part_Ship_Race2_S_T5_Premium",	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50,	str_param = "ship_part_Ship_Race2_S_T5_Premium",	},
		},
	},
	
	random_contents = 
	{
		{	
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race3_m_t5_wolfhound_activator",	 drop_weight = 3.0,	}, -- new BP here
		},
		{	
			{ type = ai.BundleContent.BLUEPRINT,	amount = 1,	str_param = "BP_race1_m_t5_granite_activator",	 drop_weight = 3.0,	}, -- new BP here
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race2_m_t4_pu_activator",		drop_weight = 1.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race1_l_t4_pu_activator",		drop_weight = 1.0,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race1_l_t4_spiral_activator",	drop_weight = 1.0,	},	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,		str_param = "race3_l_t4_shuttle_activator",	drop_weight = 1.0,	},	
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race1_L_T5_PremUniq",		drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 25,	str_param = "ship_part_Ship_Race1_L_T5_PremUniq",	drop_weight = 5.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50,	str_param = "ship_part_Ship_Race1_L_T5_PremUniq",	drop_weight = 2.0,	},
		},
		{	
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 10,	str_param = "ship_part_Ship_Race2_S_T5_Premium",		drop_weight = 3.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 25,	str_param = "ship_part_Ship_Race2_S_T5_Premium",	drop_weight = 5.0,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50,	str_param = "ship_part_Ship_Race2_S_T5_Premium",	drop_weight = 2.0,	},
		},
	},
}

Def.Bundle_NY2018_Test_Command = 
{
	inherit				= "BundleBase",
	price 				= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Test_name",
	uiDesc				= "Bundle_NY2018_Test_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",

	ui_content = 
	{
		{	
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MacheteFury_T2_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FastShootAxe_T1_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FastShootAxe_T4_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PrometheusFire_T3_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PrometheusFire_T5_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaEnergy_T3_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaEnergy_T5_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RangeMasterPlus_T2_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RangeMasterPlus_T4_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BushidoCall_T3_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_AxeShot_T1_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_AxeShot_T4_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldThermoGuard_T2_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldThermoGuard_T5_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SupportReinforce_T3_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FireStealingPot_T3_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaSPush_T3_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MacheteCuttingEdge_T2_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MacheteCuttingEdge_T5_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PrometheusPot_T3_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PrometheusPot_T5_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyOptimus_T2_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyOptimus_T4_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MacheteBox_T2_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MacheteBox_T5_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_PrometeusCunning_T3_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_PrometeusCunning_T5_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HerculesGust_T2_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HerculesGust_T4_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaRiposte_T3_Mk1", }, 
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaRiposte_T5_Mk1", }, 
		},
	},
	
	random_contents = 
	{
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MacheteFury_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FastShootAxe_T1_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FastShootAxe_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PrometheusFire_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PrometheusFire_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaEnergy_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaEnergy_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RangeMasterPlus_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RangeMasterPlus_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BushidoCall_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_AxeShot_T1_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_AxeShot_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldThermoGuard_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldThermoGuard_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SupportReinforce_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FireStealingPot_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaSPush_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MacheteCuttingEdge_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MacheteCuttingEdge_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PrometheusPot_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PrometheusPot_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyOptimus_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyOptimus_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MacheteBox_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MacheteBox_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_PrometeusCunning_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_PrometeusCunning_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HerculesGust_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HerculesGust_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaRiposte_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaRiposte_T5_Mk1", drop_weight = 1.0, }, },
	},
}

Def.Bundle_NY2018_Test_ECM = 
{
	inherit				= "BundleBase",
	price 				= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Test_name",
	uiDesc				= "Bundle_NY2018_Test_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",

	ui_content = 
	{
		{	
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SaveBack_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailActiveSuppressor_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailActiveSuppressor_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_EnergyBlaster_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_EnergyBlaster_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Blind_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DisableWeapon_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_BlastWeaponDestructor_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnlargeActiveCooldown_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnlargeActiveCooldown_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HackRocket_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EnemyActiveSuppression_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EnemyActiveSuppression_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DisableWeaponFireRate_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShellRestoration_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShellRestoration_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ReflectorResonance_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ReflectorResonance_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HackEntity_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HackWeapon_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HackWeapon_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BeaconActiveSilence_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WeaponSuppression_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WeaponSuppression_T4_Mk1", }, 
		},
	},
	
	random_contents = 
	{
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SaveBack_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailActiveSuppressor_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailActiveSuppressor_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_EnergyBlaster_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_EnergyBlaster_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Blind_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DisableWeapon_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_BlastWeaponDestructor_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnlargeActiveCooldown_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnlargeActiveCooldown_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HackRocket_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EnemyActiveSuppression_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EnemyActiveSuppression_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DisableWeaponFireRate_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShellRestoration_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShellRestoration_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ReflectorResonance_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ReflectorResonance_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HackEntity_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HackWeapon_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HackWeapon_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BeaconActiveSilence_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WeaponSuppression_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WeaponSuppression_T4_Mk1", drop_weight = 1.0, }, },
	},
}

Def.Bundle_NY2018_Test_Scout = 
{
	inherit				= "BundleBase",
	price 				= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Test_name",
	uiDesc				= "Bundle_NY2018_Test_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",

	ui_content = 
	{
		{	
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CorrosiveGunScout_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ExhaustZone_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ExhaustZone_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyBeaconAnalyse_T1_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyBeaconAnalyse_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EnemyInfoCheck_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_WeaknessScoutPlasma_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_WeaknessScoutPlasma_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FakeShipsUpgraded_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LaserVUX_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LaserVUX_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_TeamGuide_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DodgeDrive_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyDroneShieldThief_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyDroneShieldThief_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BlackBomb_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_RocketFit_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_RocketFit_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HealBanHaze_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HealEnergyBanHaze_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ScoutChameleonCommon_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FuelEmissionsScout_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ScoutReturn_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ScoutReturn_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CritChecker_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CritChecker_T4_Mk1", }, 
		},
	},
	
	random_contents = 
	{
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CorrosiveGunScout_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ExhaustZone_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ExhaustZone_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyBeaconAnalyse_T1_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyBeaconAnalyse_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_EnemyInfoCheck_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_WeaknessScoutPlasma_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_WeaknessScoutPlasma_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FakeShipsUpgraded_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LaserVUX_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LaserVUX_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_TeamGuide_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DodgeDrive_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyDroneShieldThief_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpyDroneShieldThief_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BlackBomb_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_RocketFit_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_RocketFit_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HealBanHaze_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HealEnergyBanHaze_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ScoutChameleonCommon_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FuelEmissionsScout_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ScoutReturn_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ScoutReturn_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CritChecker_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CritChecker_T4_Mk1", drop_weight = 1.0, }, },
	},
}

Def.Bundle_NY2018_Test_Recon = 
{
	inherit				= "BundleBase",
	price 				= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Test_name",
	uiDesc				= "Bundle_NY2018_Test_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",

	ui_content = 
	{
		{	
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_NewShield_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_NewShield_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ReactorSpark_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ReactorSpark_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuddenFire_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuddenFire_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RadiationWeapon_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SaveJump_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_IndestructibleShield_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HardRadiation_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HardRadiation_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontReaperGun_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontReaperGun_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PlasmaTorpedoGenerator_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PlasmaTorpedoGenerator_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_HardCrit_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_HardCrit_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ChaosSpawner_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Backstab_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Backstab_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RadiationCloud_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RadiationCloud_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyDiversion_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyDiversion_T5_Mk1", }, 
		},
	},
	
	random_contents = 
	{
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_NewShield_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_NewShield_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ReactorSpark_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ReactorSpark_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuddenFire_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuddenFire_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RadiationWeapon_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SaveJump_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_IndestructibleShield_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HardRadiation_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HardRadiation_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontReaperGun_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontReaperGun_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PlasmaTorpedoGenerator_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PlasmaTorpedoGenerator_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_HardCrit_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_HardCrit_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ChaosSpawner_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Backstab_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Backstab_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RadiationCloud_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RadiationCloud_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyDiversion_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyDiversion_T5_Mk1", drop_weight = 1.0, }, },
	},
}

Def.Bundle_NY2018_Test_Attack = 
{
	inherit				= "BundleBase",
	price 				= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Test_name",
	uiDesc				= "Bundle_NY2018_Test_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",

	ui_content = 
	{
		{	
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AchillesPylum_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AchillesPylum_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BattleShield_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BattleShield_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Lynx2Shield_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Lynx2Shield_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HerculesOrb_T1_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HerculesOrb_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_StunningSpurt_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WolfPack_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WolfPack_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_DeimosRageOnEnemy_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_DeimosRageOnEnemy_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosFace_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CritPlasmaWolfM_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaserLight_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaserLight_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosEmitter_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosEmitter_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CripplingClaws_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CripplingClaws_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LengtheningBeam_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosWarp_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosWarp_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WolfRun_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Decay_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Decay_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PhobosHullRestore_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PhobosHullRestore_T4_Mk1", }, 
		},
	},
	
	random_contents = 
	{
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AchillesPylum_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AchillesPylum_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BattleShield_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BattleShield_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Lynx2Shield_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Lynx2Shield_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HerculesOrb_T1_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HerculesOrb_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_StunningSpurt_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WolfPack_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WolfPack_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_DeimosRageOnEnemy_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_DeimosRageOnEnemy_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosFace_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CritPlasmaWolfM_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaserLight_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaserLight_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosEmitter_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosEmitter_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CripplingClaws_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CripplingClaws_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LengtheningBeam_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosWarp_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DeimosWarp_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WolfRun_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Decay_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Decay_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PhobosHullRestore_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PhobosHullRestore_T4_Mk1", drop_weight = 1.0, }, },
	},
}

Def.Bundle_NY2018_Test_Tackler = 
{
	inherit				= "BundleBase",
	price 				= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Test_name",
	uiDesc				= "Bundle_NY2018_Test_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",

	ui_content = 
	{
		{
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HunterZone_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MacheteSmartRL2_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MacheteSmartRL2_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_TarZone_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_TarZone_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_GuidedDronFoxSlow_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_GuidedDronFoxSlow_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaHunterGun_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaHunterGun_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyBurner_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyBurner_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ActiveHunting_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ActiveHunting_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRenew_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRenew_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FoxMShot_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FoxMShot_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HorrorHowl_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HorrorHowl_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaserFoxM_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaserFoxM_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CatConcentration_T1_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CatConcentration_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_KatanaPrepare_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_KatanaPrepare_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FoxEscapeFromBattle_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FoxEscapeFromBattle_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaMineLayer_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaMineLayer_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_LanceWeakness_T4_Mk1", }, 
		},
	},
	
	random_contents = 
	{
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HunterZone_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MacheteSmartRL2_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MacheteSmartRL2_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_TarZone_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_TarZone_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_GuidedDronFoxSlow_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_GuidedDronFoxSlow_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaHunterGun_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaHunterGun_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyBurner_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyBurner_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ActiveHunting_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ActiveHunting_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRenew_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRenew_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FoxMShot_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FoxMShot_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HorrorHowl_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HorrorHowl_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaserFoxM_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaserFoxM_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CatConcentration_T1_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CatConcentration_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_KatanaPrepare_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_KatanaPrepare_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FoxEscapeFromBattle_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FoxEscapeFromBattle_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaMineLayer_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_KatanaMineLayer_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_LanceWeakness_T4_Mk1", drop_weight = 1.0, }, },
	},
}

Def.Bundle_NY2018_Test_Sniper = 
{
	inherit				= "BundleBase",
	price 				= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Test_name",
	uiDesc				= "Bundle_NY2018_Test_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",

	ui_content = 
	{
		{	
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SniperDamageZone_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SniperDamageZone_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EngineAmplifier_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EngineAmplifier_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_UpgradedSpecial_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SmallReverseThruster_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SmallReverseThruster_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WeaponAmplifier_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ZoneCleaner_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ZoneCleaner_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_JerichoTrumpets_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_JerichoTrumpets_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HugeHullDevastator_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FocusedRay_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_TacticalCalculation_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_TacticalCalculation_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ChainLaser_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SniperDefender_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SniperDefender_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FocusedDefence_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FocusedDefence_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WeaknessSense_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WeaknessSense_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_LastHope_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_LastHope_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SuperChamelion_T4_Mk1", }, 
		},
	},
	
	random_contents = 
	{
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SniperDamageZone_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SniperDamageZone_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EngineAmplifier_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EngineAmplifier_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_UpgradedSpecial_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SmallReverseThruster_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SmallReverseThruster_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_WeaponAmplifier_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ZoneCleaner_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ZoneCleaner_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_JerichoTrumpets_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_JerichoTrumpets_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_HugeHullDevastator_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FocusedRay_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_TacticalCalculation_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_TacticalCalculation_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ChainLaser_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SniperDefender_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SniperDefender_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FocusedDefence_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_FocusedDefence_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WeaknessSense_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_WeaknessSense_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_LastHope_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_LastHope_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SuperChamelion_T4_Mk1", drop_weight = 1.0, }, },
	},
}

Def.Bundle_NY2018_Test_Guard = 
{
	inherit				= "BundleBase",
	price 				= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Test_name",
	uiDesc				= "Bundle_NY2018_Test_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",

	ui_content = 
	{
		{	
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SafeSpecial_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SafeSpecial_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnhanceWeapon_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldAdaptation_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldAdaptation_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpaceSqueezer_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpaceSqueezer_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdaptiveDefense_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaGuard_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaGuard_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdditionalShield_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RebalancedDefense_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RebalancedDefense_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SafeAcceleration_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SafeAcceleration_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MirvRocket_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MirvRocket_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RamCharge_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRecycler_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Hook_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Hook_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Immortality_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RocketRing_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RocketRing_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MissileReflector_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MissileReflector_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BinaryHardener_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BinaryHardener_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_AdaptiveFire_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_AdaptiveFire_T5_Mk1", }, 
		},
	},
	
	random_contents = 
	{
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SafeSpecial_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SafeSpecial_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnhanceWeapon_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldAdaptation_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldAdaptation_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpaceSqueezer_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpaceSqueezer_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdaptiveDefense_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaGuard_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaGuard_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_AdditionalShield_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RebalancedDefense_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RebalancedDefense_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SafeAcceleration_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SafeAcceleration_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MirvRocket_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_MirvRocket_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RamCharge_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ShieldRecycler_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Hook_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Hook_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Immortality_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RocketRing_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RocketRing_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MissileReflector_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MissileReflector_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BinaryHardener_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BinaryHardener_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_AdaptiveFire_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_AdaptiveFire_T5_Mk1", drop_weight = 1.0, }, },
	},
}

Def.Bundle_NY2018_Test_Engineer = 
{
	inherit				= "BundleBase",
	price 				= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_NY2018_Test_name",
	uiDesc				= "Bundle_NY2018_Test_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",

	ui_content = 
	{
		{	
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BindingShield_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BindingShield_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PrimaryNanoRobots_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MultiPurposeAdaptor_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PreparationAdaptation_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CalibrationGrenade_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CalibrationGrenade_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_NanobotsCritAdaptive_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CoupleSupport_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpeedInsteadShield_T1_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpeedInsteadShield_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DivineSave_T3_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DivineSave_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LaserHealNormal_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LaserHealNormal_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyFlowBalancer_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyFlowBalancer_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MatterFlow_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MatterFlow_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Jump2Dude_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Primary2HullRestore_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Primary2HullRestore_T5_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ParticleExplosion_T2_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DivineStorm_T1_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DivineStorm_T4_Mk1", }, 
        { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_DronDamageMod_T3_Mk1", }, 
        },
    },

    random_contents =
    {
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BindingShield_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_BindingShield_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PrimaryNanoRobots_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MultiPurposeAdaptor_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_PreparationAdaptation_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CalibrationGrenade_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CalibrationGrenade_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_NanobotsCritAdaptive_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_CoupleSupport_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpeedInsteadShield_T1_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_SpeedInsteadShield_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DivineSave_T3_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DivineSave_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LaserHealNormal_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_LaserHealNormal_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyFlowBalancer_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_EnergyFlowBalancer_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MatterFlow_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_MatterFlow_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Jump2Dude_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Primary2HullRestore_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Primary2HullRestore_T5_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_ParticleExplosion_T2_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DivineStorm_T1_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_DivineStorm_T4_Mk1", drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "ModulePassive_DronDamageMod_T3_Mk1", drop_weight = 1.0, }, },
    },
}

Def.Bundle_GoldDragon =
{
    inherit        = "BundleBase",
    premiumPrice   = 55000,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_GoldDragon_name",
    uiDesc         = "Bundle_GoldDragon_desc",
    cant_be_bought = true,
    uiPromo        = "bandle_38",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Golden", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Precursor", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Gzhel", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BaseCamouflage_Sand01", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BaseCamouflage_Summer01", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BaseCamouflage_CraftCamouflage", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Liquid", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SteamWinterSale_Snow02", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SteamWinterSale_Snow_c", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SteamWinterSale_IceCrystal", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Ice_1", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Golden",                         price_weight = 0.90, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Precursor",                      price_weight = 0.01, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Gzhel",                          price_weight = 0.01, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BaseCamouflage_Sand01",          price_weight = 0.01, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BaseCamouflage_Summer01",        price_weight = 0.01, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BaseCamouflage_CraftCamouflage", price_weight = 0.01, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Liquid",                         price_weight = 0.01, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SteamWinterSale_Snow02",         price_weight = 0.01, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SteamWinterSale_Snow_c",         price_weight = 0.01, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SteamWinterSale_IceCrystal",     price_weight = 0.01, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Ice_1",                          price_weight = 0.01, },
    },
}

Def.Bundle_CyberSantaDart =
{
    inherit        = "BundleBase",
    premiumPrice   = 6000,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_CyberSantaDart_name",
    uiDesc         = "Bundle_CyberSantaDart_desc",
    cant_be_bought = true,
    uiPromo        = "bandle_NY_1_2017",
    default_icon   = "bundle_NY_2017_ico_small",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race2_m_t4_pu_hull",      drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race2_m_t4_pu_cpu",       drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race2_m_t4_pu_activator", drop_weight = 1.0, },
        },
        {
            { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "NewYear2017_credits", },
            { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "NewYear2017_experience", },
            { type = ai.BundleContent.TITLE,          amount = 1, int_param = PlayerTitleId.SANTA_HELPER, },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "santapirat", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "santasled", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cristhmastree", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "gifts", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "coockieman", },
        },
    },

    random_contents =
    {
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race2_m_t4_pu_hull",      drop_weight = 1.0, }, },
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race2_m_t4_pu_cpu",       drop_weight = 1.0, }, },
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race2_m_t4_pu_activator", drop_weight = 1.0, }, },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "NewYear2017_credits",      price_weight = 0.04, },
        { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "NewYear2017_experience",   price_weight = 0.04, },
        { type = ai.BundleContent.TITLE,          amount = 1, int_param = PlayerTitleId.SANTA_HELPER, price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "santapirat",               price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "santasled",                price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cristhmastree",            price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "gifts",                    price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "coockieman",               price_weight = 0.04, },
    },
}

Def.Bundle_CyberSantaGargoyle =
{
    inherit        = "BundleBase",
    premiumPrice   = 6000,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_CyberSantaGargoyle_name",
    uiDesc         = "Bundle_CyberSantaGargoyle_desc",
    cant_be_bought = true,
    uiPromo        = "bandle_NY_1_2017",
    default_icon   = "bundle_NY_2017_ico_small",

    ui_content =
    {
        {
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_pu_hull",      drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_pu_cpu",       drop_weight = 1.0, },
            { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_pu_activator", drop_weight = 1.0, },
        },
        {
            { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "NewYear2017_credits", },
            { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "NewYear2017_experience", },
            { type = ai.BundleContent.TITLE,          amount = 1, int_param = PlayerTitleId.SANTA_HELPER, },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "santapirat", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "santasled", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cristhmastree", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "gifts", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "coockieman", },
        },
    },

    random_contents =
    {
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_pu_hull",      drop_weight = 1.0, }, },
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_pu_cpu",       drop_weight = 1.0, }, },
        { { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "race1_l_t4_pu_activator", drop_weight = 1.0, }, },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "NewYear2017_credits",      price_weight = 0.04, },
        { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "NewYear2017_experience",   price_weight = 0.04, },
        { type = ai.BundleContent.TITLE,          amount = 1, int_param = PlayerTitleId.SANTA_HELPER, price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "santapirat",               price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "santasled",                price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cristhmastree",            price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "gifts",                    price_weight = 0.04, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "coockieman",               price_weight = 0.04, },
    },
}

Def.Bundle_Stickers_NY2018_1 =
{
    inherit        = "BundleBase",
    premiumPrice   = 1900,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_Stickers_NY2018_1_name",
    uiDesc         = "Bundle_Stickers_NY2018_1_desc",
    cant_be_bought = true,
    uiPromo        = "bandle_NY_1_2017",
    default_icon   = "bundle_NY_2017_ico_small",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_astrosvin", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_horkadon", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_jetsvin", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_santa_51", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_santa_hryakus", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_astrosvin", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_horkadon", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_jetsvin", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_santa_51", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "new_year_is_near_santa_hryakus", price_weight = 0.20, },
    },
}

Def.Bundle_Stickers_NY2018_2 =
{
    inherit        = "BundleBase",
    premiumPrice   = 1900,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_Stickers_NY2018_2_name",
    uiDesc         = "Bundle_Stickers_NY2018_2_desc",
    cant_be_bought = true,
    uiPromo        = "bandle_NY_1_2017",
    default_icon   = "bundle_NY_2017_ico_small",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_deer_on_vacation", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_in_new_year", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_santa_sirius", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_sock_for_gifts", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_star_in_porthole", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_deer_on_vacation", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_in_new_year", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_santa_sirius", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_sock_for_gifts", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "christmas_star_in_porthole", price_weight = 0.20, },
    },
}

Def.Bundle_Stickers_NY2018_3 =
{
    inherit        = "BundleBase",
    premiumPrice   = 1900,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_Stickers_NY2018_3_name",
    uiDesc         = "Bundle_Stickers_NY2018_3_desc",
    cant_be_bought = true,
    uiPromo        = "bandle_NY_1_2017",
    default_icon   = "bundle_NY_2017_ico_small",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_astrudolf", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_gingerbread_space", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_present_from_frost", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_right_hook", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_snowman-8", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_astrudolf", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_gingerbread_space", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_present_from_frost", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_right_hook", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ready_holiday_snowman-8", price_weight = 0.20, },
    },
}

Def.Bundle_Stickers_Game_7_Years =
{
    inherit        = "BundleBase",
    premiumPrice   = 2400,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_Stickers_Game_7_Years_name",
    uiDesc         = "Bundle_Stickers_Game_7_Years_desc",
    cant_be_bought = true,
    uiPromo        = "bundle_may9",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_18", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_8", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_21", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SClogo", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_18", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_4", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_5", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_8", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_21", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SClogo", price_weight = 0.20, },
    },
}

Def.Bundle_Stickers_Targem_17_Years =
{
    inherit        = "BundleBase",
    premiumPrice   = 1900,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_Stickers_Targem_17_Years_name",
    uiDesc         = "Bundle_Stickers_Targem_17_Years_desc",
    cant_be_bought = true,
    uiPromo        = "Bundle_ShipActivateQuest1_T5",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_20", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_19", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_11", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_7", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_20", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_19", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_1", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_11", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_7", price_weight = 0.20, },
    },
}

Def.Bundle_Stickers_February_14 =
{
    inherit        = "BundleBase",
    premiumPrice   = 1900*1.2,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_Stickers_February_14_name",
    uiDesc         = "Bundle_Stickers_February_14_desc",
    cant_be_bought = true,
    uiPromo        = "Bundle_ShipActivateQuest1_T5",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_17", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_16", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_10", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_12", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Feb14_01", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_17", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_16", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_2", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_10", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_12", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Feb14_01", price_weight = 0.20, },
    },
}

Def.Bundle_Stickers_February_23 =
{
    inherit        = "BundleBase",
    premiumPrice   = 1900*1.2,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_Stickers_February_23_name",
    uiDesc         = "Bundle_Stickers_February_23_desc",
    cant_be_bought = true,
    uiPromo        = "bundle_may9",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_15", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_14", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_13", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_9", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_DangerStripes01", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_15", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_14", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_13", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_3", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2019_9", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_DangerStripes01", price_weight = 0.20, },
    },
}

Def.Bundle_Guard_Feb23_T3 =
{
    inherit             = "BundleBase",
    premiumPrice        = 5000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_Guard_Feb23_T3_name",
    uiDesc              = "Bundle_Guard_Feb23_T3_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_23_feb_5_7",
    premiumPriceTotal   = 5000,
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Autofire_T3_Rel", int_param = 1, is_elite = true,},
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Basic_T3_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystallSparks_T3_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Basic_T3_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Heavy_T3_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaser_T3_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystalBuckshotGun_T3_Epic", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontLineCannon_T3_Epic", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Laser_Sniper_T3_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaBlade_T3_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailgunDestr_T3_Rel", int_param = 1, },
        },
    },

    random_contents =
    {
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Autofire_T3_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Basic_T3_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystallSparks_T3_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Basic_T3_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Heavy_T3_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaser_T3_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystalBuckshotGun_T3_Epic", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontLineCannon_T3_Epic", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Laser_Sniper_T3_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaBlade_T3_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailgunDestr_T3_Rel", int_param = 1, drop_weight = 1.0, }, },
    },
}

Def.Bundle_Guard_Feb23_T4 =
{
    inherit             = "BundleBase",
    premiumPrice        = 7500,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_Guard_Feb23_T4_name",
    uiDesc              = "Bundle_Guard_Feb23_T4_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_23_feb_8_10",
    premiumPriceTotal   = 7500,
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Autofire_T4_Rel", int_param = 1, is_elite = true,},
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Basic_T4_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystallSparks_T4_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Basic_T4_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Heavy_T4_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaser_T4_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystalBuckshotGun_T4_Epic", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontLineCannon_T4_Epic", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Laser_Sniper_T4_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaBlade_T4_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailgunDestr_T4_Rel", int_param = 1, },
        },
    },

    random_contents =
    {
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Autofire_T4_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Basic_T4_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystallSparks_T4_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Basic_T4_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Heavy_T4_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaser_T4_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystalBuckshotGun_T4_Epic", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontLineCannon_T4_Epic", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Laser_Sniper_T4_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaBlade_T4_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailgunDestr_T4_Rel", int_param = 1, drop_weight = 1.0, }, },
    },
}

Def.Bundle_Guard_Feb23_T5 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 10000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_Guard_Feb23_T5_name",
    uiDesc              = "Bundle_Guard_Feb23_T5_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_23_feb_11_12",
    premiumPriceTotal   = 10000,
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Autofire_T5_Rel", int_param = 1, is_elite = true,},
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Basic_T5_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystallSparks_T5_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Basic_T5_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Heavy_T5_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaser_T5_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystalBuckshotGun_T5_Epic", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontLineCannon_T5_Epic", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Laser_Sniper_T5_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaBlade_T5_Rel", int_param = 1, },
            { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailgunDestr_T5_Rel", int_param = 1, },
        },
    },

    random_contents =
    {
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Autofire_T5_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Basic_T5_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystallSparks_T5_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Railgun_Basic_T5_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Plasmagun_Heavy_T5_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_ForkLaser_T5_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_CrystalBuckshotGun_T5_Epic", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_FrontLineCannon_T5_Epic", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Laser_Sniper_T5_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_PlasmaBlade_T5_Rel", int_param = 1, drop_weight = 1.0, }, },
        { { type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailgunDestr_T5_Rel", int_param = 1, drop_weight = 1.0, }, },
    },
}

Def.Bundle_March8_2019 =
{
    inherit             = "BundleBase",
    premiumPrice        = 2280,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_March8_2019_name",
    uiDesc              = "Bundle_March8_2019_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_8March_1_2017",
    premiumPriceTotal   = 2280,
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_6", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_1", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_2", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_3", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_4", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_5", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "womans_day_2019_6", price_weight = 0.20, },
    },
}

Def.Bundle_May9_2019 =
{
    inherit             = "BundleBase",
    premiumPrice        = 2400,
    premiumPriceTotal   = 2400,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_May9_2019_name",
    uiDesc              = "Bundle_May9_2019_desc",
    cant_be_bought      = true,
    uiPromo             = "bundle_may9",
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_6", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_7", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_1", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_2", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_3", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_4", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_5", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_6", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "may_9_2019_7", price_weight = 0.10, },
    },
}

Def.Bundle_Crossout_Birthday_2019 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),
    eventPrice = 500,
    uiName = "Bundle_Crossout_Birthday_2019_name",
    uiDesc = "Bundle_Crossout_Birthday_2019_desc",
    cant_be_bought = true,
    uiPromo = "bandle_47",
    default_icon = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutBeepHorn", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutEagleSign", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutHorns", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutBeepHorn", price_weight = 0.33, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutEagleSign", price_weight = 0.33, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "CrossoutHorns", price_weight = 0.34, },
    },
}

Def.Bundle_Dutch_Auction_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),
    premiumPrice = 100000,
    min_gold_for_auction = 10000,
    uiName = "Bundle_Dutch_Auction_1_name",
    uiDesc = "Bundle_Dutch_Auction_1_desc",
    cant_be_bought = true,
    uiPromo = "bandle_38",
    default_icon = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_KnightIron", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_KnightIron", price_weight = 1, },
    },
}

Def.Bundle_Dutch_Auction_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),
    premiumPrice = 50000,
    min_gold_for_auction = 10000,
    uiName = "Bundle_Dutch_Auction_2_name",
    uiDesc = "Bundle_Dutch_Auction_2_desc",
    cant_be_bought = true,
    uiPromo = "bandle_38",
    default_icon = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_11", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_12", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_4", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_11", price_weight = 0.33, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_12", price_weight = 0.33, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2019_4", price_weight = 0.34, },
    },
}

Def.Bundle_Event_Birthday2020 =
{
    inherit				= "BundleBase",
    premiumPrice		= 500,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_Event_Birthday2020_name",
    uiDesc				= "Bundle_Event_Birthday2020_desc",
    cant_be_bought  	= true,
    uiPromo				= "bandle_40",
    default_icon    	= "dlcIco",
    hiddenInShop    	= false,

    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass2_5", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass2_14", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass2_18", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass2_13", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Newyear01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_AlienwareArena01", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass2_5", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass2_14", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass2_18", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass2_13", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Newyear01", price_weight = 0.18, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_AlienwareArena01", price_weight = 0.18, },
    },
}

-- Halloween 2020 марафон

Def.Bundle_Halloween_2020_1 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_1_desc",
    uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Halloween_2020_1",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Exp50x15", price_weight = 0.20, },
    },
}

Def.Bundle_Halloween_2020_2 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_2_desc",
    uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Halloween_2020_2",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM,			 amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 40, str_param = "Iridium_monocrystall", },
    },
}

Def.Bundle_Halloween_2020_3 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_3_desc",
    uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Halloween_2020_3",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.AUTOGEN, amount = 2, str_param = "DOUBLE", int_param = 17},
    },
}

Def.Bundle_Halloween_2020_4 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_4_desc",
    uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Halloween_2020_4",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Credits50x15", price_weight = 0.20,},
    },
}

Def.Bundle_Halloween_2020_5 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_5_desc",
    uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Halloween_2020_5",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 			amount = 1,  int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 40, str_param = "Aliens_ship_part", },
    },
}

Def.Bundle_Halloween_2020_6 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_6_desc",
    uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Halloween_2020_6",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, amount = 1,  int_param = 60 * 60 * 24 },
    },
}

Def.Bundle_Halloween_2020_7 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_7_desc",
    uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Halloween_2020_7",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "LootAttempts15", price_weight = 0.20,},
    },
}

Def.Bundle_Halloween_2020_Final =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween_2020_FINAL_name",
    uiDesc = "Bundle_Halloween_2020_FINAL_desc",
    uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Halloween_2020_FINAL",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 * 7 },
		{ type = ai.BundleContent.TITLE, amount = 1,		int_param = PlayerTitleId.HALLOWEEN_2025, price_weight = 0.20,},
    },
}

-- Halloween 2020 наклееки
Def.Bundle_Halloween2020 =
{
    inherit = "BundleBase",
    premiumPrice = 999,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween2020_name",
    uiDesc = "Bundle_Halloween2020_desc",
    cant_be_bought = true,
    uiPromo = "Bundle_Halloween2018_promo",
    default_icon = "dlcIco",

    ui_content =
    {
        {
			{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "HalloweenBoost", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_6", },
        },
    },

    fixed_contents =
    {
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "HalloweenBoost", price_weight = 0.34, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_1", price_weight = 0.11, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_2", price_weight = 0.11, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_3", price_weight = 0.11, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_4", price_weight = 0.11, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_5", price_weight = 0.11, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2020_6", price_weight = 0.11, },
    },
}

-- Сундуки с новогодними пушками
Def.Bundle_NEW2021YEAR_GUN_1 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NEW2021YEAR_GUN_1_name",
    uiDesc = "Bundle_NEW2021YEAR_GUN_desc",
    uiPromo 			= "bandle_41",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NEW2021YEAR_GUN_1",
	
	ui_content =
    {
        {
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuppressingGun_NY_T3", },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuppressingGun_NY_T4", },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuppressingGun_NY_T5", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuppressingGun_NY_T3", int_param = 0.33, },
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuppressingGun_NY_T4", int_param = 0.33, },
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SuppressingGun_NY_T5", int_param = 0.34, },
    },
}

Def.Bundle_NEW2021YEAR_GUN_2 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NEW2021YEAR_GUN_2_name",
    uiDesc = "Bundle_NEW2021YEAR_GUN_desc",
    uiPromo 			= "bandle_41",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NEW2021YEAR_GUN_2",

	ui_content =
    {
        {
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SmartRocketLauncher_NY_T3", },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SmartRocketLauncher_NY_T4", },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SmartRocketLauncher_NY_T5", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SmartRocketLauncher_NY_T3", int_param = 0.33, },
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SmartRocketLauncher_NY_T4", int_param = 0.33, },
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_SmartRocketLauncher_NY_T5", int_param = 0.34, },
    },
}

Def.Bundle_NEW2021YEAR_GUN_3 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NEW2021YEAR_GUN_3_name",
    uiDesc = "Bundle_NEW2021YEAR_GUN_desc",
    uiPromo 			= "bandle_41",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NEW2021YEAR_GUN_3",

	ui_content =
    {
        {
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Minigun_NY_T3", },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Minigun_NY_T4", },
			{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Minigun_NY_T5", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Minigun_NY_T3", int_param = 0.33, },
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Minigun_NY_T4", int_param = 0.33, },
		{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_Minigun_NY_T5", int_param = 0.34, },
    },
}

-- NewYear 2021 марафон
Def.Bundle_NewYear_2021_1 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_1_desc",
    uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NewYear_2021_1",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "NewYearExp15", price_weight = 0.20, },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2, str_param = "Relics_craft_part", },
    },
}

Def.Bundle_NewYear_2021_2 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_2_desc",
    uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NewYear_2021_2",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM,			 amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 40, str_param = "Iridium_monocrystall", },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2, str_param = "Relics_craft_part", },
    },
}

Def.Bundle_NewYear_2021_3 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_3_desc",
    uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NewYear_2021_3",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.AUTOGEN, amount = 2, str_param = "DOUBLE", int_param = 17},
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2, str_param = "Relics_craft_part", },
    },
}

Def.Bundle_NewYear_2021_4 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_4_desc",
    uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NewYear_2021_4",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "NewYearCredits15", price_weight = 0.20,},
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2, str_param = "Relics_craft_part", },
    },
}

Def.Bundle_NewYear_2021_5 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_5_desc",
    uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NewYear_2021_5",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 			amount = 1,  int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 40, str_param = "Aliens_ship_part", },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2, str_param = "Relics_craft_part", },
    },
}

Def.Bundle_NewYear_2021_7 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_7_desc",
    uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NewYear_2021_7",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "NewYearLootAttempts15", price_weight = 0.20,},
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2, str_param = "Relics_craft_part", },
    },
}

Def.Bundle_NewYear_2021_Final =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_NewYear_2021_FINAL_name",
    uiDesc = "Bundle_NewYear_2021_FINAL_desc",
    uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_NewYear_2021_FINAL",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 * 7 },
		{ type = ai.BundleContent.TITLE, amount = 1,		int_param = PlayerTitleId.NEW_2026_YEAR, price_weight = 0.20,},
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 20, str_param = "Relics_craft_part", },
    },
}

-- Сундук на день святого валентина 2021
Def.Bundle_February_14_2021 =
{
    inherit        = "BundleBase",
    premiumPrice   = 3000,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_February_14_2021_name",
    uiDesc         = "Bundle_February_14_2021_desc",
    cant_be_bought = true,
    uiPromo        = "Bundle_ShipActivateQuest1_T5",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_5", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb14_02", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_1", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_2", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_3", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_4", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2021_5", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb14_02",	  price_weight = 0.20, },
    },
}

-- SC-114559 1 апреля. Новый набор с наклейками и покраской
Def.Bundle_April1_2021 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 3000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April1_2021_name",
    uiDesc              = "Bundle_April1_2021_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_5", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Flowers_01", },
        },
    },

    fixed_contents = 
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_1", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_2", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_3", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_4", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2021_5", price_weight = 0.14, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Flowers_01", price_weight = 0.30, },
    },
}

Def.Bundle_SalyutEvent_Imper  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice        = 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_SalyutEvent_Imper_name",
	uiDesc				= "Bundle_SalyutEvent_Imper_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Empire_Sign",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_116",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Blue",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Blue2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Blue3",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Empire_Sign", 			price_weight = 0.4, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_116", 			price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Blue", 	price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Blue2", 	price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Blue3",	price_weight = 0.1, },
    },
}

Def.Bundle_SalyutEvent_Fed  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice        = 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_SalyutEvent_Fed_name",
	uiDesc				= "Bundle_SalyutEvent_Fed_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Federation_Sign",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_112",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Lilac",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Pink",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Pink2",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Federation_Sign", 		price_weight = 0.4, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_112", 			price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Lilac", 	price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Pink", 	price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Pink2", 	price_weight = 0.1, },
    },
}

Def.Bundle_SalyutEvent_Jer  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice        = 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_SalyutEvent_Jer_name",
	uiDesc				= "Bundle_SalyutEvent_Jer_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_45",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Jericho_Sign",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_81",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Lavender",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Orange",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Red",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Jericho_Sign",			price_weight = 0.4, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_81", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Lavender", price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Orange",	price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Red", 		price_weight = 0.1, },
    },
}

Def.Bundle_SalyutEvent_Paints  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice        = 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_SalyutEvent_Paints_name",
	uiDesc				= "Bundle_SalyutEvent_Paints_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "OldGoodPaint_1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_CamoPixel01",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Camouflage02",	},
		},
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Camouflage11_1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Camouflage11_2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Camouflage11_3",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "OldGoodPaint_1", 			price_weight = 0.17, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Camouflage11_1", 	price_weight = 0.17, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Camouflage11_2", 	price_weight = 0.17, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Camouflage11_3", 	price_weight = 0.17, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_CamoPixel01", 		price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Camouflage02", 		price_weight = 0.16, },
    },
}

Def.Bundle_SalyutEvent_Parts_1  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 400,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_SalyutEvent_Parts_1_name",
	uiDesc				= "Bundle_SalyutEvent_Parts_1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_65",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "SalyutCorpse",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "SalyutCorpse", },
    },
}

Def.Bundle_SalyutEvent_Parts_2  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_SalyutEvent_Parts_2_name",
	uiDesc				= "Bundle_SalyutEvent_Parts_2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_65",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "SalyutModule",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "SalyutModule", },
    },
}

Def.Bundle_SalyutEvent_Parts_3  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 100,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_SalyutEvent_Parts_3_name",
	uiDesc				= "Bundle_SalyutEvent_Parts_3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_65",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 2,	str_param = "SalyutWing",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 2, str_param = "SalyutWing", },
    },
}

Def.Bundle_SalyutEvent_Parts_4  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 300,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_SalyutEvent_Parts_4_name",
	uiDesc				= "Bundle_SalyutEvent_Parts_4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_65",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	ui_content = 
    {
        {
            { type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_SalyutWing", int_param = 1, is_elite = true, },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.BLUEPRINT, amount = 1, str_param = "BP_SalyutWing", int_param = 1, },
    },
}

Def.Bundle_9_may_2021 =
{
    inherit             = "BundleBase",
    premiumPrice        = 3000,
    premiumPriceTotal   = 3000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_9_may_2021_name",
    uiDesc              = "Bundle_9_may_2021_desc",
    cant_be_bought      = true,
    uiPromo             = "bundle_may9",
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_5", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb23_Camouflage01",	},
        },
    },

    fixed_contents =
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb23_Camouflage01", price_weight = 0.25, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_1", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_2", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_3", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_4", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2021_5", price_weight = 0.15, },
    },
}

Def.Bundle_9_may_2024 =
{
    inherit             = "BundleBase",
    premiumPrice        = 3000,
    premiumPriceTotal   = 3000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_9_may_2024_name",
    uiDesc              = "Bundle_9_may_2024_desc",
    cant_be_bought      = true,
    uiPromo             = "bundle_may9",
    default_icon        = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_5", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_3", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_4", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "9_may_2024_5", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Fed2  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Fed2_name",
	uiDesc				= "Bundle_XenoEvent_Fed2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Cool_Down",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_110",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Memento01",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_76",	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Cool_Down",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_110", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Memento01", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_76",	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.4, },
    },
}

Def.Bundle_XenoEvent_Jer2  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Jer2_name",
	uiDesc				= "Bundle_XenoEvent_Jer2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_45",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Direct_Hit",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_111",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Football02_1",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_77",	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Direct_Hit",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_111", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Football02_1", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_77",	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.4, },
    },
}

Def.Bundle_XenoEvent_emp2  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_emp2_name",
	uiDesc				= "Bundle_XenoEvent_emp2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Police_Lights",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_118",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Wood01",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_75",	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Police_Lights",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_118", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Wood01", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_75",	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.4, },
    },
}

Def.Bundle_XenoEvent_Paints2  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints2_name",
	uiDesc				= "Bundle_XenoEvent_Paints2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
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

Def.Bundle_XenoEvent_seed1  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 320,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_seed1_name",
	uiDesc				= "Bundle_XenoEvent_seed1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AUTOGEN,	amount = 10, str_param = "BALANCED", int_param = 17	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassExp30",	},			
		},
	},		
    fixed_contents =
    {
        { type = ai.BundleContent.AUTOGEN, amount = 10, str_param = "BALANCED", int_param = 17	},
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassExp30", 		price_weight = 1, },
    },
}

Def.Bundle_XenoEvent_seed2  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 480,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_seed2_name",
	uiDesc				= "Bundle_XenoEvent_seed2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AUTOGEN,	amount = 10, str_param = "SPECIAL", int_param = 17	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassExp30",	},			
		},
	},		
    fixed_contents =
    {
        { type = ai.BundleContent.AUTOGEN, amount = 10, str_param = "SPECIAL", int_param = 17	},
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassExp30", 		price_weight = 1, },
    },
}

Def.Bundle_XenoEvent_seed3  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_seed3_name",
	uiDesc				= "Bundle_XenoEvent_seed3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_17",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AUTOGEN,	amount = 5, str_param = "DOUBLE", int_param = 17	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassExp30",	},			
		},
	},		
    fixed_contents =
    {
        { type = ai.BundleContent.AUTOGEN, amount = 5, str_param = "DOUBLE", int_param = 17	},
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassExp30", 		price_weight = 1, },
    },
}

Def.Bundle_ProtazanEvent =
{
    inherit = "BundleBase",
    eventPrice = 2000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_ProtazanEvent_name",
    uiDesc = "Bundle_ProtazanEvent_desc",
    uiPromo 			= "bandle_45",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_ProtazanEvent",
	cant_be_bonus		= true,

	ui_content = 
	{
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 1,	str_param = "Ship_Race2_L_T5_Protozan_part",	},			
		},
	},	
	
    fixed_contents =
    {
        { type = ai.BundleContent.CRAFT_RESOURCE, amount = 1, str_param = "Ship_Race2_L_T5_Protozan_part", },
    },
}

Def.Bundle_XenoEvent_fox1  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_fox1_name",
	uiDesc				= "Bundle_XenoEvent_fox1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_45",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Blades",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_114",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Waves_1",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_87",	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Blades",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_114", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Waves_1", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_87",	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.4, },
    },
}

Def.Bundle_XenoEvent_san1  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_san1_name",
	uiDesc				= "Bundle_XenoEvent_san1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Shark",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_115",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Waves_2",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_88",	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Shark",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_115", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Waves_2", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_88",	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.4, },
    },
}

Def.Bundle_XenoEvent_hos1  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_hos1_name",
	uiDesc				= "Bundle_XenoEvent_hos1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_45",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Spring_Scull",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_113",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Football02_2",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_89",	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Spring_Scull",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_113", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Football02_2", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_89",	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.4, },
    },
}

Def.Bundle_XenoEvent_Paints3  = 
{
	inherit				= "BundleBase",
	--eventPrice 		= 1200,
	premiumPrice		= 5000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints3_name",
	uiDesc				= "Bundle_XenoEvent_Paints3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
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

Def.Bundle_XenoEvent_Stickers1 =
{
    inherit				= "BundleBase",
	eventPrice 			= 300,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers1_name",
	uiDesc				= "Bundle_XenoEvent_Stickers1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

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

Def.Bundle_XenoEvent_Stickers2 =
{
    inherit				= "BundleBase",
	eventPrice 			= 300,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers2_name",
	uiDesc				= "Bundle_XenoEvent_Stickers2",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

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

Def.Bundle_XenoEvent_Stickers3 =
{
    inherit				= "BundleBase",
	eventPrice 			= 300,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers3_name",
	uiDesc				= "Bundle_XenoEvent_Stickers3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

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

-- Halloween 2021 SC-115419
Def.Bundle_Halloween2021 =
{
    inherit = "BundleBase",
    premiumPrice = 999,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween2021_name",
    uiDesc = "Bundle_Halloween2021_desc",
    cant_be_bought = true,
    uiPromo = "Bundle_Halloween2018_promo",
    default_icon = "dlcIco",

    ui_content =
    {
        {
			{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "HalloweenBoost", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Eyes_01", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Arms_01", },
        },
		{
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_3", },
		},
		{
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_6", },
        },
    },

    fixed_contents =
    {
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "HalloweenBoost", price_weight = 0.30, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Eyes_01", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Arms_01", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_1", price_weight = 0.07, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_2", price_weight = 0.07, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_3", price_weight = 0.07, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_4", price_weight = 0.07, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_5", price_weight = 0.07, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2021_6", price_weight = 0.07, },
    },
}

Def.Bundle_XenoEvent_pirat1  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 1200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_pirat1_name",
	uiDesc				= "Bundle_XenoEvent_pirat1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Snowman",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_153",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Camouflage13_1",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_90",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.FILIBUSTER,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Snowman",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_153", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Camouflage13_1", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_90",	price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.FILIBUSTER,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_pirat2  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 1200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_pirat2_name",
	uiDesc				= "Bundle_XenoEvent_pirat2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Utility_Bag",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_154",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Camouflage13_2",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_91",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.ANARCHIST,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Utility_Bag",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_154", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Camouflage13_2", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_91",	price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.ANARCHIST,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_pirat3  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 1200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_pirat3_name",
	uiDesc				= "Bundle_XenoEvent_pirat3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Neon_Rocket",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_155",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Camouflage13_3",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_92",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.JOLLY_ROGER,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Neon_Rocket",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_155", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Camouflage13_3", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_92",	price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.JOLLY_ROGER,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_pirat4  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 1200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_pirat4_name",
	uiDesc				= "Bundle_XenoEvent_pirat4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Christmas_Ball",},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_156",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Football02_3",	},
			{ type = ai.BundleContent.MOTTO,	amount = 1,	str_param = "Taunt_93",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.PRIVATEER,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,	amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Christmas_Ball",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  amount = 1, str_param = "Avatar_156", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_Football02_3", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, amount = 1, str_param = "Taunt_93",	price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.PRIVATEER,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

-- SC-115685 Поиски сокровищ в ОМ. Ивент на новый год
Def.Bundle_BP22_Treasure_1  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_BP22_Treasure_name",
	uiDesc				= "Bundle_BP22_Treasure_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	
	required_account_aura   = "TreasureMap_1",
		
    fixed_contents =
    {
		{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.TREASURE_HUNTER,	price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Utility_Bag",					price_weight = 0.2, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Crossout_Football02_3", 		price_weight = 0.1, },
    },
}
Def.Bundle_BP22_Treasure_2  = 
{
	inherit				= "Bundle_BP22_Treasure_1",
	storeItemId			= Bundles_GetNextStoreItemId(),
	
	required_account_aura   = "TreasureMap_2",
	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Crossout_Camouflage13_1",	price_weight = 0.1, },
		{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_154", 				price_weight = 0.1,	},
		{ type = ai.BundleContent.MOTTO, 			amount = 1, str_param = "Taunt_93",					price_weight = 0.1, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 17, str_param = "Pure_silicon", 	 },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 24, str_param = "Explosion", 	 },
    },
}
Def.Bundle_BP22_Treasure_3  = 
{
	inherit				= "Bundle_BP22_Treasure_1",
	storeItemId			= Bundles_GetNextStoreItemId(),
		
	required_account_aura   = "TreasureMap_3",
	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Snowman",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.ANARCHIST,	price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Crossout_Camouflage13_3", 	price_weight = 0.1, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 28, str_param = "Iridium_plate", 	 },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 33, str_param = "Computing_chip", 	 },
    },
}

Def.Bundle_BP22_Treasure_4  = 
{
	inherit				= "Bundle_BP22_Treasure_1",
	storeItemId			= Bundles_GetNextStoreItemId(),
		
	required_account_aura   = "TreasureMap_4",
	
    fixed_contents =
    {
		{ type = ai.BundleContent.AVATAR, 		  	amount = 1, str_param = "Avatar_153", 				price_weight = 0.2, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Crossout_Camouflage13_2", 	price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.PRIVATEER,	price_weight = 0.1, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 35, str_param = "Tungsten_plate", 	 },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 42, str_param = "Computing_chip", 	 },
    },
}
Def.Bundle_BP22_Treasure_5  = 
{
	inherit				= "Bundle_BP22_Treasure_1",
	storeItemId			= Bundles_GetNextStoreItemId(),
		
	required_account_aura   = "TreasureMap_5",
	
    fixed_contents =
    {
		{ type = ai.BundleContent.MOTTO,			amount = 1, str_param = "Taunt_91",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.JOLLY_ROGER,	price_weight = 0.1, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Christmas_Ball",			price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 12, str_param = "Processor_block",	},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 35, str_param = "Iridium_plate", 	},
    },
}
Def.Bundle_BP22_Treasure_6  = 
{
	inherit				= "Bundle_BP22_Treasure_1",
	storeItemId			= Bundles_GetNextStoreItemId(),
		
	required_account_aura   = "TreasureMap_6",
	
    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.FILIBUSTER,	price_weight = 0.1, },
		{ type = ai.BundleContent.AVATAR, 		  	amount = 1, str_param = "Avatar_155",  				price_weight = 0.2, },
		{ type = ai.BundleContent.ACCOUNT_AURA, 	amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 17, str_param = "Screened_battery",},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 43, str_param = "Pure_silicon", 	},
    },
}
Def.Bundle_BP22_Treasure_7  = 
{
	inherit				= "Bundle_BP22_Treasure_1",
	storeItemId			= Bundles_GetNextStoreItemId(),
		
	required_account_aura   = "TreasureMap_7",
	
    fixed_contents =
    {
        { type = ai.BundleContent.MOTTO, 			amount = 1, str_param = "Taunt_90",					price_weight = 0.1, },
		{ type = ai.BundleContent.ACCOUNT_AURA, 	amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Neon_Rocket",				price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 27, str_param = "Processor_block",	},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 24, str_param = "Screened_battery",},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 39, str_param = "Tungsten_plate",	},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 41, str_param = "Explosion",		},
    },
}
Def.Bundle_BP22_Treasure_8  = 
{
	inherit				= "Bundle_BP22_Treasure_1",
	storeItemId			= Bundles_GetNextStoreItemId(),
		
	required_account_aura   = "TreasureMap_8",
	
    fixed_contents =
    {
        { type = ai.BundleContent.MOTTO, 			amount = 1, str_param = "Taunt_92",					price_weight = 0.1, },
		{ type = ai.BundleContent.AVATAR, 		  	amount = 1, str_param = "Avatar_156", 				price_weight = 0.2, },
		{ type = ai.BundleContent.ACCOUNT_AURA, 	amount = 1, str_param = "AsteroidPremiumLoot10", 	price_weight = 0.3, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 50, str_param = "AlienCompositeAlloy",	},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 11, str_param = "Processor_block",		},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 9, str_param = "Screened_battery",		},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 16, str_param = "Tungsten_plate",		},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 30, str_param = "Pure_silicon",		},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 25, str_param = "Explosion",			},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 15, str_param = "Computing_chip",		},
		{ type = ai.BundleContent.CRAFT_RESOURCE, 	amount = 27, str_param = "Iridium_plate",		},
    },
}
-- SC-115750 Поиски сокровищ в ОМ. сундук ЛеВассера
Def.Bundle_Treasure_LeVasser  = 
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Treasure_LeVasser_name",
	uiDesc				= "Bundle_Treasure_LeVasser_desc",
	uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
	
	required_account_aura   = "PiratBasePve_TreasureChest",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Crystal_Shard",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Newyear02",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.INESCAPABLE_ROCK,	},
			{ type = ai.BundleContent.AVATAR, 		  	amount = 1, str_param = "Avatar_166", 	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_102",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Crystal_Shard",			price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "Crossout_Newyear02", price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 			amount = 1, str_param = "Taunt_102",	price_weight = 0.1, },
		{ type = ai.BundleContent.AVATAR, 		  	amount = 1, str_param = "Avatar_166", 				price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.INESCAPABLE_ROCK,	price_weight = 0.1, }, 
    },
}

Def.Bundle_Stickers_Game_10_Years =
{
    inherit        = "BundleBase",
    premiumPrice   = 100,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_Stickers_Game_10_Years_name",
    uiDesc         = "Bundle_Stickers_Game_10_Years_desc",
    cant_be_bought = true,
    uiPromo        = "bundle_may9",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_5", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_3", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_4", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_5", price_weight = 0.2, },
    },
}

Def.Bundle_Stickers_Targem_20_Years =
{
    inherit        = "BundleBase",
    premiumPrice   = 200,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_Stickers_Targem_20_Years_name",
    uiDesc         = "Bundle_Stickers_Targem_20_Years_desc",
    cant_be_bought = true,
    uiPromo        = "Bundle_ShipActivateQuest1_T5",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_6", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_7", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_8", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_9", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_10", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_6", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_7", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_8", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_9", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2022_10", price_weight = 0.20, },
    },
}

-- Сундук на день святого валентина 2022
Def.Bundle_February_14_2022 =
{
    inherit        = "BundleBase",
    premiumPrice   = 3000,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_February_14_2022_name",
    uiDesc         = "Bundle_February_14_2022_desc",
    cant_be_bought = true,
    uiPromo        = "Bundle_ShipActivateQuest1_T5",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_3", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_5", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Heart", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_1", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_2", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_3", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_4", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2022_5", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Heart", price_weight = 0.20, },
    },
}

-- Сундук на 23 февраля 2022
Def.Bundle_February_23_2022 =
{
    inherit        = "BundleBase",
    premiumPrice   = 3000,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_February_23_2022_name",
    uiDesc         = "Bundle_February_23_2022_desc",
    cant_be_bought = true,
    uiPromo        = "bundle_may9",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_3", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_5", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb23_Camouflage02", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_1", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_2", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_3", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_4", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "23_feb_2022_5", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb23_Camouflage02", price_weight = 0.20, },
    },
}

Def.Bundle_XenoEvent_frak1  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 1200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_frak1_name",
	uiDesc				= "Bundle_XenoEvent_frak1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Exotic_Ikebana",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_124",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_JellyPaint_1",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_97",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.EXECUTIONER,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Exotic_Ikebana",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_124", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Crossout_JellyPaint_1",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_97",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.EXECUTIONER,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_frak2  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 1200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_frak2_name",
	uiDesc				= "Bundle_XenoEvent_frak2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_45",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Astronaut",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_125",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Football03_3",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_96",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.GRIM_REAPER,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Astronaut",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_125", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Crossout_Football03_3", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_96",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.GRIM_REAPER,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_frak3  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 1200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_frak3_name",
	uiDesc				= "Bundle_XenoEvent_frak3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Antler",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_127",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crossout_Football03_2",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_95",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.MADMAN,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Antler",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_127", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Crossout_Football03_2", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_95",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.MADMAN,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints4  = 
{
	inherit				= "BundleBase",
	eventPrice 			= 1200,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints4_name",
	uiDesc				= "Bundle_XenoEvent_Paints4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
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

Def.Bundle_XenoEvent_Stickers4 =
{
    inherit				= "BundleBase",
	eventPrice 			= 300,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers4_name",
	uiDesc				= "Bundle_XenoEvent_Stickers4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

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

-- SC-115956 1 апреля. Новый сундук 2022
Def.Bundle_April1_2022 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 2900,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April1_2022_name",
    uiDesc              = "Bundle_April1_2022_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_5", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Cardboard_01", },
        },
    },

    fixed_contents = 
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_2", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_1", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_3", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_4", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2022_5", price_weight = 0.14, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Cardboard_01", price_weight = 0.30, },
    },
}

Def.Bundle_XenoEvent_flost1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_flost1_name",
	uiDesc				= "Bundle_XenoEvent_flost1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Moon_Rover",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_139",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Stairs",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_117",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.SOUL_OF_WRATH,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Moon_Rover",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_139", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Stairs",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_117",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.SOUL_OF_WRATH,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_flost2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_flost2_name",
	uiDesc				= "Bundle_XenoEvent_flost2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Octo",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_140",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Stratum_01_2",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_118",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.WARRIOR,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Octo",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_140", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Stratum_01_2", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_118",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.WARRIOR,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_flost3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_flost3_name",
	uiDesc				= "Bundle_XenoEvent_flost3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "ModernHead",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_141",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Pyramids",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_119",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.COMBAT_MASTER,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "ModernHead",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_141", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Pyramids", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_119",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.COMBAT_MASTER,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_flost4  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_flost4_name",
	uiDesc				= "Bundle_XenoEvent_flost4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Spiked",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_138",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Curved",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_120",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.FLAME_OF_REVENGE,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Spiked",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_138", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Curved", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_120",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.FLAME_OF_REVENGE,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints5  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints5_name",
	uiDesc				= "Bundle_XenoEvent_Paints5_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Metallic_Yellow",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Uneven_Pink2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Green",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Mosaic_02",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Triangles_3",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Metallic_Yellow", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Uneven_Pink2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Green", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Mosaic_02", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Triangles_3", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers5 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers5_name",
	uiDesc				= "Bundle_XenoEvent_Stickers5_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_1",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_13", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_14", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_1", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_2", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_3", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_13", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_14", price_weight = 0.20, },
    },
}
Def.Bundle_XenoEvent_tour1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_tour1_name",
	uiDesc				= "Bundle_XenoEvent_tour1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Ellydium_Sign",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_144",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Seashell_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_121",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.TOUR_1,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Ellydium_Sign",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_144", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Seashell_01",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_121",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.TOUR_1,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_tour2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_tour2_name",
	uiDesc				= "Bundle_XenoEvent_tour2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "AlienShrine",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_145",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Flowers_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_122",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.TOUR_2,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "AlienShrine",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_145", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Flowers_02", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_122",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.TOUR_2,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_tour3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_tour3_name",
	uiDesc				= "Bundle_XenoEvent_tour3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "SC_Logo",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_146",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Stars_31",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_123",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.TOUR_3,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "SC_Logo",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_146", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Stars_31", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_123",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.TOUR_3,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_tour4  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_tour4_name",
	uiDesc				= "Bundle_XenoEvent_tour4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Totem",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_147",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Bubbles_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_124",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.TOUR_4,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Totem",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_147", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Bubbles_01", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_124",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.TOUR_4,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints6  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints6_name",
	uiDesc				= "Bundle_XenoEvent_Paints6_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Turquoise",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Pink2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Lilac2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Green2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Orange2",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Turquoise", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Pink2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Lilac2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Green2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Orange2", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers6 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers6_name",
	uiDesc				= "Bundle_XenoEvent_Stickers6_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_1",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_7", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_8", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_9", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_1", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_5", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_7", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_8", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_9", price_weight = 0.20, },
    },
}

Def.Bundle_XenoEvent_holiday1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_holiday1_name",
	uiDesc				= "Bundle_XenoEvent_holiday1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Rabbit",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_162",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "NY19_Holiday02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_103",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HOLIDAY_5,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Rabbit",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_162", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "NY19_Holiday02",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_103",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HOLIDAY_5,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_holiday2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_holiday2_name",
	uiDesc				= "Bundle_XenoEvent_holiday2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Fox",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_163",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Blots_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_104",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HOLIDAY_9,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Fox",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_163", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Blots_02", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_104",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HOLIDAY_9,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_holiday3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_holiday3_name",
	uiDesc				= "Bundle_XenoEvent_holiday3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Wishes",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_164",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Levels",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_105",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HOLIDAY_10,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Wishes",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_164", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Levels", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_105",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HOLIDAY_10,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_holiday4  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_holiday4_name",
	uiDesc				= "Bundle_XenoEvent_holiday4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Sakura",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_109",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Mosaic_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_106",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HOLIDAY_11,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Sakura",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_109", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Mosaic_02", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_106",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HOLIDAY_11,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints7  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints7_name",
	uiDesc				= "Bundle_XenoEvent_Paints7_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Pastel_Yellow2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Elder_Elder1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Elder_Elder2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Elder_Elder3",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Elder_Elder4",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Pastel_Yellow2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Elder_Elder1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Elder_Elder2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Elder_Elder3", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Elder_Elder4", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers7 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers7_name",
	uiDesc				= "Bundle_XenoEvent_Stickers7_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_4",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_6", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_9", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_10", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_4", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_5", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_6", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_9", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass4_10", price_weight = 0.20, },
    },
}

-- SC-116832 Хеллоуин 2022. Новый набор
Def.Bundle_Halloween2022 =
{
    inherit = "BundleBase",
    premiumPrice = 666,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween2022_name",
    uiDesc = "Bundle_Halloween2022_desc",
    cant_be_bought = true,
    uiPromo = "Bundle_Halloween2018_promo",
    default_icon = "dlcIco",

    ui_content =
    {
		{
            { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "HalloweenBoost", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_2", },
		},
		{
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_5", },
        },
    },

    fixed_contents =
    {
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "HalloweenBoost", price_weight = 0.30, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_1", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_2", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_3", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_4", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2022_5", price_weight = 0.14, },
    },
}

-- SC-117000 Хеллоуин 2022. награды за потасовку
Def.Bundle_Brawl_Halloween_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Halloween_reward1_name",
	uiDesc				= "Bundle_Brawl_Halloween_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Halloween_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_S_T5_Doctor", },
		},
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Curse_01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Crossout_SpiderWeb2", },
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_S_T5_Doctor", price_weight = 0.50, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Curse_01", price_weight = 0.20,  },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Crossout_SpiderWeb2", price_weight = 0.20,  },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Halloween_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Halloween_reward2_name",
	uiDesc				= "Bundle_Brawl_Halloween_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Halloween_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_S_T5_Doctor", },
		},
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Curse_01", },
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_S_T5_Doctor", price_weight = 0.70,  },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Curse_01", price_weight = 0.20,  },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Halloween_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Halloween_reward3_name",
	uiDesc				= "Bundle_Brawl_Halloween_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Halloween_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_S_T5_Doctor", },		
		},
		{
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.VESSEL,			amount = 1,		str_param = "Ship_Race2_S_T5_Doctor", price_weight = 0.90,  },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

-- SC-117000 марафон PvP 2022. награды
Def.Bundle_Brawl_Pvp_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Pvp_reward1_name",
	uiDesc				= "Bundle_Brawl_Pvp_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Pvp_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_121",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "ToadCover_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_209",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HOLIDAY_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_121", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "ToadCover_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_209",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HOLIDAY_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Pvp_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Pvp_reward2_name",
	uiDesc				= "Bundle_Brawl_Pvp_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Pvp_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_122",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Actinia_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_216",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HOLIDAY_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_122", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Actinia_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_216",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HOLIDAY_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Pvp_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Pvp_reward3_name",
	uiDesc				= "Bundle_Brawl_Pvp_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Pvp_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_123",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Sand_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_198",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HOLIDAY_3,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_123", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Sand_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_198",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HOLIDAY_3,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

-- SC-117015 Возвращение в Эдем 2022. награды
Def.Bundle_Brawl_Eden_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Eden_reward1_name",
	uiDesc				= "Bundle_Brawl_Eden_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Eden_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_108",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Moss_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_199",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HOLIDAY_7,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_108", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Moss_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_199",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HOLIDAY_7,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_Eden_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Eden_reward2_name",
	uiDesc				= "Bundle_Brawl_Eden_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Eden_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_119",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Crystal_3",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_200",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HOLIDAY_8,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_119", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Crystal_3",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_200",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HOLIDAY_8,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Iridium_monocrystall", },
	},
}

-- SC-117246 марафон Орион 2023. награды
Def.Bundle_Brawl_Oreon_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Oreon_reward1_name",
	uiDesc				= "Bundle_Brawl_Oreon_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Oreon_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_128",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Feb23_Camouflage01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_204",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HERO_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_128", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Feb23_Camouflage01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_204",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HERO_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_Oreon_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Oreon_reward2_name",
	uiDesc				= "Bundle_Brawl_Oreon_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Oreon_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_129",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Blots_03",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_205",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HERO_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_129", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Blots_03",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_205",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HERO_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Oreon_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Oreon_reward3_name",
	uiDesc				= "Bundle_Brawl_Oreon_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Oreon_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_130",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Drips_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_206",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HERO_3,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_130", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Drips_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_206",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HERO_3,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Event_Birthday2023 =
{
    inherit				= "BundleBase",
    premiumPrice		= 100,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_Event_Birthday2023_name",
    uiDesc				= "Bundle_Event_Birthday2023_desc",
    cant_be_bought  	= true,
    uiPromo				= "bandle_40",
    default_icon    	= "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_3", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_4", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_5", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SC_Birthday_23", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_1", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_2", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_3", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_4", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2023_5", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "SC_Birthday_23", price_weight = 0.20, },
    },
}
Def.Bundle_XenoEvent_secret1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_secret1_name",
	uiDesc				= "Bundle_XenoEvent_secret1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Torch",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_167",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Step_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_127",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HERO_4,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Torch",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_167", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Step_01",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_127",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HERO_4,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_secret2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_secret2_name",
	uiDesc				= "Bundle_XenoEvent_secret2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Reactor",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_168",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "StoneSlabs_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_128",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HERO_5,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Reactor",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_168", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "StoneSlabs_01", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_128",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HERO_5,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_secret3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_secret3_name",
	uiDesc				= "Bundle_XenoEvent_secret3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "NewRose",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_169",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "StoneSlabs_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_129",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HERO_6,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "NewRose",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_169", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "StoneSlabs_02", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_129",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HERO_6,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_secret4  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_secret4_name",
	uiDesc				= "Bundle_XenoEvent_secret4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_46",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "CutCube",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_170",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Pattern_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_130",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.HERO_7,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "CutCube",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_170", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Pattern_01", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_130",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.HERO_7,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints8  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints8_name",
	uiDesc				= "Bundle_XenoEvent_Paints8_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Elder_Elder5",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Elder_Elder6",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Elder_Elder7",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Elder_Elder8",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Elder_Elder9",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Elder_Elder5", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Elder_Elder6", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Elder_Elder7", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Elder_Elder8", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Elder_Elder9", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers8 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers8_name",
	uiDesc				= "Bundle_XenoEvent_Stickers8_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_3",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_6", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_7", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_3", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_4", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_5", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_6", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_7", price_weight = 0.20, },
    },
}

-- Сундук на день святого валентина 2023
Def.Bundle_February_14_2023 =
{
    inherit        = "BundleBase",
    premiumPrice   = 3000,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_February_14_2023_name",
    uiDesc         = "Bundle_February_14_2023_desc",
    cant_be_bought = true,
    uiPromo        = "Bundle_ShipActivateQuest1_T5",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_5", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb14_03", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_1", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_2", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_3", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_4", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2023_5", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb14_03",	  price_weight = 0.20, },
    },
}

-- SC-117365 марафон Храм 2023. награды
Def.Bundle_Brawl_Temple_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Temple_reward1_name",
	uiDesc				= "Bundle_Brawl_Temple_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Temple_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_126",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Octopus_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_207",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.TEMPLE_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_126", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Octopus_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_207",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.TEMPLE_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_Temple_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Temple_reward2_name",
	uiDesc				= "Bundle_Brawl_Temple_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Temple_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_131",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Stratum_03_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_208",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.TEMPLE_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_131", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Stratum_03_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_208",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.TEMPLE_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Temple_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Temple_reward3_name",
	uiDesc				= "Bundle_Brawl_Temple_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Temple_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_132",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Sakura_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_210",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.TEMPLE_3,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_132", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Sakura_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_210",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.TEMPLE_3,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

-- SC-117376 марафон Лабиринт 2023. награды
Def.Bundle_Brawl_MAZE_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_MAZE_reward1_name",
	uiDesc				= "Bundle_Brawl_MAZE_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_MAZE_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_136",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Net_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_211",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.MAZE_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_136", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Net_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_211",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.MAZE_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_MAZE_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_MAZE_reward2_name",
	uiDesc				= "Bundle_Brawl_MAZE_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_MAZE_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_137",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Moon_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_212",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.MAZE_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_137", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Moon_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_212",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.MAZE_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_MAZE_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_MAZE_reward3_name",
	uiDesc				= "Bundle_Brawl_MAZE_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_MAZE_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_142",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Flowers_03",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_213",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.MAZE_3,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_142", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Flowers_03",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_213",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.MAZE_3,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

-- SC-117394 Награды Марафон по потасовке "Бумажный конфликт"
Def.Bundle_Brawl_Paper_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Paper_reward1_name",
	uiDesc				= "Bundle_Brawl_Paper_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Paper_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_143",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Circles_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_78",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.PAPER_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_143", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Circles_02",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_78",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.PAPER_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_Paper_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Paper_reward2_name",
	uiDesc				= "Bundle_Brawl_Paper_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Paper_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_172",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Circles_03",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_82",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.PAPER_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_172", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Circles_03",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_82",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.PAPER_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Paper_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Paper_reward3_name",
	uiDesc				= "Bundle_Brawl_Paper_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Paper_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_175",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Flowers_04",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_80",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.PAPER_3,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_175", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Flowers_04",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_80",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.PAPER_3,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

-- SC-117507 Награды Марафон по PvE “Утечка мозгов”
Def.Bundle_Brawl_Brains_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Brains_reward1_name",
	uiDesc				= "Bundle_Brawl_Brains_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Brains_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_186",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Polygon_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_149",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BRAINS_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_186", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Polygon_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_149",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BRAINS_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_Brains_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Brains_reward2_name",
	uiDesc				= "Bundle_Brawl_Brains_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Brains_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_187",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Circles_04",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_150",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BRAINS_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_187", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Circles_04",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_150",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BRAINS_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Brains_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Brains_reward3_name",
	uiDesc				= "Bundle_Brawl_Brains_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Brains_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_188",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Circles_05",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_151",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BRAINS_3,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_188", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Circles_05",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_151",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BRAINS_3,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

-- SC-117436 Новый набор на 1 апреля 2023
Def.Bundle_April1_2023 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 2900,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April1_2023_name",
    uiDesc              = "Bundle_April1_2023_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
	    {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Dino_01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "DinoToy", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_5", },
        },
    },

    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Dino_01", price_weight = 0.15, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "DinoToy", price_weight = 0.15, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_1", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_2", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_3", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_4", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2023_5", price_weight = 0.14, },
    },
}

-- SC-117554 Награды Марафон по потасовке "Близкий контакт"
Def.Bundle_Brawl_Encounter_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Encounter_reward1_name",
	uiDesc				= "Bundle_Brawl_Encounter_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Encounter_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_189",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Curves_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_152",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.ENCOUNTER_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_189", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Curves_01",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_152",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.ENCOUNTER_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_Encounter_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Encounter_reward2_name",
	uiDesc				= "Bundle_Brawl_Encounter_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Encounter_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_190",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Pyramids03",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_153",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.ENCOUNTER_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_190", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Pyramids03",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_153",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.ENCOUNTER_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Encounter_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Encounter_reward3_name",
	uiDesc				= "Bundle_Brawl_Encounter_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Encounter_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_191",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Polygon_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_154",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.ENCOUNTER_3,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_191", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Polygon_02",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_154",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.ENCOUNTER_3,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

-- SC-117438 Новый набор на 12 апреля 2023
Def.Bundle_April_12_2023 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 2900,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April_12_2023_name",
    uiDesc              = "Bundle_April_12_2023_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
	    {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Stars_04", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Space_day_2023", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_5", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_6", },
        },
    },

    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Stars_04", price_weight = 0.13, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Space_day_2023", price_weight = 0.13, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_1", price_weight = 0.13, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_2", price_weight = 0.13, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_3", price_weight = 0.12, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_4", price_weight = 0.12, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_5", price_weight = 0.12, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2023_6", price_weight = 0.12, },
    },
}

-- SC-117623 Награды за Марафон PvE миссия "Огневая поддержка"
Def.Bundle_Brawl_Support_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Support_reward1_name",
	uiDesc				= "Bundle_Brawl_Support_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Support_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_192",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Net_03",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_155",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.SUPPORT_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_192", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Net_03",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_155",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.SUPPORT_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_Support_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Support_reward2_name",
	uiDesc				= "Bundle_Brawl_Support_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Support_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_193",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Bubbles_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_156",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.SUPPORT_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_193", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Bubbles_02",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_156",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.SUPPORT_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Support_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Support_reward3_name",
	uiDesc				= "Bundle_Brawl_Support_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Support_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_194",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Curves_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_157",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.SUPPORT_3,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_194", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Curves_02",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_157",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.SUPPORT_3,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

-- SC-117629 Наборы на летний патч 2023
Def.Bundle_XenoEvent_Abyss1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Abyss1_name",
	uiDesc				= "Bundle_XenoEvent_Abyss1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Cocoon",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_204",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Eyes_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_81",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS3,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Cocoon",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_204", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP9_Eyes_02",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_81",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS3,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Abyss2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Abyss2_name",
	uiDesc				= "Bundle_XenoEvent_Abyss2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Anchor",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_205",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Spiral_1",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_82",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY21_1,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Anchor",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_205", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP9_Spiral_1", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_82",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY21_1,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Abyss3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Abyss3_name",
	uiDesc				= "Bundle_XenoEvent_Abyss3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Snorkel",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_206",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Loose_1",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_85",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY21_2,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Snorkel",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_206", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP9_Loose_1", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_85",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY21_2,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Abyss4  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Abyss4_name",
	uiDesc				= "Bundle_XenoEvent_Abyss4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Eye",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_207",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Levels_3",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_86",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SUM21_2,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Eye",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_207", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP9_Levels_3", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_86",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SUM21_2,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints9  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints9_name",
	uiDesc				= "Bundle_XenoEvent_Paints9_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Matt_Scary_Red",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Matt_Scary_Khaki",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Matt_Scary_Violet",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Matt_Scary_Violet2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Matt_Scary_Black",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP9_Matt_Scary_Red", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP9_Matt_Scary_Khaki", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP9_Matt_Scary_Violet", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP9_Matt_Scary_Violet2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP9_Matt_Scary_Black", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers9 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers9_name",
	uiDesc				= "Bundle_XenoEvent_Stickers9_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_1",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_5", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_1", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_2", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_3", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_4", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_5", price_weight = 0.20, },
    },
}

-- Summer 2023 марафон
Def.Bundle_Summer_2023_1 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_1_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Summer_2023_1",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "SummerExp15", price_weight = 0.20, },
    },
}

Def.Bundle_Summer_2023_2 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_2_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Summer_2023_2",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM,			 amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 40, str_param = "Iridium_monocrystall", },
    },
}

Def.Bundle_Summer_2023_3 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_3_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Summer_2023_3",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.AUTOGEN, amount = 2, str_param = "DOUBLE", int_param = 17},
    },
}

Def.Bundle_Summer_2023_4 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_4_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Summer_2023_4",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "SummerCredits15", price_weight = 0.20,},
    },
}

Def.Bundle_Summer_2023_5 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_5_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Summer_2023_5",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 			amount = 1,  int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 40, str_param = "Aliens_ship_part", },
    },
}

Def.Bundle_Summer_2023_7 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_7_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Summer_2023_7",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "SummerLootAttempts15", price_weight = 0.20,},
    },
}

Def.Bundle_Summer_2023_Final =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Summer_2023_FINAL_name",
    uiDesc = "Bundle_Summer_2023_FINAL_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Summer_2023_FINAL",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 * 7 },
		{ type = ai.BundleContent.TITLE, amount = 1,		int_param = PlayerTitleId.SPACE_THUNDERSTORM, price_weight = 0.20,},
    },
}

Def.Bundle_Ariadna =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Ariadna_name",
	uiDesc				= "Bundle_Ariadna_desc",
	--cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Ariadna",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_1",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_5", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_1", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_2", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_3", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_4", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ariana_quest_5", price_weight = 0.20, },
    },
}
-- SC-117949 Награды за Марафон PVE “Всемером легче”
Def.Bundle_Brawl_Seven_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Seven_reward1_name",
	uiDesc				= "Bundle_Brawl_Seven_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Seven_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_199",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Waves_41",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_158",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY22_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_199", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Waves_41",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_158",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY22_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_Seven_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Seven_reward2_name",
	uiDesc				= "Bundle_Brawl_Seven_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Seven_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_201",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Thorn_012",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_159",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY22_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_201", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP8_Thorn_012",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_159",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY22_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Seven_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Seven_reward3_name",
	uiDesc				= "Bundle_Brawl_Seven_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Seven_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_202",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Rhombus_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_160",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SPR22_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_202", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP9_Rhombus_02",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_160",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SPR22_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}

-- Сундуки для купивших BattlePass_Elite в предыдущем сезоне/фазе (НАЧАЛО БЛОКА)

Def.Bundle_Elite_Donater_BP12_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP12_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP12_2_name",
    uiDesc = "Bundle_Elite_Donater_BP12_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP13_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP13_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP13_1_name",
    uiDesc = "Bundle_Elite_Donater_BP13_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP13_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP13_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP13_2_name",
    uiDesc = "Bundle_Elite_Donater_BP13_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP14_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP14_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP14_1_name",
    uiDesc = "Bundle_Elite_Donater_BP14_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP14_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP14_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP14_2_name",
    uiDesc = "Bundle_Elite_Donater_BP14_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP15_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP15_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP15_1_name",
    uiDesc = "Bundle_Elite_Donater_BP15_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP15_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP15_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP15_2_name",
    uiDesc = "Bundle_Elite_Donater_BP15_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP16_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP16_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP16_1_name",
    uiDesc = "Bundle_Elite_Donater_BP16_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP16_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP16_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP16_2_name",
    uiDesc = "Bundle_Elite_Donater_BP16_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP17_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP17_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP17_1_name",
    uiDesc = "Bundle_Elite_Donater_BP17_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP17_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP17_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP17_2_name",
    uiDesc = "Bundle_Elite_Donater_BP17_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP18_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP18_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP18_1_name",
    uiDesc = "Bundle_Elite_Donater_BP18_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP18_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP18_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP18_2_name",
    uiDesc = "Bundle_Elite_Donater_BP18_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP19_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP19_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP19_1_name",
    uiDesc = "Bundle_Elite_Donater_BP19_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP19_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP19_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP19_2_name",
    uiDesc = "Bundle_Elite_Donater_BP19_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP20_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP20_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP20_1_name",
    uiDesc = "Bundle_Elite_Donater_BP20_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP20_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP20_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP20_2_name",
    uiDesc = "Bundle_Elite_Donater_BP20_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP21_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP21_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP21_1_name",
    uiDesc = "Bundle_Elite_Donater_BP21_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP21_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP21_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP21_2_name",
    uiDesc = "Bundle_Elite_Donater_BP21_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP22_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP22_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP22_1_name",
    uiDesc = "Bundle_Elite_Donater_BP22_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP22_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP22_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP22_2_name",
    uiDesc = "Bundle_Elite_Donater_BP22_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP23_1 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP23_1",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP23_1_name",
    uiDesc = "Bundle_Elite_Donater_BP23_1_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

Def.Bundle_Elite_Donater_BP23_2 =
{
    inherit = "BundleBase",
    storeItemId = Bundles_GetNextStoreItemId(),

    premiumPrice = 999555,
	premiumPriceTotal = 999555,
    cant_be_bought = false,
	required_account_aura	= "Elite_Donater_BP23_2",
    cant_be_bought_on_event_credits_limit = true,

    uiName = "Bundle_Elite_Donater_BP23_2_name",
    uiDesc = "Bundle_Elite_Donater_BP23_2_desc",
    uiPromo = "bandle_35",
    default_icon = "dlcIco",

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, }, }, },

    random_contents = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 300, drop_weight = 1, }, }, },
}

-- Сундуки для купивших BattlePass_Elite в предыдущем сезоне/фазе (КОНЕЦ БЛОКА)

-- SC-118213 Награды за Марафон PvE миссия "Жук в муравейнике"!
Def.Bundle_Brawl_Miningstation_reward1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Miningstation_reward1_name",
	uiDesc				= "Bundle_Brawl_Miningstation_reward1_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Miningstation_reward1",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_208",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Lines_06",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_133",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SUM22_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_208", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP9_Lines_06",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_133",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SUM22_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Iridium_monocrystall", },
	},
}

Def.Bundle_Brawl_Miningstation_reward2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Miningstation_reward2_name",
	uiDesc				= "Bundle_Brawl_Miningstation_reward2_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Miningstation_reward2",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_211",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Net_05",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_134",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_AUT22_1,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_211", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP9_Net_05",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_134",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_AUT22_1,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 500, str_param = "Aliens_ship_part", },
	},
}

Def.Bundle_Brawl_Miningstation_reward3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 100000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Brawl_Miningstation_reward3_name",
	uiDesc				= "Bundle_Brawl_Miningstation_reward3_desc",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bonus		= true,
	required_account_aura   = "Brawl_Miningstation_reward3",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_212",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Net_04",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_135",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_AUT22_2,	},
			{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
		},
	},	
	fixed_contents = 
	{
		{ type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_212", 				price_weight = 0.3, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP9_Net_04",	price_weight = 0.2, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_135",					price_weight = 0.2, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_AUT22_2,	price_weight = 0.2, },
		{ type = ai.BundleContent.CRAFT_RESOURCE, amount = 300, str_param = "Aliens_ship_part", },
	},
}
-- SC-117984 Наборы на осенний патч 2023
Def.Bundle_XenoEvent_Autumn1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Autumn1_name",
	uiDesc				= "Bundle_XenoEvent_Autumn1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Plexus",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_213",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Levels_4",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_136",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS1,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Plexus",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_213", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP9_Levels_4",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_136",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS1,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Autumn2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Autumn2_name",
	uiDesc				= "Bundle_XenoEvent_Autumn2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Chained",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_214",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Stratum_04",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_137",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS2,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Chained",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_214", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP10_Stratum_04", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_137",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS2,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Autumn3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Autumn3_name",
	uiDesc				= "Bundle_XenoEvent_Autumn3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Covered",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_215",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Stratum_05",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_138",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS4,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Covered",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_215", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP10_Stratum_05", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_138",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS4,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Autumn4  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Autumn4_name",
	uiDesc				= "Bundle_XenoEvent_Autumn4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Stooge",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_218",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Stratum_06",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_165",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS6,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Stooge",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_218", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP10_Stratum_06", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_165",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS6,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints10  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints10_name",
	uiDesc				= "Bundle_XenoEvent_Paints10_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Dawning_Red",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Dawning_Blue",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "Matt_Dawning_White",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Matt_Deep_Blue2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP8_Matt_Deep_Black1",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Dawning_Red", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Dawning_Blue", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Matt_Dawning_White", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP8_Matt_Deep_Blue2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP8_Matt_Deep_Black1", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers10 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers10_name",
	uiDesc				= "Bundle_XenoEvent_Stickers10_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_8",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_9", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_10", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_11", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_12", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_8", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_9", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_10", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_11", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_12", price_weight = 0.20, },
    },
}

-- SC-118325 Наборы на зимний  патч 2023
Def.Bundle_XenoEvent_legacy1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_legacy1_name",
	uiDesc				= "Bundle_XenoEvent_legacy1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Nautilus",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_219",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Candy_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_98",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY23_1,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Nautilus",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_219", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP10_Candy_01",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_98",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY23_1,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_legacy2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_legacy2_name",
	uiDesc				= "Bundle_XenoEvent_legacy2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Feather",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_220",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Snowflake_01_1",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_99",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY23_2,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Feather",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_220", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP10_Snowflake_01_1", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_99",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_NY23_2,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_legacy3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_legacy3_name",
	uiDesc				= "Bundle_XenoEvent_legacy3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Tree",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_221",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Cat_01_1",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_100",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SUM21_1,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Tree",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_221", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP10_Cat_01_1", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_100",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SUM21_1,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_legacy4  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_legacy4_name",
	uiDesc				= "Bundle_XenoEvent_legacy4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Icicle",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_222",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Needles_01_1",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_101",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.EXECUTOR,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Icicle",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_222", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP10_Needles_01_1", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_101",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.EXECUTOR,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints11  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints11_name",
	uiDesc				= "Bundle_XenoEvent_Paints11_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Matt_Scary_Green",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Matt_Entrancing_Green",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Matt_Entrancing_Gray",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Matt_Entrancing_Gold",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP9_Matt_Scary_Violet2",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP9_Matt_Scary_Green", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP10_Matt_Entrancing_Green", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP10_Matt_Entrancing_Gray", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP10_Matt_Entrancing_Gold", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP9_Matt_Scary_Violet2", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers11 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers11_name",
	uiDesc				= "Bundle_XenoEvent_Stickers11_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_13",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_14", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_15", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_16", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_17", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_13", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_14", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_15", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_16", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass6_17", price_weight = 0.20, },
    },
}

-- SC-118530 Сундук Праздничный набор №12 к ДР игры

Def.Bundle_Event_Birthday2024 =
{
    inherit				= "BundleBase",
    premiumPrice		= 100,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_Event_Birthday2024_name",
    uiDesc				= "Bundle_Event_Birthday2024_desc",
    cant_be_bought  	= true,
    uiPromo				= "bandle_40",
    default_icon    	= "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_3", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_4", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_5", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_6", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Preset_Birthday_2024_1", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_1", price_weight = 0.14, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_2", price_weight = 0.14, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_3", price_weight = 0.14, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_4", price_weight = 0.14, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_5", price_weight = 0.14, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2024_6", price_weight = 0.14, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Preset_Birthday_2024_1", price_weight = 0.16, },
    },
}

-- SC-118604 Наборы на весенний патч 2024
Def.Bundle_XenoEvent_Leap1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Leap1_name",
	uiDesc				= "Bundle_XenoEvent_Leap1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Last_Phase",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_224",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP11_Pattern_03",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_108",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.NY2019,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Last_Phase",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_224", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP11_Pattern_03",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_108",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.NY2019,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Leap2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Leap2_name",
	uiDesc				= "Bundle_XenoEvent_Leap2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Polaris",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_225",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP11_Pattern_04",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_109",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_20_1,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Polaris",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_225", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP11_Pattern_04", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_109",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_20_1,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Leap3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Leap3_name",
	uiDesc				= "Bundle_XenoEvent_Leap3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Malachite",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_226",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP11_Pattern_06",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_110",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_20_2,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Malachite",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_226", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP11_Pattern_06", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_110",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_20_2,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Leap4  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Leap4_name",
	uiDesc				= "Bundle_XenoEvent_Leap4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Pteryx",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_227",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP11_Triangles_5",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_111",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.GENTLEMAN_OF_FORTUNE,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Pteryx",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_227", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP11_Triangles_5", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_111",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.GENTLEMAN_OF_FORTUNE,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints12  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints12_name",
	uiDesc				= "Bundle_XenoEvent_Paints12_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP10_Matt_Entrancing_Green2",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP11_Matt_Dino_Green",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP11_Matt_Dino_Khaki",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP11_Matt_Dino_Turquoise",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP11_Matt_Dino_Blue",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP10_Matt_Entrancing_Green2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP11_Matt_Dino_Green", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP11_Matt_Dino_Khaki", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP11_Matt_Dino_Turquoise", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP11_Matt_Dino_Blue", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers12 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers12_name",
	uiDesc				= "Bundle_XenoEvent_Stickers12_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_1",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_5", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_1", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_2", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_3", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_4", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_5", price_weight = 0.20, },
    },
}

-- Сундук на день Святого Валентина 2024

Def.Bundle_February_14_2024 =
{
    inherit        = "BundleBase",
    premiumPrice   = 3000,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_February_14_2024_name",
    uiDesc         = "Bundle_February_14_2024_desc",
    cant_be_bought = true,
    uiPromo        = "Bundle_ShipActivateQuest1_T5",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_5", },
        },
--[[        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb14_03", },
        },]]
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_3", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_4", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2024_5", price_weight = 0.2, },
--		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Feb14_03",	  price_weight = 0.20, },
    },
}

-- SC-118753 Набор на День Космонавтики 2024.
Def.Bundle_April_12_2024 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 2900,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April_12_2024_name",
    uiDesc              = "Bundle_April_12_2024_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content = 
    {
	    {
 			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Solar_System_2024", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_5", },
        },
    },

    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Solar_System_2024", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_1", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_2", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_3", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_4", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2024_5", price_weight = 0.16, },
    },
}

-- SC-118971 Наборы на летний патч 2024
Def.Bundle_XenoEvent_UnknownHorizons1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_UnknownHorizons1_name",
	uiDesc				= "Bundle_XenoEvent_UnknownHorizons1_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Crest",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_232",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP12_Jewelry_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_165",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SPR22_2,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,		amount = 1, str_param = "Crest",			price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		 	 	amount = 1, str_param = "Avatar_232", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP12_Jewelry_01",	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_165",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SPR22_2,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_UnknownHorizons2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_UnknownHorizons2_name",
	uiDesc				= "Bundle_XenoEvent_UnknownHorizons2_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Spines",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_233",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP12_Skull_01",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_166",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SPR23_1,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Spines",				price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_233", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP12_Skull_01", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_166",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SPR23_1,	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 			price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_UnknownHorizons3  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_UnknownHorizons3_name",
	uiDesc				= "Bundle_XenoEvent_UnknownHorizons3_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Dome",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_234",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP12_Jewelry_02",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_167",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SUM23_1,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassCredits30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Dome",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_234", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP12_Jewelry_02", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_167",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_SUM23_1,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassCredits30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_UnknownHorizons4  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_UnknownHorizons4_name",
	uiDesc				= "Bundle_XenoEvent_UnknownHorizons4_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Paw",	},
			{ type = ai.BundleContent.AVATAR,			amount = 1,	str_param = "Avatar_235",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP12_Jewelry_03",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_168",	},
			{ type = ai.BundleContent.TITLE,			amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_AUT23_1,	},
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,	str_param = "BattlePassExp30",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Paw",					price_weight = 0.2, },
        { type = ai.BundleContent.AVATAR, 		  		amount = 1, str_param = "Avatar_235", 				price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "BP12_Jewelry_03", 	price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_168",					price_weight = 0.1, },
		{ type = ai.BundleContent.TITLE,				amount = 1,	int_param = PlayerTitleId.BATTLE_PASS_AUT23_1,		price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA, 		amount = 1, str_param = "BattlePassExp30", 		price_weight = 0.3, },
    },
}

Def.Bundle_XenoEvent_Paints13  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints13_name",
	uiDesc				= "Bundle_XenoEvent_Paints13_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP13_Matt_Muertos_Brown1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP13_Matt_Muertos_Orange1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP13_Matt_Muertos_Gold1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP13_Matt_Muertos_Gray1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP13_Matt_Muertos_Gray2",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP13_Matt_Muertos_Brown1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP13_Matt_Muertos_Orange1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP13_Matt_Muertos_Gold1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP13_Matt_Muertos_Gray1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP13_Matt_Muertos_Gray2", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers13 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers13_name",
	uiDesc				= "Bundle_XenoEvent_Stickers13_desc",
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_16",	},
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_17", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_18", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_19", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_20", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_16", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_17", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_18", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_19", price_weight = 0.20, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass7_20", price_weight = 0.20, },
    },
}

-- Сундуки для SC-119028 Марафон заданий в ОМ: "Мал клоп - да могуч". SUM24. (начало блока) 
Def.Bundle_OWFest_24_1 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_1_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_OWFest_24_1",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "OWFestExp15", price_weight = 0.20, },
    },
}

Def.Bundle_OWFest_24_2 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_2_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_OWFest_24_2",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM,			 amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 40, str_param = "Iridium_monocrystall", },
    },
}

Def.Bundle_OWFest_24_3 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_3_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_OWFest_24_3",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.AUTOGEN, amount = 2, str_param = "DOUBLE", int_param = 17},
    },
}

Def.Bundle_OWFest_24_4 = 
{
    inherit = "BundleBase",
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_4_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_OWFest_24_4",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "OWFestCredits15", price_weight = 0.20,},
    },
}

Def.Bundle_OWFest_24_5 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_5_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_OWFest_24_5",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 			amount = 1,  int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 40, str_param = "Aliens_ship_part", },
    },
}

Def.Bundle_OWFest_24_7 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_7_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_OWFest_24_7",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "OWFestLootAttempts15", price_weight = 0.20,},
    },
}

Def.Bundle_OWFest_24_Final =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_OWFest_24_FINAL_name",
    uiDesc = "Bundle_OWFest_24_FINAL_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_OWFest_24_FINAL",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 * 7 },
		{ type = ai.BundleContent.TITLE, amount = 1,		int_param = PlayerTitleId.OWFEST_24, price_weight = 0.33,}, -- титул "Мастер Клопп"
		{ type = ai.BundleContent.VESSEL, amount = 1,		str_param = "Ship_Race2_M_T3_Steam",	price_weight = 0.34, }, -- Штурмовик Командный Иерихон Dragonfly, 9 ранг
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_5", price_weight = 0.33, },
		
    },
}

Def.Bundle_OW2Destroyer  = -- Сундук для доп.квеста "Разрушитель Эсминца" к Марафону заданий в ОМ: "Мал клоп - да могуч". SUM24.
{
	inherit				= "BundleBase",
	premiumPrice 		= 999999,
	premiumPriceTotal	= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_OW2Destroyer_name",
    uiDesc 				= "Bundle_OW2Destroyer_desc",
	uiPromo 			= "bandle_47", -- сундук Империи или выбрать свой
	default_icon		= "dlcIco", 
    --cant_be_bought 		= true, -- удалить или закомментировать всю строку когда решим запускать	
	cant_be_bonus		= true,	
	required_account_aura   = "OW2Destroyer_Revard",

    ui_content = 
    {
        {
            --{ type = ai.BundleContent.VESSEL, amount = 1, str_param = "Ship_Race1_H_T4", is_elite = true, }, -- Эсминец Brave
        },	
        {
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Weapon_RailgunDestr_T3_Mk1", }, -- Рельсотрон 7-11
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_RocketSilo_T3_Mk1", }, -- Пусковая установка Буря 7-11			
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_GravityAnomaly_T3_Mk1", },	-- Гравитационная линза 7-11
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_TurretPlasma_T3_Mk1", },	-- Плазменная турель 7-11
			--{ type = ai.BundleContent.ITEM, amount = 1, str_param = "Module_Teleporter_T4_Mk1", },	-- Проектор червоточин 10-14			
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_Laser_Huge_Killer", }, -- Система линз
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_Plasma_Huge_Killer", }, -- Усиленные заряды
			{ type = ai.BundleContent.ITEM, amount = 5, str_param = "WeaponMod_Rail_Huge_Killer", }, -- Бронебойные снаряды
	
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
		--{ type = ai.BundleContent.VESSEL,	amount = 1,		str_param = "Ship_Race1_H_T4",	price_weight = 0.5, }, -- Эсминец Brave
		--{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Weapon_RailgunDestr_T3_Mk1",	price_weight = 0.1, }, -- Рельсотрон 7-11
		--{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_RocketSilo_T3_Mk1",	price_weight = 0.1, }, -- Пусковая установка Буря 7-11		
		--{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_GravityAnomaly_T3_Mk1",	price_weight = 0.1, }, -- Гравитационная линза 7-11		
		--{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_TurretPlasma_T3_Mk1",	price_weight = 0.1, }, -- Плазменная турель 7-11		
		--{ type = ai.BundleContent.ITEM,		amount = 1,	str_param = "Module_Teleporter_T4_Mk1",	price_weight = 0.1, }, -- Проектор червоточин 10-14		
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "WeaponMod_Laser_Huge_Killer",	price_weight = 0.34, }, -- Система линз
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "WeaponMod_Plasma_Huge_Killer",	price_weight = 0.33, }, -- Усиленные заряды
		{ type = ai.BundleContent.ITEM,		amount = 5,	str_param = "WeaponMod_Rail_Huge_Killer",	price_weight = 0.33, }, -- Бронебойные снаряды

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
-- Сундуки для SC-119028 Марафон заданий в ОМ: "Мал клоп - да могуч". SUM24. (конец блока)

-- Сундуки для для SC-118693 «Стойкий Оловяный Пилотик». Фестиваль заданий в честь 10 лет. (начало блока) 
Def.Bundle_Tin10_1 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_1_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Tin10_1",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "OWFestExp15", price_weight = 0.20, },
    },
}

Def.Bundle_Tin10_2 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_2_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Tin10_2",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM,			 amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50, str_param = "Iridium_monocrystall", },
    },
}

Def.Bundle_Tin10_3 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_3_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Tin10_3",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.AUTOGEN, amount = 2, str_param = "DOUBLE", int_param = 17},
    },
}

Def.Bundle_Tin10_4 = 
{
    inherit = "BundleBase",
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_4_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Tin10_4",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Tin10Credits15", price_weight = 0.20,},
    },
}

Def.Bundle_Tin10_5 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_5_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Tin10_5",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 			amount = 1,  int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.CRAFT_RESOURCE,	amount = 50, str_param = "Aliens_ship_part", },
    },
}

Def.Bundle_Tin10_7 = 
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_7_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Tin10_7",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 },
		{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "Tin10LootAttempts15", price_weight = 0.20,},
    },
}

Def.Bundle_Tin10_Final =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Tin10_FINAL_name",
    uiDesc = "Bundle_Tin10_FINAL_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Tin10_FINAL",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 * 7 },
		{ type = ai.BundleContent.TITLE, amount = 1,		int_param = PlayerTitleId.TIN10, price_weight = 0.25,}, -- титул "Стойкий стальной пилотик"
		{ type = ai.BundleContent.VESSEL, amount = 1,		str_param = "Ship_Race1_S_T2_Steam",	price_weight = 0.25, }, -- Премиальный Перехватчик разведки империи Wasp, 13 ранг
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "R10_Release10",	price_weight = 0.25, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "R10_Release102",	price_weight = 0.25, },
		
    },
}
-- Сундуки для для SC-118693 «Стойкий Оловяный Пилотик». Фестиваль заданий в честь 10 лет. (конец блока) 
--
-- Сундуки для SC-119946 «Стойкий Стальной Пилотик». Фестиваль заданий в честь 11 лет Игры. (начало блока) 

Def.Bundle_Tin11_Final =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Tin11_FINAL_name",
    uiDesc = "Bundle_Tin11_FINAL_desc",
    uiPromo 			= "Bundle_ShipActivateQuest1_T5",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_Tin11_FINAL",

    fixed_contents = 
    {
		{ type = ai.BundleContent.PREMIUM, 		amount = 1, int_param = 60 * 60 * 24 * 7 }, -- Премиум на 7 дней
		{ type = ai.BundleContent.TITLE, amount = 1,		int_param = PlayerTitleId.TIN11, price_weight = 0.25,}, -- титул "Стойкий оловянный пилотик"
		{ type = ai.BundleContent.VESSEL, amount = 1,		str_param = "Ship_Race2_L_T3_Dlc",	price_weight = 0.25, }, -- Премиальный фрегат дальнобойный Иерихона «Langsax», 8 ранг 
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP13_DarkSigns_04",	price_weight = 0.25, }, -- Покраска «Тёмная звезда»
		{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP13_Skull_02",	price_weight = 0.25, }, -- Покраска «Кавалер Риверы»
		
    },
}

-- Сундуки для SC-119946 «Стойкий Стальной Пилотик». Фестиваль заданий в честь 11 лет Игры. (конец блока) 


-- SC-118698 Торжественный набор №10: Сундук на 10 лет релиза. (2-11 сентября)

Def.Bundle_Stickers_Game_10_Years_2024 = -- Торжественный набор №10
{
    inherit				= "BundleBase",
    premiumPrice		= 100,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_Stickers_Game_10_Years_2024_name",
    uiDesc				= "Bundle_Stickers_Game_10_Years_2024_desc",
    cant_be_bought  	= true,
    uiPromo				= "bandle_40",
    default_icon    	= "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_3", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_4", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_5", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Release_Release10", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_1", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_2", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_3", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_4", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "10_years_release_5", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Release_Release10", price_weight = 0.20, },
    },
}

-- Наборы на осенний БП 2024 (1 фаза)

Def.Bundle_XenoEvent_HearthofDarkness1  = 
{
	inherit			= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId		= Bundles_GetNextStoreItemId(),
	uiName			= "Bundle_XenoEvent_HearthofDarkness1_name", -- Набор Реджинальда
	uiDesc			= "Bundle_XenoEvent_HearthofDarkness1_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 		= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "battle_pass7_7",       	 },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "battle_pass7_10",      	 },
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "battle_pass7_11",      	 },
            { type = ai.BundleContent.AVATAR,			amount = 1, str_param = "Avatar_240",           	 },
			{ type = ai.BundleContent.MOTTO,			amount = 1, str_param = "Taunt_112",            	 },
			{ type = ai.BundleContent.TITLE,			amount = 1, int_param = PlayerTitleId.HALLOWEEN_2023,},
            { type = ai.BundleContent.ACCOUNT_AURA,	    amount = 1, str_param = "BattlePassExp30",		     },
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "battle_pass7_7",				price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "battle_pass7_10", 				price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "battle_pass7_11",	        	price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,			amount = 1, str_param = "Avatar_240",    	        	price_weight = 0.1, },
		{ type = ai.BundleContent.MOTTO,			amount = 1, str_param = "Taunt_112",	                price_weight = 0.2, },
        { type = ai.BundleContent.TITLE,			amount = 1, int_param = PlayerTitleId.HALLOWEEN_2023, 	price_weight = 0.2, },
        { type = ai.BundleContent.ACCOUNT_AURA,	    amount = 1, str_param = "BattlePassExp30",				price_weight = 0.2, },
    }
}

Def.Bundle_XenoEvent_HearthofDarkness2  = 
{
	inherit			= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId		= Bundles_GetNextStoreItemId(),
	uiName			= "Bundle_XenoEvent_HearthofDarkness2_name", -- Заначка Лоэра
	uiDesc			= "Bundle_XenoEvent_HearthofDarkness2_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 		= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "BP14_Matt_Chinese_Green01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Death_Drum",          		 },
            { type = ai.BundleContent.AVATAR,			amount = 1, str_param = "Avatar_253",           	 },
			{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1, str_param = "BattlePassCredits30",  	 },
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "BP14_Matt_Chinese_Green01",	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Death_Drum", 		        	price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,			amount = 1, str_param = "Avatar_253",    	        	price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA,		amount = 1, str_param = "BattlePassCredits30",			price_weight = 0.6, },
    }
}


Def.Bundle_XenoEvent_HearthofDarkness3  = 
{
	inherit			= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId		= Bundles_GetNextStoreItemId(),
	uiName			= "Bundle_XenoEvent_HearthofDarkness3_name", -- Путь генерала
	uiDesc			= "Bundle_XenoEvent_HearthofDarkness3_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 		= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "Spheres_Chinese",      },
            { type = ai.BundleContent.AVATAR,			amount = 1, str_param = "Avatar_269",           },
			{ type = ai.BundleContent.MOTTO,			amount = 1, str_param = "Taunt_170",            },
			{ type = ai.BundleContent.TITLE,			amount = 1, int_param = PlayerTitleId.TEMPLE_2, },
            { type = ai.BundleContent.ACCOUNT_AURA,	    amount = 1, str_param = "BattlePassExp30",		},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Spheres_Chinese",       price_weight = 0.1,},
        { type = ai.BundleContent.AVATAR,         amount = 1, str_param = "Avatar_269",            price_weight = 0.1,},
		{ type = ai.BundleContent.MOTTO,          amount = 1, str_param = "Taunt_170",             price_weight = 0.2,},
		{ type = ai.BundleContent.TITLE,          amount = 1, int_param = PlayerTitleId.TEMPLE_2,  price_weight = 0.2,},
        { type = ai.BundleContent.ACCOUNT_AURA,	  amount = 1, str_param = "BattlePassExp30",	   price_weight = 0.4,},

    }
}

Def.Bundle_XenoEvent_Paints14  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints14_name", -- Набор переливающийся 14
	uiDesc				= "Bundle_XenoEvent_Paints14_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP12_Matt_Crime_Brown",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP13_Matt_Muertos_Green1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP14_Matt_Chinese_Green02",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP14_Matt_Chinese_White01",},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP15_Matt_Science_Blue2",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP12_Matt_Crime_Brown", 		price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP13_Matt_Muertos_Green1", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP14_Matt_Chinese_Green02", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP14_Matt_Chinese_White01", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP15_Matt_Science_Blue2", 	price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers14 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers14_name", -- Набор наклеек 14
	uiDesc				= "Bundle_XenoEvent_Stickers14_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_13", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_14", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_15", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_16", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_17", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_13", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_14", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_15", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_16", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass8_17", price_weight = 0.2, },
    },
}

-- Наборы на осенний БП 2024 (2 фаза)

Def.Bundle_XenoEvent_HearthofDarkness4  = 
{
        inherit                    = "BundleBase",
        premiumPrice               = 7500,
        storeItemId                = Bundles_GetNextStoreItemId(),
        uiName                     = "Bundle_XenoEvent_HearthofDarkness4_name", -- Посмотрите на Ву
        uiDesc                     = "Bundle_XenoEvent_HearthofDarkness4_desc", -- Содержит все предметы из списка.
        cant_be_bought             = true,
        uiPromo                    = "bandle_11",
        default_icon               = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass7_13",       	 },
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass8_8",      	 },
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass8_10",     	 },
                        { type = ai.BundleContent.AVATAR,                amount = 1, str_param = "Avatar_244",          	 },
                        { type = ai.BundleContent.MOTTO,                 amount = 1, str_param = "Taunt_189",           	 },
                        { type = ai.BundleContent.TITLE,                 amount = 1, int_param = PlayerTitleId.COSMIC_HORROR,},
                        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30", 	 },
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass7_13",                price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass8_8",                price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass8_10",               price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,      			 amount = 1, str_param = "Avatar_244",                    price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO,                 amount = 1, str_param = "Taunt_189",                     price_weight = 0.2, },
        { type = ai.BundleContent.TITLE,                 amount = 1, int_param = PlayerTitleId.COSMIC_HORROR,     price_weight = 0.2, },
        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30",           price_weight = 0.2, },
    }
}

Def.Bundle_XenoEvent_HearthofDarkness5  = 
{
        inherit                        = "BundleBase",
        premiumPrice                   = 7500,
        storeItemId             	   = Bundles_GetNextStoreItemId(),
        uiName                         = "Bundle_XenoEvent_HearthofDarkness5_name", -- Сила Поршня
        uiDesc                         = "Bundle_XenoEvent_HearthofDarkness5_desc", -- Содержит все предметы из списка.
        cant_be_bought                 = true,
        uiPromo                 	   = "bandle_11",
        default_icon                   = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP13_DarkSigns_01",    },
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "Saint_Head",           },
                        { type = ai.BundleContent.AVATAR,                amount = 1, str_param = "Avatar_245",           },
                        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30",  },
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP13_DarkSigns_01",             price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "Saint_Head",                    price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,      amount = 1, str_param = "Avatar_245",                    price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30",           price_weight = 0.6, },
    }
}

Def.Bundle_XenoEvent_HearthofDarkness6  = 
{
        inherit                        = "BundleBase",
        premiumPrice                   = 7500,
        storeItemId                	   = Bundles_GetNextStoreItemId(),
        uiName                         = "Bundle_XenoEvent_HearthofDarkness6_name", -- Кости Эмилии
        uiDesc                         = "Bundle_XenoEvent_HearthofDarkness6_desc", -- Содержит все предметы из списка.
        cant_be_bought                 = true,
        uiPromo                 	   = "bandle_11",
        default_icon                   = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,       amount = 1, str_param = "Death_Flower",      	},
                        { type = ai.BundleContent.AVATAR,               amount = 1, str_param = "Avatar_257",           },
                        { type = ai.BundleContent.MOTTO,                amount = 1, str_param = "Taunt_190",            },
                        { type = ai.BundleContent.TITLE,                amount = 1, int_param = PlayerTitleId.MAZE_1, 	},
                        { type = ai.BundleContent.ACCOUNT_AURA,         amount = 1, str_param = "BattlePassCredits30",  },
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Death_Flower",          price_weight = 0.1,},
        { type = ai.BundleContent.AVATAR,         amount = 1, str_param = "Avatar_257",            price_weight = 0.1,},
        { type = ai.BundleContent.MOTTO,          amount = 1, str_param = "Taunt_190",             price_weight = 0.2,},
        { type = ai.BundleContent.TITLE,          amount = 1, int_param = PlayerTitleId.MAZE_1,    price_weight = 0.2,},
        { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "BattlePassCredits30",   price_weight = 0.4,},

    }
}
Def.Bundle_XenoEvent_Paints15  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints15_name", -- Набор переливающийся 15
	uiDesc				= "Bundle_XenoEvent_Paints15_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP15_Matt_Science_Green1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP15_Matt_Science_Blue1",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP15_Matt_BP15_Navyblue",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP15_Matt_BP15_Red",		},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP15_Matt_BP15_Yellow",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP15_Matt_Science_Green1", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP15_Matt_Science_Blue1", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP15_Matt_BP15_Navyblue", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP15_Matt_BP15_Red", 		price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP15_Matt_BP15_Yellow", 		price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers15 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers15_name", -- Набор наклеек 15
	uiDesc				= "Bundle_XenoEvent_Stickers15_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_5", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_3", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_4", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass9_5", price_weight = 0.2, },
    },
}

Def.Bundle_Halloween2024 =
{
    inherit = "BundleBase",
    premiumPrice = 666,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_Halloween2024_name", -- Halloween 2024
    uiDesc = "Bundle_Halloween2024_desc", -- -- Содержит все предметы из списка.
    cant_be_bought = true,
    uiPromo = "Bundle_Halloween2018_promo",
    default_icon = "dlcIco",

    ui_content =
    {
		{
            { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "HalloweenBoost",  },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_1", }, 
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_5", },
        },
    },

    fixed_contents =
    {
		{ type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "HalloweenBoost",  price_weight = 0.30, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_1", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_2", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_3", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_4", price_weight = 0.14, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "halloween2024_5", price_weight = 0.14, },
    },
}

-- SC-119521 СК. Раздать игрокам подарки на китайский НГ 29.01 (сундук "Год змеи 2025") НАЧАЛО БЛОКА

Def.Bundle_ChinaNY_2025 =
{
    inherit = "BundleBase",
    premiumPrice = 1000000000,
    storeItemId = Bundles_GetNextStoreItemId(),
    uiName = "Bundle_ChinaNY_2025_name",
    uiDesc = "Bundle_ChinaNY_2025_desc",
    uiPromo 			= "bandle_19",
	default_icon		= "dlcIco",
    required_account_aura = "Bundle_ChinaNY_2025",

    ui_content =
    {
		{
            { type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "BP14_Umbrella", }, 
            { type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "BP14_ChineseClouds_01_1", },
            { type = ai.BundleContent.AVATAR, 			amount = 1, str_param = "Avatar_269", },
        },
    },

    fixed_contents = 
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1, str_param = "BP14_Umbrella", price_weight = 0.34, }, -- декор "Солнечная батарейка"
        { type = ai.BundleContent.CUSTOM_ELEMENT, 	amount = 1, str_param = "BP14_ChineseClouds_01_1", price_weight = 0.33, }, -- покраска - "Золотой закат"
        { type = ai.BundleContent.AVATAR,			amount = 1, str_param = "Avatar_269", price_weight = 0.33, }, -- аватар "Железный генерал"
    },
}

-- SC-119521 СК. Раздать игрокам подарки на китайский НГ 29.01 (сундук "Год змеи 2025") КОНЕЦ БЛОКА

-- SC-119601 Новые временные наборы во внутриигровом магазине

Def.Bundle_XenoEvent_Alliesandrivals1  = 
{
        inherit            = "BundleBase",
        premiumPrice       = 7500,
        storeItemId        = Bundles_GetNextStoreItemId(),
        uiName             = "Bundle_XenoEvent_Alliesandrivals1_name", -- Роботизированый набор
        uiDesc             = "Bundle_XenoEvent_Alliesandrivals1_desc", -- Содержит все предметы из списка.
        cant_be_bought     = true,
        uiPromo            = "bandle_11",
        default_icon       = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass17_4",      },
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass17_6",      },
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass17_11",     },
                        { type = ai.BundleContent.AVATAR,                amount = 1, str_param = "Avatar_309",           },
                        { type = ai.BundleContent.MOTTO,                 amount = 1, str_param = "Taunt_297",            },
                        { type = ai.BundleContent.TITLE,                 amount = 1, int_param = PlayerTitleId.SUPPORT_2,},
                        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassExp30",      },
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass17_4",               price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass17_6",               price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass17_11",              price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,      			 amount = 1, str_param = "Avatar_309",                    price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO,                 amount = 1, str_param = "Taunt_297",                     price_weight = 0.2, },
        { type = ai.BundleContent.TITLE,                 amount = 1, int_param = PlayerTitleId.SUPPORT_2,         price_weight = 0.2, },
        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassExp30",               price_weight = 0.2, },
    }
}

Def.Bundle_XenoEvent_Alliesandrivals2  = 
{
        inherit             = "BundleBase",
        premiumPrice        = 7500,
        storeItemId         = Bundles_GetNextStoreItemId(),
        uiName              = "Bundle_XenoEvent_Alliesandrivals2_name", -- Под куполом цирка
        uiDesc              = "Bundle_XenoEvent_Alliesandrivals2_desc", -- Содержит все предметы из списка.
        cant_be_bought      = true,
        uiPromo             = "bandle_11",
        default_icon        = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP16_Carnivalmadness", },
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP16_Trick",           },
                        { type = ai.BundleContent.AVATAR,                amount = 1, str_param = "Avatar_300",           },
                        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30",  },
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP16_Carnivalmadness",        price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP16_Trick",                  price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,      			 amount = 1, str_param = "Avatar_300",                  price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30",         price_weight = 0.6, },
    }
}


Def.Bundle_XenoEvent_Alliesandrivals3 = 
{
        inherit              = "BundleBase",
        premiumPrice         = 7500,
        storeItemId          = Bundles_GetNextStoreItemId(),
        uiName               = "Bundle_XenoEvent_Alliesandrivals3_name", -- Фантастические сущности
        uiDesc               = "Bundle_XenoEvent_Alliesandrivals3_desc", -- Содержит все предметы из списка.
        cant_be_bought       = true,
        uiPromo              = "bandle_11",
        default_icon         = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "Snowman",              },
                        { type = ai.BundleContent.AVATAR,                amount = 1, str_param = "Avatar_182",           },
                        { type = ai.BundleContent.MOTTO,                 amount = 1, str_param = "Taunt_281",            },
                        { type = ai.BundleContent.TITLE,                 amount = 1, int_param = PlayerTitleId.BATTLE_PASS_AUT24_2, },
                        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassExp30",      },
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Snowman",               price_weight = 0.1,},
        { type = ai.BundleContent.AVATAR,         amount = 1, str_param = "Avatar_182",            price_weight = 0.1,},
        { type = ai.BundleContent.MOTTO,          amount = 1, str_param = "Taunt_281",           price_weight = 0.2,},
        { type = ai.BundleContent.TITLE,          amount = 1, int_param = PlayerTitleId.BATTLE_PASS_AUT24_2,  price_weight = 0.2,},
        { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "BattlePassExp30",       price_weight = 0.4,},

    }
}

Def.Bundle_XenoEvent_Paints16  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints16_name", -- Набор переливающийся 16
	uiDesc				= "Bundle_XenoEvent_Paints16_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP16_Matt_Jacarta",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP16_Matt_Purplenavy",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP16_Matt_Paleviolet", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP17_Matt_DenimBlue",  },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP17_Matt_Emerald",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP16_Matt_Jacarta", 		price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP16_Matt_Purplenavy", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP16_Matt_Paleviolet", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP17_Matt_DenimBlue", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP17_Matt_Emerald", 	    price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers16 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers16_name", -- Набор наклеек 16
	uiDesc				= "Bundle_XenoEvent_Stickers16_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_5", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_3", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_4", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_5", price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Alliesandrivals4  = 
{
    inherit             = "BundleBase",
    premiumPrice        = 7500,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_XenoEvent_Alliesandrivals4_name", -- Убойная парочка 1
    uiDesc              = "Bundle_XenoEvent_Alliesandrivals4_desc", -- Содержит все предметы из списка.
    cant_be_bought      = true,
    uiPromo             = "bandle_11",
    default_icon        = "dlcIco",
    
    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass12_8",                 },
            { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass12_9",                 },
            { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass12_11",                },
            { type = ai.BundleContent.AVATAR,                amount = 1, str_param = "Avatar_248",                      },
            { type = ai.BundleContent.MOTTO,                 amount = 1, str_param = "Taunt_168",                       },
            { type = ai.BundleContent.TITLE,                 amount = 1, int_param = PlayerTitleId.BATTLE_PASS_SUM24_1, },
            { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassExp30",                 },
        },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass12_8",                  price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass12_9",                  price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass12_11",                 price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,      			 amount = 1, str_param = "Avatar_248",                       price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO,                 amount = 1, str_param = "Taunt_168",                        price_weight = 0.2, },
        { type = ai.BundleContent.TITLE,                 amount = 1, int_param = PlayerTitleId.BATTLE_PASS_SUM24_1,  price_weight = 0.2, },
        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassExp30",                  price_weight = 0.2, },
    }
}

Def.Bundle_XenoEvent_Alliesandrivals5  = 
{
        inherit           = "BundleBase",
        premiumPrice      = 7500,
        storeItemId       = Bundles_GetNextStoreItemId(),
        uiName            = "Bundle_XenoEvent_Alliesandrivals5_name", -- Убойная парочка 2
        uiDesc            = "Bundle_XenoEvent_Alliesandrivals5_desc", -- Содержит все предметы из списка.
        cant_be_bought    = true,
        uiPromo           = "bandle_11",
        default_icon      = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP12_Spinal_01",       },
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "Brassknuckles",        },
                        { type = ai.BundleContent.AVATAR,                amount = 1, str_param = "Avatar_247",           },
                        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30",  },
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP12_Spinal_01",                  price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "Brassknuckles",                   price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,      			 amount = 1, str_param = "Avatar_247",                      price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30",             price_weight = 0.6, },
    }
}

Def.Bundle_XenoEvent_Alliesandrivals6 = 
{
        inherit           = "BundleBase",
        premiumPrice      = 7500,
        storeItemId       = Bundles_GetNextStoreItemId(),
        uiName            = "Bundle_XenoEvent_Alliesandrivals6_name", -- Тот самый цвет
        uiDesc            = "Bundle_XenoEvent_Alliesandrivals6_desc", -- Содержит все предметы из списка.
        cant_be_bought    = true,
        uiPromo           = "bandle_11",
        default_icon      = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,       amount = 1, str_param = "ModernHead",           },
                        { type = ai.BundleContent.AVATAR,               amount = 1, str_param = "Avatar_145",           },
                        { type = ai.BundleContent.MOTTO,                amount = 1, str_param = "Taunt_177",            },
                        { type = ai.BundleContent.TITLE,                amount = 1, int_param = PlayerTitleId.EVENT_PASS_NY24_3, },
                        { type = ai.BundleContent.CUSTOM_ELEMENT,       amount = 1, str_param = "battle_pass5_12",      },
                        { type = ai.BundleContent.ACCOUNT_AURA,         amount = 1, str_param = "BattlePassExp30",      },
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "ModernHead",                price_weight = 0.1,},
        { type = ai.BundleContent.AVATAR,         amount = 1, str_param = "Avatar_145",             price_weight = 0.1,},
        { type = ai.BundleContent.MOTTO,          amount = 1, str_param = "Taunt_177",            price_weight = 0.2,},
        { type = ai.BundleContent.TITLE,          amount = 1, int_param = PlayerTitleId.EVENT_PASS_NY24_3,   price_weight = 0.1,},
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass5_12",        price_weight = 0.1,},
        { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "BattlePassExp30",        price_weight = 0.4,},

    }
}
Def.Bundle_XenoEvent_Paints17  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7500,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints17_name", -- Набор переливающийся 17
	uiDesc				= "Bundle_XenoEvent_Paints17_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP17_Matt_MoonGlow",	        },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP17_Matt_BP17_Jasmine",	    },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP17_Matt_BP17_Magenta",	    },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP17_Matt_BP17_HippieBlue",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP18_Matt_18_GreenishYellow",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP17_Matt_MoonGlow", 	        price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP17_Matt_BP17_Jasmine", 	    price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP17_Matt_BP17_Magenta", 	    price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP17_Matt_BP17_HippieBlue", 		price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP18_Matt_18_GreenishYellow", 	price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers17 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers17_name", -- Набор наклеек 17
	uiDesc				= "Bundle_XenoEvent_Stickers17_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_13", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_14", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_15", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_16", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_17", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_13", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_14", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_15", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_16", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass12_17", price_weight = 0.2, },
    },
}

-- SC-117436 Новый набор на 1 апреля 2025
Def.Bundle_April1_2025 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 2900,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April1_2025_name",
    uiDesc              = "Bundle_April1_2025_desc",
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP19_Noise", 	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_5", },
        },
    },

    fixed_contents = 
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP19_Noise", 		price_weight = 0.2, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_1", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_2",		price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_3", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_4", 	price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2025_5", 	price_weight = 0.1, },
    },
}

-- SC-119890 Набор насмешек с конкурса в discord (июль 2025)

Def.Bundle_DiscordTaunt1  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 300,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_DiscordTaunt1_name", -- Набор конкурсных насмешек
	uiDesc				= "Bundle_DiscordTaunt1_desc", -- Победители летнего конкурса насмешек в официальном Discord-сервере.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_318",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_319",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_320",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_321",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_322",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_323",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_324",	},

		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_318", price_weight = 0.14, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_319", price_weight = 0.14, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_320", price_weight = 0.14, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_321", price_weight = 0.14, },
		{ type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_322", price_weight = 0.14, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_323", price_weight = 0.14, },
		{ type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_324", price_weight = 0.16, },
    },
}

Def.Bundle_DiscordTaunt2  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 300,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_DiscordTaunt2_name", -- Набор конкурсных насмешек #2
	uiDesc				= "Bundle_DiscordTaunt2_desc", -- Победители летнего конкурса насмешек в официальном Discord-сервере.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_325",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_326",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_327",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_328",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_329",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_330",	},
			{ type = ai.BundleContent.MOTTO,			amount = 1,	str_param = "Taunt_331",	},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_325", price_weight = 0.14, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_326", price_weight = 0.14, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_327", price_weight = 0.14, },
		{ type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_328", price_weight = 0.14, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_329", price_weight = 0.14, },
		{ type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_330", price_weight = 0.14, },
        { type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_331", price_weight = 0.16, },
    },
}

Def.Bundle_Stickers_Game_11_Years_2025 = -- Торжественный набор №11
{
    inherit				= "BundleBase",
    premiumPrice		= 100,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_Stickers_Game_11_Years_2025_name",
    uiDesc				= "Bundle_Stickers_Game_11_Years_2025_desc",
    cant_be_bought  	= true,
    uiPromo				= "bandle_40",
    default_icon    	= "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_3", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_4", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_5", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_1", price_weight = 0.20, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_2", price_weight = 0.20, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_3", price_weight = 0.20, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_4", price_weight = 0.20, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "11_years_release_5", price_weight = 0.20, },
    },
}

-- SC-120314 Сундук Праздничный набор №14 к ДР игры

Def.Bundle_Event_Birthday2026 =
{
    inherit				= "BundleBase",
    premiumPrice		= 100,
    storeItemId			= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_Event_Birthday2026_name",
    uiDesc				= "Bundle_Event_Birthday2026_desc",
    cant_be_bought  	= true,
    uiPromo				= "bandle_40",
    default_icon    	= "dlcIco",

    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_2", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_3", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_4", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_5", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Birthday_2026", },
        },
    },
    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_1", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_2", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_3", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_4", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "birthday_2026_5", price_weight = 0.16, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Birthday_2026", price_weight = 0.2, },
    },
}

-- SC-120325 Новые временные наборы во внутриигровом магазине №16

Def.Bundle_XenoEvent_Desolateworlds1  = 
{
    inherit             = "BundleBase",
    premiumPrice        = 7000,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_XenoEvent_Desolateworlds1_name", -- Скандинавские истории 1
    uiDesc              = "Bundle_XenoEvent_Desolateworlds1_desc", -- Содержит все предметы из списка.
    cant_be_bought      = true,
    uiPromo             = "bandle_11",
    default_icon        = "dlcIco",
    
    ui_content = 
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass21_1",                 },
            { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass21_2",                 },
            { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass21_7",                 },
            { type = ai.BundleContent.AVATAR,                amount = 1, str_param = "Avatar_343",                      },
            { type = ai.BundleContent.MOTTO,                 amount = 1, str_param = "Taunt_332",                       },
            { type = ai.BundleContent.TITLE,                 amount = 1, int_param = PlayerTitleId.BATTLE_PASS_AUT25_2, },
            { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassExp30",                 },
        },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass21_1",                  price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass21_2",                  price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "battle_pass21_7",                  price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,      			 amount = 1, str_param = "Avatar_343",                       price_weight = 0.1, },
        { type = ai.BundleContent.MOTTO,                 amount = 1, str_param = "Taunt_332",                        price_weight = 0.2, },
        { type = ai.BundleContent.TITLE,                 amount = 1, int_param = PlayerTitleId.BATTLE_PASS_AUT25_2,  price_weight = 0.2, },
        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassExp30",                  price_weight = 0.2, },
    }
}

Def.Bundle_XenoEvent_Desolateworlds2  = 
{
        inherit           = "BundleBase",
        premiumPrice      = 7000,
        storeItemId       = Bundles_GetNextStoreItemId(),
        uiName            = "Bundle_XenoEvent_Desolateworlds2_name", -- Скандинавские истории 2
        uiDesc            = "Bundle_XenoEvent_Desolateworlds2_desc", -- Содержит все предметы из списка.
        cant_be_bought    = true,
        uiPromo           = "bandle_11",
        default_icon      = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP21_Ivory",       	},
                        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP21_Drakkar",        },
                        { type = ai.BundleContent.AVATAR,                amount = 1, str_param = "Avatar_346",          },
                        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30", },
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP21_Ivory",               price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT,        amount = 1, str_param = "BP21_Drakkar",             price_weight = 0.1, },
        { type = ai.BundleContent.AVATAR,      			 amount = 1, str_param = "Avatar_346",               price_weight = 0.1, },
        { type = ai.BundleContent.ACCOUNT_AURA,          amount = 1, str_param = "BattlePassCredits30",      price_weight = 0.6, },
    }
}

Def.Bundle_XenoEvent_Desolateworlds3 = 
{
        inherit           = "BundleBase",
        premiumPrice      = 7000,
        storeItemId       = Bundles_GetNextStoreItemId(),
        uiName            = "Bundle_XenoEvent_Desolateworlds3_name", -- Скандинавские истории 3
        uiDesc            = "Bundle_XenoEvent_Desolateworlds3_desc", -- Содержит все предметы из списка.
        cant_be_bought    = true,
        uiPromo           = "bandle_11",
        default_icon      = "dlcIco",
        
        ui_content = 
        {
                {
                        { type = ai.BundleContent.CUSTOM_ELEMENT,       amount = 1, str_param = "BP21_Helmet",           			},
                        { type = ai.BundleContent.AVATAR,               amount = 1, str_param = "Avatar_348",          				},
                        { type = ai.BundleContent.MOTTO,                amount = 1, str_param = "Taunt_334",            			},
                        { type = ai.BundleContent.TITLE,                amount = 1, int_param = PlayerTitleId.EVENT_PASS_AUT25_3,  },
                        { type = ai.BundleContent.CUSTOM_ELEMENT,       amount = 1, str_param = "battle_pass21_10",      			},
                        { type = ai.BundleContent.ACCOUNT_AURA,         amount = 1, str_param = "BattlePassExp30",      			},
                },
        },        
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP21_Helmet",                	   price_weight = 0.1,},
        { type = ai.BundleContent.AVATAR,         amount = 1, str_param = "Avatar_348",             		   price_weight = 0.1,},
        { type = ai.BundleContent.MOTTO,          amount = 1, str_param = "Taunt_334",            			   price_weight = 0.2,},
        { type = ai.BundleContent.TITLE,          amount = 1, int_param = PlayerTitleId.EVENT_PASS_AUT25_3,    price_weight = 0.1,},
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_10",        		   price_weight = 0.1,},
        { type = ai.BundleContent.ACCOUNT_AURA,   amount = 1, str_param = "BattlePassExp30",        		   price_weight = 0.4,},

    }
}
Def.Bundle_XenoEvent_Paints18  = 
{
	inherit				= "BundleBase",
	premiumPrice   		= 7000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Paints18_name", -- Набор «Боевой окрас»
	uiDesc				= "Bundle_XenoEvent_Paints18_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	
	ui_content = 
	{
		{
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP21_Matt_21_Coffee",	    },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP21_Matt_21_Green",	    },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP21_Matt_21_Orange",	    },
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP21_Matt_21_FlatBlue",	},
			{ type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP21_Matt_21_Comet",		},
		},
	},	
    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP21_Matt_21_Coffee", 	    price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP21_Matt_21_Green", 	    price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP21_Matt_21_Orange", 	    price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP21_Matt_21_FlatBlue", 		price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP21_Matt_21_Comet", 		price_weight = 0.2, },
    },
}

Def.Bundle_XenoEvent_Stickers18 =
{
    inherit				= "BundleBase",
	premiumPrice   		= 2000,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_XenoEvent_Stickers18_name", -- Набор скандинавских наклеек
	uiDesc				= "Bundle_XenoEvent_Stickers18_desc", -- Содержит все предметы из списка.
	cant_be_bought 		= true,
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_4",  },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_5",  },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_6",  },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_11", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_12", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_4",  price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_5",  price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_6",  price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_11", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "battle_pass21_12", price_weight = 0.2, },
    },
}

-- SC-120298 Сундук на день святого валентина 2026
Def.Bundle_February_14_2026 =
{
    inherit        = "BundleBase",
    premiumPrice   = 3000,
    storeItemId    = Bundles_GetNextStoreItemId(),
    uiName         = "Bundle_February_14_2026_name",
    uiDesc         = "Bundle_February_14_2026_desc",
    cant_be_bought = true,
    uiPromo        = "Bundle_ShipActivateQuest1_T5",
    default_icon   = "dlcIco",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_1", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_5", },
        },
    },

    fixed_contents =
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_1", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_2", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_3", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_4", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "valentine_day_2026_5", price_weight = 0.2, },
    },
}
Def.Bundle_April1_2026 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 2900,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April1_2026_name", -- Праздничный набор №1/26
    uiDesc              = "Bundle_April1_2026_desc", -- Содержит все предметы из списка.
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content =
    {
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT,	amount = 1,	str_param = "BP15_Chain01", },
			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_5", },
        },
    },

    fixed_contents = 
    {
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "BP15_Chain01", 		price_weight = 0.2, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_1", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_2",		price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_3", 	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_4", 	price_weight = 0.1, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "1_april_2026_5", 	price_weight = 0.1, },
    },
}

-- SC-120442 Набор на День Космонавтики 2026.
Def.Bundle_April_12_2026 = 
{
    inherit             = "BundleBase",
    premiumPrice        = 2900,
    storeItemId         = Bundles_GetNextStoreItemId(),
    uiName              = "Bundle_April_12_2026_name", -- Далекие горизонты
    uiDesc              = "Bundle_April_12_2026_desc", -- Содержит все предметы из списка.
    cant_be_bought      = true,
    uiPromo             = "bandle_41",
    default_icon        = "bandle_41",

    ui_content = 
    {
	    {
 			{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Astronaut", },
        },
        {
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_1", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_2", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_3", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_4", },
            { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_5", },
        },
    },

    fixed_contents = 
    {
		{ type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "Astronaut", price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_1", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_2", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_3", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_4", price_weight = 0.16, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, amount = 1, str_param = "cosmos_2026_5", price_weight = 0.16, },
    },
}