
--
Def.Module_Engine_Base =
{
	class			= "EngineModule",
	in_editor		= false,
	do_not_export	= true, -- робот не эксппортит и не проверяет валидность.

	engine_effect	= "particles/ships/engine_base",
	trail_effect = "particles/ships/ship_trail",
	--trail_effect_bone = "exhaust",

	engine_flare_size		= 1.85,
	engine_flare_angle		= 90,
	engine_flare_color		= "96 153 247 127",
	engine_flare_nebulosity	= 0.2,

	engine_light_radius		= 4.0,
	engine_light_color		= "96 153 247 64",

	engine_sound_left		= "sound/engine/left_engine",
	engine_sound_right		= "sound/engine/right_engine",
	precache_skins			= true,
}


--
Def.Module_Engine_Base_S = 
{
	inherit				= "Module_Engine_Base",
	engine_sound    	= "sound/game/small_engine_loop",
	
	boost_model_bone1	= "boost_1",
	boost_model1		= "models/ships/race_1/s/race1_s_boost1_l",
	boost_model_bone2	= "boost_2",
	boost_model2		= "models/ships/race_1/s/race1_s_boost1_r",
	boost_model_bone3	= "boost_3",
	boost_model3		= "models/ships/race_1/s/race1_s_boost1_l",
	boost_model_bone4	= "boost_4",
	boost_model4		= "models/ships/race_1/s/race1_s_boost1_r",	
	
	boost_effect		= "particles/ships/boost",
	
	boost_loop_sound	= "sound/game/boost/small_start_loop",
	boost_stop_sound	= "sound/game/boost/small_end",
	
	boost_flare_nebulosity	= 0.8,
	boost_flare_size		= 0.85,
	boost_flare_angle		= 80,
	boost_flare_color		= "96 153 247 127",
}


--
Def.Module_Engine_Base_M = 
{
	inherit				= "Module_Engine_Base",
	engine_sound    	= "sound/game/medium_engine_loop",

	boost_model_bone1	= "boost_1",
	boost_model1		= "models/ships/race_1/m/r1_m_boost1_l",
	boost_model_bone2	= "boost_2",
	boost_model2		= "models/ships/race_1/m/r1_m_boost1_r",
	boost_model_bone3	= "boost_3",
	boost_model3		= "models/ships/race_1/m/r1_m_boost1_l",
	boost_model_bone4	= "boost_4",
	boost_model4		= "models/ships/race_1/m/r1_m_boost1_r",
	
	boost_effect		= "particles/ships/boost",
	
	boost_loop_sound	= "sound/game/boost/medium_start_loop",
	boost_stop_sound	= "sound/game/boost/medium_end",
	
	boost_flare_size		= 1,
	boost_flare_angle		= 80,
	boost_flare_nebulosity	= 0.8,
	boost_flare_color		= "96 153 247 127",
}


--
Def.Module_Engine_Base_L = 
{
	inherit				= "Module_Engine_Base",
	engine_sound    	= "sound/game/large_engine_loop",
	
	boost_model_bone1	= "boost_1",
	boost_model1		= "models/ships/race_1/l/r1_l_boost1_l",
	boost_model_bone2	= "boost_2",
	boost_model2		= "models/ships/race_1/l/r1_l_boost1_r",
	boost_model_bone3	= "boost_3",
	boost_model3		= "models/ships/race_1/l/r1_l_boost1_l",
	boost_model_bone4	= "boost_4",
	boost_model4		= "models/ships/race_1/l/r1_l_boost1_r",
	
	boost_effect		= "particles/ships/boost",
	
	boost_loop_sound	= "sound/game/boost/large_start_loop",
	boost_stop_sound	= "sound/game/boost/large_end",
	
	boost_flare_size		= 1,
	boost_flare_angle		= 80,
	boost_flare_nebulosity	= 0.8,
	boost_flare_color		= "96 153 247 127",
}



--------------------------------------------------------------------------------------------------
--    ENGINE UPGRADES LINES
--------------------------------------------------------------------------------------------------

designers.engine_small_race1_grades =
	{
		{ "ModuleEngine_Race1_Small_Mk1", 0 },
		{ "ModuleEngine_Race1_Small_Mk2", 50000 },
		{ "ModuleEngine_Race1_Small_Mk3", 150000 },
		{ "ModuleEngine_Race1_Small_Mk4", 250000 },
		{ "ModuleEngine_Race1_Small_Mk5", 350000 },
		{ "ModuleEngine_Race1_Small_Mk6", 500000 },
	}
designers.engine_medium_race1_grades =
	{
		{ "ModuleEngine_Race1_Medium_Mk1", 0 },
		{ "ModuleEngine_Race1_Medium_Mk2", 50000 },
		{ "ModuleEngine_Race1_Medium_Mk3", 150000 },
		{ "ModuleEngine_Race1_Medium_Mk4", 250000 },
		{ "ModuleEngine_Race1_Medium_Mk5", 350000 },
		{ "ModuleEngine_Race1_Medium_Mk6", 500000 },
	}
designers.engine_large_race1_grades =
	{
		{ "ModuleEngine_Race1_Large_Mk1", 0 },
		{ "ModuleEngine_Race1_Large_Mk2", 50000 },
		{ "ModuleEngine_Race1_Large_Mk3", 150000 },
		{ "ModuleEngine_Race1_Large_Mk4", 250000 },
		{ "ModuleEngine_Race1_Large_Mk5", 350000 },
		{ "ModuleEngine_Race1_Large_Mk6", 500000 },
	}	
designers.engine_small_race2_grades =
	{
		{ "ModuleEngine_Race2_Small_Mk1", designers.engine_small_race1_grades[1][2] },
		{ "ModuleEngine_Race2_Small_Mk2", designers.engine_small_race1_grades[2][2] },
		{ "ModuleEngine_Race2_Small_Mk3", designers.engine_small_race1_grades[3][2] },
		{ "ModuleEngine_Race2_Small_Mk4", designers.engine_small_race1_grades[4][2] },
		{ "ModuleEngine_Race2_Small_Mk5", designers.engine_small_race1_grades[5][2] },
		{ "ModuleEngine_Race2_Small_Mk6", designers.engine_small_race1_grades[6][2] },
	}
designers.engine_small_race3_grades =
	{
		{ "ModuleEngine_Race3_Small_Mk1", designers.engine_small_race1_grades[1][2] },
		{ "ModuleEngine_Race3_Small_Mk2", designers.engine_small_race1_grades[2][2] },
		{ "ModuleEngine_Race3_Small_Mk3", designers.engine_small_race1_grades[3][2] },
		{ "ModuleEngine_Race3_Small_Mk4", designers.engine_small_race1_grades[4][2] },
		{ "ModuleEngine_Race3_Small_Mk5", designers.engine_small_race1_grades[5][2] },
		{ "ModuleEngine_Race3_Small_Mk6", designers.engine_small_race1_grades[6][2] },
	}
	
designers.engine_medium_race2_grades =
	{
		{ "ModuleEngine_Race2_Medium_Mk1", designers.engine_medium_race1_grades[1][2] },
		{ "ModuleEngine_Race2_Medium_Mk2", designers.engine_medium_race1_grades[2][2] },
		{ "ModuleEngine_Race2_Medium_Mk3", designers.engine_medium_race1_grades[3][2] },
		{ "ModuleEngine_Race2_Medium_Mk4", designers.engine_medium_race1_grades[4][2] },
		{ "ModuleEngine_Race2_Medium_Mk5", designers.engine_medium_race1_grades[5][2] },
		{ "ModuleEngine_Race2_Medium_Mk6", designers.engine_medium_race1_grades[6][2] },
	}
designers.engine_medium_race3_grades =
	{
		{ "ModuleEngine_Race3_Medium_Mk1", designers.engine_medium_race1_grades[1][2] },
		{ "ModuleEngine_Race3_Medium_Mk2", designers.engine_medium_race1_grades[2][2] },
		{ "ModuleEngine_Race3_Medium_Mk3", designers.engine_medium_race1_grades[3][2] },
		{ "ModuleEngine_Race3_Medium_Mk4", designers.engine_medium_race1_grades[4][2] },
		{ "ModuleEngine_Race3_Medium_Mk5", designers.engine_medium_race1_grades[5][2] },
		{ "ModuleEngine_Race3_Medium_Mk6", designers.engine_medium_race1_grades[6][2] },
	}

designers.engine_large_race2_grades =
	{
		{ "ModuleEngine_Race2_Large_Mk1", designers.engine_large_race1_grades[1][2] },
		{ "ModuleEngine_Race2_Large_Mk2", designers.engine_large_race1_grades[2][2] },
		{ "ModuleEngine_Race2_Large_Mk3", designers.engine_large_race1_grades[3][2] },
		{ "ModuleEngine_Race2_Large_Mk4", designers.engine_large_race1_grades[4][2] },
		{ "ModuleEngine_Race2_Large_Mk5", designers.engine_large_race1_grades[5][2] },
		{ "ModuleEngine_Race2_Large_Mk6", designers.engine_large_race1_grades[6][2] },
	}
designers.engine_large_race3_grades =
	{
		{ "ModuleEngine_Race3_Large_Mk1", designers.engine_large_race1_grades[1][2] },
		{ "ModuleEngine_Race3_Large_Mk2", designers.engine_large_race1_grades[2][2] },
		{ "ModuleEngine_Race3_Large_Mk3", designers.engine_large_race1_grades[3][2] },
		{ "ModuleEngine_Race3_Large_Mk4", designers.engine_large_race1_grades[4][2] },
		{ "ModuleEngine_Race3_Large_Mk5", designers.engine_large_race1_grades[5][2] },
		{ "ModuleEngine_Race3_Large_Mk6", designers.engine_large_race1_grades[6][2] },
	}

-- Уникальные двигатели пиратских кораблей
---------------------------------------

Def.ModuleEngine_Race4_Large_Mk1 = 
{
	inherit							= "ModuleEngine_Race1_Large_Mk1",
	model							= "models/ships/race_4/l/r4_l_eng",
	boost_model1						= "models/ships/race_4/l/r4_l_boost",
	boost_model2						= "models/ships/race_4/l/r4_l_boost",
	boost_model3						= "models/ships/race_4/l/r4_l_boost",
	boost_model4						= "models/ships/race_4/l/r4_l_boost",
}
Def.ModuleEngine_Race4_Large_Mk2 = 
{
	inherit							= "ModuleEngine_Race1_Large_Mk2",
	model							= "models/ships/race_4/l/r4_l_eng",
	boost_model1						= "models/ships/race_4/l/r4_l_boost",
	boost_model2						= "models/ships/race_4/l/r4_l_boost",
	boost_model3						= "models/ships/race_4/l/r4_l_boost",
	boost_model4						= "models/ships/race_4/l/r4_l_boost",
}
Def.ModuleEngine_Race4_Large_Mk3 = 
{
	inherit							= "ModuleEngine_Race1_Large_Mk3",
	model							= "models/ships/race_4/l/r4_l_eng",
	boost_model1						= "models/ships/race_4/l/r4_l_boost",
	boost_model2						= "models/ships/race_4/l/r4_l_boost",
	boost_model3						= "models/ships/race_4/l/r4_l_boost",
	boost_model4						= "models/ships/race_4/l/r4_l_boost",
}
Def.ModuleEngine_Race4_Large_Mk4 = 
{
	inherit							= "ModuleEngine_Race1_Large_Mk4",
	model							= "models/ships/race_4/l/r4_l_eng",
	boost_model1						= "models/ships/race_4/l/r4_l_boost",
	boost_model2						= "models/ships/race_4/l/r4_l_boost",
	boost_model3						= "models/ships/race_4/l/r4_l_boost",
	boost_model4						= "models/ships/race_4/l/r4_l_boost",
}
Def.ModuleEngine_Race4_Large_Mk5 = 
{
	inherit							= "ModuleEngine_Race1_Large_Mk5",
	model							= "models/ships/race_4/l/r4_l_eng",
	boost_model1						= "models/ships/race_4/l/r4_l_boost",
	boost_model2						= "models/ships/race_4/l/r4_l_boost",
	boost_model3						= "models/ships/race_4/l/r4_l_boost",
	boost_model4						= "models/ships/race_4/l/r4_l_boost",
}
Def.ModuleEngine_Race4_Large_Mk6 = 
{
	inherit							= "ModuleEngine_Race1_Large_Mk6",
	model							= "models/ships/race_4/l/r4_l_eng",
	boost_model1						= "models/ships/race_4/l/r4_l_boost",
	boost_model2						= "models/ships/race_4/l/r4_l_boost",
	boost_model3						= "models/ships/race_4/l/r4_l_boost",
	boost_model4						= "models/ships/race_4/l/r4_l_boost",
}
designers.engine_large_race4_grades =
	{
		{ "ModuleEngine_Race4_Large_Mk1", designers.engine_large_race1_grades[1][2] },
		{ "ModuleEngine_Race4_Large_Mk2", designers.engine_large_race1_grades[2][2] },
		{ "ModuleEngine_Race4_Large_Mk3", designers.engine_large_race1_grades[3][2] },
		{ "ModuleEngine_Race4_Large_Mk4", designers.engine_large_race1_grades[4][2] },
		{ "ModuleEngine_Race4_Large_Mk5", designers.engine_large_race1_grades[5][2] },
		{ "ModuleEngine_Race4_Large_Mk6", designers.engine_large_race1_grades[6][2] },
	}
	
