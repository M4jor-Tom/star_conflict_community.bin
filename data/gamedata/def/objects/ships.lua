-- базовый прототип для всех кораблей. от него должны наследоваться все остальные корабли 
Def.Ship_Base = 
{
	class						= "SpaceShip",
	in_editor					= false,
	damageable					= true,

	ship_tier					= 1,
--	skin_idx		= 1, -- устарело настолько, что нигде не нашлось упоминаний зачем оно нужно. Оставляю пока здесь на всякий случай, 4.4.2013
	skin						= "default", 
	
	default_icon 				= "shopIco_Ship_Race1_S_T1",
	
	health						= 1.0,		-- здоровье задается через модуль ARMOR

	spawn_timeout 				= 15,
	
	spawn_warp_speed 			= 200,
	spawn_warp_sound_loop 		= "sound/gadgets/spawn_warp_start_loop",
	spawn_warp_sound_end 		= "sound/gadgets/spawn_warp_end",
	spawn_jump_sound_end 		= "sound/game/spawn_jump_end",
	spawn_warp_effect_loop 		= "particles/null",
	spawn_warp_effect_end 		= "particles/ships/warp_exit",
	despawn_sound 				= "sound/game/despawn",
	
	
--	death_sound	=	"sound/explosion/ship_expl",
	death_effect 				= "particles/explosions/shp_exp_big_02",
	--death_effect 				= "particles/explosions/shp_exp_big_8march", -- #59880
	rcs_effect 					= "particles/ships/rcs_fog",
	-- slow_movement_effect = "particles/gadget/slowdown",
	silence_effect 				= "particles/ships/crit_modul_m",
	crash_screen_effect 		= "particles/screen/interference",
	
	--death_blast_wave = "TorpedoBlastWave",
	
	debris_remove_delay 		= 4,
	bomb_detection_time			= 2, -- таймер до срабатывании оповещения о мине RocketMine
	
	incoming_rocket_sound 		= "sound/gadgets/incoming_rocket",	-- звук если по нашему кораблю выпущена ракета
	lock_by_enemy_sound 		= "sound/gadgets/locked_by_enemy",	-- звук того что игрока залочил противник
	locking_sound 				= "sound/gadgets/locking",				-- звук в течении залочки цели
	lock_sound 					= "sound/gadgets/target_locked",				-- звук в конце залочки цели
--	lock_failed_sound 			= "sound/gadgets/lock_failed",		-- звук в конце неудачной залочки цели
	deal_damage_sound			= "sound/game/common_hit",		-- звук когда мы нанесли кому-то урон
	agony_sound 				= "sound/game/agony",					    -- звук когда корабль при смерти
	silence_sound 				= "sound/aura/stun",					-- звук когда на корабль наложены ауры типв AURA_SILENCE или AUR_STUN
	platform_rot_sound			= "sound/gadgets2/LandingMultyPlatform/ship_turn",		-- звук вращения на посадочной платформе

	interaction_sound_bomb_take = "sound/game/gameplay_progressbar",	-- звук взятия бомбы
	interaction_sound_bomb_site_plant	= "sound/game/gameplay_progressbar",	-- звук установки бомбы

	fire_dispersion_AI 			= 3.5,

	weapon_slots 				= 2,	
	slot_bones 					= 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "rocket",

 		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "root",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "root",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "root",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "root",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "capacitor",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "rocket", --root
		
 		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD] 	 = "root",		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.CPU_MOD ]			 = "root",	
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD ]	 	 = "root",
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "Weapon_RocketLauncher",

		--[ ai.SpaceShipModuleSlot.CPU ] 				 = "Module_ComputerMk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "Module_Capacitor_Base",
		--[ ai.SpaceShipModuleSlot.SHIELD ] 			 = "ModuleShield_Base",
		--[ ai.SpaceShipModuleSlot.ARMOR  ] 			 = "ModuleArmor_Base",
	},

	--cpu_grades =  		--линейные апгрейды компьютера.
	--armor_grades = --это определяется по размерности корабля
	--shield_grades =  --это определяется по размерности корабля
	--capacitor_grades = --это определяется по размерности корабля + раса
	--engine_grades = --это определяется по размерности корабля + раса
	
	--secondary_weapons = 
	--{
	--	"Weapon_RocketLauncher_AMMu_Test",
	--	"Weapon_RocketLauncher_EMP_Test",
	--},
	
	rocket_launch_vel = Vec3( 0, -10, 0 ),		-- скорость запуска ракет
	rocket_launch_time = 1.0,					-- время запуска ракет (за это время скорость запуска преходит в скорость движения ракеты)
	
 	--rocket_ammo1_def	= "SpaceMissile_AAMu",
	--rocket_ammo1_count	= 0,
	--rocket_ammo2_def	= "SpaceMissile_Default",
	--rocket_ammo2_count	= 0,
	--rocket_ammo3_def	= "SpaceTorpedo_Default",
	--rocket_ammo3_count	= 5,
	zoom_value			= 2,
	
	----- параметры для настройки уникальных карабельных бонусов. подробнее смотри в wiki, раздел PassiveModificators -----
	--hull_health_mul = 0,
	--hull_resist_kinetic_add = 0,
	--hull_resist_emp_add  = 0,
	--hull_resist_thermal_add = 0,

	--shield_max_mul = 0,
	--shield_resist_kinetic_add = 0,
	--shield_resist_emp_add = 0,
	--shield_resist_thermal_add = 0,

	--energy_max_mul = 0,

	--lock_time_mul = 0,
	--vision_radius_mul = 0,
	--vision_offset_mul = 0,
	
	--spell_propulsion_jam_param_mul = 0,
	--spell_propulsion_jam_range_mul = 0,
	--spell_propulsion_jam_duration_mul = 0,
	--spell_target_painter_range_mul = 0,
	--spell_command_param_mul = 0,
	--spell_ecm_duration_mul = 0,
	--spell_emission_param_mul = 0,
	--spell_emission_range_mul = 0,
	
	--module_logistic_energy_cost_mul = 0,
	
	--max_speed_mul = 0,
	--acceleration_mul = 0,
	--strafe_speed_mul = 0,
	--rot_speed_mul = 0,
	--boost_energy_cost_mul = 0,
	
	--stealth_speed_coef_mul = 0,
	
	--railgun_damage_mul = 0,
	--railgun_dispersion_mul = 0,
	--railgun_energy_cost_mul = 0,
	--railgun_projectile_speed_mul = 0,
	--plasma_damage_mul = 0,
	--plasma_dispersion_mul = 0,
	--plasma_energy_cost_mul = 0,
	--plasma_projectile_speed_mul = 0,
	--laser_energy_cost_mul = 0,
	--laser_damage_mul = 0,
	--beacon_capture_mul = 0,
	
	-- межмиссионное повреждение корабля
	-->За каждые 100% хп корабля снимаем 2%, но не больше 15%
	hull_dmg_for_full_health 	= 0.02,
	max_hull_dmg_for_health 	= 0.06,
	-->Если корабль умер, то он ломается на случайное число от 20% до 35%
	min_hull_damage_for_death 	= 0.20,
	max_hull_damage_for_death 	= 0.35,
	--реген корпуса по дефолту нуль.
	hull_regen					= 0,
	
	max_controlled_drones		= 2,
	
	dock_sound					= "sound/game/dock",

	--для первоапрельской шутки. После 1 го апреля наверно лучше это закомментировать но никогда не удалять.  #50964
	left_claw_model				= "models/weapons/crab/crab_hand_l", -- "mapskit/maps/event/paper_airplanes/guns/gun_s", --
	right_claw_model			= "models/weapons/crab/crab_hand_r", -- "mapskit/maps/event/paper_airplanes/guns/gun_s", --
	---left_claw_model				= "models/weapons/gun_18/gun_18",
	---right_claw_model			= "models/weapons/gun_18/gun_18",
	
	death_blast_wave_clone 		= "BlastWave_FakeShip",  -- #37141
	focus_timeout				= 10,  --#62917     Пассивные модули - деминишенги фокуса
	
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ] = "main",
		[ ai.VesselCustomSlot.CHILD_1 ] = "add_object",
		--[ ai.VesselCustomSlot.CHILD_2 ] = "add_object1",
		--[ ai.VesselCustomSlot.CHILD_3 ] = "add_object2",
		--[ ai.VesselCustomSlot.CHILD_4 ] = "add_object3",
		--[ ai.VesselCustomSlot.CHILD_5 ] = "add_object4",
	},
	
	--детали зеленого инженера
	scrap_def = "Bonus_GreenEngineerScrap",
	max_foreign_drones = 2,
	
	-- возможность взрывать отделяющиеся модули/дроны, скидывать корабли с платформ, добавлено от SC-113432
	module_additional_cmd_progress_sound = "sound/game/gameplay_progressbar",
}


--
Def.Ship_Small = 
{
	inherit		=	"Ship_Base",
	model 		= 	"models/ships/race_1/s/race1_s_t1",
	physics		=	{ solid_type = solid.model, mass = 500, material = "ShipMetalMk1", },
	ship_class	=	ai.ShipClass.SMALL,
	signature	=	ai.Signature.SMALL,

	
	behavior_type_AI = 0,
	cam_config = "cam_ship_small",
	
--	shopCategory 		= "SHIPS",
--	shopSubCategory 	= "SMALL",

	contact_damage_min_speed	= 4, -- Минимальная скорость, на которой начинает учитываться урон  (#0012166)
	contact_damage_cf			= 100, -- Коэффициент перевода скорости в урон корпусу (простое умножение этого числа на длину вектора столкновения)
	
	death_blast_wave = "SmallShipExplodeBlastWave", --взрыв от смерти
	death_wreck = "Wreck_R1_S",				-- прототип обломка корабля 
	death_effect = "particles/explosions/shp_exp_small_02",
	--death_effect = "particles/empty",
	--death_effect = "particles/explosions/shp_exp_big_8march", -- #59880
	rcs_effect = "particles/ships/ship_rcs",
	crit_self_effect_plasma = "",
	crit_self_effect_railgun = "",
	
	
	weapon_slots = 2,
	--	fire_sector_incline = -20,
	--	fire_sectors = { 2, 2, 2, 2, 2, 1, 2, 1, 1, 1 },
	--
	fire_sector_incline = -45,
	fire_sectors = { 2, 1, 1, 0, 2, 0, 1, 0, 0, 0 }, --wiki/Cosmmos:SectorOfFire  
	--fire_sector_incline = -35,
	--fire_sectors = { 2, 1, 1, 2, 2, 0, 1, 1, 1, 1 }, --#0109673 --wiki/Cosmmos:SectorOfFire
	-- small bot { 2, 1, 1, 0, 1, 0, 2, 0, 0, 0 },
	-- med bot {4, 2, 2, 0 ,2, 1,  2, 1, 1, 0 }
	-- sniper bot {6, 2, 2, 0 ,4, 2, 6, 2, 2, 0 }
	
	death_sound	=	"sound/explosion/ship_expl",

	broken_parts = 
	{
		[ 1 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 10.0, speed_deviation = 15, speed_inherit = 1.0, ttl = 7, },
		[ 2 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 10.0, speed_deviation = 15, speed_inherit = 1.0, ttl = 7, },
	},
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Plasmagun_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "Module_MicroWarp",
	},
	
	cpu_grades = designers.cpu_small_grades, 		--линейные апгрейды компьютера.
	armor_grades = designers.armor_small_grades,
	shield_grades = designers.shield_small_grades,
	capacitor_grades = designers.capacitor_small_race1_grades, --это переопределяется так как привязано к расам
	engine_grades = designers.engine_small_race1_grades, --это переопределяется так как привязано к расам
	
	hangarIco  = "ship_SMALL",
	
	--Общий бонус малых кораблей. Хочется сделать бонус крита, но крит сделать возможности нет, пока.
	--Получается что у малого корабля "как будто" 3 пухи.
	--laser_damage_mul 	= 0.50,
	--plasma_damage_mul 	= 0.50,
	--railgun_damage_mul 	= 0.50,
	
	
	-- несбиваемый варп.
	special_module_mode = true,
	--время до следующего респавна после смерти этого корабля
	spawn_timeout = 13,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 20.1, 	-- максимальная скорость (в м/с) 
	acceleration 					= 17.7, 	-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,  		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.8,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.2,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 12,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 48,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 65,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 8,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.8,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 14,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 15,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.8,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 13*0.7*1.25,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 19,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 19,
	decel_x							= 7,
	max_yspeed						= 13*0.7*1.25,
	accel_y0						= 19,
	accel_y1						= 19,
	decel_y							= 7,
	
	rot_xmaxspeed					= 102,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 140*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 85*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 200*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 102,
	rotaccel_y0						= 140*2,
	rotaccel_y1						= 85*2,
	rotdecel_y						= 200*2,
	rot_zmaxspeed					= 78,
	rotaccel_z0						= 150*2,
	rotaccel_z1						= 150*2,
	rotdecel_z						= 500*2,
	
	----------------------------------------------------------------------------------------
	--			CPU
	----------------------------------------------------------------------------------------
	lock_time 						= 2, --1,
	vision_radius					= 300,
	shield_radius 					= 2.1213, -- расчитано как 1/2 силуэта штурмовика. (sqrt(3*3/2))
	
	--children = {{ def = "Ship_FxTest", joint = "root" },}
	
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ] = "main",
		[ ai.VesselCustomSlot.CHILD_1 ] = "add_object",
		[ ai.VesselCustomSlot.CHILD_2 ] = "add_object1",
		[ ai.VesselCustomSlot.CHILD_3 ] = "add_object2",
		--[ ai.VesselCustomSlot.CHILD_4 ] = "add_object3",
		--[ ai.VesselCustomSlot.CHILD_5 ] = "add_object4",
	},
}

