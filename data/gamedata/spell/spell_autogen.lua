-- ----------------------------------------------------------------------------
--
-- Created: 12-Sep-2019
-- Copyright © 2019, Targem LLC. All rights reserved.
-- 
-- Autogen spells
--
-- ----------------------------------------------------------------------------

--

Spell.Spell_AG_Prototype_RocketOnKill_End =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DEATH_ROCKET,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	duration					= 1.5,
	
	--death_rocket				= "AG_Bonus_HealAll",
	
	isBuff						= false,
	hud_visible 				= false,
}

Spell.Spell_AG_Prototype_RocketOnKill =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.CAST_SPELL_PERIODIC,
	target 						= ai.SpellTarget.CASTER,
	aura_target =
	{
		class					= ai.SpellTargetClass.SHIP,
		area					= ai.SpellTargetArea.AROUND,
		relationship			= ai.SpellTargetRelationship.ENEMY,
		vitality      			= ai.SpellTargetVitality.ALIVE,
	},
	aura_range					= 250,
	
	period						= 1.5,
	
	target_spell				= "Spell_AG_Prototype_RocketOnKill_End",
	
	isBuff						= false,
	hud_visible 				= false,
	gameplay_specific			= true,
}

--######################## HIT/CRIT ########################--

Spell.Spell_AG_DamageToPower =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	target 						= ai.SpellTarget.CASTER,
	
	aura_target =
	{
		class 					= ai.SpellTargetClass.SHIP,
		relationship 			= ai.SpellTargetRelationship.ENEMY,
		misc					= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.LOCKER_OF_HOLDER,
	},

	aura_param					= 500,
	duration 					= 5,
	period						= 0.5,
	isBuff						= false,
	hud_visible 				= false,
	
	period_fx					= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      			= "particles/gadget/pulsars/pulsar_hit_2", 
	period_beam_fx 				= "particles/gadget/pulsars/pulsar_beam",
	period_holder_sound 		= "sound/aura/spell_AG_Invul_period_holder",
	period_sound 				= "sound/aura/spell_AG_Invul_period",
	
	additional_auras =
	{
		{
			influence 	= ai.Spell.APPLY_AURA,
			aura 		= ai.Aura.DAMAGE_REFLECT,
			aura_target =
			{
				class 					= ai.SpellTargetClass.SHIP,
				relationship 			= ai.SpellTargetRelationship.ENEMY,
				misc					= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.LOCKER_OF_HOLDER,
			},
			
			aura_param					= 20000,
			duration					= 5,
			period						= 0.5,
			
			isBuff						= false,
			
			ui_ico =
			{
				target_system 			= { tex = "autogen_EFFECT_damage_to_power", },
			},
		},
	}
}

Spell.Spell_AG_Impulse =
{

	influence					= ai.Spell.IMPULSE,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	
	influence_param				= -10,
	isBuff						= false,
	
	cast_position_fx			= "particles/weapons/other/grab_explosion",
	influence_sound		 		= "sound/aura/spell_AG_Impulse",
}

Spell.Spell_AG_EnergyVampire =
{
	influence					= ai.Spell.ENERGY_VAMPIRE,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	
	influence_param				= 200,
	
	--apply_interval				= 30,
	--show_dispel_status			= false,
	
	isBuff						= false,
	influence_sound 				= "sound/aura/spell_AG_EnergyVampire",
	
	cast_fx = "particles/gadget/add_energy_uncirculated",
}

Spell.Spell_AG_ShieldHeal =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target 				= ai.SpellTarget.CASTER,
	
	aura_param					= 150,
	duration					= 2,
	period						= 1,
	
	max_stacks 					= 3,
	
	--apply_interval				= 30,
	--show_dispel_status			= false,
	
	spell_on_weapon_hit_caster_timeout	= 0.3,
	
	isBuff						= true,
	
	aura_target_fx				= "particles/gadget/shield_heal",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_shield_heal", },
	},
}

Spell.Spell_AG_HullHeal =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target 				= ai.SpellTarget.CASTER,
	
	aura_param					= 150,
	duration					= 2,
	period						= 1,
	
	max_stacks 					= 3,
	
	--apply_interval				= 30,
	--show_dispel_status			= false,
	
	spell_on_weapon_hit_caster_timeout	= 0.3,
	
	isBuff						= true,
	
	aura_target_fx				= "particles/gadget/hull_heal",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_hull_heal", },
	},
}

