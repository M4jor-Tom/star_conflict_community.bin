--[[
ShipTooltips - таблица с описаниями характеристик для отображения во всплывающей подсказке и в магазине. Индексами служат ItemSubtype вещей.

    tooltipParams - вложенная таблица описывающая строки характеристик для всплывающей подсказки.
    descriptionParams - вложенная таблица описывающая характеристики для вставки в текст всплывающей подсказки.

    name - название характеристики.
        По этому полю в tooltipParams подставляется иконка вида param_[name] и строка вида param_[name].
        По этому полю в descriptionParams в текст идет вставка параметра.

    valField - поле или таблица в которых указываются имена полей в прототипе которые используются для данных.

    formula - поле или таблица в котором указаны функции, которые используются для вычисления данных. ‚ качестве параметров передаются поля, указанные в valField.

    units - поле описывающее единицы измерений выходных данных. ‚ tooltipParams и shopParams это поле используется для подстановки единиц измерения вида units_[units]

    format - поле описывающее формат выходных данных. По умолчанию это максимум 2 знака после запятой с отброшенными нулями.
]]



ShipTooltipParams =
{
    [ 1 ] = {
        name = "effective_health",
        valField = { "hull_health", "shield_max", "hull_resist_kinetic", "hull_resist_emp", "hull_resist_thermal", "shield_resist_kinetic", "shield_resist_emp", "shield_resist_thermal", },
        formula = function( ... )
        local arg = {...}
            local hull_resist_kinetic = arg[ 3 ]
            if hull_resist_kinetic >= 0 then
                hull_resist_kinetic = 1 / ( 1 + hull_resist_kinetic / 100 )
            else
                hull_resist_kinetic = 1 * ( 1 - hull_resist_kinetic / 100 )
            end
            local hull_resist_emp = arg[ 4 ]
            if hull_resist_emp >= 0 then
                hull_resist_emp = 1 / ( 1 + hull_resist_emp / 100 )
            else
                hull_resist_emp = 1 * ( 1 - hull_resist_emp / 100 )
            end
            local hull_resist_thermal = arg[ 5 ]
            if hull_resist_thermal >= 0 then
                hull_resist_thermal = 1 / ( 1 + hull_resist_thermal / 100 )
            else
                hull_resist_thermal = 1 * ( 1 - hull_resist_thermal / 100 )
            end

            local shield_resist_kinetic = arg[ 6 ]
            if shield_resist_kinetic >= 0 then
                shield_resist_kinetic = 1 / ( 1 + shield_resist_kinetic / 100 )
            else
                shield_resist_kinetic = 1 * ( 1 - shield_resist_kinetic / 100 )
            end
            local shield_resist_emp = arg[ 7 ]
            if shield_resist_emp >= 0 then
                shield_resist_emp = 1 / ( 1 + shield_resist_emp / 100 )
            else
                shield_resist_emp = 1 * ( 1 - shield_resist_emp / 100 )
            end
            local shield_resist_thermal = arg[ 8 ]
            if shield_resist_thermal >= 0 then
                shield_resist_thermal = 1 / ( 1 + shield_resist_thermal / 100 )
            else
                shield_resist_thermal = 1 * ( 1 - shield_resist_thermal / 100 )
            end

            local average_hull_resist = ( hull_resist_kinetic + hull_resist_emp + hull_resist_thermal ) / 3
            local average_shield_resist = ( shield_resist_kinetic + shield_resist_emp + shield_resist_thermal ) / 3

            local effective_hull = arg[ 1 ] * ( 1 / average_hull_resist )
            local effective_shield = arg[ 2 ] * ( 1 / average_shield_resist )

            return effective_hull + effective_shield
        end,
        large = true,
        units = "units",
        short = true,
        full = true,
    },

    [ 2 ] = {
        name = "hull_health",
        valField = "hull_health",
        units = "units",
        short = true,
        full = true,
    },
    [ 3 ] = {
        name = "shield_max",
        valField = "shield_max",
        units = "units",
        short = true,
        full = true,
    },
    [ 4 ] = {
        name = "hull_regen",
        valField = "hull_regen",
        units = "units_per_second",
        full = true,
    },
    [ 5 ] = {
        name = "shield_regen",
        valField = "shield_regen",
        units = "units_per_second",
        full = true,
    },
    [ 6 ] = {
        name = "hull_resist_kinetic",
        valField = "hull_resist_kinetic",
        formula = {
            function( ... )
            local arg = {...}
                return arg[ 1 ]
            end,
            function( ... )
            local arg = {...}
                if arg[ 1 ] > 0 then
                    return 100 - ( ( 1 / ( 1 + arg[ 1 ] / 100 ) ) * 100 )
                else
                    return 100 - ( ( 1 * ( 1 - arg[ 1 ] / 100 ) ) * 100 )
                end
            end,
        },
        concat = "%s (%s)",
        units = { "units", "percent", },
        full = true,
    },
    [ 7 ] = {
        name = "shield_resist_kinetic",
        valField = "shield_resist_kinetic",
        formula = {
            function( ... )
            local arg = {...}
                return arg[ 1 ]
            end,
            function( ... )
            local arg = {...}
                if arg[ 1 ] > 0 then
                    return 100 - ( ( 1 / ( 1 + arg[ 1 ] / 100 ) ) * 100 )
                else
                    return 100 - ( ( 1 * ( 1 - arg[ 1 ] / 100 ) ) * 100 )
                end
            end,
        },
        concat = "%s (%s)",
        units = { "units", "percent", },
        full = true,
    },
    [ 8 ] = {
        name = "hull_resist_emp",
        valField = "hull_resist_emp",
        formula = {
            function( ... )
            local arg = {...}
                return arg[ 1 ]
            end,
            function( ... )
            local arg = {...}
                if arg[ 1 ] > 0 then
                    return 100 - ( ( 1 / ( 1 + arg[ 1 ] / 100 ) ) * 100 )
                else
                    return 100 - ( ( 1 * ( 1 - arg[ 1 ] / 100 ) ) * 100 )
                end
            end,
        },
        concat = "%s (%s)",
        units = { "units", "percent", },
        full = true,
    },
    [ 9 ] = {
        name = "shield_resist_emp",
        valField = "shield_resist_emp",
        formula = {
            function( ... )
            local arg = {...}
                return arg[ 1 ]
            end,
            function( ... )
            local arg = {...}
                if arg[ 1 ] > 0 then
                    return 100 - ( ( 1 / ( 1 + arg[ 1 ] / 100 ) ) * 100 )
                else
                    return 100 - ( ( 1 * ( 1 - arg[ 1 ] / 100 ) ) * 100 )
                end
            end,
        },
        concat = "%s (%s)",
        units = { "units", "percent", },
        full = true,
    },
    [ 10 ] = {
        name = "hull_resist_thermal",
        valField = "hull_resist_thermal",
        formula = {
            function( ... )
            local arg = {...}
                return arg[ 1 ]
            end,
            function( ... )
            local arg = {...}
                if arg[ 1 ] > 0 then
                    return 100 - ( ( 1 / ( 1 + arg[ 1 ] / 100 ) ) * 100 )
                else
                    return 100 - ( ( 1 * ( 1 - arg[ 1 ] / 100 ) ) * 100 )
                end
            end,
        },
        concat = "%s (%s)",
        units = { "units", "percent", },
        full = true,
    },
    [ 11 ] = {
        name = "shield_resist_thermal",
        valField = "shield_resist_thermal",
        formula = {
            function( ... )
            local arg = {...}
                return arg[ 1 ]
            end,
            function( ... )
            local arg = {...}
                if arg[ 1 ] > 0 then
                    return 100 - ( ( 1 / ( 1 + arg[ 1 ] / 100 ) ) * 100 )
                else
                    return 100 - ( ( 1 * ( 1 - arg[ 1 ] / 100 ) ) * 100 )
                end
            end,
        },
        concat = "%s (%s)",
        units = { "units", "percent", },
        full = true,
    },
    [ 12 ] = {
        separator = true,
        full = true,
    },
    [ 13 ] = {
        name = "energy_max",
        valField = "energy_max",
        units = "units",
        short = true,
        full = true,
    },
    [ 14 ] = {
        name = "vision_radius",
        valField = "vision_radius",
        units = "metre",
        full = true,
    },
    [ 15 ] = {
        name = "energy_regen",
        valField = "energy_regen",
        formula = function( ... )
        local arg = {...}
            return arg[ 1 ] * 28.5
        end,
        units = "units_per_second",
        full = true,
    },
    [ 16 ] = {
        name = "lock_time",
        valField = "lock_time",
        units = "second",
        negative = true,
        full = true,
    },
    [ 17 ] = {
        separator = true,
        full = true,
    },
    [ 18 ] = {
        name = "max_speed",
        valField = "max_speed",
        units = "metre_per_second",
        short = true,
        full = true,
    },
    [ 19 ] = {
        name = "max_speed_boost",
        valField = { "max_speed", "boost_maxspeed_coef", },
        formula = function( ... )
        local arg = {...}
            return arg[ 1 ] * arg[ 2 ]
        end,
        units = "metre_per_second",
        full = true,
    },
    [ 20 ] = {
        name = "max_rearspeed",
        valField = "max_rearspeed",
        units = "metre_per_second",
        full = true,
    },
    [ 21 ] = {
        name = "boost_energy_cost_per_second",
        valField = "boost_energy_cost_per_second",
        units = "energy_per_second",
        negative = true,
        full = true,
    },
    [ 22 ] = {
        name = "max_xy_speed",
        valField = "max_xspeed",
        units = "metre_per_second",
        full = true,
    },
    [ 23 ] = {
        name = "rot_zmaxspeed",
        valField = "rot_zmaxspeed",
        units = "degree_per_second",
        full = true,
    },
    [ 24 ] = {
        name = "acceleration",
        valField = "acceleration",
        units = "metre_per_second_2",
        full = true,
    },
    [ 25 ] = {
        name = "rot_xy_maxspeed",
        valField = "rot_ymaxspeed",
        units = "degree_per_second",
        full = true,
    },
    -- „алее только ноды зеленых кораблей
    [ 26 ] = {
        name = "rocket_cooldown_coef",
        valField = "rocket_cooldown_coef",
        negative = true,
        units = "percent",
    },
    [ 27 ] = {
        name = "damage_mul",
        valField = "damage_mul",
        units = "percent",
    },
    [ 28 ] = {
        name = "heat_add_mul",
        valField = "heat_add_mul",
        negative = true,
        units = "percent",
    },
    [ 29 ] = {
        name = "heat_sub_mul",
        valField = "heat_sub_mul",
        units = "percent",
    },
}



