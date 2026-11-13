Def.Ship_Paperplane_Small = 
{
	inherit							= "Ship_Small",
	model 							= "mapskit/maps/event/paper_airplanes/ship/paper_ship_small",
	physics							= { solid_type = solid.model, mass = 500, material = "Paper", },

	contact_damage_min_speed		= 100, -- Минимальная скорость, на которой начинает учитываться урон  (#0012166)
	contact_damage_cf				= 0, -- Коэффициент перевода скорости в урон корпусу (простое умножение этого числа на длину вектора столкновения)
	
	slot_bones =
	{
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]				= "root",
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]		= "Weapon_PaperGun_S",
		[ ai.SpaceShipModuleSlot.SPECIAL ]					= "Module_Paper_SpeedUp",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]				= "Module_BuffLowHealth_20_Paper",
		[ ai.SpaceShipModuleSlot.ENGINE ]					= "Engine_Paper_S",
	},
	
	default_rocket_munition 		= "Ammo_Paper_Button",
	
	cpu_grades						= ai.DONT_INHERIT,
	armor_grades					= ai.DONT_INHERIT,
	shield_grades					= ai.DONT_INHERIT,
	capacitor_grades				= ai.DONT_INHERIT,
	engine_grades					= ai.DONT_INHERIT,
	
	uiName							= "Ship_Paper_S",
	ship_name						= "Ship_Paper_S",
	
	hangarIco						= "Ship_Paper_S",
	default_icon					= "shopIco_Ship_Paper_S",
	hangarIcoSmall					= "Ship_Paper_S_small",
	
	role							= ai.ShipRoles.SCOUT,
	race							= ai.Race.SPECIAL,
	rank 							= 15,
	
	death_blast_wave				= "BlastWave_Paper_S", --взрыв от смерти
	death_wreck						= "Wreck_Paper_S", -- прототип обломка корабля 
	death_effect					= "particles/empty",
	death_sound						= "sound/explosion/PaperShip_expl",
	broken_parts					= ai.DONT_INHERIT,
	
	----------------------------------------------------------------------------------------
	--			Params
	----------------------------------------------------------------------------------------	
	shield_max						= 0,
	hull_health						= 100,
	spawn_timeout					= 15,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 30,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 26, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 6,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 20,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 30,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 2,		-- максимальная скорость при движении назад (в м/с)

	decel_afterburning				= 6,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 6,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 1, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 4, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 4,
	max_yspeed						= 1,
	accel_y0						= 4,
	accel_y1						= 4,
	
	rot_xmaxspeed					= 95,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 175,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 110,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 95,
	rotaccel_y0						= 175,
	rotaccel_y1						= 110,
	
	----------------------------------------------------------------------------------------
	--			CPU
	----------------------------------------------------------------------------------------

	use_team_skin					= true,

	----------------------------------------------------------------------------------------
	--			PROPELLER
	----------------------------------------------------------------------------------------

	propeller_rot_speed_min			= 0,
	propeller_rot_speed_max			= 360*2.5,
	propeller_rot_accel				= 360*3,
	propeller_rot_reverse_accel		= 360*10,
	propeller_rot_decel				= 360*0.5,
	propeller_boost_rot_coef		= 2.0,
	propeller_second_boost_rot_coef	= 2.0,
	propeller_reverse_speed_coef	= 0.8,
}