Spell.Spell_AG_ResistShieldDec =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SHIELD_RESIST_ALL_DEC,
	target =
	{
		class 					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP,
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= 60,
	duration					= 5,
	
	max_stacks 					= 3,
	
	spell_on_weapon_crit_caster_timeout	= 0.5,
	
	isBuff						= false,
	
	aura_target_fx				= "particles/gadget/shield_supressor_aura",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_anti_shield", },
	},
}

Spell.Spell_AG_ResistHullDec =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.HULL_RESIST_ALL_DEC,
	target =
	{
		class 					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP,
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= 60,
	duration					= 5,
	
	max_stacks 					= 3,
	
	spell_on_weapon_crit_caster_timeout	= 0.5,
	
	isBuff						= false,
	
	aura_target_fx				= "particles/gadget/resist_hull_dec",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_anti_hull", },
	},
}

Spell.Spell_AG_DamageDec =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DAMAGE_DEC,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},

	
	aura_param					= 1,
	duration					= 3,
	
	max_stacks 					= 3,
	
	--apply_interval				= 30,
	--show_dispel_status			= false,
	
	spell_on_weapon_hit_caster_timeout	= 0.3,
	
	isBuff						= false,
	
	gun_spell_fx	   			= "particles/gadget/weapon_instability",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_low_damage", },
	},
}

Spell.Spell_AG_Invulnerability =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.INVULNERABILITY,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target 				= ai.SpellTarget.CASTER,
	
	duration					= 0.1,
	
	spell_on_weapon_crit_caster_timeout	= 0.5,
	
	isBuff						= true,
	
	aura_target_fx				= "particles/gadget/invulnerability",
	
--	influence_sound 			= "sound/aura/spell_AG_Invulnerability",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_anti_debuff", },
	},
}

Spell.Spell_AG_Freeze =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SLOW_MOVEMENT,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= 0.15,
	duration					= 6,
	
	max_stacks 					= 3,
	
	--apply_interval				= 30,
	--show_dispel_status			= false,
	
	spell_on_weapon_hit_caster_timeout	= 0.8,
	
	isBuff						= false,
	
	aura_target_fx				= "particles/gadget/slow_movement",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_freeze_gun", },
	},
}

Spell.Spell_AG_TimeBomb =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.FIRE_RATE_MOD,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
		misc					= ai.SpellTargetMisc.POSITION,
	},
	aura_target =
	{
		class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE  + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area 					= ai.SpellTargetArea.AROUND,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	
	aura_range					= 100,
	aura_param					= -2,
	duration					= 5,
	
	spell_on_weapon_crit_caster_timeout	= 3,
	
	isBuff						= false,
	
	cast_position_fx			= "particles/explosions/timebomb_explosion",
	aura_target_fx				= "particles/gadget/slow_movement",
	aura_start_sound			= "sound/gadgets/stealth_on",
	aura_end_sound 				= "sound/gadgets/stealth_off",
	
	aura_holder_def				= "AuraHolderEntityHackImmune",
	
	additional_auras = 
	{
		{
			aura						= ai.Aura.SLOW_MOVEMENT,
			aura_target =
			{
				class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
				area 					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY,
			},
			aura_range					= 100,
			aura_param 					= 3,
			duration					= 5,
			isBuff						= false,
			
			ui_ico =
			{
				target_system 			= { tex = "autogen_EFFECT_time_bomb", },
			},
		},
		{
			aura						= ai.Aura.SLOW_MANEUVER,
			aura_target =
			{
				class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
				area 					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY,
			},
			aura_range					= 100,
			aura_param 					= 3,
			duration					= 5,
			isBuff						= false,
			
			ui_ico =
			{
				target_system 			= { tex = "autogen_EFFECT_time_bomb", },
			},
		},
		{
			aura						= ai.Aura.REDUCE_ROT_SPEED,
			aura_target =
			{
				class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE  + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
				area 					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY,
			},
			aura_range					= 100,
			aura_param 					= 3,
			duration					= 5,
			isBuff						= false,
			
			ui_ico =
			{
				target_system 			= { tex = "autogen_EFFECT_time_bomb", },
			},
		},
	},
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_time_bomb", },
	},
}

