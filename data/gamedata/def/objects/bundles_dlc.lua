--//////////////////////////////////////////////////////////////////////////////
--//
--// Created: 18-Feb-2020
--// Copyright © 2020, Targem LLC. All rights reserved.
--//
--//  Бандлы для DLC
--//
--//////////////////////////////////////////////////////////////////////////////

-- ИСПОЛЬЗУЮТСЯ В DLC! НЕ ИЗМЕНЯТЬ!

-- SC-113081 Новый набор "Star Conflict: Набор Сид-Чипов и 30 дней премиум лицензии"
Def.Bundle_DLC_Seed_Balanced_01 = 
{
	inherit				= "BundleBase",
	premiumPrice		=  99999999,
	storeItemId			=  Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_DLC_Seed_Balanced_01_name",
	uiDesc				= "Bundle_DLC_Seed_Balanced_01_desc",
	uiPromo 			= "bundle_equipment_parts",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.PREMIUM, amount = 1, int_param = 60 * 60 * 24 * 30 },
        { type = ai.BundleContent.AUTOGEN, amount = 15, str_param = "BALANCED", int_param = 17 },
		{ type = ai.BundleContent.AUTOGEN, amount = 5, str_param = "SPECIAL", int_param = 17 },
		{ type = ai.BundleContent.AUTOGEN, amount = 1, str_param = "DOUBLE", int_param = 17 },
		--{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "DLCCredExp60", price_weight = 1, },
    },
	
	random_contents = 
	{
		{
			{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "DLCCredExp60", drop_weight = 1, }
		},
	},
}

-- SC-113082 Новый набор "Star Conflict: Набор редких Сид-Чипов и 30 дней премиум лицензии"
Def.Bundle_DLC_Seed_Special_01 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_DLC_Seed_Special_01_name",
	uiDesc				= "Bundle_DLC_Seed_Special_01_desc",
	uiPromo 			= "bundle_equipment_parts",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.PREMIUM, amount = 1, int_param = 60 * 60 * 24 * 30 },
		{ type = ai.BundleContent.AUTOGEN, amount = 20, str_param = "SPECIAL", int_param = 17 },
		{ type = ai.BundleContent.AUTOGEN, amount = 2, str_param = "DOUBLE", int_param = 17 },
		--{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "DLCCredExp120", price_weight = 1, },
    },
	
	random_contents = 
	{
		{
			{ type = ai.BundleContent.ACCOUNT_AURA, amount = 1, str_param = "DLCCredExp120", drop_weight = 1, }
		},
	},
}

-- SC-114143 Аватарка для набора Polar Bear
Def.Bundle_Avatar_120 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_120_name",
	uiDesc				= "Bundle_Avatar_120_desc",
	uiPromo 			= "bandle_NY_2_2017",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_120", price_weight = 1, },
    },
}

-- SC-114496 DLC Relic и Relic элитный
Def.Bundle_Avatar_133 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_133_name",
	uiDesc				= "Bundle_Avatar_133_desc",
	uiPromo 			= "bandle_45_large",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_133", price_weight = 1, },
    },
}

Def.Bundle_EventCredits =
{
    inherit 			= "BundleBase",
	premiumPrice		= 99999999,
    storeItemId 		= Bundles_GetNextStoreItemId(),
    uiName				= "Bundle_NY2017_T1_Exchange_name",
    uiDesc 				= "Bundle_NY2017_T1_Exchange_desc",
    uiPromo 			= "bandle_35",
    default_icon 		= "dlcIco",
	cant_be_bought 		= true,
	hiddenInShop    	= true,
	is_rewardable		= true,
	--cant_be_bought_on_event_credits_limit = true,

    ui_content = { { { type = ai.BundleContent.EVENT_CREDITS, amount = 100, }, }, },

    random_contents = 
	{ 
		{ { type = ai.BundleContent.EVENT_CREDITS, amount = 100, drop_weight = 1, }, }, 
	},
}

-- SC-114698 DLC Папа Краб Элитный
Def.Bundle_Avatar_134 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_134_name",
	uiDesc				= "Bundle_Avatar_134_desc",
	uiPromo 			= "bandle_11_large",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_134", price_weight = 1, },
    },
}

