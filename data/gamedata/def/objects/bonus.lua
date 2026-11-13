--
Def.Bonus_Radar = 
{
	class 			= "ScBaseEntity",
	in_editor			= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	--damageable		= true,
	--health 			= 10000,
	uiName			= "Bonus_Radar_name",
	
	model			= "models/objects/gameplay/bombball/bombball",
	
	spell_approach	= "Bonus_Radar",
	spell_approach_trigger_radius = 20.0,	--#81689 везде поставил 20 (было 10, а местами даже 5, есть  правда какой-то скрап хилки там 50 стоит)
	spell_approach_respawn_timer = 3.5 * 60,

	death_effect = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
}


--
Def.Bonus_QuadDamage = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	--damageable	= true,
	--health 			= 10000,
	uiName			= "Bonus_QuadDamage_name",
	
	model			= "models/objects/gameplay/bonuses/quad_damage",
	
    --glow_effect 	= "particles/objects/bonuses/quad_damage_exp",
    max_detection_distance = 500.0,
	vision_radius_coef = 0.5,

	--effect			= "particles/objects/bonuses/quad_damage",
	
	spell_approach	= "Bonus_QuadDamage",
	spell_approach_trigger_radius = 20.0,
	spell_approach_respawn_timer = 3.5 * 60,

	death_effect	= "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/quad_damage", joint = "joint1" },
		{ effect = "particles/objects/bonuses/quad_damage_exp", joint = "root1" },
	}
}

Def.OpenWorld_Bonus_QuadDamage = 
{
	inherit = "Bonus_QuadDamage",
	spell_approach	= "OpenWorld_Bonus_QuadDamage",
	spell_approach_respawn_timer = 1,
}

Def.OpenWorld_Bonus_HealHull = 
{
	inherit = "Bonus_HealHull",
	spell_approach	= "OpenWorld_Bonus_HealHull",
	spell_approach_respawn_timer = 1,
}

Def.Bonus_DM_QuadDamage = 
{
	inherit = "Bonus_QuadDamage",
	spell_approach	= "Bonus_DM_QuadDamage",
	spell_approach_respawn_timer = 3 * 60,
}

Def.Bonus_QuadDamage_Levi = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	--damageable	= true,
	--health 			= 10000,
	uiName			= "Bonus_QuadDamage_Levi_name",
	
	model			= "models/objects/gameplay/prec_obj/prec_obj",	--prec_obj_bg/prec_crystal
	
    --glow_effect 	= "particles/objects/bonuses/quad_damage_exp",
    max_detection_distance = 500.0,
	vision_radius_coef = 0.5,

	--effect			= "particles/objects/bonuses/quad_damage",
	
	spell_approach	= "Bonus_QuadDamage_Levi",
	spell_approach_trigger_radius = 20.0,
	spell_approach_respawn_timer = 30,

	death_effect	= "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",

	children = 
	{
		{ effect = "particles/objects/bonuses/quad_damage_exp", joint = "root1" },
	}
}

--
Def.Bonus_Stealth_PVE = 
{
	class 			= "ScBaseEntity",
	in_editor			= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	uiName			= "Bonus_Stealth_PVE_name",
	
	--model			= "models/objects/gameplay/bonuses/quad_damage_hologram",
	model			= "models/objects/gameplay/bonuses/shield_restore",
	
	max_detection_distance = 500.0,
	vision_radius_coef = 0.5,

	spell_approach	= "Bonus_Stealth_PVE_Cast",
	spell_approach_trigger_radius = 20.0,
	spell_approach_respawn_timer = 30,

	death_effect = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/shield_restore", joint = "joint2" },
		{ effect = "particles/objects/bonuses/shield_restore_exp", joint = "root2" },
	}
}

