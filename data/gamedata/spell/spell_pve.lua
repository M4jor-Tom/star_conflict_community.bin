-- Ауры для Pve миссий

--
Spell.TestPveBuff =
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura_range		= 3000,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 1,
}

Spell.BurnEnergy_Test =
{
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	isBuff			= false,
	aura_range		= 5000,
	aura_param 		= 5000,
	duration		= 1,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WebPropulsion", },
	},
}

-- Периодически 'сжигает' aura_param единиц енергии. (только для SpaceShip) CASUAL
Spell.Pve_BurnEnergy =
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	isBuff			= false,
	aura_range		= 5000,
	aura_param 		= 5,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WebPropulsion", },
	},
}

-- Периодически 'сжигает' aura_param единиц енергии. (только для SpaceShip) HARD
Spell.Pve_BurnEnergy_Hard =
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	isBuff			= false,
	aura_range		= 5000,
	aura_param 		= 5,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_WebPropulsion", },
	},
}

-- Увеличивает резист щита от термальных повреждений CASUAL
Spell.Pve_ShieldResist_Thermal = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.SHIELD_RESIST_THERMAL,
	isBuff			= true,
	aura_param		= 50,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AdaptiveShieldBoost", },
	},
} 

-- Увеличивает резист корпуса от термальных повреждений CASUAL
Spell.Pve_HullResist_Thermal = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HULL_RESIST_THERMAL,
	isBuff			= true,
	aura_param		= 50,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AdaptiveArmorBoost", },
	},
} 

-- Увеличивает резист корпуса от термальных повреждений HARD
Spell.Pve_HullResist_Thermal_Hard = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HULL_RESIST_THERMAL,
	isBuff			= true,
	aura_param		= 25,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AdaptiveArmorBoost", },
	},
} 

-- Уменьшает лечение на 50%
Spell.Pve_ReduceHeal =
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HEALING_MOD,
	aura_param		= -1,
	isBuff			= false,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_TargetPainter", },
	},
}

-- Увеличивает критический шанс урона на 50% CASUAL
Spell.Pve_CritChance = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.CRIT_CHANCE,
	isBuff			= true,
	aura_param		= 0.45,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CommandWeaknessAnalyzer", },
	},
} 

-- Увеличивает критический шанс урона на 10% HARD
Spell.Pve_CritChance_Hard = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.CRIT_CHANCE,
	isBuff			= true,
	aura_param		= 0.05,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CommandWeaknessAnalyzer", },
	},
} 

-- Увеличивает резист корпуса от термальных повреждений CASUAL
Spell.Pve_HullResist_Thermal = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HULL_RESIST_THERMAL,
	isBuff			= true,
	aura_param		= 200,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AdaptiveArmorBoost", },
	},
} 

-- Периодически восстанавливает aura_param единиц здоровья CASUAL
Spell.Pve_HealHull = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	isBuff			= true,
	aura_param		= 5,
	aura_range		= 5000,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
} 

Spell.Pve_HealHullEasy = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	isBuff			= true,
	aura_param		= 10,
	aura_range		= 5000,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
}

-- Периодически восстанавливает aura_param единиц энергии CASUAL
Spell.Pve_RegenEnergy = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.ADD_ENERGY_PERIODIC,
	isBuff			= true,
	aura_param		= 10,
	aura_range		= 5000,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EnergyEmitter", },
	},
} 

-- Периодически восстанавливает aura_param единиц здоровья HARD
Spell.Pve_HealHull_Hard = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	isBuff			= true,
	aura_param		= 1,
	aura_range		= 5000,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
} 

-- Периодически восстанавливает aura_param единиц щита CASUAL
Spell.Pve_HealShield = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	isBuff			= true,
	aura_param		= 5,
	aura_range		= 5000,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldRestoreSmall", },
	},
} 

-- Периодически восстанавливает aura_param единиц щита HARD
Spell.Pve_HealShield_Hard = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	isBuff			= true,
	aura_param		= 1,
	aura_range		= 5000,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldRestoreSmall", },
	},
} 

-- Постоянно увеличивает резист щита и корпуса на aura_param единиц CASUAL
Spell.Pve_Resist_AllDamage = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.RESIST_ALL,
	isBuff			= true,
	aura_param		= 10,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Invulnerability", },
	},
} 

-- Постоянно увеличивает резист щита и корпуса на aura_param единиц HARD
Spell.Pve_Resist_AllDamage_Hard = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.RESIST_ALL,
	isBuff			= true,
	aura_param		= 5,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Invulnerability", },
	},
} 

-- Периодическое АОЕ кинетикой по всем враждебным юнитам на карте HARD
Spell.Pve_KineticAoePeriodic = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.DAMAGE_KINETIC_PERIODIC,
	isBuff			= true,
	period			= 6,
	aura_param		= 400,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
} 

-- Увеличивает урон наносимый основным оружием на 33% HARD
Spell.Pve_BuffDamage = 
{
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura			= ai.Aura.DAMAGE_MOD,
	isBuff			= true,
	aura_param		= 0.3,
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_AchillesTargetingUnit", },
	},
} 

-- Периодически спаунит VoidZone 
Spell.Pve_VoidZone_ThermalDamage = 
{
	aura_range		= 20,
	aura_param		= 0.5,
	duration 		= 20,
	target			= ai.SpellTarget.ENEMY_SHIPS_AROUND_POSITION,
	target_range 	= 5000,
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	isBuff			= false,	
	aura_sound			= "sound/aura/voidzone",
	
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", }, -- заглушка
	},
}

-- spell voiddamage SpaceMissile_ThermalDamageZone_T2_Pve_spl = 
Spell.Pve_VoidZone_ThermalDamage_Missle_T2 = 
{
	in_editor			= false,
	aura				= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_range 			= 20,
	aura_param			= 1000,
	period				= 1,
	duration			= 10,
	--target				= ai.SpellTarget.CASTER_POSITION_CASTER,
	target = { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION }, --#62062
	aura_target			= ai.SpellTarget.ENEMY_AROUND,
	isBuff				= false,
	aura_sound			= "sound/aura/voidzone",
	
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},
}

Spell.Pve_VoidZone_ThermalDamage_Missle_T1 =
{
	inherit				= "Pve_VoidZone_ThermalDamage_Missle_T2", 
	aura_param			= 1000/2,
}

Spell.Pve_VoidZone_ThermalDamage_Missle_T4 =
{
	inherit				= "Pve_VoidZone_ThermalDamage_Missle_T2", 
	aura_param			= 1000*2.5,
}


--Способности боссов и чемпионов

-- спелл босса АОЕ дамаг
Spell.Boss_SmartBomb_T5 =
{
	aura_range 		= 1000,
	aura_param 		= 1500,
	period			= 1,
	duration 		= 7,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target 	= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	
	uiName = "Module_SmartBomb",
	uiDesc = "Module_SmartBomb_Desc",

	period_sound 		 = "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/pulsar/pulsar_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",

	wow_warning_msg = "EnemyPulsarActivate",
}

-- спелл босса АОЕ дамаг ДЛЯ Т4 КАРТЫ
Spell.Boss_BigSmartBomb_T5 =
{
	aura_range 		= 1000,
	aura_param 		= 4000,
	period			= 1,
	duration 		= 9,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target 	= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	

	period_sound 		 = "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/BossBigSmartBomb_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",

	wow_warning_msg = "EnemyPulsarActivate",
}

-- спелл капитана АОЕ дамаг
Spell.Captain_SmartBomb = 
{
	aura_range		= 150,
	aura_param		= 575.625,
	period			= 1,
	duration		= 8,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	
	
	period_sound 		 = "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/BossBigSmartBomb_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",
}

-- спелл командора т4 АОЕ дамаг
Spell.Commander_SmartBomb = 
{
	aura_range		= 150,
	aura_param		= 800,
	period			= 1,
	duration		= 8,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	
	
	period_sound 		 = "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/BossBigSmartBomb_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",
}

-- спелл командора т1 АОЕ дамаг
Spell.Commander_SmartBomb_Easy = 
{
	inherit			= "Commander_SmartBomb",
	aura_range		= 100,
	aura_param		= 100,
	duration		= 5,
}

-- спелл босса т1 АОЕ дамаг
Spell.Boss_SmartBomb_Easy = 
{
	inherit			= "Commander_SmartBomb",
	aura_range		= 100,
	aura_param		= 200,
	duration		= 5,
	wow_warning_msg = "EnemyPulsarActivate",
}

-- абилка понижающая резисты у таргета
Spell.TargetPainter_Boss_T5 = 
{
	target_range 	= 300,
	aura_param 		= 100,
	duration 		= 10,
	target 			= ai.SpellTarget.LOCKED_TARGET,
	aura 			= ai.Aura.RESIST_ALL_DEC,
	maintain_aura	= true,
	ui_ico = 
	{
		target_system 	= { tex = "ItemSubtype_TargetPainter", },
	},

}

-- АОЕ невидимость для чемпионов
Spell.Pve_StealthShip = 
{
	aura_range		= 300,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	aura_target			= {
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ALLY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
		--misc 			= ai.SpellTargetMisc.VISIBLE_BY_HOLDER,
		},
	trigger_aura	= true,
	isBuff			= true,
	target_range	= 300,
	
	ui_ico = 
	{
		target_system 	= { tex = "ItemSubtype_CloakingDevice", },
	},
}