Def.Bundle_Avatar_135 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_135_name",
	uiDesc				= "Bundle_Avatar_135_desc",
	uiPromo 			= "bandle_11_large",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_135", price_weight = 1, },
    },
}

Def.Bundle_AsteroidPremiumLoot = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "",
	uiDesc				= "",
	uiPromo 			= "",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,
	hiddenNotification  = true,

    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "AsteroidPremiumLoot10",	price_weight = 1, },
    },
}

Def.Bundle_Avatar_136 = -- называется 136, но на самом деле 148
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_136_name",
	uiDesc				= "Bundle_Avatar_136_desc",
	uiPromo 			= "bandle_11_large",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_148", price_weight = 1, },
    },
}

Def.Bundle_Avatar_117 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_117_name",
	uiDesc				= "Bundle_Avatar_117_desc",
	uiPromo 			= "bandle_11_large",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_117", price_weight = 1, },
    },
}

Def.Bundle_EventCred_BattlePass = 
{
	inherit				= "BundleBase",
	premiumPrice		= 999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_EventCred_BattlePass_name",
	uiDesc				= "",
	uiPromo 			= "bandle_11",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "BattlePass_EventCred50_NY23",	price_weight = 0.5, },
		{ type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "DLCCredExp30",	price_weight = 0.5, },
    },
}

-- SC-114701 Портрет командира эсминца Империи
Def.Bundle_Avatar_150 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_150_name",
	uiDesc				= "Bundle_Avatar_150_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_150", price_weight = 1, },
    },
}

-- SC-115200 Новый набор DLC Shark
Def.Bundle_Avatar_151 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_151_name",
	uiDesc				= "Bundle_Avatar_151_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_151", price_weight = 1, },
    },
}

-- Портрет Protazan
Def.Bundle_Avatar_152 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_152_name",
	uiDesc				= "Bundle_Avatar_152_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_152", price_weight = 1, },
    },
}

-- Портрет Naglfar - Лейф Эрикссон
Def.Bundle_Avatar_157 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_157_name",
	uiDesc				= "Bundle_Avatar_157_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_157", price_weight = 1, },
    },
}

-- SC-115617 Перевыпустить Joker. Аватарка для dlc
Def.Bundle_Avatar_158 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_158_name",
	uiDesc				= "Bundle_Avatar_158_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_158", price_weight = 1, },
    },
}

-- Портрет Thor - Лейтенант Гетц Байер
Def.Bundle_Avatar_165 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_165_name",
	uiDesc				= "Bundle_Avatar_165_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_165", price_weight = 1, },
    },
}

-- Портрет Razor - Наоки Морита 
Def.Bundle_Avatar_173 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_173_name",
	uiDesc				= "Bundle_Avatar_173_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_173", price_weight = 1, },
    },
}

-- Портрет Sawtooth - Бенито Бонито
Def.Bundle_Avatar_174 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_174_name",
	uiDesc				= "Bundle_Avatar_174_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_174", price_weight = 1, },
    },
}

-- Портрет Blood Tormentor - Альма
Def.Bundle_Avatar_181 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_181_name",
	uiDesc				= "Bundle_Avatar_181_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_181", price_weight = 1, },
    },
}

-- SC-115982 Колаб с Пикабу 12 апреля. Подготовить набор для раздач на Пикабу
Def.Bundle_Pikabu = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Pikabu_name",
	uiDesc				= "Bundle_Pikabu_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, 				amount = 1, str_param = "Avatar_182", 	price_weight = 0.15, },
		{ type = ai.BundleContent.MOTTO,  				amount = 1, str_param = "Taunt_161",	price_weight = 0.15, },
		{ type = ai.BundleContent.MOTTO, 				amount = 1, str_param = "Taunt_162",	price_weight = 0.15, },
		{ type = ai.BundleContent.MOTTO,  				amount = 1, str_param = "Taunt_163",	price_weight = 0.15, },
		{ type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "Pikabu_01",	price_weight = 0.2, },
        { type = ai.BundleContent.CUSTOM_ELEMENT, 		amount = 1, str_param = "pikabu", 		price_weight = 0.2, },
    },
}