Def.Ship_Paperplane_Medium = 
{
	inherit							= "Ship_Medium",
	model 							= "mapskit/maps/event/paper_airplanes/ship/ship2/paper_ship_02_m",
	physics							= { solid_type = solid.model, mass = 1000, material = "Paper", },

	contact_damage_min_speed		= 100, -- Минимальная скорость, на которой начинает учитываться урон  (#0012166)
	contact_damage_cf				= 0, -- Коэффициент перевода скорости в урон корпусу (простое умножение этого числа на длину вектора столкновения)
	
	slot_bones =
	{
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]				= "root",
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]		= "Weapon_PaperGun_M",
		[ ai.SpaceShipModuleSlot.SPECIAL ]					= "Module_Paper_EMI",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]				= "Module_BuffLowHealth_20_Paper",
		[ ai.SpaceShipModuleSlot.ENGINE ]					= "Engine_Paper_M",
	},
	
	default_rocket_munition 		= "Ammo_Paper_Match",
	
	cpu_grades						= ai.DONT_INHERIT,
	armor_grades					= ai.DONT_INHERIT,
	shield_grades					= ai.DONT_INHERIT,
	capacitor_grades				= ai.DONT_INHERIT,
	engine_grades					= ai.DONT_INHERIT,
	
	uiName							= "Ship_Paper_M",
	ship_name						= "Ship_Paper_M",
	
	hangarIco						= "Ship_Paper_M",
	default_icon					= "shopIco_Ship_Paper_M",
	hangarIcoSmall					= "Ship_Paper_M_small",
	
	role							= ai.ShipRoles.ATTACK,
	race							= ai.Race.SPECIAL,
	rank 							= 15,
	
	death_blast_wave				= "BlastWave_Paper_M", --взрыв от смерти
	death_wreck						= "Wreck_Paper_M", -- прототип обломка корабля 
	death_effect					= "particles/empty",
	death_sound						= "sound/explosion/PaperShip_expl",
	broken_parts					= ai.DONT_INHERIT,
	
	----------------------------------------------------------------------------------------
	--			Params
	----------------------------------------------------------------------------------------	
	shield_max						= 0,
	hull_health						= 300,
	spawn_timeout					= 20,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 20,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 18, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 6,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 20,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 30,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 2,		-- максимальная скорость при движении назад (в м/с) 
	
	decel_afterburning				= 5,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 5,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 2, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 9, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 9,
	max_yspeed						= 2,
	accel_y0						= 9,
	accel_y1						= 9,
	
	rot_xmaxspeed					= 80,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 168,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 100,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 80,
	rotaccel_y0						= 168,
	rotaccel_y1						= 100,
	
	----------------------------------------------------------------------------------------
	--			CPU
	----------------------------------------------------------------------------------------

	use_team_skin					= true,

	----------------------------------------------------------------------------------------
	--			PROPELLER
	----------------------------------------------------------------------------------------

	propeller_rot_speed_min			= 0,
	propeller_rot_speed_max			= 360*2.5,
	propeller_rot_accel				= 360*3,
	propeller_rot_reverse_accel		= 360*10,
	propeller_rot_decel				= 360*0.5,
	propeller_boost_rot_coef		= 2.0,
	propeller_reverse_speed_coef	= 0.3,
}

