--[[
AuraTooltips - таблица с описаниями характеристик для отображения во всплывающей подсказке бафов. Индексами служат ItemSubtype вещей.

    descriptionParams - вложенная таблица описывающая характеристики для вставки в текст всплывающей подсказки.

    name - название характеристики. По этому полю в descriptionParams в текст идет вставка параметра.

    valField - поле или таблица в которых указываются имена полей в прототипе которые используются для данных.

    formula - поле или таблица в котором указаны функции, которые используются для вычисления данных. В качестве параметров передаются поля, указанные в valField.

    units - поле описывающее единицы измерений выходных данных. В tooltipParams и shopParams это поле используется для подстановки единиц измерения вида units_[units]

    format - поле описывающее формат выходных данных. По умолчанию это максимум 2 знака после запятой с отброшенными нулями.
]]

AuraTooltips = {}



AuraTooltipsParams =
{
    aura_param_units =
    {
        name = "aura_param",
        valField = "aura_param",
        units = "units",
    },

	aura_param_metre =
    {
        name = "aura_param",
        valField = "aura_param",
        units = "metre",
    },
	
    aura_param_percent =
    {
        name = "aura_param",
        valField = "aura_param",
        units = "percent",
    },

    aura_param_percent_minus =
    {
        name = "aura_param",
        valField = "aura_param",
        units = "percent_minus",
    },

    period =
    {
        name = "period",
        valField = "period",
        units = "second",
    },
}



AuraTooltips[ai.Aura.ADD_ENERGY_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}



AuraTooltips[ai.Aura.BURN_ENERGY_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}



AuraTooltips[ai.Aura.CRIT_CHANCE] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
    },
}



AuraTooltips[ai.Aura.DAMAGE_KINETIC_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}

AuraTooltips[ai.Aura.DAMAGE_KINETIC_SCALED] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}

AuraTooltips[ai.Aura.DAMAGE_DEC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent_minus,
    },
}



AuraTooltips[ai.Aura.DAMAGE_MOD] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
    },
}
AuraTooltips[ai.Aura.SECONDARY_DAMAGE_MOD] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
    },
}
AuraTooltips[ai.Aura.DAMAGE_ONE_SHOT_MOD] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
    },
}


AuraTooltips[ai.Aura.DAMAGE_THERMAL_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}

AuraTooltips[ai.Aura.DAMAGE_EMP_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}

AuraTooltips[ai.Aura.DAMAGE_THERMAL_PERIODIC_REDUCE_HEAL] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}



AuraTooltips[ai.Aura.DAMAGE_THERMAL_SCALED] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}

AuraTooltips[ai.Aura.DAMAGE_EMP_SCALED] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}

AuraTooltips[ai.Aura.ENERGY_VAMPIRE_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}



AuraTooltips[ai.Aura.HEAL_HULL_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}

AuraTooltips[ai.Aura.HEAL_HULL_PERCENT_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
        [ 2 ] = AuraTooltipsParams.period,
    },
}

AuraTooltips[ai.Aura.HEAL_HULL_SCALED_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}



AuraTooltips[ai.Aura.HULL_RESIST_ALL] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}



AuraTooltips[ai.Aura.HULL_RESIST_THERMAL] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}

AuraTooltips[ai.Aura.HULL_RESIST_KINETIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}

AuraTooltips[ai.Aura.HULL_RESIST_EMP] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}

AuraTooltips[ai.Aura.ENGINE_MOD] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
    },
}

AuraTooltips[ai.Aura.HEAL_SHIELD_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}


AuraTooltips[ai.Aura.HEAL_SHIELD_SCALED_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}




AuraTooltips[ai.Aura.OVERCHARGE] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
    },
}



AuraTooltips[ai.Aura.RESIST_ALL] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}



AuraTooltips[ai.Aura.RESIST_ALL_DEC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}

AuraTooltips[ai.Aura.HULL_RESIST_ALL_DEC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}

AuraTooltips[ai.Aura.HULL_RESIST_THERMAL_DEC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}