-- Портрет Phoenix
Def.Bundle_Avatar_183 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_183_name",
	uiDesc				= "Bundle_Avatar_183_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_183", price_weight = 1, },
    },
}

-- Портрет Kirishima
Def.Bundle_Avatar_184 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_184_name",
	uiDesc				= "Bundle_Avatar_184_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_184", price_weight = 1, },
    },
}

-- Портрет Cutter
Def.Bundle_Avatar_196 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_196_name",
	uiDesc				= "Bundle_Avatar_196_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_196", price_weight = 1, },
    },
}

-- Портрет Kusarigama
Def.Bundle_Avatar_198 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_198_name",
	uiDesc				= "Bundle_Avatar_198_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_198", price_weight = 1, },
    },
}

-- Портрет Reaper
Def.Bundle_Avatar_209 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_209_name",
	uiDesc				= "Bundle_Avatar_209_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_209", price_weight = 1, },
    },
}

-- Портрет Thrasher
Def.Bundle_Avatar_210 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_210_name",
	uiDesc				= "Bundle_Avatar_210_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_210", price_weight = 1, },
    },
}

-- Портрет Irbis
Def.Bundle_Avatar_216 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_216_name",
	uiDesc				= "Bundle_Avatar_216_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_216", price_weight = 1, },
    },
}

-- Портрет Bear
Def.Bundle_Avatar_217 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_217_name",
	uiDesc				= "Bundle_Avatar_217_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_217", price_weight = 1, },
    },
}

-- Портрет Northstorm
Def.Bundle_Avatar_223 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_223_name",
	uiDesc				= "Bundle_Avatar_223_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_223", price_weight = 1, },
    },
}

-- Портрет Typhon
Def.Bundle_Avatar_229 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_229_name",
	uiDesc				= "Bundle_Avatar_229_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_229", price_weight = 1, },
    },
}

-- Портрет Dragonfly
Def.Bundle_Avatar_230 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_230_name",
	uiDesc				= "Bundle_Avatar_230_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_230", price_weight = 1, },
    },
}

-- Насмешки и титулы Dragonfly
Def.Bundle_DragonflyStuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_DragonflyStuff_name",
	uiDesc				= "Bundle_DragonflyStuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.DRAGONFLY_1,	price_weight = 0.25, },
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.DRAGONFLY_2,	price_weight = 0.25, },
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.DRAGONFLY_3,	price_weight = 0.25, },
		{ type = ai.BundleContent.MOTTO, 			amount = 1, 	str_param = "Taunt_231",				price_weight = 0.09, },
		{ type = ai.BundleContent.MOTTO, 			amount = 1, 	str_param = "Taunt_232",				price_weight = 0.08, },
		{ type = ai.BundleContent.MOTTO, 			amount = 1, 	str_param = "Taunt_233",				price_weight = 0.08, },
    },
}

-- Портрет Wasp
Def.Bundle_Avatar_231 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_231_name",
	uiDesc				= "Bundle_Avatar_231_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_231", price_weight = 1, },
    },
}

-- Насмешки и титулы для Wasp
Def.Bundle_Wasp_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Wasp_Stuff_name",
	uiDesc				= "Bundle_Wasp_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.WASP_1,	price_weight = 0.25, },
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.WASP_2,	price_weight = 0.25, },
		{ type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.WASP_3,	price_weight = 0.25, },
		{ type = ai.BundleContent.MOTTO, 			amount = 1, 	str_param = "Taunt_238",				price_weight = 0.09, },
		{ type = ai.BundleContent.MOTTO, 			amount = 1, 	str_param = "Taunt_239",				price_weight = 0.08, },
		{ type = ai.BundleContent.MOTTO, 			amount = 1, 	str_param = "Taunt_240",				price_weight = 0.08, },
    },
}

-- Портрет Nyx
Def.Bundle_Avatar_237 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_237_name",
	uiDesc				= "Bundle_Avatar_237_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_237", price_weight = 1, },
    },
}