Spell.Spell_AG_GravityBomb_Start =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SHIP_ATTRACTION,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
		misc					= ai.SpellTargetMisc.POSITION,
	},
	aura_target =
	{
		class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area 					= ai.SpellTargetArea.AROUND,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_param					= 25,
	duration					= 3,
	aura_range					= 80,
	
	--chance						= 0.12,
	
	spell_on_weapon_crit_caster_timeout	= 3,
	
	isBuff						= false,
	
	aura_fx						= "particles/gadget/huge/gravy_anomaly_hole",
	holder_sound 				= "sound/destroyer/GravyAnomaly_loop",
	nebula						= "Effects_Nebula_GravyAnomaly",
	
	aura_holder_def				= "AuraHolderEntity",
	holder_spell_in_the_end		= "Spell_AG_GravityBomb_End",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_gravity_bomb", },
	},
	
	additional_auras = 
	{
		{
			aura						= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
			aura_target =
			{
				class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
				area 					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY,
			},
			aura_range					= 15,
			aura_param 					= 100,
			duration					= 5,
			period						= 0.2,
			
			isBuff						= false,
			
			ui_ico =
			{
				target_system 			= { tex = "autogen_EFFECT_gravity_bomb", },
			},
		},
	},
}

Spell.Spell_AG_GravityBomb_End =
{
	influence					= ai.Spell.EXPLOSION,

	target =
	{
		target 					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		--misc					= ai.SpellTargetMisc.POSITION,
	},
	
	isBuff						= false,
	hud_visible 				= false,
	
	explosion_blast_wave		= "AG_GravityBomb_BlastWave",
}

Spell.Spell_AG_NuclearDeath =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DAMAGE_THERMAL_SCALED,
	
	target =
	{
		target 					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		vitality 				= ai.SpellTargetVitality.DEAD,
		misc					= ai.SpellTargetMisc.POSITION,
	},
	aura_target =
	{
		class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE  + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area 					= ai.SpellTargetArea.AROUND,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	
	aura_param					= 3000,
	aura_range					= 50,
	duration					= 10,
	period						= 1,
	
	isBuff						= false,
	
	aura_fx						= "particles/gadget/suicide_aura",
	aura_sound 					= "sound/aura/voidzone",
	nebula						= "Effects_Nebula_NukeVoidzone",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_nuclear_on_enemy_death", },
	},
}

Spell.Spell_AG_BreakWeapon =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.BROKEN_WEAPON,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= 100,
	duration					= 3,
	
	max_stacks 					= 5,
	
	spell_on_weapon_crit_caster_timeout	= 0.6,
	
	isBuff						= false,
	
	gun_spell_fx	   			= "particles/gadget/weapon_instability",
	gun_spell_fire_fx			= "particles/gadget/weaponhacker_gun_explosion",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_break_enemy_weapon", },
	},
}

Spell.Spell_AG_StopBarrelRot =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.REDUCE_ROT_SPEED,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= 100,
	duration					= 3,
	
	spell_on_weapon_crit_caster_timeout	= 0.5,
	
	isBuff						= false,
	
	gun_spell_fx	   = "particles/gadget/weapon_instability",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_stop_barrel_rotation", },
	},
}

Spell.Spell_AG_AimDeath =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.WEAPON_AUTO_AIM,
	target =
	{
		target 					= ai.SpellTargetGeneral.CASTER,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	duration					= 3,
	
	isBuff						= true,
	
	gun_spell_fx				= "particles/gadget/gun_buff",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_aim_on_kill", },
	},
}

Spell.Spell_AG_Speed =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.FAST_MOVEMENT,
	target =
	{
		target					= ai.SpellTargetGeneral.CASTER,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= 0.25,
	duration					= 3,
	
	max_stacks 					= 5,
	
	isBuff						= true,
	
	aura_target_fx 				= "particles/gadget/overdrive",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_speed_on_enemy_death", },
	},
}

