--
--
Def.VitalPoint =
{
	class			= "VitalPoint",
	in_editor		= false,
	
	model			= "models/objects/vital_point/beacon/beacon",
	---model			= "models/objects/vital_point/new_year_beacon/new_year_beacon",	--- NY #57031
	physics			= { solid_type = solid.compound_model, static = true },
	maxViewDist		= 5000,
	use_team_skin	= true,
	
	damageable		= true,
	health			= 5000,
	
	vision_radius_with_drones = 200,
	vision_radius_without_drones  = 100,
	
	capture_radius	= 85.0,
	regen_speed		= 1000.0,
	regen_max_ally	= 1,
	
	idle_sound		= "sound/game/vitalpoint_idle",
	death_sound		= "sound/game/vitalpoint_down",
	capturing_sound = "sound/game/capturing_beacon", 	-- звук захвата, только для игрока
	full_activation_sound 	= "sound/game/vitalpoint_control_activation",	-- звук полного захвата маяка (когда появляются дроны), только для Recaptureable
	captured_from_neutral_sound =  "sound/game/control_vitalpoint_activation", -- звук захвата маяка из нейтрального в союзный. только для Recaptureable
	
	friendly_beam_fx= "particles/other/vp_beam_green",
	hostile_beam_fx = "particles/other/vp_beam_red",
	
	is_decayable	= false,
	decay_damage	= 1,
	decay_max_enemy = 32,
	gameplay_idx	= 0,  -- индекс для голосовых сообщений см. sentence.lua
	
	uiName  		= "VitalPoint"
}

--
Def.VitalPoint_Destroyable =
{
	inherit			= "VitalPoint",
	in_editor		= false,

	health			= 1500,
	
	is_decayable	= false,
}

--
Def.VitalPoint_Captureable =
{
	inherit			= "VitalPoint",
	in_editor		= false,
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	health			= 3500,
	
	damageable		= true,
	is_decayable	= true,
	capture_radius	= 85.0,
	regen_speed		= 30.0,
	regen_max_ally	= 3,
	decay_damage	= 120,
	decay_max_enemy = 3,
	
	--turret_respawn_period	= 15,	-- seconds
}
--
Def.VitalPoint_Recaptureable =
{
	inherit			= "VitalPoint",
	in_editor		= false,
	
	damageable		= true,
	health			= 1000,
	relation_health = 666,		-- здоровье на котором меняется RelationshipGroup
	recaptureable	= true,
	relationship_group 	= 0,
	
	capture_radius	= 85.0,
	regen_speed		= 50.0,
	regen_max_ally	= 3,
	decay_damage	= 50.0,
	decay_max_enemy = 3,

	turret_respawn_period	= 15,	-- seconds
	
	turret_def1 	= "DroidTurret",
	turret_def2 	= "DroidTurret",
	turret_def3 	= "DroidTurret",
	turret_def4 	= "DroidTurret",
}

--
Def.DroidTurret =
{
	class			= "VitalPointTurret",
	in_editor		= false,
	
	model			= "models/objects/vital_point/drone/drone", 
	--model			= "models/objects/vital_point/drone_satellite1/drone_satellite1", -- 12 april #51303
	--model			= "models/objects/vital_point/new_year_drone/new_year_drone", -- NY #57031
	physics			= { solid_type = solid.sphere, kinematic = true, material = "ShipMetalMk3", mass = 1000000, },
	maxViewDist		= 3000,
	use_team_skin	= true,
	
	damageable		= true,
	health			= 15000,	-- 11000 15000 5000 поднял живучесть дронов в Захвате маяков.
	signature		= ai.Signature.SMALL,
	
	death_effect	= "particles/explosions/shp_exp_big_02",
	death_sound		= "sound/explosion/drone_expl",

	fire_rate		= 60.0, -- 100 HITTEST
	dispersion		= 0.5,  --- 1.0 deg
	optimal_range	= 150,	---100
	max_range		= 300,	---150
	projectile_speed= 350,	---250
	
	damage_kinetic	= 0,
	damage_emp		= 0,
	damage_thermal	= 666,	--300

	max_rot_speed	= 200,	-- deg per second
	max_yaw			= 180,
	min_yaw			= -180,
	max_pitch		= 180,
	min_pitch		= -180,
	
	projectile		= "Projectile_Dron_Plasma",
	shot_effect 	= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/turret/turret_oneshot",
	--Default
	children = 
	{
		{ effect = { s1 = "particles/ships/drone_engine_vital_blue", s2 = "particles/ships/drone_engine_vital_red" }, joint = "boost_1" },
		{ effect = { s1 = "particles/ships/drone_engine_vital_blue", s2 = "particles/ships/drone_engine_vital_red" }, joint = "boost_2" },
		{ effect = { s1 = "particles/ships/drone_engine_vital_blue", s2 = "particles/ships/drone_engine_vital_red" }, joint = "boost_3" },
		{ effect = { s1 = "particles/ships/drone_engine_vital_blue", s2 = "particles/ships/drone_engine_vital_red" }, joint = "boost_4" },
	},
	--12 april = no effects
	
	-- New Year
	--children = 
	--{
	--	{ effect = { s1 = "particles/ships/drone_engine_vital_blue_ny", s2 = "particles/ships/drone_engine_vital_red_ny" }, joint = "boost_1" },
	--	{ effect = { s1 = "particles/ships/drone_engine_vital_blue_ny", s2 = "particles/ships/drone_engine_vital_red_ny" }, joint = "boost_2" },
	--},		
}

