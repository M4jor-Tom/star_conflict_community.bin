-- джампгейт активный
Def.OpenWorld_ActiveJumpgate =
{
	class 				= "ScBaseEntity",
	in_editor			= true,
	model				= "models/objects/jump_gates/jumpgate_imper/jumpgate_imper",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 20000,
	work_sound 			= "sound/ambient/jumpgate_loop",
	uiName = "OpenWorld_ActiveJumpgate",	--83499

	full_activate_effect = "particles/other/wave_portal_open_big",

	children = 
	{
		{ def = "JumpgateFx", joint = "root" },
		{ effect = "particles/jumpgates/jumpgate_imper", joint = "root" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_1" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_2" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_3" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_4" },
		--{ effect = "particles/jumpgates/jumpgate_small_blue", joint = "fx1" },
		--{ effect = "particles/jumpgates/jumpgate_small_blue", joint = "fx2" },
		--{ effect = "particles/jumpgates/jumpgate_small_blue", joint = "fx3" },
		--{ effect = "particles/jumpgates/jumpgate_small_blue", joint = "fx4" },
		--{ effect = "particles/jumpgates/jumpgate_small_blue", joint = "fx5" },
		--{ effect = "particles/jumpgates/jumpgate_small_blue", joint = "fx6" },
		--{ effect = "particles/jumpgates/jumpgate_small_blue", joint = "fx7" },
		--{ effect = "particles/jumpgates/jumpgate_small_blue", joint = "fx8" },
	}
}

Def.JumpgateFx =
{
	class			= "BaseEntity",
	model			= "models/objects/jump_gates/jumpgate_imper/jumpgate_imper_fxx",
}

Def.JumpgateFxInactive =
{
	class			= "BaseEntity",
	model			= "models/objects/jump_gates/jumpgate_imper/jumpgate_imper_fx_inactivee",
}

-- джампгейт неактивный
Def.OpenWorld_DeactivateJumpgate =
{
	class 				= "ScBaseEntity",
	in_editor			= true,
	model				= "models/objects/jump_gates/jumpgate_imper/jumpgate_imper",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
	work_sound 			= "sound/ambient/jumpgate_deactivate_loop",
	skin				= "inactive",
	uiName = "OpenWorld_DeactivateJumpgate",	--83499
	
	children = 
	{
		{ def = "JumpgateFxInactive", joint = "root" },
		--{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_1" },
		--{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_2" },
		--{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_3" },
		--{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_4" },
		--{ effect = "particles/jumpgates/jumpgate_small_red", joint = "fx1" },
		--{ effect = "particles/jumpgates/jumpgate_small_red", joint = "fx2" },
		--{ effect = "particles/jumpgates/jumpgate_small_red", joint = "fx3" },
		--{ effect = "particles/jumpgates/jumpgate_small_red", joint = "fx4" },
		--{ effect = "particles/jumpgates/jumpgate_small_red", joint = "fx5" },
		--{ effect = "particles/jumpgates/jumpgate_small_red", joint = "fx6" },
		--{ effect = "particles/jumpgates/jumpgate_small_red", joint = "fx7" },
		--{ effect = "particles/jumpgates/jumpgate_small_red", joint = "fx8" },
	}
}


-- Деф зоны с подцепленными воротами, меняющими свой вид в зависимости от дуступности перелёта игроку
Def.Logic_JumpGateLocation =
{
	inherit = "Logic_JumpDockLocation",
	model_def = "Model_JumpGateLocation",
}

Def.Model_JumpGateLocation =
{
	class				= "BaseEntity",
	in_editor			= true,
	model				= "models/objects/jump_gates/jumpgate_imper/jumpgate_imper",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 20000,
	work_sound 			= "sound/ambient/jumpgate_loop",

	children_usable = 
	{
		{ def = "JumpgateFx", joint = "root" },
		{ effect = "particles/jumpgates/jumpgate_imper", joint = "root" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_1" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_2" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_3" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_4" },
	},
	
	children_unusable = 
	{
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_1" },
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_2" },
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_3" },
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_4" },
	},
}

Def.Model_JumpGateLocationNewYear =
{
	inherit = "Model_JumpGateLocation",
	
		children_usable = 
	{
		{ def = "JumpgateFx", joint = "root" },
		{ effect = "particles/jumpgates/jumpgate_imper", joint = "root" },
		{ effect = "particles/jumpgates/jumpgate_light_white", joint = "light_1" },
		{ effect = "particles/jumpgates/jumpgate_light_white", joint = "light_2" },
		{ effect = "particles/jumpgates/jumpgate_light_white", joint = "light_3" },
		{ effect = "particles/jumpgates/jumpgate_light_white", joint = "light_4" },
		{ effect = "particles/jumpgates/jumpgate_small_white", joint = "fx1" },
		{ effect = "particles/jumpgates/jumpgate_small_white", joint = "fx2" },
		{ effect = "particles/jumpgates/jumpgate_small_white", joint = "fx3" },
		{ effect = "particles/jumpgates/jumpgate_small_white", joint = "fx4" },
		{ effect = "particles/jumpgates/jumpgate_small_white", joint = "fx5" },
		{ effect = "particles/jumpgates/jumpgate_small_white", joint = "fx6" },
		{ effect = "particles/jumpgates/jumpgate_small_white", joint = "fx7" },
		{ effect = "particles/jumpgates/jumpgate_small_white", joint = "fx8" },
	},
	
	children_unusable = 
	{
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_1" },
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_2" },
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_3" },
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light_4" },
	},
}

-- джампгейт активный
Def.OpenWorld_BigActiveJumpgate =
{
	class 				= "ScBaseEntity",
	in_editor			= true,
	model				= "models/objects/jump_gates/big_jumpgate/big_jumpgate",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 20000,
	work_sound 			= "sound/ambient/jumpgate_loop",

	children = 
	{
		{ def = "BigJumpgateFx", joint = "root" },
		{ effect = "particles/jumpgates/jumpgate_imper_big", joint = "root" },
		{ effect = "particles/objects/lightnings", joint = "fx1" },
		{ effect = "particles/objects/lightnings", joint = "fx2" },
		{ effect = "particles/objects/lightnings", joint = "fx3" },
		{ effect = "particles/objects/lightnings", joint = "fx4" },
		--{ effect = "particles/jumpgates/jumpgate_big_blue", joint = "glow1" },
		--{ effect = "particles/jumpgates/jumpgate_big_blue", joint = "glow2" },
		--{ effect = "particles/jumpgates/jumpgate_big_blue", joint = "glow3" },
		--{ effect = "particles/jumpgates/jumpgate_big_blue", joint = "glow4" },
		--{ effect = "particles/jumpgates/jumpgate_big_blue", joint = "glow5" },
		--{ effect = "particles/jumpgates/jumpgate_big_blue", joint = "glow6" },
		--{ effect = "particles/jumpgates/jumpgate_big_blue", joint = "glow7" },
		--{ effect = "particles/jumpgates/jumpgate_big_blue", joint = "glow8" },
		--{ effect = "particles/jumpgates/jumpgate_small_blue", joint = "light" },
	},
	
	uiName = "OpenWorld_BigActiveJumpgate",	--#80881
}

Def.BigJumpgateFx =
{
	class			= "BaseEntity",
	maxViewDist			= 20000,
	model			= "models/objects/jump_gates/big_jumpgate/big_jumpgate_fx",
}

-- джампгейт активный Fed
Def.OpenWorld_BigActiveJumpgateFed =
{
	inherit 			= "OpenWorld_BigActiveJumpgate",
	model				= "models/objects/jump_gates/big_jumpgate/big_jumpgate_fed",
}

-- джампгейт активный Jer
Def.OpenWorld_BigActiveJumpgateJer =
{
	inherit 			= "OpenWorld_BigActiveJumpgate",
	model				= "models/objects/jump_gates/big_jumpgate/big_jumpgate_jer",
}

Def.OpenWorld_BigDeactivatedJumpgateTurbo =
{
	class 				= "ScBaseEntity",
	in_editor			= true,
	model				= "models/objects/jump_gates/turbo_jumpgate/turbo_jumpgate_01",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 20000,
	work_sound 			= "sound/ambient/jumpgate_loop",
	uiName = "OpenWorld_BigDeactivatedJumpgateTurbo",	--83499

	children = 
	{
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light1" },
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light2" },
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light3" },
		{ effect = "particles/jumpgates/jumpgate_light_red", joint = "light4" },
	}
}

-- блокпост пиратов
Def.OpenWorld_PirateAvanpost =
{
	class						= "BaseEntity",
--	relationship_group	= ai.RelationshipGroups.Pirate, -- базовое значение ai.RelationshipGroups.Pirate, для Приключения ReturnOfPrecursors2025 делаем ai.RelationshipGroups.Hostile2 КОММЕНТИРУЕМ ДЛЯ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 - В ОСТАЛЬНОЕ ВРЕМЯ РАСКОММЕНТИРОВАННО
	relationship_group	= ai.RelationshipGroups.Hostile2, -- базовое значение ai.RelationshipGroups.Pirate, для Приключения ReturnOfPrecursors2025 делаем ai.RelationshipGroups.Hostile2 РАСКОММЕНТИРУЕМ ДЛЯ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 - В ОСТАЛЬНОЕ ВРЕМЯ ЗАКОММЕНТИРОВАННО
	in_editor					= true,
	damageable			= false,
	maxViewDist			= 5000,
	hud_ico					= "hud_pirate_icon",
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model					= "models/objects/vital_point/blockpost/blockpost_pirate",
	uiName = "OpenWorld_PirateAvanpost",	--83499
	
	children = 
	{
		{ def = "OpenWorld_PirateRocketTurret", 		joint = "gun_1" },
		{ def = "OpenWorld_PirateTurret", 				joint = "gun_2" },
		{ def = "OpenWorld_PirateTurret", 				joint = "gun_3" },
		{ def = "OpenWorld_PirateRocketTurret", 		joint = "gun_4" },
		{ effect = "particles/ships/blockpost_lights", joint = "light_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_2" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_3" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_4" },
	}
}

--Слабый аванпост пиратов
Def.OpenWorld_PirateAvanpost_T3 =
{
	inherit					= "OpenWorld_PirateAvanpost",
	children = 
	{
		{ def = "OpenWorld_PirateRocketTurret_T3", 	joint = "gun_1" },
		{ def = "OpenWorld_PirateTurret_T3", 				joint = "gun_2" },
		{ def = "OpenWorld_PirateTurret_T3", 				joint = "gun_3" },
		{ def = "OpenWorld_PirateRocketTurret_T3", 	joint = "gun_4" },
		{ effect = "particles/ships/blockpost_lights", 	joint = "light_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_2" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_3" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_4" },
	}
}

-- блокпост картели
Def.OpenWorld_KartellAvanpost =
{
	class						= "BaseEntity",
	relationship_group	= ai.RelationshipGroups.Pirate,
	in_editor					= true,
	damageable			= false,
	maxViewDist			= 5000,
	hud_ico					= "hud_pirate_icon",
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model					= "models/objects/vital_point/blockpost/blockpost_pirate",
	uiName = "OpenWorld_KartellAvanpost",	--83499
	
	children = 
	{
		{ def = "OpenWorld_KartellRocketTurret", 		joint = "gun_1" },
		{ def = "OpenWorld_KartellTurret", 				joint = "gun_2" },
		{ def = "OpenWorld_KartellTurret", 				joint = "gun_3" },
		{ def = "OpenWorld_KartellRocketTurret", 		joint = "gun_4" },
		{ effect = "particles/ships/blockpost_lights", joint = "light_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_2" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_3" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_4" },
	}
}

-- блокпост киберов
Def.OpenWorld_KiberAvanpost =
{
	class						= "BaseEntity",
	relationship_group	= ai.RelationshipGroups.Alien,	-- хочется вовсе поменять и модель на аванпосты с иерихонской базы
	in_editor					= true,
	damageable			= false,
	maxViewDist			= 5000,
	hud_ico					= "hud_kiber_icon",	--s2
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model					= "models/objects/vital_point/blockpost/blockpost_pirate",
	uiName = "OpenWorld_KiberAvanpost",	--83499

	children = 
	{
		{ def = "OpenWorld_KiberRocketTurret", 		joint = "gun_1" },
		{ def = "OpenWorld_KiberTurret", 				joint = "gun_2" },
		{ def = "OpenWorld_KiberTurret", 				joint = "gun_3" },
		{ def = "OpenWorld_KiberRocketTurret", 		joint = "gun_4" },
		{ effect = "particles/ships/blockpost_lights", joint = "light_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_1" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_2" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_3" },
		{ effect = "particles/objects/blockpost_pirate_smoke", joint = "smoke_4" },
	}
}

-- ракетная установка для блокпоста пиратов

--- КОММЕНТИРУЕМ ДЛЯ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 - В ОСТАЛЬНОЕ ВРЕМЯ РАСКОММЕНТИРОВАННО
	
Def.OpenWorld_PirateRocketTurret = 
{
	inherit					= "Turret_RocketGun",
	relationship_group	= ai.RelationshipGroups.Pirate, -- базовое значение ai.RelationshipGroups.Pirate, для Приключения ReturnOfPrecursors2025 делаем ai.RelationshipGroups.Hostile2
	health 					= 30000, -- базовое значение 30000, для Приключения ReturnOfPrecursors2025 делаем "х3" (или 90000)
	projectile				= "SpaceMissile_AAMu_T4_PirateOpenWorld",
	hudType 				= "default",
	hud_visibility_type	= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0, -- базовое значение 300, для Приключения ReturnOfPrecursors2025 делаем 180
	
	fire_rate				= 20.0, -- базовое значение 20.0, для Приключения ReturnOfPrecursors2025 делаем "х1.5" (или 30.0)
	dispersion				= 1.0, -- deg
	max_range				= 300, -- базовое значение 300, для Приключения ReturnOfPrecursors2025 делаем 650
	max_rot_speed			= 40,	-- deg per second (базовое значение 40, для Приключения ReturnOfPrecursors2025 делаем 60)
	
	uiName					= "PirateTurret",
	model					= "models/turret/rocket_launcher/rocket_launcher_pirate",
}

-- ракета для туррели пиратов на блокпосте
Def.SpaceMissile_AAMu_T4_PirateOpenWorld =
{
	inherit					= "SpaceMissile_AAMu_T1_Mk3",
	in_editor				= false,

	detonation_radius 		= 3, -- базовое значение 3, для Приключения ReturnOfPrecursors2025 делаем 5
	speed 					= 20, -- базовое значение 20, для Приключения ReturnOfPrecursors2025 делаем 35
	max_range 				= 325, -- базовое значение 325, для Приключения ReturnOfPrecursors2025 делаем 650
	storeItemId				= 0,
	
	explosion_blast_wave	= "BlastWave_SM_AAMu_T4_PirateOpenWorld",	
}

-- взрыв нурс для туррели пиратов на блокпосте
Def.BlastWave_SM_AAMu_T4_PirateOpenWorld = 
{
	inherit					= "BlastWave_SM_AAMu_T1_Mk3",
	in_editor				= false,
	damage_kinetic			= 3000, -- базовое значение 3000, для Приключения ReturnOfPrecursors2025 делаем 7000
	damage_thermal			= 0, 
	blast_maxDistance		= 5,
}  -- Здесь (перед тире) комментирующие скобки всего блока Пиратской Ракетной Туррели

--- РАСКОММЕНТИРУЕМ ДЛЯ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 - В ОСТАЛЬНОЕ ВРЕМЯ ЗАКОММЕНТИРОВАННО
--[[
Def.OpenWorld_PirateRocketTurret = 
{
	inherit					= "Turret_RocketGun",
	relationship_group	= ai.RelationshipGroups.Hostile2, -- базовое значение ai.RelationshipGroups.Pirate, для Приключения ReturnOfPrecursors2025 делаем ai.RelationshipGroups.Hostile2
	health 					= 90000, -- базовое значение 30000, для Приключения ReturnOfPrecursors2025 делаем "х3" (или 90000)
	projectile				= "SpaceMissile_AAMu_T4_PirateOpenWorld",
	hudType 				= "default",
	hud_visibility_type	= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 180.0, -- базовое значение 300, для Приключения ReturnOfPrecursors2025 делаем 180
	
	fire_rate				= 30.0, -- базовое значение 20.0, для Приключения ReturnOfPrecursors2025 делаем "х1.5" (или 30.0)
	dispersion				= 1.0, -- deg
	max_range				= 650, -- базовое значение 300, для Приключения ReturnOfPrecursors2025 делаем 650
	max_rot_speed			= 60,	-- deg per second (базовое значение 40, для Приключения ReturnOfPrecursors2025 делаем 60)
	
	uiName					= "PirateTurret",
	model					= "models/turret/rocket_launcher/rocket_launcher_pirate",
}

-- ракета для туррели пиратов на блокпосте
Def.SpaceMissile_AAMu_T4_PirateOpenWorld =
{
	inherit					= "SpaceMissile_AAMu_T1_Mk3",
	in_editor				= false,

	detonation_radius 		= 5, -- базовое значение 3, для Приключения ReturnOfPrecursors2025 делаем 5
	speed 					= 35, -- базовое значение 20, для Приключения ReturnOfPrecursors2025 делаем 35
	max_range 				= 650, -- базовое значение 325, для Приключения ReturnOfPrecursors2025 делаем 650
	storeItemId				= 0,
	
	explosion_blast_wave	= "BlastWave_SM_AAMu_T4_PirateOpenWorld",	
}

-- взрыв нурс для туррели пиратов на блокпосте
Def.BlastWave_SM_AAMu_T4_PirateOpenWorld = 
{
	inherit					= "BlastWave_SM_AAMu_T1_Mk3",
	in_editor				= false,
	damage_kinetic			= 7000, -- базовое значение 3000, для Приключения ReturnOfPrecursors2025 делаем 5000
	damage_thermal			= 0, 
	blast_maxDistance		= 5,
} ]] -- Здесь (перед тире) комментирующие скобки всего блока Пиратской Ракетной Туррели

-- ракетная установка для блокпоста пиратов T3 и меньше
Def.OpenWorld_PirateRocketTurret_T3 = 
{
	inherit					= "OpenWorld_PirateRocketTurret",
	relationship_group	= ai.RelationshipGroups.Pirate, -- базовое значение ai.RelationshipGroups.Pirate, для Приключения ReturnOfPrecursors2025 делаем ai.RelationshipGroups.Hostile2
	projectile				= "SpaceMissile_AAMu_T3_PirateOpenWorld",
	health 					= 15000,
	max_range				= 250,
	uiName					= "PirateTurret",
}
Def.SpaceMissile_AAMu_T3_PirateOpenWorld =
{
	inherit					= "SpaceMissile_AAMu_T4_PirateOpenWorld",
	speed 					= 18,
	max_range 				= 325, 
	explosion_blast_wave= "BlastWave_SM_AAMu_T3_PirateOpenWorld",	
}
Def.BlastWave_SM_AAMu_T3_PirateOpenWorld = 
{
	inherit					= "BlastWave_SM_AAMu_T4_PirateOpenWorld",
	damage_kinetic			= 2000,
}

--Рельсотронная установка  для блокпоста пиратов
Def.OpenWorld_PirateTurret = 
{
--- КОММЕНТИРУЕМ ДЛЯ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 - В ОСТАЛЬНОЕ ВРЕМЯ РАСКОММЕНТИРОВАННО	
	
    inherit					= "Turret_FlakGun",	
	relationship_group		= ai.RelationshipGroups.Pirate, -- базовое значение ai.RelationshipGroups.Pirate, для Приключения ReturnOfPrecursors2025 делаем ai.RelationshipGroups.Hostile2
	health 					= 20000, -- базовое значение 20000, для Приключения ReturnOfPrecursors2025 делаем 45000
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0, -- базовое значение 300, для Приключения ReturnOfPrecursors2025 делаем 180
	
	fire_rate				= 200.0, -- базовое значение 200, для Приключения ReturnOfPrecursors2025 делаем 300
	dispersion				= 1.5, -- deg
	max_range				= 150, -- базовое значение 150, для Приключения ReturnOfPrecursors2025 делаем 300
	max_rot_speed			= 90,	-- deg per second (базовое значение 90, для Приключения ReturnOfPrecursors2025 делаем 120)
	
	damage_kinetic			= 400, -- базовое значение 400, для Приключения ReturnOfPrecursors2025 делаем 700
	damage_emp				= 0, -- базовое значение 0, для Приключения ReturnOfPrecursors2025 делаем 100
	damage_thermal			= 0,	
	
	uiName					= "PirateTurret",	
	model					= "models/turret/round_railgun01/round_railgun01",
 -- Здесь (перед тире) комментирующие скобки всего блока Пиратской Ракетной Туррели	

--- РАСКОММЕНТИРУЕМ ДЛЯ ПРИКЛЮЧЕНИЯ ReturnOfPrecursors2025 - В ОСТАЛЬНОЕ ВРЕМЯ ЗАКОММЕНТИРОВАННО
--[[	
	inherit					= "Turret_FlakGun",	
	relationship_group		= ai.RelationshipGroups.Hostile2, -- базовое значение ai.RelationshipGroups.Pirate, для Приключения ReturnOfPrecursors2025 делаем ai.RelationshipGroups.Hostile2
	health 					= 45000, -- базовое значение 20000, для Приключения ReturnOfPrecursors2025 делаем 45000
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 180.0, -- базовое значение 300, для Приключения ReturnOfPrecursors2025 делаем 180
	
	fire_rate				= 300.0, -- базовое значение 200, для Приключения ReturnOfPrecursors2025 делаем 300
	dispersion				= 1.5, -- deg
	max_range				= 300, -- базовое значение 150, для Приключения ReturnOfPrecursors2025 делаем 300
	max_rot_speed			= 120,	-- deg per second (базовое значение 90, для Приключения ReturnOfPrecursors2025 делаем 120)
	
	damage_kinetic			= 700, -- базовое значение 400, для Приключения ReturnOfPrecursors2025 делаем 700
	damage_emp				= 0, -- базовое значение 0, для Приключения ReturnOfPrecursors2025 делаем 100
	damage_thermal			= 0,	
	
	uiName					= "PirateTurret",	
	model					= "models/turret/round_railgun01/round_railgun01", 
]] -- Здесь (перед тире) комментирующие скобки всего блока Пиратской Ракетной Туррели
	
}


Def.OpenWorld_PirateFlakGun = 
{
	inherit					= "Turret_FlakGun",	
	relationship_group		= ai.RelationshipGroups.Pirate,
	health 					= 15000,
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 200.0,
	dispersion				= 1.5, -- deg
	max_range				= 150,
	max_rot_speed			= 90,	-- deg per second
	
	damage_kinetic			= 400,
	damage_emp				= 0,
	damage_thermal			= 0,	
	
	uiName					= "PirateTurret",	
	model					= "models/turret/flak_gun/flak_gun", 
}


--Рельсотронная установка  для блокпоста пиратов T3 и меньше
Def.OpenWorld_PirateTurret_T3 = 
{
	inherit					= "OpenWorld_PirateTurret",	
	health 					= 10000,
	damage_kinetic			= 150,
	respawn_time 			= 300.0, 
	fire_rate				= 200.0,
	max_range				= 150,
	max_rot_speed			= 90,	
	uiName					= "PirateTurret",
}

--Ракетная установка для блокпоста картели
Def.OpenWorld_KartellRocketTurret = 
{
	inherit					= "Turret_RocketGun",
	relationship_group		= ai.RelationshipGroups.Pirate,
	health 					= 30000,
	projectile				= "SpaceMissile_AAMu_T4_PirateOpenWorld",
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 20.0,
	dispersion				= 1.0, -- deg
	max_range				= 300,
	max_rot_speed			= 40,	-- deg per second
	
	uiName					= "KartellTurret",
	model					= "models/turret/rocket_launcher/rocket_launcher_pirate",
}

--Рельсотронная установка  для блокпоста картели
Def.OpenWorld_KartellTurret = 
{
	inherit					= "Turret_FlakGun",	
	relationship_group		= ai.RelationshipGroups.Pirate,
	health 					= 20000,
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 200.0,
	dispersion				= 1.5, -- deg
	max_range				= 150,
	max_rot_speed			= 90,	-- deg per second
	
	damage_kinetic			= 500,
	damage_emp				= 0,
	damage_thermal			= 0,
	
	uiName					= "KartellTurret",	
	model					= "models/turret/round_railgun01/round_railgun01", 
}

--Ракетная установка для блокпоста киберов
Def.OpenWorld_KiberRocketTurret = 
{
	inherit					= "Turret_RocketGun",
	relationship_group		= ai.RelationshipGroups.Pirate,
	health 					= 30000,
	projectile				= "SpaceMissile_AAMu_T4_PirateOpenWorld",
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 20.0,
	dispersion				= 1.0, -- deg
	max_range				= 300,
	max_rot_speed			= 40,	-- deg per second
	
	uiName					= "KiberTurret",
	model					= "models/turret/rocket_launcher/rocket_launcher_pirate",
}

--Рельсотронная установка  для блокпоста киберов
Def.OpenWorld_KiberTurret = 
{
	inherit					= "Turret_FlakGun",	
	relationship_group		= ai.RelationshipGroups.Pirate,
	health 					= 20000,
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 200.0,
	dispersion				= 1.5, -- deg
	max_range				= 150,
	max_rot_speed			= 90,	-- deg per second
	
	damage_kinetic			= 500,
	damage_emp				= 0,
	damage_thermal			= 0,

	
	uiName					= "KiberTurret",	
	model					= "models/turret/round_railgun01/round_railgun01", 
}

-- блокпост полиции
Def.OpenWorld_PoliceAvanpost =
{
	class					= "BaseEntity",
	relationship_group		= ai.RelationshipGroups.Police,
	in_editor				= true,
	damageable				= false,
	maxViewDist				= 5000,
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model					= "models/objects/vital_point/blockpost/fed_blockpost_01",
	uiName 					= "OpenWorld_PoliceAvanpost",	--83499
	
	children = 
	{
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_1" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_2" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_3" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_4" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_5" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_6" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_7" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_8" },
		{ effect = "particles/objects/avanpost", joint = "light_1" },
		{ effect = "particles/objects/avanpost", joint = "light_2" },
		{ effect = "particles/objects/avanpost", joint = "light_3" },
		{ effect = "particles/objects/avanpost", joint = "light_4" },
	}
}

Def.OpenWorld_CyberPoliceAvanpost = 
{
	inherit					= "OpenWorld_PoliceAvanpost",	
	relationship_group		= ai.RelationshipGroups.Alien,
}

-- тестовый аванпост полиции 
Def.OpenWorld_PoliceAvanpostTest =
{
	class				= "ScBaseEntity",
	relationship_group	= ai.RelationshipGroups.Police,
	in_editor			= true,
	damageable			= true,
	vision_always 		= true,
	health 				= 25000,
	maxViewDist			= 5000,
	hudType				= "default",
	hud_ico				= "hud_police_icon",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/vital_point/blockpost/fed_blockpost_01",
	
	death_effect		= "",
	death_effect_delay 	= 0.05,
    death_fade_time 	= 0.3,
	death_sound			= "sound/explosion/avanpost_expl",
	
	children = 
	{
		{ def = "OpenWorld_PoliceRocketTurretTest", joint = "gun_1" },
		{ def = "OpenWorld_PoliceRocketTurretTest", joint = "gun_2" },
		{ def = "OpenWorld_PoliceRocketTurretTest", joint = "gun_3" },
		{ def = "OpenWorld_PoliceRocketTurretTest", joint = "gun_4" },
		{ def = "OpenWorld_PoliceRocketTurretTest", joint = "gun_5" },
		{ def = "OpenWorld_PoliceRocketTurretTest", joint = "gun_6" },
		{ def = "OpenWorld_PoliceRocketTurretTest", joint = "gun_7" },
		{ def = "OpenWorld_PoliceRocketTurretTest", joint = "gun_8" },
		{ effect = "particles/objects/avanpost", joint = "light_1" },
		{ effect = "particles/objects/avanpost", joint = "light_2" },
		{ effect = "particles/objects/avanpost", joint = "light_3" },
		{ effect = "particles/objects/avanpost", joint = "light_4" },
	}
}

-- маленький блокпост полиции 
Def.OpenWorld_PoliceAvanpostSmall =
{
	class				= "BaseEntity",
	relationship_group	= ai.RelationshipGroups.Police,
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/vital_point/blockpost/fed_blockpost_mini",
	uiName = "OpenWorld_PoliceAvanpostSmall",	--83499
	
	children = 
	{
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_1" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_2" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_3" },
		{ def = "OpenWorld_PoliceRocketTurret", joint = "gun_4" },
		{ effect = "particles/objects/avanpost_small", joint = "light_1" },
		{ effect = "particles/objects/avanpost_small", joint = "light_2" },
		{ effect = "particles/objects/avanpost_small", joint = "light_3" },
		{ effect = "particles/objects/avanpost_small", joint = "light_4" },
	}
}

-- ракетная установка для блокпоста полиции
Def.OpenWorld_PoliceRocketTurret = 
{
	inherit				= "Turret_RocketGun",
	relationship_group	= ai.RelationshipGroups.Police,
	health 				= 25000,
	projectile			= "SpaceMissile_AAMu_T4_PoliceOpenWorld",
	hud_visibility_type	= "minor",
	karma_reward_kill	= 0,	
	
	fire_rate			= 30.0,
	dispersion			= 1.0, -- deg
	max_range			= 210,
	max_rot_speed		= 30,	-- deg per second
	
	uiName				= "PoliceRocketTurret",
	model				= "models/turret/rocket_launcher/rocket_launcher",
}

-- ракетная установка для тестового блокпоста полиции
Def.OpenWorld_PoliceRocketTurretTest = 
{
	inherit				= "Turret_RocketGun",
	relationship_group	= ai.RelationshipGroups.Police,
	health 				= 25000,
	projectile			= "SpaceMissile_AAMu_T4_PoliceOpenWorld",
	hud_visibility_type	= "minor",
	karma_reward_kill	= 0,	
	respawn_time 		= 60.0,
	fire_rate			= 15.0,
	dispersion			= 1.0, -- deg
	max_range			= 210,
	max_rot_speed		= 30,	-- deg per second
	
	uiName				= "PoliceTurret",
	model				= "models/turret/rocket_launcher/rocket_launcher",
}

-- ракета для туррели полиции на блокпосте
Def.SpaceMissile_AAMu_T4_PoliceOpenWorld =
{
	inherit				= "SpaceMissile_AAMu_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 25,
	max_range 			= 200,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_AAMu_T4_PoliceOpenWorld",	
}

-- взрыв нурс для туррели полиции на блокпосте
Def.BlastWave_SM_AAMu_T4_PoliceOpenWorld = 
{
	inherit				= "BlastWave_SM_AAMu_T1_Mk3",
	in_editor			= false,

	damage_kinetic		= 5000,
	damage_thermal		= 0,
	blast_maxDistance	= 5,
}

-- усиленная ракета для туррели полиции на блокпосте
Def.SpaceMissile_AAMu_T4_PowerfullPoliceOpenWorld =
{
	inherit				= "SpaceMissile_AAMu_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 25,
	max_range 			= 300,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_AAMu_T4_PowerfullPoliceOpenWorld",	
}

-- усленный взрыв нурс для туррели полиции на блокпосте
Def.BlastWave_SM_AAMu_T4_PowerfullPoliceOpenWorld = 
{
	inherit				= "BlastWave_SM_AAMu_T1_Mk3",
	in_editor			= false,

	damage_kinetic		= 8000,
	damage_thermal		= 0,
	blast_maxDistance	= 5,
}

-- пушка на полицейском корабле t4
Def.Weapon_PowerfullPoliceOW = 
{
	inherit				= "Weapon_Railgun_Sniper_T4_Epic",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	
	fire_rate			= 60,
	damage_kinetic		= 330,
	optimal_range		= 400,
	dispersion			= 0.25,
	max_range			= 500,
	
	shot_once_sound				= "sound/weapons/railgun/police",
	projectile		= "Projectile_SniperRailgun",
	shot_effect = "particles/weapons/railgun/muzzle_axe",
	
}

-- пушка на полицейском корабле t4
Def.Weapon_PoliceOW = 
{
	inherit				= "Weapon_Railgun_Sniper_T4_Epic",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	
	fire_rate			= 30,
	damage_kinetic		= 500,
	optimal_range		= 300,
	dispersion			= 0.25,
	max_range			= 400,
	
	shot_once_sound				= "sound/weapons/railgun/police",
	projectile		= "Projectile_SniperRailgun",
	shot_effect = "particles/weapons/railgun/muzzle_axe",
	
}

-- пушка для пиратского корабля t3
Def.Weapon_Railgun_Basic_PirateOW = 
{
	inherit				= "Weapon_Railgun_Basic_T2_Epic",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	
	fire_rate			= 60,
	damage_kinetic		= 180,
	optimal_range		= 250,
	dispersion			= 0.25,
	max_range			= 500,
	projectile_speed	= 172.5,
	
	--shot_once_sound 				= "sound/weapons/railgun/basic",
}

-- пушка для пиратского корабля t3
Def.Weapon_Plasmagun_Autofire_PirateOW = 
{
	inherit				= "Weapon_Plasmagun_Autofire_T3_Epic",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	
	fire_rate			= 90,
	damage_emp			= 120,
	
	shot_once_sound 				= "sound/weapons/plasmagun/autofire",
}



-- пушка для пиратского корабля t3
Def.Weapon_Railgun_Heavy_PirateOW = 
{
	inherit				= "Weapon_Railgun_Heavy_T3_Epic",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	
	fire_rate			= 15,
	damage_kinetic		= 800,
	optimal_range		= 150,
	dispersion			= 0.25,
	max_range			= 350,
	projectile_speed	= 140,
	
	shot_once_sound 				= "sound/weapons/railgun/heavy",
	
}

-- пушка для охраны транспорта t4
Def.Weapon_Laser_Economic_T4_OW = 
{
	inherit				= "Weapon_Laser_Economic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	
	class_mask = ai.ShipClass.MEDIUM,
}

-- пушка для охраны транспорта t4
Def.Weapon_Plasmagun_Basic_T4_OW = 
{
	inherit				= "Weapon_Plasmagun_Basic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	
	class_mask = ai.ShipClass.MEDIUM,
}

-- пушки для пиратов с ролями t4 firerate/3 Mk1

Def.Weapon_Laser_Economic_RolePirateOW =
{
	inherit				= "Weapon_Laser_Economic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Laser_Economic_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Railgun_Autofire_RolePirateOW =
{
	inherit				= "Weapon_Railgun_Autofire_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Railgun_Autofire_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Sparks_Cannon_RolePirateOW =
{
	inherit				= "Weapon_Sparks_Cannon_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Sparks_Cannon_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Plasmagun_Autofire_RolePirateOW =
{
	inherit				= "Weapon_Plasmagun_Autofire_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Plasmagun_Autofire_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Laser_Heavy_RolePirateOW =
{
	inherit				= "Weapon_Laser_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Laser_Heavy_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Laser_Basic_RolePirateOW =
{
	inherit				= "Weapon_Laser_Basic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Laser_Basic_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Railgun_Sniper_RolePirateOW =
{
	inherit				= "Weapon_Railgun_Sniper_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Railgun_Sniper_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Railgun_Basic_RolePirateOW =
{
	inherit				= "Weapon_Railgun_Basic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Railgun_Basic_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Cold_Ray_RolePirateOW =
{
	inherit				= "Weapon_Cold_Ray_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Cold_Ray_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Railgun_Heavy_RolePirateOW =
{
	inherit				= "Weapon_Railgun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Railgun_Heavy_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Plasmagun_Heavy_RolePirateOW =
{
	inherit				= "Weapon_Plasmagun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Plasmagun_Heavy_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Laser_Sniper_RolePirateOW =
{
	inherit				= "Weapon_Laser_Sniper_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Laser_Sniper_T4_Mk1.fire_rate*0.3,
	fire_rate_add		= Def.Weapon_Laser_Sniper_T4_Mk1.fire_rate_add*0.3,
	fire_rate_max		= Def.Weapon_Laser_Sniper_T4_Mk1.fire_rate_max*0.3,
}

Def.Weapon_Nanobots_Cloud_RolePirateOW =
{
	inherit				= "Weapon_Nanobots_Cloud_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Nanobots_Cloud_T4_Mk1.fire_rate*0.3,
}

Def.Weapon_Plasmagun_Sniper_RolePirateOW =
{
	inherit				= "Weapon_Plasmagun_Sniper_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Plasmagun_Sniper_T4_Mk1.fire_rate*0.3,
}

-- cargo test
Def.OpenWorld_Cargoship_Old = 
{
	inherit = "Ship_Base",
	model = "models/objects/ships_huge/freighter_imper/freighter_imper",
	object_tag 		= ai.ObjectTag.TRANSPORT, 
	skin = "default",
	physics = {	mass = 3000, material = "ShipMetalMk3", solid_type = solid.compound_model, },

	accel_decay = 0.95,
	accel_x0 = 9,
	accel_x1 = 10,
	accel_y0 = 9,
	accel_y1 = 10,
	acceleration = 5.5,
	decel_afterburning = 5.7,
	decel_x = 3,
	decel_y = 3,
	deceleration = 0.3,
	max_rearspeed = 4,
	max_speed = 23.40204,
	max_speed_mul = 0.1,
	max_xspeed = 6.125,
	max_yspeed = 6.125,
	boost_accel_coef = 2.25,
	boost_energy_cost = 32,
	boost_energy_cost_per_second = 232.8,
	boost_energy_min = 130,
	boost_maxspeed_coef = 1.2,
	boost_rot_coef = 0.8,
	revaccel_decay = 1,
	reverse_accel = 5.7,
	rot_xmaxspeed = 30,
	rot_ymaxspeed = 30,
	rot_zmaxspeed = 36,
	rotaccel_x0 = 40,
	rotaccel_x1 = 30,
	rotaccel_y0 = 40,
	rotaccel_y1 = 30,
	rotaccel_z0 = 50,
	rotaccel_z1 = 50,
	rotdecel_x = 100,
	rotdecel_y = 100,
	rotdecel_z = 1000,

	children = 
	{
		{	def = "Engine_empire_xxl",	joint = "exhaust_1",	},
		{	def = "Engine_empire_xl",	joint = "exhaust_2",	},
		{	def = "Engine_empire_xl",	joint = "exhaust_3",	},
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},
		{	effect = "particles/ships/transport_lights",joint = "light_1",	},
		{	effect = "particles/ships/transport_lights",joint = "light_2",	},
		{	effect = "particles/ships/transport_lights",joint = "light_3",	},
		{	effect = "particles/ships/transport_lights",joint = "light_4",	},
	},
	contact_damage_cf = 160,
	contact_damage_min_speed = 3,

	death_blast_wave = "LargeShipExplodeBlastWave",
	death_effect = "particles/explosions/shp_exp_big_02",
	death_sound		= "sound/explosion/cargoship_expl",
	work_sound      = "sound/engine/cargoship_loop",
	death_wreck = "CargoShipWreck",
	debris_remove_delay = 4,

	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "root",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "root",
	},
	default_modules = {},
	
	weapon_slots = 4,
	fire_sector_incline = -20,
	fire_sectors = { 6, 2, 2, 1, 2, 1, 2, 1, 1, 1, },

	hull_health = 10860,
	hull_regen = 0,
	hull_resist_emp = 45,
	hull_resist_kinetic = -15,
	hull_resist_thermal = 15,
	shield_max = 10850,
	shield_regen = 100,
	shield_resist_emp = -30,
	shield_resist_kinetic = 30,
	shield_resist_thermal = 0,
	energy_max = 990,
	energy_regen = 6.732,

	lock_time = 2.5,
	vision_radius = 200,

	ship_class = ai.ShipClass.LARGE,
	signature = ai.Signature.HUGE,
	uiName = "Transport",
	--ship_name = "Ship_Race3_L_T5",
	--ship_race = 1,
	--ship_tier = 5,
	--role = 9,
	--item_lvl = 24.7,
	--item_subtype = 1000,
	
	--default_icon = "shopIco_Ship_Race3_L_T5_Skin1",
	--hangarIco = "Race3_L_T5_Skin1",
	--hangarIcoSmall = "Race3_L_T5_small",

	karma_reward_kill = -5,
}

-- cargo test2
Def.OpenWorld_CargoshipBase = 
{
	inherit = "CargoShip",
	--model = "models/objects/ships_huge/freighter_imper/freighter_imper",
	skin = "default",
	physics = {	mass = 3000, material = "ShipMetalMk3", solid_type = solid.compound_model, },

	death_blast_wave = "LargeShipExplodeBlastWave",
	--death_effect = "particles/explosions/shp_exp_big_02",
	--death_sound		= "sound/explosion/cargoship_expl",
	--work_sound      = "sound/engine/cargoship_loop",
	--death_wreck = "CargoShipWreck",
	debris_remove_delay = 4,

	health = 50000,

	uiName = "Transport",

	karma_reward_kill = -5,
	
	children = 
	{
		{	def = "Engine_empire_xxl",	joint = "exhaust_1",	},
		{	def = "Engine_empire_xl",	joint = "exhaust_2",	},
		{	def = "Engine_empire_xl",	joint = "exhaust_3",	},
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},

		{	effect = "particles/ships/transport_lights",joint = "light_1",	},
		{	effect = "particles/ships/transport_lights",joint = "light_2",	},
		{	effect = "particles/ships/transport_lights",joint = "light_3",	},
		{	effect = "particles/ships/transport_lights",joint = "light_4",	},
	},
}

Def.OpenWorld_CargoshipPirate = 
{
	inherit = "OpenWorld_CargoshipBase",

	skin="pirate",
	
	trail_effect = "particles/ships/ship_trail",
	trail_size = 0.1,
	trail_color = "185 21 41 100",
	
	children = 
	{
		{	def = "Engine_pirate_xxl",	joint = "exhaust_1",	},
		{	def = "Engine_pirate_xl",	joint = "exhaust_2",	},
		{	def = "Engine_pirate_xl",	joint = "exhaust_3",	},
		{	def = "Engine_pirate_l",	joint = "exhaust_4",	},
		{	def = "Engine_pirate_l",	joint = "exhaust_5",	},

		{	effect = "particles/ships/transport_lights",joint = "light_1",	},
		{	effect = "particles/ships/transport_lights",joint = "light_2",	},
		{	effect = "particles/ships/transport_lights",joint = "light_3",	},
		{	effect = "particles/ships/transport_lights",joint = "light_4",	},
	},
}



Def.OpenWorld_CargoshipAlone = 
{
	inherit = "OpenWorld_CargoshipBase",
	uiName = "TransportAlone",
	health = 90000,
}

Def.OpenWorld_CargoshipMineral = 
{
	inherit = "OpenWorld_CargoshipBase",
	uiName = "TransportMineral",
	health = 40000,
}

Def.OpenWorld_CargoshipFuel = 
{
	inherit = "OpenWorld_CargoshipBase",
	uiName = "TransportFuel",
	health = 30000,
}

Def.OpenWorld_ThermalAnomaly = 
{
	class 			= "AuraHolderEntity",
	in_editor		= true,
	spell_on_spawn	= "OpenWorld_Anomaly_ThermalDamage",

	uiName="OpenWorld_Anomaly_ThermalDamage",
}

Def.OpenWorld_ThermalAnomaly_Low = 
{
	class 			= "AuraHolderEntity",
	in_editor		= true,
	spell_on_spawn	= "OpenWorld_Anomaly_ThermalDamage_Low",

	uiName="OpenWorld_Anomaly_ThermalDamage_Low",
}

Def.OpenWorld_StealthAnomaly = 
{
	class 			= "AuraHolderEntity",
	in_editor		= true,
	spell_on_spawn	= "OpenWorld_Anomaly_MassCloaking",
	
	children = 
	{
		{	effect = "particles/areal/huge_stuff/waterharvest_sphere_big",	joint = "root",	},
	},

	uiName="OpenWorld_Anomaly_MassCloaking",
}


-- обломки для опенворлда
Def.OpenWorld_WreckDebris1 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_01",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда
Def.OpenWorld_WreckDebris2 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_02",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда
Def.OpenWorld_WreckDebris3 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_03",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда
Def.OpenWorld_WreckDebris4 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_04",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда
Def.OpenWorld_WreckDebris5 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_05",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда
Def.OpenWorld_WreckDebris6 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_06",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда
Def.OpenWorld_WreckDebris7 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_07",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда
Def.OpenWorld_WreckDebris8 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_08",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда
Def.OpenWorld_WreckDebris9 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_09",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда
Def.OpenWorld_WreckDebris10 =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/wrecks/debris_10",
	physics		= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
}

-- обломки для опенворлда, заправка
Def.OpenWorld_WreckFuel =
{
	class		= 'BaseEntity',
	in_editor	=	true,
	model		=	"models/objects/ships_huge/freighter_imper/freighter_imper_wreck",
	physics		= { solid_type = solid.compound_model, static = true, material = "ShipMetalMk1" },

	children =
	{
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_1"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_2"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_3"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_4"	},
		{	effect = "particles/explosions/objects/brokenparts_fire", joint = "point_5"	},
	},

}

Def.Module_Empty_OW =
{
	class				= "SpaceShipModule",
	in_editor			= false,
}

--робот-погрузчик 1
Def.OpenWorld_Loader_Loader1 =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/objects/robots/loader/loader_01", 
	--physics			= { solid_type = solid.model, static = true, material = "Metal" },
	sync_animation	= true,
	children 		= 	{
							{ def = "OpenWorld_Loader_Model", joint = "hips" },
						},
}

Def.OpenWorld_Loader_Model =
{
	class 			= "ScBaseEntity",
	model			= "models/objects/robots/loader/loader_fiz", 
	physics			= { solid_type = solid.compound_model, static = false, kinematic = true, material = "ShipMetalMk1", mass = 100000000,  },
}

-- Объект для квестового взаимодействия
Def.OpenWorld_QuestObject_Interact =
{
	class			= "QuestObject",
	in_editor		= true,
	damageable		= false,
	interaction		= true,
	interaction_distance	= 50,
	max_detection_distance	= 500,
	hudType 		= "loot_crate",
	consume_required_item = true, -- 1 раз

	interacting_fx = "particles/ships/looting",
	glow_effect = "particles/other/loot_highlight",
}

-- Объект для квестового взаимодействия с получением лута с эффектами и звуками
Def.OpenWorld_QuestObject_Loot = 
{
	class			= "QuestObject",
	in_editor		= true,
	damageable		= false,
	interaction		= true,
	interaction_distance	= 40,
	max_detection_distance	= 500,
	hudType 		= "loot_crate",
	interaction_deactivate	= true,
	respawn_time	= 45,

	
	interacting_fx = "particles/ships/looting",
	interacting_success_fx = "particles/ships/looted",	
	spawn_effect = "particles/other/wave_portal_open",
	glow_effect = "particles/other/loot_highlight",
}

-- Объект для квестового взаимодействия t2 карты
Def.OpenWorld_QuestEmpire_s2d = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/vital_point/energy_station/energy_station",	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	children = 
	{
		{ effect = "particles/objects/generator_lightning2", joint = "fx1" },
		{ effect = "particles/objects/generator_lightning2", joint = "fx2" },
		{ effect = "particles/objects/generator_lightning", joint = "fx3" },
		{ effect = "particles/objects/generator_lightning", joint = "fx4" },
	},

	uiName			= "OpenWorld_QuestEmpire_s2d",
	required_item	= "ow_QuestEmpire_s2d",

}

-- Объект для квестового взаимодействия t3 карты
Def.OpenWorld_QuestEmpire_msd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "mapskit/maps/models/precursors/pc_mayak",
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },},
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestEmpire_msd",
	required_item	= "ow_QuestEmpire_msd",

}

Def.OpenWorld_QuestFederation_gcd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/weapons/drones/healbot/healbot",
	physics			= { solid_type = solid.sphere, material = "Metal", static = true,  },
	interacting_success_sound = "sound/game/openspace_quest/healbot_activation",

	uiName			= "OpenWorld_QuestFederation_gcd",
	required_item	= "ow_QuestFederation_gcd",
}

Def.OpenWorld_QuestJericho_ms3d = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "mapskit/maps/models/precursors/pc_mayak",
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },},
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestJericho_ms3d",
	required_item	= "ow_QuestJericho_ms3d",
}

