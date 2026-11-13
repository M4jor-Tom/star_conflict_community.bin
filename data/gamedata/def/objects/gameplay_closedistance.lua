Def.Ship_CD_Middle =
{
	inherit							= "Ship_Race1_M_T4",
	storeItemId						= 0,
	rank							= 11,
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	contact_damage_min_speed		= 3.5,
	contact_damage_cf				= 40,
	
	vision_radius					= 350,
	lock_time						= 1.0,

	hull_health						= 1500,
	hull_resist_kinetic				= 15,
	hull_resist_emp					= -15,
	hull_resist_thermal				= 25,
	
	shield_max						= 7500,
	shield_resist_kinetic			= 0,
	shield_resist_emp				= 25,
	shield_resist_thermal			= 15,
	shield_regen					= 0,		-- реген щита модулем, когда не под атакой
	
	energy_max						= 400,
	energy_regen 					= 1.2,		-- энергия всегда на максимуме, не завязываемся на неё, регулируем кулдауном
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	min_speed						= 20,
	max_speed 						= 40,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 25, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 60,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 155,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 150,		-- минимальное значение энергии необходимое для включения ускорения 
	boost_rot_coef					= 0.2,
	boost_accel_coef				= 4, 
	boost_maxspeed_coef				= 1.9,
	max_rearspeed					= 0,		-- максимальная скорость при движении назад (в м/с) 
	decel_afterburning				= 25,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 20,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 0, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 0, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 0,
	max_yspeed						= 0,
	accel_y0						= 0,
	accel_y1						= 0,
	
	rot_xmaxspeed					= 80*1.15,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 80*8,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 65*10,	-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 120*6,	-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 80*1.15,
	rotaccel_y0						= 80*8,
	rotaccel_y1						= 65*10,
	rotdecel_y						= 120*6,
	rot_zmaxspeed					= 90*1.15,
	rotaccel_z0						= 100*4,
	rotaccel_z1						= 100*8,
	rotdecel_z						= 500*2,
	----------------------------------------------------------------------------------------

	fire_sector_incline = -20,
	fire_sectors = { 4, 2, 2, 0, 4, 0, 2, 0, 0, 0 },
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = ai.DONT_INHERIT,
	},

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Plasmagun_Basic_CD",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 		= "Module_TimeBoost_CD",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 	= "Module_RepairDrones_m_CD",	
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 	= "Module_AdaptiveArmorBoost_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 	= "Module_Invulnerability_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 	= "Module_Afterburner_T4_Mk1",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ] 		= "Module_CD_ShieldRestore",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] 			= "Module_CD_NoFriendRadar",
	},
	
	default_rocket_munition 		= "SpaceMissile_Standart_CD",
	--uiName							= "CD_Gunship_uiName",
	
	cam_config						= "cam_ship_medium_closedist",
}

Def.Module_CD_NoFriendRadar =
{
	class 					= "SpaceShipModule",
	in_editor 				= false,
	spell_on_equip			= "Spell_CD_NoFriendRadar",
}

Def.Module_CD_ShieldRestore =
{
	class 					= "SpaceShipModule",
	in_editor 				= false,
	spell_on_equip			= "Spell_CD_ShieldRestore",
	item_subtype			= ItemSubtype.ShieldExtender,
}

Spell.Spell_CD_NoFriendRadar =
{
	target 					= ai.SpellTarget.CASTER,
	aura_target				= ai.SpellTarget.HOLDER,
	
	aura					= ai.Aura.DISABLE_RECEIVE_RADAR_INFO,
	
	isBuff 					= false,
	hud_visible				= false,
	gameplay_specific		= true,
}

Spell.Spell_CD_ShieldRestore =
{
	target 					= ai.SpellTarget.CASTER,
	aura_target				= ai.SpellTarget.HOLDER,
	
	aura					= ai.Aura.HEAL_SHIELD_SCALED_PERIODIC,
	
	aura_param				= 400,
	period					= 0.2,
	
	dispell_flag			= ai.Dispell.ON_DAMAGE + ai.Dispell.ON_COLLISION,
	dispel_interval			= 5,
	min_targets_count		= 0,
	
	isBuff					= true,
	hud_visible				= false,
}

Def.Weapon_Plasmagun_Basic_CD =
{
	inherit					= "Weapon_Plasmagun_Basic_T5_Prem",
	storeItemId				= 0,
	cant_be_bought 			= true,

	cycle_barrels			= true,
	fire_rate				= 45,
	projectile_speed		= 450,
	
	dispersion				= 0.1,
	dispersion_max			= 0,
	dispersion_add			= 0,
	dispersion_sub			= 0,
	
	optimal_range			= 150*0.75,
	max_range				= 150,
	
	damage_emp				= 3500,
	crit_chance				= 0,
	crit_damage				= 0,
	
	heat_max				= 10,
	heat_add				= 1.6666667,	--6
	heat_sub				= 2.86,			--3.5
	overheat_time			= 0.5,			--0.5
	
	model					= "models/weapons/singularity_cannon/singularity_cannon_2",
	default_icon 			= "ItemSubtype_PlasmagunBasic",

	item_subtype			= ItemSubtype.PlasmagunBasic,
	module_type				= ai.ModuleType.WEAPON,
	class_mask				= ai.ShipClass.MEDIUM,
	weapon_class			= ai.WeaponClass.PLASMAGUN,
	
	projectile				= "Projectile_Plasma_Light",
	
	max_aim_yaw				= 30,
	max_aim_pitch  			= 30,
}