Spell.Spell_AG_FireRate =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.FIRE_RATE_MOD,
	target =
	{
		target					= ai.SpellTargetGeneral.CASTER,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= 0.1,
	duration					= 3,
	
	max_stacks 					= 3,
	
	isBuff						= true,
	
	gun_spell_fx				= "particles/gadget/gun_buff",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_firerate_on_kill", },
	},
}

Spell.Spell_AG_DispersionDec =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DISPERSION_MOD,
	target =
	{
		target					= ai.SpellTargetGeneral.CASTER,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= -0.1,
	duration					= 3,
	
	max_stacks 					= 3,
	
	isBuff						= true,
	
	gun_spell_fx				= "particles/gadget/gun_buff",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_dispersion_dec_on_kill", },
	},
}

Spell.Spell_AG_Bonus_HealAll =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.HEAL_HULL_PERIODIC,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.CASTER,
	},
	aura_target 				= ai.SpellTarget.HOLDER,
	aura_param 					= 800.0,
	duration					= 3,
	period						= 1,
	isBuff						= true,
	aura_fx						= "particles/gadget/hull_heal",
	ui_ico =
	{
		target_system 	= { tex = "autogen_EFFECT_flying_heal_on_enemy_death", },
	},
	
	additional_auras = 
	{
		{
			aura						= ai.Aura.HEAL_SHIELD_PERIODIC,
			aura_target 				= ai.SpellTarget.HOLDER,
			aura_param 					= 800.0,
			duration					= 3,
			period						= 1,
			isBuff						= true,
			aura_fx						= "particles/gadget/shield_heal",
			ui_ico =
			{
				target_system = { tex = "autogen_EFFECT_flying_heal_on_enemy_death", },
			},
		}
	},
	
	aura_sound	= "sound/game/bonus_take",
}

Spell.Spell_AG_HealBonusOnKill_End =
{
	inherit						= "Spell_AG_Prototype_RocketOnKill_End",
	death_rocket				= "AG_Bonus_HealAll",
}

Spell.Spell_AG_HealBonusOnKill =
{
	inherit						= "Spell_AG_Prototype_RocketOnKill",
	target_spell				= "Spell_AG_HealBonusOnKill_End",
}

Spell.Spell_AG_Bonus_Damage =
{
	influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.DAMAGE_MOD,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.CASTER,
	},
	aura_target 				= ai.SpellTarget.HOLDER,

	aura_param 					= 0.3,
	duration					= 8,
	
	max_stacks 					= 3,

	isBuff						= true,

	ui_ico =
	{
		target_system 	= { tex = "autogen_EFFECT_flying_dmgbuff_on_enemy_death", },
	},
	
	aura_sound					= "sound/game/bonus_take",
}

Spell.Spell_AG_DamageBonusOnKill_End =
{
	inherit						= "Spell_AG_Prototype_RocketOnKill_End",
	death_rocket				= "AG_Bonus_Damage",
}

Spell.Spell_AG_DamageBonusOnKill =
{
	inherit						= "Spell_AG_Prototype_RocketOnKill",
	target_spell				= "Spell_AG_DamageBonusOnKill_End",
}

Spell.Spell_AG_Detonate =
{
	influence					= ai.Spell.DETONATE_AMMO,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	
	explosion_blast_wave		= "Blastwave_HackRocket",
	
	spell_on_weapon_crit_caster_timeout	= 0.3,
	
	isBuff						= false,
}

Spell.Spell_AG_DamageToHeal_Emp =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DAMAGE_TO_HEAL,
	target						= ai.SpellTarget.CASTER,
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= 1.1,
	duration					= 5,
	period						= 0.2,
	
	damage_type					= ai.DamageType.EMP,
	
	isBuff						= true,
	
	aura_target_fx				= "particles/gadget/hull_heal",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_heal_by_damage_emp", },
	},
}

Spell.Spell_AG_DamageToHeal_Kinetic =
{
	inherit						= "Spell_AG_DamageToHeal_Emp",
	
	damage_type					= ai.DamageType.KINETIC,
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_heal_by_damage_kinetic", },
	},
}

Spell.Spell_AG_DamageToHeal_Thermal =
{
	inherit						= "Spell_AG_DamageToHeal_Emp",
	
	damage_type					= ai.DamageType.THERMAL,
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_heal_by_damage_thermal", },
	},
}