Def.OpenWorld_QuestFederation_lcd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/vital_point/drone_satellite1/drone_satellite1", 
	physics			= { solid_type = solid.box, static = true, material = "ShipMetalMk1" },
	interacting_success_sound = "sound/game/openspace_quest/healbot_activation",

	uiName			= "OpenWorld_QuestFederation_lcd",
	required_item	= "ow_QuestFederation_lcd",
}

Def.OpenWorld_QuestJericho_gi3d = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/vital_point/drone_satellite1/drone_satellite1", 
	physics			= { solid_type = solid.box, static = true, material = "ShipMetalMk1" },
	interacting_success_sound = "sound/game/openspace_quest/healbot_activation",

	uiName			= "OpenWorld_QuestJericho_gi3d",
	required_item	= "ow_QuestJericho_gi3d",
}

-- федерация s2 маяки на картах, где не было объектов для взаимодействия
Def.OpenWorld_QuestFederation_gld = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "mapskit/maps/models/precursors/pc_mayak",
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },},
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestFederation_gld",
	required_item	= "ow_QuestFederation_gld",
}

Def.OpenWorld_QuestFederation_shd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "mapskit/maps/models/precursors/pc_mayak",
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },},	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestFederation_shd",
	required_item	= "ow_QuestFederation_shd",
}

Def.OpenWorld_QuestFederation_cwd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "mapskit/maps/models/precursors/pc_mayak",
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },},	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestFederation_cwd",
	required_item	= "ow_QuestFederation_cwd",
}

Def.OpenWorld_QuestJericho_gmd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "mapskit/maps/models/precursors/pc_mayak",
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },},	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestJericho_gmd",
	required_item	= "ow_QuestJericho_gmd",

}

Def.OpenWorld_QuestJericho_jbd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "mapskit/maps/models/precursors/pc_mayak",
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },},	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestJericho_jbd",
	required_item	= "ow_QuestJericho_jbd",

}

Def.OpenWorld_QuestJericho_gi2d = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "mapskit/maps/models/precursors/pc_mayak",
	children 	= 	{{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },},	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestJericho_gi2d",
	required_item	= "ow_QuestJericho_gi2d",

}

Def.OpenWorld_QuestLootEmpire_s3 = 
{
	inherit			= "OpenWorld_QuestObject_Loot",

	model		= "models/objects/gameplay/minerals/craft_loot", 
	physics		= { solid_type = solid.model, static = true, material = "Rock"},

	uiName			= "OpenWorld_QuestLootEmpire_s3",
	required_item	= "ow_QuestLootEmpire_s3key",
	loot_item		= "ow_QuestLootEmpire_s3",
}