Def.Ship_Paperplane_Large = 
{
	inherit							= "Ship_Large",
	model 							= "mapskit/maps/event/paper_airplanes/ship/ship3/paper_ship_03",
	physics							= { solid_type = solid.model, mass = 2000, material = "Paper", },

	contact_damage_min_speed		= 100, -- Минимальная скорость, на которой начинает учитываться урон  (#0012166)
	contact_damage_cf				= 0, -- Коэффициент перевода скорости в урон корпусу (простое умножение этого числа на длину вектора столкновения)
	
	slot_bones =
	{
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]				= "root",
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]		= "Weapon_PaperGun_L",
		[ ai.SpaceShipModuleSlot.SPECIAL ]					= "Module_Paper_FireWall",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]				= "Module_BuffLowHealth_20_Paper",
		[ ai.SpaceShipModuleSlot.ENGINE ]					= "Engine_Paper_L",
	},
	
	default_rocket_munition 		= "Ammo_Paper_ButtonField",
	
	cpu_grades						= ai.DONT_INHERIT,
	armor_grades					= ai.DONT_INHERIT,
	shield_grades					= ai.DONT_INHERIT,
	capacitor_grades				= ai.DONT_INHERIT,
	engine_grades					= ai.DONT_INHERIT,
	
	uiName							= "Ship_Paper_L",
	ship_name						= "Ship_Paper_L",
	
	hangarIco						= "Ship_Paper_L",
	default_icon					= "shopIco_Ship_Paper_L",
	hangarIcoSmall					= "Ship_Paper_L_small",
	
	role							= ai.ShipRoles.GUARD,
	race							= ai.Race.SPECIAL,
	rank 							= 15,
	
	death_blast_wave				= "BlastWave_Paper_L", --взрыв от смерти
	death_wreck						= "Wreck_Paper_L", -- прототип обломка корабля 
	death_effect					= "particles/empty",
	death_sound						= "sound/explosion/PaperShip_expl",
	broken_parts					= ai.DONT_INHERIT,
	
	----------------------------------------------------------------------------------------
	--			Params
	----------------------------------------------------------------------------------------	
	shield_max						= 0,
	hull_health						= 500,
	spawn_timeout					= 20,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 12,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 8, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 6,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 30,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 40,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 2,		-- максимальная скорость при движении назад (в м/с) 
	
	decel_afterburning				= 2,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 2,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 2, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 4, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 4,
	max_yspeed						= 2,
	accel_y0						= 4,
	accel_y1						= 4,
	
	rot_xmaxspeed					= 25,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 25,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 25,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 25,
	rotaccel_y0						= 25,
	rotaccel_y1						= 25,
	
	----------------------------------------------------------------------------------------
	--			CPU
	----------------------------------------------------------------------------------------

	use_team_skin					= true,

	----------------------------------------------------------------------------------------
	--			PROPELLER
	----------------------------------------------------------------------------------------

	propeller_rot_speed_min			= 0,
	propeller_rot_speed_max			= 360*2.5,
	propeller_rot_accel				= 360*3,
	propeller_rot_reverse_accel		= 360*10,
	propeller_rot_decel				= 360*0.5,
	propeller_boost_rot_coef		= 2.0,
	propeller_reverse_speed_coef	= 0.3,
}

-- WEAPONS

Def.Weapon_PaperGun_S =
{
	inherit							= "Weapon_AutoGun",

	cant_be_bought					= true,
	
	fire_rate						= 100,
	cycle_barrels 					= true,
	
	projectile_speed				= 400,
	
	dispersion						= 1.05,
	dispersion_max					= 0.315,
	dispersion_add					= -0.3,
	dispersion_sub					= -0.8,
	
	optimal_range					= 55,
	max_range						= 55 * 1.3,
	
	damage_kinetic					= 35,
	
	crit_chance						= 0,
	
	heat_max						= 10,
	heat_add						= 2,
	heat_sub						= 5,
	
	overheat_time					= 1,
	
	max_aim_yaw						= 10, --10
	max_aim_pitch  					= 5,	--5

	model							= "mapskit/maps/event/paper_airplanes/guns/gun_s",

	projectile						= "Projectile_Paper_S",
	
	--shot_effect 					= "particles/weapons/plasma/muzzle_reflector",
	muzzleflash_color				= { kinetic = "0 0 0 0", },
	muzzleflash_radius 				= 0,
	shot_once_sound 				= "sound/weapons/PaperGun/pg_s",
	
	item_subtype					= ItemSubtype.PaperGun,
	default_icon					= "ItemSubtype_Weapon_PaperGun",
}

Def.Weapon_PaperGun_M =
{
	inherit							= "Weapon_PaperGun_S",
	
	optimal_range					= 75,
	max_range						= 75 * 1.3,
	
	fire_rate						= 60,
	
	projectile_speed				= 600,
	
	damage_kinetic					= 20,
	
	max_aim_yaw						= ai.DONT_INHERIT,
	max_aim_pitch  					= ai.DONT_INHERIT,
	
	item_subtype					= ItemSubtype.PaperGun,
	default_icon					= "ItemSubtype_Weapon_PaperGun",
	shot_once_sound 				= "sound/weapons/PaperGun/pg_m",
}