-- AOE повышение резистов для чемпионов HARD
Spell.Pve_ShieldResist_All_Hard = 
{
	aura_range		= 300,
	aura_param		= 500,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.SHIELD_RESIST_ALL,
	aura_target		= ai.SpellTarget.ALLY_AROUND_EXCLUDE_HOLDER,
	trigger_aura	= true,
	
	ui_ico = 
	{
		target_system 	= { tex = "ItemSubtype_AdaptiveShieldBoost", },
	},
}

-- стелс для туториала
Spell.Cloaking_Tutorial = 
{
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.STEALTH,
	duration		= 60,
	isBuff			= true,
	uiName 			= "Special_CloakingDevice_Base",
	uiDesc 			= "Special_CloakingDevice_Base_Desc",
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_CloakingDevice", },
	},
}

-- шилд реген для туториала
Spell.ShieldRestoreMedium_Tutorial =
{

	aura_param  = 1000,
	duration 	= 8,
	period		= 1,
	target		= ai.SpellTarget.CASTER,
	aura		= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_target = ai.SpellTarget.HOLDER,
	isBuff		= true,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_ShieldRestoreMedium", },
	},
}

-- Периодически восстанавливает aura_param единиц здоровья CASUAL
Spell.Pve_HealHull_T5 = 
{
	inherit			= "Pve_HealHull",
	aura_param		= 100,
	period			= 1,
} 

Spell.Pve_HealHull_T4 = 
{
	inherit			= "Pve_HealHull",
	aura_param		= 80,
	period			= 1,
} 

Spell.Pve_HealHull_T3 = 
{
	inherit			= "Pve_HealHull",
	aura_param		= 60,
	period			= 1,
} 

Spell.Pve_HealHull_T2 = 
{
	inherit			= "Pve_HealHull",
	aura_param		= 40,
	period			= 1,
} 

Spell.Pve_HealShield_T5 = 
{
	inherit			= "Pve_HealShield",
	aura_param		= 100,
	period			= 1,
} 

Spell.Pve_HealShield_T4 = 
{
	inherit			= "Pve_HealShield",
	aura_param		= 80,
	period			= 1,
} 

Spell.Pve_HealShield_T3 = 
{
	inherit			= "Pve_HealShield",
	aura_param		= 60,
	period			= 1,
} 

Spell.Pve_HealShield_T2 = 
{
	inherit			= "Pve_HealShield",
	aura_param		= 40,
	period			= 1,
} 

Spell.Alien_Pulsar = 
{
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	duration 		= 12,
	period 			= 1,
	target 			= ai.SpellTarget.CASTER,
	isBuff 			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},

	aura_range		= 120,
	aura_param		= 1000,
} 

Spell.Alien_Pulsar_Low = 
{
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	duration 		= 12,
	period 			= 1,
	target 			= ai.SpellTarget.CASTER,
	isBuff 			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},

	aura_range		= 120,
	aura_param		= 500,
} 

Spell.Alien_Pulsar_Mob = 
{
	inherit 		= "Alien_Pulsar_Low", 
	aura_range		= 120,
	aura_param		= 400,
}
Spell.Alien_Pulsar_Mob_T3 = 
{
	inherit 		= "Alien_Pulsar_Low", 
	aura_range		= 150,
	aura_param		= 600,
}


Spell.Alien_Pulsar_PvE_T2 = 
{
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	duration 		= 12,
	period 			= 1,
	target 			= ai.SpellTarget.CASTER,
	isBuff 			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},

	aura_range		= 120,
	aura_param		= 1000,
} 

Spell.Alien_Pulsar_PvE_T4 = 
{
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	duration 		= 12,
	period 			= 1,
	target 			= ai.SpellTarget.CASTER,
	isBuff 			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},

	aura_range		= 120,
	aura_param		= 2000,
} 

-- Увеличивает скорость захвата маяков
Spell.Pve_Capture_Speed_Mod = 
{
	--aura_signature = ai.SignatureMask.SMALL,
	--aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- signature		= ai.SignatureMask.LARGE + ai.SignatureMask.MEDIUM + ai.SignatureMask.SMALL + ai.SignatureMask.TINY,--ai.SignatureMask.HUGE,
	aura_target = 
	{
		class          = ai.SpellTargetClass.SHIP,
		area           = ai.SpellTargetArea.AROUND,
		relationship   = ai.SpellTargetRelationship.ALLY,
		ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality       = ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.SMALL,
	},
	aura			= ai.Aura.CAPTURE_SPEED_MOD,
	isBuff			= true,
	aura_param		= 3.0, -- 7 #47101
	aura_range		= 5000,
	ui_ico =
	{
		target_system 	= { tex = "module_Capture_Speed_Mod_ico", },
	},
}

-- спелл босса АОЕ дамаг ДЛЯ Т4 КАРТЫ (теперь будет у мегабомб и сквозь препятсвия)
Spell.SmartBombFarSmall_Raid_Pve =
{
	aura_range 		= 5000,
	aura_param 		= 2500,
	period			= 0.7,
	duration 		= 3,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target 	= 
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.SMALL,--ai.SignatureMask.LARGE + ai.SignatureMask.MEDIUM + ai.SignatureMask.SMALL + ai.SignatureMask.TINY,--ai.SignatureMask.HUGE,
	},
	--aura_signature = ai.SignatureMask.SMALL,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	

	period_sound 		 = "sound/gadgets/pulsar/alien_pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/pulsar/alien_pulsar_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_alien_hit",
	period_my_fx		= "particles/gadget/pulsars/pulsar_alien_hit", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_alien_beam",

	--wow_warning_msg = "EnemyPulsarActivate",
}

Spell.SmartBombFarSmall_Raid_t4 =
{
	inherit				= "SmartBombFarSmall_Raid_Pve",
	aura_param 		= 500*3,
}

Spell.SmartBombFarMedium_Raid_Pve =
{
	inherit				= "SmartBombFarSmall_Raid_Pve",
	aura_param 		= 6000,
	aura_target 	= 
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.MEDIUM,
	},
--	aura_signature = ai.SignatureMask.MEDIUM,
}

Spell.SmartBombFarMedium_Raid_t4 =
{
	inherit				= "SmartBombFarSmall_Raid_Pve",
	aura_param 		= 1000*3,
	aura_target 	= 
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.MEDIUM,
	},
	--aura_signature = ai.SignatureMask.MEDIUM,
}

Spell.SmartBombFarLarge_Raid_Pve =
{
	inherit				= "SmartBombFarSmall_Raid_Pve",
	aura_param 		= 12000,
	--aura_signature = ai.SignatureMask.LARGE,
	aura_target 	= 
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.LARGE,
	},
}

Spell.SmartBombFarLarge_Raid_t4 =
{
	inherit				= "SmartBombFarSmall_Raid_Pve",
	aura_param 		= 2000*3,
	--aura_signature = ai.SignatureMask.LARGE,
	aura_target 	= 
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.LARGE,
	},
}

Spell.SmartBombFarHuge_Raid_Pve =
{
	inherit				= "SmartBombFarSmall_Raid_Pve",
	aura_param 		= 5000*5,
	--aura_signature = ai.SignatureMask.HUGE,
	aura_target 	= 
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.HUGE,
	},
}

Spell.SmartBombFarHuge_Raid_t4 =
{
	inherit				= "SmartBombFarSmall_Raid_Pve",
	aura_param 		= 5000*3,
	--aura_signature = ai.SignatureMask.HUGE,
	aura_target 	= 
	{
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
		signature		= ai.SignatureMask.HUGE,
	},
}


Spell.SmartBombFar_RW =
{
	aura_range 		= 5000,
	aura_param 		= 500,
	period			= 0.7,
	duration 		= 3,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target 	= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	--aura_signature = ai.SignatureMask.SMALL,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	

	period_sound 		 = "sound/gadgets/pulsar/alien_pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/pulsar/alien_pulsar_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_alien_hit",
	period_my_fx		= "particles/gadget/pulsars/pulsar_alien_hit", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_alien_beam",
}

Spell.SmartBombHole_RW =
{
	aura_range 		= 30,
	aura_param 		= 100500,
	period			= 0.5,
	duration 		= 3,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_KINETIC_PERIODIC,
	aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	

	period_sound 		 = "sound/gadgets/pulsar/alien_pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/pulsar/alien_pulsar_fire",
	--period_fx     		 = "particles/gadget/pulsar_alien_invertor_hit",
	--period_beam_fx 		 = "particles/gadget/pulsar_alien_beam",
}



Spell.SmartBombSlow1_RW = 
{
	aura_range		= 5000,
	aura_param		= 0.1,
	duration 		= 1,
	target 			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	isBuff			= false,	
	
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},

	aura_sound			= "sound/aura/voidzone",
}

Spell.SmartBombSlow2_RW = 
{
	inherit				= "SmartBombSlow1_RW",
	aura_param		= 0.2,
}

Spell.SmartBombSlow3_RW = 
{
	inherit				= "SmartBombSlow1_RW",
	aura_param		= 0.3,
}

Spell.SmartBombSlow4_RW = 
{
	inherit				= "SmartBombSlow1_RW",
	aura_param		= 0.4,
}

Spell.SmartBombSlow5_RW = 
{
	inherit				= "SmartBombSlow1_RW",
	aura_param		= 0.5,
}

Spell.SmartBombSlow6_RW = 
{
	inherit				= "SmartBombSlow1_RW",
	aura_param		= 0.6,
}

Spell.SmartBombSlow7_RW = 
{
	inherit				= "SmartBombSlow1_RW",
	aura_param		= 0.7,
}

Spell.SmartBombSlow8_RW = 
{
	inherit				= "SmartBombSlow1_RW",
	aura_param		= 0.8,
}