Def.Ship_Small_Glass = 
{
	inherit		=	"Ship_Small",
	
	max_rearspeed					= 6,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.6,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 2,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 10,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.3,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
}	

Def.Ship_Small_CorV2 = 
{
	inherit							= "Ship_Small",
	death_blast_wave_clone 		= "Blastwave_CorV32",
}

Def.Ship_Small_Pilum = 
{
	inherit							= "Ship_Small",
	shield_radius 					= 2.5, -- расчитано как 1/2 силуэта штурмовика. (sqrt(3*3/2))
}	

Def.Ship_Small_Psiloy = 
{
	inherit							= "Ship_Small",
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ] = "main",
		[ ai.VesselCustomSlot.CHILD_1 ] = "add_object",
		[ ai.VesselCustomSlot.CHILD_2 ] = "add_object1",
		[ ai.VesselCustomSlot.CHILD_3 ] = "add_object2",
		--[ ai.VesselCustomSlot.CHILD_4 ] = "add_object3",
		--[ ai.VesselCustomSlot.CHILD_5 ] = "add_object4",
	},
}	

-- кристаллоперехватчик
Def.Ship_Small_Crystall = 
{
	inherit							= "Ship_Small",
	armor_grades 					= designers.armor_grades_greenS,
	vision_radius					= 400,

	max_speed 						= 20.1, 	-- максимальная скорость (в м/с) 
	acceleration 					= 17.7, 	-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.8,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.3,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 12,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 48,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 65,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 8,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.8,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 14,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 15,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.8,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 10,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 19,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 19,
	decel_x							= 7,
	max_yspeed						= 10,
	accel_y0						= 19,
	accel_y1						= 19,
	decel_y							= 7,
	
	rot_xmaxspeed					= 102,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 140*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 85*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 200*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 102,
	rotaccel_y0						= 140*2,
	rotaccel_y1						= 85*2,
	rotdecel_y						= 200*2,
	rot_zmaxspeed					= 80*0.9,
	rotaccel_z0						= 150*2,
	rotaccel_z1						= 150*2,
	rotdecel_z						= 500*2,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
	},
	shield_radius 					= 3.14,
}

Def.Ship_Small_CrystallRecon = 
{
	inherit							= "Ship_Small_Crystall",
	physics		=	{ solid_type = solid.model, mass = 800, material = "ShipMetalMk1", },
	vision_radius					= 300,
}	

-- Перехватчик от спирали
Def.Ship_Race1_L_T4_CraftUniq_small = 
{
	inherit							= "Ship_Small",
	model							= "models/ships/race_1/s/r1_s_spiral",
	capacitor_grades				= designers.capacitor_small_r1t4_craftUniq,
	engine_grades					= designers.engine_r1_t4s_craftUniq,
	
	default_custom_elements =
	{
		[ai.VesselCustomSlot.MATERIAL_0] = "Default_Race1_l_spiral_r",
		[ai.VesselCustomSlot.MATERIAL_1] = "Default_Race1_l_spiral_g",
		[ai.VesselCustomSlot.MATERIAL_2] = "Default_Race1_l_spiral_b",
	},
	customization_groups = 
	{
		[ ai.VesselCustomSlot.MATERIAL_0 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_1 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_2 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MPRESET_0 ] = {VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.LINES},
	},
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 			= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 			= "active_up_2",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]			= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_03 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_04 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_05 ]			= "root",
	},
	default_modules = 
	{
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	= ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_SpaceShift",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_SmallSpiralMine",
		[ ai.SpaceShipModuleSlot.SPECIAL ]			= "Module_VesselSwitchBack",
	},
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ] = ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_1 ] = ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_2 ] = ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_3 ] = ai.DONT_INHERIT,
	},
	ship_name				= "Ship_Race1_L_T4_CraftUniq",
	rank					= 10,
	role					= ai.ShipRoles.SCOUT,
	beacon_capture_mul		= 0.35,
	-- item_subtype			= ItemSubtype.Ship,
	energy_regen			= 1.87,
	energy_max				= 275,
	race					= ai.Race.EMPIRE,
	hull_resist_emp			= 45,
	hull_resist_kinetic		= -15,
	hull_resist_thermal		= 15,
	hull_health				= 5205,
	shield_resist_thermal	= 0,
	shield_resist_kinetic	= 30,
	shield_resist_emp		= -30,
	shield_regen			= 98.4,
	shield_max				= 3100,
	item_lvl				= 22.5,
	shield_max				= 3100,
	cargo_hold_size			= 3,
	max_speed				= 46,
	is_reserve_spaceship	= true,
}

Def.Ship_Race3_M_T5_CraftUniq_small = 
{
	inherit							= "Ship_Small",
	model							= "models/ships/race_3/m/tornado/r3_m_tornado_one",
	capacitor_grades				= designers.capacitor_medium_r3_t5_craftuniq,
	engine_grades					= designers.engine_medium_r3_t5_craftuniq,
	armor_grades					= designers.armor_grades_federation,
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "root",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "root",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]			= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_03 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_04 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_05 ]			= "root",
	},
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ]				= "root",
		[ ai.VesselCustomSlot.CHILD_1 ]				= "add_object",
		[ ai.VesselCustomSlot.CHILD_2 ]				= "add_object1",
		[ ai.VesselCustomSlot.CHILD_3 ]				= "add_object2",
	},
	default_custom_elements =
	{
		[ai.VesselCustomSlot.MATERIAL_0] = "Default_Race3_m_tornado_r",
		[ai.VesselCustomSlot.MATERIAL_1] = "Default_Race3_m_tornado_g",
		[ai.VesselCustomSlot.MATERIAL_2] = "Default_Race3_m_tornado_b",
	},
	customization_groups = 
	{
		[ ai.VesselCustomSlot.MATERIAL_0 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_1 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_2 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MPRESET_0 ] = {VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.LINES},
	},
	default_modules = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_ReserveShipSwitch",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_ReserveShipOrder",
		[ ai.SpaceShipModuleSlot.SPECIAL ]			= "Module_VesselSwitchBack_Double",
	},
	ship_name					= "Ship_Race3_M_T5_CraftUniq",
	rank						= 16,
	role						= ai.ShipRoles.SCOUT,
	race						= ai.Race.SPECIAL,
	beacon_capture_mul			= 0.35,
	energy_regen				= 5.542/2,
	energy_max					= 815/2,
	hull_resist_emp				= 45,
	hull_resist_kinetic			= -15,
	hull_resist_thermal			= 15,
	hull_health					= 5698/2,
	shield_resist_thermal		= 0,
	shield_resist_kinetic		= 30,
	shield_resist_emp			= -30,
	shield_regen				= 125.2/2,
	shield_max					= 6078/2,
	item_lvl					= 22.5,
	shield_max					= 3100,
	cargo_hold_size				= 3,
	max_speed					= 35*1.5,
	is_reserve_spaceship		= true,
	contact_damage_cf			= 10,
	damage_mul 					= 0.15,
}

Def.Ship_Race3_M_T5_CraftUniq_small_2 = 
{
	inherit							= "Ship_Race3_M_T5_CraftUniq_small",
	model							= "models/ships/race_3/m/tornado/r3_m_tornado_second",
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ]				= ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_1 ]				= ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_2 ]				= ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_3 ]				= ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_4 ]				= "add_object1",
		[ ai.VesselCustomSlot.CHILD_5 ]				= "add_object2",
	},
}


--
Def.Ship_Medium = 
{
	inherit		=	"Ship_Base",
	model 		= "models/ships/race_1/m/race1_m_t3",
	physics		=	{ solid_type = solid.model, mass = 1000, material = "ShipMetalMk2", },
	ship_class	=	ai.ShipClass.MEDIUM,
	signature	=	ai.Signature.MEDIUM,

	
	behavior_type_AI = 0,
	cam_config = "cam_ship_medium_imp",

	shopCategory 		= "SHIPS",
	shopSubCategory 	= "MEDIUM",

	contact_damage_min_speed	= 3,
	contact_damage_cf			= 100,
	
	death_blast_wave = "MediumShipExplodeBlastWave", --взрыв от смерти
	death_wreck = "Wreck_R1_M",				-- прототип обломка корабля 
	death_effect = "particles/explosions/shp_exp_mid_02",
	--death_effect = "particles/explosions/shp_exp_big_8march", -- #59880
	rcs_effect = "particles/ships/ship_rcs",
	crit_self_effect_plasma = "",
	crit_self_effect_railgun = "",
	
	death_sound	=	"sound/explosion/ship_expl",
	
	broken_parts = 
	{
		[ 1 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 20.0, speed_deviation = 15, speed_inherit = 1.3, ttl = 7, },
		[ 2 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 20.0, speed_deviation = 15, speed_inherit = 1.3, ttl = 7, },
		[ 3 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 20.0, speed_deviation = 15, speed_inherit = 1.3, ttl = 7, },
		[ 4 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 20.0, speed_deviation = 15, speed_inherit = 1.3, ttl = 7, },
	},
	
	fire_sector_incline = -20,
	fire_sectors = { 4, 2, 2, 2, 4, 1, 4, 2, 2, 1, },

	weapon_slots = 4,    
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Railgun_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "Module_CloakingDevice",
		--[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "Module_TimeBoost_T1_Mk1",
	},
   
	cpu_grades 		 	= designers.cpu_medium_grades, 		--линейные апгрейды компьютера.
	armor_grades 		= designers.armor_medium_grades,
	shield_grades 		= designers.shield_medium_grades,
	capacitor_grades 	= designers.capacitor_medium_race1_grades,   --это переопределяется так как привязано к расам
	engine_grades 		= designers.engine_medium_race1_grades,   --это переопределяется так как привязано к расам
	
	hangarIco  = "ship_MEDIUM",
	
	-- несбиваемая невидимость.
	special_module_mode = true,
	--время до следующего респавна после смерти этого корабля
	spawn_timeout = 15,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 17, 		-- максимальная скорость (в м/с) 
	acceleration 					= 9,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,	  	-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.8,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.2,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 22,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 90,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 110,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 7,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.85,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 9,		-- 10 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 9,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.9,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 10*0.7*1.25,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 15,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 15,
	decel_x							= 6,
	max_yspeed						= 10*0.7*1.25,
	accel_y0						= 15,
	accel_y1						= 15,
	decel_y							= 6,
	
	rot_xmaxspeed					= 72,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 80*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 65*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 120*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 72,
	rotaccel_y0						= 80*2,
	rotaccel_y1						= 65*2,
	rotdecel_y						= 120*2,
	rot_zmaxspeed					= 66,
	rotaccel_z0						= 100*2,
	rotaccel_z1						= 100*2,
	rotdecel_z						= 500*2,
	
	----------------------------------------------------------------------------------------
	--			CPU
	----------------------------------------------------------------------------------------
	lock_time 						= 2, --1.75,
	vision_radius					= 250,
	
	shield_radius 					= 3,
	--children = {{ def = "Ship_FxTest", joint = "root" },}
	
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ] = "main",
		[ ai.VesselCustomSlot.CHILD_1 ] = "add_object",
		[ ai.VesselCustomSlot.CHILD_2 ] = "add_object1",
		[ ai.VesselCustomSlot.CHILD_3 ] = "add_object2",
		[ ai.VesselCustomSlot.CHILD_4 ] = "add_object3",
		[ ai.VesselCustomSlot.CHILD_5 ] = "add_object4",
	},
}

-- кристаллоштурмовик Атака
Def.Ship_Medium_Crystall = 
{
	inherit			= "Ship_Medium",
	armor_grades 	= designers.armor_grades_greenM,
	cpu_grades		= designers.cpu_green_grades,
	vision_radius					= 300,
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 17, 		-- максимальная скорость (в м/с) 
	acceleration 					= 7,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 1.5,		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.8,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.4,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 22,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 90,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 100,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 7,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.85,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 8,		-- 10 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 9,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.9,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 8.75,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 15,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 15,
	decel_x							= 6,
	max_yspeed						= 8.75,
	accel_y0						= 15,
	accel_y1						= 15,
	decel_y							= 6,
	
	rot_xmaxspeed					= 67,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 80*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 65*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 250,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 67,
	rotaccel_y0						= 80*2,
	rotaccel_y1						= 65*2,
	rotdecel_y						= 250,
	rot_zmaxspeed					= 67,
	rotaccel_z0						= 100*2,
	rotaccel_z1						= 100*2,
	rotdecel_z						= 250,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
	},
}

