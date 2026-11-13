--[[
ItemTooltips - таблица с описаниями характеристик для отображения во всплывающей подсказке и в магазине

	Индексами служат ItemSubtype.вещей

	tooltipParams - вложенная таблица описывающая строки характеристик для всплывающей подсказки

	name - название характеристики
		По этому полю в tooltipParams подставляется иконка вида param_[name] и строка вида param_[name]
		По этому полю в descriptionParams в текст идет вставка параметра
		
	large - большой шрифт
	
	subPrototype - поле или таблица в которых прописываются поля прототипов дефов, из которых надо брать поля для valField ИЛИ spellPrototype

	spellPrototype - поле или таблица в которых прописываются поля прототипов спеллов из которых надо брать поля для valField
	при наличии subPrototype spellPrototype ищется там
	
	valField - поле или таблица в которых указываются имена полей в прототипе которые используются для данных

	formula - поле или таблица в котором указаны функции, которые используются для вычисления данных. В качестве параметров передаются поля, указанные в valField
	
	concat - склеивание строк по шаблону

	units - поле описывающее единицы измерений выходных данных. В tooltipParams это поле используется для подстановки единиц измерения вида units_[units] и приведения к нужному виду
	В descriptionParams единицы измерения не подстанавливаются, но число приводится к нужному виду (к примеру, проценты)

	format - поле описывающее формат выходных данных  По умолчанию это максимум 2 знака после запятой с отброшенными нулями
	
	negative - поле, меняющее механизм окраски на противоположный (меньше - лучше)

	absValue - отбрасывать знак числа

	invisible - не показывать тултип, использовалось для экспорта в вики
	
	descriptionParams - вложенная таблица описывающая характеристики для вставки в текст всплывающей подсказки
	В Def_desc прописать имя характеристики между знаками '$'

Если требуется двойной переход Деф->Деф->Поле или Спелл->Спелл->Поле, то обращаемся через функцию

	{
		name = "cloud_duration",
		spellPrototype = "deactivate_spell", --Взять спелл из поля deactivate_spell
		valField = "target_spell", --Взять в нём поле target_spell
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].duration --Получить значение поля
		end,
		units = "second",
	},

	ВНИМАНИЕ!!! Поля, вычисленные подобным образом, не показывают наложенные модификаторы.
	Крайне нежелательно использовать.
]]

--############################################# [ !DO NOT TOUCH! ] #############################################--

ShipGeneratedFreeSynergy			= 5
ShipGeneratedFreeSynergyPremium		= 20
ShipGeneratedSelfSynergy			= 100
ShipGeneratedSelfSynergyPremium		= 100

ItemTooltips = {}

ItemTooltipsCompareEqualParams =
{
	weapon_damage_kinetic_dps	= { "weapon_damage_thermal_dps", "weapon_damage_emp_dps" },
	weapon_damage_thermal_dps	= { "weapon_damage_kinetic_dps", "weapon_damage_emp_dps" },
	weapon_damage_emp_dps		= { "weapon_damage_kinetic_dps", "weapon_damage_thermal_dps" },
	weapon_damage_kinetic		= { "weapon_damage_thermal", "weapon_damage_emp" },
	weapon_damage_thermal		= { "weapon_damage_kinetic", "weapon_damage_emp" },
	weapon_damage_emp			= { "weapon_damage_kinetic", "weapon_damage_thermal" },
}

--############################################# [ PREDEFINED TOOLTIPS ] #############################################--

ItemTooltip =
{
	cooldown =
	{
		name = "cooldown", --Перезарядка
		valField = "cooldown",
		units = "second",
		negative = true,
	},
}

------------------------------ [ MODULES ] ------------------------------

ItemTooltip.Module =
{
	hull_cost =
	{
		name = "hull_cost", --Повреждение носителя
		valField = "hull_cost",
		units = "damage",
		negative = true,
	},
	energy_cost =
	{
		name = "energy_cost", --Энергопотребление
		valField = "energy_cost",
		units = "energy",
		negative = true,
	},
	activate_cost =
	{
		name = "energy_cost", --Энергопотребление
		valField = "energy_activate",
		units = "energy",
		negative = true,
	},
	energy_cost_per_second =
	{
		name = "energy_cost_per_second", --Энергопотребление в секунду
		valField = "energy_cost_per_second",
		units = "energy_per_second",
		negative = true,
	},
	hull_cost_per_second =
	{
		name = "hull_cost_per_second", --корпусопотребление в секунду
		valField = "hull_cost_per_second",
		units = "units_per_second",
		negative = false,
	},	
	hull_cost_per_second_1 =
	{
		name = "hull_cost_per_second", --корпусопотребление в секунду
		valField = "hull_cost_per_second",
		units = "units_per_second",
		negative = true,
	},	
	work_time =
	{
		name = "duration", --Время работы
		valField = "work_time",
		units = "second",
	},
	duration =
	{
		name = "duration", --Время работы
		valField = "duration",
		units = "second",
	},
	charge_cooldown =
	{
		name = "charge_cooldown",
		valField = "ammo_regen_time",
		units = "second",
		negative = true,
	},
	range =
	{
		name = "max_range",
		valField = "range",
		units = "metre",
	},
	ammo =
	{
		name = "charge_max",
		valField = "ammo",
		units = "pieces",
	},
	aura_time =
	{
		name = "duration", --Время работы
		spellPrototype = "spell",
		valField = "duration",
		units = "second",
	},
}

ItemTooltip.Module.huge =
{
	module_health = {
		name = "module_health", --Прочность модуля
		valField = "health",
		units = "units",
	},
	damage_to_host = {
		name = "module_damage_to_host", --Урон при уничтожении
		valField = "damage_to_host",
		units = "damage",
		negative = true,
	},
	module_repair_time = {
		name = "module_repair_time", --Время восстановления модуля при уничтожении
		valField = {"health", "health_regen"},
		formula = function( ... )
			local arg = { ... }
			return arg[1] / arg[2]
		end,
		units = "second",
	},
}

ItemTooltip.Module.warhead =
{
	flight_range =
	{
		name = "rocket_flight_range", -- Расстояние полета
		subPrototype = "projectile",
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			return Def[rocket].max_range
		end,
		units = "metre",
	},
	flight_speed =
	{
		name = "rocket_flight_speed", -- Скорость полета
		subPrototype = "projectile",
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			return Def[rocket].speed
		end,
		units = "metre_per_second",
	},
	damage_cluster_range =
	{
		name = "warhead_damage_range", --Радиус взрыва боеголовки
		subPrototype = "projectile",
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			local death_entity = Def[rocket].death_entity
			local blast = Def[death_entity].explosion_blast_wave
			return Def[blast].blast_maxDistance
		end,
		units = "metre",
	},
		flight_rot_speed =
	{
		name = "rocket_flight_rot_speed", -- Расстояние полета
		subPrototype = "projectile",
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			return Def[rocket].angular_velocity
		end,
		units = "degree_per_second",
	},
	aura_range =
	{
		name = "blast_maxDistance", --Радиус взрыва
		subPrototype = "projectile",
		valField = "spell",
		formula = function( ... )
			local arg = { ... }
			local castSpell = Spell[arg[1]]
			--local spellDef = castSpell.spells[1]
			local spell2 = Spell[castSpell.spells[1]]
			return spell2.aura_range
		end,
		units = "metre",
	},
}

------------------------------ [ WEAPONS ] ------------------------------

ItemTooltip.Weapon =
{
	range =
	{
		name = "weapon_range_max", --Дальность стрельбы (макс.)
		valField = "max_range",
		units = "metre",
	},
	range_min_max =
	{
		name = "weapon_range_max", --Дальность стрельбы (макс.)
		valField = { "max_range", "max_range_max" },
		concat = "%s - %s",
		units = "metre",
	},
	angle_of_view =
	{
		name = "weapon_angle_of_view", --Угол захвата цели
		valField = "angle_of_view",
		units = "degree",
	},
	charge =
	{
		name = "weapon_charge", --Накопление заряда
		valField = "charge_max",
		units = "charge",
	},
	rot_speed =
	{
		name = "weapon_barrel_rot_speed", --Скорость поворота стволов
		valField = "barrel_rot_speed",
		units = "degree_per_second",
	},
	rot_charge_slowdown =
	{
		name = "barrel_rot_speed_fire", --Замедление при накоплении заряда
		valField = "barrel_rot_speed_fire",
		units = "degree_per_second",
		negative = true,
	},
	dispersion =
	{
		name = "weapon_dispersion", --Разброс
		valField = "dispersion",
		units = "degree",
		format = "%3.2f",
		negative = true,
	},
	dispersion_min_max =
	{
		name = "weapon_dispersion_min_max", --Разброс (от-до)
		valField = { "dispersion", "dispersion_max", },
		concat = "%s - %s",
		units = "degree",
		format = "%3.2f",
		negative = true,
	},
	full_heat_cooldown =
	{
		name = "weapon_heat_max_min_time", --Полный перегрев/остывание
		valField = { "heat_max", "heat_add", "heat_sub" },
		formula = {
			function( ... )
			local arg = { ... }
				return arg[1] / arg[2]
			end,
			function( ... )
			local arg = { ... }
				return arg[1] / arg[3]
			end,
		},
		concat = "%s / %s",
		units = "second",
		negative = { false, true, },
	},
	full_heat_cooldown_chargeBubble =
	{
		name = "weapon_heat_max_min_time", --Полный перегрев/остывание
		valField = { "heat_max", "heat_add", "heat_sub", "charge_levels" },
		formula = {
			function( ... )
			local arg = { ... }
				local heat_add = arg[2] * arg[4][1].heat_add_mul
				if arg[4][1].heat_add_mul == 0 then 
					heat_add = arg[2]
				end
				return arg[1] / heat_add * 2.5
			end,
			function( ... )
			local arg = { ... }
				local heat_add = arg[2] * arg[4][2].heat_add_mul
				if arg[4][2].heat_add_mul == 0 then 
					heat_add = arg[2]
				end
				return arg[1] / heat_add * 2.5
			end,
			function( ... )
			local arg = { ... }
				return arg[1] / arg[3]
			end,
		},
		concat = "%s - %s / %s",
		units = "second",
		negative = { false, false, true, },
	},
	energy_cost_per_second =
	{
		name = "energy_cost_per_second", --Энергопотребление в секунду
		valField = { "shot_energy_cost", "fire_rate" },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2] / 60
		end,
		units = "energy_per_second",
		negative = true,
	},
	heal_per_second =
	{
		name = "heal_per_second", --Восстановление корпуса в секунду
		valField = "heal_per_second",
		units = "damage_per_second",
	},
}

ItemTooltip.Weapon.dps =
{
	plain =
	{
		name = "weapon_damage_dps", --Урон в секунду
		large = true,
		valField = { "damage", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2] / 60
		end,
		units = "damage_per_second",
	},
	kinetic =
	{
		name = "weapon_damage_kinetic_dps", --Урон в секунду (кинетич.)
		large = true,
		valField = { "damage_kinetic", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2] / 60
		end,
		units = "damage_per_second",
	},
	kinetic_2 =
	{
		name = "weapon_damage_kinetic_dps", --Урон в секунду (термич.)
		large = true,
		valField = { "damage_kinetic", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return (arg[1] * arg[2] / 60) * 4
		end,
		units = "damage_per_second",
	},	
	kinetic_min_max_rate =
	{
		name = "weapon_damage_kinetic_dps", --Урон в секунду (кинетич.)
		large = true,
		valField = { "damage_kinetic", "fire_rate", "fire_rate_max", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * arg[3] / 60
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
	kinetic_min_max_rate_2 =
	{
		name = "weapon_damage_kinetic_dps_2", --Урон в секунду (кинетич.)
		large = true,
		valField = { "damage_kinetic", "fire_rate", "fire_rate_max", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * arg[3] / 60
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
	kinetic_min_max_charge =
	{
		name = "weapon_damage_kinetic_dps_2", --Урон в секунду|(кинетич.)
		large = true,
		valField = { "damage_kinetic", "fire_rate", "charge_levels", },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][1].time > 0 then
					time = arg[3][1].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][ #arg[3] ].time > 0 then
					time = arg[3][ #arg[3] ].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] ].damage_mul ) / time
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	kinetic_charge =
	{
		name = "weapon_damage_kinetic_dps_2", --Урон в секунду|(кинетич.)
		large = true,
		valField = { "damage_kinetic", "charge_max", "damage_charge_deminishing", "fire_rate",},
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[4] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + (arg[2] - 1) * arg[3] ) / arg[2]
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	emp =
	{
		name = "weapon_damage_emp_dps", --Урон в секунду (электромагн.)
		large = true,
		valField = { "damage_emp", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2] / 60
		end,
		units = "damage_per_second",
	},
	emp_plain =
	{
		name = "weapon_damage_emp_dps", --Урон в секунду, ЭМ
		valField = "damage_emp",
		units = "units",
	},
	emp_min_max_rate =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_emp", "fire_rate", "fire_rate_max", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * arg[3] / 60
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
	emp_min_max_plain =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_emp", "fire_rate", "damage_emp_max", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[3] * arg[2] / 60
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
	emp_min_max_charge =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_emp", "fire_rate", "charge_levels", },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][1].time > 0 then
					time = arg[3][1].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][ #arg[3] ].time > 0 then
					time = arg[3][ #arg[3] ].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] ].damage_mul ) / time
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	emp_min_max_charge2 =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_emp", "fire_rate", "charge_levels", },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][1].time > 0 then
					time = arg[3][1].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
			end,
			-- function( ... )
				-- local arg = { ... }
				-- local time = 1
				-- if arg[3][ #arg[3] ].time > 0 then
					-- time = arg[3][ #arg[3] ].time + time
				-- end
				-- return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] ].damage_mul ) / time
			-- end,
		},
		--concat = "%s / %s",
		units = "damage_per_second",
	},
	
	emp_charge =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду (электромаг.)
		large = true,
		valField = { "damage_emp", "charge_max", "damage_charge_deminishing", "fire_rate",},
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[4] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + (arg[2] - 1) * arg[3] ) / arg[2]
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	emp_min_max_damage =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_emp", "fire_rate", "damage_emp_max", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[3] * arg[2] / 60
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
	thermal =
	{
		name = "weapon_damage_thermal_dps", --Урон в секунду (термич.)
		large = true,
		valField = { "damage_thermal", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2] / 60
		end,
		units = "damage_per_second",
	},
	thermal_2 =
	{
		name = "weapon_damage_thermal_dps", --Урон в секунду (термич.)
		large = true,
		valField = { "damage_thermal", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return (arg[1] * arg[2] / 60) * 4
		end,
		units = "damage_per_second",
	},
	thermal_min_max =
	{
		name = "weapon_damage_thermal_dps_2", --Урон в секунду|(термич.)
		large = true,
		valField = { "damage_thermal", "fire_rate", "damage_thermal_max" },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[3] * arg[2] / 60
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
	thermal_min_max_rate =
	{
		name = "weapon_damage_thermal_dps_2", --Урон в секунду (термич.)
		large = true,
		valField = { "damage_thermal", "fire_rate", "fire_rate_max", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * arg[3] / 60
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
	thermal_min_max_charge =
	{
		name = "weapon_damage_thermal_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_thermal", "fire_rate", "charge_levels", },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][1].time > 0 then
					time = arg[3][1].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][ #arg[3] ].time > 0 then
					time = arg[3][ #arg[3] ].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] ].damage_mul ) / time
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	thermal_min_max_spell =
	{
		name = "weapon_damage_thermal_dps_2", --Урон в секунду (термич.)
		large = true,
		valField = { "damage_thermal", "fire_rate", "spell_on_max_speed_plus", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				local spell = Spell[ arg[3] ]
				return arg[1] * arg[2] * (1 + spell.aura_param * spell.max_stacks) / 60
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
	thermal_charge =
	{
		name = "weapon_damage_thermal_dps_2", --Урон в секунду (термич.)
		large = true,
		valField = { "damage_thermal", "charge_max", "damage_charge_deminishing", "fire_rate",},
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[4] / 60
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + (arg[2] - 1) * arg[3] ) / arg[2] * arg[4] / 60
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	greenspheregun =
	{
		name = "weapon_GreenSphereGun_dps", --Урон в секунду (термич.)
		large = true,
		valField = { "damage_emp", "damage_kinetic", "damage_thermal", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return (arg[1] + arg[2] + arg[3]) * arg[4] / 60
		end,
		units = "damage_per_second",
	},
}

ItemTooltip.Weapon.damage =
{
	plain =
	{
		name = "weapon_damage", --Урон
		valField = "damage",
		units = "damage",
	},
	kinetic =
	{
		name = "weapon_damage_kinetic", --Урон (кинетич.)
		valField = "damage_kinetic",
		units = "damage",
	},
	kinetic_large =
	{
		name = "weapon_damage_kinetic", --Урон (кинетич.)
		large = true,
		valField = "damage_kinetic",
		units = "damage",
	},
	kinetic_large2 =
	{
		name = "weapon_damage_kinetic_1_rocket", --Урон (кинетич.)
		large = true,
		valField = "damage_kinetic",
		units = "damage",
	},	
	kinetic_min_max_charge =
	{
		name = "weapon_damage_kinetic", --Урон (кинетич.)
		valField = { "damage_kinetic", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local t1 = arg[1] * ( 1 + arg[2][1].damage_mul )
				return t1
			end,
			function( ... )
				local arg = { ... }
				local t2 = arg[1] * ( 1 + arg[2][ #arg[2] ].damage_mul )
				return t2
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},
	kinetic_charge =
	{
		name = "weapon_damage_kinetic", --Урон (кинетич.)
		valField = { "damage_kinetic", "charge_max", "damage_charge_deminishing", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1]
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + (arg[2] - 1) * arg[3] )
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},
	kinetic_charge_2 =
	{
		name = "weapon_damage_kinetic", --Урон (кинетич.)
		large = true,
		valField = { "damage_kinetic", "charge_max", "damage_charge_deminishing", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1]
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + (arg[2] - 1) * arg[3] )
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},	
	thermal =
	{
		name = "weapon_damage_thermal", --Урон (термич.)
		valField = "damage_thermal",
		units = "damage",
	},
	thermal_large =
	{
		name = "weapon_damage_thermal", --Урон (термич.)
		large = true,
		valField = "damage_thermal",
		units = "damage",
	},
	thermal_min_max =
	{
		name = "weapon_damage_thermal", --Урон (термич.)
		valField = { "damage_thermal", "damage_thermal_max", },
		concat = "%s - %s",
		units = "damage",
	},
	thermal_min_max_charge =
	{
		name = "weapon_damage_thermal", --Урон (термич.)
		valField = { "damage_thermal", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local t1 = arg[1] * ( 1 + arg[2][1].damage_mul )
				return t1
			end,
			function( ... )
				local arg = { ... }
				local t2 = arg[1] * ( 1 + arg[2][ #arg[2] ].damage_mul )
				return t2
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},
	thermal_min_max_spell =
	{
		name = "weapon_damage_thermal", --Урон (термич.)
		valField = { "damage_thermal", "spell_on_max_speed_plus" },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1]
			end,
			function( ... )
				local arg = { ... }
				local spell = Spell[ arg[2] ]
				return arg[1] * (1 + spell.aura_param * spell.max_stacks)
			end,
		},
		concat = "%s - %s",
		units = "damage",
	},
	thermal_charge =
	{
		name = "weapon_damage_thermal", --Урон (термич.)
		valField = { "damage_thermal", "charge_max", "damage_charge_deminishing", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1]
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + (arg[2] - 1) * arg[3] )
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},
	emp =
	{
		name = "weapon_damage_emp", --Урон (электромагн.)
		valField = "damage_emp",
		units = "damage",
	},
	emp_large =
	{
		name = "weapon_damage_emp", --Урон (электромагн.)
		large = true,
		valField = "damage_emp",
		units = "damage",
	},
	blastwave_emp_large =
	{
		name = "weapon_damage_emp", --Урон (электромагн.)
		large = true,
		subPrototype = "Projectile",
		valField = "explosion_blast_wave",
		formula = function ( ... )
			local arg = { ... }
			return arg[1].damage_emp
		end,
		units = "damage",
	},
	emp_min_max =
	{
		name = "weapon_damage_emp", --Урон (электромагн.)
		valField = { "damage_emp", "damage_emp_max", },
		concat = "%s - %s",
		units = "damage",
	},
	emp_max_min =
	{
		name = "weapon_damage_emp", --Урон (электромагн.)
		valField = { "damage_emp_max", "damage_emp", },
		concat = "%s - %s",
		units = "damage",
	},
	emp_min_max_charge =
	{
		name = "weapon_damage_emp", --Урон (электромагн.)
		valField = { "damage_emp", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local t1 = arg[1] * ( 1 + arg[2][1].damage_mul )
				return t1
			end,
			function( ... )
				local arg = { ... }
				local t2 = arg[1] * ( 1 + arg[2][ #arg[2] ].damage_mul )
				return t2
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},
	emp_min_max_charge2 =
	{
		name = "weapon_damage_emp", --Урон (электромагн.)
		valField = { "damage_emp", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local t1 = arg[1] * ( 1 + arg[2][1].damage_mul )
				return t1
			end,
			-- function( ... )
				-- local arg = { ... }
				-- local t2 = arg[1] * ( 1 + arg[2][ #arg[2] ].damage_mul )
				-- return t2
			-- end,
		 },
		-- concat = "%s / %s",
		units = "damage",
	},	
	emp_charge =
	{
		name = "weapon_damage_emp", --Урон (электромагн.)
		valField = { "damage_emp", "charge_max", "damage_charge_deminishing", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1]
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + (arg[2] - 1) * arg[3] )
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},
}

ItemTooltip.Weapon.fire_rate =
{
	plain =
	{
		name = "weapon_fire_rate", --Скорострельность
		valField = "fire_rate",
		units = "shot_per_minute",
	},
	min_max =
	{
		name = "weapon_fire_rate", --Скорострельность
		valField = { "fire_rate", "fire_rate_max" },
		concat = "%s - %s ",
		units = "shot_per_minute",
	},
	min_max_charge =
	{
		name = "weapon_fire_rate", --Скорострельность
		valField = { "fire_rate", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][1].time > 0 then
					time = arg[2][1].time + time
				end
				return arg[1] / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][ #arg[2] ].time > 0 then
					time = arg[2][ #arg[2] ].time + time
				end
				return arg[1] / time
			end,
		},
		concat = "%s / %s ",
		units = "shot_per_minute",
	},
}

ItemTooltip.Weapon.crit =
{
	chance =
	{
		name = "weapon_crit_chance", --Шанс крит. повреждений
		valField = "crit_chance",
		units = "percent",
	},
	chance_min_max =
	{
		name = "weapon_crit_chance_min_max", --Шанс крит. урона (от — до)
		valField = { "crit_chance", "crit_chance_max", },
		concat = "%s - %s",
		units = "percent",
	},
	damage =
	{
		name = "weapon_crit_damage", --Бонус критических повреждений
		valField = "crit_damage",
		units = "percent",
	},
}

ItemTooltip.Weapon.projectile_speed =
{
	plain =
	{
		name = "weapon_projectile_speed", --Скорость снаряда
		valField = "projectile_speed",
		absValue = true,
		units = "metre_per_second",
	},
	min_max =
	{
		name = "weapon_projectile_speed_min_max", --Скорость снаряда (от—до)
		valField = { "projectile_speed", "projectile_speed_max", },
		concat = "%s - %s",
		units = "metre_per_second",
	},
	min_max_charge =
	{
		name = "weapon_projectile_speed_min_max", --Скорость снаряда (от—до)
		valField = { "projectile_speed", "charge_levels" },
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
		concat = "%s / %s",
		units = "metre_per_second",
	},
	min_max_spell = -- снаряд разгоняется заклинанием из spell_on_crit
	{
		name = "weapon_projectile_speed_min_max", --Скорость снаряда (от—до)
		valField = { "projectile_speed", "projectile" },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1]
			end,
			function( ... )
				local arg = { ... }
				local spell = Def[ arg[2] ].spell_on_crit
				return arg[1] * (1 + Spell[ spell ].aura_param * Spell[ spell ].max_stacks)
			end,
		},
		concat = "%s - %s",
		units = "metre_per_second",
	},
}

ItemTooltip.Weapon.laser_ray =
{
	width =
	{
		name = "weapon_laser_ray_width", --Ширина луча
		valField = "damage_radius",
		formula = function( ... )
			local arg = { ... }
			return arg[1] * 2
		end,
		units = "metre",
	},
	fake_width =
	{
		name = "weapon_laser_ray_width", --Ширина луча
		valField = "damage_radius_fake",
		formula = function( ... )
			local arg = { ... }
			return arg[1] * 2
		end,
		units = "metre",
	},
}

------------------------------ [ ROCKETS ] ------------------------------

ItemTooltip.Rocket =
{
	flight_range =
	{
		name = "rocket_flight_range", --Расстояние полета
		valField = "max_range",
		units = "metre",
	},
	flight_speed =
	{
		name = "rocket_flight_speed", --Скорость полета
		valField = "speed",
		units = "metre_per_second",
	},
	flight_rot_speed =
	{
		name = "rocket_flight_rot_speed", --Скорость поворота
		valField = "angular_velocity",
		units = "degree_per_second",
	},
	barrel_rot_speed =
	{
		name = "rocket_barrel_rot_speed", --Скорость наведения пусковой установки
		valField = "barrel_rot_speed",
		units = "degree_per_second",
	},
	detonation_radius =
	{
		name = "field_radius", --Радиус срабатывания
		valField = "detonation_radius",
		units = "metre",
	},
		entity_health = -- объекты рождаемые ракетами
	{
		name = "rocket_entity_health", -- прочность
		subPrototype = "death_entity",
		valField = "health",
		units = "units",
	},
		entity_ttl =
	{
		name = "rocket_entity_ttl", -- прочность
		subPrototype = "death_entity",
		valField = "ttl",
		units = "second",
	},
}

ItemTooltip.Rocket.volley =
{
	size = {
		name = "volley_size", --Ракет в залпе
		valField = "volley_size",
		units = "pieces",
	},
}

ItemTooltip.Rocket.volley.damage =
{
	kinetic =
	{
		name = "rocket_damage_kinetic_total", --Суммарные повреждения (кинетич.)
		large = true,
		subPrototype = { "explosion_blast_wave", nil, },
		valField = { "damage_kinetic", "volley_count", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2]
		end,
		units = "damage",
	},
	thermal =
	{
		name = "rocket_damage_thermal_total", --Суммарные повреждения|(термич.)
		large = true,
		subPrototype = { "explosion_blast_wave", nil, },
		valField = { "damage_thermal", "volley_count", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2]
		end,
		units = "damage",
	},
}

ItemTooltip.Rocket.warhead =
{
	damage_thermal =
	{
		name = "warhead_damage_thermal", --Урон от взрыва боеголовки, термический
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			local blast = Def[rocket].explosion_blast_wave
			return Def[blast].damage_thermal
		end,
		units = "damage",
		large = true,
	},
	damage_range =
	{
		name = "warhead_damage_range", --Радиус взрыва боеголовки
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			local blast = Def[rocket].explosion_blast_wave
			return Def[blast].blast_maxDistance
		end,
		units = "metre",
	},
	flight_range =
	{
		name = "warhead_flight_range", --Дистанция полёта боеголовки
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			return Def[rocket].max_range
		end,
		units = "metre",
	},
	flight_speed =
	{
		name = "warhead_flight_speed", --Скорость полёта боеголовки
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			return Def[rocket].speed
		end,
		units = "metre_per_second",
	},
	flight_rot_speed =
	{
		name = "warhead_flight_rot_speed", --Скорость поворота боеголовки
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			return Def[rocket].angular_velocity
		end,
		units = "degree_per_second",
	},
}

ItemTooltip.Rocket.projectile =
{
	damage_range =
	{
		name = "rocket_damage_range",
		subPrototype = "projectile",
		valField = "explosion_blast_wave",
		formula = function ( ... )
			local arg = { ... }
			return Def[ arg[1] ].blast_maxDistance
		end,
		units = "metre",
	},
	flight_range =
	{
		name = "rocket_flight_range", --Дистанция полёта
		subPrototype = "projectile",
		valField = "max_range",
		units = "metre",
	},
	flight_speed =
	{
		name = "rocket_flight_speed", --Скорость полёта
		subPrototype = "projectile",
		valField = "speed",
		units = "metre_per_second",
	},
	flight_rot_speed =
	{
		name = "rocket_flight_rot_speed", --Скорость поворота
		subPrototype = "projectile",
		valField = "angular_velocity",
		units = "degree_per_second",
	},
	detonate_on_distance =
	{
		name = "field_radius", --Радиус срабатывания
		subPrototype = "projectile",
		valField = "detonate_on_distance",
		units = "metre",
	},
}

ItemTooltip.Rocket.module =
{
	flight_speed =
	{
		name = "rocket_flight_speed", --Скорость полёта
		valField = "projectile_speed",
		units = "metre_per_second",
	},
}

ItemTooltip.Rocket.projectile.warhead =
{
	damage_thermal =
	{
		name = "warhead_damage_thermal", --Урон от взрыва боеголовки, термический
		subPrototype = { "projectile", "explosion_blast_wave", nil},
		valField = { "child_rockets", "damage_thermal", "explosion_blast_wave" },
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			local blast = Def[rocket].explosion_blast_wave
			local blast_damage = Def[blast].damage_thermal
			
			local coef = 1
			if arg[3] and arg[2] > 0 then
				coef = arg[2] / Def[arg[3]].damage_thermal
			end
			
			return blast_damage * coef
		end,
		units = "damage",
		large = true,
	},
	damage_range =
	{
		name = "warhead_damage_range", --Радиус взрыва боеголовки
		subPrototype = "projectile",
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			local blast = Def[rocket].explosion_blast_wave
			return Def[blast].blast_maxDistance
		end,
		units = "metre",
	},
	flight_range =
	{
		name = "warhead_flight_range", --Дистанция полёта боеголовки
		subPrototype = "projectile", 
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			return Def[rocket].max_range
		end,
		units = "metre",
	},
	flight_speed =
	{
		name = "warhead_flight_speed", --Скорость полёта боеголовки
		subPrototype = "projectile",
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			return Def[rocket].speed
		end,
		units = "metre_per_second",
	},
	flight_rot_speed =
	{
		name = "warhead_flight_rot_speed", --Скорость поворота боеголовки
		subPrototype = "projectile",
		valField = "child_rockets",
		formula = function( ... )
			local arg = { ... }
			local rocket = arg[1].rocket
			return Def[rocket].angular_velocity
		end,
		units = "degree_per_second",
	},
}

------------------------------ [ EXPLOSIVES ] ------------------------------

ItemTooltip.Explosions =
{
	holder_ammo = {
		name = "rocket_holder_ammo", --Ракет в обойме
		valField = "ammo",
		units = "pieces",
	},
	holder_size =
	{
		name = "rocket_holder_size", --Число в обойме
		valField = "holder_size",
		units = "units",
	},
	empty_cooldown =
	{
		name = "rocket_empty_holder_cooldown", --Время перезарядки обоймы
		valField = "empty_holder_cooldown",
		units = "second",
		negative = true,
	},
}

ItemTooltip.Explosions.damage =
{
	kinetic_small =
	{
		name = "rocket_damage_kinetic", --Взрыв (кинетич.)
		subPrototype = "explosion_blast_wave",
		valField = "damage_kinetic",
		units = "damage",
	},
	kinetic =
	{
		name = "rocket_damage_kinetic", --Взрыв (кинетич.)
		large = true,
		subPrototype = "explosion_blast_wave",
		valField = "damage_kinetic",
		units = "damage",
	},
	thermal_small =
	{
		name = "rocket_damage_thermal", --Взрыв (термич.)
		subPrototype = "explosion_blast_wave",
		valField = "damage_thermal",
		units = "damage",
	},
	thermal =
	{
		name = "rocket_damage_thermal", --Взрыв (термич.)
		large = true,
		subPrototype = "explosion_blast_wave",
		valField = "damage_thermal",
		units = "damage",
	},
	thermal_plain =
	{
		name = "rocket_damage_thermal", --Взрыв (термич.)
		large = true,
		valField = "damage_thermal",
		units = "damage",
	},
	emp =
	{
		name = "rocket_damage_emp", --Взрыв (электромагн.)
		large = true,
		subPrototype = "explosion_blast_wave",
		valField = "damage_emp",
		units = "damage",
	},
	emp_plain =
	{
		name = "rocket_damage_emp", --Взрыв (электромагн.)
		large = true,
		valField = "damage_emp",
		units = "damage",
	},
	range =
	{
		name = "rocket_damage_range", --Радиус взрыва
		subPrototype = "explosion_blast_wave",
		valField = "blast_maxDistance",
		units = "metre",
	},
}

ItemTooltip.Explosions.spiral =
{
	thermal =
	{
		name = "rocket_damage_thermal", --Взрыв (термич.)
		large = true,
		subPrototype = "activate_entity",
		valField = "explosion_on_ttl",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].damage_thermal
		end,
		units = "damage",
	},
	range =
	{
		name = "rocket_damage_range", --Радиус взрыва
		subPrototype = "activate_entity",
		valField = "explosion_on_ttl",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].blast_maxDistance
		end,
		units = "metre",
	},
}

------------------------------ [ ENTITIES ] ------------------------------

ItemTooltip.Entity =
{
	shield_charge =
	{
		name = "shield_charge",
		valField = "activate_entity_health",
		units = "units",
	},
	health =
	{
		name = "entity_health", --Прочность
		subPrototype = "activate_entity",
		valField = "health",
		units = "units",
	},
	activation_time =
	{
		name = "tta", --Время активации
		subPrototype = "activate_entity",
		valField = "launch_time",
		units = "second",
		negative = true,
	},
	ttl =
	{
		name = "minefield_time_to_live", --Время существования
		subPrototype = "activate_entity",
		valField = "ttl",
		units = "second",
	},
	activate_entity_ttl =
	{
		name = "ttl", --Время работы
		subPrototype = "activate_entity",
		valField = "ttl",
		units = "second",
	},
	entity_ttl =
	{
		name = "ttl", --Время работы
		valField = "activate_entity_ttl",
		units = "second",
	},
	range =
	{
		name = "field_radius", --Радиус срабатывания
		subPrototype = "activate_entity",
		valField = "radius",
		units = "metre",
	},
}

------------------------------ [ MINES ] ------------------------------

ItemTooltip.Minefield =
{
	ttl =
	{
		name = "minefield_time_to_live", --Время существования
		valField = "time_to_live",
		units = "second",
	},
	range =
	{
		name = "field_radius", --Радиус срабатывания
		valField = "field_radius",
		units = "metre",
	},
	entity_health =
	{
		name = "entity_health", --Прочность
		valField = "health",
		units = "units",
	},
	entity_activation_time =
	{
		name = "tta", --Время активации
		valField = "launch_time",
		units = "second",
		negative = true,
	},
	entity_ttl =
	{
		name = "minefield_time_to_live", --Время существования
		valField = "ttl",
		units = "second",
	},
	entity_range =
	{
		name = "field_radius", --Радиус срабатывания
		valField = "radius",
		units = "metre",
	},
}

------------------------------ [ DRONES ] ------------------------------

ItemTooltip.Drone =
{
	health =
	{
		name = "drone_health", --Дрон: прочность
		valField = "activate_entity_health",
		units = "units",
	},
	fire_rate =
	{
		name = "drone_fire_rate", --Дрон: скорострельность орудий
		valField = "fire_rate",
		units = "shot_per_minute",
	},
	range =
	{
		name = "drone_weapon_range", --Дрон: дальность стрельбы
		valField = "max_range",
		units = "metre",
	},
	dispersion =
	{
		name = "drone_dispersion", --Дрон: разброс орудий
		valField = "dispersion",
		units = "degree",
		format = "%3.2f",
		negative = true,
	},
	max_aim_rot_speed =
	{
		name = "drone_max_aim_rot_speed", --Дрон: скорость наведения орудия
		valField = "max_aim_rot_speed",
		units = "degree_per_second",
	},
	projectile_speed =
	{
		name = "drone_projectile_speed",
		valField = "projectile_speed",
		units = "metre_per_second",
	},
	fly_range =
	{
		name = "drone_range_max", --Дрон: дальность полета
		subPrototype = "activation_projectile",
		valField = "max_range",
		units = "metre",
	},
	activation_ammo =
	{
		name = "drone_activation_ammo", --Время подготовки дрона к активации
		valField = "ammo_regen_time",
		units = "second",
		negative = true,
	},
	ammo_regen_max =
	{
	   name = "drone_ammo_regen_max",
		valField = "ammo_regen_max",
		units = "units",
	},
	num =
	{
		name = "drone_num",
		valField = "drone_num",
		units = "units",
	},
	ttl =
	{
		name = "drone_ttl",
		valField = "drone_ttl",
		units = "second",
	},
	entity_ttl =
	{
		name = "drone_ttl", --Дрон: время работы
		valField = "activate_entity_ttl",
		units = "second",
	},
	respawn_period =
	{
		name = "drone_respawn_period",
		valField = "drone_respawn_period",
		units = "second",
		negative = true,
	},
	angular_velocity =
	{
		name = "drone_max_rot_speed",
		subPrototype = "activation_projectile",
		valField = "angular_velocity",
		units = "degree_per_second",
	},
	speed =
	{
		name = "drone_max_speed",
		subPrototype = "activation_projectile",
		valField = "speed",
		units = "metre_per_second",
	},
}

ItemTooltip.Drone.destr =
{
	health =
	{
		name = "drone_health", --Дрон: прочность
		valField = "health",
		units = "units",
	},
	ttl =
	{
		name = "drone_ttl", --Дрон: время работы
		valField = "ttl",
		units = "second",
	},
}

ItemTooltip.Drone.drone =
{
	damage_emp =
	{
		name = "drone_damage_emp",
		subPrototype = "drone",
		valField = "damage_emp",
		units = "damage",
	},
	damage_kinetic =
	{
		name = "drone_damage_kinetic",
		--subPrototype = "drone",
		valField = "damage_kinetic",
		units = "damage",
	},
	dps_thermal =
	{
		name = "drone_damage_thermal_dps",
		large = true,
		subPrototype = "drone",
		valField = { "damage_thermal", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return ( arg[1] * arg[2] ) / 60
		end,
		units = "damage_per_second",
	},
	damage_thermal =
	{
		name="drone_damage_thermal",
		subPrototype = "drone",
		valField = "damage_thermal",
		units = "damage",
	},
	fire_rate =
	{
		name = "drone_fire_rate",
		subPrototype = "drone",
		valField = "fire_rate",
		units = "shot_per_minute",
	},
	projectile_speed =
	{
		name = "drone_projectile_speed",
		subPrototype = "drone",
		valField = "projectile_speed",
		units = "metre_per_second",
	},
	max_rot_speed =
	{
		name = "drone_max_rot_speed",
		subPrototype = "drone",
		valField = "max_rot_speed",
		units = "degree_per_second",
	},
	max_speed =
	{
		name = "drone_max_speed",
		subPrototype = "drone",
		valField = "max_speed",
		units = "metre_per_second",
	},
	health =
	{
		name = "drone_health",
		subPrototype = "drone",
		valField = "health",
		units = "units",
	},
	ttl =
	{
		name = "drone_ttl",
		subPrototype = "drone",
		valField = "ttl",
		units = "second",
	},
}

ItemTooltip.Drone.drone_weapon =
{
	fire_rate =
	{
		name = "drone_fire_rate",
		subPrototype = "drone",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].fire_rate
		end,
		units = "shot_per_minute",
	},
	range =
	{
		name = "drone_weapon_range",
		subPrototype = "drone",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].max_range
		end,
		units = "metre",
	},
}

ItemTooltip.Drone.dps =
{
	emp =
	{
		name = "drone_weapon_damage_emp_dps", --Дрон: урон в секунду|(электромагн.)
		large = true,
		valField = { "damage_emp", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2] / 60
		end,
		units = "damage",
	},
	thermal =
	{
		name = "drone_damage_thermal_dps", --Дрон: урон орудий в с. (термич.)
		large = true,
		valField = { "damage_thermal", "fire_rate", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2] / 60
		end,
		units = "damage",
	},
}

ItemTooltip.Drone.damage =
{
	emp =
	{
		name = "drone_weapon_damage_emp", --Дрон: урон (электромагн.)
		valField = "damage_emp",
		units = "damage",
	},
	thermal =
	{
		name = "drone_damage_thermal", --Дрон: урон орудий (термич.)
		valField = "damage_thermal",
		units = "units",
	},
}

------------------------------ [ SPELLS ] ------------------------------

ItemTooltip.Spell =
{
	delay =
	{
		name = "delay", --Задержка
		spellPrototype = "spell",
		valField = "duration",
		units = "second",
		negative = true,
	},
}

ItemTooltip.Spell.range =
{
	target =
	{
		name = "target_range", --Расстояние до цели спелла
		spellPrototype = "spell",
		valField = "target_range",
		units = "metre",
	},
	target_charged =
	{
		name = "target_range_2", --Дальность действия (от-  до)
		spellPrototype = "spell",
		valField = { "aura_range", "duration", "aura_range_add", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1]
			end,
			function( ... )
				local arg = { ... }
				return arg[1] + arg[2] * arg[3]
			end,
		},
		concat = "%s - %s",
		units = "metre",
	},
	target_additional =
	{
		name = "target_range", --Расстояние до цели спелла
		spellPrototype = "additional_spell",
		valField = "target_range",
		units = "metre",
	},
	aura =
	{
		name = "aura_range", --Расстояние до цели спелла
		spellPrototype = "spell",
		valField = "aura_range",
		units = "metre",
	},
	aura_additional =
	{
		name = "aura_range", --Расстояние до цели спелла
		spellPrototype = "additional_spell",
		valField = "aura_range",
		units = "metre",
	},
	aura_additional_target_range =
	{
		name = "aura_range", --Расстояние до цели спелла
		spellPrototype = "additional_spell",
		valField = "target_range",
		units = "metre",
	},
	deactivate =
	{
		name = "aura_range",
		spellPrototype = "deactivate_spell",
		valField = "aura_range",
		units = "metre",
	},
	teleport =
	{
		name = "target_range", --Расстояние до цели спелла
		spellPrototype = "spell",
		valField = "teleport_range",
		units = "metre",
	},
	weapon =
	{
		name = "weapon_range_max", --Дальность стрельбы (макс.)
		spellPrototype = "spell",
		valField = "aura_range",
		units = "metre",
	},
}

ItemTooltip.Spell.duration =
{
	plain =
	{
		name = "duration", --Длительность
		spellPrototype = "spell",
		valField = "duration",
		units = "second",
	},
	inner =
	{
		name = "duration", --Длительность
		spellPrototype = "spell",
		valField = "spells[1]",
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].duration
		end,
		units = "second",
	},
	additional =
	{
		name = "duration", --Длительность
		spellPrototype = "additional_spell",
		valField = "duration",
		units = "second",
	},
	inner_additional =
	{
		name = "duration", --Длительность
		spellPrototype = "additional_spell",
		valField = "spells[1]",
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].duration
		end,
		units = "second",
	},
	additional_aura =
	{
		name = "duration", --Длительность
		spellPrototype = "spell",
		valField = "additional_auras[1].duration",
		units = "second",
	},
}

ItemTooltip.Spell.dps =
{
	thermal =
	{
		name = "weapon_damage_thermal_dps",
		spellPrototype = "spell",
		valField = "aura_param",
		units = "units_per_second",
	},
	thermal_charged =
	{
		name = "weapon_damage_thermal_dps",
		large = true,
		spellPrototype = "spell",
		valField = { "aura_param", "aura_param_add", "period", "duration" },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] / arg[3]
			end,
			function( ... )
				local arg = { ... }
				return ( arg[1] + arg[2] * math.ceil( arg[4] ) ) / arg[3]
			end,
		},
		concat = "%s - %s",
		units = "units",
	},
}

ItemTooltip.Spell.effect =
{
	damage_mul =
	{
		name = "ecm_common_damage_mul",
		spellPrototype = "spell",
		valField = "aura_param",
		units = "percent",
	},
	shield_charge =
	{
		name = "shield_charge",
		spellPrototype = "spell",
		valField = "influence_param",
		units = "units",
	},
}

ItemTooltip.Spell.effect.on_equip =
{
	resist_add =
	{
		name = "resist_add", --Увеличение сопротивления урону
		spellPrototype = "spell_on_equip",
		valField = "aura_param",
		units = "units",
	},
}

------------------------------ [ EFFECTS ] ------------------------------

ItemTooltip.Effects =
{
	energy_regen_mul =
	{
		name = "energy_regen_mul", --Восстановление энергии
		valField = "energy_regen_mul",
		units = "percent",
	},
	acceleration_mul =
	{
		name = "acceleration_mul", --Разгон
		valField = "acceleration_mul",
		units = "percent",
	},
	strafe_accel =
	{
		name = "strafe_accel_inc", --Боковое ускорение
		valField = "strafe_accel_mul",
		units = "percent",
	},
	strafe_speed =
	{
		name = "strafe_speed_inc", --Боковая скорость
		valField = "strafe_speed_mul",
		units = "percent",
	},
	boost_energy_cost_per_second_mul =
	{
		name = "boost_energy_cost_per_second_mul", --Энергия на поддержание форсажа
		valField = "boost_energy_cost_per_second_mul",
		units = "percent",
		negative = true,
	},
	hull_health_mul =
	{
		name = "hull_health_mul",
		valField = "hull_health_mul",
		units = "percent",
	},
	trigger_speed_percent =
	{
		name = "trigger_speed_percent",
		valField = "max_speed_percent",
		units = "percent",
	},
}

--############################################# [ CUSTOM TOOLTIPS ] #############################################--

------------------------------ [ WEAPONS ] ------------------------------

ItemTooltip.Weapon.bubble_gun =
{
	dps_emp_bubble =
	{
		name = "weapon_bubble_damage_dps", --Урон в с. шаром (ЭМ)
		large = true,
		valField = { "damage_emp", "fire_rate", "charge_levels" },
		formula = function( ... )
			local arg = { ... }
			local time = 1
			if arg[3][1].time > 0 then
				time = arg[3][1].time + time
			end
			return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
		end,
		units = "damage_per_second",
	},
	dps_emp_bullet =
	{
		name = "weapon_bullet_damage_dps", --Урон в с. пулей (ЭМ)
		large = true,
		valField = { "damage_emp", "fire_rate", "charge_levels", },
		formula = function( ... )
			local arg = { ... }
			local time = 1
			if arg[3][ #arg[3] ].time > 0 then
				time = arg[3][ #arg[3] ].time + time
			end
			return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] ].damage_mul ) / time
		end,
		units = "damage_per_second",
	},
	damage_emp_bubble =
	{
		name = "weapon_bubble_damage", --Урон шаром (ЭМ)
		valField = { "damage_emp", "charge_levels[1].damage_mul" },
		formula = function ( ... )
			local arg = { ... }
			return arg[1] * ( 1 + arg[2] )
		end,
		units = "damage",
	},
	damage_emp_bullet =
	{
		name = "weapon_bullet_damage", --Урон пулей (ЭМ)
		valField = { "damage_emp", "charge_levels[2].damage_mul" },
		formula = function ( ... )
			local arg = { ... }
			return arg[1] * ( 1 + arg[2] )
		end,
		units = "damage",
	},
	projectile_speed_bubble =
	{
		name = "weapon_bubble_projectile_speed", --Скорость полета шара
		valField = {"projectile_speed", "charge_levels[1].speed_mul" },
		formula = function( ... )
			local arg = { ... }
			return arg[1] / ( 1 - arg[2] )
		end,
		units = "metre_per_second",
	},
	projectile_speed_bullet =
	{
		name = "weapon_bullet_projectile_speed", --Скорость полета пули
		valField = {"projectile_speed", "charge_levels[2].speed_mul" },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * ( 1 + arg[2] )
		end,
		units = "metre_per_second",
	},
}

ItemTooltip.Weapon.gravy_anomaly =
{
	size =
	{
		name = "web_size", --Размер сети
		subPrototype = "projectile",
		valField = { "hitbox_max", "hitbox_min", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1].x - arg[2].x
			end,
			function( ... )
				local arg = { ... }
				return arg[1].z - arg[2].z
			end,
		},
		concat = "%s x %s",
		units = "metre",
	},
}

ItemTooltip.Weapon.corrosive_gun =
{
	dps_kinetic =
	{
		name = "weapon_damage_kinetic_dps", --Урон в секунду (кинетич.)
		large = true,
		spellPrototype = { nil, "spell_on_hit", },
		valField = { "damage_kinetic", "period", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] / arg[2]
		end,
		units = "damage_per_second",
	},
}

ItemTooltip.Weapon.charged_blast =
{
	dps_thermal =
	{
		name = "weapon_damage_thermal_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_thermal", "fire_rate", "charge_levels", },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][1].time > 0 then
					time = arg[3][1].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][ #arg[3] - 1 ].time > 0 then
					time = arg[3][ #arg[3] - 1 ].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] - 1 ].damage_mul ) / time
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	damage_thermal =
	{
		name = "weapon_damage_thermal", --Урон (электромагн.)
		valField = { "damage_thermal", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local t1 = arg[1] * ( 1 + arg[2][1].damage_mul )
				return t1
			end,
			function( ... )
				local arg = { ... }
				local t2 = arg[1] * ( 1 + arg[2][ #arg[2] - 1 ].damage_mul )
				return t2
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},
	fire_rate =
	{
		name = "weapon_fire_rate", --Скорострельность
		valField = { "fire_rate", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][1].time > 0 then
					time = arg[2][1].time + time
				end
				return arg[1] / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][ #arg[2] ].time > 0 then
					time = arg[2][ #arg[2] - 1 ].time + time
				end
				return arg[1] / time
			end,
		},
		concat = "%s / %s ",
		units = "shot_per_minute",
	},
	projectile_speed =
	{
		name = "weapon_projectile_speed_min_max", --Скорость снаряда (от—до)
		valField = { "projectile_speed", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + arg[2][1].speed_mul )
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + arg[2][ #arg[2] - 1 ].speed_mul )
			end,
		},
		concat = "%s / %s",
		units = "metre_per_second",
	},
}

ItemTooltip.Weapon.loud_echo =
{
	dps_emp =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_emp", "fire_rate", "projectile", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 3 ] ]
				local backProjectile = Def[ projectile.child_rockets.rocket ]
				local backSpell = Spell[ backProjectile.spell ]
				local param = backSpell.aura_param
				local stacks = backSpell.max_stacks
				return arg[1] * arg[2] / 60 * ( 1 + param * stacks )
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	damage_emp =
	{
		name = "weapon_damage_emp", --Урон (электромагн.)
		valField = { "damage_emp", "projectile" },
		formula = {
			function( ... )
				local arg = { ... }
				local d1 = arg[1]
				return d1
			end,
			function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 2 ] ]
				local backProjectile = Def[ projectile.child_rockets.rocket ]
				local backSpell = Spell[ backProjectile.spell ]
				local param = backSpell.aura_param
				local stacks = backSpell.max_stacks
				local d2 = arg[1] * ( 1 + param * stacks )
				return d2
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},
}

ItemTooltip.Weapon.raven_gun =
{
	dps_emp =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_emp", "fire_rate", "charge_levels", },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][1].time > 0 then
					time = arg[3][1].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][ #arg[3] - 1 ].time > 0 then
					time = arg[3][ #arg[3] - 1 ].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] - 1 ].damage_mul ) / time
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	fire_rate =
	{
		name = "weapon_fire_rate", --Скорострельность
		valField = { "fire_rate", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][1].time > 0 then
					time = arg[2][1].time + time
				end
				return arg[1] / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][ #arg[2] - 1 ].time > 0 then
					time = arg[2][ #arg[2] - 1 ].time + time
				end
				return arg[1] / time
			end,
		},
		concat = "%s / %s ",
		units = "shot_per_minute",
	},
}

ItemTooltip.Weapon.relicgun =
{
	dps_kinetic =
	{
		name = "weapon_damage_kinetic_dps_2", --Урон в секунду|(кинет.)
		large = true,
		valField = { "damage_kinetic", "fire_rate", "projectile", "max_range", "max_range_max", "max_range_add", },
		formula = {
			function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 3 ] ]
				return arg[1] * arg[2] / 60 * ( projectile.distance_damage_coef_min )
			end,
			function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 3 ] ]
				return arg[1] / ( 60 / arg[2] + ( arg[5] - arg[4] ) / arg[6] ) * ( projectile.distance_damage_coef_max * (arg[5] / projectile.distance_damage_dist_max))
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
	fire_rate =
	{
		name = "weapon_fire_rate", --Скорострельность
		valField = { "fire_rate", "max_range", "max_range_max", "max_range_add", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1]
			end,
			function( ... )
				local arg = { ... }
				return 60 / ( 60 / arg[1] + ( arg[3] - arg[2] ) / arg[4])
			end,
		},
		concat = "%s - %s ",
		units = "shot_per_minute",
	},
	damage_kinetic =
	{
		name = "weapon_damage_kinetic", --Урон (электромагн.)
		valField = { "damage_kinetic", "projectile", "max_range_max", },
		formula = {
			function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 2 ] ]
				return arg[1] * ( projectile.distance_damage_coef_min )
			end,
			function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 2 ] ]
				local distance = math.min(arg[3], projectile.distance_damage_dist_max)
				return arg[1] * ( projectile.distance_damage_coef_max * (distance / projectile.distance_damage_dist_max) )
			end,
		},
		concat = "%s - %s",
		units = "damage",
	}
}

ItemTooltip.Weapon.protozan_blaster =
{
	dps_thermal =
	{
		name = "weapon_damage_thermal_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_thermal", "fire_rate", "charge_levels", },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][1].time > 0 then
					time = arg[3][1].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][ #arg[3] - 1 ].time > 0 then
					time = arg[3][ #arg[3] - 1 ].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] - 1 ].damage_mul ) / time
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	fire_rate =
	{
		name = "weapon_fire_rate", --Скорострельность
		valField = { "fire_rate", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][1].time > 0 then
					time = arg[2][1].time + time
				end
				return arg[1] / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][ #arg[2] - 1 ].time > 0 then
					time = arg[2][ #arg[2] - 1 ].time + time
				end
				return arg[1] / time
			end,
		},
		concat = "%s / %s ",
		units = "shot_per_minute",
	},
	projectile_speed =
	{
		name = "weapon_projectile_speed_min_max", --Скорость снаряда (от—до)
		valField = { "projectile_speed", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] / ( 1 - arg[2][1].speed_mul )
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + arg[2][ #arg[2] - 1 ].speed_mul )
			end,
		},
		concat = "%s / %s",
		units = "metre_per_second",
	},
}

ItemTooltip.Weapon.BasheGun =
{
	dps_emp =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_emp", "fire_rate", "charge_levels", },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][1].time > 0 then
					time = arg[3][1].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][ #arg[3] - 1 ].time > 0 then
					time = arg[3][ #arg[3] - 1 ].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] - 1 ].damage_mul ) / time
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	dps_emp2 =
	{
		name = "weapon_damage_emp_dps_2", --Урон в секунду|(электромаг.)
		large = true,
		valField = { "damage_emp", "fire_rate", "charge_levels", },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][1].time > 0 then
					time = arg[3][1].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][1].damage_mul ) / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[3][ #arg[3] - 1 ].time > 0 then
					time = arg[3][ #arg[3] - 1 ].time + time
				end
				return arg[1] * arg[2] / 60 * ( 1 + arg[3][ #arg[3] - 1 ].damage_mul ) / time  
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	fire_rate =
	{
		name = "weapon_fire_rate", --Скорострельность
		valField = { "fire_rate", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][1].time > 0 then
					time = arg[2][1].time + time
				end
				return arg[1] / time
			end,
			function( ... )
				local arg = { ... }
				local time = 1
				if arg[2][ #arg[2] - 1 ].time > 0 then
					time = arg[2][ #arg[2] - 1 ].time + time
				end
				return arg[1] / time
			end,
		},
		concat = "%s / %s ",
		units = "shot_per_minute",
	},
	projectile_speed =
	{
		name = "weapon_projectile_speed_min_max", --Скорость снаряда (от—до)
		valField = { "projectile_speed", "charge_levels" },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] / ( 1 - arg[2][1].speed_mul )
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + arg[2][ #arg[2] - 1 ].speed_mul )
			end,
		},
		concat = "%s / %s",
		units = "metre_per_second",
	},
}

ItemTooltip.Weapon.thor_hammer =
{
	dps_kinetic =
	{
		name = "weapon_damage_kinetic_dps_2", --Урон в секунду
		large = true,
		valField = { "damage_kinetic", "fire_rate", "projectile", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2] / 60
			end,
			function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 3 ] ]
				local backProjectile = Def[ projectile.child_rockets.rocket ]
				local backSpell = Spell[ backProjectile.spell ]
				local param = backSpell.additional_auras[1].aura_param
				return arg[1] * arg[2] / 60 * ( 1 + param )
			end,
		},
		concat = "%s / %s",
		units = "damage_per_second",
	},
	damage_kinetic =
	{
		name = "weapon_damage_kinetic", --Урон
		valField = { "damage_kinetic", "projectile" },
		formula = {
			function( ... )
				local arg = { ... }
				local d1 = arg[1]
				return d1
			end,
			function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 2 ] ]
				local backProjectile = Def[ projectile.child_rockets.rocket ]
				local backSpell = Spell[ backProjectile.spell ]
				local param = backSpell.additional_auras[1].aura_param
				local d2 = arg[1] * ( 1 + param )
				return d2
			end,
		},
		concat = "%s / %s",
		units = "damage",
	},
	range_min_max =
	{
		name = "weapon_range_max", --Дальность стрельбы (макс.)
		valField = { "max_range", "projectile" },
		formula = {
			function( ... )
				local arg = { ... }
				local d1 = arg[1]
				return d1
			end,
			function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 2 ] ]
				local backProjectile = Def[ projectile.child_rockets.rocket ]
				local backSpell = Spell[ backProjectile.spell ]
				local param = backSpell.aura_param
				local stacks = backSpell.max_stacks
				local d2 = arg[1] * ( 1 + param * stacks )
				return d2
			end,
		},
		concat = "%s - %s",
		units = "metre",
	},
}


------------------------------ [ SPECIAL ] ------------------------------

ItemTooltip.Special = {}

ItemTooltip.Special.crystaljump =
{
	charge_max =
	{
		name = "charge_max",
		valField = "ammo",
		units = "units",
	},
}

ItemTooltip.Special.atilla =
{
	charge_max =
	{
		name = "charge_max", --Макс. число зарядов
		spellPrototype = "charge_spell_on_max_speed_plus",
		valField = "max_stacks",
		units = "charge",
	},
	charge_time =
	{
		name = "charge_time", --Время накопления заряда
		valField = "charge_time",
		units = "second",
		negative = true,
	},
}

ItemTooltip.Special.frigatedrones =
{
	max_res_dec =
	{
		name = "max_res_dec", --Максимальное снижение сопротивления цели дронов от попаданий
		subPrototype = "projectile",
		spellPrototype = "spell",
		valField = { "max_stacks", "aura_param", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2]
		end,
		units = "units",
	},
}

ItemTooltip.Special.blackout =
{
	range = {
		name = "activation_range", --Дальность действия спелла
		spellPrototype = "deactivate_spell",
		valField = "spells[1]",
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].target_range
		end,
		units = "metre",
	},
}

ItemTooltip.Special.followerdrone =
{
	range =
	{
		name = "drone_range_max",
		spellPrototype = "spell",
		valField = "target_range",
		units = "metre",
	},
}

ItemTooltip.Special.turning_tide =
{
	speed =
	{
		name = "cloud_speed", --Скорость ударной волны
		valField = "projectile_speed",
		units = "metre_per_second",
	},
}

ItemTooltip.Special.scream =
{
	dps_emp =
	{
		name = "weapon_damage_emp_dps",
		--large = true, --Большие цифры, длинная строка, не влазит
		subPrototype = "projectile",
		spellPrototype = "spell_on_launch",
		valField = { "aura_param", "aura_param_add", "duration", "period", },
		formula = {
			function ( ... )
				local arg = { ... }
				return arg[1] / arg[4]
			end,
			function ( ... )
				local arg = { ... }
				return ( arg[1] + arg[2] * arg[3] ) / arg[4]
			end,
		},
		units = "damage_per_second",
		concat = "%s - %s",
	},
	spell_size =
	{
		name = "aura_size",
		subPrototype = "projectile",
		spellPrototype = "spell_on_launch",
		valField = { "aura_range", "aura_range_add", "duration", },
		formula = {
			function ( ... )
				local arg = { ... }
				return arg[1]
			end,
			function ( ... )
				local arg = { ... }
				return arg[1] + arg[2] * arg[3]
			end,
		},
		units = "metre",
		concat = "%s - %s",
	},
}

ItemTooltip.Special.crystalspit =
{
	dps_emp =
	{
		name = "weapon_damage_emp_dps",
		--large = true, Большие цифры, длинная строка, не влазит
		subPrototype = "projectile",
		spellPrototype = "spell_on_launch",
		valField = "spells[1]",
		formula = {
			function ( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local period = Spell[ arg[1] ].period
				return aura_param / period
			end,
			function ( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local aura_param_add = Spell[ arg[1] ].aura_param_add
				local period = Spell[ arg[1] ].period
				return ( aura_param + aura_param_add * 3 ) / period -- 3 это расчет на 3 секунды полета, как в Spell.Spell_CrystalSpit
			end,
		},
		units = "damage_per_second",
		concat = "%s - %s",
	},
	spell_size =
	{
		name = "aura_size",
		subPrototype = "projectile",
		spellPrototype = "spell_on_launch",
		valField = "spells[1]",
		formula = {
			function ( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			function ( ... )
				local arg = { ... }
				aura_range = Spell[ arg[1] ].aura_range
				aura_range_add =Spell[ arg[1] ].aura_range_add
				return aura_range + aura_range_add * 3 -- 3 это расчет на 3 секунды полета, как в Spell.Spell_CrystalSpit
			end,
		},
		units = "metre",
		concat = "%s - %s",
	},
}

ItemTooltip.Special.disintegrator_phased =
{
	damage_thermal =
	{
		name = "weapon_damage_thermal",
		large = true,
		valField = {"damage_thermal", "damage_coefs", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2][1]
			end,
			function( ... )
				local arg = { ... }
				return arg[1] * arg[2][ #arg[2] ]
			end,
		},
		concat = "%s - %s",
		units = "damage",
	},
}

ItemTooltip.Special.remote_disintegrator =
{
	damage_thermal =
	{
		name = "weapon_damage_thermal", --Урон дезинтегратора, термический
		large = true,
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			local primary_weapon = Def[ arg[1] ].primary_weapon
			return Def[ primary_weapon ].damage_thermal
		end,
		units = "damage",
	},
	fire_rate =
	{
		name = "weapon_fire_rate", --Скорострельность дезинтегратора
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			local primary_weapon = Def[ arg[1] ].primary_weapon
			return Def[ primary_weapon ].fire_rate
		end,
		units = "shot_per_minute",
	},
	projectile_speed =
	{
		name = "weapon_projectile_speed", --Скорость прожектайла дезинтегратора
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			local primary_weapon = Def[ arg[1] ].primary_weapon
			return Def[ primary_weapon ].projectile_speed
		end,
		units = "metre_per_second",
	},
	range =
	{
		name = "weapon_range_max", --Дальность стрельбы дезинтегратора
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			local primary_weapon = Def[ arg[1] ].primary_weapon
			return Def[ primary_weapon ].max_range
		end,
		units = "metre",
	},
	-- carrier
	carrier_speed =
	{
		name = "carrier_speed", --Носитель: скорость
		valField = "projectile_speed",
		units = "metre_per_second",
	},
	carrier_range =
	{
		name = "carrier_range", --Носитель: дальность полета
		valField = "max_range",
		units = "metre",
	},
	-- dron
	drone_health = 
	{
		name = "drone_health", --HP дрона дезинтегратора
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].health
		end,
		units = "units",
	},
	drone_ttl =
	{
		name = "drone_ttl", --TTL дрона дезинтегратора
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].ttl
		end,
		units = "second",
	},
	drone_distance =
	{
		name = "drone_owner_distance", --Дрон: макс. удаление от носителя
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].owner_distance
		end,
		units = "metre",
	},
	drone_vision =
	{
		name = "drone_vision_radius", --Дрон: дальность радара
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].vision_radius
		end,
		units = "metre",
	},
}

ItemTooltip.Special.swarm =
{
	dps =
	{
		name = "weapon_damage_dps", --Урон роя в секунду
		subPrototype = "swarm_pack",
		spellPrototype = "spell_on_attack",
		valField = { "aura_param", "period", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] / arg[2]
		end,
		large = true,
		units = "damage_per_second",
	},
	attack_time =
	{
		name = "duration_on_target", --Время атаки роя
		subPrototype = "swarm_pack",
		valField = "attack_time",
		units = "second",
	},
	prepare_time =
	{
		name = "prepare_time", --Время КД роя после атаки
		subPrototype = "swarm_pack",
		valField = "attack_period",
		units = "second",
		negative = true,
	},
	flight_speed =
	{
		name = "rocket_flight_speed", --Скорость полёта роя
		subPrototype = "swarm_pack",
		valField = "max_speed",
		units = "metre_per_second",
	},
	health =
	{
		name = "swarm_health", --HP роя
		subPrototype = "swarm_pack",
		valField = "health",
		units = "units",
	},
	health_regen =
	{
		name = "swarm_health_regen", --Восстановление роя
		subPrototype = "swarm_pack",
		valField = "health_regen",
		units = "units_per_second",
	},
}

ItemTooltip.Special.green_turret =
{
	static_damage_thermal =
	{
		name = "static_drone_damage_thermal",
		subPrototype = "activation_projectile",
		valField = "death_entity_on_static_hit",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].damage_thermal
		end,	
		units = "damage",
	},
	static_fire_rate =
	{
		name = "static_drone_fire_rate",
		subPrototype = "activation_projectile",
		valField = "death_entity_on_static_hit",
		formula = function( ... )
			local arg = { ... }
			local primary_weapon = Def[ arg[1] ].primary_weapon
			return Def[ primary_weapon ].fire_rate
		end,	
		units = "shot_per_minute",
	},
	static_weapon_range =
	{
		name = "static_drone_weapon_range",
		subPrototype = "activation_projectile",
		valField = "death_entity_on_static_hit",
		formula = function( ... )
			local arg = { ... }
			local primary_weapon = Def[ arg[1] ].primary_weapon
			return Def[ primary_weapon ].max_range
		end,	
		units = "metre",
	},
	static_health =
	{
		name = "static_drone_health",
		subPrototype = "activation_projectile",
		valField = "death_entity_on_static_hit",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].health
		end,
		units = "units",
	},
	static_ttl =
	{
		name = "static_drone_ttl",
		subPrototype = "activation_projectile",
		valField = "death_entity_on_static_hit",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].ttl
		end,
		units = "second",
	},
	space_damage_thermal =
	{
		name = "space_drone_damage_thermal",
		subPrototype = "activation_projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].damage_thermal
		end,	
		units = "damage",
	},
	space_fire_rate =
	{
		name = "space_drone_fire_rate",
		subPrototype = "activation_projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			local primary_weapon = Def[ arg[1] ].primary_weapon
			return Def[ primary_weapon ].fire_rate
		end,	
		units = "shot_per_minute",
	},
	space_weapon_range =
	{
		name = "space_drone_weapon_range",
		subPrototype = "activation_projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			local primary_weapon = Def[ arg[1] ].primary_weapon
			return Def[ primary_weapon ].max_range
		end,	
		units = "metre",
	},
	space_health =
	{
		name = "space_drone_health",
		subPrototype = "activation_projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].health
		end,
		units = "units",
	},
	space_ttl =
	{
		name = "space_drone_ttl",
		subPrototype = "activation_projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].ttl
		end,
		units = "second",
	},
}

ItemTooltip.Special.crystal_satellites =
{
	dps_thermal =
	{
		name = "drone_damage_thermal_dps",
		subPrototype = { nil, "drone_def", },
		valField = { "damage_thermal", "primary_weapon", },
		formula = function( ... )
			local arg = { ... }
			local fire_rate = Def[ arg[2] ].fire_rate
			return arg[1] * fire_rate / 60
		end,
		large = true,
	},
	fire_rate =
	{
		name = "drone_fire_rate",
		subPrototype = "drone_def",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].fire_rate
		end,
		units = "shot_per_minute",
	},
	range =
	{
		name = "drone_weapon_range",
		subPrototype = "drone_def",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].max_range
		end,
		units = "metre",
	},
	crit_chance = 
	{
		name = "drone_crit_chance",
		subPrototype = "drone_def",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].crit_chance
		end,
		units = "percent",
	},
	crit_damage =
	{
		name = "drone_crit_damage",
		subPrototype = "drone_def",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].crit_damage
		end,
		units = "percent",
	},
}

ItemTooltip.Special.scavenger =
{
	damage_sum =
	{
		name = "rocket_damage_thermal_total",
		large = true,
		spellPrototype = "spell_on_hit",
		valField = "spells[1]",
		formula = function( ... )
			local arg = { ... }
			local dps = Spell[ arg[1] ].aura_param
			local duration = Spell[ arg[1] ].duration
			local period = Spell[ arg[1] ].period
			return dps * ( duration / period + 1)
		end,
		units = "damage",
	},
	heal_sum =
	{
		name = "total_hull_heal",
		large = true,
		spellPrototype = "spell_on_hit",
		valField = "spells[2]",
		formula = function( ... )
			local arg = { ... }
			local projectile_return = Spell[ arg[1] ].death_rocket	-- Projectile_DroneScavengerReturn
			local heal_spell = Def[ projectile_return ].spell	-- DroneScavengerHeal
			local heal_per_second = Spell[ heal_spell ].aura_param
			local duration = Spell[ heal_spell ].duration
			local period = Spell[ heal_spell ].period
			return heal_per_second * ( duration / period + 1)
		end,
		units = "damage",
	},
	damage =
	{
		name = "weapon_damage_thermal",
		spellPrototype = "spell_on_hit",
		valField = "spells[1]",
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].aura_param
		end,
		units = "damage_per_second",
	},
	heal =
	{
		name = "total_spell_dot_hot",
		spellPrototype = "spell_on_hit",
		valField = "spells[2]",
		formula = function( ... )
			local arg = { ... }
			local projectile_return = Spell[ arg[1] ].death_rocket	-- Projectile_DroneScavengerReturn
			local heal_spell = Def[ projectile_return ].spell	-- DroneScavengerHeal
			return Spell[ heal_spell ].aura_param
		end,
		units = "damage_per_second",
	},
}

ItemTooltip.Special.landing =
{
	range_add =
	{
		name = "weapon_range_add",
		spellPrototype = "spell",
		valField = "additional_auras[1].aura_param",
		units = "percent",
	},
	shield_regen =
	{
		name = "shield_regen",
		spellPrototype = "spell",
		valField = "additional_auras[2].aura_param",
		units = "units_per_second",
	},
	projectile_speed_mul =
	{
		name = "projectile_speed_mul",
		spellPrototype = "spell",
		valField = "additional_auras[3].aura_param",
		units = "percent",
	},
}

ItemTooltip.Special.green_drones =
{
	missile_range =
	{
		name = "drone_missile_max_range",
		subPrototype = "activation_projectile",
		valField = "max_range",
		units = "metre",
	},
	missile_speed =
	{
		name = "drone_missile_speed",
		subPrototype = "activation_projectile",
		valField = "speed",
		units = "metre_per_second",
	},
	missile_damage_emp =
	{
		name = "rocket_damage_emp",
		subPrototype = "activation_projectile",
		valField = "explosion_blast_wave",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].damage_emp
		end,
		units = "damage",
	},
	missile_blast_maxDistance =
	{
		name = "blast_maxDistance",
		subPrototype = "activation_projectile",
		valField = "explosion_blast_wave",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].blast_maxDistance
		end,
		units = "metre",
	},
	flight_rot_speed =
	{
		name = "drone_max_rot_speed", --Скорость поворота
		subPrototype = "activation_projectile",
		valField = "angular_velocity",
		units = "degree_per_second",
	},
}

ItemTooltip.Special.single_portal =
{
	portal_range =
	{
		name = "max_range",
		valField = "teleport_range_max",
		units = "metre",
	},
	portal_ttl =
	{
		name = "minefield_time_to_live",
		valField = "teleport_gate_ttl",
		units = "second",
	},
}

------------------------------ [ ACTIVE ] ------------------------------

ItemTooltip.Active = {}

ItemTooltip.Active.vortex =
{
	duration =
	{
		name = "duration",
		spellPrototype = "spell_on_hit",
		valField = "spells[1]",
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].duration
		end,
		units = "second",
	},
}

ItemTooltip.Active.achilles_pylum =
{
	dps_emp =
	{
		name = "weapon_damage_emp_dps",
		subPrototype = 	{ "projectile",			"projectile",		"projectile",		nil, 			nil, },
		spellPrototype ={ "spell_on_launch", 	"spell_on_launch", 	"spell_on_launch", 	nil, 			nil, },
		valField = 		{ "aura_param", 		"aura_param_add", 	"period", 			"max_range", 	"projectile_speed", },
		valField = "projectile_speed",
		formula = {
			function( ... )
				local arg = { ... }
				return arg[ 1 ] / arg[ 3 ]
			end,
			function( ... )
				local arg = { ... }
				local time_to_fly = arg[ 4 ] / arg[ 5 ]
				return ( arg[ 1 ] + arg[ 2 ] * time_to_fly ) / arg[ 3 ]
			end,
		},
		concat = "%s - %s",
		units = "damage_per_second",
	},
}

ItemTooltip.Active.shield_link =
{
	swap_speed =
	{
		name = "shield_swap_speed",
		spellPrototype = "spell",
		valField = { "aura_param", "period", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * ( 1 / arg[2] )
		end,
		units = "units_per_second",
	},
}

ItemTooltip.Active.missile_reflector =
{
	shield_heal =
	{
		name = "shield_heal",
		spellPrototype = "additional_spell",
		valField = "influence_param",
		units = "units",
	}
}

ItemTooltip.Active.couple_support =
{
	range =
	{
		name = "target_range",
		spellPrototype = "spell0",
		valField = "aura_range",
		units = "metre",
	},
}

ItemTooltip.Active.swarm_control =
{
	range =
	{
		name = "max_range", --Макс. дальность
		valField = "remote_control_range",
		units = "metre",
	},
}

ItemTooltip.Active.restoring_ions =
{
	shield_charge =
	{
		name = "shield_charge",
		spellPrototype = "spell",
		valField = "influence_param",
		units = "units",
	},
	shield_ttl =
	{
		name = "ttl",
		spellPrototype = "spell",
		valField = "shell_def",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].ttl
		end,
		units = "second",
	},
}

ItemTooltip.Active.return_module =
{
	health =
	{
		name = "localBeacon_health",
		subPrototype = "activate_entity",
		valField = "health",
		units = "units",
	},
	ttl =
	{
		name = "localBeacon_ttl",
		subPrototype = "activate_entity",
		valField = "time_to_live",
		units = "second",
	},
	owner_distance =
	{
		name = "owner_distance",
		subPrototype = "activate_entity",
		valField = "max_owner_distance",
		units = "metre",
	},
	prepare_time =
	{
		name = "prepare_time",
		subPrototype = "activate_entity",
		valField = "teleport_preparation_time",
		units = "second",
	},
}

ItemTooltip.Active.dist_mine =
{
	damage_thermal =
	{
		name = "rocket_damage_thermal",
		large = true,
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function ( ... )
			local arg = { ... }
			local explosion_on_ttl = Def[ arg[1] ].explosion_on_ttl
			return Def[ explosion_on_ttl ].damage_thermal
		end,
		units = "damage",
	},
	damage_range =
	{
		name = "rocket_damage_range",
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function ( ... )
			local arg = { ... }
			local explosion_on_ttl = Def[ arg[1] ].explosion_on_ttl
			return Def[ explosion_on_ttl ].blast_maxDistance
		end,
		units = "metre",
	},
}

ItemTooltip.Active.hook =
{
	wave_speed =
	{
		name = "wave_speed",
		spellPrototype = "spell",
		valField = "spells[1]",
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].aura_param
		end,
		units = "metre_per_second",
	},
	target_range =
	{
		name = "target_range",
		spellPrototype = "spell",
		valField = "spells[1]",
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].aura_range
		end,
		units = "metre",
	},
	duration =
	{
		name = "duration",
		spellPrototype = "spell",
		valField = "spells[1]",
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].duration
		end,
		units = "second",
	},
}

ItemTooltip.Active.battle_station =
{
	health_upgraded =
	{
		name = "station_health",
		subPrototype = "station",
		valField = "upgrades",
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1][1].health
			end,
			function( ... )
				local arg = { ... }
				return arg[1][#arg[1]].health
			end,
		},
		concat = "%s - %s",
		units = "units",
	},
	heal_cost =
	{
		name = "station_heal_cost",
		subPrototype = "station",
		valField = "upgrades",
		formula = function( ... )
			local arg = { ... }
			return arg[1][1].heal_cost
		end,
		units = "units_per_second",
		negative = true,
	},
	heal_speed =
	{
		name = "station_heal_speed",
		subPrototype = "station",
		valField = "upgrades",
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1][1].heal_speed
			end,
			function( ... )
				local arg = { ... }
				return arg[1][#arg[1]].heal_speed
			end,
		},
		concat = "%s - %s",
		units = "units_per_second",
	},
	owner_distance =
	{
		name = "owner_distance",
		subPrototype = "station",
		valField = "owner_distance",
		units = "metre",
	},
}

ItemTooltip.Active.ecm =
{
	damage_mul =
	{
		name = "ecm_common_damage_mul",
		spellPrototype = "additional_spell", --Увеличение урона орудий
		valField = "aura_param",
		units = "percent",
	},
	energy_transfer =
	{
		name = "ecm_common_energy_transfer", --Скорость откачки энергии цели
		spellPrototype = "additional_spell",
		valField = "additional_auras[1].aura_param",
		units = "energy_per_second",
	},
	duration =
	{
		name = "ecm_common_duration", --Время действия на себя
		spellPrototype = "additional_spell",
		valField = "duration",
		units = "second",
	},
}

ItemTooltip.Active.growing_star =
{
	damage_emp =
	{
		name = "weapon_damage_emp",
		subPrototype = {nil, nil, nil, "projectile"},
		valField = { "damage_emp", "projectile_speed", "max_range", "power_charge_coef", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[1]
			end,
			function( ... )
				local arg = { ... }
				local flight_time_max = arg[3] / arg[2]
				local power_charge_coef = arg[4]
				return arg[1] + flight_time_max * power_charge_coef
			end,
		},
		concat = "%s - %s",
		units = "damage",
	},
	range = 
	{
		name = "aura_size", --Размер облака
		subPrototype = { nil, nil, "projectile", "projectile", },
		spellPrototype = { nil, nil, "spell_on_launch", "spell_on_launch", },
		valField = { "projectile_speed", "max_range", "aura_range", "aura_range_add", },
		formula = {
			function( ... )
				local arg = { ... }
				return arg[3]
			end,
			function( ... )
				local arg = { ... }
				local flight_time_max = arg[2] / arg[1]
				return arg[3] + arg[4] * flight_time_max
			end,
		},
		concat = "%s - %s",
		units = "metre",
	},
}

ItemTooltip.Active.multishot =
{
	damage_kinetic =
	{
		name = "weapon_damage_kinetic",
		valField = { "charge_damage_kinetic_per_second", "min_target_charge_time", "max_target_charge_time", },
		formula = {
			function ( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			function ( ... )
				local arg = { ... }
				return arg[1] * arg[3]
			end,
		},
		concat = "%s - %s",
		units = "units",
	},
	damage_emp =
	{
		name = "weapon_damage_emp",
		valField = { "charge_damage_emp_per_second", "min_target_charge_time", "max_target_charge_time", },
		formula = {
			function ( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			function ( ... )
				local arg = { ... }
				return arg[1] * arg[3]
			end,
		},
		concat = "%s - %s",
		units = "units",
	},	
	angle_of_view =
	{
		name = "weapon_angle_of_view",
		valField = "target_cone_angle",
		units = "degree",
	},
}

ItemTooltip.Active.crystal_cone =
{
	dps_thermal =
	{
		name = "drone_damage_thermal_dps",
		subPrototype = { nil, "activate_entity", },
		valField = { "damage_thermal", "primary_weapon", },
		formula = function( ... )
			local arg = { ... }
			local fire_rate = Def[ arg[2] ].fire_rate
			return ( arg[1] * fire_rate ) / 60
		end,
		large = true,
	},
	fire_rate =
	{
		name = "drone_fire_rate",
		subPrototype = "activate_entity",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].fire_rate
		end,
		units = "shot_per_minute",
	},
	dispersion =
	{
		name = "drone_dispersion",
		subPrototype = "activate_entity",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].dispersion
		end,
		units = "degree",
		format = "%3.2f",
		negative = true,
	},
	projectile_speed =
	{
		name = "drone_projectile_speed",
		subPrototype = "activate_entity",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].projectile_speed
		end,
		units = "metre_per_second",
	},
	weapon_range =
	{
		name = "drone_weapon_range",
		subPrototype = "activate_entity",
		valField = "primary_weapon",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].max_range
		end,
		units = "metre",
	},
	max_aim_rot_speed =
	{
		name = "drone_max_aim_rot_speed", --Дрон: скорость наведения орудия
		valField = "max_rot_speed",
		units = "degree_per_second",
	},
	ttl =
	{
		name = "drone_ttl",
		subPrototype = "activate_entity",
		valField = "ttl",
		units = "second",
	},
}

ItemTooltip.Active.companion =
{
	health =
	{
		name = "drone_health",
		subPrototype = "activate_entity",
		valField = "health",
		units = "units",
	},
	control_range =
	{
		name = "drone_control_range",
		subPrototype = "activate_entity",
		valField = "control_range",
		units = "metre",
	},
	max_speed =
	{
		name = "drone_max_speed",
		subPrototype = "activate_entity",
		valField = "max_speed",
		units = "metre_per_second",
	},
}

ItemTooltip.Active.destr_beam_drone =
{
	dps_thermal =
	{
		name = "drone_damage_thermal_dps",
		large = true,
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			local weapon = Def[ arg[1] ].primary_weapon
			return ( Def[ arg[1] ].damage_thermal * Def[ weapon ].fire_rate ) / 60
		end,
		units = "damage_per_second",
	},
	damage_thermal =
	{
		name = "drone_damage_thermal",
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].damage_thermal
		end,
		units = "damage",
	},
	fire_rate =
	{
		name = "drone_fire_rate",
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			local weapon = Def[ arg[1] ].primary_weapon
			return Def[ weapon ].fire_rate
		end,
		units = "shot_per_minute",
	},
	projectile_speed =
	{
		name = "drone_projectile_speed",
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			local weapon = Def[ arg[1] ].primary_weapon
			return Def[ weapon ].projectile_speed
		end,
		units = "metre_per_second",
	},
	weapon_range =
	{
		name = "drone_weapon_range",
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[Def[ arg[1] ].primary_weapon].max_range
		end,
		units = "metre",
	},
	health =
	{
		name = "drone_health",
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].health
		end,
		units = "units",
	},
	ttl =
	{
		name = "drone_ttl",
		subPrototype = "projectile",
		valField = "death_entity",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].ttl
		end,
		units = "second",
	},
}

ItemTooltip.Active.isotope_harvester =
{
	flight_speed =
	{
		name = "drone_max_speed", --Скорость полёта
		valField = { "projectile_speed", },
		formula = function( ... )
			local arg = { ... }
			return -arg[ 1 ]
		end,		
		units = "metre_per_second",		
	},
	flight_rot_speed =
	{
		name = "drone_max_rot_speed", --Скорость поворота
		subPrototype = "projectile",
		valField = "angular_velocity",
		units = "degree_per_second",
	},
}

ItemTooltip.Active.energy_reflector =
{
	shield_dmg_resist =
	{
		name = "shield_dmg_resist",
		spellPrototype = "spell",
		valField = "aura_param",
		units = "units",
	},
	damage_thermal_min =
	{
		name = "min_damage_thermal",
		spellPrototype = "additional_spell",
		valField = "additional_auras[1].aura_param",
		units = "units",
	},
}

ItemTooltip.Active.hull_res_station =
{
	health =
	{
		name = "station_health",
		valField = "activate_entity_health",
		units = "units",
	},
}

ItemTooltip.Active.diststation =
{
	ttl =
	{
		name = "ttl",
		subPrototype = "projectile",
		spellPrototype = "spell",
		valField = "duration",
		units = "second",
	},
}

ItemTooltip.Active.harpoon_gun =
{
	activate_entity_ttl =
	{
		name = "duration",
		valField = "activate_entity_ttl",
		units = "second",
	},
	range =
	{
		name = "max_range",
		valField = "max_range",
		units = "metre",
	},
	projectile_speed =
	{
		name = "weapon_projectile_speed", --Скорость снаряда
		valField = "projectile_speed",
		absValue = true,
		units = "metre_per_second",
	},
}

------------------------------ [ PASSIVE ] ------------------------------

ItemTooltip.Passive = {}

ItemTooltip.Passive.hack_protocol =
{
	range =
	{
		name = "target_range", --Дальность
		spellPrototype = "emergency_barrier_spell",
		valField = "spells[2]",
		formula = function( ... )
			local arg = { ... }
			return Spell[ arg[1] ].target_range
		end,
		units = "metre",
	},
}

--############################################# [ MAIN SECTION ] #############################################--

------------------------------ [ WEAPONS ] ------------------------------

ItemTooltips[ ItemSubtype.ChargedBlast ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.charged_blast.dps_thermal,
		ItemTooltip.Weapon.charged_blast.damage_thermal,
		ItemTooltip.Weapon.charged_blast.fire_rate,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.charged_blast.projectile_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			valField = "charge_levels[4].time",
			units = "second",
		},
		{
			name = "self_damage",
			valField = { "damage_thermal", "charge_levels[4].damage_mul", "charge_levels[4].projectile", },
			formula = {
				function( ... )
					local arg = { ... }
					local blastwave = Def[ arg[3] ].explosion_blast_wave
					return arg[1] * ( 1 + arg[2] ) * Def[ blastwave ].self_damage_coef
				end,
			},
			units = "damage",
		},
		{
			name = "damage",
			valField = { "damage_thermal", "charge_levels[4].damage_mul", },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1] * ( 1 + arg[2] )
				end,
			},
			units = "damage",
		},
		{
			name = "range",
			valField = "charge_levels[4].projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local blastwave = Def[ arg[1] ].explosion_blast_wave
					return Def[ blastwave ].blast_maxDistance
				end,
			},
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SwarmCloud ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic_min_max_charge,
		ItemTooltip.Weapon.damage.kinetic_min_max_charge,
		ItemTooltip.Weapon.fire_rate.min_max_charge,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max_charge,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "dron_heal_amount",
			valField = "charge_levels[2].projectile",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ Def[ arg[1] ].spell ]
				return ( spell.duration / spell.period + 1 ) * spell.aura_param
			end,
			units = "units",
		},
		{
			name = "dron_heal_range",
			valField = "charge_levels[2].projectile",
			formula = function( ... )
				local arg = { ... }
				return Spell[ Def[ arg[1] ].spell ].aura_range
			end,
			units = "metre",
		},
		{
			name = "aura_size", --размер облака у проджектайла
			valField = "charge_levels[2].projectile",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ Def[ arg[1] ].spell_on_launch ]
				return spell.aura_range
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaBursts ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{	
		--Spell_PlasmaBursts
		{
			name = "cloud_dmg_max",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "period" },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1] / arg[2]
				end,
			},
			units = "damage_per_second",
		},
		{
			name = "cloud_dmg_min",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "aura_param_add", "period", "duration" },
			formula = function(...)
				local arg = { ... }
				return ( arg[1] + arg[2] * math.ceil( arg[4] ) ) / arg[3]
			end,
			units = "damage_per_second",
		},
		{
			name = "cloud_dmg_huge_mul",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "additional_auras[1].aura_param" },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[2] / arg[1] - 1
				end,
			},
			units = "percent",
		},
		{
			name = "cloud_size_min",
			spellPrototype = "spell_on_hit",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "cloud_size_max",
			spellPrototype = "spell_on_hit",
			valField = { "aura_range", "aura_range_add", "duration" },
			formula = function(...)
				local arg = { ... }
				return arg[1] + arg[2] * arg[3]
			end,
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		
	},
}

ItemTooltips[ ItemSubtype.KineticStkBomb ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		--WeaponKineticStkBomb_SpellOnDeath
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "blast_dmg",
			spellPrototype = "spell_on_hit",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return aura_param * ( 1 + duration / period )
			end,
			units = "damage",
		},
		{
			name = "blast_maxDistance",
			spellPrototype = "spell_on_hit",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.MagneticGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.HeraldPlasma ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		-- HeraldPlasma_Self
		{
			name = "dispersion_mul",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			absValue = true,
			units = "percent",
		},
		{
			name = "dispersion_mul_max",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local max_stacks = Spell[ arg[1] ].max_stacks
				return aura_param * max_stacks
			end,
			absValue = true,
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		-- HeraldPlasma_Death
		{
			name = "energy_burn",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				local target_spell = Spell[ arg[1] ].target_spell
				local aura_param = Spell[target_spell].aura_param
				local duration = Spell[target_spell].duration
				local period = Spell[target_spell].period
				return aura_param * ( 1 + duration / period )
			end,
			units = "energy_per_second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				local target_spell = Spell[ arg[1] ].target_spell
				return Spell[target_spell].aura_range
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.Cryolaser ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "target_range",
			valField = "spell_on_hit_max_range",
			units = "metre",
		},
		{
			name = "speed_dec",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
		},
		{
			name = "rot_speed_mul",
			spellPrototype = "spell_on_hit",
			valField = "additional_auras[1].aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaGuard ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "crit_chance_add",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_hit",
			valField = "max_stacks",
			units = "none",
		},
		{
			name = "shield_transfer",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				-- return arg[1] * ( arg[2] / arg[3] + 1 )
				return arg[1] 
			end,
			units = "energy",
		},
	},
}

ItemTooltips[ ItemSubtype.MirvRocket ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.projectile_speed,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams = 
	{
		{
			name = "mirvrocket1_range",
			subPrototype = "projectile",
			valField = "child_rockets.rocket",
			formula = function( ... )
				local arg = { ... }
				return Def[arg [1] ].max_range
				end,	
			units = "metre",
		},
		{
			name = "mirvrocket1_speed",
			subPrototype = "projectile",
			valField = "child_rockets.rocket",
			formula = function( ... )
				local arg = { ... }
				return Def[arg [1] ].speed
				end,			
			units = "metre",
		},
		-- {
			-- name = "mirvrocket1_damage_thermal",
			-- subPrototype = "projectile",
			-- valField = "child_rockets.rocket",
			-- formula = function( ... )
				-- local arg = { ... }
				-- local ebw = Def[ arg[1] ].explosion_blast_wave
				-- return Def[ebw].damage_thermal
				-- end,			
			-- units = "damage_thermal",
		-- },
		{
		name = "mirvrocket1_damage_thermal", --Урон (кинетич.)
		valField = "damage_kinetic",
		units = "damage",
		},
		
	},
}

ItemTooltips[ ItemSubtype.ChainLaser ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "link_range",
			valField = "link_range",
			units = "metre",
		},
		{
			name = "damage_min",
			valField = "chaing_damage",
			formula = function( ... )
				local arg = { ... }
				return arg[1][ #arg[1] ]
			end,
			units = "percent",
		},
		{
			name = "chain_lenght",
			valField = "chaing_damage",
			formula = function( ... )
				local arg = { ... }
				return #arg[1] - 1
			end,
			units = "none",
		},
	},
}

ItemTooltips[ ItemSubtype.FlameThrower ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		-- spell_on_hit
		{
			name = "damage_fire",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "fire_time",
			subPrototype = "projectile",
			spellPrototype = "death_entity_on_static_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.JerichoTrumpets ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "speed_dec",
			spellPrototype = "spell_on_hit",
			valField = "spells",
			formula = function( ... )
				local arg = { ... }
				return - Spell[ arg[1][2] ].aura_param
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaHunterGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "strafe_speed_dec",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.SingularityStriker ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max_spell,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "speed_bust",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "max_stacks",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaCompressor ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration_add",
			spellPrototype = "spell_on_hit",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			format = "%2.1f",
			units = "second",
		},
		{
			name = "energy_cost_per_shot",
			valField = "shot_energy_cost",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserHealNormal ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "heal_ally",
			valField = { "heal_ally", "fire_rate", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 4 * arg[2] / 60
			end,
			units = "units_per_second",
		},
		{
			name = "heal_ally_energy_cost",
			valField = "heal_ally_energy_cost",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 4
			end,
			units = "units_per_second",
		},
		{
			name = "shield_resist_add",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.MacheteSmartRL2 ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.angle_of_view,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.PrometheusFire ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_min_max,
		ItemTooltip.Weapon.damage.thermal_min_max,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "energy_burn",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.LokiPrometheusFire ] =  -- ПУшка для Локи
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_min_max,
		ItemTooltip.Weapon.damage.thermal_min_max,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "energy_burn",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.NanobotsCritAdaptive ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		-- spell
		{
			name = "hull_heal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "influence_param",
			units = "units",
		},
		-- spell_on_crit
		{
			name = "resist_add",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserVUX ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.SpikeOnSpeedLaser ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_min_max_spell,
		ItemTooltip.Weapon.damage.thermal_min_max_spell,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "damage_add_max",
			spellPrototype = "spell_on_max_speed_plus",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.InterferentPlasmaEmitter ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "cooldown",
			spellPrototype = "spell_on_hit",
			valField = "apply_interval",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.RailActiveSuppressor ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "cooldown_dec",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return 1 + arg[1]
			end,
			units = "none",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyBlaster ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "energy_burn",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "period", },
			formula  = function ( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "energy_per_second",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration", 
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.BlastWeaponDestructor ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "cloud_dmg",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "cloud_size",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.ZoneCleaner ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "cloud_dmg_min",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
		{
			name = "cloud_dmg_max",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = { "aura_param", "aura_param_add", "duration", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] + arg[2] * arg[3]
			end,
			units = "damage_per_second",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "cloud_size",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.ZhenGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.WeaknessScoutPlasma ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "damage_add",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ForkLaserLight ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_min_max,
		ItemTooltip.Weapon.damage.thermal_min_max,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.FrontReaperGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.SuddenFire ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
		ItemTooltip.Weapon.energy_cost_per_second,
	},
	
	descriptionParams = 
	{
		{
			name = "damage_add",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "damage",
		},
	},
}

ItemTooltips[ ItemSubtype.CritPlasmaWolfM ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = {
		{
			name = "damage",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = {"aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "damage",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.AxeShot ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = {
		{
			name = "resist_dec",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
	},
}


ItemTooltips[ ItemSubtype.ForkLaserFoxM ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
		ItemTooltip.Weapon.energy_cost_per_second,
	},
}

ItemTooltips[ ItemSubtype.MacheteCuttingEdge ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "hull_add",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "target_range",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.AcceleratedAmplifyer ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_min_max_rate,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage_charge_period",
			valField = "damage_charge_period",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SpacetimeAnomaly ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "max_stacks", },
			formula = {
				function ( ... )
					local arg = { ... }
					return arg[1]
				end,
				function ( ... )
					local arg = { ... }
					return arg[1] * arg[2]
				end,
			},
			concat = "%s - %s",
			units = "percent",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_hit",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_hit",
			valField = "max_stacks",
			units = "none",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaVolley ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.RailVolcano ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance_min_max,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.OverheatingLaser ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "heat_slow_base",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "heat_slow_max",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "max_stacks" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.ElectricPotentialInductor ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "neighborhood_dps",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_hit",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.KineticCDRbyCrit ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "cooldown_dec",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "influence_param",
			formula = function( ... )
				local arg = { ... }
				local oldValue = 1
				local newValue = 1 / ( 1 - arg[1] )
				return oldValue - newValue
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenGravityAnomaly ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.gravy_anomaly.size,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "dmg",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},
		{
			name = "aura_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SpyDroneRailgun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams = {
		{
			name = "activation_range",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.RailgunBasic ] = -- Штурмовой рейлган / Assault Railgun
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "crit_bonus",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "damage_bonus",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "stacks",
			spellPrototype = "spell_on_hit",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PirateRail ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.RailgunAutofire ] = -- Залповое орудие / Shrapnel Cannon
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "pirate_crittime",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
		
		{
			name = "pirate_critsubmaneuver",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "percent",
		},
		
		{
			name = "pirate_critstacks",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "max_stacks",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.RailgunSniper ] = -- Пушка Гаусса / Gauss Cannon
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic_charge,
		ItemTooltip.Weapon.damage.kinetic_charge,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
		ItemTooltip.Weapon.charge,
	},
	
	descriptionParams =
	{
		{
			name = "pirate_crittime",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
		
		{
			name = "pirate_critdamage",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CrystallSparks ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic_min_max_rate_2,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "range",
			subPrototype = "projectile",
			valField = "link_range",
			units = "metre",
		},
		--[[
		{
			name = "dmg",
			subPrototype = {"projectile", nil },
			valField = {"chaing_damage[2]", "damage_kinetic"  },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},
		]]--
	},
}

ItemTooltips[ ItemSubtype.RailgunHeavy ] = -- Рельсовый миномет / Coil Mortar
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "pirate_impulse",
			spellPrototype = "spell_on_hit",
			valField = "influence_param",
			units = "metre_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.FrontLineCannon ] = -- #71996
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.BigCannon ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.SparksCannon ] =    -- Кинетический нагнетатель / Kinetic Supercharger
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
		
	descriptionParams = --TODO: Tooltip
	{
		{
			name = "DOT",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = {"aura_param", "period"},
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units",
		},
		{
			name = "blastCloudRange",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		-- {
			-- name = "blastCloudDamage",
			-- subPrototype = "projectile",
			-- spellPrototype = "spell",
			-- valField = "aura_param",
			-- units = "units",
		-- },
		-- {
			-- name = "blastCloudDamageHuge",
			-- subPrototype = "projectile",
			-- spellPrototype = "spell",
			-- valField = "additional_auras[1].aura_param",
			-- units = "units",
		-- },
		{
			name = "blastCloudDuration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Minigun ] = -- Ускоритель массы / Mass Driver
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
		descriptionParams = --TODO: Tooltip
	{
		{
			name = "hull_kinetic_dec",
			spellPrototype = "spell_on_hit",
			valField = {"aura_param", "max_stacks"},
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},	
}

ItemTooltips[ ItemSubtype.ForkLaser ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams =
	{
		{
			name = "target_energy_cost",
			valField = "target_energy_cost",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.LengtheningBeam ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "dmgRngSpd",
			valField = { "max_range_add", "impulse_time" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "metre_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserBasic ] =    -- Лучевая пушка / Beam Cannon
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
		{
			name = "streak_time",
			valField = "spell_on_hit_streak_time",
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserHeal ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "heal",
			valField = { "heal_ally", "fire_rate", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 4 * arg[2] / 60 --TODO: 4? 0_о -- у лазера 4 ветви от каждого орудия
			end,
			units = "units_per_second",
		},
		{
			name = "heal_cost",
			valField = "heal_ally_energy_cost",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 4
			end,
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.SWGift ] =    -- Турбофазер DN-1 / Turbophaser DN-1
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.LaserEconomic ] =    -- Импульсный лазер / Pulse Laser
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "pirate_fire_rate",
			valField = "fire_rate_max",
			units = "shot_per_minute",
		},
		{
			name = "pirate_fire_rate_add",
			valField = { "fire_rate", "fire_rate_max", "fire_rate_add" },
			formula = function( ... )
				local arg = { ... }
				return ( arg[2] - arg[1] ) / arg[3]
			end,
			units = "second",
		},
		{
			name = "pirate_dps",
			valField = { "damage_thermal", "fire_rate_max", "fire_rate_add" },
			formula = function( ... )
				local arg = { ... }
				if arg[3] == 0 then return 0 end
				return arg[1] * arg[2] / 60
			end,
			units = "damage_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.ColdRay ] =    -- Грави-излучатель / Gravi-Beamer
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "spell_max_stacks",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "max_stacks" },
			formula = function( ... )
				local arg = { ... }
				return ( 1 - 1 / ( 1 + arg[1] * arg[2] ) )
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserSniper ] =    -- Тяжелый бластер / Heavy Blaster
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_min_max_rate,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.LaserSniperPirate ] =    -- Тяжелый бластер Пиртаский / Heavy Blaster
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_min_max_rate,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
		descriptionParams =
	{
		{
			name = "damage",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "regen_dec",
			spellPrototype = "spell_on_hit",
			valField = "reduce_heal_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserHeavy ] =    -- Ионный излучатель / Ion Emitter
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "weapon_penetration",
			valField = "penetration_stack_max",
			units = "units",
		},
		{
			name = "weapon_penetration_time_up",
			valField = { "penetration_stack_max", "penetration_stack_add", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			negative = true,
			units = "second",
		},
		{
			name = "pirate_energy_burn",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "pirate_duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "pirate_max_stacks",
			spellPrototype = "spell_on_hit",
			valField = "max_stacks",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SuppressingFire ] = -- Фазовый подавитель / Phase Suppressor
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "reduce_heal",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].reduce_heal_param
			end,
			units = "none",
		},
		{
			name = "weapon_damage_thermal_dps",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.aura_param / spell.period
			end,
			units = "damage",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "reduce_heal_pirate",
			subPrototype = "projectile",
			spellPrototype = "spell",
			--valField = "additional_auras[1].aura_param",
			valField = "additional_auras",
			formula = function( ... )
				local arg = { ... }
				return arg[1][1].aura_param
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmagunBasic ] =    -- Плазменная пушка / Plasma Gun
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}


ItemTooltips[ ItemSubtype.PlasmagunEnergy ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
		ItemTooltip.Weapon.energy_cost_per_second,
	},
}

ItemTooltips[ ItemSubtype.PlasmaBlade ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "strafe_speed_dec",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
		},
	},
}

ItemTooltips[ ItemSubtype.Grab ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "impulse",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "influence_param",
			units = "metre_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmagunAutofire ] = -- Скорострельный бластер / RF Blaster
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_min_max_plain,
		ItemTooltip.Weapon.damage.emp_min_max,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.PlasmagunPirate ] = -- Скорострельный бластер Пиртаский/ RF Blaster
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_min_max_damage,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
		{
			name = "stac",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "fire_rate",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "percent",
		},		
	},
}

ItemTooltips[ ItemSubtype.PlasmagunSniper ] = -- Позитронная пушка / Positron Cannon
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_charge,
		ItemTooltip.Weapon.damage.emp_charge,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
		ItemTooltip.Weapon.charge,
	},
	
	descriptionParams =
	{
		{
			name = "pirate_cooltime",
			subPrototype = "projectile",
			valField = "spell_on_crit",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				if not spell then return 0 end
				return spell.duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmagunHeavy ] =    -- Генератор сингулярности / Singularity Cannon
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.Fly ] =    -- Дисперсионная пушка / Scatter Gun
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.Phaser ] =    -- Фазер / Phaser
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_min_max_charge,
		ItemTooltip.Weapon.damage.emp_min_max_charge,
		ItemTooltip.Weapon.fire_rate.min_max_charge,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max_charge,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams =
	{
		{
			name = "blast_dmg",
			valField = "explosion_mul",
			units = "damage",
		},
	},
}

ItemTooltips[ ItemSubtype.NanobotsCloud ] =    -- Установка «Затмение» / 'Eclipse' Launcher
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams =
	{
		{
			name = "blastHeal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "blastHealRange",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "HealRange",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "Heal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SmartRL] = -- Потоковый фазер / Flux Phaser
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.Radiation_Beam ] =    -- Деструктор / Destructor
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams =
	{
		{
			name = "dot_dmg_from",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "damage",
		},
		{
			name = "dot_dmg_to",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "damage",
		},
		{
			name = "dot_range",
			spellPrototype = "spell_on_hit",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "damage",
			spellPrototype = "spell_on_hit",
			valField = "additional_auras",
			formula = function( ... )
				local arg = { ... }
				return arg[1][1].aura_param
			end,
			units = "units",
		},
		{
			name = "range",
			spellPrototype = "spell_on_hit",
			valField = "additional_auras",
			formula = function( ... )
				local arg = { ... }
				return arg[1][1].aura_range
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SuppressingGunNY ] =
{
	tooltipParams =   
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
		{
			name = "reduce_heal",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].reduce_heal_param
			end,
			units = "none",
		},
		{
			name = "weapon_damage_thermal_dps",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.aura_param / spell.period
			end,
			units = "damage",
		},
		{
			name = "weapon_damage_thermal_dps_destr",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.aura_param / spell.period * 2
			end,
			units = "damage",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.MinigunNY ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.DestrResonatingLaser ] =
{
	tooltipParams =   
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "streak_time",
			valField = "spell_on_hit_streak_time",
			units = "second",
			negative = true,
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_hit",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "dmg_per_sec",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SmartRocketLauncherNY ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.KineticFloatingCrit ] =    --
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance_min_max,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.RailgunDestr ] =    -- Рейлган эсминца
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams = 
	{
		{
			name = "range",
			subPrototype = "projectile",
			valField = "link_range",
			units = "metre",
		},
	}	
}

ItemTooltips[ ItemSubtype.OrbGun ] =    -- Метатель ака
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "rad_dmg",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( 1 / arg[2] )
			end,
			units = "units",
		},
		{
			name = "rad_size",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.OrbeGun_Pirate ] =    -- Метатель ака
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_min_max_rate,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "rad_dmg",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( 1 / arg[2] )
			end,
			units = "units",
		},
		{
			name = "rad_size",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.OrbGunUnique ] =    --
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "rad_dmg",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( 1 / arg[2] )
			end,
			units = "units",
		},
		{
			name = "rad_size",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserConeHeal  ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "heal",
			valField = { "heal_ally", "fire_rate", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 4 * arg[2] / 60
			end,
			units = "units_per_second",
		},
		{
			name = "heal_cost",
			valField = "heal_ally_energy_cost",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserBlaster ] =    -- Мезонная пушка
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_min_max_rate,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}


ItemTooltips[ ItemSubtype.LaserBlasterPirate ] =    -- Мезонная пушка Пиратов
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_min_max_rate,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}
ItemTooltips[ ItemSubtype.GreenHealRailgun] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "heal",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	}
}

ItemTooltips[ ItemSubtype.PlasmaSplash] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "energy_regen",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "influence_param",
			units = "units",
		},
	}
}

ItemTooltips[ ItemSubtype.ScrapAttractor] = -- #0070952
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "auto_pickup_bonus_range",
			subPrototype = "projectile",
			valField = "auto_pickup_bonus_range",
			units = "metre",
		},
		{
			name = "shield_heal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "target_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.FunnyDoubleMissile] = -- #0070952
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.BubbleGun] = -- #0066891
{
	tooltipParams =
	{
		ItemTooltip.Weapon.bubble_gun.dps_emp_bubble,
		ItemTooltip.Weapon.bubble_gun.dps_emp_bullet,
		ItemTooltip.Weapon.bubble_gun.damage_emp_bubble,
		ItemTooltip.Weapon.bubble_gun.damage_emp_bullet,
		ItemTooltip.Weapon.fire_rate.min_max_charge,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.bubble_gun.projectile_speed_bubble,
		ItemTooltip.Weapon.bubble_gun.projectile_speed_bullet,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown_chargeBubble,
	},
}

ItemTooltips[ ItemSubtype.CorrosiveGunScout ] = -- #0081984
{
	tooltipParams =
	{
		ItemTooltip.Weapon.corrosive_gun.dps_kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell_on_hit",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local period = Spell[ arg[1] ].period
				local duration = Spell[ arg[1] ].duration
				return aura_param * ( duration / period + 1 )
			end,
			units = "units",
		},
	},
}


ItemTooltips[ ItemSubtype.CorrosiveGun ] = -- #0067026
{
	tooltipParams =
	{
		ItemTooltip.Weapon.corrosive_gun.dps_kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.HeatingGun ] =  -- Кристаллический нагреватель
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_min_max_damage,
		ItemTooltip.Weapon.damage.emp_min_max,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.CrystalBuckshotGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range_min_max,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.LoudEcho ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.loud_echo.dps_emp,
		ItemTooltip.Weapon.loud_echo.damage_emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "back_range",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local backProjectile = Def[ projectile.child_rockets.rocket ]
					return backProjectile.max_range
				end,
			},
			units = "metre",
		},
		{
			name = "aura_param",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local backProjectile = Def[ projectile.child_rockets.rocket ]
					local backSpell = Spell[ backProjectile.spell ]
					return backSpell.aura_param
				end,
			},
			units = "percent",
		},
		{
			name = "duration",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local backProjectile = Def[ projectile.child_rockets.rocket ]
					local backSpell = Spell[ backProjectile.spell ]
					return backSpell.duration
				end,
			},
			units = "second",
		},
		{
			name = "max_stacks",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local backProjectile = Def[ projectile.child_rockets.rocket ]
					local backSpell = Spell[ backProjectile.spell ]
					return backSpell.max_stacks
				end,
			},
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ReaverGunPrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.AlienGunPrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
	},
}

ItemTooltips[ ItemSubtype.NanobotsHealBonus ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "heal_amount",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local back_projectile = Def[ projectile.child_rockets.rocket ]
					local death_entity = Def[ back_projectile.death_entity ]
					local death_spell = Spell[ death_entity.spell_approach ]
					return death_spell.aura_param * ( death_spell.duration / death_spell.period + 1 )
				end,
			},
			units = "units",
		},
		{
			name = "heal_range",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local back_projectile = Def[ projectile.child_rockets.rocket ]
					local death_entity = Def[ back_projectile.death_entity ]
					local death_spell = Spell[ death_entity.spell_approach ]
					return death_spell.aura_range
				end,
			},
			units = "metre",
		},
		{
			name = "heal_duration",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local back_projectile = Def[ projectile.child_rockets.rocket ]
					local death_entity = Def[ back_projectile.death_entity ]
					local death_spell = Spell[ death_entity.spell_approach ]
					return death_spell.duration
				end,
			},
			units = "second",
		},
		{
			name = "bonus_ttl",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local back_projectile = Def[ projectile.child_rockets.rocket ]
					local death_entity = Def[ back_projectile.death_entity ]
					return death_entity.ttl
				end,
			},
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldHeal ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "shield_heal",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function(...)
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			units = "units",
		},
		{
			name = "energy_heal",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function(...)
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			units = "units",
		},
		{
			name = "energy_burn",
			spellPrototype = "spell_on_hit",
			valField = "spells[3]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return aura_param * ( 1 + duration / period )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PaperGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.NailPaperGun ] =
	ItemTooltips[ ItemSubtype.PaperGun ]

ItemTooltips[ ItemSubtype.DoubleThermalBlastgun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.ZmHumansGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "hit_pulse",
			spellPrototype = "spell_on_hit",
			valField = "influence_param",
			formula = function(...)
				local arg = { ... }
				return -arg[1]
			end,
			units = "metre_per_second_2",
		},
	},
}

ItemTooltips[ ItemSubtype.ZmAliensGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.ProtozanBlaster ] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.protozan_blaster.dps_thermal,
		ItemTooltip.Weapon.damage.thermal_min_max_charge,
		ItemTooltip.Weapon.protozan_blaster.fire_rate,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.protozan_blaster.projectile_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
		ItemTooltip.Weapon.charge,
	},
	descriptionParams =
	{
		{
			name = "resist_dec",
			valField = "charge_levels[2].projectile",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell
				return Spell[ spell ].aura_param
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Gleipnir ] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "resist",
			spellPrototype = "spell_on_hit",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},
		{
			name = "resist_duration",
			spellPrototype = "spell_on_hit",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_hit",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].max_stacks
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaWebLaser ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.laser_ray.fake_width,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "streak_time",
			valField = "spell_on_hit_streak_time_fake",
			units = "second",
			negative = true,
		},
		{
			name = "dmg_per_sec",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[arg[1]].additional_auras[1].aura_param
			end,
			units = "units_per_second",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[arg[1]].duration
			end,
			units = "second",
		},
		{
			name = "max_speed",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[arg[1]].min_speed_percent
			end,
			units = "percent",
		},
		{
			name = "dmg_per_sec_speed",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[arg[1]]
				return spell.aura_param / spell.period
			end,
			units = "units_per_second",
		},
		{
			name = "dmg_per_sec_huge",
			spellPrototype = "spell_on_hit",		
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[arg[1]]
				return spell.additional_auras[3].aura_param / 1.75 - spell.additional_auras[1].aura_param
			end,
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.ThorHammer ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.thor_hammer.dps_kinetic,
		ItemTooltip.Weapon.thor_hammer.damage_kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.thor_hammer.range_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "aura_param",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local backProjectile = Def[ projectile.child_rockets.rocket ]
					local backSpell = Spell[ backProjectile.spell ]
					return backSpell.aura_param
				end,
			},
			units = "percent",
		},
		{
			name = "aura_param_2",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local backProjectile = Def[ projectile.child_rockets.rocket ]
					local backSpell = Spell[ backProjectile.spell ]
					return backSpell.additional_auras[1].aura_param
				end,
			},
			units = "percent",
		},
		{
			name = "duration",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local backProjectile = Def[ projectile.child_rockets.rocket ]
					local backSpell = Spell[ backProjectile.spell ]
					return backSpell.duration
				end,
			},
			units = "second",
		},
		{
			name = "max_stacks",
			valField = "projectile",
			formula = {
				function( ... )
					local arg = { ... }
					local projectile = Def[ arg[ 1 ] ]
					local backProjectile = Def[ projectile.child_rockets.rocket ]
					local backSpell = Spell[ backProjectile.spell ]
					return backSpell.max_stacks
				end,
			},
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Hammer ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "mine_damage",
			valField = "projectile",
			formula = function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 1 ] ]
				local mine = Def[ projectile.death_entity ]
				local blast = Def[ mine.explosion_blast_wave ]
				return blast.damage_thermal
			end,
			units = "units",
		},
		{
			name = "blast_maxDistance",
			valField = "projectile",
			formula = function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 1 ] ]
				local mine = Def[ projectile.death_entity ]
				local blast = Def[ mine.explosion_blast_wave ]
				return blast.blast_maxDistance
			end,
			units = "metre",
		},
		{
			name = "mine_range",
			valField = "projectile",
			formula = function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 1 ] ]
				local mine = Def[ projectile.death_entity ]
				return mine.detonation_radius
			end,
			units = "metre",
		},
		{
			name = "detonation_timeout",
			valField = "projectile",
			formula = function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 1 ] ]
				local mine = Def[ projectile.death_entity ]
				return mine.detonation_timeout
			end,
			units = "second",
		},
		{
			name = "mine_ttl",
			valField = "projectile",
			formula = function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 1 ] ]
				local mine = Def[ projectile.death_entity ]
				return mine.time_to_live
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SmartShotgun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "missile_per_target",
			valField = "max_pellets_per_target",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.DoubleThermalShotgun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_charge,
		ItemTooltip.Weapon.damage.thermal_charge,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_param",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
	},
}

------------------------------ [ MODS ] ------------------------------

ItemTooltips[ ItemSubtype.LaserUp1 ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserPenetrate ] =
{
	descriptionParams =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserEconom ] =
{
	descriptionParams =
	{
		{
			name = "heat_add_mul",
			valField = "heat_add_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.LaserEMP ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserRadio ] =
{
	descriptionParams =
	{
		{
			name = "range_mul",
			valField = "optimal_range_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserFocus ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "range_mul",
			valField = "optimal_range_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RailUp1 ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RailPerfect ] =
{
	descriptionParams =
	{
		{
			name = "dispersion_mul",
			valField = "dispersion_mul",
			units = "percent",
			absValue = true
		},
	},
}

ItemTooltips[ ItemSubtype.RailVanadium ] =
{
	descriptionParams =
	{
		{
			name = "fire_rate_mul",
			valField = "fire_rate_mul",
			units = "percent",
		},
		{
			name = "dispersion_mul",
			valField = "dispersion_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RailThermal ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RailCumulative ] =
{
	descriptionParams =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RailUranium ] =
{
	descriptionParams =
	{
		{
			name = "projectile_speed_mul",
			valField = "projectile_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaUp1 ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaCold ] =
{
	descriptionParams =
	{
		{
			name = "heat_add_mul",
			valField = "heat_add_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaFast ] =
{
	descriptionParams =
	{
		{
			name = "projectile_speed_mul",
			valField = "projectile_speed_mul",
			units = "percent",
		},
		{
			name = "dispersion_mul",
			valField = "dispersion_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaNeedle ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaSupernova ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "projectile_speed_mul",
			valField = "projectile_speed_mul",
			units = "percent",
		},
		{
			name = "heat_add_mul",
			valField = "heat_add_mul",
			negative = true,
			units = "percent_minus",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaAlienKiller ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "alien_damage_mul",
			valField = "alien_damage_mul",
			units = "percent",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserAlienKiller ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "alien_damage_mul",
			valField = "alien_damage_mul",
			units = "percent",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RailAlienKiller ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "alien_damage_mul",
			valField = "alien_damage_mul",
			units = "percent",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaAlienKiller2 ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "alien_damage_mul",
			valField = "alien_damage_mul",
			units = "percent",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserAlienKiller2 ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "alien_damage_mul",
			valField = "alien_damage_mul",
			units = "percent",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RailAlienKiller2 ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "alien_damage_mul",
			valField = "alien_damage_mul",
			units = "percent",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaHugeKiller ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "huge_damage_mul",
			valField = "signature_huge_damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserHugeKiller ] =
	ItemTooltips[ ItemSubtype.PlasmaHugeKiller ]
	
ItemTooltips[ ItemSubtype.RailHugeKiller ] =
	ItemTooltips[ ItemSubtype.PlasmaHugeKiller ]

ItemTooltips[ ItemSubtype.WeaponSt ] = -- Орудие СТ
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

------------------------------ [ MISSILES ] ------------------------------

ItemTooltips[ ItemSubtype.SpaceMissile_AAMu ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_AAMEMP] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_AAMKin] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.kinetic,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_AAMSlow] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
		},
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_Slowdown] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
		},
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_April] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.kinetic,
		ItemTooltip.cooldown,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function (...)
				local arg = {...}
				return 1 - 1 / ( 1 + arg[1] )
			end,
			units = "percent",
		},
		{
			name = "ttl",
			subPrototype = "death_entity",
			valField = "ttl",
			units = "second",
		},
		{
			name = "heal_duration",
			subPrototype = "death_entity",
			spellPrototype = "spell_approach",
			valField = "duration",
			units = "second",
		},
		{
			name = "heal_per_second",
			subPrototype = "death_entity",
			spellPrototype = "spell_approach",
			valField = {"aura_param", "period",},
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "boost_param",
			subPrototype = "death_entity",
			spellPrototype = "spell_approach",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_EMP ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_Kinetic] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.kinetic,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_Standart] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_Helloween] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_Ion] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_EnergyNullifierField ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_PropulsionJammField ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_HealParts] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "healpersecond",
			subPrototype = "death_entity",
			spellPrototype = "spell_approach",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},		
		{
			name = "duration",
			subPrototype = "death_entity",
			spellPrototype = "spell_approach",
			valField = "duration",
			units = "second",
		},
		{
			name = "ttl",
			subPrototype = "death_entity",
			valField = "ttl",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_ResistSub] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "resistsub",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},		
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_ChildRockets] =
{
	tooltipParams =
	{
		ItemTooltip.Rocket.warhead.damage_thermal,
		ItemTooltip.Rocket.warhead.damage_range,
		ItemTooltip.Rocket.warhead.flight_range,
		ItemTooltip.Rocket.warhead.flight_speed,
		ItemTooltip.Rocket.warhead.flight_rot_speed,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "warheads_count",
			valField = "child_rockets.scheme",
			formula = function( ... )
				local arg = { ... }
				local sum = 0
				for m,t in pairs( arg[1] ) do
					sum = sum + t.amount
				end
				return sum
			end,
			units = "pieces",
		},
		{
			name = "search_range",
			valField = "child_rockets.direct_range",
			units = "metre",
		},
		{
			name = "max_warheads_per_target",
			valField = "child_rockets.max_rockets_per_target",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_Cruise] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_DoomDay] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_Torpedo] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_Nuke] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		
		{
			name = "time_to_live",
			valField = "time_to_live",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "sec",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_Volley ] =
{
	tooltipParams =
	{
		ItemTooltip.Rocket.volley.damage.kinetic,
		ItemTooltip.Explosions.damage.kinetic_small,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "volley_count",
			valField = "volley_count",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_Barrage ] =
{
	tooltipParams =
	{
		ItemTooltip.Rocket.volley.damage.thermal,
		ItemTooltip.Explosions.damage.thermal_small,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "volley_count",
			valField = "volley_count",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_Fireworks ] =
{
	tooltipParams =
	{
		ItemTooltip.Rocket.volley.damage.thermal,
		ItemTooltip.Explosions.damage.thermal_small,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "volley_count",
			valField = "volley_count",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_Fireworks_Prize ] =
{
	tooltipParams =
	{
		ItemTooltip.Rocket.volley.damage.thermal,
		ItemTooltip.Explosions.damage.thermal_small,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "volley_count",
			valField = "volley_count",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_NewYear ] =
{
	tooltipParams =
	{
		ItemTooltip.Rocket.volley.damage.thermal,
		ItemTooltip.Explosions.damage.thermal_small,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "volley_count",
			valField = "volley_count",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.DeathRay ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "charge_time",
			valField = "charge_time",
			units = "second",
			negative = true,
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "blast_maxDistance",
			subPrototype = "explosion_blast_wave",
			valField = "blast_maxDistance",
			units = "metre",
		},
		{
			name = "damage_thermal",
			subPrototype = "explosion_blast_wave",
			valField = "damage_thermal",
			units = "damage",
		},
	},
}

ItemTooltips[ItemSubtype.SmallSpiralMine] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.spiral.thermal,
		ItemTooltip.Explosions.spiral.range,
		ItemTooltip.Entity.health,
		ItemTooltip.Entity.activation_time,
		ItemTooltip.Entity.ttl,
		ItemTooltip.Entity.range,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},

	descriptionParams =
	{
		{
			name = "max_mines",
			valField = "activate_entity_max",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.ProximityMineGreen] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Minefield.ttl,
		ItemTooltip.Minefield.range,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams =
	{
		-- Spell_ProximityMineGreen1
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].target_range
			end,
			units = "metre",
		},
		{
			name = "cooldown_mul",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		-- Spell_ProximityMineGreen2
		{
			name = "heat_add_mul",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.MineField] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Minefield.ttl,
		ItemTooltip.Minefield.range,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams = --TODO: DESC
	{
		{
			name = "field_radius",
			valField = "field_radius",
			units = "metre",
		},
		{
			name = "time_to_live",
			valField = "time_to_live",
			units = "second",
		},
		{
			name = "max_mines",
			valField = "max_mines",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.ProximityMine] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Minefield.ttl,
		ItemTooltip.Minefield.range,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.BasicGuidedDron] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
		{
			name = "optimal_range",
			valField = "optimal_range",
			units = "metre",
			invisible = true,
		},
		{
			name = "max_speed",
			valField = "max_speed",
			units = "metre_per_second",
			invisible = true,
		},
		{
			name = "acceleration",
			valField = "acceleration",
			units = "metre_per_second_2",
			invisible = true,
		},
	},
	
	descriptionParams =
	{
		{
			name = "health",
			valField = "health",
			units = "units",
		},
		{
			name = "max_range",
			valField = "control_range",
			units = "metre",
		},
		--[[
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "units",
		},
		]]--
	},
}

ItemTooltips[ItemSubtype.GuidedDron] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Drone.health,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "rot_speed_mul",
			subPrototype = "activate_entity",
			spellPrototype = "active_spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
			negative = true,
		},
		{
			name = "aura_range",
			subPrototype = "activate_entity",
			spellPrototype = "active_spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.GuidedDronRL ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Drone.health,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			subPrototype = "activate_entity",
			spellPrototype = "active_spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.DestrMunition_HealBot ] = --
{
	tooltipParams =
	{
		ItemTooltip.Drone.destr.health,
		ItemTooltip.Drone.destr.ttl,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		--[[
		{
			name = "drone_hp",
			valField = "health",
			units = "units",
		},
		{
			name = "drone_ttl",
			valField = "ttl",
			units = "second",
		},
		]]--
		{
			name = "heal",
			spellPrototype = "active_aura",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "heal_range",
			spellPrototype = "active_aura",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.DestrMunition_AnomalyBot ] = --
{
	tooltipParams =
	{
		ItemTooltip.Drone.destr.health,
		ItemTooltip.Drone.destr.ttl,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "range",
			spellPrototype = "active_aura",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "push_speed",
			spellPrototype = "active_aura",
			valField = "aura_param",
			units = "metre_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_MagnetMine ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Minefield.ttl,
		ItemTooltip.Rocket.detonation_radius,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "flight_speed",
			valField = "speed",
			units = "metre_per_second",
		},
		{
			name = "alien_damage_mul",
			valField = "alien_damage_coef",
			formula = function( ... )
				local arg = { ... }
				return arg[1] - 1
			end,
			units = "percent",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_coef",
			formula = function( ... )
				local arg = { ... }
				return arg[1] - 1
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.Expendable_BattleDroneMedium ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "health",
			valField = "health",
			units = "units",
		},
		{
			name = "max_range",
			valField = "control_range",
			units = "metre",
		},
		{
			name = "alien_damage_mul",
			valField = "alien_damage_coef",
			formula = function( ... )
				local arg = { ... }
				return arg[1] - 1
			end,
			units = "percent",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_coef",
			formula = function( ... )
				local arg = { ... }
				return arg[1] - 1
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.Expendable_BattleDroneLarge ] =
	ItemTooltips[ ItemSubtype.Expendable_BattleDroneMedium ]

ItemTooltips[ ItemSubtype.DestrMunition_BattleDroneHuge ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		
		ItemTooltip.Drone.destr.health,
		ItemTooltip.Drone.destr.ttl,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "health",
			valField = "health",
			units = "units",
		},
		{
			name = "alien_damage_mul",
			valField = "alien_damage_coef",
			formula = function( ... )
				local arg = { ... }
				return arg[1] - 1
			end,
			units = "percent",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_coef",
			formula = function( ... )
				local arg = { ... }
				return arg[1] - 1
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.MagnetMinePrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Minefield.ttl,
		ItemTooltip.Rocket.detonation_radius,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	descriptionParams =
	{
		{
			name = "flight_speed",
			valField = "speed",
			units = "metre_per_second",
		},
		{
			name = "crystal_damage_mul",
			valField = "crystal_damage_coef",
			formula = function( ... )
				local arg = { ... }
				return arg[1] - 1
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.GuidedDronePrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "health",
			valField = "health",
			units = "units",
		},
		{
			name = "max_range",
			valField = "control_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SectorShieldPrec ] =
{
	descriptionParams =
	{
		{
			name = "ttl",
			valField = "ttl",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PaperMatch ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.PaperButton] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.kinetic,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Minefield.ttl,
		ItemTooltip.Minefield.range,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ItemSubtype.PaperButtonField] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.kinetic,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Minefield.ttl,
		ItemTooltip.Minefield.range,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "field_radius",
			valField = "field_radius",
			units = "metre",
		},
		{
			name = "time_to_live",
			valField = "time_to_live",
			units = "second",
		},
		{
			name = "max_mines",
			valField = "max_mines",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_CageTrapMine ] =
{
	tooltipParams =
	{
		ItemTooltip.Minefield.entity_health,
		ItemTooltip.Minefield.entity_activation_time,
		ItemTooltip.Minefield.entity_ttl,
		ItemTooltip.Minefield.entity_range,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			spellPrototype = "spell_on_ttl",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceMissile_ChainRockets ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	descriptionParams =
	{
		{
			name = "strikes_count",
			valField = "child_rockets.rocket",
			formula = function( ... )
				local arg = { ... }
				local sum = 1
				local defName = arg[1]
				while defName do
					defName = Def[ defName ].child_rockets and Def[ defName ].child_rockets.rocket
					sum = sum + 1
				end
				return sum
			end,
			units = "units",
		},
		{
			name = "strike_damage_less",
			valField = { "explosion_blast_wave", "child_rockets.rocket", },
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[2] ]
				local blast1 = Def[ arg[1] ]
				local blast2 = Def[ def.explosion_blast_wave ]
				return 1 - blast2.damage_thermal / blast1.damage_thermal
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.SpaceMissile_AnomalyRocket] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "push_speed",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "metre_per_second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.ZmHumansRocket] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Minefield.ttl,
		ItemTooltip.Rocket.detonation_radius,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.ZmAliensRocket] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

------------------------------ [ PASSIVE ] ------------------------------

ItemTooltips[ ItemSubtype.ProtectiveFire ] =
{
	descriptionParams =
	{
		{
			name = "target_range",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "fire_rate_add",
			spellPrototype = "spell_on_death_someone",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_death_someone",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_death_someone",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.DronDamageMod ] =
{
	descriptionParams =
	{
		{
			name = "damage_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},	
		{
			name = "hull_heal",
			spellPrototype = "spell_on_equip",
			valField = "additional_auras[1].aura_param",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.DisintegaratorBoost ] =
{
	descriptionParams =
	{
		{
			name = "disintegrator_fire_rate_mul",
			valField = "disintegrator_fire_rate_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.WeaknessSense ] =
{
	descriptionParams =
	{
		-- module
		{
			name = "range_max",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		-- DAMAGE_MOD
		{
			name = "damage_mod",
			spellPrototype = "spell_on_death_someone",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_death_someone",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		-- SNIPER_OVERLOAD
		{
			name = "damage_add",
			spellPrototype = "spell_on_death_someone",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		{
			name = "duration2",
			spellPrototype = "spell_on_death_someone",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.TacticalCalculation ] =
{
	descriptionParams =
	{
		{
			name = "cooldown_mul",
			spellPrototype = "spell_on_max_speed_minus",
			valField = "aura_param",
			units = "percent",
			negative = true,
		},
		{
			name = "shield_dec",
			valField = "shield_max_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.EnemyInfoCheck ] =
{
	descriptionParams =
	{
		{
			name = "resist_dec",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.EnemyActiveSuppression ] =
{
	descriptionParams =
	{
		{
			name = "activemod_dec",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			negative = true,
			units = "percent",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.FocusedScaner ] =
{
	descriptionParams =
	{
		{
			name = "damage_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.HardCrit ] =
{
	descriptionParams =
	{
		{
			name = "crit_damage_add",
			valField = "crit_damage_add",
			units = "percent",
		},
		{
			name = "damage_add",
			spellPrototype = "focus_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "damage_add_max",
			spellPrototype = "focus_spell",
			valField = { "aura_param", "aura_param_stages", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2][ #arg[2] ]
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.HeatGunControl ] =
{
	descriptionParams =
	{
		{
			name = "heat_add_mul",
			valField = "heat_add_mul",
			negative = true,
			units = "percent",
		},
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.KatanaPrepare ] =
{
	descriptionParams =
	{
		-- spell_on_special_activate
		{
			name = "shield_heal",
			spellPrototype = "spell_on_special_activate",
			valField = { "aura_param", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "cooldown_mul",
			spellPrototype = "spell_on_special_activate",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_special_activate",
			valField = "additional_auras[1].duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PrometeusCunning ] =
{
	descriptionParams =
	{
		{
			name = "module_deploy_cooldown_mul",
			valField = "module_command_cooldown_mul",
			absValue = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.DeimosRageOnEnemy ] =
{
	descriptionParams =
	{
		{
			name = "crit_chance",
			valField = "crit_chance_add",
			units = "percent",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
		{
			name = "crit_chance_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_equip",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SystemsRecharger ] =
{
	descriptionParams =
	{
		{
			name = "module_deploy_cooldown_mul",
			valField = "module_deploy_cooldown_mul",
			negative = true,
			units = "percent",
		},
		{
			name = "module_deploy_energy_cost_mul",
			valField = "module_deploy_energy_cost_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.TurboBattleScanner ] =
{
	descriptionParams =
	{
		{
			name = "lock_time_mul",
			valField = "lock_time_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "dispersion_mul",
			valField = "dispersion_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.WideTurboScanner ] =
{
	descriptionParams =
	{
		{
			name = "lock_time_mul",
			valField = "lock_time_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.KnowledgeEnemyCPU ] =
{
	descriptionParams =
	{
		{
			name = "damage_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "active_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.ExtendedBallisticsCPU ] =
{
	descriptionParams =
	{
		{
			name = "fire_rate_mul",
			spellPrototype = "spell_on_kill",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "spec_speed_mul",
			spellPrototype = "spell_on_kill",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_kill",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_kill",
			valField = "max_stacks",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.EnemyResistReductor ] =
{
	
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "resist_all_dec",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.ProtonWall] = -- Протонная стена
{
	descriptionParams =
	{
		{
			name = "crowd_control_coef_dec",
			valField = "crowd_control_coef_mul",
			negative = true,
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ScoutScanner] =
{
	descriptionParams =
	{
		{
			name = "vision_radius_mul",
			valField = "vision_radius_mul",
			units = "percent",
		},
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.TurboScanner] =    -- Разогнанный процессор
{
	descriptionParams =
	{
		{
			name = "lock_time_dec",
			valField = "lock_time_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.CoProcessor] =
{
	descriptionParams =
	{
		{
			name = "crit_damage_add",
			valField = "crit_damage_add",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.WideScanner] =
{
	descriptionParams =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.BattleScanner ] =    -- Электронная донаводка
{
	descriptionParams =
	{
		{
			name = "dispersion_mul",
			valField = "dispersion_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.RangeMasterUnit ] =    -- Система «Горизонт»
{
	descriptionParams =
	{
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
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.AdditionalShield] =
{
	tooltipParams = 
	{
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "shield_second",
			spellPrototype = "shield_disabled_spell",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.SafeSpecial] =
{
	descriptionParams =
	{
		{
			name = "shield_resist_add",
			spellPrototype = "spell_on_special_activate",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_special_activate",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.EnergyFlowBalancer] =
{
	descriptionParams =
	{
		{
			name = "energy_regen",
			spellPrototype = "spell_on_equip",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "energy_regen_max",
			spellPrototype = "spell_on_equip",
			valField = { "aura_param", "period", "mod_max", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2] * arg[3]
			end,
			units = "units_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.LastHope] =
{
	descriptionParams =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
			negative = true,
		},
		{
			name = "jump_range",
			spellPrototype = "shield_disabled_spell",
			valField = "influence_param",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.ExhaustZone] =
{
	tooltipParams =
	{
		ItemTooltip.Effects.energy_regen_mul,
		ItemTooltip.cooldown,
	},
		
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell_on_special_activate",
			valField = "duration",
			units = "second",
		},
		{
			name = "cloud_size",
			spellPrototype = "spell_on_special_activate",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage_thermal",
			spellPrototype = "spell_on_special_activate",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.CritChecker] =
{
	descriptionParams =
	{
		{
			name = "crit_chance_add",
			spellPrototype = "spell_on_equip",
			valField = { "aura_param", "mod_max", },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1]
				end,
				function( ... )
					local arg = { ... }
					return arg[1] * arg[2]
				end,
			},
			concat = "%s - %s",
			units = "percent",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.ReactorSpark] =
{
	descriptionParams =
	{
		{
			name = "damage_thermal",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "period",
			spellPrototype = "spell_on_equip",
			valField = "period",
			units = "second",
		},		
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.BushidoCall] =
{
	descriptionParams =
	{
		-- module
		{
			name = "cooldown",
			valField = "cooldown",
			negative = true,
			units = "second",
		},
		-- ai.Spell.HEAL_SHIELD
		{
			name = "shield_heal",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			units = "units",
		},
		-- ai.Aura.HEAL_HULL_PERIODIC
		{
			name = "hull_heal",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				aura_param = Spell[ arg[1] ].aura_param
				duration = Spell[ arg[1] ].duration
				period = Spell[ arg[1] ].period
				return aura_param * ( duration / period + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.ShieldRenew] =
{
	descriptionParams =
	{
		-- module
		{
			name = "cooldown",
			valField = "cooldown",
			negative = true,
			units = "second",
		},
		-- shield_disabled_spell
		{
			name = "shield_heal",
			spellPrototype = "shield_disabled_spell",
			valField = { "aura_param", "period" },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
	}
}

ItemTooltips[ItemSubtype.EnergyOptimus] =
{
	descriptionParams =
	{
		-- module
		{
			name = "energy_max_mul",
			valField = "energy_max_mul",
			units = "percent",
		},
		--spell_on_equip
		{
			name = "energy_regen",
			spellPrototype = "spell_on_equip",
			valField = { "aura_param", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_equip",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.FireStealingPot] =
{
	descriptionParams =
	{
		-- spell_on_equip
		{
			name = "energy_transfer",
			spellPrototype = "spell_on_equip",
			valField = { "aura_param", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.UrgentCapacitorCharge] =
{
	descriptionParams =
	{
		{
			name = "low_energy",
			valField = "max_energy_percent",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_max_energy_minus",
			valField = "duration",
			units = "second",
		},
		{
			name = "energy_regen",
			spellPrototype = "spell_on_max_energy_minus",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.CapacitorCooldown] =
{
	descriptionParams =
	{
		{
			name = "cooldown_mul",
			valField = "cooldown_mul",
			absValue = true,
			units = "percent",
			negative = false,
		},
	},
}

ItemTooltips[ItemSubtype.ExtCapacitorBattary] =
{
	descriptionParams =
	{
		{
			name = "energy_max_mul",
			valField = "energy_max_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.CapacitorRecharging] =
{
	descriptionParams =
	{
		{
			name = "energy_regen_mul",
			valField = "energy_regen_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ImplsDischarger] =    -- Импульсный разрядник
{
	descriptionParams =
	{
		{
			name = "energy_regen_mul",
			valField = "energy_regen_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.CmplxBatt] =
{
	descriptionParams =
	{
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
	},
}

ItemTooltips[ItemSubtype.CpctrPwrRelay] =    -- Силовое реле энергоблока
{
	descriptionParams =
	{
		{
			name = "energy_regen_mul",
			valField = "energy_regen_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.CptrEnrgBridge] =    -- Мост силовой установки
{
	descriptionParams =
	{
		{
			name = "energy_max_mul",
			valField = "energy_max_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.WeaponCoolant ] =
{
	descriptionParams =
	{
		{
			name = "fire_rate_mul",
			valField = "fire_rate_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.EmergencyBarrier ] =
{
	descriptionParams =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
			negative = true,
		},
		{
			name = "duration",
			spellPrototype = "emergency_barrier_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.AccelerationCoil ] =
{
	descriptionParams =
	{
		{
			name = "projectile_speed_mul",
			valField = "projectile_speed_mul",
			units = "percent",
		},
	}
}

ItemTooltips[ ItemSubtype.HackAimingProtocol ] =
{
	
	tooltipParams = 
	{ 
		ItemTooltip.Passive.hack_protocol.range,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- emergency_barrier_spell
		{
			name = "duration",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "crowd_control_coef_mul",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.MultiPurposeAdaptor ] =
{
	descriptionParams =
	{
		{
			name = "crit_chance_add",
			spellPrototype = "spell_on_max_energy_plus",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "resist_add",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.UpgradedSpecial ] =
{
	descriptionParams =
	{
		{
			name = "damage_addititional",
			spellPrototype = "spell_on_equip",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.RocketFit ] =
{
	descriptionParams =
	{
		{
			name = "rocket_damage_coef_mul",
			valField = "rocket_damage_coef_mul",
			units = "percent",
		},
		{
			name = "rocket_cooldown_coef_mul",
			valField = "rocket_cooldown_coef_mul",
			negative = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.ShellRestoration ] =
{
	descriptionParams =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			negative = true,
			units = "second",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell_on_special_activate",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.DeimosEmitter ] =
{
	descriptionParams =
	{
		-- module
		{
			name = "hull_resist_emp_add",
			valField = "hull_resist_emp_add",
			units = "units",
		},
		-- spell_on_equip
		{
			name = "damage",
			spellPrototype = "spell_on_equip",
			valField = { "aura_param", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_extra_radius",
			units = "metre",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.PhobosHullRestore ] =
{
	descriptionParams =
	{
		{
			name = "hull_regen_add",
			valField = "hull_regen_add",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ItemSubtype.ResistHullThermal] =
{
	descriptionParams =
	{
		{
			name = "hull_resist_thermal_add",
			valField = "hull_resist_thermal_add",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.ResistHullEMP] =
{
	descriptionParams =
	{
		{
			name = "hull_resist_emp_add",
			valField = "hull_resist_emp_add",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.ResistHullKinetic] =
{
	descriptionParams =
	{
		{
			name = "hull_resist_kinetic_add",
			valField = "hull_resist_kinetic_add",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.FastMissileRacks ] = -- Улучшенные пилоны
{
	descriptionParams =
	{
		{
			name = "rocket_cooldown_coef_mul",
			valField = "rocket_cooldown_coef_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.ArmorPlates ] =
{
	descriptionParams =
	{
		{
			name = "hull_health_mul",
			valField = "hull_health_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.HeavyArmor] = -- Тяжелая обшивка
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
			--negative = true,
		},
		{
			name = "hull_health_mul",
			valField = "hull_health_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ExtendedHull] =
{
	descriptionParams =
	{
		{
			name = "cargo_hold_add",
			valField = "cargo_hold_add",
			units = "units",
		},
		{
			name = "hull_health_mul",
			valField = "hull_health_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.AutoRepairUnit] =
{
	descriptionParams =
	{
		{
			name = "hull_regen_add",
			valField = "hull_regen_add",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.LightArmor] =    -- Облегченный корпус
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
		{
			name = "hull_health_mul",
			valField = "hull_health_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.CompositeArmor] =    -- Гальванизированная броня
{
	descriptionParams =
	{
		{
			name = "hull_dmg_resist",
			valField = "hull_resist_kinetic_add",
			units = "units",
		},
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
			--negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.PassiveArmor] = -- Пассивная броня
{
	descriptionParams =
	{
		{
			name = "energy_regen_mul",
			valField = "energy_regen_mul",
			units = "percent",
		},
		{
			name = "hull_resist_kinetic_add",
			valField = "hull_resist_kinetic_add",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.PiligrimShield2Speed] =
{
	descriptionParams =
    {
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "acceleration_mul",
			valField = "acceleration_mul",
			units = "percent",
		},
		{
			name = "max_shield_percent",
			valField = "max_shield_percent",
			units = "percent",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell_on_max_shield_minus",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ShieldAdaptation] =
{
	descriptionParams =
    {
		{
			name = "shield_resist_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "shield_resist_add_max",
			spellPrototype = "spell_on_equip",
			valField = { "aura_param", "mod_max", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.BinaryHardener] =
{
	descriptionParams =
    {
		{
			name = "shield_resist_kinetic_add",
			valField = "shield_resist_kinetic_add",
			units = "units",
		},
		{
			name = "shield_resist_thermal_add",
			valField = "shield_resist_thermal_add",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.BindingShield] =
{
	descriptionParams =
    {
		{
			name = "shield_heal",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units_per_second",
		},
		-- {
			-- name = "shield_heal_max",
			-- spellPrototype = "spell_on_equip",
			-- valField = "target_spell",
			-- formula = function( ... )
				-- local arg = { ... }
				-- local aura_param = UI:GetValByName("Spell."..arg[1]..".aura_param")
				-- local mod_max = UI:GetValByName("Spell."..arg[1]..".mod_max")
				-- return aura_param * mod_max
			-- end,
			-- units = "units_per_second",
		-- },
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.SuperChamelion] =
{
	descriptionParams =
    {
		-- spell_on_max_speed_minus
		{
			name = "resist_all_dec",
			spellPrototype = "spell_on_max_speed_minus",
			valField = "aura_param",
			units = "units",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.ReflectorResonance] =
{
	descriptionParams =
    {
		{
			name = "cooldown",
			valField = "cooldown",
			negative = true,
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.NewShield] =
{
	descriptionParams =
    {
		{
			name = "cooldown",
			valField = "cooldown",
			negative = true,
			units = "second",
		},
		{
			name = "target_range",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.IndestructibleShield] =
{
	descriptionParams =
    {
		{
			name = "cooldown",
			valField = "cooldown",
			negative = true,
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.TarZone] =
{
	descriptionParams =
    {
		-- spell_on_equip
		{
            name = "strafe_speed_dec",
			spellPrototype = "spell_on_equip",
            valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			negative = true,
            units = "percent",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.ShieldThermoGuard] =
{
	descriptionParams =
    {
		-- module
        {
            name = "shield_resist_thermal_add",
            valField = "shield_resist_thermal_add",
            units = "units",
        },
		-- spell_on_equip
		{
            name = "shield_resist_thermal_allies_add",
			spellPrototype = "spell_on_equip",
            valField = "aura_param",
            units = "units",
        },
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
			
		},
	},
}

ItemTooltips[ItemSubtype.Lynx2Shield] =
{
    descriptionParams =
    {
        -- module
        {
            name = "max_speed_percent",
            valField = "max_speed_percent",
            units = "percent",
        },
        -- spell_on_max_speed_plus
        {
            name = "shield_heal",
            spellPrototype = "spell_on_max_speed_plus",
            valField = "aura_param",
            units = "units_per_second",
           
        },
    },
}

ItemTooltips[ItemSubtype.BattleShield] =
{
	descriptionParams =
	{
		-- module
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			units = "percent",
		},
		-- spell_on_equip
		{
			name = "res_per_enemy",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units_per_piece",
			
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
			
		},
		{
			name = "duration",
			spellPrototype = "spell_on_equip",
			valField = "duration",
			units = "second",
			
		},
		{
			name = "shield_resist",
			valField = "shield_resist_kinetic_add",
			units = "units",
			
		},
	},
}

ItemTooltips[ItemSubtype.JerichoShld] =
{
	descriptionParams =
	{
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.DurableShield] =
{
	descriptionParams =
	{
		{
			name = "shield_resist_add",
			valField = "shield_resist_add",
			units = "units",
		},
		{
			name = "max_range_mul",
			valField = "max_range_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.TemperedShield] =
{
	descriptionParams =
	{
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			units = "percent",
		},
		{
			name = "shield_dmg_resist",
			valField = "shield_resist_kinetic_add",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.ShieldHealOnEnemyDeath] =
{
	descriptionParams =
	{
		{
			name = "death_detector_range",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "shield_heal",
			spellPrototype = "spell_on_death_someone",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_death_someone",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.ThermalUnlock] =
{
	descriptionParams =
	{
		{
			name = "shield_resist_thermal_add",
			valField = "shield_resist_thermal_add",
			units = "units",
		},
		{
			name = "range",
			spellPrototype = "shield_disabled_spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "recharge",
			valField = "cooldown",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.PulsarShield] =
{
	descriptionParams =
	{
		{
			name = "kin_rst",
			valField = "shield_resist_kinetic_add",
			units = "units",
		},
		{
			name = "emp_rst",
			valField = "shield_resist_emp_add",
			units = "units",
		},
		{
			name = "trm_rst",
			valField = "shield_resist_thermal_add",
			units = "units",
		},
		{
			name = "dmg",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "units",
		},
		{
			name = "rng",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.Recuperator] =
{
	descriptionParams =
	{
		{
			name = "recuperation_power",
			valField = "recuperation_power",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ResistShldThermal] =
{
	descriptionParams =
	{
		{
			name = "shield_resist_thermal_add",
			valField = "shield_resist_thermal_add",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.ResistShieldEMP] =
{
	descriptionParams =
	{
		{
			name = "shield_resist_emp_add",
			valField = "shield_resist_emp_add",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ResistShieldKin ] =
{
	descriptionParams =
	{
		{
			name = "shield_resist_kinetic_add",
			valField = "shield_resist_kinetic_add",
			units = "units",
		},
	},
}

ItemTooltips [ItemSubtype.ShieldExtender ] =
{
	descriptionParams =
	{
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.AddShldGen] =
{
	descriptionParams =
	{
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ExtShld] =    -- Разветвитель проекции щита
{
	descriptionParams =
	{
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			units = "percent",
		},
		{
			name="acceleration_mul",
			valField = "acceleration_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.AdaptiveForceField] = -- Адаптивный щит
{
	descriptionParams =
	{
		{
			name = "speed_to_resist",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "minspeed",
			valField = "max_speed_percent",
			units = "percent",
		}
	},
}

ItemTooltips[ItemSubtype.CuttedShieldHolder] =    -- Компактный генератор щита
{
	descriptionParams =
	{
		{
			name = "energy_max_mul",
			valField = "energy_max_mul",
			units = "percent",
		},
		{
			name = "shield_max_mul",
			valField = "shield_max_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.SubMatterShield] =    -- Щит из субматерии
{
	descriptionParams =
	{
		{
			name = "shield_resist_kinetic_add",
			valField = "shield_resist_kinetic_add",
			units = "units",
			negative = true,
		},
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenFastProjectile ] =
{
	descriptionParams = 
	{
		{
			name = "trigger_speed_percent",
			valField = "max_speed_percent",
			units = "percent",
		},
		{
			name = "projectile_speed_mul",
			spellPrototype = "spell_on_max_speed_minus",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "heat_slow",
			valField = "heat_add_mul",
			formula = function( ... )
				local arg = { ... }
				return math.abs( arg[1] )
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.RebalancedDefense] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "shield_resist_add",
			spellPrototype = "spell_on_max_speed_minus",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.SpeedInsteadShield] =
{
	descriptionParams =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
			negative = true,
		},
		-- shield_disabled_spell
		{
			name = "speed_bust",
			spellPrototype = "shield_disabled_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.RotSpeedOnMdlActivation] =
{
	descriptionParams =
	{
		-- def
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
		-- spell_on_module_activate  = "RotSpeedOnMdlActivation",
		-- spell_on_special_activate = "RotSpeedOnMdlActivation", 
		{
			name = "rot_speed_mul_addititional",
			spellPrototype = "spell_on_module_activate",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_module_activate",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.SaveBack] =
{
	descriptionParams =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
			negative = true,
		},
		{
			name = "teleport_range",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].teleport_range
			end,
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},	
	},
}

ItemTooltips[ItemSubtype.DodgeDrive] =
{
	descriptionParams =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.ActiveHunting] =
{
	descriptionParams =
	{
		-- module
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		-- spell_on_equip
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
		{
			name = "strafe_speed_mul",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "strafe_speed_mul_max",
			spellPrototype = "spell_on_equip",
			valField = {"aura_param","mod_max",},
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.WolfRun] =
{
	descriptionParams =
	{
		-- module
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
		{
			name = "max_shield_percent",
			valField = "max_shield_percent",
			units = "percent",
		},
		-- spell_on_max_shield_plus
		{
			name = "speed_bust",
			spellPrototype = "spell_on_max_shield_plus",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ImprovedInjector] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "fire_rate_mul",
			valField = "fire_rate_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ChillDistributor] =
{
	descriptionParams =
	{
		{
			name = "strafe_speed_mul",
			valField = "strafe_speed_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "fire_rate_mul",
			valField = "fire_rate_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ExtendedCooler] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "heat_add_mul",
			valField = "heat_add_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.InjectorOverloader] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "acceleration_mul",
			valField = "acceleration_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.CoolantSystemIdle] =
{
	descriptionParams =
	{
		{
			name = "heat_slow",
			valField = "heat_add_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "speed_up",
			valField = "boost_maxspeed_coef_mul ",
			units = "percent",
			negative = true,
		},
		{
			name = "maneuver_up",
			--spellPrototype = "spell_on_equip",
			valField = "rot_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.MovementDamageBuff] =
{
	descriptionParams =
	{
		{
			name = "damage_add",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "damage_add_max",
			spellPrototype = "spell_on_max_speed_plus",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "percent",
		},
		{
			name = "minspeed",
			valField = "max_speed_percent",
			units = "percent",
		},
		{
			name = "stack_time",
			valField = "cooldown",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.ExternalCooler] =    -- Интегрированный охладитель
{
	descriptionParams =
	{
		{
			name = "heat_slow",
			valField = "heat_add_mul",
			negative = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CollisionComp ] = -- Компенсатор столкновений
{
	descriptionParams =
	{
		{
			name = "contact_damage_cf_dec",
			valField = "contact_damage_cf_mul",
			negative = true,
			units = "percent",
		},
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
		{
			name = "strafe_speed_mul",
			valField = "strafe_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.InertialStabilizer] =
{
	tooltipParams = 
	{
		ItemTooltip.Effects.strafe_accel,
		ItemTooltip.Effects.strafe_speed,
	},
}

ItemTooltips[ItemSubtype.RotationThruster] =
{
	descriptionParams =
	{
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.KatalizatorInjector] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.GreenSpeed] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.BoostersOverloader] =
{
	tooltipParams = 
	{
		ItemTooltip.Effects.acceleration_mul,
		ItemTooltip.Effects.strafe_accel,
		ItemTooltip.Effects.boost_energy_cost_per_second_mul,
	},
			descriptionParams =
	{	
	{
		
			name = "speed",
			valField = "max_speed_mul",
			units = "percent",
			negative = true,
	},
	},
}

ItemTooltips[ItemSubtype.EngineGenerator] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "boost_energy_cost_per_second_mul",
			valField = "boost_energy_cost_per_second_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.DoomBoost] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
		{
			name = "acceleration_mul",
			valField = "acceleration_mul",
			units = "percent",
		},
		{
			name = "boost_mul",
			valField = "boost_maxspeed_coef_mul",
			units = "percent",
		},
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "boost_energy_cost",
			valField = "boost_energy_cost_per_second_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "boost_rot_coef",
			valField = "boost_rot_coef_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "boost_strafe_speed",
			valField = "boost_strafe_speed_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.EnginePowerRedistributor ] =
{
	descriptionParams =
	{
		{
			name = "cooldown_mul",
			valField = "cooldown_mul",
			negative = true,
			units = "percent",
		},
		-- spell_on_special_activate
		{
			name = "speed_dec",
			spellPrototype = "spell_on_module_activate",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			negative = true,
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_module_activate",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.KatanaEnergy ] =
{
	descriptionParams =
	{
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
		{
			name = "max_speed_percent",
			valField = "max_speed_percent",
			units = "percent",
		},
		{
			name = "energy_regen",
			spellPrototype = "spell_on_max_speed_plus",
			valField = { "aura_param", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.EmergencyJump ] =
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "jump_range",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			absValue = true,
			units = "metre",
		},
		{
			name = "nojump",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			negative = true,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SpecialToArmorRestore ] = -- #0069929
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "heal",
			spellPrototype = "spell_on_special_activate",
			valField = { "aura_param", "period", "duration" },
			formula = function( ... )
				local arg = { ... }
				return (( arg[3] / arg[2] + 1 ) * arg[1] ) --/ 2
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_special_activate",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenAcceleration ] =
{
	descriptionParams =
	{
		{
			name = "acceleration_mul",
			valField = "acceleration_mul",
			units = "percent",
		},
		{
			name = "boost_accel_coef_mul",
			valField = { "acceleration_mul", "boost_accel_coef_mul", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] + arg[2]
			end,
			units = "percent",
		},
		{
			name = "strafe_speed_inc",
			valField = "strafe_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenBoostOptimizer ] =
{
	descriptionParams =
	{
		{
			name = "boost_energy_cost_per_second_dec",
			valField = "boost_energy_cost_per_second_mul",
			negative = true,
			units = "percent",
		},
		{
			name = "strafe_speed_inc",
			valField = "strafe_speed_mul",
			units = "percent",
		},
		{
			name = "strafe_accel_inc",
			valField = "strafe_accel_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenDoomBoost ] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
		{
			name = "acceleration_mul",
			valField = "acceleration_mul",
			units = "percent",
		},
		{
			name = "boost_mul",
			valField = "boost_maxspeed_coef_mul",
			units = "percent",
		},
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "boost_energy_cost",
			valField = "boost_energy_cost_per_second_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "boost_rot_coef",
			valField = "boost_rot_coef_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "boost_strafe_speed",
			valField = "boost_strafe_speed_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.GreenRotationThruster ] =
{
	descriptionParams =
	{
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
		{
			name = "boost_rot_coef_mul",
			valField = { "rot_speed_mul", "boost_rot_coef_mul", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] + arg[2]
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenJumpOnStrafe ] =
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "jump_range",
			spellPrototype = "double_up_spell",
			valField = "influence_param",
			units = "metre",
		},
	},
}


ItemTooltips[ ItemSubtype.GreenIdleSpeed ] =
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "speed_bust",
			spellPrototype = "spell_on_no_firing",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PassiveOvercharge ] =
{
	tooltipParams =
	{
		ItemTooltip.Effects.hull_health_mul,
	},
	descriptionParams =
	{
		{
			name = "max_health_percent",
			valField = "max_health_percent",
			units = "percent",
		},
		{
			name = "general_bonus",
			spellPrototype = "spell_on_max_health_minus",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RamHull ] =
{
	descriptionParams =
	{
		{
			name = "dmg2stun",
			spellPrototype = "spell_on_owner_collision",
			valField = "duration",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 10000
			end,
			negative = true,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.AdaptiveMembrane ] =
{
	descriptionParams =
	{
		{
			name = "hull_dmg_resist",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.InerceptorsOnShipResists ] =
{
	descriptionParams =
	{
		{
			name = "hull_dmg_resist",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.MatterAbsorber ] =
{
	descriptionParams =
	{
		{
			name = "death_detector_range",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell_on_death_someone",
			valField = { "aura_param", "duration", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_death_someone",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenArmorFocusResist ] =
{
	descriptionParams =
	{
		{
			name = "resist_bonus",
			valField = "hull_resist_kinetic_add",
			units = "units",
		},
		{
			name = "hull_resist_bonus",
			spellPrototype = "focus_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "hull_resist_max",
			spellPrototype = "focus_spell",
			valField = { "aura_param_stages", "aura_param", },
				formula = function( ... )
					local arg = { ... }
					return arg[1][ #arg[1] ] * arg[2]
				end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenRegenShield ] =
{
	descriptionParams =
	{
		-- module
		{
			name = "max_shield_percent",
			valField = "max_shield_percent",
			units = "percent",
		},
		-- spell_on_max_shield_plus
		{
			name = "hull_heal",
			spellPrototype = "spell_on_max_shield_plus",
			valField = "aura_param",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.ExtremeShieldCharge ] =
{
	descriptionParams =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
		{
			name = "shield_charge_s",
			spellPrototype = "spell_on_no_firing",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.FocusShieldCharge ] =
{
	descriptionParams =
	{
		{
			name = "min_shield_heal",
			spellPrototype = "focus_spell",
			valField = { "aura_param", "aura_param_stages" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2][1]
			end,
			units = "units_per_second",
		},
		{
			name = "max_shield_heal",
			spellPrototype = "focus_spell",
			valField = { "aura_param", "aura_param_stages" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2][ #arg[2] ]
			end,
			units = "units_per_second",
		},
		{
			name = "min_heal",
			spellPrototype = "focus_spell",
			valField = "aura_param",
			formula = function( ... )
				return RemoteHealSignatureCoef[ ai.Signature.SMALL ]
			end,
			units = "percent",
		},
		{
			name = "max_heal",
			spellPrototype = "focus_spell",
			valField = "aura_param",
			formula = function( ... )
				return RemoteHealSignatureCoef[ ai.Signature.HUGE ]
			end,
			units = "percent",
		},
	}
}

ItemTooltips[ ItemSubtype.AdaptiveDefense ] =
{
	descriptionParams =
	{
		-- spell_on_equip
		{
			name = "shield_resist_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		-- focus_spell
		{
			name = "resist_add",
			spellPrototype = "focus_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "resist_add_max",
			spellPrototype = "focus_spell",
			valField = { "aura_param", "aura_param_stages", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2][ #arg[2] ]
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldRecycler ] =
{
	descriptionParams =
	{
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			units = "percent",
		},
		{
			name = "target_range",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "shield_heal",
			spellPrototype = "spell_on_death_someone",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.FocusedDefence ] =
{
	descriptionParams =
	{
		{
			name = "range_min",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 0.25
			end,
			negative = true,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.WeaponSuppression ] =
{
	descriptionParams =
	{
		{
			name = "heat_mul",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyBurner ] =
{
	descriptionParams =
	{
		{
			name = "energy_dec",
			spellPrototype = "spell_on_equip",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "energy_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.PermanentAntiRadar ] = 
{
	descriptionParams =
	{
		{
			name = "strafe_speed_dec",
			valField = "strafe_speed_mul",
			units = "percent",
		},
		{
			name = "shield_dissipation",
			spellPrototype = "spell_on_no_firing",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			negative = true,
			units = "percent", 
			format = "%3.2f",
		},
		{
			name = "cooldown",
			valField = "cooldown",
			negative = true,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EmergencyShell ] =
{
	descriptionParams =
	{
		{
			name = "shield_charge",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "speed_dec",
			spellPrototype = "emergency_barrier_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent_minus",
		},
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.AfterShock ] =
{
	descriptionParams =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "shield_disabled_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype = "shield_disabled_spell",
			valField = { "aura_param", "duration", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.CooldownDownOnEnemyDeath ] =
{
	descriptionParams = 
	{
		{
			name = "target_range",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "cooldown_dec",
			spellPrototype = "spell_on_death_someone",
			valField = "influence_param",
			absValue = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.AdaptiveFire ] =
{
	descriptionParams =
	{
		{
			name = "damage_add",
			spellPrototype = "focus_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "damage_add_max",
			spellPrototype = "focus_spell",
			valField = { "aura_param", "aura_param_stages", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2][ #arg[2] ]
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PreparationAdaptation ] =
{
	tooltipParams = 
	{
		ItemTooltip.Effects.trigger_speed_percent,
	},
	
	descriptionParams =
	{
		-- spell_on_max_speed_minus
		{
			name = "module_range_max_add",
			spellPrototype = "spell_on_max_speed_minus",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.DroneBuffer ] =
{
	descriptionParams =
	{
		{
			name = "drone_damage",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.RangeMasterPlus ] =
{
	descriptionParams =
	{
		{
			name = "max_range_mul",
			valField = "max_range_mul",
			units = "percent",
		},
		{
			name = "projectile_speed_mul",
			valField = "projectile_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CrystallRedirect ] =
{
	descriptionParams =
	{
		{
			name = "hull_heal",
			spellPrototype = "spell_on_death_someone",
			valField = "spells[1]",
			formula = function(...)
				local arg = {...}
				local aura_param =	Spell[ arg[1] ].aura_param
				local duration =	Spell[ arg[1] ].duration
				local period =		Spell[ arg[1] ].period
				return aura_param / period * ( duration + 1 )
			end,
			units = "units",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_death_someone",
			valField = "spells[1]",
			formula = function(...)
				local arg = {...}
				return Spell[ arg[1] ].target_range
			end,
			units = "metre",
		},
		{
			name = "activation_range",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "energy_regen",
			spellPrototype = "spell_on_death_someone",
			valField = "spells[2]",
			--valField = "influence_param",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ScrapProductBoost ] =
{
	descriptionParams =
	{
		{
			name = "ammo_regen_time_mul",
			valField = "ammo_regen_time_mul",
			formula = function( ... )
				local arg = { ... }
				return 1 - 1 / ( 1 - arg[1] )
			end,
			units = "percent",
		},
		{
			name = "crowd_control_coef_mul",
			valField = "crowd_control_coef_mul",
			negative = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.SpecialToDamage ] =
{
	descriptionParams =
	{
		{
			name = "damage_add",
			spellPrototype = "spell_on_special_activate",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_special_activate",
			valField = "duration",
			units = "second",
		},
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenComputerOverload ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			spellPrototype = "spell_on_max_speed_plus", --"spell_on_speed_max_plus", 
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.EnemyAnalyzer ] =
{
	descriptionParams =
	{
		{
			name = "death_detector_range",
			--spellPrototype = "spell_on_death_someone",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "damage_add",
			spellPrototype = "spell_on_death_someone",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_death_someone",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.DeathSwarm] =
{
	descriptionParams =
	{
		{
			name = "energy_regen_mul",
			valField = "energy_regen_mul",
			units = "percent",
		},
		{
			name = "emergency_swarm_duration",
			valField = "emergency_swarm_duration",
			units = "second",
		},
		{
			name = "emergency_swarm_damage_mul",
			valField = "emergency_swarm_damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.SwarmRocket] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "swarm_shot_health_cost_percent",
			valField = "swarm_shot_health_cost_percent",
			units = "percent",
		},
		{
			name = "swarm_projectile_damage_kinetic",
			valField = "swarm_projectile_damage_kinetic",
			units = "damage",
		},
		{
			name = "swarm_projectile_max_range",
			valField = "swarm_projectile_max_range",
			units = "metre",
		},
		{
			name = "swarm_projectile_fire_rate",
			valField = "swarm_projectile_fire_rate",
			units = "shot_per_minute",
		},
		{
			name = "swarm_projectile_speed",
			valField = "swarm_projectile_speed",
			units = "metre_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.RangeMasterSt ] =    -- Система «Горизонт» для СТ
{
	descriptionParams =
	{
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
	},
}

ItemTooltips[ ItemSubtype.MaxSpeedSt ] =    -- 
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "strafe_speed_mul",
			valField = "strafe_speed_mul",
			units = "percent",
		},
		{
			name = "acceleration_mul",
			valField = "acceleration_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RocketPowerSt ] =    -- 
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "rocket_damage_coef_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.AdvancedHeal ] =
{
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "aura_param",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.AdvancedZoom ] =
{
	descriptionParams =
	{
		{
			name = "zoom_min",
			valField = "disintegrator_zoom_min_coef",
			units = "percent",
		},
		{
			name = "zoom_max",
			valField = "disintegrator_zoom_max_coef",
			units = "percent",
		},
		{
			name = "vision_radius_mul",
			valField = "vision_radius_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.MoleScanner] =
{
	descriptionParams =
	{
		-- {
			-- name = "delay",
			-- spellPrototype = "spell_on_equip",
			-- valField = "period",
			-- units = "second",
		-- },
		{
			name = "range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "crit_damage_add",
			valField = "crit_damage_add",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.ThorStasis ] =
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
		ItemTooltip.Effects.hull_health_mul,
	},
	descriptionParams =
	{
		{
			name = "hull_dmg_resist",
			valField = "hull_resist_add",
			units = "units",
		},
		{
			name = "max_health_percent",
			valField = "max_health_percent",
			units = "percent",
		},
		{
			name = "damage_emp",
			spellPrototype = "spell_on_max_health_minus",
			valField = { "aura_param", "duration", "period" },
			formula = function(...)
				local arg = { ... }
				return arg[1] * ( 1 + arg[2] / arg[3] )
			end,
			units = "damage",
		},
		{
			name = "stasis_range",
			spellPrototype = "spell_on_max_health_minus",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_max_health_minus",
			valField = "additional_auras[1].duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.SpecialRestore] =
{
	tooltipParams =
	{
		ItemTooltip.Effects.energy_regen_mul,
	},
		
	descriptionParams =
	{
		{
			name = "healing_mod",
			spellPrototype = "spell_on_special_activate",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_special_activate",
			valField = "duration",
			units = "second",
		},
	},
}

------------------------------ [ SPECIAL ] ------------------------------

ItemTooltips[ ItemSubtype.UniqueHardShield ] =
{
	tooltipParams = 
	{
		ItemTooltip.Entity.entity_ttl,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams = 
	{
		{
			name = "shield_resist_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "shield_resist_summary",
			spellPrototype = { "spell", "spell_on_equip", },
			valField = { "aura_param", "aura_param", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] - arg[2]
			end,
			units = "units",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.Swarm ] =
{
	tooltipParams = 
	{
		ItemTooltip.Special.swarm.dps,
		ItemTooltip.Special.swarm.attack_time,
		ItemTooltip.Special.swarm.prepare_time,
		ItemTooltip.Special.swarm.flight_speed,
		ItemTooltip.Special.swarm.health,
		ItemTooltip.Special.swarm.health_regen,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.damage_to_host,
	},
	
	descriptionParams =
	{
		-- spell0
		{
			name = "resist_add_0",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "units",
		},
		-- spell1
		{
			name = "resist_add_1",
			spellPrototype = "spell1",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "swarm_guard_range",
			subPrototype = "swarm_pack",
			valField = "guard_range",
			units = "metre",
		},
		-- spell2
		{
			name = "swarm_shield_resist",
			subPrototype = "swarm_pack",
			valField = "shield_resist",
		},
		{
			name = "resist_add_2",
			spellPrototype = "spell2",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "fast_maneuver",
			spellPrototype = "spell2",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		-- spell3
		{
			name = "speed_bust",
			spellPrototype = "spell3",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "swarm_damage_thermal",
			subPrototype = "swarm_pack",
			valField = "turret_damage_thermal",
			units = "damage",
		},
		{
			name = "swarm_fire_rate",
			subPrototype = "swarm_pack",
			valField = "turret_fire_rate",
			units = "shot_per_minute",
		},
		{
			name = "swarm_projectile_speed",
			subPrototype = "swarm_pack",
			valField = "turret_projectile_speed",
			units = "metre_per_second",
		},
		{
			name = "swarm_max_range",
			subPrototype = "swarm_pack",
			valField = "turret_max_range",
			units = "metre",
		},
		{
			name = "resist_add_3",
			spellPrototype = "spell3",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Swarm2 ] =
{
	tooltipParams = 
	{
		ItemTooltip.Special.swarm.dps,
		ItemTooltip.Special.swarm.attack_time,
		ItemTooltip.Special.swarm.prepare_time,
		ItemTooltip.Special.swarm.flight_speed,
		ItemTooltip.Special.swarm.health,
		ItemTooltip.Special.swarm.health_regen,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.damage_to_host,
	},
	
	descriptionParams =
	{
		-- spell0
		{
			name = "resist_add_0",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "units",
		},
		-- spell1
		{
			name = "resist_add_1",
			spellPrototype = "spell1",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "swarm_heal",
			spellPrototype = "additional_spell1",
			valField = "aura_param",
			units = "damage_per_second",
		},
		-- spell2,3
		{
			name = "swarm_speed_mul",
			spellPrototype = "spell2",
			valField = "aura_param",
			units = "percent",
		},
		-- phase 2
		{
			name = "swarm_min_range",
			subPrototype = "swarm_pack",
			valField = "attack_target_range",
			units = "metre",
		},
		-- phase 3
		{
			name = "swarm_amount",
			valField = "pack_amount",
			units = "units",
		},
		{
			name = "swarm_hunt_min_range",
			subPrototype = "swarm_pack",
			valField = "defence_sphere_range",
			units = "metre",
		},
		{
			name = "swarm_hunt_dps_mul",
			subPrototype = "swarm_pack",
			valField = "defence_sphere_attack_damage_mul",
			negative = true,
			units = "percent",
		},
		{
			name = "swarm_hunt_period",
			subPrototype = "swarm_pack",
			valField = "defence_sphere_attack_period",
			negative = true,
			units = "second",
		},
		{
			name = "swarm_hunt_speed_mul",
			subPrototype = "swarm_pack",
			valField = "defence_sphere_speed_mul",
			units = "percent",
		},
		{
			name = "swarm_hunt_health_mul",
			valField = "pack_amount",
			negative = true,
			format = "1/%s",
			units = "units",
		},
		{
			name = "resist_all",
			spellPrototype = "spell3",
			valField = "additional_auras[2].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Swarm3 ] =
{
	tooltipParams = 
	{
		ItemTooltip.Special.swarm.dps,
		ItemTooltip.Special.swarm.flight_speed,
		ItemTooltip.Special.swarm.health,
		ItemTooltip.Special.swarm.health_regen,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.damage_to_host,
	},
	
	descriptionParams =
	{
		-- spell0
		{
			name = "resist_add_0",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "units",
		},
		-- spell1,2
		{
			name = "resist_add_1",
			spellPrototype = "spell1",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "speed_add_1",
			spellPrototype = "additional_spell1",
			valField = "aura_param",
			units = "percent",
		},
		-- spell3
		{
			name = "resist_add_3",
			spellPrototype = "spell3",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "speed_add_3",
			spellPrototype = "spell3",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		-- phase 2
		
		{
			name = "swarm_ball_damage_kinetic",
			subPrototype = "swarm_pack",
			spellPrototype = "spell_on_cloud",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local damage = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return damage * ( duration / period + 1 )
			end,
			units = "damage",
		},
		--[[
		{
			name = "swarm_ball_damage_kinetic",
			subPrototype = "swarm_pack",
			spellPrototype = "spell_on_cloud",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local blastwave = Spell[ arg[1] ].explosion_blast_wave
				return Def[ blastwave ].damage_kinetic
			end,
			units = "damage",
		},
		]]
		{
			name = "swarm_ball_max_range",
			subPrototype = "swarm_pack",
			valField = "ball_max_range",
			units = "metre",
		},
		{
			name = "swarm_ball_projectile_speed",
			subPrototype = "swarm_pack",
			valField = "ball_speed",
			units = "metre_per_second",
		},
		-- phase 3
		{
			name = "swarm_cloud_radius",
			subPrototype = "swarm_pack",
			spellPrototype = "spell_on_cloud",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "swarm_cloud_slow",
			subPrototype = "swarm_pack",
			spellPrototype = "spell_on_cloud",
			valField = "spells[2]",
			absValue = true,
			formula = function( ... )
				local arg = { ... }
				return -Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		{
			name = "swarm_cloud_vision",
			subPrototype = "swarm_pack",
			spellPrototype = "spell_on_cloud",
			valField = "spells[2]",
			absValue = true,
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].additional_auras[2].aura_param
			end,
			units = "percent",
		},
		{
			name = "swarm_cloud_camo",
			subPrototype = "swarm_pack",
			spellPrototype = "spell_on_cloud",
			valField = "spells[2]",
			absValue = true,
			formula = function( ... )
				local arg = { ... }
				return -Spell[ arg[1] ].additional_auras[3].aura_param
			end,
			units = "percent",
		},
		{
			name = "swarm_cloud_cooldown",
			valField = "cloud_cooldown",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.LandingTurret ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.effect.damage_mul,
		ItemTooltip.Special.landing.range_add,
		ItemTooltip.Special.landing.projectile_speed_mul,
		ItemTooltip.Special.landing.shield_regen,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams = 
	{
		{
			name = "max_speed_landing",
			valField = "max_speed",
			units = "metre_per_second",
		},
		{
			name = "max_range_landing",
			valField = "landing_max_range",
			units = "metre",
		},
		{
			name = "max_angle_landing",
			valField = "landing_max_angle",
			units = "degree",
		},
		{
			name = "shield_landing",
			subPrototype = "activate_entity",
			valField = "health",
			units = "units",
		},
		{
			name = "health_regen",
			spellPrototype = "spell",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].additional_auras[1].aura_param
				local duration = Spell[ arg[1] ].additional_auras[1].duration
				local period = Spell[ arg[1] ].additional_auras[1].period
				return aura_param * ( duration / period + 1 )
			end,
			units = "units_per_second",
		},
		{
			name = "immortal_time",
			spellPrototype = "spell",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.TurningTide ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.range,
		ItemTooltip.Special.turning_tide.speed,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams = 
	{
		{
			name = "damage_charge_max",
			valField = "damage_charge_max",
			units = "units",
		},
		-- spell_on_launch
		{
			name = "weapon_damage_emp",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "weapon_damage_emp_dec",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_param_add",
			units = "units",
		},
		{
			name = "ttl",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "aura_param_add", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] /  arg[2] 
			end,
			units = "second",
		},
		{
			name = "aura_range",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "aura_range_add",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range_add",
			units = "metre",
		},
		-- additional_spell
			-- Повышение резистов
		{
			name = "resist_add",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
			-- Увеличение скорости
		{
			name = "speed_mul",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "speed_mul_dec",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param_add",
			units = "percent",
		},
		{
			name = "duration2",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},
			-- Запрет стрельбы
		{
			name = "duration3",
			spellPrototype = "additional_spell",
			valField = "additional_auras[2].duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SpecialStunClone ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams = 
	{
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param",
			units = "units_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_clone_death",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration_on_target",
			spellPrototype = "spell_on_clone_death",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ClusterTorpedo ] =
{
	tooltipParams = 
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.projectile.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Rocket.projectile.warhead.damage_range,
		ItemTooltip.Rocket.projectile.warhead.flight_range,
		ItemTooltip.Rocket.projectile.warhead.flight_speed,
		ItemTooltip.Rocket.projectile.warhead.damage_thermal,
		ItemTooltip.Rocket.projectile.warhead.flight_rot_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "search_range",
			subPrototype = "projectile",
			valField = "child_rockets.direct_range",
			units = "metre",
		},
		{
			name = "max_warheads_per_target",
			subPrototype = "projectile",
			valField = "child_rockets.max_rockets_per_target",
			units = "none",
		},
		{
			name = "warheads_count",
			subPrototype = "projectile",
			valField = "child_rockets.scheme",
			formula = function( ... )
				local arg = { ... }
				local sum = 0
				for m,t in pairs( arg[1] ) do
					sum = sum + t.amount
				end
				return sum
			end,
			units = "pieces",
		},
		{
			name = "damage_huge",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},

	},
}

ItemTooltips[ ItemSubtype.RemoteDisintegrator ] =
{
	tooltipParams = 
	{
		ItemTooltip.Special.remote_disintegrator.damage_thermal,
		--ItemTooltip.Special.remote_disintegrator.fire_rate,
		ItemTooltip.Special.remote_disintegrator.projectile_speed,
		ItemTooltip.Special.remote_disintegrator.range,
		ItemTooltip.Special.remote_disintegrator.carrier_speed,
		ItemTooltip.Special.remote_disintegrator.carrier_range,
		ItemTooltip.Special.remote_disintegrator.drone_health,
		ItemTooltip.Special.remote_disintegrator.drone_ttl,
		ItemTooltip.Special.remote_disintegrator.drone_distance,
		ItemTooltip.Special.remote_disintegrator.drone_vision,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "dmg_frg",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				local primary_weapon = Def[ arg[1] ].primary_weapon
				local spell_on_hit = Def[ primary_weapon ].spell_on_hit
				local spells = Spell[ spell_on_hit ].spells
				local aura_param = Spell[ spells[1] ].aura_param
				
				local duration = Spell[ spells[1] ].duration
				local period = Spell[ spells[1] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "dmg_dstr",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				local primary_weapon = Def[ arg[1] ].primary_weapon
				local spell_on_hit = Def[ primary_weapon ].spell_on_hit
				local spells = Spell[ spell_on_hit ].spells
				local aura_param = Spell[ spells[2] ].aura_param
				
				local duration = Spell[ spells[2] ].duration
				local period = Spell[ spells[2] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "drone_orphan_time",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].orphan_time
			end,
			units = "second",
		},
		{
			name = "drone_owner_distance",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].owner_distance
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.CoverShield ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "shield_second",
			spellPrototype = "spell",
			valField = "influence_param",
			units = "units",
		},
		-- additional_spell
		{
			name = "shield_heal",
			spellPrototype = "additional_spell",
			valField = { "aura_param", "duration", "period", },
				formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
		{
			name = "speed_mul",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.EnhancedShooting ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "range_mul",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "resist_add",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "additional_auras[1].mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.LongCloakingDevice ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "cooldown_dec",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			negative = true,
			units = "percent",
		},
		{
			name = "shield_regen_mul",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "bonus_damage",
			spellPrototype = "deactivate_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "bonus_duration",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.RocketWolfhound ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.thermal_large,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Rocket.volley.size,
		ItemTooltip.Explosions.holder_ammo,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
		
	},
	
	descriptionParams =
	{
		{
			name = "time_bonus",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "time_to_fire",
			valField = { "fire_rate", "ammo", "volley_size", },
			formula = function( ... )
				local arg = { ... }
				return ( arg[2] / arg[3] ) / ( arg[1] / 60 )
			end,
			units = "second",
		},
		{
			name = "volleys",
			valField = { "ammo", "volley_size", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ECMHack ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{		
		{
			name = "ttl1",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "ttl2",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "ttl3",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "deactivate_spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "ttl4",
			spellPrototype = "deactivate_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.VesselSwitch ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- def
		{
			name = "destruction_time",
			valField = "destruction_time",
			units = "second",
		},
		-- spell
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		--ship param
		{
			name = "mig_health",
			valField = "spaceship",
			formula = function ( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				return ship.hull_health
			end,	
			units = "units",
		},
		{
			name = "mig_shield",
			valField = "spaceship",
			formula = function ( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				return ship.shield_max
			end,	
			units = "units",
		},
		{
			name = "mig_capasitor", 
			valField = "spaceship",
			formula = function ( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				return ship.energy_max
			end,	
			units = "units",
		},
		{
			name = "mig_max_speed", 
			valField = "spaceship",
			formula = function ( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				return ship.max_speed
			end,	
			units = "metre_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldSuppressor ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- Пассивная аура
		{
			name = "damage",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent_per_second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		-- Активная аура
		{
			name = "resist_add",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "speed_increase",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration_for_bonus",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		-- Фишки модуля
		{
			name = "cooldown_target_range",
			valField = "cooldown_target_range",
			units = "metre",
		},
		{
			name = "cooldown_coef_per_target",
			valField = "cooldown_coef_per_target",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.DisintegratorPhased ] =
{
	tooltipParams = 
	{
		ItemTooltip.Special.disintegrator_phased.damage_thermal,
		--ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "dmg_frg",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "dmg_dstr",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "hit_time_interval",
			valField = "damage_coef_change_time",
			units = "second",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.DestrSpellOnChannel ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.dps.thermal_charged,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "energy_burn",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units_per_second",
		},
		{
			name = "energy_burn2",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param",
			units = "units_per_second",
		},
		{
			name = "range_inc_limit",
			spellPrototype = "spell",
			valField = "maintain_range_additional",
			units = "metre",
		},
		{
			name = "hull_resist",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
				{
			name = "hull_regen",
			spellPrototype = "spell_on_equip",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
	},
	
}

ItemTooltips[ ItemSubtype.FrontEnergyShield ] =
{
	tooltipParams = 
	{
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			subPrototype = "activate_entity",
			valField = "ttl",
			units = "second",
		},
		{
			name = "aura_param",
			subPrototype = "activate_entity",
			valField = { "damage_to_ship_energy_coef", },
			formula = function( ... )
				local arg = { ... }
				return 1 / arg[1]
			end,
			negative = true,
			units = "units",
		},
	},
	
}

ItemTooltips[ ItemSubtype.DestrSiegeMode ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage_add",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "tts",
			spellPrototype = "spell",
			valField = { "additional_auras[1].aura_param_add", },
			formula = function( ... )
				local arg = { ... }
				return 1 / arg[1]
			end,
			units = "second",
		},
		{
			name = "max_range_mul",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},
	},
}


ItemTooltips[ ItemSubtype.MovementChargesDestr ] =
{
	tooltipParams = 
	{
		ItemTooltip.Special.atilla.charge_max,
		ItemTooltip.Special.atilla.charge_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "minspeed",
			valField = "max_speed_percent",
			units = "percent",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_speed_mul",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.ScoutChameleon ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "influence_param",
			negative = true,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.WeaponHacker ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage_thermal",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaWeb ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		-- Общее для всех версий, spell
		{
			name = "weapon_damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		-- Специфическое для _Faction1, additional_auras
		--[[{
			-- ai.Aura.HEALING_MOD - писать про ауру надо, цифр не надо
			name = "duration",
			spellPrototype = "spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},]]
		--[[{
			name = "duration",
			spellPrototype = "spell",
			valField = "additional_auras[1].",
			units = "second",
		},]]
		-- Общее для всех версий, additional_spell
		{
			-- ai.Aura.DAMAGE_THERMAL_SCALED
			name = "additionalSpell_damage",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
		{
			-- ai.Aura.DAMAGE_THERMAL_SCALED
			name = "min_speed_percent",
			spellPrototype = "additional_spell",
			valField = "min_speed_percent",
			units = "percent",
		},
		--[[{
			-- ai.Aura.DAMAGE_THERMAL_SCALED
			name = "additionalSpell_duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},]]
		
	},
}

ItemTooltips[ ItemSubtype.TimeBoost ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.work_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "aura_param",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.FrigateDroneSwitch ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.num,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.respawn_period,
		ItemTooltip.Weapon.heal_per_second,
		ItemTooltip.Special.frigatedrones.max_res_dec,
		ItemTooltip.Module.energy_cost,
	},

	descriptionParams =
	{
		{
			name = "res_dec",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "dec_duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.FrigateDroneUniqRay ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.num,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.respawn_period,
		ItemTooltip.Weapon.heal_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "active_heal",
			spellPrototype = "spell",
			valField = { "aura_param","duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},
		{
			name = "active_heal_rng",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "active_heal_width",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "active_heal_dur",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		
	},
}

ItemTooltips[ ItemSubtype.FrigateDrone ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.num,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.respawn_period,
		ItemTooltip.Weapon.heal_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "drone_num",
			valField = "drone_num",
			units = "units",
		},
		{
			name = "drone_health",
			valField = "activate_entity_health",
			units = "units",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "damage",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "damage_thermal_dps",
			valField = { "damage_thermal", "fire_rate", },
			formula = function( ... )
		 local arg = { ... }
				return ( arg[1] * arg[2] ) / 60
			end,
		},
		{
			name = "anti_missile_radius",
			valField = "anti_missile_radius",
			units = "metre",
		},
		{
			name = "anti_missile_cooldown",
			valField = "anti_missile_cooldown",
			units = "second",
			negative = true,
		},
		{
			name = "heal_per_second",
			valField = "heal_per_second",
			units = "units",
		},
		{
			name = "drone_respawn_period",
			valField = "drone_respawn_period",
			units = "second",
			negative = true,
		},
		{
			name = "influence_param",
			spellPrototype = "spell",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "energy_cost",
			valField = "energy_cost",
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenDrones ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.emp,
		ItemTooltip.Drone.damage.emp,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Special.green_drones.missile_range,
		ItemTooltip.Special.green_drones.missile_speed,
		ItemTooltip.Special.green_drones.flight_rot_speed,
		ItemTooltip.Special.green_drones.missile_damage_emp,
		ItemTooltip.Special.green_drones.missile_blast_maxDistance,
		ItemTooltip.Drone.activation_ammo,
		ItemTooltip.Drone.ammo_regen_max,
		ItemTooltip.Drone.num,
		ItemTooltip.Drone.health,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "damage_to_heal_coef",
			valField = "damage_to_heal_coef",
			units = "percent",
		},
		{
			name = "influence_param",
			subPrototype = "activation_projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				local cast_spell = Spell[ arg[1] ].spells[1]
				local spell = Spell[ cast_spell ]
				return spell.influence_param
			end,
			units = "units",
		},
		{
			name = "target_range",
			subPrototype = "activation_projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				local cast_spell = Spell[ arg[1] ].spells[1]
				local spell = Spell[ cast_spell ]
				return spell.target_range
			end,
			units = "metre",
		},
	},
}


ItemTooltips[ ItemSubtype.FrgtDroneLessShldHeal ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.num,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.respawn_period,
		ItemTooltip.Weapon.heal_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "drone_num",
			valField = "drone_num",
			units = "units",
		},
		{
			name = "drone_health",
			valField = "activate_entity_health",
			units = "units",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "damage",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "damage_thermal_dps",
			valField = { "damage_thermal", "fire_rate", },
			formula = function( ... )
		 local arg = { ... }
				return ( arg[1] * arg[2] ) / 60
			end,
		},
		{
			name = "anti_missile_radius",
			valField = "anti_missile_radius",
			units = "metre",
		},
		{
			name = "anti_missile_cooldown",
			valField = "anti_missile_cooldown",
			units = "second",
			negative = true,
		},
		{
			name = "heal_per_second",
			valField = "heal_per_second",
			units = "units",
		},
		{
			name = "drone_respawn_period",
			valField = "drone_respawn_period",
			units = "second",
			negative = true,
		},
		{
			name = "influence_param",
			spellPrototype = "spell",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "energy_cost",
			valField = "energy_cost",
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "destroy_range",
			spellPrototype = "additional_spell",
			valField = "target_range",
			units = "metre",
		},
	},
}


ItemTooltips[ ItemSubtype.Disintegrator ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.damage.thermal_large,
		--ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,		
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "dmg_frg",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "dmg_dstr",
			spellPrototype = "spell_on_hit",
			valField = { "spells[2]" },
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "aura_add",
			spellPrototype = "spell_on_hit",
			valField = { "spells[3]" },
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				return aura_param * ( duration + 1 )
			end,
			units = "units",
		},
		{
			name = "dur_add",
			spellPrototype = "spell_on_hit",
			valField = { "spells[3]" },
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GigantShield ] =
{
	tooltipParams =
	{
		ItemTooltip.Entity.shield_charge,
		ItemTooltip.Entity.entity_ttl,
		ItemTooltip.Spell.effect.on_equip.resist_add,		
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_bust",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PhaseShield ] =    -- Фазовый щит / Phase Shield
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		--ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "aura_param_raid",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration_raid",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "hull_heal_coef",
			valField = "hull_heal_coef",
			units = "percent",
		},
		{
			name = "energy_bonus",
			spellPrototype = "spell_on_hit",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell0",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell0",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell1",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell1",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell2",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell2",
			valField = "additional_auras[1].duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GuidedMissile ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.projectile.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		 {
			name = "aura_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "aura_param",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "sec",
		},
		{
			name = "aura_param_huge",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Exorcist_GuidedMissile ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.projectile.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		 {
			name = "aura_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "aura_param",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "sec",
		},
		{
			name = "aura_param_huge",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
		{
			name = "range",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.BlackoutGenerator ] =
{
	tooltipParams =
	{
		ItemTooltip.Special.blackout.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "deactivate_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].target_range
			end,
			units = "metre",
		},
		{
			name = "duration_stun",
			spellPrototype = "deactivate_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "post_duration",
			spellPrototype = "deactivate_spell",
			valField = { "spells[2]" },
			formula = function ( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.MicroWarp ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.activate_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "prep_time",
			valField = "prep_time",
			units = "second",
			negative = true,
		},
		{
			name = "accel_time",
			valField = "accel_time",
			units = "second",
		},
		{
			name = "maxspeed_mul",
			valField = "maxspeed_mul",
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_warp",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_warp",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.CloakingDevice ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "bonus_duration",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "bonus_damage",
			spellPrototype = "deactivate_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "dispell_flag",
			spellPrototype = "spell",
			valField = "dispell_timeout",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.CloakingDeviceUniq ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "spd_bonus",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "several",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "bonus_damage",
			spellPrototype = "deactivate_spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyShieldCommander ] =    --    Диффузионный щит / Diffusion Shield
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		-- additional_spell    = "Bonus_damage"
		{
			name = "dmg_bonus",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "dmg_bonus_duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		-- additional_spell    = "Energy_renew"
		{
			name = "energy_bonus",
			spellPrototype = "additional_spell",
			valField = "influence_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyShieldLoki ] =    --    Диффузионный щит для Локи
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		-- additional_spell    = "Bonus_damage"
		{
			name = "dmg_bonus",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "dmg_bonus_duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		-- additional_spell    = "Energy_renew"
		{
			name = "param",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "range",
			spellPrototype = "additional_spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyShieldRegen ] =   
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.deactivate,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		-- additional_spell    = "Bonus_damage"
		{
			name = "dmg_bonus",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "dmg_bonus_duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		-- additional_spell    = "Energy_renew"
		{
			name = "energy_bonus",
			spellPrototype = "additional_spell",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "shield_heal",
			spellPrototype = "deactivate_spell",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * math.floor( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}


ItemTooltips[ ItemSubtype.ShieldWall ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "speed_bust",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "lock_dur",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "lock_range",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
		{
			name = "rst_dur",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "rst_bonus",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ChargedPlasmaWeb ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.dps.thermal,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
	},

	descriptionParams = 
	{
		-- spell_on_death_someone накопление зарядов
		{
			name = "damage_thermal_bonus",
			spellPrototype = "spell_on_death_someone",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "damage_thermal_bonus_max",
			spellPrototype = "spell_on_death_someone",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "percent",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_death_someone",
			valField = "max_stacks",
			units = "none",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenHealThrower ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.projectile_speed,
		ItemTooltip.Drone.activation_ammo,
		ItemTooltip.Drone.ammo_regen_max,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "heal_ttl",
			subPrototype = "activation_projectile",
			valField = "death_entity", -- Bonus_GreenCrystalHeal
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].ttl
			end,
			units = "second",
		},
		{
			name = "heal",
			subPrototype = "activation_projectile",
			valField = "death_entity", -- Bonus_GreenCrystalHeal
			formula = function( ... )
				local arg = { ... }
				local spell_approach = Def[ arg[1] ].spell_approach
				local aura_param = Spell[ spell_approach ].aura_param
				local duration = Spell[ spell_approach ].duration
				local period = Spell[ spell_approach ].period
				return aura_param * ( duration / period + 1 )
			end,
			units = "units",
		},
		{
			name = "heal_ally",
			subPrototype = "activation_projectile",
			valField = "death_entity", -- Bonus_GreenCrystalHeal
			formula = function( ... )
				local arg = { ... }
				local spell_approach = Def[ arg[1] ].spell_approach
				local add_spell = Spell[ spell_approach ].additional_auras[1]
				return add_spell.aura_param * (add_spell.duration / add_spell.period + 1)
			end,
			units = "units",
		},
		{
			name = "aura_range",
			subPrototype = "activation_projectile",
			valField = "death_entity", -- Bonus_GreenCrystalHeal
			formula = function( ... )
				local arg = { ... }
				local spell_approach = Def[ arg[1] ].spell_approach
				return Spell[ spell_approach ].additional_auras[1].aura_range
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenTurret ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.projectile_speed,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.num,
		ItemTooltip.Drone.activation_ammo,
		ItemTooltip.Drone.ammo_regen_max,
		ItemTooltip.Special.green_turret.static_damage_thermal,
		ItemTooltip.Special.green_turret.static_fire_rate,
		ItemTooltip.Special.green_turret.static_weapon_range,
		ItemTooltip.Special.green_turret.static_health,
		ItemTooltip.Special.green_turret.static_ttl,
		ItemTooltip.Special.green_turret.space_damage_thermal,
		ItemTooltip.Special.green_turret.space_fire_rate,
		ItemTooltip.Special.green_turret.space_weapon_range,
		ItemTooltip.Special.green_turret.space_health,
		ItemTooltip.Special.green_turret.space_ttl,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,		
	},
}

ItemTooltips[ ItemSubtype.UntouchableGhost ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.health,
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Drone.num,
		ItemTooltip.Drone.activation_ammo,
		ItemTooltip.Drone.ammo_regen_max,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "restriction_time",
			spellPrototype = "spell",
			valField = "apply_interval",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.FollowerDrone ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.health,
		ItemTooltip.Special.followerdrone.range,
		ItemTooltip.Drone.num,
		ItemTooltip.Drone.activation_ammo,
		ItemTooltip.Drone.ammo_regen_max,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- module
		{
			name = "damage_to_shield_coef",
			valField = "damage_to_shield_coef",
			units = "percent",
		},
		{
			name = "damage_add",
			spellPrototype = "spell",
			valField = "drone_def",
			formula = function(...)
				local arg = {...}
				return Def[ arg[1] ].damage_thermal
			end,
			units = "units",
		},
		-- spell
		{
			name = "drone_ttl",
			spellPrototype = "spell",
			valField = "drone_ttl",
			units = "second",
		},
		-- additional_spell
		{
			name = "drone_heal",
			spellPrototype = "additional_spell",
			valField = { "aura_param", "duration", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] * (arg[2] / arg[3] + 1)
			end,
			units = "units",
		},
		{
			name = "damage_drone_coef",
			valField = "tooltip_param_drone_coef",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CrystalJumpSeries ] =
{
	tooltipParams =
	{
		ItemTooltip.Special.crystaljump.charge_max,
		ItemTooltip.Module.charge_cooldown,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "spell_coef_change_time",
			valField = "spell_coef_change_time",
			units = "second",
		},
		{
			name = "jump_range",
			spellPrototype = "additional_spell",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			units = "metre",
		},
		-- Дамажащее облако
		{
			name = "cloud_dmg",
			spellPrototype = "spell",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "cloud_size",
			spellPrototype = "spell",
			valField = { "aura_range", "aura_range_add", "duration", },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1]
				end,
				function( ... )
					local arg = { ... }
					return arg[1] + arg[2] * arg[3]
				end,
			},
			units = "metre",
			concat = "%s -> %s",
		},
	},
}

ItemTooltips[ ItemSubtype.BackwardTime ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "max_leap_time",
			valField = "max_leap_time",
			units = "second",
		},
		{
			name = "transition_time",
			valField = "transition_time",
			units = "second",
		},
		{
			name = "safe_exit_time",
			valField = "safe_exit_time",
			units = "second",
		},
		{
			name = "fast_maneuver",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.MicroWarpDamage ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- jump spell
		{
			name = "jump_range",
			spellPrototype = "additional_spell",
			valField = "influence_param",
			absValue = true,
			units = "metre",
		},
		-- cylinder spell
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local dps = Spell[ arg[1] ].aura_param
				local period = Spell[ arg[1] ].period
				return dps / period
			end,
			units = "damage_per_second",
		},
		{
			name = "ttl",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		-- cloud spell
		{
			name = "cloud_dmg",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				local dps = Spell[ arg[1] ].aura_param
				local period = Spell[ arg[1] ].period
				return dps / period
			end,
			units = "damage_per_second",
		},
		{
			name = "cloud_size",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = {
				function( ... )
					local arg = { ... }
					return Spell[ arg[1] ].aura_range
				end,
				function( ... )
					local arg = { ... }
					aura_range = Spell[ arg[1] ].aura_range
					aura_range_add = Spell[ arg[1] ].aura_range_add
					duration = Spell[ arg[1] ].duration
					period = Spell[ arg[1] ].period
					return aura_range + aura_range_add * ( duration / period + 1 )
				end,
			},
			concat = "%s - %s",
			units = "metre",
		},
		{
			name = "ttl2",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.MicroWarpTunnel ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "jump_range",
			spellPrototype = "additional_spell",
			valField = "influence_param",
			units = "metre",
		},
		{
			name = "speed_mul",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.CrystalFrySatellites ] =
{
	tooltipParams =
	{
		ItemTooltip.Special.crystal_satellites.dps_thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Special.crystal_satellites.range,
		--ItemTooltip.Special.crystal_satellites.crit_chance,
		--ItemTooltip.Special.crystal_satellites.crit_damage,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.ttl,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = {
		{
			name = "heal",
			spellPrototype = "drone_deactivate_spell",
			valField = { "aura_param", "duration", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.CrystalSpit ] =
{
	tooltipParams = {
		ItemTooltip.Special.crystalspit.dps_emp,
		ItemTooltip.Special.crystalspit.spell_size,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.module.flight_speed,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "heal",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function ( ... )
				local arg = { ... }
				local spell_approach = Def[ arg[1] ].spell_approach
				aura_param = Spell[ spell_approach ].aura_param
				return aura_param * 3 -- 3 это расчет на 3 секунды полета, как в Spell.Spell_CrystalSpit
			end,
			units = "units",
		},
		{
			name = "speed_bust",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "spells[2]",
			formula = function ( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "spells[2]",
			formula = function ( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.GreenTimeBoost ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "aura_param",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		-- зеленая часть
		{
			name = "death_detector_range",
			spellPrototype = "additional_spell",
			valField = "trigger_range",
			units = "metre",
		},
		{
			name = "hull_heal",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				return aura_param * (duration+1)
			end,
			units = "units",
		},
		{
			name = "heal_duration",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.DroneScavenger ] =
{
	tooltipParams =
	{
		ItemTooltip.Special.scavenger.damage_sum,
		ItemTooltip.Special.scavenger.heal_sum,
		ItemTooltip.Special.scavenger.damage,
		ItemTooltip.Special.scavenger.heal,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.CrystalAttackerCloud ] =
{
	tooltipParams =
	{
	--	ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			absValue = true,
			units = "metre",
		},
		{
			name = "damage_SM",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * 4
			end,
			absValue = true,
			units = "units",
		},
		{
			name = "damage_L",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * 4
			end,
			absValue = true,
			units = "units",
		},
		{
			name = "damage_H",
			spellPrototype = "spell",
			valField = "spells[3]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * 4
			end,
			absValue = true,
			units = "units",
		},		
		{
			name = "max_convert",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			absValue = true,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyReroute ] = -- Маршрутизатор энергии тип 1
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "damage",
			spellPrototype = "spell1",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "shield",
			spellPrototype = "spell2",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "shield_resist_add",
			spellPrototype = "spell2",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldChargesDestr ] = --
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "dmgForCharge",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "maxCharge",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype = "spell",
			valField = { "aura_param", "duration", "period" },
			formula = {
				function( ... )
					local arg = { ... }
					return ( arg[1] * ( arg[2] / arg[3] + 1 ) ) * BlastWaveSignatureCoef[ ai.Signature.SMALL ]
				end,
				function( ... )
					local arg = { ... }
					return ( arg[1] * ( arg[2] / arg[3] + 1 ) ) * BlastWaveSignatureCoef[ ai.Signature.HUGE ]
				end,
			},
			concat = "%s - %s",
			units = "units",
		},
		{
			name = "shield_regen",
			spellPrototype = "additional_spell",
			valField = { "aura_param", "duration", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
		{
			name = "shield_resist",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.CookSpeedUp ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_bust",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "fast_maneuver",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.SinglePortal ] =
{
	tooltipParams =
	{
		ItemTooltip.Special.single_portal.portal_range,
		ItemTooltip.Special.single_portal.portal_ttl,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "teleport_cooldown",
			subPrototype = "gate",
			valField = "teleport_cooldown",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SinglePortalPrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "teleport_range_min",
			valField = "teleport_range_min",
			units = "metre",
		},
		{
			name = "teleport_range_max",
			valField = "teleport_range_max",
			units = "metre",
		},
		{
			name = "teleport_gate_ttl",
			valField = "teleport_gate_ttl",
			units = "second",
		},
		{
			name = "teleport_cooldown",
			subPrototype = "gate",
			valField = "teleport_cooldown",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.OverchargePrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.work_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.TimeBombPrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.delay,
		ItemTooltip.Spell.range.deactivate,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_dec",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus"
		},
		{
			name = "aura_range",
			spellPrototype = "deactivate_spell",
			valField = "aura_range",
			units = "metre"
		},
		{
			name = "aura_param",
			spellPrototype = "deactivate_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent_minus"
		},
		{
			name = "duration",
			spellPrototype = "deactivate_spell",
			valField = "additional_auras[1].duration",
			units = "second"
		},
	},
}

ItemTooltips[ ItemSubtype.PhaseBuffPrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "resist_param",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "damage_param",
			spellPrototype = "spell1",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "speed_param",
			spellPrototype = "spell2",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.SmallBattleStation] = 
{
	tooltipParams = 
	{
		ItemTooltip.Active.battle_station.health_upgraded,
		ItemTooltip.Active.battle_station.heal_cost,
		ItemTooltip.Active.battle_station.heal_speed,
		ItemTooltip.Active.battle_station.owner_distance,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "autonomy_ttl",
			subPrototype = "station",
			valField = "orphan_time",
			units = "second",
		},
		-- upgrade base
		{
			name = "turret_dps",
			subPrototype = "station",
			valField = "upgrades[1].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				local damage = Def[ arg[1] ].damage_kinetic
				local fire_rate = Def[ arg[1] ].fire_rate
				return damage * fire_rate / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "turret_range",
			subPrototype = "station",
			valField = "upgrades[1].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_range
			end,
			units = "metre",
		},
		-- upgrade 1.1
		{
			name = "s1m1_damage",
			subPrototype = "station",
			valField = "upgrades[2].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].damage_thermal
			end,
			units = "units",
		},
		{
			name = "s1m1_firerate",
			subPrototype = "station",
			valField = "upgrades[2].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].fire_rate
			end,
			units = "shot_per_minute",
		},
		{
			name = "s1m1_range",
			subPrototype = "station",
			valField = "upgrades[2].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_range
			end,
			units = "metre",
		},
		-- upgrade 1.2
		{
			name = "s1m2_damage",
			subPrototype = "station",
			valField = "upgrades[2].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].damage_emp
			end,
			units = "units",
		},
		{
			name = "s1m2_firerate",
			subPrototype = "station",
			valField = "upgrades[2].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].fire_rate
			end,
			units = "shot_per_minute",
		},
		{
			name = "s1m2_range",
			subPrototype = "station",
			valField = "upgrades[2].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_range
			end,
			units = "metre",
		},
		-- upgrade 2.1		
		{
			name = "s2m1_cooldown",
			subPrototype = "station",
			valField = "upgrades[3].modifications[1].def",
			formula = function( ... )
					local arg = { ... }
					return Def[ arg[1] ].cooldown
				end,
			units = "second",
		},
		{
			name = "s2m1_heal",
			subPrototype = "station",
			valField = "upgrades[3].modifications[1].def",
			formula = {
				function( ... )
					local arg = { ... }
					local def = Def[ arg[1] ]
					local bonus_def = Def[ def.bonus_level1 ]
					local spell = Spell[ bonus_def.spell ]
					return spell.aura_param * ( spell.duration / spell.period + 1 )
				end,
				function( ... )
					local arg = { ... }
					local def = Def[ arg[1] ]
					local bonus_def = Def[ def.bonus_level3 ]
					local spell = Spell[ bonus_def.spell ]
					return spell.aura_param * ( spell.duration / spell.period + 1 )
				end,
			},
			concat = "%s - %s",
			units = "units",
		},
		-- upgrade 2.2
		{
			name = "s2m2_cooldown",
			subPrototype = "station",
			valField = "upgrades[3].modifications[2].def",
			formula = function( ... )
					local arg = { ... }
					return Def[ arg[1] ].cooldown
				end,
			units = "second",
		},
		{
			name = "s2m2_dps",
			subPrototype = "station",
			valField = "upgrades[3].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local drone = Def[ def.drone ]
				return def.damage_thermal * drone.fire_rate / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "s2m2_health",
			subPrototype = "station",
			valField = "upgrades[3].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local drone = Def[ def.drone ]
				return drone.health
			end,
			units = "units",
		},
		{
			name = "s2m2_count",
			subPrototype = "station",
			valField = "upgrades[3].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				return def.max_drones
			end,
			units = "units",
		},
		{
			name = "s2m2_ttl",
			subPrototype = "station",
			valField = "upgrades[3].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local drone = Def[ def.drone ]
				return drone.ttl
			end,
			units = "second",
		},
		-- upgrade 2.3
		{
			name = "s2m3_cooldown",
			subPrototype = "station",
			valField = "upgrades[3].modifications[3].def",
			formula = function( ... )
					local arg = { ... }
					return Def[ arg[1] ].cooldown
				end,
			units = "second",
		},
		{
			name = "s2m3_range",
			subPrototype = "station",
			valField = "upgrades[3].modifications[3].def",
			formula = function( ... )
					local arg = { ... }
					return Def[ arg[1] ].range
				end,
			units = "metre",
		},
		{
			name = "s2m3_dps",
			subPrototype = "station",
			valField = "upgrades[3].modifications[3].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local drone = Def[ def.drone ]
				return def.damage_thermal * drone.fire_rate / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "s2m3_heal",
			subPrototype = "station",
			valField = "upgrades[3].modifications[3].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local parcel = Def[ def.parcel ]
				local spell = Spell[ parcel.spell ]
				return spell.aura_param * ( math.floor( spell.duration / spell.period ) + 1 )
			end,
			units = "units",
		},
		{
			name = "s2m3_health",
			subPrototype = "station",
			valField = "upgrades[3].modifications[3].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local drone = Def[ def.drone ]
				return drone.health
			end,
			units = "units",
		},
		{
			name = "s2m3_count",
			subPrototype = "station",
			valField = "upgrades[3].modifications[3].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				return def.max_drones
			end,
			units = "units",
		},
		{
			name = "s2m3_ttl",
			subPrototype = "station",
			valField = "upgrades[3].modifications[3].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local drone = Def[ def.drone ]
				return drone.ttl
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EngineerPhaseBuff ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		--ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "phase0_heal",
			spellPrototype = "spell0",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.aura_param * ( spell.duration / spell.period + 1 )
			end,
			units = "units",
		},
		{
			name = "phase0_heal_range",
			spellPrototype = "spell0",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.aura_range
			end,
			units = "metre",
		},
		{
			name = "phase0_damage_dec",
			spellPrototype = "spell0",
			valField = "additional_auras[1].aura_param",
			formula = function( ... )
				local arg = { ... }
				return -arg[1]
			end,
			units = "percent",
		},
		{
			name = "phase1_resist",
			spellPrototype = "spell1",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "phase1_mod_range",
			spellPrototype = "spell1",
			valField = "additional_auras[1].mod_range",
			units = "metre",
		},
		{
			name = "phase1_mod_max",
			spellPrototype = "spell1",
			valField = "additional_auras[1].mod_max",
			units = "units",
		},
		{
			name = "phase1_resist_add",
			spellPrototype = "spell1",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
		{
			name = "phase1_damage_add",
			spellPrototype = "spell1",
			valField = "additional_auras[3].aura_param",
			units = "percent",
		},
		{
			name = "phase1_module_range_dec",
			spellPrototype = "spell1",
			valField = "additional_auras[2].aura_param",
			formula = function( ... )
				local arg = { ... }
				return -arg[1]
			end,
			units = "percent",
		},
		{
			name = "phase2_speed",
			spellPrototype = "spell2",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "phase2_resist_dec",
			spellPrototype = "spell2",
			valField = "additional_auras[1].aura_param",
			formula = function( ... )
				local arg = { ... }
				return -arg[1]
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PaperSpeedUp ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{		
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_param_2",
			spellPrototype = "deactivate_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration_2",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PaperEMI ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{		
		{
			name = "cone_angle",
			spellPrototype = "spell",
			valField = { "aura_range", "aura_extra_radius", },
			formula = function( ... )
				local arg = { ... }
				return math.deg( math.atan( ( arg[2] / 2 ) / arg[1] ) )
			end,
			units = "degree",
		},
	},
}

ItemTooltips[ ItemSubtype.PaperFirewall ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{		
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "aura_param_2",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.AvengersPlasmaWeb ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "weapon_damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "additionalSpell_stasis",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},	
	},
}

ItemTooltips[ ItemSubtype.AvengersTimeBoost ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.work_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "resist_dec",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.AvengersGuidedMissile ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.projectile.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		 {
			name = "target_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "aura_param",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "damage_huge",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].additional_auras[1].aura_param
			end,
			units = "units",
		},
	},
}


ItemTooltips[ ItemSubtype.LandingDisintegrator ] =
{
	tooltipParams = 
	{
		
		ItemTooltip.Weapon.damage.thermal_large,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,		
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
		
	},
	
	descriptionParams = 
	{
		{
			name = "max_speed_landing",
			valField = "max_speed",
			units = "metre_per_second",
		},
		{
			name = "max_range_landing",
			valField = "landing_max_range",
			units = "metre",
		},
		{
			name = "max_angle_landing",
			valField = "landing_max_angle",
			units = "degree",
		},
		{
			name = "resist_add",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "dmg_frg",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
			local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "dmg_dstr",
			spellPrototype = "spell_on_hit",
			valField = { "spells[2]" },
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "immortal_time",
			spellPrototype = "spell",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.VesselSwitchDouble ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "bot_respawn_time",
			--spellPrototype = "spell",
			valField = "bot_respawn_time",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ZmHumansInvul ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.ZmAliensOvercharge ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CdFirerateUp ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.work_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "firerate_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CdShield ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.work_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "shield_health",
			spellPrototype = "spell",
			valField = "aura_holder_def",
			formula = function( ... )
				local arg = { ... }
				local shield = Def[ arg[1] ]
				return shield.health
			end,
			units = "units",
		},
		{
			name = "resist_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.CdManeuverUp ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.work_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "maneuver_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "min_speed_bonus",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.NaglfarClones ] =
{
	tooltipParams = 
	{
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "count_dist",
			valField = "spell_on_death_trigger_range",
			units = "metre",
		},
		{
			name = "count_max",
			valField = "ammo",
			units = "units",
		},
		{
			name = "clone_ally_camo_param",
			valField = "spawn_bots",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				local module = Def[ ship.default_modules[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] ]
				local spell = Spell[ module.spell_on_equip ]
				return spell.aura_param
			end,
			units = "percent_minus",
		},
		{
			name = "clone_ally_camo_range",
			valField = "spawn_bots",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				local module = Def[ ship.default_modules[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] ]
				local spell = Spell[ module.spell_on_equip ]
				return spell.aura_range
			end,
			units = "metre",
		},
		{
			name = "clone_dps",
			valField = "spawn_bots",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				local weapon = Def[ ship.default_modules[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] ]
				return weapon.damage_kinetic * weapon.fire_rate / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "clone_max_range",
			valField = "spawn_bots",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				local weapon = Def[ ship.default_modules[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] ]
				return weapon.max_range
			end,
			units = "metre",
		},
		{
			name = "clone_health",
			valField = "spawn_bots",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				return ship.hull_health
			end,
			units = "units",
		},
		{
			name = "clone_shield",
			valField = "spawn_bots",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				return ship.shield_max
			end,
			units = "units",
		},
		{
			name = "clone_ttl",
			valField = "spawn_bots_ttl",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.VesselSwitchAlbiero ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "small_dps",
			valField = "spaceship",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				local weapon = Def[ ship.default_modules[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] ]
				return weapon.damage_emp * ship.weapon_slots * weapon.fire_rate / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "small_max_range",
			valField = "spaceship",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				local weapon = Def[ ship.default_modules[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] ]
				return weapon.max_range
			end,
			units = "metre",
		},
		{
			name = "small_health",
			valField = "spaceship",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				return ship.hull_health
			end,
			units = "units",
		},
		{
			name = "small_shield",
			valField = "spaceship",
			formula = function( ... )
				local arg = { ... }
				local ship = Def[ arg[1] ]
				return ship.shield_max
			end,
			units = "units",
		},
		{
			name = "max_speed_mul",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.ThorBlast ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.aura_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.max_stacks
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "damage_emp",
			spellPrototype = { "spell", "deactivate_spell", "deactivate_spell", "deactivate_spell", },
			valField = { "target_spell", "aura_param", "duration", "period", },
			formula = {
				function( ... )
					local arg = { ... }
					local damage = arg[2] * ( 1 + arg[3] / arg[4] )
					return damage
				end,
				function( ... )
					local arg = { ... }
					local spell = Spell[ arg[1] ]
					local damage = arg[2] * ( 1 + arg[3] / arg[4] )
					return damage * spell.max_stacks
				end,
			},
			concat = "%s - %s",
			units = "damage",
		},
		{
			name = "aura_range",
			spellPrototype = "deactivate_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "radius",
			spellPrototype = "deactivate_spell",
			valField = "aura_extra_radius",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyShieldCommanderUniq ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.aura_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "resist_add",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.FrigatePizza ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "drone_respawn_period",
			valField = "drone_respawn_period",
			units = "second",
			negative = true,
		},
		{
			name = "drone_num",
			valField = "drone_num",
			units = "units",
		},
		{
			name = "drone_health",
			valField = "activate_entity_health",
			units = "units",
		},
		{
			name = "heal_per_second",
			valField = "heal_per_second",
			units = "units",
		},
		{
			name = "energy_cost",
			valField = "energy_cost",
			units = "units",
		},
		{
			name = "warheads_count",
			subPrototype = "activation_projectile",
			valField = "child_rockets.scheme",
			formula = function( ... )
				local arg = { ... }
				local sum = 0
				for m,t in pairs( arg[1] ) do
					sum = sum + t.amount
				end
				return sum
			end,
			units = "pieces",
		},
		{
			name = "max_range",
			subPrototype = "activation_projectile",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "damage_kinetic",
			subPrototype = "activation_projectile",
			valField = "child_rockets.rocket",
			formula = function( ... )
				local arg = { ... }
				local rocket = Def[ arg[1] ]
				local blast = Def[ rocket.explosion_blast_wave ]
				return blast.damage_kinetic
			end,
			units = "damage",
		},
		{
			name = "aura_param",
			subPrototype = "activation_projectile",
			valField = "child_rockets.rocket",
			formula = function( ... )
				local arg = { ... }
				local rocket = Def[ arg[1] ]
				local spell = Spell[ rocket.spell ]
				return spell.aura_param
			end,
			units = "percent",
		},
		{
			name = "duration",
			subPrototype = "activation_projectile",
			valField = "child_rockets.rocket",
			formula = function( ... )
				local arg = { ... }
				local rocket = Def[ arg[1] ]
				local spell = Spell[ rocket.spell ]
				return spell.duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaWebBlast ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "weapon_damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "additionalSpell_damage",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param",
			units = "damage_per_second",
		},
		{
			name = "min_speed_percent",
			spellPrototype = "spell",
			valField = "additional_auras[2].min_speed_percent",
			units = "percent",
		},
		{
			name = "field_radius",
			spellPrototype = "additional_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "rocket_damage_thermal",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local multicast = Spell[ arg[1] ]
				local spell = Spell[ multicast.spells[1] ]
				local blast = Def[ spell.explosion_blast_wave ]
				return blast.damage_thermal
			end,
			units = "damage",
		},
		{
			name = "rocket_damage_range", --Радиус взрыва
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local multicast = Spell[ arg[1] ]
				local spell = Spell[ multicast.spells[1] ]
				local blast = Def[ spell.explosion_blast_wave ]
				return blast.blast_maxDistance
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaWebStatic ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "weapon_damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "additional_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "charge_damage",
			spellPrototype = "additional_spell",
			valField = {"aura_param", "aura_param_stages"},
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2][1]
			end,
			units = "damage",
		},
	},
}

ItemTooltips[ ItemSubtype.SilentHunter ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.aura_additional_target_range,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_radius",
			spellPrototype = "additional_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "res_dec",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				local res_dec_spell = Spell[ spell.spells[1] ]
				return res_dec_spell.aura_param
			end,
			units = "units",
		},
		{
			name = "res_inc",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				local res_inc_spell = Spell[ spell.spells[3] ]
				return res_inc_spell.aura_param
			end,
			units = "units",
		},
		{
			name = "res_dec_time",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				local res_dec_spell = Spell[ spell.spells[1] ]
				return res_dec_spell.duration
			end,
			units = "second",
		},
		{
			name = "antiradar_dur",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
	},
}

------------------------------ [ ACTIVE ] ------------------------------

ItemTooltips[ ItemSubtype.ComboRestore ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "shield_resist_add",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "hull_regen_add",
			spellPrototype = "spell",
			valField = { "additional_auras[1].aura_param", "additional_auras[1].duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "speed_mul",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.Stealth ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_mul",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "shield_resist_dec",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.DetectionBeacon ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "heal_dec",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.BlackBomb ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage_to_shield",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "percent",
		},
		{
			name = "ttl",
			valField = { "max_range", "projectile_speed", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "second",
		},
		{
			name = "weapon_damage_emp",
			subPrototype = { nil, nil, "projectile", },
			valField = { "max_range", "projectile_speed", "power_charge_coef", },
			formula = function( ... )
				local arg = { ... }
				local ttl = arg[1] / arg[2]
				local power_charge_coef = arg[3]
				return ttl * power_charge_coef
			end,
			units = "damage",
		},
		{
			name = "field_radius",
			subPrototype = "projectile",
			valField = "max_owner_distance",
			units = "metre",
		},
		{
			name = "cloud_size",
			subPrototype = { nil, nil, "projectile", },
			valField = { "max_range", "projectile_speed", "range_charge_coef", },
			formula = function( ... )
				local arg = { ... }
				local ttl = arg[1] / arg[2]
				local range_charge_coef = arg[3]
				return ttl * range_charge_coef
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.HealBanHaze ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "reduce_heal",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		-- additional_spell
		{
			name = "damage_thermal",
			spellPrototype = "additional_spell",
			valField = {"aura_param","period"},
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.HealEnergyBanHaze ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "reduce_heal",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		-- additional_spell
		{
			name = "energy_regen_mul",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.FuelEmissionsScout ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "period",
			spellPrototype = "spell",
			valField = "period",
			units = "second",
		},
		{
			name = "cloud_size",
			spellPrototype = "spell",
			valField = "target_spell",
			formula =
			{
				function( ... )
					local arg = { ... }
					return Spell[ arg[1] ].aura_range
				end,
				function( ... )
					local arg = { ... }
					local aura_range = Spell[ arg[1] ].aura_range
					local aura_range_add = Spell[ arg[1] ].aura_range_add
					local duration = Spell[ arg[1] ].duration
					local period = Spell[ arg[1] ].period
					return aura_range + aura_range_add * duration / period
				end,
			},
			concat = "%s - %s",
			units = "metre",
		},
		{
			name = "cloud_dmg",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local period = Spell[ arg[1] ].period
				return aura_param / period
			end,
			units = "units_per_second",
		},
		{
			name = "cloud_ttl",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.TeamGuide ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		-- additional_spell
		{
			name = "fire_rate_mul",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.FakeShipsUpgraded ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "clones_power",
			valField = "clones_power",
			units = "percent",
		},
		{
			name = "clones_ttl",
			valField = "clones_ttl",
			units = "second",
		},
		-- spell MDFakeShips_T1_Mk1
			-- INFRARED_COUNTERMEASURE
		-- additional_spell FakeShips_T2_Mk1
			-- DISABLE_LOCK for ENEMY_LOCKER_SHIPS
	},
}

ItemTooltips[ ItemSubtype.SpyDroneShieldThief ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "reduce_heal",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			absValue = true,
			units = "percent",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "shield_dec",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.ScoutReturn ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "time_to_live",
			subPrototype = "activate_entity",
			valField = "time_to_live",
			units = "second",
		},
		{
			name = "hull_heal",
			spellPrototype = "deactivate_spell",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SpyBeaconAnalyse ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "resist_dec",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ScoutChameleonCommon ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceShift ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "jump_range",
			spellPrototype = "spell",
			valField = "influence_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "uncanceled_influence_time",
			spellPrototype = "additional_spell",
			valField = "dispell_timeout",
			units = "second",
		},
		
	},
}

ItemTooltips[ ItemSubtype.GrowingStar ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.growing_star.damage_emp,
		ItemTooltip.Active.growing_star.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_dec",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_param",
			units = "percent_minus"
		},
		{
			name = "keep_alive_range",
			subPrototype = "projectile",
			valField = "max_owner_distance",
			units = "metre"
		},
	},
}

ItemTooltips[ ItemSubtype.WeaknessDrone ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.AoeStealthDrone ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
				
	},
	
	descriptionParams =
	{
		{
			name = "unhide_time",
			spellPrototype = "spell",
			valField = "dispel_interval",
			units = "second",
		},
		{
			name = "drone_health",
			valField = "activate_entity_health",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.FakeShips ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "clones_power",
			valField = "clones_power",
			units = "percent",
		},
		{
			name = "clones_ttl",
			valField = "clones_ttl",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenFakeShips ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "clones_power",
			valField = "clones_power",
			units = "percent",
		},
		{
			name = "clones_ttl",
			valField = "clones_ttl",
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Shift ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldVampire ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "shield_transfer",
			spellPrototype = "spell",
			valField = { "aura_param", "duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SpyDrone ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "reduce_heal",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
			absValue = true,
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SpyDronePirate ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "reduce_heal",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			units = "percent",
			absValue = true,
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SpyBeacon ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenBeacon ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		{
			name = "shield_swap_speed",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.EMIMine ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "energy_transfer",
			spellPrototype = "spell",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "energy_per_second",
		},
		{
			name = "transfer_coef",
			spellPrototype = "spell",
			valField = "energy_blastwave",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].damage_emp
			end,
			units = "none",
		},
	},
}

ItemTooltips[ ItemSubtype.EngineHack ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "strafe_speed_dec",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			negative = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RadiationCloud ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage_emp",
			spellPrototype = "spell",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "cloud_size",
			spellPrototype = "spell",
			valField = { "aura_range", "aura_extra_radius", },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1]
				end,
				function( ... )
					local arg = { ... }
					return arg[2]
				end,
			},
			concat = "%s x %s",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.HunterZone ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "strafe_speed_dec",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			negative = true,
			units = "percent",
		},
		-- additional_spell
		{
			name = "resist_add",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.LanceWeakness ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "resist_dec",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},
		{
			name = "duration_on_target",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		-- additional_spell
		{
			name = "projectile_speed_mul",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.HardRadiation ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "weapon_damage_emp_dps",
			spellPrototype = "spell",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "cone_angle",
			spellPrototype = "spell",
			valField = { "target_range", "target_extra_radius", },
			formula = function( ... )
				local arg = { ... }
				return math.deg( math.atan( ( arg[2] / 2 ) / arg[1] ) )
			end,
			units = "degree",
		},
	},
}

ItemTooltips[ ItemSubtype.SaveJump ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.teleport,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "hull_heal",
			spellPrototype = "additional_spell",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaTorpedoGenerator ] =
{
	tooltipParams =
	{
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- module
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
		{
			name = "damage_emp",
			valField = "damage_emp",
			units = "damage",
		},
		{
			name = "preparation_time",
			valField = "preparation_time",
			units = "second",
		},
		{
			name = "preparation_max_rotation_angle",
			valField = "preparation_max_rotation_angle",
			units = "degree",
		},
	},
}

ItemTooltips[ ItemSubtype.FoxMShot ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.delay,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "strafe_speed_mul",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "delay",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		-- deactivate_spell
		{
			name = "weapon_damage_emp",
			spellPrototype = "deactivate_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local period = Spell[ arg[1] ].period
				local duration = Spell[ arg[1] ].duration
				return aura_param * ( duration / period + 1 )
			end,
			units = "units",
		},
		{
			name = "damage_addititional",
			spellPrototype = "deactivate_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local period = Spell[ arg[1] ].period
				local duration = Spell[ arg[1] ].duration
				return aura_param * ( duration / period + 1 )
			end,
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "deactivate_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "radius",
			spellPrototype = "deactivate_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_extra_radius
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.HorrorHowl ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyDiversion ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage_emp",
			spellPrototype = "spell",
			valField = { "aura_param", "duration", "period", "mod_max", },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1] * ( arg[2] / arg[3] + 1 )
				end,
				function( ... )
					local arg = { ... }
					return ( arg[1] * ( arg[2] / arg[3] + 1 ) ) * arg[4]
				end,
			},
			concat = "%s - %s",
			units = "units",
		},
		-- additional_spell
		{
			name = "aura_range",
			spellPrototype = "additional_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "energy_dec",
			spellPrototype = "additional_spell",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.RadiationWeapon ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "energy_dec",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell1 = Spell[ arg[1] ].spells[1]
				return Spell[ spell1 ].aura_param
			end,
			units = "units_per_second",
		},
		{
			name = "damage_emp",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units_per_second",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell1 = Spell[ arg[1] ].spells[1]
				return Spell[ spell1 ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ChaosSpawner ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.DiverTransparency ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "UNTOUCHABLE_duration",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		-- additional_spell
		{
			name = "SILENCE_duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
			
	},
}

ItemTooltips[ ItemSubtype.Backstab ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.teleport,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "resist_add",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.FotonVortex ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ttl",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "damage",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "max",
			spellPrototype = "spell_on_hit",
			valField = "max_stacks",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.EcmJammer ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.AchillesTargetingUnit ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "dmg_increase",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.Suicide ] =
{
	 tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		
		{
			name = "dmg_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "dmg_per_sec",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage",
		},
		{
			name = "dmg_duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "sec",
		},
		{
			name = "blast_dmg",
			subPrototype = "suicide_blastwave_def",
			valField = "damage_thermal",
			units = "damage",
		},
		{
			name = "DOT_range",
			spellPrototype = "spell_on_death_active",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "DOT",
			spellPrototype = "spell_on_death_active",
			valField = "aura_param",
			units = "damage",
		},
		{
			name = "DOT_duration",
			spellPrototype = "spell_on_death_active",
			valField = "duration",
			units = "sec",
		},
	},
}

ItemTooltips[ ItemSubtype.Chameleon ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyLance ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "lance_length",
			valField = "damage_box_size.z",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "metre",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "units",
		},
		{
			name = "work_time",
			valField = "work_time",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.InfoBarrier ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "activate_entity_ttl",
			valField = "activate_entity_ttl",
			units = "second",
		},
		{
			name = "entity_range",
			valField = "spawn_offset",
			formula = function( ... )
				local arg = { ... }
				return arg[1].z
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.EnlargeActiveCooldown ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.ecm.damage_mul,
		ItemTooltip.Active.ecm.energy_transfer,
		ItemTooltip.Active.ecm.duration,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		-- EnlargeActiveCooldown_Self ai.Aura.DEBUFF_IMMUNE
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		-- EnlargeActiveCooldown
		{
			name = "duration_on_target",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].target_range
			end,
			units = "metre",
		},
		{
			name = "cooldown_mul",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return 1 + Spell[ arg[1] ].aura_param
			end,
			units = "none",
		},
	},
}

ItemTooltips[ ItemSubtype.LossOfSignatures ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura_additional,
		ItemTooltip.Spell.duration.inner,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_mul",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		{
			name = "heal_dec",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.BeaconActiveSilence ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.HackRocket ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.ecm.damage_mul,
		ItemTooltip.Active.ecm.energy_transfer,
		ItemTooltip.Active.ecm.duration,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.DisableWeapon ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.DisableWeaponFireRate ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.ecm.damage_mul,
		ItemTooltip.Active.ecm.energy_transfer,
		ItemTooltip.Active.ecm.duration,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "fire_rate_dec",
			spellPrototype = "spell",
			valField = "aura_param",
			negative = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.Blind ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.ecm.damage_mul,
		ItemTooltip.Active.ecm.energy_transfer,
		ItemTooltip.Active.ecm.duration,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration_on_target",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "vision_radius_mul_enemy",
			spellPrototype = "spell",
			valField = "aura_param",
			negative = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.HackWeapon ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.ecm.damage_mul,
		ItemTooltip.Active.ecm.energy_transfer,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.HackEntity ] =
{	
	tooltipParams = 
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "shield_heal",
			spellPrototype = "additional_spell",
			valField = {"aura_param", "duration",},
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.HackSystems ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyVampire ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.ecm.damage_mul,
		ItemTooltip.Active.ecm.energy_transfer,
		ItemTooltip.Active.ecm.duration,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "energy_transfer",
			spellPrototype = "spell",
			valField = { "aura_param", "duration", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.FocusedEMI ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.ecm.damage_mul,
		ItemTooltip.Active.ecm.energy_transfer,
		ItemTooltip.Active.ecm.duration,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "dmg_target_resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
			absValue = true,
		},
	},
}

ItemTooltips[ ItemSubtype.StasisGenerator ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.ecm.damage_mul,
		ItemTooltip.Active.ecm.energy_transfer,
		ItemTooltip.Active.ecm.duration,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.IonRay ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.ecm.damage_mul,
		ItemTooltip.Active.ecm.energy_transfer,
		ItemTooltip.Active.ecm.duration,
		ItemTooltip.Spell.range.target,
		--ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.WeaknessDetector] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "active_damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "fire_rate_add",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.CripplingClaws] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_dec",
			subPrototype = "projectile",
			valField = "spell_on_launch",
			formula = function( ... )
				local arg = { ... }
				local spell_on_cancel = Spell[ arg[1] ].spell_on_cancel
				return - Spell[ spell_on_cancel ].aura_param
			end,
			absValue = true,
			units = "percent",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			valField = "spell_on_launch",
			formula = function( ... )
				local arg = { ... }
				local spell_on_cancel = Spell[ arg[1] ].spell_on_cancel
				return Spell[ spell_on_cancel ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.AchillesPylum] = --Module_AchillesPylum_T3_Mk1
{
	tooltipParams =
	{
		ItemTooltip.Active.achilles_pylum.dps_emp,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ItemSubtype.Decay] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "weapon_damage_thermal_dps",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function(...)
				local arg = {...}
				return Spell[ arg[1] ].aura_param
			end,
			units = "damage_per_second",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function(...)
				local arg = {...}
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.HerculesOrb] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell_on_launch
		{
			name = "weapon_damage_thermal_dps",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = {"aura_param", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "aura_range",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
		-- spell
		{
			name = "crit_chance_add",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.StunningSpurt] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell_on_warp_end",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_warp_end",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.WolfPack] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp_plain,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Explosions.holder_ammo,
		--ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ammo",
			valField = "ammo",
			units = "units",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "damage",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "degree",
			valField = "dispersion",
			units = "units",
			format = "%3.2f",
			negative = true,
		},
		{
			name = "missile_per_target",
			valField = "max_projectiles_per_target",
			units = "units",
		},
		{
			name = "module_damage_to_host",
			valField = "damage_to_host",
			units = "units",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.DeimosFace] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell ai.Aura.DAMAGE_THERMAL_SCALED
		{
			name = "damage_min",
			spellPrototype = "spell",
			valField = { "aura_param" },
			units = "units_per_second",
		},
		{
			name = "damage_max",
			spellPrototype = "spell",
			valField = { "aura_param", "aura_param_add", "duration", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] + arg[2] * arg[3]
			end,
			units = "units_per_second",
		},
		
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "units",
		},
		-- additional_spell ai.Aura.RESIST_ALL,
		{
			name = "resist_add",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.DeimosWarp] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		-- module
		{
			name = "prep_time",
			valField = "prep_time",
			units = "second",
			negative = true,
		},
		{
			name = "accel_time",
			valField = "accel_time",
			units = "second",
		},
		{
			name = "maxspeed_mul",
			valField = "maxspeed_mul",
			units = "units",
		},
		-- spell
		{
			name = "resist_bonus",
			spellPrototype = "spell_on_warp",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_warp",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.Scream] =
{
	tooltipParams =
	{
		ItemTooltip.Special.scream.dps_emp,
		ItemTooltip.Special.scream.spell_size,
		ItemTooltip.Weapon.damage.emp,
		--ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "startRng",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "rngSpd",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range_add",
			units = "metre_per_second",
		},
		{
			name = "dmg",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.ShieldExplosion] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.Eagleeye ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "crit_chance_add",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Afterburner ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Invulnerability ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Vortex ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Active.vortex.duration,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "s_dmg",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "damage_per_second",
		},
		{
			name = "h_dmg",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * BlastWaveSignatureCoef[ ai.Signature.HUGE ]
			end,
			units = "damage_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.SmokeRocket ] =
{
	tooltipParams = {
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "cloud_size",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.NoiseSuppressor ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "post_duration",
			spellPrototype = "spell",
			valField = "deferred_duration",
			units = "second",
		},
		{
			name = "resist_add",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},
		{
			name = "resist_duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.KatanaRiposte ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "weapon_damage_emp_dps",
			spellPrototype = "spell",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		-- additional_spell
		{
			name = "shield_resist_add",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "duration2",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SupportReinforce ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.inner_additional,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "jump_range",
			spellPrototype = "deactivate_spell",
			valField = "teleport_range",
			units = "metre",
		},
		{
			name = "shell_self",
			spellPrototype = "additional_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			units = "units",
		},
		{
			name = "shell_ally",
			spellPrototype = "additional_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.KatanaSPush ] =
{
	tooltipParams =
	{
		--ItemTooltip.Spell.range.target,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "shield_charge",
			spellPrototype = "additional_spell",
			valField = "influence_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * RemoteHealSignatureCoef[ ai.Signature.MEDIUM ]
			end,
			units = "units",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = {"target_range", "aura_range",},
			formula = function( ... )
				local arg = { ... }
				return arg[1] + arg[2]
			end,
			units = "metre",
		},
		{
			name = "attraction_speed",
			spellPrototype = "spell",
			valField = "aura_param",
			absValue = true,
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype = "spell",
			valField = {"additional_auras[1].aura_param","additional_auras[1].period",},
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.HerculesGust ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "damage_to_shield",
			spellPrototype = "spell",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "percent",
		},
		-- deactivate_spell
		{
			name = "damage_to_hull",
			spellPrototype = "deactivate_spell",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "damage",
		},
	},
}

ItemTooltips[ ItemSubtype.PrometheusPot ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "weapon_damage_thermal_dps",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units_per_second",
		},
				{
			name = "range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.MacheteBox ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "cooldown_mul",
			spellPrototype = "spell",
			valField = "aura_param",
			negative = true,
			units = "percent",
		},
		{
			name = "energy_dec",
			spellPrototype = "spell",
			valField = { "additional_auras[1].aura_param", "additional_auras[1].period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.MacheteFury ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura_additional,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- module
		{
			name = "energy_irreducible",
			valField = "energy_cost_additional",
			units = "percent",
		},
		{
			name = "bonus_from_energy_cost",
			valField = "param_modificator",
			formula = function(...)
				local arg = {...}
				return arg[1] * 100
			end,
			units = "percent",
		},
		-- spell
		{
			name = "fire_rate_mul",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.FastShootAxe ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
	
		-- spell_on_equip
		{
			name = "DAMAGE_MOD",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		-- spell
		{
			name = "PROJECTILE_SPEED_MOD",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CommandCritAura ] =    --
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- passive mode
		{
			name = "critChanceAdd_passive_self",
			spellPrototype = "spell_on_equip",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "critChanceAdd_passive_ally",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		-- active mode
		{
			name = "critChanceAdd_active_self",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "critChanceAdd_active_ally",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CommandShieldResist ] =    -- Система «Эгида» / “Aegis” System
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "active_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "active_resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "active_duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "inactive_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "inactive_resist",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.CommandArmorResist ] =    -- Поляризатор покрытия / Coating Polarizer
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "active_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "active_resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "active_duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "inactive_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "inactive_resist",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.CommandWeaknessAnalyzer ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_range_ally",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "dmg_increase_ally",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration_ally",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "dmg_increase_self",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration_self",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.GravitationAnalyzer] =    -- Анализатор гравиполя / Gravi-scanner
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "active_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "active_speed_inc",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "active_duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "inactive_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "inactive_speed_inc",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ShieldHavoc] =    -- Разрушитель щитов
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "damage_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "period",
			spellPrototype = "spell",
			valField = "period",
			units = "second",
		},
		{
			name = "delay",
			spellPrototype = "spell",
			valField = "aura_execution_delay",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.CageTrapMine ] =
{
	tooltipParams = 
	{
		ItemTooltip.Entity.health,
		ItemTooltip.Entity.ttl,
		ItemTooltip.Entity.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			subPrototype = "activate_entity",
			spellPrototype = "spell_on_ttl",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.KatanaMineLayer ] =
{
	tooltipParams =
	{
		-- mine carier
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "field_radius",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].field_radius
			end,
			units = "metre",
		},
		{
			name = "max_mines",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_mines
			end,
			units = "units",
		},
		{
			name = "damage_thermal",
			subPrototype = "projectile",
			valField = "explosion_blast_wave",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].damage_thermal
			end,
			units = "damage",
		},
		{
			name = "speed_dec",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell
				return -Spell[ spell ].aura_param
			end,
			negative = true,
			units = "percent",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell
				return Spell[ spell ].duration
			end,
			absValue = true,
			units = "second",
		},
		{
			name = "minefield_time_to_live",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].time_to_live
			end,
			units = "second",
		},	
	},
}

ItemTooltips[ ItemSubtype.GuidedDronFoxSlow ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.dispersion,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.projectile_speed,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.entity_ttl,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_dec",
			subPrototype = "activate_entity",
			spellPrototype = "active_spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return - arg[1]
			end,
			negative = true,
			units = "percent",
		},
		{
			name = "aura_range",
			subPrototype = "activate_entity",
			spellPrototype = "active_spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.CatConcentration ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		-- additional_spell
		{
			name = "PROJECTILE_SPEED_MOD",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.FoxEscapeFromBattle ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		-- spell
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		-- additional_spell
		{
			name = "hull_heal",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.WebPropulsion ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "target_speed_minus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
			absValue = true,
		},
	},
}

ItemTooltips[ ItemSubtype.TargetPainter ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "target_resist_minus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.BoostBan ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.ProtectiveShield ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- неуязвимость
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		-- починка
		{
			name = "shield_regen_mul",
			spellPrototype = "additional_spell",
			valField = { "aura_param", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units_per_second"
		},
		{
			name = "repair_duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldLink ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.shield_link.swap_speed,
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "crit_bonus",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent"
		},
		{
			name = "heal_shield",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units"
		},
	},
}

ItemTooltips[ ItemSubtype.PairsShell ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.effect.shield_charge,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Spell.range.target_additional,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
			{
				name = "dmg_bonus",
				spellPrototype = "spell",
				valField = "spell_on_ttl", -- Bonus_damage
				formula = function( ... )
					local arg = { ... }
					return Spell[ arg[1] ].aura_param
				end,
				units = "percent",
			},
			{
				name = "ttl_bonus",
				spellPrototype = "spell",
				valField = "spell_on_ttl", -- Bonus_damage
				formula = function( ... )
					local arg = { ... }
					return Spell[ arg[1] ].duration
				end,
				units = "second",
			},
			{
				name = "ally_range",
				spellPrototype = "additional_spell",
				valField = "target_range",
				units = "metre",
			},
	},
}

ItemTooltips[ ItemSubtype.WarpGate ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "warp_distance",
			subPrototype = "activate_entity",
			valField = "warp_distance",
			units = "metre",
		},
		{
			name = "activate_entity_ttl",
			valField = "activate_entity_ttl",
			units = "second",
		},
		{
			name = "activate_entity_health",
			valField = "activate_entity_health",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.RepairRayLarge ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "hull_regen_add",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldRayLarge ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "shield_regen",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldEmitter ] = -- Массовый генератор щитов
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "passive_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "passive_regen",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "active_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "active_regen",
			spellPrototype = "spell",
			valField = {"aura_param", "duration"},
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "bonus_mod",
			valField = "param_modificator",
			units = "units",
		},
		{
			name = "base",
			valField = "energy_cost_additional",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyEmitter ] = -- Излучатель энергии
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "passive_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "passive_regen",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "active_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "active_regen",
			spellPrototype = "spell",
			valField = "influence_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.RemoteRepairDrones ] = -- Облако нанодронов
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "passive_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "passive_regen",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "active_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "active_regen",
			spellPrototype = "spell",
			valField = {"aura_param", "duration"},
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "bonus_mod",
			valField = "param_modificator",
			units = "units",
		},
		{
			name = "base",
			valField = "energy_cost_additional",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Screen ] =
{
	tooltipParams =
	{
		ItemTooltip.Entity.shield_charge,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "activate_entity_ttl",
			valField = "activate_entity_ttl",
			units = "second",
		},
		{
			name = "entity_range",
			valField = "spawn_offset",
			formula = function( ... )
				local arg = { ... }
				return arg[1].z
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SafeSniper  ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		-- spell
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		-- additional_spell
		{
			name = "next_shot_buster",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PowerInstabilityShot  ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		-- spell.aura
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "fire_rate_dec",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			negative = true,
			units = "percent",
		},
		-- spell.additional_auras
		{
			name = "target_cooldown_dec",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].additional_auras[1].aura_param
			end,
			--negative = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.FocusedRay  ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units_per_second",
		},
		{
			name = "active_damage",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * Spell[ arg[1] ].max_stacks
			end,
			units = "units_per_second",
		},
		{
			name = "resist_dec",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].period * 2
			end,
			units = "units_per_second",
		},
		{
			name = "resist_dec_max",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].period * 20
			end,
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.Multishot ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.multishot.damage_kinetic,
		ItemTooltip.Active.multishot.angle_of_view,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "max_charge_time",
			valField = "max_charge_time",
			units = "second",
		},
		{
			name = "max_targets",
			valField = "max_targets",
			units = "pieces",
		},
	},
}

ItemTooltips[ ItemSubtype.SniperDamageZone ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param / Spell[ arg[1] ].period
			end,
			units = "units_per_second",
		},
		{
			name = "aura_size",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "aura_duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.WeaponAmplifier ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "weapon_projectile_speed",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "max_range",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.HugeHullDevastator ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage_add",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return aura_param * ( duration / period + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EngineAmplifier ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "fire_rate_mul",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "fire_rate_mul_duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "speed_mul",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "speed_mul_duration",
			spellPrototype = "spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SniperDefender ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.dispersion,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.projectile_speed,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.entity_ttl,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "fire_rate_mul",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "resist_bonus",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.BarrelDistractionShot ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "target_fire_rate_dec",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			negative = true,
			units = "percent",
		},
		{
			name = "duration_on_target",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "fire_rate_mul",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "additional_auras[1].duration",
			negative = true,
			units = "second",
		},
		{
			name = "clones_ttl",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Flash ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Camouflage ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.SniperFastShot] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "charge_speedup",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.SniperOverload ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "dmg_increase",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ReverseThruster ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "jump_range",
			spellPrototype = "deactivate_spell",
			valField = "influence_param",
			units = "metre",
		},
		{
			name = "prepare_time",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "reduce_resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SmallReverseThruster  ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "jump_range",
			spellPrototype = "deactivate_spell",
			valField = "influence_param",
			units = "metre",
		},
		{
			name = "prepare_time",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "reduce_resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.AttrackerField ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.emp_large,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_pass",
			valField = "duration",
			units = "second",
		},
		{
			name = "spell_on_pass_radius",
			subPrototype = "projectile",
			valField = "spell_on_pass_radius",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceSqueezer ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		-- spell
		{
			name = "resist_add",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "mod_max",
			spellPrototype = "spell",
			valField = "mod_max",
			units = "none",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "mod_range",
			units = "metre",
		},
		-- deactivate_spell
		{
			name = "duration2",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
		-- additional_spell
		{
			name = "duration3",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Hook ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.hook.target_range,
		ItemTooltip.Active.hook.duration,
		ItemTooltip.Active.hook.wave_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		-- Spell.Hook_Huge
		{
			name = "weapon_damage_kinetic_dps",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param / Spell[ arg[1] ].period
			end,
			units = "damage_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.RocketRing ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "weapon_damage_emp",
			valField = "damage_emp",
			units = "damage",
		},
		{
			name = "max_rockets_per_target",
			subPrototype = "projectile",
			valField = "child_rockets.max_rockets_per_target",
			units = "pieces",
		},
	},
}

ItemTooltips[ ItemSubtype.EnhanceWeapon ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "energy_transfer",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].additional_auras[1].aura_param
				local duration = Spell[ arg[1] ].additional_auras[1].duration
				local period = Spell[ arg[1] ].additional_auras[1].period
				return aura_param * ( 1 + duration / period )
			end,
			units = "energy",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].additional_auras[1].duration
			end,
			units = "second",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "speed",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "metre_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.MissileReflector ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Active.missile_reflector.shield_heal,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams = 
	{
		{
			name = "target_extra_radius",
			spellPrototype = "spell",
			valField = "target_extra_radius",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.Immortality ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.PositionSwap ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.delay,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

}

ItemTooltips[ ItemSubtype.RamCharge ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.EnergyNullifier ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.target_charged,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.SafeAcceleration ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "speed_bust",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RocketRedirection ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "redirect_to_locked_target_amount",
			spellPrototype = "spell",
			valField = "redirect_to_locked_target_amount",
			units = "pieces",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldedTaunt ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "active_range",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},	
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "shield_charge",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param * RemoteHealSignatureCoef[ ai.Signature.LARGE ]
			end,
			units = "units",
		},
		{
			name = "shield_heal",
			spellPrototype = "additional_spell",
			valField = {"target_spell", "duration", "period"},
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				return aura_param * ( 1 +  arg[2] /  arg[3] )
			end,
			units = "units",
		},
		{
			name = "shield_heal_max",
			spellPrototype = "additional_spell",
			valField = {"target_spell", "duration", "period"},
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local max_stacks = Spell[ arg[1] ].max_stacks
				return aura_param * max_stacks * ( 1 + arg[2] /  arg[3] )
			end,
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.RestoringIons ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.restoring_ions.shield_charge,
		ItemTooltip.Active.restoring_ions.shield_ttl,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "shield_restore",
			spellPrototype = "spell",
			valField = "spell_on_ttl",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return aura_param * ( duration / period + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "spell_on_ttl",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.TractorBeam ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "metre_per_second",
		},
		{
			name = "dmg",
			spellPrototype = "spell",
			valField = { "additional_auras[1].aura_param", "additional_auras[1].period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( 1 / arg[2] )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldChargeLarge ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "shield_regen",
			spellPrototype = "spell",
			valField = { "aura_param", "duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "energy_regen",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "energy_per_second",
		},
		{
			name = "active_range",
			spellPrototype = "additional_spell",
			valField = "mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.ArmorChargeLarge ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "hull_regen_add",
			spellPrototype = "spell",
			valField = { "aura_param", "duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SmartBomb ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "damage_thermal",
			spellPrototype = "spell",
			valField = { "aura_param", "duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "resist_bonus",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "field_radius",
			spellPrototype = "additional_spell",
			valField = "mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.BoostJammerAOE ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "active_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "restriction_time",
			spellPrototype = "spell",
			valField = {"apply_interval","duration",},
			formula = function( ... )
				local arg = { ... }
				return arg[1]- arg[2]
			end,
			units = "second",
		},
		{
			name = "speed_dec",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			formula = function(...)
				local arg = {...}
				return - arg[1]
			end,
			negative = true,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.AOE_EMI ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "inactive_range",
			spellPrototype = "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "res_pass",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent_minus",
			absValue = true,
		},
		{
			name = "active_resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
			absValue = true,
		},
		{
			name = "restriction_time",
			spellPrototype = "spell",
			valField = {"apply_interval","duration",},
			formula = function( ... )
				local arg = { ... }
				return arg[1]- arg[2]
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.MissileDefence ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.duration,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "activation_range",
			valField = "activation_range",
			units = "metre",
		},
		{
			name = "beam_cooldown",
			valField = "beam_cooldown",
			units = "second",
			format = "%3.2f",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.ShelterField ] = -- Поле «Спектр»
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "stealth_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre"
		},
		{
			name = "stealth_duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second"
		},
		{
			name = "resist_bonus",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units"
		},
		{
			name = "resist_duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second"
		},
	},
}

ItemTooltips[ ItemSubtype.EMPAbsorb ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.CalibrationGrenade ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.damage.emp_large,
		ItemTooltip.Module.warhead.aura_range,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- CalibrationGrenade1
		{
			name = "target_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "shield_heal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local period = Spell[ arg[1] ].period
				return aura_param / period
			end,
			units = "units_per_second",
		},		
		-- CalibrationGrenade2
		{
			name = "reduce_heal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.Jump2Dude ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = {"aura_param","period",},
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "hull_heal_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		-- additional_spell
		{
			name = "jump_range",
			spellPrototype = "additional_spell",
			valField = "teleport_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.MatterFlow ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = {"aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "aura_extra_radius",
			spellPrototype = "spell",
			valField = "aura_extra_radius",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.Primary2HullRestore ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return aura_param * ( 1 + duration / period )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.DivineStorm ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "shield_heal",
			spellPrototype = { nil, "spell", "spell", },
			valField = { "param_modificator", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + arg[2] / arg[3] )
			end,
			units = "units_per_units",
		},
		{
			name = "weapon_damage_emp",
			spellPrototype = { nil, "additional_spell", "additional_spell", },
			valField = { "param_modificator", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( 1 + arg[2] / arg[3] )
			end,
			units = "units_per_units",
		},
	},
}

ItemTooltips[ ItemSubtype.PrimaryNanoRobots ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "weapon_damage_kinetic_dps",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell_on_cancel = Spell[ arg[1] ].spell_on_cancel
				return Spell[ spell_on_cancel ].target_range 
			end,
			units = "metre",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell_on_cancel = Spell[ arg[1] ].spell_on_cancel
				local aura_param = Spell[ spell_on_cancel ].aura_param
				local duration = Spell[ spell_on_cancel ].duration
				local period = Spell[ spell_on_cancel ].period
				return aura_param * ( 1 + duration / period )
			end,
			units = "units",
		},
		{
			name = "hull_heal_duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell_on_cancel = Spell[ arg[1] ].spell_on_cancel
				local aura_param = Spell[ spell_on_cancel ].aura_param
				local duration = Spell[ spell_on_cancel ].duration
				return duration
			end,
			units = "units",
		},
		{
			name = "hull_heal_self",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "target_mod_range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.CoupleSupport ] =
{
	tooltipParams = 
	{
		ItemTooltip.Active.couple_support.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell0
		{
			name = "resist_add",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "units",
		},
		-- spell1
		{
			name = "crit_chance_add",
			spellPrototype = "spell1",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.DivineSave ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "health",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		-- additional_spell
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "hull_heal",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].additional_auras[1].aura_param
				local duration = Spell[ arg[1] ].additional_auras[1].duration
				local period = Spell[ arg[1] ].additional_auras[1].period
				return aura_param * ( 1 + duration / period )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ParticleExplosion ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.emp_large,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "shield_heal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
		{
			name = "shield_heal_self",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = { "additional_auras[1].aura_param", "additional_auras[1].duration", "additional_auras[1].period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},		
		{
			name = "target_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.CivilianRepair ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.RepairDronesSmall ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "hull_regen_add",
			spellPrototype = "spell",
			valField = { "aura_param", "duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.RepairDronesMedium ] =
	ItemTooltips[ ItemSubtype.RepairDronesSmall ]

ItemTooltips[ ItemSubtype.RepairDronesLarge ] =
	ItemTooltips[ ItemSubtype.RepairDronesSmall ]

ItemTooltips[ ItemSubtype.RepairDronesSt ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "hull_regen_add",
			spellPrototype = "spell",
			valField = { "aura_param", "duration", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.HullDevastatorSt ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "hull_dec",
			spellPrototype = "spell",
			--valField = { "aura_param", "duration", "period", },
			--formula = function( ... )
			--	local arg = { ... }
			--	return arg[1] * ( arg[2] / arg[3] + 1 )
			--end,
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldDevastatorSt ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "shield_dec",
			spellPrototype = "spell",
			--valField = { "aura_param", "duration", "period", },
			--formula = function( ... )
			--	local arg = { ... }
			--	return arg[1] * ( arg[2] / arg[3] + 1 )
			--end,
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.NoRestoreEnergySt ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.NoCooldownSt ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.AdaptiveArmorBoost ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "hull_dmg_resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.AdaptiveShieldBoost ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "shield_dmg_resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "bonus_mod",
			valField = "param_modificator",
			units = "units",
		},
		{
			name = "base",
			valField = "energy_cost_additional",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.AdaptiveShieldBoostSpec ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "shield_dmg_resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "bonus_mod",
			valField = "param_modificator",
			units = "units",
		},
		{
			name = "base",
			valField = "energy_cost_additional",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldRestoreSmall ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "shield_regen",
			spellPrototype = "spell",
			valField = { "aura_param", "duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ShieldRestoreMedium ] =
	ItemTooltips[ ItemSubtype.ShieldRestoreSmall ]

ItemTooltips[ ItemSubtype.ShieldRestoreLarge ] =
	ItemTooltips[ ItemSubtype.ShieldRestoreSmall ]

ItemTooltips[ ItemSubtype.InfraredContermeasure ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "influence_param",
			spellPrototype = "spell",
			valField = "influence_param",
			units = "percent",
		},
				{
			name = "interference_range",
			valField = 400,
			units = "metre",
		},
		--[[
		{
			name = "target_range",
			spellPrototype = "additional_spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		]]
	},
}

ItemTooltips[ ItemSubtype.G2D2 ] = -- A1MA
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Module.duration,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "active_fire_rate",
			subPrototype = { "active_projectile", nil },
			valField = { "fire_rate_mul", "fire_rate" },
			formula = function( ... )
				local arg = { ... }
				return arg[2] * ( 1 + arg[1] )
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SpaceScaner ] =
{
	descriptionParams =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},
	},
	
}

ItemTooltips[ ItemSubtype.SpaceScan_Newbie ] =
{
	descriptionParams =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},
	},
	
}

ItemTooltips[ ItemSubtype.SwarmControl ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Active.swarm_control.range,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =	{
		{
			name = "min_hull_heal",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = { "aura_param", "aura_param_add", "duration", "period", },
			formula = function(...)
				local arg = { ... }
				return arg[1] + arg[2] * arg[3] / arg[4]
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "swarm_damage_add",
			valField = "activate_damage_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.IsotopeHarvester ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.range,
		ItemTooltip.Active.isotope_harvester.flight_speed,
		ItemTooltip.Active.isotope_harvester.flight_rot_speed,
		ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage_min",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2] * 0.3
			end,
			units = "units",
		},
		{
			name = "damage_max",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.DestrBeamDrone ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.destr_beam_drone.dps_thermal,
		ItemTooltip.Active.destr_beam_drone.damage_thermal,
		ItemTooltip.Active.destr_beam_drone.fire_rate,
		ItemTooltip.Active.destr_beam_drone.weapon_range,
		ItemTooltip.Active.destr_beam_drone.projectile_speed,
		ItemTooltip.Active.destr_beam_drone.health,
		ItemTooltip.Active.destr_beam_drone.ttl,
		ItemTooltip.Rocket.module.flight_speed,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "blast_dmg",
			valField = "damage_thermal",
			units = "damage",
		},
	},
}

ItemTooltips[ ItemSubtype.TachRay ] = -- Пиро-излучатель / Pyro Emitter
{
	tooltipParams =
	{
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Spell.range.weapon,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "spell_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype = "deactivate_spell",
			valField = { "aura_param", "duration", "period" },
			formula = function( ... )
				local arg = { ... }
				local dmg = arg[1] * ( arg[2] * ( 1 / arg[3] ) + 1 )
				return dmg
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Teleporter ] = -- Проектор червоточин / Wormhole projector
{
	tooltipParams =
	{
		ItemTooltip.Weapon.damage.emp_large,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.TurretPlasma ] = -- Плазменная турель / Plasma Turret
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			valField = "duration",
			units = "second",
		},
		{
			name = "active_damage",
			subPrototype = "active_projectile",
			valField = "damage_mul",
			--[[formula = function ( ... )
				local arg = { ... }
				return arg[1] * 100
			end,]]
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.TurretThermo ] = -- Бластерное орудие aka Бластерная турель / Blaster Turret
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "active_fire_rate",
			subPrototype = { "active_projectile", nil },
			valField = { "fire_rate_mul", "fire_rate" },
			formula = function( ... )
				local arg = { ... }
				return arg[2] * ( 1 + arg[1] )
			end,
			units = "units",
		},
		{
			name = "duration",
			valField = "duration",
			units = "second",
		},
		{
			name = "active_damage",
			subPrototype = "active_projectile",
			valField = "damage_mul",
			--[[formula = function ( ... )
				local arg = { ... }
				return arg[1] * 100
			end,]]
			units = "percent",
		},
		{
			name = "active_blast_range",
			subPrototype = "active_projectile",
			valField = "explosion_blast_wave", -- = "Blastwave_DestroyerTurretA"
			formula = function ( ... )
				local arg = { ... }
				return Def[ arg[1] ].blast_maxDistance
			end,
			units = "metre",
		},
		{
			name = "speed_dec",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent_minus",
		},
		{
			name = "duration_on_target",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PushRay ] = -- Отталкивающий луч / Repelling Beam
{
	tooltipParams =
	{
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Spell.range.weapon,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "push_speed",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			formula = function( ... )
				local arg = { ... }
				return math.abs( arg[1] )
			end,
			units = "metre_per_second",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.GravityAnomaly ] = -- Гравитационная линза / Gravitational Lens
{
	tooltipParams =
	{
		ItemTooltip.Spell.delay,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "range",
			spellPrototype = "deactivate_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "speed",
			spellPrototype = "deactivate_spell",
			valField = "aura_param",
			units = "metre_per_second",
		},
		{
			name = "dmg_range",
			spellPrototype = "deactivate_spell",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
		{
			name = "dmg",
			spellPrototype = "deactivate_spell",
			valField = { "additional_auras[1].aura_param", "additional_auras[1].period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 1 / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "destr_dmg",
			spellPrototype = "deactivate_spell",
			valField = { "additional_auras[2].aura_param", "additional_auras[2].period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 1 / arg[2] * BlastWaveSignatureCoef[ ai.Signature.HUGE ]
			end,
			units = "units",
		},
		{
			name = "death_dmg",
			spellPrototype = "deactivate_spell",
			valField = { "additional_auras[3].aura_param", "additional_auras[3].period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 1 / arg[2] * BlastWaveSignatureCoef[ ai.Signature.HUGE ]
			end,
			units = "units",
		},
		{
			name = "duration_on_target",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
			
		},
	},
}

ItemTooltips[ ItemSubtype.DestrMovementRestrictor ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage_bullet",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "target_range",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "min_speed_percent",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].min_speed_percent
			end,
			units = "percent",
		},
		{
			name = "damage_field",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				local aura_param_add = Spell[ arg[1] ].aura_param_add
				local period = Spell[ arg[1] ].period
				return aura_param_add / period
			end,
			units = "units_per_second",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SectorShield ] = -- Секторная защита / Стационарное поле
{
	descriptionParams =
	{
		{
			name = "health",
			valField = "health",
			units = "units",
		},
		{
			name = "ttl",
			valField = "ttl",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.RocketSilo ] = -- Ракетный залп aka Пусковая установка «Буря» / "'Tempest' Launcher"
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal_plain,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.module.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Explosions.holder_ammo,
		ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ammo",
			valField = "ammo",
			units = "units",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "damage",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "degree",
			valField = "dispersion",
			units = "units",
			format = "%3.2f",
			negative = true,
		},
		{
			name = "missile_per_target",
			valField = "max_projectiles_per_target",
			units = "units",
		},
		{
			name = "module_damage_to_host",
			valField = "damage_to_host",
			units = "units",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.Javelin ] =    -- Фотонный излучатель /  Photon Emitter
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp_plain,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.module.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "cld_rng",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",	-- Javelin_Weaknes
			units = "metre",
		},
		{
			name = "res_dec",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",	-- Javelin_Weaknes
			units = "units",
		},
		{
			name = "cld_dur",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",		-- Javelin_Weaknes
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.AdaptiveBigShieldBoost ] = -- Мультифазовый щит
{
	tooltipParams =
	{
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "res_pass",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "res_act",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.DestrDeadlyTrap ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.dist_mine.damage_thermal,
		ItemTooltip.Active.dist_mine.damage_range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.module.flight_speed,
		ItemTooltip.Explosions.holder_ammo,
		ItemTooltip.Module.charge_cooldown,
		ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "detector_range",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].radius
			end,
			units = "metre",
		},
		{
			name = "mine_ttl",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].ttl
			end,
			units = "second",
		},
	},
}

-- alien BattleStation
ItemTooltips[ ItemSubtype.GreenBattleStation] = 
{
	tooltipParams = 
	{
		ItemTooltip.Active.battle_station.health_upgraded,
		ItemTooltip.Active.battle_station.heal_cost,
		ItemTooltip.Active.battle_station.heal_speed,
		ItemTooltip.Active.battle_station.owner_distance,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "autonomy_ttl",
			subPrototype = "station",
			valField = "orphan_time",
			units = "second",
		},
		-- upgrades[1]
		{
			name = "default_dps",
			subPrototype = "station",
			valField = "upgrades[1].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				local dmg = Def[ arg[1] ].damage_thermal
				local fr = Def[ arg[1] ].fire_rate
				return dmg * fr / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "default_range",
			subPrototype = "station",
			valField = "upgrades[1].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_range
			end,
			units = "metre",
		},
		-- upgrades[2]
		{
			name = "s1m1_dps",
			subPrototype = "station",
			valField = "upgrades[2].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				local dmg = Def[ arg[1] ].damage_kinetic
				local fr = Def[ arg[1] ].fire_rate
				return dmg * fr / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "s1m1_range",
			subPrototype = "station",
			valField = "upgrades[2].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_range
			end,
			units = "metre",
		},
		{
			name = "s1m2_dps",
			subPrototype = "station",
			valField = "upgrades[2].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				local dmg = Def[ arg[1] ].damage_emp
				local fr = Def[ arg[1] ].fire_rate
				return dmg * fr / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "s1m2_range",
			subPrototype = "station",
			valField = "upgrades[2].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_range
			end,
			units = "metre",
		},
		{
			name = "s1m3_dps",
			subPrototype = "station",
			valField = "upgrades[2].modifications[3].def",
			formula = function( ... )
				local arg = { ... }
				local dmg = Def[ arg[1] ].damage_thermal
				local fr = Def[ arg[1] ].fire_rate
				return dmg * fr / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "s1m3_range",
			subPrototype = "station",
			valField = "upgrades[2].modifications[3].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_range
			end,
			units = "metre",
		},
		{
			name = "s1m4_dps",
			subPrototype = "station",
			valField = "upgrades[2].modifications[4].def",
			formula = function( ... )
				local arg = { ... }
				local dmg = Def[ arg[1] ].damage_emp
				local fr = Def[ arg[1] ].fire_rate
				return dmg * fr / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "s1m4_range",
			subPrototype = "station",
			valField = "upgrades[2].modifications[4].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_range
			end,
			units = "metre",
		},
		-- upgrades[3]
		{
			name = "s2m1_dps",
			subPrototype = "station",
			valField = "upgrades[3].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				local dmg = Def[ arg[1] ].damage_emp
				local fr = Def[ arg[1] ].fire_rate
				return dmg * fr / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "s2m1_range",
			subPrototype = "station",
			valField = "upgrades[3].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_range
			end,
			units = "metre",
		},
		{
			name = "s2m2_duration",
			subPrototype = "station",
			valField = "upgrades[3].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				local spell_middle = Def[ arg[1] ].spell_on_equip
				return Spell[ spell_middle ].aura_param
			end,
			units = "second",
		},
		{
			name = "s2m3_resist",
			subPrototype = "station",
			valField = "upgrades[3].modifications[3].def",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell_on_equip
				return Spell[ spell ].aura_param
			end,
			units = "units",
		},
		-- upgrades[4]
		{
			name = "s3_range",
			subPrototype = "station",
			valField = "upgrades[4].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell_on_equip
				return Spell[ spell ].aura_range
			end,
			units = "metre",
		},
		{
			name = "s3m1_speed_dec",
			subPrototype = "station",
			valField = "upgrades[4].modifications[1].def",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell_on_equip
				return Spell[ spell ].aura_param
			end,
			units = "percent_minus",
		},
		{
			name = "s3m2_heal_hull",
			subPrototype = "station",
			valField = "upgrades[4].modifications[2].def",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell_on_equip
				return Spell[ spell ].aura_param
			end,
			units = "units_per_second",
		},
		{
			name = "s3m3_heal_shield",
			subPrototype = "station",
			valField = "upgrades[4].modifications[3].def",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell_on_equip
				return Spell[ spell ].aura_param
			end,
			units = "units_per_second",
		},
		{
			name = "s3m4_energy_regen",
			subPrototype = "station",
			valField = "upgrades[4].modifications[4].def",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell_on_equip
				return Spell[ spell ].aura_param
			end,
			units = "units_per_second",
		},
		{
			name = "s3m5",
			subPrototype = "station",
			valField = "upgrades[4].modifications[5].def",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell_on_equip
				return Spell[ spell ].aura_param
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.LandingPlatform ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Drone.drone.damage_emp,
		ItemTooltip.Drone.drone_weapon.fire_rate,
		ItemTooltip.Drone.drone_weapon.range,
		ItemTooltip.Drone.drone.max_speed,
		ItemTooltip.Drone.drone.max_rot_speed,
		ItemTooltip.Drone.drone.health,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams =
	{
		{
			name = "drone_prodaction_time",
			valField = "drone_prodaction_time",
			units = "second",
			negative = true,
		},
		{
			name = "drone_control_range",
			valField = "drone_control_range",
			units = "metre",
		},
		-- spell_on_landed_ship
		{
			name = "guest_hull_heal",
			spellPrototype = "spell_on_landed_ship",
			valField = {"aura_param", "period"},
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "guest_weapon_range_mul",
			spellPrototype = "spell_on_landed_ship",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},
		{
			name = "guest_weapon_damage_mul",
			spellPrototype = "spell_on_landed_ship",
			valField = "additional_auras[3].aura_param",
			units = "percent",
		},
		{
			name = "resist_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		-- spell_on_parent
		{
			name = "shield_heal",
			spellPrototype = "spell_on_parent",
			valField = "aura_param",
			units = "units_per_second",
		},
		{
			name = "energy_regen",
			spellPrototype = "spell_on_parent",
			valField = "additional_auras[1].aura_param",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.HullResistStation ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Active.hull_res_station.health,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		-- spell
		{
			name = "hull_lost_critical",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return 1 - arg[1]
			end,
			units = "percent",
		},
		-- spell.additional_auras
		{
			name = "hull_dmg_resist",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
		{
			name = "resist_range",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
		{
			name = "resist_duration",
			spellPrototype = "spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		-- spell.target_spell
		{
			name = "emergency_hull_restore",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return aura_param * ( 1 + duration / period )
			end,
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.HullTransfer ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell HULL_TRANSFER
		{
			name = "hull_dec",
			spellPrototype = "spell",
			valField = { "aura_param", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "transfer_coef",
			spellPrototype = "spell",
			valField = "transfer_coef",
			units = "none",
		},
		{
			name = "speed_dec",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			formula = function(...)
				local arg = {...}
				return - arg[1]
			end,
			units = "percent",
		},
		-- spell_on_equip_inactive HEAL_HULL_PERIODIC
		{
			name = "hull_heal",
			spellPrototype = "spell_on_equip_inactive",
			valField = "aura_param",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenGravyPush ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		-- spell
		{
			name = "weapon_damage_kinetic",
			spellPrototype = "spell",
			valField = { "aura_param", "duration", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] * ( arg[2] / arg[3] + 1 )
			end,
			units = "units",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "attraction_speed",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			absValue = true,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.EmergencyTeleporter ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		-- spell
		{
			name = "emergency_level",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
			negative = true,
		},
		{
			name = "speed_bust",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "restriction_time",
			spellPrototype = "spell",
			valField = "additional_auras[1].apply_interval",
			units = "units",
		},
	}
}

ItemTooltips[ ItemSubtype.Overshield ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "shield_charge_ally",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local spell_on_cancel = Spell[ arg[1] ].spell_on_cancel
				return Spell[ spell_on_cancel ].influence_param
			end,
			units = "units",
			large = true,
		},
		{
			name = "shield_charge_self",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			units = "units",
			large = true,
		},
	},
}

ItemTooltips[ ItemSubtype.Companion ] = -- #0066724
{
	tooltipParams =
	{
		ItemTooltip.Drone.damage.emp,
		ItemTooltip.Active.crystal_cone.projectile_speed,
		ItemTooltip.Active.companion.health,
		ItemTooltip.Active.companion.control_range,
		ItemTooltip.Active.companion.max_speed,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_bust",
			spellPrototype = "spell_when_module",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "speed_dec",
			subPrototype = "activate_entity",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
		},
		{
			name = "rot_speed_mul",
			subPrototype = "activate_entity",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent_minus",
		},
	},
}

ItemTooltips[ ItemSubtype.Return ] = -- #0062313
{
	tooltipParams =
	{
		ItemTooltip.Active.return_module.health,
		ItemTooltip.Active.return_module.ttl,
		ItemTooltip.Active.return_module.owner_distance,
		ItemTooltip.Active.return_module.prepare_time,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
			
		},
		{
			name = "heal",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units_per_second",
		},
		{
			name = "zone_size",
			subPrototype = "activate_entity",
			valField = "teleport_radius",
			units = "metre",
		},
	},
}

local function summ(n)
    if (n <= 0) then
        return 0
    else
        return n + summ(n - 1)
    end
end

ItemTooltips[ ItemSubtype.GreenInvulnerability ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			spellPrototype = "additional_spell",
			valField = { "aura_param", "aura_param_add", "period", "duration" },
			formula = function( ... )
				local arg = { ... }
				local ticks = math.ceil( arg[4] / arg[3] ) + 1
				local base = arg[1] * ticks
				local add = arg[2] * arg[3] * summ(ticks-1)				
				return base + add
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.FuelEmissions ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "period",
			spellPrototype = "spell",
			valField = "period",
			units = "second",
		},
		{
			name = "cloud_size",
			spellPrototype = "spell",
			valField = "target_spell",
			formula =
			{
				function( ... )
					local arg = { ... }
					return Spell[ arg[1] ].aura_range
				end,
				function( ... )
					local arg = { ... }
					local aura_range = Spell[ arg[1] ].aura_range
					local aura_range_add = Spell[ arg[1] ].aura_range_add
					local duration = Spell[ arg[1] ].duration
					local period = Spell[ arg[1] ].period
					return aura_range_add * ( 1 + duration / period )
				end,
			},
			concat = "%s - %s",
			units = "metre",
		},
		{
			name = "cloud_dmg",
			spellPrototype = "spell",
			valField = "target_spell",
			formula =
			{
				function( ... )
					local arg = { ... }
					local aura_param = Spell[ arg[1] ].aura_param
					local aura_param_add = Spell[ arg[1] ].aura_param_add
					local duration = Spell[ arg[1] ].duration
					local period = Spell[ arg[1] ].period
					return ( aura_param + aura_param_add * duration / period ) / period
				end,
				function( ... )
					local arg = { ... }
					local aura_param = Spell[ arg[1] ].aura_param
					local period = Spell[ arg[1] ].period
					return aura_param / period
				end,
			},
			concat = "%s - %s",
			units = "units_per_second",
		},
		{
			name = "cloud_ttl",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			concat = "%s - %s",
			units = "units_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.CrystalConeDrone ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.crystal_cone.dps_thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Active.crystal_cone.fire_rate,
		ItemTooltip.Active.crystal_cone.projectile_speed,
		ItemTooltip.Active.crystal_cone.weapon_range,
		ItemTooltip.Active.crystal_cone.max_aim_rot_speed,
		ItemTooltip.Active.crystal_cone.dispersion,
		ItemTooltip.Active.crystal_cone.ttl,
		ItemTooltip.Drone.health,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "last_chain_damage",
			subPrototype = "activate_entity",
			valField = "primary_weapon",
			formula = function( ... )
				local arg = { ... }
				local projectile = Def[ arg[1] ].projectile
				local chaing_damage = Def[ projectile ].chaing_damage
				return chaing_damage[ #chaing_damage ]
			end,
			units = "percent",
		},
		{
			name = "chain_lenght",
			subPrototype = "activate_entity",
			valField = "primary_weapon",
			formula = function( ... )
				local arg = { ... }
				local projectile = Def[ arg[1] ].projectile
				local chaing_damage = Def[ projectile ].chaing_damage
				return #chaing_damage
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.CrystalHamstring ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_size",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "aura_param",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				return 1 / aura_param
			end,
			units = "percent",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.MissileReload ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ ItemSubtype.EnergyReflector ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.energy_reflector.shield_dmg_resist,
		ItemTooltip.Active.energy_reflector.damage_thermal_min,
		ItemTooltip.Spell.range.aura_additional,
		ItemTooltip.Spell.duration.additional,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "energy_cost_additional",
			valField = "energy_cost_additional",
			units = "percent",
		},
		{
			name = "param_modificator",
			valField = "param_modificator",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.CrystalRageMode ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.additional,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "dmg_increase",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CageJump ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.delay,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "jump_range",
			spellPrototype = "deactivate_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].influence_param
			end,
			absValue = true,
			units = "metre",
		},
		{
			name = "entity_health",
			spellPrototype = "deactivate_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				local def = Spell[ arg[1] ].aura_holder_def
				return Def[ def ].health
			end,
			units = "units",
		},
		{
			name = "field_radius",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "ttl",
			spellPrototype = "deactivate_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.DevastatorGun ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams = 
	{
		-- Луч
		
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "dmg",
			spellPrototype = "spell",
			valField = { "aura_param", "period" },
			formula = function( ... )
				local arg = { ... }
				local dmg = arg[1] * ( ( 1 / arg[2] ) + 1 )
				return dmg
			end,
			units = "damage_per_second",
		},
		{
			name = "turret_dmg_mul",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param_mul",
			units = "units",
		},
		
		-- Облако
		
		{
			name = "cloud_size",
			spellPrototype = "deactivate_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[arg[1]].aura_range
			end,
			units = "metre",
		},
		{
			name = "cloud_dmg_min",
			spellPrototype = "deactivate_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local param = Spell[arg[1]].aura_param
				local period = Spell[arg[1]].period
				local dmg = param * ( ( 1 / period ) )
				return dmg
			end,
			units = "damage_per_second",
		},
		{
			name = "cloud_dmg_max",
			spellPrototype = "deactivate_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local param = Spell[arg[1]].aura_param
				local param_add = Spell[arg[1]].aura_param_add
				local period = Spell[arg[1]].period
				local duration = Spell[arg[1]].duration
				local dmg = ( param + param_add * duration ) / period
				return dmg
			end,
			units = "damage_per_second",
		},
		{
			name = "cloud_duration",
			spellPrototype = "deactivate_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.BFG ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.module.flight_speed,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Rocket.projectile.detonate_on_distance,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams = 
	{
		-- облако

		{
			name = "cloud_size",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},

		{
			name = "cloud_time",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},

		{
			name = "cloud_max",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = { "aura_range", "aura_range_add", "duration" },
			formula = function( ... )
				local arg = { ... }
				local max = arg[1] + arg[2] * arg[3]
				return max
			end,
			units = "metre",
		},

		{
			name = "cloud_dmg",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = { "aura_param", "period" },
			formula = function( ... )
				local arg = { ... }
				local dmg = arg[1] * ( 1 / arg[2] )
				return dmg
			end,
			units = "damage_per_second",
		},

		{
			name = "cloud_heal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = { "additional_auras[1].aura_param", 
					"additional_auras[1].period" },
			formula = function( ... )
				local arg = { ... }
				local dmg = arg[1] * ( 1 / arg[2] )
				return dmg
			end,
			units = "damage_per_second",
		},
		
		-- ракеты

		{
			name = "warheads_count",
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local sum = 0
				for m,t in pairs( arg[1].scheme ) do
					sum = sum + t.amount
				end
				return sum
			end,
			units = "pieces",
		},
		
		{
			name = "warheads_speed",
			subPrototype = "projectile",
			valField = "child_rockets.rocket",
			formula = function( ... )
				local arg = { ... }
				local rocket = Def[ arg[1] ]
				return rocket.speed
			end,
			units = "metre_per_second",
		},
		
		{
			name = "warheads_distance",
			subPrototype = "projectile",
			valField = "child_rockets.rocket",
			formula = function( ... )
				local arg = { ... }
				local rocket = Def[ arg[1] ]
				return rocket.max_range
			end,
			units = "metre",
		},

	},
}

ItemTooltips[ItemSubtype.AprilDrone] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.drone.dps_thermal,
		ItemTooltip.Drone.drone.damage_thermal,
		ItemTooltip.Drone.drone.fire_rate,
		ItemTooltip.Drone.drone.projectile_speed,
		ItemTooltip.Drone.drone.max_speed,
		ItemTooltip.Drone.drone.max_rot_speed,
		ItemTooltip.Drone.drone.health,
		ItemTooltip.Drone.drone.ttl,
		ItemTooltip.Module.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ttl",
			subPrototype = "parcel",
			valField = "ttl",
			units = "second",
		},
		{
			name = "heal_duration",
			subPrototype = "parcel",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "heal_per_second",
			subPrototype = "parcel",
			spellPrototype = "spell",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.CookCannon ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal_plain,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.module.flight_speed,
		--ItemTooltip.Rocket.projectile.flight_rot_speed,
		--ItemTooltip.Explosions.holder_ammo,
		ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ammo",
			valField = "ammo",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyLancePrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "lance_length",
			valField = "damage_box_size.z",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "metre",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "units",
		},
		{
			name = "work_time",
			valField = "work_time",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaWebPrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "weapon_damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "min_speed_percent",
			spellPrototype = "spell",
			valField = "additional_auras[1].min_speed_percent",
			units = "percent",
		},
		{
			name = "additionalSpell_damage",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "damage_per_second",
		},
		{
			name = "vampire_coef",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.CamouflagePrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.FakeShipsPrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "clones_power",
			valField = "clones_power",
			units = "percent",
		},
		{
			name = "clones_ttl",
			valField = "clones_ttl",
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PulsarPrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "damage_thermal",
			spellPrototype = "spell",
			valField = { "aura_param", "duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.WolfPackPrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal_plain,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Explosions.holder_ammo,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ammo",
			valField = "ammo",
			units = "units",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "damage",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "degree",
			valField = "dispersion",
			units = "units",
			format = "%3.2f",
			negative = true,
		},
		{
			name = "missile_per_target",
			valField = "max_projectiles_per_target",
			units = "units",
		},
		{
			name = "module_damage_to_host",
			valField = "damage_to_host",
			units = "units",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.CloakingPrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "damage_thermal",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.aura_param / spell.period
			end,
			units = "damage_per_second",
		},
		{
			name = "aura_range",
			spellPrototype = "additional_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.aura_range
			end,
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.MultiPortalPrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "teleport_range_min",
			valField = "teleport_range_min",
			units = "metre",
		},
		{
			name = "teleport_gate_ttl",
			valField = "teleport_gate_ttl",
			units = "second",
		},
		{
			name = "teleport_cooldown",
			subPrototype = "gate",
			valField = "teleport_cooldown",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.StasisGunPrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.detonate_on_distance,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams = 
	{
		{
			name = "stasis_range",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "stun_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "stun_duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.TRayPrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.weapon,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			spellPrototype = { "spell", "spell", "spell", "charge_spell_on_damage", "charge_spell_on_damage" },
			valField = { "aura_param", "duration", "period", "aura_param", "max_stacks" },
			formula = {
				function( ... )
					local arg = { ... }
					local dmg = arg[1] * ( arg[2] * ( 1 / arg[3] ) + 1 )
					return dmg
				end,
				function( ... )
					local arg = { ... }
					local dmg = arg[1] * ( arg[2] * ( 1 / arg[3] ) + 1 )
					return dmg * ( 1 + arg[4] * arg[5] )
				end,
			},
			concat = "%s - %s",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "charge_damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "charge_mul",
			spellPrototype = "charge_spell_on_damage",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "charge_duration",
			spellPrototype = "charge_spell_on_damage",
			valField = "duration",
			units = "second",
		},
		{
			name = "charge_max_stacks",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.HackWeaponPrec ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.range.target,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EntityRayPrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.weapon,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "generator_health",
			spellPrototype = "spell",
			valField = "aura_holder_def",
			formula = function( ... )
				local arg = { ... }
				local generator = Def[ arg[1] ]
				return generator.health
			end,
			units = "units",
		},
		{
			name = "ray_damage",
			spellPrototype = "spell",
			valField = "holder_spell_in_the_end",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				local dmg = spell.aura_param * ( spell.duration * ( 1 / spell.period ) + 1 )
				return dmg
			end,
			units = "units",
		},
		{
			name = "ray_duration",
			spellPrototype = "spell",
			valField = "holder_spell_in_the_end",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.duration
			end,
			units = "second",
		},
		{
			name = "gen_death_damage",
			spellPrototype = "spell",
			valField = "holder_spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				local dmg = spell.aura_param * ( spell.duration * ( 1 / spell.period ) + 1 )
				return dmg
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.RocketSiloPrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal_plain,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Explosions.holder_ammo,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ammo",
			valField = "ammo",
			units = "units",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "damage",
		},
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "degree",
			valField = "dispersion",
			units = "units",
			format = "%3.2f",
			negative = true,
		},
		{
			name = "missile_per_target",
			valField = "max_projectiles_per_target",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.GravyGeneratorPrec ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.delay,
		ItemTooltip.Spell.range.aura,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "pull_range",
			spellPrototype = "deactivate_spell",
			valField = { "aura_range", "aura_range_add", "duration", },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1]
				end,
				function( ... )
					local arg = { ... }
					return arg[1] + arg[2] * arg[3]
				end,
			},
			concat = "%s - %s",
			units = "metre",
		},
		{
			name = "pull_speed",
			spellPrototype = "deactivate_spell",
			valField = { "aura_param", "aura_param_add", "duration", },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1]
				end,
				function( ... )
					local arg = { ... }
					return arg[1] + arg[2] * arg[3]
				end,
			},
			concat = "%s - %s",
			units = "metre_per_second",
		},
		{
			name = "pull_dps",
			spellPrototype = "deactivate_spell",
			valField = { "additional_auras[1].aura_param", "additional_auras[1].period", "additional_auras[1].aura_param_add", "additional_auras[1].duration" },
			formula = {
				function( ... )
					local arg = { ... }
					return arg[1] / arg[2]
				end,
				function( ... )
					local arg = { ... }
					return ( arg[1] + arg[3] * arg[4] ) / arg[2]
				end,
			},
			concat = "%s - %s",
			units = "damage_per_second",
		},
		{
			name = "pull_duration",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "push_range",
			spellPrototype = "deactivate_spell",
			valField = "holder_spell_in_the_end",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.aura_range
			end,
			units = "metre",
		},
		{
			name = "push_speed",
			spellPrototype = "deactivate_spell",
			valField = "holder_spell_in_the_end",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.aura_param
			end,
			units = "metre_per_second",
		},
		{
			name = "push_dps",
			spellPrototype = "deactivate_spell",
			valField = "holder_spell_in_the_end",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ].additional_auras[1]
				return spell.aura_param * spell.period
			end,
			units = "damage_per_second",
		},
		{
			name = "push_duration",
			spellPrototype = "deactivate_spell",
			valField = "holder_spell_in_the_end",
			formula = function( ... )
				local arg = { ... }
				local spell = Spell[ arg[1] ]
				return spell.duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SphereShield ] =
{
	tooltipParams =
	{
		ItemTooltip.Entity.shield_charge,
		ItemTooltip.Entity.entity_ttl,	
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_bust",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "resist_bust",
			subPrototype = "activate_entity",
			valField = "children[1].def",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[1] ]
				local spell = Spell[ def.spell_on_spawn ]
				return spell.aura_param
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PortalGate ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "teleport_range_min",
			valField = "teleport_range_min",
			units = "metre",
		},
		{
			name = "teleport_range_max",
			valField = "teleport_range_max",
			units = "metre",
		},
		{
			name = "teleport_gate_ttl",
			valField = "teleport_gate_ttl",
			units = "second",
		},
		{
			name = "teleport_cooldown",
			subPrototype = "gate",
			valField = "teleport_cooldown",
			units = "second",
		},
		{
			name = "hide_duration",
			spellPrototype = "installation_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.DistStation ] =
{
	tooltipParams =
	{
		ItemTooltip.Rocket.module.flight_speed,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Active.diststation.ttl,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "blast_dmg",
			valField = "damage_thermal",
			units = "damage",
		},
		{
			name = "heal_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "hull_heal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = { "aura_param", "period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "shield_heal",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = { "additional_auras[1].aura_param", "additional_auras[1].period" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
	},
}

ItemTooltips[ItemSubtype.FreezingSniper] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "charge_slowdown",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return - Spell[ arg[1] ].aura_param
			end,
			units = "percent",
			negative = true,
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "spell_duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.ReserveShipSwitch] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
}

ItemTooltips[ItemSubtype.ReserveShipOrder] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "target_range",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.ActiveTimeBoost] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.work_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.RavenGun ] = -- Установка EMR-3 / Raven Gun
{
	tooltipParams =
	{
		ItemTooltip.Weapon.raven_gun.dps_emp,
		ItemTooltip.Weapon.damage.emp_min_max_charge,
		ItemTooltip.Weapon.raven_gun.fire_rate,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
		ItemTooltip.Weapon.charge,
	},
	descriptionParams =
	{
		{
			name = "duration",
			valField = "charge_levels[3].time",
			formula = function( ... )
				local arg = { ... }
				return arg[1] + 1
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.HarpoonGun ] = -- Гарпун на Raven
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.Active.harpoon_gun.activate_entity_ttl,
		ItemTooltip.Active.harpoon_gun.range,
		ItemTooltip.Active.harpoon_gun.projectile_speed,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "duration",
			valField = "activate_entity_ttl",
			units = "second",
		},
		{
			name = "aura_param",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				local cast_spell = Spell[ arg[1] ].spells[1]
				local spell = Spell[ cast_spell ]
				return spell.aura_param * (spell.duration / spell.period + 1)
			end,
			units = "units",
		},
		{
			name = "aura_param_huge",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				local cast_spell = Spell[ arg[1] ].spells[2]
				local spell = Spell[ cast_spell ]
				return spell.aura_param * (spell.duration / spell.period + 1)
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.BackShieldModule ] = -- Подвижный щит Raven
{
	tooltipParams =
	{
		ItemTooltip.Entity.activate_entity_ttl,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams = 
	{
		{
			name = "shield_resist_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "shield_resist_summary",
			spellPrototype = { "spell", "spell_on_equip", },
			valField = { "aura_param", "aura_param", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] - arg[2]
			end,
			units = "units",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.MassPlasmaWeb ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "weapon_damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "damage_per_second",
		},
		{
			name = "target_range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.TimeBoostPlusDamage ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.work_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.ZmHumansHeal] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = { "aura_param", "duration", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.ZmAliensPulsar] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "damage_thermal",
			spellPrototype = "spell",
			valField = { "aura_param", "duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ItemSubtype.ZmHumansSpeedUp] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.ZmAliensSlowdown] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PlagueDoctor ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},
		{
			name = "damage_peiodic",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local TDmgSpell = Spell[ arg[1] ].spell_on_cancel
				return Spell[ TDmgSpell ].aura_param			
			end,
			units = "units",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "contagination_range",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local TDmgSpell = Spell[ arg[1] ].spell_on_cancel
				local ContSpell = Spell[ TDmgSpell ].spell_on_cancel
				return Spell[ ContSpell ].target_range
				
			end,
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},
	},
}


ItemTooltips[ ItemSubtype.IceShield ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "maneuver_dec",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent_minus",
		},
		{
			name = "speed_dec",
			spellPrototype = "spell",
			valField = "spells[3]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent_minus",
		},
		{
			name = "work_time",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "taunt_radius",
			spellPrototype = "additional_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "speed_inc_time",
			spellPrototype = "spell",
			valField = "spells[4]",
			formula = function( ... )
				local arg = { ... }
				local freeze_spell = Spell[ arg[1] ]
				local speed_spell = Spell[ freeze_spell.spell_on_cancel ]
				return speed_spell.duration
			end,
			units = "second",
		},
				{
			name = "speed_inc_power",
			spellPrototype = "spell",
			valField = "spells[4]",
			formula = function( ... )
				local arg = { ... }
				local freeze_spell = Spell[ arg[1] ]
				local speed_spell = Spell[ freeze_spell.spell_on_cancel ]
				return speed_spell.aura_param
			end,
			units = "percent",
		},
		{
			name = "shield_resist_add",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.DoubleEmpShotgun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "speed_dec",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			units = "percent_minus",
		},
		{
			name = "crittime",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
		{
			name = "critstacks",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "max_stacks",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.TornadoGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "damage_inc",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param",},
			formula = function( ... )
				local arg = { ... }
				return arg[1]
			end,
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stack",
			spellPrototype = "spell_on_hit",
			valField = "max_stacks",
			units = "second",
		},
	}
}

ItemTooltips[ ItemSubtype.RelicGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.relicgun.dps_kinetic,
		ItemTooltip.Weapon.relicgun.damage_kinetic,
		ItemTooltip.Weapon.relicgun.fire_rate,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range_min_max,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "minrange",
			subPrototype = "projectile",
			valField = "distance_damage_dist_min",
			units = "metre",
		},

		{
			name = "maxrange",
			subPrototype = "projectile",
			valField = "distance_damage_dist_max",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SpikedShield_Switch ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.Module.ammo,
		ItemTooltip.Module.charge_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ammo_cost_per_second",
			valField = "ammo_cost_per_second",
			units = "pieces",
		},
		{
			name = "resist",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "shield_regen",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.RocketMine ] =
{
	tooltipParams = 
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.warhead.flight_range,
		ItemTooltip.Module.warhead.flight_speed,
		ItemTooltip.Module.warhead.damage_cluster_range,
	},

	descriptionParams =
	{
		{
			name = "claster_count", -- Количество ракет
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				return arg[1].scheme.circle0.amount
			end,
			units = "pieces",
		},
		{
			name = "claster_radius", --Радиус сферы разлета
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local radius = 0
				for _,t in pairs( arg[1].target_pos_scheme ) do
					radius = math.max (radius, t.radius)
				end
				return radius
			end,
			units = "metre",
		},
		{
			name = "claster_timer", --Таймер до первого взрыва
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				return Def[death_entity].time_to_live
			end,
			units = "second",
		},
		{
			name = "claster_damage", --Урон от взрыва боеголовки, эм
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				local blast = Def[death_entity].explosion_blast_wave
				return Def[blast].damage_emp
			end,
			units = "damage",
		},
		{
			name = "spell_time", --Время действия спела 
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				local spell = Def[death_entity].spell
				return Spell[ spell ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Salyut_EnergyVamp ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams = 
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "aura_extra_radius",
			spellPrototype = "spell",
			valField = "aura_extra_radius",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "energy_per_sec",
			spellPrototype = "spell",
			valField = { "additional_auras[3].aura_param", "additional_auras[3].period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "resist",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
		{
			name = "speed",
			spellPrototype = "additional_spell",
			valField = "additional_auras[3].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.Salyut_ForceBooster ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams = 
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "aura_extra_radius",
			spellPrototype = "spell",
			valField = "aura_extra_radius",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "speed_inc",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param",
			formula = function(...)
				local arg = {...}
				return arg[1]
			end,
			units = "percent",
		},
		{
			name = "regen_dec",
			spellPrototype = "spell",
			valField = "additional_auras[3].aura_param",
			formula = function(...)
				local arg = {...}
				return arg[1]
			end,
			units = "percent",
		},
		{
			name = "resist",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
		{
			name = "speed",
			spellPrototype = "additional_spell",
			valField = "additional_auras[3].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.Salyut_SystemsCrash ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams = 
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "aura_extra_radius",
			spellPrototype = "spell",
			valField = "aura_extra_radius",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "resist",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
		{
			name = "speed",
			spellPrototype = "additional_spell",
			valField = "additional_auras[3].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.MoleGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams = 
	{
		{
			name = "asteroid_overhet_coef",
			valField = "asteroid_overheat_time_coef",
			formula = function( ... )
				local arg = { ... }
				return 1/arg[1]
			end,
			units = "pieces",
		},
	},
}

ItemTooltips[ ItemSubtype.LootMailer ] =
{
	tooltipParams = 
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},

	descriptionParams =
	{
		{
			name = "duration", -- Количество ракет
			valField = "activate_entity_ttl",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.MoleSendDrone ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.ammo_regen_max,
		ItemTooltip.Drone.health,
		ItemTooltip.Special.followerdrone.range,
		ItemTooltip.Drone.activation_ammo,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Weapon.heal_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams = 
	{
		{
			name = "drone_lifetime",
			spellPrototype = "spell",
			valField = "drone_ttl",
			units = "second",
		},
		{
			name = "influence_param",
			subPrototype = "drone_prj",
			valField = "heal_per_second",
			formula = function( ... )
				local arg = { ... }
				return arg[1]/2
			end,
			units = "units",
		},
		{
			name = "emergency_percent",
			subPrototype = "drone_prj",
			valField = "emergency_spell_threshold",
			units = "percent",
		},
		{
			name = "emergency_heal",
			subPrototype = "drone_prj",
			valField = "emergency_spell",
			formula = function( ... )
				local arg = { ... }
				local spells = Spell[ arg[1] ].spells
				return Spell[ spells[1] ].influence_param
			end,
			units = "units",
		},
		{
			name = "emergency_period",
			subPrototype = "drone_prj",
			valField = "emergency_spell_cooldown",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.OmegaB ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.LandingMultiPlatformModule ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.drone.damage_thermal,
		ItemTooltip.Drone.drone_weapon.fire_rate,
		ItemTooltip.Drone.drone_weapon.range,
		ItemTooltip.Drone.drone.max_speed,
		ItemTooltip.Drone.drone.max_rot_speed,
		ItemTooltip.Drone.drone.health,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams =
	{
		{
			name = "drone_prodaction_time",
			valField = "drone_prodaction_time",
			units = "second",
			negative = true,
		},
		{
			name = "drone_control_range",
			valField = "drone_control_range",
			units = "metre",
		},
		-- spell_on_landed_ship
		{
			name = "overcharge_bonus",
			spellPrototype = "additional_work_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		{
			name = "overcharge_duration",
			spellPrototype = "additional_work_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "overcharge_stack",
			spellPrototype = "additional_work_spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].max_stacks
			end,
			units = "units",
		},
		-- spell_on_parent
		{
			name = "resist_add",
			spellPrototype = "spell_depends_on_guests",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell_depends_on_guests",
			valField = "additional_auras[1].aura_param",
			formula = function(...)
				local arg = {...}
				return arg[1]*2
			end,
			units = "percent",
		},
		-- spell_on_landed_drone
		{
			name = "drone_hull_heal",
			spellPrototype = "spell_on_landed_drone",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.EmperorsRobe ] =
{
	tooltipParams = 
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "speed_boost",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyLance_TimeBoost ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "lance_length",
			valField = "damage_box_size.z",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "metre",
		},
		{
			name = "damage_emp",
			valField = "damage_emp",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.ProtozanTorpedo ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.projectile.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "flight_speed",
			subPrototype = "projectile",
			valField = { "boost_maxspeed_coef", "speed", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "metre_per_second",
		},
		{
			name = "flight_rot_speed",
			subPrototype = "projectile",
			valField = "boost_angular_velocity",
			units = "degree_per_second",
		},
		{
			name = "damage_huge",
			subPrototype = "projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ProtozanCamouflage ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "res_dec",
			spellPrototype = "deactivate_spell",
			valField = "aura_param",
			units = "units",
			negative = true,
		},
		{
			name = "duration",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Sehrimnir ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "resist_ally",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "resist_ally_count",
			spellPrototype = "spell",
			valField = "mod_max",
			units = "units",
		},
		{
			name = "resist_ally_range",
			spellPrototype = "spell",
			valField = "mod_range",
			units = "metre",
		},
		{
			name = "shield_resist_add",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
		{
			name = "speedup",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.DroneField ] =
{
	tooltipParams = 
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.warhead.flight_range,
		ItemTooltip.Module.warhead.flight_speed,
	},

	descriptionParams =
	{
		{
			name = "claster_count", -- Количество ракет
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				return arg[1].scheme.circle0.amount
			end,
			units = "pieces",
		},
		{
			name = "claster_radius", --Радиус сферы разлета
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local radius = 0
				for _,t in pairs( arg[1].target_pos_scheme ) do
					radius = math.max (radius, t.radius)
				end
				return radius
			end,
			units = "metre",
		},
		{
			name = "claster_timer", --Таймер до первого взрыва
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				return Def[death_entity].time_to_live
			end,
			units = "second",
		},
		{
			name = "drone_sensor_range",
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				return Def[death_entity].detonation_radius
			end,
			units = "metre",
		},
		{
			name = "drone_range",
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				local droneDef = Def[death_entity].death_entity_on_auto_detonate
				return Def[droneDef].control_range
			end,
			units = "metre",
		},
		{
			name = "drone_dps",
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				local droneDef = Def[death_entity].death_entity_on_auto_detonate
				local drone = Def[droneDef]
				return ( drone.damage_emp * drone.fire_rate ) / 60
			end,
			units = "damage_per_second",
		},
		{
			name = "drone_max_range",
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				local droneDef = Def[death_entity].death_entity_on_auto_detonate
				return Def[droneDef].max_range
			end,
			units = "metre",
		},
		{
			name = "drone_health",
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				local droneDef = Def[death_entity].death_entity_on_auto_detonate
				return Def[droneDef].health
			end,
			units = "units",
		},
		{
			name = "drone_ttl",
			subPrototype = "projectile",
			valField = "child_rockets",
			formula = function( ... )
				local arg = { ... }
				local rocket = arg[1].rocket
				local death_entity = Def[rocket].death_entity
				local droneDef = Def[death_entity].death_entity_on_auto_detonate
				return Def[droneDef].ttl
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Albiero_MicroWarp ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.activate_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "prep_time",
			valField = "prep_time",
			units = "second",
			negative = true,
		},
		{
			name = "accel_time",
			valField = "accel_time",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Albiero_Cloak ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.MassEnergyLeak ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.activate_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "energy_per_sec",
			spellPrototype = "spell",
			valField = { "aura_param", "period", },
			formula = function(...)
				local arg = {...}
				return arg[1] / arg[2]
			end,
			units = "units_per_second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.EnergyLanceAura ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "lance_width",
			valField = "damage_box_size.x",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "metre",
		},
		{
			name = "lance_length",
			valField = "damage_box_size.z",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "metre",
		},
		{
			name = "work_time",
			valField = "work_time",
			units = "second",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "units",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ThrasherGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell_on_hit",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				return Spell[Def[ arg[1] ].spell_approach].aura_param
			end,
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				return Spell[Def[ arg[1] ].spell_approach].duration
			end,
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_hit",
			valField = "spawn_def",
			formula = function( ... )
				local arg = { ... }
				return Spell[Def[ arg[1] ].spell_approach].max_stacks
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ThrasherActive ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
		ItemTooltip.Spell.range.target,
		ItemTooltip.Module.duration,
	},
	
	descriptionParams = 
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "target_range",	
			units = "metre",
		},
		{
			name = "aura_extra_radius",
			spellPrototype = "spell",
			valField = "target_extra_radius",	
			units = "metre",
		},
	}

}

ItemTooltips[ ItemSubtype.ThrasherDrones ] =
{
	tooltipParams =
	{
		ItemTooltip.Drone.dps.thermal,
		ItemTooltip.Drone.damage.thermal,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
		ItemTooltip.Drone.projectile_speed,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.num,
		ItemTooltip.Drone.fly_range,
		ItemTooltip.Drone.speed,
		ItemTooltip.Drone.angular_velocity,
		ItemTooltip.Drone.activation_ammo,
		ItemTooltip.Drone.ammo_regen_max,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,		
	},
	
	descriptionParams = 
	{
		{
			name = "chance",
			subPrototype = "activation_projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].chance
			end,	
			units = "percent",
		},
		{
			name = "explosion_range",
			subPrototype = "activation_projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,	
			units = "metre",
		},
		{
			name = "explosion_damage",
			subPrototype = "activation_projectile",
			valField = "spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "damage",
		},
	},
}

ItemTooltips[ ItemSubtype.CloakingDeviceRage ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "bonus_duration",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "bonus_damage",
			spellPrototype = "deactivate_spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.TyphonGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.energy_cost_per_second,
	},
	
	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "max_stacks",
			spellPrototype = "spell_on_hit",
			valField = "max_stacks",
			units = "units",
		},
	},
}


ItemTooltips[ ItemSubtype.MicroWarp_Winter ] =
{
	tooltipParams =
	{
		ItemTooltip.Special.crystaljump.charge_max,
		ItemTooltip.Module.charge_cooldown,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{ -- время работы ускорения
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{ -- размеры макс/мин оставляемого облака
			name = "cloud_size",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].target_spell",
			formula =
			{

				function( ... )
					local arg = { ... }
					return Spell[ arg[1] ].aura_range_add_max
				end,
			},
			units = "metre",
		},
		{ -- время жизни облака
			name = "cloud_ttl",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "units_per_second",
		},
		{
			name = "aura_param",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent_minus",
		},
	},
}

ItemTooltips[ ItemSubtype.Snowfall ] =
{
	descriptionParams =
	{
		{
			name = "crowd_control_coef_dec",
			valField = "crowd_control_coef_mul",
			negative = true,
			units = "percent",
		},
		{
			name = "beacon_capture_mul",
			valField = "beacon_capture_mul",
			units = "percent",
		},
	},
	
}

ItemTooltips[ ItemSubtype.StormGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal_min_max,
		ItemTooltip.Weapon.damage.thermal_min_max,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.laser_ray.width,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams = 
	{
		{
			name = "aura_param",
			spellPrototype = "spell_on_hit",
			-- valField = { "aura_param", "period", },
			-- formula = function( ... )
				-- local arg = { ... }
				-- return arg[1] / arg[2]
			-- end,
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return  450
			end,
			units = "damage_per_second",
		},
		{
			name = "huge_aura_param",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return 875
			end,
			units = "damage_per_second",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				-- local aura_param = Spell[ arg[1] ].duration
				-- local duration = Spell[ arg[1] ].duration
				-- local period = Spell[ arg[1] ].period
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.TyphonCharge ] =
{
	tooltipParams = 
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.TyphonActive ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = { "additional_auras[1].aura_param", "additional_auras[1].period", "additional_auras[1].duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * (arg[3] / arg[2] + 1)
			end,
			units = "units_per_second",
		},
		{
			name = "duration2",
			spellPrototype = "spell",
			valField = "additional_auras[2].duration",
			units = "second",
		},
		{
			name = "reduce_heal",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.DinoGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.laser_ray.width,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams = 
	{
		{
			name = "damage",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.MicroWarp_WASP ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.activate_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "prep_time",
			valField = "prep_time",
			units = "second",
			negative = true,
		},
		{
			name = "accel_time",
			valField = "accel_time",
			units = "second",
		},
		{
			name = "maxspeed_mul",
			valField = "maxspeed_mul",
			units = "units",
		},
		{
			name = "target_range",
			spellPrototype = "spell_on_warp",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_warp",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Dinoshell ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "resist",
			spellPrototype = "charge_spell_on_damage",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "point",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
				{
			name = "speed_bust",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].duration",
			units = "units",
		},
		{
			name = "heal_shield1",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 6
				end,
			units = "units",
		},
		{
			name = "heal_shield2",
			spellPrototype = "additional_spell",
			valField = "aura_param",
				formula = function( ... )
				local arg = { ... }
				return arg[1] * 6 * 10 * 1.8 + 600 --хил щита * длительность * стаки * кэффицент от стаков (смотреть в спеллах)
				end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PlasmaWebNyx ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},

	descriptionParams = 
	{
		-- spell_on_death_someone накопление зарядов
		{
			name = "damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "charge_max",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "charge_time",
			spellPrototype = "charge_spell_on_damage",
			valField = "duration",
			units = "units",
		},
		{
			name = "damage_min",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 9
				end,
			units = "units",
		},
				{
			name = "damage_max",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 9 *11
				end,
			units = "units",
			
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.Sneeze ] = -- Пиро-излучатель / Pyro Emitter
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "spell_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype = "spell",
			--valField = { "aura_param", "duration", "period" },
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 10 * 10
				end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.MicroWarp_Sai ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.activate_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "prep_time",
			valField = "prep_time",
			units = "second",
			negative = true,
		},
		{
			name = "accel_time",
			valField = "accel_time",
			units = "second",
		},
		{
			name = "stealth_time",
			spellPrototype = "spell_on_warp",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Octopus_HealFlow ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.MjolnirHook ] =
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},

	descriptionParams = 
	{
		-- spell_on_death_someone накопление зарядов
		{
			name = "damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "charge_max",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "charge_time",
			spellPrototype = "charge_spell_on_damage",
			valField = "duration",
			units = "units",
		},
		{
			name = "damage_min",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] 
				end,
			units = "units",
		},
				{
			name = "damage_max",
			spellPrototype = "spell",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] *11
				end,
			units = "units",
			
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.SawOne_FireRate ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "time",
			spellPrototype = "spell",
			valField = "duration",
			units = "units",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.KrakenMode ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Cyning_Capturer ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.aura_time,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	
	{
		{
			name = "aura_param",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent_minus",
		},
	},
}

ItemTooltips[ ItemSubtype.Jaguar_SlowerDrone ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.drone.damage_kinetic,
		ItemTooltip.Drone.fire_rate,
		ItemTooltip.Drone.range,
	},
}

ItemTooltips[ ItemSubtype.Peregrine_Emissions ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "period",
			spellPrototype = "spell",
			valField = "period",
			units = "units",
		},
		{
			name = "cloud_size",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "resist",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "resist_add",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "time",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Ronin_Stealth ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "stealth_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "stealth_duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Caltrop_StanMine ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_range",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell
				return -Spell[ spell ].aura_range
			end,
			units = "metre",
		},
		{
			name = "range",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].field_radius
			end,
			units = "metre",
		},
		{
			name = "time",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				local spell = Def[ arg[1] ].spell
				return -Spell[ spell ].duration
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PalomShield ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		--ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "aura_param_raid",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration_raid",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "hull_heal_coef",
			valField = "hull_heal_coef",
			units = "percent",
		},
		{
			name = "energy_bonus",
			spellPrototype = "spell_on_hit",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell0",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell0",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell1",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell1",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		{
			name = "speed_bust",
			spellPrototype = "spell2",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell2",
			valField = "additional_auras[1].duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.Bootlegger_warp ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SeeressGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_min_max_charge,
		ItemTooltip.Weapon.damage.emp_min_max_charge,
		ItemTooltip.Weapon.fire_rate.min_max_charge,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
		--	spellPrototype = "spell",
			valField = { "charge_levels[2].projectile", },
			formula = function( ... )
				local arg = { ... }
				local Projectile = Def[ arg[1] ].spell
				local FirstSpell = Spell[ Projectile ].spells[1]
				return Spell[ FirstSpell ].duration
			end,
			units = "second",
		},
		{
			name = "damage",
			valField = { "charge_levels[2].projectile", },
			formula = function( ... )
				local arg = { ... }
				local Projectile = Def[ arg[1] ].spell
				local FirstSpell = Spell[ Projectile ].spells[1] 
				return Spell[ FirstSpell ].aura_param  * 8
				end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SeeressDrug ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "radius",
			subPrototype = "activate_entity",
			valField = "max_owner_distance",
			units = "metre",
		},
		{
			name = "range",
			subPrototype = "activate_entity",
			valField = "teleport_radius",
			units = "metre",
		},
		{
			name = "time",
			subPrototype = "activate_entity",
			valField = "teleport_preparation_time",
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ItemSubtype.SeeressEngMod] =
{
	tooltipParams = 
	{
		ItemTooltip.Effects.acceleration_mul,
		ItemTooltip.Effects.strafe_accel,
		ItemTooltip.Effects.boost_energy_cost_per_second_mul,
		
	},
		descriptionParams =
	{	
	{
		
			name = "speed",
			valField = "max_speed_mul",
			units = "percent",
			negative = true,
	},
	},
}

ItemTooltips[ ItemSubtype.SeeressArmMod ] = -- Улучшенные пилоны
{
	descriptionParams =
	{
		{
			name = "rocket_cooldown",
			valField = "rocket_cooldown_coef_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "hull_resist",
			valField = "hull_resist_add",
			units = "units",
			negative = false,
		},
	},
}

ItemTooltips[ ItemSubtype.Disintegrator_Helicon ] =
{
	tooltipParams =
	{
	--	ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal_large,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,		
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Module.energy_cost,

	},
	descriptionParams =
	{
		{
			name = "spell_duration",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},		
		{
			name = "dmg_frg",
			spellPrototype = "spell_on_hit",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "dmg_dstr",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				local aura_param = Spell[ arg[1] ].aura_param
				local duration = Spell[ arg[1] ].duration
				local period = Spell[ arg[1] ].period
				return ( (duration - duration % period) / period + 1) * aura_param
			end,
			units = "units",
		},
		{
			name = "rcooldown",
			valField = "ammo_regen_time",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.HeliconGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic_min_max_rate_2,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.min_max,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
}

ItemTooltips[ ItemSubtype.HeliconModule ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
descriptionParams =
	{

		{
			name = "duration",
			spellPrototype = "spell",
			valField = "target_spell",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SparksCannonGrim ] =    -- Кинетический нагнетатель Grim
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
		
	descriptionParams = --TODO: Tooltip
	{
		{
			name = "DOT",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = {"aura_param", "period"},
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "units",
		},
		{
			name = "blastCloudRange",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "blastCloudDuration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GrimBlackoutGenerator ] =
{
	tooltipParams =
	{
		ItemTooltip.Special.blackout.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "target_range",
			spellPrototype = "deactivate_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].target_range
			end,
			units = "metre",
		},
		{
			name = "duration_stun",
			spellPrototype = "deactivate_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "post_duration",
			spellPrototype = "deactivate_spell",
			valField = { "spells[2]" },
			formula = function ( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.BaphometGun] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
	{
		name = "slow_debuff",
		subPrototype = "projectile",
		spellPrototype = "spell",
		valField = "additional_auras[1].aura_param",
		units = "percent",
	},
	{
		name = "damage_buff",
		subPrototype = "projectile",
		spellPrototype = "spell",
		valField = "aura_param",
		units = "percent",
	},
	{
		name = "time",
		subPrototype = "projectile",
		spellPrototype = "spell",
		valField = "duration",
		units = "second",
	},
	},
}

ItemTooltips[ ItemSubtype.Mauler_GuidedMissile ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.projectile.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		 {
			name = "range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
				formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
				end,
			units = "units",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "sec",
		},
		{
			name = "damage_huge",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
				formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
				end,			
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ChargedInvisible ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "life_time",
			spellPrototype = "charge_spell_on_damage",
			valField = "duration",
			units = "units",
		},		
		{
			name = "point",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "units",
		},
		{
			name = "heal_shield1",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 11
				end,
			units = "units",
		},
		{
			name = "heal_shield2",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 10 * 12.1
				end,
			units = "units",
		},
		{
			name = "bonus_duration",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "units",
		},
		{
			name = "bonus_damage",
			spellPrototype = "deactivate_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "time",
			spellPrototype = "spell",
			valField = "additional_auras[1].duration",
			formula = function( ... )
				local arg = { ... }
				return arg[1]
				end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.BaphometModule ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{

		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			-- formula = function( ... )
				-- local arg = { ... }
				-- return Spell[ arg[1] ].duration
			-- end,
			units = "second",
		},
		{
			name = "energy",
			spellPrototype = "spell",
			valField = "aura_param",
				formula = function( ... )
				local arg = { ... }
				return arg[1] * 5
				end,
			units = "units",
		},
		{
			name = "slow",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},	
		{
			name = "eng_fast",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},	
		{
			name = "fire_rate",
			spellPrototype = "additional_spell",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},		
	},
}


ItemTooltips[ItemSubtype.BaphometImplsDischarger] =    -- Импульсный разрядник Baphomet
{
	descriptionParams =
	{
		{
			name = "energy_regen_mul",
			valField = "energy_regen_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "projectile_speed_mul",
			valField = "projectile_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ItemSubtype.BaphometRecuperator] = -- Рекуперотр Бафомета
{
	descriptionParams =
	{
		{
			name = "recuperation_power",
			valField = "recuperation_power",
			units = "percent",
		},
		{
			name = "shield_resist_add",
			valField = "shield_resist_kinetic_add", -- в таблице указаны по отдельности
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.LaserHadrian ] =    -- Импульсный лазер Hadriana
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range_ally",
			spellPrototype = "spell_on_hit",
			valField = "aura_range",
			units = "metre",
		},
				{
			name = "damage_ally",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.MagnitkaHadrian ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage_ally",
			spellPrototype = "spell",
			valField = "target_spell",
					formula = function(...)
				local arg = {...}
				return Spell[ arg[1] ].aura_param * 4
			end,
			units = "units",
		},
		{
			name = "duration_ally",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "target_spell",
					formula = function(...)
				local arg = {...}
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},		
	},
}

ItemTooltips[ ItemSubtype.HadrianDefenderShield ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "duration",
			subPrototype = "activate_entity",
			valField = "ttl",
			units = "second",
		},
		{
			name = "resist_add",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.ManulsPaw] = 
{
tooltipParams =
	{
		ItemTooltip.Weapon.damage.blastwave_emp_large,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,		
	},
descriptionParams =
	{
	{
		name = "aura_param",
		spellPrototype = "additional_spell",
		valField = "aura_param",
		units = "percent",
	},
	{
		name = "duration",
		spellPrototype = "additional_spell",
		valField = "duration",
		units = "second",
	},
	{
		name = "time_bonus",
		spellPrototype = "spell_on_hit",
		valField = "duration",
		units = "second",
	},
	{
		name = "param_dec",
		spellPrototype = "spell_on_hit",
		valField = "aura_param",
		units = "percent",
	},	
	},
}

ItemTooltips[ ItemSubtype.ManulPlasmaGun] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
	{
		name = "fire_rate_mul",
		spellPrototype = "spell_on_hit",
		valField = "aura_param",
			formula = function(...)
				local arg = {...}
				return arg[1] * 3
			end,
		units = "percent",
	},
	},
}

ItemTooltips[ ItemSubtype.ManulShields ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "shield",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			formula = function(...)
				local arg = {...}
				return arg[1] * 4
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.SalamanderNailgun ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
	{
		name = "heaal_mul",
		spellPrototype = "spell_on_hit",
		valField = "aura_param",
		units = "percent",
	},
	},	
}

ItemTooltips[ ItemSubtype.DragonFlash] = 
{
tooltipParams =
	{
		ItemTooltip.Special.swarm.flight_speed,
		ItemTooltip.Special.swarm.health,
		ItemTooltip.Special.swarm.health_regen,
		ItemTooltip.Module.energy_cost,
	--	ItemTooltip.cooldown,
		
	},
descriptionParams =
	{
	{
		name = "shield_heal",
		subPrototype = "swarm_pack",
		spellPrototype = "spell1",
		valField = "aura_param",
		units = "units",
	},
	{
		name = "hull_heal",
		subPrototype = "swarm_pack",
		spellPrototype = "spell2",
		valField = "aura_param",
		units = "units",
	},
	{
		name = "damage_pulsar",
		subPrototype = "swarm_pack",
		spellPrototype = "spell3",
		valField = "aura_param",
		units = "units",
	},
	{
		name = "pulsar_range",
		subPrototype = "swarm_pack",
		spellPrototype = "spell3",
		valField = "aura_range",
		units = "metre",
	},
	{
		name = "range",
		subPrototype = "swarm_pack",
		spellPrototype = "spell1",
		valField = "aura_range",
		units = "metre",
	},	
	{
		name = "cooldown",
		valField = "cooldown",
		units = "units",
	},
	},
}

ItemTooltips[ ItemSubtype.DragonFlashControl ] =   
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
	{
		name = "resist",
		spellPrototype = "spell",
		valField = "aura_param",
		units = "units",
	},
	{
		name = "hull_heal",
		spellPrototype = "spell_on_max_speed_plus",
		valField = "aura_param",
			formula = function(...)
				local arg = {...}
				return arg[1] * 5
			end,
		units = "units",
	},
	{
		name = "radar_dec",
		spellPrototype = "spell_on_max_speed_plus",
		valField = "additional_auras[1].aura_param",
		units = "percent",
	},	
	},	
}

ItemTooltips[ ItemSubtype.DragonAdaptiveForceShield ] =   
{

	descriptionParams =
	{
		{
			name = "speed_to_resist",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "minspeed",
			valField = "max_speed_percent",
			units = "percent",
		}
	},	
}

ItemTooltips[ ItemSubtype.DragonFlashRangeMaster ] =   
{

	descriptionParams =
	{
	{
		name = "optimal_range_mul",
		valField = "optimal_range_mul",
		units = "percent"
	},
	{
		name = "max_range_mul",
		valField = "optimal_range_mul",
		units = "percent"
	},
	{
		name = "damage_mul",
		valField = "damage_mul",
		units = "percent",
		negative = true,
	},
	{
		name = "damage",
		valField = "swarm_projectile_damage_thermal",
		units = "units",
	},	
	{
		name = "fire_rate",
		valField = "swarm_projectile_fire_rate",
		units = "units",
	},	
	{
		name = "range",
		valField = "swarm_projectile_max_range",
		units = "metre",
	},	
	{
		name = "projectile_speed",
		valField = "swarm_projectile_speed",
		units = "metre_per_second",
	},		
	},	
}

ItemTooltips[ ItemSubtype.HeartAttack ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams =
	{
		{
			name = "dot_dmg_from",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "damage",
		},
		{
			name = "dot_dmg_to",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "damage",
		},
		{
			name = "dot_range",
			spellPrototype = "spell_on_hit",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.HeartCooldownerDec ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "cd_dec",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},		
	},
}

ItemTooltips[ ItemSubtype.HeathTaunt ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "energy",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "range_max",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
		{
			name = "lock_time",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},		
	},
}

ItemTooltips[ItemSubtype.EngineGeneratorCorVulnus] =
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "boost_energy_cost_per_second_mul",
			valField = "boost_energy_cost_per_second_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.CorVulnusCPU] =
{
	descriptionParams =
	{
		{
			name = "crowd_control_coef_mul",
			valField = "crowd_control_coef_mul",
			units = "percent",
			negative = true,
		},
		{
			name = "range",
			spellPrototype	= "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage_dec",
			spellPrototype	= "spell_on_equip",
			valField = "aura_param",
			units = "percent_minus",
			negative = true,
		},
	},
}

ItemTooltips[ItemSubtype.CorrosiveMissile] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.kinetic,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
		ItemTooltip.Rocket.entity_health,
		ItemTooltip.Rocket.entity_ttl,
	},
	
	descriptionParams = 
	{
		{
			name = "range",
			subPrototype = "death_entity",
			spellPrototype = "active_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "small_dmg",
			subPrototype = "death_entity",
			spellPrototype = "active_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * 2
			end,
			units = "units",
		},
		{
			name = "large_dmg",
			subPrototype = "death_entity",
			spellPrototype = "active_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * 2
			end,
			units = "units",
		},
		{
			name = "huge_dmg",
			subPrototype = "death_entity",
			spellPrototype = "active_spell",
			valField = "spells[3]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * 2
			end,
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.AnomalyBoom] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "attraction",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "metre_per_second",
		},
				{
			name = "range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "emp_damage",
			spellPrototype = "spell",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				local blastwave = Spell[ arg[1] ].explosion_blast_wave
				return Def[ blastwave ].damage_emp
			end,
			units = "units",
		},
	},
}

ItemTooltips[ItemSubtype.HeatMulFire] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		{
			name = "heat_dec",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenFastShotgun ] =   
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
	{
		name = "damage",
		subPrototype = "projectile",
		spellPrototype = "spell_on_crit",
		valField = "explosion_blast_wave",
			formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].damage_kinetic 
			end,
		units = "units",
	},
	},	
}

ItemTooltips[ ItemSubtype.GreenArtillery] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_min_max_plain,
		ItemTooltip.Weapon.damage.emp_min_max,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range_min_max,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.GreenSphereGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		-- ItemTooltip.Weapon.damage.thermal,
		-- ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.laser_ray.width,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams = 
	{
		{
			name = "damage",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "spells[3]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenEnergyShieldReflector ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenAIM ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "shell",
			--subPrototype = "",
			spellPrototype = "additional_spell",
			valField = "influence_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] - 10000
			end,
			units = "units",
		},
		{
			name = "shell_duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},		
		{
			name = "range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GreenSwitcher ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		--ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "ally_num",
			spellPrototype = "spell0",
			valField = "mod_max",
			units = "units",
		},
		{
			name = "damge",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "cooldown",
			spellPrototype = "spell2",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "all_resist",
			spellPrototype = "spell1",
			valField = "aura_param",
			units = "units",
		},	
		{
			name = "range",
			spellPrototype = "spell1",
			valField = "mod_range",
			units = "metre",
		},		
	},
}

ItemTooltips[ ItemSubtype.GreenSouls ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.hull_cost_per_second,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		-- {
			-- name = "hull_cost",
			-- valField = "hull_cost_per_second",
			-- units = "second",
		-- },
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "target_range",
			units = "metre",
		},		
	},
}

ItemTooltips[ ItemSubtype.GreenChargeFlow ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.hull_cost_per_second,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},		
	},
}

ItemTooltips[ ItemSubtype.GreenCommanderBuffer ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},	
		{
			name = "range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "resist_all",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "dmg_mul",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},		
	},
}

ItemTooltips[ ItemSubtype.GreenCommanderEmergency ] =   
{
		tooltipParams =
	{
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "range",
			spellPrototype = "spell_on_max_health_minus",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "atan",
			spellPrototype = "spell_on_max_health_minus",
			valField = "duration",
			units = "second",
		},		
		{
			name = "hull_cost",
			valField = "max_health_percent",
			units = "percent",
		},
		{
			name = "crowd_control_coef_dec",
			valField = "crowd_control_coef_mul",
			negative = true,
			units = "percent",
		},
	},	
}

ItemTooltips[ ItemSubtype.GreenCommanderHullRep ] =   
{
	descriptionParams =
	{
		{
			name = "range",
			spellPrototype = "spell_on_equip",
			valField = "mod_range",
			units = "metre",
		},
		{
			name = "ally_max",
			spellPrototype = "spell_on_equip",
			valField = "mod_max",
			units = "units",
		},
		{
			name = "max_hull_regen",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},		
	},	
}

ItemTooltips[ ItemSubtype.GreenCapFirerate ] =   
{
	descriptionParams =
	{
		{
			name = "speed",
			valField = "max_speed_percent",
			units = "percent",
		},
		{
			name = "fr_min",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "fr_max",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "heat_mul",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},			
	},	
}

ItemTooltips[ ItemSubtype.BarkCanon ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.AB1 ] = -- A1MA
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Module.duration,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "fire_rate_mul",
			subPrototype = { "active_projectile", nil },
			valField = { "fire_rate_mul" },
			units = "units",
		},
		{
			name = "duration",
			--subPrototype = "duration",
			valField = "duration",
			units = "second",
		},
		{
			name = "aure_param",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},		
	},
}

ItemTooltips[ItemSubtype.BarkBomb] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.module.flight_speed,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams = 
	{
		{
			name = "min_range",
			subPrototype = "projectile",
			valField = "detonation_radius",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.TurnGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		-- ItemTooltip.Weapon.damage.thermal,
		-- ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.laser_ray.width,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams = 
	{
		{
			name = "damage",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "aura_param",
			-- formula = function( ... )
				-- local arg = { ... }
				-- return Spell[ arg[1] ].aura_param
			-- end,
			units = "percent_minus",
			negative = true,
		},
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.ShrikeBall ] = 
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "charge_time",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
				formula = function( ... )
				local arg = { ... }
				return arg[1]+90
				end,
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "aura_param",
				formula = function( ... )
				local arg = { ... }
				return arg[1]*100
				end,
			units = "units",
		},		
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},	
		{		
			name = "shield_resist",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "uncanceled_influence_time",
		},	
		{		
			name = "speed_mul",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},				
	},
}

ItemTooltips[ ItemSubtype.ShrikeHealAll ] = 
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "shield_regen",
			spellPrototype = "spell",
			valField = "aura_param",
				formula = function( ... )
				local arg = { ... }
				return arg[1]*11
				end,
			units = "units",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},			
	},
}

ItemTooltips[ ItemSubtype.ShrikeCrit ] =   
{
	descriptionParams =
	{
		{
			name = "crit_bonus",
			valField = "crit_damage_add",
			formula = function( ... )
				local arg = { ... }
				return math.abs( arg[1] )
			end,
			units = "percent",
			negative = true,
		},
		{
			name = "crit_chance",
			valField = "crit_chance_add",
			units = "percent",
		},
	},	
}

ItemTooltips[ ItemSubtype.FireBallThrower ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		-- spell_on_hit
		{
			name = "damage",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "period", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2]
			end,
			units = "damage_per_second",
		},
		{
			name = "damage_max",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "period", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] / arg[2] * arg[3]
			end,
			units = "damage_per_second",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "fire_time",
			subPrototype = "projectile",
			spellPrototype = "death_entity_on_static_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.PilumAntiHeat ] = 
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},		
		{
			name = "damage_mod",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},			
	},
}

ItemTooltips[ ItemSubtype.Pilums ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.emp_large,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
		
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			spellPrototype = "spell_on_hit",
			valField = {"additional_auras[2].aura_param", },
			units = "units_",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "speed_dec",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent_minus",
		},
		{
			name = "range",
			subPrototype = "projectile",
			valField = "death_entity_on_static_hit",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].radius
		end,	
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.PilumSpecialDamage ] =   
{
	descriptionParams =
	{
		{
			name = "crit_bonus",
			valField = "crit_damage_add",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_special_activate",
			valField = "duration",
			units = "second",
		},
		{
			name = "damage_mul",
			spellPrototype = "spell_on_special_activate",
			valField = "aura_param",
			units = "percent",
		},
	},	
}

ItemTooltips[ ItemSubtype.HeliSpark ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.damage.emp_large,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,		
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "range",
			subPrototype = "projectile",
			valField = "link_range",
			units = "metre",
		},
		{
			name = "huge_damage",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param", "duration", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.HeliRoid] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
		{
			name = "entity_max",
			subPrototype = "projectile",
			valField = "owned_death_entity_max",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.Heliboom ] = 
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "aura_range", 
			units = "units",
		},		
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration", 
			units = "second",
		},	
	},
}


ItemTooltips[ ItemSubtype.HeliAntiRadar ] = 
{
	descriptionParams =
	{
		{
			name = "max_speed",
			valField = "max_speed_percent", 
			units = "percent",
		},		
		{
			name = "camo_mod",
			spellPrototype = "spell_on_max_speed_minus",
			valField = "aura_param", 
			units = "percent_minus",
			negative = true,
		},				
	},
}

ItemTooltips[ ItemSubtype.HeliAccelerationCoil ] = 
{
	descriptionParams =
	{
		{
			name = "projectile_speed",
			valField = "projectile_speed_mul", 
			units = "percent",
		},		
		{
			name = "energy_regen_mul",
			valField = "energy_regen_mul", 
			units = "percent",
		},						
	},
}

ItemTooltips[ ItemSubtype.PsiloiTurboFaser ] =    
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.PsiloiBooster ] =    
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration", 
			units = "second",
		},
		{
			name = "slow_maneuver",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param", 
			units = "percent_minus",
		},
	},
}

ItemTooltips[ ItemSubtype.PsiloiStarSail ] =    
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "fast_maneuver",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},			
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration", 
			units = "second",
		},
		{
			name = "heal",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param", 
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PsiloiSafeEngine ] =    
{
	descriptionParams =
	{
		{
			name = "max_rot_speed",
			valField = "rot_speed_mul", 
			units = "percent_minus",
			negative = true,
		},		
		{
			name = "energy_regen_mul",
			valField = "energy_regen_mul", 
			units = "percent",
		},	
	},
}

ItemTooltips[ ItemSubtype.PsiloiAutoEmergency ] =    
{
	descriptionParams =
	{
		{
			name = "energy_regen",
			spellPrototype = "emergency_barrier_spell",
			valField = {"aura_param", "duration", },
				formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
			negative = true,
		},		
		{
			name = "hull_regen",
			spellPrototype = "emergency_barrier_spell",
			valField = {"additional_auras[1].aura_param", "additional_auras[1].duration", },
				formula = function( ... )
				local arg = { ... }
				return arg[1] * ( arg[2] + 1 )
			end,
			units = "units",
			negative = true,
		},	
		{
			name = "cooldown",
			valField = "cooldown", 
			units = "second",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.BasheGun ] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.BasheGun.dps_emp2,
		ItemTooltip.Weapon.damage.emp_min_max_charge,
		ItemTooltip.Weapon.BasheGun.fire_rate,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.BasheGun.projectile_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
		ItemTooltip.Weapon.charge,
	},
	descriptionParams =
	{
		{
			name = "charge_1",
			--spellPrototype = "spell",
			valField = "charge_levels[2].damage_mul",
			units = "units",
		},
		{
			name = "charge_2",
			--spellPrototype = "spell",
			valField = "charge_levels[3].damage_mul",
			units = "units",
		},
		-- {
			-- name = "charge_1_min",
			-- valField = "charge_levels[2].projectile"
			-- spellPrototype = "spell_on_launch",
			-- valField = "charge_levels[2].damage_mul",
			-- units = "units",
		-- },		
		-- {
			-- name = "resist_dec",
			-- valField = "charge_levels[2].projectile",
			-- formula = function( ... )
				-- local arg = { ... }
				-- local spell = Def[ arg[1] ].spell
				-- return Spell[ spell ].aura_param
			-- end,
			-- units = "units",
		-- },
	},
}

ItemTooltips[ ItemSubtype.BasheSpecial ] =    
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "bot_ttl",
			valField = "spawn_bots_ttl", 
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration", 
			units = "second",
		},
		{
			name = "hull_heal",
			spellPrototype = "spell",
			valField = "additional_auras[2].aura_param", 
						formula = function(...)
				local arg = { ... }
				return arg[1] * 10
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.BasheActive ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.emp_large,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.damage_to_host,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "range",
			valField = "max_range",
			units = "metre",
		},	
	},
}

ItemTooltips[ ItemSubtype.BashePassive1 ] =    
{
	descriptionParams =
	{
		{
			name = "range",
			spellPrototype	= "spell_on_equip",
			valField = "aura_range", 
			units = "metre",
			--negative = true,
		},		
		{
			name = "enemy_dmg_dec",
			spellPrototype	= "spell_on_equip",
			valField = "aura_param", 
			units = "percent_minus",
			negative = true,
		},	
	},
}

ItemTooltips[ ItemSubtype.BashePassive2 ] =    
{
	descriptionParams =
	{
		{
			name = "hull_dmg_resist",
			valField = "hull_resist_add",
			units = "units",
		},
		{
			name = "hull_health_mul",
			valField = "hull_health_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PerseiGun] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
		{
			name = "mine_max",
			subPrototype = "projectile",
			valField = "death_entity",
				formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].max_mines
				end,
			units = "units",
		},
		{
			name = "damage_thermal",
			subPrototype = "projectile",
			valField = "death_entity",
				formula = function( ... )
				local arg = { ... }
				local blastwave = Def[ arg[1] ].explosion_blast_wave
				return Def[ blastwave ].damage_thermal
				end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.PerseiPassive1 ] =    
{
	descriptionParams =
	{
		{
			name = "rot_speed_mul",
			valField = "rot_speed_mul",
			units = "percent",
		},
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.PerseiPassive2 ] =    
{
	descriptionParams =
	{
		{
			name = "fire_rate_mul",
			valField = "fire_rate_mul",
			units = "percent",
		},
		{
			name = "energy_max_mul",
			valField = "energy_max_mul",
			units = "percent",
			negative = true,
		},
	},
}

ItemTooltips[ ItemSubtype.PerseiActive ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "speed_dec",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent_minus",
			negative = true,
		},
		{
			name = "attract",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "metre_per_second",
		},
	},
}

ItemTooltips[ ItemSubtype.PerseiSpecial ] =
{
	tooltipParams = 
	{
		-- ItemTooltip.Spell.effect.damage_mul,
		-- ItemTooltip.Special.landing.range_add,
		-- ItemTooltip.Special.landing.projectile_speed_mul,
		-- ItemTooltip.Special.landing.shield_regen,
		-- ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams = 
	{
		{
			name = "regen",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "time",
			spellPrototype = "spell",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.FrostRay ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "cooldown_mod",
			spellPrototype = "spell_on_hit",
			valField = { "aura_param" },
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = { "duration" },
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.BenGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.laser_ray.width,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.RocketGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ItemSubtype.AlienKiller] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Rocket.flight_rot_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
}

ItemTooltips[ ItemSubtype.HellasKinetLaser ] =    -- Импульсный лазер 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic_2,
		--ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "speed_dec",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "damage_ally",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.HallasManAIM ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "rot_max",
			spellPrototype	= "spell",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.HellasMine ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.dist_mine.damage_thermal,
		ItemTooltip.Active.dist_mine.damage_range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.module.flight_speed,
		ItemTooltip.Explosions.holder_ammo,
		ItemTooltip.Module.charge_cooldown,
		--ItemTooltip.Rocket.barrel_rot_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "detector_range",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].radius
			end,
			units = "metre",
		},
		{
			name = "mine_ttl",
			subPrototype = "projectile",
			valField = "death_entity",
			formula = function( ... )
				local arg = { ... }
				return Def[ arg[1] ].ttl
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.HellasCap ] =    
{
	descriptionParams =
	{
		{
			name = "energy_max_mul",
			valField = "energy_max_mul",
			units = "percent",
		},
		{
			name = "module_range",
			spellPrototype	= "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.HellasEng ] =    
{
	descriptionParams =
	{
		{
			name = "max_speed_mul",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "hull_resist_add",
			valField = "hull_resist_add",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.GG_RocketRing ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
		descriptionParams =
	{
		{
			name = "child_rocket",
			subPrototype = "projectile",
			valField = "child_rockets.max_rockets_per_target",
			units = "pieces",
		},
		{
			name = "blast",
			--subPrototype = "projectile",
			valField = "damage_kinetic",
			units = "units",
		},
		{
			name = "child_range",
			subPrototype = "projectile",
			valField = "child_rockets.direct_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.GG_BubbleGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.laser_ray.width,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
		descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},		
		{
			name = "man_dec",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent_minus",
		},
		{
			name = "man_dec_max",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 10
			end,
			units = "percent_minus",
		},
	},	
}

ItemTooltips[ ItemSubtype.GG_HullBlast ] =    
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "hull_max",
			valField = "hull_health_mul",
			units = "percent",
		},
		{
			name = "hull_percent",
			valField = "max_health_percent",
			units = "percent",
		},
		{
			name = "damage",
			spellPrototype = "spell_on_max_health_minus",
			valField = "explosion_blast_wave",
			formula = function( ... )
				local arg = { ... }
				local def = Def[ arg[2] ]
				local blast1 = Def[ arg[1] ]
				return blast1.damage_emp
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.GG_ShellOvercharge ] =    
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "shell_max",
			spellPrototype	= "shield_disabled_spell",
			valField = "influence_param",
			units = "units",
		},
		{
			name = "shell_duration",
			spellPrototype	= "shield_disabled_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "duration",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			formula = function(...)
				local arg = {...}
				return arg[1] / 2.4 
			end,
			units = "units",
		},
		{
			name = "overcharge",
			spellPrototype = "shield_disabled_spell",
			valField = "duration",
			formula = function( ... )
			local arg = { ... }
			return 50
			end,
			units = "units",
		},	
	},
}

ItemTooltips[ ItemSubtype.GG_CamoCPU ] =    
{
	descriptionParams =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},
		{
			name = "camo_mod",
			spellPrototype	= "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "aura_range",
			spellPrototype	= "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.GG_Pulsar ] =    
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
	},
	descriptionParams =
	{
		{
			name = "aura_range",
			spellPrototype	= "additional_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage_thermal_min",
			spellPrototype	= "spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "damage_thermal_max",
			spellPrototype	= "spell",
			valField = { "aura_param", "mod_max", },
		formula = function( ... )
			local arg = { ... }
			return arg[1] * arg[2]
		end,
			units = "units",
		},
		{
			name = "aura_range2",
			spellPrototype	= "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype	= "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "mod_max",
			spellPrototype	= "spell",
			valField = "mod_max",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.GG_Hipnodancer ] =    
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
	},
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype	= "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype	= "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "resist_dec",
			spellPrototype	= "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.GG_InvinsibleCone ] =    
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.hull_cost_per_second_1,		
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,		
	},
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype	= "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype	= "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.GG_DamageBoost ] =    
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
	},
	descriptionParams =
	{
		{
			name = "damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "resist",
			spellPrototype = "charge_spell_on_damage",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "point",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "damage_mul",
			spellPrototype = "additional_spell",
			valField = { "aura_param", "max_stacks", },
		formula = function( ... )
			local arg = { ... }
			return 1
		end,
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].duration",
			units = "units",
		},
		{
			name = "speed_bust",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.GG_PhaseShield ] =    
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
	},
	descriptionParams =
	{
		{
			name = "cooldown_mul",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
		formula = function( ... )
			local arg = { ... }
			return 50
		end,			
			units = "units",
		},
		{
			name = "shield_regen_mul",
			spellPrototype = "spell0",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},
		{
			name = "damage_mul",
			spellPrototype = "spell1",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},
		{
			name = "hull_regen_mul",
			spellPrototype = "spell2",
			valField = "additional_auras[2].aura_param",
			units = "units",
		},
		{
			name = "resist",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.GG_TimeBomb ] =    
{
	tooltipParams =
	{
		ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
	},
	descriptionParams =
	{
		{
			name = "range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "mod_max",
			spellPrototype = "spell",
			valField = "mod_max",
			units = "units",
		},
		{
			name = "shield_resist",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "units",
		},		
	},
}

ItemTooltips[ ItemSubtype.HerConcentration ] =    
{

	descriptionParams =
	{
		{
			name = "crit_chance",
			valField = "crit_chance_add",
			units = "percent",
		},
		{
			name = "aura_range",
			spellPrototype	= "spell_on_equip",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.AmberLanding ] =
{
	tooltipParams = 
	{
		-- ItemTooltip.Spell.effect.damage_mul,
		-- ItemTooltip.Special.landing.range_add,
		-- ItemTooltip.Special.landing.projectile_speed_mul,
		--ItemTooltip.Special.landing.shield_regen,
		--ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams = 
	{
		{
			name = "max_speed_landing",
			valField = "max_speed",
			units = "metre_per_second",
		},
		{
			name = "max_range_landing",
			valField = "landing_max_range",
			units = "metre",
		},
		{
			name = "max_angle_landing",
			valField = "landing_max_angle",
			units = "degree",
		},
		{
			name = "damage_mul",
			spellPrototype	= "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "projectile_speed_mul",
			spellPrototype	= "spell",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},
		{
			name = "fire_rate_mul",
			spellPrototype	= "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},	
		{
			name = "fire_rate",
			spellPrototype	= "spell",
			valField = "additional_auras[3].aura_param",
			units = "percent",
		},		
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "spell_on_cancel",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.AmberCPU ] =    
{
	descriptionParams =
	{
		{
			name = "lock_time_mul",
			valField = "lock_time_mul",
			units = "percent",
			negative = true,
		},	
		{
			name = "duration",
			spellPrototype	= "spell_on_module_activate",
			valField = "duration",
			units = "second",	
		},	
	},
}

ItemTooltips[ ItemSubtype.AmberShield ] =    
{
	descriptionParams =
	{
		{
			name = "shield_regen",
			spellPrototype	= "spell_on_no_firing",
			valField = "aura_param",
			units = "units",	
		},
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",	
			negative = true,
		},			
	},
}

ItemTooltips[ ItemSubtype.AmberFrontShield ] =    
{
	tooltipParams = 
	{

		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},	
	descriptionParams =
	{
		{
			name = "activate_entity_ttl",
			valField = "activate_entity_ttl",
			units = "second",	
		},
		{
			name = "activate_entity_health",
			valField = "activate_entity_health",
			units = "units",	
		},	
	},
}

ItemTooltips[ ItemSubtype.AmberSlowGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
		{
			name = "range",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_range",			
			units = "metre",		
		},
		{
			name = "slow_movement",
			subPrototype = "projectile",
			spellPrototype = "spell_on_launch",
			valField = "aura_param",
			units = "percent_minus",
			negative = true,			
		},	
	},	
}

ItemTooltips[ ItemSubtype.AthlantaCone ] =
{
	tooltipParams = 
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,
	},
	
	descriptionParams = 
	{
		{
			name = "aura_range",
			spellPrototype	= "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype	= "spell",
			valField = "aura_param",
			units = "units",
		},	
		{
			name = "duration",
			spellPrototype	= "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "slow_movement",
			spellPrototype	= "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent_minus",
		},			
	},
}

ItemTooltips[ ItemSubtype.BarkArmor ] =    
{
	descriptionParams =
	{
		{
			name = "hull_dmg_resist",
			valField = "hull_resist_add",
			units = "units",
		},
		{
			name = "hull_regen_add",
			valField = "hull_regen_add",
			units = "units",
		},		
	},
}

ItemTooltips[ ItemSubtype.BarkCPU ] =    
{
	descriptionParams =
	{
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
			negative = true,
		},
		{
			name = "crit_chance",
			valField = "crit_chance_add",
			units = "percent",
		},		
	},
}

ItemTooltips[ ItemSubtype.AthlantaSoul ] =
{
	tooltipParams = 
	{
		ItemTooltip.cooldown,
		ItemTooltip.Module.energy_cost,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			spellPrototype	= "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "bonus_overcharge",
			spellPrototype	= "spell",
			valField = "death_rocket",
		formula = function( ... )
			local arg = { ... }
			local bonus_spell = Def[ arg[1] ].spell	
			return Spell[ bonus_spell ].aura_param
		end,
			units = "percent",
		},	
		{
			name = "bonus_duration",
			spellPrototype	= "spell",
			valField = "death_rocket",
		formula = function( ... )
			local arg = { ... }
			local bonus_spell = Def[ arg[1] ].spell	
			return Spell[ bonus_spell ].duration
		end,			
			units = "second",
		},			
	},
}

ItemTooltips[ ItemSubtype.DisMissile ] =    
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.emp,
		ItemTooltip.cooldown,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Rocket.flight_speed,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "range",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "hull_resist",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},
		{
			name = "helath_mod",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "alien_damage",
			valField = "alien_damage_coef",
			units = "percent",
		},		
	},
}

ItemTooltips[ ItemSubtype.CinquedeaPlasmaGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.energy_cost_per_second,
	},
	descriptionParams = 
	{
		{
			name = "energy_vampire",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "units",
		},	
	},
}

ItemTooltips[ ItemSubtype.CinquedeaAIM ] =
{
	tooltipParams =
	{
		ItemTooltip.Active.multishot.damage_emp,
		ItemTooltip.Active.multishot.angle_of_view,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "max_charge_time",
			valField = "max_charge_time",
			units = "second",
		},
		{
			name = "max_targets",
			valField = "max_targets",
			units = "pieces",
		},
		{
			name = "stun",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.CinquedeaBlackout ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.CinquedeaEng ] =
{
	descriptionParams =
	{
		{
			name = "strafe_speed_mul",
			valField = "strafe_speed_mul",
			units = "percent",
		},
		{
			name = "strafe_accel_mul",
			valField = "strafe_accel_mul",
			units = "percent",
		},		
	},
}

ItemTooltips[ ItemSubtype.CinquedeaCap ] =
{
	descriptionParams =
	{
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
		},
		{
			name = "shield_regen_mul",
			valField = "shield_regen_mul",
			units = "percent",
		},				
	},
}

ItemTooltips[ ItemSubtype.Carolingian_GuidedMissile ] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.kinetic,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Rocket.projectile.flight_range,
		ItemTooltip.Rocket.projectile.flight_speed,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		 {
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		 {
			name = "damage_add",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "huge_damage",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "units",
		},	
	},
}

ItemTooltips[ ItemSubtype.AtlantaCPU ] =
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},
		{
			name = "resist_dec",
			spellPrototype = "spell_on_special_activate",
			valField = "aura_param",
			units = "units",
		},	
		{
			name = "duration",
			spellPrototype = "spell_on_special_activate",
			valField = "duration",
			units = "units",
		},	
		{
			name = "range",
			spellPrototype = "spell_on_special_activate",
			valField = "target_range",
			units = "metre",
		}		
	},
}

ItemTooltips[ ItemSubtype.CarolCannon ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
		{
			name = "cooling",
			subPrototype = "projectile",
			spellPrototype = "spell_on_crit",
			valField = "duration",
			units = "second",
		},
	},	
}


ItemTooltips[ ItemSubtype.CarolDeadShot ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.thermal_large,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Rocket.volley.size,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
		
	},
	
	descriptionParams =
	{
		{
			name = "projectile_speed_mod",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "damage_mod",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},		
	},
}

ItemTooltips[ ItemSubtype.AceGun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.FakeShipBackstab ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "ttl",
			valField = "clones_ttl",
			units = "second",
		},
		{
			name = "range",
			spellPrototype = "additional_spell",
			valField = "teleport_range",
			units = "metre",
		},
	},
}	

ItemTooltips[ ItemSubtype.AceCPU ] =
{
	descriptionParams =
	{
		{
			name = "crit_damage_add",
			valField = "crit_damage_add",
			units = "percent",
		},
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
			formula = function( ... )
				local arg = { ... }
				return math.abs( arg[1] )
			end,
			negative = true,
		},
		{
			name = "damage_mul",
			valField = "damage_mul",
			units = "percent",
			negative = false,
		},		
	},
}

ItemTooltips[ ItemSubtype.AceEngine ] =
{
	descriptionParams =
	{
		{
			name = "speed",
			valField = "max_speed_percent",
			units = "percent",
		},
		{
			name = "cooldown_mod",
			spellPrototype = "spell_on_max_speed_plus",
			valField = "aura_param",
			units = "percent",
			negative = true,
		},
	},
}	

ItemTooltips[ ItemSubtype.AceFreezeMine ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ammo",
			valField = "ammo",
			units = "units",
		},
		{
			name = "damage",
			valField = "projectile",
			formula = function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 1 ] ]
				local mine = Def[ projectile.death_entity ]
				local blast = Def[ mine.explosion_blast_wave ]
				return blast.damage_thermal
			end,
			units = "units",
		},
		{
			name = "duration",
			subPrototype = "projectile",
			valField = "detonation_radius",
			formula = function( ... )
				local arg = { ... }
				return arg[1] / 4
			end,			
			units = "second",
		},	
		{
			name = "param",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
		},	
		{
			name = "ttl",
			valField = "projectile",
			formula = function( ... )
				local arg = { ... }
				local projectile = Def[ arg[ 1 ] ]
				local mine = Def[ projectile.death_entity ]
				return mine.time_to_live
			end,
			units = "second",
		},		
	},
}

ItemTooltips[ ItemSubtype.AtlantaCap ] =
{
	descriptionParams =
	{
		{
			name = "percent",
			valField = "max_energy_percent",
			units = "percent",
		},
		{
			name = "aura_param",
			spellPrototype = "spell_on_max_energy_minus",
			valField = "aura_param",
			units = "percent",
			--negative = true,
		},
	},
}	

ItemTooltips[ ItemSubtype.CarolShield ] =
{
	descriptionParams =
	{
		{
			name = "percent",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "shield_resist_dec",
			valField = "shield_resist_emp_add",
			units = "units",
			--negative = true,
		},
	},
}	

ItemTooltips[ ItemSubtype.CarolHull ] =
{
	descriptionParams =
	{
		{
			name = "percent",
			valField = "max_health_percent",
			units = "percent",
		},
		{
			name = "shield_regen",
			spellPrototype = "spell_on_max_health_minus",
			valField = "aura_param",
			units = "units",
			--negative = true,
		},
	},
}	

ItemTooltips[ ItemSubtype.GlassAttraction ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.emp_large,
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
		
	},
	
	descriptionParams =
	{
		{
			name = "aura_range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.Glass_Disintegrator ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.damage.thermal_large,

		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,		
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	descriptionParams =
	{
		{
			name = "damage_thermal",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * 2
			end,
			units = "units",
		},		
	},	
}

ItemTooltips[ ItemSubtype.Glass_BlackoutGenerator ] =
{
	tooltipParams =
	{
	--	ItemTooltip.Special.blackout.range,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},		
	},
}

ItemTooltips[ ItemSubtype.UBallLaser ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{

	},
}

ItemTooltips[ ItemSubtype.UballFWarrior ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.projectile_speed.min_max,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{

	},
}

ItemTooltips[ ItemSubtype.UballTimeBoost ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.work_time,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.energy_cost_per_second,
		ItemTooltip.cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "time_bonus",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent",
		},
		-- {
			-- name = "aura_param",
			-- spellPrototype = "additional_spell",
			-- valField = "aura_param",
			-- units = "units",
		-- },
	},
}

ItemTooltips[ ItemSubtype.UballRocketRing ] =
{
	tooltipParams = 
	{
		ItemTooltip.Weapon.damage.kinetic_large2,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
		ItemTooltip.Module.warhead.flight_speed,
		ItemTooltip.Module.warhead.flight_range,
		ItemTooltip.Module.warhead.flight_rot_speed,
	},
	
	descriptionParams = 
	{
		{
			name = "damage",
			valField = "damage_kinetic",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 12
			end,
			units = "units",
		},
		{
			name = "child_rockets",
			subPrototype = "projectile",
			valField = "child_rockets.max_rockets_per_target",
			units = "units",
		},
		{
			name = "range",
			subPrototype = "projectile",
			valField = "child_rockets.direct_range",
			units = "metre",
		},
		-- {
			-- name = "range",
			-- subPrototype = "projectile",
			-- valField = "child_rockets",
		-- formula = function( ... )
			-- local arg = { ... }
			-- local rocket = arg[1].rocket
			-- return Def[rocket].max_range
		-- end,
			-- units = "metre",
		-- },
	},
}

ItemTooltips[ ItemSubtype.UballShield ] =
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "shield_max",
			valField = "max_shield_percent",
			units = "percent",
		},
		{
			name = "shield",
			valField = "shield_max_mul",
			units = "percent",
		},		
		{
			name = "range",
			spellPrototype = "spell_on_max_shield_minus",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage_emp",
			spellPrototype = "spell_on_max_shield_minus",
			valField = { "aura_param", "duration", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2] + arg[1]
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.UballHull ] =
{

	descriptionParams =
	{
		{
			name = "hull_resist_dec",
			valField = "hull_resist_kinetic_add",
			units = "units",
		},
		{
			name = "accel_mul",
			valField = "decel_afterburning_mul ",
			units = "percent",
		},
	},
}

ItemTooltips[ ItemSubtype.AthlantaBall ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.AthlantaRail ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic_min_max_charge,
		ItemTooltip.Weapon.damage.kinetic_min_max_charge,
		ItemTooltip.Weapon.fire_rate.min_max_charge,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.min_max_charge,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
		descriptionParams =
	{
		{
			name = "aura_param",
			valField = "charge_levels[2].projectile",
			formula = function( ... )
				local arg = { ... }
				return Spell[ Def[ arg[1] ].spell ].aura_param
			end,
			units = "units",
		},
	},
}

ItemTooltips[ ItemSubtype.AthlantaBlaster ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
		descriptionParams =
	{
		{
			name = "aura_param",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},		
	},		
}

ItemTooltips[ ItemSubtype.SaturnChargableGun ] =    
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp_min_max_charge2,
		ItemTooltip.Weapon.damage.emp_min_max_charge2,
		ItemTooltip.Weapon.fire_rate.min_max_charge,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.min_max_charge,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},

	descriptionParams =
	{
		{
			name = "range",
			valField = "charge_levels[2].projectile",
			formula = function( ... )
				local arg = { ... }
				return Spell[ Def[ arg[1] ].spell_on_launch ].aura_range
			end,
			units = "metre",
		},
		{
			name = "damage_emp",
			valField = "charge_levels[2].projectile",
			formula = function( ... )
				local arg = { ... }
				return Spell[ Def[ arg[1] ].spell_on_launch ].aura_param  * 5
			end,
			units = "units",
		},		
	},
}

ItemTooltips[ ItemSubtype.SaturnCharge1 ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "resist",
			spellPrototype = "charge_spell_on_damage",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "point_duration",
			spellPrototype = "charge_spell_on_damage",
			valField = "additional_auras[1].duration",
			units = "second",
		},			
		{
			name = "damage_mul",
			spellPrototype = "charge_spell_on_damage",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},	
		{
			name = "point",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "range",
			spellPrototype = "additional_spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "damage_kinetic",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},	
		{
			name = "damage_kinetic_max",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 11
			end,			
		},	
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},			
	},
}

ItemTooltips[ ItemSubtype.SaturnCharge2 ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "resist",
			spellPrototype = "charge_spell_on_damage",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "damage_mul",
			spellPrototype = "charge_spell_on_damage",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},	
		{
			name = "point_duration",
			spellPrototype = "charge_spell_on_damage",
			valField = "additional_auras[1].duration",
			units = "second",
		},		
		{
			name = "point",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "damage_module_active",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "damage_module_active_max",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 11
			end,
			units = "percent",			
		},	
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},			
	},
}

ItemTooltips[ ItemSubtype.SaturnCharge3 ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "damage",
			valField = "charge_damage",
			units = "units",
		},
		{
			name = "resist",
			spellPrototype = "charge_spell_on_damage",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "damage_mul",
			spellPrototype = "charge_spell_on_damage",
			valField = "additional_auras[2].aura_param",
			units = "percent",
		},	
		{
			name = "point_duration",
			spellPrototype = "charge_spell_on_damage",
			valField = "additional_auras[1].duration",
			units = "second",
		},			
		{
			name = "point",
			spellPrototype = "charge_spell_on_damage",
			valField = "max_stacks",
			units = "units",
		},
		{
			name = "damage_mul_2",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "damage_mul_2_max",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 11
			end,
			units = "percent",			
		},	
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},			
	},
}

ItemTooltips[ ItemSubtype.SaturnMine ] = 
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal_plain,
		ItemTooltip.Rocket.projectile.damage_range,
		ItemTooltip.Module.huge.module_health,
		ItemTooltip.Module.huge.module_repair_time,
		ItemTooltip.Module.huge.damage_to_host,		
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
		
	},
	
	descriptionParams =
	{
		{
			name = "ttl",
			valField = "max_range",
			units = "second",
		},
		{
			name = "range",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			units = "metre",
		},
		{
			name = "range2",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "aura_range",
			formula = function( ... )
				local arg = { ... }
				return arg[1] / 2
				end,			
			units = "metre",
		},		
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.SaturnHull ] = 
{
	
	descriptionParams =
	{
		{
			name = "hull_regen",
			spellPrototype = "spell_on_no_firing",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "time",
			valField = "cooldown",
			units = "second",
		},
	},
}	

ItemTooltips[ ItemSubtype.SaturnEngine ] = 
{
	
	descriptionParams =
	{
		{
			name = "bonus_1",
			valField = "max_speed_mul",
			units = "percent",
		},
		{
			name = "bonus_2",
			spellPrototype = "spell_on_special_activate",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "duration",
			spellPrototype = "spell_on_special_activate",
			valField = "duration",
			units = "second",
		},		
	},
}	

ItemTooltips[ ItemSubtype.CorV2_SmartRL] = -- КорЛегибус пушка  
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "aura_range",
			spellPrototype = "spell_on_hit",
			valField = "aura_range",
			units = "metre",
		},	
		{
			name = "additional_damage",
			spellPrototype = "spell_on_hit",
			valField = "aura_param",
			units = "percent",
		},		
	},	
}

ItemTooltips[ ItemSubtype.CorV2Clone ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "ttl",
			valField = "clones_ttl",
			units = "second",
		},
		{
			name = "damage_emp",
			subPrototype = "death_blast_wave_clone",
			valField = "damage_emp",
			units = "units",
		},
		{
			name = "aoe_range",
			spellPrototype = "spell_on_clone_death",
			valField = "aura_range",
			units = "metre",
		},	
		{
			name = "duration",
			spellPrototype = "spell_on_clone_death",
			valField = "duration",
			units = "second",
		},
		{
			name = "slow_movement",
			spellPrototype = "spell_on_clone_death",
			valField = "aura_param",
			units = "percent_minus",
		},	
		{
			name = "speed_max",
			spellPrototype = "deactivate_spell",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "speed_max_duration",
			spellPrototype = "deactivate_spell",
			valField = "duration",
			units = "second",
		},			
	},
}	

ItemTooltips[ ItemSubtype.CorV2_TPAlly ] =
{
	tooltipParams = 
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "jump_range",
			spellPrototype = "additional_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].teleport_range
			end,			
			units = "metre",
		},
		{
			name = "param",
			spellPrototype = "additional_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "additional_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},			
	},
}	

ItemTooltips[ ItemSubtype.CorV2CPU ] =
{
	descriptionParams =
	{
		{
			name = "crit_chance",
			valField = "crit_chance_add ",
			units = "percent",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_kill",
			valField = "duration",
			units = "second",
		},	
		{
			name = "bonus_param",
			spellPrototype = "spell_on_kill",
			valField = "aura_param",
			units = "percent",
		},		
	},
}

ItemTooltips[ ItemSubtype.CorV2Cap ] =
{
	descriptionParams =
	{
		{
			name = "shield_min",
			valField = "max_shield_percent ",
			units = "percent",
		},
		{
			name = "colldown_mod",
			spellPrototype = "spell_on_max_shield_minus",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "hull_min",
			valField = "max_health_percent ",
			units = "percent",
		},
		{
			name = "colldown_mod2",
			spellPrototype = "spell_on_max_health_minus",
			valField = "aura_param",
			units = "percent",
			negative = true,
		},	
	},
}

ItemTooltips[ ItemSubtype.AthlantaDroneS ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.entity_ttl,
		ItemTooltip.cooldown,
		ItemTooltip.energy_cost,
	},
	descriptionParams =
	{
		{
			name = "range",
			subPrototype	= "activate_entity",
			spellPrototype	= "active_spell",
			valField = "aura_range",
			units = "metre",
		},		
	},	
}

ItemTooltips[ ItemSubtype.AthlantaDroneM ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.entity_ttl,
		ItemTooltip.cooldown,
		ItemTooltip.energy_cost,
	},	
	descriptionParams =
	{
		{
			name = "range",
			subPrototype	= "activate_entity",
			spellPrototype	= "active_spell",
			valField = "aura_range",
			units = "metre",
		},	
		{
			name = "speed_dec",
			subPrototype	= "activate_entity",
			spellPrototype	= "active_spell",
			valField = "aura_param",
			units = "percent",
		},			
	},
}	

ItemTooltips[ ItemSubtype.AthlantaDroneL ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.range,		
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Drone.health,
		ItemTooltip.Drone.entity_ttl,
		ItemTooltip.cooldown,
		ItemTooltip.energy_cost,
	},
	
	descriptionParams =
	{
		{
			name = "range",
			subPrototype	= "activate_entity",
			spellPrototype	= "active_spell",
			valField = "aura_range",
			units = "metre",
		},	
		{
			name = "damage",
			subPrototype	= "activate_entity",
			spellPrototype	= "active_spell",
			valField = "aura_param",
			units = "units",
		},			
	},
}

ItemTooltips[ ItemSubtype.GreenReconShotgun ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic_charge,
		ItemTooltip.Weapon.charge,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "energy_cost_per_shot",
			valField = "shot_energy_cost",
			units = "units",
		},
	},	
}

ItemTooltips[ ItemSubtype.GreenReconBlaster ] =    
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "additional_damage",
			spellPrototype	= "spell_on_hit",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "additional_damage_max",
			spellPrototype	= "spell_on_hit",
			valField = { "aura_param", "max_stacks" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},		
	},	
}

ItemTooltips[ItemSubtype.GreenReconMine] =
{
	tooltipParams =
	{
		ItemTooltip.Explosions.damage.thermal,
		ItemTooltip.cooldown,
		ItemTooltip.Minefield.ttl,
		ItemTooltip.Rocket.detonation_radius,
		ItemTooltip.Explosions.damage.range,
		ItemTooltip.Explosions.holder_size,
		ItemTooltip.Explosions.empty_cooldown,
	},

	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype	= "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "range",
			spellPrototype	= "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "damage_sm",
			spellPrototype	= "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,	
			units = "percent",
		},	
		{
			name = "damage_l",
			spellPrototype	= "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},	
		{
			name = "damage_h",
			spellPrototype	= "spell",
			valField = "spells[3]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},	
		{
			name = "damage_bot",
			spellPrototype	= "spell",
			valField = "spells[4]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},		
	},
}

ItemTooltips[ ItemSubtype.GreenReconPlasmaWeb ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.aura_additional,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "range",
			spellPrototype = "additional_spell",
			valField = "target_range",
			units = "metre",
		},
		{
			name = "damage_sm",
			spellPrototype	= "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		{
			name = "damage_l",
			spellPrototype	= "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},	
		{
			name = "damage_h",
			spellPrototype	= "spell",
			valField = "spells[3]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent",
		},
		{
			name = "damage_bot",
			spellPrototype	= "spell",
			valField = "spells[4]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},		
	},
}

ItemTooltips[ ItemSubtype.GreenReconHarpoon ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "param_max",
			subPrototype = "projectile",
			spellPrototype = "spell",
			valField = { "aura_param_add", "duration" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "percent",
		},		
	},
}

ItemTooltips[ ItemSubtype.GreenReconFetters ] =
{
	tooltipParams =
	{
		ItemTooltip.Spell.range.target_additional,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "range",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_range
			end,
			units = "metre",
		},
		{
			name = "damage",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "units",
		},	
		{
			name = "damage_max",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * 5
			end,
			units = "units",
		},
		{
			name = "slow_mov",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param
			end,
			units = "percent_minus",
		},	
		{
			name = "slow_mov2",
			spellPrototype = "spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].aura_param * 5
			end,
			units = "percent_minus",
		},		
		{
			name = "range2",
			spellPrototype = "spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].mod_range
			end,
			units = "metre",
		},	
		{
			name = "heal",
			spellPrototype = "additional_spell",
			valField = "aura_param",
			units = "units",
		},
		{
			name = "heal_max",
			spellPrototype = "additional_spell",
			valField = { "mod_max", "aura_param" },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "units",
		},		
	},
}

ItemTooltips[ ItemSubtype.GREnergyLance ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "work_time",
			valField = "work_time",
			units = "second",
		},
		{
			name = "lance_width",
			valField = "damage_box_size.x",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "metre",
		},
		{
			name = "lance_length",
			valField = "damage_box_size.z",
			formula = function( ... )
				local arg = { ... }
				return arg[1] * 2
			end,
			units = "metre",
		},
		{
			name = "damage_thermal",
			valField = "damage_thermal",
			units = "units",
		},	
		{
			name = "speed_dec",
			spellPrototype = "spell",			
			valField = "aura_param",
			units = "percent_minus",
			negative = true,
		},	
	},
}	

ItemTooltips[ ItemSubtype.GRChameleon ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.Module.hull_cost_per_second_1,
		ItemTooltip.cooldown,
	},
		descriptionParams =
	{
		{
			name = "fast_mov",
			spellPrototype = "spell",
			valField = "additional_auras[1].aura_param",
			units = "percent",
		},	
	},	
}	

ItemTooltips[ ItemSubtype.GreenReconBoom ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,		
		ItemTooltip.Module.energy_cost,
		ItemTooltip.Module.hull_cost,
		ItemTooltip.cooldown,
	},
		descriptionParams =
	{
		{
			name = "max_range",
			valField = "max_range",
			units = "metre",
		},
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},		
		{
			name = "range",
			spellPrototype = "spell_on_hit",
			valField = "aura_range",
			units = "metre",
		},			
	},		
}

ItemTooltips[ ItemSubtype.GREmergrncy ] =
{

		descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "emergency_barrier_spell",
			valField = "duration",
			units = "second",
		},	
		{
			name = "range",
			spellPrototype = "emergency_barrier_spell",
			valField = "aura_range",
			units = "metre",
		},	
		{
			name = "cooldown",
			valField = "cooldown",
			units = "second",
			negative = true,
		},			
	},		
}

ItemTooltips[ ItemSubtype.GRForceField ] =
{
		descriptionParams =
	{
		{
			name = "resist_add",
			valField = "shield_resist_emp_add",
			units = "units",
		},	
		{
			name = "resist_bonus",
			spellPrototype = "focus_spell",
			valField = "aura_param",
			units = "units",
		},	
		{
			name = "resist_max",
			spellPrototype = "focus_spell",
			valField = { "aura_param", "aura_param_stages", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2][ #arg[2] ]
			end,
			units = "units",
		},		
	},		
}

ItemTooltips[ ItemSubtype.GRJumpDrive ] =
{
	tooltipParams =
	{
		ItemTooltip.cooldown,
	},
		descriptionParams =
	{
		{
			name = "jump_range",
			spellPrototype = "double_down_spell",
			valField = "spells[1]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].teleport_range
			end,
			units = "metre",
		},	
		{
			name = "duration",
			spellPrototype = "double_down_spell",
			valField = "spells[2]",
			formula = function( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},			
	},		
}


------------------------------------------------------ BRAWL

ItemTooltips[ ItemSubtype.FireGunBallBRAWL ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.thermal,
		ItemTooltip.Weapon.damage.thermal,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			--subPrototype = "projectile",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.FreezeGunBallBRAWL ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			--subPrototype = "projectile",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.HealGunBallBRAWL ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion_min_max,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			--subPrototype = "projectile",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
	},
}

ItemTooltips[ ItemSubtype.AsteridGunBallBRAWL] = 
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Rocket.projectile.flight_rot_speed,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.GravyBlockBRAWL ] =
{
	tooltipParams =
	{

		ItemTooltip.cooldown,

	},
	
	descriptionParams = 
	{
		{
			name = "duration",
			subPrototype = "death_entity",
			spellPrototype = "spell_on_ttl",
			valField = "duration",
			units = "second",
		},
	},
}	

ItemTooltips[ ItemSubtype.BallWarp ] =
{
	tooltipParams = 
	{
		--ItemTooltip.Module.energy_cost,
		-- ItemTooltip.Spell.duration.plain,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "range_min",
			spellPrototype = "spell_on_equip",
			valField = "target_range",		
			units = "metre",
		},
	},
}	

ItemTooltips[ ItemSubtype.FakeShipBackstabBRAWL ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell",
			valField = "duration",
			units = "second",
		},
		{
			name = "ttl",
			valField = "clones_ttl",
			units = "second",
		},
		{
			name = "range",
			spellPrototype = "additional_spell",
			valField = "teleport_range",
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.StoneShieldBRAWL ] =
{
	tooltipParams =
	{

		ItemTooltip.cooldown,
	},
	
	descriptionParams =
	{
		{
			name = "duration1",
			spellPrototype = "additional_spell",
			valField = "additional_auras[1].duration",
			units = "second",
		},
		{
			name = "duration2",
			spellPrototype = "additional_spell",
			valField = "additional_auras[2].duration",
			units = "second",
		},
		{
			name = "duration3",
			spellPrototype = "additional_spell",
			valField = "duration",
			units = "second",
		},		
	},
}

ItemTooltips[ ItemSubtype.FireArrowBRAWL ] =
{
	tooltipParams = 
	{
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.cooldown,
		
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "range",
			subPrototype = "projectile",
			valField = "death_entity_on_static_hit",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].radius
		end,	
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.FreezingArrowBRAWL ] =
{
	tooltipParams = 
	{
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.cooldown,
		
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "duration",
			units = "second",
		},
		{
			name = "range",
			subPrototype = "projectile",
			valField = "death_entity_on_static_hit",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].radius
		end,	
			units = "metre",
		},
	},
}

ItemTooltips[ ItemSubtype.HealArrowBRAWL ] =
{
	tooltipParams = 
	{
		ItemTooltip.Rocket.flight_range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.cooldown,
		
	},
	
	descriptionParams =
	{
		{
			name = "duration",
			spellPrototype = "spell_on_hit",
			valField = "spells[2]",
			formula = function ( ... )
				local arg = { ... }
				return Spell[ arg[1] ].duration
			end,
			units = "second",
		},
		{
			name = "range",
			subPrototype = "projectile",
			valField = "death_entity_on_static_hit",
		formula = function( ... )
			local arg = { ... }
			return Def[ arg[1] ].radius
		end,	
			units = "metre",
		},
	},
}

--------------------------------- END BRAWL

ItemTooltips[ ItemSubtype.ChaosCanon ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.kinetic,
		ItemTooltip.Weapon.damage.kinetic,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.crit.chance,
		ItemTooltip.Weapon.crit.damage,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.full_heat_cooldown,
	},
}

ItemTooltips[ ItemSubtype.AB2Stuka ] =
{
	tooltipParams =
	{
		ItemTooltip.Weapon.dps.emp,
		ItemTooltip.Weapon.damage.emp,
		ItemTooltip.Weapon.fire_rate.plain,
		ItemTooltip.Weapon.projectile_speed.plain,
		ItemTooltip.Weapon.range,
		ItemTooltip.Weapon.dispersion,
		ItemTooltip.Weapon.rot_speed,
		ItemTooltip.Module.duration,
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
		descriptionParams =
	{
		{
			name = "fire_rate_mul",
			subPrototype = { "active_projectile", nil },
			valField = { "fire_rate_mul" },
			units = "units",
		},	
		{
			name = "duration",
			--subPrototype = "duration",
			valField = "duration",
			units = "second",
		},
		{
			name = "aure_param",
			subPrototype = "active_projectile",
			spellPrototype = "spell",
			valField = "aura_param",
			units = "percent_minus",
		},	
		{
			name = "aure_param_mod",
			subPrototype = "active_projectile",
			spellPrototype = "spell",
			valField = { "aura_param", "max_stacks", },
			formula = function( ... )
				local arg = { ... }
				return arg[1] * arg[2]
			end,
			units = "percent_minus",
		},			
	},	
}	

ItemTooltips[ ItemSubtype.ChaosFreeFly ] =
{
	tooltipParams =
	{
		ItemTooltip.Module.energy_cost,
		ItemTooltip.cooldown,
	},
		descriptionParams =
	{
		{
			name = "damage_mod",
			spellPrototype = "spell0",
			valField = "aura_param",
			units = "percent",
		},		
		{
			name = "fire_rate_dec",
			spellPrototype = "spell0",
			valField = "additional_auras[1].aura_param",
			formula = function( ... )
				local arg = { ... }
				return math.abs( arg[1] )
			end,
			units = "percent_minus",
		},	
		{
			name = "fast_movement",
			spellPrototype = "spell1",
			valField = "aura_param",
			units = "percent",
		},		
		{
			name = "slow_manevour",
			spellPrototype = "spell1",
			valField = "additional_auras[1].aura_param",
			units = "percent_minus",
		},			
	},	
}

ItemTooltips[ ItemSubtype.ChaosHull ] =
{
		descriptionParams =
	{
		{
			name = "cooldown",
			spellPrototype = "spell_on_max_health_minus",
			valField = "aura_param",
			units = "percent_minus",
			negative = true,
		},	
		{
			name = "rocket_cooldown",
			valField = "rocket_cooldown_coef_mul",
			units = "percent",
			negative = true,
		},	
		{
			name = "health",
			valField = "max_health_percent",
			units = "percent",

		},			
	},	
}

ItemTooltips[ ItemSubtype.ChaosCPU ] =
{
		descriptionParams =
	{
		{
			name = "projectile_speed",
			spellPrototype = "spell_on_equip",
			valField = "aura_param",
			units = "percent",
		},	
		{
			name = "crit_chance_add",
			valField = "crit_chance_add",
			units = "percent",
		},	
		{
			name = "crit_damage_add",
			valField = "crit_damage_add",
			units = "percent",
		},			
	},	
}