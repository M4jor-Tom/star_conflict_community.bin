-- 
Def.Module_Capacitor_Base =
{
	module_type		= ai.ModuleType.CAPACITOR,
	class			= "SpaceShipModule",
	in_editor		= false,
	--model			= "models/modules/capacitor/race1/m/capacitor_race1_m_t1",
	model2_bone		= "capacitor_2",	-- если на модели корабля найдется такая косточка, то там будет создана дополнительная модель capacitor'а
	do_not_export	= true, -- робот не эксппортит и не проверяет валидность.
}



--------------------------------------------------------------------------------------------------
--    CAPACITOR UPGRADES LINES
--------------------------------------------------------------------------------------------------

designers.capacitor_small_race1_grades =
	{
		{ "ModuleCapacitor_Race1_Small_Mk1", 0 },
		{ "ModuleCapacitor_Race1_Small_Mk2", 25000 },
		{ "ModuleCapacitor_Race1_Small_Mk3", 750000 },
		{ "ModuleCapacitor_Race1_Small_Mk4", 175000 },
		{ "ModuleCapacitor_Race1_Small_Mk5", 300000 },
		{ "ModuleCapacitor_Race1_Small_Mk6", 400000 },
	}
designers.capacitor_medium_race1_grades =
	{
		{ "ModuleCapacitor_Race1_Medium_Mk1", 0 },
		{ "ModuleCapacitor_Race1_Medium_Mk2", 25000 },
		{ "ModuleCapacitor_Race1_Medium_Mk3", 750000 },
		{ "ModuleCapacitor_Race1_Medium_Mk4", 175000 },
		{ "ModuleCapacitor_Race1_Medium_Mk5", 300000 },
		{ "ModuleCapacitor_Race1_Medium_Mk6", 400000 },
	}
designers.capacitor_large_race1_grades =
	{
		{ "ModuleCapacitor_Race1_Large_Mk1", 0 },
		{ "ModuleCapacitor_Race1_Large_Mk2", 25000 },
		{ "ModuleCapacitor_Race1_Large_Mk3", 750000 },
		{ "ModuleCapacitor_Race1_Large_Mk4", 175000 },
		{ "ModuleCapacitor_Race1_Large_Mk5", 300000 },
		{ "ModuleCapacitor_Race1_Large_Mk6", 400000 },
	}
designers.capacitor_small_race2_grades =
	{
		{ "ModuleCapacitor_Race2_Small_Mk1", designers.capacitor_small_race1_grades[1][2] },
		{ "ModuleCapacitor_Race2_Small_Mk2", designers.capacitor_small_race1_grades[2][2] },
		{ "ModuleCapacitor_Race2_Small_Mk3", designers.capacitor_small_race1_grades[3][2] },
		{ "ModuleCapacitor_Race2_Small_Mk4", designers.capacitor_small_race1_grades[4][2] },
		{ "ModuleCapacitor_Race2_Small_Mk5", designers.capacitor_small_race1_grades[5][2] },
		{ "ModuleCapacitor_Race2_Small_Mk6", designers.capacitor_small_race1_grades[6][2] },
	}
designers.capacitor_small_race3_grades =
	{
		{ "ModuleCapacitor_Race3_Small_Mk1", designers.capacitor_small_race1_grades[1][2] },
		{ "ModuleCapacitor_Race3_Small_Mk2", designers.capacitor_small_race1_grades[2][2] },
		{ "ModuleCapacitor_Race3_Small_Mk3", designers.capacitor_small_race1_grades[3][2] },
		{ "ModuleCapacitor_Race3_Small_Mk4", designers.capacitor_small_race1_grades[4][2] },
		{ "ModuleCapacitor_Race3_Small_Mk5", designers.capacitor_small_race1_grades[5][2] },
		{ "ModuleCapacitor_Race3_Small_Mk6", designers.capacitor_small_race1_grades[6][2] },
	}

designers.capacitor_medium_race2_grades =
	{
		{ "ModuleCapacitor_Race2_Medium_Mk1", designers.capacitor_medium_race1_grades[1][2] },
		{ "ModuleCapacitor_Race2_Medium_Mk2", designers.capacitor_medium_race1_grades[2][2] },
		{ "ModuleCapacitor_Race2_Medium_Mk3", designers.capacitor_medium_race1_grades[3][2] },
		{ "ModuleCapacitor_Race2_Medium_Mk4", designers.capacitor_medium_race1_grades[4][2] },
		{ "ModuleCapacitor_Race2_Medium_Mk5", designers.capacitor_medium_race1_grades[5][2] },
		{ "ModuleCapacitor_Race2_Medium_Mk6", designers.capacitor_medium_race1_grades[6][2] },
	}
designers.capacitor_medium_race3_grades =
	{
		{ "ModuleCapacitor_Race3_Medium_Mk1", designers.capacitor_medium_race1_grades[1][2] },
		{ "ModuleCapacitor_Race3_Medium_Mk2", designers.capacitor_medium_race1_grades[2][2] },
		{ "ModuleCapacitor_Race3_Medium_Mk3", designers.capacitor_medium_race1_grades[3][2] },
		{ "ModuleCapacitor_Race3_Medium_Mk4", designers.capacitor_medium_race1_grades[4][2] },
		{ "ModuleCapacitor_Race3_Medium_Mk5", designers.capacitor_medium_race1_grades[5][2] },
		{ "ModuleCapacitor_Race3_Medium_Mk6", designers.capacitor_medium_race1_grades[6][2] },
	}

designers.capacitor_large_race2_grades =
	{
		{ "ModuleCapacitor_Race2_Large_Mk1", designers.capacitor_large_race1_grades[1][2] },
		{ "ModuleCapacitor_Race2_Large_Mk2", designers.capacitor_large_race1_grades[2][2] },
		{ "ModuleCapacitor_Race2_Large_Mk3", designers.capacitor_large_race1_grades[3][2] },
		{ "ModuleCapacitor_Race2_Large_Mk4", designers.capacitor_large_race1_grades[4][2] },
		{ "ModuleCapacitor_Race2_Large_Mk5", designers.capacitor_large_race1_grades[5][2] },
		{ "ModuleCapacitor_Race2_Large_Mk6", designers.capacitor_large_race1_grades[6][2] },
	}
designers.capacitor_large_race3_grades =
	{
		{ "ModuleCapacitor_Race3_Large_Mk1", designers.capacitor_large_race1_grades[1][2] },
		{ "ModuleCapacitor_Race3_Large_Mk2", designers.capacitor_large_race1_grades[2][2] },
		{ "ModuleCapacitor_Race3_Large_Mk3", designers.capacitor_large_race1_grades[3][2] },
		{ "ModuleCapacitor_Race3_Large_Mk4", designers.capacitor_large_race1_grades[4][2] },
		{ "ModuleCapacitor_Race3_Large_Mk5", designers.capacitor_large_race1_grades[5][2] },
		{ "ModuleCapacitor_Race3_Large_Mk6", designers.capacitor_large_race1_grades[6][2] },
	}
	
-- Уникальные капаситоры пиратских кораблей
---------------------------------------
Def.ModuleCapacitor_Phoenix_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk1",
	model				= "models/ships/race_4/l/race4_l_phoenix_capacitor",
}
Def.ModuleCapacitor_Phoenix_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk2",
	model				= "models/ships/race_4/l/race4_l_phoenix_capacitor",
}
Def.ModuleCapacitor_Phoenix_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk3",
	model				= "models/ships/race_4/l/race4_l_phoenix_capacitor",
}
Def.ModuleCapacitor_Phoenix_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk4",
	model				= "models/ships/race_4/l/race4_l_phoenix_capacitor",
}
Def.ModuleCapacitor_Phoenix_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk5",
	model				= "models/ships/race_4/l/race4_l_phoenix_capacitor",
}
Def.ModuleCapacitor_Phoenix_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk6",
	model				= "models/ships/race_4/l/race4_l_phoenix_capacitor",
}