Def.Ship_Medium_Crystall_Command = --- кристаллоштурмовик Клмандник
{
	inherit			= "Ship_Medium",
	armor_grades 	= designers.armor_grades_greenM,
	cpu_grades		= designers.cpu_green_grades,
	vision_radius					= 300,
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 17, 		-- максимальная скорость (в м/с) 
	acceleration 					= 7,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 1.5,		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.8,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.4,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 22,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 90,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 100,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 7,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.85,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 8,		-- 10 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 9,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.9,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 8.75,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 15,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 15,
	decel_x							= 6,
	max_yspeed						= 8.75,
	accel_y0						= 15,
	accel_y1						= 15,
	decel_y							= 6,
	
	rot_xmaxspeed					= 67,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 80*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 65*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 250,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 67,
	rotaccel_y0						= 80*2,
	rotaccel_y1						= 65*2,
	rotdecel_y						= 250,
	rot_zmaxspeed					= 67,
	rotaccel_z0						= 100*2,
	rotaccel_z1						= 100*2,
	rotdecel_z						= 250,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
	},
	
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ] = "main",
		[ ai.VesselCustomSlot.CHILD_1 ] = "add_object",
		-- [ ai.VesselCustomSlot.CHILD_2 ] = "add_object1",
		-- [ ai.VesselCustomSlot.CHILD_3 ] = "add_object2",
		-- [ ai.VesselCustomSlot.CHILD_4 ] = "add_object3",
		-- [ ai.VesselCustomSlot.CHILD_5 ] = "add_object4",
	},
}

Def.Ship_Medium_Persey = 
{
	inherit		=	"Ship_Medium",
	fire_sector_incline = 0,
	rocket_launch_vel = Vec3(0, 5, 0),
	
}	

Def.Ship_Medium_Glass = 
{
	inherit		=	"Ship_Medium",
	
	max_rearspeed					= 4,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.6,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 2,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 5,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.3,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
}	
--
Def.Ship_Large = 
{
	inherit		=	"Ship_Base",
	model 		= "models/ships/race_1/l/race1_l_t3",
	physics		=	{ solid_type = solid.model, mass = 2000, material = "ShipMetalMk3", },
	ship_class	=	ai.ShipClass.LARGE,
	signature	=	ai.Signature.LARGE,
	
	
	shopCategory 		= "SHIPS",
	shopSubCategory 	= "LARGE",

	cam_config = "cam_ship_large_imp",

	contact_damage_min_speed	= 2,
	contact_damage_cf			= 100,
	
	death_blast_wave = "LargeShipExplodeBlastWave", --взрыв от смерти
	death_wreck = "Wreck_R1_L",			-- прототип обломка корабля 
	behavior_type_AI = 1,
	fire_dispersion_AI = 2.1,

	death_effect = "particles/explosions/shp_exp_big_02",
	--death_effect = "particles/explosions/shp_exp_big_8march", -- #59880
	rcs_effect = "particles/ships/ship_rcs",
	crit_self_effect_plasma = "",
	crit_self_effect_railgun = "",
	death_sound	=	"sound/explosion/ship_big_expl",
	
	broken_parts = 
	{
		[ 1 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 27.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 2 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 27.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 3 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 27.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 4 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 27.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 5 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 27.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 6 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 360, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 27.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
	},

	fire_sector_incline = -20,
	--fire_sectors = { 6, 3, 3, 2, 6, 2, 4, 2, 2, 2, }, --before 2013g
	fire_sectors = { 6, 2, 2, 1, 2, 1, 2, 1, 1, 1, },
	
	weapon_slots = 6,
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Laser_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "Module_Disintegrator",
	},

	cpu_grades 	 		= designers.cpu_large_grades, 		--линейные апгрейды компьютера.
	armor_grades 		= designers.armor_large_grades,
	shield_grades 		= designers.shield_large_grades,
	capacitor_grades 	= designers.capacitor_large_race1_grades,  --это переопределяется так как привязано к расам
	engine_grades 		= designers.engine_large_race1_grades, --это переопределяется так как привязано к расам
	
	-- раскомментировать если вместо клешней будут включатся пушки бумажных самолетиков
	--left_claw_model				= "mapskit/maps/event/paper_airplanes/guns/gun_l",
	--right_claw_model			= "mapskit/maps/event/paper_airplanes/guns/gun_l",
	
	hangarIco  			= "ship_LARGE",	
	
	--время до следующего респавна после смерти этого корабля
	spawn_timeout = 17,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 12, 		-- максимальная скорость (в м/с) 
	acceleration 					= 5.5,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.8,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.2,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 32,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 130,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 130,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 4,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.95,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 0.3,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 5.7,		-- 8 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 5.7,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 1,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 7*0.7*1.25,	-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 9,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 10,
	decel_x							= 3,
	max_yspeed						= 7*0.7*1.25,
	accel_y0						= 9,
	accel_y1						= 10,
	decel_y							= 3,
	
	rot_xmaxspeed					= 30,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 20*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 15*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 50*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 30,
	rotaccel_y0						= 20*2,
	rotaccel_y1						= 15*2,
	rotdecel_y						= 50*2,
	rot_zmaxspeed					= 36,
	rotaccel_z0						= 25*2,
	rotaccel_z1						= 25*2,
	rotdecel_z						= 500*2,
	
	----------------------------------------------------------------------------------------
	--			CPU
	----------------------------------------------------------------------------------------
	lock_time 						= 2,
	vision_radius					= 200,
	spell_approach_radius_coef		= 1.5,
	loot_radius_coef				= 1.5,
	
	shield_radius 					= 6, --4 площади силуэта штурмовика ( sqrt(4*(3*3)) )
	
	--children = {{ def = "Ship_FxTest", joint = "root" },}
	
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ] = "main",
		[ ai.VesselCustomSlot.CHILD_1 ] = "add_object",
		[ ai.VesselCustomSlot.CHILD_2 ] = "add_object1",
		[ ai.VesselCustomSlot.CHILD_3 ] = "add_object2",
		[ ai.VesselCustomSlot.CHILD_4 ] = "add_object3",
		[ ai.VesselCustomSlot.CHILD_5 ] = "add_object4",
	},
}

Def.Ship_Large_Tank = 
{
	inherit		=	"Ship_Large",
	fire_sectors = { 4, 2, 2, 1, 2, 1, 2, 1, 1, 1, },
	weapon_slots = 4,
}

Def.Ship_Large_Glass = 
{
	inherit		=	"Ship_Large",
	
	--max_rearspeed					= 1.5,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.4,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 0.2,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 1.7,		-- 8 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 0.5,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 1,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
}

Def.Ship_LargeTank_Glass = 
{
	inherit		=	"Ship_Large_Tank",
	
	--max_rearspeed					= 1.5,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.4,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 0.2,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 1.7,		-- 8 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 0.5,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 1,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
}		

Def.Ship_Large_Salamander = 
{
	inherit		=	"Ship_Large_Tank",
	shield_radius = 7.5,
}


Def.Ship_Large_Carolingian = 
{
	inherit		=	"Ship_Large",
	use_huge_ship_control = true,
	shield_radius = 7.5,
	weapon_selection_angle = true,
	fire_sectors		= { 3, 6, 6, 3, 3, 3, 3, 6, 6, 3, },

	signature	=	ai.Signature.LARGE,	
	vision_radius					= 300,
	spell_approach_radius_coef		= 3,
	loot_radius_coef				= 3,
	weapon_slots 		= 6,
}

Def.Ship_Large_Helios = 
{
	inherit		=	"Ship_Large",
	model		= "models/ships/race_1/l/race1_l_helios/race1_l_helios",
	weapon_slots = 6,
	slot_bones 					= 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "rocket",

 		--[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "root",
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "root",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "root",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "root",

		-- [ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "capacitor",--
		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "capacitor",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "wings_right",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "wings_left",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "bottom",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "rocket", --root
		
 		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD] 	 = "root",		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.CPU_MOD ]			 = "root",	
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD ]	 	 = "root",
	},
}

-- кристаллофрегат
Def.Ship_Large_Crystall = 
{
	armor_grades 	= designers.armor_grades_greenL,
	--inherit		=	"Ship_Large",
	inherit			=	"Ship_Large_Tank",
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
	},
	cam_config				= "cam_ship_large_fed",
	max_speed				= 17,
	acceleration			= 4.9,
	boost_accel_coef		= 2,
	boost_maxspeed_coef		= 1.3,
	boost_energy_cost		= 32,
	boost_energy_min		= 120,
	decel_afterburning		= 5,
	rotdecel_x				= 110,
	rotdecel_y				= 110,
	
	
	rot_xmaxspeed					= 30*0.9,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 20*2*0.9,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 15*2*0.9,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 100,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 30*0.9,
	rotaccel_y0						= 20*2*0.9,
	rotaccel_y1						= 15*2*0.9,
	rotdecel_y						= 100,
	rot_zmaxspeed					= 36*0.9,
	rotaccel_z0						= 25*2*0.9,
	rotaccel_z1						= 25*2*0.9,
	rotdecel_z						= 500*2*0.9,
}

Def.Ship_HUGE = 
{
	inherit				=	"Ship_Large",
	ship_class	=	ai.ShipClass.HUGE,

	signature	=	ai.Signature.HUGE,
	--fire_sectors		= { 8, 4, 4, 3, 4, 2, 4, 2, 2, 2, }, --wiki/Cosmmos:SectorOfFire
	--fire_sectors		= { 6, 8, 8,  3,  4,  2, 4,  8, 8, 2, },  -- на лайве с выхода 
	fire_sectors		= { 6, 8, 8, 2, 3, 2, 4, 5, 5, 2, }, -- 	#60284  --планирую 9го выпустить на лайв.
	weapon_slots 		= 12,
	weapon_selection_angle = true,
	crowd_control_coef 	= 1.33,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	= "rocket",
		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "capacitor",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "capacitor", --root
		
 		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] 	= "root",		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]		= "root",	
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "root",
	},
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Railgun_Huge_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	= "Module_SectorShield_Base",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	= "Module_EnergyReroute",--"Module_PhaseShield_Raid", --"Module_EnergyReroute",
--		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_PushRay", --"Module_TRay",
--		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_TRay",  --Module_Turret -- Module_GravyAnomaly
--		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_Teleporter",
--		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_RocketSilo",
		
	},	
	--default_rocket_munition 						= "MunitionSectorShield",
	
	model 		= "models/ships/race_1/h/r1_h_t1",
		
	cpu_grades 	 		= designers.cpu_large_grades, 		--линейные апгрейды компьютера.
	armor_grades 		= designers.armor_large_grades,
	shield_grades 		= designers.shield_large_grades,
	capacitor_grades 	= designers.capacitor_huge_r1_t3,  --это переопределяется так как привязано к расам
	engine_grades 		= designers.engine_huge_r1_t3, --это переопределяется так как привязано к расам
    death_wreck 		= "Wreck_R1_XL",			-- прототип обломка корабля 
	death_effect = "particles/empty",
	
	physics		=	{ solid_type = solid.model, mass = 50000, material = "ShipMetalMk1", },
	
	hull_health						= 30000,
	shield_max						= 14000,
	energy_max						= 10000,
	energy_regen 					= 7,

	hangarIco 						= "icon_error",
	default_icon					= "icon_error",	
	hangarIcoSmall 					= "icon_error",	
	
	--время до следующего респавна после смерти этого корабля
	spawn_timeout 					= 60,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 13, 		-- максимальная скорость (в м/с) 
	acceleration 					= 1,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 5,		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 1.2,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.2,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 200,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 250,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 350,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 4,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.95,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 0.0,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 5.7,		-- 8 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 1,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 1,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 1,	-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 1,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 1,
	decel_x							= 1,
	max_yspeed						= 1,
	accel_y0						= 1,
	accel_y1						= 1,
	decel_y							= 1,
	
	rot_xmaxspeed					= 11,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 10,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 10,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 20,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 11,
	rotaccel_y0						= 10,
	rotaccel_y1						= 10,
	rotdecel_y						= 20,
	rot_zmaxspeed					= 18,
	rotaccel_z0						= 10,
	rotaccel_z1						= 10,
	rotdecel_z						= 10,
	
	spawn_warp_speed 				= 200, -- #58780
	
	----------------------------------------------------------------------------------------
	--			CPU
	----------------------------------------------------------------------------------------
	lock_time 						= 3,
	vision_radius					= 300,
	spell_approach_radius_coef		= 3,
	loot_radius_coef				= 3,
	
	shield_radius 					= 13, 
	weakness_area_radius			= 100, --#71262: Механика мёртвой зоны для эсминцев --#0083939
	weakness_area_damage_coef		= 2.5, --#0083939   -- 15.11.19 решили что слишком много эсмов damage_coef 2.15->3 --31.03.20 баланс от игроков, теперь 2.5
	
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ] = "main",
		[ ai.VesselCustomSlot.CHILD_1 ] = "add_object",
		[ ai.VesselCustomSlot.CHILD_2 ] = "add_object1",
		[ ai.VesselCustomSlot.CHILD_3 ] = "add_object2",
		[ ai.VesselCustomSlot.CHILD_4 ] = "add_object3",
		[ ai.VesselCustomSlot.CHILD_5 ] = "add_object4",
	},
}