--[[
‚се корабли имеют единый формат описания добавочных параметров. ‚се параметры перечисленные в таблице ShipTooltipParamsDescription ищутсЯ и,
если они существуют то берется строка с префиксом "ship_desc_bonus_" плюс name параметра и все они объединяются в единую строку через пробел.

‚ строки описаниЯ добавочных параметров можно подставлять плейсхолдер названия айтем группы по ее идентификатору с префиксом "itemGroup_"
Например: "Увеличивает воздействие модулей группы $itemGroup_DEPLOY$."

‘ами параметры вставляются по имени через $name$.
]]

ShipTooltipParamsDescription =
{
	---Generic
    {
        name = "spell_propulsion_jam_param_mul",
        valField = "spell_propulsion_jam_param_mul",
        units = "percent",
    },
    {
        name = "spell_propulsion_jam_duration_mul",
        valField = "spell_propulsion_jam_duration_mul",
        units = "percent",
    },
    {
        name = "spell_logistic_param_mul",
        valField = "spell_logistic_param_mul",
        units = "percent",
    },
	{
        name = "lock_time_mul",
        valField = "lock_time_mul",
        units = "percent",
    },
    {
        name = "beacon_capture_mul",
        valField = "beacon_capture_mul",
        units = "percent",
    },
	--From ShipSpecBonus
	---PRIMARY_DAMAGE
	{
        name = "damage_mul",
        valField = "damage_mul",
        units = "percent",
    },
	{
        name = "plasma_damage_mul",
        valField = "plasma_damage_mul",
        units = "percent",
    },
	{
        name = "railgun_damage_mul",
        valField = "railgun_damage_mul",
        units = "percent",
    },
	{
        name = "laser_damage_mul",
        valField = "laser_damage_mul",
        units = "percent",
    },
	---PRIMARY_RANGE 
	{
        name = "max_range_mul",
        valField = "max_range_mul",
        units = "percent",
    },
	---PRIMARY_CRIT
	{
        name = "crit_chance_add",
        valField = "crit_chance_add",
        units = "percent",
    },
	---PRIMARY_CRIT_DAMAGE
	{
        name = "crit_damage_add",
        valField = "crit_damage_add",
        units = "percent",
    },
	---PRIMARY_HEAT_SUB
	{
        name = "heat_sub_mul",
        valField = "heat_sub_mul",
        units = "percent",
    },
	---PRIMARY_HEAT_ADD
	{
		name = "heat_add_mul",
		valField = "heat_add_mul",
		negative = true,
		units = "percent",
	},
	---RAILGUN_BOOST
	{
        name = "railgun_dispersion_mul",
        valField = "railgun_dispersion_mul",
        units = "percent",
		negative = true,
    },
	{
        name = "railgun_projectile_speed_mul",
        valField = "railgun_projectile_speed_mul",
        units = "percent",
    },
	---PLASMA_BOOST
	{
        name = "plasma_dispersion_mul",
        valField = "plasma_dispersion_mul",
        units = "percent",
		negative = true,
    },
	{
	    name = "plasma_projectile_speed_mul",
        valField = "plasma_projectile_speed_mul",
        units = "percent",
    },
	{
	    name = "projectile_speed_mul",
        valField = "projectile_speed_mul",
        units = "percent",
    },
	---ROCKET_COOLDOWN
	{
	    name = "rocket_cooldown_coef_mul",
        valField = "rocket_cooldown_coef_mul",
		negative = true,
        units = "percent",
    },
	---VISION 
	{
	    name = "vision_radius_mul",
        valField = "vision_radius_mul",
        units = "percent",
    },
	{
	    name = "swarm_damage_mul",
        valField = "swarm_damage_mul",
        units = "percent",
    },
	{
	    name = "swarm_defence_add",
        valField = "swarm_spell1_param_add",
        units = "unit",
    },
	---ENERGY_REGEN and ENERGY_MAX
	{
	    name = "energy_regen_mul",
        valField = "energy_regen_mul",
        units = "percent",
    },
	---BOOST_ENERGY
	{
	    name = "boost_energy_cost_per_second_mul",
        valField = "boost_energy_cost_per_second_mul",
		negative = true,
        units = "percent",
    },
	---ROTATION_SPEED
	{
	    name = "rot_speed_mul",
        valField = "rot_speed_mul",
        units = "percent",
    },
	---STRAFE_SPEED
	{
	    name = "strafe_speed_mul",
        valField = "strafe_speed_mul",
        units = "percent",
    },
	---SPEED
	{
	    name = "max_speed_mul",
        valField = "max_speed_mul",
        units = "percent",
    },
	---HULL_RESIST_ALL = HULL_RESIST_THERMAL + HULL_RESIST_KINETIC + HULL_RESIST_EMP
	{
	    name = "hull_resist_add",
        valField = "hull_resist_add",
        units = "unit",
    },
	{
	    name = "hull_resist_thermal_add",
        valField = "hull_resist_thermal_add",
        units = "unit",
    },
	{
	    name = "hull_resist_kinetic_add",
        valField = "hull_resist_kinetic_add",
        units = "unit",
    },
	{
	    name = "hull_resist_emp_add",
        valField = "hull_resist_emp_add",
        units = "unit",
    },
	---SHIELD_RESIST_ALL = SHIELD_RESIST_THERMAL + SHIELD_RESIST_KINETIC  + SHIELD_RESIST_EMP 
	{
	    name = "shield_resist_add",
        valField = "shield_resist_add",
        units = "unit",
    },
	{
	    name = "shield_resist_thermal_add",
        valField = "shield_resist_thermal_add",
        units = "unit",
    },
	{
	    name = "shield_resist_kinetic_add",
        valField = "shield_resist_kinetic_add",
        units = "unit",
    },
	{
	    name = "shield_resist_emp_add",
        valField = "shield_resist_emp_add",
        units = "unit",
    },
	---HP_ALL_PREMIUM
	{
	    name = "hull_health_mul",
        valField = "hull_health_mul",
        units = "percent",
	},
	{
	    name = "shield_max_mul",
        valField = "shield_max_mul",
        units = "percent",
    },
	---SCOUT_PARAM
	{
        name = "spell_emission_param_mul",
        valField = "spell_emission_param_mul",
        units = "percent",
    },
	---SCOUT_RANGE
	{
        name = "spell_emission_range_mul",
        valField = "spell_emission_range_mul",
        units = "percent",
    },
	---SCOUT_COOLDOWN
	{
        name = "module_emission_cooldown_mul",
        valField = "module_emission_cooldown_mul",
		negative = true,
        units = "percent",
    },
	--VISION
	---ECM_RANGE
	{
        name = "spell_ecm_range_mul",
        valField = "spell_ecm_range_mul",
        units = "percent",
    },
	---ECM_ENERGY
	{
        name = "module_ecm_energy_cost_mul",
        valField = "module_ecm_energy_cost_mul",
		negative = true,
        units = "percent",
    },
	---ECM_DURATION
	{
        name = "spell_ecm_duration_mul",
        valField = "spell_ecm_duration_mul",
        units = "percent",
    },
	---RECON_COOLDOWN
	{
        name = "module_recon_cooldown_mul",
        valField = "module_recon_cooldown_mul",
		negative = true,
        units = "percent",
    },
	---RECON_PARAM
	{
        name = "spell_recon_param_mul",
        valField = "spell_recon_param_mul",
        units = "percent",
    },
	---RECON_ENERGY
	{
        name = "module_recon_energy_cost_mul",
        valField = "module_recon_energy_cost_mul",
		negative = true,
        units = "percent",
    },
	---ATTACK_ENERGY
	{
        name = "module_target_painter_energy_cost_mul",
        valField = "module_target_painter_energy_cost_mul",
		negative = true,
        units = "percent",
    },
	---ATTACK_COOLDOWN
	{
        name = "module_target_painter_cooldown_mul",
        valField = "module_target_painter_cooldown_mul",
		negative = true,
        units = "percent",
    },
	---COMMAND_PARAM and TACKLER_PARAM
	{
        name = "spell_command_param_mul",
        valField = "spell_command_param_mul",
        units = "percent",
    },
	---COMMAND_RANGE
	 {
        name = "spell_command_range_mul",
        valField = "spell_command_range_mul",
        units = "percent",
    },
	---COMMAND_ENERGY
	 {
        name = "module_command_energy_cost_mul",
        valField = "module_command_energy_cost_mul",
		negative = true,
        units = "percent",
    },
	---COMMAND_COOLDOWN
	 {
        name = "module_command_cooldown_mul",
        valField = "module_command_cooldown_mul",
		negative = true,
        units = "percent",
    },
	---TACKLER_RANGE
	{
        name = "spell_propulsion_jam_range_mul",
        valField = "spell_propulsion_jam_range_mul",
        units = "percent",
    },
	---TACKLER_ENERGY
	{
        name = "module_propulsion_jam_energy_cost_mul",
        valField = "module_propulsion_jam_energy_cost_mul",
		negative = true,
        units = "percent",
    },
	---SNIPER_COOLDOWN 
	{
        name = "module_logistic_cooldown_mul",
        valField = "module_logistic_cooldown_mul",
		negative = true,
        units = "percent",
    },
	---SNIPER_ENERGY 
	{
        name = "module_logistic_energy_cost_mul",
        valField = "module_logistic_energy_cost_mul",
		negative = true,
        units = "percent",
    },
	---ENGINEER_ENTITY 
	{
		name = "module_deploy_entity_health_mul",
		valField = "module_deploy_entity_health_mul",
		units = "percent",
	},
	---ENGINEER_COOLDOWN 
	 {
        name = "module_deploy_cooldown_mul",
        valField = "module_deploy_cooldown_mul",
		negative = true,
        units = "percent",
    },
	---ENGINEER_ENERGY 
	{
        name = "module_deploy_energy_cost_mul",
        valField = "module_deploy_energy_cost_mul",
		negative = true,
        units = "percent",
    },
	---ENGINEER_PARAM 
	{
		name = "spell_deploy_param_mul",
		valField = "spell_deploy_param_mul",
		units = "percent",
	},
	---GUARD_RANGE
	{
        name = "spell_guard_range_mul",
        valField = "spell_guard_range_mul",
        units = "percent",
    },
	---GUARD_COOLDOWN
	{
        name = "module_guard_cooldown_mul",
        valField = "module_guard_cooldown_mul",
		negative = true,
        units = "percent",
    },
	---GUARD_ENERGY
	{
        name = "module_guard_energy_cost_mul",
        valField = "module_guard_energy_cost_mul",
		negative = true,
        units = "percent",
    },
	---ECM_BASE
	{
        name = "energy_max_mul",
        valField = "energy_max_mul",
		units = "percent",
    },
	
	-- DESTROYER
	---OVERSEER_PARAM
	{
		name = "spell_overseer_param_mul",
		valField = "spell_overseer_param_mul",
		--negative = true,
		units = "percent",
	},
	---OVERSEER_COOLDOWN
	{
		name = "spell_overseer_cooldown_mul",
		valField = "spell_overseer_cooldown_mul",
		negative = true,
		units = "percent",
	},
	---OVERSEER_ENERGY
	{
		name = "module_overseer_energy_cost_mul",
		valField = "module_overseer_energy_cost_mul",
		negative = true,
		units = "percent",
	},
	{
        name = "rocket_damage_coef_mul",
        valField = "rocket_damage_coef_mul",
        units = "percent",
    },
	{
        name = "special_cooldown_mul",
        valField = "special_cooldown_mul",
		negative = true,
        units = "percent",
        negative = true,
    },
	{
        name = "dispersion_mul",
        valField = "dispersion_mul",
		negative = true,
        units = "percent",
    },
	{
        name = "hull_regen_add",
        valField = "hull_regen_add",
        units = "units",
    },
	{
        name = "weakness_area_damage_coef",
        valField = "weakness_area_damage_coef",
        units = "units",
    },
}



