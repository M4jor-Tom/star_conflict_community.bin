--#45674

ShipQuestsSettings =
{
    -- max 32, hardcoded
    quests_max =
    {
        [ 1 ]   = 1,
        [ 2 ]   = 1,
        [ 3 ]   = 1,
        [ 4 ]   = 1,
        [ 5 ]   = 1,
        [ 6 ]   = 1,
        [ 7 ]   = 1,
        [ 8 ]   = 1,
        [ 9 ]   = 1,
        [ 10 ]  = 1,
        [ 11 ]  = 1,
        [ 12 ]  = 1,
        [ 13 ]  = 1,
        [ 14 ]  = 1,
        [ 15 ]  = 1,
        [ 16 ]  = 1,
        [ 17 ]  = 1,
        [ 18 ]  = 1,
        [ 19 ]  = 1,
        [ 20 ]  = 1,
        [ 21 ]  = 1,
        [ 22 ]  = 1,
        [ 23 ]  = 1,
        [ 24 ]  = 1,
        [ 25 ]  = 1,
    },
    quests_daily = 1, --– в день может быть предложено не больше этого числа квестов.
    num_texts = 30,
}

-- max 32, hardcoded
ShipQuestId =
{
    SQ_2    = 0,
    SQ_3    = 1,
    SQ_4    = 2,
    SQ_5    = 3,
    SQ_6    = 4,
    SQ_7    = 5,
    SQ_8    = 6,
    SQ_9    = 7,
    SQ_10   = 8,
    SQ_11   = 9,
    SQ_12   = 10,
    SQ_13   = 11,
    SQ_14   = 12,
    SQ_15   = 13,
    SQ_16   = 14,
    SQ_17   = 15,
    SQ_18   = 16,
    SQ_19   = 17,
    SQ_20   = 18,
    SQ_21   = 19,
    SQ_22   = 20,
    SQ_23   = 21,
    SQ_24   = 22,
}

ShipQuests = {}

ShipQuests[ ShipQuestId.SQ_2 ] =
{
    required_rank       = 3, -- ранг игрока с которого начинает быть доступен квест
    min_ship_rank       = 1, -- требуемый ранг корабля
    max_ship_rank       = 2, -- максимальный ранг корабля для выполнения квеста
    duration            = 1, -- время выполнения в часах
    max_ships           = 2, -- max 8, hardcoded
    best_roles          = { { ai.ShipRoles.ATTACK, }, { ai.ShipRoles.TACKLER, }, { ai.ShipRoles.COMMAND, }, }, -- лучшие роли для выполнения задания

    base_reward_credits = 150000 / (5 * 2 * 1.5), -- reward / (max ship synergy level * max ships * coef_role)
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_3 ] =
{
    required_rank       = 4,
    min_ship_rank       = 1,
    max_ship_rank       = 3,
    duration            = 1,
    max_ships           = 2,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER }, },

    base_reward_credits = 150000 / (6 * 2 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_4 ] =
{
    required_rank       = 5,
    min_ship_rank       = 1,
    max_ship_rank       = 3,
    duration            = 1,
    max_ships           = 3,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.ECM, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SCOUT, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.RECON, }, },

    base_reward_credits = 200000 / (6 * 3 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_5 ] =
{
    required_rank       = 6,
    min_ship_rank       = 1,
    max_ship_rank       = 4,
    duration            = 1,
    max_ships           = 3,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.SNIPER, ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.ENGINEER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.GUARD, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 200000 / (7 * 3 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_6 ] =
{
    required_rank       = 7,
    min_ship_rank       = 1,
    max_ship_rank       = 4,
    duration            = 2,
    max_ships           = 4,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.SNIPER,  ai.ShipRoles.SCOUT, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.GUARD, ai.ShipRoles.RECON, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.ECM, }, },

    base_reward_credits = 200000 / (7 * 4 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}