Spell.SmartBombSlow9_RW = 
{
	inherit				= "SmartBombSlow1_RW",
	aura_param		= 0.9,
}

Spell.SmartBombSlow10_RW = 
{
	inherit				= "SmartBombSlow1_RW",
	aura_param		= 1.0,
}



-- спелл босса АОЕ дамаг ДЛЯ Т4 КАРТЫ
Spell.SmartBombClose_Raid_Pve =
{
	aura_range 		= 150,
	aura_param 		= 20000,
	period			= 1,
	duration 		= 10,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target 	= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	

	period_sound 		 = "sound/gadgets/pulsar/alien_pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/pulsar/alien_pulsar_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_alien_hit",
	period_my_fx		= "particles/gadget/pulsars/pulsar_alien_hit", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_alien_beam",

	--wow_warning_msg = "EnemyPulsarActivate",
}

Spell.SmartBombClose_Raid_t4 =
{
	inherit			= "SmartBombClose_Raid_Pve",
	aura_range 		= 140,
	aura_param 		= 14000,
}

Spell.SmartBombClose_Raid_t3 =
{
	inherit			= "SmartBombClose_Raid_Pve",
	aura_range 		= 120,
	aura_param 		= 7000,
}

Spell.SmartBombClose_RW_T5 =
{
	aura_range 		= 70,	--120
	aura_param 		= 11000,	--x100
	period			= 1,
	duration 		= 10,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,	--_SCALED
	aura_target 	= ai.SpellTarget.ENEMY_SHIPS_AROUND,	--ENEMY_SHIPS_VISIBLE,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	

	period_sound 		 = "sound/gadgets/pulsar/alien_pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/pulsar/alien_pulsar_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_alien_hit",
	period_my_fx		= "particles/gadget/pulsars/pulsar_alien_hit", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_alien_beam",

	--wow_warning_msg = "EnemyPulsarActivate",
}

Spell.SmartBombClose_RW_T4 =
{
	inherit				= "SmartBombClose_RW_T5",
	aura_range 		= 60,
	aura_param 		= 6600,	--x100
}

Spell.SmartBombClose_RW_T3 =
{
	inherit				= "SmartBombClose_RW_T5",
	aura_range 		= 50,
	aura_param 		= 4000,	--x100
}


Spell.SmartBombBlackHole_RW_T3 =
{
	inherit				= "SmartBombClose_RW_T5",
	period			= 0.33,
	duration 		= 1,
	aura_range 		= 30,
	aura_param 		= 6000,	--x100
}

Spell.SmartBombBlackHole_RW_T4 =
{
	inherit				= "SmartBombClose_RW_T5",
	period			= 0.33,
	duration 		= 1,
	aura_range 		= 40,
	aura_param 		= 10000,	--x100
}

Spell.SmartBombBlackHole_RW_T5 =
{
	inherit				= "SmartBombClose_RW_T5",
	period			= 0.33,
	duration 		= 1,
	aura_range 		= 50,
	aura_param 		= 15000,	--x100
}

Spell.RW_BlackHole =
{
	aura_range 		= 2000,
	aura_param 		= 0,	--x100
	period			= 2,
	duration 		= 10,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_target 	= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	

	--period_sound 		 = "sound/gadgets/pulsar/alien_pulsar_period", --звук попадания, играется на цели
	--period_holder_sound	 = "sound/gadgets/pulsar/alien_pulsar_fire",
	aura_target_directed_fx			 = "particles/other/prec_black_hole_target_2",

	--wow_warning_msg = "EnemyPulsarActivate",
}


Spell.SmartBombShield_RW_T5 =
{
	aura_range 		= 5000,
	aura_param 		= 5000,	--x100
	period			= 1,
	duration 		= 1,
	target 			= ai.SpellTarget.CASTER,
	aura 			= ai.Aura.DAMAGE_KINETIC_SCALED,
	aura_target 	= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	

	period_sound 		 = "sound/gadgets/pulsar/alien_pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/pulsar/alien_pulsar_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_alien_hit",
	--period_beam_fx 		 = "particles/gadget/pulsars/pulsar_alien_beam",

	--wow_warning_msg = "EnemyPulsarActivate",
}

Spell.SmartBombShield_RW_T4 =
{
	inherit				= "SmartBombShield_RW_T5",
	aura_param 			= 3000,	--x100
}

Spell.SmartBombShield_RW_T3 =
{
	inherit				= "SmartBombShield_RW_T5",
	aura_param 			= 2000,	--x100
}


-- аура убивающая, запускаем после 20 минут жизни крейсера
Spell.SmartBombKill_Raid_Pve =
{
	inherit			= "SmartBombClose_Raid_Pve",
	aura_range 		= 10000,
	aura_param 		= 10000,
	duration 		= 1000,
	aura_target 	= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	itemDefName		= "ItemSubtype_Radiation_Beam",	--#78018 "Деструктор"

	wow_warning_msg = "pveRaid_CruiserEnrage",
}

-- аура убивающая, запускаем после 20 минут жизни крейсера
Spell.SmartBombKill_RW =
{
	inherit			= "SmartBombClose_Raid_Pve",
	aura_range 		= 10000,
	aura_param 		= 10000,
	duration 		= 1000,
	aura_target 	= ai.SpellTarget.ENEMY_SHIPS_AROUND,

	wow_warning_msg = "RW_CruiserEnrage",
}


-- spell voiddamage SpaceMissile_ThermalDamageZone_T2_Pve_spl = 
Spell.VoidZone_Raid_Pve = 
{
	in_editor			= false,
	aura				= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_range 			= 20,
	aura_param			= 14000,
	period				= 1,
	duration			= 10,
	--target				= ai.SpellTarget.CASTER_POSITION_CASTER,
	target = { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura_target 		= ai.SpellTarget.SHIPS_AROUND,
	isBuff            	= true,
	aura_sound			= "sound/aura/voidzone",
	aura_fx				= "particles/gadget/alien_voidzone",
	
	ui_ico =
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},
}

-- spell voiddamage SpaceMissile_ThermalDamageZone_T2_Pve_spl = 
Spell.VoidZone_RW = 
{
	in_editor			= false,
	aura				= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_range 			= 20,
	aura_param			= 300,
	period				= 1,
	duration			= 10,
	--target				= ai.SpellTarget.CASTER_POSITION_CASTER,
	target = { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura_target 		= ai.SpellTarget.SHIPS_AROUND,
	isBuff            	= true,
	aura_sound			= "sound/aura/voidzone",
	aura_fx				= "particles/gadget/alien_voidzone",
	
	ui_ico =
	{
		target_system 	= { tex = "spawn_warp_invulnerability_ico", },
	},
}

Spell.StunZone_Raid_W = 
{
	target			= ai.SpellTarget.SHIPS_AROUND,
	target_range	= 30,
	aura			= ai.Aura.STASIS,
	diminish_control_aura = true,
	duration		= 3,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_BlackoutGenerator", },
	},

	--aura_sound			= "sound/aura/voidzone",
	aura_sound			= "sound/aura/voidzone",
	aura_fx			= "particles/gadget/blackout_burst",
	
}


Spell.Clanship_HealHull_T3 = 
{
	aura_target		= ai.SpellTarget.ALLY_NPC,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	isBuff			= true,
	aura_param		= 1,
	aura_range		= 1500,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
} 

Spell.Clanship_HealShield_T3 = 
{
	aura_target		= ai.SpellTarget.ALLY_NPC,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	isBuff			= true,
	aura_param		= 1,
	aura_range		= 1500,
	period			= 0.2,
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_ShieldRestoreSmall", },
	},
} 

Spell.Clanship_Angar_T3 = 
{
	aura_range		= 300,
	aura_param		= 0.1,
	duration		= 100000,
	period			= 1,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_target		= ai.SpellTarget.ALLY_NPC,
	isBuff			= true,
	ui_ico 			= 
	{
		target_system = { tex = "ItemSubtype_CommandWeaknessAnalyzer", },
	},
}

Spell.Clanship_HealHull_T4 = 
{
	aura_target		= ai.SpellTarget.ALLY_NPC,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	isBuff			= true,
	aura_param		= 1,
	aura_range		= 1500,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
} 

Spell.Clanship_HealShield_T4 = 
{
	aura_target		= ai.SpellTarget.ALLY_NPC,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	isBuff			= true,
	aura_param		= 1,
	aura_range		= 1500,
	period			= 0.2,
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_ShieldRestoreSmall", },
	},
} 

Spell.Clanship_Angar_T4 = 
{
	aura_range		= 300,
	aura_param		= 0.2,
	duration		= 100000,
	period			= 1,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_target		= ai.SpellTarget.ALLY_NPC,
	isBuff			= true,
	ui_ico 			= 
	{
		target_system = { tex = "ItemSubtype_CommandWeaknessAnalyzer", },
	},
}

Spell.Clanship_HealHull_T5 = 
{
	aura_target		= ai.SpellTarget.ALLY_NPC,
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	isBuff			= true,
	aura_param		= 1,
	aura_range		= 1500,
	period			= 0.2,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
} 

Spell.Clanship_HealShield_T5 = 
{
	aura_target		= ai.SpellTarget.ALLY_NPC,
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	isBuff			= true,
	aura_param		= 1,
	aura_range		= 1500,
	period			= 0.2,
	ui_ico 			=
	{
		target_system 	= { tex = "ItemSubtype_ShieldRestoreSmall", },
	},
} 

