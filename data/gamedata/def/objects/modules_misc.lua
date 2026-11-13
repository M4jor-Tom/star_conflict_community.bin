--
Def.Module_ComputerBase =
{
	inherit			= "SpaceShipModule",
	module_type		= ai.ModuleType.CPU,
	class_mask		= ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.LARGE,
	
	lock_time		= 3.5,

	-- если цель не видна на радаре, но мы ее видим визуально то можем залочить, дальность лока ship_maxViewDist * long_range_lock_dist_mul
	long_range_lock_dist_mul = 6.0,
	-- во сколько раз дольше будет происходть лок для далеких целей
	long_range_lock_time_mul = 1.5,

	vision_radius	= 350*0.66, --в рамках сжимания пространства на 0.66 
	vision_offset	= 275*0.66, --в рамках сжимания пространства на 0.66 
	
	ui_name			= "Electronic Computer",
	ui_name_long	= "Electronic Computer",
}

--------------------------------------------------------------------------------------------------
--    COMPUTER UPGRADES LINE
--------------------------------------------------------------------------------------------------
designers.cpu_small_grades =
	{
		{ "Module_Computer_Small_Mk1", 0 },
		{ "Module_Computer_Small_Mk2", 5000 },
		{ "Module_Computer_Small_Mk3", 50000 },
		{ "Module_Computer_Small_Mk4", 100000 },
		{ "Module_Computer_Small_Mk5", 150000 },
		{ "Module_Computer_Small_Mk6", 300000 },
	}
	
designers.cpu_medium_grades =
	{
		{ "Module_Computer_Medium_Mk1", 0 },
		{ "Module_Computer_Medium_Mk2", 5000 },
		{ "Module_Computer_Medium_Mk3", 50000 },
		{ "Module_Computer_Medium_Mk4", 100000 },
		{ "Module_Computer_Medium_Mk5", 150000 },
		{ "Module_Computer_Medium_Mk6", 300000 },
	}
	
designers.cpu_large_grades =
	{
		{ "Module_Computer_Large_Mk1", 0 },
		{ "Module_Computer_Large_Mk2", 5000 },
		{ "Module_Computer_Large_Mk3", 50000 },
		{ "Module_Computer_Large_Mk4", 100000 },
		{ "Module_Computer_Large_Mk5", 150000 },
		{ "Module_Computer_Large_Mk6", 300000 },
	}

designers.cpu_green_grades =
	{
		{ "Module_Computer_Medium_Mk1", 0 },
		{ "Module_Computer_Medium_Mk1", 5000 },
		{ "Module_Computer_Medium_Mk1", 50000 },
		{ "Module_Computer_Medium_Mk1", 100000 },
		{ "Module_Computer_Medium_Mk1", 150000 },
		{ "Module_Computer_Medium_Mk1", 300000 },
	}
	
	 
-- генерим "шип специфик" спелл
function GenerateShipUniqueCpu( grades_table, ship_name, params, common_params, model )

	local res = sys.new( grades_table )
	for i, v in pairs( res ) do
		local module_name = "Module_Computer_" .. ship_name .. "_Mk" .. tostring( i ) 
		Def[ module_name ] = sys.new( Def[ v[ 1 ] ] )
		if params and type( params ) == "table" then
			for i1, v1 in pairs( params ) do
				Def[ module_name ][i1] = v1
			end
		end
		v[ 1 ] = module_name

		--параметры для отсреливаемости детали
		if common_params then
			for i_common, v_common in pairs( common_params ) do
				Def[module_name][i_common] = v_common
			end
		end
		
		if model then
			Def[module_name].model = model
		end	
	end
	return res
end

designers.Lego_cpu_grades = GenerateShipUniqueCpu( 
	designers.cpu_small_grades, --наследуемая таблица грейдов
	"LegoC", --уникальное имя
	{},
	{ --параметры для отстрела детали и спелов (пока деталь жива?)(возможно не будет работать одновременно с заполнением предыдущей скобки, не проверял)
		signature		= ai.Signature.TINY,
		physics 		= { mass = 1, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		death_wreck  	= "models/ships/race_1/l/race1_l_helios/race1_l_helios_bottom_damage",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
		-- children =
		-- {
			-- { effect = "particles/ships/r2_h_relic_cap_fx", },
		-- },
		health 			= 5000,
		health_regen 	= 83.3333,  --модуль  восстанавливаться по health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 3000,
		item_subtype			= ItemSubtype.HeliosSpecialBuff,
		spell_on_equip = "Spell_HeliosDisintegratorBuffMax",
		--death_spell		= "Spell_Helios_ModuleOff",
	},
	"models/ships/race_1/l/race1_l_helios/race1_l_helios_bottom" --модель детали
) 

-- designers.Lego_cpu_grades = GenerateShipUniqueCpu(
	-- "models/ships/race_1/l/race1_l_helios/race1_l_helios_cap" --model name
	-- designers.capacitor_large_race1_grades, --base table
	-- "race3_l_srike_cpu", --short_name
-- )