Def.SpaceMissile_Standart_CD =
{
	inherit							= "SpaceMissile_Standart_T4_Mk3",
	storeItemId						= 0,
	
	holder_size						= 1,
	max_range						= 450,
	
	is_guided						= false,
	angular_velocity				= 0,
	
	empty_holder_cooldown			= 60,
	item_subtype					= ItemSubtype.SpaceMissile_Standart,
	
	default_icon					= "ItemSubtype_SpaceMissile_Standart",
	
	explosion_blast_wave			= "BlastWave_CD_Rocket",
	launch_sound 					= "sound/weapons/rockets/rocket_torpedo_launch",
	effect 							= "particles/weapons/missile/destroyer_rocket_trail",
	work_sound 						= "sound/weapons/rockets/rocket_fly",
}

Def.BlastWave_CD_Rocket =
{
	inherit							= "BlastWave_SM_Standart_T4_Mk3",
	damage_thermal					= 6000,
	blast_maxDistance				= 10,
	blast_minDistance				= 5,
	light_radius					= 5,
	light_time						= 0.8,
	effect							= "particles/explosions/big_fire_2",
	light_color						= "255 100 0 150",
	light_radius					= 20,
	light_time						= 0.8,
	sound							= "sound/explosion/rocket_expl",
}

Def.Module_TimeBoost_CD =
{
	tier							= 4,
	item_lvl						= 21,
	class							= "ActiveModule",
	module_type						= ai.ModuleType.SPECIAL,
	class_mask						= ai.ShipClass.MEDIUM,

	spell							= "Spell_TimeBoost_CD",
	cooldown						= 16,
	energy_cost						= 0,
	default_icon					= "ItemSubtype_EnergyReroute_WeaponMax",
	item_subtype					= ItemSubtype.CdFirerateUp,
}

Spell.Spell_TimeBoost_CD =
{
	target							= ai.SpellTarget.CASTER,
	aura_target						= ai.SpellTarget.HOLDER,
	
	aura							= ai.Aura.FIRE_RATE_MOD,
	aura_param						= 0.3,
	duration						= 15,
	
	isBuff							= true,
	
	aura_apply_fx					= "particles/gadget/aura_breacktrough",
	
	ui_ico =
	{
		target_system 				= { tex = "ItemSubtype_EnergyReroute_WeaponMax", },
	},
	
	uiName							= "TimeBoost_Base",
	uiDesc							= "TimeBoost_Base_Desc",
}

Def.Module_RepairDrones_m_CD =
{
	inherit							= "Module_RepairDrones_m_T4_Prem",
	storeItemId						= 0,
	cant_be_bought 					= true,
	spell							= "Spell_RepairDrones_m_CD",
	cooldown						= 20,
	energy_cost						= 0,
}

Spell.Spell_RepairDrones_m_CD =
{
	target							= ai.SpellTarget.CASTER,
	aura_target						= ai.SpellTarget.HOLDER,
	
	aura							= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param						= 300,
	period							= 1,
	duration						= 2.5,
	
	isBuff							= true,
	
	ui_ico =
	{
		target_system 				= { tex = "ItemSubtype_RepairDronesMedium", },
	},
}

Def.Module_RepairDrones_l_CD =
{
	inherit							= "Module_RepairDrones_l_T4_Prem",
	storeItemId						= 0,
	cant_be_bought 					= true,
	spell							= "Spell_RepairDrones_l_CD",
	cooldown						= 20,
	energy_cost						= 0,
}

Spell.Spell_RepairDrones_l_CD =
{
	target							= ai.SpellTarget.CASTER,
	aura_target						= ai.SpellTarget.HOLDER,
	
	aura							= ai.Aura.HEAL_HULL_PERIODIC,
	aura_param						= 450,
	period							= 1,
	duration						= 2.5,
	
	isBuff							= true,
	
	ui_ico =
	{
		target_system 				= { tex = "ItemSubtype_RepairDronesLarge", },
	},
}

Def.Ship_CD_Big =
{
	inherit							= "Ship_Race3_L_T4_Faction2",
	storeItemId						= 0,
	rank							= 11,
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	contact_damage_min_speed		= 3.5,
	contact_damage_cf				= 40,
	
	vision_radius					= 400,
	lock_time						= 1.0,

	hull_health						= 2500,
	hull_resist_kinetic				= 15,
	hull_resist_emp					= -15,
	hull_resist_thermal				= 25,
	
	shield_max						= 12000,
	shield_resist_kinetic			= 0,
	shield_resist_emp				= 25,
	shield_resist_thermal			= 15,
	shield_regen					= 0,		-- реген щита модулем, когда не под атакой
	
	energy_max						= 400,
	energy_regen 					= 1.2,		-- энергия всегда на максимуме, не завязываемся на неё, регулируем кулдауном
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	min_speed						= 15,
	max_speed 						= 40,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 25, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 60,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 155,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 150,		-- минимальное значение энергии необходимое для включения ускорения 
	boost_rot_coef					= 0.2,
	boost_accel_coef				= 4, 
	boost_maxspeed_coef				= 1.9,
	max_rearspeed					= 0,		-- максимальная скорость при движении назад (в м/с) 
	decel_afterburning				= 25,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 20,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 0, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 0, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 0,
	max_yspeed						= 0,
	accel_y0						= 0,
	accel_y1						= 0,
	
	rot_xmaxspeed					= 50,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 60*6,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 65*8,	-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 120*6,	-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 50,
	rotaccel_y0						= 60*6,
	rotaccel_y1						= 65*8,
	rotdecel_y						= 120*6,
	rot_zmaxspeed					= 70,
	rotaccel_z0						= 70*2,
	rotaccel_z1						= 100*8,
	rotdecel_z						= 500*2,
	----------------------------------------------------------------------------------------

	fire_sector_incline = -20,
	fire_sectors = { 6, 4, 4, 0, 6, 0, 4, 0, 0, 0 },
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = ai.DONT_INHERIT,
	},

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Plasmagun_Basic_CD_L",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 		= "Module_ShieldBoost_CD",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 	= "Module_RepairDrones_l_CD",	
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 	= "Module_AdaptiveArmorBoost_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 	= "Module_Invulnerability_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 	= "Module_Afterburner_T4_Mk1",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ] 		= "Module_CD_ShieldRestore",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] 			= "Module_CD_NoFriendRadar",
	},
	
	default_rocket_munition 		= "SpaceMissile_Standart_CD",
	--uiName							= "CD_Gunship_uiName",
	
	cam_config						= "cam_ship_large_closedist",
}