-- кристалло"эсминец"
Def.Ship_Huge_Crystall = 
{
	
	inherit			=	"Ship_HUGE",
	--cam_config				= "cam_ship_large_fed",
	model			= "models/ships/race_5/h/t5_h_t1_ev0",
	armor_grades 					= designers.armor_grades_greenH,
	vision_radius					= 350,

	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 12, 		-- максимальная скорость (в м/с) 
	acceleration 					= 1.5,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 6,		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 1.2,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.4,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 250,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 300,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 350,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 5,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.95,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 0.0,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 3.7,		-- 8 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 1,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 1,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 1,	-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 1,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 1,
	decel_x							= 1,
	max_yspeed						= 1,
	accel_y0						= 1,
	accel_y1						= 1,
	decel_y							= 1,
	
	rot_xmaxspeed					= 13,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 10,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 10,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 20,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 13,
	rotaccel_y0						= 10,
	rotaccel_y1						= 10,
	rotdecel_y						= 20,
	rot_zmaxspeed					= 18,
	rotaccel_z0						= 10,
	rotaccel_z1						= 10,
	rotdecel_z						= 20,
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
	},
}

Def.Saturn_Huge = 
{
	inherit = "Ship_HUGE",
	
	vision_radius					= 300,
	armor_grades 					= designers.armor_grades_federation,	
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
	},
}
Def.Ship_UFO = 
{
	inherit = "Ship_Large",
	model = "models/ships/race_3/l/r3_l_megalodon",
	cam_config = "cam_ship_large_imp",
	ship_class	=	ai.ShipClass.HUGE,
	
	fire_sectors		= { 4, 4, 4, 4, 4, 2, 2, 2, 2, 2, },
	
	max_speed 						= 30, 		-- максимальная скорость (в м/с) 
	acceleration 					= 60,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,	  	-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 1,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.1,		-- множитель увеличения максимальной линейной скорости (1.2)
	boost_energy_cost				= 22,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 90,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 110,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 30,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.85,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 100,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 150,		-- 10 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 180,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.9,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 25,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 50,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 30,
	decel_x							= 30,
	max_yspeed						= 15,
	accel_y0						= 10,
	accel_y1						= 10,
	decel_y							= 30,
	
	rot_xmaxspeed					= 23, --30,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 80*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 65*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 120*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 120,
	rotaccel_y0						= 250,
	rotaccel_y1						= 190,
	rotdecel_y						= 190,
	rot_zmaxspeed					= 23,--30,
	rotaccel_z0						= 100*2,
	rotaccel_z1						= 100*2,
	rotdecel_z						= 500*2,

	hull_health						= 20000,
	shield_max						= 20000,
	energy_max						= 10000,
}

Def.Ship_UFO2 = 
{
	class = "UfoShip",
	inherit = "Ship_Large",
	model = "models/ships/specialships/ship_ufo/ship_ufo",
	cam_config = "cam_ship_ufo",
	ship_class	=	ai.ShipClass.LARGE,
	weapon_selection_angle = true,
	weapon_slots = 8,
	fire_sectors		= { 4, 4, 4, 4, 2, 2, 4, 4, 4, 4, },
	fire_sector_incline = 0,
	
	max_speed 						= 18, 		-- максимальная скорость (в м/с) 
	acceleration 					= 48,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,	  	-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 1,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.1,		-- множитель увеличения максимальной линейной скорости (1.2)
	boost_energy_cost				= 32,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 90,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 110,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 18,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.85,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 3,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 150,		-- 10 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 48,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.9,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 18,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 30,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 15,
	decel_x							= 3,
	max_yspeed						= 18,
	accel_y0						= 30,
	accel_y1						= 15,
	decel_y							= 3,
	
	rot_xmaxspeed					= 50,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 120,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 120,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 65,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 120,
	rotaccel_y0						= 250,
	rotaccel_y1						= 190,
	rotdecel_y						= 100,
	rot_zmaxspeed					= 50,
	rotaccel_z0						= 120,
	rotaccel_z1						= 120,
	rotdecel_z						= 65,

	hull_health						= 20000,
	shield_max						= 20000,
	energy_max						= 10000,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
		[ ai.SpaceShipModuleSlot.SPECIAL ]			= "root",
	},
	-- default_rocket_munition 						= "SpaceMissile_Kinetic_T5_Mk1",
	default_modules = 
	{
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]		= "Weapon_RocketLauncher",
	}
}

Def.Ship_UFOBall = 
{
	class = "UfoShip",
	inherit = "Ship_Medium",
	--model = "models/ships/specialships/ship_ufo/ship_ufo",
	cam_config = "cam_ship_ufo",
	ship_class	=	ai.ShipClass.MEDIUM,
	weapon_selection_angle = true,
	weapon_slots = 8,
	fire_sectors		= { 4, 4, 4, 4, 2, 2, 4, 4, 4, 4, },
	fire_sector_incline = 0,
	
	max_speed 						= 35, 		-- максимальная скорость (в м/с) 
	acceleration 					= 25,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,	  	-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 1,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.1,		-- множитель увеличения максимальной линейной скорости (1.2)
	boost_energy_cost				= 32,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 90,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 110,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 35,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.85,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 3,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 150,		-- 10 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 25,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.9,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 35,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 25,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 25,
	decel_x							= 3,
	max_yspeed						= 35,
	accel_y0						= 25,
	accel_y1						= 25,
	decel_y							= 3,
	
	rot_xmaxspeed					= 120,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 400,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 400,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 400,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 120,
	rotaccel_y0						= 400,
	rotaccel_y1						= 400,
	rotdecel_y						= 400,
	rot_zmaxspeed					= 120,
	rotaccel_z0						= 400,
	rotaccel_z1						= 400,
	rotdecel_z						= 400,

	hull_health						= 20000,
	shield_max						= 20000,
	energy_max						= 10000,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		--[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		--[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
	--	[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
	--	[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
	--	[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
	--	[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
		[ ai.SpaceShipModuleSlot.SPECIAL ]			= "root",
	},
	-- default_rocket_munition 						= "SpaceMissile_Kinetic_T5_Mk1",
	default_modules = 
	{
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]		= "Weapon_RocketLauncher",
	}
}

Def.Ship_UFOBall_Brawl = 
{
	inherit = "Ship_UFOBall",
	death_wreck="Wreck_UFOBall",
	model="models/ships/specialships/ship_ball/ship_ball",
	capacitor_grades=designers.capacitor_l_ufoball,
	engine_grades=designers.engine_m_ufoball,
	role = ai.ShipRoles.TACKLER,
	race = ai.Race.FEDERATION,
	ship_class=ai.ShipClass.MEDIUM,
	rank					= 11,
	
	contact_damage_min_speed	= 4,
	contact_damage_cf		= 400,
	boost_energy_cost_per_second = 10,
	
	hull_resist_kinetic 	 = 0,
	hull_resist_emp			 = 0,
	hull_resist_thermal		 = 0,
	hull_health				 = 10000,
	
	shield_max				= 10000,	
	shield_resist_kinetic	= 0,
	shield_resist_emp 		= 0,
	shield_resist_thermal	= 0,	
	vision_radius_mul		= 40,	
	
	energy_max				= 1000,
	energy_regen			= 1.46,	
	
	max_speed						= 80,
	acceleration 					= 15,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 1,	  	-- множитель увеличения линейного ускорения	
	max_rearspeed					= 80,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 1,		-- множитель экспоненты для расчета ускорения в зависимости от текущей
	reverse_accel					= 15,		-- ускорение активного торможения (в м/с/c) 
	max_xspeed						= 80,
	decel_x							= 15,	
	max_yspeed						= 80,
	decel_y							= 15,	
	
	deceleration					= 8,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 8,
	
	rot_xmaxspeed					= 250,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 800,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 800,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 800,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 250,
	rotaccel_y0						= 800,
	rotaccel_y1						= 800,
	rotdecel_y						= 800,
	rot_zmaxspeed					= 250,
	rotaccel_z0						= 800,
	rotaccel_z1						= 800,
	rotdecel_z						= 800,
	
	
	
	default_modules = {
			[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "", --_T5_Epic
			
			

			[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "",			
			[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "",		
			[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "", -- Module_NoCooldown_st
			[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "", --Module_HullDevastator_st 
			[ ai.SpaceShipModuleSlot.SPECIAL ] 			= "", 		
			},

	
	default_rocket_munition 						= "",
	
	default_custom_elements = 

	{		
		 [ ai.VesselCustomSlot.MATERIAL_0 	] 	= "Default_r5_m_unique_r1",
		 [ ai.VesselCustomSlot.MATERIAL_1 	] 	= "Default_r5_m_unique_g1",
		 [ ai.VesselCustomSlot.MATERIAL_2 	] 	= "Default_r5_m_unique_b1",
		-- [ ai.VesselCustomSlot.CHILD_1 		] 	= "BP22_Water",
		-- -- [ ai.VesselCustomSlot.SKIN_0 		] 	= "unique",
	}, 	
}

Def.Ship_Salyut = 
{
	inherit = "Ship_Small",
	
	lock_time  = 1,
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
		[ ai.SpaceShipModuleSlot.SPECIAL ]			= "root",
	},
}

Def.Ship_Helicon = 
{
	inherit = "Ship_Large",
	
	weapon_slots = 6,
	lock_time  = 2,
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",
		[ ai.SpaceShipModuleSlot.SPECIAL ]			= "fx",
	},
}

Def.Ship_FxTest = 
{
	class = "EffectEntity",
	effect = "particles/gadget/speed_adaptation",
	in_editor	= false,
}

Def.Ship_Small_Pirate = 
{
	inherit				= "Ship_Small",
	--boost_rot_coef 			= 0.8*0.35,	-- 0.8 множитель к максимальной скорости поворота во время буста 
	--boost_maxspeed_coef		= 1.8,		-- 1.8 множитель увеличения максимальной линейной скорости 
	--deceleration				= 0.5,		-- 1.5 ускорение пассивного торможения (в м/с/c) 
	--max_xspeed				= 13*0.5,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	--max_yspeed				= 13*0.5,
}

Def.Ship_Medium_Pirate = 
{
	inherit				= "Ship_Medium",
	--boost_rot_coef 			= 0.8*0.35,	-- 0.8 множитель к максимальной скорости поворота во время буста 
	--boost_maxspeed_coef		= 1.8,		-- 1.8 множитель увеличения максимальной линейной скорости 
	--deceleration				= 0.3,		-- 1 ускорение пассивного торможения (в м/с/c) 
	--max_xspeed				= 10*0.5,	-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	--max_yspeed				= 10*0.5,
}

Def.Ship_Medium_Bark = 
{
	inherit				= "Ship_Medium",
	
	weapon_selection_angle = true,
	--fire_sectors		= { 4, 2, 2, 0, 2, 2, 2, 0, 0, 0, },
	fire_sectors		= { 4, 0, 0, 1, 1, 0, 4, 0, 0, 0, },
	
	--boost_rot_coef 			= 0.8*0.35,	-- 0.8 множитель к максимальной скорости поворота во время буста 
	--boost_maxspeed_coef		= 1.8,		-- 1.8 множитель увеличения максимальной линейной скорости 
	--deceleration				= 0.3,		-- 1 ускорение пассивного торможения (в м/с/c) 
	max_xspeed				= 1,	-- максимальная скорость стрэйфа влево/вправо (в м/с)	
	max_yspeed				= 1,

	slot_bones 					= 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "rocket",


		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "capacitor",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "shooter", --root
		
 		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD] 	 = "root",		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.CPU_MOD ]			 = "root",	
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD ]	 	 = "root",
	},


	
	max_xspeed				= 1,	-- максимальная скорость стрэйфа влево/вправо (в м/с)	
	max_yspeed				= 1,
	
	rot_xmaxspeed					= 92,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 300*1.2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 300*1.2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 300*1.2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	
	rot_ymaxspeed					= 92,
	rotaccel_y0						= 300*1.2,
	rotaccel_y1						= 300*1.2,
	rotdecel_y						= 300*1.2,
	
	rot_zmaxspeed					= 92,
	rotaccel_z0						= 300*1.2,
	rotaccel_z1						= 300*1.2,
	rotdecel_z						= 1000*1.2,
}

Def.Ship_Medium_Chaos = 
{
	inherit				= "Ship_Medium_Bark",
	
	fire_sectors		= { 4, 0, 0, 1, 1, 0, 4, 0, 0, 1, },	
	
	slot_bones 					= 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "rocket",


		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "capacitor",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "shooter", --"shooter", --root
		
 		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD] 	 = "root",		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.CPU_MOD ]			 = "root",	
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD ]	 	 = "root",
	},
}	

Def.Ship_Small_Ace = 
{
	inherit				= "Ship_Small",

	max_xspeed				= 1,	-- максимальная скорость стрэйфа влево/вправо (в м/с)	
	max_yspeed				= 1,
	
	fire_sectors		= { 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, },
	
	rot_xmaxspeed					= 110,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 300*1.2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 300*1.2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 300*1.2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	
	rot_ymaxspeed					= 130,
	rotaccel_y0						= 300*1.2,
	rotaccel_y1						= 300*1.2,
	rotdecel_y						= 300*1.2,
	
	rot_zmaxspeed					= 130,
	rotaccel_z0						= 300*1.2,
	rotaccel_z1						= 300*1.2,
	rotdecel_z						= 1000*1.2,

}

