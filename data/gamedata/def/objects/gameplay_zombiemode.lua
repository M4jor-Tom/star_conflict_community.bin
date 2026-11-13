Def.Ship_ZM_Humans =
{
	inherit							= "Ship_Race2_M_T3",
	storeItemId						= 0,
	
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	energy_max_mul					= 2,
	energy_regen_mul				= 2,
	
	hull_health_mul					= 2,
	shield_max_mul					= 2,
	
	max_speed_mul					= 0.16,
	rot_speed_mul 					= 0.8,
	
	contact_damage_cf				= 30,
	
	death_sound = "sound/explosion/human_to_alien",
	
	engine_grades					= designers.engine_zm_humans,

	slot_bones = 
	{
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ]			= ai.DONT_INHERIT,
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ]			= ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ]			= ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ]			= ai.DONT_INHERIT,
	},

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_ZM_Humans",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 	= "Module_ZM_Humans_Invul",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 	= "Module_ZM_Humans_Heal",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 	= "Module_ZM_Humans_SpeedUp",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 		 	= "Module_ZM_Humans_Passive",
	},
	
	default_rocket_munition 		= "SpaceMissile_ZM_Humans",

	uiName							= "ZM_human",
	
	death_effect					= "particles/gadget/zombie/zombie_morph",
	
	broken_parts = 
	{
		[ 1 ] = { model = "models/misc/invisible_model", effect = "particles/empty", angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 20.0, speed_deviation = 15, speed_inherit = 1.3, ttl = 7, },
		[ 2 ] = { model = "models/misc/invisible_model", effect = "particles/empty", angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 20.0, speed_deviation = 15, speed_inherit = 1.3, ttl = 7, },
		[ 3 ] = { model = "models/misc/invisible_model", effect = "particles/empty", angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 20.0, speed_deviation = 15, speed_inherit = 1.3, ttl = 7, },
		[ 4 ] = { model = "models/misc/invisible_model", effect = "particles/empty", angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 20.0, speed_deviation = 15, speed_inherit = 1.3, ttl = 7, },
	},
}

Def.Ship_ZM_Aliens =
{
	inherit							= "Ship_Race2_M_T3",
	storeItemId						= 0,
	
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	energy_max_mul					= 2,
	energy_regen_mul				= 2,
	
	--damage_mul						= 0.34,
	weapon_slots					= 3,
	
	engine_grades					= designers.engine_zm_aliens,
	capacitor_grades				= designers.capacitor_alien_r2_m_grades,
	
	hull_health_mul					= 0.2,
	shield_max_mul					= 0.2,
	
	max_speed_mul					= 0.16,
	rot_speed_mul 					= 0.8,
	
	contact_damage_cf				= 30,
	
	vision_radius					= 75,

	crowd_control_coef				= 0.5,
	cooldown_debuff_reduce_coef		= 0.2,

	slot_bones = 
	{
		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ]			= ai.DONT_INHERIT,
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ]			= ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ]			= ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ]			= ai.DONT_INHERIT,
	},

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_ZM_Aliens",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 		= "Module_ZM_Aliens_Overcharge",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 			= "Module_ZM_Aliens_Pulsar",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 			= "Module_ZM_Aliens_Slowdown",
	},
	
	default_rocket_munition 		= "SpaceMissile_ZM_Aliens",
	


	relationship_group				= ai.RelationshipGroups.Alien,
	race							= ai.Race.SPECIAL,
	
	model							= "models/ships/race_2/m/race2_m_t3_precursor",
	death_effect					= "particles/explosions/alien_explosion_small_01",
	
	hud_ico							= "nlo_2",
	hangarIco						= "Ship_Leviathan_S",
	default_icon					= "shopIco_Ship_Leviathan_S",
	hangarIcoSmall					= "Ship_Leviathan_S_small",
	
	uiName							= "ZM_Alien",
	ship_name						= "Alien_guard",
	
	spawn_timeout					= 20,
}