----
Def.ModuleEngine_Race4_Shark_Mk1 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk1",
	model							= "models/ships/race_4/m/r4_m_shark_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_shark_boost",
}
Def.ModuleEngine_Race4_Shark_Mk2 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk2",
	model							= "models/ships/race_4/m/r4_m_shark_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_shark_boost",
}
Def.ModuleEngine_Race4_Shark_Mk3 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk3",
	model							= "models/ships/race_4/m/r4_m_shark_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_shark_boost",
}
Def.ModuleEngine_Race4_Shark_Mk4 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk4",
	model							= "models/ships/race_4/m/r4_m_shark_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_shark_boost",
}
Def.ModuleEngine_Race4_Shark_Mk5 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk5",
	model							= "models/ships/race_4/m/r4_m_shark_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_shark_boost",
}
Def.ModuleEngine_Race4_Shark_Mk6 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk6",
	model							= "models/ships/race_4/m/r4_m_shark_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_shark_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_shark_boost",
}
designers.engine_medium_shark_grades =
	{
		{ "ModuleEngine_Race4_Shark_Mk1", designers.engine_medium_race1_grades[1][2] },
		{ "ModuleEngine_Race4_Shark_Mk2", designers.engine_medium_race1_grades[2][2] },
		{ "ModuleEngine_Race4_Shark_Mk3", designers.engine_medium_race1_grades[3][2] },
		{ "ModuleEngine_Race4_Shark_Mk4", designers.engine_medium_race1_grades[4][2] },
		{ "ModuleEngine_Race4_Shark_Mk5", designers.engine_medium_race1_grades[5][2] },
		{ "ModuleEngine_Race4_Shark_Mk6", designers.engine_medium_race1_grades[6][2] },
	}

----
Def.ModuleEngine_Race4_Jocker_Mk1 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk1",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Jocker_Mk2 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk2",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Jocker_Mk3 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk3",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Jocker_Mk4 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk4",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Jocker_Mk5 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk5",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Jocker_Mk6 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk6",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
designers.engine_medium_jocker_grades =
	{
		{ "ModuleEngine_Race4_Jocker_Mk1", designers.engine_medium_race1_grades[1][2] },
		{ "ModuleEngine_Race4_Jocker_Mk2", designers.engine_medium_race1_grades[2][2] },
		{ "ModuleEngine_Race4_Jocker_Mk3", designers.engine_medium_race1_grades[3][2] },
		{ "ModuleEngine_Race4_Jocker_Mk4", designers.engine_medium_race1_grades[4][2] },
		{ "ModuleEngine_Race4_Jocker_Mk5", designers.engine_medium_race1_grades[5][2] },
		{ "ModuleEngine_Race4_Jocker_Mk6", designers.engine_medium_race1_grades[6][2] },
	}

	
----
Def.ModuleEngine_Race4_Grim_Mk1 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk1",
	model							= "models/ships/race_4/s/r4_s_jer_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_grim_boost_l",
	boost_model2						= "models/ships/race_4/s/race4_s_grim_boost_r",
	--boost_model3						= "models/ships/race_4/s/race4_s_grim_boost_l",
	--boost_model4						= "models/ships/race_4/s/race4_s_grim_boost_r",
}
Def.ModuleEngine_Race4_Grim_Mk2 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk2",
	model							= "models/ships/race_4/s/r4_s_jer_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_grim_boost_l",
	boost_model2						= "models/ships/race_4/s/race4_s_grim_boost_r",
--	boost_model3						= "models/ships/race_4/s/race4_s_grim_boost_l",
--	boost_model4						= "models/ships/race_4/s/race4_s_grim_boost_r",
}
Def.ModuleEngine_Race4_Grim_Mk3 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk3",
	model							= "models/ships/race_4/s/r4_s_jer_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_grim_boost_l",
	boost_model2						= "models/ships/race_4/s/race4_s_grim_boost_r",
--	boost_model3						= "models/ships/race_4/s/race4_s_grim_boost_l",
--	boost_model4						= "models/ships/race_4/s/race4_s_grim_boost_r",
}
Def.ModuleEngine_Race4_Grim_Mk4 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk4",
	model							= "models/ships/race_4/s/r4_s_jer_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_grim_boost_l",
	boost_model2						= "models/ships/race_4/s/race4_s_grim_boost_r",
--	boost_model3						= "models/ships/race_4/s/race4_s_grim_boost_l",
--	boost_model4						= "models/ships/race_4/s/race4_s_grim_boost_r",
}
Def.ModuleEngine_Race4_Grim_Mk5 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk5",
	model							= "models/ships/race_4/s/r4_s_jer_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_grim_boost_l",
	boost_model2						= "models/ships/race_4/s/race4_s_grim_boost_r",
--	boost_model3						= "models/ships/race_4/s/race4_s_grim_boost_l",
--	boost_model4						= "models/ships/race_4/s/race4_s_grim_boost_r",
}
Def.ModuleEngine_Race4_Grim_Mk6 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk6",
	model							= "models/ships/race_4/s/r4_s_jer_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_grim_boost_l",
	boost_model2						= "models/ships/race_4/s/race4_s_grim_boost_r",
--	boost_model3						= "models/ships/race_4/s/race4_s_grim_boost_l",
--	boost_model4						= "models/ships/race_4/s/race4_s_grim_boost_r",
}
designers.engine_small_grim_grades =
	{
		{ "ModuleEngine_Race4_Grim_Mk1", designers.engine_small_race1_grades[1][2] },
		{ "ModuleEngine_Race4_Grim_Mk2", designers.engine_small_race1_grades[2][2] },
		{ "ModuleEngine_Race4_Grim_Mk3", designers.engine_small_race1_grades[3][2] },
		{ "ModuleEngine_Race4_Grim_Mk4", designers.engine_small_race1_grades[4][2] },
		{ "ModuleEngine_Race4_Grim_Mk5", designers.engine_small_race1_grades[5][2] },
		{ "ModuleEngine_Race4_Grim_Mk6", designers.engine_small_race1_grades[6][2] },
	}

----
Def.ModuleEngine_Race4_Sai_Mk1 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk1",
	model							= "models/ships/race_4/s/r4_s_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model2						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model3						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model4						= "models/ships/race_4/s/race4_s_sai_boost",
}
Def.ModuleEngine_Race4_Sai_Mk2 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk2",
	model							= "models/ships/race_4/s/r4_s_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model2						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model3						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model4						= "models/ships/race_4/s/race4_s_sai_boost",
}
Def.ModuleEngine_Race4_Sai_Mk3 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk3",
	model							= "models/ships/race_4/s/r4_s_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model2						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model3						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model4						= "models/ships/race_4/s/race4_s_sai_boost",
}
Def.ModuleEngine_Race4_Sai_Mk4 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk4",
	model							= "models/ships/race_4/s/r4_s_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model2						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model3						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model4						= "models/ships/race_4/s/race4_s_sai_boost",
}
Def.ModuleEngine_Race4_Sai_Mk5 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk5",
	model							= "models/ships/race_4/s/r4_s_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model2						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model3						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model4						= "models/ships/race_4/s/race4_s_sai_boost",
}
Def.ModuleEngine_Race4_Sai_Mk6 = 
{
	inherit							= "ModuleEngine_Race1_Small_Mk6",
	model							= "models/ships/race_4/s/r4_s_eng",
	boost_model1						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model2						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model3						= "models/ships/race_4/s/race4_s_sai_boost",
	boost_model4						= "models/ships/race_4/s/race4_s_sai_boost",
}
designers.engine_small_sai_grades =
	{
		{ "ModuleEngine_Race4_Sai_Mk1", designers.engine_small_race1_grades[1][2] },
		{ "ModuleEngine_Race4_Sai_Mk2", designers.engine_small_race1_grades[2][2] },
		{ "ModuleEngine_Race4_Sai_Mk3", designers.engine_small_race1_grades[3][2] },
		{ "ModuleEngine_Race4_Sai_Mk4", designers.engine_small_race1_grades[4][2] },
		{ "ModuleEngine_Race4_Sai_Mk5", designers.engine_small_race1_grades[5][2] },
		{ "ModuleEngine_Race4_Sai_Mk6", designers.engine_small_race1_grades[6][2] },
	}

Def.ModuleEngine_Race1_Medium_Loki_Mk1 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk1",
	model							= "models/ships/race_1/m/race1_m_loki_eng",
	boost_model1						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model2						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model3						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model4						= "models/ships/race_1/m/race1_m_loki_boost",
}
Def.ModuleEngine_Race1_Medium_Loki_Mk2 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk2",
	model							= "models/ships/race_1/m/race1_m_loki_eng",
	boost_model1						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model2						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model3						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model4						= "models/ships/race_1/m/race1_m_loki_boost",
}
Def.ModuleEngine_Race1_Medium_Loki_Mk3 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk3",
	model							= "models/ships/race_1/m/race1_m_loki_eng",
	boost_model1						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model2						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model3						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model4						= "models/ships/race_1/m/race1_m_loki_boost",
}
Def.ModuleEngine_Race1_Medium_Loki_Mk4 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk4",
	model							= "models/ships/race_1/m/race1_m_loki_eng",
	boost_model1						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model2						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model3						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model4						= "models/ships/race_1/m/race1_m_loki_boost",
}
Def.ModuleEngine_Race1_Medium_Loki_Mk5 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk5",
	model							= "models/ships/race_1/m/race1_m_loki_eng",
	boost_model1						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model2						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model3						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model4						= "models/ships/race_1/m/race1_m_loki_boost",
}
Def.ModuleEngine_Race1_Medium_Loki_Mk6 = 
{
	inherit							= "ModuleEngine_Race1_Medium_Mk6",
	model							= "models/ships/race_1/m/race1_m_loki_eng",
	boost_model1						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model2						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model3						= "models/ships/race_1/m/race1_m_loki_boost",
	boost_model4						= "models/ships/race_1/m/race1_m_loki_boost",
}
designers.engine_medium_loki_grades =
	{
		{ "ModuleEngine_Race1_Medium_Loki_Mk1", designers.engine_medium_race1_grades[1][2] },
		{ "ModuleEngine_Race1_Medium_Loki_Mk2", designers.engine_medium_race1_grades[2][2] },
		{ "ModuleEngine_Race1_Medium_Loki_Mk3", designers.engine_medium_race1_grades[3][2] },
		{ "ModuleEngine_Race1_Medium_Loki_Mk4", designers.engine_medium_race1_grades[4][2] },
		{ "ModuleEngine_Race1_Medium_Loki_Mk5", designers.engine_medium_race1_grades[5][2] },
		{ "ModuleEngine_Race1_Medium_Loki_Mk6", designers.engine_medium_race1_grades[6][2] },
	}


Def.ModuleEngine_Race2_Medium_Razer_Mk1 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk1",
	model							= "models/ships/race_2/m/race2_m_razer_eng",
	boost_model1						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model2						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model3						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model4						= "models/ships/race_2/m/race2_m_razer_boost",
}
Def.ModuleEngine_Race2_Medium_Razer_Mk2 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk2",
	model							= "models/ships/race_2/m/race2_m_razer_eng",
	boost_model1						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model2						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model3						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model4						= "models/ships/race_2/m/race2_m_razer_boost",
}
Def.ModuleEngine_Race2_Medium_Razer_Mk3 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk3",
	model							= "models/ships/race_2/m/race2_m_razer_eng",
	boost_model1						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model2						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model3						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model4						= "models/ships/race_2/m/race2_m_razer_boost",
}
Def.ModuleEngine_Race2_Medium_Razer_Mk4 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk4",
	model							= "models/ships/race_2/m/race2_m_razer_eng",
	boost_model1						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model2						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model3						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model4						= "models/ships/race_2/m/race2_m_razer_boost",
}
Def.ModuleEngine_Race2_Medium_Razer_Mk5 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk5",
	model							= "models/ships/race_2/m/race2_m_razer_eng",
	boost_model1						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model2						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model3						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model4						= "models/ships/race_2/m/race2_m_razer_boost",
}
Def.ModuleEngine_Race2_Medium_Razer_Mk6 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk6",
	model							= "models/ships/race_2/m/race2_m_razer_eng",
	boost_model1						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model2						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model3						= "models/ships/race_2/m/race2_m_razer_boost",
	boost_model4						= "models/ships/race_2/m/race2_m_razer_boost",
}
designers.engine_medium_razer_grades =
	{
		{ "ModuleEngine_Race2_Medium_Razer_Mk1", designers.engine_medium_race2_grades[1][2] },
		{ "ModuleEngine_Race2_Medium_Razer_Mk2", designers.engine_medium_race2_grades[2][2] },
		{ "ModuleEngine_Race2_Medium_Razer_Mk3", designers.engine_medium_race2_grades[3][2] },
		{ "ModuleEngine_Race2_Medium_Razer_Mk4", designers.engine_medium_race2_grades[4][2] },
		{ "ModuleEngine_Race2_Medium_Razer_Mk5", designers.engine_medium_race2_grades[5][2] },
		{ "ModuleEngine_Race2_Medium_Razer_Mk6", designers.engine_medium_race2_grades[6][2] },
	}
	