Def.OpenWorld_QuestLootEmpire_gs2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_gs2",
	required_item	= "ow_QuestLootEmpire_gs2key",
	loot_item		= "ow_QuestLootEmpire_gs2",
}

Def.OpenWorld_QuestLootEmpire_gs = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_gs",
	required_item	= "ow_QuestLootEmpire_gskey",
	loot_item		= "ow_QuestLootEmpire_gs",
}

Def.OpenWorld_QuestLootEmpire_gs3 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_gs3",
	required_item	= "ow_QuestLootEmpire_gs3key",
	loot_item		= "ow_QuestLootEmpire_gs3",
}

Def.OpenWorld_QuestLootEmpire_sd = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_sd",
	required_item	= "ow_QuestLootEmpire_sdkey",
	loot_item		= "ow_QuestLootEmpire_sd",
}

Def.OpenWorld_OWFest_24_2_sd = -- для квеста OWFEST_24_2 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_sd",
	required_item	= "ow_OWFest_24_2_sdkey",
	loot_item		= "ow_OWFest_24_2_sd",
}

Def.OpenWorld_QuestLootEmpire_s2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_s2",
	required_item	= "ow_QuestLootEmpire_s2key",
	loot_item		= "ow_QuestLootEmpire_s2",
}

Def.OpenWorld_QuestLootEmpire_ms = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_ms",
	required_item	= "ow_QuestLootEmpire_mskey",
	loot_item		= "ow_QuestLootEmpire_ms",
}

Def.OpenWorld_QuestLootEmpire_gr3 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_gr3",
	required_item	= "ow_QuestLootEmpire_gr3key",
	loot_item		= "ow_QuestLootEmpire_gr3",
}

Def.OpenWorld_QuestLootEmpire_gr = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_gr",
	required_item	= "ow_QuestLootEmpire_grkey",
	loot_item		= "ow_QuestLootEmpire_gr",
}

Def.OpenWorld_QuestLootEmpire_gr2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_gr2",
	required_item	= "ow_QuestLootEmpire_gr2key",
	loot_item		= "ow_QuestLootEmpire_gr2",
}

Def.OpenWorld_QuestLootEmpire_rs = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_rs",
	required_item	= "ow_QuestLootEmpire_rskey",
	loot_item		= "ow_QuestLootEmpire_rs",
}

Def.OpenWorld_QuestLootEmpire_pz1 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootEmpire_pz1",
	required_item	= "ow_QuestLootEmpire_pz1key",
	loot_item		= "ow_QuestLootEmpire_pz1",
}

Def.OpenWorld_QuestLootFederation_sh2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_sh2",
	required_item	= "ow_QuestLootFederation_sh2key",
	loot_item		= "ow_QuestLootFederation_sh2",
}

Def.OpenWorld_QuestLootFederation_sh = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_sh",
	required_item	= "ow_QuestLootFederation_shkey",
	loot_item		= "ow_QuestLootFederation_sh",
}

Def.OpenWorld_QuestLootFederation_gl = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_gl",
	required_item	= "ow_QuestLootFederation_glkey",
	loot_item		= "ow_QuestLootFederation_gl",
}

Def.OpenWorld_QuestLootFederation_lc2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_lc2",
	required_item	= "ow_QuestLootFederation_lc2key",
	loot_item		= "ow_QuestLootFederation_lc2",
}

Def.OpenWorld_QuestLootFederation_lc3 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_lc3",
	required_item	= "ow_QuestLootFederation_lc3key",
	loot_item		= "ow_QuestLootFederation_lc3",
}

Def.OpenWorld_QuestLootFederation_lc = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_lc",
	required_item	= "ow_QuestLootFederation_lckey",
	loot_item		= "ow_QuestLootFederation_lc",
}

Def.OpenWorld_QuestLootFederation_sh3 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_sh3",
	required_item	= "ow_QuestLootFederation_sh3key",
	loot_item		= "ow_QuestLootFederation_sh3",
}

Def.OpenWorld_QuestLootFederation_gc = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_gc",
	required_item	= "ow_QuestLootFederation_gckey",
	loot_item		= "ow_QuestLootFederation_gc",
}

Def.OpenWorld_QuestLootFederation_cw2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_cw2",
	required_item	= "ow_QuestLootFederation_cw2key",
	loot_item		= "ow_QuestLootFederation_cw2",
}

Def.OpenWorld_QuestLootFederation_cw3 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_cw3",
	required_item	= "ow_QuestLootFederation_cw3key",
	loot_item		= "ow_QuestLootFederation_cw3",
}

Def.OpenWorld_QuestLootFederation_cw = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_cw",
	required_item	= "ow_QuestLootFederation_cwkey",
	loot_item		= "ow_QuestLootFederation_cw",
}

Def.OpenWorld_OWFest_24_5_cw = -- для квеста OWFEST_24_5
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_cw",
	required_item	= "ow_OWFest_24_5_cwkey",
	loot_item		= "ow_OWFest_24_5_cw",
}

Def.OpenWorld_A25FOR30_10_cw = -- для квеста A25FOR30_10
{
	inherit			= "OpenWorld_QuestLootEmpire_s3", -- а она наследуется от OpenWorld_QuestObject_Loot, где и задаются основные параметры (блок ниже), которые можно испраавить для конкретного элемента

	interaction_distance	= 10, -- = 100 метров на карте в ОМе (х10). Да, надо подлететь полближе. Агента Enigma подбирали с дистанцией 50 м
	interaction_time		= 10, -- время взаимодействия, взято из AdventureInteractObject_RoP2025_St02_Enigma (стандартное 5 - тут увеличил)
	max_detection_distance	= 30, -- = 300 метров на карте в ОМе (х10). Это "щадяще". Агента Enigma искали с дистанцией 100 м
	--hudType 		= "loot_crate", 
	--interaction_deactivate	= true,
	respawn_time	= 450, -- в данном случае 750 секуунд (7,5 мин). Пусть ищут следующие а не ждут респавна на этой точке
	maxViewDist 			= 900, -- дистанция видимости самого объекта. В данном случае 900 м (без "х10")
	
	model		= "models/objects/gameplay/minerals/crystal_loot", --  Оригинальный "Неопознанный минерал" = ".../craft_loot" - идёт из наследуемого OpenWorld_QuestLootEmpire_s3... Есть итнтересная модель: "models/objects/gameplay/loot_minerals/crystal_mineral_04" в виде "камень с кристаллом" 
	physics		= { solid_type = solid.model, static = true, material = "Rock"},
	
	uiName			= "OpenWorld_QuestLootA25FOR30_10cw", -- "Неопознанный кристалл"
	required_item	= "ow_A25FOR30_10_cwkey",
	loot_item		= "ow_A25FOR30_10_cw",
}

Def.OpenWorld_A25FOR30_11_cw = -- для квеста A25FOR30_10
{
	inherit			= "OpenWorld_QuestLootEmpire_s3", -- а она наследуется от OpenWorld_QuestObject_Loot, где и задаются основные параметры (блок ниже), которые можно испраавить для конкретного элемента

	interaction_distance	= 10, -- = 100 метров на карте в ОМе (х10). Да, надо подлететь полближе. Агента Enigma подбирали с дистанцией 50 м
	interaction_time		= 12, -- время взаимодействия, взято из AdventureInteractObject_RoP2025_St02_Enigma (стандартное 5 - тут увеличил)
	max_detection_distance	= 120, -- = 1200 метров на карте в ОМе (х10). Это "щадяще". Агента Enigma искали с дистанцией 100 м
	--hudType 		= "loot_crate", 
	--interaction_deactivate	= true,
	respawn_time	= 300, -- в данном случае 300 секуунд (5 мин). Пусть ищут следующие а не ждут респавна на этой точке
	maxViewDist 			= 900, -- дистанция видимости самого объекта. В данном случае 900 м (без "х10")
	
	model		= "models/objects/gameplay/minerals/crystal_loot", --  Оригинальный "Неопознанный минерал" = ".../craft_loot" - идёт из наследуемого OpenWorld_QuestLootEmpire_s3... Есть итнтересная модель: "models/objects/gameplay/loot_minerals/crystal_mineral_04" в виде "камень с кристаллом" 
	physics		= { solid_type = solid.model, static = true, material = "Rock"},
	
	uiName			= "OpenWorld_QuestLootA25FOR30_10cw", -- "Неопознанный кристалл"
	required_item	= "ow_A25FOR30_11_cwkey",
	loot_item		= "ow_A25FOR30_11_cw",
}

Def.OpenWorld_A25FOR30_12_cw = -- для квеста A25FOR30_10
{
	inherit			= "OpenWorld_QuestLootEmpire_s3", -- а она наследуется от OpenWorld_QuestObject_Loot, где и задаются основные параметры (блок ниже), которые можно испраавить для конкретного элемента

	interaction_distance	= 10, -- = 100 метров на карте в ОМе (х10). Да, надо подлететь полближе. Агента Enigma подбирали с дистанцией 50 м
	interaction_time		= 10, -- время взаимодействия, взято из AdventureInteractObject_RoP2025_St02_Enigma (стандартное 5 - тут увеличил)
	max_detection_distance	= 30, -- = 300 метров на карте в ОМе (х10). Это "щадяще". Агента Enigma искали с дистанцией 100 м
	--hudType 		= "loot_crate", 
	--interaction_deactivate	= true,
	respawn_time	= 450, -- в данном случае 450 секуунд (7,5 мин). Пусть ищут следующие а не ждут респавна на этой точке
	maxViewDist 			= 900, -- дистанция видимости самого объекта. В данном случае 900 м (без "х10")
	
	model		= "models/objects/gameplay/minerals/crystal_loot", --  Оригинальный "Неопознанный минерал" = ".../craft_loot" - идёт из наследуемого OpenWorld_QuestLootEmpire_s3... Есть итнтересная модель: "models/objects/gameplay/loot_minerals/crystal_mineral_04" в виде "камень с кристаллом" 
	physics		= { solid_type = solid.model, static = true, material = "Rock"},
	
	uiName			= "OpenWorld_QuestLootA25FOR30_10cw", -- "Неопознанный кристалл"
	required_item	= "ow_A25FOR30_12_cwkey",
	loot_item		= "ow_A25FOR30_12_cw",
}

Def.OpenWorld_QuestLootFederation_pz2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_pz2",
	required_item	= "ow_QuestLootFederation_pz2key",
	loot_item		= "ow_QuestLootFederation_pz2",
}


Def.OpenWorld_QuestLootJericho_s3 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_s3",
	required_item	= "ow_QuestLootJericho_s3key",
	loot_item		= "ow_QuestLootJericho_s3",
}

Def.OpenWorld_QuestLootJericho_s2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_s2",
	required_item	= "ow_QuestLootJericho_s2key",
	loot_item		= "ow_QuestLootJericho_s2",
}

Def.OpenWorld_QuestLootJericho_gh = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_gh",
	required_item	= "ow_QuestLootJericho_ghkey",
	loot_item		= "ow_QuestLootJericho_gh",
}

Def.OpenWorld_QuestLootJericho_ms = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_ms",
	required_item	= "ow_QuestLootJericho_mskey",
	loot_item		= "ow_QuestLootJericho_ms",
}

Def.OpenWorld_QuestLootJericho_ms2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_ms2",
	required_item	= "ow_QuestLootJericho_ms2key",
	loot_item		= "ow_QuestLootJericho_ms2",
}

Def.OpenWorld_QuestLootJericho_ms3 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_ms3",
	required_item	= "ow_QuestLootJericho_ms3key",
	loot_item		= "ow_QuestLootJericho_ms3",
}

Def.OpenWorld_QuestLootJericho_gm = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_gm",
	required_item	= "ow_QuestLootJericho_gmkey",
	loot_item		= "ow_QuestLootJericho_gm",
}

Def.OpenWorld_QuestLootJericho_gi = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_gi",
	required_item	= "ow_QuestLootJericho_gikey",
	loot_item		= "ow_QuestLootJericho_gi",
}

Def.OpenWorld_QuestLootJericho_gi2 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_gi2",
	required_item	= "ow_QuestLootJericho_gi2key",
	loot_item		= "ow_QuestLootJericho_gi2",
}

Def.OpenWorld_QuestLootJericho_gi3 = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_gi3",
	required_item	= "ow_QuestLootJericho_gi3key",
	loot_item		= "ow_QuestLootJericho_gi3",
}

Def.OpenWorld_QuestLootFederation_tdl = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootFederation_tdl",
	required_item	= "ow_QuestLootFederation_tdlkey",
	loot_item		= "ow_QuestLootFederation_tdl",
}

Def.OpenWorld_QuestLootJericho_mt = 
{
	inherit			= "OpenWorld_QuestLootEmpire_s3",

	uiName			= "OpenWorld_QuestLootJericho_mt",
	required_item	= "ow_QuestLootJericho_mtkey",
	loot_item		= "ow_QuestLootJericho_mt",
}

Def.OpenWorld_QuestFederarion_ayd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/gameplay/bombball/bombball_orbit",
	physics				=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, static = true, },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestFederation_ayd",
	required_item	= "ow_QuestFederarion_ayd",
}

Def.OpenWorld_QuestFederarion_od = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/gameplay/bombball/bombball_orbit",
	physics				=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestFederarion_od",
	required_item	= "ow_QuestFederarion_od",
}

Def.OpenWorld_QuestEmpire_dsd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/gameplay/bombball/bombball_orbit",
	physics				=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestEmpire_dsd",
	required_item	= "ow_QuestEmpire_dsd",
}

Def.OpenWorld_QuestJericho_lhd = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/gameplay/bombball/bombball_orbit",
	physics				=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestJericho_lhd",
	required_item	= "ow_QuestJericho_lhd",
}

Def.OpenWorld_QuestJericho_lhd2 = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/gameplay/bombball/bombball_orbit",
	physics				=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestJericho_lhd2",
	required_item	= "ow_QuestJericho_lhd2",
}

Def.OpenWorld_TutorialLoot1 = 
{
	inherit			= "OpenWorld_QuestObject_Loot",
	respawn_time	= 30,

	model		= "models/objects/gameplay/loot_box/loot_box",
	physics		= { solid_type = solid.model, static = true, material = "Rock"},

	uiName			= "OpenWorld_QuestEmpLoot_1",
	required_item	= "ow_TutorialLoot1key",
	loot_item		= "ow_TutorialLoot1",
	
	glare_color = 3,
}

Def.OpenWorld_CampaignLoot3 = 
{
	inherit			= "OpenWorld_QuestObject_Loot",
	respawn_time	= 30,

	model		= "models/objects/gameplay/loot_box/loot_box",
	physics		= { solid_type = solid.model, static = true, material = "Rock"},

	uiName			= "OpenWorld_CampaignLoot3",
	required_item	= "ow_CampaignLoot3key",
	loot_item		= "ow_CampaignLoot3",
	
	glare_color = 3,
}

-- уничтожаемый объект для квестов
Def.OpenWorld_Quest_do = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/control_tower/control_tower",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable		= true,
	health 			= 50000,
	special_object	= true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	--vision_always	= true,
	respawn_time	= 60.0,
	karma_reward_kill = 1,

	relationship_group	= ai.RelationshipGroups.Pirate,
	hud_ico			= "hud_pirate_icon",
	
	death_effect	= "particles/explosions/objects/tower_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 0, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 0, -15, 0 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 0 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 5, -10, 0 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 05, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, -30, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},

}

Def.OpenWorld_Quest_Empire_gr3do = 
{
	inherit			= "OpenWorld_Quest_do",

	uiName			= "OpenWorld_Quest_Empire_gr3do",
}

Def.OpenWorld_Quest_Empire_gs3do = 
{
	inherit			= "OpenWorld_Quest_do",
	relationship_group	= ai.RelationshipGroups.Alien,
	hud_ico			= "hud_kiber_icon", --s2

	uiName			= "OpenWorld_Quest_Empire_gs3do",
}

Def.OpenWorld_Quest_Empire_gr2do = 
{
	inherit			= "OpenWorld_Quest_do",

	uiName			= "OpenWorld_Quest_Empire_gr2do",
}

Def.OpenWorld_Quest_Federation_lc3do = 
{
	inherit			= "OpenWorld_Quest_do",
	relationship_group	= ai.RelationshipGroups.Alien,
	hud_ico			= "hud_kiber_icon", --s2

	uiName			= "OpenWorld_Quest_Federation_lc3do",
}

Def.OpenWorld_Quest_Federation_cwdo = 
{
	inherit			= "OpenWorld_Quest_do",
	relationship_group	= ai.RelationshipGroups.Alien,
	hud_ico			= "hud_kiber_icon", --s2

	uiName			= "OpenWorld_Quest_Federation_cwdo",
}

Def.OpenWorld_Quest_Jericho_msdo = 
{
	inherit			= "OpenWorld_Quest_do",
	relationship_group	= ai.RelationshipGroups.Alien,
	hud_ico			= "hud_kiber_icon", --s2

	uiName			= "OpenWorld_Quest_Jericho_msdo",
}

Def.OpenWorld_Quest_Jericho_gmdo = 
{
	inherit			= "OpenWorld_Quest_do",
	relationship_group	= ai.RelationshipGroups.Alien,
	hud_ico			= "hud_kiber_icon", --s2

	uiName			= "OpenWorld_Quest_Jericho_gmdo",
}


-- инверторы материи
Def.OpenWorld_Quest_Empire_pz1do = 
{
	inherit			= "OpenWorld_Quest_do",
	hud_ico			= "alien_megabomb_icon",
	maxViewDist		= 5000,
	model			= "mapskit/maps/models/precursors/pc_animated_core_small",
	children 	= 	{{ effect ="particles/objects/alien_invertor_core", joint = "root" },},
	physics		= { solid_type = solid.model, static = true, material = "Rock" },
	
	death_effect	= "particles/explosions/objects/alien_invertor_explosion",
	death_sound		= "sound/explosion/alien_bomb_expl",
	work_sound		= "sound/raid/megabomb_raid_idle",
	
	vision_always = true,
	relationship_group = ai.RelationshipGroups.Alien, -- alien
	
	uiName = "Megabomb_Raid_Pve_name",

	--uiName			= "OpenWorld_Quest_Empire_gs3do",
}

Def.OpenWorld_Quest_Federation_pz2do = 
{
	inherit			= "OpenWorld_Quest_Empire_pz1do",

--	uiName			= "OpenWorld_Quest_Federation_pz2do",
}


Def.OpenWorld_QuestEmpire_4 = 
{
	inherit			= "OpenWorld_QuestObject_Loot",

	model		= "models/objects/gameplay/bombball/bombball",
	physics		= { solid_type = solid.model, static = true, material = "Rock"},

	uiName			= "OpenWorld_QuestEmpire_4",
	required_item	= "ow_QuestEmpire4_key",
	loot_item		= "ow_QuestEmpire4_Bomb",
}

Def.OpenWorld_QuestFederation_4 = 
{
	inherit			= "OpenWorld_QuestObject_Loot",

	model		= "models/objects/gameplay/loot_box/loot_box",
	physics		= { solid_type = solid.model, static = true, material = "Rock"},

	uiName			= "OpenWorld_QuestFederation_4",
	required_item	= "ow_QuestFederation4_key",
	loot_item		= "ow_QuestFederation4",
	
	glare_color = 3,
}

Def.OpenWorld_QuestJericho_4 = 
{
	inherit			= "OpenWorld_QuestObject_Loot",

	model			= "models/weapons/drones/healbot/healbot",
	physics			= { solid_type = solid.sphere, material = "Metal", static = true,  },

	uiName			= "OpenWorld_QuestJericho_4",
	required_item	= "ow_QuestJericho4_key",
	loot_item		= "ow_QuestJericho4",
}


-- Объект для квестового взаимодействия: 3 ЭМИ установки для 11го дейлика
Def.OpenWorld_QuestFederation_sh2a = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound = "sound/game/openspace_quest/control_station_activation",

	uiName			= "OpenWorld_QuestFederation_sh2a",
	required_item	= "ow_QuestFederation_sh2a",
}

Def.OpenWorld_QuestFederation_sh2b = 
{
	inherit			= "OpenWorld_QuestFederation_sh2a",
	
	--uiName			= "OpenWorld_QuestFederation_sh2b",
	required_item	= "ow_QuestFederation_sh2b",
}

Def.OpenWorld_QuestFederation_sh2c = 
{
	inherit			= "OpenWorld_QuestFederation_sh2a",
	
	--uiName			= "OpenWorld_QuestFederation_sh2c",
	required_item	= "ow_QuestFederation_sh2c",
}


-- Объект для квестового взаимодействия: 3 генератора для 10го дейлика
Def.OpenWorld_QuestJericho_s3a = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/objects/vital_point/energy_station/empire_energy_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	children = 
	{
		{ effect = "particles/objects/generator_lightning2", joint = "fx1" },
		{ effect = "particles/objects/generator_lightning2", joint = "fx2" },
		{ effect = "particles/objects/generator_lightning2", joint = "fx3" },
		{ effect = "particles/objects/generator_lightning", joint = "fx4" },
		{ effect = "particles/objects/generator_lightning", joint = "fx5" },
		{ effect = "particles/objects/generator_lightning", joint = "fx6" },
		{ effect = "particles/objects/generator_lightning", joint = "fx7" },
	},

	uiName			= "OpenWorld_QuestJericho_s3a",
	required_item	= "ow_QuestJericho_s3a",
}

Def.OpenWorld_QuestJericho_s3b = 
{
	inherit			= "OpenWorld_QuestJericho_s3a",
	
	model			= "models/objects/vital_point/energy_station/fed_energy_station",
	uiName			= "OpenWorld_QuestJericho_s3b",
	required_item	= "ow_QuestJericho_s3b",
}

Def.OpenWorld_QuestJericho_s3c = 
{
	inherit			= "OpenWorld_QuestJericho_s3a",
	
	model			= "models/objects/vital_point/energy_station/jer_energy_station",
	uiName			= "OpenWorld_QuestJericho_s3c",
	required_item	= "ow_QuestJericho_s3c",
}

--- Объекты для взайимодействия в новогодних дейликах NY15
Def.OpenWorld_NY_DAILY_12a = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	--model		= "models/objects/gameplay/loot_prec/loot_prec", 
	--model		= "models/objects/gameplay/prec_obj/prec_obj",
	model		= "models/objects/gameplay/prec_obj_bg/prec_crystal",
	physics		= { solid_type = solid.model, static = true, material = "Metal"},
	--interacting_success_sound = "sound/game/openspace_quest/control_station_activation",

	uiName			= "OpenWorld_NY_DAILY_12a",
	required_item	= "ow_NY_DAILY_12a",
}

Def.OpenWorld_NY_DAILY_12b = 
{
	inherit			= "OpenWorld_NY_DAILY_12a",
	
	uiName			= "OpenWorld_NY_DAILY_12b",
	required_item	= "ow_NY_DAILY_12b",
}

Def.OpenWorld_NY_DAILY_12c = 
{
	inherit			= "OpenWorld_NY_DAILY_12a",
	
	uiName			= "OpenWorld_NY_DAILY_12c",
	required_item	= "ow_NY_DAILY_12c",
}


Def.OpenWorld_NY_DAILY_13a = 
{
	inherit			= "OpenWorld_NY_DAILY_12a",
	
	uiName			= "OpenWorld_NY_DAILY_13a",
	required_item	= "ow_NY_DAILY_13a",
}

Def.OpenWorld_NY_DAILY_13b = 
{
	inherit			= "OpenWorld_NY_DAILY_13a",
	
	uiName			= "OpenWorld_NY_DAILY_13b",
	required_item	= "ow_NY_DAILY_13b",
}

Def.OpenWorld_NY_DAILY_13c = 
{
	inherit			= "OpenWorld_NY_DAILY_13a",
	
	uiName			= "OpenWorld_NY_DAILY_13c",
	required_item	= "ow_NY_DAILY_13c",
}

Def.OpenWorld_LootMailer = 
{
	class					= "ScBaseEntity",
	in_editor				= true,

	
	physics					= { solid_type = solid.box, mass = 5000, material = "ShipMetalMk1",  static = true,},
	model					= "models/objects/vital_point/drone_postman/drone_postman",
	uiName					= "OpenWorld_LootMailer",

	mailer_respawn_timer	= 5,
	mailer_tax				= 0.1,
	mailer_interaction_time	= 5,
}

Def.Test_MineStation =
{
	class 			= "MineStation",

	model			= "mapskit/maps/models/drill/drill_bot", 
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	hudType			= "default",

	spawn_point		= "TagPoint_MineStation",

	mine_time 		= 30,
	activation_radius = 50,
	min_loot_count	= 3,
	max_loot_count	= 10,
	killed_loot_count = 2,
	loot_defs		= { "LootCrate_Gold2", "LootCrate_Crystal2" },
	loot_bones		= { "loot1", "loot2", "loot3", "loot4", "loot5", "loot6", "loot7", "loot8" },

	respawn_time 	= 10,
	damageable		= true,
	health 			= 5000,
	remove_on_death	= false,
}


--
Def.Test_RepairStation = 
{
	class 			= "ScBaseEntity",
	model			= "mapskit/maps/models/imper_station/heal_station/heal_station", 
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	hudType			= "default",

	spawn_point		= Vec3( 0, 1000, 0 ),

	repair_station_bonuses = {
		{ "Bonus_HealHull", "dispenser" }, -- bonus def, bone
		{ "LootCrate_Fuel_Dynamic", "dispenser_02"},
	},

	loot_respawn_time = 30,

	player_spawn_bone = "exit",

	children =
	{
		{	effect = "particles/objects/heal_station_beam", joint = "fx_01"	},
		{	effect = "particles/objects/heal_station_beam", joint = "fx_02"	},
	},
}


