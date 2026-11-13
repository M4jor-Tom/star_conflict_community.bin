OAA_BonusSettings =
{
    bonuses =
    {
        "Bonus_OAA_Damage",
        "Bonus_OAA_Vision",
        "Bonus_OAA_Speed",
        "Bonus_OAA_Resist",
        "Bonus_OAA_Critical",
    },

    spawn_period = 60,
    max_active_bonuses = 0, --75%
	spot_prefix = "OAA_BonusPos_",
}

Def.Bonus_OAA_Damage =
{
    class = "ScBaseEntity",
    in_editor = false,
    hudType = "default",
    model = "models/objects/gameplay/bonuses/speed_booster",
    uiName = "Bonus_HungerDamage_name",

    max_detection_distance = 1000.0,
    vision_radius_coef = 0.5, -- для глоу

    spell_approach = "Bonus_OAA_Damage",
    spell_approach_trigger_radius = 20.0,
    spell_approach_trigger_sound = "sound/game/bonus_take",
    spell_approach_respawn_timer = 0,

    death_effect = "particles/ships/looted",
    end_effect = "particles/objects/bonuses/hg/hg_bonus_orange_explosion",
	spell_approach_owner_only = true, 
    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_orange", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_orange_sphere", joint = "root3" },
    }
}

Spell.Bonus_OAA_Damage =
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

Def.Bonus_OAA_Vision =
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
	spell_approach_owner_only = true, 
    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_cyan", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_cyan_sphere", joint = "root3" },
    }
}

Spell.Bonus_OAA_Vision =
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

Def.Bonus_OAA_Speed =
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
	spell_approach_owner_only = true, 
    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_blue", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_blue_sphere", joint = "root3" },
    }

}

Spell.Bonus_OAA_Speed =
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

Def.Bonus_OAA_Resist =
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
	spell_approach_owner_only = true, 
    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_green", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_green_sphere", joint = "root3" },
    }

}

Spell.Bonus_OAA_Resist =
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

Def.Bonus_OAA_Critical =
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
	spell_approach_owner_only = true, 
    children =
    {
        { effect = "particles/objects/bonuses/hg/hg_bonus_yellow", joint = "joint3" },
        { effect = "particles/objects/bonuses/hg/hg_bonus_yellow_sphere", joint = "root3" },
    }
}

Spell.Bonus_OAA_Critical =
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

Def.OAA_MainGenerator = 
{
	class				= "ScBaseEntity", --"ScBaseEntity",
	signature			= ai.Signature.HUGE,
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 				= 400000,
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	spell_aura_target	= true,
	hud_ico				= "Tutorial_Arrow",
	
	model			= "models/objects/gameplay/generator/generator_01", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },

	children = 
	{
		{ effect ="particles/objects/generator_01_core", joint = "fx" },
	},
	
	broken_parts = 
	{
		{ def = "EnergyGenerator_Wreck",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1.0, },
	},
	
	death_effect	= "particles/explosions/objects/energygenerator_explosion",
	death_sound		= "sound/ambient/frozen_generator_death",
	
	points_reward_kill = 50,
	points_reward_assist_damage = 450,

	vision_always = true,
	relationship_group = 2,
	
	work_sound	= "sound/ambient/frozen_generator_loop",	
	
	uiName 		= "OAA_MainGenerator_name",
} 

Def.OAA_SideGenerator1 = 
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 				= 170000,
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	spell_aura_target	= true,
	model				= "mapskit/maps/models/bigship/power_block2_in3", 
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	hud_ico				= "Tutorial_Arrow",
	death_effect		= "particles/explosions/objects/explosion_big",
	death_sound			= "sound/explosion/ship_expl",
	broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 10, 3, 23 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 2 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( -6, 3, -21 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 3 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 0, 3, 3 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
	},

	points_reward_kill 	= 50,
	points_reward_assist_damage = 350,

	vision_always 		= true,
	relationship_group 	= 2,
	hack_immune		= true,
	
	uiName 				= "OAA_SideGenerator_name",
} 

Def.OAA_SideGenerator2 = 
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 				= 170000,
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	spell_aura_target	= true,
	model				= "mapskit/maps/models/bigship/power_block2_in3", 
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	hud_ico				= "Tutorial_Arrow",

	death_effect		= "particles/explosions/objects/explosion_big",
	death_sound			= "sound/explosion/ship_expl",
	broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 10, 3, 23 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 2 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( -6, 3, -21 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 3 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 0, 3, 3 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
	},

	points_reward_kill 	= 50,
	points_reward_assist_damage = 350,

	vision_always 		= true,
	relationship_group 	= 2,
	hack_immune		= true,
	
	uiName 				= "OAA_SideGenerator_name",
} 

Def.OAA_GeneratorEnergyStart =
{
	class				= "ScBaseEntity",	
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	maxViewDist 		= 999999,
	vision_always 		= true,
	network_sync		= true,
	effect				= "particles/ships/engine_dread_b_big",
}

Def.OAA_InvertorBigExplode =
{
	class				= "ScBaseEntity",	
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	maxViewDist 		= 999999,
	vision_always 		= true,
	network_sync		= true,
	effect 				= "particles/objects/alien_anomaly",
}

Def.OAA_InvertorBeam =
{
	class				= "ScBaseEntity",	
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	maxViewDist 		= 999999,
	vision_always 		= true,
	network_sync		= true,
	effect 				= "particles/areal/huge_stuff/ray_bottom_part",
}

Def.OAA_GeneratorsExplode =
{
	class				= "ScBaseEntity",	
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	maxViewDist 		= 999999,
	vision_always 		= true,
	network_sync		= true,
	effect 				= "particles/explosions/objects/docking_bay_fire",
}

Def.OAA_InvertorExplode =
{
	class				= "ScBaseEntity",	
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	maxViewDist 		= 999999,
	vision_always 		= true,
	network_sync		= true,
	effect 				= "particles/explosions/objects/alien_monster_sphere_explosion",
}