-- SC-117388 DLC корабли 15 ранг
-- Портрет Cyning
Def.Bundle_Avatar_171 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_171_name",
	uiDesc				= "Bundle_Avatar_171_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_171", price_weight = 1, },
    },
}

-- Титул для Cyning
Def.Bundle_Cyning_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Cyning_Stuff_name",
	uiDesc				= "Bundle_Cyning_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.CYNING_1,	price_weight = 0.25, },
    },
}
-- Портрет Mjolnir
Def.Bundle_Avatar_176 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_176_name",
	uiDesc				= "Bundle_Avatar_176_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_176", price_weight = 1, },
    },
}

-- Титул для Mjolnir
Def.Bundle_Mjolnir_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Mjolnir_Stuff_name",
	uiDesc				= "Bundle_Mjolnir_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.MJOLNIR_1,	price_weight = 0.25, },
    },
}

-- Портрет Kraken
Def.Bundle_Avatar_177 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_177_name",
	uiDesc				= "Bundle_Avatar_177_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_177", price_weight = 1, },
    },
}

-- Титул для Kraken
Def.Bundle_Kraken_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Kraken_Stuff_name",
	uiDesc				= "Bundle_Kraken_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.KRAKEN_1,	price_weight = 0.25, },
    },
}

-- Портрет Peregrine
Def.Bundle_Avatar_178 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_178_name",
	uiDesc				= "Bundle_Avatar_178_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_178", price_weight = 1, },
    },
}

-- Титул для Peregrine
Def.Bundle_Peregrine_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Peregrine_Stuff_name",
	uiDesc				= "Bundle_Peregrine_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.PEREGRINE_1,	price_weight = 0.25, },
    },
}

-- Портрет Jaguar
Def.Bundle_Avatar_179 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_179_name",
	uiDesc				= "Bundle_Avatar_179_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_179", price_weight = 1, },
    },
}

-- Титул для Jaguar
Def.Bundle_Jaguar_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Jaguar_Stuff_name",
	uiDesc				= "Bundle_Jaguar_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.JAGUAR_1,	price_weight = 0.25, },
    },
}

-- Портрет Octopus
Def.Bundle_Avatar_195 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_195_name",
	uiDesc				= "Bundle_Avatar_195_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_195", price_weight = 1, },
    },
}

-- Титул для Octopus
Def.Bundle_Octopus_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Octopus_Stuff_name",
	uiDesc				= "Bundle_Octopus_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.OCTOPUS_1,	price_weight = 0.25, },
    },
}

-- Портрет Caltrop
Def.Bundle_Avatar_180 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_180_name",
	uiDesc				= "Bundle_Avatar_180_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_180", price_weight = 1, },
    },
}

-- Титул для Caltrop
Def.Bundle_Caltrop_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Caltrop_Stuff_name",
	uiDesc				= "Bundle_Caltrop_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.CALTROP_1,	price_weight = 0.25, },
    },
}

-- Портрет Saw One
Def.Bundle_Avatar_185 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_185_name",
	uiDesc				= "Bundle_Avatar_185_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_185", price_weight = 1, },
    },
}

-- Титул для Saw One
Def.Bundle_Saw_One_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Saw_One_Stuff_name",
	uiDesc				= "Bundle_Saw_One_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.SAWONE_1,	price_weight = 0.25, },
    },
}

-- Портрет Ronin
Def.Bundle_Avatar_200 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_200_name",
	uiDesc				= "Bundle_Avatar_200_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_200", price_weight = 1, },
    },
}

-- Титул для Ronin
Def.Bundle_Ronin_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Ronin_Stuff_name",
	uiDesc				= "Bundle_Ronin_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.TITLE,			amount = 1,		int_param = PlayerTitleId.RONIN_1,	price_weight = 0.25, },
    },
}

-- Портрет Sai 
Def.Bundle_Avatar_238 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_238_name", 
	uiDesc				= "Bundle_Avatar_238_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,
    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_238", price_weight = 1, }, 
    },
}

-- Портрет Confessor
Def.Bundle_Avatar_239 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_239_name",
	uiDesc				= "Bundle_Avatar_239_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_239", price_weight = 1, },
    },
}