Def.Ship_Large_Hallas = 
{
	inherit				= "Ship_Large_Tank",
	
	fire_sectors		= { 4, 0, 0, 0, 0, 0, 4, 0, 0, 0, },
	--boost_rot_coef 			= 0.8*0.35,	-- 0.8 множитель к максимальной скорости поворота во время буста 
	--boost_maxspeed_coef		= 1.8,		-- 1.8 множитель увеличения максимальной линейной скорости 
	--deceleration				= 0.3,		-- 1 ускорение пассивного торможения (в м/с/c) 
	max_xspeed				= 1,	-- максимальная скорость стрэйфа влево/вправо (в м/с)	
	max_yspeed				= 1,

	slot_bones 					= 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "rocket",


		-- [ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "capacitor",--
		-- [ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		-- [ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		-- [ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		-- [ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		--[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "shooter", --root
		
 		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD] 	 = "root",		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.CPU_MOD ]			 = "root",	
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD ]	 	 = "root",
	},
	
	rot_xmaxspeed					= 92,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 300*1.2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 300*1.2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 300*1.2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	
	rot_ymaxspeed					= 92,
	rotaccel_y0						= 300*1.2,
	rotaccel_y1						= 300*1.2,
	rotdecel_y						= 300*1.2,
	
	rot_zmaxspeed					= 92,
	rotaccel_z0						= 300*1.2,
	rotaccel_z1						= 300*1.2,
	rotdecel_z						= 1000*1.2,
}

Def.Ship_Large_Pirate_Tank = 
{
	inherit				= "Ship_Large_Tank",
	--boost_rot_coef 			= 0.8*0.35,	-- 0.8 множитель к максимальной скорости поворота во время буста 
	--boost_maxspeed_coef		= 1.8,		-- 1.8 множитель увеличения максимальной линейной скорости 
	--deceleration				= 0.1,		-- 0.3 ускорение пассивного торможения (в м/с/c) 
	--max_xspeed				= 7*0.5,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	--max_yspeed				= 7*0.5,
}


Def.Ship_Large_Precursor = 
{
	inherit				=	"Ship_Large",
	signature		= ai.Signature.HUGE,
	fire_sectors		= { 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, }, --вперед+вверх + впере+низ + назад+верх + назад+низ  wiki/Cosmmos:SectorOfFire
	--fire_sectors		= { 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, }, --вперед+вверх + впере+низ 
	weapon_slots 	= 1,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun_1",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "gun_1",

 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "gun_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "gun_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "gun_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "gun_1",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "capacitor",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "fx1", --root
		
 		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD] 	 = "root",		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.ARMOR_MOD ]		 = "root",
		--[ ai.SpaceShipModuleSlot.CPU_MOD ]			 = "root",	
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD ]	 	 = "root",
	},
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Laser_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	= "Module_Disintegrator",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Pulsar_Alien",
	},	
	
	model 		= "models/objects/ships_huge/prec_ship/prec_ship",
	
	
	
	capacitor_grades 	= designers.capacitor_alien_grades,
	engine_grades 		= designers.engine_alien_grades, --это переопределяется так как привязано к расам
	
	physics		=	{ solid_type = solid.model, mass = 50000, material = "ShipMetalMk1", },
	
	hull_health						= 75000,	--- 100000 --125000,
	shield_max						= 45000,	--- 50000 --75000,
	energy_max						= 10000,
	max_speed 						= 19,
	boost_maxspeed_coef				= 1.1,		--- 1.2
	shield_radius					= 16,
	hangarIco 						= "icon_error",
	default_icon					= "icon_error",	
	hangarIcoSmall 					= "icon_error",
	
	death_wreck 		= "models/misc/invisible_model",
	death_effect 		= "particles/explosions/alien_explosion_huge_01",
}


Def.Ship_Biomorph_Large = 
{
	inherit				=	"Ship_Large",
	fire_sectors = { 6, 2, 2, 1, 2, 1, 2, 1, 1, 1, }, --вперед+вверх + впере+низ + назад+верх + назад+низ  wiki/Cosmmos:SectorOfFire
	weapon_slots 	= 6,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "fx_1",

 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "root",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "main",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "fx_1", --root
		
	},
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Laser_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	= "Module_Disintegrator",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Pulsar_Alien",
	},	
	
	capacitor_grades 	= designers.capacitor_alien_r2_m_grades,  --это переопределяется так как привязано к расам
	engine_grades 		= designers.engine_alien_kiber_grades, --это переопределяется так как привязано к расам
	
	children=
	{
		{ def = "PrecBiomorphEngine", joint = "fx_1"}, 
	},
	
	--left_claw_model				= "models/weapons/crab/crab_hand_l",
	--right_claw_model			= "models/weapons/crab/crab_hand_r",
	
	model 		= "models/ships/race_2/l/race2_l_t5_precursor",
	physics		=	{ solid_type = solid.model, mass = 3000, material = "ShipMetalMk1", },
	
	hull_health						= 25000,	-- #51205
	shield_max						= 25000,	-- #51205
	energy_max						= 10000,
	max_speed 						= 12,
	boost_maxspeed_coef				= 1.2,
	shield_radius					= 6,
	hangarIco 						= "icon_error",
	default_icon					= "icon_error",	
	hangarIcoSmall 					= "icon_error",
	
	death_wreck 		= "models/misc/invisible_model",
	death_effect 		= "particles/explosions/alien_explosion_small_01",
}

Def.Ship_Precursor_Predator = 
{
	inherit				=	"Ship_Large_Precursor",
	signature		= ai.Signature.HUGE,
	--fire_sectors		= { 2, 0, 0, 1, 0, 0, 1, 0, 0, 1, }, --вперед+вверх + впере+низ + назад+верх + назад+низ  wiki/Cosmmos:SectorOfFire
	fire_sectors		= { 2, 1, 1, 1, 0, 0, 1, 1, 1, 1, }, --вперед+вверх + впере+низ + назад+верх + назад+низ  wiki/Cosmmos:SectorOfFire
	weapon_slots 	= 2,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "gun_2",

 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "root",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "root",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "root",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "root",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "engine",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "fx_1", --root
	},
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Laser_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	= "Module_Disintegrator",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Pulsar_Alien",
	},	
	
	capacitor_grades 	= designers.capacitor_alien_grades,
	engine_grades 		= designers.engine_alien_predator_grades, --это переопределяется так как привязано к расам
	
	--left_claw_model				= "models/weapons/crab/crab_hand_l",
	--right_claw_model			= "models/weapons/crab/crab_hand_r",

	model 		= "models/objects/ships_huge/prec_predator/prec_predator",
	
	physics		=	{ solid_type = solid.model, mass = 50000, material = "ShipMetalMk1", },
	
	hull_health						= 75000,	---100000 125000,
	shield_max						= 45000,	---50000 75000,
	energy_max						= 10000,
	max_speed 						= 19,
	boost_maxspeed_coef				= 1.1,		---1.2
	shield_radius					= 11,
	hangarIco 						= "icon_error",
	default_icon					= "icon_error",	
	hangarIcoSmall 					= "icon_error",	
	death_wreck 		= "models/misc/invisible_model",
	death_effect 		= "particles/explosions/alien_explosion_big_01",
	
	children=
	{
		{ def = "PrecPredatorEngine1", joint = "fx_1"},
		{ def = "PrecPredatorEngine2", joint = "fx_2"},
	},
}

Def.Ship_Manta = 
{
	inherit				=	"Ship_Precursor_Predator",  --Ship_Precursor_Predator

	physics			= { solid_type = solid.model, mass = 50000, material = "ShipMetalMk1",  },
	--physics		=	{ solid_type = solid.model, mass = 50000, material = "ShipMetalMk1", },
	--physics = {	mass = 3000, material = "ShipMetalMk3", solid_type = solid.compound_model, },
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "gun_2",

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "engine",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "fx_1", --root
	},
	shield_radius 		=21,
}


Def.Ship_Precursor_Interceptor = 
{
	inherit				=	"Ship_Small",
	fire_sectors		= { 4, 2, 2, 2, 4, 1, 4, 2, 2, 1, }, --вперед+вверх + впере+низ + назад+верх + назад+низ  wiki/Cosmmos:SectorOfFire
	weapon_slots 	= 4,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "gun_2",

 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "gun_1", --"engine",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "gun_2", --"engine",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "gun_3", --"engine",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "gun_4",--"engine",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "engine",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "fx1", --root
	},
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Laser_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	= "Module_Disintegrator",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Pulsar_Alien",
	},	
	
	capacitor_grades 	= designers.capacitor_alien_grades,
	engine_grades 		= designers.engine_alien_interceptor_grades, --это переопределяется так как привязано к расам
	
	children=
	{
		{ def = "PrecInterceptorEngine", joint = "fx1"}, 
		{ def = "PrecInterceptorGun", joint = "gun_1"}, 
		{ def = "PrecInterceptorGun", joint = "gun_2"}, 
		{ def = "PrecInterceptorGunSmall", joint = "gun_3"}, 
		{ def = "PrecInterceptorGunSmall", joint = "gun_4"}, 
		{ def = "PrecInterceptorGunSmall", joint = "gun_5"}, 
		{ def = "PrecInterceptorGunSmall", joint = "gun_6"},
	},
	
	--left_claw_model				= "models/weapons/crab/crab_hand_l",
	--right_claw_model			= "models/weapons/crab/crab_hand_r",

	model 		= "models/objects/ships_huge/prec_interceptor/prec_interceptor",
	
	physics		=	{ solid_type = solid.model, mass = 50000, material = "ShipMetalMk1", },
	
	hull_health						= 20000,	--- 25000 #51205
	shield_max						= 20000,	--- 25000 #51205
	energy_max						= 10000,
	max_speed 						= 19,
	boost_maxspeed_coef				= 1.1,		--- 1.2
	shield_radius					= 10,
	hangarIco 						= "icon_error",
	default_icon					= "icon_error",	
	hangarIcoSmall 					= "icon_error",	
	
	death_wreck 		= "models/misc/invisible_model",
	death_effect 		= "particles/explosions/alien_explosion_big_01",
}

Def.Ship_Precursor_Interceptor_Big = 
{
	inherit				=	"Ship_Large",
	--fire_sectors		= { 4, 2, 2, 2, 4, 1, 4, 2, 2, 1, }, --вперед+вверх + впере+низ + назад+верх + назад+низ  wiki/Cosmmos:SectorOfFire
	--weapon_slots 	= 4,
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "gun_2",

 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "gun_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "gun_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "gun_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "gun_4",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "engine",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "fx1", --root
	},
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Laser_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	= "Module_Disintegrator",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_Pulsar_Alien",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_HealEntity",
	},	
	
	capacitor_grades 	= designers.capacitor_alien_grades,
	engine_grades 		= designers.engine_alien_interceptor_big_grades, --это переопределяется так как привязано к расам
	
	children=
	{
		{ def = "PrecInterceptorEngineBig", joint = "fx1"},
		{ def = "PrecInterceptorGun", joint = "gun_1"}, 
		{ def = "PrecInterceptorGun", joint = "gun_2"}, 
		{ def = "PrecInterceptorGun", joint = "gun_3"}, 
		{ def = "PrecInterceptorGun", joint = "gun_4"}, 
		{ def = "PrecInterceptorGun", joint = "gun_5"}, 
		{ def = "PrecInterceptorGun", joint = "gun_6"},
	},
	
	--left_claw_model				= "models/weapons/crab/crab_hand_l",
	--right_claw_model			= "models/weapons/crab/crab_hand_r",

	model 		= "models/objects/ships_huge/prec_interceptor/prec_interceptor_big",
	
	physics		=	{ solid_type = solid.model, mass = 50000, material = "ShipMetalMk1", },
	
	hull_health						= 60000,	--- 25000 #51205
	shield_max						= 60000,	--- 25000 #51205
	energy_max						= 30000,
	max_speed 						= 17,
	boost_maxspeed_coef				= 1.0,		--- 1.2
	shield_radius					= 14,
	hangarIco 						= "icon_error",
	default_icon					= "icon_error",	
	hangarIcoSmall 					= "icon_error",	
	
	death_wreck 		= "models/misc/invisible_model",
	death_effect 		= "particles/explosions/alien_explosion_huge_01",
}

Def.Ship_TestA = 
{
	inherit		= "Ship_Preset_R2_L_T1_Premium",
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_OrbGunUnique",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_PulsarShield",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_ThermalUnlock",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 			= "Module_ClusterTorpedo",
	}
}

