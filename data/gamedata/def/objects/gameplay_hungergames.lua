Def.HG_SafeZone =
{
    class = "SafeZone",

    states = -- ~150
    {
        {
            spell = "HG_SafeZone0",
            radius = 2200,
            duration = 40,
        },
        {
            spell = "HG_SafeZone1",
            radius = 1000,
            duration = 35,
        },
        {
            spell = "HG_SafeZone2",
            radius = 400,
            duration = 30,
        },
		{
            spell = "HG_SafeZone3",
            radius = 135, --100=75, 135=100
            duration = 80,
        },
        {
            spell = "HG_SafeZone3",
            radius = 0,
        },
    },

    radius_dec = 10,

    sphere_effect = "particles/gadget/huge/hg_zone",
    bound_effect = "",
    max_distance_to_bound_effect = 3000,
    always_visible = true,
    bound_sound = "sound/game/death_sphere",

    uiName = "HG_SafeZone_name",

    nebula = "Effects_Nebula_HGZone",
}

Spell.HG_SafeZone0 =
{
    aura = ai.Aura.HULL_BURN_PERIODIC,
    target = { target = ai.SpellTargetGeneral.CASTER },
    aura_target = ai.SpellTarget.SHIPS_OUTSIDE,
    aura_range = 1,
    aura_param = 0.01,
    period = 1,
    hud_visible = false,

    aura_sound = "sound/aura/voidzone",
}

Spell.HG_SafeZone1 =
{
    aura = ai.Aura.HULL_BURN_PERIODIC,
    target = { target = ai.SpellTargetGeneral.CASTER },
    aura_target = ai.SpellTarget.SHIPS_OUTSIDE,
    aura_range = 1,
    aura_param = 0.05,
    period = 1,
    hud_visible = false,

    aura_sound = "sound/aura/voidzone",
}

Spell.HG_SafeZone2 =
{
    aura = ai.Aura.HULL_BURN_PERIODIC,
    target = { target = ai.SpellTargetGeneral.CASTER },
    aura_target = ai.SpellTarget.SHIPS_OUTSIDE,
    aura_range = 1,
    aura_param = 0.17,
    period = 1,
    hud_visible = false,

    aura_sound = "sound/aura/voidzone",
}

Spell.HG_SafeZone3 =
{
    aura = ai.Aura.HULL_BURN_PERIODIC,
    target = { target = ai.SpellTargetGeneral.CASTER },
    aura_target = ai.SpellTarget.SHIPS_OUTSIDE,
    aura_range = 1,
    aura_param = 0.25,
    period = 1,
    hud_visible = false,

    aura_sound = "sound/aura/voidzone",
}

-- Ентити, порождающая ауру которая снижает видимость
-- сделано чтобы уменьшить заметность кораблей
-- чтобы было интереснее находить противников
Def.Hunger_AntiRadarAuraHolder =
{
    class = "AuraHolderEntity",
    in_editor = true,
    spell_on_spawn  = "Hunger_AntiRadar",
}

Spell.Hunger_AntiRadar =
{
    aura = ai.Aura.VISION_RADIUS_MOD,
    aura_param = -2,
    isBuff = false,
    hud_visible = false,
    gameplay_specific = true,
    aura_target = ai.SpellTarget.SHIPS_AROUND,
    aura_range = 5000,

    additional_auras = -- урон издалека уменьшен, чтобы не фокусили особо и двигались
    {
        {
            influence = ai.Spell.APPLY_AURA,
            aura_target = ai.SpellTarget.SHIPS_AROUND,
            aura = ai.Aura.DAMAGE_REDUCE_WITH_DISTANCE,
            aura_param = 1000, -- добавил дальности с 8 км будет только четверть урона, с 2 км будет полный урон, с 6 - половина.
            aura_range = 5000,
            isBuff = true,
            gameplay_specific = true,
            hud_visible = false,
        },
        {
            influence = ai.Spell.APPLY_AURA,
            aura_target = ai.SpellTarget.SHIPS_AROUND,
            aura = ai.Aura.SNIPER_OVERLOAD, -- вернул снайперам былую силу
            aura_param = 0.5, -- убавил, а то как-то им походу слишком хорошо, и ещё убавил.
            aura_range = 5000,
            isBuff = true,
            gameplay_specific = true,
            hud_visible = false,
        },
        {
            influence = ai.Spell.APPLY_AURA,
            aura_target = ai.SpellTarget.SHIPS_AROUND,
            aura = ai.Aura.PRIMARY_WEAPON_RANGE_MOD, -- уменьшаю всем дальность стрельбы
            aura_param = -0.33,
            aura_range = 5000,
            isBuff = false,
            gameplay_specific = true,
            hud_visible = false,
        }
    },
}