Def.Weapon_Plasmagun_Basic_CD_L =
{
	inherit					= "Weapon_Plasmagun_Basic_T5_Prem",
	storeItemId				= 0,
	cant_be_bought 			= true,

	cycle_barrels			= true,
	fire_rate				= 45,
	projectile_speed		= 450,
	
	dispersion				= 0.1,
	dispersion_max			= 0,
	dispersion_add			= 0,
	dispersion_sub			= 0,
	
	optimal_range			= 150*0.75,
	max_range				= 150,
	
	damage_emp				= 4500,
	crit_chance				= 0,
	crit_damage				= 0,
	
	heat_max				= 10,
	heat_add				= 1.6666667,	--6
	heat_sub				= 2.86,			--3.5
	overheat_time			= 0.5,			--0.5
	
	model					= "models/weapons/panisher_mt7/pan1",
	default_icon 			= "ItemSubtype_PlasmagunBasic",

	item_subtype			= ItemSubtype.PlasmagunBasic,
	module_type				= ai.ModuleType.WEAPON,
	class_mask				= ai.ShipClass.MEDIUM,
	weapon_class			= ai.WeaponClass.PLASMAGUN,
	
	projectile				= "Projectile_HeavyPlasma",
	
	max_aim_yaw				= 30,
	max_aim_pitch  			= 30,
}

Def.Module_ShieldBoost_CD =
{
	tier							= 4,
	item_lvl						= 21,
	class							= "ActiveModule",
	module_type						= ai.ModuleType.SPECIAL,
	class_mask						= ai.ShipClass.LARGE,
	
	spell							= "Spell_ShieldBoost_CD",
	cooldown						= 40,
	energy_cost						= 0,
	default_icon					= "ItemSubtype_EnergyReroute_ShieldMax",
	item_subtype					= ItemSubtype.CdShield,
}

Spell.Spell_ShieldBoost_CD =
{
	target							= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target 					= ai.SpellTarget.CASTER,
	
	aura							= ai.Aura.RESIST_ALL,
	aura_param						= 20,
	duration						= 5,
	
	isBuff							= true,
	
	aura_holder_attach_bone			= "root",
	aura_holder_def					= "ShieldBoost_CD",
	
	ui_ico =
	{
		target_system 				= { tex = "ItemSubtype_EnergyReroute_ShieldMax", },
	},
	
	uiName							= "TimeBoost_Base",
	uiDesc							= "TimeBoost_Base_Desc",
}

Def.ShieldBoost_CD = 
{
	class								= "AuraHolderEntity",
	in_editor							= false,
	
	hack_immune 						= true,
	
	damageable							= true,
	health								= 100000,
	
	ttl									= 5,
	
	model								= "models/shields/shield_cover_sphere",
	
	physics								= { solid_type = solid.model, kinematic = true, hitbox = true, material = "GiantShield", },
	
	start_sound  						= "sound/destroyer/SShield_activate",
	end_sound							= "sound/destroyer/SShield_off",
	death_sound							= "sound/destroyer/SShield_off",
	
	weapon_mode							= ai.ShieldWeaponMode.BLOCK_ENEMY,
	radar_vison							= ai.ShieldRadarVisionMode.PASS,
	
	is_shield							= true,
	smart_shield_radius					= 35,
	
	show_after 							= 0.2,
	children = 
	{
		{ effect						= "particles/gadget/cover_shield_holder", },
	}
}

-- уничтожимый щит
Def.CD_Base_Cover =
{
	class							= "SpaceShield",
	in_editor						= true,
	maxViewDist 					= 999999,
	
	full_activate_revive			= true,
	
	light_color						= "255 255 255 255",
	texture							= "models/shields/shield_pattern_allidium_yard",
	
	fadeout_anim					= "abcdefghijkl",
	fadeout_duration				= 0.1,
	shield_fadeout_sound			= "sound/ambient/pirate_shield_off",
	
	fadein_anim						= "jaamaamaazauqomkigecad",
	fadein_duration					= 3.0,
	shield_fadein_sound				= "sound/raid/boss_shield_on",
	
	fadein_spell					= "Spell_BaseCover_CD",
	
	hudType							= "minor",
	hud_visibility_type 			= "minor",
	--vision_always 				= true,
	
	physics							= { solid_type = solid.sphere, static = true, material = "EnergyShield", },
	
	remove_on_death 				= false,
	
	relationship_group				= 2,
	--network_sync					= false,

	health 							= 100000/3,
	damageable						= true,
	uiName 							= "Cruiser_Shield",
	
	hack_immune						= true,
	
	respawn_time					= 90,
}