designers.capacitor_large_phoenix_grades =
	{
		{ "ModuleCapacitor_Phoenix_Mk1", designers.capacitor_large_race1_grades[1][2] },
		{ "ModuleCapacitor_Phoenix_Mk2", designers.capacitor_large_race1_grades[2][2] },
		{ "ModuleCapacitor_Phoenix_Mk3", designers.capacitor_large_race1_grades[3][2] },
		{ "ModuleCapacitor_Phoenix_Mk4", designers.capacitor_large_race1_grades[4][2] },
		{ "ModuleCapacitor_Phoenix_Mk5", designers.capacitor_large_race1_grades[5][2] },
		{ "ModuleCapacitor_Phoenix_Mk6", designers.capacitor_large_race1_grades[6][2] },
	}
	
--------	
Def.ModuleCapacitor_Reaper_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk1",
	model				= "models/ships/race_4/l/race4_l_capacitor",
}
Def.ModuleCapacitor_Reaper_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk2",
	model				= "models/ships/race_4/l/race4_l_capacitor",
}
Def.ModuleCapacitor_Reaper_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk3",
	model				= "models/ships/race_4/l/race4_l_capacitor",
}
Def.ModuleCapacitor_Reaper_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk4",
	model				= "models/ships/race_4/l/race4_l_capacitor",
}
Def.ModuleCapacitor_Reaper_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk5",
	model				= "models/ships/race_4/l/race4_l_capacitor",
}
Def.ModuleCapacitor_Reaper_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Large_Mk6",
	model				= "models/ships/race_4/l/race4_l_capacitor",
}

designers.capacitor_large_reaper_grades =
	{
		{ "ModuleCapacitor_Reaper_Mk1", designers.capacitor_large_race1_grades[1][2] },
		{ "ModuleCapacitor_Reaper_Mk2", designers.capacitor_large_race1_grades[2][2] },
		{ "ModuleCapacitor_Reaper_Mk3", designers.capacitor_large_race1_grades[3][2] },
		{ "ModuleCapacitor_Reaper_Mk4", designers.capacitor_large_race1_grades[4][2] },
		{ "ModuleCapacitor_Reaper_Mk5", designers.capacitor_large_race1_grades[5][2] },
		{ "ModuleCapacitor_Reaper_Mk6", designers.capacitor_large_race1_grades[6][2] },
	}
	
Def.ModuleCapacitor_Shark_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk1",
	model				= "models/ships/race_4/m/r4_m_shark_capacitor",
}
Def.ModuleCapacitor_Shark_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk2",
	model				= "models/ships/race_4/m/r4_m_shark_capacitor",
}
Def.ModuleCapacitor_Shark_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk3",
	model				= "models/ships/race_4/m/r4_m_shark_capacitor",
}
Def.ModuleCapacitor_Shark_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk4",
	model				= "models/ships/race_4/m/r4_m_shark_capacitor",
}
Def.ModuleCapacitor_Shark_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk5",
	model				= "models/ships/race_4/m/r4_m_shark_capacitor",
}
Def.ModuleCapacitor_Shark_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk6",
	model				= "models/ships/race_4/m/r4_m_shark_capacitor",
}

designers.capacitor_medium_shark_grades =
	{
		{ "ModuleCapacitor_Shark_Mk1", designers.capacitor_medium_race1_grades[1][2] },
		{ "ModuleCapacitor_Shark_Mk2", designers.capacitor_medium_race1_grades[2][2] },
		{ "ModuleCapacitor_Shark_Mk3", designers.capacitor_medium_race1_grades[3][2] },
		{ "ModuleCapacitor_Shark_Mk4", designers.capacitor_medium_race1_grades[4][2] },
		{ "ModuleCapacitor_Shark_Mk5", designers.capacitor_medium_race1_grades[5][2] },
		{ "ModuleCapacitor_Shark_Mk6", designers.capacitor_medium_race1_grades[6][2] },
	}
	
------
Def.ModuleCapacitor_Jocker_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk1",
	model				= "models/ships/race_4/m/r4_m_jocker_capacitor",
}
Def.ModuleCapacitor_Jocker_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk2",
	model				= "models/ships/race_4/m/r4_m_jocker_capacitor",
}
Def.ModuleCapacitor_Jocker_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk3",
	model				= "models/ships/race_4/m/r4_m_jocker_capacitor",
}
Def.ModuleCapacitor_Jocker_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk4",
	model				= "models/ships/race_4/m/r4_m_jocker_capacitor",
}
Def.ModuleCapacitor_Jocker_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk5",
	model				= "models/ships/race_4/m/r4_m_jocker_capacitor",
}
Def.ModuleCapacitor_Jocker_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk6",
	model				= "models/ships/race_4/m/r4_m_jocker_capacitor",
}

designers.capacitor_medium_jocker_grades =
	{
		{ "ModuleCapacitor_Jocker_Mk1", designers.capacitor_medium_race1_grades[1][2] },
		{ "ModuleCapacitor_Jocker_Mk2", designers.capacitor_medium_race1_grades[2][2] },
		{ "ModuleCapacitor_Jocker_Mk3", designers.capacitor_medium_race1_grades[3][2] },
		{ "ModuleCapacitor_Jocker_Mk4", designers.capacitor_medium_race1_grades[4][2] },
		{ "ModuleCapacitor_Jocker_Mk5", designers.capacitor_medium_race1_grades[5][2] },
		{ "ModuleCapacitor_Jocker_Mk6", designers.capacitor_medium_race1_grades[6][2] },
	}
	
------
Def.ModuleCapacitor_Grim_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk1",
	model				= "models/ships/race_4/s/r4_s_jer_capacitor",
}
Def.ModuleCapacitor_Grim_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk2",
	model				= "models/ships/race_4/s/r4_s_jer_capacitor",
}
Def.ModuleCapacitor_Grim_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk3",
	model				= "models/ships/race_4/s/r4_s_jer_capacitor",
}
Def.ModuleCapacitor_Grim_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk4",
	model				= "models/ships/race_4/s/r4_s_jer_capacitor",
}
Def.ModuleCapacitor_Grim_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk5",
	model				= "models/ships/race_4/s/r4_s_jer_capacitor",
}
Def.ModuleCapacitor_Grim_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk6",
	model				= "models/ships/race_4/s/r4_s_jer_capacitor",
}

designers.capacitor_small_grim_grades =
	{
		{ "ModuleCapacitor_Grim_Mk1", designers.capacitor_small_race1_grades[1][2] },
		{ "ModuleCapacitor_Grim_Mk2", designers.capacitor_small_race1_grades[2][2] },
		{ "ModuleCapacitor_Grim_Mk3", designers.capacitor_small_race1_grades[3][2] },
		{ "ModuleCapacitor_Grim_Mk4", designers.capacitor_small_race1_grades[4][2] },
		{ "ModuleCapacitor_Grim_Mk5", designers.capacitor_small_race1_grades[5][2] },
		{ "ModuleCapacitor_Grim_Mk6", designers.capacitor_small_race1_grades[6][2] },
	}
------
Def.ModuleCapacitor_Sai_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk1",
	model				= "models/ships/race_4/s/r4_s_capacitor",
}
Def.ModuleCapacitor_Sai_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk2",
	model				= "models/ships/race_4/s/r4_s_capacitor",
}
Def.ModuleCapacitor_Sai_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk3",
	model				= "models/ships/race_4/s/r4_s_capacitor",
}
Def.ModuleCapacitor_Sai_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk4",
	model				= "models/ships/race_4/s/r4_s_capacitor",
}
Def.ModuleCapacitor_Sai_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk5",
	model				= "models/ships/race_4/s/r4_s_capacitor",
}
Def.ModuleCapacitor_Sai_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Small_Mk6",
	model				= "models/ships/race_4/s/r4_s_capacitor",
}

