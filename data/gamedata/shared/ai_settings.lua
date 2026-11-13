
AiPreset = {}

AiPreset.Default =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 6,
		[ ai.AIShipWeaponType.LaserGun ]			= 6,
		[ ai.AIShipWeaponType.Singularity ]			= 6,
		[ ai.AIShipWeaponType.Disintegrator ]		= 6,
		[ ai.AIShipWeaponType.Rockets ]				= 6,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 6,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 6,
		[ ai.AIShipWeaponType.ChargableGun ]		= 7,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 7,
	},

	shield_defence_reaction_time	= 3,
	
	attack_delay				= 3,
	module_use_delay			= 10,
	modules_can_use_percentage = 0.01,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= false,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= false,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель

	ships = PreparedVessels,
}


AiPreset.Easy =	---#67356 отключаю бонус тупости на т1 пве
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 3,
		[ ai.AIShipWeaponType.LaserGun ]			= 4,
		[ ai.AIShipWeaponType.Singularity ]			= 3,
		[ ai.AIShipWeaponType.Disintegrator ]		= 3,
		[ ai.AIShipWeaponType.Rockets ]				= 3,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 3,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 3,
		[ ai.AIShipWeaponType.ChargableGun ]		= 4,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 4,
	},

	shield_defence_reaction_time	= 3,
	
	attack_delay				= 2.5,
	module_use_delay			= 3,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVessels_PVE1,
}

AiPreset.Medium =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 2,
		[ ai.AIShipWeaponType.LaserGun ]			= 3,
		[ ai.AIShipWeaponType.Singularity ]			= 2,
		[ ai.AIShipWeaponType.Disintegrator ]		= 2,
		[ ai.AIShipWeaponType.Rockets ]				= 2,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 2,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 2,
		[ ai.AIShipWeaponType.ChargableGun ]		= 3,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 3,
	},

	shield_defence_reaction_time	= 2.5,
	
	attack_delay				= 2.5,
	module_use_delay			= 2.5,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	use_face_to_target_when_self_defend = true, -- включает поворот корпуса на цель в режиме ai.AiOrder.SELF_DEFEND.
	
	ships = PreparedVessels_PVE23,
}

-- !эту настройку юзать только для ПвЕ Т4-Т5 поэтому реально это Easy и лишь сами корабли т4-т5
AiPreset.Hard =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 2,
		[ ai.AIShipWeaponType.LaserGun ]			= 3,
		[ ai.AIShipWeaponType.Singularity ]			= 2,
		[ ai.AIShipWeaponType.Disintegrator ]		= 2,
		[ ai.AIShipWeaponType.Rockets ]				= 2,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 2,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 2,
		[ ai.AIShipWeaponType.ChargableGun ]		= 2,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 2,
	},

	shield_defence_reaction_time	= 2.5,
	
	attack_delay				= 2.5,
	module_use_delay			= 2.5,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	use_face_to_target_when_self_defend = true, -- включает поворот корпуса на цель в режиме ai.AiOrder.SELF_DEFEND.
	
	ships = PreparedVessels_PVE45,
}

AiPreset.Harder =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 1,
		[ ai.AIShipWeaponType.LaserGun ]			= 2,
		[ ai.AIShipWeaponType.Singularity ]			= 1,
		[ ai.AIShipWeaponType.Disintegrator ]		= 1,
		[ ai.AIShipWeaponType.Rockets ]				= 1,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 1,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 1,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.5,
	
	attack_delay		= 0.75,
	module_use_delay	= 1,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout			 	= 10.0,	-- время между запусками ракет
	rocket_min_launch_distance 	= 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	use_face_to_target_when_self_defend = true, -- включает поворот корпуса на цель в режиме ai.AiOrder.SELF_DEFEND.
	
	ships = PreparedVesselsTX,
}