--
Def.VitalPoint_Team1_BeaconA =
{
	in_editor		= true,
	inherit			= "VitalPoint_Captureable",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName			= "BeaconA",
	gameplay_idx	= 0,
	spawn_group		= 1,
	relationship_group 	= 1,
	turret_def1 	= "GuardDrone",
	turret_def2 	= "GuardDrone",
	turret_def3 	= "GuardDrone",
	turret_def4 	= "GuardDrone",
	
	decay_damage	= 60.0,	--100 120 замедлил захват маяков
	regen_speed		= 50.0,	-- 30 ускорил отхил маяка в порталах
}

Def.VitalPoint_Team1_BeaconB =
{
	inherit			= "VitalPoint_Team1_BeaconA",
	uiName			= "BeaconB",
	gameplay_idx	= 1,
	spawn_group		= 2,
}

Def.VitalPoint_Team1_BeaconC =
{
	inherit			= "VitalPoint_Team1_BeaconA",
	uiName			= "BeaconC",
	gameplay_idx	= 2,
	spawn_group		= 3,
}

Def.VitalPoint_Team2_BeaconA =
{
	inherit			= "VitalPoint_Team1_BeaconA",
	uiName			= "BeaconA",
	gameplay_idx	= 0,
	relationship_group 	= 2,
	spawn_group		= 1,
	turret_def1 	= "GuardDrone",
	turret_def2 	= "GuardDrone",
	turret_def3 	= "GuardDrone",
	turret_def4 	= "GuardDrone",
}

Def.VitalPoint_Team2_BeaconB =
{
	inherit			= "VitalPoint_Team2_BeaconA",
	uiName			= "BeaconB",
	gameplay_idx	= 1,
	spawn_group		= 2,
}

Def.VitalPoint_Team2_BeaconC =
{
	inherit			= "VitalPoint_Team2_BeaconA",
	uiName			= "BeaconC",
	gameplay_idx	= 2,
	spawn_group		= 3,
}

Def.GuardDrone =
{
	inherit			= "DroidTurret",
	uiName			= "GuardDrone",
	default_icon	= "ItemSubtype_BasicGuidedDron",	-- для нормального отображения в DeathRecap
	-- для Хэллоуина. Превращает дронов в тыквы
	--[[ children = 
	{
		{ effect = { s1 = "particles/ships/drone_engine_vital_blue", s2 = "particles/ships/drone_engine_vital_red" }, joint = "boost_1" },
		{ effect = { s1 = "particles/ships/drone_engine_vital_blue", s2 = "particles/ships/drone_engine_vital_red" }, joint = "boost_2" },
		{ effect = { s1 = "particles/ships/drone_engine_vital_blue", s2 = "particles/ships/drone_engine_vital_red" }, joint = "boost_3" },
		{ effect = { s1 = "particles/ships/drone_engine_vital_blue", s2 = "particles/ships/drone_engine_vital_red" }, joint = "boost_4" },
		{ model  = "models/objects/vital_point/drone/drone_pumkin_mask", joint = "yaw" },
	},]]
}