Def.Weapon_ZM_Humans =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
	storeItemId			= 0,
	cant_be_bought  	= true,
	
	cycle_barrels 		= true,
	
	fire_rate			= 80,
	projectile_speed	= 300,
	
	dispersion			= 0.2,
	dispersion_max		= 2.0,
	dispersion_add		= 0.35,
	dispersion_sub		= 1.2,

	optimal_range		= 125,
	max_range			= 165,
	
	damage_emp			= 680,

	crit_chance			= 0.05,
	crit_damage			= 0.75,
	
	heat_max			= 10,
	heat_add			= 0.8,
	heat_sub			= 5,
	overheat_time		= 1.5,
	
	spell_on_hit		= "Spell_ZM_Weapon_Humans",
	
	model				= "models/weapons/rf_blaster/rf_blaster_mod3",
	default_icon		= "ItemSubtype_ZmHumansGun",

	item_subtype		= ItemSubtype.ZmHumansGun,
	module_type			= ai.ModuleType.WEAPON,
	class_mask			= ai.ShipClass.MEDIUM,
	weapon_class		= ai.WeaponClass.PLASMAGUN,
	
	projectile			= "Projectile_Plasma_Default",
	
	muzzleflash_color	= { kinetic = "57 118 255 128", emp = "57 118 255 128", thermal = "57 118 255 128", },
	shot_effect			= "particles/weapons/plasma/muzzle",
	shot_effect			= "particles/weapons/plasma/muzzle_auto",
	shot_once_sound		= "sound/weapons/plasmagun/auto",
}

Spell.Spell_ZM_Weapon_Humans =
{
	influence					= ai.Spell.IMPULSE,
	target =
	{
		target         			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		vitality       			= ai.SpellTargetVitality.ALIVE,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	
	influence_param				= -10,
	
	isBuff						= false,
	hud_visible 				= false,
}

Def.Weapon_ZM_Aliens =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
	storeItemId			= 0,
	cant_be_bought  	= true,
	
	fire_rate			= 150,
	projectile_speed	= 450,
	
	dispersion			= 0.2,
	dispersion_max		= 2.5,
	dispersion_add		= 0.4,
	dispersion_sub		= 1.0,

	optimal_range		= 25,
	max_range			= 60,
	
	damage_emp			= 600,

	crit_chance			= 0.05,
	crit_damage			= 0.75,
	
	heat_max			= 10,
	heat_add			= 1,
	heat_sub			= 5,
	overheat_time		= 1.5,
	
	model				= "models/weapons/rf_blaster/rf_blaster_mod3",
	default_icon		= "ItemSubtype_ZmAliensGun",

	item_subtype		= ItemSubtype.ZmAliensGun,
	module_type			= ai.ModuleType.WEAPON,
	class_mask			= ai.ShipClass.MEDIUM,
	weapon_class		= ai.WeaponClass.PLASMAGUN,
	
	projectile			= "Projectile_ZM_Aliens",
	
	muzzleflash_color	= { kinetic = "57 255 118 128", emp = "57 255 118 128", thermal = "57 255 118 128", },
	shot_effect			= "particles/weapons/alien/alien_blaster_muzzle",
	shot_once_sound		= "sound/weapons/zm_aliengun/zma_shot",
}

Def.Projectile_ZM_Aliens =
{
	inherit			= "Projectile_Plasma_Default",
	effect 			= "particles/weapons/alien/alien_blaster_projectile",
	hit_effect		= "particles/weapons/alien/alien_blaster_muzzle",
	
	shadowCaster		= false,
	impact_type 		= "railgun",
	
	uiName			= "DroidTurret_Projectile",	
}

Def.SpaceMissile_ZM_Humans =
{
	inherit							= "SpaceMissile_AAMSlow_T3_Mk3",
	storeItemId						= 0,
	
	cooldown						= 8,
	holder_size						= 8,
	
	spell							= "Spell_ZM_Missile_Humans",
	
	speed							= 0,
	detonation_radius				= 35,
	time_to_live					= 10,
	
	item_subtype					= ItemSubtype.ZmHumansRocket,
	
	default_icon					= "ItemSubtype_SpaceMissile_ZM_Humans",
	
	explosion_blast_wave			= "BlastWave_SM_ZM_Humans",
	launch_sound 				= "sound/weapons/mine/zmb_mine_humans_launch",
}

