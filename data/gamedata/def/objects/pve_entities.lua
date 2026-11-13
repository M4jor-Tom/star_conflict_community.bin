-- от имени этого энтити
Def.PveAuraHolderEntity = 
{
	class			= "ScBaseEntity",
	in_editor		= false,
	uiName			= "PveAuraHolderEntity",
}


-- Пушка босса Т5 для PvE карт
Def.Weapon_Laser_Basic_T5_Boss_Weapon =
{
	inherit			= "Weapon_Laser_Basic_T5_Epic",
	damage_thermal  = 300*2,
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
}

-- Пушка элитбосса Т5 для PvE карты т3-т4
Def.Weapon_Laser_Basic_T5_MegaBoss_Weapon =
{
	inherit			= "Weapon_Laser_Basic_T5_Epic",
	damage_thermal	= 350*2,
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
}

-- Пушка босса Т3 для PvE Карт
Def.Weapon_Laser_Basic_T3_Boss_Weapon =
{
	inherit			= "Weapon_Laser_Basic_T3_Epic",
	damage_thermal	= 200*2,
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
}

-- Пушка босса Т3 для PvE Карты т3-т4
Def.Weapon_Laser_Basic_T3_EliteBoss_Weapon =
{
	inherit			= "Weapon_Laser_Basic_T4_Epic",
	damage_thermal	= 250*2,
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
}

-- Пушка босса Т5 для PvE карты bigship_building
Def.Weapon_Laser_Basic_T5_EasyBoss_Weapon =
{
	inherit			= "Weapon_Laser_Basic_T5_Epic",
	damage_thermal  = 150,
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
}

-- Пушка Аи-агентов для т2
Def.Weapon_Plasmagun_Basic_T2_Pirate_Weapon =
{
	inherit			= "Weapon_Railgun_Basic_T2_Mk1",
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
	
	fire_rate		 = 30,
	optimal_range    = 200,
	max_range		 = 300,
	projectile_speed = 60,
	damage_emp	 	 = 600,
	damage_kinetic	 = 0, --95.3 !!!
	
	effect = "particles/weapons/plasma/projectile2",
}

-- Пушка Аи-агентов для т3
Def.Weapon_Plasmagun_Basic_T3_Pirate_Weapon =
{
	inherit			= "Weapon_Plasmagun_Basic_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
	
	fire_rate		 = 30,
	optimal_range    = 200,
	max_range		 = 300,
	projectile_speed = 110,
	damage_emp		 = 1000,
	
	effect = "particles/weapons/plasma/projectile2",
}

-- Пушка босса для piratebay
Def.Weapon_PvePirate_Plasmagun_T3_Boss_Weapon =
{
	inherit			 = "Weapon_Plasmagun_Heavy_T3_Mk1",
	storeItemId		 = 0,
	cant_be_bought   = true,
	drop_weight		 = 0,
	
	fire_rate		 = 40,
	optimal_range    = 400,
	max_range		 = 700,
	projectile_speed = 35.0,
	damage_emp		 = 5000,
	
	class_mask		= ai.ShipClass.LARGE,

	heat_max		 = 10,
	heat_add 		 = 0,
	
	projectile		= "Projectile_BossSingularityGreen",
	shot_beam_fx 	= "particles/empty",
}

Def.Projectile_BossSingularityCannon =
{
	inherit			= "Projectile_SingularityCannon",
}

Def.Projectile_BossSingularityGreen =
{
	inherit			= "Projectile_SingularityCannon",
	effect 			= "particles/weapons/alien/alien_gun_projectile",
}

-- отключенние плазмовеба у перехватчиков федерации для PvE.
--т1
Def.Module_PlasmaWeb_T1_PvE =
{
	inherit		= "Module_PlasmaWeb_T1_Base",
	tier		= 1,
	energy_cost = 500,
}

--т2
Def.Module_PlasmaWeb_T2_PvE =
{
	inherit		= "Module_PlasmaWeb_T1_Base",
	tier		= 2,
	energy_cost = 500,
}

--т3
Def.Module_PlasmaWeb_T3_PvE =
{
	inherit		= "Module_PlasmaWeb_T1_Base",
	tier		= 3,
	energy_cost = 500,
}

--т4
Def.Module_PlasmaWeb_T4_PvE =
{
	inherit		= "Module_PlasmaWeb_T1_Base",
	tier		= 4,
	energy_cost = 500,
}


-- отключение Module_BlackoutGenerator у перехватчиков для PvE.

-- т1
Def.Module_BlackoutGenerator_T1_PvE =
{
	inherit		= "Module_BlackoutGenerator_T1_Base",
	tier		= 1,
	energy_cost = 500,
}

-- т2
Def.Module_BlackoutGenerator_T2_PvE =
{
	inherit		= "Module_BlackoutGenerator_T2_Base",
	tier		= 2,
	energy_cost = 500,
}

-- т3
Def.Module_BlackoutGenerator_T3_PvE =
{
	inherit		= "Module_BlackoutGenerator_T3_Base",
	tier		= 3,
	energy_cost = 1000,
}

-- т4
Def.Module_BlackoutGenerator_T4_PvE =
{
	inherit		= "Module_BlackoutGenerator_T4_Base",
	tier		= 4,
	energy_cost = 1000,
}


-- отключение Module_FrigateDrone у фрегатов для PvE.

-- т1
Def.Module_FrigateDrone_T1_PvE =
{
	inherit			= "Module_FrigateDrone_T1_Base",
	tier			= 1,
	energy_cost 	= 1000,
	damage_thermal	= 95.425,
	fire_rate		= 40,
}

-- т2
Def.Module_FrigateDrone_T2_PvE =
{
	inherit		= "Module_FrigateDrone_T2_Base",
	tier		= 2,
	energy_cost = 1000,
}

-- т3
Def.Module_FrigateDrone_T3_PvE =
{
	inherit		= "Module_FrigateDrone_T3_Base",
	tier		= 3,
	energy_cost = 1000,
}

-- т4
Def.Module_FrigateDrone_T4_PvE =
{
	inherit		= "Module_FrigateDrone_T4_Base",
	tier		= 4,
	energy_cost = 1000,
}

-- дезинетгратор для туториала
Def.Module_Disintegrator_T4_Tutorial =
{
	inherit				= "Module_Disintegrator_T4_Base",
	optimal_range		= 2000,
	damage_thermal		= 1000,
}

-- оружие ботов для туториала
Def.Weapon_Laser_Basic_T4_Tutorial =
{
	inherit				= "Weapon_Laser_Basic_T4_Mk1",
	damage_thermal		= 100,
	drop_weight		    = 0, 
	storeItemId			= 0,
	cant_be_bought  	= true,
}

-- ОРУЖИЕ АИ АГЕНТОВ

-- T1-T2
-- пушка Weapon_Plasmagun_Basic_T2_Mk1 для S meat
Def.Weapon_Plasmagun_Basic_T2_Mk1_Pve =
{
	inherit				= "Weapon_Plasmagun_Basic_T2_Mk1",
	fire_rate			= 75,
	projectile_speed	= 75,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

--пушка Weapon_Plasmagun_Basic_T2_Mk3 для S casual elite
Def.Weapon_Plasmagun_Basic_T2_Mk3_Pve =
{
	inherit				= "Weapon_Plasmagun_Basic_T2_Mk3",
	fire_rate			= 75,
	projectile_speed	= 75,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

-- пушка Weapon_Railgun_Basic_T2_Mk2 для M damager
Def.Weapon_Railgun_Basic_T2_Mk2_Pve =
{
	inherit				= "Weapon_Railgun_Basic_T2_Mk2",
	fire_rate			= 50,
	projectile_speed	= 130,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

--T3-T4
-- пушка Weapon_Plasmagun_Basic_T4_Mk3 для S meat   
Def.Weapon_Plasmagun_Basic_T4_Mk3_Pve =
{
	inherit				= "Weapon_Plasmagun_Basic_T4_Mk3",
	fire_rate			= 60,
	projectile_speed	= 120,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

-- пушка Weapon_Plasmagun_Basic_T4_Mk3_Pve для S truemeat
Def.Weapon_Plasmagun_Basic_T3_Mk3_Pve =
{
	inherit				= "Weapon_Plasmagun_Basic_T3_Mk3",
	fire_rate			= 60,
	projectile_speed	= 120,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

-- пушка Weapon_Plasmagun_Heavy_T4_Mk3
Def.Weapon_Plasmagun_Heavy_T4_Mk3_Pve =
{
	inherit				= "Weapon_Plasmagun_Heavy_T4_Mk3",
	fire_rate			= 40,
	projectile_speed	= 100,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,

	projectile		= "Projectile_BossSingularityCannon",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_2_beam",
}

-- пушка для ботов под T3 PvE
Def.Weapon_Plasmagun_Basic_T3_PvE =
{
	inherit				= "Weapon_Plasmagun_Basic_T3_Mk3",
	fire_rate			= 75,
	projectile_speed	= 150,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

-- пушка для ботов под T3 PvE
Def.Weapon_Railgun_Autofire_T4_PvE =
{
	inherit				= "Weapon_Railgun_Autofire_T4_Mk3",
	fire_rate			= 20,
	projectile_speed	= 300,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

-- пушка для ботов под T3 PvE
Def.Weapon_Railgun_Basic_T3_PvE =
{
	inherit				= "Weapon_Railgun_Basic_T3_Mk3",
	fire_rate			= 60,
	projectile_speed	= 250,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

-- пушка для ботов под T3 PvE
Def.Weapon_Plasmagun_Heavy_T4_PvE =
{
	inherit				= "Weapon_Plasmagun_Heavy_T4_Mk3",
	fire_rate			= 12,
	projectile_speed	= 80,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,

	projectile		= "Projectile_BossSingularityCannon",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_2_beam",
}

-- пушка для ботов под T3 PvE
Def.Weapon_Laser_Basic_T3_PvE =
{
	inherit				= "Weapon_Laser_Basic_T3_Mk3",
	heat_max			= 4,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

-- пушка для ботов под T3 PvE
Def.Weapon_Railgun_Heavy_T3_PvE =
{
	inherit				= "Weapon_Railgun_Heavy_T3_Mk3",
	fire_rate			= 5,
	projectile_speed	= 120,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

-- Пушка босса для T3
Def.Weapon_Pve_Plasmagun_T3_Boss_Weapon =
{
	inherit			 = "Weapon_Plasmagun_Heavy_T3_Mk1",
	storeItemId		 = 0,
	cant_be_bought   = true,
	drop_weight		 = 0,
	
	fire_rate		 = 40,
	optimal_range    = 300,
	max_range		 = 400,
	projectile_speed = 45.0,
	damage_emp		 = 5000,
	
	class_mask		= ai.ShipClass.LARGE,

	heat_max		 = 10,
	heat_add 		 = 0,
	
	
	projectile		= "Projectile_BossSingularityCannon",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_2_beam",
}





-- def для станции контроля(маяк в ПвЕ)
Def.VitalPoint_PVE_ControlStationA =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "BeaconA",
	health			= 5000,
	gameplay_idx	= 0,
	relationship_group = 1,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 80,
	decay_max_enemy = 1,
	
	vision_always = true,
}

Def.VitalPoint_PVE_ControlStationB =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "BeaconB",
	health			= 5000,
	gameplay_idx	= 0,
	relationship_group = 1,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 80,
	decay_max_enemy = 1,
	
	vision_always = true,
}

Def.VitalPoint_PVE_ControlStationC =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "BeaconC",
	health			= 5000,
	gameplay_idx	= 0,
	relationship_group = 1,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 80,
	decay_max_enemy = 1,
	
	vision_always = true,
}


-- BOSS MODULE

-- модуль босса Т5 АОЕ дамаг
Def.Module_Boss_SmartBomb_T5 =
{
	mark = 1,
	tier = 5,
	item_lvl = 16,
	cooldown = 40,
	energy_cost = 0,
	spell = "Boss_SmartBomb_T5",
	activate_sound = "",
	class = "ActiveModule",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	in_editor = false,
	default_icon = "Module_SmartBomb",
	item_subtype = ItemSubtype.SmartBomb,
	uiName = "Module_SmartBomb",
	uiDesc = "Module_SmartBomb_Desc",
	
	announce_ready_time = 5, 		-- за сколько до конца кд анонс происходит
	announce_ready_notif = "Module_READY_BossSmartBombT5",
	announce_deactivate_notif = "Module_DEACTIVATED_BossSmartBombT5",
	cooldown_on_equip = 15, -- кд который включается после его спауна
}

-- модуль босса Т5 АОЕ дамаг ДЛЯ КАРТЫ Т4
Def.Module_Boss_BigSmartBomb_T5 =
{
	mark = 1,
	tier = 5,
	item_lvl = 16,
	cooldown = 40,
	energy_cost = 0,
	spell = "Boss_BigSmartBomb_T5",
	activate_sound = "",
	class = "ActiveModule",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	in_editor = false,
	default_icon = "Module_SmartBomb",
	item_subtype = ItemSubtype.SmartBomb,
	uiName = "Module_SmartBomb",
	uiDesc = "Module_SmartBomb_Desc",
	
	announce_ready_time = 5, 		-- за сколько до конца кд анонс происходит
	announce_ready_notif = "Module_READY_BossSmartBombT5",
	announce_deactivate_notif = "Module_DEACTIVATED_BossSmartBombT5",
	cooldown_on_equip = 15, -- кд который включается после его спауна
}

-- модуль босса Т1 АОЕ дамаг ДЛЯ КАРТЫ Т1
Def.Module_EasyBoss_SmartBomb_T5 = 
{
	inherit = "Module_Boss_BigSmartBomb_T5",
	mark = 1,
	tier = 5,
	item_lvl = 16,
	cooldown = 60,
	energy_cost = 0,
	spell = "Boss_SmartBomb_Easy",
	
	announce_ready_time = 5, 		-- за сколько до конца кд анонс происходит
	announce_ready_notif = "Module_READY_BossSmartBombT5",
	announce_deactivate_notif = "Module_DEACTIVATED_BossSmartBombT5",
	cooldown_on_equip = 15, -- кд который включается после его спауна
}

-- модуль босса Т5 резисты уменьшает у цели.
Def.Module_TargetPainter_Boss_T5 =
{
	mark = 3,
	tier = 5,
	item_lvl = 21.5,
	cooldown = 30,
	energy_cost_per_second = 0,
	spell = "TargetPainter_Boss_T5",
	activate_sound = "sound/gadgets/common_activate",
	work_beam_fx="particles/gadget/default_beam",
	class = "ActiveModule",
	model = "models/modules/m_active/m_a_gadget_beamer",
	module_type = ai.ModuleType.ACTIVE,
	in_editor = false,
	default_icon = "Module_TargetPainter",
	item_subtype = ItemSubtype.TargetPainter,
	uiName = "Module_TargetPainter_Rel",
	uiDesc = "Module_TargetPainter_Desc",
	announce_ready_time = 5, 	    	-- за сколько до конца кд анонс происходит
	cooldown_on_equip = 15,			 -- кд который включается после его спауна
}

-- модуль SmartBomb, не бьющий сквозь объекты для капитана
Def.Module_Captain_SmartBomb =
{
	mark = 1,
	tier = 3,
	item_lvl = 16,
	cooldown = 38,
	energy_cost = 356,
	spell = "Captain_SmartBomb",
	activate_sound = "",
	class = "ActiveModule",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	in_editor = false,
	default_icon = "Module_SmartBomb",
	item_subtype = ItemSubtype.SmartBomb,
	uiName = "Module_SmartBomb",
	uiDesc = "Module_SmartBomb_Desc",
}

-- модуль SmartBomb, не бьющий сквозь объекты для командора т4
Def.Module_Commander_SmartBomb =
{
	mark = 1,
	tier = 4,
	item_lvl = 16,
	cooldown = 38,
	energy_cost = 356,
	spell = "Commander_SmartBomb",
	activate_sound = "",
	class = "ActiveModule",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	in_editor = false,
	default_icon = "Module_SmartBomb",
	item_subtype = ItemSubtype.SmartBomb,
	uiName = "Module_SmartBomb",
	uiDesc = "Module_SmartBomb_Desc",
}

-- модуль SmartBomb, не бьющий сквозь объекты для командора т1
Def.Module_Commander_SmartBomb_Easy =
{
	inherit = "Module_Commander_SmartBomb",
	mark = 1,
	tier = 2,
	item_lvl = 16,
	cooldown = 40,
	energy_cost = 200,
	spell = "Commander_SmartBomb_Easy",
	
	announce_ready_time = 5, 		-- за сколько до конца кд анонс происходит
	cooldown_on_equip = 15, -- кд который включается после его спауна
}

-- модуль призывающий VoidZone наносяющую термальный дамаг
Def.Module_Pve_VoidZone_ThermalDamage =
{
	mark = 1,
	tier = 4,
	item_lvl = 16,
	cooldown = 20,
	energy_cost = 0,
	spell = "Pve_VoidZone_ThermalDamage",
	activate_sound = "sound/gadgets/voidzone_activate",
	class = "ActiveModule",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	in_editor = false,
	default_icon = "Module_SmartBomb", -- заглушка
	item_subtype = ItemSubtype.SmartBomb,
	uiName = "Module_SmartBomb", -- заглушка
	uiDesc = "Module_SmartBomb_Desc", -- заглушка
}

-- модуль АОЕ стелс на всех, кроме кастера
Def.Module_StealthShip =
{
	mark = 1,
	tier = 4,
	item_lvl = 16,
	cooldown = 100,
	energy_cost = 1,
	spell = "Pve_StealthShip",
	in_editor = false,
	class = "ActiveModule",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	default_icon = "Module_SmartBomb",
	item_subtype = ItemSubtype.PveAoeCloaking,
	uiName = "Module_SmartBomb",
	uiDesc = "Module_SmartBomb_Desc",
}

-- модуль АОЕ резисты на всех, кроме кастера
Def.Module_Pve_ShieldResist_All_Hard =
{
	mark = 1,
	tier = 4,
	item_lvl = 16,
	spell = "Pve_ShieldResist_All_Hard",
	activate_sound = "sound/gadgets/common_activate",
	class = "ActiveModule",
	model = "models/modules/m_active/m_a_gadget_pulsar",
	in_editor = false,
	default_icon = "Module_SmartBomb", -- заглушка
	item_subtype = ItemSubtype.CommandShieldResist,
	uiName = "Module_SmartBomb", -- заглушка
	uiDesc = "Module_SmartBomb_Desc", -- заглушка
}


-- ROCKETS FOR BOTS

-- cruise missle для Large_T3 ботов PvE
Def.SpaceMissile_Cruise_T3_Pve =
{
	inherit = "SpaceMissile_Cruise_T3_Mk3",
	explosion_blast_wave = "BlastWave_SM_Cruise_T3_Pve",
	storeItemId = 0,
	cant_be_bought  = true,
	drop_weight		= 0,
	
}	
-- BlastWave ракеты для Large_T3 ботов PvE
Def.BlastWave_SM_Cruise_T3_Pve =
{
	inherit = "BlastWave_SM_Cruise_T3_Mk3",
	damage_thermal = 1000,
}


-- cruise missle для Large_T4 ботов PvE
Def.SpaceMissile_Cruise_T4_Pve =
{
	inherit = "SpaceMissile_Cruise_T4_Mk3",
	explosion_blast_wave = "BlastWave_SM_Cruise_T4_Pve",
	storeItemId = 0,
	cant_be_bought  = true,
	drop_weight		= 0,
	
}	
-- BlastWave ракеты для Large_T4 ботов PvE
Def.BlastWave_SM_Cruise_T4_Pve =
{
	inherit = "BlastWave_SM_Cruise_T4_Mk3",
	damage_thermal = 1500,
}


-- cruise missle для Large_T5 ботов PvE
Def.SpaceMissile_Cruise_T5_Pve =
{
	inherit = "SpaceMissile_Cruise_T4_Pve",
	tier = 5,
}	
-- BlastWave ракеты для Large_T5 ботов PvE
Def.BlastWave_SM_Cruise_T5_Pve =
{
	inherit = "BlastWave_SM_Cruise_T4_Mk3",
}



-- TURRETS

-- уничтожаемая радарная станция для bigship_building
Def.Turret_Team2_Pve_TowerStation = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/control_tower/control_tower",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable		= true,
	health 			= 200000,
	special_object = true,
	vision_always = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,

	points_reward_kill = 50,
	points_reward_assist_damage = 150,

	relationship_group = 2,
	
	death_effect	= "particles/explosions/objects/tower_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	uiName = "Turret_TowerStation_name",
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 0, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 0, -15, 0 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 0 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 5, -10, 0 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 05, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, -30, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},
	vision_always = true,
	hack_immune		= true,
}

--союзная туррель(team1) для bigship_building
Def.Turret_Team1_Pve_PlayerRailgun =
{
	inherit 		= "Turret_RailGun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/round_railgun01/round_railgun01", 

	relationship_group = 1,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 5000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 60.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 500,
	projectile_speed = 70,
	
	damage_kinetic	= 200,
	damage_emp		= 0,
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	shot_effect 	= "particles/weapons/drongun/muzzle",

	death_effect	= "particles/explosions/objects/explosion_tiny",
	
	uiName = "Turret_RailGun_name",
}


-- враждебная туррель(team2) для bigship_building
Def.Turret_Team2_Pve_AiRailgun =
{
	inherit 	= "Turret_Team2_Pve_RailGun",
	fire_rate		= 100.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 90,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	damage_kinetic	= 300,
	damage_emp		= 0,
	damage_thermal	= 0,
	
	points_reward_kill = 20,
	points_reward_assist_damage = 70,
	
}


-- обычная турель AI для нормал мода PvEs
Def.Turret_Team2_Pve_FlakGun = 
{
	inherit			= "Turret_FlakGun",
	relationship_group = 2,
	health 			= 6000,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 80.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 100,
	
	damage_kinetic	= 500,
	damage_emp		= 0,
	damage_thermal	= 0,
	
	points_reward_kill = 20,
	points_reward_assist_damage = 70,
	
	uiName = "Turret_FlackGun_name",
}

-- пиратская туррель для изменённой PVE capture_repaibase
Def.Turret_Team2_Pve_Pirate_FlakGun = 
{
	inherit			= "Turret_Team2_Pve_FlakGun",
	uiName = "Turret_Pirate_FlackGun_name",
}

-- ракетная НУРС туррель AI для T2 мода Pve
Def.Turret_Team2_Pve_Standart_T2_RocketGun = 
{
	inherit			= "Turret_RocketGun",
	relationship_group = 2,
	health 			= 250000,
	signature		= ai.Signature.HUGE,
	projectile		= "SpaceMissile_AAMu_T2_Pve",
	hudType			= "default",
	hud_visibility_type = "major", 
	special_object  = true,
	vision_always = true,
	
	points_reward_kill = 50,
	points_reward_assist_damage = 200,
	points_reward_assist_debuff = 50,
	
	fire_rate		= 120.0,
	dispersion		= 1.0, -- deg
	max_range		= 250,
	max_rot_speed	= 25,	-- deg per second
	
	shield_def		= "Turret_Shield",
	
	uiName = "Turret_Pirate_RocketGun_name",
	hack_immune		= true,
}

--ракетная НУРС туррель AI для T4 мода Pve
Def.Turret_Team2_Pve_Standart_T4_RocketGun =
{
	inherit			= "Turret_Team2_Pve_Standart_T2_RocketGun",
	projectile		= "SpaceMissile_AAMu_T4_Pve",
	max_range		= 500,
	max_rot_speed	= 50,	-- deg per second
}

--ракетная НУРС туррель AI для T1 мода Pve
Def.Turret_Team2_Pve_Standart_T1_RocketGun =
{
	inherit			= "Turret_Team2_Pve_Standart_T2_RocketGun",
	projectile		= "SpaceMissile_AAMu_T1_Pve",
	max_range		= 200,
	fire_rate		= 90.0,
	max_rot_speed	= 15,	-- deg per second
	hack_immune		= true,
}


-- ракетная Cruisemissle туррель AI для T2 мода Pve
Def.Turret_Team2_Pve_Cruise_T2_RocketGun = 
{
	inherit			= "Turret_RocketGun",
	relationship_group = 2,
	health 			= 250000,
	signature		= ai.Signature.HUGE,
	projectile		= "SpaceMissile_Cruise_T1_RocketTurret_Pve",
	special_object = true,
	vision_always = true,	
	hudType			= "default",
	hud_visibility_type = "major", 
	
	points_reward_kill = 50,
	points_reward_assist_damage = 200,
	points_reward_assist_debuff = 50,
	
	fire_rate		= 12.0, --8
	dispersion		= 0.0, -- deg
	max_range		= 600,
	max_rot_speed	= 25,	-- deg per second
	
	shield_def		= "Turret_Shield",

	uiName = "Turret_Pirate_RocketGun_name",
	
	hack_immune		= true,
}

--ракетная Cruisemissle туррель AI для T4 мода Pve
Def.Turret_Team2_Pve_Cruise_T4_RocketGun =
{
	inherit			= "Turret_Team2_Pve_Cruise_T2_RocketGun",
	projectile		= "SpaceMissile_Cruise_T4_RocketTurret_Pve",
	max_range		= 900,
	max_rot_speed	= 50,	-- deg per second
	hack_immune		= true,
	no_friendly_fire = true,
}

--ракетная Cruisemissle туррель AI для T1 мода Pve
Def.Turret_Team2_Pve_Cruise_T1_RocketGun =
{
	inherit			= "Turret_Team2_Pve_Cruise_T2_RocketGun",
	projectile		= "SpaceMissile_Cruise_T1_RocketTurret_Pve",
	max_range		= 400,
	max_rot_speed	= 15,	-- deg per second
}

-- ракетная Voidmissle туррель AI для T2 мода Pve
Def.Turret_Team2_Pve_Void_T2_RocketGun = 
{
	inherit				= "Turret_RocketGun",
	relationship_group  = 2,
	health 				= 250000, 
	signature		= ai.Signature.HUGE,
	projectile			= "SpaceMissile_ThermalDamageZone_T2_Pve",
	special_object 		= true,
	vision_always		= true,
	hudType			= "default",
	hud_visibility_type = "major",
	
	points_reward_kill = 50,
	points_reward_assist_damage = 200,
	points_reward_assist_debuff = 50,
	
	fire_rate			= 20.0, --12.0
	dispersion			= 0.0, -- deg
	max_range			= 600,
	max_rot_speed		= 25,	-- deg per second
	shield_def			= "Turret_Shield",
	
	uiName = "Turret_Pirate_RocketGun_name",
	
	hack_immune		= true,
}

--ракетная Voidmissle туррель AI для T4 мода Pve
Def.Turret_Team2_Pve_Void_T4_RocketGun =
{
	inherit			= "Turret_Team2_Pve_Void_T2_RocketGun",
	projectile		= "SpaceMissile_ThermalDamageZone_T4_Pve",
	max_range		= 900,
	max_rot_speed	= 50,	-- deg per second
}

--ракетная Voidmissle туррель AI для T1 мода Pve
Def.Turret_Team2_Pve_Void_T1_RocketGun =
{
	inherit			= "Turret_Team2_Pve_Void_T2_RocketGun",
	projectile		= "SpaceMissile_ThermalDamageZone_T1_Pve",
	fire_rate		= 15.0,
	max_range		= 500,
	max_rot_speed	= 15,	-- deg per second
}

-- пиратская туррель для изменённой PVE capture_repaibase
Def.Turret_Team2_Pve_Pirate_PlasmaCannon =
{

	inherit			= "Turret_PlasmaCannon",
	relationship_group = 2,
	health 			= 400000,
	special_object = true,
	vision_always = true,
	hudType			= "default",
	hud_visibility_type = "major", 
	
	points_reward_kill = 50,
	points_reward_assist_damage = 200,
	
	uiName = "Turret_Pirate_PlasmaCannon_name",

	max_rot_speed	= 15,	-- deg per second
	shield_def		= "Turret_Shield",
	
	hack_immune		= true,
	damage_emp		= 3500,
}

-- invulnerability shield для пушек
Def.Turret_Shield =
{
	class			= "BaseEntity",
	model			= "models/shields/pve_shield", 
	physics			= { solid_type = solid.sphere, static = true, material = "EnergyShield", },
	in_editor		= false,
}

-- invulnerability shield для крейсера алиенов
Def.Cruiser_Shield =
{
	class			= "ScBaseEntity",
	model			= "models/objects/ships_huge/prec_cruiser/prec_cruiser_shield", 
	physics			= { solid_type = solid.model, kinematic = true, material = "EnergyShield", mass = 1000000, },
	in_editor		= false,
	--network_sync	= false,
	shield_activate_sound = "sound/raid/boss_shield_on",
	shield_deactivate_sound = "sound/raid/boss_shield_off",
	uiName = "Cruiser_Shield",
	hack_immune		= true,
}

-- уничтожимый щит для крейсера алиенов RW
Def.Cruiser_Shield_RW_t5 =
{
	class			= "ScBaseEntity",
	remove_on_death = false,
	--full_activate_revive = true,
	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_shield",
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "AlienShield", mass = 1000000, },
	--as_static		= true,
	in_editor		= false,

	hudType					= "default",
	hud_visibility_type 	= "minor", 

	relationship_group = ai.RelationshipGroups.Alien,
	--network_sync	= false,
	shield_activate_sound = "sound/raid/boss_shield_on",
	shield_deactivate_sound = "sound/raid/boss_shield_off",

	health 			= 2240000,
	damageable		= true,
	uiName 			= "Destroyer_Shield_name",
	
	death_effect	= "particles/ships/destroyer_shield_end",
	activate_after 	= 0.5,
	children = 
	{
		{ effect		= "particles/ships/destroyer_shield_start" },
	},
	uiName 			= "Cruiser_Shield",
	
	hack_immune		= true,
	
	gameplay_coef_group_id		= 0,
	gameplay_coef_min_lifetime	= 25,

}

Def.Cruiser_Shield_RW_t4 =
{
	inherit			= "Cruiser_Shield_RW_t5",
	health 			= 1440000,
	--broken_parts = {},
	gameplay_coef_min_lifetime	= 15,
}

Def.Cruiser_Shield_RW_t3 =
{
	inherit			= "Cruiser_Shield_RW_t5",
	health 			= 1280000,	--16
	--broken_parts = {},
	gameplay_coef_min_lifetime	= 10,
}

-- осколки щита осквернителя
Def.AlienShield_Wreck =
{
	class				= "ScBaseEntity",
	class				= "ScBaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.none, static = true, material = "EnergyShield", mass = 2000000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_wreck",
    --death_fade_time = 0.25,   
	death_fade_time = 4.0,  
}
Def.EnergyShield_Wreck =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "EnergyShield", mass = 100000, },
	model				= "models/shields/shield_horizontal",
    death_fade_time = 5,   
}

Def.EnergyShield_Wreck_Big =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "EnergyShield", mass = 200000, },
	model				= "models/shields/shield_horizontal_big",
    death_fade_time = 4,   
}

-- ракета имитирующая осколок щита осквернителя (запускается в каждого игрока при взрыве щита)	
Def.EnergyShield_Rocket1 =
{
	inherit				= "Weapon_BaseRocket",
	in_editor			= false,
	storeItemId			= 0,

	speed				= 90,
	max_range			= 600,
	time_to_live		= 5,

	flare_color			= "0 0 0 0",
	flare_size			= 0,
	model				= "models/shields/shield_horizontal",	--_big

	death_sound			= "sound/hit/rocket_direct_hit",
	explosion_blast_wave= "EnergyShield_Rocket_BlastWave",
	--launch_sound 		= "sound/raid/boss_rocket_launch",
	--work_sound			= "sound/raid/boss_rocket_fly",
	uiName  			= "EnergyShield_Wreck",
}

Def.EnergyShield_Rocket2 =
{
	inherit				= "EnergyShield_Rocket1",
	speed				= 100,
}

Def.EnergyShield_Rocket3 =
{
	inherit				= "EnergyShield_Rocket1",
	model				= "models/shields/shield_vertical",
	speed				= 120,
}

Def.EnergyShield_Rocket4 =
{
	inherit				= "EnergyShield_Rocket1",
	model				= "models/shields/shield_vertical",
	speed				= 140,
}

Def.EnergyShield_Rocket5 =
{
	inherit				= "EnergyShield_Rocket1",
	model				= "models/shields/shield_horizontal_big",
	speed				= 170,
}

-- удар осколком щита
Def.EnergyShield_Rocket_BlastWave =
{
	class				= "BlastWave",
	in_editor			= false,
	--effect 				= "particles/explosions/expl_2_alien", 
	damage				= 10000,	--_kinetic
	apply_damage		= true,
	apply_shake			= true,
	blast_maxDistance	= 10,
	blast_minDistance	= 2,
	intensity			= 45,
	
	light_color = "0 255 100 255",
	light_radius = 10,
	light_time = 0.5,
	
	--sound = "sound/explosion/alien_expl",
}

	
	
-- обычная рейлган туррель AI для нормал мода Pve
Def.Turret_Team2_Pve_RailGun = 
{	
	inherit = "Turret_RailGun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/round_railgun01/round_railgun01", 
	hudType			= "default",
	hud_visibility_type = "minor", 

	relationship_group = 2,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 3000,
	damageable		= true,
	
	points_reward_kill = 25,
	points_reward_assist_damage = 80,
	
	fire_rate		= 50.0, -- 60
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 110, --100
	
	damage_kinetic	= 840, -- 700 buf 0.9.13 + 9.14 + 9.20 
	damage_emp		= 0,
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	shot_effect 	= "particles/weapons/drongun/muzzle",

	death_effect	= "particles/explosions/objects/explosion_tiny",
	
	uiName = "Turret_RailGun_name",
}

-- пиратская туррель для изменённой PVE capture_repaibase
Def.Turret_Team2_Pve_Pirate_RailGun =
{
	inherit = "Turret_Team2_Pve_RailGun",
	uiName = "Turret_Pirate_RailGun_name",
}

-- рейлган для piratebay t4-t5
Def.Turret_PvePirate_RailGun =
{
	inherit 	= "Turret_Team2_Pve_RailGun",
	health 			= 3000,
	fire_rate		= 30.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 60,
	
	damage_kinetic	= 200,
	damage_emp		= 0,
	damage_thermal	= 0,
	hudType			= "default",
	hud_visibility_type = "minor", 
	
	model			= "models/turret/round_railgun01/round_railgun01_pirate",
	uiName = "Turret_PvePirate_Railgun_name",
	
	points_reward_kill = 20,
	points_reward_assist_damage = 70,

}

-- ракетная установка для piratebay t4-t5
Def.Turret_PvePirate_RocketGun = 
{
	inherit			= "Turret_RocketGun",
	relationship_group = 2,
	health 			= 4000,
	projectile		= "SpaceMissile_AAMu_T4_PiratePve",
	hudType			= "default",
	hud_visibility_type = "minor", 
	
	points_reward_kill = 40,
	points_reward_assist_damage = 130,
	points_reward_assist_debuff = 25,
	
	fire_rate		= 30.0,
	dispersion		= 1.0, -- deg
	max_range		= 210,
	max_rot_speed	= 15,	-- deg per second
	
	uiName = "Turret_PvePirate_RocketGun_name",
	model			= "models/turret/rocket_launcher/rocket_launcher_pirate",
	
	points_reward_kill = 30,
	points_reward_assist_damage = 70,
}


-- ракетная установка для туториала
Def.Turret_Tutorial_RocketGun = 
{
	inherit			= "Turret_RocketGun",
	relationship_group = 2,
	health 			= 8000,
	projectile		= "Turret_Tutorial_RocketGun_Missile",
	projectile_speed	= 500,
	hudType			= "default",
	hud_visibility_type = "major", 
	vision_always = true,
	hud_ico			= "Tutorial_Arrow",
	
	fire_rate		= 0.1,
	
	ping			= 5,
		
	uiName = "Turret_RocketGun_name",
}

Def.Turret_Tutorial_RocketGun_Missile = 
{
	inherit				= "Weapon_BaseRocket",
	in_editor			= false,
	storeItemId			= 0,
	model				= "models/weapons/missile_rocket",

	detonation_radius 	= 10,
	--is_guided			= true,
	--angular_velocity    = 100,
	max_range 			= 1500,
	flare_color 		= "255 150 100 15",
	flare_size			= 0.5,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	
	effect = "particles/weapons/missile/rocket_trail_small",	
	work_sound 			= "sound/weapons/rockets/rocket_fly",

	flare_texture 		= "textures/star_smooth",
	rocket_class		= ai.RocketClass.SMALL,
	
	explosion_blast_wave= "Turret_TutorialRocketGun_Missile_BlastWave",
}

Def.Turret_TutorialRocketGun_Missile_BlastWave =
{
	class				= "BlastWave",
	in_editor			= false,
	intensity			= 30,
	damage_emp			= 6666,
	blast_maxDistance	= 7.5,
	blast_minDistance	= 2,
	light_color 		= "255 100 0 100",
	light_radius 		= 20,
	light_time			= 0.8,
	effect 				= "particles/explosions/big_fire_2",
	sound				= "sound/explosion/small_rocket_expl",
}

-- рэйлган для туториала
Def.Turret_Tutorial_RailGun = 
{	
	inherit 		= "Turret_RailGun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/round_railgun01/round_railgun01", 
	hudType			= "major",
	hud_visibility_type = "major", 
	vision_always = true,
	hud_ico			= "Tutorial_Arrow",
	
	relationship_group = 2,
	health 			= 4000,	--#53519
	damageable		= true,
	fire_rate		= 30.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 150,
	max_range		= 230,
	projectile_speed = 60,
	damage_emp		 = 100,

	ping			= 5,
	
	uiName = "Training_target", 
}

-- станция для туториала
Def.Turret_Tutorial_TowerStation = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	inherit			= "Turret_Team2_Pve_TowerStation",
	health 			= 5000,
	special_object  = true,
	hudType			= "default",
	maxViewDist		= 5000,

	points_reward_kill = 0,
	points_reward_assist_damage = 0,

	relationship_group = 2,
	hack_immune		= true,
}

-- целевая рейлган туррель AI для Т3 Pve
Def.Turret_Team2_Pve_RailGun_T3 = 
{	
	inherit = "Turret_RailGun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/round_railgun01/round_railgun01", 
	hudType			= "default",
	hud_visibility_type = "minor", 
	
	relationship_group = 2,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 25000,
	damageable		= true,
	
	points_reward_kill = 20,
	points_reward_assist_damage = 70,
	
	fire_rate		= 60.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 90,
	
	damage_kinetic	= 1000,
	damage_emp		= 0,
	damage_thermal	= 0,
	
	max_rot_speed	= 60,	-- deg per second

	shot_effect 	= "particles/weapons/drongun/muzzle",

	death_effect	= "particles/explosions/objects/explosion_tiny",
	
	uiName = "Turret_RailGun_name",
}

-- ракетная Voidmissle туррель AI для T3 мода Pve
Def.Turret_Team2_Pve_Void_T3_RocketGun = 
{
	inherit				= "Turret_RocketGun",
	relationship_group  = 2,
	health 				= 20000, 
	projectile			= "SpaceMissile_AAMu_T3_PvE",
	special_object 		= true,
	vision_always = true,
	hudType				= "default",
	hud_visibility_type = "major",
	
	points_reward_kill = 50,
	points_reward_assist_damage = 200,
	points_reward_assist_debuff = 50,
	
	fire_rate			= 8.0, --12.0
	dispersion			= 0.0, -- deg
	max_range			= 700,
	max_rot_speed		= 20,	-- deg per second
	shield_def			= "Turret_Shield",
	
	uiName = "Turret_RocketGun_name",
}

-- ракета нурс T3
Def.SpaceMissile_AAMu_T3_PvE =
{
	inherit				= "SpaceMissile_AAMu_T3_Mk3",
	explosion_blast_wave= "BlastWave_SM_AAMu_T3_PvE",
	storeItemId			= 0,
}

-- взрыв нурс T3
Def.BlastWave_SM_AAMu_T3_PvE = 
{
	inherit				= "BlastWave_SM_AAMu_T3_Mk3",
	--damage_kinetic		= 2500,
	damage_thermal		= 300,
}







-- BEACONS

Def.VitalPoint_PVE_Ai_ControlStationA =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "BeaconA",
	health			= 5000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 20.0,
	regen_max_ally	= 1,
	decay_damage	= 100,
	decay_max_enemy = 1,
	
	vision_always = true,
}

Def.VitalPoint_PVE_Ai_ControlStationB =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "BeaconB",
	health			= 5000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 20.0,
	regen_max_ally	= 1,
	decay_damage	= 100,
	decay_max_enemy = 1,
	
	vision_always = true,
}

Def.VitalPoint_PVE_Ai_ControlStationC =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "BeaconC",
	health			= 5000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 20.0,
	regen_max_ally	= 1,
	decay_damage	= 100,
	decay_max_enemy = 1,
	
	vision_always = true,
}

-- деф для неуязвимого щита
Def.PvE_ShieldInvulnerability =
{
	in_editor		= true,
	model			= "models/shields/hugesphereshield", 
	physics			= { solid_type = solid.sphere, static = true, material = "Metal" },
	damageble		= false,
}




--ROCKETS

-- ракета cruise missle
Def.SpaceMissile_Cruise_T1_RocketTurret_Pve = 
{
	inherit				= "SpaceMissile_Cruise_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 50,
	max_range 			= 500,
	angular_velocity	= 15,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_Cruise_T1_Pve",
}

-- ракета cruise missle Т4
Def.SpaceMissile_Cruise_T4_RocketTurret_Pve = 
{
	inherit				= "SpaceMissile_Cruise_T1_Mk3",
	explosion_blast_wave= "BlastWave_SM_Cruise_T4_Pve",

	detonation_radius 	= 7,
	speed 				= 70,
	angular_velocity	= 35,
	storeItemId			= 0,
}

-- ракета cruise missle Т2
Def.SpaceMissile_Cruise_T2_RocketTurret_Pve = 
{
	inherit				= "SpaceMissile_Cruise_T2_Mk3",
	explosion_blast_wave= "BlastWave_SM_Cruise_T2_Pve",
	storeItemId			= 0,
}


-- взрыв cruise missle Т2
Def.BlastWave_SM_Cruise_T2_Pve = 
{
	inherit				= "BlastWave_SM_Cruise_T2_Mk3",
	in_editor			= false,

	damage_thermal		= 3000, --5000
	blast_maxDistance	= 10,
}

-- взрыв cruise missle Т1
Def.BlastWave_SM_Cruise_T1_Pve = 
{
	inherit				= "BlastWave_SM_Cruise_T2_Pve",
	damage_thermal		= 2000,
}

-- взрыв cruise missle Т4
Def.BlastWave_SM_Cruise_T4_Pve = 
{
	inherit				= "BlastWave_SM_Cruise_T2_Pve",
	damage_thermal		= 5000*2.5,
}

-- ракета нурс T1
Def.SpaceMissile_AAMu_T1_Pve =
{
	inherit				= "SpaceMissile_AAMu_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 2,
	speed 				= 80,
	max_range 			= 200,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_AAMu_T1_Pve",	
}

-- ракета нурс T2
Def.SpaceMissile_AAMu_T2_Pve =
{
	inherit				= "SpaceMissile_AAMu_T2_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 100,
	max_range 			= 250,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_AAMu_T2_Pve",	
}

-- взрыв нурс T1
Def.BlastWave_SM_AAMu_T1_Pve = 
{
	inherit				= "BlastWave_SM_AAMu_T1_Mk3",
	in_editor			= false,

	damage_kinetic		= 200, --500
	damage_thermal		= 0,
	damage_emp			= 0,
	blast_maxDistance	= 5,

}

-- взрыв нурс T2
Def.BlastWave_SM_AAMu_T2_Pve = 
{
	inherit				= "BlastWave_SM_AAMu_T2_Mk3",
	in_editor			= false,

	damage_kinetic		= 300, --500
	damage_thermal		= 0,
	damage_emp			= 0,
	blast_maxDistance	= 5,

}

-- ракета для piratebay t4-t5
Def.SpaceMissile_AAMu_T4_PiratePve =
{
	inherit				= "SpaceMissile_AAMu_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 25,
	max_range 			= 200,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_AAMu_T4_PiratePve",	
}

-- взрыв нурс для piratebay t4-t5
Def.BlastWave_SM_AAMu_T4_PiratePve = 
{
	inherit				= "BlastWave_SM_AAMu_T1_Mk3",
	in_editor			= false,

	damage_kinetic		= 400, --3500 но было ещё +1433 термала, и в итоге белый урон
	damage_thermal		= 0,
	damage_emp			= 0,
	blast_maxDistance	= 5,

}

-- ракета нурс T4
Def.SpaceMissile_AAMu_T4_Pve =
{
	inherit				= "SpaceMissile_AAMu_T1_Mk3",
	explosion_blast_wave= "BlastWave_SM_AAMu_T4_Pve",
	speed				= 140,
	storeItemId			= 0,
}

-- взрыв нурс T4
Def.BlastWave_SM_AAMu_T4_Pve = 
{
	inherit				= "BlastWave_SM_AAMu_T1_Mk3",
	damage_kinetic		= 2500, -- 500*2.5 но было ещё +1433 термала, и в итоге белый урон
	damage_thermal		= 0,
	damage_emp			= 0,
}



-- ракета voiddamage T2
Def.SpaceMissile_ThermalDamageZone_T2_Pve =
{
	inherit				= "SpaceMissile_Standart_T2_Mk3",
	in_editor			= false,
	max_range			= 500,
	storeItemId			= 0,
	spell				= "Pve_VoidZone_ThermalDamage_Missle_T2",
	launch_sound 		= "sound/weapons/rockets/pve_voidzone_rocket_launch",
}

-- ракета voiddamage T1
Def.SpaceMissile_ThermalDamageZone_T1_Pve =
{
	inherit				= "SpaceMissile_Standart_T1_Mk3",
	in_editor			= false,
	max_range			= 500,
	storeItemId			= 0,
	spell				= "Pve_VoidZone_ThermalDamage_Missle_T1",
	launch_sound 		= "sound/weapons/rockets/pve_voidzone_rocket_launch",
}

-- ракета voiddamage T4
Def.SpaceMissile_ThermalDamageZone_T4_Pve =
{
	inherit				= "SpaceMissile_Standart_T4_Mk3",
	in_editor			= false,
	max_range			= 600,
	speed				= 140,
	storeItemId			= 0,
	spell				= "Pve_VoidZone_ThermalDamage_Missle_T4",
	launch_sound 		= "sound/weapons/rockets/pve_voidzone_rocket_launch",
}

-- ракета voiddamage Raid_pve
Def.xSpaceMissile_ThermalDamageZone_Raid_Pve =
{
	inherit				= "SpaceMissile_Standart_T1_Mk3",
	model = "models/misc/invisible_model",
	in_editor			= false,
	speed				= 110,
	max_range			= 1300,
	time_to_live		= 12,
	angular_velocity	= 25,
	--flare_size			= 200,
	--flare_occl_size		= 10,
	--flare_aspect		= 10,
	--flare_warp			= 1.0,
	storeItemId			= 0,
		--flare_angle = 180,
		flare_color = "177 255 177 100",
		flare_size = 0.75, -- 1
		flare_nebulosity = 0.5,
	spell				= "VoidZone_Raid_Pve",
	effect 				= "PrecRocketMid",
	explosion_blast_wave= "xBlastWave_SM_Standart_Raid_Pve",
	launch_sound 		= "sound/raid/boss_rocket_launch",
	work_sound			= "sound/raid/boss_rocket_fly",
	uiName  			= "AlienRocket"
}

Def.xSpaceMissile_ThermalDamageZone_Raid_t4 =
{
	inherit				= "xSpaceMissile_ThermalDamageZone_Raid_Pve",
	explosion_blast_wave= "xBlastWave_SM_Standart_Raid_t4",
}

Def.xSpaceMissile_ThermalDamageZone_Raid_t3 =
{
	inherit				= "xSpaceMissile_ThermalDamageZone_Raid_Pve",
	explosion_blast_wave= "xBlastWave_SM_Standart_Raid_t3",
}


-- ракета voiddamage Raid_pve
Def.xSpaceMissile_ThermalDamageZone_Raid_Pve_Slow =
{
	inherit				= "xSpaceMissile_ThermalDamageZone_Raid_Pve",
	in_editor			= false,
	speed				= 55,
	max_range			= 550,
	angular_velocity	= 55,
}

Def.xSpaceMissile_ThermalDamageZone_Raid_t4_Slow =
{
	inherit				= "xSpaceMissile_ThermalDamageZone_Raid_Pve_Slow",
	explosion_blast_wave= "xBlastWave_SM_Standart_Raid_t4",
}

Def.xSpaceMissile_ThermalDamageZone_Raid_t3_Slow =
{
	inherit				= "xSpaceMissile_ThermalDamageZone_Raid_Pve_Slow",
	explosion_blast_wave= "xBlastWave_SM_Standart_Raid_t3",
}


-- ракета voiddamage Raid_pve W Spam
Def.RW_SpaceMissile_Spam_NoSound =
{
	inherit				= "Weapon_BaseRocket",
	storeItemId			= 0,
	in_editor			= false,
	model = "models/misc/invisible_model",
	speed				= 75,
	max_range			= 750,
	time_to_live		= 10,
	angular_velocity	= 60,
	detonation_radius	= 2,
	is_guided			= true,
	
		flare_angle = 180,
		--flare_color = "250 250 250 250",	-- белые
		flare_color = "0 250 125 64",	-- зелёные
		flare_size = 0.0,
		flare_nebulosity = 0.5,
		flare_occl_size	=1,
		flare_aspect	=1,
		flare_warp		=0.1,
	
	--model				= "models/weapons/rocket_raid",
	
	effect 				= "particles/weapons/smart_projectile",
	--spell				= "VoidZone_RW",
	explosion_blast_wave= "xBlastWave_RW_Spam",
	--launch_sound 		= "sound/raid/boss_rocket_launch",
	work_sound			= "sound/raid/boss_rocket_fly",
	uiName  			= "AlienRocket",
}

Def.RW_SpaceMissile_Spam =
{
	inherit				= "RW_SpaceMissile_Spam_NoSound",
	launch_sound 		= "sound/raid/boss_rocket_start",
}

Def.xBlastWave_RW_Spam =
{
	inherit 			= "BlastWave_SM_Standart_T5_Mk3",
	effect 				= "particles/explosions/expl_2_alien", 
	damage_emp			= 18000,	--20000 15000
	damage_kinetic		= 0,
	damage_thermal		= 0,
	
	effect 					= "particles/weapons/smart_explosion",
	light_color 			= "160 160 255 100",
	light_radius 			= 18,
	light_time 				= 1.2,

	sound = "sound/explosion/alien_expl",

}


Def.RW_SpaceMissile_Spam_NoSound_t4 =
{
	inherit				= "RW_SpaceMissile_Spam_NoSound",
	angular_velocity	= 55,
	explosion_blast_wave= "xBlastWave_RW_Spam_t4",
}

Def.RW_SpaceMissile_Spam_t4 =
{
	inherit				= "RW_SpaceMissile_Spam_NoSound_t4",
	launch_sound 		= "sound/raid/boss_rocket_start",
}

Def.xBlastWave_RW_Spam_t4 =
{
	inherit 			= "xBlastWave_RW_Spam",
	damage_emp			= 10000,	--9000
}


Def.RW_SpaceMissile_Spam_NoSound_t3 =
{
	inherit				= "RW_SpaceMissile_Spam_NoSound",
	angular_velocity	= 45,
	explosion_blast_wave= "xBlastWave_RW_Spam_t3",
}

Def.RW_SpaceMissile_Spam_t3 =
{
	inherit				= "RW_SpaceMissile_Spam_NoSound_t3",
	launch_sound 		= "sound/raid/boss_rocket_start",
}

Def.xBlastWave_RW_Spam_t3 =
{
	inherit 			= "xBlastWave_RW_Spam",
	damage_emp			= 7000,
}

Def.RW_SpaceMissile_Spam_OW =
{
	inherit				= "RW_SpaceMissile_Spam_NoSound",
	speed				= 200,
	angular_velocity	= 30,
	max_range			= 1500,
	time_to_live		= 8,
	launch_sound 		= "sound/raid/boss_rocket_start",
	explosion_blast_wave= "xBlastWave_OW_Spam",

	spell				= "SOps_AntiHuge_OW", -- доп спелл против эсмов 
}


Def.RW_SpaceMissile_Spam_OWC =
{
	inherit				= "RW_SpaceMissile_Spam_NoSound",
	speed				= 80,
	angular_velocity	= 90,
	max_range			= 6000,
	time_to_live		= 8,
	launch_sound 		= "sound/raid/boss_rocket_start",
	explosion_blast_wave= "xBlastWave_OW_Spam",
}


Def.xBlastWave_OW_Spam =
{
	inherit 			= "BlastWave_SM_Standart_T5_Mk3",
	effect 				= "particles/explosions/expl_2_alien", 
	damage_emp			= 30000,	--20000 15000
	damage_kinetic		= 0,
	damage_thermal		= 0,
	
	effect 					= "particles/weapons/smart_explosion",
	light_color 			= "160 160 255 100",
	light_radius 			= 18,
	light_time 				= 1.2,

	sound = "sound/explosion/alien_expl",

}



-- станящая ракета, прямолёт, станит из скрипта, а не при попадании
Def.xSpaceMissile_Raid_W_Stun =
{
	inherit				= "SpaceMissile_Standart_T1_Mk3",
	in_editor			= false,
	speed				= 35,
	max_range			= 400,
	time_to_live		= 10,
	angular_velocity	= 6,
	--flare_size			= 200,
	--flare_occl_size		= 10,
	--flare_aspect		= 10,
	--flare_warp			= 1.0,
	storeItemId			= 0,
		--flare_angle = 180,
		flare_color = "127 127 255 127",
		flare_size = 1,	--8
		flare_nebulosity = 0.5,
	effect 				= "particles/weapons/alien/alien_gun_projectile_big",
	model = "models/misc/invisible_model",
	spell				= "StunZone_Raid_W",
	explosion_blast_wave= "xBlastWave_SM_Standart_Raid_M_Spam",
	launch_sound 		= "sound/raid/boss_rocket_launch",
	work_sound			= "sound/raid/boss_rocket_fly",
	uiName  			= "AlienRocket",

	missile_defence_immune 	= true,	
	missile_detection_immune = true,
}


Def.xBlastWave_SM_Standart_Raid_Pve =
{
	inherit 			= "BlastWave_SM_Standart_T5_Mk3",
	effect 				= "particles/explosions/expl_2_alien", 
	damage_emp			= 22000,
	damage_kinetic		= 0,
	damage_thermal		= 0,
	
		light_color = "0 255 100 255",
		light_radius = 250,
		light_time = 1.0,
	sound = "sound/explosion/alien_expl",

}

Def.xBlastWave_SM_Standart_Raid_t4 =
{
	inherit 			= "xBlastWave_SM_Standart_Raid_Pve",
	damage_emp			= 15000,
}

Def.xBlastWave_SM_Standart_Raid_t3 =
{
	inherit 			= "xBlastWave_SM_Standart_Raid_Pve",
	damage_emp			= 11000,
}

-- ядерка voiddamage Raid_pve
Def.xSpaceMissile_Nuke_Raid_Pve =
{
	inherit				= "SpaceMissile_Nuke_T5_Mk3",
	in_editor			= false,
	storeItemId			= 0,
	effect 				= "",
		flare_color = "0 192 128 255",
		flare_size = 4,
		flare_nebulosity = 0.8,
	uiName  			= "AlienRocket",

	spell				= "VoidZone_Raid_Pve",
	explosion_blast_wave= "xBlastWave_SM_Standart_Raid_Pve",
}

-- ядерка voiddamage Raid_pve -- странный дубль
Def.MegaBomb_Raid_Pve_xxx =
{
	inherit				= "SpaceMissile_Nuke_T5_Mk3",
	explosion_blast_wave= "BlastWave_MegaBomb_Raid_Pve",
	in_editor			= false,
	storeItemId			= 0,
	time_to_live		= 1,
	uiName  			= "Megabomb_Raid_Pve_name",
}

-- взрыв на всю карту от мегабомбы (уже не используется)
Def.BlastWave_MegaBomb_Raid_Pve =
{
	inherit				= "BlastWave_SM_Standart_T5_Mk3",
	damage_emp			= 20000,
	damage_thermal		= 0,
	damage_kinetic		= 0,
	blast_maxDistance	= 5000,
	blast_minDistance   = 1,
	light_radius		= 200,
	light_time			= 2.8,
	apply_shake			= false,
	effect				= "particles/screen/interference",
}


---LOOT STATION----


-- railgun turret for loot station
Def.Turret_Team2_Pve_StationRailgun =
{
	inherit 	= "Turret_Team2_Pve_RailGun",
	health 			= 20000,
	fire_rate		= 80.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 90,
	hudType			= "default",
	hud_visibility_type = "minor", 
	
	damage_kinetic	= 400,
	damage_emp		= 0,
	damage_thermal	= 0,
	
	points_reward_kill = 20,
	points_reward_assist_damage = 70,
	
	hud_visibility_type	= "minor",
	
}

-- ракетная НУРС туррель AI для T2 мода Pve GeoStation
Def.Turret_Team2_PveGeoStation_Standart_T2_RocketGun = 
{
	inherit			= "Turret_RocketGun",
	relationship_group = 2,
	health 			= 25000,
	projectile		= "SpaceMissile_AAMu_T1_Station_Pve",
	hudType			= "default",
	hud_visibility_type = "major",  
	vision_always = true,
	
	points_reward_kill = 40,
	points_reward_assist_damage = 130,
	points_reward_assist_debuff = 25,
	
	fire_rate		= 40.0,
	dispersion		= 1.0, -- deg
	max_range		= 210,
	max_rot_speed	= 15,	-- deg per second
	
	uiName = "Turret_RocketGun_name",
	hack_immune		= true,
}

-- ракета нурс T2 для geostation
Def.SpaceMissile_AAMu_T1_Station_Pve =
{
	inherit				= "SpaceMissile_AAMu_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 100,
	max_range 			= 300,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_AAMu_T1_Station_Pve",	
}

-- ракета нурс T4 для geostation
Def.SpaceMissile_AAMu_T4_Station_Pve =
{
	inherit				= "SpaceMissile_AAMu_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 100,
	max_range 			= 300,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_AAMu_T4_Station_Pve",	
}

-- взрыв нурс T1 для geostation
Def.BlastWave_SM_AAMu_T1_Station_Pve = 
{
	inherit				= "BlastWave_SM_AAMu_T1_Pve",
	in_editor			= false,

	damage_kinetic		= 500,	--200 #83801
	blast_maxDistance	= 5,

}

-- взрыв нурс T1
Def.BlastWave_SM_AAMu_T4_Station_Pve = 
{
	inherit				= "BlastWave_SM_AAMu_T1_Pve",
	in_editor			= false,

	damage_kinetic		= 2000, --500
	damage_thermal		= 0,
	damage_emp			= 0,
	blast_maxDistance	= 5,

}

-- PIRATEBAY
-- генератор щита для piratebay
Def.PvE_HangarGenerator = 
{
	inherit			= "Turret_Team2_Pve_TowerStation",
	model			= "mapskit/maps/models/bigship/att_sys_power_block_in3", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 75000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	hack_immune		= true,

	points_reward_kill = 50,
	points_reward_assist_damage = 350,
	
	death_effect	= "particles/explosions/objects/explosion_small",
	
	vision_always = true,
	relationship_group = 2,
	
	uiName = "Pve_HangarGenerator_name",
}

-- большой генератор энергоблока для щита (самый первый)
Def.PvE_EnergyGeneratorBig = 
{
	inherit			= "Turret_Team2_Pve_TowerStation",
	model			= "mapskit/maps/models/bigship/power_block2_big", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 100000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	
	death_effect	= "particles/explosions/objects/explosion_big",	--#87192
	
	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = 2,
	hack_immune		= true,
	
	uiName = "Pve_EnergyGenerator_name",
}

Def.PvE_EnergyGeneratorBig_magsev = 
{
	inherit			= "Turret_Team2_Pve_TowerStation",
	class 			= "ScBaseEntity",
	model			= "mapskit/maps/models/bigship/power_block2_big", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 100000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	
	death_effect	= "particles/explosions/objects/explosion_big",	--#87192
	
	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = 1,
	hack_immune		= true,
	
	uiName = "Pve_EnergyGenerator_name",
}

Def.PvE_EnergyGeneratorBig_stealthPVE = 
{
	inherit			= "VitalPoint_Captureable",
	model			= "mapskit/maps/models/bigship/power_block2_big", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	health			= 15000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 200,
	decay_max_enemy = 1,
	vision_always = false,
	
	uiName = "Pve_EnergyGenerator_name",
}

-- тройной генератор энергоблока для щита (второй)
Def.PvE_EnergyGeneratorTriple = 
{
	inherit			= "Turret_Team2_Pve_TowerStation",
	model			= "mapskit/maps/models/bigship/power_block2_triple", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 75000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	
	death_effect	= "particles/explosions/objects/explosion_big",	--#87192
	
	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = 2,
	hack_immune		= true,
	
	uiName = "Pve_EnergyGenerator_name", 
}

-- длинный генератор энергоблока для щита (третий)
Def.PvE_EnergyGeneratorLong = 
{
	inherit			= "Turret_Team2_Pve_TowerStation",
	model			= "mapskit/maps/models/bigship/power_block2_line", 
	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 30000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	
	death_effect	= "particles/explosions/objects/explosion_big",	--#87192
	
	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = 2,
	hack_immune		= true,
	
	uiName = "Pve_EnergyGenerator_name",
} 

-- генератор ангара для piratebay
Def.PvE_PrisonGenerator = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "mapskit/maps/models/bigship/shield_generator2", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 50000,
	damageable			= true,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	death_effect	= "particles/explosions/objects/explosion_big",	--#87192
	work_sound	 = "sound/ambient/prison_generator",
	children = 
	{
		{ effect = "particles/areal/shield_generator2", joint = "root" },
	},
	
	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = 2,
	hack_immune		= true,
	
	uiName = "Pve_PrisonGenerator_name",
}

--Jumpgate for geostation
Def.PvE_Jumpgate =
{
	class 				= "ScBaseEntity",
	in_editor			= true,
	model				= "models/objects/jump_gates/warpgate_imper/warpgate_imper",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,

	full_activate_effect = "particles/other/wave_portal_open_big",

	children = 
	{
		{ effect = "particles/jumpgates/jumpgate_tutorial", joint = "root" },
	}
}

-- jumpgate for piratebay
Def.PvE_PirateJumpgate =
{
	inherit				= "PvE_Jumpgate",
	in_editor			= true,

	children = 
	{
		{ effect = "particles/jumpgates/jumpgate_tutorial", joint = "main" },
	},
	
	full_activate_effect = "particles/other/wave_portal_open_big",
}

-- Jumpgate for tutorial
Def.PvE_Tutorial_Jumpgate =
{
	inherit					= "PvE_Jumpgate",
	in_editor				= true,
	full_activate_effect    = "particles/other/wave_portal_open_big",
	hudType					= "target",
	
	ping					= 5,
	
	uiName = "Tutorial_gate_name",
}

-- Warpgate для конкурсной PvP карты(thar_concourse)
Def.Medium_WarpGate = 
{
	class		= "WarpGate",
	in_editor	= true,
	uiName		= "Module_WarpGate",
	model		= "models/objects/jump_gates/mediumwarpgate_imper/mediumwarpgate_imper",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" }, 
	warp_distance = 1000,
	warp_cooldown = 0.5,
	work_sound 	= "sound/gadgets/warpgate/wg_work_loop", 
	warp_sound = "sound/gadgets/warpgate/ship_warp_out",
	damageable		= false,
	relationship_group = 0,
	
	warp_forward = true,
	warp_check_angle = 80,
	warp_check_box_scale = 0.68,
	
	children = 
	{
		{ effect = "particles/jumpgates/mediumwarpgate_imper", joint = "main" },
	}
}


-- подставка для туррелей, используется только в дредноутах!
Def.Turret_Holder =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/turret/round_railgun01/round_railgun01_holder",
	physics			= { solid_type = solid.model, static = true, material = "Metal" }, 
	damageable		= false,

	points_reward_kill 			= 5,	--#84337 а то никакого эффекта за сбитие нет, пусть хоть что-то будет
	points_reward_assist_damage	= 25,
	exp_reward_kill 			= 5,
	exp_reward_assist_damage	= 25,
}


-- нижеследующие дефы относятся к PvE Jericho_base

-- союзная туррель(team1) для Jericho_base
Def.Turret_Team1_Pve_Jericho =
{
	inherit 		= "Turret_Team1_Pve_PlayerRailgun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 1,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 20000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 30.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 800,
	projectile_speed = 55,
	
	damage_kinetic	= 0,
	damage_emp		= 10000,
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_tiny",
	
	uiName = "Turret_RailGun_name",
	
	build_end_sound = "sound/game/turret_build_end",
	
	build_model		= "models/turret/plasma_turret/plasma_turret_jer_holo", 
	init_builded	= false,
	build_time		= 24.0,
	max_builders	= 4,
	build_beam_fx = "particles/other/build_beam",
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot",
   	rot_sound	= "sound/weapons/turret/turret_motor",	

}

--вражеская туррель(team2) с аванпоста для Jericho_base
Def.Turret_Team2_Pve_Jericho =
{
	inherit 		= "Turret_Team1_Pve_PlayerRailgun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 2,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 30000,
	death_damage_to_parent = 32000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 30.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 300,
	max_range		= 450,
	projectile_speed = 200,
	
	respawn_time 		= 3600.0,
	
	damage_kinetic	= 0,
	damage_emp		= 1000,
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_tiny",	
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot", 
	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName = "Jericho_RailGun_name",
	points_reward_assist_damage = 100,	
}

--турель для пве "всемером легче" - верхняя
Def.Turret_Team2_Pve_Jericho_MagSev_top =
{
	inherit 		= "Turret_Team2_Pve_Jericho",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 2,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 40000,
	death_damage_to_parent = 32000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 100.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 300,
	max_range		= 450,
	projectile_speed = 200,
	
	respawn_time 		= 3600.0,
	
	damage_kinetic	= 0,
	damage_emp		= 300,
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_tiny",	
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot", 
	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName = "Jer_Turret",
	points_reward_assist_damage = 100,	
}

--турель для пве "всемером легче" - нижняя
Def.Turret_Team2_Pve_Jericho_MagSev_bottom =
{
	inherit 		= "Turret_Team2_Pve_Jericho",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 2,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 35000,
	death_damage_to_parent = 32000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 100.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 300,
	max_range		= 450,
	projectile_speed = 200,
	
	respawn_time 		= 3600.0,
	
	damage_kinetic	= 0,
	damage_emp		= 300,
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_tiny",	
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot", 
	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName = "Jer_Turret",
	points_reward_assist_damage = 100,	
}

--вражеская стационарная туррель(team2) для Jericho_base
Def.Turret_Team2_Pve_JerichoBase =
{
	inherit 		= "Turret_Team1_Pve_PlayerRailgun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 2,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 32000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 20.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 300,
	max_range		= 350,
	projectile_speed = 200,
	
	respawn_time 		= 3600.0,
	
	damage_kinetic	= 0,
	damage_emp		= 1000,
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/empty",	
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot", 
	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName = "Jericho_RailGun_name",
	points_reward_assist_damage = 50,	
}

--вражеская стационарная туррель(team2) для Jericho_base
Def.Turret_Team2_Big_PvE_JerichoBase =
{
	inherit 		= "Turret_Team1_Pve_PlayerRailgun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/plasma_turret/big_plasma_turret_jer", 

	relationship_group = 2,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 100000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 20.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 300,
	max_range		= 450,
	projectile_speed = 150,
	
	respawn_time 		= 3600.0,
	
	damage_kinetic	= 0,
	damage_emp		= 1500,
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_mid",
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot", 
	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName = "Jericho_RailGun_name",
	points_reward_assist_damage = 100,	
}


-- уничтожаемая радарная станция для Debrissite
Def.TowerStation_Pve_Debrissite = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/control_tower/control_tower",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "ShipMetalMk1" },
	damageable		= true,
	health 			= 100000,
	special_object = true,
	vision_always = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,

	points_reward_kill = 50,
	points_reward_assist_damage = 450,

	relationship_group = 2,
	
	death_effect	= "particles/explosions/objects/tower_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	uiName = "Turret_TowerStation_name",
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


-- союзная туррель(team1) для Debrissite
Def.Turret_Team1_Pve_Debrissite =
{
	inherit 		= "Turret_RocketGun",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 1,

	health 			= 10000,
	damageable		= true,
	hudType			= "default",
	
	fire_rate		= 30.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 480,
	max_range		= 500,
	projectile		= "Turret_RocketGun_Missile_Debrissite1",
	
	max_rot_speed	= 90,	-- deg per second

	uiName = "Turret_Debrissite1_name",
	
	build_end_sound = "sound/game/turret_build_end",
	
	build_model		= "models/turret/plasma_turret/plasma_turret_jer_holo", 
	init_builded	= false,
	build_time		= 12.0 * 2,
	max_builders	= 4,
	build_beam_fx = "particles/other/build_beam",
}

-- союзная туррель(team1) для Debrissite
-- усиленные, строятся только на блокпосте 5 штук (2-3 из них ключевые для прохождения миссии)
Def.Turret_Team1_Pve_Debrissite3 =
{
	inherit 		= "Turret_Team1_Pve_Debrissite",
	model			= "models/turret/rocket_launcher/rocket_launcher",

	health 			= 30000,
	projectile		= "Turret_RocketGun_Missile_Debrissite3",
	build_time		= 18.0 * 2,
}

-- место для закладки бомбы, светится в целях раунда, убирается после постройки настоящей бомбы
Def.PvE_Debrissite_Bomb =
{
	class				= "ScBaseEntity",
	--inherit				= "LootCrate_Static",
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	special_object  	= true,
	vision_always	 	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	
	model			= "models/objects/gameplay/bombball/bombball_hologram",
	physics			= { solid_type = solid.none, static = true, material = "Metal" },
	
	points_reward_assist_damage = 100,

	relationship_group = 1,
	
	uiName		= "Debrissite_Bomb",
}

--
Def.PvE_Debrissite_BombBuild =
{
	class				= "ScBaseEntity",
	--inherit				= "LootCrate_Static",
	in_editor			= true,
	damageable			= false,
	hudType				= "default",
	hud_visibility_type = "minor",
	model			= "models/objects/gameplay/bombball/bombball",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	points_reward_assist_damage = 100,

	relationship_group = 1,

	build_end_sound = "sound/game/turret_build_end",
	
	--build_model		= "models/objects/gameplay/bombball/bombball_hologram", 
	init_builded	= false,
	build_time		= 6.0,
	max_builders	= 1,
	build_beam_fx = "particles/other/build_beam",
	
	uiName		= "Debrissite_Bomb",
}


--вражеская стационарная туррель(team2) для Debrissite
Def.Turret_Team2_Pve_Debrissite =
{
	inherit 		= "Turret_RocketGun",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 2,

	health 			= 20000,
	damageable		= true,
	hudType			= "default",
	
	fire_rate		= 20.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 300,
	max_range		= 450,
	projectile_speed = 200,
	projectile		= "Turret_RocketGun_Missile_Debrissite2",
	
	respawn_time 		= 3600.0,
	
	max_rot_speed	= 90,	-- deg per second

	uiName = "Turret_Debrissite2_name",
	
	points_reward_assist_damage = 50,	
}

--
Def.Turret_RocketGun_Missile_Debrissite1 = 
{
	inherit				= "Weapon_BaseRocket",
	in_editor			= false,
	model				= "models/weapons/missile_rocket",

	detonation_radius 	= 1,
	speed 				= 250,
	max_range 			= 500,
	flare_color 		= "255 150 100 15",
	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect = "particles/weapons/missile/rocket_trail_small",	
	work_sound 			= "sound/weapons/rockets/rocket_fly",

	flare_texture 		= "textures/star_smooth",
	rocket_class		= ai.RocketClass.SMALL,
	
	explosion_blast_wave= "Turret_RocketGun_Missile_BlastWave_Debrissite1",
}

--
Def.Turret_RocketGun_Missile_Debrissite2 = 
{
	inherit				= "Turret_RocketGun_Missile_Debrissite1",
	explosion_blast_wave= "Turret_RocketGun_Missile_BlastWave_Debrissite2",
}

--
Def.Turret_RocketGun_Missile_Debrissite3 = 
{
	inherit				= "Turret_RocketGun_Missile_Debrissite1",
	explosion_blast_wave= "Turret_RocketGun_Missile_BlastWave_Debrissite3",
}

--
Def.Turret_RocketGun_Missile_BlastWave_Debrissite1 =
{
	class				= "BlastWave",
	in_editor			= false,
	intensity			= 30,
	damage_thermal		= 10000,
	blast_maxDistance	= 7.5,
	blast_minDistance	= 2,
	light_color 		= "255 100 0 100",
	light_radius 		= 20,
	light_time			= 0.8,
	effect 				= "particles/explosions/big_fire_2",
	sound				= "sound/explosion/small_rocket_expl",
}

--
Def.Turret_RocketGun_Missile_BlastWave_Debrissite2 =
{
	inherit				= "Turret_RocketGun_Missile_BlastWave_Debrissite1",
	damage_thermal		= 5000,
}

--
Def.Turret_RocketGun_Missile_BlastWave_Debrissite3 =
{
	inherit				= "Turret_RocketGun_Missile_BlastWave_Debrissite1",
	damage_thermal		= 20000,
}


-- генератор энергоблока для щита на карте Jericho_base
Def.PvE_Debrissite_Generator = 
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 			= 10000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	
	model			= "mapskit/maps/models/bigship/power_block2_line", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	death_effect	= "",
	death_sound		= "sound/explosion/turret_expl",
	broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/explosion_big2_emp",  angle = 360, pos = Vec3( 11, 0, 0 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 3, },
		[ 2 ] = { effect = "particles/explosions/explosion_big2_emp",  angle = 360, pos = Vec3( 22, 0, 0 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 3, },
		[ 3 ] = { effect = "particles/explosions/explosion_big2_emp",  angle = 360, pos = Vec3( -11, 0, 0 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 3, },
		[ 4 ] = { effect = "particles/explosions/explosion_big2_emp",  angle = 360, pos = Vec3( -22, 0, 0 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 3, },
		[ 5 ] = { effect = "particles/explosions/explosion_big2_emp",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 3, },
	},
	
	points_reward_kill = 50,
	points_reward_assist_damage = 250,

	vision_always = true,
	relationship_group = 2,
	
	uiName = "Pve_EnergyGenerator_name",
} 



--платформа для туррели(team1) для Jericho_base
Def.Platform_Turret_Team1_Pve_Jericho =
{

	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/objects/gameplay/platform/platform_01", 
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },

}

--платформа для туррели(team2) для Jericho_base
Def.Platform_Turret_Team2_Pve_Jericho =
{

	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/objects/gameplay/platform/platform_02", 
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	death_effect	= "particles/explosions/objects/explosion_mid",
}

--платформа для туррели (team2) для Jericho_base
Def.Platform_Turret_Team2_Pve_Jericho2 =
{

	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/turret/round_railgun01/jericho_turret_holder_01", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	death_effect	= "",
}

-- радарная станция, которая строится в 3 раунде pve_jericho_base
Def.Radar_Station =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	
	relationship_group = 1,
		
	model			= "models/objects/vital_point/radar_station/radar_station_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" }, 
	damageable		= false,
	health			= 200000,
	relationship_group = 1,
	maxViewDist = 999999,
	
	hudType			= "major",
	hud_visibility_type = "major",
	
	uiName			= "BeaconA",

	build_end_sound = "sound/game/turret_build_end",
	
	--build_model		= "models/objects/vital_point/radar_station/radar_station_holo", 
	init_builded	= false,
	build_time		= 2.0,
	max_builders	= 4,
	build_beam_fx = "particles/other/build_beam",
	
		children = 
	{
		{ effect = "particles/objects/lightnings_radar", joint = "gun_2" },
		{ effect = "particles/objects/lightnings_radar2", joint = "gun_2" },
		{ effect = "particles/objects/lightnings_radar", joint = "gun_3" },
		{ effect = "particles/objects/lightnings_radar2", joint = "gun_3" },
		{ effect = "particles/objects/radar_ramp", joint = "gun_1" },
	}

}

--Аванпост (Team2) для Jericho_base
Def.PvE_JerichoAvanpost =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	spell_aura_target	= true,
	health 				= 420000,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	hudType				= "default",	
	hud_ico				= "jericho_avanpost_icon",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/vital_point/blockpost/jer_blockpost_01",
	hack_immune 		= true,
	vision_always 		= true,
	relationship_group 	= 2,
	death_effect		= "particles/explosions/objects/jericho_avanpost_explosion",
	death_wreck     	= "",

	--death_effect_delay = 0.05,
    --death_fade_time = 10.0,
	uiName				= "JerichoAvanpost",
	points_reward_assist_damage = 300,	
	death_sound		= "sound/explosion/avanpost_expl",
	
	children = 
	{
		{ def = "Turret_Team2_Pve_Jericho", joint = "gun_1" },
		{ def = "Turret_Team2_Pve_Jericho", joint = "gun_2" },
		{ def = "Turret_Team2_Pve_Jericho", joint = "gun_3" },
		{ def = "Turret_Team2_Pve_Jericho", joint = "gun_4" },
		{ def = "Turret_Team2_Pve_Jericho", joint = "gun_5" },
		{ def = "Turret_Team2_Pve_Jericho", joint = "gun_6" },

		{ effect = "particles/objects/avanpost_jer", joint = "fx1" },
		{ effect = "particles/objects/avanpost_jer", joint = "fx2" },
		{ effect = "particles/objects/avanpost_jer", joint = "fx3" },

		{ effect = "particles/areal/antenna_light_red", joint = "light1" },
		{ effect = "particles/areal/antenna_light_red", joint = "light2" },
		{ effect = "particles/areal/antenna_light_red", joint = "light3" },
		{ effect = "particles/areal/antenna_light_red", joint = "light4" },

		{ effect = "particles/areal/antenna_light_periodic", joint = "light5" },
		{ effect = "particles/areal/antenna_light_periodic", joint = "light6" },
		--{ effect = "particles/explosions/objects/jericho_avanpost_explosion", joint = "root" },
	},
	
	broken_parts = 
	{
		--big boxes
		{ def = "JerichoAvanpostWreck3",  debris = false, pos = Vec3( 55.0, 3.7, 5.2 ), ang_speed_deviation = 0,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		--{ def = "JerichoAvanpostWreck4",  debris = false, pos = Vec3( 55.0, 4.0, 33.0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "JerichoAvanpostWreck5",  debris = false, pos = Vec3( -9.5, 6.5, 33.0 ), ang_speed_deviation = 0.05,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "JerichoAvanpostWreck6",  debris = false, pos = Vec3( -20.0, 7.5, 5.0 ), ang_speed_deviation = 0.15,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		--small
		{ def = "JerichoAvanpostWreck2",  debris = false, pos = Vec3( 38.3, 21.0, 45.5 ), ang_speed_deviation = 0.5,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "JerichoAvanpostWreck8",  debris = false, pos = Vec3( 38.3, 11.0, -9.3 ), ang_speed_deviation = 0.5,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "JerichoAvanpostWreck9",  debris = false, pos = Vec3( 38.3, -23.0, -3.0 ), ang_speed_deviation = 0.5,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "JerichoAvanpostWreck10",  debris = false, pos = Vec3( 38.3, -17.0, 41.0 ), ang_speed_deviation = 0.5,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "JerichoAvanpostWreck1",  debris = false, pos = Vec3( 38.5, 40.5, -3.1 ), ang_speed_deviation = 0.5,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		
		--huge vertical
		{ def = "JerichoAvanpostWreck7",  debris = false, pos = Vec3( -9.2, -65, 0 ), ang_speed_deviation = 0.5,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "JerichoAvanpostWreck11",  debris = false, pos = Vec3( -9.3, 55.3, -5.0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "JerichoAvanpostWreck12",  debris = false, pos = Vec3( -9.3, -22.0, -7.0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		--{ def = "JerichoAvanpostWreck13",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), ang_speed_deviation = 0.1,dumping = 0.0, speed = 2, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		
		--part4 replace
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 55.0, 4.0, 33.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 55.0, 4.0, 33.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 55.0, 4.0, 33.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 60.0, 4.0, 33.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 60.0, 4.0, 33.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 60.0, 4.0, 33.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 50.0, 4.0, 33.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 50.0, 4.0, 33.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 50.0, 4.0, 33.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		
		--part13 replace
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( -9.3, 19.5, -14.0 ), angle = 360, ang_speed_deviation = 0.5,dumping = 0.0, speed = 10, speed_deviation = 1, speed_inherit = 0, ttl = 1800 },
	},
}

Def.JerichoAvanpostWreck1 =
{
	class 			= "BaseEntity",
	in_editor		= false,
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_01",
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	maxViewDist		= 9999,
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "fx1" },
	}
}

Def.JerichoAvanpostWreck2 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_02",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "fx1" },
		{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx2" },
		
	}
}

Def.JerichoAvanpostWreck3 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_03",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fireballs_big", joint = "fx1" },
		{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx2" },
		{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx3" },
		{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx4" },
	}
}
Def.JerichoAvanpostWreck4 =
{
	--inherit			= "JerichoAvanpostWreck1",
	class 			= "BaseEntity",
	in_editor		= false,
	maxViewDist		= 9999,
	death_fade_time = 1.0,
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_04",
	
	--children = 
	--{
	--	{ effect = "particles/explosions/objects/brokenparts_fireballs_big", joint = "fx1" },
	--	{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx2" },
	--}
}
Def.JerichoAvanpostWreck5 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_05",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fireballs_big", joint = "fx1" },
		{ effect = "particles/explosions/objects/brokenparts_fireballs_big", joint = "fx2" },
	}
}
Def.JerichoAvanpostWreck6 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_06",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fireballs_big", joint = "fx1" },
	}
}
Def.JerichoAvanpostWreck7 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_07",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "fx1" },
	}
}
Def.JerichoAvanpostWreck8 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_08",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "fx1" },
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "fx2" },
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "fx3" },
	}
}
Def.JerichoAvanpostWreck9 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_09",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "fx1" },
	}
}
Def.JerichoAvanpostWreck10 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_10",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx1" },
	}
}
Def.JerichoAvanpostWreck11 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_11",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx1" },
		{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx2" },
		{ effect = "particles/explosions/objects/brokenparts_fire", joint = "fx3" },
	}
}
Def.JerichoAvanpostWreck12 =
{
	inherit			= "JerichoAvanpostWreck1",
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_12",
	children = 
	{
		{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx1" },
		{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx2" },
	}
}
Def.JerichoAvanpostWreck13 =
{
	--inherit			= "JerichoAvanpostWreck1",
	class 			= "BaseEntity",
	in_editor		= false,
	maxViewDist		= 9999,
	model			= "models/objects/vital_point/blockpost/jericho_blockpost_wreck_13",
	--children = 
	--{
	--	{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx1" },
	--	{ effect = "particles/explosions/objects/brokenparts_fireballs", joint = "fx2" },
	--}
	death_fade_time = 1.0,
}

-- МАЯКИ
Def.VitalPoint_PvE_Jerichobase_ControlStationA =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/energy_station/energy_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "PvE_Jerichobase_ControlStationA",
	health			= 2000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 20.0,
	regen_max_ally	= 1,
	decay_damage	= 120,
	decay_max_enemy = 4,
	
	capture_radius	= 70.0,	--#77395 а то сквозь щит r=71 захватывают
	
	vision_always = true,

	children =
	{
		{ effect = "particles/objects/generator_lightning2", joint = "fx1"},
		{ effect = "particles/objects/generator_lightning2", joint = "fx2"},
		{ effect = "particles/objects/generator_lightning", joint = "fx3"},
		{ effect = "particles/objects/generator_lightning", joint = "fx4"},
	}
}

Def.VitalPoint_PvE_Jerichobase_ControlStationB =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/energy_station/energy_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "PvE_Jerichobase_ControlStationB",
	health			= 2000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 20.0,
	regen_max_ally	= 1,
	decay_damage	= 120,
	decay_max_enemy = 4,
	capture_radius	= 70.0,	--#77395 а то сквозь щит r=71 захватывают
	
	vision_always = true,

	children =
	{
		{ effect = "particles/objects/generator_lightning2", joint = "fx1"},
		{ effect = "particles/objects/generator_lightning2", joint = "fx2"},
		{ effect = "particles/objects/generator_lightning", joint = "fx3"},
		{ effect = "particles/objects/generator_lightning", joint = "fx4"},
	}
}

Def.VitalPoint_PvE_Jerichobase_ControlStationC =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/energy_station/energy_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "BeaconC",
	health			= 2000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 20.0,
	regen_max_ally	= 1,
	decay_damage	= 120,
	decay_max_enemy = 4,
	capture_radius	= 70.0,	--#77395 а то сквозь щит r=71 захватывают
	
	vision_always = true,

	children =
	{
		{ effect = "particles/objects/generator_lightning2", joint = "fx1"},
		{ effect = "particles/objects/generator_lightning2", joint = "fx2"},
		{ effect = "particles/objects/generator_lightning", joint = "fx3"},
		{ effect = "particles/objects/generator_lightning", joint = "fx4"},
	}
}
--END

--Заглушка для первого раунда Иерихонской ПвЕ
Def.VitalPoint_PvE_Jerichobase_ControlStationEmpty =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/objects/vital_point/energy_station/energy_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName			= "BeaconC",
	
	vision_always = true,

	children =
	{
		{ effect = "particles/objects/generator_lightning2", joint = "fx1"},
		{ effect = "particles/objects/generator_lightning2", joint = "fx2"},
		{ effect = "particles/objects/generator_lightning", joint = "fx3"},
		{ effect = "particles/objects/generator_lightning", joint = "fx4"},
	}
}

--дверь для (Team2) Jericho_base
Def.Door_Pve_Team2_Jericho =
{


	class 			= "ScBaseEntity",
	in_editor			= true,
	damageable			= false,
	health 				= 10000,
	model			= "models/objects/gameplay/door/jericho_door_01", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	relationship_group = 2,	
	special_object  = true,

	death_effect	= "particles/explosions/objects/explosion_big",
	death_sound		= "sound/explosion/turret_expl",

}

--эффект плоского щита для Jericho_base
Def.Door_Pve_Team2_JerichoFx =
{
	class 			= "ScBaseEntity",
	in_editor			= true,
	damageable			= false,
	model				= "models/shields/pve_shield_02", 
	physics				= { solid_type = solid.compound_model, static = true, material = "EnergyShield" },
	relationship_group = 2,	
	special_object  = true,
	
	fadeout_anim		= "dacegikmoquazaamaamaaj",
	fadeout_duration	= 0.1,
	shield_fadeout_sound = "sound/ambient/jericho_shield_off",
	
	hudType			= "major",
	hud_visibility_type = "major",
	
	uiName = "Door_name",
}

--трубка 1 для Jericho_base
Def.Tube_PveJericho01 =
{
	in_editor			= true,
	damageable			= false,
	network_sync			= true,
	model			= "models/objects/gameplay/tube/jericho_tube_01", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	death_effect	= "particles/explosions/explosion_big3_electric",
	death_sound		= "sound/explosion/turret_expl",	

}

--трубка 2 для Jericho_base
Def.Tube_PveJericho02 =
{
	in_editor			= true,
	damageable			= false,
	network_sync			= true,
	model			= "models/objects/gameplay/tube/jericho_tube_02", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	death_effect	= "particles/explosions/explosion_big3_electric",
	death_sound		= "sound/explosion/turret_expl",	
}

--трубка 3 для Jericho_base
Def.Tube_PveJericho03 =
{
	in_editor			= true,
	damageable			= false,
	network_sync			= true,
	model			= "models/objects/gameplay/tube/jericho_tube_03", 
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },

	death_effect	= "particles/explosions/explosion_big3_electric",
	death_sound		= "sound/explosion/turret_expl",	
}

--трубка 4 для Jericho_base
Def.Tube_PveJericho04 =
{
	in_editor			= true,
	damageable			= false,
	network_sync			= true,
	model			= "models/objects/gameplay/tube/jericho_tube_04", 
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	death_effect	= "particles/explosions/explosion_big3_electric",
	death_sound		= "sound/explosion/turret_expl",
}

-- генератор энергоблока для щита на карте Jericho_base
Def.PvE_Jericho_base_EnergyGenerator1 = 
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 			= 50000,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	
	model			= "mapskit/maps/models/bigship/power_block2_line", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	death_effect	= "particles/explosions/objects/explosion_big",
	death_sound		= "sound/explosion/turret_expl",

	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = 2,
	
	uiName = "Pve_EnergyGenerator_name",
	hack_immune		= true,
} 

-- генератор энергоблока для щита на карте Jericho_base
Def.PvE_Jericho_base_EnergyGenerator2 = 
{
	class				= "ScBaseEntity",
	in_editor			= true,
	maxViewDist		= 1,
	
	model			= "mapskit/maps/models/bigship/power_block2_line", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
} 

-- пушки всх типов для PVE t4 firerate/2 Mk1

Def.Weapon_Laser_Economic_PvE =
{
	inherit				= "Weapon_Laser_Economic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Laser_Economic_T4_Mk1.fire_rate * 0.4,
	damage_thermal		= Def.Weapon_Laser_Economic_T4_Mk1.damage_thermal * 1.25,
}

Def.Weapon_Railgun_Autofire_PvE =
{
	inherit				= "Weapon_Railgun_Autofire_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Railgun_Autofire_T4_Mk1.fire_rate * 0.4,
	damage_kinetic		= Def.Weapon_Railgun_Autofire_T4_Mk1.damage_kinetic * 1.25,
}

Def.Weapon_Sparks_Cannon_PvE =
{
	inherit				= "Weapon_Sparks_Cannon_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Sparks_Cannon_T4_Mk1.fire_rate * 0.5,
}

Def.Weapon_Plasmagun_Autofire_PvE =
{
	inherit				= "Weapon_Plasmagun_Autofire_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= 200,
	damage_emp			= Def.Weapon_Plasmagun_Autofire_T4_Mk1.damage_emp * 1.3,
}

Def.Weapon_Plasmagun_Basic_PvE =
{
	inherit				= "Weapon_Plasmagun_Basic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Plasmagun_Basic_T4_Mk1.fire_rate * 0.4,
	damage_emp			= Def.Weapon_Plasmagun_Basic_T4_Mk1.damage_emp * 1.25,
}

Def.Weapon_Laser_Heavy_PvE =
{
	inherit				= "Weapon_Laser_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Laser_Heavy_T4_Mk1.fire_rate * 0.4,
	damage_thermal		= Def.Weapon_Laser_Heavy_T4_Mk1.damage_thermal * 1.25,
}

Def.Weapon_Railgun_Sniper_PvE =
{
	inherit				= "Weapon_Railgun_Sniper_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Railgun_Sniper_T4_Mk1.fire_rate * 0.4,
	damage_kinetic		= Def.Weapon_Railgun_Sniper_T4_Mk1.damage_kinetic * 1.25,
}

Def.Weapon_Railgun_Basic_PvE =
{
	inherit				= "Weapon_Railgun_Basic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Railgun_Basic_T4_Mk1.fire_rate * 0.4,
	damage_kinetic		= Def.Weapon_Railgun_Basic_T4_Mk1.damage_kinetic * 1.25,
}

Def.Weapon_Cold_Ray_PvE =
{
	inherit				= "Weapon_Cold_Ray_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Cold_Ray_T4_Mk1.fire_rate * 0.5,
}

Def.Weapon_Railgun_Heavy_PvE =
{
	inherit				= "Weapon_Railgun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Railgun_Heavy_T4_Mk1.fire_rate * 0.4,
	damage_kinetic		= Def.Weapon_Railgun_Heavy_T4_Mk1.damage_kinetic * 1.25,

	dispersion			= 6,
	dispersion_max		= 6,	
}

Def.Weapon_Plasmagun_HHH_PvE =
{
	inherit				= "Weapon_Plasmagun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Plasmagun_Heavy_T4_Mk1.fire_rate * 0.4,
	damage_emp			= Def.Weapon_Plasmagun_Heavy_T4_Mk1.damage_emp * 1.0,

	projectile		= "Projectile_BossSingularityCannon",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_2_beam",
}

Def.Weapon_Laser_Basic_PvE =
{
	inherit				= "Weapon_Laser_Basic_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	damage_thermal		= Def.Weapon_Laser_Basic_T4_Mk1.damage_thermal * 0.5,
}

Def.Weapon_Laser_Sniper_PvE =
{
	inherit				= "Weapon_Laser_Sniper_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Laser_Sniper_T4_Mk1.fire_rate * 0.6,
	fire_rate_add		= Def.Weapon_Laser_Sniper_T4_Mk1.fire_rate_add * 0.6,
	fire_rate_max		= Def.Weapon_Laser_Sniper_T4_Mk1.fire_rate_max * 0.7,
	damage_thermal		= Def.Weapon_Laser_Sniper_T4_Mk1.damage_thermal * 1.25,
}

Def.Weapon_Nanobots_Cloud_PvE =
{
	inherit				= "Weapon_Nanobots_Cloud_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Nanobots_Cloud_T4_Mk1.fire_rate * 0.5,
}

Def.Weapon_Plasmagun_Sniper_PvE =
{
	inherit				= "Weapon_Plasmagun_Sniper_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Plasmagun_Sniper_T4_Mk1.fire_rate * 0.4,
	damage_emp			= Def.Weapon_Plasmagun_Sniper_T4_Mk1.damage_emp * 1.25,
}

Def.Module_Empty_PvE =
{
	class				= "SpaceShipModule",
	in_editor			= false,
}

Def.Module_Disintegrator_T4_PvE =
{
	inherit				= "Module_Disintegrator_T4_Base",
	storeItemId			= 0,
	cant_be_bought  	= true,
	optimal_range		= 3000,
	max_range			= 5000,
	damage_thermal		= 5000,
	fire_rate			= 12,
	projectile_speed	= 800,
}

-- турель для крейсера алиенов в ПВЕ-рейде
Def.Turret_CruiserAlien =
{
	class 			= "Turret",
	in_editor		= false,
	model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret", 

	relationship_group = ai.RelationshipGroups.Alien,

	physics			= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk3", mass = 1000000, },
	health 			= 120000,
	death_damage_to_parent = 200000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	respawn_time	= 45.0,
	
	fire_rate		= 60.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 400,
	max_range		= 600,
	projectile_speed = 220,
	
	damage_kinetic	= 0,
	damage_emp		= 6000,
	damage_thermal	= 0,
	
	max_rot_speed	= 0,	-- deg per second
	max_fire_angle 	= 60,	-- 45

	projectile		= "Projectile_CruiserGun",
	shot_effect 	= "particles/weapons/alien/prec_cruiser_gun_muzzle",
	death_effect	= "particles/explosions/objects/alien_explosion",
	death_sound		= "sound/explosion/drone_expl",	
	shot_once_sound = "sound/weapons/turret/alien_cruiser_oneshot", 
--	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName = "CruiserAlien_Turret_name",
	points_reward_assist_damage = 100,

	children = {{def = "PrecCruiserGun",	joint = "root"},},
	
	hack_immune		= true,
	
	gameplay_coef_group_id		= 0,
	gameplay_coef_min_lifetime	= 10,
}

Def.Turret_CruiserAlien_t4 =
{
	inherit			= "Turret_CruiserAlien",
	optimal_range	= 270,
	max_range		= 540,
	projectile_speed = 200,
	damage_emp		= 3500,
	health 			= 50000,
	death_damage_to_parent = 140000,
	gameplay_coef_min_lifetime	= 5,
}

Def.Turret_CruiserAlien_t3 =
{
	inherit			= "Turret_CruiserAlien",
	optimal_range	= 250,
	max_range		= 500,
	projectile_speed = 170,
	damage_emp		= 2500,
	health 			= 35000,
	death_damage_to_parent = 100000,
	gameplay_coef_min_lifetime	= 2,
}

Def.Turret_CruiserAlien_Low =
{
	inherit			= "Turret_CruiserAlien",
	optimal_range	= 100,
	max_range		= 200,
	projectile_speed = 120,
	damage_emp		= 1000,
	health 			= 35000,
	death_damage_to_parent = 100000,
}


Def.Turret_CruiserAlienSmall =
{
	inherit			= "Turret_CruiserAlien",
	model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret_small", 

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
}

Def.Turret_CruiserAlienSmall_t4 =
{
	inherit			= "Turret_CruiserAlien_t4",
	model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret_small", 

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
}

Def.Turret_CruiserAlienSmall_t3 =
{
	inherit			= "Turret_CruiserAlien_t3",
	model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret_small", 

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
}

Def.Turret_CruiserAlienSmall_Low =
{
	inherit			= "Turret_CruiserAlien_Low",
	model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret_small", 

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
}


-- турель для крейсера алиенов в ПВЕ-рейде
Def.TurretPlasma_CruiserAlien =
{
	inherit			= "Turret_CruiserAlien",
	health 			= 100000,
	death_damage_to_parent = 200000,
	signature		= ai.Signature.TINY,
	
	fire_rate		= 40.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 400,
	max_range		= 600,
	projectile_speed = 130,
	
	damage_kinetic	= 0,
	damage_emp		= 10000,
	damage_thermal	= 0,
	
	max_rot_speed	= 0,	-- deg per second
	max_fire_angle 	= 60,	-- 45

	projectile			= "Projectile_CruiserAlienPlasma",
	shot_once_sound 	= "sound/weapons/aliengun/ag_shot",
	shot_effect 	= "particles/weapons/alien/prec_cruiser_gun_muzzle",
	death_effect	= "particles/explosions/objects/alien_explosion",
	death_sound		= "sound/explosion/drone_expl",	
	
	uiName = "CruiserAlien_Turret_name",
	points_reward_assist_damage = 150,

	children = {{def = "PrecCruiserGun",	joint = "root"},},
	
	hack_immune		= true,
	
	gameplay_coef_group_id		= 0,
	gameplay_coef_min_lifetime	= 10,

}

Def.TurretPlasma_CruiserAlien_t4 =
{
	inherit			= "TurretPlasma_CruiserAlien",
	optimal_range	= 270,
	max_range		= 540,
	projectile_speed = 120,
	damage_emp		= 7000,
	health 			= 70000,
	death_damage_to_parent = 150000,
	gameplay_coef_min_lifetime	= 5,
}

Def.TurretPlasma_CruiserAlien_t3 =
{
	inherit			= "TurretPlasma_CruiserAlien",
	optimal_range	= 250,
	max_range		= 500,
	projectile_speed = 100,
	damage_emp		= 5000,
	health 			= 50000,
	death_damage_to_parent = 125000,
	gameplay_coef_min_lifetime	= 2,
}

Def.TurretPlasma_CruiserAlien_Low =
{
	inherit			= "TurretPlasma_CruiserAlien",
	optimal_range	= 100,
	max_range		= 200,
	projectile_speed = 90,
	damage_emp		= 1000,
	health 			= 50000,
	death_damage_to_parent = 125000,
}


Def.TurretPlasma_CruiserAlienSmall =
{
	inherit			= "TurretPlasma_CruiserAlien",
	model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret_small", 

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
}

Def.TurretPlasma_CruiserAlienSmall_t4 =
{
	inherit			= "TurretPlasma_CruiserAlien_t4",
	model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret_small", 

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
}

Def.TurretPlasma_CruiserAlienSmall_t3 =
{
	inherit			= "TurretPlasma_CruiserAlien_t3",
	model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret_small", 

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
}

Def.TurretPlasma_CruiserAlienSmall_Low =
{
	inherit			= "TurretPlasma_CruiserAlien_Low",
	model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret_small", 

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
}

Def.Projectile_CruiserAlienPlasma  =
{
	inherit			= "Weapon_BaseRocket",
	explosion_blast_wave 	= "Blastwave_CruiserAlienPlasma",
	override_blast_wave_damage = true,
	detonation_radius		= 6,
	model			= "", 
	flare_color			= "100 255 100 20",
	flare_size			= 1.0, -- 3
	flare_angle			= 180,
	flare_nebulosity	= 0.2,
	effect 				= "particles/weapons/nanobots_trail",
	work_sound			= "sound/raid/boss_green_rocket_fly",

	missile_defence_immune 	= true,	
	missile_detection_immune = true,

	effect 			= "particles/weapons/alien/alien_gun_projectile", 
	--shadowCaster	= false,
	--impact_type 	= "plasma",
	--is_guided		= true,
	--angular_velocity= 15,
}

Def.Blastwave_CruiserAlienPlasma  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_maxDistance		= 12,
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/alien/alien_gun_explosion",
	light_color 			= "100 255 100 100",
	light_radius 			= 20,
	light_time 				= 0.8,
	sound 					= "sound/explosion/BattleDrone_large_expl",
}


-- RW
--=====================================================================================================================================================================
--таблицы hp и урона родителю (по текам, актуально 3-5)
--=====================================================================================================================================================================
-- --туррели х2
-- rw_th = {1,1, 10000, 100000, 200000}
-- rw_tp = {1,1, 50000, 200000, 400000}
-- rw_td = {1,1,  4000,   1600,   3000}

-- -- лазеры
-- rw_ld = {1,1,  1000,   1600,   3000}
-- rw_md = {1,1, 30000,  60000, 100000}

-- --=====================================================================================================================================================================
-- --скорлупа (+время респа) 0.2
-- rw_sh = {1,1,600000,1000000, 1200000}
-- rw_sp = {1,1,120000, 200000,  240000}
-- rw_sr = {1,1,  9999,     25,      18}
-- --=====================================================================================================================================================================
-- --сердца х5
-- rw_lh = {1,1, 200000, 400000, 800000}
-- rw_lp = {1,1,1000000,2000000,4000000}

-- --стабилизаторы х5
-- rw_bh = {1,1, 100000, 250000, 600000}
-- rw_bp = {1,1, 500000,1250000,3000000}
--=====================================================================================================================================================================
--=====================================================================================================================================================================
--=====================================================================================================================================================================
--=====================================================================================================================================================================
-- --туррели х2 (для тестов на т3 х5 и обновление посередене фазы)
-- rw_th = {1,1, 11000,  22000,  44000}
-- rw_tp = {1,1, 34000,  68000, 135000}
-- rw_td = {1,1,  3000,   4500,   7500}

-- -- лазеры
-- rw_ld = {1,1,  1000,   1500,   2500}
-- rw_md = {1,1, 30000,  45000,  75000}
-- --=====================================================================================================================================================================
-- --скорлупа (+время респа) 0.2
-- rw_sh = {1,1,400000, 600000,  800000}
-- rw_sp = {1,1,100000, 150000,  200000}
-- rw_sr = {1,1,  9999,     25,      18}
-- --=====================================================================================================================================================================
-- --сердца х5 (разделено на 2 равные части сразу и при смерти)
-- rw_lh = {1,1, 200000, 500000, 800000}
-- rw_lp = {1,1, 500000,1250000,2000000}

-- --стабилизаторы х5
-- rw_bh = {1,1, 100000, 300000, 500000}
-- rw_bp = {1,1, 500000,1500000,2500000}

--=====================================================================================================================================================================
--туррели х2 (для тестов на т3 х5 и обновление посередене фазы)
-- rw_th = {1,1, 15000,  27000,  50000}
-- rw_tp = {1,1, 45000,  80000, 150000}
-- rw_td = {1,1,  3500,   5000,   8500}

-- -- лазеры
-- rw_ld = {1,1,  1200,   2000,   3000}
-- rw_md = {1,1, 30000,  45000,  75000}
-- --=====================================================================================================================================================================
-- --скорлупа (+время респа) 0.2
-- rw_sh = {1,1,500000, 800000,  800000}
-- rw_sp = {1,1,100000, 150000,  200000}
-- rw_sr = {1,1,  9999,     25,      18}
-- --=====================================================================================================================================================================
-- --сердца х5 (разделено на 2 равные части сразу и при смерти)
-- rw_lh = {1,1, 300000, 600000, 900000}
-- rw_lp = {1,1, 600000,1500000,2500000}

-- --стабилизаторы х5
-- rw_bh = {1,1, 120000, 350000, 600000}
-- rw_bp = {1,1, 500000,1500000,2500000}

-- --              12k,    30k,    80k
-- --туррели х2 (для тестов на т3 х5 и обновление посередене фазы)
-- rw_th = {1,1, 15000,  27000,  50000}
-- rw_tp = {1,1, 45000,  80000, 150000}
-- rw_td = {1,1,  3500,   5000,   8500}

-- -- лазеры
-- rw_ld = {1,1,  1200,   2000,   3000}
-- rw_md = {1,1, 30000,  45000,  75000}
-- --=====================================================================================================================================================================
-- --скорлупа (+время респа) 0.2
-- rw_sh = {1,1,500000, 800000, 1000000}
-- rw_sp = {1,1,100000, 150000,  200000}
-- rw_sr = {1,1,  9999,     25,      20}
-- --=====================================================================================================================================================================
-- --сердца х5 (разделено на 2 равные части сразу и при смерти)
-- rw_lh = {1,1, 300000, 600000, 900000}
-- rw_lp = {1,1, 600000,1500000,2250000}

-- --стабилизаторы х5
-- rw_bh = {1,1, 120000, 350000, 550000}
-- rw_bp = {1,1, 500000,1500000,2500000}

--нерф т4 =====================================================================================================================================================================
--              12k,    27k,    80k
-- --туррели х2 (для тестов на т3 х5 и обновление посередене фазы)
-- rw_th = {1,1, 15000,  25000,  50000}
-- rw_tp = {1,1, 45000,  75000, 150000}
-- rw_td = {1,1,  3000,   4000,   7000}

-- -- лазеры
-- rw_ld = {1,1,  1200,   1800,   3000}
-- rw_md = {1,1, 30000,  40000,  70000}
-- --=====================================================================================================================================================================
-- --скорлупа (+время респа) 0.2
-- rw_sh = {1,1,500000, 750000, 1000000}
-- rw_sp = {1,1,100000, 150000,  200000}
-- rw_sr = {1,1,  9999,     25,      20}
-- --=====================================================================================================================================================================
-- --сердца х5 (разделено на 2 равные части сразу и при смерти)
-- rw_lh = {1,1, 300000, 600000, 900000}
-- rw_lp = {1,1, 600000,1500000,2250000}

-- --стабилизаторы х5
-- rw_bh = {1,1, 120000, 300000, 550000}
-- rw_bp = {1,1, 500000,1200000,2500000}

-- -- нерф т5 =====================================================================================================================================================================
-- --              12k,    27k,    72k
-- --туррели х2 (для тестов на т3 х5 и обновление посередене фазы)
-- rw_th = {1,1, 15000,  25000,  45000}
-- rw_tp = {1,1, 45000,  75000, 140000}
-- rw_td = {1,1,  3000,   4000,   6000}

-- -- лазеры
-- rw_ld = {1,1,  1200,   1800,   2800}
-- rw_md = {1,1, 30000,  40000,  65000}
-- --=====================================================================================================================================================================
-- --скорлупа (+время респа) 0.2
-- rw_sh = {1,1,500000, 750000, 1000000}
-- rw_sp = {1,1,100000, 150000,  200000}
-- rw_sr = {1,1,  9999,     25,      20}
-- --=====================================================================================================================================================================
-- --сердца х5 (разделено на 2 равные части сразу и при смерти)
-- rw_lh = {1,1, 300000, 600000, 850000}
-- rw_lp = {1,1, 600000,1500000,2000000}

-- --стабилизаторы х5
-- rw_bh = {1,1, 120000, 300000, 500000}
-- rw_bp = {1,1, 500000,1200000,2300000}

-- нерф т5 =====================================================================================================================================================================
--              12k,    27k,    72k
--туррели х2 (для тестов на т3 х5 и обновление посередене фазы)
rw_th = { 1,1, 60000,  100000,  180000 }
rw_tp = { 1,1, 50000,  90000, 130000 }
rw_td = { 1,1,  3000,   4000,   6000 }  -- дамаг туррелей

-- лазеры
rw_ld = { 1,1,  1200,   1800,   2800 } -- термо дамаг в сек
rw_md = { 1,1, 30000,  40000,  65000 } -- большой лазер урон 
--=====================================================================================================================================================================
--скорлупа (+время респа) 0.2 
rw_sh = { 1,1, 3200000, 5600000, 6400000 }  --health
rw_sp = { 1,1, 1000000, 1750000, 1800000 }  --damage to parent
rw_sr = { 1,1,  30,     25,     20}
--=====================================================================================================================================================================
--сердца х5 (разделено на 2 равные части сразу и при смерти)
rw_lh = { 1,1, 1200000,  1600000, 4000000 }
rw_lp = { 1,1, 3000000, 6000000, 6000000 }

--стабилизаторы х5
rw_bh = { 1,1, 240000, 640000, 1200000 }
rw_bp = { 1,1, 750000, 1500000, 3000000 }


-- турель для крейсера алиенов в обновлённом ПВЕ-рейде
-- G используетсяч только для основы, не вставляется никуда
Def.Turret_CruiserAlien_T5G =
{
	class 			= "Turret",
	in_editor		= false, 
	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_gun_01", 
	

	relationship_group = ai.RelationshipGroups.Alien,
	no_friendly_fire = true,

	physics			= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 1000000, },
	signature		= ai.Signature.SMALL,
	health 					= rw_th[5],
	death_damage_to_parent	= rw_tp[5],
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	respawn_time	= 9999,
	
	fire_rate		= 300.0,	--40
	dispersion		= 0.0, -- deg
	optimal_range	= 500,
	max_range		= 550,
	projectile_speed = 300,
	
	damage_kinetic	= 0,
	damage_emp		= 200,	--x100
	damage_thermal	= 0,
	
	max_rot_speed	= 0,	-- deg per second
	max_fire_angle 	= 60,	-- 45

	projectile		= "Projectile_T5G",
	shot_effect 	= "particles/weapons/alien/prec_cruiser_gun_muzzle",
	death_effect	= "particles/explosions/objects/alien_explosion",
	death_sound		= "sound/explosion/drone_expl",	
	--shot_once_sound = "sound/weapons/turret/alien_cruiser_oneshot", 
--	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName = "CruiserAlien_Turret_name",
	points_reward_assist_damage = 100,

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
	
	gameplay_coef_group_id		= 0,
	gameplay_coef_min_lifetime	= 3,

}

Def.Projectile_T5G  =
{
	inherit			= "Projectile_SingularityCannon",
	hit_effect		= "particles/weapons/alien/reaver_gun_hit",
	effect 			= "particles/weapons/alien/reaver_gun_projectile",
	damage_radius	= 3,
}

-- типа лазеры, (не стреляет, чисто объект для уничтождения, лазеры спавнятся рядом из скрипта)
Def.Turret_CruiserAlien_T5L =
{
	inherit			= "Turret_CruiserAlien_T5G",
	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_gun_02",
	fire_rate		= 0.0001,	-- тут будут читолазеры через скрипт
	dispersion		= 0.0, -- deg
	optimal_range	= 5,
	max_range		= 1500,
	projectile_speed = 5,
	
	damage_kinetic	= 0,
	damage_emp		= 80,	--x100
	damage_thermal	= 0,
	
	max_rot_speed	= 0,	-- deg per second
	max_fire_angle 	= 360,	-- 45

	projectile			= "Projectile_T5L",
	shot_once_sound 	= "sound/weapons/aliengun/ag_shot",

	muzzleflash_color = { kinetic = "80 210 80 128", emp = "80 210 80 128", thermal = "80 210 80 128", },
	shot_effect 	= "",
	death_effect	= "particles/explosions/objects/alien_explosion",
	death_sound		= "sound/explosion/drone_expl",	
	
--	shot_once_sound = "sound/weapons/turret/alien_cruiser_oneshot",
	
	uiName = "CruiserAlien_Turret_name",
	points_reward_assist_damage = 100,

	children = {{def = "PrecCruiserGun",	joint = "fx"},},
	hack_immune 	= true,
}

Def.Projectile_T5L  =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/laser/laser_asteroid_hit",
	effect 			= "PrecRocketSmall",

	shadowCaster		= false,
	impact_type 		= "plasma",
}

-- шары (пулемёты)
Def.Turret_CruiserAlien_T5R =
{
	inherit			= "Turret_CruiserAlien_T5G",
	--health 			= 100000,
	--death_damage_to_parent = 300000,
	
	fire_rate		= 300.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 400,
	max_range		= 600,
	projectile_speed = 200,
	
	damage_kinetic	= 0,
	damage_emp		= rw_td[5],
	damage_thermal	= 0,
	
	max_rot_speed	= 0,	-- deg per second
	max_fire_angle 	= 60,	-- 45

	projectile			= "Projectile_T5R",
	--shot_once_sound 	= "sound/weapons/aliengun/ag_shot",

	muzzleflash_color = { kinetic = "80 210 80 128", emp = "80 210 80 128", thermal = "80 210 80 128", },
	shot_effect 	= "particles/weapons/alien/reaver_gun_muzzle",
	death_effect	= "particles/explosions/objects/alien_explosion",
	death_sound		= "sound/explosion/drone_expl",	
	
--	shot_once_sound = "sound/weapons/turret/alien_cruiser_oneshot",
	
	uiName = "CruiserAlien_Turret_name",
	points_reward_assist_damage = 100,

	children = {{def = "PrecCruiserGunSmall",	joint = "root"},},
	hack_immune 	= true,
}


Def.Projectile_T5R  =
{
	inherit			= "Weapon_BaseRocket",
	explosion_blast_wave 	= "Blastwave_CruiserAlien_T5R",
	override_blast_wave_damage = true,
	detonation_radius		= 3,
	model 				= "models/misc/invisible_model",
	flare_color			= "100 100 255 20",
	flare_size			= 0.0, -- 3 1
	flare_angle			= 180,
	flare_nebulosity	= 0.2,

	missile_defence_immune 	= true,	
	missile_detection_immune = true,
	
	spell			= "SOps_AntiHuge", -- доп спелл против эсмов 

	hit_effect		= "particles/weapons/alien/prec_cruiser_gun_hit",
	effect 			= "particles/weapons/alien/alien_gun_projectile",
}

Def.Blastwave_CruiserAlien_T5R  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_maxDistance		= 12,
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/alien/alien_gun_explosion",
	light_color 			= "100 255 100 100",
	light_radius 			= 20,
	light_time 				= 0.8,
	--sound 					= "sound/explosion/nanobot_expl",
	sound 					= "sound/raid/boss_rocket_detonation",
}

Def.Projectile_TOR  =
{
	inherit			= "Weapon_BaseRocket",
	explosion_blast_wave 	= "Blastwave_CruiserAlien_TOR",
	override_blast_wave_damage = true,
	detonation_radius		= 3,
	model 				= "models/misc/invisible_model",
	flare_color			= "100 100 255 20",
	flare_size			= 0.0, -- 3 1
	flare_angle			= 180,
	flare_nebulosity	= 0.2,

	missile_defence_immune 	= true,	
	missile_detection_immune = true,
	
	spell			= "SOps_AntiHuge_OW", -- доп спелл против эсмов 

	hit_effect		= "particles/weapons/alien/prec_cruiser_gun_hit",
	effect 			= "particles/weapons/alien/alien_gun_projectile",
}

Def.Blastwave_CruiserAlien_TOR  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1000,
	blast_maxDistance		= 30,	--12
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/alien/alien_gun_explosion",
	light_color 			= "100 255 100 100",
	light_radius 			= 20,
	light_time 				= 0.8,
	--sound 					= "sound/explosion/nanobot_expl",
	sound 					= "sound/raid/boss_rocket_detonation",
}


Def.Turret_CruiserAlien_T4R =
{
	inherit			= "Turret_CruiserAlien_T5R",
	health 					= rw_th[4],
	death_damage_to_parent	= rw_tp[4],
	
	fire_rate		= 300.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 350,
	max_range		= 500,
	projectile_speed = 250,
	
	damage_kinetic	= 0,
	damage_emp		= rw_td[4],
	damage_thermal	= 0,
}

Def.Turret_CruiserAlien_T3R =
{
	inherit			= "Turret_CruiserAlien_T5R",
	health 					= rw_th[3],
	death_damage_to_parent	= rw_tp[3],
	
	fire_rate		= 300.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 300,
	max_range		= 400,
	projectile_speed = 150,
	
	damage_kinetic	= 0,
	damage_emp		= rw_td[3],
	damage_thermal	= 0,
}

Def.Turret_CruiserAlien_OW =
{
	inherit			= "Turret_CruiserAlien_T5R",
	health 					= 200000,
	death_damage_to_parent	= 200000,
	
	fire_rate		= 30.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 300,	-- 400
	max_range		= 900,	--800
	projectile_speed = 300,	--400
	
	damage_kinetic	= 0,
	damage_emp		= 9000,	--10000
	damage_thermal	= 0,
	
	projectile			= "Projectile_TOR", -- с большим взрывом
}


Def.Projectile_TurretPlasma_OW =
{
	inherit			= "Projectile_Plasma_Default",
	explosion_blast_wave 	= "Blastwave_CruiserAlien_TOR",	-- лень делать отдельный балствейв
	override_blast_wave_damage = true,
	detonation_radius		= 5,

	hit_effect		= "particles/weapons/plasma/hit",
	effect 			= "particles/weapons/plasma/plasma_turret_projectile",
	
	shadowCaster		= false,
	impact_type 		= "plasma",
}


-- строительство
Def.Turret_Team1_OW =
{
	inherit 		= "Turret_Team1_Pve_PlayerRailgun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 1,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 70000, -- базовое значение 200000, для Приключения ReturnOfPrecursors2025 и марафона A25FOR30 делаем 70000
	damageable		= true,
	--remove_on_death = false,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 30.0,
	dispersion		= 2.0, -- deg
	optimal_range	= 600, -- базовое значение 800, для Приключения ReturnOfPrecursors2025 и марафона A25FOR30 делаем 600
	max_range		= 900, -- базовое значение 1200, для Приключения ReturnOfPrecursors2025 и марафона A25FOR30 делаем 900
	projectile_speed = 600,
	
	damage_kinetic	= 0,
	damage_emp		= 95000, -- базовое значение 50000, марафона A25FOR30 делаем 95000 (для Приключения ReturnOfPrecursors2025 - не меняем)
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_TurretPlasma_OW", --"Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_tiny",
	
	uiName = "Turret_RailGun_name",
	
	build_end_sound = "sound/game/turret_build_end",
	
	build_model		= "models/turret/plasma_turret/plasma_turret_jer_holo", 
	init_builded	= false,
	build_time		= 24.0,
	max_builders	= 4,
	build_beam_fx = "particles/other/build_beam",
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot",
   	rot_sound	= "sound/weapons/turret/turret_motor",	
}

-- тут важна прочность туррельки - деф самого лазера живёт отдельно
Def.Turret_CruiserAlien_T4L =
{
	inherit			= "Turret_CruiserAlien_T5L",
	health 					= rw_th[4],
	death_damage_to_parent	= rw_tp[4],
}

Def.Turret_CruiserAlien_T3L =
{
	inherit			= "Turret_CruiserAlien_T5L",
	health 					= rw_th[3],
	death_damage_to_parent	= rw_tp[3],
}

-- невидимые дефы для мегалазеров, сами мегалазеры отдельно заспавнятся
Def.Turret_CruiserAlien_MegaLaser =
{
	class 			= "Turret",
	in_editor		= false,

	relationship_group = ai.RelationshipGroups.Alien,

	physics			= { solid_type = solid.none, kinematic = true, material = "Metal", mass = 1000000, },
	health 			= 200000,	--x10
	damageable		= false,
	
	respawn_time	= 9999,
	
	fire_rate		= 0.01,	--40
	dispersion		= 0.0, -- deg
	optimal_range	= 5,
	max_range		= 5,
	projectile_speed = 5,
	
	damage_kinetic	= 0,
	damage_emp		= 1,	--x100
	damage_thermal	= 0,
	
	max_rot_speed	= 0,	-- deg per second
	max_fire_angle 	= 1,	-- 45

	projectile		= "Projectile_T5L",
	shot_effect 	= "particles/weapons/alien/prec_cruiser_gun_muzzle",
	death_effect	= "particles/explosions/objects/alien_explosion",
	death_sound		= "sound/explosion/drone_expl",	
	--shot_once_sound = "sound/weapons/turret/alien_cruiser_oneshot", 
--	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName = "CruiserAlien_MegaLaser_name",

	children = {{effect = "particles/objects/prec_megalaser_turret",	joint = "root"},},
	hack_immune 	= true,
	
	gameplay_coef_group_id		= 0,
}

-- выделенные мегалазеры, которые привязаны к конкретному яйцу
Def.Turret_CruiserAlien_MegaLaser_Life_01 =
{
	inherit			= "Turret_CruiserAlien_MegaLaser",
}

Def.Turret_CruiserAlien_MegaLaser_Life_02 =
{
	inherit			= "Turret_CruiserAlien_MegaLaser",
}

Def.Turret_CruiserAlien_MegaLaser_Life_03 =
{
	inherit			= "Turret_CruiserAlien_MegaLaser",
}

Def.Turret_CruiserAlien_MegaLaser_Life_04 =
{
	inherit			= "Turret_CruiserAlien_MegaLaser",
}


-- яйца (скорлупа)
Def.Alien_Destroyer_Life_01_T3 =
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_01", 
	hack_immune 	= true,

	relationship_group = ai.RelationshipGroups.Alien,

	physics			= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 2000000, },
	signature		= ai.Signature.HUGE,
	health 					= rw_sh[3],
	death_damage_to_parent	= rw_sp[3],
	--respawn_time			= rw_sr[3],

	--as_static		= true,	-- почему-то всё равно сингулярка простреливает
	damageable		= true,
	remove_on_death = false,
	full_activate_revive = true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	death_effect	= "particles/explosions/alien_destroyer_life_explosion",
	death_sound		= "sound/explosion/drone_expl",	
	
	uiName = "Alien_Destroyer_Life_name",
	points_reward_assist_damage = 200,
	
	gameplay_coef_group_id			= 0,
	gameplay_coef_min_lifetime		= 40,

	
	broken_parts = 
	{
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( 8.6, -11.6, -31.2 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( 15.4, -9.2, -16.2 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -18.3, -9.2, 0 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck04", debris = false, pos = Vec3( -16.9, -9.2, 11.4 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -12.3, -10.0, 26.4 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( 12.9, -9.2, 21.3 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( 16.9, -9.2, 11.4 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( 18.3, -9.2, 0 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -6.8, 11.3, 7.7 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( -6.8, 12.5, 0 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck11", debris = false, pos = Vec3( 5.7, 10.9, -11.5 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck12", debris = false, pos = Vec3( 3.5, 7.0, -20.6 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( 9.9, 8.8, -9.4 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck14", debris = false, pos = Vec3( 6.8, 11.9, 3.3 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck15", debris = false, pos = Vec3( 0, 10.3, 16.3 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck16", debris = false, pos = Vec3( 10.1, 7.5, 13.8 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck17", debris = false, pos = Vec3( -11.5, -9.5, -23.8 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
	},
}
Def.Destroyer_Life_Wreck01 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck01",
	--death_fade_time = 1.5,
}
Def.Destroyer_Life_Wreck02 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck02",
	--death_fade_time = 2.0,
}
Def.Destroyer_Life_Wreck03 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck03",
	--death_fade_time = 1.0,
}
Def.Destroyer_Life_Wreck04 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck04",
	--death_fade_time = 2.0,
}
Def.Destroyer_Life_Wreck05 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck05",
	--death_fade_time = 1.5,
}
Def.Destroyer_Life_Wreck06 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck06",
	--death_fade_time = 2.0,
}
Def.Destroyer_Life_Wreck07 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck07",
	--death_fade_time = 1.0,
}
Def.Destroyer_Life_Wreck08 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck08",
	--death_fade_time = 2.0,
}
Def.Destroyer_Life_Wreck09 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck09",
	--death_fade_time = 1.5,
}
Def.Destroyer_Life_Wreck10 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck10",
	--death_fade_time = 2.0,
}
Def.Destroyer_Life_Wreck11 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck11",
	--death_fade_time = 1.0,
}
Def.Destroyer_Life_Wreck12 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck12",
	--death_fade_time = 2.0,
}
Def.Destroyer_Life_Wreck13 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck13",
	--death_fade_time = 1.5,
}
Def.Destroyer_Life_Wreck14 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck14",
	--death_fade_time = 2.0,
}
Def.Destroyer_Life_Wreck15 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck15",
	--death_fade_time = 1.0,
}
Def.Destroyer_Life_Wreck16 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck16",
	--death_fade_time = 2.0,
}
Def.Destroyer_Life_Wreck17 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "ShipMetalMk1", mass = 100000, },
	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_wreck17",
	--death_fade_time = 1.5,
}
--
Def.Alien_Destroyer_Life_02_T3 =
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_02", 
	hack_immune 	= true,

	relationship_group = ai.RelationshipGroups.Alien,

	physics			= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 2000000, },
	signature		= ai.Signature.HUGE,
	health 					= rw_sh[3],
	death_damage_to_parent	= rw_sp[3],
	--respawn_time			= rw_sr[3],

	--as_static		= true,	-- почему-то всё равно сингулярка простреливает
	damageable		= true,
	remove_on_death = false,
	full_activate_revive = true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	death_effect	= "particles/explosions/alien_destroyer_life_explosion",
	death_sound		= "sound/explosion/drone_expl",	
	
	uiName = "Alien_Destroyer_Life_name",
	points_reward_assist_damage = 200,
	
	gameplay_coef_group_id			= 0,
	gameplay_coef_min_lifetime		= 40,
	
	broken_parts = 
	{
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( 8.6, -11.6, -31.2 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( 15.4, -9.2, -16.2 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -18.3, -9.2, 0 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck04", debris = false, pos = Vec3( -16.9, -9.2, 11.4 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -12.3, -10.0, 26.4 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( 12.9, -9.2, 21.3 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( 16.9, -9.2, 11.4 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( 18.3, -9.2, 0 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -6.8, 11.3, 7.7 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( -6.8, 12.5, 0 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck11", debris = false, pos = Vec3( 5.7, 10.9, -11.5 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck12", debris = false, pos = Vec3( 3.5, 7.0, -20.6 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( 9.9, 8.8, -9.4 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck14", debris = false, pos = Vec3( 6.8, 11.9, 3.3 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck15", debris = false, pos = Vec3( 0, 10.3, 16.3 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck16", debris = false, pos = Vec3( 10.1, 7.5, 13.8 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
		{ def = "Destroyer_Life_Wreck17", debris = false, pos = Vec3( -11.5, -9.5, -23.8 ), ang_speed_deviation = 10,dumping = 0, speed = 150, speed_deviation = 0, speed_inherit = 0, ttl = 99, },
	},
}

Def.Alien_Destroyer_Life_03_T3 =
{
	inherit			= "Alien_Destroyer_Life_02_T3",
	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_03", 
}

Def.Alien_Destroyer_Life_04_T3 =
{
	inherit			= "Alien_Destroyer_Life_01_T3",
	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_life_04", 
}


Def.Alien_Destroyer_Life_01_T4 =
{
	inherit			= "Alien_Destroyer_Life_01_T3",
	health 					= rw_sh[4],
	death_damage_to_parent	= rw_sp[4],
	--respawn_time			= rw_sr[4],
}

Def.Alien_Destroyer_Life_01_T5 =
{
	inherit			= "Alien_Destroyer_Life_01_T3",
	health 					= rw_sh[5],
	death_damage_to_parent	= rw_sp[5],
	--respawn_time			= rw_sr[5],
}


Def.Alien_Destroyer_Life_02_T4 =
{
	inherit			= "Alien_Destroyer_Life_02_T3",
	health 					= rw_sh[4],
	death_damage_to_parent	= rw_sp[4],
	--respawn_time			= rw_sr[4],
}

Def.Alien_Destroyer_Life_02_T5 =
{
	inherit			= "Alien_Destroyer_Life_02_T3",
	health 					= rw_sh[5],
	death_damage_to_parent	= rw_sp[5],
	--respawn_time			= rw_sr[5],
}


Def.Alien_Destroyer_Life_03_T4 =
{
	inherit			= "Alien_Destroyer_Life_03_T3",
	health 					= rw_sh[4],
	death_damage_to_parent	= rw_sp[4],
	--respawn_time			= rw_sr[4],
}

Def.Alien_Destroyer_Life_03_T5 =
{
	inherit			= "Alien_Destroyer_Life_03_T3",
	health 					= rw_sh[5],
	death_damage_to_parent	= rw_sp[5],
	--respawn_time			= rw_sr[5],
}


Def.Alien_Destroyer_Life_04_T4 =
{
	inherit			= "Alien_Destroyer_Life_04_T3",
	health 					= rw_sh[4],
	death_damage_to_parent	= rw_sp[4],
	--respawn_time			= rw_sr[4],
}

Def.Alien_Destroyer_Life_04_T5 =
{
	inherit			= "Alien_Destroyer_Life_04_T3",
	health 					= rw_sh[5],
	death_damage_to_parent	= rw_sp[5],
	--respawn_time			= rw_sr[5],
}


-- сердце внутри яйка - уязвимая точка, не готово
Def.Alien_Destroyer_Hearth_T3 = 
{
	class				= "ScBaseEntity",
	in_editor			= false,
	damageable			= true,
	remove_on_death	 	= false,
	full_activate_revive = true,
	health 					= rw_lh[3],
	death_damage_to_parent	= rw_lp[3],
	hack_immune 		= true,

	hudType			= "default",
	hud_visibility_type = "minor",
	respawn_time	= 9999,	-- само не оживает, только если сбить скорлупу

	--hud_ico			= "alien_megabomb_icon",
	--maxViewDist		= 5000,

	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_gun_05", 
	physics			= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 1000000, },
	
	children = {{effect = "particles/other/prec_core_big",	joint = "root"},},
	
	death_effect	= "particles/explosions/prec_core_explosion",
	death_sound		= "sound/explosion/alien_bomb_expl",
	--work_sound		= "sound/raid/megabomb_raid_idle",
	
	gameplay_coef_group_id			= 0,
	gameplay_coef_min_lifetime		= 20,
	
	broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 2 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 3 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 4 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 5 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 6 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 7 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 8 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 9 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
	},
	
	points_reward_assist_damage = 1000,

	--vision_always = true,
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName = "Alien_Destroyer_Hearth_name",
} 

Def.Alien_Destroyer_SmallHearth_T3 = 
{
	class				= "ScBaseEntity",
	in_editor			= false,
	damageable			= true,
	remove_on_death	 	= false,
	full_activate_revive = true,
	health 					= rw_lh[3],
	death_damage_to_parent	= rw_lp[3],
	hack_immune 		= true,

	hudType			= "default",
	hud_visibility_type = "minor",
	respawn_time	= 9999,	-- само не оживает, только если сбить скорлупу

	--hud_ico			= "alien_megabomb_icon",
	--maxViewDist		= 5000,

	model			= "models/objects/ships_huge/prec_destroyer/prec_destroyer_gun_04", 
	physics			= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 1000000, },
	
	children = {{effect = "particles/other/prec_core_small",	joint = "root"},},
	
	death_effect	= "particles/explosions/prec_core_explosion",
	death_sound		= "sound/explosion/alien_bomb_expl",
	--work_sound		= "sound/raid/megabomb_raid_idle",
	
	gameplay_coef_group_id			= 0,
	gameplay_coef_min_lifetime		= 20,
	
	broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 2 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 3 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 4 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 5 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
		[ 6 ] = { effect = "particles/explosions/prec_core_explosion_parts",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.2, speed = 100.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 5, },
	},
	
	points_reward_assist_damage = 1000,

	--vision_always = true,
	relationship_group = ai.RelationshipGroups.Alien,
	
	uiName = "Alien_Destroyer_Hearth_name",
} 

Def.Alien_Destroyer_Hearth_T4 = 
{
	inherit					= "Alien_Destroyer_Hearth_T3",
	health 					= rw_lh[4],
	death_damage_to_parent	= rw_lp[4],
	gameplay_coef_min_lifetime		= 25,
}

Def.Alien_Destroyer_Hearth_T5 = 
{
	inherit					= "Alien_Destroyer_Hearth_T3",
	health 					= rw_lh[5],
	death_damage_to_parent	= rw_lp[5],
	gameplay_coef_min_lifetime		= 30,
}

Def.Alien_Destroyer_SmallHearth_T4 = 
{
	inherit					= "Alien_Destroyer_SmallHearth_T3",
	health 					= rw_lh[4],
	death_damage_to_parent	= rw_lp[4],
	gameplay_coef_min_lifetime		= 25,
}

Def.Alien_Destroyer_SmallHearth_T5 = 
{
	inherit					= "Alien_Destroyer_SmallHearth_T3",
	health 					= rw_lh[5],
	death_damage_to_parent	= rw_lp[5],
	gameplay_coef_min_lifetime		= 30,
}

-- генератор для Базы Эллидиум, модифицирован в туррель - чтобы урон от чёрных дыр... проходил #63189

Def.PvE_FrozenStation_EnergyGenerator_easy = 
{
	class				= "Turret", --"ScBaseEntity",
	signature			= ai.Signature.HUGE,
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	health 				= 70000,
	maxViewDist			= 5000,
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	
	model			= "models/objects/gameplay/generator/generator_01", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },

	children = 
	{
		{ effect ="particles/objects/generator_01_core", joint = "fx" },
	},
	
	broken_parts = 
	{
		{ def = "EnergyGenerator_Wreck",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1.0, },
	},
	
	death_effect	= "particles/explosions/objects/energygenerator_explosion",
	death_sound		= "sound/ambient/frozen_generator_death",
	
	points_reward_kill = 50,
	points_reward_assist_damage = 450,

	vision_always = true,
	relationship_group = 2,
	
	work_sound	 = "sound/ambient/frozen_generator_loop",	
	
	uiName = "Pve_EnergyGenerator_name",
	hack_immune		= true,

} 

Def.EnergyGenerator_Wreck =
{
	class 			= "BaseEntity",
	in_editor		= false,
	model			= "models/objects/gameplay/generator/generator_01_wreck",
	--physics			= { solid_type = solid.compound_model, dynamic = true, material = "Metal", mass = 50000, },
	remove_timeout	= 60.0,	--#74497 Уменьшил до минуты
	maxViewDist		= 3000,
	death_fade_time 	= 1.0,
}

-- обычная рейлган туррель AI для нормал мода Pve
Def.Turret_Team2_Pve_FrozenStation = 
{	
	inherit = "Turret_RailGun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/round_railgun01/round_railgun01", 
	hudType			= "default",
	hud_visibility_type = "minor", 

	relationship_group = 2,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 3000,
	damageable		= true,
	
	points_reward_kill = 20,
	points_reward_assist_damage = 80,
	
	fire_rate		= 50.0, -- 60
	dispersion		= 0.0, -- deg
	optimal_range	= 150,
	max_range		= 300,
	projectile_speed = 110, --100
	
	damage_kinetic	= 100,
	damage_emp		= 0,
	damage_thermal	= 0,
	
	max_rot_speed	= 50,	-- deg per second

	shot_effect 	= "particles/weapons/drongun/muzzle",

	death_effect	= "particles/explosions/objects/explosion_tiny",
	
	uiName = "Turret_RailGun_name",
}

--платформа для туррели(team2) для Frozen_Station
Def.Platform_Turret_Team2_Pve_FrozenStation =
{

	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/objects/gameplay/platform/platform_03", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	death_effect	= "particles/explosions/objects/explosion_mid",
}

-- ракетная Cruisemissle туррель AI для T2 мода Pve
Def.Turret_Team2_Pve_FrozenStation_RocketGun = 
{
	inherit			= "Turret_RocketGun",
	relationship_group = 2,
	health 			= 4000,
	respawn_time	 = 999,	--#71042
	projectile		= "SpaceMissile_Cruise_T2_FrozenStation",
	special_object = true,
	vision_always = true,	
	hudType			= "default",
	hud_visibility_type = "minor", 
	
	points_reward_kill = 30,
	points_reward_assist_damage = 120,
	points_reward_assist_debuff = 30,
	
	fire_rate		= 12.0, --8
	dispersion		= 0.0, -- deg
	max_range		= 350,
	max_rot_speed	= 25,	-- deg per second

	uiName = "Turret_Pirate_RocketGun_name",
}

Def.SpaceMissile_Cruise_T2_FrozenStation = 
{
	inherit				= "SpaceMissile_Cruise_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 50,
	max_range 			= 500,
	angular_velocity	= 15,
	storeItemId			= 0,
	
	spell				= "Pve_VoidZone_ThermalDamage_Missle_T1",
	explosion_blast_wave= "BlastWave_SM_Cruise_T2_FrozenStation",
}

Def.BlastWave_SM_Cruise_T2_FrozenStation = 
{
	inherit				= "BlastWave_SM_Cruise_T2_Pve",
	damage_thermal		= 250,
}

Def.SpaceMissile_Cruise_T4_FrozenStation = 
{
	inherit				= "SpaceMissile_Cruise_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 50,
	max_range 			= 500,
	angular_velocity	= 15,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_Cruise_T4_FrozenStation",
}

Def.BlastWave_SM_Cruise_T4_FrozenStation = 
{
	inherit				= "BlastWave_SM_Cruise_T2_Pve",
	damage_thermal		= 3000,
}

--платформа для туррели(team2) для Jericho_base
Def.Platform_Turret_Team2_Pve_FrozenStation2 =
{

	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/objects/gameplay/platform/platform_04", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	death_effect	= "particles/explosions/objects/explosion_mid",
}

-- пушка для предтеч в Frozen Station
Def.Weapon_AlienGun_PvE_T4 =
{
	class				= "AutoGun",
	--class_mask			= 2,
	weapon_class = 2,	
	dispersion = 0,
	item_subtype = 17,
	max_range = 500,
	optimal_range = 300,
	
	--inherit				= "Weapon_SWGift_T3",
	--storeItemId			= 0,
	--cant_be_bought  	= true,
	drop_weight			= 0,
	--tier 				= 4,
	
	fire_rate			= 120,
	damage_emp		 	= 250*6*2,
	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL + ai.ShipClass.HUGE,
	
	projectile			= "Projectile_AlienGun_PvE",
	shot_once_sound 		= "sound/weapons/aliengun/ag_shot",
	projectile_speed		= 100,	
	heat_add 			= 0,
	
	muzzleflash_color = { kinetic = "80 210 80 128", emp = "80 210 80 128", thermal = "80 210 80 128", },
	muzzleflash_radius = 35,
	
	uiName = "AlienGun",
}

-- пушка для риверов в Frozen Station
Def.Weapon_ReaverGun_PvE_T4 =
{
	inherit				= "Weapon_SWGift_T3",
	dispersion_max 		= 3,
	dispersion_add		= 0,8100,
	dispersion_sub 		= 0,8100,

	dispersion 			= 0,	
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	tier 				= 4,
	
	projectile			= "Projectile_ReaverGun",

	fire_rate			= 60,
	damage_emp		 	= 600,
	projectile_speed	= 90,	

	muzzleflash_color = { kinetic = "80 210 80 128", emp = "80 210 80 128", thermal = "80 210 80 128", },
	shot_effect 		= "particles/weapons/alien/reaver_gun_muzzle",
	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
}

Def.Weapon_ReaverGun_PvE_T4X =
{
	inherit				= "Weapon_ReaverGun_PvE_T4",
	projectile_speed	= 140,	
}

Def.Weapon_ReaverGun_Raid_Pve1 =
{
	inherit				= "Weapon_ReaverGun_PvE_T4",
	projectile			= "Projectile_ReaverGun_AntiHuge",
	fire_rate			= 40,	---45, #61630 борьба с лишними пульками
	damage_emp		 	= 1000,
	projectile_speed 	= 300, ---200, --475.0,
	crit_chance 		= 0.2,
}

Def.Projectile_ReaverGun_AntiHuge = 
{
	inherit				= "Projectile_ReaverGun",
	spell_on_crit		= "SOps_AntiHuge",
}

Def.Weapon_ReaverGun_Raid_Pve2 =
{
	inherit				= "Weapon_ReaverGun_Raid_Pve1",
	projectile_speed 	= 400, ---350, --475.0,
}

Def.Weapon_ReaverGun_Raid_Pve3 =
{
	inherit				= "Weapon_ReaverGun_Raid_Pve1",
	projectile_speed 	= 500, --475.0,
}

Def.Projectile_AlienGun_PvE  =
{
	inherit			= "Projectile_AlienGun",	
	explosion_blast_wave 	= "Blastwave_AlienGun_PvE",
	effect 			= "particles/weapons/alien/alien_gun_projectile_purple", 
}

Def.Blastwave_AlienGun_PvE  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_maxDistance		= 12,
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/other/plasma_orb_unique_explosion",
	light_color 			= "193 132 255 100",
	light_radius 			= 20,
	light_time 				= 0.8,
	sound 					= "sound/explosion/nanobot_expl",
}

-- МегаБомба для pve-рейда
Def.Megabomb_Raid_Pve = 
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
	
	gameplay_coef_group_id		= 0,
	gameplay_coef_min_lifetime	= 5,
} 

-- МегаБомба для pve-рейда
Def.Megabomb_RW = 
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= false,
	--pve_scale_power	 	= true,
	health 				= 30000,
	--remove_on_death = false,
	full_activate_revive = true, -- после реактивации будет как новенькая
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	hud_ico			= "alien_megabomb_icon",
	maxViewDist		= 5000,
	model			= "mapskit/maps/models/precursors/pc_animated_core_small",
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

-- другая мегабомба, с замедлением
Def.Megabomb_RW_Slow = 
{
	inherit				= "Megabomb_RW",
	uiName = "Megabomb_RW_Slow_name",
}

-- другая мегабомба, с порталами
Def.Megabomb_RW_Portal = 
{
	inherit				= "Megabomb_RW",
	uiName = "Megabomb_RW_Portal_name",
}

Def.Megabomb_RW_BlackHole =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	--damageable			= true,
	--pve_scale_power	 	= true,
	--health 				= 30000,
	--remove_on_death = false,
	full_activate_revive = true, -- после реактивации будет как новенькая
	--special_object  = true,
	hudType			= "loot_crate", --default
	--hud_visibility_type = "",	--"major",
	hud_ico			= "alien_megabomb_icon",
	maxViewDist		= 5,
	--model			= "models/shields/portal",
	effect			= "particles/other/prec_black_hole_2",

	physics			= { solid_type = solid.none, static = true },
	--physics			= { solid_type = solid.sphere, static = true, material = "EnergyShield", },
	
	--death_sound		= "sound/explosion/alien_bomb_expl",
	work_sound		= "sound/raid/megabomb_raid_idle",
	
	--vision_always = true,
	relationship_group = ai.RelationshipGroups.Alien,

	uiName = "Megabomb_RW_BlackHole_name",
}

Def.RW_BlackHoleHealth_T3 = 
{
	class				= "ScBaseEntity",
	spell_aura_target	= true,
	in_editor			= true,
	damageable			= true,
	health 				= rw_bh[3],
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "minor",
	hud_ico				= "alien_megabomb_icon",
	maxViewDist			= 5000,

	model				= "models/objects/ships_huge/prec_destroyer/prec_destroyer_gun_03", 
	physics				= { solid_type = solid.model, kinematic = true, material = "Metal", mass = 1000000, },
	
	--death_effect		= "particles/explosions/objects/explosion_tiny",
	death_effect		= "particles/weapons/smart_explosion",
	death_sound			= "sound/explosion/alien_bomb_expl",
	--work_sound		= "sound/raid/megabomb_raid_idle",
	
	points_reward_assist_damage = 500,

	vision_always = true,
	relationship_group = ai.RelationshipGroups.Alien,

	uiName = "RW_BlackHoleHealth_name",

	children = {{effect = "particles/objects/prec_ship_purple",	joint = "root"},},
	hack_immune 		= true,
	
	gameplay_coef_group_id			= 0,
	gameplay_coef_min_lifetime		= 15,

}

Def.RW_BlackHoleHealth_T4 = 
{
	inherit = "RW_BlackHoleHealth_T3",
	health 				= rw_bh[4],
	gameplay_coef_min_lifetime		= 20,
}

Def.RW_BlackHoleHealth_T5 = 
{
	inherit = "RW_BlackHoleHealth_T3",
	health 				= rw_bh[5],
	gameplay_coef_min_lifetime		= 25,
}


Def.Megabomb_RW_TriggerHurt_T5 =
{
    inherit = "TriggerHurt",
    --spell_on_spawn = "Plasma_beem",
    
    attractive_force = 90.0,	-- 75 60
    attractive_dist = 2000.0,	-- 1500
	attractive_power = 0.3,

	in_editor			= true,
	relationship_group = ai.RelationshipGroups.Alien,
	
	-- very old code, use carefuly, better no use
	--max_damage_per_second	= 100500,
	--min_damage_per_second	= 100,
	--damage_type				= 1,
	--filter=""
	--start_disabled="0"
	--box_dimensions			= Vec3(20,20,20),

	uiName = "Megabomb_RW_BlackHole_name",
} 

Def.Megabomb_RW_TriggerHurt_T4 =
{
    inherit = "Megabomb_RW_TriggerHurt_T5",
    
    attractive_force = 80.0,
} 

Def.Megabomb_RW_TriggerHurt_T3 =
{
    inherit = "Megabomb_RW_TriggerHurt_T5",
    
    attractive_force = 70.0,
} 

Def.Megabomb_RW_TriggerHurt_T5_2 =
{
    inherit = "Megabomb_RW_TriggerHurt_T5",
    
    attractive_force = 60.0,
} 

Def.Megabomb_RW_TriggerHurt_T4_2 =
{
    inherit = "Megabomb_RW_TriggerHurt_T5",
    
    attractive_force = 50.0,
} 

Def.Megabomb_RW_TriggerHurt_T3_2 =
{
    inherit = "Megabomb_RW_TriggerHurt_T5",
    
    attractive_force = 40.0,
} 

--Аванпост (Team1) для PvE Raid`а
Def.PvE_RaidAvanpost =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	health 				= 80000,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	hudType				= "default",	
	--[[hud_ico				= "jericho_avanpost_icon", ]]-- нужны ли новые иконки?!!
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/vital_point/blockpost/fed_blockpost_mini",
	
	vision_always = true,
	relationship_group = 1,
	death_sound     = "sound/raid/raid_avanpost_explosion",
	death_effect	= "particles/explosions/objects/fed_blockpost_mini_explosion",

	uiName				= "RaidAvanpost",	
	
	--broken_parts = 
	--{
	--	{ def = "PoliceAvanpost_wreck",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 3.0, },
	--}, 
	
	children = 
	{
		{ def = "PvE_RaidRocketTurret", joint = "gun_1" },
		{ def = "PvE_RaidRocketTurret", joint = "gun_2" },
		{ def = "PvE_RaidRocketTurret", joint = "gun_3" },
		{ def = "PvE_RaidRocketTurret", joint = "gun_4" },
		{ effect = "particles/objects/avanpost_small", joint = "light_1" },
		{ effect = "particles/objects/avanpost_small", joint = "light_2" },
		{ effect = "particles/objects/avanpost_small", joint = "light_3" },
		{ effect = "particles/objects/avanpost_small", joint = "light_4" },
	}
}

-- ракетная установка блокпоста полиции для PvE Raid`а
Def.PvE_RaidRocketTurret = 
{
	inherit				= "Turret_RocketGun",
	relationship_group	= ai.RelationshipGroups.Police,
	health 				= 20000,
	death_damage_to_parent = 20000,
	respawn_time	 	= 60,
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

Def.RW_PoliceAvanpost =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	--health 				= 34000,	-- с 3х торпед по 15к гарантировано, а реально с 2х ибо туррели +4к каждая (их 4, хоть 1 да собьёт)
	health 				= 77000*12,	-- #64168 с 3х торпед по 15к гарантировано, но 2 точно переживёт
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	hudType				= "default",	
	hud_ico				= "jericho_avanpost_icon", -- так всё-таки нужны новые иконки?!!
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/vital_point/blockpost/fed_blockpost_mini",
	
	vision_always = true,
	relationship_group = 1,
	death_sound     = "sound/raid/raid_avanpost_explosion",
	death_effect	= "particles/explosions/objects/fed_blockpost_mini_explosion",

	uiName				= "RaidAvanpost",

	--ping				= 1,
	
	--broken_parts = 
	--{
	--	{ def = "PoliceAvanpost_wreck",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 3.0, },
	--}, 
	
	children = 
	{
		{ def = "RW_RocketTurret", joint = "gun_1" },
		{ def = "RW_RocketTurret", joint = "gun_2" },
		{ def = "RW_RocketTurret", joint = "gun_3" },
		{ def = "RW_RocketTurret", joint = "gun_4" },
		{ effect = "particles/objects/avanpost_small", joint = "light_1" },
		{ effect = "particles/objects/avanpost_small", joint = "light_2" },
		{ effect = "particles/objects/avanpost_small", joint = "light_3" },
		{ effect = "particles/objects/avanpost_small", joint = "light_4" },
	}
}

Def.PoliceAvanpost_wreck =
{
	class 				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/vital_point/blockpost/fed_blockpost_mini_wreck",
	death_fade_time 	= 2.0,
}

Def.debris_block_1 =
{
	class 				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, static = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/debris_block01",
	death_fade_time 	= 2.0,
	as_world 			= true,
}

Def.debris_block_2 =
{
	class 				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, static = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/debris_block02",
	death_fade_time 	= 2.0,
	as_world 			= true,
}

Def.debris_block_3 =
{
	class 				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, static = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/debris_block03",
	death_fade_time 	= 2.0,
	as_world 			= true,
}

----------------------

Def.map_debris_1 =
{
	class 				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/map_debris_1",
	death_fade_time 	= 2.0,
	as_world 			= true,
}

Def.map_debris_2 =
{
	class 				= "BaseEntity",
	in_editor			= false,
	as_world 			= true,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/map_debris_2",
	death_fade_time 	= 2.0,
	as_world 			= true,
}

Def.map_debris_3a =
{
	class 				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/map_debris_3a",
	death_fade_time 	= 2.0,
	as_world 			= true,
}

Def.map_debris_3b =
{
	class 				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/map_debris_3b",
	death_fade_time 	= 2.0,
	as_world 			= true,
}

Def.map_debris_4a =
{
	class 				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/map_debris_4a",
	death_fade_time 	= 2.0,
	as_world 			= true,
}

Def.map_debris_4b =
{
	class 				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	as_world 			= true,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal", mass = 100000, },
	model				= "models/objects/wrecks/map_debris_4b",
	death_fade_time 	= 2.0,
	as_world 			= true,
}

Def.RW_RocketTurret = 
{
	inherit				= "Turret_RocketGun",
	relationship_group	= ai.RelationshipGroups.Police,
	health 				= 10000*10,	-- #64168
	death_damage_to_parent = 4000*10,	-- #64168
	respawn_time	 	= 90,
	projectile			= "SpaceMissile_AAMu_RW",
	hud_visibility_type	= "minor",
	karma_reward_kill	= 0,	
	
	fire_rate			= 20.0,
	dispersion			= 1.0, -- deg
	max_range			= 600,
	max_rot_speed		= 30,	-- deg per second
	
	uiName				= "PoliceRocketTurret",
	model				= "models/turret/rocket_launcher/rocket_launcher",
}

-- ракета для туррели полиции на блокпосте
Def.SpaceMissile_AAMu_RW =
{
	inherit				= "SpaceMissile_AAMu_T1_Mk3",
	in_editor			= false,

	detonation_radius 	= 3,
	speed 				= 55,
	max_range 			= 600,
	storeItemId			= 0,
	
	explosion_blast_wave= "BlastWave_SM_AAMu_RW",	
}

-- взрыв нурс для туррели полиции на блокпосте
Def.BlastWave_SM_AAMu_RW = 
{
	inherit				= "BlastWave_SM_AAMu_T1_Mk3",
	in_editor			= false,

	damage_kinetic		= 6000,	--6000
	damage_thermal		= 0,
	blast_maxDistance	= 7,		--5
}




-- не используется пока
Def.Module_GuidedDrone_Raid_Pve =
{
	class					= "ActiveModule",
	in_editor				= false,
	--class_mask			= ai.ShipClass.LARGE,
	
	cooldown				= 0.1,
	energy_cost				= 1.0,
	activate_entity_max		= 16,

	activate_effect			= "",
	activate_module_effect	= "",

	activate_entity			= "GuidedDrone_Raid_Pve",
	activate_entity_health 	= 3000,
	spawn_offset 			= Vec3( 0, 10, -10 ),
	check_spawn_collision 	= true,
	
	-- drone parameters
	max_speed				= 60,
	max_rot_speed			= 180,	-- deg per second
	max_aim_rot_speed		= 60,

	control_range			= 1000,
	fire_rate				= 60,
	dispersion				= 1,
	optimal_range			= 150,
	max_range				= 250,
	projectile_speed		= 200,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 500,
	damage_thermal			= 0,
}

-- дроны охотников в рейде
Def.GuidedDrone_Raid_Pve =
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

	cooldown				= 0.1,
	holder_size				= 4,
	empty_holder_cooldown	= 120,
	stacks					= true,
	MunitionBayType			= ai.MunitionBayType.MBT_SECONDARY ,
	item_subtype			= ItemSubtype.BasicGuidedDron,
	storeItemId				= 0,

	uiName 					= "DroidAlien_name",
}


------------------------------------
--Волновое ПвЕ 
------------------------------------

Def.Weapon_Plasmagun_Meat_T1 = 
{
	inherit				= "Weapon_Plasmagun_Basic_T1_Mk1",
	tier				= 4, 
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	fire_rate			= 60,
}

Def.Module_Wave_Kamikaze_T1 = 
{
	inherit				= "Module_Suicide_T1_Epic",
	ai_usage			= ai.AiBehavior.KAMIKAZE,
	spell				 = "Suicide_T1_Wave",
	spell_on_death_active = "Suicide_T1_Wave_death",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	suicide_blastwave_def = "Module_Wave_Suicide_T1",
}

Def.Module_Wave_Suicide_T1 = 
{
	inherit				= "Module_Suicide_T1_Epic_BW",
	damage_thermal		= 400,
}

Def.Module_Wave_Suicide_T3 = 
{
	inherit				= "Module_Suicide_T1_Epic_BW",
	damage_thermal		= 2000,
}

Def.Module_Wave_Suicide_T5 = 
{
	inherit				= "Module_Suicide_T1_Epic_BW",
	damage_thermal		= 6000,
}

Def.Module_Wave_Kamikaze_T3 = 
{
	inherit				= "Module_Suicide_T1_Epic",
	ai_usage			= ai.AiBehavior.KAMIKAZE,
	spell				 = "Suicide_T2_Mk1",
	spell_on_death_active = "Suicide_T2_Mk1_death",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	suicide_blastwave_def = "Module_Wave_Suicide_T3",
}

Def.Module_Wave_Kamikaze_T5 = 
{
	inherit				= "Module_Suicide_T1_Epic",
	ai_usage			= ai.AiBehavior.KAMIKAZE,
	spell				 = "Suicide_T3_Mk1",
	spell_on_death_active = "Suicide_T3_Mk1_death",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	suicide_blastwave_def = "Module_Wave_Suicide_T5",
}

Def.KamikadzeExplodeBlastWave_T1 = 
{
	class 				= "BlastWave",
	in_editor			= false,
	apply_shake			= false,
	
	damage_kinetic		= 0.0,
	damage_emp			= 0.0,
	damage_thermal		= 200,

	light_radius		= 30.0,
	light_color			= "255 130 100 255",
	light_time			= 1.3,

	blast_maxDistance	= 20, 
	
	hud_ico				= "damage_explosionBlastwave",	
	uiName				= "damage_shipExplodeBlastWave",	-- для нормального отображения в DeathRecap
}

Def.KamikadzeExplodeBlastWave_T3 = 
{
	class 				= "BlastWave",
	in_editor			= false,
	apply_shake			= false,
	
	damage_kinetic		= 0.0,
	damage_emp			= 0.0,
	damage_thermal		= 1000,

	light_radius		= 30.0,
	light_color			= "255 130 100 255",
	light_time			= 1.3,

	blast_maxDistance	= 20, 
	
	hud_ico				= "damage_explosionBlastwave",	
	uiName				= "damage_shipExplodeBlastWave",	-- для нормального отображения в DeathRecap
}

Def.KamikadzeExplodeBlastWave_T5 = 
{
	class 				= "BlastWave",
	in_editor			= false,
	apply_shake			= false,
	
	damage_kinetic		= 0.0,
	damage_emp			= 0.0,
	damage_thermal		= 3000,

	light_radius		= 30.0,
	light_color			= "255 130 100 255",
	light_time			= 1.3,

	blast_maxDistance	= 20, 
	
	hud_ico				= "damage_explosionBlastwave",	
	uiName				= "damage_shipExplodeBlastWave",	-- для нормального отображения в DeathRecap
}

Def.Module_Disintegrator_Meat_T1_PvE =
{
	inherit				= "Module_Disintegrator_T1_Base",
	storeItemId			= 0,
	cant_be_bought  	= true,
	optimal_range		= 100,
	max_range			= 1500,
	damage_thermal		= 3000,
	fire_rate			= 20,
	projectile_speed	= 500,
	tier				= 4, 
}

Def.Module_Disintegrator_Meat_T3_PvE =
{
	inherit				= "Module_Disintegrator_T3_Base",
	storeItemId			= 0,
	cant_be_bought  	= true,
	optimal_range		= 100,
	max_range			= 1500,
	damage_thermal		= 5000,
	fire_rate			= 20, 
	projectile_speed	= 700,
	tier				= 4, 
}

Def.Module_Disintegrator_Meat_T5_PvE =
{
	inherit				= "Module_Disintegrator_T5_Base",
	storeItemId			= 0,
	cant_be_bought  	= true,
	optimal_range		= 100,
	max_range			= 1500,
	damage_thermal		= 15000,
	fire_rate			= 20,
	projectile_speed	= 800,
	tier				= 4, 
}

Def.Module_Disintegrator_Wave_PW_T1_PvE =
{
	inherit				= "Module_Disintegrator_T1_Base",
	storeItemId			= 0,
	cant_be_bought  	= true,
	optimal_range		= 100,
	max_range			= 1000,
	damage_thermal		= 800,
	fire_rate			= 15,
	projectile_speed	= 400,
	tier				= 4, 
}

Def.Module_Disintegrator_Wave_PW_T0_PvE =
{
	inherit				= "Module_Disintegrator_T1_Base",
	storeItemId			= 0,
	cant_be_bought  	= true,
	optimal_range		= 100,
	max_range			= 1000,
	damage_thermal		= 200,
	fire_rate			= 15,
	projectile_speed	= 300,
	tier				= 4, 
}

Def.Module_Disintegrator_Wave_PW_T3_PvE =
{
	inherit				= "Module_Disintegrator_T3_Base",
	storeItemId			= 0,
	cant_be_bought  	= true,
	optimal_range		= 100,
	max_range			= 1000,
	damage_thermal		= 3000,
	fire_rate			= 20, 
	projectile_speed	= 700,
	tier				= 4, 
}

Def.Module_Disintegrator_Wave_PW_T5_PvE =
{
	inherit				= "Module_Disintegrator_T5_Base",
	storeItemId			= 0,
	cant_be_bought  	= true,
	optimal_range		= 100,
	max_range			= 1000,
	damage_thermal		= 12000,
	fire_rate			= 30,
	projectile_speed	= 800,
	tier				= 4, 
}

Def.Weapon_Railgun_Heavy_Meat =
{
	inherit				= "Weapon_Railgun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	fire_rate			= Def.Weapon_Railgun_Heavy_T4_Mk1.fire_rate*0.3,
	optimal_range		= 1,
	max_range			= 1,	
	tier				= 4, 
}

Def.Weapon_Railgun_Basic_PvE =
{
	inherit				= "Weapon_Railgun_Basic_T1_Mk3",
	tier				= 3,
	fire_rate			= 60,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	tier				= 1, 
	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
}

Def.Weapon_Plasmagun_Meat_T1_Mk1 = 
{
	inherit				= "Weapon_Plasmagun_Basic_T1_Mk1",
	optimal_range		= 1,
	max_range			= 1,
 	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,	
	tier				= 1, 
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
}

Def.Weapon_Railgun_Basic_Meat_T4 =
{
	inherit	 		= "Weapon_Railgun_Basic_T5_Mk1",
	damage_kinetic	= 300,
	storeItemId 	= 0,
	drop_weight 	= 0,
	heat_add		= 6,
	dispersion  	= 3,
	dispersion_max 	= 5.0,
	optimal_range 	= 210,
	max_range 		= 245,
	fire_rate		= 400,
	cycle_barrels 	= true,
}

Def.Module_InfraredContermeasure_PVE =
{
	inherit				= "Module_InfraredContermeasure_T1_Mk1",
	cooldown			= 2,
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
	tier				= 1, 
}

Def.Weapon_Plasmagun_Meat_PvE =
{
	inherit				= "Weapon_Plasmagun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	tier				= 4, 
	drop_weight			= 0,
	fire_rate			= 70, ---140,
	damage_emp			= 1300, ---635.2 Def.Weapon_Plasmagun_Heavy_T4_Mk1.damage_emp * 1.0,
	crit_chance			= 0,
	class_mask			= ai.ShipClass.LARGE,
	
	projectile_speed	= 30,
	
	projectile		= "Projectile_BossSingularityRedCannon",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_2_beam",
}

Def.Weapon_Plasmagun_Meat_PvE_T1 =
{
	inherit				= "Weapon_Plasmagun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	tier				= 4, 
	drop_weight			= 0,
	fire_rate			= 40, ---70,
	damage_emp			= 1000, ---635.2 Def.Weapon_Plasmagun_Heavy_T4_Mk1.damage_emp * 1.0,
	crit_chance			= 0,
	class_mask			= ai.ShipClass.LARGE,
	
	projectile_speed	= 20,
	
	projectile		= "Projectile_BossSingularityRedCannon",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_2_beam",
}
-- FAST PROJECTILE
Def.Projectile_BossSingularityRedCannon =
{
	inherit			= "Projectile_SingularityCannon",
	effect 			= "particles/weapons/big/plasma_slow_2",
}

Def.PveShieldPurple =
{
	class 		= "ScBaseEntity",
	--model		= "models/shields/shield_pve_2_shock",
	model		= "models/misc/r1_h_t1_cap_wreck",
	maxViewDist = 999999,
}

Def.PveShieldYellow =
{
	class 		= "ScBaseEntity",
	model		= "models/shields/shield_pve_2_yellow",
	--model		= "models/misc/r1_h_t1_cap_wreck",
	maxViewDist = 999999,
}

Def.PveShieldBlue =
{
	class 		= "ScBaseEntity",
	--model		= "models/shields/shield_pve_2_blue",
	model		= "models/misc/r1_h_t1_cap_wreck",
	maxViewDist = 999999,
}

Def.PveShieldRed =
{
	class 		= "ScBaseEntity",
	--model		= "models/shields/shield_pve_2_red",
	model		= "models/misc/r1_h_t1_cap_wreck",
	maxViewDist = 999999,
}

Def.PveEnergyTaran =
{
	class 		= "ScBaseEntity",
	model		= "models/misc/energy_taran_joints",
	maxViewDist = 999999,
	children = 
	{
		{ effect = "particles/gadget/energy_taran", joint = "root" },
		{ effect = "particles/gadget/energy_taran_part", joint = "fx1" },
		{ effect = "particles/gadget/energy_taran_part", joint = "fx2" },
		{ effect = "particles/gadget/energy_taran_part", joint = "fx3" },
		{ effect = "particles/gadget/energy_taran_part", joint = "fx4" },
	}
}

Def.Weapon_ScoutGun_Meat_Inter = 
{
	inherit				= "Weapon_ScoutGun",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	fire_rate			= 300,
	damage_emp		 	= 200,
	tier				= 3, 
	class_mask			= ai.ShipClass.SMALL,
}

Def.Weapon_BossGun_PvE =
{
	inherit				= "Weapon_AlienGun_PvE_T4",
	projectile			= "Projectile_AlienBossGun_PvE",
	fire_rate			= 60,
	projectile_speed	= 30,	
	damage_emp		 	= 3000,
	tier				= 3, 
	max_range 			= 700,
	optimal_range 		= 500,
}

Def.Projectile_AlienBossGun_PvE  =
{
	inherit					= "Projectile_AlienGun",
	model		= "",
	explosion_blast_wave 	= "Blastwave_AlienGun_PvE",
	effect 					= "particles/weapons/other/plasma_orb_unique",
	detonation_radius		= 20,
	flare_color				= "100 255 100 20",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
	is_guided				= false,
}

Def.VitalPoint_ReiderPortal_PVE =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/portal/pirate_portal", 
	--model			= "", --TEST
	physics			= { solid_type = solid.none, static = true },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "reider_portal",
	health			= 3600, -- 7200 #47101
	relationship_group = 2,
	regen_speed		= 15.0,
	regen_max_ally	= 5,
	decay_damage	= 40,
	decay_max_enemy = 12,
	
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
	is_decayable	= false,
	
	precache_skins = true,

	open_effect 	= "particles/jumpgates/pirate_portal_open",
	close_effect	= "particles/jumpgates/pirate_portal_open",	
}

Def.VitalPoint_BigReiderPortal_PVE =
{
	inherit			= "VitalPoint_ReiderPortal_PVE",
	in_editor		= true,
	model			= "models/objects/portal/pirate_portal_big", 
	--model			= "", --TEST
	physics			= { solid_type = solid.none, static = true },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "reider_portal",
	health			= 3600, -- 7200 #47101
	relationship_group = 2,
	regen_speed		= 15.0,
	regen_max_ally	= 5,
	decay_damage	= 40,
	decay_max_enemy = 12,
	
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
	is_decayable	= false,
	
	precache_skins = true,

	open_effect 	= "particles/jumpgates/pirate_portal_open",
	close_effect	= "particles/jumpgates/pirate_portal_open",	
}

Def.Module_HardShield = 
{
	class		= "ActiveModule",
	in_editor	= false,
	activate_entity	= "DynamicHardShield",
	activate_entity_ttl = 500,
	spawn_offset = Vec3( 0, 0, -10 ),
	--spawn_dir_to_target = true,
	attach_bone = "root",
	cooldown	= 500,
	ai_usage			= ai.AiBehavior.SHIELD,
}

Def.DynamicHardShield = 
{
	class		= "BaseEntity",
	in_editor	= false,
	model		= "models/shields/shield_pve_hard",
	physics		= { solid_type = solid.model, material = "ShipMetalMk1", mass = 100, static_collision = false },
}

Def.SM_Wave_Meat_T1 = 
{
	inherit				= "SpaceMissile_Volley_T3_Mk3",
	model  				= "models/weapons/bs_torpedo_mid",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	cooldown			= 5,
	empty_holder_cooldown = 1,
	rocket_class		= ai.RocketClass.LARGE,
	class_mask			= ai.ShipClass.LARGE,
	explosion_blast_wave = "BlastWave_SM_Volley_T1_Wave_Meat",
	effect = "particles/weapons/missile/rocket_trail_small",
	random_trajectory	= true,
	flare_color			= "0 0 0 0",
	flare_size			= 0.0,
	flare_occl_size		= 1,
	flare_aspect		= 1,
	flare_angle			= 180,
	flare_warp			= 0.1,
	flare_nebulosity 	= 0.2,	
	volley_count		= 10,
	volley_timeout		= 0.5,
	max_range			= 500,
	is_guided			= false,
	work_sound 			= "sound/weapons/rockets/rocket_fly",
	launch_sound 		= "sound/weapons/rockets/volley_launch",		
}

Def.SM_Wave_Meat_Low_T1 = 
{
	inherit				= "SM_Wave_Meat_T1",
	volley_count		= 3,
}

Def.SM_Wave_Meat_T0 = 
{
	inherit				= "SpaceMissile_Volley_T3_Mk3",
	model  				= "models/weapons/bs_torpedo_mid",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	cooldown			= 7,
	empty_holder_cooldown = 1,
	rocket_class		= ai.RocketClass.LARGE,
	class_mask			= ai.ShipClass.LARGE,
	explosion_blast_wave = "BlastWave_SM_Volley_T0_Wave_Meat",
	effect = "particles/weapons/missile/rocket_trail_small",
	random_trajectory	= true,
	flare_color			= "0 0 0 0",
	flare_size			= 0.0,
	flare_occl_size		= 1,
	flare_aspect		= 1,
	flare_angle			= 180,
	flare_warp			= 0.1,
	flare_nebulosity 	= 0.2,	
	volley_count		= 7,
	volley_timeout		= 0.5,
	max_range			= 500,
	is_guided			= false,
	work_sound 			= "sound/weapons/rockets/rocket_fly",
	launch_sound 		= "sound/weapons/rockets/volley_launch",		
}

Def.SM_Wave_Meat_Low_T0 = 
{
	inherit				= "SM_Wave_Meat_T0",
	volley_count		= 3,
	cooldown			= 10,
}



Def.SM_Wave_Meat_T3 = 
{
	inherit				= "SpaceMissile_Volley_T3_Mk3",
	model  				= "models/weapons/bs_torpedo_mid",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	cooldown			= 5,
	empty_holder_cooldown = 1,
	rocket_class		= ai.RocketClass.LARGE,
	class_mask			= ai.ShipClass.LARGE,
	explosion_blast_wave = "BlastWave_SM_Volley_T3_Wave_Meat",
	effect = "particles/weapons/missile/rocket_trail_small",
	random_trajectory	= true,
	flare_color			= "0 0 0 0",
	flare_size			= 0.0,
	flare_occl_size		= 1,
	flare_aspect		= 1,
	flare_angle			= 180,
	flare_warp			= 0.1,
	flare_nebulosity 	= 0.2,	
	volley_count		= 10,
	volley_timeout		= 0.5,
	model				= "models/weapons/bs_torpedo_mid",
	max_range			= 500,
	is_guided			= false,
	work_sound 			= "sound/weapons/rockets/rocket_fly",
	launch_sound 		= "sound/weapons/rockets/volley_launch",		
}

Def.SM_Wave_Meat_Low_T3 = 
{
	inherit				= "SM_Wave_Meat_T3",
	volley_count		= 3,
}

Def.SM_Wave_Meat_T5 = 
{
	inherit				= "SpaceMissile_Volley_T3_Mk3",
	model  				= "models/weapons/bs_torpedo_mid",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	cooldown			= 5,
	empty_holder_cooldown = 1,
	rocket_class		= ai.RocketClass.LARGE,
	class_mask			= ai.ShipClass.LARGE,
	explosion_blast_wave = "BlastWave_SM_Volley_T5_Wave_Meat",
	effect = "particles/weapons/missile/rocket_trail_small",
	random_trajectory	= true,
	flare_color			= "0 0 0 0",
	flare_size			= 0.0,
	flare_occl_size		= 1,
	flare_aspect		= 1,
	flare_angle			= 180,
	flare_warp			= 0.1,
	flare_nebulosity 	= 0.2,	
	volley_count		= 10,
	volley_timeout		= 0.5,
	max_range			= 500,
	is_guided			= false,
	work_sound 			= "sound/weapons/rockets/rocket_fly",
	launch_sound 		= "sound/weapons/rockets/volley_launch",		
}

Def.SM_Wave_Meat_Low_T5 = 
{
	inherit				= "SM_Wave_Meat_T5",
	volley_count		= 3,
}

Def.BlastWave_SM_Volley_T1_Wave_Meat 	= 
{
	class						= "BlastWave",
	intensity					= 45,
	damage_kinetic				= 500,
	blast_maxDistance			= 10,
	blast_minDistance			= 2,
	light_radius				= 20,
	light_time					= 0.8,
	in_editor					= false,
	apply_damage				= true,
	apply_shake					= true,
	parent_prototype			= "SpaceMissile_Volley_T3_Mk3",
}

Def.BlastWave_SM_Volley_T0_Wave_Meat 	= 
{
	class						= "BlastWave",
	intensity					= 45,
	damage_kinetic				= 100,
	blast_maxDistance			= 10,
	blast_minDistance			= 2,
	light_radius				= 20,
	light_time					= 0.8,
	in_editor					= false,
	apply_damage				= true,
	apply_shake					= true,
	parent_prototype			= "SpaceMissile_Volley_T3_Mk3",
}

Def.BlastWave_SM_Volley_T3_Wave_Meat 	= 
{
	class						= "BlastWave",
	intensity					= 45,
	damage_kinetic				= 1300.1,
	blast_maxDistance			= 10,
	blast_minDistance			= 2,
	light_radius				= 20,
	light_time					= 0.8,
	in_editor					= false,
	apply_damage				= true,
	apply_shake					= true,
	parent_prototype			= "SpaceMissile_Volley_T3_Mk3",
}

Def.BlastWave_SM_Volley_T5_Wave_Meat 	= 
{
	class						= "BlastWave",
	intensity					= 45,
	damage_kinetic				= 2000.1,
	blast_maxDistance			= 10,
	blast_minDistance			= 2,
	light_radius				= 20,
	light_time					= 0.8,
	in_editor					= false,
	apply_damage				= true,
	apply_shake					= true,
	parent_prototype			= "SpaceMissile_Volley_T3_Mk3",
}


--- пве ракеты
Def.SM_Meat_T3 = 
{
	inherit				= "SpaceMissile_Volley_T3_Mk3",
	model  				= "models/weapons/bs_torpedo_mid",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	cooldown			= 20,
	empty_holder_cooldown = 20,
	rocket_class		= ai.RocketClass.LARGE,
	class_mask			= ai.ShipClass.LARGE,
	explosion_blast_wave = "BlastWave_SM_Volley_T3_Meat",
	effect = "particles/weapons/missile/rocket_trail_small",
	random_trajectory	= true,
	flare_color			= "0 0 0 0",
	flare_size			= 0.0,
	flare_occl_size		= 1,
	flare_aspect		= 1,
	flare_angle			= 180,
	flare_warp			= 0.1,
	flare_nebulosity 	= 0.2,	
	volley_count		= 3,
	volley_timeout		= 0.5,
	speed				= 150,
	max_range			= 450,
	angular_velocity	= 20,
	is_guided			= false,
	work_sound 			= "sound/weapons/rockets/rocket_fly",
	launch_sound 		= "sound/weapons/rockets/volley_launch",		
}

Def.SM_Meat_T5 = 
{
	inherit				= "SpaceMissile_Volley_T5_Mk3",
	model  				= "models/weapons/bs_torpedo_mid",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	cooldown			= 15,
	empty_holder_cooldown = 15,
	rocket_class		= ai.RocketClass.LARGE,
	class_mask			= ai.ShipClass.LARGE,
	explosion_blast_wave = "BlastWave_SM_Volley_T5_Meat",
	effect = "particles/weapons/missile/rocket_trail_small",
	random_trajectory	= true,
	flare_color			= "0 0 0 0",
	flare_size			= 0.0,
	flare_occl_size		= 1,
	flare_aspect		= 1,
	flare_angle			= 180,
	flare_warp			= 0.1,
	flare_nebulosity 	= 0.2,	
	volley_count		= 3,
	volley_timeout		= 0.5,
	speed				= 180,
	max_range			= 500,
	angular_velocity	= 20,
	is_guided			= false,
	work_sound 			= "sound/weapons/rockets/rocket_fly",
	launch_sound 		= "sound/weapons/rockets/volley_launch",		
}

Def.BlastWave_SM_Volley_T3_Meat 	= 
{
	class						= "BlastWave",
	intensity					= 40,
	damage_kinetic				= 1300.1,
	blast_maxDistance			= 8,
	blast_minDistance			= 2,
	light_radius				= 15,
	light_time					= 0.6,
	in_editor					= false,
	apply_damage				= true,
	apply_shake					= true,
	parent_prototype			= "SpaceMissile_Volley_T3_Mk3",
}

Def.BlastWave_SM_Volley_T3_Boss 	= 
{
	class						= "BlastWave",
	intensity					= 45,
	damage_kinetic				= 2600.1,
	blast_maxDistance			= 10,
	blast_minDistance			= 2,
	light_radius				= 20,
	light_time					= 0.8,
	in_editor					= false,
	apply_damage				= true,
	apply_shake					= true,
	parent_prototype			= "SpaceMissile_Volley_T3_Mk3",
}

Def.BlastWave_SM_Volley_T5_Meat 	= 
{
	class						= "BlastWave",
	intensity					= 40,
	damage_kinetic				= 2000.1,
	blast_maxDistance			= 8,
	blast_minDistance			= 2,
	light_radius				= 15,
	light_time					= 0.6,
	in_editor					= false,
	apply_damage				= true,
	apply_shake					= true,
	parent_prototype			= "SpaceMissile_Volley_T5_Mk3",
}

Def.BlastWave_SM_Volley_T5_Boss 	= 
{
	class						= "BlastWave",
	intensity					= 45,
	damage_kinetic				= 4000.1,
	blast_maxDistance			= 10,
	blast_minDistance			= 2,
	light_radius				= 20,
	light_time					= 0.8,
	in_editor					= false,
	apply_damage				= true,
	apply_shake					= true,
	parent_prototype			= "SpaceMissile_Volley_T5_Mk3",
}


Def.SM_Boss_T3 = 
{
	inherit				= "SM_Meat_T3",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	volley_count		= 5,
	explosion_blast_wave = "BlastWave_SM_Volley_T3_Boss",
}

Def.SM_Boss_T5 = 
{
	inherit				= "SM_Meat_T5",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	volley_count		= 5,
	explosion_blast_wave = "BlastWave_SM_Volley_T5_Boss",
}


Def.Module_MeatEnergyLance_T1 = 
{
	inherit				= "Module_EnergyLance_T2_Mk1",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	cooldown			= 0,
	energy_cost			= 0,
	damage_thermal		= 100,
	tier				= 1, 
	work_time			= 3000.0,
	damage_box_size		= Vec3( 10.0, 10.0, 9.5 ),
	--activate_effect 	= "particles/gadget/spire",
	--activate_sound 		= "sound/gadgets/EnergyLance/el_activation",	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,	
	
	ai_usage		 	= ai.AiBehavior.RAM,
}

Def.Module_MeatEnergyLance_T3 = 
{
	inherit				= "Module_EnergyLance_T2_Mk1",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	cooldown			= 0,
	energy_cost			= 0,
	damage_thermal		= 1400,
	tier				= 1, 
	work_time			= 3000.0,
	damage_box_size		= Vec3( 10.0, 10.0, 9.5 ),
	--activate_effect 	= "particles/gadget/spire",
	--activate_sound 		= "sound/gadgets/EnergyLance/el_activation",
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,		
	
	ai_usage		 	= ai.AiBehavior.RAM,
}

Def.Module_MeatEnergyLance_T5 = 
{
	inherit				= "Module_EnergyLance_T2_Mk1",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	cooldown			= 0,
	energy_cost			= 0,
	damage_thermal		= 4500,
	tier				= 1, 
	work_time			= 3000.0,
	damage_box_size		= Vec3( 10.0, 10.0, 9.5 ),
	--activate_effect 	= "particles/gadget/spire",
	--activate_sound 		= "sound/gadgets/EnergyLance/el_activation",	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,	
	
	ai_usage		 	= ai.AiBehavior.RAM,
}

Def.Weapon_ShotGun_Wave_T3_Mk1 = 
{
	inherit				= "Weapon_Railgun_Autofire_T3_Mk3",
	max_range			= 500,
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,	

	fire_rate			= 40,	--80 #61630
	damage_kinetic		= 1400,	---671.6
	crit_chance			= 0,	---0.07
	
	projectile			= "Projectile_BuckshotRailgun",	---#67224
				shot_effect = "particles/weapons/railgun/muzzle_buckshot",
				shot_once_sound = "sound/weapons/railgun/auto",	
}

Def.PvE_wave_WarpGate = 
{
	class		= "ScBaseEntity",
	in_editor	= true,
	uiName		= "Module_WarpGate",
	model		= "models/objects/jump_gates/jumpgate_imper/jumpgate_imper",
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" }, 
	work_sound 	= "sound/gadgets/warpgate/wg_work_loop", 
	damageable		= false,
	relationship_group = 1,
	hudType			= "default",
	maxViewDist		= 5000,
	
	full_activate_effect = "particles/other/wave_portal_open_big",
	
	children = 
	{
		{ def = "JumpgateFx", joint = "root" },
		{ effect = "particles/jumpgates/jumpgate_imper", joint = "root" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_1" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_2" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_3" },
		{ effect = "particles/jumpgates/jumpgate_light_green", joint = "light_4" },
	}
}

-- Ракетная турель AI для пиратской баржи
Def.Turret_Pirate_Barge_Rocket_T1 = 
{
	inherit					= "Turret_Pirate_Barge_Rocket_T3",
	health 					= 10000, 
	death_damage_to_parent 	= 6000,
	optimal_range			= 200,
	max_range				= 350,
	fire_rate				= 20.0,
	projectile				= "Wave_Turret_RocketGun_Missile_T1",
}

Def.Wave_Turret_RocketGun_Missile_T1 = 
{
	inherit				= "Wave_Turret_RocketGun_Missile_T3",
	speed 				= 80,
	explosion_blast_wave= "Turret_RocketGun_Missile_BlastWave_T1",
}

Def.Turret_RocketGun_Missile_BlastWave_T1 =
{
	inherit				= "Turret_RocketGun_Missile_BlastWave_T3",
	damage_thermal		= 300,
}

Def.Turret_Pirate_Barge_Rocket_T0 = 
{
	inherit					= "Turret_Pirate_Barge_Rocket_T3",
	health 					= 4000, 
	death_damage_to_parent 	= 2500,
	optimal_range			= 100,
	max_range				= 350,
	fire_rate				= 15.0,
	projectile				= "Wave_Turret_RocketGun_Missile_T0",
}

Def.Wave_Turret_RocketGun_Missile_T0 = 
{
	inherit				= "Wave_Turret_RocketGun_Missile_T3",
	speed 				= 60,
	explosion_blast_wave= "Turret_RocketGun_Missile_BlastWave_T0",
}

Def.Turret_RocketGun_Missile_BlastWave_T0 =
{
	inherit				= "Turret_RocketGun_Missile_BlastWave_T3",
	damage_thermal		= 150,
}

Def.Turret_Pirate_Barge_Rocket_T3 = 
{
	inherit					= "Turret_RocketGun",
	in_editor			= false,
	pve_scale_power	 		= true,
	relationship_group 		= 2,
	fire_rate				= 30.0,
	health 					= 30000, 
	death_damage_to_parent 	= 30000,
	optimal_range			= 300,
	max_range				= 450,
	projectile				= "Wave_Turret_RocketGun_Missile_T3",
	hudType					= "default",
	hud_visibility_type 	= "minor", 
	physics					= { solid_type = solid.model, static = false, kinematic = true, material = "ShipMetalMk1", mass = 1000000, },
	
	uiName 					= "Raider_RocketTurret",
}

Def.Wave_Turret_RocketGun_Missile_T3 = 
{
	inherit				= "Weapon_BaseRocket",
	in_editor			= false,
	model				= "models/weapons/missile_rocket",

	detonation_radius 	= 5,
	speed 				= 100,
	max_range 			= 300,
	flare_color 		= "255 150 100 15",
	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect = "particles/weapons/missile/rocket_trail_small",
	work_sound 			= "sound/weapons/rockets/rocket_fly",

	flare_texture 		= "textures/star_smooth",
	rocket_class		= ai.RocketClass.SMALL,
	
	explosion_blast_wave= "Turret_RocketGun_Missile_BlastWave_T3",
}

Def.Turret_RocketGun_Missile_BlastWave_T3 =
{
	class				= "BlastWave",
	in_editor			= false,
	intensity			= 30,
	damage_thermal		= 900,
	blast_maxDistance	= 7.5,
	blast_minDistance	= 2,
	light_color 		= "255 100 0 100",
	light_radius 		= 20,
	light_time			= 0.8,
	effect 				= "particles/explosions/big_fire_2",
	sound				= "sound/explosion/small_rocket_expl",
}

Def.Turret_Pirate_Barge_Rocket_T5 = 
{
	inherit					= "Turret_RocketGun",
	pve_scale_power	 	= true,
	relationship_group 		= 2,
	fire_rate				= 40.0,
	health 					= 60000, 
	death_damage_to_parent 	= 80000,
	optimal_range			= 400,
	max_range				= 550,
	projectile				= "Wave_Turret_RocketGun_Missile_T5",
	hudType					= "default",
	hud_visibility_type 	= "minor", 
	physics					= { solid_type = solid.model, static = false, kinematic = true, material = "ShipMetalMk1", mass = 1000000, },
	
	uiName 					= "Raider_RocketTurret",
}

Def.Wave_Turret_RocketGun_Missile_T5 = 
{
	inherit				= "Wave_Turret_RocketGun_Missile_T3",
	speed 				= 80,
	explosion_blast_wave= "Turret_RocketGun_Missile_BlastWave_T5",
}

Def.Turret_RocketGun_Missile_BlastWave_T5 =
{
	inherit				= "Turret_RocketGun_Missile_BlastWave_T3",
	damage_thermal		= 3000,
}

Def.Turret_Pirate_Barge_JerTurret_T1 =
{
	inherit 		= "Turret_Pirate_Barge_JerTurret_T3",
	health 			= 10000,
	projectile_speed = 100,
	death_damage_to_parent = 6000,
	
	damage_emp		= 200,
	
	uiName 			= "Raider_Turret",
}

Def.Turret_Pirate_Barge_JerTurret_T0 =
{
	inherit 		= "Turret_Pirate_Barge_JerTurret_T3",
	health 			= 4000,
	projectile_speed = 80,
	death_damage_to_parent = 2500,
	
	damage_emp		= 75,
	
	uiName 			= "Raider_Turret",
}

Def.Turret_Pirate_Barge_JerTurret_T3 =
{
	inherit 		= "Turret_Team1_Pve_PlayerRailgun",
	pve_scale_power	 	= true,
	class 			= "Turret",
	in_editor		= false,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 2,

	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "ShipMetalMk1" },
	health 			= 20000,
	death_damage_to_parent = 30000,
	damageable		= true,
	
	fire_rate		= 30.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 400,
	max_range		= 550,
	projectile_speed = 100,
	
	damage_kinetic	= 0,
	damage_emp		= 3000,
	damage_thermal	= 0,
	
	max_rot_speed	= 90,	-- deg per second

	projectile		= "Projectile_BossSingularityRedCannon",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_tiny",
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot", 
	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName 			= "Raider_Turret",
}

Def.Turret_Pirate_Barge_JerTurret_T5 =
{
	inherit 		= "Turret_Pirate_Barge_JerTurret_T3",
	projectile_speed = 250,

	damage_emp		= 6000,

	uiName 			= "Raider_Turret",
}

Def.Turret_Pirate_Barge_BigJerTurret_T1 =
{
	inherit 		= "Turret_Pirate_Barge_BigJerTurret_T3",
	health 			= 10000,
	death_damage_to_parent 	= 6000,

	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "ShipMetalMk1" },
	
	fire_rate		= 10.0,
	projectile_speed = 50,
	
	damage_emp		= 400,

	projectile		= "Projectile_BossSingularityRedBigCannon",

	uiName 			= "Raider_Turret",
}

Def.Turret_Pirate_Barge_BigJerTurret_T0 =
{
	inherit 		= "Turret_Pirate_Barge_BigJerTurret_T3",
	health 			= 4000,
	death_damage_to_parent 	= 2500,

	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "ShipMetalMk1" },
	
	fire_rate		= 10.0,
	projectile_speed = 40,
	
	damage_emp		= 100,

	projectile		= "Projectile_BossSingularityRedBigCannon",

	uiName 			= "Raider_Turret",
}


Def.Turret_Pirate_Barge_BigJerTurret_T3 =
{
	inherit 		= "Turret_Pirate_Barge_JerTurret_T3",

	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "ShipMetalMk1" },
	
	fire_rate		= 10.0,
	projectile_speed = 50,
	
	damage_emp		= 5000,

	projectile		= "Projectile_BossSingularityRedBigCannon",

	uiName 			= "Raider_Turret",
}

Def.Turret_Pirate_Barge_BigJerTurret_T5 =
{
	inherit 		= "Turret_Pirate_Barge_BigJerTurret_T3",

	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "ShipMetalMk1" },
	
	fire_rate		= 10.0,
	projectile_speed = 50,
	
	damage_emp		= 5000,

	projectile		= "Projectile_BossSingularityRedBigCannon",

	uiName 			= "Raider_Turret",
}
-- VERYSLOW
Def.Projectile_BossSingularityRedBigCannon =
{
	inherit			= "Projectile_SingularityCannon",
	effect 			= "particles/weapons/big/plasma_slow_2",
	damage_radius	= 8,
}

Def.Turret_Pirate_Barge_PlasmaCannon =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/turret/big_plasma_cannon/big_plasma_cannon",

	physics			= { solid_type = solid.compound_model, static = false, kinematic = true, material = "ShipMetalMk1"  },
	damageable		= false,

--	relationship_group = ai.RelationshipGroups.Pirate,
--	health 			= 75000,
--	hudType			= "default",
--	hud_visibility_type = "minor",
	
	uiName = "Turret_Damaged_PlasmaCannon_name",
}


--- ДЛ NY15 эвента на станциях
Def.Turret_Pirate_Barge_JerTurret_OW =
{
	inherit			= "Turret_Pirate_Barge_JerTurret_T3",
	death_damage_to_parent = 60000,	--x2
	respawn_time	= 60,
	fire_rate		= 25.0,
	
	optimal_range	= 200,
	max_range		= 350,
	projectile_speed = 90,
	
	damage_emp		= 900,
}


Def.Wave_Turret_RocketGun_Missile_OW = 
{
	inherit				= "Wave_Turret_RocketGun_Missile_T3",
	speed 				= 80,
	explosion_blast_wave= "Turret_RocketGun_Missile_BlastWave_OW",
}

Def.Turret_RocketGun_Missile_BlastWave_OW =
{
	inherit				= "Turret_RocketGun_Missile_BlastWave_T3",
	damage_thermal		= 500,
}

Def.Turret_Pirate_Barge_Rocket_OW =
{
	inherit 		= "Turret_Pirate_Barge_Rocket_T1",
	death_damage_to_parent 	= 60000,
	optimal_range	= 200,
	max_range		= 350,
	respawn_time	= 60,
	fire_rate				= 30.0,
	projectile				= "Wave_Turret_RocketGun_Missile_OW",
}

Def.Turret_Pirate_Barge_BigJerTurret_OW =
{
	inherit 		= "Turret_Pirate_Barge_BigJerTurret_T3",
	death_damage_to_parent 	= 60000,
	optimal_range	= 200,
	max_range		= 350,
	respawn_time	= 60,
	fire_rate		= 10.0,
	
	damage_emp		= 1500,
}




--разобраться, что это
Def.PvE_Lights_Beam = 
{
	class           = 	"BeamEntity",
	in_editor       =   true,
	
	use_team_skin	= true,
	
	color 			= { s1 = "124 204 252 4", s2 = "254 139 122 4" },
}


-- cтанция поддержки для волнового ПвЕ
Def.Support_Station =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
		
	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" }, 
	damageable		= false,
	health			= 500000,
	remove_on_death = false,
	relationship_group 		= 1,

	--active_aura		= "Wave_Pve_StanceBonus",
	
	relationship_group = 1,
	maxViewDist 	= 5000,
	hudType			= "major",
	hud_visibility_type = "major",
	vision_always = true,
	--hud_ico 		= "upgradeSlot_SHIELD",	
	
	uiName			= "BeaconA",
}

Def.Module_Wave_SniperWarpGate = 
{
	inherit					= "Module_WarpGate_T4_Mk1",
	spawn_dir_to_aim 		= true,
	ai_usage 				= ai.AiBehavior.SNIPER,
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	cooldown			= 0,
	energy_cost			= 0,	 
}

Def.Boss_Torpedo_W =
{
	inherit 					= "Weapon_BaseRocket",
	model						= "models/weapons/bs_torpedo",
	physics						= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk1", mass = 10000 },
	relationship_group	 		= 2,
	
	is_guided					= true,
	use_pathfinder 				= true,
	angular_velocity			= 33,
	damageable					= true,
	health						= 2000,
	speed						= 40,
	max_range					= 1200,
	time_to_live				= 30,
	
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	
	hud_visibility_type			= "major",
	hudType						= "default",	
	uiName 						= "Kamikaze",
	
	spell_on_spawn				= "Spell_CruiserTorpedo_W",
	
	explosion_blast_wave		= "BlastWave_Torpedo_RW",
	--death_blast_wave			= "BlastWave_Torpedo_RW",
	detonation_radius			= 2.0,
	flare_color					= "0 0 0 0",
	flare_size					= 0.01,
	flare_angle					= 10,
	effect						= "particles/weapons/torpedo/torpedo_tail",
	launch_sound		 		= "sound/raid/boss_rocket_launch",
	work_sound					= "sound/dreadnought/torpedo_engine",
	start_effect                = "particles/weapons/torpedo/torpedo_start",
}

Def.BlastWave_Torpedo_W = 
{
	class						= "BlastWave",
	intensity					= 200,
	damage_thermal				= 5000,
	blast_maxDistance			= 20,
	blast_minDistance			= 2,

	effect = "particles/explosions/big_fire_2",
	light_color = "255 100 0 100",
	light_radius = 20,
	light_time = 0.8,
	sound = "sound/explosion/big_rocket_expl",
	
	in_editor					= false,
	apply_damage				= true,
	parent_prototype			= "SpaceMissile_Nuke_T5_Mk3",
}

Def.Module_Pulsar_Wave_T3 =
{
	class					= "ActiveModule",
	module_type 			= ai.ModuleType.ACTIVE, 
	
	--inherit					= "Module_SmartBomb_T4_Mk1",
	cooldown 				= 10,
	energy_cost				= 0,
	spell					= "Pve_Wave_Pulsar_T3",
	uiName 					= "Module_SmartBomb",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

Def.Module_Pulsar_Wave_T5 =
{
	class					= "ActiveModule",
	module_type 			= ai.ModuleType.ACTIVE, 
	
	--inherit					= "Module_SmartBomb_T4_Mk1",
	cooldown 				= 10,
	energy_cost				= 0,
	spell					= "Pve_Wave_Pulsar_T5",
	uiName 					= "Module_SmartBomb",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
}

Def.PvE_wave_HugeCargo_Additional =
{
	class						= "ScBaseEntity",
	damageable					= false,
	in_editor					= true,
	relationship_group	 		= 2,
	
	uiName			= "CargoShip_pirate",
	model			= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat", 
	
	children =
	{			
		{ effect = "particles/ships/cargo_antenna", joint = "fx1" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx2" },
		{ effect = "particles/ships/cargo_light_sides", joint = "fx3" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx4" },
		{ effect = "particles/ships/cargo_light_front", joint = "fx5" },
		{ def = "Pirate_FakeBarge_Engine", joint = "dvig1", }, -- двигатель без звука
		{ def = "Pirate_FakeBarge_Engine", joint = "dvig2", }, -- двигатель без звука
		{ def = "Pirate_FakeBarge_Engine", joint = "dvig3", }, -- двигатель без звука
		{ def = "Pirate_FakeBarge_Engine", joint = "dvig4", }, -- двигатель без звука
	},
}

Def.Pirate_FakeBarge_Engine =
{
	class 			= "ScBaseEntity",
	in_editor		= false,
		
	model			= "models/objects/ships_huge/pirat/freighter_pirat/freighter_pirat_dvigatel",
	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1", mass = 1000, }, 
	damageable		= false,
	maxViewDist 	= 5000,
	uiName			= "ReiderBargeEngine",		
}

-- портал-дыра к предтечам большая Raid_Pve
Def.OpenWorld_ReiderJumpgate_XL =
{
	class			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/objects/portal/pirate_portal_big", 
	--model			= "", --TEST
	damageable		= false,
	physics			= { solid_type = solid.none, static = true }, --model compound_model none
	uiName			= "AlienPortal_XL_name",
	is_decayable	= false,
	idle_sound_distance = 1000,
	idle_sound 		= "sound/raid/boss_gate_loop",
	death_sound		= "sound/ambient/alien_portal_off",

	activation_beam_fx	= "particles/gadget/drone_beam",
	
	vision_always = true,
}

-------------------------------------------------------------------------------------------------------------------------------
-- для PvE_RW
-------------------------------------------------------------------------------------------------------------------------------

Def.Weapon_Plasmagun_Kamikadze = 
{
	inherit				= "Weapon_Plasmagun_Basic_T4_Mk1",
	optimal_range		= 1,
	max_range			= 1,

 	storeItemId			= 0,
	cant_be_bought		= true,
	drop_weight			= 0,	

	tier				= 4, 
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
}

Def.BlastWave_Kamikadze_Explode = 
{
	class 				= "BlastWave",
	in_editor			= false,
	apply_shake			= false,
	
	damage_kinetic		= 2000.0,
	damage_emp			= 0.0,
	damage_thermal		= 0.0,

	light_radius		= 30.0,
	light_color			= "255 130 100 255",
	light_time			= 1.3,

	blast_maxDistance	= 19, 
	
	default_icon		= "damage_explosionBlastwave",	
	uiName				= "damage_shipExplodeBlastWave",	-- для нормального отображения в DeathRecap
}

Def.SM_Rocket_RW = 
{
	inherit				= "SpaceMissile_Volley_T4_Mk3",
	model  				= "models/weapons/bs_torpedo_mid",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	cooldown			= 10,
	empty_holder_cooldown = 10,
	rocket_class		= ai.RocketClass.LARGE,
	class_mask			= ai.ShipClass.LARGE,
	explosion_blast_wave = "BlastWave_SM_Volley_T1_Mk3",
	effect = "particles/weapons/missile/rocket_trail_mid",
	random_trajectory	= true,
	flare_size			= 0.0,
	flare_occl_size		= 1,
	flare_aspect		= 1,
	flare_angle			= 180,
	flare_warp			= 0.1,
	flare_nebulosity	= 0.2,	
	volley_count		= 5,
	volley_timeout		= 1,	
}

Def.Weapon_LaserGun_RW =
{
	inherit = "Weapon_LaserGun",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,
	relationship_group = ai.RelationshipGroups.Alien,	

	--model = "models/weapons/lasers/power/l_training",
	
	fire_rate = 60,
	impulse_time = 1,
	dispersion = 0,
	
	optimal_range = 700,
	max_range = 700,
	
	damage_thermal = rw_ld[5], -- 200
	--spell
	--spell_on_hit = "Spell_Cold_Ray",
	--spell_on_hit_timeout = 1,
	shot_loop_sound = "sound/weapons/ColdRay/cd_start_loop",
	hit_loop_sound = "sound/hit/laser_loop",
	
	heat_max = 100,
	
	uiName = "CruiserAlien_Turret_name",
	beam_fx = "particles/weapons/laser/alien_beam_small",
	hit_fx = "particles/weapons/laser/alien_hit_small",
	network_sync = true,
	
	barrel_rot_speed = 10000,
	barrel_rot_speed_fire = 6,
	no_friendly_fire = true,
	is_standalone_module = true, -- SC-111922
}	

Def.Weapon_LaserGun_RW_ow =
{
	inherit = "Weapon_LaserGun_RW",
	damage_thermal = rw_ld[4], -- 200
	optimal_range = 800,
	max_range = 800,
	barrel_rot_speed_fire = 5,
}	

Def.Weapon_LaserGun_RW_t4 =
{
	inherit = "Weapon_LaserGun_RW",
	damage_thermal = rw_ld[4], -- 200
	optimal_range = 600,
	max_range = 600,
	barrel_rot_speed_fire = 5,
}	

Def.Weapon_LaserGun_RW_t3 =
{
	inherit = "Weapon_LaserGun_RW",
	damage_thermal = rw_ld[3], -- 200
	optimal_range = 500,
	max_range = 500,
	barrel_rot_speed_fire = 4,
}	

Def.Weapon_LaserGunBig_RW =
{
	inherit = "Weapon_LaserGun",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	

	relationship_group = ai.RelationshipGroups.Alien,
	--model = "models/weapons/lasers/power/l_training",
	
	fire_rate = 60,
	impulse_time = 1,
	dispersion = 0,
	
	optimal_range = 1500,
	max_range = 1500,
	
	damage_thermal = rw_md[5], -- 200
	--spell
	--spell_on_hit = "Spell_Cold_Ray",
	--spell_on_hit_timeout = 1,
	shot_loop_sound = "sound/weapons/ColdRay/cd_start_loop",
	hit_loop_sound = "sound/hit/laser_loop",
	
	heat_max = 100,
	
	uiName = "CruiserAlien_Turret_name",
	beam_fx = "particles/weapons/laser/alien_beam_big",
	hit_fx = "particles/weapons/laser/alien_hit_big",
	network_sync = true,
	
	barrel_rot_speed = 10000,
	barrel_rot_speed_fire = 20,
	no_friendly_fire = true,
	is_standalone_module = true, -- SC-111922
}	

Def.Weapon_LaserGunBig_RW_t4 =
{
	inherit = "Weapon_LaserGunBig_RW",
	damage_thermal = rw_md[4], -- 200
	barrel_rot_speed_fire = 18,
}

Def.Weapon_LaserGunBig_RW_t3 =
{
	inherit = "Weapon_LaserGunBig_RW",
	damage_thermal = rw_md[3], -- 200
	barrel_rot_speed_fire = 16,
}


Def.Cruiser_Torpedo_RW =
{
	inherit 					= "Weapon_BaseRocket",
	model						= "models/objects/ships_huge/prec_destroyer/prec_orpedo",
	physics						= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk3", mass = 10000 },
	relationship_group	 		= ai.RelationshipGroups.Alien,
	
	is_guided					= true,
	random_trajectory			= true,
	use_pathfinder 				= true,
	angular_velocity			= 10,
	damageable					= true,
	health						= 15000,
	speed						= 60,
	
	max_range					= 1500,
	time_to_live				= 50,
	
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	
	hud_visibility_type			= "major",
	hudType						= "default",	
	uiName 						= "itemSubType_Torpedo",
	
	--spell_on_spawn				= "Spell_CruiserTorpedo_RW",
	
	explosion_blast_wave		= "BlastWave_Torpedo_RW",
	--death_blast_wave			= "BlastWave_Torpedo_RW",
	detonation_radius			= 2.0,
	flare_color					= "0 0 0 0",
	flare_size					= 0.01,
	flare_angle					= 10,
	
--	launch_sound		 		= "sound/raid/boss_rocket_launch",
	launch_sound		 		= "sound/raid/boss_torpedo_launch",
--	work_sound					= "sound/dreadnought/torpedo_engine",
	work_sound					= "sound/raid/boss_torpedo_fly",
	
	death_effect				= "",
	--start_effect                = "particles/weapons/torpedo/torpedo_start",
	children = 
	{
		{ effect = "particles/weapons/missile/rocket_trail_alien_mid", joint = "fx1" },
		{ effect = "particles/weapons/torpedo/alien_torpedo_core", joint = "fx2" },
	},
	
	points_reward_assist_damage = 80,

	gameplay_coef_group_id		= 0,
	gameplay_coef_min_lifetime	= 2,
}

Def.PvE_Gen_ActivatotObject = 
{

	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_distance		= 50,
	interaction_time 			= 5,
	build_object				= true, 
	model						= "models/objects/gameplay/bombball/beacon_rotate",	
	physics						=	{ solid_type = solid.none },	
	uiName 						=	"PvE_Gen_ActivatorObject",
	interacted_sound			= 	"sound/game/bomb_carrier_sound_take",
	hud_ico						= "secretDocs",	
	damageable					= false,
	maxViewDist					= 5000,
	special_object  			= true,
	vision_always	 			= true,
	hudType						= "default",
	hud_visibility_type 		= "major",
	relationship_group 			= 1,	
	children = 
	{
		{ def = "PvE_Gen_Activator_Child",	joint = "drone03" },
	},	
}

Def.PvE_Gen_BuilderObject = 
{

	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_distance		= 50,
	interaction_time 			= 5,
	build_object				= true, 
	model						= "models/objects/gameplay/bombball/beacon_rotate",	
	physics						=	{ solid_type = solid.none },	
	uiName 						=	"PvE_Gen_ActivatorObject",
	interacted_sound			= 	"sound/game/bomb_carrier_sound_take",
	hud_ico						= "secretDocs",	
	damageable					= false,
	maxViewDist					= 5000,
	special_object  			= true,
	vision_always	 			= true,
	hudType						= "default",
	hud_visibility_type 		= "major",
	relationship_group 			= 1,	
	children = 
	{
		{ def = "PvE_Gen_Activator_Child",	joint = "drone03" },
	},	
}

Def.PvE_Gen_Activator_Child =
{
	class				= "ScBaseEntity",
	uiName				= "LootCrate_Gen_PvE_Bombs_name",
--	hudType				= "bomb",
	relationship_group 	= 1,
	damageable			= false,
	physics				= { solid_type = solid.none },
	model				= "models/weapons/drones/anomaly_bot/anomaly_bot",
}

Def.PvE_Gen_ActivatotObject2 = 
{

	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_distance		= 50,
	interaction_time 			= 5,
	build_object				= true, 
	model						=	"models/weapons/drones/anomaly_bot/anomaly_bot",
	physics						=	{ solid_type = solid.none },	
	hud_ico						= "secretDocs",	
	damageable					= false,
	maxViewDist					= 5000,
	special_object  			= true,
	vision_always	 			= true,
	hudType						= "default",
	hud_visibility_type 		= "major",
	uiName 						=	"PvE_Gen_ActivatorObject",
	interacted_sound			= 	"sound/game/bomb_carrier_sound_take",
	relationship_group 			= 1,	
}

Def.PvE_Gen_KillAllObject = 
{

	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_distance		= 50,
	interaction_time 			= 5,
	build_object				= false, 
	model						=	"models/weapons/drones/anomaly_bot/anomaly_bot",
	physics						=	{ solid_type = solid.none },	
	hud_ico						= "secretDocs",	
	damageable					= false,
	maxViewDist					= 5000,
	special_object  			= true,
	vision_always	 			= true,
	hudType						= "default",
	hud_visibility_type 		= "major",
	uiName 						=	"PvE_Gen_KillAllObject",
	interacted_sound			= 	"sound/game/bomb_carrier_sound_take",
	relationship_group 			= 1,	
}

Def.PvE_Gen_RepairAllGens = 
{

	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_distance		= 50,
	interaction_time 			= 5,
	build_object				= false, 
	model						=	"models/weapons/drones/anomaly_bot/anomaly_bot",
	physics						=	{ solid_type = solid.none },	
	hud_ico						= "secretDocs",	
	damageable					= false,
	maxViewDist					= 5000,
	special_object  			= true,
	vision_always	 			= true,
	hudType						= "default",
	hud_visibility_type 		= "major",
	uiName 					=	"PvE_Gen_RepairAllGens",
	interacted_sound		= 	"sound/game/bomb_carrier_sound_take",
	relationship_group 			= 1,	
}

Def.PvE_Gen_HackAllEnemy = 
{

	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_distance		= 50,
	interaction_time 			= 5,
	build_object				= false, 
	model						=	"models/weapons/drones/anomaly_bot/anomaly_bot",
	physics						=	{ solid_type = solid.none },	
	hud_ico						= "secretDocs",	
	damageable					= false,
	maxViewDist					= 5000,
	special_object  			= true,
	vision_always	 			= true,
	hudType						= "default",
	hud_visibility_type 		= "major",
	uiName 					=	"PvE_Gen_HackAllEnemy",
	interacted_sound		= 	"sound/game/bomb_carrier_sound_take",
	relationship_group 			= 1,	
}

Def.PvE_Gen_SlowAllEnemy = 
{

	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_distance		= 50,
	interaction_time 			= 5,
	build_object				= false, 
	model						=	"models/weapons/drones/anomaly_bot/anomaly_bot",
	physics						=	{ solid_type = solid.none },	
	hud_ico						= "secretDocs",	
	damageable					= false,
	maxViewDist					= 5000,
	special_object  			= true,
	vision_always	 			= true,
	hudType						= "default",
	hud_visibility_type 		= "major",
	uiName 					=	"PvE_Gen_SlowAllEnemy",
	interacted_sound		= 	"sound/game/bomb_carrier_sound_take",
	relationship_group 			= 1,	
}

Def.PvE_Gen_DebuffAllEnemy = 
{

	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_distance		= 50,
	interaction_time 			= 5,
	build_object				= false, 
	physics						= { solid_type = solid.none },	
	model						= "models/objects/gameplay/bombball/beacon_rotate",	
	hud_ico						= "secretDocs",	
	damageable					= false,
	maxViewDist					= 5000,
	special_object  			= true,
	vision_always	 			= true,
	hudType						= "default",
	hud_visibility_type 		= "major",
	uiName 						= "PvE_Gen_DebuffAllEnemy",
	interacted_sound			= "sound/game/bomb_carrier_sound_take",
	relationship_group 			= 1,	
	children = 
	{
		{ def = "LootCrate_Gen_Raid_AttachedMine",	joint = "drone03" },
	},	
}

Def.Cruiser_Torpedo_RW_t4 =
{
	inherit 					= "Cruiser_Torpedo_RW",
	health						= 8000,
	speed						= 50,
	
	gameplay_coef_min_lifetime	= 1.5,
}

Def.Cruiser_Torpedo_RW_t3 =
{
	inherit 					= "Cruiser_Torpedo_RW",
	health						= 6000,
	speed						= 40,
	
	gameplay_coef_min_lifetime	= 1,
}

Def.Cruiser_Torpedo_RW_Roi =
{
	inherit 					= "Weapon_BaseRocket",
	--model						= "models/objects/ships_huge/prec_ship/prec_drone2",
	relationship_group	 		= ai.RelationshipGroups.Alien,
	
	is_guided					= true,
	use_pathfinder 				= true,
	damageable					= true,
	
	max_range					= 1500,
	time_to_live				= 50,
	
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	
	--spell_on_spawn				= "Spell_CruiserTorpedo_RW",
	
	explosion_blast_wave		= "BlastWave_Torpedo_RW",
	--death_blast_wave			= "BlastWave_Torpedo_RW",
	flare_color					= "0 0 0 0",
	flare_size					= 0.01,
	flare_angle					= 10,
	
	work_sound					= "sound/raid/boss_torpedo_fly",
	
	start_effect                = "particles/weapons/torpedo/torpedo_start",

	
	health						= 2000,
	speed						= 50,
	angular_velocity			= 45,
	detonation_radius			= 1.0,

	hudType						= "default",	
	hud_visibility_type			= "minor",
	uiName 						= "DroidAlien_name",
	
	model			= "models/objects/ships_huge/prec_ship/prec_drone2", 
	physics			= { solid_type = solid.model, material = "ShipMetalMk1", mass = 1000, },
	launch_sound		= " ",
	death_sound			= "sound/explosion/drone_expl",
	
	trail_effect 			= "particles/ships/ship_trail",
	trail_color 			= "4 95 184 100",
	trail_size 				= 0.05,
}


Def.BlastWave_Torpedo_RW = 
{
	class						= "BlastWave",
	intensity					= 200,
	damage_thermal				= 25000*10,	--#64168
	blast_maxDistance			= 20,
	blast_minDistance			= 2,

	effect = "particles/explosions/objects/alien_explosion",
	light_color = "255 100 0 100",
	light_radius = 20,
	light_time = 0.8,
	sound = "sound/explosion/big_rocket_expl",
	
	in_editor					= false,
	apply_damage				= true,
	parent_prototype			= "SpaceMissile_Nuke_T5_Mk3",
}

Def.VitalPoint_ShieldPortal_RW =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	--model			= "models/shields/portal",
	--model			= "models/objects/vital_point/energy_station/generator/generator",
	model			= "models/objects/gameplay/bombball/bombball",


	physics			= { solid_type = solid.none },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "ShieldPortal_RW_name",

	health			= 3600,
	relationship_group = ai.RelationshipGroups.Alien,
	regen_speed		= 15.0,
	regen_max_ally	= 5,
	decay_damage	= 120,
	decay_max_enemy = 12,
	
	idle_sound 		= "sound/ambient/alien_portal_loop",
	death_sound		= "sound/ambient/alien_portal_off",
	
	friendly_beam_fx= "particles/objects/portal_close_beam",
	hostile_beam_fx = "particles/objects/portal_close_beam",
	activation_beam_fx	= "particles/objects/prec_cruiser_portal_beam",

	vision_always	= true,
	
	turret_def1 	= "",
	turret_def2 	= "",
	turret_def3 	= "",
	turret_def4 	= "",
	damageable		= true,
	is_decayable	= true,
	
	--hudType			= "default",
	--hud_visibility_type = "major",
	hud_ico			= "CS_A",	
}

Def.RW_AsteroidSize1 =
{
	damageable		= true,
	class 			= "ScBaseEntity",
	health			= 200000,

	model			= "models/objects/asteroids/as_size_1",
	in_editor		= true,
	killable 		= true,
	remove_on_death = true,

	physics			= { solid_type = solid.compound_model, static = true, material = "Rock", mass = 1000000, },
	as_static		= true,

	maxViewDist		= 30000,

	scale_offset	= 100, 
	scale_dist 		= 900,
	scale_power 	= 1.7,
	transp_offset	= 900, 
	transp_dist		= 100,
	transp_power	= 1,
	death_effect	= "particles/explosions/asteroid_explosion_size1",
	death_sound		= "sound/raid/asteroid_explosion",
	uiName			= "MovingAsteroid",
}
Def.RW_AsteroidSize2 =
{
	inherit			= "RW_AsteroidSize1",
	model			= "models/objects/asteroids/as_size_2", 
	death_effect	= "particles/explosions/asteroid_explosion_size2",
}
Def.RW_AsteroidSize3 =
{
	inherit			= "RW_AsteroidSize1",
	model			= "models/objects/asteroids/as_size_3",
	death_effect	= "particles/explosions/asteroid_explosion_size3",	
}
Def.RW_AsteroidSize4 =
{
	inherit			= "RW_AsteroidSize1",
	model			= "models/objects/asteroids/as_size_4",
	death_effect	= "particles/explosions/asteroid_explosion_size4",
}


--NewBie Pve bot gun
Def.Weapon_NB_Meat_PvE =
{
	inherit				= "Weapon_Plasmagun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	tier				= 1, 
	drop_weight			= 0,
	fire_rate			= 60,
	damage_emp			= Def.Weapon_Plasmagun_Heavy_T4_Mk1.damage_emp * 1.0,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
	
	projectile_speed	= 30,
	
	projectile		= "Projectile_NB_BossSingularity",
	shot_beam_fx 	= "particles/empty",
}

Def.Projectile_NB_BossSingularity =
{
	inherit			= "Projectile_SingularityCannon",
	effect 			= "particles/weapons/other/plasma_orb_unique",
}

Def.Weapon_NB_Meat_PvE2 =
{
	inherit				= "Weapon_Plasmagun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	tier				= 1, 
	drop_weight			= 0,
	fire_rate			= 30,
	damage_emp			= Def.Weapon_Plasmagun_Heavy_T4_Mk1.damage_emp * 1.0,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
	
	projectile_speed	= 30,
	
	projectile		= "Projectile_NB_BossSingularity2",
	shot_beam_fx 	= "particles/empty",
}

Def.Projectile_NB_BossSingularity2 =
{
	inherit			= "Projectile_SingularityCannon",
	effect 			= "particles/weapons/other/plasma_orb_unique",
}

Def.Weapon_NB_Meat_PvE3 =
{
	inherit				= "Weapon_Plasmagun_Heavy_T4_Mk1",
	storeItemId			= 0,
	cant_be_bought  	= true,
	tier				= 1, 
	drop_weight			= 0,
	fire_rate			= 30,
	damage_emp			= Def.Weapon_Plasmagun_Heavy_T4_Mk1.damage_emp * 1.0,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
	
	projectile_speed	= 30,
	
	projectile		= "Projectile_NB_BossSingularity3",
	shot_beam_fx 	= "particles/empty",
}

Def.Projectile_NB_BossSingularity3 =
{
	inherit			= "Projectile_SingularityCannon",
	effect 			= "particles/weapons/other/plasma_orb_unique",
}

Def.Weapon_NB_Meat_PvE4 =
{
	inherit			= "Weapon_Plasmagun_Basic_T1_Mk1",
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
	class_mask		= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
}

Def.Weapon_NB_Meat_PvE5 =
{
	inherit			= "Weapon_Railgun_Basic_T1_Mk1",
	storeItemId		= 0,
	cant_be_bought  = true,
	drop_weight		= 0,
	class_mask		= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
	fire_rate		= 10,
}


-------------------------------------------------------------------------------------------------------------------------------
---- RW бомбы и прочее
-- мина #55564
Def.Interactive_Mine =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/turret/round_railgun01/round_railgun01_holder",
	physics			= { solid_type = solid.model, static = true, material = "Metal" }, 
	damageable		= false,

	detonation_time = 5.0,
	detonation_distance = 10.0;
}


--#48491

Def.RW_BombDispenser =
{
	class				= "AnimatedEntity",
	in_editor 			= true,
	network_sync		= true,
	---use_team_skin 				= true,
	---bomb_respawn_time	= 30,
	model				=	"models/objects/gameplay/platform/platform_bomb",
	physics				=	{ solid_type = solid.compoun_model, static = true, material = "ShipMetalMk1", },
	---bomb				= "RW_Bomb",
	skin = "s1",
	wow_times			 = { 10, 0 },
	
	bomb_bone			= "Bomb",
	
	children = 
	{
		{ def = "RW_Bomb_Hologram", joint = "Bomb" },
	},	
	
	hud_ico				= "ClanShip_Bomb",
}

Def.RW_Bomb_Hologram =
{
	class				= "ScBaseEntity",	
	model				=	"models/objects/gameplay/bombball/bombball_hologram",
	physics				=	{ solid_type = solid.none },	
	---use_team_skin 				= true,
}


Def.RW_Bomb =
{
	---class				= "ClanShipBomb",	
	class				= "ScBaseEntity",
	model				=	"models/objects/gameplay/bombball/bombball_orbit",
	physics				=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3},
	
	---pick_up_time		= 3,
	---plant_time			= 10,
	detonation_time		= 7.0,
	detonation_distance = 10.0;
	
	hudType				= "bomb",
	vision_always 		= true,
	---damage				= health_big_slot / 2, -- дамаг маяку при взрыве
	---clanship_damage		= 100, -- дамаг дредноуту при взрыве
	
	---take_sound			= "sound/game/bomb_carrier_sound_take",
	---plant_sound			= "sound/game/bomb_carrier_sound_plant",	
	
	---explosion 			= "RW_Bomb_Blastwave",
	
	---explode_on_drop		= true, 
	uiName				= "ClanShip_Bomb",
}

Def.RW_Bomb_Blastwave =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 400000,
	blast_maxDistance	= 45,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/other/dreadnought_plasma_hit2",
	explosion_light		= "RW_Bomb_Lights",
	sound 				= "sound/dreadnought/big_cannon_hit",
	uiName				= "rw_bomb_blastwave",
	--
}

Def.RW_Bomb_Lights =
{
	class				= 'PointLight',
	alpha				= 'zspmjga',
	fps					= 3.33,
	rad					= 800,
	color				= "170 150 255 255",
}

Def.Helpers_DistPoint = 
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

Def.Module_TargetPainter_Pve_Huge_30 = 
{
	class				= "ActiveModule",
	storeItemId			= 0,
	in_editor			= false,
	cant_be_bought	  	= true,
	drop_weight			= 0,

	cooldown			= 10,
	energy_cost			= 10,
	energy_cost_per_second = 10,
	spell				= "Pve_Huge_Resist_Dec_30",
	max_range			= 400,
	trigger_aura		= true,
	work_beam_fx		= "particles/gadget/default_beam",
	activate_module_effect = "particles/gadget/default_module_work",
	model				= "models/modules/m_active/m_a_gadget_beamer",
	module_type			= ai.ModuleType.ACTIVE,
	default_icon		= "ItemSubtype_TargetPainter",
	item_subtype		= ItemSubtype.TargetPainter,
}

Def.Module_TargetPainter_Pve_Huge_50 = 
{
	inherit				= "Module_TargetPainter_Pve_Huge_30",
	spell				= "Pve_Huge_Resist_Dec_50",
	max_range			= 600,
}
			--Модули заглушки для ботов в новой пве -- 
			
Def.Module_FrigateDrone_Base_Special_PvE=
{
	inherit="Module_FrigateDrone_T3_Base",
	energy_cost			= 330,
	cooldown			= 3,
	heal_per_second		= 165,
	drone_num			= 2,
	activate_entity_health		= 2900,
	fire_rate			= 100,
	damage_thermal		= 3,
}
            -- КОНТЕНТ ДЛЯ  НОВОЙ ПВЕ s1550_pve_bigship_building_2--




--Вражеские маяки для захвата s1550_pve_bigship_building_2

Def.VitalPoint_PVE_bigship_building_1 =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_tower/control_tower",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	
	health			= 2500,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 80,
	decay_max_enemy = 1,
	
	uiName			= "beacon_bb2_capture",
	
	vision_always = true,
}

Def.VitalPoint_PVE_bigship_building_2 =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_tower/control_tower",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	
	health			= 2500,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 80,
	decay_max_enemy = 1,
	
	uiName			= "beacon_bb2_capture",
	
	vision_always = true,
}

Def.VitalPoint_PVE_wreck =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	as_world 			= true,
	model			= "models/objects/ships_huge/freighter_imper/freighter_imper_wreck",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	
	health			= 7500,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 200,
	decay_max_enemy = 1,
	hudType			= "default",
	hud_visibility_type	= "minor",
	uiName			= "VitalPoint_PVE_wreck_name",
	
	vision_always = false,
}

Def.VitalPoint_PVE_wreck_fake =
{
	inherit			= "BaseEntity",
	in_editor		= true,
	as_world 			= true,
	model			= "models/objects/ships_huge/freighter_imper/freighter_imper_wreck",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	
	vision_always = false,
}

Def.VitalPoint_PVE_bigship_building_2_stealth =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_tower/control_tower",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	as_world 			= true,
	health			= 15000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 25.0,
	regen_max_ally	= 5,
	decay_damage	= 200,
	decay_max_enemy = 1,
	
	uiName			= "beacon_bb2_capture",
	
	vision_always = false,
}


Def.VitalPoint_PVE_bigship_building_3 =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_tower/control_tower",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	health				= 2500,
	gameplay_idx		= 0,
	relationship_group = 2,
	regen_speed			= 25.0,
	regen_max_ally		= 5,
	decay_damage		= 80,
	decay_max_enemy 	= 1,
	
	uiName			= "beacon_bb2_capture",
	
	vision_always = true,
}

Def.PvE_bb2_shadow =
{
	inherit			= "BaseEntity",
	in_editor		= true,
	model			= "models/objects/vital_point/control_tower/control_tower",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	uiName			= "beacon_bb2_capture",
	
	network_sync 	= true, 
}

-- Маяки для уничтожения в bb2 -- 
 
Def.Turret_Beacon_bb2 = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	damageable			= true,
	health 				= 80000,
	special_object 		= true,
	vision_always 		= true,
	hudType				= "default",
	hud_visibility_type = "major",
	hud_ico				= "destroyed_beacon_ico",
	maxViewDist			= 5000,
	points_reward_kill  = 200,

	relationship_group = 2,
	
	death_effect	= "particles/explosions/objects/control_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -10, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 10, -5, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -10, -10, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},
	
	uiName			= "beacon_bb2_destroy",
	hack_immune			= true,
}

Def.Beacon_alarm_pve_2_shadow = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable		= false,
	health 			= 20000,
	special_object = true,
	vision_always = true,
	maxViewDist		= 5000,
	hud_ico				= "destroyed_beacon_ico",
	points_reward_kill = 50,
	points_reward_assist_damage = 150,

	relationship_group = 1,
	
	death_effect	= "particles/explosions/objects/control_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -10, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 10, -5, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -10, -10, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},
	
	uiName			= "beacon_bb2_destroy",
	
	vision_always = true,
	
	network_sync 	= true,
	hack_immune			= true,
}

-- бомбы для рандом эвента--
Def.LootCrate_PVE_bb2 =
{
	--class 	= "Turret",
	class 	= "LootCrate",
	in_editor		= true,
	interaction_distance	= 30,
	max_detection_distance	= 5000,
	vision_always = true,
	physics		= { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 50, damping = 0.4, rot_damping = 0.4, },
	model		= "models/objects/gameplay/bombball/bombball",		
	--model		= "models/objects/gameplay/loot_box/loot_box",
	health 		= 1000000,
	damageable  = false,
	
	uiName		= "bomb_files",
	
	relationship_group = 3, -- сделал не своими чтобы можно было пристрелить.
	
	interacting_fx = "particles/ships/looting",
	owner_effect = "particles/other/loot_owner_highlight",
	glow_effect = "particles/other/loot_highlight",
	
	death_effect	= "particles/explosions/big_fire2",
}

--корабль для исследований рандом эвента--
Def.LootCrate2_PVE_bb2 =
{
	--class 	= "Turret",
	class 	= "LootCrate",
	in_editor		= true,
	interaction_distance	= 30,
	max_detection_distance	= 5000,
	vision_always = true,
	physics		= { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 100, damping = 0.4, rot_damping = 0.4, },
	model		= "models/ships/race_1/s/race1_s_t2_damaged",		
	--model		= "models/objects/gameplay/loot_box/loot_box",
	health 		= 1000000,
	damageable  = true,
	
	uiName		= "dead_hero",
	
	relationship_group = 1,
	
	interacting_fx = "particles/ships/looting",
	owner_effect = "particles/other/loot_owner_highlight",
	glow_effect = "particles/other/loot_highlight",
	
	death_effect	= "particles/explosions/big_fire2",
}

Def.Beacon_alarm_pve = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/radar_station/radar_station_01",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable		= true,
	health 			= 50000,
	special_object = true,
	vision_always 	= true,
	maxViewDist		= 5000,
	hudType			= "default",
	hud_visibility_type = "major",
	hack_immune		= true,

	points_reward_kill = 50,
	points_reward_assist_damage = 150,

	relationship_group = 2,
	
	death_effect	= "particles/explosions/objects/antenna_explosion",
	death_sound		= "sound/explosion/turret_expl",
	
	broken_parts = 
	{
		{ def = "Beacon_alarm_pve_wreck",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 3.0, },
		{ def = "Beacon_alarm_pve_wreck_part1",  debris = false, pos = Vec3( -36.921, -9.258, 38.129 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part2",  debris = false, pos = Vec3( 36.53, -9.258, -38.772 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part3",  debris = false, pos = Vec3( -16.015, -9.271, -50.964 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part4",  debris = false, pos = Vec3( 15.274, -9.271, 50.964 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part5",  debris = false, pos = Vec3( 26.361, -47.874, 3.253 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part6",  debris = false, pos = Vec3( -19.923, -96.196, -10.322 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part7",  debris = false, pos = Vec3( -3.559, 75.705, -29.253 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part8",  debris = false, pos = Vec3( -0.181, 84.922, 1.781 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
	},
	
	uiName			= "beacon_bb2_destroy_event",
	
	vision_always = true,
}

Def.Beacon_alarm_pve_wreck =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	--physics				= { solid_type = solid.model, dynamic = true, material = "Metal", mass = 100000, },
	model				= "models/objects/vital_point/radar_station/radar_station_01_wreck",
	death_fade_time 	= 2.5,
	children = 
	{
		{ effect		= "particles/explosions/objects/antenna_part_explosion", joint = "fx1" },
		{ effect		= "particles/explosions/objects/antenna_part_explosion", joint = "fx2" },
		{ effect		= "particles/explosions/objects/antenna_part_explosion", joint = "fx3" },
		{ effect		= "particles/explosions/objects/antenna_part_explosion", joint = "fx4" },
	},
}

Def.Beacon_alarm_pve_wreck_part1 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/vital_point/radar_station/radar_station_01_wreck_part1",
	death_fade_time 	= 1.0,
}

Def.Beacon_alarm_pve_wreck_part2 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/vital_point/radar_station/radar_station_01_wreck_part2",
	death_fade_time 	= 1.0,
}

Def.Beacon_alarm_pve_wreck_part3 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/vital_point/radar_station/radar_station_01_wreck_part3",
	death_fade_time 	= 1.0,
}

Def.Beacon_alarm_pve_wreck_part4 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/vital_point/radar_station/radar_station_01_wreck_part4",
	death_fade_time 	= 1.0,
}

Def.Beacon_alarm_pve_wreck_part5 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/vital_point/radar_station/radar_station_01_wreck_part5",
	death_fade_time 	= 1.0,
}
Def.Beacon_alarm_pve_wreck_part6 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/vital_point/radar_station/radar_station_01_wreck_part6",
	death_fade_time 	= 1.0,
}
Def.Beacon_alarm_pve_wreck_part7 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/vital_point/radar_station/radar_station_01_wreck_part7",
	death_fade_time 	= 1.0,
}
Def.Beacon_alarm_pve_wreck_part8 =
{
	class 			= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	model				= "models/objects/vital_point/radar_station/radar_station_01_wreck_part8",
	death_fade_time 	= 1.0,
}

Def.Beacon_alarm_pve_shadow = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/radar_station/radar_station_01",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable		= false,
	health 			= 20000,
	special_object = true,
	vision_always = true,
	maxViewDist		= 5000,


	relationship_group = 1,
	
	death_effect	= "particles/explosions/objects/antenna_explosion",
	death_sound		= "sound/explosion/turret_expl",
	
	broken_parts = 
	{
		{ def = "Beacon_alarm_pve_wreck",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 3.0, },
		{ def = "Beacon_alarm_pve_wreck_part1",  debris = false, pos = Vec3( -36.921, -9.258, 38.129 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part2",  debris = false, pos = Vec3( 36.53, -9.258, -38.772 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part3",  debris = false, pos = Vec3( -16.015, -9.271, -50.964 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part4",  debris = false, pos = Vec3( 15.274, -9.271, 50.964 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part5",  debris = false, pos = Vec3( 26.361, -47.874, 3.253 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part6",  debris = false, pos = Vec3( -19.923, -96.196, -10.322 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part7",  debris = false, pos = Vec3( -3.559, 75.705, -29.253 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
		{ def = "Beacon_alarm_pve_wreck_part8",  debris = false, pos = Vec3( -0.181, 84.922, 1.781 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1, },
	},
	
	uiName			= "beacon_bb2_destroy_event", 
	
	vision_always 	= true,
	
	network_sync 	= true,
}

-- турели для бб2 -- 

Def.Turret_Team2_Pve_AiRailgun_bb2_1 = --t1
{
	inherit 		= "Turret_Team2_Pve_RailGun",
	fire_rate		= 45.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 110,
	hudType			= "default",
	hud_visibility_type = "minor",
	health 				= 10000,
	
	damage_kinetic	= 200,
	damage_emp		= 0,
	damage_thermal	= 0,
	
	points_reward_kill = 20,
	points_reward_assist_damage = 70,
	
	uiName			= "turret_bb2", 
	
}

Def.Turret_Team2_Pve_AiRailgun_bb2_3 = --t3
{
	inherit 		= "Turret_Team2_Pve_AiRailgun_bb2_1",
	health			= 30000,
	projectile_speed = 110,
	damage_kinetic	= 580,
}

Def.Turret_Team2_Pve_AiRailgun_bb2_5 = --t5
{
	inherit 		= "Turret_Team2_Pve_AiRailgun_bb2_1",
	health			= 60000,
	projectile_speed = 150,
	damage_kinetic	= 1200,
}


Def.Turret_Team2_Pve_AiRailgun_shadow =
{
	class			= "BaseEntity",
	model			= "models/turret/round_railgun01/round_railgun01",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	uiName			= "turret_bb2", 
	
	network_sync = true, 
}

Def.Turret_Team2_Pve_RocketGun_shadow =
{
	class			= "BaseEntity",
	model			= "models/turret/rocket_launcher/rocket_launcher",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	
	uiName			= "turret_bb2", 
	
	network_sync = true, 
}

-- для эвента с маяком (уничтожение)-- 
Def.Turret_Beacon_bb2_event = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	damageable			= true,
	health 				= 100000,
	special_object 		= true,
	vision_always 		= true,
	hudType				= "default",
	hud_visibility_type = "major",
	hud_ico				= "ClanShip_Bomb",
	maxViewDist			= 5000,
	points_reward_kill  = 100,
	hack_immune		= true,

	relationship_group = 2,
	
	death_effect	= "particles/explosions/objects/control_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -10, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 10, -5, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -10, -10, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},
	
	uiName = "beacon_bb2_destroy_event_1",
	
	vision_always = true,
}


Def.Turret_Beacon_bb2_event_shadow = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/control_tower/control_tower",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable		= false,
	health 			= 20000,
	special_object = true,
	vision_always = true,
	maxViewDist		= 5000,
	no_target		= true,
	points_reward_kill = 50,
	points_reward_assist_damage = 150,

	relationship_group = 1,
	
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
	
	uiName = "beacon_bb2_destroy_event",
	
	vision_always	 = true,
	
	network_sync 	= true,
}

--рандом крейт для рандомных событий--

Def.PvE_RandomEvent_Position =
{
	class				= 	'TagPoint',
	in_editor			=	true,
}

--объекты для прототипа ск 2.0--

Def.Interact_object =
{
	--class 	= "Turret",
	class 	= "LootCrate",
	in_editor		= true,
	interaction_distance	= 30,
	max_detection_distance	= 5000,
	vision_always = true,
	physics		= { solid_type = solid.model, static = false, material = "ShipMetalMk3", mass = 50, damping = 0.4, rot_damping = 0.4, },
	model		= "models/weapons/plasma_gun/plasma_gun_mod1",		
	--model		= "models/objects/gameplay/loot_box/loot_box",
	health 		= 1000000,
	damageable  = true,
	
	--uiName		= "bomb_files",
	
	relationship_group = 3, -- сделал не своими чтобы можно было пристрелить.
	
	interacting_fx = "particles/ships/looting",
	owner_effect = "particles/other/loot_owner_highlight",
	glow_effect = "particles/other/loot_highlight",
	
	death_effect	= "particles/explosions/big_fire2",
}

Def.Weapon_Laser_Basic_Alien=
{
	inherit = "Weapon_Laser_Basic_T1_Mk0",
	model 		= "",
	storeItemId = 0,
	cant_be_bought  = true,
	drop_weight		= 0,
}

Def.Weapon_Plasmagun_Basic_Alien=
{
	inherit = "Weapon_Plasmagun_Basic_T1_Mk1",
	model 		= "",
	storeItemId = 0,
	cant_be_bought  = true,
	drop_weight		= 0,
}

Def.Turret_EventCruiserAlienSmall =
{
	inherit			= "Turret_CruiserAlienSmall",
	damage_emp		= 300,
}

Def.TurretPlasma_EventCruiserAlienSmall =
{
	inherit			= "TurretPlasma_CruiserAlienSmall",
	damage_emp		= 300,
}

Def.Turret_EventCruiserAlien =
{
	inherit			= "Turret_CruiserAlien",
	damage_emp		= 400,

}

Def.TurretPlasma_EventCruiserAlien =
{
	inherit			= "TurretPlasma_CruiserAlien",
	damage_emp		= 500,

}

---------------------------------------
--Nukem

Def.Module_CoverShieldProto_Mob = 
{
	inherit			= "Module_CoverShieldProto", 
	cooldown		= 17,
	energy_cost		= 300,
	storeItemId		= 0,
	--spell			= "HealOtherAlly",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ShieldLessThen,
					param = 0.75,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 59,
						-- AROUND
						},
				},
			},
		period = 1, -- частота проверки
		},
	cant_be_bought			= false,
}



Def.Module_HealOtherAlly_Mob =
{
	inherit			= "Module_RemoteRepairDrones_T3_Epic",
	cooldown		= 20,
	energy_cost		= 300,
	storeItemId		= 0,
	spell			= "HealOtherAlly",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.5,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						},
				},
			},
		period = 0.5, -- частота проверки
		},
	cant_be_bought			= false,
}

Def.Module_ResistThermalHull_Mob = --Повышение ресиста хулл, кроме себя
{
	inherit			= "Module_AdaptiveArmorBoost_T3_Mk1",
	cooldown		= 20,
	energy_cost		= 200,
	spell			= "ResistThermalHull_Mob",
	--spell_on_equip  = "ShieldHealSelf_Mob",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.95,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						},
				},
			},
		period = 1, -- частота проверки
		},
	storeItemId		= 0,
	cant_be_bought			= false,
}
Def.Module_ResistEMHull_Mob = --Повышение ресиста хулл, кроме себя
{
	inherit			= "Module_AdaptiveArmorBoost_T3_Mk1",
	cooldown		= 20,
	energy_cost		= 200,
	spell			= "ResistEMHull_Mob",
	--spell_on_equip  = "ShieldHealSelf_Mob",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.95,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						},
				},
			},
		period = 1, -- частота проверки
		},
	storeItemId		= 0,
	cant_be_bought			= false,
}
Def.Module_ResistKineticHull_Mob = --Повышение ресиста хулл, кроме себя
{
	inherit			= "Module_AdaptiveArmorBoost_T3_Mk1",
	cooldown		= 20,
	energy_cost		= 200,
	spell			= "ResistKineticHull_Mob",
	--spell_on_equip  = "ShieldHealSelf_Mob",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.95,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						},
				},
			},
		period = 1, -- частота проверки
		},
	storeItemId		= 0,
	cant_be_bought			= false,
}
--Повышение ресиста щита алл, кроме себя
Def.Module_ResistAllShield_Mob =
{
	inherit			= "Module_AdaptiveShieldBoost_T5_Mk1",
	cooldown		= 20,
	energy_cost		= 200,
	spell			= "ResistAllShield_Mob",
	--spell_on_equip  = "ShieldHealSelf_Mob",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ShieldLessThen,
					param = 0.95,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						},
				},
			},
		period = 1, -- частота проверки
		},
	storeItemId		= 0,
	cant_be_bought			= false,
}
--
Def.Module_MissileDefence_Mob =
{
	inherit			= "Module_MissileDefenceType1_T5_Mk1",
	cooldown		= 12,
	duration		= 8,
	energy_cost		= 200,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ShieldLessThen,
					param = 0.95,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						},
				},
			},
		period = 1, -- частота проверки
		},
	storeItemId		= 0,
	cant_be_bought			= false,
}

Def.Module_AOE_EMI_Mob =
{
	inherit			= "Module_AOE_EMI_T5_Mk1",
	cooldown		= 14, --duration		= 8,
	energy_cost		= 200,
	spell			= "AOE_EMI_Mob",
	--spell_on_equip  = "ShieldHealSelf_Mob",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ShieldLessThen,
					param = 0.95,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						},
				},
			},
		period = 1, -- частота проверки
		},
	storeItemId		= 0,
	cant_be_bought			= false,
}

Def.InvulBot = {
	inherit				= "HealBot",
	uiName 				= "Module_InvulBot",
	uiDesc 				= "Module_InvulBot_Desc",
}


Def.Module_RecoverOtherAlly_Mob =
{
	inherit			= "Module_ShieldEmitter_T1_Mk1",
	cooldown		= 20,
	energy_cost		= 300,
	storeItemId		= 0,
	spell			= "RecoverOtherAlly",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 1,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						},
				},
			},
		period = 1, -- частота проверки
		},
	cant_be_bought			= false,
}





Def.Module_ShieldRay_Mob_T4 =
{
	inherit			= "Module_ShieldRay_l_T4_Epic",
	cooldown		= 50,
	energy_cost		= 300,
	storeItemId		= 0,
	spell			= "ShieldRay_Mob_T4",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ShieldLessThen,
					param = 0.5,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 200,
						-- AROUND
						},
				},
			},
		period = 0.5, -- частота проверки
		},
	cant_be_bought			= false,
}
Def.Module_InvulBox_Mob_T4 =
{
	inherit			= "Module_ShieldRay_l_T4_Epic",
	cooldown		= 25,
	energy_cost		= 300,	
	spell			= "InvulBox", --ShieldRay_Mob_T4",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ShieldLessThen,
					param = 0.5,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 200,
						-- AROUND
						},
				},
			},
		period = 0.5, -- частота проверки
		},
	cant_be_bought	= true,
	storeItemId		= 0,
}

--Ракетный залп на ударку
Def.Module_WolfPack_Mob = 
{
	inherit				= "Module_WolfPack",
	damage_emp			= 3000,
	ammo				= 6,
	fire_rate 			= 90,
	max_projectiles_per_target = 1,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 200,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 25, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 3, -- частота проверки
		--useTargetModule = true, --!!!
		--debug	= true,
		},
	cant_be_bought	= true,
	storeItemId		= 0,
	uiName 			= "itemSubType_WolfPack",
}
--Ракетный залп на дальнобой, ракета, самонаводится но очень слабо, стрелять надо с большой дистанции
Def.Module_BarrageLong_Mob =
{
	inherit				= "Module_WolfPack",
	--damage_thermal		= 5000,
	--damage_thermal				= 6500,
	damage_emp					= 6500,
	ammo				= 3,
	fire_rate 			= 90,
	dispersion			= 10,
	max_range			= 600,
	max_projectiles_per_target = 1,
	projectile 			= "SpaceMissile_Torpedo_T5_Mob",
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 550,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 120, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 3, -- частота проверки
		--useTargetModule = true, --!!!
		--debug	= true,
		},
	cant_be_bought	= true,
	storeItemId		= 0,
	uiName 			= "Raider_RocketTurret",
}

Def.SpaceMissile_Torpedo_T5_Mob  =
{
	inherit						= "SpaceMissile_Torpedo_T5_Mk1",
	angular_velocity			= 3,
	is_guided					= true,
	time_to_live				= 7,
	override_blast_wave_damage 	= true,
	cant_be_bought	= true,
	storeItemId		= 0,
}
-- Пули оставляют войд зоны
Def.PrimaryNanoRobots_Mob  =
{
	inherit			= "Module_PrimaryNanoRobots_T4_Mk1",
	cooldown		= 25,
	energy_cost		= 100,
	spell			= "PrimaryBuff_Mob", 
	required_role	= ai.DONT_INHERIT,
	class_mask		= ai.DONT_INHERIT, --ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	required_ship	= ai.DONT_INHERIT,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 400,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 75, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 3, -- частота проверки
		--useTargetModule = true, --!!!
		--debug	= true,
		},
	cant_be_bought	= true,
	storeItemId		= 0,
}

--CommandDamage_Mob
Def.Module_CommandDamage_Mob =
{
	inherit			= "Module_Eagleeye_T5_Mk1",
	cooldown		= 10,
	energy_cost		= 10,	
	spell			= "CommandDamage_Mob", --ShieldRay_Mob_T4",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ShieldLessThen,
					param = 0.9,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 200,
						-- AROUND
						},
				},
			},
		period = 3, -- частота проверки
		},
	cant_be_bought	= true,
	storeItemId		= 0,
}

Def.Module_JumpBanBox_Mob =
{
	inherit			= "Module_ShieldRay_l_T4_Epic",
	cooldown		= 25,
	energy_cost		= 100,	
	spell			= "JumpBanBox_Mob", --ShieldRay_Mob_T4",
	class_mask		= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
				{
					condition_type = AICondition.DistLess,
					param = 150,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
		period = 1.5, -- частота проверки
		},
	cant_be_bought	= true,
	storeItemId		= 0,
}
Def.JumpBanBox = {
	inherit				= "HealBot",
	uiName 				= "Module_JumpBanBox",
	--uiDesc 				= "Module_JumpBanBox_Desc",
}

Def.Module_BoostBanBox_Mob =
{
	inherit			= "Module_ShieldRay_l_T4_Epic",
	cooldown		= 25,
	energy_cost		= 100,	
	spell			= "BoostBanBox_Mob", --ShieldRay_Mob_T4",
	AIRules			= { 
				{
					condition_type = AICondition.DistLess,
					param = 150,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
		period = 1.5, -- частота проверки
		},
	cant_be_bought	= true,
	storeItemId		= 0,
}
Def.BoostBanBox = {
	inherit				= "HealBot",
	uiName 				= "Module_BoostBanBox",
	--uiDesc 				= "Module_BoostBanBox_Desc",
}

Def.Module_SeeInvisible_Mob =
{
	inherit			= "Module_Eagleeye_T5_Mk1",
	cooldown		= 25,
	energy_cost		= 100,	
	spell			= "SeeInvisible_Mob", --ShieldRay_Mob_T4",
	class_mask		= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
				{
					condition_type = AICondition.DistLess,
					param = 350,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
		period = 1.5, -- частота проверки
		},
	cant_be_bought	= true,
	storeItemId		= 0,
}


Def.Module_Mob_HideSpeed = 
{
	inherit			= "Module_Afterburner_T5_Mk1",
	cooldown		= 15,
	energy_cost		= 100,
	spell			= "Afterburner_PVE",

	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Behavior,
					param = "Hide",
					-- хотя бы 1 таржет если найден с этим кондишином
--[[ 					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						}, ]]
				},
			},
		period = 0.5, -- частота проверки
		},
	storeItemId		= 0,
	cant_be_bought			= false,
	class_mask				= ai.ShipClass.SMALL+ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
}

Def.Module_WebPropulsion_Mob_T3 = 
{
	mark					= 6,
	tier					= 3,
	price					= 488070,
	cant_be_bought			= false,
	item_lvl				= 21,
	rank					= 8,
	rank_min				= 6,
	rank_max				= 10,
	cooldown				= 34,
	energy_cost				= 135,
	spell					= "WebPropulsion_Mob_T3",
	work_beam_fx			= "particles/gadget/exhaustion_beam",
	--required_role			= ai.ShipRoles.TACKLER,
	--class_mask				= ai.ShipClass.MEDIUM,
	class					= "ActiveModule",
	model					= "models/modules/m_active/m_a_gadget_beamer",
	module_type				= ai.ModuleType.ACTIVE,
	in_editor				= false,
	default_icon			= "ItemSubtype_WebPropulsion",
	storeItemId				= 0,
	shopCategory			= "ACTIVE_MODULES",
	shopSubCategory			= "ACTIVE_TACKLER",
	item_subtype			= ItemSubtype.WebPropulsion,
	upgrade_cost_negator	= "Module_WebPropulsion_T3_RT",
	influence_type_color	= InfluenceTypeColor.DEBUFF_STAT,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 110,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
			},
		period = 0.8, -- частота проверки
		},
}

Def.Module_Mob_CloakingDevice_Uniq_T3 = 
{
	inherit					= "Module_CloakingDevice_Uniq_T3",
	spell					= "Mob_Cloaking",
	cooldown				= 15,
	storeItemId				= 0,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 400,
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						range			= 400,
						-- AROUND
						},					
				},
			},
		period = 5, -- частота проверки
		},	
}

Def.Module_Suicide_Mob_T3 = 
{
	inherit 				= "Module_Suicide_T3_Mk1",
	--spell					= "Mob_Camouflage_T3",
	cooldown				= 25,
	storeItemId				= 0,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 55,
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						range			= 55,
						-- AROUND
						},					
				},
			},
		period = 1, -- частота проверки
		debug  = true,
		},		
}

Def.Module_IonRay_Mob_T3 = 
{
	inherit 				= "Module_IonRay_T3_Epic",
	--spell					= "Mob_Camouflage_T3",
	additional_spell		= "PveMob_DestrHackWeapon",
	cooldown				= 25,
	storeItemId				= 0,
	cant_be_bought			= false,
	class_mask				= ai.ShipClass.SMALL+ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 55,
--[[ 					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						range			= 55,
						-- AROUND
						},	 ]]
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
			},
		period = 1, -- частота проверки
		},		
}

Def.Module_IonRay_MobOW_T3 = 
{
	inherit 				= "Module_IonRay_T3_Epic",
	--spell					= "Mob_Camouflage_T3",
	additional_spell		= "PveMob_DestrCooldownMod",
	cooldown				= 25,
	storeItemId				= 0,
	cant_be_bought			= false,
	class_mask				= ai.ShipClass.SMALL+ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 55,
--[[ 					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						range			= 55,
						-- AROUND
						},	 ]]
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
			},
		period = 1, -- частота проверки
		},		
}

Def.Module_CommandWeaknessAnalyzer_Mob_T3 = 
{
	inherit 				= "Module_CommandWeaknessAnalyzer_T3_Epic",
	--spell					= "Mob_AllyCamouflage_T3",
	cooldown				= 25,
	storeItemId				= 0,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 100,
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 100,
						-- AROUND
						},					
				},
			},
		period = 2, -- частота проверки
		},
}

Def.Module_EnergyShieldCommander_Mob_T3 = 
{
	inherit 				= "Module_EnergyShieldCommander_T1_Base",
	spell					= "EnergyShieldCommander_Mob_T3",
	cooldown				= 45,
	storeItemId				= 0,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.ArmorLessThen,
					param = 0.95,
				},
			},
		period = 2, -- частота проверки
		debug  = true,
		},		
}

Def.Module_Vortex_Mob_T3 = 
{
	inherit 				= "Module_Vortex_T4_Epic",
	spell_on_hit			= "SpellOnHit_Vortex_Mob",
	cooldown				= 5,
	storeItemId				= 0,
	projectile_speed 		= 50,
	damage_kinetic			= 5000,
	cant_be_bought			= false,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 170,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 1, -- частота проверки
		useTargetModule = true, --!!!
		--debug	= true,
		},		
}



Def.Module_CloakingDevice_Mob_T3 = 
{
	inherit 				= "Module_CloakingDevice",
	spell					= "CloakingDevice_Mob_T3",
	cooldown				= 25,
	storeItemId				= 0,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Behavior,
					param = "FlyToDistanceShoot",
				},

				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Behavior,
					param = "Hide",
				},
			},
		period = 2, -- частота проверки
		},		
}


Def.Module_Mob_AllyCamouflage_T3 = 
{
	inherit 				= "Module_Camouflage_T3_Mk1",
	spell					= "Mob_AllyCamouflage_T3",
	cooldown				= 25,
	storeItemId				= 0,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 100,
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 100,
						-- AROUND
						},					
				},
			},
		period = 2, -- частота проверки
		},		
}

Def.Module_Mob_Camouflage_T3 = 
{
	inherit 				= "Module_Camouflage_T3_Mk1",
	spell					= "Mob_Camouflage_T3",
	cooldown				= 20,
	storeItemId				= 0,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.Behavior,
					param = "DistanceShoot",
				},
			},
		period = 2, -- частота проверки
		},		
}


Def.Module_HealMob_M =
{
	inherit			= "Module_RepairDrones_l_T5_Epic",
	cooldown		= 25,
	energy_cost		= 100,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.85,
					-- хотя бы 1 таржет если найден с этим кондишином
--[[ 					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						}, ]]
				},
			},
		period = 0.5, -- частота проверки
		},
	storeItemId		= 0,
	cant_be_bought			= false,
	class_mask				= ai.ShipClass.SMALL+ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
}


Def.Module_RepairDrones_Mob_s = 
{
	inherit 				= "Module_RepairDrones_l_T2_Epic",
	cooldown				= 20,
	storeItemId				= 0,
	energy_cost				= 75,
	cant_be_bought			= false,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.75,
					-- хотя бы 1 таржет если найден с этим кондишином
--[[ 					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						}, ]]
				},
			},
		period = 2, -- частота проверки
		},	
}

Def.Module_RepairDrones_Mob_l = 
{
	inherit 				= "Module_RepairDrones_l_T3_Mk1",
	cooldown				= 25,
	storeItemId				= 0,
	energy_cost				= 175,
	cant_be_bought			= false,
	spell					= "RepairDrones_Mob_l",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.75,
					-- хотя бы 1 таржет если найден с этим кондишином
--[[ 					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						}, ]]
				},
			},
		period = 2, -- частота проверки
		},	
}

Def.Module_RocketLauncher_Mob = 
{
	inherit 				= "Module_Vortex", --+
	cooldown				= 45,
	energy_cost				= 30,
	storeItemId				= 0,
	projectile_speed 		= 0.01,
	projectile				= "SpaceMissile_Nuke_T3_Mk1",
	--damage_kinetic			= 2000,
	cant_be_bought			= false,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	--required_role			= ai.ShipRoles.RECON,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 25,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 0.2, -- частота проверки
		useTargetModule = true, --!!!
		debug	= true,
		},		
}


Def.Module_ShieldRestore_Mob = 
{
	inherit 				= "Module_ShieldRestoreLarge_T5_Epic",
	storeItemId				= 0,
	cant_be_bought			= false,
	
	cooldown				= 30,
	energy_cost				= 275,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
			{  -- вероятно будет несколько проверок. через "и" или "или"
				condition_type = AICondition.ShieldLessThen,
				param = 0.35,
				-- хотя бы 1 таржет если найден с этим кондишином
--[[ 					target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ALLY,
					range			= 150,
					-- AROUND
					}, ]]
			},
		},
		period = 5, -- частота проверки
	},
}
Def.Module_ShieldRestore_Mob_m = 
{
	inherit 				= "Module_ShieldRestoreMedium_T5_Epic",
	storeItemId				= 0,
	cant_be_bought			= false,
	
	cooldown				= 30,
	energy_cost				= 275,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
			{  -- вероятно будет несколько проверок. через "и" или "или"
				condition_type = AICondition.ShieldLessThen,
				param = 0.35,
				-- хотя бы 1 таржет если найден с этим кондишином
--[[ 					target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ALLY,
					range			= 150,
					-- AROUND
					}, ]]
			},
		},
		period = 5, -- частота проверки
	},
}

Def.Module_HackRocket_Mob = 
{
	inherit 				= "Module_HackRocket_T5_Epic",
	storeItemId				= 0,
	cant_be_bought			= false,
	required_ship			= ai.DONT_INHERIT,
	
	cooldown				= 30,
	energy_cost				= 125,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.DistLess,
				param = 150,
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
		period = 5, -- частота проверки
	},
}

Def.Module_ShieldHavoc_Mob = 
{
	inherit 				= "Module_ShieldHavoc_T5_Epic",
	storeItemId				= 0,
	cant_be_bought			= false,
	
	cooldown				= 30,
	energy_cost				= 250,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.DistLess,
				param = 300,
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
		period = 5, -- частота проверки
	},
}

Def.Module_PrometheusPot_Mob = 
{
	inherit 				= "Module_PrometheusPot_T5_Epic",
	storeItemId				= 0,
	cant_be_bought			= false,
	required_ship			= ai.DONT_INHERIT,
	
	cooldown				= 30,
	energy_cost				= 250,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.DistLess,
				param = 300,
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
		period = 5, -- частота проверки
	},
}


Def.Module_HorrorHowl_Mob = 
{
	inherit 				= "Module_HorrorHowl_T5_Epic",
	storeItemId				= 0,
	cant_be_bought			= false,
	required_ship			= ai.DONT_INHERIT,
	
	cooldown				= 20,
	energy_cost				= 250,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.DistLess,
				param = 250,
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
		period = 5, -- частота проверки
	},
}


--[[ Def.Module_SectorShield_Mob = 
{
	class 		= "ActiveModule",
	in_editor	= false,
	cooldown	= 30,
	activate_entity	= "DestrMunition_SectorShield_T3_Mk3",
	activate_entity_max = 1, -- максимум 8
	activate_entity_ttl = 30,
	activate_entity_health = 10000,
	energy_cost = 100,
	check_spawn_collision = true,

	--energy_cost_per_second = 10, -- реализовано но не используется в этом модуле
	activate_sound = "sound/gadgets/warpgate/wg_activate",

	block_friendly_projectile=false,
	attach_bone = "root",
	spawn_offset = Vec3( 0, 0, -18 ),
	spawn_dir_to_aim = true,
	check_spawn_collision = true,
	
	cooldown				= 20,
	energy_cost				= 110,
	storeItemId				= 0,

	--damage_kinetic			= 2000,
	cant_be_bought			= false,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	--required_role			= ai.ShipRoles.RECON,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.ShieldLessThen,
					param = 0.9,
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 1, -- частота проверки
		useTargetModule = true, --!!!
		debug	= true,
		},		
} ]]


Def.Module_DestrBeamDrone_Mob = 
{
	inherit 				= "Module_DestrBeamDrone_T5_Mk1",
	cooldown				= 10,
	energy_cost				= 1130,
	storeItemId				= 0,
	--projectile_speed 		= 0.01,
	--projectile				= "SpaceMissile_Nuke_T3_Mk1",
	--damage_kinetic			= 2000,
	cant_be_bought			= false,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	--required_role			= ai.ShipRoles.RECON,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 350,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		useTargetModule = true, --!!!
		--debug	= true,
		},		
}


Def.Module_PushRay_Mob = 
{
	inherit 				= "Module_PushRay_T3_Epic",
	cooldown				= 13, --25
	energy_cost				= 700, --900
	storeItemId				= 0,
	--projectile_speed 		= 0.01,
	--projectile				= "SpaceMissile_Nuke_T3_Mk1",
	--damage_kinetic			= 2000,
	cant_be_bought			= false,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	--required_role			= ai.ShipRoles.RECON,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				--conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 250,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				}
			},
		period = 2, -- частота проверки
		--useTargetModule = true, --!!!
		debug	= true,
		},		
}


Def.Module_Chameleon_Mob_T3 = 
{
	inherit 				= "Module_Chameleon_T3_Mk1",
	spell					= "Chameleon_Mob_T3",
	cooldown				= 25,
	storeItemId				= 0,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Behavior,
					param = "FlyToDistanceShoot",
				},

				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.Behavior,
					param = "Hide",
				},
				{
					condition_type = AICondition.ArmorLessThen,
					param = 0.5,
				},
			},
		period = 0.5, -- частота проверки
		},		
}
Def.Module_Chameleon_Mob_T1 =  -- меньше длительность (8)
{
	inherit 				= "Module_Chameleon_Mob_T3",
	spell					= "Chameleon_Mob_T1",
}

Def.Module_PulsarAlien_Mob =
{
	inherit 				= "Module_Pulsar_Alien_Low",
	cooldown 				= 20,
	energy_cost				= 10,
	spell					= "Alien_Pulsar_Mob",
	uiName 					= "AlienPulsar",
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 115, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
	},
}

Def.Module_UniqueHardShield_Alien_Mob =
{
	inherit 				= "Module_UniqueHardShield_T5_Base",
	storeItemId				= 0,
	cooldown 				= 30,
	energy_cost				= 20,
	activate_entity_ttl		= 12,
	AIRules			= { 
		period = 2, -- частота проверки
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.ShieldLessThen,
				param = 0.1,
			},
 			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
	},
}


Def.Module_MissileDefenceType1_Alien_Mob =
{
	inherit 				= "Module_MissileDefence",
	cooldown 				= 20,
	energy_cost				= 20,
	duration				= 15,
	AIRules			= { 
		conditions_and = true,
		period = 2, -- частота проверки
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
	},
}


Def.Module_SmallReverseThruster_Mob_T3 = 
{
	inherit 				= "Module_SmallReverseThruster_T2_Epic",
--	spell					= "Chameleon_Mob_T3",
	cooldown				= 45,
	storeItemId				= 0,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.ArmorLessThen,
					param = 0.5,
				},
			},
		period = 2.5, -- частота проверки
		},		
}



Def.Module_StasisGenerator_Mob_T3 = 
{
	inherit 				= "Module_StasisGenerator_T3_Mk1",
	additional_spell		= "PveMob_DestrHackWeapon",
	storeItemId				= 0,
	cooldown				= 12,
	cant_be_bought			= false,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 215, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},	
}	

Def.Module_StasisGenerator_MobOW_T3 = 
{
	inherit 				= "Module_StasisGenerator_T3_Mk1",
	additional_spell		= "PveMob_DestrCooldownMod",
	storeItemId				= 0,
	cooldown				= 12,
	cant_be_bought			= false,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 215, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},	
}

Def.Module_EnergyVampire_Mob_T3 = 
{
	inherit 				= "Module_EnergyVampire_T3_Mk1",
	storeItemId				= 0,
	cooldown				= 16,
	cant_be_bought			= false,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 175, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
}


Def.Module_WarpOut_Mob = 
{
	inherit 				= "Module_SpaceShift",
	cooldown				= 35,
	storeItemId				= 0,
	energy_cost				= 15,
	cant_be_bought			= false,
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ArmorLessThen,
					param = 0.95,
					-- хотя бы 1 таржет если найден с этим кондишином
--[[ 					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 150,
						-- AROUND
						}, ]]
				},
			},
		period = 0.5, -- частота проверки
		--debug = true,
		},	
}

Def.Module_TractorBeam_Mob_T3 = 
{
	inherit 				= "Module_TractorBeam", --+
	item_subtype			= 272,
	default_icon			= "ItemSubtype_TractorBeam",
	storeItemId				= 0,
	cooldown				= 20,
	cant_be_bought			= false,
	spell					= "TractorBeam_Mob_T3",
	energy_cost				= 80,
	trigger_aura			= false,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 325, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 105, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
}

Def.Module_TractorBeam_Mob_T5 = 
{
	inherit 				= "Module_TractorBeam", --+
	item_subtype			= 272,
	default_icon			= "ItemSubtype_TractorBeam",
	storeItemId				= 0,
	cooldown				= 20,
	cant_be_bought			= false,
	spell					= "TractorBeam_Mob_T5",
	energy_cost				= 80,
	trigger_aura			= false,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 400, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 205, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
}	

Def.Module_TurretThermo_Mob = 
{
	inherit 				= "Module_TurretThermo_T4_Mk1", --+
	storeItemId				= 0,
	cooldown				= 30,
	cant_be_bought			= false,
	energy_cost				= 80,
	trigger_aura			= false,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 325, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 3, -- частота проверки
		},		
}	


Def.Module_RocketSilo_Mob = 
{
	inherit 				= "Module_RocketSilo_T4_Epic", --+
	storeItemId				= 0,
	cooldown				= 20,
	cant_be_bought			= false,
	energy_cost				= 80,
	trigger_aura			= false,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	no_friendly_fire 		= true,

	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 325, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 75, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
		},		
}	

Def.Module_TorpedoShoot_Mob =
{
	class					= "FiringModule",
	in_editor 				= false,

	item_subtype			= ItemSubtype.Vortex,

	model 					= "models/weapons/plasma/power/vortex",

	--spell_on_hit			= "Vortex_Huge",

	--check_aim_orientation 	= true,
	check_aim_orientation_angle = 180,
	barrel_rot_speed 		= 1390,
	cooldown				= 14,
	energy_cost 			= 100,
	track 					= ai.TrackMode.AIM,

	max_range				= 700,
-----
	damage_kinetic			= 0,
	dispersion				= 0,   -- Это пишется в тултипе
	projectile 			= "SpaceMissile_Torpedo_T3_Mk3",
	projectile_speed 	= 55,

	default_icon 		= "ItemSubtype_SpaceMissile_Fireworks",

	muzzleflash_color = { kinetic = "255 214 190 25", emp = "255 214 190 25", thermal = "255 214 190 25", },
	muzzleflash_radius 	= 5,
	muzzleflash_time 	= 1.0,
	long_shot_effects 	= true,
	shot_effect 		= "particles/weapons/vortex/muzzle",
	oriented_shot_effects = false,
	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 675, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 125, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
		},
}


Def.Module_Gen_VolleyGuidedRocket_Mob =
{
	inherit 					= "Weapon_BaseRocket",
	--model						= "models/objects/ships_huge/prec_destroyer/prec_orpedo",
	model 			= "models/weapons/bs_torpedo_mid",
	--physics						= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk3", mass = 10000 },
	physics						= { solid_type = solid.box, kinematic = true, material = "ShipMetalMk3", mass = 10000 },
	relationship_group	 		= 1,
	cooldown = 3,
	
	is_guided					= true,
	random_trajectory			= true,
	use_pathfinder 				= true,
	angular_velocity			= 50,
	damageable					= true,
	health						= 2000,
	speed						= 30,
	
	max_range					= 900,
	time_to_live				= 130,
	
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	
	hud_visibility_type			= "major",
	hudType						= "default",	
	uiName 						= "itemSubType_Torpedo",
	
	--spell_on_spawn				= "Spell_CruiserTorpedo_RW",
	
	explosion_blast_wave		= "BlastWave_Gen_VolleyGuidedRocket",
	detonation_radius			= 2.0,
	flare_color					= "0 0 0 0",
	flare_size					= 0.01,
	flare_angle					= 10,
	
	launch_sound		 		= "sound/raid/boss_torpedo_launch",
	work_sound					= "sound/raid/boss_torpedo_fly",
	
	death_effect				= "",
	--start_effect                = "particles/weapons/torpedo/torpedo_start",
	children = 
	{
		[1] = { effect = "particles/weapons/missile/rocket_trail_alien_mid", joint = "fx1" },
		[2] = { effect = "particles/weapons/torpedo/alien_torpedo_core", joint = "fx2" },
	},
	
	points_reward_assist_damage = 80,

}


Def.BlastWave_Gen_VolleyGuidedRocket = 
{
	class						= "BlastWave",
	intensity					= 200,
	damage_thermal				= 5000,	--#64168
	blast_maxDistance			= 20,
	blast_minDistance			= 2,

	effect = "particles/explosions/objects/alien_explosion",
	light_color = "255 100 0 100",
	light_radius = 20,
	light_time = 0.8,
	sound = "sound/explosion/small_rocket_expl",
	
	in_editor					= false,
	apply_damage				= true,
	parent_prototype			= "SpaceMissile_Nuke_T5_Mk3",
}

Def.Module_RocketSilo2_Mob = 
{
	inherit 				= "Module_RocketSilo_T4_Epic", --+
	storeItemId				= 0,
	cooldown				= 20,
	cant_be_bought			= false,
	energy_cost				= 80,
	trigger_aura			= false,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	projectile 				= "Module_Gen_VolleyGuidedRocket_Mob",
	max_range				= 900,
	no_friendly_fire 		= true,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 850, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
		},		
}	

Def.Module_RocketSilo_Prec_Mob = 
{
	inherit 				= "Module_RocketSilo_T4_Epic", --+
	storeItemId				= 0,
	cooldown				= 20,
	cant_be_bought			= false,
	energy_cost				= 80,
	trigger_aura			= false,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	projectile				= "VolleyGuidedRocket_Prec",
	max_range				= 900,
	model 					= "models/misc/invisible_model",
	physics 		= { solid_type = solid.none },
	no_friendly_fire 		= true,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 850, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
		},		
}	

--
Def.Module_GravityAnomaly_Mob = 
{
	inherit 				= "Module_GravityAnomaly_T4_Epic", --+
	storeItemId				= 0,
	cooldown				= 30,
	cant_be_bought			= false,
	energy_cost				= 80,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	model 					= "models/misc/invisible_model",
	physics 		= { solid_type = solid.none },
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 850, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 125, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
		},		
}

--
Def.Module_Javelin_Mob = 
{
	inherit 				= "Module_Javelin_T4_Epic", --+
	storeItemId				= 0,
	cooldown				= 20,
	cant_be_bought			= false,
	energy_cost				= 80,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 425, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 75, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
		},		
}


Def.Module_IsotopeHarvester_Mob = 
{
	inherit 				= "Module_IsotopeHarvester_T5_Epic", --+
	storeItemId				= 0,
	cooldown				= 20,
	cant_be_bought			= false,
	energy_cost				= 80,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	required_ship			= ai.DONT_INHERIT,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 415, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 275, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
		},		
}


Def.Module_TurretPlasma_Mob = 
{
	inherit 				= "Module_TurretPlasma_T4_Epic", --+
	storeItemId				= 0,
	cooldown				= 25,
	cant_be_bought			= false,
	energy_cost				= 80,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	health 					= 120000,
	health_regen 			= 120000 / 120,
	damage_to_host			= 225000,
	barrel_rot_speed 		= 40,
	damage_emp				= 1000,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 200, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
--[[ 				{
					condition_type = AICondition.DistMore,
					param = 275, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				}, ]]
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
		},		
}


Def.Module_DestrMovementRestrictor_Mob = 
{
	inherit 				= "Module_DestrMovementRestrictor_T5_Epic", --+
	storeItemId				= 0,
	cooldown				= 15,
	cant_be_bought			= false,
	energy_cost				= 80,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	required_ship			= ai.DONT_INHERIT,
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 350, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
 				{
					condition_type = AICondition.DistMore,
					param = 100, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				}, 
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
		},		
}


-- ПВЕ-ОМ босс создает пульсары под врагами, нарастающие, призван разгонять кэмпы
Def.Module_MassRemotePulsar_Mob = 
{
	--inherit 				= "Module_AdaptiveBigShieldBoost_T5_Epic", --+
	inherit 				= "Module_CoverShieldProto_Mob", --+
	uiName					= "AlienGun",--	"Неопознанное орудие"
	item_subtype			= ai.DONT_INHERIT,
	
	signature		= ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 16000, --500
	health_regen 	= 16000/50,  --модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 10000,
	model 			= "models/turret/huge_module_shield_gen/shield_gen",
	death_wreck 	= "Module_Wreck",
	
	--activate_entity		= "CoverShieldProto",
	--activate_entity		= "AuraHolderShield",	
	--attach_bone			= "root",
	--spawn_offset 		= Vec3( 0, 0, 0 ),
	spell					= "MassRemotePulsar",

	storeItemId				= 0,
	cooldown				= 3, --40
	cant_be_bought			= false,
	energy_cost				= 10, --400
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	--class_mask				= ai.DONT_INHERIT,
	--required_role			= ai.DONT_INHERIT,
	trigger_aura 			= ai.DONT_INHERIT,
	activate_entity			= ai.DONT_INHERIT,
	
	AIRules			= { 
		conditions	= 	{ -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.DistLess,
				param = 500, 
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},
			{
				condition_type = AICondition.TargetNotTrace, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
		period = 3, -- частота проверки
	},
}

-- ПВЕ-ОМ босс телепортирует текущую цель перед собой
Def.Module_TeleportToKill_Mob = 
{
	--inherit 				= "Module_AdaptiveBigShieldBoost_T5_Epic", --+
	inherit 				= "Module_CoverShieldProto_Mob", --+
	uiName					= "AlienGun",--	"Неопознанное орудие"
	item_subtype			= ai.DONT_INHERIT,
	
	signature		= ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 16000, --500
	health_regen 	= 16000/50,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 10000,
	model 			= "models/turret/huge_module_shield_gen/shield_gen",
	death_wreck 	= "Module_Wreck",
	
	--activate_entity		= "CoverShieldProto",
	--activate_entity		= "AuraHolderShield",	
	--attach_bone			= "root",
	--spawn_offset 		= Vec3( 0, 0, 0 ),
	spell					= "TeleportToKill",

	storeItemId				= 0,
	cooldown				= 3, --40
	cant_be_bought			= false,
	energy_cost				= 10, --400
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	--class_mask				= ai.DONT_INHERIT,
	--required_role			= ai.DONT_INHERIT,
	trigger_aura 			= ai.DONT_INHERIT,
	activate_entity			= ai.DONT_INHERIT,
	
	AIRules			= { 
		conditions	= 	{ -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.DistLess,
				param = 500, 
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},
			{
				condition_type = AICondition.TargetNotTrace, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
		period = 3, -- частота проверки
	},
}


--Module_AdaptiveBigShieldBoost_T5_Epic
Def.Module_AdaptiveBigShieldBoost_Mob = 
{
	--inherit 				= "Module_AdaptiveBigShieldBoost_T5_Epic", --+
	inherit 				= "Module_CoverShieldProto_Mob", --+

	
	signature		= ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 6000, --500
	health_regen 	= 55,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 10000,
	model 			= "models/turret/huge_module_shield_gen/shield_gen",
	death_wreck 	= "Module_Wreck",
	
	--activate_entity		= "CoverShieldProto",
	activate_entity		= "AuraHolderShield",
	
	attach_bone			= "root",
	spawn_offset 		= Vec3( 0, 0, 0 ),

	storeItemId				= 0,
	cooldown				= 30,
	cant_be_bought			= false,
	energy_cost				= 80,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	trigger_aura 			= ai.DONT_INHERIT,
	
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				{  -- вероятно будет несколько проверок. через "и" или "или"
					condition_type = AICondition.ShieldLessThen,
					param = 0.75,
					-- хотя бы 1 таржет если найден с этим кондишином
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ALLY,
						range			= 59,
						-- AROUND
						},
				},
			},
		period = 1, -- частота проверки
		},
}
Def.AuraHolderShield =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	--class_mask		= ai.ShipClass.MEDIUM,
	
	
	-- damage_to_ship_energy_coef = 0.033333333333,
	damageable 		= true,
	health 			= 30000,
	ttl				= 23,
	
	hack_immune 	= true,

	start_sound  	= 	"sound/destroyer/SShield_activate",
	end_sound	=	"sound/destroyer/SShield_off",
	death_sound	=	"sound/destroyer/SShield_off",
	is_shield		= true, --#

	--model			= "models/shields/turret_shield",
	--model			= "models/shields/shield_stationary",
	model			= "models/shields/shield_cover_sphere2", --models/shields/shield_cover_sphere2
	--physics			= { solid_type = solid.sphere, sphere_radius = 40, kinematic = true, hitbox = true, material = "GiantShield", },
	physics			= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	smart_shield_radius	= 65,  --#90547
	radar_vison		= ai.ShieldRadarVisionMode.PASS,
	weapon_mode		= ai.ShieldWeaponMode.BLOCK_ENEMY,

	-- death_effect	= "particles/gadget/cover_shield_end",
	-- end_effect		= "particles/gadget/cover_shield_end",
	-- uiName 			= "GigantShield",
	show_after 		= 0.2,
	children = 
	{
		{ effect	= "particles/gadget/cover_shield_holder", },
	}
}

-- модуль для зеленого хищника:  если цель ближе 3км и не трейсится, то активировать --- хил щита небольшой + скриптованная функция переноса в такую точку откда трейсится игрок
Def.Module_BossRelocation_Mob = 
{
	inherit 				= "Module_ShieldRestoreLarge_T5_Epic",
	cooldown				= 25,
	storeItemId				= 0,
	energy_cost				= 175,
	cant_be_bought			= false,
	--spell					= "RepairDrones_Mob_l",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 300, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.TargetNotTrace, -- не трейслайнится 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		func = "BossRelocation", -- функция переноса босса
		func_params = { range = 220, }, -- на 2 км от цели
		--debug = true,
		},	
}


Def.Module_BossRelocationManta_Mob = 
{
	inherit 				= "Module_BossRelocation_Mob",
	
	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 20000, --500
	health_regen 	= 350,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 60000,
	module_death_effect 	= "particles/explosions/huge_capacitor_expl_hemisphere",
	--model 			= "models/turret/huge_active_module/huge_active_module",
	model 			= "models/objects/ships_huge/prec_manta/prec_manta_modul_f", --models\objects\ships_huge\prec_manta\prec_manta_modul_f
}


Def.Module_BossHealManta_Mob = 
{
	inherit 	
				= "Module_BossRelocation_Mob",
	
	signature		=	ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 20000, --500
	health_regen 	= 350,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 60000,
	module_death_effect 	= "particles/explosions/huge_capacitor_expl_hemisphere",
	--model 			= "models/turret/huge_active_module/huge_active_module",
	model 			= "models/objects/ships_huge/prec_manta/prec_manta_modul_f", --models\objects\ships_huge\prec_manta\prec_manta_modul_f
	item_subtype	= ItemSubtype.RepairDronesLarge,

	spell 			= "SheduleVampirism",

	AIRules			= { 
		conditions	= 	{ -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.ArmorLessThen,
				param = 0.75,
			},		
			{
				condition_type = AICondition.DistLess,
				param = 150,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ALLY,
					range			= 150,
					-- AROUND
					},					
			},
		},
		period = 3, -- частота проверки
	},
}
Def.Shell_Manta = 
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	hack_immune 		= true,
	physics				= { solid_type = solid.sphere, mass = 1000, sphere_radius = 12.5,  hitbox = true, material = "GiantShield", }, -- kinematic = true,
	
	--model				= "models/weapons/drones/spyradar/spyradar",
	--physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	
	health 								= 400, -- 40000,
	--ttl									= 25, --25-- берется из спелла  SheduleVampirism
	damageable							= true,
	network_sync 						= true,
	
	--spell_on_spawn						= "",

	model								= "models/shields/shield_pve_2_shock",
	death_effect						= "particles/gadget/aura_wave_green",
	ui_color							= 0xFFEEFFCC,
}


Def.Module_PulsarAlienManta_Mob = 
{
	inherit 				= "Module_CookCannon",
	
	signature		=	ai.Signature.TINY,
	--physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = 2 },--solid.model
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 30000, --500
	health_regen 	= 500,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 100000,
	module_death_effect 	= "particles/explosions/huge_capacitor_expl_hemisphere",
	--model 			= "models/turret/huge_active_module/huge_active_module",
	model 			= "models/objects/ships_huge/prec_manta/prec_manta_modul_b", --models\objects\ships_huge\prec_manta\prec_manta_modul_f

	check_aim_orientation_angle 	= 140,
	barrel_rot_speed				= 90,

	cooldown						= 35, --25
	energy_cost 					= 500,
	track 							= ai.TrackMode.AIM,
	stop_barrels					= ai.BarrelsStopMode.ACTIVE,
	target_cone_angle 				= 140, -- Это угол самонаведения
	max_projectiles_per_target		= 1,

	damage_thermal					= 1000,
	--spell_on_hit					= "FotonVortex", -- идея в том что растет урон по расстоянию, поэтому 
	dispersion						= 10,
	ammo							= 6,
	no_friendly_fire				= true,
	shoot_mode						= ai.FiringModuleShootMode.BURST,
	fire_rate 						= 60,
	
	optimal_range 					= 450,
	max_range 						= 450 * 1.33,

	projectile						= "Projectile_PulsarAlienManta",
	projectile_speed				= 50,

	muzzleflash_color 				= { kinetic = "255 182 128 255", emp = "255 182 128 255", thermal = "255 182 128 255", },
	muzzleflash_radius 				= 45,
	muzzleflash_time 				= 1.0,
	long_shot_effects				= true,
	--shot_effect						= "particles/weapons/artillery_big_muzzle",
	--activate_sound 					= "sound/weapons/xo/CookCannon_reload",
	shot_once_sound 				= "sound/gadgets/IsotopeHarvester/ih",
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 350, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 4, -- частота проверки
	},	
}
--
Def.Projectile_PulsarAlienManta =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/bs_torpedo_mid",
	--model 				= "models/weapons/bs_torpedo",
	explosion_blast_wave = "Blastwave_RocketSilo",
	override_blast_wave_damage = true,

	detonation_radius	= 3,

	spell_on_launch		= "PulsarAlienManta",
	
	--acceleration_time 	= 0.75,

	angular_velocity	= 30,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	--effect 				= "particles/weapons/missile/destroyer_rocket_trail",
	effect 				= "particles/gadget/jericho_active_module_sphere",
	work_sound 	    	= "sound/gadgets/IsotopeHarvester/ih_sphere_fly",
	is_guided 			= true,
	random_trajectory	=  true,
}




-- создается эвент - портал
Def.Module_BossPortal_Mob = 
{
	inherit 				= "Module_ShieldRestoreLarge_T5_Epic",
	cooldown				= 60, --45,
	storeItemId				= 0,
	energy_cost				= 175,
	cant_be_bought			= false,
	item_subtype			= ai.DONT_INHERIT,
	--spell					= "RepairDrones_Mob_l",
	AIRules			= { 
		conditions	= 	{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 500, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.DistMore,
					param = 150, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
			},
		period = 5, -- частота проверки
		func = "CreateModuleEvent", -- функция создания эвента
		func_params = { event = "AlienPortal", range = 45, }, -- сам эвент, range - расстояние от босса для спавна эвента
		--debug = true,
	},	
}

Def.Module_HealBanHaze_Mob_T4 = 
{
	inherit 				= "Module_HealBanHaze_T4_Mk1",
	storeItemId				= 0,
	cooldown				= 15,
	cant_be_bought			= false,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 70,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
}	

Def.Module_MineField_Mob = 
{
	inherit 				= "Module_AchillesTargetingUnit_T5_Mk1",
	storeItemId				= 0,
	cant_be_bought			= false,
	class_mask				= ai.DONT_INHERIT,
	
	cooldown				= 15,
	spell					= "MineField_Mob",
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 70,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
}	

Def.Module_StaticShield_Mob = 
{
	inherit 				= "Module_StaticShield",
	storeItemId				= 0,
	cant_be_bought			= false,
	
	cooldown				= 15,
	energy_cost				= 275,
	--spell					= "CoverBarrier_Mob",
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistMore,
					param = 70,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{
					condition_type = AICondition.DistLess,
					param = 350, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
				{ 
					condition_type = AICondition.Behavior,
					param = "DistanceShoot",
				},
			},
		period = 2, -- частота проверки
		},		
}	


-- удаленный пульсар
Def.Module_PrometheusPot_Mob_T3 = 
{
	inherit 				= "Module_PrometheusPot_T3_Mk1",  --Module_PrometheusPot_T3_Mk1
	storeItemId				= 0,
	
	cant_be_bought			= false,
	--spell					= "TractorBeam_Mob_T3",
	energy_cost				= 80,
	--	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 325, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
}	


-- лужи под всех врагов. кто не вылетел попадает в стан
Def.Module_PredatorTrap_Mob_T3 =  
{
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 325, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
	inherit 				= "Module_HunterZone",  --+ --Module_PrometheusPot_T3_Mk1
	default_icon			= "ItemSubtype_DestrDeadlyTrap",
	item_subtype			= ItemSubtype.DestrDeadlyTrap,
	storeItemId				= 0,
	cooldown				= 25,
	cant_be_bought			= false,
	spell					= "PredatorTrap",
	energy_cost				= 140,
	--	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,		
}	


-- лужи под всех врагов. кто не вылетел попадает на урон
Def.Module_Executor_Mob_T3 =  
{
	inherit 				= "Module_HunterZone",  --Module_PrometheusPot_T3_Mk1
	item_subtype			= ItemSubtype.RadiationCloud,
	storeItemId				= 0,
	cooldown				= 25,
	cant_be_bought			= false,
	spell					= "Executor",
	energy_cost				= 40,
	--	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	--RadiationCloud
	default_icon = "ItemSubtype_RadiationCloud",
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 325, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
--[[ 				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				}, ]]
			},
		period = 2, -- частота проверки
		},		
}	


--Module_Pulsar_Alien
Def.Module_PulsarAlien_Mob_T3 =  
{
	inherit 				= "Module_Pulsar_Alien", --Module_SmartBomb_T3_Mk1",  --Module_PrometheusPot_T3_Mk1	
	default_icon			= "ItemSubtype_SmartBomb",
	storeItemId				= 0,
	cooldown				= 15,
	cant_be_bought			= false,
	--spell					= "PredatorTrap",
	spell					= "Alien_Pulsar_Mob_T3",
	energy_cost				= 200,
	--	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 125, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
}	

Def.Module_EnergyLance_Mob =  
{
	inherit 				= "Module_EnergyLance_T3_Mk1", --Module_SmartBomb_T3_Mk1",  --Module_PrometheusPot_T3_Mk1	
	default_icon			= "ItemSubtype_SmartBomb",
	storeItemId				= 0,
	cooldown				= 15,
	cant_be_bought			= false,
	--spell					= "PredatorTrap",
	energy_cost				= 100,
	--	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 100, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
}	

Def.Module_Gen_MeatEnergyLance_Mob =
{
	inherit			= "Module_EnergyLance_T2_Mk1",
	cooldown		= 25,
	energy_cost		= 10,	
	damage_thermal	= 5000,
	work_time		= 3000,
	ai_usage	 	= ai.AiBehavior.RAM,
	class_mask		= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
			conditions	= {
					{
					condition_type = AICondition.DistLess,
					param = 3500,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
					},
				},
		period = 2, -- частота проверки
		--debug = true,
		},
	cant_be_bought	= true,
	storeItemId		= 0,
	damage_box_size	= Vec3( 10.0, 10.0, 9.5 ),
}

Def.Module_Gen_Wave_Kamikaze_Mob =
{
	inherit			= "Module_Suicide_T1_Epic",
	ai_usage		= ai.AiBehavior.KAMIKAZE,
	cooldown		= 5,
	energy_cost		= 10,	
	spell				 = "Suicide_Gen_Wave_Kamikaze",
	spell_on_death_active = "Suicide_T3_Mk1_death",
	class_mask		= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
			conditions	= {
				{
					condition_type = AICondition.DistLess,
					param = 500,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
			},
		period = 2, -- частота проверки
		--debug = true,
		},
	cant_be_bought	= true,
	storeItemId		= 0,
}

Spell.Suicide_Gen_Wave_Kamikaze = 
{
	inherit			= "Suicide_T3_Mk1",
	duration		= 300,
}

Def.Module_Gen_HardShield_Mob =
{
	inherit			= "Module_HardShield",
	cooldown		= 5,
	energy_cost		= 10,	
	work_time		= 3000,
	ai_usage		= ai.AiBehavior.SHIELD,
	class_mask		= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	AIRules			= { 
				conditions	= {
				{
					condition_type = AICondition.DistLess,
					param = 3500,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				},
		period = 2, -- частота проверки
		},
	cant_be_bought	= true,
	storeItemId		= 0,
}

Def.Module_Gen_VolleyRocket_Mob =
{
	inherit 				= "Module_Vortex", --+
	cooldown				= 1,
	energy_cost				= 30,
	storeItemId				= 0,
	projectile_speed 		= 80,
	projectile				= "Projectile_Gen_VolleyRocket",
	damage_kinetic			= 4000,
	cant_be_bought			= true,
	--class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM,
	--required_role			= ai.ShipRoles.RECON,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 250,
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
			},
		period = 0.2, -- частота проверки
		useTargetModule = true, --!!!
		debug	= true,
		},		
	
}


Def.Projectile_Gen_VolleyRocket =
{
	inherit				= "Weapon_BaseRocket",
	model 			= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave = "Blastwave_RocketWolfhound",
	override_blast_wave_damage = true,

	detonation_radius	= 8,

	angular_velocity	= 50,

	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_small",
	is_guided 			= false,
	random_trajectory	=  true,
}

Def.Weapon_Railgun_Heavy_Mob_Sniper_T3 = 
{
	inherit 				= "Weapon_Railgun_Heavy_T3_Mk1",
	dispersion				= 1.5,
	dispersion_max			= 1.5,
	optimal_range			= 350,
	max_range				= 450,
	fire_rate				= 2.6,
	storeItemId				= 0,
	cant_be_bought			= true,
	heat_add				= 0.1,
	projectile				= "Projectile_Artillery_Mob_Sniper",
	damage_kinetic			= 641.1,
}

Def.Weapon_Railgun_Far_Sniper = 
{
	inherit 				= "Weapon_Railgun_Heavy_T3_Mk1",
	dispersion				= 0.5,
	dispersion_max			= 0.5,
	optimal_range			= 1500,
	max_range				= 2000,
	fire_rate				= 1,
	storeItemId				= 0,
	cant_be_bought			= true,
	heat_add				= 0.1,
	projectile				= "Projectile_Artillery_Mob_Sniper",
	damage_kinetic			= 2880,
}

Def.GuidedMissileBlastWave_Mob_Sniper = 
{
	class 				= "BlastWave",
	in_editor			= false,
	
	intensity			= 100,
	damage_thermal		= 4000,
	
	blast_maxDistance	= 20,
	
	effect 				= "particles/explosions/artillery_fire",
	light_color 		= "255 182 128 100",
	light_radius 		= 20,
	light_time 			= 0.8,
	sound 				= "sound/explosion/small_rocket_expl",
}

Def.Weapon_Destroyer_Rocket_Heavy_T3 = 
{
	inherit 				= "Weapon_Railgun_Heavy_T3_Mk1",
	dispersion				= 1,
	dispersion_max			= 6,
	optimal_range			= 300,
	max_range				= 650,
	damage_kinetic			= 1250*1.25,
	heat_max				= 3,
	overheat_time			= 5,
	fire_rate				= 20,
	storeItemId				= 0,
	cant_be_bought			= true,
	projectile				= "Projectile_BossRocketDestroyer",
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
}

Def.Projectile_BossRocketDestroyer = 
{
	inherit 				= "Projectile_RocketWolfhound",
	is_guided 				= false,
}

Def.Weapon_Destroyer_BossPlasmaHeavy = 
{
	inherit 				= "Weapon_Railgun_Heavy_T3_Mk1",
	item_subtype			= ItemSubtype.ElectricPotentialInductor,
	dispersion				= 1,
	dispersion_max			= 6,
	optimal_range			= 500,
	max_range				= 650,
	damage_kinetic			= 0,
	damage_emp				= 3000,
	heat_max				= 2,
	overheat_time			= 4,
	fire_rate				= 10,
	storeItemId				= 0,
	cant_be_bought			= true,
	projectile				= "Projectile_BossPlasmaHeavy",
	spell_on_hit			= "BossEventWeapon_ElectricPotentialShift",
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
--!!!!	spell_on_equip			= "BossEvadeHeal",
}

Def.Projectile_BossPlasmaHeavy = 
{
	inherit 				= "Projectile_RocketWolfhound",
	effect 					= "particles/weapons/big/growing_projectile",
	explosion_blast_wave 	= "Blastwave_ChargableGun_Base",
	is_guided 				= false,
}

Def.Weapon_RailgunDestr_Mob_T3 = 
{
	inherit 				= "Weapon_RailgunDestr_T3_Mk1",
	damage_kinetic			= 200 *1.25,
	optimal_range			= 300,
	max_range				= 550,
	fire_rate				= 75,
	projectile_speed		= 300,
	storeItemId				= 0,
	cant_be_bought			= true,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
}


Def.Module_PositionSwap_Mob =
{
	inherit					= "Module_SwapTeleport",
	tier					= 5,
	price					= 2500000,
	premiumPrice			= 3500000,
	cant_be_bought			= true,
	item_lvl				= 29,
	rank					= 15,
	rank_min				= 13,
	rank_max				= 17,
	mark					= 5,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	item_subtype			= ItemSubtype.PositionSwap,
	energy_cost				= 10,
	cooldown				= 30,
	spell					= "PreSwap_Mob",
	class					= "ActiveModule",
	module_type				= ai.ModuleType.ACTIVE,
	model					= "models/modules/m_active/elidium_modules/crystal_rage_mode",
	activate_module_effect	= "particles/gadget/default_module_work",
	default_icon			= "ItemSubtype_PositionSwap",
	storeItemId				= 0,
	shopCategory			= "ACTIVE_MODULES",
	shopSubCategory			= "ACTIVE_GUARD",
	influence_type_color	= InfluenceTypeColor.DEBUFF_ABILITY,
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 800,
					target = { target = ai.SpellTargetGeneral.LOCKED_TARGET },
				},
			},
		period = 1, -- частота проверки
		useTargetModule = true, --!!!
		debug	= true,
		},	
}

Spell.PreSwap_Mob = 
{
	target		= {
		target			= ai.SpellTargetGeneral.LOCKED_TARGET,
		class			= ai.SpellTargetClass.SHIP,
		area			= ai.SpellTargetArea.AROUND,
	},
	aura_target = {
		target			= ai.SpellTargetGeneral.HOLDER, -- + ai.SpellTargetGeneral.CASTER,
	},
	target_range		= 800,
	aura				= ai.Aura.SLOW_MOVEMENT,
	duration			= 5,
	isBuff				= false,
	aura_param			= 0.02,
	spell_on_cancel		= "GuardSwapC",
	aura_target_fx		= "particles/gadget/teleport_prepare",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_PositionSwap", },
	},
	hud_visible			= false,
}

Def.PvE_Gen_Station =
{
	inherit					= "VitalPoint_Captureable",
	in_editor				= true,
		
	model					= "models/objects/vital_point/control_station/control_station",
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" }, 
	health					= 5000,
	remove_on_death 		= false,
	
	relationship_group 		= 2,
	maxViewDist 			= 5000,
	hudType					= "major",
	hud_visibility_type 	= "major",
	vision_always 			= true,
	regen_speed				= 25.0,
	regen_max_ally			= 5,
	decay_damage			= 80,
	decay_max_enemy 		= 4,
	
	uiName					= "PvE_Gen_DemolishRadarStation_name",
}

Def.PvE_Gen_StationShadow =
{
	class					= "ScBaseEntity",
	in_editor				= true,
		
	model					= "models/objects/vital_point/control_station/control_station",
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" }, 
}

Def.PvE_Gen_Portal =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	health			= 3600, -- 7200 #47101
	relationship_group = 2,
	regen_speed		= 15.0,
	regen_max_ally	= 5,
	decay_damage	= 40,
	decay_max_enemy = 12,
	
	idle_sound 		= "sound/ambient/alien_portal_loop",
	death_sound		= "sound/ambient/alien_portal_off",
	
	friendly_beam_fx= "particles/objects/portal_close_beam",
	hostile_beam_fx = "particles/objects/portal_close_beam",
	activation_beam_fx	= "particles/objects/prec_cruiser_portal_beam",

	vision_always 	= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	turret_def1 	= "",
	turret_def2 	= "",
	turret_def3 	= "",
	turret_def4 	= "",
	is_decayable	= false,
	
	precache_skins = true,
	
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	damageable			= false,
	maxViewDist			= 5000,
	special_object  	= true,
	vision_always 		= true,
	relationship_group 	= 2,
	effect				= "particles/jumpgates/pirate_portal_new",
	uiName 				= "reider_portal",	
	show_sound 			= "sound/gadgets/pve_ship_warp_in",
	
	children = 
	{
		{ effect	= "particles/jumpgates/pirate_portal_new", },
	}	
}

Def.PvE_Gen_PortalEffect =
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
	effect				= "particles/jumpgates/pirate_portal_new",
	uiName 				= "reider_portal",	
}

Def.PvE_Gen_PortalOpening =
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
	effect				= "particles/jumpgates/pirate_portal_new_openclose",
	uiName 				= "reider_portal",	
	--ttl 				= 5, -- работает
}
Def.Gen_PortalOpening =
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
	effect				= "particles/jumpgates/pirate_portal_new_openclose",
	uiName 				= "reider_portal",	
	ttl 				= 5, -- работает
}



Def.Module_Mob_Javelin_T3 = 
{
	inherit			= "Module_Javelin_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	damageble		= false,
	energy_cost		= 20,
	model			= "models/weapons/rf_blaster/rf_blaster_mod1",
	physics			= { solid_type = solid.none },	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				{
					condition_type = AICondition.DistLess,
					param = 225,
					target = {   -- кого проверяем 
						class 			= ai.SpellTargetClass.SHIP,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						range			= 225,
						-- AROUND
						},					
				},
			},
		period = 2, -- частота проверки
		useTargetModule = true,
		debug	= true,
		},		
}	

Def.Module_TachRay_Mob_T4 = 
{
	inherit			= "Module_TachRay_T4_Mk1",
	cooldown		= 15,
	storeItemId		= 0,
	cant_be_bought	= false,
	damageble		= false,
	energy_cost		= 230,
		--spell="TachRay_T4_Mk1"
	deactivate_spell	= "TachRay_Mob_T4_Deactivate",--"TachRay_T4_Mk1_Deactivate"
	model			= "models/weapons/rf_blaster/rf_blaster_mod1",
	physics			= { solid_type = solid.none },	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistLess,
					param = 450, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		useTargetModule = true,
		debug	= true,
		},			
}

Def.Weapon_Plasmagun_Autofire_Mob_T3 = 
{
	inherit			= "Weapon_Plasmagun_Autofire_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	fire_rate		= 125,
}

Def.Weapon_Plasmagun_Autofire_Round_Mob_T3 = 
{
	inherit			= "Weapon_Plasmagun_Autofire_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	fire_rate		= 300,
	heat_add		= 3,
	heat_max		= 4,
	heat_sub		= 2,
	overheat_time	= 1.5,
}	

Def.Weapon_Railgun_Basic_Mob_T3 = 
{
	inherit			= "Weapon_Railgun_Basic_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	fire_rate		= 100,
	max_range		= 300,
	optimal_range	= 400,
}	

Def.Weapon_Railgun_Basic_Mob_Round_T3 = 
{
	inherit			= "Weapon_Railgun_Basic_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	fire_rate		= 300,
	heat_max		= 4,
	heat_add		= 3,
	heat_sub		= 4,
	overheat_time	= 3,
}
-- для штурмов
Def.Weapon_Railgun_Basic_Mob_Round_Slow = 	
{
	inherit				= "Weapon_Railgun_Basic_Mob_Round_T3",
	storeItemId			= 0,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	projectile_speed 	= 160, -- default 450-550
	damage_kinetic		= 155,
}
-- для боссов
Def.Weapon_PlasmaVolley_Mob_Round_Slow = 	
{
	inherit				= "Weapon_PlasmaVolley_T4_Mk1",
	storeItemId			= 0,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	damage_emp			= 900 * 1.25,
	projectile_speed 	= 95, 
	dispersion 			= 0.5,
	cycle_barrels 		= true,
	heat_add			= 6,
	heat_sub			= 3,
	no_friendly_fire 	= true,
}

-- для боссов
--Weapon_Destroyer_Rocket_Heavy_T3
Def.Weapon_OrbGunUnique_II_Round_Slow = 	
{
	inherit				= "Weapon_OrbGunUnique_II_T1_Epic",
	storeItemId			= 0,
	class_mask			= ai.DONT_INHERIT,
	damage_emp			= 800*1.25,
	projectile_speed 	= 75, 
	dispersion 			= 0.5,
	--cycle_barrels 		= true,
	heat_add			= 12,
	heat_sub			= 10,
	overheat_time 		= 0,
	required_ship		= ai.DONT_INHERIT,
	required_role		= ai.DONT_INHERIT,
}
-- для боссов  можно зеленым
Def.Weapon_GreenGravityAnomaly_Mob_Slow = 	
{
	inherit				= "Weapon_GreenGravityAnomaly_T5_Mk1",
	storeItemId			= 0,
	class_mask			= ai.DONT_INHERIT,
	damage_emp			= 200*1.25,
	projectile_speed 	= 75, 
	dispersion 			= 0.5,
	--cycle_barrels 		= true,
	heat_add			= 3,
	heat_sub			= 10,
	overheat_time 		= 3,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	--required_ship		= ai.DONT_INHERIT,
	required_role		= ai.DONT_INHERIT,
}

-- для боссов   зеленым
Def.Weapon_AlienGun_Mob =
{
	inherit				= "Weapon_AlienGun_T4",
	cycle_barrels 		= true,
	projectile			= "Projectile_AlienGun_OW",
	fire_rate			= 24,
	heat_max 			= 10,
	heat_add			= 1,
	heat_sub			= 10,
	overheat_time 		= 4,
	damage_emp			= 4500,	
	projectile_speed	= 250,	
}

Def.Weapon_ReaverGun_Rarely = {
	inherit				= "Weapon_ReaverGun_T4",
	fire_rate			= 15,
	damage_emp		 	= 2000,
	projectile_speed	= 700,
	max_range			= 700,
	optimal_range		= 350,
}

-- для перехватов
Def.Weapon_PlasmagunEnergy_Mob_Round_Slow = 	
{
	inherit				= "Weapon_PlasmagunEnergy_T5_Mk1",
	storeItemId			= 0,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	damage_emp			= 500,
	projectile_speed 	= 90, 
	dispersion 			= 0,
	cycle_barrels 		= true,
	heat_add			= 9,	
	heat_sub			= 2,
	required_ship		= ai.DONT_INHERIT,
	required_role		= ai.DONT_INHERIT,
}
-- для перехватов -- railgun дробовик
Def.Weapon_Railgun_Autofire_Slow = 	
{
	inherit				= "Weapon_Railgun_Autofire_T5_Mk1",
	storeItemId			= 0,
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	damage_kinetic		= 1400,
	projectile_speed 	= 400, 
	dispersion 			= 4,
	heat_add			= 7,
	heat_sub			= 6,
	overheat_time 		= 4,
	--required_ship		= ai.DONT_INHERIT,
	required_role		= ai.DONT_INHERIT,
}



Def.Weapon_Laser_Basic_Mob_T3 = 
{
	inherit			= "Weapon_Laser_Basic_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	damage_thermal	= 342.8,
}	

Def.Weapon_Railgun_Heavy_Mob_T3 = 
{
	inherit			= "Weapon_Railgun_Heavy_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	fire_rate		= 11,
}	

Def.Weapon_Railgun_Autofire_Mob_T3 = 
{
	inherit			= "Weapon_Railgun_Autofire_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	optimal_range	= 200,
	max_range		= 350,
	dispersion		= 1.5,
	projectile_speed = 200,
	fire_rate		= 40,
}	

Def.Weapon_SuppressingFire_Mob_T3 = 
{
	inherit			= "Weapon_SuppressingFire_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	fire_rate		= 45,
}	

Def.Weapon_Railgun_Sniper_Mob_T3 = 
{
	inherit			= "Weapon_Railgun_Basic_T3_Epic", --"Weapon_Railgun_Sniper_T3_Mk1",
	optimal_range	= 450,
	max_range		= 600,
	dispersion		= 0.2,
	projectile_speed = 750,
	storeItemId		= 0,
	cant_be_bought	= false,
	fire_rate		= 25,
	damage_kinetic	= 750,
}	

Def.Weapon_Mob_Plasmagun_Heavy_T3 = 
{
	inherit			= "Weapon_Plasmagun_Heavy_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	fire_rate		= 20,
}	

Def.Weapon_Mob_FrontLineCannon_T3 = 
{
	inherit			= "Weapon_FrontLineCannon_T3_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	projectile_speed = 160,
	fire_rate		= 10,
}	

Def.Weapon_Mob_Positron_T3 = 
{
	--inherit			= "Weapon_Plasmagun_Sniper_T4_Mk1",
	inherit			= "Weapon_Plasmagun_Basic_T5_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	class_mask		= ai.DONT_INHERIT,
	projectile_speed = 600,
	dispersion		= 0.2,
	fire_rate		= 24,
}

Def.Weapon_Mob_CrystallSparks = 
{
	inherit			= "Weapon_CrystallSparks_T5_Mk1",
	storeItemId		= 0,
	cant_be_bought	= false,
	projectile_speed = 250,
	--fire_rate		= 24,
}

Def.PvE_Gen_Jericho_Turret1 =
{
	inherit 		= "Turret_Team1_Pve_PlayerRailgun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 2,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 50000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 30.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 370,
	max_range		= 500,
	projectile_speed = 260,
	
	respawn_time 		= 3600.0,
	
	damage_kinetic	= 0,
	damage_emp		= 1800,
	damage_thermal	= 0,
	
	max_rot_speed	= 45,	-- deg per second

	projectile		= "Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_tiny",	
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot", 
	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName = "Jericho_RailGun_name",
	points_reward_assist_damage = 100,	
}

Def.PvE_Gen_Turret_Team1_Jericho =
{
	inherit 		= "Turret_Team1_Pve_Jericho",
	build_time		= 18.0,	
}

-- генератор энергоблока для щита на карте Jericho_base
Def.PvE_Gen_EnergyGenerator1 = 
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 				= 170000,
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	
	model				= "mapskit/maps/models/bigship/power_block2_in3", 
	physics				= { solid_type = solid.model, static = true, material = "Metal" },

	death_effect		= "particles/explosions/objects/explosion_big",
	death_sound			= "sound/explosion/ship_expl",
	broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 10, 3, 23 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 2 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( -6, 3, -21 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 3 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 0, 3, 3 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
	},

	points_reward_kill 	= 50,
	points_reward_assist_damage = 350,

	vision_always 		= true,
	relationship_group 	= 2,
	hack_immune		= true,
	
	uiName 				= "Pve_EnergyGenerator_name",
} 

-- генератор энергоблока 
Def.PvE_Gen_EnergyGenerator2 = 
{
	inherit			= "PvE_Gen_EnergyGenerator1",
	relationship_group 	= 2,
	health 				= 300000,
	
	uiName 				= "Pve_EnergyGenerator_name",
} 

Def.PvE_Gen_Wave_EnergyGenerator = 
{
	inherit			= "PvE_Gen_EnergyGenerator1",
	relationship_group 	= 1,
	health 			= 300000,
	uiName 				= "Pve_EnergyGenerator_name",
} 

Def.PvE_DemolishDockingBay_Enemy =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	damageable		= true,
	maxViewDist		= 5000,
	health 			= 570000,
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",	
	relationship_group 	= 2,
	model			= "mapskit/maps/models/imper_station/docking_bay_huge/docking_bay_huge",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal", },
	uiName 			= "PvE_DemolishDockingBay_Enemy",
	
	death_effect		= "particles/explosions/objects/docking_bay_explosion",
	death_sound			= "sound/explosion/turret_expl",
	hack_immune			= true,
}

Def.PvE_DemolishDockingBay_Ally = 
{
	inherit				= "PvE_DemolishDockingBay_Enemy",
	health 				= 50000,
	relationship_group 	= 1,
	uiName 				= "PvE_DemolishDockingBay_Ally_name",
}

Def.PvE_DemolishDockingBay_Ally_RPB = 
{
	inherit				= "PvE_DemolishDockingBay_Enemy",
	health 				= 50000,
	relationship_group 	= 1,
	uiName 				= "PvE_DemolishDockingBay_Ally_name",
}

Def.PvE_Gen_RadarStation =
{
	inherit			= "PvE_Gen_Station",
	
	model			= "models/objects/vital_point/radar_station/radar_station_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	relation_health = 666,		-- здоровье на котором меняется RelationshipGroup
	recaptureable	= true,
	relationship_group 	= 0,
	regen_speed		= 70.0,
	regen_max_ally	= 3,
	uiName 			= "PvE_Gen_RadarStation_name",
}	

Def.PvE_Gen_RadarStation2 =
{
	inherit			= "PvE_Gen_Station",
	
	model			= "models/objects/vital_point/radar_station/radar_station_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	health			= 3000,
	relation_health = 666,		-- здоровье на котором меняется RelationshipGroup
	recaptureable	= false,
	relationship_group 	= 2,
	regen_speed		= 70.0,
	regen_max_ally	= 3,
	uiName 			= "OpenWorld_QuestJericho_s3d",
	remove_on_death 		= false,
}	

Def.PvE_Gen_EnergyStation =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	
	model				= "models/objects/vital_point/energy_station/empire_energy_station",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	health 				= 30000,
	uiName 				= "PvE_Gen_EnergyStation_name",
	spell_aura_target 	= true,
	damageable			= true,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 				= 170000,
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	death_effect		= "particles/explosions/objects/control_station_explosion",
	death_sound			= "sound/explosion/cargoship_expl",
	hack_immune			= true,
	
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
	
	relationship_group 	= 2,
}	

Def.PvE_Gen_DemolishRadarStation =
{
	inherit			= "PvE_DemolishDockingBay_Ally",
	
	model			= "models/objects/vital_point/radar_station/radar_station_01",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	health 			= 90000000,
	damageable		= false,
	relationship_group 	= 1,
	uiName 			= "PvE_Gen_DemolishRadarStation_name",
}	

Def.PvE_Gen_EnergyGenerator = 
{
	class				= "ScBaseEntity", --"ScBaseEntity",
	signature			= ai.Signature.HUGE,
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 				= 400000,
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	
	model			= "models/objects/gameplay/generator/generator_01", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },

	children = 
	{
		{ effect ="particles/objects/generator_01_core", joint = "fx" },
	},
	
	broken_parts = 
	{
		{ def = "EnergyGenerator_Wreck",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 0.0,dumping = 1.0, speed = 0.0, speed_deviation = 0.0, speed_inherit = 0.0, ttl = 1.0, },
	},
	
	death_effect	= "particles/explosions/objects/energygenerator_explosion",
	death_sound		= "sound/ambient/frozen_generator_death",
	
	points_reward_kill = 50,
	points_reward_assist_damage = 450,

	vision_always = true,
	relationship_group = 2,
	
	work_sound	= "sound/ambient/frozen_generator_loop",	
	
	uiName 		= "Pve_EnergyGenerator_name",
} 

-- для эвента с маяком (уничтожение)-- 
Def.PvE_Gen_Beacon_event = 
{
	class 			= "Turret",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	damageable			= true,
	health 				= 100000,
	special_object 		= true,
	vision_always 		= true,
	hudType				= "default",
	hud_visibility_type = "major",
	hud_ico				= "ClanShip_Bomb",
	maxViewDist			= 5000,
	points_reward_kill  = 100,

	relationship_group = 2,
	
	death_effect	= "particles/explosions/objects/control_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -10, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 10, -5, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -10, -10, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},
	
	uiName = "PvE_Gen_Beacon_event_name",
	
	vision_always = true,
	hack_immune		= true,
}
-- для эвента с маяком (уничтожение)-- 
Def.PvE_Gen_ShielEnergyGen = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	damageable			= true,
	health 				= 100000,
	spell_aura_target 	= true,
	special_object 		= true,
	vision_always 		= true,
	hudType				= "default",
	hud_visibility_type = "minor",
	maxViewDist			= 5000,
	points_reward_kill  = 100,
	hack_immune		= true,

	relationship_group = 2,
	
	death_effect	= "particles/explosions/objects/control_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -10, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 10, -5, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -10, -10, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},
	
	uiName = "ShieldPortal_RW_name",
	
	vision_always = true,
}

-- бомбы для рандом эвента--
Def.LootCrate_Gen_PvE_Bombs =
{
	inherit				= "LootCrate_PVE_bb2",
	uiName				= "LootCrate_Gen_PvE_Bombs_name",
	hudType				= "bomb",
	relationship_group 	= 1,
	damageable			= false,
}

-- бомбы для фаз с минированием--
Def.LootCrate_Gen_PvE_Mines =
{
	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_time 			= 5,
	interaction_distance		= 50,
	model					=	"models/objects/gameplay/bombball/bombball_orbit",
	physics					=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3, },	
	hudType					=	"bomb",
	uiName 					=	"Bomb_name",
	interacted_sound		= 	"sound/game/bomb_carrier_sound_take",	
	
}

-- бомбы для фаз с минированием--
Def.LootCrate_Gen_Raid_AnimMines =
{
	class				= "ScBaseEntity",
	uiName				= "LootCrate_Gen_PvE_Bombs_name",
	--hudType				= "bomb",
	relationship_group 	= 1,
	damageable			= false,
	physics				= { solid_type = solid.none },
	model				= "models/objects/gameplay/bombball/beacon_rotate",	
	
	children = 
	{
		{def = "LootCrate_Gen_Raid_AttachedMine",	joint = "drone03"},
	},
}

Def.LootCrate_Gen_Raid_Mine =
{
	class						= "InteractiveObject",
	active_on_spawn 			= true,
	interaction_time 			= 5,	
	interaction_distance		= 50,
	physics						= { solid_type = solid.none },
	model						= "models/objects/gameplay/bombball/beacon_rotate",	
	hudType						= "bomb",
	uiName 						= "Bomb_name",
	interacted_sound			= "sound/game/bomb_carrier_sound_take",
	children = 
	{
		{ def = "LootCrate_Gen_Raid_AttachedMine",	joint = "drone03" },
	},	
}

Def.LootCrate_Gen_Raid_AttachedMine =
{
	class				= "ScBaseEntity",
	uiName				= "LootCrate_Gen_PvE_Bombs_name",
--	hudType				= "bomb",
	relationship_group 	= 1,
	damageable			= false,
	physics				= { solid_type = solid.none },
	model				= "particles/models/green_beacon",	
}

--корабль для исследований рандом эвента--
Def.LootCrate_Gen_PvE_DeathShip =
{
	inherit			= "LootCrate2_PVE_bb2",
	uiName			= "LootCrate_Gen_PvE_DeathShip_name",
	
	damageable  	= false,
}

Def.Module_TurretPlasma_Mob_T4 =
{
	inherit			= "Module_TurretPlasma_T4_Mk1",
	energy_cost		= 50,
	storeItemId		= 0,
	cant_be_bought	= false,
}

Def.Module_RocketSilo_Mob_T4 =
{
	inherit			= "Module_RocketSilo_T4_Mk1",
	energy_cost		= 50,
	storeItemId		= 0,
	cant_be_bought	= false,
	no_friendly_fire 		= true,
}

Def.Module_TurretThermo_Mob_T4 =
{
	inherit			= "Module_TurretThermo_T4_Mk1",
	energy_cost		= 50,
	storeItemId		= 0,
	cant_be_bought	= false,
}

Def.Module_DestrBeamDrone_Mob_T5 =
{
	inherit			= "Module_DestrBeamDrone_T5_Mk1",
	energy_cost		= 50,
	storeItemId		= 0,
	cant_be_bought	= true,
}

--экспериментальная бомба 
Def.PvE_Gen_Bomb =
{
	class				= "ScBaseEntity",
	model				=	"models/objects/gameplay/bombball/bombball_orbit",
	physics				=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3},
	detonation_time		= 7,
	detonation_distance = 10,
	
	hudType				= "bomb",
	explosion 			= "PvE_Gen_Bomb_Blastwave",
	
	uiName				= "ClanShip_Bomb",
}

Def.PvE_Gen_Bomb_Blastwave =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 10000000000000,
	blast_maxDistance	= 45,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/other/dreadnought_plasma_hit2",
	explosion_light		= "RW_Bomb_Lights",
	sound 				= "sound/dreadnought/big_cannon_hit",
	--
}

Def.PvE_Gen_Dreadnought_StaticDred01 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_empire_01",
	relationship_group 	= 0,
	
	physics			= { solid_type = none },
	children =
	{
		{	def = "PvE_Gen_Dreadnought_Dred02", joint = "root",	},
	},	
	uiName 			= "tooltip_ship_dreadnought"
}

Def.PvE_Gen_Dreadnought_Dred02 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_empire_02",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },
	uiName 			= "tooltip_ship_dreadnought"

}

Def.PvE_Gen_Dreadnought_StaticDred02 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_empire_01",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },
	uiName 			= "tooltip_ship_dreadnought",
	children =
	{
		{	def = "PvE_Gen_Dreadnought_Dred02", joint = "root",	},
	},	

}

Def.PvE_Gen_Dreadnought_Dred03 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_jer_03_back",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },
	uiName 			= "tooltip_ship_dreadnought"

}

Def.PvE_Gen_Dreadnought_StaticDred03 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/bigship_jer_03_front",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },
	uiName 			= "tooltip_ship_dreadnought",
	children =
	{
		{	def = "PvE_Gen_Dreadnought_Dred03", joint = "root",	},
	},	

}

Def.PvE_Gen_BeamWithHalo = 
{
	inherit					= "Lights_BeamWithHalo",

	color					= "240 240 240 100",
	size					= 1000,
	soft					= true,
	width					= 60, 
	
	halo1                   =   true,
	halo1_size         		=   14.8,
	halo1_size_warp			=    0.2,
	halo1_occl_size			=    1.0,
	halo1_vis_angle			=    180.0,	
	halo1_base_color        =   "240 240 240",
	halo1_texture           =   "textures/star_smooth",
	halo1_nebulosity		= 0.75,	
	build_end_sound = "sound/game/turret_build_end",
}

Def.PvE_Gen_GeneratorsLight = 
{
	class				=	'PointLight',
	in_editor			=	true,
	color				= "185 220 255 100",
	rad					= 110,
	
}

Def.PvE_Gen_Average_Turret1 =
{
	inherit 		= "Turret_Team1_Pve_PlayerRailgun",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/big_plasma_cannon/big_plasma_cannon",

	relationship_group = 1,

	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000 },
	health 			= 50000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 90.0,
	dispersion		= 2.0, -- deg
	optimal_range	= 400,
	max_range		= 600,
	projectile_speed = 400,
	
	respawn_time 		= 3600.0,
	
	damage_kinetic	= 0,
	damage_emp		= 700,
	damage_thermal	= 0,
	
	max_rot_speed	= 15,	-- deg per second

	projectile		= "Projectile_DreadTurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_big",	
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot", 
	rot_sound		= "sound/weapons/turret/turret_motor",
	
	uiName 			= "ClanShip_AverageTurret",
	points_reward_assist_damage = 100,	
	hack_immune		= true,
}


Def.PvE_Gen_SpaceShield = 
{
	class 				= "SpaceShield",
	in_editor			= true,
	maxViewDist 		= 999999,
	physics				=	{ solid_type = solid.sphere, static = true, material = "EnergyShield", },

	light_color			= "170 110 90 255",
	texture				= "models/shields/shield_pattern_jericho",
	fadeout_anim		= "dacegikmoquazaamaamaaj",
	fadeout_duration	= 3.0,
	shield_fadeout_sound 	= "sound/ambient/pirate_shield_off",
	health 				= 500000,
	damageable			= false,
	relationship_group = 2,
	hudType				= "default",
	hud_visibility_type = "minor",
}

Def.PvE_Gen_EnergyField =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	health 				= 80000,
	pve_scale_power	 	= true,
	spell_aura_target 	= true,
	maxViewDist			= 5000,
	hudType				= "default",	
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	model				= "models/objects/vital_point/blockpost/fed_blockpost_mini",
	
	vision_always 		= true,
	hack_immune			= true,
	relationship_group 	= 2,
	death_sound     	= "sound/raid/raid_avanpost_explosion",
	death_effect		= "particles/explosions/objects/fed_blockpost_mini_explosion",

	uiName				= "PvE_Gen_EnergyField",	
}

Def.PvE_Gen_DreadGen = 
{
	inherit					= "PvE_Gen_Station",
	in_editor				= true,
	health					= 1800,
	model					= "models/objects/vital_point/energy_station/generator/generator",
	regen_max_ally			= 0,
	regen_speed				= 0,
	hack_immune				= true,
	physics					= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000 },
}

Def.PvE_Gen_BeaconsGen = 
{
	inherit					= "PvE_Gen_Station",
	in_editor				= true,
	health					= 1800,
	regen_max_ally			= 0,
	regen_speed				= 0,
	hack_immune				= true,
	uiName					= "ShieldPortal_RW_name",	
}

Def.PvE_Gen_BeamParentEntity_1 =
{
	inherit 		= "PvE_Gen_Station",
	-- children =
	-- {
		-- {	def = "PvE_Gen_BeamWithHalo", joint = "root",	},
	-- }
	
}

Def.PvE_Gen_BeamParentEntity_2 =
{
	inherit 		= "PvE_Gen_Station",
	-- children =
	-- {
		-- {	def = "PvE_Gen_BeamWithHalo", joint = "root",	},
	-- }
}

Def.PvE_Gen_Dreadnought_MainTurret = 
{
	inherit 			= "ClanShip_MainTurret",
	health 				= 300000,
	damageable			= true,
	relationship_group 	= 2,
	death_effect		= "particles/explosions/objects/fed_blockpost_mini_explosion",
	death_sound     	= "sound/raid/raid_avanpost_explosion",
	hudType				= "default",
	hud_visibility_type = "minor",
	hack_immune		= true,
}

Def.PvE_Gen_Dreadnought_MainTurret_MagSev = 
{
	inherit 			= "ClanShip_MainTurret",
	health 				= 200000,
	damageable			= true,
	relationship_group 	= 2,
	death_effect		= "particles/explosions/objects/fed_blockpost_mini_explosion",
	death_sound     	= "sound/raid/raid_avanpost_explosion",
	hudType				= "default",
	hud_visibility_type = "minor",
	hack_immune		= true,
}

Def.PvE_Gen_Allidium_Dread01 = 
{
	class 			= "ScBaseEntity",
	health 				= 100000000,
	in_editor		= true,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/allidium/allidium_ship_pered",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },
	children =
	{
		{	def = "PvE_Gen_Allidium_Dread02", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Dread03", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Dread04", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Dread05", joint = "root",	},
		{	def = "PvE_Gen_Allidium_Shield", joint = "root",	},
		-- {	def = "PvE_Gen_Dreadnought_AllidiumMainTurret", joint = "big_gun_01",	},
		-- {	def = "PvE_Gen_Dreadnought_AllidiumMainTurret", joint = "big_gun_02",	},
		-- {	def = "PvE_Gen_Dreadnought_AllidiumMainTurret", joint = "big_gun_3",	},
		-- {	def = "PvE_Gen_Average_Turret2", joint = "gun_01",	},
		-- {	def = "PvE_Gen_Average_Turret2", joint = "gun_02",	},
		-- {	def = "PvE_Gen_Average_Turret2", joint = "gun_03",	},
		-- {	def = "PvE_Gen_Average_Turret2", joint = "gun_04",	},
		-- {	def = "PvE_Gen_Average_Turret2", joint = "gun_05",	},
		-- {	def = "PvE_Gen_Average_Turret2", joint = "gun_06",	},
		-- {	def = "PvE_Gen_Average_Turret2", joint = "gun_07",	},
		-- {	def = "PvE_Gen_Average_Turret2", joint = "gun_08",	},
	},	
	relationship_group 	= 1,
	uiName 			= "tooltip_ship_dreadnought"
}

Def.PvE_Gen_Allidium_Shield = 
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/allidium/allidium_ship_shield",
}

Def.PvE_Gen_Allidium_Dread02 = 
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/allidium/allidium_ship_bashnaya",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },

}

Def.PvE_Gen_Allidium_Dread03 = 
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/allidium/allidium_ship_niz",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },

}

Def.PvE_Gen_Allidium_Dread04 = 
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/allidium/allidium_ship_verhushka",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },

}

Def.PvE_Gen_Allidium_Dread05 = 
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	maxViewDist		= 10000,
	model			= "models/ships/bigship/allidium/allidium_ship_zad",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, static = false, mass = 1000000000, material = "Metal" },

}

Def.PvE_Gen_Dreadnought_AllidiumMainTurret = 
{
	inherit 		= "PvE_Gen_Dreadnought_MainTurret",
	projectile_damage			= 1500000,
	health 			= 15000,
	damageable		= true,
	model			= "models/objects/guns/gun_02/gun_02",
	hudType				= "default",
	hud_visibility_type = "minor",
	
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000000 },
	relationship_group = 1,
	death_sound     = "sound/raid/raid_avanpost_explosion",
	death_effect	= "particles/explosions/objects/fed_blockpost_mini_explosion",
	network_sync	= true,
}

Def.Raid_Dreadnought_AllidiumMainTurret = 
{
	inherit 		= "PvE_Gen_Dreadnought_AllidiumMainTurret",
	projectile_damage			= 1500000,
	health 			= 60000*2,
	one_volley		= true,
	
	spell_aura_target = true,
}

Def.PvE_Gen_Average_Turret2 = 
{
	inherit 		= "PvE_Gen_Average_Turret1",
	
	fire_rate		= 120,
	health 			= 9000,
	
	model			= "models/objects/guns/gun_01/gun_01",
	physics			= { solid_type = solid.model, kinematic = true, static = false, material = "Metal" },
	relationship_group = 1,
	
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	dispersion		= 3.0, -- deg
	optimal_range	= 300,
	max_range		= 400,
	projectile_speed = 400,
	
	respawn_time 		= 3600.0,
	
	damage_kinetic	= 0,
	damage_emp		= 500,
	damage_thermal	= 0,

}

Def.PvE_Gen_Average_StaticTurret2 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	
	model			= "models/objects/guns/gun_01/gun_01",
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	relationship_group = 1,

}

Def.PvE_Gen_Raid_Cruiser =
{

	inherit			= "AlienCruiser",

	in_editor			= true,
	damageable			= true,
	spell_aura_target	= true,
	health 				= 5000000,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	hudType				= "default",	
	model				= "models/objects/ships_huge/prec_cruiser/prec_cruiser",

	physics				= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 1000000, },
	
	vision_always = true,
	relationship_group = 2,
	death_effect	= "",
	death_wreck		= "AlienCruiserExpl",

	uiName			= "AlienCruiser",
	points_reward_assist_damage = 300,	
	death_sound		= "sound/raid/boss_death",
	anger_health_percent = { },
	
	max_lin_speed	= 0,
	
	gameplay_coef_group_id	= ai.DONT_INHERIT,
	
	children = 
	{
		{ def = "Turret_CruiserAlienSmall", joint = "gun_1" },
		{ def = "Turret_CruiserAlienSmall", joint = "gun_2" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_3" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_4" },
		{ def = "Turret_CruiserAlien", joint = "gun_5" },
		{ def = "Turret_CruiserAlien", joint = "gun_6" },
		{ def = "TurretPlasma_CruiserAlien", joint = "gun_7" },
		{ def = "TurretPlasma_CruiserAlien", joint = "gun_8" },
		{ def = "Turret_CruiserAlien", joint = "gun_9" },
		{ def = "Turret_CruiserAlien", joint = "gun_10" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_11" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_12" },
		{ def = "Turret_CruiserAlienSmall", joint = "gun_13" },
		{ def = "Turret_CruiserAlienSmall", joint = "gun_14" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_15" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_16" },

		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_17" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_18" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_19" },
		{ def = "TurretPlasma_CruiserAlienSmall", joint = "gun_20" },

		{def = "PrecCruiserEngine",	joint = "engine_1"},
		{effect = "particles/objects/prec_cruiser_engine_aura",	joint = "engine_1"},
		{def = "PrecCruiserEngineEx",	joint = "exhaust_1"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_2"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_2"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_3"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_3"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_4"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_4"},
		{def = "PrecCruiserEngineSmall",	joint = "engine_5"},
		{def = "PrecCruiserEngineExSmall",	joint = "exhaust_5"},
		{def = "PrecCruiserTrail",	joint = "exhaust_1"},
		{def = "PrecCruiserTrail",	joint = "exhaust_2"},
		{def = "PrecCruiserTrail",	joint = "exhaust_3"},
		{def = "PrecCruiserTrail",	joint = "exhaust_4"},
		{def = "PrecCruiserTrail",	joint = "exhaust_5"},

		-- кости fx с 1 по 6 пока сделал как движки
		{def = "PrecCruiserEngineExSmall",	joint = "fx_1"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_2"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_3"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_4"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_5"},
		{def = "PrecCruiserEngineExSmall",	joint = "fx_6"},
		{def = "PrecCruiserTrail",	joint = "fx_1"},
		{def = "PrecCruiserTrail",	joint = "fx_2"},
		{def = "PrecCruiserTrail",	joint = "fx_3"},
		{def = "PrecCruiserTrail",	joint = "fx_4"},
		{def = "PrecCruiserTrail",	joint = "fx_5"},
		{def = "PrecCruiserTrail",	joint = "fx_6"},
	},
	
	broken_parts = 
	{
		{ def = "AlienCruiser_Wreck1",	debris = false, pos = Vec3( 0, 89, -29 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.075, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck2", 	debris = false, pos = Vec3( 13, 52, -32 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck3",  debris = false, pos = Vec3( 7, -7, -40 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.05, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck4",  debris = false, pos = Vec3( -19, -12, -46 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.1, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck5",  debris = false, pos = Vec3( 25, 12, -36 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		--{ def = "AlienCruiser_Wreck6",  debris = false, pos = Vec3( -15, 45, -22 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck7",  debris = false, pos = Vec3( 0, -45, -61 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0.1, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck8",  debris = false, pos = Vec3( 0, -89, -17 ), angle = 360,ang_speed_deviation = 0.05, dumping = 0, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck9",  debris = false, pos = Vec3( 0, 12, 12 ), angle = 360,ang_speed_deviation = 0.01, dumping = 0, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		{ def = "AlienCruiser_Wreck10",  debris = false, pos = Vec3( 0, 12, 22 ), angle = 360,ang_speed_deviation = 0.01, dumping = 0, speed = 6.1, speed_deviation = 0.05, speed_inherit = 0.95, ttl = 180, },
		--
		{ def = "Destroyer_Life_Wreck03", debris = false, pos = Vec3( -2, 10, -76 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 7, speed_deviation = 1, speed_inherit = 0.95, ttl = 180, },
		{ def = "Destroyer_Life_Wreck09", debris = false, pos = Vec3( -4, -10, -78 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 7, speed_deviation = 1, speed_inherit = 0.95, ttl = 180, },
		--
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -43, 20, -42 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 7, speed_deviation = 1, speed_inherit = 0.95, ttl = 180, },
		{ def = "Destroyer_Life_Wreck02", debris = false, pos = Vec3( -25, 45, -22 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 7, speed_deviation = 1, speed_inherit = 0.95, ttl = 180, },
		{ def = "Destroyer_Life_Wreck13", debris = false, pos = Vec3( -41, 20, -41 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 11, speed_deviation = 5, speed_inherit = 0.95, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck05", debris = false, pos = Vec3( -15, 3, -42 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 5, speed_deviation = 5, speed_inherit = 0, ttl = 180, },
		{ def = "Destroyer_Life_Wreck10", debris = false, pos = Vec3( 15, 3, -42 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 11, speed_deviation = 5, speed_inherit = 0.95, ttl = 180, },
		{ def = "Destroyer_Life_Wreck01", debris = false, pos = Vec3( -15, 40, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 11, speed_deviation = 5, speed_inherit = 0.95, ttl = 180, },
		{ def = "Destroyer_Life_Wreck08", debris = false, pos = Vec3( 15, 40, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 7, speed_deviation = 1, speed_inherit = 0.95, ttl = 180, },
		{ def = "Destroyer_Life_Wreck07", debris = false, pos = Vec3( 0, 31, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0.05, speed = 7, speed_deviation = 1, speed_inherit = 0.95, ttl = 180, },
		--{ def = "Destroyer_Life_Wreck06", debris = false, pos = Vec3( 0, -5, -43 ), angle = 360, ang_speed_deviation = 10,dumping = 0, speed = 1, speed_deviation = 1, speed_inherit = 0, ttl = 180, },
	},
}

Def.PvE_Gen_Waves_Turret =
{
	inherit 		= "Turret_Team1_Pve_Jericho",
	class 			= "Turret",
	in_editor		= true,
	model			= "models/turret/plasma_turret/plasma_turret_jer", 

	relationship_group = 1,

	physics			= { solid_type = solid.model, static = true, material = "ShipMetalMk1" },
	health 			= 25000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 30.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 400,
	projectile_speed = 90,
	
	damage_kinetic	= 0,
	damage_emp		= 24000,
	damage_thermal	= 0,
	
	max_rot_speed	= 100,	-- deg per second

	projectile		= "Projectile_TurretPlasma",
	shot_effect 	= "particles/weapons/plasma/muzzle_turret",
	death_effect	= "particles/explosions/objects/explosion_tiny",
	
	uiName = "Turret_RailGun_name",
	
	build_end_sound = "sound/game/turret_build_end",
	
	build_model		= "models/turret/plasma_turret/plasma_turret_jer_holo", 
	init_builded	= false,
	build_time		= 12,
	max_builders	= 1,
	build_beam_fx = "particles/other/build_beam",
	
	shot_once_sound = "sound/weapons/turret/plasmagun_oneshot",
   	rot_sound	= "sound/weapons/turret/turret_motor",	

}

Def.PvE_Gen_Waves_Turret2 = 
{
	inherit			= "PvE_Gen_Waves_Turret",
	damage_emp		= 15000,
	fire_rate		= 100.0,
	
}

Def.TurretPlasma_Monster =
{
	inherit			= "TurretPlasma_CruiserAlien",
	--model			= "models/turret/prec_cruiser_turret/prec_cruiser_turret_small", 
	physics			= { solid_type = solid.none, static = true, kinematic = false, material = "Metal", mass = 1000000, },
	signature		= nil,
	damageable		= false,
	hudType			= "default",
	hud_visibility_type = "minor",
	optimal_range	= 1300,
	max_range		= 1600,
	relationship_group = ai.RelationshipGroups.Alien,
	max_rot_speed	= 20,	-- deg per second
	projectile_speed = 250,

	--children = {},
}


Def.Turret_MonsterGun =
{
	inherit			= "TurretPlasma_Monster",
	model			= "models/characters/monster/monster_gun/monster_gun",
	in_editor		= true, 
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	signature		= ai.Signature.LARGE,
	physics			= { solid_type = solid.model, static = false, kinematic = true, material = "Metal", mass = 1000000, },
	health 			= 200000,
	
	damage_kinetic	= 0,
	damage_emp		= 2180,	
	damage_thermal	= 0,
	
	max_rot_speed	= 0,	-- deg per second
	max_fire_angle 	= 360,	-- 45

	shot_once_sound 	= "sound/weapons/aliengun/ag_shot",

	muzzleflash_color = { kinetic = "80 210 80 128", emp = "80 210 80 128", thermal = "80 210 80 128", },
	shot_effect 	= "",
	death_effect	= "particles/weapons/katana_minelayer/explosion",
	death_sound		= "sound/explosion/drone_expl",	
	
	uiName = "CruiserAlien_Turret_name",
	points_reward_assist_damage = 100,

	--children = {{def = "PrecCruiserGun",	joint = "fx"},},
	hack_immune 	= false,
	respawn_time 	= 9999999, 
	
	gameplay_coef_group_id		= 0,
	gameplay_coef_min_lifetime	= 5,

}

Def.Static_MonsterEgg = 
{
	class 			= "SpaceAsteroid",
	model			= "models/characters/monster/monster_gun/monster_sphere",
	uiName 			= "CruiserAlien_Turret_name",
	physics			= { solid_type = solid.model, material = "Metal", mass = 50000, },
	in_editor		= true, 
	damageable		= false,
	death_effect	= "particles/weapons/other/grab_explosion",
	death_sound		= "sound/game/egg_dissapear",	
}

Def.HoldingRay1 = 
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	maxViewDist = 999999,
	model 		= "models/misc/invisible_model",
	physics		= { solid_type = solid.none },
	effect 			= "particles/areal/huge_stuff/holding_ray_holder", 
}

Def.Smoke_MainTurret = 
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	maxViewDist = 999999,
	-- model 		= "models/misc/invisible_model",
	-- physics		= { solid_type = solid.none },
	effect = "particles/areal/smoke_sat_ado",
}

Def.Trigger_Explode = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model 			= "models/misc/invisible_model",
	
	physics			= { solid_type = solid.none },
	damageable		= false,

	death_effect	= "particles/explosions/objects/control_station_explosion",
	death_sound		= "sound/explosion/cargoship_expl",
	
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -10, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 10, -5, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -10, -10, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},
	vision_always 	= true,
	
	network_sync	= true,
}

Def.Trigger_Explode2 = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model 			= "models/misc/invisible_model",
	
	physics			= { solid_type = solid.none },
	damageable		= false,

	death_effect	= "particles/explosions/objects/alien_monster_sphere_explosion",
	death_sound		= "sound/raid/boss_death",
	
	broken_parts = 
	{
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( -10, 5, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris1",  debris = false, pos = Vec3( 10, -5, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( 10, 0, 10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris2",  debris = false, pos = Vec3( -10, -10, -10 ), ang_speed_deviation = 3,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
		{ def = "SmallWreckDebris3",  debris = false, pos = Vec3( 0, 0, 0 ), ang_speed_deviation = 1.5,dumping = 0.0, speed = 6, speed_deviation = 5, speed_inherit = 0, ttl = 20, },
	},
	vision_always 	= true,
	
	network_sync	= true,
}

Def.PvE_MainTurretTarget =
{
	inherit		= "PvE_Debrissite_Bomb",
	
	uiName		= "PvE_MainTurretTarget",
}

Def.PvE_MainTurretBuild = 
{
	inherit			= "PvE_Debrissite_BombBuild",
	build_time		= 120.0,
	physics			= { solid_type = solid.none },
	
	max_builders	= 12,
	uiName			= "PvE_MainTurretTarget",
}

Def.Raid_EggsTrigger = {
	class				=	'Location',
	in_editor			=	true,
	physics				=	{ static = true, },
	box_dimensions 		= Vec3( 150.0, 150.0, 150.0 ),
}

Def.CucumberAura = 
{
	class 			= "ScBaseEntity",
	in_editor		= false,
	model 			= "models/misc/invisible_model",
	
	physics			= { solid_type = solid.none },
	damageable		= false,
	
	vision_always 	= true,
	
	network_sync	= true,
	
	uiName 			= "CucumberAura",
}

Def.PvE_Gen_Knock =
{
    class = "AuraHolderEntity",
    in_editor = true,
    spell_on_spawn  = "KnockSpell",
	uiName 			= "PvE_Gen_Knock",
}

Def.Blastwave_MineRaidExplode =   --   Если в SECONDARY_WEAPON установлен модуль RocketLauncher и в качестве боеприпасов используются ракеты (Rocket), то порождается blastwave из ракет. Если blastwave отсутствует или установлен другой модуль, то порождается blastwave, прописанный в поле explosion_blast_wave спелла.
{
	class				= "BlastWave",
	in_editor			= false,
	damage_thermal		= 15000, -- работает из модуля
	blast_maxDistance	= 35,
	apply_damage		= true,
	apply_shake 		= true,
	effect 				= "particles/explosions/big_fire_2",
	light_color 		= "255 230 80 100",
	light_radius 		= 30,
	light_time 			= 0.5,
	sound 				= "sound/explosion/small_rocket_expl",
}

-- Деф для индикатора старта гонок в ОМ
Def.OW_Test_Start_Hologram =
{
	class				= "ScBaseEntity",	
	model				=	"models/objects/gameplay/bombball/bombball_hologram",
	--effect			= "particles/other/prec_black_hole_2",
	physics				=	{ solid_type = solid.none, static = true, },
	full_activate_revive = true,	
	hudType			= "loot_crate", --default
	--hudType			= "minor", --
	--hud_visibility_type = "",	--"major",
	hud_ico			= "alien_megabomb_icon",
	vision_always = true,
	relationship_group = ai.RelationshipGroups.Alien,
	uiName 			= "ow_Ride_StartPoint",
}

Def.OW_Ride_Portal =
{
	inherit			= "PvE_Gen_Portal", 
	--model 				= "models/misc/invisible_model",
	model 			= "models/objects/jump_gates/portal/portal_race",
	--model 				= "models/objects/jump_gates/portal/portal",
	children = 
	{
		{ effect	= "particles/jumpgates/portal_race", },
	},
	--setActivityonCreate	= "ACTIVE", -- поддерживается только в скрипте
	uiName 			= "ow_Ride_Portal",
	vision_always 		= true,
	hud_ico				= "hud_police_icon",
	hudType				= "default",
}

Def.OW_Alien_Portal =
{
	inherit			= "PvE_Gen_Portal",
	effect			= ai.DONT_INHERIT,
	children		= ai.DONT_INHERIT, --{ [1]={}},
	model 			= "models/shields/portal",
	uiName 			= "ow_Alien_Portal",
}

Def.TestOWAuraHolderEnemy =
{
	class				= "AuraHolderEntity",
	in_editor			= false,
	damageable			= true,
	relationship_group 	= ai.RelationshipGroups.Alien,
	health 				= 1750,
	--model				= "models/objects/gameplay/bombball/bombball_orbit",
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	--physics			= { solid_type = solid.box, kinematic = true, hitbox = true,  material = "Metal", mass = 1000, },
	hudType 			= "default",

	uiName 				= "Module_SpyBeaconAnalyse",
	uiDesc 				= "Module_SpyBeacon_Desc",

	death_effect		= "particles/explosions/big_fire_2",
	death_sound			= "sound/explosion/drone_expl",
}

Def.Module_HealEntity =
{
	class 			= "ActiveModule",
	in_editor 		= false,
	model 			= "",
	cooldown		= 35,
	energy_cost		= 10,

	spell		= "Spell_HealEntity",

	activate_sound 	= "sound/gadgets/common_activate",
}

Def.HealEntityHolder = 
{
	class				= "AuraHolderEntity",
	damageable			= true,
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
	health				= 3000,
	hudType				= "default",
	in_editor			= false,
	physics				= { damping = 0.4, mass = 1000, material = "ShipMetalMk3", rot_damping = 0.4, solid_type = 4, },
	uiName				= "HealEntityHolder_name",
	
	model				= "models/objects/gameplay/bonuses/crystal_armor_restore",	
	children = 
	{
		{ effect = "particles/objects/bonuses/alien_armor_restore", joint = "main" },
	}
	
}

Def.Projectile_PlasmagunEnergy_Alien_Round_Slow =
{
	inherit				= "Projectile_PlatformPlasmaGunShortRange",
}

Def.Weapon_PlasmagunEnergy_Alien_Round_Slow =
{
	inherit				= "Weapon_PlasmagunEnergy_Mob_Round_Slow",
	storeItemId			= 0,
	cant_be_bought		= true,
	in_editor			= false,
	
	model 				= "",
	
	projectile			= "Projectile_PlasmagunEnergy_Alien_Round_Slow",
	
	shot_effect 			= "particles/weapons/alien/heatinggun_muzzle",
	muzzleflash_color = { kinetic = "130 255 172 48", emp = "130 255 172 48", thermal = "130 255 172 48", },

	shot_once_sound		= "sound/weapons/plasmagun/basic",
	
	uiName = "AlienGun",
}

Def.Projectile_Vortex_Alien =
{
	inherit				= "Projectile_Vortex",

	model				= "",

	explosion_blast_wave = "Blastwave_Vortex_Alien",

	flare_color			= "130 255 172 10",
	effect 				= "particles/weapons/alien/alien_vortex_projectile",
}

Def.Blastwave_Vortex_Alien =
{
	inherit				= "Blastwave_Vortex",

	effect 				= "particles/weapons/alien/alien_vortex_hit",
	light_color 		= "130 255 172 100",
}

Def.Module_Vortex_Alien_T3 =
{
	inherit			= "Module_Vortex_Mob_T3",
	storeItemId		= 0,
	cant_be_bought	= true,
	in_editor		= false,
	
	model 				= "",
	
	projectile 			= "Projectile_Vortex_Alien",
	shot_once_sound 	= "",
}

Spell.PrometheusPot_Ailen =
{
	inherit			= "PrometheusPot",
	
	aura_holder_def	= "PrometheusPot_Alien",

	period_fx			= "particles/gadget/pulsars/pulsar_alien_hit",
	--period_my_fx		= "particles/gadget/pulsars/pulsar_alien_hit",
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_alien_beam",
}

Def.PrometheusPot_Alien =
{
	inherit				= "PrometheusPot",
	
	model				= "particles/models/green_beacon",
	death_effect		= "particles/explosions/shp_exp_small_02",
}

Def.Module_PrometheusPot_Alien_T3 =
{
	inherit			= "Module_PrometheusPot_Mob_T3",
	storeItemId		= 0,
	cant_be_bought	= true,
	in_editor		= false,
	
	model 			= "",
	
	spell			= "PrometheusPot_Ailen",
}

Def.Projectile_NukeAlien =
{
	inherit					= "SpaceMissile_Nuke_T3_Mk1",
	storeItemId				= 0,
	cant_be_bought			= true,
	in_editor				= false,
	
	model					= "",
	
	explosion_blast_wave	= "BlastWave_NukeAlien",
	spell					= "NukeAlien",
	
	flare_color				= "130 255 172 10",
	effect 					= "particles/explosions/alien_nuke_projectile",
}

Def.BlastWave_NukeAlien =
{
	inherit				= "BlastWave_SM_Nuke_T3_Mk1",
	
	effect 				= "particles/explosions/alien_nuke",
	light_color = "154 225 154 255",
	light_radius = 300,
	light_time = 2.0,
}

Spell.NukeAlien =
{
	inherit				= "SpaceMissile_Nuke_T3_Mk1_spl",
	
	aura_fx				= "particles/gadget/suicide_aura_green",
	aura_sound 			= "sound/aura/voidzone",
	
	model 				= "",
}

Def.Module_RocketLauncher_Alien =
{
	inherit				= "Module_RocketLauncher_Mob",
	storeItemId			= 0,
	cant_be_bought		= true,
	in_editor			= false,
	
	model 				= "",
	projectile			= "Projectile_NukeAlien",
	
	shot_once_sound 	= "",
}

Def.Module_PirateEvent_shield =
{
	inherit				= "Module_UniqueHardShield_T5_Base",
	cant_be_bought		= true,
	module_type			= ai.ModuleType.ACTIVE,
	storeItemId			= 0,
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 225,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 425,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
}

--[[ Def.Weapon_PirateEvent_ChargedBlast = 
{
	inherit				= "Weapon_ChargedBlast",
	optimal_range			= 450,
	max_range				= 450 * 1.3,
	
	projectile_speed 		= 80,
	
	damage_thermal			= 700,
	charge_levels = {
		{
			time = 0,
			projectile = "Projectile_ChargedBlast_Big",
			speed_mul = 0,
			damage_mul = 0,
			heat_add_mul = 0,
		},
		{
			time = 2,
			projectile = "Projectile_ChargedBlast_Big",
			speed_mul = 1,
			damage_mul = 0.8,
			heat_add_mul = 1,
			--force_prediction = true,
		},
		{
			time = 3,
			projectile = "Projectile_ChargedBlast_Big",
			speed_mul = 2.2,
			damage_mul = 2,
			heat_add_mul = 2,
			force_charge_crosshair_max = true,
		},
		ai.DONT_INHERIT, 
	},
		
} ]]


Def.Weapon_PirateEvent_ChargedBlast =  
{
	inherit 				= "Weapon_Base",
	class 					= "ChargableGun",
	model					= "models/weapons/charged_blast/charged_blast",

	fire_rate 				= 60,
	dispersion				= 0,
	
	optimal_range			= 450,
	max_range				= 450 * 1.3,
	
	projectile_speed 		= 80,
	
	damage_thermal			= 450,
	
	shot_loop_sound 		= "sound/weapons/chargeblast/cb_charge",

	heat_max 				= 100,
	heat_add 				= 10,
	heat_sub 				= 25,
	overheat_time			= 5,
	
	use_charge_crosshair	= true,
	ignore_fire_rate_mods	= true,
	
	uiName					= "itemSubType_ChargedBlast",

	charge_levels = {
		{
			time = 0,
			projectile = "Projectile_ChargedBlast_Big",
			speed_mul = 0,
			damage_mul = 0,
			heat_add_mul = 0,
		},
		{
			time = 2,
			projectile = "Projectile_ChargedBlast_Big",
			speed_mul = 1,
			damage_mul = 0.8,
			heat_add_mul = 1,
			--force_prediction = true,
		},
		{
			time = 3,
			projectile = "Projectile_ChargedBlast_Big",
			speed_mul = 2.2,
			damage_mul = 2,
			heat_add_mul = 2,
			force_charge_crosshair_max = true,
		},
--[[ 		{
			time = 4,
			projectile = "Projectile_ChargedBlast_Self",
			speed_mul = -100,
			damage_mul = 2.5,
			heat_add_mul = 6,
		}, ]]
	},

	shot_beam_fx 		= "particles/weapons/chargedblast_beam",
	shot_effect 		= "particles/weapons/chargedblast_muzzle",
	charge_effect 		= "particles/weapons/chargedblast_guncharge",
	muzzleflash_color = { kinetic = "250 170 150 128", emp = "250 170 150 128", thermal = "250 170 150 128", },
	muzzleflash_radius 	= 32,
}


Def.Module_Pulsar_PirateEvent =
{
	class					= "ActiveModule",
	module_type 			= ai.ModuleType.ACTIVE, 
	
	--inherit					= "Module_SmartBomb_T4_Mk1",
	cooldown 				= 30,
	energy_cost				= 110,
	trigger_aura			= true,

	spell					= "SmartBomb_T5_Epic",
	--storeItemId				= 0,
	item_subtype			= ItemSubtype.SmartBomb,
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 100,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 100,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
	
	uiName					= "Module_SmartBomb",
}

-- чарж в рандомный бок с радарной невидимостью
Def.Module_PirateEvent_Dash =  
{
	inherit 				= "Module_ShieldRestoreLarge_T5_Epic",
	cooldown				= 35,
	storeItemId				= 0,
	energy_cost				= 250,
	cant_be_bought			= false,
	spell					= "ScoutChameleonCommon", -- радарная невидимость 5 сек
	AIRules			= { 
		conditions	= 	{ -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.ArmorLessThen,
				param = 0.95,
			},
		},
		period = 2, -- частота проверки
		func = "DashLeftRight", -- функция переноса босса --BossRelocation
		--func_params = { range = 220, }, -- на 2 км от цели
		--debug = true,
	},	
}

-- выставляем "генератор луча"
Def.Module_PirateBoss_EntityRay =  
{
	inherit 		= "Module_EntityRay",
	
	-- пушка модуль на эсм
	signature		= ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 750000, --500
	health_regen 	= 750000 / 150,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 222000,
	model 			= "models/turret/huge_module_magnifer/magnifer",
	death_wreck  	= "Module_Wreck",
	--stop_barrels	= ai.BarrelsStopMode.ACTIVE,
	uiName			= "PirateBoss_EntityRay_name",
	
	cooldown		= 28, --Всегда больше суммарного времени работы спеллов (чтобы холдеры не спавнились друг в друге)
	energy_cost		= 1000,
	
	spell		 	= "Spell_PirateBossEntityRayPrepare",
	--Холдер    живет в спелле ссылка aura_holder_def			= "PirateBoss_EntityRayHolder",
	
	--additional_spell = "ProtectiveShield_T4_Rel", --testers arts
	additional_spell = "BossEvent_OnDeathEnemy", -- эффект неуязвимости, покойник лечит босса
	uiName			= "EntityRayHolder_name", -- дле дес лога
	item_subtype	= ItemSubtype.TachRay, -- для иконочек
	default_icon	= "ItemSubtype_TachRay",
	

	AIRules			= { 
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.DistMore,
				param = 120, 
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},			
			{
				condition_type = AICondition.DistLess,
				param = 800, 
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
		period = 3, -- частота проверки
		useTargetModule = true,
		--debug	= true,
	},
}

Def.Weapon_Mob_OrbGun = 
{
	inherit 		= "Weapon_OrbGun_T5_Rel",
	shot_effect 	= "particles/gadget/jericho_module_muzzle",
	shot_beam_fx 	= "particles/gadget/jericho_module_beam",
	fire_rate 		= 30,
	projectile 		= "Projectile_OrbofJeriho",
	storeItemId		= 0,
	cant_be_bought			= false,
}


Def.Module_Mob_DisableWeapon =  
{
	inherit 		= "Module_DisableWeapon",
	storeItemId		= 0,
	cooldown		= 10,
	spell			= "DisableWeapon_T2_Mk1",
	cant_be_bought			= false,
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 200,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 200,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
	uiName			= "itemSubType_DisableWeapon",
}

Def.Module_Mob_SpaceSqueezer =  
{
	inherit 		= "Module_SpaceSqueezer",
	storeItemId		= 0,
	cooldown		= 10,
	spell			= "SpaceSqueezer_T4_Rel",
	deactivate_spell= "SpaceSqueezer1",
	cant_be_bought			= false,
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 300,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 300,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
	uiName			= "itemSubType_SpaceSqueezer",
}

Def.Module_Mob_ShieldSuppressor =  
{
	inherit 		= "Module_ShieldSuppressor",
	storeItemId		= 0,
	cooldown		= 10,
	class_mask		= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 150,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 150,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
	uiName			= "Module_ShieldSuppressor",
}

Def.Module_Mob_TurretThermo1 =  
{
	inherit 		= "Module_TurretThermo_T3_Epic",
	health			= 8000,
	storeItemId		= 0,
	cooldown		= 10,
	spell_on_hit	= "TurretThermo_T3_Epic",
	class_mask		= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	cant_be_bought	= false,
	item_subtype	= ItemSubtype.RocketSilo, 
	
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 150,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 150,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
}

Def.Module_Mob_TurretThermo2 =  
{
	inherit 		= "Module_TurretThermo_T3_Epic",
	health			= 8000,
	storeItemId		= 0,
	cooldown		= 10,
	spell_on_hit	= "TurretThermo_T3_Epic",
	class_mask		= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	cant_be_bought	= false,
	item_subtype	= ItemSubtype.GravityAnomaly, 
	
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 150,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 150,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
}

Def.Module_Mob_TurretThermo3 =  
{
	inherit 		= "Module_TurretThermo_T3_Epic",
	health			= 8000,
	storeItemId		= 0,
	cooldown		= 10,
	spell_on_hit	= "TurretThermo_T3_Epic",
	class_mask		= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	cant_be_bought	= false,
	item_subtype	= ItemSubtype.PushRay, 
	
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 150,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 150,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
}

Def.Module_Mob_TurretThermo4 =  
{
	inherit 		= "Module_TurretThermo_T3_Epic",
	health			= 8000,
	storeItemId		= 0,
	cooldown		= 10,
	spell_on_hit	= "TurretThermo_T3_Epic",
	class_mask		= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	cant_be_bought	= false,
	item_subtype	= ItemSubtype.TurretThermo, 
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 150,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 150,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
}


Def.Module_Mob_EnergyShieldCommander =  
{
	inherit 		= "Module_EnergyShieldCommander_T5_Base",
	storeItemId		= 0,
	cooldown		= 20,
	class_mask		= ai.ShipClass.LARGE + ai.ShipClass.SMALL + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	cant_be_bought			= false,
	
	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 300,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 300,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},
}

Spell.Spell_PirateBossEntityRayPrepare =
{
	inherit					= "Spell_EntityRayPrepare",
	
	aura_holder_def			= "PirateBoss_EntityRayHolder",
	aura_holder_attach_bone	= "rocket_1",
	aura_holder_offset		= Vec3( 0, 0, -17 ),

	aura_range				= 850,
	aura_extra_radius		= 60,

	aura_param				= 350,
	duration 				= 6,
	period					= 0.5,
	isBuff					= false,
	hud_visible				= false,
	
	fixed_cylinder_target	= true,
	aura_target_offset		= Vec3( 0, 0, -50 ),

	work_beam_fx			= "particles/weapons/laser/tach_ray_big_1",
	ray_shot_sound	 			= "sound/aura/PirateBossRay_pre",
	aura_fx 				= "particles/weapons/laser/tach_ray_big_1_muzzle",
	
	holder_spell_in_the_end	= "Spell_PirateBossEntityRay",
	holder_spell_on_cancel	= "Spell_PirateBossEntityRay_Blast",
}

Spell.Spell_PirateBossEntityRay =
{
	inherit				= "Spell_EntityRay",

	aura_holder_def		= "PirateBoss_EntityRayHolderInvul",
	aura_holder_attach_bone	= "rocket_1",
	aura_holder_offset		= Vec3( 0, 0, -17 ),
	
	aura_range				= 850,
	aura_extra_radius		= 60,
	
	aura_param			= 5000,
	aura_param_add		= 50000,
	duration 			= 2,
	period				= 0.4,
	isBuff					= false,
	hud_visible				= false,
	
	fixed_cylinder_target	= true,
	aura_target_offset		= Vec3( 0, 0, -50 ),
	
	nebula 				= "Effects_Nebula_BossRay",
	work_beam_fx		= "particles/weapons/laser/tach_ray_big_2",
	aura_fx 			= "particles/weapons/laser/tach_ray_big_2_muzzle",
	ray_shot_sound		 	= "sound/aura/PirateBossRay_ray",
}

Spell.Spell_PirateBossEntityRay_Blast =
{
	inherit			= "Spell_EntityRay_Blast",
	
	aura_range 		= 40,
	aura_param		= 125000, --10000
	duration		= 1,
	period			= 0.5,
	
	isBuff			= false,
	hud_visible		= false,
	
	cast_position_fx = "particles/explosions/explosion_big4",
	aura_fx					= ai.DONT_INHERIT,
	period_module_fx		= ai.DONT_INHERIT,
	period_module_my_fx		= ai.DONT_INHERIT,
	
	cast_sound = "sound/explosion/big_rocket_expl",
}

Def.PirateBoss_EntityRayHolder = 
{
	inherit				= "EntityRayHolder",
	model				= "models/turret/huge_module_drone/dron",
	health				= 25000,
	uiName				= "EntityRayHolder_name",
}

Def.PirateBoss_EntityRayHolderInvul = 
{
	inherit				= "PirateBoss_EntityRayHolder",
	damageable			= false,
}

Def.Module_SectorShield_PVE = {
	inherit 		= "Module_SectorShield",
	cooldown		= 25,
}

Def.DestrMunition_HealBot_Boss =  
{
	inherit 		= "DestrMunition_HealBot_T5_Mk3",
	storeItemId		= 0,
	active_aura		= "DestrMunition_HealBot_Boss_spl", --"DestrMunition_HealBot_T5_Mk3_spl"
}

Def.Module_Mob_SectorShield_Prec =
{
	class								= "ScBaseEntity",
	module_type							= ai.ModuleType.MUNITION,

	ttl									= 18,
	
	in_editor							= false,
	hack_immune 						= true,
	model								= "models/shields/shield_r5_h",
	physics								= { solid_type = solid.model, material = "GiantShield", mass = 100, static_collision = false},
	children =
	{
		{ effect						= "particles/gadget/swarm_shield_start" },
		{ def							= "SwarmShield" },
	},
	death_effect						= "particles/gadget/swarm_shield_end",
	end_effect							= "particles/gadget/swarm_shield_end",
	weapon_mode							= ai.ShieldWeaponMode.BLOCK_ENEMY,
	radar_vison							= ai.ShieldRadarVisionMode.BLOCK_ENEMY,
	
	item_subtype						= ItemSubtype.SectorShieldPrec,
	

	AIRules			= { 
		conditions	= { -- что проверяем
			{
				condition_type = AICondition.DistLess,
				param = 300,
				target = {   -- кого проверяем 
					class 			= ai.SpellTargetClass.SHIP,
					relationship	= ai.SpellTargetRelationship.ENEMY,
					range			= 300,
					-- AROUND
				},					
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		--debug	= true,
	},	
	
}

-- модуль босса пиратов про Dash назад + невидимость
Def.Module_PirateBoss_ReverseDash =  
{
	--inherit 		= "Module_AdaptiveBigShieldBoost",
	class 			= "ActiveModule",
	
	-- пушка модуль на эсм
	signature		= ai.Signature.TINY,
	physics 		= {	mass = 500, material = "ShipMetalMk3", solid_type = solid.model },
	damageable 		= true,
	health 			= 450000, --500
	health_regen 	= 450000 / 50,  --2.3.5.4 модуль начинает восстанавливаться - health_regen в секунду. Но остается в состоянии "мертвый" пока не восстановится полное health.
	damage_to_host 	= 150000,
	model 			= "models/turret/huge_module_shield_gen/shield_gen",
	death_wreck  	= "Module_Wreck",
	--stop_barrels	= ai.BarrelsStopMode.ACTIVE,
	uiName			= "itemSubType_MicroWarpDamage",
	
	ignore_silence	= true,
	
	cooldown				= 150,
	energy_cost				= 0,
	
	spell		 			= "DodgeDrive_back_Mob", -- рывок назад
	additional_spell		= "SaveBack_Invisibe",   -- 3 сек невидимость
	
	AIRules			= { 
		conditions	= { -- что проверяем
			--conditions_and = true,
			{
				condition_type = AICondition.DistLess,
				param = 150, 
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},
			--{
			--	condition_type = AICondition.VisibleTarget, -- трейслайнится
			--	target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			--},
			{
				condition_type = AICondition.EnergyLessThen, 
				param = 0.1,
			},
		},
		period = 3, -- частота проверки
		--useTargetModule = true,
		debug	= true,
	},
}

Def.Module_PirateBoss_RocketSilo = 
{
	inherit 				= "Module_RocketSilo_T4_Epic", --+
	storeItemId				= 0,
	cant_be_bought			= false,
	class_mask				= ai.ShipClass.SMALL + ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.HUGE,
	required_role			= nil,
	no_friendly_fire 		= true,
	
	cooldown				= 40,	
	energy_cost				= 1480,
	max_range				= 900,	
	ammo 					= 16,
	fire_rate 				= 90,
	--damage_thermal			= 22000,  --  не работает, в бластвейве
	max_projectiles_per_target = 2,
	health 					= 500000,
	health_regen 			= 500000 / 120,
	damage_to_host			= 222000,
	target_cone_angle 		= 160,
	dispersion				= 120,   -- Это пишется в тултипе      --до  #68720   было   25


	projectile 				= "PirateBoss_VolleyGuidedRocket",

	spell_on_hit 			= "TestAntiHUGE",
	
	shot_effect = "particles/weapons/artillery_big_muzzle",

	AIRules		= { 
		conditions	= { -- что проверяем
			conditions_and = true,
			{
				condition_type = AICondition.DistLess,
				param = 850, 
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
			},
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
			},
		},
		period = 6, -- частота проверки
	},		
}

Def.PirateBoss_VolleyGuidedRocket =
{
	inherit 					= "Weapon_BaseRocket",
	--class						= "ClanShipTorpedo",
	model						= "models/weapons/bs_torpedo",	
	--model						= "models/objects/ships_huge/prec_destroyer/prec_orpedo",
	--physics						= { solid_type = solid.sphere, kinematic = true, material = "ShipMetalMk3", mass = 10000, hitbox = true, sphere_radius = 8, },
	physics						= { solid_type = solid.model , kinematic = true, material = "ShipMetalMk3", mass = 10000, hitbox = true, },
	signature					= ai.Signature.TINY,
	
	is_guided					= true,
	random_trajectory			= true,
	use_pathfinder 				= true,
	angular_velocity			= 75*0.66,
	damageable					= true,
	health						= 1000,
	speed						= 50*0.66,
	
	max_range					= 900,
	time_to_live				= 15,
	
--	missile_defence_immune		= true,
	missile_detection_immune	= false,
	
--	hud_visibility_type			= "normal", -- "major",
	--hudType						= "default",	
	uiName 						= "itemSubType_Torpedo",
	
	--spell_on_spawn				= "Spell_CruiserTorpedo_RW",
	
	explosion_blast_wave		= "BlastWave_PirateBoss_VolleyGuidedRocket",
	detonation_radius			= 2.0,
	flare_color					= "0 0 0 0",
	flare_size					= 0.01,
	flare_angle					= 10,
	
--	launch_sound		 		= "sound/raid/boss_rocket_launch",
	launch_sound		 		= "sound/raid/boss_torpedo_launch",
--	work_sound					= "sound/dreadnought/torpedo_engine",
	work_sound					= "sound/raid/boss_rocket_fly",
	
	death_effect				= "",
	effect						= "particles/weapons/torpedo/torpedo_tail_2",
--	points_reward_assist_damage = 80,
}

Def.BlastWave_PirateBoss_VolleyGuidedRocket = 
{
	class						= "BlastWave",
	intensity					= 200,
	damage_kinetic				= 50000,--15000,	--#64168
	blast_maxDistance			= 25,
	blast_minDistance			= 2,

	effect = "particles/explosions/explosion_big4",
	light_color = "255 100 0 100",
	light_radius = 20,
	light_time = 0.8,
	sound = "sound/explosion/big_rocket_expl",
	
	in_editor					= false,
	apply_damage				= true,
	parent_prototype			= "SpaceMissile_Nuke_T5_Mk3",
}

Def.Ship_Wave_Easy_Elite_Cargoship = 
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
	acceleration = 3.5,
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
	rot_xmaxspeed = 10,
	rot_ymaxspeed = 10,
	rot_zmaxspeed = 26,
	rotaccel_x0 = 5,
	rotaccel_x1 = 2,
	rotaccel_y0 = 5,
	rotaccel_y1 = 2,
	rotaccel_z0 = 5,
	rotaccel_z1 = 5,
	rotdecel_x = 60,
	rotdecel_y = 60,
	rotdecel_z = 600,

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
		
		{	def = "Turret_Gen_Cargoship_Silo", joint = "gun_1",	},
		{	def = "Turret_Gen_Cargoship_Silo", joint = "gun_2",	},
		{	def = "Turret_Gen_Cargoship_Silo", joint = "gun_3",	},
		{	def = "Turret_Gen_Cargoship_Silo", joint = "gun_4",	},
	},
	contact_damage_cf = 160,
	contact_damage_min_speed = 3,

	death_blast_wave = "LargeShipExplodeBlastWave",
	death_effect	= "particles/explosions/objects/explosion_big",
	death_sound		= "sound/explosion/cargoship_expl",
	work_sound      = "sound/engine/cargoship_loop",
	--death_wreck = "CargoShipWreck",
	debris_remove_delay = 4,

	slot_bones = 
	{
	--	[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "root",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ] = "root",
	},
	default_modules = {
	--	[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Railgun_Basic_Meat_T4",
	},
	
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



Def.PvE_Gen_MainGateBlocker = 
{
	class				= "ScBaseEntity",
	in_editor			= true,
	damageable			= true,
	pve_scale_power	 	= true,
	maxViewDist			= 5000,
	health 				= 170000,
	special_object  	= true,
	hudType				= "default",
	hud_visibility_type = "major",
	
	model			= "mapskit/maps/models/bigship/power_block2_big", 
	physics				= { solid_type = solid.model, static = true, material = "Metal" },

	death_effect		= "particles/explosions/objects/explosion_big",
	death_sound			= "sound/explosion/ship_expl",
	broken_parts = 
	{
		[ 1 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 10, 3, 23 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 2 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( -6, 3, -21 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
		[ 3 ] = { effect = "particles/explosions/objects/explosion_big",  angle = 360, pos = Vec3( 0, 3, 3 ), dumping = 1.0, speed = 0.0, speed_deviation = 0, speed_inherit = 0, ttl = 10, },
	},

	points_reward_kill 	= 50,
	points_reward_assist_damage = 350,

	vision_always 		= true,
	relationship_group 	= 2,
	hack_immune		= true,
	
	uiName 				= "PvE_Gen_MainGateBlocker_name",
} 

Def.PvE_Gen_SignalBlocker = 
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	model			= "mapskit/maps/models/bigship/shield_generator2", 
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	health 			= 50000,
	damageable			= true,
	special_object  = true,
	hudType			= "default",
	hud_visibility_type = "major",
	maxViewDist		= 5000,
	death_effect	= "particles/explosions/objects/explosion_big",	--#87192
	death_sound			= "sound/explosion/ship_expl",
	work_sound	 = "sound/ambient/prison_generator",
	children = 
	{
		{ effect = "particles/areal/shield_generator2", joint = "root" },
	},
	
	points_reward_kill = 50,
	points_reward_assist_damage = 350,

	vision_always = true,
	relationship_group = 2,
	hack_immune		= true,
	
	uiName = "PvE_Gen_SignalBlocker_name",
}

Def.Turret_Gen_Cargoship_Silo =
{
	inherit 		= "Turret_RailGun",
	class 			= "Turret",
	in_editor		= false,
	model			= "models/turret/huge_module_martair/martair", 

	relationship_group = 2,

	physics			= { solid_type = solid.sphere, sphere_radius = 10, material = "Metal", static = false, },
	health 			= 5000,
	damageable		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	
	fire_rate		= 60.0,
	dispersion		= 0.0, -- deg
	optimal_range	= 200,
	max_range		= 500,
	projectile_speed = 70,
	
	damage_kinetic	= 0,
	damage_emp		= 300,
	damage_thermal	= 0,
	projectile		= "Projectile_TurretPlasma",
	
	max_rot_speed	= 90,	-- deg per second

	shot_effect 	= "particles/weapons/plasma/muzzle_turret",

	death_effect	= "particles/explosions/objects/explosion_tiny",
	
	uiName = "Turret_RailGun_name",
}

Def.Movement_PvEAsteroid =
{
	class 			= "CargoShip",
	model			= "models/objects/ships_huge/freighter_imper/freighter_imper",
	object_tag 		= ai.ObjectTag.TRANSPORT,
	start_deactivated = true,
	uiName			= "CargoShip",
	damageable		= false,
	relationship_group = 1,
	hudType 		= "default",
	signature		= ai.Signature.HUGE,
	
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "ShipMetalMk3", mass = 1000000, },

	maxViewDist		= 3000,
	max_lin_speed		= 35,
	
	death_wreck		= "CargoShipWreck",

	children =
	{
		{	def = "Engine_empire_xxl", joint = "exhaust_1",	},
		{	def = "Engine_empire_xl", joint = "exhaust_2",	},
		{	def = "Engine_empire_xl", joint = "exhaust_3",	},
		{	def = "Engine_empire_l",	joint = "exhaust_4",	},
		{	def = "Engine_empire_l",	joint = "exhaust_5",	},
	},
	warp_in_sound	= "sound/raid/big_enemy_warp",
	work_sound      = "sound/engine/cargoship_loop",	
	trail_effect = "particles/ships/ship_trail",
	trail_size = 0.1,
	trail_color = "5 17 197 100",
	death_effect	= "particles/explosions/objects/explosion_big",
	death_sound		= "sound/explosion/cargoship_expl",
}

Def.PvE_Gen_VitalGenerator =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "OpenWorld_QuestEmpire_s2d",
	health			= 5000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 20.0,
	regen_max_ally	= 1,
	decay_damage	= 100,
	decay_max_enemy = 1,
	
	vision_always = true,
}

Def.PvE_Gen_VitalGenerator2 =
{
	inherit			= "VitalPoint_Captureable",
	in_editor		= true,
	model			= "models/objects/vital_point/control_station/control_station",
	physics			= { solid_type = solid.compound_model, static = true, material = "Metal" },
	vision_radius_with_drones = 300,
	vision_radius_without_drones  = 200,
	uiName			= "VitalPoint",
	health			= 5000,
	gameplay_idx	= 0,
	relationship_group = 2,
	regen_speed		= 20.0,
	regen_max_ally	= 1,
	decay_damage	= 100,
	decay_max_enemy = 1,
	
	vision_always = true,
}

Def.PvE_Gen_DreadOpening =
{
	class				= "ScBaseEntity",	
	model 				= "models/misc/invisible_model",
	
	physics				= { solid_type = solid.none },
	in_editor			= true,
	damageable			= false,
	maxViewDist 		= 999999,
	special_object  	= true,
	vision_always 		= true,
	relationship_group 	= 2,
	effect				= "particles/areal/huge_stuff/dread_warp",
	uiName 				= "reider_portal",	
	ttl 				= 3, -- работает
}

Def.Module_ShelterField_Mob_Mk1 =
{
	inherit 		= "Module_ShelterField_T5_Mk1",
	storeItemId		= 0,
	spell			= "Spell_ShelterField_friendlyPart_mob",
}

Def.Module_ShelterField_Mob_Epic =
{
	inherit 		= "Module_ShelterField_T5_Epic",
	storeItemId		= 0,
	spell			= "Spell_ShelterField_friendlyPart_mob",
}

Def.Weapon_LaserGunDreadTest =
{
	inherit = "Weapon_LaserGun",
 	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	

	relationship_group = ai.RelationshipGroups.Hostile1,
	--model = "models/weapons/lasers/power/l_training",
	
	fire_rate = 60,
	impulse_time = 1,
	dispersion = 0,
	
	optimal_range = 99999,
	max_range = 99999,
	
	damage_thermal = 500,

	shot_loop_sound = "sound/weapons/ColdRay/cd_start_loop",
	hit_loop_sound = "sound/hit/laser_loop",
	
	uiName = "CruiserAlien_Turret_name",
	
	beam_fx = "particles/weapons/laser/alien_beam_big",
	hit_fx = "particles/weapons/laser/alien_hit_big",
	
	network_sync = true,
	
	barrel_rot_speed = 10000,
	barrel_rot_speed_fire = 20,
	no_friendly_fire = false,
	is_standalone_module = true, -- SC-111922
}	

-- ---------------------------------------------------------------------------------------------------
-- ------------------------------------СТЕЛС ПВЕ БОСС МОДУЛИ------------------------------------------
-- ---------------------------------------------------------------------------------------------------




Def.Module_Stelth_PVE_Boss_shield =
{
	class 		= "SpaceShipModule",
	in_editor	= false,
	cooldown	= 2000,
	item_subtype	= ItemSubtype.Stelth_PVE_Boss_shield,
	shield_disabled_spell = "Stelth_PVE_Boss_shield",
	activate_sound = "sound/gadgets/EmergencyBarrier",
	--storeItemId				= 0,
	default_icon	= "itemSubType_ExtremeShieldCharge",

}

Def.Stealth_PVE_Boss_shield_holder =
{
	class				= "AuraHolderEntity", --"AuraHolderEntity",
	damageable			= true,
	hack_immune			= true,
	in_editor			= false,
	
	health 		= 999999999,
	damageable	= true,
	
	model 		= "models/weapons/drones/healbot/healbot",
	uiName				= "EntityRayHolder_name",
	
}

Def.Module_Stelth_PVE_Boss_Execut =
{
	class 		= "SpaceShipModule",
	in_editor	= false,
	cooldown	= 2000,
	emergency_barrier_spell = "Stelth_PVE_Boss_Execut",
	activate_sound = "sound/gadgets/EmergencyBarrier",
	item_subtype	= ItemSubtype.Stelth_PVE_Boss_Execut,
	default_icon	= "itemSubType_DeimosFace",
	
}



---------------------Тестовый модуль для эффектов
Def.Module_Shield_On = 
{

		class 					= "ActiveModule",
		in_editor 				= false,
		model 					= "models/weapons/plasma/power/vortex",
		cooldown				= 30,
		energy_cost				= 10,
		item_subtype	= ItemSubtype.Stelth_PVE_Boss_shield,

		spell 					= "Stelth_PVE_Boss_shield",

}

Def.Module_Shield_Off = 
{

		class 					= "ActiveModule",
		in_editor 				= false,
		model 					= "models/weapons/plasma/power/vortex",
		cooldown				= 30,
		energy_cost				= 10,
		

		spell 					= "Stelth_PVE_Boss_Execut",

}





------------------ПУШКА
Def.Weapon_GazGun_StelshBoss = 
{
	inherit = "Weapon_Base",
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.ENGINEER,
	required_ship	= "Ship_Race1_L_T5_Thrasher",
	projectile_speed 	= 200,
	damage_emp			= 200*10,
	
	class 				= "SingularityCannon",
	model="models/weapons/wolfhound_gun/wolfhound_gun",
	module_type = ai.ModuleType.WEAPON,
	item_subtype			= ItemSubtype.MagneticGun,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,

	weapon_class			= ai.WeaponClass.PLASMAGUN,
	fire_rate 			= 10,
	dispersion			= 2.5,
	
	optimal_range		= 300,
	max_range			= 300,

	
	heat_max 			= 10,
	heat_add 			= 2,
	heat_sub 			= 3,
	overheat_time		= 2,
	
	projectile			= "Projectile_GazGun",
	shot_once_sound 	= "sound/weapons/singularity/sg_shot",

	shot_beam_fx 		= "particles/gadget/special/doctor_debuff_beam",
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_FlameThrower", }, },
	default_icon	= "ItemSubtype_WeaknessScoutPlasma",
	uiName			= "Weapon_GazGun",
	
	
}


Def.Projectile_GazGun =
{
	class			= "SingularityProjectile",
	in_editor		= false,

	hitbox_min 		= Vec3( -0.9, -0.9, -0.9 ),
	hitbox_max		= Vec3( 0.9, 0.9, 0.9 ),
	damage_radius	= 6,
	impact_type 	= "singularity",
	
	hit_effect		= "particles/weapons/plasma/hit",
	work_sound 	    = "sound/weapons/singularity/sg_fly",

	effect 			= "particles/weapons/big/plasma_slow_2",
	
	singularity_hit_fx = "particles/weapons/other/fire_emp_hit",
	singularity_hit_sound = "sound/hit/singularity_ship",
	spell_on_launch	= "Spell_StormGun_Cast",

	hit_effect = "particles/weapons/other/fire_emp_hit",

}



-- ---------------------------------------------------------------------------------------------------
-- ------------------------------------СТЕЛС ПВЕ БОСС СПЕЛЛЫ------------------------------------------
-- ---------------------------------------------------------------------------------------------------



Spell.Stelth_PVE_Boss_shield =  

{
	
		
			target					= ai.SpellTarget.CASTER_POSITION_CASTER,
			aura 					= ai.Aura.DAMAGE_EMP_PERIODIC,
			aura_target = 
			{
			class  = ai.SpellTargetClass.SHIP --корабли
				+ ai.SpellTargetClass.TURRET  --турели
				+ ai.SpellTargetClass.CARGOSHIP --каргошипы
				+ ai.SpellTargetClass.TORPEDO --вроде как торпеды в бзс
				+ ai.SpellTargetClass.GUIDED_DRONE --дроны
				+ ai.SpellTargetClass.BATTLE_STATION, -- боевые станции
			area	= ai.SpellTargetArea.IN_CYLINDER,
			relationship = ai.SpellTargetRelationship.ENEMY
			+ ai.SpellTargetRelationship.NEUTRAL,
			},
			 aura_holder_def			= "Stealth_PVE_Boss_shield_holder",
			 aura_holder_attach_bone	= "root",
			 aura_holder_offset		= Vec3( 0, 0, -1 ),

			aura_range				= 3, --длина луча х10м
			aura_extra_radius		= 280, --радиус луча х10м

			aura_param				= 2000,
			duration 				= 2000,
			period					= 0.2,
			isBuff					= false,
			hud_visible				= true,
			
			fixed_cylinder_target	= false,
			aura_target_offset		= Vec3( 0, -1, 0 ), --направление луча
			
			--nebula 			= "Effects_Nebula_TachRay",
			
			aura_fx	= "particles/gadget/huge/boss_disc",
			ray_shot_sound	 			= "sound/aura/PirateBossRay_pre",
			
			ui_ico = { target_system 	= { tex = "ItemSubtype_BubbleGun", }, },
	additional_auras =
	{
		{
				target					= ai.SpellTarget.CASTER,
				aura 					= ai.Aura.SHIELD_REGEN_MOD,
				aura_target 			= ai.SpellTarget.CASTER,
				aura_param				= -10001,
				duration				= 2000,
				
				ui_ico = { target_system 	= { tex = "ItemSubtype_BubbleGun", }, },

		}
	}

}



Spell.Stelth_PVE_Boss_Execut = 
{
	influence 					= ai.Spell.CAST_SPELLS,
	--target 						= ai.SpellTarget.CASTER,
	spells 						= {'Stelth_PVE_Boss_Execut_clean', 'Stelth_PVE_Boss_Execut_Stop', 'Stelth_PVE_Boss_Execut_KillShield', 'Stelth_PVE_Boss_Execut2'  },
	
}

Spell.Stelth_PVE_Boss_Execut_clean = 
{
	influence					=	ai.Spell.DISPELL,
	target						=	ai.SpellTarget.CASTER,
	itemSubTypes				=	{ ItemSubtype.Stelth_PVE_Boss_shield },
		
}

Spell.Stelth_PVE_Boss_Execut_KillShield =
{
	influence = ai.Spell.DESTROY,
	target =
		{
			class 				= ai.SpellTargetClass.OWNED_BY_SHIP,
			area				= ai.SpellTargetArea.AROUND,
		--	relationship		= ai.SpellTargetRelationship.ALLY,
		},
	target_range = 2000,
	isBuff = true,
	ui_ico = { target_system 	= { tex = "ItemSubtype_BubbleGun", }, },
}

Spell.Stelth_PVE_Boss_Execut_Stop =
{
	influence				= ai.Spell.APPLY_AURA,
	target					= ai.SpellTarget.CASTER,
	aura 					= ai.Aura.SLOW_MOVEMENT,
	aura_param				= 30,
	duration				= 2000,
	ui_ico = { target_system 	= { tex = "ItemSubtype_BubbleGun", }, },
}



Spell.Stelth_PVE_Boss_Execut2 =
{
	target					= ai.SpellTarget.CASTER, --_POSITION_CASTER,
	aura 					= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target = 
	{		
		class = ai.SpellTargetRelationship.ALLY 
			  + ai.SpellTargetRelationship.ENEMY,
		area = ai.SpellTargetArea.AROUND,
		misc = ai.SpellTargetMisc.EXCLUDE_CASTER,
	},
	aura_range				= 1000, 
	aura_param				= 800,
	duration 				= 2000,
	period					= 1,
	isBuff					= false,
	hud_visible				= false,
	
	
	period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
	period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",
	period_fx			= "particles/gadget/pulsars/pulsar_g2d2_hit",
	period_my_fx      = "particles/gadget/pulsars/pulsar_g2d2_hit",
	period_beam_fx 		= "particles/gadget/pulsars/pulsar_g2d2_beam",
	aura_fx				=	"particles/gadget/huge/boss_attraction",
	nebula	= "Effects_Nebula_BossAttraction",
	
	ui_ico = { target_system 	= { tex = "ItemSubtype_BubbleGun", }, },
	
	additional_auras = 
	{
		{
			target				= ai.SpellTarget.CASTER, --_POSITION_CASTER,
			aura 				= ai.Aura.SHIP_ATTRACTION,
			aura_target = 
			{		
				class = ai.SpellTargetRelationship.ALLY 
					  + ai.SpellTargetRelationship.ENEMY,
				area = ai.SpellTargetArea.AROUND,
				misc = ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
			aura_range				= 1000, 
			aura_param				= 40,
			duration 				= 2000,
			--period					= 1,
			isBuff					= false,
			hud_visible				= false,
			
			ui_ico = { target_system 	= { tex = "ItemSubtype_BubbleGun", }, },
		},
		
		{
			influence				= ai.Spell.APPLY_AURA,
			target					= ai.SpellTarget.CASTER,
			aura 					= ai.Aura.RESIST_ALL_DEC,
			--aura_target 			= ai.SpellTarget.CASTER,
			aura_param				= 35,
			duration				= 2000,
			
			ui_ico = { target_system 	= { tex = "ItemSubtype_BubbleGun", }, },
		},
		
		{
			target					= ai.SpellTarget.CASTER, --_POSITION_CASTER,
			aura 					= ai.Aura.DAMAGE_THERMAL_PERIODIC,
			aura_target = 
			{		
				class = ai.SpellTargetRelationship.ALLY 
					  + ai.SpellTargetRelationship.ENEMY,
				area = ai.SpellTargetArea.AROUND,
				misc = ai.SpellTargetMisc.EXCLUDE_CASTER,
			},
			aura_range				= 20, 
			aura_param				= 10000,
			duration 				= 2000,
			period					= 0.2,
			isBuff					= false,
			hud_visible				= false,
			
			ui_ico = { target_system 	= { tex = "ItemSubtype_BubbleGun", }, },

		},
		
	}
}



---------------------------------ПУШКА
Spell.Spell_StormGun_Cast =
{
	
	influence		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.INFLICTOR,

	aura 			= ai.Aura.CAST_SPELL_PERIODIC,
	target_spell	= "Spell_StormGun_Damage",
	duration		= 50,
	period			= 0.2,
	isBuff			= true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_FuelEmissionsScout" } },
}

Spell.Spell_StormGun_Damage =
{
	target 			= { target = ai.SpellTargetGeneral.INFLICTOR, misc = ai.SpellTargetMisc.POSITION },
	aura			= ai.Aura.DAMAGE_EMP_PERIODIC,
	aura_target		=
					{
						class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.GUIDED_DRONE,
						area			= ai.SpellTargetArea.AROUND,
						relationship	= ai.SpellTargetRelationship.ENEMY,
						
					},
	aura_range 		= 5,
	aura_range_add	= 16,
	aura_range_add_max = 50,
	aura_param		= 1500,
	aura_param_add	= -300,
	scale_on_weapon			= true,
	duration		= 3,
	period 			= 0.3,

	isBuff			= false,
	ui_ico 		= { target_system 	= { tex = "ItemSubtype_FuelEmissionsScout" } },
	
	nebula			= "Effects_Nebula_Emissions",
	cast_position_fx	= "particles/gadget/fueldrop_sphere",

}

-----------------Активка для босса


Def.Module_StelhPVEBoss_Rocket = --Основной модуль
{
	inherit 			= "Weapon_Base",
	in_editor			= false,
	model 				= "models/weapons/plasma/power/vortex",
	class				= "FiringModule",

	item_subtype	= ItemSubtype.StelhPVEBoss_Rocket,
	default_icon	= "itemSubType_Cruise",
	
	cooldown			= 50,
	energy_cost 		= 10.0,

	projectile 			= "Projectile_StelhPVEBoss_Rocket",
	
	projectile_speed 	= 200,  
	max_range			= 0,  
	track 				= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,

	dispersion			= 0,
	crit_chance			= 0,

	damage				= 0,
	damage_kinetic		= 2000,
	--damage_emp			= 3000,
	--damage_thermal		= 0,
	-- trigger_projectile	= true, --детонировать заряд при повторном нажатии модуля --#83218 теперь используется поле shoot_mode
	shoot_mode 			= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --#83218 теперь используется поле shoot_mode
	detonate_at_point 	= true,

	shot_once_sound 	= "sound/gadgets/Vortex/Vortex_fire",
	
	
	AIRules			= { 
		conditions	= 	
			{ -- что проверяем
				conditions_and = true,
				{
					condition_type = AICondition.DistMore,
					param = 5, 
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },
				},
				{
					condition_type = AICondition.VisibleTarget, -- трейслайнится
					target = { target = ai.SpellTargetGeneral.CONTEXT_TARGET },  -- цель преследуемая
				},
			},
		period = 2, -- частота проверки
		},		
	
	
}

Def.Projectile_StelhPVEBoss_Rocket = --нулевая ракета. из нее разлетаются остальные
{
	inherit				= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo",
	--explosion_blast_wave = "Blastwave_StPVE_Rocket",
	override_blast_wave_damage = true,
	--missile_defence_immune = true,	
	--missile_detection_immune = true,
	detonation_timeout	= 0.1,

	--spell 				= "CalibrationGrenade",
	detonation_radius	= 1,

	detonate_on_distance= 10,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.
	child_rockets =
	{
	    rocket = "Projectile_StPVE_Rocket",
	    --rocket = "SpaceMissile_Standart_T1_Mk1",

	    sphere_radius = 1, -- опционально
	    
	    -- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
	    -- Общее количество ракет не должно превышать 20
	   scheme = {
	        circle0 = { amount = 1, angle = 0, },
	        circle1 = { amount = 4, angle = 90, }, -- опционально
	        -- circle2 = { amount = 1, angle = 180, }, -- опционально
				},


	    --описание целей для управляемых ракет. Поддерживается не более 10 целей
	    -- direct_to_target = {
	        -- class = ai.SpellTargetClass.SHIP,
	        -- area = ai.SpellTargetArea.AROUND,
	        -- relationship = ai.SpellTargetRelationship.ENEMY,
	    -- },
	    -- direct_range = 5000, -- радиус поиска целей для управляемых ракет
	    -- max_rockets_per_target = 1, -- количество управляемых ракет на одну цель
	    
	},

}

Def.Projectile_StPVE_Rocket = --Разлетающиеся ракеты первые
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_StPVE_RocketFinal",
	model				= "models/weapons/bs_torpedo_small",
	override_blast_wave_damage = true,
	detonation_radius	= 10,
	--projectile_speed 	= 300,  
	max_range			= 40,  
	speed 				= 15,
	angular_velocity 	= 1,
	is_guided 			= true,
	
	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "plasma",
	
	--spell 				= "CalibrationGrenade",
	detonation_radius	= 1,

	detonate_on_distance= 60,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.
	child_rockets =
	{
	    rocket = "Projectile_StPVE_Rocket2",

	    sphere_radius = 1, -- опционально
	    
	    -- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
	    -- Общее количество ракет не должно превышать 20
	    scheme = {
	        circle0 = { amount = 4, angle = 90, },
	        --circle1 = { amount = 3, angle = 7, }, -- опционально
	      --  circle1 = { amount = 4, angle = 90, }, -- опционально
	        --circle3 = { amount = 6, angle = 120, }, -- опционально
	    },

	    --описание целей для управляемых ракет. Поддерживается не более 10 целей
	    direct_to_target = {
	        class = ai.SpellTargetClass.SHIP,
	        area = ai.SpellTargetArea.AROUND,
	        relationship = ai.SpellTargetRelationship.ENEMY,
			ai           = ai.SpellTargetAi.PLAYERS,
	    },
	    direct_range = 5000, -- радиус поиска целей для управляемых ракет
	    max_rockets_per_target = 1, -- количество управляемых ракет на одну цель
	    
	},

	flare_color			= "155 135 250 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_mid",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
	
		
}


Def.Projectile_StPVE_Rocket2 = --Разлетающиеся ракеты вторые
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_StPVE_RocketFinal",
	model				= "models/weapons/bs_torpedo_small",
	override_blast_wave_damage = true,
	detonation_radius	= 10,
	max_range			= 500, 
	speed 				= 130,
	angular_velocity 	= 200,
	is_guided 			= true,
	
	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "plasma",
}

Def.Blastwave_StPVE_RocketFinal = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 3,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 15,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,


	effect = "particles/explosions/expl_1_energy",
	light_color = "140 140 240 100",
	light_radius = 15,
	light_time = 0.8,
	sound 				= "sound/explosion/big_rocket_expl",
}


-- ---------------------------------------------------------------------------------------------------
-- ------------------------------------СТЕЛС ПВЕ БОТЫ------------------------------------------
-- ---------------------------------------------------------------------------------------------------

-- -------- ОХОТНИК

Def.Module_SmokeRocket_StealthPVE =
{
	inherit 			= "Weapon_Base",
	class					= "FiringModule",
	--shoot_mode				= ai.FiringModuleShootMode.TRIGGER_PROJECTILE, --повторная активация детонирует прожектайл
	in_editor 				= false,

	model 					= "models/weapons/plasma/power/vortex",

	cooldown				= 20,
	energy_cost 			= 10.0,
	track 					= ai.TrackMode.AIM,
	barrel_rot_speed 	= 360,

	projectile 				= "Projectile_SmokeRocket_PVE",
	projectile_speed 		= 100,
	
	max_range				= 300,
	
	dispersion			= 0,
	crit_chance			= 0,

	muzzleflash_color = { kinetic = "220 78 53 100", emp = "220 78 53 100", thermal = "220 78 53 100", },
	muzzleflash_radius 		= 25,

	
		damage_emp			= 1,
	
	shot_once_sound 	= "sound/weapons/rockets/rocket_aamu_t3_launch",
	launch_beam_fx		= "particles/weapons/big/herculesorb_beam",
	AIRules			= 
	{ 
		conditions	= 	
		{ -- что проверяем
			conditions_and = true,
			{  
				condition_type = AICondition.Random,
				param = 0.2,
			},
			{
				condition_type = AICondition.DistLess,
				param = 290, 
				target = { target = ai.SpellTargetGeneral.LOCKED_TARGET }
			},
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.LOCKED_TARGET },  -- цель преследуемая
			},
		},
		period = 2, -- частота проверки
	},

}

Def.Projectile_SmokeRocket_PVE = 
{

	inherit = "Projectile_SmokeRocket",
	max_range			= 5000,  
	speed 				= 1000,
	angular_velocity 	= 200,
	is_guided 			= true,
	spell				= "SmokeByRocket_PVE",
}

Spell.SmokeByRocket_PVE = --#88160: Активный модуль для командника: дымовая граната
{
	aura			= ai.Aura.DISABLE_LOCK, -- сбой радара
	target			=
	{
		target 	= ai.SpellTargetGeneral.CASTER,
		misc	= ai.SpellTargetMisc.POSITION,
	},
	aura_target		=
	{
		class			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		area			= ai.SpellTargetArea.AROUND,
	},
	aura_range		= 75,
	aura_sound 		= "sound/aura/stun",
	duration		= 10,
	isBuff			= false,
	apply_crowd_control_coef = true,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_TargetPainter", }, },
	--aura_fx 		="particles/areal/spacedust_cloud",
	nebula	= "Effects_Nebula_Spacedust",
}

Def.Module_HorrorHowl_Hunter = 
{
	inherit	= "Module_HorrorHowl_Mob",
	cooldown				= 15,
	energy_cost				= 10,
	spell 					= "HorrorHowl_Hunter",
	
	AIRules			= 
	{ 
		conditions	= 	
		{ -- что проверяем
			conditions_and = true,
			{  
				condition_type = AICondition.Random,
				param = 0.35,
			},
			{
				condition_type = AICondition.DistLess,
				param = 450, 
				target = { target = ai.SpellTargetGeneral.LOCKED_TARGET }
			},
			{
				condition_type = AICondition.VisibleTarget, -- трейслайнится
				target = { target = ai.SpellTargetGeneral.LOCKED_TARGET },  -- цель преследуемая
			},
		},
		period = 5, -- частота проверки
	},
}

Spell.HorrorHowl_Hunter =
{
	inherit	= "HorrorHowl",
	aura_extra_radius = 30,
	aura_range		= 500,
	duration 		= 5,
	chance			= 0.3,
}

------------------------------- Приключение Лето 2025 ----------------------------
Def.Module_StelthCourier =
{
	class 		= "SpaceShipModule",
	in_editor	= false,
	item_subtype	= ItemSubtype.StelthCourier,
	spell_on_equip = "Spell_StelthCourier_recast",
	activate_sound = "sound/gadgets/EmergencyBarrier",
	--storeItemId				= 0,
	default_icon	= "itemSubType_ExtremeShieldCharge",
}

Spell.Spell_StelthCourier_recast =
{
	influence		= ai.Spell.APPLY_AURA,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura = ai.Aura.CAST_SPELL_PERIODIC,
	target_spell = "Spell_StelthCourier",
	-- duration = 3,
	period = 5,
	isBuff = true,
	hud_visible = false,
	--gameplay_specific = true,

}

Spell.Spell_StelthCourier = 
{
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.STEALTH,
	duration = 5,	

}