-- пушка для предтеч
Def.Weapon_AlienGun_T4 =
{
	class				= "AutoGun",
	--class_mask			= 2,
	weapon_class = 2,	
	dispersion =0,
	item_subtype = 17,
	max_range = 500,
	optimal_range = 300,
	
	--inherit				= "Weapon_SWGift_T3",
	--storeItemId			= 0,
	--cant_be_bought  	= true,
	drop_weight			= 0,
	--tier 				= 4,
	
	fire_rate			= 30,
	damage_emp		 	= 250*6*2,
	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
	
	projectile			= "Projectile_AlienGun",
	shot_once_sound 		= "sound/weapons/aliengun/ag_shot",
	projectile_speed		= 100,	
	heat_add 			= 0,
	
	muzzleflash_color = { kinetic = "171 255 195 128", emp = "171 255 195 128", thermal = "171 255 195 128", },
	muzzleflash_radius = 35,
	
	uiName = "AlienGun",
}
--particles/weapons/prec_ship_projectile

Def.Projectile_AlienGun  =
{
	--inherit			= "Projectile_Plasma_Default",
	inherit			= "Weapon_BaseRocket",
	model = "models/misc/invisible_model",
	explosion_blast_wave 	= "Blastwave_AlienGun",
	override_blast_wave_damage = true,
	detonation_radius		= 3,
	
	flare_color			= "100 255 100 20",
	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/nanobots_trail",	
	work_sound			= "sound/weapons/singularity/sg_fly",
	missile_defence_immune 	= true,	
	missile_detection_immune = true,

	effect 			= "particles/weapons/alien/alien_gun_projectile", 
	--shadowCaster	= false,
	--impact_type 	= "plasma",
	is_guided		= true,
	angular_velocity= 6,
}

Def.Blastwave_AlienGun  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_maxDistance		= 12,
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/alien/alien_gun_explosion",
	light_color 			= "171 255 195 128",
	light_radius 			= 20,
	light_time 				= 0.8,
	sound 					= "sound/explosion/nanobot_expl",
}

Def.Weapon_AlienGun_Heat_T4 =
{
	inherit			= "Weapon_AlienGun_T4",
	optimal_range	= 200,
	max_range		= 650,
	heat_max 		= 10, 
	heat_add 		= 3,
	heat_sub 		= 3,
	overheat_time 	= 1,
	damage_emp		= 4000,
}


Def.Module_Pulsar_Alien =
{
	class					= "ActiveModule",
	module_type 			= ai.ModuleType.ACTIVE, 
	
	--inherit					= "Module_SmartBomb_T4_Mk1",
	cooldown 				= 10,
	energy_cost				= 0,
	spell					= "Alien_Pulsar",
	--storeItemId				= 0,
	uiName 					= "AlienPulsar",
}

Def.Module_Pulsar_Alien_Low =
{
	class					= "ActiveModule",
	module_type 			= ai.ModuleType.ACTIVE, 
	
	--inherit					= "Module_SmartBomb_T4_Mk1",
	cooldown 				= 10,
	energy_cost				= 0,
	spell					= "Alien_Pulsar_Low",
	--storeItemId				= 0,
	uiName 					= "AlienPulsar",
}

Def.Module_Pulsar_Alien_PvE_T2 =
{
	class					= "ActiveModule",
	module_type 			= ai.ModuleType.ACTIVE, 
	
	--inherit					= "Module_SmartBomb_T4_Mk1",
	cooldown 				= 10,
	energy_cost				= 0,
	spell					= "Alien_Pulsar_PvE_T2",
	--storeItemId				= 0,
	uiName 					= "AlienPulsar",
}

Def.Module_Pulsar_Alien_PvE_T4 =
{
	class					= "ActiveModule",
	module_type 			= ai.ModuleType.ACTIVE, 
	
	--inherit					= "Module_SmartBomb_T4_Mk1",
	cooldown 				= 10,
	energy_cost				= 0,
	spell					= "Alien_Pulsar_PvE_T4",
	--storeItemId				= 0,
	uiName 					= "AlienPulsar",
}


-- пушка для риверов
Def.Weapon_ReaverGun_T4 =
{
	inherit				= "Weapon_SWGift_T3",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	tier 				= 4,
	
	projectile			= "Projectile_ReaverGun",

	fire_rate			= 60,
	damage_emp		 	= 500,	--s2 было 600
	projectile_speed	= 400,	--s2 было 475!
	
	muzzleflash_color = { kinetic = "80 210 80 128", emp = "80 210 80 128", thermal = "80 210 80 128", },
	shot_effect 		= "particles/weapons/alien/reaver_gun_muzzle",
	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
}

Def.Weapon_ReaverGun_T4_WO_Model =
{
	inherit				= "Weapon_ReaverGun_T4",
	model				= "models/misc/invisible_model",
}

Def.Projectile_ReaverGun  =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/alien/reaver_gun_hit",
	effect 			= "particles/weapons/alien/reaver_gun_projectile",

	shadowCaster		= false,
	impact_type 		= "plasma",
}

Def.Projectile_CruiserGun  =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/alien/prec_cruiser_gun_hit",
	effect 			= "particles/weapons/alien/prec_cruiser_gun_projectile",

	shadowCaster		= false,
	impact_type 		= "plasma",
}


-- тестовая пушка для риверов, не используется уже
Def.Weapon_Alien_LaserGreen_T4 = {
	inherit				= "Weapon_Laser_Basic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Laser_Basic_T4_Mk1.fire_rate*0.3,

	beam_fx 			= "particles/weapons/laser/laser_basic_beam",
}

-- тестовая пушка для риверов, не используется уже
Def.Weapon_Alien_PlasmaGreen_T4 = {
	inherit				= "Weapon_Plasmagun_Heavy_RolePirateOW",
	projectile			= "Projectile_AlienSingularityCannon",
	--shot_beam_fx 		= "particles/weapons/big/plasma_slow_2_beam",
	class_mask			= ai.ShipClass.LARGE,
}

Def.Projectile_AlienSingularityCannon =
{
	inherit			= "Projectile_SingularityCannon",
	effect 			= "particles/weapons/alien/alien_gun_projectile",
}



-- портал-дыра к предтечам
Def.OpenWorld_PortalJumpgate =
{
	class 				= "ScBaseEntity",
	in_editor			= true,
	model				= "models/shields/portal",
	--physics				= { solid_type = solid.model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,
	work_sound 			= "sound/ambient/alien_portal_loop",
	open_effect 		= "particles/objects/portal_open",
	close_effect		= "particles/objects/portal_close",

	full_activate_effect = "particles/other/wave_portal_open_big",

	children = 
	{
		{ effect = "particles/objects/portal", joint = "root" },
	}
}

Def.OpenWorld_Gate_Withcollision_Emp =
{
	class 				= "BaseEntity",
	in_editor			= true,	
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	model				= "models/shields/gate_with_collision_empire",	
}

Def.OpenWorld_Gate_Withcollision_Fed =
{
	class 				= "BaseEntity",
	in_editor			= true,	
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	model				= "models/shields/gate_with_collision_fed",	
}

Def.OpenWorld_Gate_Withcollision_Jer =
{
	class 				= "BaseEntity",
	in_editor			= true,	
	physics				= { solid_type = solid.model, static = true, material = "Metal" },
	model				= "models/shields/gate_with_collision_jericho",	
}

---------------- WRECKS не пропадающие ----------------
Def.OW_Wreck_R1_S = 
{
	class		=	'BaseEntity',
	in_editor	=	true,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_1/wrecks/r1_wreck_s",	
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.OW_Wreck_R1_M = 
{
	class		=	'BaseEntity',
	in_editor	=	true,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_1/wrecks/r1_wreck_m",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}
	
Def.OW_Wreck_R1_L = 
{
	class		=	'BaseEntity',
	in_editor	=	true,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_1/wrecks/r1_wreck_l",
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.OW_Wreck_R2_S = 
{
	class		=	'BaseEntity',
	in_editor	=	true,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_2/wrecks/r2_wreck_s",
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.OW_Wreck_R2_M = 
{
	class		=	'BaseEntity',
	in_editor	=	true,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_2/wrecks/r2_wreck_m",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}
	
Def.OW_Wreck_R2_L = 
{
	class		=	'BaseEntity',
	in_editor	=	true,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_2/wrecks/r2_wreck_l",
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.OW_Wreck_R3_S = 
{
	class		=	'BaseEntity',
	in_editor	=	true,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_3/wrecks/r3_wreck_s",
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

Def.OW_Wreck_R3_M = 
{
	class		=	'BaseEntity',
	in_editor	=	true,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_3/wrecks/r3_wreck_m",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}
	
Def.OW_Wreck_R3_L = 
{
	class		=	'BaseEntity',
	in_editor	=	true,
	hudType		= 	"loot_crate",
	model		=	"models/ships/race_3/wrecks/r3_wreck_l",
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
}

-- блокпост киберов из Jericho Base
Def.OpenWorld_KiberAvanpostJB =
{
	class						= "BaseEntity",
	relationship_group	= ai.RelationshipGroups.Alien,	--s2 Pirate,
	in_editor					= true,
	damageable			= false,
	maxViewDist			= 5000,
	--hud_ico					= "hud_pirate_icon",
	hud_ico					= "hud_kiber_icon",	--s2
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model					= "models/objects/vital_point/blockpost/jer_blockpost_01",
	uiName = "OpenWorld_KiberAvanpostJB",	--83499
	
	children = 
	{
		{ def = "OpenWorld_KiberTurretJB", joint = "gun_1" },
		{ def = "OpenWorld_KiberTurretJB", joint = "gun_2" },
		{ def = "OpenWorld_KiberTurretJB", joint = "gun_3" },
		{ def = "OpenWorld_KiberTurretJB", joint = "gun_4" },
		{ def = "OpenWorld_KiberTurretJB", joint = "gun_5" },
		{ def = "OpenWorld_KiberTurretJB", joint = "gun_6" },	
		
		{ effect = "particles/objects/avanpost_jer", joint = "fx1" },
		{ effect = "particles/objects/avanpost_jer", joint = "fx2" },
		{ effect = "particles/objects/avanpost_jer", joint = "fx3" },

		{ effect = "particles/areal/antenna_light_red", joint = "light1" },
		{ effect = "particles/areal/antenna_light_red", joint = "light2" },
		{ effect = "particles/areal/antenna_light_red", joint = "light3" },
		{ effect = "particles/areal/antenna_light_red", joint = "light4" },

		{ effect = "particles/areal/antenna_light_periodic", joint = "light5" },
		{ effect = "particles/areal/antenna_light_periodic", joint = "light6" },
	}
}

--Слабый аванпост киберов из Jericho Base
Def.OpenWorld_KiberAvanpostJB_T3 =
{
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model					= "models/objects/vital_point/blockpost/jer_blockpost_01",
	uiName = "OpenWorld_KiberAvanpostJB_T3",	--83499
	
	children = 
	{
		{ def = "OpenWorld_KiberTurretJB_T3", joint = "gun_1" },
		{ def = "OpenWorld_KiberTurretJB_T3", joint = "gun_2" },
		{ def = "OpenWorld_KiberTurretJB_T3", joint = "gun_3" },
		{ def = "OpenWorld_KiberTurretJB_T3", joint = "gun_4" },
		{ def = "OpenWorld_KiberTurretJB_T3", joint = "gun_5" },
		{ def = "OpenWorld_KiberTurretJB_T3", joint = "gun_6" },	
		
		{ effect = "particles/objects/avanpost_jer", joint = "fx1" },
		{ effect = "particles/objects/avanpost_jer", joint = "fx2" },
		{ effect = "particles/objects/avanpost_jer", joint = "fx3" },

		{ effect = "particles/areal/antenna_light_red", joint = "light1" },
		{ effect = "particles/areal/antenna_light_red", joint = "light2" },
		{ effect = "particles/areal/antenna_light_red", joint = "light3" },
		{ effect = "particles/areal/antenna_light_red", joint = "light4" },

		{ effect = "particles/areal/antenna_light_periodic", joint = "light5" },
		{ effect = "particles/areal/antenna_light_periodic", joint = "light6" },
	}
}

-- Турель из Jericho Base для аванпоста киберов
Def.OpenWorld_KiberTurretJB = 
{
	inherit					= "Turret_FlakGun",	
	relationship_group		= ai.RelationshipGroups.Pirate,
	health 					= 20000,
	hudType 				= "default",
	hud_visibility_type		= "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 200.0,
	dispersion				= 1.5, -- deg
	max_range				= 150,
	max_rot_speed			= 90,	-- deg per second
	
	damage_kinetic			= 0,
	damage_emp				= 500,
	damage_thermal			= 0,
	
	uiName					= "KiberTurret",	
	model			= "models/turret/plasma_turret/plasma_turret_jer", 
	
	projectile		= "Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",	
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot",
	rot_sound		= "sound/weapons/turret/turret_motor",
}

--Рельсотронная установка  для блокпоста киберов T3 и меньше
Def.OpenWorld_KiberTurretJB_T3 = 
{
	inherit					= "OpenWorld_KiberTurretJB",	
	health 					= 10000,
	damage_emp				= 150,
	uiName					= "KiberTurret",
}

-- пиратская рейлган туррель для секретки
Def.Turret_Pirate_RailGun = 
{	
	inherit 				= "Turret_RailGun",
	class 					= "Turret",
	in_editor				= true,
	model					= "models/turret/round_railgun01/round_railgun01", 
	hudType					= "default",
	hud_visibility_type 	= "minor", 

	relationship_group 		= ai.RelationshipGroups.Pirate,

	physics					= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 					= 9000,
	damageable				= true,
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate				= 30.0, -- 60
	dispersion				= 0.0, -- deg
	optimal_range			= 200,
	max_range				= 400,
	projectile_speed 		= 110, --100
	
	damage_kinetic			= 840,
	damage_emp				= 0,
	damage_thermal			= 0,
	
	max_rot_speed			= 90,	-- deg per second

	shot_effect 			= "particles/weapons/drongun/muzzle",

	death_effect			= "particles/explosions/objects/explosion_tiny",
	
	uiName 					= "Turret_Pirate_RailGun_name",
}

-- пиратская турель для секретки
Def.Turret_Pirate_FlakGun = 
{
	inherit			= "Turret_FlakGun",
	relationship_group = ai.RelationshipGroups.Pirate,
	health 			= 9000,
	hudType			= "default",
	hud_visibility_type = "minor",
	karma_reward_kill		= 0,	
	respawn_time 			= 300.0,
	
	fire_rate		= 45.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 100,
	
	damage_kinetic	= 500,
	damage_emp		= 0,
	damage_thermal	= 0,
	
	uiName = "Turret_Pirate_FlackGun_name",
}

-- Повреждённая плазмо турель для секретки
Def.Turret_Damaged_PlasmaCannon =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/turret/big_plasma_cannon/big_plasma_cannon",

	physics			= { solid_type = solid.compound_model, static = true, material = "ShipMetalMk1" },
	damageable		= true,

	relationship_group = ai.RelationshipGroups.Pirate,
	health 			= 75000,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	uiName = "Turret_Damaged_PlasmaCannon_name",
}


-- ракетная НУРС туррель Пиратов для секретки
Def.Turret_Pirate_RocketGun = 
{
	inherit			= "Turret_RocketGun",
	relationship_group = ai.RelationshipGroups.Pirate,
	health 			= 250000,
	projectile		= "SpaceMissile_AAMu_T4_Mk3",
	hudType			= "default",
	hud_visibility_type = "minor", 
	
	fire_rate		= 60.0,
	dispersion		= 1.0, -- deg
	max_range		= 210,
	max_rot_speed	= 25,	-- deg per second
	
	uiName = "Turret_Pirate_RocketGun_name",
}

--
Def.Turret_Damaged_RocketGun = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/turret/rocket_launcher/rocket_launcher",

	relationship_group = ai.RelationshipGroups.Pirate,
	hudType 		= "default",

	physics			= { solid_type = solid.cylindery, static = true, material = "ShipMetalMk1" },
	health 			= 125000,
	damageable		= true,
	
	death_effect	= "particles/explosions/shp_exp_big_02",
	death_sound		= "sound/explosion/turret_expl",
	
	broken_parts = 
	{
		[ 1 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 2 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 3 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 4 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 5 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 6 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
	},

	uiName = "Turret_Damaged_RocketGun_name",
}

--маяк-портал для предтеч
Def.VitalPoint_AlienPortal =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/shields/portal",
	physics			= { solid_type = solid.none, static = true },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "AlienPortal_name",
	health			= 5000,
	--gameplay_idx	= 0,
	relationship_group = ai.RelationshipGroups.Alien,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 80,
	decay_max_enemy = 1,
	
	idle_sound 		= "sound/ambient/alien_portal_loop",
	death_sound		= "sound/ambient/alien_portal_off",
	
	friendly_beam_fx= "particles/objects/portal_close_beam",
	hostile_beam_fx = "particles/objects/portal_close_beam",	
	
	--open_effect 	= "particles/objects/portal_open",
	--close_effect	= "particles/objects/portal_close",
	
	--full_activate_effect = "particles/other/wave_portal_open_big",

	vision_always = true,
	
	turret_def1 	= "DroidAlien",
	turret_def2 	= "DroidAlien",
	turret_def3 	= "DroidAlien",
	turret_def4 	= "DroidAlien",
}

--маяк-портал для предтеч в рейде
Def.VitalPoint_AlienPortal_Raid =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/shields/portal",
	physics			= { solid_type = solid.none, static = true },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "AlienPortal_name",
	health			= 4600, -- 7200 #47101
	--gameplay_idx	= 0,
	relationship_group = ai.RelationshipGroups.Alien,
	regen_speed		= 15.0,
	regen_max_ally	= 5,
	decay_damage	= 40,
	decay_max_enemy = 12,
	
	idle_sound 		= "sound/ambient/alien_portal_loop",
	death_sound		= "sound/ambient/alien_portal_off",
	
	friendly_beam_fx= "particles/objects/portal_close_beam",
	hostile_beam_fx = "particles/objects/portal_close_beam",
	activation_beam_fx	= "particles/objects/prec_cruiser_portal_beam",
	
	--open_effect 	= "particles/objects/portal_open",
	--close_effect	= "particles/objects/portal_close",
	
	--full_activate_effect = "particles/other/wave_portal_open_big",

	vision_always = true,
	
	turret_def1 	= "TestDroidAlien",
	turret_def2 	= "TestDroidAlien",
	turret_def3 	= "TestDroidAlien",
	turret_def4 	= "TestDroidAlien",
}

-- #57052 портал для NY15 эвента на станциях
Def.VitalPoint_ReiderPortal_OW =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/portal/pirate_portal",
	physics			= { solid_type = solid.none, static = true },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "reider_portal",
	health			= 5000,
	relationship_group = ai.RelationshipGroups.Pirate,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 80,
	decay_max_enemy = 1,
	
	idle_sound 		= "sound/ambient/alien_portal_loop",
	death_sound		= "sound/ambient/alien_portal_off",
	
	friendly_beam_fx= "particles/objects/portal_close_beam",
	hostile_beam_fx = "particles/objects/portal_close_beam",
	activation_beam_fx	= "particles/objects/prec_cruiser_portal_beam",

	vision_always = true,
	
	turret_def1 	= "",
	turret_def2 	= "",
	turret_def3 	= "",
	turret_def4 	= "",

	is_decayable	= true,
	precache_skins = true,

	open_effect 	= "particles/jumpgates/pirate_portal_open",
	close_effect	= "particles/jumpgates/pirate_portal_open",
}


-- пушка для бота для NY15 эвента на станциях
Def.Weapon_ShotGun_Reider = 
{
	inherit				= "Weapon_Railgun_Autofire_T3_Mk3",
	max_range			= 200,
	damage_kinetic		= 200,
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,	
	projectile			= "Projectile_BuckshotRailgun",	---#67224
}


-- бот для NY15 эвента на станциях
Def.Bot_ReiderPortal_Shield = 
{
	inherit = "Ship_Race2_L_T3",
	--model = "models/ships/race_2/l/race2_l_t3",
	--ship_tier = 3,
	--ship_name = "Ship_Race2_L_T3",
	--ship_class = ai.ShipClass.LARGE,
	ship4bot = true,
	storeItemId = 0,

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_ShotGun_Reider",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] = "Module_HardShield",
		[ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_Empty_PvE",
	},
	death_blast_wave = "LargeShipExplodeBlastWavePVE",

	uiName = "Raider_Elite",
	pve_ship_level = ai.PveShipLevel.NORMAL,
	max_speed = 25,
	vision_radius = 5000,
	hull_health = 5000,
	shield_max = 5000,
	behavior = ai.AiBehavior.SHIELD,
	spawn_warp_effect_end = "particles/ships/warp_exit_long",
}

Def.Weapon_BossGun_Reider =
{
	inherit				= "Weapon_AlienGun_PvE_T4",
	projectile			= "Projectile_AlienBossGun_PvE",
	fire_rate			= 30,
	projectile_speed	= 30,	
	damage_emp		 	= 2000,
	tier				= 3, 
	max_range 			= 700,
	optimal_range 		= 500,
}


Def.Bot_ReiderPortal_HardShield = 
{
	inherit = "Bot_ReiderPortal_Shield",
	model = "models/ships/race_3/l/race3_l_t3",
	ship_name = "Ship_Race3_L_T3",
	role = ai.ShipRoles.ENGINEER,
	
	ship4bot = true,
	storeItemId = 0,
	uiName = "Raider_Elite",
	

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_BossGun_Reider",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] = "Module_HardShield",
		[ ai.SpaceShipModuleSlot.SPECIAL ] = "Module_FrigateDrone_T3_Base",
	},

	max_speed = 25,
	vision_radius = 5000,
	hull_health = 20000,
	shield_max = 20000,
}

-- портал-дыра к предтечам большая Raid_Pve
Def.OpenWorld_PortalJumpgate_XL =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "mapskit/maps/models/precursors/pc_animated_portal",
--	model			= "models/objects/portal/portal_x3",
--	model			= "models/shields/portal",
	damageable		= false,
	physics			= { solid_type = solid.compound_model, static = true }, --model compound_model none
	vision_radius_with_drones = 3000,
	vision_radius_without_drones  = 2000,
	uiName			= "AlienPortal_XL_name",
	health			= 1000000,
	is_decayable	= false,
	--gameplay_idx	= 0,
	relationship_group = ai.RelationshipGroups.Alien,
	regen_speed		= 0,
	regen_max_ally	= 0,
	decay_damage	= 0,
	decay_max_enemy = 0,
	
	idle_sound_distance = 1000,
	idle_sound 		= "sound/raid/boss_gate_loop",
	death_sound		= "sound/ambient/alien_portal_off",
	
	friendly_beam_fx= "particles/objects/portal_close_beam",
	hostile_beam_fx = "particles/objects/portal_close_beam",
	activation_beam_fx	= "particles/gadget/drone_beam",
	
	--open_effect 	= "particles/objects/portal_open",
	--close_effect	= "particles/objects/portal_close",
	
	--full_activate_effect = "particles/other/wave_portal_open_big",

	vision_always = true,
}

Def.OpenWorld_PortalJumpgate_XL_out =
{
	inherit			= "OpenWorld_PortalJumpgate_XL",
	physics			= { solid_type = solid.none, static = true }, --model compound_model none
}


Def.DroidAlien =
{
	class			= "VitalPointTurret",
	in_editor		= false,
	
	model			= "models/objects/ships_huge/prec_ship/prec_drone2", 
	physics			= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 1000000, },
	maxViewDist		= 3000,
	use_team_skin	= true,
	
	damageable		= true,
	health			= 10000,
	signature		= ai.Signature.SMALL,

	points_reward_kill = 10,
	
	death_effect		= "particles/explosions/objects/alien_explosion",
	death_sound		= "sound/explosion/drone_expl",
	shot_once_sound         = "sound/weapons/aliengun/ag_drone_shot",

	fire_rate		= 100.0,
	dispersion		= 1.0, -- deg
	optimal_range	= 100,
	max_range		= 200,
	projectile_speed= 250,
	
	damage_kinetic	= 0,
	damage_emp		= 0,
	damage_thermal	= 300,

	max_rot_speed	= 200,	-- deg per second
	max_yaw			= 180,
	min_yaw			= -180,
	max_pitch		= 180,
	min_pitch		= -180,
	
	projectile		= "Projectile_DronAlien_Plasma",
	shot_effect 	= "particles/weapons/drongun/muzzle",
	
	uiName 				= "DroidAlien_name",
}

Def.TestDroidAlien =
{
	inherit			= "DroidAlien",

	health			= 4000,

	fire_rate		= 60.0,
	dispersion		= 1.0, -- deg
	optimal_range	= 100,
	max_range		= 200,
	projectile_speed= 250,
	
	damage_kinetic	= 0,
	damage_emp		= 0,
	damage_thermal	= 350,
	
	gameplay_coef_group_id		= 0,
	gameplay_coef_min_lifetime	= 2,
}

Def.Projectile_DronAlien_Plasma =
{
	inherit			= "Projectile_Plasma_Default",
	effect 			= "particles/weapons/drongun/projectile_alien",
	hit_effect		= "particles/weapons/alien/green_corrosive_hit",
	
	shadowCaster		= false,
	impact_type 		= "plasma",
	
	uiName			= "DroidTurret_Projectile",	
}

Def.Projectile_DronAlien_Plasma_Invertor =
{
	inherit			= "Projectile_DronAlien_Plasma",
	class			= "Rocket",
	spell 	= "OpenWorld_Invertor_Drone_ReduceHeal",
}

Def.OW_HangarGenerator = 
{
	inherit			= "Turret_Team2_Pve_TowerStation",
	model			= "mapskit/maps/models/bigship/att_sys_power_block_in3", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 75000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,

	points_reward_kill = 50,
	points_reward_assist_damage = 350,
	
	death_effect	= "particles/explosions/objects/explosion_small",
	
	vision_always = true,
	relationship_group = ai.RelationshipGroups.Pirate,
	
	uiName = "Pve_HangarGenerator_name",
}

-- большой генератор энергоблока для щита (самый первый)
Def.OW_EnergyGeneratorBig = 
{
	inherit			= "Turret_Team2_Pve_TowerStation",
	model			= "mapskit/maps/models/bigship/power_block2_big", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 100000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	
	death_effect	= "particles/explosions/objects/explosion_big",
	
	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = ai.RelationshipGroups.Pirate,
	
	uiName = "Pve_EnergyGenerator_name",
}

-- тройной генератор энергоблока для щита (второй)
Def.OW_EnergyGeneratorTriple = 
{
	inherit			= "Turret_Team2_Pve_TowerStation",
	model			= "mapskit/maps/models/bigship/power_block2_triple", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 75000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	
	death_effect	= "particles/explosions/objects/explosion_big",
	
	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = ai.RelationshipGroups.Pirate,
	
	uiName = "Pve_EnergyGenerator_name", 
}

-- длинный генератор энергоблока для щита (третий)
Def.OW_EnergyGeneratorLong = 
{
	inherit			= "Turret_Team2_Pve_TowerStation",
	model			= "mapskit/maps/models/bigship/power_block2_line", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 75000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	
	death_effect	= "particles/explosions/objects/explosion_big",
	
	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = ai.RelationshipGroups.Pirate,
	
	uiName = "Pve_EnergyGenerator_name",
} 

-- модуль щит-барьер для эвентовых НПС
Def.Module_ShieldBarrier = 
{
	class		= "ActiveModule",
	in_editor	= false,
	activate_entity	= "ForceBarrier",
	activate_entity_ttl = 5,
	spawn_offset = Vec3( 0, 0, -10 ),
	spawn_dir_to_target = true,
	attach_bone = "root",
	cooldown	= 15,
}

--
Def.Module_SmartBomb_OW = 
{
	class				= "SpaceShipModule",
	in_editor			= false,
	spell_on_equip		= "SmartBomb_OW",
	item_subtype		= ItemSubtype.SmartBomb,
}

Spell.SmartBomb_OW = 
{
	aura_range	= 23,
	aura_param	= 750,
	period	= 1,
	target=ai.SpellTarget.CASTER,
	aura=ai.Aura.DAMAGE_THERMAL_PERIODIC,
	aura_target = { 
		class = ai.SpellTargetClass.SHIP, 
		area = ai.SpellTargetArea.AROUND, 
		relationship = ai.SpellTargetRelationship.ENEMY, 
		vitality = ai.SpellTargetVitality.ALIVE, 
		damageability = ai.SpellTargetDamageability.DAMAGEABLE, 
	},
	isBuff=false,
}
--
Def.Module_HackWeapon_Self_OW = 
{
	class				= "SpaceShipModule",
	in_editor			= false,
	spell_on_equip		= "Spell_HackWeapon_Self_OW",
	item_subtype		= ItemSubtype.HackWeapon,
}

Spell.Spell_HackWeapon_Cast =
{
	target		= {
		relationship	= ai.SpellTargetRelationship.ALLY,
		class 			= ai.SpellTargetClass.SHIP,
	},
	target_range	= 5,
	aura = ai.Aura.CAST_SPELL_PERIODIC,
	target_spell = "Spell_HackWeapon_Self_OW",
	period = 30,
	isBuff = true,
}

Spell.Spell_HackWeapon_Self_OW =
{
	aura 		= ai.Aura.HACKED_WEAPON,
	ignore_subtype			= true,
	aura_target = 
	{
		target					= ai.SpellTargetGeneral.HOLDER,
	},
}

--Пушка для эвентового НПС
Def.Weapon_OWPirate_Event_Weapon =
{
	inherit			 = "Weapon_Plasmagun_Heavy_T4_Mk1",
	storeItemId		 = 0,
	cant_be_bought   = true,
	drop_weight		 = 0,
	
	fire_rate		 = 70,
	optimal_range    = 250,
	max_range		 = 400,
	projectile_speed = 65.0,
	damage_emp		 = 2500,
	
	class_mask		= ai.ShipClass.LARGE,

	heat_max		 = 10,
	heat_add 		 = 0,
	
	
	projectile		= "Projectile_PirateEventSingularity",
	shot_beam_fx 	= "particles/weapons/big/plasma_slow_2_beam",
}

-- Прожектайл для пушки эвентового нпс
Def.Projectile_PirateEventSingularity =
{
	inherit			= "Projectile_SingularityCannon",
	effect 			= "particles/weapons/big/plasma_slow_2",
}

Def.OW_PcMayak =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "mapskit/maps/models/precursors/pc_mayak",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },

	children 	=
	{
		{ effect = "particles/objects/pc_mayak_core",	joint = "root"},
		{ effect = "particles/objects/pc_mayak",		joint = "fx1" },
		{ effect = "particles/objects/pc_mayak",		joint = "fx2" },
		{ effect = "particles/objects/pc_mayak",		joint = "fx3" },
		{ effect = "particles/objects/pc_mayak",		joint = "fx4" },
		{ effect = "particles/objects/pc_mayak",		joint = "fx5" },
		{ effect = "particles/objects/pc_mayak",		joint = "fx6" },
		{ effect = "particles/objects/pc_mayak",		joint = "fx7" },
		{ effect = "particles/objects/pc_mayak",		joint = "fx8" },
	},
}