Def.BlastWave_SM_ZM_Humans =
{
	inherit							= "BlastWave_SM_AAMSlow_T3_Mk3",
	sound = "sound/explosion/zmb_mine_expl",
}

Spell.Spell_ZM_Missile_Humans =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SLOW_MOVEMENT,
	target =
	{
		class					= ai.SpellTargetClass.SHIP,
		area					= ai.SpellTargetArea.AROUND,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 2.5,
	target_range				= 50,
	duration					= 7.8,
	
	isBuff						= false,
	
	diminish_aura_param			= true,
	
	aura_sound 					= "sound/aura/voidzone",
	
	aura_target_fx = "particles/gadget/slow_movement",
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_SpaceMissile_ZM_Humans", },
	},
}

Def.SpaceMissile_ZM_Aliens =
{
	inherit							= "SpaceMissile_AAMSlow_T3_Mk3",
	storeItemId						= 0,
	
	holder_size						= 5,
	max_range						= 150,
	
	spell							= "Spell_ZM_Missile_Aliens",
	detonation_radius				= 75,
	
	item_subtype					= ItemSubtype.ZmAliensRocket,
	
	default_icon					= "ItemSubtype_SpaceMissile_ZM_Aliens",
	
	explosion_blast_wave			= "BlastWave_SM_ZM_Aliens",
	launch_sound = "sound/weapons/rockets/alienrocket",
}

Def.BlastWave_SM_ZM_Aliens =
{
	inherit							= "BlastWave_SM_AAMSlow_T3_Mk3",
	damage_emp						= 200,
	sound = "sound/explosion/alienrocket_expl",
}

Spell.Spell_ZM_Missile_Aliens =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.SPY_DRONE,
	target =
	{
		class							= ai.SpellTargetClass.SHIP,
		area							= ai.SpellTargetArea.AROUND,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target							= ai.SpellTarget.HOLDER,
	
	target_range						= 80,

	duration							= 5,
	
	diminish_aura_param					= true,

	isBuff								= false,
	
	ui_ico =
	{
		target_system 					= { tex = "ItemSubtype_SpaceMissile_ZM_Aliens", },
	},
}

Def.Module_ZM_Humans_Invul =
{
	class								= "ActiveModule",
	in_editor 							= false,
	
	cooldown							= 90,
	energy_cost							= 75,
	
	spell								= "Spell_ZM_Humans_Invul",
	
	ignore_silence						= true,
	
	activate_sound 						= "sound/gadgets2/zmb_invul",
	
	item_subtype						= ItemSubtype.ZmHumansInvul,
	
	default_icon						= "ItemSubtype_Module_ZM_Humans_Invul",
}

Spell.Spell_ZM_Humans_Invul =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.INVULNERABILITY,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	duration							= 5,

	isBuff								= true,
	
	aura_fx								= "particles/gadget/invulnerability",
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_Module_ZM_Humans_Invul", },
	},
}

Def.Module_ZM_Aliens_Overcharge =
{
	class								= "ActiveModule",
	in_editor 							= false,
	
	cooldown							= 35,
	energy_cost							= 75,
	
	spell								= "Spell_ZM_Aliens_Overcharge",
	
	ignore_silence						= true,
	
	activate_sound 						= "sound/gadgets2/zmb_aliens_overcharge",
	
	item_subtype						= ItemSubtype.ZmAliensOvercharge,
	
	default_icon						= "ItemSubtype_Module_ZM_Aliens_Overcharge",
}

Spell.Spell_ZM_Aliens_Overcharge =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.OVERCHARGE,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	aura_param							= 0.5,
	duration							= 13,

	isBuff								= true,
	
	cleanse_on_apply					= true,
	
	aura_fx								= "particles/gadget/overdrive",
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_Module_ZM_Aliens_Overcharge", },
	},
}

