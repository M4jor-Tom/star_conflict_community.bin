Def.Ship_Footballer =
{
    inherit = "Ship_Race1_M_T5_Premium",

    hull_health         = 20000,
    shield_max          = 500,
    energy_max          = 200,

    max_speed           = 10,
    deceleration        = 0.5,
    decel_afterburning  = 8,
    acceleration        = 5,
    reverse_accel       = 5,
    boost_accel_coef    = 8,
    max_xspeed          = 1.75,
    accel_x0            = 3.75,
    accel_x1            = 3.75,
    decel_x             = 1.5,
    max_yspeed          = 1.75,
    accel_y0            = 3.75,
    accel_y1            = 3.75,
    decel_y             = 1.5,
    boost_maxspeed_coef = 3,
    rot_speed_mul       = 1.2,
    strafe_speed_mul    = 0.5,

    energy_regen                    = 1,
    boost_energy_cost_per_second    = 110,

    hull_resist_kinetic = 1000,
    hull_resist_emp     = 1000,
    hull_resist_thermal = 1000,
    contact_damage_cf   = 0,
    hull_regen          = 1000,
    shield_regen        = 50,

    default_modules =
    {
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_FootballGun",
        [ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "Weapon_BallLauncher",
        [ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_Harpoon",
    },

    default_rocket_munition = "Football_ball",

    storeItemId = 0,

    use_team_skin = true,
    mark_effect =  { s1 = "particles/gadget/football/football_mark_blue", s2 = "particles/gadget/football/football_mark_red", },--Effects_Mark,--"particles/gadget/football/football_mark_blue",
    mark_effect_offset = 5,

    ship_name = "Ship_Football",
}

Spell.BallHolder =
{
    isBuff = false,
    aura = ai.Aura.SLOW_MOVEMENT,
    target = ai.SpellTarget.CASTER,
    aura_param = 0.4,
    hud_visible = false,
}

Spell.BallHunter =
{
    aura_target = ai.SpellTargetGeneral.HOLDER,
    aura = ai.Aura.RESIST_ALL,
    aura_param = 10000,
    isBuff = true,
    hud_visible = false,

    additional_auras =
    {
        {
            aura_target = ai.SpellTargetGeneral.HOLDER,
            aura = ai.Aura.HEAL_SHIELD_PERIODIC,
            aura_param = 500,
            isBuff = true,
            hud_visible = false,
        }
    },
}

--#82982
Def.Module_Harpoon =
{
    inherit             = "Weapon_Base",
    class               = "HarpoonGun",

    cooldown            = 15,
    energy_cost         = 0,

    projectile          = "Projectile_Harpoon",
    projectile_speed    = 480,
    optimal_range       = 60,
    max_range           = 200,
    track               = ai.TrackMode.AIM,
    barrel_rot_speed    = 360,

    need_shield_coef              = 0.0,
    reduce_cooldown_if_blank_shot = 1.0,

    no_attach_rope_to_static      = true,
    no_attach_rope_to_allies      = true,
    no_attach_rope_to_ships       = false,
    no_attach_rope_to_ball_holder = false,
    no_attach_rope_to_ball_hunter = true,

    dispersion          = 0,
    crit_chance         = 0,

    shoot_mode          = ai.FiringModuleShootMode.SINGLE_SHOT, --#83218

    shot_once_sound     = "sound/gadgets/Harpoon/harpoon_fire",
    default_icon        = "ItemSubtype_FootballHarpoon",
    item_subtype        = ItemSubtype.Harpoon,
    connection_beam_fx  = "particles/gadget/hack_beam_blue",
}

--#82982
Def.Projectile_Harpoon =
{
    inherit         = "Projectile_Plasma_Default",
    model           = "models/objects/gameplay/ball/rope/harpoon",

    effect          = "particles/weapons/missile/rocket_trail_small",
    death_entity    = "Rope_Football_Red",
    impact_type     = "plasma",
}

-- Гарпунная веревка
Def.Rope_Football_Red =
{
    class                       = "Rope",
    in_editor                   = false,
    model                       = "models/objects/gameplay/ball/rope/rope_football",
    detach_sound                = "sound/gadgets/Harpoon/harpoon_detach",

    rope_max_absolute_stretch   = 20,
    rope_max_relative_stretch   = 2,
    rope_min_mass               = 30,
    rope_max_mass               = 800,
    rope_mass_coef              = 0.15,
    rope_coil_needs_length_min = 0,
    rope_coil_speed = 10,

    use_team_skin = true,

    hardness_time = 1,
}

Def.Weapon_FootballGun =
{
    inherit             = "Weapon_Base",
    class               = "AutoGun",

    cycle_barrels       = true,

    fire_rate           = 40,
    shot_energy_cost    = 0,

    dispersion          = 0,
    dispersion_max      = 0,
    dispersion_add      = 0,
    dispersion_sub      = 0,

    max_range           = 200,
    projectile_speed    = 100,

    damage_kinetic      = 300,
    damage_emp          = 0,
    damage_thermal      = 0,

    no_friendly_fire    = true,

	muzzleflash_color = { kinetic = "255 210 146 100", emp = "255 210 146 100", thermal = "255 210 146 100", },
    muzzleflash_radius  = 20,

    projectile          = "Projectile_FootballGun",

    shot_once_sound     = "sound/weapons/football_cannon/fc_shot",
    model               = "models/weapons/rail_guns/econom/rg_training",
    shot_effect         = "particles/weapons/artillery_big_muzzle",
    default_icon        = "ItemSubtype_RailgunBasic_5",
    item_subtype        = ItemSubtype.FootballGun,
}

Def.Projectile_FootballGun =
{
    inherit = "Projectile_Nail_Iron_Light",
    mass    = 0.7,
}

Def.Weapon_BallLauncher =
{
    class                   = "BallLauncher",
    in_editor               = false,

    replace_extra_entities  = false,
    activate_entity_max     = 2, -- #66543

    cant_be_bought          = true,
    kick_impulse_coef       = 30.0,
    pass_cone_angle         = 0,
    pass_range              = 60, -- выключаем пас
    pass_time               = 2, --выключаем пас
    shot_once_sound         = "sound/weapons/BallLauncher/BallLauncher_fire",
}

Def.Football_ball =
{
    class = "FootballBall",
    in_editor = false,
    model = "models/objects/gameplay/ball/ball_01",
    physics = { solid_type = solid.model, mass = 10, material = "ShipMetalMk1", damping = 0.4, rot_damping = 0.5, },
    player_cant_take_ball_time = 2,
    need_shield_coef = 0.5,
    ally_can_take_away = false,

    max_speed = 70,
    acceleration = 200,

    attach_enable = true,
    attach_bone = "root",
    attach_offset = Vec3( 0, 0, -5),
    attach_max_range = 1,

    use_team_skin = true,

    default_icon = "ItemSubtype_BallLauncher",
    item_subtype = ItemSubtype.BallLauncher,
    module_type = ai.ModuleType.ROCKET,

    kick_effect = "particles/gadget/football/football_kick",
    holder_effect = "particles/gadget/football/football_holder",
    in_fx = "particles/gadget/football/football_inout",
    out_fx = "",

    children =
    {
        { effect = "particles/gadget/football/football_ball", joint = "ball_0" },
    }
}

Def.Football_goldball =
{
    class       = "AnimatedEntity",
    in_editor   = true,
    model       = "models/objects/gameplay/gate/statue_ball",
    maxViewDist = 10000,
}

Def.Football_dial =
{
    class           = "AnimatedEntity",
    in_editor       = true,
    model           = "models/objects/gameplay/gate/dial_01",
    maxViewDist     = 10000,
    use_team_skin   = true,
}

Def.Football_dial2 =
{
    class           = "AnimatedEntity",
    in_editor       = true,
    model           = "models/objects/gameplay/gate/dial_02",
    maxViewDist     = 10000,
    use_team_skin = true,
}

Def.Football_dial3 = 
{
    class           = "AnimatedEntity",
    in_editor       = true,
    model           = "models/objects/gameplay/gate/dial_03",
    maxViewDist     = 10000,
    use_team_skin   = true,
}

Def.Football_dial4 =
{
    class           = "AnimatedEntity",
    in_editor       = true,
    model           = "models/objects/gameplay/gate/dial_04",
    maxViewDist     = 10000,
    use_team_skin   = true,
}

Def.Football_footballvorota01 =
{
    class           = "ScBaseEntity",
    in_editor       = true,
    model           = "models/objects/gameplay/gate/football_vorota_01",
    maxViewDist     = 10000,
    use_team_skin   = true,
}

Def.Football_footballvorota02 =
{
    class           = "ScBaseEntity",
    in_editor       = true,
    model           = "models/objects/gameplay/gate/football_vorota_02",
    maxViewDist     = 10000,
    use_team_skin   = true,
}

-- на мяч
Def.Football_eff1 =
{
	class		=	"ScBaseEntity",
	in_editor	=	false,
	children 	= 	{{ effect ="particles/jumpgates/allidium_energy_sphere", joint = "root" },},
}

-- на игрока с мячом
Def.Football_eff2 =
{
	class		=	"ScBaseEntity",
	in_editor	=	false,
	children 	=	{
		{ effect ="particles/gadget/pshield_1", joint = "root" }, -- скалируется вверх оч сильно
		{ effect ="particles/gadget/shelter_shield", joint = "root" },
	},
}

Def.Football_gate =
{
    class           = "BaseEntity",
    in_editor       = true,
    damageable      = false,
    maxViewDist     = 20000,
    physics         = { solid_type = solid.compound_model, static = true, material = "Metal",},
    model           = "models/objects/gameplay/gate/gate",
    use_team_skin   = true,
}

Def.Football_barrier =
{
    class       = "BaseEntity",
    in_editor   = true,
    damageable  = false,
    model       = "models/objects/gameplay/gate/barrier",
    physics     = { solid_type = solid.model, dynamic = true, mass = 5000, },
}

FootballSettings =
{
    max_team_size = 3,
}