NodeTooltip =
{
	{
         name = "shield_regen_mul",
         valField = "shield_regen_mul",
         units = "percent",
    },
	{
         name = "rocket_damage_coef_mul",
         valField = "rocket_damage_coef_mul",
         units = "percent",
    },
    {
        name = "strafe_accel_mul",
        valField = "strafe_accel_mul",
        units = "percent",
    },
    {
        name = "module_deploy_energy_cost_mul",
        valField = "module_deploy_energy_cost_mul",
        units = "percent",
        negative = true,
    },
	{
        name = "crowd_control_coef_mul",
        valField = "crowd_control_coef_mul",
        units = "percent",
        negative = true,
    },
	{
        name = "module_deploy_cooldown_mul",
        valField = "module_deploy_cooldown_mul",
        units = "percent",
        negative = true,
    },
	{
         name = "laser_damage_mul",
         valField = "laser_damage_mul",
         units = "percent",
    },
	{
         name = "railgun_damage_mul",
         valField = "railgun_damage_mul",
         units = "percent",
    },
    {
         name = "shield_max_add",
         valField = "shield_max_add",
         units = "units",
    },
    {
         name = "hull_health_add",
         valField = "hull_health_add",
         units = "units",
    },
    {
        name = "max_speed_mul",
        valField = "max_speed_mul",
        units = "percent",
    },
    {
        name = "shield_max_mul",
        valField = "shield_max_mul",
        units = "percent",
    },
    {
        name = "hull_health_mul",
        valField = "hull_health_mul",
        units = "percent",
    },
    {
        name = "strafe_speed_mul",
        valField = "strafe_speed_mul",
        units = "percent",
    },
    {
        name = "rot_speed_mul",
        valField = "rot_speed_mul",
        units = "percent",
    },
    {
        name = "energy_max_mul",
        valField = "energy_max_mul",
        units = "percent",
    },
    {
        name = "energy_regen_mul",
        valField = "energy_regen_mul",
        units = "percent",
    },
    {
        name = "vision_radius_mul",
        valField = "vision_radius_mul",
        units = "percent",
    },
	{
	    name = "swarm_damage_mul",
        valField = "swarm_damage_mul",
        units = "percent",
    },
	{
	    name = "swarm_speed_mul",
        valField = "swarm_speed_mul",
        units = "percent",
    },
	{
	    name = "swarm_health_mul",
        valField = "swarm_health_mul",
        units = "percent",
    },
	{
	    name = "swarm_damage_to_owner_healing_coef",
        valField = "swarm_damage_to_owner_healing_coef",
        units = "percent",
    },
	{
	    name = "swarm_regen_add",
        valField = "swarm_regen_add",
        units = "units",
    },
	{
        name = "hull_regen_add",
        valField = "hull_regen_add",
        units = "units",
    },
    {
        name = "hull_resist_thermal_add",
        valField = "hull_resist_thermal_add",
        units = "units",
    },
	{
	    name = "spell_overseer_param_mul",
        valField = "spell_overseer_param_mul",
        units = "percent",
    },
    
    {
        name = "heat_add_mul",
        valField = "heat_add_mul",
        units = "percent",
        negative = true,
    },
    {
        name = "lock_time_mul",
        valField = "lock_time_mul",
        units = "percent",
        negative = true,
    },
    {
        name = "damage_mul",
        valField = "damage_mul",
        units = "percent",
    },
    {
        name = "rocket_cooldown_coef_mul",
        valField = "rocket_cooldown_coef_mul",
        units = "percent",
    },
	{
        name = "beacon_capture_mul",
        valField = "beacon_capture_mul",
        units = "percent",
    },
	{
        name = "crit_chance_add",
        valField = "crit_chance_add",
        units = "percent",
    },
	{
        name = "module_emission_cooldown_mul",
        valField = "module_emission_cooldown_mul",
        units = "percent",
    },
	{
        name = "boost_maxspeed_coef_mul",
        valField = "boost_maxspeed_coef_mul",
        units = "percent",
    },
    {
        name = "boost_energy_cost_per_second_mul",
        valField = "boost_energy_cost_per_second_mul",
        units = "percent",
        negative = true,
    },
	{
	    name = "hull_resist_kinetic_add",
        valField = "hull_resist_kinetic_add",
        units = "units",
    },
		{
	    name = "shield_resist_add",
        valField = "shield_resist_add",
        units = "units",
    },
	{
	    name = "activate_entity_health_mul",
        valField = "activate_entity_health_mul",
        units = "percent",
	},
	{
	    name = "optimal_range_mul",
        valField = "optimal_range_mul",
        units = "percent",
	},
	{
	    name = "max_range_mul",
        valField = "max_range_mul",
        units = "percent",
	},
	{
        name = "plasma_damage_mul",
        valField = "plasma_damage_mul",
        units = "percent",
    },
	{
        name = "heat_sub_mul",
        valField = "heat_sub_mul",
        units = "percent",
    },
	{
        name = "hull_resist_all",
        valField = "hull_resist_thermal_add",
        units = "units",
    },
	{
        name = "crit_damage_add",
        valField = "crit_damage_add",
        units = "percent",
    },	
	{
        name = "strafe_speed_accel_mul",
        valField = "strafe_speed_mul",
        units = "percent",
    },		
	{
        name = "spec_cooldown_mul",
        valField = "special_cooldown_mul",
        units = "percent",
    },
}