Def.Weapon_PaperGun_L =
{
	inherit							= "Weapon_PaperGun_S",
	
	optimal_range					= 100,
	max_range						= 100 * 1.3,
	
	damage_kinetic					= 60,
	
	fire_rate						= 40,
	
	max_aim_yaw						= ai.DONT_INHERIT,
	max_aim_pitch  					= ai.DONT_INHERIT,
	
	model							= "mapskit/maps/event/paper_airplanes/guns/gun_l",
	
	projectile						= "Projectile_Paper_L",
	
	item_subtype					= ItemSubtype.NailPaperGun,
	default_icon					= "ItemSubtype_Weapon_PaperGun_L",
	shot_once_sound 				= "sound/weapons/PaperGun/pg_l",
}

-- AMMO

Def.Ammo_Paper_Match =
{
	inherit							= "Weapon_BaseRocket",

	speed							= 200,
	max_range						= 100,
	
	cooldown						= 3,
	holder_size						= 10,
	empty_holder_cooldown			= 120,
	
	detonation_radius				= 5,
	
	flare_size						= 0.0,
	flare_occl_size					= 1,
	flare_aspect					= 1,
	flare_angle						= 180,
	flare_warp						= 0.1,
	flare_color						= "255 150 100 5",
	flare_nebulosity				= 0.2,
	
	smooth_effect_param				= true,

	model							= "mapskit/maps/event/paper_airplanes/addition_objects/match",

	spell							= "Ammo_Paper_Match",
	explosion_blast_wave			= "BlastWave_Paper_Match",
	
	launch_sound					= "sound/weapons/rockets/PaperMissile_launch",
	effect							= "particles/weapons/paper/projectile_match",
--	work_sound						= "sound/weapons/rockets/rocket_fly",
--	rocket_direct_hit_sound			= "sound/hit/rocket_direct_hit",
	
	impact_type 					= "rocket",
	
	death_entity					= "Ammo_Paper_Match_onDeath",
	
	item_subtype					= ItemSubtype.PaperMatch,
	default_icon					= "ItemSubtype_Ammo_Paper_Match",
}

Def.Ammo_Paper_Button =
{
	class							= "Minefield",
	in_editor						= false,

	field_radius					= 12,
	
	max_mines						= 1,
	time_to_live					= 15,
	period							= 1,
	repeat_period					= 1.5,
	
	cooldown						= 15,
	holder_size						= 5,
	empty_holder_cooldown			= 120,

	use_team_skin					= true,
	model							= "mapskit/maps/event/paper_airplanes/addition_objects/button",

	explosion_blast_wave			= "BlastWave_Paper_Button",
	
	work_effect_s1					= "particles/gadget/mine_friendly",
	work_effect_s2					= "particles/gadget/mine",
	launch_sound					= "sound/weapons/mine/PaperButton_launch",
	
	item_subtype					= ItemSubtype.PaperButton,
	default_icon					= "ItemSubtype_Ammo_Paper_Button",
}

Def.Ammo_Paper_ButtonField =
{
	class							= "Minefield",
	in_editor						= false,

	field_radius					= 20,
	
	max_mines						= 4,
	time_to_live					= 40,
	period							= 1,
	repeat_period					= 1.5,
	
	cooldown						= 15,
	holder_size						= 2,
	empty_holder_cooldown			= 120,

	use_team_skin					= true,
	model							= "models/misc/invisible_model",

	explosion_blast_wave			= "BlastWave_Paper_Button_Field",
	
	work_effect_s1					= "particles/weapons/paper/pushpin_friendly",
	work_effect_s2					= "particles/weapons/paper/pushpin",			
	shot_effect_s1					= "particles/weapons/paper/pushpin_deploy_friendly",
	shot_effect_s2					= "particles/weapons/paper/pushpin_deploy",
	launch_sound					= "sound/weapons/mine/PaperButton_launch",
	
	item_subtype					= ItemSubtype.PaperButtonField,
	default_icon					= "ItemSubtype_Ammo_Paper_ButtonField",
}

-- MODULES

Def.Module_BuffLowHealth_20_Paper =  
{
	class 							= "SpaceShipModule",
	in_editor						= false,

	spell_on_max_health_minus 		= "Spell_BuffLowHealth_20_Paper",
	max_health_percent				= 0.2,
	
	item_subtype					= ItemSubtype.PassiveBuff20Paper,
	default_icon					= "anomaly_damage_ico",
}