Spell.Clanship_Angar_T5 = 
{
	aura_range		= 1500,
	aura_param		= 0.3,
	duration		= 100000,
	period			= 1,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_target		= ai.SpellTarget.ALLY_NPC,
	isBuff			= true,
	ui_ico 			= 
	{
		target_system = { tex = "ItemSubtype_CommandWeaknessAnalyzer", },
	},
}

Spell.Spell_CruiserTorpedo_RW =
{
	aura 			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target 	= ai.SpellTarget.SHIPS_AROUND,
	target 			= ai.SpellTarget.CASTER,

	aura_range		= 100,
	aura_param		= 200,
	period			= 1,
	isBuff			= false,
}
Spell.SphereBoss_SmartBomb = 
{
	aura_range		= 20,
	aura_param		= 800,
	period			= 1,
	duration		= 800,
	target			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	isBuff			= false,
	
	ui_ico = 
	{ 
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},
	
	
	period_sound 		 = "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	period_holder_sound	 = "sound/gadgets/BossBigSmartBomb_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",

}


-- бонусы от станций в волновом ПвЕ
Spell.Support_Bonus_Damage =
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.5,
	duration		= 10.0,
	isBuff			= true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico 			=
	{
		target_system 	= { tex = "sentinel_ico", },
	},
}


Spell.Support_Bonus_HealHull = 
{
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param 		= 100.0,
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


Spell.Support_Bonus_SpeedUp = 
{
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 0.5,
	duration        = 45,
	--period        		= 1,
	isBuff			= true,
	--aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_target 	= {
						area 			= ai.SpellTargetArea.AROUND,
						class 			= ai.SpellTargetClass.SHIP,
						relationship 	= ai.SpellTargetRelationship.ALLY,
					  },
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Afterburner", },
	},
}

Spell.Wave_Pve_StanceBonus = 
{
	aura_range		= 15000,
	--aura_param		= 0.3,
	duration		= 0,
	period			= 1,
	aura			= ai.Aura.DISABLE_HEAT,
	aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND,
	isBuff			= true,
	ui_ico 			= 
	{
		target_system = { tex = "ItemSubtype_CommandWeaknessAnalyzer", },
	},
}

Spell.Suicide_T1_Wave =
{
	inherit			= "Suicide_T1_Mk1",
	aura_range		= 50,
	aura_param		= 5,
	}
	
Spell.Suicide_T1_Wave_death =
{
	inherit			= "Suicide_T1_Mk1_death",	
	aura_param		= 5,
	}
	
Spell.Pve_Wave_Pulsar_T3 = 
{
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	duration 		= 12,
	period 			= 1,
	target 			= ai.SpellTarget.CASTER,
	isBuff 			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},

	aura_range		= 120,
	aura_param		= 600,
	
	period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",
		
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",	
} 

Spell.Pve_Wave_Pulsar_T5 = 
{
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	--aura_target 	= ai.SpellTarget.ENEMY_AROUND,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_VISIBLE_BY_HOLDER,
	duration 		= 12,
	period 			= 1,
	target 			= ai.SpellTarget.CASTER,
	isBuff 			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},

	aura_range		= 120,
	aura_param		= 1200,
	
	period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",
		
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",	
}

Spell.LMS_Pulsar = 
{
	aura 			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target		= ai.SpellTarget.SHIPS_OUTSIDE,
	duration 		= 360,
	period 			= 1,
	target 			= ai.SpellTarget.CASTER,
	isBuff 			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SmartBomb", },
	},

	aura_range		= 2000,
	aura_param		= 500,
	
	period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",
		
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2", 
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",	
}

-- Дебаф для эсминцев на ПвЕ используется в модуле Module_TargetPainter_Pve_Huge
Spell.Pve_Huge_Resist_Dec_30 = 
{
	target=
		{
			target         = ai.SpellTargetGeneral.LOCKED_TARGET,
			relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
			vitality       = ai.SpellTargetVitality.ALIVE,
			signature		= ai.SignatureMask.HUGE,
		},
	--aura_signature = ai.SignatureMask.HUGE,
	aura			= ai.Aura.RESIST_ALL_DEC,
	maintain_aura	= true,
	isBuff			= false,
	aura_param		= 30.0,
	duration 		= 10,
	aura_range		= 300,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_TargetPainter", },
	},
}

Spell.Pve_Huge_Resist_Dec_50 = 
{
	target=
		{
			target         = ai.SpellTargetGeneral.LOCKED_TARGET,
			relationship   = ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
			ai             = ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
			vitality       = ai.SpellTargetVitality.ALIVE,
			signature		= ai.SignatureMask.HUGE,
		},
	--aura_signature = ai.SignatureMask.HUGE,
	aura			= ai.Aura.RESIST_ALL_DEC,
	maintain_aura	= true,
	isBuff			= false,
	aura_param		= 50.0,
	duration 		= 10,
	aura_range		= 500,
	--ignore_subtype 	= true,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_TargetPainter", },
	},
}


---------------------------------------------------------------------------------
-- #0087956: ПВЕ. исследования
---------------------------------------------------------------------------------
Spell.Bonus_PVE_SpeedUp = 
{
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param 		= 0.5,
	duration		= 60,
	--period        		= 1,
	isBuff			= true,
	aura_target 	= {
						--ai.SpellTarget.ALLY_SHIPS_AROUND,
						area 			= ai.SpellTargetArea.AROUND,
						class 			= ai.SpellTargetClass.SHIP,
						relationship 	= ai.SpellTargetRelationship.ALLY,
					  },
	aura_range 		= 3000,
	cast_fx			= "particles/gadget/aura_wave",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Afterburner", },
	},
}
Spell.Bonus_PVE_Heal_S = 
{
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param 		= 1100,
	duration		= 5,
	period			= 1,
	isBuff			= true,
	--aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	--aura_range 		= 3000,
	--cast_fx			= "particles/gadget/aura_wave",
	aura_fx = "particles/gadget/matter_absorber",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
}
Spell.Bonus_PVE_Heal_All = 
{
	aura			= ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_param 		= 400,
	duration		= 20,
	period			= 1,
	isBuff			= true,
	target 			= ai.SpellTarget.ALLY_SHIPS_AROUND,
	target_range	= 300,
	--aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	--aura_range 		= 3000,
	--cast_fx			= "particles/gadget/aura_wave",
	aura_fx = "particles/gadget/matter_absorber",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
}
Spell.Bonus_PVE_Shield_S = 
{
	aura			= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	aura_param 		= 1300,
	duration		= 5,
	period			= 1,
	isBuff			= true,
	--aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	--aura_range 		= 3000,
	--cast_fx			= "particles/gadget/aura_wave",
	aura_fx 		= "particles/gadget/shield_boost",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
}
Spell.Bonus_PVE_Shield_All = 
{
	aura			= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	aura_param 		= 600,
	duration		= 20,
	period			= 1,
	isBuff			= true,
	target 			= ai.SpellTarget.ALLY_SHIPS_AROUND,
	target_range	= 300,
	--aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	--aura_range 		= 3000,
	--cast_fx			= "particles/gadget/aura_wave",
	aura_fx 		= "particles/gadget/shield_boost",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
}

Spell.CloakingDevice_Mob_T3 = 
{
	inherit 		= "Cloaking",
	dispell_flag	= ai.Dispell.ON_ROCKET + ai.Dispell.ON_MODULE + ai.Dispell.ON_COLLISION + ai.Dispell.ON_DAMAGE,
}


Spell.TachRay_Mob_T4_Deactivate = 
{
	inherit 		= "TachRay_T4_Mk1_Deactivate",
	aura_extra_radius= 8,
}


Spell.Chameleon_Mob_T3 =  
{
	inherit 		= "Chameleon_T3_Mk1",
	dispell_flag	= ai.Dispell.ON_ROCKET,
	duration		= 17,
}
Spell.Chameleon_Mob_T1 =  
{
	inherit 		= "Chameleon_T3_Mk1",
	dispell_flag	= ai.Dispell.ON_ROCKET,
	duration		= 8,
}


Spell.ShieldRay_Mob_T4 = 
{
	inherit 		= "ShieldRay_l_T4_Epic",
	aura_param		= 1200,
	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
}

Spell.InvulBox = {
	aura_range		= 200,
	period			= 1,
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura			= ai.Aura.INVULNERABILITY,
	aura_target		= ai.SpellTarget.ALLY_LESSER_SHIELD_HOLDER ,
	isBuff			= true,
	aura_holder_def	= "InvulBot",
	duration 		= 15,
}
-------------------------
Spell.PrimaryBuff_Mob = {
	target			= ai.SpellTarget.CASTER,
	isBuff			= true,
	aura			= ai.Aura.WEAPON_HIT_TRANSMIT_SPELL,  -- #76846
	target_spell	= "PrimaryBuff_Mob1",
	aura_target 	= ai.SpellTarget.HOLDER,
	duration		= 10,
	ui_ico = { target_system 	= { tex = "ItemSubtype_PrimaryNanoRobots", }, },
}
Spell.PrimaryBuff_Mob1 =
{
	target			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura_target = 
			{
				class				= ai.SpellTargetClass.SHIP,
				relationship		= ai.SpellTargetRelationship.ENEMY,
				area				= ai.SpellTargetArea.AROUND,
			},	
	aura_range		= 22,
	isBuff			= false,
	aura  			= ai.Aura.DAMAGE_KINETIC_PERIODIC,  -- ai.Aura.HEAL_HULL_PERIODIC,? 
	aura_param		= 444,
	duration		= 6,
	period			= 1,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PrimaryNanoRobots", },
	},
	aura_fx		= "particles/gadget/damage_thermal"
}
-------------
Spell.CommandDamage_Mob =
{
	isBuff			= true,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.25,
	target 			= ai.SpellTarget.CASTER,
	--aura_target 	= ai.SpellTarget.HOLDER,
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura_range		= 200,
	max_stacks		= 8,
	duration 		= 60,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}