designers.capacitor_small_sai_grades =
	{
		{ "ModuleCapacitor_Sai_Mk1", designers.capacitor_small_race1_grades[1][2] },
		{ "ModuleCapacitor_Sai_Mk2", designers.capacitor_small_race1_grades[2][2] },
		{ "ModuleCapacitor_Sai_Mk3", designers.capacitor_small_race1_grades[3][2] },
		{ "ModuleCapacitor_Sai_Mk4", designers.capacitor_small_race1_grades[4][2] },
		{ "ModuleCapacitor_Sai_Mk5", designers.capacitor_small_race1_grades[5][2] },
		{ "ModuleCapacitor_Sai_Mk6", designers.capacitor_small_race1_grades[6][2] },
	}
	
Def.ModuleCapacitor_Loki_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk1",
	model				= "models/ships/race_1/m/race1_m_loki_capacitor",
}
Def.ModuleCapacitor_Loki_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk2",
	model				= "models/ships/race_1/m/race1_m_loki_capacitor",
}
Def.ModuleCapacitor_Loki_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk3",
	model				= "models/ships/race_1/m/race1_m_loki_capacitor",
}
Def.ModuleCapacitor_Loki_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk4",
	model				= "models/ships/race_1/m/race1_m_loki_capacitor",
}
Def.ModuleCapacitor_Loki_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk5",
	model				= "models/ships/race_1/m/race1_m_loki_capacitor",
}
Def.ModuleCapacitor_Loki_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk6",
	model				= "models/ships/race_1/m/race1_m_loki_capacitor",
}

designers.capacitor_medium_loki_grades =
	{
		{ "ModuleCapacitor_Loki_Mk1", designers.capacitor_medium_race1_grades[1][2] },
		{ "ModuleCapacitor_Loki_Mk2", designers.capacitor_medium_race1_grades[2][2] },
		{ "ModuleCapacitor_Loki_Mk3", designers.capacitor_medium_race1_grades[3][2] },
		{ "ModuleCapacitor_Loki_Mk4", designers.capacitor_medium_race1_grades[4][2] },
		{ "ModuleCapacitor_Loki_Mk5", designers.capacitor_medium_race1_grades[5][2] },
		{ "ModuleCapacitor_Loki_Mk6", designers.capacitor_medium_race1_grades[6][2] },
	}
	
Def.ModuleCapacitor_Razer_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk1",
	model				= "models/ships/race_2/m/race2_m_razer_cap",
}
Def.ModuleCapacitor_Razer_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk2",
	model				= "models/ships/race_2/m/race2_m_razer_cap",
}
Def.ModuleCapacitor_Razer_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk3",
	model				= "models/ships/race_2/m/race2_m_razer_cap",
}
Def.ModuleCapacitor_Razer_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk4",
	model				= "models/ships/race_2/m/race2_m_razer_cap",
}
Def.ModuleCapacitor_Razer_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk5",
	model				= "models/ships/race_2/m/race2_m_razer_cap",
}
Def.ModuleCapacitor_Razer_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk6",
	model				= "models/ships/race_2/m/race2_m_razer_cap",
}

designers.capacitor_medium_razer_grades =
	{
		{ "ModuleCapacitor_Razer_Mk1", designers.capacitor_medium_race2_grades[1][2] },
		{ "ModuleCapacitor_Razer_Mk2", designers.capacitor_medium_race2_grades[2][2] },
		{ "ModuleCapacitor_Razer_Mk3", designers.capacitor_medium_race2_grades[3][2] },
		{ "ModuleCapacitor_Razer_Mk4", designers.capacitor_medium_race2_grades[4][2] },
		{ "ModuleCapacitor_Razer_Mk5", designers.capacitor_medium_race2_grades[5][2] },
		{ "ModuleCapacitor_Razer_Mk6", designers.capacitor_medium_race2_grades[6][2] },
	}
	Def.ModuleCapacitor_Pandorus_Mk1=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk1",
	model				= "models/ships/race_2/l/race2_l_pandorus_cap",
}
Def.ModuleCapacitor_Pandorus_Mk2=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk2",
	model				= "models/ships/race_2/l/race2_l_pandorus_cap",
}
Def.ModuleCapacitor_Pandorus_Mk3=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk3",
	model				= "models/ships/race_2/l/race2_l_pandorus_cap",
}
Def.ModuleCapacitor_Pandorus_Mk4=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk4",
	model				= "models/ships/race_2/l/race2_l_pandorus_cap",
}
Def.ModuleCapacitor_Pandorus_Mk5=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk5",
	model				= "models/ships/race_2/l/race2_l_pandorus_cap",
}
Def.ModuleCapacitor_Pandorus_Mk6=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk6",
	model				= "models/ships/race_2/l/race2_l_pandorus_cap",
}

designers.capacitor_large_pandorus_grades =
	{
		{ "ModuleCapacitor_Pandorus_Mk1", designers.capacitor_large_race2_grades[1][2] },
		{ "ModuleCapacitor_Pandorus_Mk2", designers.capacitor_large_race2_grades[2][2] },
		{ "ModuleCapacitor_Pandorus_Mk3", designers.capacitor_large_race2_grades[3][2] },
		{ "ModuleCapacitor_Pandorus_Mk4", designers.capacitor_large_race2_grades[4][2] },
		{ "ModuleCapacitor_Pandorus_Mk5", designers.capacitor_large_race2_grades[5][2] },
		{ "ModuleCapacitor_Pandorus_Mk6", designers.capacitor_large_race2_grades[6][2] },
	}
	
Def.ModuleCapacitor_Numbfish_Mk1=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk1",
	model				= "models/ships/race_4/l/r4_l_numbfish_capacitor",
}
Def.ModuleCapacitor_Numbfish_Mk2=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk2",
	model				= "models/ships/race_4/l/r4_l_numbfish_capacitor",
}
Def.ModuleCapacitor_Numbfish_Mk3=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk3",
	model				= "models/ships/race_4/l/r4_l_numbfish_capacitor",
}
Def.ModuleCapacitor_Numbfish_Mk4=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk4",
	model				= "models/ships/race_4/l/r4_l_numbfish_capacitor",
}
Def.ModuleCapacitor_Numbfish_Mk5=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk5",
	model				= "models/ships/race_4/l/r4_l_numbfish_capacitor",
}
Def.ModuleCapacitor_Numbfish_Mk6=
{
	inherit				= "ModuleCapacitor_Race2_Large_Mk6",
	model				= "models/ships/race_4/l/r4_l_numbfish_capacitor",
}

designers.capacitor_large_numbfish_grades =
	{
		{ "ModuleCapacitor_Numbfish_Mk1", designers.capacitor_large_race2_grades[1][2] },
		{ "ModuleCapacitor_Numbfish_Mk2", designers.capacitor_large_race2_grades[2][2] },
		{ "ModuleCapacitor_Numbfish_Mk3", designers.capacitor_large_race2_grades[3][2] },
		{ "ModuleCapacitor_Numbfish_Mk4", designers.capacitor_large_race2_grades[4][2] },
		{ "ModuleCapacitor_Numbfish_Mk5", designers.capacitor_large_race2_grades[5][2] },
		{ "ModuleCapacitor_Numbfish_Mk6", designers.capacitor_large_race2_grades[6][2] },
	}
---------------------------------------------------------	
Def.ModuleCapacitor_T5_Prem_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk1",
	model				= "models/ships/race_2/m/r2_m_capacitor1_premium",
}
Def.ModuleCapacitor_T5_Prem_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk2",
	model				= "models/ships/race_2/m/r2_m_capacitor1_premium",
}
Def.ModuleCapacitor_T5_Prem_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk3",
	model				= "models/ships/race_2/m/r2_m_capacitor1_premium",
}
Def.ModuleCapacitor_T5_Prem_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk4",
	model				= "models/ships/race_2/m/r2_m_capacitor1_premium",
}
Def.ModuleCapacitor_T5_Prem_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk5",
	model				= "models/ships/race_2/m/r2_m_capacitor1_premium",
}
Def.ModuleCapacitor_T5_Prem_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk6",
	model				= "models/ships/race_2/m/r2_m_capacitor1_premium",
}