Def.OW_PcPortal =
{
	class 		= "AnimatedEntity",
	in_editor	= true,
	model		= "models/objects/jump_gates/big_jumpgate/pc_jumpgate",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

-- пушка для риверов в Frozen Station
Def.Weapon_ReaverGun_T4Slow =
{
	inherit				= "Weapon_ReaverGun_T4",
	dispersion_max 		= 3,
	dispersion_add		= 0.81,
	dispersion_sub 		= 0.81,

	dispersion 			= 0,	
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	tier 				= 4,
	
	projectile			= "Projectile_ReaverGun",

	fire_rate			= 50,
	damage_emp		 	= 500,
	projectile_speed	= 200,	

	muzzleflash_color = { kinetic = "80 210 80 128", emp = "80 210 80 128", thermal = "80 210 80 128", },

	shot_effect 		= "particles/weapons/alien/reaver_gun_muzzle",
	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
}

-- пушка для Alien Scout
Def.Weapon_ScoutGun =
{
	inherit 			= "Weapon_Base",
	class	 			= "AutoGun",

	cycle_barrels 		= true,

	max_range			= 350,
	overheat_time 		= 1,

	item_subtype		= ItemSubtype.SWGift,
	shot_once_sound		= "sound/weapons/giftgun/gg_shot",
---

	dispersion_max 		= 3,
	dispersion_add		= 0.81,
	dispersion_sub 		= 0.81,
	dispersion 			= 0,	

	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	
	projectile			= "Projectile_ReaverGun",

	fire_rate			= 50,
	damage_emp		 	= 350,	---500
	projectile_speed	= 200,	

	muzzleflash_color = { kinetic = "80 210 80 128", emp = "80 210 80 128", thermal = "80 210 80 128", },
	shot_effect 		= "particles/weapons/alien/reaver_gun_muzzle",
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
}

-- дроны алиенов в опенспейсе
Def.GuidedDrone_Alien2D =
{
	class					= "GuidedDrone",
	in_editor				= false,
	
	model			= "models/objects/ships_huge/prec_ship/prec_drone2", 
	physics			= { solid_type = solid.model, material = "ShipMetalMk1", mass = 1000, },
	maxViewDist		= 3000,
	
	damageable		= true,
	health			= 3000,

	points_reward_kill = 10,

	signature				= ai.Signature.SMALL,
	
	projectile			= "Projectile_DronAlien_Plasma",
	shot_effect 		= "particles/weapons/drongun/muzzle",

	death_effect		= "particles/explosions/objects/alien_explosion",
	death_sound			= "sound/explosion/drone_expl",
	shot_once_sound     = "sound/weapons/aliengun/ag_drone_shot",

	trail_effect 			= "particles/ships/ship_trail",
	trail_color 			= "4 95 184 100",
	trail_size 				= 0.05,
	
	max_speed				= 60,
	acceleration			= 20,
	max_rot_speed			= 120,	-- deg per second
	max_aim_rot_speed		= 60,
	
	control_range			= 100,
	fire_rate				= 60,
	dispersion				= 1,
	optimal_range			= 150,
	max_range				= 250,
	projectile_speed		= 200,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 500,
	damage_thermal			= 0,

	cooldown				= 10,
	holder_size				= 2,
	is_limited				= true, -- #52035
	empty_holder_cooldown	= 120,
	stacks					= true,
	MunitionBayType			= ai.MunitionBayType.MBT_SECONDARY ,
	item_subtype			= ItemSubtype.BasicGuidedDron,
	storeItemId				= 0,

	uiName 					= "DroidAlien_name",
}
-- тестовый объект
Def.OW_TransportParking =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/objects/ships_huge/freighter_imper/freighter_imper",
	physics		= { solid_type = solid.compound_model, static = true, material = "ShipMetalMk3" },
}

Def.OW_KiberVitalPoint =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	network_sync 	= false,
	maxViewDist			= 30000,
	model		= "models/objects/jump_gates/big_jumpgate/pc_jumpgate",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },

	children_usable = 	{
		{ def = "KiberJumpgateFx", joint = "ring" },
	},
	
	children_unusable = 
	{
	},
}

Def.KiberJumpgateFx =
{
	class			= "ScBaseEntity",
	network_sync 	= false,
	model			= "models/objects/jump_gates/big_jumpgate/pc_jumpgate_affect",
}

-- ракета voiddamage Predator
Def.xSpaceMissile_Predator =
{
	inherit				= "SpaceMissile_Standart_T1_Mk3",
	in_editor			= false,
	time_to_live		= 12,
	speed				= 55,
	max_range			= 550,
	angular_velocity	= 55,
	--flare_size			= 200,
	--flare_occl_size		= 10,
	--flare_aspect		= 10,
	--flare_warp			= 1.0,
	storeItemId			= 0,
		--flare_angle = 180,
		flare_color = "0 150 130 100",
		flare_size = 2, -- 1
		flare_nebulosity = 0.7,
	effect 				= "PrecRocketSmall",
	spell				= "VoidZone_Raid_Pve",
	explosion_blast_wave= "xBlastWave_Predator",
	launch_sound 		= "sound/raid/boss_rocket_start",
	work_sound			= "sound/raid/boss_rocket_fly",
	uiName  			= "AlienRocket"
}

Def.xBlastWave_Predator =
{
	inherit 			= "BlastWave_SM_Standart_T5_Mk3",
	effect 				= "particles/explosions/expl_2_alien", 
	damage_emp			= 15000,
	damage_kinetic		= 0,
	damage_thermal		= 0,
	
		light_color = "0 255 100 255",
		light_radius = 250,
		light_time = 1.0,
	sound = "sound/explosion/alien_expl",
}

Def.Weapon_AlienGun2_T4 =
{
	inherit				= "Weapon_AlienGun_T4",
	cycle_barrels 		= true,
	projectile			= "Projectile_AlienGun2",
	fire_rate			= 20,
	damage_emp			= 3500,		--- 4000
	projectile_speed	= 90,	

}

Def.Projectile_AlienGun2  =
{
	--inherit			= "Projectile_Plasma_Default",
	inherit			= "Weapon_BaseRocket",
	explosion_blast_wave 	= "Blastwave_AlienGun",
	override_blast_wave_damage = true,
	model = "",
	detonation_radius		= 3,
	
		flare_color = "0 150 130 100",
		flare_size = 2, -- 1
		flare_nebulosity = 0.7,
		launch_sound 		= "sound/raid/boss_rocket_start",
		work_sound			= "sound/raid/boss_rocket_fly",
	--missile_defence_immune 	= true,	
	missile_detection_immune = true,

	effect 			= "particles/weapons/alien/alien_gun_projectile", 
	--shadowCaster	= false,
	--impact_type 	= "plasma",
	is_guided		= true,
	angular_velocity= 30,
}

Def.Projectile_AlienGun_OW =
{
	--inherit			= "Projectile_Plasma_Default",
	inherit			= "Weapon_BaseRocket",
	explosion_blast_wave 	= "Blastwave_AlienGun",
	override_blast_wave_damage = true,
	detonation_radius		= 2,
	
	flare_color = "0 150 130 100",
	flare_size = 1, -- 1
	flare_nebulosity = 0.3,
	launch_sound 		= "sound/raid/boss_rocket_start",
	work_sound			= "sound/raid/boss_rocket_fly",
	
	missile_detection_immune = true,

	effect 			= "particles/weapons/alien/alien_gun_projectile", 
	is_guided		= false,
	angular_velocity= 30,
}

-- тестовый объект
Def.OW_TransportParking =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/objects/ships_huge/freighter_imper/freighter_imper",
	physics		= { solid_type = solid.compound_model, static = true, material = "ShipMetalMk3" },
}

Def.OW_ParkingStation = 
{
	class 			= "ScBaseEntity",
	model			= "mapskit/maps/models/imper_station/heal_station/heal_station", 
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist		= 3000,
	hudType			= "default",
}

Def.OpenWorld_GeneratorSphere = 
{
	class 			= "ScBaseEntity",
	model			= "models/ships/race_2/l/r2_l_t5_eng1_precursor", 
	--physics			= { solid_type = solid.model, static = true, material = "Metal" },
	hudType			= "default",
}

Def.Logic_AlienJumpGate =
{
	inherit = "Logic_JumpDockLocation",
	uiName  			= "AlienRocket",
}

Def.OpenWorld_QuestFederation_pz2d = 
{
	inherit			= "OpenWorld_QuestEmpire_s2d",
	model			= "mapskit/maps/models/precursors/pc_animated_core", 
	uiName			= "OpenWorld_QuestFederation_sh2d",
	required_item	= "ow_QuestFederation_pz2d",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	children 		= 	{{ effect ="particles/areal/huge_stuff/precursors_core", joint = "root" },},
	interaction_distance	= 180,
}

Def.Logic_AlienJumpGateLocation =
{
	inherit = "Logic_JumpDockLocation",
	model_def = "OW_KiberVitalPoint",
}

Def.OpenWorld_ClanshipAvanpost =
{
	class					= "BaseEntity",
	relationship_group		= ai.RelationshipGroups.Neutral4,
	in_editor				= true,
	damageable				= false,
	maxViewDist				= 5000,
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model					= "models/objects/vital_point/blockpost/fed_blockpost_01",
	uiName = "OpenWorld_ClanshipAvanpost",	--83499
	
	children = 
	{
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_1" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_2" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_3" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_4" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_5" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_6" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_7" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_8" },
		{ effect = "particles/objects/avanpost", joint = "light_1" },
		{ effect = "particles/objects/avanpost", joint = "light_2" },
		{ effect = "particles/objects/avanpost", joint = "light_3" },
		{ effect = "particles/objects/avanpost", joint = "light_4" },
	}
}

Def.OpenWorld_ClanshipRocketTurret = 
{
	inherit				= "Turret_RocketGun",
	relationship_group	= ai.RelationshipGroups.Neutral4,
	health 				= 25000,
	projectile			= "SpaceMissile_AAMu_T4_PoliceOpenWorld",
	hud_visibility_type	= "minor",
	karma_reward_kill	= 0,	
	
	fire_rate			= 30.0,
	dispersion			= 1.0, -- deg
	max_range			= 210,
	max_rot_speed		= 30,	-- deg per second
	
	uiName				= "PoliceRocketTurret",
	model				= "models/turret/rocket_launcher/rocket_launcher",
}

Def.OpenWorld_ClanshipAvanpostSmall =
{
	class				= "BaseEntity",
	relationship_group	= ai.RelationshipGroups.Neutral4,
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/vital_point/blockpost/fed_blockpost_mini",
	uiName = "OpenWorld_ClanshipAvanpostSmall",	--83499
	
	children = 
	{
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_1" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_2" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_3" },
		{ def = "OpenWorld_ClanshipRocketTurret", joint = "gun_4" },
		{ effect = "particles/objects/avanpost_small", joint = "light_1" },
		{ effect = "particles/objects/avanpost_small", joint = "light_2" },
		{ effect = "particles/objects/avanpost_small", joint = "light_3" },
		{ effect = "particles/objects/avanpost_small", joint = "light_4" },
	}
}

Def.OW_PoliceAvanpostSmall =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= false,
	--remove_on_death		= false,
	--respawn_time 		= 120.0,
	--health 				= 5000000,	-- пережить пролёт 1го осквернителя
	maxViewDist			= 5000,
	--signature = ai.Signature.HUGE,
	hudType				= "default",	
	hud_ico				= "jericho_avanpost_icon", -- так всё-таки нужны новые иконки?!!
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/vital_point/blockpost/fed_blockpost_mini",
	
	vision_always = true,
	relationship_group	= ai.RelationshipGroups.Police,
	death_sound     = "sound/raid/raid_avanpost_explosion",
	death_effect	= "particles/explosions/objects/fed_blockpost_mini_explosion",

	uiName				= "AvanpostLevi",

	--ping				= 1,
	
	--broken_parts = 
	--{
	--	{ def = "PoliceAvanpost_wreck",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 6.0, },
	--}, 
	
	children = 
	{
		{ def = "OW_RocketTurret", joint = "gun_1" },
		{ def = "OW_RocketTurret", joint = "gun_2" },
		{ def = "OW_RocketTurret", joint = "gun_3" },
		{ def = "OW_RocketTurret", joint = "gun_4" },
		{ effect = "particles/objects/avanpost_small", joint = "light_1" },
		{ effect = "particles/objects/avanpost_small", joint = "light_2" },
		{ effect = "particles/objects/avanpost_small", joint = "light_3" },
		{ effect = "particles/objects/avanpost_small", joint = "light_4" },
	}
}

Def.OW_RocketTurret = 
{
	inherit				= "Turret_RocketGun",
	relationship_group	= ai.RelationshipGroups.Police,
	health 				= 65000,
	---death_damage_to_parent = 1000000,
	--remove_on_death		= false,
	respawn_time	 	= 60,
	signature = ai.Signature.HUGE,
	projectile			= "SpaceMissile_AAMu_OW",
	hud_visibility_type	= "minor",
	karma_reward_kill	= 0,	
	
	fire_rate			= 20.0,
	dispersion			= 1.0, -- deg
	max_range			= 600,
	max_rot_speed		= 60,	-- deg per second
	
	uiName				= "PoliceRocketTurret",
	model				= "models/turret/rocket_launcher/rocket_launcher",
}

-- ракета для туррели полиции на блокпосте
Def.SpaceMissile_AAMu_OW =
{
	inherit				= "SpaceMissile_AAMu_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 55,
	max_range 			= 600,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_AAMu_OW",	
}

-- взрыв нурс для туррели полиции на блокпосте
Def.BlastWave_SM_AAMu_OW = 
{
	inherit				= "BlastWave_SM_AAMu_T1_Mk3",
	in_editor			= false,

	damage_kinetic		= 5000,	--20000 6000
	damage_thermal		= 0,
	blast_minDistance   = 1,
	blast_maxDistance	= 2,		--5
}

--- Перевалочные пункты для Левиафана, но можно будет юзать повсеместно
Def.OW_Cargopost1 =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	--hudType				= "default",	
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/gameplay/global_world/station/station_01",

	vision_always = true,
	relationship_group	= ai.RelationshipGroups.Neutral4,
}

Def.OW_Cargopost2 =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	--hudType				= "default",	
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/gameplay/global_world/station/station_02",

	vision_always = true,
	relationship_group	= ai.RelationshipGroups.Neutral4,
}

Def.OpenWorld_CargoshipLevi = 
{
	inherit = "OpenWorld_CargoshipBase",
	uiName = "TransportLevi",
	health = 100000,

	max_lin_speed	= 3,
	max_rot_speed	= 3,	-- deg per second
	
}

--станция слежения ruinssmall_emp_lava_expedition_r_ow
Def.OpenWorld_Quest_PvPObjects_StCon_rele = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConrelekey",
}

--маяк ruinssmall_emp_lava_expedition_r_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rele = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrelekey",
}

--станция слежения anomalyhot_wild_lava_pandora_l_ow
Def.OpenWorld_Quest_PvPObjects_StCon_awlp = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConawlpkey",
}

--маяк anomalyhot_wild_lava_pandora_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_awlp = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconawlpkey",
}

--станция слежения ruinsalien_precursor_stone_devilsjaw_l_ow
Def.OpenWorld_Quest_PvPObjects_StCon_rpsd = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConrpsdkey",
}

--маяк ruinsalien_precursor_stone_devilsjaw_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rpsd = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrpsdkey",
}

--маяк hub_emp_rock_northstar_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_hern = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconhernkey",
}

--станция слежения ruinsalien_precursor_ice_platform_r_ow
Def.OpenWorld_Quest_PvPObjects_StCon_rpip = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConrpipkey",
}

--маяк ruinsalien_precursor_ice_platform_r_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rpip = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConrpipkey",
}

--станция слежения factory_emp_iridium_alpha_l_ow
Def.OpenWorld_Quest_PvPObjects_StCon_feia = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConfeiakey",
}

--маяк factory_emp_iridium_alpha_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_feia = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconfeiakey",
}

--маяк hub_emp_rock_avanpost_e_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_hera = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconherakey",
}

--станция слежения ruinsalien_precursor_lava_platform02_r_ow
Def.OpenWorld_Quest_PvPObjects_StCon_rplp = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConrplpkey",
}

--маяк ruinsalien_precursor_lava_platform02_r_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rplp = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrplpkey",
}

--станция слежения miners_fed_rock_01_l_ow
Def.OpenWorld_Quest_PvPObjects_StCon_mfr = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConmfrkey",
}

--маяк miners_fed_rock_01_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_mfr = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconmfrkey",
}

--станция слежения mininghub_fed_rock_01_l_ow
Def.OpenWorld_Quest_PvPObjects_StCon_mhfr = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConmhfrkey",
}

--маяк mininghub_fed_rock_01_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_mhfr = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconmhfrkey",
}

--станция слежения ruinsalien_precursor_iridium_spheres_l_ow
Def.OpenWorld_Quest_PvPObjects_StCon_rpis = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConrpiskey",
}

--маяк ruinsalien_precursor_iridium_spheres_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rpis = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrpiskey",
}

--станция слежения ruinsalien_precursor_rock_lavastone_l_ow
Def.OpenWorld_Quest_PvPObjects_StCon_rprl = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConrprlkey",
}

--маяк ruinsalien_precursor_rock_lavastone_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rprl = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrprlkey",
}

--станция слежения ruinsalien_precursor_rock_barrier_r_ow
Def.OpenWorld_Quest_PvPObjects_StCon_rprb = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConrprbkey",
}

--маяк ruinsalien_precursor_rock_barrier_r_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rprb = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrprbkey",
}

--станция слежения ruinsalien_precursor_rock_tower_r_ow
Def.OpenWorld_Quest_PvPObjects_StCon_rprt = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/control_tower/control_tower",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_StConrprtkey",
}

--маяк ruinsalien_precursor_rock_tower_r_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rprt = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrprtkey",
}

--маяк ruinsalien_precursor_empty_platform03_r_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rpep = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrpepkey",
}

--маяк ruinsbig_jer_empty_monolith_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rjem = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrjemkey",
}

--маяк ruinsalien_crystal_empty_temple_l_ow
Def.OpenWorld_Quest_PvPObjects_Beacon_rcet = 
{
	inherit						= "OpenWorld_QuestObject_Interact",
	model						= "models/objects/vital_point/beacon/beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	interacting_success_sound 	= "sound/game/openspace_quest/energy_station_activation",

	uiName						= "OpenWorld_Quest_Tut",
	
	required_item				= "ow_Loot_Beaconrcetkey",
}

--Плазмаган алиенов для Биоморфов
Def.Weapon_ReaverGun_Ref_C = 
{
	inherit						= "Weapon_ReaverGun_T4",
	fire_rate					= 60,
	damage_emp					= 200,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
}

Def.Weapon_ReaverGun_Ref_C_T1 = 
{
	inherit						= "Weapon_ReaverGun_Ref_C",
	fire_rate					= 60,
	damage_emp					= 60,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
}

Def.Weapon_ReaverGun_Ref_C_T2 = 
{
	inherit						= "Weapon_ReaverGun_Ref_C",
	fire_rate					= 60,
	damage_emp					= 100,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
}

Def.Weapon_ReaverGun_Ref_C_T3 = 
{
	inherit						= "Weapon_ReaverGun_Ref_C",
	fire_rate					= 60,
	damage_emp					= 150,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
}

Def.Weapon_ReaverGun_Ref_C_T4 = 
{
	inherit						= "Weapon_ReaverGun_Ref_C",
	fire_rate					= 60,
	damage_emp					= 200,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
}

Def.Weapon_ReaverGun_Ref_C_T5 = 
{
	inherit						= "Weapon_ReaverGun_Ref_C",
	fire_rate					= 60,
	damage_emp					= 270,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
}

Def.Weapon_ReaverGun_Ref_RoP2025 = 
{
	inherit						= "Weapon_ReaverGun_Ref_C",
	fire_rate					= 120,
	projectile_speed	= 850,
	optimal_range = 450,
    max_range = 450,
	damage_emp					= 320,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
}