--
Def.Bonus_Stealth_Levi = 
{
	class 			= "ScBaseEntity",
	in_editor			= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	uiName			= "Bonus_Stealth_Levi_name",
	
	--model			= "models/objects/gameplay/bonuses/quad_damage_hologram",
	model			= "models/objects/gameplay/bonuses/armor_restore",
	
	max_detection_distance = 500.0,
	vision_radius_coef = 0.5,

	spell_approach	= "Bonus_Stealth_Levi",
	spell_approach_trigger_radius = 20.0,
	spell_approach_respawn_timer = 30,

	death_effect = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/shield_restore", joint = "joint2" },
		{ effect = "particles/objects/bonuses/shield_restore_exp", joint = "root2" },
	}
}


--
Def.Bonus_Invulnerability = 
{
	class 			= "ScBaseEntity",
	in_editor			= true,
	hudType			= "default",
	hud_visibility_type = "minor",
--	damageable	= true,
--	health 			= 10000,
	uiName			= "Bonus_Invulnerability_name",
	
	model			= "models/objects/gameplay/bonuses/shield_restore",
	
	--glow_effect 	= "particles/objects/bonuses/shield_restore_exp",
	max_detection_distance = 500.0,
	vision_radius_coef = 0.5,

	--effect			= "particles/objects/bonuses/shield_restore",
	
	spell_approach	= "Bonus_Invulnerability",
	spell_approach_trigger_radius = 20.0,
	spell_approach_respawn_timer = 3.5 * 60,

	death_effect = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/shield_restore", joint = "joint2" },
		{ effect = "particles/objects/bonuses/shield_restore_exp", joint = "root2" },
	}
}

Def.Bonus_DM_Invulnerability = 
{
	inherit = "Bonus_Invulnerability",
	spell_approach	= "Bonus_DM_Invulnerability",
	spell_approach_respawn_timer = 5 * 60,
}


--
Def.Bonus_HealHull = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
--	damageable		= true,
--	health 			= 10000,
	uiName			= "Bonus_HealHull_name",
	
	model			= "models/objects/gameplay/bonuses/armor_restore",

	--glow_effect 	= "particles/objects/bonuses/armor_restore_exp",
    max_detection_distance = 500.0,
	vision_radius_coef = 0.5,
	
	--effect			= "particles/objects/bonuses/armor_restore",
	
	spell_approach	= "Bonus_HealHull",
	spell_approach_trigger_radius = 20.0,
	spell_approach_respawn_timer = 3.5 * 60,

	death_effect = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/armor_restore", joint = "joint4" },
		{ effect = "particles/objects/bonuses/armor_restore_exp", joint = "root4" },
	}
}

Def.Bonus_DM_HealHull = 
{
	inherit = "Bonus_HealHull",
	spell_approach	= "Bonus_DM_HealHull",
	spell_approach_respawn_timer = 2 * 60,
}


--
Def.Bonus_SpeedUp = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	--damageable		= true,
	--health 			= 10000,
	uiName			= "Bonus_SpeedUp_name",
	model			= "models/objects/gameplay/bonuses/speed_booster",

	--glow_effect 	= "particles/objects/bonuses/speed_booster_exp",
    max_detection_distance = 500.0,
	vision_radius_coef = 0.5,

	--effect			= "particles/objects/bonuses/speed_booster",
	
	spell_approach	= "Bonus_SpeedUp",
	spell_approach_trigger_radius = 20.0,
	spell_approach_respawn_timer = 3.5 * 60,

	death_effect = "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/speed_booster", joint = "joint3" },
		{ effect = "particles/objects/bonuses/speed_booster_exp", joint = "root3" },
	}
}

Def.Bonus_DM_SpeedUp = 
{
	inherit = "Bonus_SpeedUp",
	spell_approach	= "Bonus_DM_SpeedUp",
	spell_approach_respawn_timer = 1 * 60,
}