designers.capacitor_medium_t5p_grades =
	{
		{ "ModuleCapacitor_T5_Prem_Mk1", designers.capacitor_medium_race2_grades[1][2] },
		{ "ModuleCapacitor_T5_Prem_Mk2", designers.capacitor_medium_race2_grades[2][2] },
		{ "ModuleCapacitor_T5_Prem_Mk3", designers.capacitor_medium_race2_grades[3][2] },
		{ "ModuleCapacitor_T5_Prem_Mk4", designers.capacitor_medium_race2_grades[4][2] },
		{ "ModuleCapacitor_T5_Prem_Mk5", designers.capacitor_medium_race2_grades[5][2] },
		{ "ModuleCapacitor_T5_Prem_Mk6", designers.capacitor_medium_race2_grades[6][2] },
	}	
	
---------------------------------------------------------	
Def.ModuleCapacitor_Mosquito_Mk1=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk1",
	model				= "models/ships/race_4/m/r4_m_mosquito_capacitor",
}
Def.ModuleCapacitor_Mosquito_Mk2=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk2",
	model				= "models/ships/race_4/m/r4_m_mosquito_capacitor",
}
Def.ModuleCapacitor_Mosquito_Mk3=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk3",
	model				= "models/ships/race_4/m/r4_m_mosquito_capacitor",
}
Def.ModuleCapacitor_Mosquito_Mk4=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk4",
	model				= "models/ships/race_4/m/r4_m_mosquito_capacitor",
}
Def.ModuleCapacitor_Mosquito_Mk5=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk5",
	model				= "models/ships/race_4/m/r4_m_mosquito_capacitor",
}
Def.ModuleCapacitor_Mosquito_Mk6=
{
	inherit				= "ModuleCapacitor_Race1_Medium_Mk6",
	model				= "models/ships/race_4/m/r4_m_mosquito_capacitor",
}

designers.capacitor_medium_mosquito_grades =
	{
		{ "ModuleCapacitor_Mosquito_Mk1", designers.capacitor_medium_race2_grades[1][2] },
		{ "ModuleCapacitor_Mosquito_Mk2", designers.capacitor_medium_race2_grades[2][2] },
		{ "ModuleCapacitor_Mosquito_Mk3", designers.capacitor_medium_race2_grades[3][2] },
		{ "ModuleCapacitor_Mosquito_Mk4", designers.capacitor_medium_race2_grades[4][2] },
		{ "ModuleCapacitor_Mosquito_Mk5", designers.capacitor_medium_race2_grades[5][2] },
		{ "ModuleCapacitor_Mosquito_Mk6", designers.capacitor_medium_race2_grades[6][2] },
	}		
----------------------------

local function GenerateCapTable( model, shablon, short_name, common_params )
	local res = {}
	for i, v in pairs( shablon ) do
		local t_name = "ModuleCapacitor_" .. short_name .. "_Mk".. tostring (i)
		Def[t_name]  = {}
		res[i] = { t_name, v[2] }
		Def[t_name].inherit = v[1]
		Def[t_name].model = model
		if common_params then
			for i_common, v_common in pairs( common_params ) do
				Def[t_name][i_common] = v_common
			end
		end
	end
	return res
end


designers.capacitor_race2_m_t4_premium_grades = GenerateCapTable(   
	"models/ships/race_2/m/r2_m_capacitor1_premium", --model name
	designers.capacitor_medium_race2_grades, --base table
	"race2_m_t4_premium" --short_name
 )
 
designers.capacitor_alien_grades = GenerateCapTable(   
	"models/modules/m_active/m_a_gadget_pulsar", --model name
	designers.capacitor_large_race1_grades, --base table
	"alien_capacitor" --short_name
 )
 
designers.capacitor_alien_r2_m_grades = GenerateCapTable(   
	"models/ships/race_2/m/r2_m_capacitor1_precursor", --model name
	designers.capacitor_medium_race1_grades, --base table
	"alien_r2_m_capacitor" --short_name
 )

designers.capacitor_small_tick_grades = GenerateCapTable(   
	"models/ships/race_4/s/r4_s_tick_capacitor", --model name
	designers.capacitor_small_race1_grades, --base table
	"race2_s_capacitor" --short_name
)

designers.capacitor_race3_l_custom_grades = GenerateCapTable(   
	"models/ships/race_3/l/r3_l_custom_capacitor", --model name
	designers.capacitor_large_race1_grades, --base table
	"r3_l_custom_capacitor" --short_name
)

designers.capacitor_race3_l_craftuniq_grades = GenerateCapTable(   
	"models/misc/null_object", --model name
	designers.capacitor_large_race1_grades, --base table
	"r3_l_craftuniq_capacitor" --short_name
) 

designers.capacitor_small_race2_custom_grades = GenerateCapTable(   
	"models/ships/race_2/s/r2_s_custom_capacitor", --model name
	designers.capacitor_small_race2_grades, --base table
	"race2_s_custom_capacitor" --short_name
) 

designers.capacitor_medium_race1_custom_grades = GenerateCapTable(   
	"models/ships/race_1/m/r1_m_custom_capacitor", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race1_m_custom_capacitor" --short_name
) 

designers.capacitor_l_r2_t5_premium_grades = GenerateCapTable(   
	"models/ships/race_2/l/r2_l_capacitor1_premium", --model name
	designers.capacitor_large_race2_grades, --base table
	"race2_l_t5_premium_capacitor" --short_name
) 

designers.capacitor_l_r2_t5_custom_grades = GenerateCapTable(   
	"models/ships/race_2/l/r2_l_custom_capacitor1", --model name
	designers.capacitor_large_race2_grades, --base table
	"race2_l_t5_custom_capacitor" --short_name
) 

designers.capacitor_l_r2_t5_craftuniq_grades = GenerateCapTable(   
	"models/ships/race_2/l/race2_l_t5_craftuniq_cap", --model name
	designers.capacitor_large_race2_grades, --base table
	"race2_l_t5_craftuniq_capacitor" --short_name
) 

designers.capacitor_small_r2_t5prem_grades = GenerateCapTable(   
	"models/ships/race_2/s/race2_s_t5_premium_capacitor", --"models/ships/race_2/s/r2_s_capacitor1_premium", --model name
	designers.capacitor_small_race1_grades, --base table
	"race2_s_t5p_capacitor" --short_name
)

designers.capacitor_small_r2_t3_zhen = GenerateCapTable(   
	"models/ships/race_2/s/race2_s_t3_zhen/race2_s_t3_zhen_cap", --"models/ships/race_2/s/r2_s_capacitor1_premium", --model name
	designers.capacitor_small_race1_grades, --base table
	"race2_t3_zhen_capacitor" --short_name
)

designers.capacitor_small_r1_t1m2 = GenerateCapTable(   
	"models/ships/race_1/s/r1_s_t1_m2_capacitor1", --model name
	designers.capacitor_small_race1_grades, --base table
	"race1_s_t1m2_capacitor" --short_name
)

designers.capacitor_medium_r1_t1m2 = GenerateCapTable(
	"models/ships/race_1/m/race1_m_t1_m2_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race1_m_t1m2_capacitor" --short_name
)

designers.capacitor_large_r1_t1m2 = GenerateCapTable(
	"models/ships/race_1/l/r1_l_t1_m2_capasitor", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_l_t1m2_capacitor" --short_name
)


designers.capacitor_small_r1_craft = GenerateCapTable(   
	"models/ships/race_1/s/r1_buckshot_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race1_s_t5craft_capacitor" --short_name
)

designers.capacitor_small_r1t4_craftUniq = GenerateCapTable(   
	"models/ships/race_1/s/r1_s_spiral_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race1_s_t4craftUniq_capacitor" --short_name
)