-- Насмешка для Confessor
Def.Bundle_Confessor_Stuff = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Confessor_Stuff_name",
	uiDesc				= "Bundle_Confessor_Stuff_desc",
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
		{ type = ai.BundleContent.MOTTO, 			amount = 1, 	str_param = "Taunt_246",				price_weight = 0.08, },
    },
	
}
-- Портрет Palom
Def.Bundle_Avatar_249 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_249_name", 
	uiDesc				= "Bundle_Avatar_249_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_249", price_weight = 1, },
    },
}

Def.Bundle_Avatar_254 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_254_name", 
	uiDesc				= "Bundle_Avatar_254_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_254", price_weight = 1, },
    },
}

-- Портрет Seeress
Def.Bundle_Avatar_255 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_255_name", 
	uiDesc				= "Bundle_Avatar_255_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_255", price_weight = 1, },
    },
}

-- Портрет Helicon
Def.Bundle_Avatar_256 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_256_name", 
	uiDesc				= "Bundle_Avatar_256_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_256", price_weight = 1, },
    },
}

-- Сундук выдающий ауру для купивших BattlePass_Elite в предыдущем сезоне/фазе (НАЧАЛО БЛОКА)
Def.Bundle_Elite_Donater = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Elite_Donater_name",
	uiDesc				= "",
	uiPromo 			= "",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,
	hiddenNotification  = true,

    fixed_contents =
    {
        { type = ai.BundleContent.ACCOUNT_AURA,		amount = 1,		str_param = "Elite_Donater_BP23_2",	price_weight = 1, },
    },
}
-- Сундук выдающий ауру для купивших BattlePass_Elite в предыдущем сезоне/фазе (КОНЕЦ БЛОКА)


-- Портрет Sirius
Def.Bundle_Avatar_221 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_221_name", 
	uiDesc				= "Bundle_Avatar_221_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_221", price_weight = 1, },
    },
}

-- Портрет Mauler
Def.Bundle_Avatar_261 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_261_name", 
	uiDesc				= "Bundle_Avatar_261_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_261", price_weight = 1, },
    },
}

-- Портрет Hadrian
Def.Bundle_Avatar_262 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_262_name", 
	uiDesc				= "Bundle_Avatar_262_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_262", price_weight = 1, },
    },
}

-- Портрет Baphomet
Def.Bundle_Avatar_263 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_263_name", 
	uiDesc				= "Bundle_Avatar_263_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_263", price_weight = 1, },
    },
}

-- Портрет Loki
Def.Bundle_Avatar_268 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_268_name", 
	uiDesc				= "Bundle_Avatar_268_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_268", price_weight = 1, },
    },
}

-- Портрет Manul
Def.Bundle_Avatar_273 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_273_name", 
	uiDesc				= "Bundle_Avatar_273_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_273", price_weight = 1, },
    },
}

-- Портрет Salamander
Def.Bundle_Avatar_278 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_278_name", 
	uiDesc				= "Bundle_Avatar_278_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_278", price_weight = 1, },
    },
}

-- Портрет Procyon
Def.Bundle_Avatar_279 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_279_name", 
	uiDesc				= "Bundle_Avatar_279_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_279", price_weight = 1, },
    },
}

-- Портрет Cor Vulnus (CorVulnus)
Def.Bundle_Avatar_280 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_280_name", 
	uiDesc				= "Bundle_Avatar_280_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_280", price_weight = 1, },
    },
}

-- Портрет Vigilant
Def.Bundle_Avatar_286 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_286_name", 
	uiDesc				= "Bundle_Avatar_286_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_286", price_weight = 1, },
    },
}

-- Портрет Bark
Def.Bundle_Avatar_291 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_291_name", 
	uiDesc				= "Bundle_Avatar_291_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_291", price_weight = 1, },
    },
}

-- Портрет Yith'Mor
Def.Bundle_Avatar_292 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_292_name", 
	uiDesc				= "Bundle_Avatar_292_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_292", price_weight = 1, },
    },
}