Def.Bonus_GreenEngineerScrap = 
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	hudType			= "default",
	hud_visibility_type = "minor",

	uiName			= "Bonus_GreenEngineerScrap_name",
	
	-- model			= "models/objects/gameplay/bonuses/armor_restore",
	model			= "models/objects/gameplay/bonuses/greenscrap_bonus",

	--glow_effect 	= "particles/objects/bonuses/armor_restore_exp",
    max_detection_distance = 500.0,
	vision_radius_coef = 0.5,
	
	--effect			= "particles/objects/bonuses/armor_restore",
	
	spell_approach	= "Bonus_GreenEngineerScrapMult",
	spell_approach_trigger_radius = 50,
	spell_approach_respawn_timer = 0,
	spell_approach_time_to_live = 120,

	death_effect = "particles/other/alien_engeneer_parts_take",
	-- spell_approach_trigger_sound = "sound/game/bonus_take",
	children = 
	{
		-- { effect = "particles/objects/bonuses/armor_restore", joint = "joint4" },
		{ effect = "particles/other/alien_engeneer_parts_beacon", joint = "root4" },
	},
	personalized = true, --флаг, указывающий, что бонус будет доступен индивидульно для каждого игрока
}

Def.no_scrap = -- это надо чтобы отключать скрап имея его в базовых прототипах кораблей.
{
	class 			= "BaseEntity",
}

Def.Bonus_ScrapTest = 
{
	inherit = "Bonus_GreenEngineerScrap",
	personalized = false,
	spell_approach	= "Bonus_HealHull",
	spell_approach_trigger_radius = 20.0,
	spell_approach_respawn_timer = 3.5 * 60,
	spell_approach_time_to_live = nil,
}