AuraTooltips[ai.Aura.SHIELD_RESIST_ALL_DEC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}


AuraTooltips[ai.Aura.SHIELD_RESIST_ALL] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}



AuraTooltips[ai.Aura.SHIELD_RESIST_EMP] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}



AuraTooltips[ai.Aura.SHIELD_RESIST_KINETIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}



AuraTooltips[ai.Aura.SHIELD_RESIST_THERMAL] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}



AuraTooltips[ai.Aura.SHIELD_VAMPIRE_PERIODIC] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}



AuraTooltips[ai.Aura.SLOW_MOVEMENT] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent_minus,
    },
}


AuraTooltips[ai.Aura.ENERGY_SHIELD] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
    },
}

AuraTooltips[ai.Aura.FAST_MOVEMENT] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
    },
}

AuraTooltips[ai.Aura.SNIPER_OVERLOAD] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
    },
}

AuraTooltips[ai.Aura.SNIPER_SPEED] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_percent,
    },
}

AuraTooltips[ai.Aura.SHIELD_BURN_PERIODIC] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
		[ 2 ] = AuraTooltipsParams.period,
	}
}

AuraTooltips[ai.Aura.DAMAGE_HULL_KINETIC_SCALED_PERIODIC] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_units,
		[ 2 ] = AuraTooltipsParams.period,
	}
}

AuraTooltips[ai.Aura.SHIP_ATTRACTION] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_metre,
		[ 2 ] = AuraTooltipsParams.period,
	}
}

AuraTooltips[ai.Aura.HULL_RESIST_EMP_DEC] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_units,
	}
}

AuraTooltips[ai.Aura.HULL_BURN_PERIODIC] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	}
}

AuraTooltips[ai.Aura.FORCE_TARGET_LOCK] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_units,
	}
}

AuraTooltips[ai.Aura.EMP_ABSORB_TO_SHIELD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_units,
	}
}

AuraTooltips[ai.Aura.SLOW_MANEUVER] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_duration,
	}
}

AuraTooltips[ai.Aura.DISABLED_WEAPON] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_duration,
	}
}

AuraTooltips[ai.Aura.BROKEN_WEAPON] =
{
	descriptionParams =
	{
		{
			name = "damage_thermal",
			valField = "aura_param",
			units = "units",
		},
	}
}

AuraTooltips[ai.Aura.DAMAGE_REFLECT] =
{
	descriptionParams =
	{
		{
			name = "duration",
			valField = "duration",
			units = "second",
		},
	}
}

AuraTooltips[ai.Aura.PRIMARY_WEAPON_RANGE_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.FIRE_RATE_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.DIRECTION_DEPEND_FAST_MOVEMENT] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.ADDITIONAL_DAMAGE_THERMAL_SCALED] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.HEAT_MUL] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.FAST_MANEUVER] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.EMERGENCY_SPELL] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.VISION_RADIUS_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.HEALING_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.COOLDOWN_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.MODULE_DAMAGE_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.FORCE_BOOST] =
{
	descriptionParams =
	{
        [ 1 ] = 
		{
			name = "strafe_speed_dec",
			valField = "additional_auras[1].aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
		},
    },
}

AuraTooltips[ai.Aura.HULL_RESIST_KINETIC_DEC] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_units,
	},
}

AuraTooltips[ai.Aura.HEALTH_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.INHERITED_HEALTH_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.SHIELD_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.CONTACT_DAMAGE_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}

AuraTooltips[ai.Aura.CAMO_MOD] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent_minus,
	},
}

AuraTooltips[ai.Aura.ENERGY_HARVESTER] =
{
    descriptionParams =
    {
        [ 1 ] = AuraTooltipsParams.aura_param_units,
        [ 2 ] = AuraTooltipsParams.period,
    },
}

AuraTooltips[ai.Aura.REDUCE_MIN_SPEED] =
{
	descriptionParams =
	{
		[ 1 ] = AuraTooltipsParams.aura_param_percent,
	},
}