Def.Weapon_RocketLauncher = 
{
	class			= "RocketLauncher",
	in_editor		= false,

	replace_extra_entities 	= false,
	activate_entity_max = 2, -- #66543
	module_type		= ai.ModuleType.SECONDARY_WEAPON,
	item_subtype	= ItemSubtype.SecondaryWeapon,
	cant_be_bought	= true,
}

-- базовый прототип для всех ракет
Def.Weapon_BaseRocket = 
{
	class			= "Rocket",
	in_editor		= false,
	impact_type 	= "rocket",
	model = "models/weapons/bs_torpedo_mid",
	death_sound		= "sound/explosion/small_rocket_expl",
}

Def.Weapon_BaseCruise = 
{
	inherit			= "Weapon_BaseRocket",
	use_pathfinder 		= true,
	model = "models/weapons/missile_torpedo2",
}



Def.Weapon_Default =
{
	class			= "AutoGun",
	
	module_type		= ai.ModuleType.WEAPON,
	
	fire_rate		= 300,
	dispersion		= 5, 
	optimal_range	= 900,
	max_range		= 1000,
	projectile_speed = 200.0,
	damage			= 10,
	
	muzzleflash_color = { kinetic = "200 180 150 64", emp = "200 180 150 64", thermal = "200 180 150 64", },
	muzzleflash_radius = 3.5,

	--TEMP HACK FROM NUKEM! TEMP BALANCE!!  ищите в определениях: --  Def.Weapon_Default.damage_k 
	--регулировать только для изменения среднестатистической продолжительности боя.
	--damage_k  = 11.5 * 1.2 ,
	model = "models/weapons/gun_helios/gun_helios",
	-- default_custom_elements[ai.VesselCustomSlot.MATERIAL_0] = "Default_Race1_l_helios_r1",
	-- default_custom_elements[ai.VesselCustomSlot.MATERIAL_1] = "Default_Race1_l_helios_g1",
	-- default_custom_elements[ai.VesselCustomSlot.MATERIAL_2] = "Default_Race1_l_helios_b1",
}


--
Def.Weapon_Test =
{
	--class			= "AutoGun",
	class			= "LaserGun",
	impulse_time	= 1.0,

	--penetration_stack_max = 100,
	--penetration_stack_add = 120,
	--penetration_stack_sub = 100,
	
	fire_rate		= 60,
	--fire_rate_max	= 200,
	--fire_rate_add	= 10.0,
	dispersion		= 0, 
	--dispersion_max	= 10, 
	--dispersion_add	= 1, 
	--dispersion_sub	= 1, 
	optimal_range	= 100,
	max_range		= 200,
	--projectile_speed = 300.0,

	--charge_max = 3,
	--is_shrapnel = true,
	--is_shotgun = true,
	--one_projectile_per_shot = true,
	--cycle_barrels = true,
	
	heat_max = 100,
	heat_add = 20,				-- heat растет на это значение при каждом выстреле
	heat_sub = 20,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time = 0,
	
--	barrel_rot_speed = 30, 		-- максимальная скорость поворота ствола (градусов в секунду)
--	barrel_rot_speed_fire = 5, 		-- максимальная скорость поворота ствола (градусов в секунду)
	
	muzzleflash_color = { kinetic = "200 180 150 64", emp = "200 180 150 64", thermal = "200 180 150 64", },
	muzzleflash_radius = 3.5,

	damage			= 10,
	crit_chance		= 0.0,
	crit_damage		= 0.5,
	
	projectile		= "Projectile_BuckshotRailgun",
	--shot_once_sound = "sound/weapons/railgun/auto",
	
	spell_on_hit	= "Test",
	spell_on_hit_timeout = 1.0,

	beam_fx 		= "particles/weapons/laser/laser_basic_beam",
	shot_beam_fx	= "particles/gadget/pulsar_beam",
	model			= "models/weapons/gun_amber/gun_amber",
	default_custom_elements = {
		[ai.VesselCustomSlot.MATERIAL_0]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_1]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_2]="weapons_amber_b5",
	},
	--charge_max_sound= "sound/gadgets/disintegrator/dis_ready",
	--charge_sound	= "sound/ui/btnClick",
}

-- test торпеды
Def.Projectile_Photon_torpedo =
{
	class			= "Projectile",
	in_editor		= false,
	--mass				= 0.0,
--    work_sound = "sound/weapons/plasma_fly",
	hitbox_min 			= Vec3( -1.2, -1.2, -1.2 ),
	hitbox_max			= Vec3( 1.2, 1.2, 1.2 ),
	
	--apply_shake		= true,
	
	hit_effect		= "particles/weapons/plasma/hit",
	effect = "particles/weapons/plasma/projectile2",
}


--
Def.Rocket_Test =
{
	inherit = "Weapon_BaseRocket",
	model = "models/weapons/missile_rocket",
	speed = 30,
	max_range = 500,
	cooldown = 3,
	--default_icon = "SpaceMissile_AAMu",
	--explosion_blast_wave = "BlastWave_SM_AAMu_T1_Mk1",
	detonation_radius = 1.0,
	missile_defence_immune = true,
	--volley_count = 4,
	--volley_timeout = 0.2,
	--angular_velocity = 60.0,
	--is_guided = true,
	--random_trajectory = true,

	--work_sound = "sound/weapons/rockets/rocket_fly",
	
	spell_on_launch = "Rocket_Test",
	holder_size = 10,
}


-- У нас очень много параметров оружия дублируется, создаю базовые прототипы
-- пока что просто чтобы 0 в повреждениях не прописывать всем, баг 27758
Def.Weapon_Base =
{
	module_type		= ai.ModuleType.WEAPON,
	
	damage_emp	= 0,
	damage_kinetic	= 0,
	damage_thermal	= 0,
}

Def.Weapon_LaserGun =
{
	inherit 			= "Weapon_Base",
	class 				= "LaserGun",
}

Def.Weapon_LaserMining =
{
	inherit 			= "Weapon_Base",
	class 				= "LaserGun",
	mining_enable		= true,
	race_mask			= ai.RaceMask.CRYSTAL,
}

Def.Weapon_LaserGunRay =
{
	inherit 			= "Weapon_Base",
	class 				= "LaserGunRay",
}

Def.Weapon_AutoGun =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
}

Def.Weapon_RailVolcano =
{
	inherit 			= "Weapon_AutoGun",
	shot_loop_sound 	= "sound/weapons/railgun/volcano",
}

Def.Projectile_RailVolcano = 
{
	inherit				= "Projectile_BasicRailgun",
}

------------
Def.Weapon_Artillery =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",

	cycle_barrels 		= true,
	
	fire_rate			= 60,
	dispersion			= 0, 

	max_range			= 250,
	projectile_speed 	= 175.0,
	
	--damage				= 10,
	damage_kinetic		= 10,
	damage_emp			= 0,
	damage_thermal		= 0,
	
	heat_max 			= 10,
	heat_add 			= 5 + 1.5,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,
	
	no_friendly_fire	= true,
	
	-- В случае 1 пушки из 6
	-- 6 * 6.5 = 39 heat
	-- rof 1/6 --tts 6
	-- sub * tts = 50
	-- итого нет нагрева
	
	-- В случае 2 пушки из 6
	-- 3 * 6.5 = 19.5
	-- rof 2/6 --tts 3
	-- sub * tts = 15
	-- итого нагрев 4.5 раз в 3 секунды
	
	-- Но перегрева нет вообще!!! где то ошибка.

	projectile			= "Projectile_Artillery",
	
--	shot_once_sound = "sound/weapons/artillery/art_shot",
	model				= "models/weapons/rail_guns/econom/rg_training",
}


Def.Projectile_Artillery =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/bs_torpedo_small",
	explosion_blast_wave= "Blastwave_Artillery_Base",
	override_blast_wave_damage = true,
	
	detonation_radius	= 8,

	--flare_color			= "255 241 204 15",--15
	flare_color			= "255 190 140 15",
	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/devostrator_trail",
--	work_sound			= "",
	missile_defence_immune 	= true,
}


Def.Blastwave_Artillery_Base =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 1000,
	blast_maxDistance	= 20,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/explosions/artillery_fire",
	light_color 		= "255 182 128 100",
	light_radius 		= 20,
	light_time 			= 0.8,
	sound 				= "sound/explosion/small_rocket_expl",
}

Def.Weapon_FrontLineCannon =
{
	inherit 			= "Weapon_Artillery",
	shot_effect 		= "particles/weapons/devostator_muzzle",
	projectile			= "Projectile_FrontLineCannon",
	shot_once_sound 	= "sound/weapons/railgun/heavy",
	muzzleflash_color = { kinetic = "255 154 82 64", emp = "255 154 82 64", thermal = "255 154 82 64", },
	muzzleflash_radius = 3,
}

Def.Projectile_FrontLineCannon =
{
	inherit				= "Projectile_Artillery",
	explosion_blast_wave= "Blastwave_FrontLineCannon",
	detonation_radius	= 12,  --Projectile_Artillery = 8
	flare_color			= "255 180 140 15",
    effect 				= "particles/weapons/devostrator_trail",
}


Def.Blastwave_FrontLineCannon =
{
	inherit				= "Blastwave_Artillery_Base",
	blast_maxDistance	= 25, ----Projectile_Artillery = 20
	blast_minDistance	= 2, -- не используется  
	effect 				= "particles/explosions/devostrator_explosion",
}

Def.Weapon_BigCannon = 
{
	inherit = "Weapon_Artillery",
	shot_once_sound = "sound/weapons/xo/big_cannon_shot",
	muzzleflash_color = { kinetic = "255 230 181 255", emp = "255 230 181 255", thermal = "255 230 181 255", },
	muzzleflash_radius 	= 30,
	shot_effect 		= "particles/weapons/artillery_big_muzzle",
}

Def.Projectile_BigCannon =
{
	inherit				= "Projectile_Artillery",
	explosion_blast_wave	= "Blastwave_BigCannon",
	work_sound 		= "sound/weapons/xo/bullet_fly",
	--model 				= "models/weapons/bs_torpedo_mid",
	flare_color			= "255 214 155 25",
	flare_size			= 0.05, --0.15
	flare_angle			= 180,
	flare_nebulosity	= 1.0,
	effect 				= "particles/weapons/devostrator_trail",
}

Def.Blastwave_BigCannon = 
{
	inherit				= "Blastwave_Artillery_Base",
	blast_maxDistance	= 30,
	sound 			= "sound/hit/xo_common",
	light_color 		= "255 239 195 120",
	light_radius 		= 20,
	light_time 			= 0.8,
	effect 				= "particles/weapons/crossout/tank_cannon_hit",
}

--
Def.Weapon_FusionBeam =
{
	inherit = "Weapon_LaserGun",
	model = "models/weapons/lasers/power/l_training",
	
	fire_rate = 60,
	
	impulse_time = 1,
	dispersion = 0,
	
	penetration_stack_max = 200,
	penetration_stack_add = 75 + 65,
	penetration_stack_sub = 75,
	
	optimal_range = 120,
	max_range = 160,
	
	damage_thermal = 200,
	
	heat_max = 10,
	heat_add = 6.6666667,
	heat_sub = 5,
	overheat_time = 1,
	
	module_type = ai.ModuleType.WEAPON,
	weapon_class = ai.WeaponClass.LASER,
	
	--uiName = "Weapon_Laser_Heavy",
	--uiDesc = "Weapon_Laser_Heavy_Desc",
	beam_fx = "particles/weapons/laser/laser_fusion_beam",
	hit_fx = "particles/weapons/laser/hit_fusion",
}	

--
Def.Weapon_FusionBeamRay =
{
	inherit = "Weapon_LaserGunRay",
	model = "models/weapons/lasers/power/l_training",
	
	fire_rate = 60,
	
	impulse_time = 1,
	dispersion = 0,
	
	penetration_stack_max = 200,
	penetration_stack_add = 75 + 65,
	penetration_stack_sub = 75,
	
	optimal_range = 120,
	max_range = 160,
	focus_distance = 10,
	
	damage_thermal = 200,
	
	heat_max = 10,
	heat_add = 6.6666667,
	heat_sub = 5,
	overheat_time = 0.1,
	
	module_type = ai.ModuleType.WEAPON,
	weapon_class = ai.WeaponClass.LASER,
	
	uiName = "Weapon_Laser_Heavy",
	uiDesc = "Weapon_Laser_Heavy_Desc",
	beam_fx = "particles/weapons/laser/laser_fusion_beam",
	hit_fx = "particles/weapons/laser/hit_fusion",
	focus_fx = "particles/weapons/laser/hit_fusion",
}	


---#62298 Ударный штурмовик Империи "Ghost"
Def.Weapon_LengtheningBeam =
{
	inherit = "Weapon_LaserGun",
	model = "models/weapons/lasers/power/l_training",
	
	fire_rate = 60,
	
	impulse_time = 1,
	dispersion = 0,
	
	max_range_max = 500, --600, --500,
	max_range_add = 100, --120, --100,
	optimal_range_max = 375.6, --400, --375.6,
	optimal_range_add = 75.2, --80, --75.2,
	
	optimal_range = 37.6, --37.6,
	max_range = 50, --50,
	
	damage_thermal = 600,
	
	heat_max = 10,
	heat_add = 1.818,
	heat_sub = 7.273,
	overheat_time = 1.25,
	
	module_type = ai.ModuleType.WEAPON,
	weapon_class = ai.WeaponClass.LASER,
	
	damage_color = { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "229 88 140 255", },
	muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 128 175 255", },
	beam_fx = "particles/weapons/laser/laser_length_beam",
	fire_fx = "",
	hit_fx = "particles/weapons/laser/hit",
	
	shot_loop_sound = "sound/weapons/laser/basic",
	hit_loop_sound = "sound/hit/laser_loop",
	---
	impact_type 	= "laser",
}


Def.Weapon_Neutron=
{
	fire_rate=45,
	fire_rate_add=65,
	fire_rate_max=250,
	dispersion=2.5,
	optimal_range=175,
	max_range=235,
	damage_thermal=181.8,
	crit_chance=0.05,
	crit_damage=0.5,
	heat_max=10,
	heat_add=1.04,
	heat_sub=3.3333333,
	overheat_time=1,
	barrel_rot_speed_fire=1.5,
	--cycle_barrels = true,
	--is_shotgun=true,
	inherit="Weapon_AutoGun",
	model="models/weapons/lasers/sniper/l_training",
	default_icon="ItemSubtype_LaserSniper",
	item_subtype=ItemSubtype.LaserSniper,
	module_type=ai.ModuleType.WEAPON,
	required_role=ai.ShipRoles.GUARD,
	projectile="Projectile_Neutron",
	uiName="Weapon_Laser_Sniper",
	uiDesc="Weapon_Laser_Sniper_Desc",
}

--
Def.Weapon_SingularityCannon = 
{
	inherit 			= "Weapon_Base",
	class 				= "SingularityCannon",
	model				= "models/weapons/rail_guns/econom/rg_training",

	fire_rate 			= 60,
	dispersion			= 0,
	
	optimal_range		= 200,
	max_range			= 350,
	
	projectile_speed 	= 70.0,
	
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 200,
	damage_thermal		= 0,
	
	heat_max 			= 100,
	heat_add 			= 20 + 10,
	heat_sub 			= 20,
	overheat_time		= 0,
	
	projectile			= "Projectile_SingularityCannon",
	shot_once_sound 	= "sound/weapons/singularity/sg_shot",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_2_beam",
}

Def.Weapon_SingularityCannonPirate = 
{
	inherit 			= "Weapon_SingularityCannon",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_3_beam",
	projectile			= "Projectile_SingularityCannonPirate",
}

Def.Weapon_SingularityCannonTournament = 
{
	inherit 			= "Weapon_SingularityCannon",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_red_beam",
	projectile			= "Projectile_SingularityCannonTournament",
}

Def.Projectile_SingularityCannonTournament =
{
	inherit			= "Projectile_SingularityCannon",

	hit_effect		= "particles/weapons/plasma/hit_red",
	work_sound 	    = "sound/weapons/singularity/sg_fly",
	effect 			= "particles/weapons/big/plasma_slow_red",
	
	singularity_hit_fx = "particles/empty",
	singularity_hit_sound = "sound/hit/singularity_ship",
}

--
Def.Projectile_SingularityCannon =
{
	class			= "SingularityProjectile",
	in_editor		= false,

	hitbox_min 		= Vec3( -0.5, -0.5, -0.5 ),
	hitbox_max		= Vec3( 0.5, 0.5, 0.5 ),
	damage_radius	= 4,
	impact_type 	= "singularity",

	hit_effect		= "particles/weapons/plasma/hit",
	work_sound 	    = "sound/weapons/singularity/sg_fly",
	effect 			= "particles/weapons/big/plasma_slow_2",
	
	singularity_hit_fx = "particles/empty",
	singularity_hit_sound = "sound/hit/singularity_ship",
	
	shot_once_sound = "sound/weapons/singularity/sg_shot",
}

Def.Projectile_SingularityCannonPirate =
{
	inherit			= "Projectile_SingularityCannon",

	hit_effect		= "particles/weapons/plasma/hit_2",
	work_sound 	    = "sound/weapons/singularity/sg_fly",
	effect 			= "particles/weapons/big/plasma_slow_3",
	
	singularity_hit_fx = "particles/empty",
	singularity_hit_sound = "sound/hit/singularity_ship",
}

--
Def.Projectile_TESTSingularityCannon =
{
	class			= "Projectile",
	in_editor		= false,

	hitbox_min 		= Vec3( -0.5, -0.5, -0.5 ),
	hitbox_max		= Vec3( 0.5, 0.5, 0.5 ),
	damage_radius	= 4,
	impact_type 	= "singularity",

	hit_effect		= "particles/weapons/plasma/hit",
	work_sound 	    = "sound/weapons/singularity/sg_fly",
	effect 			= "particles/weapons/big/plasma_slow_2",
	
	singularity_hit_fx = "particles/weapons/big/plasma_slow_2_explode",
	singularity_hit_sound = "sound/hit/singularity_ship",
}

-------------------------------------------
--   Weapon_OrbGun
-------------------------------------------
Def.Weapon_OrbGun = 
{
	inherit 			= "Weapon_Base",
	class 				= "SingularityCannon",
	model				= "models/weapons/plasma/power/orb_gun",

	fire_rate 			= 60,
	dispersion			= 0,
	
	optimal_range		= 400,
	max_range			= 550,
	
	projectile_speed 	= 150.0,
	
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 200,
	damage_thermal		= 0,
	
	heat_max 			= 100,
	heat_add 			= 20,
	heat_sub 			= 20,
	overheat_time		= 0,
	
	muzzleflash_color = { kinetic = "0 0 0 0", emp = "0 0 0 0", thermal = "0 0 0 0", },
	muzzleflash_radius = 20,
	
	projectile			= "Projectile_OrbGun",
	shot_once_sound 	= "sound/weapons/orb/orb_shot",
	shot_beam_fx 		= "particles/weapons/big/plasma_orb_beam",
	shot_effect 		= "particles/weapons/big/plasma_orb_muzzle",
}


--
Def.Projectile_OrbGun =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/misc/invisible_model",
	detonation_radius	= 3,
	
	flare_color			= "200 200 255 20",
	flare_size			= 0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,

	spell_on_launch	= "Spell_OrbGun", --!!!

	hit_effect		= "particles/weapons/plasma/hit",
	work_sound 	    = "sound/weapons/singularity/sg_fly",
	effect 			= "particles/weapons/big/plasma_orb",
	
	explosion_blast_wave 		= "Blastwave_OrbGun",
	override_blast_wave_damage	= true,
	kill_effect_on_remove 		= true,
}

Def.Blastwave_OrbGun =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 500,
	blast_maxDistance		= 7,
	apply_damage			= true,

	effect 					= "particles/weapons/big/plasma_orb_explosion",
	light_color 			= "200 200 255 100",
	light_radius 			= 50,
	light_time 				= 0.4,
	sound 					= "sound/explosion/SmartRocket_expl",
}




Def.Weapon_OrbeGun_Pirate = 
{
	inherit 			= "Weapon_OrbGun",
	item_subtype		= ItemSubtype.OrbeGun_Pirate,
		
	fire_rate 			= 60,
	fire_rate_add		= 30,
	fire_rate_max		= 180,
	
	projectile_speed 	= 250.0,
	projectile_speed_add = 50,
	projectile_speed_max = 450,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	--required_role = ai.ShipRoles.ENGINEER,
}

-----------------------------------------------------------------------------------

-------------------------------------------
--   Weapon_OrbGunUnique #62296
-------------------------------------------
Def.Weapon_OrbGunUnique = 
{
	inherit 			= "Weapon_Base",
	class 				= "SingularityCannon",
	storeItemId	 = 0,
	in_editor	 = "false",
	
	--model				= "models/weapons/plasma/power/orb_gun",

	fire_rate 			= 60,
	dispersion			= 0,
	
	optimal_range		= 220,
	max_range			= 330,
	
	projectile_speed 	= 110.0,
	
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 50,
	damage_thermal		= 0,
	
	heat_max 			= 100,
	heat_add 			= 20,
	heat_sub 			= 20,
	overheat_time		= 0,
	
	projectile			= "Projectile_OrbGunUnique",
	shot_once_sound 	= "sound/weapons/orb/orb_shot",
	shot_beam_fx 		= "particles/weapons/big/plasma_orb_beam",
	shot_effect 		= "particles/weapons/big/plasma_orb_muzzle",
}

---#62800 пуха для Перехватчик РЭБ Иерихона "Karud" 15й ранг
Def.Weapon_PlasmagunEnergy =
{
    shot_energy_cost = 28, -- энргия за цель 


	fire_rate=180,
	projectile_speed=400,
	dispersion=0.1,
	dispersion_max=0.9,
	dispersion_add=0.1,
	dispersion_sub=-0.5,
	optimal_range=250,
	max_range=300,
	damage_emp=150,
	crit_chance=0.05,
	crit_damage=0.75,
	heat_max=10,
	heat_add=1,
	heat_sub=5,
	overheat_time=1,
	inherit="Weapon_AutoGun",
	model="models/weapons/plasma/econom/pl_training",
	default_icon="ItemSubtype_PlasmagunBasic",

	shopCategory="WEAPONS",
	shopSubCategory="PLASMA_GUNS",

	module_type=ai.ModuleType.WEAPON,
	class_mask=ai.ShipClass.SMALL,
	weapon_class=ai.WeaponClass.PLASMAGUN,
	projectile="Projectile_Plasma_Light",
	
	shot_effect = "particles/weapons/plasma/muzzle_energy",
	shot_once_sound = "sound/weapons/plasmagun/basic",
	muzzleflash_color = { kinetic = "160 160 255 128", emp = "160 160 255 128", thermal = "160 160 255 128", },
}


--
Def.Projectile_OrbGunUnique =
{
	inherit				= "Weapon_BaseRocket",
	
	detonation_radius	= 3,
	
	flare_color			= "200 200 255 20",
	flare_size			= 0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	missile_defence_immune 	= true,
	disable_concussion_sound = true,

	spell_on_launch	= "Spell_OrbGunUnique", --!!!

	hit_effect		= "particles/weapons/plasma/hit",
	work_sound 	    = "sound/weapons/singularity/sg_fly",
	effect 			= "particles/weapons/other/plasma_orb_unique",
	
	explosion_blast_wave 		= "Blastwave_OrbGunUnique",
	override_blast_wave_damage	= true,
	kill_effect_on_remove 		= true,
}

Def.Blastwave_OrbGunUnique =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 200,
	blast_maxDistance		= 7,
	apply_damage			= true,

	effect 					= "particles/weapons/other/plasma_orb_unique_explosion",
	light_color 			= "200 200 255 100",
	light_radius 			= 50,
	light_time 				= 0.4,
	sound 					= "sound/explosion/SmartRocket_expl",
}

-----------------------------------------------------------------------------------


Def.Weapon_Nanobots_Cloud =
{
	inherit 			= "Weapon_Base",
	class 			= "AutoGun",

	cycle_barrels 		= true,
	
	fire_rate			= 90,
	dispersion			= 0, 

	max_range			= 250,
	projectile_speed 		= 475.0,
	
	--damage			= 10,
	damage_kinetic		= 0,
	damage_emp		= 10,
	damage_thermal		= 0,
	
	heat_max 			= 15,
	heat_add 			= 5 + 1.5,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,

	projectile			= "Projectile_Nanobots_Cloud",
	friendly_fire 		= true,
	
--	shot_once_sound = "sound/weapons/artillery/art_shot",
	model			= "models/weapons/rail_guns/econom/rg_training",
	--item_subtype		= 9999,
	item_lvl			= 25,
	
	shot_once_sound = "sound/weapons/NanobotGun/nb_shot",
	muzzleflash_color = { kinetic = "87 143 255 96", emp = "87 143 255 96", thermal = "87 143 255 96", },
}


Def.Projectile_Nanobots_Cloud  =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/misc/invisible_model",
	explosion_blast_wave 		= "Blastwave_Nanobots_Cloud",
	override_blast_wave_damage = true,
	
	detonation_radius		= 9.5,
	
	flare_color			= "135 174 255 20",
	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/nanobots_trail",	
--	work_sound			= "",
	missile_defence_immune 	= true,
	--spell					= "Spell_Nanobots_Cloud",	
	spell					= "Spell_Nanobots_Direct",
	
	disable_concussion_sound = true,
	spell_sound_instead_of_blastwave_sound = true,
}


Def.Blastwave_Nanobots_Cloud  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp			= 1000,
	blast_maxDistance		= 12,
	apply_damage			= true,
	apply_shake 			= true,

	effect 				= "particles/explosions/nanobots_fire",
	light_color 				= "87 143 255 255",
	light_radius 			= 15,
	light_time 				= 0.2,
	sound 				= "sound/explosion/nanobot_expl",
	
}

-----------------------------------------------------------------------------------
Def.Weapon_Sparks_Cannon =
{
	inherit = "Weapon_Base",
	class = "AutoGun",

	cycle_barrels = true,
	
	fire_rate			= 50,
	dispersion			= 0, 
	dispersion_add		= 0.8, 
	dispersion_sub		= 0.6, 
	dispersion_max		= 3.5, 

	max_range			= 350,
	projectile_speed 		= 375.0,
	
	--damage			= 10,
	damage_kinetic		= 10,
	damage_emp		= 0,
	damage_thermal		= 0,
	
	heat_max 			= 15,
	heat_add 			= 2.5,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,

	projectile			= "Projectile_Sparks_Cannon",
	
	model			= "models/weapons/rail_guns/econom/rg_training",
	item_subtype		= ItemSubtype.SparksCannon,
	--item_lvl			= 25, -- на данный момент спелл не масштабируется от илвл пушки
	shot_once_sound 	= "sound/weapons/sparks_cannon/sc_shot",
	shot_effect 		= "particles/weapons/devostator_muzzle",
	muzzleflash_color = { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 	= 8,
}


Def.Projectile_Sparks_Cannon  =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave= "Blastwave_Sparks_Cannon",
	override_blast_wave_damage = true,
	
	detonation_radius	= 3.6,--

	flare_color			= "255 190 140 15",
	flare_size			= 0.15,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/devostrator_trail",	
	missile_defence_immune 	= true,
	spell				= "Spell_Sparks_Cannon",	
	disable_concussion_sound = true,
}

Def.Blastwave_Sparks_Cannon  =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 1000,
	blast_maxDistance	= 5,
	apply_damage		= true,
	apply_shake 		= false,

	effect 				= "particles/weapons/other/sparks_cannon_hit",
	light_color 		= "230 147 92 128",
	light_radius 		= 12,
	light_time 			= 0.2,
	sound 				= "sound/explosion/sparks_expl",
	
}

--------------------------------------------------------------------------------------------------------------------------

Def.Weapon_Cold_Ray =
{
	inherit 		= "Weapon_LaserGun",
	model 			= "models/weapons/lasers/power/l_training",
	
	fire_rate 		= 60,
	
	impulse_time 	= 1,
	dispersion 		= 0,
	
	optimal_range 	= 250,
	max_range 		= 350,
	
	damage_thermal = 10,
	
	heat_max 		= 10,
	heat_add 		= 1.6666667,
	heat_sub 		= 5,
	overheat_time 	= 1,
	
	spell_on_hit 	= "Spell_Cold_Ray",
	spell_on_hit_timeout = 0.5,
	
	module_type 	= ai.ModuleType.WEAPON,
	weapon_class 	= ai.WeaponClass.LASER,
	
	fire_fx 		= "particles/weapons/laser/muzzle_cold_ray",
	muzzleflash_radius = 2.5,
	beam_fx 		= "particles/weapons/laser/laser_cold_ray",
	hit_fx 			= "particles/weapons/laser/hit_cold_ray",
	
	shot_loop_sound = "sound/weapons/ColdRay/cd_start_loop",
	hit_loop_sound 	= "sound/hit/laser_loop",
	damage_color	  = { kinetic = ai.DONT_INHERIT, emp = ai.DONT_INHERIT, thermal = "255 255 255 255", },
	muzzleflash_color = { kinetic = "214 187 255 64", emp = "214 187 255 64", thermal = "214 187 255 64", },
}	

----------------------------------------------------------------------------------------------------------------------------------
--Донаторская пушка  аля StarWars

Def.Weapon_SWGift =
{
	inherit 		= "Weapon_Base",
	class 			= "AutoGun",

	cycle_barrels 		= true,
	
	--fire_rate		= 200,
	fire_rate		= 60, --макс 300. допускается 240. cycle_barrels =*4
	dispersion		= 0, 
	dispersion_add		= 0.4, 
	dispersion_sub		= 0.8, --0.6, 
	dispersion_max		= 1, 

	max_range		= 350,
	projectile_speed 	= 700.0,
	
	--damage		= 10,
	damage_kinetic		= 0,
	damage_emp		= 105,
	damage_thermal		= 0,
	
	heat_max 		= 15,
	heat_add 		= 2.5,
	heat_sub 		= 7.5,  	
	overheat_time 		= 1,

	projectile		= "Projectile_SWGift",
	
	model			= "models/weapons/rail_guns/econom/rg_training",
	item_subtype		= ItemSubtype.SWGift,
	--item_lvl		= 25, -- на данный момент спелл не масштабируется от илвл пушки
	shot_once_sound		= "sound/weapons/giftgun/gg_shot",
	shot_effect 		= "particles/weapons/alien/sw_gift_muzzle",
}

Def.Projectile_SWGift  =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/alien/sw_gift_hit",
	--effect 			= "particles/weapons/plasma/plasma_auto_projectile",	
	effect 			= "particles/weapons/alien/sw_gift_projectile_wide", -- Выглядит неплохо, чуть короче может надо.
	--effect 			= "particles/weapons/nuke/workflare",
	shadowCaster		= false,
	impact_type 		= "plasma",
	
}

--------------------------
--test_gun
Def.Weapon_TTTGun =
{
	class				= "AutoGun",
	--class_mask			= 2,
	weapon_class 		= 1,
	dispersion 			=5,
	item_subtype 		= 17,
	max_range 			= 500,
	optimal_range 		= 300,
	
	--is_shotgun = true,
	--cycle_barrels		=true
	no_friendly_fire 	= true,

	--storeItemId			= 0,
	--cant_be_bought  	= true,
	drop_weight			= 0,
	--tier 				= 4,
	
	fire_rate			= 30,
	damage_emp		 	= 100,
	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
	
	projectile			= "Projectile_TTTGun",
	shot_once_sound 	= "sound/weapons/aliengun/ag_shot",
	projectile_speed	= 150,	
	heat_add 			= 0,
	
	muzzleflash_color = { kinetic = "80 210 80 128", emp = "80 210 80 128", thermal = "80 210 80 128", },
	muzzleflash_radius 	= 35,
	
	uiName = "AlienGun",
}


Def.Projectile_TTTGun  =
{
	--inherit			= "Projectile_Plasma_Default",
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave 	= "Blastwave_TTTGun",
	override_blast_wave_damage = true,
	detonation_radius		= 10,
	
	flare_color			= "100 255 100 20",
	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,	
	model 				= "models/weapons/missile_rocket",	
	work_sound			= "sound/weapons/singularity/sg_fly",	
	effect 			= "particles/weapons/alien/alien_gun_projectile", 
	--shadowCaster	= false,
	--impact_type 	= "plasma",
	
	missile_defence_immune 	= true,	
	missile_detection_immune = true,
	is_guided		= true,
	angular_velocity= 30,
	--spell 			=
	
}

Def.Blastwave_TTTGun  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_maxDistance		= 12,
	apply_damage			= true,
	apply_shake 			= false,

	effect 					= "particles/weapons/alien/alien_gun_explosion",
	light_color 			= "100 255 100 100",
	light_radius 			= 20,
	light_time 				= 0.8,
	sound 					= "sound/explosion/nanobot_expl",
}

--------------------------

Def.Weapon_Fly_Gun =
{
	class				= "AutoGun",
	weapon_class 		= 1,
	dispersion 			= 15,
	item_subtype 		= 17,
	max_range 			= 400,
	optimal_range 		= 300,
	
	is_shotgun 			= true,
	--cycle_barrels		=true
	no_friendly_fire 	= true,
	
	--show_cooldown 		= true,


	--storeItemId			= 0,
	--cant_be_bought  	= true,
	drop_weight			= 0,
	--tier 				= 4,
	
	--fire_rate			= 30,
	--damage_emp		 	= 0,
	
	class_mask			= ai.ShipClass.LARGE + ai.ShipClass.MEDIUM + ai.ShipClass.SMALL,
	
	projectile			= "Projectile_Fly_Gun",
	shot_once_sound 	= "sound/weapons/flygun/flygun_shot",
	--projectile_speed	= 250,
	--heat_add 			= 0,
	
	muzzleflash_color = { kinetic = "120 210 255 255", emp = "120 210 255 255", thermal = "120 210 255 255", },
	muzzleflash_radius 	= 15,
	shot_effect 		= "particles/weapons/flygun/fly_gun_muzzle",
}


Def.Projectile_Fly_Gun  =
{
	--inherit			= "Projectile_Plasma_Default",
	--inherit				= "Weapon_BaseRocket",
	class				= "Rocket",
	explosion_blast_wave= "Blastwave_Fly_Gun",
	override_blast_wave_damage = true,
	detonation_radius	= 3,
	
	flare_color			= "176 226 255 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.05,
	effect 				= "particles/weapons/flygun/fly_gun_projectile_y",
	--effect 			= "particles/weapons/nuke/workflare",
	--shadowCaster	= false,
	--impact_type 		= "flygun",
	
	missile_defence_immune 	= true,	
	missile_detection_immune = true,
	is_guided			= true,
	angular_velocity	= 15.5,
	disable_concussion_sound = true,
	--spell 			=
}

Def.Projectile_Fly_Gun_Pirate  =
{
	inherit			= "Projectile_Fly_Gun",
	angular_velocity	= 30,

}

Def.Blastwave_Fly_Gun  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_maxDistance		= 7,
	apply_damage			= true,
	apply_shake 			= false,
	--intensity				= 0,
	apply_torque 			= false,  -- #49109

	-- слишком тяжелый для 12 пуль! 	effect 					= "particles/weapons/other/fly_gun_explosion",
	effect 					= "particles/weapons/flygun/explode",

	light_color 			= "120 210 255 64",
	light_radius 			= 15,
	light_time 				= 0.25,
	sound 					= "sound/explosion/flygun_expl",
	--light_color 			= "200 255 200 64",
	--light_radius 			= 20,
	--light_time 				= 1.8,
}


----------------------------------------------------------------------------------------------------------
-- прототип пушки для гварда
Def.Weapon_Radiation_Beam =
{
	--inherit 				= "Weapon_LaserGun",
	inherit 				= "Weapon_Base",
	class 					= "LaserGunRay",
	focus_distance			= 10,
	
	model 					= "models/weapons/lasers/power/l_training",
	
	fire_rate 				= 60,
	
	impulse_time 			= 1,
	dispersion 				= 0,
	
	optimal_range 			= 450,
	max_range 				= 550,
	
	--damage_emp 				= 1,
	damage_thermal 			= 100,

	
	heat_max 				= 10,
	heat_add 				= 1.6666667,
	heat_sub 				= 5,
	overheat_time 			= 1,
	
	spell_on_hit 			= "RadiationSource",
	spell_on_hit_timeout 	= 1,
	
	module_type 			= ai.ModuleType.WEAPON,
	weapon_class 			= ai.WeaponClass.LASER,
	
	damage_color	  = { kinetic = ai.DONT_INHERIT, emp = ai.DONT_INHERIT, thermal = "255 255 255 255", },
	muzzleflash_color = { kinetic = "200 55 50 64", emp = "200 55 50 64", thermal = "200 55 50 64", },
	muzzleflash_radius 		= 15,

	
	--uiName = "Weapon_Laser_Heavy",
	--uiDesc = "Weapon_Laser_Heavy_Desc",
	beam_start_fx			= "particles/weapons/laser/radiation_beam_start",
	beam_fx 				= "particles/weapons/laser/radiation_beam",
	hit_fx 					= "particles/weapons/laser/radiation_beam_hit",
	focus_fx 				= "particles/weapons/laser/radiation_beam_focus",

	shot_loop_sound 		= "sound/weapons/laser/radiation",
	hit_loop_sound 			= "sound/hit/laser_loop",
}	
----------------------------------------------------
--
Def.Weapon_ChargableGun = 
{
	inherit 			= "Weapon_Base",
	class 				= "ChargableGun",
	model				= "models/weapons/rail_guns/econom/rg_training",

	fire_rate 			= 60,
	dispersion			= 0,
	
	optimal_range		= 500,
	max_range			= 650,
	
	projectile_speed 	= 80.0,
	
	no_friendly_fire 	= true,
	
	--damage			= 0,
	--damage_kinetic	= 0,
	damage_emp			= 38,
	--damage_thermal	= 0,
	
	heat_max 			= 100,
	heat_add 			= 20,
	heat_sub 			= 100,
	overheat_time		= 0,
	
	muzzleflash_color = { kinetic = "198 189 255 196", emp = "198 189 255 196", thermal = "198 189 255 196", },
	muzzleflash_radius 	= 20,

	charge_levels 		= {
		{ time = 0, projectile = "Projectile_ExplodingProjectile_Fast", speed_mul = 10, damage_mul = 0, heat_add_mul = 0 },
		{ time = 2, projectile = "Projectile_ExplodingProjectile_Slow", speed_mul = 0, damage_mul = 3, heat_add_mul = 1, ai_optimal=true, },
	},
	explosion_mul 		= 20,

	--shot_once_sound = "sound/weapons/singularity/sg_shot",
	shot_beam_fx 		= "particles/weapons/other/chargable_gun_beam",
	shot_effect 		= "particles/weapons/other/chargable_gun_muzzle",
}

Def.Blastwave_ChargableGun_Base =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 1,
	--intensity 			= 0,
	--blast_minDistance	= 30,
	blast_maxDistance	= 55,
	apply_damage		= true,
	apply_shake 		= false,

	effect 				= "particles/weapons/other/chargable_gun_explosion", 
	light_color 		= "255 100 0 100",
	light_radius 		= 20,
	light_time 			= 0.8,
	sound 				= "sound/explosion/chargegun_expl",
}

----------------------------------------------------
Def.Weapon_SmartRocketLauncher =
{
	class 				= "SmartRocketLauncher",

	cycle_barrels		= true,
	heat_max 			= 10,
	heat_add 			= 4,
	heat_sub 			= 5,
	fire_rate 			= 15, -- из расчета 1 выстрел в секунду при 4ех стволах.       14/25 16/25 18/25 -- на такой реальный фаер рейт надо расчитывать
	optimal_range		= 300,
	max_range			= 400,
	
	--show_cooldown 		= true,

	
	projectile 			= "Projectile_SmartRL",
	shot_once_sound 	= "sound/weapons/smartRocket/smr",
	projectile_speed	= 172,	
	
	damage_emp			= 2310,  -- примерно пересчитано по фаер рейту  эксперементальному 16/25  с миномета t5mk1
	no_friendly_fire 	= true,

	targeting_beam_fx	= "particles/weapons/machete_laser",
	beam_bone 			= "rocket_1",
	
	--shot_effect = "particles/weapons/smart_muzzle", --New Year 
	shot_effect = "particles/weapons/smart_muzzle",	
	muzzleflash_color = { kinetic = "130 130 250 128", emp = "130 130 250 128", thermal = "130 130 250 128", },
	muzzleflash_radius 	= 8,
}


Def.Projectile_SmartRL =
{
	inherit 					= "Weapon_BaseRocket",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	is_guided					= true,
	angular_velocity			= 63,
	
	detonation_radius			= 7,
	
	explosion_blast_wave 	= "Blastwave_SmartRL",

	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	--effect 				= "particles/weapons/fireworks/newyear3_projectile", --New Year
	effect 				= "particles/weapons/smart_projectile",
	impact_type 		= "plasma",
}

Def.Projectile_SmartRL_Pirate =
{
	inherit 					= "Projectile_SmartRL",
	angular_velocity			= 200,	
}

Def.Blastwave_SmartRL  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_minDistance		= 3,
	blast_maxDistance		= 8,
	apply_damage			= true,
	apply_shake 			= true,

	---effect 					= "particles/weapons/fireworks/newyear3_explosion", --New Year
	effect 					= "particles/weapons/smart_explosion",
	--effect 				= "particles/explosions/explosion_big3_electric",
	light_color 			= "160 160 255 100",
	---light_color 			= "255 170 191 255", --New Year
	light_radius 			= 18,
	light_time 				= 1.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}
Def.Weapon_SuppressingGun =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	fire_rate				= 100,
	cycle_barrels 			= true,
	no_friendly_fire		= true,
	override_blast_wave_damage = true,

	dispersion				= 0.3,
	optimal_range			= 330,
	max_range				= 400,
	projectile_speed		= 350,
	
	damage_thermal			= 181.8,
	crit_chance				= 0.05,
	crit_damage				= 0.5,
	
	heat_max				= 10,
	heat_add				= 1.04,
	heat_sub				= 5,
	overheat_time			= 1,
	
	--spell_on_hit 			= "SuppressingFire",  -- это работает только для лазеров, поэтому пришлось перенести все в ракету
	--spell_on_hit_timeout 	= 1,
	
	--model					= "models/weapons/lasers/sniper/l_training",
	module_type				= ai.ModuleType.WEAPON,
	projectile				= "Projectile_SuppressingGun",
	shot_effect 			= "particles/weapons/suppressing_muzzle",
	--shot_effect 			= "particles/weapons/fireworks/newyear2_muzzle", --New Year
	muzzleflash_color = { kinetic = "255 135 15 100", emp = "255 135 15 100", thermal = "255 135 15 100", },
	muzzleflash_radius 		= 4,
	shot_once_sound 		= "sound/weapons/suppress/suppr",
}

Def.Projectile_SuppressingGun =
{
	class					= "Rocket",
	
	hitbox_min 		= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max		= Vec3( 0.1, 0.1, 0.1 ),
	
	explosion_blast_wave	= "Blastwave_SuppressingGun",
	effect 					= "particles/weapons/suppressing_projectile",
	--effect 					= "particles/weapons/fireworks/newyear2_projectile_v2", --New Year
	override_blast_wave_damage = true,
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	
	detonation_radius		= 1,

	flare_color				= "255 150 100 15",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
	spell 					= "SuppressingFire",
}

Def.Blastwave_SuppressingGun  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 10,
	blast_maxDistance		= 5,
	apply_damage			= true,
	apply_shake 			= false,

	--effect 					= "particles/weapons/fireworks/newyear2_explosion_v2", --New Year
	effect 					= "particles/weapons/suppressing_hit",
	light_color 			= "255 128 128 20",
	light_radius 			= 12,
	light_time 				= 0.4,
	sound 					= "sound/weapons/suppress/suppr_hit",
}


-------------------------------------------------------------------
-- притягивающая пушка для Reaper
-------------------------------------------------------------------
------------
Def.Weapon_Grab =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",

	cycle_barrels 		= true,
	
	fire_rate			= 18,
	dispersion			= 0, 

	max_range			= 250,
	projectile_speed 	= 300.0,
	
	--damage_kinetic		= 10,
	damage_emp			= 10,
	--damage_thermal		= 0,
	
	heat_max 			= 10,
	heat_add 			= 5 + 1.5,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,
	
	no_friendly_fire	= true,
	
	projectile			= "Projectile_Grab",
	muzzleflash_color = { kinetic = "90 156 255 128", emp = "90 156 255 128", thermal = "90 156 255 128", },
	model				= "models/weapons/rail_guns/econom/rg_training",
	shot_effect 		= "particles/weapons/other/grab_muzzle",
	shot_once_sound 	= "sound/weapons/grab/grab_fire",
}


Def.Projectile_Grab =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/misc/invisible_model",
	explosion_blast_wave= "Blastwave_Grab_Base",
	override_blast_wave_damage = true,
	
	detonation_radius	= 4,

	flare_color			= "100 200 255 1",
	flare_size			= 0.2,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/other/grab_projectile",	
--	work_sound			= "",
	spell 					= "GrabFire",
	missile_defence_immune 	= true,
}


Def.Blastwave_Grab_Base =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 1000,
	blast_maxDistance	= 8,
	blast_minDistance	= 3,
	apply_damage		= true,
	apply_shake 		= true,

	--effect 				= "particles/weapons/other/grab_explosion",
	effect 				= "particles/weapons/other/grab_explosion",
	light_color 		= "110 167 255 255",
	light_radius 		= 15,
	light_time 			= 0.3,
	sound 				= "sound/explosion/nanobot_expl",
}

-------------------------------------------------------------------
-- Зеленая эвент пушка фрегатов 
-------------------------------------------------------------------
------------
Def.Weapon_PlasmaBlade =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",

	cycle_barrels 		= true,
	
	fire_rate			= 18,
	dispersion			= 0, 

	optimal_range			= 380,
	max_range				= 450,
	
	projectile_speed 	= 100.0,
	
	--damage_kinetic		= 10,
	damage_emp			= 10,
	--damage_thermal		= 0,
	
	heat_max 			= 10,
	heat_add 			= 1,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,
	
	no_friendly_fire	= true,
	
	projectile			= "Projectile_PlasmaBlade",
	muzzleflash_color = { kinetic = "162 228 205 64", emp = "162 228 205 64", thermal = "162 228 205 64", },
	model				= "models/weapons/plasma_blade/plasma_blade",
	shot_effect 		= "particles/weapons/other/plasmablade_muzzle",
	shot_once_sound 	= "sound/weapons/singularity/sg_shot",
}


Def.Projectile_PlasmaBlade =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/plasmablade",
	explosion_blast_wave= "Blastwave_PlasmaBlade",
	override_blast_wave_damage = true,
	
	detonation_radius	= 5,
	hitbox_min 			= Vec3( -1.2, -0.2, -1.2 ),
	hitbox_max			= Vec3( 1.2, 0.2, 1.2 ),
	
	flare_color			= "100 200 255 1",
	flare_size			= 0.2,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/other/plasmablade_projectile",
	--work_sound		= "",
	spell 				= "PlasmaBlade",
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	disable_concussion_sound = true,
	fixed_axis			= "y",  -- x - наведение только по вертикали; y - по горизонтали
	angular_velocity	= 160,
	is_guided			= true,

	children 	= 	{
						{ effect ="particles/weapons/other/plasmablade_chain", joint = "fx1" },
						{ effect ="particles/weapons/other/plasmablade_chain", joint = "fx2" },
					},
}

Def.Projectile_PlasmaBlade_C = 
{
	inherit				= "Projectile_PlasmaBlade",
	fixed_axis			= ai.DONT_INHERIT,  -- x - наведение только по вертикали; y - по горизонтали
}	

Def.Blastwave_PlasmaBlade =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 1000,
	blast_maxDistance	= 9,
	blast_minDistance	= 5,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/weapons/other/plasmablade_explosion",
	light_color 		= "110 167 255 255",
	light_radius 		= 15,
	light_time 			= 0.3,
	sound 				= "sound/explosion/small_rocket_expl",
}

--test_destroyer_gun
--[[ Def.Weapon_Railgun_Destr={}
Def.Weapon_Railgun_Destr.mark=3
Def.Weapon_Railgun_Destr.tier=3
Def.Weapon_Railgun_Destr.item_lvl=23
Def.Weapon_Railgun_Destr.rank=7
Def.Weapon_Railgun_Destr.fire_rate=200
Def.Weapon_Railgun_Destr.projectile_speed=400
Def.Weapon_Railgun_Destr.dispersion=0.14
Def.Weapon_Railgun_Destr.dispersion_max=2.00004
Def.Weapon_Railgun_Destr.dispersion_add=0.400008
Def.Weapon_Railgun_Destr.dispersion_sub=4.00008
Def.Weapon_Railgun_Destr.optimal_range=220
Def.Weapon_Railgun_Destr.max_range=295
Def.Weapon_Railgun_Destr.damage_kinetic=131.6
Def.Weapon_Railgun_Destr.crit_chance=0.2
Def.Weapon_Railgun_Destr.crit_damage=0.5
Def.Weapon_Railgun_Destr.heat_max=10
Def.Weapon_Railgun_Destr.heat_add=1.6666667
Def.Weapon_Railgun_Destr.heat_sub=12.5
Def.Weapon_Railgun_Destr.overheat_time=1.5
Def.Weapon_Railgun_Destr.DPS=438.6666667
Def.Weapon_Railgun_Destr.inherit="Weapon_AutoGun"
Def.Weapon_Railgun_Destr.model="models/weapons/rail_guns/econom/rg_experimental"
Def.Weapon_Railgun_Destr.default_icon="ItemSubtype_RailgunBasic"
--Def.Weapon_Railgun_Destr.storeItemId=516
Def.Weapon_Railgun_Destr.shopCategory="WEAPONS"
Def.Weapon_Railgun_Destr.shopSubCategory="RAIL_GUNS"
Def.Weapon_Railgun_Destr.item_subtype=ItemSubtype.RailgunBasic
Def.Weapon_Railgun_Destr.module_type=ai.ModuleType.WEAPON
--Def.Weapon_Railgun_Destr.class_mask=ai.ShipClass.MEDIUM
Def.Weapon_Railgun_Destr.weapon_class=ai.WeaponClass.RAILGUN
Def.Weapon_Railgun_Destr.projectile="Projectile_Nail_Iron"]]

--[[
 Def.Weapon_PredictMinigun_T3_Mk1 =
 {
	inherit				="Weapon_Minigun_T3_Mk1",
	accurate_aim_coef	= 0.5,
	cant_be_bought		= false,
	storeItemId			= 9691,
	uiName 				= "new_test_gun",
 }

 Def.Weapon_Railgun_PredictBasic_T3_Mk1 =
{
	inherit				="Weapon_Railgun_Basic_T3_Mk1",
	accurate_aim_coef	= 0.7,
	storeItemId			= 9698,
	uiName 				= "new_test_gun",
}

Def.Weapon_Plasmagun_PredictAutofire_T3_Mk1 =
{
	inherit				="Weapon_Plasmagun_Basic_T3_Mk1",
	accurate_aim_coef	= 0.9,
	storeItemId			= 9705,
	cant_be_bought		= false,
	uiName 				= "new_test_gun",
}

 
--Three test big predict weapons
 Def.Weapon_PredictMinigun_T3_Mk1 =
 {
	inherit				="Weapon_Minigun_T3_Mk1",
	accurate_aim_coef	= 3,
	cant_be_bought		= false,
	storeItemId			= 9691,
	uiName 				= "new_test_gun",
 }
Def.Weapon_PredictMinigun_T3_Mk2 =
{
	 inherit				="Weapon_Minigun_T3_Mk2",
	 accurate_aim_coef	= 3,
	 storeItemId			= 9692,
	 uiName 				= "new_test_gun",
 }
 Def.Weapon_PredictMinigun_T3_Mk3 =
{
	 inherit				="Weapon_Minigun_T3_Mk3",
	 accurate_aim_coef	= 3,
	 storeItemId			= 9693,
	 uiName 				= "new_test_gun",
 }
 Def.Weapon_PredictMinigun_T3_Prem =
 {
	 inherit				="Weapon_Minigun_T3_Prem",
	 accurate_aim_coef	= 3,
	 storeItemId			= 9694,
	 uiName 				= "new_test_gun",
 }
 Def.Weapon_PredictMinigun_T3_Rare =
 {
	inherit				="Weapon_Minigun_T3_Rare",
	accurate_aim_coef	= 3,
	storeItemId			= 9695,
	uiName 				= "new_test_gun",
-- }
-- Def.Weapon_PredictMinigun_T3_Epic =
-- {
	-- inherit				="Weapon_Minigun_T3_Epic",
	-- accurate_aim_coef	= 0.5,
	-- storeItemId			= 9696,
	-- uiName 				= "new_test_gun",
-- }
-- Def.Weapon_PredictMinigun_T3_Rel =
-- {
	-- inherit				="Weapon_Minigun_T3_Rel",
	-- accurate_aim_coef	= 3,
	-- storeItemId			= 9697,
	-- uiName 				= "new_test_gun",
-- }

Def.Weapon_Railgun_PredictBasic_T3_Mk1 =
 {
	inherit				="Weapon_Railgun_Basic_T3_Mk1",
	accurate_aim_coef	= 4,
	storeItemId			= 9698,
	uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Railgun_PredictBasic_T3_Mk2 =
-- {
	-- inherit				="Weapon_Railgun_Basic_T3_Mk2",
	-- accurate_aim_coef	= 4,
	-- storeItemId			= 9699,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Railgun_PredictBasic_T3_Mk3 =
-- {
	-- inherit				="Weapon_Railgun_Basic_T3_Mk3",
	-- accurate_aim_coef	= 4,
	-- storeItemId			= 9700,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Railgun_PredictBasic_T3_Prem =
-- {
	-- inherit				="Weapon_Railgun_Basic_T3_Prem",
	-- accurate_aim_coef	= 4,
	-- storeItemId			= 9701,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Railgun_PredictBasic_T3_Rare =
-- {
	-- inherit				="Weapon_Railgun_Basic_T3_Rare",
	-- accurate_aim_coef	= 4,
	-- storeItemId			= 9702,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Railgun_PredictBasic_T3_Epic =
-- {
	-- inherit				="Weapon_Railgun_Basic_T3_Epic",
	-- accurate_aim_coef	= 4,
	-- storeItemId			= 9703,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Railgun_PredictBasic_T3_Rel =
-- {
	-- inherit				="Weapon_Railgun_Basic_T3_Rel",
	-- accurate_aim_coef	= 4,
	-- storeItemId			= 9704,
	-- uiName 				= "new_test_gun",
-- }

Def.Weapon_Plasmagun_PredictAutofire_T3_Mk1 =
{
	inherit				="Weapon_Plasmagun_Basic_T3_Mk1",
	accurate_aim_coef	= 5,
	storeItemId			= 9705,
	cant_be_bought		= false,
	uiName 				= "new_test_gun",
}

-- Def.Weapon_Plasmagun_PredictAutofire_T3_Mk2 =
-- {
	-- inherit				="Weapon_Plasmagun_Basic_T3_Mk2",
	-- accurate_aim_coef	= 5,
	-- storeItemId			= 9706,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Plasmagun_PredictAutofire_T3_Mk3 =
-- {
	-- inherit				="Weapon_Plasmagun_Basic_T3_Mk3",
	-- accurate_aim_coef	= 5,
	-- storeItemId			= 9707,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Plasmagun_PredictAutofire_T3_Prem =
-- {
	-- inherit				="Weapon_Plasmagun_Basic_T3_Prem",
	-- accurate_aim_coef	= 5,
	-- storeItemId			= 9708,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Plasmagun_PredictAutofire_T3_Rare =
-- {
	-- inherit				="Weapon_Plasmagun_Basic_T3_Rare",
	-- accurate_aim_coef	= 5,
	-- storeItemId			= 9709,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Plasmagun_PredictAutofire_T3_Epic =
-- {
	-- inherit				="Weapon_Plasmagun_Basic_T3_Epic",
	-- accurate_aim_coef	= 5,
	-- storeItemId			= 9710,
	-- uiName 				= "new_test_gun",
-- }

-- Def.Weapon_Plasmagun_PredictAutofire_T3_Rel =
-- {
	-- inherit				="Weapon_Plasmagun_Basic_T3_Rel",
	-- accurate_aim_coef	= 5,
	-- storeItemId			= 9711,
	-- uiName 				= "new_test_gun",
-- }

]]
Def.Weapon_CrystallSparks =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	fire_rate				= 50,
	fire_rate_max 			= 500,
	fire_rate_add			= 300,

	cycle_barrels 			= true,
	
	--no_friendly_fire		= true, ---
	--override_blast_wave_damage = true, ---

	dispersion				= 0.3,	
	dispersion_max			= 2,
	dispersion_add			= 0.25,
	dispersion_sub			= 2,
	
	optimal_range			= 230,
	max_range				= 300,
	projectile_speed		= 400,
	
	damage_kinetic			= 100,
	crit_chance				= 0.05,
	crit_damage				= 0.5,
	
	heat_max				= 10,
	heat_add				= 1.6,
	heat_sub				= 5,
	overheat_time			= 1,

	
	model					= "models/weapons/lasers/sniper/l_training",
	module_type				= ai.ModuleType.WEAPON,
	projectile				= "Projectile_CrystallSparks",
	shot_effect 			= "particles/weapons/alien/crystal_muzzle",
	muzzleflash_color = { kinetic = "32 128 64 100", emp = "32 128 64 100", thermal = "32 128 64 100", },
	muzzleflash_radius 		= 4,
	shot_once_sound 		= "sound/weapons/CrystalSparks/cs_shot",
}

Def.Projectile_CrystallSparks =
{
	class					= "ChainLightningProjectile",
	link_range 				= 40,--20
	chaing_damage			= { 1, 0.75 },
	chain_target			= { 
		class 				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 		= ai.SpellTargetRelationship.ENEMY + ai.SpellTargetRelationship.NEUTRAL,
		},
	shield_subtypes 		= { ItemSubtype.SectorShield, ItemSubtype.Screen, },
			--[[ 
			добавил класс ChainLightningProjectile
			у него:
			link_range - макс расстояние между врагами в цепочке
			chaing_damage - массив из коэффициентов, на которые будет умножаться дамаг для врагов в цепочке
			chain_target - тип целей аналогично аурам (новый формат)
			 ]]
	hitbox_min 				= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max				= Vec3( 0.1, 0.1, 0.1 ),
	
	effect 					= "particles/weapons/alien/crystal_projectile",
	beam_fx 				= "particles/weapons/alien/crystal_beam",
	chain_hit_fx 			= "particles/weapons/alien/crystal_beam_hit",
	
	detonation_radius		= 1,

	flare_color				= "255 150 100 15",
	flare_size				= 0.0, --0
	flare_angle				= 180,
	flare_nebulosity		= 0.1,--0.1,

	impact_type 		= "CrystallSparks",
	--reflection_immune		= true,
}

------------------------------------------------------------------------
--             Разветленный молния -- мет
------------------------------------------------------------------------
Def.Weapon_ForkLaser =
{
	inherit 				= "Weapon_Base",
	class 					= "ForkGun", -- новый класс

	dispersion 				= 5,

	fire_rate 				= 100,
	target_energy_cost 		= 100, -- энргия за цель
	model					= "models/weapons/thi_dum/thi_dum",
	focus_distance			= 6,
	
	shot_beam_fx 	        = "particles/weapons/alien/forklaser_beam", 
	shot_effect 				= "particles/weapons/alien/forklaser_muzzle",
	focus_fx 				= "particles/empty",
	hit_fx					= "particles/weapons/alien/forklaser_hit_2",

	shot_once_sound 		= "sound/weapons/laser/ForkLaser_fire",
	
	damage_color		= { kinetic = "143 239 143 255", emp = "143 239 143 255", thermal = "143 239 143 255", },
	muzzleflash_color = { kinetic = "192 255 192 128", emp = "192 255 192 128", thermal = "192 255 192 128", },
	muzzleflash_radius 		= 16,
	
	impact_type = "plasma", --"laser",
} 
------------------------------------------------------------------------
--             Разветленная молния --для уникальных ударок (Deimos 2)
------------------------------------------------------------------------
Def.Weapon_ForkLaserLight =
{
	inherit 				= "Weapon_Base",
	class 					= "ForkGun", -- 

	damage_thermal			= 10,
	damage_thermal_add		= 1,
	damage_thermal_sub		= 5,
	damage_thermal_max		= 15,


	heat_max				= 10,
	heat_add 				= 0.83,
	heat_sub 				= 5,
	overheat_time 			= 1,

	dispersion 				= 7,
	dispersion_max 			= 0.05,
	dispersion_add 			= -3.5,
	dispersion_sub 			= -7/1.5,

	fire_rate 				= 120,
	target_energy_cost 		= 100, -- энргия за цель
	model					= "models/weapons/beam_cannon/beam_cannon_mod1",
	focus_distance			= 6,
	
	shot_beam_fx 	        = "particles/weapons/laser/deimos_laser_beam", 
	shot_effect 			= "particles/weapons/laser/deimos_laser_muzzle",
	focus_fx 				= "particles/empty",
	hit_fx					= "particles/weapons/laser/deimos_laser_muzzle",

	shot_once_sound 		= "sound/weapons/laser/ForkLaser_light_fire",
	
	muzzleflash_color = { kinetic = "255 250 231 128", emp = "255 250 231 128", thermal = "255 250 231 128", },
	muzzleflash_radius 		= 16,
	
	impact_type 			= "plasma",
} 

Def.Weapon_HeatingGun ={
	fire_rate=180,
	projectile_speed=320,
	projectile_speed_add=90,
	projectile_speed_max=590,
	dispersion=0,
	dispersion_max=1.2,
	dispersion_add=0.2,
	dispersion_sub=1.2,
	optimal_range=230,
	max_range=305,
	damage_emp=66,
	damage_emp_add=33,
	damage_emp_sub=113.1428571,
	damage_emp_max=264,
	crit_chance=0.05,
	crit_damage=0.75,
	heat_max=10,
	heat_add=1.25,
	heat_sub=5,
	overheat_time=1.5,
	inherit="Weapon_AutoGun",
	default_icon="ItemSubtype_HeatingGun",
	item_subtype=ItemSubtype.HeatingGun,
	module_type=ai.ModuleType.WEAPON,
	weapon_class=ai.WeaponClass.PLASMAGUN,
	default_icon=ItemSubtype_HeatingGun,
	model="models/weapons/skrah/skrah",
	default_custom_elements={
		[ai.VesselCustomSlot.MATERIAL_0]="weapons_pir_panisher1",
		[ai.VesselCustomSlot.MATERIAL_1]="weapons_pir_panisher2",
		[ai.VesselCustomSlot.MATERIAL_2]="weapons_pir_panisher3",
	},

	projectile				= "Projectile_HeatingGun",
	shot_effect 			= "particles/weapons/alien/heatinggun_muzzle",
	muzzleflash_color = { kinetic = "130 255 172 48", emp = "130 255 172 48", thermal = "130 255 172 48", },
	muzzleflash_radius 		= 8,
}

Def.Weapon_CrystalBuckshotGun = {
	inherit="Weapon_AutoGun",
	fire_rate=120,
	projectile_speed=965,
	dispersion=8,
	dispersion_max=2,
	dispersion_add=-2,
	optimal_range=230,
	max_range=305,
	damage_kinetic=132,
	crit_chance=0.07,
	crit_damage=0.5,
	is_shotgun = true,
	charge_max=4,
	--max_charge_auto_shoot=true,
	heat_max=10,
	heat_add=1.25,
	heat_sub=10,
	overheat_time=1.5,
	default_icon="ItemSubtype_CrystalBuckshotGun",
	item_subtype=ItemSubtype.CrystalBuckshotGun,
	module_type=ai.ModuleType.WEAPON,
	weapon_class=ai.WeaponClass.PLASMAGUN,
	default_icon="ItemSubtype_CrystalBuckshotGun",
	model="models/weapons/skrah/skrah",
	default_custom_elements={
		[ai.VesselCustomSlot.MATERIAL_0]="weapons_pir_panisher1",
		[ai.VesselCustomSlot.MATERIAL_1]="weapons_pir_panisher2",
		[ai.VesselCustomSlot.MATERIAL_2]="weapons_pir_panisher3",
	},
	
	projectile				= "Projectile_CrystalBuckshot",
	shot_effect 			= "particles/weapons/alien/crystalbuckshot_muzzle",
	muzzleflash_color = { kinetic = "50 128 75 255", emp = "50 128 75 255", thermal = "50 128 75 255", },
	muzzleflash_radius 		= 20,
}

Def.Projectile_CrystalBuckshot =
{
	inherit					= "Projectile_Neutron",
	impact_type 			= "crystal_shard",
	hitbox_min 				= Vec3( -1.1, -1.1, -0.9 ),
	hitbox_max				= Vec3( 1.1, 1.1, 0.5 ),
	effect 					= "particles/weapons/alien/crystalbuckshot_projectile",
	hit_effect				= "particles/weapons/alien/crystal_beam_hit",
}

Def.Weapon_SpyDroneScout =
{
	inherit				= "Weapon_AutoGun",
	spell_on_hit		= "SpyDroneDebuff",
	cycle_barrels		= true,
	shot_once_sound		= "sound/weapons/railgun/basic",
}

--#65743: Зеленая пушка на эсминцы
Def.Weapon_GreenGravityAnomaly =
{
	inherit				= "Weapon_AutoGun",
	class				= "SingularityCannon", --создает 1 прожектайл
	projectile			= "Projectile_GreenGravityAnomaly",
	--projectile			= "Projectile_BubbleBullet",--TEST
	damage_emp			= 100,
	fire_rate			= 40,
	model				= "models/weapons/plasma_blade/plasma_blade",
	shot_beam_fx		= "particles/weapons/big/gravy_stick_beam",
	--shot_beam_fx		= "", --TEST
	shot_once_sound		= "sound/weapons/GreenGravityAnomaly/ga_fire",
	shot_effect 		= "particles/weapons/big/gravy_stick_muzzle2",
	--shot_effect 		= "", --TEST
	muzzleflash_color = { kinetic = "0 0 0 0", emp = "0 0 0 0", thermal = "0 0 0 0", },
	muzzleflash_radius 	= 1,
	projectile_speed	= 200,
	max_range			= 425,
	module_type			= ai.ModuleType.WEAPON,
	no_friendly_fire	= true,
}

Def.Projectile_GreenGravityAnomaly =
{
	inherit				= "Projectile_Plasma_Light",
	class				= "Rocket",
	hitbox_max			= Vec3(10.5, 0.2, 2),
	hitbox_min			= Vec3(-10.5, -0.2, -2),
	explosion_blast_wave	= "Blastwave_GreenGravityAnomaly",
	override_blast_wave_damage = true,
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	spell				= "GreenGravityAnomaly",
	--spell						= "ZoneCleaner", --TEST
	effect 				= "particles/weapons/big/gravy_stick_projectile2",
	--effect 					= "particles/weapons/zonecleaner_projectile", --TEST
	detonation_radius		= 0.5,
	impact_type 		= "rocket",
	flare_color				= "255 150 100 0",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
}

Def.Blastwave_GreenGravityAnomaly = 
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 10,
	blast_maxDistance		= 15,
	apply_damage			= true,
	apply_shake 			= false,
	
	effect 					= "particles/weapons/big/gravy_stick",
	--effect 						= "particles/weapons/zonecleaner_explosion",  --TEST
	light_color 			= "161 255 183 100",
	light_radius 			= 40,
	light_time 				= 1.0,
	sound 					= "sound/weapons/suppress/suppr_hit",
}

-----------------------------------------------------------------------------------------------------
Def.Weapon_BubbleGun = 
{
	inherit 			= "Weapon_Base",
	class 				= "ChargableGun",
	model				= "models/weapons/rail_guns/econom/rg_training",

	fire_rate 			= 300,
	dispersion			= 1.15,
	
	optimal_range		= 250,
	max_range			= 250 * 1.3,
	
	projectile_speed 	= 400,
	
	no_friendly_fire 	= true,
	
	--damage			= 0,
	--damage_kinetic	= 0,
	damage_emp			= 1,
	--damage_thermal	= 0,
	
	heat_max 			= 100,
	heat_add 			= 10,
	heat_sub 			= 100,
	overheat_time		= 0,
	
	muzzleflash_color = { kinetic = "160 255 160 255", emp = "160 255 160 255", thermal = "160 255 160 255", },
	muzzleflash_radius 	= 10,

	charge_levels 		= {
		{ time = 0, projectile = "Projectile_BubbleGunBubble", speed_mul = -60, damage_mul = 4.5, heat_add_mul = 15 },
		{ time = 1, projectile = "Projectile_BubbleBullet", speed_mul = 0, damage_mul = 0, heat_add_mul = 0, force_prediction = true, ai_optimal=true, },
	},
	--explosion_mul 		= 1,

	--shot_once_sound = "sound/weapons/singularity/sg_shot",
	shot_beam_fx 		= "particles/weapons/big/bubble_beam_projectile",
	shot_effect 		= "particles/weapons/big/bubble_muzzle",
}
Def.Projectile_BubbleGunBubble =
{
	--inherit				= "Projectile_Plasma_Light",
	class				= "Rocket",
	--hitbox_max			= Vec3(15, 0.2, 2),
	--hitbox_min			= Vec3(-15, -0.2, -2),
	explosion_blast_wave	= "Blastwave_BubbleGunBubbleBlast",
	override_blast_wave_damage = true,
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	disable_concussion_sound = true,

	shot_once_sound = "sound/weapons/BubbleGun/bg_shot_slow",
	
	angular_velocity	= 140,
	is_guided			= true,
	time_to_live		= 7,
		
	effect 				= "particles/weapons/big/bubble_bubble",
	
	detonation_radius		= 1,
	
	flare_color				= "55 50 250 0",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
}

Def.Projectile_BubbleBullet =
{
	inherit					= "Projectile_Plasma_Default",
	effect 					= "particles/weapons/big/bubble_projectile",
	hit_effect				= "particles/weapons/big/bubble_projectile_explosion",
	smooth_effect_param 	= true,

	shot_once_sound = "sound/weapons/BubbleGun/bg_shot_fast",
	spell_on_launch			= "ChargableGun_NoHeat",
	
	shadowCaster			= false,
	impact_type 			= "railgun",
}

Def.Blastwave_BubbleGunBubbleBlast =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 100,
	blast_maxDistance		= 5,
	apply_damage			= true,

	effect 					= "particles/weapons/big/bubble_explosion",
	light_color 			= "160 255 160 128",
	light_radius 			= 10,
	light_time 				= 0.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}

----
--67026: Зеленые корабли: Разведка Пушка кислотная
Def.Weapon_CorrosiveGun =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	fire_rate				= 90,
	cycle_barrels 			= true,
	no_friendly_fire		= true,
	override_blast_wave_damage = true,

	dispersion				= 0.3,
	optimal_range			= 330,
	max_range				= 400,
	projectile_speed		= 350,
	
	damage_kinetic			= 100,
	crit_chance				= 0.05,
	crit_damage				= 0.5,
	
	spell_on_hit			= "CorrosiveGun",
	
	heat_max				= 10,
	heat_add				= 1.04,
	heat_sub				= 5,
	overheat_time			= 1,
	
	module_type				= ai.ModuleType.WEAPON,
	projectile				= "Projectile_CorrosiveGun",
	shot_effect 			= "particles/weapons/alien/green_corrosive_muzzle",
	muzzleflash_color = { kinetic = "42 255 72 4", emp = "42 255 72 4", thermal = "42 255 72 4", },
	muzzleflash_radius 		= 4,
	shot_once_sound 		= "sound/weapons/suppress/suppr",
}


Def.Projectile_CorrosiveGun =
{
	class			= "Projectile",
	
	hitbox_min 		= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max		= Vec3( 0.1, 0.1, 0.1 ),
	
	effect 					= "particles/weapons/alien/green_corrosive_projectile",
	hit_effect		= "particles/weapons/alien/green_corrosive_hit",
	
	damage_to_spell_aura_param = true,
	
	flare_color				= "42 255 72 45",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
}

--------------------------------------------------------------
-- green scout gun3
Def.Weapon_FunnyDoubleMissile =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",

	--cycle_barrels 		= true,
	
	fire_rate			= 90,
	dispersion			= 0, 

	optimal_range		= 300,
	max_range			= 390,
	projectile_speed 	= 195.0,
	
	--damage				= 10,
	damage_kinetic		= 0,
	damage_emp			= 10,
	damage_thermal		= 0,
	
	heat_max 			= 10,
	heat_add 			= 3,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 2, 
	overheat_time 		= 1,
	
	no_friendly_fire	= true,
	shot_once_sound = "sound/weapons/rockets/FunnyDoubleMissile",
	
	projectile			= "Projectile_FunnyDoubleMissile",
	shot_effect 			= "particles/weapons/alien/alien_missile_muzzle",
	muzzleflash_color = { kinetic = "205 255 225 100", emp = "205 255 225 100", thermal = "205 255 225 100", },
	muzzleflash_radius 		= 12,
	
	model				= "models/weapons/rail_guns/econom/rg_training",
}


Def.Projectile_FunnyDoubleMissile =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave= "Blastwave_FunnyDoubleMissile",
	override_blast_wave_damage = true,
	
	detonation_radius	= 2,

	flare_color			= "255 150 100 15",
	flare_size			= 0.0, --0.3
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/alien/alien_missile_projectile3",	
	
	missile_defence_immune 	= true,
	missile_detection_immune = true,
	disable_concussion_sound = true,
	
	is_guided 			= true,
	angular_velocity	= 45,
	random_trajectory 	= true,
}
	--apply_shake 		= false,
	--apply_torque		= false,

Def.Blastwave_FunnyDoubleMissile =
{
	class				= "BlastWave",
	in_editor			= false,
	damage_thermal		= 1000,
	blast_maxDistance	= 10,
	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	effect 				= "particles/weapons/alien/alien_missile_explosion",
	light_color 		= "205 255 225 100",
	light_radius 		= 20,
	light_time 			= 0.2,
	sound 				= "sound/explosion/FunnyDouble_expl",
	
	sound_combine_dist = 20,
	sound_combine_time = 0.15,
}

-------------------------
Def.ProximityMineGreen={
	--cant_be_bought		= true,
	price				= 10000,
	rank				= 14,
	field_radius		= 20,
	max_mines			= 1,
	spell 				= "Spell_ProximityMineGreen",
	time_to_live		= 80,
	period				= 1,
	repeat_period 		= 0.2,
	cooldown			= 15,
	holder_size			= 8,
	empty_holder_cooldown= 120,
	use_team_skin		= true,
	class				= "Minefield",
	stacks				= true,
	MunitionBayType		= ai.MunitionBayType.MBT_SECONDARY,
	default_icon		= "ItemSubtype_ProximityMineGreen",
	shopCategory		= "SECONDRY_WEAPON",
	shopSubCategory		= "OTHERS",
	item_subtype		= ItemSubtype.ProximityMineGreen,
	explosion_blast_wave= "BlastWave_ProximityMineGreen",
	
	work_effect_s1 = "particles/gadget/mine_friendly",
	work_effect_s2 = "particles/gadget/mine",
	launch_sound = "sound/gadgets/FrigateDrone/fd_launch",
}
Def.BlastWave_ProximityMineGreen = {
	intensity				= 3000,
	damage_thermal			= 100,
	blast_maxDistance		= 30,--50,
	light_radius			= 30,
	light_time				= 0.8,
	sound					= "sound/weapons/rocket_explosion",
	class					= "BlastWave",
	self_damage_coef		= 0, --не дамагаем себя.
	--parent_prototype="SpaceMissile_ProximityMine_T5_Mk1"  -- в коде не нашли, тестим без этого.
	
}

--------------------------
Def.Weapon_DestrKineticFloatingCrit =
{
	inherit					= "Weapon_AutoGun",
	item_subtype			= ItemSubtype.KineticFloatingCrit,
	
	crit_chance				= 0.5, 
	-- crit_chance_add			= -0.053,
	-- crit_chance_sub			= -0.172,
	
	dispersion_add			= -0.333,
	dispersion_max			= 0.5,
	dispersion_sub			= -10,
	
	crit_chance_max			= 0.07,
	
	damage_kinetic			= 200,
	dispersion				= 2.5,
	fire_rate				= 125,
	heat_add				= 0.67,
	heat_max				= 10,
	heat_sub				= 4,
	overheat_time			= 1.5,
	
	optimal_range			= 450*0.75,
	max_range				= 450,
	projectile				= "Projectile_DestrKineticFloatingCrit",
	projectile_speed		= 390,

	weapon_class			= ai.WeaponClass.RAILGUN,
	----
	model					= "models/weapons/rail_guns/econom/rg_training",
	----
	shot_effect				= "particles/weapons/railgun/muzzle_realistic",
	shot_once_sound			= "sound/weapons/KineticFloat/KineticFloatingCrit",

	muzzleflash_color = { kinetic = "227 165 158 64", emp = "227 165 158 64", thermal = "227 165 158 64", },
	muzzleflash_radius = 20,
}

Def.Projectile_DestrKineticFloatingCrit = 
{
	inherit			= "Projectile_Nail_Default",
	
	hit_effect		= "particles/weapons/railgun/hit_realistic",
	effect			= "particles/weapons/railgun/railgun_realistic_projectile",
	
	shadowCaster	= false,
    impact_type = "railgun",
}

Def.Weapon_KineticCDRbyCrit =
{
	inherit					= "Weapon_AutoGun",
	item_subtype			= ItemSubtype.KineticCDRbyCrit,
	
	crit_chance				= 0.07,	
	
	damage_kinetic			= 200,
	dispersion				= 0.5,
	fire_rate				= 125,
	heat_add				= 0.67,
	heat_max				= 10,
	heat_sub				= 4,
	overheat_time			= 1.5,
	
	optimal_range			= 450*0.75,
	max_range				= 450,
	projectile				= "Projectile_KineticCDRbyCrit",
	projectile_speed		= 390,

	weapon_class			= ai.WeaponClass.RAILGUN,
	----
	model					= "models/weapons/rail_guns/econom/rg_training",
	----
	shot_effect				= "particles/weapons/kinetic_gun_muzzle",
	shot_once_sound			= "sound/weapons/KineticCrit/KineticCDRbyCrit",
}

Def.Projectile_KineticCDRbyCrit =
{
	inherit			= "Projectile_Nail_Default",
	spell_on_crit	= "CommandCooldownReduction",
	impact_type 	= "railgun",
	effect			= "particles/weapons/kinetic_gun_projectile",
}

Def.Weapon_DestrResonatingLaser =
{
	inherit 		= "Weapon_LaserGun",
	model 			= "models/weapons/lasers/power/l_training",
	
	fire_rate 		= 70,
	
	impulse_time 	= 1,
	dispersion 		= 0,
	
	optimal_range 	= 300,
	max_range 		= 400,
	
	damage_thermal = 354,
	
	heat_max 		= 10,
	heat_add 		= 1,
	heat_sub 		= 6.67,
	overheat_time 	= 1,
	
	spell_on_hit 	= "ResonatingLaser",
	spell_on_hit_timeout = 1,
	spell_on_hit_streak_time = 0.5,
	
	module_type 	= ai.ModuleType.WEAPON,
	weapon_class 	= ai.WeaponClass.LASER,
	
	beam_fx = "particles/weapons/laser/esminec_laser_beam",
	hit_fx = "particles/weapons/laser/esminec_laser_hit",
	end_fx = "particles/weapons/laser/esminec_laser_hit",
	impact_type = "laser", 
	hit_loop_sound = "sound/hit/laser_loop",
	muzzleflash_color = { kinetic = "216 191 255 255", emp = "216 191 255 255", thermal = "216 191 255 255", },
	fire_fx = "particles/weapons/laser/muzzle_esminec",
	shot_loop_sound = "sound/weapons/laser/ResonatingLaser",
}

Def.Weapon_ElectricPotentialInductor =
{
	inherit				= "Weapon_AutoGun",
	damage_emp			= 113.5,
	dispersion			= 1.05,
	shopCategory		= "WEAPONS",
	shopSubCategory		= "PLASMA_GUNS",
	weapon_class 		= ai.WeaponClass.PLASMAGUN,
	optimal_range		= 195,
	max_range			= 260,
	fire_rate			= 90,
	shot_once_sound 		= "sound/weapons/plasmagun/epi",
	
	projectile			= "Projectile_ElectricPotentialInductor",
	projectile_speed	= 432.25,
	spell_on_hit		= "ElectricPotentialShift",
	model= "models/weapons/singularity_cannon/singularity_cannon_3",
	shot_effect			= "particles/weapons/plasma/muzzle",
	muzzleflash_color = { kinetic = "164 192 255 128", emp = "164 192 255 128", thermal = "164 192 255 128", },
	muzzleflash_radius = 20,
}

Def.Projectile_ElectricPotentialInductor =
{
	inherit				= "Projectile_BasicPlasma",
	flare_size			= 0.0,

	effect 				= "particles/weapons/plasma/plasma_electric_projectile",
}

Def.Weapon_SmartRocketLauncher_NY =
{
	class 				= "SmartRocketLauncher",

	cycle_barrels		= true,
	heat_max 			= 10,
	heat_add 			= 4,
	heat_sub 			= 5,
	fire_rate 			= 15, -- из расчета 1 выстрел в секунду при 4ех стволах.       14/25 16/25 18/25 -- на такой реальный фаер рейт надо расчитывать
	optimal_range		= 300,
	max_range			= 400,
	
	--show_cooldown 		= true,

	
	projectile 			= "Projectile_SmartRL_NY",
	shot_once_sound 	= "sound/weapons/smartRocket/smr",
	projectile_speed	= 150,	
	
	damage_emp			= 2310,  -- примерно пересчитано по фаер рейту  эксперементальному 16/25  с миномета t5mk1
	no_friendly_fire 	= true,

	targeting_beam_fx	= "particles/weapons/machete_laser",
	beam_bone 			= "rocket_1",
	
	--shot_effect = "particles/weapons/smart_muzzle",
	muzzleflash_color = { kinetic = "130 130 250 128", emp = "130 130 250 128", thermal = "130 130 250 128", },
	muzzleflash_radius 	= 8,
	signature_damage_coefs = ExplosionShootSignatureCoef,
}


Def.Projectile_SmartRL_NY =
{
	inherit 					= "Weapon_BaseRocket",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	is_guided					= true,
	angular_velocity			= 55,
	
	detonation_radius			= 7,
	
	explosion_blast_wave 	= "Blastwave_SmartRL_NY",

	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/fireworks/newyear3_projectile", 
	impact_type 		= "plasma",
}

Def.Blastwave_SmartRL_NY  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_minDistance		= 3,
	blast_maxDistance		= 8,
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/fireworks/newyear3_explosion",
	--light_color 			= "160 160 255 100",
	light_color 			= "255 170 191 255",
	light_radius 			= 18,
	light_time 				= 1.2,
	sound 					= "sound/weapons/ny/ny_rocket_explosion",
}

Def.Weapon_SuppressingGun_NY =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	fire_rate				= 100,
	cycle_barrels 			= true,
	no_friendly_fire		= true,
	override_blast_wave_damage = true,

	dispersion				= 0.3,
	optimal_range			= 330,
	max_range				= 400,
	projectile_speed		= 350,
	
	damage_thermal			= 181.8,
	crit_chance				= 0.05,
	crit_damage				= 0.5,
	
	heat_max				= 10,
	heat_add				= 1.04,
	heat_sub				= 5,
	overheat_time			= 1,
	
	--spell_on_hit 			= "SuppressingFire",  -- это работает только для лазеров, поэтому пришлось перенести все в ракету
	--spell_on_hit_timeout 	= 1,
	
	--model					= "models/weapons/lasers/sniper/l_training",
	module_type				= ai.ModuleType.WEAPON,
	projectile				= "Projectile_SuppressingGun_NY",
	--shot_effect 			= "particles/weapons/suppressing_muzzle",
	shot_effect 			= "particles/weapons/fireworks/newyear2_muzzle",
	muzzleflash_color = { kinetic = "128 128 128 100", emp = "128 128 128 100", thermal = "128 128 128 100", },
	muzzleflash_radius 		= 4,
	shot_once_sound 		= "sound/weapons/suppress/suppr",
	signature_damage_coefs = ExplosionShootSignatureCoef,
}

Def.Projectile_SuppressingGun_NY =
{
	class					= "Rocket",
	
	hitbox_min 		= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max		= Vec3( 0.1, 0.1, 0.1 ),
	
	explosion_blast_wave	= "Blastwave_SuppressingGun_NY",
	--effect 					= "particles/weapons/suppressing_projectile",
	effect 					= "particles/weapons/fireworks/newyear2_projectile_v2",
	override_blast_wave_damage = true,
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	
	detonation_radius		= 1,

	flare_color				= "255 150 100 15",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
	spell 					= "SuppressingFire",
}

Def.Blastwave_SuppressingGun_NY  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 10,
	blast_maxDistance		= 5,
	apply_damage			= true,
	apply_shake 			= false,

	effect 					= "particles/weapons/fireworks/newyear2_explosion_v2",
	light_color 			= "255 128 128 20",
	light_radius 			= 12,
	light_time 				= 0.4,
	sound 					= "sound/weapons/ny/ny_explosion_small",
}

Def.Weapon_Minigun_NY =
{
	DPS = 454.3333333,
	class = "AutoGun",
	class_mask = 4,
	crit_chance = 0.07,
	crit_damage = 0.5,
	damage_emp = 0,
	damage_kinetic = 116,
	damage_thermal = 0,
	default_custom_elements = 
	{
		[1] = "Weapons_nailgun_nail1",
		[2] = "Weapons_nailgun_nail2",
		[3] = "Weapons_nailgun_nail3",
	},
	default_icon = "ItemSubtype_Minigun",
	dispersion = 0.2,
	dispersion_add = 0.1,
	dispersion_max = 0.9,
	dispersion_sub = 0.7,
	fire_rate = 235,
	heat_add = 1,
	heat_max = 10,
	heat_sub = 2.5,
	inherit = "Weapon_AutoGun",
	max_range = 295,
	model = "models/weapons/nailgun/nail2",
	module_type = 0,
	muzzleflash_color = { kinetic = "220 190 120 128", emp = "220 190 120 128", thermal = "220 190 120 128", },
	muzzleflash_radius = 15,
	optimal_range = 220,
	overheat_time = 1.5,
	projectile = "Projectile_Nail_Iron_Heavy_NY",
	projectile_speed = 385,
	projectile_speed_add = 146.3,
	projectile_speed_max = 1320,
	shopCategory = "WEAPONS",
	shopSubCategory = "RAIL_GUNS",
	shot_effect = "particles/weapons/railgun/muzzle",
	shot_once_sound = "sound/weapons/minigun/minigun",
	weapon_class = 1,
	signature_damage_coefs = ExplosionShootSignatureCoef,
}

Def.Projectile_Nail_Iron_Heavy_NY =
{
	inherit				= "Projectile_Nail_Default",
	--hit_effect			= "particles/weapons/railgun/hit_yellow",
	hit_effect		= "particles/weapons/fireworks/newyear1_explosion", --New Year
	--effect         	    = "particles/weapons/railgun/projectile_yellow",
	effect            = "particles/weapons/fireworks/newyear1_projectile", --New Year
	shadowCaster		= false,
	impact_type 		= "railgun",
}

Def.Weapon_OverheatingLaser =
{
	inherit					= "Weapon_AutoGun",
	item_subtype			= ItemSubtype.OverheatingLaser,
	
	crit_chance				= 0.07,
	
	damage_thermal			= 200,
	dispersion				= 0.5,
	fire_rate				= 125,
	heat_add				= 4,
	heat_max				= 10,
	heat_sub				= 4,
	overheat_time			= 1.5,
	
	optimal_range			= 450*0.75,
	max_range				= 450,
	projectile				= "Projectile_OverheatingLaser",
	projectile_speed		= 390,
	muzzleflash_color = { kinetic = "200 60 50 64", emp = "200 60 50 64", thermal = "200 60 50 64", },
	----
	model					= "models/weapons/ion_emitter/ion_mod2",
	----
	shot_effect				= "particles/weapons/blaster/overheating_laser_muzzle",
	shot_once_sound			= "sound/weapons/laser/OverheatingLaser",
	spell_on_hit			= "GunOverheat",
}

Def.Projectile_OverheatingLaser =
{
	inherit			= "Projectile_Nail_Default",
	effect			= "particles/weapons/blaster/overheating_laser_projectile",
	impact_type = "railgun",
	hit_effect			= "particles/weapons/blaster/overheating_laser_hit",
}

Def.Weapon_DamageReflector = 
{
	damage_charge_period = 7,
	fire_rate_damage_charge_coef = 0.015,
	damage_charge_mask = ai.ChargeType.DAMAGE_SHIP,
	class = "AutoGun",
	crit_chance = 0.05,
	crit_damage = 0.50,
	damage_emp = 147.5,
	damage_kinetic = 0,
	damage_thermal = 0,
	dispersion = 1.6,
	dispersion_add = -0.4,
	dispersion_max = 0.7,
	dispersion_sub = -0.81,
	fire_rate = 120,
	fire_rate_max = 270,
	heat_add = 1,
	heat_max = 10,
	heat_sub = 5,
	inherit = "Weapon_AutoGun",
	max_range = 325,
	model = "models/weapons/plasma_gun/plasma_gun_mod2",
	module_type = ai.ModuleType.WEAPON,
	optimal_range = 245,
	overheat_time = 1.5,
	projectile = "Projectile_DamageReflector",
	projectile_speed = 300,
	muzzleflash_color = { kinetic = "180 220 255 64", emp = "180 220 255 64", thermal = "180 220 255 64", },
	muzzleflash_radius = 3,
	shot_once_sound = "sound/weapons/plasmagun/epi",
	weapon_class = ai.WeaponClass.PLASMAGUN,
	
	shot_effect = "particles/weapons/plasma/muzzle_reflector",
}

Def.Projectile_DamageReflector = 
{
	apply_shake = true,
	class = "Projectile",
	fixedInheritance = true,
	hitbox_max = Vec3( 0.2000, 0.2000, 0.2000 ),
	hitbox_min = Vec3( -0.2000, -0.2000, -0.2000 ),
	impact_type = "plasma",
	in_editor = false,
	inherit = "Projectile_Plasma_Default",
	mass = 0.05,
	shadowCaster = false,
	
	effect = "particles/weapons/plasma/projectile_reflector",
	-- hit_crit_shield_effect = "particles/weapons/plasma/hit_crit_shield",
	-- hit_crit_ship_effect = "particles/weapons/plasma/hit_crit",
	hit_effect = "particles/weapons/plasma/hit",
	hit_shield_effect = "particles/weapons/plasma/hit_shield_reflector",
	hit_ship_effect = "particles/weapons/plasma/hit_ship_reflector",
}

Def.Weapon_SpacetimeAnomaly = 
{
	inherit = "Weapon_LaserGun",
	
	crit_chance = 0.05,
	crit_damage = 0.5,
	fire_rate = 60,
	damage_thermal = 400,
	optimal_range = 250,
	max_range = 335,
	impact_type = "laser",
	impulse_time = 1,

	weapon_class = ai.WeaponClass.LASER,	
	spell_on_hit = "SpacetimeAnomaly",
	spell_on_hit_timeout = 1,
	spell_on_hit_streak_time = 0.5,
	
	model = "models/weapons/beam_cannon/beam_cannon_mod4",
	
	damage_color	  = { kinetic = ai.DONT_INHERIT, emp = ai.DONT_INHERIT, thermal = "255 255 255 255", },
	muzzleflash_color = { kinetic = "180 60 60 128", emp = "180 60 60 128", thermal = "180 60 60 128", },
	beam_fx = "particles/weapons/laser/laser_spacetime",
	fire_fx = "particles/weapons/laser/muzzle_spacetime",
	hit_fx = "particles/weapons/laser/hit",
	
	shot_loop_sound = "sound/weapons/laser/SpacetimeAnomaly",
	hit_loop_sound = "sound/hit/laser_loop",
}

Def.Weapon_PlasmaVolley = 
{
	class = "AutoGun",
	class_mask = 2,
	crit_chance = 0.2,
	crit_damage = 0.5,

	damage_emp = 100,
	damage_kinetic = 0,
	damage_thermal = 0,


	dispersion = 1,
	dispersion_max = 1,
	-- dispersion_add = 0.400008,
	-- dispersion_max = 2.00004,
	-- dispersion_sub = 4.00008,

	fire_rate = 30,

	-- heat_add = 1.6666667,
	-- heat_max = 10,
	-- heat_sub = 12.5,
	inherit = "Weapon_AutoGun",

	item_subtype = 9,
	optimal_range = 220,
	max_range = 295,
	model = "models/weapons/assault_railgun/assault5",
	module_type = 0,
	muzzleflash_color = { kinetic = "50 140 230 128", emp = "50 140 230 128", thermal = "50 140 230 128", },
	muzzleflash_radius = 20,

	overheat_time = 1.5,
	premiumPrice = 900,
	price = 156000,
	projectile = "Projectile_PlasmaVolley",
	projectile_speed = 800,
	no_friendly_fire = true,

	shopCategory = "WEAPONS",
	shopSubCategory = "RAIL_GUNS",
	shot_effect = "particles/weapons/plasma/volley_muzzle",
	shot_once_sound = "sound/weapons/plasmagun/PlasmaVolley",

	weapon_class = 1,
}

Def.Projectile_PlasmaVolley = 
{
	override_blast_wave_damage = true,
	missile_defence_immune = true,
	in_editor = false,
	class = "Rocket",
	detonation_radius = 6,
	impact_type = "rocket",
	
	-----------
	
	broken_parts = 
	{
		[1] = 
		{
			angle = 360,
			dumping = 0.2,
			effect = "particles/explosions/debris_trail",
			pos = Vec3( 0.0000, 0.0000, 0.0000 ),
			speed = 25,
			speed_deviation = 25,
			speed_inherit = 1,
			ttl = 7,
		},
	},
	effect = "particles/weapons/plasma/volley_projectile",
	explosion_blast_wave = "Blastwave_PlasmaVolley",
	flare_angle = 180,
	flare_color = "50 150 255 15",
	flare_nebulosity = 0.1,
	flare_size = 0.3,	
	
--	death_sound = "sound/explosion/small_rocket_expl",
}

Def.Blastwave_PlasmaVolley = 
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 16,
	class = "BlastWave",
	damage_thermal = 1000,
	effect = "particles/explosions/volley_explosion",
	in_editor = false,
	light_color = "40 140 240 100",
	light_radius = 20,
	light_time = 0.8,
	sound = "sound/explosion/PlasmaVolley_expl",
	sound_combine_dist = 10,
	sound_combine_time = 0.1,
}

Def.Weapon_LaserCleanse = 
{
	cant_be_bought = true,
	hide_from_player = true,
	beam_fx = "particles/weapons/laser/alien_engeneer_healbeam",
	class = "LaserGun",
	damage_thermal = 451,
	dispersion = 0,
	dispersion_max = 0,
	fire_fx = "particles/weapons/laser/alien_laser_muzzle",
	fire_rate = 60,
	heal_ally = 268,
	heal_ally_energy_cost = 110,
	heal_loop_sound = "sound/hit/laser_heal_loop",
	heat_add = 1.6666667,
	heat_max = 10,
	heat_sub = 8,
	hit_fx = "particles/weapons/laser/alien_laser_hit",
	hit_loop_sound = "sound/hit/laser_loop",
	impact_type = "laser",
	impulse_time = 1, -- мерцающий лазер при значении < 1
	inherit = "Weapon_LaserGun",
	max_range = 305,
	model = "models/weapons/laser_heal_engineer/laser_heal_engineer",
	module_type = ai.ModuleType.WEAPON,
	damage_color	  = { kinetic = ai.DONT_INHERIT, emp = ai.DONT_INHERIT, thermal = "255 255 255 255", },
	muzzleflash_color = { kinetic = "255 100 100 0", emp = "255 100 100 0", thermal = "255 100 100 0", },
	muzzleflash_radius = 20,
	optimal_range = 230,
	overheat_time = 1.5,
	shot_loop_sound = "sound/weapons/laser/LaserHeal",
	weapon_class = ai.WeaponClass.LASER,
	spell_on_hit = "CleanseTarget",
	spell_on_hit_timeout = 0.5,
	item_subtype = ItemSubtype.LaserHeal,
}

Def.Weapon_LaserConeHeal = 
{
	class = "LaserGunRay",
	crit_chance = 0.05,
	crit_damage = 0.5,
	damage_emp = 0,
	damage_kinetic = 0,
	damage_thermal = 586,
	default_icon = "ItemSubtype_Radiation_Beam_1",
	dispersion = 0,
	dispersion_max = 0,
	fire_rate = 60,
	focus_distance = 10,
	heat_add = 1.25,
	heat_max = 10,
	heat_sub = 5.7142857,
	hit_loop_sound = "sound/hit/laser_loop",
	impulse_time = 1,
	item_subtype = 18,
	max_range = 280	,
	model = "models/weapons/green_engineer_guns/remote_heal_laser",
	module_type = ai.ModuleType.WEAPON,
	damage_color	  = { kinetic = ai.DONT_INHERIT, emp = ai.DONT_INHERIT, thermal = "255 255 255 255", },
	muzzleflash_color = { kinetic = "200 55 50 64", emp = "200 55 50 64", thermal = "200 55 50 64", },
	muzzleflash_radius = 20,
	optimal_range = 210,
	overheat_time = 1.5,
	rank = 12,
	shot_loop_sound = "sound/weapons/laser/LaserConeHeal",
	weapon_class = ai.WeaponClass.LASER,
	heal_ally_angle = 10,
	heal_ally = 100,
	
	beam_fx = "particles/weapons/laser/alien_engeneer_end",
	fire_fx = "particles/weapons/laser/alien_heallaser_muzzle",
	hit_fx = "particles/weapons/laser/alien_heallaser_hit",
	beam_start_fx = "particles/weapons/laser/alien_engeneer_start",
	focus_fx = "particles/weapons/laser/alien_engeneer_focus",
}

Def.Weapon_PlasmaSplash = 
{
	class = "AutoGun",
	damage_emp = 100,
	damage_kinetic = 0,
	damage_thermal = 0,
	dispersion = 0.35,
	dispersion_max = 0.35,
	fire_rate = 30,
	crit_chance = 0.5,
	crit_damage = 1,
	inherit = "Weapon_AutoGun",
	item_subtype = ItemSubtype.PlasmaSplash,
	optimal_range = 220,
	max_range = 295,
	model = "models/weapons/assault_railgun/assault5",
	module_type = 0,
	muzzleflash_color = { kinetic = "0 170 140 100", emp = "0 170 140 100", thermal = "0 170 140 100", },
	muzzleflash_radius = 20,
	overheat_time = 1.5,
	premiumPrice = 900,
	projectile = "Projectile_PlasmaSplash",
	projectile_speed = 800,
	shot_effect = "particles/weapons/alien/alien_plazma_muzzle",
	shot_once_sound = "sound/weapons/plasmagun/PlasmaSplash",
	weapon_class = 1,
	cycle_barrels 		= true,
	-- spell_on_hit = "PlasmaSplashEnergyHolder",
	no_friendly_fire	= true,
	self_damage_coef	= 0,
}

Def.Projectile_PlasmaSplash = 
{
	override_blast_wave_damage = true,
	missile_defence_immune = true,
	in_editor = false,
	class = "Rocket",
	detonation_radius = 3,
	impact_type = "rocket",
	effect = "particles/weapons/alien/alien_plazma_projectile",
	explosion_blast_wave = "Blastwave_PlasmaSplash",
	flare_angle = 180,
	flare_color = "0 146 170 15",
	flare_nebulosity = 0.2,
	flare_size = 0.2,	

	spell_on_crit = "PlasmaSplashEnergy",
	spell_on_crit_if_hacked = false,
}

Def.Blastwave_PlasmaSplash = 
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 55,
	class = "BlastWave",
	damage_thermal = 1000,
	effect = "particles/explosions/alien_plazma_explosion",
	in_editor = false,
	light_color = "0 140 160 80",
	light_radius = 25,
	light_time = 0.35,
	sound = "sound/explosion/PlasmaVolley_expl",
	sound_combine_dist = 10,
	sound_combine_time = 0.1,
	blast_angle = 30,
}

Def.Weapon_ScrapAttractor = 
{
	class = "AutoGun",

	damage_emp = 0,
	damage_kinetic = 98.7,
	damage_thermal = 0,

	fire_rate = 45,

	inherit = "Weapon_AutoGun",

	max_range = 295,
	model = "models/weapons/assault_railgun/assault1",
	module_type = 0,
	muzzleflash_color = { kinetic = "170 255 217 100", emp = "170 255 217 100", thermal = "170 255 217 100", },
	muzzleflash_radius = 20,

	optimal_range = 220,

	projectile = "Projectile_ScrapAttractor",
	projectile_speed = 427.5,

	shot_effect = "particles/weapons/alien/scrap_atractor_muzzle",
	shot_once_sound = "sound/weapons/railgun/basic",

	weapon_class = ai.WeaponClass.RAILGUN,
	cycle_barrels = true,
	
	friendly_fire = true,
	no_friendly_fire = true,
}

Def.Projectile_ScrapAttractor =
{
	override_blast_wave_damage = true,
	missile_defence_immune = true,
	in_editor = false,
	class = "Rocket",
	detonation_radius = 9.5,
	impact_type = "rocket",
	effect = "particles/weapons/alien/scrap_atractor_projectile",
	explosion_blast_wave = "Blastwave_ScrapAttractor",
	auto_pickup_bonus_def = "Bonus_GreenEngineerScrap",
	auto_pickup_bonus_range = 10,
	spell = "HealScrapAttractor",
	flare_angle = 180,
	flare_color = "0 146 170 15",
	flare_nebulosity = 0.2,
	flare_size = 0.1,	
}
Def.Blastwave_ScrapAttractor = 
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp			= 10,
	blast_maxDistance		= 12,
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/alien/scrap_atractor_hit",
	light_color 			= "0 255 146 155",
	light_radius 			= 15,
	light_time 				= 0.2,
	sound 					= "sound/explosion/nanobot_expl",
	
}

Def.Weapon_GreenHealRailgun =
{
	inherit = "Weapon_AutoGun",
	class = "AutoGun",
	module_type = ai.ModuleType.WEAPON,
	weapon_class = ai.WeaponClass.RAILGUN,

	crit_chance = 0.07,
	crit_damage = 0.5,

	damage_emp = 0,
	damage_kinetic = 116,
	damage_thermal = 0,

	dispersion = 0.3,
	dispersion_add = 0.5,
	dispersion_max = 1.1,
	dispersion_sub = 1,

	fire_rate = 100,

	-- heat_add = 1,
	-- heat_max = 10,
	-- heat_sub = 2.5,
	-- overheat_time = 1.5,

	model = "models/weapons/nailgun/nail2",

	optimal_range = 220,
	max_range = 295,
	projectile = "Projectile_GreenHealRailgun",
	projectile_speed = 385,
	-- projectile_speed_add = 146.3,
	-- projectile_speed_max = 1320,

	shot_effect = "particles/weapons/alien/alien_engeneer_muzzle",
	shot_once_sound = "sound/weapons/railgun/GreenHealRailgun",
	spell_on_hit = "KineticVamp",
	
	muzzleflash_color = { kinetic = "170 255 217 100", emp = "170 255 217 100", thermal = "170 255 217 100", },
	muzzleflash_radius = 20,
}

Def.Projectile_GreenHealRailgun =
{
	apply_shake = true,
	class = "Projectile",
	effect = "particles/weapons/alien/alien_engeneer_projectile", --странно играется
	hit_effect = "particles/weapons/alien/alien_engeneer_hit",
	hitbox_max = Vec3( 0.1000, 0.1000, 0.1000 ),
	hitbox_min = Vec3( -0.1000, -0.1000, -0.1000 ),
	impact_type = "railgun",
	in_editor = false,
	mass = 0.05,
	shadowCaster = false,
}

Def.Weapon_PlatformRailGun = --#73192 пушка, высокая дальность, быстрые пули (1.2)
{
	class = "AutoGun",
	crit_chance = 0.07,
	crit_damage = 0.5,
	damage_emp = 0,
	damage_kinetic = 744*1.5,
	damage_thermal = 0,
	dispersion = 0.25,
	dispersion_max = 0.25,
	fire_rate = 67.5 / 2,
	-- heat_add = 1.25,
	-- heat_max = 10,
	-- heat_overcharge = true,
	-- heat_sub = 5,
	max_range = 450,
	
	--model = "models/weapons/wazgot_station_guns/station_kinetic",
	
	module_type = ai.ModuleType.WEAPON,
	muzzleflash_color = { kinetic = "92 153 103 128", emp = "92 153 103 128", thermal = "92 153 103 128", },
	muzzleflash_radius = 20,
	optimal_range = 338,
	overheat_time = 1.5,
	projectile = "Projectile_PlatformRailGun",
	projectile_speed = 690,
	shot_effect = "particles/weapons/alien/alien_platform_railgun_muzzle",
	shot_once_sound = "sound/weapons/railgun/GreenHealRailgun",
	use_wrong_timing = true,
	weapon_class = ai.WeaponClass.RAILGUN,
	default_icon = "Station_ico_PlatformRailGun",
	ui_ico 			= { target_system 	= { tex = "Station_ico_PlatformRailGun", }, },
	uiName			= "Weapon_PlatformRailGun",
}

Def.Projectile_PlatformRailGun = --#73192
{
	apply_shake = true,
	class = "Projectile",
	effect = "particles/weapons/alien/alien_platform_railgun",
	hit_effect = "particles/weapons/alien/alien_engeneer_hit",
	hitbox_max = Vec3( 0.1000, 0.1000, 0.1000 ),
	hitbox_min = Vec3( -0.1000, -0.1000, -0.1000 ),
	impact_type = "railgun",
	in_editor = false,
	mass = 0.05,
	shadowCaster = false,
}

Def.Weapon_PlatformPlasmaGunExplosive = 
{
	class = "AutoGun",
	crit_chance = 0.05,
	crit_damage = 0.5,
	damage_emp = 734*1.5,
	damage_kinetic = 0,
	damage_thermal = 0,
	dispersion = 0,
	fire_rate = 40,
	-- heat_add = 1.6666667,
	-- heat_max = 10,
	-- heat_sub = 3.003003,
	max_range = 600,
	optimal_range = 520,
	
	--model = "models/weapons/wazgot_station_guns/station_torped",
	
	module_type = ai.ModuleType.WEAPON,
	muzzleflash_color = { kinetic = "109 145 111 96", emp = "109 145 111 96", thermal = "109 145 111 96", },
	muzzleflash_radius = 20,
	overheat_time = 1.5,
	projectile = "Projectile_PlatformPlasmaGunExplosive",
	projectile_speed = 300,
	shot_effect = "particles/weapons/missile/alien_rocket_muzzle",
	shot_once_sound = "sound/weapons/rockets/FunnyDoubleMissile",
	weapon_class = ai.WeaponClass.PLASMAGUN,
	default_icon = "Station_ico_PlatformPlasmaGunExplosive",
	ui_ico 			= { target_system 	= { tex = "Station_ico_PlatformPlasmaGunExplosive", }, },
	uiName			= "Weapon_PlatformPlasmaGunExplosive",
}

Def.Projectile_PlatformPlasmaGunExplosive = 
{
	angular_velocity = 15,
	class = "Rocket",
	death_sound = "sound/explosion/small_rocket_expl",
	detonation_radius = 9.5,
	disable_concussion_sound = true,
	effect = "particles/weapons/missile/alien_rocket_trail",
	explosion_blast_wave = "Blastwave_PlatformPlasmaGunExplosive",
	flare_angle = 180,
	flare_color = "109 145 111 15",
	flare_nebulosity = 0.2,
	flare_size = 0.2,
	impact_type = "rocket",
	in_editor = false,
	missile_defence_immune = true,
	model = "models/weapons/wazgot_station_guns/crystal_torpedo",
	override_blast_wave_damage = true,
	is_guided = true,
}

Def.Blastwave_PlatformPlasmaGunExplosive = 
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 12,
	class = "BlastWave",
	damage_emp = 1000,
	effect = "particles/explosions/big_fire_alien_2",
	fixedInheritance = true,
	in_editor = false,
	light_color = "87 143 255 255",
	light_radius = 15,
	light_time = 0.2,
	sound = "sound/explosion/nanobot_expl",
}

Def.Weapon_PlatformLaserShortRange = 
{
	damage_color = { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "143 239 143 255", },
	muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "92 153 103 255", },
	beam_fx = "particles/weapons/laser/laser_pulse_beam",
	class = "LaserGun",
	crit_chance = 0.05,
	crit_damage = 0.5,
	damage_emp = 0,
	damage_kinetic = 0,
	damage_thermal = 175,
	dispersion = 0,
	dispersion_max = 0,
	fire_fx = "",
	fire_rate = 240,
	-- heat_add = 3.3333333,
	-- heat_max = 10,
	-- heat_sub = 10,
	hit_fx = "particles/weapons/laser/hit",
	hit_loop_sound = "sound/hit/laser_loop",
	impact_type = "laser",
	impulse_time = 0.75,
	max_range = 225,
	
	module_type = ai.ModuleType.WEAPON,
	muzzleflash_radius = 20,
	optimal_range = 190,
	-- overheat_time = 1.5,
	projectile = "Projectile_PlasmaBlaster",
	shot_once_sound = "sound/weapons/laser/econ",
	weapon_class = ai.WeaponClass.LASER,
	default_icon = "Station_ico_PlatformLaserShortRange",
	ui_ico 			= { target_system 	= { tex = "Station_ico_PlatformLaserShortRange", }, },
	uiName			= "Weapon_PlatformLaserShortRange",
}

Def.Weapon_PlatformPlasmaGunShortRange = 
{
	class = "AutoGun",
	crit_chance = 0.05,
	crit_damage = 0.75,
	damage_emp = 199.3*3.2*1.1,
	damage_kinetic = 0,
	damage_thermal = 0,
	dispersion = 0.5,
	-- dispersion_add = 0.5777778,
	-- dispersion_max = 2,
	-- dispersion_sub = 1.3,
		dispersion_add = 0,
	dispersion_max = 0,
	dispersion_sub = 0,
	fire_rate = 90,
	-- heat_add = 0.3333333,
	-- heat_max = 10,
	-- heat_sub = 5,
	-- overheat_time = 1.5,
	max_range = 300,
	
	--model = "models/weapons/wazgot_station_guns/station_plasm",
	
	module_type = ai.ModuleType.WEAPON,
	muzzleflash_color = { kinetic = "92 153 103 128", emp = "92 153 103 128", thermal = "92 153 103 128", },
	muzzleflash_radius = 20,
	optimal_range = 225,
	projectile = "Projectile_PlatformPlasmaGunShortRange",
	projectile_speed = 333.5,
	shot_effect = "particles/weapons/alien/alien_platform_plasma_muzzle",
	shot_once_sound = "sound/weapons/plasmagun/PlasmaSplash",
	weapon_class = ai.WeaponClass.PLASMAGUN,
	default_icon = "Station_ico_PlatformPlasmaGunShortRange",
	ui_ico 			= { target_system 	= { tex = "Station_ico_PlatformPlasmaGunShortRange", }, },
	uiName			= "Weapon_PlatformPlasmaGunShortRange",
}

Def.Projectile_PlatformPlasmaGunShortRange = 
{
	apply_shake = true,
	class = "Projectile",
	impact_type = "plasma",
	mass = 0.05,
	shadowCaster = false,
	
	hitbox_max = Vec3( 0.2000, 0.2000, 0.2000 ),
	hitbox_min = Vec3( -0.2000, -0.2000, -0.2000 ),
	
	effect = "particles/weapons/alien/alien_platform_plasma",
	hit_effect = "particles/weapons/alien/alien_platform_plasma_hit",
}

Def.Weapon_PlatformDefaultLaser = 
{
	class = "LaserGun",
	crit_chance = 0.05,
	crit_damage = 1,
	damage_emp = 0,
	damage_kinetic = 0,
	damage_thermal = 497.5,
	dispersion = 0,
	dispersion_max = 0,
	fire_fx = "",
	fire_rate = 60,
	-- heat_add = 1,
	-- heat_max = 10,
	-- heat_sub = 4,
	-- overheat_time = 1.5,
	impact_type = "laser",
	impulse_time = 1,
	module_type = ai.ModuleType.WEAPON,
	muzzleflash_radius = 20,
	next_upgrade = "Weapon_Laser_Basic_T5_Rare",
	ods_export = true,
	optimal_range = 100,
	max_range = 250,
	weapon_class = ai.WeaponClass.LASER,
	
	damage_color = { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "143 239 143 255", },
	muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "92 153 103 255", },
	beam_fx = "particles/weapons/laser/laser_basic_beam",
	hit_fx = "particles/weapons/laser/hit",
	
	hit_loop_sound = "sound/hit/laser_loop",
	shot_loop_sound = "sound/weapons/laser/basic",
	-- default_icon = "ItemSubtype_FrigateDroneHealOnly",
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_GreenRegenShield", }, },
	uiName			= "Weapon_PlatformDefaultLaser",
}

Def.Projectile_TurretPlatform =
{
	inherit			= "Projectile_Nail_Default",
	
	hit_effect		= "particles/weapons/alien/alien_platform_plasma_turret_hit",
	
	effect = "particles/weapons/alien/alien_platform_plasma_turret",
	
	shadowCaster	= false,
    impact_type = "railgun",
}

Def.Weapon_SingularityStriker = 
{
	cant_be_bought = true,
	class = "AutoGun",
	crit_chance = 0.2,
	crit_damage = 0.5,
	damage_emp = 100,
	damage_kinetic = 0,
	damage_thermal = 0,
	dispersion = 0.1,
	dispersion_add = 0.75,
	dispersion_max = 1.6,
	dispersion_sub = 1.5,
	fire_rate = 240,
	heat_add = 2,
	heat_max = 10,
	heat_sub = 7.5,
	item_subtype = ItemSubtype.ZhenGun,
	max_range = 370,
	model = "models/weapons/destructor/destructor_mod0",
	module_type = 0,
	muzzleflash_color = { kinetic = "100 90 180 155", emp = "100 90 180 155", thermal = "100 90 180 155", },
	muzzleflash_radius = 17,
	optimal_range = 280,
	overheat_time = 1.5,
	projectile = "Projectile_SingularityStriker_Plasma",
	projectile_speed = 500,
	shot_effect = "particles/weapons/plasma/striker_muzzle",
	shot_once_sound = "sound/weapons/singularity/ss_shot",
	weapon_class = ai.WeaponClass.PLASMAGUN,
}

Def.Projectile_SingularityStriker_Plasma = 
{
	apply_shake = true,
	class = "Projectile",
	effect = "particles/weapons/plasma/striker_plazma_projectile",
	hit_effect = "particles/weapons/plasma/striker_hit",
	hit_crit_shield_effect = "particles/weapons/plasma/striker_crit_hit",
	hit_crit_ship_effect = "particles/weapons/plasma/striker_crit_hit",
	hitbox_max = Vec3( 0.2000, 0.2000, 0.2000 ),
	hitbox_min = Vec3( -0.2000, -0.2000, -0.2000 ),
	impact_type = "plasma",
	in_editor = false,
	mass = 0.05,
	shadowCaster = false,
	spell_on_crit = "StrikerBuff",
	spell_on_crit_if_hacked = false,
}

Def.Weapon_ZhenGun = {
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 400,
	
	projectile_speed		= 300,  --  900
	dispersion				= 0.1,
	dispersion_max			= 1,
	dispersion_add			= 0.1285714,
	dispersion_sub			= 0.72,
	optimal_range			= 200,
	max_range				= 300,
	damage_kinetic			= 300,
	crit_chance				= 0.2,
	crit_damage				= 0.5,
	heat_max				= 10,
	heat_add				= 5,
	heat_sub				= 15,
	overheat_time			= 0.3,
	
	--track = ai.TrackMode.OFFSET,
	--track_offset = Vec3( 0, 0, -210 ),
	track 					= ai.TrackMode.AIM,
	max_aim_yaw				= 2,  -- (в градусах)
	max_aim_pitch  			= 2,  --(в градусах). 
	-- barrel_rot_speed = 90,
	-- barrel_rot_speed_fire = 90,
	
	model					= "models/ships/race_2/s/race2_s_t3_zhen/race2_s_t3_zhen_gun",
	projectile				= "Projectile_ZhenGun",
	muzzleflash_radius = 10,
	muzzleflash_color = { kinetic = "255 228 196 128", emp = "255 228 196 128", thermal = "255 228 196 128", },
	shot_effect				= "particles/weapons/railgun/muzzle",
	shot_once_sound = "sound/weapons/railgun/ZhenGun",
}

Def.Projectile_ZhenGun =
{
	inherit					= "Projectile_BasicRailgun",
	effect					= "particles/weapons/railgun/railgun_fast_projectile",
	hitbox_max 				= Vec3( 0.25, 0.25, 0.25 ),
	hitbox_min 				= Vec3( -0.25, -0.25, -0.25 ),
	hit_effect				= "particles/weapons/railgun/hit",
	hit_ship_effect 		= "particles/weapons/railgun/hit_ship",
	hit_shield_effect 		= "particles/weapons/railgun/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/railgun/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/railgun/hit_crit_shield",
}

Def.Weapon_FlameThrower = 
{
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 300,

	cycle_barrels = true,
	
	dispersion				= 0.1,
	dispersion_max			= 1,
	dispersion_add			= 0.1285714,
	dispersion_sub			= 0.72,
	optimal_range			= 200*0.75,
	max_range				= 200,
	damage_emp				= 150,
	crit_chance				= 0.2,
	crit_damage				= 0.5,
	-- heat_max				= 10,
	-- heat_add				= 5,
	-- heat_sub				= 15,
	overheat_time			= 0.3,
	
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	shot_effect 			= "particles/weapons/other/fire_emp_muzzle",
	projectile = "Projectile_FlamePiece",
	spell_on_hit = "FlameThrowerFire",
	projectile_speed	 = 150,
	projectile_speed_add = 10,
	projectile_speed_sub = 40,
	projectile_speed_max = 300,	
	muzzleflash_color = { kinetic = "129 161 255 255", emp = "129 161 255 255", thermal = "129 161 255 255", },
	muzzleflash_radius = 20,
	shot_once_sound = "sound/weapons/FlameThrower/ft_fire",
}

Def.Projectile_FlamePiece = 
{
	class = "Projectile",
	effect = "particles/weapons/other/fire_emp_projectile",
	hit_effect = "particles/weapons/other/fire_emp_hit",
	flare_size			= 0,

	hitbox_max = Vec3( 1.4, 1.4, 1.4 ),
	hitbox_min = Vec3( -1.4, -1.4, -1.4 ),
	impact_type = "plasma",
	in_editor = false,
	mass = 0.01,
	shadowCaster = false,
	-- damage_radius	= 1,
	model = "models/misc/invisible_model",
	death_entity_on_static_hit = "Flame",
	inherit_speed = true,
}

Def.Flame =
{
	class = "AuraHolderTrigger",

	radius = 6,
	density = 0.75,
	effect = "particles/gadget/damage_emp_fire",
	spell = "Flame",
}

Def.Weapon_SpikeOnSpeedLaser = 
{
	class = "LaserGun",
	module_type = ai.ModuleType.WEAPON,
	weapon_class = ai.WeaponClass.LASER,
	
	optimal_range = 250,
	max_range = 335,

	fire_rate = 60,	
	heat_add = 1,
	heat_max = 10,
	heat_sub = 4,
	overheat_time = 1.5,
	
	crit_chance = 0.05,
	crit_damage = 1,

	damage_emp = 0,
	damage_kinetic = 0,
	damage_thermal = 497.5,

	dispersion = 0,
	dispersion_max = 0,

	impact_type = "laser",
	impulse_time = 1,

	item_subtype = ItemSubtype.HackSystems,
	
	model = "models/weapons/plasma_gun/plasma_gun_mod1",
	
	damage_color = { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "185 78 220 255", },
	muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "223 127 255 255", },
	beam_fx = "particles/weapons/laser/laser_basic_beam",
	hit_fx = "particles/weapons/laser/hit",
	fire_fx = "",
	muzzleflash_radius = 20,

	shot_loop_sound = "sound/weapons/laser/SpikeOnSpeedLaser",

	cooldown = 2,
	max_speed_percent = 1.01,
	spell_on_max_speed_plus = "SpikeOnSpeedLaser",
}

Def.Weapon_InterferentPlasmaEmitter = 
{
	class = "AutoGun",
	class_mask = 1,
	crit_chance = 0.05,
	crit_damage = 0.75,
	damage_emp = 162.3,
	damage_kinetic = 0,
	damage_thermal = 0,
	dispersion = 3.15,
	dispersion_add = -1.4175,
	dispersion_max = 0.315,
	dispersion_sub = -0.81,
	fire_rate = 220,
	-- heat_add = 1,
	-- heat_max = 10,
	-- heat_sub = 5,
	item_subtype = 5,
	mark = 1,
	max_range = 260,
	model = "models/weapons/plasma_gun/plasma_gun_mod4",
	module_type = 0,
	muzzleflash_color = { kinetic = "57 118 255 128", emp = "57 118 255 128", thermal = "57 118 255 128", },
	muzzleflash_radius = 20,
	optimal_range = 195,
	overheat_time = 1.5,
	projectile = "Projectile_InterferentPlasma",
	projectile_speed = 523.25,
	shot_effect = "particles/weapons/plasma/ipe_muzzle",
	shot_once_sound = "sound/weapons/plasmagun/InterferentEmitter",
	weapon_class = 2,
	spell_on_hit = "Interference",
}

Def.Projectile_InterferentPlasma =
{
	apply_shake = true,
	class = "Projectile",
	effect = "particles/weapons/plasma/ipe_projectile",
	fixedInheritance = true,
	hit_crit_shield_effect = "particles/weapons/plasma/hit_crit_shield_ipe",
	hit_crit_ship_effect = "particles/weapons/plasma/hit_crit_ipe",
	hit_effect = "particles/weapons/plasma/hit_ipe",
	hit_shield_effect = "particles/weapons/plasma/hit_ipe",
	hit_ship_effect = "particles/weapons/plasma/hit_ipe",
	hitbox_max = Vec3( 0.2000, 0.2000, 0.2000 ),
	hitbox_min = Vec3( -0.2000, -0.2000, -0.2000 ),
	impact_type = "plasma",
	in_editor = false,
	inherit = "Projectile_Plasma_Default",
	mass = 0.05,
	shadowCaster = false,
}

Def.Weapon_PlasmaCompressor = 
{
	class = "AutoGun",
	class_mask = 1,
	crit_chance = 0.05,
	crit_damage = 0.75,
	damage_emp = 162.3,
	damage_kinetic = 0,
	damage_thermal = 0,
	dispersion = 3.15,
	dispersion_add = -1.4175,
	dispersion_max = 0.315,
	dispersion_sub = -0.81,
	fire_rate = 60,
	-- heat_add = 1,
	-- heat_max = 10,
	-- heat_sub = 5,
	item_subtype = 5,
	mark = 1,
	max_range = 260,
	model = "models/weapons/plasma_gun/plasma_gun_mod4",
	module_type = 0,
	muzzleflash_color = { kinetic = "57 118 255 128", emp = "57 118 255 128", thermal = "57 118 255 128", },
	muzzleflash_radius = 20,
	optimal_range = 195,
	overheat_time = 1.5,
	projectile = "Projectile_PlasmaCompressor",
	projectile_speed = 523.25,
	shot_effect = "particles/weapons/plasma/plasma_compressor_muzzle",
	shot_once_sound = "sound/weapons/plasmagun/PlasmaCompressor",
	weapon_class = 2,
	-- spell_on_hit_timeout = 0.2,
	spell_on_hit = "EnergyShieldExtendHold",
}

Def.Projectile_PlasmaCompressor = 
{
	apply_shake = true,
	class = "Projectile",
	effect = "particles/weapons/plasma/plasma_compressor_projectile",
	hit_crit_shield_effect = "particles/weapons/plasma/plasma_compressor_hit_crit_shield",
	hit_crit_ship_effect = "particles/weapons/plasma/hit_crit",
	hit_effect = "particles/weapons/plasma/plasma_compressor_hit",
	hit_shield_effect = "particles/weapons/plasma/plasma_compressor_hit",
	hit_ship_effect = "particles/weapons/plasma/plasma_compressor_hit",
	hitbox_max = Vec3( 0.2000, 0.2000, 0.2000 ),
	hitbox_min = Vec3( -0.2000, -0.2000, -0.2000 ),
	impact_type = "plasma",
	in_editor = false,
	mass = 0.05,
	shadowCaster = false,
}

Def.Blastwave_PlasmaCompressor  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 10,
	blast_maxDistance		= 5,
	apply_damage			= true,
	apply_shake 			= false,

	--effect 					= "particles/weapons/fireworks/newyear2_explosion_v2", --New Year
	effect 					= "particles/weapons/plasma/plasma_compressor_hit",
	light_color 			= "40 140 240 20",
	light_radius 			= 12,
	light_time 				= 0.4,
	sound 					= "sound/weapons/suppress/suppr_hit",
}

Def.Weapon_CritPlasmaWolfM =
{
	inherit					= "Weapon_AutoGun",
	item_subtype			= ItemSubtype.KineticCDRbyCrit,
	
	crit_chance				= 0.3,	
	
	damage_emp				= 20,
	dispersion				= 0.5,
	fire_rate				= 100,
	heat_add				= 0.67,
	heat_max				= 10,
	heat_sub				= 4,
	overheat_time			= 1.5,
	
	optimal_range			= 350,
	max_range				= 350*1.3,
	projectile				= "Projectile_CritPlasmaWolfM",
	projectile_speed		= 475,

	model					= "models/weapons/rail_guns/econom/rg_training",
	----
	shot_effect				= "particles/weapons/plasma/muzzle_heavy",
	shot_once_sound				= "sound/weapons/plasmagun/epi",
}
Def.Projectile_CritPlasmaWolfM =
{
	inherit					= "Projectile_HeavyPlasma",
	spell_on_crit			= "CritPlasmaWolfM",
	effect					= "particles/weapons/plasma/plasma_energy_projectile",
}

--Кинетика, высокая скорость и начальная точность. повышеный до 15% шанс крита, крит дает понижение ресистов у цели
--#78472
Def.Weapon_AxeShot = {
	inherit					= "Weapon_AutoGun",
	fire_rate				= 80,
	projectile_speed		= 550,
	dispersion				= 0.1,
	dispersion_max			= 1,
	dispersion_add			= 0.45,
	dispersion_sub			= 0.45,
	optimal_range			= 292.5,
	max_range				= 390,
	damage_kinetic			= 353,
	crit_chance				= 0.5,
	crit_damage				= 0.5,
	heat_max				= 10,
	heat_add				= 1.6666667,
	heat_sub				= 5,
	overheat_time			= 1,
	model					= "models/weapons/rail_guns/auto/rg_training",
	projectile				= "Projectile_AxeShot",
	shot_effect				= "particles/weapons/railgun/muzzle_axe",
	shot_once_sound         	= "sound/weapons/railgun/axeshot",
	
}
Def.Projectile_AxeShot =
{
	inherit					= "Projectile_KineticCDRbyCrit",
	spell_on_crit			= "AxeShot_Crit",
	effect					= "particles/weapons/railgun/railgun_axe_projectile",
	impact_type 			= "railgun",
}

--Микро рельсовы-миномет.  Меньше урон и радиус взрыва/подрыва, Но выше дальность и скорость.  криты вешают на всех союзников в радиусе 1500м шкуру на 1.5к на 5 сек
--#78475
Def.Weapon_MacheteCuttingEdge = 
{
	inherit 				= "Weapon_Artillery",
	crit_chance 			= 0.5,
	--shot_once_sound 		= "sound/weapons/xo/big_cannon_shot",
	shot_once_sound			= "sound/weapons/KineticFloat/KineticFloatingCrit",
	muzzleflash_color = { kinetic = "255 230 181 255", emp = "255 230 181 255", thermal = "255 230 181 255", },
	muzzleflash_radius 		= 30,
	shot_effect 			= "particles/weapons/artillery_big_muzzle",
	projectile				= "Projectile_MacheteCuttingEdge",
}
Def.Projectile_MacheteCuttingEdge =
{
	inherit					= "Projectile_Artillery",	
	spell_on_crit			= "MacheteCuttingEdge_Crit",
	spell_on_crit_if_hacked = false,
	explosion_blast_wave	= "Blastwave_MacheteCuttingEdge",
	detonation_radius		= 5,
	
	--work_sound 				= "sound/weapons/xo/bullet_fly",
	--model 					= "models/weapons/bs_torpedo_mid",
	flare_color				= "255 214 155 25",
	flare_size				= 0.05, --0.15
	flare_angle				= 180,
	flare_nebulosity		= 1.0,
	effect 					= "particles/weapons/devostrator_trail",
}
Def.Blastwave_MacheteCuttingEdge = 
{
	inherit				= "Blastwave_Artillery_Base",
	blast_maxDistance	= 15,
	--sound 				= "sound/hit/xo_common",
	death_sound = "sound/explosion/small_rocket_expl",
	light_color 		= "255 239 195 120",
	light_radius 		= 20,
	light_time 			= 0.8,
	effect 				= "particles/weapons/crossout/tank_cannon_hit",
}

--78485: Пушка на Prometheus X (термический выжигатель энергии)
Def.Weapon_PrometheusFire = {
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 120,
	
			projectile_speed		= 500,  --  900
			projectile_speed_add	= -400, -- -140	
			projectile_speed_max	= 200,
			
	dispersion				= 0.1,
	dispersion_max			= 1,
	dispersion_add			= 0.1285714,
	dispersion_sub			= 0.72,
	optimal_range			= 400,
	max_range				= 530,
	damage_thermal			= 10,
	damage_thermal_add		= 51,
	damage_thermal_sub		= 102,
	damage_thermal_max		= 305,
	crit_chance				= 0.5,
	crit_damage				= 0.5,
	heat_max				= 10,
	heat_add				= 0.8333333,
	heat_sub				= 6.6666667,
	overheat_time			= 1.5,
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	default_icon			= "ItemSubtype_PrometheusFire",
	projectile				= "Projectile_PrometheusFire",
	shot_effect 			= "particles/weapons/blaster/prometheus_muzzle",
	muzzleflash_color = { kinetic = "255 175 206 255", emp = "255 175 206 255", thermal = "255 175 206 255", },
	muzzleflash_radius 		= 30,
	shot_once_sound			= "sound/weapons/giftgun/gg_shot",
}


Def.Projectile_PrometheusFire =
{
	inherit					= "Projectile_LaserSniper",
	spell_on_crit			= "PrometheusFire_Crit",
	effect 					= "particles/weapons/blaster/prometheus_projectile",
	hit_effect				= "particles/weapons/blaster/prometheus_explosion",
	hit_ship_effect 		= "particles/weapons/blaster/prometheus_explosion",
	hit_shield_effect 		= "particles/weapons/blaster/prometheus_explosion",
	hit_crit_ship_effect 	= "particles/weapons/blaster/prometheus_explosion",
	hit_crit_shield_effect 	= "particles/weapons/blaster/prometheus_explosion",
	impact_type 			= "plasma",
}

Def.Weapon_LokiPrometheusFire = 
{
	inherit					= 'Weapon_PrometheusFire',
	item_subtype			= ItemSubtype.LokiPrometheusFire,
}	

----------------------------------------------------

Def.Weapon_MacheteSmartRL2 = 
{
	class 				= "SmartRocketAutoGun",

	cycle_barrels		= true,
	heat_max 			= 10,	
	heat_add 			= 0.5,
	heat_sub 			= 8,
	fire_rate 			= 20, -- из расчета 1 выстрел в секунду при 4ех стволах.       14/25 16/25 18/25 -- на такой реальный фаер рейт надо расчитывать
	optimal_range		= 400,
	max_range			= 550,
	
	locked_target		= true,		-- угол наведения #80155
	angle_of_view		= 15, 		-- угол наведения #80155

	projectile 			= "Projectile_MacheteSmartRL2",
	shot_once_sound 	= "sound/weapons/smartRocket/smr",
	projectile_speed	= 125,	
	
	damage_kinetic		= 10,  -- 
	no_friendly_fire 	= true,

	targeting_beam_fx	= "particles/weapons/machete_laser",
	beam_bone 			= "rocket_1",
	model = "models/weapons/coil_mortar/coil_mortar_mod3",
	
	shot_effect 		= "particles/weapons/devostator_muzzle",
	muzzleflash_color = { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 	= 8,
}

Def.Projectile_MacheteSmartRL2 =
{
	inherit 					= "Weapon_BaseRocket",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	is_guided					= true,
	angular_velocity			= 46,
	
	detonation_radius			= 1,
	
	explosion_blast_wave 	= "Blastwave_MacheteSmartRL2",

	flare_size			= 0.0,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	
	effect 				= "particles/weapons/devostrator_trail",
	impact_type 		= "rocket",
}

Def.Blastwave_MacheteSmartRL2  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_kinetic			= 1,
	blast_maxDistance		= 5,
	apply_damage			= true,

	effect 					= "particles/explosions/artillery_fire",
	light_color 			= "255 226 178 100",
	light_radius 			= 18,
	light_time 				= 0.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}


Def.Weapon_ForkLaserFoxM =
{
	inherit 				= "Weapon_Base",
	class 					= "ForkGun", -- 
	

	damage_thermal			= 10,

	heat_max				= 10,
	heat_add 				= 0.83,
	heat_sub 				= 5,
	overheat_time 			= 1,

	dispersion 				= 4.5,

	fire_rate 				= 120,
	target_energy_cost 		= 30, -- энргия за дополнительную цель
	shot_energy_cost		= 20, -- энергия за факт выстрела
	
	optimal_range			= 30,
	max_range				= 250,

	
	model					= "models/weapons/beam_cannon/beam_cannon_mod1",
	focus_distance			= 3,
	
	shot_beam_fx 	        = "particles/weapons/laser/deimos_laser_beam", 
	shot_effect 			= "particles/weapons/laser/deimos_laser_muzzle",
	focus_fx 				= "particles/empty",
	hit_fx					= "particles/weapons/laser/deimos_laser_muzzle",

	shot_once_sound 		= "sound/weapons/laser/ForkLaser_light_fire",
	
	muzzleflash_color = { kinetic = "255 250 231 128", emp = "255 250 231 128", thermal = "255 250 231 128", },
	muzzleflash_radius 		= 16,
	
	impact_type 			= "plasma",
} 


---------
Def.Weapon_FrontReaperGun = {
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 220,
	
	projectile_speed		= 475,  --  900
			
	dispersion				= 0.1,
	dispersion_max			= 1,
	dispersion_add			= 0.1285714,
	dispersion_sub			= 0.72,
	optimal_range			= 200,
	max_range				= 300,
	damage_emp				= 147*1.75, -- под 4 ранг
	crit_chance				= 0.5,
	crit_damage				= 0.5,
	heat_max				= 10,
	heat_add				= 0.8333333,
	heat_sub				= 6.6666667,
	overheat_time			= 1.5,
	
	track 					= ai.TrackMode.AIM,
	max_aim_yaw				= 3,  -- (в градусах)
	max_aim_pitch  			= 3,  --(в градусах). 
	--Чтобы зафиксировать направление прицела:
	--barrel_rot_speed = 1, -- любое число, кроме нуля
	--barrel_rot_speed_fire = 1, -- любое число, кроме нуля
	--strafe_speed_mul = -4, --не заработало
	
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	projectile				= "Projectile_FrontReaperGun",
	shot_effect 			= "particles/weapons/plasma/muzzle",
	muzzleflash_color = { kinetic = "255 175 206 255", emp = "255 175 206 255", thermal = "255 175 206 255", },
	muzzleflash_radius 		= 30,
	shot_once_sound			= "sound/weapons/giftgun/gg_shot",
--spell_on_equip				= "AdaptiveDefense1",
spell_on_max_speed_forward_plus		= "WeaponFrontReaperGunOnSpeed",
max_speed_percent			= 1.01,
spell_on_equip				= "WeaponFrontReaperRot", --rot_speed_mul				= 0.5,
}
Def.Projectile_FrontReaperGun =
{
	inherit					= "Projectile_LaserSniper",
	--spell_on_crit			= "PrometheusFire_Crit",
	effect 					= "particles/weapons/plasma/plasma_front_projectile",
	hit_effect				= "particles/weapons/plasma/hit",
	hit_ship_effect 		= "particles/weapons/plasma/hit_ship",
	hit_shield_effect 		= "particles/weapons/plasma/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/plasma/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/plasma/hit_crit_shield",
	impact_type 			= "plasma",
	inherit_speed 			= true,
}



-------------------
Def.Weapon_SuddenFire = 
{
	class 				= "AutoGun",

	--cycle_barrels		= true,
	heat_max 					= 10,	
	heat_add 					= 0.5,
	heat_sub 					= 8,
	fire_rate 					= 60, 
	optimal_range				= 180,
	max_range					= 180,
	crit_chance					= 0.35,
	crit_damage					= 0.75,
	shot_energy_cost			= 20,

	projectile 					= "Projectile_SuddenFire",
	shot_once_sound 			= "sound/weapons/smartRocket/smr",
	projectile_speed			= 350,	
	
	damage_kinetic				= 666,  -- 
	no_friendly_fire 			= true,

	model 						= "models/weapons/coil_mortar/coil_mortar_mod3",
	
	shot_effect 				= "particles/weapons/devostator_muzzle",
	muzzleflash_color = { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 			= 4,
}

Def.Projectile_SuddenFire =
{
	inherit 					= "Weapon_BaseRocket",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	--is_guided					= true,
	--angular_velocity			= 35,
	
	spell_on_crit				= "SuddenFire_Crit",
	
	detonation_radius			= 6,
	
	explosion_blast_wave 		= "Blastwave_SuddenFire",

	flare_size					= 0.0,

	work_sound					= "sound/weapons/smartRocket/smr_fly",
	
	effect 						= "particles/weapons/devostrator_trail",
	impact_type 				= "rocket",
}

Def.Blastwave_SuddenFire  =
{
	class						= "BlastWave",
	in_editor					= false,

	damage_kinetic				= 1,
	blast_maxDistance			= 7,
	apply_damage				= true,

	effect 						= "particles/explosions/artillery_fire",
	light_color 				= "255 226 178 100",
	light_radius 				= 18,
	light_time 					= 0.2,
	sound 						= "sound/explosion/SmartRocket_expl",
}



Def.Weapon_WeaknessScoutPlasma = {
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 200,
	
	projectile_speed		= 475,  --  900
			
	dispersion				= 0.1,
	dispersion_max			= 1,
	dispersion_add			= 0.1285714,
	dispersion_sub			= 0.72,
	optimal_range			= 200,
	max_range				= 300,
	damage_emp				= 100,
	crit_chance				= 0.5,
	crit_damage				= 0.75,
	heat_max				= 10,
	heat_add				= 0.8333333,
	heat_sub				= 6.6666667,
	overheat_time			= 1.5,
	
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	projectile				= "Projectile_WeaknessScoutPlasma",
	shot_effect 			= "particles/weapons/plasma/muzzle",
	muzzleflash_color = { kinetic = "255 175 206 255", emp = "255 175 206 255", thermal = "255 175 206 255", },
	muzzleflash_radius 		= 30,
	shot_once_sound			= "sound/weapons/giftgun/gg_shot",
}
Def.Projectile_WeaknessScoutPlasma =
{
	inherit					= "Projectile_LaserSniper",
	spell_on_crit			= "WeaknessScoutPlasma",
	effect 					= "particles/weapons/plasma/plasma_front_projectile",
	hit_effect				= "particles/weapons/plasma/hit",
	hit_ship_effect 		= "particles/weapons/plasma/hit_ship",
	hit_shield_effect 		= "particles/weapons/plasma/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/plasma/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/plasma/hit_crit_shield",
	impact_type 			= "plasma",
}


Def.Weapon_LaserVUX = {
	--class 					= "LaserGun",
	class 					= "LaserGunRay",
	fire_rate				= 60,
	impulse_time			= 1,
	dispersion				= 0,
	dispersion_max			= 0,
	optimal_range			= 200,
	max_range				= 250,
	damage_emp				= 100,
	crit_chance				= 0.05,
	crit_damage				= 1,
	heat_max				= 10,
	heat_add				= 3,
	heat_sub				= 6.66,
	overheat_time			= 1,
	model					= "models/weapons/beam_cannon/beam_cannon_mod1",
	default_custom_elements	= {
		[ai.VesselCustomSlot.MATERIAL_0]="weapons_beamcannon_r1",
		[ai.VesselCustomSlot.MATERIAL_1]="weapons_beamcannon_g1",
		[ai.VesselCustomSlot.MATERIAL_2]="weapons_beamcannon_b1",
	},
	module_type				= ai.ModuleType.WEAPON,
	
	track 					= ai.TrackMode.AIM,
	max_aim_yaw				= 22,  -- (в градусах)
	max_aim_pitch  			= 4, --(в градусах). 
	--track_offset			= Vec3( 0, 0, -250 ), -- направление вперёд, сведение стволов 1000 м
	--Чтобы зафиксировать направление прицела:
	--barrel_rot_speed 		= 1, -- любое число, кроме нуля
	--barrel_rot_speed_fire 	= 1, -- любое число, кроме нуля
	focus_distance			= 3,  -- фокус одного луча
	
	muzzleflash_radius 		= 10,
	damage_color = { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "143 239 143 255", },
	muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "127 255 127 255", },
	
	beam_start_fx			= "particles/weapons/laser/laser_basic_beam",
	focus_fx 				= "",
	beam_fx 				= "particles/weapons/laser/laser_basic_beam",
	fire_fx 				= "",	
	hit_fx					= "particles/weapons/laser/hit",
	
	shot_loop_sound = "sound/weapons/laser/basic",
	impact_type 	= "laser",
} 

Def.Weapon_CorrosiveGunScout = {
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	fire_rate				= 60,
	cycle_barrels 			= true,
	no_friendly_fire		= true,
	--override_blast_wave_damage = true,

	dispersion				= 0.3,
	optimal_range			= 250,
	max_range				= 300,
	projectile_speed		= 350,
	
	damage_kinetic			= 125,
	crit_chance				= 0.25,
	crit_damage				= 0.5,
	
	spell_on_hit			= "CorrosiveGunScout",
	
	heat_max				= 10,
	heat_add				= 0.3,
	heat_sub				= 8,
	overheat_time			= 1.5,
	
	module_type				= ai.ModuleType.WEAPON,
	projectile				= "Projectile_CorrosiveGunScout",
	shot_effect				= "particles/weapons/railgun/muzzle",
	muzzleflash_color = { kinetic = "230 164 120 64", emp = "230 164 120 64", thermal = "230 164 120 64", },
	muzzleflash_radius 		= 10,
	shot_once_sound 		= "sound/weapons/suppress/suppr",
}
Def.Projectile_CorrosiveGunScout =
{
	class					= "Projectile",
	
	hitbox_min 				= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max				= Vec3( 0.1, 0.1, 0.1 ),
	
	effect 					= "particles/weapons/railgun/railgun_basic_projectile",
	hit_effect				= "particles/weapons/railgun/hit",
	hit_ship_effect 		= "particles/weapons/railgun/hit_ship",
	hit_shield_effect 		= "particles/weapons/railgun/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/railgun/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/railgun/hit_crit_shield",
	
	damage_to_spell_aura_param = true,
	--spell_on_crit			= "CorrosiveGunScout_Crit",
	
	flare_color				= "42 255 72 45",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
}

--
Def.Weapon_RailActiveSuppressor = {
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 320,
	
	projectile_speed		= 500,  --  900
			
	dispersion				= 0.1,
	dispersion_max			= 1,
	dispersion_add			= 0.1285714,
	dispersion_sub			= 0.72,
	optimal_range			= 200,
	max_range				= 300,
	damage_kinetic 			= 10,
	crit_chance				= 0.15,
	crit_damage				= 0.5,
	heat_max				= 10,
	heat_add				= 0.8333333,
	heat_sub				= 6.6666667,
	overheat_time			= 1.5,
	model					= "models/weapons/rail_guns/auto/rg_training",
	default_icon			= "ItemSubtype_RailActiveSuppressor",
	projectile				= "Projectile_RailActiveSuppressor",
	shot_effect				= "particles/weapons/railgun/muzzle",
	muzzleflash_color = { kinetic = "230 164 120 64", emp = "230 164 120 64", thermal = "230 164 120 64", },
	muzzleflash_radius 		= 10,
	shot_once_sound 		= "sound/weapons/railgun/basic",
}
Def.Projectile_RailActiveSuppressor =
{
	inherit					= "Projectile_KineticCDRbyCrit",
	spell_on_crit			= "RailActiveSuppressor",
	effect					= "particles/weapons/railgun/railgun_fast_projectile",
	hit_effect				= "particles/weapons/railgun/hit",
	hit_ship_effect 		= "particles/weapons/railgun/hit_ship",
	hit_shield_effect 		= "particles/weapons/railgun/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/railgun/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/railgun/hit_crit_shield",
	impact_type 			= "railgun",
}

--
-------------------
Def.Weapon_BlastWeaponDestructor = 
{
	class 						= "AutoGun",

	cycle_barrels				= true,
	heat_max 					= 10,
	heat_add 					= 0.5,
	heat_sub 					= 8,
	fire_rate 					= 30, 
	optimal_range				= 180,
	max_range					= 180,
	crit_chance					= 0.15,
	crit_damage					= 0.75,

	projectile 					= "Projectile_BlastWeaponDestructor",
	shot_once_sound 			= "sound/weapons/smartRocket/smr",
	projectile_speed			= 350,	
	
	damage_kinetic				= 100,  -- 
	no_friendly_fire 			= true,
	
	--spell_on_hit				= "BlastWeaponDestructor",

	model 						= "models/weapons/coil_mortar/coil_mortar_mod3",
	
	shot_effect 				= "particles/weapons/devostator_muzzle",
	muzzleflash_color = { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 			= 4,
}

Def.Projectile_BlastWeaponDestructor =
{
	inherit 					= "Weapon_BaseRocket",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	--is_guided					= true,
	--angular_velocity			= 35,
	
	--spell_on_crit				= "BlastWeaponDestructor",
	spell						= "BlastWeaponDestructor",
	
	detonation_radius			= 6,
	
	explosion_blast_wave 		= "Blastwave_BlastWeaponDestructor",

	flare_size					= 0.0,

	work_sound					= "sound/weapons/smartRocket/smr_fly",
	
	effect 						= "particles/weapons/devostrator_trail",
	impact_type 				= "rocket",
}

Def.Blastwave_BlastWeaponDestructor  =
{
	class						= "BlastWave",
	in_editor					= false,

	damage_kinetic				= 1,
	blast_maxDistance			= 7,
	apply_damage				= true,

	effect 						= "particles/explosions/artillery_fire",
	light_color 				= "255 226 178 100",
	light_radius 				= 18,
	light_time 					= 0.2,
	sound 						= "sound/explosion/SmartRocket_expl",
}



--
Def.Weapon_EnergyBlaster = {
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 400,
	
	projectile_speed		= 500,  --  900
			
	dispersion				= 0.1,
	dispersion_max			= 1,
	dispersion_add			= 0.1285714,
	dispersion_sub			= 0.72,
	optimal_range			= 200,
	max_range				= 300,
	damage_thermal 			= 10,
	crit_chance				= 0.15,
	crit_damage				= 0.5,
	heat_max				= 10,
	heat_add				= 0.8333333,
	heat_sub				= 6.6666667,
	overheat_time			= 1.5,
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	default_icon			= "ItemSubtype_EnergyBlaster",
	projectile				= "Projectile_EnergyBlaster",
	
	spell_on_hit					= "EnergyBlaster",
	
			shot_once_sound = "sound/weapons/destroyer_lb/dlb_shot",
			shot_loop_sound = "sound/destroyer/minigun_start_loop",
			shot_effect = "particles/weapons/blaster/neutron_muzzle",
	muzzleflash_color = { kinetic = "255 175 206 255", emp = "255 175 206 255", thermal = "255 175 206 255", },
	muzzleflash_radius 		= 30,
}

Def.Projectile_EnergyBlaster =
{
	inherit					= "Projectile_Plasma_Default",
	effect 					= "particles/weapons/blaster/neutron_projectile",
	hit_effect				= "particles/weapons/blaster/dturret_explosion",
	smooth_effect_param 	= true,
	shadowCaster			= false,
	impact_type 			= "lasersniper",
}



-------------------
----------------------------------------------------
Def.Weapon_ZoneCleaner =
{
	class 				= "SmartRocketLauncher",

	cycle_barrels		= true,
	heat_max 			= 10,
	heat_add 			= 4,
	heat_sub 			= 5,
	fire_rate 			= 5, -- из расчета 0.5? выстрел в секунду при 6ех стволах.       при таких настройках переграва м скорости пули 4/5/200  актуальный фаер рейт на 5 км 20 в минуту
	optimal_range		= 510,
	max_range			= 650,
	
	--show_cooldown 		= true,

	
	projectile 			= "Projectile_ZoneCleaner",
	shot_once_sound 	= "sound/weapons/smartRocket/smr",
	projectile_speed	= 200,	
	
	damage_thermal 		= 333,  -- надо смотреть урон по лазеру -30%  + 6000 урона в спелле
	no_friendly_fire 	= true,

	targeting_beam_fx	= "particles/weapons/machete_laser",
	beam_bone 			= "rocket_1",
	
	shot_effect = "particles/weapons/zonecleaner_muzzle",
	muzzleflash_color = { kinetic = "250 170 150 128", emp = "250 170 150 128", thermal = "250 170 150 128", },
	muzzleflash_radius 	= 16,
}


Def.Projectile_ZoneCleaner =
{
	inherit 					= "Weapon_BaseRocket",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	is_guided					= true,
	angular_velocity			= 50,
	
	detonation_radius			= 6,
	
	explosion_blast_wave 		= "Blastwave_ZoneCleaner",
	spell						= "ZoneCleaner",

	flare_color					= "255 255 191 150",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound					= "sound/weapons/smartRocket/smr_fly",
	effect 						= "particles/weapons/zonecleaner_projectile",
	impact_type 				= "rocket",
}

Def.Blastwave_ZoneCleaner  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_minDistance		= 3,
	blast_maxDistance		= 8,
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/zonecleaner_explosion",
	light_color 			= "250 150 150 255",
	light_radius 			= 35,
	light_time 				= 0.4,
	sound 					= "sound/explosion/SmartRocket_expl",
}


------------
Def.Weapon_JerichoTrumpets =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",

	cycle_barrels 		= true,
	
	fire_rate			= 10,
	
	dispersion				= 0.1,
	dispersion_max			= 3.75,
	dispersion_add			= 1.6,
	dispersion_sub			= 2,

	max_range			= 650,
	projectile_speed 	= 600.0,
	
	spell_on_hit		= "JerichoTrumpets",
	
	--damage				= 10,
	damage_kinetic		= 10,
	damage_emp			= 0,
	damage_thermal		= 0,
	
	heat_max 			= 10,
	heat_add 			= 2.5,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 7,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,
	
	no_friendly_fire	= true,
	
	-- В случае 1 пушки из 6
	-- 6 * 6.5 = 39 heat
	-- rof 1/6 --tts 6
	-- sub * tts = 50
	-- итого нет нагрева
	
	-- В случае 2 пушки из 6
	-- 3 * 6.5 = 19.5
	-- rof 2/6 --tts 3
	-- sub * tts = 15
	-- итого нагрев 4.5 раз в 3 секунды
	
	-- Но перегрева нет вообще!!! где то ошибка.
	
	muzzleflash_color = { kinetic = "255 210 146 100", emp = "255 210 146 100", thermal = "255 210 146 100", },
	muzzleflash_radius = 20,

	projectile			= "Projectile_JerichoTrumpets",
	
	shot_once_sound 		= "sound/weapons/xo/big_cannon_shot",
	model				= "models/weapons/rail_guns/econom/rg_training",
	shot_effect = "particles/weapons/artillery_big_muzzle",
}


Def.Projectile_JerichoTrumpets =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave= "Blastwave_JerichoTrumpets",
	override_blast_wave_damage = true,
	
	detonation_radius	= 4,
	
	spell_on_launch		= "JerichoTrumpets_ReturnMove", 

	--flare_color			= "255 241 204 15",--15
	flare_color			= "255 190 140 15",
	flare_size			= 0.3,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_small",
--	work_sound			= "",
	missile_defence_immune 	= true,
}


Def.Blastwave_JerichoTrumpets =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 1000,
	blast_maxDistance	= 8,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/explosions/artillery_big_fire",
	light_color 		= "255 182 128 100",
	light_radius 		= 20,
	light_time 			= 0.8,
	sound 				= "sound/explosion/small_rocket_expl",
}

Def.Weapon_ChainLaser = 
{
	class 					= "LaserGunRay",
	damage_thermal			= 10,
	dispersion 				= 0,
	dispersion_max 			= 0,
	fire_rate 				= 60,
	
	heat_add 				= 1.6666667,
	heat_max 				= 10,
	heat_sub 				= 8,
	overheat_time 			= 1.5,
	
	impulse_time 			= 1, -- мерцающий лазер при значении < 1
	
	optimal_range 			= 50,
	max_range 				= 400,

	crit_chance				= 0.0,
	crit_damage				= 0.5,
	
	weapon_class 			= ai.WeaponClass.LASER,
	module_type 			= ai.ModuleType.WEAPON,
	
	link_range 				= 30,
	chaing_damage			= { 1, 0.75, 0.5, 0.25 },
	--chaing_damage			= { 1, 2, 3, 4 },
	chain_target			= { 
		class 				= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.GUIDED_DRONE,
		relationship 		= ai.SpellTargetRelationship.ENEMY,
		},
	shield_subtypes 		= { ItemSubtype.SectorShield, ItemSubtype.Screen, },
	
	muzzleflash_radius 		= 20,
	impact_type 			= "laser",
	damage_color		 	= { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "228 109 69 255", },
	muzzleflash_color 		= { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 140 101 255", },
	beam_start_fx			= "particles/weapons/laser/laser_basic_beam",
	beam_fx 				= "particles/weapons/laser/laser_basic_beam",
	focus_fx 				= "",
	fire_fx					= "",
	hit_fx 					= "particles/weapons/laser/hit",
	
	hit_loop_sound = "sound/hit/laser_loop",
	shot_loop_sound = "sound/weapons/laser/LaserHeal",
}



Def.Weapon_LaserHealNormal = 
{
	inherit = "Weapon_LaserGun",

	damage_thermal = 451,
	dispersion = 0,
	dispersion_max = 0,
	fire_rate = 60,
	heal_ally 				= 150,
	heal_ally_energy_cost 	= 50,
	
	spell_on_hit 			= "LaserHealNormal",
	spell_on_hit_timeout 	= 1.5, -- макс 80 SHIELD_RESIST_ALL за 15 сек
	spell_on_hit_streak_time = 1,

	heat_add = 1.6666667,
	heat_max = 10,
	heat_sub = 8,
	overheat_time = 1.5,

	weapon_class = ai.WeaponClass.LASER,
	impulse_time = 1, -- мерцающий лазер при значении < 1

	model = "models/weapons/laser_heal_engineer/laser_heal_engineer",

	optimal_range = 230,
	max_range = 305,	

	damage_color	  = { kinetic = ai.DONT_INHERIT, emp = ai.DONT_INHERIT, thermal = "255 255 255 255", },
	muzzleflash_color = { kinetic = "255 100 100 0", emp = "255 100 100 0", thermal = "255 100 100 0", },
	muzzleflash_radius = 20,

	impact_type = "laser",	
	hit_fx = "particles/weapons/laser/alien_laser_hit",
	hit_loop_sound = "sound/hit/laser_loop",
	beam_fx = "particles/weapons/laser/alien_engeneer_healbeam",
	fire_fx = "particles/weapons/laser/alien_laser_muzzle",

	heal_loop_sound = "sound/hit/laser_heal_loop",
	shot_loop_sound = "sound/weapons/laser/LaserHeal",	
}

Def.Projectile_NanobotsCritAdaptive  =
{
	inherit				= "Projectile_Nanobots_Cloud",
	spell				= "NanobotsCritAdaptive",
	spell_on_crit		= "NanobotsCritAdaptive_Crit",
	spell_on_crit_if_hacked = false,
}

Def.Weapon_PlasmaGuard = {
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 30,
	cycle_barrels			= true,
	
	projectile_speed		= 400,  --  900
			
	dispersion				= 2,
	dispersion_max			= 0.1,
	dispersion_add			= -0.4285714,
	dispersion_sub			= -0.72,
	optimal_range			= 300,
	max_range				= 380,
	damage_emp	 			= 10,
	crit_chance				= 0.05,
	crit_damage				= 0.75,
	heat_max				= 10,
	heat_add				= 2,
	heat_sub				= 6.6666667,
	overheat_time			= 1.5,
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	projectile				= "Projectile_PlasmaGuard",
	
	spell_on_hit			= "PlasmaGuard_CritChance",
	spell_on_hit_if_hacked 	= false,
	
	shot_once_sound		= "sound/weapons/GreenGravityAnomaly/ga_fire",
	shot_effect = "particles/weapons/plasma/muzzle_guard",
	muzzleflash_color = { kinetic = "153 175 255 128", emp = "153 175 255 128", thermal = "153 175 255 128", },
	muzzleflash_radius 		= 16,
}
Def.Projectile_PlasmaGuard =
{
	inherit					= "Projectile_LaserSniper",
	spell_on_crit			= "PlasmaGuard_Crit",
	spell_on_crit_if_hacked = false,
	hit_effect				= "particles/weapons/plasma/hit",
	hit_ship_effect 		= "particles/weapons/plasma/hit_ship",
	hit_shield_effect 		= "particles/weapons/plasma/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/plasma/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/plasma/hit_crit_shield",
	effect 					= "particles/weapons/plasma/plasma_guard_projectile",
	impact_type 			= "plasma",
}

Def.Weapon_MirvRocket = {	
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
	
	--guide_rocket_to_point = true,
	detonate_at_point 	= true,
	--class 				= "SmartRocketAutoGun",
	cycle_barrels		= true,
	heat_max 			= 10,
	heat_add 			= 0.5,
	heat_sub 			= 8,
	fire_rate 			= 10, 
	optimal_range		= 300,
	max_range			= 400,
	
	projectile 			= "Projectile_MirvRocket",
	shot_once_sound 	= "sound/weapons/smartRocket/smr",
	projectile_speed	= 125,	
	
	damage_kinetic		= 10,  -- 
	no_friendly_fire 	= true,

	model = "models/weapons/coil_mortar/coil_mortar_mod3",
	
	shot_effect 		= "particles/weapons/devostator_muzzle",
	muzzleflash_color = { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 	= 8,
}

Def.Projectile_MirvRocket =
{
	inherit 					= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo_mid",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	is_guided					= true,
	angular_velocity			= 0,
	detonation_timeout			= 0.2,
	
	detonation_radius			= 1,

	detonate_on_distance= 90,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.
	child_rockets =
	{
		rocket = "Projectile_MirvRocket1",
		--rocket = "SpaceMissile_Standart_T1_Mk1",

		sphere_radius = 1, -- опционально
		-- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
		-- Общее количество ракет не должно превышать 20
		scheme = {
			circle0 = { amount = 1, angle = 0, },

			circle1 = { amount = 5, angle = 10, }, -- опционально

		},

		--описание целей для управляемых ракет. Поддерживается не более 10 целей
		direct_to_target = {
			class = ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.TORPEDO + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.GUIDED_DRONE,
			area = ai.SpellTargetArea.AROUND,
			relationship = ai.SpellTargetRelationship.ENEMY,
		},
		direct_range = 100, -- радиус поиска целей для управляемых ракет
		max_rockets_per_target = 3, -- количество управляемых ракет на одну цель
	},
	
	explosion_blast_wave 	= "Blastwave_MirvRocket",
	override_blast_wave_damage = true,
	missile_defence_immune = true,	
	missile_detection_immune = true,

	flare_size			= 0.0,
	flare_color			= "255 170 191 0",

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "rocket",
}
Def.Projectile_MirvRocket1 =
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_MirvRocket1",
	model				= "models/weapons/bs_torpedo_small",
	override_blast_wave_damage = true,
	missile_defence_immune = true,	
	missile_detection_immune = true,
	detonation_radius	= 4,
	--projectile_speed 	= 300,  
	max_range			= 150,  
	speed 				= 95,
	angular_velocity 	= 120,
	is_guided 			= true,
	random_trajectory 	= true,
	
	flare_color			= "255 170 191 0",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	--work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/devostrator_trail",
	impact_type 		= "rocket",
}
Def.Blastwave_MirvRocket  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 10,
	blast_maxDistance		= 5,
	apply_damage		= true,
	apply_shake 		= false,

	effect 					= "particles/explosions/artillery_fire",
	light_color 			= "255 226 178 100",
	light_radius 			= 18,
	light_time 				= 0.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}
Def.Blastwave_MirvRocket1  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 50,
	blast_maxDistance		= 7,
	apply_damage			= true,
	apply_shake 		= false,


	effect 					= "particles/explosions/artillery_fire",
	light_color 			= "255 226 178 100",
	light_radius 			= 18,
	light_time 				= 0.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}


Def.Weapon_PlasmaHunterGun= {
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",

	cycle_barrels 		= true,
	
	--fire_rate		= 200,
	fire_rate			= 180, --макс 300. допускается 240. cycle_barrels =*4
	dispersion			= 0, 
	dispersion_add		= 0.8, 
	dispersion_sub		= 0.5, 
	dispersion_max		= 1.2, 

	max_range			= 350,
	projectile_speed 	= 475.0,
	
	--damage		= 10,
	--damage_kinetic		= 0,
	damage_emp			= 105,
	--damage_thermal		= 0,
	
	heat_max 			= 15,
	heat_add 			= 2.5,
	heat_sub 			= 5,
	overheat_time 		= 1,

	projectile			= "Projectile_PlasmaHunterGun",
	
	model				= "models/weapons/rail_guns/econom/rg_training",
	item_subtype		= ItemSubtype.SWGift,
	--item_lvl			= 25, -- на данный момент спелл не масштабируется от илвл пушки
	shot_once_sound		= "sound/weapons/giftgun/gg_shot",
	shot_effect 		= "particles/weapons/alien/sw_gift_muzzle",
	
	muzzleflash_color = { kinetic = "55 240 46 200", emp = "55 240 46 200", thermal = "55 240 46 200", },
	muzzleflash_radius = 4,
}

Def.Projectile_PlasmaHunterGun  =
{
	inherit				= "Projectile_Plasma_Default",

	hit_effect			= "particles/weapons/alien/sw_gift_hit",
	--effect 			= "particles/weapons/plasma/plasma_auto_projectile",	
	effect 				= "particles/weapons/alien/sw_gift_projectile_wide", -- Выглядит неплохо, чуть короче может надо.
	--effect 			= "particles/weapons/nuke/workflare",
	shadowCaster		= false,
	impact_type 		= "plasma",
	
}

-- SC-87551 Пушка на следующий корабль   "Пушка на дальнобойный фрегат"
-- Пушка стреляет очередями, быстрыми пулями. Прототип
-- Можно подумать над доработкой в уи возможности скрывать перегрев флагом в дефе пушки.
Def.Weapon_BurstFire = 
{
	cant_be_bought = true,
	class = "AutoGun",

	crit_chance = 0.05,
	crit_damage = 0.5,

	damage_emp = 0,
	damage_kinetic = 92,
	damage_thermal = 0,

	dispersion = 0.1,
	dispersion_add = 2,
	dispersion_max = 1.6,
	dispersion_sub = 1.5,

	fire_rate = 400,

	heat_add = 20,
	heat_max = 10,
	heat_sub = 20,
	overheat_time = 0.5,

	item_subtype = ItemSubtype.RailgunBasic,

	max_range = 390,
	model = "models/weapons/destructor/destructor_mod0",
	module_type = ai.ModuleType.WEAPON,
	muzzleflash_color = { kinetic = "255 175 206 255", emp = "255 175 206 255", thermal = "255 175 206 255", },
	muzzleflash_radius = 20,

	optimal_range = 280,

	projectile = "Projectile_Nail_Iron",
	projectile_speed = 900,

	shot_effect = "particles/weapons/blaster/neutron_muzzle",
	shot_loop_sound = "sound/destroyer/minigun_start_loop",
	shot_once_sound = "sound/weapons/destroyer_lb/dlb_shot",
	source_desc = "hangar_fed_rock_colony_e_ow",

	weapon_class = ai.WeaponClass.RAILGUN,
}

Def.Weapon_Cryolaser = 
{
	module_type = ai.ModuleType.WEAPON,
	class = "LaserGun",
	weapon_class = ai.WeaponClass.LASER,
	
	crit_chance = 0.05,
	crit_damage = 1,

	damage_emp = 0,
	damage_kinetic = 0,
	damage_thermal = 538.2,

	dispersion = 0,
	dispersion_max = 0,

	end_fx = "particles/weapons/laser/hit",
	fire_fx = "",
	fire_rate = 60,

	heat_add = 1,
	heat_max = 10,
	heat_sub = 4,
	overheat_time = 1.5,

	optimal_range = 250,
	max_range = 335,

	spell_on_hit = "FreezeManeuver",
	spell_on_hit_max_range = 150,

	beam_fx = "particles/weapons/laser/laser_cryolaser",
	hit_fx = "particles/weapons/laser/hit",
	hit_loop_sound = "sound/hit/laser_loop",
	impact_type = "laser",
	impulse_time = 1,
	item_subtype = 1,
	model = "models/weapons/beam_cannon/beam_cannon_mod4",
	damage_color	  = { kinetic = ai.DONT_INHERIT, emp = ai.DONT_INHERIT, thermal = "255 255 255 255", },
	muzzleflash_color = { kinetic = "152 46 30 128", emp = "152 46 30 128", thermal = "152 46 30 128", },
	muzzleflash_radius = 20,
	shot_loop_sound = "sound/weapons/laser/basic",
	fire_fx = "particles/weapons/laser/laser_cryolaser_muzzle",
}

Def.Weapon_LoudEcho = 
{	
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	--guide_rocket_to_point	= true,
	cycle_barrels			= true,
	heat_max 				= 10,
	heat_add 				= 0.5,
	heat_sub 				= 8,
	fire_rate 				= 30, 
	optimal_range			= 200*0.75,
	max_range				= 200,
	
	projectile 				= "Projectile_LoudEcho",
	shot_once_sound 		= "sound/weapons/LoudEcho/le_fire",
	projectile_speed		= 350,	
	
	damage_emp				= 400, 
	no_friendly_fire 		= false,

	model					= "models/weapons/loud_echo/loud_echo",
	
	shot_effect 			= "particles/weapons/other/echo_muzzle",
	muzzleflash_color = { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 		= 8,
}

Def.Projectile_LoudEcho =
{
	inherit 					= "Weapon_BaseRocket",
	model						= "",

	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	--is_guided					= true,
	--angular_velocity			= 20,
	
	detonation_radius			= 4.5,
	hitbox_min 					= Vec3( -2.5, -2.5, -2.5 ),
	hitbox_max					= Vec3( 2.5, 2.5, 2.5 ),

	child_rockets =
	{
		rocket = "Projectile_LoudEcho_Back",
		echo_radius = 2.5,
		echo_rocket_if_reflected = false,
	},
	
	explosion_blast_wave_on_hit	= "Blastwave_LoudEcho_Hit",
	explosion_blast_wave 		= "Blastwave_LoudEcho_Dissapear",
	override_blast_wave_damage	= true,

	flare_size					= 0.0,
	flare_color					= "255 170 191 0",

	--work_sound				= "sound/weapons/smartRocket/smr_fly",
	
	effect 						= "particles/weapons/other/echo_projectile",
	impact_type 				= "rocket",
	
	disable_concussion_sound	= true,
}

Def.Projectile_LoudEcho_Back =
{
	inherit						= "Weapon_BaseRocket",
	model						= "",
	
	missile_defence_immune		= true,	
	missile_detection_immune 	= true,
	max_range					= 200*0.6,  
	speed 						= 250,

	--detonation_radius			= 3.5,
	detonate_on_distance		= 5.5,
	--hitbox_min 				= Vec3( -2, -2, -0.1 ),
	--hitbox_max				= Vec3( 2, 2, 0.1 ),
	
	explosion_blast_wave 		= "Blastwave_LoudEcho_Dissapear",
	override_blast_wave_damage	= false,
	
	flare_size					= 0.0,
	flare_color					= "255 170 191 0",

	--work_sound				= "sound/weapons/smartRocket/smr_fly",
	
	effect 						= "particles/weapons/other/echo_projectile",
	impact_type 				= "rocket",
	
	spell						= "EchoBuff",
	spell_on_owner_hit_only		= true,
	
	disable_concussion_sound	= true,
	--spell_sound_instead_of_blastwave_sound	= true,
}

Def.Blastwave_LoudEcho_Hit  =
{
	class					= "BlastWave",
	in_editor				= false,

	blast_maxDistance		= 12.5,
	apply_damage			= true,
	apply_shake 			= true,
	self_damage_coef		= 0,

	effect 					= "particles/weapons/other/echo_hit",
	light_color 			= "255 226 178 100",
	light_radius 			= 18,
	light_time 				= 0.2,
	sound 					= "sound/explosion/LoudEcho_expl",
}

Def.Blastwave_LoudEcho_Dissapear  =
{
	class					= "BlastWave",
	in_editor				= false,

	blast_maxDistance		= 5,
	apply_damage			= false,
	apply_shake 			= false,

	effect 					= "particles/weapons/other/echo_disappear",
	light_color 			= "255 226 178 100",
	light_radius 			= 18,
	light_time 				= 0.2,
	sound 					= "sound/hit/LoudEcho_Back",
}

Def.Weapon_KineticStkBomb = 
{
	class 				= "AutoGun",
	crit_chance 		= 0.2,
	crit_damage 		= 0.5,
	damage_emp 			= 0,
	damage_kinetic 		= 144.1,
	damage_thermal 		= 0,
	dispersion 			= 0.14,
	dispersion_add 		= 0.400008,
	dispersion_max 		= 2.00004,
	dispersion_sub 		= 4.00008,
	fire_rate 			= 600,
	cycle_barrels 		= true,
	max_range 			= 320,
	optimal_range 		= 220,
	overheat_time 		= 1.5,
	projectile 			= "Projectile_KineticStkBomb",
	projectile_speed 	= 600,
	shot_effect 		= "particles/weapons/railgun/muzzle_destr",
	shot_once_sound 	= "sound/weapons/railgun/basic",
	weapon_class 		= ai.WeaponClass.RAILGUN,
	spell_on_hit		= "WeaponKineticStkBomb_SpellOnDeath",
	
	model = "models/weapons/kinetic_bomb/kinetic_bomb",
	default_custom_elements	= {
		[ai.VesselCustomSlot.MATERIAL_0]="weapons_kineticBomb_r1",
		[ai.VesselCustomSlot.MATERIAL_1]="weapons_kineticBomb_g1",
		[ai.VesselCustomSlot.MATERIAL_2]="weapons_kineticBomb_b1",
	},
	module_type 		= ai.ModuleType.WEAPON,
	muzzleflash_color = { kinetic = "230 164 120 128", emp = "230 164 120 128", thermal = "230 164 120 128", },
	muzzleflash_radius 	= 20,
}
Def.Projectile_KineticStkBomb =
{
	inherit					= "Projectile_Nail_Default",
	hit_effect				= "particles/weapons/railgun/hit",
	hit_ship_effect 		= "particles/weapons/railgun/hit_ship",
	hit_shield_effect 		= "particles/weapons/railgun/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/railgun/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/railgun/hit_crit_shield",
	effect 					= "particles/weapons/railgun/railgun_sticky_projectile",
	shadowCaster			= false,
	impact_type 			= "railgun",
}



Def.Weapon_HeraldPlasma = 
{
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 180,

	cycle_barrels 			= true,
	--Weapon_JerichoTrumpets_T3_Mk1

	--projectile_speed		= 350,  --  900
	dispersion				= 6,
--	dispersion_max			= 1,
--	dispersion_add			= 0.1285714,
--	dispersion_sub			= 0.72,
	optimal_range			= 200*0.75,
	max_range				= 200,
	damage_emp				= 150,
	crit_chance				= 0.2,
	crit_damage				= 0.5,
	-- heat_max				= 10,
	-- heat_add				= 5,
	-- heat_sub				= 15,
	overheat_time			= 0.3,
	
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	--projectile				= "Projectile_FlamePiece",
	shot_effect 			= "particles/weapons/plasma/muzzle_emp_explosion",
	-- spell_on_hit			= "FlameThrowerFire",
	projectile 				= "Projectile_HeraldPlasma",
	spell_on_hit 			= "HeraldPlasma",
	
	spell_on_hit_if_hacked	= false,
	projectile_speed		= 550,
	projectile_speed_add 	= 25,
	projectile_speed_sub 	= 100,
	projectile_speed_max 	= 650,	
	muzzleflash_color = { kinetic = "129 161 255 255", emp = "129 161 255 255", thermal = "129 161 255 255", },
	muzzleflash_radius 		= 20,
	shot_once_sound 		= "sound/weapons/FlameThrower/ft_fire",
	item_subtype			= ItemSubtype.HeraldPlasma,
}

Def.Projectile_HeraldPlasma = 
{
	class 					= "Projectile",
	effect 					= "particles/weapons/plasma/plasma_emp_explosion",
	hit_effect 				= "particles/weapons/plasma/hit",
	flare_size				= 0,

	hitbox_max 				= Vec3( 0.4, 0.4, 0.4 ),
	hitbox_min 				= Vec3( -0.4, -0.4, -0.4 ),
	impact_type 			= "plasma",
	in_editor 				= false,
	mass 					= 0.01,
	shadowCaster 			= false,
	-- damage_radius	= 1,
	model 					= "models/misc/invisible_model",
	--death_entity_on_static_hit = "Flame",
	inherit_speed 			= true,
}

Def.Projectile_Artillery_Mob_Sniper =
{
	inherit					= "Projectile_Artillery",
	explosion_blast_wave	= "GuidedMissileBlastWave_Mob_Sniper",
	override_blast_wave_damage = true,
	spell 					= "GuidedMissile_",
	
	detonation_radius		= 1,
	
}

Def.Weapon_MagneticGun = 
{
	inherit					= 'Weapon_AutoGun',
	fire_rate				= 22,

	cycle_barrels 			= true,
	--Weapon_JerichoTrumpets_T3_Mk1

	--projectile_speed		= 350,  --  900
	dispersion				= 0.333,
--	dispersion_max			= 1,
--	dispersion_add			= 0.1285714,
--	dispersion_sub			= 0.72,
	optimal_range			= 440*0.75,
	max_range				= 440,
	damage_thermal			= 150,
	crit_chance				= 0.2,
	crit_damage				= 0.5,
	heat_max				= 10,
	heat_add				= 2,
	heat_sub				= 12,
	overheat_time			= 0.3,
	guide_to_hit_target		= true,
	--angular_velocity		= 60,
	--is_guided 				= true,
	
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	--projectile				= "Projectile_FlamePiece",
	shot_effect 			= "particles/weapons/devostator_muzzle",
	-- spell_on_hit			= "FlameThrowerFire",
	projectile 				= "Projectile_MagneticGun",
	--projectile 				= "Projectile_MirvRocket1",
	--spell_on_hit 			= "HeraldPlasma",
	projectile_speed		= 350,
	--projectile_speed_add 	= 25,
	--projectile_speed_sub 	= 100,
	--projectile_speed_max 	= 350,	
	muzzleflash_color = { kinetic = "255 154 82 64", emp = "255 154 82 64", thermal = "255 154 82 64", },
	muzzleflash_radius 		= 20,
	shot_once_sound 		= "sound/weapons/FlameThrower/ft_fire",
	--item_subtype			= ItemSubtype.MagneticGun,
	no_friendly_fire		= true,
}

Def.Projectile_MagneticGun =  --надо переделать на красные прожектайлы
{ 
	inherit 					= "Weapon_BaseRocket",
	model = "",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	is_guided					= true,
	angular_velocity			= 46*0.85,
	random_trajectory 			= true,
	
	detonation_radius			= 4,
	
	explosion_blast_wave 		= "Blastwave_MagneticGun",
	--spell						= "ZoneCleaner",

	flare_color					= "255 255 191 150",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound					= "sound/weapons/smartRocket/smr_fly",
	effect 						= "particles/weapons/other/magnetic_projectile",
	impact_type 				= "rocket",
	inherit_speed				= true,
}


Def.Blastwave_MagneticGun  =
{
	class						= "BlastWave",
	in_editor					= false,

	--damage_kinetic				= 1,
	blast_maxDistance			= 5,
	apply_damage				= true,

	--effect 						= "particles/explosions/artillery_fire",
	--effect 						= "particles/weapons/plasma/plasma_compressor_hit",
	effect 				= "particles/explosions/devostrator_explosion",
	
	light_color 				= "255 126 128 100",
	light_radius 				= 18,
	light_time 					= 0.2,
	sound 						= "sound/explosion/SmartRocket_expl",
}

-----------------------------------------------------------------------------------------------------
Def.Weapon_SwarmCloud = 
{
	inherit 			= "Weapon_Base",
	class 				= "ChargableGun",
	model				= "models/weapons/rail_guns/econom/rg_training",

	fire_rate 			= 60,
	dispersion			= 0,
	
	optimal_range		= 450,
	max_range			= 450 * 1.3,
	
	projectile_speed 	= 140,
	
	no_friendly_fire 	= true,
	
	--damage			= 0,
	damage_kinetic		= 1000,
	--damage_emp			= 460, 
	--damage_thermal	= 0,
	
	heat_max 			= 100,
	heat_add 			= 10,
	heat_sub 			= 100,
	overheat_time		= 0,
	
	muzzleflash_color = { kinetic = "160 255 160 255", emp = "160 255 160 255", thermal = "160 255 160 255", },
	muzzleflash_radius 	= 10,

	charge_levels 		= { { time = 0, 	projectile = "Projectile_SwarmCloudPin", 	speed_mul = 10, damage_mul = -2, 	heat_add_mul = 3, ai_optimal=true, }, { time = 1, 	projectile = "Projectile_SwarmCloud", 		speed_mul = 0, damage_mul = 0, 		heat_add_mul = 0, force_prediction = true, }, },
	--explosion_mul 		= 1,

	--shot_once_sound = "sound/weapons/singularity/sg_shot",
	shot_beam_fx 		= "particles/weapons/big/swarm_beam",
	shot_effect 		= "particles/weapons/big/swarm_muzzle",
}
Def.Projectile_SwarmCloud =
{
	class				= "Rocket",

	hitbox_max			= Vec3( 0.1, 0.1, 1 ),
	hitbox_min			= Vec3( -0.1, -0.1, -1 ),

	explosion_blast_wave	= "Blastwave_SwarmCloudBlast",	
	override_blast_wave_damage = true,
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	disable_concussion_sound = true,

	shot_once_sound 		= "sound/weapons/BubbleGun/bg_shot_slow",
	
	detonation_radius		= 0.5,
	
	flare_color				= "55 50 250 0",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,

	spell_on_launch			= "Spell_SwarmCloud", --!!! дамаг всех вокруг
	spell					= "Spell_SwarmCloudHeal", --  лечение дружественного дочерних объектов
	hit_effect				= "particles/weapons/plasma/hit",
	work_sound 	    		= "sound/weapons/singularity/sg_fly",
	effect 					= "particles/weapons/big/swarm_projectile",
	
	kill_effect_on_remove 		= true, --???
}

Def.Projectile_SwarmCloudPin =
{
	inherit					= "Projectile_Plasma_Default",
	effect 					= "particles/weapons/big/swarm_projectile_fast",
	hit_effect				= "particles/weapons/big/swarm_projectile_fast_explosion",
	smooth_effect_param 	= true,

	hitbox_max				= Vec3(  3,  3,  2 ),
	hitbox_min				= Vec3( -3, -3, -2 ),

	shot_once_sound = "sound/weapons/BubbleGun/bg_shot_fast",
	
	shadowCaster			= false,
	impact_type 			= "railgun",
}

Def.Blastwave_SwarmCloudBlast =
{
	class					= "BlastWave",
	in_editor				= false,

	--damage_emp				= 100,
	blast_maxDistance		= 30,
	apply_damage			= true,
	apply_shake 			= false,

	effect 					= "particles/weapons/big/swarm_explosion",
	light_color 			= "192 255 192 255",
	light_radius 			= 150,
	light_time 				= 0.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}


-- #0101363: Эсминец: Пушка 1: плазма, с остаточным облаком PlasmaBursts
Def.Weapon_PlasmaBursts =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	fire_rate				= 90,
	cycle_barrels 			= true,
	no_friendly_fire		= true,
	override_blast_wave_damage = true,
	
	--ammo = 3,

	dispersion				= 1.0,
	dispersion_add			= -2,
	dispersion_max			= 0,
	dispersion_sub			= -5,
	
	optimal_range			= 330,
	max_range				= 400,
	projectile_speed		= 800,
	
	damage_emp				= 100,
	crit_chance				= 0.05,
	crit_damage				= 0.5,
	
	spell_on_hit			= "Spell_PlasmaBursts",
	
	heat_max				= 10,
	heat_add				= 7.5,
	heat_sub				= 20,
	overheat_time			= 0.5,
	
	module_type				= ai.ModuleType.WEAPON,
	projectile				= "Projectile_PlasmaBursts",
	shot_effect 			= "particles/weapons/plasma/muzzle_bursts",
	muzzleflash_color = { kinetic = "172 152 231 100", emp = "172 152 231 100", thermal = "172 152 231 100", },
	muzzleflash_radius 		= 10,
	shot_once_sound 	= "sound/weapons/plasmagun/PlasmaBursts",
}


Def.Projectile_PlasmaBursts =
{
	class			= "Projectile",
	
	hitbox_min 		= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max		= Vec3( 0.1, 0.1, 0.1 ),
	
	effect 			= "particles/weapons/plasma/plasma_bursts_projectile",
	hit_effect		= "particles/weapons/plasma/plasma_bursts_hit",
	
	--damage_to_spell_aura_param = true,
	
	flare_color				= "42 255 72 45",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,

	impact_type		= "plasma_cloud", -- #0101363 #0107026
}

Def.Weapon_ChargedBlast =  
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
			heat_add_mul = 1.5,
			--force_prediction = true,
		},
		{
			time = 3,
			projectile = "Projectile_ChargedBlast_Big",
			speed_mul = 2.2,
			damage_mul = 2,
			heat_add_mul = 2.5,
			force_charge_crosshair_max = true,
			ai_optimal=true,
		},
		{
			time = 4,
			projectile = "Projectile_ChargedBlast_Self",
			speed_mul = -100,
			damage_mul = 2.5,
			heat_add_mul = 6,
		},
	},

	shot_beam_fx 		= "particles/weapons/chargedblast_beam",
	shot_effect 		= "particles/weapons/chargedblast_muzzle",
	charge_effect 		= "particles/weapons/chargedblast_guncharge",
	muzzleflash_color = { kinetic = "250 170 150 128", emp = "250 170 150 128", thermal = "250 170 150 128", },
	muzzleflash_radius 	= 32,
}

Def.Projectile_ChargedBlast_Big =
{
	class						= "Rocket",

	explosion_blast_wave		= "Blastwave_ChargedBlast_Big",	
	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	disable_concussion_sound	= true,

	shot_once_sound 			= "sound/weapons/chargeblast/cb_fire",
	
	detonation_radius			= 8,
	
	flare_color					= "255 255 191 150",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound 	    			= "sound/weapons/chargeblast/cb_fly",
	effect 						= "particles/weapons/chargedblast_projectile",
	impact_type 				= "rocket",
}

Def.Blastwave_ChargedBlast_Big =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 20,
	apply_damage				= true,
	apply_shake 				= true,
	
	self_damage_coef			= 0,

	effect 						= "particles/weapons/chargedblast_hit",
	light_color 				= "250 150 150 255",
	light_radius 				= 35,
	light_time 					= 0.4,
	sound 						= "sound/explosion/SmartRocket_expl",
}

Def.Projectile_ChargedBlast_Self =
{
	class						= "Rocket",

	explosion_blast_wave		= "Blastwave_ChargedBlast_Self",	
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,
	missile_detection_immune	= true,
	disable_concussion_sound 	= true,
	
	time_to_live				= 0,
}

Def.Blastwave_ChargedBlast_Self =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_minDistance			= 30,
	blast_maxDistance			= 100,
	intensity					= 400,

	apply_damage				= true,
	apply_shake 				= true,
	apply_torque				= true,
	
	self_damage_coef			= 0,
	
	effect 						= "particles/weapons/chargedblast_explosion",
	light_color 				= "250 150 150 255",
	light_radius 				= 35,
	light_time 					= 0.4,
	sound 						= "sound/explosion/cb_self_expl",
}

Def.Weapon_Railgun_st =
{
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	price					= 1,
	tier					= 4,	
	item_lvl				= 25,
	
	rank_min				= 1,
	rank_max				= 17,
	
	fire_rate				= 60,
	projectile_speed		= 500,
	dispersion				= 0,
	optimal_range			= 500,
	max_range				= 500,
	damage_kinetic			= 1000,
	crit_chance				= 0,
	crit_damage				= 1,
	heat_max				= 10,
	heat_add				= 0.5,
	heat_sub				= 10,
	overheat_time			= 0,
	
	inherit					= "Weapon_AutoGun",
	model					= "models/weapons/assault_railgun/assault1",
	default_icon			= "ItemSubtype_RailgunBasic_1",

	item_subtype			= ItemSubtype.WeaponSt,
	module_type				= ai.ModuleType.WEAPON,

	weapon_class			= ai.WeaponClass.RAILGUN,
	projectile				= "Projectile_Nail_Iron",
	default_custom_elements =
	{
		[ai.VesselCustomSlot.MATERIAL_0]	= "weapons_assault_r1",
		[ai.VesselCustomSlot.MATERIAL_1]	= "weapons_assault_g1",
		[ai.VesselCustomSlot.MATERIAL_2]	= "weapons_assault_b1",
	},
}

Def.Weapon_Nanobots_Heal_Bonus =
{
	inherit 								= "Weapon_Base",
	class 									= "AutoGun",

	cycle_barrels 							= true,
	
	fire_rate								= 90,
	dispersion								= 0, 

	max_range								= 250,
	projectile_speed 						= 475,
	
	crit_chance								= 0.25,
	crit_damage								= 0.3,
	
	damage_kinetic							= 1000,
	no_friendly_fire 						= true,
	
	heat_max 								= 15,
	heat_add 								= 6.5,
	heat_sub 								= 5,
	overheat_time 							= 1,

	projectile								= "Projectile_Nanobots_Heal_Bonus",
	
	model									= "models/weapons/rail_guns/econom/rg_training",

	shot_once_sound							= "sound/weapons/NanobotGun/nb_hb_shot",
	muzzleflash_color = { kinetic = "255 225 135 20", emp = "255 225 135 20", thermal = "255 225 135 20", },
}

Def.Projectile_Nanobots_Heal_Bonus =
{
	inherit									= "Weapon_BaseRocket",
	model 									= "",
	explosion_blast_wave 					= "Blastwave_Nanobots_Heal_Bonus",
	override_blast_wave_damage				= true,
	
	detonation_radius						= 9.5,
	
	flare_color								= "255 225 135 20",
	flare_size								= 0.3,
	flare_angle								= 180,
	flare_nebulosity						= 0.1,
	effect 									= "particles/weapons/nanobots_trail_kinetic",
	
	missile_defence_immune 					= true,
	missile_detection_immune 				= true,
	
	disable_concussion_sound				= true,
	
	child_rockets =
	{
		rocket								= "Projectile_Nanobots_Heal_Bonus_Back",
		echo_radius							= 25,
		spawn_on_crit_only					= true,
		echo_rocket_if_reflected			= false,
	},
}

Def.Projectile_Nanobots_Heal_Bonus_Back =
{
	inherit									= "Weapon_BaseRocket",
	model 									= "",
	explosion_blast_wave 					= "Blastwave_Nanobots_Heal_Bonus",
	override_blast_wave_damage				= false,
	
	max_range								= 20,  
	speed 									= 20,
	
	flare_color								= "255 225 135 20",
	flare_size								= 0.3,
	flare_angle								= 180,
	flare_nebulosity						= 0.1,
	effect 									= "particles/weapons/nanobots_trail_kinetic",	
	
	missile_defence_immune 					= true,
	missile_detection_immune 				= true,
	
	disable_concussion_sound				= true,
	
	death_entity							= "Bonus_Nanobots_Heal_Bonus",
	owned_death_entity_max					= 5,
}

Def.Blastwave_Nanobots_Heal_Bonus  =
{
	class									= "BlastWave",
	in_editor								= false,

	blast_maxDistance						= 12,
	apply_damage							= true,
	apply_shake 							= true,

	effect 									= "particles/explosions/nanobots_fire_kinetic",
	light_color 							= "143 129 87 255",
	light_radius 							= 15,
	light_time 								= 0.2,
	sound 									= "sound/explosion/nanobot_expl",
}

Def.Bonus_Nanobots_Heal_Bonus = 
{
	class 									= "ScBaseEntity",
	in_editor								= true,
	hudType									= "default",
	hud_visibility_type						= "minor",
	
	model									= "models/objects/gameplay/bonuses/bonus_repair/bonus_repair",

    max_detection_distance					= 500.0,
	vision_radius_coef						= 0.5,
	
	spell_approach							= "Nanobots_Heal_Bonus",
	spell_approach_trigger_radius			= 40.0,
	only_for_friends						= true,
	spell_approach_respawn_timer			= 0,
	
	ttl										= 15,
	
	use_team_skin = true,

	death_effect							= "particles/ships/looted",
	spell_approach_trigger_sound			= "sound/game/bonus_take",
	children = 
	{
		{ effect = { s1 = "particles/objects/bonuses/nanobots_bonus", s2 = "particles/null", default = "particles/null" }, joint = "main" },
		{ effect = { s1 = "particles/objects/bonuses/armor_restore_exp", s2 = "particles/null", default = "particles/null" }, joint = "root" },
	}
}

Def.Weapon_ShieldHeal =
{
	inherit 								= "Weapon_Base",
	class 									= "AutoGun",
	fire_rate								= 90,
	cycle_barrels 							= true,
	override_blast_wave_damage				= true,
	
	optimal_range							= 330,
	max_range								= 400,
	projectile_speed						= 800,
	
	damage_emp								= 100,
	crit_chance								= 0.05,
	crit_damage								= 0.5,
	
	spell_on_hit							= "Spell_ShieldEnergyHeal",
	
	heat_max								= 10,
	heat_add								= 7.5,
	heat_sub								= 20,
	overheat_time							= 0.5,
	
	model									= "models/weapons/shield_heal/shield_heal",
	projectile								= "Projectile_ShieldHeal",
	
	module_type								= ai.ModuleType.WEAPON,
	
	shot_effect 							= "particles/weapons/plasma/muzzle_reflector",
	muzzleflash_color						= { kinetic = "172 152 231 100", emp = "172 152 231 100", thermal = "172 152 231 100", },
	muzzleflash_radius 						= 3,
	shot_once_sound 						= "sound/weapons/plasmagun/ShieldHeal",
	
	friendly_fire							= true,
	no_friendly_fire						= true,
}

Def.Weapon_DoubleThermalShotgun =
{
	inherit 								= "Weapon_AutoGun",
	
	fire_rate								= 60,
	is_shotgun								= true,
	
	optimal_range							= 130,
	max_range								= 175,
	projectile_speed						= 460,
	
	dispersion								= 1.5,
	dispersion_max							= 4.2,
	dispersion_add							= 2, 
	dispersion_sub							= 2, 
	
	damage_thermal							= 868,
	crit_chance								= 0.07,
	crit_damage								= 0.5,
	
	charge_min								= 1,
	charge_max								= 2,
	damage_charge_deminishing				= 2,
	
	heat_max								= 10,
	heat_add								= 1.5,
	heat_sub								= 5,
	overheat_time							= 1.5,
	heat_overcharge							= true,

	model									= "models/weapons/irbis_gun/irbis_gun",
	projectile								= "Projectile_DoubleThermalShotgun",
	
	module_type								= ai.ModuleType.WEAPON,
	shot_effect 							= "particles/weapons/blaster/neutron_muzzle",
	charge_effect 							= "particles/weapons/blaster/doublethermal_charge",
	muzzleflash_color						= { thermal = "255 100 100 255", },
	muzzleflash_radius 						= 6,
	shot_once_sound 						= "sound/weapons/DoubleThermalShotgun/dts_shot",
	shot_loop_sound 						= "sound/weapons/RavenGun/rg_charge",
}

Def.Projectile_DoubleThermalShotgun =
{
	inherit									= "Projectile_Neutron",
	spell_on_crit	 						= "Spell_DoubleThermalShotgun",
}

Def.Weapon_DoubleThermalBlastGun =
{
	inherit 								= "Weapon_AutoGun",
	
	--cycle_barrels 							= true,

	override_blast_wave_damage				= true,
	
	fire_rate								= 25,
	
	optimal_range							= 85,
	max_range								= 150,
	projectile_speed						= 460,
	
	dispersion								= 4.5,
	dispersion_max							= 4.5,
	
	damage_thermal							= 1500,
	crit_chance								= 0.07,
	crit_damage								= 0.5,
	
	heat_max								= 10,
	heat_add								= 3,
	heat_sub								= 5,
	overheat_time							= 1.5,
	
	model									= "models/weapons/double_termal_shotgun/double_termal_shotgun",
	projectile								= "Projectile_BlastGun",
	
	module_type								= ai.ModuleType.WEAPON,
	
	shot_effect 							= "particles/weapons/blaster/neutron_muzzle",
	muzzleflash_color						= { thermal = "255 100 100 128", },
	muzzleflash_radius 						= 6,
	shot_once_sound 						= "sound/weapons/ThermalBlastGun/tbg_shot",
}

Def.Projectile_Artillery_Pirate =
{
	inherit					= "Projectile_Artillery",
	detonate_on_distance	= 6,
}

Def.Weapon_TornadoGun = 
{
	inherit					= 'Weapon_AutoGun',
	
	fire_rate				= 195,

	projectile_speed		= 450,
	
	dispersion				= 0.5,
	dispersion_max			= 1.8,
	dispersion_add			= -1,
	dispersion_sub			= -4,
	
	optimal_range			= 200,
	max_range				= 265,
	
	damage_emp				= 150,
	
	crit_chance				= 0.2,
	crit_damage				= 0.75,
	
	heat_max				= 10,
	heat_add				= 1.43,
	heat_sub				= 5,
	
	overheat_time			= 3,
	
	model					= "models/weapons/tornado_gun/tornado_gun",
	shot_effect 			= "particles/weapons/plasma/muzzle_emp_explosion",
	projectile 				= "Projectile_PlasmaBursts",
	
	muzzleflash_color		= { kinetic = "129 161 255 255", emp = "129 161 255 255", thermal = "129 161 255 255", },
	muzzleflash_radius 		= 20,
	shot_once_sound 		= "sound/weapons/FlameThrower/ft_fire",
	
	item_subtype			= ItemSubtype.TornadoGun,
	
	spell_on_hit 			= "Spell_TornadoGun",
	spell_on_hit_if_hacked	= false,
}

Def.Weapon_RavenGun =  
{
	inherit 				= "Weapon_Base",
	class 					= "ChargableGun",
	model					= "models/weapons/raven_gun/raven_gun",

	fire_rate 				= 60,
	dispersion				= 0,
	
	optimal_range			= 450,
	max_range				= 450 * 1.3,
	
	projectile_speed 		= 250,
	damage_emp				= 450,
	
	shot_loop_sound 		= "sound/weapons/RavenGun/rg_charge",


	heat_max 				= 100,
	heat_add 				= 10,
	heat_sub 				= 25,
	overheat_time			= 5,
	
	use_charge_crosshair	= true,

	charge_levels = {
		{
			time = 0,
			projectile = "Projectile_RavenGun_Big",
			speed_mul = 0,
			damage_mul = 0,
			heat_add_mul = 0,
		},
		{
			time = 2,
			projectile = "Projectile_RavenGun",
			speed_mul = 0,
			damage_mul = 3.7,
			heat_add_mul = 1.4,
			force_charge_crosshair_max = true,
			ai_optimal=true,
		},
		{
			time = 6,
			projectile = "Projectile_RavenGun",
			speed_mul = 0,
			damage_mul = 3.7,
			heat_add_mul = 1.4,
		},
	},

	shot_beam_fx 		= "particles/weapons/other/ravengun_beam",
	charge_effect 		= "particles/weapons/other/ravengun_charge",
	muzzleflash_color = { kinetic = "250 170 150 128", emp = "250 170 150 128", thermal = "250 170 150 128", },
	muzzleflash_radius 	= 32,
}


Def.Projectile_RavenGun = -- маленький и долго заряжается, но сильный
{
	class						= "Rocket",

	explosion_blast_wave		= "Blastwave_RavenGun",	
	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	disable_concussion_sound	= true,

	shot_once_sound 			= "sound/weapons/RavenGun/rg_shot_slow",
	
	detonation_radius			= 6,
	
	flare_color					= "255 255 191 150",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound 	    			= "sound/weapons/chargeblast/cb_fly",
	effect 						= "particles/weapons/other/ravengun_projectile1",
	impact_type 				= "rocket",
}

Def.Projectile_RavenGun_Big = -- большой, но рассеянный и слабый
{
	class						= "Rocket",

	explosion_blast_wave		= "Blastwave_RavenGun_Big",	
	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	disable_concussion_sound	= true,

	shot_once_sound 			= "sound/weapons/RavenGun/rg_shot_fast",
	
	detonation_radius			= 12,
	
	flare_color					= "255 255 191 150",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound 	    			= "sound/weapons/chargeblast/cb_fly",
	effect 						= "particles/weapons/other/ravengun_projectile2",
	impact_type 				= "rocket",
}

Def.Blastwave_RavenGun =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 20,
	apply_damage				= true,
	apply_shake 				= true,
	
	self_damage_coef			= 0,

	effect 						= "particles/weapons/other/ravengun_explosion1",
	light_color 				= "128 200 255 255",
	light_radius 				= 18,
	light_time 					= 0.35,
	sound 						= "sound/explosion/SmartRocket_expl",
}

Def.Blastwave_RavenGun_Big =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 35,
	apply_damage				= true,
	apply_shake 				= true,
	
	self_damage_coef			= 0,

	effect 						= "particles/weapons/other/ravengun_explosion2",
	light_color 				= "128 200 255 255",
	light_radius 				= 40,
	light_time 					= 0.4,
	sound 						= "sound/explosion/SmartRocket_expl",
}


Def.Weapon_RelicGun =  
{
	inherit 				= "Weapon_AutoGun",
	model					= "models/weapons/relic_gun/relic_gun",
		
	item_subtype							= ItemSubtype.RelicGun,

	fire_rate 				= 80,
	dispersion				= 0.1,
	
	projectile_speed 		= 800,
	damage_kinetic			= 500,
	
	shot_loop_sound 		= "sound/weapons/RelicGun/rg_charge",
	shot_once_sound 		= "sound/weapons/RelicGun/rg_shot",

	heat_max 				= 100,
	heat_add 				= 10,
	heat_sub 				= 25,
	overheat_time			= 4,
	
	max_range				= 400,
	max_range_max			= 600,
	max_range_add 			= 100,
	
	optimal_range			= 400,
	optimal_range_max		= 600,
	optimal_range_add 		= 100,
	
	charge_max				= 3,
	heat_overcharge			= true,
	damage_charge_deminishing = 0,
	projectile 				= "Projectile_RelicGun",
	shot_effect 			= "particles/weapons/railgun/muzzle_relic",
	charge_effect 			= "particles/weapons/railgun/charge_relic",
	muzzleflash_color 		= { kinetic = "255 220 150 128", emp = "255 220 150 128", thermal = "255 220 150 128", },
	muzzleflash_radius 		= 15,
}

Def.Projectile_RelicGun =
{
	inherit				= "Projectile_Nail_Iron_Heavy",
	effect         	    = "particles/weapons/railgun/railgun_relic_projectile",
	hit_effect		= "particles/weapons/railgun/hit",
	distance_damage_coef_min = 0.5,
	distance_damage_coef_max = 2.0,
	distance_damage_dist_min = 250,
	distance_damage_dist_max = 1100,
}

Def.Weapon_DoubleEmpShotgun =
{
	inherit 								= "Weapon_AutoGun",
	
	fire_rate								= 60,
	is_shotgun								= true,
	
	optimal_range							= 130,
	max_range								= 175,
	projectile_speed						= 460,
	
	dispersion								= 3.5,
	dispersion_max							= 1.5,
	dispersion_add							= -2, 
	dispersion_sub							= -2, 
	
	damage_emp								= 868,
	crit_chance								= 0.1,
	crit_damage								= 0.5,
	
	charge_min								= 1,
	charge_max								= 3,
	damage_charge_deminishing				= 0.8,
	
	heat_max								= 10,
	heat_add								= 1.5,
	heat_sub								= 5,
	overheat_time							= 1.5,
	
	model									= "models/weapons/double_termal_shotgun/double_frigid_shotgun",
	projectile								= "Projectile_DoubleEmpShotgun",
	
	module_type								= ai.ModuleType.WEAPON,
	
	shot_effect 							= "particles/weapons/special/ice_muzzle",
	muzzleflash_color						= { thermal = "255 100 100 128", },
	muzzleflash_radius 						= 6,
	shot_once_sound 						= "sound/weapons/DoubleEmpShotgun/des_shot",
	item_subtype							= ItemSubtype.DoubleEmpShotgun,
}

Def.Projectile_DoubleEmpShotgun =
{
	inherit				= "Projectile_Plasma_Default",
	spell_on_crit	 	= "Spell_DoubleEmpShotgun",
	effect 				= "particles/weapons/special/ice_projectile",
	hit_effect			= "particles/weapons/special/ice_hit",
	impact_type 			= "Ice_hit",
}

Def.Weapon_MoleGun =
{
	inherit = "Weapon_LaserGun",
	model = "models/weapons/mole_gun/mole_gun",
	fire_rate = 60,
	
	impulse_time = 1,
	dispersion = 0,
	shot_loop_sound = "sound/weapons/MoleGun/mg_shot_loop",
	impact_type = "laser",
	hit_loop_sound 	= "sound/hit/laser_loop",
	
	asteroid_overheat_time_coef = 0.29, --0.435, --коэфицент возрастания перегрева астероида
	
	optimal_range = 120,
	max_range = 160,
	
	damage_thermal = 300,
	
	heat_max = 10,
	heat_add = 1,
	heat_sub = 5,
	overheat_time = 2,
	
	module_type = ai.ModuleType.WEAPON,
	weapon_class = ai.WeaponClass.LASER,
	
	fire_fx = "particles/weapons/laser/muzzle_mining",
	beam_fx = "particles/weapons/laser/laser_mining_beam",
	hit_fx = "particles/weapons/laser/hit_mining",
	item_subtype = ItemSubtype.MoleGun,
	play_hit_fx_on_miss = false,
	hit_fx_offset = -0.5,
	muzzleflash_color = { kinetic = "255 171 87 255", emp = "255 171 87 255", thermal = "255 171 87 255", },
	light_radius 			= 30,
	light_time 				= 1.0
}

Def.Weapon_OmegaB = {	
	inherit 		= "Weapon_Base",
	class 			= "AutoGun",
	item_subtype	= ItemSubtype.OmegaB,
	model = "models/weapons/missile_launcher/missile_launcher",

	heat_max 			= 10,
	heat_add 			= 2,
	heat_sub 			= 3,
	fire_rate 			= 45, 	
	optimal_range		= 370,
	max_range			= 370,	
	dispersion			= 2,
	
	projectile 			= "Projectile_OmegaB",
	shot_once_sound 	= "sound/weapons/rockets/OmegaB_launch",
	projectile_speed	= 66,	--130
	
	damage_kinetic		= 700,  -- 
	no_friendly_fire 	= true,
	
	shot_effect 		= "particles/weapons/devostator_muzzle",
	muzzleflash_color = { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 	= 8,
}
Def.Projectile_OmegaB =
{
	inherit 					= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo_small",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	is_guided					= true,
	--speed 						= 66,
	angular_velocity			= 20,
	
	detonation_radius			= 1,

	detonate_on_distance= 40,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.
	child_rockets =
	{
		rocket = "Projectile_OmegaB1",
		-- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
		sphere_radius = 1, -- опционально
		-- Общее количество ракет не должно превышать 20
		scheme = {
			circle0 = { amount = 1, angle = 0, },
		},
		-- --описание целей для управляемых ракет. Поддерживается не более 10 целей
		direct_to_target = {
			target 			= ai.SpellTargetGeneral.LOCKED_TARGET,
			class 			= ai.SpellTargetClass.SHIP + ai.SpellTargetClass.VITALPOINT_TURRET + ai.SpellTargetClass.TURRET + ai.SpellTargetClass.CARGOSHIP + ai.SpellTargetClass.OWNED_BY_SHIP + ai.SpellTargetClass.SC_BASE_ENTITY + ai.SpellTargetClass.GUIDED_DRONE,
			area 			= ai.SpellTargetArea.AROUND,
			relationship 	= ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.NOT_CLOAKED + ai.SpellTargetMisc.EXCLUDE_CASTER,
		},
		direct_range = 50, -- радиус поиска целей для управляемых ракет
		max_rockets_per_target = 1, -- количество управляемых ракет на одну цель
	},
	
	explosion_blast_wave_on_hit	= "Blastwave_OmegaB",
	override_blast_wave_damage = true,
	missile_defence_immune = true,	
	missile_detection_immune = true,

	flare_size			= 0.0,
	flare_color			= "255 170 191 0",

--	work_sound			= "",
	rocket_direct_hit_sound = "sound/hit/rocket_direct_hit",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "rocket",
}
Def.Projectile_OmegaB1 =
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_OmegaB",
	model				= "models/weapons/bs_torpedo_small",
	override_blast_wave_damage = true,
	missile_defence_immune = true,	
	missile_detection_immune = true,
	is_guided 			= true,
	detonation_radius	= 1,  
	max_range			= 100,
	angular_velocity 	= 190,
	
	flare_color			= "255 170 191 0",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/rockets/rocket_fly",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "rocket",
}
Def.Blastwave_OmegaB  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 100,
	blast_maxDistance		= 7,
	apply_damage			= true,
	apply_shake 			= false,

	effect 					= "particles/explosions/artillery_fire",
	light_color 			= "255 226 178 100",
	light_radius 			= 18,
	light_time 				= 0.2,
	sound 					= "sound/explosion/omegaB_expl",
}


Def.Weapon_ProtozanBlaster =  
{
	inherit 				= "Weapon_Base",
	class 					= "ChargableGun",
	model					= "models/weapons/protazan_gun/protazan_gun",
	item_subtype			= ItemSubtype.ProtozanBlaster,
	
	fire_rate 				= 150,
	dispersion				= 0.3,
	
	optimal_range			= 390,
	max_range				= 420,
	
	projectile_speed 		= 800,
	damage_thermal			= 200,
	
	shot_loop_sound 		= "sound/weapons/ProtozanBlaster/pb_charge",
	crit_chance				= 0.05,
	heat_max 				= 10,
	heat_add 				= 3,
	heat_sub 				= 2,
	overheat_time			= 5,
	
	use_charge_crosshair	= true,
	
	charge_levels = {
		{
			time = 0,
			projectile = "Projectile_ProtozanBlaster",
			speed_mul = 0,
			damage_mul = 0,
			heat_add_mul = 0,
		},
		{
			time = 6,
			projectile = "Projectile_ProtozanBlaster_Charged",
			speed_mul = 0,
			damage_mul = 5,
			heat_add_mul = 1,
			force_charge_crosshair_max = true,
			ai_optimal = true, --оптимальный уровень зарядки под воздействием ауры HACKED_WEAPON 
		},
		{
			time = 12,
			projectile = "Projectile_ProtozanBlaster_Charged",
			speed_mul = 0,
			damage_mul = 5,
			heat_add_mul = 1,
		},
	},

	shot_beam_fx 		= "particles/weapons/other/proto_beam",
	charge_effect 		= "particles/weapons/other/proto_charge",
	muzzleflash_color = { kinetic = "250 170 150 128", emp = "250 170 150 128", thermal = "250 170 150 128", },
	muzzleflash_radius 	= 32,
}
Def.Projectile_ProtozanBlaster = -- большой, но рассеянный и слабый
{
	class						= "Rocket",

	explosion_blast_wave		= "Blastwave_ProtozanBlaster",	
	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	disable_concussion_sound	= true,

	shot_once_sound 			= "sound/weapons/ProtozanBlaster/pb_uncharged_shot",
	
	detonation_radius			= 9,
	
	flare_color					= "255 255 191 0",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound 	    			= "sound/weapons/chargeblast/cb_fly",
	effect 						= "particles/weapons/other/proto_projectile",
	impact_type 				= "rocket",
}
Def.Blastwave_ProtozanBlaster =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 10,
	apply_damage				= true,
	apply_shake 				= true,
	
	self_damage_coef			= 0,

	effect 						= "particles/weapons/other/proto_explosion",
	light_color 				= "128 200 255 255",
	light_radius 				= 40,
	light_time 					= 0.4,
	sound 						= "sound/explosion/SmartRocket_expl",
}
Def.Projectile_ProtozanBlaster_Charged =
{
	class						= "Rocket",

	explosion_blast_wave		= "Blastwave_ProtozanBlaster_Charged",	
	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	disable_concussion_sound	= true,

	shot_once_sound 			= "sound/weapons/ProtozanBlaster/pb_charged_shot",
	
	detonation_radius			= 3,
	
	flare_color					= "255 255 191 0",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,
	spell 						= "ProtozanBlaster_TermResDec",
	
	model 				= "",
	effect 				= "particles/weapons/other/proto_projectile2",
	hit_effect			= "particles/weapons/other/proto_explosion2",
	
	--work_sound 	    			= "sound/weapons/chargeblast/cb_fly",
	--effect 						= "particles/weapons/other/ravengun_projectile2",
	impact_type = "rocket",
}
Def.Blastwave_ProtozanBlaster_Charged =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 15,
	--apply_damage				= true,
	--apply_shake 				= true,
	
	self_damage_coef			= 0,
	-- effect 						= "particles/weapons/other/ravengun_explosion2",
	light_color 				= "128 200 255 255",
	light_radius 				= 40,
	light_time 					= 0.2,
	-- sound 						= "sound/explosion/SmartRocket_expl",
}

Def.Weapon_Gleipnir =
{
	inherit					= "Weapon_AutoGun",
	model					= "models/weapons/naglfar_gun/naglfar_gun",
	--default_icon			= "ItemSubtype_RailgunBasic_1",
	
	fire_rate				= 350,
	projectile_speed		= 800,
	damage_kinetic			= 150,

	shot_once_sound 		= "sound/weapons/Gleipnir/Gleipnir_shot",
	
	dispersion		= 0.5,
	dispersion_max	= 1.5, 
	dispersion_add	= 0.1, 
	dispersion_sub	= 0.5, 
	
	optimal_range			= 340,
	max_range				= 440,	
	
	crit_chance				= 0.1,
	crit_damage				= 0.5,
	
	heat_max				= 10,
	heat_add				= 0.8,
	heat_sub				= 4,
	overheat_time			= 3,
	
	item_subtype			= ItemSubtype.Gleipnir,
	module_type				= ai.ModuleType.WEAPON,
	
	spell_on_hit			= "Gleipnir_DeathHand",
	spell_on_hit_if_hacked	= false,

	weapon_class			= ai.WeaponClass.RAILGUN,
	projectile				= "Projectile_Gleipnir",
	default_custom_elements =
	{
		[ai.VesselCustomSlot.MATERIAL_0]	= "weapons_assault_r1",
		[ai.VesselCustomSlot.MATERIAL_1]	= "weapons_assault_g1",
		[ai.VesselCustomSlot.MATERIAL_2]	= "weapons_assault_b1",
	},
	shot_effect 		= "particles/weapons/other/gleipnir_muzzle",
	muzzleflash_color = { kinetic = "201 255 128 100", emp = "201 255 128 100", thermal = "201 255 128 100", },
	muzzleflash_radius 	= 8,
}

Def.Projectile_Gleipnir =
{
	inherit			= "Projectile_Nail_Default",
	hit_effect		= "particles/weapons/other/gleipnir_hit",
	effect			= "particles/weapons/other/gleipnir_projectile",
	shadowCaster	= false,
    impact_type 	= "railgun",
}

Def.Weapon_PlasmaWebLaser =
{
	class 					= "LaserGunRay",
	--class 					= "LaserGun",
	fire_rate				= 60,
	impulse_time			= 1,
	dispersion				= 0,
	dispersion_max			= 0,
	optimal_range			= 200,
	max_range				= 250,
	damage_emp				= 100,
	crit_chance				= 0.05,
	crit_damage				= 1,
	heat_max				= 10,
	heat_add				= 3,
	heat_sub				= 6.66,
	overheat_time			= 1,
	model					= "models/weapons/albiero_gun/albiero_gun",
	module_type				= ai.ModuleType.WEAPON,
	item_subtype			= ItemSubtype.PlasmaWebLaser,
	focus_distance			= 20,  -- фокус одного луча
	
	muzzleflash_radius 		= 10,
	damage_color = { kinetic = "255 213 128 255", emp = "52 80 224 255", thermal = "143 239 143 255", },
	muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "127 255 127 255", },
	
	beam_start_fx			= "particles/weapons/laser/laser_pw_beam",
	focus_fx 				= "particles/weapons/laser/laser_pw_focus",
	beam_fx 				= "particles/weapons/laser/laser_pw_beam_main",
	fire_fx 				= "particles/weapons/laser/muzzle_pwlaser",	
	hit_fx					= "particles/weapons/laser/hit",
	
	shot_loop_sound 		= "sound/weapons/laser/PlasmaWebLaser",
	impact_type 			= "laser",
	
	spell_on_hit				= "Spell_PlasmaWebLaser",
	spell_on_hit_streak_time	= 0.5, --0.5
	spell_on_hit_streak_time_fake	= 0.3,
	
	damage_radius			= 0.5, --0.5
	damage_radius_fake		= 1,
}

Def.Weapon_Hammer =
{
	inherit					= "Weapon_AutoGun",
	model					= "models/weapons/gauss_cannon/gauss_cannon_m3",
	cycle_barrels			= true,
	
	fire_rate				= 35,
	projectile_speed		= 700,
	damage_thermal			= 250,

	shot_once_sound 		= "sound/weapons/Hammer/Hammer_shot",
	
	dispersion				= 0.5,
	dispersion_max			= 1.5, 
	dispersion_add			= 0.1, 
	dispersion_sub			= 0.5, 
	
	optimal_range			= 340,
	max_range				= 440,	
	
	crit_chance				= 0.05,
	crit_damage				= 0.2,
	
	heat_max				= 10,
	heat_add				= 0.8,
	heat_sub				= 4,
	overheat_time			= 3,
	
	item_subtype			= ItemSubtype.Hammer,
	module_type				= ai.ModuleType.WEAPON,

	weapon_class			= ai.WeaponClass.LASER,
	projectile				= "Projectile_Hammer",
	default_custom_elements =
	{
		[ai.VesselCustomSlot.MATERIAL_0]	= "weapons_assault_r1",
		[ai.VesselCustomSlot.MATERIAL_1]	= "weapons_assault_g1",
		[ai.VesselCustomSlot.MATERIAL_2]	= "weapons_assault_b1",
	},
	shot_effect 		= "particles/weapons/other/hammer_muzzle",
	muzzleflash_color	= { kinetic = "255 176 128 100", emp = "255 176 128 100", thermal = "255 176 128 100", },
	muzzleflash_radius 	= 8,
}

----------------------------------------------------
Def.Weapon_ThorHammer =
{
	class 				= "SmartRocketLauncher",
	model				= "models/weapons/thor_gun/thor_gun",
	cycle_barrels		= true,
	
	fire_rate 			= 15,
	projectile_speed	= 100,	
	damage_kinetic		= 2310,
	
	optimal_range		= 400,
	max_range			= 500,
	
	heat_max 			= 10,
	heat_add 			= 7.5,
	heat_sub 			= 5,
	
	projectile 			= "Projectile_ThorHammer",
	shot_once_sound 	= "sound/weapons/ThorHammer/th_launch",
	
	no_friendly_fire 	= true,
	kill_rockets_if_no_fire = false,

	targeting_beam_fx	= "particles/weapons/machete_laser",
	beam_bone 			= "rocket_1",
	
	shot_effect			= "particles/weapons/special/hammer_muzzle",	
	muzzleflash_color	= { kinetic = "130 130 250 128", emp = "130 130 250 128", thermal = "130 130 250 128", },
	muzzleflash_radius	= 8,
}


Def.Weapon_SmartShotgun =
{
	class 					= "AutoGun",
	model					= "models/weapons/shrapnel_cannon/shrapnel_cannon_mod3",
	
	fire_rate 				= 60,
	projectile_speed		= 460,	
	damage_kinetic			= 750,
	
	crit_chance				= 0.05,
	crit_damage				= 0.5,
	
	dispersion 				= 10,
	target_dispersion_coef	= 0.08,
	
	optimal_range			= 150,
	max_range				= 200,
	
	heat_max 				= 10,
	heat_add 				= 0.5,
	heat_sub 				= 5,
	
	is_shotgun				= true,
	no_friendly_fire 		= true,
	target_shot_cone_angle	= 10,
	max_pellets_per_target	= 4,
	
	muzzleflash_color		= { kinetic = "120 210 255 255", emp = "120 210 255 255", thermal = "120 210 255 255", },
	muzzleflash_radius 		= 20,
	
	shot_effect 			= "particles/weapons/railgun/muzzle_destr",
	shot_once_sound			= "sound/weapons/SmartShotgun/ss_shot",

	projectile				= "Projectile_SmartShotgun",
}

----------------------------------------------------
Def.Weapon_ThrasherGun =
{
	inherit					= "Weapon_AutoGun",
	model					= "models/weapons/gauss_cannon/gauss_cannon_m3",
	cycle_barrels			= true,
	
	fire_rate				= 10,
	projectile_speed		= 700,
	damage_kinetic			= 5000,

	shot_once_sound 		= "sound/weapons/KineticFloat/KineticFloatingCrit",
	
	dispersion				= 0.5,
	dispersion_max			= 1.5, 
	dispersion_add			= 0.1, 
	dispersion_sub			= 0.5, 
	
	optimal_range			= 340,
	max_range				= 460,	
	
	crit_chance				= 0.03,
	crit_damage				= 1,
	
	heat_max				= 10,
	heat_add				= 1,
	heat_sub				= 2,
	overheat_time			= 1,
	
	spell_on_hit			= "Spell_ThrasherGun_SpawnHealScrap",
	
	item_subtype			= ItemSubtype.ThrasherGun,
	module_type				= ai.ModuleType.WEAPON,

	weapon_class			= ai.WeaponClass.RAILGUN,
	projectile				= "Projectile_ThrasherGun",
	default_custom_elements =
	{
		[ai.VesselCustomSlot.MATERIAL_0]	= "weapons_assault_r1",
		[ai.VesselCustomSlot.MATERIAL_1]	= "weapons_assault_g1",
		[ai.VesselCustomSlot.MATERIAL_2]	= "weapons_assault_b1",
	},
	shot_effect 		= "particles/weapons/railgun/muzzle_realistic",
	muzzleflash_color	= { kinetic = "255 176 128 100", emp = "255 176 128 100", thermal = "255 176 128 100", },
	muzzleflash_radius 	= 8,
}

Def.Projectile_ThrasherGun =
{
	inherit									= "Projectile_Nail_Default",
	hit_effect								= "particles/weapons/railgun/hit_realistic",
	effect									= "particles/weapons/railgun/railgun_thrasher_projectile",
	shadowCaster							= false,
    impact_type 							= "railgun",
	--spell									= "Spell_ThrasherGun_SpawnHealScrap",
	--death_entity							= "HealScrap_ThrasherGun",
	--owned_death_entity_max				= 5,
}

Def.HealScrap_ThrasherGun =
{
	class 									= "ScBaseEntity",
	in_editor								= true,
	hudType									= "default",
	hud_visibility_type						= "minor",
	model									= "models/weapons/thrasher_gun/fragment",
	physics			= { solid_type = solid.sphere,  hitbox = true, kinematic = true, },
    max_detection_distance					= 500.0,
	vision_radius_coef						= 0.5,
	
	spell_approach							= "Spell_HealScrap_ThrasherGun",
	spell_approach_trigger_radius			= 40.0,
	only_for_friends						= true,
	spell_approach_respawn_timer			= 0,
	
	ttl										= 15,
	
	use_team_skin = true,

	death_effect							= "particles/ships/looted",
	spell_approach_trigger_sound			= "sound/game/bonus_take",
	children = 
	{
		{ effect = { s1 = "particles/objects/bonuses/armor_restore_exp", s2 = "particles/null", default = "particles/null" }, joint = "root" },
	}
}

Def.Weapon_TyphonGun = 
{
	inherit					= "Weapon_AutoGun",
	
	model					= "models/weapons/typhon_gun/typhon_gun",
	
	fire_rate				= 450,
	projectile_speed		= 750,
	damage_emp				= 100,
	
	dispersion				= 0.6,
	dispersion_max			= 1.6, 
	dispersion_add			= 0.1, 
	dispersion_sub			= 0.5, 
	
	optimal_range			= 172,
	max_range				= 230,	
	
	crit_chance				= 0.1,
	crit_damage				= 0.7,
	
	heat_max				= 10,
	heat_add				= 0.01,
	heat_sub				= 20,
	overheat_time			= 0,
	
	shot_energy_cost		= 16,
	ui_hide_overheat		= true,
	--heat_overcharge			= true,
	--ignore_fire_rate_mods	= true,
	
	spell_on_hit			= "TyphonGun_Overcharge",
	spell_on_hit_if_hacked 	= false,
	
	item_subtype			= ItemSubtype.TyphonGun,
	module_type				= ai.ModuleType.WEAPON,

	weapon_class			= ai.WeaponClass.PLASMAGUN,
	projectile				= "Projectile_TyphonGun",
	shot_effect 			= "particles/weapons/plasma/muzzle_typhon",
	shot_once_sound 		= "sound/weapons/TyphonGun/tg_shot",
	muzzleflash_color	= { kinetic = "102 128 255 100", emp = "102 128 255 100", thermal = "102 128 255 100", },
	muzzleflash_radius 	= 8,
}
Def.Projectile_TyphonGun =
{
	inherit			= "Projectile_Plasma_Default",
	shadowCaster		= false,
	impact_type 		= "plasma",
	
	hit_effect				= "particles/weapons/plasma/hit",
	effect 					= "particles/weapons/plasma/plasma_typhon_projectile",

}

Def.Weapon_AutomaticBurst = 
{
	inherit					= "Weapon_AutoGun",
	
	model					= "models/weapons/plasma_gun/plasma_gun_mod4",
	
	fire_rate				= 500,
	projectile_speed		= 900,
	damage_emp				= 50,
	
	dispersion				= 0.2,
	dispersion_max			= 1.5, 
	dispersion_add			= 0.8, 
	dispersion_sub			= 1.5, 
	
	optimal_range			= 430,
	max_range				= 570,	
	
	crit_chance				= 0.1,
	crit_damage				= 0.5,
	
	heat_max				= 10,
	heat_add				= 30,
	heat_sub				= 20,
	overheat_time			= 0,
	
	ui_hide_overheat		= true,
	--heat_overcharge			= true,
	ignore_fire_rate_mods	= true,
	
	item_subtype			= ItemSubtype.TyphonGun,
	module_type				= ai.ModuleType.WEAPON,

	weapon_class			= ai.WeaponClass.PLASMAGUN,
	projectile				= "Projectile_Plasma_Light",
	--shot_effect 		= "particles/weapons/railgun/muzzle_realistic",
	shot_once_sound 		= "sound/weapons/KineticFloat/KineticFloatingCrit",
	muzzleflash_color	= { kinetic = "255 176 128 100", emp = "255 176 128 100", thermal = "255 176 128 100", },
	muzzleflash_radius 	= 8,
}

Def.Weapon_StormGun = 
{
	class = "LaserGunRay",
	--class = "LaserGun",
	module_type = ai.ModuleType.WEAPON,
	item_subtype			= ItemSubtype.StormGun,
	
	crit_chance = 0.05,
	crit_damage = 0.3,
	damage_thermal = 100,
	damage_thermal_add		= 150,
	damage_thermal_sub		= 250,
	damage_thermal_max		= 700,
	dispersion = 0,
	dispersion_max = 0,
	fire_rate = 120,
	impulse_time = 1,
	heat_max = 10,
	heat_add = 1.5,
	heat_sub = 4,
	overheat_time = 1.5,
	
	impact_type = "laser",

	impulse_time = 1,

	muzzleflash_radius = 20,
	muzzleflash_color = { kinetic = "102 209 255 255", emp = "102 209 255 255", thermal = "102 209 255 255", },
	--damage_color 		= { kinetic = "129 161 255 255", emp = "129 161 255 255", thermal = "129 161 255 255", },
	beam_start_fx = "particles/weapons/laser/laser_storm_beam_start",
	beam_fx	= "particles/weapons/laser/laser_storm_beam",
	focus_fx = "particles/null",
	fire_fx = "particles/weapons/laser/muzzle_storm",
	
	max_range = 70,
	optimal_range = 52,
	damage_radius	= 10,
	focus_distance = 30,
	
	weapon_class = ai.WeaponClass.LASER,
	spell_on_hit = "StormGun_Flame",
	
	--is_flamethrower = true,
	--track 					= ai.TrackMode.AIM,
	--max_aim_yaw				= 0.7,  -- (в градусах)
	--max_aim_pitch  			= 0.7,  --(в градусах). 
	--inherit_speed = true, --в прожектайле
	--delayed_stop_effect_time = 20,
	
	model="models/weapons/nordstorm_gun/nordstorm_gun",
	hit_loop_sound = "sound/hit/laser_loop",
	shot_loop_sound = "sound/weapons/StormGun/sg_loop",
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_StormGun", }, },
}

Def.Weapon_GazGun = 
{
	inherit 			= "Weapon_Base",
	class 				= "SingularityCannon",
	model="models/weapons/wolfhound_gun/wolfhound_gun",
	module_type = ai.ModuleType.WEAPON,
	item_subtype			= ItemSubtype.MagneticGun,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.GUARD,
	required_ship	= "Ship_Race2_L_T5_Dino",
	weapon_class			= ai.WeaponClass.PLASMAGUN,
	fire_rate 			= 30,
	dispersion			= 2.5,
	
	optimal_range		= 300,
	max_range			= 300,
	
	projectile_speed 	= 300,
	
	--damage				= 0,
	--damage_kinetic		= 0,
	damage_emp			= 200,
	--damage_thermal		= 200,
	
	heat_max 			= 10,
	heat_add 			= 2,
	heat_sub 			= 3,
	overheat_time		= 2,
	
	projectile			= "Projectile_GazGun",
	shot_once_sound 	= "sound/weapons/singularity/sg_shot",
	--shot_beam_fx 		= "particles/weapons/big/plasma_orb_beam",
	shot_beam_fx 		= "particles/gadget/special/doctor_debuff_beam",
	--shot_effect 		= "particles/weapons/big/plasma_orb_muzzle",
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_FlameThrower", }, },
	uiName			= "GazGun",
	
	--spell_on_hit = "FlameThrowerFire",
	--is_flamethrower = true,
	--track 					= ai.TrackMode.AIM,
	--max_aim_yaw				= 1,  -- (в градусах)
	--max_aim_pitch  			= 1,  --(в градусах).
}

Def.Projectile_GazGun =
{
	class			= "SingularityProjectile",
	in_editor		= false,

	hitbox_min 		= Vec3( -0.5, -0.5, -0.5 ),
	hitbox_max		= Vec3( 0.5, 0.5, 0.5 ),
	damage_radius	= 2,
	impact_type 	= "singularity",
	
	hit_effect		= "particles/weapons/plasma/hit",
	work_sound 	    = "sound/weapons/singularity/sg_fly",
	
	--effect 			= "particles/weapons/laser/radiation_beam_heat_aura",
	--effect 			= "particles/gadget/turning_tide_projectile",
	effect 			= "particles/weapons/big/plasma_slow_2",
	
	singularity_hit_fx = "particles/weapons/other/fire_emp_hit",
	singularity_hit_sound = "sound/hit/singularity_ship",
	spell_on_launch	= "Spell_StormGun_Cast",
	
	--effect = "particles/weapons/other/fire_emp_projectile",
	hit_effect = "particles/weapons/other/fire_emp_hit",
	--flare_size			= 0,

	--model = "models/misc/invisible_model",
	--inherit_speed = true,
}

Def.Weapon_DinoGun =
{
	inherit = "Weapon_Base",
	class = "AutoGun",

	cycle_barrels = true,
	
	fire_rate			= 60,	--скорострельнсоть 75
	dispersion			= 0, 	--разброс начальный
	dispersion_add		= 0.2, --увеличение разброса
	dispersion_sub		= 0.6, --снижение разброса после стрельбы
	dispersion_max		= 1.5, --макс. разброс

	max_range			= 350,	--дальность стрельбы 
	projectile_speed 		= 400.0, -- скорость прожектайла , 375
	
	--damage			= 10,
	damage_kinetic		= 0,
	damage_emp			= 0, --урон еми
	damage_thermal		= 400,
	
	heat_max 			= 15,
	heat_add 			= 2.5,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,

	projectile			= "Projectile_DinoGun",
	spell_on_hit		= "DinoGun",
	model			= "models/weapons/rail_guns/econom/rg_training",

	shot_once_sound 	= "sound/weapons/DinoGun/dg_shot",
	shot_effect 		= "particles/weapons/drongun/muzzle",

	weapon_class = ai.WeaponClass.LASER,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_DinoGun", }, },
	
	
	item_subtype			= ItemSubtype.DinoGun,
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.GUARD,
	required_ship	= "Ship_Race2_L_T5_Dino",
	--uiName			= "DinoGun",
}

Def.Projectile_DinoGun  =
{
	override_blast_wave_damage = true,
	missile_defence_immune = true,
	in_editor = false,
	class = "Rocket",
	detonation_radius = 3,
	impact_type = "rocket",
	explosion_blast_wave = "Blastwave_DinoGun",
	flare_angle = 1,
	flare_color = "200 146 170 15",
	flare_nebulosity = 0.2,
	flare_size = 0.2,	
	
	
	effect 			= "particles/weapons/other/follower_drone_projectile",
	hit_effect		= "particles/weapons/blaster/dturret_explosion",
	missile_defence_immune 	= true,
		
	disable_concussion_sound = true,
}

Def.Blastwave_DinoGun = 
{

	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 55,
	class = "BlastWave",
	--effect = "particles/explosions/alien_plazma_explosion",
	in_editor = false,

	sound = "sound/explosion/FunnyDouble_expl",
	sound_combine_dist = 10,
	sound_combine_time = 0.1,
	blast_angle = 10,

}

Def.Weapon_SeeressGun =  
{
	inherit 				= "Weapon_Base",
	class 					= "ChargableGun",
	model					= "models/weapons/seeress_gun/seeress_gun",
	item_subtype			= ItemSubtype.SeeressGun,
	weapon_class			= ai.WeaponClass.PLASMAGUN,
	
	asteroid_overheat_time_coef = 0.01, --0.435, --коэфицент возрастания перегрева астероида
	
	fire_rate 				= 80,
	dispersion				= 0.3,
	
	optimal_range			= 330,
	max_range				= 390,
	
	projectile_speed 		= 675,
	damage_emp				= 750,
	
	shot_loop_sound 		= "sound/weapons/SeressGun/SeeressGun_charge",
	crit_chance				= 0.05,
	heat_max 				= 10,
	heat_add 				= 1,
	heat_sub 				= 2,
	overheat_time			= 5,
	
	use_charge_crosshair	= true,
	
	charge_levels = {
		{
			time = 0,
			projectile = "Projectile_SeeressGun",
			speed_mul = 0,
			damage_mul = 0,
			heat_add_mul = 0,
			ai_optimal = true,
		},
		{
			time = 1.5,
			projectile = "Projectile_SeeressGunCharge",
			speed_mul = 0,
			damage_mul = 0.8,
			heat_add_mul = 1,
			force_charge_crosshair_max = true,
			ai_optimal = false, --оптимальный уровень зарядки под воздействием ауры HACKED_WEAPON
			--spell_on_hit = "FlameThrowerFire",
		},

	},

	shot_beam_fx 		= "particles/weapons/other/seeress_beam",
	shot_effect 		= "particles/weapons/other/seeress_muzzle",
	charge_effect 		= "particles/weapons/other/seeress_charge",
	muzzleflash_radius 	= 32,
	
	default_icon		= "ItemSubtype_SeeressGun",
	
}

Def.Projectile_SeeressGun = -- мелкая пуля
{
	class						= "Rocket",

	explosion_blast_wave		= "Blastwave_SeeressGun",	
	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	disable_concussion_sound	= true,

	shot_once_sound 			= "sound/weapons/SeressGun/SeeressGun_shot",
	
	detonation_radius			= 1,
	

	work_sound 	    			= "sound/weapons/chargeblast/cb_fly",
	effect 						= "particles/weapons/other/seeress_projectile",
	impact_type 				= "rocket",
	
}

Def.Blastwave_SeeressGun =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 10,
	apply_damage				= true,
	apply_shake 				= true,
	
	self_damage_coef			= 0,

	effect 						= "particles/weapons/other/seeress_explosion",
	-- light_color 				= "111 111 255 0",
	-- light_radius 				= 40,
	-- light_time 					= 0.4,
	sound 						= "sound/explosion/SmartRocket_expl",
}

Def.Projectile_SeeressGunCharge = -- большая пуля с уронном спелом
{
	class						= "Rocket",

	explosion_blast_wave		= "Blastwave_SeeressGunCharge",	
	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	disable_concussion_sound	= true,

	shot_once_sound 			= "sound/weapons/SeressGun/SeeressGun_charged_shot",
	
	
	
	detonation_radius			= 9,
	
	flare_color					= "0 111 0 0",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound 	    			= "sound/weapons/chargeblast/cb_fly",
	effect 						= "particles/weapons/other/seeress_projectile",
	impact_type 				= "rocket",
	spell						= "SeeressGun",
}

Def.Blastwave_SeeressGunCharge =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 10,
	apply_damage				= true,
	apply_shake 				= true,
	
	self_damage_coef			= 0,

	effect 						= "particles/weapons/other/seeress_explosion2",
	light_color 				= "0 111 0 0",
	light_radius 				= 40,
	light_time 					= 0.4,
	sound 						= "sound/explosion/SmartRocket_expl",
}

Def.Weapon_HeliconGun =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	item_subtype			= ItemSubtype.HeliconGun,
	
	fire_rate				= 25,
	fire_rate_max 			= 100,
	fire_rate_add			= 30,

	cycle_barrels 			= true,
	
	--no_friendly_fire		= true, ---
	--override_blast_wave_damage = true, ---

	dispersion				= 0.3,	
	dispersion_max			= 2,
	dispersion_add			= 0.25,
	dispersion_sub			= 2,
	
	optimal_range			= 330,
	max_range				= 400,
	projectile_speed		= 400,
	
	damage_kinetic			= 100,
	crit_chance				= 0.05,
	crit_damage				= 0.5,
	
	heat_max				= 10,
	heat_add				= 1.6,
	heat_sub				= 5,
	overheat_time			= 1,

	
	model					= "models/weapons/lasers/sniper/l_training",
	module_type				= ai.ModuleType.WEAPON,
	projectile				= "Projectile_HeliconGun",
	shot_effect 			= "particles/weapons/devostator_muzzle",
	muzzleflash_color = { kinetic = "255 154 82 64", emp = "255 154 82 64", thermal = "255 154 82 64", },
	muzzleflash_radius = 3,
	shot_once_sound 		= "sound/weapons/xo/big_cannon_shot",
	
	default_icon		= "ItemSubtype_HeliconGun",
}

Def.Projectile_HeliconGun =
{
	inherit				= "Projectile_Artillery",
	--explosion_blast_wave	= "Blastwave_BigCannon",
	work_sound 		= "sound/weapons/xo/bullet_fly",
	--model 				= "models/weapons/bs_torpedo_mid",
	flare_color			= "255 214 155 25",
	flare_size			= 0.05, --0.15
	flare_angle			= 180,
	flare_nebulosity	= 1.0,
	effect 				= "particles/weapons/devostrator_trail",
}

Def.Weapon_Sparks_Cannon_Grim =
{
	inherit = "Weapon_Sparks_Cannon",
	item_subtype 	= "ItemSubtype.SparksCannonGrim",
	
	fire_rate			= 70,
	dispersion			= 0, 
	dispersion_add		= 0.8, 
	dispersion_sub		= 0.6, 
	dispersion_max		= 3.5, 

	max_range			= 290,
	projectile_speed 		= 550.0,
	
	--damage			= 10,
	damage_kinetic		= 605,
	
	projectile			= "Projectile_Sparks_Cannon_Grim",
	
	default_icon		= "ItemSubtype_SparksCannon",

}


Def.Projectile_Sparks_Cannon_Grim  =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/bs_torpedo_mid",
	explosion_blast_wave= "Blastwave_Sparks_Cannon",
	override_blast_wave_damage = true,
	
	detonation_radius	= 3.6,--

	flare_color			= "255 190 140 15",
	flare_size			= 0.15,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/devostrator_trail",	
	missile_defence_immune 	= true,
	spell				= "Spell_Sparks_Cannon_Grim",	
	disable_concussion_sound = true,
}

Def.Weapon_BaphometGun =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
	item_subtype		= ItemSubtype.BaphometGun,


	cycle_barrels 		= true,
	
	fire_rate			= 40,
	dispersion			= 10, 
	
	optimal_range			= 300,
	max_range				= 350,
	
	projectile_speed 	= 80.0,
	
	damage_kinetic		= 720,
	
	crit_chance		= 0.1,
	crit_damage		= 0.4,
	
	weapon_class			= ai.WeaponClass.RAILGUN,
	
	heat_max 			= 5,
	heat_add 			= 1,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 2,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 2,
	
	-- spell_on_hit			= "BaphometGun_Overcharge",
	
	no_friendly_fire	= true,
	
	projectile			= "Projectile_BaphometGun",
	muzzleflash_color = { kinetic = "162 228 205 64", emp = "162 228 205 64", thermal = "162 228 205 64", },
	model				= "models/weapons/baphomet_gun/baphomet_gun",
	--shot_effect 		= "particles/weapons/other/plasmablade_muzzle",
	shot_once_sound 	= "sound/weapons/rockets/FunnyDoubleMissile",
	
	-- ods_export				= true,
	-- storeItemId				= 1,
	-- cant_be_bought			= true,
	-- premiumPrice			= 999999,
	-- tier					= 5,	
	-- item_lvl				= 25,
	-- in_editor				= false,
	-- rank_min				= 1,
	-- rank_max				= 17,
	-- class_mask=ai.ShipClass.MEDIUM,
	--required_role = ai.ShipRoles.TACKLER,
	--required_ship	= "Ship_Race2_L_T5_Dino",
}

Def.Projectile_BaphometGun =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/missile_torpedo",
	
	explosion_blast_wave= "Blastwave_PlasmaBlade",
	override_blast_wave_damage = true,
	
	empty_holder_cooldown		= 120,
	holder_size					= 3,
	cooldown					= 15,
	
	detonation_radius			= 10,

	--spell 				= "PlasmaBlade",
	spell 				= "BaphometGun_Overcharge",
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	disable_concussion_sound = true,
	--fixed_axis			= "y",  -- x - наведение только по вертикали; y - по горизонтали
	
	explosion_blast_wave = "Blastwave_MirvRocket1",
	model				= "models/weapons/bs_torpedo_small",
	flare_color			= "255 170 191 0",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	work_sound			= "sound/weapons/smartRocket/smr_fly",

	--work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/devostrator_trail",
	impact_type 		= "rocket",
	
	
	-- volley_count 		= 4,
	is_guided			= true,	
	angular_velocity	= 45,
	--volley_timeout 		= 0.2,
	random_trajectory	= true,
	
	 -- track 					= ai.TrackMode.AIM,
	 -- max_aim_yaw				= 21,  -- (в градусах)
	 -- max_aim_pitch  			= 21,  --(в градусах). 
	
	
}

Def.Weapon_LaserHadrian = 
{
	class = "LaserGun",

	module_type = ai.ModuleType.WEAPON,
	item_subtype	= ItemSubtype.LaserHadrian,
	
	crit_chance = 0.05,
	crit_damage = 0.3,
	damage_thermal = 40,

	dispersion = 0.15,
	dispersion_max = 0.15,
	fire_rate = 312,
	impulse_time = 0.5,
	heat_max = 10,
	heat_add = 1.5,
	heat_sub = 4,
	overheat_time = 1.5,

	cycle_barrels 		= false,
	
	impact_type = "laser",



	muzzleflash_radius = 20,
	muzzleflash_color = { kinetic = "255 154 82 64", emp = "255 154 82 64", thermal = "255 154 82 64", },

	beam_fx 		= "particles/weapons/laser/laser_red",
	fire_fx 		= "particles/weapons/laser/laser_red_muzzle",
	hit_fx		= "particles/weapons/laser/laser_red_hit",
	
	max_range = 320,
	optimal_range = 320,
	-- damage_radius	= 1,
	-- focus_distance = 30,
	
	weapon_class = ai.WeaponClass.LASER,
	spell_on_hit = "LaserHadrian",
	
	
	model="models/weapons/hadrian_gun/hadrian_gun",
	hit_loop_sound = "sound/hit/laser_loop",
	shot_once_sound = "sound/weapons/laser/econ",
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_LaserHadrian", }, },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.COMMAND,
	required_ship	= "Ship_Race1_M_T5_Hadrian",
}

Def.Weapon_ManulPlasmaGun = 
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
	item_subtype	= ItemSubtype.ManulPlasmaGun,
	weapon_class 		= ai.WeaponClass.PLASMAGUN,
	cycle_barrels 		= true,	
	
	projectile 			= "Projectile_ManulPlasma",
	projectile_speed 	= 600,	
	
	crit_chance			= 0.05,
	crit_damage 		= 0.5,
	
	damage_emp 			= 400,

	dispersion 			= 0.2,
	dispersion_add		= 0.2,
	dispersion_max 		= 2,
	dispersion_sub		= 2,
	
	fire_rate 			= 60,
	
	heat_add 			= 1,
	heat_max 			= 7,
	heat_sub 			= 3.5,
	overheat_time 		= 1.5,
	
	max_range 			= 280,
	optimal_range 		= 280,


	
	spell_on_hit		=	"Spell_ManulPlasma",
	
	muzzleflash_color 	= { kinetic = "109 145 111 96", emp = "109 145 111 96", thermal = "109 145 111 96", },
	muzzleflash_radius	= 20,
		
	shot_effect 		= "particles/weapons/missile/alien_rocket_muzzle",
	shot_once_sound		= "sound/weapons/rockets/FunnyDoubleMissile",
	
	default_icon 		= "ItemSubtype_ManulPlasmaGun",
	
	ui_ico 				= { target_system 	= { tex = "ItemSubtype_ManulPlasmaGun", }, },

	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
}

Def.Projectile_ManulPlasma = 
{
	angular_velocity 	= 15,
	class 				= "Projectile",
	
	effect				= "particles/weapons/plasma/ipe_projectile",
	flare_color			= "100 200 255 1",
	death_sound 		= "sound/explosion/small_rocket_expl",
	detonation_radius	= 9.5,
	disable_concussion_sound 	= true,

	
	flare_angle 		= 180,
	flare_color 		= "109 145 111 15",
	flare_nebulosity 	= 0.2,
	flare_size 			= 0.2,
	
	explosion_blast_wave= "Blastwave_ManulPlasma",
	impact_type			= "rocket",
	
	in_editor 			= false,
	
	model 				= "models/weapons/wazgot_station_guns/crystal_torpedo",

}

Def.Blastwave_ManulPlasma =
{
	class					= "BlastWave",
	in_editor				= false,

--	damage_emp				= 800,
	blast_maxDistance		= 7,
	apply_damage			= true,
	

	effect 					= "particles/weapons/big/plasma_orb_explosion",
	light_color 			= "200 200 255 100",
	light_radius 			= 50,
	light_time 				= 0.4,
	sound 					= "sound/explosion/SmartRocket_expl",
}

Def.Weapon_SalamanderNailgun =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
	item_subtype		= ItemSubtype.SalamanderNailgun,
	weapon_class 		= ai.WeaponClass.RAILGUN,
	cycle_barrels 		= false,
	
	projectile			= "Projectile_SalamanderNailgun",
	projectile_speed 	= 700,	
	
	crit_chance			= 0.05,
	crit_damage 		= 0.3,
	
	damage_kinetic 		= 210,

	dispersion 			= 0.5,
	dispersion_add		= 0,
	dispersion_max 		= 0.5,
	dispersion_sub		= 3,
	
	fire_rate 			= 250,
	
	heat_add 			= 1,
	heat_max 			= 15,
	heat_sub 			= 3.003003,
	overheat_time 		= 1.5,
	
	max_range 			= 400,
	optimal_range 		= 400,
	
	friendly_fire 		= true, -- упрждение в союзника
	
	spell_on_hit		= "Spell_SalamanderNailgun",
	
	shot_once_sound = "sound/weapons/railgun/PirateRail",
	shot_effect 	= "particles/weapons/railgun/muzzle_destr3",
	_muzzleflash_color = { kinetic = "230 156 92 128", emp = "230 156 92 128", thermal = "230 156 92 128", },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.ENGINEER,
	required_ship	= "Ship_Race5_L_T5_Salamander",
}

Def.Projectile_SalamanderNailgun = 
{
	
	inherit 			= "Projectile_Nail_Iron",
	
	spell_on_crit = "",
	spell_on_crit_if_hacked = false,

}
---------- для пиратского рейлгана дестра

Def.Weapon_DestrIron_Pirate =
{
	inherit					= "Weapon_Base",
	class 				= "AutoGun",
	weapon_class 		= ai.WeaponClass.RAILGUN,
	
	crit_chance			= 0.2,
	crit_damage 		= 0.5,
	
	damage_kinetic 		= 261,

	dispersion 			= 0.1,
	dispersion_add		= 5,
	dispersion_max 		= 1.5,
	dispersion_sub		= 0.25,
	
	fire_rate 			= 250,
	
	heat_add 			= 0.9,
	heat_max 			= 10,
	heat_sub 			= 10,
	overheat_time 		= 1.5,
	
	max_range 			= 440,
	optimal_range 		= 440,
	
	
	cycle_barrels 		= false,
	projectile				= "Projectile_NailIron_Pirate",
		projectile_speed 	= 655,

	--shot_effect = "particles/weapons/railgun/muzzle_destr",
	shot_once_sound = "sound/destroyer/RailgunDestr_shot",
	_muzzleflash_color = { kinetic = "255 220 150 128", emp = "255 220 150 128", thermal = "255 220 150 128", },
	muzzleflash_radius = 15,
	oriented_shot_effects = true,
}

Def.Projectile_NailIron_Pirate =
{
	inherit					= "Projectile_CrystallSparks",

	link_range 				= 60,--20
	chaing_damage			= { 1, 0.4 },

	hit_effect		= "particles/weapons/railgun/hit",
	--effect			= "particles/weapons/railgun/railgun_destr_projectile",
	
	flare_color				= "255 250 231 128",
	flare_size				= 0.0, --0
	flare_angle				= 180,
	flare_nebulosity		= 0.1,--0.1,
	
	--effect 					= "particles/weapons/missile/destroyer_rocket_trail",
	effect			= "particles/weapons/railgun/railgun_destr_projectile",
	beam_fx 				= "particles/weapons/alien/crystal_beam_y",
	chain_hit_fx 			= "particles/weapons/alien/crystal_beam_hit_y",
	
	_muzzleflash_color = { kinetic = "230 156 92 128", emp = "230 156 92 128", thermal = "230 156 92 128", },
	muzzleflash_radius = 15,
	
}

Def.Weapon_HeartAttack =
{
	--inherit 				= "Weapon_LaserGun",
	inherit 				= "Weapon_Base",
	class 					= "LaserGun",
	focus_distance			= 10,
	
	item_subtype			= ItemSubtype.HeartAttack,
	
	model 					= "models/weapons/lasers/power/l_training",
	
	fire_rate 				= 120,
	
	impulse_time 			= 1,
	dispersion 				= 0,
	
	optimal_range 			= 230,
	max_range 				= 270,
	
	--damage_emp 				= 1,
	damage_thermal 			= 540,

	
	heat_max 				= 10,
	heat_add 				= 1.6666667,
	heat_sub 				= 5,
	overheat_time 			= 1,
	
	spell_on_hit 			= "Spell_heart_attack",
	--spell_on_hit_timeout 	= 1,
	
	module_type 			= ai.ModuleType.WEAPON,
	weapon_class 			= ai.WeaponClass.LASER,
	
	damage_color	  = { kinetic = ai.DONT_INHERIT, emp = ai.DONT_INHERIT, thermal = "255 255 255 255", },
	muzzleflash_color = { kinetic = "200 55 50 64", emp = "200 55 50 64", thermal = "200 55 50 64", },
	muzzleflash_radius 		= 15,

	
	--uiName = "Weapon_Laser_Heavy",
	--uiDesc = "Weapon_Laser_Heavy_Desc",
	beam_start_fx			= "particles/weapons/laser/radiation_beam_start_pink",
	beam_fx 				= "particles/weapons/laser/radiation_beam_pink",
	hit_fx 					= "particles/weapons/laser/radiation_beam_hit_pink",
	focus_fx 				= "particles/weapons/laser/radiation_beam_focus_pink",

	shot_loop_sound 		= "sound/weapons/laser/radiation",
	hit_loop_sound 			= "sound/hit/laser_loop",
	
	default_icon	= "ItemSubtype_HeartAttack",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,

}	

Def.SpaceMissile_CorrosiveMissile = 
{

	inherit			= "Weapon_BaseRocket",
	class			= "Rocket",
	module_type		= ai.ModuleType.ROCKET,
	item_subtype	= ItemSubtype.Missile_test,
	
	max_range			= 300,  
	speed 				= 95,
	angular_velocity 	= 68,
	is_guided 			= false,
	
	
	flare_color			= "255 170 191 0",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect = "particles/weapons/missile/rocket_trail_mid",
	rocket_direct_hit_sound = "sound/hit/rocket_direct_hit",
	smooth_effect_param = true,
	reflection_immune	= false,
	
	work_sound					= "sound/weapons/smartRocket/smr_fly",
		
	cooldown			= 10,
	holder_size			= 3,
	empty_holder_cooldown = 120,
	
	model 				= "models/weapons/missile_rocket",
	MunitionBayType		= ai.MunitionBayType.MBT_SECONDARY,
	explosion_blast_wave	= "BlastWave_ProximityMineGreen",
	
	death_entity		= "Drone_CorrosiveMissile",
	
	explosion_blast_wave= "BlastWave_Missile_test",
}

Def.BlastWave_CorrosiveMissile = {

	damage_kinetic			= 1000,
	blast_maxDistance		= 30,--50,
	light_radius			= 30,
	light_time				= 0.8,
	sound 					= "sound/explosion/SmartRocket_expl",
	class					= "BlastWave",
	self_damage_coef		= 1, --не дамагаем себя.
	effect 				= "particles/explosions/artillery_fire",
	
}

Def.Drone_CorrosiveMissile =
{

	inherit					= "SentryDrone",
	class					= "GuidedDrone",
	
	signature				= ai.Signature.TINY,
	
	fire_rate				= 0,
	damage					= 0,
	damage_kinetic			= 0,
	damage_emp				= 0,
	damage_thermal			= 0,
	
	projectile				= "Projectile_DestrBeamDrone",
	shot_effect 			= "particles/weapons/drongun/muzzle",
	
	ttl						= 120,	

	health 				= 3000,
	model				= "models/weapons/drones/spyradar/spyradar",
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 1000,  damping = 0.4, rot_damping = 0.4,  },
	
	damageable			= true,
	hudType 			= "default",
	uiName 				= "dot_CorrosiveMissile",
	
	radius = 6,
	density = 0.75,
	effect = "particles/gadget/damage_emp_fire",

	active_spell			= "Spell_CorrosiveMissile",
}

Def.SpaceMissile_AnomalyBoom = 
{

	inherit			= "Weapon_BaseRocket",
	class			= "Rocket",
	module_type		= ai.ModuleType.ROCKET,
	item_subtype	= ItemSubtype.AnomalyBoom,
	
	max_range			= 300,  
	speed 				= 95,
	angular_velocity 	= 68,
	is_guided 			= false,
	
	
	flare_color			= "255 170 191 0",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect = "particles/weapons/missile/rocket_trail_mid",
	rocket_direct_hit_sound = "sound/hit/rocket_direct_hit",
	smooth_effect_param = true,
	reflection_immune	= false,
	
	work_sound					= "sound/weapons/smartRocket/smr_fly",
		
	cooldown			= 3,
	holder_size			= 3,
	empty_holder_cooldown = 3,
	
	model 				= "models/weapons/missile_rocket",
	MunitionBayType		= ai.MunitionBayType.MBT_SECONDARY,
	explosion_blast_wave	= "BlastWave_ProximityMineGreen",
	
	--death_entity		= "AnomalyBoom",
	
	spell				= "Spell_AnomalyBoom",
	
	explosion_blast_wave= "Blastwave_BigCannon",
}

Def.Blastwave_AnomalyBoom = 
{
	inherit				= "Blastwave_Artillery_Base",
	blast_maxDistance	= 30,
	damage_emp			= 7000,
	damage_thermal		= 0,
	sound 				= "sound/hit/xo_common",
	light_color 		= "255 239 195 120",
	light_radius 		= 20,
	light_time 			= 0.8,
	self_damage_coef		= 1, --не дамагаем себя.
	effect 				= "particles/weapons/crossout/tank_cannon_hit",
}

Def.Blastwave_AnomalyBoom2 =
{
	class							= "BlastWave",
	in_editor						= false,

	damage_emp						= 2000,
	blast_maxDistance				= 60,
	blast_minDistance				= 20,
	apply_damage					= true,
	apply_shake 					= true,

	effect							= "particles/gadget/damage_emp_sphere_red_small",
	light_color						= "50 100 255 150",
	light_radius					= 20,
	light_time						= 0.8,
	sound							= "sound/explosion/plasma_rocket_expl",
}

Def.SpaceMissile_HeatMulFire = 
{

	inherit			= "Weapon_BaseRocket",
	class			= "Rocket",
	module_type		= ai.ModuleType.ROCKET,
	item_subtype	= ItemSubtype.HeatMulFire,
	
	max_range			= 300,  
	speed 				= 95,
	angular_velocity 	= 68,
	is_guided 			= true,
	random_trajectory 	= true,
	reflection_immune	= false,
	
	flare_color			= "255 170 191 0",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect = "particles/weapons/missile/rocket_trail_mid",
	rocket_direct_hit_sound = "sound/hit/rocket_direct_hit",
	smooth_effect_param = true,
	
	work_sound					= "sound/weapons/smartRocket/smr_fly",
		
	cooldown			= 3,
	holder_size			= 3,
	empty_holder_cooldown = 3,
	
	model 				= "models/weapons/missile_rocket",
	MunitionBayType		= ai.MunitionBayType.MBT_SECONDARY,
	explosion_blast_wave	= "BlastWave_ProximityMineGreen",
	
	--death_entity		= "AnomalyBoom",
	
	spell				= "Spell_HeatMulFire",
	
	explosion_blast_wave= "Blastwave_HeatMulFire",
}

Def.Blastwave_HeatMulFire =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 3000,
	blast_maxDistance	= 20,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= true,
	self_damage_coef		= 1, --не дамагаем себя.

	effect 				= "particles/explosions/artillery_fire",
	light_color 		= "255 182 128 100",
	light_radius 		= 20,
	light_time 			= 0.8,
	sound 				= "sound/explosion/small_rocket_expl",
}

Def.Weapon_GreenFastShotgun =
{
	inherit 								= "Weapon_AutoGun",
	weapon_class 							= ai.WeaponClass.RAILGUN,
	item_subtype							= ItemSubtype.GreenFastShotgun,
	fire_rate								= 130,
	is_shotgun								= true,
	
	optimal_range							= 270,
	max_range								= 270,
	projectile_speed						= 520,
	
	dispersion								= 4.6,
	
	--damage_thermal							= 1,
	damage_kinetic							= 560,
	crit_chance								= 0.07,
	crit_damage								= 0.5,
	
	
	heat_max								= 10,
	heat_add								= 1.2,
	heat_sub								= 10,
	overheat_time							= 1,
	heat_overcharge							= false,

	--model									= "models/weapons/irbis_gun/irbis_gun",
	projectile								= "Projectile_GreenFastShotgun",
	
	module_type								= ai.ModuleType.WEAPON,
	
	model					= "models/weapons/green_fast_shotgun/green_fast_shotgun",
	shot_once_sound			= "sound/weapons/GreenFastShotgun/gfs_shot",
	
	default_icon				= "ItemSubtype_GreenFastShotgun",
	muzzleflash_color = { kinetic = "156 176 120 150", emp = "156 176 120 150", thermal = "156 176 120 150", },
	muzzleflash_radius 	= 1,
	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,

}

Def.Projectile_GreenFastShotgun =
{
	inherit				= "Projectile_SmartShotgun",
	spell_on_crit	 	= "Spell_GreenFastShotgun",
	effect 				= "particles/weapons/alien/alien_shotgun_projectile",
	--hit_effect			= "particles/weapons/special/ice_hit",
	impact_type 			= "Ice_hit",
}

Def.Blastwave_GreenFastShotgun =
{
	class							= "BlastWave",
	in_editor						= false,

	damage_kinetic					= 2200,
	blast_maxDistance				= 6,
	blast_minDistance				= 2,
	self_damage_coef				= 0,
	apply_damage					= true,
	apply_shake 					= true,

	effect							= "particles/gadget/damage_alien_big",
	light_color						= "70 240 173 150",
	light_radius					= 20,
	light_time						= 0.8,
	sound							= "sound/explosion/omegaB_expl",
}

Def.Blastwave_GreenFastShotgunT5 =
{
	inherit				= "Blastwave_GreenFastShotgun",
	damage_kinetic		= 2000,
}

Def.Blastwave_GreenFastShotgunT4 =
{
	inherit				= "Blastwave_GreenFastShotgun",
	damage_kinetic		= 1800,
}

Def.Blastwave_GreenFastShotgunT3 =
{
	inherit				= "Blastwave_GreenFastShotgun",
	damage_kinetic		= 1600,
}

Def.Weapon_GreenArtillery =
{
	inherit				= "Weapon_Base",
	class 				= "AutoGun",
	weapon_class 		= ai.WeaponClass.PLASMAGUN,
	item_subtype		= ItemSubtype.GreenArtillery,
	
	crit_chance			= 0.2,
	crit_damage 		= 0.5,
	
	damage_emp 			= 250,
	damage_emp_add		= 45,
	damage_emp_max		= 510,
	damage_emp_sub		= 700,

	dispersion 			= 2.0,
	dispersion_add		= -0.2,
	dispersion_max 		= 1,
	dispersion_sub		= -2.25,
	
	fire_rate 			= 90,
	-- fire_rate_add		= 100,	
	-- fire_rate_max		= 10,
	
	heat_add 			= 1.2,
	heat_max 			= 12,
	heat_sub 			= 4,8,
	overheat_time 		= 1.5,
	
	max_range 			= 100,
	optimal_range 		= 100,
	
	optimal_range_max	= 380,
	optimal_range_add	= 80,
	
	max_range_max		= 380,	
	max_range_add		= 80,
	--max_range_sub		= 0.1,
	
	model				= "models/weapons/green_artillery/green_artillery",
	
	cycle_barrels 		= false,
	projectile				= "Projectile_GreenArtillery",
		projectile_speed 	= 655,

	--shot_effect = "particles/weapons/railgun/muzzle_destr",
	shot_once_sound = "sound/weapons/GreenArt/ga_shot",
	muzzleflash_color = { kinetic = "145 205 145 150", emp = "145 205 145 150", thermal = "145 205 145 150", },
	muzzleflash_radius = 5,
	oriented_shot_effects = true,
	
	default_icon				= "ItemSubtype_GreenArtillery",
	
		ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	
}

Def.Projectile_GreenArtillery =
{
	inherit				= "Weapon_BaseRocket",
	model 				= "models/weapons/bs_torpedo_small",
	explosion_blast_wave= "Blastwave_GreenArtillery",
	override_blast_wave_damage = true,
	
	detonation_radius	= 8,

	--flare_color			= "255 241 204 15",--15
	flare_color			= "145 205 145 50",
	flare_size			= 0.1,
	flare_angle			= 180,
	flare_nebulosity	= 0.05,
	effect 				= "particles/weapons/missile/alien_rocket_trail",
--	work_sound			= "",
	missile_defence_immune 	= true,
	
	work_sound 	    = "sound/weapons/singularity/sg_fly",
}


Def.Blastwave_GreenArtillery =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_emp			= 1000,
	blast_maxDistance	= 20,
	blast_minDistance	= 2,
	apply_damage		= true,
	apply_shake 		= false,
	self_damage_coef	= 0,
	intensity			= 0,

	effect 				= "particles/weapons/alien/alien_explosion_emp",
	light_color 		= "145 205 145 150",
	light_radius 		= 20,
	light_time 			= 0.8,
	sound 				= "sound/explosion/omegaB_expl",
}

Def.Weapon_GreenSphereGun = 
{
	inherit 			= "Weapon_Base",
	class 				= "SingularityCannon",
	weapon_class 		= ai.WeaponClass.PLASMAGUN,
	model				= "models/weapons/green_sphere/green_sphere",
	item_subtype		= ItemSubtype.GreenSphereGun,
	
	cycle_barrels 							= true,

	fire_rate 			= 22.5,
	dispersion			= 1.15,
	
	optimal_range		= 260,
	max_range			= 260,
	
	crit_chance			= 0.001,
	crit_damage 		= 0.01,
	
	projectile_speed 	= 650,
	
	projectile			= "Projectile_GreenSphereGun",
	
	no_friendly_fire 	= true,
	
	--damage			= 0,
	--damage_kinetic		= 100,
	damage_emp				= 900,
	--damage_thermal		= 100,
	
	penetration_stack_max	= 100,
	penetration_stack_add	= 60,
	penetration_stack_sub	= 60,

	
	heat_max 			= 70,
	heat_add 			= 10,
	heat_sub 			= 28,
	overheat_time		= 0,
	
	muzzleflash_color = { kinetic = "160 255 160 255", emp = "160 255 160 255", thermal = "160 255 160 255", },
	muzzleflash_radius 	= 10,

	--explosion_mul 		= 1,

	shot_once_sound = "sound/weapons/GreenSphereGun/gsg_shot",
	shot_beam_fx 		= "particles/weapons/big/bubble_beam_projectile",
	shot_effect 		= "particles/weapons/big/bubble_muzzle",
	
	default_icon				= "ItemSubtype_GreenSphereGun",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
}

Def.Projectile_GreenSphereGun =
{
	--inherit				= "Projectile_Plasma_Light",
	class				= "Rocket",
	hitbox_max			= Vec3(2, 0.2, 2),
	hitbox_min			= Vec3(-2, -0.2, -2),
	explosion_blast_wave	= "Blastwave_GreenSphereGun",
	--override_blast_wave_damage = true,
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	disable_concussion_sound = true,

	--shot_once_sound = "sound/weapons/BubbleGun/bg_shot_slow",
	
	detonation_radius		= 5,
	
	spell				= "Spell_GreenSphereGun_Blastwave",
	
	--angular_velocity	= 140,
	--is_guided			= true,
	
		
	model 				= "models/weapons/bs_torpedo_small",	
	effect 						= "particles/weapons/chargedblast_alien_projectile",
	
	flare_color					= "60 200 60 150",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	
}

Def.Blastwave_GreenSphereGun =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 900,
	blast_maxDistance		= 15,
	apply_damage			= true,
	apply_shake 			= false,
	self_damage_coef		= 0,	

	effect 					= "particles/weapons/big/bubble_explosion_mid",
	light_color 			= "160 255 160 128",
	light_radius 			= 10,
	light_time 				= 0.2,
	sound 					= "sound/explosion/gsg_expl",
}

Def.Weapon_BarkCanon =
{
	inherit				= "Weapon_Base",
	class 				= "AutoGun",
	weapon_class 		= ai.WeaponClass.RAILGUN,
	item_subtype		= ItemSubtype.BarkCanon,
	
	crit_chance			= 0.2,
	crit_damage 		= 0.5,
	
	damage_kinetic 			= 750,

	dispersion 			= 1.3,

--	barrel_rot_speed	= 30,
	
	fire_rate 			= 90,

	
	heat_add 			= 1.2,
	heat_max 			= 10,
	heat_sub 			= 6.6666,
	overheat_time 		= 1.5,
	
	max_range 			= 300,
	optimal_range 		= 300,
	
	track 					= ai.TrackMode.AIM,
	max_aim_yaw				= 4,  -- (в градусах)
	max_aim_pitch  			= 4,  --(в градусах). 	

	
	cycle_barrels 		= true,
	projectile				= "Projectile_BarkCanon",
	projectile_speed 	= 655,

	model				= "models/weapons/green_artillery/green_artillery",
	shot_once_sound = "sound/weapons/BarkCanon/bc_shot",
	muzzleflash_color = { kinetic = "255 230 181 255", emp = "255 230 181 255", thermal = "255 230 181 255", },
	muzzleflash_radius 	= 30,
	shot_effect 		= "particles/weapons/bark_canon_muzzle",
	oriented_shot_effects = true,
	
	default_icon				= "ItemSubtype_BarkCanon",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	
}

Def.Projectile_BarkCanon =
{
	inherit				= "Projectile_BigCannon",
		detonation_radius	= 5,
	explosion_blast_wave	= "Blastwave_BarkCanon",
	work_sound 		= "sound/weapons/xo/bullet_fly",
	flare_color			= "255 214 155 25",
	flare_size			= 0.01, --0.15
	flare_angle			= 180,
	flare_nebulosity	= 1.0,
	effect 				= "particles/weapons/bark_canon_projectile",
}


Def.Blastwave_BarkCanon =
{
	inherit				= "Blastwave_BigCannon",
	blast_maxDistance	= 15,
	self_damage_coef	= 0,
	sound 			= "sound/hit/cannon_small_hit",
	light_color 		= "255 239 195 120",
	light_radius 		= 10,
	light_time 			= 0.8,
	effect 				= "particles/weapons/bark_canon_hit",
}

Def.Weapon_TurnGun =
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
	item_subtype		= ItemSubtype.TurnGun,
	weapon_class 		= ai.WeaponClass.PLASMAGUN,
	cycle_barrels 		= true,
	
	projectile			= "Projectile_TurnGun",
	projectile_speed 	= 700,	
	
	crit_chance			= 0.05,
	crit_damage 		= 0.3,
	
	damage_emp 		= 210,

	dispersion 			= 0.5,
	dispersion_add		= 0,
	dispersion_max 		= 0.5,
	dispersion_sub		= 3,
	
	fire_rate 			= 200,
	heat_add 			= 1,
	heat_max 			= 10,
	heat_sub 			= 4,
	overheat_time 		= 0.5,
	--ui_hide_overheat		= true,
	
	max_range 			= 400,
	optimal_range 		= 400,
	
	--friendly_fire 		= true, -- упрждение в союзника
	
	--spell_on_hit		= "Spell_SalamanderNailgun",
	
	shot_once_sound 	= "sound/weapons/sparks_cannon/sc_shot",
	shot_effect 		= "particles/weapons/plasma/muzzle_sniper",
	
	muzzleflash_color = { kinetic = "140 240 250 30", emp = "140 240 250 30", thermal = "140 240 250 30", },
	muzzleflash_radius = 3.5,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.GUARD,
	required_ship	= "Ship_Race3_L_T5_Shrike",
}

Def.Projectile_TurnGun = 
{
	
	--inherit 			= "Projectile_DinoGun",
	
	spell_on_crit = "Spell_TurnGun",
	spell_on_crit_if_hacked = false,
	
	--angular_velocity 	= 15,
	class 				= "Projectile",
	
	effect				= "particles/weapons/plasma/plasma_turngun_projectile",
	flare_color			= "100 200 255 1",
	death_sound 		= "sound/explosion/small_rocket_expl",
	detonation_radius	= 9.5,
	disable_concussion_sound 	= true,

	
	flare_angle 		= 180,
	flare_color 		= "109 145 111 15",
	flare_nebulosity 	= 0.2,
	flare_size 			= 0.2,
	
	
	impact_type			= "plasma",
	
	in_editor 			= false,
	
	model 				= "models/weapons/wazgot_station_guns/crystal_torpedo",

}

Def.Weapon_FireBallThrower = 
{
	inherit					= 'Weapon_AutoGun',
	-- class 				= "SingularityCannon",
	item_subtype		= ItemSubtype.FireBallThrower,
	module_type = ai.ModuleType.WEAPON,
	weapon_class = ai.WeaponClass.LASER,
	
	fire_rate				= 600,

	cycle_barrels = false,
	
	dispersion				= 0.1,
	dispersion_max			= 1,
	dispersion_add			= 0.1285714,
	dispersion_sub			= 0.72,
	optimal_range			= 3,
	max_range				= 90,
	damage_thermal			= 100,
	crit_chance				= 0.2,
	crit_damage				= 0.5,

	heat_max = 2,
	heat_add = 1,
	heat_sub = 3,
	
	overheat_time			= 1,
	
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	shot_effect 			= "particles/weapons/other/fireball_muzzle",
	shot_beam_fx 		= "particles/weapons/big/plasma_slow_2_beam",
	
	projectile = "Projectile_FireBallThrower",
	spell_on_hit = "Spell_FireBallThrower",
	projectile_speed	 = 325,
	muzzleflash_color = { kinetic = "237 184 141 255", emp = "237 184 141 255", thermal = "237 184 141 255", },
	muzzleflash_radius = 20,
	shot_once_sound = "sound/weapons/FireBallThrower/fb_fire",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	required_ship	= "Ship_Race2_S_T5_Pilum",
}

Def.Projectile_FireBallThrower = 
{
	inherit			= "Weapon_BaseRocket",
	class = "Projectile",
	effect = "particles/weapons/other/fireball_projectile",
	hit_effect = "particles/weapons/other/fireball_hit",
	flare_size			= 0,

	--spell_on_launch		= "Spell_FireBallThrower",

	hitbox_max = Vec3( 1.4, 1.4, 1.4 ),
	hitbox_min = Vec3( -1.4, -1.4, -1.4 ),
	impact_type = "laser",
	in_editor = false,
	mass = 0.01,
	shadowCaster = false,
	-- damage_radius	= 1,
	model = "models/misc/invisible_model",
	--death_entity_on_static_hit = "FireBall",
	inherit_speed = true,
	
}

Def.Projectile_BasicRailgunPirate = 
{
	inherit			= "Projectile_BasicRailgun",
	spell_on_crit	= "Spell_RailGunBasic_Pirate_Daamge",
}

Def.Weapon_HeliRoid =
{
	class 				= "SmartRocketLauncher",
	item_subtype		= ItemSubtype.HeliRoid,
	module_type = ai.ModuleType.WEAPON,

	cycle_barrels		= true,
	heat_max 			= 10,
	heat_add 			= 2,
	heat_sub 			= 5,
	overheat_time		= 2,
	fire_rate 			= 35, 
	optimal_range		= 430,
	max_range			= 430,
	
	dispersion			= 0,

	
	projectile 			= "Projectile_HeliRoid",
	shot_once_sound 	= "sound/weapons/smartRocket/smr",
	projectile_speed	= 240,	
	
	damage_kinetic		= 1500,  -- примерно пересчитаю по фаер рейту  эксперементальному 16/25  с миномета t5mk1
	--damage_emp				= 500,
	--no_friendly_fire 	= true,

	--targeting_beam_fx	= "particles/weapons/machete_laser",
	beam_bone 			= "rocket_1",
	
	--shot_effect = "particles/weapons/smart_muzzle", --New Year 
	shot_effect = "particles/weapons/smart_muzzle",	
	muzzleflash_color = { kinetic = "130 130 250 128", emp = "130 130 250 128", thermal = "130 130 250 128", },
	muzzleflash_radius 	= 8,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.SNIPER,
	required_ship	= "Ship_Race5_L_T5_Helios",
}

Def.Projectile_HeliRoid = 
{
	angular_velocity = 35,
	class = "Rocket",
	death_sound = "sound/explosion/small_rocket_expl",
	detonation_radius = 9.5, --9.5,
	disable_concussion_sound = true,
	effect = "particles/weapons/missile/heliroid_trail",
	explosion_blast_wave = "BlastWave_HeliRoid",
	
	death_entity		= "HeliRoid",
	owned_death_entity_max = 10,

	flare_angle = 180,
	flare_color = "255 128 50 15",
	flare_nebulosity = 0.2,
	flare_size = 0.3,
	
	impact_type = "rocket",
	
	in_editor = false,
	missile_defence_immune = true,
	model = "models/weapons/wazgot_station_guns/crystal_torpedo",
	override_blast_wave_damage = true,
	is_guided = true,
	

}

Def.BlastWave_HeliRoid = 
{
	class					= "BlastWave",
	in_editor				= false,
	
	--damage_kinetic			= 1500,
	--damage_emp				= 500,
	blast_maxDistance		= 30,--50,
	light_radius			= 30,
	light_time				= 0.8,
	
	apply_damage			= true,
	apply_shake 			= true,
	
	sound 			= "sound/hit/xo_common",
	class					= "BlastWave",
	
	effect 				= "particles/explosions/explosion_big_heliroid",
	self_damage_coef		= 3, --не дамагаем себя.
	--parent_prototype="SpaceMissile_ProximityMine_T5_Mk1"  -- в коде не нашли, тестим без этого.
}

Def.HeliRoid =
{
	class 				= "ScBaseEntity",
	health 				= 10000, --
	ttl					= 25,
	
	in_editor		= false,
	
	physics				= { solid_type = solid.model, hitbox = false, mass = 100005, material = "Metal", damping = 10.3, rot_damping = 10.3, },
	damageable			= true,
	network_sync 		= true,
	
	hack_immune			= true,
	
	radar_vison		= ai.ShieldRadarVisionMode.BLOCK_ENEMY,
	
	
	model				= "models/weapons/asteroid_helios/asteroid_helios",
	death_effect		= "particles/explosions/explosion_death_heliroid",
	death_sound			= "sound/explosion/drone_expl",
	ui_color			= 0xFFEEFFCC,

}


Def.Weapon_PsiloiTurboFaser = 
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
	item_subtype		= ItemSubtype.PsiloiTurboFaser,
	weapon_class 		= ai.WeaponClass.PLASMAGUN,
	cycle_barrels 		= false,
	
	projectile			= "Projectile_PsiloiTurboFaser",
	projectile_speed 	= 700,	
	--one_projectile_per_shot = true,
	
	crit_chance			= 0.05,
	crit_damage 		= 0.3,
	
	damage_emp 		= 210,

	dispersion 			= 3.15,
	dispersion_add		= -1.4175,
	dispersion_max 		= 0.315,
	dispersion_sub		= -0.81,
	
	fire_rate 			= 400,

	
	
	heat_add 			= 1,
	heat_max 			= 10,
	heat_sub 			= 4,
	overheat_time 		= 0.5,
	--ui_hide_overheat		= true,
	
	max_range 			= 400,
	optimal_range 		= 400,
	
	--friendly_fire 		= true, -- упрждение в союзника
	
	--spell_on_hit		= "Spell_SalamanderNailgun",
	
	shot_once_sound		= "sound/weapons/PsiloiTurboFaser/ptf_shot",

	shot_effect 		= "particles/weapons/plasma/muzzle_turbofaser",
	
	muzzleflash_color = { kinetic = "125 217 194 30", emp = "125 217 194 30", thermal = "125 217 194 30", },
	muzzleflash_radius = 3.5,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
	required_ship	= "Ship_Race1_S_T5_Psiloi",
}

Def.Projectile_PsiloiTurboFaser = 
{
	
	inherit 			= "Projectile_ManulPlasma",

	
	hit_effect		= "particles/weapons/alien/turbofaser_hit",
	effect 			= "particles/weapons/alien/turbofaser_projectile",
	model 				= "",
	missile_defence_immune	= true,
	impact_type 		= "plasma",

}

Def.Weapon_BasheGun =  
{
	inherit 				= "Weapon_Base",
	class 					= "ChargableGun",
	model					= "models/weapons/gun_bashe/gun_bashe",
	item_subtype			= ItemSubtype.BasheGun,
	weapon_class 		= ai.WeaponClass.PLASMAGUN,
	
	fire_rate 				= 40,
	dispersion				= 0.5,
	
	optimal_range			= 390,
	max_range				= 420,
	
	projectile_speed 		= 250, --380
	damage_emp				= 300,
	
	crit_chance				= 0.05,
	heat_max 				= 100,
	heat_add 				= 8,
	heat_sub 				= 50,
	overheat_time			= 3,
	
	use_charge_crosshair	= true,
	--check_aim_orientation_angle = 90,
	
	
	charge_levels = {
		{
			time = 0,
			projectile = "Projectile_BasheGun_noCharge",
			speed_mul = 0,
			damage_mul = 0,
			heat_add_mul = 0,
		},
		{
			time = 1,
			projectile = "Projectile_BasheGun_Charge1",
			speed_mul = -0.2,
			damage_mul = 2,
			heat_add_mul = 1,
			force_charge_crosshair_max = true,
			ai_optimal = true, --оптимальный уровень зарядки под воздействием ауры HACKED_WEAPON 
		},
		{
			time = 2,
			projectile = "Projectile_BasheGun_Charge2",
			speed_mul = -0.4,
			damage_mul = 5,
			heat_add_mul = 1,

		},
	},

	shot_loop_sound 		= "sound/weapons/ProtozanBlaster/pb_charge",
	shot_beam_fx 		= "particles/weapons/other/bashee_gun_beam",
	charge_effect 		= "particles/weapons/other/bashee_gun_charge",
	muzzleflash_color = { kinetic = "250 170 150 128", emp = "250 170 150 128", thermal = "250 170 150 128", },
	muzzleflash_radius 	= 32,
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,
	required_ship	= "Ship_Race5_H_T5_Bashe",
}

Def.Projectile_BasheGun_noCharge =
{
	class			= "SingularityProjectile",
	in_editor		= false,

	hitbox_min 		= Vec3( -1.5, -1.5, -1.5 ),
	hitbox_max		= Vec3( 1.5, 1.5, 1.5 ),
	damage_radius	= 10,
	impact_type 	= "singularity",
	
	model					= "models/weapons/gun_bashe/gun_bashe",
	
	--spell_on_launch	= "Spell_BasheGun_Cast",
	
	shot_once_sound 			= "sound/weapons/ProtozanBlaster/pb_charged_shot",
	work_sound 	    = "sound/weapons/singularity/sg_fly",
	
	effect 			= "particles/weapons/other/bashee_gun_projectile",
	hit_effect = "particles/weapons/other/fire_emp_hit",	
	singularity_hit_fx = "particles/weapons/other/fire_emp_hit",
	singularity_hit_sound = "sound/hit/singularity_ship",
}

Def.Projectile_BasheGun_Charge1 =
{
	inherit			= "Projectile_BasheGun_noCharge",
	spell_on_launch	= "Spell_BasheGun_Cast1",
}

Def.Projectile_BasheGun_Charge2 =
{
	inherit			= "Projectile_BasheGun_noCharge",
	spell_on_launch	= "Spell_BasheGun_Cast2",
}

Def.Weapon_PerseiGun =
{
	class 				= "SmartRocketLauncher",
	item_subtype		= ItemSubtype.PerseiGun,
	module_type = ai.ModuleType.WEAPON,

	cycle_barrels		= true,
	is_shotgun			= false,
	heat_max 			= 60,
	heat_add 			= 10,
	heat_sub 			= 30,
	overheat_time		= 2,
	fire_rate 			= 16, 
	optimal_range		= 400,
	max_range			= 400,
	
	dispersion			= 0,

	
	projectile 			= "Projectile_PerseiGun",
	shot_once_sound 	= "sound/weapons/PerseiGun/pg_shot",
	projectile_speed	= 240,	
	
	damage_kinetic		= 1500,  -- примерно пересчитаю по фаер рейту  эксперементальному 16/25  с миномета t5mk1
	--damage_emp				= 500,
	--no_friendly_fire 	= true,

	--targeting_beam_fx	= "particles/weapons/machete_laser",
	beam_bone 			= "rocket_1",
	
	--shot_effect = "particles/weapons/smart_muzzle", --New Year 
	shot_effect = "particles/weapons/missile/persei_gun_muzzle",	
	muzzleflash_color = { kinetic = "255 218 185 128", emp = "255 218 185 128", thermal = "255 218 185 128", },
	muzzleflash_radius 	= 6,
	
	default_icon		= "ItemSubtype_PerseiGun",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.TACKLER,
	required_ship	= "Ship_Race3_M_T5_Persei",
}

Def.Projectile_PerseiGun = 
{
	angular_velocity = 35,
	class = "Rocket",
	--is_shrapnel	= true,
	--death_sound = "sound/explosion/small_rocket_expl",
	detonation_radius = 9.5,
	disable_concussion_sound = true,
	effect = "particles/weapons/missile/persei_gun_trail",
	explosion_blast_wave = "BlastWave_PerseiGun",
	
	death_entity		= "PerseiGun_minefield",
	owned_death_entity_max = 1,

	flare_angle = 180,
	flare_color = "255 218 185 15",
	flare_nebulosity = 0.2,
	flare_size = 0.3,
	
	impact_type = "rocket",
	
	in_editor = false,
	missile_defence_immune = true,
	model = "models/weapons/wazgot_station_guns/crystal_torpedo",
	override_blast_wave_damage = true,
	is_guided = true,
	
}

Def.BlastWave_PerseiGun = 
{
	class					= "BlastWave",
	in_editor				= false,
	
	--damage_kinetic			= 1500,
	--damage_emp				= 500,
	blast_maxDistance		= 20,--50,
	light_radius			= 30,
	light_time				= 0.8,
	
	apply_damage			= true,
	apply_shake 			= false,
	
	sound 			= "sound/hit/xo_common",
	class					= "BlastWave",
	
	effect = "particles/explosions/persei_gun_explosion",
	self_damage_coef		= 0, --не дамагаем себя.
	--parent_prototype="SpaceMissile_ProximityMine_T5_Mk1"  -- в коде не нашли, тестим без этого.
}

Def.PerseiGun_minefield =
{
	max_mines			= 4,
	--spell 				= "Spell_ProximityMineGreen",
	time_to_live		= 10,
	period				= 0.2,
	repeat_period 		= 0.2,
	holder_size			= 4,
	field_radius			= 30,
	--empty_holder_cooldown= 120,
	use_team_skin		= true,
	class				= "Minefield",
	stacks				= false,
	default_icon		= "ItemSubtype_PerseiGun",
	explosion_blast_wave= "BlastWave_PerseiGun_minefield",
	
	effect = "particles/explosions/persei_gun_mine_explosion", --SE
	light_color = "255 218 185 200",
	light_radius = 20,
	light_time = "0.4",
	
	uiName					= "PerseiGun_minefield",

	launch_sound = "sound/gadgets/FrigateDrone/fd_launch",
	shot_effect_s1 			= "particles/weapons/persei_gun_mine_deploy_friendly",
	work_effect_s1 			= "particles/weapons/persei_gun_minefield_friendly",
	shot_effect_s2 			= "particles/weapons/persei_gun_mine_deploy",
	work_effect_s2 			= "particles/weapons/persei_gun_minefield",
	death_sound			= "sound/explosion/drone_expl",
	ui_color			= 0xFFEEFFCC,

}

Def.BlastWave_PerseiGun_minefield =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_thermal			= 400,
	blast_maxDistance		= 20,
	apply_damage			= true,
	self_damage_coef		= 1, --не дамагаем себя.
	


	effect 					= "particles/explosions/persei_gun_mine_explosion",
	light_color 			= "255 218 185 200",
	light_radius 			= 10,
	light_time 				= 0.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}

Def.Weapon_FrostRay =
{
	--inherit = "Weapon_LaserGun",
	module_type = ai.ModuleType.WEAPON,
	weapon_class = ai.WeaponClass.PLASMAGUN,
	item_subtype		= ItemSubtype.FrostRay,
		
	class 					= "LaserGun",
	focus_distance			= 10,
	
	fire_rate = 60,
	
	impulse_time = 1,
	dispersion = 0,
	
	optimal_range = 120,
	max_range = 160,
	
	damage_emp = 1800,
	crit_chance				= 0.05,
	crit_damage				= 0.5,
	
	
	spell_on_hit			= "Spell_FrostRay",
	
	heat_max = 10,
	heat_add = 6.6666667,
	heat_sub = 5,
	overheat_time = 1,
	
	model = "models/weapons/lasers/power/l_training",
	default_icon		= "ItemSubtype_FrostRay",
	
	beam_start_fx			= "particles/weapons/laser/radiation_beam_start_pink",
	beam_fx = "particles/weapons/laser/laser_cryolaser",
	hit_effect			= "particles/weapons/special/ice_hit",
	

	
	shot_loop_sound 		= "sound/weapons/laser/radiation",
	hit_loop_sound 			= "sound/hit/laser_loop",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	-- required_role = ai.ShipRoles.TACKLER,
	-- required_ship	= "Ship_Race3_M_T5_Persei",
}

Def.Weapon_BenGun =
{
	inherit = "Weapon_Base",
	class = "AutoGun",
	item_subtype			= ItemSubtype.BenGun,

	cycle_barrels = false,
	
	fire_rate			= 300,	--скорострельнсоть 75
	dispersion			= 0, 	--разброс начальный
	dispersion_add		= 0.8, --увеличение разброса
	dispersion_sub		= 0.6, --снижение разброса после стрельбы
	dispersion_max		= 2.5, --макс. разброс

	max_range			= 420,	--дальность стрельбы 
	projectile_speed 		= 600.0, -- скорость прожектайла , 375
	
	--damage			= 10,
	damage_thermal		= 135,
	crit_chance				= 0.1,
	crit_damage				= 2,
	
	heat_max 			= 10,
	heat_add 			= 2.5,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,

	projectile			= "Projectile_BenGun",

	model			= "models/weapons/rail_guns/econom/rg_training",


	shot_once_sound 	= "sound/weapons/BubbleGun/bg_shot_fast",

	shot_effect 			= "particles/weapons/laser/deimos_laser_muzzle",

	weapon_class = ai.WeaponClass.LASER,
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_BenGun", }, },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,

}

Def.Projectile_BenGun  =
{
	override_blast_wave_damage = false,
	missile_defence_immune = true,
	in_editor = false,
	class = "Projectile",
	--detonation_radius = 3,
	impact_type 		= "plasma",

	flare_angle = 1,
	flare_color = "200 146 170 15",
	flare_nebulosity = 0.2,
	flare_size = 0.2,	
	
	
	effect 			= "particles/weapons/other/follower_drone_projectile",
	hit_effect		= "particles/weapons/blaster/dturret_explosion",
	missile_defence_immune 	= true,
		
	disable_concussion_sound = true,
}

Def.Weapon_RocketGun =
{
	inherit = "Weapon_Base",
	class = "AutoGun",
	item_subtype			= ItemSubtype.RocketGun,

	cycle_barrels = true,
	
	fire_rate			= 20,	--скорострельнсоть 75
	dispersion			= 0.1, 	--разброс начальный
	dispersion_add		= 0.8, --увеличение разброса
	dispersion_sub		= 0.6, --снижение разброса после стрельбы
	dispersion_max		= 2.5, --макс. разброс

	max_range			= 400,	--дальность стрельбы 
	projectile_speed 		= 600.0, -- скорость прожектайла , 375
	
	--damage			= 10,
	damage_kinetic		= 1300,
	crit_chance				= 0.2,
	crit_damage				= 0.25,
	
	heat_max 			= 10,
	heat_add 			= 2.5,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,

	projectile			= "Projectile_RocketGun",

	model			= "models/weapons/rail_guns/econom/rg_training",

	shot_once_sound 	= "sound/weapons/DinoGun/dg_shot",
	shot_effect 		= "particles/weapons/drongun/muzzle",

	weapon_class = ai.WeaponClass.RAILGUN,
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_RocketGun", }, },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	 required_role = ai.ShipRoles.SNIPER,

}

Def.Projectile_RocketGun =
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_RocketGun",
	model				= "models/weapons/bs_torpedo_small",
	override_blast_wave_damage = true,
	detonation_radius	= 10,
	--projectile_speed 	= 300,  
	max_range			= 250,  
	speed 				= 90,
	angular_velocity 	= 110,
	is_guided 			= true,
	
	flare_color			= "255 170 191 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	
	missile_defence_immune = true,
	missile_detection_immune = true,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/missile/rocket_trail_small",
	impact_type 		= "plasma",
}

Def.Blastwave_RocketGun = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 10,
	--constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 18,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	--damage_kinetic 		= 100,

	effect = "particles/weapons/crossout/tank_cannon_hit",
	light_color = "140 140 240 100",
	light_radius = 30,
	light_time = 0.8,
	sound 				= "sound/explosion/SmartRocket_expl",
}

Def.Weapon_GG_RocketRing =
{
	inherit = "Weapon_Base",
	class = "AutoGun",
	item_subtype			= ItemSubtype.GG_RocketRing,
	
	model = "models/weapons/green_aggression_1/green_aggression_1", 
	
	cycle_barrels = true,
	
	fire_rate			= 30,	--скорострельнсоть 75
	dispersion			= 7, 	--разброс начальный
	-- dispersion_add		= 0.8, --увеличение разброса
	-- dispersion_sub		= 0.6, --снижение разброса после стрельбы
	-- dispersion_max		= 2.5, --макс. разброс

	max_range			= 220,	--дальность стрельбы 
	projectile_speed 		= 300,  --300.0, -- скорость прожектайла , 375
	
	--damage			= 10,
	damage_kinetic		= 1300,
	crit_chance				= 0.2,
	crit_damage				= 0.25,
	
	heat_max 			= 10,
	heat_add 			= 2.5,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,

	projectile			= "Projectile_GG_RR1",

	model			= "models/weapons/rail_guns/econom/rg_training",

	shot_once_sound 	= "sound/weapons/DinoGun/dg_shot",
	shot_effect 		= "particles/weapons/missile/alien_rocket_muzzle_guard",

	weapon_class = ai.WeaponClass.RAILGUN,
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_GG_RocketRing", }, },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	 required_role = ai.ShipRoles.GUARD,

}

Def.Projectile_GG_RR1 =
{
	inherit				= "Weapon_BaseRocket",
	model				= "models/weapons/bs_torpedo_big",
	explosion_blast_wave = "Blastwave_GG_RR1",
	explosion_blast_wave_on_hit = "Blastwave_GG_RR2",
	override_blast_wave_damage = true,
	missile_defence_immune = true,	
	missile_detection_immune = true,
	detonation_timeout	= 0.1,

	--spell 				= "CalibrationGrenade",
	detonation_radius	= 1,

	--detonate_on_distance= 10,  -- показывает, на каком расстоянии до цели или точки в пространстве ракета должна сдетонировать.
	is_guided 			= true,
	angular_velocity 	= 30,
	
	child_rockets =
	{
	    rocket = "Projectile_GG_RR2",
	    --rocket = "SpaceMissile_Standart_T1_Mk1",

	    sphere_radius = 3, -- опционально
	    
	    -- расположение ракет на поверхности сферы вокруг родительской ракеты в момент старта.
	    -- Общее количество ракет не должно превышать 20
	    scheme = {
	        circle0 = { amount = 3, angle = 0.2, },
	        --circle1 = { amount = 3, angle = 7, }, -- опционально
	        --circle1 = { amount = 12, angle = 1, }, -- опционально
	        --circle3 = { amount = 6, angle = 120, }, -- опционально
	    },

	    --описание целей для управляемых ракет. Поддерживается не более 10 целей
	    direct_to_target = {
	        class = ai.SpellTargetClass.SHIP,
	        area = ai.SpellTargetArea.AROUND,
	        relationship = ai.SpellTargetRelationship.ENEMY,
			misc			= ai.SpellTargetMisc.NOT_CLOAKED,
	    },
	    direct_range = 400, -- радиус поиска целей для управляемых ракет
	    max_rockets_per_target = 3, -- количество управляемых ракет на одну цель
	    
	},

	flare_color			= "182 187 234 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect 				= "particles/weapons/missile/rocket_trail_alien_guard",
	work_sound			= "sound/gadgets/Vortex/vortex_fly",
}

Def.Projectile_GG_RR2 =
{
	inherit				= "Weapon_BaseRocket",
	explosion_blast_wave = "Blastwave_GG_RR2",
	model				= "models/weapons/wazgot_station_guns/crystal_torpedo",
	override_blast_wave_damage = true,
	detonation_radius	= 10,
	--projectile_speed 	= 300,  
	max_range			= 400,  
	speed 				= 800,  --700
	angular_velocity 	= 120,
	is_guided 			= false,
	
	flare_color			= "182 187 234 30",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",
	effect 				= "particles/weapons/missile/rocket_trail_alien_guard_small",
	impact_type 		= "plasma",
}

-- взрыв-эффект для красоты при распаде. Иначе доп. урон наносился, если ракета распадалась в радиусе взрыва. Убрал звук, как ненужное
Def.Blastwave_GG_RR1 = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 0,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 0,
	self_damage_coef	= 0,

	apply_damage		= false,
	apply_shake 		= false,
	apply_torque		= false,

	effect = "particles/explosions/alien_explosion_missile_blue",
	light_color = "140 140 240 100",
	light_radius = 15,
	light_time = 0.8,
	--sound 				= "sound/explosion/small_rocket_expl",
}

Def.Blastwave_GG_RR2 = 
{
	class				= "BlastWave",
	in_editor			= false,

	blast_minDistance	= 16,
	constant_damage		= false, --blast_minDistance работает с этим флагом (false) онли
	blast_maxDistance	= 17,
	self_damage_coef	= 0,

	apply_damage		= true,
	apply_shake 		= false,
	apply_torque		= false,

	--damage_kinetic 		= 100,

	effect = "particles/explosions/alien_explosion_missile_blue",
	light_color = "140 140 240 100",
	light_radius = 17,
	light_time = 0.8,
	sound 				= "sound/explosion/small_rocket_expl",
}

Def.Weapon_GG_BubbleGun =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	module_type				= ai.ModuleType.WEAPON,	
	item_subtype			= ItemSubtype.GG_BubbleGun,
	
	model = "models/weapons/green_aggression_3/green_aggression_3",
	
	weapon_class = ai.WeaponClass.PLASMAGUN,
	
	projectile				= "Projectile_GG_BubbleGun",	
	
	fire_rate				= 60,
	cycle_barrels 			= true,
	no_friendly_fire		= true,
	override_blast_wave_damage = true,

	dispersion				= 0.3,
	optimal_range			= 330,
	max_range				= 300,
	projectile_speed		= 140,
	
	damage_emp				= 1250,
	crit_chance				= 0.05,
	crit_damage				= 0.2,
	
	spell_on_hit			= "Spell_GG_BubbleGun",	
		
	heat_max				= 10,
	heat_add				= 1.04,
	heat_sub				= 5,
	overheat_time			= 1,
	
	shot_effect 		= "particles/weapons/alien/bubblegun_muzzle",
	muzzleflash_color = { kinetic = "160 255 160 255", emp = "160 255 160 255", thermal = "160 255 160 255", },
	muzzleflash_radius 	= 6,
	shot_once_sound 		= "sound/weapons/suppress/suppr",
	
	default_icon	= "ItemSubtype_GG_BubbleGun",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	 required_role = ai.ShipRoles.GUARD,
}

Def.Projectile_GG_BubbleGun =
{
	--inherit				= "Projectile_Plasma_Light",
	class				= "SingularityProjectile",
	hitbox_min 		= Vec3( -1.5, -1.5, -1.5 ),
	hitbox_max		= Vec3( 1.5, 1.5, 1.5 ),
	damage_radius	= 3,
	--explosion_blast_wave	= "Blastwave_BubbleGunBubbleBlast",
	override_blast_wave_damage = true,
	missile_defence_immune 	= true,
	missile_detection_immune= true,
	disable_concussion_sound = true,

	shot_once_sound = "sound/weapons/BubbleGun/bg_shot_slow",
	
	-- angular_velocity	= 140,
	-- is_guided			= true,
	-- time_to_live		= 7,
		
	effect 				= "particles/weapons/alien/bubblegun_proj",
	hit_effect			= "particles/weapons/alien/bubblegun_proj_hit",
	
	detonation_radius		= 1,
	
	flare_color				= "55 50 250 0",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
}

Def.Weapon_HellasKinetLaser = 
{
	class = "LaserGun",

	module_type = ai.ModuleType.WEAPON,
	item_subtype	= ItemSubtype.HellasKinetLaser,
	
	crit_chance = 0.05,
	crit_damage = 0.3,
	damage_kinetic = 140,

	dispersion = 0.9,

	-- fire_rate = 300,
	-- impulse_time = 0.5,
	
		fire_rate = 180,
	impulse_time = 0.9,
	
	
	heat_max = 10,
	heat_add = 3,
	heat_sub = 10,
	overheat_time = 1.5,

	cycle_barrels 		= true, -- false  true
	
	impact_type = "laser",

	track 					= ai.TrackMode.AIM,
	max_aim_yaw				= 5,  -- (в градусах)
	max_aim_pitch  			= 5,  --(в градусах). 
	
	spell_on_equip	= "Spell_HallasKinetLaser_OnEquip",
	


	muzzleflash_radius = 20,
	muzzleflash_color = { kinetic = "255 114 82 64", emp = "255 114 82 64", thermal = "255 114 82 64", },

	beam_fx 		= "particles/weapons/laser/katalina_beam",
	fire_fx 		= "particles/weapons/laser/katalina_beam_muzzle",
	hit_fx		= "particles/weapons/laser/katalina_beam_hit",
	
	max_range = 320,
	optimal_range = 320,
	-- damage_radius	= 1,
	-- focus_distance = 30,
	
	weapon_class = ai.WeaponClass.RAILGUN,
	spell_on_hit = "Spell_HallasKinetLaser",
	
	
	model="models/weapons/hadrian_gun/hadrian_gun",
	hit_loop_sound = "sound/hit/laser_loop",
	shot_once_sound = "sound/weapons/laser/econ",
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_HellasKinetLaser", }, },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.ENGINEER,
	required_ship	= "Ship_Race3_L_T5_Hellas",
}

Def.Weapon_AmberSlowGun =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	
	module_type				= ai.ModuleType.WEAPON,	
	item_subtype			= ItemSubtype.AmberSlowGun,
	
	model			= "models/weapons/gun_amber/gun_amber",
	
	weapon_class = ai.WeaponClass.LASER,
	
	projectile				= "Projectile_AmberSlowGun",	
	
	fire_rate				= 100,
	
	cycle_barrels 			= true,
	no_friendly_fire		= true,
	--override_blast_wave_damage = true,

	dispersion				= 0.3,
	optimal_range			= 330,
	max_range				= 300,
	projectile_speed		= 200,
	
	damage_thermal			= 330,
	crit_chance				= 0.05,
	crit_damage				= 0.2,
		
	heat_max				= 8,
	heat_add				= 1,
	heat_sub				= 5,
	overheat_time			= 1,
	
	shot_effect 		= "particles/weapons/missile/slowgun_muzzle",
	muzzleflash_color = { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 	= 8,
	shot_once_sound 		= "sound/weapons/suppress/suppr",
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_AmberSlowGun", }, },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.TACKLER,
	required_ship	= "Ship_Race5_M_T5_Amber",
}

Def.Projectile_AmberSlowGun = -- большой, но рассеянный и слабый
{
	class						= "Rocket",

	override_blast_wave_damage	= true,
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	disable_concussion_sound	= true,

	spell_on_launch		= "Spell_AmberSlowGun",
	detonation_radius			= 12,
	explosion_blast_wave		= "Blastwave_AmberSlowGun",		
	shot_once_sound 			= "sound/weapons/RavenGun/rg_shot_fast",
	
	flare_color					= "255 205 5 0",
	flare_size					= 0.0,
	flare_angle					= 180,
	flare_nebulosity			= 0.1,

	work_sound 	    			= "sound/weapons/chargeblast/cb_fly",
	
	model				= "models/weapons/bs_torpedo_mid",
	effect 						= "particles/weapons/missile/slowgun_trail",
	impact_type 				= "rocket",
}

Def.Blastwave_AmberSlowGun =
{
	class						= "BlastWave",
	in_editor					= false,

	blast_maxDistance			= 12,
	apply_damage				= true,
	apply_shake 				= false,
	
	
	self_damage_coef			= 0,

	effect 				= "particles/explosions/slowgun_explosion",
	light_color 		= "205 55 20 100",
	light_radius 		= 11,
	light_time 			= 0.2,
	sound 						= "sound/explosion/SmartRocket_expl",
}

Def.SpaceMissile_DisMissile = 
{

	inherit			= "Weapon_BaseRocket",
	class			= "Rocket",
	module_type		= ai.ModuleType.ROCKET,
	item_subtype	= ItemSubtype.DisMissile,
	
	max_range			= 400,  
	speed 				= 100,
	--angular_velocity 	= 68,
	is_guided 			= false,
	
	alien_damage_coef	= 60,	
	
	flare_color			= "255 170 191 0",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	effect = "particles/weapons/missile/rocket_trail_med_dismissile",
	rocket_direct_hit_sound = "sound/hit/rocket_direct_hit",
	smooth_effect_param = true,
	reflection_immune	= false,
	
	work_sound					= "sound/weapons/smartRocket/smr_fly",
		
	cooldown			= 10,
	holder_size			= 3,
	empty_holder_cooldown = 120,
	
	model 				= "models/weapons/missile_rocket",
	MunitionBayType		= ai.MunitionBayType.MBT_SECONDARY,
	--explosion_blast_wave	= "BlastWave_ProximityMineGreen",
	
	--death_entity		= "Drone_DisMissile",
	
	explosion_blast_wave= "BlastWave_DisMissile",
	
	spell				= "Spell_DisMissile3",
	
	--uiName	= "DisMissile",
	
}

Def.BlastWave_DisMissile = {

	damage_emp			= 15000,
	blast_maxDistance		= 30,--50,
	light_radius			= 30,
	light_time				= 0.8,
	sound 					= "sound/explosion/SmartRocket_expl",
	class					= "BlastWave",
	self_damage_coef		= 1, --не дамагаем себя.
	effect 				= "particles/explosions/dismissile_explosion",
	
}

Def.Weapon_CinquedeaPlasmaGun =
{
	inherit 				= "Weapon_Base",
	class 					= "AutoGun",
	
	module_type				= ai.ModuleType.WEAPON,	
	item_subtype			= ItemSubtype.CinquedeaPlasmaGun,
	
	model			= "models/weapons/gun_dagger/gun_dagger",
	
	weapon_class = ai.WeaponClass.PLASMAGUN,
	
	projectile				= "Projectile_CinquedeaPlasmaGun",	
	
	fire_rate				= 200,
	
	cycle_barrels 			= true,
	no_friendly_fire		= true,
	--override_blast_wave_damage = true,

	dispersion				= 0.3,
	optimal_range			= 330,
	max_range				= 400,
	projectile_speed		= 700,
	
	damage_emp				= 270,
	crit_chance				= 0.05,
	crit_damage				= 0.75,
	
	shot_energy_cost		= 10,
	
	spell_on_hit			= "Spell_CinquedeaPlasmaGun",
	
	shot_effect = "particles/weapons/plasma/plasma_compressor_muzzle",
	muzzleflash_color = { kinetic = "255 226 178 100", emp = "255 226 178 100", thermal = "255 226 178 100", },
	muzzleflash_radius 	= 8,
	shot_once_sound 		= "sound/weapons/suppress/suppr",
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_CinquedeaPlasmaGun", }, },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.ECM,
	required_ship	= "Ship_Race2_S_T5_Cinquedea",
}

Def.Projectile_CinquedeaPlasmaGun =
{
	class			= "Projectile",
	
	hitbox_min 		= Vec3( -0.1, -0.1, -0.1 ),
	hitbox_max		= Vec3( 0.1, 0.1, 0.1 ),
	
	effect 					= "particles/weapons/plasma/plasma_electric_projectile",
	hit_effect = "particles/weapons/plasma/plasma_compressor_hit",
	hit_shield_effect = "particles/weapons/plasma/plasma_compressor_hit",
	hit_ship_effect = "particles/weapons/plasma/plasma_compressor_hit",
	
	--damage_to_spell_aura_param = true,
	
	flare_color				= "42 255 72 45",
	flare_size				= 0.0,
	flare_angle				= 180,
	flare_nebulosity		= 0.1,
}

Def.Weapon_CarolCannon = 
{
	
	inherit = "Weapon_Artillery",
	class 					= "AutoGun",
	module_type				= ai.ModuleType.WEAPON,	
	item_subtype			= ItemSubtype.CarolCannon,
	
	model			= "models/weapons/gun_dagger/gun_dagger",
	
	weapon_class = ai.WeaponClass.RAILGUN,
	
	fire_rate				= 50,
	
	cycle_barrels 			= true,
	no_friendly_fire		= true,
	--override_blast_wave_damage = true,

	dispersion				= 0.3,
	optimal_range			= 500,
	max_range				= 500,
	projectile_speed		= 400,
	
	damage_kinetic				= 270,
	
	crit_chance				= 0.15,
	crit_damage				= 0.75,
	

	
	heat_max				= 12,
	heat_add				= 3,
	heat_sub				= 4,

	projectile	= "Projectile_CarolCannon",
	
	shot_once_sound = "sound/weapons/xo/big_cannon_shot",
	muzzleflash_color = { kinetic = "255 230 181 255", emp = "255 230 181 255", thermal = "255 230 181 255", },
	muzzleflash_radius 	= 30,
	shot_effect 		= "particles/weapons/artillery_big_muzzle",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	required_role = ai.ShipRoles.SNIPER,
	required_ship	= "Ship_Race2_L_T5_Carolingian",
}

Def.Projectile_CarolCannon =
{
	inherit				= "Projectile_Artillery",
	explosion_blast_wave	= "Blastwave_CarolCannon",
	work_sound 		= "sound/weapons/xo/bullet_fly",
	--model 				= "models/weapons/bs_torpedo_mid",
	
	spell_on_crit					= "Spell_CarolCannon",
	
	flare_color			= "255 214 155 25",
	flare_size			= 0.05, --0.15
	flare_angle			= 180,
	flare_nebulosity	= 1.0,
	effect 				= "particles/weapons/devostrator_trail",
}

Def.Blastwave_CarolCannon = 
{
	inherit				= "Blastwave_Artillery_Base",
	blast_maxDistance	= 30,
	sound 			= "sound/hit/xo_common",
	light_color 		= "255 239 195 120",
	light_radius 		= 20,
	light_time 			= 0.8,
	effect 				= "particles/weapons/crossout/tank_cannon_hit",
}

Def.Weapon_AceGun =
{
	inherit				= "Weapon_Base",
	class 				= "AutoGun",
	weapon_class 		= ai.WeaponClass.PLASMAGUN,
	item_subtype		= ItemSubtype.AceGun,
	
	crit_chance			= 0.2,
	crit_damage 		= 0.5,
	
	damage_emp 			= 636,

	dispersion 			= 1.8,
	dispersion_add		= -0.4,
	dispersion_max		= 0.4,
	dispersion_sub		= -0.5,

--	barrel_rot_speed	= 30,
	
	fire_rate 			= 200,

	
	heat_add 			= 2,
	heat_max 			= 10,
	heat_sub 			= 6.6666,
	overheat_time 		= 1.5,
	
	max_range 			= 220,
	optimal_range 		= 220,
	
	track 					= ai.TrackMode.AIM,
	max_aim_yaw				= 4,  -- (в градусах)
	max_aim_pitch  			= 4,  --(в градусах). 	

	
	cycle_barrels 		= true,
	projectile				= "Projectile_AceGun",
	projectile_speed 	= 655,

	model				= "models/weapons/gun_ghost/gun_ghost",
	shot_once_sound = "sound/weapons/plasmagun/sniper",
	
	default_custom_elements = {
		[ai.VesselCustomSlot.MATERIAL_0]="Default_Race3_s_ghost_r1",
		[ai.VesselCustomSlot.MATERIAL_1]="Default_Race3_s_ghost_g1",
		[ai.VesselCustomSlot.MATERIAL_2]="weapons_ghost_b1",
	},
	
	muzzleflash_color = { kinetic = "160 182 255 155", emp = "160 182 255 155", thermal = "160 182 255 155", },
	muzzleflash_radius 	= 5,
	shot_effect = "particles/weapons/plasma/muzzle_small",
	oriented_shot_effects = true,
	
	default_icon				= "ItemSubtype_AceGun",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	 class_mask=ai.ShipClass.SMALL,
	 required_role = ai.ShipRoles.RECON,
	 required_ship	= "Ship_Race5_S_T5_Ace",
	
}

Def.Projectile_AceGun =
{
	inherit				= "Projectile_BigCannon",
	model 				= "models/misc/invisible_model",
	detonation_radius	= 5,
	explosion_blast_wave	= "Blastwave_AceGun",
	is_guided		= true,
	angular_velocity	= 10,
	missile_defence_immune = true,
	missile_detection_immune = true,
	work_sound 		= "sound/weapons/xo/bullet_fly",
	flare_color			= "60 112 155 25",
	flare_size			= 0.05, --0.15
	flare_angle			= 180,
	flare_nebulosity	= 1.0,
	effect = "particles/weapons/plasma/plasma_small_projectile",
}


Def.Blastwave_AceGun =
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 12,
	class = "BlastWave",
	effect = "particles/explosions/plasma_explosion_blue",
	in_editor = false,
	light_color = "40 140 240 100",
	light_radius = 20,
	light_time = 0.8,
	sound = "sound/explosion/PlasmaVolley_expl",
	sound_combine_dist = 10,
	sound_combine_time = 0.1,
	self_damage_coef	= 0,
}

Def.Weapon_UBallLaser = 
{
	class = "LaserGun",

	module_type = ai.ModuleType.WEAPON,
	item_subtype	= ItemSubtype.UBallLaser,
	weapon_class = ai.WeaponClass.LASER,
	
	crit_chance = 0.05,
	crit_damage = 0.3,
	damage_thermal = 500,

	dispersion = 0,

	
	fire_rate = 60,
	impulse_time = 1, -- мерцающий лазер при значении < 1
	
	
	heat_max = 12,
	heat_add = 3,
	heat_sub = 6,
	overheat_time = 1.5,

	cycle_barrels 		= false, -- false  true
	
	impact_type = "laser",

	-- track 					= ai.TrackMode.AIM,
	-- max_aim_yaw				= 180,  -- (в градусах)
	-- max_aim_pitch  			= 180,  --(в градусах). 
	
	--spell_on_equip	= "Spell_HallasKinetLaser_OnEquip",
	
	max_range = 180,
	optimal_range = 180,
	
	max_range_max = 500, --600, --500,
	max_range_add = 50, --120, --100,
	optimal_range_max = 500, --400, --375.6,
	optimal_range_add = 50, --80, --75.2,

	
	spell_on_hit = "Spell_UFOBall_Laser",
	spell_on_hit_timeout = 1,
	spell_on_hit_streak_time = 3,
	
	shot_loop_sound 		= "sound/weapons/laser/radiation",
	hit_loop_sound 			= "sound/hit/laser_loop",
	
	--focus_distance			= 20,
	
	beam_start_fx			= "particles/weapons/laser/radiation_beam_start",
	beam_fx 				= "particles/weapons/laser/radiation_beam",
	hit_fx 					= "particles/weapons/laser/radiation_beam_hit",
	
	
	damage_color	  = { kinetic = ai.DONT_INHERIT, emp = ai.DONT_INHERIT, thermal = "255 255 255 255", },
	muzzleflash_color = { kinetic = "255 100 100 0", emp = "255 100 100 0", thermal = "255 100 100 0", },
	muzzleflash_radius = 20,
	
	model="models/weapons/hadrian_gun/hadrian_gun",
	
	ui_ico 			= { target_system 	= { tex = "ItemSubtype_HellasKinetLaser", }, },
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race5_M_T5_Apeiron",
}

Def.Weapon_UballFWarrior =
{
	inherit				= "Weapon_Base",
	class 				= "AutoGun",
	weapon_class 		= ai.WeaponClass.LASER,
	item_subtype		= ItemSubtype.UballFWarrior,
	
	crit_chance			= 0.05,
	crit_damage 		= 0.5,
	
	damage_thermal		= 75,

	dispersion 			= 1.8,
	dispersion_add		= -0.4,
	dispersion_max		= 0.4,
	dispersion_sub		= -2,

--	barrel_rot_speed	= 30,
	
	fire_rate 			= 100,

	heat_max 			= 12,	
	heat_add 			= 1.5,
	heat_sub 			= 6,
	overheat_time 		= 4,
	
	max_range 			= 420,
	optimal_range 		= 420,
	
	cycle_barrels 		= true,
	
	projectile				= "Projectile_UBallFWarrior",
	projectile_speed 	= 300,
	projectile_speed_add = 300,
	projectile_speed_max = 3000,

	model				= "models/weapons/gun_ghost/gun_ghost",
	shot_once_sound = "sound/weapons/plasmagun/sniper",
	
	default_custom_elements = {
		[ai.VesselCustomSlot.MATERIAL_0]="Default_Race3_s_ghost_r1",
		[ai.VesselCustomSlot.MATERIAL_1]="Default_Race3_s_ghost_g1",
		[ai.VesselCustomSlot.MATERIAL_2]="weapons_ghost_b1",
	},
	
	muzzleflash_color = { kinetic = "255 172 172 100", emp = "255 172 172 100", thermal = "255 172 172 100", },
	muzzleflash_radius 	= 5,
	
	shot_effect = "particles/weapons/kinetic_gun_muzzle",
	oriented_shot_effects = true,
	
	default_icon				= "ItemSubtype_UballFWarrior",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race5_M_T5_Apeiron",
	
}

Def.Projectile_UBallFWarrior =
{
	apply_shake = false,
	class = "Projectile",
	effect 				= "particles/weapons/blaster/ballgun_projectile",
	
	fixedInheritance = true,
	hit_effect				= "particles/weapons/blaster/prometheus_explosion",

	hitbox_max = Vec3( 0.2000, 0.2000, 0.2000 ),
	hitbox_min = Vec3( -0.2000, -0.2000, -0.2000 ),
	impact_type = "plasma",
	in_editor = false,
	inherit = "Projectile_Plasma_Default",
	mass = 0.05,
	shadowCaster = false,
}

Def.Weapon_SaturnChargableGun = 
{
	inherit 			= "Weapon_Base",
	class 				= "ChargableGun",
	model				= "models/weapons/gun_destroyerring/gun_destroyerring",
	item_subtype			= ItemSubtype.SaturnChargableGun,
	weapon_class 		= ai.WeaponClass.PLASMAGUN,

	fire_rate 			= 60,
	dispersion			= 0,
	
	crit_chance			= 0.05,
	crit_damage			= 0.75,
	
	optimal_range		= 480,
	max_range			= 480,
	
	projectile_speed 	= 20,
	
	no_friendly_fire 	= true,
	

	damage_emp		= 10,

	
	heat_max 			= 12,
	heat_add 			= 1.5,
	heat_sub 			= 12,
	overheat_time		= 2,
	
	muzzleflash_color = { kinetic = "125 147 255 255", emp = "125 147 255 255", thermal = "125 147 255 255", },
	muzzleflash_radius 	= 30,
	use_charge_crosshair	= false,
	charge_levels 		= {
		{ time = 0, projectile = "Projectile_SaturnChargableGun_Fast", speed_mul = 46.5, damage_mul = 29, heat_add_mul = 0, force_prediction = false, },
		{ time = 1, projectile = "Projectile_SaturnChargableGun_Slow", speed_mul = 0, damage_mul = 0, heat_add_mul = 0.5, speed_mul = 3, ai_optimal=true, force_prediction = true, force_charge_crosshair_max = true, },
	},
	explosion_mul 		= 0,

	--shot_once_sound = "sound/weapons/singularity/sg_shot",
	shot_beam_fx 		= "particles/weapons/mid/saturn_beam",
	shot_effect 		= "particles/empty",
	
	default_icon				= "ItemSubtype_SaturnChargableGun",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,
	
}

Def.Weapon_SaturnChargableGunT5 = 
{
	inherit 			= "Weapon_SaturnChargableGun",
	charge_levels 		= {
		{ time = 0, projectile = "Projectile_SaturnChargableGun_Fast", speed_mul = 54, damage_mul = 39, heat_add_mul = 0, force_prediction = false,  },
		{ time = 1, projectile = "Projectile_SaturnChargableGun_SlowT5", speed_mul = 0, damage_mul = 0, heat_add_mul = 0.5, speed_mul = 3, ai_optimal=true, force_prediction = true, force_charge_crosshair_max = true, },
	},	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.HUGE,
	required_role = ai.ShipRoles.OVERSEER,	
}	


Def.Projectile_SaturnChargableGun_Fast =
{
	class			= "Rocket",
	--impact_type 	= "singularity",

	
	--physics			= { solid_type = solid.sphere, kinematic = true, material = "Metal" },
	
	override_blast_wave_damage = true,
	missile_defence_immune 	= true,
	missile_detection_immune= true,

	hitbox_max			= Vec3(0.5, 0.5, 0.5),
	hitbox_min			= Vec3(-0.5, -0.5, -0.5),
	
	detonation_radius		= 15,
	impact_type 		= "rocket",	
	
	explosion_blast_wave 		= "Blastwave_SaturnChargableGun_Base",

	hit_effect		= "particles/empty",

	effect 			= "particles/null",
	shot_once_sound = "sound/weapons/chargegun/cg_shot_fast",
	singularity_hit_sound = "sound/weapons/chargegun/cg_shot_slow",
	flare_size		= 0.0,
}

--
Def.Projectile_SaturnChargableGun_Slow =
{
	class			= "SingularityProjectile",
	impact_type 	= "singularity",
	
	--physics			= { solid_type = solid.sphere, kinematic = true, material = "Metal" },
	
	hitbox_min 		= Vec3( -1.5,		-1.5,		-1.5 ),
	hitbox_max		= Vec3( 1.5, 		1.5, 		1.5 ),
	
	spell_on_launch = "Spell_SaturnChargableGun",
	
	damage_radius	= 0,
	shot_once_sound = "sound/weapons/chargegun/cg_shot_slow",
	singularity_hit_sound = "sound/weapons/chargegun/cg_shot_slow",
	effect 				= "particles/weapons/mid/saturn_big_projectile",
	hit_effect		= "particles/empty",
}

Def.Projectile_SaturnChargableGun_SlowT5 =
{
	class			= "SingularityProjectile",
	impact_type 	= "singularity",
	
	--physics			= { solid_type = solid.sphere, kinematic = true, material = "Metal" },
	
	hitbox_min 		= Vec3( -1.5,		-1.5,		-1.5 ),
	hitbox_max		= Vec3( 1.5, 		1.5, 		1.5 ),
	
	spell_on_launch = "Spell_SaturnChargableGunT5",
	
	damage_radius	= 0,
	shot_once_sound = "sound/weapons/chargegun/cg_shot_slow",
	singularity_hit_sound = "sound/weapons/chargegun/cg_shot_slow",
	effect 				= "particles/weapons/mid/saturn_big_projectile",
	hit_effect		= "particles/empty",
}

Def.Blastwave_SaturnChargableGun_Base =
{
	class				= "BlastWave",
	in_editor			= false,

	--damage_thermal		= 10000,
	--intensity 			= 0,
	--blast_minDistance	= 55,
	blast_maxDistance	= 10,
	apply_damage		= true,
	apply_shake 		= false,
	apply_torque 			= false,
	self_damage_coef	= 0,

	effect 				= "particles/weapons/mid/saturn_explosion",
	light_color 		= "125 147 255 255",
	light_radius 		= 25,
	light_time 			= 0.7,
	sound 				= "sound/explosion/chargegun_expl",
}

Def.Weapon_AthlantaBall =
{
	inherit				= "Weapon_Base",
	class 				= "AutoGun",
	weapon_class 		= ai.WeaponClass.PLASMAGUN,
	item_subtype		= ItemSubtype.AthlantaBall,
	
	crit_chance			= 0.05,
	crit_damage 		= 0.5,
	
	damage_emp 			= 3000,

	dispersion 			= 1.2,
	dispersion_add		= 0,
	dispersion_max		= 0,
	dispersion_sub		= 0,

--	barrel_rot_speed	= 30,
	
	fire_rate 			= 25,

	
	heat_add 			= 3,
	heat_max 			= 12,
	heat_sub 			= 6,
	overheat_time 		= 2,
	
	max_range 			= 220,
	optimal_range 		= 220,
	
	
	cycle_barrels 		= true,
	projectile				= "Projectile_AthlantaBall",
	projectile_speed 	= 60,

	model				= "models/weapons/singularity_cannon/singularity_cannon_4",
	shot_once_sound 		= "sound/weapons/aliengun/ag_shot",
	
	-- default_custom_elements = {
		-- [ai.VesselCustomSlot.MATERIAL_0]="weapons_additional1_r1",
		-- [ai.VesselCustomSlot.MATERIAL_1]="weapons_additional1_g1",
		-- [ai.VesselCustomSlot.MATERIAL_2]="weapons_additional1_b5",
	-- },
	
	muzzleflash_color = { kinetic = "160 182 255 155", emp = "160 182 255 155", thermal = "160 182 255 155", },
	muzzleflash_radius 	= 5,
	shot_effect = "particles/weapons/plasma/muzzle_small",
	oriented_shot_effects = true,
	
	default_icon				= "ItemSubtype_AthlantaBall",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	 class_mask=ai.ShipClass.SMALL,
	 -- required_role = ai.ShipRoles.RECON,
	 -- required_ship	= "Ship_Race5_S_T5_Ace",
	
}

Def.Projectile_AthlantaBall =
{
	inherit				= "Projectile_BigCannon",
	model 				= "models/misc/invisible_model",
	detonation_radius	= 5,
	explosion_blast_wave	= "Blastwave_AthlantaBall",
	is_guided		= true,
	angular_velocity	= 15,
	missile_defence_immune = true,
	missile_detection_immune = true,
	work_sound 	    			= "sound/weapons/chargeblast/cb_fly",
	flare_color			= "60 112 155 25",
	flare_size			= 0.05, --0.15
	flare_angle			= 180,
	flare_nebulosity	= 1.0,
	effect 			= "particles/weapons/alien/alien_gun_projectile",
}


Def.Blastwave_AthlantaBall =
{
	apply_damage = true,
	apply_shake = true,
	blast_maxDistance = 12,
	class = "BlastWave",
	--effect = "particles/explosions/plasma_explosion_blue",
	effect = "particles/explosions/alien_plazma_explosion",
	in_editor = false,
	light_color = "40 240 40 100",
	light_radius = 20,
	light_time = 0.8,
	--sound = "sound/explosion/PlasmaVolley_expl",
	sound							= "sound/explosion/omegaB_expl",
	sound_combine_dist = 10,
	sound_combine_time = 0.1,
	self_damage_coef	= 0,
}

Def.Weapon_AthlantaRail = 
{
	inherit 			= "Weapon_Base",
	class 				= "ChargableGun",
	model				= "models/weapons/gun_destroyerring/gun_destroyerring",
	item_subtype			= ItemSubtype.AthlantaRail,
	weapon_class 		= ai.WeaponClass.RAILGUN,

	fire_rate 			= 60,
	dispersion			= 0,
	
	crit_chance			= 0.05,
	crit_damage			= 0.75,
	
	optimal_range		= 450,
	max_range			= 450,
	
	projectile_speed 	= 100,
	
	no_friendly_fire 	= true,
	

	damage_kinetic		= 1000,

	
	heat_max 			= 12,
	heat_add 			= 1.5,
	heat_sub 			= 12,
	overheat_time		= 2,
	
	muzzleflash_color = { kinetic = "198 189 255 196", emp = "198 189 255 196", thermal = "198 189 255 196", },
	muzzleflash_radius 	= 20,

--	charge_max					= 3,
	use_charge_crosshair	= false,
	charge_levels 		= {
		{ time = 0, projectile = "Projectile_AthlantaRail", speed_mul = 0, damage_mul = 0, heat_add_mul = 0, ai_optimal=false, force_prediction = false, },
		{ time = 1, projectile = "Projectile_AthlantaRail", speed_mul = 9, damage_mul = 0.5, heat_add_mul = 0.5, force_prediction = true, ai_optimal = true, },
	},
	explosion_mul 		= 0,
	override_blast_wave_damage	= true,	
	
	--spell_on_hit		= "Spell_CinquedeaPlasmaGun",

	shot_effect				= "particles/weapons/railgun/muzzle_realistic",
	shot_beam_fx 	        = "particles/weapons/other/proto_beam",
	shot_once_sound			= "sound/weapons/KineticFloat/KineticFloatingCrit",
	
	default_icon				= "ItemSubtype_AthlantaRail",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.LARGE,
	
}

Def.Projectile_AthlantaRail =
{
	inherit					= "Projectile_BasicRailgun",
	class					= "Rocket",
	model					= "models/misc/invisible_model",
	explosion_blast_wave	= "Blastwave_AthlantaRail",
	effect					= "particles/weapons/railgun/railgun_fast_projectile",
--	effect = "particles/gadget/special/pilum_module_projectile",
	
	
	spell					= "Spell_AthlantaRail",

	override_blast_wave_damage	= true,

	missile_defence_immune 	= true,
	missile_detection_immune= true,	
	disable_concussion_sound = false,
	
	flare_color			= "255 235 180 10",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,
	
	hitbox_max 				= Vec3( 0.25, 0.25, 0.25 ),
	hitbox_min 				= Vec3( -0.25, -0.25, -0.25 ),
	hit_effect				= "particles/weapons/railgun/hit",
	hit_ship_effect 		= "particles/weapons/railgun/hit_ship",
	hit_shield_effect 		= "particles/weapons/railgun/hit_ship",
	hit_crit_ship_effect 	= "particles/weapons/railgun/hit_crit",
	hit_crit_shield_effect 	= "particles/weapons/railgun/hit_crit_shield",
}

Def.Blastwave_AthlantaRail =
{
	class = "BlastWave",
	blast_maxDistance = 10,
	in_editor = false,
	self_damage_coef	= 0,
}

Def.Weapon_AthlantaBlaster =
{
	inherit 		= "Weapon_Base",
	class 			= "AutoGun",
	item_subtype			= ItemSubtype.AthlantaBlaster,
	weapon_class 		= ai.WeaponClass.LASER,
	cycle_barrels 		= true,
	
	crit_chance				= 0.07,
	crit_damage				= 0.5,
	
	damage_thermal			= 200,
	dispersion				= 0.5,
	
	fire_rate				= 125,
	heat_add				= 4,
	heat_max				= 10,
	heat_sub				= 4,
	overheat_time			= 1.5,
	
	optimal_range			= 350,
	max_range				= 350,
	projectile				= "Projectile_AthlantaBlaster",
	projectile_speed		= 800,
	
	muzzleflash_color = { kinetic = "200 60 50 64", emp = "200 60 50 64", thermal = "200 60 50 64", },
	----
	model					= "models/weapons/ion_emitter/ion_mod2",
	----
	shot_effect				= "particles/weapons/blaster/overheating_laser_muzzle",
	shot_once_sound			= "sound/weapons/laser/OverheatingLaser",
	spell_on_hit			= "Spell_AthlantaBlaster",
	
	default_icon				= "ItemSubtype_AthlantaBlaster",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,	
}

Def.Projectile_AthlantaBlaster =
{
	inherit			= "Projectile_Nail_Default",
	effect			= "particles/weapons/blaster/overheating_laser_projectile",
	impact_type = "railgun",
	hit_effect			= "particles/weapons/blaster/overheating_laser_hit",
}

Def.Weapon_CorV2_SmartRL =
{
	inherit 			= "Weapon_Base",
	class 				= "SmartRocketLauncher",
	item_subtype			= ItemSubtype.CorV2_SmartRL,
	weapon_class 		= ai.WeaponClass.LASER,	

	cycle_barrels		= true,
	heat_max 			= 12,
	heat_add 			= 3,
	heat_sub 			= 6,
	
	fire_rate 			= 20, -- из расчета 1 выстрел в секунду при 4ех стволах.       14/25 16/25 18/25 -- на такой реальный фаер рейт надо расчитывать
	optimal_range		= 400,
	max_range			= 400,
	
	projectile 			= "Projectile_CorV2_SmartRL",
	shot_once_sound 	= "sound/weapons/smartRocket/smr",
	projectile_speed	= 400, --172,	
	
	spell_on_hit 		= "Spell_CorV2_SmartRL2",
	
	damage_thermal			= 2310*1.2,  -- примерно пересчитано по фаер рейту  эксперементальному 16/25  с миномета t5mk1
	no_friendly_fire 	= true,

	targeting_beam_fx	= "particles/weapons/machete_laser",
	beam_bone 			= "rocket_1",
 
	shot_effect = "particles/weapons/smart_muzzle_corlegibus",	
	muzzleflash_color = { kinetic = "130 130 250 128", emp = "130 130 250 128", thermal = "130 130 250 128", },
	muzzleflash_radius 	= 8,
	
	default_icon				= "ItemSubtype_CorV2_SmartRL",

	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.SCOUT,
	required_ship	= "Ship_Race1_S_T5_CorLegibus",	
}


Def.Projectile_CorV2_SmartRL =
{
	inherit 					= "Weapon_BaseRocket",
	override_blast_wave_damage 	= true,
	missile_defence_immune 		= true,	
	missile_detection_immune 	= true,
	is_guided					= true,
	angular_velocity			= 63,
	
	detonation_radius			= 7,
	
	explosion_blast_wave 	= "Blastwave_CorV2_SmartRL",

	flare_color			= "235 132 157 255",
	flare_size			= 0.0,
	flare_angle			= 180,
	flare_nebulosity	= 0.1,

	work_sound			= "sound/weapons/smartRocket/smr_fly",

	effect 				= "particles/weapons/smart_projectile_corlegibus",
	impact_type 		= "plasma",
}


Def.Blastwave_CorV2_SmartRL  =
{
	class					= "BlastWave",
	in_editor				= false,

	damage_emp				= 1,
	blast_minDistance		= 3,
	blast_maxDistance		= 8,
	apply_damage			= true,
	apply_shake 			= true,

	effect 					= "particles/weapons/smart_explosion_corlegibus",
	light_color 			= "160 160 255 100",
	---light_color 			= "255 170 191 255", --New Year
	light_radius 			= 18,
	light_time 				= 1.2,
	sound 					= "sound/explosion/SmartRocket_expl",
}

Def.Weapon_GreenReconShotgun =
{
	inherit 								= "Weapon_AutoGun",
	class 				= "AutoGun",
	item_subtype			= ItemSubtype.GreenReconShotgun,
	weapon_class 		= ai.WeaponClass.RAILGUN,	
	
	fire_rate								= 60,
	cycle_barrels							= false,	
	is_shotgun								= true,
	
	optimal_range							= 175,
	max_range								= 175,
	projectile_speed						= 460,
	
	dispersion								= 3.5,
	dispersion_max							= 1.5,
	dispersion_add							= -2, 
	dispersion_sub							= -2, 
	
	damage_kinetic								= 1000,
	crit_chance								= 0.05,
	crit_damage								= 0.5,
	
	charge_min								= 1,
	charge_max								= 3,
	damage_charge_deminishing				= 1,
	
	heat_max								= 10,
	heat_add								= 1.5,
	heat_sub								= 5,
	overheat_time							= 1.5,
	shot_energy_cost						= 100,
	
	model									= "models/weapons/double_termal_shotgun/double_frigid_shotgun",
	projectile								= "Projectile_GreenReconShotgun",
	
	module_type								= ai.ModuleType.WEAPON,
	
	shot_effect 							= "particles/weapons/special/ice_muzzle",
	muzzleflash_color						= { thermal = "255 100 100 128", },
	muzzleflash_radius 						= 6,
	shot_once_sound 						= "sound/weapons/DoubleEmpShotgun/des_shot",

	default_icon				= "ItemSubtype_GreenReconShotgun",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	--required_ship	= "Ship_Race1_S_T5_CorLegibus",		
}

Def.Projectile_GreenReconShotgun =
{
	inherit				= "Projectile_Plasma_Default",
	--spell_on_crit	 	= "Spell_DoubleEmpShotgun",
	--effect 				= "particles/weapons/special/ice_projectile",
	--hit_effect			= "particles/weapons/special/ice_hit",
	impact_type 			= "crystal_shard",
	
	effect 					= "particles/weapons/alien/crystalbuckshot_projectile",
	hit_effect				= "particles/weapons/alien/crystal_beam_hit",	
}

Def.Weapon_GreenReconBlaster =
{
	inherit 		= "Weapon_Base",
	class 				= "AutoGun",
	item_subtype			= ItemSubtype.GreenReconBlaster,
	weapon_class 		= ai.WeaponClass.LASER,	

	cycle_barrels 		= true,
	
	--fire_rate		= 200,
	fire_rate		= 60, --макс 300. допускается 240. cycle_barrels =*4
	dispersion		= 0, 
	dispersion_add		= 0.4, 
	dispersion_sub		= 0.8, --0.6, 
	dispersion_max		= 1, 

	max_range		= 310,
	projectile_speed 	= 900.0,
	
	--damage		= 10,
	--damage_kinetic		= 0,
	--damage_emp		= 105,
	damage_thermal		= 1200,
	crit_chance			= 0.02,
	crit_damage			= 0.5,	
	
	heat_max 		= 15,
	heat_add 		= 2.5,
	heat_sub 		= 7.5,  	
	overheat_time 		= 1,

	spell_on_hit			= "Spell_GreenReconBlaster",

	projectile		= "Projectile_GreenReconBlaster",
	
	model			= "models/weapons/rail_guns/econom/rg_training",

	shot_once_sound		= "sound/weapons/giftgun/gg_shot",
	shot_effect 		= "particles/weapons/alien/sw_gift_muzzle",
	
	default_icon				= "ItemSubtype_GreenReconBlaster",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	--required_ship	= "Ship_Race1_S_T5_CorLegibus",		
}

Def.Projectile_GreenReconBlaster  =
{
	inherit			= "Projectile_Plasma_Default",

	hit_effect		= "particles/weapons/alien/sw_gift_hit",
	--effect 			= "particles/weapons/plasma/plasma_auto_projectile",	
	effect 			= "particles/weapons/alien/sw_gift_projectile_wide", -- Выглядит неплохо, чуть короче может надо.
	--effect 			= "particles/weapons/nuke/workflare",
	shadowCaster		= false,
	impact_type 		= "plasma",
	
}

Def.Minefield_GreenReconMine = 
{

	class				= "Minefield",
	MunitionBayType		= ai.MunitionBayType.MBT_SECONDARY,	
	item_subtype		= ItemSubtype.GreenReconMine,
	
	stacks				= true,

	field_radius		= 20,
	max_mines			= 1,

	explosion_blast_wave= "BlastWave_GreenReconMine",
	
	spell 				= "Spell_GreenReconMine",
	time_to_live		= 80,
	period				= 1,
	repeat_period 		= 0.2,
	
	cooldown			= 15,
	
	holder_size			= 8,
	empty_holder_cooldown= 120,
	
	use_team_skin		= true,


	default_icon		= "ItemSubtype_GreenReconMine",
	
	shopCategory		= "SECONDRY_WEAPON",
	shopSubCategory		= "OTHERS",
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	price					= 99999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.SMALL,
	required_role = ai.ShipRoles.RECON,
	--required_ship	= "Ship_Race1_S_T5_CorLegibus",	


	
	work_effect_s1 = "particles/gadget/mine_friendly",
	work_effect_s2 = "particles/gadget/mine",
	launch_sound = "sound/gadgets/FrigateDrone/fd_launch",
}
Def.BlastWave_GreenReconMine = 
{
	class					= "BlastWave",
	intensity				= 3000,
	damage_thermal			= 8000,
	blast_maxDistance		= 30,--50,
	light_radius			= 30,
	light_time				= 0.8,
 	self_damage_coef		= 0, --не дамагаем себя.
	--parent_prototype="SpaceMissile_ProximityMine_T5_Mk1"  -- в коде не нашли, тестим без этого.
	sound 					= "sound/explosion/plasma_rocket_expl",
}


-----------------------------------------------------------------------BRAWL

Def.Weapon_FireGunBall_BRAWL = 
{

	inherit				= 'Weapon_FireBallThrower',
	item_subtype			= ItemSubtype.FireGunBallBRAWL,
	fire_rate			= 600,
	heat_max = 4,
	heat_add = 1,
	heat_sub = 6,
	
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 0,
	damage_thermal		= 25,	
	
	projectile = "Projectile_FireGunBall_BRAWL",
	spell_on_hit = "Spell_FireGunBall_BRAWL",	
	
	model					= "models/weapons/heavy_blaster/heavy_mod3",
	shot_effect 			= "particles/events/steel_balls/weapon_red_muzzle",

	default_icon = "ItemSubtype_FireGunBall",
	
	model = "models/weapons/gun_ball/gun_ball",
	default_custom_elements = {
		[ai.VesselCustomSlot.MATERIAL_0]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_1]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_2]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
	},
	
	ods_export				= true,
	storeItemId				= 1,
	
}

Def.Projectile_FireGunBall_BRAWL = 
{
	inherit			= "Projectile_FireBallThrower",
	effect = "particles/events/steel_balls/weapon_red_projectile",
	hit_effect = "particles/events/steel_balls/weapon_red_hit",
	model = "models/misc/invisible_model",
}	

Def.Weapon_FreezeGunBall_BRAWL = 
{
	inherit				= "Weapon_FireGunBall_BRAWL",
	item_subtype			= ItemSubtype.FreezeGunBallBRAWL,
	damage				= 0,
	damage_kinetic		= 0,
	damage_emp			= 25,
	damage_thermal		= 0,
	
	projectile = "Projectile_FreezeGunBall_BRAWL",
	spell_on_hit = "Spell_FreezeGunBall_BRAWL",
	
	model = "models/weapons/gun_ball/gun_ball",
	default_custom_elements = {
		[ai.VesselCustomSlot.MATERIAL_0]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_1]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_2]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
	},
	
	default_icon = "ItemSubtype_FreezeGunBall",
	
	shot_effect 			= "particles/events/steel_balls/weapon_blue_muzzle",
	ods_export				= true,
	storeItemId				= 1,
		
}

Def.Projectile_FreezeGunBall_BRAWL = 
{
	inherit			= "Projectile_FireBallThrower",
	effect = "particles/events/steel_balls/weapon_blue_projectile",
	hit_effect = "particles/events/steel_balls/weapon_blue_hit",
	model = "models/misc/invisible_model",
}	

Def.Weapon_HealGunBall_BRAWL = 
{
	inherit				= "Weapon_FireGunBall_BRAWL",
	item_subtype			= ItemSubtype.HealGunBallBRAWL,
	damage				= 0,
	damage_kinetic		= 12,
	damage_emp			= 0,
	damage_thermal		= 0,
	
	projectile = "Projectile_HealGunBall_BRAWL",
	spell_on_hit = "Spell_HealGunBall_BRAWL",	
	
	model = "models/weapons/gun_ball/gun_ball",
	default_custom_elements = {
		[ai.VesselCustomSlot.MATERIAL_0]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_1]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_2]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
	},	
	
	default_icon = "ItemSubtype_HealGunBall",		

	shot_effect 			= "particles/events/steel_balls/weapon_green_muzzle",	
	ods_export				= true,
	storeItemId				= 1,	
}

Def.Projectile_HealGunBall_BRAWL = 
{
	inherit			= "Projectile_FireBallThrower",
	effect = "particles/events/steel_balls/weapon_green_projectile",
	hit_effect = "particles/events/steel_balls/weapon_green_hit",
	model = "models/misc/invisible_model",
}	

Def.Weapon_AsteridGunBall_BRAWL = 
{
	inherit				= "Weapon_HeliRoid",
	item_subtype			= ItemSubtype.AsteridGunBallBRAWL,
	
	heat_max 			= 10,
	heat_add 			= 1.3,
	heat_sub 			= 5,
	
	fire_rate 			= 5, 
	optimal_range		= 700,
	max_range			= 700,
	damage_kinetic		= 1000,
	
	
	projectile 			= "Projectile_AsteridGunBall_BRAWL",
	
	model = "models/weapons/gun_ball/gun_ball",
	default_custom_elements = {
		[ai.VesselCustomSlot.MATERIAL_0]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_1]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
		[ai.VesselCustomSlot.MATERIAL_2]="TAKE_CUSTOM_ELEMENT_FROM_SHIP",
	},
	
	default_icon = "ItemSubtype_AsteridGunBall",		
	
	ods_export				= true,
	storeItemId				= 1,
	shot_effect 			= "particles/empty",
}

Def.Projectile_AsteridGunBall_BRAWL = 
{
	inherit				= "Projectile_HeliRoid",
	death_entity		= "AsteridGunBall",
	--spell_on_launch		= "Spell_AsteridGunBall_BRAWL",
	effect = "particles/events/steel_balls/weapon_yellow_projectile",
	explosion_blast_wave = "BlastWave_AsteridGunBall",
	flare_angle = 180,
	flare_color = "255 228 122 15",
	flare_nebulosity = 0.2,
	flare_size = 0.3,
}

Def.BlastWave_AsteridGunBall = 
{
	class					= "BlastWave",
	in_editor				= false,
	
	--damage_kinetic			= 1500,
	--damage_emp				= 500,
	blast_maxDistance		= 30,--50,
	light_radius			= 30,
	light_time				= 0.8,
	
	apply_damage			= true,
	apply_shake 			= true,
	
	sound 			= "sound/hit/xo_common",
	class					= "BlastWave",
	
	effect 				= "particles/events/steel_balls/weapon_yellow_hit",
	self_damage_coef		= 3, --не дамагаем себя.
	--parent_prototype="SpaceMissile_ProximityMine_T5_Mk1"  -- в коде не нашли, тестим без этого.
}

Def.AsteridGunBall =
{
	class 				= "ScBaseEntity",
	health 				= 10000,
	ttl					= 25,
	
	in_editor		= false,
	
	physics				= { solid_type = solid.model, hitbox = false, mass = 100005, material = "Metal", damping = 10.3, rot_damping = 10.3, },
	damageable			= true,
	network_sync 		= true,
	
	hack_immune			= true,
	
	radar_vison		= ai.ShieldRadarVisionMode.BLOCK_ENEMY,
	
	
	model				= "models/weapons/asteroid_helios/asteroid_helios",
	death_effect		= "particles/events/steel_balls/weapon_yellow_asteroid_explosion",
	death_sound			= "sound/explosion/drone_expl",
	ui_color			= 0xFFEEFFCC,
	children = 
	{
		{ effect = "particles/events/steel_balls/weapon_yellow_hit_asteroid", },
	},
}

Def.SpaceMissile_GravyBlock_BRAWL = 
{
	class				= "Rocket",
	item_subtype		= ItemSubtype.GravyBlockBRAWL,
	death_entity		= "SpaceMissile_GravyBlockMine_BRAWL",
	cooldown			= 30,
	
	speed = 300,
	max_range = 10,
	
	default_icon		= "ItemSubtype_GravyBlock",
}

Def.SpaceMissile_GravyBlockMine_BRAWL = 
{
	class				= "MineTrap",
	
	model				= "models/turret/biglightninggun/h_mine",
	signature			= ai.Signature.SMALL,
	health 				= 6000,
	damageable			= true,
	physics				= { solid_type = solid.sphere, material = "ShipMetalMk3", mass = 10000, },
	target =
	{
		class 			= ai.SpellTargetClass.SHIP,
		relationship	= ai.SpellTargetRelationship.ENEMY,
		vitality		= ai.SpellTargetVitality.ALIVE,
		area			= ai.SpellTargetArea.AROUND,
	},
	cooldown			= 30,
	
	radius				= 100,
	launch_time			= 2.5,
	ttl					= 30,
	spell_on_ttl		= "Spell_CageTrap_Brawl",
	active_aura			= "StealthandWarpDisable",
	spell_aura_target	= true, --может быть целью спелов

	--отображение в HUD
	hudType 			= "default",
	uiName 				= "CageTrapMine_name",

	effect = "particles/null",
	model = "models/turret/biglightninggun/h_mine",

	-- start_sound 		= "sound/weapons/mine/mine_start",
	--launch_effect		= "particles/gadget/mine_deploy",
	default_icon		= "ItemSubtype_GravyBlock",
}

Def.CageTrapMineActiveHolder_BRAWL = 
{
	class				= "AuraHolderEntity",
	damageable			= true,
	death_effect		= "particles/explosions/shp_exp_small_02",
	death_sound			= "sound/explosion/drone_expl",
	health				= 10000,
	hudType				= "default",
	in_editor			= false,
	model				= "models/turret/biglightninggun/h_mine",
	physics				= {damping = 0.4, mass = 100500, material = "ShipMetalMk3", rot_damping = 0.4, solid_type = 4, },
	-- uiDesc				= "Module_ShieldRayLarge_Desc",
	uiName				= "CageTrapMine_name",
	work_sound 			= "sound/gadgets2/CageTrapMine_loop",

}


-------------------------------------------------------------------- END BRAWL

Def.Weapon_ChaosCanon = 
{
	inherit 			= "Weapon_Base",
	class 				= "AutoGun",
	module_type				= ai.ModuleType.WEAPON,	
	item_subtype			= ItemSubtype.ChaosCanon,

	cycle_barrels 		= true,
	
	fire_rate			= 12,
	dispersion			= 0, 

	max_range			= 350,
	projectile_speed 	= 355.0,
	
	--damage				= 10,
	damage_kinetic		= 4000,
	damage_emp			= 0,
	damage_thermal		= 0,
	
	heat_max 			= 15,
	heat_add 			= 1,				-- heat растет на это значение при каждом выстреле
	heat_sub 			= 5,  			-- heat уменьшается на это значение каждую секунду. только если не OverHeat
	overheat_time 		= 1,
	
	no_friendly_fire	= true,
	
	projectile			= "Projectile_ChaosCanon",
	
	shot_once_sound = "sound/weapons/railgun/heavy",
	shot_effect 		= "particles/weapons/bark_canon_muzzle",
	model				= "models/weapons/crossout_heavygun_turret_zis3/crossout_zis3_turret",
	
	default_icon		= "ItemSubtype_BigCannon",	
	
	ods_export				= true,
	storeItemId				= 1,
	cant_be_bought			= true,
	premiumPrice			= 999999,
	tier					= 5,	
	item_lvl				= 25,
	in_editor				= false,
	rank_min				= 1,
	rank_max				= 17,
	class_mask=ai.ShipClass.MEDIUM,
	required_role = ai.ShipRoles.ATTACK,
	required_ship	= "Ship_Race1_M_T5_Chaos",	
}

Def.Projectile_ChaosCanon =
{
	inherit				= "Projectile_Artillery",
	explosion_blast_wave	= "Blastwave_ChaosCanon",
	work_sound 		= "sound/weapons/xo/bullet_fly",
	--model 				= "models/weapons/bs_torpedo_mid",
	flare_color			= "255 214 155 25",
	flare_size			= 0.05, --0.15
	flare_angle			= 180,
	flare_nebulosity	= 1.0,
	effect 				= "particles/weapons/devostrator_trail",
}

Def.Blastwave_ChaosCanon = 
{
	inherit				= "Blastwave_Artillery_Base",
	blast_maxDistance	= 30,
	sound 			= "sound/hit/xo_common",
	light_color 		= "255 239 195 120",
	light_radius 		= 20,
	light_time 			= 0.8,
	effect 				= "particles/explosions/artillery_fire",
}