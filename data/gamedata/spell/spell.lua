sys.execscript( 'gamedata/def/ex/rockets_spell.lua' )
sys.execscript( 'gamedata/def/ex/active_spell.lua' )
sys.execscript( 'gamedata/def/ex/active_spell2.lua' )
sys.execscript( 'gamedata/def/ex/active_spell3.lua' )
sys.execscript( 'gamedata/def/ex/special_spell.lua' )
sys.execscript( 'gamedata/def/ex/special_spell2.lua' )
sys.execscript( 'gamedata/def/ex/special_blastwave.lua' )
sys.execscript( 'gamedata/spell/spell_pve.lua' )
sys.execscript( 'gamedata/spell/spell_talents.lua' )
sys.execscript( 'gamedata/spell/spell_bonus.lua' )
sys.execscript( 'gamedata/spell/spell_autogen.lua' )


Spell.Test =
{
	aura			= ai.Aura.SLOW_MOVEMENT,
	target			= ai.SpellTarget.LOCKED_TARGET,
	aura_param 		= 0.2,
	duration		= 6.0,
	max_stacks 		= 5,
	--cast_fx			= "particles/gadget/aura_wave",
	ui_ico =
	{
		tex = "flag_carrier_ico",
	},
}

Spell.Spell_Null =
{
}

---#66077
Spell.TDM_Damage_X3 =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 3,
	duration		= 15*60,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	aura_range 		= 5000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "sentinel_ico", },
	},
}

---#65691
Spell.ClanShip_AntiRadar =
{
	aura			= ai.Aura.VISION_RADIUS_MOD,
	aura_param 		= -2,	---#67264 -3 много (ещё немного разжал радары)
	duration		= 15*60,	-- по длительности боя надо будет корректировать
	isBuff			= false,
	gameplay_specific = true,
	aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	aura_range 		= 5000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_ScoutScanner", },
	},

	additional_auras =	-- урон издалека уменьшен, чтобы не фокусили особо и двигались
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.SHIPS_AROUND,
			aura			= ai.Aura.DAMAGE_REDUCE_WITH_DISTANCE,
			aura_param 		= 1000, -- добавил дальности с 8 км будет только четверть урона, с 2км будет полный урон, с 6 - половина.
			aura_range 		= 5000,
			duration		= 15*60,	-- по длительности боя надо будет корректировать
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_FocusedDefence", },
			},
		},
		
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.SHIPS_AROUND,
			aura			= ai.Aura.SNIPER_OVERLOAD,	-- вернул стайперам былую силу
			aura_param		= 0.25,		-- убавил, а то как-то им походу слишком хорошо, и щеё убавил, и ещё.
			aura_range 		= 5000,
			duration		= 15*60,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_AchillesTargetingUnit", },
			},
		},

		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.SHIPS_AROUND,
			aura			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,	-- уменьшаю всем дальность стрельбы
			aura_param		= -0.33,
			aura_range 		= 5000,
			duration		= 15*60,
			isBuff			= false,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_BlackoutGenerator", },
			},
		}
	},
}

Spell.PvE_Stealth_Antiradar = 
{
	aura = ai.Aura.CAST_SPELL_PERIODIC,
	target_spell = "PvE_Stealth_Antiradar_cast",
	duration = 3,
	period = 3,
	isBuff = true,
	hud_visible = false,
	--gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Blind", },
	},
}
Spell.PvE_Stealth_Antiradar_cast =
{
	aura_target		= ai.SpellTarget.SHIPS_EVERYWHERE,
	aura 			= ai.Aura.VISION_RADIUS_MOD,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	aura_param 		= -9,
	isBuff			= false,
	--gameplay_specific = true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_Blind", }, },
	additional_auras =
	{
		{
			isBuff			= false,
			--diminish_control_aura = true, -- если вставить, то диминишинг от материнской ауры уже есть и общий диминишинг копится оч быстро
			aura_target		= ai.SpellTarget.SHIPS_EVERYWHERE,
			aura			= ai.Aura.DISABLE_RECEIVE_RADAR_INFO,
			--gameplay_specific = true,
			ui_ico 			= { target_system = { tex = "ItemSubtype_Blind", }, },
		}
	}
}

---#SC-113964
Spell.Portals_AntiFrigat =
{
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param 		= 0.2,
	isBuff			= false,
	gameplay_specific = true,
	--hud_visible 	= false,
	aura_target =
	{
		class 					= ai.SpellTargetClass.SHIP,
		--signature				= ai.SignatureMask.LARGE,
		ship_role				= ai.ShipRoleMask.GUARD,
	},
	
	ui_ico =
	{
		target_system = { tex = "shipRoles_GUARD_filter_select", },
	},

	additional_auras =	-- и резисты ещё снять
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura			= ai.Aura.RESIST_ALL_DEC,
			aura_target =
			{
				class 					= ai.SpellTargetClass.SHIP,
				--signature				= ai.SignatureMask.LARGE,
				ship_role				= ai.ShipRoleMask.GUARD,
			},
			aura_param 		= 20,
			isBuff			= false,
			gameplay_specific = true,
			--hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "shipRoles_GUARD_filter_select", },
			},
		},
	},
}

Spell.OW_BR_AntiRadar =
{
	aura			= ai.Aura.VISION_RADIUS_MOD,
	aura_param 		= -200,	---#67264 -3 много
	duration		= 15*60,	-- по длительности боя надо будет корректировать
	isBuff			= false,
	gameplay_specific = true,
	aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	aura_range 		= 5000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_ScoutScanner", },
	},
}

--#63623
--[[ Def.SentinelInvulStubEntity =
{
	class 			= "AuraHolderEntity",
	in_editor		= true,
	uiName			= "SentinelInvulStubEntity",
} ]]


Spell.Spell_ClanShipCrit =
{
	aura_target		= {
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		},
	aura			= ai.Aura.CRIT_CHANCE,
	isBuff			= true,
	aura_param		= 0.1,
	aura_range		= 1000,
	ui_ico =
	{
		target_system 	= { tex = "clanship_part_ClanShip_CritAura_ico", },
	},
}


Spell.Spell_ClanShipMarinos =
{
	influence		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.NONE,
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	gameplay_specific = true,
	ignore_stacks	= true,

	ui_ico =
	{
		target_system = { tex = "flag_carrier_ico", },
	},
}

Spell.Damage_TDM  =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		=
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 10000,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.2,
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
}

Spell.Resist_TDM  =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		=
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 10000,
	aura			= ai.Aura.RESIST_ALL,
	aura_param 		= 25,
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_AdaptiveShieldBoost", },
	},
}

Spell.Regen_TDM =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		=
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 10000,
	aura			= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	aura_param 		= 30,
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_ShieldEmitter", },
	},
	additional_auras =
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ALLY,
			},
			aura_range		= 10000,
			aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
			aura_param 		= 30,
			isBuff			= true,
			gameplay_specific = true,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_RemoteRepairDrones", },
			},
		},
	},
}

Spell.SpawnWarpInvulnerability =
{
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 10.0,
	--aura_fx		= "particles/gadget/shield_cicle",
	isBuff			= true,
	gameplay_specific = true,
	dispell_flag	= ai.Dispell.ON_MODULE, --ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET +     -- Для более активного сопротивления фарму респа
	ui_ico =
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},
}


Spell.SpawnInvulnerabilityFreeSpace =
{
	aura			= ai.Aura.INVULNERABILITY,
	--делаем неуязвимость не диспелищуюся, как борьбу с ганком.
	--dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_MOVE,
	duration		= 10.0,
	--aura_fx		= "particles/gadget/shield_cicle",
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},
}


Spell.JumpDockInvulnerabilityFreeSpace =
{
	aura			= ai.Aura.FORTIFICATION,
	duration		= 30.0,
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},
}

Spell.SpawnWarpInvulnerability_NPC =
{
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 2,
	--aura_fx		= "particles/gadget/shield_cicle",
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},
}

Spell.RankBuffBase =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param 		= 10,
	isBuff			= true,
	gameplay_specific = true,
	hud_visible 	= false,
	ui_ico =
	{
		target_system = { tex = "gameplay_Buff", },
	},
	additional_auras =
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.DAMAGE_MOD,
			aura_param 		= 0.1,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.SECONDARY_DAMAGE_MOD,
			aura_param 		= 0.1,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.MODULE_DAMAGE_MOD,
			aura_param 		= 0.1,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
--[[ 		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MANEUVER,
			aura_param 		= 0.0,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		}, ]]
	},
}
Spell.RankBuffBase0 =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param 		= 10,
	isBuff			= true,
	gameplay_specific = true,
	hud_visible 	= false,
	ui_ico =
	{
		target_system = { tex = "gameplay_Buff", },
	},
}

Spell.BuffNearDeath_big =
{
	influence		= ai.Spell.APPLY_AURA,
	target =
	{
		target 	= ai.SpellTargetGeneral.CASTER,
		ai 		= ai.SpellTargetAi.PLAYERS,
	},
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param 		= 75,
	duration		= 12,
	isBuff			= true,
	gameplay_specific = true,
	hud_visible 	= false,
	ui_ico =
	{
		target_system = { tex = "gameplay_Buff", },
	},
	additional_auras =
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.CRIT_CHANCE,
			aura_param 		= 0.75,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			duration		= 12,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.SECONDARY_DAMAGE_MOD,
			aura_param 		= 0.15,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			duration		= 12,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.MODULE_DAMAGE_MOD,
			aura_param 		= 0.15,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			duration		= 12,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
	},
}

Spell.PVETestBuff =  -- типа тестить "в одного" "за четверых"
{
	inherit = "RankBuffBase",
	aura_param = 450,  --RESIST_ALL 
	additional_auras={
		{
			aura_param=2.5, -- DAMAGE_MOD
		},
		{
			aura_param=2, -- SECONDARY_DAMAGE_MOD
		},
		{
			aura_param=2.5, -- MODULE_DAMAGE_MOD
		},
	},
}
Spell.PVETestBuff2 =
{
	aura			= ai.Aura.VISION_RADIUS_MOD,
	aura_param 		= 3,
	hud_visible 	= false,
	ui_ico =
	{
		target_system = { tex = "gameplay_Buff", },
	},
}

-- особый баф для бесконечного ПвЕ. Прописан в unlim_pve.lua
Spell.UnlimPveDamage =
{
	influence = ai.Spell.APPLY_AURA,
	aura_target = ai.SpellTarget.HOLDER,
	aura = ai.Aura.DAMAGE_MOD,
	aura_param = 1,
	isBuff = true,
	gameplay_specific = true,
	hud_visible = true,
	ui_ico =
	{
		target_system = { tex = "buff_UnlimPveDamage", },
	},
	additional_auras =
	{
		{
			influence = ai.Spell.APPLY_AURA,
			aura_target = ai.SpellTarget.HOLDER,
			aura = ai.Aura.SECONDARY_DAMAGE_MOD,
			aura_param = 1,
			isBuff = true,
			gameplay_specific = true,
			hud_visible = false,
		},
		{
			influence = ai.Spell.APPLY_AURA,
			aura_target = ai.SpellTarget.HOLDER,
			aura = ai.Aura.MODULE_DAMAGE_MOD,
			aura_param = 1,
			isBuff = true,
			gameplay_specific = true,
			hud_visible = false,
		},
	},
}

-- особый баф для бесконечного ПвЕ. Прописан в unlim_pve.lua
Spell.UnlimPveHeal =
{
	influence = ai.Spell.APPLY_AURA,
	aura_target = ai.SpellTarget.HOLDER,
	aura = ai.Aura.MODIFY_OUTPUT_HEAL,
	aura_param = 1,
	isBuff = true,
	gameplay_specific = true,
	hud_visible = false,
}

Spell.TestKPMNormalizer =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param 		= 10,
	isBuff			= true,
	gameplay_specific = true,
	hud_visible 	= false,
	ui_ico =
	{
		target_system = { tex = "gameplay_Buff", },
	},
	additional_auras =
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.DAMAGE_MOD,
			aura_param 		= 0.1,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.SECONDARY_DAMAGE_MOD,
			aura_param 		= 0.1,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.MODULE_DAMAGE_MOD,
			aura_param 		= 0.1,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
	},
}


Spell.GodGift =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param 		= 40,
	isBuff			= true,
	gameplay_specific = true,
	hud_visible 	= false,
	ui_ico =
	{
		target_system = { tex = "gameplay_Buff", },
	},
	additional_auras =
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.DAMAGE_MOD,
			aura_param 		= 0.2,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.SECONDARY_DAMAGE_MOD,
			aura_param 		= 0.2,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.MODULE_DAMAGE_MOD,
			aura_param 		= 0.2,
			isBuff			= true,
			gameplay_specific = true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system = { tex = "gameplay_Buff", },
			},
		},
	},
}


Spell.Sentinel =
{
	--aura			= ai.Aura.RESIST_ALL,
	--aura_param 		= 75,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.75,
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "sentinel_ico", },
	},
}

--#63623
--[[ Spell.SentinelInvul =
{
	aura			= ai.Aura.NONE,

	target 			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	aura_range 		= 5000,
	duration		= 180, --120 увеличили из-за увеличения продолжительности join-in-progress с двух минут до трех

	isBuff			= true,
	gameplay_specific = true,
	--dispell_flag      	=  ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	ui_ico =
	{
		target_system 	= { tex = "sentinel_ico", },
	},
} ]]

Spell.FlagCarrier =
{
	isBuff = false,
	aura = ai.Aura.SLOW_MOVEMENT,
	aura_fx	= "particles/test/continuous_2",
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "flag_carrier_ico", },
	},
}


Spell.BombCarrier =
{
	isBuff = false,
	aura = ai.Aura.SLOW_MOVEMENT,
	target = ai.SpellTarget.CASTER,
	aura_param = 0.3,
	gameplay_specific = true,
	--aura_fx	= "particles/test/continuous_2",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Suicide", },
	},
}



Spell.MicroWarpDisableLock =
{
	aura			= ai.Aura.DISABLE_LOCK,
	target			= ai.SpellTarget.ENEMY_AROUND,
	target_range	= 250,
	duration		= 6.0,
	apply_crowd_control_coef = true,
	aura_fx			= "particles/gadget/lightnings_debuff",
	ui_ico =
	{
		target_system 	= { tex = "microwarp_disable_lock_ico", },
	},
}

Spell.PhaseShield_Speed =
{
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 0.35,
	duration		= 15,
	period			= 1,
	aura_param_add	= -0.023, --0,035
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
	},
}

Spell.PhaseShield_Phase0 =
{
	aura			= ai.Aura.SHIELD_RESIST_THERMAL,
	isBuff			= true,
	aura_param		= 120,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield", },
	},
	additional_auras =
	{
		Spell.PhaseShield_Speed,
	},
}

Spell.PhaseShield_Phase1 =
{
	aura			= ai.Aura.SHIELD_RESIST_EMP,
	isBuff			= true,
	aura_param		= 120,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Phase1", },
	},
	additional_auras =
	{
		Spell.PhaseShield_Speed,
	},
}



Spell.PhaseShield_Phase2 =
{
	aura			= ai.Aura.SHIELD_RESIST_KINETIC,
	isBuff			= true,
	aura_param		= 120,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Phase2", },
	},
	additional_auras =
	{
		Spell.PhaseShield_Speed,
	},
}

-- ослабленные щиты, но с дополнительным функционалом
Spell.PhaseShield_Phase0_ =
{
	aura			= ai.Aura.SHIELD_RESIST_THERMAL,
	isBuff			= true,
	aura_param		= 180,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield", },
	},
	additional_auras =
	{
		Spell.PhaseShield_Speed,
	},
}



Spell.PhaseShield_Phase1_ =
{
	aura			= ai.Aura.SHIELD_RESIST_EMP,
	isBuff			= true,
	aura_param		= 180,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Phase1", },
	},
	additional_auras =
	{
		Spell.PhaseShield_Speed,
	},
}



Spell.PhaseShield_Phase2_ =
{
	aura			= ai.Aura.SHIELD_RESIST_KINETIC,
	isBuff			= true,
	aura_param		= 180,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Phase2", },
	},
	additional_auras =
	{
		Spell.PhaseShield_Speed,
	},
}




Spell.PhaseShield_Raid_Buff =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.05,
	duration		= 5,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Raid_Buff", },
	},
}


Spell.PhaseShield_Tank_Buff =
{
	inherit 			= "PhaseShield_Raid_Buff",
	aura_param			= 0.15,
}

Spell.PhaseShield_Energy_Buff =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.ADD_ENERGY,
	influence_param = 110, --35
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Raid_Buff", },
	},
	aura_fx = "particles/gadget/add_energy",
}

Spell.GuardHeal =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	aura_param			= 200,
	isBuff				= true,
	aura 				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_target 		= ai.SpellTarget.HOLDER,
	dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_DAMAGE,
	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_CrystallRegen", },
		target_system 	= { tex = "ItemSubtype_AutoRepairUnit", },
	},
}



Spell.TimeBoost_Faction1 = {
	duration 	= Spell.TimeBoost_T5_Faction1.duration,
	target		= ai.SpellTarget.CASTER,
	aura_target	= ai.SpellTarget.HOLDER,
	aura		= ai.Aura.RESIST_ALL,
	aura_param	= 50,
	isBuff		= true,
	ui_ico 		= Spell.TimeBoost_T5_Faction1.ui_ico,
}

--[[   не нашел где используются
 Spell.Disintegrator_Faction1_1 = {
	duration			= 3,
	target				= ai.SpellTarget.LOCKED_TARGET,
	aura				= ai.Aura.BURN_ENERGY_PERIODIC,
	isBuff				= false,
	aura_param			= 78.8888889,
	scale_on_weapon		= true,
	uiName				= "Disintegrator_Faction1",
	uiDesc				= "Disintegrator_Faction1_Desc",
	aura_target_fx = "particles/gadget/burn_energy",
	}
Spell.Disintegrator_Faction1_2 =
	{
			target					= ai.SpellTarget.LOCKED_TARGET,
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 10,
			scale_on_weapon			= true,
			duration				= 200,   --2 200 чтобы тестить
 			--aura_signature			= ai.SignatureMask.LARGE,
	}
Spell.Disintegrator_Faction1_3 =
		{
			target					= ai.SpellTarget.LOCKED_TARGET,
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 100,
			scale_on_weapon			= true,
			duration				= 200,   --2 200 чтобы тестить
			--aura_signature			= ai.SignatureMask.HUGE, --	HUGE
	}
]]
Spell.Disintegrator_T1_L =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.LARGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 200,
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.LARGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}
Spell.Disintegrator_T1_H =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.HUGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 4200,  -- 5600 база + это *2   .   делаем что суммарный урон по эсму х2.5 (5600*1.5/2) = 
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.HUGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}
Spell.Disintegrator_T2_L =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.LARGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 325,
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.LARGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}
Spell.Disintegrator_T2_H =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.HUGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 6350*1.5, --*0.75, --
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.HUGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}
Spell.Disintegrator_T3_L =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.LARGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 500,
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.LARGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}
Spell.Disintegrator_T3_H =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.HUGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 7100*1.5, --*0.75,  --7100
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.HUGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}
Spell.Disintegrator_T4_L =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.LARGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 625,
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.LARGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}
Spell.Disintegrator_T4_H =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.HUGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 8620*1.5, --*0.75,
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.HUGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}
Spell.Disintegrator_T5_L =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.LARGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 750,
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.LARGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}
Spell.Disintegrator_T5_H =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.HUGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 9900*1.5, --*0.75, 
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.HUGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}

	
Spell.GuidedMissile_={
			duration		= 10,
			target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
			aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
			aura_target		= ai.SpellTarget.ENEMY_AROUND,
			period			= 1,
			isBuff			= false,
			aura_param		= 400,
			aura_range		= 27,
			ignore_stacks	= true,
			ignore_subtype	= true,
 			ui_ico = { target_system 	= { tex = "ItemSubtype_GuidedMissile", }, },
			uiName			= "Special_PhaseShield_Faction1",
			uiDesc			= "Special_PhaseShield_Faction1_Desc",
	additional_auras =
	{
		{
			aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC, --аура дамага термического
			--aura_target		= ai.SpellTarget.ENEMY_AROUND,
			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				signature		= ai.SignatureMask.HUGE,
			},
			aura_param 		= 1110, --кол-во дамага раз в period
			period 			= 1, --период между тиками дамага
			aura_range 		= 27, -- радиус, на котором аура наносит дамаг
			isBuff 			= false, --дебафф
			duration 		= 10, --продолжительность ауры
			ui_ico = { target_system = { tex = "ItemSubtype_GuidedMissile", }, },
		},
	},
}

Spell.Mauler_GuidedMissile  ={
			duration		= 10,
			target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
			aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
			aura_target		= ai.SpellTarget.ENEMY_AROUND,
			period			= 0.5,
			isBuff			= false,
			aura_param		= 250,
			aura_range		= 40,
			ignore_stacks	= true,
			ignore_subtype	= true,
			
			
			aura_fx		= "particles/gadget/suicide_aura",
			
 		
			uiName			= "Special_PhaseShield_Faction1",
			uiDesc			= "Special_PhaseShield_Faction1_Desc",
			ui_ico = { target_system = { tex = "ItemSubtype_Mauler_GuidedMissile", }, },
	additional_auras =
	{
		{
			aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC, --аура дамага термического
			--aura_target		= ai.SpellTarget.ENEMY_AROUND,
			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				signature		= ai.SignatureMask.HUGE,
			},
			aura_param 		= 555, --кол-во дамага раз в period
			period 			= 0.5, --период между тиками дамага
			aura_range 		= 40, -- радиус, на котором аура наносит дамаг
			isBuff 			= false, --дебафф
			duration 		= 10, --продолжительность ауры
			
			ui_ico = { target_system = { tex = "ItemSubtype_Mauler_GuidedMissile", }, },
		},
	},
}

Spell.Spell_Exorxist_GuidedMissile =
{
	
	target 			= 	ai.SpellTarget.INFLICTOR,
	
	aura_target 	= 	{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
						vitality		=ai.SpellTargetVitality.ALIVE,
						},
						
	aura 			= ai.Aura.SPY_DRONE,
	aura_range		= 300,

	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ExorcistSpecial", },
	},
}

Spell.BlackoutGenerator =
{
	aura			= ai.Aura.FORTIFICATION,
	duration		= 6,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BlackoutGenerator", },
	},
}

Spell.BlackoutGeneratorGapCloser =
{
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 2.5,
	aura_execution_delay = Spell.BlackoutGenerator.duration,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BlackoutGenerator", },
	},
	ignore_stacks	= true,
	ignore_subtype	= true,
}

Spell.BlackoutGeneratorInvulnerability =
{
	influence 		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.INVULNERABILITY,
	--aura			= ai.Aura.EMERGENCY_BARRIER,
	duration		= 0.5,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BlackoutGenerator", },
	},
}

Spell.BlackoutGenerator_Stun_AndInvul =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'BlackoutGenerator_Stun', 'BlackoutGeneratorInvulnerability' }
}

Spell.BlackoutGenerator_Stun_Faction1_AndInvul =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'BlackoutGenerator_Stun_Faction1', 'BlackoutGeneratorInvulnerability' }
}

Spell.BlackoutGenerator_Stun_Faction2_AndInvul =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'BlackoutGenerator_Stun_Faction2', 'BlackoutGeneratorInvulnerability' }
}

Spell.BlackoutGenerator_Stun =
{
	target			= ai.SpellTarget.ENEMY_AROUND,
	target_range	= 150,
	aura			= ai.Aura.STASIS,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration		= 2,
	isBuff			= false,
	min_targets_count	= 1, -- SC-89106 СТ. Спецмодуль Mjolnir Форсирование систем кораблей Варденов не сбрасывает эффект от спецмодуля РЭБа
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BlackoutGenerator", },
	},

}

Spell.GrimBlackoutGenerator =
{
	aura			= ai.Aura.FORTIFICATION,
	-- aura			= ai.Aura.SLOW_MANEUVER,
	duration		= 6,
	isBuff			= true,
	aura_fx			= "particles/gadget/blackout",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BlackoutGenerator", },
	},
}

Spell.GrimBlackoutGenerator_Stun_AndInvul =
{
	influence	= ai.Spell.CAST_SPELLS,
	spells		= { 'GrimBLG', 'BlackoutGeneratorInvulnerability' },
}

Spell.GrimBLG =
{
	target 		=
				{
				area 		= ai.SpellTargetArea.AROUND,
				class		= ai.SpellTargetClass.SHIP,
				relationship= ai.SpellTargetRelationship.ENEMY,
				},
	aura		= ai.Aura.FORCE_BOOST,
	target_range= 200,
	duration	= 6,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	--duration		= 6,
	isBuff			= false,
	start_diminishing_timer	= false,
		ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GrimBlackoutGenerator", },
	},
	
	additional_auras =
	{
		{ 
			target			= {
						--target			= ai.SpellTarget.ENEMY,
						area 			= ai.SpellTargetArea.AROUND,
						class 			= ai.SpellTargetClass.SHIP,
						relationship 	= ai.SpellTargetRelationship.ENEMY,
							},
			target_range	= 150,
			aura			= ai.Aura.SLOW_MANEUVER,
			aura_param		= 2,
			diminish_control_aura = true,
			apply_crowd_control_coef = true,
			duration		= 6,
			isBuff			= false,
			min_targets_count	= 1, -- SC-89106 СТ. Спецмодуль Mjolnir Форсирование систем кораблей Варденов не сбрасывает эффект от спецмодуля РЭБа
			start_diminishing_timer	= false,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_GrimBlackoutGenerator", },
			},
		},
		{
			target			= {
						--target			= ai.SpellTarget.ENEMY,
						area 			= ai.SpellTargetArea.AROUND,
						class 			= ai.SpellTargetClass.SHIP,
						relationship 	= ai.SpellTargetRelationship.ENEMY,
							},
			target_range	= 150,
			aura			= ai.Aura.FAST_MOVEMENT,
			aura_param		= 2,
			diminish_control_aura = true,
			apply_crowd_control_coef = true,
			duration		= 6,
			isBuff			= false,
			min_targets_count	= 1, -- SC-89106 СТ. Спецмодуль Mjolnir Форсирование систем кораблей Варденов не сбрасывает эффект от спецмодуля РЭБа
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_GrimBlackoutGenerator", },
			},
		},
	},

}

Spell.BlackoutGenerator_Grim =
{
	target			= {

						area 			= ai.SpellTargetArea.AROUND,
						class 			= ai.SpellTargetClass.SHIP,
						relationship 	= ai.SpellTargetRelationship.ENEMY,
					  },
	target_range	= 150,
	aura			= ai.Aura.FORCE_BOOST,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration		= 6,
	isBuff			= false,
	start_diminishing_timer	= false,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GrimBlackoutGenerator", },
	},
	
	-- additional_auras =
	-- {
		-- { 
			-- target			= {
						-- --target			= ai.SpellTarget.ENEMY,
						-- area 			= ai.SpellTargetArea.AROUND,
						-- class 			= ai.SpellTargetClass.SHIP,
						-- relationship 	= ai.SpellTargetRelationship.ENEMY,
							-- },
			-- target_range	= 150,
			-- aura			= ai.Aura.SLOW_MANEUVER,
			-- aura_param		= 2,
			-- diminish_control_aura = true,
			-- apply_crowd_control_coef = true,
			-- duration		= 6,
			-- isBuff			= false,
			-- min_targets_count	= 1, -- SC-89106 СТ. Спецмодуль Mjolnir Форсирование систем кораблей Варденов не сбрасывает эффект от спецмодуля РЭБа
			-- start_diminishing_timer	= false,
			-- ui_ico =
			-- {
				-- target_system 	= { tex = "ItemSubtype_GrimBlackoutGenerator", },
			-- },
		-- },
		-- {
			-- target			= {
						-- --target			= ai.SpellTarget.ENEMY,
						-- area 			= ai.SpellTargetArea.AROUND,
						-- class 			= ai.SpellTargetClass.SHIP,
						-- relationship 	= ai.SpellTargetRelationship.ENEMY,
							-- },
			-- target_range	= 150,
			-- aura			= ai.Aura.FAST_MOVEMENT,
			-- aura_param		= 2,
			-- diminish_control_aura = true,
			-- apply_crowd_control_coef = true,
			-- duration		= 6,
			-- isBuff			= false,
			-- min_targets_count	= 1, -- SC-89106 СТ. Спецмодуль Mjolnir Форсирование систем кораблей Варденов не сбрасывает эффект от спецмодуля РЭБа
			-- ui_ico =
			-- {
				-- target_system 	= { tex = "ItemSubtype_GrimBlackoutGenerator", },
			-- },
		-- },
	-- },
}

Spell.BlackoutGenerator_Stun_Faction1 =
{
	target			= ai.SpellTarget.ENEMY_AROUND,
	target_range	= 250,
	aura			= ai.Aura.STASIS,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration		= 1.75,
	isBuff			= false,
	min_targets_count	= 1, -- SC-89106 СТ. Спецмодуль Mjolnir Форсирование систем кораблей Варденов не сбрасывает эффект от спецмодуля РЭБа
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BlackoutGenerator", },
	},
}



Spell.BlackoutGenerator_Stun_Faction2 =
{
	target			= ai.SpellTarget.ENEMY_AROUND,
	target_range	= 150,
	aura			= ai.Aura.STASIS,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration		= 1.75,
	isBuff			= false,
	min_targets_count	= 1, -- SC-89106 СТ. Спецмодуль Mjolnir Форсирование систем кораблей Варденов не сбрасывает эффект от спецмодуля РЭБа
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BlackoutGenerator", },
	},
}



Spell.Cleanse =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.CLEANSE,
}



Spell.Cloaking =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 18,
	isBuff			= true,
--	aura_fx			= "particles/test/continuous_3",
uiName 			= "Special_CloakingDevice_Base",
	uiDesc 			= "Special_CloakingDevice_Base_Desc",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CloakingDevice", },
	},
	-- изменения в от #64709
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,
}



Spell.Cloaking_Faction1 =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 7,
	isBuff			= true,
--	aura_fx			= "particles/test/continuous_3",
--	aura_start_sound = "sound/gadgets/stealth_on",
--	aura_sound		= "sound/game/boost/small_start_loop",
--	aura_end_sound	= "sound/gadgets/stealth_off",

	uiName 				= "Special_CloakingDevice_Faction1",
	uiDesc 				= "Special_CloakingDevice_Faction1_Desc",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CloakingDevice", },
	},
	-- изменения в от #64709
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,
}

Spell.Cloaking_Ignore_Damage =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 18,
	isBuff			= true,
--	aura_fx			= "particles/test/continuous_3",
--	aura_start_sound = "sound/gadgets/stealth_on",
--	aura_sound		= "sound/game/boost/small_start_loop",
--	aura_end_sound	= "sound/gadgets/stealth_off",
	uiName 			= "Special_CloakingDevice_Base",
	uiDesc 			= "Special_CloakingDevice_Base_Desc",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CloakingDevice", },
	},
	-- изменения в от #64709
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	dispell_timeout	= 2,
}


Spell.Bonus_damage =
{
	target			= ai.SpellTarget.CASTER,
	duration		= 5,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.2,
	influence		= ai.Spell.APPLY_AURA,

	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
}

Spell.Bonus_damage_avangard =
{
	target			= ai.SpellTarget.CASTER,
	duration		= 5,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.1,
	influence		= ai.Spell.APPLY_AURA,

	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
}

Spell.Bonus_damage_10 =
{
	target			= ai.SpellTarget.CASTER,
	duration		= 10,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.2,
	influence		= ai.Spell.APPLY_AURA,

	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
}

Spell.Bonus_crit =
{
	target			= ai.SpellTarget.CASTER,
	duration		= 10,
	aura			= ai.Aura.CRIT_CHANCE,
	aura_param		= 0.5,
	influence		= ai.Spell.APPLY_AURA,

	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Eagleeye", },
	},
}

Spell.Bonus_crit_target =
{
	inherit 		= "Bonus_crit",
	target			= ai.SpellTarget.CASTER,  --???
}

Spell.Bonus_crit15 =
{
	target			= ai.SpellTarget.CASTER,
	duration		= 5,
	aura			= ai.Aura.CRIT_CHANCE,
	aura_param		= 0.5,
	influence		= ai.Spell.APPLY_AURA,

	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Eagleeye", },
	},
}

Spell.Energy_renew =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.ADD_ENERGY,
	influence_param = 1500,
	aura_fx = "particles/gadget/add_energy",
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
}


Spell.Anomaly_PandoraSun =
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.AROUND,
	},
	aura_range		= 230,
	aura_param		= 500,
	period			= 1,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}

Spell.Anomaly_AnomalySun =
{
	inherit = "Anomaly_PandoraSun",
	aura_range		= 190,
	aura_param		= 7000,
}

Spell.Anomaly_BigAnomalySun =
{
	inherit = "Anomaly_PandoraSun",
	aura_range		= 230,
	aura_param		= 2000,
}

Spell.Anomaly_PandoraSunFatal =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.AROUND,
	},
	aura_range		= 50,
	aura_param		= 50000,
	period			= 1,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}

Spell.Anomaly_AnomalySunFatal =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.AROUND,
	},
	aura_range		= 60,
	aura_param		= 500000,
	period			= 1,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}

Spell.Anomaly_DeathStar =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.OUTSIDE,
	},
	aura_range		= 8000,
	aura_param		= 2000,
	period			= 1,
	isBuff			= false,	
	aura_sound 		= "sound/aura/voidzone",
	ui_ico =
	{
		target_system 	= { tex = "anomaly_deathstar_damage_ico", },
	},
}

Spell.EmergencyBarrier =
{
	aura			= ai.Aura.EMERGENCY_BARRIER,
	duration		= 1, --3
	isBuff			= true,
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_EmergencyBarrier", },
	},
	aura_fx = "particles/gadget/shelter_shield",
	--cast_sound 	= "sound/gadgets/EmergencyBarrier",
}


Spell.OpenWorld_Anomaly_ThermalDamage =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.AROUND,
	},
	isBuff			= true,
	aura_range		= 100,
	aura_param		= 2000,
	period			= 1,
	isBuff			= true,

	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
	--aura_start_sound 	= "sound/gadgets/EmergencyBarrier",
}

Spell.Spell_OpenWorld_IvertorAnomaly =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.OUTSIDE,
	},
	aura_range		= 550,
	aura_param		= 10,
	period			= 1,
	isBuff			= false,

	period_fx			= "particles/gadget/pulsars/pulsar_g2d2_hit",
	
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
	
	additional_auras = 
	{
		{
			aura_target = 
			{
				class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
				area           = ai.SpellTargetArea.OUTSIDE,
			},
			aura = ai.Aura.DISABLE_WARP,
			aura_range		= 550,
			ignore_stacks = true,
			ignore_subtype = true,

			isBuff			= false, -- SC-118152
			ui_ico =
			{
				target_system 	= { tex = "anomaly_damage_ico", },
			},
		},
		{
			aura_target = 
			{
				class          = ai.SpellTargetClass.SHIP,
				area           = ai.SpellTargetArea.OUTSIDE,
				ship_role		= ai.ShipRoleMask.OVERSEER,
				ai				= ai.SpellTargetAi.PLAYERS,
			},
			aura = ai.Aura.DAMAGE_DEC,
			aura_range		= 550,
			aura_param		= 1,
			--ignore_stacks = true,
			--ignore_subtype = true,

			isBuff			= false,
			ui_ico =
			{
				target_system 	= { tex = "anomaly_damage_ico", },
			},
		},
		{
			aura_target = 
			{
				class          = ai.SpellTargetClass.SHIP,
				area           = ai.SpellTargetArea.OUTSIDE,
				ship_role		= ai.ShipRoleMask.OVERSEER,
				ai				= ai.SpellTargetAi.PLAYERS,
			},
			aura = ai.Aura.MODULE_DAMAGE_MOD,
			aura_range		= 550,
			aura_param		= 1,
			--ignore_stacks = true,
			--ignore_subtype = true,

			isBuff			= false,
			ui_ico =
			{
				target_system 	= { tex = "anomaly_damage_ico", },
			},
		},
	},	
}

Spell.Spell_OpenWorld_IvertorAnomaly_SPYPeriodic= 
{
	aura = ai.Aura.CAST_SPELL_PERIODIC,
	target_spell = "Spell_OpenWorld_IvertorAnomaly_SPY",
	--duration = 3,
	period = 1,
	isBuff = true,
	hud_visible = false,
	--gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Blind", },
	},
}

Spell.Spell_OpenWorld_IvertorAnomaly_SPY =
{
	aura			= ai.Aura.SPY_DRONE,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	aura_range		= 700,
	-- aura_param		= 10,
	-- period			= 1,
	-- duration			= 0.5,
	isBuff			= false,
	hud_visible		= false,
	hud_visible_holder = false,

	--period_fx			= "particles/gadget/pulsars/pulsar_g2d2_hit",
	
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}	

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMSpells =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_OpenWorld_IvertorAnomaly_DOOMSmall', 'Spell_OpenWorld_IvertorAnomaly_DOOMMedium', 'Spell_OpenWorld_IvertorAnomaly_DOOMLarge', 'Spell_OpenWorld_IvertorAnomaly_DOOMHuge' }
}

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMSmall =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
		signature		= ai.SignatureMask.SMALL,
	},
	aura_range		= 400,
	 aura_param		= 3200,
	period			= 0.3,
	-- duration			= 0.5,
	isBuff			= false,
	hud_visible		= false,
	hud_visible_holder = false,
		 ignore_stacks = true,
	ignore_subtype = true,

	--period_fx			= "particles/gadget/pulsars/pulsar_g2d2_hit",
	
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}	

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMMedium =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
		signature		= ai.SignatureMask.MEDIUM,
	},
	aura_range		= 400,
	 aura_param		= 7200,
	 period			= 0.3,
	-- duration			= 0.5,
	isBuff			= false,
	hud_visible		= false,
	hud_visible_holder = false,
		 ignore_stacks = true,
	ignore_subtype = true,

	--period_fx			= "particles/gadget/pulsars/pulsar_g2d2_hit",
	
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}	

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMLarge =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
		signature		= ai.SignatureMask.LARGE,
	},
	aura_range		= 400,
	 aura_param		= 12000,
	period			= 0.3,
	-- duration			= 0.5,
	isBuff			= false,
	hud_visible		= false,
	hud_visible_holder = false,
		 ignore_stacks = true,
	ignore_subtype = true,

	--period_fx			= "particles/gadget/pulsars/pulsar_g2d2_hit",
	
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}	

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMHuge =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
		signature		= ai.SignatureMask.HUGE,
	},
	aura_range		= 400,
	 aura_param		= 40000,
	period			= 0.3,
	-- duration			= 0.5,
	isBuff			= false,
	hud_visible		= false,
	hud_visible_holder = false,
		 ignore_stacks = true,
	ignore_subtype = true,

	--period_fx			= "particles/gadget/pulsars/pulsar_g2d2_hit",
	
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}	

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMSpellsLite =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_OpenWorld_IvertorAnomaly_DOOMSmallLite', 'Spell_OpenWorld_IvertorAnomaly_DOOMMediumLite', 'Spell_OpenWorld_IvertorAnomaly_DOOMLargeLite', 'Spell_OpenWorld_IvertorAnomaly_DOOMHugeLite' }
}

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMSmallLite =
{
		aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
		signature		= ai.SignatureMask.SMALL,
	},
	aura_range		= 480,
	 aura_param		= 160,
	period			= 0.3,
	-- duration			= 0.5,
	isBuff			= false,
	hud_visible		= false,
	hud_visible_holder = false,
		 ignore_stacks = true,
	ignore_subtype = true,

	--period_fx			= "particles/gadget/pulsars/pulsar_g2d2_hit",
	
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMMediumLite =
{
	inherit			= "Spell_OpenWorld_IvertorAnomaly_DOOMMedium",
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_range		= 480,
	 aura_param		= 360,
	 	 ignore_stacks = true,
	ignore_subtype = true,
}	

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMLargeLite =
{
	inherit			= "Spell_OpenWorld_IvertorAnomaly_DOOMLarge",
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_range		= 480,
	 aura_param		= 1200,
	 	 ignore_stacks = true,
	ignore_subtype = true,
}	

Spell.Spell_OpenWorld_IvertorAnomaly_DOOMHugeLite =
{
	inherit			= "Spell_OpenWorld_IvertorAnomaly_DOOMHuge",
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_range		= 480,
	 aura_param		= 2000,
	 ignore_stacks = true,
	ignore_subtype = true,
}		

Spell.OpenWorld_Invertor_Drone_ReduceHeal = 
{
	target = {
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship		= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target = 
	{
		target				= ai.SpellTargetGeneral.HOLDER,
	},
	aura		= ai.Aura.HEALING_MOD,
	--aura_range 	= 75,
	aura_param 	= -10,
	duration	= 15,
	
	aura_target_fx 		= "particles/gadget/healban_aura",
	
	isBuff 		= false,	
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_BattleDrone", }, 	},
}

Spell.OpenWorld_Anomaly_ThermalDamage_Low =
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.AROUND,
	},
	aura_range		= 20,
	aura_param		= 1000,
	period			= 1,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}


Spell.OpenWorld_Anomaly_MassCloaking =
{
	--aura_target		= ai.SpellTarget.SHIPS_AROUND,
	aura_target			= {
		class			= ai.SpellTargetClass.SHIP,
		--relationship	= ai.SpellTargetRelationship.ALLY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
		--misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
	aura			= ai.Aura.STEALTH,
	aura_range		= 300,
	isBuff			= true,
	uiName 			= "Special_CloakingDevice_Base",
	uiDesc 			= "Special_CloakingDevice_Base_Desc",
	--relationship_group = ai.RelationshipGroups.Pirate,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CloakingDevice", },
	},
}


Spell.OpenWorld_FuelDeficiency =
{
	isBuff				= false,
	aura				= ai.Aura.REDUCE_ENERGY_REGEN,
	aura_param			= 3,

	target			= ai.SpellTarget.CASTER,
	gameplay_specific   	= true,

	ui_ico =
	{
		target_system 	= { tex = "fuel_deficiency_ico", },
	},

	uiName				= "fuel_deficiency_name",
	uiDesc				= "fuel_deficiency_desc",
}


Spell.OpenWorld_NPCReturn =
{
	isBuff				= true,
	aura				= ai.Aura.FAST_MOVEMENT,
	aura_param			= 3,
	duration			= 6.0, -- возвращающиеся корабли не умеют прилетать в точку на высокой скорости.

	target				= ai.SpellTarget.CASTER,
	gameplay_specific   = true,
}

--[[--------------------------Sample--------------------------------------------------------
-- Восстанавливает щит
Spell.ShieldBooster =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.HEAL_SHIELD,
	influence_param = 50,
}


-- Восстанавливают корпус.
Spell.NanitePaste =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.HEAL_HULL,
	influence_param = 50,
}


-- Затормаживает цель на 30%, препятствует работе буста.
Spell.WebPropulsionSystem =
{
	target			= ai.SpellTarget.LOCKED_TARGET,
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param 		= 0.3,
	duration		= 5.0,
}


-- Сжигает "энергию" цели - жертвы.
Spell.EnergyDissolver =
{
	target			= ai.SpellTarget.LOCKED_TARGET,
	influence		= ai.Spell.BURN_ENERGY,
	influence_param = 30,
}


-- После активации на 20 секунд уменьшает все повреждения на 50%
Spell.EnergizedAdaptiveArmor =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.HULL_RESIST_ALL,
	aura_param 		= 50,
	duration		= 20,
	aura_fx			= "particles/test/continuous_3",
}


-- делает корабль невидимым, без права использовать оружия из невидимости, но управляемым
Spell.StealthCloak =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.STEALTH,
	duration		= 20,
	aura_fx			= "particles/test/continuous_3",
}


-- помещает цель в стазис (время в цели замирает), цель неупраляема, недвижима 3-5 секунд.
Spell.StasisGenerator =
{
	target			= ai.SpellTarget.LOCKED_TARGET,
	influence		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.STUN,
	duration		= 4,
	apply_crowd_control_coef	= true,
}


-- 	раскручивает цель, она стает неуправляема на 2-3 секунды.
Spell.GyroDestabilizer =
{
	target			= ai.SpellTarget.LOCKED_TARGET,
	influence		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.CONFUSION,
	duration		= 3,
	apply_crowd_control_coef = true,
}


-- Восстанавливают корпус всем друзьям в радиусе действия.
Spell.RepairingDrones =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura_param 		= 10,
	aura_range		= 100,
	period			= 1,
	aura_fx			= "particles/test/continuous_3",
}


-- Восстанавливает щиты всем дружественным кораблям в радиусе
Spell.BurnEnergy =
{
	target			= ai.SpellTarget.ENEMY_AROUND,
	target_range	= 100,
	influence		= ai.Spell.BURN_ENERGY,
	influence_param = 250,

}


-- Восстанавливает щиты всем дружественным кораблям в радиусе
Spell.BurnEnergyPeriodic =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	aura_range		= 100,
	aura_param 		= 10,
	period			= 0.5,
	aura_fx			= "particles/test/continuous_1",
	period_fx		= "particles/test/instant_2",
	period_sound	= "sound/weapons/rocket_explosion",
}
]]
Spell.EnergyShieldCommander =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.ENERGY_SHIELD,
	duration		= 15,
	aura_param		= 8,
	isBuff			= true,

	--aura 			= ai.Aura.SLOW_MANEUVER,
	--aura_target 	= ai.SpellTarget.HOLDER,
	--aura_param		= 9,
	--duration		= 6,
	uiName 			= "Special_EnergyShieldCommander",
	uiDesc 			= "Special_EnergyShieldCommander_Desc",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyShieldCommander", },
	},
}

Spell.EnergyShieldCommander_Faction1 =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.ENERGY_SHIELD,
	duration		= 10,
	aura_param		= 10,
	isBuff			= true,

	uiName 			= "Special_EnergyShieldCommander",
	uiDesc 			= "Special_EnergyShieldCommander_Desc",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyShieldCommander", },
	},
}

Spell.EnergyShieldCommander_Faction2 =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.ENERGY_SHIELD,
	duration		= 10,
	aura_param		= 8,
	isBuff			= true,

	uiName 			= "Special_EnergyShieldCommander",
	uiDesc 			= "Special_EnergyShieldCommander_Desc",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyShieldCommander", },
	},
}


--базовый спелл для дистанционного
Spell.HealBot =
{
	aura_range		= 200,
	aura_param		= 160,
	period			= 1,
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_target		= ai.SpellTarget.ALLY_LESSER_SHIELD_HOLDER ,
	isBuff			= true,

	aura_holder_def	= "HealBot",

	duration 		= 60,
}

Spell.Rocket_Test=
{
	target = ai.SpellTarget.INFLICTOR,
	aura = ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target = ai.SpellTarget.ENEMY_AROUND,
	aura_range = 50,
	aura_param = 400,
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2",
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",
	period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
}

Spell.R2D2 =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.REDUCE_ROT_SPEED,
	aura_target		= ai.SpellTarget.HOLDER,
	isBuff			= false,
	ignore_additional_power = true,
	aura_param 		= 3,
	duration 		= 1.8,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_G2D2", },
	},
}


Spell.R2D2_ =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target		= ai.SpellTarget.VISIBLE_LOCKED_TARGET_BY_HOLDER,
	isBuff			= false,
	--ignore_additional_power = true,
	aura_param 		= 10,
	duration 		= 10,
	period			= 1,
	aura_range		= 250,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_G2D2", },
	},
}

-- не используется?
Spell.Spell_Nanobots_Cloud =
{
	aura_param		= 100,
	duration		= 10,
	period			= 1,
	--target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_range 		= 15,
	aura_target 	= ai.SpellTarget.ALLY_AROUND,
	isBuff			= true,
	aura_fx			= "",
}

Spell.Spell_Nanobots_Direct =
{
	influence_param		= 100,
	influence 		= ai.Spell.HEAL_HULL_SCALED,
	target 			= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	--target 		= ai.SpellTarget.SHIPS_AROUND,

	target_range		= 40,
	--influence_fx		= "particles/other/singularity_cannon_projectile",
	scale_on_weapon		= true,
	influence_sound 	= "sound/hit/heal",
}

Spell.Spell_Nanobots_Direct_Pirate =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	target =
	{
		target 					= ai.SpellTargetGeneral.INFLICTOR,
	--	misc 					= ai.SpellTargetMisc.POSITION,
	},
	aura_target =
	{
		--class 					= ai.SpellTargetClass.SHIP,
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship 			= ai.SpellTargetRelationship.ALLY,
		area           = ai.SpellTargetArea.AROUND,
		misc	 				= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	
	aura_param					= 280,
	aura_range					= 40,	
	
	duration = 0.3,
	period =	0.2,
	
	scale_on_weapon		= true,
	influence_sound 	= "sound/hit/heal",
	
	additional_auras = 
	{
		{
			
			influence					= ai.Spell.APPLY_AURA,
			aura 						= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
			target =
								{
								target 		= ai.SpellTargetGeneral.INFLICTOR,
					--			misc 		= ai.SpellTargetMisc.POSITION,
								},
			aura_target =
								{
							--	class 		= ai.SpellTargetClass.SHIP,
								class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
								relationship 	= ai.SpellTargetRelationship.ALLY,
								area           = ai.SpellTargetArea.AROUND,
								misc	 	= ai.SpellTargetMisc.EXCLUDE_CASTER,
								},
			
			aura_param					= 280,
			aura_range					= 40,
			
			duration = 0.3,
			period =	0.2,
	
			scale_on_weapon				= true,
			
		},
	},
}

Spell.Spell_Sparks_Cannon =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DAMAGE_KINETIC_PERIODIC,
	target =
	{
		target 					= ai.SpellTargetGeneral.INFLICTOR,
		misc 					= ai.SpellTargetMisc.POSITION,
	},
	aura_target =
	{
		class 					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area					= ai.SpellTargetArea.AROUND,
		relationship 			= ai.SpellTargetRelationship.ENEMY,
		signature				= ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM + ai.SignatureMask.LARGE,
	},
	
	aura_param					= 100,
	aura_range					= 12,
	duration					= 1.5,
	period						= 0.5,
	
	isBuff						= false,
	hud_visible 				= true,
	
	scale_on_weapon				= true,
	
	aura_fx						= "particles/weapons/other/sparks_cannon_spell",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SparksCannon", },
	},
	
	additional_auras = 
	{
		{
			aura 						= ai.Aura.DAMAGE_KINETIC_PERIODIC,
			aura_target =
			{
				class 					= ai.SpellTargetClass.SHIP,
				area					= ai.SpellTargetArea.AROUND,
				relationship 			= ai.SpellTargetRelationship.ENEMY,
				signature				= ai.SignatureMask.HUGE,
			},
			
			aura_param					= 100,
			aura_range					= 20,
			duration					= 1.5,
			period						= 0.5,
			
			isBuff						= false,
			hud_visible 				= true,
			
			scale_on_weapon				= true,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_SparksCannon", },
			},
		},
	},
}

Spell.Spell_ReverseThruster =
{
	influence_param	= 500,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	target 			= ai.SpellTarget.CASTER ,
	--target 		= ai.SpellTarget.SHIPS_AROUND,

	--target_range		= 15,
	cast_position_fx = "particles/gadget/reverse_thruster",
	cast_sound 		= "sound/gadgets/ReverseThruster_activate",
	--aura_start_sound 		= "sound/gadgets/ReverseThruster_activate",
	--scale_on_weapon	= true
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ReverseThruster", },
	},
}

Spell.Spell_ReverseThruster_pirate =
{
	influence_param	= 750,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	target 			= ai.SpellTarget.CASTER ,
	--target 		= ai.SpellTarget.SHIPS_AROUND,

	--target_range		= 15,
	cast_position_fx = "particles/gadget/reverse_thruster",
	cast_sound 		= "sound/gadgets/ReverseThruster_activate",
	--aura_start_sound 		= "sound/gadgets/ReverseThruster_activate",
	--scale_on_weapon	= true
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ReverseThruster", },
	},
}

Spell.Spell_ShelterField_friendlyPart =
{
	duration		= 5,
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	--influence 		= ai.Spell.ANTI_RADAR,
	aura  			= ai.Aura.STEALTH,
	aura_target 	=
			{
				class = ai.SpellTargetClass.SHIP,
				area = ai.SpellTargetArea.AROUND,
				relationship = ai.SpellTargetRelationship.ALLY,
				misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
	aura_range		= 250,

	aura_fx 		= "particles/gadget/shelter_shield",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShelterField", },
	},

	uiName 			= "Spell_ShelterField_friendlyPart",
	uiDesc 			= "Spell_ShelterField_friendlyPart_Desc",
}

Spell.Spell_ShelterField_friendlyPart_mob =
{
	duration		= 5,
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.CAMO_MOD,
	aura_param		= 4,
	aura_target 	=
			{
				class = ai.SpellTargetClass.SHIP,
				area = ai.SpellTargetArea.AROUND,
				relationship = ai.SpellTargetRelationship.ALLY,
				misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
	aura_range		= 250,

	aura_fx 		= "particles/gadget/shelter_shield",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShelterField", },
	},

	uiName 			= "Spell_ShelterField_friendlyPart",
	uiDesc 			= "Spell_ShelterField_friendlyPart_Desc",
}

Spell.Spell_ShieldChargeLarge_EnergyPart =
{
	duration		= 20,
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.ADD_ENERGY_PERIODIC,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 40, -- *число модификаторов(врагов вокруг).
	period			= 1,

	mod_range		= 200,
	mod_target		= --Module_ShieldChargeLarge_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	mod_update_period = 1,
	disable_zero_stage = true,
	

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldChargeLarge", },
	},

	uiName 			= "Spell_ShieldChargeLarge_EnergyPart",
	uiDesc 			= "Spell_ShieldChargeLarge_EnergyPart_Desc",
	aura_fx = "particles/gadget/add_energy",
}

Spell.Spell_Resist_SmartBomb =
{
	duration		= 12,
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.RESIST_ALL,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 40, -- *число модификаторов(врагов вокруг).
	period			= 1,

	mod_range		= 200,
	mod_target		= --Module_SmartBomb_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	mod_update_period = 1,
	disable_zero_stage = true,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
}


--[[
Spell.KnowledgeEnemyCPU_Init =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "KnowledgeEnemyCPU",
	--duration		= 11115,
	period			= 5,
	isBuff			= true,
	ignore_stacks	= true,
	ignore_subtype	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KnowledgeEnemyCPU", },
	},
}]]

Spell.KnowledgeEnemyCPU =
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.DAMAGE_MOD,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 1, -- *число модификаторов(врагов вокруг).
	duration		= 5,
	period			= 1,
	ignore_stacks	= true,
	ignore_subtype	= true,
	spell_on_cancel = "KnowledgeEnemyCPU",
	mod_range		= 300,
	hud_visible 	= false, -- прячем от игрока
	mod_target		= --ModulePassive_KnowledgeEnemyCPU_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KnowledgeEnemyCPU", },
	},
}



Spell.Spell_Cold_Ray =
{
	duration		= 1.5, --(сброс стаков за 1.5 сек)
	max_stacks 		= 10,
	aura_param		= 0.0538, --макс замедление 1/ (1 + 10 * .1) = -0.5 за 5 сек
	isBuff 			= false,

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura            = ai.Aura.SLOW_MOVEMENT,

	ui_ico =
	{
		target_system 	= { tex = "Weapon_Cold_Ray_debuff", },
	},
	aura_target_fx = "particles/gadget/slow_movement",
}

Spell.Spell_Cold_Ray_Pirate =
{
	duration		= 1.5, --(сброс стаков за 1.5 сек)
	max_stacks 		= 10,
	aura_param		= 0.1, --макс замедление 1/ (1 + 10 * .1) = -0.5 за 5 сек
	isBuff 			= false,

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura            = ai.Aura.SLOW_MOVEMENT,

	ui_ico =
	{
		target_system 	= { tex = "Weapon_Cold_Ray_debuff", },
	},
	aura_target_fx = "particles/gadget/slow_movement",
}

Spell.TestDummy_Shield_Vampire =
{
	aura           	= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.ALLY_AROUND_EXCLUDE_HOLDER,
	--aura_target		= ai.SpellTarget.ENEMY_AROUND,
	duration		= 60*60,
	period 			= 0.2,
	aura_range      = 2500,
	aura_param		= 100000,
}

Spell.Spell_Weakness =
{
	duration		= 2,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL_DEC,
	isBuff			= false,
	ignore_additional_power = true,
	aura_param		= 50,
	gameplay_specific = true,
	
	aura_fx 		= "particles/gadget/teleport_prepare",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ReverseThruster", },
	},
}

Spell.Spell_Weakness_PirateRevers =
{
	duration		= 3,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL_DEC,
	isBuff			= false,
	ignore_additional_power = true,
	aura_param		= 75,
	gameplay_specific = true,
	
	aura_fx 		= "particles/gadget/teleport_prepare",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ReverseThruster", },
	},
}

Spell.MaxSpeedPlus27 =
{
	aura 			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 		= 27,--// значение из старого speed_to_resist
	diminish_aura_param = true,
	ignore_stacks 	= true,
	ignore_subtype 	= true,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "ItemSubtype_AdaptiveForceField", },		},
}
Spell.MaxSpeedPlus33 =
{
	aura 			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 		= 33,--// значение из старого speed_to_resist
	diminish_aura_param = true,
	ignore_stacks 	= true,
	ignore_subtype 	= true,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "ItemSubtype_AdaptiveForceField", },		},
}
Spell.MaxSpeedPlus39 =
{
	aura 			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 		= 39,--// значение из старого speed_to_resist
	diminish_aura_param = true,
	ignore_stacks 	= true,
	ignore_subtype 	= true,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "ItemSubtype_AdaptiveForceField", },		},
}
Spell.MaxSpeedPlus42 =
{
	aura 			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 		= 42,--// значение из старого speed_to_resist
	diminish_aura_param = true,
	ignore_stacks 	= true,
	ignore_subtype 	= true,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "ItemSubtype_AdaptiveForceField", },		},
}
Spell.MaxSpeedPlus45 =
{
	aura 			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 		= 45,--// значение из старого speed_to_resist
	diminish_aura_param = true,
	ignore_stacks 	= true,
	ignore_subtype 	= true,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "ItemSubtype_AdaptiveForceField", },		},
}
Spell.MaxSpeedPlus47 =
{
	aura 			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 		= 47,--// значение из старого speed_to_resist
	diminish_aura_param = true,
	ignore_stacks 	= true,
	ignore_subtype 	= true,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "ItemSubtype_AdaptiveForceField", },		},
}

Spell.MaxSpeedDmg7 =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.07,
	ignore_stacks 	= true,
	ignore_subtype 	= true,
	isBuff 			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Raid_Buff", },
	},
}


Spell.RadiationSource =
{
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	aura_target		= ai.SpellTarget.ENEMY_VISIBLE_BY_HOLDER,
	target 			= --ai.SpellTarget.LOCKED_TARGET,
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
			},

	aura_range		= 125,
	aura_param		= 10,
	period			= 1,
	isBuff			= false,
	duration		= 2,
	max_stacks		= 5,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
	aura_target_fx = "particles/gadget/burn_energy",
}

Spell.Spell_Radiation_Beam_T5_Pirate =
{
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	aura_target		= ai.SpellTarget.ENEMY_VISIBLE_BY_HOLDER,
	target 			= --ai.SpellTarget.LOCKED_TARGET,
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
			},

	aura_range		= 30,
	aura_param		= 10,
	period			= 1,
	isBuff			= false,
	duration		= 1.5,
	max_stacks		= 5,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
	
	additional_auras =
	{
		{
		aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
		aura_target		= ai.SpellTarget.ENEMY_VISIBLE_BY_HOLDER,
		target 			= --ai.SpellTarget.LOCKED_TARGET,
				{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				},
	
		aura_range		= 30,
		aura_param		= 100,
		period			= 1,
		isBuff			= false,
		duration		= 1.5,
		max_stacks		= 5,
		ui_ico =
			{
			target_system 	= { tex = "anomaly_damage_ico", },
			},	
		},
	
	},	
	
	aura_target_fx = "particles/gadget/burn_energy",
}


Spell.SuppressingFire =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC_REDUCE_HEAL, -- -50% хила
	aura_target		= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.ENEMY_AROUND,
	target_range 	= 15,

	aura_param		= 2, --33% непрерывного урона
	
	reduce_heal_param = 50, -- -50% хила для тултипа, тк этот параметр больше нигде не упоминается
	
	period			= 1,
	isBuff			= false,
	duration		= 3,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}

Spell.Spell_SuppressingFire_T5_Pirate =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC, -- -50% хила
	aura_target		= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.ENEMY_AROUND,
	target_range 	= 15,

	aura_param		= 105, --33% непрерывного урона
	
	reduce_heal_param = 50, -- -50% хила для тултипа, тк этот параметр больше нигде не упоминается
	
	period			= 1,
	isBuff			= false,
	duration		= 3,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
	additional_auras	=
	{
		{
		aura			= ai.Aura.HEALING_MOD, -- -50% хила
		aura_target		= ai.SpellTarget.HOLDER,
		target 			= ai.SpellTarget.ENEMY_AROUND,
		target_range 	= 15,

		aura_param		= -4, --33% непрерывного урона
	
		--reduce_heal_param = 50, -- -50% хила для тултипа, тк этот параметр больше нигде не упоминается
	
		period			= 1,
		isBuff			= false,
		duration		= 3,
		ui_ico 			= { target_system 	= { tex = "anomaly_damage_ico", },	},
		},
	},
	
}

Spell.MeltingFire =
{
	aura			= ai.Aura.HULL_RESIST_ALL_DEC,
	aura_target		= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.ENEMY_AROUND,
	target_range 	= 10,

	aura_param		= 5, --
	max_stacks 		= 10,
	isBuff			= false,
	duration		= 5,
	ui_ico =
	{
		target_system 	= { tex = "CritChance", },
	},
}


Spell.Spell_ClanShipTorpedo =
{
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	target 			= ai.SpellTarget.CASTER,

	aura_range		= 100,
	aura_param		= 200,
	period			= 1,
	isBuff			= false,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_GravityAnomaly", },
	},
}


Spell.SmartBomb_ClanShip =
{
	inherit				= "SmartBomb_T1_Mk1",
	aura_range			= 80,
	aura_param			= 450.9375,
	duration			= 1500,
	period				= 1,
}


--#51948
--для талантов захардкодал название спелла TalentEmergency_CooldownSpell
Spell.TalentEmergency_CooldownSpell =
{
	influence		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.NONE,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	gameplay_specific = true,

	isBuff			= false,

	ui_ico =
	{
		target_system 	= { tex = "fuel_deficiency_ico", },
	},
}
--Отображение кд Аварийного барьера
--cooldown_spell в дефе модуля
-- заменить show_cooldown_status = true
--[[ Spell.EmergencyBarrierCooldown =
{
	influence		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.NONE,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	gameplay_specific = true,

	isBuff			= false,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EmergencyBarrier", },
	},
} ]]



Spell.Warp_Shift =
{
	duration		= 8,
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura			= ai.Aura.STEALTH,
	isBuff			= true,
	ui_ico	=
	{

		target_system	= { tex = "ItemSubtype_Shift", },
	},
}


Spell.ShieldHavoc =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.VISIBLE_LOCKED_TARGET_BY_CASTER_POSITION,
	aura 			= ai.Aura.SHIELD_BURN_PERIODIC,
	aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	aura_execution_delay = 3,

	target_range	= 300,
	aura_range		= 100,
	aura_param		= 0.2,
	duration		= 5,
	period			= 1,
	isBuff			= false,
}

Spell.Engine_off = {
	period=1,
	target=ai.SpellTarget.CASTER,
	aura=ai.Aura.DISABLE_BOOST,
	isBuff=false,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BoostBan", },
	},
}

Spell.TRay =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target 	= 		{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.IN_CYLINDER,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		damageability  = ai.SpellTargetDamageability.DAMAGEABLE,
	},

	aura_range		= 550,
	aura_extra_radius= 35,

	aura_param		= 150,
	duration 		= 2,
	--period			= 1,
	isBuff			= false,

	work_beam_fx		= "particles/weapons/laser/tach_ray_1",
	ray_shot_sound 		= "sound/destroyer/TRay_beam",
}
Spell.TRay2 =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target 	= 	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.IN_CYLINDER,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		damageability  = ai.SpellTargetDamageability.DAMAGEABLE,
	},

	--aura_execution_delay = 6,

	aura_range		= 550,
	aura_extra_radius= 20,
	aura_param		= 1000,
	duration 		= 2,
	period			= 0.4,
	isBuff			= false,
	nebula 			= "Effects_Nebula_TachRay",
	work_beam_fx		= "particles/weapons/laser/tach_ray_2",
	ray_shot_sound 		= "sound/destroyer/TRay2_beam",
}

Spell.EnergyReroute_PhaseSpeed =
{
	aura			= ai.Aura.ENGINE_MOD,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura_param		= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReroute_Engine", },
	},
}
Spell.EnergyReroute_PhaseSpeed_max =
{
	inherit 		= "EnergyReroute_PhaseSpeed",
	aura_param		= 0.4,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReroute_EngineMax", },
	},
}

Spell.EnergyReroute_PhaseDamage =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura_param		= 0.12,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReroute_Weapon", },
	},
	
	additional_auras = 
	{
		{
			aura			= ai.Aura.PROJECTILE_SPEED_MOD,
			aura_target 	= ai.SpellTarget.HOLDER,
			target 			= ai.SpellTarget.CASTER,
			aura_param 		= 0.12,
			isBuff 			= true,
			ui_ico = 
			{
				target_system 	= { tex = "ItemSubtype_EnergyReroute_Weapon", },
			},
		},
	},
}
Spell.EnergyReroute_PhaseDamage_max =
{
	inherit 		= "EnergyReroute_PhaseDamage",
	aura_param		= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReroute_WeaponMax", },
	},
	
	additional_auras = 
	{
		{
			aura			= ai.Aura.PROJECTILE_SPEED_MOD,
			aura_target 	= ai.SpellTarget.HOLDER,
			target 			= ai.SpellTarget.CASTER,
			aura_param 		= 0.2,
			isBuff 			= true,
			ui_ico = 
			{
				target_system 	= { tex = "ItemSubtype_EnergyReroute_WeaponMax", },
			},
		},
	},
}

Spell.EnergyReroute_PhaseShield =
{
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura_param		= 250,
	period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReroute_Shield", },
	},
	
	additional_auras = 
	{
		{
			aura			= ai.Aura.SHIELD_RESIST_ALL,
			aura_target 	= ai.SpellTarget.HOLDER,
			target 			= ai.SpellTarget.CASTER,
			aura_param 		= 15,
			isBuff 			= true,
			ui_ico = 
			{
				target_system 	= { tex = "ItemSubtype_EnergyReroute_Shield", },
			},
		},
	},
}
Spell.EnergyReroute_PhaseShield_max =
{
	inherit 		= "EnergyReroute_PhaseShield",
	aura_param		= 600,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReroute_ShieldMax", },
	},
	
		additional_auras = 
	{
		{
			aura			= ai.Aura.SHIELD_RESIST_ALL,
			aura_target 	= ai.SpellTarget.HOLDER,
			target 			= ai.SpellTarget.CASTER,
			aura_param 		= 30,
			isBuff 			= true,
			ui_ico = 
			{
				target_system 	= { tex = "ItemSubtype_EnergyReroute_ShieldMax", },
			},
		},
	},
}

--[[ Spell.SpellGravyAnomaly =
{
	target = ai.SpellTarget.AIM_POS,
	target_range = 300.0,
	influence = ai.Spell.APPLY_AURA,
	ignore_additional_power = true,
	aura_holder_def = "AuraHolderEntity",
	ignore_stacks = true,
	ignore_subtype = true,
	aura_fx ="particles/gadget/gravy_anomaly_hole",
	holder_sound 	= "sound/destroyer/GravyAnomaly_loop",


	aura = ai.Aura.SHIP_ATTRACTION,
	aura_param = 18, --attraction force  --в экселе переопределяется
	aura_range = 250,
	nebula	= "Effects_Nebula_GravyAnomaly",
	aura_target = ai.SpellTarget.SHIPS_AROUND,
	isBuff = false,
	duration = 20, --в экселе переопределяется
	period = 0.2,
	aura_execution_delay = 5, --в экселе переопределяется
	ui_ico = {
		target_system = { tex = "ItemSubtype_EmergencyBarrier", },
	},
	additional_auras =
	{
		{
			--aura = ai.Aura.DAMAGE_KINETIC_SCALED,
			--aura_param = 75, --damage --в экселе переопределяется
			aura = ai.Aura.HULL_BURN_PERIODIC,
			aura_param = 0.02,
			aura_range = 125,
			aura_target = ai.SpellTarget.SHIPS_AROUND,
			aura_fx = "particles/gadget/gravy_anomaly_hole_start_explosion",
			isBuff = false,
			duration = 20, --в экселе переопределяется
			period = 0.2,
			aura_execution_delay = 5, --в экселе переопределяется
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_ReverseThruster", },
			},
		},
		{
			 aura = ai.Aura.DAMAGE_KINETIC_PERIODIC,
			aura_param = 30000, --damage
			aura_range = 4,
			aura_target = ai.SpellTarget.SHIPS_AROUND,
			aura_fx = "particles/gadget/gravy_anomaly_beam_end",
			isBuff = false,
			duration = 20, --в экселе переопределяется
			period = 0.2,
			aura_execution_delay = 5, --в экселе переопределяется
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_ReverseThruster", },
			},
		},
	}
} ]]

Def.AuraHolderEntityHackImmune =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	hack_immune 		= true,
}
Def.AuraHolderEntityHackDamageImmune =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	hack_immune 		= true,
	damageable			= false,
}


Spell.SpellGravyAnomaly_V2_Start =  --стабильный спелл
{
	target = ai.SpellTarget.AIM_POS,
	target_range = 500.0,
	influence = ai.Spell.APPLY_AURA,
	ignore_additional_power = true,  --Зачем это тут?  !!!
	aura_holder_def = "AuraHolderEntityHackImmune",
	ignore_stacks = true,
	ignore_subtype = true,
	aura_fx = "particles/gadget/huge/gravy_anomaly_beam_end",
	holder_sound 	= "sound/destroyer/GravyAnomaly_activation",

	aura = ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	aura_param = 25,
	aura_range = 110,
	aura_target = --ai.SpellTarget.ENEMY_AROUND, --#76550
	{
		class 	= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.SC_BASE_ENTITY,
		area 	= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	isBuff = false,
	duration = 5,
	period = 0.2,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_GravityAnomaly", },
	},
}
Spell.SpellGravyAnomaly_V2_End =
{
	target = ai.SpellTarget.AIM_POS,
	target_range = 600.0,
	influence = ai.Spell.APPLY_AURA,
	ignore_additional_power = true,  --Зачем это тут?  !!!
	aura_holder_def = "AuraHolderEntity",
	ignore_stacks = true,
	ignore_subtype = true,
	aura_fx ="particles/gadget/huge/gravy_anomaly_hole",
	holder_sound 	= "sound/destroyer/GravyAnomaly_loop",

	aura = ai.Aura.SHIP_ATTRACTION,
	aura_param = 18, --attraction force  --в экселе переопределяется
	aura_range = 220,
	nebula	= "Effects_Nebula_GravyAnomaly",
	aura_target = ai.SpellTarget.SHIPS_AROUND,
	isBuff = false,
	duration = 20,
	period = 0.2,
	ui_ico = {
		target_system = { tex = "ItemSubtype_GravityAnomaly", },
	},
	additional_auras =
	{
		-- бьем этим по коммон шипам
		{
			--aura = ai.Aura.DAMAGE_KINETIC_SCALED,
			--aura_param = 75, --damage --в экселе переопределяется
			aura = ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
			--aura			= ai.Aura.HULL_BURN_PERIODIC,
			aura_param = 250,
			--aura_param = 0.0064,
			aura_range = 110,
			aura_target =  --ENEMY_AROUND + signature
				{
					class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
					area			= ai.SpellTargetArea.AROUND,
					relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
					vitality		= ai.SpellTargetVitality.ALIVE,
					signature		= ai.SignatureMask.LARGE + ai.SignatureMask.MEDIUM + ai.SignatureMask.SMALL + ai.SignatureMask.TINY,--ai.SignatureMask.HUGE,
				},			
			aura_fx = "particles/explosions/explosion_big3_electric",
			isBuff = false,
			duration = 20,
			period = 0.2,
			--aura_signature	= ai.SignatureMask.LARGE + ai.SignatureMask.MEDIUM + ai.SignatureMask.SMALL + ai.SignatureMask.TINY,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_GravityAnomaly", },
			},
		},
		-- бьем по этим по HUGE
		{
			 aura = ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
			--aura_param = 3000, --damage
			aura_param = 400, --damage
			--aura_range = 4,
			aura_range = 110,
			aura_target =  --ENEMY_AROUND + signature
				{
					class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
					area			= ai.SpellTargetArea.AROUND,
					relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
					vitality		= ai.SpellTargetVitality.ALIVE,
					signature		= ai.SignatureMask.HUGE,
				},			
			isBuff = false,
			duration = 18, --в экселе переопределяется
			period = 0.2,
			--aura_signature	= ai.SignatureMask.HUGE,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_GravityAnomaly", },
			},
		},
		--это в центре аномалии
		{
			aura = ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
			aura_param = 800, --damage
			aura_range = 2,
			aura_target = ai.SpellTarget.ENEMY_AROUND,
			isBuff = false,
			duration = 19, --в экселе переопределяется
			period = 0.2,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_GravityAnomaly", },
			},
		},
	}
}


Spell.PushRay =
{
	influence			= ai.Spell.APPLY_AURA,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC, --ai.Aura.DAMAGE_KINETIC_PERIODIC,
	aura_target =
		{
			class 			= ai.SpellTargetClass.SHIP+ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.TURRET,
			relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			area			= ai.SpellTargetArea.IN_CYLINDER,  --цилиндр радиуса aura_range и длиной target_range
		},

	aura_range			= 450,
	aura_extra_radius	= 30,
	aura_param 			= 300, -- 50,
	duration 			= 3,
	--period = 1,
	isBuff 				= false,
	aura_target_directed_fx = "particles/gadget/push_ray_hit",
	nebula				= "Effects_Nebula_Pushray",

	work_beam_fx		= "particles/gadget/push_ray",
	--work_beam_fx	= "particles/weapons/laser/push_ray_1",
	ui_ico = {
		target_system = { tex = "ItemSubtype_PushRay", },
	},

	additional_auras =
	{
		{
			influence = ai.Spell.APPLY_AURA,
			target = ai.SpellTarget.CASTER,

			aura = ai.Aura.SHIP_ATTRACTION,
			aura_param = -175, --repulsion force
			aura_range = 450,
			aura_extra_radius = 30,
			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
				area			= ai.SpellTargetArea.IN_CYLINDER,  --цилиндр радиуса aura_range и длиной target_range
			},
			isBuff = false,
			duration = 3,
			period = 0.2,
			--aura_execution_delay = 3,
			ui_ico = {
				target_system = { tex = "ItemSubtype_PushRay", },
			},
		},

--[[ 		{
			influence = ai.Spell.APPLY_AURA,
			target = ai.SpellTarget.CASTER,
			aura = ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC, --ai.Aura.DAMAGE_KINETIC_PERIODIC,
			aura_target =
			{
				class 			= ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.TURRET,
				relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
				area			= ai.SpellTargetArea.IN_CYLINDER,  --цилиндр радиуса aura_range и длиной target_range
			},
			target_range = 450,
			aura_range = 30,
			aura_param = 300, -- 50,
			duration = 3,
			--period = 1,
			isBuff = false,
			ui_ico = {
				target_system = { tex = "ItemSubtype_PushRay", },
			},
		}, ]]
	}
}

Spell.Javelin_Weaknes =
{
	duration		= 25,
	max_stacks 		= 3,
	ignore_subtype 	= true,

	aura_param		= 40,
	isBuff 			= false,

	--target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.HULL_RESIST_EMP_DEC,
	aura_range 		= 30,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Javelin", },
	},
}


Spell.Spell_OrbGun =
{
	aura 			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	--target 			= ai.SpellTarget.CASTER,
	target 			= ai.SpellTarget.INFLICTOR,

	aura_range		= 35*0.8,
	aura_param		= 20,
	period			= 0.2,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_OrbGun", },
	},
}

-- #62296
Spell.Spell_OrbGunUnique =
{
	aura 			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	target 			= ai.SpellTarget.INFLICTOR,

	aura_range		= 35,
	aura_param		= 100,
	period			= 0.2,
	isBuff			= false,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_OrbGun_1", },
	},
}

Spell.Spell_OrbGun_Pirate =
{
	-- aura 			= ai.Aura.DAMAGE_EMP_SCALED,
	-- aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	-- --target 			= ai.SpellTarget.CASTER,
	-- target 			= ai.SpellTarget.INFLICTOR,

	-- aura_range		= 35*0.8,
	-- aura_param		= 20,
	-- period			= 0.2,
	
	inherit			= "AttrackerField",
	aura_range		= 30,
	aura_param		= 200,
	duration		= 10,
	
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_OrbGun", },
	},
}

--- #62298 крик
Spell.Spell_Scream =
{
	aura 			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	--target 			= ai.SpellTarget.CASTER,
	target 			= ai.SpellTarget.INFLICTOR,

	aura_range		= 50,
	aura_param		= 1794,

	aura_param_add	= -409,
	aura_range_add	= 81.8, --50, было в прототипе

	period			= 0.2, 	--0.2,
	isBuff			= false,

	duration		= 1, --5,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Scream", },
	},
}

Spell.Tackler_SlowManeuver =
{
	influence 		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target	= --только вражеские корабли
					{
--						target			= ai.SpellTargetGeneral.LOCKED_TARGET,
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		=ai.SpellTargetVitality.ALIVE,
						misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
					},
	aura_range		= 225,
	aura 			= ai.Aura.SLOW_MANEUVER,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	aura_param		= 0.4286, -- -30%
	--duration		= 50,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GuidedDron", },
	},
	use_dead_rcs_effects = true,
}

Spell.Tackler_DisableJump =
{
	influence 		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target	= --только вражеские корабли
					{
--						target			= ai.SpellTargetGeneral.LOCKED_TARGET,
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		=ai.SpellTargetVitality.ALIVE,
						misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
					},
	aura_range		= 350,
	aura 			= ai.Aura.DISABLE_WARP,
	--aura_param		= 2.0303, -- -66%
	--duration		= 5,

	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GuidedDronRL", },
	},
	aura_target_directed_fx		= "particles/gadget/lightnings_debuff",
}


Spell.Spell_CrystalHamstring =
{
	target 			= ai.SpellTarget.INFLICTOR,
	--target_range	= 50,
	aura 			= ai.Aura.SLOW_MANEUVER,  --ai.Aura.SLOW_MANEUVER, -- SLOW_MANEUVER делает контрол-деминишинг поэтому актуальное время снижается вдвое, используем нулевую ауру SLOW_MOVEMENT
	aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	aura_range		= 50,
	aura_param		= 0,
	duration		= 3.2,
	ignore_additional_power = true,
	diminish_control_aura 	= false,
	apply_crowd_control_coef	= true,
	hud_visible		= false,
	
	isBuff			= false,
	spell_on_cancel = "Spell_CrystalHamstringOut",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CrystalHamstring", },
	},

	use_dead_rcs_effects = true,
}
Spell.Spell_CrystalHamstringOut =
{
	target = {	target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
	aura 			= ai.Aura.SLOW_MANEUVER,
	diminish_control_aura = false,
	apply_crowd_control_coef = true,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 2.0303, -- -66%
	duration		= 2,

	isBuff			= false,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CrystalHamstring", },
	},

	use_dead_rcs_effects = true,
}


-- #62296
Spell.Spell_PulsarShield =
{
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	aura_target		=  --ai.SpellTarget.ENEMY_SHIPS_VISIBLE,
			{
				class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.GUIDED_DRONE,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
				damageability 	= ai.SpellTargetDamageability.DAMAGEABLE,
			},
	--duration 		= 9000,
	period 			= 0.5,
	target 			= ai.SpellTarget.CASTER,
	isBuff 			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PulsarShield", },
	},

	aura_range		= 70,
	aura_param		= 300,

	period_fx		= "particles/gadget/pulsars/pulsar_shield_hit",
	period_my_fx	= "particles/gadget/pulsars/pulsar_shield_hit",
	period_beam_fx	= "particles/gadget/pulsars/pulsar_shield_beam",

	period_sound =  "sound/gadgets/pulsar/pulsar_period",
}

Spell.Spell_PulsarShieldLight =
{
	inherit = "Spell_PulsarShield",
	aura_param		= 232,
}

Spell.FragDamage =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.75,
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "sentinel_ico", },
	},
}


Spell.FragSlow =
{
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param 		= 0.05,
	max_stacks 		= 99999,
	isBuff			= false,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WebPropulsion", },
	},
}

Spell.DestrHealStation =
{
	aura_range		= 50,
	aura_param		= 160,
	period			= 1,
--	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_target		= ai.SpellTarget.ALLY_LESSER_HULL_HOLDER_NO_STEALTH,
	min_targets_count  = 0,
	isBuff			= true,
	ignore_subtype 	= true,
	
	period_beam_root_fx = "particles/gadget/pulsars/drone_hull_ray_periodic",
	--aura_target_fx	= "particles/gadget/hull_heal",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairRayLarge", },
	},
}
-- test
Spell.DestrBeamDrone =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER_POSITION_CASTER, --ai.SpellTarget.SELF,
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target 	= ai.SpellTarget.ENEMY_VISIBLE_BY_HOLDER,  --ai.SpellTarget.ENEMY_SHIPS_VISIBLE ai.SpellTarget.ALL_AROUND,


	--aura_execution_delay = 6,

	--target_range 	= 550,
	aura_range		= 120,
	aura_param		= 10,
	duration 		= 20,
	period			= 1,
	isBuff			= false,
	work_beam_fx	= "particles/weapons/laser/tach_ray_2",
	activate_beam_fx = "particles/weapons/laser/tach_ray_2_activate",
	ray_sound 		= "sound/destroyer/TRay2_beam",

	aura_holder_def	= "HealBot",
	--aura_holder_def	= "SentryDrone",

--	SmartBomb =  отсюда звуки - эффекты взяты
		period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
		period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",

		activate_beam_fx = "particles/gadget/plasma_web_beam",
		period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
		period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2",
		period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",
}


Spell.ShieldUniqueTank_Taunt = { --[[  переехало в аддишинал к другому спеллу
	aura_range			= 300,
	duration			= 7,
	period				= 1,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.FORCE_TARGET_LOCK,
	aura_target			= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	isBuff				= false,
	ignore_subtype 		= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldWall", },
	},]]
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 0.75,
	duration		= 30,
	dispell_flag	= ai.Dispell.ON_DAMAGE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	isBuff 			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
	},
}
Spell.ShieldUniqueTank_Wall = {
	duration			= 6,
	period				= 1,
	aura_param 			= 250,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.SHIELD_RESIST_ALL,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldWall", },
	},
	visual_entity		= "Model_MegalodonShield",
	visual_entity_bone	= "main",
	additional_auras =
	{
		{
			aura_range			= 300,
			duration			= 7,
			period				= 1,
			target				= ai.SpellTarget.CASTER,
			aura				= ai.Aura.FORCE_TARGET_LOCK,
			aura_target			= ai.SpellTarget.ENEMY_SHIPS_AROUND,
			isBuff				= false,
			ignore_subtype 		= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_ShieldWall", },
			},
		},
	},
}

Spell.TimeBoost_T4_Short = {
	duration			= 5,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.OVERCHARGE,
	aura_target			= ai.SpellTarget.HOLDER,
	isBuff				= true,
	aura_param			= 0.35,
	ui_ico 				=
		{
			target_system = { tex = "ItemSubtype_EnergyLance_TimeBoost", },
		},
	uiName				= "TimeBoost_Base",
	uiDesc				= "TimeBoost_Base_Desc",
	visual_entity		= "Model_ArcherShield",
	visual_entity_bone	= "main",
}


Spell.UnicEMPAbsorb= {
	duration			= 5,
	period				= 1,
	--aura_param 			= 300,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.EMP_ABSORB_TO_SHIELD,
	aura_param			= 0.8,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield", },
	},
	visual_entity		= "Model_MegalodonShieldEmi",
	visual_entity_bone	= "main",
}

Spell.DispelRay =
{
	influence 		= ai.Spell.DESTROY,
	target 			= ai.SpellTarget.ENEMY_OWNED_ENTITIES_IN_CYLINDER,
	target_range	= 450,
	target_extra_radius = 30,
	--period = 1,
	isBuff 			= false,
	work_beam_fx	= "particles/weapons/laser/push_ray_1",
}

Spell.Vortex =
{
	duration		= 3,

	isBuff 			= false,

	--target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,

	--target 			= ai.SpellTarget.LOCKED_TARGET,
	target = {	target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				signature		= ai.SignatureMask.LARGE + ai.SignatureMask.MEDIUM + ai.SignatureMask.SMALL + ai.SignatureMask.TINY,--ai.SignatureMask.HUGE,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
		},
	--aura_target		= ai.SpellTarget.HOLDER,

	--aura			= ai.Aura.HULL_BURN_PERIODIC, --, --DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	aura			= DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	--aura_range 		= 10,
	aura_param		= 100,
	period = 1,

	aura_fx 		= "particles/weapons/vortex/spell",

	--aura_signature	= ai.SignatureMask.LARGE+ai.SignatureMask.MEDIUM+ai.SignatureMask.SMALL+ai.SignatureMask.TINY,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Javelin", },
	},
}

Spell.Vortex_Huge =
{
	duration		= 3,

	isBuff 			= false,

	--target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,

	target = {	
			target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
			signature		= ai.SignatureMask.HUGE,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	--aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	--aura			= DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	--aura_range 		= 10,
	--aura_param		= 3000,
	aura_param		= 1,
	period = 1,

	aura_fx 		= "particles/weapons/vortex/spell",

	--aura_signature	= ai.SignatureMask.HUGE,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Javelin", },
	},
}

Spell.FotonVortex =
{
	duration		= 15,
	max_stacks		= 3,

	isBuff 			= false,

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},

	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_param		= 100,

	aura_fx 		= "particles/gadget/damage_thermal",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Javelin", },
	},

	aura_sound 		= "sound/weapons/laser/basic",
	---
	period			= 1,
}


---#62799 спецабилка для Перехватчик РЭБ Иерихона "Karud" 15й ранг
Spell.Spell_NoFireWeapon =
{
	duration		= 1,

	isBuff 			= false,
	target 			= ai.SpellTarget.LOCKED_TARGET,
	target_range	= 310,

	aura			= ai.Aura.DISABLED_WEAPON,
	apply_crowd_control_coef	= true,
	
	gun_spell_fx	   = "particles/gadget/disable_weapon_gun",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IonRay", },
	},
}

Spell.Spell_WeaponHacker =
{
	duration		= 8,

	isBuff 			= false,
	target 			= ai.SpellTarget.LOCKED_TARGET,
	target_range	= 310,
	aura			= ai.Aura.BROKEN_WEAPON,
	aura_param		= 1500,
	apply_crowd_control_coef	= true,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Suicide", },
	},

	gun_spell_fx	   = "particles/gadget/weapon_instability",
	gun_spell_fire_fx  = "particles/gadget/weaponhacker_gun_explosion",

	additional_auras =
	{
		{
			aura = ai.Aura.DAMAGE_THERMAL_PERIODIC,
			aura_param 		= 500,	--500
			duration		= 8,
			target_range	= 310,
			isBuff 			= false,
			apply_crowd_control_coef	= true,

			target 			= ai.SpellTarget.LOCKED_TARGET,
		  	aura_target =
			{
				target 			= ai.SpellTargetGeneral.HOLDER,
				relationship 	= ai.SpellTargetRelationship.ENEMY+ ai.SpellTargetRelationship.NEUTRAL,
				ai 				= ai.SpellTargetAi.NPC, --ai.SpellTarget.NPC,
			},
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Suicide", },
			},
			
		},
		{
			aura = ai.Aura.REDUCE_ROT_SPEED,
			aura_param 		= 100,	
			duration		= 8,
			target_range	= 310,
			isBuff 			= false,
			--apply_crowd_control_coef	= true,

			target 			= ai.SpellTarget.LOCKED_TARGET,
		  	--aura_target = ai.SpellTarget.LOCKED_TARGET,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Suicide", },
			},	
		},
	}

}


Spell.PairsShield_Host =
{
	duration			= 10,
	target				= ai.SpellTarget.CASTER,
	--aura				= ai.Aura.EMP_ABSORB_TO_SHIELD,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	influence_param		= 2000,

	isBuff				= true,

	shell_def 			= "PairsShield_HostShield",-- деф шкуры
--ScBaseEntity:
--  spell_on_ttl
--  explosion_on_ttl
--  spell_on_death
--  explosion
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield", },
	},
}
Spell.PairsShield_Target =
{
	--duration			= 10,
	target				= ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET_BY_CASTER,
	--aura				= ai.Aura.EMP_ABSORB_TO_SHIELD,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	isBuff				= true,
	shell_def 			= "PairsShield_HostShield",-- деф шкуры
--ScBaseEntity:
--  spell_on_ttl
--  explosion_on_ttl
--  spell_on_death
--  explosion
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield", },
	},
}

-- 61675: Phoenix - Модуль "Запутыватель частиц"
 --ai.Aura.SHIELD_LINK и ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET
Spell.LinkShield =
{
	aura				= ai.Aura.SHIELD_LINK,
	target				= ai.SpellTarget.CASTER,
	--aura_target			= ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET_BY_HOLDER,
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER + ai.SpellTargetGeneral.LOCKED_TARGET,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura_range			= 300,
	min_targets_count	= 2,
	isBuff				= true,
	duration			= 7,
	period				= 0.2,
	aura_param 			= 100,
	visual_entity 		= "LinkShieldModel",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldLink", },
	},
}

Spell.GrabFire =
{
	isBuff 			= false,

	target = 	{
					target = ai.SpellTargetGeneral.CONTEXT_TARGET,
					relationship	= ai.SpellTargetRelationship.ENEMY,
				},

	influence		= ai.Spell.IMPULSE,
	influence_param = 17,
	--influence_fx = "particles/weapons/other/grab_hit",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Grab", },
	},
}

Spell.PlasmaBlade =
{
	--duration		= 1,
	--period			= 0.2,

	isBuff 			= false,

	--target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	--target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	--aura_target		= { class = ai.SpellTargetClass.SHIP, area = ai.SpellTargetArea.AROUND, relationship = ai.SpellTargetRelationship.ENEMY },
	--aura_target 	= ai.SpellTarget.ENEMY_SHIPS_AROUND,

	target 				= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	target_range  		= 16,
	--aura_target		= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	--aura_target		= ai.SpellTarget.LOCKED_TARGET,
	
	

	aura			= ai.Aura.SLOW_MANEUVER,
	--diminish_control_aura = true, #0106767: СТ. Dag'tnith не накладывает дебаффа
	apply_crowd_control_coef	= true,
	--aura_range 		= 15,
	aura_param		= 1,
	duration		= 2.5,--5,

	--influence_fx = "particles/weapons/other/grab_hit",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaBlade", },
	},
}


Spell.GigantShieldResist =
{
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param		= 65, --40,
	isBuff 			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GigantShield", },
	},
}
Spell.GigantShieldSpeed =
{
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 0.35,--0.75,
	duration		= 30,
	dispell_flag	= ai.Dispell.ON_DAMAGE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	isBuff 			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
	},
}



Spell.TractorBeam =
{
	aura				= ai.Aura.SHIP_ATTRACTION,
	target				= ai.SpellTarget.CASTER,
	--aura_target			= ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET_BY_HOLDER,
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class 			= ai.SpellTargetClass.SHIP, --убрал каргошипы
		relationship 	= ai.SpellTargetRelationship.ENEMY+ ai.SpellTargetRelationship.NEUTRAL,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},

	--#67727: нужен и target_range и aura_range для корректной работы спелла
	--target_range			= 400, --чтобы был недоступен для активации, если цель дальше
	aura_range				= 400, --чтобы притягивал
	isBuff				= false,
	duration			= 5,
	period				= 0.2,
	aura_param 			= 20,
	ignore_subtype 			= true,
	aura_start_sound                = "sound/gadgets/TractorBeam/tb_activation",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_TractorBeam", },
	},
	additional_auras =
	{
		{
			aura = ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
			--aura_param = 3000, --damage
			aura_param = 100, --damage
			--aura_range = 4,
			target_range = 400, --#67727: был aura_range, с ним работало не корректно
			aura_target =
			{
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				class 			= ai.SpellTargetClass.SHIP+ai.SpellTargetClass.CARGOSHIP,
				relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
				signature		= ai.SignatureMask.HUGE,
			},
			ignore_subtype 	= true,
			isBuff 			= false,
			duration 		= 5,
			period 			= 0.2,
			ui_ico 			=
			{
				target_system = { tex = "ItemSubtype_TractorBeam", },
			},
		},
	},
}


Spell.RestoringIons_StartSpell =
{
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	isBuff				= true,
	shell_def 			= "RestoringIons_Shell",-- деф шкуры
--ScBaseEntity:
--  spell_on_ttl
--  explosion_on_ttl
--  spell_on_death
--  explosion
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield", },
	},
}

Spell.RestoringIons_EndSpell =
{
	aura_param		= 360,
	period			= 1,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_target		= ai.SpellTarget.HOLDER,
	isBuff			= true,

	aura_holder_def	= "HealBot",

	duration 		= 3,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RestoringIons", },
	},
	aura_fx				= "particles/ships/race4_l_reaper_shield_healing",
	visual_entity		= "Model_ReaperShieldHealing",
	visual_entity_bone	= "main",
}

Spell.Kukan =
{
	aura_param		= 900,
	period			= 0.2,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.IN_CYLINDER,  --цилиндр радиуса aura_range и длиной target_range
	},
	aura_extra_radius	= 3.75,	--
	aura_range	 		= 20,	-- и длиной  может переопределяется aura_target_offset из модуля
	aura_target_offset 	= Vec3( 0, 0, -10 ),
	isBuff 				= false,
	ui_ico =
	{
		target_system 	= { tex = "CritChance", },
	},
}

--- #62798 Перехватчик РЭБ Иерихона "Karud". Пассивный модуль. Щит
Spell.Spell_Unlock =
{
	aura			= ai.Aura.DISABLE_LOCK,
	-- текущая реализация (вешает дебафы DISABLE_LOCK на цели вокруг)
	target 			= ai.SpellTarget.ENEMY_AROUND,
	aura_target 	= ai.SpellTarget.HOLDER,
	target_range	= 150,
	apply_crowd_control_coef = true,
	--конец ткущей реализации

	--блок прошлая реализация (корабль с уничтоженным щитом держит ауру DISABLE_LOCK вокруг себя)
	--target			= ai.SpellTarget.CASTER,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	--aura_range 		= 150,
	--конец блока прошлой реализации

	duration		= 5.0,
	aura_fx			= "particles/gadget/aura_wave_green",
	ui_ico =
	{
		target_system 	= { tex = "microwarp_disable_lock_ico", },
	},
}


Spell.GreenHealS =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	aura_param			= 100,
	isBuff				= true,
	aura 				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_target 		= ai.SpellTarget.HOLDER,
	dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_CrystallRegen", },
		target_system 	= { tex = "CrystallRegen", },
	},
}

Spell.GreenHealM =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	aura_param			= 200,
	isBuff				= true,
	aura 				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_target 		= ai.SpellTarget.HOLDER,
	dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_CrystallRegen", },
		target_system 	= { tex = "CrystallRegen", },
	},
}

Spell.GreenHealL =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	aura_param			= 300,
	isBuff				= true,
	aura 				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_target 		= ai.SpellTarget.HOLDER,
	dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_CrystallRegen", },
		target_system 	= { tex = "CrystallRegen", },
	},
}

Spell.GreenHealH =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	aura_param			= 400,
	isBuff				= true,
	aura 				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_target 		= ai.SpellTarget.HOLDER,
	dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_CrystallRegen", },
		target_system 	= { tex = "CrystallRegen", },
	},
}

Spell.GreenHalfHeal =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	isBuff				= true,
	aura 				= ai.Aura.HEALING_MOD,
	aura_param			= -1,
	aura_target 		= ai.SpellTarget.HOLDER,
	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_CrystallStructure", },
		target_system 	= { tex = "CrystallStructure", },
	},
}

Spell.GreenQuarterHeal =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	isBuff				= true,
	aura 				= ai.Aura.HEALING_MOD,
	aura_param			= -1,
	aura_target 		= ai.SpellTarget.HOLDER,
	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_CrystallStructure", },
		target_system 	= { tex = "CrystallStructure", },
	},
}

--- #64192: Alienn Summer Part 4&5. Пассивный модуль чужих
Spell.Spell_GreenArmorFocusResist =
{
	isBuff				= true,
	aura 				= ai.Aura.HULL_RESIST_ALL,
	target				= ai.SpellTarget.CASTER,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_param			= 8, --11
	--aura_param_stages	= { 1, 2, 3, 5, 7, 9, 11, 13 },     3   14   25 ---  146
	aura_param_stages	= { 1, 2, 3, 4, 5, 6, 7, 8 }, -- 0=11 1=19 2=27     ----  8+=75
--	aura_param			= 16,
--	aura_param_stages	= { 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5 }, -- 3 27 35     ----  83

--	duration			= 10, --focus_timeout в ships.lua
	
	ignore_stacks		= true, -- 3 модуля могут работать одновременно
	ignore_subtype		= true, -- 3 модуля могут работать одновременно
	diminish_aura_param = true, -- Чтоб не имбовало
	--disable_zero_stage	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenArmorFocusResist", },
	},
}
Spell.Spell_GreenJump =
{
	influence_param	= -250,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	target 			= ai.SpellTarget.CASTER ,
	--target 		= ai.SpellTarget.SHIPS_AROUND,
	--target_range		= 15,
	cast_fx				= "particles/gadget/jump_green",
	cast_position_fx 	= "particles/gadget/jump_green",
	cast_sound 			= "sound/el_modules/GreenJumpOnStrafe",
	fish_eye_time = "0.5",
	fish_eye_max = "0.25",
	--scale_on_weapon	= true

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ReverseThruster", },
	},
}

Spell.Spell_GreenIdleSpeed =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	aura_param			= 0.5,
	isBuff				= true,
	aura 				= ai.Aura.ENGINE_MOD,
	aura_target 		= ai.SpellTarget.HOLDER,
	dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenIdleSpeed", },
	},
}


Spell.GreenTimeBoost_Base = {
	inherit = 'TimeBoost_T1_Base',
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenTimeBoost", },
	},
	aura_fx = "particles/gadget/overdrive",
}

Spell.GreenTimeBoost_N = {
	target 				= ai.SpellTarget.CASTER,
	isBuff				= true,
	duration 			= 8,
	aura 				= ai.Aura.SPELL_ON_DEATH_SOMEONE,
	--в ауре пишем дополниельно:
	trigger_target 		=  -- таблица таргет
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL + ai.SpellTargetRelationship.ALLY,
			area 			= ai.SpellTargetArea.AROUND,
			vitality 		= ai.SpellTargetVitality.DEAD,
		},
	trigger_range 		= 200, -- расстояние
	target_spell 		= "OnDeathGreenTimeBoost_N", -- спелл который накладывается, если кто то умер
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenTimeBoost", },
	},
	aura_fx = "particles/gadget/matter_absorber",
}

Spell.OnDeath_GreenTimeBoost_N = {
	duration			= 2,
	target 				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param			= 700,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenTimeBoost", },
	},
	aura_fx = "particles/gadget/matter_absorber",
}

--

Spell.FrySatelliteRestore =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	duration			= 3,
	aura_param			= 200,
	isBuff				= true,
	aura 				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_target 		= ai.SpellTarget.HOLDER,
	ignore_subtype		= true,
	ignore_stacks		= true,

	aura_sound = "sound/el_modules/FrySatelliteRestore",

	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_CrystallRegen", },
		target_system 	= { tex = "CrystallRegen", },
	},
}


Spell.PermanentAntiRadar =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	isBuff				= true,
	aura 				= ai.Aura.ANTI_RADAR,
	aura_target 		= ai.SpellTarget.HOLDER,
	dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_CAPTURE,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PermanentAntiRadar", },
	},
	aura_fx = "StealthEffect",
}
Spell.PermanentAntiRadar_debuff =
{
	target 				= ai.SpellTarget.CASTER,
	period				= 1,
	isBuff				= true,
	aura 				= ai.Aura.SHIELD_BURN_PERIODIC,
	aura_param			= 0.05,
	aura_target 		= ai.SpellTarget.HOLDER,
	dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_CAPTURE,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PermanentAntiRadar", },
	},
}

Spell.Spell_ProximityMineGreen =
{
	influence 			= ai.Spell.CAST_SPELLS,
	spells				= { 'Spell_ProximityMineGreen1', 'Spell_ProximityMineGreen2' },
}

Spell.Spell_ProximityMineGreen1 =
{
	target				= ai.SpellTarget.ENEMY_AROUND,
	aura				= ai.Aura.COOLDOWN_MOD,
	aura_param			= 2,
	target_range		= 60,
	duration			= 10,--20,
	isBuff				= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_ProximityMineGreen", }, },
}
Spell.Spell_ProximityMineGreen2 =
{
	target				= ai.SpellTarget.ENEMY_AROUND,
	aura				= ai.Aura.REDUCE_COOLING,
	aura_param			= 2,
	target_range		= 60,
	duration			= 10,--20,
	isBuff				= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_ProximityMineGreen", }, },
}

-------------
Spell.RamHull_debuff =
{
	target = 	{
					target = ai.SpellTargetGeneral.CONTEXT_TARGET,
				},
	--period				= 1,
	isBuff				= false,
	aura 				= ai.Aura.STUN,  --однако, надо заменить STASIS на STUN, потмоу что если не сбрасывать скорость, то можно застрять в астероиде при варпе
	ignore_additional_power	= true, -- спелл должен игнорировать усиления
	diminish_control_aura = false,-- спелл должен игнорировать демнинишинг.
	aura_target 		= ai.SpellTarget.HOLDER,
 --дурейшин(время_стана) = урон_который_был_проигнорирован * дурейшин_спелла
 --дурейшин_спелла = прописан в спелле
 --спелл прописан в модуле типа "spell_on_collision"
	duration			= 1/5000,  ---5000урона_от_столкновения = 1 сек
}



----------------------------------------
Spell.EmergencyShell =
{
	influence 			= ai.Spell.CAST_SPELLS,
	spells				= { 'EmergencyShell_main', 'EmergencyShell_debuff' }
}
Spell.EmergencyShell_main =
{
	duration			= 10,
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	influence_param		= 2000,

	isBuff				= true,

	shell_def 			= "EmergencyShell_Shield",-- деф шкуры
--ScBaseEntity:
--  spell_on_ttl
--  explosion_on_ttl
--  spell_on_death
--  explosion
	ui_ico = { target_system = { tex = "ItemSubtype_EmergencyShell", },},

--[[ 	additional_auras =
	{
		{
			target			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura 			= ai.Aura.SLOW_MOVEMENT,
			aura_param 		= 2,
			duration		= 10,
			isBuff 			= true,
		},
	}, ]]
}
Spell.EmergencyShell_debuff =
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura 			= ai.Aura.SLOW_MOVEMENT,
	-- aura_param 		= 1.9411, -- -33%
		aura_param 		= 0.5152, -- -33%
	duration		= 10,
	isBuff 			= false,
	ignore_additional_power = true,
	aura_fx = "particles/gadget/alien_emergency_shell",
	ui_ico = { target_system = { tex = "ItemSubtype_EmergencyShell", },},
}
--

Spell.Debuff_GreenInvulnerability =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target =
		{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.LOCKER_OF_HOLDER,
		},
	aura_range 		= 10000,
	aura_param		= 100,
	aura_param_add	= 100,
	period			= 0.42,
	duration		= 5,
	aura 			= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,

	period_sound	= "sound/el_modules/aftershock_fire",
	period_module_fx = "particles/gadget/damage_alien",
	period_module_my_fx = "particles/gadget/damage_alien",
}


Spell.SpellAfterShock =
{
	target = ai.SpellTarget.CASTER,
	aura_target =
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
	aura_range = 150,
	period_sound	 = "sound/el_modules/aftershock_fire",
}


--EnemyAnalyzer
-----------------------------------------------------
Spell.Spell_EnemyAnalyzer_N = {
	target 				= ai.SpellTarget.CASTER,
	isBuff				= true,
	aura 				= ai.Aura.SPELL_ON_DEATH_SOMEONE,
	--в ауре пишем дополниельно:
	trigger_target 		=  -- таблица таргет
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL + ai.SpellTargetRelationship.ALLY,
			area 			= ai.SpellTargetArea.AROUND,
		},
	trigger_range 		= 200, -- расстояние
	target_spell 		= "OnDeath_EnemyAnalyzer_N", -- спелл который накладывается, если кто то умер
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnemyAnalyzer", },
	},
}

Spell.OnDeath_EnemyAnalyzer_N = {
	target 				= ai.SpellTarget.CASTER,
	duration			= 25,
	aura_param			= 0.25,
	isBuff				= true,
	aura 				= ai.Aura.DAMAGE_MOD,
	aura_target 		= ai.SpellTarget.HOLDER,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnemyAnalyzer", },
	},
}

--MatterAbsorber
-----------------------------------------------------
--Это ушло в модуль.
--[[ Spell.Spell_MatterAbsorber_N = {
	target 				= ai.SpellTarget.CASTER,
	isBuff				= true,
	aura 				= ai.Aura.SPELL_ON_DEATH_SOMEONE,
	--в ауре пишем дополниельно:
	trigger_target 		=  -- таблица таргет
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL + ai.SpellTargetRelationship.ALLY,
			area 			= ai.SpellTargetArea.AROUND,
		},
	trigger_range 		= 200, -- расстояние
	target_spell 		= "OnDeath_MatterAbsorber_N", -- спелл который накладывается, если кто то умер
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MatterAbsorber", },
	},
}
 ]]
Spell.OnDeath_MatterAbsorber_N = {
	target 				= ai.SpellTarget.CASTER,
	duration			= 25,
	aura_param			= 10,
	isBuff				= true,
	aura 				= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_target 		= ai.SpellTarget.HOLDER,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MatterAbsorber", },
	},
	aura_fx = "particles/gadget/matter_absorber",
}

--69929: Зеленые корабли: Разведка "Корпус: Сепаратор флуктуаций вакуума"
Spell.SpecialToArmorRestore = {
	target 				= ai.SpellTarget.CASTER,
	duration			= 2,
	period				= 0.5,
	aura_param			= 10,
	isBuff				= true,
	aura 				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_fx 			= "particles/gadget/matter_absorber",
}

--69931: Зеленые корабли: Разведка "Компьютер: Подготовительные расчеты"
Spell.SpecialToDamage = {
	target 				= ai.SpellTarget.CASTER,
	duration			= 7,
	period				= 1,
	aura_param			= 0.35,
	isBuff				= true,
	aura 				= ai.Aura.DAMAGE_MOD,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_fx 			= "particles/other/greenship_special_damage",
}

--
--IonStream
-- --67134: Зеленые корабли: Ударный Активный модуль: "Ионный поток"
Spell.IonStream =
{
	--target			= ai.SpellTarget.CASTER,
	--target 			= ai.SpellTarget.INFLICTOR,
	--target 			= ai.SpellTarget.LOCKED_TARGET,
	target =
		{
			target = ai.SpellTargetGeneral.CONTEXT_TARGET,
			--misc			= ai.SpellTargetMisc.POSITION,
		},
	aura_target 	=
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
			area 			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY+ai.SpellTargetRelationship.NEUTRAL,
		},
	aura 			= ai.Aura.DAMAGE_EMP_SCALED,
	duration		= 1.5,
	aura_range		= 100,
	aura_param		= 100,
	isBuff			= false,
	aura_fx			= "particles/gadget/green_heal2",
	--period_beam_fx = "particles/gadget/pulsar_g2d2_beam",
	--aura_fx			= "particles/gadget/crystal_cloud",
}

--
--#68249
--Spell_CrystalSpit
Spell.Spell_CrystalSpitBase = {
	influence 			= ai.Spell.CAST_SPELLS,
	spells 				= {"Spell_CrystalSpitHaste", "Spell_CrystalSpit"},
}


Spell.Spell_CrystalSpit =
{
	isBuff			= false,
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 250,
	aura_param_add  = 500, --расчет на 3 секунды полета.
	period			= 0.2,
	target 			= ai.SpellTarget.INFLICTOR,
	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 65,
	aura_range_add  = -18.34, --расчет на 3 секунды полета.
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IsotopeHarvester", },
	},
}

Spell.Spell_CrystalSpitHaste =
{
	isBuff			= true,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 0.75,
	duration		= 5,
	target 			=
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target 	=
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IsotopeHarvester", },
	},
	aura_fx		= "particles/gadget/overdrive",
}
Spell.BonusSpit_HealHull =
{
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param 		= 2000.0,
	duration		= 2,
	period			= 1,
	isBuff			= true,
	aura_fx = "particles/gadget/matter_absorber",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
}


---70073: Зеленые корабли: Разведка "Спецмодуль-базовый: Прыжок с ускорением команды"
Spell.MicroWarpTunnel =
{
	-- DIRECTION_DEPEND_FAST_MOVEMENT изменяет скорость так
	-- MAX( 0, aura_parm * Скалярное_произведение( вектор_направления_корабля, вектор_нормаль_цилиндра)
	--(работает только для цилиндрический аур)
	target 			= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR 
	aura_holder_def = "AuraHolderEntityHackDamageImmune",
	aura			= ai.Aura.DIRECTION_DEPEND_FAST_MOVEMENT,

	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP,
						area 			= ai.SpellTargetArea.IN_CYLINDER,
						relationship	= ai.SpellTargetRelationship.ALLY,
					},
	aura_target_offset	= Vec3( 0, 0, -1 ),
	aura_range	 	= 450,		--дальность луча
	aura_extra_radius = 75,		--радиус луча

	aura_param		= 0.4,
	duration		= 15,

    aura_fx         = "particles/other/jump_comand_axeleration",
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_MicroWarpTunnel", }, },
}

Spell.CrystalJump =
{
	target			= ai.SpellTarget.CASTER,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	influence_param	= -400,

	cast_sound 		= "sound/gadgets/ReverseThruster_activate",

	--> урон_по_цели_будет = базовый_урон * ( 1 + текущее_расстояние_телепорта / Расстояние_увеличения_урона )
	--base_damage 	= 5000,-- базовый_урон
	--dist_damage 	= 100,-- Расстояние_увеличения_урона

	cast_position_fx = "particles/other/jump_comand_start",
	--cast_position_fx = "particles/gadget/dash_green",
	--cast_screen_fx = "particles/screen/jump",
	base_damage 	= 1500,-- базовый_урон
	dist_damage 	= 150,-- Расстояние_увеличения_урона

}

------------------------------------
--  71069: Зеленые корабли: Разведка "Спецмодуль-пять: Прыжок с дамагом всех вокруг"
------------------------------------
Spell.CrystalJumpDamage =
{
	target			= ai.SpellTarget.CASTER,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	influence_param	= -500,

	cast_sound 		= "sound/gadgets/ReverseThruster_activate",

	--> урон_по_цели_будет = базовый_урон * ( 1 + текущее_расстояние_телепорта / Расстояние_увеличения_урона )
	base_damage 	= 2500,-- базовый_урон
	dist_damage 	= 150,-- Расстояние_увеличения_урона
}
Spell.MicroWarpDamageArray =
{
	influence		= ai.Spell.CAST_SPELLS,
	spells			= { 'MicroWarpDamageLine', 'MicroWarpDamageStart' },
}
Spell.MicroWarpDamageLine =
{
	target 			= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR
	aura_holder_def = "AuraHolderEntityHackDamageImmune",
	aura			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
						area 			= ai.SpellTargetArea.IN_CYLINDER,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},

	aura_target_offset	= Vec3( 0, 0, -1 ),
	aura_range		= 520,		--дальность луча

	aura_extra_radius= 60,		--радиус луча

	aura_param		= 8000 / (4/0.2+1),
	duration		= 4,
	period			= 0.2,
	isBuff			= false,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_MicroWarpDamage", }, },
	cast_position_fx = "particles/gadget/huge/jump_damage_cylinder",
	nebula 			= "Effects_Nebula_GreenCylinder",
}
Spell.MicroWarpDamageStart =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura_holder_def = "AuraHolderEntityHackDamageImmune",
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	--aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					},
	aura_range 		= 10,
	aura_range_add	= (120-10)/(6),
	aura_param		= 6000/(6/0.5+1), --6000/(6/0.5)
	duration		= 6,
	period 			= 0.5,
	isBuff			= false,
	nebula 			= "Effects_Nebula_GreenSphere",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_MicroWarpDamage", }, },
}


--- #69585: Зеленые корабли: Разведка "Распрыги"
Spell.CrystalJumpSeries =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.SLOW_MOVEMENT,
	duration		= 0.5,
	aura_param		= 0.5,
	gameplay_specific	= true,
	diminish_control_aura = false,
	isBuff			= false,
	spell_on_cancel	= "CrystalJumpSeries2",
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_CrystalJumpSeries" } }
}
Spell.CrystalJumpSeries2 =
{
	target			= ai.SpellTarget.CASTER,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	influence_param	= -200,
	cast_position_fx = "particles/gadget/fueldrop_sphere",
	cast_sound 		= "sound/gadgets/ReverseThruster_activate",
	--> урон_по_цели_будет = базовый_урон * ( 1 + текущее_расстояние_телепорта / Расстояние_увеличения_урона )
	base_damage 	= 1500,-- базовый_урон
	dist_damage 	= 150,-- Расстояние_увеличения_урона
	--aura_execution_delay = 0.5,
}

Spell.Damage_CrystalJumpSeries =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	--aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	aura_holder_def = "AuraHolderEntityHackDamageImmune",
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
						--relationship	= ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.NEUTRAL,
					},
	aura_range 		= 10,

	aura_range_add	= (40-10)/(6),
	aura_param		= 10,
	duration		= 6,
	period 			= 0.5,
	isBuff			= false,
	nebula			= "Effects_Nebula_FuelDrop",
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_CrystalJumpSeries" } }
}



--66727: Зеленые корабли: Разведка Нарождающаяся звезда
Spell.Spell_GrowingStar =
{
	isBuff			= false,
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 2,
	--aura_param_add  = 500, --расчет на 4 секунды полета.
	period			= 0.2,
	target 			= ai.SpellTarget.INFLICTOR,
	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 16,  -- радиус замедления на 150м больше радиуса урона
	aura_range_add  = 25, --расчет на 5 секунды полета.
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IsotopeHarvester", },
	},
}


--70562: Зеленые корабли: Разведка активка "Потоковый микропеленгатор"
Spell.Spell_GreenBeacon =
{
	aura_range		= 350,
	aura_param		= 160,
	period			= 1,
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura			= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
	aura_target		= {class=ai.SpellTargetClass.SHIP,area=ai.SpellTargetArea.AROUND,relationship=ai.SpellTargetRelationship.ENEMY,vitality=ai.SpellTargetVitality.ALIVE,misc=ai.SpellTargetMisc.VISIBLE_BY_HOLDER},
	isBuff			= false,
	aura_holder_def	= "SpyGreenBeacon",
	duration 		= 30,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenBeacon", },
	},
	additional_auras =
	{
		{
			isBuff			= false,
			aura_target		= {class=ai.SpellTargetClass.SHIP,area=ai.SpellTargetArea.AROUND,relationship=ai.SpellTargetRelationship.ENEMY,vitality=ai.SpellTargetVitality.ALIVE,misc=ai.SpellTargetMisc.VISIBLE_BY_HOLDER,},
			aura_range		= 350,
			target			= ai.SpellTarget.CASTER_POSITION_CASTER,
			aura			= ai.Aura.SPY_DRONE,
			ignore_subtype_if_other_team = true,
			duration		= 30,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_GreenBeacon", },
			},
		}
	}
}

--CorrosiveGun
Spell.CorrosiveGun =
{
--[[ 	target			=
					{
						target 	= ai.SpellTargetGeneral.INFLICTOR,--ai.SpellTargetGeneral.LOCKED_TARGET, --ai.SpellTargetGeneral.AIM, --ai.SpellTargetGeneral.INFLICTOR,
						--misc	= ai.SpellTargetMisc.POSITION,
					},
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP,

						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					}, ]]
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		--target = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC, -- -50% хила
	duration		= 1.4,
	aura_param		= 0, --33% непрерывного урона
	damage_to_spell_aura_param = true,
	period			= 0.35,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CorrosiveGun", },
	},
	--aura_target_directed_fx 	= "particles/weapons/laser/radiation_beam_heat_aura",
}


--Module_DroneScavenger
--------------------------------------------------------
--"DroneScavenger", "DroneScavengerReturnTrigger", "DroneScavengerHeal"
--Дамаг от дрона
Spell.DroneScavenger =
{
	isBuff 			= false,

	target 			=
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO,
		relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param		= 500,
	duration		= 8,
	period			= 1,
	dispell_flag	= ai.Dispell.ON_COLLISION,

	aura_fx = "particles/gadget/drone_scavenger_spell",
	aura_sound 		= "sound/weapons/laser/basic",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DroneScavenger_Debuff", },
	},

	
	additional_auras = -- SC-116450 Балансные правки - Май 2022
	{
		{
			aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
			aura_target 	= 
			{
				target					= ai.SpellTargetGeneral.HOLDER,
				signature				= ai.SignatureMask.LARGE,
			},
			isBuff			= false,
			dispell_flag	= ai.Dispell.ON_COLLISION,
			aura_param		= 600,
			duration		= 8,
			period			= 1,
			aura_fx = "particles/gadget/drone_scavenger_spell",
			aura_sound 		= "sound/weapons/laser/basic",
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_DroneScavenger_Debuff", },
			},
		},
		{
			aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
			aura_target 	= 
			{
				target					= ai.SpellTargetGeneral.HOLDER,
				signature				= ai.SignatureMask.HUGE,
			},
			isBuff			= false,
			dispell_flag	= ai.Dispell.ON_COLLISION,
			aura_param		= 800,
			duration		= 8,
			period			= 1,
			aura_fx = "particles/gadget/drone_scavenger_spell",
			aura_sound 		= "sound/weapons/laser/basic",
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_DroneScavenger_Debuff", },
			},
		},
	}
}
--Дрон сам
Spell.DroneScavengerReturnTrigger =
{
	isBuff 			= false,
	target 			=
		{
			target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO,
			relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		},
	aura			= ai.Aura.DEATH_ROCKET,
	death_rocket	= "Projectile_DroneScavengerReturn",
	duration		= 8,
	dispell_flag	= ai.Dispell.ON_COLLISION,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DroneScavenger", },
	},
	isInvisible 	= true,  --#67898
	aura_sound 		= "sound/weapons/laser/basic",
}
--Хил от дрона
Spell.DroneScavengerHeal =
{
	isBuff 			= true,

	--target 			= ai.SpellTarget.LOCKED_TARGET, - не работает в алли цель
	target 	=
	{
		target 		= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},

	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 2220, -- у зеленых штраф 50% на хил реальная цифра 1000*(8+1)
	duration		= 4,
	period			= 1,

	aura_fx = "particles/gadget/matter_absorber",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DroneScavenger", },
	},
	aura_sound 		= "sound/aura/heal",
}


----------------------------------------------
Spell.MissileReload =
{
	influence		= ai.Spell.RELOAD_ROCKETS,
	target			= ai.SpellTarget.CASTER,
	influence_fx	= "particles/weapons/misiles_reload",
}

Spell.CrystalRageMode_disableLock =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura 			= ai.Aura.DISABLE_LOCK,
	duration		= 12,
	ignore_additional_power = true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CrystalRageMode", },
	},
}
Spell.CrystalRageMode =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.5,
	duration		= 12,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CrystalRageMode", },
	},
}

----------------------------------------
Spell.CrystalAttackerCloud_Damage = -- СМ тарги основной
{
	influence	= ai.Spell.CAST_SPELLS,
	spells		= { 'CrystalAttackerCloud_DamageSM', 'CrystalAttackerCloud_DamageL', 'CrystalAttackerCloud_DamageH' },
}

Spell.CrystalAttackerCloud_DamageSM = -- перехваты и штурмовики
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	=
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
			area 			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			signature				= ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM,
		},
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	duration		= 8.5,
	period			= 0.25,
	aura_range		= 75,
	aura_param		= 100,
	isBuff			= false,
	--period_beam_fx = "particles/gadget/pulsar_g2d2_beam",
	aura_fx		= "particles/gadget/speed_adaptation",
	--aura_fx2			= "particles/gadget/speed_adaptation_start",
	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_CrystalAttackerCloud_Debuff", },
		target_system 	= { tex = "ItemSubtype_CrystalAttackerCloud", },
	},
	
}

Spell.CrystalAttackerCloud_DamageL = -- фрегаты
{

	aura_target 	=
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
			area 			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			signature		= ai.SignatureMask.LARGE,
		},	
	inherit = "CrystalAttackerCloud_DamageSM",
	aura_param		= 120,
}

Spell.CrystalAttackerCloud_DamageH = -- Huge
{
	aura_target 	=
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
			area 			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			signature		= ai.SignatureMask.HUGE,
		},	
	inherit = "CrystalAttackerCloud_DamageSM",
	aura_param		= 120,
}
-------RANK 5 ----------
Spell.CrystalAttackerCloud_Damage_R5 = -- СМ тарги основной
{
	influence	= ai.Spell.CAST_SPELLS,
	spells		= { 'CrystalAttackerCloud_DamageSM_R5', 'CrystalAttackerCloud_DamageL_R5', 'CrystalAttackerCloud_DamageH_R5' },
}

Spell.CrystalAttackerCloud_DamageSM_R5 = --- перехваты и штурмовики
{
	inherit = "CrystalAttackerCloud_DamageSM",
	aura_param		= 290,
}

Spell.CrystalAttackerCloud_DamageL_R5 = --- фрегаты
{
	inherit = "CrystalAttackerCloud_DamageL",
	aura_param		= 350,
}

Spell.CrystalAttackerCloud_DamageH_R5 = -- Huge
{
	inherit = "CrystalAttackerCloud_DamageH",
	aura_param		= 410,
}

-------RANK 9 ----------
Spell.CrystalAttackerCloud_Damage_R9 = -- СМ тарги основной
{
	influence	= ai.Spell.CAST_SPELLS,
	spells		= { 'CrystalAttackerCloud_DamageSM_R9', 'CrystalAttackerCloud_DamageL_R9', 'CrystalAttackerCloud_DamageH_R9' },
}

Spell.CrystalAttackerCloud_DamageSM_R9 = --- перехваты и штурмовики
{
	inherit = "CrystalAttackerCloud_DamageSM",
	aura_param		= 340,
}

Spell.CrystalAttackerCloud_DamageL_R9 = --- фрегаты
{
	inherit = "CrystalAttackerCloud_DamageL",
	aura_param		= 410,
}

Spell.CrystalAttackerCloud_DamageH_R9 = -- Huge
{
	inherit = "CrystalAttackerCloud_DamageH",
	aura_param		= 480,
}

-------RANK 13 ----------
Spell.CrystalAttackerCloud_Damage_R13 = -- СМ тарги основной
{
	influence	= ai.Spell.CAST_SPELLS,
	spells		= { 'CrystalAttackerCloud_DamageSM_R13', 'CrystalAttackerCloud_DamageL_R13', 'CrystalAttackerCloud_DamageH_R13' },
}

Spell.CrystalAttackerCloud_DamageSM_R13 = --- перехваты и штурмовики
{
	inherit = "CrystalAttackerCloud_DamageSM",
	aura_param		= 360,
}

Spell.CrystalAttackerCloud_DamageL_R13 = --- фрегаты
{
	inherit = "CrystalAttackerCloud_DamageL",
	aura_param		= 430,
}

Spell.CrystalAttackerCloud_DamageH_R13 = -- Huge
{
	inherit = "CrystalAttackerCloud_DamageH",
	aura_param		= 500,
}

-------RANK 15 ----------
Spell.CrystalAttackerCloud_Damage_R15 = -- СМ тарги основной
{
	influence	= ai.Spell.CAST_SPELLS,
	spells		= { 'CrystalAttackerCloud_DamageSM_R15', 'CrystalAttackerCloud_DamageL_R15', 'CrystalAttackerCloud_DamageH_R15' },
}

Spell.CrystalAttackerCloud_DamageSM_R15 = --- перехваты и штурмовики
{
	inherit = "CrystalAttackerCloud_DamageSM",
	aura_param		= 380,
}

Spell.CrystalAttackerCloud_DamageL_R15 = --- фрегаты
{
	inherit = "CrystalAttackerCloud_DamageL",
	aura_param		= 455,
}

Spell.CrystalAttackerCloud_DamageH_R15 = -- Huge
{
	inherit = "CrystalAttackerCloud_DamageH",
	aura_param		= 530,
}
----------
Spell.CrystalAttackerCloud_Restore =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura 			= ai.Aura.DAMAGE_TO_HEAL,
	duration		= 8.5,
	period			= 0.2,
	aura_param		= 1.1,
	isBuff			= true,
	--aura_fx			= "particles/gadget/speed_adaptation_aura",
	aura_fx			= "particles/gadget/matter_absorber",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CrystalAttackerCloud_Debuff", },
		--target_system 	= { tex = "ItemSubtype_CrystalAttackerCloud", },
	},
}

----------------------------------------
--66856: Зеленые корабли: Разведка активка Зеленые выбросы
Spell.Spell_FuelEmissions =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "Spell_FuelEmissionsCharge",
	duration		= 5,
	period			= 0.5,
	isBuff			= true,
	aura_fx			= "particles/gadget/fueldrop",
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_FuelEmissions" } },

}

Spell.Spell_FuelEmissionsCharge =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					},
	aura_range 		= 25,
	aura_range_add	= (50-25)/(6/0.5),
	aura_param		= 10,
	aura_param_add	= -0.2,
	duration		= 6,
	period 			= 0.5,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff			= false,
	nebula			= "Effects_Nebula_Emissions",
	cast_position_fx	= "particles/gadget/fueldrop_sphere_big",
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_FuelEmissions" } },
}


Spell.BackwardTime_Buff =
{
	isBuff			= true,
	aura			= ai.Aura.FAST_MANEUVER,
	aura_param		= 0.10,
	target 			=
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target 	=
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BackwardTime", },
	},
	--period_fx		= "particles/weapons/other/crystalspit_boost",
}


--------------------------------------------------------
--#66724: Зеленые корабли: Разведка Дрон-компаньон
Spell.Companion_Buff =
{
	isBuff			= true,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 0.2,
	--duration		= 5,
	target 			=
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target 	=
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IsotopeHarvester", },
	},
	--period_fx		= "particles/weapons/other/crystalspit_boost",
}

Spell.Companion_Debuff =
{
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 2,
	aura_range		= 75,
	target 			=
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		--target = ai.SpellTargetGeneral.CASTER,
	},
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Companion", },
	},
	additional_auras =
	{
		{
			aura			= ai.Aura.SLOW_MANEUVER,
			aura_param		= 0.538,
			aura_range		= 75,
			apply_crowd_control_coef	= true,
			target 			=
			{
				target = ai.SpellTargetGeneral.LOCKED_TARGET,
				--target = ai.SpellTargetGeneral.CASTER,
			},
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Companion", },
			},
		},
	},
	--period_fx = "particles/other/greenship_drone_beam",
	aura_fx = "particles/gadget/slow_movement",
	--period_fx		= "",
}

--при потере корпуса отпрыг вперед
--#71534
Spell.Spell_EmergencyJump =
{
	influence		= ai.Spell.CAST_SPELLS,
	spells			= { 'Spell_EmergencyJump_Jump', 'Spell_GreenWarpCooldown' },
}
Spell.Spell_EmergencyJump_Jump =
{
	influence_param	= -200,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	target 			= ai.SpellTarget.CASTER ,
	cast_fx		= "particles/gadget/jump_green",
	cast_position_fx = "particles/gadget/jump_green",
	--cast_screen_fx = "particles/screen/jump",
	cast_sound 		= "sound/el_modules/GreenJumpOnStrafe",
	fish_eye_time = "0.5",
	fish_eye_max = "0.25",
	

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EmergencyJump", },

	},
}
Spell.Spell_GreenWarpCooldown =
{
	influence			= ai.Spell.APPLY_AURA,
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.DISABLE_WARP,
	duration			= 10,
	gameplay_specific	= true,
	
		isBuff			= false, -- SC-118152
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EmergencyJump", },
	},
}

----------------------------------------
--- #64191: Alienn Summer. Part 4&5. Активный модуль чужих
-- вероятно спелл работает неверно   #82600
Spell.Spell_EnergyReflector =
{
	influence				= ai.Spell.APPLY_AURA,
	target					= ai.SpellTarget.CASTER,
	aura 					= ai.Aura.DAMAGE_REFLECT,
	aura_target 			= --ai.SpellTarget.ALL_IN_CYLINDER_EXCLUDE_SELF,
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
			area 			= ai.SpellTargetArea.IN_CYLINDER,
			relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		},

	fixed_cylinder_target = false,

	aura_range	 			= 400, --дальность луча
	aura_extra_radius 		= 3,   --радиус луча
	aura_param				= 10000000,
	duration 				= 3.5,
	period					= 0.5,
	isBuff					= false,

	holder_work_beam_fx		= "particles/gadget/energy_refractor_beam",
	ray_sound 				= "sound/destroyer/TRay_beam",
	aura_fx					= "particles/gadget/energy_refractor",

	ignore_additional_power = true, --игнорит param_modificator из вызывающего модуля

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReflector", },
	},
	
	additional_auras =
	{
		{
			influence 	= ai.Spell.APPLY_AURA,
			aura 		= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
				area 			= ai.SpellTargetArea.IN_CYLINDER,
				relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			},
			
			fixed_cylinder_target	= false,

			aura_range	 			= 400, --дальность луча
			aura_extra_radius 		= 3,   --радиус луча
			aura_param				= 180,
			duration 				= 3.5,
			period					= 0.5,
			isBuff					= false,
			hud_visible 			= false,
			
			ignore_additional_power = true, --игнорит param_modificator из вызывающего модуля
		},
	}
}

Spell.Spell_EnergyReflectorTournament1 =
{
	inherit	= "Spell_EnergyReflector",
	holder_work_beam_fx		= "particles/gadget/energy_refractor_beam_violet",
	aura_fx					= "particles/gadget/energy_refractor_violet",
}

Spell.Spell_EnergyReflectorTournament2 =
{
	inherit	= "Spell_EnergyReflector",
	holder_work_beam_fx		= "particles/gadget/energy_refractor_beam_blue",
	aura_fx					= "particles/gadget/energy_refractor_blue",
}

Spell.Spell_EnergyReflectorTournament3 =
{
	inherit	= "Spell_EnergyReflector",
	holder_work_beam_fx		= "particles/gadget/energy_refractor_beam_orange",
	aura_fx					= "particles/gadget/energy_refractor_orange",
}

Spell.Spell_EnergyReflResist =
{
	isBuff				= true,
	target 				= ai.SpellTarget.CASTER,
	aura 				= ai.Aura.SHIELD_RESIST_ALL,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_param			= 10,
	duration			= 4,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReflector", },
	},
}

--#61882: Доработка модуля "Сброс частиц"
Spell.Shield_Explosion =
{
	target =
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
		},
	target_range = 1,
}

--#64666: Спецмодуль для инженерного фрегата Империи Styx. Спелл
Spell.LeastShieldedinAreaHeal =
{
	target =
		{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ALLY,
			misc			= ai.SpellTargetMisc.LESSER_SHIELD,
		},
	target_range 		= 100,
	influence 			= ai.Spell.HEAL_SHIELD_SCALED,
	influence_param		= 1,
}

Spell.DispelAoe =
{
	influence = ai.Spell.DESTROY,
	target =
		{
			class 			= ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD, --ai.SpellTargetClass.VITALPOINT_TURRET
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
		},
	target_range = 200,
	--aura_range = 30,
	--period = 1,
	isBuff = false,
}

--#64709: Спецмодуль для штурмовика Hyena. Спелл
Spell.CloakingBoost =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 15,
	isBuff			= true,
--	aura_fx			= "particles/test/continuous_3",
--	aura_start_sound = "sound/gadgets/stealth_on",
--	aura_sound		= "sound/game/boost/small_start_loop",
--	aura_end_sound	= "sound/gadgets/stealth_off",
--	uiName 			= "Special_CloakingDevice_Base",
--	uiDesc 			= "Special_CloakingDevice_Base_Desc",

	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CloakingDeviceUniq", },
	},
	additional_auras =
	{
		{
			influence 	= ai.Spell.APPLY_AURA,
			target 		= ai.SpellTarget.CASTER,
			aura 		= ai.Aura.FAST_MOVEMENT,
			aura_param 	= 0.3,
			duration	= 15,
			isBuff 		= true,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
			dispell_timeout	= 2,
			ui_ico = {
				target_system = { tex = "ItemSubtype_CloakingDeviceUniq", },
			},
		},
	}
}

--#64710: Спецмодуль для штурмовика Sword S. Спелл

Spell.EnergyDeactivationHealShield =
{
	influence 	= ai.Spell.APPLY_AURA,
	target 		= ai.SpellTarget.CASTER,
	aura 		= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,

	aura_target 		=
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_param	= 1206,
	aura_range	= 360,
	duration	= 1,
	period		= 0.34,
	isBuff 		= true,
	ui_ico = {
				target_system = { tex = "ItemSubtype_EnergyShieldRegen", },
			},
	aura_fx				= "particles/gadget/shield_boost",
	aura_target_directed_fx		= "particles/gadget/shield_boost",
}

Spell.Spell_AoeStealthDrone =
{
	aura_range = 100,
	duration = 15,
	target = ai.SpellTarget.CASTER_POSITION_CASTER,
	influence = ai.Spell.APPLY_AURA,
	aura = ai.Aura.STEALTH,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
		misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	dispel_interval		= 4,
	isBuff = true,
	aura_holder_def = "AoeStealthDrone",
	ui_ico = {
		target_system = { tex = "ItemSubtype_AoeStealthDrone", },
	},
	aura_start_sound = "sound/gadgets/stealth_on",
	aura_end_sound = "sound/gadgets/stealth_off",
	aura_fx 		= "particles/gadget/stealth_sphere",
}

Spell.Spell_ScoutChameleon =
{
	target			= ai.SpellTarget.CASTER,
	influence 		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.ANTI_RADAR,
	aura_target		= ai.SpellTarget.HOLDER,
	duration 		= 5,
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	dispell_timeout	= 1,
	isBuff 			= true,
	ui_ico = {
		target_system = { tex = "ItemSubtype_ScoutChameleon", },
	},
	aura_fx = "StealthEffect",
	--[[additional_auras =
	{
		{
			influence 	= ai.Spell.APPLY_AURA,
			target 		= ai.SpellTarget.CASTER,
			aura 		= ai.Aura.FAST_MOVEMENT,
			aura_target		= ai.SpellTarget.HOLDER,
			aura_param 	= 0.15,
			duration	= 7,
			isBuff 		= true,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			dispell_timeout	= 1,
			ui_ico = {
				target_system = { tex = "ItemSubtype_CloakingDeviceUniq", },
			},
		},
	}]]
}

Spell.ScoutChameleonSmallWarp =
{
	target			= ai.SpellTarget.CASTER,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	influence_param	= -180,
	cast_position_fx = "particles/gadget/reverse_thruster",
	cast_sound 		= "sound/gadgets/ReverseThruster_activate",
}

--#65300: Пассивный модуль (двигатель) для разведчика Федерация спелл
Spell.Spell_Movement_Damage_Buff =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_target		= ai.SpellTarget.HOLDER,
	aura_param		= 0.02,
	max_stacks		= 3,
	ignore_stacks = true,
	isBuff 		= true,
	ui_ico = {
		target_system = { tex = "ItemSubtype_MovementDamageBuff", },
	},
}

--#65473
Spell.FederationCritBuffOnMovement =
{
	aura 			= ai.Aura.CRIT_CHANCE,
	aura_target		= ai.SpellTarget.HOLDER,
	aura_param		= 0.08,
	isBuff 		= true,
	ui_ico = {
		target_system = { tex = "clan_icon_federation_1", },
	},
}

Spell.SpyDroneDebuff =
{
	aura			= ai.Aura.SPY_DRONE,
	ignore_subtype_if_other_team = true,
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		misc = ai.SpellTargetMisc.VISIBLE_BY_CASTER
	},
	aura_target		= ai.SpellTarget.HOLDER,
	duration		= 5,
	isBuff			= false,
	ui_ico = {
		target_system = { tex = "ItemSubtype_SpyDroneRailgun", },
	},
}

Spell.GreenGravityAnomaly =
{
	influence		= ai.Spell.CAST_SPELLS,
	spells			= { 'GreenGravityAnomalyDamage', 'GreenGravityAnomalyAttract' },
}

Spell.GreenGravityAnomalyDamage =
{
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	target			=
					{
						target 	= ai.SpellTargetGeneral.INFLICTOR,--ai.SpellTargetGeneral.LOCKED_TARGET, --ai.SpellTargetGeneral.AIM, --ai.SpellTargetGeneral.INFLICTOR,
						misc	= ai.SpellTargetMisc.POSITION,
					},
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					},
	aura_range		= 20,
	duration		= 1.7,
	aura_param		= 40,
	period			= 1,
	holder_sound	= "sound/destroyer/GravyAnomaly_loop",
	ui_ico = {
		target_system = { tex = "ItemSubtype_GreenGravityAnomaly", },
	},
}

Spell.GreenGravityAnomalyAttract =
{
	inherit			= "GreenGravityAnomalyDamage",
	aura			= ai.Aura.SHIP_ATTRACTION,
	period				= 0.2,
	aura_param 			= 12.5,
	duration 			= 1.7,
	ui_ico = {
		target_system = { tex = "ItemSubtype_GreenGravityAnomaly", },
	},
}

-- спеллы к EnergyReroute на T5
Spell.EnergyReroute_PhaseShieldResist =
{
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura_param		= 20,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReroute_PhaseShieldResist", },
	},

}

Spell.EnergyReroute_PhaseWeaponRange =
{
	aura			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura_param		= 0.063,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReroute_PhaseWeaponRange", },
	},
	additional_auras =
	{
		{
				aura			= ai.Aura.SLOW_MOVEMENT,
				aura_target 	= ai.SpellTarget.HOLDER,
				target 			= ai.SpellTarget.CASTER,
				isBuff			= true,
				aura_param		= 0.33,
				ui_ico =
				{
					target_system 	= { tex = "ItemSubtype_EnergyReroute_PhaseWeaponRange", },
				},
		}
	}
}

Spell.EnergyReroute_PhaseMovementSpeed = --спелл нигде не используется
{
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura_param		= 0.45,
	-- ui_ico =
	-- {
		-- target_system 	= { tex = "ItemSubtype_EnergyReroute_PhaseMovementSpeed", },
	-- },
	additional_auras =
	{
		{
				aura			= ai.Aura.FAST_MANEUVER,
				aura_target 	= ai.SpellTarget.HOLDER,
				target 			= ai.SpellTarget.CASTER,
				isBuff			= true,
				aura_param		= 0.3,
		}
	}
}

Spell.DestrSiegeMode =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura_param		= 0.55,

	aura_fx 		= "particles/gadget/destroyer_siege_mode",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DestrSiegeMode", },
	},
	additional_auras =
	{
		{
			aura			= ai.Aura.REDUCE_MAX_SPEED,
			aura_target 	= ai.SpellTarget.HOLDER,
			target 			= ai.SpellTarget.CASTER,
			isBuff			= false,
			aura_param_add	= 0.5,
			gameplay_specific = true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_DestrSiegeMode", },
			},
		},
		{
			aura			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
			aura_target 	= ai.SpellTarget.HOLDER,
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura_param		= 0.1,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_DestrSiegeMode", },
			},
		}
	}
}

Spell.MovementLeadsToDamage =
{
	target 			= ai.SpellTarget.INFLICTOR,
	--target_range	= 50,
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target 	= 	{ --без минных полей и ракет, только вражеские
							class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
							area			= ai.SpellTargetArea.AROUND,
							relationship	= ai.SpellTargetRelationship.ENEMY,
						},
	aura_range		= 50,
	aura_param		= 500,
	--duration		= 3,
	period			= 0.25,

	isBuff			= false,
	spell_on_cancel = "MovementLeadsToDamageAftertaste",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DestrMovementRestrictor", },
	},
}
Spell.MovementLeadsToDamageAftertaste =
{
	target 			= --только вражеские корабли
					{
						target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
						class			= ai.SpellTargetClass.SHIP,
						--area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 500,
	aura_param_add	= 300,

	period			= 1,
	
	min_targets_count	= 1,

	min_speed_percent	= 0.30,
	isBuff			= false,

	duration 		= 7,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DestrMovementRestrictor", },
	},
	use_dead_engine_effects = true,

	aura_sound 		= "sound/gadgets/MovementRestrictor/alarm",
}

Spell.ReduceHeatRate =
{
	isBuff			= true,
	aura			= ai.Aura.HEAT_MUL,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	aura_param		= -1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CoolantSystemIdle", },
	},
	--флаги ниже для диминишинга по количеству модулей, см. PassiveModuleDiminishing
	diminish_aura_param=true,
	ignore_stacks=true,
	ignore_subtype=true,
}

Spell.DestrMovementCharge =
{
	isBuff			= true,
	aura			= ai.Aura.CHARGE,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	max_stacks		= 3,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MovementChargesDestr", },
	},
}

Spell.DestrDamageChargeToBuff =
{
	isBuff 			= true,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.4,
	duration 		= 5,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MovementChargesDestr", },
	},
	aura_fx = "particles/gadget/destroyer_damage_buff"
}

Spell.DestrShieldDamageCharge =
{
	isBuff			= true,
	aura			= ai.Aura.CHARGE,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	max_stacks		= 3,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldChargesDestr", },
	},
}

Spell.DestrChargetoEmpDamage =
{
	isBuff			= false,
	target 			=
	{ --без дронов маяка, минных полей и ракет, только вражеские
		target			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 2600,
	target_range	= 400,
	period			= 0.5,
	duration		= 1,
	influence_fx	= "particles/gadget/jericho_module_hit",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldChargesDestr", },
	},
	--period_beam_fx	= "particles/gadget/jericho_module_beam",
}

Spell.DestrShieldHealSelf =
{
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param		= 2833.34,
	duration		= 2,
	period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldChargesDestr", },
	},
}

Spell.CommandCooldownReduction =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.SET_COOLDOWN,
	influence_param	= -0.015,
	isBuff			= true,
	item_group_mask = ai.ItemGroupMask.COMMAND,
}

Spell.ShieldHealOnEnemyDeath =
{
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param		= 4500,
	duration		= 2,
	period			= 0.5,

	cast_fx = "particles/gadget/shield_boost",
	--ниже флаги для диминишинга аур от нескольких пассивных модулей
	ignore_stacks	= true,
	ignore_subtype	= true,
	diminish_aura_param = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldHealOnEnemyDeath", },
	},
}

Spell.EquippedPassiveCommandCrit =
{
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura_target 	=
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
		misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	aura			= ai.Aura.CRIT_CHANCE,
	aura_param		= 0.02,
	aura_range		= 360,
	additional_auras =
	{
		{
		isBuff 			= true,
		target 			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		aura			= ai.Aura.CRIT_CHANCE,
		aura_param		= 0.06,
		min_targets_count = 0,
		ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_CommandCritAura", },
		},
		}
	},
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CommandCritAura", },
	},
}

Spell.ActiveCommandCrit =
{
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.CRIT_CHANCE,
	aura_target 	=
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
		misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	aura_param		= 0.04,
	duration		= 10,
	aura_range		= 360,
	aura_target_fx = "particles/gadget/damage_buff",
	ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_CommandCritAura", },
		},
	additional_auras =
	{
		{
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.CRIT_CHANCE,
			aura_param		= 0.06,
			duration		= 10,
			mod_range		= 360,
			mod_target		= --Module_CommandCritAura_T4_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				--misc			= ai.SpellTargetMisc.EXCLUDE_CASTER, --если никого не будет в радиусе действия пусть хоть за себя получит +к криту
			},
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_CommandCritAura", },
			},
		}
	}
}

Spell.TempSpellTargetForSuicide =
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_range		= 40,
	aura_param		= 100,
	duration		= 10,
 	target			=
	{--ai.SpellTarget.CASTER_POSITION,
		target		= ai.SpellTargetGeneral.CASTER,
		vitality	= ai.SpellTargetVitality.DEAD,
		misc 		= ai.SpellTargetMisc.POSITION,
	},
	aura_target		=
	{
		class		= ai.SpellTargetClass.SHIP,
		area		= ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ENEMY,
	},
}

Spell.UrgentCapacitorCharge =
{
	aura			= ai.Aura.ADD_ENERGY_PERIODIC,
	aura_param		= 19.5,
	period			= 0.2,
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	duration 		= 3,
	ignore_stacks	= true,
	ignore_subtype	= true,
	diminish_aura_param	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_UrgentCapacitorCharge", },
	},
	aura_fx = "particles/gadget/add_energy",
}

Spell.OrbofJeriho =
{
	isBuff			= false,
	aura			= ai.Aura.DAMAGE_EMP_SCALED, 
	aura_param		= 1500,
	period			= 0.25,
	target 			= ai.SpellTarget.INFLICTOR,
	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_range		= 50,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IsotopeHarvester", },
	},
	period_fx		= "particles/gadget/jericho_active_module_hit",


}

Spell.OrbofJerihoHeal =
{
	influence		= ai.Spell.HEAL_SHIELD,
	influence_param	= 0, --ракета запомнит кол-во нанесенного дамага и сюда попадет это значение, итоговое значение хила будет = influence_param (из спелла) * projectile_spell_charge_coef (из модуля)
	target			= --ai.SpellTarget.CASTER,--LOCKED_TARGET,
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	influence_fx	= "particles/gadget/jericho_active_module_sphere_end",
	influence_sound = "sound/gadgets/IsotopeHarvester/sphere_explosion",
}

Spell.DamageAndEnergyBurnOnChannel =
{
	isBuff			= false,
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	target			=
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	aura_target			= ai.SpellTarget.HOLDER,
	target_range			= 350,
	maintain_range_additional	= 100,
	duration		= 5,
	maintain_aura	= true,
	aura_fx = "particles/gadget/damage_thermal",
	aura_param		= 126,
	aura_param_add	= 825,--410,--215,
	period			= 0.5,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DestrSpellOnChannel", },
	},
	additional_auras =
	{
		{
			--target не нужен, берется из спелла
			isBuff			= false,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.BURN_ENERGY_PERIODIC,
			aura_param		= 267,
			duration		= 5,
			period			= 1,
			target_range			= 350,
			maintain_range_additional	= 100,
			maintain_aura	= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_DestrSpellOnChannel", },
			},
		},
		{
			--target не нужен, берется из спелла
			isBuff			= false,
			aura_target		= 
			{
				target		= ai.SpellTargetGeneral.HOLDER,
				signature	= ai.SignatureMask.HUGE,
			},
			aura			= ai.Aura.BURN_ENERGY_PERIODIC,
			aura_param		= 500,
			duration		= 5,
			period			= 1,
			target_range			= 350,
			maintain_range_additional	= 100,
			maintain_aura	= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_DestrSpellOnChannel", },
			},
		},
	},
}

Spell.EnemyResistReduction =
{
	isBuff			= false,
	aura			= ai.Aura.RESIST_ALL_DEC,
	aura_param		= 10,
	target			= ai.SpellTarget.CASTER,
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura_range		= 220,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnemyResistReductor", },
	},
}

Spell.ResonatingLaser =
{
	duration		= 5,
	period			= 0.5,
	aura_param		= 444,
	isBuff 			= false,

	target 			= --ai.SpellTarget.LOCKED_TARGET, --#69833
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		target			= ai.SpellTargetGeneral.CONTEXT_TARGET, --#80392
		vitality		= ai.SpellTargetVitality.ALIVE,
		-- relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	period_beam_fx		= "particles/weapons/laser/esminec_laser_aoe_beam",
	period_fx		= "particles/weapons/laser/esminec_laser_aoe_hit",
	--period_fx		= "particles/null",
	aura_range		= 70, --50
	aura            = ai.Aura.DAMAGE_THERMAL_PERIODIC,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DestrResonatingLaser", },
	},
}

Spell.MineTrapCloaking =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 180,
	isBuff			= true,

	dispell_flag	= ai.Dispell.ON_DAMAGE,
	--dispell_timeout	= 2,
	aura_execution_delay = 2.5,
}

Spell.SpilledRadioactiveSubstance =
{
	target			= {
	target 				= ai.SpellTargetGeneral.INFLICTOR,
	misc				= ai.SpellTargetMisc.POSITION,
	},
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param		= 1118,
	duration		= 5,
	period			= 0.5,
	isBuff			= false,
	aura_range		= 40,
	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound		= "sound/gadget/voidzone_loop",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DestrDeadlyTrap", },
	},
}

Spell.ElectricPotentialShift =
{
	duration		= 20,
	period			= 1,
	aura_param		= 444,
	isBuff 			= false,

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		misc = ai.SpellTargetMisc.VISIBLE_BY_CASTER
	},
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc			= ai.SpellTargetMisc.REQUIRE_SAME_FRIENDLY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	period_beam_fx	= "particles/weapons/laser/laser_electric_beam",
	period_fx		= "particles/weapons/laser/hit_electric",
	aura_range		= 105,
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_fx 		= "particles/gadget/lightnings_debuff",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ElectricPotentialInductor", },
	},
}

Spell.BarrelShotAndSelfBuff =
{
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.SNIPER_PROJECTILE_SPELL,
	duration		= 20,
	target_spell	= "BarrelDistraction",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BarrelDistractionShot", },
	},

	additional_auras =
	{
		{
			isBuff			= true,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FIRE_RATE_MOD,
			aura_param		= 0.1,
			duration		= 5,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_BarrelDistractionShot", },
			},
		}
	}
}

Spell.BarrelDistraction =
{
	isBuff			= false,
	target 			= { 
			target = ai.SpellTargetGeneral.CONTEXT_TARGET, 
			relationship	= ai.SpellTargetRelationship.ENEMY+ai.SpellTargetRelationship.NEUTRAL, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FIRE_RATE_MOD,
	aura_param		= -0.4,
	duration		= 6,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BarrelDistractionShot", },
	},
	gun_spell_fx 	= "particles/gadget/weapon_instability",
}

Spell.ExpertShooter =
{
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FIRE_RATE_MOD,
	aura_param		= 0.10,
	duration		= 20,
	max_stacks		= 2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ExtendedBallisticsCPU", },
	},
	aura_fx 		= "particles/gadget/damage_buff",
	additional_auras =
	{
		{
			isBuff			= true,
			target			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.SNIPER_SPEED,
			aura_param		= 0.125,
			duration		= 20,
			max_stacks		= 2,
			min_targets_count	= 0,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_ExtendedBallisticsCPU", },
			},
		}
	}
}


--
Spell.HealSpeedUp =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param 		= 2,

	additional_auras =
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MOVEMENT,
			aura_param 		= 2,
		},
	},
}


--
Spell.SlowDownReduceShield =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.ENEMY,
	aura			= ai.Aura.RESIST_ALL_DEC,
	aura_param 		= 2,

	additional_auras =
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.ENEMY,
			aura			= ai.Aura.SLOW_MOVEMENT,
			aura_param 		= 2,
		},
	},
}

Spell.PassiveHealoverTime = --постояное излечение щита и корпуса
{
	target = --маска холдера ауры
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target		= --маска целей
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		--misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	period = 1, --время между тиками хила
	--period_beam_fx 		= "particles/weapons/other/chargable_gun_beam", --луч-эффект до целей
	period_beam_root_fx 		= "particles/gadget/pulsars/drone_shield_ray_periodic", --луч-эффект до целей
	--aura_target_fx	= "particles/gadget/shield_heal",
	aura_range		= 100, --радиус действия ауры
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC, --хил щита
	aura_param 		= 150, --кол-ва хила в тик
	isBuff			= true,
	gameplay_specific = true, --не диспелится ничем
	additional_auras =
	{
		{
			aura_target		=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ALLY,
				--misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			period = 1,
			period_beam_root_fx		= "particles/gadget/pulsars/drone_hull_ray_periodic", --луч-эффект до целей
			--aura_target_fx	= "particles/gadget/hull_heal",
			aura_range		= 100,
			aura			= ai.Aura.HEAL_HULL_PERIODIC,
			aura_param 		= 150,
			isBuff			= true,
			gameplay_specific = true,
		},
	},
}

Spell.PassiveHealoverTime_T2 = --постояное излечение щита и корпуса
{
	target = --маска холдера ауры
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target		= --маска целей
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		--misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	period = 1, --время между тиками хила
	period_beam_root_fx 		= "particles/gadget/pulsars/drone_shield_ray_periodic", --луч-эффект до целей
	--aura_target_fx	= "particles/gadget/shield_heal",
	aura_range		= 100, --радиус действия ауры
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC, --хил щита
	aura_param 		= 450, --кол-ва хила в тик
	isBuff			= true,
	gameplay_specific = true, --не диспелится ничем
	additional_auras =
	{
		{
			aura_target		=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ALLY,
				--misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			period = 1,
			period_beam_root_fx		= "particles/gadget/pulsars/drone_hull_ray_periodic", --луч-эффект до целей
			--aura_target_fx	= "particles/gadget/hull_heal",
			aura_range		= 100,
			aura			= ai.Aura.HEAL_HULL_PERIODIC,
			aura_param 		= 450,
			isBuff			= true,
			gameplay_specific = true,
		},
	},
}

Spell.PassiveHealoverTime_T3 = --постояное излечение щита и корпуса
{
	target = --маска холдера ауры
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target		= --маска целей
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		--misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	period = 1, --время между тиками хила
	period_beam_root_fx 		= "particles/gadget/pulsars/drone_shield_ray_periodic", --луч-эффект до целей
	--aura_target_fx	= "particles/gadget/shield_heal",
	aura_range		= 100, --радиус действия ауры
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC, --хил щита
	aura_param 		= 900, --кол-ва хила в тик
	isBuff			= true,
	gameplay_specific = true, --не диспелится ничем
	additional_auras =
	{
		{
			aura_target		=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ALLY,
				--misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			period = 1,
			period_beam_root_fx		= "particles/gadget/pulsars/drone_hull_ray_periodic", --луч-эффект до целей
			--aura_target_fx	= "particles/gadget/hull_heal",
			aura_range		= 100,
			aura			= ai.Aura.HEAL_HULL_PERIODIC,
			aura_param 		= 900,
			isBuff			= true,
			gameplay_specific = true,
		},
	},
}

Spell.DamageOverFirerate = --увеличивает урон на %, уменьшает fire rate на %
{
	target = --маска холдера ауры
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target		= --маска целей
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 100, --радиус ауры
	aura			= ai.Aura.DAMAGE_MOD, --аура на дамаг
	aura_param 		= 0.3, --% увеличения урона
	isBuff			= true,
	gameplay_specific = true, --чтобы ничем не диспелилось
	additional_auras =
	{
		{
			aura_target		= --маска целей: все союзные корабли рядом, target берется из основной ауры
			{
				area 			= ai.SpellTargetArea.AROUND,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ALLY,
			},
			aura_range		= 100, --радиус ауры
			aura			= ai.Aura.FIRE_RATE_MOD, --ауры на изменение fire rate
			aura_param 		= -0.666, --надо -40%, значит коэфициент 0.6, аура_парам с учётом этого должен быть = (1 - 1/0.6)
			isBuff			= true,
			gameplay_specific = true, --чтобы ничем не диспелилось
		},
	},
}

Spell.FillerHealSpell =
{
	inherit = "RepairDrones_m_T1_Mk1",
}

Spell.FillerDamageSpell =
{
	inherit = "CommandWeaknessAnalyzer_T3_Mk1",
	aura_param = 0.01,
}

Spell.BotShieldUp =
{
	aura = ai.Aura.SHIELD_RESIST_ALL,
	target =
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target		=
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 100,
	aura_param 		= 40,
	isBuff			= true,
	duration		= 10,
	additional_auras =
	{
		{
			aura = ai.Aura.HULL_RESIST_ALL,
			aura_target		=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ALLY,
			},
			aura_range		= 100,
			aura_param 		= 40,
			isBuff			= true,
			duration		= 10,
		}
	},
}

Spell.BotAoEStealthExceptSelf = --стелс всех вокруг, кроме себя
{
	aura = ai.Aura.STEALTH, --аура стелса
	target = --маска холдера ауры
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target		= --маска целей
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	aura_range		= 200, --радиус ауры
	isBuff			= true, --бафф
	duration		= 15, --длительностьт ауры
	--aura_fx 		= "particles/gadget/jericho_active_module_sphere", --эффект временный
}

Spell.BotPullsTarget =
{
	target = ai.SpellTarget.CASTER, --маска холдера ауры

	aura = ai.Aura.SHIP_ATTRACTION, --аура притяжения
	aura_param = 40, --скорость притяжения
	target_range = 200, --радиус на котором активация модуля доступна(чтобы бот не мог жать по кд и жал только когда цель есть рядом)
	aura_range = 200, --радиус ауры притяжения
	aura_target = --маска целей
	{
		area			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	isBuff = false, --дебафф
	duration = 3, --продолжительность
	--period = 0.2,
	ui_ico = {
		target_system = { tex = "ItemSubtype_PushRay", }, --иконка дебаффа в худе у цели
	},
	additional_auras =
	{
		{
			aura = ai.Aura.DAMAGE_THERMAL_PERIODIC, --аура дамага термического
			aura_target = --маска целей
			{
				area			= ai.SpellTargetArea.AROUND,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
			},
			aura_param = 100, --кол-во дамага раз в period
			period = 1, --период между тиками дамага
			aura_range = 100, -- радиус, на котором аура наносит дамаг
			isBuff = false, --дебафф
			duration = 7, --продолжительность ауры
			aura_fx			= "particles/gadget/suicide_aura", --эффект
			aura_execution_delay = 2, --задержка при использовании
			ui_ico = { --#73024 у каждой ауры должна быть иконка
			target_system = { tex = "ItemSubtype_PushRay", }, --иконка дебаффа в худе у цели
			},
		},
		{
			aura = ai.Aura.FORTIFICATION, --аура иммуна, корабль не может летать, урон не получает
			duration = 3, --продолжительность
			isBuff = true, --бафф
			ui_ico = {
			target_system = { tex = "ItemSubtype_PushRay", }, --иконка дебаффа в худе у цели
			},
		}
	}
}

Spell.BotPullsTarget_T2 =
{
	target = ai.SpellTarget.CASTER, --маска холдера ауры

	aura = ai.Aura.SHIP_ATTRACTION, --аура притяжения
	aura_param = 40, --скорость притяжения
	target_range = 200, --радиус на котором активация модуля доступна(чтобы бот не мог жать по кд и жал только когда цель есть рядом)
	aura_range = 200, --радиус ауры притяжения
	aura_target = --маска целей
	{
		area			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	isBuff = false, --дебафф
	duration = 3, --продолжительность
	--period = 0.2,
	ui_ico = {
		target_system = { tex = "ItemSubtype_PushRay", }, --иконка дебаффа в худе у цели
	},
	additional_auras =
	{
		{
			aura = ai.Aura.DAMAGE_THERMAL_PERIODIC, --аура дамага термического
			aura_target = --маска целей
			{
				area			= ai.SpellTargetArea.AROUND,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
			},
			aura_param = 400, --кол-во дамага раз в period
			period = 1, --период между тиками дамага
			aura_range = 100, -- радиус, на котором аура наносит дамаг
			isBuff = false, --дебафф
			duration = 7, --продолжительность ауры
			aura_fx			= "particles/gadget/suicide_aura", --эффект
			aura_execution_delay = 2, --задержка при использовании
			ui_ico = { --#73024 у каждой ауры должна быть иконка
			target_system = { tex = "ItemSubtype_PushRay", }, --иконка дебаффа в худе у цели
			},
		},
		{
			aura = ai.Aura.FORTIFICATION, --аура иммуна, корабль не может летать, урон не получает
			duration = 3, --продолжительность
			isBuff = true, --бафф
			ui_ico = {
			target_system = { tex = "ItemSubtype_PushRay", }, --иконка дебаффа в худе у цели
			},
		}
	}
}

Spell.BotPullsTarget_T3 =
{
	target = ai.SpellTarget.CASTER, --маска холдера ауры

	aura = ai.Aura.SHIP_ATTRACTION, --аура притяжения
	aura_param = 40, --скорость притяжения
	target_range = 200, --радиус на котором активация модуля доступна(чтобы бот не мог жать по кд и жал только когда цель есть рядом)
	aura_range = 200, --радиус ауры притяжения
	aura_target = --маска целей
	{
		area			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	isBuff = false, --дебафф
	duration = 3, --продолжительность
	--period = 0.2,
	ui_ico = {
		target_system = { tex = "ItemSubtype_PushRay", }, --иконка дебаффа в худе у цели
	},
	additional_auras =
	{
		{
			aura = ai.Aura.DAMAGE_THERMAL_PERIODIC, --аура дамага термического
			aura_target = --маска целей
			{
				area			= ai.SpellTargetArea.AROUND,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
			},
			aura_param = 800, --кол-во дамага раз в period
			period = 1, --период между тиками дамага
			aura_range = 100, -- радиус, на котором аура наносит дамаг
			isBuff = false, --дебафф
			duration = 7, --продолжительность ауры
			aura_fx			= "particles/gadget/suicide_aura", --эффект
			aura_execution_delay = 2, --задержка при использовании
			ui_ico = { --#73024 у каждой ауры должна быть иконка
			target_system = { tex = "ItemSubtype_PushRay", }, --иконка дебаффа в худе у цели
			},
		},
		{
			aura = ai.Aura.FORTIFICATION, --аура иммуна, корабль не может летать, урон не получает
			duration = 3, --продолжительность
			isBuff = true, --бафф
			ui_ico = {
			target_system = { tex = "ItemSubtype_PushRay", }, --иконка дебаффа в худе у цели
			},
		}
	}
}

Spell.FillerTargetDisableBoostSpell = --спелл для того чтобы бот кастовал хоть что-нибудь в цель
{
	aura = ai.Aura.SLOW_MOVEMENT,
	aura_param = 0.03,
	target = ai.SpellTarget.LOCKED_TARGET,
	isBuff = false,
	target_range = 200, --чтобы нельзя было использовать находясь дальше чем за target_range
	duration = 3,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ExtendedBallisticsCPU", },
	},
}

Spell.BotHackSystems =
{
	target =  --маска холдера ауры
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura = ai.Aura.DISABLE_LOCK, --аура на помехи
	aura_target = --маска целей
	{
		area			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_range = 150, --радиус ауры
	isBuff = false,
	duration = 15, --длительность
	apply_crowd_control_coef = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ExtendedBallisticsCPU", }, --иконка в худе дебаффов
	},
}

Spell.FillerTargetBotHackSystems = --спелл для того чтобы бот кастовал хоть что-нибудь в цель
{
	inherit = "FillerTargetDisableBoostSpell",
	target_range = Spell.BotHackSystems.aura_range,
}

Spell.AoEBotDamage =
{
	target =  --маска холдера ауры
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target = --маска целей
	{
		area			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	aura = ai.Aura.DAMAGE_THERMAL_SCALED, --термический дамаг, по размерам сигнатуры целы
	aura_range = 100,
	aura_param = 400,
	period = 1,
	isBuff = false,
	aura_fx = "particles/gadget/suicide_aura", --эффект на холдере, зацикленный
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ExtendedBallisticsCPU", }, --иконка в худе дебаффов
	},
}

Spell.AoEBotDamage_T2 =
{
	target =  --маска холдера ауры
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target = --маска целей
	{
		area			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	aura = ai.Aura.DAMAGE_THERMAL_SCALED, --термический дамаг, по размерам сигнатуры целы
	aura_range = 200,
	aura_param = 800,
	period = 1,
	isBuff = false,
	aura_fx = "particles/gadget/suicide_aura", --эффект на холдере, зацикленный
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ExtendedBallisticsCPU", }, --иконка в худе дебаффов
	},
}

Spell.AoEBotDamage_T3 =
{
	target =  --маска холдера ауры
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target = --маска целей
	{
		area			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	aura = ai.Aura.DAMAGE_THERMAL_SCALED, --термический дамаг, по размерам сигнатуры целы
	aura_range = 300,
	aura_param = 1200,
	period = 1,
	isBuff = false,
	aura_fx = "particles/gadget/suicide_aura", --эффект на холдере, зацикленный
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ExtendedBallisticsCPU", }, --иконка в худе дебаффов
	},
}

Spell.SpeedHealOnAssist =
{
	aura = ai.Aura.FAST_MOVEMENT,
	target =
	{
		target = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship = ai.SpellTargetRelationship.ALLY,
	},
	aura_target =
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	isBuff = true,
	aura_param = 0.5,
	target_range = 100,
	duration = 5,
}

Spell.ShieldedTaunt = --#73982 Прототип основного спелла
{
	target		=  --ai.SpellTarget.ENEMY_SHIPS_VISIBLE,
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		--ai				= ai.SpellTargetAi.PLAYERS,
		misc			= ai.SpellTargetMisc.VISIBLE,
	},
	target_range = 300,
	min_targets_count= 0,
	influence = ai.Spell.CAST_SPELLS,
	spells =
	{
		"AoETaunt",
		"GuardShield",
		--"AoETaunt_ShieldHeal_OnCaster",
	},
}

Spell.AoETaunt = --#73982
{
	target =
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target		=  --ai.SpellTarget.ENEMY_SHIPS_VISIBLE,
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		--ai				= ai.SpellTargetAi.PLAYERS,
		misc			= ai.SpellTargetMisc.VISIBLE,
	},
	aura = ai.Aura.FORCE_TARGET_LOCK,
	duration = 10,
	aura_range = 300,
	isBuff = false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldedTaunt", },
	},
	-- visual_entity		= "Model_GuardShield",
	-- visual_entity_bone	= "main",
}


Spell.AoETaunt_ShieldHeal_OnCaster = 
{
	target = ai.SpellTarget.CASTER,
	aura_target		=  --ai.SpellTarget.ENEMY_SHIPS_VISIBLE,
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		misc			= ai.SpellTargetMisc.VISIBLE,
	},
	aura_range = 300,
	aura = ai.Aura.CAST_SPELL_PERIODIC,
	target_spell = "AoETaunt_ShieldHeal_FromEnemy",
	duration = 6,
	period = 1,
	isBuff = true,
	hud_visible = false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldedTaunt", },
	},
}

Spell.AoETaunt_ShieldHeal_FromEnemy =
{ --проверить правильность работы, исправить тултип
	aura_execution_delay = 0.05, -- чтобы все противники успели настакать и отхил не шел только за одного
	target		= ai.SpellTarget.CASTER,
	aura_target = ai.SpellTarget.CASTER,
	can_stack = true,
	max_stacks = 5,
	aura = ai.Aura.HEAL_SHIELD_PERIODIC,
	duration = 0.7,
	aura_param = 323,
	period = 0.5, --период начинается с нуля не учитывая aura_execution_delay, поэтому 0.5
	isBuff = true,
	disable_aura_duration = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldedTaunt", },
	},
}

Spell.AoETaunt_ShieldHeal = --#73982
{
	target = ai.SpellTarget.CASTER,
	aura_target = ai.SpellTarget.HOLDER,
	mod_target = --NOT USED
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		--misc			= ai.SpellTargetMisc.LOCKER_OF_CASTER,
	},
	mod_range = 200,
	mod_max	= 4,
	aura = ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	duration = 6,
	aura_param = 166,
	period = 1,
	isBuff = true,
	ignore_subtype = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldedTaunt", },
	},
}

Spell.GuardShield = --#73982
{
	influence = ai.Spell.APPLY_SHELL,
	target =
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	shell_def = "Shell_GuardShield",
	influence_param = 4000,
	duration = 10,
}

Spell.ProtectiveShieldRegen =
{
	target =
	{
		target = ai.SpellTargetGeneral.LOCKED_TARGET,
		class = ai.SpellTargetClass.SHIP,
		relationship = ai.SpellTargetRelationship.ALLY,
	},
	aura_target =
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	aura = ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	aura_param = 1000,
	target_range = 300,
	period = 0.5,
	duration = 6,
	isBuff = true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_ProtectiveShield", }, --заменить или перезаписать
	},
	aura_fx	= "particles/gadget/shield_heal",
}

Spell.ProtectiveShield =
{
	target =
	{
		target = ai.SpellTargetGeneral.LOCKED_TARGET + ai.SpellTargetGeneral.CASTER,
		class = ai.SpellTargetClass.SHIP,
		relationship = ai.SpellTargetRelationship.ALLY,
	},
	aura_target =
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	target_range = 300,
	aura = ai.Aura.INVULNERABILITY,
	duration = 3,
	isBuff = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ProtectiveShield", },
	},
	aura_fx = "particles/gadget/invulnerability",
}

Spell.GunOverheat =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY,
	},
	aura_target =
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	aura = ai.Aura.HEAT_MUL,
	duration = 10,
	isBuff = false,
	aura_param = 0.1666,
	max_stacks = 6,
	gun_spell_fx	   = "particles/weapons/overheating_laser_heat",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_OverheatingLaser", },
	},
}

Spell.ShieldSupressor_Counter = -- для отображения кол-ва целей (костыль, зато без кода)
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.RESIST_ALL,
	aura_param		= 0,
	duration		= 0,
	hud_visible 	= false,
	min_targets_count= 0,
	aura_target		=
			{
			class 			= ai.SpellTargetClass.SHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			area			= ai.SpellTargetArea.AROUND,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
			},
	aura_range	= 150,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldSuppressor", },
	},
}

Spell.ShieldSupressor =
{
	target		=
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura 			= ai.Aura.SHIELD_BURN_PERIODIC,
	aura_range			= 150,
	isBuff 			= false,
	aura_param 		= 0.03,
	period 			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldSuppressor", },
	},
	nebula			= "Effects_Nebula_ShieldSupressor",
}

Spell.ShieldandHullFortify =
{
	target =
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target =
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	aura = ai.Aura.RESIST_ALL,
	aura_param = 150,
	duration = 8,
	isBuff = true,
	aura_fx = "particles/gadget/shield_fortify",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldSuppressor", },
	},
	additional_auras =
	{
		{
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MOVEMENT,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			aura_param		= 0.7,
			duration		= 12,
			period			= 1,
			aura_param_add	= -0.05,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
			},
		},
	},
}

Spell.SpaceShiftWarp =
{
	target			= ai.SpellTarget.CASTER,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	influence_param	= -150,
	cast_fx			= "particles/gadget/shift_warp_ship",
	cast_position_fx = "particles/gadget/shift_warp_position",
	cast_sound 		= "sound/gadgets/SpaceShitftWarp/ssw",
	--cast_fx 		= "StealthWarpEffect", зачем вообще это тут вписали?
}

Spell.SpaceShiftInvisibility =
{
	target =
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	influence 		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.STEALTH,
	aura_target		=
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	duration 		= 6,
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	dispell_timeout	= 2,
	isBuff 			= true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_SpaceShift", },
	},
	aura_end_sound 	= "sound/gadgets/shift_off",
}

Spell.SmallSpiralMineCloaking =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 180,
	isBuff			= true,

	dispell_flag	= ai.Dispell.ON_DAMAGE,
	--dispell_timeout	= 2,
	aura_execution_delay = 1.0,
}

Spell.GuardHeal_Transport =
{
	aura 				= ai.Aura.HEAL_SHIELD_PERIODIC,
	target 				= ai.SpellTarget.CASTER,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_param			= 100,
	duration			= 3600,
	period				= 0.2,
	isBuff				= true,
	gameplay_specific	= true,
}

Spell.PlasmaWebRestrictor =
{
	target 			= --только вражеские корабли
		{
			target			= ai.SpellTargetGeneral.LOCKED_TARGET,
			class			= ai.SpellTargetClass.SHIP,
			--area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY,
		},
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 500,
	period			= 1,
	min_speed_percent	= 0.50,
	isBuff			= false,
	duration 		= 7,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaWeb", },
	},
	use_dead_engine_effects = true,
	aura_sound 		= "sound/gadgets/MovementRestrictor/alarm",
}



Spell.PlasmaWebHealReductor =
{
	additional_auras =
	{
		ignore_subtype	= true,
		{
			--aura_target		= ai.SpellTarget.HOLDER,
			aura_target =
			{
				target 			= ai.SpellTargetGeneral.HOLDER,
				signature		= ai.SignatureMask.HUGE,
			},
			aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
			aura_param		= 100,
			isBuff			= false,
			ignore_subtype	= true,
			duration		= 12,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PlasmaWeb", },
			},
		},
		{
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.HEALING_MOD,
			aura_param		= -1,
			isBuff			= false,
			ignore_subtype	= true,
			duration		= 12,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PlasmaWeb", },
			},
		}
	}
}
Spell.PlasmaWebHUGE =
{
	additional_auras =
	{
		ignore_subtype	= true,
		{
			--aura_target		= ai.SpellTarget.HOLDER,
			aura_target =
			{
				target 			= ai.SpellTargetGeneral.HOLDER,
				signature		= ai.SignatureMask.HUGE,
			},
			aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
			aura_param		= 100,
			isBuff			= false,
			ignore_subtype	= true,
			duration		= 12,
			hud_visible 	= false,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PlasmaWeb", },
			},
		},
	},
}


Spell.SpacetimeAnomaly =
{
	target =
	{
		target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target =
	{
		target = ai.SpellTargetGeneral.HOLDER,
		class = ai.SpellTargetClass.SHIP,
		vitality = ai.SpellTargetVitality.ALIVE,
	},
	aura = ai.Aura.COOLDOWN_MOD,
	isBuff = false,
	duration = 5,
	aura_param = 0.14,

	max_stacks = 5,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpacetimeAnomaly", },
	},
	aura_target_fx	= "particles/gadget/lightnings_debuff",
}

Spell.SpiralShield =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target =
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	aura = ai.Aura.INVULNERABILITY,
	duration = 2,
	isBuff = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_VesselSwitch1", },
	},
}

Spell.ShieldUpHolder =
{
	target 			= ai.SpellTarget.INFLICTOR,
	aura 			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_target 	=
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 55,
	aura_param		= 10,
	period			= 1,

	isBuff			= true,
	spell_on_cancel = "ShieldUp",
}

Spell.ShieldUpMult =
{
	influence = ai.Spell.CAST_SPELLS,
	spells= { 'ShieldUpHolder', 'ShieldUpSelf' }
}

Spell.ShieldUpDebuffIgnore =
{
	aura = ai.Aura.DEBUFF_IMMUNE,
	target 			=
	{
		target			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		--area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
		misc			= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	duration = 3,
	isBuff = true,
	-- ui_ico =
	-- {
		-- target_system 	= { tex = "ItemSubtype_VesselSwitch1", },
	-- },
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ProtonWall", },
	},
}

Spell.ShieldUp =
{
	target 			=
	{
		target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		--area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
		misc			= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	influence 			= ai.Spell.APPLY_SHELL,
	shell_def = "Shell_GreenShield",
	influence_param = 4000,
	duration = 8,
}

Spell.ShieldUpSelf =
{
	target 			=
	{
		target			= ai.SpellTargetGeneral.CASTER,
		class			= ai.SpellTargetClass.SHIP,
		--area			= ai.SpellTargetArea.AROUND,
		-- misc			= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	influence 			= ai.Spell.APPLY_SHELL,
	shell_def = "Shell_GreenShield",
	influence_param = 4000,
	duration = 8,
}

Spell.ShieldUpTest =
{
	target 			=
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	influence 			= ai.Spell.APPLY_SHELL,
	shell_def = "Shell_GreenShield",
	influence_param = 4000,
	duration = 8,
}

Spell.CleanseTarget=
{
	target = --ai.SpellTarget.LOCKED_ALLY_TARGET, --с этим тоже не работает
	{
		target			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	influence		= ai.Spell.CLEANSE,
}

Spell.StunTest =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	isBuff				= false,
	aura 				= ai.Aura.STUN,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration			= 100,
	aura_target		=
	{
		target =ai.SpellTargetGeneral.HOLDER,
	},
	-- min_targets_count = 1,
}

Spell.StunSelfTest =
{
	target =
	{
		target =ai.SpellTargetGeneral.CASTER,
	},
	isBuff				= false,
	aura 				= ai.Aura.STASIS,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration			= 5,
	aura_target		=
	{
		target =ai.SpellTargetGeneral.HOLDER,
	},
	-- min_targets_count = 1,
}

Spell.DamageSelf =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	aura_target =
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range	= 300,
	aura = ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_param = 3000,
	period = 1,
	duration = 3,
}

Spell.AddSparePartsTest =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	influence = ai.Spell.ADD_SPECIAL_AMMO,
	influence_param = 2,
	isBuff = true,
}

Spell.SlowByDestrTurret40 =
{
	isBuff			= false,
	aura			= ai.Aura.SLOW_MOVEMENT,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		misc = ai.SpellTargetMisc.VISIBLE_BY_CASTER
	},
	aura_param 		= 0.67,
	duration		= 3,--4.2,--6.0,
	--cast_fx			= "particles/gadget/aura_wave",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WebPropulsion", },
	},
	additional_auras =
	{
		{
			aura			= ai.Aura.SLOW_MANEUVER,
			aura_param		= 0.67,
			isBuff			= false,
			duration		= 3,--4.2,--6.0,
			apply_crowd_control_coef	= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_WebPropulsion", },
			},
		}
	}
}

Spell.GreenDroneHealMult =
{
	influence = ai.Spell.CAST_SPELLS,
	spells= { 'GreenDroneHealShield', 'GreenDroneHealHull' }
}

Spell.GreenDroneHealShield = --#72026: хил-спелл зеленого инженерного дрона-ракеты
{
	target = ai.SpellTarget.ALLY_AROUND,
	influence = ai.Spell.HEAL_SHIELD_SCALED,
	influence_param = 10000,
	target_range = 85,
	--[[mod_target = { --NOT USED
		class = ai.SpellTargetClass.SHIP,
		area = ai.SpellTargetArea.AROUND,
		relationship = ai.SpellTargetRelationship.ENEMY,
	},
	mod_range = 100,]]
	isBuff = true,
	cast_position_fx = "particles/gadget/aura_wave_green",
	aura_fx = "particles/gadget/shield_heal",
}

Spell.GreenDroneHealHull =
{
	target = ai.SpellTarget.ALLY_AROUND,
	influence = ai.Spell.HEAL_HULL_SCALED,
	influence_param = 10000,
	target_range = 85,
	isBuff = true,
}

Spell.AddScrapCharge =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	influence = ai.Spell.ADD_SPECIAL_AMMO,
	influence_param = 1,
	isBuff = true,
}

Spell.GreenRegenShield = --#70965
{
	aura = ai.Aura.HEAL_HULL_SCALED_PERIODIC, -- ai.Aura.HEAL_HULL_PERCENT_PERIODIC,
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	aura_param = 100, --0.03,
	period = 1,
	isBuff = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenRegenShield", },
	},
	aura_fx = "particles/gadget/matter_absorber",
}

Spell.EmergencyTeleportHolder = --#71644
{
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura = ai.Aura.EMERGENCY_SPELL,
	aura_param = 0.5,
	target_range = 300,
	duration = 20,
	target_spell = "EmergencyTeleportMult",
	isBuff = true,
	aura_fx = "particles/gadget/emergency_teleport_aura",
	min_targets_count = 1,
	--ignore_subtype  = false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EmergencyTeleporter", },
	},
	additional_auras =
	{
		{
			aura			= ai.Aura.FAST_MOVEMENT,
			target =
				{
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ALLY,
				},
			aura_param 		= 0.05,
			duration		= 20,
			isBuff			= true,
			apply_interval  = 60,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_MovementDamageBuff", },
			},
		},
--[[ 		{
			aura 			= ai.Aura.NONE,
			aura_target 	= ai.SpellTarget.HOLDER,
			gameplay_specific = true,
			isBuff			= false,
			duration		= 60,
			ui_ico =
			{
				target_system 	= { tex = "fuel_deficiency_ico", },
			},
		}, ]]
	}
}

--[[ Spell.EmergencyTeleportHolder_ = 
{
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	target_range = 300,

	--aura 			= ai.Aura.NONE,
aura 			= ai.Aura.FAST_MOVEMENT,
aura_param = 0.5,	
	--aura_target 	= ai.SpellTarget.HOLDER,
	gameplay_specific = true,
	isBuff			= false,
	duration		= 60,
	ignore_subtype  = true,
	ui_ico =
	{
		target_system 	= { tex = "fuel_deficiency_ico", },
	},
} ]]

Spell.EmergencyTeleportMult = --#71644
{
	influence = ai.Spell.CAST_SPELLS,
	spells= { 'EmergencyTeleport', 'EmergencySafeTeleport', 'EmegrencyEngineerBonusScrap' }
}

-- Spell.EmergencyTeleportPrepare =
-- {
	-- aura = ai.Aura.RESIST_ALL,
	-- target =
	-- {
		-- target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		-- class			= ai.SpellTargetClass.SHIP,
		-- relationship	= ai.SpellTargetRelationship.ALLY,
	-- },
	-- aura_param = 10,
	-- isBuff = true,
	-- duration = 0.7,
	-- spell_on_cancel = "EmergencyTeleport",
-- }

Spell.EmergencySafeTeleport =
{
	aura = ai.Aura.INVULNERABILITY,
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	isBuff = true,
	duration = 0.5,
	hud_visible = false,
}

Spell.EmergencyTeleport = --#71644
{
	influence = ai.Spell.TELEPORT_TO_CASTER, -- ai.Aura.HEAL_HULL_PERCENT_PERIODIC,
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	isBuff = true,
	in_fx 	= "particles/gadget/teleport_alien",
	out_fx 	= "particles/gadget/teleport_alien",

	in_sound = "sound/el_modules/EmergencyTeleporter_in",
	out_sound = "sound/el_modules/EmergencyTeleporter_out",


}

Spell.EmegrencyEngineerBonusScrap = --#71644
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	influence = ai.Spell.ADD_SPECIAL_AMMO,
	influence_param = 1,
	isBuff = true,
}

Spell.TestFxTeleport = --временный спеллдеф --#71644
{
	inherit = "EmergencyTeleport",
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,

	in_sound = "sound/el_modules/EmergencyTeleporter_in",
	out_sound = "sound/el_modules/EmergencyTeleporter_out",

	},
}

--спелл на дамаг
Spell.TestDamage =
{
	aura = ai.Aura.INVULNERABILITY,
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
		-- relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
		-- class			= ai.SpellTargetClass.SHIP,
		-- relationship	= ai.SpellTargetRelationship.ENEMY,
		-- area			= ai.SpellTargetArea.AROUND,
		-- misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	-- aura_range = 200,
	-- aura_param = 1000,
	duration = 30,
	-- period = 0.2,
	isBuff = true,
}

Spell.SendDrone =
{
	influence = ai.Spell.SEND_SATELLITE,
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	target_range = 500,
	isBuff = false,
	holder_def = "SatelliteHolder",
	drone_def = "GreenFrigateDroneAssistantOnAlly",
	drone_ttl = 25,
}

Spell.DroneHealAlly =
{
	aura = ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	target_range = 500,
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	isBuff = true,
	aura_param	= 1500,
	duration	= 2,
	period		= 1,
	
	ignore_stacks = true,
	ignore_subtype = true,
	
	influence_fx = "particles/gadget/matter_absorber_uncirculated",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FollowerDrone", },
	},
}

Spell.GreenGravyPush =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},

	aura = ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_target =
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura_param = 100,
	aura_range = 125,
	isBuff = false,
	period = 0.2,
	duration = 1.2,

	cast_fx = "particles/gadget/alien_gravypush_aura",
	aura_target_directed_fx = "particles/gadget/push_ray_hit",
	nebula	= "Effects_Nebula_GravyPush",
		
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenGravyPush", },
	},

	additional_auras =
	{
		{
			aura_target =
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				area			= ai.SpellTargetArea.AROUND,
			},
			aura = ai.Aura.SHIP_ATTRACTION,
			aura_param = -300,
			aura_range = 125,
			isBuff = false,
			duration = 1.2,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_GreenGravyPush", },
			},
		}
	},
}

Spell.GreenGravyPush_ScrapRegen =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	mod_target = --NOT USED
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
	},
	aura_target =
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
	},
	aura_range = 150,
	mod_range = 150,
	influence = ai.Spell.ADD_SPECIAL_AMMO,
	influence_param = 1,
	isBuff = true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HackSystems", },
	},
}

Spell.PlasmaSplashEnergy = --#71689 спелл, восполняющий энергию
{
	target 			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.ADD_ENERGY,
	influence_param = 800,
	isBuff = true,
}
-- не используется ?
Spell.EnergyDischarge =
{
	target 			= ai.SpellTarget.CASTER,
	influence			= ai.Spell.BURN_ENERGY,--Aura.ENERGY_VAMPIRE_PERIODIC,
	influence_param = 800000,
	isBuff = true,
}

Spell.HullTransfer =
{
	aura = ai.Aura.HULL_TRANSFER,
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP+ai.SpellTargetClass.OWNED_BY_SHIP+ai.SpellTargetClass.GUIDED_DRONE,
		relationship	= ai.SpellTargetRelationship.ALLY,
		misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NOT_CLOAKED,
	},
	aura_param = 100,
	aura_range = 350,
	duration = 10,
	period = 0.5,
	transfer_coef = 1.2,
	transfer_threshold = 0.2,
	isBuff = true,
	aura_target_directed_fx = "particles/gadget/heal_ray_influence",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HullTransfer", },
	},
	additional_auras =
	{
		{
			isBuff			= false,
			aura			= ai.Aura.SLOW_MOVEMENT,
			target =
			{
				target = ai.SpellTargetGeneral.CASTER,
			},
			aura_param 		= 0.5,
			duration		= 10,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_WebPropulsion", },
			},
		},
		{
			isBuff			= false,
			aura			= ai.Aura.SLOW_MANEUVER,
			target =
			{
				target = ai.SpellTargetGeneral.CASTER,
			},
			aura_param 		= 0.5,
			duration		= 10,
			apply_crowd_control_coef	= false,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_WebPropulsion", },
			},
		}
	}
}

Spell.HullTransferTest =
{
	aura = ai.Aura.HULL_TRANSFER,
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura_param = 100,
	aura_range = 425,
	duration = 10,
	period = 0.5,
	transfer_coef = 1.2,
	transfer_threshold = 0.2,
	isBuff = true,
	aura_target_directed_fx = "particles/gadget/heal_ray_influence",
}

Spell.SelfPassiveHullTransferRepl =
{
	aura = ai.Aura.HEAL_HULL_PERIODIC,
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	aura_param = 96,
	period = 1,
	isBuff = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HullTransfer", },
	},
	-- aura_fx = "particles/gadget/matter_absorber",
}

Spell.ReturnPoint_Weakness =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.SLOW_MANEUVER, --SLOW_MANEUVER
	duration		= 2.5,
	--period			= 0.5,
	aura_param		= 0.01,--3,
	isBuff			= false,
	ignore_additional_power = true,
	
	hud_visible 	= false,
	
	spell_on_cancel	= "Return_15",

	aura_fx 		= "particles/gadget/alien_gravypush_aura",
}

Spell.CrystallRedirect =
{
	isBuff			= true,
	target			=
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		misc			= ai.SpellTargetMisc.LESSER_HULL,
	},
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param		= 4500,
	duration		= 2,
	period			= 0.5,
	target_range	= 300,
	aura_fx = "particles/gadget/matter_absorber",
	cast_fx = "particles/gadget/add_energy_uncirculated",
	--ниже флаги для диминишинга аур от нескольких пассивных модулей
	ignore_stacks	= true,
	ignore_subtype	= true,
	diminish_aura_param = true,

	aura_sound = "sound/aura/heal",	

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldHealOnEnemyDeath", },
	},
}

Spell.CrystallRedirectMult =
{
	influence		= ai.Spell.CAST_SPELLS,
	spells			= { "CrystallRedirect", "CrystallRedirectSelf" },
}

Spell.CrystallRedirectSelf =
{
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.ADD_ENERGY,
	influence_param	= 70,

	aura_fx = "particles/gadget/matter_absorber",
	--ниже флаги для диминишинга аур от нескольких пассивных модулей
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldHealOnEnemyDeath", },
	},
}

Spell.UntouchableGhostHolder = --#71636
{
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura			= ai.Aura.UNTOUCHABLE,
	duration		= 3,
	aura_range		= 200,
	apply_interval	= 12,
	show_dispel_status	= true,
	aura_target_fx = "particles/gadget/invulnerability",

	aura_start_sound = "sound/aura/UntouchableGhost",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_UntouchableGhost", },
	},
	-- additional_auras =
	-- {
		-- {
			-- aura_target		= ai.SpellTarget.HOLDER,
			-- aura			= ai.Aura.UNTOUCHABLE,
			-- duration		= 3,
			-- aura_range		= 200,
			-- apply_interval	= 12,
			-- show_dispel_status	= true,
			-- aura_target_fx = "particles/gadget/invulnerability",
			-- ui_ico =
			-- {
				-- target_system 	= { tex = "ItemSubtype_ShieldHealOnEnemyDeath", },
			-- },
		-- },
	-- }
}

Spell.HullResistAoe =
{
	aura_range = 350,
	duration = 30,
	target = ai.SpellTarget.CASTER_POSITION_CASTER,
	influence = ai.Spell.APPLY_AURA,
	aura = ai.Aura.EMERGENCY_SPELL,
	aura_param = 0.25,
	target_spell = "HullResistAoeHeal",
	aura_fx =  "particles/gadget/protector_device_fx",
	end_effect = "particles/explosions/shp_exp_mid_alien",

	aura_end_sound = "sound/explosion/HullResistStation",
	initial_stacks = 1,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
		-- misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	isBuff = true,
	aura_holder_def = "HullResistStation",
	ui_ico = {
		target_system = { tex = "ItemSubtype_HullResistStation", },
	},
	additional_auras =
	{
		{
			aura = ai.Aura.RESIST_ALL,
			duration = 30,
			aura_param = 30,
			isBuff = true,
			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			aura_range = 350,
			ui_ico = {
				target_system = { tex = "ItemSubtype_HullResistStation", },
			},
		},
	}
}

Spell.HullResistAoeHeal =
{
	aura = ai.Aura.HEAL_HULL_PERCENT_PERIODIC,
	-- influence = ai.Spell.HEAL_HULL_SCALED,
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	duration = 1,
	period = 0.5,
	aura_param = 0.11,
	isBuff = true,
	-- influence_param	= 100000,
	influence_fx = "particles/gadget/saved_by_alien",
	
	aura_start_sound = "sound/aura/heal_oneshot",
	
}

Spell.HealScrapAttractor =
{
	influence_param		= 100,
	influence 		= ai.Spell.HEAL_SHIELD_SCALED,
	target 			= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,

	target_range		= 40,
	scale_on_weapon		= true,
	influence_sound 	= "sound/hit/heal",
}

Spell.KineticVamp =
{
	aura			= ai.Aura.HEAL_ON_HIT_SCALED,
	target			=
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		class			= ai.SpellTargetClass.SHIP,
	},
	aura_target		=
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	duration		= 10,
	isBuff			= true,
	aura_param		= 0.25,--0.1,

	hud_visible 	= false,
	hud_visible_holder	= true,
	isBuff_holder		= false,
	aura_fx			= "particles/gadget/kinetic_vamp",

	ui_ico = {
		target_system = { tex = "ItemSubtype_GreenHealRailgun", },
	},
}

Spell.Bonus_GreenCrystalHeal =
{
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param 		= 3000.0,
	duration		= 1.5,
	period			= 0.5,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.HOLDER,--ai.SpellTarget.ALLY_SHIPS_AROUND,
	-- aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
	additional_auras =
	{
		{
			aura = ai.Aura.HEAL_HULL_SCALED_PERIODIC,
			duration = 1.5,
			period = 0.5,
			aura_param = 2250,
			aura_range = 200,
			isBuff = true,
			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER + ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
			},
			ui_ico = {
				target_system = { tex = "ItemSubtype_RepairDronesSmall", },
			},
		}
	}
}

Spell.GreenPlatform_SelfShield = --#73192
-- {
	-- influence		= ai.Spell.APPLY_AURA,
	-- target			= {
		-- target 			= ai.SpellTargetGeneral.CASTER,
		-- class 			= ai.SpellTargetClass.BATTLE_STATION,
	-- },
	-- aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	-- target_spell	= "GreenPlatform_SelfShield_Shell",
	-- -- duration		= 5,
	-- period			= 7,
	-- isBuff			= true,
	-- -- ui_ico 		= { target_system 	= { tex = "ItemSubtype_FuelEmissions" } },

-- }
{
	target				= {
		target 			= ai.SpellTargetGeneral.CASTER,
		class 			= ai.SpellTargetClass.BATTLE_STATION,
	},
	-- influence_param = 2000,
	-- influence = ai.Spell.HEAL_HULL,
	aura				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param			= 300,
	isBuff				= true,
}

Spell.GreenPlatform_SelfShield_Shell = --#73192
-- {
	-- duration			= 6.8,
	-- target				= {
		-- target 			= ai.SpellTargetGeneral.CASTER,
		-- class 			= ai.SpellTargetClass.BATTLE_STATION,
	-- },
	-- influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	-- influence_param		= 5000,
	-- isBuff				= true,
	-- shell_def 			= "EmergencyShell_Shield",-- деф шкуры
-- }
{
	target				= {
		target 			= ai.SpellTargetGeneral.CASTER,
		class 			= ai.SpellTargetClass.BATTLE_STATION,
	},
	-- influence_param = 2000,
	-- influence = ai.Spell.HEAL_HULL,
	aura				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param			= 500,
	duration			= 2,
	period				= 0.5,
	isBuff				= true,
}

Spell.GreenPlatform_SelfResist = --#73192
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 35,
	isBuff			= true,
}

Spell.GreenPlatform_EnemySlowField = --#73192
{
	target			= ai.SpellTarget.CASTER,
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		
	},
	aura_range		= 350,
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 0.35,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "Station_ico_EnemySlowField", },
	},
}

Spell.GreenPlatform_AllyRepairField = --#73192
{
	target			= ai.SpellTarget.CASTER,
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 350,
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param		= 225,
	period			= 1,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "Station_ico_AllyRepairField", },
	},
}

Spell.GreenPlatform_AllyShieldEmitterField = --#73192
{
	target			= ai.SpellTarget.CASTER,
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 350,
	aura			= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	aura_param		= 300,
	period			= 1,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "Station_ico_AllyShieldEmitterField", },
	},
}

Spell.GreenPlatform_AllyEnergyEmitterField = --#73192
{
	target			= ai.SpellTarget.CASTER,
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 350,
	aura			= ai.Aura.ADD_ENERGY_PERIODIC,
	aura_param		= 200,
	period			= 1,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "Station_ico_AllyEnergyEmitterField", },
	},
}

Spell.GreenPlatform_AntiFocusField = --#73192
{
	target			= ai.SpellTarget.CASTER,
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 350,
	aura			= ai.Aura.OVERCHARGE, --ai.Aura.DEBUFF_IMMUNE,

	aura_param		= 0.25,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "Station_ico_BattleBuff", },
	},
}

Spell.BattleStation_SlowMode = 
{
	target			= 	{
		target 			= ai.SpellTargetGeneral.CASTER,
		class 			= ai.SpellTargetClass.BATTLE_STATION,
	},
	aura_target		= 	{
		target 			= ai.SpellTargetGeneral.HOLDER,
		class 			= ai.SpellTargetClass.BATTLE_STATION,
	},
	aura_range		= 125,
	aura			= ai.Aura.FIRE_RATE_MOD, --ai.Aura.DEBUFF_IMMUNE,
	
	aura_param		= -4,
	isBuff			= false,
}



Spell.ECMHack_Self = {
	influence 	= ai.Spell.CAST_SPELLS,
	spells		= { 'BlackoutGenerator', 'BlackoutGeneratorGapCloser' },
}
Spell.ECMHack = 
{
	target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
	},
	aura_target = {
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	target_range = 200,
	aura = ai.Aura.SPELL_ON_MODULE_ACTIVATION,
	duration = 10,
	target_spell = "EcmHackPain",
	isBuff = false,
	aura_sound = "sound/aura/stun",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ECMHack", },
	},
	aura_fx = "particles/gadget/lightnings_debuff",
	cast_fx = "particles/gadget/blackout_burst",
}
Spell.EcmHackPain = --прототип спелла модуля для корабля Zhen
{
	target =
	{
		target =ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	isBuff				= false,
	aura 				= ai.Aura.DISABLED_WEAPON,
	-- aura_param			= 10,
	duration			= 6,
	aura_target		=
	{
		target =ai.SpellTargetGeneral.HOLDER,
	},
	-- min_targets_count = 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ECMHack", },
	},
}



Spell.EcmHideandHack = 
{
	target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
	},
	aura_target = {
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	target_range = 200,
	aura = ai.Aura.SPELL_ON_MODULE_ACTIVATION,
	duration = 10,
	target_spell = "EcmHack",
	isBuff = false,
	aura_sound = "sound/aura/stun",
	ui_ico =
	{
		target_system 	= { tex = "Station_ico_BattleBuff", },
	},
	aura_fx = "particles/gadget/lightnings_debuff",
}

Spell.EcmHack1 = --прототип спелла модуля для корабля Zhen
{
	target =
	{
		target =ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	isBuff				= false,
	aura 				= ai.Aura.DISABLE_LOCK,
	-- aura_param			= 10,
	duration			= 5,
	apply_crowd_control_coef = true,
	aura_target		=
	{
		target =ai.SpellTargetGeneral.HOLDER,
	},
	-- min_targets_count = 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ECMHack", },
	},
	additional_auras = 
	{
		{
			aura = ai.Aura.SLOW_MOVEMENT,
			aura_target =
			{
				target =ai.SpellTargetGeneral.HOLDER,
			},
			isBuff = false,
			duration = 2.5,
			aura_param = 1,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_ECMHack", },
			},
		}
	}
}

Spell.ManueverOnModuleActivation = -- прототип спелла модуля для корабля Spike
{
	target =
	{
		target =ai.SpellTargetGeneral.CASTER,
	},
	isBuff				= true,
	aura 				= ai.Aura.FAST_MANEUVER,
	aura_param			= 0.5,
	duration = 10,
	aura_target		=
	{
		target =ai.SpellTargetGeneral.HOLDER,
	},
}

Spell.SpikeRam = -- прототип модуля для корабля Spike
{
	target 			= {
		target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION,
	},
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_target = 
	{
		target = ai.SpellTargetGeneral.CASTER, -- не используется
	},
	aura_range 		= 6,
	duration		= 1, --3
	aura_param		= -350,
	aura_holder_offset = Vec3( 0, 0, 4 ),
	aura_holder_attach_bone = "root",

	isBuff			= true,

	aura_start_sound = "sound/gadgets/ReverseThruster_activate",
}

Spell.SpikeRamImmune = 
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura		= ai.Aura.FORTIFICATION,
	duration		= 10,
	cast_position_fx = "particles/gadget/reverse_thruster",
	cast_sound 		= "sound/gadgets/ReverseThruster_activate",
}

-- Spell.SpikeRamDamage =
-- {
-- 	target 			= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR
-- 	aura			= ai.Aura.DAMAGE_KINETIC_PERIODIC,
-- 	aura_target		=
-- 		{
-- 			class			= ai.SpellTargetClass.SHIP,
-- 			area 			= ai.SpellTargetArea.IN_CYLINDER,
-- 			relationship	= ai.SpellTargetRelationship.ENEMY,
-- 		},
-- 	aura_param	= 1200,
-- 	aura_target_offset	= Vec3( 0, 0, -1 ),
-- 	aura_range	 	= 30,		--дальность луча
-- 	aura_extra_radius = 2,		--радиус луча
-- 	duration = 3,
-- }

Spell.ChargeOnKill =
{
	isBuff			= true,
	aura			= ai.Aura.CHARGE_SPELL,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	max_stacks		= 3,
	aura_param		= 0.25,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ChargedPlasmaWeb", },
	},
}

Spell.ChargedPlasmaWeb = 
{
	aura = ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_apply_fx = "particles/gadget/aura_breacktrough",
	aura_param = 395,
	aura_target = ai.SpellTarget.HOLDER,
	duration = 12,
	fixedInheritance = true,
	ignore_subtype = true,
	isBuff = false,
	period = 1,
	period_module_fx = "particles/gadget/plasma_web_module",
	period_module_my_fx = "particles/gadget/plasma_web_module",
	scale_on_weapon = true,
	target = ai.SpellTarget.LOCKED_TARGET,
	target_range = 200,
	uiDesc = "PlasmaWeb_Base_Desc",
	uiName = "PlasmaWeb_Base",
	ui_ico = 
	{
		target_system = 
		{
			tex = "ItemSubtype_PlasmaWeb",
		},
	},
	period_module_fx_number_by_stacks = { 2 },
}

Spell.CageTrap = 
{
	aura = ai.Aura.SHIP_ATTRACTION,
	aura_param			= 100,

	-- aura = ai.Aura.DAMAGE_EMP_PERIODIC

	duration = 15,
	aura_range			= 50,
	--target				= ai.SpellTarget.CASTER_POSITION_CASTER,
	target				= 	{
		target         = ai.SpellTargetGeneral.CASTER,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.POSITION,
	},
	aura_holder_def		= "CageTrapMineActiveHolder",
	aura_target = 
	{
		target				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.OUTSIDE,
		relationship		= ai.SpellTargetRelationship.ENEMY
	},
	isBuff = false,
	hud_visible 		= false,
	min_targets_count = 0,
	aura_fx ="particles/gadget/cagetrap_emmiter",
	additional_auras = 
	{
		{
			aura = ai.Aura.DISABLE_WARP,
			duration = 15,
			aura_target = 
			{
				target				= ai.SpellTargetGeneral.CONTEXT_TARGET,
				class 				= ai.SpellTargetClass.SHIP,
				relationship		= ai.SpellTargetRelationship.ENEMY
			},
			ignore_stacks = true,
			ignore_subtype = true,
			work_beam_target_root_fx = "particles/gadget/cagetrap_beam",
			isBuff			= false, -- SC-118152
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_CageTrap", },
			},
		}
	}
}

Spell.StealthandWarpDisable =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 180,
	isBuff			= true,

	dispell_flag	= ai.Dispell.ON_DAMAGE,
	--dispell_timeout	= 2,
	aura_execution_delay = 2.5,

	additional_auras = 
	{
		{
			aura = ai.Aura.DISABLE_WARP,
			aura_target = 
			{
				class 				= ai.SpellTargetClass.SHIP,
				relationship		= ai.SpellTargetRelationship.ENEMY,
				area			= ai.SpellTargetArea.AROUND,
			},
			aura_range = 40,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_SentryDroneHeavy", },
			},
			ignore_stacks = true,
			ignore_subtype = true,
		}
	}
}

Spell.NoiseSuppressor = --#83046
{
	aura = ai.Aura.CONTROL_IMMUNE_DEFERRED,
	duration = 20,
	deferred_duration = 5,
	isBuff = true,
	target = 	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	target_range = 300,
	aura_target = ai.SpellTarget.HOLDER,
	target_spell = "SupressorResist",
	ui_ico = { target_system = { tex = "ItemSubtype_NoiseSuppressor", }, },
}

Spell.SupressorResist = 
{
	aura = ai.Aura.RESIST_ALL,
	aura_param = 50,
	duration = 5,
	isBuff = true,
	target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
	aura_target = ai.SpellTarget.HOLDER,
	ui_ico = { target_system = { tex = "ItemSubtype_NoiseSuppressor", }, },
}

Spell.ProtectiveFire = 
{
	aura = ai.Aura.FIRE_RATE_MOD,
	aura_param = 1,
	isBuff = true,
	target = ai.SpellTarget.CASTER,
	aura_target = {
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range = 400,
	duration = 7,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ProtectiveFire", },
	},
}

Spell.EnergyShieldExtendHold =
{
	target 					= { 
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},  
	aura = ai.Aura.RESIST_ALL_DEC,
	aura_param = 0,
	isBuff = false,
	hud_visible 	= false,
	duration = 0.2,
	spell_on_cancel = "EnergyShieldExtend",
}

Spell.EnergyShieldExtend =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.PROLONG_AURAS,
	isBuff			= true,
	influence_param = 0.7,
	itemSubTypes 	= {ItemSubtype.EnergyShieldCommander, ItemSubtype.EnergyShieldRegen, ItemSubtype.EnhancedShooting},

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaCompressor", },
	},
}

Spell.RocketRedirection = 
{
	target = 	{
		class 			= ai.SpellTargetClass.ROCKET,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	target_range = 300,
	influence = ai.Spell.HACK_ROCKET,
	redirect_to_locked_target_amount = 2,
	isBuff			= false,
	influence_beam_fx = "particles/gadget/weaponhacker_beam",
	redirect_to_target = {
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	redirect_range = 600,
	max_rockets_per_target = 2,
}

Spell.RocketRedirection_Test = 
{
	target = 	{
		class 			= ai.SpellTargetClass.ROCKET,
		area			= ai.SpellTargetArea.AROUND,
		-- relationship	= ai.SpellTargetRelationship.ALLY,
	},
	target_range = 600,
	influence = ai.Spell.HACK_ROCKET,
	-- redirect_to_locked_target_amount = 2,
	isBuff			= false,
	influence_beam_fx = "particles/gadget/weaponhacker_beam",
	redirect_to_target = {
		target			= ai.SpellTargetGeneral.CASTER,
	},
	redirect_range = 600,
	max_rockets_per_target = 10,
}

Spell.MaxSpeedPlus100ShieldHull =
{
	aura 			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 		= 115,--// значение из старого speed_to_resist
	-- diminish_aura_param = true,
	-- ignore_stacks 	= true,
	-- ignore_subtype 	= true,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "ItemSubtype_AdaptiveForceField", },		},
	additional_auras =
	{
		{
			aura 			= ai.Aura.HULL_RESIST_ALL,
			aura_param 		= 115,--// значение из старого speed_to_resist
			-- diminish_aura_param = true,
			-- ignore_stacks 	= true,
			-- ignore_subtype 	= true,
			isBuff 			= true,
			ui_ico 			=	{		target_system 	= { tex = "ItemSubtype_AdaptiveForceField", },		},
		}
	}
}

Spell.DroneBuff = 
{
	aura 			= ai.Aura.DAMAGE_MOD,
	aura_param		= 1,
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	aura_target = 
	{
		class 			= ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 200,
	
	-- additional_auras =
	-- {
		-- {
		-- aura 			= ai.Aura.PROJECTILE_SPEED_MOD,
		-- aura_param		= 1,
		-- isBuff			= true,
		-- target			= ai.SpellTarget.CASTER,
		-- aura_target = 
		-- {
			-- class 			= ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
			-- area			= ai.SpellTargetArea.AROUND,
			-- relationship	= ai.SpellTargetRelationship.ALLY,
		-- },
		-- aura_range		= 200,		
		
		
		-- },
	-- },	
}

Spell.SpikeOnSpeedLaser =
{
	aura = ai.Aura.DAMAGE_MOD,
	aura_param = 0.05,
	aura_target = ai.SpellTarget.HOLDER,
	isBuff = true,
	max_stacks = 5,
	ui_ico = 
	{
		target_system = 
		{
			tex = "ItemSubtype_SpikeOnSpeedLaser",
		},
	},
}

Spell.RotSpeedOnMdlActivation =
{
	aura = ai.Aura.FAST_MANEUVER,
	aura_param = 0.4,
	aura_target = ai.SpellTarget.HOLDER,
	isBuff = true,
	duration = 8,
	ui_ico = 
	{
		target_system = 
		{
			tex = "ItemSubtype_RotSpeedOnMdlActivation",
		},
	},
}

Spell.TimeBoost_Wolfhound = 
{
	aura = ai.Aura.OVERCHARGE,

	aura_param = 0.35,
	aura_target = ai.SpellTarget.HOLDER,
	-- duration = 10,
	isBuff = true,
	target = ai.SpellTarget.CASTER,

	ui_ico = 
	{
		target_system = 
		{
			tex = "ItemSubtype_PassiveOvercharge",
		},
	},

	aura_apply_fx = "particles/gadget/aura_breacktrough",
	aura_fx = "particles/gadget/overdrive",
	aura_end_sound = "sound/gadgets/timeboost_end",
}

Spell.CloakingSingularity =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	aura_target		= ai.SpellTarget.HOLDER,
	duration		= 45,
	isBuff			= true,
--	aura_fx			= "particles/test/continuous_3",
--	aura_start_sound = "sound/gadgets/stealth_on",
--	aura_sound		= "sound/game/boost/small_start_loop",
--	aura_end_sound	= "sound/gadgets/stealth_off",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LongCloakingDevice", },
	},
	-- изменения в от #64709
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION, --+ ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,
}

Spell.CloakingSingularityN = 
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.COOLDOWN_MOD,
	aura_target		= ai.SpellTarget.HOLDER,
	aura_param		= 0.3,
	duration		= 45,
	isBuff			= false,
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION, --+ ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LongCloakingDevice", },
	},
	hud_visible 	= true, 
	additional_auras = 
	{
		-- { 
		-- 	aura			= ai.Aura.DISABLE_ENERGY_REGEN,
		-- 	aura_target		= ai.SpellTarget.HOLDER,
		-- 	duration		= 45,
		-- 	isBuff			= true,
		-- 	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION, --+ ai.Dispell.ON_DAMAGE,
		-- 	dispell_timeout	= 2,
		-- 	ui_ico =
		-- 	{
		-- 		target_system 	= { tex = "ItemSubtype_LongCloakingDevice", },
		-- 	},
		-- 	hud_visible 	= false, 
		-- },
		{
			aura			= ai.Aura.SHIELD_REGEN_MOD,
			aura_target		= ai.SpellTarget.HOLDER,
			aura_param		= -100,
			duration		= 45,
			isBuff			= false,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION, --+ ai.Dispell.ON_DAMAGE,
			dispell_timeout	= 2,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LongCloakingDevice", },
			},
			hud_visible 	= true, 
		}
	}
}

Spell.FlameThrowerFire = 
{
	aura 					= ai.Aura.DAMAGE_EMP_PERIODIC,
	-- target 					= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
	target = {
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship		= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target = 
	{
		target				= ai.SpellTargetGeneral.HOLDER,
	},
	--period					= 1,
	isBuff					= false,
	aura_param				= 150,
	duration				= 3.2,--7,
	period 					= 0.2,
	period_module_fx_number_by_stacks = { 5 },
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FlameThrower", },
	},
}

Spell.Flame = 
{
	aura 					= ai.Aura.DAMAGE_EMP_PERIODIC,
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target =
	{
		target 				= ai.SpellTargetGeneral.TRIGGER_TARGET,
		class 				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
	},
	aura_param 				= 150,
	duration 				= 4,--16.0,
	period					= 1,
	spell_on_cancel 		= "FlameThrowerFire",
	isBuff					= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FlameThrower", },
	},
}


Spell.Interference = 
{
	aura = ai.Aura.DISABLE_LOCK,
	duration = 2,
	isBuff = false,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	target =
	{
		target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	min_targets_count  = 1,
	aura_target = ai.SpellTarget.HOLDER,
	apply_interval = 8, --повторное наложение этой ауры от этого сабтайпа возможно только через указанное время
	show_dispel_status = false, -- не показывать диспелл-статус
	ui_ico = 
	{
		target_system = 
		{
			tex = "ItemSubtype_Flash",
		},
	},
	ignore_stacks = true, -- чтобы аура перенакладывалась каждый раз и срабытывал запрет apply_interval
	aura_sound = "sound/game/agony"
}

Spell.WeaponSelfOnSpeedPowerInit = 
{
	aura = ai.Aura.DAMAGE_MOD,
	aura_param = 0.13,
	isBuff = true,
	spell_on_cancel = "WeaponSelfOnSpeedPower",
}

Spell.WeaponSelfOnSpeedPower = 
{
	aura = ai.Aura.DAMAGE_MOD,
	aura_param = 0.13,
	isBuff = true,
	duration = 5,
}

Spell.WolfhoundOvercharge = 
{
	aura = ai.Aura.OVERCHARGE,
	aura_apply_fx = "particles/gadget/aura_breacktrough",
	aura_end_sound = "sound/gadgets/timeboost_end",
	aura_fx = "particles/gadget/overdrive",
	aura_param = 0.3,--0.25,
	aura_target = ai.SpellTarget.HOLDER,
	duration = 8,
	isBuff = true,
	target = ai.SpellTarget.CASTER,
	ui_ico = 
	{
		target_system = 
		{
			tex = "ItemSubtype_TimeBoost",
		},
	},
}

Spell.Spell_BarkOvercharge = 
{
	aura = ai.Aura.OVERCHARGE,
	aura_apply_fx = "particles/gadget/aura_breacktrough",
	aura_end_sound = "sound/gadgets/timeboost_end",
	aura_fx = "particles/gadget/overdrive",
	aura_param = 0.45,--0.25,
	aura_target = ai.SpellTarget.HOLDER,
	duration = 10,
	isBuff = true,
	target = ai.SpellTarget.CASTER,
	ui_ico = 
	{
		target_system = 
		{
			tex = "ItemSubtype_AB1",
		},
	},
}

Spell.SwapTeleport =   -- телепорт
{
	teleport_to_target = {
		target 			= ai.SpellTargetGeneral.CASTER,
		},
	target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		},
	teleport_offset_dir = Vec3(0, -1, 0),
	teleport_range			= 400,
	influence 				= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset			= 5,
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	in_fx = "particles/gadget/teleport",
	out_fx = "particles/gadget/teleport",
}

Spell.PreSwap = 
{
	target		= {
		target			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	aura_target = {
		target			= ai.SpellTargetGeneral.HOLDER, -- + ai.SpellTargetGeneral.CASTER,
	},
	target_range		= 200,
	aura				= ai.Aura.SLOW_MOVEMENT,
	duration			= 2.5,
	isBuff				= false,
	aura_param			= 0.02,
	spell_on_cancel		= "GuardSwapC",
	aura_target_fx		= "particles/gadget/teleport_prepare",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PositionSwap", },
	},
	hud_visible			= true,
}
Spell.PreSwap_Self = 
{
	target		= {
		target			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target = {
		target			= ai.SpellTargetGeneral.CASTER,
	},
	target_range		= 500,
	aura				= ai.Aura.SLOW_MOVEMENT,
	duration			= 2.5,
	isBuff				= false,
	aura_param			= 0.02,
	--spell_on_cancel		= "GuardSwapC",
	aura_target_fx		= "particles/gadget/teleport_prepare",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PositionSwap", },
	},
	hud_visible			= true,
}

Spell.GuardSwap = 
{
	influence	= ai.Spell.TELEPORT_SWAP,
	target		= {
		{
			target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
			class 			= ai.SpellTargetClass.SHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
			vitality		= ai.SpellTargetVitality.ALIVE,
		},
		{
			target 			= ai.SpellTargetGeneral.CASTER,
			class 			= ai.SpellTargetClass.SHIP,
		},
	},
	isBuff 					= false,
	min_targets_count		= 2,
	out_fx 					= "particles/gadget/teleport",
	out_sound				= "sound/el_modules/EmergencyTeleporter_in",

	-- influence_sound 		= "sound/el_modules/EmergencyTeleporter_in",
}


Spell.GuardSwapC = 
{
	influence	= ai.Spell.TELEPORT_SWAP,
	target		= {
		{
			--target 			= ai.SpellTargetGeneral.HOLDER, --target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
			target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
			class 			= ai.SpellTargetClass.SHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
			vitality		= ai.SpellTargetVitality.ALIVE,
		},
		{
			target 			= ai.SpellTargetGeneral.CASTER,
			class 			= ai.SpellTargetClass.SHIP,
		},
	},
	isBuff 					= false,
	min_targets_count		= 2,
	out_fx 					= "particles/gadget/teleport",
	out_sound				= "sound/el_modules/EmergencyTeleporter_in",

	-- influence_sound 		= "sound/el_modules/EmergencyTeleporter_in",
}

--[[
Spell.SwapTeleportDecel = --замедление
{
	target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET + ai.SpellTargetGeneral.CASTER,
		class			= ai.SpellTargetClass.SHIP,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura_target = {
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	aura = ai.Aura.SLOW_MOVEMENT,
	aura_param = 1000,
	isBuff = false,
	-- gameplay_specific = true,
	duration = 3,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CloakingDevice", },
	},
} ]]
-- переделан #0083846
-- Spell.StasisFixRay = 
-- {
-- 	target = 
-- 	{
-- 		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
-- 		relationship	= ai.SpellTargetRelationship.ENEMY,
-- 		class			= ai.SpellTargetClass.SHIP,
-- 		vitality		= ai.SpellTargetVitality.ALIVE,
-- 		misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
-- 	},
-- 	-- aura_target = {
-- 	-- 	target 			= ai.SpellTargetGeneral.HOLDER,
-- 	-- },
-- 	target_range = 300,
-- 	aura = ai.Aura.FORTIFICATION,
-- 	spell_on_cancel = "StasisFixRayWarpDisable",
-- 	-- aura_param = 100,
-- 	duration = 5,
-- 	apply_interval = 12.5,
-- 	show_dispel_status = false,
-- 	isBuff = true,
-- 	maintain_aura = true,
-- 	ui_ico =
-- 	{
-- 		target_system 	= { tex = "ItemSubtype_UfoStasis", },
-- 	},
-- }

Spell.EnergyNullifier = 
{
	target = {
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	aura_target = {
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
		misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura_range = 400,
	aura = ai.Aura.DISABLE_ENERGY_REGEN,
	duration = 15,
	isBuff = false,
	aura_target_directed_fx = "particles/gadget/burn_energy_directed",
	aura_sound 		= "sound/aura/EnergyNullifier",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyNullifier", },
	},
}

Spell.StasisFixRayWarpDisable = 
{
	target = {
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura = ai.Aura.DISABLE_WARP,
	duration = 5,
	isBuff = false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_UfoStasis", },
	},
}

Spell.WeaknessDetector =
{
	target = {
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	aura_target = {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	-- target_range = 300,
	aura = ai.Aura.PERSONAL_WEAKNESS,
	aura_param = 0.75,
	duration = 12,
	isBuff = false,
	min_targets_count = 1,
	aura_range = 400,
	additional_auras = 
	{
		{
			aura_target = {
				target 			= ai.SpellTargetGeneral.HOLDER,
			},
			aura = ai.Aura.FIRE_RATE_MOD,
			aura_param = 0.12,
			duration = 12,
			isBuff = true,
			ui_ico 			=
			{
				target_system 	= { tex = "ItemSubtype_WeaknessDetector", },
			},
		}
	},
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_WeaknessDetector", },
	},
}

Spell.HackAimingProtocol_main = 
{
	influence = ai.Spell.CAST_SPELLS,
	spells= { 'HackAimingProtocol_SelfInvul', 'HackAimingProtocol', }

}

Spell.HackAimingProtocol_SelfInvul = 
{
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 2.5,
	isBuff			= true,
	aura_fx 		= "particles/gadget/invulnerability",
	aura_sound 		= "sound/aura/invulnerability",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HackAimingProtocol", },
	},
}

Spell.HackAimingProtocol = 
{
	aura 			= ai.Aura.DISABLE_LOCK,
	duration		= 2.5,
	target =
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
		misc			= ai.SpellTargetMisc.LOCKER_OF_CASTER,
	},
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	target_range = 400,
	isBuff = false,
	apply_crowd_control_coef = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HackAimingProtocol", },
	},
	gun_spell_fx 	= "particles/gadget/weapon_instability",
	aura_sound = "sound/aura/stun",
}

Spell.StrikerBuff = 
{
	target = {
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	aura_target = {
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	aura 				= ai.Aura.PROJECTILE_SPEED_MOD,
	aura_param 			= 0.3,
	isBuff 				= true,
	duration 			= 15,
	max_stacks	 		= 5,
	can_stack			= true,
	aura_fx 			= "particles/gadget/striker_boost_aura",
	ui_ico 				=
	{
		target_system 	= { tex = "ItemSubtype_SingularityStriker", },
	},
}

Spell.EnhancedShooting = 
{
	target = {
		target 			= ai.SpellTargetGeneral.CASTER,
	},

	aura_target = {
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	aura = ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
	aura_param = 0.30,
	duration = 12,
	isBuff = true,
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_EnhancedShooting", },
	},

	additional_auras = 
	{
		-- {
		-- 	aura_target = {
		-- 		target 			= ai.SpellTargetGeneral.HOLDER,
		-- 	},
		-- 	aura = ai.Aura.DISABLE_HEAT,
		-- 	duration = 10,
		-- 	isBuff = true,
		-- 	ui_ico 			=
		-- 	{
		-- 		target_system 	= { tex = "ItemSubtype_EnhancedShooting", },
		-- 	},
		-- },
		{
			aura_target = {
				target 			= ai.SpellTargetGeneral.HOLDER,
			},
			aura 				= ai.Aura.RESIST_ALL,
			aura_param 			= 50,
			duration 			= 12,
			mod_update_period	 = 1,
			isBuff = true,
			mod_range = 375,
			aura_fx    =   "particles/gadget/shield_fortify",
			mod_target = --Module_EnhancedShooting
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
			},
			ui_ico 			=
			{
				target_system 	= { tex = "ItemSubtype_EnhancedShooting", },
			},
		},
--[[ 		{
			aura_target = {
				target 			= ai.SpellTargetGeneral.HOLDER,
			},
			aura = ai.Aura.RESIST_ALL,
			aura_param = 50,
			duration = 12,
			isBuff = true,
			ui_ico 			=
			{
				target_system 	= { tex = "ItemSubtype_EnhancedShooting", },
			},
		} ]]
	}
}

Spell.CoverShield =
{
	target 			=
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	target_range = 150,
	influence 			= ai.Spell.APPLY_SHELL,
	shell_def = "Shell_CoverShield",
	influence_param = 4000,
	duration = 7,
	
	isBuff = true,

	-- influence_sound = "sound/aura/covershield",
}

Spell.CoverShieldSelfShieldRegen =
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 100, -- *число модификаторов(врагов вокруг).
	duration		= 3,
	period			= 1,
	ignore_stacks	= true,
	ignore_subtype	= true,
	mod_range		= 150,
	mod_target		= --Module_CoverShield_15
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
			},

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_UfoShield", },
	},
	additional_auras = 
	{
		{
			aura			= ai.Aura.FAST_MOVEMENT,
			aura_param		= 0.75,
			duration		= 30,
			dispell_flag	= ai.Dispell.ON_DAMAGE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			isBuff 			= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
			},
		},
		{
			aura			= ai.Aura.DEBUFF_IMMUNE,
			duration		= 0.5,
			isBuff 			= true,
			hud_visible 	= false,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_UfoShield", },
			},
		}
	}
}

Spell.EMIMine =
{
	aura_range = 112.5,
	aura_param = 200,
	period = 0.5,
	duration = 2.5,
	target = ai.SpellTarget.CASTER_POSITION_CASTER,
	influence = ai.Spell.APPLY_AURA,
	aura = ai.Aura.ENERGY_HARVESTER,
	energy_blastwave = "EMIMine_Blastwave",
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target_fx = "particles/gadget/burn_energy",
	isBuff = false,
	aura_holder_def = "EMIMine",
	aura_fx = "particles/gadget/emi_mine",
	ui_ico = {
		target_system = { tex = "ItemSubtype_AoeStealthDrone", },
	},
}

Spell.EngineHack = 
{
	aura 			= ai.Aura.FORCE_BOOST,
	target			= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura_target		= {
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	isBuff			= false,
	duration		= 4,
	target_range	= 300,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,

	aura_sound = "sound/aura/engine_hack",

	aura_fx = "particles/gadget/lightnings_debuff",
	ui_ico = {
		target_system = { tex = "ItemSubtype_EngineHack", },
	},
	
	start_diminishing_timer	= false, --SC-112565 СТ. взлом контроллера двигателя - разное варемя дебафов
	
	additional_auras = 
	{
		{
			aura 			= ai.Aura.SLOW_MANEUVER,
			aura_target		= {
				target 			= ai.SpellTargetGeneral.HOLDER,
			},
			aura_param		= 9,
			isBuff			= false,
			duration		= 4,
			diminish_control_aura = true,
			apply_crowd_control_coef = true,
			
			ui_ico = {
				target_system = { tex = "ItemSubtype_EngineHack", },
			},
		}
	}
}

------------------------------
--****************************************************************************************************************
-- переработка серебра
--****************************************************************************************************************
------------------------------
--#76710
Spell.DeimosFaceHardener =
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	duration		= 6,
	aura_param		= 75,
	isBuff 			= true,
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_DeimosFace", },
	},
	aura_fx = "particles/gadget/shield_fortify",
}
Spell.DeimosFaceDamage =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target =
		{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.LOCKER_OF_HOLDER,
		},
	aura_range 		= 500,
	aura_param		= 100,
	aura_param_add	= 50,
	period			= 1,
	duration		= 6,
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,

	isBuff 			= false,
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_DeimosFace", },
	},
	period_sound	= "sound/el_modules/aftershock_fire",
	aura_target_directed_fx 		= "particles/gadget/damage_thermal",
}

Spell.DeimosRageOnEnemy =
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.CRIT_CHANCE,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 2, -- *число модификаторов(врагов вокруг).
	duration		= 5,
	period			= 1,
	ignore_stacks	= true,
	ignore_subtype	= true,
	spell_on_cancel = "DeimosRageOnEnemy",
	--hud_visible 	= false, -- прячем от игрока.
	disable_zero_stage = true,
	disable_aura_duration = true,
	mod_target		= --ModulePassive_DeimosRageOnEnemy_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	mod_range		= 350,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DeimosRageOnEnemy", },
	},
}

--DeimosEmitter
Spell.DeimosEmitter =
{
	aura_param			= 900,
	period				= 0.5,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.IN_CYLINDER,  --цилиндр радиуса aura_range и длиной target_range
	},
	aura_extra_radius	= 10,	--
	aura_range	 		= 75,	-- и длиной  может переопределяется aura_target_offset из модуля
	aura_target_offset 	= Vec3( 0, 0, -1 ),
	
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DeimosEmitter", },
	},
	--hud_visible			= false, -- прячем от игрока.
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_deimos_beam",
	period_fx	 		= "particles/gadget/pulsars/pulsar_deimos_hit",
	period_my_fx 		= "particles/gadget/pulsars/pulsar_deimos_hit",
}
--Deimos
Spell.RageBoost =
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.RESIST_ALL,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 50,
	duration		= 5,
	period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DeimosRageOnEnemy", },
	},
}


Spell.Decay_Creator =
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.WEAPON_HIT_TRANSMIT_SPELL,  -- #76846
	target_spell	= "Decay",
	aura_target 	= ai.SpellTarget.HOLDER,
	--aura_param		= 50,
	duration		= 7,
	isBuff			= true,
	--period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Decay", },
	},
}
Spell.Decay =
{
	--target 			= ai.SpellTarget.LOCKED_TARGET,
	target 			= { 
				target = ai.SpellTargetGeneral.CONTEXT_TARGET, 
				relationship	= ai.SpellTargetRelationship.ENEMY+ai.SpellTargetRelationship.NEUTRAL, },
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff			= false,
	aura  			= ai.Aura.DAMAGE_THERMAL_PERIODIC,  -- ?
	aura_param		= 10,
	duration		= 7,
	period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Decay", },
	},
	aura_fx		= "particles/gadget/damage_thermal"
}

Spell.Lynx2Shield =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff			= true,
	aura  			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param		= 100,
	period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Lynx2Shield", },
	},
}

Spell.CripplingClaws =
{
	target 			= ai.SpellTarget.INFLICTOR,
	--target_range	= 50,
	aura 			= ai.Aura.SLOW_MOVEMENT,  --ai.Aura.SLOW_MANEUVER, -- SLOW_MANEUVER делает контрол-деминишинг поэтому актуальное время снижается вдвое, используем нулевую ауру SLOW_MOVEMENT
	aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	aura_range		= 50,
	aura_param		= 0,
	duration		= 5,
	diminish_control_aura = false,
	isBuff			= false,
	spell_on_cancel = "CripplingClawsOut",
	hud_visible		= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CripplingClaws", },
	},
	use_dead_rcs_effects = true,
}
Spell.CripplingClawsOut =
{
	target 			= --только вражеские корабли	{ target = ai.SpellTargetGeneral.CONTEXT_TARGET, class = ai.SpellTargetClass.SHIP, relationship = ai.SpellTargetRelationship.ENEMY,}
					{
						target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
						class			= ai.SpellTargetClass.SHIP,
						--area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura 			= ai.Aura.SLOW_MANEUVER,
	diminish_control_aura = false,
	apply_crowd_control_coef = true,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 1, -- -50%
	duration		= 2,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CripplingClaws", },
	},
	use_dead_rcs_effects = true,
}



Spell.HerculesOrb =
{
	isBuff				= false,
	aura				= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param			= 1000,
	period				= 0.2,
	target 				= ai.SpellTarget.INFLICTOR,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_range			= 25,
	--aura_range_add = -20, --3 сек  = 300 дальность со скоростью 100

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HerculesOrb", },
	},
}

Spell.HerculesOrbFinal =
{
	target			= ai.SpellTarget.CASTER,
	duration		= 5,
	aura			= ai.Aura.CRIT_CHANCE,
	aura_param		= 0.35,
	influence		= ai.Spell.APPLY_AURA,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HerculesOrb", },
	},
}


Spell.WolfRun =
{
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 0.20,
--	duration		= 30,
	isBuff 			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WolfRun", },
	},
}

--weaponSpell
Spell.CritPlasmaWolfM =
{
	target =
	{
		--target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, --#80392
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc 			= ai.SpellTargetMisc.POSITION,
	},
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	isBuff				= false,
	aura 				= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param			= 545.45,  -- у пушки дпс 410,  дпс от всего корабля 1640 . дпс от облака 800
	duration			= 5,
	period				= 0.5,
	aura_range 			= 15,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CritPlasmaWolfM", },
	},

	aura_fx = "particles/gadget/damage_emp_plasma",
}

Spell.AchillesPylum =
{
	isBuff			= false,
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 600,
	aura_param_add  = 400, --расчет на 3 секунды полета. (2/3 от старта, чтобы в конце иметь х3)
	period			= 0.2,  -- 7-8 тиков в стоячий штурм при скорости прожектайла 85
	target 			= ai.SpellTarget.INFLICTOR,
	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 65,
	--aura_range_add  = -20, --расчет на 3 секунды полета.
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IsotopeHarvester", },
	},
}

Spell.SOps_AntiHuge =
{
	isBuff			= false,
	aura			= ai.Aura.DAMAGE_EMP_PERIODIC,
	duration 		= 0.2,
	aura_param		= 3000,
	period			= 0.2,  
--	target 			= ai.SpellTarget.INFLICTOR,
	target = 	{
					target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
					class			= ai.SpellTargetClass.SHIP,
					signature		= ai.SignatureMask.HUGE,
				},
--[[ 	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		signature		= ai.SignatureMask.HUGE,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_range		= 6,
 ]]	
	hud_visible 	= false, -- прячем от игрока
	ui_ico = { target_system 	= { tex = "ItemSubtype_IsotopeHarvester", }, },
}

Spell.SOps_AntiHuge_OW =
{
	isBuff			= false,
	aura			= ai.Aura.DAMAGE_EMP_PERIODIC,
	duration 		= 1,
	aura_param		= 5000,
	period			= 0.2,  
--	target 			= ai.SpellTarget.INFLICTOR,
	target = 	{
					target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
					class			= ai.SpellTargetClass.SHIP,
					signature		= ai.SignatureMask.HUGE,
				},
--[[ 	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		signature		= ai.SignatureMask.HUGE,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_range		= 6,
 ]]	
	hud_visible 	= false, -- прячем от игрока
	ui_ico = { target_system 	= { tex = "ItemSubtype_IsotopeHarvester", }, },
}



--	spell				= "SupportReinforce",  -- телепортирует кастера к дружественной цели
--	additional_spell	= "SupportReinforce_DefencePart", -- дает шкуру на себя и на дружественную цель
Spell.SupportReinforcePrepare =   --   это подготовительный спелл перед телепортом
{
	aura 				= ai.Aura.RESIST_ALL_DEC,
	aura_param			= 50,
	duration			= 1,-- 0.5,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SupportReinforce", },
	},
	aura_fx = "particles/gadget/teleport_prepare",
}
Spell.SupportReinforce =   -- это телепорт
{
	target					= ai.SpellTarget.CASTER,
	teleport_to_target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
--		misc 			= ai.SpellTargetMisc.POSITION,
		},
	teleport_range			= 400,
	influence 				= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset			= 15,
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	in_fx = "particles/gadget/teleport",
	out_fx = "particles/gadget/teleport",
}
Spell.SupportReinforce_DefencePart =  -- это спелл который накидывает 2 шкуры, на цель и себя
{
	influence		= ai.Spell.CAST_SPELLS,
	spells			= { "SupportReinforce_DefencePartHost", "SupportReinforce_DefencePartTarget" },
}
Spell.SupportReinforce_DefencePartHost =  -- шкура на себя
{
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.APPLY_SHELL,
	duration			= 7,
	influence_param		= 3000,
	isBuff				= true,
	shell_def 			= "SupportReinforce_Shield",-- деф шкуры SupportReinforce   --PairsShield_HostShield
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SupportReinforce", },
	},
}
Spell.SupportReinforce_DefencePartTarget =  -- шкура на цель
{
	target				= ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET_BY_CASTER,
	influence			= ai.Spell.APPLY_SHELL,
	duration			= 7,
	influence_param		= 3000,
	isBuff				= true,
	shell_def 			= "SupportReinforce_Shield",-- деф шкуры SupportReinforce   --PairsShield_HostShield
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SupportReinforce", },
	},
}

--weaponSpell
Spell.AxeShot_Crit =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, --#80392
		--target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
--		misc 			= ai.SpellTargetMisc.POSITION,
	},
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	aura 				= ai.Aura.RESIST_ALL_DEC,
	aura_param			= 25,
	duration			= 10,
	period				= 1,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AxeShot", },
	},
	--aura_fx = "particles/gadget/damage_emp_plasma",
}


Spell.EnergyOptimus =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	mod_target	 = --Module_EnergyOptimus_T4_Epic
		{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.LOCKER_OF_CASTER,
		},
	mod_range 		= 1000,
	ignore_stacks	= true,
	ignore_subtype	= true,
	aura_param		= 50,
	period			= 0.2,
	--duration		= 3,
	aura 			= ai.Aura.ADD_ENERGY_PERIODIC,
	--aura_fx = "particles/gadget/add_energy",
	--spell_on_cancel = "EnergyOptimus",
	mod_update_period = 3,
	disable_zero_stage = true,

	isBuff 			= true,
	--hud_visible 	= false, -- прячем от игрока.
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_EnergyOptimus", },
	},
}


--Ресист щита термо большой (45) + ресист термо (18) за друзей вокруг 3500м (щит)
--#78473
Spell.ShieldThermoGuard =
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.SHIELD_RESIST_THERMAL,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 10, -- *число модификаторов(врагов вокруг).
	--duration		= 5,
	period			= 1,
	ignore_stacks	= true,
	ignore_subtype	= true,
	--spell_on_cancel = "ShieldThermoGuard",
	--hud_visible 	= false, -- прячем от игрока.
	mod_update_period = 5,
	mod_target		= --Module_ShieldThermoGuard_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
	mod_range		= 350,
	disable_zero_stage = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldThermoGuard", },
	},
}

Spell.KatanaEnergy =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	ignore_stacks	= true,
	ignore_subtype	= true,
	aura_param		= 16,
	period			= 0.2,
	aura 			= ai.Aura.ADD_ENERGY_PERIODIC,
	isBuff 			= true,
--	hud_visible 	= false, -- прячем от игрока.
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_KatanaEnergy", },
	},
	aura_fx = "particles/gadget/add_energy",
}

--#78480
--Воруем энергию у врагов в 750-1000метров (все время)
Spell.FireStealingPot =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	=
		{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
	aura_param		= 10,   -- стоимость буста перехвата т3 = 80 е/с   нормальное значение видится в  2/3  от этого значения в радиусе 75-100
	aura_range		= 75,
	period			= 0.2,
	aura 			= ai.Aura.ENERGY_VAMPIRE_PERIODIC,
	isBuff 			= false,
	--hud_visible 	= false, -- прячем от игрока.
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_FireStealingPot", },
	},
	work_beam_target_root_fx = "particles/gadget/exhaustion_beam_energy",
	aura_target_fx = "particles/gadget/burn_energy",
}


Spell.BushidoCall =
{
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'BushidoCall_Instant', 'BushidoCall_HPS' }
}
Spell.BushidoCall_Instant =
{
	target 			= ai.SpellTarget.CASTER,
	influence 		= ai.Spell.HEAL_SHIELD,
	influence_param	= 4000, --3000,
}
Spell.BushidoCall_HPS =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff			= true,
	aura  			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 120, --80,   --4000 за 25 сек
	period			= 0.5,
	duration		= 10, --25,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BushidoCall", },
	},
	aura_fx 		= "particles/gadget/shield_boost",
	aura_start_sound 	= "sound/gadgets/EmergencyBarrier",
	
	additional_auras = 
	{
		{
			aura_target		= ai.SpellTarget.HOLDER,
			
			aura  			= ai.Aura.INVULNERABILITY,
			
			duration		= 0.5,
			
			isBuff			= true,
			hud_visible		= false,
		},
	},
}

Spell.MacheteCuttingEdge_Crit =
{
	target = {
			--target 			= ai.SpellTargetGeneral.LOCKED_TARGET,  -- в случае "спелл он крит" в ракете спелл кастуется в точке каждого кто словил крит и  LOCKED_TARGET не нужен
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ALLY,
			vitality		= ai.SpellTargetVitality.ALIVE,
	},
	target_range = 75,
--	aura_target 		= 	{
--			class 			= ai.SpellTargetClass.SHIP,
--			area			= ai.SpellTargetArea.AROUND,
--			relationship 	= ai.SpellTargetRelationship.ALLY,
--			vitality		= ai.SpellTargetVitality.ALIVE,
--	},
	influence			= ai.Spell.APPLY_SHELL,
	shell_def 			= "EmergencyShell_Shield",-- деф шкуры
	duration			= 10,
	influence_param		= 3000,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MacheteCuttingEdge", },
	},
	aura_fx = "particles/gadget/damage_emp_plasma",
}

Spell.MacheteCuttingEdge_Crit_test1 =
{
	target = 	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc 			= ai.SpellTargetMisc.POSITION,
	},
	aura_target 		= 		{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	isBuff				= false,
	aura 				= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param =1,
	--aura 				= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell		= "MacheteCuttingEdge_Shell",
	duration			= 11,
	period				= 1,
	aura_range 			= 100,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CritPlasmaWolfM", },
	},

	aura_fx = "particles/gadget/damage_emp_plasma",
}
Spell.MacheteCuttingEdge_test2 =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc 			= ai.SpellTargetMisc.POSITION,
	},
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	isBuff				= false,
	aura 				= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param			= 400,  -- у пушки дпс 410,  дпс от всего корабля 1640 . дпс от облака 800
	duration			= 7,
	period				= 0.5,
	aura_range 			= 15,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CritPlasmaWolfM", },
	},

	aura_fx = "particles/gadget/damage_emp_plasma",
}
Spell.MacheteCuttingEdge_Shell =
{
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	shell_def 			= "PairsShield_HostShield",-- деф шкуры
	duration			= 10,
	influence_param		= 2000,
}


--78485: Пушка на Prometheus X (термический выжигатель энергии)
Spell.PrometheusFire_Crit = {
	target =
	{
		--target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, --#80392
		class			= ai.SpellTargetClass.SHIP ,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
--		misc 			= ai.SpellTargetMisc.POSITION,
	},
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	aura 				= ai.Aura.BURN_ENERGY_PERIODIC,
	aura_param			= 15,  -- *3 * 5
	duration			= 3,
	period				= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PrometheusFire", },
	},
	aura_target_fx = "particles/gadget/burn_energy",
}


Spell.HerculesGust =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.SHIELD_BURN_PERIODIC,  -- Периодически отнимает у цели shield_max * aura_param единиц щита
	aura_target 	= ai.SpellTarget.ENEMY_IN_CYLINDER,
	aura_range	 	= 400,
	aura_extra_radius	= 4,
	aura_param		= 0.07,   --42% (6 тиков)
	duration 		= 1,
	period			= 0.2,
	isBuff			= false,
	work_beam_fx	= "particles/weapons/laser/hercules_ray1",
	--work_beam_fx	= "particles/weapons/laser/laser_basic_beam",
	ray_sound 		= "sound/destroyer/TRay_beam",
	fixed_cylinder_target = false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HerculesGust", },
	},
}
Spell.HerculesGust_End =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	aura_target 	= ai.SpellTarget.ENEMY_IN_CYLINDER,
	aura_range	 	= 400,
	aura_extra_radius = 4,
	aura_param		= 1000,
	duration 		= 0.4,
	period			= 0.2,
	fixed_cylinder_target = false,
	isBuff			= false,
	work_beam_fx	= "particles/weapons/laser/hercules_ray2",
	ray_sound 		= "sound/destroyer/TRay2_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HerculesGust", },
	},
}

Spell.MacheteFury = {
	duration			= 8,
	period				= 1,
	aura_param 			= 0.35, -- + бонус за потраченую энергию
	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.FIRE_RATE_MOD,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MacheteFury", },
	},
}
Spell.MacheteFury_Ally = {
	duration			= 8, --8
	period				= 1,
	aura_param 			= 0, -- + бонус за потраченую энергию
	target				= ai.SpellTarget.CASTER,
	aura_target			= {
			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ALLY,
			misc 			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
						},
	aura_range 			= 460,
	aura				= ai.Aura.FIRE_RATE_MOD,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MacheteFury", },
	},
}


--все время дает носителю +15 - 20 % урона.   при активации на 12 секунд дает всем союзникам в радиусе 4600м +75% скорости полета снаряда.
--#78373
Spell.FastShootAxe = {
	duration			= 10, --8
	--period				= 1,
	aura_param 			= 0.5, -- 
	target				= ai.SpellTarget.CASTER,
	aura_target			= {
			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ALLY,
			--misc 			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
							},
	aura_range 			= 460,
	aura				= ai.Aura.PROJECTILE_SPEED_MOD,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FastShootAxe", },
	},
	gun_spell_fx	= "particles/gadget/gun_buff",
}
Spell.FastShootAxe_Self = {
	aura_param 			= 0.15,
	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.DAMAGE_MOD,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FastShootAxe", },
	},
}

-- #78474
Spell.MacheteBox =
{
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura 			= ai.Aura.COOLDOWN_MOD,
	aura_target		= {
		class 			= ai.SpellTargetClass.SHIP,
		area 			= ai.SpellTargetArea.AROUND,
		--relationship 	= ai.SpellTargetRelationship.ENEMY,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		vitality 		= ai.SpellTargetVitality.ALIVE,
		misc=ai.SpellTargetMisc.VISIBLE_BY_HOLDER
		},
	aura_range		= 150,
	aura_param		= -0.2,
	isBuff			= true,
	aura_holder_def	= "MacheteBox",
	duration 		= 30,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MacheteBox", },
	},
	additional_auras =
	{
		{
			isBuff			= false,
			aura_target		= {
				class 			= ai.SpellTargetClass.SHIP,
				area 			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				--relationship 	= ai.SpellTargetRelationship.ALLY,
				vitality 		= ai.SpellTargetVitality.ALIVE,
				misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER
				},
			aura_range		= 75,
			aura_param		= 10,
			period			= 0.2,
			target			= ai.SpellTarget.CASTER_POSITION_CASTER,
			aura			= ai.Aura.BURN_ENERGY_PERIODIC,
			aura_target_fx = "particles/gadget/burn_energy",
			duration		= 30,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_MacheteBox", },
			},
		}
	}
}

Spell.KatanaRiposte =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target 	= ai.SpellTarget.ENEMY_IN_CYLINDER,
	aura_range	 	= 400,
	aura_extra_radius = 10,
	aura_param		= 600,   --x15(16)  9600
	duration 		= 3,
	period			= 0.2,
	isBuff			= false,
	fixed_cylinder_target = true,
	work_beam_fx	= "particles/weapons/laser/hercules_ray1",
	ray_sound 		= "sound/destroyer/TRay_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KatanaRiposte", },
	},
}
Spell.KatanaRiposte_Self = {
	aura_param 			= 100,
	duration			= 12,
	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.SHIELD_RESIST_EMP,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KatanaRiposte", },
	},
}

--[[
Spell.PrometheusPot = {
	target 			= {
		--target 	= ai.SpellTargetGeneral.LOCKED_TARGET, --ai.SpellTargetGeneral.INFLICTOR,
		target 	= ai.SpellTargetGeneral.CASTER,
		misc	= ai.SpellTargetMisc.POSITION,
		},

	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_range 		= 100,
	aura_param 		= 10,
	duration 		= 20,
	period			= 1,
	aura_holder_def	= "MacheteBox",
	isBuff 			= false,

		period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
		period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",

		period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
		period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2",
		period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",

	ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_PrometheusPot", },
		},
} ]]

Spell.PrometheusPot = {
	target 			= {
		--target 	= ai.SpellTargetGeneral.LOCKED_TARGET, --ai.SpellTargetGeneral.INFLICTOR,
		target 	= ai.SpellTargetGeneral.AIM,
		misc	= ai.SpellTargetMisc.POSITION,
		},
	target_range	= 400,
	aura_target		= 	{
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
						misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						},
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,  -- скалирование и по размеру и по аура ренж (30-100%)
	aura_range 		= 75,
	aura_param 		= 400,
	duration 		= 7,
	period			= 1,
	aura_holder_def	= "PrometheusPot",
	isBuff 			= false,

		period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
		period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",

		period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
		period_my_fx		= "particles/gadget/pulsars/pulsar_hit_2",
		period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",

	ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_PrometheusPot", },
		},
}


-- #78487
-- вокруг выбранной точки отталкиваются враги,  получая урон  //  на себя накидывается шкура
Spell.KatanaSPush =
{
	target 			= {
		--target 	= ai.SpellTargetGeneral.LOCKED_TARGET, --ai.SpellTargetGeneral.INFLICTOR,
		target 	= ai.SpellTargetGeneral.AIM,
		misc	= ai.SpellTargetMisc.POSITION,
		},
	target_range	= 400,
		--aura_holder_def	= "PrometheusPot",

	aura_target =
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		area			= ai.SpellTargetArea.AROUND,
		misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura = ai.Aura.SHIP_ATTRACTION,
	aura_param = -100,
	aura_range = 85,
	isBuff = false,
	duration = 1.5,
	hud_visible 	= true,

	aura_target_fx = "particles/gadget/ship_attraction_katana",
	aura_start_sound 	= "sound/el_modules/GreenGravyPush",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KatanaSPush", },
	},
	
	additional_auras =
	{
		{
				target 			= {
				target 	= ai.SpellTargetGeneral.AIM,
				misc	= ai.SpellTargetMisc.POSITION,
				},
			target_range	= 400,
			aura_target =
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
				area			= ai.SpellTargetArea.AROUND,
				misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
			},
			aura = ai.Aura.DAMAGE_KINETIC_PERIODIC,
			aura_param = 250,
			aura_range = 85,
			isBuff = false,
			hud_visible 	= true,
			period = 0.5,
			duration = 1.5,

			aura_target_fx = "particles/gadget/ship_attraction_katana",
			aura_start_sound 	= "sound/el_modules/GreenGravyPush",
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_KatanaSPush", },
			},
		},
	},	
	
}

Spell.KatanaSShell =
{
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	isBuff				= true,
	shell_def 			= "KatanaSPush_Shell",-- деф шкуры
	influence_param		= 3500,
	duration			= 7,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KatanaSPush", },
	},
}


Spell.TarZone =
{
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura				= ai.Aura.SLOW_MANEUVER,
	aura_param			= 0.4286, -- -30%
	aura_range			= 150,
	isBuff				= false,
	apply_crowd_control_coef	= true,
	--cast_fx = "particles/gadget/alien_gravypush_aura",
	--aura_target_directed_fx = "particles/gadget/push_ray_hit",
	--aura_target_directed_fx = "particles/gadget/ship_attraction_katana",
	{
		target_system 	= { tex = "ItemSubtype_TarZone", },
	},
	use_dead_rcs_effects = true,
}

--#0080049: Заграды модификатор капаситора на Fox-M (EnergyBurner)
Spell.EnergyBurner = {
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		target				= ai.SpellTargetGeneral.LOCKED_TARGET,
		--area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura				= ai.Aura.BURN_ENERGY_PERIODIC,
	aura_param			= 14, -- 70ед
	period 				= 0.2,
	aura_range			= 100,
	isBuff				= false,
	min_targets_count	= 0,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyBurner", },
	},
}

Spell.ShieldRenew = {
	target				= ai.SpellTarget.CASTER,
	aura_target = {
		target 				= ai.SpellTargetGeneral.HOLDER,
		},
	aura				= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param			= 70, --  4090 - база, 5000 ожидание 4500 - целевой хил  - 69
	period 				= 0.2,
	duration			= 6.4,
	isBuff				= true,
	cast_fx				= "particles/gadget/shield_boost",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldRenew", },
	},
}

Spell.KatanaPrepare = {
	target				= ai.SpellTarget.CASTER,
	aura_target = { target 				= ai.SpellTargetGeneral.HOLDER, },
	aura				= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param			= 150, --  4090 - база, 5000 ожидание 3000 - целевой хил  - 60
	period 				= 0.5,
	duration			= 10,
	dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE, --+ ai.Dispell.ON_DAMAGE,  + ai.Dispell.ON_COLLISION
	dispell_timeout		= 2,
	isBuff				= true,
	ignore_stacks		= true,
	ignore_subtype		= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KatanaPrepare", },
	},
	cast_fx				= "particles/gadget/shield_boost",
	additional_auras =
	{
		{
			isBuff			= true,
			--target			= ai.SpellTarget.CASTER,
			aura_target		= {
				target 				= ai.SpellTargetGeneral.HOLDER,
			},
			duration		= 15,
			aura			= ai.Aura.COOLDOWN_MOD,
			aura_param		= -0.25,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE, --+ ai.Dispell.ON_DAMAGE,  + ai.Dispell.ON_COLLISION
			dispell_timeout	= 2,
			ignore_stacks	= true,
			ignore_subtype	= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_KatanaPrepare", },
			},
		}
	}
}

Spell.CatConcentration = {
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY+ ai.SpellTargetRelationship.NEUTRAL,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura				= ai.Aura.SPY_DRONE,
	ignore_subtype_if_other_team = true,
	aura_range			= 300,

	duration			= 10,
	isBuff				= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CatConcentration", },
	},
}

Spell.CatConcentration_Self = {
	target				= ai.SpellTarget.CASTER,
	aura_target 		= { target = ai.SpellTargetGeneral.HOLDER, },
	aura				= ai.Aura.PROJECTILE_SPEED_MOD,
	aura_param			= 2, 
	duration			= 10,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CatConcentration", },
	},
}


Spell.GuidedDronFoxSlow = {
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NEAREST,	 --
	},
	aura				= ai.Aura.SLOW_MOVEMENT,
	aura_range			= 100,
	aura_param			= 3,
	--duration			= 10,
	min_targets_count 	= 0,  -- если не указать аура самодиспелится
	isBuff				= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GuidedDronFoxSlow", },
	},
}


Spell.ActiveHunting = {
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	mod_range		= 175,
	mod_target		= --Module_ActiveHunting_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	mod_max			= 6,
	aura			= ai.Aura.FAST_MANEUVER,
	aura_param		= 0.25,
	--duration		= 1,
	--period			= 1,
	isBuff			= true,
	ignore_stacks	= true,
	ignore_subtype	= true,
	--spell_on_cancel = "ActiveHunting",
	--hud_visible 	= false, -- прячем от игрока
	--disable_aura_duration = true,
	--disable_zero_stage = true,
	mod_update_period = 1,
	disable_zero_stage = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ActiveHunting", },
	},
}

--  спелл-подготовка перед FoxMShot
Spell.FoxMShot_Self =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.FAST_MANEUVER, --FAST_MANEUVER,--!!!
	aura_param		= 0.05, --!!!
	duration		= 1,--1.5,
	isBuff			= true,
	hud_visible 	= false, -- прячем от игрока
	--aura_fx	= "particles/weapons/laser/hercules_ray1_charge",
}

Spell.FoxMShot = {
	influence = ai.Spell.CAST_SPELLS,
	spells= { 'FoxMShot1', 'FoxMShot2' },
	aura_range		= 400, -- параметр нужен для корректного отображения изменения тултипа SC-115429
}

Spell.FoxMShot1 = {
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target 	=
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 20,
	aura_range		= 450,

	aura_param		= 100,   --x2
	duration 		= 0.4, --0.2,
	period			= 0.2,
	ignore_stacks	= true,
	ignore_subtype	= true,
	isBuff			= false,
	work_beam_fx	= "particles/weapons/laser/hercules_ray1",
	ray_sound 		= "sound/destroyer/TRay_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FoxMShot", },
	},
}
-- бонусный урон по перехватам!
Spell.FoxMShot2 = {
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target 	=
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		signature		= ai.SignatureMask.SMALL + ai.SignatureMask.TINY,
	},
	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 20,
	aura_range		= 450,

	aura_param		= 100,   --x2
	duration 		= 0.4, --0.2,
	period			= 0.2,
	ignore_stacks	= true,
	ignore_subtype	= true,
	isBuff			= false,
--	work_beam_fx	= "particles/weapons/laser/hercules_ray1",  -- есть для эффектов спелл FoxMShot1
--	ray_sound 		= "sound/destroyer/TRay_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FoxMShot", },
	},
}

-- хилим себе корпус
Spell.FoxEscapeFromBattle =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 10,
	duration		= 10,
	period			= 1,
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE, --+ ai.Dispell.ON_DAMAGE, + ai.Dispell.ON_COLLISION
	dispell_timeout	= 1,
	isBuff			= true,
	cast_fx			= "particles/gadget/shield_boost",
	ui_ico 			= { target_system = { tex = "ItemSubtype_FoxEscapeFromBattle", }, },
}

-- для сброса хила при выходе из невидимости (удалить - сделать на единицу больше отхила, убрать милисекунду из оригинального отхила)
Spell.FoxEscapeFromBattle1 =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 11,
	duration		= 0.1,
	period			= 1,
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE, --+ ai.Dispell.ON_DAMAGE, + ai.Dispell.ON_COLLISION
	hud_visible		= false,
	isBuff			= true,
	cast_fx			= "particles/gadget/shield_boost",
	ui_ico 			= { target_system = { tex = "ItemSubtype_FoxEscapeFromBattle", }, },
}

-- хамелеон
Spell.FoxEscapeFromBattle_Hide =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.ANTI_RADAR,
	duration		= 10,
	isBuff			= true,
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	dispell_timeout	= 1,
	ui_ico 			= { target_system = { tex = "ItemSubtype_FoxEscapeFromBattle", }, },
	aura_fx 		= "StealthEffect",
}

Spell.KatanaMineLayer =
{
	target = {
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
			},
	target_range	= 20,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_target_fx = "particles/gadget/slow_movement",
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 0.6666666, -- -40%
	duration		= 4,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_KatanaMineLayer", }, },
}


Spell.HorrorHowl =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},

	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 20,
	aura_range		= 300,

	aura 			= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 99,   --x2

	duration 		= 3.5, --0.2,
	period			= 1,
	isBuff			= false,
	work_beam_fx	= "particles/weapons/horror_howl_beam/beam",
	--work_beam_fx	= "particles/gadget/propulsion_beam",
	--aura_target_fx = "particles/gadget/slow_movement_fullstop",
	--aura_fx = "particles/gadget/slow_movement",
	ray_sound 		= "sound/destroyer/TRay_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HorrorHowl", },
	},
}


Spell.DiverTransparency = {
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'DiverTransparency_Base', 'DiverTransparency_Dispell' }  --DEBUFF_IMMUNE
}

Spell.DiverTransparency_Base = {
	influence		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.UNTOUCHABLE,

	duration 		= 5,--7,
	isBuff			= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_DiverTransparency", }, },
}


Spell.DiverTransparency_Dispell = {
	influence		= ai.Spell.CLEANSE,
}

Spell.DiverTransparency_Weak =  {
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SILENCE,
	duration 					= 5,
	isBuff						= false,
	ignore_additional_power 	= true,
	diminish_control_aura 		= false,
	apply_crowd_control_coef	= true,
	gameplay_specific 			= true,
	ui_ico 						= { target_system = { tex = "ItemSubtype_DiverTransparency", }, },
}

Spell.HardRadiation = {
	influence		= ai.Spell.APPLY_AURA,
	target			= {
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
		},
	target_range	= 200,
	target_extra_radius = 90,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	--aura_extra_radius  = 30, --основание конуса
	--aura_range		= 300, -- высота конуса
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	--aura 			= ai.Aura.CAST_SPELL_PERIODIC,
--	target_spell	= "HardRadiation_Real",
	min_targets_count	= 1, -- SC-113162 СТ. Аура от модуля "Массовое плазменное возмущение" не скидывается аурами антиконтроля

	--aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	duration		= 12,
	aura_param 		= 10,
	period			= 0.5,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HardRadiation", }, },
}
--[[
Spell.HardRadiation_Real = {
	influence		= ai.Spell.APPLY_AURA,
	--target 			= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	duration		= 10,
	aura_param 		= 10,
	period			= 1,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HardRadiation", }, },
}
]]

Spell.Backstab =   -- это телепорт
{
	target					= ai.SpellTarget.CASTER,
	teleport_to_target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
--		misc 			= ai.SpellTargetMisc.POSITION,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS,
		},
	teleport_range			= 300,
	influence 				= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset_dir		= Vec3( 0, 0, 1 ),
	teleport_offset			= 15,
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	in_fx = "particles/gadget/teleport",
	out_fx = "particles/gadget/teleport",
}

Spell.Backstab_ShieldHardness =
{
	influence		= ai.Spell.APPLY_AURA,
	target 			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.RESIST_ALL,
	duration		= 7.5,
	aura_param 		= 100,
	isBuff			= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_Backstab", }, },
}

Spell.RadiationCloud = {
	--influence		= ai.Spell.APPLY_AURA,
	target 			= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION },
	--target == ai.SpellTarget.CASTER_POSITION,
	--aura_holder_def	= "MacheteBox",
	aura_target 	=
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		relationship	= ai.SpellTargetRelationship.ENEMY,  -- + ai.SpellTargetRelationship.NEUTRAL
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius	= 40, --основание конуса
	aura_range		= 150, -- высота конуса
	aura_target_offset 	= Vec3( 0, 0, -1 ),
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	--aura 			= ai.Aura.CAST_SPELL_IN_THE_END,
	--target_spell	= "RadiationCloud_Real",
	aura_param 		= 6,
	duration		= 10,
	period			= 0.5,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_RadiationCloud", }, },
}

Spell.EnergyDiversion =
{
	target			= ai.SpellTarget.CASTER,

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	
	aura_fx 			= "particles/weapons/hawk_energy_diversion/laser_shot",
	--fixed_cylinder_target = false, -- подвижно но тогда эффект не очень
	fixed_cylinder_target = true,
	aura_target_offset 	= Vec3( 0, 0, -1 ), -- вперед
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius	= 45,
	aura_range			= 200,

	mod_range		= 100,
	mod_target		= --Module_EnergyDiversion_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				vitality		= ai.SpellTargetVitality.ALIVE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	mod_max			= 3,

	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 150,
	duration		= 0.6,
	period			= 0.2,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_EnergyDiversion", }, },
}
Spell.EnergyDiversion_Burn = {
	target			= ai.SpellTarget.CASTER,
	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	--fixed_cylinder_target = false, -- подвижно но тогда эффект не очень
	fixed_cylinder_target = true,
	aura_target_offset 	= Vec3( 0, 0, -1 ), -- вперед
	aura_apply_fx 	= "particles/weapons/hawk_energy_diversion/burn_energy",
	aura_range		=  150, -- должно быть равно mod_range от EnergyDiversion
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	aura_param		= 200,
	duration		= 0.2,
	period			= 0.2,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_EnergyDiversion", }, },
}


Spell.SaveJump = {
	target					= ai.SpellTarget.CASTER,
	teleport_to_target		= {
		--target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc 			= ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_CASTER,
--		misc 			= ai.SpellTargetMisc.POSITION,
		area			= ai.SpellTargetArea.AROUND,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS,
		},
	--aura_range				= 500,
	teleport_range			= 750,
	influence 				= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset_dir		= Vec3( 0, 0, 1 ),
	teleport_offset			= 15,
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	in_fx = "particles/gadget/teleport",
	out_fx = "particles/gadget/teleport",
}
Spell.SaveJump_HullRestore = {
	influence		= ai.Spell.APPLY_AURA,
	target 			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.HEAL_HULL_PERIODIC,
	duration		= 10,
	aura_param 		= 100,
	period			= 1,
	isBuff			= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_SaveJump", }, },
}


Spell.ChaosSpawner = {
	--target			= ai.SpellTarget.CASTER,
	--aura_
	target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	target_range	= 225,
	aura_range		= 225, -- для тултипа равно target_range
	aura			= ai.Aura.DISABLE_LOCK,
	apply_crowd_control_coef = true,
	duration		= 2.5,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ChaosSpawner", },
	},
	
	min_targets_count	= 1, -- SC-116285 СТ. Генератор массовых помех не сбрасывается
}

Spell.RadiationWeapon =
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.WEAPON_HIT_TRANSMIT_SPELL,  -- #76846
	target_spell	= "RadiationWeapon_Set",
	aura_target 	= ai.SpellTarget.HOLDER,
	--aura_param		= 50,
	duration		= 7,
	isBuff			= true,
	--period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RadiationWeapon", },
	},
}
Spell.RadiationWeapon_Set = {
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'RadiationWeapon1', 'RadiationWeapon2' }
}
Spell.RadiationWeapon1 =
{
	target 			= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY+ai.SpellTargetRelationship.NEUTRAL,},
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff			= false,
	aura  			= ai.Aura.BURN_ENERGY_PERIODIC,  -- ?
	aura_param		= 75,
	duration		= 7,
	period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RadiationWeapon", },
	},
	--aura_fx		= "particles/gadget/damage_thermal"
	aura_target_fx = "particles/gadget/burn_energy",
}
Spell.RadiationWeapon2 =
{
	target 			= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY+ai.SpellTargetRelationship.NEUTRAL,},
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff			= false,
	aura  			= ai.Aura.DAMAGE_EMP_SCALED,  -- ?
	aura_param		= 20,
	duration		= 7,
	period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RadiationWeapon", },
	},
}

Spell.SuddenFire_Crit =
{
	target =
	{
		--target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, --#80392
		class			= ai.SpellTargetClass.SHIP ,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
--		misc 			= ai.SpellTargetMisc.POSITION,
	},
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	aura 				= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC, --DAMAGE_HULL_KINETIC_SCALED_PERIODIC  HULL_BURN_PERIODIC
	aura_param			= 1000,  --3%   -- базовый крит шанс 35%, базовая скорострельность 1 в/с
	duration			= 0.2,
	period				= 0.2,  --3
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SuddenFire", },
	},
	aura_fx 			= "particles/weapons/vortex/spell",
}

Spell.ReactorSpark =
{
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NEAREST,	 --
	},
	aura				= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_range			= 50,
	aura_param			= 350,
	--duration			= 10,
	period				= 1,--2,
	isBuff				= false,
	min_targets_count 	= 0,  -- если не указать аура самодиспелится
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ReactorSpark", },
	},
		period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
		--period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",

		period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
		period_my_fx		= "particles/gadget/pulsars/pulsar_hit_2",
		period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",
}

Spell.NewShield =
{
	aura				= ai.Aura.SHIELD_REGEN_MOD,
	target				= ai.SpellTarget.CASTER,
	aura_target 		= { target 				= ai.SpellTargetGeneral.HOLDER, },
	aura_param 			= 230,
	duration			= 0.5,
	isBuff				= true,
	hud_visible 		= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_NewShield", },
	},
	cast_fx				= "particles/gadget/shield_boost",
}

Spell.HardCrit =
{
	aura_param			= 0.25,
	aura_param_stages	= { 1, 2, 3, 4, 5, 5, 5, 5, 5, 5 },
	aura				= ai.Aura.DAMAGE_MOD,
	--diminish_aura_param	= true,
	--ignore_stacks=true
	--ignore_subtype=true
	--disable_zero_stage	= true,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HardCrit", },
	},
}

Spell.FocusedScaner =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	mod_range		= 150,
	mod_target		= --ModulePassive_FocusedScaner_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				misc			= ai.SpellTargetMisc.NOT_CLOAKED,
			},
	--smod_max			= 1,
	aura_param_stages	= { 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 }, --  первый элемент = 0 целей/  второй элемент одна цель
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.4,
	--duration		= 2,
	mod_update_period = 2,
	--period			= 1,
	isBuff			= true,
	ignore_stacks	= true,
	ignore_subtype	= true,
	--spell_on_cancel = "FocusedScaner",
	--hud_visible 	= false, -- прячем от игрока
	--disable_aura_duration = true, -- не показывать таймер на ауре и текст обновления ауры
	disable_zero_stage = true, -- не показывать значок ауры если у ауры stage = 0
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_FocusedScaner" } },
}


Spell.ExhaustZone =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	--aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						--relationship	= ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.NEUTRAL,
					},
	aura_range 		= 120,

	aura_param		= 10,
	duration		= 8, --13
	period 			= 0.5,
	isBuff			= false,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_ExhaustZone" } },

	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound 		= "sound/aura/voidzone",
}


Spell.CritChecker =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	mod_range		= 250,
	mod_target		= --Module_CritChecker_T4_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				misc			= ai.SpellTargetMisc.NOT_CLOAKED,
			},
	mod_max		= 5,
	aura			= ai.Aura.CRIT_CHANCE,
	aura_param		= 0.15,
	--duration		= 2,
	mod_update_period = 2,
	--period			= 1,
	isBuff			= true,
	ignore_stacks	= true,
	ignore_subtype	= true,
	--spell_on_cancel = "CritChecker",
	--hud_visible 	= false, -- прячем от игрока
	disable_zero_stage = true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CritChecker" } },
}


Spell.EnemyInfoCheck =
{
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NOT_CLOAKED,	 --
	},
	aura				= ai.Aura.HULL_RESIST_ALL_DEC,
	aura_range			= 175,
	aura_param			= 45,
	--duration			= 10,
	--period				= 2,
	isBuff				= false,
	min_targets_count 	= 0,  -- если не указать аура самодиспелится
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnemyInfoCheck", },
	},
}


Spell.SpyBeaconAnalyse =
{
	aura_range		= 200,
	aura_param		= 50,
	--period			= 1,
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura			= ai.Aura.HULL_RESIST_ALL_DEC,
	aura_target		= {class=ai.SpellTargetClass.SHIP,area=ai.SpellTargetArea.AROUND,relationship=ai.SpellTargetRelationship.ENEMY,vitality=ai.SpellTargetVitality.ALIVE,misc=ai.SpellTargetMisc.VISIBLE_BY_HOLDER},
	isBuff			= false,
	aura_holder_def	= "SpyBeaconAnalyse",
	duration 		= 60,
	--cast_position_fx = "particles/other/green_beacon",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpyBeaconAnalyse", },
	},
	additional_auras =
	{
		{
			isBuff			= false,
			aura_target		= {class=ai.SpellTargetClass.SHIP,area=ai.SpellTargetArea.AROUND,relationship=ai.SpellTargetRelationship.ENEMY,vitality=ai.SpellTargetVitality.ALIVE,misc=ai.SpellTargetMisc.VISIBLE_BY_HOLDER,},
			aura_range		= 200,
			target			= ai.SpellTarget.CASTER_POSITION_CASTER,
			aura			= ai.Aura.SPY_DRONE,
			ignore_subtype_if_other_team = true,
			duration		= 60,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_SpyBeaconAnalyse", },
			},
		}
	}
}


Spell.ScoutChameleonCommon =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.ANTI_RADAR,
	duration		= 5,
	isBuff			= true,
	ignore_stacks	= true,
	ignore_subtype	= true,
	aura_fx 		= "StealthEffect",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ScoutChameleonCommon", },
	},
}
Spell.ScoutReturn =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	duration		= 6,
	period			= 0.5,
	aura_param		= 100,
	isBuff			= true,
	ignore_stacks	= true,
	ignore_subtype	= true,
	aura_fx 		= "particles/gadget/matter_absorber",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ScoutReturn", },
	},
}

Spell.TeamGuide =
{
	-- DIRECTION_DEPEND_FAST_MOVEMENT изменяет скорость так
	-- MAX( 0, aura_parm * Скалярное_произведение( вектор_направления_корабля, вектор_нормаль_цилиндра)
	--(работает только для цилиндрический аур)
	target 			= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR
	aura_holder_def = "AuraHolderEntityHackDamageImmune",
	aura			= ai.Aura.DIRECTION_DEPEND_FAST_MOVEMENT,
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP,
						area 			= ai.SpellTargetArea.IN_CYLINDER,
						relationship	= ai.SpellTargetRelationship.ALLY,
					},
	aura_target_offset	= Vec3( 0, 0, -1 ),
	aura_range	 	= 450,		--дальность луча
	aura_extra_radius = 75,		--радиус луча
	aura_param		= 0.35,
	duration		= 15,
	aura_fx			= "particles/other/jump_comand_axeleration",
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_TeamGuide", }, },
}
Spell.TeamGuide_Self =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.FIRE_RATE_MOD,
	duration		= 15,
	--period			= 0.5,
	aura_param		= 0.5,
	isBuff			= true,
	--aura_fx 		= "particles/gadget/matter_absorber",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_TeamGuide", },
	},
}

Spell.SpyDroneShieldThief = {
	target = {
			target 				= ai.SpellTargetGeneral.LOCKED_TARGET,
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ENEMY,
			--misc				= ai.SpellTargetMisc.VISIBLE_BY_CASTER + ai.SpellTargetMisc.NOT_CLOAKED,	 --
		},
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura					= ai.Aura.SPY_DRONE_REDUCE_HEAL,
	ignore_subtype_if_other_team = true,
	aura_param				= 1,
	target_range			= 350,
	duration				= 12,
	isBuff					= false,
	dispell_flag 			= ai.Dispell.ON_COLLISION,
	ui_ico = { target_system 	= { tex = "ItemSubtype_SpyDroneShieldThief", }, },
	additional_auras =
	{
		{
			isBuff			= false,
			aura_target		= { target = ai.SpellTargetGeneral.HOLDER, },
			aura			= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
			duration		= 12,
			period			= 1,
			aura_param		= 1000,
			dispell_flag 	= ai.Dispell.ON_COLLISION,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_SpyDroneShieldThief", },
			},
		}
	}
}

Spell.HealBanHaze = {
	target 			= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR
	aura			= ai.Aura.HEALING_MOD,
	aura_target		=
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
			},
	aura_range	 	= 125,
	aura_param		= -19, -- оставляем 5%
	duration		= 35,
	isBuff			= false,
	--aura_sound 		= "sound/aura/voidzone",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_HealBanHaze", }, },
}
Spell.HealBanHaze_Damage = {
	target 			= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target		=
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
			},
	aura_range	 	= 125,
	aura_param		= 10,
	duration		= 35,
	period			= 0.5,
	isBuff			= false,
	aura_sound 		= "sound/aura/voidzone",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_HealBanHaze", }, },
}

Spell.HealEnergyBanHaze = 
{
	target 			= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR
	aura			= ai.Aura.HEALING_MOD,
	aura_target		=
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
			},
	aura_range	 	= 75,
	aura_param		= -19, -- оставляем 5%
	duration		= 35,
	isBuff			= false,
	--aura_sound 		= "sound/aura/voidzone",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_HealBanHaze", }, },
}

Spell.HealEnergyBanHaze_Energy = 
{
	target 			= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR
	aura			= ai.Aura.DISABLE_ENERGY_REGEN,
	aura_target		=
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
			},
	aura_range	 	= 75,
	aura_param		= 35,
	duration		= 35,
	period			= 0.5,
	isBuff			= false,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_HealBanHaze", }, },
}

Spell.BlackBomb =
{
	isBuff			= false,
	aura			= ai.Aura.SHIELD_BURN_PERIODIC,
	aura_param		= 0.04,  --25 раз по 2%
	--aura_param_add  = 500, --расчет на 4 секунды полета.
	period			= 0.2,
	target 			= ai.SpellTarget.INFLICTOR,
	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 1,  -- радиус замедления на 150м больше радиуса урона
	aura_range_add  = 20, --расчет на 5 секунды полета.
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IsotopeHarvester", },
	},
}


--
Spell.FuelEmissionsScout =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "FuelEmissionsScoutCharge",
	duration		= 3,
	period			= 0.5,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_FuelEmissionsScout" } },
}

Spell.FuelEmissionsScoutCharge =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	--aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura_range 		= 5,
	aura_range_add	= (50-5)/(6/0.5),
	aura_param		= 10,
	--aura_param_add	= -30,
	duration		= 6,
	period 			= 0.5,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff			= false,
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_FuelEmissionsScout" } },
}


Spell.WeaknessScoutPlasma =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, --#80392
		class			= ai.SpellTargetClass.SHIP ,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	aura 				= ai.Aura.ADDITIONAL_DAMAGE_THERMAL_SCALED,
	aura_param			= 0.2,
	duration			= 12,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WeaknessScoutPlasma", },
	},
}

Spell.MMM =
{
	target 			= { --target = ai.SpellTargetGeneral.INFLICTOR,
			target = ai.SpellTargetGeneral.CASTER,


			misc = ai.SpellTargetMisc.POSITION },

	aura_target 	= { --target = ai.SpellTargetGeneral.CASTER,
				class = ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
						},
	aura					= ai.Aura.SHIP_ATTRACTION,
	aura_range				= 100,
	aura_param				= 70,
	duration				= 3,
	--aura_holder_def	= "HealBot",
}

Spell.DodgeDrive_l = 
{
	--influence		= ai.Spell.SPURT,
	--influence_param = 1100,
	target 			= {
		target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION,
	},
	aura			= ai.Aura.SHIP_ATTRACTION,
	--aura_holder_def   = "AuraHolderEntity123",
	--aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target = 
	{
		target = ai.SpellTargetGeneral.CASTER,
		--class = ai.SpellTargetClass.SHIP,
		--area = ai.SpellTargetArea.AROUND,
		--relationship = ai.SpellTargetRelationship.ALLY,
	},
	aura_range 		= 6,
	duration		= 0.75, --1, --3
	aura_param		= 350,
	aura_holder_offset = Vec3( 5, 0, 0 ),
	aura_holder_attach_bone = "root",
	--check_spawn_collision = true,
	isBuff			= true,
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_DodgeDrive", },
	},
	--aura_start_sound 	= "sound/gadgets/EmergencyBarrier",
	aura_start_sound = "sound/gadgets/ReverseThruster_activate",
}

Spell.DodgeDrive_r =
{
	inherit 			= "DodgeDrive_l",
	aura_holder_offset	= Vec3(-5, 0, 0),
}

Spell.DodgeDrive_up =
{
	inherit 			= "DodgeDrive_l",
	aura_holder_offset	= Vec3(0, 5, 0),
}

Spell.DodgeDrive_down =
{
	inherit 			= "DodgeDrive_l",
	aura_holder_offset	= Vec3(0, -5, 0),
}

Spell.DodgeDrive_l_Mob = 
{
	inherit 			= "DodgeDrive_l",
	duration			= 2,
	aura_param			= 400,
	aura_range 			= 25,
}
Spell.DodgeDrive_r_Mob = 
{
	inherit 			= "DodgeDrive_r",
	duration			= 2,
	aura_param			= 400,
	aura_range 			= 25,
}
Spell.DodgeDrive_up_Mob = 
{
	inherit 			= "DodgeDrive_up",
	duration			= 2,
	aura_param			= 400,
	aura_range 			= 25,
}
Spell.DodgeDrive_down_Mob = 
{
	inherit 			= "DodgeDrive_down",
	duration			= 2,
	aura_param			= 400,
	aura_range 			= 25,
}
Spell.DodgeDrive_back_Mob = 
{
	inherit 			= "DodgeDrive_down",
	duration			= 3,
	aura_param			= 375, --375
	aura_holder_offset	= Vec3( 0, 0, 5 ),
	aura_range 			= 25,
}


Spell.CorrosiveGunScout =
{
--[[ 	target			=
					{
						target 	= ai.SpellTargetGeneral.INFLICTOR,--ai.SpellTargetGeneral.LOCKED_TARGET, --ai.SpellTargetGeneral.AIM, --ai.SpellTargetGeneral.INFLICTOR,
						--misc	= ai.SpellTargetMisc.POSITION,
					},
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP,

						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					}, ]]
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		--target = ai.SpellTargetGeneral.LOCKED_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC, --
	duration		= 2,
	aura_param		= 0, -- приходит из урона пушки
	damage_to_spell_aura_param = true,
	period			= 0.25,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CorrosiveGunScout", },
	},
	spell_on_cancel = "CorrosiveGunScout_End",
	period_module_fx_number_by_stacks = { 6 },
}
--хил на 600
Spell.CorrosiveGunScout_End = 
{
	target = { target = ai.SpellTargetGeneral.CASTER },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_HULL_PERIODIC, --
	duration		= 3,
	aura_param		= 50, 
	period			= 0.25,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CorrosiveGunScout", },
	},
}

Spell.Barrage =
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	target			= {
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				},
	aura_target		= {
				target 			= ai.SpellTargetGeneral.HOLDER,
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				signature		= ai.SignatureMask.HUGE,
				},
	period			= 0.2,
	duration		= 0.2,
	aura_param		= 100,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpaceMissile_Barrage", },
	},
}

Spell.RailActiveSuppressor =
{
	aura			= ai.Aura.COOLDOWN_MOD,
	target			= {
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				},
	aura_target		= {
				target 			= ai.SpellTargetGeneral.HOLDER,
				class 			= ai.SpellTargetClass.SHIP,
				},
	--period			= 0.2,
	duration		= 4,
	aura_param		= 1.5,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RailActiveSuppressor", },
	},
}

Spell.BlastWeaponDestructor = 
{
	aura			= ai.Aura.BROKEN_WEAPON,
	target			= {
				--target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				target 			= ai.SpellTargetGeneral.INFLICTOR,
				misc	= ai.SpellTargetMisc.POSITION,
				},
	aura_target		= {
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	aura_range		= 15,
	period			= 1,
	duration		= 5,
	aura_param		= 250,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BlastWeaponDestructor", },
	},
	cast_position_fx = "particles/gadget/broken_weapon_area",
	gun_spell_fire_fx = "particles/gadget/weaponhacker_gun_explosion",
}


Spell.EnergyBlaster =
{
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	target			= {
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				},
	aura_target		= {
				target 			= ai.SpellTargetGeneral.HOLDER,
				class 			= ai.SpellTargetClass.SHIP,
				},
	period			= 1,
	duration		= 6,
	aura_param		= 35,
	isBuff			= false,
	aura_target_fx = "particles/gadget/burn_energy",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyBlaster", },
	},
}

Spell.EnemyActiveSuppression = 
{
	aura			= ai.Aura.MODULE_DAMAGE_MOD,
	target			= {
				target 			= ai.SpellTargetGeneral.CASTER,
				--target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				--target 			= ai.SpellTargetGeneral.INFLICTOR,
				--misc	= ai.SpellTargetMisc.POSITION,
				},
	aura_target		= {
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	aura_range		= 200,
	--period			= 1,
	--duration		= 10,
	aura_param		= -10,
	min_targets_count	 = 0,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnemyActiveSuppression", },
	},
}

Spell.WeaponSuppression =
{
	aura			= ai.Aura.HEAT_MUL,
	target			= {
				target 			= ai.SpellTargetGeneral.CASTER,
				--target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				--target 			= ai.SpellTargetGeneral.INFLICTOR,
				--misc	= ai.SpellTargetMisc.POSITION,
				},
	aura_target		= {
				area			= ai.SpellTargetArea.AROUND,
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	aura_range		= 500,
	period			= 1,
	--duration		= 3,
	aura_param		= 3,
	isBuff			= false,
	min_targets_count	 = 0,
	ui_ico =
	{
		--target_system 	= { tex = "ItemSubtype_AOE_EMI", },
		target_system 	= { tex = "ItemSubtype_WeaponSuppression", },
	},
}


--------
Spell.SaveBack = {
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'SaveBack_Teleport', 'SaveBack_Invisibe' }
}

Spell.SaveBack_Teleport = {
	target					= ai.SpellTarget.CASTER,
	teleport_to_target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,-- + ai.SpellTargetRelationship.ALLY,
		--vitality		= ai.SpellTargetVitality.ALIVE,
		--misc 			= ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_SELF,
--		misc 			= ai.SpellTargetMisc.POSITION,
		--area			= ai.SpellTargetArea.AROUND,
		},
	--aura_range				= 500,
	teleport_range			= 500,
	influence 				= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset_dir		= Vec3( 0, 0, 1 ),
	teleport_offset			= 25,
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	in_fx = "particles/gadget/teleport",
	out_fx = "particles/gadget/teleport",
}
Spell.SaveBack_Invisibe = {
	influence		= ai.Spell.APPLY_AURA,
	target 			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.STEALTH,
	duration		= 3,
	--aura_param 		= 100,
	--period			= 1,
	isBuff			= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_SaveBack", }, },
	additional_auras = {
		{
		aura 			= ai.Aura.ADD_ENERGY_PERIODIC,
		aura_param		= 1000, 
		duration		= 3,
		period			= 1,
		isBuff			= true,
		gameplay_specific = true,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		}, 
		{
		aura 			= ai.Aura.INVULNERABILITY,
		duration		= 0.5,
		period			= 0.5,
		isBuff			= true,
		gameplay_specific = true,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
	},
}


Spell.ReflectorResonance = 
{
	target 			= {
			class			= ai.SpellTargetClass.SHIP,
			relationship	= ai.SpellTargetRelationship.ENEMY,
			misc 			= ai.SpellTargetMisc.LOCKER_OF_CASTER,
			},
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.SILENCE,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration 		= 2.5,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_ReflectorResonance", }, },
}

Spell.ShellRestoration = 
{
	influence		= ai.Spell.APPLY_AURA,
	target 			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.HEAL_HULL_PERIODIC,
	duration		= 5,
	aura_param 		= 550,
	period			= 1,
	isBuff			= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_ShellRestoration", }, },
}

--[[ Spell.HackWeapo0 = 
{
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'HackWeapon', 'HackWeapon_Self' },
}

Spell.HackWeapon =
{
	target		= {
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	target_range	= 350,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.HACKED_WEAPON,
	duration		= 6,
	--aura_param 		= 550,
	--period			= 1,
	isBuff			= false,
	apply_crowd_control_coef = true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HackWeapon", }, },
}
Spell.HackWeapon_Self =
{
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.DISABLED_WEAPON,
	duration		= 6,
	--aura_param 		= 550,
	--period			= 1,
	isBuff			= false,
	gameplay_specific = true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HackWeapon", }, },
} ]]
Spell.HackWeapon =
{
	target		= {
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	target_range	= 350,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.HACKED_WEAPON,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration		= 6,
	--aura_param 		= 550,
	--period			= 1,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HackWeapon", }, },
	additional_auras = {
		{
		target			= { target = ai.SpellTargetGeneral.CASTER, },
		aura_target 	= { target = ai.SpellTargetGeneral.CASTER, },
		aura 			= ai.Aura.DISABLED_WEAPON,
		duration		= 6,
		--aura_param 		= 550,
		--period			= 1,
		isBuff			= false,
		gameplay_specific = true,
		ui_ico 			= { target_system = { tex = "ItemSubtype_HackWeapon", }, },
		}, 
	}
}



Spell.DisableWeapon = 
{
	target		= {
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	target_range	= 200,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.DISABLED_WEAPON,
	duration		= 6,
	--aura_param 		= 550,
	--period			= 1,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_DisableWeapon", }, },
}

EnlargeActiveCooldown0 =
{
	influence 	= ai.Spell.CAST_SPELLS,
	spells 		= {'EnlargeActiveCooldown','EnlargeActiveCooldown_Self'},
}

Spell.EnlargeActiveCooldown =
{
	target		= {
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	target_range	= 400,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.COOLDOWN_MOD,
	duration		= 12,
	aura_param 		= 4,
	--period			= 1,
	isBuff			= false,
	
	gun_spell_fx	   = "particles/gadget/disable_weapon_gun_blue",
	

	
	ui_ico 			= { target_system = { tex = "ItemSubtype_EnlargeActiveCooldown", }, },
}
Spell.EnlargeActiveCooldown_Self =
{
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.DEBUFF_IMMUNE,
	duration		= 6,
	--aura_param 		= 550,
	--period			= 1,
	isBuff			= true,
	--gameplay_specific = true,
	aura_target_fx = "particles/gadget/debuff_immune",
	
	
	ui_ico 			= { target_system = { tex = "ItemSubtype_EnlargeActiveCooldown", }, },
	
	additional_auras =
	{
		{ --сброс бомбы
			aura_target			= { target = ai.SpellTargetGeneral.HOLDER, },
			aura				= ai.Aura.INVULNERABILITY,
			duration			= 0.01,
			isBuff				= true,
			hud_visible 		= false,
			gameplay_specific	= true,
		}
	}
}

Spell.HackEntity =
{
	influence		= ai.Spell.HACK,
	target		= {
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
				class			= ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION, 
				},
	target_range	= 500,
	duration		= 30,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HackEntity", }, },
}
Spell.HackEntity_Self = 
{
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.HEAL_SHIELD_PERIODIC,
	duration		= 10,
	aura_param 		= 500*0.75,
	period			= 1,
	isBuff			= true,
	--gameplay_specific = true,
	aura_fx			= "particles/gadget/shield_boost",
	ui_ico 			= { target_system = { tex = "ItemSubtype_HackEntity", }, },
}


Spell.DisableWeaponFireRate =
{
	target		= {
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	target_range	= 500,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.FIRE_RATE_MOD,
	duration		= 20,
	aura_param 		= -1,
	--period			= 1,
	isBuff			= false,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_DisableWeaponFireRate", }, },
}

Spell.Blind =
{
	target		= {
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	target_range 	= 750,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.VISION_RADIUS_MOD,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration		= 9, --13
	aura_param 		= -9,
	--period			= 1,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_Blind", }, },
	additional_auras =
	{
		{
			isBuff			= false,
			--diminish_control_aura = true, -- если вставить, то диминишинг от материнской ауры уже есть и общий диминишинг копится оч быстро
			aura_target		= { target = ai.SpellTargetGeneral.HOLDER, },
			aura			= ai.Aura.DISABLE_RECEIVE_RADAR_INFO,
			duration		= 9,
			ui_ico 			= { target_system = { tex = "ItemSubtype_Blind", }, },
		}
	}
}

Spell.ECMCommon =
{
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.DAMAGE_MOD,
	duration		= 10,
	aura_param 		= 0.05,
	--period			= 1,
	max_stacks 		= 3,
	ignore_subtype 	= true,
	isBuff			= true,
	--gameplay_specific = true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_ECMCommon", }, },
	additional_auras =
	{
		{
			isBuff			= false,
			aura_target		= { 				
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP, },
			aura			= ai.Aura.ENERGY_VAMPIRE_PERIODIC,
			--max_stacks 		= 5,
			ignore_subtype 	= true,
			duration		= 10,
			period			= 1,
			aura_param		= 15,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_ECMCommon", },
			},
		},
	},
}


Spell.ZoneCleaner = 
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= {
						--target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
						target 			= ai.SpellTargetGeneral.INFLICTOR,
						misc	= ai.SpellTargetMisc.POSITION,
				},
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura_range 		= 30,
	period			= 0.5,
	duration		= 5,
	aura_param		= 50,
	aura_param_add	= 120,  -- per sec
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ZoneCleaner", },
	},
	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound 		= "sound/aura/voidzone",
}


Spell.JerichoTrumpets = 
{
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'JerichoTrumpets1', 'JerichoTrumpets2' }, --  
}
Spell.JerichoTrumpets1 =
{
	target =
	{
		target 		= ai.SpellTargetGeneral.INFLICTOR,
		misc		= ai.SpellTargetMisc.POSITION,
	},
	aura_target =
	{
		class = ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		misc	= ai.SpellTargetMisc.NEAREST,
	},
	aura_range			= 15,
	aura				= ai.Aura.SHIP_ATTRACTION,
	duration			= 1.4,
	aura_param			= -20,
	aura_param_add		= 12,
	period				= 0.2,
	hud_visible 		= false, -- прячем от игрока
	gameplay_specific	= true,
}
Spell.JerichoTrumpets2 =
{

	target =
	{
		target 		= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura			= ai.Aura.SLOW_MOVEMENT,
	duration		= 1,
	aura_param		= 2.125,
	hud_visible 	= false, -- прячем от игрока
	gameplay_specific = true,
	diminish_control_aura = false,
}

Spell.JerichoTrumpets_ReturnMove =
{
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'JerichoTrumpets_ReturnMove1', 'JerichoTrumpets_ReturnMove2' },
}

	
	
Spell.JerichoTrumpets_ReturnMove1 =
{

	target			= {
						target = ai.SpellTargetGeneral.CASTER,
						misc = ai.SpellTargetMisc.POSITION,
						
						--target 		= ai.SpellTargetGeneral.INFLICTOR,
						--misc		= ai.SpellTargetMisc.POSITION,
				},
	aura_target		= {
						target 		= ai.SpellTargetGeneral.CASTER,
						--target 		= ai.SpellTargetGeneral.HOLDER,
						class = ai.SpellTargetClass.SHIP,
						--area 	= ai.SpellTargetArea.AROUND,
						--misc	= ai.SpellTargetMisc.NEAREST,
				},
	
	aura_holder_attach_bone = "root",
	aura_holder_offset_to_aim = 5, --aura_holder_offset = Vec3( 0, 0, -5 ),
	
	aura_range		= 100,
	aura			= ai.Aura.SHIP_ATTRACTION,
	--aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	duration		= 1.4,
	aura_param		= -26,---40,
	aura_param_add		= 16.25,--25,
	period			= 0.2,
	hud_visible 	= false, -- прячем от игрока
	gameplay_specific = true,
}
Spell.JerichoTrumpets_ReturnMove2 =
{

	target			= {
						target = ai.SpellTargetGeneral.CASTER,
						misc = ai.SpellTargetMisc.POSITION,
						
						--target 		= ai.SpellTargetGeneral.INFLICTOR,
						--misc		= ai.SpellTargetMisc.POSITION,
				},
	aura_target		= {
						target 		= ai.SpellTargetGeneral.CASTER,
						--target 		= ai.SpellTargetGeneral.HOLDER,
						class = ai.SpellTargetClass.SHIP,
						--area 	= ai.SpellTargetArea.AROUND,
						--misc	= ai.SpellTargetMisc.NEAREST,
				},
	aura_holder_offset = Vec3( 0, 0, -5 ),
	aura_holder_attach_bone = "root",
	
	aura_range		= 100,
	aura			= ai.Aura.SLOW_MOVEMENT,
	duration		= 1,
	aura_param		= 16.25,--25,
	hud_visible 	= false, -- прячем от игрока
	gameplay_specific = true,
	diminish_control_aura = false,
}


Spell.UpgradedSpecial = { -- разгон спецмодуля, пассивка корабля Cerbirus. через таблицу не экспортится, пришлось сделать через отдельные спеллы
	aura			= ai.Aura.SNIPER_PROJECTILE_SPELL,
	target_spell 	= "UpgradedSpecial1",
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	isBuff		= true,
	hud_visible 	= false, -- прячем от игрока
	one_shot	= false,
}
Spell.UpgradedSpecial1 =
{
	--target			= ai.SpellTarget.LOCKED_TARGET,
	target 			= { 
				target = ai.SpellTargetGeneral.CONTEXT_TARGET, 
				relationship	= ai.SpellTargetRelationship.ENEMY+ai.SpellTargetRelationship.NEUTRAL, },
	aura_target		= {
						target 		= ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	duration		= 1,
	aura_param		= 800,
	period			= 1,
	ignore_subtype		= true,
	ignore_stacks		= true,
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_UpgradedSpecial", },
	},
}

Spell.UpgradedSpecial_Rare = 
{
	inherit					= "UpgradedSpecial",
	target_spell			= "UpgradedSpecial1_Rare",
}
Spell.UpgradedSpecial1_Rare =
{
	inherit					= "UpgradedSpecial1",
	aura_param				= 915,
}

Spell.UpgradedSpecial_mk3 = 
{
	inherit					= "UpgradedSpecial",
	target_spell			= "UpgradedSpecial1_mk3",
}
Spell.UpgradedSpecial1_mk3 =
{
	inherit					= "UpgradedSpecial1",
	aura_param				= 970,
}

Spell.UpgradedSpecial_Epic = 
{
	inherit					= "UpgradedSpecial",
	target_spell			= "UpgradedSpecial1_Epic",
}
Spell.UpgradedSpecial1_Epic =
{
	inherit					= "UpgradedSpecial1",
	aura_param				= 1000,
}

Spell.UpgradedSpecial_Rel = 
{
	inherit					= "UpgradedSpecial",
	target_spell			= "UpgradedSpecial1_Rel",
}
Spell.UpgradedSpecial1_Rel =
{
	inherit					= "UpgradedSpecial1",
	aura_param				= 1100,
}

Spell.LastHope =
{
	influence_param	= 100,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	target 			= ai.SpellTarget.CASTER ,
	fish_eye_time = "0.5",
	fish_eye_max = "0.25",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LastHope", },
	},
	cast_position_fx = "particles/gadget/reverse_thruster",
	cast_sound 		= "sound/gadgets/ReverseThruster_activate",
}

Spell.TacticalCalculation = 
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.COOLDOWN_MOD,
	aura_param		= -1,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_TacticalCalculation", },
	},
}


Spell.FocusedDefence = 
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.DAMAGE_REDUCE_WITH_DISTANCE,
	aura_param		= 1000,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FocusedDefence", },
	},
}


Spell.WeaknessSense = 
{
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'WeaknessSense1', 'WeaknessSense2' },
}
Spell.WeaknessSense1 = 
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.15,
	duration		= 6,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WeaknessSense", },
	},
}
Spell.WeaknessSense2 = 
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.SNIPER_OVERLOAD,
	aura_param		= 0.15,
	duration		= 30,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WeaknessSense", },
	},
}

--[[
Spell.SuperChamelion22 = {
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'SuperChamelion1', 'SuperChamelion_' },
}
Spell.SuperChamelion_ = 
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.ANTI_RADAR,
	--aura_param		= 0.5,
	--duration		= 10,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SuperChamelion", },
	},
	aura_fx = "StealthEffect",
}
Spell.SuperChamelion1 = 
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.RESIST_ALL_DEC,
	aura_param		= 50,
	--duration		= 10,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SuperChamelion", },
	},
}
]]

Spell.SuperChamelion = 
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.RESIST_ALL_DEC,
	aura_param		= 50,
	ignore_additional_power = true,
	gameplay_specific		= true,
	--duration		= 10,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SuperChamelion", },
	},
	additional_auras = {
	{
		aura_target		= {
							target = ai.SpellTargetGeneral.HOLDER,
					},
		aura			= ai.Aura.ANTI_RADAR,
		--aura_param		= 0.5,
		--duration		= 10,
		isBuff			= true,
		ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_SuperChamelion", },
		},
		aura_fx = "StealthEffect",
		
	},
	},
}

Spell.SniperDamageZone = 
{
	aura			= ai.Aura.SNIPER_PROJECTILE_SPELL,
	target_spell 	= "SniperDamageZone1",
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	duration		= 25,
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= true,	
	ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_SniperDamageZone", },
		},
}
Spell.SniperDamageZone1 = 
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= {
						target 			= ai.SpellTargetGeneral.CONTEXT_POSITION,
						--target 			= ai.SpellTargetGeneral.INFLICTOR,
						misc	= ai.SpellTargetMisc.POSITION,
				},
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura_range 		= 30,
	period			= 0.25,
	duration		= 8,
	aura_param		= 150,
	isBuff			= false,
	ignore_stacks	= true,
	ignore_subtype	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SniperDamageZone", },
	},
	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound 		= "sound/aura/voidzone",
}


Spell.SmallReverseThruster  = 
{
	influence_param	= 350,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	target 			= ai.SpellTarget.CASTER ,

	cast_position_fx = "particles/gadget/reverse_thruster",
	cast_sound 		= "sound/gadgets/ReverseThruster_activate",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmallReverseThruster", },
	},
}
Spell.SmallReverseThruster_Weakness =
{
	duration		= 1.5,
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL_DEC,
	isBuff			= false,
	ignore_additional_power = true,	
	gameplay_specific = true,
	aura_param		= 75,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmallReverseThruster", },
	},
	aura_fx 		= "particles/gadget/teleport_prepare",
}


Spell.EngineAmplifier = 
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.FIRE_RATE_MOD,
	aura_param		= -2.333333333333,
	duration		= 8,
	isBuff			= false,
	ignore_additional_power	= true,
	gameplay_specific	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EngineAmplifier", },
	},
	additional_auras = {
		{
			aura_target		= {
								target = ai.SpellTargetGeneral.HOLDER,
						},
			aura			= ai.Aura.ENGINE_MOD,
			aura_param		= 1.5,
			duration		= 12,
			isBuff			= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_EngineAmplifier", },
			},
		},
	},
}

Spell.SniperDefender = 
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.FIRE_RATE_MOD,
	aura_param		= -2.333333333333,
	duration		= 8,
	isBuff			= false,
	ignore_additional_power	= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SniperDefender", },
	},
	additional_auras = {
		{
			aura_target		= {
								target = ai.SpellTargetGeneral.HOLDER,
						},
			aura			= ai.Aura.RESIST_ALL_DEC,
			aura_param		= 50,
			duration		= 8,
			isBuff			= false,
			ignore_additional_power	= true,
			gameplay_specific = true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_SniperDefender", },
			},
		},
	},
}

Spell.WeaponAmplifier =
{
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	aura			= ai.Aura.PROJECTILE_SPEED_MOD,
	aura_param		= 0.5,
	duration		= 7,
	isBuff			= true,
	--ignore_additional_power	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WeaponAmplifier", },
	},
	additional_auras = {
		{
			aura_target		= {
								target = ai.SpellTargetGeneral.HOLDER,
						},
			aura			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
			aura_param		= 0.5,
			duration		= 7,
			isBuff			= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_WeaponAmplifier", },
			},
		},
	},
}

---

Spell.HugeHullDevastator = 
{
	aura			= ai.Aura.SNIPER_PROJECTILE_SPELL,
	target_spell 	= "HugeHullDevastator1",
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	duration		= 25,
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= true,	
	ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_HugeHullDevastator", },
		},
	--one_shot = false,
}

Spell.HugeHullDevastator1 = 
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	target			= {
						target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
						--target 			= ai.SpellTargetGeneral.INFLICTOR,
						--misc	= ai.SpellTargetMisc.POSITION,
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						signature		= ai.SignatureMask.HUGE,
				},
	aura_target		= {
				target 			= ai.SpellTargetGeneral.HOLDER,
				},
	--aura_range 		= 30,
	period			= 0.25,
	duration		= 0.25,
	aura_param		= 12500,
	ignore_stacks	= true,
	ignore_subtype	= true,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HugeHullDevastator", },
	},
	--aura_fx			= "particles/gadget/suicide_aura",
	--aura_sound 		= "sound/aura/voidzone",
}


Spell.FocusedRay  =
{
	target 			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target =
	{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			area			= ai.SpellTargetArea.IN_CYLINDER,  --цилиндр радиуса aura_range и длиной target_range
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura_range	= 650,
	aura_extra_radius = 5,
--[[	target =
	{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			area			= ai.SpellTargetArea.IN_CYLINDER,  --цилиндр радиуса aura_range и длиной target_range
	},
	target_range	= 650,
	target_extra_radius = 20,
	aura_target = { target = ai.SpellTargetGeneral.HOLDER, },]]
	fixed_cylinder_target	= false,

	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	--aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	--aura_param		= 10,
	target_spell	= "FocusedRay1",
	duration		= 5,
	period			= 0.2,
	ray_sound 		= "sound/destroyer/TRay_beam",
	ui_ico 			= { 	target_system 	= { tex = "ItemSubtype_FocusedRay", }, },
}

Spell.FocusedRay1 = {
	influence		= ai.Spell.APPLY_AURA,
	target 			= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	duration		= 2,
	aura_param		= 10,
	period			= 1,
	max_stacks 		= 10,	
	isBuff 			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_FocusedRay", }, },
	period_module_fx_number_by_stacks = { 1,1,2,2,3,3,4,4,5,5,6,6 },
	
	additional_auras =	 -- тултип закостылен, его правыить вручную
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			target 			= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
			aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
			aura 			= ai.Aura.HULL_RESIST_THERMAL_DEC,
			duration		= 2,
			aura_param		= 2,
			period			= 1,
			max_stacks 		= 10,	
			isBuff 			= false,
			ui_ico 			= { target_system = { tex = "ItemSubtype_FocusedRay", }, },
			period_module_fx_number_by_stacks = { 1,1,2,2,3,3,4,4,5,5,6,6 },	
		},
	},
}

Spell.HackRocket = {
	influence		= ai.Spell.DETONATE_AMMO,
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	target_range		= 300,
	--aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	explosion_blast_wave = "Blastwave_HackRocket",
}


Spell.BeaconActiveSilence = {
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura 			= ai.Aura.DISABLE_MODULES,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	aura_target		= {
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NEAREST,	
		},
	aura_range		= 250,
	min_targets_count = 0,
	--aura_param		= -0.2,
	isBuff			= false,
	aura_holder_def	= "BeaconActiveSilence",
	duration 		= 12,

	aura_target_fx = "particles/gadget/burn_energy",

	ui_ico ={ target_system 	= { tex = "ItemSubtype_BeaconActiveSilence", }, },
}

Spell.NanobotsCritAdaptive =
{
	influence_param		= 250,
	influence 		= ai.Spell.HEAL_HULL_SCALED,
	--target 			= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	--target_range = 40,
	target 		= 	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ALLY,
	},
	influence_sound 	= "sound/hit/heal",
	
}


Spell.NanobotsCritAdaptive_Crit = 
{
	target 			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	duration 		= 10,
	aura			= ai.Aura.RESIST_ALL,
	aura_param 		= 25,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_NanobotsCritAdaptive", }, },
}

Spell.SpeedInsteadShield = 
{
	duration 		= 12,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 1,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_SpeedInsteadShield", }, },
	additional_auras	= {
		{
			duration 		= 12,
			aura			= ai.Aura.FAST_MANEUVER,
			aura_param 		= 1,
			isBuff			= true,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_SpeedInsteadShield", }, },			
		}

	},
}

Spell.EnergyFlowBalancer =
{
	target			= ai.SpellTarget.CASTER,
	aura  			= ai.Aura.ADD_ENERGY_PERIODIC,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 4, -- *модификатор.
	mod_max			= 4,
	--duration		= 5,
	mod_update_period = 5,
	period			= 0.2,	
	ignore_stacks	= true,
	ignore_subtype	= true,
	--spell_on_cancel = "EnergyFlowBalancer",
	mod_range		= 300,	
	mod_target		= --Module_EnergyFlowBalancer_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= true,
	disable_zero_stage = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyFlowBalancer", },
	},	
}

--Spell.BindingShield = 
--{
--	influence		= ai.Spell.APPLY_AURA,
--	target			= ai.SpellTarget.CASTER,
--	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
--	target_spell	= "BindingShield1",
--	--duration		= 5,
--	period			= 3,
--	hud_visible 	= false, -- прячем от игрока
--	isBuff			= true,
--	ui_ico 		= { target_system 	= { tex = "ItemSubtype_BindingShield" } },	
--}

Spell.BindingShield = 
{
	target 		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target = { target = ai.SpellTargetGeneral.HOLDER, },
	mod_target = --Module_BindingShield_T4_Epic
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_CASTER,
		},	
	mod_max				= 5,
	mod_range 			= 200,--75,
	aura_param_stages	= { 0, 1, 1, 1, 1, 1, 1, 1, 1},
	aura				= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	--aura				= ai.Aura.DAMAGE_THERMAL_SCALED,
	--aura_range			= 75,
	--target_range		= 75,
	aura_param			= 100,
	--duration			= 2,
	mod_update_period	= 3,
	period 				= 1,
	--min_targets_count	= 2,
	--min_targets_count 	= 0,  -- если не указать ау ра самодиспелится
	isBuff				= true,
	ignore_stacks	= true,
	ignore_subtype	= true,
	--hud_visible 	= false,
	disable_zero_stage = true,
	ui_ico =	{ target_system 	= { tex = "ItemSubtype_BindingShield", }, },
	additional_auras = 
		{
			{
				aura_target = 
				{			
					class				= ai.SpellTargetClass.SHIP,
					relationship		= ai.SpellTargetRelationship.ALLY,
					area				= ai.SpellTargetArea.AROUND,
					misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_HOLDER,
				},
				aura_range 			= 200,--75,
				aura				= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
				aura_param			= 100,
				--duration			= 2,
				period 				= 1,
				min_targets_count 	= 0,
				isBuff				= true,
				ignore_stacks		= true,
				ignore_subtype		= true,
				ui_ico =
				{
					target_system 	= { tex = "ItemSubtype_BindingShield", },
				},
			},
		},
}

Spell.DronDamageMod = 
{
	aura 			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.5,
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	aura_target = 
		{
			class 			= ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ALLY,
		},
	aura_range		= 150,
	additional_auras = 
		{
			{
				aura 			= ai.Aura.HEAL_HULL_PERIODIC,
				aura_param		= 150,
				isBuff			= true,
				aura_target = 
				{
					class 			= ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
					area			= ai.SpellTargetArea.AROUND,
					relationship	= ai.SpellTargetRelationship.ALLY,
				},
				aura_range		= 150,
			},
		},
}

Spell.PreparationAdaptation = 
{
	aura 			= ai.Aura.MODULE_RANGE_MOD,  -- AURA_PARAM_
	isBuff			= true,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_param		= 0.25,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_PreparationAdaptation" } },	
}


-- хил парт
Spell.DivineStorm =  
{
	target 				= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,-- + ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura 				= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	aura_range 			= 125,
	aura_param 			= 0,
	duration			= 0.5,
	period				= 0.5,
	isBuff				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_DivineStorm" } },
	aura_start_sound	= "sound/aura/DivineStorm",
	additional_auras = 
		{
			{
				aura 			= ai.Aura.BURN_ENERGY_PERIODIC,
				aura_param		= 200,
				duration		= 0.5,
				period			= 0.5,
				hud_visible 	= false,
				ui_ico 			= { target_system 	= { tex = "ItemSubtype_DivineStorm" } },
			},
		},		
}
Spell.DivineStorm1 =  
{
	target 				= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target = 
		{
			class 				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + 
				ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
			relationship		= ai.SpellTargetRelationship.ENEMY,
			area				= ai.SpellTargetArea.AROUND,
			misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,-- + ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura 				= ai.Aura.DAMAGE_EMP_SCALED,
	aura_range 			= 125,
	aura_param 			= 0,
	duration			= 6,
	period				= 2,
	isBuff				= false,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_DivineStorm" } },
	period_module_fx_number_by_stacks = { 5 },
}

Spell.ParticleExplosion = 
{
	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_CASTER,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura 				= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	aura_range 			= 60,
	aura_param 			= 3500,
	duration			= 1,
	period				= 0.5,
	isBuff				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_ParticleExplosion" } },
	
	additional_auras =	
	{	
		{
			target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
			aura_target = 
			{	
				target 				= ai.SpellTargetGeneral.CASTER,
				class				= ai.SpellTargetClass.SHIP,
				--relationship		= ai.SpellTargetRelationship.ALLY,
				area				= ai.SpellTargetArea.AROUND,
				misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
			},	
		aura 				= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
		aura_range 			= 60,
		aura_param 			= 1500,
		duration			= 1,
		period				= 0.5,
		isBuff				= true,
		ui_ico 				= { target_system 	= { tex = "ItemSubtype_ParticleExplosion" } },
		},
	},	
}


Spell.MatterFlow =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},

	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 35,
	aura_range		= 350,

	aura 			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 99,   --x2

	duration 		= 7, --0.2,
	period			= 0.5,
	isBuff			= true,
	--ray_sound 		= "sound/destroyer/TRay_beam",
	aura_sound 		= "sound/aura/heal",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MatterFlow", },
	},
}

Spell.Primary2HullRestore = 
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura			= ai.Aura.WEAPON_HIT_TRANSMIT_SPELL,  -- #76846
	target_spell	= "Primary2HullRestore1",
	aura_target 	= ai.SpellTarget.HOLDER,
	--aura_param		= 50,
	duration		= 10,
	isBuff			= true,
	--period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Primary2HullRestore", },
	},
}
Spell.Primary2HullRestore1 =
{
	--target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	target					= { 
			target = ai.SpellTargetGeneral.CONTEXT_TARGET, 
			relationship		= ai.SpellTargetRelationship.ENEMY,
			class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO +  ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.BATTLE_STATION,
			},
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			--misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,-- + ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura_range		= 100,
	isBuff			= true,
	aura  			= ai.Aura.HEAL_HULL_PERIODIC,  -- ai.Aura.HEAL_HULL_PERIODIC,? 
	aura_param		= 100,
	duration		= 1,
	period			= 0.5,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Primary2HullRestore", },
	},
}


Spell.DivineSave = 
{
	duration		= 8,--5,	
	--target 			= ai.SpellTarget.LOCKED_TARGET,
	--target 			= ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET_BY_CASTER,
	target =
	{
		target			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	target_range	= 350,
	aura			= ai.Aura.EMERGENCY_SPELL,
	aura_param 		= 0.1,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	target_spell 	= "DivineSave1",
	isBuff 			= true,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_DivineSave", }, 	},
	aura_fx 		=  "particles/gadget/protector_device_fx",
}

Spell.DivineSave_Self = 
{
	duration		= 8,--5,	
	--target 			= ai.SpellTarget.LOCKED_TARGET,
	--target 			= ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET_BY_CASTER,
	--target_range	= 350,
	aura			= ai.Aura.EMERGENCY_SPELL,
	aura_param 		= 0.1,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	target_spell 	= "DivineSave1",
	isBuff 			= true,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_DivineSave", }, 	},
	aura_fx 		=  "particles/gadget/protector_device_fx",
}

Spell.DivineSave1 = 
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 2.5,		
	isBuff 			= true,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_DivineSave", }, 	},
	aura_fx 		= "particles/gadget/invulnerability",
	additional_auras = 
	{
		{
			aura_target = { target = ai.SpellTargetGeneral.HOLDER, },
			duration 	= 6,
			aura 		= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
			aura_param 	= 800,
			period 		= 1,
			isBuff 		= true,	
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_DivineSave", }, 	},
		}
	}
}

--[[
Spell.CoupleSupport_ = 
{
	target = ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET_BY_CASTER, 
	--aura_target 	= ai.SpellTarget.VISIBLE_LOCKED_ALLY_TARGET_BY_HOLDER,	
	aura			= ai.Aura.HULL_RESIST_ALL,
	duration		= 1,
	aura_param 		= 25,
	isBuff 			= true,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CoupleSupport1", }, 	},
	aura_fx 		= "particles/gadget/invulnerability",
}
]]
Spell.CoupleSupport1 = 
{
	target 	= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			misc				=  ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_HOLDER, -- ai.SpellTargetMisc.VISIBLE_BY_HOLDER +
		},	
	aura_range		= 200,
	aura			= ai.Aura.HULL_RESIST_ALL,
	aura_param 		= 25,
	isBuff 			= true,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CoupleSupport1", }, 	},
	--aura_fx 		= "particles/gadget/invulnerability",
	additional_auras = 
	{
		{
			aura_target = { target = ai.SpellTargetGeneral.HOLDER, },
			aura		= ai.Aura.HULL_RESIST_ALL,
			aura_param 	= 25,
			isBuff 		= true,	
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_CoupleSupport1", }, 	},
		}
	}
}

Spell.CoupleSupport2 = 
{
	target 	= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			misc				=  ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_HOLDER, -- ai.SpellTargetMisc.VISIBLE_BY_HOLDER +
		},	
	aura_range		= 200,
	aura			= ai.Aura.CRIT_CHANCE,
	aura_param 		= 0.15,
	isBuff 			= true,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CoupleSupport2", }, 	},
	--aura_fx 		= "particles/gadget/invulnerability",
	additional_auras = 
	{
		{
			aura_target = { target = ai.SpellTargetGeneral.HOLDER, },
			aura		= ai.Aura.CRIT_CHANCE,
			aura_param 	= 0.15,
			isBuff 		= true,	
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_CoupleSupport2", }, 	},
		}
	}
}

Spell.CalibrationGrenade = {
	influence 		= ai.Spell.CAST_SPELLS,
	spells			= { 'CalibrationGrenade1', 'CalibrationGrenade2' },
}
Spell.CalibrationGrenade1 = 
{
	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			--misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,-- + ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura 				= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	aura_range 			= 75,
	aura_param 			= 400,
	duration			= 10,
	period				= 0.5,
	--aura_holder_def     = "CalibrationGrenade", --много хаоса, не надо видимого холдера
	isBuff 				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_CalibrationGrenade" } },
}
Spell.CalibrationGrenade2 = 
{
	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ENEMY,
			area				= ai.SpellTargetArea.AROUND,
			--misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,-- + ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura		= ai.Aura.HEALING_MOD,
	aura_range 	= 75,
	aura_param 	= -9,
	duration	= 10,
	--aura_sound = "sound/game/agony",
	isBuff 		= false,	
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_CalibrationGrenade", }, 	},
}

--spell_on_max_energy_plus 	= "MultiPurposeAdaptor_Crit",
Spell.MultiPurposeAdaptor_Crit = {
	aura 				= ai.Aura.CRIT_CHANCE,
	aura_param 			= 0.15,
	isBuff 				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_MultiPurposeAdaptor" } },
}
--spell_on_max_speed_plus		= "MultiPurposeAdaptor_Resist",
Spell.MultiPurposeAdaptor_Resist = {
	aura 				= ai.Aura.HULL_RESIST_THERMAL,
	aura_param 			= 75,
	isBuff 				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_MultiPurposeAdaptor" } },
}


Spell.Jump2Dude = {
	target = {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
	aura_target = 	
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			--misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,-- + ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura 				= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_range 			= 110,
	aura_param 			= 300,
	duration			= 6,
	period				= 0.5,
	isBuff 				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_Jump2Dude" } },
}
Spell.Jump2Dude1 = {
	target					= ai.SpellTarget.CASTER,
	teleport_to_target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
		--vitality		= ai.SpellTargetVitality.ALIVE,
		--misc 			= ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_SELF,
--		misc 			= ai.SpellTargetMisc.POSITION,
		--area			= ai.SpellTargetArea.AROUND,
		},
	--aura_range				= 500,
	teleport_range			= 500,
	influence 				= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset_dir		= Vec3( 0, 0, 1 ),
	teleport_offset			= 50,
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	in_fx = "particles/gadget/teleport",
	out_fx = "particles/gadget/teleport",
}


Spell.PrimaryNanoRobots = {--Primary2HullRestore
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura			= ai.Aura.WEAPON_HIT_TRANSMIT_SPELL,  -- #76846
	target_spell	= "PrimaryNanoRobots1",
	aura_target 	= ai.SpellTarget.HOLDER,
	--aura_param		= 50,
	duration		= 5,
	isBuff			= true,
	--period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PrimaryNanoRobots", },
	},
}
Spell.PrimaryNanoRobots1 =
{
--[[ 	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION }, ]]
 	target					= { 
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY,
		class			= ai.SpellTargetClass.SHIP,
		}, 
		
--[[ aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ENEMY,
			area				= ai.SpellTargetArea.AROUND,
			--misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,-- + ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura_range		= 75, ]]

	isBuff			= false,
	aura  			= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,  -- ai.Aura.HEAL_HULL_PERIODIC,? 
	aura_param		= 340,
	duration		= 6,
	period			= 1,
	spell_on_cancel = "PrimaryNanoRobots2",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PrimaryNanoRobots", },
	},
--	aura_fx		= "particles/gadget/damage_thermal"
}
Spell.PrimaryNanoRobots2 = 
{
	target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			--misc				= ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_CASTER,
		},
	target_range	= 50,
	aura  			= ai.Aura.HEAL_HULL_PERIODIC, 
	aura_param		= 100,
	duration		= 12,
	period			= 1,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PrimaryNanoRobots", },
	},
}

--Spell.PrimaryNanoRobots_Passive =
--{
--	influence		= ai.Spell.APPLY_AURA,
--	target			= ai.SpellTarget.CASTER,
--	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
--	target_spell	= "PrimaryNanoRobots_Passive_Heal",
--	--duration		= 3,
--	hud_visible		= false,
--	period			= 1,
--	isBuff			= true,
--	ui_ico 			= { target_system 	= { tex = "ItemSubtype_FuelEmissionsScout" } },
--}

Spell.PrimaryNanoRobots_Passive = 
{
	target			= ai.SpellTarget.CASTER,
	aura  			= ai.Aura.HEAL_HULL_PERIODIC, 
	mod_target			= --Module_PrimaryNanoRobots_T4_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	mod_range		= 200,
	--hud_visible		= false,
	disable_zero_stage = true,
	--duration 		= 0.5,
	mod_update_period = 1,
	aura_param		= 55,
	period			= 1,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PrimaryNanoRobots", },
	},
}

Spell.LaserHealNormal =
{
	duration		= 5, --(сброс стаков за 3 сек)
	max_stacks 		= 10,
	aura_param		= 8, --макс за 15секунд
	isBuff 			= true,

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LaserHealNormal", },
	},
}

Spell.AdditionalShield =
{
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	isBuff				= true,
	shell_def 			= "Shell_AdditionalShield",-- деф шкуры
	influence_param		= 3500,
	duration			= 7,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AdditionalShield", },
	},
}
Spell.SafeSpecial =  
{
	duration		= 12, 
	aura_param		= 50, 
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	isBuff 			= true,	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SafeSpecial", },
	},
}

Spell.RebalancedDefense = 
{
	aura_param		= 50, 
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	isBuff 			= true,	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RebalancedDefense", },
	},
}

Spell.ShieldAdaptation = {
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	mod_range		= 250,
	mod_target		= --Module_ShieldAdaptation_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	mod_max			= 4,--5,
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param		= 30,
	--duration		= 2,
	--period			= 1,
	mod_update_period = 2,
	isBuff			= true,
	ignore_stacks	= true,
	ignore_subtype	= true,
	--spell_on_cancel = "ShieldAdaptation",
	--hud_visible 	= false, -- прячем от игрока
	disable_zero_stage = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldAdaptation", },
	},
}

Spell.AdaptiveFire =
{
	aura 				= ai.Aura.DAMAGE_MOD,
	target				= ai.SpellTarget.CASTER,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_param			= 0.15, --11  -- держится секунд 5-7
	aura_param_stages	= { 1, 2, 3, 4, 5, 6, 6, 6 }, -- 0=11 1=19 2=27     ----  8+=75
	--disable_zero_stage	= true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_AdaptiveFire", }, },
}

Spell.ShieldRecycler =  
{
	aura 				= ai.Aura.HEAL_SHIELD_PERIODIC,
	target				= ai.SpellTarget.CASTER,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_param			= 750,
	duration			= 10,
	period				= 0.5,
	isBuff				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_ShieldRecycler", }, },
}

--spell_on_equip бафаем друзей вокруг
Spell.AdaptiveDefense1 =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
	aura_range		= 250,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 30,
	--duration		= 2,
	--period			= 1,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff			= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_AdaptiveDefense", }, },--
}
--focus_spell бафаем себя по количеству входящего урона
Spell.AdaptiveDefense = 
{
	aura 				= ai.Aura.RESIST_ALL,
	target				= ai.SpellTarget.CASTER,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_param			= 25, 
	aura_param_stages	= { 1, 2, 3, 4, 5, 6, 6, 6 }, -- 0=11 1=19 2=27     ----  8+=75
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	--disable_zero_stage	= true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_AdaptiveDefense", }, },
}

Spell.Hook0 = {
	influence			= ai.Spell.CAST_SPELLS,
	
	target 		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
	aura_range			= 350,
	aura_target 		= ai.SpellTarget.CASTER,
		
	spells				= { 'Hook', 'Hook_Huge' }
}

Spell.Hook = 
{
	aura 				= ai.Aura.SHIP_ATTRACTION,
	target				= ai.SpellTarget.CASTER,
	aura_target 		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
	aura_range			= 350,
	aura_param			= 35,  --- 25-35
	duration			= 3.5,
	--ignore_subtype		= true,
	--ignore_stacks		= true,
	isBuff				= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_Hook", }, },
	dispell_flag 		= ai.Dispell.ON_COLLISION,
}


	--урон в эсминец
Spell.Hook_Huge = 
{
	aura = ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	aura_param = 400, --damage
	--target_range = 350, 
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class 			= ai.SpellTargetClass.SHIP+ai.SpellTargetClass.CARGOSHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		signature		= ai.SignatureMask.HUGE,
	},
	aura_range			= 350,
	ignore_subtype 	= true,
	isBuff 			= false,
	duration 		= 3.5,
	period 			= 0.2,
	ui_ico 			=
	{
		target_system = { tex = "ItemSubtype_Hook", },
	},
	dispell_flag 			= ai.Dispell.ON_COLLISION,
	period_module_fx = "particles/gadget/damage_kinetic_module",
	period_module_my_fx = "particles/gadget/damage_kinetic_module",
}


	--неуязвимость к коллизии на себя
Spell.Hook_Self = 
{
	aura 				= ai.Aura.COLLISION_IMMUNE, --    меньшает урон от пуль и лазеров в зависимости от расстояния до атакующего по следующей формуле: 
	target				= ai.SpellTarget.CASTER,    
	--aura_target 		= ai.SpellTarget.SHIPS_AROUND,
	--aura_range			= 10,
	aura_target 		= ai.SpellTarget.HOLDER,
	--aura_param			= 600, --свыше 600 =0.25  до 600/4=150=1 ---GetClamped( 1.0f + 0.25 - distance / aura_param, 0.25f, 1.0f ).  
	duration			= 4,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	dispell_flag 			= ai.Dispell.ON_COLLISION,
	isBuff				= true,	
	ui_ico = { target_system 	= { tex = "ItemSubtype_Hook", }, },
}

Spell.SpaceSqueezer =
{
	aura 				= ai.Aura.SHIELD_RESIST_ALL,
	target				= ai.SpellTarget.CASTER,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_param			= 33, 
	mod_range			= 300,
	mod_target			= --Module_SpaceSqueezer_T4_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	mod_max				= 10,
	duration			= 6,
	--ignore_subtype	= true,
	--ignore_stacks	= true,	
	disable_zero_stage = true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_SpaceSqueezer", }, },
}
Spell.SpaceSqueezer1 = 
{
	aura 				= ai.Aura.SHIP_ATTRACTION,
	target				= ai.SpellTarget.CASTER,
	aura_target 		= {
		area			= ai.SpellTargetArea.AROUND,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
	aura_range			= 300,
	aura_param			= 33,  --- 25-35
	duration			= 8,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff				= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_SpaceSqueezer", }, },
}
Spell.SpaceSqueezer_Self = 
{
	aura 				= ai.Aura.COLLISION_IMMUNE, --    меньшает урон от пуль и лазеров в зависимости от расстояния до атакующего по следующей формуле: 
	target				= ai.SpellTarget.CASTER,    
	--aura_target 		= ai.SpellTarget.SHIPS_AROUND,
	--aura_range			= 10,
	aura_target 		= ai.SpellTarget.HOLDER,
	--aura_param			= 600, --свыше 600 =0.25  до 600/4=150=1 ---GetClamped( 1.0f + 0.25 - distance / aura_param, 0.25f, 1.0f ).  
	duration			= 14,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	--dispell_flag 			= ai.Dispell.ON_COLLISION,
	isBuff				= true,	
	ui_ico = { target_system 	= { tex = "ItemSubtype_SpaceSqueezer", }, },
}


--EnhanceWeapon
Spell.EnhanceWeapon = {
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura			= ai.Aura.WEAPON_HIT_TRANSMIT_SPELL,  -- #76846
	target_spell	= "EnhanceWeapon1",
	aura_target 	= ai.SpellTarget.HOLDER,
	duration		= 7,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnhanceWeapon", },
	},
}
Spell.EnhanceWeapon1 =
{
	target					= { 
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY,
		class			= ai.SpellTargetClass.SHIP,
		},
		aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ENEMY,
			--area				= ai.SpellTargetArea.AROUND,
			misc				= ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_HOLDER,--ai.SpellTargetMisc.VISIBLE_BY_HOLDER,-- + ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_SELF,
		},	
	aura_range		= 50,
	
	aura = ai.Aura.SHIP_ATTRACTION,
	aura_param 		= 12, --attraction force  --в экселе переопределяется
	duration		= 6,	
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnhanceWeapon", },
	},
    aura_fx		= "particles/gadget/enchance_weapon_atraction",
	aura_sound 	= "sound/destroyer/GravyAnomaly_loop",
	additional_auras =
	{
		{
			aura 			= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
			aura_param 		= 50, --damage
			isBuff 			= false,
			duration 		= 6,
			period			= 1,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_EnhanceWeapon", }, },
		},
	},
}

Spell.MissileReflector = {

	fixed_cylinder_target = false,
	target = 
	{
		class 			= ai.SpellTargetClass.ROCKET,
		area			= ai.SpellTargetArea.IN_CONE,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	target_range = 750,
	target_extra_radius = 200,
	influence = ai.Spell.HACK_ROCKET,
	
	redirect_to_locked_target_amount = 2,
	
	isBuff			= false,
	redirect_to_target = {
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	redirect_range = 750,
	max_rockets_per_target = 2,
	
		influence_beam_fx = "particles/gadget/weaponhacker_beam",
		cast_pos_cylinder_end_fx = "particles/gadget/hack_rocket",

}
Spell.MissileReflector_Self = {
	influence 				= ai.Spell.HEAL_SHIELD,
	influence_param			= 4000,
}




Spell.SafeAcceleration = {
	aura 				= ai.Aura.DAMAGE_REDUCE_WITH_DISTANCE, --    меньшает урон от пуль и лазеров в зависимости от расстояния до атакующего по следующей формуле: 
	target				= ai.SpellTarget.CASTER,    
	aura_target 		= ai.SpellTarget.HOLDER,
	--aura_range			= 350,
	aura_param			= 600, --свыше 6000 =0.25  до 600/4=150=1 то есть до 1500м урон не снижается, ---GetClamped( 1.0f + 0.25 - distance / aura_param, 0.25f, 1.0f ).  
	duration			= 12,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_SafeAcceleration", }, },
	additional_auras =
	{
		{
			aura 			= ai.Aura.FAST_MOVEMENT,
			aura_param 		= 0.33, 
			isBuff 			= true,
			duration 		= 12,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_SafeAcceleration", }, },
		},
	},
	aura_fx = "particles/gadget/damage_reduce_with_distance",
}

Spell.Immortality = {
	aura 				= ai.Aura.UNTOUCHABLE, --    делает цель прозрачной для пуль, лазеров и взрывов (пули пролетают насквозь, лазеры светят насквозь, взрывы не наносят урон). Действие ауры распространяется на дочерние объекты (например, специальные щиты). 
	target				= ai.SpellTarget.CASTER,    
	aura_target 		= ai.SpellTarget.HOLDER,
	duration			= 2,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_Immortality", }, },
}

Spell.RamCharge = {
	aura 				= ai.Aura.SHIP_ATTRACTION,	
	target 		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
	target_range		= 350,
	aura_target			= ai.SpellTarget.CASTER,
	aura_param			= 65,  --- 25-35
	aura_range 			= 350,
	duration			= 6,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff				= true,
	dispell_flag		= ai.Dispell.ON_COLLISION,
	ui_ico = { target_system 	= { tex = "ItemSubtype_RamCharge", }, },
}
Spell.RamCharge_Self = 
{
	aura 				= ai.Aura.COLLISION_IMMUNE, --    меньшает урон от пуль и лазеров в зависимости от расстояния до атакующего по следующей формуле: 
	target				= ai.SpellTarget.CASTER,    
	--aura_target 		= ai.SpellTarget.SHIPS_AROUND,
	--aura_range			= 10,
	aura_target 		= ai.SpellTarget.HOLDER,
	--aura_param			= 600, --свыше 600 =0.25  до 600/4=150=1 ---GetClamped( 1.0f + 0.25 - distance / aura_param, 0.25f, 1.0f ).  
	duration			= 6,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_RamCharge", }, },
}


Spell.PlasmaHunterGun = {
	target					= { 
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY,
		class			= ai.SpellTargetClass.SHIP,
		},
	--aura_target 		= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.SLOW_MANEUVER,
	aura_param		= 0.2500,  --- -20%
	duration		= 5,
	diminish_control_aura = false, -- диминишинг только на второй ауре
	apply_crowd_control_coef	= true,
	isBuff			= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_PlasmaHunterGun", }, },
--	aura_fx		= "particles/gadget/damage_thermal"
}

Spell.LanceWeakness = {

	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.WEAPON_HIT_TRANSMIT_SPELL,  -- #76846
	target_spell	= "LanceWeakness1",
	aura_target 	= ai.SpellTarget.HOLDER,
	--aura_param	= 50,
	duration		= 8,
	isBuff			= true,
	--period		= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RadiationWeapon", },
	},
}

Spell.LanceWeakness1 =
{
	target 			= { 
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff			= false,
	aura  			= ai.Aura.RESIST_ALL_DEC,  
	aura_param		= 35,
	duration		= 20,	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LanceWeakness", },
	},
	--aura_fx		= "particles/gadget/damage_thermal"
}

Spell.LanceWeakness_Self = {
	aura 				= ai.Aura.PROJECTILE_SPEED_MOD, 
	target				= ai.SpellTarget.CASTER,    
	aura_target 		= ai.SpellTarget.HOLDER,
	duration			= 15,
	aura_param			= 0.35,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_LanceWeakness", }, },
}



Spell.HunterZone = {

	target				= ai.SpellTarget.CASTER,    
	aura_target 		= {
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_range 			= 300,
	aura 				= ai.Aura.SLOW_MANEUVER, 
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration			= 15,
	aura_param			= 0.4286, -- -30%
	isBuff				= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_HunterZone", }, },
}

Spell.HunterZone_Self = {
	aura 				= ai.Aura.RESIST_ALL, 
	target				= ai.SpellTarget.CASTER,    
	aura_target 		= ai.SpellTarget.HOLDER,
	duration			= 15,
	aura_param			= 25,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_HunterZone", }, },
}

Spell.PlasmaGuard_CritChance =
{
	target 			= { 
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target 	= ai.SpellTarget.CASTER,
	isBuff			= false,
	aura  			= ai.Aura.CRIT_CHANCE,  
	aura_param		= 0.06,
	duration		= 2,
	max_stacks 		= 5,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaGuard", },
	},
}
 
Spell.PlasmaGuard_Crit = 
{
	target 			= { 
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target 	= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.SHIELD_VAMPIRE_PERIODIC,  
	aura_param		= 100,
	duration		= 0.2,
	period			= 0.3,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaGuard", },
	},
}

Spell.CivilianRepair = 
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.HEAL_HULL_PERIODIC,  
	aura_param		= 100, --aura_param * 13 = 2/3 штурма
	duration		= 15,
	period			= 1,
	dispell_flag	= ai.Dispell.ON_DAMAGE + ai.Dispell.ON_FIRE,
	aura_target_fx 	= "particles/gadget/hull_heal",
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CivilianRepair", },
	},
}

Spell.LossOfSignatures = 
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'LossOfSignatures_Speed', 'LossOfSignatures_DebuffImmunStart', 'LossOfSignatures_DebuffImmun' }
	--spells= { 'LossOfSignatures_Speed', 'LossOfSignatures_DebuffImmunStart' }
}
Spell.LossOfSignatures_DebuffImmun = 
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.DEBUFF_IMMUNE,
	--duration		= 6,
	duration		= 0.2,
--	period			= 1,
--	dispell_flag	= ai.Dispell.ON_DAMAGE + ai.Dispell.ON_FIRE,
--	aura_target_fx 	= "particles/gadget/hull_heal",
	isBuff			= true,
	aura_target_fx = "particles/gadget/debuff_immune",
	--cast_fx = "particles/gadget/drone_infiltrator_hit", -- , shield_boost , blackout_burst варианты на замену от тикета SC-114083
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LossOfSignatures", },
	},	
}
--INVULNERABILITY  --  чисто для сброса бомбы
Spell.LossOfSignatures_DebuffImmunStart = 
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.INVULNERABILITY,
	duration		= 0.2,
--	period			= 1,
--	dispell_flag	= ai.Dispell.ON_DAMAGE + ai.Dispell.ON_FIRE,
--	aura_target_fx 	= "particles/gadget/hull_heal",
	isBuff			= true,
	--aura_target_fx = "particles/gadget/debuff_immune",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LossOfSignatures", },
	},	
}
Spell.LossOfSignatures_Speed = 
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.FAST_MOVEMENT, 
	duration		= 6,
	aura_param		= 0.17,--0.35,
--	period			= 1,
--	dispell_flag	= ai.Dispell.ON_DAMAGE + ai.Dispell.ON_FIRE,
--	aura_target_fx 	= "particles/gadget/hull_heal",
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LossOfSignatures", },
	},
}
Spell.LossOfSignatures_HealBan = 
{
	aura  				= ai.Aura.HEALING_MOD,
	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	aura_range			= 300,
	aura_param			= -4,   -- оставляем 20% хила
	duration			= 6,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	aura_target_fx 		= "particles/gadget/healban_aura",
	isBuff				= false,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_LossOfSignatures", }, },
}

Spell.EnemyModuleWasteCDMult = 
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'EnemyModuleWasteCD', 'ECMSelfResist' }
}

Spell.EnemyModuleWasteCD =
{
	target			= --ai.SpellTarget.CASTER,
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class 			= ai.SpellTargetClass.SHIP,
		area 			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		misc 			= ai.SpellTargetMisc.VISIBLE,
	},
	target_range 	= 75,
	isBuff			= false,
	influence		= ai.Spell.SET_COOLDOWN,
	influence_param	= 1,
	choose_biggest_cooldown = true,
}

Spell.ECMSelfResist = 
{
	target			= 
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 200,
	isBuff			= true,
	duration		= 7,
}


Spell.HealOtherAlly = {
	aura_target		= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 3000,
	--target_range	= 150,
	aura_range		= 150,
	isBuff			= true,
	duration		= 3,
	period			= 0.2,
	--period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	period_beam_root_fx 	= "particles/gadget/pulsars/drone_hull_ray_periodic",
	aura_target_fx	= "particles/gadget/hull_heal",
	
	--beam_fx 	="particles/objects/portal_close_beam",
	
	--period_beam_fx 	= "particles/weapons/laser/laser_electric_beam",
	--period_beam_fx 	= "particles/gadget/healray_beam",
	--period_beam_root_fx = "particles/gadget/pulsars/pulsar_beam",
	ui_ico 				 = { target_system 	= { tex = "ItemSubtype_RemoteRepairDrones", }, },
}

Spell.ResistThermalHull_Mob ={
	aura_target		= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	--aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HULL_RESIST_THERMAL,
	aura_param		= 300,
	aura_range		= 200,
	isBuff			= true,
	duration		= 20,
	period = 1,
	period_beam_fx 	= "particles/weapons/laser/laser_electric_beam",
--	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	ui_ico 				 = { target_system 	= { tex = "ItemSubtype_AdaptiveArmorBoost", }, },
}
Spell.ResistEMHull_Mob ={
	aura_target		= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	aura			= ai.Aura.HULL_RESIST_EMP,
	aura_param		= 300,
	aura_range		= 200,
	isBuff			= true,
	duration		= 20,
	period = 1,
	period_beam_fx 	= "particles/weapons/laser/laser_electric_beam",
--	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	ui_ico 				 = { target_system 	= { tex = "ItemSubtype_AdaptiveArmorBoost", }, },
}
Spell.ResistKineticHull_Mob ={
	aura_target		= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	aura			= ai.Aura.HULL_RESIST_KINETIC,
	aura_param		= 300,
	aura_range		= 200,
	isBuff			= true,
	duration		= 20,
	period = 1,
	period_beam_fx 	= "particles/weapons/laser/laser_electric_beam",
--	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	ui_ico 				 = { target_system 	= { tex = "ItemSubtype_AdaptiveArmorBoost", }, },
}
Spell.ResistAllShield_Mob ={
	aura_target		= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param		= 300,
	aura_range		= 200,
	isBuff			= true,
	duration		= 15,
	period = 1,
	period_beam_fx 	= "particles/weapons/laser/laser_electric_beam",
--	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	ui_ico 				 = { target_system 	= { tex = "ItemSubtype_AdaptiveShieldBoost", }, },
}
-- -урон основного оружия всех врагов
Spell.AOE_EMI_Mob ={
	inherit 		= "Direct_AOE_EMI_T5_Mk1",
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	aura			= ai.Aura.DAMAGE_DEC,
	aura_param		= 2.5,
	aura_range		= 300,
	duration		= 8, --cool = 14
}

Spell.RecoverOtherAlly = {
	aura_target		= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param		= 3000,
	--target_range	= 150,
	aura_range		= 150,
	isBuff			= true,
	duration		= 3,
	period			= 0.2,
	--period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	period_beam_root_fx 	= "particles/gadget/pulsars/drone_shield_ray_periodic",
	aura_target_fx	= "particles/gadget/shield_heal",
	
	--beam_fx 	="particles/objects/portal_close_beam",
	
	--period_beam_fx 	= "particles/weapons/laser/laser_electric_beam",
	--period_beam_fx 	= "particles/gadget/healray_beam",
	--period_beam_root_fx = "particles/gadget/pulsars/pulsar_beam",
	ui_ico 				 = { target_system 	= { tex = "ItemSubtype_RemoteRepairDrones", }, },
}

Spell.EnginePowerRedistributor = 
{
	aura  				= ai.Aura.SLOW_MOVEMENT,
	target				= ai.SpellTarget.CASTER,
	aura_param			= 0.66667, --40% замедления
	duration			= 5,
	aura_fx 			= "particles/gadget/slow_movement",
	gameplay_specific	= true,
	diminish_control_aura = false,
	isBuff				= false,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_TargetPainter", }, },
}

Spell.PowerInstabilityShoter = 
{
	aura			= ai.Aura.SNIPER_PROJECTILE_SPELL,
	target_spell 	= "PowerInstabilityShot",
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	duration		= 25,
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= true,	
	ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_PowerInstabilityShot", },
		},
}

Spell.PowerInstabilityShot = 
{
	aura			= ai.Aura.FIRE_RATE_MOD,
	target			= {
						target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura_target		= {
						target 			= ai.SpellTargetGeneral.HOLDER,
					},
	duration		= 10,
	aura_param		= -0.3333,
	-- ignore_stacks	= true,
	-- ignore_subtype	= true,
	isBuff			= false,
	ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_PowerInstabilityShot", },
		},
		gun_spell_fx	   = "particles/gadget/weapon_instability",
	--aura_fx			= "particles/gadget/suicide_aura",
	--aura_sound 		= "sound/aura/voidzone",
	additional_auras = 
	{
		{
			aura			= ai.Aura.COOLDOWN_MOD,
			aura_target		= {
				target 			= ai.SpellTargetGeneral.HOLDER,
			},
			aura_param		= 0.2,
			duration		= 10,
			isBuff			= false,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PowerInstabilityShot", },
			},
		}
	}
}

Spell.WeaponFrontReaperRot = 
{
	aura = ai.Aura.FAST_MANEUVER,
	aura_param = 0.3,
	isBuff = true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_FrontReaperGun", }, },
	--hud_visible 	= false, -- прячем от игрока
}

Spell.WeaponFrontReaperGunOnSpeed = 
{
	aura = ai.Aura.DAMAGE_MOD,
	aura_param = 1,
	isBuff = true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_FrontReaperGun", }, },
--[[ 	additional_auras =
	{
		{
			isBuff			= true,
			aura_param		= 1,
			aura			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_FrontReaperGun", },
			},
		}
	} ]]
}

Spell.ClusterTorpedoAoE = --#87502 - пока не используется
{
	additional_auras =
	{
		{
			aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC, --аура дамага термического
			--aura_target		= ai.SpellTarget.ENEMY_AROUND,
			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				signature		= ai.SignatureMask.HUGE,
			},
			aura_param 		= 20, --кол-во дамага раз в period
			period 			= 1, --период между тиками дамага
			aura_range 		= 27, -- радиус, на котором аура наносит дамаг
			isBuff 			= false, --дебафф
			duration 		= 10, --продолжительность ауры
			ui_ico = { target_system = { tex = "ItemSubtype_GuidedMissile", }, },
		},
	},
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_fx = "particles/gadget/suicide_aura",
	aura_param = 1280.9671875,
	aura_range = 27,
	aura_sound = "sound/aura/voidzone",
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	duration = 10,
	ignore_stacks = true,
	ignore_subtype = true,
	isBuff = false,
	nebula = "Effects_GuidedRadiation",
	period = 1,
	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	ui_ico = 
	{
		target_system = 
		{
			tex = "ItemSubtype_GuidedMissile",
		},
	},
}

Spell.FreezeManeuver = 
{
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param 		= 0.4286,
	target = 
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		--area			= ai.SpellTargetArea.AROUND, -- в пушке
	},
	--target_range = 100, -- в пушке
	aura_target = 
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	isBuff = false,
	duration = 2,
	ignore_subtype = true,
	diminish_control_aura = false,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_Cryolaser", }, },
	additional_auras = 
	{
		{
			aura			= ai.Aura.SLOW_MANEUVER,
			aura_param 		= 2.33333,
			aura_target = 
			{
				target = ai.SpellTargetGeneral.HOLDER,
			},
			isBuff = false,
			duration = 2,
			ignore_subtype = true,
			diminish_control_aura = false,
			apply_crowd_control_coef	= true,
			ui_ico 				= { target_system 	= { tex = "ItemSubtype_Cryolaser", }, },
		}
	}
}

Spell.SmokeByRocket = --#88160: Активный модуль для командника: дымовая граната
{
	aura			= ai.Aura.DISABLE_LOCK, -- сбой радара
	target			=
	{
		target 	= ai.SpellTargetGeneral.CASTER,
		misc	= ai.SpellTargetMisc.POSITION,
	},
	aura_target		=
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.NEUTRAL,
		area			= ai.SpellTargetArea.AROUND,
	},
	aura_range		= 75,
	aura_sound 		= "sound/aura/stun",
	duration		= 10,
	isBuff			= false,
	apply_crowd_control_coef = true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_TargetPainter", }, },
	--aura_fx 		="particles/areal/spacedust_cloud",
	nebula	= "Effects_Nebula_Spacedust",
	additional_auras = 
	{
		{
			aura			= ai.Aura.ANTI_RADAR, -- радарная невидимость
			aura_target		=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.NEUTRAL,
				area			= ai.SpellTargetArea.AROUND,
			},
			aura_range		= 75,
			duration		= 10,
			isBuff			= true,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_TargetPainter", }, },
		}
	}
}

Spell.AttrackerField =
{
	target 			= ai.SpellTarget.INFLICTOR,
	--target_range	= 50,
	aura 			= ai.Aura.SHIP_ATTRACTION,  --ai.Aura.SLOW_MANEUVER, -- SLOW_MANEUVER делает контрол-деминишинг поэтому актуальное время снижается вдвое, используем нулевую ауру SLOW_MOVEMENT
	aura_target 	= 	{
		target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		-- class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY,
		-- area           = ai.SpellTargetArea.OUTSIDE,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		-- ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
	},
	aura_range		= 100,
	aura_param		= 300,
	duration		= 10,
	diminish_control_aura = false, -- диминишинг только на второй ауре
	isBuff			= false,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AttrackerField", },
	},
	use_dead_rcs_effects = true,
	{
	
	}
}

Spell.AddShieldResust = 
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },

	aura			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param		= 50,
	isBuff			= true,
	ignore_stacks	= true,
	ignore_subtype	= true,
}

Spell.EchoBuff = 
{
	target =
	{
		target		= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target =
	{
		target		= ai.SpellTargetGeneral.HOLDER,
	},
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.06,
	max_stacks		= 5,
	duration		= 3,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
}

Spell.DetectionBeacon = 
{
	target = 
	{
		target					= ai.SpellTargetGeneral.LOCKED_TARGET,
		class					= ai.SpellTargetClass.SHIP,
		relationship  			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target = 
	{
		class         			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
		area          			= ai.SpellTargetArea.AROUND,
		relationship  			= ai.SpellTargetRelationship.ENEMY,
		vitality      			= ai.SpellTargetVitality.ALIVE,
	},
	target_range				= 250,
	aura 						= ai.Aura.SPY_DRONE,
	ignore_subtype_if_other_team = true,
	isBuff						= false,
	aura_range					= 400,
	duration					= 10,
	aura_fx						= "particles/gadget/aura_wave_code",
	aura_target_fx				= "particles/gadget/lightnings_debuff",
	diminish_control_aura		= true,
	apply_crowd_control_coef	= true,
	start_diminishing_timer		= false,
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_DetectionBeacon", },
	},
	additional_auras = 
	{
		{
			aura_target = 
			{
				class          			= ai.SpellTargetClass.SHIP,
				area           			= ai.SpellTargetArea.AROUND,
				relationship   			= ai.SpellTargetRelationship.ENEMY,
				vitality       			= ai.SpellTargetVitality.ALIVE,
			},
			aura						= ai.Aura.HEALING_MOD,
			aura_param					= -1,
			target_range				= 250,
			isBuff						= false,
			aura_range					= 400,
			duration					= 10,
			diminish_control_aura		= true,
			apply_crowd_control_coef	= true,
			ui_ico =
			{
				target_system 			= { tex = "ItemSubtype_DetectionBeacon", },
			},
		}
	}
}

Spell.WeaponKineticStkBomb_SpellOnDeath = {
	target = {	
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	isBuff				= true,
	duration 			= 8,
	aura 				= ai.Aura.SPELL_ON_DEATH_SOMEONE,
	--в ауре пишем дополниельно:
	trigger_target 		=  -- таблица таргет
		{
			target			= ai.SpellTargetGeneral.HOLDER,
			vitality 		= ai.SpellTargetVitality.DEAD,
		},
	trigger_range 		= 20, -- расстояние
	target_spell 		= "WeaponKineticStkBomb_OnDeath", -- спелл который накладывается, если кто то умер
	hud_visible 		= false, -- прячем от игрока
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_KineticStkBomb", }, },
}

Spell.WeaponKineticStkBomb_OnDeath =
{
	target 				= { target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR
	aura_target 		= 
		{
			class 				= 	ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + 
									ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + 
									ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
			relationship		= ai.SpellTargetRelationship.ENEMY,
			area				= ai.SpellTargetArea.AROUND,
			misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,-- + ai.SpellTargetMisc.NEAREST,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura 				= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_range 			= 100,
	duration			= 1,
	period				= 0.2,
	aura_param			= 1100, -- *6   (*1 -- *0.3) скалируем по расстоянию и сигнатуре   500 -> 1000 - 6000 
	isBuff				= false,
	aura_fx = "particles/explosions/sticky_explosion",
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_KineticStkBomb", }, },
}

Spell.CommandCharge =
{
	isBuff			= true,
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param		= 20,
	aura_target 	= ai.SpellTarget.HOLDER,
	target 			= ai.SpellTarget.CASTER,
	max_stacks		= 3,

	-- ui_ico =
	-- {
	-- 	target_system 	= { tex = "ItemSubtype_ShieldChargesDestr", },
	-- },
}

Spell.CommandShieldRecharger = 
{
	target			=
	{
		target 			= ai.SpellTargetGeneral.CASTER,		
	},
	aura_target		=
	{
		target			= ai.SpellTargetGeneral.HOLDER,
	},
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param		= 1000,
	period			= 0.5,
	duration		= 0.5,
	isBuff			= true,
}

Spell.CommandShieldEnemyEnergySink = 
{
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target =
	{
		target			= ai.SpellTargetGeneral.HOLDER,
	},
	target_range	= 300,
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	aura_param		= 10000,
	period			= 0.5,
	duration		= 0.5,
	isBuff			= false,
}


Spell.HeraldPlasma = {
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'HeraldPlasma_Self', 'HeraldPlasma_Death' }
}

Spell.HeraldPlasma_Self =  
{
	--target			= ai.SpellTarget.CASTER,
	target 			= { 
						target 	= ai.SpellTargetGeneral.CONTEXT_TARGET,
						class 	= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
						relationship	= ai.SpellTargetRelationship.ENEMY,	
					},
	--aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_target 	= { target = ai.SpellTargetGeneral.CASTER, },
	aura			= ai.Aura.DISPERSION_MOD,	
	aura_param		= -0.5,
	max_stacks		= 10,
	can_stack		= true,
	duration		= 5,
	isBuff			= true,
	--ignore_stacks	= true,
	--ignore_subtype	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HeraldPlasma", },
	},
}

Spell.HeraldPlasma_Death = {
	target = {	
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	isBuff				= false,
	hud_visible 		= false,
	duration 			= 8,
	aura 				= ai.Aura.SPELL_ON_DEATH_SOMEONE,
	--в ауре пишем дополниельно:
	trigger_target 		=  -- таблица таргет
		{
			target			= ai.SpellTargetGeneral.HOLDER,
			vitality 		= ai.SpellTargetVitality.DEAD,
		},
	--trigger_range 		= 200, -- расстояние
	target_spell 		= "HeraldPlasma_onDeath", -- спелл который накладывается, если кто то умер
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HeraldPlasma", },
	},
}

Spell.HeraldPlasma_onDeath = 
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION }, --INFLICTOR
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,

	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP,
						area 			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura_range	 	= 200,		--дальность
	duration		= 0.2,
	period			= 0.2,
	aura_param		= 2500,
	isBuff			= false,
	--aura_fx			= "particles/gadget/suicide_aura",
	--aura_fx			= "particles/gadget/suicide_aura",
	--cast_position_fx= "particles/gadget/suicide_aura",
	
	---aura_fx 		=  "particles/gadget/protector_device_fx",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_HeraldPlasma", }, },
}

Spell.WebPropulsion_Mob_T3 = {
--[[
	target				= ai.SpellTarget.CASTER,
	aura_target 		=
	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NEAREST,	 --
	},]]
	aura_target				= ai.SpellTarget.VISIBLE_LOCKED_TARGET_BY_HOLDER,

	aura				= ai.Aura.SLOW_MOVEMENT,
	aura_range			= 320,
	aura_param			= 2,
	duration			= 12,
--	min_targets_count 	= 0,  -- если не указать аура самодиспелится
	isBuff				= false,
--	aura_holder_def		= "AuraHolderEntityHackImmune",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GuidedDronFoxSlow", },
	},
}

Spell.Mob_Cloaking =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 10,
	isBuff			= true,
--	aura_fx			= "particles/test/continuous_3",
--	aura_start_sound = "sound/gadgets/stealth_on",
--	aura_sound		= "sound/game/boost/small_start_loop",
--	aura_end_sound	= "sound/gadgets/stealth_off",
	uiName 			= "Special_CloakingDevice_Base",
	uiDesc 			= "Special_CloakingDevice_Base_Desc",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CloakingDevice", },
	},
	-- изменения в от #64709
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,
}

Spell.Mob_AllyCamouflage_T3 =
{
	duration 		= 20,
	aura 			= ai.Aura.ANTI_RADAR,
	aura_target			= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	--aura_target 	= { class = ai.SpellTargetClass.SHIP, area = ai.SpellTargetArea.AROUND, relationship = ai.SpellTargetRelationship.ALLY, },
	aura_range	 	= 120,		--дальность
	isBuff			= true,
	--dispell_flag 	= ai.Dispell.ON_MOVE,
	ui_ico =
	{
		target_system =
		{
			tex = "ItemSubtype_Camouflage"
		}
	},
}
Spell.Mob_Camouflage_T3 =
{
	duration 		= 17,
	aura 			= ai.Aura.ANTI_RADAR,
	--aura_target			= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	--aura_target 	= { class = ai.SpellTargetClass.SHIP, area = ai.SpellTargetArea.AROUND, relationship = ai.SpellTargetRelationship.ALLY, },
	--aura_range	 	= 120,		--дальность
	isBuff			= true,
	--dispell_flag 	= ai.Dispell.ON_MOVE,
	ui_ico =
	{
		target_system =
		{
			tex = "ItemSubtype_Camouflage"
		}
	},
}

Spell.EnergyShieldCommander_Mob_T3 =
{
	inherit 			= "EnergyShieldCommander_T1_Base",
	duration 			= 10,
	aura_param			= 15,
}

--SNIPER_OVERLOAD +SNIPER_DEFENCE_IMMUNE
Spell.SafeSniper =
	{
		duration 		= 20,
		aura 			= ai.Aura.SNIPER_DEFENCE_IMMUNE,
		isBuff			= true,
		target			= ai.SpellTarget.CASTER,
		ui_ico = { 	target_system = { tex = "ItemSubtype_SafeSniper" } },
	}
Spell.SafeSniper1 =
	{
		duration 		= 20,
		aura 			= ai.Aura.SNIPER_OVERLOAD,
		aura_param		= 0.2,
		isBuff			= true,
		target			= ai.SpellTarget.CASTER,
		is_powerful_sniper_aura	= true,
		ui_ico = { 	target_system = { tex = "ItemSubtype_SafeSniper" } },
	}

	
Spell.CooldownDownOnEnemyDeath = 
{
	influence		= ai.Spell.SET_COOLDOWN,
	target			= ai.SpellTarget.CASTER,
	influence_param = -1,
	isBuff			= true,
}


Spell.HoloSpy_Start =
{
	duration 		= 15,
	aura 			= ai.Aura.INVULNERABILITY, --(кроме столкновений)!!!
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	ui_ico = { 	target_system = { tex = "ItemSubtype_Camouflage" } },
	--COLLISION_IMMUNE
	-- дизабле стрельбы и модулей?
	--dispell_flag	= ai.Dispell.ON_TELEPORT,
	
}


Spell.SpecialStunClone = 
{
	target =
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	influence 		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.STEALTH,
	aura_target		=
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	duration 		= 12,
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_MOVE,
	dispell_timeout	= 2,
	--gameplay_specific	= true, -- само-диспел не работает
	isBuff 			= true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_SpecialStunClone", },
	},
	additional_auras = 
	{
		{
			aura_target = 
			{
				target = ai.SpellTargetGeneral.HOLDER,
			},
			aura			= ai.Aura.INVULNERABILITY,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_MOVE,
			dispell_timeout	= 2,
			isBuff			= true,
			duration		= 12,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_SpecialStunClone", },
			},
		},
		{
			aura_target = 
			{
				target = ai.SpellTargetGeneral.HOLDER,
			},
			aura			= ai.Aura.HEAL_HULL_PERIODIC,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_MOVE,
			dispell_timeout	= 2,
			isBuff			= true,
			duration		= 12,
			period			= 1,
			aura_param		= 200,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_SpecialStunClone", },
			},
		},
	},
	aura_end_sound 	= "sound/gadgets/shift_off",
}

Spell.SpecialStunClone_Stun =
{
	--target 				= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	--target 				= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, misc = ai.SpellTargetMisc.POSITION },
	
	--aura_target			= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	target				= ai.SpellTarget.ENEMY_SHIPS_AROUND, 
	target_range  		= 45,
	--aura_range			= 25,
	
	aura 				= ai.Aura.STUN,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration			= 4,
	--duration			= 100,
	isBuff 				= false,
	
	min_targets_count	= 1, -- SC-111758 СТ. Не сбрасывается эффект спецмодуля Dyrnwyn
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpecialStunClone", },
	},
	--aura_end_sound 	= "sound/gadgets/shift_off",
	aura_sound 			= "sound/aura/stun",
}

Spell.BotInvulnerability7 = 
{
	aura 				= ai.Aura.INVULNERABILITY,
	duration			= 2,
	gameplay_specific	= true,
	isBuff 				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MicroWarp", },
	},
}

Spell.PveMob_DestrHackWeapon =  
{
	target		= {
					target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					class 			= ai.SpellTargetClass.SHIP,
					signature		= ai.SignatureMask.HUGE,
				},
	target_range	= 350,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.HACKED_WEAPON,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	duration		= 5,
	--aura_param 		= 550,
	--period			= 1,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HackWeapon", }, },
}

Spell.PveMob_DestrCooldownMod =
{
	target		= {
					target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					class 			= ai.SpellTargetClass.SHIP,
					signature		= ai.SignatureMask.HUGE,
				},
	target_range	= 350,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.COOLDOWN_MOD,
	diminish_control_aura = true,
	start_diminishing_timer	= false,
	duration		= 13,
	aura_param 		= 5,
	--period			= 1,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_EnlargeActiveCooldown", }, },
}

--"Huge_EnergyVampire", --EnergyVampire_T1_Mk1  
Spell.Huge_EnergyVampire =  
{
	inherit		= EnergyVampire_T1_Mk1,
	target		= {
					target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					class 			= ai.SpellTargetClass.SHIP,
					signature		= ai.SignatureMask.HUGE,
				},
	duration		= 9,
	aura_param		= 120,
	diminish_control_aura	= false,
}


Spell.SpellOnHit_Vortex_Mob = 
{
	influence=ai.Spell.CAST_SPELLS,
	spells={ 'Vortex_Huge_Mob', 'Vortex_Epic' },
}
Spell.Vortex_Huge_Mob = 
{
	inherit			= "Vortex_Huge",
	aura_param		= 15250,
	duration		= 3,
	aura			= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_Vortex", }, },
}

Spell.TurningTide =
{
	isBuff			= false,
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 2600*1.7,
	aura_param_add  = -400, --2.5cek
	period			= 0.2,
	target 			= ai.SpellTarget.INFLICTOR,
	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class		= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET 
					 + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 20,
	aura_range_add  = 20, --2.5cek
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_TurningTide", },
	},
}

Spell.TurningTide_Self = { -- сопротивление щита- корпуса
	aura 				= ai.Aura.RESIST_ALL, 
	target				= ai.SpellTarget.CASTER,    
	aura_target 		= ai.SpellTarget.HOLDER,
	duration			= 20,  --27
	aura_param			= 250,
	ignore_stacks		= true, -- чтобы обновлялся параметр при повторном наложении
	aura_param_add		= -8,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_TurningTide", }, },
	additional_auras = 
	{
		{  -- ускорение прикрытия
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MOVEMENT,
			aura_param		= 0.75,
			duration		= 15,
			dispell_flag	= ai.Dispell.ON_DAMAGE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			period			= 1,
			aura_param_add	= -0.015,
			--dispell_flag	= ai.Dispell.ON_DAMAGE,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_TurningTide", },
			},
		},
--[[ 		{  -- запрет модулей  -- Сайленс ломает стрельбу модуля!!!
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.SILENCE,--ai.Aura.DISABLED_WEAPON,
			--aura_param		= 0.7,
			duration		= 7,
			gameplay_specific = true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_TurningTide", },
			},
		}, ]]
		{  -- запрет стрельбы
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.DISABLED_WEAPON,
			--aura_param		= 0.7,
			duration		= 7,
			gameplay_specific = true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_TurningTide", },
			},
		}, 
	},
}

--[[ 
 Spell.LandingTurret_Shell =
{
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	isBuff				= true,
	shell_def 			= "Shell_AdditionalShield",-- деф шкуры
	influence_param		= 33500,
	duration			= 10,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_LandingTurret", }, },
}  ]]
Spell.LandingTurret =
{
	--  + урон
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	--target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION }, 
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.3,
	duration		= 23,
	--aura_holder_def	= "AuraHolderShieldLandingTurret",
	spell_on_cancel = "LandingTurretInvulnerability",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LandingTurret", },
	},
	additional_auras = 
	{
		{  -- + дальность
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
			aura_param		= 0.3,
			duration		= 23,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LandingTurret", },
			},
		},
		{  -- + хил щита
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
			period			= 1,
			aura_param		= 2500,
			duration		= 23,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LandingTurret", },
			},
		},
		{  -- + скорость пули
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.PROJECTILE_SPEED_MOD,
			aura_param		= 0.3,
			duration		= 23,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LandingTurret", },
			},
		},
	}
}

Spell.LandingTurretInvulnerability = 
{
	aura 				= ai.Aura.INVULNERABILITY,
	duration			= 1.5,
	isBuff 				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LandingTurret", },
	},
	additional_auras = 
	{

		{  -- + хил корп
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.HEAL_HULL_PERIODIC,
			period			= 1,
			aura_param		= 2500/4,
			duration		= 3,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LandingTurret", },
			},
		},
	}	
}

Spell.PiligrimShield2Speed = 
{
	aura_param		= 1, 
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,
	isBuff 			= true,	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PiligrimShield2Speed", },
	},
}

Spell.GreenFastProjectile = 
{
	aura 			= ai.Aura.PROJECTILE_SPEED_MOD, 
	isBuff			= true,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_param		= 0.3,
	isBuff			= true,
	--ignore_stacks	= false,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_GreenFastProjectile" } },	
}


Spell.Spell_SwarmCloud =
{
	aura 			= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	--target 			= ai.SpellTarget.CASTER,
	target 			= ai.SpellTarget.INFLICTOR,

	aura_range		= 30,
	aura_param		= 20,
	period			= 0.2,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SwarmCloud", },
	},
}

Spell.Spell_SwarmCloudHeal = 
{
	aura			= ai.Aura.HEAL_HULL_PERIODIC, --ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= {
						--target 		= ai.SpellTargetGeneral.CONTEXT_TARGET,
						target 			= ai.SpellTargetGeneral.INFLICTOR,
						misc			= ai.SpellTargetMisc.POSITION,
				},
	aura_target		=
					{
						--class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						class 			= ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ALLY,
					},
	aura_range 		= 60,
	period			= 0.2,
	duration		= 0.4,
	aura_param		= 1500,--5000,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SwarmCloud", },
	},
	--aura_fx			= "particles/gadget/suicide_aura",
}


-----------------------------------------------------------------------------------
--   посадочная платформа
Spell.LandingPlatform_Buff2Parent =  -- спелл когда на платформе сидит алли
{
	--  -- + хил щита
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	--target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION }, 
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,	
	period			= 1,
	aura_param		= 1000,
	--duration		= 20,
	ui_ico = { target_system 	= { tex = "ItemSubtype_LandingPlatform", }, },
	additional_auras = 
	{
		{  -- + Энергия 
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.ADD_ENERGY_PERIODIC,
			period			= 1,
			aura_param		= 150,
			--duration		= 20,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LandingPlatform", },
			},
		},
	},
}

--   бонус резистов сидящему кораблю
Spell.LandingPlatform_Buff2Landed_Res =   -- спелл на гостя "союзный корабль"
{
	isBuff 			= true,
	aura 			= ai.Aura.RESIST_ALL,
	aura_target 	= 
	{ 
		target 		 = ai.SpellTargetGeneral.LANDED_ON_HOLDER,
		class			= ai.SpellTargetClass.SHIP,
	},
	min_targets_count = 0,
	aura_param		= 100,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_LandingPlatform" } },
}

Spell.LandingPlatform_Buff2Guest =   -- спелл на гостя - алли
{
	--  + Хил корпуса 
	isBuff 			= true,
	target			= 	{
						target 		= ai.SpellTargetGeneral.CONTEXT_TARGET,
						},
	--target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION }, 
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	period			= 0.2,
	aura_param		= 150,
	--duration		= 20,
	ui_ico = { target_system 	= { tex = "ItemSubtype_LandingPlatform", }, },
	additional_auras = 
	{
		{  -- + хил щита
			isBuff 			= true,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
			period			= 0.2,
			aura_param		= 150,
			--duration		= 20,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LandingPlatform", },
			},
		},
		{  -- + дальность пули
			isBuff 			= true,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
			--period			= 1,
			aura_param		= 0.25,
			--duration		= 20,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LandingPlatform", },
			},
		},
		{  -- + урон
			isBuff 			= true,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.DAMAGE_MOD,
			period			= 1,
			aura_param		= 0.25,
			--duration		= 20,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LandingPlatform", },
			},
		},
	},
}

 Spell.LandingPlatform_Heal2Drone =   -- пока дрон сидит его хилим   
{
	aura			= ai.Aura.HEAL_HULL_PERIODIC, --ai.Aura.DAMAGE_THERMAL_SCALED,
	--aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= 	{
						target 		= ai.SpellTargetGeneral.CONTEXT_TARGET,
						},
	aura_target		= ai.SpellTarget.HOLDER,
	aura_param		= 500,
	isBuff 			= true,
} 

 Spell.LandingPlatform_Heal2Drone_Emperor =   -- пока дрон сидит его хилим   
{
	aura			= ai.Aura.HEAL_HULL_PERIODIC, --ai.Aura.DAMAGE_THERMAL_SCALED,
	--aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= 	{
						target 		= ai.SpellTargetGeneral.CONTEXT_TARGET,
						},
	aura_target		= ai.SpellTarget.HOLDER,
	aura_param		= 500,
	isBuff 			= true,
	
	additional_auras = 
	{
		{  -- - дамаг сидящим дронам
			isBuff 			= true,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.DAMAGE_DEC,
			aura_param		= 1,
		},
	},
} 

Spell.LandingPlatform_Buff2Drone =  -- только что взлетевший дрон жарит ярче x2
{
	--aura			= ai.Aura.HEAL_HULL_PERIODIC, --ai.Aura.DAMAGE_THERMAL_SCALED,
	--aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura			= ai.Aura.DAMAGE_MOD,
	target			= 	{
						target 		= ai.SpellTargetGeneral.CONTEXT_TARGET,
						},
	aura_target		= ai.SpellTarget.HOLDER,
	aura_param		= 1,
	duration		= 12,
	isBuff 			= true,
} 

 --    Спецмодуль SWARM
--------------------------------------------------------
Spell.PhaseShield_Phase1_0 =   -- бафф корабля в 1.0
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 10,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm_Phase0", }, },
}
Spell.PhaseShield_Phase1_1 =   -- бафф корабля в 1.1
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 100,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm_Phase1", }, },
}
	
--
Spell.PhaseShield_Phase1_2 =   -- бафф корабля в 1.2
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,	
	aura_param		= 25,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm_Phase2", }, },
	additional_auras = 
	{
		{  -- + дальность
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MANEUVER,
			aura_param		= 0.4,
			--duration		= 20,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm_Phase2", },
			},
		},
	},
}
--	spell2 				= "PhaseShield_Phase3_1",   -- бафф корабля в 1.3
Spell.PhaseShield_Phase1_3 =   -- бафф корабля в 1.3
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 0.10,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm_Phase3", }, },
	
	additional_auras = 
	{
		{  -- + дальность
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.RESIST_ALL,
			aura_param		= 10,
			--duration		= 20,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm_Phase3", },
			},
		},
	},
	
}
Spell.PhaseShield_Phase2_1 =   -- бафф корабля в 2.1
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 125,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm2_Phase1", }, },
}
Spell.PhaseShield_Phase2_1_add =   -- бафф корабля в 2.1
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 400,
	period			= 1,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm2_Phase1", }, },
}

Spell.PhaseShield_Phase2_2 =   -- бафф корабля в 2.2
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,	
	aura_param		= 0.1,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm2_Phase2", }, },
	additional_auras = 
	{
		{
			isBuff 			= true,
			--target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MANEUVER,
			aura_param		= 0.1,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm2_Phase2", },
			},
		},
		{
			isBuff 			= true,
			--target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.RESIST_ALL,
			aura_param		= 10,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm2_Phase2", },
			},
		},
	},
}
Spell.PhaseShield_Phase2_3 =   -- бафф корабля в 2.3
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,	
	aura_param		= 0.1,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm2_Phase3", }, },
	additional_auras = 
	{
		{
			isBuff 			= true,
			--target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MANEUVER,
			aura_param		= 0.1,
			ui_ico =
				{
				target_system 	= { tex = "ItemSubtype_Swarm2_Phase3", },
				},
		},
		{
			isBuff 			= true,
			--target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.RESIST_ALL,
			aura_param		= 10,
			ui_ico =
				{
				target_system 	= { tex = "ItemSubtype_Swarm2_Phase3", },
				},
		},
	},
}
Spell.PhaseShield_Phase3_1 =   -- бафф корабля в 3.1
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 40,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm3_Phase1", }, },
}
Spell.PhaseShield_Phase3_1_add =   -- бафф корабля в 3.1
{	
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 0.25,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm3_Phase1", }, },
}
Spell.PhaseShield_Phase3_2 =   -- бафф корабля в 3.2
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,	
	aura_param		= 50,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm3_Phase2", }, },
}
Spell.PhaseShield_Phase3_3 =   -- бафф корабля в 3.3
{	
	--target			= 	{ ai.SpellTargetGeneral.PARENT, },
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,	
	aura_param		= 20,
	isBuff 			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_Swarm3_Phase3", }, },
	additional_auras = 
	{
		{
			isBuff 			= true,
			--target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MANEUVER,
			aura_param		= 0.25,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm3_Phase3", },
			},
		},
	},
}
 -- спелл которым атакует рой
Spell.SwarmBaseDamage = 
{
	aura 			= ai.Aura.DAMAGE_KINETIC_PERIODIC,   --DAMAGE_KINETIC_SCALED
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	--target 			= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	target 			= ai.SpellTarget.INFLICTOR,

	aura_range		= 12,
	aura_param		= 1000, -- пара тиков на ранже=7 ; 5 тиков на ранже=12 
	period			= 0.2,
	isBuff			= false,
	aura_sound 		= "sound/aura/swarm_hit",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Swarm_Phase1", },
	},
}
 -- спелл которым атакует рой
 Spell.Swarm2BaseDamage = 
 {
	--aura 			= ai.Aura.DAMAGE_KINETIC_PERIODIC,   --DAMAGE_KINETIC_SCALED
	aura 			= ai.Aura.DAMAGE_KINETIC_SCALED,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	--target 			= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.BATTLE_STATION,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	target 			= ai.SpellTarget.INFLICTOR,

	aura_range		= 12,
	aura_param		= 1500, -- пара тиков на ранже=7 ; 5 тиков на ранже=12 
	period			= 0.2,
	isBuff			= false,
	aura_sound 		= "sound/aura/swarm_hit",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Swarm2_Phase1", },
	},
	
	additional_auras = 
	{
		{
			aura			= ai.Aura.DAMAGE_KINETIC_SCALED,
			aura_target =
			{
				class 			= ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.SC_BASE_ENTITY,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
			target 			= ai.SpellTarget.INFLICTOR,
			
			aura_range 		= 30,
			aura_param		= 1100,
			period			= 0.2,
			isBuff 			= false,
			aura_sound 		= "sound/aura/swarm_hit",
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm2_Phase1", },
			},
		},
	},
}

-- спелл которым атакует рой
Spell.Swarm3BaseDamage = 
{
	--aura 			= ai.Aura.DAMAGE_KINETIC_PERIODIC,   --DAMAGE_KINETIC_SCALED
	aura 			= ai.Aura.DAMAGE_KINETIC_SCALED,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	--target 			= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.BATTLE_STATION,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	target 			= ai.SpellTarget.INFLICTOR,

	aura_range		= 12,
	aura_param		= 1300, -- пара тиков на ранже=7 ; 5 тиков на ранже=12 
	period			= 0.2,
	isBuff			= false,
	aura_sound 		= "sound/aura/swarm_hit",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Swarm3_Phase1", },
	},
	
	additional_auras = 
	{
		{
			aura			= ai.Aura.DAMAGE_KINETIC_SCALED,
			aura_target =
			{
				class 			= ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.SC_BASE_ENTITY,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
			target 			= ai.SpellTarget.INFLICTOR,
			
			aura_range 		= 30,
			aura_param		= 1100,
			period			= 0.2,
			isBuff 			= false,
			aura_sound 		= "sound/aura/swarm_hit",
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm3_Phase1", },
			},
		},
	},
}

--PlasmaBursts
Spell.Spell_PlasmaBursts = 
{
	aura			= ai.Aura.DAMAGE_EMP_PERIODIC, --,
	target =
	{
		target 		= ai.SpellTargetGeneral.CONTEXT_POSITION,
		--target 			= ai.SpellTargetGeneral.INFLICTOR,
		misc			= ai.SpellTargetMisc.POSITION,
		signature		= ai.SignatureMask.TINY + ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM + ai.SignatureMask.LARGE,
	},
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	aura_range 		= 3,
	aura_range_add  = 6,
	period			= 0.5,
	duration		= 3,
	aura_param		= 500,
	aura_param_add	= -100,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaBursts", },
	},
	additional_auras = 
	{
		{  -- только по эсмам
			isBuff 			= false,
			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				signature		= ai.SignatureMask.HUGE,
			},
			aura			= ai.Aura.DAMAGE_EMP_PERIODIC,
			aura_range 		= 18,
			aura_range_add  = 7,
			period			= 0.5,
			duration		= 3,
			aura_param		= 1000,
			aura_param_add	= -100,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PlasmaBursts", },
			},
		},
	},
	aura_fx			= "particles/gadget/damage_emp_burst",
}

Spell.BFG = 
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED, --ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= {
						--target 		= ai.SpellTargetGeneral.CONTEXT_TARGET,
						target 			= ai.SpellTargetGeneral.INFLICTOR,
						misc			= ai.SpellTargetMisc.POSITION,
				},
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						--class 			= ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura_range 		= 26,
	period			= 0.5,
	duration		= 6.5,
	aura_param		= 100,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BFG", },
	},
	--aura_fx			= "particles/gadget/suicide_aura",
}

Spell.BFG_Big = 
{
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC, --DAMAGE_THERMAL_SCALED, --ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= {
						--target 		= ai.SpellTargetGeneral.CONTEXT_TARGET,
						target 			= ai.SpellTargetGeneral.INFLICTOR,
						misc			= ai.SpellTargetMisc.POSITION,
				},
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						--class 			= ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura_range 		= 20,--121,
	aura_range_add 	= (100 - 20 ) / 6, --130,  (130 - 20 ) / 6
	period			= 0.5,
	duration		= 6.5,
	aura_param		= 100,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BFG", },
	},
	additional_auras = 
	{
		{  -- хил союзных
			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ALLY,
			},
			aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
			aura_range 		= 20,--121,
			aura_range_add 	= (100 - 20 ) / 6, --130,  (130 - 20 ) / 6
			period			= 0.5,
			duration		= 6.5,
			aura_param		= 100,
			isBuff			= true,
			ignore_stacks	= true,
			ignore_subtype	= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_BFG", },
			},
		},
	},
	--aura_fx			= "particles/gadget/suicide_aura",
}

-------------------------------------------------
Spell.DevastatorGun_Start =
{

	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target 	= 		{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.IN_CYLINDER,
		relationship	= ai.SpellTargetRelationship.ENEMY , -- + ai.SpellTargetRelationship.NEUTRAL
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},

	aura_range		= 550,
	aura_extra_radius= 25,

	aura_param		= 150,
	duration 		= 2,
	period			= 0.2,
	isBuff			= false,
	ui_ico = { target_system = { tex = "ItemSubtype_DevastatorGun", }, },

	work_beam_fx = "particles/weapons/laser/blue_ray_1",
	cast_shot_fx = "particles/weapons/laser/blue_ray_1_muzzle",
	
	ray_shot_sound = "sound/gadgets2/devastatorGun_beam",
	
	additional_auras =
	{
		{
		aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
		aura_target 	= 		{
			class			= ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
			area			= ai.SpellTargetArea.IN_CYLINDER,
			relationship	= ai.SpellTargetRelationship.ENEMY, -- + ai.SpellTargetRelationship.NEUTRAL
			ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
			vitality		= ai.SpellTargetVitality.ALIVE,
			},
		aura_range		= 550,
		aura_extra_radius= 25,
		aura_param_mul	= 10, -- для тултипа, число умножения урона по "не кораблям"
		aura_param		= 150*10,
		duration 		= 2,
		period			= 0.2,
		isBuff			= false,
		},
	},
}
Spell.DevastatorGun_End =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.CAST_SPELL_IN_THE_END,
	target_spell	= "DevastatorGun_EndZone",
	aura_target 	= 		{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.IN_CYLINDER,
		relationship	= ai.SpellTargetRelationship.ENEMY, -- + ai.SpellTargetRelationship.NEUTRAL
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},

	aura_range		= 550,
	aura_extra_radius= 25,
	duration 		= 0.2,
	period			= 0.2,
	isBuff			= false,
	hud_visible 	= false,
	ui_ico = { target_system = { tex = "ItemSubtype_DevastatorGun", }, },

	nebula 			= "Effects_Nebula_TachRay",
	work_beam_fx	= "particles/weapons/laser/blue_ray_2",
	cast_shot_fx 	= "particles/weapons/laser/blue_ray_2_muzzle",

}

Spell.DevastatorGun_EndZone =
{
	aura			= ai.Aura.DAMAGE_EMP_SCALED, --ai.Aura.DAMAGE_THERMAL_SCALED,
	target 			= { 
						target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
						misc			= ai.SpellTargetMisc.POSITION,
					},
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
						--class 			= ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura_range 		= 70,--20*1.1, --SC-114318
	aura_param		= 100,
	aura_param_add	= 100,
	duration		= 4, --8, --SC-114318
	period			= 1,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_DevastatorGun", }, },
	nebula 			 = "Effects_Nebula_DevastatorEndZone",
	period_module_fx = "particles/gadget/damage_emp_module",
	period_module_my_fx = "particles/gadget/damage_emp_module",
	period_module_fx_number_by_stacks = { 5 },
	aura_fx = "particles/gadget/damage_emp_sphere_blue_ray",
	aura_sound = "sound/aura/devastator_cloud",
}

Spell.Spell_CageJumpPrepare = 
{
	--aura			= ai.Aura.FAST_MANEUVER,
	--aura_param		= 0.05,
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 0.05,

	duration 			= 2,
	aura_range			= 50,

	--target			= ai.SpellTarget.CASTER,
	--aura_target = ai.SpellTarget.CASTER,
	
	
	aura_target = 
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	
	isBuff				= false,
	hud_visible			= false,
	
	aura_fx						= "particles/gadget/cagetrap_prepare",
	work_beam_target_root_fx	= "particles/gadget/cagetrap_beam",
	ui_ico 			= { target_system = { tex = "ItemSubtype_CageJump", }, },
	
	--spell_on_cancel = "Spell_CageJump_Main",
}

Spell.Spell_CageJump_Main =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_CageJumpJump', 'Spell_CageJump' }
}

Spell.Spell_CageJump = 
{
	aura 				= ai.Aura.SLOW_MOVEMENT,
	aura_param			= 300,

	-- aura = ai.Aura.DAMAGE_EMP_PERIODIC

	duration 			= 15,
	aura_range			= 50,
	--target				= ai.SpellTarget.CASTER_POSITION_CASTER,
--[[ 	target				= 	{
		target		= ai.SpellTargetGeneral.CASTER,
		ai			= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality	= ai.SpellTargetVitality.ALIVE,
		misc		= ai.SpellTargetMisc.POSITION,
	}, ]]
	--[[
	aura_holder_offset = Vec3( 0, 0, 4 ),
	aura_holder_attach_bone = "root",
	]]
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_holder_def		= "CageJumpHolder",
	aura_target = 
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	isBuff = false,
	hud_visible 		= false,
--	min_targets_count = 0,
	aura_fx ="particles/gadget/cagetrap_emmiter",
	ui_ico 			= { target_system = { tex = "ItemSubtype_CageJump", }, },
	additional_auras = 
	{
		{
			aura = ai.Aura.DISABLE_WARP,
			duration = 15,
			aura_range			= 50,
			aura_target = 
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			ignore_stacks = true,
			ignore_subtype = true,
			isBuff			= false, -- SC-118152
			work_beam_target_root_fx = "particles/gadget/cagetrap_beam",
			ui_ico 			= { target_system = { tex = "ItemSubtype_CageJump", }, },
		}
	}
}


Spell.Spell_CageJumpJump =
{
	influence_param	= -350,
	influence 		= ai.Spell.REVERSE_THRUSTER,
	target 			= ai.SpellTarget.CASTER ,
	--target 		= ai.SpellTarget.SHIPS_AROUND,
	--target_range		= 15,
	--cast_fx			= "particles/gadget/jump_green_huge",
	--cast_position_fx = "particles/gadget/jump_green_huge",
	--cast_position_fx = "particles/gadget/reverse_thruster",
	--cast_screen_fx = "particles/screen/jump",
	in_fx 	= "particles/gadget/jump_green_huge",
	out_fx 	= "particles/gadget/jump_green_huge",

	in_sound = "sound/el_modules/GreenJumpOnStrafe",
	out_sound = "sound/el_modules/GreenJumpOnStrafe",
	--cast_sound 		= "sound/el_modules/GreenJumpOnStrafe",
	fish_eye_time 	= "0.5",
	fish_eye_max 	= "0.25",
	--scale_on_weapon	= true

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ReverseThruster", },
	},
}

Spell.April_Food_Freeze =
{
	target = --ai.SpellTarget.ENEMY_AROUND,
	{
		class 	= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area 	= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	target_range	= 10,
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 0.5,
	duration		= 5,
	screen_fx     = "particles/screen/pizza",
	isBuff			= false,
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_SpaceMissile_April", },
	},
}

Spell.April_Food_Bonus =
{
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param 		= 350.0,
	duration		= 10,
	period			= 1,
	isBuff			= true,
	aura_fx = "particles/gadget/heal_pizza",
	ui_ico 			=
	{
		target_system 	= { tex = "Module_AprilDrone_Pizza", },
	},
	
	additional_auras = 
	{
		{
			aura = ai.Aura.OVERCHARGE,
			aura_param 		= 0.35,
			duration		= 10,
			isBuff			= true,
			ui_ico 			= { target_system = { tex = "Module_AprilDrone_Pizza", }, },
		}
	},
	
	--aura_sound = "sound/game/bonus_take",
}

Spell.April_FoodBox_Bonus =
{
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param 		= 1050.0,
	duration		= 10,
	period			= 1,
	isBuff			= true,
	aura_fx = "particles/gadget/heal_pizza",
	ui_ico 			=
	{
		target_system 	= { tex = "Module_AprilDrone_Pizza", },
	},
}

Spell.April_Heal_Bonus =
{
	influence = ai.Spell.APPLY_AURA,
	aura_target = ai.SpellTarget.HOLDER,
	aura = ai.Aura.MODIFY_OUTPUT_HEAL,
	aura_param = 0.85,
	isBuff = true,
	gameplay_specific = true,
	hud_visible = false,
}

Spell.CucumberSpell =
{
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_param 			= -250,
	aura_range		= 800,
	uiName 			= "CucumberAura",
	target 			= 
	{ 
		target		= ai.SpellTargetGeneral.CASTER,
	--	misc			= ai.SpellTargetMisc.POSITION,
	},
	ui_ico = 
	{
		target_system = { tex = "ItemSubtype_GreenGravityAnomaly", },
	},
	aura_target		=
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,  --цилиндр радиуса aura_range и длиной target_range
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL + ai.SpellTargetRelationship.ALLY,
	},
}

Spell.KnockSpell =
{
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_param 			= -300,
	aura_range		= 800,
	uiName 			= "CucumberAura",
	target 			= 
	{ 
		target		= ai.SpellTargetGeneral.CASTER,
	--	misc			= ai.SpellTargetMisc.POSITION,
	},
	ui_ico = 
	{
		target_system = { tex = "ItemSubtype_GreenGravityAnomaly", },
	},
	aura_target		=
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,  --цилиндр радиуса aura_range и длиной target_range
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL + ai.SpellTargetRelationship.ALLY,
	},
}


Spell.RaidMineExplode = {
	influence 				= ai.Spell.EXPLOSION,
	target =
	{
		target = ai.SpellTargetGeneral.INFLICTOR,
		--misc = ai.SpellTargetMisc.POSITION
	},
	explosion_blast_wave = "Blastwave_MineRaidExplode",
}

Spell.Spell_UniqueHardShield =
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.SHIELD_RESIST_ALL_DEC,
	--aura_param 			= 30.0,
	aura_param 			= 40,
	gameplay_specific	= true,
	--duration			= 8,
	isBuff				= false,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_UniqueHardShield", },
	},
	
	additional_auras = 
	{
		{
			target 				= ai.SpellTarget.CASTER,
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.FAST_MOVEMENT,
			aura_param			= 0.35,
			duration			= 10,
			isBuff 				= true,
			dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,

			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_UniqueHardShield", },
			},
		},
	},
}

Spell.Spell_UniqueHardShield_Passive =
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 			= 50.0,
	gameplay_specific	= true,
	isBuff				= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_UniqueHardShield", },
	},
}

Spell.Spell_ComboRestore =
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 			= 20,
	duration			= 8,
	isBuff				= true,
	aura_fx				= "particles/gadget/shield_fortify",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ComboRestore", },
	},
	
	additional_auras = 
	{
		{
			target 				= ai.SpellTarget.CASTER,
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.HEAL_HULL_PERIODIC,
			aura_param			= 800,
			duration			= 8,
			period				= 1,
			isBuff 				= true,
			aura_fx				= "particles/gadget/hull_heal",

			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_ComboRestore", },
			},
		},
		
		{
			target 				= ai.SpellTarget.CASTER,
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.SLOW_MOVEMENT,
			aura_param			= 0.25,
			duration			= 8,
			isBuff				= false,
			gameplay_specific	= true,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_ComboRestore", },
			},
		},
	},
}

Spell.Spell_StealthShip =
{
	target				= ai.SpellTarget.CASTER,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.ANTI_RADAR, --CAMO_MOD
	duration			= 5,
	isBuff				= true,
	ignore_stacks		= true,
	ignore_subtype		= true,
	aura_fx 			= "StealthEffect",
	
	dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Stealth", },
	},
	
	additional_auras = 
	{
		{
			target 				= ai.SpellTarget.CASTER,
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.FAST_MOVEMENT,
			aura_param			= 0.35,
			duration			= 5,
			isBuff 				= true,
			
			dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,

			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Stealth", },
			},
		},
		
		{
			target 				= ai.SpellTarget.CASTER,
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.SHIELD_RESIST_ALL_DEC,
			aura_param			= 30,
			duration			= 5,
			isBuff 				= false,
			gameplay_specific	= true,
			
			dispell_flag		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,

			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Stealth", },
			},
		},
	},
	
}

Spell.Spell_HealParts =
{
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param 		= 800.0,
	duration		= 5,
	period			= 1,
	isBuff			= true,
	aura_fx			= "particles/gadget/hull_heal",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_SpaceMissile_HealParts", },
	},
	
	additional_auras = 
	{
		{
			aura = ai.Aura.HEAL_SHIELD_PERIODIC,
			aura_param 		= 800.0,
			duration		= 5,
			period			= 1,
			isBuff			= true,
			aura_fx			= "particles/gadget/shield_heal",
			ui_ico 			= {
				target_system = { tex = "ItemSubtype_SpaceMissile_HealParts", },
			},
		}
	},
	
	--aura_sound = "sound/game/bonus_take",
}

Spell.Spell_ResistSub =
{
	target = --ai.SpellTarget.ENEMY_AROUND,
	{
		class 	= ai.SpellTargetClass.SHIP,-- + ai.SpellTargetClass.CARGOSHIP,
		area 	= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	target_range	= 10,
	aura			= ai.Aura.RESIST_ALL_DEC,
	aura_param		= 20,
	duration		= 20,
	isBuff			= false,
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_SpaceMissile_ResistSub", },
	},
}

Spell.Spell_DestrAnomalyBot =
{
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		area 			= ai.SpellTargetArea.AROUND,
		--misc			= ai.SpellTargetMisc.NEAREST,
	},
	aura				= ai.Aura.SHIP_ATTRACTION,
	aura_param			= -20,
	aura_range			= 40,
	isBuff				= false,
	aura_fx					= "particles/gadget/gravy_anomaly_drone",
	--work_beam_target_root_fx 		= "particles/gadget/cagetrap_beam",
	--ignore_subtype 	= true,
	aura_target_directed_fx = "particles/gadget/push_ray_hit",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DestrMunition_AnomalyBot", },
	},
}

Spell.Spell_PlasmaCooling_Crit = 
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.DISABLE_HEAT,  
	duration		= 5,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmagunSniper_Pirate", },
	},
}

Spell.Spell_RailDamage_Crit = 
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.DAMAGE_MOD,  
	aura_param		= 0.15,
	duration		= 6,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RailgunSniper_Pirate", },
	},
}

Spell.Spell_PlasmaPirate_Crit =  -- Спелл для пиратского плазменного орудия Weapon_PlasmagunPirate
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.FIRE_RATE_MOD, 
	aura_param		= 0.1,
	can_stack = true,
	max_stacks = 5,
	duration		= 10,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmagunAutofire_3", },
	},
}

Spell.Spell_RailFreeze_Crit = 
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	aura 				= ai.Aura.SLOW_MANEUVER,
	aura_param			= 0.1,
	apply_crowd_control_coef	= true,
	duration			= 10,
	max_stacks 			= 3,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RailgunAutofire_Pirate", },
	},
}

Spell.Spell_BallHitAndCloud =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_SwarmOnBallHit', 'Spell_SwarmOnCloud', }
}

Spell.Spell_SwarmOnCloud = 
{
	aura 					= ai.Aura.SLOW_MOVEMENT,
	aura_param				= 0.4286,

	aura_range				= 40,
	holder_sound 			= "sound/aura/SwarmOnCloud",

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_POSITION,
		misc = ai.SpellTargetMisc.POSITION
	},
	aura_holder_def = "AuraHolderEntityHackDamageImmune",
	aura_target = 
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	
	isBuff				= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Swarm3_Phase3", },
	},

	aura_fx				= "particles/gadget/swarm/swarm_drone_cloud2",
	aura_target_fx		= "particles/gadget/lightnings_debuff",
	nebula 				= "Effects_Nebula_SlowSpeed400",

	additional_auras = 
	{
		{
			aura = ai.Aura.DISABLE_WARP,
			aura_range			= 40,
			aura_target = 
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},

			isBuff				= false,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm3_Phase3", },
			},
		},
		{
			aura = ai.Aura.VISION_RADIUS_MOD,
			aura_param			= -3,
			aura_range			= 40,
			aura_target = 
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},

			isBuff				= false,
			hud_visible 		= false,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm3_Phase3", },
			},
		},
		{
			aura				= ai.Aura.CAMO_MOD,
			aura_param			= 3,
			aura_range			= 40,
			aura_target = 
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
			},

			isBuff				= true,
			hud_visible 	= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Swarm3_Phase3", },
			},
		},
	}
}

Spell.Spell_SwarmOnBallHit = 
{
	aura 				= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_range			= 35,

	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_POSITION,
		misc			= ai.SpellTargetMisc.POSITION,
	},
	aura_holder_def = "AuraHolderEntityHackDamageImmune",
	aura_target = 
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_param			= 3500/2,
	period				= 0.5,
	duration			= 0.5,
	isBuff				= false,
	hud_visible 		= true,
	--aura_sound 			= "sound/aura/swarm_hit",
}

Spell.Spell_HealEntity = 
{
	aura 						= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param					= 300,
	period						= 0.5,
	duration 					= 30,
	aura_range					= 250,

	aura_holder_offset			= Vec3( 0, 12, 7 ),
	aura_holder_attach_bone		= "root",
	aura_holder_def				= "HealEntityHolder",
	
	target						= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target = 
	{
		class					= ai.SpellTargetClass.SHIP,
		area					= ai.SpellTargetArea.AROUND,
		relationship			= ai.SpellTargetRelationship.ALLY,
	},
	isBuff						= true,
	hud_visible 				= false,
	period_beam_root_fx			= "particles/gadget/pulsars/pulsar_alien_beam",
	aura_target_fx				= "particles/gadget/pulsars/pulsar_alien_hit",
	period_sound				= "sound/gadgets/pulsar/pulsar_period",
}

-- используется как босс модуль
Spell.Spell_EntityRayPrepare =
{
	target					= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura 					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class         		 = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area          		 = ai.SpellTargetArea.IN_CYLINDER,
		relationship  		 = ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_holder_def			= "EntityRayHolder",
	aura_holder_attach_bone	= "rocket_1",
	aura_holder_offset		= Vec3( 0, 0, -17 ),

	aura_range				= 850,
	aura_extra_radius		= 60,

	aura_param				= 350,
	duration 				= 5,
	period					= 0.5,
	isBuff					= false,
	hud_visible				= false,
	
	fixed_cylinder_target	= true,
	aura_target_offset		= Vec3( 0, 0, -50 ),

	work_beam_fx			= "particles/weapons/laser/entity_ray_1",
	--ray_shot_sound	 		= "sound/destroyer/TRay_beam",--"sound/aura/PirateBossRay_pre",
	
	holder_spell_in_the_end	= "Spell_EntityRay",
	holder_spell_on_cancel	= "Spell_EntityRay_Blast",
}


Spell.Spell_EntityRay =
{
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area           = ai.SpellTargetArea.IN_CYLINDER,
		relationship   = ai.SpellTargetRelationship.ENEMY,
	},

	aura_holder_def			= "EntityRayHolderInvul",
	aura_holder_attach_bone	= "rocket_1",
	aura_holder_offset		= Vec3( 0, 0, -17 ),

	aura_range			= 850,
	aura_extra_radius	= 60,
	
	fixed_cylinder_target	= true,
	aura_target_offset		= Vec3( 0, 0, -50 ),
	
	aura_param			= 5000,
	aura_param_add		= 5000,
	duration 			= 2,
	period				= 0.4,
	isBuff				= false,
	hud_visible			= false,
	
	nebula 				= "Effects_Nebula_TachRay",
	work_beam_fx		= "particles/weapons/laser/entity_ray_2",
	cast_sound			= "sound/aura/PirateBossRay_ray",
	ray_shot_sound	 	= "sound/aura/PirateBossRay_ray",
}

Spell.Spell_EntityRay_Blast =
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target		=
					{
						class			= ai.SpellTargetClass.SHIP,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ALLY,
					},
	aura_range 		= 25,
	aura_param		= 75000, --10000
	duration		= 1,
	period			= 0.5,
	isBuff			= false,
	hud_visible		= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_DevastatorGun", }, },
	aura_fx 		= "particles/gadget/damage_green_sphere",
	cast_position_fx = "particles/weapons/alien/alien_missile_explosion",
	period_module_fx = "particles/gadget/damage_alien",
	period_module_my_fx = "particles/gadget/damage_alien",
	period_module_fx_number_by_stacks = { 2 },
	cast_sound		= "sound/explosion/cb_self_expl",
}

Spell.Spell_WebPropulsion =
{
	aura			= ai.Aura.SLOW_MOVEMENT,
	target			= ai.SpellTarget.LOCKED_TARGET,
	target_range	= 200,
	aura_param		= 0.7,
	duration		= 8,
	maintain_aura	= true,
	
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WebPropulsion", },
	},
	
	additional_auras = 
	{
		{
			aura			= ai.Aura.DISABLE_WARP,
			duration		= 8,
			maintain_aura	= true,

			isBuff			= false,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_WebPropulsion", },
			},
		},
	},
}

Spell.Spell_Police_Lvl3 =
{
	influence 		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target	=
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		= ai.SpellTargetVitality.ALIVE,
					},
	aura_range		= 350,
	aura 			= ai.Aura.DISABLE_WARP,

	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FocusedRay", },
	},
	aura_target_directed_fx		= "particles/gadget/lightnings_debuff",
	
	additional_auras =
	{
		{
			aura_target	=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
			aura_range		= 350,
			aura			= ai.Aura.SLOW_MOVEMENT,
			aura_param 		= 0.3,
			isBuff			= false,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_FocusedRay", },
			},
		},
		{
			aura_target	=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
			aura_range		= 350,
			aura			= ai.Aura.SPY_DRONE,
			ignore_subtype_if_other_team = true,
			isBuff			= false,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_FocusedRay", },
			},
		},
	},
}

Spell.Spell_Police_Lvl4 =
{
	influence 		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target	=
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		= ai.SpellTargetVitality.ALIVE,
					},
	aura_range		= 500,
	aura 			= ai.Aura.DISABLE_WARP,

	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FocusedRay", },
	},
	aura_target_directed_fx		= "particles/gadget/lightnings_debuff",
	
	additional_auras =
	{
		{
			aura_target	=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
			aura_range		= 500,
			aura			= ai.Aura.SLOW_MOVEMENT,
			aura_param 		= 0.5,
			isBuff			= false,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_FocusedRay", },
			},
		},
		{
			aura_target	=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
			aura_range		= 500,
			aura			= ai.Aura.SPY_DRONE,
			ignore_subtype_if_other_team = true,
			isBuff			= false,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_FocusedRay", },
			},
		},
	},
}

Spell.Spell_Police_Lvl5 =
{
	influence 		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target	=
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		= ai.SpellTargetVitality.ALIVE,
					},
	aura_range		= 800,
	aura 			= ai.Aura.DISABLE_WARP,

	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FocusedRay", },
	},
	aura_target_directed_fx		= "particles/gadget/lightnings_debuff",
	
	additional_auras =
	{
		{
			aura_target	=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
			aura_range		= 800,
			aura			= ai.Aura.SLOW_MOVEMENT,
			aura_param 		= 0.7,
			isBuff			= false,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_FocusedRay", },
			},
		},
		{
			aura_target	=
			{
				area 			= ai.SpellTargetArea.AROUND,
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
			aura_range		= 800,
			aura			= ai.Aura.SPY_DRONE,
			ignore_subtype_if_other_team = true,
			isBuff			= false,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_FocusedRay", },
			},
		},
	},
}

-- для иконки времени работы
Spell.FrontEnergyShield =
{
	aura_target 				=
	{
		target							= ai.SpellTargetGeneral.PARENT,
		class 							= ai.SpellTargetClass.SHIP,
	},
	aura				= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell		= "Spell_Null",
	duration			= 10,
	period				= 100,
	isBuff				= true,
	gameplay_specific	= true,
	ui_ico 				=
	{
		target_system 	= { tex = "ItemSubtype_FrontEnergyShield", },
	},
}

Spell.Spell_MovementChargesDestr =
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.FAST_MOVEMENT,
	aura_param			= 0.30,
	isBuff 				= true,
	gameplay_specific	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MovementChargesDestr", },
	},
	
	additional_auras =
	{
		{
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.FAST_MANEUVER,
			aura_param 			= 0.3,
			isBuff				= true,
			gameplay_specific	= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_MovementChargesDestr", },
			},
		},
	},
}

Spell.RepairDrones_st =
{
	aura_param			= 100000/2,
	duration			= 1,
	period				= 1,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_target			= ai.SpellTarget.HOLDER,
	isBuff				= true,
	gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesLarge", },
	},
	
	additional_auras =
	{
		{
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.HEAL_SHIELD_PERIODIC,
			aura_param 			= 100000/2,
			duration			= 1,
			period				= 1,
			isBuff				= true,
			gameplay_specific	= true,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_ShieldChargeLarge", },
			},
		},
	},
}

Spell.HullDevastator_st =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'HullDevastator_Ships_st', 'HullDevastator_Overseer_st' }
}

Spell.HullDevastator_Ships_st =
{
	aura_param			= 0.5,
	duration			= 0.1,
	period				= 0.2,
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
		signature				= ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM + ai.SignatureMask.LARGE,
	},
	aura				= ai.Aura.HULL_BURN_PERIODIC,
	isBuff				= false,
	gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GravityAnomaly", },
	},
}

Spell.HullDevastator_Overseer_st =
{
	aura_param			= 0.20,
	duration			= 0.1,
	period				= 0.2,
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
		signature				= ai.SignatureMask.HUGE,
	},
	aura				= ai.Aura.HULL_BURN_PERIODIC,
	isBuff				= false,
	gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GravityAnomaly", },
	},
}

Spell.ShieldDevastator_st =
{
	aura_param			= 0.5,
	duration			= 0.1,
	period				= 0.2,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.SHIELD_BURN_PERIODIC,
	aura_target			= ai.SpellTarget.HOLDER,
	isBuff				= false,
	gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GravityAnomaly", },
	},
}

Spell.NoRestoreEnergy_st =
{
	duration			= 10,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.DISABLE_ENERGY_REGEN,
	aura_target			= ai.SpellTarget.HOLDER,
	isBuff				= false,
	gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReflector", },
	},
}

Spell.NoCooldown_st =
{
	influence			= ai.Spell.SET_COOLDOWN,
	influence_param		= -1000,
	target				= ai.SpellTarget.CASTER,
	isBuff				= true,
	gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnlargeActiveCooldown", },
	},
}

Spell.NoCooldown_st =
{
	influence			= ai.Spell.SET_COOLDOWN,
	influence_param		= -1000,
	target				= ai.SpellTarget.CASTER,
	isBuff				= true,
	gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnlargeActiveCooldown", },
	},
}

Spell.MaxSpeed_brake_st =
{
	duration			= 0.2,
	aura_param_add		= 1000,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.SLOW_MOVEMENT,
	aura_target			= ai.SpellTarget.HOLDER,
	isBuff				= false,
	gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpeedInsteadShield", },
	},
}

Spell.Spell_SpaceMissile_Ion =
{
	target						= ai.SpellTarget.ENEMY_AROUND,
	target_range				= 15,
	aura						= ai.Aura.SILENCE,
	diminish_control_aura		= true,
	apply_crowd_control_coef	= true,
	duration					= 4,
	isBuff						= false,
	min_targets_count			= 1, -- SC-89106 СТ. Спецмодуль Mjolnir Форсирование систем кораблей Варденов не сбрасывает эффект от спецмодуля РЭБа
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpaceMissile_Ion", },
	},

}

Spell.Spell_BulletTime =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_BulletTime_SlowMo', 'Spell_BulletTime_Mods' }
}

Spell.Spell_BulletTime_SlowMo =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.FIRE_RATE_MOD,
	target =
	{
		target					= ai.SpellTargetGeneral.CASTER,
	},
	aura_target =
	{
		class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area 					= ai.SpellTargetArea.AROUND,
	},
	
	aura_range					= 300,
	aura_param					= -2,
	duration					= 5,
	
	isBuff						= true,
	hud_visible 				= false,
	
	cast_fx						= "particles/gadget/aura_wave",
	aura_target_fx				= "particles/gadget/slow_movement",
	aura_start_sound			= "sound/gadgets/stealth_on",
	aura_end_sound 				= "sound/gadgets/stealth_off",
	
	additional_auras = 
	{
		{
			aura						= ai.Aura.SLOW_MOVEMENT,
			aura_target =
			{
				class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
				area 					= ai.SpellTargetArea.AROUND,
			},
			aura_range					= 300,
			aura_param 					= 3,
			duration					= 5,
			isBuff						= true,
			hud_visible 				= false,
		},
		{
			aura						= ai.Aura.SLOW_MANEUVER,
			aura_target =
			{
				class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
				area 					= ai.SpellTargetArea.AROUND,
			},
			aura_range					= 300,
			aura_param 					= 3,
			duration					= 5,
			isBuff						= true,
			hud_visible 				= false,
		},
		{
			aura						= ai.Aura.REDUCE_ROT_SPEED,
			aura_target =
			{
				class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
				area 					= ai.SpellTargetArea.AROUND,
			},
			aura_range					= 300,
			aura_param 					= 3,
			duration					= 5,
			isBuff						= true,
			hud_visible 				= false,
		},
	},
}

Spell.Spell_BulletTime_Mods =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.HEALING_MOD,
	target =
	{
		target					= ai.SpellTargetGeneral.CASTER,
	},
	aura_target =
	{
		class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area 					= ai.SpellTargetArea.AROUND,
	},
	
	aura_range					= 300,
	aura_param					= -3,
	duration					= 5,
	
	isBuff						= true,
	hud_visible 				= false,
	
	additional_auras = 
	{
		{
			aura						= ai.Aura.SHIELD_REGEN_MOD,
			aura_target =
			{
				class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
				area 					= ai.SpellTargetArea.AROUND,
			},
			aura_range					= 300,
			aura_param 					= -3,
			duration					= 5,
			isBuff						= true,
			hud_visible 				= false,
		},
		{
			aura						= ai.Aura.COOLDOWN_MOD,
			aura_target =
			{
				class          			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
				area 					= ai.SpellTargetArea.AROUND,
			},
			aura_range					= 300,
			aura_param 					= 3,
			duration					= 5,
			isBuff						= true,
			hud_visible 				= false,
		},
	},
}

Spell.Spell_CookSpeedUp =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.FAST_MOVEMENT,
	
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= designers.GenerateMul( 3.7 ),
	duration					= 10,
	
	dispell_flag				= ai.Dispell.ON_MODULE + ai.Dispell.ON_ROCKET,
	
	isBuff						= true,
	hud_visible 				= true,
	
	aura_fx						= "particles/gadget/slow_movement",
	--aura_start_sound			= "sound/gadgets/stealth_on",
	--aura_sound					= "",
	--aura_end_sound 				= "sound/gadgets/stealth_off",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CookSpeedUp", },
	},
	
	additional_auras = 
	{
		{
			aura						= ai.Aura.FAST_MANEUVER,
			aura_target					= ai.SpellTarget.HOLDER,

			aura_param 					= designers.GenerateMul( 3.7 ),
			duration					= 10,
			
			dispell_flag				= ai.Dispell.ON_MODULE + ai.Dispell.ON_ROCKET,
			
			isBuff						= true,
			hud_visible 				= true,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_CookSpeedUp", },
			},
		},
		{
			aura						= ai.Aura.UNTOUCHABLE,
			aura_target					= ai.SpellTarget.HOLDER,

			duration					= 10,
			
			dispell_flag				= ai.Dispell.ON_MODULE + ai.Dispell.ON_ROCKET,
			
			isBuff						= true,
			hud_visible 				= true,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_CookSpeedUp", },
			},
		},
	},
}

Spell.Spell_SphereShield =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.FAST_MOVEMENT,
	
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 0.25,
	duration					= 20,
	
	dispell_flag				= ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_DAMAGE,
	
	isBuff						= true,
	hud_visible 				= true,
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_SphereShield", },
	},
}

Spell.Spell_SphereShield_Resist =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.RESIST_ALL,
	
	target						= ai.SpellTarget.CASTER,
	aura_target	=
	{
		class					= ai.SpellTargetClass.SHIP,
		relationship			= ai.SpellTargetRelationship.ALLY,
		area 					= ai.SpellTargetArea.AROUND,
	},
	
	aura_range					= 35,
	
	aura_param					= 50,
	duration					= 20,
	
	isBuff						= true,
	hud_visible 				= true,
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_SphereShield", },
	},
}

Spell.Spell_PlatformModule_Bonus_Lvl1 = 
{
	aura						= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param 					= 450.0,
	duration					= 15,
	period						= 1,
	isBuff						= true,
	cast_fx						= "particles/gadget/aura_wave",
	aura_fx						= "particles/gadget/hull_heal",
	ui_ico =
	{
		target_system			= { tex = "Station_ico_BonusSpawner", },
	},
}

Spell.Spell_PlatformModule_Bonus_Lvl2 = 
{
	inherit						= "Spell_PlatformModule_Bonus_Lvl1",
	aura_param 					= 700.0,
}

Spell.Spell_PlatformModule_Bonus_Lvl3 = 
{
	inherit						= "Spell_PlatformModule_Bonus_Lvl2",
	aura_param 					= 1400.0,
}

Spell.Spell_PlatformModule_Bonus_Drone = 
{
	aura						= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param 					= 9600,
	duration					= 0.5,
	period						= 1,
	isBuff						= true,
	aura_fx						= "particles/gadget/hull_heal",
	
	ui_ico =
	{
		target_system			= { tex = "Station_ico_BonusDroneSpawner", },
	},
}

Spell.Nanobots_Heal_Bonus = 
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.ALLY_SHIPS_AROUND,
	
	aura_range					= 25,
	
	aura_param					= 500,
	duration					= 3,
	period						= 1,
	
	isBuff						= true,
	hud_visible 				= true,
	
	cast_fx						= "particles/gadget/aura_wave",
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_RepairDronesSmall", },
	},
	additional_auras =
	{
		{
		influence					= ai.Spell.APPLY_AURA,
		aura 						= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	
		target						= ai.SpellTarget.CASTER,
		ura_target					= ai.SpellTarget.ALLY_SHIPS_AROUND,
	
		aura_range					= 25,
	
		aura_param					= 500,
		duration					= 3,
		period						= 1,
	
		isBuff						= true,
		hud_visible 				= true,
	
		cast_fx						= "particles/gadget/aura_wave",
	
		ui_ico =
			{
			target_system			= { tex = "ItemSubtype_RepairDronesSmall", },
			},
		},
	},
} 

Spell.Spell_Engineer_PhaseBuff0 =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.WEAPON_HIT_TRANSMIT_SPELL,
	aura_target							= ai.SpellTarget.HOLDER,
	
	target_spell						= "Spell_Engineer_PhaseBuff0_Heal",
	
	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "Module_Engineer_PhaseBuff_Phase0", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.DAMAGE_DEC,
			aura_target					= ai.SpellTarget.HOLDER,

			aura_param					= 1,

			isBuff						= false,
			
			ignore_additional_power		= true,
			gameplay_specific			= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_Engineer_PhaseBuff_Phase0", },
			},
		},
	},
	
	gun_spell_fx	   					= "particles/gadget/weapon_instability",
}

Spell.Spell_Engineer_PhaseBuff0_Heal =
{
	influence							= ai.Spell.APPLY_AURA,
	target =
	{
		target 							= ai.SpellTargetGeneral.CONTEXT_POSITION,
		misc							= ai.SpellTargetMisc.POSITION,
	},
	aura 								= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_target = 
	{
		class							= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area							= ai.SpellTargetArea.AROUND,
		relationship					= ai.SpellTargetRelationship.ALLY,
		misc							= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	
	aura_range 							= 25,
	
	aura_param							= 750,
	duration							= 1,
	period								= 1,
	
	isBuff								= true,

	ui_ico =
	{
		target_system 					= { tex = "Module_Engineer_PhaseBuff_Phase0", },
	},
	
	aura_target_fx						= "particles/gadget/hull_heal",
}

Spell.Spell_Engineer_PhaseBuff1 =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.RESIST_ALL,
	aura_target							= ai.SpellTarget.HOLDER,

	aura_param							= 50,
	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "Module_Engineer_PhaseBuff_Phase1", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.SHIELD_RESIST_ALL,
			aura_target					= ai.SpellTarget.HOLDER,

			target_spell				= "Spell_Engineer_PhaseBuff1_Ping",
			
			mod_target = --Module_Engineer_PhaseBuff
			{
				class							= ai.SpellTargetClass.SHIP,
				area							= ai.SpellTargetArea.AROUND,
				relationship					= ai.SpellTargetRelationship.ENEMY,
			},
			
			mod_range							= 200,
			mod_max								= 3,

			aura_param							= 10,
			mod_update_period					= 0.5,
			
			isBuff								= true,
			
			ignore_stacks						= true,
			
			disable_zero_stage					= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_Engineer_PhaseBuff_Phase1", },
			},
		},
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.MODULE_RANGE_MOD,
			aura_target					= ai.SpellTarget.HOLDER,
			
			aura_param					= -0.5,

			isBuff						= false,
			
			ignore_additional_power		= true,
			gameplay_specific			= true,
			
			--hud_visible 				= false,
			
			ui_ico =
			{
				target_system			= { tex = "Module_Engineer_PhaseBuff_Phase1", },
			},
		},
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.DAMAGE_MOD,
			aura_target					= ai.SpellTarget.HOLDER,
			mod_target = --Module_Engineer_PhaseBuff
			{
				class					= ai.SpellTargetClass.SHIP,
				area					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ENEMY,
			},
			
			mod_range					= 200,
			mod_max						= 3,
			
			aura_param					= 0.1,
			mod_update_period			= 0.5,
			
			--duration					= 0.5,

			isBuff						= true,
			
			ignore_stacks				= true,
			--disable_aura_duration		= true,
			--disable_zero_stage			= true,
			--hud_visible 				= false,
			
			disable_zero_stage					= true,
			
			ui_ico =
			{
				target_system			= { tex = "Module_Engineer_PhaseBuff_Phase1", },
			},
		},
	},
	
	aura_fx								= "particles/gadget/shield_fortify",
}

Spell.Spell_Engineer_PhaseBuff2 =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.FAST_MOVEMENT,
	aura_target							= ai.SpellTarget.HOLDER,
	
	aura_param							= 0.3,
	
	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "Module_Engineer_PhaseBuff_Phase2", },
	},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.RESIST_ALL_DEC,
			aura_target					= ai.SpellTarget.HOLDER,
			
			aura_param					= 20,

			isBuff						= false,
			
			ignore_additional_power		= true,
			gameplay_specific			= true,
			
			--hud_visible 				= false,
			
			ui_ico =
			{
				target_system			= { tex = "Module_Engineer_PhaseBuff_Phase2", },
			},
		},
	},
}

Spell.Spell_ShieldEnergyHeal =
{
	influence							= ai.Spell.CAST_SPELLS,
	spells								= { 'Spell_ShieldHeal_Shield', 'Spell_ShieldHeal_Energy', 'Spell_ShieldHeal_EnergyBurn' },
}

Spell.Spell_ShieldHeal_Shield = 
{
	influence							= ai.Spell.HEAL_SHIELD_SCALED,
	target =
	{
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ALLY,
		target 							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		misc							= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	
	influence_param						= 1000,
	
	isBuff								= true,
	
	influence_fx 						= "particles/gadget/shield_boost",
}

Spell.Spell_ShieldHeal_Energy = 
{
	influence							= ai.Spell.ADD_ENERGY,
	target =
	{
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ALLY,
		target 							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		misc							= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	
	influence_param						= 350,
	
	isBuff								= true,
}

Spell.Spell_ShieldHeal_EnergyBurn = 
{
	influence							= ai.Spell.APPLY_AURA,
	aura             					= ai.Aura.BURN_ENERGY_PERIODIC,
	target =
	{
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ALLY,
		target 							= ai.SpellTargetGeneral.CONTEXT_TARGET,
		misc							= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	aura_target =
	{
		class							= ai.SpellTargetClass.SHIP,
		target 							= ai.SpellTargetGeneral.CASTER,
	},
	
	aura_param							= 400*0.5,
	duration							= 1,
	period								= 0.5,
	
	isBuff								= false,
	gameplay_specific					= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_ShieldHeal", },
	},
}

Spell.Spell_AdvancedHeal = 
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.HEALING_MOD,
	aura_target							= ai.SpellTarget.ALLY_AROUND_EXCLUDE_CASTER,
	
	aura_range							= 100,
	
	aura_param							= 0.3,
	
	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_AdvancedHeal", },
	},
}

Spell.Spell_DistStation = 
{
	influence							= ai.Spell.APPLY_AURA,
	target =
	{ 
		target							= ai.SpellTargetGeneral.INFLICTOR,
		misc							= ai.SpellTargetMisc.POSITION
	},
	aura 								= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_target							= ai.SpellTarget.ALLY_SHIPS_AROUND,
	
	aura_range							= 175,
	
	aura_param							= 250,
	duration							= 30,
	period								= 1,
	
	isBuff								= true,
	
	aura_holder_def						= "DistStation",
	min_targets_count					= 0,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_DistStation", },
	},
	
	aura_target_fx						= "particles/gadget/hull_heal",
	period_beam_root_fx					= "particles/gadget/pulsars/drone_hull_ray_periodic",
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
			aura_target					= ai.SpellTarget.ALLY_SHIPS_AROUND,
			
			aura_range					= 175,
			
			aura_param					= 250,
			duration					= 30,
			period						= 1,

			isBuff						= true,
			
			min_targets_count			= 0,
			
			ui_ico =
			{
				target_system			= { tex = "ItemSubtype_DistStation", },
			},
			
			aura_target_fx				= "particles/gadget/shield_heal",
			period_beam_root_fx			= "particles/gadget/pulsars/drone_shield_ray_periodic",
		},
	},
}

Spell.Raid_dynamic_AllBodyResist =  -- скалирование мобов в рейдах
{
	isBuff						= true,
	gameplay_specific			= true,
	aura						= ai.Aura.HEALTH_MOD,
	aura_param					= 0.25,
	target 						= ai.SpellTarget.CASTER,
	gameplay_coef_group_id		= 0,
	ui_ico 						= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras =
	{
		{
			isBuff						= true,
			gameplay_specific			= true,
			aura						= ai.Aura.INHERITED_HEALTH_MOD,
			aura_param					= 0.25,
			gameplay_coef_group_id		= 0,
			ui_ico 						= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
		{
			isBuff						= true,
			gameplay_specific			= true,
			aura						= ai.Aura.SHIELD_MOD,
			aura_param					= 0.25,
			gameplay_coef_group_id		= 0,
			ui_ico 						= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
	},
}
Spell.Raid_dynamic_AllDamageMod =
{
	isBuff						= true,
	gameplay_specific			= true,
	aura						= ai.Aura.MODULE_DAMAGE_MOD,
	aura_param					= 0.05,
	target 						= ai.SpellTarget.CASTER,
	gameplay_coef_group_id		= 0,
	ui_ico 						= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras =
	{
		{
			isBuff						= true,
			gameplay_specific			= true,
			aura						= ai.Aura.DAMAGE_MOD,
			aura_param					= 0.05,
			gameplay_coef_group_id		= 0,
			ui_ico 						= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
	},
}

Spell.AvengersPlasmaWeb =
{
	influence							= ai.Spell.APPLY_AURA,
	target =
	{
		target							= ai.SpellTargetGeneral.LOCKED_TARGET,
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	aura 								= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target							= ai.SpellTarget.HOLDER,
	
	target_range						= 120,
	
	aura_param							= 150,
	duration							= 12,
	period								= 1,
	
	scale_on_weapon						= true,

	ignore_subtype						= true,

	isBuff								= false,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_PlasmaWeb", },
	},

	aura_apply_fx						= "particles/gadget/aura_breacktrough",
	period_module_fx					= "particles/gadget/plasma_web_module",
	period_module_my_fx					= "particles/gadget/plasma_web_module",
}

Spell.AvengersPlasmaWeb_MoveRestrictor =
{
	influence							= ai.Spell.APPLY_AURA,
	target =
	{
		target							= ai.SpellTargetGeneral.LOCKED_TARGET,
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	aura 								= ai.Aura.STASIS,
	aura_target							= ai.SpellTarget.HOLDER,
	
	target_range						= 120,
	
	duration							= 1.8,

	ignore_subtype						= true,
	
	diminish_aura_param					= true,
	diminish_control_aura				= true,

	isBuff								= false,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_PlasmaWeb", },
	},
	
	use_dead_rcs_effects				= true,
	use_dead_engine_effects				= true,
	aura_sound 							= "sound/gadgets/MovementRestrictor/alarm",
}

Spell.AvengersTimeBoost =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.OVERCHARGE,
	aura_target							= ai.SpellTarget.HOLDER,
	
	aura_param							= 0.65,
	duration							= 8,

	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_TimeBoost", },
	},

	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			aura						= ai.Aura.RESIST_ALL_DEC,
			aura_target					= ai.SpellTarget.HOLDER,
			
			aura_param					= 30,
			duration					= 8,

			gameplay_specific			= true,
			ignore_additional_power		= true,

			isBuff						= false,
			
			ui_ico =
			{
				target_system			= { tex = "ItemSubtype_TimeBoost", },
			},
		},
	},

	aura_apply_fx						= "particles/gadget/aura_breacktrough",
	aura_end_sound						= "sound/gadgets/timeboost_end",
	aura_fx								= "particles/gadget/overdrive",
}

Spell.AvengersGuidedMissile =
{
	influence							= ai.Spell.APPLY_AURA,
	target =
	{
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		area							= ai.SpellTargetArea.AROUND,
	},
	aura 								= ai.Aura.HULL_RESIST_ALL_DEC,
	aura_target							= ai.SpellTarget.HOLDER,

	target_range						= 30,
	min_targets_count  					= 1,
	aura_param							= 20,
	duration							= 15,

	isBuff								= false,
	
	additional_auras =
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
			aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			aura_target 	= 		{
				class          	= ai.SpellTargetClass.SHIP,
				area           	= ai.SpellTargetArea.AROUND,
				signature		= ai.SignatureMask.HUGE,
				damageability 	= ai.SpellTargetDamageability.DAMAGEABLE,
			},
			aura_range		= 27,

			aura_param		= 10000,
			duration 		= 0.5,
			period			= 1,
			isBuff			= false,
			hud_visible		= false,
		},
	},
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_GuidedMissile", },
	},

	aura_apply_fx						= "particles/gadget/aura_breacktrough",
	aura_target_fx						= "particles/gadget/resist_hull_dec",
}

Spell.Spell_LandingDisintegrator =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.HULL_RESIST_ALL,
	aura_target							= ai.SpellTarget.HOLDER,
	
	aura_param							= 80,

	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_LandingDisintegrator", },
	},

	spell_on_cancel						= "Spell_LandingDisInvul",
}

Spell.Spell_VigilantHullResist =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.HULL_RESIST_ALL,
	aura_target							= ai.SpellTarget.HOLDER,
	
	aura_param							= 20,

	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_DestrSpellOnChannel", },
	},
	
	additional_auras = 
	{
		{
			influence							= ai.Spell.APPLY_AURA,
			target								= ai.SpellTarget.CASTER,
			aura 								= ai.Aura.HEAL_HULL_PERIODIC,
			aura_target							= ai.SpellTarget.HOLDER,
	
			aura_param							= 450,
			period								= 1,

			isBuff								= true,
	
			ui_ico =
			{
				target_system					= { tex = "ItemSubtype_DestrSpellOnChannel", },
			},
	
		
		},
	},

}

Spell.Spell_TyrantShieldResist =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.SHIELD_RESIST_ALL,
	aura_target							= ai.SpellTarget.HOLDER,
	
	aura_param							= 20,

	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_ShieldChargesDestr", },
	},

}

Spell.Spell_LandingDisInvul = 
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.INVULNERABILITY,
	aura_target							= ai.SpellTarget.HOLDER,
	
	duration							= 1.5,

	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_LandingDisintegrator", },
	},
}

Spell.Spell_LandingDisShot =
{
	influence 							= ai.Spell.CAST_SPELLS,
	spells								= { 'Spell_LandingDisShot_L', 'Spell_LandingDisShot_H' },
}

Spell.Spell_LandingDisShot_L =
{
	influence							= ai.Spell.APPLY_AURA,
	target =
	{
		target 							= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		signature						= ai.SignatureMask.LARGE,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	aura 								= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target							= ai.SpellTarget.HOLDER,
	
	aura_param							= 750,
	
	duration							= 0.3,
	period 								= 0.2,

	isBuff								= false,
	
	scale_on_weapon						= true,
	
	ignore_stacks						= true,
	ignore_subtype						= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_LandingDisintegrator", },
	},
}

Spell.Spell_LandingDisShot_H =
{
	influence							= ai.Spell.APPLY_AURA,
	target =
	{
		target 							= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		signature						= ai.SignatureMask.HUGE,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	aura 								= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target							= ai.SpellTarget.HOLDER,
	
	aura_param							= 7500*1.5,
	
	duration							= 0.3,
	period 								= 0.2,

	isBuff								= false,
	
	scale_on_weapon						= true,
	
	ignore_stacks						= true,
	ignore_subtype						= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_LandingDisintegrator", },
	},
}

Spell.Spell_FreezingSniper = 
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.SNIPER_PROJECTILE_SPELL,
	aura_target							= ai.SpellTarget.HOLDER,

	duration							= 25,
	one_shot							= true,
	is_powerful_sniper_aura				= true,

	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_FreezingSniper", },
	},

	target_spell						= "Spell_FreezingSniper_Shot",
}

Spell.Spell_FreezingSniper_Shot =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SLOW_MOVEMENT,
	target =
	{
		target 					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 					= ai.SpellTargetClass.SHIP,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 1,
	duration					= 6,
	
	isBuff						= false,
	hud_visible 				= true,
	
	aura_fx						= "particles/gadget/slow_movement",
	--aura_start_sound			= "sound/gadgets/stealth_on",
	--aura_sound					= "",
	--aura_end_sound 				= "sound/gadgets/stealth_off",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FreezingSniper", },
	},
	
	additional_auras = 
	{
		{
			aura						= ai.Aura.SLOW_MANEUVER,
			aura_target					= ai.SpellTarget.HOLDER,

			aura_param 					= 1,
			duration					= 10,
			
			isBuff						= false,
			hud_visible 				= true,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_FreezingSniper", },
			},
		},
	},
}

Spell.Spell_Laser_Heavy_Pirate =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.BURN_ENERGY_PERIODIC,
	target =
	{
		target 					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 					= ai.SpellTargetClass.SHIP,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 24,
	duration					= 1,
	period						= 0.5,
	
	max_stacks					= 5,
	
	isBuff						= false,
	hud_visible 				= true,
	
	aura_target_fx				= "particles/gadget/burn_energy",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LaserHeavyPirate", },
	},
}

Spell.Spell_Railgun_Heavy_Pirate =
{
	influence					= ai.Spell.IMPULSE,
	target =
	{
		target 					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 					= ai.SpellTargetClass.SHIP,
		relationship			= ai.SpellTargetRelationship.ENEMY,
	},
	
	influence_param				= 25,
	influence_fx				= "particles/weapons/other/grab_explosion",
	isBuff						= false,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RailgunHeavyPirate", },
	},
}

Spell.Spell_ActiveTimeBoost =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.OVERCHARGE,
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 0.4,
	duration					= 8,
	
	isBuff						= true,
	hud_visible 				= true,
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_ActiveTimeBoost", },
	},
	
	aura_fx						= "particles/gadget/overdrive",
	aura_end_sound				= "sound/gadgets/timeboost_end",
}

Spell.Spell_AnomalyRocket =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SHIP_ATTRACTION,
	target =
	{
		target					= ai.SpellTargetGeneral.INFLICTOR,
		misc					= ai.SpellTargetMisc.POSITION,
	},
	aura_target =
	{
		class 					= ai.SpellTargetClass.SHIP,
		relationship 			= ai.SpellTargetRelationship.ENEMY,
		area					= ai.SpellTargetArea.AROUND,
	},
	
	aura_param					= -70,
	aura_range					= 250,
	duration					= 1.3,
	
	isBuff						= false,
	hud_visible 				= false,
	
	min_targets_count			= 0,
	
	aura_fx						= "particles/gadget/gravy_anomaly_drone",
	aura_target_directed_fx		= "particles/gadget/push_ray_hit",
	--nebula						= "Effects_Nebula_Pushray",
	--aura_sound					= "sound/gadgets2/DestrAnomalyBot",
}

Spell.Spell_CageTrapMine =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SHIP_ATTRACTION,
	target =
	{
		target         			= ai.SpellTargetGeneral.CASTER,
		ai             			= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       			= ai.SpellTargetVitality.ALIVE,
		misc           			= ai.SpellTargetMisc.POSITION,
	},
	aura_target = 
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 					= ai.SpellTargetClass.SHIP,
		relationship			= ai.SpellTargetRelationship.ENEMY,
		area					= ai.SpellTargetArea.OUTSIDE,
	},
	
	aura_param					= 75,
	aura_range					= 50,
	duration					= 9,
	
	isBuff						= false,
	hud_visible 				= false,
	
	min_targets_count			= 0,
	
	aura_holder_def				= "Missile_CageTrapMine_Holder",
	
	additional_auras = 
	{
		{
			aura						= ai.Aura.DISABLE_WARP,
			aura_target = 
			{
				target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
				class 					= ai.SpellTargetClass.SHIP,
				relationship			= ai.SpellTargetRelationship.ENEMY
			},

			duration					= 9,
			
			isBuff						= false,
			hud_visible 				= false,
			
			work_beam_target_root_fx	= "particles/gadget/cagetrap_beam",
		},
	},
	
	aura_fx						= "particles/gadget/cagetrap_emmiter",
}


Spell.Spell_BackShield_Speed = --увеличивает скорость при активации щита BackShield
{
	--influence					= ai.Spell.APPLY_AURA,
	aura						= ai.Aura.FAST_MOVEMENT,
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	gameplay_specific 			= true,
	dispell_flag				= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	
	aura_param					= 0.2,
	duration					= 15, --при изменении поменять в Def.BackShield и Spell_BackShield
	--period						= 1,
	--aura_param_add				= -0.013,
	
	isBuff						= true,
	hud_visible 				= true,
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_BackShieldModule", },
	},
}

Spell.Spell_BackShield_Resist_Passive =
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 			= 65.0,
	gameplay_specific	= true,
	isBuff				= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BackShieldModule", },
	},
}

Spell.Spell_BackShield = --уменьшает сопративления щита BackShield
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SHIELD_RESIST_ALL_DEC,
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	gameplay_specific 			= true,
	
	aura_param					= 35,
	duration					= 15, --при изменении поменять в Def.BackShield и Spell_BackShield_Speed
	
	isBuff						= false,
	hud_visible 				= true,
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_BackShieldModule", },
	},
	additional_auras =
	{
		Spell.Spell_BackShield_Speed,
	},
}
--
Spell.Spell_TimeBoostPlusDamage = { -- форсирование систем корабля (на 50%, но с другой иконкой)
	duration			= 8,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.OVERCHARGE,
	aura_target			= ai.SpellTarget.HOLDER,
	isBuff				= true,
	aura_param			= 0.5,
	
	ui_ico 				=
		{
			target_system = { tex = "ItemSubtype_TimeBoostPlusDamage", },
		},
	uiName				= "TimeBoostDamageSpell_Base",
	uiDesc				= "TimeBoostDamageSpell_Base_Desc",
		
	aura_fx						= "particles/gadget/overdrive",
	aura_end_sound				= "sound/gadgets/timeboost_end",
}

Spell.Spell_MassPlasmaWeb = --плазменная сеть на все корабли в зоне поражения, но без урона, зависящего от скорости
{
	isBuff			= false,
	target 			=
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		--misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	target_range	= 80,
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target		= ai.SpellTarget.HOLDER,
	aura_param		= 300,
	duration		= 10,
	period 			= 1,
	min_targets_count= 1,

	scale_on_weapon						= true,
	ignore_stacks						= true,
	ignore_subtype						= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaWeb", },
	},
	aura_sound 							= "sound/gadgets/MovementRestrictor/alarm",
	aura_apply_fx						= "particles/gadget/aura_breacktrough",
	period_module_fx					= "particles/gadget/plasma_web_module",
	period_module_my_fx				= "particles/gadget/plasma_web_module",
}

--   посадочная платформа для кораблей 
Spell.LandingPlatform_Buff2Landed =   -- спелл на гостя "союзный корабль"
{
	isBuff 			= true,
	influence		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.ANTI_RADAR,
	aura_target 	= 
	{ 
		target 		 = ai.SpellTargetGeneral.LANDED_ON_HOLDER,
		--class			= ai.SpellTargetClass.SHIP,
	},
	--dispell_flag	= ai.Dispell.ON_FIRE,-- + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	min_targets_count = 0,
	--hud_visible		= false,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_LandingMultiPlatformModule" } },
	
	additional_auras = 
	{
		{  -- прозрачность для пуль, лазеров и взрывов (пули пролетают насквозь, лазеры светят насквозь, взрывы не наносят урон). Действие ауры распространяется на дочерние объекты (например, специальные щиты). 
			aura 			= ai.Aura.UNTOUCHABLE,  
			aura_target 	= 
			{ 
				target 		 = ai.SpellTargetGeneral.LANDED_ON_HOLDER,
				--class			= ai.SpellTargetClass.SHIP,
				signature		= ai.SignatureMask.MEDIUM + ai.SignatureMask.SMALL + ai.SignatureMask.TINY,
			},
			gameplay_specific = true,
			isBuff			= true,
			ui_ico 			= { target_system = { tex = "ItemSubtype_LandingMultiPlatformModule", }, },
		},
		{ -- неуязвимость
			aura			= ai.Aura.INVULNERABILITY,
			aura_target 	= 
			{ 
				target 		 = ai.SpellTargetGeneral.LANDED_ON_HOLDER,
				--class			= ai.SpellTargetClass.SHIP,
				signature		= ai.SignatureMask.MEDIUM + ai.SignatureMask.SMALL + ai.SignatureMask.TINY,
			},
			isBuff			= true,
			gameplay_specific = true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_LandingMultiPlatformModule", },
			},
		},
	},
}

Spell.LandingPlatform_Buff2Parent4AllyNearby =  -- бафф за союзников в радиусе корабля
{
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	gameplay_specific = true,
	aura  			= ai.Aura.RESIST_ALL,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 50,
	disable_zero_stage = true,

	mod_target		= --Module_LandingMultiPlatformModule
			{
				target 		 = ai.SpellTargetGeneral.LANDED_ON_HOLDER,
				class			= ai.SpellTargetClass.SHIP,
			},
	mod_max 		= 5,
	
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_LandingMultiPlatformModule", },
	},
	
	additional_auras = 
	{
		{ 
			--aura_execution_delay = 0.5,
			aura = ai.Aura.HEAL_HULL_PERCENT_PERIODIC,
			aura_target 	= ai.SpellTarget.HOLDER,
			--duration = 0.5,
			period = 0.5,
			aura_param = 0.005,
			isBuff = true,
			gameplay_specific = true,
			--hud_visible 	= false,
			disable_zero_stage = true,
			mod_target		= --Module_LandingMultiPlatformModule
			{
				target 		 = ai.SpellTargetGeneral.LANDED_ON_HOLDER,
				class			= ai.SpellTargetClass.SHIP,
			},
			mod_max 		= 5,
			
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_LandingMultiPlatformModule", },
			},
		},
	},
}

Spell.LandingPlatform_CastBoostAlly =  -- спелл когда на платформе сидит корабль
{
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,  
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target			= 
	{ 
		target 		 = ai.SpellTargetGeneral.LANDED_ON_HOLDER,
		class			= ai.SpellTargetClass.SHIP,
	},
	--aura_target 	= ai.SpellTarget.HOLDER,
	gameplay_specific = true,
	target_spell	= "LandingPlatform_BoostAlly",
	period			= 1,
	isBuff			= true,
	hud_visible		 = false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_Immortality", }, },
}

Spell.LandingPlatform_BoostAlly =  -- спелл когда на платформе сидит корабль
{
	-- увеличение урона основного орудия
	target = 
	{ 
		target 	= ai.SpellTargetGeneral.CONTEXT_TARGET,
		signature		= ai.SignatureMask.MEDIUM + ai.SignatureMask.SMALL + ai.SignatureMask.TINY,
	},
	aura_target 	= ai.SpellTarget.HOLDER,
	--aura_target 	= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.OVERCHARGE, --ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.01,
	duration		= 35,
	can_stack		= true,
	max_stacks		= 50,
	isBuff 			= true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_LandingMultiPlatformModule", },
	},
}

Spell.Spell_EmperorsRobe =
{
	aura						= ai.Aura.STEALTH,
	target 						= ai.SpellTarget.CASTER,
	duration					= 15,	
	dispell_flag				= ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET,
	isBuff		= true,
	dispell_timeout	= 2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EmperorsRobe", },
	},
	
	aura_param 			= 1.5, -- Параметр из ауры FAST_MOVEMENT, нужен для тултипа
	
	additional_auras = 
	{
		{
			aura 			= ai.Aura.DISABLED_WEAPON,
			influence 		= ai.Spell.APPLY_AURA,
			aura_target 	=
			{
				target 		 = ai.SpellTargetGeneral.LANDED_ON_HOLDER,
				class			= ai.SpellTargetClass.SHIP,
			},
			isBuff 				= false,
			gameplay_specific 	= true,
			disable_aura_duration = true,
			dispell_timeout	= 2,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_EmperorsRobe", },
			},
			aura_end_sound 	= "sound/gadgets/stealth_off",
			aura_start_sound = "sound/gadgets/stealth_on",
		},
		{
			aura				= ai.Aura.FAST_MOVEMENT,
			aura_target			= ai.SpellTarget.CASTER,

			aura_param 			= 1.5, --при изменении поменять и параметр в головной ауре
			dispell_timeout	= 2,
			dispell_flag		= ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET,
			isBuff				= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_EmperorsRobe", },
			},
		},
	},
}

Spell.Spell_EmperorsRobe_Drone =
{
	aura		= ai.Aura.STEALTH,
	target = 
	{ 
		target 	= ai.SpellTargetGeneral.CONTEXT_TARGET, 
	},
	aura_target = 
	{
		target	= ai.SpellTargetGeneral.HOLDER,
	},
	isBuff		= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EmperorsRobe", },
	},
}

Spell.PlagueDoctor =
{
	target				= 
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		misc 			= ai.SpellTargetMisc.NEAREST,
	},
	target_range	= 200, --150
	influence = ai.Spell.CAST_SPELLS,
	spells = {'PlagueDoctor_Damage', },
	--max_beam_length = 150,
	additional_auras = 
	{
		{--заглушка для тултипа.
			target_range	= 200, -- 150
			aura_param		= 450, -- 450
			duration		= 3,
		},
	}
}

Spell.PlagueDoctor_Damage =
{
	target				= 
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		misc 			= ai.SpellTargetMisc.NEAREST,
	},
	target_range	= 200,
	ignore_subtype	= true,
	aura_execution_delay = 0.5,
	aura  			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target 	= ai.SpellTarget.HOLDER,
	duration		= 1.5,
	period			= 1,
	aura_param		= 2000,
	spell_on_cancel = "PlagueDoctor_TermDamage"
}

Spell.PlagueDoctor_Contagination =
{
	target = ai.SpellTarget.ENEMY_AROUND,
	target_range	= 200,
	aura_target 	= ai.SpellTargetGeneral.HOLDER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "PlagueDoctor_TermDamage",
	duration		= 0.5,
	period			= 1,
	ignore_subtype	= true,
	hud_visible 	= false,
	isBuff			= false,
	aura_sound 		= "sound/gadgets/MovementRestrictor/alarm",
}

Spell.PlagueDoctor_TermDamage =
{
	target				= 
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		misc 			= ai.SpellTargetMisc.NEAREST,
	},
	target_range	= 10,
	isBuff			= false,
	aura  			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 450,
	duration		= 2,
	period			= 1,
	disable_aura_duration = true,
	spell_on_cancel = "PlagueDoctor_Contagination",
	ignore_subtype	= true,
	apply_interval	= 2,
	aura_sound 		= "sound/gadgets/MovementRestrictor/alarm",
	aura_fx			= "particles/gadget/special/doctor_damage_debuff",
	uiName			= "PlagueDoctor_TermDamage",
	uiDesc			= "PlagueDoctor_TermDamage_Desc",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlagueDoctor", },
	},
}

Spell.Spell_SpikedShield_Invulnerability =
{	--неуязвимость
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.INVULNERABILITY,--UNTOUCHABLE,
	duration		= 5,
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpikedShield", },
	},
}

Spell.Spell_SpikedShield_Resist =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= --ai.SpellTarget.HOLDER,
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_range		= 14,
	aura			= ai.Aura.RESIST_ALL,
	aura_param 		= 400,
	duration		= 5,
	
	isBuff			= true,
	gameplay_specific = true,
	
	aura_start_sound = "sound/gadgets/shift_off",
	aura_end_sound	= "sound/gadgets/shift_off",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpikedShield", },
	},
}

Spell.Spell_SpikedShield_Switch_Resist =
{
	influence		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.RESIST_ALL,
	aura_param 		= 400,
	--duration		= 10,
	--disable_aura_duration = true,
	
	isBuff			= true,
	gameplay_specific = true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpikedShield", },
	},
}

Spell.Spell_SpikedShield_Switch_ShieldRegen =
{
	influence		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param 		= 1000,
	period			= 1,
	--duration		= 10,
	--disable_aura_duration = true,
	
	isBuff			= true,
	gameplay_specific = true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpikedShield", },
	},
}

Spell.Spell_Ice_Passive = 
{	--пассивный бонус к резистам
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 			= 50.0,
	gameplay_specific	= true,
	isBuff				= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IceShield", },
	},
}

Spell.Spell_IceCast = --глыба с замедлением
{ 
	influence 			= ai.Spell.CAST_SPELLS,
	spells				= { 'Spell_IceSilence', 'Spell_IceFreeze', 'Spell_IceSlow', 'Spell_IceStasis', },
}

Spell.Spell_IceSilence = 
{	--зпрет стрельбы и модулей
	target 			= ai.SpellTargetGeneral.CASTER,
	aura_target 	= ai.SpellTargetGeneral.CASTER,
	aura 			= ai.Aura.SILENCE,
	gameplay_specific = true,
	duration 		= 8,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_IceShield", }, },
}

Spell.Spell_IceFreeze =
{	--снижение маневренности
	target = ai.SpellTargetGeneral.CASTER,
	aura 			= ai.Aura.SLOW_MANEUVER,
	gameplay_specific = true,
	aura_param		= 2.0,
	duration		= 8,
	isBuff			= false,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IceShield", },
	},
}

Spell.Spell_IceSlow =
{	--замедление
	isBuff = false,
	aura = ai.Aura.SLOW_MOVEMENT,
	target = ai.SpellTarget.CASTER,
	duration		= 8,
	aura_param 		= 1.5,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IceShield", },
	},
}

Spell.Spell_IceStasis =
{	--неуязвимость
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 8,
	isBuff			= true,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},

	use_silence_sound = false,
	spell_on_cancel = "Spell_IceSpeed",
	aura_main_fx	= "particles/gadget/special/ice_shell",
	aura_start_sound = "sound/aura/IceStasis_freeze",
	aura_end_sound	 = "sound/aura/IceStasis_melt",
}

Spell.Spell_IceTaunt = --кастуется через additional_spell
{	--таунт
	target =
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_target		= 
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	aura = ai.Aura.FORCE_TARGET_LOCK,
	duration = 8,
	aura_range = 200,
	isBuff = false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IceShield", },
	},
}

Spell.Spell_IceSpeed =
{	--увеличене скорости при выходе из глыбы
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 1.5,
	duration		= 15,
	period			= 1,
	aura_param_add	= -0.1,
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
	},
}

Spell.Spell_DoubleEmpShotgun = 
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	aura 				= ai.Aura.SLOW_MOVEMENT,
	aura_param			= 0.15,
	apply_crowd_control_coef	= true,
	duration			= 7,
	max_stacks 			= 3,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DoubleEmpShotgun", },
	},
	aura_fx			= "particles/gadget/slow_movement",
}

Spell.Spell_TornadoGun =
{
	isBuff 			= true,
	hit_target =
	{
		class						= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		relationship				= ai.SpellTargetRelationship.ENEMY,
	},
	aura 			= ai.Aura.DAMAGE_MOD,
	aura_target 	= 
	{
		target = ai.SpellTargetGeneral.BROTHER_OF_CASTER + ai.SpellTargetGeneral.CASTER,
	},
	aura_param 		= 0.05,
	duration 		= 10,
	can_stack 		= true,
	max_stacks 		= 5,
	ignore_subtype 	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_TornadoGun", },
	},
}

Spell.Spell_RocketMine =
{	--контузия при попадании во взрывы
	isBuff 			= true,
	aura_target 			= ai.SpellTarget.HOLDER,
	target =
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
	},
	target_range	= 100,
	aura			= ai.Aura.ANTI_RADAR,
	duration		= 3,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RocketMine", },
	},
	
	additional_auras = 
	{
		{
			isBuff 			= false,
			aura_target 			= ai.SpellTarget.HOLDER,
			target =
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
			},
			target_range	= 100,
			aura			= ai.Aura.DISABLE_LOCK,
			duration		= 3,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_RocketMine", },
			},
		},
	}
}

Spell.Spell_Salyut_EnergyVamp_Timer =
{
	influence		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target 			= ai.SpellTarget.CASTER,
	target_spell	= "Spell_Null",
	duration		= 15,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_EnergyVamp" } },
	aura_sound = "sound/aura/salut_EnergyVamp",
	
	additional_auras = 
	{
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura			= ai.Aura.SHIELD_RESIST_ALL,
			duration		= 15,
			aura_param		= 30,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_EnergyVamp" } },
		},
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura			= ai.Aura.HULL_RESIST_ALL,
			duration		= 15,
			aura_param		= 30,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_EnergyVamp" } },
		},
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura			= ai.Aura.ENGINE_MOD,
			duration		= 15,
			aura_param		= 0.15,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_SystemsCrash" } },
		},
	},
}

Spell.Spell_Salyut_ForceBooster_Timer =
{
	influence		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target 			= ai.SpellTarget.CASTER,
	target_spell	= "Spell_Null",
	duration		= 15,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_ForceBooster" } },
	aura_sound = "sound/aura/salut_EnergyVamp",
	
	additional_auras = 
	{
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura			= ai.Aura.SHIELD_RESIST_ALL,
			duration		= 15,
			aura_param		= 30,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ForceBooster" } },
		},
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura			= ai.Aura.HULL_RESIST_ALL,
			duration		= 15,
			aura_param		= 30,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ForceBooster" } },
		},
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura			= ai.Aura.ENGINE_MOD,
			duration		= 15,
			aura_param		= 0.15,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_SystemsCrash" } },
		},
	},
}

Spell.Spell_Salyut_SystemsCrash_Timer =
{
	influence		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target 			= ai.SpellTarget.CASTER,
	target_spell	= "Spell_Null",
	duration		= 10,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_SystemsCrash" } },
	aura_sound = "sound/aura/salut_EnergyVamp",
	
	additional_auras = 
	{
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura			= ai.Aura.SHIELD_RESIST_ALL,
			duration		= 10,
			aura_param		= 30,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_SystemsCrash" } },
		},
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura			= ai.Aura.HULL_RESIST_ALL,
			duration		= 10,
			aura_param		= 30,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_SystemsCrash" } },
		},
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff			= true,
			aura			= ai.Aura.ENGINE_MOD,
			duration		= 10,
			aura_param		= 0.15,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_SystemsCrash" } },
		},
	},
}

Spell.Spell_Salyut_EnergyVamp =
{	
	target 			= ai.SpellTarget.CASTER,
	aura_target 	=
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	--конус с радиусом основания aura_range и длиной target_range
	aura_range = 250,
	aura_extra_radius = 40,
	aura			= ai.Aura.REDUCE_ROT_SPEED,
	duration		= 15,
	aura_param 		= 100,
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_EnergyVamp" } },
	disable_aura_duration	= true,
	fixed_cylinder_target 	= false,
	isBuff					= false,
	work_beam_fx = "particles/gadget/energy_burn_cone_beam",
	ray_sound 		= "sound/aura/salut_EnergyVamp",
	additional_auras = 
	{
		{
			target 			= ai.SpellTarget.CASTER,
			aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.IN_CONE,
				signature		= ai.SignatureMask.LARGE,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			--конус с радиусом основания aura_range и длиной target_range
			aura_range = 250,
			aura_extra_radius = 40,
			disable_aura_duration 	= true,
			fixed_cylinder_target	= false,
			isBuff					= false,
			aura			= ai.Aura.ENERGY_VAMPIRE_PERIODIC,
			period			= 0.2,
			duration		= 15,
			aura_param		= 20,
			
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_EnergyVamp" } },
			aura_fx = "particles/gadget/add_energy",
			period_beam_root_fx = "particles/gadget/pulsars/energy_burner_beam",
		},
		{
			target 			= ai.SpellTarget.CASTER,
			aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.IN_CONE,
				signature		= ai.SignatureMask.HUGE,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			--конус с радиусом основания aura_range и длиной target_range
			aura_range = 250,
			aura_extra_radius = 40,
			disable_aura_duration 	= true,
			fixed_cylinder_target 	= false,
			isBuff					= false,
			aura			= ai.Aura.ENERGY_VAMPIRE_PERIODIC,
			period			= 0.2,
			duration		= 15,
			aura_param		= 25,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_EnergyVamp" } },
			period_beam_root_fx = "particles/gadget/pulsars/energy_burner_beam",
		},
		{
			aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.IN_CONE,
				signature		= ai.SignatureMask.MEDIUM + ai.SignatureMask.SMALL,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			--конус с радиусом основания aura_range и длиной target_range
			aura_range = 250,
			aura_extra_radius = 40,
			disable_aura_duration 	= true,
			fixed_cylinder_target 	= false,
			isBuff					= false,
			aura			= ai.Aura.ENERGY_VAMPIRE_PERIODIC,
			period			= 0.2,
			duration		= 15,
			aura_param		= 15,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_EnergyVamp" } },
			period_beam_root_fx = "particles/gadget/pulsars/energy_burner_beam",
		},
	},
}

Spell.Spell_Salyut_ForceBooster =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	=
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	--конус с радиусом основания aura_range и длиной target_range
	aura_range = 250,
	aura_extra_radius = 40,
	aura			= ai.Aura.FORCE_BOOST,
	--period			= 0.2,
	duration		= 15,
	disable_aura_duration 	= true,
	fixed_cylinder_target 	= false,
	isBuff					= false,
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_ForceBooster" } },
	
	work_beam_fx = "particles/gadget/forcebooster_cone_beam",
	aura_target_fx = "particles/gadget/lightnings_debuff",
	
	aura_sound = "sound/aura/engine_hack",
	ray_sound 		= "sound/aura/salut_EnergyVamp",
	
	additional_auras = 
	{
		{ -- Снижение скорости поворотов корабля
			aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.IN_CONE,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			--конус с радиусом основания aura_range и длиной target_range
			aura_range = 250,
			aura_extra_radius = 40,
			disable_aura_duration 	= true,
			fixed_cylinder_target 	= false,
			isBuff					= false,
			hud_visible				= false,
			aura			= ai.Aura.SLOW_MANEUVER,
			duration		= 15,
			aura_param 		= 2,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ForceBooster" } }
		},
		{ -- Увеличение скорости корабля
			aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.IN_CONE,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			--конус с радиусом основания aura_range и длиной target_range
			aura_range = 250,
			aura_extra_radius = 40,
			disable_aura_duration 	= true,
			fixed_cylinder_target 	= false,
			isBuff					= false,
			aura			= ai.Aura.FAST_MOVEMENT,
			duration		= 15,
			aura_param 		= 1,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ForceBooster" } }
		},
		{ -- Уменьшение скорости регенерации
			aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.IN_CONE,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			--конус с радиусом основания aura_range и длиной target_range
			aura_range = 250,
			aura_extra_radius = 40,
			disable_aura_duration 	= true,
			fixed_cylinder_target 	= false,
			isBuff					= false,
			aura  				= ai.Aura.HEALING_MOD,
			duration		= 15,
			aura_param 		= -3,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ForceBooster" } }
		},
	},
}

Spell.Spell_Salyut_SystemsCrash = 
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	=
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	--конус с радиусом основания aura_range и длиной target_range
	aura_range = 250,
	aura_extra_radius = 40,
	aura			= ai.Aura.SILENCE,
	duration		= 10,
	
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_SystemsCrash" } },
	
	aura_target_fx = "particles/gadget/lightnings_debuff",
	work_beam_target_root_fx = "particles/gadget/hack_beam_looped",
	work_beam_fx = "particles/gadget/hack_cone_beam",
	
	ray_sound 		= "sound/aura/salut_EnergyVamp",
	
	disable_aura_duration 	= true,
	fixed_cylinder_target 	= false,
	isBuff					= false,
	
	additional_auras = 
	{
		{ -- Перехват контроля над вражеским орудием
			aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.IN_CONE,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
			--конус с радиусом основания aura_range и длиной target_range
			aura_range = 250,
			aura_extra_radius = 40,
			disable_aura_duration 	= true,
			fixed_cylinder_target 	= false,
			isBuff					= false,
			aura			= ai.Aura.HACKED_WEAPON,
			duration		= 10,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_SystemsCrash" } },
		},
	},
}

Spell.Spell_Mole_SendDrone =
{
	influence = ai.Spell.SEND_SATELLITE,
	target =
	{
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	target_range = 500,
	isBuff = true,
	holder_def = "SatelliteHolder",
	drone_def = "MoleDrone",
	drone_ttl = 30,
}

Spell.Spell_Mole_CastHeal =
{
	influence=ai.Spell.CAST_SPELLS,
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	spells= { 'Spell_Mole_EmergencyHullHeal', 'Spell_Mole_EmergencyShieldHeal' }
}

Spell.Spell_Mole_EmergencyHullHeal =
{
	influence = ai.Spell.HEAL_HULL_SCALED,
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	isBuff = true,
	influence_param	= 5000, -- если менять, то менять и в Spell_Mole_EmergencySpell (для тултипа)
	influence_fx = "particles/gadget/matter_absorber_uncirculated",
}

Spell.Spell_Mole_EmergencyShieldHeal =
{
	influence = ai.Spell.HEAL_SHIELD_SCALED,
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.HOLDER,
	},
	isBuff = true,
	influence_param	= 5000, -- если менять, то менять и в Spell_Mole_EmergencySpell (для тултипа)
}

Spell.Protozan_WeaponModificator_Inc = 
{
	aura			= ai.Aura.DAMAGE_MOD,
	target			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	duration		= 30,
	aura_param 		= 0.3,
	isBuff			= true,	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ProtozanCamouflage", },
	},
	additional_auras = 
	{
		{ -- Снижение резистов
			aura			= ai.Aura.SHIELD_RESIST_ALL_DEC,
			duration		= 30,
			aura_param 		= 60,
			isBuff					= false,
			ignore_additional_power = true,
			gameplay_specific 		= true,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ProtozanCamouflage" } },
		},
		{ -- Увеличение урон снайперского спецмодуля
			aura			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
			duration		= 30,
			aura_param 		= 0.3,
			isBuff					= true,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ProtozanCamouflage" } },
		},
	},
}

Spell.Protozan_WeaponModificator_Dec =
{
	aura			= ai.Aura.SHIELD_RESIST_ALL_DEC,
	target			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	duration		= 2,
	aura_param 		= 60,
	isBuff					= false,	
	ignore_additional_power = true,
	gameplay_specific 		= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ProtozanCamouflage", },
	},
}

Spell.ProtozanBlaster_TermResDec = 
{
	aura_execution_delay = 0.2,
	target			= 
	{
		class          	= ai.SpellTargetClass.SHIP,
		area           	= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality       	= ai.SpellTargetVitality.ALIVE,
		misc 			= ai.SpellTargetMisc.NEAREST,
	},
	target_range	= 15,
	aura			= ai.Aura.HULL_RESIST_THERMAL_DEC,
	aura_param		= 9,
	max_stacks		= 5,
	duration		= 16,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ProtozanBlaster", },
	},
}

Spell.HarpoonHook_CastSpells = {
	influence			= ai.Spell.CAST_SPELLS,
	
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP ,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura_target 		= ai.SpellTarget.CASTER,
		
	spells				= { 'HarpoonHook', 'HarpoonHook_Huge' }
}
Spell.HarpoonHook = 
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP ,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM + ai.SignatureMask.LARGE,
	},
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	
	aura 				= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
	aura_param			= 1000,
	duration			= 2,
	period				= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HarpoonGun", },
	},
}
Spell.HarpoonHook_Huge = 
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class			= ai.SpellTargetClass.SHIP ,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.HUGE,
	},
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	
	aura 				= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
	aura_param			= 4000,
	duration			= 2,
	period				= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HarpoonGun", },
	},
}

Spell.Spell_Gleipnir_Cast =
{
	--target = ai.SpellTarget.CASTER,
	--aura_target		=  
	target =
	{
		target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality       	= ai.SpellTargetVitality.ALIVE,
	},
	--aura_range = 200,
	aura = ai.Aura.CAST_SPELL_PERIODIC,
	target_spell = "Spell_Gleipnir",
	duration = 20,
	period = 1,
	isBuff = false,
	
	--hud_visible 				= false,
	ignore_subtype				= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Gleipnir", },
	},
}

Spell.Spell_Gleipnir =
{
	--influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DAMAGE_KINETIC_SCALED,
	target			= 
	{
		target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target = 
	{
		target					= ai.SpellTargetGeneral.HOLDER,
		--target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		--class 					= ai.SpellTargetClass.SHIP,
		--relationship			= ai.SpellTargetRelationship.ENEMY,
		--area					= ai.SpellTargetArea.OUTSIDE,
	},
	
	mod_range							= 450,
	mod_max								= 1,
	mod_target = --Weapon_Gleipnir_T5_Epic
	{
		target					= ai.SpellTargetGeneral.CASTER,
		area					= ai.SpellTargetArea.OUTSIDE,
	},
	
	aura_param					= 700,
	--aura_range					= 50,
	duration					= 0.5,
	
	disable_zero_stage = true,
	disable_aura_duration = true,
	
	isBuff						= false,
	hud_visible 				= false,
	ignore_subtype				= true,
	min_targets_count			= 0,
	aura_fx			= "particles/gadget/special/doctor_damage_debuff",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Gleipnir", },
	},
	--aura_holder_def				= "Missile_CageTrapMine_Holder",
}

Spell.Spell_Sehrimnir_ShieldAdd = 
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= 
	{
		class          	= ai.SpellTargetClass.SHIP,
		area           	= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
		vitality       	= ai.SpellTargetVitality.ALIVE,
		--misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	aura_range		= 100,
	aura  			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param		= 50,
	duration		= 15,
	isBuff			= true,
	
	disable_zero_stage 		= true,
	--ignore_additional_power = true,
	ignore_stacks = true,
	ignore_subtype = true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Sehrimnir", },
	},
	
	mod_range							= 100,
	mod_max								= 5,
	mod_target = --Module_Sehrimnir_T5_Epic
	{
		class          	= ai.SpellTargetClass.SHIP,
		area           	= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
		vitality       	= ai.SpellTargetVitality.ALIVE,
		misc			= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	mod_update_period = 0.5,
	
	additional_auras = 
	{
		{
			target 			= ai.SpellTarget.CASTER,
			aura_target 	= ai.SpellTarget.HOLDER,
			--aura_range = 200,
			aura  			= ai.Aura.SHIELD_RESIST_ALL,
			aura_param		= 120,
			duration		= 15,
			isBuff			= true,
			ignore_subtype = true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Sehrimnir", },
			},
		},
		{	--увеличене скорости 
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MOVEMENT,
			aura_param		= 0.5,
			ignore_additional_power = true,
			duration		= 15,
			--period			= 1,
			--aura_param_add	= -0.1,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Sehrimnir", },
			},
		}
	},
	
	aura_target_fx = "particles/gadget/shield_fortify",
}

Spell.NaglfarClones_AddAmmo =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	influence = ai.Spell.ADD_SPECIAL_AMMO,
	influence_param = 1,
	isBuff = true,
	
	influence_fx = "particles/gadget/special/naglfar_add",
	influence_sound  = "sound/aura/NaglfarClones_AddAmmo",
}

Spell.NaglfarCloneHide =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= 	
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		area			= ai.SpellTargetArea.AROUND,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	
	aura_range 	= 60,
	duration	= 160,
	aura = ai.Aura.CAMO_MOD,
	aura_param = 2,
	
	isBuff = true,
	cast_sound = "sound/aura/NaglfarCloneHide",
	gameplay_specific = true,
	min_targets_count = 0,
	
	disable_aura_duration = true,
	hud_visible = false,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_NaglfarClones", },
	},

}

Spell.Gleipnir_DeathHand = {
	target 				= 	
	{
		target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	isBuff				= false,
	--hud_visible 		= false,
	ignore_subtype 		= true,
	duration 			= 5,
	aura 				= ai.Aura.SPELL_ON_DEATH_SOMEONE,
	aura_target		= ai.SpellTarget.HOLDER,

	trigger_target 		=  -- таблица таргет
	{
		-- class 			= ai.SpellTargetClass.SHIP,
		-- relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		target			= ai.SpellTargetGeneral.HOLDER,
		vitality 		= ai.SpellTargetVitality.DEAD,
	},
	--trigger_range 		= 200, -- расстояние
	target_spell 		= "Gleipnir_Souleater", -- спелл который накладывается, если кто то умер
	
	--aura_fx			= "particles/gadget/special/doctor_damage_debuff",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Gleipnir", },
	},
}

Spell.Gleipnir_Souleater =
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	--target_range		= 60,
	aura  			= ai.Aura.HULL_RESIST_ALL,
	duration			= 80,
	aura_param			= 45,
	
	max_stacks = 2,
	-- can_stack = true,
	isBuff = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Gleipnir", },
	},
	
	aura_target_fx = "particles/gadget/shield_fortify",
}

Spell.Spell_PortalGate =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.ANTI_RADAR,
	
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	
	dispell_flag				= ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET,
	duration					= 40,
	
	isBuff						= true,
	hud_visible 				= true,
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_PortalGate", },
	},
	
	aura_fx = "StealthEffect",
}

Spell.Spell_VesselSwitch_Albiero =
{
	target =
	{
		target			= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target			= ai.SpellTarget.HOLDER,
	
	aura				= ai.Aura.REDUCE_MAX_SPEED,
	aura_param_add		= 0.5,
	period				= 0.2,
	
	isBuff				= false,
	gameplay_specific	= true,
	hud_visible			= false,
	
	additional_auras =
	{
		{
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.RESIST_ALL_DEC,
			aura_param 			= 100, --100
			isBuff				= false,
			gameplay_specific	= true,
			hud_visible			= false,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_VesselSwitch1", },
			},
		},
	},
}

Spell.Spell_VesselSwitch_Albiero_Passive =
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.FAST_MOVEMENT,
	aura_param			= 0.20,
	isBuff 				= true,
	gameplay_specific	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_VesselSwitch1", },
	},
	
	additional_auras =
	{
		{
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.FAST_MANEUVER,
			aura_param 			= 0.2,
			isBuff				= true,
			gameplay_specific	= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_VesselSwitch1", },
			},
		},
	},
}

Spell.Spell_PlasmaWebLaser =
{
	influence=ai.Spell.CAST_SPELLS,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	spells= { 'Spell_PlasmaWebLaser_OnSpeed', 'Spell_PlasmaWebLaser_Periodic',},
}

Spell.Spell_PlasmaWebLaser_OnSpeed =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DAMAGE_EMP_SCALED,

	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target					= ai.SpellTarget.HOLDER,
			
	aura_param					= 500,
	scale_on_weapon				= true,
			
	duration					= 5,
	period						= 1,
			
	isBuff						= false,
			
	min_speed_percent			= 0.80,
			
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_PlasmaWebLaser", },
	},
			
	use_dead_engine_effects = true,
	aura_sound 		= "sound/gadgets/MovementRestrictor/alarm",
}

Spell.Spell_PlasmaWebLaser_Periodic =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DAMAGE_EMP_PERIODIC,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target =
	{
		target					= ai.SpellTargetGeneral.HOLDER,
	},
	
	aura_param					= 66,
	scale_on_weapon				= true,
	
	duration					= 5,
	period						= 1,
	
	isBuff						= false,
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_PlasmaWebLaser", },
	},
	
	aura_apply_fx				= "particles/gadget/aura_breacktrough",
	period_module_fx			= "particles/gadget/plasma_web_module",
	
	additional_auras = 
	{
		{
			aura 						= ai.Aura.DAMAGE_EMP_PERIODIC,
			aura_target =
			{
				target					= ai.SpellTargetGeneral.HOLDER,
				signature				= ai.SignatureMask.MEDIUM,
			},
			aura_param					= 100,
			scale_on_weapon				= true,
			
			duration					= 5,
			period						= 1,
			
			isBuff						= false,
			
			ui_ico =
			{
				target_system			= { tex = "ItemSubtype_PlasmaWebLaser", },
			},
			
			aura_apply_fx				= "particles/gadget/aura_breacktrough",
			period_module_fx			= "particles/gadget/plasma_web_module",
		},
		{
			aura 						= ai.Aura.DAMAGE_EMP_PERIODIC,
			aura_target =
			{
				target					= ai.SpellTargetGeneral.HOLDER,
				signature				= ai.SignatureMask.LARGE,
			},
			aura_param					= 125,
			scale_on_weapon				= true,
			
			duration					= 5,
			period						= 1,
			
			isBuff						= false,
			
			ui_ico =
			{
				target_system			= { tex = "ItemSubtype_PlasmaWebLaser", },
			},
			
			aura_apply_fx				= "particles/gadget/aura_breacktrough",
			period_module_fx			= "particles/gadget/plasma_web_module",
		},
		{
			aura 						= ai.Aura.DAMAGE_EMP_PERIODIC,
			aura_target =
			{
				target					= ai.SpellTargetGeneral.HOLDER,
				signature				= ai.SignatureMask.HUGE,
			},
			aura_param					= 875,
			scale_on_weapon				= true,
			
			duration					= 5,
			period						= 1,
			
			isBuff						= false,
			
			ui_ico =
			{
				target_system			= { tex = "ItemSubtype_PlasmaWebLaser", },
			},
			
			aura_apply_fx				= "particles/gadget/aura_breacktrough",
			period_module_fx			= "particles/gadget/plasma_web_module",
		},
	},
}

Spell.Spell_Albiero_S_Cloak =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.ANTI_RADAR,
	
	target						= ai.SpellTarget.CASTER,
	aura_target					= ai.SpellTarget.HOLDER,
	
	dispell_flag				= ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET,
	duration					= 25,
	
	isBuff						= true,
	hud_visible 				= true,
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_Albiero_Cloak", },
	},
	
	aura_fx = "StealthEffect",
}

Spell.Spell_MoleScanner =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.CAST_SPELL_PERIODIC,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	target_spell						= "Spell_MoleScanner_Ping",
	period								= 10,
	
	isBuff								= true,
	period_sound 						= "sound/gadgets2/EnemyScanner_Prec",
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_WideScanner", },
	},
}

Spell.Spell_MoleScanner_Ping =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.SPY_DRONE,
	target								= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 							= ai.SpellTargetClass.DESTROYABLE_ASTEROID,
		area          					= ai.SpellTargetArea.AROUND,
		--misc							= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	aura_range							= 2000,

	--duration							= 2,
	gameplay_specific					= true,
	isBuff								= true,
	hud_visible 						= false,
}

Spell.Spell_ThorCharging =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.CAST_SPELL_PERIODIC,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	target_spell						= "Spell_ThorCharge",
	period								= 1,
	duration							= 8,
	
	isBuff								= true,
	hud_visible 						= false,
	
	--aura_fx 							= "particles/weapons/chargedblast_guncharge",
	aura_sound 							= "sound/aura/thor_charge",
	aura_main_fx						= "particles/gadget/special/thor_charge",
	
	additional_auras = 
	{
		{
			aura_target					= ai.SpellTarget.HOLDER,
			aura  						= ai.Aura.OVERCHARGE,
			
			aura_param					= 0.4,
			duration					= 8,
			
			isBuff						= true,
			
			aura_apply_fx				= "particles/gadget/aura_breacktrough",
			--aura_end_sound				= "sound/gadgets/timeboost_end",
			--aura_fx						= "particles/gadget/overdrive",
			
			ui_ico = 
			{
				target_system = 
				{
					tex 				= "ItemSubtype_ThorBlast",
				},
			},
		},
	}
}

Spell.Spell_ThorCharge =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.CHARGE_SPELL,
	target 								= ai.SpellTarget.CASTER,
	aura_target 						= ai.SpellTarget.HOLDER,
	
	max_stacks							= 5,
	aura_param							= 0.50,

	isBuff								= true,

	ui_ico =
	{
		target_system 					= { tex = "ItemSubtype_ThorBlast", },
	},
}

Spell.Spell_ThorBlast =
{

	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target = 
	{
		class							= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area							= ai.SpellTargetArea.IN_CYLINDER,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},

	aura_range							= 550,
	aura_extra_radius					= 25,
	fixed_cylinder_target 				= true,

	aura_param							= 395,
	duration 							= 1,
	period								= 0.2,
	
	isBuff								= false,
	hud_visible							= false,
	
	ignore_subtype						= true,
	ignore_stacks						= true,
	
	ui_ico =
	{
		target_system 					= { tex = "ItemSubtype_ThorBlast", },
	},
	work_beam_fx						= "particles/gadget/special/thor_beam",
	cast_shot_fx						= "particles/gadget/special/thor_muzzle",
	
--	ray_shot_sound						= "sound/aura/Spell_ThorBlast",
	cast_sound						= "sound/aura/Spell_ThorBlast",
}

Spell.Spell_ThorStasis =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.DAMAGE_EMP_SCALED,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.ENEMY_AROUND,
	
	aura_range 							= 75,
	aura_param							= 1200,
	duration							= 1,
	period								= 0.2,
	
	isBuff								= false,
	hud_visible							= false,
	
	ignore_subtype						= true,
	ignore_stacks						= true,
	
	cast_fx = "particles/gadget/special/thor_stasis",
	
	cast_sound							= "sound/explosion/big_rocket_expl",
	
	additional_auras = 
	{
		{
			aura_target					= ai.SpellTarget.ENEMY_AROUND,
			aura  						= ai.Aura.STASIS,
			
			aura_range 					= 75,
			duration					= 1.5,
			
			isBuff						= false,
			hud_visible					= false,
		},
	},
}

Spell.Spell_ThorHammer = 
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
	target =
	{
		target							= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target 						= 
	{
		target							= ai.SpellTargetGeneral.HOLDER,
		ship_role  						= ai.ShipRoleMask.ATTACK,
	},
	
	aura_param							= 0.15,
	duration							= 20,
	max_stacks							= 5,
	
	isBuff								= true,
	ui_ico =
	{
		target_system 					= { tex = "ItemSubtype_ThorHammer", },
	},
	
	additional_auras = 
	{
		{
			aura_target = 
			{
				target					= ai.SpellTargetGeneral.HOLDER,
				ship_role  				= ai.ShipRoleMask.ATTACK,
			},
			aura  						= ai.Aura.DAMAGE_ONE_SHOT_MOD,
			
			aura_param					= 0.20,
			duration					= 20,
			
			isBuff						= true,
			ui_ico =
			{
				target_system 			= { tex = "ItemSubtype_ThorHammer", },
			},
		},
	},
}

Spell.Spell_EnergyShield_Uniq_Shield =
{
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.ENERGY_SHIELD,
	
	duration			= 15,
	aura_param			= 20,
	
	isBuff				= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyShieldCommanderUniq", },
	},
	
	aura_fx	= "particles/gadget/energy_shield",
}

Spell.Spell_EnergyShield_Uniq_Ally =
{
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.CAST_SPELL_PERIODIC,
	aura_start_sound 		= "sound/aura/EnergyShield_Uniq_Ally",
	
	duration			= 14,
	period				= 1,
	
	isBuff				= true,

	target_spell		= "Spell_EnergyShield_Uniq_Ally_Ping",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyShieldCommanderUniq", },
	},
	
	additional_auras = 
	{
		{
			aura  						= ai.Aura.RESIST_ALL,
			aura_target	=
			{
				class					= ai.SpellTargetClass.SHIP,
				area					= ai.SpellTargetArea.AROUND,
				relationship			= ai.SpellTargetRelationship.ALLY,
				misc					= ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
			
			aura_range					= 250,
			aura_param					= 75,
			duration					= 15,
			
			isBuff						= true,
			
			ui_ico =
			{
				target_system 			= { tex = "ItemSubtype_EnergyShieldCommanderUniq", },
			},
			
		},
	},
}

Spell.Spell_EnergyShield_Uniq_Ally_Ping =
{
	target =
	{
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
		misc			= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	target_range		= 250,
	aura				= ai.Aura.DAMAGE_REFLECT,
	aura_target			= ai.SpellTarget.CASTER,
	duration			= 1,
	period				= 0.2,
	
	ignore_subtype		= true,
	isBuff				= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyShieldCommanderUniq", },
	},
	
	aura_fx				= "particles/gadget/energy_shield",
	work_beam_target_root_fx = "particles/gadget/energy_shield_beam",

}

Spell.Spell_EnergyShield_Uniq_DeactivationBarier =
{
	aura			= ai.Aura.EMERGENCY_BARRIER,
	duration		= 1,
	isBuff			= true,
	hud_visible		= false,
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_EnergyShieldCommanderUniq", },
	},
}

Spell.Spell_MassEnergyLeak =
{
	target 						= ai.SpellTarget.CASTER,
	aura 						= ai.Aura.ENERGY_VAMPIRE_PERIODIC,
	aura_target =
	{
		class 					= ai.SpellTargetClass.SHIP,
		area					= ai.SpellTargetArea.AROUND,
		relationship 			= ai.SpellTargetRelationship.ENEMY,
		misc					= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	aura_param					= 45,
	aura_range					= 200,
	
	duration					= 6,
	period						= 0.2,
	
	isBuff 						= false,
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_MassEnergyLeak", },
	},
	
	work_beam_target_root_fx	= "particles/gadget/exhaustion_beam_energy",
	aura_target_fx				= "particles/gadget/burn_energy",

	aura_holder_sound					= "sound/aura/MassEnergyLeak",

}

Spell.Spell_TormentorArmour =
{
	target 						= ai.SpellTarget.CASTER,
	aura 						= ai.Aura.DAMAGE_MOD,
	aura_target					= ai.SpellTarget.HOLDER,
	aura_param					= 0.1,
	aura_param_stages			= { 1, 2, 3, 4, 5, 5, 5, 5 },
	
	isBuff 						= true,
	--disable_zero_stage			= true,
	
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
	
	aura_fx						= "particles/gadget/damage_buff",
}

Spell.Spell_PhoenixArmour =
{
	target 						= ai.SpellTarget.CASTER,
	aura  						= ai.Aura.HEAL_HULL_PERCENT_PERIODIC,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 1/(3/0.2),
	duration					= 3,
	period						= 0.2,
	
	isBuff						= true,
	gameplay_specific			= true,
	aura_start_sound 			= "sound/aura/UntouchableGhost",
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_PhoenixArmour", },
	},
	
	aura_fx						= "particles/gadget/invulnerability",
	
	additional_auras = 
	{
		{
			aura 						= ai.Aura.UNTOUCHABLE,
			aura_target					= ai.SpellTarget.HOLDER,
			
			duration					= 3,
			
			isBuff 						= true,
			gameplay_specific			= true,
			
			ui_ico =
			{
				target_system			= { tex = "ItemSubtype_PhoenixArmour", },
			},
		},
		{
			aura 						= ai.Aura.INVULNERABILITY,
			aura_target					= ai.SpellTarget.HOLDER,
			
			duration					= 0.2,
			
			isBuff 						= true,
			gameplay_specific			= true,
			
			ui_ico =
			{
				target_system			= { tex = "ItemSubtype_PhoenixArmour", },
			},
		},
	},
}

Spell.ClusterTorpedo_ThermalDamage_Huge =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target 	= 		{
		class          	= ai.SpellTargetClass.SHIP,
		area           	= ai.SpellTargetArea.AROUND,
		signature		= ai.SignatureMask.HUGE,
		damageability 	= ai.SpellTargetDamageability.DAMAGEABLE,
	},
	aura_range		= 18.5,

	aura_param		= 20000,
	duration 		= 0.5,
	period			= 1,
	isBuff			= false,
	hud_visible		= false,
}

Spell.ProtozanTorpedo_ThermalDamage_Huge =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target 	= 		{
		class          	= ai.SpellTargetClass.SHIP,
		area           	= ai.SpellTargetArea.AROUND,
		signature		= ai.SignatureMask.HUGE,
		damageability 	= ai.SpellTargetDamageability.DAMAGEABLE,
	},
	aura_range		= 25,

	aura_param		= 22000,
	duration 		= 0.5,
	period			= 1,
	isBuff			= false,
	hud_visible		= false,
}

Spell.Spell_PlasmaWebBlast =
{
	target					= ai.SpellTarget.LOCKED_TARGET,
	target_range			= 200,
	aura 					= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target				= ai.SpellTarget.HOLDER,
	
	aura_param				= 510,
	scale_on_weapon				= true,
--	aura_holder_sound 			= "sound/hit/pb_common",
	period_holder_sound 				= "sound/hit/pb_common",
	
	duration 				= 12,
	period					= 1,
	isBuff					= false,
	ignore_subtype			= true,
	
	additional_auras =
	{
		{
			aura_target =
			{
				target 		= ai.SpellTargetGeneral.HOLDER,
				signature	= ai.SignatureMask.HUGE,
			},
			aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
			
			aura_param		= 250,
			
			isBuff			= false,
			ignore_subtype	= true,
			
			duration		= 12,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PlasmaWebBlast", },
			},
		},
	},
	
	period_module_fx		= "particles/gadget/plasma_web_module_red",
	period_module_my_fx		= "particles/gadget/plasma_web_module_red",
	
	period_module_fx_number_by_stacks = { 3 },
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaWebBlast", },
	},
}


Spell.Spell_PlasmaWebBlastTest =
{
	inherit					= "Spell_PlasmaWebBlast",
	target					= ai.SpellTarget.CASTER,
}

Spell.Spell_PlasmaWebBlast_Ping =
{
	target =
	{
		target				= ai.SpellTargetGeneral.LOCKED_TARGET,
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
	},
	target_range			= 200,
	aura 					= ai.Aura.CAST_SPELL_PERIODIC,
	aura_target =
	{
		area 				= ai.SpellTargetArea.AROUND,
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		misc				= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	aura_range				= 40,
	
	target_spell			= "Spell_PlasmaWebBlast_BlastAndClean",
	
	duration 				= 12,
	period					= 0.2,
	isBuff					= false,
	hud_visible				= false,

	remove_on_immune		= true,
	
	min_targets_count  		= 0,
	apply_once_if_target_exists = true,
	target_spell_on_holder	= true,
}

Spell.Spell_PlasmaWebBlast_BlastAndClean =
{
	influence 				= ai.Spell.CAST_SPELLS,
	spells					= { 'Spell_PlasmaWebBlast_Blast', 'Spell_PlasmaWebBlast_Clean' }
}

Spell.Spell_PlasmaWebBlast_Blast =
{
	influence 				= ai.Spell.EXPLOSION,
	target =
	{
		target				= ai.SpellTargetGeneral.INFLICTOR,
	},
	
	explosion_blast_wave	= "Blastwave_PlasmaWebBlast",
}

Spell.Spell_PlasmaWebBlast_Clean =
{
	influence 				= ai.Spell.DISPELL,
	target =
	{
		target				= ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	
	itemSubTypes			= { ItemSubtype.PlasmaWebBlast },
}


Spell.Spell_EnergyLanceAura =
{
	target 						= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura  						= ai.Aura.RESIST_ALL_DEC,
	aura_target = 
	{
		class         		 	= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area          		 	= ai.SpellTargetArea.IN_CYLINDER,
		relationship  		 	= ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_holder_def				= "EnergyLanceAuraHolder",
	aura_holder_attach_bone		= "root",
	aura_holder_offset			= Vec3( 0, 0, 5 ),
	
	aura_extra_radius			= 17,
	aura_range	 				= 25,
	aura_target_offset 			= Vec3( 0, 0.07, -1 ),
	fixed_cylinder_target		= true,
	
	aura_param					= 30,
	period						= 0.5,
	duration					= 8,
	
	isBuff						= false,
	gameplay_specific			= false,
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_EnergyLanceAura", },
	},
	
	aura_target_fx				= "particles/gadget/teleport_prepare",
}

Def.EnergyLanceAuraHolder =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	hack_immune 		= true,
	damageable			= false,
	
	model				= "models/misc/energy_lance_joints",
	maxViewDist 		= 999999,
	children = 
	{
	    { effect = "particles/gadget/energy_lance_part", joint = "fx1" },
		{ effect = "particles/gadget/energy_lance_part", joint = "fx2" },
		{ effect = "particles/gadget/energy_lance_part", joint = "fx3" },
		{ effect = "particles/gadget/energy_lance_part", joint = "fx4" },
	}
}

Spell.Spell_PlasmaWebStatic =
{
	target = 
	{
		class         		 	= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION,
		relationship  		 	= ai.SpellTargetRelationship.ENEMY,
		area 					= ai.SpellTargetArea.AROUND,
	},
	target_range				= 120,
	aura 						= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 75,
	scale_on_weapon				= true,
	
	duration 					= 12,
	period						= 1,
	isBuff						= false,
	remove_on_immune 			= true,
	ignore_subtype				= true,
	min_targets_count			= 1,
	
	additional_auras =
	{
		{
			aura				= ai.Aura.DAMAGE_THERMAL_SCALED,
			aura_target =
			{
				target 			= ai.SpellTargetGeneral.HOLDER,
				signature		= ai.SignatureMask.HUGE,
			},
			
			aura_param			= 120,
			isBuff				= false,
			remove_on_immune 	= true,
			ignore_subtype		= true,
			duration			= 12,
			min_targets_count	= 1,
			hud_visible 		= false,
			hud_visible_holder	= false,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PlasmaWebStatic", },
			},
		},
	},
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_PlasmaWebStatic", },
	},
	
	period_module_fx			= "particles/gadget/plasma_web_module",
	period_module_my_fx			= "particles/gadget/plasma_web_module",
}

Spell.Spell_PlasmaWebStatic_2 =
{
	target = 
	{
		class         		 	= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION,
		relationship  		 	= ai.SpellTargetRelationship.ENEMY,
		area 					= ai.SpellTargetArea.AROUND,
	},
	target_range				= 120,
	aura 						= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target = 
	{
		class         			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION,
		relationship  			= ai.SpellTargetRelationship.ENEMY,
		area 					= ai.SpellTargetArea.AROUND,
		misc					= ai.SpellTargetMisc.EXCLUDE_HOLDER + ai.SpellTargetMisc.REQUIRE_SAME_FRIENDLY_HOLDER,
	},
	mod_target =
	{
		class         			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION,
		relationship  			= ai.SpellTargetRelationship.ENEMY,
		area 					= ai.SpellTargetArea.AROUND,
		misc					= ai.SpellTargetMisc.EXCLUDE_HOLDER + ai.SpellTargetMisc.REQUIRE_SAME_FRIENDLY_HOLDER,
	},
	mod_max						= 5,
	aura_param_stages			= { 5, 5, 3, 2, 2, 2, 2, 2, 2, 2 }, --  первый элемент = 0 целей/  второй элемент одна цель
	mod_update_period			= 1,
	
	aura_range					= 150,
	mod_range					= 150,
	aura_param					= 200,
	
	duration 					= 12,
	period						= 1,
	isBuff						= false,
	remove_on_immune			= true,
	ignore_subtype				= true,
	
	hud_visible_holder			= true,
	min_targets_count			= 0,
	
	additional_auras =
	{
		{
			aura				= ai.Aura.DAMAGE_THERMAL_SCALED,
			aura_target = 
			{
				class         	= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION,
				relationship  	= ai.SpellTargetRelationship.ENEMY,
				area 			= ai.SpellTargetArea.AROUND,
				signature		= ai.SignatureMask.HUGE,
				misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER + ai.SpellTargetMisc.REQUIRE_SAME_FRIENDLY_HOLDER,
			},
			
			mod_target =
			{
				class         	= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION,
				relationship  	= ai.SpellTargetRelationship.ENEMY,
				area 			= ai.SpellTargetArea.AROUND,
				signature		= ai.SignatureMask.HUGE,
				misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER + ai.SpellTargetMisc.REQUIRE_SAME_FRIENDLY_HOLDER,
			},
			mod_max				= 5,
			aura_param_stages	= { 5, 5, 3, 2, 2, 2, 2, 2, 2, 2 }, --  первый элемент = 0 целей/  второй элемент одна цель
			mod_update_period	= 1,
			
			aura_range			= 150,
			mod_range			= 150,
			aura_param			= 200,
			isBuff				= false,
			remove_on_immune 	= true,
			ignore_subtype		= true,
			duration			= 12,
			period				= 1,
			
			hud_visible 		= false,
			hud_visible_holder	= false,
			min_targets_count	= 0,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PlasmaWebStatic", },
			},
		},
	},
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaWebStatic", },
	},
	
	aura_sound							= "sound/aura/spell_AG_SameAttraction",
	work_beam_target_root_fx			= "particles/gadget/plasma_web_beam",
	--period_module_fx					= "particles/gadget/plasma_web_module",
	--period_module_my_fx				= "particles/gadget/plasma_web_module",
}

Spell.SpellOnHit_RemoteDisintegrator =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Disintegrator_T5_L', 'RemoteDisintegrator_T5_H' }
}

Spell.RemoteDisintegrator_T5_H =
{
	target					= { 
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		signature		= ai.SignatureMask.HUGE,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	isBuff					= false,
	aura_param				= 12500,
	scale_on_weapon			= true,
	ignore_stacks			= true,
	ignore_subtype			= true,
	duration				= 0.3,
	period 					= 0.2,
 	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Disintegrator", },
	},
}

Spell.NewGround_Debuff =
{
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.DISABLE_WARP,
	aura_target			= ai.SpellTarget.HOLDER,
	isBuff				= false,
	gameplay_specific	= true,
	hud_visible			= false,
	
	additional_auras =
	{
		{
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.SLOW_MOVEMENT,
			aura_param 			= 0,
			aura_param_add		= 0.04,
			period				= 1,
			isBuff				= false,
			gameplay_specific	= true,
			hud_visible			= false,
			
		},
		{
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.RESIST_ALL,
			aura_param 			= 900,
			isBuff				= false,
			gameplay_specific	= true,
			hud_visible			= false,
			
		},
		{
			aura_target			= ai.SpellTarget.HOLDER,
			aura				= ai.Aura.DISABLE_MODULES,
			isBuff				= false,
			gameplay_specific	= true,
			hud_visible			= false,
			
		},
	},
}

Spell.NewGround_Damage =
{
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target			= ai.SpellTarget.HOLDER,
	isBuff				= false,
	aura_param 			= 10,
	period				= 5,
	gameplay_specific	= true,
	hud_visible			= false,
}

Spell.Spell_SilentHunter =
{
	aura				= ai.Aura.STEALTH,
	aura_target			= ai.SpellTarget.CASTER,
	target				= ai.SpellTarget.CASTER,	
	isBuff				= true,
	duration			= 18,
	
	--min_targets_count	= 1,
	dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_DAMAGE,
	dispell_timeout		= 1,
	
	aura_start_sound	= "sound/gadgets/stealth_on",
	aura_end_sound		= "sound/gadgets/stealth_off",
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_SilentHunter", },
	},
}

Spell.Spell_SilentHunter_AntiRadar =
{
	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.CASTER,
	aura				= ai.Aura.ANTI_RADAR,
	duration			= 5,
	isBuff				= true,
	dispell_flag		= ai.Dispell.ON_MODULE,
	--dispell_timeout		= 1,
	ui_ico 				= { target_system = { tex = "ItemSubtype_SilentHunter", }, },
	aura_fx 			= "StealthEffect",
}

Spell.Spell_SilentHunter_Ping =
{
	target = {
		target 					= ai.SpellTargetGeneral.LOCKED_TARGET,
		class					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	target_range				= 800,
	aura						= ai.Aura.CAST_SPELL_PERIODIC,
	aura_target					= ai.SpellTarget.CASTER,
	aura_range					= 50,
	
	isBuff						= true,
	duration					= 18,
	period						= 0.2,
	
	target_spell				= "Spell_SilentHunter_ResDecAndClean",
	min_targets_count			= 0,
	
	hud_visible					= false,
	apply_once_if_target_exists	= true,
	target_spell_on_holder		= true,
	
	additional_auras =
	{
		{
			target = {
				target 					= ai.SpellTargetGeneral.LOCKED_TARGET,
				class					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
				relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			},
			target_range				= 800,
			aura 						= ai.Aura.SHIP_ATTRACTION,
			aura_target = {
				target 					= ai.SpellTargetGeneral.CASTER,
				area					= ai.SpellTargetArea.OUTSIDE,
			},
			aura_range					= 45,
			
			aura_param					= 50,
			duration 					= 18,
			dispell_flag 				= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_DAMAGE,
			isBuff						= true,
			min_targets_count			= 1,
			ui_ico = {
				target_system 			= { tex = "ItemSubtype_SilentHunter", },
			},
		},
		{
			target = {
				target 					= ai.SpellTargetGeneral.LOCKED_TARGET,
				class					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
				relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			},
			target_range				= 800,
			aura 						= ai.Aura.FAST_MANEUVER,
			aura_target = {
				target 					= ai.SpellTargetGeneral.CASTER,
				area				= ai.SpellTargetArea.OUTSIDE,
			},
			aura_range					= 45,
			--hud_visible = false,
			aura_param					= 1.5,
			duration 					= 18,
			dispell_flag 		= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_DAMAGE,
			isBuff						= true,
			min_targets_count			= 1,
			ui_ico = {
				target_system 			= { tex = "ItemSubtype_SilentHunter", },
			},
		},
		{
			target = {
				target 					= ai.SpellTargetGeneral.LOCKED_TARGET,
				class					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
				relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			},
			target_range				= 800,
			aura 						= ai.Aura.COLLISION_IMMUNE,
			aura_target = {
				target 					= ai.SpellTargetGeneral.CASTER,
				area					= ai.SpellTargetArea.OUTSIDE,
			},
			aura_range					= 45,
			--hud_visible = false,
			duration 					= 18,
			dispell_flag 				= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_DAMAGE,
			isBuff						= true,
			min_targets_count			= 1,
			ui_ico = {
				target_system 			= { tex = "ItemSubtype_SilentHunter", },
			},
		},
	},
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaWebStatic", },
	},
}

Spell.Spell_SilentHunter_ResDecAndClean =
{
	influence 				= ai.Spell.CAST_SPELLS,
	spells					= { 'Spell_SilentHunter_ResDec', 'Spell_SilentHunter_Clean', 'Spell_SilentHunter_ResInc' }
}

Spell.Spell_SilentHunter_ResDec =
{
	target = { 
		target 					= ai.SpellTargetGeneral.CONTEXT_TARGET, 
	},
	aura 						= ai.Aura.RESIST_ALL_DEC,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 50,
	
	duration 					= 12,
	isBuff						= false,
	ignore_subtype				= true,
	
	aura_fx						= "particles/gadget/resist_hull_dec",
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_SilentHunter", },
	},
}

Spell.Spell_SilentHunter_ResInc =
{
	aura 						= ai.Aura.RESIST_ALL,
	aura_target					= ai.SpellTarget.CASTER,
	
	aura_param					= 30,
	
	duration 					= 12,
	isBuff						= true,
	ignore_subtype				= true,
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_SilentHunter", },
	},
}

Spell.Spell_SilentHunter_Clean =
{
	influence 					= ai.Spell.DISPELL,
	target =
	{
		target					= ai.SpellTargetGeneral.CASTER,
	},
	
	itemSubTypes				= { ItemSubtype.SilentHunter },
}

Spell.Spell_SpecialRestore =
{
	target 						= ai.SpellTarget.CASTER,
	aura 						= ai.Aura.HEALING_MOD,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 1,
	
	duration 					= 18,
	isBuff						= true,
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_SpecialRestore", },
	},
}

Spell.Spell_DoubleThermalShotgun = 
{
	target =
	{
		target 					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class					= ai.SpellTargetClass.SHIP,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality				= ai.SpellTargetVitality.ALIVE,
	},
	aura 						= ai.Aura.SLOW_MANEUVER,
	aura_target 				= ai.SpellTarget.HOLDER,
	
	aura_param					= 0.3,
	
	duration					= 7,
	isBuff						= false,
	apply_crowd_control_coef	= true,
	
	aura_fx						= "particles/gadget/slow_movement",
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_DoubleThermalShotgun", },
	},
}

Spell.BlackRelayRace_H =
{
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	
	aura_target 	= 	{
		class   		= ai.SpellTargetClass.SHIP,
		signature		= ai.SignatureMask.HUGE,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.NEUTRAL,
		ai         		= ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality    	= ai.SpellTargetVitality.ALIVE,

	},
	aura_range		= 400,
	
	isBuff				= false,
	aura_param 			= 100,
	period				= 1,
	duration			= 1,
	gameplay_specific	= true,
	hud_visible			= false,
	
	additional_auras =
	{
		{
			aura_target 	= 	{
				class   		= ai.SpellTargetClass.SHIP,
				signature		= ai.SignatureMask.HUGE,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.NEUTRAL,
				ai         		= ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
				vitality    	= ai.SpellTargetVitality.ALIVE,
			},
			aura 		= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
			aura_range	= 200,
			isBuff 		= true,
			aura_param	= 200000,
			duration	= 1,
			period		= 0.5,
			ui_ico 		= {target_system = { tex = "ItemSubtype_DoubleThermalShotgun", },},
		},
	},
}

Spell.Spell_CloakingDeviceRage_Overcharge =
{
	target 						= ai.SpellTarget.CASTER,
	aura 						= ai.Aura.OVERCHARGE,
	aura_target					= ai.SpellTarget.HOLDER,
	
	aura_param					= 0.2,
	
	duration 					= 5,
	isBuff						= true,
	
	aura_fx						= "particles/gadget/overdrive",
	aura_apply_fx				= "particles/gadget/aura_breacktrough",
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_TimeBoost", },
	},
}

Spell.Spell_CloakingDeviceRage_Stealth =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 18,
	isBuff			= true,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CloakingDevice", },
	},

	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,
}

Spell.ThrasherDrones_Heal =
{
	target				= ai.SpellTarget.ALLY_SHIPS_AROUND,
	target_range 		= 100,
	influence 			= ai.Spell.HEAL_SHIELD_SCALED,
	influence_param		= 3000,
	chance				= 0.5,
	cast_fx				= "particles/gadget/aura_wave",
}

Spell.ThrasherDrones_Blastwave =
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= {
				target 			= ai.SpellTargetGeneral.INFLICTOR,
				misc	= ai.SpellTargetMisc.POSITION,
				},
	aura_target		= {
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.OWNED_BY_SHIP,
				},
	aura_range		= 40,
	aura_param		= 8000, --10000
	duration		= 0.3,
	period			= 0.5,
	isBuff			= false,
	hud_visible		= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_ThrasherDrones", }, },

	--aura_fx 		= "particles/explosions/explosion_big4",
	cast_position_fx= "particles/explosions/explosion_big4",

	cast_sound		= "sound/explosion/big_rocket_expl",
	chance			= 0.7,
	scale_on_weapon			= true,
}

Spell.Spell_ThrasherGun_SpawnHealScrap = 
{
	influence			= ai.Spell.SPAWN_ENTITY,
	target =
	{
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
	},
	
		-- target			= {
				-- target 			= ai.SpellTargetGeneral.INFLICTOR,
				-- misc	= ai.SpellTargetMisc.POSITION,
		-- },
	
	spawn_def			= "HealScrap_ThrasherGun",
}

Spell.Spell_HealScrap_ThrasherGun = 
{
	isBuff				= true,
	--gameplay_specific		= true,
	influence			= ai.Spell.APPLY_AURA,
	aura				= ai.Aura.HEALTH_MOD,
	aura_param			= 0.05,
	duration			= 60,
	
	target 				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
			misc				=  ai.SpellTargetMisc.NEAREST,
		},
	aura_range			= 50,
	can_stack			= true,
	max_stacks			= 5,
	cast_fx						= "particles/gadget/matter_absorber_uncirculated",
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_ThrasherGun", }, },
}

Spell.Spell_ThrasherGate = {
	influence			= ai.Spell.CAST_SPELLS,
	
	target = {
		--target 					= ai.SpellTargetGeneral.LOCKED_TARGET,
		class					= ai.SpellTargetClass.SHIP,
		--class					= ai.SpellTargetClass.OWNED_BY_SHIP,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area					= ai.SpellTargetArea.IN_CONE,
		misc 					= ai.SpellTargetMisc.VISIBLE_BY_CASTER + ai.SpellTargetMisc.NOT_CLOAKED,
		vitality 				= ai.SpellTargetVitality.ALIVE,
	},
	target_extra_radius	= 70,
	target_range		= 500,
	aura_target 	= ai.SpellTargetGeneral.CASTER,
	hud_visible 	= false,
	min_targets_count			= 1,
	spells				= { 'Spell_ThrasherGate_Cast', 'Spell_ThrasherGate_Boost' }
}

Spell.Spell_ThrasherGate_Cast =
{
	target 	= ai.SpellTargetGeneral.CASTER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "Spell_ThrasherGate_Aim",
	duration		= 2.5,
	period			= 0.2,
	min_targets_count	 = 1,
	aura_execution_delay = 1.7,
	--ignore_subtype	= true,
	hud_visible 	= false,
	isBuff			= true,
	dispell_flag	= ai.Dispell.ON_COLLISION,
	--aura_sound 		= "sound/gadgets/MovementRestrictor/alarm",
	--aura_target_fx		= "particles/gadget/special/doctor_damage_debuff",
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_ThrasherActive", },
	},
}

Spell.Spell_ThrasherGate_Aim =
{
	target = {
		--target 					= ai.SpellTargetGeneral.LOCKED_TARGET,
		class					= ai.SpellTargetClass.SHIP,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area					= ai.SpellTargetArea.IN_CONE,
		misc 					= ai.SpellTargetMisc.VISIBLE_BY_CASTER + ai.SpellTargetMisc.NOT_CLOAKED + ai.SpellTargetMisc.NEAREST,
		vitality 				= ai.SpellTargetVitality.ALIVE,
	},
	target_extra_radius	= 20,
	target_range		= 350,
	--aura_target_offset
	fixed_cylinder_target	= false,
	aura 						= ai.Aura.SHIP_ATTRACTION,
	aura_target					= ai.SpellTarget.CASTER,
	aura_range					= 200,
	--aura_execution_delay 		= 2.5,
	aura_param					= 117,
	duration 					= 0.3,
	
	isBuff						= true,
	min_targets_count			= 1,
	
	dispell_flag	= ai.Dispell.ON_COLLISION,
	
	--aura_fx		= "particles/gadget/special/doctor_damage_debuff",
	--aura_start_sound	= "sound/gadgets/stealth_on",
	--aura_end_sound		= "sound/gadgets/stealth_off",
	
	ui_ico =
	{
		target_system 			= { tex = "ItemSubtype_ThrasherActive", },
	},
}

Spell.Spell_ThrasherBooster =
{
	target 			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.FORCE_BOOST,

	duration		= 2.5,
	disable_aura_duration 	= true,
	hud_visible				= false,
	isBuff					= true,
	gameplay_specific 		= true,
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_ThrasherActive" } },
	
	--work_beam_fx = "particles/gadget/forcebooster_cone_beam",
	--aura_target_fx = "particles/gadget/lightnings_debuff",
	
	--aura_sound = "sound/aura/engine_hack",
	--ray_sound 		= "sound/aura/salut_EnergyVamp",
	
	additional_auras = 
	{
		{ -- Снижение скорости поворотов корабля
			target 			= ai.SpellTarget.CASTER,
			isBuff					= true,
			hud_visible				= false,
			gameplay_specific 		= true,
			aura			= ai.Aura.SLOW_MANEUVER,
			duration		= 2.5,
			aura_param 		= 8,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ThrasherActive" } }
		},
		{ -- Увеличение скорости корабля
			target 			= ai.SpellTarget.CASTER,
			hud_visible				= false,
			isBuff					= true,
			aura			= ai.Aura.FAST_MOVEMENT,
			dispell_flag	= ai.Dispell.ON_COLLISION,
			duration		= 5,
			aura_param 		= 8,
			aura_param_add  = -1,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ThrasherActive" } }
		},
		{
			aura 				= ai.Aura.COLLISION_IMMUNE,
			target				= ai.SpellTarget.CASTER,  
			aura_target 		= ai.SpellTarget.HOLDER,
			duration			= 6,
			isBuff				= true,
			ui_ico = { target_system 	= { tex = "ItemSubtype_ThrasherActive", }, },
		},
	},
}

Spell.Spell_ThrasherGate_Boost =
{
	target 			= ai.SpellTarget.CASTER,
	hud_visible		= false,
	isBuff			= true,
	aura			= ai.Aura.CONTACT_DAMAGE_MOD,
	duration		= 4,
	aura_param 		= 1.5,
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_ThrasherActive" } },
	
	additional_auras = 
	{
		{ -- Снижение скорости поворотов корабля
			target 			= ai.SpellTarget.CASTER,
			isBuff					= true,
			hud_visible				= false,
			gameplay_specific 		= true,
			aura			= ai.Aura.FAST_MANEUVER,
			dispell_flag	= ai.Dispell.ON_COLLISION,
			duration		= 2.5,
			aura_execution_delay 		= 2.5,
			aura_param 		= 2,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_ThrasherActive" } },
		},
	},
}

Spell.MicroWarp_Winter_Drive = --разгон
{
	target 			= {
		target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION,
	},
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_target = 
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	spell_on_cancel	= "MicroWarp_Winter_Drive1",
	aura_range 		= 100,
	duration		= 2.5,
	aura_param		= 100,
	--aura_param_add	= 10,
	--aura_holder_def		= "CageTrapMineActiveHolder",
	aura_holder_offset = Vec3( 0, 0, -10 ),
	aura_holder_attach_bone = "root",
	check_spawn_collision = true,
	isBuff			= true,
	hud_visible		= false,
	
	additional_auras = 
	{
		{
			target			= ai.SpellTarget.CASTER,
			aura_target = 
			{
				target = ai.SpellTargetGeneral.CASTER,
			},
			aura 			= ai.Aura.DISABLE_WARP,
			--gameplay_specific = true,
			hud_visible		= false,
			duration		= 2.5,
			isBuff			= true,
			dispell_flag	= ai.Dispell.ON_COLLISION + ai.Dispell.ON_MODULE,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_MicroWarp_Winter" } },
		},
		{
			target			= ai.SpellTarget.CASTER,
			aura_target = 
			{
				target = ai.SpellTargetGeneral.CASTER,
			},
			aura 			= ai.Aura.DISABLED_WEAPON,
			--gameplay_specific = true,
			hud_visible		= false,
			duration		= 2.5,
			isBuff			= true,
			dispell_flag	= ai.Dispell.ON_COLLISION + ai.Dispell.ON_MODULE,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_MicroWarp_Winter" } },
		},
		{
			target			= ai.SpellTarget.CASTER,
			aura_target = 
			{
				target = ai.SpellTargetGeneral.CASTER,
			},
			aura 			= ai.Aura.FORCE_BOOST,
			--gameplay_specific = true,
			hud_visible		= false,
			duration		= 2.5,
			isBuff			= true,
			dispell_flag	= ai.Dispell.ON_COLLISION + ai.Dispell.ON_MODULE,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_MicroWarp_Winter" } },
		},
	},
	
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_MicroWarp_Winter", },
	},
	dispell_flag	= ai.Dispell.ON_COLLISION + ai.Dispell.ON_MODULE,
	--aura_start_sound 	= "sound/gadgets/EmergencyBarrier",
	--aura_start_sound = "sound/gadgets/ReverseThruster_activate",
	
}
Spell.MicroWarp_Winter_Drive1 = -- торможение
{
	target 			= {
		target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION,
	},
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_target = 
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_range 		= 100,
	duration		= 1, --1, --3
	aura_param		= 50,
	aura_param_add	= -50,
	aura_holder_offset = Vec3( 0, 0, -50 ),
	aura_holder_attach_bone = "root",
	--check_spawn_collision = true,
	hud_visible		= false,
	isBuff			= true,
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_MicroWarp_Winter", },
	},
	
	--aura_start_sound 	= "sound/gadgets/EmergencyBarrier",
	--aura_start_sound = "sound/gadgets/ReverseThruster_activate",
}
Spell.MicroWarp_Winter_Radar = --разгон
{
	target = 
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura			= ai.Aura.UNTOUCHABLE,
	aura_target = 
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	duration		= 0.1,
	isBuff			= true,
	hud_visible		= false,
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_MicroWarp_Winter", },
	},
	dispell_flag	= ai.Dispell.ON_COLLISION,
	
	additional_auras = 
	{
		{ -- Оставлят за собой облака дебафов
			influence		= ai.Spell.APPLY_AURA,
			target			= ai.SpellTarget.CASTER,
			aura 			= ai.Aura.CAST_SPELL_PERIODIC,
			target_spell	= "MicroWarp_Winter_Cold",
			duration		= 2.5,
			period			= 0.5,
			isBuff			= true,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_MicroWarp_Winter" } },
			dispell_flag	= ai.Dispell.ON_COLLISION + ai.Dispell.ON_MODULE,
			
			aura_fx			= "particles/gadget/cold_emission",
		},
	},
}

Spell.MicroWarp_Winter_Cold =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
	aura_range 		= 5,
	aura_range_add	= 19,
	aura_range_add_max = 100,
	aura_param		= 1,
	aura_param_add	= -0.06,
	duration		= 9,
	period 			= 0.5,
	isBuff			= false,
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_MicroWarp_Winter" } },
	
	nebula = "Effects_Nebula_Snow",
	cast_position_fx = "particles/gadget/cold_sphere_big",
	aura_target_fx	= "particles/gadget/slow_movement",
}

Spell.TyphonGun_Overcharge = { -- форсирование систем корабля
	duration			= 3,
	target =
	{
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship		= ai.SpellTargetRelationship.ENEMY,
	},
	aura				= ai.Aura.DAMAGE_MOD,
	aura_target			= ai.SpellTarget.CASTER,
	isBuff				= true,
	aura_param			= 0.02,
	can_stack			= true,
	max_stacks			= 10,
	
	ui_ico 				=
		{
			target_system = { tex = "ItemSubtype_TyphonGun", },
		},
	
	gun_spell_fx	= "particles/gadget/gun_buff_typhon",
}


Spell.TyphonActive =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.INVULNERABILITY,
	aura_target		= ai.SpellTarget.CASTER,
	isBuff			= true,
	duration		= 2,
	ui_ico 			= { target_system = { tex = "ItemSubtype_TyphonActive", }, },
	aura_fx				= "particles/gadget/invulnerability",
	
	additional_auras = 
	{
		{
			target				= ai.SpellTarget.CASTER,
			aura				= ai.Aura.HEAL_HULL_PERIODIC,
			aura_target			= ai.SpellTarget.HOLDER,
			isBuff				= true,
			aura_param			= 1800,
			duration			= 1,
			period				= 1,
			ui_ico 	= { target_system = { tex = "ItemSubtype_TyphonActive", }, },
		},
		{
			aura_execution_delay = 1, -- чтобы запускалось после спела с лечением
			target				= ai.SpellTarget.CASTER,
			aura				= ai.Aura.HEALING_MOD,
			aura_target			= ai.SpellTarget.HOLDER,
			isBuff				= false,
			gameplay_specific	= true,
			aura_param			= -1.5,
			duration			= 5,
			ui_ico 	= { target_system = { tex = "ItemSubtype_TyphonActive", }, },
		},
	},
}

Spell.TyphonCharge_AddDamage = { -- форсирование систем корабля
	--duration			= 1.5,
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.DAMAGE_MOD,
	aura_target			= ai.SpellTarget.CASTER,
	isBuff				= true,
	aura_param			= 0.4,
	can_stack			= true,
	--max_stacks			= 3,
	duration			= 6,
	ui_ico 	= { target_system = { tex = "ItemSubtype_TyphonCharge", }, },
		
	aura_main_fx					= "particles/gadget/damage_buff_typhon",
	aura_end_sound				= "sound/gadgets/timeboost_end",
	
	additional_auras = 
	{
		{
			target				= ai.SpellTarget.CASTER,
			aura				= ai.Aura.DISPERSION_MOD,
			aura_target			= ai.SpellTarget.CASTER,
			isBuff				= true,
			aura_param			= -0.4,
			--gameplay_specific	= true,
			duration			= 6,
			ui_ico 	= { target_system = { tex = "ItemSubtype_TyphonCharge", }, },
		},
		{
			target				= ai.SpellTarget.CASTER,
			aura				= ai.Aura.FIRE_RATE_MOD,
			aura_target			= ai.SpellTarget.CASTER,
			isBuff				= true,
			aura_param			= 0.4,
			--gameplay_specific	= true,
			duration			= 6,
			ui_ico 	= { target_system = { tex = "ItemSubtype_TyphonCharge", }, },
		},
		{
			target				= ai.SpellTarget.CASTER,
			aura				= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
			aura_target			= ai.SpellTarget.CASTER,
			isBuff				= true,
			aura_param			= 0.4,
			--gameplay_specific	= true,
			duration			= 6,
			ui_ico 	= { target_system = { tex = "ItemSubtype_TyphonCharge", }, },
		},
	},
}

Spell.StormGun_Flame =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'StormGun_Flame1', 'StormGun_Flame_H' }
}

Spell.StormGun_Flame1 = 
{
	aura 					= ai.Aura.DAMAGE_THERMAL_SCALED,
	-- target 					= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
	target = {
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		signature			= ai.SignatureMask.TINY + ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM + ai.SignatureMask.LARGE, --1.75
		damageability  		= ai.SpellTargetDamageability.DAMAGEABLE,
		class 		        = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
	},
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff					= false,
	aura_param				= 90,
	duration				= 3.2,
	period 					= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_StormGun", },
	},
	aura_target_fx = "particles/gadget/damage_thermal",
	
}

Spell.StormGun_Flame_H = 
{
	aura 					= ai.Aura.DAMAGE_THERMAL_SCALED,
	-- target 					= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
	target = {
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		signature			= ai.SignatureMask.HUGE, --1.75
		damageability  		= ai.SpellTargetDamageability.DAMAGEABLE,
		class 		        = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
	},
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff					= false,
	aura_param				= 175,
	duration				= 3.2,
	period 					= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_StormGun", },
	},
	aura_target_fx = "particles/gadget/damage_thermal",
}	

Spell.Spell_LaserBasic_Pirate = 
{
	aura 					= ai.Aura.SPY_DRONE,
	-- target 					= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
	target = {
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		--signature			= ai.SignatureMask.HUGE, --1.75
		damageability  		= ai.SpellTargetDamageability.DAMAGEABLE,
		class 		        = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
	},
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff					= false,

	 duration				= 5,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LaserBasic_4", },
	},
	aura_target_fx = "particles/gadget/damage_thermal",
}	

Spell.Sneeze_1 =	--Курсовой пирлуч для крыхи БП Весна 2023
{
	target					= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura 					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class         		 = ai.SpellTargetClass.SHIP --корабли
							 + ai.SpellTargetClass.TURRET  --турели
							 + ai.SpellTargetClass.CARGOSHIP --каргошипы
							 + ai.SpellTargetClass.TORPEDO --вроде как торпеды в бзс
							 + ai.SpellTargetClass.GUIDED_DRONE --дроны
							 + ai.SpellTargetClass.BATTLE_STATION, -- боевые станции
		area          		 = ai.SpellTargetArea.IN_CYLINDER,
		relationship  		 = ai.SpellTargetRelationship.ENEMY
							 + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_holder_def			= "Sneezer",  --вызывает объект
	aura_holder_attach_bone	= "root",	--кость к которй крепится объект
	aura_holder_offset		= Vec3( 0, 0, -1 ), -- начальная точка откуда пойдет луч относительно кастера

	aura_range				= 200, --длина луча х10м
	aura_extra_radius		= 8, --радиус луча х10м

	aura_param				= 100,
	duration 				= 1,
	period					= 0.2,
	isBuff					= false,
	hud_visible				= false, --отображение иконки в строке дебафов
	
	fixed_cylinder_target	= false,
	aura_target_offset		= Vec3( 0, 0, -1 ), --направление луча

	work_beam_fx			= "particles/weapons/laser/tach_ray_big_1",
	cast_sound	 			= "sound/destroyer/TRay_beam",

	
	holder_spell_in_the_end	= 	"Sneeze_2", --"каст спела после окончания луча 1",
	
}

Spell.Sneeze_2 =
{
	target					= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura 					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = 
	{
		class         		 = ai.SpellTargetClass.SHIP --корабли
							 + ai.SpellTargetClass.TURRET  --турели
							 + ai.SpellTargetClass.CARGOSHIP --каргошипы
							 + ai.SpellTargetClass.TORPEDO --вроде как торпеды в бзс
							 + ai.SpellTargetClass.GUIDED_DRONE --дроны
							 + ai.SpellTargetClass.BATTLE_STATION, -- боевые станции
		area          		 = ai.SpellTargetArea.IN_CYLINDER,
		relationship  		 = ai.SpellTargetRelationship.ENEMY
							 + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_holder_def			= "Sneezer",
	aura_holder_attach_bone	= "root",
	aura_holder_offset		= Vec3( 0, 0, -1 ),

		aura_range				= 300, --длина луча х10м
	aura_extra_radius		= 8, --радиус луча х10м

	aura_param				= 2000,
	duration 				= 2,
	period					= 0.5,
	isBuff					= false,
	hud_visible				= false,
	
	fixed_cylinder_target	= false,
	aura_target_offset		= Vec3( 0, 0, -1 ), --направление луча
	
	nebula 			= "Effects_Nebula_TachRay",
	work_beam_fx			= "particles/weapons/laser/tach_ray_2",
	cast_sound	 			= "sound/destroyer/TRay2_beam",
	
}

Spell.Dinoshell_ResistAdd = 
{
	aura 		= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 	= 15,
	can_stack	= true,
	duration 	= 40,
	max_stacks	= 10,
	isBuff 		= true,
	target 		= ai.SpellTarget.CASTER,
	aura_target = ai.SpellTarget.HOLDER,
	ui_ico = { target_system = { tex = "ItemSubtype_Dinoshell", }, },
	
	additional_auras = -- это собирает стаки
	{
		{
			influence	= ai.Spell.APPLY_AURA,
			aura		= ai.Aura.CHARGE_SPELL,
			target		= ai.SpellTarget.CASTER,
			aura_target	= ai.SpellTarget.CASTER,
			hud_visible	= false,
			max_stacks	= 10,
			duration 	= 40,
			aura_param	= 1.8,
			isBuff		= true,

			ui_ico =
			{
				target_system	= { tex = "ItemSubtype_Dinoshell", },
			},
		},
	},
}

Spell.Dinoshell_HealShield = 
{
	aura = ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param = 100,
	duration = 5,
	period			= 1,
	isBuff = true,
	target = ai.SpellTarget.CASTER,
	aura_target = ai.SpellTarget.HOLDER,
	ui_ico = { target_system = { tex = "ItemSubtype_Dinoshell", }, },
	additional_auras =
	{
		{
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FAST_MOVEMENT,
			aura_param		= 0.35,
			duration		= 15,
			period			= 1,
			aura_param_add	= -0.023, --0.035
			ignore_additional_power = true,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
			},
		},
	},
}

Spell.Dinoshell_Clean = 
{
	influence 					= ai.Spell.DISPELL,
	target 						= ai.SpellTarget.CASTER,
	itemSubTypes				= { ItemSubtype.Dinoshell },
}


Spell.DinoGun =
{
	duration		= 1,

	isBuff 			= false,
	target 			= { class = ai.SpellTargetClass.SHIP
							  + ai.SpellTargetClass.TURRET
							  + ai.SpellTargetClass.CARGOSHIP
							  + ai.SpellTargetClass.VITALPOINT_TURRET
							  + ai.SpellTargetClass.BATTLE_STATION,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						area			= ai.SpellTargetArea.AROUND,
					  },
	
	aura			= ai.Aura.BROKEN_WEAPON,
	aura_param		= 1800,
	mod_range		= 1,
	target_range	= 1,
	aura_range		= 1,
	
	gun_spell_fx	   = "particles/gadget/weapon_instability",
	gun_spell_fire_fx  = "particles/gadget/weaponhacker_gun_explosion",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DinoGun", },
	},
	

}

Spell.ChargableGun_NoHeat = 
{
	target				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.REDUCE_COOLING,
	aura_param			= 5000,
	duration			= 0.5,
	isBuff				= true,
	hud_visible			= false,
	ignore_additional_power = true,
	gameplay_specific	= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_BubbleGun", }, },
}

Spell.PlasmaWebNyx_add_charge =
{
	influence	= ai.Spell.APPLY_AURA,
	aura		= ai.Aura.CHARGE_SPELL,
	target		= ai.SpellTarget.CASTER,
	aura_target	= ai.SpellTarget.CASTER,
	hud_visible	= false,
	max_stacks	= 10,
	duration 	= 7,
	aura_param	= 1,
	isBuff		= true,

}

Spell.PlasmaWebNyx =

{
	target 			= --только вражеские корабли
		{
			target			= ai.SpellTargetGeneral.LOCKED_TARGET,
			class			= ai.SpellTargetClass.SHIP --корабли
							 + ai.SpellTargetClass.TURRET  --турели
							 + ai.SpellTargetClass.CARGOSHIP --каргошипы
							 + ai.SpellTargetClass.TORPEDO --вроде как торпеды в бзс
							 + ai.SpellTargetClass.GUIDED_DRONE --дроны
							 + ai.SpellTargetClass.BATTLE_STATION, -- боевые станции
			--area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		},
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target 	= ai.SpellTarget.HOLDER,
	target_range 	= 200,
	aura_param		= 120,
	period			= 1,
	--min_speed_percent	= 0.80,
	isBuff			= false,
	duration 		= 8,
	
	can_stack	= true,
	max_stacks	= 10,
	
	activate_beam_fx = "particles/gadget/plasma_web_beam",
	period_module_fx = "particles/gadget/plasma_web_module",
	period_module_my_fx = "particles/gadget/plasma_web_module",
	aura_apply_fx	= "particles/gadget/aura_breacktrough",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaWeb", },
	},
	--use_dead_engine_effects = true,
	aura_sound 		= "sound/gadgets/MovementRestrictor/alarm",
}

Spell.MicroWarp_sai_Stealth =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 6,
	isBuff			= true,
--	aura_fx			= "particles/test/continuous_3",
	aura_end_sound = "sound/gadgets/stealth_off",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MicroWarp_Sai", },
	},
	-- изменения в от #64709
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,
}

Spell.Ronin_Stealth =
{
	duration		= 12,
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.STEALTH,
	aura_target 	=
			{
				class = ai.SpellTargetClass.SHIP,
				area = ai.SpellTargetArea.AROUND,
				relationship = ai.SpellTargetRelationship.ALLY,
				misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
	aura_range		= 250,

	aura_fx 		= "particles/gadget/shelter_shield",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Ronin_Stealth", },
	},

	uiName 			= "Spell_ShelterField_friendlyPart",
	uiDesc 			= "Spell_ShelterField_friendlyPart_Desc",
}

Spell.Caltrop_MineStun =
{
	aura			= ai.Aura.STASIS,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET,
		area           = ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_range		= 75,
	duration		= 5,
	
	isBuff			= false,	
	
	aura_fx 		= "particles/weapons/staticrocket/rocket_spell_shield",
	ui_ico =
	{
		target_system 	= { tex = "anomaly_deathstar_damage_ico", },
	},
}

Spell.Peregrine_Emissions =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "Peregrine_EmissionsCharge",
	duration		= 5,
	period			= 0.5,
	isBuff			= true,
	--aura_fx			= "particles/gadget/fueldrop",
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_Peregrine_Emissions" } },

}

Spell.Peregrine_EmissionsCharge =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura			= ai.Aura.DISABLE_LOCK,
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					},
	aura_range 		= 25,
	aura_range_add	= (50-25)/(6/0.5),
	aura_param		= 10,
	aura_param_add	= -0.2,
	duration		= 10,
	period 			= 0.5,
	
	isBuff			= false,
	nebula			= "Effects_Nebula_Spacedust",
	--cast_position_fx	= "particles/gadget/fueldrop_sphere_big",
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_Peregrine_Emissions" } },
	
	additional_auras = 
	{ 
	  {
		target 			= { 
							target = ai.SpellTargetGeneral.INFLICTOR, 
							misc = ai.SpellTargetMisc.POSITION 
						  },
		aura			= ai.Aura.RESIST_ALL_DEC,
		aura_target		=
					{
						class = ai.SpellTargetClass.SHIP,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					},
		aura_range 		= 25,
		aura_range_add	= (50-25)/(6/0.5),
		aura_param		= 35,
		--aura_param_add	= -0.2,
		duration		= 10,
		period 			= 0.5,
		isBuff			= false,
		ui_ico 		= { target_system 	= { tex = "ItemSubtype_Peregrine_Emissions" } },
	   },	
	},
}

Spell.Peregrine_debuff = 
{
	--influence		= ai.Spell.RESIST_ALL_DEC,
	aura 			= ai.Aura.RESIST_ALL,

	duration 		= 10,--7,
	aura_param		= 35,
	isBuff			= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_Peregrine_Emissions", }, },
}	

Spell.Cyning_Capturer = {
	influence		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.CAPTURE_SPEED_MOD,

	duration 		= 7,--7,
	aura_param		= 30,
	isBuff			= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_Cyning_Capturer", }, },
	
	aura_fx			= "particles/gadget/capture_aura",
	
}

Spell.Cyning_Capturer1 = {
	influence		= ai.Spell.SLOW_MANEUVER,
	aura 			= ai.Aura.SLOW_MANEUVER,

	duration 		= 7,--7,
	aura_param		= 0.25,
	isBuff			= false,
	gameplay_specific	= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_Cyning_Capturer", }, },

	
	additional_auras =
	{
	
		{
		influence		= ai.Spell.SLOW_MOVEMENT,
		aura 			= ai.Aura.SLOW_MOVEMENT,

		duration 		= 7,--7,
		aura_param		= 0.25,
		isBuff			= false,
		gameplay_specific	= true,
	
		ui_ico 			= { target_system = { tex = "ItemSubtype_Cyning_Capturer", }, },
		},
	},
}

Spell.KrakenMode = 
{
	aura			= ai.Aura.DAMAGE_REDUCE_WITH_DISTANCE,
	target			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	
	aura_param 		= 400, -- добавил дальности с 8 км будет только четверть урона, с 2км будет полный урон, с 6 - половина
	
	isBuff			= true,	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KrakenMode", },
	},
	additional_auras = 
	{
		{ -- Снижение резистов
			aura			= ai.Aura.HULL_RESIST_ALL_DEC,
		
			aura_param 		= 20,
			isBuff					= false,
			ignore_additional_power = true,
			gameplay_specific 		= true,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_KrakenMode" } },
		},
		
	},
}

Spell.KrakenMode_dec =
{
	aura			= ai.Aura.HULL_RESIST_ALL_DEC,
	target			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	duration		= 2,
	aura_param 		= 20,
	isBuff					= false,	
	ignore_additional_power = true,
	gameplay_specific 		= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KrakenMode", },
	},
}

Spell.SawOne_FireRate =
{

	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura  			= ai.Aura.FIRE_RATE_MOD,
	aura_target 	=
			{
				class = ai.SpellTargetClass.SHIP,
				area = ai.SpellTargetArea.AROUND,
				relationship = ai.SpellTargetRelationship.ALLY,
				--misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
	aura_range		= 300,
	aura_param		= 0.3,
	duration		= 6,

	

	aura_fx 		= "particles/gadget/shelter_shield",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SawOne_FireRate", },
	},

	uiName 			= "Spell_ShelterField_friendlyPart",
	uiDesc 			= "Spell_ShelterField_friendlyPart_Desc",
}

Spell.SawOne_RangeMode =
{
		target			= ai.SpellTarget.CASTER,
		isBuff			= true,
		aura  			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
		aura_target 	=
			{
				class = ai.SpellTargetClass.SHIP,
				area = ai.SpellTargetArea.AROUND,
				relationship = ai.SpellTargetRelationship.ALLY,
				--misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
			},
		aura_range		= 300,
		aura_param		= 0.3,
		duration		= 6,
		
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SawOne_FireRate", },
	},

	--uiName 			= "Spell_ShelterField_friendlyPart",
	--uiDesc 			= "Spell_ShelterField_friendlyPart_Desc",
}

Spell.MjolnirHook_charge =
{
	influence	= ai.Spell.APPLY_AURA,
	aura		= ai.Aura.CHARGE_SPELL,
	target		= ai.SpellTarget.CASTER,
	aura_target	= ai.SpellTarget.CASTER,
	hud_visible	= false,
	max_stacks	= 10,
	duration 	= 4,
	aura_param	= 1,
	isBuff		= true,

}

Spell.MjolnirHook =

{
	target 			= --только вражеские корабли
		{
			target			= ai.SpellTargetGeneral.LOCKED_TARGET,
			class			= ai.SpellTargetClass.SHIP --корабли
							 + ai.SpellTargetClass.TURRET  --турели
							 + ai.SpellTargetClass.CARGOSHIP --каргошипы
							 + ai.SpellTargetClass.TORPEDO --вроде как торпеды в бзс
							 + ai.SpellTargetClass.GUIDED_DRONE --дроны
							 + ai.SpellTargetClass.BATTLE_STATION, -- боевые станции
			--area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		},
	aura 			= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_target 	= ai.SpellTarget.HOLDER,
	target_range 	= 150,
	aura_param		= 2000,
	period			= 2,
	--min_speed_percent	= 0.80,
	isBuff			= false,
	duration 		= 1,
	
	can_stack	= true,
	max_stacks	= 10,
	
	aura_fx = "particles/explosions/explosion_big1",
	cast_sound 		= "sound/explosion/big_rocket_expl",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MjolnirHook", },
	},
	--use_dead_engine_effects = true,
	
}

Spell.HealFlow =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	
	aura 			= ai.Aura.HEAL_SHIELD_PERIODIC,

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},

	fixed_cylinder_target = false,
	aura_extra_radius = 35,
	aura_range		= 350,
	aura_param		= 500,   --x2

	duration 		= 7, --0.2,
	period			= 0.5,
	isBuff			= true,
	
	
	work_beam_fx	= "particles/weapons/horror_howl_beam/beam",
	--ray_sound 		= "sound/destroyer/TRay_beam",
	aura_sound 		= "sound/aura/heal",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MatterFlow", },
	},
}

Spell.HealSheeldFlow = 
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	
	aura 			= ai.Aura.HEAL_HULL_PERIODIC,

		aura_target 	= 	
			{
			class			= ai.SpellTargetClass.SHIP,
			relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
			vitality		= ai.SpellTargetVitality.ALIVE,
			area			= ai.SpellTargetArea.IN_CONE,
			misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
			},

		fixed_cylinder_target = false,
		aura_extra_radius = 35,
		aura_range		= 350,
		aura_param		= 500,   --x2

		duration 		= 7, --0.2,
		period			= 0.5,
		isBuff			= true,
		
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MatterFlow", },
	},
}

Spell.Palom_PhaseShield_Buff =
{
	aura			= ai.Aura.FIRE_RATE_MOD,
	aura_param		= 0.2,
	duration		= 5,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PalomShield", },
	},
}

Spell.Palom_PhaseShield_1 =
{
	inherit = "PhaseShield_Phase1",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PalomShield_Phase2", },
	},
}

Spell.Palom_PhaseShield_2 =
{
	inherit = "PhaseShield_Phase0",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PalomShield", },
	},
}

Spell.Palom_PhaseShield_3 =
{
	inherit = "PhaseShield_Phase2",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PalomShield__Phase1", },
	},
}


Spell.Bootlegger_warp_prep =
{
	aura			= ai.Aura.DEBUFF_IMMUNE, -- INVULNERABILITY
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target			= { target = ai.SpellTargetGeneral.HOLDER, },
	duration		= 0.6,
	
	spell_on_cancel	= "Bootlegger_warp1",
	
	isBuff				= true,
	--gameplay_specific	= false,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Bootlegger_warp", },
	},
	
	-- cast_sound				= "sound/gadgets/legion_warp_prep",
	
	additional_auras =
	{
		{ 
			target 			= ai.SpellTarget.CASTER,
			isBuff					= true,
			hud_visible				= false,
			gameplay_specific 		= true,
			aura			= ai.Aura.SLOW_MANEUVER,
			duration		= 2.6,
			aura_param 		= 100,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_Bootlegger_warp" } },
		},
		{ 
			target 			= ai.SpellTarget.CASTER,
			isBuff					= true,
			hud_visible				= false,
			gameplay_specific 		= true,
			aura			= ai.Aura.SLOW_MOVEMENT,
			duration		= 2.6,
			aura_param 		= 100,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_Bootlegger_warp" } },
		},
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff					= true,
			hud_visible				= false,
			gameplay_specific 		= true,
			aura			= ai.Aura.DISABLED_WEAPON,
			duration		= 2.6,
			aura_param 		= 8,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_Bootlegger_warp" } },
		},
	},
}

Spell.Bootlegger_warp1 =
{
	target 			= {	target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION, },
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_target 	= {	target = ai.SpellTargetGeneral.CASTER, },
	spell_on_cancel	= "MicroWarp_Winter_Drive1",
	aura_range 		= 100,
	duration		= 2.0,
	aura_param		= 300,

	aura_holder_offset 		= Vec3( 0, 0, -10 ),
	aura_holder_attach_bone = "root",
	check_spawn_collision 	= true,
	isBuff					= true,
	hud_visible				= false,
	
	-- cast_sound				= "sound/gadgets/warpgate/ship_warp_out",
	-- cast_sound				= "sound/gadgets/warp_active",
	-- aura_end_sound			= "sound/gadgets/warp_stop",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Bootlegger_warp", },
	},
	
	additional_auras =
	{
		{ 
			target			= ai.SpellTarget.CASTER,
			aura_target		= {	target = ai.SpellTargetGeneral.CASTER, },
			aura 			= ai.Aura.FORCE_BOOST,
			--gameplay_specific = true,
			hud_visible		= false,
			duration		= 2.0,
			isBuff			= true,
			dispell_flag	= ai.Dispell.ON_COLLISION + ai.Dispell.ON_MODULE,
			ui_ico 		= { target_system 	= { tex = "ItemSubtype_Bootlegger_warp" } },
		},
		-- {
			-- target 			= ai.SpellTarget.CASTER,
			-- isBuff					= true,
			-- hud_visible				= false,
			-- --gameplay_specific 		= true,
			-- aura			= ai.Aura.ANTI_RADAR,
			-- duration		= 0.2,
			-- gameplay_specific 		= true,
		-- },
	},
}

Spell.Bootlegger_warp_NoBomb = 
{
			target 			= ai.SpellTarget.CASTER,
			isBuff					= true,
			hud_visible				= false,
			--gameplay_specific 		= true,
			aura			= ai.Aura.UNTOUCHABLE,
			duration		= 0.2,
			gameplay_specific 		= true,
			cast_position_fx = "particles/gadget/warp",
}

Spell.Spell_NoBomb = 
{
			target 			= ai.SpellTarget.CASTER,
			isBuff					= true,
			hud_visible				= false,
			--gameplay_specific 		= true,
			aura			= ai.Aura.UNTOUCHABLE,
			duration		= 0.2,
			gameplay_specific 		= true,
			
}

Spell.GravitationAnalyzer = -- базовый "анализатор гравиполя" для коммандников. настраивается в таблице
{

	aura_range		= 300,
	target			= ai.SpellTarget.CASTER,
	aura_target		=	
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ALLY,
	},
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 25,
	isBuff			= true,	

}



Spell.SeeressGun = --Спеллы на пушку Seeress
{
	influence=ai.Spell.CAST_SPELLS,
	spells={'SeeressGunShip','SeeressGunAsteroid'},
}

Spell.SeeressGunShip = 
{
	aura 						= ai.Aura.DAMAGE_EMP_PERIODIC,
	target =
	{
		target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		damageability  = ai.SpellTargetDamageability.DAMAGEABLE,
	},
	aura_param					= 250,
	aura_range					= 20,
	
	scale_on_weapon				= true,
	ignore_stacks	= true,
	
	duration					= 3,
	period						= 0.4,
			
	isBuff						= false,
			
	ui_ico =
	{
		target_system			= { tex = "ItemSubtype_SeeressGun", },
	},
			
	--aura_apply_fx				= "particles/gadget/aura_breacktrough",
	period_module_fx			= "particles/gadget/plasma_web_module",
	

}

Spell.SeeressGunAsteroid = 
{
			aura 		= ai.Aura.DAMAGE_EMP_PERIODIC,
			aura_target =
			{
				target					= ai.SpellTargetGeneral.CONTEXT_TARGET,
				class					= ai.SpellTargetClass.DESTROYABLE_ASTEROID,
			},
			aura_param					= 266,
			--aura_range					= 20,
	
			scale_on_weapon				= true,
			ignore_stacks	= true,
			asteroid_overheat_time_coef = 0.5,
			duration					= 7,
			period						= 0.35,
}

Spell.SeeresDrug_NoRadar =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.DISABLE_LOCK, --SLOW_MANEUVER
	duration		= 6,
	--period			= 0.5,
	--aura_param		= 0.01,--3,
	isBuff			= false,
	ignore_additional_power = true,
	gameplay_specific	= true,

	aura_fx 		= "particles/gadget/aura_wave",
	ui_ico			= 
	{
		target_system			= { tex = "ItemSubtype_SeeressDrug", },
	},
}

Spell.HeliconLHdamge_t5 = --Спеллы на дезинтегратор Геликона
{
	influence=ai.Spell.CAST_SPELLS,
	spells={'HeliconLDamge_t5','HeliconHDamge_t5'},
}

Spell.HeliconLDamge_t5 = 
{
			target					= 
			{ 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.LARGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 250,
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= false,
			duration				= 1.3,
			period 					= 0.4,
 			--aura_signature			= ai.SignatureMask.LARGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator_Helicon", },
			},
			
}

Spell.HeliconHDamge_t5 = 
{
			target					= 
			{ 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.HUGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 2250,
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= false,
			duration				= 1.3,
			period 					= 0.4,
 			--aura_signature			= ai.SignatureMask.LARGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator_Helicon", },
			},
}

Spell.HeliconModule = 
{
	aura			= ai.Aura.SNIPER_PROJECTILE_SPELL,
	target_spell 	= "HeliconModule1",
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	duration		= 10,
	one_shot = false,
	ignore_subtype			= false,
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= true,	
	ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_HeliconModule", },
		},

}

Spell.HeliconModule1 = 
{
	aura			= ai.Aura.DAMAGE_DEC,
	target			= {
						target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
						--target 			= ai.SpellTargetGeneral.INFLICTOR,
						--misc	= ai.SpellTargetMisc.POSITION,
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,

						},
	aura_target		= {
					target 			= ai.SpellTargetGeneral.HOLDER,
					},
	--aura_range 		= 30,
	--period			= 1.25,
	duration		= 7,
	aura_param		= 9,
	ignore_stacks	= false,
	ignore_subtype	= false,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HeliconModule", },
	},
	--aura_fx			= "particles/gadget/suicide_aura",
	--aura_sound 		= "sound/aura/voidzone",
}

Spell.Spell_Sparks_Cannon_Grim =
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.DAMAGE_KINETIC_PERIODIC,
	target =
	{
		target 					= ai.SpellTargetGeneral.INFLICTOR,
		misc 					= ai.SpellTargetMisc.POSITION,
	},
	aura_target =
	{
		class 					= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		area					= ai.SpellTargetArea.AROUND,
		relationship 			= ai.SpellTargetRelationship.ENEMY,
		signature				= ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM + ai.SignatureMask.LARGE,
	},
	
	aura_param					= 75,
	aura_range					= 30,
	duration					= 2,
	period						= 0.3,
	
	isBuff						= false,
	hud_visible 				= true,
	
	scale_on_weapon				= true,
	
	aura_fx						= "particles/weapons/other/sparks_cannon_spell",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SparksCannon", },
	},
	
	additional_auras = 
	{
		{
			aura 						= ai.Aura.DAMAGE_KINETIC_PERIODIC,
			aura_target =
			{
				class 					= ai.SpellTargetClass.SHIP,
				area					= ai.SpellTargetArea.AROUND,
				relationship 			= ai.SpellTargetRelationship.ENEMY,
				signature				= ai.SignatureMask.HUGE,
			},
			
			aura_param					= 200,
			aura_range					= 30,
			duration					= 2,
			period						= 0.3,
			
			isBuff						= false,
			hud_visible 				= true,
			
			scale_on_weapon				= true,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_SparksCannon", },
			},
		},
	},
}

Spell.ChargedInvisible_Charge = -- это собирает стаки
{
	influence	= ai.Spell.APPLY_AURA,
	aura		= ai.Aura.CHARGE_SPELL,
	target		= ai.SpellTarget.CASTER,
	aura_target	= ai.SpellTarget.CASTER,
	hud_visible	= false,
	max_stacks	= 10,
	duration 	= 20,
	aura_param	= 1,
	isBuff		= true,

}

Spell.ChargedInvisible_SpeedStealth = 
{
			aura 		= ai.Aura.STEALTH,
			can_stack	= true,
			duration 	= 18,
			isBuff 		= true,
			target 		= ai.SpellTarget.CASTER,
			--aura_target = ai.SpellTarget.HOLDER,
			
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
			
			dispell_timeout	= 2,
			ui_ico = { target_system = { tex = "ItemSubtype_ChargedInvisible", }, },
	
	additional_auras = 
	{
		{
			influence	= ai.Spell.APPLY_AURA,
			aura		= ai.Aura.HEAL_SHIELD_PERIODIC,
			target		= ai.SpellTarget.CASTER,
			aura_target	= ai.SpellTarget.CASTER,
			hud_visible	= true,
			max_stacks	= 10,
			duration 	= 10,
			period		= 1,
			aura_param	= 100,
			isBuff		= true,
	
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
			dispell_timeout	= 2,
	
			ui_ico 		= {	target_system	= { tex = "ItemSubtype_ChargedInvisible", }, },
		},
		
	},
}

Spell.ChargedInvisible_ResistAdd =
{
	target			= ai.SpellTarget.CASTER,
	duration		= 5,
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	aura_param		= 30,
	influence		= ai.Spell.APPLY_AURA,

	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ChargedInvisible", },
	},
}


Spell.BaphometGun_Overcharge = -- спелл пушки Бафомета
{ 

	aura				= ai.Aura.DAMAGE_MOD,
	
	aura_target			= ai.SpellTarget.CASTER,
	target =
	{
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship		= ai.SpellTargetRelationship.ENEMY,
	},
	duration			= 3,
	isBuff				= true,

	aura_param			= 0.1,
	can_stack			= true,
	max_stacks			= 4,
	
	ui_ico 				= {	target_system = { tex = "ItemSubtype_BaphometGun", }, },
		
	additional_auras = 
	{
		{
				aura			= ai.Aura.SLOW_MOVEMENT,				
				target 				= ai.SpellTarget.ENEMY_SHIPS_AROUND,
				target_range  		= 16,
	
				apply_crowd_control_coef	= true,
	
				aura_param		= 0.06,
				duration		= 3,--5,
				
				can_stack			= true,
				max_stacks			= 4,
				
				isBuff 			= false,
				ui_ico =	{ target_system 	= { tex = "ItemSubtype_BaphometGun", },	},
		},
		{
				aura			= ai.Aura.SLOW_MANEUVER,				
				target 				= ai.SpellTarget.ENEMY_SHIPS_AROUND,
				target_range  		= 16,
		
				apply_crowd_control_coef	= true,
	
				aura_param		= 0.0625,
				duration		= 3,--5,
				
				can_stack			= true,
				max_stacks			= 4,
				
				isBuff 			= false,
				ui_ico =	{ target_system 	= { tex = "ItemSubtype_BaphometGun", },	},
		},		
	},		

}

Spell.BaphometVampiredebuff = --спелл дебафа активки на противника от активки
{ 
	target 			= ai.SpellTarget.CASTER,
	aura_target 	=
		{
			
			class 			= ai.SpellTargetClass.SHIP,
			target			= ai.SpellTargetGeneral.LOCKED_TARGET,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
	aura_param		= 40,   
	aura_range		= 300,
	period			= 0.2,
	duration		= 10,
	aura 			= ai.Aura.BURN_ENERGY_PERIODIC,
	isBuff 			= false,
	--hud_visible 	= false, -- прячем от игрока.


	work_beam_target_root_fx = "particles/gadget/exhaustion_beam_energy",
	aura_target_fx = "particles/gadget/burn_energy",
	ui_ico 				= {	target_system = { tex = "ItemSubtype_BaphometModule", }, },
		
	additional_auras = 
	{
		{
			target 			= ai.SpellTarget.CASTER,
			aura_target 	=
				{
					target			= ai.SpellTargetGeneral.LOCKED_TARGET,					
					class 			= ai.SpellTargetClass.SHIP,
					area			= ai.SpellTargetArea.AROUND,
					relationship 	= ai.SpellTargetRelationship.ENEMY,
					misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
				},
			aura_param		= 0.2,   -- стоимость буста перехвата т3 = 80 е/с   нормальное значение видится в  2/3  от этого значения в радиусе 75-100
			aura_range		= 300,
			period			= 0.2,
			duration		= 10,
			aura 			= ai.Aura.SLOW_MOVEMENT,
			ui_ico 				= {	target_system = { tex = "ItemSubtype_BaphometModule", }, },
		},
	},		

}

Spell.BaphometVampirebuff = --спелл бафа активки на себя от активки
{
	target 			=
		{
			
			class 			= ai.SpellTargetClass.SHIP,
			target			= ai.SpellTargetGeneral.LOCKED_TARGET,
			--area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
		
	aura_target				= 	ai.SpellTarget.CASTER,
	aura_param		= 0.15,  
	aura_range		= 300,
	duration		= 10,
	aura 			= ai.Aura.FAST_MOVEMENT,
	maintain_aura  = true,
	isBuff 			= true,
	--hud_visible 	= false, -- прячем от игрока.


	ui_ico 				= {	target_system = { tex = "ItemSubtype_BaphometModule", }, },	
	
	additional_auras = 
	{
		{
			target 			=
		{
			
			class 			= ai.SpellTargetClass.SHIP,
			target			= ai.SpellTargetGeneral.LOCKED_TARGET,
			--area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
		
		aura_target				= 	ai.SpellTarget.CASTER,
		aura_param		= 0.15,  
		aura_range		= 300,
		duration		= 10,
		aura 			= ai.Aura.FAST_MANEUVER,
		maintain_aura  = true,
		isBuff 			= true,

		ui_ico 				= {	target_system = { tex = "ItemSubtype_BaphometModule", }, },	
		},
		
		{
			target 			=
		{
			
			class 			= ai.SpellTargetClass.SHIP,
			target			= ai.SpellTargetGeneral.LOCKED_TARGET,
			--area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
		
		aura_target				= 	ai.SpellTarget.CASTER,
		aura_param		= 0.15,  
		aura_range		= 300,
		duration		= 10,
		aura 			= ai.Aura.FIRE_RATE_MOD,
		maintain_aura  = true,
		isBuff 			= true,

		ui_ico 				= {	target_system = { tex = "ItemSubtype_BaphometModule", }, },	
		},
	},	
}

Spell.Spell_Laser_Sniper_Pirate =
{
--	influence					= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC_REDUCE_HEAL, 
	aura_target		= ai.SpellTarget.HOLDER,
	target =
	{
		target 					= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class					= ai.SpellTargetClass.SHIP,
		relationship			= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality				= ai.SpellTargetVitality.ALIVE,
	},

	aura_param		= 20, 
	
	reduce_heal_param = 50, -- -50% хила для тултипа, тк этот параметр больше нигде не упоминается
	
	period			= 0.2,
	isBuff			= false,
	duration		= 1.5,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}

Spell.LaserHadrian = -- спелл пушки Гардиана
{
	target = {
			class 			= ai.SpellTargetClass.SHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			vitality		= ai.SpellTargetVitality.ALIVE,
			area			= ai.SpellTargetArea.AROUND,
			-- target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
			},
			
	target_range		= 6,		
			
	aura_target 		= 	{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ALLY,
			vitality		= ai.SpellTargetVitality.ALIVE,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER			
							},
	

	influence			= ai.Spell.APPLY_AURA,
		
	aura				 = ai.Aura.DAMAGE_MOD,

	aura_param			 = 0.15,
	aura_range			 = 250,
	
	duration			= 1,	

	isBuff				= false,
	hud_visible 		= false,
	hud_visible_holder	= false,
	gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_LaserHadrian", },
	},
								
}



Spell.MagnitkaHadrian = -- спелл на модуль Хадрианна
{
	
	target				= ai.SpellTarget.CASTER,
	aura_target			= {
			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ALLY,
						},
						
	aura  			= ai.Aura.WEAPON_HIT_TRANSMIT_SPELL,
	target_spell	= "MagnitkaHadrian2",
	
	
	aura_range 			= 460,
	
	duration		= 10,
	
	isBuff				= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MagnitkaHadrian", },
	},
	
	gun_spell_fx	= "particles/gadget/gun_buff",
}

Spell.MagnitkaHadrian2 = -- спелл на модуль Хадрианна, доп урон союзов
{
	target 			= { 
				target = ai.SpellTargetGeneral.CONTEXT_TARGET, 
				relationship	= ai.SpellTargetRelationship.ENEMY+ai.SpellTargetRelationship.NEUTRAL,
				class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO +ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION,
					},
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff			= false,
	aura  			= ai.Aura.DAMAGE_EMP_PERIODIC,  -- ?
	aura_param		= 220,
	duration		= 1,
	period			= 0.3,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_MagnitkaHadrian", },
	},
	aura_fx		= "particles/gadget/damage_thermal"
}

-- для иконки времени работы
Spell.HadrianDefenderShield =
{
	aura_target 		=
	{
		target							= ai.SpellTargetGeneral.PARENT,
		class 							= ai.SpellTargetClass.SHIP,
		area							= ai.SpellTargetArea.AROUND,
	},
	
	aura_range			= 10,
	aura				= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell		= "Spell_Null",
	duration			= 8,
	period				= 100,
	isBuff				= true,
	gameplay_specific	= true,
	ui_ico 				=
	{
		target_system 	= { tex = "ItemSubtype_HadrianDefenderShield", },
	},
}

Spell.HadrianDefenderShield_HullResist =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER, 
	},
	
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= true,
	
	aura 				= ai.Aura.HULL_RESIST_ALL,
	aura_param			= 50,
	duration			= 8,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HadrianDefenderShield", },
	},
}	

--Пиратские уникалки для всех (эксперементально)

-- Заград Перегруппировка

Spell.FoxEscapeFromBattle_Pirate =
{
	inherit	=		"FoxEscapeFromBattle",
	
	aura_param		= 700,
	duration		= 5,
	period			= 1,
}

-- для сброса хила при выходе из невидимости (удалить - сделать на единицу больше отхила, убрать милисекунду из оригинального отхила)
Spell.FoxEscapeFromBattle1_Pirate =
{
	inherit	=		"FoxEscapeFromBattle1",

	aura_param		= 11,
	duration		= 0.1,
	period			= 1,
}

-- хамелеон
Spell.FoxEscapeFromBattle_Hide_Pirate =
{
	inherit	=		"FoxEscapeFromBattle_Hide",

	duration		= 5,
}

--Диверсант
Spell.RadiationCloud_Pirate = 
{
	inherit	=		"RadiationCloud",
		
	aura_param 		= 550,
	duration		= 10,
	period			= 0.25,
}

--Хил
Spell.CalibrationGrenade_Pirate	= 
{
	inherit	=		"CalibrationGrenade",
}

Spell.ShieldLink_SelfBuff =
{
	isBuff			= true,
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	aura 								= ai.Aura.HEAL_SHIELD_PERIODIC,
	
	aura_param		= 125,
	period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldLink", },
	},
}

Spell.Spell_ManulsPaw =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.SLOW_MANEUVER, --
	aura_param		= 0.5,

	duration		= 8,
	isBuff			= false,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ManulsPaw", },
	},
	
	additional_auras =	
	{
		{
			target =
				{
				target = ai.SpellTargetGeneral.CONTEXT_TARGET,
				relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
				},
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FIRE_RATE_MOD, --
			aura_param		= -0.5, 
			duration		= 8,
			isBuff			= false,
			
			ui_ico =
			{
			target_system 	= { tex = "ItemSubtype_ManulsPaw", },
			},
		},
		{
			target =
				{
				target = ai.SpellTargetGeneral.CONTEXT_TARGET,
				relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
				},
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.REDUCE_MAX_SPEED, 
			aura_param		= 0.5, 
			duration		= 8,
			isBuff			= false,
		
			ui_ico =
			{
			target_system 	= { tex = "ItemSubtype_ManulsPaw", },
			},			
		},
		
	},

}

Spell.Spell_ManulsPawOvercharge =
{

	inherit					= "TimeBoost_T5_Base",
	aura_param				= 0.35,
	ui_ico 				= {	target_system = { tex = "ItemSubtype_ManulsPaw", }, },
}

Spell.Spell_ManulPlasma = -- спелл пушки Manul
{ 

	aura				= ai.Aura.FIRE_RATE_MOD,
	
	aura_target			= ai.SpellTarget.CASTER,
	hit_target =
	{
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship		= ai.SpellTargetRelationship.ENEMY,
	},
	
	duration			= 3,
	isBuff				= true,

	aura_param			= 0.20,
	can_stack			= true,
	max_stacks			= 3,
	
	ui_ico 				= {	target_system = { tex = "ItemSubtype_ManulPlasmaGun", }, },
}		

Spell.Spell_ManulShields = -- ативка манула
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= 	ai.SpellTarget.CASTER,
	aura 				= ai.Aura.SHIELD_MOD,
	
	aura_param			= 1,  
	duration			= 8,
	
	additional_auras = 
		{
			{
				target 				= ai.SpellTarget.CASTER,
				aura_target			= ai.SpellTarget.CASTER,
				aura 				= ai.Aura.DISABLE_ENERGY_REGEN,
				duration			= 3,
				gameplay_specific	= true,
				isBuff				= false,
				ignore_additional_power  = true,
				ui_ico 				= {	target_system = { tex = "ItemSubtype_ManulShields", }, },	
			},
			{
				target 				= ai.SpellTarget.CASTER,
				aura_target			= ai.SpellTarget.CASTER,
				aura 				= ai.Aura.SHIELD_REGEN_MOD,
				aura_param			= -100,	
				duration			= 3,
				gameplay_specific	= true,
				isBuff				= false,
				ignore_additional_power  = true,
				ui_ico 				= {	target_system = { tex = "ItemSubtype_ManulShields", }, },	
			},
			{
				target 				= ai.SpellTarget.CASTER,
				aura_target			= ai.SpellTarget.CASTER,
				aura 				= ai.Aura.SHIELD_RESIST_ALL,
				aura_param			= 50,	
				duration			= 8,
				gameplay_specific	= true,
				isBuff				= true,
				ignore_additional_power  = true,
				ui_ico 				= {	target_system = { tex = "ItemSubtype_ManulShields", }, },	
			},			
		},
	
	isBuff 				= true,

	ui_ico 				= {	target_system = { tex = "ItemSubtype_ManulShields", }, },	
}	

Spell.Spell_ManulShieldsBuff = -- ативка манула
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= 	ai.SpellTarget.CASTER,
	aura 				= ai.Aura.HEAL_SHIELD_PERIODIC,
	
	aura_param			= 1375,  
	period				= 1,
	duration			= 3,
	
	isBuff 				= true,

	ui_ico 				= {	target_system = { tex = "ItemSubtype_ManulShields", }, },	
}	


Spell.Spell_DragonFlashControl =
{
	target 			= ai.SpellTarget.INFLICTOR,

	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},

	aura 			= ai.Aura.HEAL_HULL_PERIODIC,

	aura_range		= 45,
	aura_param		= 400, -- пара тиков на ранже=7 ; 5 тиков на ранже=12 
	period			= 0.2,
	isBuff			= true,
	--aura_sound 		= "sound/aura/swarm_hit",
	
	--period_beam_fx 	= "particles/gadget/heal_drone_beam_2",
	work_beam_target_root_fx = "particles/gadget/heal_drone_beam_2",
	
	aura_fx 			= "particles/gadget/healing_aura_green_2",
	--aura_target_directed_fx		= "particles/gadget/healing_aura_green_big_2",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DragonFlashControl", },
	},
	
	additional_auras = 
	{
		{
		target 			= ai.SpellTarget.INFLICTOR,

		aura_target = {
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				},

			aura 			= ai.Aura.VISION_RADIUS_MOD,

			aura_range		= 75,
			aura_param		= -100, -- пара тиков на ранже=7 ; 5 тиков на ранже=12 
			--period			= 0.2,
			isBuff			= false,
			--aura_sound 		= "sound/aura/swarm_hit",
			
			--aura_fx 			= "particles/gadget/lightnings_debuff",
			--aura_target_directed_fx		= "particles/gadget/lightnings_debuff",
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_DragonFlashControl", },
			},
		},
	},
	
}

Spell.Spell_DragonFlashsHullHeal =
{
	
	target 			= ai.SpellTarget.INFLICTOR,
		
	aura_target	=
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						vitality		= ai.SpellTargetVitality.ALIVE,
					},
	aura_range		= 150,

	aura 			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 300,
	period			= 1,
	--duration 		= 1,

	isBuff			= true,
	
	work_beam_target_root_fx 	= "particles/gadget/heal_drone_beam_2",
	aura_fx 			= "particles/gadget/healing_aura_green",
	--aura_target_directed_fx		= "particles/gadget/healing_aura_green_big",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DragonFlash_Stage2", },
	},
	
	
}

Spell.Spell_DragonFlashsShieldHeal =
{
	
	target 			= ai.SpellTarget.INFLICTOR,
		
	aura_target	=
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						vitality		= ai.SpellTargetVitality.ALIVE,
					},
	aura_range		= 150,
	
	aura 			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param		= 300,
	period			= 1,
	--duration 		= 1,

	isBuff			= true,
	
	period_beam_fx 	= "particles/gadget/heal_ray_blue",
	aura_fx 			= "particles/gadget/shield_heal_2",
	--aura_target_directed_fx		= "particles/gadget/shield_heal_2",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DragonFlash_Stage1", },
	},
	
}

Spell.Spell_DragonFlashsPulsar =
{
	
	target 			= ai.SpellTarget.INFLICTOR,
		
	aura_target	=
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		= ai.SpellTargetVitality.ALIVE,
						misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
					},
	aura_range		= 210,
	
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param		= 900,
	period			= 1,

	isBuff			= false,
	
	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_DragonFlash_Stage3", },
	},
	--aura_target_directed_fx		= "particles/gadget/lightnings_debuff",
	--aura_fx 			= "particles/gadget/lightnings_debuff",
}

Spell.Spell_DragonFlashsDeath =
{
	aura_target 		=
	{
		target							= ai.SpellTargetGeneral.PARENT,
		class 							= ai.SpellTargetClass.SHIP,
		area							= ai.SpellTargetArea.AROUND,
	},
	
	aura_range			= 10,
	aura				= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell		= "Spell_Null",
	duration			= 8,
	period				= 100,
	
	hud_visible			= false,
	isBuff				= true,
	gameplay_specific	= true,
	ui_ico 				=
	{
		target_system 	= { tex = "ItemSubtype_DragonFlash_Stage0", },
	},
}

Spell.Spell_SalamanderNailgun = -- спелл пушки Гардиана
{
	target = {
			class 			= ai.SpellTargetClass.SHIP,
			relationship 	= ai.SpellTargetRelationship.ALLY,
			vitality		= ai.SpellTargetVitality.ALIVE,
			area			= ai.SpellTargetArea.AROUND,
			},
			
	target_range		= 13,		
			
	aura_target 		= 	{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ALLY,
			vitality		= ai.SpellTargetVitality.ALIVE,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_CASTER,		
							},
	influence			= ai.Spell.APPLY_AURA,
		
	aura				 = ai.Aura.HEALING_MOD,
	
	aura_param			 = 0.75,
	aura_range			 = 13,
	
	--period				= 0.2,
	duration			= 5,	

	isBuff				= true,
	hud_visible 		= true,
	disable_aura_duration = false, -- не показывать таймер на ауре и текст обновления ауры
	-- hud_visible_holder	= false,
	-- gameplay_specific	= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SalamanderNailgun", },
	},
								
}

Spell.Spell_DragonAdaptiveForceShield =
{
	aura 			= ai.Aura.RESIST_ALL,
	aura_param 		= 35,--// значение из старого speed_to_resist
	diminish_aura_param = true,
	ignore_stacks 	= true,
	ignore_subtype 	= true,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "ItemSubtype_DragonAdaptiveForceShield", },		},
	
}

Spell.Spell_DragonFlashControlResist = -- резист активки контроля
{
	target 				= ai.SpellTarget.CASTER,
	aura_target			= 	ai.SpellTarget.CASTER,
	aura 				= ai.Aura.RESIST_ALL,
	
	aura_param			= 35,  
	--duration			= 8,
	
	
	isBuff 				= true,

	ui_ico 				= {	target_system = { tex = "ItemSubtype_DragonFlashControl", }, },	
}	

Spell.Spell_EnergyVampLoki = -- резист активки контроля
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	=
		{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
	aura_param		= 120,   -- стоимость буста перехвата т3 = 80 е/с   нормальное значение видится в  2/3  от этого значения в радиусе 75-100
	aura_range		= 60,
	period			= 1,
	duration		= 15,
	aura 			= ai.Aura.ENERGY_VAMPIRE_PERIODIC,
	isBuff 			= false,
	--hud_visible 	= false, -- прячем от игрока.
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_EnergyShieldLoki", },
	},
	work_beam_target_root_fx = "particles/gadget/exhaustion_beam_energy",
	aura_target_fx = "particles/gadget/burn_energy",
}

Spell.Spell_EnergyShieldLoki = -- Локи для иконки
{
	inherit			= "EnergyShieldCommander_T4_Base",
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_EnergyShieldLoki", },
	},
	aura_fx = "particles/gadget/energy_shield",

}

Spell.Spell_LaserBlaster_Pirate =
{
	target				= ai.SpellTarget.CASTER,
	-- aura				= ai.Aura.DISPERSION_MOD,
	-- aura_target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.DISPERSION_MOD,
	-- influence_param	= -0.3,	
	isBuff				= true,
	aura_param			= -0.3,
	duration			= 4,
	ui_ico 	= { target_system = { tex = "ItemSubtype_TyphonCharge", }, },
}

Spell.Spell_shipChild_Umbrella =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_shipChild_Umbrella_Carrier', 'Spell_shipChild_Umbrella_ForTornado' }
}

Spell.Spell_shipChild_Umbrella_Carrier =
{
	aura 			= ai.Aura.ADD_ENERGY_PERIODIC,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 5,--// значение из старого speed_to_resist
	period			= 1,
	--duration		= 1000,	
	diminish_aura_param = true,
	can_stack		= false,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_BP14_Umbrella", },		},
}

Spell.Spell_shipChild_Film =
{
	aura 			= ai.Aura.CAPTURE_SPEED_MOD,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 0.1,--// значение из старого speed_to_resist
	--period			= 1,
	--duration		= 1000,	
	diminish_aura_param = true,
	can_stack		= false,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_Film", },		},
	additional_auras = 
	{
		{
			aura 			= ai.Aura.HEAT_MUL,
			aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
			aura_param 		= -0.11111,--// значение из старого speed_to_resist
			--period			= 1,
			--duration		= 1000,	
			diminish_aura_param = true,
			can_stack		= false,
			isBuff 			= true,
			ui_ico 			=	{		target_system 	= { tex = "shipChild_Film", },		},
		},
	},
}

Spell.Spell_shipChild_Umbrella_ForTornado =
{
	aura 			= ai.Aura.ADD_ENERGY_PERIODIC,
	target			= { target = ai.SpellTargetGeneral.BROTHER_OF_CASTER, },
	aura_target		= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_param 		= 5,
	period			= 1,
	diminish_aura_param = true,
	can_stack		= false,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_BP14_Umbrella", },		},
}

Spell.Spell_shipChild_BP19_Object =
{
	aura 			= ai.Aura.FAST_MANEUVER,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 0.05,--// значение из старого speed_to_resist
	--duration		= 15,	
	diminish_aura_param = true,
	can_stack		= false,
	isBuff 			= true,
	hud_visible		= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_BP19_Object", },		},
}

Spell.Spell_shipChild_Drakkar =
{
	aura 			= ai.Aura.DAMAGE_MOD,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 0.04,--// значение из старого speed_to_resist
	--period			= 1,
	--duration		= 1000,	
	--diminish_aura_param = true,
	ignore_subtype	= false,
	can_stack		= false,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_BP21_Drakkar", },		},
}

Spell.Spell_shipChild_Halloween25 =
{
	aura 			= ai.Aura.SLOW_MOVEMENT,
	aura_target		= { 
						target = ai.SpellTargetGeneral.LOCKED_TARGET,
						class	= ai.SpellTargetClass.SHIP,
						relationship = ai.SpellTargetRelationship.ENEMY,
						},
	aura_param 		= 0.03,--
	aura_range		= 50,
	
	work_beam_target_root_fx = "particles/gadget/exhaustion_beam_energy",
	aura_target_fx = "particles/gadget/burn_energy",
 
	ignore_subtype	= false,
	can_stack		= false,
	isBuff 			= false,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_Halloween_25", },		},
}

Spell.Spell_LClaw =
{
	aura 			= ai.Aura.CRIT_CHANCE,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 0.15,--// значение из старого speed_to_resist
	--duration		= 15,	
	diminish_aura_param = true,
	can_stack		= false,
	isBuff 			= true,
	hud_visible		= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_Veteran_LClaw", },		},
}

Spell.Spell_RClaw =
{
	aura 			= ai.Aura.DAMAGE_MOD,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 0.05,--// значение из старого speed_to_resist
	--duration		= 15,	
	diminish_aura_param = true,
	can_stack		= false,
	isBuff 			= true,
	hud_visible		= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_Veteran_RClaw", },		},
}

Spell.Spell_heart_attack =
{

	target 			= --ai.SpellTarget.LOCKED_TARGET,
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
			},
	aura			= ai.Aura.DISABLE_ENERGY_REGEN,
	aura_target		= ai.SpellTarget.ENEMY_VISIBLE_BY_HOLDER,		

	aura_range		= 12,
	--aura_param		= 10,
	period			= 1,
	isBuff			= false,
	duration		= 1,
	--max_stacks		= 5,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HeartAttack", },
	},
	aura_target_fx = "particles/gadget/burn_energy",
}

Spell.Spell_HeathTaunt = {
	
	target 			= ai.SpellTarget.CASTER,
	aura_target 	=
		{
			class 			= ai.SpellTargetClass.SHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
			target			= ai.SpellTargetGeneral.LOCKED_TARGET
		},
		
-- target		= {
				-- target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				-- relationship	= ai.SpellTargetRelationship.ENEMY,
				-- class 			= ai.SpellTargetClass.SHIP,
				-- misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
				-- },

-- target_range	= 400,
					  
-- aura_target 	= { 
				-- target 			= ai.SpellTargetGeneral.HOLDER,
				-- misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
			 	-- },			
		
	aura				= ai.Aura.FORCE_TARGET_LOCK,	
	duration			= 10,
	aura_range			= 400,	
	
		aura_target_fx = "particles/gadget/lightnings_debuff",

	isBuff				= false,
	ignore_subtype 		= true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HeathTaunt", },
	},
	
	
}

Spell.Spell_HeathTauntHackWeapons =
{
	target		= {
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	target_range	= 400,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura 			= ai.Aura.HACKED_WEAPON,
	diminish_control_aura = false,
	apply_crowd_control_coef = false,
	duration		= 10,
	
	diminish_control_aura = true,
	diminish_aura_param		= true,
	
	
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HeathTaunt", }, },
}

Spell.Spell_HeathTauntHealTarget =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target 	= ai.SpellTarget.HOLDER,
	mod_target	 = 
		{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.LOCKER_OF_CASTER,
		},
	mod_range 		= 400,
	ignore_stacks	= true,
	ignore_subtype	= true,
	aura_param		= 40,
	period			= 1,

	aura 			= ai.Aura.ADD_ENERGY_PERIODIC,
	--aura_target_fx = "particles/gadget/burn_energy",

	mod_update_period = 5,
	disable_zero_stage = true,

	isBuff 			= true,

	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_HeathTaunt", },
	},
}

Spell.Spell_HeartCooldownerDec =
{
	target		= {
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER + ai.SpellTargetMisc.NOT_CLOAKED,
				},

	target_range	= 400,
					  
	aura_target 	= { target 			= ai.SpellTargetGeneral.HOLDER,
						misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER + ai.SpellTargetMisc.NOT_CLOAKED,
					  },					  
					  
	aura 			= ai.Aura.COOLDOWN_MOD,
	aura_param		= 4,
	diminish_control_aura = false,
	apply_crowd_control_coef = false,

	aura_target_fx = "particles/gadget/burn_energy",

	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HeartCooldownerDec", }, },
}

Spell.Spell_CorVulnusCPU =
{
	target		= {	target 			= ai.SpellTargetGeneral.CASTER,	},
		  
	aura_target 	= { target 			= ai.SpellTargetGeneral.HOLDER + ai.SpellTargetGeneral.LOCKED_TARGET,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						class 			= ai.SpellTargetClass.SHIP,						
						misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER + ai.SpellTargetMisc.NOT_CLOAKED,
					  },					  
					  
	aura_range		= 300,				  
	aura 			= ai.Aura.DAMAGE_DEC,
	aura_param		= 0.1,
	
	--period			= 1,

	aura_target_fx = "particles/gadget/burn_energy",

	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_CorVulnusCPU", }, },
}

Spell.Spell_CorrosiveMissile = 
{
	influence 				= ai.Spell.CAST_SPELLS,
	spells					= { 'Spell_CorrosiveMissile1', 'Spell_CorrosiveMissile2', 'Spell_CorrosiveMissile3' }
}

Spell.Spell_CorrosiveMissile1 = --против перехватов и штцрсов
{

	target 			= ai.SpellTarget.CONTEXT_TARGET,
	
	aura_target	= 
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		=ai.SpellTargetVitality.ALIVE,
						signature		= ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM,
					},
	
	aura_range		= 100,
	aura 			= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	aura_param		= 400, 

	period			= 0.5,	

	isBuff			= false,
	
	aura_fx		= "particles/gadget/suicide_aura_green_1000m",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CorrosiveMissile", },
	},
	aura_target_directed_fx		= "particles/gadget/lightnings_debuff",
}

Spell.Spell_CorrosiveMissile2 = --проитв фрегатов
{
	inherit			= "Spell_CorrosiveMissile1",
	target 			= ai.SpellTarget.CONTEXT_TARGET,
	
	aura_target	= 
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		=ai.SpellTargetVitality.ALIVE,
						signature		= ai.SignatureMask.LARGE,
					},
	
	aura_range		= 100,

	aura_param		= 800, 

	period			= 0.5,	
}

Spell.Spell_CorrosiveMissile3 = --проитв дестроеров
{
	inherit			= "Spell_CorrosiveMissile1",
	target 			= ai.SpellTarget.CONTEXT_TARGET,
	
	aura_target	= 
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		=ai.SpellTargetVitality.ALIVE,
						signature		= ai.SignatureMask.HUGE,
					},
	
	aura_range		= 100,

	aura_param		= 1500, 

	period			= 0.5,	
}


Spell.Spell_AnomalyBoom = 
{
	influence					= ai.Spell.APPLY_AURA,
	aura 						= ai.Aura.SHIP_ATTRACTION,
	target =
	{
		target					= ai.SpellTargetGeneral.INFLICTOR,
		misc					= ai.SpellTargetMisc.POSITION,
	},
	aura_target =
	{
		class 					= ai.SpellTargetClass.SHIP,
		relationship 			= ai.SpellTargetRelationship.ENEMY,
		area					= ai.SpellTargetArea.AROUND,
	},
	
	aura_param					= 50,
	aura_range					= 60,
	duration					= 1.5,
	
	spell_on_cancel				= "Spell_AnomalyBoom2",
	
	
	
	isBuff						= false,
	hud_visible 				= false,
	
	min_targets_count			= 0,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AnomalyBoom", },
	},
	
	aura_fx						= "particles/gadget/huge/gravy_anomaly_hole_600m",
	aura_target_directed_fx		= "particles/gadget/push_ray_hit",
	
	
}

Spell.Spell_AnomalyBoom2 =
{
	
	influence 				= ai.Spell.EXPLOSION,
	target			= ai.SpellTarget.ENEMY_AROUND,
	target_range	= 60,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AnomalyBoom", },
	},
	explosion_blast_wave	= "Blastwave_AnomalyBoom2",
}

Spell.Spell_HeatMulFire =
{
	influence					= ai.Spell.APPLY_AURA,
	target =
				{
				target					= ai.SpellTargetGeneral.INFLICTOR,
				misc					= ai.SpellTargetMisc.POSITION,
				},
	aura_target =
				{
				class 					= ai.SpellTargetClass.SHIP,
				relationship 			= ai.SpellTargetRelationship.ENEMY,
				area					= ai.SpellTargetArea.AROUND,
				},
	aura						= ai.Aura.HEAT_MUL,
	aura_param					= 4,
	aura_range					= 100,
	duration					= 15,
	
	isBuff						= false,
	hud_visible 				= true,
	--aura_fx 					= "particles/gadget/suicide_aura_1000m",
			
	ui_ico =
			{
			target_system 	= { tex = "ItemSubtype_HeatMulFire", },
			},
	
	additional_auras =
	{
		{
			influence					= ai.Spell.APPLY_AURA,
			target =
				{
				target					= ai.SpellTargetGeneral.INFLICTOR,
				misc					= ai.SpellTargetMisc.POSITION,
				},
			aura_target =
				{
				class 					= ai.SpellTargetClass.SHIP,
				relationship 			= ai.SpellTargetRelationship.ENEMY,
				area					= ai.SpellTargetArea.AROUND,
				},
			aura						= ai.Aura.REDUCE_COOLING,
			aura_param					= 4,
			aura_range					= 100,
			
			duration					= 15,
	
			isBuff						= false,
			
			--aura_fx						= "particles/gadget/huge/gravy_anomaly_hole_600m",
			aura_fx							= "particles/gadget/suicide_aura_1000m",
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_HeatMulFire", },
			},
			
			hud_visible 				= true,
		},
	
	},

}

Spell.AdaptiveBigHullBoost_T5_Pirate =
{

	influence				= ai.Spell.APPLY_AURA,
	target					= ai.SpellTarget.CASTER,
	aura_target				= ai.SpellTarget.ALLY_SHIPS_AROUND,
	
	aura					= ai.Aura.HULL_RESIST_ALL,
	
	aura_param					= 100,
	aura_range					= 50,
	duration					= 16,
	--period					= 1,
	
	isBuff					= true,
	hud_visible 			= true,
	
	ui_ico =
	{
			target_system 	= { tex = "ItemSubtype_AdaptiveBigShieldBoost", },
	},
	
}

Spell.Spell_GreenFastShotgun =
{
	
	influence 				= ai.Spell.EXPLOSION,
	target			= ai.SpellTarget.ENEMY_AROUND,
	target_range	= 6,
	
	explosion_blast_wave	= "Blastwave_GreenFastShotgun",
}

Spell.Spell_GreenFastShotgunT5 =
{
	
	inherit				= "Spell_GreenFastShotgun",
	explosion_blast_wave	= "Blastwave_GreenFastShotgunT5",
}

Spell.Spell_GreenFastShotgunT4 =
{
	
	inherit				= "Spell_GreenFastShotgun",
	explosion_blast_wave	= "Blastwave_GreenFastShotgunT4",
}

Spell.Spell_GreenFastShotgunT3 =
{
	
	inherit				= "Spell_GreenFastShotgun",
	explosion_blast_wave	= "Blastwave_GreenFastShotgunT3",
}

Spell.Spell_GreenAIM =
{
	target		= {
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				class 			= ai.SpellTargetClass.SHIP,
				},
	
	aura_target 	= { target = ai.SpellTargetGeneral.CASTER, },

	aura 			= ai.Aura.WEAPON_AUTO_AIM,
	
	aura_range		= 400,
	duration		= 5,	
	aura_fx				= "particles/gadget/matter_absorber",
	
	
	isBuff			= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_GreenAIM", }, },
}

Spell.Spell_GreenAIM_ShieldOn =
{
	duration			= 7,
	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	influence_param		= 40000,

	isBuff				= true,

	shell_def 			= "Shell_GreenShield",-- деф шкуры
	--influence_fx       = "particles/gadget/alien_mass_shield_projectile",


	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenAIM", },
	},
	
}	

Spell.Spell_GreenEnergyShieldReflector =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.ENERGY_SHIELD,
	duration		= 10,
	aura_param		= 13,
	isBuff			= true,

	aura_fx ="particles/gadget/energy_shield_green",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenEnergyShieldReflector", },
	},
	
	--aura_holder_sound 		= "sound/aura/MassEnergyLeak",
	
	additional_auras =	
	{
		{
		target					= ai.SpellTarget.CASTER,
		aura 					= ai.Aura.DAMAGE_REFLECT,
		aura_target 			= 
								{
								class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
								area 			= ai.SpellTargetArea.AROUND,
								relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
								vitality       = ai.SpellTargetVitality.ALIVE,
								damageability  = ai.SpellTargetDamageability.DAMAGEABLE,
								},
		aura_range 				= 70,
		aura_param				= 10000000,
		duration 				= 10,
		period					= 0.5,
		ignore_silence	= true,

		work_beam_target_root_fx = "particles/gadget/alien_shield_reflector_beam",
		ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_GreenEnergyShieldReflector", },
		},
		
		},
	},
}

Spell.Spell_GreenPhase_1 = -- +урон
{

	target					= ai.SpellTarget.CASTER,
	aura_target 			= ai.SpellTarget.HOLDER,
	
	aura					= ai.Aura.DAMAGE_MOD,
	
	aura_param		= 0.07, -- *модификатор.
	mod_max			= 3,
	
	mod_update_period = 5,
	period			= 0.2,	
	--duration		= 10,
	ignore_stacks	= true,
	ignore_subtype	= true,
	
	mod_range		= 300,	
	mod_target		= 
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= true,
	disable_zero_stage = true,
	
	ui_ico = { target_system 	= { tex = "ItemSubtype_GreenSwitcher_1", }, },
	
}

Spell.Spell_GreenPhase_2 = -- + скорость кд 
{

	target					= ai.SpellTarget.CASTER,
	aura_target 			= ai.SpellTarget.HOLDER,
	
	aura					= ai.Aura.COOLDOWN_MOD,
	
	aura_param		= -0.111111, -- *модификатор.
	mod_max			= 3,
	
	mod_update_period = 5,
	period			= 0.2,	
	--duration		= 10,
	ignore_stacks	= true,
	ignore_subtype	= true,
	
	mod_range		= 300,	
	mod_target		= 
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= true,
	disable_zero_stage = true,

	ui_ico = { target_system 	= { tex = "ItemSubtype_GreenSwitcher_2", }, },	
	
}


Spell.Spell_GreenPhase_3 = -- + резист
{
	target			= ai.SpellTarget.CASTER,
	aura  			= ai.Aura.RESIST_ALL,
	aura_target 	= ai.SpellTarget.HOLDER,
	aura_param		= 40, -- *модификатор.
	mod_max			= 3,
	--duration		= 5,
	mod_update_period = 5,
	period			= 1,	
	ignore_stacks	= true,
	ignore_subtype	= true,
	mod_range		= 300,	
	mod_target		= --Module_EnergyFlowBalancer_T5_Epic
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= true,
	disable_zero_stage = true,

	ui_ico = { target_system 	= { tex = "ItemSubtype_GreenSwitcher_3", }, },
	
}

Spell.Spell_GreenSphereGun_Blastwave = -- 50% шанс дамага
{
	influence=ai.Spell.CAST_SPELLS,
	spells={'Spell_GreenSphereGun_Emp','Spell_GreenSphereGun_Kinetic','Spell_GreenSphereGun_Thermal'},
}

Spell.Spell_GreenSphereGun_Thermal = -- пушка с рандомным типом урона 
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= {
				target 			= ai.SpellTargetGeneral.INFLICTOR,
				misc	= ai.SpellTargetMisc.POSITION,
				},
	aura_target		= {
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
				class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
				},
	aura_range		= 18,
	aura_param		= 750, --10000
	duration		= 0.2,
	period			= 0.5,
	
	chance			= 0.5,
	scale_on_weapon			= true,
	
	isBuff			= false,
	hud_visible		= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_GreenSphereGun", }, },

	--aura_fx 		= "particles/explosions/explosion_big4",
	cast_position_fx= "particles/weapons/big/bubble_explosion_mid",
	--cast_sound		= "sound/explosion/SmartRocket_expl",
	
}

Spell.Spell_GreenSphereGun_Kinetic =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_KINETIC_SCALED,
	
}

Spell.Spell_GreenSphereGun_Emp =
{

	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
}

Spell.Spell_GreenSphereGun_Blastwave_mk1 = -- 50% шанс дамага
{
	influence=ai.Spell.CAST_SPELLS,
	spells={'Spell_GreenSphereGun_Emp_mk1','Spell_GreenSphereGun_Kinetic_mk1','Spell_GreenSphereGun_Thermal_mk1'},
}

Spell.Spell_GreenSphereGun_Emp_mk1 =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 500,
}

Spell.Spell_GreenSphereGun_Kinetic_mk1 =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_param		= 500,
}

Spell.Spell_GreenSphereGun_Thermal_mk1 =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param		= 500,
}

Spell.Spell_GreenSphereGun_Blastwave_rare = -- 50% шанс дамага
{
	influence=ai.Spell.CAST_SPELLS,
	spells={'Spell_GreenSphereGun_Emp_rare','Spell_GreenSphereGun_Kinetic_rare','Spell_GreenSphereGun_Thermal_rare'},
}

Spell.Spell_GreenSphereGun_Emp_rare =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 600,
}

Spell.Spell_GreenSphereGun_Kinetic_rare =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_param		= 600,
}

Spell.Spell_GreenSphereGun_Thermal_rare =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param		= 600,
}

Spell.Spell_GreenSphereGun_Blastwave_mk3 = -- 50% шанс дамага
{
	influence=ai.Spell.CAST_SPELLS,
	spells={'Spell_GreenSphereGun_Emp_mk3','Spell_GreenSphereGun_Kinetic_mk3','Spell_GreenSphereGun_Thermal_mk3'},
}

Spell.Spell_GreenSphereGun_Emp_mk3 =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 675,
}

Spell.Spell_GreenSphereGun_Kinetic_mk3 =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_param		= 675,
}

Spell.Spell_GreenSphereGun_Thermal_mk3 =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param		= 675,
}

Spell.Spell_GreenSphereGun_Blastwave_epic = -- 50% шанс дамага
{
	influence=ai.Spell.CAST_SPELLS,
	spells={'Spell_GreenSphereGun_Emp_epic','Spell_GreenSphereGun_Kinetic_epic','Spell_GreenSphereGun_Thermal_epic'},
}

Spell.Spell_GreenSphereGun_Emp_epic =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 750,
}

Spell.Spell_GreenSphereGun_Kinetic_epic =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_param		= 750,
}

Spell.Spell_GreenSphereGun_Thermal_epic =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param		= 750,
}

Spell.Spell_GreenSphereGun_Blastwave_rel = -- 50% шанс дамага
{
	influence=ai.Spell.CAST_SPELLS,
	spells={'Spell_GreenSphereGun_Emp_rel','Spell_GreenSphereGun_Kinetic_rel','Spell_GreenSphereGun_Thermal_rel'},
}

Spell.Spell_GreenSphereGun_Emp_rel =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_EMP_SCALED,
	aura_param		= 750,
}

Spell.Spell_GreenSphereGun_Kinetic_rel =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_param		= 750,
}

Spell.Spell_GreenSphereGun_Thermal_rel =
{
	inherit			= "Spell_GreenSphereGun_Thermal",
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param		= 750,
}

Spell.Spell_GreenChargeFlow =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	
	aura 			= ai.Aura.OVERCHARGE,

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_CASTER,
	},

	fixed_cylinder_target = false,
	disable_aura_duration	= true,
	
	aura_holder_sound  		= "sound/gadgets2/GreenChargeFlow",	
	
	aura_extra_radius = 40,
	aura_range		= 250,
	aura_param		= 1,   --x2

	duration 		= 10, --0.2,
	period			= 0.5,
	isBuff			= true,
	

	
	work_beam_fx 	= "particles/gadget/green_charge_cone_beam",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenChargeFlow", },
	},
}

Spell.Spell_GreenSouls =
{
	target		= {
				target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
				relationship	= ai.SpellTargetRelationship.ALLY,
				class 			= ai.SpellTargetClass.SHIP,
				misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER + ai.SpellTargetMisc.NOT_CLOAKED,
				},


					  
	aura_target 	= { target 			= ai.SpellTargetGeneral.HOLDER,
						misc			= ai.SpellTargetMisc.VISIBLE_BY_CASTER + ai.SpellTargetMisc.NOT_CLOAKED,
					  },					  
	-- target =
	-- {
		-- target 			= ai.SpellTargetGeneral.CASTER,
	-- },
	-- aura_target =
	-- {
		-- target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		-- class			= ai.SpellTargetClass.SHIP+ai.SpellTargetClass.OWNED_BY_SHIP+ai.SpellTargetClass.GUIDED_DRONE,
		-- relationship	= ai.SpellTargetRelationship.ALLY,
		-- misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NOT_CLOAKED,
	-- },

	aura_holder_sound 		= "sound/aura/Spell_GreenSouls",

	target_range	= 300,					
	aura 			= ai.Aura.UNTOUCHABLE,
	duration		= 12,
	--aura_param		= 4,
	diminish_control_aura = false,
	apply_crowd_control_coef = false,
	
	

	--aura_target_fx = "particles/gadget/burn_energy",

	isBuff			= true,
	ui_ico 			= { target_system = { tex = "ItemSubtype_GreenSouls", }, },
}

Spell.Spell_GreenCommanderResist = {
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	--	misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	aura				= ai.Aura.RESIST_ALL,
	isBuff				= true,
	aura_range			= 480,
	aura_param			= 20,
	ui_ico 				=
		{
			target_system = { tex = "ItemSubtype_GreenCommanderResist", },
		},

	additional_auras =
	{
		{
			target 			= ai.SpellTarget.CASTER,

			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ALLY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
	
			aura 			= ai.Aura.DAMAGE_MOD,
			aura_range		= 480,
			aura_param		= 0.215, -- пара тиков на ранже=7 ; 5 тиков на ранже=12 
	
			isBuff			= true,
	
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_GreenCommanderResist", },
			},

		
		},
	},				

}

Spell.Spell_GreenCommanderBuffer = {
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura				= ai.Aura.RESIST_ALL,
	aura_range			= 250,	
	isBuff				= true,
	aura_param			= 60,
	duration			= 15,	
	ui_ico 				=
		{
			target_system = { tex = "ItemSubtype_GreenCommanderBuffer", },
		},
		
	additional_auras =
	{
		{
			target 			= ai.SpellTarget.CASTER,

			aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship 	= ai.SpellTargetRelationship.ALLY,
				vitality		= ai.SpellTargetVitality.ALIVE,
			},
	
			aura 			= ai.Aura.DAMAGE_MOD,
			aura_range		= 250,
			aura_param		= 0.4, -- пара тиков на ранже=7 ; 5 тиков на ранже=12 
			duration			= 15,
			isBuff			= true,
	
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_GreenCommanderBuffer", },
			},
		},
	},			

}

Spell.Spell_GreenCommanderEmergency =
{
	target			= ai.SpellTarget.ENEMY_AROUND,
	target_range	= 125,
	aura			= ai.Aura.STASIS,
	diminish_control_aura = true,
	apply_crowd_control_coef = true,
	
	duration		= 2.5,
	isBuff			= false,
	min_targets_count	= 1, -- SC-89106 СТ. Спецмодуль Mjolnir Форсирование систем кораблей Варденов не сбрасывает эффект от спецмодуля РЭБа
	
	cast_fx  	= "particles/gadget/disable_ships_wave",
	aura_start_sound = "sound/gadgets/stealth_on",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenCommanderEmergency", },
	},

}

Spell.Spell_GreenCommanderHullRep =
{

	target					= ai.SpellTarget.CASTER,
	aura_target 			= ai.SpellTarget.HOLDER,
	
	aura					= ai.Aura.HEAL_HULL_PERIODIC,
	
	aura_param		= 200, -- *модификатор.
	mod_max			= 5,
	
	mod_update_period = 5,
	period			= 1,	
	--duration		= 10,
	ignore_stacks	= true,
	ignore_subtype	= true,
	
	mod_range		= 150,	
	mod_target		= 
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ALLY,
				misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= true,
	disable_zero_stage = true,

	ui_ico = { target_system 	= { tex = "ItemSubtype_GreenCommanderHullRep", }, },	
}

Spell.Spell_GreenEnemyDodger_left = 
{

	target =
	{
		target = ai.SpellTargetGeneral.CASTER,

		-- class = ai.SpellTargetClass.SHIP,
		-- relationship = ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_target =
	{
		target = ai.SpellTargetGeneral.LOCKED_TARGET + ai.SpellTargetGeneral.CONTEXT_POSITION,
	--	misc = ai.SpellTargetMisc.POSITION, 
	},
	
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_range 		= 120,
	duration		= 0.75, --1, --3
	aura_param		= 1000,
	aura_holder_offset = Vec3( 5, 0, 0 ),
	aura_holder_attach_bone = "root",

	isBuff			= false,
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_GreenEnemyDodger", },
	},
	--aura_start_sound 	= "sound/gadgets/EmergencyBarrier",
	aura_start_sound = "sound/gadgets/ReverseThruster_activate",
}

Spell.Spell_GreenEnemyDodger_r =
{
	inherit 			= "Spell_GreenEnemyDodger_left",
	aura_holder_offset	= Vec3(-5, 0, 0),
}

Spell.Spell_GreenEnemyDodger_up =
{
	inherit 			= "Spell_GreenEnemyDodger_left",
	aura_holder_offset	= Vec3(0, 5, 0),
}

Spell.Spell_GreenEnemyDodger_down =
{
	inherit 			= "Spell_GreenEnemyDodger_left",
	aura_holder_offset	= Vec3(0, -5, 0),
}

Spell.Spell_GreenEngineFirerate_min = 
{
	aura 			= ai.Aura.FIRE_RATE_MOD, 
	isBuff			= true,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_param		= 0.05,
	hud_visible		= true,
	ignore_stacks	= false,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_GreenCapFirerate" } },	
}

Spell.Spell_GreenEngineFirerate_max = 
{
	aura 			= ai.Aura.FIRE_RATE_MOD, 
	isBuff			= true,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_param		= 0.3,
	hud_visible		= true,
	ignore_stacks	= false,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_GreenCapFirerate" } },
	additional_auras =
	{
		{
		aura 			= ai.Aura.HEAT_MUL, 
		isBuff			= false,
		target			= { target = ai.SpellTargetGeneral.CASTER, },
		aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
		aura_param		= 0.8,
		hud_visible		= true,
		gameplay_specific	= true,
		ignore_stacks	= false,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_GreenCapFirerate" } },
		},
	
	},
}

Spell.Spell_ShrikeBall_equip =
{
	aura 			= ai.Aura.SHIELD_RESIST_ALL, 
	isBuff			= true,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_param		= 30,
	hud_visible		= true,
	ignore_stacks	= false,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShrikeBall", },
	},
}

Spell.Spell_ShrikeBall_Buff =
{
	aura 			= ai.Aura.SHIELD_RESIST_ALL, 
	isBuff			= true,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_param		= 160,
	hud_visible		= true,
	ignore_stacks	= false,
	
	duration		= 8,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShrikeBall", },
	},
	
	additional_auras =
	{
		{
		isBuff 			= true,
		target 			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		aura			= ai.Aura.FAST_MOVEMENT,
		aura_param		= 0.35,
		duration		= 8,
		period			= 1,
		--aura_param_add	= -0.023, --0,035
		--dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
		ui_ico 			= {	target_system 	= { tex = "ItemSubtype_ShrikeBall", },	},
		},
	
	},
}

Spell.Spell_ShrikeBall_RocketRedirection = 
{
	target = 	{
		class 			= ai.SpellTargetClass.ROCKET,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	target_range = 300,
	influence = ai.Spell.HACK_ROCKET,
	redirect_to_locked_target_amount = 32,
	isBuff			= false,
	influence_beam_fx = "particles/gadget/weaponhacker_beam",
	redirect_to_target = {
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	redirect_range = 300,
	max_rockets_per_target = 32,
	
	duration		= 8,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShrikeBall", },
	},
}

Spell.Spell_ShrikeBallCharge =	--Курсовой пирлуч для крыхи БП Весна 2023
{
	target					= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura 					= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target = 
	{
		class         		 = ai.SpellTargetClass.SHIP --корабли
							 + ai.SpellTargetClass.TURRET  --турели
							 + ai.SpellTargetClass.CARGOSHIP --каргошипы
							 + ai.SpellTargetClass.TORPEDO --вроде как торпеды в бзс
							 + ai.SpellTargetClass.GUIDED_DRONE --дроны
							 + ai.SpellTargetClass.BATTLE_STATION, -- боевые станции
		area          		 = ai.SpellTargetArea.AROUND,
		relationship  		 = ai.SpellTargetRelationship.ENEMY
							 + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_holder_def			= "ShrikeBall",  --вызывает объект
	aura_holder_attach_bone	= "root",	--кость к которй крепится объект
	aura_holder_offset		= Vec3( 0, 0, -4 ), -- начальная точка откуда пойдет луч относительно кастера

	aura_range				= 3, --длина луча х10м
	-- aura_range_add			= 30,

	aura_param				= 100,
	duration 				= 1.5,
	period					= 0.2,
	isBuff					= false,
	hud_visible				= false, --отображение иконки в строке дебафов
	
	--effect					= "particles/gadget/jericho_active_module_sphere",
	cast_sound	 			= "sound/destroyer/TRay_beam",

	
	holder_spell_in_the_end	= 	"Spell_ShrikeBallExposive", --"каст спела после окончания луча 1",
	
}




Spell.Spell_ShrikeBallExposive =	--Курсовой пирлуч для крыхи БП Весна 2023
{
	inherit	= "Spell_ShrikeBallCharge",
	
	aura_holder_def			= "ShrikeBall2",
	
	aura_range				= 3, --длина луча х10м
	aura_range_add			= 30,

	aura_param				= 3000,
	--aura_param_add			= -650,
	duration 				= 3,
	period					= 0.3,
	
	holder_spell_in_the_end	= 	"",
	
}

Spell.Spell_TurnGun =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	
	aura 				= ai.Aura.DAMAGE_DEC,
	aura_param			= 1,  
	duration			= 4,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_TurnGun", },
	},

	aura_fx = "particles/gadget/damage_emp_plasma",
}

Spell.Spell_ShrikeHealAll =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER, 
	},
	
	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= true,
	
	aura 				= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param			= 1200,
	period				= 1,	
	duration			= 10,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShrikeHealAll", },
	},
	
	additional_auras =
	{
		{
		isBuff 			= true,
		target =
			{
			target 			= ai.SpellTargetGeneral.CASTER, 
			},
		aura_target		= ai.SpellTarget.CASTER,
		aura 			= ai.Aura.HEAL_HULL_PERIODIC,
		aura_param		= 1200,
		period			= 1,	
		duration		= 10,

		ui_ico 			= {	target_system 	= { tex = "ItemSubtype_ShrikeHealAll", },	},		
		},
	
	},	

	--aura_fx = "particles/gadget/damage_emp_plasma",
}

Spell.Spell_ShrikeAttraction =
{
	target =
	{
		target 			= ai.SpellTargetGeneral.CASTER, 
	},
	
	--aura_target 		= ai.SpellTarget.HOLDER,
	aura_target =
			{
				class 			= ai.SpellTargetClass.SHIP,
				relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
				area			= ai.SpellTargetArea.AROUND,  --цилиндр радиуса aura_range и длиной target_range
			},
	isBuff				= false,
	
	aura_range 			= 20,
	aura 				= ai.Aura.SHIP_ATTRACTION,
	aura_param			= -75,  
	--period			= 4,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShrikeAttraction", },
	},

	aura_fx = "particles/gadget/damage_emp_plasma",
}

-- Spell.Spell_Pilums1 = -- спелл сидит в пуле
-- {
	-- target =
	-- {
		-- target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		-- class			= ai.SpellTargetClass.SHIP,
		-- relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		-- vitality		= ai.SpellTargetVitality.ALIVE,
	-- },
	
	-- aura_target			= ai.SpellTargetGeneral.HOLDER,
	
	-- --influence			= ai.Spell.CAST_SPELLS,
	
	-- aura 				= ai.Aura.CAST_SPELL_PERIODIC,
	
	-- target_spell		= { 'Sneeze_1', },
	
	-- duration = 1,
	-- period = 2,

-- }

Spell.Spell_Pilums1 =
{
	target				= 
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	
		aura_target = 
	{
		target				= ai.SpellTargetGeneral.HOLDER,
	},
	
	aura 					= ai.Aura.SLOW_MOVEMENT,
	
	isBuff					= false,
	aura_param				= 0.3333,
	duration				= 10,--7,
	
	period 					= 1,
	--period_module_fx_number_by_stacks = { 3 },
	
	-- can_stack				= true,
	-- max_stacks				= 3,
	
	aura_fx			= "particles/gadget/special/pilum_module_spell", --при изменении времени работы, ОБЯЗАТЕЛЬНО перезаказать эффект

	ignore_stacks		= true,
	ignore_subtype		= true,	
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Pilums", },
	},
	
	additional_auras =
	{
		{
			target				= 
			{
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	
			aura_target = {		target = ai.SpellTargetGeneral.HOLDER,	},
			
			aura 					= ai.Aura.DISABLE_WARP,
			
			ignore_subtype			= false,
			ignore_stacks			= false,
	
			isBuff					= false,
			duration				= 10,--7,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Pilums", },
			},
			
		},
		{
			target				= 
			{
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	
			aura_target = {		target = ai.SpellTargetGeneral.HOLDER,	},
			
			aura 					= ai.Aura.DAMAGE_EMP_PERIODIC,
	
			isBuff					= false,
			aura_param				= 150,
			duration				= 10,--7,
			period					= 1,
			
			can_stack				= true,
			max_stacks				= 3,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Pilums", },
			},
			
		},
		
	},
}

Spell.Spell_PilumStatic = 
{

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target =
	{
		target 				= ai.SpellTargetGeneral.TRIGGER_TARGET,
		class 				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
	},
	
	aura 					= ai.Aura.DISABLE_WARP,
	duration 				= 10,--16.0,
	
	aura_range				= 50,
	ignore_subtype			= true,
	ignore_stacks			= true,
	
	--spell_on_cancel 		= "FlameThrowerFire",
	isBuff					= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Pilums", },
	},
}

Spell.Spell_FireBallThrower =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.DAMAGE_THERMAL_SCALED, -- -50% хила
	duration		= 3,
	aura_param		= 50, --33% непрерывного урона
	can_stack		= true,
	max_stacks		= 10,
	period			= 0.5,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FireBallThrower", },
	},
	period_fx		= "particles/weapons/other/fireball_hit_spell",


}

Spell.Spell_PilumAntiHeat =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.CASTER,
	aura			= ai.Aura.DISABLE_HEAT,
	duration		= 5,
	isBuff			= true,

	hud_visible 	= true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_PilumAntiHeat", },
	},
}	

Spell.Spell_PilumAntiHeatDamageMul =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.CASTER,
	aura			= ai.Aura.DAMAGE_MOD,
	duration		= 5,
	aura_param		= 0.4,
	isBuff			= true,

	hud_visible 	= true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_PilumAntiHeat", },
	},
}	

Spell.Spell_PilumSpecialDamage = {
	target				= ai.SpellTarget.CASTER,
	aura_target = { target 				= ai.SpellTargetGeneral.HOLDER, },
	aura				= ai.Aura.DAMAGE_MOD,
	aura_param			= 0.15, --  4090 - база, 5000 ожидание 3000 - целевой хил  - 60
	duration			= 10,
	-- dispell_flag		= ai.Dispell.ON_DAMAGE  + ai.Dispell.ON_COLLISION  --+ ai.Dispell.ON_MODULE, --+ 
	-- dispell_timeout		= 2,
	isBuff				= true,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PilumSpecialDamage", },
	},
	
}

Spell.Spell_Minigun_Pirate = -- пиратский кинетический нагнетатель
{
	influence		= ai.Spell.APPLY_AURA,
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,-- + 
		vitality		= ai.SpellTargetVitality.ALIVE,
	},

	aura_target 		= ai.SpellTarget.HOLDER,
	isBuff				= false,
	aura 				= ai.Aura.HULL_RESIST_KINETIC_DEC,
	aura_param			= 10,
	duration			= 5,
	can_stack			= true,
	max_stacks			= 5,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Minigun_3", },
	},
	
}

Spell.Spell_RailGunBasic_Pirate_Crit =
{ 

	aura				= ai.Aura.CRIT_CHANCE,
	aura_target			= ai.SpellTarget.CASTER,
	hit_target =
	{
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship		= ai.SpellTargetRelationship.ENEMY,
	},
		duration			= 7,
	isBuff				= true,
	aura_param			= 0.05,
	can_stack			= true,
	max_stacks			= 10,
	ui_ico 				= {	target_system = { tex = "ItemSubtype_RailgunBasic_5", }, },
	
}	

Spell.Spell_RailGunBasic_Pirate_Daamge =
{
	aura				= ai.Aura.DAMAGE_MOD,
	aura_target			= ai.SpellTarget.CASTER,
	hit_target =
		{
			target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
			class				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
			relationship		= ai.SpellTargetRelationship.ENEMY,
		},
	duration			= 7,
	isBuff				= true,
	aura_param			= 0.02,
	can_stack			= true,
	max_stacks			= 10,
	ui_ico 				= {	target_system = { tex = "ItemSubtype_RailgunBasic_5", }, },
}

Spell.Spell_HeliosDisintegratorBuffMax = 
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.CASTER,
	aura			= ai.Aura.SNIPER_OVERLOAD,	-- вернул стайперам былую силу
	aura_param		= 0.5,		

	isBuff			= true,
	gameplay_specific = true,
	hud_visible 	= true,
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
}


Spell.Spell_HeliosDisintegratorBuff = {
	aura			= ai.Aura.SNIPER_PROJECTILE_SPELL,
	target_spell 	= "Spell_HeliosDisintegratorBuff1",
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	isBuff			= true,	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SniperDamageZone", },
	},
}

Spell.Spell_HeliosDisintegratorBuff1 = 
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	target			= {
						target 			= ai.SpellTargetGeneral.CONTEXT_POSITION,
						misc	= ai.SpellTargetMisc.POSITION,
				},
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
						area	= ai.SpellTargetArea.AROUND,
					},
					
					
	aura_range		= 12,				
	period			= 0.25,
	duration		= 2,
	aura_param		= 375,
	isBuff			= false,
	ignore_stacks	= true,
	ignore_subtype	= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SniperDamageZone", },
	},
	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound 		= "sound/aura/voidzone",
}


Spell.Spell_HeliosWingDeath_l =
{ 

	aura				= ai.Aura.CRIT_CHANCE,
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	duration			= 60,
	isBuff				= false,
	hud_visible			= false,
	hud_visible_holder	= false,
	aura_param			= 0.05,
	gameplay_specific = true,
	ui_ico 				= {	target_system = { tex = "ItemSubtype_ReverseThruster", }, },
	
}	

Spell.Spell_HeliosWingDeath_r =
{
	inherit	= "Spell_HeliosWingDeath_l",
	aura				= ai.Aura.RESIST_ALL,
}

Spell.Spell_HeliosWingstart_l =
{ 

	aura				= ai.Aura.CRIT_CHANCE,
	target			= {
						target = ai.SpellTargetGeneral.CASTER,
					},
	aura_target		= {
						target = ai.SpellTargetGeneral.HOLDER,
				},
	duration			= 1.2,
	aura_param			= 0.01,
	isBuff				= true,
	hud_visible			= false,
	hud_visible_holder	= false,
	--gameplay_specific = true,
	ui_ico 				= {	target_system = { tex = "ItemSubtype_ReverseThruster", }, },
	aura_fx 		= "particles/gadget/teleport_prepare",
	aura_start_sound = "sound/gadgets/ReverseThruster_prepare",
	spell_on_cancel		= "Spell_HeliosDodge_l",
	
	additional_auras	=
	{
		{
			target 			= ai.SpellTarget.CASTER,
			isBuff					= true,
			hud_visible				= false,
			--gameplay_specific 		= true,
			aura			= ai.Aura.UNTOUCHABLE,
			duration		= 0.2,
			gameplay_specific 		= true,
			--cast_position_fx = "particles/gadget/warp",		
		},
	},
}	

Spell.Spell_HeliosWingstart_r =
{
	inherit	= "Spell_HeliosWingstart_l",
	aura				= ai.Aura.RESIST_ALL,
	spell_on_cancel		= "Spell_HeliosDodge_r",
}

Spell.Spell_HeliosDodge_l = 
{

	target 			= {
		target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION,
	},
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_target = 
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_range 		= 6,
	duration		= 1, --1, --3
	aura_param		= 1000,
	aura_holder_offset = Vec3( 5, 0, 0 ),
	aura_holder_attach_bone = "root",
	isBuff			= true,
	gameplay_specific = true,
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_DodgeDrive", },
	},
	
	aura_start_sound = "sound/gadgets/ReverseThruster_activate",
	spell_on_cancel	= "Spell_HeliosDodge_cooldown",

}

Spell.Spell_HeliosDodge_r =
{
	inherit 			= "Spell_HeliosDodge_l",
	aura_holder_offset	= Vec3(-5, 0, 0),
}

Spell.Spell_HeliosDodge_cooldown = {
	duration = 30,
	target=ai.SpellTarget.CASTER,
	aura=ai.Aura.DISABLE_WARP,
	isBuff=false,
	gameplay_specific = true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ReverseThruster", },
	},
}

Spell.Spell_HeliSpark_H =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.HUGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_EMP_PERIODIC,
			isBuff					= false,
			aura_param				= 9900*1.5, --*0.75, 
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,

 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_HeliSpark", },
			},
	}

Spell.Spell_heliboom =
{
	isBuff			= true,
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.SNIPER_PROJECTILE_SPELL,
	duration		= 20,
	target_spell	= "Spell_heliboom1",
	aura_range		= 8000, -- для тултипа 
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Heliboom", },
	},
}	

Spell.Spell_heliboom1 =
{
	
	influence 				= ai.Spell.EXPLOSION,
	--target			= ai.SpellTargetGeneral.CONTEXT_POSITION,
		target =
		{
			target = ai.SpellTargetGeneral.CONTEXT_TARGET,
			misc			= ai.SpellTargetMisc.CONTEXT_POSITION,
		},
	target_range	= 14,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Heliboom", },
	},
	explosion_blast_wave	= "Blastwave_Heliboom",
}

Spell.Spell_HeliAntiRadar =
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= 
						{
						target = ai.SpellTargetGeneral.HOLDER,
						},
	aura			= ai.Aura.CAMO_MOD,
	aura_param		= 9,
	
	isBuff			= true,
	hud_visible			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HeliAntiRadar", },
	},
	--aura_fx = "StealthEffect",
		
}


Spell.Spell_PsiloiBooster =
{
	target 			= {	target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION, },
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_target 	= {	target = ai.SpellTargetGeneral.CASTER, },
	--spell_on_cancel	= "MicroWarp_Winter_Drive1",
	aura_range 		= 100,
	duration		= 15.0,
	aura_param		= 100,

	aura_holder_def = "PsiloiBooster",

	aura_holder_offset 		= Vec3( 0, 1, -5 ),
	aura_holder_attach_bone = "root",
	check_spawn_collision 	= true,
	isBuff					= true,
	hud_visible				= true,
	
	dispell_flag				= ai.Dispell.ON_FIRE,
	
	aura_main_fx 		= "particles/gadget/special/beam_psiloibooster",
	
	spell_on_cancel	= "Spell_PsiloiBooster_Drive1",
	
	aura_end_sound	= "sound/gadgets2/PsiloiBooster_end",
	
	additional_auras =
	{
		-- {
		-- target 			= {	target = ai.SpellTargetGeneral.CASTER, },
		-- aura_target 	= {	target = ai.SpellTargetGeneral.CASTER, },
		-- aura			= ai.Aura.DISABLED_WEAPON,
		
		-- isBuff					= true,
		-- hud_visible				= true,
		
		-- duration		= 15.0,		
		
		-- ui_ico =
		-- {
		-- target_system 	= { tex = "ItemSubtype_PsiloiBooster", },
		-- },
		
		-- },
		{
		target 			= {	target = ai.SpellTargetGeneral.CASTER, },
		aura_target 	= {	target = ai.SpellTargetGeneral.CASTER, },
		aura			= ai.Aura.SLOW_MANEUVER,
		
		isBuff					= true,
		hud_visible				= false,
		gameplay_specific		= true,
		aura_param				= 0.428571,
		
		duration		= 15.0,		
		
		dispell_flag				= ai.Dispell.ON_FIRE,
		
		ui_ico =
		{
		target_system 	= { tex = "ItemSubtype_PsiloiBooster", },
		},
		
		},
	},

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PsiloiBooster", },
	},
	
}

Spell.Spell_PsiloiBooster_Drive1 = -- торможение
{
	target 			= {
		target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION,
	},
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_target = 
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_range 		= 100,
	duration		= 2, --1, --3
	aura_param		= 80,
	aura_param_add	= -35,
	aura_holder_offset = Vec3( 0, 0, -50 ),
	aura_holder_attach_bone = "root",
	--check_spawn_collision = true,
	hud_visible		= false,
	isBuff			= true,
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_MicroWarp_Winter", },
	},
	
	--aura_start_sound 	= "sound/gadgets/EmergencyBarrier",
	--aura_start_sound = "sound/gadgets/ReverseThruster_activate",
}

Spell.Spell_PsiloiStarSail_FireRate = {
	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.FIRE_RATE_MOD,
	isBuff				= true,
	duration			= 12,
	aura_param			= 0.20,
	ui_ico 				=
		{
		target_system = { tex = "ItemSubtype_PsiloiStarSail", },
		},
}

Spell.Spell_PsiloiStarSail_New = {

	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.FAST_MANEUVER,
	isBuff				= true,
	duration			= 12,
	aura_param			= 0.15,
	ui_ico 				=
		{
			target_system = { tex = "ItemSubtype_PsiloiStarSail", },
		},
	
	additional_auras =
	{
		{
		target				= ai.SpellTarget.CASTER,
		aura_target			= ai.SpellTarget.HOLDER,
		aura				= ai.Aura.HEAL_SHIELD_PERIODIC,
		isBuff				= true,
		duration			= 12,
		period				= 1,
		aura_param			= 200,
		ui_ico 				=
			{
			target_system = { tex = "ItemSubtype_PsiloiStarSail", },
			},
		},
		{
		target				= ai.SpellTarget.CASTER,
		aura_target			= ai.SpellTarget.HOLDER,
		aura				= ai.Aura.HEAL_HULL_PERIODIC,
		isBuff				= true,
		duration			= 12,
		period				= 1,
		aura_param			= 200,
		ui_ico 				=
			{
			target_system = { tex = "ItemSubtype_PsiloiStarSail", },
			},
		},
	},
}

Spell.Spell_PsiloiAutoEmergency =
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura		= ai.Aura.ADD_ENERGY_PERIODIC,
	aura_param = 500,
	duration		= 1,
	period			= 1,
	aura_fx = "particles/gadget/shelter_shield",
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PsiloiAutoEmergency", },
	},
	
	additional_auras =
	{
		{
		target			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		aura		= ai.Aura.HEAL_HULL_PERIODIC,
		aura_param = 1500,
		duration		= 1,
		period			= 1,
		isBuff			= true,
		ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_PsiloiAutoEmergency", },
		},
		},
	},
}

Spell.Spell_DestrSpecial_Stealth = 
{
	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.STEALTH,
	isBuff				= true,
	duration			= 5,
	
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE, 
	
	ui_ico 				=
		{
		target_system = { tex = "ItemSubtype_BasheSpecial", },
		},
		
	additional_auras =
	{
		{
		target				= ai.SpellTarget.CASTER,
		aura_target			= ai.SpellTarget.HOLDER,
		aura				= ai.Aura.FAST_MANEUVER,
		isBuff				= true,
		duration			= 1.2,
		aura_param			= 3,
		ui_ico 				=
			{
			target_system = { tex = "ItemSubtype_BasheSpecial", },
			},
		},
		{
		target				= ai.SpellTarget.CASTER,
		aura_target			= ai.SpellTarget.HOLDER,
		aura				= ai.Aura.HEAL_HULL_PERIODIC,
		isBuff				= true,
		duration			= 9,
		aura_param			= 5000,
		ui_ico 				=
			{
			target_system = { tex = "ItemSubtype_BasheSpecial", },
			},
		},
	},		
}

Spell.Spell_DestrSpecial_mov = -- торможение
{
	target 			= {
		target = ai.SpellTargetGeneral.CASTER, misc = ai.SpellTargetMisc.POSITION,
	},
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_target = 
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura_range 		= 100,
	duration		= 1.2, --1, --3
	aura_param		= 800,
	aura_param_add	= -500,
	aura_holder_offset = Vec3( 0, -0, -50 ),
	aura_holder_attach_bone = "root",
	--check_spawn_collision = true,
	hud_visible		= false,
	isBuff			= true,
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_BasheSpecial", },
	},
}

Spell.Spell_BasheGun_Cast1 =
{
	
	influence		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.INFLICTOR,

	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "Spell_BasheGun_Damage1",
	duration		= 50,
	period			= 0.6,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_BasheGun" } },
}

Spell.Spell_BasheGun_Damage1 =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,						
					},
	aura_range 		= 5,
	
	aura_range_add	= 16,
	aura_range_add_max = 50,
	aura_param		= 3000,
	aura_param_add	= -600,
	scale_on_weapon	= true,
	duration		= 3,
	period 			= 0.8,

	isBuff			= false,
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_BasheGun" } },
	
	nebula			= "Effects_Nebula_Emissions",
	cast_position_fx	= "particles/weapons/other/bashee_gun_position_fx",
	--cast_position_fx	="particles/weapons/other/echo_projectile",

}

Spell.Spell_BasheGun_Cast2 =
{
	inherit			= "Spell_BasheGun_Cast1",
	
	target_spell	= "Spell_BasheGun_Damage2",
	duration		= 50,
	period 			= 0.6,
}

Spell.Spell_BasheGun_Damage2 =
{
	inherit			= "Spell_BasheGun_Damage1",
	aura_param		= 5000,
	cast_position_fx	= "particles/weapons/other/bashee_gun_position_fx2",
}

Spell.Spell_BasheGun_Clone =
{
	inherit			= "Spell_BasheGun_Cast1",
	
	target_spell	= "Spell_BasheGun_Clone2",
	duration		= 50,
	period			= 0.6,
}

Spell.Spell_BasheGun_Clone2 =
{
	inherit			= "Spell_BasheGun_Damage1",
	aura_param		= 0,	
	cast_position_fx	= "particles/weapons/other/bashee_gun_position_fx2",
}

Spell.Spell_BasheCpuDamage_dec = 
{
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura				= ai.Aura.DAMAGE_DEC,
	aura_range			= 75,	
	isBuff				= false,
	aura_param			= 0.4555,
	--duration			= 15,	
	ui_ico 				=
		{
			target_system = { tex = "ItemSubtype_BashePassive1", },
		},
	additional_auras =
	{
		{
		target				= ai.SpellTarget.CASTER,
		aura_target =
		{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			vitality		= ai.SpellTargetVitality.ALIVE,
		},
		aura				= ai.Aura.MODULE_DAMAGE_MOD,
		aura_range			= 75,	
		isBuff				= false,
		aura_param			= -0.43333,
		--duration			= 15,	
		ui_ico 				=
			{
				target_system = { tex = "ItemSubtype_BashePassive1", },
			},
		},
	},		
}


Spell.Spell_PerseiSpecial_antirader = 
{
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,

	--duration			= 15,
	isBuff 				= true,
	
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	period			= 1,
	aura_param		= 500,
	
	spell_on_cancel = "Spell_PerseiSpecial_Mine",
	
	aura_fx = "StealthEffectPersei",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PerseiSpecial", },
	},
	additional_auras = 
	{

		{  -- + хил шилд
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura 				= ai.Aura.ANTI_RADAR,
			--duration		= 3,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PerseiSpecial", },
			},
		},
		{  -- + хил корп
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.HEAL_HULL_PERIODIC,
			period			= 1,
			aura_param		= 500,
			--duration		= 3,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PerseiSpecial", },
			},
		},
	}	
}



Spell.Spell_PerseiSpecial_Takeoff =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_PerseiSpecial_Mine', 'Spell_PerseiSpecial_Takeoff2' }
}

Spell.Spell_PerseiSpecial_Takeoff2 = 
{
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,

	duration			= 15,
	isBuff 				= true,
	hud_visible			= true,
	
	aura			= ai.Aura.ANTI_RADAR,

	aura_fx = "StealthEffectPersei",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PerseiSpecial", },
	},
	
}	

Spell.Spell_PerseiSpecial_Mine = 
{
	aura = ai.Aura.SHIP_ATTRACTION,
	aura_param			= 45,

	target				= 	
	{
		target         = ai.SpellTargetGeneral.CASTER,
		misc           = ai.SpellTargetMisc.POSITION,
	},
	aura_holder_def		= "PerseiSpecial_Mine",
	
	aura_target = 
	{
		aura_target			= ai.SpellTarget.HOLDER, 
		class 				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.AROUND,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		--relationship		= ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY,
	},
	
	duration = 15,
	aura_range			= 120,
	isBuff = false,
	hud_visible 		= true,
	min_targets_count = 0,

	ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PerseiSpecial", },
			},
			
	aura_fx ="particles/gadget/persei_black_hole",
	additional_auras = 
	{
		{
			aura = ai.Aura.DISABLE_WARP,
			duration = 15,

			aura_target = 
			{

				aura_target			= ai.SpellTarget.HOLDER, 
				class 				= ai.SpellTargetClass.SHIP,
				area				= ai.SpellTargetArea.AROUND,
				relationship		= ai.SpellTargetRelationship.ENEMY,
				--relationship		= ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.ENEMY,
			},
			aura_range			= 120,			
			
			ignore_stacks = true,
			ignore_subtype = true,

			isBuff			= false, -- SC-118152
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PerseiSpecial", },
			},
		}
	}
}

Spell.Spell_PerseiActive =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},

	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 20,
	aura_range		= 300,

	aura 			= ai.Aura.SHIP_ATTRACTION,
	aura_param		= 15,   --x2

	duration 		= 6, --0.2,
	--period			= 1,
	isBuff			= false,
	work_beam_fx	= "particles/gadget/persei_attraction_beam",

	ray_sound 		= "sound/destroyer/TRay2_beam",
	cast_sound 			= "sound/destroyer/TRay2_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PerseiActive", },
	},
	
	-- additional_auras =
		-- {
			-- {
			
			-- },
		-- },
}

Spell.Spell_PerseiActive2 =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},

	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 20,
	aura_range		= 300,

	aura 			= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 1,   --x2

	duration 		= 6, --0.2,
	--period			= 1,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PerseiActive", },
	},
}

Spell.Spell_Persei_CPU_ControllImmune = --#83046
{
	aura = ai.Aura.CONTROL_IMMUNE_DEFERRED,
	--duration = 50,
	deferred_duration = 60,
	isBuff = true,
	target = 	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	target_range = 300,
	aura_target = ai.SpellTarget.HOLDER,
	target_spell = "SupressorResist",
	ui_ico = { target_system = { tex = "ItemSubtype_PerseiPassive1", }, },
}

Spell.Spell_GreenGuardTimeBomb_cast = -- 50% шанс дамага
{
	influence=ai.Spell.CAST_SPELLS,
	spells={'Spell_GreenGuardTimeBomb_minfr1','Spell_GreenGuardTimeBomb_minCD1', 'Spell_GreenGuardTimeBomb_minProjSPD1' },
}

Spell.Spell_GreenGuardTimeBomb_minspeed =
{
	
	target =	{
				target			= ai.SpellTargetGeneral.CASTER,
				},
	
	aura_target	= {
				class 			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY_AROUND,
				misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
				},
	
	aura				= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 0.01,
	aura_param_add	= 0.03,
	duration		= 50,
	
	aura_range		= 200,
	
	isBuff				= false,
	gameplay_specific	= false,
	hud_visible			= true,
	
	ui_ico = { target_system = { tex = "ItemSubtype_GreenGuardTimeBomb", }, },
}
Spell.Spell_GreenGuardTimeBomb_minfr1 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minspeed",
	aura				= ai.Aura.FIRE_RATE_MOD,
	aura_param		= -0.1111,
	aura_param_add	= 0,
	duration		= 10,
	spell_on_cancel	= "Spell_GreenGuardTimeBomb_minfr2",
}
Spell.Spell_GreenGuardTimeBomb_minfr2 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minfr1",
	aura_param		= -0.25,
	spell_on_cancel	= "Spell_GreenGuardTimeBomb_minfr3",
}
Spell.Spell_GreenGuardTimeBomb_minfr3 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minfr1",
	aura_param		= -0.4388,
	spell_on_cancel	= "Spell_GreenGuardTimeBomb_minfr4",
}
Spell.Spell_GreenGuardTimeBomb_minfr4 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minfr1",
	aura_param		= -0.6666,
	spell_on_cancel	= "Spell_GreenGuardTimeBomb_minfr5",
}
Spell.Spell_GreenGuardTimeBomb_minfr5 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minfr1",
	aura_param		= -1.0,
	spell_on_cancel	= "",
}


Spell.Spell_GreenGuardTimeBomb_minCD1 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minspeed",
	aura				= ai.Aura.COOLDOWN_MOD,
	aura_param		= 0.1,
	aura_param_add	= 0,
	duration		= 10,
	spell_on_cancel	= "Spell_GreenGuardTimeBomb_minCD2",
}
Spell.Spell_GreenGuardTimeBomb_minCD2 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minCD1",
	aura_param		= 0.2,
	spell_on_cancel	= "Spell_GreenGuardTimeBomb_minCD3",
}
Spell.Spell_GreenGuardTimeBomb_minCD3 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minCD1",
	aura_param		= 0.3,
	spell_on_cancel	= "Spell_GreenGuardTimeBomb_minCD4",
}
Spell.Spell_GreenGuardTimeBomb_minCD4 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minCD1",
	aura_param		= 0.4,
	spell_on_cancel	= "Spell_GreenGuardTimeBomb_minCD5",
}
Spell.Spell_GreenGuardTimeBomb_minfr5 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minCD1",
	aura_param		= 0.5,
	spell_on_cancel	= "",
}	
	
Spell.Spell_GreenGuardTimeBomb_minProjSPD1 =
{
	inherit			= "Spell_GreenGuardTimeBomb_minspeed",
	aura				= ai.Aura.PROJECTILE_SPEED_MOD,
	aura_param		= -100,
	aura_param_add	= 0,
	duration		= 50,
	spell_on_cancel	= "Spell_GreenGuardTimeBomb_minCD2",
}	

Spell.Spell_GG_TimeBomb_resistBonus =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },
	aura_target	= { target = ai.SpellTargetGeneral.CASTER, },
	aura				= ai.Aura.SHIELD_RESIST_ALL,
	aura_param		= 60,
	
	isBuff	= true,
	hud_visible = true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_GG_TimeBomb", }, },
}	

Spell.Spell_GreenGuard_TB2 = -- +урон
{

	target					= ai.SpellTarget.CASTER,
	aura_target	= {
				class 			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.AROUND,
				misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
				},
	
	aura					= ai.Aura.SLOW_MOVEMENT,
	aura_range		= 300,	
	aura_param		= 0.1, -- *модификатор.
	aura_param_stages = { 1, 2, 4, 6, 8, 10, },
	mod_max			= 5,
	
	mod_update_period = 1,
	--period			= 0.2,	
	duration		= 15,
	ignore_stacks	= true,
	ignore_subtype	= true,
	
	mod_range		= 300,	
		mod_target		= 
				{
					class			= ai.SpellTargetClass.SHIP,
					area			= ai.SpellTargetArea.AROUND,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
				},
	--hud_visible 	= false, -- прячем от игрока
	isBuff			= false,
	--disable_zero_stage = false,
	
	ui_ico = { target_system 	= { tex = "ItemSubtype_GG_TimeBomb", }, },
	
	additional_auras = 
	{
		{
		target					= ai.SpellTarget.CASTER,
			aura_target	= {
				class 			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.AROUND,
				misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
				},
		
		aura					= ai.Aura.COOLDOWN_MOD,
		aura_range		= 300,
		aura_param		= 0.05, -- *модификатор.
		aura_param_stages = { 1, 2, 4, 6, 8, 10, },
		mod_max			= 5,
		
		mod_update_period = 2,
		--period			= 0.2,	
		duration		= 15,
		ignore_stacks	= true,
		ignore_subtype	= true,
		
		mod_range		= 300,	
		mod_target		= 
				{
					class			= ai.SpellTargetClass.SHIP,
					area			= ai.SpellTargetArea.AROUND,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
				},
	--hud_visible 	= false, -- прячем от игрока
		isBuff			= false,
		--disable_zero_stage = true,
	
		ui_ico = { target_system 	= { tex = "ItemSubtype_GG_TimeBomb", }, },
		},
		{
		target					= ai.SpellTarget.CASTER,
			aura_target	= {
				class 			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.AROUND,
				misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
				},
		
		aura					= ai.Aura.FIRE_RATE_MOD,
		aura_range		= 300,
		aura_param_stages = { 1, 2, 4, 6, 8, 10, },
		aura_param		= -0.1, -- *модификатор.
		
		mod_max			= 5,
		
		mod_update_period = 2,
		--period			= 0.2,	
		duration		= 15,
		ignore_stacks	= true,
		ignore_subtype	= true,
		
		mod_range		= 300,	
		mod_target		= 
				{
					class			= ai.SpellTargetClass.SHIP,
					area			= ai.SpellTargetArea.AROUND,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
				},
	--hud_visible 	= false, -- прячем от игрока
		isBuff			= false,
		--disable_zero_stage = true,
	
		ui_ico = { target_system 	= { tex = "ItemSubtype_GG_TimeBomb", }, },
		},
		{
		target					= ai.SpellTarget.CASTER,
	aura_target	= {
				class 			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.AROUND,
				misc = ai.SpellTargetMisc.EXCLUDE_HOLDER,
				},
		
		aura					= ai.Aura.PROJECTILE_SPEED_MOD,
		aura_range		= 300,
		aura_param		= -1, -- *модификатор.
		mod_max			= 5,
		aura_param_stages = { 1, 2, 4, 6, 8, 10, },
		
		mod_update_period = 2,
		--period			= 0.2,	
		duration		= 15,
		ignore_stacks	= true,
		ignore_subtype	= true,
		
		mod_range		= 300,	
		mod_target		= 
				{
					class			= ai.SpellTargetClass.SHIP,
					area			= ai.SpellTargetArea.AROUND,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					misc 			= ai.SpellTargetMisc.EXCLUDE_CASTER,
				},
	--hud_visible 	= false, -- прячем от игрока
		isBuff			= false,
		--disable_zero_stage = true,
	
		ui_ico = { target_system 	= { tex = "ItemSubtype_GG_TimeBomb", }, },
		},
	},
}


Spell.Spell_GG_PhaseShield_emp =
{
	-- influence		= ai.Spell.APPLY_AURA,
	-- aura_target		= ai.SpellTarget.CASTER,
	aura			= ai.Aura.SHIELD_RESIST_EMP,
	isBuff			= true,
	aura_param		= 90,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Phase1", },
	},
	additional_auras =
	{
		{
			Spell.PhaseShield_Speed,
		},
		{
			target			= ai.SpellTarget.CASTER,
			aura_target 	= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.SHIELD_REGEN_MOD,
			isBuff			= true,
			aura_param		= 3,
			duration		= 8,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PhaseShield_Phase1", },
			},		
		},
	},	
}

Spell.Spell_GG_PhaseShield_Thermal =
{
	aura			= ai.Aura.SHIELD_RESIST_THERMAL,
	isBuff			= true,
	aura_param		= 90,
	ui_ico = 	{ 	target_system 	= { tex = "ItemSubtype_GreenGuard_PhaseShield", },	},
	additional_auras =
	{
		{
			Spell.PhaseShield_Speed,
		},
		{
			aura			= ai.Aura.DAMAGE_MOD,
			isBuff			= true,
			aura_param		= 0.2,
			duration		= 8,
			ui_ico = 	{ 	target_system 	= { tex = "ItemSubtype_GreenGuard_PhaseShield", },	},
		},
	},
}
Spell.Spell_GG_PhaseShield_Kinetic =
{
	aura			= ai.Aura.SHIELD_RESIST_KINETIC,
	isBuff			= true,
	aura_param		= 90,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Phase2", },
	},
	additional_auras =
	{
		{
			Spell.PhaseShield_Speed,
		},
		{
			aura			= ai.Aura.HEAL_HULL_PERIODIC,
			isBuff			= true,
			aura_param		= 1000,
			duration		= 8,
			period			= 1,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_PhaseShield_Phase2", },
			},
		},
	},
}

Spell.Spell_GG_PhaseShield_HitBuff =
{
	aura			= ai.Aura.COOLDOWN_MOD,
	aura_param		= -0.5,
	duration		= 3,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Raid_Buff", },
	},
}

Spell.Spell_FrostRay =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.COOLDOWN_MOD, -- -50% хила
	duration		= 3,
	aura_param		= 1, --33% непрерывного урона
	damage_to_spell_aura_param = true,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FrostRay", },
	},
	--aura_target_directed_fx 	= "particles/weapons/laser/radiation_beam_heat_aura",
}

Spell.Spell_GG_InvinsibleCone =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_CASTER,
	},

	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 20,
	aura_range		= 300,

	aura 			= ai.Aura.STEALTH,
	--aura_param		= 99,   --x2

	--duration 		= 3.5, --0.2,
	duration		= 12,
	period			= 1,
	isBuff			= true,
	work_beam_fx	= "particles/weapons/alien/alien_guard_beam",
	--work_beam_fx	= "particles/gadget/propulsion_beam",
	--aura_target_fx = "particles/gadget/slow_movement_fullstop",
	--aura_fx = "particles/gadget/slow_movement",
	ray_sound 		= "sound/destroyer/TRay_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HorrorHowl", },
	},
}

Spell.Spell_GG_DamageBoost_CargeResist = 
{
	aura 		= ai.Aura.SHIELD_RESIST_ALL,
	aura_param 	= 10,
	can_stack	= true,
	duration 	= 15,
	max_stacks	= 10,
	isBuff 		= true,
	target 		= ai.SpellTarget.CASTER,
	aura_target = ai.SpellTarget.HOLDER,
	ui_ico = { target_system = { tex = "ItemSubtype_GG_DamageBoost", }, },
	aura_fx		= "particles/gadget/alien_damageboost_stack",

	
	additional_auras = -- это собирает стаки
	{
		{
			influence	= ai.Spell.APPLY_AURA,
			aura		= ai.Aura.CHARGE_SPELL,
			target		= ai.SpellTarget.CASTER,
			aura_target	= ai.SpellTarget.CASTER,
			hud_visible	= false,
			max_stacks	= 10,
			duration 	= 15,
			aura_param	= 1.8,
			isBuff		= true,

			ui_ico =
			{
				target_system	= { tex = "ItemSubtype_GG_DamageBoost", },
			},
		},
	},
}

Spell.Spell_GG_DamageBoostClean = 
{
	influence 					= ai.Spell.DISPELL,
	target 						= ai.SpellTarget.CASTER,
	itemSubTypes				= { ItemSubtype.GG_DamageBoost },
}

Spell.Spell_GG_DamageBoost = 
{
			influence	= ai.Spell.APPLY_AURA,
			aura		= ai.Aura.DAMAGE_MOD,
			target		= ai.SpellTarget.CASTER,
			aura_target	= ai.SpellTarget.CASTER,
			hud_visible	= true,
			max_stacks	= 9,
			duration 	= 10,
			--period		= 10,
			aura_param	= 0.05243,
			
			isBuff		= true,
		
			--dispell_flag = 1,
			
			ui_ico 		= {	target_system	= { tex = "ItemSubtype_GG_DamageBoost", }, },
			aura_fx ="particles/gadget/alien_damageboost_active",
			
			additional_auras =
			{
			
				{
				isBuff 			= true,
				target 			= ai.SpellTarget.CASTER,
				aura_target		= ai.SpellTarget.HOLDER,
				aura			= ai.Aura.FAST_MOVEMENT,
				aura_param		= 0.35,
				duration		= 15,
				period			= 1,
				aura_param_add	= -0.023, --0.035
				ignore_additional_power = true,
				dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
				ui_ico =
				{
					target_system 	= { tex = "ItemSubtype_GG_DamageBoost", },
				},
				},
			},			

}

Spell.Spell_GG_BubbleGun =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.SLOW_MOVEMENT, -- -50% хила
	duration		= 7,
	aura_param		= 0.23555, --33% непрерывного урона
	can_stack		= true,
	max_stacks		= 10,
	--period			= 0.5,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GG_BubbleGun", },
	},
	period_fx		= "particles/weapons/alien/bubblegun_aura",

}

Spell.Spell_GG_Hipnodancer = 
{

	--target				= ai.SpellTarget.CASTER_POSITION_CASTER,
	target		= 	{
					target         = ai.SpellTargetGeneral.CASTER,
					vitality       = ai.SpellTargetVitality.ALIVE,
					},
	aura_target = 
	{
		--target				= ai.SpellTargetGeneral.HOLDER,
		--target				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.AROUND,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	
	aura = ai.Aura.SHIP_ATTRACTION,

	aura_param			= -200,
	duration = 10,
	aura_range			= 80,
	isBuff = false,
	hud_visible 		= true,
	ignore_additional_power 	= true,
	
	aura_fx ="particles/gadget/alien_hipnodancer_aura",
	ui_ico =
	{
	target_system 	= { tex = "ItemSubtype_GG_Hipnodancer", },
	},
	
	additional_auras = 
	{
		
		{
			target		= 	
				{
				target         = ai.SpellTargetGeneral.CASTER,
				vitality       = ai.SpellTargetVitality.ALIVE,
				},	
			aura_target = 
			{
				--target				= ai.SpellTargetGeneral.CONTEXT_TARGET,
				class 				= ai.SpellTargetClass.SHIP,
				relationship		= ai.SpellTargetRelationship.ENEMY,
				area				= ai.SpellTargetArea.AROUND,				
			},
			aura_range			= 80,
			aura = ai.Aura.RESIST_ALL_DEC,
			duration = 10,
			aura_param	= 30,
			ignore_stacks = false,
			ignore_subtype = false,
			hud_visible 		= false,
			work_beam_target_root_fx = "particles/gadget/cagetrap_beam",
			
			isBuff			= false, -- SC-118152
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_GG_Hipnodancer", },
			},
		},
	},
}

Spell.Spell_GG_HipnodancerClean = 
{

	target		= 	{
					target         = ai.SpellTargetGeneral.CASTER,
					vitality       = ai.SpellTargetVitality.ALIVE,
					--misc           = ai.SpellTargetMisc.POSITION,
					},
	aura_target = 
	{
		--target				= ai.SpellTargetGeneral.HOLDER,
		--target				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.ARUND,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	
	aura = ai.Aura.SHIP_ATTRACTION,

	aura_param			= 198,
	duration = 15,
	aura_range			= 105,
	isBuff = false,
	hud_visible 		= true,
	ignore_additional_power 	= true,

	ui_ico =
	{
	target_system 	= { tex = "ItemSubtype_GG_Hipnodancer", },
	},
	
	additional_auras = 
	{
		{
			target		= 	
				{
				target         = ai.SpellTargetGeneral.CASTER,
				vitality       = ai.SpellTargetVitality.ALIVE,
				},			
			aura = ai.Aura.DISABLE_WARP,
			duration = 10,
			aura_target = 
			{
				--target				= ai.SpellTargetGeneral.CONTEXT_TARGET,
				class 				= ai.SpellTargetClass.SHIP,
				relationship		= ai.SpellTargetRelationship.ENEMY,
				area				= ai.SpellTargetArea.AROUND,
			},
			aura_range			= 80,
			ignore_stacks = true,
			ignore_subtype = true,
			work_beam_target_root_fx = "particles/gadget/alien_hipnodancer_beam",
			isBuff			= false, -- SC-118152
			hud_visible 		= true,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_GG_Hipnodancer", },
			},
		},
	},	
}

Spell.Spell_GG_Pulsar = 
{

	--target				= ai.SpellTarget.CASTER_POSITION_CASTER,
	target		= 	{
					target         = ai.SpellTargetGeneral.CASTER,
					vitality       = ai.SpellTargetVitality.ALIVE,
					},
	aura_target = 
	{
		--target				= ai.SpellTargetGeneral.HOLDER,
		class 				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.AROUND,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_CASTER,		
	},
	
	aura = ai.Aura.SHIP_ATTRACTION,

	aura_param			= 60,
	duration = 1.5,
	aura_range			= 250,
	
	--spell_on_cancel		= "Spell_GG_PulsarDMG",
	isBuff = false,
	hud_visible 		= true,
	
	aura_fx ="particles/gadget/cagetrap_emmiter",
	ui_ico =
	{
	target_system 	= { tex = "ItemSubtype_GG_Pulsar", },
	},
	--min_targets_count = 0,
	--aura_fx ="particles/gadget/cagetrap_emmiter",
}	

Spell.Spell_GG_PulsarDMG = 
{
	target		= 	{
					target       = ai.SpellTargetGeneral.CASTER,
					vitality     = ai.SpellTargetVitality.ALIVE,

					},
	aura_target = 
	{
		--target				= ai.SpellTargetGeneral.HOLDER,
		class 				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.AROUND,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	aura_execution_delay = 1.5,
	aura = ai.Aura.DAMAGE_THERMAL_PERIODIC,

	aura_param			= 1200,
	
	duration 			= 10,
	period				= 1,
	aura_range			= 120,
	
	mod_target	 = 
	{
			class 			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
	},
	mod_range 		= 120,
	mod_max 		= 10,
	mod_update_period = 0.2,
	disable_zero_stage = true,

	ignore_stacks	= true,
	ignore_subtype	= true,
	
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2",
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",
	period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	
	isBuff = false,
	hud_visible 		= true,

	ui_ico =
	{
	target_system 	= { tex = "ItemSubtype_GG_Pulsar", },
	},	
	--min_targets_count = 0,
	--aura_fx ="particles/gadget/cagetrap_emmiter",
}	

Spell.Spell_GG_CamoCPU = {
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship 	= ai.SpellTargetRelationship.ALLY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc			= ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	aura				= ai.Aura.CAMO_MOD,
	aura_range			= 200,	
	isBuff				= true,
	--aura_param			= -0.16666,
	aura_param			= 0.4288,

	ui_ico 				=
		{
			target_system = { tex = "ItemSubtype_GG_CamoCPU", },
		},
		
}

Spell.Spell_GG_HullBlast =
{
	
	influence 				= ai.Spell.EXPLOSION,
	target			= ai.SpellTarget.CASTER,
	--target_range	= 60,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AnomalyBoom", },
	},
	explosion_blast_wave	= "Blastwave_GG_HullBlast",
}

Spell.Spell_GG_ShellOvercharge =
{

	target				= ai.SpellTarget.CASTER,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	influence_param		= 50000,

	isBuff				= true,
	duration			= 12,
	shell_def 			= "GG_ShellOvercharge",-- деф шкуры

	ui_ico = { target_system = { tex = "ItemSubtype_EmergencyShell", },},
}


Spell.Spell_GG_ShellOvercharge_Bonus =
{
	target			= ai.SpellTarget.CASTER,
	duration		= 5, -- не забыть поменять делитель в формуле в тултипах 
	aura			= ai.Aura.OVERCHARGE,
	aura_param		= 0.5,
	influence		= ai.Spell.APPLY_AURA,

	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
}

----------------------------------------------------------------------------

Spell.Spell_HallasKinetLaser =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.SLOW_MOVEMENT, 
	duration		= 4,
	aura_param		= 0.1, --33% непрерывного урона
	damage_to_spell_aura_param = true,
	isBuff			= false,
	
	can_stack		= true,
	max_stacks		= 10,
	
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HellasKinetLaser", },
	},
	--aura_target_directed_fx 	= "particles/weapons/laser/radiation_beam_heat_aura",
}


Spell.Spell_HallasKinetLaser_OnEquip =
{
	influence							= ai.Spell.APPLY_AURA,
	aura								= ai.Aura.CAST_SPELL_PERIODIC,
	target								= ai.SpellTarget.CASTER,
	aura_target							= ai.SpellTarget.HOLDER,

	target_spell						= "Spell_HallasKinetLaser_OnEquip2",

	
	isBuff								= true,
	hud_visible							= false,
	--period_sound 						= "sound/gadgets2/EnemyScanner_Prec",
	duration							= 1000,
	period								= 20,
	--aura_execution_delay = 1,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_WideScanner", },
	},
}

Spell.Spell_HallasKinetLaser_OnEquip2 =
{
	target					= ai.SpellTarget.CASTER,
	--aura_target 			= ai.SpellTarget.HOLDER,
	-- aura					= ai.Aura.PROLONG_AURAS,
	-- aura_param		= 1, -- *модификатор.
	--duration		= 10,
	influence		= ai.Spell.PROLONG_AURAS,
	isBuff			= true,
	hud_visible		= true,
	influence_param = 4,
	itemSubTypes 	= {ItemSubtype.HallasManAIM},

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PlasmaCompressor", },
	},
}	



Spell.Spell_HallasMine =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 180,
	isBuff			= true,

	dispell_flag	= ai.Dispell.ON_DAMAGE,
	--dispell_timeout	= 2,
	aura_execution_delay = 0.5,
}


Spell.Spell_HallasManAIM =
{
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,

	duration			= 4,
	aura_param			= 1,
	isBuff 				= true,
	hud_visible			= true,
	
	aura			= ai.Aura.FAST_MANEUVER,

	aura_fx = "StealthEffectPersei",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HallasManAIM", },
	},
	
	additional_auras =
	{
		{
		target 			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,

		duration			= 4,
		isBuff 				= true,
		hud_visible			= true,
		
		aura			= ai.Aura.WEAPON_AUTO_AIM,
		ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_HallasManAIM", },
		},
		}
	}
}

Spell.Spell_HallasManAIM_CleanLaser = 
{
	influence 					= ai.Spell.DISPELL,
	target 						= ai.SpellTarget.CASTER,
	itemSubTypes				= { ItemSubtype.HellasKinetLaser },
}

Spell.Spell_HellasCap = {
	aura 				= ai.Aura.MODULE_RANGE_MOD,
	aura_param 			= 0.15,
	isBuff 				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_HellasCPU" } },
}

Spell.Spell_MissileReloadBark =
{
	influence		= ai.Spell.RELOAD_ROCKETS,
	target			= ai.SpellTarget.CASTER,
	influence_fx	= "particles/weapons/misiles_reload",
}

Spell.Spell_AmberLanding =
{
	--  + урон
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	--target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION }, 
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.4,
	--duration		= 8,

	spell_on_cancel	= "Spell_AmberLanding_Cloac",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AmberLanding", },
	},
	additional_auras = 
	{
		{  -- + дальность
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.PRIMARY_WEAPON_RANGE_MOD,
			aura_param		= 0.5,
			--duration		= 8,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_AmberLanding", },
			},
		},
		{  -- + скорость пули
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.PROJECTILE_SPEED_MOD,
			aura_param		= 0.5,
			--duration		= 8,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_AmberLanding", },
			},
		},
		{  -- + cкорострельность
			isBuff 			= true,
			target 			= ai.SpellTarget.CASTER,
			aura_target		= ai.SpellTarget.HOLDER,
			aura			= ai.Aura.FIRE_RATE_MOD,
			aura_param		= 0.4,
			--duration		= 8,
			--dispell_flag 	= ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_AmberLanding", },
			},
		},
	},
}

Spell.Spell_AmberLanding_Cloac = 
{  -- + инвиз
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.STEALTH,
	duration		= 12,
	dispell_flag 	= ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AmberLanding", },
	},
}

Spell.Spell_AmberShield =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param 		= 800,
	period			= 1,
	dispell_flag 	= ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET,
	isBuff			= true,
	hud_visible 	= true,
	
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_AmberShield", },
	},
}

Spell.Spell_AmberShell = 
{  
	duration			= 10,
	target				= ai.SpellTarget.CASTER,
	--aura				= ai.Aura.EMP_ABSORB_TO_SHIELD,
	influence			= ai.Spell.APPLY_SHELL, -- спелл с шкурой
	influence_param		= 26666.666,

	isBuff				= true,
	
	shell_def 			= "Shell_AmberShell",-- деф шкуры

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AmberShell", },
	},
	isInvisible 	= false,  --#67898
	--aura_sound 		= "sound/weapons/laser/basic",
}

Spell.Spell_AmberCPU =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.DEBUFF_IMMUNE,
	--aura_param 		= 1000,
	duration			= 2,
	
	isBuff			= true,
	hud_visible 	= true,
	
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_AmberCPU", },
	},
}

Spell.Spell_AmberSlowGun =
{
	--influence		= 	Spell.APPLY_AURA,
	target 			= 	ai.SpellTarget.INFLICTOR,

	
	aura_target 	= 	{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		= ai.SpellTargetVitality.ALIVE,
						misc			= ai.SpellTargetMisc.EXCLUDE_CASTER,
						},
						
	aura 			= ai.Aura.SLOW_MOVEMENT,
	aura_range		= 50,
	aura_param		= 0.4285,
	--duration		= 20,
	isBuff			= false,
	hud_visible		= true,
	-- can_stack		= true,
	-- max_stacks		= 3,
	ignore_stacks			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AmberSlowGun", },
	},
}

Spell.Spell_AtlantaStarpain = -- АТЛАНТА КОНуСЫ
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},

	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 20,
	aura_range		= 300,

	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_param		= 1000,   --x2
	duration 		= 6, --0.2,
	period			= 0.5,
	
	isBuff			= false,
	work_beam_fx	= "particles/weapons/starpain_beam",

	ray_sound 		= "sound/destroyer/TRay_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Starpain", },
	},
	
}

Spell.Spell_AtlantaNemesis = -- АТЛАНТА КОНуСЫ
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},

	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 20,
	aura_range		= 300,

	aura 			= ai.Aura.DAMAGE_KINETIC_PERIODIC,
	aura_param		= 500,   --x2
	duration 		= 6, --0.2,
	period			= 0.5,
	
	isBuff			= false,
	work_beam_fx	= "particles/weapons/nemesis_beam",

	ray_sound 		= "sound/destroyer/TRay_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Nemesis", },
	},
	
	additional_auras = 
	{
		{
			target 			= ai.SpellTarget.CASTER,
			aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.IN_CONE,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
			fixed_cylinder_target = false,
			--конус с радиусом основания aura_range и длиной target_range
			aura_extra_radius = 20,
			aura_range		= 300,

			aura 			= ai.Aura.DISABLED_WEAPON,
			--aura_param		= 500,   --x2
			duration 		= 6, --0.2,
			--period			= 0.5,
			
			isBuff			= false,
			--work_beam_fx	= "particles/weapons/horror_howl_beam/beam",

			ray_sound 		= "sound/destroyer/TRay_beam",
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Nemesis", },
			},
		},
	},	
}



Spell.Spell_AtlantaThunder = -- АТЛАНТА КОНуСЫ
{
	influence		= ai.Spell.APPLY_AURA,
	target			= { target = ai.SpellTargetGeneral.CASTER, },

	aura_target 	= 	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.IN_CONE,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_CASTER,
	},

	fixed_cylinder_target = false,
	--конус с радиусом основания aura_range и длиной target_range
	aura_extra_radius = 20,
	aura_range		= 300,

	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_param		= 500,   --x2
	duration 		= 6, --0.2,
	period			= 0.5,
	
	isBuff			= false,
	work_beam_fx	= "particles/weapons/thunder_beam",

	ray_sound 		= "sound/destroyer/TRay_beam",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Thunder", },
	},
	additional_auras = 
	{
		{
			target 			= ai.SpellTarget.CASTER,
			aura_target 	=
			{
				class			= ai.SpellTargetClass.SHIP,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				vitality		= ai.SpellTargetVitality.ALIVE,
				area			= ai.SpellTargetArea.IN_CONE,
				misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
			fixed_cylinder_target = false,
			--конус с радиусом основания aura_range и длиной target_range
			aura_extra_radius = 20,
			aura_range		= 300,

			aura 			= ai.Aura.SLOW_MOVEMENT,
			aura_param		= 0.42857,   --x2
			duration 		= 6, --0.2,
			--period			= 0.5,
			
			isBuff			= false,
			--work_beam_fx	= "particles/weapons/horror_howl_beam/beam",

			ray_sound 		= "sound/destroyer/TRay_beam",
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Thunder", },
			},
		},
	},	
}

Spell.Spell_HerConcentration = {
	target				= ai.SpellTarget.CASTER,
	aura_target =
	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	aura				= ai.Aura.SPY_DRONE,
	ignore_subtype_if_other_team = true,
	aura_range			= 375,

	isBuff				= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_KatanaPrepare", },
	},
}

Spell.Spell_AthlantaSoulOvercharge = 
{  -- + инвиз
	isBuff 			= false,
	target 			=
		{
			target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
			class 			= ai.SpellTargetClass.SHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		},
	aura			= ai.Aura.DEATH_ROCKET,
	death_rocket	= "Projectile_AthlantaSoulOvercharge",
	duration		= 8,
	target_range		= 200,
	
	dispell_flag	= ai.Dispell.ON_COLLISION,

	aura_fx			= "particles/gadget/athlanta_overcharge",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaSoulOvercharge", },
	},
	isInvisible 	= true,  --#67898
	aura_sound 		= "sound/weapons/laser/basic",
}

Spell.Spell_AthlantaSoul_Overcharge =
{
	target 		= 		{
						target 			= ai.SpellTargetGeneral.CASTER,
						area			= ai.SpellTargetArea.AROUND,
						},

	
	influence 		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.OVERCHARGE,
	duration		= 7,
	aura_param		= 0.5,
	
	isBuff			= true,
	
	 target_range		= 13,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaSoulOvercharge", },
	},
	scale_on_weapon		= true,
	influence_sound 	= "sound/hit/heal",
}

Spell.Spell_AthlantaSoulStealth = 
{
	inherit				= "Spell_AthlantaSoulOvercharge",
	death_rocket	= "Projectile_AthlantaSoulStealth",	
	aura_fx			= "particles/gadget/athlanta_stealth",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaSoulStealth", },
	},	
}

Spell.Spell_AthlantaSoul_Stealth = 
{
	inherit				= "Spell_AthlantaSoul_Overcharge",
	influence 		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.STEALTH,
	duration		= 7,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaSoulStealth", },
	},	
}	

Spell.Spell_AthlantaSoulInvul = 
{
	inherit				= "Spell_AthlantaSoulOvercharge",
	death_rocket	= "Projectile_AthlantaSoulInvul",	
	aura_fx			= "particles/gadget/athlanta_invul",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaSoulInvul", },
	},	
}

Spell.Spell_AthlantaSoul_Invul = 
{
	inherit				= "Spell_AthlantaSoul_Overcharge",
	influence 		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.UNTOUCHABLE,
	duration		= 7,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaSoulInvul", },
	},	
}	

Spell.Spell_DisMissile3 = 
{
	target			= { target = ai.SpellTargetGeneral.INFLICTOR, 
						misc = ai.SpellTargetMisc.POSITION },
			
	aura_target	= 
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.NEUTRAL,
						vitality		= ai.SpellTargetVitality.ALIVE,
						misc			= ai.SpellTargetMisc.EXCLUDE_CASTER,
					},
					
	aura_range		= 200,
	aura 			= ai.Aura.HEALTH_MOD,
	aura_param		= -1, 
	duration		= 15,
	aura_execution_delay = 0.2,
	
	isBuff			= false,

			ignore_stacks	= true,
			ignore_subtype	= false,
			
			aura_fx		= "particles/explosions/dismissile_cloud",
			
 			ui_ico = { target_system 	= { tex = "ItemSubtype_SpaceMissile_DisMissile", }, },
			
			uiName			= "DisMissile3",
			uiDesc			= "DisMissile3",
	additional_auras =
	{
		{
			target			= { target = ai.SpellTargetGeneral.INFLICTOR, 
						misc = ai.SpellTargetMisc.POSITION },
			
			aura_target	= 
					{	
						target 			= ai.SpellTargetGeneral.CASTER,
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.ALLY + ai.SpellTargetRelationship.NEUTRAL,
						vitality		= ai.SpellTargetVitality.ALIVE,
						--misc			= ai.SpellTargetMisc.EXCLUDE_CASTER,
					},
					
			aura_range		= 200,
			aura 			= ai.Aura.HULL_RESIST_ALL,
			aura_param		= 600, 
			duration		= 15,
			
			aura_execution_delay = 0.2,

			isBuff			= true,
			ui_ico = { target_system 	= { tex = "ItemSubtype_SpaceMissile_DisMissile", }, },
			ignore_stacks	= true,
			ignore_subtype	= false,
		},
	},
}

Spell.Spell_CinquedeaAIM_Self = 
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura  			= ai.Aura.DEBUFF_IMMUNE,

	duration		= 5,

	isBuff			= true,
	aura_target_fx = "particles/gadget/debuff_immune_2",
	
	dispell_flag = ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CinquedeaAIM", },
	},	
}

Spell.Spell_CinquedeaAIM_Debuff =
{
	isBuff			= false,


	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.STUN,	
	
	duration = 3,
	--aura_range		= 20,
	
	ignore_stacks	= true,
	ignore_subtype	= true,
	diminish_control_aura = true,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CinquedeaAIM", },
	},
}

Spell.Spell_CinquedeaBlackout =
{
	aura			= ai.Aura.REDUCE_MAX_SPEED,
	duration		= 15,
	aura_param		= 100,
	isBuff			= true,
	dispell_flag = ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET,
	gameplay_specific	= true,
	aura_target_fx = "particles/gadget/debuff_immune",	
	aura_fx ="particles/gadget/athlanta_invul",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CinquedeaBlackout", },
	},
	additional_auras = 
	{
		{
			aura			= ai.Aura.UNTOUCHABLE,
			--aura_param		= 100,
			duration		= 15,
			isBuff			= true,
			dispell_flag = ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_CinquedeaBlackout", },
			},
		},	
		{
			aura			= ai.Aura.INVULNERABILITY,
			--aura_param		= 100,
			duration		= 15,
			isBuff			= true,
			dispell_flag = ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_CinquedeaBlackout", },
			},
		},
		{
			aura			= ai.Aura.ANTI_RADAR,
			--aura_param		= 100,
			duration		= 15,
			isBuff			= true,
			dispell_flag = ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE,
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_CinquedeaBlackout", },
			},
		},		

	},	
}

-- Spell.Spell_CinquedeaBlackout2 =
-- {
			-- aura			= ai.Aura.REDUCE_MAX_SPEED,
			-- aura_param		= 100,
			-- duration		= 15,
			-- isBuff			= true,
			-- dispell_flag = ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE,
			-- ui_ico =
			-- {
				-- target_system 	= { tex = "ItemSubtype_CinquedeaBlackout", },
			-- },
-- }

Spell.Spell_CinquedeaPlasmaGun =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.CASTER,

	aura            = ai.Aura.ADD_ENERGY_PERIODIC,
	
	duration			= 0.5,
	period			= 0.2,
	aura_param		= 10, 
	isBuff 			= true,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CinquedeaPlasmaGun", },
	},
	aura_target_fx = "particles/gadget/slow_movement",
	
	additional_auras = 
	{
		{
			target =
			{
				target = ai.SpellTargetGeneral.CONTEXT_TARGET,
				relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			},
			aura_target		= ai.SpellTarget.HOLDER,

			aura            = ai.Aura.BURN_ENERGY_PERIODIC,
			
			duration			= 0.5,
			period			= 0.2,
			aura_param		= 10, 
			isBuff 			= false,

			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_CinquedeaPlasmaGun", },
			},
		},	
	},	
}

Spell.Spell_AtlantaCPU_emp =
{
	aura			= ai.Aura.HULL_RESIST_EMP_DEC,
	target			= ai.SpellTarget.LOCKED_TARGET,
	-- target			= { target = ai.SpellTarget.LOCKED_TARGET,
					-- area	= ai.SpellTargetArea.AROUND,
					-- },
	aura_param 		= 40,
	target_range		= 220,
	duration		= 12,
	
	--cast_fx			= "particles/gadget/aura_wave",
	ui_ico =
	{
		target_system 	= {tex = "ItemSubtype_AtlantaCPU_emp", },
	},
}

Spell.Spell_AtlantaCPU_thermal =
{
	aura			= ai.Aura.HULL_RESIST_THERMAL_DEC,
	target			= ai.SpellTarget.LOCKED_TARGET,
	-- target			= { target = ai.SpellTarget.LOCKED_TARGET,
					-- area	= ai.SpellTargetArea.AROUND,
					-- },
	aura_param 		= 40,
	target_range		= 220,
	duration		= 12,
	
	--cast_fx			= "particles/gadget/aura_wave",
	ui_ico =
	{
		target_system 	= {tex = "ItemSubtype_AtlantaCPU_thermal", },
	},
}

Spell.Spell_AtlantaCPU_kinet =
{
	aura			= ai.Aura.HULL_RESIST_KINETIC_DEC,
	target			= ai.SpellTarget.LOCKED_TARGET,	
	-- target			= { target = ai.SpellTarget.LOCKED_TARGET,
						-- area	= ai.SpellTargetArea.AROUND,
						-- },
	aura_param 		= 40,
	target_range		= 220,	
	duration		= 12,
	
	--cast_fx			= "particles/gadget/aura_wave",
	ui_ico =
	{
		target_system 	= {tex = "ItemSubtype_AtlantaCPU_kinet", },
	},
}

Spell.Spell_Carolingian_GuidedMissile =
{
	
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	
	aura 			= ai.Aura.ADDITIONAL_DAMAGE_THERMAL_SCALED,
	aura_param		= 0.5,
	
	duration		= 12,

	aura_fx			= "particles/gadget/lightnings_debuff",
	aura_target_fx = "particles/gadget/slow_movement",	

	isBuff			= false,
	hud_visible		= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Carolingian_GuidedMissile", },
	},
	
additional_auras =
	{
		{
			target =
			{
				target = ai.SpellTargetGeneral.CONTEXT_TARGET,
				relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
				--signature		= ai.SignatureMask.HUGE,
			},
			--aura_target		= ai.SpellTarget.HOLDER,
			aura_target 	= { 
							  target = ai.SpellTargetGeneral.HOLDER,
							  signature		= ai.SignatureMask.HUGE,
							  },
			aura 			= ai.Aura.DAMAGE_KINETIC_PERIODIC, 
			aura_param 		= 20000, --кол-во дамага раз в period
			period 			= 1, --период между тиками дамага
			--aura_range 		= 27, -- радиус, на котором аура наносит дамаг
			isBuff 			= false, --дебафф
			duration 		= 0.7, --продолжительность ауры
			ui_ico = { target_system = { tex = "ItemSubtype_Carolingian_GuidedMissile", }, },
		},
	},	
}

Spell.PhaseShield_Energy_Buff123 =
{
	target			= ai.SpellTarget.CASTER,
	influence		= ai.Spell.APPLY_AURA,
	aura			= ai.Aura.ADD_ENERGY_PERIODIC,
	aura_param = 110, --35
	period		= 1,
	isBuff			= true,
	hud_visible		= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PhaseShield_Raid_Buff", },
	},
	aura_fx = "particles/gadget/add_energy",
}

Spell.Spell_FakeShipBackstab =   -- это телепорт
{
	target					= ai.SpellTarget.CASTER,
	teleport_to_target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
--		misc 			= ai.SpellTargetMisc.POSITION,
--		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS,
		},
	teleport_range			= 300,
	influence 				= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset_dir		= Vec3( 0, 0, 1 ),
	teleport_offset			= 50,
	
	aura_execution_delay = 1,	
	
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	in_fx = "particles/gadget/teleport",
	out_fx = "particles/gadget/teleport",
	
}

Spell.Spell_FakeShipBackstab_stealth =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 5,
	isBuff			= true,
--	aura_fx			= "particles/test/continuous_3",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FakeShipBackstab", },
	},

	
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 2,
}

Spell.Spell_AceFrost_Cast =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "Spell_AceFrost2",
	duration		= 5,
	period			= 0.5,
	isBuff			= true,
	aura_fx			= "particles/gadget/fueldrop",
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_FuelEmissions" } },

}

Spell.Spell_AceFrost =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_target		=
					{
						target = ai.SpellTargetGeneral.CASTER,
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL + ai.SpellTargetRelationship.ALLY,
					},
	aura_range 		= 25,
	aura_range_add	= (50-25)/(6/0.5),
	aura_param		= 0.333333,
	--`aura_param_add	= -0.2,
	duration		= 60,
	period 			= 0.5,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff			= false,
	nebula			= "Effects_Nebula_Emissions",
	cast_position_fx	= "particles/gadget/fueldrop_sphere_big",
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_FuelEmissions" } },
}

Spell.Spell_AceFreezeMine =
{
	target = {
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
			},
	target_range	= 20,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura_target_fx = "particles/gadget/slow_movement_violet",
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param		= 0.333333, -- -40%
	duration		= 4,
	isBuff			= false,
	
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_AceFreezeMine" } },

}

Spell.Spell_AceEngine = 
{
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.COOLDOWN_MOD,
	aura_param		= -0.1117,
	isBuff			= true,
	ui_ico 		= { target_system = { tex = "ItemSubtype_AceEngine", }, },
}

Spell.Spell_CarolDeadShot = 
{
	target = ai.SpellTarget.CASTER,
	aura_target = ai.SpellTarget.HOLDER,
	aura = ai.Aura.PROJECTILE_SPEED_MOD,
		
	aura_param = 0.4,--0.25,

	duration = 6,
	isBuff = true,
	
	ui_ico 		= { target_system = { tex = "ItemSubtype_CarolDeadShot", }, },
	
	additional_auras =
	{
		{
			target = ai.SpellTarget.CASTER,
			aura_target = ai.SpellTarget.HOLDER,
			aura = ai.Aura.DAMAGE_MOD,
				
			aura_param = 0.1,--0.25,

			duration = 6,
			isBuff = true,
			
			ui_ico 		= { target_system = { tex = "ItemSubtype_CarolDeadShot", }, },
		
		},
	},	
}


Spell.Spell_CarolCannon =
{

	target 			= ai.SpellTarget.CASTER,
	
	influence		= ai.Spell.APPLY_AURA,	
	
	aura_target =
	{
		target 			= ai.SpellTargetGeneral.CASTER,
	},
	
	aura				= ai.Aura.DISABLE_HEAT, --HEAT_MUL
	--aura_param			= -1,
	duration			= 1,
	
	isBuff 			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CarolCannon", },
	},
}

Spell.Spell_CarolShield = 
{
	aura 				= ai.Aura.FIRE_RATE_MOD,
	aura_param 			= 0.15,
	isBuff 				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_CarolShield" } },
}

Spell.Spell_CarolHull = 
{
	aura 				= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param 			= 1000,
	period				= 1,
	isBuff 				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_CarolHull" } },
}

Spell.Spell_AtlantaCap =
{
	aura			= ai.Aura.DAMAGE_MOD,
	--aura			= ai.Aura.SECONDARY_DAMAGE_MOD,
	--aura			= ai.Aura.MODULE_DAMAGE_MOD,
	aura_param 			= 0.15,
	isBuff 				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_AtlantaCap" } },
}

Spell.Spell_AtlantaCapWeap =
{
	inherit				= "Spell_AtlantaCap",
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_AtlantaCapWeapon" } },
}

Spell.Spell_AtlantaCapRocket =
{
	inherit				= "Spell_AtlantaCap",
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_AtlantaCapRocket" } },
}

Spell.Spell_AtlantaCapModuleDmg =
{
	inherit				= "Spell_AtlantaCap",
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_AtlantaCapModuleDmg" } },
}

Spell.Spell_GlassAttraction = 
{
	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			area				= ai.SpellTargetArea.AROUND,
			misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.EXCLUDE_CASTER,-- + ai.SpellTargetMisc.EXCLUDE_HOLDER,
		},	
	aura 				= ai.Aura.SHIP_ATTRACTION,
	aura_range 			= 120,
	aura_param 			= -75,
	duration			= 1,
	--period				= 0.5,
	isBuff				= false,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_GlassAttraction" } },

}

Spell.Spell_Glass_BlackoutGenerator =
{
	aura			= ai.Aura.FORTIFICATION,
	duration		= 6,
	isBuff			= true,
	
	aura_fx = "particles/gadget/blackout",	
		--deactivate_spell = "Spell_Glass_BlackoutGeneratorInvulnerability",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_BlackoutGenerator", },
	},
}

Spell.Spell_Glass_BlackoutGeneratorInvulnerability =
{
	influence 		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.INVULNERABILITY,
	duration		= 3,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_BlackoutGenerator", },
	},
}

Spell.Spell_Glass_TimeBoost = 
{
	aura = ai.Aura.OVERCHARGE,

	aura_param = 0.70,
	aura_target = ai.SpellTarget.HOLDER,
	duration = 6,
	isBuff = true,
	target = ai.SpellTarget.CASTER,

	ui_ico = 
	{
		target_system = 
		{
			tex = "ItemSubtype_Glass_TimeBoost",
		},
	},

	aura_apply_fx = "particles/gadget/aura_breacktrough",
	aura_fx = "particles/gadget/overdrive",
	aura_end_sound = "sound/gadgets/timeboost_end",
}

Spell.Spell_Glass_Disintegrator =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_Glass_Disintegrator1', 'Spell_Glass_DisintegratorH' }
}

Spell.Spell_Glass_Disintegrator1 =
{

			target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },

			aura_target		= --ai.SpellTarget.ENEMY_AROUND,
							{ --без минных полей и ракет, только вражеские
							--target			= ai.SpellTargetGeneral.AIM,
							class			= ai.SpellTargetClass.SHIP,
							area			= ai.SpellTargetArea.AROUND,
							relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
							
							},
			 
			isBuff			= false,
			aura			= ai.Aura.SHIP_ATTRACTION,			
			aura_param		= -1000,
			aura_range		= 27,
			duration		= 0.3,			
			ignore_stacks	= true,
			ignore_subtype	= true,	
}

Spell.Spell_Glass_DisintegratorH =
	{
			target					= { 
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				signature		= ai.SignatureMask.HUGE,
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
			aura					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			isBuff					= false,
			aura_param				= 8620*1.5,  -- 5600 база + это *2   .   делаем что суммарный урон по эсму х2.5 (5600*1.5/2) = 
			scale_on_weapon			= true,
			ignore_stacks			= true,
			ignore_subtype			= true,
			duration				= 0.3,
			period 					= 0.2,
 			--aura_signature			= ai.SignatureMask.HUGE, --	HUGE
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_Disintegrator", },
			},
	}

Spell.Spell_Glass_MicroWarp =
{
	influence 		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 800,
	period			= 0.5,
	duration		= 2,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_MicroWarp", },
	},
}



Spell.Spell_Glass_FrigateDrone =
{
	inherit		= "FrigateDrone_T4_Base",
	influence_param = 2200,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_FrigateDrone", },
	},
}

Spell.Spell_Glass_Cloaking =
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 14,
	isBuff			= true,
--	aura_fx			= "particles/test/continuous_3",
--uiName 			= "Special_CloakingDevice_Base",
--	uiDesc 			= "Special_CloakingDevice_Base_Desc",
	aura_end_sound	= "sound/gadgets/stealth_off",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_CloakingDevice", },
	},
	-- изменения в от #64709
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
	dispell_timeout	= 7,
}

Spell.Spell_Glass_PlasmaWeb =
{
	inherit		= "PlasmaWeb_T4_Base",
	duration	= 8,
	
	 period_module_fx = "particles/gadget/plasma_web_module",
	 period_module_my_fx = "particles/gadget/plasma_web_module",	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_PlasmaWeb", },
	},
}

Spell.Spell_Glass_PlasmaWeb2 =
{
	inherit		= "PlasmaWeb_MoveRestrictor_T4_Base",
	duration	= 8,
	aura_param	= 600,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_PlasmaWeb", },
	},
}

Spell.Spell_Glass_EnergyShieldCommander =
{
	inherit		= "EnergyShieldCommander_T4_Base",
	duration	= 12,
	aura_param	= 20,
	
	aura_fx = "particles/gadget/energy_shield",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_EnergyShieldCommander", },
	},
}

Spell.Spell_Glass_PhaseShield_Phase1 =
{
	aura			= ai.Aura.SHIELD_RESIST_EMP,
	isBuff			= true,
	aura_param		= 90,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_PhaseShield1", },
	},
	additional_auras =
	{
		{
		isBuff 			= true,
		target 			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		aura			= ai.Aura.FAST_MOVEMENT,
		aura_param		= 0.35,
		duration		= 15,
		period			= 1,
		aura_param_add	= -0.023, --0,035
		dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
		ui_ico =	{	target_system 	= { tex = "ItemSubtype_Glass_PhaseShield1", }, 	},
		},
		{
		aura			= ai.Aura.HULL_RESIST_EMP,
		isBuff			= true,
		aura_param		= 90,
		ui_ico =	{	target_system 	= { tex = "ItemSubtype_Glass_PhaseShield1", }, 	},		
		},
	},
}

Spell.Spell_Glass_PhaseShield_Phase0 =
{
	aura			= ai.Aura.SHIELD_RESIST_THERMAL,
	isBuff			= true,
	aura_param		= 90,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_PhaseShield0", },
	},
	additional_auras =
	{
		{
		isBuff 			= true,
		target 			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		aura			= ai.Aura.FAST_MOVEMENT,
		aura_param		= 0.35,
		duration		= 15,
		period			= 1,
		aura_param_add	= -0.023, --0,035
		dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
		ui_ico =	{	target_system 	= { tex = "ItemSubtype_Glass_PhaseShield0", }, 	},
		},
		{
		aura			= ai.Aura.HULL_RESIST_THERMAL,
		isBuff			= true,
		aura_param		= 90,
		ui_ico =	{	target_system 	= { tex = "ItemSubtype_Glass_PhaseShield0", }, 	},		
		},
	},			
}

Spell.Spell_Glass_PhaseShield_Phase2 =
{
	aura			= ai.Aura.SHIELD_RESIST_KINETIC,
	isBuff			= true,
	aura_param		= 90,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Glass_PhaseShield2", },
	},
	additional_auras =
	{
		{
		isBuff 			= true,
		target 			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		aura			= ai.Aura.FAST_MOVEMENT,
		aura_param		= 0.35,
		duration		= 15,
		period			= 1,
		aura_param_add	= -0.023, --0,035
		dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
		ui_ico =	{	target_system 	= { tex = "ItemSubtype_Glass_PhaseShield2", }, 	},
		},
		{
		aura			= ai.Aura.HULL_RESIST_KINETIC,
		isBuff			= true,
		aura_param		= 90,
		ui_ico =	{	target_system 	= { tex = "ItemSubtype_Glass_PhaseShield2", }, 	},		
		},	
	},
}

Spell.Spell_GlassArmor =
{

	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.SHIP_ATTRACTION,
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,  --цилиндр радиуса aura_range и длиной target_range
	},
	
	aura			= ai.Aura.SHIP_ATTRACTION,	
	aura_param		= -190,
	aura_range	 		= 20,	-- и длиной  может переопределяется aura_target_offset из модуля
	--aura_target_offset 	= Vec3( 0, 0, -10 ),
	
	isBuff 				= false,
	ui_ico =
	{
		target_system 	= { tex = "CritChance", },
	},
}

Spell.Spell_EnergyLance =
{
	influence 		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.COLLISION_IMMUNE,
	duration		= 3,
	isBuff			= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyLance", },
	},
}

Spell.Spell_UFOBall_Laser =
{
	target 			= 
			{
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				
			},

	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.DAMAGE_EMP_PERIODIC,
	
	aura_param		= 1200,
	duration			= 1,
	period			= 1,
	
	can_stack		= true,
	max_stacks 		= 10,
	
	isBuff 				= false,
	hud_visible			= true,
	
	aura_fx = "StealthEffectPersei",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_HallasManAIM", },
	},

}

Spell.Spell_UFOBall_TimeBoost =
{
	influence							= ai.Spell.APPLY_AURA,
	target								= ai.SpellTarget.CASTER,
	aura 								= ai.Aura.OVERCHARGE,
	aura_target							= ai.SpellTarget.HOLDER,
	
	aura_param							= 0.50,
	duration							= 20,

	isBuff								= true,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_UballTimeBoost", },
	},

	aura_end_sound						= "sound/gadgets/timeboost_end",
	aura_fx								= "particles/gadget/overdrive_ball",
}

Spell.Spell_DeathRay =
{
	influence				= ai.Spell.APPLY_AURA,
	target					= ai.SpellTarget.CASTER,
	influence 	= ai.Spell.APPLY_AURA,
	aura 		= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target =
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
			area 			= ai.SpellTargetArea.IN_CYLINDER,
			relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		},
	
	fixed_cylinder_target	= false,
	
	holder_work_beam_fx		= "particles/gadget/ballray_beam",
	ray_sound 				= "sound/destroyer/TRay_beam",
	aura_fx					= "particles/gadget/ballray",

	aura_range	 			= 400, --дальность луча
	aura_extra_radius 		= 3,   --радиус луча
	
	aura_param				= 100,
	aura_param_add			= 100,
	
	
	duration 				= 6,
	period					= 0.5,
	
	isBuff					= false,
	hud_visible 			= true,
			
	ignore_additional_power = true, --игнорит param_modificator из вызывающего модуля

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyReflector", },
	},
	
}

Spell.Spell_UballShield =
{
	--influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target 	= 		{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		vitality       = ai.SpellTargetVitality.ALIVE,
		damageability  = ai.SpellTargetDamageability.DAMAGEABLE,
	},

	aura_range		= 100,
	--aura_extra_radius= 35,

	aura_param		= 1500,
	duration 		= 2,
	period			= 1,
	isBuff			= false,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_UballShield", },
	},
		
	period_module_fx			= "particles/gadget/plasma_web_module",
	period_module_my_fx			= "particles/gadget/plasma_web_module",
	work_beam_target_root_fx = "particles/gadget/plasma_web_beam",
	
}

Spell.Spell_SaturnCharge1 = 
{
	aura 		= ai.Aura.HULL_RESIST_ALL,
	aura_param 	= 10,
	can_stack	= true,
	duration 	= 40,
	max_stacks	= 10,
	isBuff 		= true,
	ignore_subtype = true,
	target 		= ai.SpellTarget.CASTER,
	aura_target = ai.SpellTarget.HOLDER,
	aura_main_fx			= "particles/gadget/saturn_spell1",
	ui_ico = { target_system = { tex = "ItemSubtype_SaturnAOEDamage", }, },
	
	additional_auras = -- это собирает стаки
	{
		{
			influence	= ai.Spell.APPLY_AURA,
			aura		= ai.Aura.CHARGE_SPELL,
			target		= ai.SpellTarget.CASTER,
			aura_target	= ai.SpellTarget.CASTER,
			hud_visible	= false,
			max_stacks	= 10,
			duration 	= 40,
			aura_param	= 1,
			isBuff		= true,

			ui_ico =
			{
				target_system	= { tex = "ItemSubtype_SaturnAOEDamage", },
			},
		},
		{
			aura 		= ai.Aura.DAMAGE_MOD,
			aura_param 	= 0.02,
			can_stack	= true,
			duration 	= 40,
			max_stacks	= 10,
			isBuff 		= true,
			ignore_subtype = true,
			target 		= ai.SpellTarget.CASTER,
			aura_target = ai.SpellTarget.HOLDER,
			ui_ico = { target_system = { tex = "ItemSubtype_SaturnAOEDamage", }, },
		},
	},
}
Spell.Spell_SaturnCharge2 = 
{
	inherit		= "Spell_SaturnCharge1",
	aura_main_fx			= "particles/gadget/saturn_spell2",
	ui_ico = { target_system = { tex = "ItemSubtype_SaturnModuleDamage", }, },	
	additional_auras = -- это собирает стаки
	{
		{
			influence	= ai.Spell.APPLY_AURA,
			aura		= ai.Aura.CHARGE_SPELL,
			target		= ai.SpellTarget.CASTER,
			aura_target	= ai.SpellTarget.CASTER,
			hud_visible	= false,
			max_stacks	= 10,
			duration 	= 40,
			aura_param	= 1,
			isBuff		= true,

			ui_ico =
			{
				target_system	= { tex = "ItemSubtype_SaturnModuleDamage", },
			},
		},
		{
			aura 		= ai.Aura.DAMAGE_MOD,
			aura_param 	= 0.02,
			can_stack	= true,
			duration 	= 40,
			max_stacks	= 10,
			isBuff 		= true,
			ignore_subtype = true,
			target 		= ai.SpellTarget.CASTER,
			aura_target = ai.SpellTarget.HOLDER,
			ui_ico = { target_system = { tex = "ItemSubtype_SaturnModuleDamage", }, },
		},
	},	
}

Spell.Spell_SaturnCharge3 = 
{
	inherit		= "Spell_SaturnCharge1",
	aura_main_fx			= "particles/gadget/saturn_spell3",
	ui_ico = { target_system = { tex = "ItemSubtype_SaturnDamage", }, },	
	additional_auras = -- это собирает стаки
	{
		{
			influence	= ai.Spell.APPLY_AURA,
			aura		= ai.Aura.CHARGE_SPELL,
			target		= ai.SpellTarget.CASTER,
			aura_target	= ai.SpellTarget.CASTER,
			hud_visible	= false,
			max_stacks	= 10,
			duration 	= 40,
			aura_param	= 1,
			isBuff		= true,

			ui_ico =
			{
				target_system	= { tex = "ItemSubtype_SaturnDamage", },
			},
		},
		{
			aura 		= ai.Aura.DAMAGE_MOD,
			aura_param 	= 0.02,
			can_stack	= true,
			duration 	= 40,
			max_stacks	= 10,
			isBuff 		= true,
			ignore_subtype = true,
			target 		= ai.SpellTarget.CASTER,
			aura_target = ai.SpellTarget.HOLDER,
			ui_ico = { target_system = { tex = "ItemSubtype_SaturnDamage", }, },
		},
	},	
}

Spell.Spell_SaturnClean1 = 
{
	influence 					= ai.Spell.DISPELL,
	target 						= ai.SpellTarget.CASTER,
	itemSubTypes				= { ItemSubtype.SaturnCharge1 },
}

Spell.Spell_SaturnClean2 = 
{
	influence 					= ai.Spell.DISPELL,
	target 						= ai.SpellTarget.CASTER,
	itemSubTypes				= { ItemSubtype.SaturnCharge2 },
}

Spell.Spell_SaturnClean3 = 
{
	influence 					= ai.Spell.DISPELL,
	target 						= ai.SpellTarget.CASTER,
	itemSubTypes				= { ItemSubtype.SaturnCharge3 },
}

Spell.Spell_SaturnAOEDamage = 
{
	aura = ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_param = 350,
	duration = 10,
	period			= 1,
	ignore_subtype	= false,
	isBuff = false,
	ignore_subtype = true,
	target = ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	aura_range		= 200,
	
	aura_main_fx	= "particles/gadget/saturn_special1",
	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	period_fx		= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx    = "particles/gadget/pulsars/pulsar_hit_2",
	ui_ico = { target_system = { tex = "ItemSubtype_SaturnAOEDamage", }, },

}

Spell.Spell_SaturnModuleDamage = 
{
	aura = ai.Aura.MODULE_DAMAGE_MOD,
	aura_param = 0.09,
	duration = 10,
	--period			= 1,
	isBuff = true,
	ignore_subtype = true,
	target = ai.SpellTarget.CASTER,
	aura_target = ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range		= 200,

	aura_main_fx	= "particles/gadget/saturn_special2",
	ui_ico = { target_system = { tex = "ItemSubtype_SaturnModuleDamage", }, },
}

Spell.Spell_SaturnDamageBuff = 
{
	aura = ai.Aura.DAMAGE_MOD,
	aura_param = 0.09,
	duration = 10,
	--period			= 1,
	isBuff = true,
	ignore_subtype = true,
	target = ai.SpellTarget.CASTER,
	aura_target = ai.SpellTarget.HOLDER,
	
	aura_main_fx	= "particles/gadget/saturn_special3",
	ui_ico = { target_system = { tex = "ItemSubtype_SaturnDamage", }, },
}

Spell.Spell_SaturnBubbleGum =
{
	influence = ai.Spell.APPLY_AURA,
	
	target = ai.SpellTarget.CASTER, --_POSITION_CASTER,


	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura = ai.Aura.ENERGY_HARVESTER,	
	
	aura_range		= 50,
	aura_range_add		= 100,
	aura_range_add_max		= 250,
	
	aura_param = 500,
	
	period = 0.5,
	duration = 2.5,	
	
	energy_blastwave = "Blastwave_SaturnBubbleGum",
	
	aura_target_fx = "particles/gadget/burn_energy",
	isBuff = false,
	--aura_holder_def = "EMIMine",
	aura_fx = "particles/gadget/emi_mine",
	ui_ico = {
		target_system = { tex = "ItemSubtype_AoeStealthDrone", },
	},
}

Spell.Spell_SaturnMine =
{
	duration		= 10,
	target			= { 
						target = ai.SpellTargetGeneral.INFLICTOR,
						misc = ai.SpellTargetMisc.POSITION 
						},
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	--aura_target		= ai.SpellTarget.ALLY_AROUND,
	
	aura = ai.Aura.DISABLE_LOCK,	
	aura_range		= 400,
	aura_range_add		= -20,
	duration			= 10,
	
	isBuff			= false,


	ignore_stacks	= true,
	ignore_subtype	= true,
	
	--aura_target_fx = "particles/gadget/burn_energy",
	aura_target_fx = "particles/gadget/lightnings_debuff",
	cast_position_fx = "particles/gadget/blackout_sphere",
	
 	ui_ico = { target_system 	= { tex = "ItemSubtype_SaturnMine", }, },
	uiName			= "Special_PhaseShield_Faction1",

	additional_auras =
	{
		{
			target			= { 
						target = ai.SpellTargetGeneral.INFLICTOR,
						misc = ai.SpellTargetMisc.POSITION 
						},
			aura_target		= ai.SpellTarget.ENEMY_AROUND,
		
			aura = ai.Aura.DISABLE_MODULES,
			aura_range	= 400,
			aura_range_add		= -20,
			duration = 10,
			isBuff = false,

			ui_ico = { target_system = { tex = "ItemSubtype_SaturnMine", }, },
		},	
	},
	
}

Spell.Spell_SaturnChargableGun =
{


	--aura_param_add  = 500, --расчет на 4 секунды полета.

	target 			= ai.SpellTarget.INFLICTOR,
	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 40,  
	

	aura			= ai.Aura.DAMAGE_EMP_PERIODIC,	
	aura_param		= 1500,	
	period			= 0.2,	
	
	isBuff			= false,
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SaturnChargableGun", },
	},
}

Spell.Spell_SaturnChargableGunT5 =
{
	inherit				= "Spell_SaturnChargableGun",
	aura_param			= 1750,	
}

Spell.Spell_SaturnHull =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param 		= 2000,
	period			= 1,
	dispell_flag 	= ai.Dispell.ON_MODULE + ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET,
	isBuff			= true,
	hud_visible 	= true,
	
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_SaturnHull", },
	},
}

Spell.Spell_SaturnEngineOnEquip =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "Spell_SaturnEnginePassive",
	period			= 5,
	isBuff			= true,
	hud_visible		= false,
	--aura_fx			= "particles/gadget/fueldrop",
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_SaturnEngine" } },

}

Spell.Spell_SaturnEnginePassive =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 0.1,
	isBuff			= true,
	hud_visible 	= true,
	
	ui_ico = 	{ 		target_system = { tex = "ItemSubtype_SaturnEngine", }, 	},
	additional_auras =
	{
		{
		influence		= ai.Spell.APPLY_AURA,
		aura_target		= ai.SpellTarget.HOLDER,
		aura			= ai.Aura.FAST_MANEUVER,
		aura_param 		= 0.1,
		isBuff			= true,
		hud_visible 	= true,

			ui_ico = { target_system = { tex = "ItemSubtype_SaturnEngine", }, },
		},	
	},	
}

Spell.Spell_SaturnEngine =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 0.25,
	duration		= 15,	
	isBuff			= true,
	hud_visible 	= true,
	
	ui_ico = 	{ 		target_system = { tex = "ItemSubtype_SaturnEngine", }, 	},
	additional_auras =
	{
		{
		influence		= ai.Spell.APPLY_AURA,
		aura_target		= ai.SpellTarget.HOLDER,
		aura			= ai.Aura.FAST_MANEUVER,
		aura_param 		= 0.25,
		duration		= 15,	
		isBuff			= true,
		hud_visible 	= true,

			ui_ico = { target_system = { tex = "ItemSubtype_SaturnEngine", }, },
		},	
	},	
}

Spell.Spell_AthlantaRail =
{

	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },

	--aura_target		= ai.SpellTarget.ENEMY_AROUND,

	aura_target		=
	{
		area 			= ai.SpellTargetArea.AROUND,
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		signature		= ai.SignatureMask.SMALL,
	},	

	aura_range		= 8,

	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,	
	aura_param		= 2500,
	
	duration		= 0.5,
	period			= 1,
	
	isBuff			= false,
	ignore_stacks	= true,
	ignore_subtype	= true,
 	ui_ico = { target_system 	= { tex = "ItemSubtype_AthlantaRail", }, },

}

Spell.Spell_AthlantaBlaster =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY,
	},
	aura_target =
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},

	aura = ai.Aura.FIRE_RATE_MOD,
	duration = 4,
	
	isBuff = false,
	aura_param = -1,

	gun_spell_fx	   = "particles/weapons/overheating_laser_heat",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaBlaster", },
	},
}

Spell.Spell_shipChild_Seal =
{
	aura 			= ai.Aura.HULL_RESIST_ALL,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 5,
	ignore_subtype	= false,
	can_stack		= false,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_BP22_Seal", },		},
}

Spell.Spell_shipChild_Water =
{
	aura 			= ai.Aura.SHIELD_REGEN_MOD,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 0.1,
	ignore_subtype	= false,
	can_stack		= false,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_BP22_Water", },		},
}



Spell.Spell_shipChild_Emblem =
{
	aura 			= ai.Aura.HEALING_MOD,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 0.05,
	ignore_subtype	= false,
	can_stack		= false,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_BP22_Emblem", },		},
}

Spell.Spell_shipChild_Floatlamp =
{	
	aura 			= ai.Aura.ADD_ENERGY_PERIODIC,
	aura_target		= { target = ai.SpellTargetGeneral.CASTER, },
	aura_param 		= 5,
	period			= 1,
	ignore_subtype	= false,
	can_stack		= false,
	isBuff 			= true,
	ui_ico 			=	{		target_system 	= { tex = "shipChild_BP22_Floatlamp", },		},
}

Spell.Spell_CorV2FakeShips =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	aura			= ai.Aura.CLEANSE, --DISABLE_LOCK
	duration		= 1,
	--period			= 0.5,
	--aura_param		= 0.01,--3,
	isBuff			= false,
	ignore_additional_power = true,
	gameplay_specific	= true,

	aura_fx 		= "particles/gadget/aura_wave",
	ui_ico			= {		target_system			= { tex = "ItemSubtype_CorV2FakeShips", },	},
	
	additional_auras = 
	{
		{
			target			= ai.SpellTarget.CASTER,
			aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
			aura			= ai.Aura.CLEANSE, --DISABLE_LOCK
			
			duration		= 1,
			aura_param		= 0.01,--3,
			
			isBuff			= false,
			ignore_additional_power = true,
			gameplay_specific	= true,

			aura_fx 		= "particles/gadget/aura_wave",
			ui_ico			= {		target_system			= { tex = "ItemSubtype_CorV2FakeShips", },	},
		},
	},
}

Spell.Spell_CorV2_self = 
{
	target =
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	influence 		= ai.Spell.APPLY_AURA,
	aura 			= ai.Aura.STEALTH,
	aura_target		=
	{
		target = ai.SpellTargetGeneral.HOLDER,
	},
	duration 		= 15,
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_MOVE,
	dispell_timeout	= 2,
	--gameplay_specific	= true, -- само-диспел не работает
	isBuff 			= true,
	
	spell_on_cancel	= "Spell_CorV2_Self2",
	
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_CorV2_Clone", },
	},
	additional_auras = 
	{
		{
			aura_target = 
			{
				target = ai.SpellTargetGeneral.HOLDER,
			},
			aura			= ai.Aura.INVULNERABILITY,
			dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_MOVE,
			dispell_timeout	= 2,
			isBuff			= true,
			duration		= 15,
			ui_ico =
			{
				target_system = { tex = "ItemSubtype_CorV2_Clone", },
			},
		},	
	},
	aura_end_sound 	= "sound/gadgets/shift_off",
}

Spell.Spell_CorV2_Self2 =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.CASTER,
	aura			= ai.Aura.FAST_MOVEMENT,

	aura_param 		= 0.30,
	duration		= 12,
	
	--aura_fx = "particles/gadget/protector_device_fx",
	isBuff 				= true,
	hud_visible			= true,
	
	ui_ico =
	{
		target_system = { tex = "ItemSubtype_CorV2_Clone", },
	},
 

}

Spell.Spell_CorV2_AOE =
{
	target			= { target = ai.SpellTargetGeneral.CONTEXT_POSITION, misc = ai.SpellTargetMisc.POSITION },

	aura_target		= ai.SpellTarget.ENEMY_AROUND, --ENEMY_AROUND,	
	
	aura_range			= 100,
	
	aura 				= ai.Aura.SLOW_MOVEMENT,
	aura_param			= 3,
	duration			= 6,
	--period			= 1,
	isBuff 				= false,
	
	min_targets_count	= 1, 

	aura_fx		= "particles/gadget/suicide_aura_1000m",	
	aura_sound 			= "sound/aura/stun",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CorV2_Clone", },
	},

	additional_auras =
	{
		{
		target			= { target = ai.SpellTargetGeneral.CONTEXT_POSITION, misc = ai.SpellTargetMisc.POSITION },

		aura_target		= ai.SpellTarget.ENEMY_AROUND,	
		
		aura_range			= 100,
		
		aura 				= ai.Aura.SPY_DRONE,
		--aura_param		= 0.5,
		duration			= 6,
		--period			= 1,
		isBuff 				= false,

		ui_ico = 	{		target_system 	= { tex = "ItemSubtype_CorV2_Clone", },	},		
		},
	},
}

Spell.Spell_CorV2_SmartRL2 =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		class			= ai.SpellTargetClass.SHIP,
		misc = ai.SpellTargetMisc.VISIBLE_BY_CASTER
	},
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc			= ai.SpellTargetMisc.REQUIRE_SAME_FRIENDLY_HOLDER + ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	
	aura_range		= 200,
	aura			= ai.Aura.ADDITIONAL_DAMAGE_THERMAL_SCALED,
	
	duration		= 10,
	--period			= 1,
	aura_param		= 1,
	isBuff 			= false,
	
	period_beam_fx	= "particles/weapons/laser/laser_electric_beam",
	period_fx		= "particles/weapons/laser/hit_electric",
 
	aura_fx 		= "particles/gadget/lightnings_debuff",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CorV2_SmartRL", },
	},
}




Spell.Spell_CorV2_TpPrep = {
	target = {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY, 
		},
	aura_target = 	
		{
			class				= ai.SpellTargetClass.SHIP,
			relationship		= ai.SpellTargetRelationship.ALLY,
			area				= ai.SpellTargetArea.AROUND,
		},	
	aura 				= ai.Aura.NONE, -- HEAL_HULL_SCALED_PERIODIC,
	aura_range 			= 1000,
	aura_param 			= 300,
	duration			= 0.2,
	period				= 0.5,
	
	spell_on_cancel	= "Spell_CorV2_TpSelf",
	
	isBuff 				= true,
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_Jump2Dude" } },
}


Spell.Spell_CorV2_Teleport1 =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_CorV2_Teleport', 'Spell_CorV2_TpSelf' }
}

Spell.Spell_CorV2_Teleport =  
{
	target					= ai.SpellTarget.CASTER,
	teleport_to_target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
	--aura_range				= 500,
	teleport_range			= 1000,
	influence 				= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset_dir		= Vec3( 0, 0, 1 ),
	teleport_offset			= 50,
			
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	cast_fx				= "particles/gadget/jump_corlegibus",
	in_fx = "particles/gadget/teleport_corlegibus",
	out_fx = "particles/gadget/teleport_corlegibus",
}

Spell.Spell_CorV2_TpSelf =
{
	influence		= ai.Spell.APPLY_AURA,
	aura_target		= ai.SpellTarget.CASTER,
	aura			= ai.Aura.HEALING_MOD,

	aura_param 		= 1,
	duration		= 10,
	
	--aura_fx = "particles/gadget/protector_device_fx",
	isBuff 				= true,	
	hud_visible		= true,
	
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_CorV2_TPAlly" } },

}

Spell.Spell_CorV2CPU = 
{

	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	--aura				= ai.Aura.DAMAGE_ONE_SHOT_MOD,
	aura				= ai.Aura.DAMAGE_MOD,	
	aura_param 			= 1,
	duration			= 7,	
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FastShootAxe", },
	},
}

Spell.Spell_CorV2Cap_shield = {
	aura_param 			= -0.11112,
	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.COOLDOWN_MOD,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FastShootAxe", },
	},
}

Spell.Spell_CorV2Cap_hull = {
	aura_param 			= -0.42777,
	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.HOLDER,
	aura				= ai.Aura.COOLDOWN_MOD,
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FastShootAxe", },
	},
}

Spell.Spell_AthlantaDroneS =
{
	influence 		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target	= --только вражеские корабли
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		=ai.SpellTargetVitality.ALIVE,
						misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
					},
	aura_range		= 200,
	aura 			= ai.Aura.DISABLE_WARP,


	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaDroneS", },
	},
	aura_target_directed_fx		= "particles/gadget/lightnings_debuff",
	
	additional_auras =
	{
		{		
		influence 		= ai.Spell.APPLY_AURA,
		target 			= ai.SpellTarget.CASTER,
		aura_target	= --только вражеские корабли
						{
							area 			= ai.SpellTargetArea.AROUND,
							class			= ai.SpellTargetClass.SHIP,
							relationship	= ai.SpellTargetRelationship.ENEMY,
							vitality		=ai.SpellTargetVitality.ALIVE,
							misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
						},
		aura_range		= 200,
		aura 			= ai.Aura.SPY_DRONE,


		isBuff			= false,
		ui_ico =
		{
			target_system 	= { tex = "ItemSubtype_AthlantaDroneS", },
		},
		aura_target_directed_fx		= "particles/gadget/lightnings_debuff",				
		},			
	},
}

Spell.Spell_AthlantaDroneM =
{
	influence 		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target	= --только вражеские корабли
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		=ai.SpellTargetVitality.ALIVE,
						misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
					},
	aura_range		= 200,
	aura 			= ai.Aura.REDUCE_MAX_SPEED,
	aura_param		= 0.2,

	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaDroneM", },
	},
	aura_target_directed_fx		= "particles/gadget/slow_movement",
}	

Spell.Spell_AthlantaDroneL =
{
	influence 		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target	= --только вражеские корабли
					{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						vitality		=ai.SpellTargetVitality.ALIVE,
						misc			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.HOLDER_SHOULD_NOT_BE_CLOAKED,
						
					},
	aura_range		= 200,
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param		= 1000,
	period			= 1,

	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AthlantaDroneL", },
	},
	aura_target_directed_fx		= "particles/gadget/lightnings_debuff",
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",
}	


Spell.Spell_GreenReconBlaster =
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_target		= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC, -- -50% хила

	aura_param		= 10, --33% непрерывного урона

	duration		= 3,	
	period			= 1,
	
	can_stack		= true,
	max_stacks		= 10,
	
	--damage_to_spell_aura_param = true,	
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenReconBlaster", },
	},
	--aura_target_directed_fx 	= "particles/weapons/laser/radiation_beam_heat_aura",
}

Spell.Spell_GreenReconPlasmaWeb =
{
	influence=ai.Spell.CAST_SPELLS,
	target =
	{
		target							= ai.SpellTargetGeneral.LOCKED_TARGET,
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	spells= { 'Spell_GreenReconPlasmaWebSM', 'Spell_GreenReconPlasmaWebL', 'Spell_GreenReconPlasmaWebH', 'Spell_GreenReconPlasmaWebBOT' },
	target_range						= 80,
	
}

Spell.Spell_GreenReconPlasmaWebSM =
{
	--influence							= ai.Spell.APPLY_AURA,
	target =
	{
		target							= ai.SpellTargetGeneral.LOCKED_TARGET,
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		signature						= ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM,
		ai 								= ai.SpellTargetAi.PLAYERS,
	},
	
	aura_target							= ai.SpellTarget.HOLDER,
	
	target_range						= 80,
	
	aura 								= ai.Aura.HULL_BURN_PERIODIC,
	maintain_aura	= true,
	
	aura_param							= 0.07,
	--duration							= 12,
	period								= 1,
	
	--scale_on_weapon						= true,

	--ignore_subtype						= true,

	isBuff								= false,
	
	ui_ico =
	{
		target_system					= { tex = "ItemSubtype_GreenReconPlasmaWeb", },
	},

	aura_apply_fx						= "particles/gadget/aura_breacktrough",
	period_module_fx					= "particles/gadget/plasma_web_module",
	period_module_my_fx					= "particles/gadget/plasma_web_module",
}

Spell.Spell_GreenReconPlasmaWebL =
{
	inherit		= "Spell_GreenReconPlasmaWebSM",
	target =
	{
		target							= ai.SpellTargetGeneral.LOCKED_TARGET,
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		signature						= ai.SignatureMask.LARGE,
		ai 								= ai.SpellTargetAi.PLAYERS,
	},
	aura 		= ai.Aura.HULL_BURN_PERIODIC,
	aura_param							= 0.04,
}

Spell.Spell_GreenReconPlasmaWebH =
{
	inherit		= "Spell_GreenReconPlasmaWebSM",
	target =
	{
		target							= ai.SpellTargetGeneral.LOCKED_TARGET,
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		signature						= ai.SignatureMask.HUGE,
		ai 								= ai.SpellTargetAi.PLAYERS,
	},
	aura 		= ai.Aura.HULL_BURN_PERIODIC,
	aura_param							= 0.03,
}

Spell.Spell_GreenReconPlasmaWebBOT =
{
	inherit		= "Spell_GreenReconPlasmaWebSM",
	target =
	{
		target							= ai.SpellTargetGeneral.LOCKED_TARGET,
		class							= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship					= ai.SpellTargetRelationship.ENEMY,
		ai 								= ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
	},
	aura 		= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	aura_param							= 500,
}



Spell.Spell_GreenReconPlasmaWebHEAL =
{

	target =
	{
		target							= ai.SpellTargetGeneral.LOCKED_TARGET,
		class							= ai.SpellTargetClass.SHIP,
		relationship					= ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_target							= ai.SpellTarget.CASTER,

	target_range						= 80,

	aura			= ai.Aura.HEAL_ON_HIT_SCALED,	
	
	aura_range		= 80,
	
	--duration		= 10,

	aura_param		= 4,--0.1,

	isBuff			= true,
	hud_visible 	= false,
	hud_visible_holder	= true,
	isBuff_holder		= false,
	aura_fx			= "particles/gadget/kinetic_vamp",

	ui_ico = {
		target_system = { tex = "ItemSubtype_GreenReconPlasmaWeb", },
	},
}

Spell.Spell_GreenReconCrystalRecClean = 
{
	influence 					= ai.Spell.DISPELL,
	target 						= ai.SpellTarget.CASTER,
	itemSubTypes				= { ItemSubtype.GreenReconCrystalRec },
}

Spell.Spell_GreenReconMine =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_GreenReconMineSM', 'Spell_GreenReconMineL', 'Spell_GreenReconMineH', 'Spell_GreenReconMineBOT' }
}

Spell.Spell_GreenReconMineSM =
{
	target				= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	--aura_target			= ai.SpellTarget.ENEMY_AROUND, 
	
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		ai             = ai.SpellTargetAi.PLAYERS,		
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
		signature		= ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM,
	},
	
	aura				= ai.Aura.HULL_BURN_PERIODIC,
	aura_param			= 0.2,
	aura_range		= 30,
	duration			= 10,--20,
	period				= 1,
	
	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound 			= "sound/aura/voidzone",
	nebula			= "Effects_Nebula_NukeVoidzone",

	isBuff				= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_GreenReconMine", }, },
}

Spell.Spell_GreenReconMineL =
{
	target				= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	--aura_target			= ai.SpellTarget.ENEMY_AROUND, 
	
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
		ai             = ai.SpellTargetAi.PLAYERS,
		signature		= ai.SignatureMask.LARGE,
	},
	
	aura				= ai.Aura.HULL_BURN_PERIODIC,
	aura_param			= 0.1,
	aura_range		= 30,
	duration			= 10,--20,
	period				= 1,
	
	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound 			= "sound/aura/voidzone",
	nebula			= "Effects_Nebula_NukeVoidzone",

	isBuff				= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_GreenReconMine", }, },
}

Spell.Spell_GreenReconMineH =
{
	target				= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		ai             = ai.SpellTargetAi.PLAYERS,
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
		signature		= ai.SignatureMask.HUGE,
	},
	
	aura				= ai.Aura.HULL_BURN_PERIODIC,
	aura_param			= 0.04,
	aura_range		= 30,
	duration			= 10,--20,
	period				= 1,
	
	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound 			= "sound/aura/voidzone",
	nebula			= "Effects_Nebula_NukeVoidzone",

	isBuff				= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_GreenReconMine", }, },
}

Spell.Spell_GreenReconMineBOT =
{
	target				= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.MINEFIELD + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		area           = ai.SpellTargetArea.AROUND,
		misc		= ai.SpellTargetMisc.EXCLUDE_CASTER,
		ai             = ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,			
	},
	
	aura				= ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC,
	aura_param			= 1300,
	aura_range		= 30,
	duration			= 10,--20,
	period				= 1,
	
	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound 			= "sound/aura/voidzone",
	nebula			= "Effects_Nebula_NukeVoidzone",

	isBuff				= false,
	ui_ico = { target_system 	= { tex = "ItemSubtype_GreenReconMine", }, },
}

Spell.Spell_GreenReconCloseWeapClean = 
{
	influence 					= ai.Spell.DISPELL,
	target 						= ai.SpellTarget.LOCKED_TARGET, --CASTER,
	target_range				= 1000,
	itemSubTypes				= { ItemSubtype.GreenReconCloseWeap },
}

Spell.Spell_GreenReconCloseWeap_poriodic = 
{
	target = ai.SpellTarget.LOCKED_TARGET,
	-- {
		-- target							= ai.SpellTargetGeneral.LOCKED_TARGET,
		-- class							= ai.SpellTargetClass.SHIP,
		-- relationship					= ai.SpellTargetRelationship.ENEMY,
	-- },
	

	target_range = 120,


	aura = ai.Aura.CAST_SPELL_PERIODIC,
	
	target_spell = "Spell_GreenReconCloseWeap",
	--duration = 30,
	period = 0.5,
	
	spell_on_cancel = "Spell_GreenReconCloseWeapClean",
	
	maintain_aura	= true,	
	isBuff = true,
	hud_visible = true,

	-- ui_ico =
	-- {
		-- target_system 	= { tex = "GreenReconCloseWeap", },
	-- },
}

-- Spell.Spell_GreenReconHarpoon =
-- {
	-- influence=ai.Spell.CAST_SPELLS,
	
	-- spells= { 'Spell_GreenReconHarpoon1', 'Spell_GreenReconHarpoon2' }
-- }

Spell.Spell_GreenReconHarpoon1 = 
{	
	target =
			{
				target							= ai.SpellTargetGeneral.CONTEXT_TARGET,
				class							= ai.SpellTargetClass.SHIP,
				relationship					= ai.SpellTargetRelationship.ENEMY,
				-- relationship					= ai.SpellTargetRelationship.ENEMY,
			},
	
	aura_target	= 						-- ai.SpellTarget.CASTER,
				{
				target							= ai.SpellTargetGeneral.CASTER,
				area							= ai.SpellTargetArea.AROUND,
				-- relationship					= ai.SpellTargetRelationship.ENEMY,
				},
	
	aura					= ai.Aura.DAMAGE_MOD,
	isBuff					= true,
	
	aura_range				= 250,
	aura_range_add			= -10,
 
	aura_param				= 0.0,
	aura_param_add			= 0.075,
	
	duration				= 20,
	scale_on_weapon			= true,

	--spell_on_cancel			= "Spell_GreenReconHarpoon2", 
 

 	
 	ui_ico =	{ target_system 	= { tex = "ItemSubtype_GreenReconHarpoon", },	},

}

Spell.Spell_GreenReconFetters =
{
		target =   
		{
			target = ai.SpellTargetGeneral.LOCKED_TARGET,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
		},
	
	target_range	= 100,	
	
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_GreenReconFetters1', 'Spell_GreenReconFetters2' }
}

Spell.Spell_GreenReconFetters1 = 
{
	target =   
		{
			target = ai.SpellTargetGeneral.LOCKED_TARGET,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
		},
	
	target_range	= 100,	
		
	aura_target =  
		{
			target 			= ai.SpellTargetGeneral.ENEMY,
			area			= ai.SpellTargetArea.AROUND,
			class 			= ai.SpellTargetClass.SHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
		},
	
	mod_target		= 
		{

			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.NOT_CLOAKED,
		},
		
	mod_max		= 5,	
	mod_update_period = 1,	
	mod_range	= 150,	
	disable_zero_stage = true,
	
	aura = ai.Aura.DAMAGE_EMP_PERIODIC, 
	
	aura_range = 200,
	aura_param = 600,
	period = 1,
	
	maintain_aura	= true,
	
	isBuff = false,
	
	period_fx		= "particles/gadget/pulsars/pulsar_alien_hit",
	period_my_fx	= "particles/gadget/pulsars/pulsar_shield_hit",
	period_beam_fx	= "particles/gadget/pulsars/pulsar_alien_beam",
	
	--aura_fx = "particles/gadget/suicide_aura", --эффект на холдере, зацикленный
	ui_ico = 	{	target_system 	= { tex = "ItemSubtype_GreenReconFetters", }, 	},
	
	-- additional_auras =
	-- {
		-- {
		
			-- target =   
				-- {
					-- target = ai.SpellTargetGeneral.LOCKED_TARGET,
					-- relationship 	= ai.SpellTargetRelationship.ENEMY,
				-- },
			
			-- target_range	= 100,	
	
			-- aura = ai.Aura.SLOW_MANEUVER,
			-- aura_param = 0.03,
			-- aura_range = 200,
			
			-- mod_max		= 5,	
			-- mod_update_period = 1,	
			-- mod_range	= 150,	
			
			-- ui_ico = 	{	target_system 	= { tex = "ItemSubtype_GreenReconFetters", }, 	},
		-- },
	-- },	
}

Spell.Spell_GreenReconFetters2 = 
{
	inherit		= "Spell_GreenReconFetters1",
	aura = ai.Aura.SLOW_MANEUVER,
	aura_param = 0.03,	
}

Spell.Spell_GreenReconFetters_HEAL = 
{
	target =   
		{
			target = ai.SpellTargetGeneral.LOCKED_TARGET,
		},
	
	target_range	= 100,	
		
	aura_target =  
		{
			target 			= ai.SpellTargetGeneral.CASTER,
		},

	mod_target		= 
		{

			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.NOT_CLOAKED,
		},
		
	mod_max		= 5,	
	mod_update_period = 1,	
	mod_range	= 150,	
	disable_zero_stage = true,
	
	aura = ai.Aura.HEAL_HULL_PERIODIC, 
	
	aura_range = 200,
	aura_param = 600,
	period = 0.5,
	
	maintain_aura	= true,
	
	isBuff = true,
	period_beam_fx 	= "particles/gadget/heal_ray_blue",
 
--	aura_fx			= "particles/gadget/cagetrap_emmiter",
	ui_ico = 	{	target_system 	= { tex = "ItemSubtype_GreenReconFetters", }, 	},
	
}	

Spell.Spell_GRCrystallEmissionPeriod =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "Spell_GRCrystallEmission",
	duration		= 6,
	period			= 0.5,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_GRCrystallEmission" } },
}



Spell.Spell_GRCrystallEmission =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
 

	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
					
	aura			= ai.Aura.DISABLE_LOCK,				
	aura_range 		= 5,
	aura_range_add	= 4,
	aura_range_add_max = 37.5,
		
	duration		= 10,
	--period 			= 0.5,
	
	nebula			= "Effects_Nebula_Emissions",
	cast_position_fx	= "particles/gadget/fueldrop_sphere_big",	
 
	isBuff			= false,
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_GRCrystallEmission" } },
	
}

Spell.Spell_GRCrystallEmissionPeriod2 =
{
	influence		= ai.Spell.APPLY_AURA,
	target			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "Spell_GRCrystallEmission1",
	duration		= 6,
	period			= 0.5,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_GRCrystallEmission" } },
}

Spell.Spell_GRCrystallEmission1 =
{
	inherit		= "Spell_GRCrystallEmission",
	aura			= ai.Aura.RESIST_ALL_DEC,
	aura_param	= 0.3,
	
	nebula			= "Effects_Nebula_Emissions",
	cast_position_fx	= "particles/gadget/fueldrop_sphere_big",	
}

Spell.Spell_GREnergyLance =
{
	target					= ai.SpellTarget.CASTER_POSITION_CASTER,
	
	aura_target =
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.IN_CYLINDER,  --цилиндр радиуса aura_range и длиной target_range
	},
	aura_holder_def			= "Sneezer",  --вызывает объект
	aura_holder_attach_bone	= "root",	--кость к которй крепится объект
	aura_holder_offset		= Vec3( 0, 0, -1 ), -- начальная точка откуда пойдет луч относительно кастера
	
	aura_range		= 40,	
	aura_extra_radius	= 5,	--

	aura_target_offset 	= Vec3( 0, 0, -1 ),
	
	aura = ai.Aura.SLOW_MOVEMENT,
	aura_param = 0.5,
	duration = 4,

	disable_aura_duration = true,
	hud_visible		= true,
	hud_visible_holder = true,
	
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GREnergyLance", },
	},
}

Spell.Spell_GRChameleon =
{
	influence 		= ai.Spell.APPLY_AURA,
	
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	
	aura 			= ai.Aura.ANTI_RADAR,	
	--duration 		= 20,
	
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	dispell_timeout	= 1,
	
	isBuff 			= true,
	
	ui_ico = {		target_system = { tex = "ItemSubtype_GRChameleon", },	},
	aura_fx = "StealthEffect",
	
	additional_auras =
	{
		{
		influence 		= ai.Spell.APPLY_AURA,
	
		target			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		
		aura 			= ai.Aura.FAST_MOVEMENT,	
		aura_param		= 0.25,
		--duration 		= 20,
		
		dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
		dispell_timeout	= 1,
		
		isBuff 			= true,
		
		ui_ico = {		target_system = { tex = "ItemSubtype_GRChameleon", },	},
		--aura_fx = "StealthEffect",
		},
	},	
}

Spell.Spell_GREmergrncy =
{

	target			= ai.SpellTarget.CASTER_POSITION_CASTER,

	aura_target		= {	class	= ai.SpellTargetClass.SHIP,
						area	= ai.SpellTargetArea.AROUND,
						relationship = ai.SpellTargetRelationship.ENEMY,
						vitality = ai.SpellTargetVitality.ALIVE,
						misc	= ai.SpellTargetMisc.VISIBLE_BY_HOLDER
						},
						
	isBuff			= false,
	
	aura_holder_def	= "GREmergrncyHolder",
	
	aura			= ai.Aura.DISABLE_LOCK,
	aura_range		= 120,
	aura_param		= 50,	
	duration 		= 12,
	--cast_position_fx = "particles/other/green_beacon",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GREmergrncy", },
	},
}	

Spell.Spell_GRForceField =
{
	aura 				= ai.Aura.SHIELD_RESIST_ALL,
	target				= ai.SpellTarget.CASTER,
	aura_target 		= ai.SpellTarget.HOLDER,
	aura_param			= 10, --11  -- держится секунд 5-7
	aura_param_stages	= { 1, 2, 4, 6, 8 }, -- 0=11 1=19 2=27     ----  8+=75
	--disable_zero_stage	= true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_GRForceField", }, },
}

Spell.Spell_GRJumpDriveCast =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_GRJumpDrive', 'Spell_GRJumpDriveDebuff' }
}

Spell.Spell_GRJumpDrive = 
{
	target					= ai.SpellTarget.CASTER,
	teleport_to_target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
	--aura_range				= 500,
	teleport_range			= 450,
	influence 				= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset_dir		= Vec3( 0, 0, 1 ),
	teleport_offset			= 50,
			
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	cast_fx				= "particles/gadget/jump_corlegibus",
	in_fx = "particles/gadget/teleport_corlegibus",
	out_fx = "particles/gadget/teleport_corlegibus",
}

Spell.Spell_GRJumpDriveDebuff = 
{
	target					= ai.SpellTarget.CASTER,
	
	aura_target		= {
		target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
	
	aura			= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
	aura_param		= 2000,
	period			= 1,
	duration		= 5,
	aura_range				= 450,
 
	aura_execution_delay	= 0.2,
	period_beam_root_fx  	= "particles/gadget/pulsars/pulsar_beam", --"particles/gadget/heal_ray_blue",		
	cast_sound 				= "sound/gadgets/ReverseThruster_activate",
	cast_fx				= "particles/gadget/jump_corlegibus",
	in_fx = "particles/gadget/teleport_corlegibus",
	out_fx = "particles/gadget/teleport_corlegibus",
	
	ui_ico = {target_system 	= { tex = "ItemSubtype_GRJumpDrive", },	},
}

Spell.Spell_GreenReconBoom =
	{		
			
			target	= 
					{ 
						target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
						--signature		= ai.SignatureMask.LARGE,
						relationship	= ai.SpellTargetRelationship.ENEMY,
					},
			
			aura_target 			= --ai.SpellTarget.ALL_IN_CYLINDER_EXCLUDE_SELF,
					{
					class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.BATTLE_STATION + ai.SpellTargetClass.SC_BASE_ENTITY,
					area 			= ai.SpellTargetArea.AROUND,
					relationship 	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
					misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
					},
			aura					= ai.Aura.DAMAGE_REFLECT,
			isBuff					= false,
			aura_range	 			= 100, --дальность луча
			aura_param				= 10000000,
			scale_on_weapon			= true,
 
			duration 				= 10,
			period					= 0.5,
			
			aura_execution_delay 	= 0.2,
			
			aura_fx 				= "particles/gadget/drone_scavenger_spell",
			work_beam_target_root_fx = "particles/gadget/alien_shield_reflector_beam",
			--period_beam_fx 			= "particles/gadget/pulsars/pulsar_beam",
			
 			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_GreenReconBoom", },
			},
	}

--------------------------------------------------------------------------------BRAWL

Spell.Spell_WarpBall_Drive1 =  
{
	target 			= 
	{
		target = ai.SpellTargetGeneral.CASTER, 
	},

	aura_target = 
	{
		target = ai.SpellTargetGeneral.CASTER,
	},
	aura			= ai.Aura.FAST_MOVEMENT,
	duration		= 4, --1, --3
	aura_param		= 10,


	hud_visible		= false,
	isBuff			= true,
	
	aura_fx	= "particles/events/steel_balls/ram_ship",
	ui_ico = {
		target_system 	= { tex = "ItemSubtype_MicroWarp_Winter", },
	},
	
	
	additional_auras = 
	{
		{
			influence		= ai.Spell.APPLY_AURA,
			aura_target		= ai.SpellTarget.ENEMY_SHIPS_AROUND,
			aura			= ai.Aura.DAMAGE_KINETIC_PERIODIC,
			aura_param 		= 7500,  
			aura_range 		= 20,
			duration		= 4,	-- по длительности боя надо будет корректировать
			period			= 0.2,
			isBuff			= false,
			gameplay_specific = true,
			hud_visible 	= false,
		
		},
	},
}

Spell.Spell_WarpBall_DriveATTRACT_ONEQUIP =
{
	influence	= ai.Spell.IMPULSE,
	target = 
	{
		class 				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.AROUND,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},
	

	influence_param	= -400,
	--duration = 4,
	target_range			= 15,
	isBuff = false,
	hud_visible 		= true,
	ignore_additional_power 	= true,
	
	--aura_fx ="particles/gadget/alien_hipnodancer_aura",
	ui_ico =
	{
	target_system 	= { tex = "ItemSubtype_GG_Hipnodancer", },
	},
}

Spell.Spell_WarpBall_DriveATTRACT =
{
	influence	= ai.Spell.IMPULSE,
	target = 
	{
		class 				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.AROUND,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
	},

	influence_param	= -800,
	duration = 4,
	target_range			= 15,
	isBuff = false,
	hud_visible 		= true,
	ignore_additional_power 	= true,
	
	aura_fx ="particles/gadget/alien_hipnodancer_aura",
	ui_ico =
	{
	target_system 	= { tex = "ItemSubtype_GG_Hipnodancer", },
	},

}

Spell.Spell_GlassAttraction_BRAWL = 
{
	inherit				= "Spell_GlassAttraction",
	aura_range 			= 220,
	aura_param 			= -120,
}

Spell.Spell_FakeShipBackstab_stealth_BRAWL = 
{
	inherit				= "Spell_FakeShipBackstab_stealth",
	duration			= 20,
	ui_ico = {		target_system = { tex = "ItemSubtype_FakeShipBackstabBRAWL", },	},	
}

Spell.Spell_FakeShipBackstabBRAWL = 
{
	inherit				= "Spell_FakeShipBackstab",
	duration			= 20,
	ui_ico = {		target_system = { tex = "ItemSubtype_FakeShipBackstabBRAWL", },	},	
}

Spell.Spell_Chameleon_BRAWL =
{
	influence 		= ai.Spell.APPLY_AURA,
	
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	
	aura 			= ai.Aura.ANTI_RADAR,	
	duration 		= 20,
	
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	dispell_timeout	= 1,
	
	isBuff 			= true,
	
	ui_ico = {		target_system = { tex = "ItemSubtype_Chameleon", },	},
	aura_fx = "StealthEffect",
}	

Spell.Spell_StoneShield_BRAWL =
{
	influence 		= ai.Spell.APPLY_AURA,
	
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	
	aura 			= ai.Aura.STEALTH,	
	duration 		= 4,
	
	dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
	dispell_timeout	= 1,
	
	isBuff 			= true,
	
	ui_ico = {		target_system = { tex = "ItemSubtype_StoneShield", },	},
	--aura_fx = "StealthEffect",
	
	additional_auras =
	{
		{
		influence 		= ai.Spell.APPLY_AURA,
	
		target			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		
		aura 			= ai.Aura.FORTIFICATION,	
		duration 		= 1,
		
		dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
		dispell_timeout	= 1,
		
		isBuff 			= true,
		
		ui_ico = {		target_system = { tex = "ItemSubtype_StoneShield", },	},
		--aura_fx = "StealthEffect",
		},
		{
		influence 		= ai.Spell.APPLY_AURA,
	
		target			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		
		aura 			= ai.Aura.FAST_MOVEMENT,	
		duration 		= 3,
		
		aura_param 		= 1,
		
		dispell_flag	= ai.Dispell.ON_FIRE + ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE,
		dispell_timeout	= 1,
		aura_execution_delay = 1,
		
		isBuff 			= true,
		
		ui_ico = {		target_system = { tex = "ItemSubtype_StoneShield", },	},
		--aura_fx = "StealthEffect",
		},
	},
}

Spell.Spell_FireArrowOnHit_BRAWL =
{
	target				= 
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	
		aura_target = 
	{
		target				= ai.SpellTargetGeneral.HOLDER,
	},
	
	aura 					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	
	isBuff					= false,
	aura_param				= 1000,
	duration				= 3,--7,
	period 					= 1,

	aura_target_fx = "particles/events/steel_balls/weapon_red_spell",
	
	ignore_stacks		= true,
	ignore_subtype		= true,	
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_FireArrow", },
	},
}


Spell.Spell_FireArrow_BRAWL = 
{

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target =
	{
		target 				= ai.SpellTargetGeneral.TRIGGER_TARGET,
		class 				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
	},
	
	aura 					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	duration 				= 10,--16.0,
	period					= 0.5,
	aura_param				= 250,
	aura_range				= 50,
	ignore_subtype			= true,
	ignore_stacks			= true,

	aura_target_fx = "particles/events/steel_balls/weapon_red_spell",

	isBuff					= false,
	ui_ico = 	{		target_system 	= { tex = "ItemSubtype_FireArrow", },	},
}

Spell.Spell_FreezingArrowOnHit_BRAWL =
{
	target				= 
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	
		aura_target = 
	{
		target				= ai.SpellTargetGeneral.HOLDER,
	},
	
	aura 					= ai.Aura.SLOW_MOVEMENT,
	
	isBuff					= false,
	aura_param				= 0.2666,
	duration				= 10,--7,
	
	--period 					= 1,
	
	aura_target_fx = "particles/events/steel_balls/weapon_blue_spell",
	
	ignore_stacks		= true,
	ignore_subtype		= true,	
	
	ui_ico = 	{		target_system 	= { tex = "ItemSubtype_FreezingArrow", },	},
	
	additional_auras =
	{
		{
			target				= 
			{
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	
			aura_target = {		target = ai.SpellTargetGeneral.HOLDER,	},
			
			aura 					= ai.Aura.DAMAGE_EMP_PERIODIC,
			aura_param				= 500,
			duration				= 2,
			period					= 1,
			ignore_subtype			= false,
			ignore_stacks			= false,
	
			isBuff					= false,
			duration				= 10,--7,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_FreezingArrow", },
			},
			
		},
	},		
}	

Spell.Spell_FreezingArrowStatic_BRAWL = 
{
	inherit		= "Spell_FireArrow_BRAWL",
	aura 		= ai.Aura.SLOW_MOVEMENT,
	aura_param	= 0.5,	

	ui_ico = 	{		target_system 	= { tex = "ItemSubtype_FreezingArrow", },	},

	aura_target_fx = "particles/events/steel_balls/weapon_blue_spell",	
	
	additional_auras =
	{
		{
			aura 		= ai.Aura.SLOW_MOVEMENT,
			aura_param	= 0.5,
			duration 				= 10,
			ui_ico = 	{		target_system 	= { tex = "ItemSubtype_FreezingArrow", },	},	
		},
	},
}

Spell.Spell_HealArrowOnHit_BRAWL =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'Spell_HealArrow_BRAWL1', 'Spell_HealArrow_BRAWL2' }
}

Spell.Spell_HealArrow_BRAWL1 =
{
	target				= 
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
		relationship	= ai.SpellTargetRelationship.ALLY,
	},
	
		aura_target = 
	{
		target				= ai.SpellTargetGeneral.HOLDER,
	},
	
	aura 					= ai.Aura.HEAL_HULL_PERIODIC,
	
	isBuff					= true,
	aura_param				= 1000,
	duration				= 10,--7,
	period 					= 1,
	
	aura_target_fx = "particles/events/steel_balls/weapon_green_spell",

	ignore_stacks		= true,
	ignore_subtype		= true,	
	
	ui_ico = 	{		target_system 	= { tex = "ItemSubtype_HealArrow", },	},
		
}

Spell.Spell_HealArrow_BRAWL2 =
{
target				= 
			{
				target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
				relationship	= ai.SpellTargetRelationship.ENEMY,
			},
	
			aura_target = {		target = ai.SpellTargetGeneral.HOLDER,	},
			
			aura 					= ai.Aura.DAMAGE_KINETIC_PERIODIC,
			aura_param				= 500,
			duration				= 3,
			period					= 1,
			ignore_subtype			= false,
			ignore_stacks			= false,
	
			isBuff					= false,
			duration				= 10,--7,
			
			ui_ico =
			{
				target_system 	= { tex = "ItemSubtype_HealArrow", },
			},
}

Spell.Spell_HealArrowStatic_BRAWL = 
{
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
	},
	aura_target =
	{
		target 				= ai.SpellTargetGeneral.TRIGGER_TARGET,
		class 				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ALLY,
		area				= ai.SpellTargetArea.AROUND,
	},
	
	aura 					= ai.Aura.HEAL_HULL_PERIODIC,
	duration 				= 10,--16.0,
	period					= 1,
	aura_param				= 1000,
	aura_range				= 80,
	ignore_subtype			= true,
	ignore_stacks			= true,
	aura_target_fx = "particles/events/steel_balls/weapon_green_spell",	
	--spell_on_cancel 		= "FlameThrowerFire",
	isBuff					= true,
	ui_ico = 	{		target_system 	= { tex = "ItemSubtype_HealArrow", },	},
	
	additional_auras =
	{
		{
			aura 					= ai.Aura.HEAL_SHIELD_PERIODIC,
			duration 				= 10,--16.0,
			period					= 1,
			aura_param				= 1000,
			aura_range				= 80,
			ignore_subtype			= true,
			ignore_stacks			= true,
			aura_target_fx = "particles/gadget/shield_heal",	
			--spell_on_cancel 		= "FlameThrowerFire",
			isBuff					= true,
			ui_ico = 	{		target_system 	= { tex = "ItemSubtype_HealArrow", },	},
		},
	},	
}

Spell.Spell_FireGunBall_BRAWL = 
{
	aura 					= ai.Aura.DAMAGE_THERMAL_SCALED,
	-- target 					= { target = ai.SpellTargetGeneral.CONTEXT_TARGET, },
	target = {
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		signature			= ai.SignatureMask.TINY + ai.SignatureMask.SMALL + ai.SignatureMask.MEDIUM + ai.SignatureMask.LARGE, --1.75
		damageability  		= ai.SpellTargetDamageability.DAMAGEABLE,
		class 		        = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.BATTLE_STATION,
	},
	aura_target 	= ai.SpellTarget.HOLDER,
	isBuff					= false,
	aura_param				= 250,
	duration				= 3,
	period 					= 0.5,
	ui_ico =  	{		target_system 	= { tex = "ItemSubtype_FireGunBall", },  	},
	aura_target_fx = "particles/events/steel_balls/weapon_red_spell",
}

Spell.Spell_FreezeGunBall_BRAWL = 
{
	inherit				= "Spell_FireGunBall_BRAWL",
	
	aura 					= ai.Aura.SLOW_MOVEMENT,
	aura_param				= 1,
	duration				= 3,
	period 					= 0.2,
	ui_ico =  	{		target_system 	= { tex = "ItemSubtype_FreezeGunBall", },  	},
	aura_target_fx = "particles/events/steel_balls/weapon_blue_spell",
}


Spell.Spell_HealGunBall_BRAWL = 
{
	inherit				= "Spell_FireGunBall_BRAWL",

	target = {
		target 				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship		= ai.SpellTargetRelationship.ALLY,

			},	
	
	aura 					= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param				= 1500,
	duration				= 3,
	period 					= 1,
	aura_target_fx = "particles/events/steel_balls/weapon_green_spell",
	ui_ico =  	{		target_system 	= { tex = "ItemSubtype_HealGunBall", },  	},
	isBuff					= true,
	
	additional_auras	= 
	{
		{
			aura 					= ai.Aura.HEAL_SHIELD_PERIODIC,
			aura_param				= 1500,
			duration				= 3,
			period 					= 1,
			
			isBuff					= true,
			ui_ico =  	{		target_system 	= { tex = "ItemSubtype_HealGunBall", },  	},
		},
	},
}

Spell.Spell_AsteridGunBall_BRAWL =
{
	
	target 			= 	ai.SpellTarget.INFLICTOR,
	
	aura_target 	= 	{
						area 			= ai.SpellTargetArea.AROUND,
						class			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
						vitality		=ai.SpellTargetVitality.ALIVE,
						},
						
	aura 			= ai.Aura.SHIP_ATTRACTION,
	aura_range		= 25,
	aura_param		= -400,

	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AsteridGunBall", },
	},
}

Spell.Spell_CageTrap_Brawl = 
{
	aura = ai.Aura.SHIP_ATTRACTION,
	aura_param			= 100,

	-- aura = ai.Aura.DAMAGE_EMP_PERIODIC

	duration = 30,
	aura_range			= 100,
	aura_range_add		= -2.8333,

	--target				= ai.SpellTarget.CASTER_POSITION_CASTER,
	target				= 	{
		target         = ai.SpellTargetGeneral.CASTER,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		misc           = ai.SpellTargetMisc.POSITION,
	},
	aura_holder_def		= "CageTrapMineActiveHolder_BRAWL",
	aura_target = 
	{
		target				= ai.SpellTargetGeneral.CONTEXT_TARGET,
		class 				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.OUTSIDE,
		relationship		= ai.SpellTargetRelationship.ENEMY, --ENEMY
		misc         	  = ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
	},
	isBuff = false,
	hud_visible 		= false,
	min_targets_count = 0,
	
	ui_ico =  			{	target_system 	= { tex = "ItemSubtype_GravyBlock", },	},
	
	aura_fx = "particles/events/steel_balls/cagetrap_emmiter",
	work_beam_target_root_fx = "particles/gadget/cagetrap_beam",
	additional_auras = 
	{
		{
			aura = ai.Aura.DISABLE_WARP,
			duration = 30,
			aura_target = 
			{
				target				= ai.SpellTargetGeneral.CONTEXT_TARGET,
				class 				= ai.SpellTargetClass.SHIP,
				relationship		= ai.SpellTargetRelationship.ENEMY
			},
			ignore_stacks = true,
			ignore_subtype = true,
			isBuff			= false, -- SC-118152
			ui_ico =  			{	target_system 	= { tex = "ItemSubtype_GravyBlock", },	},
		}
	}
}
---------------------------------------------------------------------- END BRAWL

Spell.Spell_AB2Stuka =
{		

	target	= 
				{ 
					target 			= ai.SpellTargetGeneral.CONTEXT_TARGET, 
					-- relationship	= ai.SpellTargetRelationship.ENEMY,
				},
	aura_target		= ai.SpellTarget.HOLDER,
	
	aura					= ai.Aura.SLOW_MOVEMENT,
	isBuff					= false,

	aura_param				= 0.1,
	can_stack				= true,
	max_stacks				= 5,
			
	duration 				= 5,
			
	aura_fx 				= "particles/gadget/slow_movement",
			
	ui_ico = { target_system 	= { tex = "ItemSubtype_AB2Stuka", },	},
}

-- Spell.Spell_AB2Stuka_overcharge = 
-- {
	-- aura = ai.Aura.OVERCHARGE,
	-- aura_apply_fx = "particles/gadget/aura_breacktrough",
	-- aura_end_sound = "sound/gadgets/timeboost_end",
	-- aura_fx = "particles/gadget/overdrive",
	-- aura_param = 0.45,--0.25,
	-- aura_target = ai.SpellTarget.HOLDER,
	-- duration = 10,
	-- isBuff = true,
	-- target = ai.SpellTarget.CASTER,
	-- ui_ico = 	{ target_system = { tex = "ItemSubtype_AB2Stuka", },	},

-- }

Spell.Spell_ChaosFreeFlySpeed =
{
	influence 		= ai.Spell.APPLY_AURA,
	
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	
	aura 			= ai.Aura.FAST_MOVEMENT,	
	aura_param		= 1,
	
	isBuff 			= true,
	
	ui_ico = {		target_system = { tex = "ItemSubtype_ChaosFreeFlyDMG", },	},
	aura_fx = "particles/gadget/overdrive",
	additional_auras =
	{
		{
		influence 		= ai.Spell.APPLY_AURA,
	
		target			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		
		aura 			= ai.Aura.SLOW_MANEUVER,	
		aura_param		= 1,
		--duration 		= 20,
		
		isBuff 			= true,
		
		ui_ico = {		target_system = { tex = "ItemSubtype_ChaosFreeFlyDMG", },	},
		--aura_fx = "StealthEffect",
		},
	},		
}	
	
Spell.Spell_ChaosFreeFlyDMG =
{

	influence 		= ai.Spell.APPLY_AURA,
	
	target			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
		
	aura 			= ai.Aura.DAMAGE_MOD,	
	aura_param		= 1,
		--duration 		= 20,
				
	isBuff 			= true,
		
	ui_ico = {		target_system = { tex = "ItemSubtype_ChaosFreeFlySpeed", },	},
	
	additional_auras =
	{
		{
		influence 		= ai.Spell.APPLY_AURA,
	
		target			= ai.SpellTarget.CASTER,
		aura_target		= ai.SpellTarget.HOLDER,
		
		aura 			= ai.Aura.FIRE_RATE_MOD,	
		aura_param		= -1,
		
		isBuff 			= true,
		
		ui_ico = {		target_system = { tex = "ItemSubtype_ChaosFreeFlySpeed", },	},
		--aura_fx = "StealthEffect",
		},
	},		
}

Spell.Spell_ChaosHull =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= 		ai.SpellTarget.CASTER,
	aura			= ai.Aura.COOLDOWN_MOD,

	aura_param		= -0.5,
	isBuff			= true,
	cast_fx	= "particles/weapons/misiles_reload",

	ui_ico =
	{
		target_system = { tex = "ItemSubtype_ChaosHull", },
	},
}

Spell.Spell_ChaosCPU = 
{

	target				= ai.SpellTarget.CASTER,
	aura_target			= ai.SpellTarget.CASTER,
	aura				= ai.Aura.PROJECTILE_SPEED_MOD,
	aura_param 			= 0.15,	
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ChaosCPU", },
	},
}
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- технический родительский спелл для создания нескольких автоген-спеллов на одно действие
------------------------------------------------------------------------------------------
Spell.AutogenMulticast =
{
	influence = ai.Spell.CAST_SPELLS,
	spells = {},
}

sys.execscript( 'gamedata/def/ex/laser_spell.lua' )
sys.execscript( 'gamedata/def/ex/plasma_spell.lua' )
sys.execscript( 'gamedata/def/ex/plasma_spell2.lua' )
sys.execscript( 'gamedata/def/ex/railgun_spell.lua' )
sys.execscript( 'gamedata/def/ex/engine_mod_spell.lua' )
sys.execscript( 'gamedata/def/ex/shield_mod_spell.lua' )
sys.execscript( 'gamedata/def/ex/shield_mod_spell2.lua' )
sys.execscript( 'gamedata/def/ex/armor_spell.lua' )
sys.execscript( 'gamedata/def/ex/capacitor_mod_spell.lua' )
sys.execscript( 'gamedata/def/ex/green_weapon_projectile.lua' )
sys.execscript( 'gamedata/def/ex/green_weapon_spell.lua' )
sys.execscript( 'gamedata/def/ex/green_engine_spell.lua' )
sys.execscript( 'gamedata/def/ex/cpu_mod_spell.lua' )
sys.execscript( 'gamedata/def/ex/green_pass_spell.lua' )
sys.execscript( 'gamedata/def/ex/green_pass_spell2.lua' )
sys.execscript( 'gamedata/def/ex/green_pass_spell3.lua' )
sys.execscript( 'gamedata/def/ex/green_active_spell.lua' )
sys.execscript( 'gamedata/def/ex/green_active_spell2.lua' )
sys.execscript( 'gamedata/def/ex/green_active_spell3.lua' )
sys.execscript( 'gamedata/def/ex/green_active_spell4.lua' )
sys.execscript( 'gamedata/def/ex/rank_spells.lua' )

sys.execscript( 'gamedata/spell/spell_extension.lua' )