ShipQuests[ ShipQuestId.SQ_7 ] =
{
    required_rank       = 8,
    min_ship_rank       = 1,
    max_ship_rank       = 5,
    duration            = 2,
    max_ships           = 4,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.ENGINEER,  ai.ShipRoles.ECM, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.GUARD, ai.ShipRoles.SCOUT, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.SNIPER, ai.ShipRoles.RECON, }, },

    base_reward_credits = 250000 / (8 * 4 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_8 ] =
{
    required_rank       = 9,
    min_ship_rank       = 1,
    max_ship_rank       = 6,
    duration            = 3,
    max_ships           = 5,
    best_roles          = { { ai.ShipRoles.SCOUT, ai.ShipRoles.ECM,  ai.ShipRoles.RECON, }, { ai.ShipRoles.ATTACK, ai.ShipRoles.TACKLER, ai.ShipRoles.COMMAND, }, { ai.ShipRoles.SNIPER, ai.ShipRoles.ENGINEER, ai.ShipRoles.GUARD, }, },

    base_reward_credits = 250000 / (8 * 5 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_9 ] =
{
    required_rank       = 10,
    min_ship_rank       = 1,
    max_ship_rank       = 6,
    duration            = 3,
    max_ships           = 5,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.SNIPER,  ai.ShipRoles.ECM, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.GUARD, ai.ShipRoles.RECON, }, },

    base_reward_credits = 250000 / (8 * 5 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_10 ] =
{
    required_rank       = 11,
    min_ship_rank       = 2,
    max_ship_rank       = 7,
    duration            = 4,
    max_ships           = 5,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.SNIPER,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.GUARD, ai.ShipRoles.ECM, }, { ai.ShipRoles.SCOUT, ai.ShipRoles.ENGINEER, ai.ShipRoles.COMMAND, }, },

    base_reward_credits = 300000 / (9 * 5 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_11 ] =
{
    required_rank       = 12,
    min_ship_rank       = 3,
    max_ship_rank       = 8,
    duration            = 4,
    max_ships           = 5,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 300000 / (9 * 5 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_12 ] =
{
    required_rank       = 13,
    min_ship_rank       = 4,
    max_ship_rank       = 9,
    duration            = 5,
    max_ships           = 6,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 300000 / (9 * 6 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_13 ] =
{
    required_rank       = 14,
    min_ship_rank       = 5,
    max_ship_rank       = 10,
    duration            = 5,
    max_ships           = 6,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 350000 / (10 * 6 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_14 ] =
{
    required_rank       = 15,
    min_ship_rank       = 6,
    max_ship_rank       = 11,
    duration            = 6,
    max_ships           = 6,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 350000 / (10 * 6 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_15 ] =
{
    required_rank       = 16,
    min_ship_rank       = 7,
    max_ship_rank       = 12,
    duration            = 6,
    max_ships           = 6,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 350000 / (10 * 6 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_16 ] =
{
    required_rank       = 17,
    min_ship_rank       = 8,
    max_ship_rank       = 13,
    duration            = 7,
    max_ships           = 7,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 400000 / (10 * 7 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_17 ] =
{
    required_rank       = 18,
    min_ship_rank       = 9,
    max_ship_rank       = 14,
    duration            = 7,
    max_ships           = 7,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 400000 / (10 * 7 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_18 ] =
{
    required_rank       = 19,
    min_ship_rank       = 10,
    max_ship_rank       = 15,
    duration            = 8,
    max_ships           = 7,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 400000 / (10 * 7 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_19 ] =
{
    required_rank       = 20,
    min_ship_rank       = 12,
    max_ship_rank       = 16,
    duration            = 8,
    max_ships           = 7,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 450000 / (10 * 7 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_20 ] =
{
    required_rank       = 21,
    min_ship_rank       = 14,
    max_ship_rank       = 17,
    duration            = 9,
    max_ships           = 8,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 450000 / (10 * 8 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_21 ] =
{
    required_rank       = 22,
    min_ship_rank       = 15,
    max_ship_rank       = 17,
    duration            = 9,
    max_ships           = 8,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 450000 / (10 * 8 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_22 ] =
{
    required_rank       = 23,
    min_ship_rank       = 15,
    max_ship_rank       = 17,
    duration            = 10,
    max_ships           = 8,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 500000 / (10 * 8 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_23 ] =
{
    required_rank       = 24,
    min_ship_rank       = 15,
    max_ship_rank       = 17,
    duration            = 10,
    max_ships           = 8,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 500000 / (10 * 8 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}

ShipQuests[ ShipQuestId.SQ_24 ] =
{
    required_rank       = 25,
    min_ship_rank       = 15,
    max_ship_rank       = 17,
    duration            = 10,
    max_ships           = 8,
    best_roles          = { { ai.ShipRoles.ATTACK, ai.ShipRoles.GUARD,  ai.ShipRoles.RECON, }, { ai.ShipRoles.TACKLER, ai.ShipRoles.SNIPER, ai.ShipRoles.ECM, }, { ai.ShipRoles.COMMAND, ai.ShipRoles.ENGINEER, ai.ShipRoles.SCOUT, }, },

    base_reward_credits = 500000 / (10 * 8 * 1.5),
    ui_reward = "base_reward_credits",

    category = QuestCategory.CHECKLIST,
    coef_base = 1,
    coef_role = 1.5,
}