Spell.SeeInvisible_Mob = {
	aura			= ai.Aura.SPY_DRONE,
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	aura_range		= 400,
	isBuff			= false,
	duration 		= 30,
	ui_ico = { target_system 	= { tex = "ItemSubtype_SpyBeacon", }, },
}


Spell.JumpBanBox_Mob = {
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura			= ai.Aura.DISABLE_WARP,
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	aura_range		= 400,
	isBuff			= false,
	aura_holder_def	= "JumpBanBox",
	duration 		= 30,
}

Spell.BoostBanBox_Mob = {
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura			= ai.Aura.DISABLE_BOOST,
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	aura_range		= 400,
	isBuff			= false,
	aura_holder_def	= "BoostBanBox",
	duration 		= 30,
}

Spell.PredatorTrap =
{
	target =
	{
		--target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		area 			= ai.SpellTargetArea.AROUND,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc 			= ai.SpellTargetMisc.POSITION,
	},
	target_range		= 500,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	isBuff				= false,
	aura 				= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_param			= 550,  -- у пушки дпс 410,  дпс от всего корабля 1640 . дпс от облака 800
	duration			= 15,
	period				= 0.5,
	aura_range 			= 17,
	additional_auras = 
	{
		{
			aura_execution_delay = 5,
			aura 			= ai.Aura.SLOW_MOVEMENT,
			--aura_target		= ai.SpellTarget.ENEMY_AROUND, 
			aura_target		= ai.SpellTarget.SHIPS_AROUND,
			aura_range 		= 17,
			aura_param		= 49,
			isBuff			= false,
			duration		= 10,
			--diminish_control_aura = false,
			ui_ico = {
				target_system = { tex = "ItemSubtype_EngineHack", },
			},
			--nebula 			= "Effects_Nebula_GreenSphere",
			aura_fx = "particles/gadget/speed_adaptation",
		},
	},

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_EngineHack", },
	},

	aura_fx = "particles/gadget/damage_emp_plasma",
}


Spell.Executor =
{
	target =
	{
		--target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		area 			= ai.SpellTargetArea.AROUND,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc 			= ai.SpellTargetMisc.POSITION,
	},
	target_range		= 500,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	isBuff				= false,
	aura 				= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_param			= 550,  -- у пушки дпс 410,  дпс от всего корабля 1640 . дпс от облака 800
	aura_param_add		= 110,
	duration			= 15,
	period				= 0.5,
	aura_range 			= 10,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RadiationCloud", },
	},

	--aura_fx = "particles/gadget/damage_emp_plasma",
	aura_fx = "particles/jumpgates/allidium_energy_sphere",
}

Spell.MassRemotePulsar =
{
	target =
	{
		--target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
		area 			= ai.SpellTargetArea.AROUND,
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc 			= ai.SpellTargetMisc.POSITION,
	},
	target_range		= 650,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	isBuff				= false,
	aura 				= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_param			= 300,  -- у пушки дпс 410,  дпс от всего корабля 1640 . дпс от облака 800
	aura_param_add		= 175,
	duration			= 15,
	period				= 0.5,
	aura_range 			= 100,

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RadiationCloud", },
	},

	aura_fx = "particles/weapons/big/plasma_orb",
	period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
	--period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2",
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",
}

Spell.TeleportToKill =   -- телепорт
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
	teleport_offset_dir = Vec3( 0, 0, -1 ),
	teleport_range		= 400,
	influence 			= ai.Spell.TELEPORT_TO_TARGET,
	teleport_offset		= 75,
	cast_sound 			= "sound/gadgets/ReverseThruster_activate",
	in_fx 				= "particles/gadget/teleport",
	out_fx 				= "particles/gadget/teleport",
}


Spell.TractorBeam_Mob_T3 = 
{
	inherit 		= "TractorBeam_T3_Mk1",
	duration		= 12,
	aura_param		= 28,
}

 
 
Spell.RepairDrones_Mob_l = 
{
	inherit 		= "RepairDrones_l_T3_Mk1",
	aura_param		= 5500,
}

Spell.TractorBeam_Mob_T5 = 
{
	inherit 		= "TractorBeam_T3_Mk1",
	aura_range		= 750,
	target_range	= 750,
	duration		= 12,
	aura_param		= 40,
}


Spell.Bonus_PVE_Damage_Self = 
{
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.1,
	max_stacks		= 5,
	duration		= 300,
	--period			= 1,
	isBuff			= true,
	--aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	--aura_range 		= 3000,
	--cast_fx			= "particles/gadget/aura_wave",
	--aura_fx 		= "particles/gadget/shield_boost",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairDronesSmall", },
	},
}

--aura_fx 		= "particles/gadget/shield_boost",

Spell.Afterburner_PVE = 
{
	inherit = "Afterburner_T5_Epic",
	aura_param = 2,
}

