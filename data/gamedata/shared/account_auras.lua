-------------------- Auras --------------------
AccountAura = {}

local pvpQueueSpecs =
{
	MasterServer.MMQueueSpec.MMQS_ARCADE,
	MasterServer.MMQueueSpec.MMQS_COOP_VS_AI,
	MasterServer.MMQueueSpec.MMQS_LEAGUE,
	MasterServer.MMQueueSpec.MMQS_UNKNOWN,
}

local nonOWQueueSpecs =
{
	MasterServer.MMQueueSpec.MMQS_ARCADE,
	MasterServer.MMQueueSpec.MMQS_COOP_VS_AI,
	MasterServer.MMQueueSpec.MMQS_LEAGUE,
	MasterServer.MMQueueSpec.MMQS_UNKNOWN,
	MasterServer.MMQueueSpec.MMQS_PVE,
	MasterServer.MMQueueSpec.MMQS_RAID,
}

AccountAura.Daily_Pvp =
{
    category                    = ai.AccountAuraCategory.NONE,
    duration_in_counters        = 1,
    duration_counter_event      = ai.AccountAuraCounterEvent.SPECIAL_LOOT,
    queue_specs                 = { MasterServer.MMQueueSpec.MMQS_ARCADE, MasterServer.MMQueueSpec.MMQS_UNKNOWN, },
    gameplays                   = ai.GameplayGroups.pvp,

    show_as_voucher             = true,
    voucher_ico                 = "voucher_Daily_Pvp",
    uiName                      = "Daily_Pvp_name",
    uiDesc                      = "Daily_Pvp_Desc",

    pvp_special_loot            = true,
}

AccountAura.Daily_Pvp_2x =
{
    category                    = ai.AccountAuraCategory.NONE,
    duration_in_counters        = 1,
    duration_counter_event      = ai.AccountAuraCounterEvent.GAME_WIN,
    queue_specs                 = { MasterServer.MMQueueSpec.MMQS_ARCADE, MasterServer.MMQueueSpec.MMQS_UNKNOWN, },
    gameplays                   = ai.GameplayGroups.pvp,

    daily_win_pvp_exp_reward    = true,
}

AccountAura.Daily_Coop =
{
    category                    = ai.AccountAuraCategory.NONE,
    duration_in_counters        = 1,
    duration_counter_event      = ai.AccountAuraCounterEvent.SPECIAL_LOOT,
    gameplays                   = ai.GameplayGroups.pvp,
    queue_specs                 = { MasterServer.MMQueueSpec.MMQS_COOP_VS_AI, },

    show_as_voucher             = true,
    voucher_ico                 = "voucher_Daily_Coop",
    uiName                      = "Daily_Coop_name",
    uiDesc                      = "Daily_Coop_Desc",

    coop_special_loot           = true,
}

AccountAura.Daily_Coop_2x =
{
    category                    = ai.AccountAuraCategory.NONE,
    duration_in_counters        = 1,
    duration_counter_event      = ai.AccountAuraCounterEvent.GAME_WIN,
    gameplays                   = ai.GameplayGroups.pvp,
    queue_specs                 = { MasterServer.MMQueueSpec.MMQS_COOP_VS_AI, },

    daily_win_coop_exp_reward   = true,
}

AccountAura.Daily_Pve =
{
    category                    = ai.AccountAuraCategory.NONE,
    duration_in_counters        = 1,
    duration_counter_event      = ai.AccountAuraCounterEvent.SPECIAL_LOOT,
    gameplays                   = ai.GameplayGroups.pve,
    queue_specs                 = { MasterServer.MMQueueSpec.MMQS_PVE, },

    show_as_voucher             = true,
    voucher_ico                 = "voucher_Daily_Pve",
    uiName                      = "Daily_Pve_name",
    uiDesc                      = "Daily_Pve_Desc",

    pve_special_loot            = true,
}

AccountAura.Daily_Pve_2x =
{
    category                    = ai.AccountAuraCategory.NONE,
    duration_in_counters        = 1,
    duration_counter_event      = ai.AccountAuraCounterEvent.GAME_WIN,
    gameplays                   = ai.GameplayGroups.pve,
    queue_specs                 = { MasterServer.MMQueueSpec.MMQS_PVE, },

    daily_win_pve_exp_reward    = true,
}

AccountAura.Daily_Brawl =
{
    category                    = ai.AccountAuraCategory.NONE,
    duration_in_counters        = 1,
    duration_counter_event      = ai.AccountAuraCounterEvent.SPECIAL_LOOT,
    queue_specs                 = { MasterServer.MMQueueSpec.MMQS_BRAWL, MasterServer.MMQueueSpec.MMQS_HUNGER_GAMES, MasterServer.MMQueueSpec.MMQS_ONE_AGAINST_ALL, MasterServer.MMQueueSpec.MMQS_ZOMBIE, MasterServer.MMQueueSpec.MMQS_THREE_TEAMS, MasterServer.MMQueueSpec.MMQS_CLOSE_DISTANCE },
    gameplays                   = ai.GameplayGroups.brawl,

    show_as_voucher             = true,
    voucher_ico                 = "voucher_Daily_Brawl",
    uiName                      = "Daily_Football_name",
    uiDesc                      = "Daily_Football_desc",

    brawl_special_loot          = true,
}

AccountAura.Daily_Brawl_2x =
{
    category                    = ai.AccountAuraCategory.NONE,
    duration_in_counters        = 1,
    duration_counter_event      = ai.AccountAuraCounterEvent.GAME_WIN,
    queue_specs                 = { MasterServer.MMQueueSpec.MMQS_BRAWL, MasterServer.MMQueueSpec.MMQS_HUNGER_GAMES, MasterServer.MMQueueSpec.MMQS_ONE_AGAINST_ALL, MasterServer.MMQueueSpec.MMQS_ZOMBIE, MasterServer.MMQueueSpec.MMQS_THREE_TEAMS, MasterServer.MMQueueSpec.MMQS_CLOSE_DISTANCE },
    gameplays                   = ai.GameplayGroups.brawl,

    daily_win_brawl_exp_reward  = true,
}

AccountAura.Daily_GenerousBundle =
{
	category					= ai.AccountAuraCategory.NONE,

	reset_bundle_content		= true,
}

AccountAura.Raid_Loot =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_counters = 2,
    duration_counter_event = ai.AccountAuraCounterEvent.SPECIAL_LOOT,
    level_name = "pve_raid",

    show_as_voucher = true,
    voucher_ico = "voucher_Daily_Raid",
    uiName = "Daily_Raid_name",
    uiDesc = "Daily_Raid_desc",

    raid_special_loot = true,
}

AccountAura.RW_Loot =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_counters = 3,
    duration_counter_event = ai.AccountAuraCounterEvent.SPECIAL_LOOT,
    level_name = "pve_raid_waterharvest",

    raid_special_loot = true,
}

AccountAura.RP_Loot =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_counters = 3,
    duration_counter_event = ai.AccountAuraCounterEvent.SPECIAL_LOOT,
    level_name = "s8256_pve_raid_planetoid",

    raid_special_loot = true,
}


--#67619: Аура новичка доработки 
local NEWBIE_resist = 25	--45    +50% НЕ ЧТОБЫ ИГРОК ДОЛГО УМИРАЛ, А ЧТОБЫ ОНИ(НОВИЧКИ) В БАЛАНСЕ ДРУГ ДРУГА БИЛИ      +30 "из ауры компенсации"  TestKPMNormalizer
AccountAura.NEWBIE = 
{
	category 					= ai.AccountAuraCategory.NEWBIE,

	--duration_in_hours			= 7 * 24,
	duration_in_counters 		= 600,  -- примерно 1000 битв экспериментально , было 50 примерно.  #0093062: Увеличить действие матрицы новичка до 1000 боёв
	duration_counter_event 		= ai.AccountAuraCounterEvent.GAME_WIN,
	queue_specs					= { MasterServer.MMQueueSpec.MMQS_COOP_VS_AI, MasterServer.MMQueueSpec.MMQS_ARCADE, },
	gameplays 					= ai.GameplayGroups.pvp,
	
	shield_resist_kinetic_add 	= NEWBIE_resist,
	shield_resist_emp_add 		= NEWBIE_resist,
	shield_resist_thermal_add 	= NEWBIE_resist,
	hull_resist_kinetic_add		= NEWBIE_resist,
	hull_resist_emp_add			= NEWBIE_resist,
	hull_resist_thermal_add		= NEWBIE_resist,
	
	damage_mul					= 0.3, --  +40 "из ауры компенсации" TestKPMNormalizer
	rocket_damage_coef_mul		= 0.3, --  +40 "из ауры компенсации" TestKPMNormalizer
	
	ui_ico =
	{
		target =
		{
			tex = "newbie_ico",
		},
	},
	uiName		= "NEWBIE_aura",
	uiDesc		= "NEWBIE_aura_Desc",
	isBuff		= true,
	hud_visible = false,
	hangar_invisible	= true,
}


-------------------- Steam DLC auras --------------------
--
AccountAura.Steamer_1 = 
{
	uiName					= "Steamer_1",
	category				= ai.AccountAuraCategory.NONE,
	keep_expired			= true,
--	reputation_reward_mul	= 0.10,
--	loyalty_reward_mul 		= 0.10,
	credits_reward_mul		= 0.10,
	loot_attempts_add		= 1,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_Steamer_1",
	--uiName 						= "Steamer_1_name",
	uiDesc 						= "Steamer_1_Desc",
	
}

--
AccountAura.Steamer_2 = 
{
	category				= ai.AccountAuraCategory.NONE,
	keep_expired			= true,
--	reputation_reward_mul	= 0.10,
--	loyalty_reward_mul 		= 0.10,
	credits_reward_mul		= 0.10,
	experience_reward_mul	= 0.10,
	--loot_attempts_add		= 1,

	show_as_voucher 		= true,
	voucher_ico				= "voucher_Steamer_2",

	uiName					= "Steamer_2",
	uiDesc 					= "Steamer_2_Desc",
}

--
AccountAura.Steamer_3 =  
{
	category				= ai.AccountAuraCategory.NONE,
	keep_expired			= true,
--	reputation_reward_mul	= 0.10,
--	loyalty_reward_mul 		= 0.10,
	credits_reward_mul		= 0.10,
	experience_reward_mul	= 0.10,
	--credits_reward_mul		= 0.10,
	--loot_attempts_add		= 1,
	--
	show_as_voucher 			= true,
	voucher_ico					= "voucher_Steamer_3",

	uiName					= "Steamer_3",
	uiDesc 						= "Steamer_3_Desc",
}

-------------------- Pirate DLC auras --------------------
--
AccountAura.Pirate_1 = 
{
	uiName					= "Pirate_1",
	category				= ai.AccountAuraCategory.NONE,
	keep_expired			= true,
	credits_reward_mul		= 0.10,
	--
	show_as_voucher 			= true,
	voucher_ico					= "voucher_Pirate_1",
	--uiName 						= "Pirate_1_name",
	uiDesc 						= "Pirate_1_Desc",
}

--
AccountAura.Pirate_2 = 
{
	uiName					= "Pirate_2",
	category				= ai.AccountAuraCategory.NONE,
	keep_expired			= true,
	credits_reward_mul		= 0.10,
	--
	show_as_voucher 			= true,
	voucher_ico					= "voucher_Pirate_2",
	--uiName 						= "Pirate_2_name",
	uiDesc 						= "Pirate_2_Desc",
}


-------------------- Consumables SLOT 0 --------------------
-- Синергия + лояльность +50%
AccountAura.Drug_RepBoost15 = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_0,
	queue_specs				= nonOWQueueSpecs,
	duration_in_counters 	= 5,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	gameplays 				= ai.GameplayGroups.non_open_world,
	
	experience_reward_mul 	= 0.5,
	--loyalty_reward_mul 		= 0.5,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
		
	is_group_wide			= false,
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_RepBoost15_ico",
		},
	},
	uiName 		= "Drug_RepBoost15",
	uiDesc 		= "Drug_RepBoost15_Desc",
	source_drug	= "Drug_RepBoost15",
	isBuff		= true,
	hud_visible = true,
}

-- Синергия + лояльность +200% (6 боев)
AccountAura.Drug_RepBoost200 = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_0,
	queue_specs				= nonOWQueueSpecs,
	duration_in_counters 	= 6,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	gameplays 				= ai.GameplayGroups.non_open_world,
	
	experience_reward_mul 	= 2,
	--loyalty_reward_mul 		= 2,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	is_group_wide			= false,
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_GoldRepBoost15wide_ico",
		},
	},
	uiName 		= "Drug_RepBoost200",
	uiDesc 		= "Drug_RepBoost200_Desc",
	source_drug	= "Drug_RepBoost200",
	isBuff		= true,
	hud_visible = true,
}

-- Синергия + лояльность +200% (3 боя)
AccountAura.Drug_RepBoost200_2 = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_0,
	queue_specs				= nonOWQueueSpecs,
	duration_in_counters 	= 3,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	gameplays 				= ai.GameplayGroups.non_open_world,
	
	experience_reward_mul 	= 2,
	--loyalty_reward_mul 		= 2,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	is_group_wide			= false,
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_RepBoost15_ico",
		},
	},
	uiName 		= "Drug_RepBoost15",
	uiDesc 		= "Drug_RepBoost200_Desc",
	source_drug	= "Drug_RepBoost200_2",
	isBuff		= true,
	hud_visible = true,
}

-- Синергия + лояльность +200% (12 боев)
AccountAura.Drug_RepBoost200_10 = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_0,
	queue_specs				= nonOWQueueSpecs,
	duration_in_counters 	= 12,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	gameplays 				= ai.GameplayGroups.non_open_world,
	
	experience_reward_mul 	= 2,
	--loyalty_reward_mul 		= 2,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	is_group_wide			= false,
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_GoldRepBoost15wide_ico",
		},
	},
	uiName 		= "Drug_GoldRepBoost15wide",
	uiDesc 		= "Drug_RepBoost200_Desc",
	source_drug	= "Drug_RepBoost200_10",
	isBuff		= true,
	hud_visible = true,
}