-- Плазмаган алиенов для разведчиков
Def.Weapon_ScoutGun_C =
{
	inherit						= "Weapon_ScoutGun",
	damage_emp		 			= 250,
	fire_rate					= 50,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
}

Def.Weapon_ScoutGun_C_T1 =
{
	inherit						= "Weapon_ScoutGun_C",
	damage_emp		 			= 110,
	fire_rate					= 50,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
}

Def.Weapon_ScoutGun_C_T2 =
{
	inherit						= "Weapon_ScoutGun_C",
	damage_emp		 			= 160,
	fire_rate					= 50,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
}

Def.Weapon_ScoutGun_C_T3 =
{
	inherit						= "Weapon_ScoutGun_C",
	damage_emp		 			= 200,
	fire_rate					= 50,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
}

Def.Weapon_ScoutGun_C_T4 =
{
	inherit						= "Weapon_ScoutGun_C",
	damage_emp		 			= 250,
	fire_rate					= 50,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
}

Def.Weapon_ScoutGun_C_T5 =
{
	inherit						= "Weapon_ScoutGun_C",
	damage_emp		 			= 300,
	fire_rate					= 50,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
}

--Сингулярка охотников
Def.Weapon_AlienGun_Ref_C =
{
	inherit						= "Weapon_AlienGun_T4",
	damage_emp		 			= 700,
	fire_rate					= 30,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
}

Def.Weapon_AlienGun_Ref_C_T1 =
{
	inherit						= "Weapon_AlienGun_Ref_C",
	damage_emp		 			= 100,
	fire_rate					= 30,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_emp					= 1500,
}

Def.Weapon_AlienGun_Ref_C_T2 =
{
	inherit						= "Weapon_AlienGun_Ref_C",
	damage_emp		 			= 200,
	fire_rate					= 30,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_emp					= 2000,
}

Def.Weapon_AlienGun_Ref_C_T3 =
{
	inherit						= "Weapon_AlienGun_Ref_C",
	damage_emp		 			= 300,
	fire_rate					= 30,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_emp					= 2600,
}

Def.Weapon_AlienGun_Ref_C_T4 =
{
	inherit						= "Weapon_AlienGun_Ref_C",
	damage_emp		 			= 350,
	fire_rate					= 30,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	damage_emp					= 3000,
}

Def.Weapon_AlienGun_Ref_C_T5 =
{
	inherit						= "Weapon_AlienGun_Ref_C",
	damage_emp		 			= 400,
	fire_rate					= 30,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_emp					= 3500,
}

-- Сингулярка хищников
Def.Weapon_AlienGun2_Ref_C =
{
	inherit						= "Weapon_AlienGun2_T4",
	damage_emp					= 1000,
	fire_rate					= 20,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
}

Def.Weapon_AlienGun2_Ref_C_T1 =
{
	inherit						= "Weapon_AlienGun2_Ref_C",
	fire_rate					= 20,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_emp					= 250,
}

Def.Weapon_AlienGun2_Ref_C_T2 =
{
	inherit						= "Weapon_AlienGun2_Ref_C",
	fire_rate					= 20,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_emp					= 400,
}

Def.Weapon_AlienGun2_Ref_C_T3 =
{
	inherit						= "Weapon_AlienGun2_Ref_C",
	fire_rate					= 20,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_emp					= 500,
}

Def.Weapon_AlienGun2_Ref_C_T4 =
{
	inherit						= "Weapon_AlienGun2_Ref_C",
	fire_rate					= 20,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	damage_emp					= 550,
}

Def.Weapon_AlienGun2_Ref_C_T5 =
{
	inherit						= "Weapon_AlienGun2_Ref_C",
	fire_rate					= 20,
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_emp					= 600,
}

-- Штурмовой рейлган пиратов, полиции, наемников
Def.Weapon_Railgun_Basic_Ref_C = 
{
	inherit						= "Weapon_Railgun_Basic_T3_Mk1",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	fire_rate					= Def.Weapon_Railgun_Basic_T3_Mk1.fire_rate*0.8,
	optimal_range				= Def.Weapon_Railgun_Basic_T3_Mk1.optimal_range*0.5,
	dispersion					= Def.Weapon_Railgun_Basic_T3_Mk1.dispersion*30,
}

Def.Weapon_Railgun_Basic_Ref_C_T1 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_kinetic				= 10,
}

Def.Weapon_Railgun_Basic_Ref_C_T2 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_kinetic				= 20,
}

Def.Weapon_Railgun_Basic_Ref_C_T3 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_kinetic				= 30,
}

Def.Weapon_Railgun_Basic_Ref_C_T4 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	rank_min					= 10,
	rank_max					= 14,
	damage_kinetic				= 40,
}

Def.Weapon_Railgun_Basic_Ref_C_T5 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_kinetic				= 60,
}

--Штурмовой рейлган полиции
Def.Weapon_Railgun_Basic_Ref_Police_C = 
{
	inherit						= "Weapon_Railgun_Basic_T3_Mk1",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	fire_rate					= Def.Weapon_Railgun_Basic_T3_Mk1.fire_rate*0.8,
	optimal_range				= Def.Weapon_Railgun_Basic_T3_Mk1.optimal_range*0.5,
	dispersion					= Def.Weapon_Railgun_Basic_T3_Mk1.dispersion*30,
}

Def.Weapon_Railgun_Basic_Ref_Police_C_T1 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_Police_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_kinetic				= 40,
}

Def.Weapon_Railgun_Basic_Ref_Police_C_T2 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_Police_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_kinetic				= 50,
}

Def.Weapon_Railgun_Basic_Ref_Police_C_T3 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_Police_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_kinetic				= 53,
}

Def.Weapon_Railgun_Basic_Ref_Police_C_T4 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_Police_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	rank_min					= 10,
	rank_max					= 14,
	damage_kinetic				= 56,
}

Def.Weapon_Railgun_Basic_Ref_Police_C_T5 = 
{
	inherit						= "Weapon_Railgun_Basic_Ref_Police_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_kinetic				= 40,
}

Def.Weapon_PirateRail_Ref_C = 
{
	inherit						= "Weapon_PirateRail_T4_Mk1",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	fire_rate					= Def.Weapon_PirateRail_T4_Mk1.fire_rate*0.8,
	optimal_range				= Def.Weapon_PirateRail_T4_Mk1.optimal_range*0.5,
	dispersion					= Def.Weapon_PirateRail_T4_Mk1.dispersion*30,
}

Def.Weapon_PirateRail_Ref_C_T1 = 
{
	inherit						= "Weapon_PirateRail_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_kinetic				= 26,
}

Def.Weapon_PirateRail_Ref_C_T2 = 
{
	inherit						= "Weapon_PirateRail_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_kinetic				= 33,
}

Def.Weapon_PirateRail_Ref_C_T3 = 
{
	inherit						= "Weapon_PirateRail_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_kinetic				= 36,
}

Def.Weapon_PirateRail_Ref_C_T4 = 
{
	inherit						= "Weapon_PirateRail_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	damage_kinetic				= 40,
}

Def.Weapon_PirateRail_Ref_C_T5 = 
{
	inherit						= "Weapon_PirateRail_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_kinetic				= 43,
}

Def.Weapon_Railgun_Autofire_Ref_C = 
{
	inherit						= "Weapon_Railgun_Autofire_T3_Mk1",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	fire_rate					= Def.Weapon_Railgun_Autofire_T3_Mk1.fire_rate*0.8,
	optimal_range				= Def.Weapon_Railgun_Autofire_T3_Mk1.optimal_range*0.5,
	dispersion					= Def.Weapon_Railgun_Autofire_T3_Mk1.dispersion*30,
}

Def.Weapon_Railgun_Autofire_Ref_C_T1 = 
{
	inherit						= "Weapon_Railgun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_kinetic				= 176,
}

Def.Weapon_Railgun_Autofire_Ref_C_T2 = 
{
	inherit						= "Weapon_Railgun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_kinetic				= 200,
}

Def.Weapon_Railgun_Autofire_Ref_C_T3 = 
{
	inherit						= "Weapon_Railgun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_kinetic				= 217,
}

Def.Weapon_Railgun_Autofire_Ref_C_T4 = 
{
	inherit						= "Weapon_Railgun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	damage_kinetic				= 230,
}

Def.Weapon_Railgun_Autofire_Ref_C_T5 = 
{
	inherit						= "Weapon_Railgun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_kinetic				= 240,
}

Def.Weapon_Plasmagun_Autofire_Ref_C = 
{
	inherit						= "Weapon_Plasmagun_Autofire_T3_Mk1",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	fire_rate					= Def.Weapon_Plasmagun_Autofire_T3_Mk1.fire_rate*0.8,
	optimal_range				= Def.Weapon_Plasmagun_Autofire_T3_Mk1.optimal_range*0.5,
	dispersion					= Def.Weapon_Plasmagun_Autofire_T3_Mk1.dispersion*30,
}

Def.Weapon_Plasmagun_Autofire_Ref_C_T1 = 
{
	inherit						= "Weapon_Plasmagun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_emp					= 45,
}

Def.Weapon_Plasmagun_Autofire_Ref_C_T2 = 
{
	inherit						= "Weapon_Plasmagun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_emp					= 55,
}

Def.Weapon_Plasmagun_Autofire_Ref_C_T3 = 
{
	inherit						= "Weapon_Plasmagun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_emp					= 60,
}

Def.Weapon_Plasmagun_Autofire_Ref_C_T4 = 
{
	inherit						= "Weapon_Plasmagun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	damage_emp					= 64,
}

Def.Weapon_Plasmagun_Autofire_Ref_C_T5 = 
{
	inherit						= "Weapon_Plasmagun_Autofire_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_emp					= 66,
}

Def.Weapon_PlasmaBlade_Ref_C = 
{
	inherit						= "Weapon_PlasmaBlade_T3_Mk1",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	fire_rate					= Def.Weapon_PlasmaBlade_T3_Mk1.fire_rate*0.8,
	optimal_range				= Def.Weapon_PlasmaBlade_T3_Mk1.optimal_range*0.5,
	dispersion					= Def.Weapon_PlasmaBlade_T3_Mk1.dispersion*30,
	projectile					= "Projectile_PlasmaBlade_C",
}

Def.Weapon_PlasmaBlade_Ref_C_T1 = 
{
	inherit						= "Weapon_PlasmaBlade_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_emp					= 300,
}

Def.Weapon_PlasmaBlade_Ref_C_T2 = 
{
	inherit						= "Weapon_PlasmaBlade_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_emp					= 340,
}

Def.Weapon_PlasmaBlade_Ref_C_T3 = 
{
	inherit						= "Weapon_PlasmaBlade_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_emp					= 365,
}

Def.Weapon_PlasmaBlade_Ref_C_T4 = 
{
	inherit						= "Weapon_PlasmaBlade_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	damage_emp					= 387,
}

Def.Weapon_PlasmaBlade_Ref_C_T5 = 
{
	inherit						= "Weapon_PlasmaBlade_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_emp					= 402,
}

Def.Weapon_Railgun_Sniper_Ref_C = 
{
	inherit						= "Weapon_Railgun_Sniper_T3_Mk1",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	fire_rate					= Def.Weapon_Railgun_Sniper_T3_Mk1.fire_rate*0.8,
	optimal_range				= Def.Weapon_Railgun_Sniper_T3_Mk1.optimal_range*0.5,
	dispersion					= Def.Weapon_Railgun_Sniper_T3_Mk1.dispersion*30,
}

Def.Weapon_Railgun_Sniper_Ref_C_T1 = 
{
	inherit						= "Weapon_Railgun_Sniper_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_kinetic				= 65,
}

Def.Weapon_Railgun_Sniper_Ref_C_T2 = 
{
	inherit						= "Weapon_Railgun_Sniper_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_kinetic				= 74,
}

Def.Weapon_Railgun_Sniper_Ref_C_T3 = 
{
	inherit						= "Weapon_Railgun_Sniper_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_kinetic				= 80,
}

Def.Weapon_Railgun_Sniper_Ref_C_T4 = 
{
	inherit						= "Weapon_Railgun_Sniper_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	damage_kinetic				= 85,
}

Def.Weapon_Railgun_Sniper_Ref_C_T5 = 
{
	inherit						= "Weapon_Railgun_Sniper_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_kinetic				= 88,
}

Def.Weapon_Plasmagun_Heavy_Ref_C = 
{
	inherit						= "Weapon_Plasmagun_Heavy_T3_Mk1",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	fire_rate					= Def.Weapon_Plasmagun_Heavy_T3_Mk1.fire_rate*0.8,
	optimal_range				= Def.Weapon_Plasmagun_Heavy_T3_Mk1.optimal_range*0.5,
	dispersion					= Def.Weapon_Plasmagun_Heavy_T3_Mk1.dispersion*30,
}

Def.Weapon_Plasmagun_Heavy_Ref_C_T1 = 
{
	inherit						= "Weapon_Plasmagun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_emp					= 161,
}

Def.Weapon_Plasmagun_Heavy_Ref_C_T2 = 
{
	inherit						= "Weapon_Plasmagun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_emp					= 183,
}

Def.Weapon_Plasmagun_Heavy_Ref_C_T3 = 
{
	inherit						= "Weapon_Plasmagun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_emp					= 199,
}

Def.Weapon_Plasmagun_Heavy_Ref_C_T4 = 
{
	inherit						= "Weapon_Plasmagun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	damage_emp					= 211,
}

Def.Weapon_Plasmagun_Heavy_Ref_C_T5 = 
{
	inherit						= "Weapon_Plasmagun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_emp					= 219,
}

Def.Weapon_Railgun_Heavy_Ref_C = 
{
	inherit						= "Weapon_Railgun_Heavy_T1_Mk1",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	fire_rate					= Def.Weapon_Railgun_Heavy_T1_Mk1.fire_rate*0.8,
	optimal_range				= Def.Weapon_Railgun_Heavy_T1_Mk1.optimal_range*0.5,
	dispersion					= Def.Weapon_Railgun_Heavy_T1_Mk1.dispersion*30,
}

Def.Weapon_Railgun_Heavy_Ref_C_T1 = 
{
	inherit						= "Weapon_Railgun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 1,
	rank						= 3,
	rank_min					= 1,
	rank_max					= 5,
	damage_kinetic				= 250,
}

Def.Weapon_Railgun_Heavy_Ref_C_T2 = 
{
	inherit						= "Weapon_Railgun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 2,
	rank						= 6,
	rank_min					= 4,
	rank_max					= 8,
	damage_kinetic				= 294,
}

Def.Weapon_Railgun_Heavy_Ref_C_T3 = 
{
	inherit						= "Weapon_Railgun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 3,
	rank						= 9,
	rank_min					= 7,
	rank_max					= 11,
	damage_kinetic				= 320,
}

Def.Weapon_Railgun_Heavy_Ref_C_T4 = 
{
	inherit						= "Weapon_Railgun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 4,
	rank						= 12,
	rank_min					= 10,
	rank_max					= 14,
	damage_kinetic				= 339,
}

Def.Weapon_Railgun_Heavy_Ref_C_T5 = 
{
	inherit						= "Weapon_Railgun_Heavy_Ref_C",
	storeItemId					= 0,
	cant_be_bought  			= true,
	drop_weight					= 0,
	tier						= 5,
	rank						= 15,
	rank_min					= 13,
	rank_max					= 17,
	damage_kinetic				= 352,
}

--
Def.OpenWorld_QuestEllidium_hcil = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "mapskit/maps/models/precursors/pc_mayak",
	children 		= {{ effect ="particles/gadget/alien_beacon_core", joint = "fx9" },},
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	--interacting_success_sound = "sound/game/openspace_quest/energy_station_activation",

	uiName			= "OpenWorld_QuestEllidium_hcil",
	required_item	= "ow_QuestEllidium_hcil_key",

}

Def.OpenWorld_QuestLootEllidium_hcil = 
{
	inherit			= "OpenWorld_QuestObject_Loot",

	model			= "models/objects/gameplay/loot_prec/loot_prec",
	
	physics			= { solid_type = solid.model, static = true, material = "Rock"},

	uiName			= "ow_QuestLootEllidium_hcil",	-- дабы как буд-то подбиралось в трюм тоже самое
	required_item	= "ow_QuestLootEllidium_hcilkey",
	loot_item		= "ow_QuestLootEllidium_hcil",
}

Def.OpenWorld_Alien_Invertor_Core =
{
	class 			= "AnimatedEntity",
	in_editor		= true,
	damageable		= false,
	vision_always 	= true,
	maxViewDist		= 50000,
	model			= "mapskit/maps/models/precursors/pc_animated_core_small",
	children 		= {{ effect ="particles/objects/alien_invertor_core", joint = "root" },},
	physics			= { solid_type = solid.model, static = true, material = "Rock" },
}

Def.OpenWorld_PortalCampaignQuest =
{
	inherit				= "OpenWorld_QuestObject_Interact",
	in_editor			= false,
	model				= "models/shields/portal",
	damageable			= false,
	maxViewDist			= 5000,
	work_sound 			= "sound/ambient/alien_portal_loop",
	open_effect 		= "particles/objects/portal_open",
	close_effect		= "particles/objects/portal_close",

	full_activate_effect = "particles/other/wave_portal_open_big",

	children = 
	{
		{ effect = "particles/objects/portal", joint = "root" },
	},
	
	required_item				= "ow_PortalCampaignQuestAkey",
}

Def.OpenWorld_PortalCampaignQuest_a =
{
	inherit				= "OpenWorld_PortalCampaignQuest",
	in_editor			= true,
	
	required_item		= "ow_PortalCampaignQuestAkey",
	uiName				= "OpenWorld_PortalCampaignQuest",
}

Def.OpenWorld_PortalCampaignQuest_b =
{
	inherit				= "OpenWorld_PortalCampaignQuest",
	in_editor			= true,
	
	required_item		= "ow_PortalCampaignQuestBkey",
	uiName				= "OpenWorld_PortalCampaignQuest",
}

Def.OpenWorld_PortalCampaignQuest_c =
{
	inherit				= "OpenWorld_PortalCampaignQuest",
	in_editor			= true,
	
	required_item		= "ow_PortalCampaignQuestCkey",
	uiName				= "OpenWorld_PortalCampaignQuest",
}

Def.OpenWorld_PortalCampaignQuest_d =
{
	inherit				= "OpenWorld_PortalCampaignQuest",
	in_editor			= true,
	
	required_item		= "ow_PortalCampaignQuestDkey",
}

Def.OpenWorld_PortalCampaignQuest_e =
{
	inherit				= "OpenWorld_PortalCampaignQuest",
	in_editor			= true,
	
	required_item		= "ow_PortalCampaignQuestEkey",
}
--------------------------------------------------
--  OW 3 by Nukem
--------------------------------------------------
-- шпионская камера пиратов
Def.OW_PiratesSpyDrone =
{
	class 				= "ScBaseEntity",
	damageable			= true,
	maxViewDist			= 4500,
	health 				= 1000,
	hack_immune			= true,	
	--special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",	
	relationship_group 	= 2,
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4, },
	death_effect		= "particles/explosions/big_fire_2",
	death_sound			= "sound/explosion/drone_expl",
	uiName 				= "ow_PiratesSpyDrone",
}
-- Забытый зонд
Def.OW_LostProbe =
{
	class 				= "ScBaseEntity",
	damageable			= true,
	maxViewDist			= 4500,
	health 				= 1000,
	hack_immune			= true,	
	--special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",	
	relationship_group 	= 2,
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4, },
	death_effect		= "particles/explosions/big_fire_2",
	death_sound			= "sound/explosion/drone_expl",
	uiName 				= "ow_LostProbe", 
}
-- Астероиды
Def.OW_Asteroid_Mining_Good =  
{	
	class 				= "DestroyableAsteroid", -- чтобы корректно отправлять сообщения клиенту и считать бонус майнинга надо так.
	
	damageable			= true,
	maxViewDist			= 1500,
	health 				= 3000000,
	hack_immune			= true,	
	no_target 			= true,
	
	scannerDist			= 550, -- SC-111196
	
	in_editor			= false,
	physics		=	{ solid_type = solid.model, material = 'Rock', static = true, },	
	uiName	 	=	"OW_Asteroid_Mining_Good",

	model				= "mapskit/maps/models/asteroids_rocks/mining_rocks/rich/rich",
	uiName	 	=	"OW_Asteroid_Mining_Good",

	heat_add	= 0.00016, 	-- сколько единиц тепла добавляется на за единицу урона.
	heat_sub	= 0.18,		-- сколько единиц тепла отбирается за секунду.

	base_damage				= 2000.0, --распространненный урон относительные ед-цы для damage_function 
	attempts_amount			= 5, --кол во попыток с heat_start_temperature	при опускании до 0
	heat_start_temperature	= 0.5,
	heat_max_time 			= 15, --сколко времени нагревать чтобы разбился начиная с heat_start_temperature	

	overheat_temperature	= 0.90, --температура перегрева
	overheat_max_time		= 3.5, --макс время во время перегрева (не сбрасывается, пока нуля не достигнет)
	overheat_time_coef_ttl 	= 1,

	temperature_max_speed = 10, --может различаться в сингле и клиенте (надо туториал менять?)
	temperature_acceleration = 1,

	glow_function = {
		{ x = 0, 	y = 0,	 },
		{ x = 0.5, 	y = 0.1,},
		{ x = 0.7, 	y = 0.4, },
		{ x = 0.8, 	y = 0.5, },
		{ x = 0.9,  y = 0.8, },
		{ x = 0.95,  y = 0.9,},
		{ x = 1.0, 	y = 1.0, },
	}, -- есть какой то цвар для изменения

	-- x - мгновенный урон в долях от базового
	damage_function = {
		{ x = 0, 	y = 0,	},
		{ x = 0.1, 	y = 0.2,},
		{ x = 0.5, 	y = 0.8,},
		{ x = 0.9, 	y = 1.0,},
		{ x = 1.0, 	y = 1.0,},
		{ x = 2.0,  y = 0.9,},
		{ x = 6.0,  y = 0.6,},
	},

	death_effect		= "particles/explosions/big_fire_2",
	death_sound			= "sound/explosion/drone_expl",

	broken_parts = 
	{
		{ def = "OW_RichShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter2",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter1",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter2",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter1",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter2",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter2",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter1",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter2",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_RichShatter1",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},

	spell_on_death_overheat = "AsteroidExplosion",

	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= { "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreRich", 	"LootCrate_OW3_OreRich", "LootCrate_OW3_OreNormal", },--PERFEСT "LootCrate_OW2_MoleShipPart",
		[0.83] 	= {"LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreRich", 	"LootCrate_OW3_OreNormal", },	--G00D  "LootCrate_OW2_MoleShipPart",
		[0.75] 	= { "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreNormal","LootCrate_OW3_OrePoor", },		--NORMA1	
		[0.60] 	= { "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OrePoor", },	--P00R	
		[0.0] 	= { "LootCrate_OW3_OreUltraRich", }, 	--TERRIB1E
	},
	
	asteroid_premium_loot_crate = { -- лут выпадающий при ауре на доп добычу с астероидов
		[0.88] 	= { "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreRich", 	"LootCrate_OW3_OreRich", "LootCrate_OW3_OreNormal",  },--PERFEСT "LootCrate_OW2_MoleShipPart", 
		[0.83] 	= {"LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreRich", 	"LootCrate_OW3_OreNormal", },	--G00D  "LootCrate_OW2_MoleShipPart",
		[0.75] 	= { "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreNormal","LootCrate_OW3_OrePoor", },		--NORMA1	
		[0.60] 	= { "LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OrePoor", },	--P00R	
		[0.0] 	= { "LootCrate_OW3_OreUltraRich", }, 	--TERRIB1E
	},
	
	hudType					= "default",
	hud_visibility_type 	= "major", --"minor",
	hide_hp_bar				= true,
	hide_damage_records		= true,
	
	hud_ico					= "hud_asteroid_icon",
}

