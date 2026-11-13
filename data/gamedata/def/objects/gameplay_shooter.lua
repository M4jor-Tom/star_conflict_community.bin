-- Снайпер
--      Снайперское ружо
--      Броня 1
--      Дамаг 3 (только в режиме снайпера)
--      В режиме снайпера не летает и малый угол обзора.
--      При переходе в режим и после выстрела кд.
--      Когда в режиме снайпера - рисуется луч.

-- Хилер
--      Хил и баф союзников
--      Броня 3
--      Дамаг 1 (но аое)
--      Слабый хил себя (или не надо?)
--      Сильный хил и баф союзника.
--      Раскрывает рог

-- Дамаггер
--      Броня 2
--      Дамаг 2 (скорострельное лазерное оружие)
--      Спецабилка - берсерк

-- Рога
--      Броня 1
--      Дамаг 2
--      Спецабилка - невидимость
--      В невидимости можно сидеть сколько угодно

Def.Ship_Shooter_Base =
{
    inherit = "Ship_Small",
    role = ai.ShipRoles.SCOUT,
    rank = 17,
    hangarIcoSmall = "Race3_S_T2_small",
    race = ai.Race.FEDERATION,

    contact_damage_min_speed = 3.5,
    contact_damage_cf = 80,
    min_hull_damage_for_death = 0.31,
    max_hull_damage_for_death = 0.33,

    energy_regen = 5,
    energy_max = 200,

    shield_max = 1000,
    shield_regen = 100,

    lock_time = 2,
    vision_radius = 1000,

    max_speed = 5,
    deceleration = 1,
    decel_afterburning = 8,
    acceleration = 5,
    reverse_accel = 5,
    boost_accel_coef = 8,
    max_xspeed = 1.75,
    accel_x0 = 3.75,
    accel_x1 = 3.75,
    decel_x = 1.5,
    max_yspeed = 1.75,
    accel_y0 = 3.75,
    accel_y1 = 3.75,
    decel_y = 1.5,
    boost_maxspeed_coef = 3,
    boost_energy_cost_per_second = 190,

    rot_xmaxspeed       = 120,
    rotaccel_x0         = 999,
    rotaccel_x1         = 999,
    rotdecel_x          = 999,
    rot_ymaxspeed       = 120,
    rotaccel_y0         = 999,
    rotaccel_y1         = 999,
    rotdecel_y          = 999,
    rot_zmaxspeed       = 120,
    rotaccel_z0         = 999,
    rotaccel_z1         = 999,
    rotdecel_z          = 999,

    default_custom_elements =
    {
        [ ai.VesselCustomSlot.MATERIAL_0 ] = "Default_Race1_Def_1",
        [ ai.VesselCustomSlot.MATERIAL_1 ] = "Default_Race1_Def_2",
        [ ai.VesselCustomSlot.MATERIAL_2 ] = "Default_Race1_Def_3",
    },

    customization_groups =
    {
        [ ai.VesselCustomSlot.MATERIAL_0 ] = { VesselCustomElementsGroups.DEFAULT },
        [ ai.VesselCustomSlot.MATERIAL_1 ] = { VesselCustomElementsGroups.DEFAULT },
        [ ai.VesselCustomSlot.MATERIAL_2 ] = { VesselCustomElementsGroups.DEFAULT },
        [ ai.VesselCustomSlot.MPRESET_0 ] = { VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.LINES }
    },

    slot_bones =
    {
        [ ai.SpaceShipModuleSlot.ACTIVE_01 ] = "active_up_1",
        [ ai.SpaceShipModuleSlot.ACTIVE_02 ] = "active_up_2",
        [ ai.SpaceShipModuleSlot.ACTIVE_03 ] = "active_up_3",
        [ ai.SpaceShipModuleSlot.ACTIVE_04 ] = "active_up_4",
    },

    capacitor_grades = { { "ModuleCapacitor_Race1_Large_Mk1", 0 }, },
    engine_grades = { { "ModuleEngine_Race1_Large_Mk1", 0 }, },

    spawn_timeout = 10,

    storeItemId = 0,
}