-- Синергия + лояльность +100% для всей команды
AccountAura.Drug_RepBoost15wide = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_0,
	queue_specs				= nonOWQueueSpecs,
	duration_in_counters 	= 5,	
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	gameplays 				= ai.GameplayGroups.non_open_world,
	
	experience_reward_mul 	= 1.0,
	--loyalty_reward_mul 		= 1.0,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	is_group_wide			= true,
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_GoldRepBoost15wide_ico",
		},
	},
	uiName 		= "Drug_GoldRepBoost15wide",
	uiDesc 		= "Drug_GoldRepBoost15wide_Desc",
	source_drug	= "Drug_GoldRepBoost15wide",
	isBuff		= true,
	hud_visible = true,
}

-- Увеличение резистов щита
AccountAura.Drug_ShieldResist = 
{
	category					= ai.AccountAuraCategory.DRUG_SLOT_1,
	queue_specs					= nonOWQueueSpecs,
	duration_in_counters 		= 3,
	duration_counter_event		= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 				= true,
	gameplays 					= ai.GameplayGroups.non_open_world,
	
	shield_resist_kinetic_add 	= 10,
	shield_resist_emp_add 		= 10,
	shield_resist_thermal_add 	= 10,
	is_group_wide				= false,
	--show_as_voucher 			= true,
	--voucher_ico					= "",
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_SilverShieldResist_ico",
		},
	},
	uiName 		= "Drug_SilverShieldResist",
	uiDesc 		= "Drug_SilverShieldResist_Desc",
	source_drug	= "Drug_SilverShieldResist",
	isBuff		= true,
	hud_visible = true,
}

-- Увеличение резистов корпуса
AccountAura.Drug_HullResist = 
{
	category					= ai.AccountAuraCategory.DRUG_SLOT_1,
	queue_specs					= nonOWQueueSpecs,
	duration_in_counters 		= 3,
	duration_counter_event		= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 				= true,
	gameplays 					= ai.GameplayGroups.non_open_world,
	
	hull_resist_kinetic_add 	= 10,
	hull_resist_emp_add 		= 10,
	hull_resist_thermal_add 	= 10,
	is_group_wide				= false,
	--show_as_voucher 			= true,
	--voucher_ico					= "",
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_SilverHullResist_ico",
		},
	},
	uiName 		= "Drug_SilverHullResist",
	uiDesc 		= "Drug_SilverHullResist_Desc",
	source_drug	= "Drug_SilverHullResist",
	isBuff		= true,
	hud_visible = true,
}

-- Увеличение резистов щита и корпуса
AccountAura.Drug_TotalResist = 
{
	category					= ai.AccountAuraCategory.DRUG_SLOT_1,
	queue_specs					= nonOWQueueSpecs,
	duration_in_counters 		= 3,
	duration_counter_event		= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 				= true,
	gameplays 					= ai.GameplayGroups.non_open_world,
	
	hull_resist_kinetic_add 	= 5,
	hull_resist_emp_add 		= 5,
	hull_resist_thermal_add 	= 5,
	shield_resist_kinetic_add 	= 5,
	shield_resist_emp_add 		= 5,
	shield_resist_thermal_add 	= 5,
	is_group_wide				= false,
	--show_as_voucher 			= true,
	--voucher_ico					= "",
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_SilverTotalResist_ico",
		},
	},
	uiName 		= "Drug_SilverTotalResist",
	uiDesc 		= "Drug_SilverTotalResist_Desc",
	source_drug	= "Drug_SilverTotalResist",
	isBuff		= true,
	hud_visible = true,
}

-------------------- Consumables SLOT 1 --------------------

-- Лут без учета исхода боя
AccountAura.Drug_LootAssuranceWinLose = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_0,
	queue_specs				= pvpQueueSpecs,
	duration_in_counters 	= 3,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	loot_attempts_add		= 2,
	is_group_wide			= false,
	gameplays 				= ai.GameplayGroups.pvp,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_ExpBoost15_ico",
		},
	},
	uiName 		= "Drug_LootTry",
	uiDesc 		= "Drug_LootTry_Desc",
	source_drug	= "Drug_LootAssuranceWinLose",
	isBuff		= true,
	hud_visible = true,
}

-- Лут без учета исхода боя +1 попытка
AccountAura.Drug_LootAssuranceWinLoseTry = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_0,
	queue_specs				= pvpQueueSpecs,
	duration_in_counters 	= 3,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	loot_attempts_add		= 2,
	is_group_wide			= false,
	gameplays 				= ai.GameplayGroups.pvp,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_ExpBoost15_ico",
		},
	},
	uiName 		= "Drug_LootTry",
	uiDesc 		= "Drug_LootTry_Desc",
	source_drug	= "Drug_LootAssuranceWinLoseTry",
	isBuff		= true,
	hud_visible = true,
}

-- Лут +2 попытки
AccountAura.Drug_LootTry = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_0,
	queue_specs				= pvpQueueSpecs,
	duration_in_counters 	= 3,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	loot_attempts_add		= 2,
	is_group_wide			= false,
	gameplays 				= ai.GameplayGroups.pvp,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_ExpBoost15_ico",
		},
	},
	uiName 		= "Drug_LootTry",
	uiDesc 		= "Drug_LootTry_Desc",
	source_drug	= "Drug_LootTry",
	isBuff		= true,
	hud_visible = true,
}

-- Буст синергии (отключена)
AccountAura.Drug_ExpBoost15 = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_0,
	queue_specs				= nonOWQueueSpecs,
	duration_in_counters 	= 5,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	gameplays 				= ai.GameplayGroups.non_open_world,
	
	experience_reward_mul 	= 0.2,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	is_group_wide			= false,
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_ExpBoost15_ico",
		},
	},
	uiName 		= "Drug_ExpBoost15",
	uiDesc 		= "Drug_ExpBoost15_Desc",
	source_drug	= "Drug_ExpBoost15",
	isBuff		= true,
	hud_visible = true,
}

-- Скорость
AccountAura.Drug_Speed = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_1,
	queue_specs				= nonOWQueueSpecs,
	duration_in_counters 	= 3,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	gameplays 				= ai.GameplayGroups.non_open_world,
	
	max_speed_mul			= 0.05,
	is_group_wide			= false,
	--show_as_voucher 			= true,
	--voucher_ico					= "",
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_SilverSpeed_ico",
		},
	},
	uiName 		= "Drug_SilverSpeed",
	uiDesc 		= "Drug_SilverSpeed_Desc",
	source_drug	= "Drug_SilverSpeed",
	isBuff		= true,
	hud_visible = true,
}

-- Дамаг
AccountAura.Drug_Damage = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_1,
	queue_specs				= nonOWQueueSpecs,
	duration_in_counters 	= 3,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	gameplays 				= ai.GameplayGroups.non_open_world,
	
	damage_mul				= 0.05,
	is_group_wide			= false,
	--show_as_voucher 			= true,
	--voucher_ico					= "",
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_SilverDamage_ico",
		},
	},
	uiName 		= "Drug_SilverDamage",
	uiDesc 		= "Drug_SilverDamage_Desc",
	source_drug	= "Drug_SilverDamage",
	isBuff		= true,
	hud_visible = true,
}

-- Дамаг + скорость
AccountAura.Drug_Overload = 
{
	category				= ai.AccountAuraCategory.DRUG_SLOT_1,
	queue_specs				= nonOWQueueSpecs,
	duration_in_counters 	= 3,
	duration_counter_event 	= ai.AccountAuraCounterEvent.GAME_START,
	is_prolongable 			= true,
	gameplays 				= ai.GameplayGroups.non_open_world,
	
	damage_mul				= 0.04,
	max_speed_mul			= 0.03,
	is_group_wide			= false,
	--show_as_voucher 			= true,
	--voucher_ico					= "",
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_loyalty",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_Overload_ico",
		},
	},
	uiName 		= "Drug_Overload",
	uiDesc 		= "Drug_Overload_Desc",
	source_drug	= "Drug_Overload",
	isBuff		= true,
	hud_visible = true,
}


AccountAura.First_Day_Bundle_Discount = 
{
	category				= ai.AccountAuraCategory.DISCOUNT_BUNDLE,

	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_DailyChest_T1",
	credits_mul				= -1,
	reset_bundle_content	= true,

	ui_ico =
	{
		target =
		{
			tex = "Drug_Overload_ico",
		},
	},
	uiName 		= "First_Day_Bundle_Discount",
	uiDesc 		= "First_Day_Bundle_Discount_Desc",
}

AccountAura.Five_Days_Bundle_Discount =
{
	category				= ai.AccountAuraCategory.DISCOUNT_BUNDLE,

	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_Secret_Chest_T5",
	credits_mul				= -1,
	reset_bundle_content	= true,

	ui_ico =
	{
		target =
		{
			tex = "Drug_Overload_ico",
		},
	},
	uiName = "Five_Days_Bundle_Discount",
	uiDesc = "Five_Days_Bundle_Discount_Desc",
}

AccountAura.Bundle_Parts_T3_Unique_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_Parts_T3_Unique",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_mini",
		},
	},
	uiName 		= "Bundle_Parts_T3_Unique_Discount_name",
	uiDesc 		= "Bundle_Parts_T3_Unique_Discount_Desc",
}

AccountAura.Bundle_Parts_T4_Unique_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_Parts_T4_Unique",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_mini",
		},
	},
	uiName 		= "Bundle_Parts_T4_Unique_Discount_name",
	uiDesc 		= "Bundle_Parts_T4_Unique_Discount_Desc",
}

-- Vouchers

AccountAura.Gold_bonus_test = 
{
	category				= ai.AccountAuraCategory.BUY_GOLD_BONUS,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,
	gold_credits_mul		= 0.5,
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Gold_bonus_test_name",
	uiDesc 		= "Gold_bonus_test_Desc",
}

AccountAura.Equipment_Parts_Visible = 
{
	category				= ai.AccountAuraCategory.NONE,

	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Equipment_Parts_Visible_name",
	uiDesc 		= "Equipment_Parts_Visible_Desc",
}

AccountAura.Parts_T3_Reaper_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_Parts_T3_Reaper_Unique",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Parts_T3_Reaper_Discount_name",
	uiDesc 		= "Parts_T3_Reaper_Discount_Desc",
}

-- Parts Palom, Kite-E, Ghost, Karud 

AccountAura.Parts_T1_Palom_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_Parts_T1_Palom_Unique",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Parts_T1_Palom_Discount_name",
	uiDesc 		= "Parts_T1_Palom_Discount_Desc",
}

AccountAura.Parts_T2_Ghost_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_Parts_T2_Ghost_Unique",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Parts_T2_Ghost_Discount_name",
	uiDesc 		= "Parts_T2_Ghost_Discount_Desc",
}

AccountAura.Parts_T2_KiteE_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_Parts_T2_KiteE_Unique",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Parts_T2_KiteE_Discount_name",
	uiDesc 		= "Parts_T2_KiteE_Discount_Desc",
}

AccountAura.Parts_T5_Karud_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_Parts_T5_Karud_Unique",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Parts_T5_Karud_Discount_name",
	uiDesc 		= "Parts_T5_Karud_Discount_Desc",
}

-- Daily Bonuses
--	loyalty_reward_mul 		= 0.10,
--	experience_reward_mul	= 0.10,
--	credits_reward_mul		= 0.10,
--  show_as_voucher 		= true,

AccountAura.DailySynergy5 = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 3,
	is_prolongable 			= false,
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_sinergy",

	experience_reward_mul	= 0.05,

	--voucher_ico				= "",

	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "DailySynergy5_name",
	uiDesc 		= "DailySynergy5_Desc",
}

AccountAura.DailySynergy15 = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 3,
	is_prolongable 			= false,
	show_as_voucher 		= true,
	voucher_ico				= "voucher_bonus_sinergy",
	
	experience_reward_mul	= 0.15,
	
	--voucher_ico				= "",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "DailySynergy15_name",
	uiDesc 		= "DailySynergy15_Desc",
}

AccountAura.DailySynergy25 = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 3,
	is_prolongable 			= false,
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_sinergy",
	
	experience_reward_mul	= 0.25,
	
	--voucher_ico				= "",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "DailySynergy25_name",
	uiDesc 		= "DailySynergy25_Desc",
}

AccountAura.DailySynergy35 = 
{
	category = ai.AccountAuraCategory.NONE,

	duration_in_hours = 3,
	is_prolongable = false,
	show_as_voucher = true,
	voucher_ico = "voucher_bonus_sinergy",

	experience_reward_mul = 0.35,

	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "DailySynergy35_name",
	uiDesc 		= "DailySynergy35_Desc",
}

AccountAura.DailyCredits5 = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 3,
	is_prolongable 			= false,
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	
	credits_reward_mul		= 0.05,
	
	--voucher_ico				= "",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "DailyCredits5_name",
	uiDesc 		= "DailyCredits5_Desc",
}

AccountAura.DailyCredits15 = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 3,
	is_prolongable 			= false,
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	
	credits_reward_mul		= 0.15,
	
	--voucher_ico				= "",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "DailyCredits15_name",
	uiDesc 		= "DailyCredits15_Desc",
}

AccountAura.DailyCredits25 = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 3,
	is_prolongable 			= false,
	--
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	
	credits_reward_mul		= 0.25,
	
	--voucher_ico				= "",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "DailyCredits25_name",
	uiDesc 		= "DailyCredits25_Desc",
}

AccountAura.DailyCredits35 = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 3,
	is_prolongable 			= false,
	--
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	
	credits_reward_mul		= 0.35,
	
	--voucher_ico				= "",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "DailyCredits35_name",
	uiDesc 		= "DailyCredits35_Desc",
}

AccountAura.Gold_bonus_test = 
{
	category				= ai.AccountAuraCategory.BUY_GOLD_BONUS,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,
	gold_credits_mul		= 0.5,
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Gold_bonus_test_name",
	uiDesc 		= "Gold_bonus_test_Desc",
}