AiPreset.BotsT1 =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 6,
		[ ai.AIShipWeaponType.LaserGun ]			= 6,
		[ ai.AIShipWeaponType.Singularity ]			= 6,
		[ ai.AIShipWeaponType.Disintegrator ]		= 6,
		[ ai.AIShipWeaponType.Rockets ]				= 6,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 6,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 6,
		[ ai.AIShipWeaponType.ChargableGun ]		= 7,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 7,
	},

	shield_defence_reaction_time	= 3,
	
	attack_delay				= 3,
	module_use_delay			= 5,
	modules_can_use_percentage = 0.33,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 15.0,	-- время между запусками ракет
	rocket_min_launch_distance = 150.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.33,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 0.66,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.66,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.0,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 20.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT1,
}

AiPreset.BotsT1E =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 3,
		[ ai.AIShipWeaponType.LaserGun ]			= 4,
		[ ai.AIShipWeaponType.Singularity ]			= 3,
		[ ai.AIShipWeaponType.Disintegrator ]		= 3,
		[ ai.AIShipWeaponType.Rockets ]				= 3,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 3,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 3,
		[ ai.AIShipWeaponType.ChargableGun ]		= 4,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 4,
	},

	shield_defence_reaction_time	= 3,
	
	attack_delay				= 1,
	module_use_delay			= 2,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVessels,	-- теперь это не элитный, а ослабленный пресет #67356
}


AiPreset.BotsT2 =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 6,
		[ ai.AIShipWeaponType.LaserGun ]			= 6,
		[ ai.AIShipWeaponType.Singularity ]			= 6,
		[ ai.AIShipWeaponType.Disintegrator ]		= 6,
		[ ai.AIShipWeaponType.Rockets ]				= 6,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 6,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 6,
		[ ai.AIShipWeaponType.ChargableGun ]		= 7,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 7,
	},

	shield_defence_reaction_time	= 3,
	
	attack_delay				= 3,
	module_use_delay			= 5,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT2,
}

AiPreset.BotsT2E =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 3,
		[ ai.AIShipWeaponType.LaserGun ]			= 3,
		[ ai.AIShipWeaponType.Singularity ]			= 3,
		[ ai.AIShipWeaponType.Disintegrator ]		= 3,
		[ ai.AIShipWeaponType.Rockets ]				= 3,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 3,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 3,
		[ ai.AIShipWeaponType.ChargableGun ]		= 4,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 4,
	},

	shield_defence_reaction_time	= 2,
	
	attack_delay				= 2,
	module_use_delay			= 3,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 8.0,	-- время между запусками ракет
	rocket_min_launch_distance = 80.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.66,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.33,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT2,
}

AiPreset.BotsT2G =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 6,
		[ ai.AIShipWeaponType.LaserGun ]			= 6,
		[ ai.AIShipWeaponType.Singularity ]			= 6,
		[ ai.AIShipWeaponType.Disintegrator ]		= 6,
		[ ai.AIShipWeaponType.Rockets ]				= 6,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 6,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 6,
		[ ai.AIShipWeaponType.ChargableGun ]		= 7,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 7,
	},

	shield_defence_reaction_time	= 3,
	
	attack_delay				= 3,
	module_use_delay			= 5,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT2G,
}

AiPreset.BotsT3 = -- пресет ИИ-ботов (для A25FOR30_13 - здесь смотрим какой список ИИ-ботов входит в данный пресет нужной очереди матчмейкера table.insert )
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 2,
		[ ai.AIShipWeaponType.LaserGun ]			= 3,
		[ ai.AIShipWeaponType.Singularity ]			= 2,
		[ ai.AIShipWeaponType.Disintegrator ]		= 2,
		[ ai.AIShipWeaponType.Rockets ]				= 2,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 2,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 2,
		[ ai.AIShipWeaponType.ChargableGun ]		= 3,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 3,
	},

	shield_defence_reaction_time	= 2.5,
	
	attack_delay				= 2.5,
	module_use_delay			= 2.5,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 8.0,	-- время между запусками ракет
	rocket_min_launch_distance = 80.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.6,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.4,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT3, -- для A25FOR30_13 - собственно искомый список ИИ-ботов входящий в данный пресет нужной очереди матчмейкера table.insert (в конфиге))
}