designers.capacitor_large_r1_craft = GenerateCapTable(   
	"models/ships/race_1/l/r1_l_rozon_capasitor", --model name
	designers.capacitor_large_race2_grades, --base table
	"race1_l_t5craft_capacitor" --short_name
)

designers.capacitor_medium_r3_craft = GenerateCapTable(   
	"models/ships/race_3/m/r3_ship_fed_zim_capasitor", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race3_m_t5craft_capacitor" --short_name
) 

designers.capacitor_r2t3s_pirate = GenerateCapTable(   
	"models/ships/race_4/s/r4_s_roof_capacitor", --model name
	designers.capacitor_small_race1_grades, --base table
	"race2_s_t3p_capacitor" --short_name
) 

designers.capacitor_small_r3t5_craft = GenerateCapTable(
	"models/ships/race_3/s/r3_s_craft_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race3_s_t5craft_capacitor" --short_name
)

designers.capacitor_medium_r2_craft = GenerateCapTable(   
	"models/ships/race_2/m/r2_m_evilmask_capasitor", --model name 
	designers.capacitor_medium_race1_grades, --base table
	"race2_m_t5craft_capacitor" --short_name
) 

--уник премиум
designers.capacitor_large_r1_t5_PU = GenerateCapTable(   
	"models/ships/race_1/l/r1_l_engineer_cup", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_l_t5PU_capacitor" --short_name
)

designers.capacitor_medium_r3_t4_PU = GenerateCapTable(   
	"models/ships/race_3/m/archer_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race3_m_t4PU_capacitor" --short_name
)

designers.capacitor_medium_r3_t4_wolfhound = GenerateCapTable(   
	"models/ships/race_3/m/r3_m_t4_wolfhound_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race3_m_t4wolfhound_capacitor" --short_name
)

designers.capacitor_large_r3_t3_PU = GenerateCapTable(   
	"models/ships/race_3/l/r3_l_megalodon_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race3_l_t3PU_capacitor" --short_name
)

designers.capacitor_small_r1_Herald = GenerateCapTable(   
	"models/ships/race_1/s/r1_s_dyrnwyn_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race1_s_Herald_capacitor" --short_name
)