Def.ModuleEngine_Race2_Large_Pandorus_Mk1 = 
{
	inherit							= "ModuleEngine_Race2_Large_Mk1",
	model							= "models/ships/race_2/l/race2_l_pandorus_eng",
	boost_model1						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model2						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model3						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model4						= "models/ships/race_2/l/race2_l_pandorus_boost",
}
Def.ModuleEngine_Race2_Large_Pandorus_Mk2 = 
{
	inherit							= "ModuleEngine_Race2_Large_Mk2",
	model							= "models/ships/race_2/l/race2_l_pandorus_eng",
	boost_model1						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model2						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model3						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model4						= "models/ships/race_2/l/race2_l_pandorus_boost",
}
Def.ModuleEngine_Race2_Large_Pandorus_Mk3 = 
{
	inherit							= "ModuleEngine_Race2_Large_Mk3",
	model							= "models/ships/race_2/l/race2_l_pandorus_eng",
	boost_model1						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model2						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model3						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model4						= "models/ships/race_2/l/race2_l_pandorus_boost",
}
Def.ModuleEngine_Race2_Large_Pandorus_Mk4 = 
{
	inherit							= "ModuleEngine_Race2_Large_Mk4",
	model							= "models/ships/race_2/l/race2_l_pandorus_eng",
	boost_model1						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model2						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model3						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model4						= "models/ships/race_2/l/race2_l_pandorus_boost",
}
Def.ModuleEngine_Race2_Large_Pandorus_Mk5 = 
{
	inherit							= "ModuleEngine_Race2_Large_Mk5",
	model							= "models/ships/race_2/l/race2_l_pandorus_eng",
	boost_model1						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model2						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model3						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model4						= "models/ships/race_2/l/race2_l_pandorus_boost",
}
Def.ModuleEngine_Race2_Large_Pandorus_Mk6 = 
{
	inherit							= "ModuleEngine_Race2_Large_Mk6",
	model							= "models/ships/race_2/l/race2_l_pandorus_eng",
	boost_model1						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model2						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model3						= "models/ships/race_2/l/race2_l_pandorus_boost",
	boost_model4						= "models/ships/race_2/l/race2_l_pandorus_boost",
}
designers.engine_large_pandorus_grades =
	{
		{ "ModuleEngine_Race2_Large_Pandorus_Mk1", designers.engine_large_race2_grades[1][2] },
		{ "ModuleEngine_Race2_Large_Pandorus_Mk2", designers.engine_large_race2_grades[2][2] },
		{ "ModuleEngine_Race2_Large_Pandorus_Mk3", designers.engine_large_race2_grades[3][2] },
		{ "ModuleEngine_Race2_Large_Pandorus_Mk4", designers.engine_large_race2_grades[4][2] },
		{ "ModuleEngine_Race2_Large_Pandorus_Mk5", designers.engine_large_race2_grades[5][2] },
		{ "ModuleEngine_Race2_Large_Pandorus_Mk6", designers.engine_large_race2_grades[6][2] },
	}
------------------------------------------------------------------------	

	Def.ModuleEngine_Race2_Large_Numbfish_Mk1 = 
	{
		inherit							= "ModuleEngine_Race2_Large_Mk1",
		model							= "models/ships/race_4/l/r4_l_numbfish_eng",
		boost_model1						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model2						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model3						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model4						= "models/ships/race_4/l/r4_l_numbfish_boost",
	}
	Def.ModuleEngine_Race2_Large_Numbfish_Mk2 = 
	{
		inherit							= "ModuleEngine_Race2_Large_Mk2",
		model							= "models/ships/race_4/l/r4_l_numbfish_eng",
		boost_model1						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model2						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model3						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model4						= "models/ships/race_4/l/r4_l_numbfish_boost",
	}
	Def.ModuleEngine_Race2_Large_Numbfish_Mk3 = 
	{
		inherit							= "ModuleEngine_Race2_Large_Mk3",
		model							= "models/ships/race_4/l/r4_l_numbfish_eng",
		boost_model1						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model2						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model3						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model4						= "models/ships/race_4/l/r4_l_numbfish_boost",
	}
	Def.ModuleEngine_Race2_Large_Numbfish_Mk4 = 
	{
		inherit							= "ModuleEngine_Race2_Large_Mk4",
		model							= "models/ships/race_4/l/r4_l_numbfish_eng",
		boost_model1						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model2						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model3						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model4						= "models/ships/race_4/l/r4_l_numbfish_boost",
	}
	Def.ModuleEngine_Race2_Large_Numbfish_Mk5 = 
	{
		inherit							= "ModuleEngine_Race2_Large_Mk5",
		model							= "models/ships/race_4/l/r4_l_numbfish_eng",
		boost_model1						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model2						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model3						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model4						= "models/ships/race_4/l/r4_l_numbfish_boost",
	}
	Def.ModuleEngine_Race2_Large_Numbfish_Mk6 = 
	{
		inherit							= "ModuleEngine_Race2_Large_Mk6",
		model							= "models/ships/race_4/l/r4_l_numbfish_eng",
		boost_model1						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model2						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model3						= "models/ships/race_4/l/r4_l_numbfish_boost",
		boost_model4						= "models/ships/race_4/l/r4_l_numbfish_boost",
	}
	designers.engine_large_numbfish_grades =
		{
			{ "ModuleEngine_Race2_Large_Numbfish_Mk1", designers.engine_large_race2_grades[1][2] },
			{ "ModuleEngine_Race2_Large_Numbfish_Mk2", designers.engine_large_race2_grades[2][2] },
			{ "ModuleEngine_Race2_Large_Numbfish_Mk3", designers.engine_large_race2_grades[3][2] },
			{ "ModuleEngine_Race2_Large_Numbfish_Mk4", designers.engine_large_race2_grades[4][2] },
			{ "ModuleEngine_Race2_Large_Numbfish_Mk5", designers.engine_large_race2_grades[5][2] },
			{ "ModuleEngine_Race2_Large_Numbfish_Mk6", designers.engine_large_race2_grades[6][2] },
		}	
		
---------------------------------------------
Def.ModuleEngine_Race2_Medium_T5_Prem_Mk1 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk1",
	model							= "models/ships/race_2/m/r2_m_eng1_premium",
	boost_model1						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model2						= "models/ships/race_2/m/r2_m_boost1_r_premium",
	boost_model3						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model4						= "models/ships/race_2/m/r2_m_boost1_r_premium",
}
Def.ModuleEngine_Race2_Medium_T5_Prem_Mk2 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk2",
	model							= "models/ships/race_2/m/r2_m_eng1_premium",
	boost_model1						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model2						= "models/ships/race_2/m/r2_m_boost1_r_premium",
	boost_model3						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model4						= "models/ships/race_2/m/r2_m_boost1_r_premium",
}
Def.ModuleEngine_Race2_Medium_T5_Prem_Mk3 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk3",
	model							= "models/ships/race_2/m/r2_m_eng1_premium",
	boost_model1						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model2						= "models/ships/race_2/m/r2_m_boost1_r_premium",
	boost_model3						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model4						= "models/ships/race_2/m/r2_m_boost1_r_premium",
}
Def.ModuleEngine_Race2_Medium_T5_Prem_Mk4 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk4",
	model							= "models/ships/race_2/m/r2_m_eng1_premium",
	boost_model1						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model2						= "models/ships/race_2/m/r2_m_boost1_r_premium",
	boost_model3						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model4						= "models/ships/race_2/m/r2_m_boost1_r_premium",
}
Def.ModuleEngine_Race2_Medium_T5_Prem_Mk5 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk5",
	model							= "models/ships/race_2/m/r2_m_eng1_premium",
	boost_model1						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model2						= "models/ships/race_2/m/r2_m_boost1_r_premium",
	boost_model3						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model4						= "models/ships/race_2/m/r2_m_boost1_r_premium",
}
Def.ModuleEngine_Race2_Medium_T5_Prem_Mk6 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk6",
	model							= "models/ships/race_2/m/r2_m_eng1_premium",
	boost_model1						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model2						= "models/ships/race_2/m/r2_m_boost1_r_premium",
	boost_model3						= "models/ships/race_2/m/r2_m_boost1_l_premium",
	boost_model4						= "models/ships/race_2/m/r2_m_boost1_r_premium",
}
designers.engine_medium_t5p_grades =
	{
		{ "ModuleEngine_Race2_Medium_T5_Prem_Mk1", designers.engine_medium_race2_grades[1][2] },
		{ "ModuleEngine_Race2_Medium_T5_Prem_Mk2", designers.engine_medium_race2_grades[2][2] },
		{ "ModuleEngine_Race2_Medium_T5_Prem_Mk3", designers.engine_medium_race2_grades[3][2] },
		{ "ModuleEngine_Race2_Medium_T5_Prem_Mk4", designers.engine_medium_race2_grades[4][2] },
		{ "ModuleEngine_Race2_Medium_T5_Prem_Mk5", designers.engine_medium_race2_grades[5][2] },
		{ "ModuleEngine_Race2_Medium_T5_Prem_Mk6", designers.engine_medium_race2_grades[6][2] },
	}		
	
---------------------------------------------
Def.ModuleEngine_Race2_Medium_Mosquito_Mk1 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk1",
	model							= "models/ships/race_4/m/r4_m_mosquito_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_mosquito_boost",
}
Def.ModuleEngine_Race2_Medium_Mosquito_Mk2 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk2",
	model							= "models/ships/race_4/m/r4_m_mosquito_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_mosquito_boost",
}
Def.ModuleEngine_Race2_Medium_Mosquito_Mk3 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk3",
	model							= "models/ships/race_4/m/r4_m_mosquito_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_mosquito_boost",
}
Def.ModuleEngine_Race2_Medium_Mosquito_Mk4 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk4",
	model							= "models/ships/race_4/m/r4_m_mosquito_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_mosquito_boost",
}
Def.ModuleEngine_Race2_Medium_Mosquito_Mk5 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk5",
	model							= "models/ships/race_4/m/r4_m_mosquito_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_mosquito_boost",
}
Def.ModuleEngine_Race2_Medium_Mosquito_Mk6 = 
{
	inherit							= "ModuleEngine_Race2_Medium_Mk6",
	model							= "models/ships/race_4/m/r4_m_mosquito_eng",
	boost_model1						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model2						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model3						= "models/ships/race_4/m/r4_m_mosquito_boost",
	boost_model4						= "models/ships/race_4/m/r4_m_mosquito_boost",
}
designers.engine_medium_mosquito_grades =
	{
		{ "ModuleEngine_Race2_Medium_Mosquito_Mk1", designers.engine_medium_race2_grades[1][2] },
		{ "ModuleEngine_Race2_Medium_Mosquito_Mk2", designers.engine_medium_race2_grades[2][2] },
		{ "ModuleEngine_Race2_Medium_Mosquito_Mk3", designers.engine_medium_race2_grades[3][2] },
		{ "ModuleEngine_Race2_Medium_Mosquito_Mk4", designers.engine_medium_race2_grades[4][2] },
		{ "ModuleEngine_Race2_Medium_Mosquito_Mk5", designers.engine_medium_race2_grades[5][2] },
		{ "ModuleEngine_Race2_Medium_Mosquito_Mk6", designers.engine_medium_race2_grades[6][2] },
	}			
	
	