-- Портрет Shrike
Def.Bundle_Avatar_297 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_297_name", 
	uiDesc				= "Bundle_Avatar_297_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_297", price_weight = 1, },
    },
}

-- Портрет Pilum
Def.Bundle_Avatar_298 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_298_name", 
	uiDesc				= "Bundle_Avatar_298_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_298", price_weight = 1, },
    },
}

-- Портрет Helios («Эммет Бэнкс»)
Def.Bundle_Avatar_307 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_307_name", 
	uiDesc				= "Bundle_Avatar_307_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_307", price_weight = 1, },
    },
}

-- Портрет Psiloi («Граф Тенарис»)
Def.Bundle_Avatar_308 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_308_name", 
	uiDesc				= "Bundle_Avatar_308_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_308", price_weight = 1, },
    },
}

-- Портрет Persei («Граф Тенарис»)
Def.Bundle_Avatar_317 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_317_name", 
	uiDesc				= "Bundle_Avatar_317_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_317", price_weight = 1, },
    },
}

-- Портрет Bashe («Лун Хао»)
Def.Bundle_Avatar_322 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_322_name", 
	uiDesc				= "Bundle_Avatar_322_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_322", price_weight = 1, },
    },
}

-- Портрет Drag'thir («Зейл Эллестон»)
Def.Bundle_Avatar_328 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_328_name", 
	uiDesc				= "Bundle_Avatar_328_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_328", price_weight = 1, },
    },
}

-- Портрет Hellas («Леон «Seadog» О'Хейг»)
Def.Bundle_Avatar_327 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_327_name", 
	uiDesc				= "Bundle_Avatar_327_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_327", price_weight = 1, },
    },
}

-- Портрет Amber («Добрыня Всеславович»)
Def.Bundle_Avatar_337 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_337_name", 
	uiDesc				= "Bundle_Avatar_337_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_337", price_weight = 1, },
    },
}

-- Портрет Cinquedea («Красная Тишина»)
Def.Bundle_Avatar_338 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_338_name", 
	uiDesc				= "Bundle_Avatar_338_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_338", price_weight = 1, },
    },
}

-- Портрет Ace («Спектр-17»)
Def.Bundle_Avatar_347 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_347_name", 
	uiDesc				= "Bundle_Avatar_347_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_347", price_weight = 1, },
    },
}

-- Портрет Carolingian («Сигрид Фростейн»)
Def.Bundle_Avatar_352 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_352_name", 
	uiDesc				= "Bundle_Avatar_352_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_352", price_weight = 1, },
    },
}

-- Портрет «Apeiron» («Экзоскафандр «Прислужник»»)
Def.Bundle_Avatar_357 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_357_name", 
	uiDesc				= "Bundle_Avatar_357_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_357", price_weight = 1, },
    },
}

-- Портрет Saturn («Башар Тефий»)
Def.Bundle_Avatar_362 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_362_name", 
	uiDesc				= "Bundle_Avatar_362_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_362", price_weight = 1, },
    },
}

-- Портрет CorLegibus («Валентина Вега»)
Def.Bundle_Avatar_363 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_363_name", 
	uiDesc				= "Bundle_Avatar_363_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_363", price_weight = 1, },
    },
}

-- Портрет Tau’kita («Тайрон Солвик»)
Def.Bundle_Avatar_372 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_372_name", 
	uiDesc				= "Bundle_Avatar_372_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_372", price_weight = 1, },
    },
}

-- Портрет Chaos («Харро Леман»)
Def.Bundle_Avatar_373 = 
{
	inherit				= "BundleBase",
	premiumPrice		= 99999999,
	storeItemId			= Bundles_GetNextStoreItemId(),
	uiName				= "Bundle_Avatar_373_name", 
	uiDesc				= "Bundle_Avatar_373_desc", 
	uiPromo 			= "bandle_47",
	default_icon		= "dlcIco",
	cant_be_bought  	= true,
	hiddenInShop    	= true,
	is_rewardable		= true,

    fixed_contents =
    {
        { type = ai.BundleContent.AVATAR, amount = 1, str_param = "Avatar_373", price_weight = 1, },
    },
}