designers.common_params_capacitor_huge_r1_t3 =
	{
		uiName = "capacitor_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 2500*2.6, --500
		health_regen 	= 203,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 8000*0.5,	
		death_wreck  	= "Race1_H_T1_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
designers.common_params_capacitor_huge_r1_t4 =
	{
		uiName 			= "capacitor_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3000*2.6, -- +20% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 8640*0.5, -- +8% от t3
		death_wreck  	= "Race1_H_T1_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_capacitor_huge_r1_t5 =
	{
		uiName 			= "capacitor_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3500*2.6, -- +40% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9280*0.5, -- +16% от t3
		death_wreck  	= "Race1_H_T3_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_capacitor_huge_r1_t5_ev =
	{
		uiName 			= "capacitor_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3500*2.6, -- +40% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9280*0.5, -- +16% от t3
		death_wreck  	= "Halloween_H_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}

designers.common_params_capacitor_huge_r1_t5_uniq =
	{
		uiName 			= "capacitor_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 4000*2.6, -- +60% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9920*0.5, -- +16% от t3
		death_wreck  	= "Race1_H_T4_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}

	
designers.common_params_capacitor_huge_r2_t3 =
	{
		uiName = "capacitor_huge_r2",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 2500*2.6, --500
		health_regen 	= 203,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 8000*0.5,	
		death_wreck  	= "Race2_H_T1_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_capacitor_huge_r2_t4 =
	{
		uiName = "capacitor_huge_r2",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3000*2.6, -- +20% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 8640*0.5, -- +8% от t3
		death_wreck  	= "Race2_H_T1_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_capacitor_huge_r2_t5 =
	{
		uiName = "capacitor_huge_r2",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3500*2.6, -- +40% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9280*0.5, -- +16% от t3
		death_wreck  	= "Race2_H_T3_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
designers.common_params_capacitor_huge_r2_t6 =
	{
		uiName = "capacitor_huge_r2",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 4000*2.6, -- +60% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9920*0.5, -- +16% от t3
		death_wreck  	= "Race2_H_T4_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
		children =
		{
			{ effect = "particles/ships/r2_h_relic_cap_fx", },
		},
	}	

designers.common_params_capacitor_huge_r3_t3 =
	{
		uiName = "capacitor_huge_r3",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 2500*2.6, --500
		health_regen 	= 203,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 8000*0.5,	
		death_wreck  	= "Race3_H_T1_Capacitor_Wreck",
	}
designers.common_params_capacitor_huge_r3_t4 =
	{
		uiName = "capacitor_huge_r3",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3000*2.6, -- +20% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 8640*0.5,	
		death_wreck  	= "Race3_H_T2_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}

designers.common_params_capacitor_huge_r3_t5 =
	{
		uiName = "capacitor_huge_r3",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3500*2.6, -- +40% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9280*0.5,
		death_wreck  	= "Race3_H_T3_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.common_params_capacitor_huge_r5_t3 =
	{
		uiName = "capacitor_huge_r5",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 5000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 2500*2.6, --500
		health_regen 	= 65*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 5000,	
		--death_wreck  	= "Race2_H_T1_Capacitor_Wreck",
	}
	
designers.common_params_capacitor_huge_r5_t5 =
	{
		uiName			= "capacitor_huge_r5",
		signature		= ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3500*2.6, -- +40% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9280*0.5,
		death_wreck  	= "Race3_H_T3_Capacitor_Wreck",
	}

designers.common_params_capacitor_huge_boss =
	{
		uiName			= "capacitor_huge_enclave",
		signature		= ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3500*2.6, -- +40% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9280*0.5,
		death_wreck  	= "Race3_H_T3_Capacitor_Wreck",
	}
	
---   ПЕРЕНЕСТИ МОДЕЛЬ В СПЕЦМОДУЛЬ НЕЛЬЗЯ!!! так как спецмодули одинаковые для всех кораблей, и записаны в базу как дефы
designers.capacitor_huge_r1_t3 = GenerateCapTable(   
	"models/ships/race_1/h/r1_h_t1_capasitor", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_h_t3_capacitor", --short_name
	designers.common_params_capacitor_huge_r1_t3
)
designers.capacitor_huge_r1_t4 = GenerateCapTable(   
	"models/ships/race_1/h/r1_h_t2_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_h_t4_capacitor", --short_name
	designers.common_params_capacitor_huge_r1_t4
)
designers.capacitor_huge_r1_t5 = GenerateCapTable(
	"models/ships/race_1/h/r1_h_t3_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_h_t5_capacitor", --short_name
	designers.common_params_capacitor_huge_r1_t5
)
designers.capacitor_huge_r1_t5_ev = GenerateCapTable(
	"models/ships/specialships/event_halloween/event_halloween_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_h_t5_ev_capacitor", --short_name
	designers.common_params_capacitor_huge_r1_t5_ev
)
designers.capacitor_huge_r1_t5_uniq = GenerateCapTable(
	"models/ships/race_1/h/r1_h_t4_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_h_t5_uniq_capacitor", --short_name
	designers.common_params_capacitor_huge_r1_t5_uniq
)

designers.capacitor_huge_r2_t3 = GenerateCapTable(   
	"models/ships/race_2/h/r2_h_t1_capasitor", --model name
	designers.capacitor_large_race1_grades, --base table
	"race2_h_t3_capacitor", --short_name
	designers.common_params_capacitor_huge_r2_t3
)
designers.capacitor_huge_r2_t4 = GenerateCapTable(   
	"models/ships/race_2/h/r2_h_t2_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race2_h_t4_capacitor", --short_name
	designers.common_params_capacitor_huge_r2_t4
)
designers.capacitor_huge_r2_t5 = GenerateCapTable(
	"models/ships/race_2/h/r2_h_t3_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race2_h_t5_capacitor", --short_name
	designers.common_params_capacitor_huge_r2_t5
)
designers.capacitor_huge_r3_t3 = GenerateCapTable(   
	"models/ships/race_3/h/r3_h_t1_capasitor", --model name
	designers.capacitor_large_race1_grades, --base table
	"race3_h_t3_capacitor", --short_name
	designers.common_params_capacitor_huge_r3_t3
)
designers.capacitor_huge_r3_t4 = GenerateCapTable(   
	"models/ships/race_3/h/r3_h_altair_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race3_h_t4_capacitor", --short_name
	designers.common_params_capacitor_huge_r3_t4
)

designers.capacitor_huge_r3_t5 = GenerateCapTable(   
	"models/ships/race_3/h/r3_h_monarch_capacitor", --model name
	designers.capacitor_large_race1_grades, --base table
	"race3_h_t5_capacitor", --short_name
	designers.common_params_capacitor_huge_r3_t5
)

 --designers.capacitor_race2_m_t4_premium_grades = GenerateCapTable(   "r2_m_capacitor1_premium", designers.capacitor_medium_race2_grades, "race2_m_t4_premium" )

designers.capacitor_small_r3_premUniq = GenerateCapTable(   
	"models/ships/race_3/s/race3_s_t4_prem_uniq_capacitor", --model name
	designers.capacitor_small_race1_grades, --base table
	"race3_s_t4premUniq_capacitor" --short_name
)

designers.capacitor_small_r3_wolverine = GenerateCapTable(   
	"models/ships/race_3/s/r3_s_wolverine_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race3_s_t3wolverine_capacitor" --short_name
)

--
designers.capacitor_small_r3_CraftSpT5 = GenerateCapTable(   
	"models/ships/race_3/s/race3_s_t5_craftspec_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race3_s_CraftSpT5_capacitor" --short_name
)

designers.capacitor_large_r3_comodo = GenerateCapTable(   
	"models/ships/race_3/l/r3_l_tylosaurus_cap", --model name
	designers.capacitor_large_race3_grades, --base table
	"race3_l_t5comodo_capacitor" --short_name
)

designers.capacitor_large_r1_premUniq = GenerateCapTable(   
	"models/ships/race_1/l/r1_l_t1_m3_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_l_t4premUniq_capacitor" --short_name
)

designers.capacitor_large_r1_craftUniq = GenerateCapTable(   
	"models/ships/race_1/l/r1_l_spiral_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_l_t4craftUniq_capacitor" --short_name
)

designers.capacitor_large_proj = GenerateCapTable(   
	"models/ships/race_1/l/r1_l_project1011_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_l_t5proj_capacitor" --short_name
)

designers.capacitor_large_franc = GenerateCapTable(   
	"models/ships/race_2/l/race2_l_francisca_cap", --model name
	designers.capacitor_large_race3_grades, --base table
	"race3_l_t5franc_capacitor" --short_name
)

designers.capacitor_large_r3_craftUniq = GenerateCapTable(   
	"models/ships/race_3/l/r3_l_shuttle_cap", --model name
	designers.capacitor_large_race3_grades, --base table
	"race3_l_t4craftUniq_capacitor" --short_name
)

designers.capacitor_medium_r2_premUniq = GenerateCapTable(   
	"models/ships/race_2/m/race2_m_t4_premuniq_capacitor", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race2_m_t4premUniq_capacitor" --short_name
)

designers.capacitor_medium_race2_singularity = GenerateCapTable(   
	"models/ships/race_5/s/s_al_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race2_singularity_capacitor" --short_name
)

designers.capacitor_race1_m = GenerateCapTable(   
	"models/ships/race_1/m/race1_m_t2m2_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race1_m_capacitor" --short_name
	)
 
designers.capacitor_small_race5_rank5 = GenerateCapTable(   
	"models/ships/race_5/s/s_al_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race5_s_r5_capacitor" --short_name
	)
	
designers.capacitor_medium_race5_rank5 = GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t1_ev1_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race5_m_r5_capacitor" --short_name
	)
designers.capacitor_medium_race5_rank7 = GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t1_ev2_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race5_m_r7_capacitor" --short_name
	)
designers.capacitor_medium_race5_rank9= GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t1_ev3_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race5_m_r9_capacitor" --short_name
	)
designers.capacitor_medium_race5_rank11 = GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t1_ev4_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race5_m_r11_capacitor" --short_name
	)
designers.capacitor_medium_race5_rank13 = GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t1_ev5_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race5_m_r13_capacitor" --short_name
	)
-- Race 5 Recon	
designers.capacitor_small_race5_recon_r5 = GenerateCapTable(   
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race5_s_recon_r13_capacitor" --short_name
	)	
	
designers.capacitor_small_race5_recon_r9 = GenerateCapTable(   
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race5_s_r5_capacitor" --short_name
	)

designers.capacitor_small_race5_recon_r12 = GenerateCapTable(   
	"models/ships/race_5/s/r5_s_ellidium_26/r5_s_ellidium_26_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race5_s_r5_capacitor" --short_name
	)	
	
designers.capacitor_large1_race5_rank5 = GenerateCapTable(   
	"models/ships/race_5/l/r5_l_t1_ev1_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l_r5_capacitor" --short_name
	)
designers.capacitor_large1_race5_rank7 = GenerateCapTable(   
	"models/ships/race_5/l/r5_l_t1_ev2_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l_r7_capacitor" --short_name
	)
designers.capacitor_large1_race5_rank9 = GenerateCapTable(   
	"models/ships/race_5/l/r5_l_t1_ev3_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l_r9_capacitor" --short_name
	)
designers.capacitor_large1_race5_rank11 = GenerateCapTable(   
	"models/ships/race_5/l/r5_l_t1_ev4_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l_r11_capacitor" --short_name
	)
designers.capacitor_large1_race5_rank13 = GenerateCapTable(   
	"models/ships/race_5/l/r5_l_t1_ev5_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l_r13_capacitor" --short_name
	)

designers.capacitor_huge_race5_rank9 = GenerateCapTable(   
	"models/ships/race_5/h/t5_h_t1_ev1_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_h_t3_capacitor", --short_name
	designers.common_params_capacitor_huge_r5_t3
	)
designers.capacitor_huge_race5_rank13 = GenerateCapTable(   
	"models/ships/race_5/h/t5_h_t1_ev3_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_h_t5_capacitor", --short_name
	designers.common_params_capacitor_huge_r5_t5
	)
	
	
designers.capacitor_l_ufo = GenerateCapTable(   
	nil, --model name
	designers.capacitor_large_race1_grades, --base table
	"ufo_l_capacitor" --short_name
	)
	
designers.capacitor_l_ufoball = GenerateCapTable(   
	nil, --model name
	designers.capacitor_large_race1_grades, --base table
	"ufoball_l_capacitor" --short_name
	)	
	
designers.capacitor_medium_r2_CraftSpec = GenerateCapTable(   
	"models/ships/race_2/m/race2_m_t5_craftspec_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race2_m_CraftSpec_capacitor" --short_name
)

designers.capacitor_large_r1_t5_PU_april = GenerateCapTable(   
	nil, --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_l_t5PU_capacitor_april" --short_name
)

designers.capacitor_huge_craftuniq_boss = GenerateCapTable(   
	"models/ships/race_4/h/race4_h_t1_craftuniq_boss_cap",
	designers.capacitor_large_race1_grades, --base table
	"race4_craftuniq_boss", --short_name
	designers.common_params_capacitor_huge_r3_t5
)

designers.capacitor_small_st = GenerateCapTable(   
	nil, --model name
	designers.capacitor_small_race1_grades, --base table
	"st_s_capacitor", --short_name
	{
		energy_max_mul		= 0,
		energy_regen_mul	= 0,
	}
)

designers.capacitor_medium_st = GenerateCapTable(   
	nil, --model name
	designers.capacitor_medium_r1_t1m2, --base table
	"st_m_capacitor", --short_name
	{
		energy_max_mul		= 0,
		energy_regen_mul	= 0,
	}
)

designers.capacitor_large_st = GenerateCapTable(   
	nil, --model name
	designers.capacitor_large_r1_t5_PU, --base table
	"st_l_capacitor", --short_name
	{
		energy_max_mul		= 0,
		energy_regen_mul	= 0,
	}
)

designers.capacitor_huge_st = GenerateCapTable(   
	nil, --model name
	designers.capacitor_huge_r1_t3, --base table
	"st_h_capacitor", --short_name
	{
		energy_max_mul		= 0,
		energy_regen_mul	= 0,
	}
)

designers.capacitor_large_r1_craftSpec = GenerateCapTable(   
	"models/ships/race_1/l/race1_l_t5_craftspec/race1_l_t5_craftspec_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_l_t5_craftSpec_capacitor" --short_name
)

designers.capacitor_large_mech = GenerateCapTable(   
	nil, --model name
	designers.capacitor_large_race1_grades, --base table
	"mech_capacitor" --short_name
)

designers.capacitor_large_sniper = GenerateCapTable(   
	"models/ships/race_1/l/race1_l_t5_sniper/race1_l_t5_sniper_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race1_l_t5_sniper_capacitor" --short_name
)

designers.capacitor_medium_r3_t5_craftuniq = GenerateCapTable(   
	nil, --model name
	designers.capacitor_medium_race1_grades, --base table
	"race3_m_t5_craftuniq_capacitor" --short_name
)

designers.capacitor_large_r3_raven = GenerateCapTable(   
	"models/ships/race_3/l/r3_l_raven/r3_l_raven_capacitor", --model name
	designers.capacitor_large_race3_grades, --base table
	"race3_l_t5_raven_capacitor" --short_name
)

designers.capacitor_small_race2_doctor = GenerateCapTable(   
	"models/ships/specialships/plague_doctor/plague_doctor_cap", --model name
	designers.capacitor_small_race2_grades, --base table
	"race2_s_doctor" --short_name
)

designers.capacitor_huge_r2_t6 = GenerateCapTable(
	"models/ships/race_2/h/r2_h_t4_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race2_h_t6_capacitor", --short_name
	designers.common_params_capacitor_huge_r2_t6
)

designers.capacitor_large_r3_polarbear = GenerateCapTable(
	"models/ships/race_3/l/r3_l_polarbear/polarbear_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race3_l_polarbear_capacitor" --short_name
)

designers.capacitor_small_race5_salyut = GenerateCapTable(   
	"models/misc/null_object", --model name
	designers.capacitor_large_race1_grades, --base table
	"r5_s_salyut_capacitor" --short_name
) 

designers.capacitor_large_r3_mole = GenerateCapTable(
	"models/ships/race_3/l/r3_l_mole/r3_l_mole_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race3_l_mole_capacitor" --short_name
)

designers.capacitor_large_r2_protazan = GenerateCapTable(
	"models/ships/race_2/l/race2_l_t5_protazan/race2_l_t5_protazan_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race2_l_protazan_capacitor" --short_name
)

designers.capacitor_close_range_grades = GenerateCapTable(
	"models/ships/race_1/m/r1_m_capacitor1_collision", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race1_cd_capacitor", --short_name
	{
		signature		= ai.Signature.TINY,
		physics 		= { mass = 1000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 1000,
		--health_regen 	= 1000/20,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 40000,	
	}
)

designers.capacitor_l_r2_t5_naglfar_grades = GenerateCapTable(   
	"models/ships/race_2/l/race2_l_t5_naglfar/race2_l_t5_naglfar_cap", --model name
	designers.capacitor_large_race2_grades, --base table
	"race2_l_t5_naglfar_capacitor" --short_name
)

designers.capacitor_h_r3_t5_uniq_grades = GenerateCapTable(   
	"models/ships/race_3/h/r3_h_t4_albiero_cap", --model name
	designers.capacitor_huge_r3_t5, --base table
	"race3_h_t5_uniq_capacitor", --short_name
	{
		death_wreck  	= "Race3_H_T5_Uniq_Capacitor_Wreck",
	}
)

designers.capacitor_h_r3_t5_uniq_small_grades = GenerateCapTable(   
	"models/ships/race_3/s/r3_s_albiero/r3_s_albiero_cap", --model name
	designers.capacitor_small_race3_grades, --base table
	"race3_h_t5_uniq_s_capacitor" --short_name
)

designers.capacitor_m_r1_t5_dlc_grades = GenerateCapTable(   
	ai.DONT_INHERIT, --model name
	designers.capacitor_medium_race1_grades, --base table
	"race1_m_t5_dlc_capacitor" --short_name
)

designers.capacitor_medium_r2_CraftUniq = GenerateCapTable(   
	"models/ships/race_2/m/race2_m_t5_kirishima/race2_m_t5_kirishima_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race2_m_CraftUniq_capacitor" --short_name
)

designers.capacitor_small_race2_kusarigama = GenerateCapTable(   
	"models/ships/race_2/s/race2_s_t5_kusarigama/race2_s_t5_kusarigama_cap", --model name
	designers.capacitor_small_race2_grades, --base table
	"race2_s_kusarigama" --short_name
)

designers.capacitor_medium_r3_irbis = GenerateCapTable(   
	"models/ships/race_3/m/race3_m_t5_irbis/race3_m_t5_irbis_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race3_m_t5irbis_capacitor", --short_name
	{
		children =
		{
			{ effect = "particles/ships/r3_m_t5_uniq_lightnings", joint = "fx" },
		},
	}
)

designers.capacitor_race4_l_thrasher = GenerateCapTable(   
	"models/ships/race_4/l/race4_l_thrasher/race4_l_thrasher_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race4_l_thrasher_capacitor" --short_name
)

designers.capacitor_race1_m_typhon = GenerateCapTable(   
	"models/ships/race_1/m/race1_m_t5_typhon/race1_m_t5_typhon_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race1_m_typhon_capacitor" --short_name
)

designers.capacitor_race1_m_bark = GenerateCapTable(   
	"models/ships/race_1/m/race1_m_il2/race1_m_il2_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race1_m_bark_capacitor" --short_name
)

designers.capacitor_race1_m_chaos = GenerateCapTable(   
	"models/ships/specialships/stuka/stuka_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race1_m_chaos_capacitor" --short_name
)

designers.capacitor_race5_s_ace = GenerateCapTable(   
	"models/ships/race_3/s/r3_s_ghost/r3_s_ghost_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race5_s_ace_capacitor" --short_name
)

designers.capacitor_race1_s_nordstorm = GenerateCapTable(   
	"models/ships/race_1/s/race1_s_t5_nordstorm/race1_s_t5_nordstorm_cap", --model name
	designers.capacitor_medium_race3_grades, --base table
	"race1_s_nordstorm_capacitor" --short_name
)

designers.capacitor_l_r2_t5_Confessor = GenerateCapTable(   
	"models/ships/race_2/l/race2_l_t5_confessor/race2_l_t5_confessor_cap", --model name
	designers.capacitor_large_race2_grades, --base table
	"race2_l_t5_Confessor_capacitor" --short_name
) 

designers.capacitor_s_r1_t5_Bootl = GenerateCapTable(   
	"models/ships/race_1/s/race1_s_t5_seeress/race1_s_t5_seeress_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race1_s_t5_Bootl_capacitor" --short_name
) 

designers.capacitor_helicon_cap = GenerateCapTable(   
	"models/ships/specialships/helicon_frigate/helicon_frigate_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"r5_l_t5_helicon_capacitor" --short_name
)

designers.capacitor_baphomet_cap = GenerateCapTable(   
	"models/ships/race_2/m/race2_m_t5_baphomet/race2_m_t5_baphomet_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"r2_m_t5_baphomet_capacitor" --short_name
)

designers.capacitor_race1_m_t5_hadrian = GenerateCapTable(   
	"models/ships/race_1/m/race1_m_t5_hadrian/race1_m_t5_hadrian_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race1_m_hadrian_capacitor" --short_name
)

designers.capacitor_large_r5_salamander = GenerateCapTable(
	"models/ships/specialships/chinese_frigate/chinese_frigate_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l_salamander_capacitor" --short_name
)

designers.capacitor_medium_r3_manul = GenerateCapTable(   
	"models/ships/race_3/m/race3_m_t5_manul/race3_m_t5_manul_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race3_m_tmanul_capacitor" --short_name
)

designers.capacitor_small_r1_corvulnus = GenerateCapTable(   
	"models/ships/race_1/s/race1_s_t5_corvulnus/race1_s_t5_corvulnus_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race1_s_corvulnus_capacitor" --short_name
)

designers.capacitor_medium2_race5_rank5_ev1 = GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t2_ev1_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race5_m2_r5_capacitor_ev1" --short_name
	)
	
designers.capacitor_medium2_race5_rank5_ev2 = GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t2_ev2_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race5_m2_r5_capacitor_ev2" --short_name
	)
	
designers.capacitor_medium2_race5_rank5_ev3 = GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t2_ev2_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race5_m2_r5_capacitor_ev3" --short_name
	)

-- green GUARD

designers.capacitor_large2_race5_rank5_ev1 = GenerateCapTable(   
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st1_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l2_r5_capacitor_ev1" --short_name
	)
	
designers.capacitor_large2_race5_rank5_ev2 = GenerateCapTable(   
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st2_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l2_r5_capacitor_ev2" --short_name
	)	
	
designers.capacitor_large2_race5_rank5_ev3 = GenerateCapTable(   
	"models/ships/race_5/l/r5_l_ellidium_25/r5_l_ellidium25_st3_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l2_r5_capacitor_ev3" --short_name
	)	
	
designers.capacitor_large2_race5_rank5_ev2 = GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t2_ev2_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l2_r5_capacitor_ev3" --short_name
	)
	
designers.capacitor_large2_race5_rank5_ev3 = GenerateCapTable(   
	"models/ships/race_5/m/r5_m_t2_ev2_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l2_r5_capacitor_ev3" --short_name
	)	
	
---
designers.capacitor_large_r3_srike = GenerateCapTable(
	"models/ships/race_3/l/r3_l_jester/r3_l_jester_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race3_l_srike_capacitor" --short_name
)

designers.capacitor_small_r2_pilum = GenerateCapTable(   
	"models/ships/race_2/s/race2_s_pilum/race2_s_pilum_cap", --"models/ships/race_2/s/r2_s_capacitor1_premium", --model name
	designers.capacitor_small_race1_grades, --base table
	"race2_pilum_capacitor" --short_name
)

-- designers.common_params_capacitor_helios_r5 =
-- {
		-- uiName = "capacitor_helios_r5",
		-- signature		=	ai.Signature.TINY,
		-- physics 		= { mass = 1, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		-- damageable 		= true,
		-- health 			= 1000, -- +40% от t3
		-- health_regen 	= 100,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		-- damage_to_host 	= 1000,
		-- death_spell		= "Spell_Helios_ModuleOff",
		-- death_wreck  	= "models/ships/race_1/l/race1_l_helios/race1_l_helios_bottom_damage",
		-- broken_parts = 
			-- {
				-- [ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				-- [ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				-- [ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				-- [ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				-- [ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			-- },
-- }

-- designers.capacitor_large_r5_helios = GenerateCapTable(   
	-- --"models/ships/race_1/l/race1_l_helios/race1_l_helios_cap", --model Bottom
	-- "models/ships/race_1/l/race1_l_helios/race1_l_helios_bottom", --model Capacitor
	-- designers.capacitor_large_race1_grades, --base table
	-- "race5_l_helios_capacitor", --short_name
	-- designers.common_params_capacitor_helios_r5
-- )

designers.capacitor_large_r5_helios = GenerateCapTable(
	"models/ships/race_1/l/race1_l_helios/race1_l_helios_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_l_helios_capacitor" --short_name
	--designers.common_params_capacitor_helios_r5
)

designers.capacitor_s_r1_t5_Psiloi = GenerateCapTable(   
	"models/ships/race_1/s/race1_s_psiloi/race1_s_psiloi_cap", --model name
	designers.capacitor_small_race1_grades, --base table
	"race1_s_t5_Psiloi_capacitor" --short_name
) 

designers.common_params_capacitor_huge_r5_t5_bashe =
	{
		uiName 			= "capacitor_huge_r1",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3500*2.6, -- +40% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9280*0.5, -- +16% от t3
		death_wreck  	= "Race1_H_Bashe_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}
	
designers.capacitor_huge_r5_t5_bashe = GenerateCapTable(
	"models/ships/specialships/destroyer_serpent/destroyer_serpent_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_h_t5_capacitor_bashe", --short_name
	designers.common_params_capacitor_huge_r5_t5_bashe
)	

designers.capacitor_medium_r3_persei = GenerateCapTable(   
	"models/ships/specialships/persei8/persei8_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race3_m_persei_capacitor" --short_name
)

designers.capacitor_large_r3_hallas = GenerateCapTable(
	"models/ships/specialships/katalina/katalina_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race3_l_hallas_capacitor" --short_name
)

designers.capacitor_medium_race2_amber = GenerateCapTable(   
	"models/ships/specialships/amber/amber_cap", --model name
	designers.capacitor_medium_race1_grades, --base table
	"race2_amber_capacitor" --short_name
)

designers.capacitor_small_r2_t5_cinquedea = GenerateCapTable(   
	"models/ships/race_2/s/race2_s_dagger/race2_s_dagger_cap", --"models/ships/race_2/s/r2_s_capacitor1_premium", --model name
	designers.capacitor_small_race1_grades, --base table
	"race2_t3_cinquedea_capacitor" --short_name
)

designers.capacitor_large_r2_carolingian = GenerateCapTable(
	"models/ships/race_2/l/race2_l_t5_drakkar/race2_l_t5_drakkar_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race2_l_carolingian_capacitor" --short_name
)

	
designers.common_params_capacitor_saturn_t5 =
	{
		uiName = "capacitor_huge_r3",
		signature		=	ai.Signature.TINY,
		physics 		= { mass = 50000, material = "ShipMetalMk3", solid_type = solid.model }, --solid_type = solid.model
		damageable 		= true,
		health 			= 3500*2.6, -- +40% от t3
		health_regen 	= 100*2,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
		damage_to_host 	= 9280*0.5,
		death_wreck  	= "Saturn_H_Capacitor_Wreck",
		broken_parts = 
			{
				[ 1 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.6, ttl = 20, },
				[ 2 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.55, ttl = 20, },
				[ 3 ] = { model = "models/debris/r1_ships/d3_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.5, ttl = 20, },
				[ 4 ] = { model = "models/debris/r1_ships/d1_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.45, ttl = 20, },
				[ 5 ] = { model = "models/debris/r1_ships/d2_small", effect = "particles/explosions/huge_debris_trail", angle = 360, ang_speed_deviation = 10, pos = Vec3( 0, 0, 0 ), dumping = 0.0, speed = 7.0, speed_deviation = 1.5, speed_inherit = 0.4, ttl = 20, },
			},
	}

designers.capacitor_huge_saturn_st1 = GenerateCapTable(   
	"models/ships/specialships/destroyer_ring/destroyer_ring_st1_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_h_saturn_capacitor", --short_name
	designers.common_params_capacitor_saturn_t5
	)
designers.capacitor_huge_saturn_st2 = GenerateCapTable(   
	"models/ships/specialships/destroyer_ring/destroyer_ring_st2_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_h_saturn_capacitor", --short_name
	designers.common_params_capacitor_saturn_t5
	)
designers.capacitor_huge_saturn_st3 = GenerateCapTable(   
	"models/ships/specialships/destroyer_ring/destroyer_ring_st3_cap", --model name
	designers.capacitor_large_race1_grades, --base table
	"race5_h_saturn_capacitor", --short_name
	designers.common_params_capacitor_saturn_t5
	)