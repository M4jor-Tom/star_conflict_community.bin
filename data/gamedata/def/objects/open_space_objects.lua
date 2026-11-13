-- STAR
Def.OpenSpaceGreatAttractor_Base =
{
	class					= "OpenSpaceAttractor",
	in_editor				= true,
	--model					= "models/misc/cube8m_s",
	--model					= "models/objects/global_world/astronomical_objects/template_sphere_s2500_v2",
	model					= "mapskit/maps/global_world/s2_test3/map_13_ce",
	physics					= { solid_type = solid.none, static = true, material = "Rock", mass = 100000000 },

	maxViewDist				= 20000,

	uiName					= "OpenSpaceAttractor",
	hudType					= "open_space_attractor",
}


-- PLANET
Def.OpenSpaceAttractor_Base =
{
	class					= "OpenSpaceAttractor",
	in_editor				= true,
	--model					= "models/misc/cube8m_s",
	--model					= "models/objects/global_world/astronomical_objects/template_sphere_s2500_v1",
	--model					= "mapskit/maps/global_world/s2_test3/planet/moon",
	model					= "mapskit/maps/global_world/s2_test3/map_07_ce",
	physics					= { solid_type = solid.none, static = true, material = "Rock", mass = 100000000 },

	maxViewDist				= 20000,

	uiName					= "OpenSpaceAttractor",
	hudType					= "open_space_attractor",
}


-- LOCATION
Def.OpeSpaceLocation_Base =
{
	class 		= "OpenSpaceLocation",
	in_editor	= true,
	--model		= "models/misc/cube1m_s",
	model		= "models/misc/invisible_model",
	physics		= { solid_type = solid.none, static = true, material = "Rock", mass = 100000000 },

	uiName		= "OpenSpaceLocation",
	hudType		= "open_space_location",
}

-- NODE
Def.OpenSpaceObjectInterface_Base =
{
	class					= "OpenSpaceObjectInterface",
	in_editor				= true,
	--model					= "models/misc/cube4m_s",
	--model					= "models/objects/global_world/asteroids/asteroids_01",
	--model					= "models/objects/global_world/empire_station/empire_station",
	model					= "models/objects/global_world/empire_object/empire_miningsite_station_01",
	--model					= "models/objects/global_world/empire_object/miningsite_station_ships",
	physics					= { solid_type = solid.none, static = true, material = "Metal", mass = 100000000 },

	interface_type			= ai.OpenSpaceObjectInterfaceType.ASTEROID,

	uiName					= "OpenSpaceObjectInterface",
	hudType					= "open_space_object_interface",

-- 	children =
-- {
-- 	{ effect = "particles/other/microship_engine", joint = "ship01" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship02" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship03" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship04" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship05" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship06" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship07" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship08" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship09" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship010" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship011" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship012" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship013" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship014" },
-- 	{ effect = "particles/other/microship_engine", joint = "ship015" }
-- }


}