AiPreset.BotsT3E =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 1.5,
		[ ai.AIShipWeaponType.LaserGun ]			= 2.5,
		[ ai.AIShipWeaponType.Singularity ]			= 1.5,
		[ ai.AIShipWeaponType.Disintegrator ]		= 1.5,
		[ ai.AIShipWeaponType.Rockets ]				= 1.5,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 1.5,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 1.5,
		[ ai.AIShipWeaponType.ChargableGun ]		= 2,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 2,
	},

	shield_defence_reaction_time	= 1,	---#59478
	
	attack_delay		= 1.2,			---0.7 1.25, #58972
	module_use_delay	= 1.5,			---1,
	modules_can_use_percentage = 0.6,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 7.0,	-- время между запусками ракет
	rocket_min_launch_distance = 70.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.7,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.3,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT2EE,	--#65004
}

AiPreset.BotsT3G =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 1.5,
		[ ai.AIShipWeaponType.LaserGun ]			= 2.5,
		[ ai.AIShipWeaponType.Singularity ]			= 1.5,
		[ ai.AIShipWeaponType.Disintegrator ]		= 1.5,
		[ ai.AIShipWeaponType.Rockets ]				= 1.5,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 1.5,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 1.5,
		[ ai.AIShipWeaponType.ChargableGun ]		= 2,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 2,
	},

	shield_defence_reaction_time	= 1,	---#59478
	
	attack_delay		= 1.2,			---0.7 1.25, #58972
	module_use_delay	= 1.5,			---1,
	modules_can_use_percentage = 0.6,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 7.0,	-- время между запусками ракет
	rocket_min_launch_distance = 70.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.7,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.3,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT3G,	--#65004
}

AiPreset.BotsT4 =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 1,
		[ ai.AIShipWeaponType.LaserGun ]			= 2,
		[ ai.AIShipWeaponType.Singularity ]			= 1,
		[ ai.AIShipWeaponType.Disintegrator ]		= 1,
		[ ai.AIShipWeaponType.Rockets ]				= 1,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 1,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 1,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.75,
	
	attack_delay		= 0.75,			---1.25, #58972
	module_use_delay	= 0.5,			---1,
	modules_can_use_percentage = 0.66,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 7.0,	-- время между запусками ракет
	rocket_min_launch_distance = 70.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.7,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.3,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT4,
}

AiPreset.BotsT4E = -- -- пресет ИИ-ботов (для A25FOR30_13 - здесь смотрим какой список ИИ-ботов входит в данный пресет нужной очереди матчмейкера table.insert ) для A25FOR30_13
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0.5,
		[ ai.AIShipWeaponType.LaserGun ]			= 1,
		[ ai.AIShipWeaponType.Singularity ]			= 0.5,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0.5,
		[ ai.AIShipWeaponType.Rockets ]				= 0.5,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0.5,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0.5,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.5,
	
	attack_delay		= 0.5,			---1.25, #58972
	module_use_delay	= 0.5,			---1,
	modules_can_use_percentage = 0.75,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 5.0,	-- время между запусками ракет
	rocket_min_launch_distance = 50.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.75,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.15,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 30.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT4E, -- для A25FOR30_13 - собственно искомый список ИИ-ботов входящий в данный пресет нужной очереди матчмейкера table.insert (в конфиге))
}

AiPreset.BotsT4EG =	-- для БЗС
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0.2,
		[ ai.AIShipWeaponType.LaserGun ]			= 0.5,
		[ ai.AIShipWeaponType.Singularity ]			= 0.2,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0.2,
		[ ai.AIShipWeaponType.Rockets ]				= 0.2,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0.2,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0.2,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.2,
	
	attack_delay		= 0.2,
	module_use_delay	= 0.2,
	modules_can_use_percentage = 0.8,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 5.0,	-- время между запусками ракет
	rocket_min_launch_distance = 50.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.85,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.05,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 30.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT4EG,
}