Spell.Spell_BaseCover_CD =
{
	target							= ai.SpellTarget.CASTER_POSITION_CASTER,
	aura_target =
	{
		class 						= ai.SpellTargetClass.SHIP,
		relationship 				= ai.SpellTargetRelationship.ENEMY,
		area						= ai.SpellTargetArea.AROUND,
	},
	
	aura							= ai.Aura.SHIP_ATTRACTION,
	aura_param						= -60,
	aura_param_add					= -25,
	aura_range						= 75,
	aura_range_add					= 10,
	period							= 0.5,
	duration						= 4.5,
	
	isBuff							= false,
	hud_visible 					= false,
	
	min_targets_count				= 0,
	
	aura_fx							= "particles/gadget/gravy_anomaly_drone",
	aura_target_directed_fx			= "particles/gadget/push_ray_hit",
}

--
Def.CD_BombSite_Team2_A =
{
	inherit					= "BtB_BombSite_Team2_A",
	in_editor				= true,
	interaction_distance	= 75,
	model					= "models/objects/vital_point/beacon/beacon",
	
	children = 
	{
		{ def = "CD_Base_Cover", joint = "root" },
	},
}

Def.CD_BombSite_Team2_B =
{
	inherit					= "BtB_BombSite_Team2_B",
	in_editor				= true,
	interaction_distance	= 75,
	model					= "models/objects/vital_point/beacon/beacon",
	
	children = 
	{
		{ def = "CD_Base_Cover", joint = "root" },
	},
}

Def.CD_BombSite_Team2_C =
{
	inherit					= "BtB_BombSite_Team2_C",
	in_editor				= true,
	interaction_distance	= 75,
	model					= "models/objects/vital_point/beacon/beacon",
	
	children = 
	{
		{ def = "CD_Base_Cover", joint = "root" },
	},
}

--[[
Texture
{
	name		"ItemSubtype_EnergyReroute_ShieldMax"
	fileName	"ui\textures\interation_2\textures_s2\item_icon_s3"
	rect		"743 213 106 106"
}

Texture
{
	name		"ItemSubtype_EnergyReroute_WeaponMax"
	fileName	"ui\textures\interation_2\textures_s2\item_icon_s3"
	rect		"849 213 106 106"
}

Texture
{
	name		"ItemSubtype_EnergyReroute_EngineMax"
	fileName	"ui\textures\interation_2\textures_s2\item_icon_s3"
	rect		"955 213 106 106"
}
]]

Def.Ship_CD_Fast =
{
	inherit							= "Ship_Race2_M_T4_Faction1",
	storeItemId						= 0,
	rank							= 11,
	cant_be_bought					= true,
	premiumPrice					= 999999,
	
	contact_damage_min_speed		= 3.5,
	contact_damage_cf				= 40,
	
	vision_radius					= 350,
	lock_time						= 1.0,

	hull_health						= 1000,
	hull_resist_kinetic				= 15,
	hull_resist_emp					= -15,
	hull_resist_thermal				= 25,
	
	shield_max						= 6000,
	shield_resist_kinetic			= 0,
	shield_resist_emp				= 25,
	shield_resist_thermal			= 15,
	shield_regen					= 0,		-- реген щита модулем, когда не под атакой
	
	energy_max						= 400,
	energy_regen 					= 1.2,		-- энергия всегда на максимуме, не завязываемся на неё, регулируем кулдауном
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	min_speed						= 40,
	max_speed 						= 60,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 30, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 60,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 155,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 150,		-- минимальное значение энергии необходимое для включения ускорения 
	boost_rot_coef					= 0.4,
	boost_accel_coef				= 4, 
	boost_maxspeed_coef				= 1.8,
	max_rearspeed					= 0,		-- максимальная скорость при движении назад (в м/с) 
	decel_afterburning				= 25,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 20,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 0, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 0, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 0,
	max_yspeed						= 0,
	accel_y0						= 0,
	accel_y1						= 0,
	
	rot_xmaxspeed					= 80*1.5,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 80*8,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 65*10,	-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotdecel_x						= 120*6,	-- ускорение торможения поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 80*1.5,
	rotaccel_y0						= 80*8,
	rotaccel_y1						= 65*10,
	rotdecel_y						= 120*6,
	rot_zmaxspeed					= 90*1.5,
	rotaccel_z0						= 100*4,
	rotaccel_z1						= 100*8,
	rotdecel_z						= 500*2,
	----------------------------------------------------------------------------------------

	fire_sector_incline = -20,
	fire_sectors = { 2, 2, 2, 0, 2, 0, 2, 0, 0, 0 },
	
	slot_bones = 
	{
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = ai.DONT_INHERIT,
	},

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_Plasmagun_Basic_CD_S",
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 		= "Module_SlowManeuver_CD",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 	= "Module_RepairDrones_m_CD",	
		--[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 	= "Module_AdaptiveArmorBoost_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 	= "Module_Invulnerability_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 	= "Module_Afterburner_T4_Mk1",
		
		[ ai.SpaceShipModuleSlot.SHIELD_MOD_01 ] 		= "Module_CD_ShieldRestore",
		[ ai.SpaceShipModuleSlot.CPU_MOD_01 ] 			= "Module_CD_NoFriendRadar",
	},
	
	default_rocket_munition 		= "SpaceMissile_Standart_CD",
	--uiName							= "CD_Gunship_uiName",
	
	cam_config						= "cam_ship_medium_closedist",
}