AccountAura.Gold_bonus_25 = 
{
	category				= ai.AccountAuraCategory.BUY_GOLD_BONUS,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,
	gold_credits_mul		= 0.25,
	--is_offer				= true,
	
	--
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_gold",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Gold_bonus_25_name",
	uiDesc 		= "Gold_bonus_25_Desc",
}

AccountAura.Gold_bonus_50 = 
{
	category				= ai.AccountAuraCategory.BUY_GOLD_BONUS,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,
	gold_credits_mul		= 0.5,
	--is_offer				= true,
	--
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_gold",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Gold_bonus_50_name",
	uiDesc 		= "Gold_bonus_50_Desc",
}

 -- New Year 2017 - жирные, короткие ауры в сундук 
 AccountAura.NewYear2017_credits = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 1,
	is_prolongable 			= true,
	
	credits_reward_mul		= 0.25,
	--
	show_as_voucher 		= true,
	voucher_ico				= "voucher_bonus_silver",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "NewYear2017_credits_name",
	uiDesc 		= "NewYear2017_credits_Desc",
}

 AccountAura.NewYear2017_experience = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 1,
	is_prolongable 			= true,
	
	experience_reward_mul	= 0.25,
	--
	show_as_voucher 		= true,
	voucher_ico				= "voucher_bonus_sinergy",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "NewYear2017_experience_name",
	uiDesc 		= "NewYear2017_experience_Desc",
}

AccountAura.NewYear2017_Damage = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 1,
	is_prolongable 			= true,

		--
	show_as_voucher 		= true,
	voucher_ico				= "voucher_Daily_Pvp",
	
	damage_mul				= 0.05,
	is_group_wide			= false,

	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "NewYear2017_Damage_name",
	uiDesc 		= "NewYear2017_Damage_desc",
	
}

AccountAura.NewYear2017_Speed = 
{
	category				= ai.AccountAuraCategory.NONE,

	duration_in_hours 		= 1,
	is_prolongable 			= true,
		--
	show_as_voucher 		= true,
	voucher_ico				= "voucher_Daily_Pvp",
	
	max_speed_mul			= 0.05,
	is_group_wide			= false,
	
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "NewYear2017_Speed_name",
	uiDesc 		= "NewYear2017_Speed_Desc",
}

AccountAura.NewYear2017_ShieldResist = 
{
	category					= ai.AccountAuraCategory.NONE,

	duration_in_hours			= 1,
	is_prolongable 				= true,
		--
	show_as_voucher 			= true,
	voucher_ico					= "voucher_Daily_Pvp",
	
	shield_resist_kinetic_add 	= 10,
	shield_resist_emp_add 		= 10,
	shield_resist_thermal_add 	= 10,
	is_group_wide				= false,
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "NewYear2017_ShieldResist_name",
	uiDesc 		= "NewYear2017_ShieldResist_desc",
}

AccountAura.NewYear2017_HullResist = 
{
	category					= ai.AccountAuraCategory.NONE,

	duration_in_hours			= 1,
	is_prolongable 				= true,
		--
	show_as_voucher 			= true,
	voucher_ico					= "voucher_Daily_Pvp",
	
	hull_resist_kinetic_add 	= 10,
	hull_resist_emp_add 		= 10,
	hull_resist_thermal_add 	= 10,
	is_group_wide				= false,
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "NewYear2017_HullResist_name",
	uiDesc 		= "NewYear2017_HullResist_desc",
}
 
 

AccountAura.sticker_Snowman_chest_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,

	discounted_def			= "Bundle_sticker_Snowman_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_sticker_Snowman_T5_chest_Discount_name",
	uiDesc 		= "Bundle_sticker_Snowman_T5_chest_Discount_Desc",
}

AccountAura.sticker_Sox_14_chest_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,

	discounted_def			= "Bundle_sticker_Sox_14_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_sticker_Sox_14_T5_chest_Discount_name",
	uiDesc 		= "Bundle_sticker_Sox_14_T5_chest_Discount_Desc",
}

AccountAura.sticker_SantaSled_chest_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,

	discounted_def			= "Bundle_sticker_SantaSled_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_sticker_SantaSled_T5_chest_Discount_name",
	uiDesc 		= "Bundle_sticker_SantaSled_T5_chest_Discount_Desc",
}

AccountAura.sticker_Rudolf_chest_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,

	discounted_def			= "Bundle_sticker_Rudolf_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_sticker_Rudolf_T5_chest_Discount_name",
	uiDesc 		= "Bundle_sticker_Rudolf_T5_chest_Discount_Desc",
}

AccountAura.sticker_CristhmasTree_chest_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,

	discounted_def			= "Bundle_sticker_CristhmasTree_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_sticker_CristhmasTree_T5_chest_Discount_name",
	uiDesc 		= "Bundle_sticker_CristhmasTree_T5_chest_Discount_Desc",
}

AccountAura.sticker_SantaPirat_chest_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,

	discounted_def			= "Bundle_sticker_SantaPirat_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_sticker_SantaPirat_T5_chest_Discount_name",
	uiDesc 		= "Bundle_sticker_SantaPirat_T5_chest_Discount_Desc",
}

AccountAura.sticker_Gifts_chest_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,

	discounted_def			= "Bundle_sticker_Gifts_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_sticker_Gifts_T5_chest_Discount_name",
	uiDesc 		= "Bundle_sticker_Gifts_T5_chest_Discount_Desc",
}

AccountAura.sticker_CoockieMan_chest_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,

	discounted_def			= "Bundle_sticker_CoockieMan_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_sticker_CoockieMan_T5_chest_Discount_name",
	uiDesc 		= "Bundle_sticker_CoockieMan_T5_chest_Discount_Desc",
}

AccountAura.Bundle_Iridium_ScrapAttractor_T3_Discount =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_ScrapAttractor_T3",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_Iridium_ScrapAttractor_T3_name",
    uiDesc = "Bundle_IridiumDrop_Discount_desc",
}

AccountAura.Bundle_Iridium_ScrapAttractor_T4_Discount =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_ScrapAttractor_T4",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_Iridium_ScrapAttractor_T4_name",
    uiDesc = "Bundle_IridiumDrop_Discount_desc",
}

AccountAura.Bundle_Iridium_ScrapAttractor_T5_Discount =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_ScrapAttractor_T5",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_Iridium_ScrapAttractor_T5_name",
    uiDesc = "Bundle_IridiumDrop_Discount_desc",
}

-- 1april chests

AccountAura.Bundle_GiftsforSale_1april_day1_bundle = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 1,

	discounted_def			= "Bundle_GiftsforSale_1april_day1_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_GiftsforSale_1april_T5_chest_name",
	uiDesc 		= "Bundle_GiftsforSale_1april_T5_chest_desc",
}

AccountAura.Bundle_GiftsforSale_1april_day2_bundle = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 1,

	discounted_def			= "Bundle_GiftsforSale_1april_day2_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_GiftsforSale_1april_T5_chest_name",
	uiDesc 		= "Bundle_GiftsforSale_1april_T5_chest_desc",
}

AccountAura.Bundle_GiftsforSale_1april_day3_bundle = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 1,

	discounted_def			= "Bundle_GiftsforSale_1april_day3_T5_chest",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_GiftsforSale_1april_T5_chest_name",
	uiDesc 		= "Bundle_GiftsforSale_1april_T5_chest_desc",
}

-- Ауры для сундуков, которые выдаются в оферах -- 


AccountAura.Bundle_StarterPack_Offer_T3_chest = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 48,
	is_offer				= true,

	discounted_def			= "Bundle_StarterPack_Offer_T3_chest_real",
	gold_credits_mul		= 0,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	voucher_ico 			= "bandle_42_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_StarterPack_Offer_T3_chest_name",
	uiDesc 		= "Bundle_StarterPack_Offer_T3_chest_desc",
}

AccountAura.Bundle_Rank8_BoosterPack_Offer_T3_chest = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 48,
	is_offer				= true,

	discounted_def			= "Bundle_Rank8_BoosterPack_Offer_T3_chest_real",
	gold_credits_mul		= 0,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	voucher_ico 			= "bandle_44_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_Rank8_BoosterPack_Offer_T3_chest_name",
	uiDesc 		= "Bundle_Rank8_BoosterPack_Offer_T3_chest_desc",
}

AccountAura.Bundle_Rank8_SupressorPack_Offer_T3_chest = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 48,
	is_offer				= true,	

	discounted_def			= "Bundle_Rank8_SupressorPack_Offer_T3_chest_real",
	gold_credits_mul		= 0,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	voucher_ico 			= "bandle_43_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Bundle_Rank8_SupressorPack_Offer_T3_chest_name",
	uiDesc 		= "Bundle_Rank8_SupressorPack_Offer_T3_chest_desc",
}

AccountAura.Gold_bonus_offer_25 = 
{
	category				= ai.AccountAuraCategory.BUY_GOLD_BONUS,
	
	duration_in_hours 		= 48,
	is_prolongable 			= false,
	gold_credits_mul		= 0.25,
	is_offer				= true,
	
	--
	--show_as_voucher 			= true,
	voucher_ico					= "gold_25_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Gold_bonus_25_name",
	uiDesc 		= "Gold_bonus_25_Desc",
}

AccountAura.Gold_bonus_offer_50 = 
{
	category				= ai.AccountAuraCategory.BUY_GOLD_BONUS,
	
	duration_in_hours 		= 48,
	is_prolongable 			= false,
	gold_credits_mul		= 0.5,
	is_offer				= true,
	--
	--show_as_voucher 			= true,
	voucher_ico					= "gold_50_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Gold_bonus_50_name",
	uiDesc 		= "Gold_bonus_50_Desc",
}

AccountAura.Event_credits_discount_50 = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 3,
	is_prolongable 			= false,
	is_offer 				= true,
	reset_bundle_content	= true,
	
	discounted_def			= "Bundle_NY2017_T1_Exchange_sale",
	gold_credits_mul		= -0.5,
	voucher_ico				= "prem_discount_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_Overload_ico",
		},
	},
	
	uiName 		= "Event_credits_discount_50_Name",
	uiDesc 		= "Event_credits_discount_50_Desc",
}

AccountAura.Event_credits_discount_50_2 = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 3,
	is_prolongable 			= false,
	is_offer 				= true,
	reset_bundle_content	= true,
	
	discounted_def			= "Bundle_NY2017_T1_Exchange_sale_2",
	gold_credits_mul		= -0.5,
	voucher_ico				= "prem_discount_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "Drug_Overload_ico",
		},
	},
	
	uiName 		= "Event_credits_discount_50_Name",
	uiDesc 		= "Event_credits_discount_50_Desc",
}

AccountAura.Returned_boost_50 = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 24,
	is_prolongable 			= false,
	--is_offer 				= true,
	
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	
	experience_reward_mul	= 0.5,
	credits_reward_mul		= 0.5,
	
	--voucher_ico				= "",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Returned_boost_50_name",
	uiDesc 		= "Returned_boost_50_desc",
}

AccountAura.Palom_new_player = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 24,
	is_offer				= true,
	
	discounted_def			= "Bundle_PalomMKII_details",
	gold_credits_mul		= 0,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	voucher_ico 			= "bandle_44_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Palom_new_player_name",
	uiDesc 		= "Palom_new_player_desc",
}

AccountAura.Rank_9_builds_Sai = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 48,
	is_offer				= false,	

	discounted_def			= "Bundle_Sai_Build",
	gold_credits_mul		= 0,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	voucher_ico 			= "bandle_44_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Rank_9_builds_Sai_name",
	uiDesc 		= "Rank_9_builds_Sai_desc",
}

AccountAura.Rank_9_builds_Styx = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 48,
	is_offer				= false,	

	discounted_def			= "Bundle_Styx_Build",
	gold_credits_mul		= 0,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	voucher_ico 			= "bandle_44_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Rank_9_builds_Styx_name",
	uiDesc 		= "Rank_9_builds_Styx_desc",
}

AccountAura.Rank_9_builds_Parallax = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 48,
	is_offer				= false,	

	discounted_def			= "Bundle_Parallax_Build",
	gold_credits_mul		= 0,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	voucher_ico 			= "bandle_44_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Rank_9_builds_Parallax_name",
	uiDesc 		= "Rank_9_builds_Parallax_desc",
}

AccountAura.Rank_9_builds_NukemI = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 48,
	is_offer				= false,	

	discounted_def			= "Bundle_NukemI_Build",
	gold_credits_mul		= 0,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	voucher_ico 			= "bandle_44_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Rank_9_builds_NukemI_name",
	uiDesc 		= "Rank_9_builds_NukemI_desc",
}

AccountAura.Rank_9_builds_All = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 48,
	is_offer				= true,	

	discounted_def			= "Rank_9_builds_auras",
	gold_credits_mul		= 0,
	reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	voucher_ico 			= "bandle_44_sml",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "Rank_9_builds_All_name",
	uiDesc 		= "Rank_9_builds_All_desc",
}

-- Здесь оферые ауры заканчиваются --

AccountAura.Bundle_GreenScoutNodes_T2_StarterPack_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours  	    = 168,

	discounted_def			= "Bundle_GreenScoutNodes_T2_StarterPack",
	gold_credits_mul		= 0,
	--reset_bundle_content	= true,
	big_ico					= "bundle_gold_aura",
	
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_GreenScoutNodes_T2_StarterPack_Discount_name",
	uiDesc 		= "Bundle_GreenScoutNodes_T2_StarterPack_Discount_desc",
}

AccountAura.Bundle_GreenScoutCabine_T2_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 3,
	discounted_def			= "Bundle_GreenScoutCabine_T2",
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_GreenScoutCabine_T2_Discount_name",
	uiDesc 		= "Bundle_GreenScoutCabine_T2_Discount_desc",
}

AccountAura.Bundle_GreenScoutCabine_T3_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 3,
	discounted_def			= "Bundle_GreenScoutCabine_T3",
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_GreenScoutCabine_T3_Discount_name",
	uiDesc 		= "Bundle_GreenScoutCabine_T3_Discount_desc",
}