AiPreset.BotsT4G =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0.5,
		[ ai.AIShipWeaponType.LaserGun ]			= 1,
		[ ai.AIShipWeaponType.Singularity ]			= 0.5,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0.5,
		[ ai.AIShipWeaponType.Rockets ]				= 0.5,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0.5,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0.5,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.5,
	
	attack_delay		= 0.5,			---1.25, #58972
	module_use_delay	= 0.5,			---1,
	modules_can_use_percentage = 0.75,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 5.0,	-- время между запусками ракет
	rocket_min_launch_distance = 50.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.75,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.15,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 30.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT4G,
}


AiPreset.BotsT5 =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0.5,
		[ ai.AIShipWeaponType.LaserGun ]			= 1,
		[ ai.AIShipWeaponType.Singularity ]			= 0.5,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0.5,
		[ ai.AIShipWeaponType.Rockets ]				= 0.5,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0.5,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0.5,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.5,
	
	attack_delay		= 0.5,			---1.25, #58972
	module_use_delay	= 0.5,			---1,
	modules_can_use_percentage = 0.75,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 5.0,	-- время между запусками ракет
	rocket_min_launch_distance = 50.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.75,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.15,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 30.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT5,
}

AiPreset.BotsT5E =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0,
		[ ai.AIShipWeaponType.LaserGun ]			= 0.5,
		[ ai.AIShipWeaponType.Singularity ]			= 0,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0,
		[ ai.AIShipWeaponType.Rockets ]				= 0,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0,
		[ ai.AIShipWeaponType.ChargableGun ]		= 0,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 0,
	},

	shield_defence_reaction_time	= 0,
	
	attack_delay		= 0,
	module_use_delay	= 0,
	modules_can_use_percentage = 0.9,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 2.0,	-- время между запусками ракет
	rocket_min_launch_distance = 30.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 1.0,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 60.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT5E,
}

AiPreset.BotsT5G =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0,
		[ ai.AIShipWeaponType.LaserGun ]			= 0.5,
		[ ai.AIShipWeaponType.Singularity ]			= 0,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0,
		[ ai.AIShipWeaponType.Rockets ]				= 0,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0,
		[ ai.AIShipWeaponType.ChargableGun ]		= 0,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 0,
	},

	shield_defence_reaction_time	= 0,
	
	attack_delay		= 0,
	module_use_delay	= 0,
	modules_can_use_percentage = 0.9,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 2.0,	-- время между запусками ракет
	rocket_min_launch_distance = 30.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 1.0,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 60.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT5G,
}

--#77370 Мне в лом копи-пастом делать 32 таблицы, так что заскриптую (+ довесок рандомный R #100716)
cSym = {"E","F","J","S","M","L","H","P","R"}
for nT = 2, 5 do
	for n = 1, #cSym do
		AiPreset["BotsT"..nT.."_"..cSym[n]] = sys.new(AiPreset["BotsT"..nT.."G"])
		AiPreset["BotsT"..nT.."_"..cSym[n]].ships = _G[ "PreparedVesselsT"..nT.."_"..cSym[n] ]
	end
end

-- и пресет всех с 3 по 5
AiPreset["BotsT35_R"] = sys.new(AiPreset["BotsT5G"])
AiPreset["BotsT35_R"].ships = _G[ "PreparedVesselsT35_R" ]

-- #83512 довесок т1
cSym = {"E","F","J","S","M","L"}
nT = 1
	for n = 1, #cSym do
		AiPreset["BotsT"..nT.."_"..cSym[n]] = sys.new(AiPreset["BotsT"..nT])
		AiPreset["BotsT"..nT.."_"..cSym[n]].ships = _G[ "PreparedVesselsT"..nT.."_"..cSym[n] ]
	end