Def.Weapon_Plasmagun_Basic_CD_S =
{
	inherit					= "Weapon_Plasmagun_Basic_T5_Prem",
	storeItemId				= 0,
	cant_be_bought 			= true,

	cycle_barrels			= true,
	fire_rate				= 200,
	projectile_speed		= 450,
	
	dispersion				= 0.1,
	dispersion_max			= 0,
	dispersion_add			= 0,
	dispersion_sub			= 0,
	
	optimal_range			= 120*0.75,
	max_range				= 120,
	
	damage_emp				= 1350,
	crit_chance				= 0,
	crit_damage				= 0,
	
	heat_max				= 10,
	heat_add				= 1.6666667,	--6
	heat_sub				= 2.86,			--3.5
	overheat_time			= 0.5,			--0.5
	
	model					= "models/weapons/singularity_cannon/singularity_cannon_2",
	default_icon 			= "ItemSubtype_PlasmagunBasic",

	item_subtype			= ItemSubtype.PlasmagunBasic,
	module_type				= ai.ModuleType.WEAPON,
	class_mask				= ai.ShipClass.MEDIUM,
	weapon_class			= ai.WeaponClass.PLASMAGUN,
	
	projectile				= "Projectile_Plasma_Light",
	
	max_aim_yaw				= 25,
	max_aim_pitch  			= 25,
}

Def.Module_SlowManeuver_CD =
{
	tier							= 4,
	item_lvl						= 21,
	class							= "ActiveModule",
	module_type						= ai.ModuleType.SPECIAL,
	class_mask						= ai.ShipClass.MEDIUM,
	
	spell							= "Spell_SlowManeuver_CD",
	cooldown						= 30,
	energy_cost						= 0,
	default_icon					= "ItemSubtype_EnergyReroute_EngineMax",
	item_subtype					= ItemSubtype.CdManeuverUp,
}

Spell.Spell_SlowManeuver_CD =
{
	target							= ai.SpellTarget.CASTER,
	aura_target						= ai.SpellTarget.HOLDER,
	
	aura							= ai.Aura.FAST_MANEUVER,
	aura_param						= 0.3,
	duration						= 10,
	
	isBuff							= true,
	
	aura_apply_fx					= "particles/gadget/aura_wave_red",
	
	ui_ico =
	{
		target_system 				= { tex = "ItemSubtype_EnergyReroute_EngineMax", },
	},
	
	uiName							= "TimeBoost_Base",
	uiDesc							= "TimeBoost_Base_Desc",
	
	additional_auras = 
	{
		{
			aura_target					= ai.SpellTarget.HOLDER,
			
			aura						= ai.Aura.REDUCE_MIN_SPEED,
			aura_param					= 0.5,
			duration					= 10,
			
			isBuff						= true,
			
			ui_ico =
			{
				target_system 				= { tex = "ItemSubtype_EnergyReroute_EngineMax", },
			},
		},
	},
}

--[[
Def.Ship_CD_Gunship =
{
	inherit				= "Ship_Race1_M_T4",
	storeItemId			= 0,
	rank				= 11,
	cant_be_bought		= true,
	premiumPrice		= 999999,
	vision_radius		= 90.1,
	lock_time		= 2,

	hull_health										= 6500,
	shield_max										= 4100,
	energy_max										= 400,
	energy_regen 									= 4.42 * 0.2,
	--shield_regen									= 0.0,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 28,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 5, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 5,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 40,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 50,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 3,		-- максимальная скорость при движении назад (в м/с) 
	
	decel_afterburning				= 7,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 7,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 1, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 5, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 5,
	max_yspeed						= 1,
	accel_y0						= 5,
	accel_y1						= 5,
	
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

	-- fire_sector_incline = -45,
	-- fire_sectors = { 2, 1, 1, 0, 2, 0, 1, 0, 0, 0 },
	slot_bones 					= 
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ] = "gun",
		[ ai.SpaceShipModuleSlot.SECONDARY_WEAPON ]	 = "rocket",

 		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 = "active_up_1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 = "active_up_2",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 = ai.DONT_INHERIT,
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 = ai.DONT_INHERIT,

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
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_CD_Gunship_Shotgun", --Weapon_RailgunBasic_T4_Mk1
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 	= "Module_TimeBoost_T4_Base",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 	= "Module_ShieldExplosion_T4_Mk1",	
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 	= "Module_AdaptiveArmorBoost_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 	= "Module_Invulnerability_T4_Mk1",
		--[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 	= "Module_Afterburner_T4_Mk1",
		
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 		= "Module_M",
	},
	
	default_rocket_munition 		= "SpaceMissile_CD_Torpedo",--"SpaceMissile_Standart_T4_Mk3",
	--uiName							= "CD_Gunship_uiName",
	
	cam_config						= "cam_ship_medium_closedist",
}

Def.Ship_CD_Tackler =
{
	inherit				= "Ship_Race2_M_T4_Faction1",
	storeItemId			= 0,
	rank				= 11,
	cant_be_bought		= true,
	premiumPrice		= 999999,
	vision_radius		= 140.1,
	max_speed			= 15.7,
	lock_time_mul		= 2,

	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 23,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 15, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 6,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 20,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 30,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 3,		-- максимальная скорость при движении назад (в м/с) 
	
	decel_afterburning				= 8,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 8,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 2, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 6, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 6,
	max_yspeed						= 2,
	accel_y0						= 6,
	accel_y1						= 6,
	
	rot_xmaxspeed					= 45,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 90,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 53,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 45,
	rotaccel_y0						= 90,
	rotaccel_y1						= 53,
	----------------------------------------------------------------------------------------

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_CD_Tackler", --Weapon_Lazer_Heavy_T4_Mk1
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 	= "Module_CloakingDevice_Basic_T5_Mk3",--"Module_CD_Gunship_SM",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 	= "Module_ShieldRestoreMedium_T4_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 	= "Module_EnergyReflector_T4_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 	= "Module_AdaptiveShieldBoost_T4_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 	= "Module_GuidedDronRL_T4_Mk1",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 		= "Module_M",
	},
	
	default_rocket_munition 		= "SpaceMissile_CD_Torpedo",
	--uiName							= "CD_Gunship_uiName",
	
	cam_config						= "cam_ship_medium_closedist",
}