Def.Module_Paper_SpeedUp =
{
	class							= "ActiveModule",
	in_editor						= false,
	
	cooldown						= 25,
	energy_cost						= 30,
	
	spell							= "Spell_Paper_SpeedUp",
	deactivate_spell				= "Spell_Paper_SpeedUp_2",
	
	item_subtype					= ItemSubtype.PaperSpeedUp,
	default_icon					= "ItemSubtype_Module_Paper_SpeedUp",
	activate_sound  = "sound/gadgets/paper_common_activate",
}

Def.Module_Paper_EMI =
{
	class							= "ActiveModule",
	in_editor						= false,
	
	cooldown						= 35,
	energy_cost						= 50,
	
	spell							= "Spell_Paper_EMI",
	
	item_subtype					= ItemSubtype.PaperEMI,
	default_icon					= "ItemSubtype_Module_Paper_EMI",
	activate_sound  = "sound/gadgets/paper_common_activate",
}

Def.Module_Paper_FireWall =
{
	class							= "ActiveModule",
	in_editor						= false,
	
	cooldown						= 20,
	energy_cost						= 50,
	
	spell							= "Spell_Paper_FireWall",
	
	item_subtype					= ItemSubtype.PaperFirewall,
	default_icon					= "ItemSubtype_Module_Paper_FireWall",
	activate_sound  = "sound/gadgets/paper_common_activate",
}

-- SPELLS

Spell.SpawnWarpInvulnerabilityApril =
{
	inherit							= "SpawnWarpInvulnerability",
	duration						= 7.0,
}

Spell.Spell_BuffLowHealth_20_Paper =
{
	influence						= ai.Spell.APPLY_AURA,
	aura							= ai.Aura.HEAL_HULL_PERCENT_PERIODIC,
	target							= ai.SpellTarget.CASTER,
	aura_target						= ai.SpellTarget.HOLDER,

	aura_param						= 0.01,
	period							= 0.5,

	isBuff							= true,
	
	gameplay_specific				= true,
	
	additional_auras =
	{
		{
			influence				= ai.Spell.APPLY_AURA,
			aura					= ai.Aura.SLOW_MOVEMENT,
			aura_target				= ai.SpellTarget.HOLDER,

			aura_param				= 0.8,

			isBuff					= false,
			
			gameplay_specific		= true,
			
			ui_ico =
			{
				target_system		= { tex = "anomaly_damage_ico", },
			},
		},
		{
			influence				= ai.Spell.APPLY_AURA,
			aura					= ai.Aura.SLOW_MANEUVER,
			aura_target				= ai.SpellTarget.HOLDER,

			aura_param				= 0.8,

			isBuff					= false,
			
			gameplay_specific		= true,
			
			ui_ico =
			{
				target_system		= { tex = "anomaly_damage_ico", },
			},
		},
	},
	
	ui_ico =
	{
		target_system				= { tex = "anomaly_damage_ico", },
	},
	
	aura_fx 				= "particles/weapons/paper/match_spell",
}

Spell.Ammo_Paper_Match =
{
	influence						= ai.Spell.APPLY_AURA,
	aura							= ai.Aura.DAMAGE_THERMAL_PERIODIC,
	target							= ai.SpellTarget.ENEMY_AROUND,
	aura_target						= ai.SpellTarget.HOLDER,
	
	target_range					= 20,

	aura_param						= 20,
	period							= 1,
	duration						= 3,

	isBuff							= false,
	
	aura_fx 				= "particles/weapons/paper/match_spell",
	
	ui_ico =
	{
		target_system				= { tex = "ItemSubtype_Ammo_Paper_Match", },
	},
}