Def.GuardDrone_RC =
{
	inherit			= "GuardDrone",
	health			= 2500,
	projectile_speed= 300, --+50
	optimal_range	= 125,
	max_range		= 250,
	damage_thermal	= 190, -- 150 #0088671: Повысить урон дронов на маяках
}

Def.GuardDrone_PvE =
{
	inherit			= "GuardDrone",
	damage_thermal	= 10,
}

------------------------------------
--  T U T O R I A L
------------------------------------

-- дрон для вражеского туториального маяка
Def.GuardDroneTutorial =
{
	inherit			= "DroidTurret",

	health			= 2000,
	fire_rate		= 30.0,
	damage_kinetic	= 0,
	damage_emp		= 0,
	damage_thermal	= 10,
	
	uiName  		= "GuardDrone",
	default_icon	= "ItemSubtype_BasicGuidedDron",	-- для нормального отображения в DeathRecap
}

-- маяк для туториала для захвата в 7 этапе 
Def.VitalPoint_Team2_Tutorial =
{
	inherit			= "VitalPoint_Team2_BeaconA",
	uiName			= "BeaconA",
	gameplay_idx	= 0,
	relationship_group 	= 2,
	health			= 1600,
	turret_respawn_period	= 2600,
	turret_def1 	= "GuardDroneTutorial",
	turret_def2 	= "GuardDroneTutorial",
	turret_def3 	= "",
	turret_def4 	= "",
	
	ping			= 5,
}

-- маяк для туториала, для наведения в 1 этапе
Def.VitalPoint_Team1_TutorialB =
{
	inherit			= "VitalPoint_Team1_BeaconB",
	uiName			= "BeaconB",
	gameplay_idx	= 1,
	spawn_group		= 2,
	
	ping			= 5,
}

-- маяк для туториала, для наведения в 1 этапе
Def.VitalPoint_Team1_TutorialA =
{
	inherit			= "VitalPoint_Team1_BeaconA",
	uiName			= "BeaconA",
	gameplay_idx	= 1,
	spawn_group		= 2,
	
	ping			= 5,
}


---------------------
-- RECAPTURABLE
---------------------

Def.VitalPoint_Beacon1_RC =
{
	in_editor		= true,
	inherit			= "VitalPoint_Recaptureable",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	skin			= "default",
	uiName			= "BeaconA",
	gameplay_idx	= 0,
	relationship_group 	= 0,
	turret_def1 	= "GuardDrone_RC",
	turret_def2 	= "GuardDrone_RC",
	turret_def3 	= "GuardDrone_RC",
	turret_def4 	= "GuardDrone_RC",
}

-- King Of The Hill Beacons

-- Beacon A
Def.VitalPoint_Beacon1_RC_King =
{ 
	inherit			= "VitalPoint_Beacon1_RC",
	gameplay_idx	= 0,
	uiName			= "BeaconA",
}

-- Beacon B
Def.VitalPoint_Beacon2_RC_King =
{ 
	inherit			= "VitalPoint_Beacon1_RC",
	gameplay_idx	= 1,
	uiName			= "BeaconB",
}

-- Beacon C
Def.VitalPoint_Beacon3_RC_King =
{ 
	inherit			= "VitalPoint_Beacon1_RC",
	gameplay_idx	= 2,
	uiName			= "BeaconC",
}

--"Центровой", главный маяк.
Def.VitalPoint_Beacon2_RC =
{
	inherit			= "VitalPoint_Beacon1_RC",
	uiName			= "BeaconB",
	gameplay_idx	= 1,
}

Def.VitalPoint_Beacon3_RC =
{
	inherit			= "VitalPoint_Beacon1_RC",
	uiName			= "BeaconC",
	gameplay_idx	= 2,
}

Def.VitalPoint_Beacon4_RC =
{
	inherit			= "VitalPoint_Beacon1_RC",
	uiName			= "BeaconA",
	gameplay_idx	= 0,
}

Def.VitalPoint_Beacon5_RC =
{
	inherit			= "VitalPoint_Beacon1_RC",
	uiName			= "BeaconB",
	gameplay_idx	= 1,
}

Def.VitalPoint_Beacon6_RC =
{
	inherit			= "VitalPoint_Beacon1_RC",
	uiName			= "BeaconC",
	gameplay_idx	= 2,
}

-- маяки с спаун спотами команд.