Spell.Spell_AG_SpikeRam =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.CONTACT_DAMAGE_MOD,
	target =
	{
		target					= ai.SpellTargetGeneral.CASTER,
	},
	aura_target 				= ai.SpellTarget.HOLDER,

	
	aura_param					= 10,
	duration					= 5,
	
	isBuff						= true,
	
	aura_fx						= "particles/gadget/speed_taran",
	aura_sound 					= "sound/aura/spell_AG_SpikeRam",
	
	ui_ico =
	{
		target_system 			= { tex = "autogen_EFFECT_spike_ram", },
	},
}

Spell.Spell_AG_SetOnFire = 
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.DAMAGE_THERMAL_SCALED,
	
	target =
	{
		target							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_target 						= ai.SpellTarget.HOLDER,
		
	aura_param							= 400,
	duration							= 4,
	period 								= 1,
	
	--apply_interval						= 30,
	--show_dispel_status					= false,
	
	spell_on_weapon_hit_caster_timeout	= 0.5,

	isBuff								= false,

	period_module_fx 					= "particles/gadget/damage_thermal_fire",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_set_on_fire", },
	},
}

Spell.Spell_AG_SetOnEmpFire = 
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.DAMAGE_EMP_SCALED,
	target =
	{
		target							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_target 						= ai.SpellTarget.HOLDER,
	aura_param							= 200,
	duration							= 4,
	period 								= 0.5,
	
	--apply_interval						= 30,
	--show_dispel_status					= false,

	spell_on_weapon_hit_caster_timeout	= 0.5,

	isBuff								= false,

--	aura_sound  							= "sound/aura/spell_AG_SetOnEmpFire",
	
	period_module_fx					= "particles/gadget/damage_emp_module",
	period_module_fx_number_by_stacks	= { 5, 7, 9 },
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_set_on_emp_fire", },
	},
}

Spell.Spell_AG_Blastwave_Thermal = 
{
	influence							= ai.Spell.EXPLOSION,
	target =
	{
		target							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		--misc							= ai.SpellTargetMisc.POSITION,
	},
	
	influence_param						= 1,
	
	explosion_blast_wave				= "AG_Blastwave_Thermal",
	
	--apply_interval						= 30,
	--show_dispel_status					= false,
	
	spell_on_weapon_hit_caster_timeout	= 0.3,
}

Spell.Spell_AG_SpawnBonus_Heal = 
{
	influence							= ai.Spell.SPAWN_ENTITY,
	target =
	{
		target 							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		vitality 						= ai.SpellTargetVitality.DEAD,
		--misc							= ai.SpellTargetMisc.POSITION,
	},
	
	chance								= 0.5,
	
	spawn_def							= "AG_Bonus_HealHull",
}

Spell.Spell_AG_SpawnBonus_Speed = 
{
	influence							= ai.Spell.SPAWN_ENTITY,
	target =
	{
		target 							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		vitality 						= ai.SpellTargetVitality.DEAD,
		--misc							= ai.SpellTargetMisc.POSITION,
	},
	
	chance								= 0.5,
	
	spawn_def							= "AG_Bonus_SpeedUp",
}

Spell.Spell_AG_SpawnBonus_Damage = 
{
	influence							= ai.Spell.SPAWN_ENTITY,
	target =
	{
		target 							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		vitality 						= ai.SpellTargetVitality.DEAD,
		--misc							= ai.SpellTargetMisc.POSITION,
	},
	
	chance								= 0.5,
	
	spawn_def							= "AG_Bonus_QuadDamage",
}

Spell.Spell_AG_SameAttraction =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.SHIP_ATTRACTION,
	target =
	{
		target							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP,
		relationship 					= ai.SpellTargetRelationship.ENEMY,
		area							= ai.SpellTargetArea.AROUND,
		misc							= ai.SpellTargetMisc.REQUIRE_SAME_FRIENDLY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	
	aura_range							= 100,
	
	aura_param							= 50,
	duration							= 6,
	
	--apply_interval						= 30,
	--show_dispel_status					= false,
	
	spell_on_weapon_hit_caster_timeout	= 0.5,

	isBuff								= false,
	
	aura_sound							= "sound/aura/spell_AG_SameAttraction",
	
	work_beam_target_root_fx			= "particles/gadget/cagetrap_beam",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_same_attraction", },
	},
}