Def.Ship_Shooter_Damager =
{
    inherit = "Ship_Shooter_Base",

    hull_health = 2000,

    default_modules =
    {
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Shooter_Plasmagun_Heavy",
        [ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_Shooter_Damager_Special",
    },

    ship_name = "Ship_Shooter_Damager",
}

Def.Ship_Shooter_Healer =
{
    inherit = "Ship_Shooter_Base",

    hull_health = 3000,

    default_modules =
    {
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Shooter_Plasmagun",
        [ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_Shooter_Healer_Special",
        [ ai.SpaceShipModuleSlot.ACTIVE_01 ] = "Module_Shooter_Healer_BuffAll",
    },

    ship_name = "Ship_Shooter_Healer",
}

Def.Ship_Shooter_Sniper =
{
    inherit = "Ship_Shooter_Base",

    hull_health = 1000,

    default_modules =
    {
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Shooter_Plasmagun",
        [ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_Shooter_Sniper_Special",
    },
    --default_rocket_munition = "SpaceMissile_Cruise_CloseTest",

    ship_name = "Ship_Shooter_Sniper",
}

Def.Ship_Shooter_Rogue =
{
    inherit = "Ship_Shooter_Base",

    hull_health = 1000,

    default_modules =
    {
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Shooter_Plasmagun",
        [ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_Shooter_Rogue_Special",
    },

    ship_name = "Ship_Shooter_Rogue",
}



Def.Module_Shooter_Damager_Special =
{
    class = "ActiveModule",

    cooldown = 40,
    spell = "Shooter_Damager_Special1",
    additional_spell = "Shooter_Damager_Special2",

    item_subtype = ItemSubtype.TimeBoost,
    module_type = ai.ModuleType.SPECIAL,
    default_icon = "ItemSubtype_TimeBoost",
    uiName = "Special_TimeBoost_Faction1",
    uiDesc = "Special_TimeBoost_Faction1_Desc",
}

Spell.Shooter_Damager_Special1 =
{
    duration = 7,
    aura_param = 0.5,

    target = ai.SpellTarget.CASTER,
    aura = ai.Aura.OVERCHARGE,
    aura_target = ai.SpellTarget.HOLDER,
    isBuff = true,

    aura_apply_fx = "particles/gadget/aura_breacktrough",

    ui_ico = { target_system = { tex = "ItemSubtype_TimeBoost", }, },
}

Spell.Shooter_Damager_Special2 =
{
    duration = 7,
    aura_param = 30,

    target = ai.SpellTarget.CASTER,
    aura_target = ai.SpellTarget.HOLDER,
    aura = ai.Aura.RESIST_ALL,
    isBuff = true,

    ui_ico = { target_system = { tex = "ItemSubtype_TimeBoost", }, },
}

Def.Module_Shooter_Sniper_Special =
{
    class = "Disintegrator",
    in_editor = false,

    energy_cost = 0,
    cooldown = 0,
    energy_cost_per_second = 0,
    zoom_value = 4,
    max_range = 100,
    fire_rate = 15,
    optimal_range = 850,
    projectile_speed = 1000,
    damage_thermal = 10000,

    hit_effect = "particles/weapons/sniper/hit",
    impact_type = "disintegrator",
    shot_beam = "particles/weapons/sniper/beam",
    aim_beam = "particles/weapons/sniper/targeting",
    -- shot_once_sound = "sound/weapons/turret/turret_oneshot",
    ready_sound = "sound/gadgets/disintegrator/dis_ready",
	zoom_changed_sound = "sound/gadgets2/AdvancedZoom",

    aim_flare_size = 0.4,
    aim_flare_nebulosity = 0.5,
    aim_flare_angle = 20.0,
    aim_flare_color = "255 50 50 80",

    item_subtype = ItemSubtype.Disintegrator,
    module_type = ai.ModuleType.SPECIAL,
    default_icon = "ItemSubtype_Disintegrator",
    uiName = "Special_Disintegrator_Base",
    uiDesc = "Special_Disintegrator_Base_Desc",

    storeItemId = 0,
}

Def.Module_Shooter_Healer_Special =
{
    class = "ActiveModule",
    in_editor = false,

    cooldown = 0,
    trigger_aura = true,
    spell = "Shooter_Healer_Special",
    model="models/modules/m_active/m_a_gadget_pulsar",

    item_subtype=ItemSubtype.SmartBomb,
    module_type = ai.ModuleType.ACTIVE,
    default_icon="ItemSubtype_SmartBomb",
    influence_type_color=InfluenceTypeColor.DAMAGE_TERMAL,

    storeItemId = 0,
}

Spell.Shooter_Healer_Special =
{
    aura_range = 80,
    aura_param = 550,
    duration = 12,
    period = 1,

    target = ai.SpellTarget.CASTER,
    aura = ai.Aura.DAMAGE_THERMAL_PERIODIC,
    aura_target = ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
    isBuff = false,

    ui_ico = { target_system = { tex = "ItemSubtype_SmartBomb", }, },
}

Def.Module_Shooter_Healer_BuffAll =
{
    class = "ActiveModule",
    in_editor = false,

    cooldown = 20,
    spell = "Shooter_Healer_BuffAll",

    model="models/modules/m_active/m_a_gadget_pulsar",

    item_subtype = ItemSubtype.SmartBomb,
    module_type = ai.ModuleType.ACTIVE,
    default_icon = "ItemSubtype_SmartBomb",
    influence_type_color = InfluenceTypeColor.DAMAGE_TERMAL,

    storeItemId = 0,
}

Spell.Shooter_Healer_BuffAll =
{
    duration = 5,
    aura_param = 0.2,
    aura_range = 50,

    aura = ai.Aura.DAMAGE_MOD,
    target = ai.SpellTarget.CASTER,
    aura_target =
    {
        class = ai.SpellTargetClass.SHIP,
        relationship = ai.SpellTargetRelationship.ALLY,
        vitality = ai.SpellTargetVitality.ALIVE,
        area = ai.SpellTargetArea.AROUND,
        misc = ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
    },
    isBuff = true,

    ui_ico = { target_system = { tex = "ItemSubtype_AchillesTargetingUnit", }, },
}

Def.Module_Shooter_Rogue_Special =
{
    class = "ActiveModule",
    in_editor = false,

    cooldown = 30,

    spell = "Shooter_Hide",
    deactivate_spell = "Shooter_Hide_Bonus",

    activate_sound = "sound/gadgets/stealth_on",
    deactivate_sound = "sound/gadgets/stealth_off",

    item_subtype = ItemSubtype.CloakingDevice,
    default_icon ="ItemSubtype_CloakingDevice",
    module_type = ai.ModuleType.SPECIAL,
    uiName = "Special_CloakingDevice_Base",
    uiDesc = "Special_CloakingDevice_Base_Desc",

    storeItemId = 0,
}

Spell.Shooter_Hide =
{
    target = ai.SpellTarget.CASTER,
    aura = ai.Aura.STEALTH,
    dispell_flag = ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
    dispell_timeout = 2,
    isBuff = true,

    ui_ico = { target_system = { tex = "ItemSubtype_CloakingDevice", }, },
}

Spell.Shooter_Hide_Bonus =
{
    duration = 5,
    aura_param = 0.2,

    target = ai.SpellTarget.CASTER,
    aura = ai.Aura.DAMAGE_MOD,
    influence = ai.Spell.APPLY_AURA,
    isBuff = true,

    ui_ico = { target_system = { tex = "ItemSubtype_AchillesTargetingUnit", }, },
}

Def.Weapon_Shooter_Plasmagun =
{
    inherit = "Weapon_AutoGun",

    fire_rate = 220,
    projectile_speed = 400,
    dispersion = 0,
    optimal_range = 30,
    max_range = 30,
    damage_emp = 200,

    model = "models/weapons/plasma_gun/plasma_gun_mod1",
    projectile = "Projectile_Plasma_Light",

    item_subtype = ItemSubtype.PlasmagunBasic,
    default_icon = "equipSlot_WEAPON",
    module_type = ai.ModuleType.WEAPON,
    weapon_class = ai.WeaponClass.PLASMAGUN,

    storeItemId = 0,
}

Def.Weapon_Shooter_Plasmagun_Heavy =
{
    class = "SingularityCannon",
    in_editor = false,

    fire_rate = 30,
    dispersion = 0,
    projectile_speed = 50,
    optimal_range = 200,
    max_range = 200,
    damage = 0,
    damage_emp = 500,
    damage_kinetic = 0,
    damage_thermal = 0,

    model = "models/weapons/plasma/power/pl_training",
    projectile = "Projectile_Shooter_Plasmagun_Heavy",
    shot_once_sound = "sound/weapons/singularity/sg_shot",
    shot_beam_fx = "particles/weapons/big/plasma_slow_2_beam",

    item_subtype = ItemSubtype.PlasmagunHeavy,
    default_icon = "ItemSubtype_PlasmagunHeavy",
    module_type = ai.ModuleType.WEAPON,
    weapon_class = ai.WeaponClass.PLASMAGUN,

    storeItemId = 0,
}

Def.Projectile_Shooter_Plasmagun_Heavy =
{
    class = "SingularityProjectile",
    in_editor = false,

    hitbox_min = Vec3( -0.5, -0.5, -0.5 ),
    hitbox_max = Vec3( 0.5, 0.5, 0.5 ),
    damage_radius = 4,
    impact_type = "singularity",

    hit_effect = "particles/weapons/plasma/hit",
    work_sound = "sound/weapons/singularity/sg_fly",
    effect = "particles/weapons/big/plasma_slow_2",

    singularity_hit_fx = "particles/empty",
    singularity_hit_sound = "sound/hit/singularity_ship",
}
















local close_scale = 5.0

--[[
Def.Ship_CloseTest_Maneur =
{
    inherit="Ship_Medium",

    ship_tier=1,
    ship_class=ai.ShipClass.MEDIUM,

    energy_regen = 100,
    energy_max = 999,
    shield_max = 9999,
    shield_regen = 0,
    hull_health = 9999,

    max_speed           = 5 * close_scale,
    acceleration        = 5 * close_scale,
    deceleration        = 5 * close_scale,
    decel_afterburning  = 5 * close_scale, -- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 

    max_xspeed          = 2 * close_scale,
    accel_x0            = 2 * close_scale, -- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
    accel_x1            = 2 * close_scale,
    decel_x             = 2 * close_scale,
    max_yspeed          = 1 * close_scale,
    accel_y0            = 1 * close_scale,
    accel_y1            = 1 * close_scale,
    decel_y             = 1 * close_scale,

    rot_xmaxspeed       = 120,
    rotaccel_x0         = 999,
    rotaccel_x1         = 999,
    rotdecel_x          = 999,
    rot_ymaxspeed       = 120,
    rotaccel_y0         = 999,
    rotaccel_y1         = 999,
    rotdecel_y          = 999,
    rot_zmaxspeed       = 120,
    rotaccel_z0         = 999,
    rotaccel_z1         = 999,
    rotdecel_z          = 999,

    boost_energy_cost_per_second=0,
    death_wreck="Wreck_R1_M",
    race=ai.Race.EMPIRE,
    default_custom_elements={
        [ai.VesselCustomSlot.MATERIAL_0]="Default_Race1_Def_1",
        [ai.VesselCustomSlot.MATERIAL_1]="Default_Race1_Def_4",
        [ai.VesselCustomSlot.MATERIAL_2]="Default_Craft_r1_2",
    },

    customization_groups={
        [ ai.VesselCustomSlot.MATERIAL_0 ]={VesselCustomElementsGroups.DEFAULT},
        [ ai.VesselCustomSlot.MATERIAL_1 ]={VesselCustomElementsGroups.DEFAULT},
        [ ai.VesselCustomSlot.MATERIAL_2 ]={VesselCustomElementsGroups.DEFAULT},
        [ ai.VesselCustomSlot.MPRESET_0 ]={VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.LINES},
    },
    cam_config="cam_ship_medium_imp",
    model="models/ships/race_1/m/race1_m_t1_m2",
    hangarIco="Race1_M_T1_Skin1",
    default_icon="shopIco_Ship_Race1_M_T1_Skin1",
    hangarIcoSmall="Race1_M_T1_small",
    storeItemId=24,
    item_subtype=ItemSubtype.Ship,
    slot_bones={
        [ai.SpaceShipModuleSlot.ACTIVE_01]="active_up_1",
        [ai.SpaceShipModuleSlot.ACTIVE_02]="active_up_2",
        [ai.SpaceShipModuleSlot.ARMOR_MOD_01]="root",
        [ai.SpaceShipModuleSlot.ENGINE_MOD_01]="root",
        [ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]="root",
    },
    cpu_grades=designers.cpu_medium_grades,
    armor_grades=designers.armor_grades,
    shield_grades=designers.shield_grades,
    capacitor_grades=designers.capacitor_medium_r1_t1m2,
    engine_grades=designers.engine_medium_r1_t1m2,
    default_modules={
        --[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Railgun_CloseTest",
        [ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_TimeBoost_T1_Base",
    },
    need_level_to_open=0,
    damage_mul=0.07,
    special_grades={
        [2]=ShipSpecBonus.ATTACK_BASE,
        [4]=ShipSpecBonus.BOOST_ENERGY,
    },
    ship_name="Ship_Race1_M_T1",
    spawn_timeout=10,
}
]]--

Def.Ship_Close_S =
{
    storeItemId = 0,
    inherit = "Ship_Race2_S_T4_Pirate",

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

    default_modules =
    {
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_BubbleGun_Close",
        --[ ai.SpaceShipModuleSlot.ACTIVE_01 ] = "Module_FuelEmissions_Close",
        --[ ai.SpaceShipModuleSlot.ACTIVE_02 ] = "Module_GrowingStar_Close",
        --[ ai.SpaceShipModuleSlot.ACTIVE_03 ] = "Module_Companion_Close",
        --[ ai.SpaceShipModuleSlot.ACTIVE_04 ] = "Module_GreenFakeShips_Close",
    },
}

Def.Ship_Close_M =
{
    storeItemId = 0,
    inherit = "Ship_Race1_M_T3_Steam",

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

    default_modules =
    {
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Railgun_CloseTest",
    },
}

Def.Ship_Close_L =
{
    inherit = "Ship_Race1_L_T2",

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

    default_modules =
    {
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Laser_CloseTest",
        [ ai.SpaceShipModuleSlot.ACTIVE_01 ] = "Module_SniperOverload_T2_Mk1",
        [ ai.SpaceShipModuleSlot.ACTIVE_02 ] = "Module_RepairDrones_l_T2_Mk1",
        [ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_Harpoon",
    },

    default_rocket_munition = "SpaceMissile_Cruise_CloseTest",

    storeItemId = 0,
}

Def.Weapon_Railgun_CloseTest =
{
    storeItemId = 0,
    inherit="Weapon_Railgun_Basic_T1_Mk0",

    projectile_speed    = Def[ "Weapon_Railgun_Basic_T1_Mk0" ].projectile_speed / close_scale,
    optimal_range       = Def[ "Weapon_Railgun_Basic_T1_Mk0" ].optimal_range / close_scale,
    max_range           = Def[ "Weapon_Railgun_Basic_T1_Mk0" ].max_range / close_scale,
}

Def.Weapon_Laser_CloseTest =
{
    storeItemId = 0,
    inherit="Weapon_Laser_Basic_T2_Mk1",

    optimal_range       = Def[ "Weapon_Laser_Basic_T2_Mk1" ].optimal_range / close_scale,
    max_range           = Def[ "Weapon_Laser_Basic_T2_Mk1" ].max_range / close_scale,
}

Def.SpaceMissile_Cruise_CloseTest =
{
    storeItemId = 0,
    inherit="SpaceMissile_Cruise_T1_Mk3",

    detonation_radius   = Def[ "SpaceMissile_Cruise_T1_Mk3" ].detonation_radius / close_scale,
    speed               = Def[ "SpaceMissile_Cruise_T1_Mk3" ].speed / close_scale,
    max_range           = Def[ "SpaceMissile_Cruise_T1_Mk3" ].max_range / close_scale,
}

Def.Weapon_BubbleGun_Close =
{
    storeItemId = 0,
    inherit = "Weapon_BubbleGun_T5_Epic",

    optimal_range       = Def[ "Weapon_BubbleGun_T5_Epic" ].optimal_range / close_scale,
    max_range           = Def[ "Weapon_BubbleGun_T5_Epic" ].max_range / close_scale,
}

Def.Module_FuelEmissions_Close =
{
    storeItemId = 0,
    inherit = "Module_FuelEmissions_T5_Epic",
}

Def.Module_GrowingStar_Close =
{
    storeItemId = 0,
    inherit = "Module_GrowingStar_T5_Epic",

    projectile_speed    = Def[ "Module_GrowingStar_T5_Epic" ].projectile_speed / close_scale,
    max_range           = Def[ "Module_GrowingStar_T5_Epic" ].max_range / close_scale,
    -- разобраться с бластвейвом проджектайла
}

Def.Module_Companion_Close =
{
    storeItemId = 0,
    inherit = "Module_Companion_T5_Epic",
}

Def.Module_GreenFakeShips_Close =
{
    storeItemId = 0,
    inherit = "Module_GreenFakeShips_T5_Epic",
}

Def.Module_RadiationCloud_Close =
{
    storeItemId = 0,
    inherit = "Module_RadiationCloud_T5_Epic",
}