--[[
Def.ModuleEngine_Race4_Enclave_Mk1 = 
{
	inherit							= "ModuleEngine_Race4_Large_Mk1",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Enclave_Mk2 = 
{
	inherit							= "ModuleEngine_Race4_Large_Mk2",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Enclave_Mk3 = 
{
	inherit							= "ModuleEngine_Race4_Large_Mk3",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Enclave_Mk4 = 
{
	inherit							= "ModuleEngine_Race4_Large_Mk4",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Enclave_Mk5 = 
{
	inherit							= "ModuleEngine_Race4_Large_Mk5",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
Def.ModuleEngine_Race4_Enclave_Mk6 = 
{
	inherit							= "ModuleEngine_Race4_Large_Mk6",
	model							= "models/ships/race_4/m/r4_m_jocker_eng",
	boost_model1						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model2						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model3						= "models/ships/race_4/m/race4_m_jocker_boost",
	boost_model4						= "models/ships/race_4/m/race4_m_jocker_boost",
}
designers.engine_large_enclave_grades =
	{
		{ "ModuleEngine_Race4_Enclave_Mk1", designers.engine_medium_race1_grades[1][2] },
		{ "ModuleEngine_Race4_Enclave_Mk2", designers.engine_medium_race1_grades[2][2] },
		{ "ModuleEngine_Race4_Enclave_Mk3", designers.engine_medium_race1_grades[3][2] },
		{ "ModuleEngine_Race4_Enclave_Mk4", designers.engine_medium_race1_grades[4][2] },
		{ "ModuleEngine_Race4_Enclave_Mk5", designers.engine_medium_race1_grades[5][2] },
		{ "ModuleEngine_Race4_Enclave_Mk6", designers.engine_medium_race1_grades[6][2] },
	}
	]]	
--	
	
	
---------------------------------------------------------------------
---------------------------------------------------------------------	
local function GenerateEngTable( model_eng, model_boost_l, model_boost_r, shablon, short_name, common_params )
	local res = {}
	for i, v in pairs( shablon ) do
		local t_name = "ModuleEngine_" .. short_name .. "_Mk".. tostring (i)		
		res[i] = { t_name, v[2] }
		Def[t_name]  = {}
		Def[t_name].inherit = v[1]
		Def[t_name].model = model_eng
		Def[t_name].boost_model1 = model_boost_l
		Def[t_name].boost_model2 = model_boost_r
		Def[t_name].boost_model3 = model_boost_l
		Def[t_name].boost_model4 = model_boost_r
		if common_params then
			for i_common, v_common in pairs( common_params ) do
				Def[t_name][i_common] = v_common
			end
		end
	end
	return res
end


designers.engine_race2_m_t4_premium_grades = GenerateEngTable(   
	"models/ships/race_2/m/r2_m_eng1_premium", --engine name
	"models/ships/race_2/m/r2_m_boost1_l_premium", --boost L model name
	"models/ships/race_2/m/r2_m_boost1_r_premium", --boost R model name
	designers.engine_medium_race2_grades, --base table
	"Race2_Medium_T4_Prem" --short_name
 )
 
	
designers.engine_large_reaper_grades = GenerateEngTable(   
	"models/ships/race_4/l/r4_l_eng", 						--engine name
	"models/ships/race_4/l/race4_l_boost", 					--boost L model name
	"models/ships/race_4/l/race4_l_boost", 					--boost R model name
	designers.engine_large_race4_grades, 					--base table
	"Race4_Large_Reaper"									--short_name
 )

designers.engine_alien_grades = GenerateEngTable(   
	"models/objects/ships_huge/prec_ship/prec_ship_eng", --engine name
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost L model name
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost R model name
	designers.engine_large_race1_grades, --base table
	"alien_engine" --short_name
)

designers.engine_alienManta_grades = GenerateEngTable(   
	"models/objects/ships_huge/prec_ship/prec_ship_eng", --engine name
	"models/objects/ships_huge/prec_manta/prec_manta_boost", --boost L model name
	"models/objects/ships_huge/prec_manta/prec_manta_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"alien_engine_manta" --short_name
)

 designers.engine_alien_predator_grades = GenerateEngTable(   
	"models/objects/ships_huge/prec_predator/prec_predator_eng1", --engine name
	"models/objects/ships_huge/prec_predator/prec_predator_boost1", --boost L model name
	"models/objects/ships_huge/prec_predator/prec_predator_boost1", --boost R model name
	designers.engine_large_race1_grades, --base table
	"alien_predator_engine" --short_name
 )
 
 designers.engine_alien_purple_grades = GenerateEngTable(   
	"models/objects/ships_huge/prec_ship/prec_ship_eng", --engine name
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost L model name
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost R model name
	designers.engine_large_race1_grades, --base table
	"alien_purple_engine" --short_name
 )
 
  designers.engine_alien_interceptor_grades = GenerateEngTable(   
	"models/objects/ships_huge/prec_interceptor/prec_interceptor_eng1", --engine name
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost L model name
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"alien_interceptor_engine" --short_name
 )
 
designers.engine_alien_interceptor_big_grades = GenerateEngTable(   
	"models/objects/ships_huge/prec_interceptor/prec_interceptor_big_eng1", --engine name
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost L model name
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost R model name
	designers.engine_large_race1_grades, --base table
	"alien_interceptor_big_engine" --short_name
 )
 
 designers.engine_alien_kiber_grades = GenerateEngTable(   
	"models/ships/race_2/l/r2_l_t5_eng1_precursor", --engine name 
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost L model name
	"models/ships/race_4/s/race4_s_grim_boost_l", --boost R model name
	designers.engine_large_race1_grades, --base table
	"alien_kiber_engine" --short_name
 )

designers.engine_alien_r2_m_grades = GenerateEngTable(   
	"models/ships/race_2/m/r2_m_eng1_precursor", --engine name
	"models/ships/race_2/m/r2_m_boost1_l_precursor", --boost L model name
	"models/ships/race_2/m/r2_m_boost1_r_precursor", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"alien_r2_m_engine" --short_name
 )
 
designers.engine_small_tick_grades = GenerateEngTable(   
	"models/ships/race_4/s/r4_s_tick_eng", --engine name
	"models/ships/race_4/s/rr4_s_tick_boost_l", --boost L model name
	"models/ships/race_4/s/rr4_s_tick_boost_r", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race2_Small_Tick" --short_name
 )
 
designers.engine_large_race3_custom_grades = GenerateEngTable(   
	"models/ships/race_3/l/r3_l_custom_eng", --engine name	
	"models/ships/race_3/l/r3_l_custom_boost_l", --boost L model name
	"models/ships/race_3/l/r3_l_custom_boost_r", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race3_Large_Craft" --short_name
 )
 
 designers.engine_large_race3_craftuniq_grades = GenerateEngTable(   
	"models/ships/race_3/l/r3_l_hammerhead/r3_l_hammerhead_eng", --engine name	
	"models/misc/null_object", --boost L model name
	"models/misc/null_object", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race3_Large_CraftUniq" --short_name
 )
 
  
designers.engine_small_race2_custom_grades = GenerateEngTable(   
	"models/ships/race_2/s/r2_s_custom_eng", --engine name
	"models/ships/race_2/s/r2_s_custom_boost_l", --boost L model name
	"models/ships/race_2/s/r2_s_custom_boost_r", --boost R model name
	designers.engine_small_race2_grades, --base table
	"Race2_Small_Craft" --short_name
 )
 
designers.engine_small_race1_craft_grades = GenerateEngTable(   
	"models/ships/race_1/s/r1_buckshot_eng", --engine name
	"models/ships/race_1/s/r1_buckshot_boost", --boost L model name
	"models/ships/race_1/s/r1_buckshot_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race1_Small_Craft" --short_name
 ) 
  
designers.engine_medium_race1_custom_grades = GenerateEngTable(   
	"models/ships/race_1/m/r1_m_custom_eng", --engine name
	"models/ships/race_1/m/r1_m_custom_boost", --boost L model name
	"models/ships/race_1/m/r1_m_custom_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_Medium_Craft" --short_name
 )
 
designers.engine_large_race1_craft_grades = GenerateEngTable(   
	"models/ships/race_1/l/r1_l_rozon_eng", --engine name
	"models/ships/race_1/l/r1_l_rozon_boost", --boost L model name
	"models/ships/race_1/l/r1_l_rozon_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_Craft" --short_name
 ) 
 
 designers.engine_medium_race3_craft_grades = GenerateEngTable(   
	"models/ships/race_3/m/r3_ship_fed_zim_eng", --engine name
	"models/ships/race_3/m/r3_ship_fed_zim_boost", --boost L model name
	"models/ships/race_3/m/r3_ship_fed_zim_boost", --boost R model name
	designers.engine_medium_race3_grades, --base table
	"Race3_Medium_Craft" --short_name
 )
 
 designers.engine_large_race2_t5prem_grades = GenerateEngTable(   
	"models/ships/race_2/l/r2_l_eng1_premium", --engine name	
	"models/ships/race_2/l/r2_l_boost1_l_premium", --boost L model name
	"models/ships/race_2/l/r2_l_boost1_r_premium", --boost R model name
	designers.engine_large_race2_grades, --base table
	"Race2_Large_t5Prem" --short_name
 )
 
designers.engine_large_race2_t5custom = GenerateEngTable(   
	"models/ships/race_2/l/r2_l_custom_eng1", --engine name	
	"models/ships/race_2/l/r2_l_custom_boost1_l", --boost L model name
	"models/ships/race_2/l/r2_l_custom_boost1_r", --boost R model name
	designers.engine_large_race2_grades, --base table
	"Race2_Large_Craft" --short_name
 )
 
designers.engine_large_race2_t5_craftuniq = GenerateEngTable(   
	"models/ships/race_2/l/race2_l_t5_craftuniq_eng", --engine name	
	"models/ships/race_2/l/race2_l_t5_craftuniq_boost", --boost L model name
	"models/ships/race_2/l/race2_l_t5_craftuniq_boost", --boost R model name
	designers.engine_large_race2_grades, --base table
	"Race2_Large_CraftUniq" --short_name
)
 
designers.engine_small_r2_t5_prem = GenerateEngTable(   
	"models/ships/race_2/s/race2_s_t5_premium_eng", --  "models/ships/race_2/s/r2_s_eng1_premium", --engine name
	"models/ships/race_2/s/race2_s_t5_premium_boost", --models/ships/race_2/s/r2_s_boost1_l_premium", --boost L model name
	"models/ships/race_2/s/race2_s_t5_premium_boost", --"models/ships/race_2/s/r2_s_boost1_r_premium", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race2_Small_r2_t5_prem" --short_name
 )
 
 designers.engine_small_r2_t3_zhen = GenerateEngTable(   
	"models/ships/race_2/s/race2_s_t3_zhen/race2_s_t3_zhen_eng", --  "models/ships/race_2/s/r2_s_eng1_premium", --engine name
	"models/ships/race_2/s/race2_s_t3_zhen/race2_s_t3_zhen_boost", --models/ships/race_2/s/r2_s_boost1_l_premium", --boost L model name
	"models/ships/race_2/s/race2_s_t3_zhen/race2_s_t3_zhen_boost", --"models/ships/race_2/s/r2_s_boost1_r_premium", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race2_Small_r2_t3_zhen" --short_name
 )

 designers.engine_small_r2_t5_franc = GenerateEngTable(   
	"models/ships/race_2/l/race2_l_francisca_eng", --  "models/ships/race_2/s/r2_s_eng1_premium", --engine name
	"models/ships/race_2/l/race2_l_francisca_boost", --models/ships/race_2/s/r2_s_boost1_l_premium", --boost L model name
	"models/ships/race_2/l/race2_l_francisca_boost", --"models/ships/race_2/s/r2_s_boost1_r_premium", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race2_Large_r2_t5_franc" --short_name
 )
 
 designers.engine_small_r1_t1m2 = GenerateEngTable(   
	"models/ships/race_1/s/r1_s_t1_m2_eng1", --engine name
	"models/ships/race_1/s/r1_s_t1_m2_boost1_l", --boost L model name
	"models/ships/race_1/s/r1_s_t1_m2_boost1_r", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race1_Small_t1m2" --short_name
)

designers.engine_medium_r1_t1m2 = GenerateEngTable(   
	"models/ships/race_1/m/race1_m_t1_m2_eng", --engine name
	"models/ships/race_1/m/race1_m_t1_m2_boost", --boost L model name
	"models/ships/race_1/m/race1_m_t1_m2_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_Medium_t1m2" --short_name
 ) 

designers.engine_large_r1_t1m2 = GenerateEngTable(   
	"models/ships/race_1/l/r1_l_t1_m2_eng", --engine name
	"models/ships/race_1/l/r1_l_t1_m2_boost", --boost L model name
	"models/ships/race_1/l/r1_l_t1_m2_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_t1m2" --short_name
 ) 

designers.engine_r2_t3s_pirate = GenerateEngTable(   
	"models/ships/race_4/s/r4_s_roof_eng", --engine name
	"models/ships/race_4/s/r4_s_roof_boost_l", --boost L model name
	"models/ships/race_4/s/r4_s_roof_boost_l", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race2_Small_T3pirate" --short_name
)

designers.engine_r3_t5s_craft = GenerateEngTable(   
	"models/ships/race_3/s/r3_s_craft_eng", --engine name
	"models/ships/race_3/s/r3_s_craft_boost", --boost L model name
	"models/ships/race_3/s/r3_s_craft_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race3_Small_Craft" --short_name
)

designers.engine_medium_race2_craft_grades = GenerateEngTable(   
	"models/ships/race_2/m/r2_m_evilmask_eng", --engine model name   
	"models/ships/race_2/m/r2_m_evilmask_boost", --boost L model name  
	"models/ships/race_2/m/r2_m_evilmask_boost", --boost R model name
	designers.engine_medium_race3_grades, --base table
	"Race2_Medium_Craft" --short_name
 )

designers.engine_large_r1_t5_PU = GenerateEngTable(   
	"models/ships/race_1/l/r1_l_engineer_eng_l", --engine name
	"models/ships/race_1/l/r1_l_engineer_boost_l", --boost L model name
	"models/ships/race_1/l/r1_l_engineer_boost_r", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_t5_PU" --short_name
)

designers.engine_medium_r3_t4_PU = GenerateEngTable(   
	"models/ships/race_3/m/archer_eng", --engine name
	"models/ships/race_3/m/archer_b_l", --boost L model name
	"models/ships/race_3/m/archer_b_r", --boost R model name
	designers.engine_medium_race3_grades, --base table
	"Race3_Medium_T4_PU" --short_name
)

designers.engine_medium_r3_t4_wolfhound = GenerateEngTable(   
	"models/ships/race_3/m/r3_m_t4_wolfhound_eng", --engine name
	"models/ships/race_3/m/r3_m_t4_wolfhound_boost", --boost L model name
	"models/ships/race_3/m/r3_m_t4_wolfhound_boost", --boost R model name
	designers.engine_medium_race3_grades, --base table
	"Race3_Medium_T4_wolfhound" --short_name
)

designers.engine_large_r3_t3_PU = GenerateEngTable(   
	"models/ships/race_3/l/r3_l_megalodon_eng", --engine name
	"models/ships/race_3/l/r3_l_megalodon_boost_l", --boost L model name
	"models/ships/race_3/l/r3_l_megalodon_boost_r", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race3_Large_T3_PU" --short_name
)
 
designers.common_params_eng_huge_r1_t3 =
	{
		uiName = "eng_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 5000*2.6, --500
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 10000*0.8,
		death_wreck  	= "Race1_H_T1_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
designers.common_params_eng_huge_r1_t4 =
	{
		uiName = "eng_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 6000*2.6, -- +20% от t3
		health_regen 	= 120*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 10800*0.8, -- +8% от t3
		death_wreck  	= "Race1_H_T2_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_eng_huge_r1_t5 =
	{
		uiName = "eng_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 7000*2.6, -- +40% от t3
		health_regen 	= 150*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 11600*0.8, -- +16% от t3
		death_wreck  	= "Race1_H_T3_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_eng_huge_r1_t5_ev =
	{
		uiName = "eng_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 7000*2.6, -- +40% от t3
		health_regen 	= 150*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 11600*0.8, -- +16% от t3
		death_wreck  	= "Halloween_H_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}

designers.common_params_eng_huge_r1_t5_uniq =
	{
		uiName = "eng_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 8000*2.6, -- +60% от t3
		health_regen 	= 170*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 12400*0.8, -- +16% от t3
		death_wreck  	= "Race1_H_T4_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_eng_huge_r2_t3 =
	{
		uiName = "eng_huge_r2",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 5000*2.6, --500
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 10000*0.8,
		death_wreck  	= "Race2_H_T1_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
designers.common_params_eng_huge_r2_t4 =
	{
		uiName = "eng_huge_r2",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 6000*2.6, -- +20% от t3
		health_regen 	= 120*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 10800*0.8, -- +8% от t3
		death_wreck  	= "Race2_H_T2_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_eng_huge_r2_t5 =
	{
		uiName = "eng_huge_r2",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 7000*2.6, -- +40% от t3
		health_regen 	= 150*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 11600*0.8, -- +16% от t3
		death_wreck  	= "Race2_H_T3_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}

designers.common_params_eng_huge_r2_t6 =
	{
		uiName = "eng_huge_r2",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 8000*2.6, -- +60% от t3
		health_regen 	= 170*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 12400*0.8, -- +24% от t3
		death_wreck  	= "Race2_H_T4_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_eng_huge_r3_t3 =
	{
		uiName = "eng_huge_r3",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 5000*2.6, --500
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 10000*0.8,
		death_wreck  	= "Race3_H_T1_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
designers.common_params_eng_huge_r3_t4 =
	{
		uiName = "eng_huge_r3",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 6000*2.6, -- +20% от t3
		health_regen 	= 120*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 10800*0.8, -- +8% от t3
		death_wreck  	= "Race3_H_T2_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
designers.common_params_eng_huge_boss =
	{
		uiName			= "eng_huge_enclave",
		signature		= ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 270000,
		health_regen 	= 270000 / 60,
		damage_to_host 	= 350000,
		death_wreck  	= "UniqBoss_Engine_Wreck",--"Race3_H_T2_Engine_Wreck", --models\ships\race_4\h\race4_h_t1_craftuniq_boss_eng_wreck
		death_spell		= "Engine_off",
		spell_on_equip 	= "BossSlowImmune"
		
	}
designers.common_params_eng_huge_r3_t5 =
	{
		uiName = "eng_huge_r3",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 7000*2.6, -- +40% от t3
		health_regen 	= 150*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 11600*0.8, -- +16% от t3
		death_wreck  	= "Race3_H_T3_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_eng_huge_r5_t3 =
	{
		uiName 			= "eng_huge_r5",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model, hitbox = true, }, --solid_type = solid.box 
		--physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.sphere, sphere_radius = 2.3, hitbox = true, }, --solid_type = solid.box 		
		damageable 		= true,
		health 			= 5000*2.6, --500
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 10000*0.8,
		--death_wreck  	= "Race1_H_T1_Engine_Wreck",
		death_spell		= "Engine_off",
--[[ 		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			}, ]]
	}
	
designers.engine_huge_r1_t3 = GenerateEngTable(   
	"models/ships/race_1/h/r1_h_t1_eng", --engine name
	"models/ships/race_1/h/r1_h_t1_boost", --boost L model name
	"models/ships/race_1/h/r1_h_t1_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Huge_t3", --short_name
	designers.common_params_eng_huge_r1_t3
)
designers.engine_huge_r1_t4 = GenerateEngTable(   
	"models/ships/race_1/h/r1_h_t2_eng", --engine name
	"models/ships/race_1/h/r1_h_t2_boost_l", --boost L model name
	"models/ships/race_1/h/r1_h_t2_boost_r", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Huge_t4", --short_name
	designers.common_params_eng_huge_r1_t4
)
designers.engine_huge_r1_t5 = GenerateEngTable(   
	"models/ships/race_1/h/r1_h_t3_eng", --engine name
	"models/ships/race_1/h/r1_h_t3_boost", --boost L model name
	"models/ships/race_1/h/r1_h_t3_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Huge_t5", --short_name
	designers.common_params_eng_huge_r1_t5
)
designers.engine_huge_r1_t5_ev = GenerateEngTable(   
	"models/ships/specialships/event_halloween/event_halloween_eng", --engine name
	"models/ships/specialships/event_halloween/event_halloween_boost", --boost L model name
	"models/ships/specialships/event_halloween/event_halloween_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Huge_t5_ev", --short_name
	designers.common_params_eng_huge_r1_t5_ev
)
designers.engine_huge_r1_t5_uniq = GenerateEngTable(   
	"models/ships/race_1/h/r1_h_t4_eng", --engine name
	"models/ships/race_1/h/r1_h_t4_boost", --boost L model name
	"models/ships/race_1/h/r1_h_t4_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Huge_t5_uniq", --short_name
	designers.common_params_eng_huge_r1_t5_uniq
)
designers.engine_huge_r2_t3 = GenerateEngTable(   
	"models/ships/race_2/h/r2_h_t1_eng", --engine name
	"models/ships/race_2/h/r2_h_t1_boost", --boost L model name
	"models/ships/race_2/h/r2_h_t1_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race2_Huge_t3", --short_name
	designers.common_params_eng_huge_r2_t3
)
designers.engine_huge_r2_t4 = GenerateEngTable(   
	"models/ships/race_2/h/r2_h_t2_eng", --engine name
	"models/ships/race_2/h/r2_h_t2_boost", --boost L model name
	"models/ships/race_2/h/r2_h_t2_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race2_Huge_t4", --short_name
	designers.common_params_eng_huge_r2_t4
)
designers.engine_huge_r2_t5 = GenerateEngTable(   
	"models/ships/race_2/h/r2_h_t3_eng", --engine name
	"models/ships/race_2/h/r2_h_t3_boost", --boost L model name
	"models/ships/race_2/h/r2_h_t3_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race2_Huge_t5", --short_name
	designers.common_params_eng_huge_r2_t5
)
designers.engine_huge_r2_t6 = GenerateEngTable(   
	"models/ships/race_2/h/r2_h_t4_eng", --engine name
	"models/ships/race_2/h/r2_h_t4_boost", --boost L model name
	"models/ships/race_2/h/r2_h_t4_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race2_Huge_t6", --short_name
	designers.common_params_eng_huge_r2_t6
)
designers.engine_huge_r3_t3 = GenerateEngTable(   
	"models/ships/race_3/h/r3_h_t1_eng", --engine name
	"models/ships/race_3/h/r3_h_t1_boost", --boost L model name
	"models/ships/race_3/h/r3_h_t1_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race3_Huge_t3", --short_name
	designers.common_params_eng_huge_r3_t3
)
designers.engine_huge_r3_t4 = GenerateEngTable(   
	"models/ships/race_3/h/r3_h_altair_eng", --engine name
	"models/ships/race_3/h/r3_h_altair_boost", --boost L model name
	"models/ships/race_3/h/r3_h_altair_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race3_Huge_t4", --short_name
	designers.common_params_eng_huge_r3_t4
)

designers.engine_huge_r3_t5 = GenerateEngTable(   
	"models/ships/race_3/h/r3_h_monarch_eng", --engine name
	"models/ships/race_3/h/r3_h_monarch_boost_l", --boost L model name
	"models/ships/race_3/h/r3_h_monarch_boost_r", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race3_Huge_t5", --short_name
	designers.common_params_eng_huge_r3_t5
)

designers.engine_r3_t4s_premUniq = GenerateEngTable(   
	"models/ships/race_3/s/race3_s_t4_prem_uniq_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_3/s/race3_s_t4_prem_uniq_boost_l", --boost L model name 
	"models/ships/race_3/s/race3_s_t4_prem_uniq_boost_r", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race3_Small_PremUniq" --short_name
)

designers.engine_r3_t3s_wolverine = GenerateEngTable(   
	"models/ships/race_3/s/r3_s_wolverine_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_3/s/r3_s_wolverine_boost", --boost L model name 
	"models/ships/race_3/s/r3_s_wolverine_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race3_Small_wolverine" --short_name
)


designers.engine_r3_t5s_CraftSpT5 = GenerateEngTable(   
	"models/ships/race_3/s/race3_s_t5_craftspec_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_3/s/race3_s_t5_craftspec_boost", --boost L model name 
	"models/ships/race_3/s/race3_s_t5_craftspec_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race3_Small_CraftSpT5" --short_name
)

designers.engine_r3_t5l_comodo = GenerateEngTable(   
	"models/ships/race_3/l/r3_l_tylosaurus_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_3/l/r3_l_tylosaurus_boost", --boost L model name 
	"models/ships/race_3/l/r3_l_tylosaurus_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race3_Large_comodo" --short_name
)

designers.engine_r1_t4l_premUniq = GenerateEngTable(   
	"models/ships/race_1/l/r1_l_t1_m3_engine", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_1/l/r1_l_t1_m3_boost", --boost L model name 
	"models/ships/race_1/l/r1_l_t1_m3_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_PremUniq" --short_name
)

designers.engine_medium_granite_grades = GenerateEngTable(   
	"models/ships/race_1/m/race1_m_granite_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_1/m/race1_m_granite_boost", --boost L model name 
	"models/ships/race_1/m/race1_m_granite_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_Medium_CraftUniq_Granite" --short_name
)

designers.engine_r1_t4l_craftUniq = GenerateEngTable(   
	"models/ships/race_1/l/r1_l_spiral_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_1/l/r1_l_spiral_boost", --boost L model name 
	"models/ships/race_1/l/r1_l_spiral_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_craftUniq" --short_name
)

designers.engine_large_proj = GenerateEngTable(   
	"models/ships/race_1/l/r1_l_project1011_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_1/l/r1_l_project1011_boost", --boost L model name 
	"models/ships/race_1/l/r1_l_project1011_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_ProjectSniper" --short_name
)

designers.engine_r3_t4l_craftUniq = GenerateEngTable(   
	"models/ships/race_3/l/r3_l_shuttle_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_3/l/r3_l_shuttle_boost", --boost L model name 
	"models/ships/race_3/l/r3_l_shuttle_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race3_Large_craftUniq" --short_name
)

designers.engine_r1_t4s_craftUniq = GenerateEngTable(   
	"models/ships/race_1/s/r1_s_spiral_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_1/s/r1_s_spiral_boost", --boost L model name 
	"models/ships/race_1/s/r1_s_spiral_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race1_Small_craftUniq" --short_name
)

designers.engine_r2_t4m_premUniq = GenerateEngTable(   
	"models/ships/race_2/m/race2_m_t4_premuniq_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_2/m/race2_m_t4_premuniq_boost_l", --boost L model name 
	"models/ships/race_2/m/race2_m_t4_premuniq_boost_r", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race2_Medium_PremUniq" --short_name
)

designers.engine_medium_race2_singularity = GenerateEngTable(   
	"models/ships/race_2/m/race2_m_singularity_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_2/m/race2_m_singularity_boost", --boost L model name 
	"models/ships/race_2/m/race2_m_singularity_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race2_Medium_Singularity" --short_name
)

designers.engine_race1_m = GenerateEngTable(   
	"models/ships/race_1/m/race1_m_t2m2_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_1/m/race1_m_t2m2_boost", --boost L model name 
	"models/ships/race_1/m/race1_m_t2m2_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_Medium_Deimos" --short_name
)

designers.engine_r1_Herald = GenerateEngTable(   
	"models/ships/race_1/s/r1_s_dyrnwyn_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_1/s/r1_s_dyrnwyn_boost", --boost L model name 
	"models/ships/race_1/s/r1_s_dyrnwyn_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race1_Small_Herald" --short_name
)

--                Race5
--------------------------------------------------------------------------

--SCOUT
designers.engine_r5_r5s = GenerateEngTable(   
	"models/ships/race_5/s/r5_s_t1_ev1_eng", --engine name
	"models/ships/race_5/s/r5_s_t1_ev1_boost", --boost L model name
	"models/ships/race_5/s/r5_s_t1_ev1_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_R5" --short_name
)
designers.engine_r5_r7s = GenerateEngTable(   
	"models/ships/race_5/s/r5_s_t1_ev2_eng", --engine name
	"models/ships/race_5/s/r5_s_t1_ev2_boost", --boost L model name
	"models/ships/race_5/s/r5_s_t1_ev2_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_R7" --short_name
)
designers.engine_r5_r9s = GenerateEngTable(   
	"models/ships/race_5/s/r5_s_t1_ev3_eng", --engine name
	"models/ships/race_5/s/r5_s_t1_ev3_boost", --boost L model name
	"models/ships/race_5/s/r5_s_t1_ev3_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_R9" --short_name
)
designers.engine_r5_r11s = GenerateEngTable(   
	"models/ships/race_5/s/r5_s_t1_ev4_eng", --engine name
	"models/ships/race_5/s/r5_s_t1_ev4_boost", --boost L model name
	"models/ships/race_5/s/r5_s_t1_ev4_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_R11" --short_name
)
designers.engine_r5_r13s = GenerateEngTable(   
	"models/ships/race_5/s/r5_s_t1_ev5_eng", --engine name
	"models/ships/race_5/s/r5_s_t1_ev5_boost", --boost L model name
	"models/ships/race_5/s/r5_s_t1_ev5_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_R13" --short_name
)

-- RECON
designers.engine_r5_r5recon = GenerateEngTable(   
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_st1_eng", --engine name
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_st1_boost", --boost L model name
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_st1_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_Recon_R5" --short_name
)
designers.engine_r5_r9recon = GenerateEngTable(   
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_st2_eng", --engine name
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_st2_boost", --boost L model name
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_st2_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_Recon_R9" --short_name
)
designers.engine_r5_r12recon = GenerateEngTable(   
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_st3_eng", --engine name
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_st3_boost", --boost L model name
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_st3_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_Recon_R12" --short_name
)



--ATTACK
designers.engine_r5_r5m = GenerateEngTable(   
	"models/ships/race_5/m/r5_m_t1_ev1_eng", --engine name
	"models/ships/race_5/m/r5_m_t1_ev1_boost", --boost L model name
	"models/ships/race_5/m/r5_m_t1_ev1_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race5_Medium_R5" --short_name
)
designers.engine_r5_r7m = GenerateEngTable(   
	"models/ships/race_5/m/r5_m_t1_ev2_eng", --engine name
	"models/ships/race_5/m/r5_m_t1_ev2_boost", --boost L model name
	"models/ships/race_5/m/r5_m_t1_ev2_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race5_Medium_R7" --short_name
)
designers.engine_r5_r9m = GenerateEngTable(   
	"models/ships/race_5/m/r5_m_t1_ev3_eng", --engine name
	"models/ships/race_5/m/r5_m_t1_ev3_boost", --boost L model name
	"models/ships/race_5/m/r5_m_t1_ev3_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race5_Medium_R9" --short_name
)

designers.engine_r5_r11m = GenerateEngTable(   
	"models/ships/race_5/m/r5_m_t1_ev4_eng", --engine name
	"models/ships/race_5/m/r5_m_t1_ev4_boost", --boost L model name
	"models/ships/race_5/m/r5_m_t1_ev4_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race5_Medium_R11" --short_name
)
designers.engine_r5_r13m = GenerateEngTable(   
	"models/ships/race_5/m/r5_m_t1_ev5_eng", --engine name
	"models/ships/race_5/m/r5_m_t1_ev5_boost", --boost L model name
	"models/ships/race_5/m/r5_m_t1_ev5_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race5_Medium_R13" --short_name
)

-- ENGINEER
designers.engine_r5_r5l1 = GenerateEngTable(   
	"models/ships/race_5/l/r5_l_t1_ev1_eng", --engine name
	"models/ships/race_5/l/r5_l_t1_ev1_boosts", --boost L model name
	"models/ships/race_5/l/r5_l_t1_ev1_boosts", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Large_R5" --short_name
)
designers.engine_r5_r7l1 = GenerateEngTable(   
	"models/ships/race_5/l/r5_l_t1_ev2_eng", --engine name
	"models/ships/race_5/l/r5_l_t1_ev2_boosts", --boost L model name
	"models/ships/race_5/l/r5_l_t1_ev2_boosts", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Large_R7" --short_name
)
designers.engine_r5_r9l1 = GenerateEngTable(   
	"models/ships/race_5/l/r5_l_t1_ev3_eng", --engine name
	"models/ships/race_5/l/r5_l_t1_ev3_boosts", --boost L model name
	"models/ships/race_5/l/r5_l_t1_ev3_boosts", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Large_R9" --short_name
)
designers.engine_r5_r11l1 = GenerateEngTable(   
	"models/ships/race_5/l/r5_l_t1_ev4_eng", --engine name
	"models/ships/race_5/l/r5_l_t1_ev4_boosts", --boost L model name
	"models/ships/race_5/l/r5_l_t1_ev4_boosts", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Large_R11" --short_name
)
designers.engine_r5_r13l1 = GenerateEngTable(   
	"models/ships/race_5/l/r5_l_t1_ev5_eng", --engine name
	"models/ships/race_5/l/r5_l_t1_ev5_boosts", --boost L model name
	"models/ships/race_5/l/r5_l_t1_ev5_boosts", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Large_R13" --short_name
)

designers.engine_huge_r5_t3 = GenerateEngTable(   
	--"models/ships/race_5/h/r5_h_eng_ev1", --engine name
	"models/ships/race_5/h/r5_h_eng_together_ev1", --engine name
	"models/ships/race_5/h/r5_h_boost_ev1", --boost L model name
	"models/ships/race_5/h/r5_h_boost_ev1", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Huge_R5",--, --short_name
	designers.common_params_eng_huge_r5_t3
)
designers.engine_huge_r5_t4 = GenerateEngTable(   
	--"models/ships/race_5/h/r5_h_eng_ev1", --engine name
	"models/ships/race_5/h/r5_h_eng_together_2_ev2", --engine name
	"models/ships/race_5/h/r5_h_boost_ev1", --boost L model name
	"models/ships/race_5/h/r5_h_boost_ev1", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Huge_R11",--, --short_name
	designers.common_params_eng_huge_r5_t3
)
designers.engine_huge_r5_t5 = GenerateEngTable(   
	--"models/ships/race_5/h/r5_h_eng_ev1", --engine name
	"models/ships/race_5/h/r5_h_eng_together_ev5", --engine name
	"models/ships/race_5/h/r5_h_boost_ev4", --boost L model name
	"models/ships/race_5/h/r5_h_boost_ev4", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Huge_R13",--, --short_name
	designers.common_params_eng_huge_r5_t3
)


designers.engine_l_ufo = GenerateEngTable(   
	"", --engine name   --- эта вся генерация дочерних таблиц перезаписывается в экселе для этого движка
	"", --boost L model name
	"", --boost R model name
	designers.engine_large_race1_grades, --base table
	"UFO_Large" --short_name
)

designers.engine_m_ufoball = GenerateEngTable(   
	"models/ships/specialships/ship_ball/ship_ball_eng", --engine name   --- эта вся генерация дочерних таблиц перезаписывается в экселе для этого движка
	nil, --"", --boost L model name
	nil, --"", --boost R model name
	designers.engine_large_race1_grades, --base table
	"UFOBALL_Medium" --short_name
)

designers.engine_m_ufoballR = GenerateEngTable(   
	"models/ships/specialships/ship_ball/ship_ball_eng", --engine name   --- эта вся генерация дочерних таблиц перезаписывается в экселе для этого движка
	nil, --"", --boost L model name
	nil, --"", --boost R model name
	designers.engine_large_race1_grades, --base table
	"UFOBALL_MediumR" --short_name
)

designers.engine_m_ufoballG = GenerateEngTable(   
	"models/ships/specialships/ship_ball/ship_ball_eng", --engine name   --- эта вся генерация дочерних таблиц перезаписывается в экселе для этого движка
	nil, --"", --boost L model name
	nil, --"", --boost R model name
	designers.engine_large_race1_grades, --base table
	"UFOBALL_MediumG" --short_name
)

designers.engine_m_ufoballB = GenerateEngTable(   
	"models/ships/specialships/ship_ball/ship_ball_eng", --engine name   --- эта вся генерация дочерних таблиц перезаписывается в экселе для этого движка
	nil, --"", --boost L model name
	nil, --"", --boost R model name
	designers.engine_large_race1_grades, --base table
	"UFOBALL_MediumB" --short_name
)

designers.engine_m_ufoballY = GenerateEngTable(   
	"models/ships/specialships/ship_ball/ship_ball_eng", --engine name   --- эта вся генерация дочерних таблиц перезаписывается в экселе для этого движка
	nil, --"", --boost L model name
	nil, --"", --boost R model name
	designers.engine_large_race1_grades, --base table
	"UFOBALL_MediumY" --short_name
)

designers.engine_medium_r2_CraftSpec = GenerateEngTable(   
	"models/ships/race_2/m/race2_m_t5_craftspec_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_2/m/race2_m_t5_craftspec_boost_l", --boost L model name 
	"models/ships/race_2/m/race2_m_t5_craftspec_boost_r", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race2_Medium_CraftSpec" --short_name
)

designers.engine_large_r1_t5_PU_April = GenerateEngTable(   
	"models/ships/specialships/event_aprile/ship_event_aprile_eng1", --engine name
	"models/ships/race_2/s/race2_s_t3_zhen/race2_s_t3_zhen_boost", --boost L model name
	"models/ships/race_2/s/race2_s_t3_zhen/race2_s_t3_zhen_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_t5_PU_April", --short_name
	{
		spell_on_equip="April_Heal_Bonus"
	}
)

Def.ModuleEngine_CrystallDroneBot =
{
	class			= "EngineModule",
	in_editor		= false,
	do_not_export	= true,

	--engine_effect	= "particles/ships/engine_base",
	trail_effect = "particles/ships/ship_trail",
	trail_effect_bone = "root",
	trail_color = "121 36 1 100",
	trail_size = 0.05,

	--[[
	engine_flare_size		= 1.85,
	engine_flare_angle		= 90,
	engine_flare_color		= "96 153 247 127",
	engine_flare_nebulosity	= 0.2,

	engine_light_radius		= 4.0,
	engine_light_color		= "96 153 247 64",
	]]--
	
	engine_sound_left		= "sound/engine/left_engine",
	engine_sound_right		= "sound/engine/right_engine",
	precache_skins			= true,
	
	engine_sound    	= "sound/game/small_engine_loop",
	
	model				= "models/objects/ships_huge/prec_ship/prec_drone2_eng",
	--boost_model_bone1	= "boost_1",
	--boost_model1		= "models/ships/race_4/l/r4_l_boost",
	
	boost_effect		= "particles/ships/boost",
	
	boost_loop_sound	= "sound/game/boost/small_start_loop",
	boost_stop_sound	= "sound/game/boost/small_end",
	
	--[[
	boost_flare_nebulosity	= 0.8,
	boost_flare_size		= 0.85,
	boost_flare_angle		= 80,
	boost_flare_color		= "96 153 247 127",
	]]--
}

-- босс для пиратского притона 
designers.engine_huge_craftuniq_boss = GenerateEngTable(   
	"models/ships/race_4/h/race4_h_t1_craftuniq_boss_eng", --engine name
	"models/ships/race_4/h/race4_h_t1_craftuniq_boss_boost", --boost L model name
	"models/ships/race_4/h/race4_h_t1_craftuniq_boss_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race4_huge_craftuniq_boss", --short_name
	designers.common_params_eng_huge_boss
)

designers.engine_small_st = GenerateEngTable(   
	nil, --engine name
	nil, --boost L model name
	nil, --boost R model name
	designers.engine_small_race1_grades, --base table
	"st_s_engine", --short_name
	{
		max_speed_mul		= 0,
		acceleration_mul	= 0,
	}
)

designers.engine_medium_st = GenerateEngTable(   
	nil, --engine name
	nil, --boost L model name
	nil, --boost R model name
	designers.engine_medium_r1_t1m2, --base table
	"st_m_engine", --short_name
	{
		max_speed_mul		= 0,
		acceleration_mul	= 0,
	}
)

designers.engine_large_st = GenerateEngTable(   
	nil, --engine name
	nil, --boost L model name
	nil, --boost R model name
	designers.engine_large_r1_t5_PU, --base table
	"st_l_engine", --short_name
	{
		max_speed_mul		= 0,
		acceleration_mul	= 0,
	}
)

designers.engine_huge_st = GenerateEngTable(   
	nil, --engine name
	nil, --boost L model name
	nil, --boost R model name
	designers.engine_huge_r1_t3, --base table
	"st_h_engine", --short_name
	{
		max_speed_mul		= 0,
		acceleration_mul	= 0,
	}
)

designers.engine_large_r1_craftSpec = GenerateEngTable(   
	"models/ships/race_1/l/race1_l_t5_craftspec/race1_l_t5_craftspec_eng", --engine name
	"models/ships/race_1/l/race1_l_t5_craftspec/race1_l_t5_craftspec_boost", --boost L model name 
	nil, --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_Scylla" --short_name
)

designers.engine_large_sniper = GenerateEngTable(   
	"models/ships/race_1/l/race1_l_t5_sniper/race1_l_t5_sniper_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_1/l/race1_l_t5_sniper/race1_l_t5_sniper_boost", --boost L model name 
	"models/ships/race_1/l/race1_l_t5_sniper/race1_l_t5_sniper_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_Sniper" --short_name
)

designers.engine_medium_r3_t5_craftuniq = GenerateEngTable(   
	"models/ships/race_3/m/tornado/r3_m_tornado_eng", --engine name
	"models/ships/race_3/m/tornado/r3_m_tornado_boost", --boost L model name
	"models/ships/race_3/m/tornado/r3_m_tornado_boost", --boost R model name
	designers.engine_medium_race3_grades, --base table
	"Race3_Medium_T5_CraftUniq" --short_name
)

designers.engine_large_r3_t5_raven = GenerateEngTable(   
	"models/ships/race_3/l/r3_l_raven/r3_l_raven_engine", --engine name
	"models/ships/race_3/l/r3_l_raven/r3_l_raven_boost", --boost L model name
	"models/ships/race_3/l/r3_l_raven/r3_l_raven_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race3_Large_T5_Raven" --short_name
)

designers.engine_zm_humans = GenerateEngTable(   
	nil, --engine name
	nil, --boost L model name
	nil, --boost R model name
	designers.engine_medium_race2_grades, --base table
	"Race2_Medium_ZM_Humans" --short_name
)

designers.engine_zm_aliens = GenerateEngTable(   
	nil, --engine name
	nil, --boost L model name
	nil, --boost R model name
	designers.engine_alien_r2_m_grades, --base table
	"Race2_Medium_ZM_Aliens" --short_name
 )
 
designers.engine_small_race2_doctor = GenerateEngTable(   
	"models/ships/specialships/plague_doctor/plague_doctor_eng", --engine name
	"models/ships/specialships/plague_doctor/plague_doctor_boost", --boost L model name
	"models/ships/specialships/plague_doctor/plague_doctor_boost", --boost R model name
	designers.engine_small_race2_grades, --base table
	"Race2_Small_Doctor" --short_name
 )

 designers.engine_large_r3_polarbear = GenerateEngTable(   
	"models/ships/race_3/l/r3_l_polarbear/polarbear_eng", --engine name
	"models/ships/race_3/l/r3_l_polarbear/polarbear_boost", --boost L model name
	"models/ships/race_3/l/r3_l_polarbear/polarbear_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race3_Large_Polarbear" --short_name
 )
  
 designers.engine_small_race5_salyut = GenerateEngTable(   
	"models/ships/specialships/station/salyut_st_eng", --engine name
	"models/ships/specialships/station/salyut_st_boost", --boost L model name
	"models/ships/specialships/station/salyut_st_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_Salyut" --short_name
 )
 
 designers.engine_large_race3_mole = GenerateEngTable(   
	"models/ships/race_3/l/r3_l_mole/r3_l_mole_eng", --engine name
	"models/ships/race_3/l/r3_l_mole/r3_l_mole_boost", --boost L model name
	"models/ships/race_3/l/r3_l_mole/r3_l_mole_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race3_Large_Mole" --short_name
 )
 
 designers.engine_large_race2_protazan = GenerateEngTable(   
	"models/ships/race_2/l/race2_l_t5_protazan/race2_l_t5_protazan_eng", --engine name
	"models/ships/race_2/l/race2_l_t5_protazan/race2_l_t5_protazan_boost", --boost L model name
	"models/ships/race_2/l/race2_l_t5_protazan/race2_l_t5_protazan_boost", --boost R model name
	designers.engine_large_race2_grades, --base table
	"Race2_Large_Protazan" --short_name
 )
 
  designers.engine_close_range_grades = GenerateEngTable(   
	"models/ships/race_1/m/r1_m_eng1_collision", --engine name
	"models/ships/race_1/m/r1_m_boost1_l_collision", --boost L model name
	"models/ships/race_1/m/r1_m_boost1_r_collision", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_CD", --short_name
	{
		signature		= ai.Signature.TINY,
		physics 		= { mass = 1000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 4000,
		--health_regen 	= 1000/30,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 40000,
		--death_spell		= "Engine_off",
	}
 )
 
designers.engine_large_race2_t5_naglfar = GenerateEngTable(   
	"models/ships/race_2/l/race2_l_t5_naglfar/race2_l_t5_naglfar_eng", --engine name	
	"models/ships/race_2/l/race2_l_t5_naglfar/race2_l_t5_naglfar_boost", --boost L model name
	"models/ships/race_2/l/race2_l_t5_naglfar/race2_l_t5_naglfar_boost", --boost R model name
	designers.engine_large_race2_grades, --base table
	"Race2_Large_Naglfar" --short_name
)

designers.engine_huge_race3_t5_uniq = GenerateEngTable(   
	"models/ships/race_3/h/r3_h_t4_albiero_eng", --engine name	
	"models/ships/race_3/h/r3_h_t4_albiero_boost", --boost L model name
	"models/ships/race_3/h/r3_h_t4_albiero_boost", --boost R model name
	designers.engine_huge_r3_t5, --base table
	"Race3_Huge_Uniq", --short_name
	{
		death_wreck  	= "Race3_H_T5_Uniq_Engine_Wreck",
	}
)

designers.engine_huge_race3_t5_uniq_small = GenerateEngTable(   
	"models/ships/race_3/s/r3_s_albiero/r3_s_albiero_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_3/s/r3_s_albiero/r3_s_albiero_boost_l", --boost L model name 
	"models/ships/race_3/s/r3_s_albiero/r3_s_albiero_boost_r", --boost R model name
	designers.engine_small_race3_grades, --base table
	"Race3_Huge_Uniq_Small" --short_name
)

designers.engine_medium_race1_t5_dlc = GenerateEngTable(   
	"models/ships/race_1/m/race1_m_t5_thor/race1_m_t5_thor_eng", --engine name	
	"models/ships/race_1/m/race1_m_t5_thor/race1_m_t5_thor_boost", --boost L model name
	"models/ships/race_1/m/race1_m_t5_thor/race1_m_t5_thor_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_Medium_Dlc" --short_name
)

designers.engine_medium_r2_CraftUniq = GenerateEngTable(   
	"models/ships/race_2/m/race2_m_t5_kirishima/race2_m_t5_kirishima_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_2/m/race2_m_t5_kirishima/race2_m_t5_kirishima_boost", --boost L model name 
	"models/ships/race_2/m/race2_m_t5_kirishima/race2_m_t5_kirishima_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race2_Medium_CraftUniq" --short_name
)

designers.engine_small_race2_kusarigama = GenerateEngTable(   
	"models/ships/race_2/s/race2_s_t5_kusarigama/race2_s_t5_kusarigama_eng", --engine name
	"models/ships/race_2/s/race2_s_t5_kusarigama/race2_s_t5_kusarigama_boost", --boost L model name
	"models/ships/race_2/s/race2_s_t5_kusarigama/race2_s_t5_kusarigama_boost", --boost R model name
	designers.engine_small_race2_grades, --base table
	"Race2_Small_Kusarigama" --short_name
 )
 
designers.engine_medium_race3_irbis_grades = GenerateEngTable(   
	"models/ships/race_3/m/race3_m_t5_irbis/race3_m_t5_irbis_eng", --engine name
	"models/ships/race_3/m/race3_m_t5_irbis/race3_m_t5_irbis_boost", --boost L model name
	"models/ships/race_3/m/race3_m_t5_irbis/race3_m_t5_irbis_boost", --boost R model name
	designers.engine_medium_race3_grades, --base table
	"Race3_Medium_Irbis" --short_name
)

 designers.engine_large_race4_thrasher = GenerateEngTable(   
	"models/ships/race_4/l/race4_l_thrasher/race4_l_thrasher_eng", --engine name
	"models/ships/race_4/l/race4_l_thrasher/race4_l_thrasher_boost", --boost L model name
	"models/ships/race_4/l/race4_l_thrasher/race4_l_thrasher_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race1_Large_Thrasher" --short_name
 )
 
designers.engine_medium_race1_typhon_grades = GenerateEngTable(   
	"models/ships/race_1/m/race1_m_t5_typhon/race1_m_t5_typhon_eng", --engine name
	"models/ships/race_1/m/race1_m_t5_typhon/race1_m_t5_typhon_boost", --boost L model name
	"models/ships/race_1/m/race1_m_t5_typhon/race1_m_t5_typhon_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_Medium_Typhon" --short_name
)

designers.engine_medium_race1_bark_grades = GenerateEngTable(   
	"models/ships/race_1/m/race1_m_il2/race1_m_il2_eng", --engine name
	"models/ships/race_1/m/race1_m_il2/race1_m_il2_boost", --boost L model name
	"models/ships/race_1/m/race1_m_il2/race1_m_il2_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_Medium_Bark" --short_name
)

designers.engine_medium_race1_chaos_grades = GenerateEngTable(   
	"models/ships/specialships/stuka/stuka_eng", --engine name
	"models/ships/specialships/stuka/stuka_boost", --boost L model name
	"models/ships/specialships/stuka/stuka_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_Medium_chaos" --short_name
)

designers.engine_small_race5_ace_grades = GenerateEngTable(   
	"models/ships/race_3/s/r3_s_ghost/r3_s_ghost_eng", --engine name
	"models/ships/race_3/s/r3_s_ghost/r3_s_ghost_boost", --boost L model name
	"models/ships/race_3/s/r3_s_ghost/r3_s_ghost_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race5_Small_Ace" --short_name
)

 designers.engine_small_race1_nordstorm_grades = GenerateEngTable(   
	"models/ships/race_1/s/race1_s_t5_nordstorm/race1_s_t5_nordstorm_eng", --engine name
	"models/ships/race_1/s/race1_s_t5_nordstorm/race1_s_t5_nordstorm_boost", --boost L model name
	"models/ships/race_1/s/race1_s_t5_nordstorm/race1_s_t5_nordstorm_boost", --boost R model name
	designers.engine_medium_race3_grades, --base table -- тк он типо иерихон, изначально в названии дефа напутал 
	"Race1_Small_Nordstorm" --short_name
)

designers.engine_large_race2_t5_Confessor = GenerateEngTable(   
	"models/ships/race_2/l/race2_l_t5_confessor/race2_l_t5_confessor_eng", --engine name	
	"models/ships/race_2/l/race2_l_t5_confessor/race2_l_t5_confessor_boost", --boost L model name
	"models/ships/race_2/l/race2_l_t5_confessor/race2_l_t5_confessor_boost", --boost R model name
	designers.engine_large_race2_grades, --base table
	"Race2_Large_Confessor" --short_name
)

designers.engine_small_race1_t5_Bootl = GenerateEngTable(   
	"models/ships/race_1/s/race1_s_t5_seeress/race1_s_t5_seeress_eng", --engine name	
	"models/ships/race_1/s/race1_s_t5_seeress/race1_s_t5_seeress_boost", --boost L model name
	"models/ships/race_1/s/race1_s_t5_seeress/race1_s_t5_seeress_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race1_Small_Bootl" --short_name
)

designers.engine_large_race5_t5_helicon = GenerateEngTable(   
	"models/ships/specialships/helicon_frigate/helicon_frigate_eng", --engine name	
	"models/ships/specialships/helicon_frigate/helicon_frigate_boost", --boost L model name
	"models/ships/specialships/helicon_frigate/helicon_frigate_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Large_helicon_frigate" --short_name
)

designers.engine_medium_race2_t5_baphomet = GenerateEngTable(   
	"models/ships/race_2/m/race2_m_t5_baphomet/race2_m_t5_baphomet_eng", --engine name	
	"models/ships/race_2/m/race2_m_t5_baphomet/race2_m_t5_baphomet_boost", --boost L model name
	"models/ships/race_2/m/race2_m_t5_baphomet/race2_m_t5_baphomet_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race2_Medium_Baphomet" --short_name
)

designers.engine_race1_m_t5_hadrian = GenerateEngTable(   
	"models/ships/race_1/m/race1_m_t5_hadrian/race1_m_t5_hadrian_eng", --engine name
	"models/ships/race_1/m/race1_m_t5_hadrian/race1_m_t5_hadrian_boost", --boost L model name
	"models/ships/race_1/m/race1_m_t5_hadrian/race1_m_t5_hadrian_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race1_Medium_Hadrian" --short_name
)

 designers.engine_large_race5_salamander = GenerateEngTable(   
	"models/ships/specialships/chinese_frigate/chinese_frigate_eng", --engine name
	"models/ships/specialships/chinese_frigate/chinese_frigate_boost", --boost L model name
	"models/ships/specialships/chinese_frigate/chinese_frigate_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race5_Large_salamander" --short_name
 )
 
 designers.engine_medium_race3_manul_grades = GenerateEngTable(   
	"models/ships/race_3/m/race3_m_t5_manul/race3_m_t5_manul_eng", --engine name
	"models/ships/race_3/m/race3_m_t5_manul/race3_m_t5_manul_boost", --boost L model name
	"models/ships/race_3/m/race3_m_t5_manul/race3_m_t5_manul_boost", --boost R model name
	designers.engine_medium_race3_grades, --base table
	"Race3_Medium_manul" --short_name
)

designers.engine_small_r1_corvulnus = GenerateEngTable(   
	"models/ships/race_1/s/race1_s_t5_corvulnus/race1_s_t5_corvulnus_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/race_1/s/race1_s_t5_corvulnus/race1_s_t5_corvulnus_boost", --boost L model name 
	"models/ships/race_1/s/race1_s_t5_corvulnus/race1_s_t5_corvulnus_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race1_Small_corvulnus" --short_name
)

-- COMMAND
designers.engine_medium_race5_command_ev1 = GenerateEngTable(   
	"models/ships/race_5/m/r5_m_t2_ev1_eng", --engine name
	"models/ships/race_5/m/r5_m_t2_ev1_boost", --boost L model name
	"models/ships/race_5/m/r5_m_t2_ev1_boost", --boost R model name
	designers.engine_medium_race3_grades, --base table
	"Race5_Medium_COMMAND_R5" --short_name
)

designers.engine_medium_race5_command_ev2 = GenerateEngTable(   
	"models/ships/race_5/m/r5_m_t2_ev2_eng", --engine name
	"models/ships/race_5/m/r5_m_t2_ev2_boost", --boost L model name
	"models/ships/race_5/m/r5_m_t2_ev2_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race5_Medium_COMMAND_R9" --short_name
)

designers.engine_medium_race5_command_ev3 = GenerateEngTable(   
	"models/ships/race_5/m/r5_m_t2_ev3_eng", --engine name
	"models/ships/race_5/m/r5_m_t2_ev3_boost", --boost L model name
	"models/ships/race_5/m/r5_m_t2_ev3_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race5_Medium_COMMAND_R12" --short_name
)

-- GUARD
designers.engine_large_race5_guard_ev1 = GenerateEngTable(   
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st1_eng", --engine name
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st1_boost", --boost L model name
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st1_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race5_Large_GUARD_R5" --short_name
)

designers.engine_large_race5_guard_ev2 = GenerateEngTable(   
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st2_eng", --engine name
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st2_boost", --boost L model name
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st2_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race5_Large_GUARD_R9" --short_name
)

designers.engine_large_race5_guard_ev3 = GenerateEngTable(   
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st3_eng", --engine name
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st3_boost", --boost L model name
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st3_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race5_Large_GUARD_R12" --short_name
)

designers.engine_large_r3_srike = GenerateEngTable(   
	"models/ships/race_3/l/r3_l_jester/r3_l_jester_eng", --engine name
	"models/ships/race_3/l/r3_l_jester/r3_l_jester_boost", --boost L model name
	"models/ships/race_3/l/r3_l_jester/r3_l_jester_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race3_Large_srike" --short_name
 )
 
  designers.engine_small_r2_pilum = GenerateEngTable(   
	"models/ships/race_2/s/race2_s_pilum/race2_s_pilum_eng", --  "models/ships/race_2/s/r2_s_eng1_premium", --engine name
	"models/ships/race_2/s/race2_s_pilum/race2_s_pilum_boost", --models/ships/race_2/s/r2_s_boost1_l_premium", --boost L model name
	"models/ships/race_2/s/race2_s_pilum/race2_s_pilum_boost", --"models/ships/race_2/s/r2_s_boost1_r_premium", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race2_Small_r2_pilum" --short_name
 )
 
 designers.common_params_eng_r5_helios =
{
		uiName = "eng_helios",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 1, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= false,
		health 			= 1500, -- +40% от t3
		health_regen 	= 100,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 1000, -- +16% от t3
		death_wreck  	= "models/ships/race_1/l/race1_l_helios/race1_l_helios_eng_damage",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
}
	
designers.engine_large_r5_helios = GenerateEngTable(   
	"models/ships/race_1/l/race1_l_helios/race1_l_helios_eng", --engine name
	"models/ships/race_1/l/race1_l_helios/race1_l_helios_boost", --boost L model name
	"models/ships/race_1/l/race1_l_helios/race1_l_helios_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Large_helios_frigate", --short_name
	designers.common_params_eng_r5_helios
)	

designers.engine_small_race1_t5_Psiloi = GenerateEngTable(   
	"models/ships/race_1/s/race1_s_psiloi/race1_s_psiloi_eng", --engine name	
	"models/ships/race_1/s/race1_s_psiloi/race1_s_psiloi_boost", --boost L model name
	"models/ships/race_1/s/race1_s_psiloi/race1_s_psiloi_boost", --boost R model name
	designers.engine_small_race1_grades, --base table
	"Race1_Small_Psiloi" --short_name
)

designers.common_params_eng_huge_r5_t5_Bashe =
{
		uiName = "eng_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 7000*2.6, -- +40% от t3
		health_regen 	= 150*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 11600*0.8, -- +16% от t3
		death_wreck  	= "Race1_H_Bashe_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.engine_huge_r5_t5_bashe = GenerateEngTable(   
	"models/ships/specialships/destroyer_serpent/destroyer_serpent_eng", --engine name
	"models/ships/specialships/destroyer_serpent/destroyer_serpent_boost", --boost L model name
	"models/ships/specialships/destroyer_serpent/destroyer_serpent_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Huge_t5_Bashe", --short_name
	designers.common_params_eng_huge_r5_t5_Bashe
)	

 designers.engine_medium_race3_persei_grades = GenerateEngTable(   
	"models/ships/specialships/persei8/persei8_eng", --engine name
	"models/ships/specialships/persei8/persei8_boost", --boost L model name
	"models/ships/specialships/persei8/persei8_boost", --boost R model name
	designers.engine_medium_race3_grades, --base table
	"Race3_Medium_persei" --short_name
)

designers.engine_large_r3_hallas = GenerateEngTable(   
	"models/ships/specialships/katalina/katalina_eng", --engine name
	"models/ships/specialships/katalina/katalina_boost", --boost L model name
	"models/ships/specialships/katalina/katalina_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race3_Large_hallas" --short_name
 )
 
 designers.engine_medium_race2_amber = GenerateEngTable(   
	"models/ships/specialships/amber/amber_eng", --engine name race3_s_t4_prem_uniq_eng
	"models/ships/specialships/amber/amber_boost", --boost L model name 
	"models/ships/specialships/amber/amber_boost", --boost R model name
	designers.engine_medium_race1_grades, --base table
	"Race2_Medium_Amber" --short_name
)

 designers.engine_small_r2_t5_cinquedea = GenerateEngTable(   
	"models/ships/race_2/s/race2_s_dagger/race2_s_dagger_eng", --  
	"models/ships/race_2/s/race2_s_dagger/race2_s_dagger_boost", 
	"models/ships/race_2/s/race2_s_dagger/race2_s_dagger_boost", 
	designers.engine_small_race1_grades, --base table
	"Race2_Small_r2_t5_cinquedea" --short_name
 )
 
 designers.engine_large_r2_carolingian = GenerateEngTable(   
	"models/ships/race_2/l/race2_l_t5_drakkar/race2_l_t5_drakkar_eng", --engine name
	"models/ships/race_2/l/race2_l_t5_drakkar/race2_l_t5_drakkar_boost", --boost L model name
	"models/ships/race_2/l/race2_l_t5_drakkar/race2_l_t5_drakkar_boost", --boost R model name
	designers.engine_large_race3_grades, --base table
	"Race2_Large_carolingian" --short_name
 )
 
designers.common_params_eng_huge_saturn =
	{
		uiName = "eng_huge_r3",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.box
		damageable 		= true,
		health 			= 7000*2.6, -- +40% от t3
		health_regen 	= 150*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 11600*0.8, -- +16% от t3
		death_wreck  	= "Saturn_H_Engine_Wreck",
		death_spell		= "Engine_off",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
 designers.engine_huge_t5_saturn_st1 = GenerateEngTable(   
	"models/ships/specialships/destroyer_ring/destroyer_ring_st1_eng", --engine name
	"models/ships/specialships/destroyer_ring/destroyer_ring_st1_boost", --boost L model name
	"models/ships/specialships/destroyer_ring/destroyer_ring_st1_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Huge_t5_saturn",--, --short_name
	designers.common_params_eng_huge_saturn
)
 designers.engine_huge_t5_saturn_st2 = GenerateEngTable(   
	"models/ships/specialships/destroyer_ring/destroyer_ring_st2_eng", --engine name
	"models/ships/specialships/destroyer_ring/destroyer_ring_st2_boost", --boost L model name
	"models/ships/specialships/destroyer_ring/destroyer_ring_st2_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Huge_t5_saturn",--, --short_name
	designers.common_params_eng_huge_saturn
)
 designers.engine_huge_t5_saturn_st3 = GenerateEngTable(   
	"models/ships/specialships/destroyer_ring/destroyer_ring_st3_eng", --engine name
	"models/ships/specialships/destroyer_ring/destroyer_ring_st3_boost", --boost L model name
	"models/ships/specialships/destroyer_ring/destroyer_ring_st3_boost", --boost R model name
	designers.engine_large_race1_grades, --base table
	"Race5_Huge_t5_saturn",--, --short_name
	designers.common_params_eng_huge_saturn
)