Spell.Spell_Paper_SpeedUp =
{
	influence						= ai.Spell.APPLY_AURA,
	aura							= ai.Aura.FAST_MOVEMENT,
	target							= ai.SpellTarget.CASTER,
	aura_target						= ai.SpellTarget.HOLDER,

	aura_param						= 1.2,
	
	duration						= 3,

	isBuff							= true,
	
	additional_auras =
	{
		{
			influence				= ai.Spell.APPLY_AURA,
			aura					= ai.Aura.SLOW_MANEUVER,
			aura_target				= ai.SpellTarget.HOLDER,

			aura_param				= 2.5,

			duration				= 3,

			isBuff					= true,
			
			ui_ico =
			{
				target_system		= { tex = "ItemSubtype_Module_Paper_SpeedUp", },
			},
		},
		{
			influence				= ai.Spell.APPLY_AURA,
			aura					= ai.Aura.FORCE_BOOST,
			aura_target				= ai.SpellTarget.HOLDER,

			duration				= 3,

			isBuff					= true,
			
			ui_ico =
			{
				target_system		= { tex = "ItemSubtype_Module_Paper_SpeedUp", },
			},
		},
		{
			influence				= ai.Spell.APPLY_AURA,
			aura					= ai.Aura.FAST_MANEUVER,
			aura_target				= ai.SpellTarget.HOLDER,

			aura_param				= 2,

			aura_execution_delay	= 3,

			duration				= 1.5,

			isBuff					= true,
			
			ui_ico =
			{
				target_system		= { tex = "ItemSubtype_Module_Paper_SpeedUp", },
			},
		},
	},
	
	ui_ico =
	{
		target_system				= { tex = "ItemSubtype_Module_Paper_SpeedUp", },
	},
}

Spell.Spell_Paper_SpeedUp_2 =
{
	influence						= ai.Spell.APPLY_AURA,
	aura							= ai.Aura.FAST_MANEUVER,
	target							= ai.SpellTarget.CASTER,
	aura_target						= ai.SpellTarget.HOLDER,

	aura_param						= 1.5,
	
	duration						= 1,

	isBuff							= true,
	
	ui_ico =
	{
		target_system				= { tex = "ItemSubtype_Module_Paper_SpeedUp", },
	},
}

Spell.Spell_Paper_EMI =
{
	influence						= ai.Spell.APPLY_AURA,
	aura							= ai.Aura.STASIS,
	target							= ai.SpellTarget.CASTER,
	aura_target =
	{
		class          				= ai.SpellTargetClass.SHIP,
		area           				= ai.SpellTargetArea.IN_CONE,
		relationship   				= ai.SpellTargetRelationship.ENEMY,
	},
	
	aura_range						= 75 * 1.3,
    aura_extra_radius				= 40,
	
	fixed_cylinder_target			= true,
	aura_target_offset				= Vec3( 0, 0, -50 ),
	
	duration						= 1,

	isBuff							= true,
	
	ui_ico =
	{
		target_system				= { tex = "ItemSubtype_Module_Paper_EMI", },
	},
	
	aura_target_fx 					= "particles/gadget/lightnings_debuff",
	work_beam_target_root_fx 		= "particles/weapons/laser/laser_electric_beam",
	aura_sound = "sound/aura/stun",
}

Spell.Spell_Paper_FireWall =
{
	influence						= ai.Spell.APPLY_AURA,
	aura							= ai.Aura.FIRE_RATE_MOD,
	target							= ai.SpellTarget.CASTER,
	aura_target						= ai.SpellTarget.HOLDER,

	aura_param						= 0.4,

	duration						= 4,

	isBuff							= true,
	
	additional_auras =
	{
		{
			influence				= ai.Spell.APPLY_AURA,
			aura					= ai.Aura.DAMAGE_MOD,
			aura_target				= ai.SpellTarget.HOLDER,

			aura_param				= 0.2,

			duration				= 4,

			isBuff					= true,
			
			ui_ico =
			{
				target_system		= { tex = "ItemSubtype_Module_Paper_FireWall", },
			},
		},
	},
	
	ui_ico =
	{
		target_system				= { tex = "ItemSubtype_Module_Paper_FireWall", },
	},
}


-- OTHER