AccountAura.Bundle_GreenEngineerCabine_T3_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 3,
	discounted_def			= "Bundle_GreenEngineerCabine_T3",
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_GreenEngineerCabine_T3_Discount_name",
	uiDesc 		= "Bundle_GreenEngineerCabine_T3_Discount_desc",
}

AccountAura.Bundle_RailVolcano_T2_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_RailVolcano_T2",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_RailVolcano_T2_name",
    uiDesc = "Bundle_RailVolcano_T2_Active_desc",
}

AccountAura.Bundle_RailVolcano_T3_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_RailVolcano_T3",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_RailVolcano_T3_name",
    uiDesc = "Bundle_RailVolcano_T3_Active_desc",
}

AccountAura.Bundle_RailVolcano_T4_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_RailVolcano_T4",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_RailVolcano_T4_name",
    uiDesc = "Bundle_RailVolcano_T4_Active_desc",
}

AccountAura.Bundle_RailVolcano_T5_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_RailVolcano_T5",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_RailVolcano_T5_name",
    uiDesc = "Bundle_RailVolcano_T5_Active_desc",
}

AccountAura.Bundle_GreenScoutAbility_1_T5_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_GreenScoutAbility_1_T5",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_GreenScoutAbility_1_T5_Active_name",
    uiDesc = "Bundle_GreenScoutAbility_1_T5_Active_desc",
}

AccountAura.Bundle_GreenScoutAbility_2_T5_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_GreenScoutAbility_2_T5",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_GreenScoutAbility_2_T5_Active_name",
    uiDesc = "Bundle_GreenScoutAbility_2_T5_Active_desc",
}

AccountAura.Bundle_GreenScoutAbility_3_T5_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_GreenScoutAbility_3_T5",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_GreenScoutAbility_3_T5_Active_name",
    uiDesc = "Bundle_GreenScoutAbility_3_T5_Active_desc",
}

AccountAura.Bundle_GreenScoutAbility_4_T5_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_GreenScoutAbility_4_T5",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_GreenScoutAbility_4_T5_Active_name",
    uiDesc = "Bundle_GreenScoutAbility_4_T5_Active_desc",
}

AccountAura.BonusCredits50 = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours 		= 3,
	is_prolongable 			= false,
	show_as_voucher 		= true,
	voucher_ico				= "voucher_bonus_silver",
	credits_reward_mul		= 0.5,
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "BonusCredits50_name",
	uiDesc 		= "BonusCredits50_Desc",
}


AccountAura.BonusSynergy50 = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours 		= 3,
	is_prolongable 			= false,
	show_as_voucher 		= true,
	voucher_ico				= "voucher_bonus_sinergy",
	experience_reward_mul	= 0.5,
	ui_ico =
	{
		target =
		{
			tex = "bundle_gold_aura",
		},
	},
	uiName 		= "BonusSynergy50_name",
	uiDesc 		= "BonusSynergy50_Desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest1_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest1",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest1_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest2_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest2",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest2_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest3_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest3",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest3_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest4_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest4",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest4_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest5_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest5",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest5_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest6_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest6",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest6_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest7_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest7",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest7_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest8_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest8",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest8_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest9_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest9",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest9_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest10_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest10",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest10_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_NY2018_Pizza_T1_Chest11_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_NY2018_Pizza_T1_Chest11",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_aura", }, },
	uiName 		= "Bundle_NY2018_Pizza_T1_Chest11_name",
	uiDesc 		= "Bundle_NY2018_Pizza_T1_Chest1_desc",
}

AccountAura.Bundle_LevelUp_T5_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	duration_in_hours  	    = 168,
	discounted_def			= "Bundle_LevelUp_T5",
	gold_credits_mul		= -1,
	big_ico					= "bundle_gold_aura",
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
	uiName 		= "Bundle_LevelUp_T5_name",
	uiDesc 		= "Bundle_LevelUp_T5_desc",
}

-- New Raid Rewards
AccountAura.Bundle_GreenScoutAbility_v2_1_T5_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_GreenScoutAbility_v2_1_T5",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_GreenScoutAbility_1_T5_Active_name",
    uiDesc = "Bundle_GreenScoutAbility_1_T5_Active_desc",
}

AccountAura.Bundle_GreenScoutAbility_v2_3_T5_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_GreenScoutAbility_v2_3_T5",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_GreenScoutAbility_3_T5_Active_name",
    uiDesc = "Bundle_GreenScoutAbility_3_T5_Active_desc",
}

-- Special Ships
--
AccountAura.Bundle_Tokens_Gargoyle_T4_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_Tokens_Gargoyle_T4",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tokens_Gargoyle_T4_Active_name",
    uiDesc = "Bundle_Tokens_Gargoyle_T4_Active_desc",
}

--
AccountAura.Bundle_Tokens_Dart_T4_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_Tokens_Dart_T4",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tokens_Dart_T4_Active_name",
    uiDesc = "Bundle_Tokens_Dart_T4_Active_desc",
}

--
AccountAura.Bundle_Tokens_Spiral_T4_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_Tokens_Spiral_T4",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tokens_Spiral_T4_Active_name",
    uiDesc = "Bundle_Tokens_Spiral_T4_Active_desc",
}

--
AccountAura.Bundle_Tokens_Shuttle_T4_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_Tokens_Shuttle_T4",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tokens_Shuttle_T4_Active_name",
    uiDesc = "Bundle_Tokens_Shuttle_T4_Active_desc",
}

AccountAura.Bundle_GreenScoutAbility_v2_2_T5_Active =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 3,
    is_prolongable      = false,
    discounted_def      = "Bundle_GreenScoutAbility_v2_2_T5",
    ui_ico = { target = { tex = "bundle_ellidium_mini", }, },
    uiName = "Bundle_GreenScoutAbility_2_T5_Active_name",
    uiDesc = "Bundle_GreenScoutAbility_2_T5_Active_desc",
}

-- аура для квестов на спецмодули для кораблей
AccountAura.Equipment_Parts_Discount = 
{
	category				= ai.AccountAuraCategory.NONE,
	
	duration_in_hours 		= 18,
	is_prolongable 			= false,

	discounted_def			= "Bundle_Vessel_Equipment_Parts_T5",
	gold_credits_mul		= -1,
	reset_bundle_content	= true,
	big_ico					= "bundle_silver_aura",
	
	ui_ico =
	{
		target =
		{
			tex = "bundle_silver_mini",
		},
	},
	uiName 		= "Equipment_Parts_Discount_name",
	uiDesc 		= "Equipment_Parts_Discount_Desc",
}

AccountAura.Bundle_Iridium_Overseer_T3_1_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T3_1",
}

AccountAura.Bundle_Iridium_Overseer_T3_2_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T3_2",
}

AccountAura.Bundle_Iridium_Overseer_T4_1_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T4_1",
}

AccountAura.Bundle_Iridium_Overseer_T4_2_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T4_2",
}

AccountAura.Bundle_Iridium_Overseer_T4_3_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T4_3",
}

AccountAura.Bundle_Iridium_Overseer_T5_1_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T5_1",
}

AccountAura.Bundle_Iridium_Overseer_T5_2_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T5_2",
}

AccountAura.Bundle_Iridium_Overseer_T5_3_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T5_3",
}

AccountAura.Bundle_Iridium_Overseer_T5_4_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T5_4",
}

AccountAura.Bundle_Iridium_Overseer_T5_5_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T5_5",
}

AccountAura.Bundle_Iridium_Overseer_T5_6_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T5_6",
}

AccountAura.Bundle_Iridium_Overseer_T5_7_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T5_7",
}

AccountAura.Bundle_Iridium_Overseer_T5_8_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Iridium_Overseer_T5_8",
}

AccountAura.Bundle_Daily_Pvp_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Daily_Pvp",
}

AccountAura.Bundle_Daily_Raid_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Daily_Raid",
}

AccountAura.Bundle_Daily_Pve_open =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 18,
    is_prolongable      = false,
    discounted_def      = "Bundle_Daily_Pve",
}

AccountAura.BattlePassCredits10 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 10,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCredits10_name",
    uiDesc = "BattlePassCredits10_desc",
}

AccountAura.BattlePassExp10 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 10,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp10_name",
    uiDesc = "BattlePassExp10_desc",
}

AccountAura.BattlePassCredits15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCredits15_name",
    uiDesc = "BattlePassCredits15_desc",
}

AccountAura.BattlePassExp15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp15_name",
    uiDesc = "BattlePassExp15_desc",
}

AccountAura.BattlePassCredits20 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 20,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCredits20_name",
    uiDesc = "BattlePassCredits20_desc",
}

AccountAura.BattlePassExp20 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 20,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp20_name",
    uiDesc = "BattlePassExp20_desc",
}

AccountAura.BattlePassCredits30 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 30,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCredits30_name",
    uiDesc = "BattlePassCredits30_desc",
}

AccountAura.BattlePassExp30 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 30,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp30_name",
    uiDesc = "BattlePassExp30_desc",
}

AccountAura.BattlePassCreditsExp30 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 30,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,
	experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCreditsExp30_name",
    uiDesc = "BattlePassCreditsExp30_desc",
}

AccountAura.GoldShipForFree = -- Аура на корабль из 35 этапа Батлпасса (1я фаза) 
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_hours = 72,
    alt_discounted_defs =
    {
        "Ship_Race1_S_T1_Premium",
        "Ship_Race1_L_T1_Premium",
        "Ship_Race1_S_T2_Premium",
        "Ship_Race1_M_T2_Premium",
        "Ship_Race1_L_T2_Premium",
        "Ship_Race1_S_T3_Premium",
        "Ship_Race1_M_T3_Premium",
        "Ship_Race1_L_T3_Premium",
        "Ship_Race1_S_T4_Premium",
        "Ship_Race1_M_T4_Premium",
        "Ship_Race1_L_T4_Premium",
        "Ship_Race1_S_T5_Premium",
        "Ship_Race1_M_T5_Premium",
        "Ship_Race1_L_T5_Premium",
        "Ship_Race2_S_T1_Premium",
        "Ship_Race2_M_T1_Premium",
        "Ship_Race2_S_T2_Premium",
        "Ship_Race2_M_T2_Premium",
        "Ship_Race2_L_T2_Premium",
        "Ship_Race2_S_T3_Premium",
        "Ship_Race2_M_T3_Premium",
        "Ship_Race2_L_T3_Premium",
        "Ship_Race2_S_T4_Premium",
        "Ship_Race2_M_T4_Premium",
        "Ship_Race2_L_T4_Premium",
        "Ship_Race2_M_T5_Premium",
        "Ship_Race2_L_T5_Premium",
        "Ship_Race3_M_T1_Premium",
        "Ship_Race3_L_T1_Premium",
        "Ship_Race3_S_T2_Premium",
        "Ship_Race3_M_T2_Premium",
        "Ship_Race3_L_T2_Premium",
        "Ship_Race3_S_T3_Premium",
        "Ship_Race3_M_T3_Premium",
        "Ship_Race3_L_T3_Premium",
        "Ship_Race3_S_T4_Premium",
        "Ship_Race3_M_T4_Premium",
        "Ship_Race3_L_T4_Premium",
        "Ship_Race3_S_T5_Premium",
        "Ship_Race3_M_T5_Premium",
        "Ship_Race3_L_T5_Premium",
		"Ship_Race2_L_T3_PremUniq",
		"Ship_Race1_M_T4_Steam",
		"Ship_Race1_S_T3_Pirate",
		"Ship_Race2_L_T1_Premium",
		"Ship_Race2_S_T4_Pirate",
		"Ship_Race2_M_T4_Pirate",
		"Ship_Race2_M_T2_Steam",
		--"Ship_Race3_M_T3_Steam", -- Bear, R16
		"Ship_Race2_M_T3_Steam",
		"Ship_Race1_M_T3_Steam",
		"Ship_Race2_L_T2_Steam",
		"Ship_Race1_S_T4_Glass",
		"Ship_Race1_M_T4_Glass",
		"Ship_Race1_L_T4_Glass",
		"Ship_Race2_S_T4_Glass",
		"Ship_Race2_M_T4_Glass",
		"Ship_Race2_L_T4_Glass",
		"Ship_Race3_S_T4_Glass",
		"Ship_Race3_M_T4_Glass",
		"Ship_Race3_L_T4_Glass",
		"Bundle_GoldShips_Monocrystals",
		"Bundle_GoldShips_AliensShipParts",
		-- Корабли добавленные на "Финальный сезон" (BP24 / SUM26. Лето 2026. FREEWARE.)
		"Ship_Race1_S_T2_Steam", 	-- Wasp
		"Ship_Race1_M_T1_Dlc", 		-- Dainsleif
		"Ship_Race1_M_T3_Dlc", 		-- Veils
		"Ship_Race1_M_T2_Pirate", 	-- Shark
		"Ship_Race1_L_T3_Pirate", 	-- Phoenix
		"Ship_Race3_S_T1_Dlc", 		-- Pterosaur
		"Ship_Race3_S_T2_Steam", 	-- Superkite
		"Ship_Race3_S_T3_Dlc", 		-- Jellyfish
		"Ship_Race3_M_T2_Pirate", 	-- Joker
		"Ship_Race3_L_T4_Snow", 	-- Polar Bear
		"Ship_Race2_S_T3_Pirate", 	-- Nyx
		"Ship_Race2_L_T3_Dlc", 		-- Langsax
		"Ship_Race2_L_T5_Steam", 	-- Mauler
		"Ship_Race2_S_T5_Doctor", 	-- PlagueDoctor
    },
    gold_credits_mul = -1,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "GoldShipForFree_name",
    uiDesc = "GoldShipForFree_desc",
}