AiPreset.BotsT5X_H =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0,
		[ ai.AIShipWeaponType.LaserGun ]			= 0,
		[ ai.AIShipWeaponType.Singularity ]			= 0,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0,
		[ ai.AIShipWeaponType.Rockets ]				= 0,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0,
		[ ai.AIShipWeaponType.ChargableGun ]		= 0,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 0,
	},

	shield_defence_reaction_time	= 0,
	
	attack_delay		= 0,
	module_use_delay	= 0,
	modules_can_use_percentage = 0.9,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 2.0,	-- время между запусками ракет
	rocket_min_launch_distance = 30.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 1.0,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 60.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT5X_H,
}

	
AiPreset.BotsTX =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0,
		[ ai.AIShipWeaponType.LaserGun ]			= 0,
		[ ai.AIShipWeaponType.Singularity ]			= 0,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0,
		[ ai.AIShipWeaponType.Rockets ]				= 0,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0,
		[ ai.AIShipWeaponType.ChargableGun ]		= 0,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 0,
	},

	shield_defence_reaction_time	= 0,
	
	attack_delay		= 0,
	module_use_delay	= 0,
	modules_can_use_percentage = 0.9,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 2.0,	-- время между запусками ракет
	rocket_min_launch_distance = 30.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 1.0,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 60.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsTX,
}

AiPreset.BotsOW =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 1,
		[ ai.AIShipWeaponType.LaserGun ]			= 2,
		[ ai.AIShipWeaponType.Singularity ]			= 1,
		[ ai.AIShipWeaponType.Disintegrator ]		= 1,
		[ ai.AIShipWeaponType.Rockets ]				= 1,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 1,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 1,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.75,
	
	attack_delay		= 0.75,
	module_use_delay	= 1,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsTX,
}


--- настройки для лобби
AiPreset.BotsLobby1 =
{
	use_in_lobby = true,
	
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 6,
		[ ai.AIShipWeaponType.LaserGun ]			= 6,
		[ ai.AIShipWeaponType.Singularity ]			= 6,
		[ ai.AIShipWeaponType.Disintegrator ]		= 6,
		[ ai.AIShipWeaponType.Rockets ]				= 6,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 6,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 6,
		[ ai.AIShipWeaponType.ChargableGun ]		= 6,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 6,
	},

	shield_defence_reaction_time	= 3,
	
	attack_delay				= 3,
	module_use_delay			= 5,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT1,
}

AiPreset.BotsLobby2 =
{
	use_in_lobby = true,

	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 2,
		[ ai.AIShipWeaponType.LaserGun ]			= 3,
		[ ai.AIShipWeaponType.Singularity ]			= 2,
		[ ai.AIShipWeaponType.Disintegrator ]		= 2,
		[ ai.AIShipWeaponType.Rockets ]				= 2,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 2,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 2,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 2,
	
	attack_delay				= 2.5,
	module_use_delay			= 2.5,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT23,
}

AiPreset.BotsLobby3 =
{
	use_in_lobby = true,

	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0,
		[ ai.AIShipWeaponType.LaserGun ]			= 0.5,
		[ ai.AIShipWeaponType.Singularity ]			= 0,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0,
		[ ai.AIShipWeaponType.Rockets ]				= 0,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.25,
	
	attack_delay		= 0.25,
	module_use_delay	= 1,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 8.0,	-- время между запусками ракет
	rocket_min_launch_distance = 80.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.85,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.25,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
		
	ships = PreparedVesselsT5EXH,	-- особо злые боты для ст-шников в лобби #92765 до того были PreparedVesselsT45,
}

AiPreset.BotsBZS =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 1,
		[ ai.AIShipWeaponType.LaserGun ]			= 2,
		[ ai.AIShipWeaponType.Singularity ]			= 1,
		[ ai.AIShipWeaponType.Disintegrator ]		= 1,
		[ ai.AIShipWeaponType.Rockets ]				= 1,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 1,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 1,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.5,
	
	attack_delay		= 0.75,
	module_use_delay	= 1,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT5E,
}