---------------------------------------------------------------------------------
-- #0087956: ПВЕ. исследования
local spell_approach_respawn_timer = nil
local spell_approach_time_to_live = 30
Def.Bonus_PVE_SpeedUp = 
{
	class 							= "ScBaseEntity",
	in_editor						= true,
	hudType							= "default",
	hud_visibility_type 			= "minor",
	uiName							= "Bonus_Power_name",
	model							= "models/objects/gameplay/bonuses/speed_booster",

	--glow_effect 	= "particles/objects/bonuses/speed_booster_exp",
    max_detection_distance 			= 500.0,
	vision_radius_coef 				= 0.5,

	--effect			= "particles/objects/bonuses/speed_booster",
	
	spell_approach	= "Bonus_PVE_SpeedUp",
	spell_approach_trigger_radius 	= 15.0,
	spell_approach_respawn_timer 	= 0,
	spell_approach_time_to_live 	= spell_approach_time_to_live,

	death_effect 					= "particles/ships/looted",
	spell_approach_trigger_sound 	= "sound/game/bonus_take",
	children = 
	{
		{ effect = "particles/objects/bonuses/speed_booster", joint = "joint3" },
		{ effect = "particles/objects/bonuses/speed_booster_exp", joint = "root3" },
	}
}
Def.Bonus_PVE_Heal_S = 
{
	class 							= "ScBaseEntity",
	hudType							= "default",
	hud_visibility_type 			= "minor",
	uiName							= "Bonus_Power_name",
	model							= "models/objects/gameplay/bonuses/armor_restore",

	--glow_effect 	= "particles/objects/bonuses/speed_booster_exp",
    max_detection_distance 			= 500.0,
	vision_radius_coef 				= 0.5,

	--effect			= "particles/objects/bonuses/speed_booster",
	
	spell_approach					= "Bonus_PVE_Heal_S",
	spell_approach_trigger_radius 	= 15.0,
	spell_approach_respawn_timer 	= 0,
	spell_approach_time_to_live 	= spell_approach_time_to_live,

	--spell_approach_time_to_live 	= nil,

	death_effect 					= "particles/ships/looted",
	spell_approach_trigger_sound 	= "sound/game/bonus_take",
 	children = 
	{
		{ effect = "particles/objects/bonuses/speed_booster", joint = "joint3" },
		{ effect = "particles/objects/bonuses/speed_booster_exp", joint = "root3" },
	} 
}
Def.Bonus_PVE_Heal_All = 
{
	class 							= "ScBaseEntity",
	hudType							= "default",
	hud_visibility_type 			= "minor",
	uiName							= "Bonus_Power_name",
	model							= "models/objects/gameplay/bonuses/armor_restore",

	--glow_effect 	= "particles/objects/bonuses/speed_booster_exp",
    max_detection_distance 			= 500.0,
	vision_radius_coef 				= 0.5,

	--effect			= "particles/objects/bonuses/speed_booster",
	
	spell_approach					= "Bonus_PVE_Heal_All",
	spell_approach_trigger_radius 	= 15.0,
	spell_approach_respawn_timer 	= 0,
	spell_approach_time_to_live 	= spell_approach_time_to_live,

	--spell_approach_time_to_live 	= nil,

	death_effect 					= "particles/ships/looted",
	spell_approach_trigger_sound 	= "sound/game/bonus_take",
 	children = 
	{
		{ effect = "particles/objects/bonuses/speed_booster", joint = "joint3" },
		{ effect = "particles/objects/bonuses/speed_booster_exp", joint = "root3" },
	} 
}
Def.Bonus_PVE_Shield_S = 
{
	class 							= "ScBaseEntity",
	hudType							= "default",
	hud_visibility_type 			= "minor",
	uiName							= "Bonus_Power_name",
	model							= "models/objects/gameplay/bonuses/shield_restore",

	--glow_effect 	= "particles/objects/bonuses/speed_booster_exp",
    max_detection_distance 			= 500.0,
	vision_radius_coef 				= 0.5,

	--effect			= "particles/objects/bonuses/speed_booster",
	
	spell_approach					= "Bonus_PVE_Shield_S",
	spell_approach_trigger_radius 	= 15.0,
	spell_approach_respawn_timer 	= 0,
	spell_approach_time_to_live 	= spell_approach_time_to_live,

	--spell_approach_time_to_live 	= nil,

	death_effect 					= "particles/ships/looted",
	spell_approach_trigger_sound 	= "sound/game/bonus_take",
 	children = 
	{
		{ effect = "particles/objects/bonuses/shield_restore", joint = "joint2" },
		{ effect = "particles/objects/bonuses/shield_restore_exp", joint = "root2" },
	} 
}
Def.Bonus_PVE_Shield_All = 
{
	class 							= "ScBaseEntity",
	hudType							= "default",
	hud_visibility_type 			= "minor",
	uiName							= "Bonus_Power_name",
	model							= "models/objects/gameplay/bonuses/shield_restore",

	--glow_effect 	= "particles/objects/bonuses/speed_booster_exp",
    max_detection_distance 			= 500.0,
	vision_radius_coef 				= 0.5,

	--effect			= "particles/objects/bonuses/speed_booster",
	
	spell_approach					= "Bonus_PVE_Shield_S",
	spell_approach_trigger_radius 	= 15.0,
	spell_approach_respawn_timer 	= 0,
	spell_approach_time_to_live 	= spell_approach_time_to_live,

	--spell_approach_time_to_live 	= nil,

	death_effect 					= "particles/ships/looted",
	spell_approach_trigger_sound 	= "sound/game/bonus_take",
 	children = 
	{
		{ effect = "particles/objects/bonuses/shield_restore", joint = "joint2" },
		{ effect = "particles/objects/bonuses/shield_restore_exp", joint = "root2" },
	} 
}

Def.Bonus_PVE_Damage_Self = 
{
	class 							= "ScBaseEntity",
	hudType							= "default",
	hud_visibility_type 			= "minor",
	uiName							= "Bonus_Power_name", -- Bonus_HealHull_name
	model							= "models/objects/gameplay/bonuses/quad_damage",

	--glow_effect 	= "particles/objects/bonuses/speed_booster_exp",
    max_detection_distance 			= 500.0,
	vision_radius_coef 				= 0.5,

	--effect			= "particles/objects/bonuses/speed_booster",
	
	spell_approach					= "Bonus_PVE_Damage_Self",
	spell_approach_trigger_radius 	= 15.0,
	spell_approach_respawn_timer 	= 0,
	spell_approach_time_to_live 	= spell_approach_time_to_live,

	--spell_approach_time_to_live 	= nil,

	death_effect 					= "particles/ships/looted",
	spell_approach_trigger_sound 	= "sound/game/bonus_take",
 	children = 
	{
		{ effect = "particles/objects/bonuses/quad_damage", joint = "joint1" },
		{ effect = "particles/objects/bonuses/quad_damage_exp", joint = "root1" },
	} 
}