Def.Engine_Paper_S =
{
	class							= "EngineModule",
	in_editor						= false,
	
	engine_sound					= "sound/engine/small_engine_loop",
	engine_sound_left				= "sound/engine/left_engine",
	engine_sound_right				= "sound/engine/right_engine",
	
	engine_effect					= "particles/ships/engine_base",
	boost_effect					= "particles/ships/boost",
	engine_sound 					= "sound/engine/PaperShip_engine",
}

Def.Engine_Paper_M =
{
	inherit							= "Engine_Paper_S",
	engine_sound 					= "sound/engine/PaperShip_engine",
}

Def.Engine_Paper_L =
{
	inherit							= "Engine_Paper_S",
	engine_sound 					= "sound/engine/PaperShip_engine",
}

Def.Wreck_Paper_S = 
{
	class							= "ShipWreck",
	in_editor						= false,
	hudType							= "loot_crate",
	model							= "mapskit/maps/event/paper_airplanes/ship/wreck/paper_wreck_s",	
	physics							= { solid_type = solid.model, mass = 500, material = "Paper", damping = 0.3, rot_damping = 0.3, },
	uiName 							= "ShipWreck",
	remove_timeout					= 3,
	remove_fade_time 				= 3,
	children = 
	{
		{ effect = "particles/explosions/shp_exp_small_paper", joint = "fx1" },
	},
}

Def.Wreck_Paper_M = 
{
	inherit 						= "Wreck_Paper_S",
	model							= "mapskit/maps/event/paper_airplanes/ship/wreck/paper_wreck_m",	
	physics							= { solid_type = solid.model, mass = 1000, material = "Paper", damping = 0.3, rot_damping = 0.3, },
	children = 
	{
		{ effect = "particles/explosions/shp_exp_mid_paper", joint = "fx1" },
	},
}

Def.Wreck_Paper_L = 
{
	inherit 						= "Wreck_Paper_S",
	model							= "mapskit/maps/event/paper_airplanes/ship/wreck/paper_wreck_l",	
	physics							= { solid_type = solid.model, mass = 2000, material = "Paper", damping = 0.3, rot_damping = 0.3, },
	children = 
	{
		{ effect = "particles/explosions/shp_exp_big_paper", joint = "fx1" },
	},
}

Def.BlastWave_Paper_S = 
{
	class 							= "BlastWave",
	in_editor						= false,
	apply_shake						= false,
	
	damage_kinetic					= 0.0,
	damage_emp						= 0.0,
	damage_thermal					= 15,

	light_radius					= 10.0,
	light_color						= "255 130 100 255",
	light_time						= 1.0,

	blast_maxDistance				= 1.5, 
	
	default_icon					= "damage_explosionBlastwave",	
	uiName							= "damage_shipExplodeBlastWave",	-- для нормального отображения в DeathRecap
}

Def.BlastWave_Paper_M = 
{
	inherit 						= "BlastWave_Paper_S",
}

Def.BlastWave_Paper_L = 
{
	inherit 						= "BlastWave_Paper_S",
}

Def.Projectile_Paper_S =
{
	class							= "Projectile",
	in_editor						= false,
	mass							= 0.05,
	effect							= "particles/weapons/paper/projectile_clot",
	model							= "mapskit/maps/event/paper_airplanes/addition_objects/clump",
	
	hitbox_min 						= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max						= Vec3( 0.1, 0.1, 0.1 ),
	
	apply_shake						= true,
	
	impact_type 					= "railgun",
	
	death_entity					= "Projectile_Paper_S_onDeath",
}

Def.Projectile_Paper_S_onDeath =
{
	class 							= "ScBaseEntity",
	in_editor						= false,
	
	physics							= { solid_type = solid.model, hitbox = false, mass = 15, material = "Paper", damping = 0.3, rot_damping = 0.3, },

	model							= "mapskit/maps/event/paper_airplanes/addition_objects/clump",
	
	ttl 							= 2,
	
	weapon_mode						= ai.ShieldWeaponMode.PASS,
	radar_vison						= ai.ShieldRadarVisionMode.PASS,
}