Def.Ship_Test_ = 
{
	inherit		= "Ship_Huge_Crystall",	
	ui_name 	= "TestShip",
	rank 		= 15,
	hull_health						= 212000,
	
	
	
	--test
--[[ 	ship_class	=	ai.ShipClass.SMALL,
	signature	=	ai.Signature.SMALL, ]]
	--swarm_damage_mul = 1,
	--swarm_speed_mul  = 1,
	--swarm_health_mul = 1,
	--swarm_regen_add =  1000,
	--swarm_regen_add =  1000,
	
	--model 		= "models/ships/race_1/l/race1_l_t5_premium",
	cam_config  = "cam_ship_huge",
	
	engine_grades =  designers.engine_huge_r5_t3,
	capacitor_grades 								= designers.capacitor_huge_race5_rank9,
	--engine_grades 									= designers.engine_huge_r1_t3, 
	
	--hull_health										= 11111,
	--shield_max										= 1100,
	--energy_max										= 950,
	--energy_regen 									= 6.46,
	--shield_regen									= 0.0,

	death_effect = "particles/explosions/shp_exp_big_02",
	--death_effect = "particles/explosions/shp_exp_big_8march", -- #59880

	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ENGINE_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.SHIELD_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_01]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_02]		= "root",
		[ai.SpaceShipModuleSlot.ARMOR_MOD_03]		= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]	= "root",
		[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]	= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "root",
		[ai.SpaceShipModuleSlot.CPU_MOD_03]			= "root",

	},
	
	default_modules =
	{
		--[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Cold_Ray",
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_SwarmCloud_T4_Epic",
--"Weapon_Grab", --"Weapon_LaserHeal_T5_Epic", -- "Weapon_Nanobots_Cloud_T5_Epic", -- "Weapon_LaserHeal_T5_Epic", --"Weapon_Cold_Ray",
		--[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "Weapon_Radiation_Beam_T4_Mk1",
		

		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "Module_DestrBeamDrone",--"Module_TestDestructible",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "Module_DevastatorGun",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "Module_SwarmControl_T4_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "Module_CageJump",--Module_LandingPlatform_T4_Rel",
		--[ ai.SpaceShipModuleSlot.SPECIAL ] 			= "Module_Swarm", --"Module_FrigateDrone_T4_LowRes", --"Module_ShieldWall", -- "Module_FrigateDrone_T5_UniqRay", --"Module_ShieldWall",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_AdaptiveForceField_T3_Mk1",
		
	--	[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]	= "ModulePassive_PassiveArmor_T5_Epic",
	--	[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]	= "ModulePassive_PassiveArmor_T5_Epic",
	--	[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]	= "ModulePassive_PassiveArmor_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "Module_AdaptiveForceField_T3_Mk1",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]	= "Module_AdaptiveForceField_T3_Mk1",
		--[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]	= "Module_AdaptiveForceField_T3_Mk3",

		--[ ai.SpaceShipModuleSlot.CAPACITOR ]	= "Module_TestDestructible",
--		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "Module_DamageSpeed_T5_set1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "Module_CmplxBatt_T5_Epic",
		--[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "Module_CmplxBatt_T5_Epic",
		
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "Module_DoomBoost_T3_Mk1",
--		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]	= "Module_SafeBoost_T5_set1",
		--[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]	= "",
	},
	default_rocket_munition 						= "DestrMunition_HealBot_T4_Mk3",-- "DestrMunition_SectorShield_T4_Mk3", --DestrMunition_HealBot_T4_Mk3", --"MunitionSectorShield",-- "DestrHealBot", 

	
	default_custom_elements = 
	{		
		[ ai.VesselCustomSlot.MATERIAL_0 ] 			= "Default_Race1_Imp_1",
		[ ai.VesselCustomSlot.MATERIAL_1 ] 			= "Default_Race1_Imp_2",
		[ ai.VesselCustomSlot.MATERIAL_2 ] 			= "Default_Race1_Imp_3",
	}, 
	
	--max_speed 										= 70,
	--boost_maxspeed_coef								= 1.2,
	
	special_grades = 
	{
		[ 1 ] = { max_speed_mul = 0.1, },
		[ 2 ] = { hull_health_mul = 1.0, },
		[ 3 ] = { shield_max_mul = 1.0, railgun_damage_mul = 1.0, },
		[ 4 ] = { energy_max_mul = 0.5, plasma_projectile_speed_mul = 1.0, },
		[ 5 ] = { spell_ecm_duration_mul = 1.0, },
		[ 6 ] = { module_ecm_energy_cost_mul = -1.0, },
	},
	--shield_radius 									= 4,
	
	vision_radius_mul = 4

} 

Def.Ship_Test_Wolfhound={
    contact_damage_min_speed=3,
    contact_damage_cf=120,
    min_hull_damage_for_death=0.31,
    max_hull_damage_for_death=0.33,
    cargo_hold_size=5,
    repair_cost=200000,
    role=ai.ShipRoles.ATTACK,
    mastery_bonus=2.2,
    base_preset="Ship_Race3_M_T5_Wolfhound_Preset1",
    rank=16,
    ship_class=ai.ShipClass.MEDIUM,
    inherit="Ship_Medium_Pirate",
    energy_regen=5.712,
    energy_max=840,
    shield_max=5000,
    shield_regen=127.5,
    shield_resist_kinetic=30,
    shield_resist_emp=-30,
    shield_resist_thermal=0,
    hull_health=5280,
    hull_resist_kinetic=-15,
    hull_resist_emp=45,
    hull_resist_thermal=15,
    max_speed=29.47032,
    boost_energy_cost_per_second=175.2,
    death_wreck="Wreck_R3_M",
    race=ai.Race.FEDERATION,
    default_custom_elements={
        [ai.VesselCustomSlot.MATERIAL_0]="Default_Race3_m_wolfhound_r",
        [ai.VesselCustomSlot.MATERIAL_1]="Default_Race3_m_wolfhound_g",
        [ai.VesselCustomSlot.MATERIAL_2]="Default_Race3_m_wolfhound_b",
    },
    customization_groups={
        [ ai.VesselCustomSlot.MATERIAL_0 ]={VesselCustomElementsGroups.DEFAULT},
        [ ai.VesselCustomSlot.MATERIAL_1 ]={VesselCustomElementsGroups.DEFAULT},
        [ ai.VesselCustomSlot.MATERIAL_2 ]={VesselCustomElementsGroups.DEFAULT},
        [ ai.VesselCustomSlot.MPRESET_0 ]={VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.LINES},
    },
    cam_config="cam_ship_medium_oculus_up",
    model="models/ships/race_3/m/r3_m_t4_wolfhound",
    hangarIco="Race3_M_T5_wolfhound",
    default_icon="shopIco_Ship_Race3_M_T5_wolfhound",
    hangarIcoSmall="Race3_M_T5_wolfhound_small",
    item_subtype=ItemSubtype.Ship,
    slot_bones={
        [ai.SpaceShipModuleSlot.ACTIVE_01]="active_up_1",
        [ai.SpaceShipModuleSlot.ACTIVE_02]="active_up_2",
        [ai.SpaceShipModuleSlot.ACTIVE_03]="active_up_3",
        [ai.SpaceShipModuleSlot.ACTIVE_04]="active_up_4",
        [ai.SpaceShipModuleSlot.SHIELD_MOD_01]="root",
        [ai.SpaceShipModuleSlot.SHIELD_MOD_02]="root",
        [ai.SpaceShipModuleSlot.ARMOR_MOD_01]="root",
        [ai.SpaceShipModuleSlot.ARMOR_MOD_02]="root",
        [ai.SpaceShipModuleSlot.ENGINE_MOD_01]="root",
        [ai.SpaceShipModuleSlot.ENGINE_MOD_02]="root",
        [ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]="root",
        [ai.SpaceShipModuleSlot.CPU_MOD_01]="root",
        [ai.SpaceShipModuleSlot.CPU_MOD_02]="root",
        [ai.SpaceShipModuleSlot.SPECIAL]="special",
    },
    special_slots=6,
    max_craft_slots=-1,
    cpu_grades=designers.cpu_medium_grades,
    armor_grades=designers.armor_grades_federation,
    shield_grades=designers.shield_grades,
    capacitor_grades=designers.capacitor_medium_r3_t4_wolfhound,
    engine_grades=designers.engine_medium_r3_t4_wolfhound,
    default_modules={
        [ ai.SpaceShipModuleSlot.SPECIAL ]="Module_RocketWolfhound"
    },
    need_level_to_open=7,
    max_speed_mul=0.1,
}

Def.Ship_Medium_Turrel = 
{
	inherit =  "Ship_Medium",
	fire_sector_incline = 0,
	fire_sectors = { 4, 2, 2, 4, 4, 4, 4, 2, 2, 4, }, --вперед+вверх + впере+низ + назад+верх + назад+низ  wiki/Cosmmos:SectorOfFire
}

Def.Ship_Small_CrystallDroneBot = 
{
	inherit			= "Ship_Base",
	model 			= "models/objects/ships_huge/prec_ship/prec_drone2",
	
	physics			= { solid_type = solid.model, material = "ShipMetalMk1", mass = 1000, },
	ship_class		= ai.ShipClass.SMALL,
	signature		= ai.Signature.SMALL,

	behavior_type_AI = 0,
	cam_config = "cam_ship_small",
	
--	shopCategory 		= "SHIPS",
--	shopSubCategory 	= "SMALL",

	contact_damage_min_speed	= 4, -- Минимальная скорость, на которой начинает учитываться урон  (#0012166)
	contact_damage_cf			= 100, -- Коэффициент перевода скорости в урон корпусу (простое умножение этого числа на длину вектора столкновения)
	
	death_effect		= "particles/explosions/objects/alien_explosion",
	death_sound			= "sound/explosion/drone_expl",

	trail_effect 			= "particles/ships/ship_trail",
	trail_color 			= "4 95 184 100",
	trail_size 				= 0.05,
	
	uiName 					= "DroidAlien_name",

	weapon_slots = 1,

	fire_sector_incline = -45,
	fire_sectors = { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 }, --wiki/Cosmmos:SectorOfFire  
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "tail4", -- падает на руте и майне
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "root",

 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "tail1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "tail1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "tail1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "tail1",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "root",
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "root",
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "root",
	},
	
	default_modules =
	{
		--[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "Weapon_RocketLauncher",

		--[ ai.SpaceShipModuleSlot.CPU ] 				 = "Module_ComputerMk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "Module_Capacitor_Base",
		--[ ai.SpaceShipModuleSlot.SHIELD ] 			 = "ModuleShield_Base",
		--[ ai.SpaceShipModuleSlot.ARMOR  ] 			 = "ModuleArmor_Base",
	},
	
	
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Plasmagun_Basic_T1_Mk0",
		--[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "Module_MicroWarp",
	},
	
	--[[
	cpu_grades = designers.cpu_small_grades, 		--линейные апгрейды компьютера.
	armor_grades = designers.armor_small_grades,
	shield_grades = designers.shield_small_grades,
	capacitor_grades = designers.capacitor_small_race1_grades,
	]]--

	engine_grades =
	{
		{ "ModuleEngine_CrystallDroneBot", 0 },
		{ "ModuleEngine_CrystallDroneBot", 50000 },
		{ "ModuleEngine_CrystallDroneBot", 150000 },
		{ "ModuleEngine_CrystallDroneBot", 250000 },
		{ "ModuleEngine_CrystallDroneBot", 350000 },
		{ "ModuleEngine_CrystallDroneBot", 500000 },
	},
	
	--laser_damage_mul 	= 0.50,
	--plasma_damage_mul 	= 0.50,
	--railgun_damage_mul 	= 0.50,
	
	
	-- несбиваемый варп.
	special_module_mode = true,
	--время до следующего респавна после смерти этого корабля
	spawn_timeout = 13,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 20.1, 	-- максимальная скорость (в м/с) 
	acceleration 					= 17.7, 	-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,  		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.8,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.2,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 12,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 48,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 65,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 8,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.8,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 14,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 15,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.8,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 13*0.7*1.25,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 19,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 19,
	decel_x							= 7,
	max_yspeed						= 13*0.7*1.25,
	accel_y0						= 19,
	accel_y1						= 19,
	decel_y							= 7,
	
	rot_xmaxspeed					= 102,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 140*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 85*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 200*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 102,
	rotaccel_y0						= 140*2,
	rotaccel_y1						= 85*2,
	rotdecel_y						= 200*2,
	rot_zmaxspeed					= 78,
	rotaccel_z0						= 150*2,
	rotaccel_z1						= 150*2,
	rotdecel_z						= 500*2,
	
	----------------------------------------------------------------------------------------
	--			CPU
	----------------------------------------------------------------------------------------
	lock_time 						= 2, --1,
	vision_radius					= 300,
	shield_radius 					= 2.1213, -- расчитано как 1/2 силуэта штурмовика. (sqrt(3*3/2))
	energy_regen 					= 3,
	energy_max 						= 300,
	shield_regen 					= 100,
	shield_resist_kinetic 			= 45,
	shield_resist_emp 				= -30,
	shield_resist_thermal 			= 0,
	hull_resist_kinetic 			= -30,
	hull_resist_emp 				= 45,
	hull_resist_thermal 			= 0,
	max_speed						= 40,
	damage_mul 						= 1, -- x2 урона так как пушка 1
	hull_health						= 8000,
	shield_max						= 4000,
}

Def.Ship_Small_CrystallDroneBot2 =   
{
	inherit			= "Ship_Small_CrystallDroneBot",
	model 			= "models/objects/green_drones/dron_shooter",
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "fire_01", -- падает на руте и майне
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "fire_01",

 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "fx1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "fx1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "fx1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "fx1",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "root",
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "root",
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "root",
	},
}

--models/objects/ships_huge/freighter_imper/freighter_imper
Def.Ship_Huge_FreighterTest =   
{
	inherit			= "Ship_Base",
	model 			= "models/objects/ships_huge/freighter_imper/freighter_imper", --не поворачивает из за конкретно этой модели, возможно надо анимации крена?
	object_tag 		= ai.ObjectTag.TRANSPORT,
	--model 			= "models/objects/ships_huge/prec_ship/prec_drone2",
	
	--physics			= { solid_type = solid.model, material = "ShipMetalMk1", mass = 100000, },
	--physics			= { solid_type = solid.compound_model, material = "ShipMetalMk1", mass = 100000, },
	physics			= { solid_type = solid.box, material = "ShipMetalMk1", mass = 100000, },
	
	ship_class		= ai.ShipClass.HUGE,
	signature		= ai.Signature.HUGE,

	behavior_type_AI = 0,
	cam_config  = "cam_ship_huge",
	
--	shopCategory 		= "SHIPS",
--	shopSubCategory 	= "SMALL",

	contact_damage_min_speed	= 4, -- Минимальная скорость, на которой начинает учитываться урон  (#0012166)
	contact_damage_cf			= 100, -- Коэффициент перевода скорости в урон корпусу (простое умножение этого числа на длину вектора столкновения)
	
	death_effect		= "particles/explosions/objects/alien_explosion",
	death_sound			= "sound/explosion/drone_expl",

	trail_effect 			= "particles/ships/ship_trail",
	trail_color 			= "4 95 184 100",
	trail_size 				= 0.05,
	
	uiName 					= "DroidAlien_name",

	weapon_slots = 4,

	fire_sector_incline = -45,
	fire_sectors = { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 }, --wiki/Cosmmos:SectorOfFire  
	
	slot_bones = 
	{
--		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "tail4", -- падает на руте и майне
		--[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "root",

--[[  		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "root",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "root",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = "root",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = "root",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "root",
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root", ]]
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "exhaust_1",
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "root",
	},
	
	default_modules =
	{
		--[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "Weapon_RocketLauncher",

		--[ ai.SpaceShipModuleSlot.CPU ] 				 = "Module_ComputerMk1",
		--[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "Module_Capacitor_Base",
		--[ ai.SpaceShipModuleSlot.SHIELD ] 			 = "ModuleShield_Base",
		--[ ai.SpaceShipModuleSlot.ARMOR  ] 			 = "ModuleArmor_Base",
	},
	
	
	
	default_modules =
	{
--		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "Weapon_Plasmagun_Basic_T1_Mk0",
		--[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "Module_MicroWarp",
	},
	
	--[[
	cpu_grades = designers.cpu_small_grades, 		--линейные апгрейды компьютера.
	armor_grades = designers.armor_small_grades,
	shield_grades = designers.shield_small_grades,
	capacitor_grades = designers.capacitor_small_race1_grades,
	]]--

	engine_grades =
	{
		{ "ModuleEngine_CrystallDroneBot", 0 },
		{ "ModuleEngine_CrystallDroneBot", 50000 },
		{ "ModuleEngine_CrystallDroneBot", 150000 },
		{ "ModuleEngine_CrystallDroneBot", 250000 },
		{ "ModuleEngine_CrystallDroneBot", 350000 },
		{ "ModuleEngine_CrystallDroneBot", 500000 },
	},
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 10.1, 	-- максимальная скорость (в м/с) 
	acceleration 					= 17.7, 	-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 2,  		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 0.8,		-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.2,		-- множитель увеличения максимальной линейной скорости 
	boost_energy_cost				= 12,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 48,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 65,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 8,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.8,		-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 1.5,		-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 14,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 15,		-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.8,		-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 4,		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 19,		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 19,
	decel_x							= 7,
	max_yspeed						= 4,
	accel_y0						= 19,
	accel_y1						= 19,
	decel_y							= 7,
	
	rot_xmaxspeed					= 50,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 140*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 85*2,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 200*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 50,
	rotaccel_y0						= 140*2,
	rotaccel_y1						= 85*2,
	rotdecel_y						= 200*2,
	rot_zmaxspeed					= 45,
	rotaccel_z0						= 150*2,
	rotaccel_z1						= 150*2,
	rotdecel_z						= 500*2,
	
	----------------------------------------------------------------------------------------
	--			CPU
	----------------------------------------------------------------------------------------
	lock_time 						= 2, --1,
	vision_radius					= 300,
	shield_radius 					= 2.1213, -- расчитано как 1/2 силуэта штурмовика. (sqrt(3*3/2))
	energy_regen 					= 3,
	energy_max 						= 300,
	shield_regen 					= 100,
	shield_resist_kinetic 			= 45,
	shield_resist_emp 				= -30,
	shield_resist_thermal 			= 0,
	hull_resist_kinetic 			= -30,
	hull_resist_emp 				= 45,
	hull_resist_thermal 			= 0,
	--max_speed						= 40,
	hull_health						= 8000,
	shield_max						= 4000,
}

Def.Ship_Race1_M_T2_Decor_Test =
{
	inherit		= "Ship_Race1_M_T2",
	storeItemId	= 0,
	ui_name 	= "TestShip",
	
	model		= "models/ships/race_1/m/race1_m_t2m2_test_for_5_decor_places",
	
	--[[default_custom_elements = 
	{		
		[ ai.VesselCustomSlot.MATERIAL_0 ] 			= "Default_Race1_Imp_1",
		[ ai.VesselCustomSlot.MATERIAL_1 ] 			= "Default_Race1_Imp_2",
		[ ai.VesselCustomSlot.MATERIAL_2 ] 			= "Default_Race1_Imp_3",
	}, ]]--
}

-- SC-111788 Сделать тестовый корабль с тестовыми модулями, для облегчения тестов оружия\модулей и регрессионок
Def.Ship_ST = 
{
	inherit							= "Ship_Base",
	base_preset						= "Ship_ST_Preset1",

	--#################### STATIC_PARAMETERS ####################--
	
	race							= ai.Race.SPECIAL,
	required_fleet_power			= 1,
	
	rcs_effect						= "particles/ships/ship_rcs",
	crit_self_effect_plasma			= "",
	crit_self_effect_railgun		= "",
	
	broken_parts					= {},
	
	repair_cost						= 1,
	
	isPremium						= true,
	item_lvl						= 27,
	rank							= 1,
	
	spawn_timeout					= 3,
	
	item_subtype					= ItemSubtype.Ship,
	ship_name						= "Ship_SuperTest",
	
	--armor_grades 					= designers.armor_grades,
	--shield_grades 				= designers.shield_grades,
	
	hull_health						= 100000,
	hull_regen_add					= 0,
	hull_resist_kinetic				= 0,
	hull_resist_emp					= 0,
	hull_resist_thermal				= 0,
	
	shield_max						= 100000,
	shield_regen					= 0,
	shield_resist_kinetic			= 0,
	shield_resist_emp				= 0,
	shield_resist_thermal			= 0,
	shield_radius 					= 6,
	
	energy_max						= 2000,
	energy_regen					= 100/28.5,
	
	vision_radius					= 10000,
	lock_time						= 2,
	spell_approach_radius_coef		= 3,
	loot_radius_coef				= 3,
	
	max_speed 						= 40, 		-- максимальная скорость (в м/с) 
	acceleration 					= 10,		-- базовое ускорение разгона (в м/с/c) 
	boost_accel_coef				= 1.1,	  		-- множитель увеличения линейного ускорения 
	boost_rot_coef 					= 1.1,			-- множитель к максимальной скорости поворота во время буста 
	boost_maxspeed_coef				= 1.1,			-- множитель увеличения максимальной линейной скорости (1.2)
	boost_energy_cost				= 0,			-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 100,			-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 10,			-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 10,		-- максимальная скорость при движении назад (в м/с) 
	accel_decay						= 0.85,			-- множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> ) 
	deceleration					= 10,			-- ускорение пассивного торможения (в м/с/c) 
	decel_afterburning				= 40,			-- 10 ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 6,			-- ускорение активного торможения (в м/с/c) 
	revaccel_decay					= 0.8,			-- ??? множитель экспоненты для расчета ускорения в зависимости от текущей линейной скорости.    <мгновенное ускорение> = <acceleration> * Exp( -<нормализованная скорость> * <accel_decay> )  ???
	
	max_xspeed						= 10,			-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 50,			-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 30,
	decel_x							= 30,
	max_yspeed						= 10,
	accel_y0						= 10,
	accel_y1						= 10,
	decel_y							= 30,
	
	rot_xmaxspeed					= 100,			-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 80*2,			-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 65*2,			-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 120*2,		-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 100,
	rotaccel_y0						= 250,
	rotaccel_y1						= 190,
	rotdecel_y						= 190,
	rot_zmaxspeed					= 100,
	rotaccel_z0						= 100*2,
	rotaccel_z1						= 100*2,
	rotdecel_z						= 500*2,
	
	default_custom_elements =
	{
		[ ai.VesselCustomSlot.MATERIAL_0 ] = "Default_Premium_r1_i1",
		[ ai.VesselCustomSlot.MATERIAL_1 ] = "Default_Premium_r1_i2",
		[ ai.VesselCustomSlot.MATERIAL_2 ] = "Default_Premium_r1_i3",
	},
	
	customization_groups = 
	{
		[ ai.VesselCustomSlot.MATERIAL_0 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_1 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_2 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MPRESET_0 ] = {VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.LINES},
	},
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]	= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]	= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]	= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ]			= "root",
	},
	
	default_slot_mask = ai.SpaceShipModuleSlotMask.ACTIVE_01 + ai.SpaceShipModuleSlotMask.ACTIVE_02 + ai.SpaceShipModuleSlotMask.ACTIVE_03 + ai.SpaceShipModuleSlotMask.ACTIVE_04 +
							ai.SpaceShipModuleSlotMask.ENGINE_MOD_01 + ai.SpaceShipModuleSlotMask.ENGINE_MOD_02 + ai.SpaceShipModuleSlotMask.ENGINE_MOD_03 +
							ai.SpaceShipModuleSlotMask.SHIELD_MOD_01 + ai.SpaceShipModuleSlotMask.SHIELD_MOD_02 + ai.SpaceShipModuleSlotMask.SHIELD_MOD_03 +
							ai.SpaceShipModuleSlotMask.ARMOR_MOD_01 + ai.SpaceShipModuleSlotMask.ARMOR_MOD_02 + ai.SpaceShipModuleSlotMask.ARMOR_MOD_03 +
							ai.SpaceShipModuleSlotMask.CAPACITOR_MOD_01 + ai.SpaceShipModuleSlotMask.CAPACITOR_MOD_02 + ai.SpaceShipModuleSlotMask.CAPACITOR_MOD_03 +
							ai.SpaceShipModuleSlotMask.CPU_MOD_01 +ai.SpaceShipModuleSlotMask.CPU_MOD_02 + ai.SpaceShipModuleSlotMask.CPU_MOD_03 +
							ai.SpaceShipModuleSlotMask.PRIMARY_WEAPON_01 + ai.SpaceShipModuleSlotMask.SECONDARY_WEAPON + ai.SpaceShipModuleSlotMask.SPECIAL +
							ai.SpaceShipModuleSlotMask.ENGINE + ai.SpaceShipModuleSlotMask.CAPACITOR + ai.SpaceShipModuleSlotMask.SHIELD + ai.SpaceShipModuleSlotMask.ARMOR + ai.SpaceShipModuleSlotMask.CPU +
							ai.SpaceShipModuleSlotMask.AUTOGEN_01 + ai.SpaceShipModuleSlotMask.AUTOGEN_02 + ai.SpaceShipModuleSlotMask.AUTOGEN_03 + ai.SpaceShipModuleSlotMask.AUTOGEN_04 + ai.SpaceShipModuleSlotMask.AUTOGEN_05
}

Def.Ship_ST_S = 
{
	inherit							= "Ship_ST",

	--#################### CLASS_PARAMETERS ####################--
	
	ship_class						= ai.ShipClass.SMALL, -- SMALL MEDIUM LARGE HUGE,
	signature						= ai.Signature.SMALL,
	cam_config						= "cam_ship_small",
	
	death_blast_wave				= "SmallShipExplodeBlastWave", --взрыв от смерти
	death_wreck						= "Wreck_R1_S",			-- прототип обломка корабля 
	death_effect					= "particles/explosions/shp_exp_small_02",
	death_sound						= "sound/explosion/ship_expl",
	
	physics							= { solid_type = solid.model, mass = 500, material = "ShipMetalMk1", },
	
	contact_damage_min_speed		= 4,
	contact_damage_cf				= 100,
	
	behavior_type_AI				= 0,
	fire_dispersion_AI				= 3.5,
	
	weapon_slots					= 2,
	fire_sectors					= { 2, 1, 1, 0, 2, 0, 1, 0, 0, 0 },
	fire_sector_incline				= -45,
	
	shield_radius 					= 2.1213,
	
	--cpu_grades 	 				= designers.cpu_small_grades,
	
	--#################### SHIP_PARAMETERS ####################--
	
	role							= ai.ShipRoles.ECM, -- ECM SCOUT RECON
	model							= "models/ships/race_1/s/race1_s_t1",
	
	treeIco							= "Race1_S_T1_Skin1_atlas",
	craftIco						= "Race1_S_T1_Skin1_atlas",
	hangarIco						= "Race1_S_T1_Skin1",
	default_icon					= "shopIco_Ship_Race1_S_T1_Skin1",
	hangarIcoSmall					= "Race1_S_T1_small",
	
	capacitor_grades				= designers.capacitor_small_st,
	engine_grades					= designers.engine_small_st,
	
	default_modules = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Plasmagun_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_MicroWarp_Basic_T1_Mk1",
	},
	
	--base_preset						= "Ship_ST_S_Preset1",
}

Def.Ship_ST_M = 
{
	inherit							= "Ship_ST",
	
	--#################### CLASS_PARAMETERS ####################--
	
	ship_class						= ai.ShipClass.MEDIUM,
	signature						= ai.Signature.MEDIUM,
	cam_config						= "cam_ship_medium_imp",
	
	death_blast_wave				= "MediumShipExplodeBlastWave",
	death_wreck						= "Wreck_R1_M",
	death_effect					= "particles/explosions/shp_exp_mid_02",
	death_sound						= "sound/explosion/ship_expl",
	
	physics							= { solid_type = solid.model, mass = 1000, material = "ShipMetalMk2", },
	
	contact_damage_min_speed		= 3,
	contact_damage_cf				= 100,
	
	behavior_type_AI				= 0,
	fire_dispersion_AI				= 3.5,
	
	weapon_slots					= 4,
	fire_sectors					= { 4, 2, 2, 2, 4, 1, 4, 2, 2, 1, },
	fire_sector_incline				= -20,
	
	shield_radius 					= 3,
	
	--cpu_grades 	 				= designers.cpu_medium_grades,
	
	--#################### SHIP_PARAMETERS ####################--
	
	role							= ai.ShipRoles.ATTACK, -- ATTACK COMMAND TACKLER
	model							= "models/ships/race_1/m/race1_m_t1_m2",
	
	treeIco							= "Race1_M_T1_Skin1_atlas",
	craftIco						= "Race1_M_T1_Skin1_atlas",
	hangarIco						= "Race1_M_T1_Skin1",
	default_icon					= "shopIco_Ship_Race1_M_T1_Skin1",
	hangarIcoSmall					= "Race1_M_T1_small",
	
	capacitor_grades				= designers.capacitor_medium_st,
	engine_grades					= designers.engine_medium_st,
	
	default_modules = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Railgun_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_TimeBoost_T1_Base",
	}
	
	--base_preset						= "Ship_ST_S_Preset1",
}