AccountAura.GoldShipForFree2 = -- Аура на корабль из 35 этапа Батлпасса (2я фаза)
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_hours = 72,
    alt_discounted_defs =
    {
        "Ship_Race1_S_T1_Premium",
        "Ship_Race1_L_T1_Premium",
        "Ship_Race1_S_T2_Premium",
        "Ship_Race1_M_T2_Premium",
        "Ship_Race1_L_T2_Premium",
        "Ship_Race1_S_T3_Premium",
        "Ship_Race1_M_T3_Premium",
        "Ship_Race1_L_T3_Premium",
        "Ship_Race1_S_T4_Premium",
        "Ship_Race1_M_T4_Premium",
        "Ship_Race1_L_T4_Premium",
        "Ship_Race1_S_T5_Premium",
        "Ship_Race1_M_T5_Premium",
        "Ship_Race1_L_T5_Premium",
        "Ship_Race2_S_T1_Premium",
        "Ship_Race2_M_T1_Premium",
        "Ship_Race2_S_T2_Premium",
        "Ship_Race2_M_T2_Premium",
        "Ship_Race2_L_T2_Premium",
        "Ship_Race2_S_T3_Premium",
        "Ship_Race2_M_T3_Premium",
        "Ship_Race2_L_T3_Premium",
        "Ship_Race2_S_T4_Premium",
        "Ship_Race2_M_T4_Premium",
        "Ship_Race2_L_T4_Premium",
        "Ship_Race2_M_T5_Premium",
        "Ship_Race2_L_T5_Premium",
        "Ship_Race3_M_T1_Premium",
        "Ship_Race3_L_T1_Premium",
        "Ship_Race3_S_T2_Premium",
        "Ship_Race3_M_T2_Premium",
        "Ship_Race3_L_T2_Premium",
        "Ship_Race3_S_T3_Premium",
        "Ship_Race3_M_T3_Premium",
        "Ship_Race3_L_T3_Premium",
        "Ship_Race3_S_T4_Premium",
        "Ship_Race3_M_T4_Premium",
        "Ship_Race3_L_T4_Premium",
        "Ship_Race3_S_T5_Premium",
        "Ship_Race3_M_T5_Premium",
        "Ship_Race3_L_T5_Premium",
		"Ship_Race2_L_T3_PremUniq",
		"Ship_Race1_M_T4_Steam",
		"Ship_Race1_S_T3_Pirate",
		"Ship_Race2_L_T1_Premium",
		"Ship_Race2_S_T4_Pirate",
		"Ship_Race2_M_T4_Pirate",
		"Ship_Race2_M_T2_Steam",
		--"Ship_Race3_M_T3_Steam", -- Bear, R16
		"Ship_Race2_M_T3_Steam",
		"Ship_Race1_M_T3_Steam",	
		"Ship_Race2_L_T2_Steam",
		"Ship_Race1_S_T4_Glass",
		"Ship_Race1_M_T4_Glass",
		"Ship_Race1_L_T4_Glass",
		"Ship_Race2_S_T4_Glass",
		"Ship_Race2_M_T4_Glass",
		"Ship_Race2_L_T4_Glass",
		"Ship_Race3_S_T4_Glass",
		"Ship_Race3_M_T4_Glass",
		"Ship_Race3_L_T4_Glass",		
		"Bundle_GoldShips_Monocrystals2",
		"Bundle_GoldShips_AliensShipParts2",
		-- Корабли добавленные на "Финальный сезон" (BP24 / SUM26. Лето 2026. FREEWARE.)
		"Ship_Race1_S_T2_Steam", 	-- Wasp
		"Ship_Race1_M_T1_Dlc", 		-- Dainsleif
		"Ship_Race1_M_T3_Dlc", 		-- Veils
		"Ship_Race1_M_T2_Pirate", 	-- Shark
		"Ship_Race1_L_T3_Pirate", 	-- Phoenix
		"Ship_Race3_S_T1_Dlc", 		-- Pterosaur
		"Ship_Race3_S_T2_Steam", 	-- Superkite
		"Ship_Race3_S_T3_Dlc", 		-- Jellyfish
		"Ship_Race3_M_T2_Pirate", 	-- Joker
		"Ship_Race3_L_T4_Snow", 	-- Polar Bear
		"Ship_Race2_S_T3_Pirate", 	-- Nyx
		"Ship_Race2_L_T3_Dlc", 		-- Langsax
		"Ship_Race2_L_T5_Steam", 	-- Mauler
		"Ship_Race2_S_T5_Doctor", 	-- PlagueDoctor		
    },
    gold_credits_mul = -1,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "GoldShipForFree_name",
    uiDesc = "GoldShipForFree_desc",
}

-- аура за победу в клановой войне #SC-111857
AccountAura.Bundle_ClanWar_Win =
{
    category            = ai.AccountAuraCategory.NONE,
    duration_in_hours   = 24,
    is_prolongable      = false,
    discounted_def      = "Bundle_ClanWar_Win",
	credits_mul			= -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
	uiName 		= "Bundle_ClanWar_Win_chest_name",
	uiDesc 		= "Bundle_ClanWar_Win_chest_desc",
}

AccountAura.HalloweenBoost =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_hours = 24 * 3,
    is_prolongable = true,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",

    credits_reward_mul = 0.666,
    experience_reward_mul = 0.666,

    ui_ico = { target = { tex = "bundle_gold_aura", }, },
    uiName = "HalloweenBoost_name",
    uiDesc = "HalloweenBoost_desc",
}

-- Бандл созданный в качестве награду за квест, вместо 500 голды
-- SC-112339 Аналог замены вознаграждения за 500 ГС
AccountAura.Bundle_QuestGoldReplacer =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 3,
    is_prolongable = false,
    discounted_def = "Bundle_QuestGoldReplacer",
    credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_QuestGoldReplacer_name",
    uiDesc = "Bundle_QuestGoldReplacer_desc",
}

-- Event Quests Auras

AccountAura.Bundle_QuestEvent_Birthday2020 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24 * 3,
    is_prolongable = false,
    discounted_def = "Bundle_QuestEvent_Birthday2020",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_QuestEvent_Birthday2020_name",
    uiDesc = "Bundle_QuestEvent_Birthday2020_desc",
}

AccountAura.Bundle_QuestEvent_StayHome =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_QuestEvent_StayHome",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_QuestEvent_StayHome_name",
    uiDesc = "Bundle_QuestEvent_StayHome_desc",
}

-- SC-113081 Новый набор "Star Conflict: Набор Сид-Чипов и 30 дней премиум лицензии"

AccountAura.DLCCredExp60 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 60,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,
	experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "DLCCredExp60_name",
    uiDesc = "DLCCredExp60_desc",
}

-- SC-113082 Новый набор "Star Conflict: Набор редких Сид-Чипов и 30 дней премиум лицензии"

AccountAura.DLCCredExp120 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 60,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,
	experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "DLCCredExp120_name",
    uiDesc = "DLCCredExp120_desc",
}

-- SC-113270 Монетизация. Сделать премиум с квестом на ГС

AccountAura.Golden_Quest =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_hours = 24 * 30,
    is_prolongable = true,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_gold",
    uiName = "Golden_Quest_name",
    uiDesc = "Golden_Quest_desc",
}

AccountAura.Golden_Aura_BattlePass =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_hours = 24 * 30,
    is_prolongable = true,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_gold",
    uiName = "Golden_Aura_BattlePass_name",
    uiDesc = "Golden_Aura_BattlePass_desc",
}

-- SC-113750 Наборы бустеров
AccountAura.BoosterPack_Silver =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 60,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

	experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_sinergy",
    uiName = "BoosterPack_Silver_name",
    uiDesc = "BoosterPack_Silver_desc",
}

AccountAura.BoosterPack_Gold =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 60,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

	credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BoosterPack_Gold_name",
    uiDesc = "BoosterPack_Gold_desc",
}

AccountAura.BoosterPack_Platinum =
{
    category = ai.AccountAuraCategory.NONE,
	
	duration_in_counters = 180,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

	credits_reward_mul = 0.5,
	experience_reward_mul = 0.5,
	loot_attempts_add		= 1,
	
	gameplays = ai.GameplayGroups.non_open_world,
	
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BoosterPack_Platinum_name",
    uiDesc = "BoosterPack_Platinum_desc",
}

--  SC-114144 Новичкове DLC First time
AccountAura.DLCCredExp50_1 =
{
    category = ai.AccountAuraCategory.NONE,
	
	duration_in_counters = 50,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

	credits_reward_mul = 0.5,
	experience_reward_mul = 0.5,
	
	gameplays = ai.GameplayGroups.non_open_world,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "DLCCredExp50_name",
    uiDesc = "DLCCredExp50_desc",
}

AccountAura.DLCCredExp50_2 =
{
    category = ai.AccountAuraCategory.NONE,
	
	duration_in_counters = 50,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

	credits_reward_mul = 0.5,
	experience_reward_mul = 0.5,
	
	gameplays = ai.GameplayGroups.non_open_world,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "DLCCredExp50_name",
    uiDesc = "DLCCredExp50_desc",
}

-- SC-114148 Марафон заданий на разогревочный ивент к хеллоувину
AccountAura.LootAttempts15 =
{
    category = ai.AccountAuraCategory.NONE,
	
	duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

	loot_attempts_add		= 1,
	gameplays = ai.GameplayGroups.non_open_world,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "LootAttempts15_name",
    uiDesc = "LootAttempts15_desc",
}
AccountAura.Credits50x15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCredits15_name",
    uiDesc = "BattlePassCredits15_desc",
}
AccountAura.Exp50x15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp15_name",
    uiDesc = "BattlePassExp15_desc",
}

AccountAura.Bundle_Halloween_2020_1 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Halloween_2020_1",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_1_desc",
}

AccountAura.Bundle_Halloween_2020_2 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Halloween_2020_2",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_2_desc",
}

AccountAura.Bundle_Halloween_2020_3 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Halloween_2020_3",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_3_desc",
}

AccountAura.Bundle_Halloween_2020_4 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Halloween_2020_4",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_4_desc",
}

AccountAura.Bundle_Halloween_2020_5 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Halloween_2020_5",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_5_desc",
}

AccountAura.Bundle_Halloween_2020_6 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Halloween_2020_6",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_6_desc",
}

AccountAura.Bundle_Halloween_2020_7 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Halloween_2020_7",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Halloween_2020_name",
    uiDesc = "Bundle_Halloween_2020_7_desc",
}

AccountAura.Bundle_Halloween_2020_FINAL =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Halloween_2020_Final",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Halloween_2020_FINAL_name",
    uiDesc = "Bundle_Halloween_2020_FINAL_desc",
}
-- ауры для получения новогодних пушек
AccountAura.Bundle_NEW2021YEAR_GUN_1 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NEW2021YEAR_GUN_1",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bandle_41", }, },
    uiName = "Bundle_NEW2021YEAR_GUN_1_name",
    uiDesc = "Aura_NEW2021YEAR_GUN_desc",
}

AccountAura.Bundle_NEW2021YEAR_GUN_2 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NEW2021YEAR_GUN_2",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bandle_41", }, },
    uiName = "Bundle_NEW2021YEAR_GUN_2_name",
    uiDesc = "Aura_NEW2021YEAR_GUN_desc",
}

AccountAura.Bundle_NEW2021YEAR_GUN_3 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NEW2021YEAR_GUN_3",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bandle_41", }, },
    uiName = "Bundle_NEW2021YEAR_GUN_3_name",
    uiDesc = "Aura_NEW2021YEAR_GUN_desc",
}
-- ауры для новогоднего марафона (начало блока) 

AccountAura.Bundle_NewYear_2021_1 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NewYear_2021_1",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_1_desc",
}

AccountAura.Bundle_NewYear_2021_2 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NewYear_2021_2",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_2_desc",
}

AccountAura.Bundle_NewYear_2021_3 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NewYear_2021_3",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_3_desc",
}

AccountAura.Bundle_NewYear_2021_4 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NewYear_2021_4",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_4_desc",
}

AccountAura.Bundle_NewYear_2021_5 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NewYear_2021_5",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_5_desc",
}

AccountAura.Bundle_NewYear_2021_6 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NewYear_2021_6",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_6_desc",
}

AccountAura.Bundle_NewYear_2021_7 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NewYear_2021_7",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_NewYear_2021_name",
    uiDesc = "Bundle_NewYear_2021_7_desc",
}

AccountAura.Bundle_NewYear_2021_FINAL =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_NewYear_2021_Final",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_NewYear_2021_FINAL_name",
    uiDesc = "Bundle_NewYear_2021_FINAL_desc",
}

AccountAura.NewYearExp15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp15_name",
    uiDesc = "BattlePassExp15_desc",
}

AccountAura.NewYearCredits15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCredits15_name",
    uiDesc = "BattlePassCredits15_desc",
}

AccountAura.NewYearLootAttempts15 =
{
    category = ai.AccountAuraCategory.NONE,
	
	duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

	loot_attempts_add		= 1,
	gameplays = ai.GameplayGroups.non_open_world,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "LootAttempts15_name",
    uiDesc = "LootAttempts15_desc",
}
-- ауры для новогоднего марафона (конец блока)

AccountAura.AsteroidPremiumLoot10 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_hours = 240,
    is_prolongable = true,

	asteroid_premium_loot_crate = true,

    show_as_voucher = true,
    voucher_ico = "voucher_asteroid_premium_loot",
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "AsteroidPremiumLoot10_name",
    uiDesc = "AsteroidPremiumLoot10_desc",
}

AccountAura.DLCCredExp30 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 30,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,
	experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "DLCCredExp_name",
    uiDesc = "DLCCredExp30_desc",
}

AccountAura.DLCCredExp100 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 100,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,
	experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "DLCCredExp_name",
    uiDesc = "DLCCredExp100_desc",
}

AccountAura.BattlePass_AditionalCell_SUM2026 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_hours = 24 * 90,
	only_for_battle_pass = true,
	
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_aditional_cell",
    uiName = "BattlePass_AditionalCell_name",
    uiDesc = "BattlePass_AditionalCell_desc",
}

AccountAura.BattlePass_AditionalCell_CredBoost =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_hours = 24 * 1,
    is_prolongable = true,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",

    credits_reward_mul = 4.0,

    ui_ico = { target = { tex = "bundle_gold_aura", }, },
    uiName = "BattlePass_AditionalCell_CredBoost_name",
    uiDesc = "BattlePass_AditionalCell_CredBoost_desc",
}

