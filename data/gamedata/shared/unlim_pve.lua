UnlimitedPvE =
{
    -- лут и награды
    -- (награда расчитывается по формуле Y = tanh( A * ( X - 1 ) ), где A задано в таблице, X - уровень миссии/баффа)
    resource = "pve_resource",
    resource_coef = 0.01,
    resource_min = 1,
    resource_max = 50,
    credits_coef = 0.022,
    credits_min_mod = 1.4,
    credits_max_mod = 7,

    wave =
    {
        resource = "pve_resource",
        resource_coef = 0.01,
        resource_min = 0,
        resource_max = 8,
        credits_coef = 0.01,
        credits_min_mod = 0.02,
        credits_max_mod = 0.8,
    },

    -- цена апгрейда баффа 1 игрока
    player_buff_1_cost =
    {
        credits_cost_A = 0.0174,
        credits_cost_Z = 250,
        credits_cost_min = 400000,
        credits_cost_max = 400000000,
        resource = "pve_resource",
        resource_cost_A = 0.0195,
        resource_cost_Z = 62,
        resource_cost_min = 5,
        resource_cost_max = 656,
    },

    -- цена апгрейда баффа 2 игрока
    player_buff_2_cost =
    {
        credits_cost_A = 0.0167,
        credits_cost_Z = 243,
        credits_cost_min = 200000,
        credits_cost_max = 200000000,
        resource = "pve_resource",
        resource_cost_A = 0.0143,
        resource_cost_Z = 52,
        resource_cost_min = 5,
        resource_cost_max = 739,
    },

    -- бафф 1 игрока
    player_buff_per_level_1 =
    {
        spells = { UnlimPveDamage = 0.02, },
    },

    -- бафф 2 игрока
    player_buff_per_level_2 =
    {
        spells = { UnlimPveHeal = 0.03 },
        shield_mod = 0.03,
        hull_mod = 0.03,
    },

    -- бафф мобов
    mob_buff_per_level =
    {
        spells = { UnlimPveDamage = 0.15, UnlimPveHeal = 0.15 },
        shield_mod = 0.15,
        hull_mod = 0.15,
    }
}