AiPreset.BotsBZS_T3 =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 1,
		[ ai.AIShipWeaponType.LaserGun ]			= 2,
		[ ai.AIShipWeaponType.Singularity ]			= 1,
		[ ai.AIShipWeaponType.Disintegrator ]		= 1,
		[ ai.AIShipWeaponType.Rockets ]				= 1,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 1,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 1,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.5,
	
	attack_delay		= 0.75,
	module_use_delay	= 1,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT3EG,
}

AiPreset.BotsBZS_T4 =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0.5,
		[ ai.AIShipWeaponType.LaserGun ]			= 1,
		[ ai.AIShipWeaponType.Singularity ]			= 0.5,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0.5,
		[ ai.AIShipWeaponType.Rockets ]				= 0.5,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0.5,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0.5,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.35,
	
	attack_delay		= 0.5,
	module_use_delay	= 1,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.75,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT4EG,
}

AiPreset.BotsBZS_T5 =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0,
		[ ai.AIShipWeaponType.LaserGun ]			= 0.5,
		[ ai.AIShipWeaponType.Singularity ]			= 0,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0,
		[ ai.AIShipWeaponType.Rockets ]				= 0,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.25,
	
	attack_delay		= 0.25,
	module_use_delay	= 1,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 8.0,	-- время между запусками ракет
	rocket_min_launch_distance = 80.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.85,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.25,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT5EX,
}

AiPreset.Easy_AID =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0,
		[ ai.AIShipWeaponType.LaserGun ]			= 0,
		[ ai.AIShipWeaponType.Singularity ]			= 0,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0,
		[ ai.AIShipWeaponType.Rockets ]				= 0,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 3,
	
	attack_delay				= 2.5,
	module_use_delay			= 3,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	--use_evasion_on_damage		= true,
	speed_combat = 0.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	use_face_to_target_when_self_defend = true, -- включает поворот корпуса на цель в режиме ai.AiOrder.SELF_DEFEND.
}

AiPreset.Medium_AID =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 2,
		[ ai.AIShipWeaponType.LaserGun ]			= 3,
		[ ai.AIShipWeaponType.Singularity ]			= 2,
		[ ai.AIShipWeaponType.Disintegrator ]		= 2,
		[ ai.AIShipWeaponType.Rockets ]				= 2,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 2,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 2,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 2.5,
	
	attack_delay				= 1,

	use_rockets					= true,
	rocket_timeout = 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 1,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	use_face_to_target_when_self_defend = true, -- включает поворот корпуса на цель в режиме ai.AiOrder.SELF_DEFEND.
	escape_from_aoe_auras	= false, -- #0105058: Мобы в ПвЕ в панике улетают от АоЕ на расстояния в 10-ки км.
}

-- !эту настройку юзать только для ПвЕ Т4-Т5 поэтому реально это Easy и лишь сами корабли т4-т5
AiPreset.Hard_AID =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 2,
		[ ai.AIShipWeaponType.LaserGun ]			= 3,
		[ ai.AIShipWeaponType.Singularity ]			= 2,
		[ ai.AIShipWeaponType.Disintegrator ]		= 2,
		[ ai.AIShipWeaponType.Rockets ]				= 2,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 2,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 2,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 2.5,
	
	attack_delay				= 0.5,

	use_rockets					= true,
	rocket_timeout 				= 10.0,	-- время между запусками ракет
	rocket_min_launch_distance = 100.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 1.1,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.5,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	use_face_to_target_when_self_defend = true, -- включает поворот корпуса на цель в режиме ai.AiOrder.SELF_DEFEND.
	escape_from_aoe_auras	= false, -- #0105058: Мобы в ПвЕ в панике улетают от АоЕ на расстояния в 10-ки км.
}

