Spell.Bonus_Radar =
{
	aura			= ai.Aura.VISION_RADIUS_MOD,
	aura_param 		= 3,
	duration		= 60.0,
	--aura_fx		= "particles/gadget/shield_cicle",
	cast_fx			= "particles/gadget/aura_wave",
	isBuff			= true,
	gameplay_specific = true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 5000,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ScoutScanner", },
	},
}

Spell.Bonus_Invulnerability =
{
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 7.0,
	--aura_fx			= "particles/gadget/shield_cicle",
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,	
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},
}

Spell.Bonus_DM_Invulnerability =
{
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 15.0,
	--aura_fx			= "particles/gadget/shield_cicle",
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,	
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},
}



Spell.Bonus_QuadDamage =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.5,
	duration		= 13.0,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "sentinel_ico", },
	},
}

Spell.OpenWorld_Bonus_QuadDamage =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.5,
	duration		= 30.0,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "sentinel_ico", },
	},
}

Spell.Bonus_DM_QuadDamage =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 4,
	duration		= 15.0,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "sentinel_ico", },
	},
}

Spell.Bonus_QuadDamage_Levi =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 1000,
	duration		= 90.0,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.HOLDER,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ow_Precursor_Deflector_ico", }, --sentinel_ico --ow_Precursor_Neurocontroller_ico
	},
}

Spell.Bonus_Stealth_PVE_Cast =
{
	influence = ai.Spell.CAST_SPELLS,
	spells = {'Bonus_Stealth_PVE', },
	target 			= ai.SpellTarget.ALLY_SHIPS_AROUND,
	target_range 	= 12000,
}

Spell.Bonus_Stealth_PVE =
{
	aura			= ai.Aura.STEALTH,
	duration		= 20.0,
	isBuff			= true,
	dispell_flag 	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_CAPTURE,
	target 			= ai.SpellTargetGeneral.HOLDER,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_Shift", },
	},
}

Spell.Bonus_Stealth_Levi =
{
	aura			= ai.Aura.STEALTH,
	duration		= 120.0,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.HOLDER,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_Shift", },
	},
}

Spell.Bonus_HealHull = 
{
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param 		= 3000.0,
	duration		= 3,
	period			= 1,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
} 

Spell.Bonus_HealShield = 
{
	aura			= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	aura_param 		= 3000.0,
	duration		= 3,
	period			= 1,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_ShieldEmitter", },
	},
} 

Spell.OpenWorld_Bonus_HealHull = 
{
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param 		= 5000.0,
	duration		= 5,
	period			= 1,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
} 

Spell.Bonus_DM_HealHull = 
{
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param 		= 10000.0,
	duration		= 5,
	period			= 1,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
}


Spell.Bonus_SpeedUp = 
{
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 0.5,
	duration        = 45,
	--period        		= 1,
	isBuff			= true,
	aura_target 	= 
	{
		area = ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ALLY,
		class = ai.SpellTargetClass.SHIP,
	},
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Afterburner", },
	},
}

Spell.Bonus_DM_SpeedUp = 
{
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 0.75,
	duration        = 45,
	--period        		= 1,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Afterburner", },
	},
}




-- следующие 4 спелла для тестовой карты openworld_pvp_test
Spell.Bonus_SmallHealHull = 
{
	influence		= ai.Spell.HEAL_HULL,
	target			= ai.SpellTarget.CASTER,
		duration        = 1,
	influence_param = 4000.0,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico = { },
}

Spell.Bonus_FastSpeedUp = 
{
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 0.5,
	duration        = 10,
	--period        	= 1,
	isBuff			= true,

	cast_fx			= "particles/gadget/aura_wave",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Afterburner", },
	},
}

Spell.Bonus_SmallQuadDamage =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 1.0,
	duration		= 20.0,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "sentinel_ico", },
	},
}

Spell.Bonus_FastInvulnerability =
{
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 10.0,
	--aura_fx		= "particles/gadget/shield_cicle",
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},
}

Spell.ClanShip_QuadDamage =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.5,
	--duration		= 13.0,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.HOLDER,
	clan_ship_death_points_mod	= 20,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "sentinel_ico", },
	},
}

Spell.Bonus_GreenEngineerScrapMult = 
{
	influence = ai.Spell.CAST_SPELLS,
	spells= { 'Bonus_GreenEngineerScrapSpeedBoost', 'Bonus_GreenEngineerScrap' }
}

Spell.Bonus_GreenEngineerScrapSpeedBoost = 
{
	target 			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 0.1,
	duration		= 10,
	isBuff = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MovementDamageBuff", },
	},
	additional_auras = 
	{
		{
			target 			= ai.SpellTarget.CASTER,
			aura			= ai.Aura.FAST_MANEUVER,
			aura_param 		= 0.3,
			duration		= 10,
			isBuff = true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_MovementDamageBuff", },
			},
		}
	},
	influence_beam_fx = "particles/gadget/scrap_beam",
}

Spell.Bonus_GreenEngineerScrap = 
{
	influence			= ai.Spell.ADD_SPECIAL_AMMO,
	influence_param 	= 1,
	isBuff				= true,
	target 				= ai.SpellTarget.CASTER, --?
	cast_fx				= "particles/other/alien_engeneer_parts_take",
	influence_sound		= "sound/game/bonus_take",
}