----------------------------------------
--Пассивки-ауры на боссов
Spell.BossPassive_ShieldResThermal =
{
	isBuff			= true,
	aura			= ai.Aura.SHIELD_RESIST_THERMAL,
	aura_param		= 100,
	target 			= ai.SpellTarget.CASTER,
	--target 			= ai.SpellTarget.CASTER,
	--aura_target 	= ai.SpellTarget.HOLDER,
	--aura_target		= ai.SpellTarget.ALLY_AROUND,
	--aura_range		= 200,
	--max_stacks		= 8,
	--duration 		= 60,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
Spell.BossPassive_ShieldResEMP =
{
	isBuff			= true,
	aura			= ai.Aura.SHIELD_RESIST_EMP,
	aura_param		= 100,
	target 			= ai.SpellTarget.CASTER,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
Spell.BossPassive_ShieldResKinetic =
{
	isBuff			= true,
	aura			= ai.Aura.SHIELD_RESIST_KINETIC,
	aura_param		= 100,
	target 			= ai.SpellTarget.CASTER,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
Spell.BossPassive_HullResAll =
{
	isBuff			= true,
	aura			= ai.Aura.HULL_RESIST_ALL,
	aura_param		= 50,
	target 			= ai.SpellTarget.CASTER,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
Spell.BossPassive_Speed =
{
	isBuff			= true,
	aura			= ai.Aura.FAST_MOVEMENT,
	aura_param		= 1,
	target 			= ai.SpellTarget.CASTER,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
Spell.BossPassive_AddsHullResist =
{
	isBuff			= true,
	aura			= ai.Aura.HULL_RESIST_ALL,
	aura_param		= 100,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND_EXCLUDE_HOLDER,
	aura_range		= 250,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}

Spell.BossPassive_ShieldVampire ={
	isBuff			= true,
	target 			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.CAST_SPELL_PERIODIC,
	period 			= 25,
	target_spell	= "BossPassive_ShieldVampire1",
	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}

Spell.BossPassive_ShieldVampire1 =
{
	--target 			= ai.SpellTarget.CASTER,	
	target		= 	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NOT_CLOAKED + ai.SpellTargetMisc.RANDOM,	 --
	},
	target_range	= 300,
	--aura_range		= 250,
	aura			= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
	aura_param		= 3500,
	duration		= 3,
	period			= 1,
	isBuff			= false,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
--
Spell.BossPassive_PrimaryDamage =
{
	isBuff			= true,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.5,
	target 			= ai.SpellTarget.CASTER,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
Spell.BossPassive_ModuleCooldown =
{
	isBuff			= true,
	aura			= ai.Aura.COOLDOWN_MOD,
	aura_param		= -0.75,
	target 			= ai.SpellTarget.CASTER,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
Spell.BossPassive_AddsPrimaryDamage =
{
	isBuff			= true,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 1,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND_EXCLUDE_HOLDER,
	aura_range		= 250,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
Spell.BossPassive_AddsModuleCooldown = 
{
	isBuff			= true,
	aura			= ai.Aura.COOLDOWN_MOD,
	aura_param		= -0.75,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND_EXCLUDE_HOLDER,
	aura_range		= 250,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}

-------------
-- Урон по всем вокруг (постоянный пассивный пульсар)
Spell.BossPassive_TempPulsar ={
	isBuff			= true,
	target 			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.CAST_SPELL_PERIODIC,
	period 			= 20,
	target_spell	= "BossPassive_TempPulsar1",
	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}

Spell.BossPassive_TempPulsar1 =
{
	--target 			= ai.SpellTarget.CASTER,	
	aura_target		= 	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NOT_CLOAKED,	 --
	},
	--target_range	= 250,
	aura_range		= 250,
	aura			= ai.Aura.SHIELD_VAMPIRE_PERIODIC,
	aura_param		= 1000,
	duration		= 5,
	period			= 0.5,
	isBuff			= false,
	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
----------------------------------------------
--Войд зона под случайным видимым врагом (очень сильный)
Spell.BossPassive_HardAvoid ={
	isBuff			= true,
	target 			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.CAST_SPELL_PERIODIC,
	period 			= 30,
	target_spell	= "BossPassive_HardAvoid1",
	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}

Spell.BossPassive_HardAvoid1 =
{
	target 			= {
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NOT_CLOAKED + ai.SpellTargetMisc.LESSER_SHIELD,	 --
	},
 	aura_target		= 	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		--misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NOT_CLOAKED,	 --
	}, 
	target_range	= 250,
	aura_range		= 22,
	aura			= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_param		= 5000,
	duration		= 3,
	period			= 0.5,
	isBuff			= false,
	aura_fx			= "particles/gadget/suicide_aura",
	aura_sound 		= "sound/aura/voidzone",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
----------------------------------------------
--Войд зона под случайным видимым врагом (очень сильный)
Spell.BossPassive_HealOnDeath ={
	isBuff			= true,
	target 			= ai.SpellTarget.CASTER,
	aura			= ai.Aura.SPELL_ON_DEATH_SOMEONE,
	trigger_target 		=  -- таблица таргет
		{
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			area 			= ai.SpellTargetArea.AROUND,
			vitality 		= ai.SpellTargetVitality.DEAD,
		},
	trigger_range 		= 350, -- расстояние
	target_spell	= "BossPassive_HealOnDeath1",
	period_beam_fx 	= "particles/gadget/pulsars/pulsar_beam",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}

Spell.BossPassive_HealOnDeath1 =
{
	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 200000,
	duration		= 1,
	period			= 0.5,
	isBuff			= true,
	--aura_fx			= "particles/gadget/suicide_aura",
	--aura_sound 		= "sound/aura/voidzone",
	aura_fx 		= "particles/gadget/matter_absorber",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}



--[[ Spell.BossPassive_dynamic_AllBodyResist =
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 85,
	target 			= ai.SpellTarget.CASTER,
--	aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам
	--aura_range		= 350,
	max_stacks		= 20,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras = 
		{{
		isBuff			= true,
		gameplay_specific = true,
		aura			= ai.Aura.DAMAGE_MOD,
		aura_param		= 0.025,
--		aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам 
--		aura_range		= 250,
		max_stacks		= 20,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},},
}
Spell.BossPassive_dynamic_AllDamageMod =
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.15,
	target 			= ai.SpellTarget.CASTER,
	--aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND,
	--aura_range		= 250,
	max_stacks		= 20,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
} ]]

Spell.BossPassive_dynamic_AllBodyResist =  -- для геймплея один против всех и для босса в ОМ
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.HEALTH_MOD,
	aura_param		= 0.85,
	target 			= ai.SpellTarget.CASTER,
--	aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам
	--aura_range		= 350,
	max_stacks		= 20,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras = {
		{
			isBuff			= true,
			gameplay_specific = true,
			aura			= ai.Aura.INHERITED_HEALTH_MOD,
			aura_param		= 0.85,
	--		aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам 
	--		aura_range		= 250,
			max_stacks		= 20,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
		{
			isBuff			= true,
			gameplay_specific = true,
			aura			= ai.Aura.SHIELD_MOD,
			aura_param		= 0.85,
	--		aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам 
	--		aura_range		= 250,
			max_stacks		= 20,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
		{
			isBuff			= true,
			gameplay_specific = true,
			aura			= ai.Aura.DAMAGE_MOD,
			aura_param		= 0.1,
	--		aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам 
	--		aura_range		= 250,
			max_stacks		= 20,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
	},
}
Spell.BossPassive_dynamic_AllDamageMod =
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.MODULE_DAMAGE_MOD,
	aura_param		= 0.05,
	target 			= ai.SpellTarget.CASTER,
	--aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND,
	--aura_range		= 250,
	max_stacks		= 20,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}


Spell.PvE_Waves_Passive_dynamic_AllBodyResist =
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 80,
	target 			= ai.SpellTarget.CASTER,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 25000,
	max_stacks		= 300,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras = 
		{{
		isBuff			= true,
		gameplay_specific = true,
		aura			= ai.Aura.DAMAGE_MOD,
		aura_param		= 0.30,
		aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
		{ 
			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
		aura_range		= 25000,
		max_stacks		= 300,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},},
}
Spell.PvE_Waves_Passive_dynamic_AllBodyResist_x10 =
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 800,
	target 			= ai.SpellTarget.CASTER,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 25000,
	max_stacks		= 300,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras = 
		{{
		isBuff			= true,
		gameplay_specific = true,
		aura			= ai.Aura.DAMAGE_MOD,
		aura_param		= 3.00,
		aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
		{ 
			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
		aura_range		= 25000,
		max_stacks		= 300,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},},
}
Spell.PvE_Waves_Passive_dynamic_AllBodyResist_x100 =
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.RESIST_ALL,
	aura_param		= 8000,
	target 			= ai.SpellTarget.CASTER,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 25000,
	max_stacks		= 300,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras = 
		{{
		isBuff			= true,
		gameplay_specific = true,
		aura			= ai.Aura.DAMAGE_MOD,
		aura_param		= 30,
		aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
		{ 
			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
		aura_range		= 25000,
		max_stacks		= 300,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},},
}

Spell.PvE_Waves_Passive_AllBodyResistDebuff =
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param 		= 0.5,
	isBuff			= true,
	gameplay_specific = true,
	aura_target 	= ai.SpellTarget.ALLY_SHIPS_AROUND,
	aura_range 		= 30000,
	cast_fx			= "particles/gadget/aura_wave",
	max_stacks		= 20,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}

Spell.PvE_Waves_Passive_dynamic_AllDamageMod =
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.25,
	target 			= ai.SpellTarget.CASTER,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura_range		= 25000,
	max_stacks		= 20,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}

---------------------
-- для гонок 
Spell.RiderLooserBuff =
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.FAST_MOVEMENT,	
	aura_param		= 0.2, --0.075
	max_stacks		= 6,
	duration 		= 5,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
Spell.RiderWinnerDebuff =
{
	isBuff			= false,
	gameplay_specific = true,
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target =
	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ENEMY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NEAREST,
	},
	aura_range		= 175,
	aura_param		= 20,
	period 			= 1,
	duration	 	= 10,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
}
-------------


Spell.RamCharge_Self_PvE = 
{
	aura 				= ai.Aura.COLLISION_IMMUNE, --    меньшает урон от пуль и лазеров в зависимости от расстояния до атакующего по следующей формуле: 
	target				= ai.SpellTarget.CASTER,    
	--aura_target 		= ai.SpellTarget.SHIPS_AROUND,
	aura_range			= 1000000,
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	--aura_param			= 600, --свыше 600 =0.25  до 600/4=150=1 ---GetClamped( 1.0f + 0.25 - distance / aura_param, 0.25f, 1.0f ).  
	--duration			= 600000000000,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_RamCharge", }, },
    hud_visible = false,
}

Spell.Shield_Resist_Thermal_Self_PvE = 
{
	aura 				= ai.Aura.SHIELD_RESIST_THERMAL, --    меньшает урон от пуль и лазеров в зависимости от расстояния до атакующего по следующей формуле: 
	target				= ai.SpellTarget.CASTER,    
	--aura_target 		= ai.SpellTarget.SHIPS_AROUND,
	aura_range			= 1000000,
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura_param			= 6000, --свыше 600 =0.25  до 600/4=150=1 ---GetClamped( 1.0f + 0.25 - distance / aura_param, 0.25f, 1.0f ).  
	--duration			= 600000000000,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_RamCharge", }, },
    hud_visible = false,
}

Spell.Hull_Resist_Thermal_Self_PvE = 
{
	aura 				= ai.Aura.HULL_RESIST_THERMAL, --    меньшает урон от пуль и лазеров в зависимости от расстояния до атакующего по следующей формуле: 
	target				= ai.SpellTarget.CASTER,    
	--aura_target 		= ai.SpellTarget.SHIPS_AROUND,
	aura_range			= 1000000,
	aura_target		= ai.SpellTarget.ALLY_AROUND,
	aura_param			= 6000, --свыше 600 =0.25  до 600/4=150=1 ---GetClamped( 1.0f + 0.25 - distance / aura_param, 0.25f, 1.0f ).  
	--duration			= 600000000000,
	--ignore_subtype	= true,
	--ignore_stacks	= true,
	isBuff				= true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_RamCharge", }, },
    hud_visible = false,
}

Spell.Stop =
{
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param 		= 100,
	duration		= 3.0,
	gameplay_specific = true,
	hud_visible 	= false,	
}
Spell.PermanentSlow =
{
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param 		= 0.15,
	--duration		= 3.0,
	gameplay_specific = true,
	hud_visible 	= false,
}

Spell.AsteroidExplosion =  --
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target		= ai.SpellTarget.SHIPS_AROUND,
	aura_range		= 75,
	aura_param		= 10000, --12000
	period			= 0.2,
	duration		= 0.4,
	isBuff			= false,
	aura_fx 		= "particles/explosions/shp_exp_big_02",
	--cast_fx 		= "particles/explosions/shp_exp_mid_02",
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},	
}

Spell.BuffAlienByBase30 = 
{
	isBuff			= true,
	gameplay_specific = true,

	target			= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target = 
		{
			class				= ai.SpellTargetClass.SHIP,
			ai 					= ai.SpellTargetAi.NPC,
			area				= ai.SpellTargetArea.AROUND,
		},
	aura_range		= 3000,
	duration	 	= 60 * 5,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },

	aura			= ai.Aura.HEALTH_MOD,
	aura_param		= 0.3,
	additional_auras = {
		{
			isBuff			= true,
			gameplay_specific = true,
			aura			= ai.Aura.INHERITED_HEALTH_MOD,
			aura_param		= 0.3,
			aura_target =
				{
					class				= ai.SpellTargetClass.SHIP,
					ai 					= ai.SpellTargetAi.NPC,
					area				= ai.SpellTargetArea.AROUND,
				},
			aura_range		= 3000,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
		{
			isBuff			= true,
			gameplay_specific = true,
			aura			= ai.Aura.SHIELD_MOD,
			aura_target =
				{
					class				= ai.SpellTargetClass.SHIP,
					ai 					= ai.SpellTargetAi.NPC,
					area				= ai.SpellTargetArea.AROUND,
				},
			aura_range		= 3000,
			aura_param		= 0.3,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
		{
			isBuff			= true,
			gameplay_specific = true,
			aura			= ai.Aura.DAMAGE_MOD,
			aura_target =
				{
					class				= ai.SpellTargetClass.SHIP,
					ai 					= ai.SpellTargetAi.NPC,
					area				= ai.SpellTargetArea.AROUND,
				},
			aura_range		= 3000,
			aura_param		= 0.3,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
	},
}
Spell.BuffAlienByBase100 = 
{
	inherit = "BuffAlienByBase30",
	aura_param = 1,
	additional_auras = 
		{
			{
				aura_param = 1,
			},
			{
				aura_param = 1,
			},
			{
				aura_param = 1,
			},
		},
}
Spell.BuffAlienByBase200 = 
{
	inherit = "BuffAlienByBase30",
	aura_param = 2,
	additional_auras = 
		{
			{
				aura_param = 2,
			},
			{
				aura_param = 2,
			},
			{
				aura_param = 2,
			},
		},
}
Spell.BuffAlienByBase400 = 
{
	inherit = "BuffAlienByBase30",
	aura_param = 3,
	additional_auras = 
		{
			{
				aura_param = 3,
			},
			{
				aura_param = 3,
			},
			{
				aura_param = 4,
			},
		},
}

Spell.PvE_Waves_HackWeapon =
{
	target 			= ai.SpellTarget.CASTER,
	target_range	= 35000,
	aura_range		= 25000,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura 			= ai.Aura.HACKED_WEAPON,
	diminish_control_aura = true,
	duration		= 6,
	--aura_param 		= 550,
	--period			= 1,
	isBuff			= false,
	ui_ico 			= { target_system = { tex = "ItemSubtype_HackWeapon", }, },
	additional_auras = {
		{
		target 			= ai.SpellTarget.CASTER,
		aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
		{ 
			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
		aura_range		= 25000,
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

Spell.PvE_Waves_SlowManeuver =
{
	influence 		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,

	target_range	= 35000,
	aura_range		= 25000,
	aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
	{ 
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
	},
	aura 			= ai.Aura.SLOW_MANEUVER,
	diminish_control_aura = true,
	duration		= 6,
	aura_param		= 5,
	--duration		= 50,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GuidedDron", },
	},
	use_dead_rcs_effects = true,
	additional_auras = {
		{
		target 			= ai.SpellTarget.CASTER,
		aura_target 		= 	--ai.SpellTarget.ENEMY_AROUND,
		{ 
			class			= ai.SpellTargetClass.SHIP,
			area			= ai.SpellTargetArea.AROUND,
			relationship	= ai.SpellTargetRelationship.ENEMY,-- + ai.SpellTargetRelationship.NEUTRAL,
		},
		aura_range		= 25000,
		aura 			= ai.Aura.SLOW_MOVEMENT,
		duration		= 6,
		aura_param		= 5, 
		--period			= 1,
		isBuff			= false,
		gameplay_specific = true,
		ui_ico 			= { target_system = { tex = "ItemSubtype_HackWeapon", }, },
		}, 
	}
}

Spell.DestrMunition_HealBot_Boss_spl = {
	inherit 		= "DestrHealStation",
	aura_param 		= 5000,
}

-- Test  anti HUGE
Spell.TestAntiHUGE =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'TestAntiHUGE1', 'TestAntiHUGE2', 'TestAntiHUGE3' }
}
Spell.TestAntiHUGE1 = 
{
	duration		= 1,
	period			= 1,

	isBuff 			= false,

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY,
		signature	= ai.SignatureMask.HUGE,
	},
	aura_target 	=  ai.SpellTarget.CASTER,
	

	aura			= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param		= 500000,

	aura_fx 		= "particles/gadget/damage_thermal",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Javelin", },
	},

	aura_sound 		= "sound/weapons/laser/basic",
	---
}
-- планировали уничтожение модулей но нет функционала
Spell.TestAntiHUGE2 = 
{
	duration		= 20,
	period			= 0.5,

	isBuff 			= false,

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY,
		signature	= ai.SignatureMask.HUGE,
	},
	aura_target 	=  ai.SpellTarget.HOLDER,
		--class = ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE 
--[[ 	aura_target 	= 
	{
		class			= ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE  + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		ai				= ai.SpellTargetAi.PLAYERS + ai.SpellTargetAi.BOTS + ai.SpellTargetAi.NPC,
		vitality		= ai.SpellTargetVitality.ALIVE,
		--signature		= ai.SignatureMask.TINY,
	}, 
	aura_range		= 100,]]

	aura			= ai.Aura.BURN_ENERGY,
	aura_param		= 3000,

	--aura_fx 		= "particles/gadget/damage_thermal",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Javelin", },
	},

	--aura_sound 		= "sound/weapons/laser/basic",
	---
}
Spell.TestAntiHUGE3 = 
{
	duration		= 1,
	period			= 0.5,

	isBuff 			= false,

	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY,
		signature	= ai.SignatureMask.HUGE,
	},
	aura_target 	= ai.SpellTarget.HOLDER,

	aura			= ai.Aura.DAMAGE_KINETIC_PERIODIC,
	aura_param		= 50000,

	--aura_fx 		= "particles/gadget/damage_thermal",

	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_Javelin", },
	},
}