Def.VitalPoint_Beacon1_SS =
{
	inherit			= "VitalPoint_Beacon1_RC",
	uiName			= "BeaconA",
	gameplay_idx	= 0,
	spawn_group		= 1,
}

Def.VitalPoint_Beacon2_SS =
{
	inherit			= "VitalPoint_Beacon1_RC",
	uiName			= "BeaconB",
	gameplay_idx	= 1,
	spawn_group		= 2,
}

Def.VitalPoint_Beacon3_SS =
{
	inherit			= "VitalPoint_Beacon1_RC",
	uiName			= "BeaconC",
	gameplay_idx	= 2,
	spawn_group		= 3,
}

---------------------------
-- тестовые для TDM
---------------------------
--
Def.VitalPoint_Beacon1_RC_TDM =
{
	inherit			= "VitalPoint_Beacon1_RC",
	children 		=
	{
		{ def = "VitalPointBuff_Damage_TDM", joint = "root" }
	},
	turret_def1 = "",
	turret_def2 = "",
	turret_def3 = "",
	turret_def4 = "",
}

Def.VitalPoint_Beacon2_RC_TDM =
{
	inherit			= "VitalPoint_Beacon2_RC",
	children 		=
	{
		{ def = "VitalPointBuff_Resist_TDM", joint = "root" }
	},
	turret_def1 = "",
	turret_def2 = "",
	turret_def3 = "",
	turret_def4 = "",
}

Def.VitalPoint_Beacon3_RC_TDM =
{
	inherit			= "VitalPoint_Beacon3_RC",
	children 		=
	{
		{ def = "VitalPointBuff_Regen_TDM", joint = "root" }
	},
	turret_def1 = "",
	turret_def2 = "",
	turret_def3 = "",
	turret_def4 = "",
}

Def.VitalPointBuff_Damage_TDM =
{
	class 			= "AuraHolderEntity",
	in_editor 		= false,
	spell_on_spawn	= "Damage_TDM",
}
Def.VitalPointBuff_Resist_TDM =
{
	class 			= "AuraHolderEntity",
	in_editor 		= false,
	spell_on_spawn	= "Resist_TDM",
}
Def.VitalPointBuff_Regen_TDM =
{
	class 			= "AuraHolderEntity",
	in_editor 		= false,
	spell_on_spawn	= "Regen_TDM",
}

---------------------
-- PvE
---------------------

Def.VitalPoint_PVE_Central =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "BeaconA",
	health			= 10000,
	gameplay_idx	= 0,
	relationship_group 	= 1,
	turret_def1 	= "GuardDrone_PvE",
	turret_def2 	= "GuardDrone_PvE",
	turret_def3 	= "GuardDrone_PvE",
	turret_def4 	= "GuardDrone_PvE",
	regen_speed		= 100.0,
}

Def.VitalPoint_PVE_AloneA =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName			= "BeaconA",
	vision_radius_without_drones  = 1000,
	health			= 10000,
	gameplay_idx	= 0,
	relationship_group 	= 1,
	turret_def1 	= "GuardDrone_PvE",
	turret_def2 	= "GuardDrone_PvE",
	turret_def3 	= "GuardDrone_PvE",
	turret_def4 	= "GuardDrone_PvE",
	regen_speed		= 100.0,
}

Def.VitalPoint_PVE_AloneB =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName			= "BeaconB",
	health			= 10000,
	vision_radius_without_drones  = 1000,
	gameplay_idx	= 1,
	relationship_group 	= 1,
	turret_def1 	= "GuardDrone_PvE",
	turret_def2 	= "GuardDrone_PvE",
	turret_def3 	= "GuardDrone_PvE",
	turret_def4 	= "GuardDrone_PvE",
	regen_speed		= 100.0,
}

Def.VitalPoint_PVE_AloneC =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName			= "BeaconC",
	health			= 10000,
	vision_radius_without_drones  = 1000,
	gameplay_idx	= 2,
	relationship_group 	= 1,
	turret_def1 	= "GuardDrone_PvE",
	turret_def2 	= "GuardDrone_PvE",
	turret_def3 	= "GuardDrone_PvE",
	turret_def4 	= "GuardDrone_PvE",
	regen_speed		= 100.0,
}