Spell.Spell_ZM_ZombieDynamicBuff =  -- для геймплея ZM
{
	isBuff				= true,
	gameplay_specific	= true,
	hud_visible 		= false,
	hud_visible_holder	= false,
	aura				= ai.Aura.HEALTH_MOD,
	aura_param			= 0.2,
	target 				= ai.SpellTarget.CASTER,
	max_stacks			= 20,	
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras = {
		{
			isBuff				= true,
			gameplay_specific	= true,
			hud_visible 		= false,
			hud_visible_holder	= false,
			aura				= ai.Aura.FAST_MOVEMENT,
			aura_param			= 0.05,
			max_stacks			= 20,
			ui_ico 				= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
		{
			isBuff				= true,
			gameplay_specific	= true,
			hud_visible 		= false,
			hud_visible_holder	= false,
			aura				= ai.Aura.SHIELD_MOD,
			aura_param			= 0.2,
			max_stacks			= 20,
			ui_ico 				= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
		{
			isBuff				= true,
			gameplay_specific	= true,
			hud_visible 		= false,
			hud_visible_holder	= false,
			aura				= ai.Aura.DAMAGE_MOD,
			aura_param			= 0.15,
			max_stacks			= 20,
			ui_ico 				= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
	},
}

Def.Module_ZM_Humans_Heal =
{
	class							= "ActiveModule",
	in_editor 						= false,
	
	energy_cost						= 55,
	cooldown						= 45,
	
	spell							= "Spell_ZM_Humans_Heal",
	activate_sound 					= "sound/gadgets/common_activate",
	item_subtype					= ItemSubtype.ZmHumansHeal,
	
	default_icon					= "ItemSubtype_Module_ZM_Humans_Heal",
	
	influence_type_color			= InfluenceTypeColor.REPAIR_HULL,
}

Spell.Spell_ZM_Humans_Heal =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.HEAL_HULL_PERCENT_PERIODIC,
	target 						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 1/5,

	duration					= 5,
	period						= 1,
	
	isBuff						= true,
	
	aura_fx						= "particles/gadget/hull_heal",

	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_Module_ZM_Humans_Heal", },
	},
}

Def.Module_ZM_Aliens_Pulsar =
{
	class							= "ActiveModule",
	in_editor 						= false,
	
	energy_cost						= 55,
	cooldown						= 45,
	
	spell							= "Spell_ZM_Aliens_Pulsar",

	activate_sound					= "sound/ufo_modules/ufo_common_activation",
	item_subtype					= ItemSubtype.ZmAliensPulsar,
	
	default_icon					= "ItemSubtype_Module_ZM_Aliens_Pulsar",
	
	count_radar_invisible_spell_targets = false,
	
	influence_type_color			= InfluenceTypeColor.DAMAGE_TERMAL,
}

Spell.Spell_ZM_Aliens_Pulsar =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		area 							= ai.SpellTargetArea.AROUND,
		misc							= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	
	aura_param							= 650,
	aura_range							= 150,
	
	duration 							= 10,
	period 								= 1,
	
	isBuff								= false,
	
	period_sound 						= "sound/aura/spell_AG_Invul_period",
	period_holder_sound					= "sound/aura/spell_AG_Invul_period_holder",

	period_fx							= "particles/gadget/pulsars/pulsar_alien_hit",
	period_my_fx      					= "particles/gadget/pulsars/pulsar_alien_hit", 
	period_beam_fx 						= "particles/gadget/pulsars/pulsar_alien_beam",
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_Module_ZM_Aliens_Pulsar", },
	},
}

Def.Module_ZM_Humans_SpeedUp =
{
	class							= "ActiveModule",
	in_editor 						= false,
	
	energy_cost						= 220,
	cooldown						= 44,
	
	spell							= "Spell_ZM_Humans_SpeedUp",

	activate_sound					= "sound/gadgets2/zmb_humans_speedup",
	item_subtype					= ItemSubtype.ZmHumansSpeedUp,
	
	default_icon					= "ItemSubtype_Module_ZM_Humans_SpeedUp",
	
	influence_type_color			= InfluenceTypeColor.BUFF_ABILITY,
}

Spell.Spell_ZM_Humans_SpeedUp =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.FAST_MOVEMENT,
	target 						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 0.65,

	duration					= 17,
	
	isBuff						= true,
	
	dispell_flag				= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET,
	
	aura_fx		= "particles/gadget/overdrive",
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_Module_ZM_Humans_SpeedUp", },
	},
}