Def.Ship_CD_Guard =
{
	inherit				= "Ship_Race3_L_T4_Faction2",
	storeItemId			= 0,
	rank				= 11,
	cant_be_bought		= true,
	premiumPrice		= 999999,
	vision_radius		= 200.1,
	lock_time_mul		= 2,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 12,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 8, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 6,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 90,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 100,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 3,		-- максимальная скорость при движении назад (в м/с) 
	
	decel_afterburning				= 5,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 5,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 1, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 3, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 3,
	max_yspeed						= 1,
	accel_y0						= 3,
	accel_y1						= 3,
	
	rot_xmaxspeed					= 15,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 30,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 17,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 15,
	rotaccel_y0						= 30,
	rotaccel_y1						= 17,
	----------------------------------------------------------------------------------------
	
	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_CD_Guard", --Weapon_Minigun_T4_Mk1
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 	= "Module_GigantShield",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 	= "Module_MissileDefenceType1_T4_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 	= "Module_RepairDrones_l_T4_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 	= "Module_ShieldChargeLarge_T4_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 	= "Module_AOE_EMI_T4_Mk1",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 		 	= "Module_L",
	},
	
	default_rocket_munition 		= "SpaceMissile_CD_Torpedo",
	--uiName							= "CD_Gunship_uiName",
	
	cam_config						= "cam_ship_large_closedist",
}

Def.Ship_CD_Engineering =
{
	inherit				= "Ship_Race1_L_T4_Faction1",
	storeItemId			= 0,
	rank				= 11,
	cant_be_bought		= true,
	premiumPrice		= 999999,
	vision_radius		= 200.1,
	max_speed			= 10,
	lock_time_mul		= 2,
	
	----------------------------------------------------------------------------------------
	--			Engine
	----------------------------------------------------------------------------------------
	max_speed 						= 10,	 	-- максимальная скорость (в м/с) 
	acceleration 					= 7, 		-- базовое ускорение разгона (в м/с/c) 
	boost_energy_cost				= 6,		-- потребление энергии ускорителем при активации 
	boost_energy_cost_per_second	= 90,		-- потребление энергии ускорителем (единиц за секунду) 
	boost_energy_min				= 100,		-- минимальное значение энергии необходимое для включения ускорения 
	max_rearspeed					= 2,		-- максимальная скорость при движении назад (в м/с) 
	
	decel_afterburning				= 5,		-- ускорение пассивного торможения, когда скорость больше максимальной(в м/с/c) 
	reverse_accel					= 5,		-- ускорение активного торможения (в м/с/c) 
	
	max_xspeed						= 1, 		-- максимальная скорость стрэйфа влево/вправо (в м/с) 
	accel_x0						= 3, 		-- ускорение стрэйфа влево/вправо (в м/с/c). значение интерполируется от accel_x0 до accel_x1 в зависимости от текущей линейной скорости по оси Z 
	accel_x1						= 3,
	max_yspeed						= 1,
	accel_y0						= 3,
	accel_y1						= 3,
	
	rot_xmaxspeed					= 18,		-- максимальная скорость поворота вокруг оси X, pitch (градус/c) 
	rotaccel_x0						= 36,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rotaccel_x1						= 19,		-- ускорение поворота вокруг оси X, pitch (градус/c/c) 
	rot_ymaxspeed					= 18,
	rotaccel_y0						= 36,
	rotaccel_y1						= 19,
	----------------------------------------------------------------------------------------

	default_modules =
	{
		[ ai.SpaceShipModuleSlot.PRIMARY_WEAPON_01 ]	= "Weapon_CD_Engineering", --Weapon_Plasmagun_Sniper_T4_Mk1
		[ ai.SpaceShipModuleSlot.SPECIAL ] 		 	 	= "Module_FrigateDrone_T4_Base",
		[ ai.SpaceShipModuleSlot.ACTIVE_01 ] 		 	= "Module_ShieldEmitter_T4_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_02 ] 		 	= "Module_RemoteRepairDrones_T4_Mk1",
		[ ai.SpaceShipModuleSlot.ACTIVE_03 ] 		 	= "Module_RepairRay_CD",
		[ ai.SpaceShipModuleSlot.ACTIVE_04 ] 		 	= "Module_Screen_T4_Mk1",
		
		[ ai.SpaceShipModuleSlot.ENGINE_MOD_01 ] 		 	= "Module_L",
	},
	
	default_rocket_munition 		= "SpaceMissile_MineField_T4_Mk3",
	--uiName							= "CD_Gunship_uiName",
	
	cam_config						= "cam_ship_large_closedist",
}

--##########################################################################################
-- Орудия