AccountAura.BattlePass_EventCred50_NY23 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24 * 90,
	only_for_battle_pass = true,

    imaginary_reward_mul = 1.0,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "BattlePass_EventCred50_name",
    uiDesc = "BattlePass_EventCred50_desc",
}

AccountAura.FootballTrophys22 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_FootballTrophys22",
    },
    gold_credits_mul = -1,
	
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "FootballTrophys21_name",
    uiDesc = "FootballTrophys21_desc",
}

AccountAura.Bundle_ProtazanEvent =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24*15,

	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_ProtazanEvent_name",
    uiDesc = "Bundle_ProtazanEvent_desc",
}

-- Ауры для квестов на поиск сокровищ, награды
AccountAura.TreasureMap_1 =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_BP22_Treasure_1",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_TreasureMap_name",
    uiDesc = "Aura_TreasureMap_desc",
}
AccountAura.TreasureMap_2 =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_BP22_Treasure_2",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_TreasureMap_name",
    uiDesc = "Aura_TreasureMap_desc",
}
AccountAura.TreasureMap_3 =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_BP22_Treasure_3",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_TreasureMap_name",
    uiDesc = "Aura_TreasureMap_desc",
}
AccountAura.TreasureMap_4 =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_BP22_Treasure_4",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_TreasureMap_name",
    uiDesc = "Aura_TreasureMap_desc",
}
AccountAura.TreasureMap_5 =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_BP22_Treasure_5",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_TreasureMap_name",
    uiDesc = "Aura_TreasureMap_desc",
}
AccountAura.TreasureMap_6 =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_BP22_Treasure_6",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_TreasureMap_name",
    uiDesc = "Aura_TreasureMap_desc",
}
AccountAura.TreasureMap_7 =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_BP22_Treasure_7",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_TreasureMap_name",
    uiDesc = "Aura_TreasureMap_desc",
}
AccountAura.TreasureMap_8 =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_BP22_Treasure_8",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_TreasureMap_name",
    uiDesc = "Aura_TreasureMap_desc",
}

AccountAura.PiratBasePve_TreasureChest =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_Treasure_LeVasser",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_TreasureMap_name",
    uiDesc = "Aura_TreasureMap_desc",
}

AccountAura.RazorCreds = 
{
	uiName						= "RazorCreds",
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_RazorCreds_name",
	uiDesc 						= "Aura_RazorCreds_desc",
}

AccountAura.SawtoothCreds = 
{
	uiName						= "SawtoothCreds",
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_SawtoothCreds_name",
	uiDesc 						= "Aura_SawtoothCreds_desc",
}

AccountAura.CorpEconomyExp30 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 30,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp30_name",
    uiDesc = "BattlePassExp30_desc",
}

AccountAura.CorpEconomyCredits30 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 30,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "CorpEconomyCredits30_name",
    uiDesc = "CorpEconomyCredits30_desc",
}

AccountAura.CorpEconomyCredBoost =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_hours = 24 * 1,
    is_prolongable = true,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",

    credits_reward_mul = 0.5,

    ui_ico = { target = { tex = "bundle_gold_aura", }, },
    uiName = "CorpEconomyCredBoost_name",
    uiDesc = "CorpEconomyCredBoost_desc",
}

AccountAura.BloodTormentorCreds = 
{
	uiName						= "BloodTormentorCreds",
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_BloodTormentorCreds_name",
	uiDesc 						= "Aura_BloodTormentorCreds_desc",
}

AccountAura.PhoenixCreds = 
{
	uiName						= "PhoenixCreds",
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_PhoenixCreds_name",
	uiDesc 						= "Aura_PhoenixCreds_desc",
}

AccountAura.CutterCreds = 
{
	uiName						= "CutterCreds",
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_CutterCreds_name",
	uiDesc 						= "Aura_CutterCreds_desc",
}

AccountAura.ReaperCreds = 
{
	uiName						= "ReaperCreds",
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_ReaperCreds_name",
	uiDesc 						= "Aura_ReaperCreds_desc",
}

AccountAura.NewGround_End =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_NewGround_End",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_NewGround_End_name",
    uiDesc = "Bundle_NewGround_End_desc",
}

AccountAura.Bundle_BlackRelayRace_01 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_01",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_02 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_02",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_03 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_03",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_04 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_04",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_05 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_05",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_06 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_06",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_07 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_07",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_08 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_08",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_09 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_09",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_10 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_10",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}
AccountAura.Bundle_BlackRelayRace_11 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_BlackRelayRace_11",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_BlackRelayRace",
    uiDesc = "Bundle_BlackRelayRace",
}

AccountAura.CultisticTitle =
{
    category = ai.AccountAuraCategory.NONE,
	duration_in_hours = 24*7,
	alt_discounted_defs =
    {
		"Bundle_CultisticTitle",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_CultisticTitle",
    uiDesc = "Bundle_CultisticTitle_desc",
}
AccountAura.Haloween22_Witch_Revard =
{
    category = ai.AccountAuraCategory.NONE,
	duration_in_hours = 24*1.5,
	alt_discounted_defs =
    {
		"Bundle_Haloween22_Witch_Revard",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Haloween22_Witch_Revard",
    uiDesc = "Bundle_Haloween22_Witch_Revard_desc",
}
AccountAura.Haloween22_Hunter_Revard =
{
    category = ai.AccountAuraCategory.NONE,
	duration_in_hours = 24*1.5,
	alt_discounted_defs =
    {
		"Bundle_Haloween22_Hunter_Revard",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Haloween22_Hunter_Revard",
    uiDesc = "Bundle_Haloween22_Hunter_Revard_desc",
}

AccountAura.BearCreds = 
{
	uiName						= "BearCreds",
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_BearCreds_name",
	uiDesc 						= "Aura_BearCreds_desc",
}

AccountAura.Brawl_Halloween_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Halloween_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Halloween_reward1_name",
    uiDesc = "Brawl_Halloween_reward1_desc",
}

AccountAura.Brawl_Halloween_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Halloween_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Halloween_reward2_name",
    uiDesc = "Brawl_Halloween_reward2_desc",
}

AccountAura.Brawl_Halloween_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Halloween_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Halloween_reward3_name",
    uiDesc = "Brawl_Halloween_reward3_desc",
}

AccountAura.Brawl_Pvp_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Pvp_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Pvp_reward1_name",
    uiDesc = "Brawl_Pvp_reward1_desc",
}

AccountAura.Brawl_Pvp_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Pvp_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Pvp_reward2_name",
    uiDesc = "Brawl_Pvp_reward2_desc",
}

AccountAura.Brawl_Pvp_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Pvp_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Pvp_reward3_name",
    uiDesc = "Brawl_Pvp_reward3_desc",
}

AccountAura.Brawl_Eden_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Eden_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Eden_reward1_name",
    uiDesc = "Brawl_Eden_reward1_desc",
}

AccountAura.Brawl_Eden_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Eden_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Eden_reward2_name",
    uiDesc = "Brawl_Eden_reward2_desc",
}

AccountAura.Brawl_Oreon_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Oreon_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Oreon_reward1_name",
    uiDesc = "Brawl_Oreon_reward1_desc",
}

AccountAura.Brawl_Oreon_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Oreon_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Oreon_reward2_name",
    uiDesc = "Brawl_Oreon_reward2_desc",
}

AccountAura.Brawl_Oreon_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Oreon_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Oreon_reward3_name",
    uiDesc = "Brawl_Oreon_reward3_desc",
}

AccountAura.DragonflyCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_DragonflyCreds_name",
	uiDesc 						= "Aura_DragonflyCreds_desc",
}

AccountAura.WaspCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_WaspCreds_name",
	uiDesc 						= "Aura_WaspCreds_desc",
}

AccountAura.Brawl_Temple_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Temple_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Temple_reward1_name",
    uiDesc = "Brawl_Temple_reward1_desc",
}

AccountAura.Brawl_Temple_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Temple_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Temple_reward2_name",
    uiDesc = "Brawl_Temple_reward2_desc",
}

AccountAura.Brawl_Temple_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Temple_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Temple_reward3_name",
    uiDesc = "Brawl_Temple_reward3_desc",
}

AccountAura.Brawl_MAZE_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_MAZE_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_MAZE_reward1_name",
    uiDesc = "Brawl_MAZE_reward1_desc",
}

AccountAura.Brawl_MAZE_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_MAZE_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_MAZE_reward2_name",
    uiDesc = "Brawl_MAZE_reward2_desc",
}

AccountAura.Brawl_MAZE_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_MAZE_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_MAZE_reward3_name",
    uiDesc = "Brawl_MAZE_reward3_desc",
}

AccountAura.Brawl_Paper_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Paper_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Paper_reward1_name",
    uiDesc = "Brawl_Paper_reward1_desc",
}

AccountAura.Brawl_Paper_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Paper_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Paper_reward2_name",
    uiDesc = "Brawl_Paper_reward2_desc",
}

AccountAura.Brawl_Paper_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Paper_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Paper_reward3_name",
    uiDesc = "Brawl_Paper_reward3_desc",
}

AccountAura.NyxCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_NyxCreds_name",
	uiDesc 						= "Aura_NyxCreds_desc",
}

AccountAura.Brawl_Brains_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Brains_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Brains_reward1_name",
    uiDesc = "Brawl_Brains_reward1_desc",
}

AccountAura.Brawl_Brains_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Brains_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Brains_reward2_name",
    uiDesc = "Brawl_Brains_reward2_desc",
}

AccountAura.Brawl_Brains_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Brains_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Brains_reward3_name",
    uiDesc = "Brawl_Brains_reward3_desc",
}

AccountAura.Brawl_Encounter_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Encounter_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Encounter_reward1_name",
    uiDesc = "Brawl_Encounter_reward1_desc",
}

AccountAura.Brawl_Encounter_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Encounter_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Encounter_reward2_name",
    uiDesc = "Brawl_Encounter_reward2_desc",
}

AccountAura.Brawl_Encounter_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Encounter_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Encounter_reward3_name",
    uiDesc = "Brawl_Encounter_reward3_desc",
}

AccountAura.Brawl_Support_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Support_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Support_reward1_name",
    uiDesc = "Brawl_Support_reward1_desc",
}

AccountAura.Brawl_Support_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Support_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Support_reward2_name",
    uiDesc = "Brawl_Support_reward2_desc",
}

AccountAura.Brawl_Support_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Support_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Support_reward3_name",
    uiDesc = "Brawl_Support_reward3_desc",
}

AccountAura.SaiCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_SaiCreds_name",
	uiDesc 						= "Aura_SaiCreds_desc",
}

AccountAura.ConfessorCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_ConfessorCreds_name",
	uiDesc 						= "Aura_ConfessorCreds_desc",
}

-- ауры для Летнего марафона заданий 2023 (начало блока) 

AccountAura.Bundle_Summer_2023_1 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Summer_2023_1",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_1_desc",
}

AccountAura.Bundle_Summer_2023_2 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Summer_2023_2",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_2_desc",
}

AccountAura.Bundle_Summer_2023_3 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Summer_2023_3",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_3_desc",
}

AccountAura.Bundle_Summer_2023_4 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Summer_2023_4",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_4_desc",
}

AccountAura.Bundle_Summer_2023_5 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Summer_2023_5",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_5_desc",
}

AccountAura.Bundle_Summer_2023_6 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Summer_2023_6",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_6_desc",
}

AccountAura.Bundle_Summer_2023_7 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Summer_2023_7",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Summer_2023_name",
    uiDesc = "Bundle_Summer_2023_7_desc",
}

AccountAura.Bundle_Summer_2023_FINAL =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Summer_2023_Final",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Summer_2023_FINAL_name",
    uiDesc = "Bundle_Summer_2023_FINAL_desc",
}

AccountAura.SummerExp15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp15_name",
    uiDesc = "BattlePassExp15_desc",
}

AccountAura.SummerCredits15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCredits15_name",
    uiDesc = "BattlePassCredits15_desc",
}

AccountAura.SummerLootAttempts15 =
{
    category = ai.AccountAuraCategory.NONE,
	
	duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

	loot_attempts_add		= 1,
	gameplays = ai.GameplayGroups.non_open_world,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "LootAttempts15_name",
    uiDesc = "LootAttempts15_desc",
}
-- ауры для Летнего марафона заданий 2023 (конец блока)

AccountAura.PalomCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_PalomCreds_name",
	uiDesc 						= "Aura_PalomCreds_desc",
}

AccountAura.Bundle_Ariadna =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Ariadna",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Ariadna_name",
    uiDesc = "Bundle_Ariadna_desc",
}

AccountAura.Brawl_Seven_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Seven_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Seven_reward1_name",
    uiDesc = "Brawl_Seven_reward1_desc",
}

AccountAura.Brawl_Seven_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Seven_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Seven_reward2_name",
    uiDesc = "Brawl_Seven_reward2_desc",
}

AccountAura.Brawl_Seven_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Seven_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Seven_reward3_name",
    uiDesc = "Brawl_Seven_reward3_desc",
}

-- Ауры для купивших BattlePass_Elite в предыдущем сезоне/фазе (НАЧАЛО БЛОКА)

AccountAura.Elite_Donater_BP12_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP12_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP13_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP13_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP13_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP13_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP14_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP14_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP14_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP14_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP15_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP15_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP15_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP15_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP16_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP16_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP16_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP16_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP17_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP17_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP17_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP17_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP18_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP18_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP18_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP18_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP19_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP19_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP19_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP19_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP20_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP20_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP20_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP20_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP21_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP21_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP21_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP21_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP22_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP22_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP22_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP22_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP23_1 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP23_1",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

AccountAura.Elite_Donater_BP23_2 =
{
    category = ai.AccountAuraCategory.NONE,

    -- duration_in_hours = 24 * 365,
    is_prolongable = false,
    alt_discounted_defs =
    {
		"Bundle_Elite_Donater_BP23_2",
    },
    gold_credits_mul = -1,
    show_as_voucher = true,
    voucher_ico = "voucher_bonus_loyalty",
    uiName = "Aura_Elite_Donater_name",
    uiDesc = "Aura_Elite_Donater_desc",
}