HG_BonusSettings =
{
    bonuses =
    {
        "Bonus_HungerDamage",
        "Bonus_HungerVision",
        "Bonus_HungerSpeed",
        "Bonus_HungerResist",
        "Bonus_HungerCritical",
    },

    spawn_period = 10,
    max_active_bonuses = 20,
}

Def.Bonus_HungerDamage =
{
    class = "ScBaseEntity",
    in_editor = false,
    hudType = "default",
    model = "models/objects/gameplay/bonuses/speed_booster",
    uiName = "Bonus_HungerDamage_name",

    max_detection_distance = 1000.0,
    vision_radius_coef = 0.5, -- для глоу

    spell_approach = "Bonus_HungerDamage",
    spell_approach_trigger_radius = 20.0,
    spell_approach_trigger_sound = "sound/game/bonus_take",
    spell_approach_respawn_timer = 0,

    death_effect = "particles/ships/looted",
    end_effect = "particles/objects/bonuses/hg/hg_bonus_orange_explosion",

    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_orange", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_orange_sphere", joint = "root3" },
    }
}

Spell.Bonus_HungerDamage =
{
    aura = ai.Aura.DAMAGE_MOD,
    aura_param = 0.5,
    isBuff = true,
    aura_target = ai.SpellTarget.HOLDER,
    max_stacks = 99,
    cast_fx = "particles/gadget/aura_wave",
    ui_ico = { target_system = { tex = "ItemSubtype_WeaponAmplifier", }, },

    additional_auras =
    {
        {
            influence = ai.Spell.APPLY_AURA,
            aura_target = ai.SpellTarget.HOLDER,
            aura = ai.Aura.SECONDARY_DAMAGE_MOD,
            aura_param = 0.5,
            isBuff = true,
            gameplay_specific = true,
            hud_visible = false,
        },
        {
            influence = ai.Spell.APPLY_AURA,
            aura_target = ai.SpellTarget.HOLDER,
            aura = ai.Aura.MODULE_DAMAGE_MOD,
            aura_param = 0.5,
            isBuff = true,
            gameplay_specific = true,
            hud_visible = false,
        },
		{
			influence = ai.Spell.APPLY_AURA,
			aura_target	= ai.SpellTarget.HOLDER,
			aura = ai.Aura.SPY_DRONE,
			duration = 0.1,
			isBuff = false,
			gameplay_specific = true,
			hud_visible = false,
		},
    },
}

Def.Bonus_HungerVision =
{
    class = "ScBaseEntity",
    in_editor = false,
    hudType = "default",
    model = "models/objects/gameplay/bonuses/speed_booster",
    uiName = "Bonus_HungerVision_name",

    max_detection_distance = 1000.0,
    vision_radius_coef = 0.5, -- для глоу

    spell_approach = "Bonus_HungerVision",
    spell_approach_trigger_radius = 20.0,
    spell_approach_trigger_sound = "sound/game/bonus_take",
    spell_approach_respawn_timer = 0,

    death_effect = "particles/ships/looted",
    end_effect = "particles/objects/bonuses/hg/hg_bonus_cyan_explosion",

    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_cyan", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_cyan_sphere", joint = "root3" },
    }
}

Spell.Bonus_HungerVision =
{
    aura        = ai.Aura.VISION_RADIUS_MOD,
    aura_param  = 0.3,
    isBuff      = true,
    aura_target = ai.SpellTarget.HOLDER,
    max_stacks  = 99,
    cast_fx     = "particles/gadget/aura_wave",
    ui_ico      = { target_system = { tex = "ItemSubtype_AoeStealthDrone", }, },
	
	additional_auras =
    {
		{
			influence = ai.Spell.APPLY_AURA,
			aura_target	= ai.SpellTarget.HOLDER,
			aura = ai.Aura.SPY_DRONE,
			duration = 0.1,
			isBuff = false,
			gameplay_specific = true,
			hud_visible = false,
		},
    },
}

