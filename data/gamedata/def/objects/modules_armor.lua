
-- 
Def.ModuleArmor_Base =
{
	class			= "SpaceShipModule",
	in_editor		= false,
}

designers.armor_grades =
	{
		{ "ModuleArmor_Small_Mk1", 0 },
		{ "ModuleArmor_Small_Mk2", 5000 },
		{ "ModuleArmor_Small_Mk3", 50000 },
		{ "ModuleArmor_Small_Mk4", 100000 },
		{ "ModuleArmor_Small_Mk5", 200000 },
		{ "ModuleArmor_Small_Mk6", 300000 },
		{ "ModuleArmor_Small_Mk7", 500000 },
		{ "ModuleArmor_Small_Mk8", 700000 },
	}
--------------------------------------------------------------------------------------------------
--    HULL Unique spells
--------------------------------------------------------------------------------------------------
-- генерим "шип специфик" спелл
function GenerateShipUniqueArmor( ship_name, params, common_params, model )
	local res = sys.new( designers.armor_grades )
	for i, v in pairs( res ) do
		local module_name = "ModuleArmor_" .. ship_name .. "_Mk" .. tostring( i ) 
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

--[[ function funny()
	r = {}
	m = {}
	m[1] = math.random(2) - 1
	m[2] = math.random(2) - 1
	for i = 3, 1000000 do
		m[i] = math.random(2) - 1
		label = tostring( m[i-2]) .. tostring( m[i-1]) .. tostring( m[i])
		r[label] = r[label] and r[label] + 1 or 1
	end
	dprint(r)
end
 ]]

-- дамагающа€ аура перед рипером

designers.armor_grades_reaper = GenerateShipUniqueArmor( "Reaper", { aura_target_offset = Vec3( 0, 0, -13.5 ), spell_on_equip = "Kukan", spell_on_max_speed_plus = "FederationCritBuffOnMovement", max_speed_percent=0.9, item_subtype = ItemSubtype.ReaperArmour } ) -- ModuleArmor_Reaper_Mk1

-- тоолкалки стеклянных фрегатов

designers.armor_grades_glass = GenerateShipUniqueArmor( "Glass", { aura_target_offset = Vec3( 0, 0, 0 ), spell_on_equip = "Spell_GlassArmor", item_subtype = ItemSubtype.GlassArmor } ) -- Module_GlassArmor

designers.armor_grades_glassFed = GenerateShipUniqueArmor( "Glass2", { aura_target_offset = Vec3( 0, 0, 0 ), spell_on_equip = "Spell_GlassArmor", spell_on_max_speed_plus = "FederationCritBuffOnMovement", max_speed_percent=0.9, item_subtype = ItemSubtype.GlassArmor } ) -- Module_GlassArmorFed

--designers.armor_grades_atmodebuf = GenerateShipUniqueArmor( "Reaper", { spell_on_equip = "PhaseShield_Energy_Buff123", item_subtype = ItemSubtype.atmodebuf } ) -- Module_atmodebuf

-- GreenSkin
designers.armor_grades_greenS = GenerateShipUniqueArmor( "GreenS", { spell_on_no_firing = "GreenHealS", cooldown = 5 , spell_on_equip = "GreenHalfHeal", item_subtype = ItemSubtype.GreenArmour } )
designers.armor_grades_greenM = GenerateShipUniqueArmor( "GreenM", { spell_on_no_firing = "GreenHealM", cooldown = 5 , spell_on_equip = "GreenHalfHeal", item_subtype = ItemSubtype.GreenArmour } )
designers.armor_grades_greenL = GenerateShipUniqueArmor( "GreenL", { spell_on_no_firing = "GreenHealL", cooldown = 5 , spell_on_equip = "GreenHalfHeal", item_subtype = ItemSubtype.GreenArmour } )
designers.armor_grades_greenH = GenerateShipUniqueArmor( "GreenH", { spell_on_no_firing = "GreenHealH", cooldown = 5 , spell_on_equip = "GreenHalfHeal", item_subtype = ItemSubtype.GreenArmour } )

--designers.armor_grades_greenengineer = GenerateShipUniqueArmor( "GreenEngineer", { spell_on_no_firing = "GreenHeal", cooldown = 5 , spell_on_equip = "GreenQuarterHeal", item_subtype = ItemSubtype.GreenArmour } )

-- #65473: бафф федерации
designers.armor_grades_federation = GenerateShipUniqueArmor ( "Federation", {spell_on_max_speed_plus = "FederationCritBuffOnMovement", max_speed_percent=0.9, item_subtype = ItemSubtype.FederationArmor})

-- SC-116193 dlc Blood Tormentor. ”лучшить корабль
designers.armor_grades_tormentor = GenerateShipUniqueArmor( "Tormentor", { --[[aura_target_offset = Vec3( 0, 0, -13.5 ), ]]focus_spell = "Spell_TormentorArmour", item_subtype = ItemSubtype.TormentorArmour } ) -- ModuleArmor_Tormentor_Mk1

-- SC-116253 DLC Phoenix простой и элитный. јпнуть корабль
designers.armor_grades_phoenix = GenerateShipUniqueArmor( "Phoenix", {emergency_barrier_spell = "Spell_PhoenixArmour", item_subtype = ItemSubtype.PhoenixArmour, cooldown = 60*3, show_cooldown_status = true, default_icon = "ItemSubtype_PhoenixArmour" } ) -- ModuleArmor_Phoenix_Mk1

-- SC-118692  орабль лего
designers.Lego_armor_grades = GenerateShipUniqueArmor( 
	"LegoA", --имя
	{}, --перманентный спел (?)
 	{ --параметры для отстрела детали и спелов (пока деталь жива?)
		signature		= ai.Signature.TINY,
		physics 		= { mass = 1, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		death_wreck  	= "models/ships/race_1/l/race1_l_helios/race1_l_helios_wings_left_damage",
	
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
		activate_sound = "sound/gadgets/ReverseThruster_prepare",
		double_left_spell 	= "Spell_HeliosWingstart_l",
		death_spell		= "Spell_HeliosWingDeath_l",
		--hull_health_add = 1000000000,
		item_subtype			= ItemSubtype.HeliosWingL,
	},
	"models/ships/race_1/l/race1_l_helios/race1_l_helios_wings_left" --модель детали
)

-- designers.helios_armor_grades = GenerateShipUniqueArmor( 
	-- --	uiName = "helios_wing1", --имя
	-- "helios_wing1", --имя
	-- {}, --перманентный спел (?)
 	-- { --параметры для отстрела детали и спелов (пока деталь жива?)
		-- signature		= ai.Signature.TINY,
		-- physics 		= { mass = 1000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		-- damageable 		= true,
		-- death_wreck  	= "Race2_H_T4_Capacitor_Wreck",
		-- broken_parts = 
			-- {
				-- [ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				-- [ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				-- [ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				-- [ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				-- [ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			-- },
		-- children =
		-- {
			-- { effect = "particles/ships/r2_h_relic_cap_fx", },
		-- },
		-- health 			= 4000,
		-- --health_regen 	= 1000/30,  --модуль  восстанавливаться по health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		-- damage_to_host 	= 40000,
		-- --death_spell		= "Engine_off",
	-- },
	-- "models/ships/race_1/l/race1_l_helios/race1_l_helios_wings_left" --модель детали
-- )

-- designers.armor_large_r5_helios = GenerateCapTable(   
	-- "models/ships/race_1/l/race1_l_helios/race1_l_helios_wings_left",
	-- designers.armor_grades, --base table
	-- "Race5_Large_helios_frigate_armor", --short_name
	-- designers.helios_armor_grades
-- )