-- Ауры для купивших BattlePass_Elite в предыдущем сезоне/фазе (КОНЕЦ БЛОКА)

AccountAura.SeeressCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_SeeressCreds_name",
	uiDesc 						= "Aura_SeeressCreds_desc",
}

AccountAura.Brawl_Miningstation_reward1 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Miningstation_reward1",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Miningstation_reward1_name",
    uiDesc = "Brawl_Miningstation_reward1_desc",
}

AccountAura.Brawl_Miningstation_reward2 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Miningstation_reward2",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Miningstation_reward2_name",
    uiDesc = "Brawl_Miningstation_reward2_desc",
}

AccountAura.Brawl_Miningstation_reward3 =
{
    category = ai.AccountAuraCategory.NONE,

    alt_discounted_defs =
    {
		"Bundle_Brawl_Miningstation_reward3",
    },
    gold_credits_mul = -1,
	ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Brawl_Miningstation_reward3_name",
    uiDesc = "Brawl_Miningstation_reward3_desc",
}

AccountAura.GrimCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_GrimCreds_name",
	uiDesc 						= "Aura_GrimCreds_desc",
}

AccountAura.HeliconCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_HeliconCreds_name",
	uiDesc 						= "Aura_HeliconCreds_desc",
}

AccountAura.SiriusCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_SiriusCreds_name",
	uiDesc 						= "Aura_SiriusCreds_desc",
}

AccountAura.MaulerCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_MaulerCreds_name",
	uiDesc 						= "Aura_MaulerCreds_desc",
}

AccountAura.HadrianCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_HadrianCreds_name",
	uiDesc 						= "Aura_HadrianCreds_desc",
}

AccountAura.Destroyer_Of_Mercy_Revard = -- Аура для SC-118276 Квест "Эсминец Сострадания" (Rank11). Поддержка новичков. Бережный ввод в Midgame.
{
	category					= ai.AccountAuraCategory.NONE,
    is_prolongable      = false,	
    gold_credits_mul = -1,
    discounted_def      = "Bundle_Destroyer_Of_Mercy_Revard",	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "Destroyer_Of_Mercy_Revard_name",
	uiDesc 						= "Destroyer_Of_Mercy_Revard_desc",
}

AccountAura.BaphometCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_BaphometCreds_name",
	uiDesc 						= "Aura_BaphometCreds_desc",
}

AccountAura.LokiCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_LokiCreds_name",
	uiDesc 						= "Aura_LokiCreds_desc",
}

AccountAura.ManulCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_ManulCreds_name",
	uiDesc 						= "Aura_ManulCreds_desc",
}

AccountAura.SalamanderCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_SalamanderCreds_name",
	uiDesc 						= "Aura_SalamanderCreds_desc",
}

AccountAura.ProcyonCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_ProcyonCreds_name",
	uiDesc 						= "Aura_ProcyonCreds_desc",
}

AccountAura.CorVulnusCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_CorVulnusCreds_name",
	uiDesc 						= "Aura_CorVulnusCreds_desc",
}

AccountAura.VigilantCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_VigilantCreds_name",
	uiDesc 						= "Aura_VigilantCreds_desc",
}

AccountAura.BarkCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_BarkCreds_name",
	uiDesc 						= "Aura_BarkCreds_desc",
}

AccountAura.YithMorCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    --duration_in_hours = 24 * 30, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*30=720 часов (30 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    --is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_YithMorCreds_name",
	uiDesc 						= "Aura_YithMorCreds_desc",
}

AccountAura.ShrikeCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_ShrikeCreds_name",
	uiDesc 						= "Aura_ShrikeCreds_desc",
}

-- Ауры для SC-119028 Марафон заданий в ОМ: "Мал клоп - да могуч". SUM24. (начало блока) 

AccountAura.Bundle_OWFest_24_1 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_OWFest_24_1",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_1_desc",
}

AccountAura.Bundle_OWFest_24_2 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_OWFest_24_2",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_2_desc",
}

AccountAura.Bundle_OWFest_24_3 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_OWFest_24_3",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_3_desc",
}

AccountAura.Bundle_OWFest_24_4 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_OWFest_24_4",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_4_desc",
}

AccountAura.Bundle_OWFest_24_5 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_OWFest_24_5",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_5_desc",
}

AccountAura.Bundle_OWFest_24_6 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_OWFest_24_6",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_6_desc",
}

AccountAura.Bundle_OWFest_24_7 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_OWFest_24_7",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_OWFest_24_name",
    uiDesc = "Bundle_OWFest_24_7_desc",
}

AccountAura.Bundle_OWFest_24_FINAL =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_OWFest_24_Final",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_OWFest_24_FINAL_name",
    uiDesc = "Bundle_OWFest_24_FINAL_desc",
}

AccountAura.OWFestExp15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp15_name",
    uiDesc = "BattlePassExp15_desc",
}

AccountAura.OWFestCredits15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCredits15_name",
    uiDesc = "BattlePassCredits15_desc",
}

AccountAura.OWFestLootAttempts15 =
{
    category = ai.AccountAuraCategory.NONE,
	
	duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

	loot_attempts_add		= 1,
	gameplays = ai.GameplayGroups.non_open_world,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "LootAttempts15_name",
    uiDesc = "LootAttempts15_desc",
}

AccountAura.OW2Destroyer_Revard = -- SC-119028 Аура для доп.квеста "Разрушитель Эсминца" к Марафону заданий в ОМ: "Мал клоп - да могуч". SUM24.
{
	category					= ai.AccountAuraCategory.NONE,
    is_prolongable      = false,	
    gold_credits_mul = -1,
    discounted_def      = "Bundle_OW2Destroyer",	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "OW2Destroyer_Revard_name",
	uiDesc 						= "OW2Destroyer_Revard_desc",
}
-- Ауры для SC-119028 Марафон заданий в ОМ: "Мал клоп - да могуч". SUM24. (конец блока)

AccountAura.PilumCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_PilumCreds_name",
	uiDesc 						= "Aura_PilumCreds_desc",
}

-- Ауры для SC-118693 «Стойкий Оловяный Пилотик». Фестиваль заданий в честь 10 лет. (начало блока) 

AccountAura.Bundle_Tin10_1 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Tin10_1",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_1_desc",
}

AccountAura.Bundle_Tin10_2 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Tin10_2",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_2_desc",
}

AccountAura.Bundle_Tin10_3 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Tin10_3",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_3_desc",
}

AccountAura.Bundle_Tin10_4 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Tin10_4",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_4_desc",
}

AccountAura.Bundle_Tin10_5 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Tin10_5",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_5_desc",
}

AccountAura.Bundle_Tin10_6 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Tin10_6",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_6_desc",
}

AccountAura.Bundle_Tin10_7 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Tin10_7",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tin10_name",
    uiDesc = "Bundle_Tin10_7_desc",
}

AccountAura.Bundle_Tin10_FINAL =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Tin10_Final",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tin10_FINAL_name",
    uiDesc = "Bundle_Tin10_FINAL_desc",
}

AccountAura.Tin10Exp15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    experience_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassExp15_name",
    uiDesc = "BattlePassExp15_desc",
}

AccountAura.Tin10Credits15 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

    credits_reward_mul = 0.5,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "BattlePassCredits15_name",
    uiDesc = "BattlePassCredits15_desc",
}

AccountAura.Tin10LootAttempts15 =
{
    category = ai.AccountAuraCategory.NONE,
	
	duration_in_counters = 15,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

	loot_attempts_add		= 1,
	gameplays = ai.GameplayGroups.non_open_world,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "LootAttempts15_name",
    uiDesc = "LootAttempts15_desc",
}

-- Ауры для SC-118693 «Стойкий Оловяный Пилотик». Фестиваль заданий в честь 10 лет. (конец блока) 

-- Ауры для SC-119946 «Стойкий Стальной Пилотик». Фестиваль заданий в честь 11 лет Игры. (начало блока) 

AccountAura.Bundle_Tin11_FINAL =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_Tin11_Final",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Tin11_FINAL_name",
    uiDesc = "Bundle_Tin11_FINAL_desc",
}

-- Ауры для SC-119946 «Стойкий Стальной Пилотик». Фестиваль заданий в честь 11 лет Игры. (конец блока) 

AccountAura.YithMor90Creds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_YithMor90Creds_name",
	uiDesc 						= "Aura_YithMor90Creds_desc",
}

AccountAura.HeliosCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_HeliosCreds_name",
	uiDesc 						= "Aura_HeliosCreds_desc",
}

AccountAura.PsiloiCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_PsiloiCreds_name",
	uiDesc 						= "Aura_PsiloiCreds_desc",
}

AccountAura.PerseiCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_PerseiCreds_name",
	uiDesc 						= "Aura_PerseiCreds_desc",
}

AccountAura.BasheCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_BasheCreds_name",
	uiDesc 						= "Aura_BasheCreds_desc",
}

-- SC-119521 СК. Раздать игрокам подарки на китайский НГ 29.01 (Аура для сундук "Год змеи 2025"5) НАЧАЛО БЛОКА

AccountAura.Bundle_ChinaNY_2025 =
{
    category = ai.AccountAuraCategory.NONE,
    duration_in_hours = 24,
    is_prolongable = false,
    discounted_def = "Bundle_ChinaNY_2025",
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_ChinaNY_2025_name",
    uiDesc = "Bundle_ChinaNY_2025_desc",
}

-- SC-119521 СК. Раздать игрокам подарки на китайский НГ 29.01 (Аура для сундук "Год змеи 2025") КОНЕЦ БЛОКА

-- Аура для Сундука "Яйцекат 2025" (Поиск яиц динозавров, Ивент на 1 апреля)

AccountAura.Bundle_EggRoller2025 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_EggRoller2025",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_EggRoller2025",
    uiDesc = "Bundle_EggRoller2025",
}

-- Аура для Сундука "Яйцекат 2026" (Поиск яиц динозавров, Ивент на 1 апреля)

AccountAura.Bundle_EggRoller2026 =
{
    category = ai.AccountAuraCategory.NONE,
	alt_discounted_defs =
    {
		"Bundle_EggRoller2026",
    },
    gold_credits_mul = -1,
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_EggRoller2026",
    uiDesc = "Bundle_EggRoller2025_desc",
}

-- Аура для Сундука "Возвращение Предтеч", в SC-118793 Финальный рейд-приключение "Возвращение Предтеч"

AccountAura.Rop2025_End =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_Rop2025_End",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Bundle_Rop2025_End_name",
    uiDesc = "Bundle_Rop2025_End_desc",
}

AccountAura.DragThirCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_DragThirCreds_name",
	uiDesc 						= "Aura_DragThirCreds_desc",
}

AccountAura.HellasCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_HellasCreds_name",
	uiDesc 						= "Aura_HellasCreds_desc",
}

AccountAura.HiddenSeekerCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_HiddenSeekerCreds_name",
	uiDesc 						= "Aura_HiddenSeekerCreds_desc",
}

AccountAura.AmberCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_AmberCreds_name",
	uiDesc 						= "Aura_AmberCreds_desc",
}

AccountAura.CinquedeaCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_CinquedeaCreds_name",
	uiDesc 						= "Aura_CinquedeaCreds_desc",
}

-- Аураs для Сундуков "Созерцатель" + "Свидетель Предтеч", в SC-119965

AccountAura.Aura_Rop2025_Contemplator =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_Rop2025_Contemplator",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_Rop2025_Contemplator_name",
    uiDesc = "Aura_Rop2025_Contemplator_desc",
}

AccountAura.Aura_Rop2025_Witness =
{
    category = ai.AccountAuraCategory.NONE,
    --duration_in_hours = 24*14,
	alt_discounted_defs =
    {
		"Bundle_Rop2025_Witness",
    },
    gold_credits_mul = -1,
	voucher_ico = "voucher_bonus_loyalty",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },
    uiName = "Aura_Rop2025_Witness_name",
    uiDesc = "Aura_Rop2025_Witness_desc",
}

AccountAura.WeekyKnickers_Revard = -- Аура для SC-119788 Марафон «Квестики-Неделька». Лёгкие квесты для стимулирования ежедневного онлайна. Финальный сундук для «Папкина-Неделька»
{
	category					= ai.AccountAuraCategory.NONE,
    is_prolongable      = false,	
    gold_credits_mul = -1,
    discounted_def      = "Bundle_WeekyKnickers_Revard",	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "WeekyKnickers_Revard_name",
	uiDesc 						= "WeekyKnickers_Revard_desc",
}

AccountAura.WeekyKnickers_ExpCred20x5 =
{
    category = ai.AccountAuraCategory.NONE,

    duration_in_counters = 20,
    duration_counter_event = ai.AccountAuraCounterEvent.GAME_START,
    is_prolongable = true,

    gameplays = ai.GameplayGroups.non_open_world,

	credits_reward_mul = 4.0,
    experience_reward_mul = 4.0,

    show_as_voucher = true,
    voucher_ico = "voucher_bonus_silver",
    uiName = "WeekyKnickers_ExpCred20x5_name",
    uiDesc = "WeekyKnickers_ExpCred20x5_desc",
}

AccountAura.NewbieHarpy_Revard = -- Аура для SC-120022 Баг с уровнями допуска пилота (1>3) . Поддержка новичков. Повышение Retention D1, D7. Сундук для «NewbieAffairs_1»
{
	category					= ai.AccountAuraCategory.NONE,
    is_prolongable      = false,	
    gold_credits_mul = -1,
    discounted_def      = "Bundle_NewbieHarpy_Revard",	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "NewbieHarpy_Revard_name",
	uiDesc 						= "NewbieHarpy_Revard_desc",
}

AccountAura.NewbieKingDvergr_Revard = -- Аура для SC-120022 Баг с уровнями допуска пилота (1>3) . Поддержка новичков. Повышение Retention D1, D7. Сундук для «NewbieAffairs_3»
{
	category					= ai.AccountAuraCategory.NONE,
    is_prolongable      = false,	
    gold_credits_mul = -1,
    discounted_def      = "Bundle_NewbieKingDvergr_Revard",	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "NewbieKingDvergr_Revard_name",
	uiDesc 						= "NewbieKingDvergr_Revard_desc",
}