Spell.BossEventWeapon_ElectricPotentialShift =
{
	influence=ai.Spell.CAST_SPELLS,
	spells= { 'BossEventWeapon_ElectricPotentialDamage', 'BossEventWeapon_ElectricPotentialEnergy' }
}


Spell.BossEventWeapon_ElectricPotentialDamage = 
{
	inherit				="ElectricPotentialShift",
	
	target =
	{
		target = ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship = ai.SpellTargetRelationship.ENEMY,
		misc = ai.SpellTargetMisc.VISIBLE_BY_CASTER
	},
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		vitality		= ai.SpellTargetVitality.ALIVE,
		misc			= ai.SpellTargetMisc.EXCLUDE_HOLDER,
	},
	duration		= 10,
	period			= 1,
	aura_param		= 1000,
	aura_range		= 200,
}

Spell.BossEventWeapon_ElectricPotentialEnergy = 
{
	inherit				="ElectricPotentialShift",
	
	target =
	{
		target 			= ai.SpellTargetGeneral.CONTEXT_TARGET,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		misc 			= ai.SpellTargetMisc.VISIBLE_BY_CASTER,
		signature		= ai.SignatureMask.HUGE,
	},
	aura_target		=
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship 	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
		vitality		= ai.SpellTargetVitality.ALIVE,
	},
	aura			= ai.Aura.BURN_ENERGY_PERIODIC,
	duration		= 10,
	period			= 0.2,
	aura_param		= 250,
	aura_range		= 200,
}


-- если рядом с носителем ауры нет врагов - он ловко себя хилит.  против соло снайперов
Spell.BossEvadeHeal =
{
	target			= ai.SpellTarget.CASTER,
	aura_target 	= { target = ai.SpellTargetGeneral.HOLDER, },
	mod_range		= 610,
	mod_target		=
			{
				class			= ai.SpellTargetClass.SHIP,
				area			= ai.SpellTargetArea.AROUND,
				relationship	= ai.SpellTargetRelationship.ENEMY,
				misc			= ai.SpellTargetMisc.NOT_CLOAKED,
			},
	--smod_max			= 1,
	aura_param_stages	= { 2, 1, 0, 0, 0, 0, 0, 0, 0, 0 }, --  первый элемент = 0 целей/  второй элемент одна цель
	aura			= ai.Aura.HEAL_SHIELD_PERIODIC,
	aura_param		= 10000,
	--duration		= 2,
	period			= 1,
	mod_update_period = 2,
	
	isBuff			= true,
	--ignore_stacks	= true,
	--ignore_subtype	= true,
	gameplay_specific= true,
	--spell_on_cancel = "BossEvadeHeal",
	--hud_visible 	= false, -- прячем от игрока
	disable_aura_duration = true, -- не показывать таймер на ауре и текст обновления ауры
	--disable_zero_stage = true, -- не показывать значок ауры если у ауры stage = 0
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_FocusedScaner" } },
}
Spell.BossSlowImmune =
{
	aura			= ai.Aura.SLOW_IMMUNE,
--	aura_param 		= 100,
--	duration		= 3.0,
	gameplay_specific = true,
	--hud_visible 	= false,	
}

Spell.BossTempDebuffImmune =
{
	aura			= ai.Aura.DEBUFF_IMMUNE,
--	aura_param 		= 100,
	duration		= 3.0,
	gameplay_specific = true,
	aura_fx 		= "particles/gadget/invulnerability",
	--hud_visible 	= false,	
}

Spell.BossEvent_OnDeathEnemy = {
	target 				= ai.SpellTarget.CASTER,
	isBuff				= true,
	duration 			= 8,
	aura 				= ai.Aura.SPELL_ON_DEATH_SOMEONE,
	--в ауре пишем дополниельно:
	trigger_target 		=  -- таблица таргет
		{
			class 			= ai.SpellTargetClass.SHIP,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			area 			= ai.SpellTargetArea.AROUND,
			vitality 		= ai.SpellTargetVitality.DEAD,
		},
	trigger_range 		= 700, -- расстояние
	target_spell 		= "BossEvent_OnDeathEnemy_Heal", -- спелл который накладывается, если кто то умер
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenTimeBoost", },
	},
	aura_fx = "particles/gadget/hull_heal",
}