Def.OW_Asteroid_Mining_Common =
{
	inherit 	= "OW_Asteroid_Mining_Good",
	--physics		=	{ solid_type = solid.model, material = 'Rock', mass = 1000, damping = 0.4, rot_damping = 0.4, },
	model		=	"mapskit/maps/models/asteroids_rocks/asteroid_rock01",
	uiName	 	=	"OW_Asteroid_Mining_Common",
	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW3_OreUltraRich",	"LootCrate_OW3_OreUltraRich",	"LootCrate_OW3_OreRich",	"LootCrate_OW3_OreNormal", 	"LootCrate_OW3_OreNormal",  }, --"LootCrate_OW2_MoleShipPartNormal",
		[0.83] 	= {"LootCrate_OW3_OreUltraRich",	"LootCrate_OW3_OreRich",	"LootCrate_OW3_OreNormal", "LootCrate_OW3_OreNormal",  }, --"LootCrate_OW2_MoleShipPartNormal",
		[0.75]	= { "LootCrate_OW3_OreNormal", 		"LootCrate_OW3_OreNormal", 	"LootCrate_OW3_OreNormal", }, 
		[0.60]	= { "LootCrate_OW3_OreNormal", 		"LootCrate_OW3_OrePoor", }, 
		[0.0]	= { "LootCrate_OW3_OrePoor", },
	},
	
	asteroid_premium_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW3_OreUltraRich",	"LootCrate_OW3_OreUltraRich",	"LootCrate_OW3_OreRich",	"LootCrate_OW3_OreNormal", 	"LootCrate_OW3_OreNormal", }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.83] 	= {"LootCrate_OW3_OreUltraRich",	"LootCrate_OW3_OreRich",	"LootCrate_OW3_OreNormal", "LootCrate_OW3_OreNormal", }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.75]	= { "LootCrate_OW3_OreNormal", 		"LootCrate_OW3_OreNormal", 	"LootCrate_OW3_OreNormal", }, 
		[0.60]	= { "LootCrate_OW3_OreNormal", 		"LootCrate_OW3_OrePoor", }, 
		[0.0]	= { "LootCrate_OW3_OrePoor", },
	},
	
	broken_parts = 
	{
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},
}
Def.OW_Asteroid_Mining_Gold =
{
	inherit 	= "OW_Asteroid_Mining_Good",
	model		=	"mapskit/maps/models/asteroids_rocks/mining_rocks/gold/gold",
	uiName	 	=	"OW_Asteroid_Mining_Good",
	
	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreUltraRich",  }, --"LootCrate_OW2_MoleShipPart",
		[0.83] 	= {"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_OreRich",  		"LootCrate_OW3_OreUltraRich",  }, -- "LootCrate_OW2_MoleShipPart",
		[0.75]	= { "LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_GoldNugget",  	"LootCrate_OW3_OreNormal",	}, 
		[0.60]	= { "LootCrate_OW3_GoldNugget",  	"LootCrate_OW3_OrePoor", 	}, 
		[0.0]	= { "LootCrate_OW3_GoldNugget",  	},
	},
	
	asteroid_premium_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreUltraRich",  }, --"LootCrate_OW2_MoleShipPart",
		[0.83] 	= {"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_OreRich",  		"LootCrate_OW3_OreUltraRich",  }, --"LootCrate_OW2_MoleShipPart",
		[0.75]	= { "LootCrate_OW3_GoldNugget", 	"LootCrate_OW3_GoldNugget",  	"LootCrate_OW3_OreNormal",	}, 
		[0.60]	= { "LootCrate_OW3_GoldNugget",  	"LootCrate_OW3_OrePoor", 	}, 
		[0.0]	= { "LootCrate_OW3_GoldNugget",  	},
	},
	
	broken_parts = 
	{
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GoldShatter1",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},
}
Def.OW_Asteroid_Mining_Poor =
{
	inherit 	= "OW_Asteroid_Mining_Good",
	--physics		=	{ solid_type = solid.model, material = 'Rock', mass = 1000, damping = 0.4, rot_damping = 0.4, },
	model		=	"mapskit/maps/models/asteroids_rocks/asteroid_rock01",
	uiName	 	=	"OW_Asteroid_Mining_Poor",
	
	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreNormal", "LootCrate_OW3_OreNormal", "LootCrate_OW3_OrePoor", "LootCrate_OW3_OrePoor",  }, -- "LootCrate_OW2_MoleShipPartPoor",
		[0.83] 	= {"LootCrate_OW3_OreRich", "LootCrate_OW3_OreNormal", "LootCrate_OW3_OrePoor", "LootCrate_OW3_OrePoor",  },	--G00D "LootCrate_OW2_MoleShipPartPoor",
		[0.75] 	= { "LootCrate_OW3_OreNormal",  "LootCrate_OW3_OreNormal", "LootCrate_OW3_OrePoor", },		--N0RMA1	
		[0.60]	= { "LootCrate_OW3_OreNormal", "LootCrate_OW3_OrePoor", },	--P00R	
		[0.0]	= { "LootCrate_OW3_OrePoor", }, 	--TERRIB1E
	},
	
	asteroid_premium_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW3_OreUltraRich", "LootCrate_OW3_OreNormal", "LootCrate_OW3_OreNormal", "LootCrate_OW3_OrePoor", "LootCrate_OW3_OrePoor",  }, -- "LootCrate_OW2_MoleShipPartPoor",
		[0.83] 	= {"LootCrate_OW3_OreRich", "LootCrate_OW3_OreNormal", "LootCrate_OW3_OrePoor", "LootCrate_OW3_OrePoor", },	--G00D --  "LootCrate_OW2_MoleShipPartPoor",
		[0.75] 	= { "LootCrate_OW3_OreNormal",  "LootCrate_OW3_OreNormal", "LootCrate_OW3_OrePoor", },		--N0RMA1	
		[0.60]	= { "LootCrate_OW3_OreNormal", "LootCrate_OW3_OrePoor", },	--P00R	
		[0.0]	= { "LootCrate_OW3_OrePoor", }, 	--TERRIB1E
	},
	
	broken_parts = 
	{
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},
}
Def.OW_Asteroid_Mining_Empire =
{
	inherit 	= "OW_Asteroid_Mining_Good",
	--physics		=	{ solid_type = solid.model, material = 'Rock', mass = 1000, damping = 0.4, rot_damping = 0.4, },
	--model		=	"mapskit/maps/models/asteroids_rocks/asteroid_rock01",
	model		=	"mapskit/maps/models/asteroids_rocks/mining_rocks/osmii/osmii",
	uiName	 	=	"OW_Asteroid_Mining_Empire",
	
	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= { "LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Common_TungstenOre",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.83] 	= { "LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Only_TungstenOre", "LootCrate_OW2_Ore_Common_TungstenOre",	"LootCrate_OW3_OreNormal",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.75]	= { "LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Common_TungstenOre", "LootCrate_OW3_OreNormal",}, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_TungstenOre", 	"LootCrate_OW3_OrePoor",}, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_TungstenOre", },
	},
	
	asteroid_premium_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Common_TungstenOre",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Only_TungstenOre", "LootCrate_OW2_Ore_Common_TungstenOre",	"LootCrate_OW3_OreNormal",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.75]	= { "LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Common_TungstenOre", "LootCrate_OW3_OreNormal",}, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_TungstenOre", 	"LootCrate_OW3_OrePoor",}, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_TungstenOre", },
	},
	
	broken_parts = 
	{
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},
}
Def.OW_Asteroid_Mining_EmpireRich =
{
	inherit 	= "OW_Asteroid_Mining_Good",
	physics		=	{ solid_type = solid.model, material = 'Rock', mass = 1000, damping = 0.4, rot_damping = 0.4, },
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/grafit/grafit",
	uiName	 	=	"OW_Asteroid_Mining_EmpireRich",
	
	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Only_TungstenOre",		"LootCrate_OW2_Ore_Only_TungstenOre",		"LootCrate_OW3_OreUltraRich",  }, -- "LootCrate_OW2_MoleShipPart",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_TungstenOre", "LootCrate_OW2_Ore_Only_TungstenOre",			"LootCrate_OW2_Ore_Common_TungstenOre",		"LootCrate_OW3_OreRich", }, --   "LootCrate_OW2_MoleShipPart",
		[0.75]	= { "LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Common_TungstenOre", 	"LootCrate_OW3_OreNormal",  }, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_TungstenOre",	"LootCrate_OW3_OrePoor", }, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_TungstenOre", },
	},
	
	asteroid_premium_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Only_TungstenOre",		"LootCrate_OW2_Ore_Only_TungstenOre",		"LootCrate_OW3_OreUltraRich",  }, -- "LootCrate_OW2_MoleShipPart",
		[0.83] 	= { "LootCrate_OW2_Ore_Only_TungstenOre", "LootCrate_OW2_Ore_Only_TungstenOre",			"LootCrate_OW2_Ore_Common_TungstenOre",		"LootCrate_OW3_OreRich",  },  -- "LootCrate_OW2_MoleShipPart",
		[0.75]	= { "LootCrate_OW2_Ore_Only_TungstenOre", 	"LootCrate_OW2_Ore_Common_TungstenOre", 	"LootCrate_OW3_OreNormal",  }, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_TungstenOre",	"LootCrate_OW3_OrePoor", }, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_TungstenOre", },
	},
	
	broken_parts = 
	{
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter2",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_GrafitShatter1",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},
}
Def.OW_Asteroid_Mining_Federation =
{
	inherit 	= "OW_Asteroid_Mining_Good",
	--physics		=	{ solid_type = solid.model, material = 'Rock', mass = 1000, damping = 0.4, rot_damping = 0.4, },
	--model		=	"mapskit/maps/models/asteroids_rocks/asteroid_rock01",
	model		=	"mapskit/maps/models/asteroids_rocks/mining_rocks/oskolok/oskolok",
	uiName	 	=	"OW_Asteroid_Mining_Federation",
	
	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= { "LootCrate_OW2_Ore_Only_CrystalShard",  "LootCrate_OW2_Ore_Only_CrystalShard", "LootCrate_OW2_Ore_Only_CrystalShard",	"LootCrate_OW2_Ore_Common_CrystalShard", 	"LootCrate_OW3_OreRich",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW2_Ore_Common_CrystalShard", "LootCrate_OW2_Ore_Common_CrystalShard",	"LootCrate_OW3_OreNormal",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.75]	= { "LootCrate_OW2_Ore_Common_CrystalShard","LootCrate_OW3_OrePoor",	"LootCrate_OW3_OrePoor", }, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_CrystalShard", "LootCrate_OW3_OrePoor", }, 
		[0.0]	= { "LootCrate_OW3_OrePoor", },
	},
	
	asteroid_premium_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_CrystalShard",  "LootCrate_OW2_Ore_Only_CrystalShard", "LootCrate_OW2_Ore_Only_CrystalShard",	"LootCrate_OW2_Ore_Common_CrystalShard", 	"LootCrate_OW3_OreRich",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW2_Ore_Common_CrystalShard", "LootCrate_OW2_Ore_Common_CrystalShard",	"LootCrate_OW3_OreNormal",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.75]	= { "LootCrate_OW2_Ore_Common_CrystalShard","LootCrate_OW3_OrePoor",	"LootCrate_OW3_OrePoor", }, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_CrystalShard", "LootCrate_OW3_OrePoor", }, 
		[0.0]	= { "LootCrate_OW3_OrePoor", },
	},
	
	broken_parts = 
	{
		{ def = "OW_CrystallShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter2",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter3",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter1",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter2",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter3",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter2",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter3",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter1",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter2",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},
}
Def.OW_Asteroid_Mining_FederationRich =
{
	inherit 	= "OW_Asteroid_Mining_Good",
	physics		=	{ solid_type = solid.model, material = 'Rock', mass = 1000, damping = 0.4, rot_damping = 0.4, },
	model		=	"mapskit/maps/models/asteroids_rocks/mining_rocks/vanadii/vanadii",
	uiName	 	=	"OW_Asteroid_Mining_FederationRich",
	
	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW2_Ore_Only_CrystalShard", "LootCrate_OW2_Ore_Only_CrystalShard", "LootCrate_OW2_Ore_Common_CrystalShard",	"LootCrate_OW3_OreRich",  }, -- "LootCrate_OW2_MoleShipPart",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW2_Ore_Only_CrystalShard", "LootCrate_OW2_Ore_Common_CrystalShard", "LootCrate_OW3_OreRich",  }, -- "LootCrate_OW2_MoleShipPart",
		[0.75]	= { "LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW2_Ore_Common_CrystalShard", "LootCrate_OW3_OreNormal",  }, 
		[0.60]	= { "LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW3_OrePoor",  }, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_CrystalShard", },
	},
	
	asteroid_premium_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW2_Ore_Only_CrystalShard", "LootCrate_OW2_Ore_Only_CrystalShard", "LootCrate_OW2_Ore_Common_CrystalShard",	"LootCrate_OW3_OreRich",  }, --"LootCrate_OW2_MoleShipPart",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW2_Ore_Only_CrystalShard", "LootCrate_OW2_Ore_Common_CrystalShard", "LootCrate_OW3_OreRich",  }, -- "LootCrate_OW2_MoleShipPart",
		[0.75]	= { "LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW2_Ore_Common_CrystalShard", "LootCrate_OW3_OreNormal",  }, 
		[0.60]	= { "LootCrate_OW2_Ore_Only_CrystalShard", 	"LootCrate_OW3_OrePoor",  }, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_CrystalShard", },
	},
	
	broken_parts = 
	{
		{ def = "OW_CrystallShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter2",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter3",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter1",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter2",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter3",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter2",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter3",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter1",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_CrystallShatter2",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},
}
Def.OW_Asteroid_Mining_Jericho =
{
	inherit 	= "OW_Asteroid_Mining_Good",
	--physics		=	{ solid_type = solid.model, material = 'Rock', mass = 1000, damping = 0.4, rot_damping = 0.4, },
	model		=	"mapskit/maps/models/asteroids_rocks/mining_rocks/osmii/osmii",
	uiName	 	=	"OW_Asteroid_Mining_Jericho",
	
	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Common_SiliconWafer",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_SiliconWafer", "LootCrate_OW2_Ore_Only_SiliconWafer",	 "LootCrate_OW2_Ore_Common_SiliconWafer", 	"LootCrate_OW3_OreNormal", }, -- "LootCrate_OW2_MoleShipPartNormal", 
		[0.75]	= { "LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Common_SiliconWafer", 	"LootCrate_OW3_OrePoor",}, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_SiliconWafer", "LootCrate_OW3_OrePoor",}, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_SiliconWafer", },
	},
	
	asteroid_premium_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Common_SiliconWafer",  }, -- "LootCrate_OW2_MoleShipPartNormal",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_SiliconWafer", "LootCrate_OW2_Ore_Only_SiliconWafer",	 "LootCrate_OW2_Ore_Common_SiliconWafer", 	"LootCrate_OW3_OreNormal",  }, --"LootCrate_OW2_MoleShipPartNormal",
		[0.75]	= { "LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Common_SiliconWafer", 	"LootCrate_OW3_OrePoor",}, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_SiliconWafer", "LootCrate_OW3_OrePoor",}, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_SiliconWafer", },
	},
	
	broken_parts = 
	{
		{ def = "OW_KremniiShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter2",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter3",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter1",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter2",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter3",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter2",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter3",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter1",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter2",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},
}
Def.OW_Asteroid_Mining_JerichoRich =
{
	inherit 	= "OW_Asteroid_Mining_Good",
	physics		=	{ solid_type = solid.model, material = 'Rock', mass = 1000, damping = 0.4, rot_damping = 0.4, },
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/kremnii/kremnii",
	uiName	 	=	"OW_Asteroid_Mining_JerichoRich",
	
	asteroid_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_SiliconWafer", 		"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Common_SiliconWafer", "LootCrate_OW3_OreUltraRich",  }, --"LootCrate_OW2_MoleShipPart",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_SiliconWafer", 		"LootCrate_OW2_Ore_Only_SiliconWafer",	"LootCrate_OW2_Ore_Common_SiliconWafer",  "LootCrate_OW3_OreRich",  }, -- "LootCrate_OW2_MoleShipPart", 
		[0.75]	= { "LootCrate_OW2_Ore_Only_SiliconWafer", 		"LootCrate_OW2_Ore_Common_SiliconWafer", 		"LootCrate_OW3_OreNormal", 	 }, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_SiliconWafer", 	"LootCrate_OW3_OrePoor", }, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_SiliconWafer", 	},
	},
	
	asteroid_premium_loot_crate		= { -- лут при удачной обработке камня по коэф-ту нагрева
		[0.88] 	= {"LootCrate_OW2_Ore_Only_SiliconWafer", 		"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Only_SiliconWafer", 	"LootCrate_OW2_Ore_Common_SiliconWafer", "LootCrate_OW3_OreUltraRich",  }, --"LootCrate_OW2_MoleShipPart",
		[0.83] 	= {"LootCrate_OW2_Ore_Only_SiliconWafer", 		"LootCrate_OW2_Ore_Only_SiliconWafer",	"LootCrate_OW2_Ore_Common_SiliconWafer",  "LootCrate_OW3_OreRich",  }, -- "LootCrate_OW2_MoleShipPart",
		[0.75]	= { "LootCrate_OW2_Ore_Only_SiliconWafer", 		"LootCrate_OW2_Ore_Common_SiliconWafer", 		"LootCrate_OW3_OreNormal", 	 }, 
		[0.60]	= { "LootCrate_OW2_Ore_Common_SiliconWafer", 	"LootCrate_OW3_OrePoor", }, 
		[0.0]	= { "LootCrate_OW2_Ore_Common_SiliconWafer", 	},
	},
	
	broken_parts = 
	{
		{ def = "OW_KremniiShatter1",  debris = false, pos = Vec3( 0, 2, 3 ), force_dir = Vec3(0,0,0), angle = 0, --[[ang_speed_deviation = 3,]]dumping = 0.0, speed = 5, --[[speed_deviation = 5,]] speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter2",  debris = false, pos = Vec3( 0, -1, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter3",  debris = false, pos = Vec3( 1, 0, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter1",  debris = false, pos = Vec3( 2, -3, 0 ), angle = 360, ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter2",  debris = false, pos = Vec3( 0, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter3",  debris = false, pos = Vec3( 0, -5, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter1",  debris = false, pos = Vec3( 1, -5, 1 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter2",  debris = false, pos = Vec3( 0, -2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter3",  debris = false, pos = Vec3( 2, 2, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter1",  debris = false, pos = Vec3( 0, 3, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
		{ def = "OW_KremniiShatter2",  debris = false, pos = Vec3( 0, 1, 0 ), angle = 360, ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 8, },
	},
}
-- осколки астероидов
Def.OW_CrystallShatter1 =
{
	class 				= "ScBaseEntity", 
	hud_visibility_type = "minor",
	--relationship_group 	= 2,
	ttl					= 8,
	model				= "mapskit/maps/models/asteroids_rocks/mining_rocks/oskolok/oskolok_shatter",
	physics				= { solid_type = solid.sphere, material = "Rock", mass = 10, damping = 0.00, rot_damping = 0.4,  }, -- damping = 0.04, rot_damping = 0.04, 
	children = 
	{
		{ effect = "particles/weapons/laser/laser_asteroid_hit", joint = "root" },
	}
}
Def.OW_CrystallShatter2 =
{
	class 				= "ScBaseEntity",
	hud_visibility_type = "minor",
	--relationship_group 	= 2,
	ttl					= 7,
	model				= "mapskit/maps/models/asteroids_rocks/mining_rocks/oskolok/oskolok_shatter2",
	physics				= { solid_type = solid.sphere, material = "Rock", mass = 10,  damping = 0.00, rot_damping = 0.4,  },
	children = 
	{
		{ effect = "particles/weapons/laser/laser_asteroid_hit", joint = "root" },
	}
}
Def.OW_CrystallShatter3 =
{
	class 				= "ScBaseEntity",
	hud_visibility_type = "minor",
	--relationship_group 	= 2,
	ttl					= 7.5,
	model				= "mapskit/maps/models/asteroids_rocks/mining_rocks/oskolok/oskolok_shatter3",
	physics				= { solid_type = solid.sphere, material = "Rock", mass = 10,  damping = 0.00, rot_damping = 0.4,  },
	children = 
	{
		{ effect = "particles/weapons/laser/laser_asteroid_hit", joint = "root" },
	}
}
Def.OW_RichShatter1 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/rich/rich_shatter",
}
Def.OW_RichShatter2 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/rich/rich_shatter2",
}
Def.OW_GoldShatter1 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/gold/gold_shatter",
}
Def.OW_GoldShatter2 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/gold/gold_shatter2",
}
Def.OW_VanadiiShatter1 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/vanadii/vanadii_shatter",
}
Def.OW_VanadiiShatter2 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/vanadii/vanadii_shatter2",
}
Def.OW_VanadiiShatter3 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/vanadii/vanadii_shatter3",
}
Def.OW_OsmiiShatter1 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/osmii/osmii_shatter",
}
Def.OW_OsmiiShatter2 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/osmii/osmii_shatter2",
}

Def.OW_GrafitShatter1 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/grafit/grafit_shatter",
}
Def.OW_GrafitShatter2 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/grafit/grafit_shatter2",
}
Def.OW_KremniiShatter1 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/kremnii/kremnii_shatter",
}
Def.OW_KremniiShatter2 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/kremnii/kremnii_shatter2",
}
Def.OW_KremniiShatter3 =
{
	inherit = "OW_CrystallShatter1", 
	model	= "mapskit/maps/models/asteroids_rocks/mining_rocks/kremnii/kremnii_shatter3",
}

-- взрыв астероида при майнинге
Def.AsteroidExplosion = 
{
	class 			= "AuraHolderEntity",
	in_editor		= false,
	spell_on_spawn	= "AsteroidExplosion",

	uiName			= "Anomaly_PandoraSun",
}
-- эффект при успешной добыче
Def.MiningCloud = 
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	effect			= "particles/explosions/explosion_big3_electric",
	ttl 			= 4, 
	uiName			= "Anomaly_PandoraSun",
}


-- маяк зеленых
Def.VitalPoint_Green =
{
	in_editor		= true,
	inherit			= "VitalPoint_Captureable",
	uiName			= "BeaconGreen",
	turret_def1 	= "GuardDroneGreen", 
	turret_def2 	= "GuardDroneGreen",

	--model			= "models/objects/gameplay/prec_obj_bg/prec_crystal", -- модель не катит - костей нет под дронов, и физика битая вроде
--	turret_def3 	= "GuardDrone",
--	turret_def4 	= "GuardDrone",
	health			= 1500,
	decay_damage	= 100,	--
	turret_respawn_period	= 20,	-- seconds -- не работает в ОМ?
	hudType				= "default",
	hud_visibility_type = "minor",
}

-- Бафф всех НПС на карте, если карта постоянно зачищена
Def.BuffAlienByBase30 = 
{
	class 			= "AuraHolderEntity", 
	in_editor		= false,
	spell_on_spawn	= "BuffAlienByBase30",
	uiName			= "Anomaly_PandoraSun",
}
Def.BuffAlienByBase100 = 
{
	inherit			= "BuffAlienByBase30",
	spell_on_spawn	= "BuffAlienByBase100",
}
Def.BuffAlienByBase200 = 
{
	inherit			= "BuffAlienByBase30",
	spell_on_spawn	= "BuffAlienByBase200",
}

Def.BuffAlienByBase400 = 
{
	inherit			= "BuffAlienByBase30",
	spell_on_spawn	= "BuffAlienByBase400",
}


Def.GuardDroneGreen =
{
	class			= "VitalPointTurret",
	in_editor		= false,
	
	model			= "models/objects/green_drones/dron_shooter",
	--model			= "models/objects/vital_point/drone_satellite1/drone_satellite1", -- 12 april #51303
	--model			= "models/objects/vital_point/new_year_drone/new_year_drone", -- NY #57031
	physics			= { solid_type = solid.sphere, sphere_radius = 2,  kinematic = true, material = "ShipMetalMk1", mass = 1000000, hitbox = true, }, --
	--physics		=	{ solid_type = solid.model, material = "ShipMetalMk3", mass = 1000, damping = 0.4, rot_damping = 0.4, hitbox = true, },
	--physics			= { solid_type = solid.sphere, kinematic = true, material = "ShipMetalMk3", mass = 1000000, },
	maxViewDist		= 3000,
	damageable		= true,
	health			= 15000,	--5000 поднял живучесть дронов в Захвате маяков.
	signature		= ai.Signature.SMALL,
	
	death_effect	= "particles/explosions/shp_exp_mid_alien",
	death_sound		= "sound/explosion/drone_expl",

	uiName			= "GuardDroneGreen",

	fire_rate		= 60.0, -- HITTEST
	dispersion		= 1.0, -- deg
	optimal_range	= 100,
	max_range		= 200,
	projectile_speed= 250,
	
	damage_kinetic	= 500,
	damage_emp		= 0,
	damage_thermal	= 0,

	max_rot_speed	= 150,	-- deg per second
	max_yaw			= 180,
	min_yaw			= -180,
	max_pitch		= 180,
	min_pitch		= -180,
	
	projectile		= "Projectile_GreenHealRailgun",
	shot_effect 	= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/turret/turret_oneshot",
	children 			=
	{
		{ effect	= "particles/gadget/drone_shooter_engine", joint = "fx1" },
	},
}
Def.CoverShieldAlienLong = {
	inherit	=	"CoverShieldProto4",
	damageable 		= false,
	--health 			= 50000,
	ttl				= 60*60*4,	 -- 4 часа 
}

-- маяк Пиратов
Def.VitalPoint_Pirates =
{
	in_editor		= true,
	inherit			= "VitalPoint_Captureable",
	uiName			= "BeaconPirates",
	turret_def1 	= "GuardDronePirates", 
	turret_def2 	= "GuardDronePirates",

	--model			= "models/objects/gameplay/prec_obj_bg/prec_crystal", -- модель не катит - костей нет под дронов, и физика битая вроде
--	turret_def3 	= "GuardDrone",
--	turret_def4 	= "GuardDrone",
	health			= 2500,
	decay_damage	= 100,	--
	turret_respawn_period	= 20,	-- seconds -- не работает в ОМ?
	hudType				= "default",
	hud_visibility_type = "minor",
}

