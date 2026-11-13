-- ----------------------------------------------------------------------------
--
-- Created: 21-Oct-2019
-- Copyright © 2019, Targem LLC. All rights reserved.
-- 
-- Autogen tooltips
--
-- ----------------------------------------------------------------------------

--

AffixTooltips =
{
	COMMON			= {},
	BALANCED		= {},
	SPECIAL			= {},
}

--############################## COMMON ##############################--

AffixTooltips.COMMON =
{
	damage =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	laser_damage =
	{
		{
			name = "laser_damage_mul",
			valField = "laser_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	plasma_damage =
	{
		{
			name = "plasma_damage_mul",
			valField = "plasma_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	rail_damage =
	{
		{
			name = "railgun_damage_mul",
			valField = "railgun_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	rocket_damage =
	{
		{
			name = "rocket_damage_mul",
			valField = "rocket_damage_coef_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	alien_damage =
	{
		{
			name = "alien_damage_mul",
			valField = "alien_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	crit_chance =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			format = "%0.1f",
			units = "percent",
		},
	},

	crit_damage =
	{
		{
			name = "crit_damage_add",
			valField = "crit_damage_add",
			format = "%0.1f",
			units = "percent",
		},
	},

	dispersion =
	{
		{
			name = "dispersion_mul",
			valField = "dispersion_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	fire_rate =
	{
		{
			name = "fire_rate_mul",
			valField = "fire_rate_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	heat_add =
	{
		{
			name = "heat_add_mul",
			valField = "heat_add_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	heat_sub =
	{
		{
			name = "heat_sub_mul",
			valField = "heat_sub_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	range =
	{
		{
			name = "max_range_mul",
			valField = "max_range_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	proj_speed =
	{
		{
			name = "projectile_speed_mul",
			valField = "projectile_speed_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	cooldown =
	{
		{
			name = "cooldown_mul",
			valField = "cooldown_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	rocket_cooldown =
	{
		{
			name = "rocket_cooldown_mul",
			valField = "rocket_cooldown_coef_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	crystal_damage =
	{
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	huge_damage =
	{
		{
			name = "huge_damage_mul",
			valField = "signature_huge_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	lock_time =
	{
		{
			name = "lock_time_mul",
			valField = "lock_time_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	shield_max =
	{
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	shield_regen =
	{
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	shield_resist =
	{
		{
			name = "shield_resist_add",
			valField = "shield_resist_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	shield_resist_thermal =
	{
		{
			name = "shield_resist_thermal_add",
			valField = "shield_resist_thermal_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	shield_resist_emp =
	{
		{
			name = "shield_resist_emp_add",
			valField = "shield_resist_emp_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	shield_resist_kinetic =
	{
		{
			name = "shield_resist_kinetic_add",
			valField = "shield_resist_kinetic_add",
			format = "%0.1f",
			units = "units",
		},
	},
}

--############################## BALANCED ##############################--

AffixTooltips.BALANCED =
{
	damage_vs_firerate =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "fire_rate_dec_mul",
			valField = "fire_rate_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	firerate_vs_damage =
	{
		{
			name = "fire_rate_mul",
			valField = "fire_rate_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	damage_vs_aliendmg =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "alien_damage_dec_mul",
			valField = "alien_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	aliendmg_vs_damage =
	{
		{
			name = "alien_damage_mul",
			valField = "alien_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	critchance_vs_critdmg =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "crit_damage_dec",
			valField = "crit_damage_add",
			format = "%0.1f",
			units = "percent",
		},
	},

	critdmg_vs_critchance =
	{
		{
			name = "crit_damage_add",
			valField = "crit_damage_add",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "crit_chance_dec",
			valField = "crit_chance_add",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	damage_vs_critdmg =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "crit_damage_dec",
			valField = "crit_damage_add",
			format = "%0.1f",
			units = "percent",
		},
	},

	critdmg_vs_damage =
	{
		{
			name = "crit_damage_add",
			valField = "crit_damage_add",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	firerate_vs_critchance =
	{
		{
			name = "fire_rate_mul",
			valField = "fire_rate_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "crit_chance_dec",
			valField = "crit_chance_add",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	critchance_vs_firerate =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "fire_rate_dec_mul",
			valField = "fire_rate_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	damage_vs_dispersion =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "dispersion_mul",
			valField = "dispersion_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	dispersion_vs_damage =
	{
		{
			name = "dispersion_dec_mul",
			valField = "dispersion_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	damage_vs_range =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "max_range_dec_mul",
			valField = "max_range_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	range_vs_damage =
	{
		{
			name = "max_range_mul",
			valField = "max_range_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	projspeed_vs_damage =
	{
		{
			name = "projectile_speed_mul",
			valField = "projectile_speed_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	damage_vs_heat =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "heat_add_mul",
			valField = "heat_add_mul",
			format = "%0.1f",
			units = "percent",
		},
	},

	heat_vs_damage =
	{
		{
			name = "heat_add_dec_mul",
			valField = "heat_add_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	heat_vs_cool =
	{
		{
			name = "heat_add_dec_mul",
			valField = "heat_add_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "heat_sub_dec_mul",
			valField = "heat_sub_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	cool_vs_heat =
	{
		{
			name = "heat_sub_mul",
			valField = "heat_sub_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "heat_add_mul",
			valField = "heat_add_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	damage_vs_greendmg =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "crystal_damage_dec_mul",
			valField = "crystal_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	greendmg_vs_damage =
	{
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	damage_vs_hugedmg =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "signature_huge_damage_dec_mul",
			valField = "signature_huge_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	hugedmg_vs_damage =
	{
		{
			name = "signature_huge_damage_mul",
			valField = "signature_huge_damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	damage_vs_critchance =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "crit_chance_dec",
			valField = "crit_chance_add",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	critchance_vs_damage =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	shield_vs_hull =
	{
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "hull_health_mul",
			valField = "hull_health_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	shieldmax_vs_shieldregen =
	{
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	shieldmax_vs_shieldres =
	{
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "shield_resist_add",
			valField = "shield_resist_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	shieldregen_vs_shieldmax =
	{
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	shieldres_vs_shieldmax =
	{
		{
			name = "shield_resist_add",
			valField = "shield_resist_add",
			format = "%0.1f",
			units = "units",
		},
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	shieldres_vs_shieldregen =
	{
		{
			name = "shield_resist_add",
			valField = "shield_resist_add",
			format = "%0.1f",
			units = "units",
		},
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			format = "%0.1f",
			units = "percent",
		},
	},
	
	shieldregen_vs_shieldres =
	{
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			format = "%0.1f",
			units = "percent",
		},
		{
			name = "shield_resist_add",
			valField = "shield_resist_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	thermalshld_vs_empshld =
	{
		{
			name = "shield_resist_thermal_add",
			valField = "shield_resist_thermal_add",
			format = "%0.1f",
			units = "units",
		},
		{
			name = "shield_resist_emp_add",
			valField = "shield_resist_emp_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	thermalshld_vs_railshld =
	{
		{
			name = "shield_resist_thermal_add",
			valField = "shield_resist_thermal_add",
			format = "%0.1f",
			units = "units",
		},
		{
			name = "shield_resist_kinetic_add",
			valField = "shield_resist_kinetic_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	empshld_vs_thermalshld =
	{
		{
			name = "shield_resist_emp_add",
			valField = "shield_resist_emp_add",
			format = "%0.1f",
			units = "units",
		},
		{
			name = "shield_resist_thermal_add",
			valField = "shield_resist_thermal_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	empshld_vs_railshld =
	{
		{
			name = "shield_resist_emp_add",
			valField = "shield_resist_emp_add",
			format = "%0.1f",
			units = "units",
		},
		{
			name = "shield_resist_kinetic_add",
			valField = "shield_resist_kinetic_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	railshld_vs_thermalshld =
	{
		{
			name = "shield_resist_kinetic_add",
			valField = "shield_resist_kinetic_add",
			format = "%0.1f",
			units = "units",
		},
		{
			name = "shield_resist_thermal_add",
			valField = "shield_resist_thermal_add",
			format = "%0.1f",
			units = "units",
		},
	},
	
	railshld_vs_empshld =
	{
		{
			name = "shield_resist_kinetic_add",
			valField = "shield_resist_kinetic_add",
			format = "%0.1f",
			units = "units",
		},
		{
			name = "shield_resist_emp_add",
			valField = "shield_resist_emp_add",
			format = "%0.1f",
			units = "units",
		},
	},
}

--############################## SPECIAL ##############################--

AffixTooltips.SPECIAL =
{
	damage_to_power =
	{
		{
			name = "max_health_percent",
			valField = "max_health_percent",
			units = "percent",
		},
		{
			name = "period",
			spellPrototype = "spell_on_max_health_minus",
			valField = "period",
			units = "second",
		},
		{
			name = "aura_param",
			spellPrototype = "spell_on_max_health_minus",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_max_health_minus",
			valField = "duration",
			units = "second",
		},
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
	},
	
	gun_impulse =
	{
		{
			name = "impulse_strength",
			spellPrototype = "spell_on_weapon_hit",
			valField = "influence_param",
			units = "units",
		},
	},
	
	energy_steal =
	{
		{
			name = "energy_amount",
			spellPrototype = "spell_on_weapon_hit",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "spell_timeout",
			valField = "spell_on_weapon_hit_timeout",
			units = "second",
		},
	},
	
	shield_heal =
	{
		{
			name = "heal_amount",
			spellPrototype = "spell_on_weapon_hit",
			valField = { "aura_param", "duration", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + arg[2] / arg[3] )
			end,
			units = "units",
		},
		{
			name = "heal_duration",
			spellPrototype = "spell_on_weapon_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_weapon_hit",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "spell_timeout",
			valField = "spell_on_weapon_hit_timeout",
			units = "second",
		},
	},
	
	hull_heal =
	{
		{
			name = "heal_amount",
			spellPrototype = "spell_on_weapon_hit",
			valField = { "aura_param", "duration", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + arg[2] / arg[3] )
			end,
			units = "units",
		},
		{
			name = "heal_duration",
			spellPrototype = "spell_on_weapon_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_weapon_hit",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "spell_timeout",
			valField = "spell_on_weapon_hit_timeout",
			units = "second",
		},
	},
	
	anti_shield =
	{
		{
			name = "dec_amount",
			spellPrototype = "spell_on_weapon_crit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "dec_duration",
			spellPrototype = "spell_on_weapon_crit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_weapon_crit",
			valField = "max_stacks",
			units = "units",
		},
	},
	
	anti_hull =
	{
		{
			name = "dec_amount",
			spellPrototype = "spell_on_weapon_crit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "dec_duration",
			spellPrototype = "spell_on_weapon_crit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_weapon_crit",
			valField = "max_stacks",
			units = "units",
		},
	},
	
	low_damage =
	{
		{
			name = "damage_dec_amount",
			spellPrototype = "spell_on_weapon_hit",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
		},
		{
			name = "damage_dec_duration",
			spellPrototype = "spell_on_weapon_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_weapon_hit",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "spell_timeout",
			valField = "spell_on_weapon_hit_timeout",
			units = "second",
		},
	},
	
	anti_debuff =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_weapon_crit",
			valField = "chance",
			units = "percent",
		},
	},
	
	freeze_gun =
	{
		{
			name = "freeze_amount",
			spellPrototype = "spell_on_weapon_hit",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
		},
		{
			name = "freeze_duration",
			spellPrototype = "spell_on_weapon_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_weapon_hit",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "spell_timeout",
			valField = "spell_on_weapon_hit_timeout",
			units = "second",
		},
	},
	
	time_bomb =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_weapon_crit",
			valField = "chance",
			units = "percent",
		},
		{
			name = "freeze_radius",
			spellPrototype = "spell_on_weapon_crit",
			valField = "additional_auras",
			formula = function( ... )
				local arg = { ... }
				return arg[ 1 ][ 1 ].aura_range
			end,
			units = "metre",
		},
		{
			name = "freeze_amount",
			spellPrototype = "spell_on_weapon_crit",
			valField = "additional_auras",
			formula = function( ... )
				local arg = { ... }
				return arg[ 1 ][ 1 ].aura_param
			end,
			units = "units",
		},
		{
			name = "freeze_duration",
			spellPrototype = "spell_on_weapon_crit",
			valField = "additional_auras",
			formula = function( ... )
				local arg = { ... }
				return arg[ 1 ][ 1 ].duration
			end,
			units = "second",
		},
	},
	
	gravity_bomb =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_weapon_crit",
			valField = "chance",
			units = "percent",
		},
		{
			name = "gravity_amount",
			spellPrototype = "spell_on_weapon_crit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "gravity_duration",
			spellPrototype = "spell_on_weapon_crit",
			valField = "duration",
			units = "second",
		},
		{
			name = "gravity_range",
			spellPrototype = "spell_on_weapon_crit",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "gravity_damage",
			spellPrototype = "spell_on_weapon_crit",
			valField = { "aura_param", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "blast_damage",
			spellPrototype = "spell_on_weapon_crit",
			valField = "holder_spell_in_the_end",
			formula = function( ... )
				local arg = { ... }
				local blastwave = Spell[ arg[1] ].explosion_blast_wave
				return Def[ blastwave ].damage_emp
			end,
			units = "units",
		},
	},
	
	nuclear_on_enemy_death =
	{
		{
			name = "trigger_range",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "cloud_damage",
			spellPrototype = "spell_on_death_someone",
			valField = { "aura_param", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "cloud_duration",
			spellPrototype = "spell_on_death_someone",
			valField = "duration",
			units = "second",
		},
	},
	
	break_enemy_weapon =
	{
		{
			name = "damage_on_shoot_amount",
			spellPrototype = "spell_on_weapon_crit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "spell_duration",
			spellPrototype = "spell_on_weapon_crit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_weapon_crit",
			valField = "max_stacks",
			units = "units",
		},
	},
	
	stop_barrel_rotation =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_weapon_crit",
			valField = "chance",
			units = "percent",
		},
		{
			name = "spell_duration",
			spellPrototype = "spell_on_weapon_crit",
			valField = "duration",
			units = "second",
		},
	},
	
	aim_on_kill =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_weapon_kill",
			valField = "chance",
			units = "percent",
		},
		{
			name = "spell_duration",
			spellPrototype = "spell_on_weapon_kill",
			valField = "duration",
			units = "second",
		},
	},
	
	speed_on_enemy_death =
	{
		{
			name = "trigger_range",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "speed_amount",
			spellPrototype = "spell_on_death_someone",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "speed_duration",
			spellPrototype = "spell_on_death_someone",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_death_someone",
			valField = "max_stacks",
			units = "units",
		},
	},
	
	firerate_on_kill =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_weapon_kill",
			valField = "chance",
			units = "percent",
		},
		{
			name = "spell_amount",
			spellPrototype = "spell_on_weapon_kill",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "spell_duration",
			spellPrototype = "spell_on_weapon_kill",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_weapon_kill",
			valField = "max_stacks",
			units = "units",
		},
	},
	
	dispersion_dec_on_kill =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_weapon_kill",
			valField = "chance",
			units = "percent",
		},
		{
			name = "spell_amount",
			spellPrototype = "spell_on_weapon_kill",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "spell_duration",
			spellPrototype = "spell_on_weapon_kill",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_weapon_kill",
			valField = "max_stacks",
			units = "units",
		},
	},
	
	flying_heal_on_enemy_death =
	{
		{
			name = "trigger_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "heal_amount",
			spellPrototype = "spell_on_equip",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local arg = { ... }
				local start_spell = Spell[ arg[1] ]
				local deathRocket = Def[ start_spell.death_rocket ]
				local spell = Spell[ deathRocket.spell ]
				local aura_param = spell.aura_param
				local duration = spell.duration
				local period = spell.period
				return aura_param * ( 1 + duration / period )
			end,
			units = "units",
		},
		{
			name = "spell_duration",
			spellPrototype = "spell_on_equip",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local start_spell = Spell[ arg[1] ]
				local deathRocket = Def[ start_spell.death_rocket ]
				local spell = Spell[ deathRocket.spell ]
				return spell.duration
			end,
			units = "second",
		},
	},
	
	flying_dmgbuff_on_enemy_death =
	{
		{
			name = "trigger_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "dmgBuff_amount",
			spellPrototype = "spell_on_equip",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local start_spell = Spell[ arg[1] ]
				local deathRocket = Def[ start_spell.death_rocket ]
				local spell = Spell[ deathRocket.spell ]
				return spell.aura_param
			end,
			units = "percent",
		},
		{
			name = "dmgBuff_duration",
			spellPrototype = "spell_on_equip",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local start_spell = Spell[ arg[1] ]
				local deathRocket = Def[ start_spell.death_rocket ]
				local spell = Spell[ deathRocket.spell ]
				return spell.duration
			end,
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_equip",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local start_spell = Spell[ arg[1] ]
				local deathRocket = Def[ start_spell.death_rocket ]
				local spell = Spell[ deathRocket.spell ]
				return spell.max_stacks
			end,
			units = "units",
		},
	},
	
	detonate_ammo =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_weapon_crit",
			valField = "chance",
			units = "percent",
		},
	},
	
	heal_by_damage_emp =
	{
		{
			name = "max_health_percent",
			valField = "max_health_percent",
			units = "percent",
		},
		{
			name = "heal_coef",
			spellPrototype = "spell_on_max_health_minus",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "heal_duration",
			spellPrototype = "spell_on_max_health_minus",
			valField = "duration",
			units = "second",
		},
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
	},
	
	heal_by_damage_kinetic =
	{
		{
			name = "max_health_percent",
			valField = "max_health_percent",
			units = "percent",
		},
		{
			name = "heal_coef",
			spellPrototype = "spell_on_max_health_minus",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "heal_duration",
			spellPrototype = "spell_on_max_health_minus",
			valField = "duration",
			units = "second",
		},
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
	},
	
	heal_by_damage_thermal =
	{
		{
			name = "max_health_percent",
			valField = "max_health_percent",
			units = "percent",
		},
		{
			name = "heal_coef",
			spellPrototype = "spell_on_max_health_minus",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "heal_duration",
			spellPrototype = "spell_on_max_health_minus",
			valField = "duration",
			units = "second",
		},
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
	},
	
	spike_ram =
	{
		{
			name = "ram_coef",
			spellPrototype = "spell_on_kill",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "ram_duration",
			spellPrototype = "spell_on_kill",
			valField = "duration",
			units = "second",
		},
	},
	
	set_on_fire =
	{
		{
			name = "fire_damage",
			spellPrototype = "spell_on_weapon_hit",
			valField = { "aura_param", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "fire_duration",
			spellPrototype = "spell_on_weapon_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "spell_timeout",
			valField = "spell_on_weapon_hit_timeout",
			units = "second",
		},
	},
	
	set_on_emp_fire =
	{
		{
			name = "fire_damage",
			spellPrototype = "spell_on_weapon_hit",
			valField = { "aura_param", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "fire_duration",
			spellPrototype = "spell_on_weapon_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "spell_timeout",
			valField = "spell_on_weapon_hit_timeout",
			units = "second",
		},
	},
	
	blastwave_thermal =
	{
		{
			name = "damage",
			spellPrototype = "spell_on_weapon_hit",
			valField = { "explosion_blast_wave", "influence_param" },
			formula = function( ... )
				local arg = { ... }
				local blastwave = Def[ arg[1] ]
				local damage = blastwave.damage_thermal
				return damage * arg[2]
			end,
			units = "units",
		},
		{
			name = "spell_timeout",
			valField = "spell_on_weapon_hit_timeout",
			units = "second",
		},
	},
	
	heal_on_enemy_kill =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_kill",
			valField = "chance",
			units = "percent",
		},
		{
			name = "heal_amount",
			spellPrototype = "spell_on_kill",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local spell = Spell[ def.spell_approach ]
				return spell.aura_param * ( 1 + spell.duration / spell.period )
			end,
			units = "units",
		},
		{
			name = "heal_duration",
			spellPrototype = "spell_on_kill",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local spell = Spell[ def.spell_approach ]
				return spell.duration
			end,
			units = "second",
		},
	},
	
	speed_on_enemy_kill =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_kill",
			valField = "chance",
			units = "percent",
		},
		{
			name = "speed_amount",
			spellPrototype = "spell_on_kill",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local spell = Spell[ def.spell_approach ]
				return spell.aura_param
			end,
			units = "percent",
		},
		{
			name = "speed_duration",
			spellPrototype = "spell_on_kill",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local spell = Spell[ def.spell_approach ]
				return spell.duration
			end,
			units = "second",
		},
	},
	
	damage_on_enemy_kill =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_kill",
			valField = "chance",
			units = "percent",
		},
		{
			name = "damage_amount",
			spellPrototype = "spell_on_kill",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local spell = Spell[ def.spell_approach ]
				return spell.aura_param
			end,
			units = "percent",
		},
		{
			name = "damage_duration",
			spellPrototype = "spell_on_kill",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local spell = Spell[ def.spell_approach ]
				return spell.duration
			end,
			units = "second",
		},
	},
	
	replace_dmg_type_emp =
	{
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
	
	replace_dmg_type_thermal =
	{
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
	
	replace_dmg_type_kinetic =
	{
		{
			name = "damage_dec_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
	
	same_attraction =
	{
		{
			name = "gravity_amount",
			spellPrototype = "spell_on_weapon_hit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "gravity_duration",
			spellPrototype = "spell_on_weapon_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "gravity_range",
			spellPrototype = "spell_on_weapon_hit",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "spell_timeout",
			valField = "spell_on_weapon_hit_timeout",
			units = "second",
		},
	},
	
	---------------------- GUNS ----------------------
	
	gun_random_rockets =
	{
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "units",
		},
		{
			name = "fire_rate",
			valField = "fire_rate",
			units = "shot_per_minute",
		},
		{
			name = "projectile_speed",
			valField = "projectile_speed",
			units = "metre_per_second",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
	},
	
	gun_charged_rail =
	{
		{
			name = "damage_kinetic",
			valField = { "damage_kinetic", "charge_max", },
			formula = function( ... )
				local arg = { ... }
				return arg[1]
			end,
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			concat = "%s - %s",
			units = "units",
		},
		{
			name = "projectile_speed",
			valField = "projectile_speed",
			units = "metre_per_second",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
	},
	
	gun_charged_thunder =
	{
		{
			name = "min_time",
			valField = { "fire_rate", "charge_levels", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / 60 * arg[2][1].time
			end,
			units = "second",
		},
		{
			name = "damage_thermal",
			valField = { "damage_thermal", "charge_levels", },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1] * ( 1 + arg[2][1].damage_mul )
				end,
				function( ... )
					local arg = { ... }
					return arg[1] * ( 1 + arg[2][ #arg[2] ].damage_mul )
				end,
			},
			concat = "%s - %s",
			units = "units",
		},
		{
			name = "projectile_speed",
			valField = { "projectile_speed", "charge_levels", },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1] * ( 1 + arg[2][1].speed_mul )
				end,
				function( ... )
					local arg = { ... }
					return arg[1] * ( 1 + arg[2][ #arg[2] ].speed_mul )
				end,
			},
			concat = "%s - %s",
			units = "metre_per_second",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
	},
	
	gun_rocket_wall =
	{
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "units",
		},
		{
			name = "fire_rate",
			valField = "fire_rate",
			units = "shot_per_minute",
		},
		{
			name = "projectile_speed",
			valField = "projectile_speed",
			units = "metre_per_second",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
	},
	
	gun_lightning =
	{
		{
			name = "damage_emp",
			valField = "damage_emp",
			units = "units",
		},
		{
			name = "fire_rate",
			valField = "fire_rate",
			units = "shot_per_minute",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "link_range",
			valField = "link_range",
			units = "metre",
		},
		{
			name = "link_count",
			valField = "chaing_damage",
			formula = function( ... )
				local arg = { ... }
				return #arg[1]
			end,
			units = "units",
		},
		{
			name = "energy_cost_per_shot",
			valField = "shot_energy_cost",
			units = "units",
		},
	},
	
	gun_thunder =
	{
		{
			name = "damage_emp",
			valField = "damage_emp",
			units = "units",
		},
		{
			name = "fire_rate",
			valField = "fire_rate",
			units = "shot_per_minute",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "energy_cost_per_shot",
			valField = "shot_energy_cost",
			units = "units",
		},
		{
			name = "energy_cost_per_target",
			valField = "target_energy_cost",
			units = "units",
		},
	},
	
	gun_chain_buckshot =
	{
		{
			name = "damage_kinetic",
			valField = "damage_kinetic",
			units = "units",
		},
		{
			name = "fire_rate",
			valField = "fire_rate",
			units = "shot_per_minute",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "link_range",
			valField = "projectile",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].link_range
			end,
			units = "metre",
		},
		{
			name = "link_count",
			valField = "projectile",
			formula = function( ... )
				local arg = { ... }
				return #( Def[ arg[1] ].chaing_damage )
			end,
			units = "units",
		},
	},
	
	---------------------- SHIELD ----------------------
	
	spike_shield =
	{
		{
			name = "charge_damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "aura_range",
			spellPrototype = "charge_spell_on_damage",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "dps",
			spellPrototype = "charge_spell_on_damage",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "duration",
			spellPrototype = "charge_spell_on_damage",
			valField = "duration",
			units = "second",
		},
	},
	
	unstable_shield =
	{
		{
			name = "charge_damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "chance",
			spellPrototype = "charge_spell_on_damage",
			valField = "chance",
			units = "percent",
		},
		{
			name = "target_range",
			spellPrototype = "charge_spell_on_damage",
			valField = "target_range",
			units = "metre",
		},
	},
	
	collision_immune_shield =
	{
		{
			name = "max_shield_percent",
			valField = "max_shield_percent",
			units = "percent",
		},
	},
	
	shield_on_enemy_kill =
	{
		{
			name = "chance",
			spellPrototype = "spell_on_kill",
			valField = "chance",
			units = "percent",
		},
		{
			name = "heal_amount",
			spellPrototype = "spell_on_kill",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local spell = Spell[ def.spell_approach ]
				return spell.aura_param * ( 1 + spell.duration / spell.period )
			end,
			units = "units",
		},
		{
			name = "heal_duration",
			spellPrototype = "spell_on_kill",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local spell = Spell[ def.spell_approach ]
				return spell.duration
			end,
			units = "second",
		},
	},
	
	blackout_shield =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "shield_disabled_spell",
			valField = "target_range",
			units = "metre",
		},
	},
	
	dynamic_shield =
	{
		{
			name = "max_shield_percent",
			valField = "max_shield_percent",
			units = "percent",
		},
		{
			name = "aura_param_max",
			spellPrototype = "spell_on_max_shield_plus",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},
		{
			name = "grow_time",
			spellPrototype = "spell_on_max_shield_plus",
			valField = "max_stacks",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * Def.AG_Base_Percent_Shield.cooldown
			end,
			units = "second",
		},
	},
	
	reserve_shield =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
		{
			name = "influence_param",
			spellPrototype = "shield_disabled_spell",
			valField = "influence_param",
			units = "units",
		},
	},
	
	ghost_shield =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
	},
	
	shield_vampire =
	{
		{
			name = "max_shield_percent",
			valField = "max_shield_percent",
			units = "percent",
		},
		{
			name = "aura_param",
			spellPrototype = "spell_on_max_shield_minus",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_max_shield_minus",
			valField = "aura_range",
			units = "metre",
		},
	},
	
	defender_shield =
	{
		{
			name = "max_shield_percent",
			valField = "max_shield_percent",
			units = "percent",
		},
		{
			name = "aura_param_max",
			spellPrototype = "spell_on_max_shield_minus",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},
		{
			name = "grow_time",
			spellPrototype = "spell_on_max_shield_minus",
			valField = "max_stacks",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * Def.AG_Base_Percent_Shield.cooldown
			end,
			units = "second",
		},
	},
	
	turtle_shield =
	{
		{
			name = "max_speed_percent",
			valField = "max_speed_percent",
			units = "percent",
		},
		{
			name = "aura_param",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "aura_param",
			units = "units",
		},
	},
	
	slow_shield =
	{
		{
			name = "max_speed_percent",
			valField = "max_speed_percent",
			units = "percent",
		},
		{
			name = "aura_param_max",
			spellPrototype = "spell_on_max_speed_minus",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},
		{
			name = "grow_time",
			spellPrototype = "spell_on_max_speed_minus",
			valField = "max_stacks",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * Def.AG_Base_Percent_Speed.cooldown
			end,
			units = "second",
		},
	},
	
	exploding_shield =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
		{
			name = "damage",
			spellPrototype = "shield_disabled_spell",
			valField = { "explosion_blast_wave", "influence_param" },
			formula = function( ... )
				local arg = { ... }
				local blastwave = Def[ arg[1] ]
				local damage = blastwave.damage_emp
				return damage * arg[2]
			end,
			units = "units",
		},
	},

	second_shield =
	{
		{
			name = "shield_health",
			spellPrototype = "shield_disabled_spell",
			valField = "aura_holder_def",
			formula = function( ... )
				local arg = { ... }
				local shield = Def[ arg[1] ]
				return shield.health
			end,
			units = "units",
		},
		{
			name = "aura_param",
			spellPrototype = "shield_disabled_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "slowdown_param",
			spellPrototype = "shield_disabled_spell",
			valField = "additional_auras",
			formula = function( ... )
				local arg = { ... }
				return arg[1][1].aura_param
			end,
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
	},
	
	energy_shield =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
		{
			name = "aura_param",
			spellPrototype = "shield_disabled_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
	},
	
	swap_shield =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
	},
}