Spell.BossEvent_OnDeathEnemy_Heal = {
	duration			= 4,  
	period				= 0.5,
	target 				= ai.SpellTarget.CASTER,
	aura				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param			= 50000,   -- 1 800 000 ehp было     900 000, но длиннее сделал
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenTimeBoost", },
	},
	aura_fx = "particles/gadget/hull_heal",
}

-- те кто стреляют с 4.5+ км наносят лишь 25% урона, то кто с 4.5/4 и менее = 100%, между этим линейно
Spell.BossEvent_RangeDefence = 
{
	inherit				= "FocusedDefence", 
	aura_param			= 450,  --DAMAGE_REDUCE_WITH_DISTANCE  GetClamped( 1.0f + 0.25 - distance / aura_param, 0.25f, 1.0f ). 
}

-- баффаем босса от того на сколько левелов прокачана пиратская станция
--+ урон  50
--+ сила модулей  35
--+ немного ресиста 150
Spell.BossEvent_BuffByBossStation =  -- 0-5 стаков
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.1, --0.075
	max_stacks		= 5,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras = {
		{
		aura 			= ai.Aura.MODULE_DAMAGE_MOD,
		aura_param		= 0.07, 
		isBuff			= true,
		gameplay_specific = true,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		}, 
		{
		aura 			= ai.Aura.RESIST_ALL,
		aura_param		= 30, 
		isBuff			= true,
		gameplay_specific = true,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
	},
}
-- баффаем игроков от того, на сколько левелов прокачана имперская станция в эвенте
--+ урон 40
--+ сила модулей 40
--+ ресист 150
Spell.OwnerStation_BuffPlayersByLevel =  -- 0-5 стаков
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.DAMAGE_MOD,
	aura_param		= 0.08, --0.075
	max_stacks		= 5,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras = {
		{
		aura 			= ai.Aura.MODULE_DAMAGE_MOD,
		aura_param		= 0.08, 
		max_stacks		= 5,
		isBuff			= true,
		gameplay_specific = true,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		}, 
		{
		aura 			= ai.Aura.RESIST_ALL,
		aura_param		= 30, 
		max_stacks		= 5,
		isBuff			= true,
		gameplay_specific = true,
		ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
	},
}

Spell.VitalPoint_CyberDie =  --
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target		= ai.SpellTarget.SHIPS_AROUND,
	aura_range		= 300,
	aura_param		= 100, --12000
	period			= 1,
	duration		= 4,
	isBuff			= false,
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},	
	cast_position_fx = "particles/explosions/objects/alien_sphere_mid_explosion",
}
Spell.CyberAnomaly =  
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target		= ai.SpellTarget.ENEMY_AROUND,
	aura_range		= 275,
	aura_param		= 3000, --12000
	period			= 0.5,
	--duration		= 0.4,
	isBuff			= false,
	aura_fx 		= "particles/objects/alien_anomaly",
	--nebula = "Effects_AlienAnomaly",
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},	
}
Spell.CyberAnomalyFatal =  
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target		= ai.SpellTarget.ENEMY_SHIPS_AROUND,
	aura_range		= 1500,
	aura_param		= 5000, --12000
	period			= 1,
	duration		= 10,
	isBuff			= false,
	aura_fx 		= "particles/objects/alien_anomaly",
	--nebula = "Effects_AlienAnomaly",
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},	
}
Spell.CyberAnomalyDie =  --
{
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED,
	aura_target		= ai.SpellTarget.SHIPS_AROUND,
	aura_range		= 275,
	aura_param		= 3000, --12000
	period			= 0.5,
	duration		= 1.5,
	isBuff			= false,
	cast_position_fx = "particles/explosions/objects/alien_anomaly_explosion",
	ui_ico =
	{
		target_system 	= { tex = "anomaly_damage_ico", },
	},	
}

Spell.MineField_Mob = 
{
	influence 		= ai.Spell.SPAWN_ENTITY,
	spawn_def		= "SpaceMissile_MineField_T5_Mk3",
	--spawn_offset = Vec3( 4, 0, 0 )
}

-- замедление самого себя, например чтобы подождать друганов
Spell.SlowPatrolLeader =
{
	aura			= ai.Aura.SLOW_MOVEMENT,
	aura_param 		= 0.3,
	max_stacks		= 5,
	duration		= 5.0,
	gameplay_specific = true,
	hud_visible 	= false,	
}

-- запираем "своего" "в стан", если он выживает время стана, то хилим кастера, если нет, то нет.
Spell.SheduleVampirism =
{
	target 				=  	{
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ALLY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.VISIBLE_BY_HOLDER + ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_CASTER + ai.SpellTargetMisc.POSITION,
	},
	aura_holder_def		= "Shell_Manta",
	target_range 		= 150,
	aura_target 		= 	{
		class				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.AROUND,
		misc				=  ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	aura_range			= 10,
	aura 				= ai.Aura.STUN,
	
	diminish_control_aura = false,
	apply_crowd_control_coef = false,
	duration			= 10,
	--duration			= 100,
	isBuff 				= false,
	--aura_target 		= 
	holder_spell_in_the_end = "SheduleVampirismHealCaster", -- отработал ттл
	holder_spell_on_cancel = "SheduleVampirismKill",-- убили холдер
	--holder_spell_in_the_end = "SheduleVampirismKill",
	--spell_on_cancel 	= "SheduleVampirismHealCaster",
	--spell_on_cancel		= "SheduleVampirismKillHolder"
	aura_fx				= "particles/gadget/suicide_aura",
}
Spell.SheduleVampirismHealCaster =
{
	influence 			= ai.Spell.APPLY_AURA,
	target				= ai.SpellTarget.CASTER,
	duration			= 4,  
	period				= 0.5,
	aura				= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param			= 50000,   -- 450 000
	isBuff				= true,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenTimeBoost", },
	},
	aura_fx = "particles/gadget/hull_heal",
}
--[[ Spell.SheduleVampirismKill = 
{
	target								= {
		target  = ai.SpellTargetGeneral.CONTEXT_TARGET,
		--target	= ai.SpellTargetGeneral.INFLICTOR,
		misc	= ai.SpellTargetMisc.POSITION,
	},

	aura_target 		= 	{
		class				= ai.SpellTargetClass.SHIP,
		area				= ai.SpellTargetArea.AROUND,
		misc				=  ai.SpellTargetMisc.NEAREST + ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	aura_range			= 10,
	duration			= 4,  
	period				= 0.5,
	aura				= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	--influence = ai.Spell.DESTROY
	aura_param			= 150000,   -- 450 000
	isBuff				= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenTimeBoost", },
	},
} ]]
Spell.SheduleVampirismKill = 
{
	target								= {
		class				= ai.SpellTargetClass.SHIP,
		relationship		= ai.SpellTargetRelationship.ALLY,
		area				= ai.SpellTargetArea.AROUND,
		misc				= ai.SpellTargetMisc.DEBUFFED_BY_CASTER,
	},
	target_range 		= 1500,
	--influence 			= ai.Spell.DESTROY, -- не добивает!
	aura_range			= 10,
	duration			= 4,  
	period				= 0.5,
	aura				= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_param			= 150000,   -- 450 000
	
	gameplay_specific	= true,
	isBuff				= false,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_GreenTimeBoost", },
	},
}

Spell.PulsarAlienManta =
{
	isBuff			= false,
	aura			= ai.Aura.DAMAGE_THERMAL_SCALED, 
	aura_param		= 1500,
	aura_param_add	= 1500, -- x2 столько + за каждый  км  (скорость 0.5 км в сек)
	period			= 0.25,
	target 			= ai.SpellTarget.INFLICTOR,
	aura_target 	= 	--ai.SpellTarget.ENEMY_AROUND,
	{ --без минных полей и ракет, только вражеские
		class			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE  + ai.SpellTargetClass.SC_BASE_ENTITY,
		area			= ai.SpellTargetArea.AROUND,
		relationship	= ai.SpellTargetRelationship.ENEMY,
	},
	aura_range		= 25,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_IsotopeHarvester", },
	},
	period_fx		= "particles/gadget/jericho_active_module_hit",


}

Spell.BossPassive_dynamic_AllBodyResistOAA =  -- для геймплея один против всех и для босса в ОМ
{
	isBuff			= true,
	gameplay_specific = true,
	aura			= ai.Aura.HEALTH_MOD,
	aura_param		= 0.15,
	target 			= ai.SpellTarget.CASTER,
--	aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам
	--aura_range		= 350,
	max_stacks		= 20,	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
	additional_auras = {
		{
			isBuff			= true,
			gameplay_specific = true,
			aura			= ai.Aura.INHERITED_HEALTH_MOD,
			aura_param		= 0.15,
	--		aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам 
	--		aura_range		= 250,
			max_stacks		= 20,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
		{
			isBuff			= true,
			gameplay_specific = true,
			aura			= ai.Aura.SHIELD_MOD,
			aura_param		= 0.15,
	--		aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам 
	--		aura_range		= 250,
			max_stacks		= 20,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
		{
			isBuff			= true,
			gameplay_specific = true,
			aura			= ai.Aura.DAMAGE_MOD,
			aura_param		= 0.06,
	--		aura_target		= ai.SpellTarget.ALLY_SHIPS_AROUND, -- по умолчанию сам 
	--		aura_range		= 250,
			max_stacks		= 20,
			ui_ico 			= { target_system 	= { tex = "ItemSubtype_CommandCritAura", }, },
		},
	},
}