Def.Ship_ST_L = 
{
	inherit							= "Ship_ST",
	
	--#################### CLASS_PARAMETERS ####################--
	
	ship_class						= ai.ShipClass.LARGE,
	signature						= ai.Signature.LARGE,
	cam_config						= "cam_ship_large_imp",
	
	death_blast_wave				= "LargeShipExplodeBlastWave",
	death_wreck						= "Wreck_R1_L",
	death_effect					= "particles/explosions/shp_exp_big_02",
	death_sound						= "sound/explosion/ship_big_expl",
	
	physics							= { solid_type = solid.model, mass = 2000, material = "ShipMetalMk3", },
	
	contact_damage_min_speed		= 2,
	contact_damage_cf				= 100,
	
	behavior_type_AI				= 1,
	fire_dispersion_AI				= 2.1,
	
	weapon_slots					= 4,
	fire_sectors					= { 4, 2, 2, 1, 2, 1, 2, 1, 1, 1, },
	fire_sector_incline				= -20,
	
	shield_radius 					= 6,
	
	--cpu_grades 	 				= designers.cpu_large_grades,
	
	--#################### SHIP_PARAMETERS ####################--
	
	role							= ai.ShipRoles.ENGINEER, -- SNIPER GUARD ENGINEER
	model							= "models/ships/race_1/l/r1_l_engineer",
	
	treeIco							= "Race1_L_T5_PU_atlas",
	craftIco						= "Race1_L_T5_PU_atlas",
	hangarIco						= "Race1_L_T5_PU",
	default_icon					= "shopIco_Ship_Race1_L_T5_PU",
	hangarIcoSmall					= "Race1_L_T5_PU_small",
	
	capacitor_grades				= designers.capacitor_large_st,
	engine_grades					= designers.engine_large_st,
	
	default_modules = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Laser_Basic_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_FrigateDrone_T5_UniqRay",
	},
	
	--base_preset						= "Ship_ST_S_Preset1",
}

