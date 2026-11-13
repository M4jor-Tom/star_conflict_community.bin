-- Equipment parts quests
Quests[ QuestId.EQUIPMENT_PARTS_1 ] =
{
    category = QuestCategory.RESOURCE,
    group = QuestGroupId.EQUIPMENT_PARTS_DAILY,
    bundle_link = "Bundle_Vessel_Equipment_Parts_T5",
    unlocks_on_account_rank = 1,

    stages =
    {
        {
            game_event      = ai.GameEvent.TAKEDOWN,
            required_value  = 25,
            restrictions    =
            {
                { param	= ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.RAILGUN, }, },
                { param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
            },
        },
        {
            game_event      = ai.GameEvent.GAMEPLAY_ACTION,
            required_value  = 2,
            restrictions    =
            {
                { param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.CAPTURE_BEACON,	ai.GameplayObjectives.DEFEND_BEACON, }, },
            },
        },
        {
            game_event      = ai.GameEvent.PLAY_GAME,
            required_value  = 3,
            restrictions    =
            {
                { param = ai.GameEventParam.WIN, num_value = { 1, }, },
                { param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVE, }, },
            },
        },
    },

    reward_account_aura = "Equipment_Parts_Discount", 
    ui_reward = "reward_account_aura",
    character = "mercenary",
}

Quests[ QuestId.EQUIPMENT_PARTS_2 ] = 
{
	category = QuestCategory.RESOURCE,
	group = QuestGroupId.EQUIPMENT_PARTS_DAILY,
	bundle_link = "Bundle_Vessel_Equipment_Parts_T5",
	unlocks_on_account_rank = 1,
	disabled = true,

	stages = 
	{
		{
			game_event		= ai.GameEvent.KILL_OBJECT,
			required_value	= 15,
			restrictions	=
			{
				{	param	= ai.GameEventParam.GAMEPLAY, num_value = { ai.Gameplay.PVE_MISSION, },	},
			},
		},
		{
			game_event		= ai.GameEvent.TAKEDOWN,
			required_value	= 20,
			restrictions	=
			{
				{	param	= ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.PLASMAGUN, }, },
				{	param	= ai.GameEventParam.PVP, num_value = { 1, }, },
				{	param	= ai.GameEventParam.COOP_VS_AI, num_value = { 0, }, },
			},
		},
		{
			game_event		= ai.GameEvent.GAMEPLAY_ACTION,
			required_value	= 1,
			restrictions	=
			{
				{	param	= ai.GameEventParam.SHIP_RANK_MIN, min_value = 8, },
				{	param	= ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.DAMAGE_CAPTAIN, }, },
			},
		},
	},

	character			= "mercenary",
	reward_account_aura = "Equipment_Parts_Discount",
	ui_reward = "reward_account_aura",
}

Quests[ QuestId.EQUIPMENT_PARTS_3 ] =
{
    category = QuestCategory.RESOURCE,
    group = QuestGroupId.EQUIPMENT_PARTS_DAILY,
    bundle_link = "Bundle_Vessel_Equipment_Parts_T5",
    unlocks_on_account_rank = 1,

    stages =
    {
        {
            game_event      = ai.GameEvent.PLAY_GAME,
            required_value  = 3,
            restrictions    =
            {
                { param = ai.GameEventParam.WIN, num_value = { 1, }, },
                { param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
            },
        },
        {
            game_event      = ai.GameEvent.TAKEDOWN,
            required_value  = 20,
            restrictions    =
            {
                { param = ai.GameEventParam.WEAPON_CLASS, num_value = { ai.WeaponClass.LASER, }, },
                { param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
            },
        },
        {
            game_event      = ai.GameEvent.GAMEPLAY_ACTION_WIN,
            required_value  = 1,
            restrictions    =
            {
                { param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.CAPTURE_BEACON, }, },
            },
        },
    },

    reward_account_aura = "Equipment_Parts_Discount",
    ui_reward = "reward_account_aura",
    character = "mercenary",
}

Quests[ QuestId.EQUIPMENT_PARTS_4 ] =
{
    category = QuestCategory.RESOURCE,
    group = QuestGroupId.EQUIPMENT_PARTS_DAILY,
    bundle_link = "Bundle_Vessel_Equipment_Parts_T5",
    unlocks_on_account_rank = 1,
    disabled = true,

    stages =
    {
        {
            game_event      = ai.GameEvent.GAMEPLAY_ACTION,
            required_value  = 1,
            restrictions    =
            {
                { param = ai.GameEventParam.GAMEPLAY_OBJECTIVE, num_value = { ai.GameplayObjectives.DEFEND_CAPTAIN, }, },
            },
        },
        {
            game_event      = ai.GameEvent.PLAY_GAME,
            required_value  = 3,
            restrictions    =
            {
                { param = ai.GameEventParam.WIN, num_value = { 1, }, },
                { param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
            },
        },
        {
            game_event      = ai.GameEvent.TAKEDOWN,
            required_value  = 20,
            restrictions    =
            {
                { param = ai.GameEventParam.BATTLE_TYPE, num_value = { ai.BattleType.PVP, ai.BattleType.COOP, }, },
            },
        },
    },

    reward_account_aura = "Equipment_Parts_Discount", 
    ui_reward = "reward_account_aura",
    character = "mercenary",
}

Quests[ QuestId.CONTRACT_IRRIDIUM ] =
{
    category = QuestCategory.CHECKLIST,
    group = QuestGroupId.IRRIDIUM,
    unlocks_on_account_rank = 8,
    auto_accept = true,
    ui_reward = "reward_iridium",

    stages =
    {
        {
            game_event = ai.GameEvent.PLAY_GAME,
            required_value = 5,

            restrictions =
            {
                { param = ai.GameEventParam.WIN, num_value = { 1, }, },
                { param = ai.GameEventParam.SHIP_RANK_MIN, min_value = 6, },
                { param = ai.GameEventParam.MAX_RACE_RANK_IN_SLOT, num_value = { 1, }, },
            },
        },
    },

    reward_iridium = 50,
    character = "scientist",
}

Quests[ QuestId.IMAGINARY ] =
{
    imaginary = true,
    --disabled = true,

    intervalStartHour = "2019-05-20T00:00:00Z",
    intervalLongHours = 24,
    max_completions = 0,

    auto_accept = true,
    auto_complete = true,

    stages =
    {
        {
            game_event = ai.GameEvent.COMPLETE_QUEST,
            required_value = 1,
            restrictions = {},
        },
    },
}

Quests[ QuestId.OW_IMAGINARY ] =
{
    intervalStartHour = "2019-05-20T00:00:00Z",
    intervalLongHours = 24,
    max_completions = 0,

    auto_accept = true,
    auto_complete = true,
    
	reward_vessel_exp = 3000,
	ui_reward = "reward_vessel_exp",

    stages =
    {
        {
            game_event = ai.GameEvent.LOOT_ITEM,
            required_value = 1,
            restrictions =
            {
                { param = ai.GameEventParam.ITEM_NAME, str_value = { "ow_BattlePass2020", }, },
            },
        },
    },
}

--[[
Quests[ QuestId.SAMPLE ] =
{
	category = QuestCategory.STORY,

	reward_credits = 1000,
	ui_reward = "reward_credits",

	intervalStartHour = "2019-09-01T00:00:00Z",
	max_completions = 0,

	auto_accept = true,

	stages = {{
		game_event = ai.GameEvent.PLAY_GAME,
		required_value = 1000,
		restrictions = {},
	},},
}
--]]