Def.Bonus_HungerSpeed =
{
    class = "ScBaseEntity",
    in_editor = false,
    hudType = "default",
    model = "models/objects/gameplay/bonuses/speed_booster",
    uiName = "Bonus_HungerSpeed_name",

    max_detection_distance = 1000.0,
    vision_radius_coef = 0.5,

    spell_approach = "Bonus_HungerSpeed",
    spell_approach_trigger_radius = 20.0,
    spell_approach_trigger_sound = "sound/game/bonus_take",
    spell_approach_respawn_timer = 0,

    death_effect = "particles/ships/looted",
    end_effect = "particles/objects/bonuses/hg/hg_bonus_blue_explosion",

    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_blue", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
    }
}

Spell.Bonus_HungerSpeed =
{
    aura        = ai.Aura.FAST_MOVEMENT,
    aura_param  = 0.3,
    isBuff      = true,
    aura_target = ai.SpellTarget.HOLDER,
    max_stacks  = 99,
    cast_fx     = "particles/gadget/aura_wave",
    ui_ico      = { target_system = { tex = "ItemSubtype_FootballSecondBreath", }, },
		
	additional_auras =
    {
		{
			influence = ai.Spell.APPLY_AURA,
			aura_target	= ai.SpellTarget.HOLDER,
			aura = ai.Aura.SPY_DRONE,
			duration = 0.1,
			isBuff = false,
			gameplay_specific = true,
			hud_visible = false,
		},
    },
}

Def.Bonus_HungerResist =
{
    class = "ScBaseEntity",
    in_editor = false,
    hudType = "default",
    model = "models/objects/gameplay/bonuses/speed_booster",
    uiName = "Bonus_HungerResist_name",

    max_detection_distance = 1000.0,
    vision_radius_coef = 0.5,

    spell_approach = "Bonus_HungerResist",
    spell_approach_trigger_radius = 20.0,
    spell_approach_trigger_sound = "sound/game/bonus_take",
    spell_approach_respawn_timer = 0,

    death_effect = "particles/ships/looted",
    end_effect = "particles/objects/bonuses/hg/hg_bonus_green_explosion",

    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_green", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_green_sphere", joint = "root3" },
    }
}

Spell.Bonus_HungerResist =
{
    aura        = ai.Aura.RESIST_ALL,
    aura_param  = 5,
    isBuff      = true,
    aura_target = ai.SpellTarget.HOLDER,
    max_stacks  = 99,
    cast_fx     = "particles/gadget/aura_wave",
    ui_ico      = { target_system = { tex = "ItemSubtype_RepairDronesLarge", }, },
		
	additional_auras =
    {
		{
			influence = ai.Spell.APPLY_AURA,
			aura_target	= ai.SpellTarget.HOLDER,
			aura = ai.Aura.SPY_DRONE,
			duration = 0.1,
			isBuff = false,
			gameplay_specific = true,
			hud_visible = false,
		},
    },
}

Def.Bonus_HungerCritical =
{
    class = "ScBaseEntity",
    in_editor = false,
    hudType = "default",
    model = "models/objects/gameplay/bonuses/speed_booster",
    uiName = "Bonus_HungerCritical_name",

    max_detection_distance = 1000.0,
    vision_radius_coef = 0.5,

    spell_approach = "Bonus_HungerCritical",
    spell_approach_trigger_radius = 20.0,
    spell_approach_trigger_sound = "sound/game/bonus_take",
    spell_approach_respawn_timer = 0,

    death_effect = "particles/ships/looted",
    end_effect = "particles/objects/bonuses/hg/hg_bonus_yellow_explosion",

    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_yellow", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_yellow_sphere", joint = "root3" },
    }
}

Spell.Bonus_HungerCritical =
{
    aura        = ai.Aura.CRIT_CHANCE,
    aura_param  = 0.5,
    isBuff      = true,
    aura_target = ai.SpellTarget.HOLDER,
    max_stacks  = 99,
    cast_fx     = "particles/gadget/aura_wave",
    ui_ico      = { target_system = { tex = "ItemSubtype_HunterZone", }, },
		
	additional_auras =
    {
		{
			influence = ai.Spell.APPLY_AURA,
			aura_target	= ai.SpellTarget.HOLDER,
			aura = ai.Aura.SPY_DRONE,
			duration = 0.1,
			isBuff = false,
			gameplay_specific = true,
			hud_visible = false,
		},
    },
}