--######################## SHIELD ########################--

Spell.Spell_AG_SpikeShield =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	target =
	{
		target							= ai.SpellTargetGeneral.CASTER,
	},
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.GUIDED_DRONE ,
		relationship 					= ai.SpellTargetRelationship.ENEMY,
		area							= ai.SpellTargetArea.AROUND,
	},
	
	aura_range							= 200,
	
	aura_param							= 500,
	duration							= 2,
	period								= 0.5,

	isBuff								= false,
	
	period_fx							= "particles/gadget/pulsars/pulsar_shield_hit",
	period_my_fx						= "particles/gadget/pulsars/pulsar_shield_hit",
	period_beam_fx						= "particles/gadget/pulsars/pulsar_shield_beam",

	period_sound						=  "sound/gadgets/pulsar/pulsar_period",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_spike_shield", },
	},
}

Spell.Spell_AG_ShieldExplosion =
{
	influence							= ai.Spell.SHIELD_EXPLOSION,
	target =
	{
		class 							= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE ,
		relationship 					= ai.SpellTargetRelationship.ENEMY,
		area							= ai.SpellTargetArea.AROUND,
	},
	
	target_range						= 200,
	
	influence_param						= 1.2,
	chance								= 0.5,

	isBuff								= false,
	
	cast_fx								= "particles/explosions/explosion_huge_emp",
	cast_sound							= "sound/gadgets/ShieldExplosion",
}

Spell.Spell_AG_ShieldCollisionImmune =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.COLLISION_IMMUNE,
	target =
	{
		target							= ai.SpellTargetGeneral.CASTER,
	},
	aura_target 						= ai.SpellTarget.HOLDER,

	isBuff								= true,
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_collision_immune_shield", },
	},
}

Spell.Spell_AG_SpawnBonus_Shield = 
{
	influence							= ai.Spell.SPAWN_ENTITY,
	target =
	{
		target 							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		vitality 						= ai.SpellTargetVitality.DEAD,
	},
	
	chance								= 0.5,
	
	spawn_def							= "AG_Bonus_HealShield",
}

Spell.Spell_AG_Blackout_Shield =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.STASIS,
	target								= ai.SpellTarget.ENEMY_AROUND,
	aura_target 						= ai.SpellTarget.HOLDER,
	
	target_range						= 150,
	
	duration							= 2,

	isBuff								= false,

	diminish_control_aura				= true,
	apply_crowd_control_coef			= true,

	min_targets_count					= 1,
	
	aura_target_fx						= "particles/gadget/blackout",
	cast_fx								= "particles/gadget/blackout_burst",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_blackout_shield", },
	},
}

Spell.Spell_AG_DynamicShield =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.SHIELD_RESIST_ALL,
	target 								= ai.SpellTarget.CASTER,
	aura_target 						= ai.SpellTarget.HOLDER,
	
	aura_param							= 20,
	
	max_stacks							= 5,
	
	isBuff								= true,
	
	aura_fx								= "particles/gadget/shield_heal",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_dynamic_shield", },
	},
}

Spell.Spell_AG_ReserveShield =
{
	influence							= ai.Spell.HEAL_SHIELD,
	target 								= ai.SpellTarget.CASTER,
	
	influence_param						= 20,
	
	isBuff								= true,
	
	aura_fx								= "particles/gadget/shield_boost",
}

Spell.Spell_AG_GhostShield =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.UNTOUCHABLE,
	target 								= ai.SpellTarget.CASTER,
	aura_target 						= ai.SpellTarget.HOLDER,
	
	duration							= 3,
	
	isBuff								= true,
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_ghost_shield", },
	},
}	

Spell.Spell_AG_ShieldVampire =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
	aura_target =
	{
		class 							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		area 							= ai.SpellTargetArea.AROUND,
		misc							= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	
	aura_param							= 500,
	aura_range							= 120,
	
	period 								= 1,
	
	isBuff								= false,

	period_beam_root_fx					= "particles/gadget/pulsars/shield_beam_periodic",
	
	ui_ico =
	{
		target_system					= { tex = "autogen_EFFECT_shield_vampire", },
	},
}