Def.Weapon_CD_Gunship_Rifle = --Weapon_RailgunBasic_T4_Mk1
{
	inherit			= "Weapon_AutoGun",
	storeItemId		= 0,
	cant_be_bought  = true,

	fire_rate		= 210,
	projectile_speed= 679.25,
	
	dispersion		= 0.14,
	dispersion_max	= 2.00004,
	dispersion_add	= 0.400008,
	dispersion_sub	= 4.00008,
	
	optimal_range	= 220*0.5,
	max_range		= 295*0.5,
	
	damage_kinetic	= 138.8,
	crit_chance		= 0.2,
	crit_damage		= 0.5,
	
	heat_max		= 10,
	heat_add		= 1.6666667,
	heat_sub		= 12.5,
	overheat_time	= 1.5,
	
	model			= "models/weapons/assault_railgun/assault4",
	default_icon 	= "ItemSubtype_RailgunBasic_4",

	item_subtype	= ItemSubtype.RailgunBasic,
	module_type		= ai.ModuleType.WEAPON,
	class_mask		= ai.ShipClass.MEDIUM,
	weapon_class	= ai.WeaponClass.RAILGUN,
	
	projectile		="Projectile_Nail_Iron",
}

Def.Weapon_CD_Gunship_Shotgun = --Weapon_Railgun_Autofire_T4_Mk1
{
	inherit			= "Weapon_Railgun_Autofire_T4_Mk1",
	storeItemId		= 0,
	cant_be_bought  = true,
	
	class_mask		= ai.ShipClass.MEDIUM,
	projectile		= "Projectile_BuckshotRailgun",
	
	optimal_range	= 130*0.5,
	max_range		= 175*0.5,
	
	max_aim_yaw						= 30,
	max_aim_pitch  					= 30,
	-- fire_rate		= 80,
	-- projectile_speed= 440,
	
	-- dispersion		= 3.5,
	-- dispersion_max	= 3.5,

	-- damage_kinetic	= 836.7,
	-- crit_chance		= 0.07,
	-- crit_damage		= 0.5,
	-- is_shotgun		= true,
	
	-- heat_max		= 10,
	-- heat_add		= 1.4285714,
	-- heat_sub		= 5,
	-- overheat_time	= 1.5,

	-- model			= "models/weapons/shrapnel_cannon/shrapnel_cannon_mod2",
	-- default_icon	= "ItemSubtype_RailgunAutofire_2",
	-- shopCategory	= "WEAPONS",
	-- shopSubCategory	= "RAIL_GUNS",
	-- item_subtype	= ItemSubtype.RailgunAutofire,
	-- module_type		= ai.ModuleType.WEAPON,
	--weapon_class	= ai.WeaponClass.RAILGUN,
	shot_effect = "particles/weapons/railgun/muzzle_buckshot",
	shot_once_sound = "sound/weapons/railgun/auto",
}

Def.Weapon_CD_Tackler =	--Weapon_Lazer_Heavy_T4_Mk1
{
	inherit="Weapon_FusionBeam",
	storeItemId		= 0,
	cant_be_bought 	= true,
	
	fire_rate		= 60,
	impulse_time	= 1,
	dispersion		= 0,
	dispersion_max	= 0,
	
	optimal_range	= 180*0.5,
	max_range		= 285*0.5,
	
	penetration_stack_max = 80,
	penetration_stack_add = 50,
	penetration_stack_sub = 50,

	damage_thermal	= 441,
	crit_chance		= 0.05,
	crit_damage		= 0.5,
	
	heat_max		= 10,
	heat_add		= 0.9090909,
	heat_sub		= 5,
	overheat_time	= 1.5,

	model			= "models/weapons/ion_emitter/ion_mod2",
	default_icon	= "ItemSubtype_LaserHeavy_2",
	shopCategory	= "WEAPONS",
	shopSubCategory	= "LASERS",
	item_subtype	= ItemSubtype.LaserHeavy,
	module_type		= ai.ModuleType.WEAPON,
	class_mask		= ai.ShipClass.MEDIUM,
	weapon_class	= ai.WeaponClass.LASER,
	
	max_aim_yaw						= 30,
	max_aim_pitch  					= 30,
}

Def.Weapon_CD_Guard = --Weapon_Minigun_T4_Mk1
{
	inherit			= "Weapon_AutoGun",
	storeItemId		= 0,
	cant_be_bought 	= true,
	
	fire_rate		= 235,
	projectile_speed= 500.5,
	projectile_speed_add = 146.3,
	projectile_speed_max = 1320,
	
	dispersion		= 0.2,
	dispersion_max	= 0.9,
	dispersion_add	= 0.1,
	dispersion_sub	= 0.7,
	
	optimal_range	= 270*0.5,
	max_range		= 360*0.5,
	
	damage_kinetic	= 133,
	crit_chance		= 0.07,
	crit_damage		= 0.5,
	
	heat_max		= 10,
	heat_add		= 1,
	heat_sub		= 4,
	overheat_time	= 1.5,
	
	model			= "models/weapons/nailgun/nail2",
	default_icon	= "ItemSubtype_Minigun_2",
	shopCategory	= "WEAPONS",
	shopSubCategory	= "RAIL_GUNS",
	item_subtype	= ItemSubtype.Minigun,
	module_type		= ai.ModuleType.WEAPON,
	class_mask		= ai.ShipClass.LARGE,
	weapon_class	= ai.WeaponClass.RAILGUN,
	projectile		= "Projectile_Nail_Iron_Heavy",
	
	max_aim_yaw						= 60,
	max_aim_pitch  					= 60,
}