-- маяки для карты planetwar(с поверхностью)
Def.VitalPoint_Station1_RC =
{
	inherit			= "VitalPoint_Beacon1_RC",
	model			= "models/objects/vital_point/energy_station/energy_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName			= "BeaconB",
	turret_def1		= "",
	turret_def2		= "",
	turret_def3		= "",
	turret_def4		= "",
	gameplay_idx	= 1,
}

Def.VitalPoint_Station2_RC =
{
	inherit			= "VitalPoint_Beacon1_RC",
	model			= "models/objects/vital_point/energy_station/energy_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName			= "BeaconC",
	turret_def1		= "",
	turret_def2		= "",
	turret_def3		= "",
	turret_def4		= "",
	gameplay_idx	= 2,
}

Def.VitalPoint_Station3_RC =
{
	inherit			= "VitalPoint_Beacon1_RC",
	model			= "models/objects/vital_point/energy_station/energy_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName			= "BeaconA",
	turret_def1		= "",
	turret_def2		= "",
	turret_def3		= "",
	turret_def4		= "",
	gameplay_idx	= 0,
}

-- маяки для первого боя с ботами
Def.VitalPoint_BeaconFirstFight1_RC =
{
	in_editor		= true,
	inherit			= "VitalPoint_Recaptureable",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	skin			= "default",
	uiName			= "BeaconA",
	gameplay_idx	= 0,
	relationship_group 	= 0,
	turret_def1 	= "GuardDroneFirstFight_RC",
	turret_def2 	= "GuardDroneFirstFight_RC",
	turret_def3 	= "GuardDroneFirstFight_RC",
	turret_def4 	= "GuardDroneFirstFight_RC",
	ping			= 15,
}

Def.VitalPoint_BeaconFirstFight2_RC =
{
	inherit			= "VitalPoint_BeaconFirstFight1_RC",
	uiName			= "BeaconB",
}

Def.VitalPoint_BeaconFirstFight3_RC =
{
	inherit			= "VitalPoint_BeaconFirstFight1_RC",
	uiName			= "BeaconC",
}

-- дрон для маяка, который юзается для первого боя с ботами
Def.GuardDroneFirstFight_RC =
{
	inherit			= "GuardDrone",
	health			= 2000,
	damage_thermal	= 100,
}

Def.VitalPoint_Tutorial =
{ 
	inherit			= "VitalPoint_Beacon1_RC",
	gameplay_idx	= 0,
	uiName			= "OpenWorld_QuestJericho_s3d",
	health			= 300,
	relation_health = 299,		-- здоровье на котором меняется RelationshipGroup
}

Def.VitalPoint_Zombie1 =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName			= "BeaconA",
	vision_radius_without_drones  = 0,
	health			= 4250,
	gameplay_idx	= 0,
	relationship_group 	= 1,
	
	regen_speed		= 0.0,
	regen_max_ally	= 0,
	
	decay_damage	= 180,
	decay_max_enemy = 1,
}

Def.VitalPoint_Zombie2 =
{
	inherit			= "VitalPoint_Zombie1",
	uiName			= "BeaconB",
}

Def.VitalPoint_Zombie3 =
{
	inherit			= "VitalPoint_Zombie1",
	uiName			= "BeaconC",
}

Def.VitalPoint_April_AprilA =
{
	in_editor		= true,
	inherit			= "VitalPoint_Recaptureable",
	health			= 500,
	relation_health = 400,		-- здоровье на котором меняется RelationshipGroup
	model			= "mapskit/maps/event/paper_airplanes/beacon/paper_beacon",
	physics			= { solid_type = solid.compound_model, static = true, material = "Paper" },
	skin			= "default",
	uiName			= "BeaconA",
	gameplay_idx	= 0,
	relationship_group 	= 0,
	turret_def1 	= "",
	turret_def2 	= "",
	turret_def3 	= "",
	turret_def4 	= "",
	friendly_beam_fx= "",
	hostile_beam_fx = "",
	idle_sound		= "",
	full_activation_sound 	= "",	-- звук полного захвата маяка (когда появляются дроны), только для Recaptureable
	captured_from_neutral_sound =  "", -- звук захвата маяка из нейтрального в союзный. только для Recaptureable
}

Def.VitalPoint_April_AprilB =
{
	inherit			= "VitalPoint_April_AprilA",
	uiName			= "BeaconB",
}

Def.VitalPoint_April_AprilC =
{
	inherit			= "VitalPoint_April_AprilA",
	uiName			= "BeaconC",
}