Def.Module_ZM_Aliens_Slowdown =
{
	class							= "ActiveModule",
	in_editor 						= false,
	
	energy_cost						= 120,
	cooldown						= 26,
	
	spell							= "Spell_ZM_Aliens_Slowdown",

	activate_sound					= "sound/gadgets2/zmb_aliens_slowdown",
	item_subtype					= ItemSubtype.ZmAliensSlowdown,
	
	default_icon					= "ItemSubtype_Module_ZM_Aliens_Slowdown",
	
	influence_type_color			= InfluenceTypeColor.DEBUFF_STAT,
}

Spell.Spell_ZM_Aliens_Slowdown =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.SLOW_MOVEMENT,
	target 						= ai.SpellTarget.CASTER,
	aura_target =
	{
		class					= ai.SpellTargetClass.SHIP,
		relationship			= ai.SpellTargetRelationship.ENEMY,
		vitality				= ai.SpellTargetVitality.ALIVE,
		area					= ai.SpellTargetArea.IN_CONE,
		misc 					= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	
	fixed_cylinder_target		= false,
	aura_extra_radius			= 20,
	aura_range					= 300,
	
	apply_interval				= 16,
	show_dispel_status			= true,
	
	aura_param					= 99,

	duration					= 2,
	period						= 1,
	
	isBuff						= false,
	aura_start_sound 			= "sound/aura/zmb_aliens_slowdown",
	
	work_beam_fx				= "particles/weapons/horror_howl_beam/beam_green",
--	ray_sound 					= "sound/destroyer/TRay_beam",
	aura_target_fx 				= "particles/gadget/slow_movement",
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_Module_ZM_Aliens_Slowdown", },
	},
}

Def.Module_ZM_Humans_Passive =
{
	class 							= "SpaceShipModule",
	in_editor 						= false,
	spell_on_max_speed_minus		= "Spell_ZM_Humans_Passive",
	max_speed_percent 				= 0.6,
	max_speed_activation_time		= 45,
	max_speed_deactivation_time		= 2,
	cooldown 						= 5,
	show_cooldown_status 			= false,
	uiName 							= "zm_humans_debuff",
}
--[[
Spell.Spell_ZM_Humans_Passive =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	target 						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 100,
	
	max_stacks 					= 6,
	
	isBuff						= false,
	
	aura_fx						= "particles/gadget/damage_thermal",
	--aura_fx					= "particles/gadget/suicide_aura_green",
	--aura_sound 				= "sound/aura/voidzone",
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_Module_ZM_Humans_Passive", },
	},
}]]
--[[
Spell.Spell_ZM_Humans_Passive =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	target 						= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target					= ai.SpellTarget.ALLY_AROUND,
	
	aura_param					= 100,
	aura_range					= 35,
	period						= 1,
	duration					= 15,
	
	max_stacks 					= 6,
	
	isBuff						= false,
	
	aura_fx						= "particles/gadget/suicide_aura_green",
	aura_sound 					= "sound/swarm/swarm_idle",
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_Module_ZM_Humans_Passive", },
	},
}
]]

Spell.Spell_ZM_Humans_Passive =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.CAST_SPELL_PERIODIC,
	target 						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	
	period						= 10,
	
	isBuff						= false,
	hud_visible					= false,
	gameplay_specific			= true,
	
	target_spell				= "Spell_ZM_Humans_Passive_2",
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_Module_ZM_Humans_Passive", },
	},
}

Spell.Spell_ZM_Humans_Passive_2 =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	target 						= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target					= ai.SpellTarget.ALLY_AROUND,
	
	aura_param					= 250,
	aura_range					= 15,
	period						= 1,
	duration					= 30,
	
	isBuff						= false,
	gameplay_specific			= true,
	
	aura_sound 					= "sound/aura/zmb_Humans_Passive_2",
	cast_position_fx			= "particles/gadget/zombie/zombie_damage_sphere",
	--cast_position_fx			= "particles/gadget/suicide_aura_green",
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_Module_ZM_Humans_Passive", },
	},
}