Def.Weapon_CD_Engineering = --Weapon_Plasmagun_Sniper_T4_Mk1
{
	inherit			= "Weapon_AutoGun",
	storeItemId		= 0,
	cant_be_bought 	= true,
	
	fire_rate		= 48,
	projectile_speed= 698.5,
	
	dispersion		= 1.75,
	dispersion_max	= 0.18,
	dispersion_add	= -0.98125,
	dispersion_sub	= -0.3925,
	
	optimal_range	= 350*0.5,
	max_range		= 465*0.5,
	
	damage_emp		= 438.7,
	crit_chance		= 0.05,
	crit_damage		= 0.75,
	
	heat_max		= 10,
	heat_add		= 0.6666667,
	heat_sub		= 3.3333333,
	overheat_time	= 1.5,
	heat_overcharge	= true,
	
	charge_max		= 2,
	damage_charge_deminishing = 0.35,
	use_wrong_timing= true,

	
	model			= "models/weapons/panisher_mt7/pan3",
	default_icon	= "ItemSubtype_PlasmagunSniper_3",
	shopCategory	= "WEAPONS",
	shopSubCategory	= "PLASMA_GUNS",
	item_subtype	= ItemSubtype.PlasmagunSniper,
	module_type		= ai.ModuleType.WEAPON,
	class_mask		= ai.ShipClass.LARGE,
	weapon_class	= ai.WeaponClass.PLASMAGUN,
	projectile		= "Projectile_Plasma_Light",
	
	max_aim_yaw						= 60,
	max_aim_pitch  					= 60,
}

--##########################################################################################
-- ракеты

Def.SpaceMissile_CD_Torpedo =
{
	inherit							= "SpaceMissile_Torpedo_T4_Mk3",
	storeItemId						= 0,
	
	holder_size						= 3,
	max_range						= 300,
	
	--spell							= "Spell_ZM_Missile_Aliens",
	--detonation_radius				= ,
	cooldown=15,
	empty_holder_cooldown			= 300,
	item_subtype					= ItemSubtype.SpaceMissile_Torpedo,
	
	default_icon					= "ItemSubtype_SpaceMissile_Torpedo",
	
	explosion_blast_wave			= "BlastWave_CD_Torpedo",
	launch_sound 					= "sound/weapons/rockets/rocket_torpedo_launch",
	effect 							= "particles/weapons/missile/destroyer_rocket_trail",
	work_sound 						= "sound/weapons/rockets/rocket_fly",
}
Def.BlastWave_CD_Torpedo =
{
	inherit	= "BlastWave_SM_Torpedo_T4_Mk1",
	damage_emp			= 3000,
	blast_maxDistance	= 10,
	blast_minDistance	= 5,
	light_radius		= 5,
	light_time			= 0.8,
	effect = "particles/explosions/explosion_big2_emp",
	light_color = "140 190 255 100",
	light_radius = 20,
	light_time = 0.8,
	sound = "sound/explosion/big_rocket_expl",
}

--##########################################################################################
-- модули

Def.Module_RepairRay_CD =
{
	inherit			= "Module_RepairRay_l_T4_Mk1",
	storeItemId		= 0,
	cant_be_bought 	= true,
	spell="Spell_RepairRay_CD",
}

Spell.Spell_RepairRay_CD =
{
	min_targets_count=0,
	aura_range=100,
	aura_param=370,
	duration=30,
	period=1,
	target=ai.SpellTarget.CASTER_POSITION_CASTER,
	aura=ai.Aura.HEAL_HULL_SCALED_PERIODIC,
	aura_target=ai.SpellTarget.ALLY_LESSER_HULL_HOLDER,
	isBuff=true,
	aura_holder_def="HealBot_Armor",
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_RepairRayLarge", },
	},
}
--##########################################################################################
-- вспомогательное для тестов
Def.Module_M =
{
	class 					= "SpaceShipModule",
	in_editor 				= false,
	max_speed_percent		= 0.1,
	spell_on_max_speed_minus = "Spell_Slow_M",
	spell_on_equip			= "Spell_NoFriendRadar",
	show_cooldown_status 	= false,
	uiName 					= "zm_humans_debuff",
}
Spell.Spell_Slow_M =
{
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.SLOW_MANEUVER, --SLOW_MANEUVER
	aura_param		= 1.0,
	hud_visible		= false,
	--dispell_flag	= ai.Dispell.ON_FIRE,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
	},
}
Spell.Spell_NoFriendRadar =
{
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.DISABLE_RECEIVE_RADAR_INFO,
	--aura_param		= 5.3,
	hud_visible		= false,
	--dispell_flag	= ai.Dispell.ON_FIRE,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
	},
}

Def.Module_L =
{
	class 					= "SpaceShipModule",
	in_editor 				= false,
	max_speed_percent		= 0.1,
	spell_on_max_speed_minus = "Spell_Slow_L",
	spell_on_equip			= "Spell_NoFriendRadar",
	show_cooldown_status 	= false,
	uiName 					= "zm_humans_debuff",
}
Spell.Spell_Slow_L =
{
	isBuff 			= true,
	target 			= ai.SpellTarget.CASTER,
	aura_target		= ai.SpellTarget.HOLDER,
	aura			= ai.Aura.SLOW_MANEUVER, --SLOW_MANEUVER
	aura_param		= 0.5,
	hud_visible		= false,
	--dispell_flag	= ai.Dispell.ON_FIRE,
	ui_ico =
	{
		target_system 	= { tex = "ItemSubtype_SpecialSpeed", },
	},
}
]]