AccountAura.NewbieKnickers_Start = -- Аура для SC-119788 Марафон «Квестики-Неделька». Лёгкие квесты для стимулирования ежедневного онлайна. Первый сундук «Нубова-Неделька» + счётчик итогового квеста
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 10, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*10=240 часов (10 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable      = false,	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    discounted_def = "Bundle_NewbieKnickers_Start", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована	
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "NewbieKnickers_Start_name",
	uiDesc 						= "NewbieKnickers_Start_desc",
}

AccountAura.NewbieKnickers_8 = -- Аура для SC-119788 Марафон «Квестики-Неделька». Лёгкие квесты для стимулирования ежедневного онлайна. Сундук за NewbieKnickers_8 «Нубова-Неделька»
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 1, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*1=24 часа (1 сутки)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 	
    is_prolongable      = false,	
    discounted_def      = "Bundle_NewbieKnickers_8", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "NewbieKnickers_8_name",
	uiDesc 						= "NewbieKnickers_8_desc",
}

AccountAura.NewbieKnickers_8Rev = -- Аура для SC-119788 Марафон «Квестики-Неделька». Лёгкие квесты для стимулирования ежедневного онлайна. Аура, открывающая доступ к квесту NewbieKnickers_FIN (без наград)
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 8, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*1=24 часа (1 сутки)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 	
    is_prolongable      = false,	
    --discounted_def      = "Bundle_NewbieKnickers_8", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    --gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована		
	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "NewbieKnickers_8Rev_name",
	uiDesc 						= "NewbieKnickers_8Rev_desc",
}

AccountAura.NewbieKnickers_Revard = -- Аура для SC-119788 Марафон «Квестики-Неделька». Лёгкие квесты для стимулирования ежедневного онлайна. ФИНАЛЬНЫЙ сундук «Нубова-Неделька»
{
	category					= ai.AccountAuraCategory.NONE,
    is_prolongable      = false,	
    gold_credits_mul = -1,
    discounted_def      = "Bundle_NewbieKnickers_Revard",	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "NewbieKnickers_Revard_name",
	uiDesc 						= "NewbieKnickers_Revard_desc",
}

AccountAura.DragThir90Creds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_DragThir90Creds_name",
	uiDesc 						= "Aura_DragThir90Creds_desc",
}

AccountAura.LazyRaiderCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 30, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*30=720 часов (30 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_LazyRaiderCreds_name",
	uiDesc 						= "Aura_LazyRaiderCreds_desc",
}

-- Ауры для SC-120101 Марафон «Четвертак за тридцать». Сезонная линейка квестов для стимулирования ежедневного онлайна. (НАЧАЛО БЛОКА)

AccountAura.A25FOR30_1 = -- Аура для SC-120101 Марафон «Четвертак за тридцать». Аура, открывающая доступ к квесту A25FOR30_2 (без наград)
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 32, -- добавляет ограничение действия ауры на ??? часов (например 24*1=24 часа (1 сутки)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 	
    is_prolongable      = false,	
    --discounted_def      = "Bundle_NewbieKnickers_8", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    --gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована		
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_HiddenAura_name",
	uiDesc 						= "A25FOR30_HiddenAura_desc",
}

AccountAura.A25FOR30_2 = -- Аура для SC-120101 Марафон «Четвертак за тридцать». Аура, открывающая доступ к квесту A25FOR30_3 (без наград)
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 31, -- добавляет ограничение действия ауры на ??? часов (например 24*1=24 часа (1 сутки)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 	
    is_prolongable      = false,	
    --discounted_def      = "Bundle_NewbieKnickers_8", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    --gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована		
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_HiddenAura_name",
	uiDesc 						= "A25FOR30_HiddenAura_desc",
}

AccountAura.A25FOR30_3 = -- Аура для SC-120101 Марафон «Четвертак за тридцать». Аура, открывающая доступ к квестам A25FOR30_4 - A25FOR30_8 (без наград)
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 30, -- добавляет ограничение действия ауры на ??? часов (например 24*1=24 часа (1 сутки)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 	
    is_prolongable      = false,	
    --discounted_def      = "Bundle_NewbieKnickers_8", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    --gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована		
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_HiddenAura_name",
	uiDesc 						= "A25FOR30_HiddenAura_desc",
}

AccountAura.A25FOR30_8 = -- Аура для SC-120101 Марафон «Четвертак за тридцать». Аура, открывающая доступ к квесту A25FOR30_9 (без наград)
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 16, -- добавляет ограничение действия ауры на ??? часов (например 24*1=24 часа (1 сутки)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 	
    is_prolongable      = false,	
    --discounted_def      = "Bundle_NewbieKnickers_8", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    --gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована		
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_HiddenAura_name",
	uiDesc 						= "A25FOR30_HiddenAura_desc",
}

AccountAura.A25FOR30_9 = -- Аура для SC-120101 Марафон «Четвертак за тридцать». Аура, открывающая доступ к квесту A25FOR30_10 (без наград)
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 15, -- добавляет ограничение действия ауры на ??? часов (например 24*1=24 часа (1 сутки)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 	
    is_prolongable      = false,	
    --discounted_def      = "Bundle_NewbieKnickers_8", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    --gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована		
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_HiddenAura_name",
	uiDesc 						= "A25FOR30_HiddenAura_desc",
}

AccountAura.A25FOR30_10 = -- Аура для SC-120101 Марафон «Четвертак за тридцать». Аура, открывающая доступ к квестам A25FOR30_11 - A25FOR30_14 (без наград)
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 14, -- добавляет ограничение действия ауры на ??? часов (например 24*1=24 часа (1 сутки)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 	
    is_prolongable      = false,	
    --discounted_def      = "Bundle_NewbieKnickers_8", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    --gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована		
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_HiddenAura_name",
	uiDesc 						= "A25FOR30_HiddenAura_desc",
}

AccountAura.A25FOR30_FINALRevard = -- Аура для SC-120101 Марафон «Четвертак за тридцать». ФИНАЛЬНЫЙ сундук «Четвертак за тридцать»
{
	category					= ai.AccountAuraCategory.NONE,
    is_prolongable      = false,	
    gold_credits_mul = -1,
    discounted_def      = "Bundle_A25FOR30_FINALRevard",	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_FINALRevard_name",
	uiDesc 						= "A25FOR30_FINALRevard_desc",
}

AccountAura.A25FOR30_3Rev = -- Аура SC-120101 Марафон «Четвертак за тридцать». Выдаёт сундук с Диверсантом Стеклянной Эскадры + Ауру A25FOR30_8 открывающую доступ к квестам A25FOR30_4 - A25FOR30_8 (без наград) 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 10, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*10=240 часов (10 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable      = false,	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    discounted_def = "Bundle_A25FOR30_3Rev", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, то комментируем или удаляем строку.	
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_3Rev_name",
	uiDesc 						= "A25FOR30_3Rev_desc",
}

--- SC-120496 Марафон «Четвертак за тридцать»... Повторение марафонов в BP24 / SUM26. АУРЫ, ВЫДАЮЩИЕ СУНДУКИ для финальных марафонов. 

AccountAura.A25FOR30_1Rev = -- Аура SC-120101 Марафон «Четвертак за тридцать». Выдаёт сундук с Диверсантом Стеклянной Эскадры + Ауру A25FOR30_8 открывающую доступ к квестам A25FOR30_4 - A25FOR30_8 (без наград) 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 10, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*10=240 часов (10 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable      = false,	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    discounted_def = "Bundle_A25FOR30_1Rev", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, то комментируем или удаляем строку.	
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_1Rev_name",
	uiDesc 						= "A25FOR30_1Rev_desc",
}

AccountAura.A25FOR30_2Rev = -- Аура SC-120101 Марафон «Четвертак за тридцать». Выдаёт сундук с Диверсантом Стеклянной Эскадры + Ауру A25FOR30_8 открывающую доступ к квестам A25FOR30_4 - A25FOR30_8 (без наград) 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 10, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*10=240 часов (10 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable      = false,	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    discounted_def = "Bundle_A25FOR30_2Rev", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, то комментируем или удаляем строку.	
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_2Rev_name",
	uiDesc 						= "A25FOR30_2Rev_desc",
}

AccountAura.A25FOR30_8Rev = -- Аура SC-120101 Марафон «Четвертак за тридцать». Выдаёт сундук с Диверсантом Стеклянной Эскадры + Ауру A25FOR30_8 открывающую доступ к квестам A25FOR30_4 - A25FOR30_8 (без наград) 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 10, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*10=240 часов (10 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable      = false,	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    discounted_def = "Bundle_A25FOR30_8Rev", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, то комментируем или удаляем строку.	
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_8Rev_name",
	uiDesc 						= "A25FOR30_8Rev_desc",
}

AccountAura.A25FOR30_9Rev = -- Аура SC-120101 Марафон «Четвертак за тридцать». Выдаёт сундук с Диверсантом Стеклянной Эскадры + Ауру A25FOR30_8 открывающую доступ к квестам A25FOR30_4 - A25FOR30_8 (без наград) 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 10, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*10=240 часов (10 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable      = false,	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    discounted_def = "Bundle_A25FOR30_9Rev", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, то комментируем или удаляем строку.	
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_9Rev_name",
	uiDesc 						= "A25FOR30_9Rev_desc",
}

AccountAura.A25FOR30_10Rev = -- Аура SC-120101 Марафон «Четвертак за тридцать». Выдаёт сундук с Диверсантом Стеклянной Эскадры + Ауру A25FOR30_8 открывающую доступ к квестам A25FOR30_4 - A25FOR30_8 (без наград) 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 10, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*10=240 часов (10 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable      = false,	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    discounted_def = "Bundle_A25FOR30_10Rev", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, то комментируем или удаляем строку.	
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "A25FOR30_10Rev_name",
	uiDesc 						= "A25FOR30_10Rev_desc",
}

-- Ауры для SC-120101 Марафон «Четвертак за тридцать». Сезонная линейка квестов для стимулирования ежедневного онлайна. (КОНЕЦ БЛОКА)

AccountAura.AceCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_AceCreds_name",
	uiDesc 						= "Aura_AceCreds_desc",
}

AccountAura.CarolingianCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_CarolingianCreds_name",
	uiDesc 						= "Aura_CarolingianCreds_desc",
}

-- SC-120253 Тестовая линейка квестов QTEST_1 (2, 3)

AccountAura.QTEST_1 = -- Аура для SC-120253, открывающая доступ к квестам QTEST_1 (2, 3) (без наград)
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 365, -- добавляет ограничение действия ауры на ??? часов (например 24*1=24 часа (1 сутки)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 	
    is_prolongable      = true, --  флаг, отвечающий за возможность пролонгации.	
    --discounted_def      = "Bundle_NewbieKnickers_8", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    --gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, пожтому строка закомментирована		
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "QTEST_1_name",
	uiDesc 						= "QTEST_1_desc",
}

AccountAura.ApeironCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_ApeironCreds_name",
	uiDesc 						= "Aura_ApeironCreds_desc",
}

AccountAura.SaturnCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_SaturnCreds_name",
	uiDesc 						= "Aura_SaturnCreds_desc",
}

AccountAura.CorLegibusCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_CorLegibusCreds_name",
	uiDesc 						= "Aura_CorLegibusCreds_desc",
}

AccountAura.TauKita90Creds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_TauKita90Creds_name",
	uiDesc 						= "Aura_TauKita90Creds_desc",
}

AccountAura.ChaosCreds = 
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")
    duration_in_hours = 24 * 90, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*90=2160 часов (90 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable = true, -- флаг, отвечающий за возможность пролонгации (в данном случае возможна, напр. при повторной покупке DLC)
	keep_expired				= true,
	credits_reward_mul			= 0.10,

	show_as_voucher 			= true,
	voucher_ico					= "voucher_bonus_silver",
	uiName						= "Aura_ChaosCreds_name",
	uiDesc 						= "Aura_ChaosCreds_desc",
}

AccountAura.ZeTa_Revard = -- Аура для Тестовый бандл с зелёным кораблём (Ze'Ta) и открытыми НОДАми
{
	category					= ai.AccountAuraCategory.NONE,
    is_prolongable      = false,	
    gold_credits_mul = -1,
    discounted_def      = "Bundle_ZeTa_Revard",	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "ZeTa_Revard_name",
	uiDesc 						= "ZeTa_Revard_desc",
}

-- SC-120526 Открыть Главный калибр для Black Ghost. Через труд и только обладателям BG.

AccountAura.CookCannon_Rev = -- Аура выдающая Главный калибр для Black Ghost
{
	category					= ai.AccountAuraCategory.NONE,
    --duration_in_counters = 50, -- добавляет ограничение действия ауры на ??? боёв (в даном случае на 50)
    --duration_counter_event = ai.AccountAuraCounterEvent.GAME_START, -- задаёт условия для счётчика ограничений (в данном случае "начать бой", а вообще в cosmos_constants.lua по "ai.AccountAuraCounterEvent =")	
	duration_in_hours = 24 * 10, -- добавляет ограничение действия ауры на ??? часов (в даном случае на 24*10=240 часов (10 суток)). Лучше применять отдельно от duration_in_counters (предыдущие 2 строки), "или-или" 
    is_prolongable      = false,	
	show_as_voucher 			= false,
	voucher_ico					= "voucher_bonus_silver",
    discounted_def = "Bundle_CookCannon_Rev", -- если аура не выдаёт сундук - а просто работает КАК "счётчик времени", сколько доступно выполнение квеста то комментируем или удаляем строку.
    gold_credits_mul = -1, -- скидка на выдаваемый сундук = 100%. Если аура не выдаёт сундук, то комментируем или удаляем строку.	
    ui_ico = { target = { tex = "bundle_gold_mini", }, },	
	uiName						= "CookCannon_Rev_name",
	uiDesc 						= "CookCannon_Rev_desc",
}