Def.Projectile_Paper_L =
{
	inherit							= "Projectile_Paper_S",
	mass							= 0.2,
	model							= "mapskit/maps/event/paper_airplanes/addition_objects/nail",
	effect							= "particles/weapons/paper/projectile_nail",
	
	death_entity					= "Projectile_Paper_L_onDeath",
}

Def.Projectile_Paper_L_onDeath =
{
	inherit							= "Projectile_Paper_S_onDeath",

	physics							= { solid_type = solid.model, mass = 15, material = "Paper", damping = 0.3, rot_damping = 0.3, },

	model							= "mapskit/maps/event/paper_airplanes/addition_objects/nail",
	
	ttl 							= 3,
	
	weapon_mode						= ai.ShieldWeaponMode.PASS,
	radar_vison						= ai.ShieldRadarVisionMode.PASS,
}

Def.BlastWave_Paper_Match =
{
	class							= "BlastWave",
	in_editor						= false,
	
	intensity						= 30,
	
	damage_thermal					= 25,
	
	blast_maxDistance				= 7.5,
	blast_minDistance				= 2,

	apply_damage					= true,
	apply_shake						= true,
	
	--effect							= "particles/explosions/expl_2",
	effect							= "particles/weapons/crossout/tank_cannon_hit",
	light_color						= "255 100 50 150",
	light_radius					= 20,
	light_time						= 0.8,
	sound							= "sound/explosion/PaperMissile_expl",
}

Def.Ammo_Paper_Match_onDeath =
{
	class 							= "ScBaseEntity",
	in_editor						= false,
	
	physics							= { solid_type = solid.model, mass = 15, material = "TechnoPlex", damping = 0.3, rot_damping = 0.3, },

	model							= "mapskit/maps/event/paper_airplanes/addition_objects/match",
	
	ttl 							= 5,
	
	children = 
	{
		{ effect = "particles/weapons/missile/rocket_trail_april", joint = "fx1" },
	},
	
	weapon_mode						= ai.ShieldWeaponMode.PASS,
	radar_vison						= ai.ShieldRadarVisionMode.PASS,
}

Def.BlastWave_Paper_Button =
{
	class							= "BlastWave",
	in_editor						= false,
	
	intensity						= 10,
	
	damage_kinetic					= 45,
	
	blast_maxDistance				= 5,
	blast_minDistance				= 2,

	apply_damage					= true,
	apply_shake						= true,
	
	effect							= "particles/weapons/crossout/tank_cannon_hit",
	light_color						= "255 100 50 150",
	light_radius					= 5,
	light_time						= 0.2,
	sound						= "sound/explosion/PaperButton_expl",
}

Def.BlastWave_Paper_Button_Field =
{
	inherit							= "BlastWave_Paper_Button",

	damage_kinetic					= 35,
	sound						= "sound/explosion/PaperButton_expl",
}

-----------------------------------------------------------------------------------------------
-------------------------------Параметры для первоапрельского вторжения------------------------
-----------------------------------------------------------------------------------------------
Def.Weapon_Apr1_PaperGun_S =
{
	inherit				= "Weapon_PaperGun_S",
	fire_rate						= 150,
		
	projectile_speed				= 1000,
		
	optimal_range					= 255,
	max_range						= 255 * 1.3,
	
	damage_kinetic					= 150,
	
	max_aim_yaw						= 100, --10
	max_aim_pitch  					= 100,	--5
}

Def.Weapon_Apr1_PaperGun_M =
{
	inherit				= "Weapon_PaperGun_M",
	fire_rate						= 100,
	projectile_speed				= 1000,
		
	optimal_range					= 255,
	max_range						= 255 * 1.3,
	
	damage_kinetic					= 250,
	
	max_aim_yaw						= 100, --10
	max_aim_pitch  					= 100,	--5
}

Def.Weapon_Apr1_PaperGun_L =
{
	inherit				= "Weapon_PaperGun_L",
	fire_rate						= 80,
	projectile_speed				= 1000,
		
	optimal_range					= 255,
	max_range						= 255 * 1.3,
	
	damage_kinetic					= 350,
	
	max_aim_yaw						= 100, --10
	max_aim_pitch  					= 100,	--5
}