Def.Ship_ST_H = 
{
	inherit							= "Ship_ST",
	
	--#################### CLASS_PARAMETERS ####################--
	
	ship_class						= ai.ShipClass.HUGE,
	signature						= ai.Signature.HUGE,
	cam_config						= "cam_ship_huge",
	
	death_blast_wave				= "LargeShipExplodeBlastWave",
	death_wreck						= "Wreck_R1_XL",
	death_effect					= "particles/explosions/shp_exp_big_02",
	death_sound						= "sound/explosion/ship_big_expl",
	
	physics							= { solid_type = solid.model, mass = 50000, material = "ShipMetalMk1", },
	
	contact_damage_min_speed		= 2,
	contact_damage_cf				= 100,
	
	behavior_type_AI				= 0,
	fire_dispersion_AI				= 2.1,
	
	weapon_slots					= 12,
	fire_sectors					= { 6, 8, 8, 2, 3, 2, 4, 5, 5, 2, },
	fire_sector_incline				= -20,
	weapon_selection_angle			= true,
	
	shield_radius 					= 13,
	
	--cpu_grades 	 				= designers.cpu_large_grades,
	
	--#################### SHIP_PARAMETERS ####################--
	
	role							= ai.ShipRoles.OVERSEER, -- OVERSEER
	model							= "models/ships/race_1/h/r1_h_t1",
	
	treeIco							= "Ship_Race1_H_T3_atlas",
	craftIco						= "Ship_Race1_H_T3_atlas",
	hangarIco						= "Ship_Race1_H_T3",
	default_icon					= "shopIco_Ship_Race1_H_T3",
	hangarIcoSmall					= "Race1_H_T3_pirate_small",
	
	capacitor_grades				= designers.capacitor_huge_st,
	engine_grades					= designers.engine_huge_st,
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]= "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	= "rocket",
		
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		= "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		= "active_up_3",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		= "active_up_4",

		[ ai.SpaceShipModuleSlot.CAPACITOR ] 		 = "capacitor",--
		[ ai.SpaceShipModuleSlot.SHIELD ]		 	 = "root",
		[ ai.SpaceShipModuleSlot.ARMOR ] 		 	 = "root",
		[ ai.SpaceShipModuleSlot.CPU ] 				 = "root",
		[ ai.SpaceShipModuleSlot.ENGINE ] 		 	 = "engine",--
		
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 = "capacitor", --root
		
 		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01] 	= "root",		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]	= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]		= "root",	
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]	= "root",
	},
	
	default_modules = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Railgun_Huge_T1_Mk0",
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_EnergyReroute",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]		= "Module_SectorShield",
	},
	
	weakness_area_radius			= 100, --#71262: Механика мёртвой зоны для эсминцев --#0083939
	weakness_area_damage_coef		= 2.15, --#0083939
	
	--base_preset						= "Ship_ST_S_Preset1",
}

ModulePresets.Ship_ST_Preset1 = 
{

	ship_def = "Ship_ST",
	
	munition =
	{
		[ai.MunitionBayType.MBT_PRIMARY]		= "WeaponMod_RailUp1_Basic_T1_Mk3",
		--[ai.MunitionBayType.MBT_SECONDARY]	= "SpaceMissile_Cruise_T5_Mk3",
	},

	modules =
	{
		[ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01]		= "Weapon_Railgun_st",
		[ai.SpaceShipModuleSlot.ACTIVE_01]				= "Module_RepairDrones_st",
		[ai.SpaceShipModuleSlot.ACTIVE_02]				= "Module_HullDevastator_st",
		[ai.SpaceShipModuleSlot.ACTIVE_03]				= "Module_ShieldDevastator_st",
		[ai.SpaceShipModuleSlot.ACTIVE_04]				= "Module_NoRestoreEnergy_st",
		--[ai.SpaceShipModuleSlot.CAPACITOR_MOD_01]		= "Module_CapacitorRecharging_T5_Mk1",
		--[ai.SpaceShipModuleSlot.CAPACITOR_MOD_02]		= "Module_ImplsDischarger_T4_Mk1",
		--[ai.SpaceShipModuleSlot.CAPACITOR_MOD_03]		= "Module_CmplxBatt_T4_Mk1",
		--[ai.SpaceShipModuleSlot.SHIELD_MOD_01]		= "Module_CuttedShieldHolder_T5_Mk1",
		--[ai.SpaceShipModuleSlot.SHIELD_MOD_02]		= "ModulePassive_ResistShieldEMP_T5_Mk1",
		--[ai.SpaceShipModuleSlot.ARMOR_MOD_01]			= "ModulePassive_HeavyArmor_T1_Mk1",
		--[ai.SpaceShipModuleSlot.ARMOR_MOD_02]			= "ModulePassive_ResistHullKinetic_T5_Mk1",
		--[ai.SpaceShipModuleSlot.CPU_MOD_01]			= "ModulePassive_ScoutScanner_T5_Mk1",
		--[ai.SpaceShipModuleSlot.CPU_MOD_02]			= "ModulePassive_ProtonWall_T4_Mk1",
	},
}

Def.NeverMind =
{
	ods_export				= true,
	storeItemId				= 1,
	price					= 1000000000,
	cant_be_bought			= true,
	hide_from_player		= true,
	is_resource				= true,
	is_rare					= true,
	item_subtype			= ItemSubtype.ShipComponent,
	delete_from_inventory	= true,
}

Def.Ship_Large_Tank_April =
{
	inherit					= "Ship_Large_Tank",
	
	health					= 1.0,
	
	weapon_slots			= 2,
	fire_sector_incline		= -45,
	fire_sectors			= { 2, 1, 1, 1, 2, 1, 1, 1, 1, 1 },
	
	laser_damage_mul		= 0.7,
	plasma_damage_mul		= 0.7,
	railgun_damage_mul		= 0.7,
	
	death_effect			= "particles/explosions/shp_exp_small_02",
}

-- Перехватчик Albireo
Def.Ship_Race3_H_T5_Uniq_small = 
{
	inherit							= "Ship_Small",
	model							= "models/ships/race_3/s/r3_s_albiero/r3_s_albiero",
	capacitor_grades				= designers.capacitor_h_r3_t5_uniq_small_grades,
	engine_grades					= designers.engine_huge_race3_t5_uniq_small,
	cpu_grades						= designers.cpu_small_grades,
	armor_grades					= designers.armor_grades_federation,
	shield_grades					= designers.shield_grades,
	default_custom_elements =
	{
		[ai.VesselCustomSlot.MATERIAL_0] = "Default_huge_r3_f41",
		[ai.VesselCustomSlot.MATERIAL_1] = "Default_huge_r3_f42",
		[ai.VesselCustomSlot.MATERIAL_2] = "Default_huge_r3_f43",
	},
	customization_groups = 
	{
		[ ai.VesselCustomSlot.MATERIAL_0 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_1 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MATERIAL_2 ] = {VesselCustomElementsGroups.DEFAULT},
		[ ai.VesselCustomSlot.MPRESET_0 ] = {VesselCustomElementsGroups.DEFAULT, VesselCustomElementsGroups.LINES},
	},
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 			= "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 			= "active_up_2",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.ARMOR_MOD_03 ]			= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_01 ]		= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_02 ]		= "root",
		[ ai.SpaceShipModuleSlot.CAPACITOR_MOD_03 ]		= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.CPU_MOD_03 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_01 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_02 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_03 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_04 ]			= "root",
		[ ai.SpaceShipModuleSlot.AUTOGEN_05 ]			= "root",
	},
	default_modules = 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Plasmagun_Autofire_T5_Epic",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]		= "Weapon_RocketLauncher",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 			= "Module_Albiero_S_Warp",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 			= "Module_Albiero_S_Cloak",
		[ ai.SpaceShipModuleSlot.SPECIAL ]				= "Module_VesselSwitchBack_Albiero",
	},
	default_rocket_munition="SpaceMissile_ProximityMine_Albireo",
	customization_bones =
	{
		[ ai.VesselCustomSlot.CHILD_0 ] = ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_1 ] = ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_2 ] = ai.DONT_INHERIT,
		[ ai.VesselCustomSlot.CHILD_3 ] = ai.DONT_INHERIT,
	},
	ship_name				= "Ship_Race3_H_T5_Uniq",
	rank					= 17,
	role					= ai.ShipRoles.SCOUT,
	beacon_capture_mul		= 0.35,
	-- item_subtype			= ItemSubtype.Ship,
	energy_regen			= 1.87,
	energy_max				= 275,
	race					= ai.Race.FEDERATION,
	hull_resist_emp			= 45,
	hull_resist_kinetic		= -15,
	hull_resist_thermal		= 15,
	hull_health				= 3160, --от 5205 до 3130 / по 415
	shield_resist_thermal	= 0,
	shield_resist_kinetic	= 30,
	shield_resist_emp		= -30,
	shield_regen			= 98.4,
	shield_max				= 3100,
	item_lvl				= 22.5,
	shield_max				= 3100,
	cargo_hold_size			= 3,
	max_speed				= 40.3, --от 55 до 40.3 / по 3
	is_reserve_spaceship	= true,
	crit_chance_add			= 0.15,
	spawn_timeout 			= 60,
	boost_energy_cost_per_second = 90,--от 48 до 90 / по 9
}

--[[
Def.Ship_ST.ods_export=true
Def.Ship_ST.storeItemId=1
Def.Ship_ST.premiumPrice=9999999
VesselTree.Ship_ST={}
VesselTree.Ship_ST.ods_export=true
]]

Def.Ship_Test = Def.Ship_Small	-- не надо эту строчку менять, только закомментировать можно, после неё не надо ничего делать, всё до!