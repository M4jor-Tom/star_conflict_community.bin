
-- 
Def.ModuleShield_Base =
{
	class			= "SpaceShipModule",
	in_editor		= false,
	
}

designers.shield_grades =
	{
		{ "ModuleShield_Small_Mk1", 0 },
		{ "ModuleShield_Small_Mk2", 5000 },
		{ "ModuleShield_Small_Mk3", 50000 },
		{ "ModuleShield_Small_Mk4", 100000 },
		{ "ModuleShield_Small_Mk5", 200000 },
		{ "ModuleShield_Small_Mk6", 300000 },
		{ "ModuleShield_Small_Mk7", 500000 },
		{ "ModuleShield_Small_Mk8", 700000 },
	}



-- генерим "шип специфик" спелл
function GenerateShipUniqueShield( ship_name, params, common_params, model )
	local res = sys.new( designers.shield_grades ) -- было armor_grades, но это неправильно
	for i, v in pairs( res ) do
		local module_name = "ModuleShield_" .. ship_name .. "_Mk" .. tostring( i ) 
		Def[ module_name ] = sys.new( Def[ v[ 1 ] ] ) --sys.new( Def["ModuleArmor_Small_Mk1"] )
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

-- GUARD
designers.shield_grades_guard = GenerateShipUniqueShield( "Guard", { spell_on_no_firing = "GuardHeal", cooldown = 5, item_subtype = ItemSubtype.GuardArmourRegen } ) 

-- SC-118692 Корабль Лего
designers.Lego_shield_grades = GenerateShipUniqueShield( 
	"LegoS", 
	{},
	{ --параметры для отстрела детали и спелов (пока деталь жива?)(возможно не будет работать одновременно с заполнением предыдущей скобки, не проверял)
		signature		= ai.Signature.TINY,
		physics 		= { mass = 1, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		death_wreck  	= "models/ships/race_1/l/race1_l_helios/race1_l_helios_wings_right_damage",

		cooldown 	= 30,
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
		health 			= 2000,
		health_regen 	= 33.3333,  --модуль  восстанавливаться по health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 2500,
		item_subtype			= ItemSubtype.HeliosWingR,
		activate_sound = "sound/gadgets/ReverseThruster_prepare",		
		double_right_spell 	= "Spell_HeliosWingstart_r",		
		death_spell		= "Spell_HeliosWingDeath_r",
	--	spell_on_equip = "Spell_WingBuff",
	},
	"models/ships/race_1/l/race1_l_helios/race1_l_helios_wings_right" --модель детали
) 


--[[ 
--------------------------------------------------------------------------------------------------
--    SHIELD UPGRADES LINES
--------------------------------------------------------------------------------------------------
designers.shield_small_grades =
	{
		{ "ModuleShield_Small_Mk1", 0 },
		{ "ModuleShield_Small_Mk2", 5000 },
		{ "ModuleShield_Small_Mk3", 50000 },
		{ "ModuleShield_Small_Mk4", 100000 },
		{ "ModuleShield_Small_Mk5", 200000 },
		{ "ModuleShield_Small_Mk6", 300000 },
	}
designers.shield_small_grades_t1 =
	{
		designers.shield_small_grades[1],
	}
designers.shield_small_grades_t2 =
	{
		designers.shield_small_grades[1],
		designers.shield_small_grades[2],
	}
designers.shield_small_grades_t3 =
	{
		designers.shield_small_grades[1],
		designers.shield_small_grades[2],
		designers.shield_small_grades[3],
	}
designers.shield_small_grades_t4 =
	{
		designers.shield_small_grades[1],
		designers.shield_small_grades[2],
		designers.shield_small_grades[3],
		designers.shield_small_grades[4],
	}
designers.shield_small_grades_t5 =
	{
		designers.shield_small_grades[1],
		designers.shield_small_grades[2],
		designers.shield_small_grades[3],
		designers.shield_small_grades[4],
		designers.shield_small_grades[5],
	}

designers.shield_medium_grades =
	{
		{ "ModuleShield_Medium_Mk1", 0 },
		{ "ModuleShield_Medium_Mk2", 5500 },
		{ "ModuleShield_Medium_Mk3", 52000 },
		{ "ModuleShield_Medium_Mk4", 105000 },
		{ "ModuleShield_Medium_Mk5", 210000 },
		{ "ModuleShield_Medium_Mk6", 320000 },
	}
	
designers.shield_medium_grades_t1 =
	{
		designers.shield_medium_grades[1],
	}
designers.shield_medium_grades_t2 =
	{
		designers.shield_medium_grades[1],
		designers.shield_medium_grades[2],
	}
designers.shield_medium_grades_t3 =
	{
		designers.shield_medium_grades[1],
		designers.shield_medium_grades[2],
		designers.shield_medium_grades[3],
	}
designers.shield_medium_grades_t4 =
	{
		designers.shield_medium_grades[1],
		designers.shield_medium_grades[2],
		designers.shield_medium_grades[3],
		designers.shield_medium_grades[4],
	}
designers.shield_medium_grades_t5 =
	{
		designers.shield_medium_grades[1],
		designers.shield_medium_grades[2],
		designers.shield_medium_grades[3],
		designers.shield_medium_grades[4],
		designers.shield_medium_grades[5],
	}

designers.shield_large_grades =
	{
		{ "ModuleShield_Large_Mk1", 0 },
		{ "ModuleShield_Large_Mk2", 6000 },
		{ "ModuleShield_Large_Mk3", 54000 },
		{ "ModuleShield_Large_Mk4", 112000 },
		{ "ModuleShield_Large_Mk5", 220000 },
		{ "ModuleShield_Large_Mk6", 350000 },
	}
	
designers.shield_large_grades_t1 =
	{
		designers.shield_large_grades[1],
	}
designers.shield_large_grades_t2 =
	{
		designers.shield_large_grades[1],
		designers.shield_large_grades[2],
	}
designers.shield_large_grades_t3 =
	{
		designers.shield_large_grades[1],
		designers.shield_large_grades[2],
		designers.shield_large_grades[3],
	}
designers.shield_large_grades_t4 =
	{
		designers.shield_large_grades[1],
		designers.shield_large_grades[2],
		designers.shield_large_grades[3],
		designers.shield_large_grades[4],
	}
designers.shield_large_grades_t5 =
	{
		designers.shield_large_grades[1],
		designers.shield_large_grades[2],
		designers.shield_large_grades[3],
		designers.shield_large_grades[4],
		designers.shield_large_grades[5],
	}


 ]]