AiPreset.Harder_AID =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 1,
		[ ai.AIShipWeaponType.LaserGun ]			= 2,
		[ ai.AIShipWeaponType.Singularity ]			= 1,
		[ ai.AIShipWeaponType.Disintegrator ]		= 1,
		[ ai.AIShipWeaponType.Rockets ]				= 1,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 1,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 1,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.5,
	
	attack_delay		= 0.75,

	use_rockets					= true,
	rocket_timeout			 	= 10.0,	-- время между запусками ракет
	rocket_min_launch_distance 	= 400.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 1.5,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 2,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.5,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	use_face_to_target_when_self_defend = true, -- включает поворот корпуса на цель в режиме ai.AiOrder.SELF_DEFEND.
	escape_from_aoe_auras	= false, -- #0105058: Мобы в ПвЕ в панике улетают от АоЕ на расстояния в 10-ки км.
}

AiPreset.Bot_Tornado =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0,
		[ ai.AIShipWeaponType.LaserGun ]			= 1,
		[ ai.AIShipWeaponType.Singularity ]			= 0,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0,
		[ ai.AIShipWeaponType.Rockets ]				= 0,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0,
		[ ai.AIShipWeaponType.ChargableGun ]		= 0,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 0,
	},

	--shield_defence_reaction_time	= 0.25,
	
	attack_delay		= 0,
	module_use_delay	= 0,
	modules_can_use_percentage = 0.7,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= false,
	--rocket_timeout = 8.0,	-- время между запусками ракет
	--rocket_min_launch_distance = 80.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 1.2,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 2.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.3,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 30.0, --... и максимальное время агра на цель
	
	use_face_to_target_when_self_defend = false, -- включает поворот корпуса на цель в режиме ai.AiOrder.SELF_DEFEND.
	escape_from_aoe_auras	= false, -- #0105058: Мобы в ПвЕ в панике улетают от АоЕ на расстояния в 10-ки км.
	
	defend_mode_move_attack_range			= 75, -- В режиме охраны позиции летать за противниками, отдаляясь не дальше этого расстояния
	defend_mode_attack_locked_target_range	= 120, -- Если цель зафиксирована, то немного дальше
}

AiPreset.BotsPortal_T5 =
{
	dispersion = 
	{
		[ ai.AIShipWeaponType.AutoGun ]				= 0,
		[ ai.AIShipWeaponType.LaserGun ]			= 0.25,
		[ ai.AIShipWeaponType.Singularity ]			= 0,
		[ ai.AIShipWeaponType.Disintegrator ]		= 0,
		[ ai.AIShipWeaponType.Rockets ]				= 0,
		[ ai.AIShipWeaponType.GuidedRocket ]		= 0,
		[ ai.AIShipWeaponType.EnergyLance ]			= 0,
		[ ai.AIShipWeaponType.FiringModules ]		= 0,
		[ ai.AIShipWeaponType.ChargableGun ]		= 1,
		[ ai.AIShipWeaponType.SmartRocketLauncher ]	= 1,
	},

	shield_defence_reaction_time	= 0.1,
	
	attack_delay		= 0.1,
	module_use_delay	= 0.5,
	modules_can_use_percentage = 0.5,	-- шанс того, что бот захочет использовать модуль, когда придёт время

	use_rockets					= true,
	rocket_timeout = 3.0,	-- время между запусками ракет
	rocket_min_launch_distance = 80.0, -- минимальное расстояние для использования ракет

	use_evasion_on_damage		= true,
	speed_combat = 0.97,	-- процент максимальной скорости при полёте в бою
	evasion_strafe_speed = 1.0,	-- процент максимальной скорости скорости стрейфа при уклонении

	-- настройки агро мобов (см. #32174 [^] )
	aggro_health_threshold_spare = 0.05,	-- процент здоровья+щита цели, когда бот переключается
	aggro_fire_range_mod = 1.25,		-- расстояние до цели (процент дальности поражения оружия), когда бот считает, что цель улетела далеко и переключается
	aggro_target_min_hold_time = 5.0,	-- минимальное ...
	aggro_target_max_hold_time = 25.0, --... и максимальное время агра на цель
	
	ships = PreparedVesselsT5Portal,
}
	