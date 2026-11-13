local speed_scale = 1.0
local shoot_scale = 4.0

--[[Def.Ship_CloseTest_Maneur = {
    inherit="Ship_Medium",

    ship_tier=1,
    price=1,
    item_lvl=16,
    contact_damage_min_speed=4,
    contact_damage_cf=12,
    min_hull_damage_for_death=0.31,
    max_hull_damage_for_death=0.33,
    cargo_hold_size=5,
    repair_cost=200,
    role=ai.ShipRoles.ATTACK,
    mastery_bonus=0,
    base_preset="Ship_Race1_M_T1_Preset1",
    rank=1,
    ship_class=ai.ShipClass.MEDIUM,

    energy_regen = 100,
    energy_max = 999,
    shield_max = 9999,
    shield_regen = 0,
    hull_health = 9999,

    max_speed           = 5 * speed_scale,
    acceleration        = 5 * speed_scale,
    deceleration        = 5 * speed_scale,
    decel_afterburning  = 5 * speed_scale, -- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 

    max_xspeed          = 2 * speed_scale,
    accel_x0            = 2 * speed_scale, -- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
    accel_x1            = 2 * speed_scale,
    decel_x             = 2 * speed_scale,
    max_yspeed          = 1 * speed_scale,
    accel_y0            = 1 * speed_scale,
    accel_y1            = 1 * speed_scale,
    decel_y             = 1 * speed_scale,

    rot_xmaxspeed       = 120, -- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
    rotaccel_x0         = 999, -- ускорение поворота вокруг оси X, pitch (градус/c/c) 
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
]]



Def.Ship_CloseTest_S = {
    storeItemId = 0,
    inherit = "Ship_Race2_M_T1_Faction1",

    max_speed           = Def[ "Ship_Small" ].max_speed / speed_scale,
    acceleration        = Def[ "Ship_Small" ].acceleration / speed_scale,
    deceleration        = Def[ "Ship_Small" ].deceleration / speed_scale,
    decel_afterburning  = Def[ "Ship_Small" ].decel_afterburning / speed_scale,

    max_xspeed          = Def[ "Ship_Small" ].max_xspeed / speed_scale,
    accel_x0            = Def[ "Ship_Small" ].accel_x0 / speed_scale,
    accel_x1            = Def[ "Ship_Small" ].accel_x1 / speed_scale,
    decel_x             = Def[ "Ship_Small" ].decel_x / speed_scale,
    max_yspeed          = Def[ "Ship_Small" ].max_yspeed / speed_scale,
    accel_y0            = Def[ "Ship_Small" ].accel_y0 / speed_scale,
    accel_y1            = Def[ "Ship_Small" ].accel_y1 / speed_scale,
    decel_y             = Def[ "Ship_Small" ].decel_y / speed_scale,

    default_modules={
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Railgun_CloseTest",
    },
}

Def.Ship_CloseTest_M = {
    storeItemId = 0,
    inherit = "Ship_Race1_M_T1",

    max_speed           = Def[ "Ship_Medium" ].max_speed / speed_scale,
    acceleration        = Def[ "Ship_Medium" ].acceleration / speed_scale,
    deceleration        = Def[ "Ship_Medium" ].deceleration / speed_scale,
    decel_afterburning  = Def[ "Ship_Medium" ].decel_afterburning / speed_scale,

    max_xspeed          = Def[ "Ship_Medium" ].max_xspeed / speed_scale,
    accel_x0            = Def[ "Ship_Medium" ].accel_x0 / speed_scale,
    accel_x1            = Def[ "Ship_Medium" ].accel_x1 / speed_scale,
    decel_x             = Def[ "Ship_Medium" ].decel_x / speed_scale,
    max_yspeed          = Def[ "Ship_Medium" ].max_yspeed / speed_scale,
    accel_y0            = Def[ "Ship_Medium" ].accel_y0 / speed_scale,
    accel_y1            = Def[ "Ship_Medium" ].accel_y1 / speed_scale,
    decel_y             = Def[ "Ship_Medium" ].decel_y / speed_scale,

    default_modules={
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Railgun_CloseTest",
    },
}

Def.Ship_CloseTest_L = {
    storeItemId = 0,
    inherit = "Ship_Race2_L_T3_Faction2",

    max_speed           = Def[ "Ship_Race2_L_T3_Faction2" ].max_speed / speed_scale,
    acceleration        = Def[ "Ship_Large" ].acceleration / speed_scale,
    deceleration        = Def[ "Ship_Large" ].deceleration / speed_scale,
    decel_afterburning  = Def[ "Ship_Large" ].decel_afterburning / speed_scale,

    max_xspeed          = Def[ "Ship_Large" ].max_xspeed / speed_scale,
    accel_x0            = Def[ "Ship_Large" ].accel_x0 / speed_scale,
    accel_x1            = Def[ "Ship_Large" ].accel_x1 / speed_scale,
    decel_x             = Def[ "Ship_Large" ].decel_x / speed_scale,
    max_yspeed          = Def[ "Ship_Large" ].max_yspeed / speed_scale,
    accel_y0            = Def[ "Ship_Large" ].accel_y0 / speed_scale,
    accel_y1            = Def[ "Ship_Large" ].accel_y1 / speed_scale,
    decel_y             = Def[ "Ship_Large" ].decel_y / speed_scale,

    default_modules={
        [ ai.SpaceShipModuleSlot.ACTIVE_02 ] = "Module_RepairDrones_l_T2_Mk1",
        [ ai.SpaceShipModuleSlot.ACTIVE_01 ] = "Module_SniperOverload_T2_Mk1",
        [ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ] = "Module_CapacitorRecharging_T1_Mk1",
        [ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ] = "ModulePassive_ArmorPlates_T1_Mk1",
        [ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ] = "ModulePassive_ResistHullEMP_T1_Mk1",
        [ ai.SpaceShipModuleSlot.CPU_MOD_01 ] = "ModulePassive_TurboScanner_T1_Mk1",
        [ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Laser_CloseTest",
    },

    default_rocket_munition = "SpaceMissile_Cruise_CloseTest",
}

Def.Weapon_Railgun_CloseTest = {
    storeItemId = 0,
    inherit = "Weapon_Railgun_Basic_T1_Epic",

    fire_rate = 210,
    projectile_speed = 450 / shoot_scale,

    optimal_range = 220 / shoot_scale,
    max_range = 300 / shoot_scale,

    dispersion = 0,
    dispersion_max = 2.0,
    dispersion_add = 0.3,
    dispersion_sub = 4.0,

    crit_chance = 0.4,
    crit_damage = 4,

    heat_max = 0,
    heat_add = 0,
    heat_sub = 0,
    overheat_time = 0,
}

Def.Weapon_Laser_CloseTest = {
    storeItemId = 0,
    inherit="Weapon_Laser_Sniper_T1_Epic",

    fire_rate = 350,
    projectile_speed = 418 / shoot_scale,

    dispersion = 0,
    dispersion_max = 2.5,
    dispersion_add = 0.3,
    dispersion_sub = 4.0,

    optimal_range = 300 / shoot_scale,
    max_range = 400 / shoot_scale,

    dispersion = 0,
    dispersion_max = 0,

    crit_chance = 0.4,
    crit_damage = 4,

    heat_max = 0,
    heat_add = 0,
    heat_sub = 0,
    overheat_time = 0,
}

Def.SpaceMissile_Cruise_CloseTest = {
    storeItemId = 0,
    inherit="SpaceMissile_Cruise_T1_Mk3",

    detonation_radius   = Def[ "SpaceMissile_Cruise_T1_Mk3" ].detonation_radius / shoot_scale,
    speed               = Def[ "SpaceMissile_Cruise_T1_Mk3" ].speed / shoot_scale,
    max_range           = Def[ "SpaceMissile_Cruise_T1_Mk3" ].max_range / shoot_scale,
}



















--[[
VesselTree.Ship_Race1_M_T1={}
VesselTree.Ship_Race1_M_T1_Faction1=nil
VesselTree.Ship_Race1_M_T2=nil
VesselTree.Ship_Race1_M_T2_Faction1=nil
VesselTree.Ship_Race1_M_T2_Faction2=nil



local slot_bones={}
slot_bones[ai.SpaceShipModuleSlot.ACTIVE_01]="active_up_1"
slot_bones[ai.SpaceShipModuleSlot.ACTIVE_02]="active_up_2"
slot_bones[ai.SpaceShipModuleSlot.ACTIVE_03]="active_up_3"
slot_bones[ai.SpaceShipModuleSlot.ACTIVE_04]="active_up_4"
slot_bones[ai.SpaceShipModuleSlot.ENGINE_MOD_01]="root"
slot_bones[ai.SpaceShipModuleSlot.ENGINE_MOD_02]="root"
slot_bones[ai.SpaceShipModuleSlot.ENGINE_MOD_03]="root"
slot_bones[ai.SpaceShipModuleSlot.SHIELD_MOD_01]="root"
slot_bones[ai.SpaceShipModuleSlot.SHIELD_MOD_02]="root"
slot_bones[ai.SpaceShipModuleSlot.SHIELD_MOD_03]="root"
slot_bones[ai.SpaceShipModuleSlot.ARMOR_MOD_01]="root"
slot_bones[ai.SpaceShipModuleSlot.ARMOR_MOD_02]="root"
slot_bones[ai.SpaceShipModuleSlot.ARMOR_MOD_03]="root"
slot_bones[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]="root"
slot_bones[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]="root"
slot_bones[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]="root"
slot_bones[ai.SpaceShipModuleSlot.CPU_MOD_01]="root"
slot_bones[ai.SpaceShipModuleSlot.CPU_MOD_02]="root"
slot_bones[ai.SpaceShipModuleSlot.CPU_MOD_03]="root"



Def.Ship_Race1_M_T1.ods_export = true
Def.Ship_Race1_M_T1.race=ai.Race.SPECIAL
Def.Ship_Race1_M_T1.next='Ship_Race1_M_T1_2'
Def.Ship_Race1_M_T1.ship_tier=4
Def.Ship_Race1_M_T1.rank=9 -- 1
Def.Ship_Race1_M_T1.ui_tree_x=400
Def.Ship_Race1_M_T1.ui_tree_y=0
Def.Ship_Race1_M_T1.evolution_cost=0
Def.Ship_Race1_M_T1.evolution_max=800
Def.Ship_Race1_M_T1.storeItemId=1
Def.Ship_Race1_M_T1.progress={ 'Ship_Race1_M_T1_1', 'Ship_Race1_M_T1_2' }
Def.Ship_Race1_M_T1.fake=true
Def.Ship_Race1_M_T1.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_M_T1.craftable_reagents={}
Def.Ship_Race1_M_T1.craftable_reagents[1]={}
Def.Ship_Race1_M_T1.craftable_reagents[1].resource="Aliens_ship_part"
Def.Ship_Race1_M_T1.craftable_reagents[1].amount=1
Def.Ship_Race1_M_T1.craftable_reagents[2]={}
Def.Ship_Race1_M_T1.craftable_reagents[2].resource="Iridium_monocrystall"
Def.Ship_Race1_M_T1.craftable_reagents[2].amount=1
Def.Ship_Race1_M_T1.treeIco="Race1_M_T1_Skin1_atlas"
Def.Ship_Race1_M_T1.slot_bones=slot_bones
Def.Ship_Race1_M_T1.default_slot_mask=ai.SpaceShipModuleSlotMask.ACTIVE_01+ai.SpaceShipModuleSlotMask.PRIMARY_WEAPON_01 + ai.SpaceShipModuleSlotMask.SECONDARY_WEAPON + ai.SpaceShipModuleSlotMask.SPECIAL

Def.Ship_Race1_M_T1_2 = {}
Def.Ship_Race1_M_T1_2.ods_export = true
Def.Ship_Race1_M_T1_2.inherit="Ship_Race1_M_T1"
Def.Ship_Race1_M_T1_2.rank=10 -- 2
Def.Ship_Race1_M_T1_2.ui_tree_x=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_2.ui_tree_y=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_2.evolution_cost=100
Def.Ship_Race1_M_T1_2.storeItemId=1
Def.Ship_Race1_M_T1_2.progress={}
Def.Ship_Race1_M_T1_2.progress[1]=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_2.progress[2]=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_2.evolution_max=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_2.craftable_reagents=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_2.next='Ship_Race1_M_T1_Faction1'
Def.Ship_Race1_M_T1_2.prev='Ship_Race1_M_T1'

Def.Ship_Race1_M_T1_Faction1.ods_export = true
Def.Ship_Race1_M_T1_Faction1.race=ai.Race.SPECIAL
Def.Ship_Race1_M_T1_Faction1.next='Ship_Race1_M_T1_Faction1_2'
Def.Ship_Race1_M_T1_Faction1.prev='Ship_Race1_M_T1_2'
Def.Ship_Race1_M_T1_Faction1.rank=11 -- 3
Def.Ship_Race1_M_T1_Faction1.storeItemId=1
Def.Ship_Race1_M_T1_Faction1.ship_tier=4
Def.Ship_Race1_M_T1_Faction1.evolution_cost=200
Def.Ship_Race1_M_T1_Faction1.progress={ 'Ship_Race1_M_T1_9', 'Ship_Race1_M_T1_10', 'Ship_Race1_M_T1_11', 'Ship_Race1_M_T1_12' }
Def.Ship_Race1_M_T1_Faction1.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_M_T1_Faction1.fake=true
Def.Ship_Race1_M_T1_Faction1.treeIco="Race1_M_T1_Skin2_atlas"
Def.Ship_Race1_M_T1_Faction1.slot_bones=slot_bones

Def.Ship_Race1_M_T1_Faction1_2 = {}
Def.Ship_Race1_M_T1_Faction1_2.ods_export = true
Def.Ship_Race1_M_T1_Faction1_2.inherit="Ship_Race1_M_T1_Faction1"
Def.Ship_Race1_M_T1_Faction1_2.rank=12 -- 4
Def.Ship_Race1_M_T1_Faction1_2.evolution_cost=300
Def.Ship_Race1_M_T1_Faction1_2.storeItemId=1
Def.Ship_Race1_M_T1_Faction1_2.progress={}
Def.Ship_Race1_M_T1_Faction1_2.progress[1]=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_Faction1_2.progress[2]=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_Faction1_2.progress[3]=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_Faction1_2.progress[4]=ai.DONT_INHERIT
Def.Ship_Race1_M_T1_Faction1_2.next='Ship_Race1_M_T2'
Def.Ship_Race1_M_T1_Faction1_2.prev='Ship_Race1_M_T1_Faction1'

Def.Ship_Race1_M_T2.ods_export = true
Def.Ship_Race1_M_T2.race=ai.Race.SPECIAL
Def.Ship_Race1_M_T2.node_prices=UfoNodesPrice
Def.Ship_Race1_M_T2.next='Ship_Race1_M_T2_Faction1'
Def.Ship_Race1_M_T2.prev='Ship_Race1_M_T1_Faction1_2'
Def.Ship_Race1_M_T2.rank=13 -- 5
Def.Ship_Race1_M_T2.ship_tier=4
Def.Ship_Race1_M_T2.evolution_cost=400
Def.Ship_Race1_M_T2.storeItemId=1
Def.Ship_Race1_M_T2.progress={ 'Ship_Race1_M_T1_17', 'Ship_Race1_M_T1_18', 'Ship_Race1_M_T1_19', 'Ship_Race1_M_T1_20' }
Def.Ship_Race1_M_T2.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_M_T2.fake=true
Def.Ship_Race1_M_T2.treeIco="Race1_M_T2upd_Skin1_atlas"
Def.Ship_Race1_M_T2.slot_bones=slot_bones

Def.Ship_Race1_M_T2_Faction1.ods_export = true
Def.Ship_Race1_M_T2_Faction1.race=ai.Race.SPECIAL
Def.Ship_Race1_M_T2_Faction1.node_prices=UfoNodesPrice
Def.Ship_Race1_M_T2_Faction1.next='Ship_Race1_M_T2_Faction2'
Def.Ship_Race1_M_T2_Faction1.prev='Ship_Race1_M_T2'
Def.Ship_Race1_M_T2_Faction1.rank=14 -- 6
Def.Ship_Race1_M_T2_Faction1.ship_tier=4
Def.Ship_Race1_M_T2_Faction1.evolution_cost=500
Def.Ship_Race1_M_T2_Faction1.storeItemId=1
Def.Ship_Race1_M_T2_Faction1.progress={}
Def.Ship_Race1_M_T2_Faction1.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_M_T2_Faction1.fake=true
Def.Ship_Race1_M_T2_Faction1.treeIco="Race1_M_T2upd_Skin2_atlas"
Def.Ship_Race1_M_T2_Faction1.slot_bones=slot_bones

Def.Ship_Race1_M_T2_Faction2.ods_export = true
Def.Ship_Race1_M_T2_Faction2.race=ai.Race.SPECIAL
Def.Ship_Race1_M_T2_Faction2.node_prices=UfoNodesPrice
Def.Ship_Race1_M_T2_Faction2.next=''
Def.Ship_Race1_M_T2_Faction2.prev='Ship_Race1_M_T2_Faction1'
Def.Ship_Race1_M_T2_Faction2.rank=15 -- 7
Def.Ship_Race1_M_T2_Faction2.ship_tier=4
Def.Ship_Race1_M_T2_Faction2.evolution_cost=600
Def.Ship_Race1_M_T2_Faction2.storeItemId=1
Def.Ship_Race1_M_T2_Faction2.progress={ 'Ship_Race1_M_T1_26', 'Ship_Race1_M_T1_27', 'Ship_Race1_M_T1_28' }
Def.Ship_Race1_M_T2_Faction2.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_M_T2_Faction2.fake=true
Def.Ship_Race1_M_T2_Faction2.treeIco="Race1_M_T2upd_Skin4_atlas"
Def.Ship_Race1_M_T2_Faction2.slot_bones=slot_bones



VesselProgress.Ship_Race1_M_T1_1={}
VesselProgress.Ship_Race1_M_T1_1.place=2
VesselProgress.Ship_Race1_M_T1_1.ui_layer=2
VesselProgress.Ship_Race1_M_T1_1.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_1.nodeId=0
VesselProgress.Ship_Race1_M_T1_1.children={}
VesselProgress.Ship_Race1_M_T1_1.children[1]="Ship_Race1_M_T1_3"
VesselProgress.Ship_Race1_M_T1_1.children[2]="Ship_Race1_M_T1_4"
VesselProgress.Ship_Race1_M_T1_1.static_price=true
VesselProgress.Ship_Race1_M_T1_1.exp=1
VesselProgress.Ship_Race1_M_T1_1.evolution=45
VesselProgress.Ship_Race1_M_T1_1.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_1.ico="engine_mod"
VesselProgress.Ship_Race1_M_T1_1.type="slot"
VesselProgress.Ship_Race1_M_T1_1.module_slot=ai.SpaceShipModuleSlot.ENGINE_MOD_01
VesselProgress.Ship_Race1_M_T1_1.ui_name="nodeName_engine_mod"
VesselProgress.Ship_Race1_M_T1_1.ui_desc="nodeDesc_engine_mod"

VesselProgress.Ship_Race1_M_T1_2={}
VesselProgress.Ship_Race1_M_T1_2.place=2
VesselProgress.Ship_Race1_M_T1_2.ui_layer=2
VesselProgress.Ship_Race1_M_T1_2.ui_angle=9
VesselProgress.Ship_Race1_M_T1_2.nodeId=1
VesselProgress.Ship_Race1_M_T1_2.children={}
VesselProgress.Ship_Race1_M_T1_2.children[1]="Ship_Race1_M_T1_5"
VesselProgress.Ship_Race1_M_T1_2.children[2]="Ship_Race1_M_T1_6"
VesselProgress.Ship_Race1_M_T1_2.children[3]="Ship_Race1_M_T1_7"
VesselProgress.Ship_Race1_M_T1_2.static_price=true
VesselProgress.Ship_Race1_M_T1_2.exp=1
VesselProgress.Ship_Race1_M_T1_2.evolution=25
VesselProgress.Ship_Race1_M_T1_2.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_2.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_2.type="ship_param"
VesselProgress.Ship_Race1_M_T1_2.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_2.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_2.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_3={}
VesselProgress.Ship_Race1_M_T1_3.place=2
VesselProgress.Ship_Race1_M_T1_3.ui_layer=1
VesselProgress.Ship_Race1_M_T1_3.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_3.nodeId=2
VesselProgress.Ship_Race1_M_T1_3.static_price=true
VesselProgress.Ship_Race1_M_T1_3.exp=1
VesselProgress.Ship_Race1_M_T1_3.evolution=45
VesselProgress.Ship_Race1_M_T1_3.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_3.ico="cpu_mod"
VesselProgress.Ship_Race1_M_T1_3.type="slot"
VesselProgress.Ship_Race1_M_T1_3.module_slot=ai.SpaceShipModuleSlot.CPU_MOD_01
VesselProgress.Ship_Race1_M_T1_3.ui_name="nodeName_cpu_mod"
VesselProgress.Ship_Race1_M_T1_3.ui_desc="nodeDesc_cpu_mod"

VesselProgress.Ship_Race1_M_T1_4={}
VesselProgress.Ship_Race1_M_T1_4.place=2
VesselProgress.Ship_Race1_M_T1_4.ui_layer=3
VesselProgress.Ship_Race1_M_T1_4.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_4.nodeId=3
VesselProgress.Ship_Race1_M_T1_4.static_price=true
VesselProgress.Ship_Race1_M_T1_4.exp=1
VesselProgress.Ship_Race1_M_T1_4.evolution=25
VesselProgress.Ship_Race1_M_T1_4.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_4.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_4.type="ship_param"
VesselProgress.Ship_Race1_M_T1_4.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_4.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_4.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_5={}
VesselProgress.Ship_Race1_M_T1_5.place=2
VesselProgress.Ship_Race1_M_T1_5.ui_layer=3
VesselProgress.Ship_Race1_M_T1_5.ui_angle=9
VesselProgress.Ship_Race1_M_T1_5.nodeId=4
VesselProgress.Ship_Race1_M_T1_5.static_price=true
VesselProgress.Ship_Race1_M_T1_5.exp=1
VesselProgress.Ship_Race1_M_T1_5.evolution=45
VesselProgress.Ship_Race1_M_T1_5.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_5.ico="armor_mod"
VesselProgress.Ship_Race1_M_T1_5.type="slot"
VesselProgress.Ship_Race1_M_T1_5.module_slot=ai.SpaceShipModuleSlot.ARMOR_MOD_01
VesselProgress.Ship_Race1_M_T1_5.ui_name="nodeName_armor_mod"
VesselProgress.Ship_Race1_M_T1_5.ui_desc="nodeDesc_armor_mod"

VesselProgress.Ship_Race1_M_T1_6={}
VesselProgress.Ship_Race1_M_T1_6.place=2
VesselProgress.Ship_Race1_M_T1_6.ui_layer=1
VesselProgress.Ship_Race1_M_T1_6.ui_angle=9
VesselProgress.Ship_Race1_M_T1_6.nodeId=5
VesselProgress.Ship_Race1_M_T1_6.static_price=true
VesselProgress.Ship_Race1_M_T1_6.exp=1
VesselProgress.Ship_Race1_M_T1_6.evolution=25
VesselProgress.Ship_Race1_M_T1_6.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_6.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_6.type="ship_param"
VesselProgress.Ship_Race1_M_T1_6.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_6.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_6.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_7={}
VesselProgress.Ship_Race1_M_T1_7.place=2
VesselProgress.Ship_Race1_M_T1_7.ui_layer=2
VesselProgress.Ship_Race1_M_T1_7.ui_angle=22.5
VesselProgress.Ship_Race1_M_T1_7.nodeId=6
VesselProgress.Ship_Race1_M_T1_7.children={}
VesselProgress.Ship_Race1_M_T1_7.children[1]="Ship_Race1_M_T1_8"
VesselProgress.Ship_Race1_M_T1_7.static_price=true
VesselProgress.Ship_Race1_M_T1_7.exp=1
VesselProgress.Ship_Race1_M_T1_7.evolution=25
VesselProgress.Ship_Race1_M_T1_7.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_7.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_7.type="ship_param"
VesselProgress.Ship_Race1_M_T1_7.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_7.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_7.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_8={}
VesselProgress.Ship_Race1_M_T1_8.place=2
VesselProgress.Ship_Race1_M_T1_8.ui_layer=3
VesselProgress.Ship_Race1_M_T1_8.ui_angle=22.5
VesselProgress.Ship_Race1_M_T1_8.nodeId=7
VesselProgress.Ship_Race1_M_T1_8.static_price=true
VesselProgress.Ship_Race1_M_T1_8.exp=1
VesselProgress.Ship_Race1_M_T1_8.evolution=60
VesselProgress.Ship_Race1_M_T1_8.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_8.ico="active"
VesselProgress.Ship_Race1_M_T1_8.type="slot"
VesselProgress.Ship_Race1_M_T1_8.module_slot=ai.SpaceShipModuleSlot.ACTIVE_02
VesselProgress.Ship_Race1_M_T1_8.ui_name="nodeName_active"
VesselProgress.Ship_Race1_M_T1_8.ui_desc="nodeDesc_active"

VesselProgress.Ship_Race1_M_T1_9={}
VesselProgress.Ship_Race1_M_T1_9.place=2
VesselProgress.Ship_Race1_M_T1_9.ui_layer=1
VesselProgress.Ship_Race1_M_T1_9.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_9.nodeId=8
VesselProgress.Ship_Race1_M_T1_9.children={}
VesselProgress.Ship_Race1_M_T1_9.children[1]="Ship_Race1_M_T1_13"
VesselProgress.Ship_Race1_M_T1_9.children[2]="Ship_Race1_M_T1_14"
VesselProgress.Ship_Race1_M_T1_9.static_price=true
VesselProgress.Ship_Race1_M_T1_9.exp=1
VesselProgress.Ship_Race1_M_T1_9.evolution=25
VesselProgress.Ship_Race1_M_T1_9.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_9.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_9.type="ship_param"
VesselProgress.Ship_Race1_M_T1_9.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_9.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_9.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_10={}
VesselProgress.Ship_Race1_M_T1_10.place=2
VesselProgress.Ship_Race1_M_T1_10.ui_layer=1
VesselProgress.Ship_Race1_M_T1_10.ui_angle=9
VesselProgress.Ship_Race1_M_T1_10.nodeId=9
VesselProgress.Ship_Race1_M_T1_10.static_price=true
VesselProgress.Ship_Race1_M_T1_10.exp=1
VesselProgress.Ship_Race1_M_T1_10.evolution=45
VesselProgress.Ship_Race1_M_T1_10.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_10.ico="cpu_mod"
VesselProgress.Ship_Race1_M_T1_10.type="slot"
VesselProgress.Ship_Race1_M_T1_10.module_slot=ai.SpaceShipModuleSlot.CPU_MOD_02
VesselProgress.Ship_Race1_M_T1_10.ui_name="nodeName_cpu_mod"
VesselProgress.Ship_Race1_M_T1_10.ui_desc="nodeDesc_cpu_mod"

VesselProgress.Ship_Race1_M_T1_11={}
VesselProgress.Ship_Race1_M_T1_11.place=2
VesselProgress.Ship_Race1_M_T1_11.ui_layer=2
VesselProgress.Ship_Race1_M_T1_11.ui_angle=9
VesselProgress.Ship_Race1_M_T1_11.nodeId=10
VesselProgress.Ship_Race1_M_T1_11.children={}
VesselProgress.Ship_Race1_M_T1_11.children[1]="Ship_Race1_M_T1_16"
VesselProgress.Ship_Race1_M_T1_11.static_price=true
VesselProgress.Ship_Race1_M_T1_11.exp=1
VesselProgress.Ship_Race1_M_T1_11.evolution=25
VesselProgress.Ship_Race1_M_T1_11.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_11.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_11.type="ship_param"
VesselProgress.Ship_Race1_M_T1_11.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_11.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_11.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_12={}
VesselProgress.Ship_Race1_M_T1_12.place=2
VesselProgress.Ship_Race1_M_T1_12.ui_layer=3
VesselProgress.Ship_Race1_M_T1_12.ui_angle=9
VesselProgress.Ship_Race1_M_T1_12.nodeId=11
VesselProgress.Ship_Race1_M_T1_12.static_price=true
VesselProgress.Ship_Race1_M_T1_12.exp=1
VesselProgress.Ship_Race1_M_T1_12.evolution=25
VesselProgress.Ship_Race1_M_T1_12.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_12.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_12.type="ship_param"
VesselProgress.Ship_Race1_M_T1_12.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_12.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_12.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_13={}
VesselProgress.Ship_Race1_M_T1_13.place=2
VesselProgress.Ship_Race1_M_T1_13.ui_layer=1
VesselProgress.Ship_Race1_M_T1_13.ui_angle=-22.5
VesselProgress.Ship_Race1_M_T1_13.nodeId=12
VesselProgress.Ship_Race1_M_T1_13.static_price=true
VesselProgress.Ship_Race1_M_T1_13.exp=1
VesselProgress.Ship_Race1_M_T1_13.evolution=45
VesselProgress.Ship_Race1_M_T1_13.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_13.ico="capacitor_mod"
VesselProgress.Ship_Race1_M_T1_13.type="slot"
VesselProgress.Ship_Race1_M_T1_13.module_slot=ai.SpaceShipModuleSlot.CAPACITOR_MOD_01
VesselProgress.Ship_Race1_M_T1_13.ui_name="nodeName_capacitor_mod"
VesselProgress.Ship_Race1_M_T1_13.ui_desc="nodeDesc_capacitor_mod"

VesselProgress.Ship_Race1_M_T1_14={}
VesselProgress.Ship_Race1_M_T1_14.place=2
VesselProgress.Ship_Race1_M_T1_14.ui_layer=2
VesselProgress.Ship_Race1_M_T1_14.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_14.nodeId=13
VesselProgress.Ship_Race1_M_T1_14.children={}
VesselProgress.Ship_Race1_M_T1_14.children[1]="Ship_Race1_M_T1_15"
VesselProgress.Ship_Race1_M_T1_14.static_price=true
VesselProgress.Ship_Race1_M_T1_14.exp=1
VesselProgress.Ship_Race1_M_T1_14.evolution=25
VesselProgress.Ship_Race1_M_T1_14.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_14.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_14.type="ship_param"
VesselProgress.Ship_Race1_M_T1_14.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_14.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_14.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_15={}
VesselProgress.Ship_Race1_M_T1_15.place=2
VesselProgress.Ship_Race1_M_T1_15.ui_layer=3
VesselProgress.Ship_Race1_M_T1_15.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_15.nodeId=14
VesselProgress.Ship_Race1_M_T1_15.static_price=true
VesselProgress.Ship_Race1_M_T1_15.exp=1
VesselProgress.Ship_Race1_M_T1_15.evolution=60
VesselProgress.Ship_Race1_M_T1_15.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_15.ico="active"
VesselProgress.Ship_Race1_M_T1_15.type="slot"
VesselProgress.Ship_Race1_M_T1_15.module_slot=ai.SpaceShipModuleSlot.ACTIVE_03
VesselProgress.Ship_Race1_M_T1_15.ui_name="nodeName_active"
VesselProgress.Ship_Race1_M_T1_15.ui_desc="nodeDesc_active"

VesselProgress.Ship_Race1_M_T1_16={}
VesselProgress.Ship_Race1_M_T1_16.place=2
VesselProgress.Ship_Race1_M_T1_16.ui_layer=2
VesselProgress.Ship_Race1_M_T1_16.ui_angle=22.5
VesselProgress.Ship_Race1_M_T1_16.nodeId=15
VesselProgress.Ship_Race1_M_T1_16.static_price=true
VesselProgress.Ship_Race1_M_T1_16.exp=1
VesselProgress.Ship_Race1_M_T1_16.evolution=45
VesselProgress.Ship_Race1_M_T1_16.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_16.ico="armor_mod"
VesselProgress.Ship_Race1_M_T1_16.type="slot"
VesselProgress.Ship_Race1_M_T1_16.module_slot=ai.SpaceShipModuleSlot.ARMOR_MOD_02
VesselProgress.Ship_Race1_M_T1_16.ui_name="nodeName_armor_mod"
VesselProgress.Ship_Race1_M_T1_16.ui_desc="nodeDesc_armor_mod"

VesselProgress.Ship_Race1_M_T1_17={}
VesselProgress.Ship_Race1_M_T1_17.place=2
VesselProgress.Ship_Race1_M_T1_17.ui_layer=2
VesselProgress.Ship_Race1_M_T1_17.ui_angle=9
VesselProgress.Ship_Race1_M_T1_17.nodeId=16
VesselProgress.Ship_Race1_M_T1_17.static_price=true
VesselProgress.Ship_Race1_M_T1_17.exp=1
VesselProgress.Ship_Race1_M_T1_17.evolution=25
VesselProgress.Ship_Race1_M_T1_17.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_17.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_17.type="ship_param"
VesselProgress.Ship_Race1_M_T1_17.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_17.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_17.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_18={}
VesselProgress.Ship_Race1_M_T1_18.place=2
VesselProgress.Ship_Race1_M_T1_18.ui_layer=1
VesselProgress.Ship_Race1_M_T1_18.ui_angle=9
VesselProgress.Ship_Race1_M_T1_18.nodeId=17
VesselProgress.Ship_Race1_M_T1_18.static_price=true
VesselProgress.Ship_Race1_M_T1_18.exp=1
VesselProgress.Ship_Race1_M_T1_18.evolution=25
VesselProgress.Ship_Race1_M_T1_18.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_18.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_18.type="ship_param"
VesselProgress.Ship_Race1_M_T1_18.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_18.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_18.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_19={}
VesselProgress.Ship_Race1_M_T1_19.place=2
VesselProgress.Ship_Race1_M_T1_19.ui_layer=2
VesselProgress.Ship_Race1_M_T1_19.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_19.nodeId=18
VesselProgress.Ship_Race1_M_T1_19.children={}
VesselProgress.Ship_Race1_M_T1_19.children[1]="Ship_Race1_M_T1_22"
VesselProgress.Ship_Race1_M_T1_19.children[2]="Ship_Race1_M_T1_24"
VesselProgress.Ship_Race1_M_T1_19.static_price=true
VesselProgress.Ship_Race1_M_T1_19.exp=1
VesselProgress.Ship_Race1_M_T1_19.evolution=25
VesselProgress.Ship_Race1_M_T1_19.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_19.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_19.type="ship_param"
VesselProgress.Ship_Race1_M_T1_19.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_19.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_19.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_20={}
VesselProgress.Ship_Race1_M_T1_20.place=2
VesselProgress.Ship_Race1_M_T1_20.ui_layer=3
VesselProgress.Ship_Race1_M_T1_20.ui_angle=9
VesselProgress.Ship_Race1_M_T1_20.nodeId=19
VesselProgress.Ship_Race1_M_T1_20.children={}
VesselProgress.Ship_Race1_M_T1_20.children[1]="Ship_Race1_M_T1_21"
VesselProgress.Ship_Race1_M_T1_20.static_price=true
VesselProgress.Ship_Race1_M_T1_20.exp=1
VesselProgress.Ship_Race1_M_T1_20.evolution=25
VesselProgress.Ship_Race1_M_T1_20.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_20.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_20.type="ship_param"
VesselProgress.Ship_Race1_M_T1_20.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_20.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_20.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_21={}
VesselProgress.Ship_Race1_M_T1_21.place=2
VesselProgress.Ship_Race1_M_T1_21.ui_layer=3
VesselProgress.Ship_Race1_M_T1_21.ui_angle=22.5
VesselProgress.Ship_Race1_M_T1_21.nodeId=20
VesselProgress.Ship_Race1_M_T1_21.static_price=true
VesselProgress.Ship_Race1_M_T1_21.exp=1
VesselProgress.Ship_Race1_M_T1_21.evolution=60
VesselProgress.Ship_Race1_M_T1_21.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_21.ico="active"
VesselProgress.Ship_Race1_M_T1_21.type="slot"
VesselProgress.Ship_Race1_M_T1_21.module_slot=ai.SpaceShipModuleSlot.ACTIVE_04
VesselProgress.Ship_Race1_M_T1_21.ui_name="nodeName_active"
VesselProgress.Ship_Race1_M_T1_21.ui_desc="nodeDesc_active"

VesselProgress.Ship_Race1_M_T1_22={}
VesselProgress.Ship_Race1_M_T1_22.place=2
VesselProgress.Ship_Race1_M_T1_22.ui_layer=3
VesselProgress.Ship_Race1_M_T1_22.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_22.nodeId=21
VesselProgress.Ship_Race1_M_T1_22.children={}
VesselProgress.Ship_Race1_M_T1_22.children[1]="Ship_Race1_M_T1_23"
VesselProgress.Ship_Race1_M_T1_22.static_price=true
VesselProgress.Ship_Race1_M_T1_22.exp=1
VesselProgress.Ship_Race1_M_T1_22.evolution=25
VesselProgress.Ship_Race1_M_T1_22.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_22.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_22.type="ship_param"
VesselProgress.Ship_Race1_M_T1_22.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_22.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_22.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_23={}
VesselProgress.Ship_Race1_M_T1_23.place=2
VesselProgress.Ship_Race1_M_T1_23.ui_layer=3
VesselProgress.Ship_Race1_M_T1_23.ui_angle=-22.5
VesselProgress.Ship_Race1_M_T1_23.nodeId=22
VesselProgress.Ship_Race1_M_T1_23.static_price=true
VesselProgress.Ship_Race1_M_T1_23.exp=1
VesselProgress.Ship_Race1_M_T1_23.evolution=25
VesselProgress.Ship_Race1_M_T1_23.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_23.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_23.type="ship_param"
VesselProgress.Ship_Race1_M_T1_23.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_23.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_23.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_24={}
VesselProgress.Ship_Race1_M_T1_24.place=2
VesselProgress.Ship_Race1_M_T1_24.ui_layer=1
VesselProgress.Ship_Race1_M_T1_24.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_24.nodeId=23
VesselProgress.Ship_Race1_M_T1_24.children={}
VesselProgress.Ship_Race1_M_T1_24.children[1]="Ship_Race1_M_T1_25"
VesselProgress.Ship_Race1_M_T1_24.static_price=true
VesselProgress.Ship_Race1_M_T1_24.exp=1
VesselProgress.Ship_Race1_M_T1_24.evolution=25
VesselProgress.Ship_Race1_M_T1_24.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_24.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_24.type="ship_param"
VesselProgress.Ship_Race1_M_T1_24.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_24.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_24.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_25={}
VesselProgress.Ship_Race1_M_T1_25.place=2
VesselProgress.Ship_Race1_M_T1_25.ui_layer=1
VesselProgress.Ship_Race1_M_T1_25.ui_angle=-22.5
VesselProgress.Ship_Race1_M_T1_25.nodeId=24
VesselProgress.Ship_Race1_M_T1_25.static_price=true
VesselProgress.Ship_Race1_M_T1_25.exp=1
VesselProgress.Ship_Race1_M_T1_25.evolution=25
VesselProgress.Ship_Race1_M_T1_25.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_25.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_25.type="ship_param"
VesselProgress.Ship_Race1_M_T1_25.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_25.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_25.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_26={}
VesselProgress.Ship_Race1_M_T1_26.place=2
VesselProgress.Ship_Race1_M_T1_26.ui_layer=1
VesselProgress.Ship_Race1_M_T1_26.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_26.nodeId=25
VesselProgress.Ship_Race1_M_T1_26.children={}
VesselProgress.Ship_Race1_M_T1_26.children[1]="Ship_Race1_M_T1_29"
VesselProgress.Ship_Race1_M_T1_26.children[2]="Ship_Race1_M_T1_31"
VesselProgress.Ship_Race1_M_T1_26.static_price=true
VesselProgress.Ship_Race1_M_T1_26.exp=1
VesselProgress.Ship_Race1_M_T1_26.evolution=25
VesselProgress.Ship_Race1_M_T1_26.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_26.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_26.type="ship_param"
VesselProgress.Ship_Race1_M_T1_26.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_26.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_26.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_27={}
VesselProgress.Ship_Race1_M_T1_27.place=2
VesselProgress.Ship_Race1_M_T1_27.ui_layer=2
VesselProgress.Ship_Race1_M_T1_27.ui_angle=9
VesselProgress.Ship_Race1_M_T1_27.nodeId=26
VesselProgress.Ship_Race1_M_T1_27.children={}
VesselProgress.Ship_Race1_M_T1_27.children[1]="Ship_Race1_M_T1_33"
VesselProgress.Ship_Race1_M_T1_27.static_price=true
VesselProgress.Ship_Race1_M_T1_27.exp=1
VesselProgress.Ship_Race1_M_T1_27.evolution=25
VesselProgress.Ship_Race1_M_T1_27.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_27.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_27.type="ship_param"
VesselProgress.Ship_Race1_M_T1_27.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_27.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_27.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_28={}
VesselProgress.Ship_Race1_M_T1_28.place=2
VesselProgress.Ship_Race1_M_T1_28.ui_layer=1
VesselProgress.Ship_Race1_M_T1_28.ui_angle=9
VesselProgress.Ship_Race1_M_T1_28.nodeId=27
VesselProgress.Ship_Race1_M_T1_28.static_price=true
VesselProgress.Ship_Race1_M_T1_28.exp=1
VesselProgress.Ship_Race1_M_T1_28.evolution=45
VesselProgress.Ship_Race1_M_T1_28.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_28.ico="armor_mod"
VesselProgress.Ship_Race1_M_T1_28.type="slot"
VesselProgress.Ship_Race1_M_T1_28.module_slot=ai.SpaceShipModuleSlot.ARMOR_MOD_03
VesselProgress.Ship_Race1_M_T1_28.ui_name="nodeName_armor_mod"
VesselProgress.Ship_Race1_M_T1_28.ui_desc="nodeDesc_armor_mod"

VesselProgress.Ship_Race1_M_T1_29={}
VesselProgress.Ship_Race1_M_T1_29.place=2
VesselProgress.Ship_Race1_M_T1_29.ui_layer=1
VesselProgress.Ship_Race1_M_T1_29.ui_angle=-22.5
VesselProgress.Ship_Race1_M_T1_29.nodeId=28
VesselProgress.Ship_Race1_M_T1_29.children={}
VesselProgress.Ship_Race1_M_T1_29.children[1]="Ship_Race1_M_T1_30"
VesselProgress.Ship_Race1_M_T1_29.static_price=true
VesselProgress.Ship_Race1_M_T1_29.exp=1
VesselProgress.Ship_Race1_M_T1_29.evolution=25
VesselProgress.Ship_Race1_M_T1_29.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_29.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_29.type="ship_param"
VesselProgress.Ship_Race1_M_T1_29.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_29.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_29.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_30={}
VesselProgress.Ship_Race1_M_T1_30.place=2
VesselProgress.Ship_Race1_M_T1_30.ui_layer=2
VesselProgress.Ship_Race1_M_T1_30.ui_angle=-22.5
VesselProgress.Ship_Race1_M_T1_30.nodeId=29
VesselProgress.Ship_Race1_M_T1_30.static_price=true
VesselProgress.Ship_Race1_M_T1_30.exp=1
VesselProgress.Ship_Race1_M_T1_30.evolution=25
VesselProgress.Ship_Race1_M_T1_30.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_30.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_30.type="ship_param"
VesselProgress.Ship_Race1_M_T1_30.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_30.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_30.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_31={}
VesselProgress.Ship_Race1_M_T1_31.place=2
VesselProgress.Ship_Race1_M_T1_31.ui_layer=2
VesselProgress.Ship_Race1_M_T1_31.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_31.nodeId=30
VesselProgress.Ship_Race1_M_T1_31.children={}
VesselProgress.Ship_Race1_M_T1_31.children[1]="Ship_Race1_M_T1_32"
VesselProgress.Ship_Race1_M_T1_31.static_price=true
VesselProgress.Ship_Race1_M_T1_31.exp=1
VesselProgress.Ship_Race1_M_T1_31.evolution=45
VesselProgress.Ship_Race1_M_T1_31.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_31.ico="capacitor_mod"
VesselProgress.Ship_Race1_M_T1_31.type="slot"
VesselProgress.Ship_Race1_M_T1_31.module_slot=ai.SpaceShipModuleSlot.CAPACITOR_MOD_02
VesselProgress.Ship_Race1_M_T1_31.ui_name="nodeName_capacitor_mod"
VesselProgress.Ship_Race1_M_T1_31.ui_desc="nodeDesc_capacitor_mod"

VesselProgress.Ship_Race1_M_T1_32={}
VesselProgress.Ship_Race1_M_T1_32.place=2
VesselProgress.Ship_Race1_M_T1_32.ui_layer=3
VesselProgress.Ship_Race1_M_T1_32.ui_angle=-9
VesselProgress.Ship_Race1_M_T1_32.nodeId=31
VesselProgress.Ship_Race1_M_T1_32.static_price=true
VesselProgress.Ship_Race1_M_T1_32.exp=1
VesselProgress.Ship_Race1_M_T1_32.evolution=25
VesselProgress.Ship_Race1_M_T1_32.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_32.ico="shield_upgrade"
VesselProgress.Ship_Race1_M_T1_32.type="ship_param"
VesselProgress.Ship_Race1_M_T1_32.shield_max_add=1800
VesselProgress.Ship_Race1_M_T1_32.ui_name="nodeName_shield_max_add"
VesselProgress.Ship_Race1_M_T1_32.ui_desc="nodeDesc_shield_max_add"

VesselProgress.Ship_Race1_M_T1_33={}
VesselProgress.Ship_Race1_M_T1_33.place=2
VesselProgress.Ship_Race1_M_T1_33.ui_layer=3
VesselProgress.Ship_Race1_M_T1_33.ui_angle=9
VesselProgress.Ship_Race1_M_T1_33.nodeId=32
VesselProgress.Ship_Race1_M_T1_33.static_price=true
VesselProgress.Ship_Race1_M_T1_33.exp=1
VesselProgress.Ship_Race1_M_T1_33.evolution=45
VesselProgress.Ship_Race1_M_T1_33.can_be_activated=true
VesselProgress.Ship_Race1_M_T1_33.ico="engine_mod"
VesselProgress.Ship_Race1_M_T1_33.type="slot"
VesselProgress.Ship_Race1_M_T1_33.module_slot=ai.SpaceShipModuleSlot.ENGINE_MOD_02
VesselProgress.Ship_Race1_M_T1_33.ui_name="nodeName_engine_mod"
VesselProgress.Ship_Race1_M_T1_33.ui_desc="nodeDesc_engine_mod"




VesselTree.Ship_Race1_L_T1={}
VesselTree.Ship_Race1_L_T1_Faction1=nil
VesselTree.Ship_Race1_L_T1_Faction2=nil
VesselTree.Ship_Race1_L_T2=nil
VesselTree.Ship_Race1_L_T2_Faction2=nil

Def.Ship_Race1_L_T1.ods_export = true
Def.Ship_Race1_L_T1.race=ai.Race.SPECIAL
Def.Ship_Race1_L_T1.next='Ship_Race1_L_T1_2'
Def.Ship_Race1_L_T1.prev=''
Def.Ship_Race1_L_T1.rank=9
Def.Ship_Race1_L_T1.storeItemId=1
Def.Ship_Race1_L_T1.ship_tier=4
Def.Ship_Race1_L_T1.ui_tree_x=-400
Def.Ship_Race1_L_T1.ui_tree_y=0
Def.Ship_Race1_L_T1.evolution_cost=0
Def.Ship_Race1_L_T1.evolution_max=800
Def.Ship_Race1_L_T1.progress={ 'Ship_Race1_M_T1_1', 'Ship_Race1_M_T1_2' }
Def.Ship_Race1_L_T1.craftable_reagents={}
Def.Ship_Race1_L_T1.craftable_reagents[1]={}
Def.Ship_Race1_L_T1.craftable_reagents[1].resource="Aliens_ship_part"
Def.Ship_Race1_L_T1.craftable_reagents[1].amount=1
Def.Ship_Race1_L_T1.craftable_reagents[2]={}
Def.Ship_Race1_L_T1.craftable_reagents[2].resource="Iridium_monocrystall"
Def.Ship_Race1_L_T1.craftable_reagents[2].amount=1
Def.Ship_Race1_L_T1.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_L_T1.fake=true
Def.Ship_Race1_L_T1.treeIco="Race1_L_T1_Skin1_atlas"
Def.Ship_Race1_L_T1.slot_bones=slot_bones
Def.Ship_Race1_L_T1.default_slot_mask=ai.SpaceShipModuleSlotMask.ACTIVE_01+ai.SpaceShipModuleSlotMask.PRIMARY_WEAPON_01 + ai.SpaceShipModuleSlotMask.SECONDARY_WEAPON + ai.SpaceShipModuleSlotMask.SPECIAL

Def.Ship_Race1_L_T1_2 = {}
Def.Ship_Race1_L_T1_2.ods_export = true
Def.Ship_Race1_L_T1_2.inherit="Ship_Race1_L_T1"
Def.Ship_Race1_L_T1_2.rank=10
Def.Ship_Race1_L_T1_2.ui_tree_x=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_2.ui_tree_y=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_2.evolution_cost=100
Def.Ship_Race1_L_T1_2.storeItemId=1
Def.Ship_Race1_L_T1_2.progress={}
Def.Ship_Race1_L_T1_2.progress[1]=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_2.progress[2]=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_2.evolution_max=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_2.craftable_reagents=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_2.next='Ship_Race1_L_T1_3'
Def.Ship_Race1_L_T1_2.prev='Ship_Race1_L_T1'

Def.Ship_Race1_L_T1_3 = {}
Def.Ship_Race1_L_T1_3.ods_export = true
Def.Ship_Race1_L_T1_3.inherit="Ship_Race1_L_T1"
Def.Ship_Race1_L_T1_3.rank=11
Def.Ship_Race1_L_T1_3.ui_tree_x=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_3.ui_tree_y=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_3.evolution_cost=200
Def.Ship_Race1_L_T1_3.storeItemId=1
Def.Ship_Race1_L_T1_3.progress={ 'Ship_Race1_M_T1_9', 'Ship_Race1_M_T1_10', 'Ship_Race1_M_T1_11', 'Ship_Race1_M_T1_12' }
Def.Ship_Race1_L_T1_3.evolution_max=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_3.craftable_reagents=ai.DONT_INHERIT
Def.Ship_Race1_L_T1_3.next='Ship_Race1_L_T1_Faction1'
Def.Ship_Race1_L_T1_3.prev='Ship_Race1_L_T1_2'

Def.Ship_Race1_L_T1_Faction1.ods_export = true
Def.Ship_Race1_L_T1_Faction1.race=ai.Race.SPECIAL
Def.Ship_Race1_L_T1_Faction1.next='Ship_Race1_L_T1_Faction2'
Def.Ship_Race1_L_T1_Faction1.prev='Ship_Race1_L_T1_3'
Def.Ship_Race1_L_T1_Faction1.rank=12 -- 4
Def.Ship_Race1_L_T1_Faction1.storeItemId=1
Def.Ship_Race1_L_T1_Faction1.ship_tier=4
Def.Ship_Race1_L_T1_Faction1.evolution_cost=300
Def.Ship_Race1_L_T1_Faction1.progress={}
Def.Ship_Race1_L_T1_Faction1.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_L_T1_Faction1.fake=true
Def.Ship_Race1_L_T1_Faction1.treeIco="Race1_L_T1_Skin2_atlas"
Def.Ship_Race1_L_T1_Faction1.slot_bones=slot_bones

Def.Ship_Race1_L_T1_Faction2.ods_export = true
Def.Ship_Race1_L_T1_Faction2.race=ai.Race.SPECIAL
Def.Ship_Race1_L_T1_Faction2.node_prices=UfoNodesPrice
Def.Ship_Race1_L_T1_Faction2.next='Ship_Race1_L_T2'
Def.Ship_Race1_L_T1_Faction2.prev='Ship_Race1_L_T1_Faction1'
Def.Ship_Race1_L_T1_Faction2.rank=13 -- 5
Def.Ship_Race1_L_T1_Faction2.ship_tier=4
Def.Ship_Race1_L_T1_Faction2.evolution_cost=400
Def.Ship_Race1_L_T1_Faction2.storeItemId=1
Def.Ship_Race1_L_T1_Faction2.progress={ 'Ship_Race1_M_T1_17', 'Ship_Race1_M_T1_18', 'Ship_Race1_M_T1_19', 'Ship_Race1_M_T1_20' }
Def.Ship_Race1_L_T1_Faction2.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_L_T1_Faction2.fake=true
Def.Ship_Race1_L_T1_Faction2.treeIco="Race1_L_T1_Skin4_atlas"
Def.Ship_Race1_L_T1_Faction2.slot_bones=slot_bones

Def.Ship_Race1_L_T2.ods_export = true
Def.Ship_Race1_L_T2.race=ai.Race.SPECIAL
Def.Ship_Race1_L_T2.node_prices=UfoNodesPrice
Def.Ship_Race1_L_T2.next='Ship_Race1_L_T2_Faction2'
Def.Ship_Race1_L_T2.prev='Ship_Race1_L_T1_Faction2'
Def.Ship_Race1_L_T2.rank=14 -- 6
Def.Ship_Race1_L_T2.ship_tier=4
Def.Ship_Race1_L_T2.evolution_cost=500
Def.Ship_Race1_L_T2.storeItemId=1
Def.Ship_Race1_L_T2.progress={}
Def.Ship_Race1_L_T2.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_L_T2.fake=true
Def.Ship_Race1_L_T2.treeIco="Race1_L_T2_Skin1_atlas"
Def.Ship_Race1_L_T2.slot_bones=slot_bones

Def.Ship_Race1_L_T2_Faction2.ods_export = true
Def.Ship_Race1_L_T2_Faction2.race=ai.Race.SPECIAL
Def.Ship_Race1_L_T2_Faction2.node_prices=UfoNodesPrice
Def.Ship_Race1_L_T2_Faction2.next=''
Def.Ship_Race1_L_T2_Faction2.prev='Ship_Race1_L_T2'
Def.Ship_Race1_L_T2_Faction2.rank=15 -- 7
Def.Ship_Race1_L_T2_Faction2.ship_tier=4
Def.Ship_Race1_L_T2_Faction2.evolution_cost=600
Def.Ship_Race1_L_T2_Faction2.storeItemId=1
Def.Ship_Race1_L_T2_Faction2.progress={ 'Ship_Race1_M_T1_26', 'Ship_Race1_M_T1_27', 'Ship_Race1_M_T1_28' }
Def.Ship_Race1_L_T2_Faction2.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_L_T2_Faction2.fake=true
Def.Ship_Race1_L_T2_Faction2.treeIco="Race1_L_T2_Skin4_atlas"
Def.Ship_Race1_L_T2_Faction2.slot_bones=slot_bones




VesselTree.Ship_Race1_S_T1_Faction1={}
VesselTree.Ship_Race1_S_T1_Faction2=nil
VesselTree.Ship_Race1_S_T2_Faction1=nil
VesselTree.Ship_Race1_S_T2_Faction2=nil

Def.Ship_Race1_S_T1_Faction1.ods_export = true
Def.Ship_Race1_S_T1_Faction1.race=ai.Race.SPECIAL
Def.Ship_Race1_S_T1_Faction1.next='Ship_Race1_S_T1_Faction1_2'
Def.Ship_Race1_S_T1_Faction1.prev=''
Def.Ship_Race1_S_T1_Faction1.rank=9
Def.Ship_Race1_S_T1_Faction1.storeItemId=1
Def.Ship_Race1_S_T1_Faction1.ship_tier=4
Def.Ship_Race1_S_T1_Faction1.ui_tree_x=000
Def.Ship_Race1_S_T1_Faction1.ui_tree_y=200
Def.Ship_Race1_S_T1_Faction1.evolution_cost=0
Def.Ship_Race1_S_T1_Faction1.evolution_max=800
Def.Ship_Race1_S_T1_Faction1.progress={ 'Ship_Race1_M_T1_1', 'Ship_Race1_M_T1_2' }
Def.Ship_Race1_S_T1_Faction1.craftable_reagents={}
Def.Ship_Race1_S_T1_Faction1.craftable_reagents[1]={}
Def.Ship_Race1_S_T1_Faction1.craftable_reagents[1].resource="Aliens_ship_part"
Def.Ship_Race1_S_T1_Faction1.craftable_reagents[1].amount=1
Def.Ship_Race1_S_T1_Faction1.craftable_reagents[2]={}
Def.Ship_Race1_S_T1_Faction1.craftable_reagents[2].resource="Iridium_monocrystall"
Def.Ship_Race1_S_T1_Faction1.craftable_reagents[2].amount=1
Def.Ship_Race1_S_T1_Faction1.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_S_T1_Faction1.fake=true
Def.Ship_Race1_S_T1_Faction1.treeIco="Race1_S_T1_Skin2_atlas"
Def.Ship_Race1_S_T1_Faction1.slot_bones=slot_bones
Def.Ship_Race1_S_T1_Faction1.default_slot_mask=ai.SpaceShipModuleSlotMask.ACTIVE_01+ai.SpaceShipModuleSlotMask.PRIMARY_WEAPON_01 + ai.SpaceShipModuleSlotMask.SECONDARY_WEAPON + ai.SpaceShipModuleSlotMask.SPECIAL

Def.Ship_Race1_S_T1_Faction1_2 = {}
Def.Ship_Race1_S_T1_Faction1_2.ods_export = true
Def.Ship_Race1_S_T1_Faction1_2.inherit="Ship_Race1_S_T1_Faction1"
Def.Ship_Race1_S_T1_Faction1_2.rank=10
Def.Ship_Race1_S_T1_Faction1_2.ui_tree_x=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_2.ui_tree_y=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_2.evolution_cost=100
Def.Ship_Race1_S_T1_Faction1_2.storeItemId=1
Def.Ship_Race1_S_T1_Faction1_2.progress={}
Def.Ship_Race1_S_T1_Faction1_2.progress[1]=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_2.progress[2]=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_2.evolution_max=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_2.craftable_reagents=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_2.next='Ship_Race1_S_T1_Faction1_3'
Def.Ship_Race1_S_T1_Faction1_2.prev='Ship_Race1_S_T1_Faction1'

Def.Ship_Race1_S_T1_Faction1_3 = {}
Def.Ship_Race1_S_T1_Faction1_3.ods_export = true
Def.Ship_Race1_S_T1_Faction1_3.inherit="Ship_Race1_S_T1_Faction1"
Def.Ship_Race1_S_T1_Faction1_3.rank=11
Def.Ship_Race1_S_T1_Faction1_3.ui_tree_x=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_3.ui_tree_y=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_3.evolution_cost=200
Def.Ship_Race1_S_T1_Faction1_3.storeItemId=1
Def.Ship_Race1_S_T1_Faction1_3.progress={ 'Ship_Race1_M_T1_9', 'Ship_Race1_M_T1_10', 'Ship_Race1_M_T1_11', 'Ship_Race1_M_T1_12' }
Def.Ship_Race1_S_T1_Faction1_3.evolution_max=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_3.craftable_reagents=ai.DONT_INHERIT
Def.Ship_Race1_S_T1_Faction1_3.next='Ship_Race1_S_T1_Faction2'
Def.Ship_Race1_S_T1_Faction1_3.prev='Ship_Race1_S_T1_Faction1_2'

Def.Ship_Race1_S_T1_Faction2.ods_export = true
Def.Ship_Race1_S_T1_Faction2.race=ai.Race.SPECIAL
Def.Ship_Race1_S_T1_Faction2.next='Ship_Race1_S_T1_Faction2_2'
Def.Ship_Race1_S_T1_Faction2.prev='Ship_Race1_S_T1_Faction1_3'
Def.Ship_Race1_S_T1_Faction2.rank=12 -- 4
Def.Ship_Race1_S_T1_Faction2.storeItemId=1
Def.Ship_Race1_S_T1_Faction2.ship_tier=4
Def.Ship_Race1_S_T1_Faction2.evolution_cost=300
Def.Ship_Race1_S_T1_Faction2.progress={}
Def.Ship_Race1_S_T1_Faction2.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_S_T1_Faction2.fake=true
Def.Ship_Race1_S_T1_Faction2.treeIco="Race1_S_T1_Skin4_atlas"
Def.Ship_Race1_S_T1_Faction2.slot_bones=slot_bones

Def.Ship_Race1_S_T1_Faction2_2 = {}
Def.Ship_Race1_S_T1_Faction2_2.ods_export = true
Def.Ship_Race1_S_T1_Faction2_2.inherit="Ship_Race1_S_T1_Faction2"
Def.Ship_Race1_S_T1_Faction2_2.rank=13 -- 5
Def.Ship_Race1_S_T1_Faction2_2.evolution_cost=400
Def.Ship_Race1_S_T1_Faction2_2.storeItemId=1
Def.Ship_Race1_S_T1_Faction2_2.progress={ 'Ship_Race1_M_T1_17', 'Ship_Race1_M_T1_18', 'Ship_Race1_M_T1_19', 'Ship_Race1_M_T1_20' }
Def.Ship_Race1_S_T1_Faction2_2.next='Ship_Race1_S_T2_Faction1'
Def.Ship_Race1_S_T1_Faction2_2.prev='Ship_Race1_S_T1_Faction2'

Def.Ship_Race1_S_T2_Faction1.ods_export = true
Def.Ship_Race1_S_T2_Faction1.race=ai.Race.SPECIAL
Def.Ship_Race1_S_T2_Faction1.node_prices=UfoNodesPrice
Def.Ship_Race1_S_T2_Faction1.next='Ship_Race1_S_T2_Faction2'
Def.Ship_Race1_S_T2_Faction1.prev='Ship_Race1_S_T1_Faction2_2'
Def.Ship_Race1_S_T2_Faction1.rank=14 -- 6
Def.Ship_Race1_S_T2_Faction1.ship_tier=4
Def.Ship_Race1_S_T2_Faction1.evolution_cost=500
Def.Ship_Race1_S_T2_Faction1.storeItemId=1
Def.Ship_Race1_S_T2_Faction1.progress={}
Def.Ship_Race1_S_T2_Faction1.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_S_T2_Faction1.fake=true
Def.Ship_Race1_S_T2_Faction1.treeIco="Race1_S_T2_Skin2_atlas"
Def.Ship_Race1_S_T2_Faction1.slot_bones=slot_bones

Def.Ship_Race1_S_T2_Faction2.ods_export = true
Def.Ship_Race1_S_T2_Faction2.race=ai.Race.SPECIAL
Def.Ship_Race1_S_T2_Faction2.node_prices=UfoNodesPrice
Def.Ship_Race1_S_T2_Faction2.next=''
Def.Ship_Race1_S_T2_Faction2.prev='Ship_Race1_S_T2_Faction1'
Def.Ship_Race1_S_T2_Faction2.rank=15 -- 7
Def.Ship_Race1_S_T2_Faction2.ship_tier=4
Def.Ship_Race1_S_T2_Faction2.evolution_cost=600
Def.Ship_Race1_S_T2_Faction2.storeItemId=1
Def.Ship_Race1_S_T2_Faction2.progress={ 'Ship_Race1_M_T1_26', 'Ship_Race1_M_T1_27', 'Ship_Race1_M_T1_28' }
Def.Ship_Race1_S_T2_Faction2.node_prices=GreenNodesPriceDefault
Def.Ship_Race1_S_T2_Faction2.fake=true
Def.Ship_Race1_S_T2_Faction2.treeIco="Race1_S_T2_Skin4_atlas"
Def.Ship_Race1_S_T2_Faction2.slot_bones=slot_bones
]]