Def.GuardDronePirates =
{
	class			= "VitalPointTurret",
	in_editor		= false,
	
	--model			= "models/objects/green_drones/dron_shooter", -- green
	model			= "models/objects/vital_point/drone_satellite1/drone_satellite1", -- 12 april #51303
	--model			= "models/objects/vital_point/new_year_drone/new_year_drone", -- NY #57031
	physics			= { solid_type = solid.sphere, sphere_radius = 1.75,  kinematic = true, material = "ShipMetalMk1", mass = 1000000, hitbox = true, }, --
	--physics		=	{ solid_type = solid.model, material = "ShipMetalMk3", mass = 1000, damping = 0.4, rot_damping = 0.4, hitbox = true, },
	--physics			= { solid_type = solid.sphere, kinematic = true, material = "ShipMetalMk3", mass = 1000000, },
	maxViewDist		= 3000,
	damageable		= true,
	health			= 15000,	--5000 поднял живучесть дронов в Захвате маяков.
	signature		= ai.Signature.SMALL,
	
	death_effect	= "particles/explosions/shp_exp_small_02",
	death_sound		= "sound/explosion/drone_expl",

	uiName			= "GuardDronePirates",

	fire_rate		= 60.0, -- HITTEST
	dispersion		= 0.6, -- deg
	optimal_range	= 100,
	max_range		= 200,
	projectile_speed= 250,
	
	damage_kinetic	= 450,
	damage_emp		= 0,
	damage_thermal	= 0,

	max_rot_speed	= 150,	-- deg per second
	max_yaw			= 180,
	min_yaw			= -180,
	max_pitch		= 180,
	min_pitch		= -180,
	
	projectile		= "Projectile_BasicRailgun",
	shot_effect 	= "particles/weapons/drongun/muzzle",
	shot_once_sound = "sound/weapons/turret/turret_oneshot",
	children 			=
	{
		{ effect	= "particles/gadget/drone_shooter_engine", joint = "fx1" },
	},
}

--OW POLICE

Def.Police_Lvl3_Passive =
{
	class 			= "SpaceShipModule",
	item_subtype	= ItemSubtype.PoliceModule,
	in_editor		= false,
	spell_on_equip	= "Spell_Police_Lvl3",
}

Def.Police_Lvl4_Passive =
{
	inherit			= "Police_Lvl3_Passive",
	spell_on_equip	= "Spell_Police_Lvl4",
}

Def.Police_Lvl5_Passive =
{
	inherit			= "Police_Lvl4_Passive",
	spell_on_equip	= "Spell_Police_Lvl5",
}

--------------------------------------------------------------------------------------------------
-- Cyber-event
--------------------------------------------------------------------------------------------------

-- маяк Cyber
Def.VitalPoint_Cyber =
{
	in_editor		= true,
	inherit			= "VitalPoint_Captureable",
	uiName			= "BeaconCyber",
	turret_def1 	= "GuardDroneCyber", 
	turret_def2 	= "GuardDroneCyber",
	turret_def3 	= "GuardDroneCyber",
	turret_def4 	= "GuardDroneCyber",

	-- заменить на киберов !
	model			= "models/objects/vital_point/alien_beacon/alien_beacon",
	--physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	physics			= { solid_type = solid.none, static = true, },
	
	health			= 2500,
	decay_damage	= 100,	--
	turret_respawn_period	= 20,	-- seconds -- не работает в ОМ?
	hudType				= "default",
	hud_visibility_type = "minor",
	maxViewDist		= 5000,
	
	friendly_beam_fx = "particles/objects/portal_close_beam",
	hostile_beam_fx = "particles/objects/portal_close_beam",
	
	children 	= 	{
						{ def ="AlienBeaconMid", joint = "root" },
						--{ def ="CoverShieldCyber", joint = "root" },
					},
					
	scriptDeathEntity = "VitalPoint_CyberDie",
}
Def.GuardDroneCyber =
{
	class			= "VitalPointTurret",
	in_editor		= false,
	
	model = "models/misc/invisible_model",
	physics			= { solid_type = solid.sphere, sphere_radius = 1.75,  kinematic = true, material = "GiantShield", mass = 1000000, hitbox = true, }, --
	maxViewDist		= 3000,
	damageable		= true,
	health			= 20000,	--5000 поднял живучесть дронов в Захвате маяков.
	signature		= ai.Signature.SMALL,
	
	death_effect	= "particles/explosions/objects/alien_sphere_explosion",
	death_sound		= "sound/explosion/drone_expl",

	hudType			= "default",
	hud_visibility_type = "minor",
	uiName			= "GuardDroneCyber",
	

	fire_rate		= 60.0,
	dispersion		= 0.6, -- deg
	optimal_range	= 100,
	max_range		= 200,
	projectile_speed= 250,
	
	damage_kinetic	= 0,
	damage_emp		= 600,
	damage_thermal	= 0,

	max_rot_speed	= 150,	-- deg per second
	max_yaw			= 180,
	min_yaw			= -180,
	max_pitch		= 180,
	min_pitch		= -180,
	
	projectile		= "Projectile_GuardDroneCyber",  -- заменить на киберов!
	shot_effect 	= "particles/weapons/drongun/muzzle", -- заменить на киберов ?
	shot_once_sound = "sound/weapons/turret/turret_oneshot", 
	children 			=
	{
		{ def = "AlienBeaconSmall", joint = "root" },
	},
}
Def.Projectile_GuardDroneCyber =
{
	inherit					= "Projectile_Plasma_Default",

	effect 			= "particles/weapons/alien/reaver_gun_projectile",
	hit_effect		= "particles/weapons/alien/reaver_gun_hit",
	
	shadowCaster		= false,
	impact_type 		= "plasma",
}
Def.GuardDroneCyberWeak =
{
	inherit			= "GuardDroneCyber",
	class			= "Turret",
	--max_speed		= 0,
	health			= 10000,
	signature		= ai.Signature.TINY,
	damage_emp		= 400,
	uiName			= "CyberPortalGuard",
}
Def.VitalPoint_CyberDie =
{
	class 			= "AuraHolderEntity",
	in_editor		= false,
	spell_on_spawn	= "VitalPoint_CyberDie",

	uiName			= "CyberAnomaly",
	
	children 			=
	{
		{ def = "AlienBigAnomaly", joint = "root" },
	},
}
Def.CoverShieldCyber  = {
	inherit			=	"CoverShieldProto4",
	damageable 		= false, 	--health 			= 50000,
	model			= "models/shields/shield_alien_sphere4",
	smart_shield_radius	= 130, -- если модель поменяет размеры, надо поменять
	ttl				= 60*60*12,	 -- 12 часов 
}

Def.CyberAnomaly = 
{
	class 			= "AuraHolderEntity",
	in_editor		= true,
	spell_on_spawn	= "CyberAnomaly",
	relationship_group	= ai.RelationshipGroups.Alien,

	uiName			= "CyberAnomaly",
	--maxViewDist		= 15000, не работает
	scriptDeathEntity = "CyberAnomalyDie",
}
Def.CyberAnomalyDie = 
{
	class 			= "AuraHolderEntity",
	in_editor		= false,
	spell_on_spawn	= "CyberAnomalyDie",
	relationship_group	= ai.RelationshipGroups.Alien,

	uiName			= "CyberAnomaly",
}
-- взрыв аномалии
Def.CyberAnomalyFatal = 
{
	class 			= "AuraHolderEntity",
	in_editor		= true,
	spell_on_spawn	= "CyberAnomalyFatal",
	relationship_group	= ai.RelationshipGroups.Alien,
	--ttl				= 11,
	uiName			= "CyberAnomaly",
}

-- порталы под появление Cyber ов   МАЛЫЙ
Def.Cyber_Portal =
{
	class				= "ScBaseEntity",
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	special_object  	= true,
	vision_always 		= true,
	relationship_group 	= 2,
	effect				= "particles/jumpgates/portal_small",
	uiName 				= "cyber_portal",
}

Def.Cyber_PortalOpening =
{
	class				= "ScBaseEntity",	
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	special_object  	= true,
	vision_always 		= true,
	relationship_group 	= 2,
	effect				= "particles/jumpgates/portal_openclose",
	uiName 				= "cyber_portal",
	ttl 				= 5, -- работает
}
-- порталы под появление Cyber ов БОЛЬШОЙ
Def.Cyber_BigPortal =
{
	class				= "ScBaseEntity",
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	special_object  	= true,
	vision_always 		= true,
	relationship_group 	= 2,
	effect				= "particles/jumpgates/portal",
	--effect_color 		= "53 142 202 100",
	--effect_color 		= "53 202 90 100",
	uiName 				= "cyber_portal",
}

Def.Cyber_BigPortalOpening =
{
	class				= "ScBaseEntity",	
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	special_object  	= true,
	vision_always 		= true,
	relationship_group 	= 2,
	effect				= "particles/jumpgates/portal_openclose",
	uiName 				= "cyber_portal",
	ttl 				= 5, -- работает
}

Def.Cyber_Megabomb = 
{
	---class				= "ScBaseEntity",
	class				= "Turret", --- #65520 а то не дамажат её эсминцевые модули
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	health 				= 600000,
	signature		= ai.Signature.HUGE,
	--remove_on_death = false,
	full_activate_revive = true, -- после реактивации будет как новенькая
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	hud_ico			= "alien_megabomb_icon",
	maxViewDist		= 5000,
	model			= "mapskit/maps/models/precursors/pc_animated_core_small", -- "models/objects/gameplay/bombball/bombball"
	--physics			= { solid_type = solid.model, static = true, material = "Metal" },
	children 	= 	{{ effect ="particles/objects/alien_invertor_core", joint = "root" },},
	physics		= { solid_type = solid.model, static = true, material = "Rock" },
	
	death_effect	= "particles/explosions/objects/alien_invertor_explosion",
	death_sound		= "sound/explosion/alien_bomb_expl",
	work_sound		= "sound/raid/megabomb_raid_idle",
	
	points_reward_kill = 50,
	points_reward_assist_damage = 450,

	vision_always = true,
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName = "Megabomb_Raid_Pve_name",
} 


Def.Cyber_flyEffect =
{
	class				= "ScBaseEntity",
	effect 			= "particles/weapons/alien/alien_gun_projectile", 
	physics				= { solid_type = solid.none },
	in_editor			= false,
	damageable			= false,
	ttl = 20,
}


Def.OpenWorld_April_car =
{
	class				= "ScBaseEntity",
	model 				= "models/objects/gameplay/car/car_red",

	physics				= { solid_type = solid.model, mass = 5000000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	in_editor			= false,
	damageable			= true,
	health				= 3000,
	vision_radius 		= 5000,
	relationship_group	= ai.RelationshipGroups.Neutral4,
	death_sound		= "sound/explosion/drone_expl",
	--hudType		= 	"default",
	--spawn_effect = "particles/other/wave_portal_open",
	
	uiName 			= "April_car_name",
	broken_parts = 
	{
		{ def = "OpenWorld_AprilCar_Wreck",  debris = false, pos = Vec3( 0.0, 0.0, 0.0 ), ang_speed_deviation = 0,dumping = 0.0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 20 },
		--{ model = "models/objects/gameplay/car/man_wreck", effect = "particles/explosions/debris_trail", angle = 180, pos = Vec3( 0.5, 0.5, 0 ), dumping = 0.3, speed = 1.0, speed_deviation = 7, speed_inherit = 1.0, ttl = 30, },	
		--{ def = "OpenWorld_AprilCar_Loot", debris = false, pos = Vec3( 0.5, 0.5, 0.0 ), ang_speed_deviation = 0,dumping = 0.0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 60 },
	},
	--quest_drop = {"OpenWorld_AprilCar_Loot"},
	--quest_drop_loot_crate = {"OpenWorld_AprilCar_Loot"},
}

Def.OpenWorld_AprilCar_Wreck =
{
	class		=	'ScBaseEntity',
	in_editor	=	false,
	hudType		= 	"loot_crate",
	model		=	"models/objects/gameplay/car/car_wreck",
	physics		=	{ solid_type = solid.model, mass = 3000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },
	uiName 		= 	"ShipWreck", 
	children = 
	{
		{ effect = "particles/explosions/huge_module", joint = "fx1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "fx2" },
		{ effect = "particles/explosions/huge_module", joint = "expl1" },
		{ effect = "particles/explosions/huge_capacitor_expl_hemisphere", joint = "expl1" },
	},
}

-- SC-114746 Машина в космосе на 1 апреля
Def.OpenWorld_April_car_1 =
{
	inherit = "OpenWorld_April_car",

	skin = "default",
	
	quest_drop = {"ow_QuestApril2021_1"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_1",
}
Def.OpenWorld_April_car_2 =
{
	inherit = "OpenWorld_April_car",

	skin = "blue",
	
	quest_drop = {"ow_QuestApril2021_2"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_2",
}
Def.OpenWorld_April_car_3 =
{
	inherit = "OpenWorld_April_car",

	skin = "blue2",
	
	quest_drop = {"ow_QuestApril2021_3"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_3",
}
Def.OpenWorld_April_car_4 =
{
	inherit = "OpenWorld_April_car",

	skin = "green",
	
	quest_drop = {"ow_QuestApril2021_4"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_4",
}
Def.OpenWorld_April_car_5 =
{
	inherit = "OpenWorld_April_car",

	skin = "khaki",
	
	quest_drop = {"ow_QuestApril2021_5"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_5",
}
Def.OpenWorld_April_car_6 =
{
	inherit = "OpenWorld_April_car",

	skin = "lilac",
	
	quest_drop = {"ow_QuestApril2021_6"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_6",
}
Def.OpenWorld_April_car_7 =
{
	inherit = "OpenWorld_April_car",
	
	skin = "orange",

	quest_drop = {"ow_QuestApril2021_7"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_7",
}
Def.OpenWorld_April_car_8 =
{
	inherit = "OpenWorld_April_car",

	skin = "purple",
	
	quest_drop = {"ow_QuestApril2021_8"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_8",
}
Def.OpenWorld_April_car_9 =
{
	inherit = "OpenWorld_April_car",

	skin = "white",
	
	quest_drop = {"ow_QuestApril2021_9"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_9",
}
Def.OpenWorld_April_car_10 =
{
	inherit = "OpenWorld_April_car",

	skin = "yellow",
	
	quest_drop = {"ow_QuestApril2021_10"},
	quest_drop_loot_crate = "OpenWorld_AprilCar_Loot_10",
}

-- SC-115685 Поиски сокровищ в ОМ. Ивент на новый год
Def.OpenWorld_BP22_TreasureChest_1 = 
{
	inherit			= "OpenWorld_QuestObject_Loot",

	model = "models/objects/gameplay/loot_box/loot_box_02",
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3" },

	uiName			= "OpenWorld_BP22_TreasureChest_name",
	required_item	= "BP22_TreasureMap_1",
	loot_item		= "ow_BP22_Treasure_1",
}
Def.OpenWorld_BP22_TreasureChest_2 = 
{
	inherit			= "OpenWorld_BP22_TreasureChest_1",
	required_item	= "BP22_TreasureMap_2",
	loot_item		= "ow_BP22_Treasure_2",
}
Def.OpenWorld_BP22_TreasureChest_3 = 
{
	inherit			= "OpenWorld_BP22_TreasureChest_1",
	required_item	= "BP22_TreasureMap_3",
	loot_item		= "ow_BP22_Treasure_3",
}
Def.OpenWorld_BP22_TreasureChest_4 = 
{
	inherit			= "OpenWorld_BP22_TreasureChest_1",
	required_item	= "BP22_TreasureMap_4",
	loot_item		= "ow_BP22_Treasure_4",
}
Def.OpenWorld_BP22_TreasureChest_5 = 
{
	inherit			= "OpenWorld_BP22_TreasureChest_1",
	required_item	= "BP22_TreasureMap_5",
	loot_item		= "ow_BP22_Treasure_5",
}
Def.OpenWorld_BP22_TreasureChest_6 = 
{
	inherit			= "OpenWorld_BP22_TreasureChest_1",
	required_item	= "BP22_TreasureMap_6",
	loot_item		= "ow_BP22_Treasure_6",
}
Def.OpenWorld_BP22_TreasureChest_7 = 
{
	inherit			= "OpenWorld_BP22_TreasureChest_1",
	required_item	= "BP22_TreasureMap_7",
	loot_item		= "ow_BP22_Treasure_7",
}
Def.OpenWorld_BP22_TreasureChest_8 = 
{
	inherit			= "OpenWorld_BP22_TreasureChest_1",
	required_item	= "BP22_TreasureMap_8",
	loot_item		= "ow_BP22_Treasure_8",
}
--
Def.OpenWorld_TreasureChest_PirateBasePve = 
{
	uiName			= "OpenWorld_TreasureChest_PirateBasePve_name",
	inherit			= "OpenWorld_BP22_TreasureChest_1",
	required_item	= "PirateBasePve_key",
	loot_item		= "ow_PirateBasePve_Treasure",
}
--
Def.OpenWorld_PikabuAstronaut_1 = 
{
	inherit			= "OpenWorld_QuestObject_Loot",
	hudType 		= "default",
	model = "models/objects/gameplay/pikabu_os/pikabu_os",
	physics = { solid_type = solid.model, static = true, material = "ShipMetalMk3" },
	uiName			= "PikabuAstronaut",
	required_item	= "ow_PikabuEvent_1_key",
	loot_item		= "ow_PikabuEvent_1",
}
Def.OpenWorld_PikabuAstronaut_2= 
{
	inherit			= "OpenWorld_PikabuAstronaut_1",
	uiName			= "PikabuAstronaut",
	required_item	= "ow_PikabuEvent_2_key",
	loot_item		= "ow_PikabuEvent_2",
}
Def.OpenWorld_PikabuAstronaut_3= 
{
	inherit			= "OpenWorld_PikabuAstronaut_1",
	uiName			= "PikabuAstronaut",
	required_item	= "ow_PikabuEvent_3_key",
	loot_item		= "ow_PikabuEvent_3",
}

Def.OpenWorld_Cultistic_Sing1 = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/ships/race_3/wrecks/r3_wreck_l_wingl",
	physics			= { solid_type = solid.none, material = "Metal", static = true, },

	uiName			= "OpenWorld_Cultistic_Sing_name",
	required_item	= "ow_Cultistic_key1",
	
	hudType 				= "default",
	spawn_effect 			= "",
	glow_effect				= "",
	maxViewDist 			= 0.1,
}

Def.OpenWorld_Cultistic_Sing2 = 
{
	inherit			= "OpenWorld_Cultistic_Sing1",
	required_item	= "ow_Cultistic_key2",
}

Def.OpenWorld_Cultistic_Sing3 = 
{
	inherit			= "OpenWorld_Cultistic_Sing1",
	required_item	= "ow_Cultistic_key3",
}

Def.OpenWorld_Cultistic_Sing4 = 
{
	inherit			= "OpenWorld_Cultistic_Sing1",
	required_item	= "ow_Cultistic_key4",
}

Def.OpenWorld_Cultistic_Sing5 = 
{
	inherit			= "OpenWorld_Cultistic_Sing1",
	required_item	= "ow_Cultistic_key5",
}

Def.OpenWorld_Cultistic_Sing6 = 
{
	inherit			= "OpenWorld_Cultistic_Sing1",
	required_item	= "ow_Cultistic_key6",
}

Def.OpenWorld_Cultistic_Pumpkin = 
{
	inherit			= "OpenWorld_QuestObject_Loot",
	model			= "models/objects/gameplay/bombball/bombball_halloween",
	physics			= { solid_type = solid.sphere, material = "Paper", static = true, },
	uiName			= "OpenWorld_Cultistic_Pumpkin_name",
	required_item	= "ow_QuestLootCultistic_Pumpkin_key",
}

Def.OpenWorld_Cultistic_PumpkinHiden = 
{
	inherit			= "OpenWorld_QuestObject_Loot",
	model			= "models/objects/gameplay/bombball/bombball_halloween",
	physics			= { solid_type = solid.sphere, material = "Paper", static = true, },
	uiName			= "OpenWorld_Cultistic_Pumpkin_name",
	interaction_distance	= 30 ,
	max_detection_distance	= 30,
	respawn_time	= 25,
	required_item	= "ow_QuestLootCultistic_Pumpkin_key",
}

Def.OpenWorld_Cultistic_HangarGate1 = 
{
	inherit			= "OpenWorld_QuestObject_Interact",

	model			= "models/weapons/drones/spyradar/spyradar",
	physics			= { solid_type = solid.none, material = "Metal", static = true, },

	uiName			= "OpenWorld_CultisticHangarGate_name",
	required_item	= "ow_CultisticHangarGate1_key",
	
	hudType 		= "default",
	spawn_effect 	= "",
	glow_effect		= "",
	maxViewDist 	= 0.1,
}

Def.OpenWorld_Cultistic_HangarGate2 = 
{
	inherit			= "OpenWorld_Cultistic_HangarGate1",
	required_item	= "ow_CultisticHangarGate2_key",
}

Def.OpenWorld_Cultistic_HangarGate3 = 
{
	inherit			= "OpenWorld_Cultistic_HangarGate1",
	required_item	= "ow_CultisticHangarGate3_key",
}

Def.OpenWorld_Cultistic_Temple = 
{
	inherit			= "OpenWorld_Cultistic_Sing1",
	uiName			= "OpenWorld_CultisticTemple_name",
	required_item	= "ow_Cultistic_Temple_key",
	model			= "models/ships/race_3/wrecks/r3_wreck_l_wingl",
}

Def.OpenWorld_April2023_Egg1 = 
{
	inherit			= "OpenWorld_QuestObject_Loot",
	model		= "models/objects/gameplay/easter_eggs/easter_eggs",
	physics		= { solid_type = solid.model, mass = 4600, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3,},
	skin		= "default",
	hudType			= "default",
	max_detection_distance	= 5,
	respawn_time 			= 420.0,
	uiName			= "OW_April2023_Egg_Name",
	required_item	= "OW_April2023_Egg1_Key",
	loot_item		= "OW_April2023_egg1",

}

Def.OpenWorld_April2023_Egg2 = --
{
	inherit			= "OpenWorld_April2023_Egg1",
	skin			= "blue",
	required_item	= "OW_April2023_Egg2_Key",
	loot_item		= "OW_April2023_egg2",
}

Def.OpenWorld_April2023_Egg3 = 
{
	inherit			= "OpenWorld_April2023_Egg1",
	skin			= "blue2",
	required_item	= "OW_April2023_Egg3_Key",
	loot_item		= "OW_April2023_egg3",
}

Def.OpenWorld_April2023_Egg4 = 
{
	inherit			= "OpenWorld_April2023_Egg1",
	skin			= "green",
	required_item	= "OW_April2023_Egg4_Key",
	loot_item		= "OW_April2023_egg4",
}

Def.OpenWorld_April2023_Egg5 = 
{
	inherit			= "OpenWorld_April2023_Egg1",
	skin			= "green2",
	required_item	= "OW_April2023_Egg5_Key",
	loot_item		= "OW_April2023_egg5",
}

Def.OpenWorld_April2023_Egg6 = 
{
	inherit			= "OpenWorld_April2023_Egg1",
	skin			= "orange",
	required_item	= "OW_April2023_Egg6_Key",
	loot_item		= "OW_April2023_egg6",
}

Def.OpenWorld_April2023_Egg7 = --
{
	inherit			= "OpenWorld_April2023_Egg1",
	skin			= "purple",
	required_item	= "OW_April2023_Egg7_Key",
	loot_item		= "OW_April2023_egg7",
}

Def.OpenWorld_April2023_Egg8 = 
{
	inherit			= "OpenWorld_April2023_Egg1",
	skin			= "purple2",
	required_item	= "OW_April2023_Egg8_Key",
	loot_item		= "OW_April2023_egg8",
}

Def.OpenWorld_April2023_Egg9 = --
{
	inherit			= "OpenWorld_April2023_Egg1",
	skin			= "red",
	required_item	= "OW_April2023_Egg9_Key",
	loot_item		= "OW_April2023_egg9",
}

Def.OpenWorld_April2023_Egg10 = --
{
	inherit			= "OpenWorld_April2023_Egg1",
	skin			= "yellow",
	required_item	= "OW_April2023_Egg10_Key",
	loot_item		= "OW_April2023_egg10",
}

Def.OpenWorld_IvertorAnomaly = -- Маяк наносящий урон, блокирующий выход из зоны (незльзя взаимодействовать) SC-119680 .
{
	class 			= "AuraHolderEntity",
	spell_on_spawn	= "Spell_OpenWorld_IvertorAnomaly",
	
	in_editor				= false,
	--model					= "models/objects/vital_point/drone_satellite1/drone_satellite1", -- если закоментировать модель здесь - будет невидимым 
	--physics					= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 90000, },
	
	--hudType 				= "default",
	--uiName="OpenWorld_IvertorAnomaly",
}

Def.OpenWorld_IvertorAnomalySpy = -- Маяк снимающий нивидимость с противников.
{
	class 			= "AuraHolderEntity",
	spell_on_spawn	= "Spell_OpenWorld_IvertorAnomaly_SPY",
	
	in_editor		= false,
	model			= "models/weapons/drones/spyradar/spyradar", -- если закоментировать модель здесь - будет невидимым 
	--physics		= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 90000, },
	
	--hudType 		= "default",
	--uiName		= "OpenWorld_IvertorAnomaly",
}

Def.OpenWorld_PrecursorsFlamingHole = -- Маяк наносящий урон ("опасная чёрная дыра / пламя").
{
	class 			= "AuraHolderEntity",
	spell_on_spawn	= "Spell_OpenWorld_IvertorAnomaly_SPY",
	
	in_editor		= false,
	model			= "models/modules/decorative/object/prec_flame", -- если закоментировать модель здесь - будет невидимым 
	maxViewDist		= 10000,
	--physics		= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 90000, },
	
	--hudType 		= "default",
	--uiName		= "OpenWorld_IvertorAnomaly",
}

Def.Module_IvertorAnomalySpy = --CPU Amber
{
	class 					= "SpaceShipModule",
	module_type				= ai.ModuleType.CPU_MOD,
	shopCategory			= "SHIP_MOD",
	shopSubCategory			= "COMP_MOD",
	spell_on_equip			= "Spell_OpenWorld_IvertorAnomaly_SPY",
	in_editor				= false,
	
	cooldown				= 40,
	show_cooldown_status	= true,
	
	default_icon			= "",
	

}