Spell.Spell_AG_DefenderShield =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.SHIELD_RESIST_ALL,
	target 								= ai.SpellTarget.CASTER,
	aura_target 						= ai.SpellTarget.HOLDER,
	
	aura_param							= 20,
	
	max_stacks							= 5,
	
	isBuff								= true,
	
	aura_fx								= "particles/gadget/shield_heal",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_defender_shield", },
	},
}

Spell.Spell_AG_TurtleShield =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.SHIELD_RESIST_ALL_DEC,
	target								= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target 						= ai.SpellTarget.CASTER,
	
	aura_param							= 20,
	
	isBuff								= false,
	ignore_additional_power				= true,
	gameplay_specific					= true,
	
	--aura_holder_offset					= Vec3( 0, 0, -20 ),
	aura_holder_offset_from_bound		= Vec3( 0, 0, -6 ),
	aura_holder_attach_bone				= "root",
	
	aura_holder_def						= "AG_Shield_Turtle",
	
	aura_start_sound			= "sound/destroyer/SShield_activate",
	aura_end_sound 				= "sound/destroyer/SShield_off",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_turtle_shield", },
	},
}

Spell.Spell_AG_SlowShield =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.SHIELD_RESIST_ALL,
	target								= ai.SpellTarget.CASTER,
	aura_target 						= ai.SpellTarget.HOLDER,
	
	aura_param							= 10,
	
	max_stacks							= 5,
	
	isBuff								= true,
	
	aura_fx								= "particles/gadget/shield_heal",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_slow_shield", },
	},
}

Spell.Spell_AG_ShieldBlast =
{
	influence							= ai.Spell.EXPLOSION,
	target								= ai.SpellTarget.CASTER,
	
	influence_param						= 2,
	
	isBuff								= true,
	
	explosion_blast_wave 				= "AG_Shield_BlastWave",
}

Spell.Spell_AG_SecondShield =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.DAMAGE_MOD,
	target								= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target 						= ai.SpellTarget.CASTER,
	
	aura_param							= 1,
	
	duration							= 10,
	
	isBuff								= true,
	
	aura_holder_attach_bone				= "root",
	
	aura_holder_def						= "AG_Second_Shield",
	
	additional_auras =
	{
		{
			aura						= ai.Aura.REDUCE_MAX_SPEED,
			aura_target 				= ai.SpellTarget.CASTER,
			
			aura_param					= 0.75,
			
			duration					= 10,
			
			isBuff						= false,
			gameplay_specific			= true,
			
			hud_visible 				= false,
		},
	},
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_second_shield", },
	},
}

Spell.Spell_AG_EnergyShield =
{
	influence							= ai.Spell.APPLY_AURA,
	aura 								= ai.Aura.ENERGY_SHIELD,
	target								= ai.SpellTarget.CASTER,
	aura_target 						= ai.SpellTarget.HOLDER,
	
	aura_param							= 8,
	
	duration							= 60,
	
	isBuff								= true,
	
	aura_fx								= "particles/gadget/energy_shield",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_energy_shield", },
	},
}

Spell.Spell_AG_SwapShield =
{
	influence							= ai.Spell.TELEPORT_SWAP,
	target =
	{
		{
			target 						= ai.SpellTargetGeneral.LOCKED_TARGET,
			class 						= ai.SpellTargetClass.SHIP,
			relationship 				= ai.SpellTargetRelationship.ENEMY,
		},
		{
			target 						= ai.SpellTargetGeneral.CASTER,
			class 						= ai.SpellTargetClass.SHIP,
		},
	},
	
	isBuff								= false,
	
	min_targets_count					= 2,
	
	out_fx 								= "particles/gadget/teleport",
	out_sound							= "sound/el_modules/EmergencyTeleporter_in",
	
	ui_ico =
	{
		target_system 					= { tex = "autogen_EFFECT_swap_shield", },
	},
}
--[[
Spell.Spell_AG_SlowShield =
{
	influence							= ai.Spell.APPLY_SHELL,
	target								= ai.SpellTarget.CASTER,
	
	influence_param						= 5000,
	
	isBuff								= true,
	
	shell_def 							= "AG_Slow_Shield",
}
]]