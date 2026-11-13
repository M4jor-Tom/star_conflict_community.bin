local base_shield_regen = 0.6 -- рассчитано все было на 25, но по таску #49868 поменяли на 50. в этом случае реген в минуту 6000 дамаг в минуту 5328
local jericho_shield_regen = 25 * 2
local health_big_slot = 10000-- 7000
local beacon_timeout = 3600 --60
local structures_score = 3	--3 #65691
local structures_score_big = 10	--10

-- решили с колей что бой 20-30 минут. пересчитал для суммарного ХП 70к
-- реген 10
-- дамаг 250 интервал 15 (50 от баффа 200 база )
-- 
-- бонус щита иерихона 6000 -- дает 2 минуты боя  
-- бонус империи -- ускоряет на 2 мин бой интервал 14.61 + визуальное смещение в армор



--
Def.ClanShip_MainTurret =
{
	class 						= "ClanShipMainTurret",
	in_editor					= true,
	model						= "models/turret/big_plasma_cannon/big_pgun/big_pgun",

	use_team_skin 				= true,
	
	physics						= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 10000 },
	health 						= 100000,
	damageable					= false,

	rotation_speed		 		= 10,
	rotation_bone				= "rotate",

	-- минимум 0, максимум fire_delay_range
	fire_delay_range			= 1,
	first_delay_step			= 20/3,
	volley_interval				= 20,

	-- поворот
	rot_sound					= "sound/dreadnought/big_cannon_rotate",
	stop_sound					= "sound/dreadnought/big_cannon_stop",
	
	ignore_invulnerabilities	= true, -- игнорируются всякого рода ауры, позволяющие авойдить дамаг
	
	-- нагрев орудия (не путать с зарядкой, нагрев это финальная её стадия, определяется fadein_time)
	clan_ship_targeting_effect	= "particles/other/dreadnought_plasma_targeting",
	clan_ship_charge_effect		= "particles/other/dreadnought_plasma_charge",
	clan_ship_beam_effect		= "particles/other/dreadnought_plasma_beam",
	beam_fadein_time			= 4.1, --1.8
	beam_damage_per_second		= 5000,
	charge_sound 				= "sound/dreadnought/big_cannon_charge",

	-- выстрел
	shot_sound 					= "sound/dreadnought/big_cannon_fire",
	clan_ship_shot_effect		= "particles/other/dreadnought_plasma_shot",
	beam_fadeout_time			= 1,
	projectile_sound 			= "sound/dreadnought/big_gun_projectile_fly",

	-- снаряд
	projectile_delay			= 0.2,
	projectile_speed			= 1500,
	clan_ship_charge_time		= 5,
	clan_ship_damage			= 9.3 * 1.5,--*2.45,  --9.2 норма для тикетов, но астероиды не дают "пробить" --444 норма для ХП. -- #102573 *2
	projectile_radius			= 10.0,	
	projectile_damage			= 100500,
	projectile_kill_objects		= true,	-- 50914 Только эти туррели теперь выносят астероиды
	clan_ship_blastwave			= "Blastwave_ClanShip_MainTurret",
	projectile_effect			= "particles/other/dreadnought_plasma_projectile",


	gun_bones					= { "fire_01", "fire_02", "fire_03" },
	
	point_light					= "Lights_ClanShip_MainTurretShot",
	point_light_bone			= "fire_02",
	
	uiName						= "ClanShip_MainTurret",
	maxViewDist					= 30000,
}

-- поинт-лайт на стволе пушки
Def.Lights_ClanShip_MainTurretShot = 
{
	class				= 'PointLight',
	alpha				= 'acfiknprtzza',
	fps					= 2.2,
	rad					= 240,
	color				= "120 100 255 255",
}
--abcdefghijklmnopqrstuvwxyz

Def.ClanShip_MainTurret_Empire = 
{
	inherit						= "ClanShip_MainTurret",
	volley_interval				= 18, -- 20 база, 1 даст 10% мощи, так как щит будет регенерится меньше.
	uiName						= "ClanShip_MainTurret",
}

Def.Helpers_Dummy = 
{
	class               = "ScBaseEntity",
	in_editor           = true,
	model               = "mapskit/maps/models/bigship/dummy_skins",		
    use_team_skin       = true,
	network_sync 		= false,
}

--
Def.ClanShip_AverageTurret =
{
	class 						= "ClanShipMainTurret",
	in_editor					= true,
	model						= "models/turret/big_plasma_cannon/big_plasma_cannon",

	use_team_skin 				= true,
	
	physics						= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 10000 },
	health 						= 100000,
	damageable					= false,

	rotation_speed		 		= 10,
	rotation_bone				= "rotate",

	-- минимум 1, максимум fire_delay_range
	fire_delay_range			= 2,
	cooldown					= 4,
	shot_count					= 10,
	shots_per_second			= 5,
	volley_interval				= 5,

	-- поворот
	rot_sound					= "sound/weapons/turret/turret_motor",

	-- нагрев орудия (не путать с зарядкой, нагрев это финальная её стадия, определяется fadein_time)
	beam_fadein_time			= 0.1,

	-- выстрел
	shot_sound 					= "sound/dreadnought/minigun_fire",
	clan_ship_shot_effect		= "particles/other/dreadnought_railgun_shot_small",
	beam_fadeout_time			= 0.1,

	-- снаряд
	projectile_speed			= 800,
	clan_ship_charge_time		= 0.1,
	clan_ship_damage			= 0,
	projectile_radius			= 1.0,	
	projectile_damage			= 300,
	
	clan_ship_blastwave			= "Blastwave_ClanShip_AverageTurret", 
	projectile_effect			= "particles/other/dreadnought_railgun_projectile_small",

	gun_bones					= { "fire_01", "fire_02" },
	
	uiName						= "ClanShip_AverageTurret",
	maxViewDist					= 30000,
}

Def.ClanShip_AverageTurretDouble =
{
	inherit						= "ClanShip_AverageTurret",
	fire_delay_range			= 8,
	cooldown					= 10,
	
	uiName						= "ClanShip_AverageTurret",
}

Def.ClanShip_AverageTurretTriple =
{
	inherit			= "ClanShip_AverageTurret",
	fire_delay_range			= 7,
	cooldown					= 13,
	
	uiName						= "ClanShip_AverageTurret",
}

 Def.ClanShip_AverageTurret2 =
{
	inherit			= "ClanShip_AverageTurret",
	clan_ship_shot_effect		= "particles/other/dreadnought_railgun_shot_small",
	projectile_effect			= "particles/other/dreadnought_railgun_projectile_small",
	clan_ship_blastwave			= "Blastwave_ClanShip_AverageTurret",
	
	uiName						= "ClanShip_AverageTurret",
} 

Def.ClanShip_AverageTurret2Double =
{
	inherit			= "ClanShip_AverageTurret",
	fire_delay_range			= 8,
	cooldown					= 10,
}

Def.ClanShip_AverageTurret2Triple =
{
	inherit			= "ClanShip_AverageTurret",
	fire_delay_range			= 7,
	cooldown					= 13,
}

Def.Blastwave_ClanShip_MainTurret =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 6000,
	blast_maxDistance	= 30,
	apply_damage		= true,
	apply_shake 		= true,
	--exp
	effect 				= "particles/other/dreadnought_plasma_hit2",
	explosion_light		= "Lights_ClanShip_MainTurretBlastwave",
	sound 				= "sound/dreadnought/big_cannon_hit",
	--
}

Def.Lights_ClanShip_MainTurretBlastwave =
{
	class				= 'PointLight',
	alpha				= 'zspmjga',
	fps					= 3.33,
	rad					= 800,
	color				= "170 150 255 255",
}

--abcdefghijklmnopqrstuvwxyz

Def.Blastwave_ClanShip_AverageTurret =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 100,
	blast_maxDistance	= 20,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/other/dreadnought_railgun_hit_small",
	light_color 		= "255 100 0 100",
	light_radius 		= 20,
	light_time 			= 0.5, 
	sound 				= "sound/dreadnought/minigun_hit",
}

Def.ClanShip_CritAura =
{
	class				= "ScBaseEntity",
	in_editor 			= true,
	network_sync		= true,
	use_team_skin 		= true,
	model				=	"models/objects/gameplay/platform/platform_bomb",
	physics				=	{ solid_type = solid.compoun_model, static = true, material = "ShipMetalMk1", },
	active_aura			= "Spell_ClanShipCrit",
	
	children = 
	{
		{ def = "ClanShip_Quad_Hologram", joint = "Bomb" },
	},	
	
	hud_ico				= "ClanShip_CritAura",

	uiName				= "ClanShip_CritAura",
}

Def.ClanShip_Marinos =
{
	class				= "ScBaseEntity",
	in_editor			= true,
	
	hud_ico						= "ClanShip_Marinos",
	
	marinos_range		= 70,
	marinos_damage		= 10,
	marinos_cooldown 	= 4,
	marinos_spell		= "Spell_ClanShipMarinos",
	
	-- effects
	marinos_beam_fx		= "particles/gadget/drone_beam",
	marinos_hit_fx		= "particles/other/dreadnought_plasma_hit2",
	marinos_start_bone 	= "root",
	
	stacks =
	{
		[ ai.ShipClass.SMALL ] 	= 1,
		[ ai.ShipClass.MEDIUM ]	= 3,
		[ ai.ShipClass.LARGE ]	= 6,
	},
}

--#48491

Def.ClanShip_BombDispenser =
{
	class				= "AnimatedEntity",
	in_editor 			= true,
	network_sync		= true,
	use_team_skin 		= true,
	bomb_respawn_time	= 60*2,	--2.5 #65691
	model				=	"models/objects/gameplay/platform/platform_bomb",
	physics				=	{ solid_type = solid.model, static = true, material = "ShipMetalMk1", },
	bomb				= "ClanShip_Bomb",
	wow_times			 = { 10, 0 },
	
	bomb_bone			= "Bomb",
	uiName				= "ClanShip_BombDispenser", -- #83773
	
	children = 
	{
		{ def = "ClanShip_Bomb_Hologram", joint = "Bomb" },
	},	
	
	hud_ico				= "ClanShip_Bomb",
}

Def.ClanShip_Bomb =
{
	class				= "ClanShipBomb",	
	model				=	"models/objects/gameplay/bombball/bombball_orbit",
	physics				=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3},
	
	pick_up_time		= 3,
	plant_time			= 10,
	detonation_time		= 5,
	
	hudType				= "bomb",
	
	damage				= health_big_slot / 2, -- дамаг маяку при взрыве
	clanship_damage		= 100, -- дамаг дредноуту при взрыве
	
	take_sound			= "sound/game/bomb_carrier_sound_take",
	plant_sound			= "sound/game/bomb_carrier_sound_plant",	
	
	explosion 			= "Blastwave_ClanShip_MainTurret",
	
	explode_on_drop		= true, 
	uiName				= "ClanShip_Bomb",
}

--#49935
Def.ClanShip_SpellDispenser =
{
	class				= "AnimatedEntity",
	in_editor 			= true,
	network_sync		= true,
	use_team_skin 				= true,
	model				=	"models/objects/gameplay/platform/platform_bomb",
	physics				=	{ solid_type = solid.compoun_model, static = true, material = "ShipMetalMk1", },
	bomb				= "ClanShip_Bonus",
	
	wow_times			 = { 10, 0 },
	
	bomb_bone			= "Bomb",
	
	children = 
	{
		{ def = "ClanShip_Bomb_Hologram", joint = "Bomb" },
	},	
	
	hud_ico				= "ClanShip_Bomb",
}

Def.ClanShip_Bonus =
{
	class 			= "ScBaseEntity",
	in_editor		= true,
	hudType			= "default",
	hud_visibility_type = "minor",
	--damageable	= true,
	--health 			= 10000,
	uiName			= "Bonus_QuadDamage_name",
	
	model			= "models/objects/gameplay/bonuses/quad_damage",
	
    glow_effect 	= "particles/objects/bonuses/quad_damage_exp",
    max_detection_distance = 500.0,
	vision_radius_coef = 0.5,

	effect			= "particles/objects/bonuses/quad_damage",
	
	spell_approach	= "ClanShip_QuadDamage",
	spell_approach_trigger_radius = 5.0,
	spell_approach_respawn_timer = 3.5 * 60,

	death_effect	= "particles/ships/looted",
	spell_approach_trigger_sound = "sound/game/bonus_take",
	
	hud_ico				= "ClanShip_Bomb",
}

--#53082
Def.ClanShip_MineFieldDispenser =
{
	class				= "ScBaseEntity",
	in_editor 			= true,
	network_sync		= true,
	use_team_skin 		= true,
	bomb_respawn_time	= 60*2.5,
	model				=	"models/objects/gameplay/platform/platform_bomb",
	physics				=	{ solid_type = solid.compoun_model, static = true, material = "ShipMetalMk1", },
	bomb				= "ClanShip_MineField",
	
	wow_times			= { 10, 0 },
	bomb_points_name	= "MineField", --тегпоинты должны называться "<prefix>_team<T>_<X>", где <prefix> - префикс из дефа, <T> команда (1 или 2), <X> - порядковый номер, например MineField_team1_1
	bomb_bone			= "Bomb",
	
	children = 
	{
		{ def = "ClanShip_Effect_Hologram", joint = "Bomb" },
	},	
	
	uiName				= "ClanShip_MineFieldDispenser",
	hud_ico				= "ClanShip_Bomb",
}

Def.ClanShip_MineField =
{
	class				= "Minefield",	
	--model				=	"models/objects/gameplay/bombball/bombball_orbit",
	--physics				=	{ solid_type = solid.box, mass = 2000, material = "ShipMetalMk1", damping = 0.3, rot_damping = 0.3},
	use_team_skin 		= true,
	
	work_effect_s1 = "particles/gadget/minefield_friendly",
	work_effect_s2 = "particles/gadget/minefield",			
	shot_effect_s1 = "particles/gadget/minefield_deploy_friendly",
	shot_effect_s2 = "particles/gadget/minefield_deploy",
	launch_sound 	= "sound/gadgets/FrigateDrone/fd_launch",	
	
	hudType				= "bomb",
	time_to_live		= 50,
	explosion_blast_wave 			= "Blastwave_ClanShip_MainTurret",
	
	field_radius		= 38.5,

	uiName				= "ClanShip_MineField",
	
	max_mines			= 8,
	period				= 1,
	repeat_period		= 1.5,
	cooldown			= 15,
	stacks				= true,	
}

Def.ClanShip_Bomb_Hologram =
{
	class				= "ScBaseEntity",	
	model				=	"models/objects/gameplay/bombball/bombball_hologram",
	physics				=	{ solid_type = solid.none },	
	use_team_skin 		= true,
}

Def.ClanShip_Quad_Hologram =
{
	class				= 	"ScBaseEntity",	
	model				=	"models/objects/gameplay/bonuses/quad_damage_hologram",
	physics				=	{ solid_type = solid.none },	
	use_team_skin 		= true,
}

Def.ClanShip_Effect_Hologram =
{
	class = "EffectEntity",
	effect = { s1 = "particles/gadget/hologram_distortion_blue", s2 = "particles/gadget/hologram_distortion_red", },
	in_editor = true,
	maxViewDist = 999999,
	use_team_skin = true,
}
--
Def.ClanShip_SideTurretSpawn =
{
	class			= "ScBaseEntity",
	model			= Def.Turret_RailGun.model,
	in_editor		= true,
}


--
Def.ClanShip_SideTurret 		=
{
	hudType						= "default",
	hud_visibility_type 		= "minor",
	uiName						= "PlasmaPVO",
	
	use_team_skin 				= true,
	
	on_death_damage_to_clanship = structures_score,
	
	class 						= "Turret",
	in_editor					= true,
	model						= "models/turret/round_railgun01/round_railgun01", 

	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	health 						= 25000,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	hack_immune 				= true, -- SC-115966
	
	fire_rate					= 40.0,
	dispersion					= 0.0, -- deg
	optimal_range				= 150,
	max_range					= 300,
	projectile_speed 			= 400,
	
	damage_kinetic				= 0,
	damage_emp					= 1400,
	damage_thermal				= 0,

	max_rot_speed				= 120,	-- deg per second

	projectile					= "Projectile_HeavyRailgun", 
	shot_effect 				= "particles/weapons/drongun/muzzle",  -- заглушка
	shot_once_sound 			= "sound/weapons/turret/railgun_oneshot", 

	death_effect				= "particles/explosions/objects/explosion_tiny",  -- заглушка
	death_sound					= "sound/explosion/turret_expl", 
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_SideTurret_MagSev_top 		=
{
	hudType						= "default",
	hud_visibility_type 		= "minor",
	uiName						= "Jer_Turret",
	
	use_team_skin 				= true,
	
	on_death_damage_to_clanship = structures_score,
	
	class 						= "Turret",
	in_editor					= true,
	model						= "models/turret/round_railgun01/round_railgun01", 

	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	health 						= 25000,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	hack_immune 				= true, -- SC-115966
	
	fire_rate					= 120.0,
	dispersion					= 0.0, -- deg
	optimal_range				= 150,
	max_range					= 300,
	projectile_speed 			= 400,
	
	damage_kinetic				= 0,
	damage_emp					= 400,
	damage_thermal				= 0,

	max_rot_speed				= 120,	-- deg per second

	projectile					= "Projectile_HeavyRailgun", 
	shot_effect 				= "particles/weapons/drongun/muzzle",  -- заглушка
	shot_once_sound 			= "sound/weapons/turret/railgun_oneshot", 

	death_effect				= "particles/explosions/objects/explosion_tiny",  -- заглушка
	death_sound					= "sound/explosion/turret_expl", 
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_SideTurret_MagSev_bottom 		=
{
	hudType						= "default",
	hud_visibility_type 		= "minor",
	uiName						= "Jer_Turret",
	
	use_team_skin 				= true,
	
	on_death_damage_to_clanship = structures_score,
	
	class 						= "Turret",
	in_editor					= true,
	model						= "models/turret/round_railgun01/round_railgun01", 

	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	health 						= 20000,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	hack_immune 				= true, -- SC-115966
	
	fire_rate					= 120.0,
	dispersion					= 0.0, -- deg
	optimal_range				= 150,
	max_range					= 300,
	projectile_speed 			= 400,
	
	damage_kinetic				= 0,
	damage_emp					= 400,
	damage_thermal				= 0,

	max_rot_speed				= 120,	-- deg per second

	projectile					= "Projectile_HeavyRailgun", 
	shot_effect 				= "particles/weapons/drongun/muzzle",  -- заглушка
	shot_once_sound 			= "sound/weapons/turret/railgun_oneshot", 

	death_effect				= "particles/explosions/objects/explosion_tiny",  -- заглушка
	death_sound					= "sound/explosion/turret_expl", 
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}


Def.ClanShip_SideTurret_t3 =
{
	inherit						= "ClanShip_SideTurret",
	health 						= 30000, --20000,
	damage_emp					= 1200, ---#67264 1400 --1500, ---1000
	max_range					= 300,
	projectile_speed 			= 300, ---#67264
	tier 						= 3,
}
Def.ClanShip_SideTurret_t4 =
{
	inherit						= "ClanShip_SideTurret",
	health 						= 40000, --25000,
	damage_emp					= 2000, ---#67264 2400 --1800,
	max_range					= 350,
	projectile_speed 			= 400,
	tier 						= 4,
}
Def.ClanShip_SideTurret_t5 =
{
	inherit						= "ClanShip_SideTurret",
	health 						= 50000, --33000,
	damage_emp					= 2800, ---#67264 3600 --2160,
	max_range					= 400,
	projectile_speed 			= 500, ---#67264
	tier 						= 5,
}



Def.ClanShip_SideRocketTurret 	=
{	
	hudType						= "default",
	hud_visibility_type 		= "minor",
	uiName						= "KinetPVO",
	
	use_team_skin 				= true,
	
	on_death_damage_to_clanship = structures_score,
	
	class 						= "Turret",
	in_editor					= true,
	model						= "models/turret/rocket_launcher/rocket_launcher_small",

	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	health 						= 50000,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	hack_immune 				= true, -- SC-115966
		
	fire_rate					= 10.0,
	dispersion					= 0.0, -- deg
	optimal_range				= 200,
	max_range					= 400,
	projectile_speed 			= 115,
	
	damage_kinetic				= 8000,
	damage_emp					= 0,
	damage_thermal				= 0,

	max_rot_speed				= 20,	-- deg per second

	projectile					= "Turret_RocketGun_Missile_ClanShip", 
	shot_effect 				= "particles/weapons/drongun/muzzle",  -- заглушка
	shot_once_sound 			= "sound/dreadnought/rocket_turret_fire", 

	death_effect				= "particles/explosions/objects/explosion_tiny",
	death_sound					= "sound/explosion/turret_expl", 

	broken_parts = 
	{
		[ 1 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 2 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 3 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 4 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 5 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 6 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
	},	
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}
Def.ClanShip_SideRocketTurret_t3 =
{
	inherit						= "ClanShip_SideRocketTurret",
	health 						= 40000, --35000,
	damage_kinetic				= 12000,  ---#67264 8000 --7200, --1500 * 1.20 * 4, урон скорострельной пушки *1.2(коэффициент от скорости заряда) * соотношение скорострельности
	max_range					= 400,
	projectile_speed 			= 125,
	tier 						= 3,
}
Def.ClanShip_SideRocketTurret_t4 =
{
	inherit						= "ClanShip_SideRocketTurret",
	health 						= 52000, --42000,
	damage_kinetic				= 16000,  ---#67264 11000 --8600,
	max_range					= 450,
	projectile_speed 			= 140,
	tier 						= 4,
}
Def.ClanShip_SideRocketTurret_t5 =
{
	inherit						= "ClanShip_SideRocketTurret",
	health 						= 65000, --50000,
	damage_kinetic				= 22000,  ---#67264 15000 --10300,
	max_range					= 500,
	projectile_speed 			= 160,
	tier 						= 5,
}

--
Def.Turret_RocketGun_Missile_ClanShip = 
{
	inherit				= "Turret_RocketGun_Missile",
	in_editor			= false,
	
	override_blast_wave_damage = true,	-- переносим дамаг из туррели в бластвейв.
}



---#95443
Def.ClanShip_ThermalRocketTurret 	=
{	
	hudType						= "default",
	hud_visibility_type 		= "minor",
	uiName						= "ThermalPVO",
	
	use_team_skin 				= true,
	
	on_death_damage_to_clanship = structures_score,
	
	class 						= "Turret",
	in_editor					= true,
	model						= "models/turret/rocket_launcher/rocket_launcher_small",

	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	health 						= 50000,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	hack_immune 				= true, -- SC-115966

	fire_rate					= 6.0,
	dispersion					= 0.0, -- deg
	optimal_range				= 200,
	max_range					= 400,
	projectile_speed 			= 100,
	
	damage_kinetic				= 0,
	damage_emp					= 0,
	damage_thermal				= 12000,

	max_rot_speed				= 15,	-- deg per second

	projectile					= "Turret_ThermalRocketGun_Missile_ClanShip", 
	shot_effect 				= "particles/weapons/drongun/muzzle",  -- заглушка
	shot_once_sound 			= "sound/dreadnought/rocket_turret_fire", 

	death_effect				= "particles/explosions/objects/explosion_tiny",
	death_sound					= "sound/explosion/turret_expl", 

	broken_parts = 
	{
		[ 1 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 2 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 3 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 4 ] = { model = "models/debris/r1_ships/m_d1", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 5 ] = { model = "models/debris/r1_ships/m_d2", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
		[ 6 ] = { model = "models/debris/r1_ships/m_d3", effect = "particles/explosions/debris_trail",  angle = 180, pos = Vec3( 0, 0, 0 ), dumping = 0.4, speed = 40.0, speed_deviation = 15, speed_inherit = 1.6, ttl = 7, },
	},	
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}
Def.ClanShip_ThermalRocketTurret_t3 =
{
	inherit						= "ClanShip_ThermalRocketTurret",
	health 						= 40000, --35000,
	damage_thermal				= 18000,  ---#67264 8000 --7200, --1500 * 1.20 * 4, урон скорострельной пушки *1.2(коэффициент от скорости заряда) * соотношение скорострельности
	max_range					= 400,
	projectile_speed 			= 110,
	tier 						= 3,
}
Def.ClanShip_ThermalRocketTurret_t4 =
{
	inherit						= "ClanShip_ThermalRocketTurret",
	health 						= 52000, --42000,
	damage_thermal				= 24000,  ---#67264 11000 --8600,
	max_range					= 450,
	projectile_speed 			= 120,
	tier 						= 4,
}
Def.ClanShip_ThermalRocketTurret_t5 =
{
	inherit						= "ClanShip_ThermalRocketTurret",
	health 						= 65000, --50000,
	damage_thermal				= 32000,  ---#67264 15000 --10300,
	max_range					= 500,
	projectile_speed 			= 130,
	tier 						= 5,
}

--
Def.Turret_ThermalRocketGun_Missile_ClanShip = 
{
	inherit				= "Turret_RocketGun_Missile",
	in_editor			= false,
	
	detonation_radius 	= 7,
	flare_color 		= "255 50 50 15",
	flare_size			= 0.4,

	override_blast_wave_damage = true,	-- переносим дамаг из туррели в бластвейв.
}



-- "слабая" пушечка
Def.ClanShip_FlakGun =
{

	hudType						= "default",
	hud_visibility_type 		= "minor",
	uiName						= "ClanShip_FlakGun",
	
	use_team_skin 				= true,
	
	on_death_damage_to_clanship = structures_score,
	
	class 						= "Turret",
	in_editor					= true,
	model						= "models/turret/flak_gun/flak_gun",

	relationship_group 			= 0,

	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	health 						= 36000,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	hack_immune 				= true, -- SC-115966
	
	fire_rate					= 20.0,
	dispersion					= 1.5, -- deg
	optimal_range				= 100,
	max_range					= 180,
	projectile_speed 			= 300,
	
	damage_kinetic				= 0,
	damage_emp					= 0,
	damage_thermal				= 3000,

	max_rot_speed				= 60,	-- deg per second

	projectile					= "Projectile_HeavyRailgun",
	shot_effect 				= "particles/weapons/drongun/muzzle",
	shot_once_sound 			= "sound/weapons/turret/railgun_oneshot",

	death_effect				= "particles/explosions/objects/explosion_small",
	death_sound					= "sound/explosion/turret_expl",
	use_team_skin 				= true,
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

--
Def.ClanShip_Portal =
{
	inherit			= "Medium_WarpGate",
	in_editor		= true,
}

--
Def.ClanShip_JumpGateLocation =
{
	inherit			= "Logic_JumpGateLocation",
	clan_ship		= true,
	in_editor		= true,
}

--
Def.ClanShip_AimPoint =
{
	class			= "TagPoint",
	in_editor		= true,
	network_sync	= true,

	shield 			= "ClanShip_AimPointShield",
}

--
Def.ClanShip_AimPointShield =
{
	class			= "ClanShipShield",
	in_editor		= true,
	network_sync	= true,
	
	model 			= "models/shields/shield_point_fx1",
	shield_opacity 	= { 0, 0.5, 1 },
}



Def.ShieldGeneratorFx1 =
{
	class					= "ScBaseEntity",
	model					= "models/shields/generator_fx1",
	use_team_skin 			= true,
}
Def.ShieldGeneratorFx2 =
{
	class					= "BaseEntity",
	model					= "models/shields/generator_fx2",
}
Def.ShieldGeneratorFx3 =
{
	class					= "BaseEntity",
	model					= "models/shields/generator_fx3",
}

---------------------------------------------------------------------
---------------------ГЕНЕРАТОРЫ НА ДРЕДНОУТАХ------------------------
---------------------------------------------------------------------
--Базовый

Def.ClanShip_BaseGen = 
{
	in_editor				= true,
	health					= 280,
	decay_damage			= 100, -- определяет скорость захвата
	inherit					= "VitalPoint_Captureable",
	model					= "models/objects/vital_point/energy_station/generator/generator",
	regen_max_ally			= 0,
	regen_speed				= 0,
}

--Генераторы щита
Def.ClanShip_ShieldGeneratorA =
{
	inherit					= "ClanShip_BaseGen",
	in_editor				= true,
	model					= "models/objects/vital_point/energy_station/generator/generator",
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	idle_sound				= "sound/dreadnought/shield_emitter_loop",
	death_sound				= "sound/dreadnought/generator_off",
	
	tier 					= 3,
	
	uiName					= "ShieldGen",
	gameplay_idx			= 0,
	spawn_group				= 1,
	big_shield_def  		= "ClanShip_ShieldBlue",
	shield_defs 			= {"ClanShip_ShieldGenerator_Affect", "ShieldGeneratorFx1",  },
	shield_effect 			= { s1 = "particles/areal/small_stuff/shield_generator", s2 = "particles/areal/small_stuff/shield_generator_red" },
	
	health					= health_big_slot, 
	reset_time				= beacon_timeout,
	interaction_distance 	= 75,
	interacting_fx			= "particles/gadget/drone_beam", 
	uiInteract				= "Capture_ShieldGenerator",
	
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyGenDestroyed_CS",
		EnemyVitalPointDestroyed = "EnemyGenDestroyed_CS",
	},

	hud_ico					= "CS_A",
	
	clanship_bonuses =
	{
		{ type = ai.ClanshipBonus.SHIELD_REGEN, activation = ai.ClansShipActivationType.WHEN_ALIVE, param = base_shield_regen * 0.5 },
		{ type = ai.ClanshipBonus.DECREASE_TICKETS, activation = ai.ClansShipActivationType.ON_DEATH, param = 100*2 },	---50*2
	},
}

Def.ClanShip_ShieldGenerator_Affect = 
{
	use_team_skin 				= true,
	class						= "ScBaseEntity",
	model						= "models/objects/vital_point/energy_station/generator/generator_affect",
}
--эмиттеры щитов для Империи
-- Бонусная регенерация
Def.ClanShip_ShieldGenerator_t3 =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	clanship_bonuses		= { { param = base_shield_regen  } },
	uiName					= "ClanShip_ShieldGenerator_t3",
	uiInteract				= "Capture_ShieldGenerator",
	tier 					= 3,
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},	
}
Def.ClanShip_ShieldGenerator_t4 =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	clanship_bonuses		= { { param =  base_shield_regen * 1.1 } },
	uiName					= "ClanShip_ShieldGenerator_t4",
	uiInteract				= "Capture_ShieldGenerator",
	tier 					= 4,
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
}
Def.ClanShip_ShieldGenerator_t5 =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	clanship_bonuses		= { { param = base_shield_regen * 1.2 } },
	uiName					= "ClanShip_ShieldGenerator_t5",
	uiInteract				= "Capture_ShieldGenerator",
	tier 					= 5,
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
}
--мультифазовый  щит/ дает бонусные тикеты
Def.ClanShip_ShieldMultiphased_t3 =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	tier 					= 3,
	uiName					= "ClanShip_ShieldMultiphased_t3",
	uiInteract				= "Capture_ShieldMultiphased",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldMultiphased_CS",
		EnemyVitalPointDestroyed = "EnemyShieldMultiphased_CS",
	},	
	
	clanship_bonuses =
	{
		-- балансируем что он живет 10 минут по эффективности примерно как обычный расширитель
		{ type = ai.ClanshipBonus.INCREASE_TIKETS_ADD, activation = ai.ClansShipActivationType.ON_SPAWN, param = 600 * base_shield_regen },  
	},
}
Def.ClanShip_ShieldMultiphased_t4 =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	clanship_bonuses		= {{ type = ai.ClanshipBonus.INCREASE_TIKETS_ADD, activation = ai.ClansShipActivationType.ON_SPAWN, param = 600 * base_shield_regen *1.1 },   }, 
	tier 					= 4,
	uiName					= "ClanShip_ShieldMultiphased_t4",
	uiInteract				= "Capture_ShieldMultiphased",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldMultiphased_CS",
		EnemyVitalPointDestroyed = "EnemyShieldMultiphased_CS",
	},	
}
Def.ClanShip_ShieldMultiphased_t5 =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	clanship_bonuses		= { { type = ai.ClanshipBonus.INCREASE_TIKETS_ADD, activation = ai.ClansShipActivationType.ON_SPAWN, param = 600 * base_shield_regen *1.2 }, }, 
	tier 					= 5,
	uiName					= "ClanShip_ShieldMultiphased_t5",
	uiInteract				= "Capture_ShieldMultiphased",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldMultiphased_CS",
		EnemyVitalPointDestroyed = "EnemyShieldMultiphased_CS",
	},	
}
--Hard shields "Жесткий щит"
  --свойство "Бронебойное" оружие не срабатывает, если щит активен. 7-10% шанс что урон текущего выстрела не пройдет в корпус после щита.
  --при отключении этого щита его свойства так же отключаются.
Def.ClanShip_ShieldHard_t3 =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	tier 					= 3,
	uiName					= "ClanShip_ShieldHard_t3",
	uiInteract				= "Capture_ShieldHard",
	
	
	clanship_bonuses =
	{
		{ type = ai.ClanshipBonus.SHIELD_HEAVY, activation = ai.ClansShipActivationType.WHEN_ALIVE, param = 0.14 }, --0.07
		{},
		{},
	},
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldHard_CS",
		EnemyVitalPointDestroyed = "EnemyShieldHard_CS",
	},	
}
Def.ClanShip_ShieldHard_t4 =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	clanship_bonuses		= { { param = 0.16 } }, 	--0.08
	tier 					= 4,
	uiName					= "ClanShip_ShieldHard_t4",
	uiInteract				= "Capture_ShieldHard",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldHard_CS",
		EnemyVitalPointDestroyed = "EnemyShieldHard_CS",
	},	
}
Def.ClanShip_ShieldHard_t5 =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	clanship_bonuses		= { { param = 0.18 } }, --0.09
	tier 					= 5,
	uiName					= "ClanShip_ShieldHard_t5",
	uiInteract				= "Capture_ShieldHard",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldHard_CS",
		EnemyVitalPointDestroyed = "EnemyShieldHard_CS",
	},	
}

--эмиттеры щитов для федерации
Def.ClanShip_FedShieldGeneratorA =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_FedShieldGeneratorA",
	uiInteract				= "Capture_ShieldGenerator",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
}

Def.ClanShip_FedShieldGenerator_t3 =
{
	inherit					= "ClanShip_ShieldGenerator_t3",
	big_shield_def  		= "Effects_Dreadnought_FedDreadShield",
	uiName					= "ClanShip_FedShieldGenerator_t3",
	uiInteract				= "Capture_ShieldGenerator",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
	
}
Def.ClanShip_FedShieldGenerator_t4 =
{
	inherit					= "ClanShip_ShieldGenerator_t4",
	big_shield_def  		= "Effects_Dreadnought_FedDreadShield",
	uiName					= "ClanShip_FedShieldGenerator_t4",
	uiInteract				= "Capture_ShieldGenerator",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
}
Def.ClanShip_FedShieldGenerator_t5 =
{
	inherit					= "ClanShip_ShieldGenerator_t5",
	big_shield_def  		= "Effects_Dreadnought_FedDreadShield",
	uiName					= "ClanShip_FedShieldGenerator_t5",
	uiInteract				= "Capture_ShieldGenerator",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
}
--мультифазовый  щит/ дает бонусные тикеты
Def.ClanShip_FedShieldMultiphased_t3 =
{
	inherit					= "ClanShip_ShieldMultiphased_t3",
	big_shield_def  		= "Effects_Dreadnought_FedDreadShield",
	uiName					= "ClanShip_FedShieldMultiphased_t3",
	uiInteract				= "Capture_ShieldMultiphased",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldMultiphased_CS",
		EnemyVitalPointDestroyed = "EnemyShieldMultiphased_CS",
	},	
}
Def.ClanShip_FedShieldMultiphased_t4 =
{
	inherit					= "ClanShip_ShieldMultiphased_t4",
	big_shield_def  		= "Effects_Dreadnought_FedDreadShield",
	uiName					= "ClanShip_FedShieldMultiphased_t4",
	uiInteract				= "Capture_ShieldMultiphased",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldMultiphased_CS",
		EnemyVitalPointDestroyed = "EnemyShieldMultiphased_CS",
	},	
}
Def.ClanShip_FedShieldMultiphased_t5 =
{
	inherit					= "ClanShip_ShieldMultiphased_t5",
	big_shield_def  		= "Effects_Dreadnought_FedDreadShield",
	uiName					= "ClanShip_FedShieldMultiphased_t5",
	uiInteract				= "Capture_ShieldMultiphased",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldMultiphased_CS",
		EnemyVitalPointDestroyed = "EnemyShieldMultiphased_CS",
	},	
}
--Hard shields "Жесткий щит"
  --свойство "Бронебойное" оружие не срабатывает, если щит активен. 7-10% шанс что урон текущего выстрела не пройдет в корпус после щита.
  --при отключении этого щита его свойства так же отключаются.
Def.ClanShip_FedShieldHard_t3 =
{
	inherit					= "ClanShip_ShieldHard_t3",
	big_shield_def  		= "Effects_Dreadnought_FedDreadShield",
	uiName					= "ClanShip_FedShieldHard_t3",
	uiInteract				= "Capture_ShieldHard",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldHard_CS",
		EnemyVitalPointDestroyed = "EnemyShieldHard_CS",
	},	
}
Def.ClanShip_FedShieldHard_t4 =
{
	inherit					= "ClanShip_ShieldHard_t4",
	big_shield_def  		= "Effects_Dreadnought_FedDreadShield",
	uiName					= "ClanShip_FedShieldHard_t4",
	uiInteract				= "Capture_ShieldHard",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldHard_CS",
		EnemyVitalPointDestroyed = "EnemyShieldHard_CS",
	},	
}
Def.ClanShip_FedShieldHard_t5 =
{
	inherit					= "ClanShip_ShieldHard_t5",	
	big_shield_def  		= "Effects_Dreadnought_FedDreadShield",
	uiName					= "ClanShip_FedShieldHard_t5",
	uiInteract				= "Capture_ShieldHard",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldHard_CS",
		EnemyVitalPointDestroyed = "EnemyShieldHard_CS",
	},	
}
--

--эмиттеры щитов для Иерихона
Def.ClanShip_JerShieldGeneratorA =
{
	inherit					= "ClanShip_ShieldGeneratorA",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldGeneratorA",
	uiInteract				= "Capture_ShieldGenerator",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
}

Def.ClanShip_JerShieldGenerator_t3 =
{
	inherit					= "ClanShip_ShieldGenerator_t3",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldGenerator_t3",
	uiInteract				= "Capture_ShieldGenerator",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
}
Def.ClanShip_JerShieldGenerator_t4 =
{
	inherit					= "ClanShip_ShieldGenerator_t4",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldGenerator_t4",
	uiInteract				= "Capture_ShieldGenerator",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
}
Def.ClanShip_JerShieldGenerator_t5 =
{
	inherit					= "ClanShip_ShieldGenerator_t5",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldGenerator_t5",
	uiInteract				= "Capture_ShieldGenerator",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldGenerator_CS",
		EnemyVitalPointDestroyed = "EnemyShieldGenerator_CS",
	},		
}
--мультифазовый  щит/ дает бонусные тикеты
Def.ClanShip_JerShieldMultiphased_t3 =
{
	inherit					= "ClanShip_ShieldMultiphased_t3",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldMultiphased_t3",
	uiInteract				= "Capture_ShieldMultiphased",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldMultiphased_CS",
		EnemyVitalPointDestroyed = "EnemyShieldMultiphased_CS",
	},	
}
Def.ClanShip_JerShieldMultiphased_t4 =
{
	inherit					= "ClanShip_ShieldMultiphased_t4",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldMultiphased_t4",
	uiInteract				= "Capture_ShieldMultiphased",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldMultiphased_CS",
		EnemyVitalPointDestroyed = "EnemyShieldMultiphased_CS",
	},	
}
Def.ClanShip_JerShieldMultiphased_t5 =
{
	inherit					= "ClanShip_ShieldMultiphased_t5",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldMultiphased_t5",
	uiInteract				= "Capture_ShieldMultiphased",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldMultiphased_CS",
		EnemyVitalPointDestroyed = "EnemyShieldMultiphased_CS",
	},	
}
--Hard shields "Жесткий щит"
  --свойство "Бронебойное" оружие не срабатывает, если щит активен. 7-10% шанс что урон текущего выстрела не пройдет в корпус после щита.
  --при отключении этого щита его свойства так же отключаются.
Def.ClanShip_JerShieldHard_t3 =
{
	inherit					= "ClanShip_ShieldHard_t3",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldHard_t3",
	uiInteract				= "Capture_ShieldHard",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldHard_CS",
		EnemyVitalPointDestroyed = "EnemyShieldHard_CS",
	},	
}
Def.ClanShip_JerShieldHard_t4 =
{
	inherit					= "ClanShip_ShieldHard_t4",
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldHard_t4",
	uiInteract				= "Capture_ShieldHard",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldHard_CS",
		EnemyVitalPointDestroyed = "EnemyShieldHard_CS",
	},	
}
Def.ClanShip_JerShieldHard_t5 =
{
	inherit					= "ClanShip_ShieldHard_t5",	
	big_shield_def  		= "Effects_Dreadnought_JerDreadShield",
	uiName					= "ClanShip_JerShieldHard_t5",
	uiInteract				= "Capture_ShieldHard",
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyShieldHard_CS",
		EnemyVitalPointDestroyed = "EnemyShieldHard_CS",
	},	
}
--

-------------------------------------
-- усилители пушек
-------------------------------------
Def.ClanShip_TurretPowerB = 
{
	inherit					= "ClanShip_BaseGen",
	model					= "mapskit/maps/models/bigship/dreadnought_cooler_imp",
	
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	idle_sound				= "sound/dreadnought/hangar_generator_loop",
	death_sound				= "sound/dreadnought/generator_off",
	interacting_fx			= "particles/gadget/drone_beam", --"particles/ships/looting",
	
	uiName					= "TurretPower",
	gameplay_idx			= 1,
	--spawn_group				= 2,
	
	health					= health_big_slot, 
	reset_time				= beacon_timeout,
	interaction_distance 	= 75,
	uiInteract				= "Capture_TurretPower",
	
	GameplayNotifications 	=
	{
		AllyVitalPointDestroyed = "AllyTurretPowerDestroyed_CS",
		EnemyVitalPointDestroyed = "EnemyTurretPowerDestroyed_CS",
	},
	
	hud_ico					= "CS_B",
	
	clanship_bonuses =
	{
		{ type = ai.ClanshipBonus.MAIN_TURRET_DAMAGE, activation = ai.ClansShipActivationType.WHEN_ALIVE, param = 0.1 },
		--{ type = ai.ClanshipBonus.MAIN_TURRET_DISABLE, activation = ai.ClansShipActivationType.WHEN_DEAD },
		{ type = ai.ClanshipBonus.DECREASE_TICKETS, activation = ai.ClansShipActivationType.ON_DEATH, param = 100*2 },	--- 50*2
	},
}

--
Def.ClanShip_CannonControl_t3 =
{
	inherit					= "ClanShip_TurretPowerB",
	clanship_bonuses		= { { param = 0.375 } },
	uiName					= "ClanShip_CannonControl_t3",
	uiInteract				= "Capture_CannonControl",
	tier 					= 3,
	disable_clanship_torpedo= true,
	GameplayNotifications 	=
	{
		AllyVitalPointDestroyed = "AllyCannonControl_CS",
		EnemyVitalPointDestroyed = "EnemyCannonControl_CS",
	},	
}
Def.ClanShip_CannonControl_t4 =
{
	inherit					= "ClanShip_TurretPowerB",
	clanship_bonuses		= { { param = 0.375 * 1.1 } },
	uiName					= "ClanShip_CannonControl_t4",
	uiInteract				= "Capture_CannonControl",
	tier 					= 4,
	disable_clanship_torpedo= true,
	GameplayNotifications 	=
	{
		AllyVitalPointDestroyed = "AllyCannonControl_CS",
		EnemyVitalPointDestroyed = "EnemyCannonControl_CS",
	},	
}
Def.ClanShip_CannonControl_t5 =
{
	inherit					= "ClanShip_TurretPowerB",
	clanship_bonuses		= { { param = 0.375 * 1.2 } },
	uiName					= "ClanShip_CannonControl_t5",
	uiInteract				= "Capture_CannonControl",
	tier 					= 5,
	disable_clanship_torpedo= true,
	GameplayNotifications 	=
	{
		AllyVitalPointDestroyed = "AllyCannonControl_CS",
		EnemyVitalPointDestroyed = "EnemyCannonControl_CS",
	},		
}
--
--
Def.ClanShip_ArmorPenetration_t3 =
{
	inherit					= "ClanShip_TurretPowerB",
	clanship_bonuses		= { { type = ai.ClanshipBonus.MAIN_TURRET_DAMAGE_HULL, param = 0.75 } },	--0.05
	uiName					= "ClanShip_ArmorPenetration_t3",
	uiInteract				= "Capture_ArmorPenetration",
	tier 					= 3,
	GameplayNotifications 	=
	{
		AllyVitalPointDestroyed = "AllyArmorPenetration_CS",
		EnemyVitalPointDestroyed = "EnemyArmorPenetration_CS",
	},		
}
Def.ClanShip_ArmorPenetration_t4 =
{
	inherit					= "ClanShip_TurretPowerB",
	clanship_bonuses		= { { type = ai.ClanshipBonus.MAIN_TURRET_DAMAGE_HULL, param = 0.75 * 1.1 } }, --0.5 * 1.1
	uiName					= "ClanShip_ArmorPenetration_t4",
	uiInteract				= "Capture_ArmorPenetration",
	tier 					= 4,
	GameplayNotifications 	=
	{
		AllyVitalPointDestroyed = "AllyArmorPenetration_CS",
		EnemyVitalPointDestroyed = "EnemyArmorPenetration_CS",
	},		
}
Def.ClanShip_ArmorPenetration_t5 =
{
	inherit					= "ClanShip_TurretPowerB",
	clanship_bonuses		= { { type = ai.ClanshipBonus.MAIN_TURRET_DAMAGE_HULL, param = 0.75 * 1.2 } }, --0.5 * 1.2
	uiName					= "ClanShip_ArmorPenetration_t5",
	uiInteract				= "Capture_ArmorPenetration",
	tier 					= 5,
	GameplayNotifications 	=
	{
		AllyVitalPointDestroyed = "AllyArmorPenetration_CS",
		EnemyVitalPointDestroyed = "EnemyArmorPenetration_CS",
	},		
}
--
--
Def.ClanShip_ION_t3 =
{
	inherit					= "ClanShip_TurretPowerB",
	clanship_bonuses		= { { param = 0.375 } },
	tier 					= 3,
}
Def.ClanShip_ION_t4 =
{
	inherit					= "ClanShip_TurretPowerB",
	clanship_bonuses		= { { param = 0.375 * 1.1 } },
	tier 					= 4,
}
Def.ClanShip_ION_t5 =
{
	inherit					= "ClanShip_TurretPowerB",
	clanship_bonuses		= { { param = 0.375 * 1.2 } },
	tier 					= 5,
}
--

----------------------------------
-- усилитель тикетов
----------------------------------
Def.ClanShip_TicketTowerC = 
{
	inherit					= "ClanShip_BaseGen",
	model					= "mapskit/maps/models/bigship/dreadnought_control_cab_imp",
	physics					= { solid_type = solid.compound_model, static = true, material = "Metal" },
	
	idle_sound				= "sound/dreadnought/hangar_generator_loop",
	death_sound				= "sound/dreadnought/generator_off",
	interacting_fx			= "particles/gadget/drone_beam", --"particles/ships/looting",

	uiName					= "TicketTower",
	gameplay_idx			= 2,
	--spawn_group				= 3,
	
	health					= health_big_slot, 
	reset_time				= beacon_timeout,
	interaction_distance 	= 75,
	
	uiInteract				= "Capture_TicketTower",
	
	GameplayNotifications =
	{
		AllyVitalPointDestroyed = "AllyTicketDestroyed_CS",
		EnemyVitalPointDestroyed = "EnemyTicketDestroyed_CS",
	},		
	
	hud_ico					= "CS_C",
	
	clanship_bonuses =
	{
		{ type = ai.ClanshipBonus.DECREASE_TICKETS, activation = ai.ClansShipActivationType.ON_DEATH, param = 200*2 },
		{ type = ai.ClanshipBonus.DRONES_RESPAWN_DISABLE, activation = ai.ClansShipActivationType.WHEN_DEAD, param = 1 },
	},
}

Def.ClanShip_Angar_t3 =
{
	inherit					= "ClanShip_TicketTowerC",
	clan_ship_points 		= { { param = 150*2 } },  --столько очков отнимается при захвате.
	uiName					= "ClanShip_Angar_t3",
	tier 					= 3,
	clanship_bonuses =
	{
		{ type = ai.ClanshipBonus.DECREASE_TICKETS, activation = ai.ClansShipActivationType.ON_DEATH, param = 150*2 },
		{ type = ai.ClanshipBonus.DRONES_RESPAWN_DISABLE, activation = ai.ClansShipActivationType.WHEN_DEAD, param = 1 },
		{ type = ai.ClanshipBonus.AURA, aura = "Clanship_Angar_T3", activation = ai.ClansShipActivationType.WHEN_ALIVE },
		{ type = ai.ClanshipBonus.AURA, aura = "Clanship_HealHull_T3", activation = ai.ClansShipActivationType.WHEN_ALIVE },
		{ type = ai.ClanshipBonus.AURA, aura = "Clanship_HealShield_T3", activation = ai.ClansShipActivationType.WHEN_ALIVE },
		{ type = ai.ClanshipBonus.PLAYERS_REUSE_SHIPS_DISABLE, activation = ai.ClansShipActivationType.WHEN_DEAD, param = 1 },	-- SC-80349
	},
}
Def.ClanShip_Angar_t4 =
{
	inherit					= "ClanShip_TicketTowerC",
	clan_ship_points 		= { { param = 125*2 } },  --столько очков отнимается при захвате.
	uiName					= "ClanShip_Angar_t4",
	tier 					= 4,
	clanship_bonuses =
	{
		{ type = ai.ClanshipBonus.DECREASE_TICKETS, activation = ai.ClansShipActivationType.ON_DEATH, param = 135*2 },	---125*2
		{ type = ai.ClanshipBonus.DRONES_RESPAWN_DISABLE, activation = ai.ClansShipActivationType.WHEN_DEAD, param = 1 },
		{ type = ai.ClanshipBonus.AURA, aura = "Clanship_Angar_T4", activation = ai.ClansShipActivationType.WHEN_ALIVE },
		{ type = ai.ClanshipBonus.AURA, aura = "Clanship_HealHull_T4", activation = ai.ClansShipActivationType.WHEN_ALIVE },
		{ type = ai.ClanshipBonus.AURA, aura = "Clanship_HealShield_T4", activation = ai.ClansShipActivationType.WHEN_ALIVE },		
		{ type = ai.ClanshipBonus.PLAYERS_REUSE_SHIPS_DISABLE, activation = ai.ClansShipActivationType.WHEN_DEAD, param = 1 },	-- SC-80349
	},	
}
Def.ClanShip_Angar_t5 =
{
	inherit					= "ClanShip_TicketTowerC",
	clan_ship_points 		= { { param = 100*2 } },  --столько очков отнимается при захвате.
	uiName					= "ClanShip_Angar_t5",
	tier 					= 5,
	clanship_bonuses =
	{
		{ type = ai.ClanshipBonus.DECREASE_TICKETS, activation = ai.ClansShipActivationType.ON_DEATH, param = 125*2 },	---100*2
		{ type = ai.ClanshipBonus.DRONES_RESPAWN_DISABLE, activation = ai.ClansShipActivationType.WHEN_DEAD, param = 1 },	
		{ type = ai.ClanshipBonus.AURA, aura = "Clanship_Angar_T5", activation = ai.ClansShipActivationType.WHEN_ALIVE },
		{ type = ai.ClanshipBonus.AURA, aura = "Clanship_HealHull_T5", activation = ai.ClansShipActivationType.WHEN_ALIVE },
		{ type = ai.ClanshipBonus.AURA, aura = "Clanship_HealShield_T5", activation = ai.ClansShipActivationType.WHEN_ALIVE },
		{ type = ai.ClanshipBonus.PLAYERS_REUSE_SHIPS_DISABLE, activation = ai.ClansShipActivationType.WHEN_DEAD, param = 1 },	-- SC-80349
	},
}

--Щиты
Def.ClanShip_ShieldBlue = 
{ 	
	class 						= "ClanShipShield",
	use_team_skin 				= true,
	in_editor					= true,
	network_sync				= true,
	model						= "models/shields/dread_shield_emp",
	physics						= { solid_type = solid.none, static = true, material = "Metal" },
	highlight_time			= 1.5,
}

Def.Effects_Dreadnought_FedDreadShield =
{
	class						= "ClanShipShield",
	model						= "models/shields/dread_shield_fed",
	use_team_skin 				= true,
	in_editor					= true,
	network_sync				= true,
	physics						= { solid_type = solid.none, static = true, material = "Metal" },
	highlight_time			= 1.5,
}
Def.Effects_Dreadnought_JerDreadShield =
{
	class						= "ClanShipShield",
	model						= "models/shields/dread_shield_jer",	
	use_team_skin 				= true,
	in_editor					= true,
	network_sync				= true,
	physics						= { solid_type = solid.none, static = true, material = "Metal" },
	highlight_time			= 1.5,
}

Def.ClanShip_ShieldSmallHor = 
{ 	
	inherit 					= "Turret_Holder",
	use_team_skin 				= true,
	in_editor					= true,
	model						= "models/shields/shield_horizontal",
	physics						= { solid_type = solid.none, static = true, material = "Metal" },
}
Def.ClanShip_ShieldSmallVer = 
{ 	
	inherit 					= "Turret_Holder",
	use_team_skin 				= true,
	in_editor					= true,
	model						= "models/shields/shield_vertical",
	physics						= { solid_type = solid.none, static = true, material = "Metal" },
}
Def.ClanShip_ShieldSmallHor2 = 
{ 	
	inherit 					= "Turret_Holder",
	use_team_skin 				= true,
	in_editor					= true,
	model						= "models/shields/shield_horizontal_big",
	physics						= { solid_type = solid.none, static = true, material = "Metal" },
}


----------------------------------
--ОБЪЕКТЫ--
----------------------------------
--Ускоритель
Def.ClanShip_Accelerator =
{
	class 				= "WarpGate",
	in_editor			= true,
	model				= "models/objects/jump_gates/Accelerator/accelerator",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
	damageable			= false,
	maxViewDist			= 5000,

	use_team_skin = true,
	
	hud_ico				= "ClanShip_Accelerator",
	warp_spell			= "Warp_Shift",
	warp_distance 		= 1000,
	warp_cooldown 		= 0.5,
	work_sound 			= "sound/gadgets/clanship/accelerator_work_loop", 
	warp_sound  		= "sound/gadgets/warpgate/ship_warp_out",

	warp_forward 		= true,
	warp_check_angle	= 80,
	warp_check_box_scale = 0.5,

	children = 
	{
		{ effect = { s1 = "particles/jumpgates/accelerator", s2 = "particles/jumpgates/accelerator_red" }, joint = "fx1" },
		{ effect = { s1 = "particles/jumpgates/accelerator", s2 = "particles/jumpgates/accelerator_red" }, joint = "fx2" },
		{ effect = { s1 = "particles/jumpgates/accelerator", s2 = "particles/jumpgates/accelerator_red" }, joint = "fx3" },
		{ effect = { s1 = "particles/jumpgates/accelerator", s2 = "particles/jumpgates/accelerator_red" }, joint = "fx4" },
	},

	uiName				= "ClanShip_Accelerator",	
}

Def.ClanShip_Stuff_PowerBlock =
{
	inherit 					= "Turret_Holder",

	model						= "mapskit/maps/models/bigship/att_sys_power_block",

	use_team_skin = true,
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= 3000,
	max_detection_distance 		= 40,

	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score,
	respawn_time				= 60*5,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
}

Def.ClanShip_Stuff_Radar =
{
	inherit 					= "Turret_Holder",

	model						= "mapskit/maps/models/bigship/att_sys_radar",
	
	use_team_skin = true,
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= 6000,
	max_detection_distance 		= 80,

	uiName						= "Radar",
	
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60 * 5,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
}

Def.ClanShip_Stuff_Locator =
{
	inherit 					= "Turret_Holder",

	model						= "mapskit/maps/models/bigship/att_sys_radar2",
	
	use_team_skin = true,
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= 8000,
	max_detection_distance 		= 100,

	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60 * 15,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
}

Def.ClanShip_Stuff_ShieldGen =
{
	inherit 					= "Turret_Holder",

	model						= "mapskit/maps/models/bigship/att_sys_shield_generator",
	
	use_team_skin = true,

	uiName						= "SGen",	
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= 4000,
	max_detection_distance 		= 60,

	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score,
	respawn_time				= 60*5,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
}

Def.ClanShip_Stuff_PowerBlockIn =
{
	inherit 					= "Turret_Holder",

	model						= "mapskit/maps/models/bigship/power_block2_in3",
	
	use_team_skin = true,
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= 20000,
	max_detection_distance 		= 150,

	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
}

Def.ClanShip_Stuff_PowerBlockLine =
{
	inherit 					= "Turret_Holder",

	model						= "mapskit/maps/models/bigship/power_block2_line",
	
	use_team_skin = true,
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= 12000,
	max_detection_distance 		= 120,

	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
}

Def.ClanShip_Stuff_Plate =
{
	inherit 					= "ClanShip_Stuff_Locator",
	model						= "models/objects/gameplay/platform/platform_04",
	
	use_team_skin = true,
}

Def.ClanShip_Stuff_Tiny_Ball =
{
	inherit 					= "Turret_Holder",

	model						= "models/objects/gameplay/bombball/bombball",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= 1000,
	max_detection_distance 		= 40,

	hudType						= "default",
	use_team_skin 				= true,
	
	on_death_damage_to_clanship = structures_score,
	respawn_time				= 60*5,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
}

Def.ClanShip_Stuff_Tiny_Cylinder =
{
	inherit 					= "ClanShip_Stuff_Tiny_Ball",
	model						= "models/objects/gameplay/energy_box/energy_box",
}

Def.Blastwave_ClanShip_Stuff =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 2000,
	blast_maxDistance	= 20,
	apply_damage		= true,
	apply_shake 		= true,

	effect 				= "particles/other/dreadnought_part_explosion",
	light_color 		= "80 80 255 150",
	light_radius 		= 80,
	light_time 			= 0.9,
	sound 				= "sound/dreadnought/big_cannon_hit",
}

Def.Blastwave_ClanShip_Stuff2 =
{
	class				= "BlastWave",
	in_editor			= false,

	damage_thermal		= 2000,
	blast_maxDistance	= 20,
	apply_damage		= true,
	apply_shake 		= true,
	
	effect 				= "particles/other/dreadnought_part_explosion",
	light_color 		= "80 80 255 150",
	light_radius 		= 80,
	light_time 			= 0.9,
	sound 				= "sound/explosion/dr_module_expl",
}

--- ==================================
--- мелкие элементы
element_health = 80000	-- 40000 30000 #65691

Def.ClanShip_Stuff_Emp_ElementA =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_a",
	physics				= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	wreck 						= "ClanShip_Effects_Smoke",
	explosion 					= "Blastwave_ClanShip_Stuff2", 
	
	children = 
	{
		{ def = "ClanShip_Lights_Beam", joint = "eff1" },
	},
	
	uiName 						= "ElementA",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_ElementB =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_b",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Effects_Smoke",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementB",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_ElementC =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_c",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	wreck 						= "ClanShip_Effects_Smoke",
	explosion 					= "Blastwave_ClanShip_Stuff2",
	
	children = 
	{
		{ def = "ClanShip_Lights_Beam", joint = "eff1" },
	},
	
	uiName 						= "ElementC",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_ElementD =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_d",
	
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	wreck 						= "ClanShip_Effects_Smoke",
	explosion 					= "Blastwave_ClanShip_Stuff2",
	
	uiName 						= "ElementD",
	
	children = 
	{
		{ def = "ClanShip_Lights_Beam", joint = "eff1" },
		{ def = "ClanShip_Lights_Beam", joint = "eff2" },
	},
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_ElementF =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_f",
	
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
	
	uiName 						= "ElementF",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_ElementI =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_i",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 220,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
	
	uiName 						= "ElementI",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_ElementJ =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_j",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff2", 
	
	uiName 						= "ElementJ",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_SGen =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/att_sys_shield_generator",
	
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff2", 
	
	uiName 						= "SGen",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}
Def.ClanShip_Stuff_Emp_Beacon =
{
	class						= "ScBaseEntity",
	use_team_skin 				= true,
	model						= "mapskit/maps/models/bigship/att_sys_ship_beacon",

 	remove_on_death				= false,
	damageable					= false,
	uiName 						= "SGen",	
	network_sync 				= false,
}
Def.ClanShip_Flat_Beacon =
{
	class				        = "ScBaseEntity",	
	model				        =	"mapskit/maps/models/bigship/flat_beacon",
	physics				        = { solid_type = solid.none, static = true, material = "Metal" },	
	use_team_skin 		        = true,
	network_sync 				= false,
}
Def.ClanShip_Stuff_Emp_Radar2 =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/att_sys_radar2",
	
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "Radar",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_Radar =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/att_sys_radar",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType			= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff2",
	
	uiName 						= "Radar",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_PBlockL =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/att_sys_power_block_long",
	
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hudType						= "minor",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 				= "PBlock",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_PBlock3 =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/att_sys_power_block_in3",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hudType						= "minor",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
	
	uiName 						= "PBlock",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Emp_PBlock1 =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/att_sys_power_block_in1",
	
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hudType						= "minor",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
	
	uiName 				= "PBlock",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Fed_ElementA =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element1",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementA",
}

Def.ClanShip_Stuff_Fed_ElementB =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element2",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementB",
}

Def.ClanShip_Stuff_Fed_ElementC =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element3",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementC",
}

Def.ClanShip_Stuff_Fed_ElementD =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element4",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementD",
	
	children = 
	{
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef1" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef2" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef3" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef4" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef5" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef6" },		
	},	
}

Def.ClanShip_Stuff_Fed_ElementE =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element5",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementD",
}

Def.ClanShip_Stuff_Fed_ElementF =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element6",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementD",
}


Def.ClanShip_Stuff_Fed_ElementG =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_b",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementB",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Fed_ElementH =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_c",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff2",
	
	uiName 						= "ElementC",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Fed_ElementI =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_d",
	
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff2",
	
	uiName 						= "ElementD",
	
	children = 
	{
		{ def = "ClanShip_Lights_Beam", joint = "eff1" },
		{ def = "ClanShip_Lights_Beam", joint = "eff2" },
	},
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Fed_ElementJ =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_f",
	
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
	
	uiName 						= "ElementF",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Fed_ElementK = 
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/bs_imper_element_i",
	
	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 220,

	hud_visibility_type		= "minor",
	hudType					= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff",
	
	uiName 						= "ElementI",
	
	points_reward_kill 			= 10,
	points_reward_assist_damage	= 50,
	exp_reward_kill 			= 10,
	exp_reward_assist_damage	= 50,
}

Def.ClanShip_Stuff_Jer_ElementA =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element1",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementA",
}

Def.ClanShip_Stuff_Jer_ElementA1 =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element1a",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementA",
}

Def.ClanShip_Stuff_Jer_ElementB =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element2",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementB",
}

Def.ClanShip_Stuff_Jer_ElementC =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element3",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementC",
}

Def.ClanShip_Stuff_Jer_ElementD =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element4",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementD",
	
	children = 
	{
		{ def = "ClanShip_Lightobject_CilinderVer", joint = "cilinders_connect" },
	},	
}

Def.ClanShip_Stuff_Jer_ElementE =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element5",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementE",
}

Def.ClanShip_Stuff_Jer_ElementF =
{
	inherit 					= "Turret_Holder",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element6",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health						= element_health,
	max_detection_distance 		= 120,

	hud_visibility_type			= "minor",
	hudType						= "default",
	
	on_death_damage_to_clanship = structures_score_big,
	respawn_time				= 60*30,
	--wreck 						= "Debris_Debris02",
	explosion 					= "Blastwave_ClanShip_Stuff", 
	
	uiName 						= "ElementF",
}

Def.ClanShip_Stuff_Jer_Beacon =
{
	class						= "ScBaseEntity",

	use_team_skin = true,
	
	model						= "mapskit/maps/models/bigship/jer/jer_bs_beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
 	remove_on_death				= false,
	damageable					= false,
	
	network_sync 				= false,
	
	uiName 						= "ElementF",
}

Def.ClanShip_TorpedoSource =
{
	class						= "ClanShipTorpedoLauncher",
	in_editor					= true,
	network_sync				= true,
	model						= "models/turret/torpedo_launcher/torpedo_launcher",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	damageable					= false,
	maxViewDist					= 5000,
	
	hud_ico						= "ClanShip_Torpedo",
	uiName 						= "ClanShip_TorpedoSource",
	
	torpedo_respawn_time		= 60,--"5"
	
	torpedo						= "ClanShip_Torpedo",
	torpedo_bones				= { "fire1", "fire2", "fire3", "fire4", "fire5" },
}

Def.ClanShip_Torpedo =
{
	class						= "ClanShipTorpedo",
	model						= "models/weapons/bs_torpedo",
	physics						= { solid_type = solid.model, kinematic = true, material = "ShipMetalMk3", mass = 10000, },
	
	is_guided					= true,
	damageable					= true,
	health						= 7500,
	speed						= 50,
	max_range					= 8000,
	
	missile_defence_immune		= true,
	missile_detection_immune	= true,
	
	hud_visibility_type			= "major",
	hudType						= "default",	
	uiName 						= "itemSubType_Torpedo",
	clanship_damage				= 50,
	
	spell_on_spawn				= "Spell_ClanShipTorpedo",
	
	explosion_blast_wave		= "BlastWave_SM_TorpedoLauncher",
	detonation_radius			= 1.0,
	flare_color					= "0 0 0 0",
	flare_size					= 0.01,
	flare_angle					= 10,
	effect						= "particles/weapons/torpedo/torpedo_tail",
	work_sound					= "sound/dreadnought/torpedo_engine",
	start_effect                = "particles/weapons/torpedo/torpedo_start",
	
	points_reward_kill 			= 5,	-- а пусть тоже очки дают тем кто их сбивает
	points_reward_assist_damage	= 25,
	exp_reward_kill 			= 5,
	exp_reward_assist_damage	= 25,
}

Def.BlastWave_SM_TorpedoLauncher = 
{
	class						= "BlastWave",
	intensity					= 200,
	damage_thermal				= 7930,
	blast_maxDistance			= 100,
	blast_minDistance			= 2,
	light_radius				= 20,
	light_time					= 0.8,
	in_editor					= false,
	apply_damage				= true,
	parent_prototype			= "SpaceMissile_Nuke_T5_Mk1",
}

Def.ClanShip_Lights_Beam = 
{
	class           = 	"BeamEntity",
	in_editor       =   true,
	size			=	30,
	width			=	6,
	
	use_team_skin	= true,
	
	color 			= { s1 = "124 204 252 4", s2 = "254 139 122 4" },
}

Def.ClanShip_Lightobject_CilinderHor = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_cilinder_hor",
	in_editor       =   true,
	--size			=	30,
	--width			=	6,
	
	use_team_skin	= true,	
}

Def.ClanShip_Lightobject_CilinderVer = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_cilinder_ver",
	in_editor       =   true,
	--size			=	30,
	--width			=	6,
	
	use_team_skin	= true,	
}

Def.ClanShip_Lightobject_Rings = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_rings",
	in_editor       =   true,
	--size			=	30,
	--width			=	6,
	
	use_team_skin	= true,	
}

Def.ClanShip_Lightobject_Kolpachki = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_kolpachki",
	in_editor       =   true,
	--size			=	30,
	--width			=	6,
	
	use_team_skin	= true,	
}

Def.ClanShip_Lightobject_Lightroads = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_lightroads",
	in_editor       =   true,
	--size			=	30,
	--width			=	6,
	
	use_team_skin	= true,	
}

Def.ClanShip_Lightobject_Tubes = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_tubes",
	in_editor       =   true,
	--size			=	30,
	--width			=	6,
	
	use_team_skin	= true,	
}

-- ниже описаны астероиды
-- Астероиды с сине-зеленым, взрыв большой 5 7 7
Def.Movement_Asteroid1 =
{
	class 			= "PathMovementEntity",
	model			= "models/objects/asteroids/asteroid_set_01",
	in_editor		= true,

	--projectile_unstoppable = true, --этот параметр говорит заряду уничтожаться после попадания в астероид, или нет и прописывать его надо у пушки
	killable 		= true,
	remove_on_death = true,
	
	self_respawn	= true,
	start_deactivated = true,
	
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Rock", mass = 1000000, },
	as_static		= true,

	maxViewDist		= 30000,
	max_lin_speed		= 10,	-- 25 замедлил атсеройды

	--дистанция идет из расчета scale_offset+scale_dist #49680
	scale_offset	= 100, 
	scale_dist 		= 900,
	scale_power 	= 1.7,
	transp_offset	= 900, 
	transp_dist		= 100,
	transp_power	= 1,
	--exp
	death_effect	= "particles/explosions/asteroid_explosion_green",
    
    -- broken_parts = 
	-- {
	 -- { def = "Asteroid_Wreck1",	debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
		-- { def = "Asteroid_Wreck2", 	debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
		-- { def = "Asteroid_Wreck3",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
		-- { def = "Asteroid_Wreck4",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
		-- { def = "Asteroid_Wreck5",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
		-- { def = "Asteroid_Wreck6",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
		-- { def = "Asteroid_Wreck7",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
		-- { def = "Asteroid_Wreck8",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
		-- { def = "Asteroid_Wreck9",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
		-- { def = "Asteroid_Wreck10",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
     -- { def = "Asteroid_Wreck11",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
     -- { def = "Asteroid_Wreck12",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 0.3, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	-- },
	
	uiName			= "MovingAsteroid",
}

Def.Movement_Asteroid2 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/asteroid_set_02", 
}

Def.Movement_Asteroid3 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/asteroid_set_03", 
}

Def.Movement_Asteroid4 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/asteroid_set_04", 
}

Def.Movement_Asteroid5 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/asteroid_set_05", 
}

Def.Movement_Asteroid6 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/asteroid_set_06", 
}

Def.Movement_Asteroid7 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/asteroid_set_07", 
}

Def.Movement_Asteroid8 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/asteroid_set_08", 
}

Def.Movement_Asteroid9 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/asteroid_set_09", 
}

-- Коричневые астероиды, взрыв большой 12 12 10
Def.Movement_Asteroid11 =
{
	inherit 		= "Movement_Asteroid1",
	model			= "models/objects/asteroids/map04_rocks/map04_rock_01",
	death_effect	= "particles/explosions/asteroid_explosion_groundy",	
    --broken_parts = 
	--{
	--	{ def = "Asteroid_Big_Wreck1",	debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--	{ def = "Asteroid_Big_Wreck2", 	debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--	{ def = "Asteroid_Big_Wreck3",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--	{ def = "Asteroid_Big_Wreck4",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--	{ def = "Asteroid_Big_Wreck5",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--	{ def = "Asteroid_Big_Wreck6",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--	{ def = "Asteroid_Big_Wreck7",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--	{ def = "Asteroid_Big_Wreck8",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--	{ def = "Asteroid_Big_Wreck9",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--	{ def = "Asteroid_Big_Wreck10",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
    --  { def = "Asteroid_Big_Wreck11",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
    --  { def = "Asteroid_Big_Wreck12",  debris = false, pos = Vec3( 0, 0, 0 ), dumping = 4, speed = 30.0, speed_deviation = 0.3, speed_inherit = 0, ttl = 4, },
	--},
}

Def.Movement_Asteroid12 =
{
	inherit			= "Movement_Asteroid11",
	model			= "models/objects/asteroids/map04_rocks/map04_rock_02", 
}

Def.Movement_Asteroid13 =
{
	inherit			= "Movement_Asteroid11",
	model			= "models/objects/asteroids/map04_rocks/map04_rock_03", 
}

Def.Movement_Asteroid14 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/map04_rocks/map04_rock_04", 
}

Def.Movement_Asteroid15 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/map04_rocks/map04_rock_05", 
}

Def.Movement_Asteroid16 =
{
	inherit			= "Movement_Asteroid11",
	model			= "models/objects/asteroids/map04_rocks/map04_rock_06", 
}

Def.Movement_Asteroid17 =
{
	inherit			= "Movement_Asteroid11",
	model			= "models/objects/asteroids/map04_rocks/map04_rock_07", 
}

Def.Movement_Asteroid18 =
{
	inherit			= "Movement_Asteroid11",
	model			= "models/objects/asteroids/map04_rocks/map04_rock_08", 
}

Def.Movement_Asteroid19 =
{
	inherit			= "Movement_Asteroid1",
	model			= "models/objects/asteroids/map04_rocks/map04_rock_09", 
}

-- Белые астероиды, взрыв средний 173 167 167
Def.Movement_Asteroid21 =   
{
	inherit 		= "Movement_Asteroid1",
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_1",
	death_effect	= "particles/explosions/asteroid_explosion_grey",
}

Def.Movement_Asteroid22 =
{
	inherit			= "Movement_Asteroid21",
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_2", 
}

Def.Movement_Asteroid23 =
{
	inherit			= "Movement_Asteroid21",
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_3", 
}

Def.Movement_Asteroid24 =
{
	inherit			= "Movement_Asteroid21",
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_4", 
}

Def.Movement_Asteroid25 =
{
	inherit			= "Movement_Asteroid21",
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_5", 
}

Def.Movement_Asteroid26 =
{
	inherit			= "Movement_Asteroid21",
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_6", 
}

Def.Movement_Asteroid27 =
{
	inherit			= "Movement_Asteroid21",
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_7", 
}

Def.Movement_Asteroid28 =
{
	inherit			= "Movement_Asteroid21",
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_8", 
}

Def.Movement_Asteroid29 =
{
	inherit			= "Movement_Asteroid21",
	model			= "models/objects/asteroids/asteroid_sets_02/asteroid_sets_02_4", -- asteroid_sets_02_9 бажный меш
}

--Эффекты
Def.Effects_Dreadnought_DreadLightRect =
{
	class 			= "ScBaseEntity",
	model			= "models/illumination/rectlight",
	in_editor		= true,
	use_team_skin	= true,
}

Def.Lights_ClanShipPointLight = {
	class				=	'PointLight',
	in_editor			=	true,
	use_team_skin		= 	true,
	color 				= 	{ s1 = "43 149 255 8", s2 = "255 82 45 8" },
}

--оружие для дронов
Def.Weapon_ClanShipDrone_PlasmaAuto={
	inherit				= "Weapon_Plasmagun_Autofire_T2_Mk1",
	tier				=	5,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	fire_rate			= 80,
}

Def.Weapon_ClanShipDrone_Heavy={
	inherit				= "Weapon_Plasmagun_Heavy_T2_Mk1",
	tier				=	5,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	fire_rate			= 30,
}

Def.Weapon_ClanShipDrone_Laser={
	inherit			= "Weapon_Laser_Sniper_T2_Mk1",
	tier			=	5,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
}

Def.Weapon_ClanShipDrone_JerichoLaser={
	inherit			= "Weapon_Laser_Sniper_T2_Mk1",
	tier			=	5,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
}

Def.Weapon_ClanShipDrone_FedLaser={
	inherit			= "Weapon_Laser_Sniper_T4_Mk1",
	tier			=	5,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
}

Def.Module_ClanShipDrone_TimeBoost={
	inherit				= "Module_TimeBoost_T4_Base",
	tier				=	5,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
}

Def.ModulePassive_ClanShipDrone_CollisionComp={
	inherit				= "ModulePassive_CollisionComp_T5_Mk1",
	tier				=	5,
	storeItemId			= 0,
	cant_be_bought  	= true,
	drop_weight			= 0,	
	contact_damage_cf_mul	= -200
}

Def.ClanShip_PulsarTurret = 
{
	class				= "AuraHolderEntity",
	in_editor			= true,
	damageable			= true,
	use_clanship_damage_coef	= true, --- SC-114647
	health 				= 3000,
	model				= "models/turret/round_railgun01/round_railgun01_holder",
	physics				= { solid_type = solid.sphere,  static = true, material = "Metal" } ,
	 
	hudType 			= "default",

	uiName 				= "Module_ShieldRayLarge",
	uiDesc 				= "Module_ShieldRayLarge_Desc",		

	spell_on_spawn		= "SmartBomb_ClanShip",
	
	death_effect			= "particles/explosions/objects/explosion_tiny",
	death_sound			= "sound/explosion/drone_expl",	
}

Def.ClanShip_PlasmaCannon = 
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "models/turret/big_plasma_cannon/big_plasma_cannon",
	use_team_skin	= true,	

	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

---------------------
--ОБЪЕКТЫ НА ВЕРФЯХ--
---------------------
--неактивная турель на дредноутах
Def.ClanShip_Yard_BigPlasmaCannon = 
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "models/turret/big_plasma_cannon/big_pgun/big_pgun",

	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.ClanShip_Yard_PlasmaCannon = 
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "models/turret/big_plasma_cannon/big_plasma_cannon",

	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
}

Def.ClanShip_Yard_Stuff_Emp_ElementA =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_a",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	children = 
	{
		{ def = "ClanShip_Lights_Beam", joint = "eff1" },
	},
	uiName 						= "ElementA",
}

Def.ClanShip_Yard_Stuff_Emp_ElementB =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_b",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementB",
}

Def.ClanShip_Yard_Stuff_Emp_ElementC =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_c",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	children = 
	{
		{ def = "ClanShip_Lights_Beam", joint = "eff1" },
	},
	uiName 						= "ElementC",
}

Def.ClanShip_Yard_Stuff_Emp_ElementD =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_d",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementD",
	children = 
	{
		{ def = "ClanShip_Lights_Beam", joint = "eff1" },
		{ def = "ClanShip_Lights_Beam", joint = "eff2" },
	},
}

Def.ClanShip_Yard_Stuff_Emp_ElementF =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_f",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementF",
}

Def.ClanShip_Yard_Stuff_Emp_ElementI =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_i",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
}

Def.ClanShip_Yard_Stuff_Emp_ElementJ =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_j",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementJ",
}

Def.ClanShip_Yard_Stuff_Emp_SGen =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/att_sys_shield_generator",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "SGen",
}
Def.ClanShip_Yard_Stuff_Emp_Beacon =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/att_sys_ship_beacon",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "SGen",
}
Def.ClanShip_Flat_Beacon =
{
	class 						= "ScBaseEntity",
	in_editor					= true,	
	model				        =	"mapskit/maps/models/bigship/flat_beacon",
	physics				        = { solid_type = solid.none, static = true, material = "Metal" },	
	network_sync 				= false,
}
Def.ClanShip_Yard_Stuff_Emp_Radar2 =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/att_sys_radar2",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "Radar",
}

Def.ClanShip_Yard_Stuff_Emp_Radar =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/att_sys_radar",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "Radar",
}

Def.ClanShip_Stuff_Emp_PBlockL =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/att_sys_power_block_long",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "PBlock",
}

Def.ClanShip_Yard_Stuff_Emp_PBlock3 =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/att_sys_power_block_in3",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "PBlock",
}

Def.ClanShip_Yard_Stuff_Emp_PBlock1 =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/att_sys_power_block_in1",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "PBlock",
}

Def.ClanShip_Yard_Stuff_Fed_ElementA =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element1",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementA",
}

Def.ClanShip_Yard_Stuff_Fed_ElementB =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element2",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementB",
}

Def.ClanShip_Yard_Stuff_Fed_ElementC =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element3",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementC",
}

Def.ClanShip_Yard_Stuff_Fed_ElementD =
{
	class 						= "ScBaseEntity",
	use_team_skin 				= true,
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element4",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementD",
	children = 
	{
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef1" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef2" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef3" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef4" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef5" },
		{ def = "Effects_Dreadnought_EngineBlueASmall1", joint = "ef6" },		
	},	
}

Def.ClanShip_Yard_Stuff_Fed_ElementE =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element5",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementD",
}

Def.ClanShip_Yard_Stuff_Fed_ElementF =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/fed/fed_bs_element6",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementD",
}


Def.ClanShip_Yard_Stuff_Fed_ElementG =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_b",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementB",
}

Def.ClanShip_Yard_Stuff_Fed_ElementH =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_c",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementC",
}

Def.ClanShip_Yard_Stuff_Fed_ElementI =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_d",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementD",
	children = 
	{
		{ def = "ClanShip_Lights_Beam", joint = "eff1" },
		{ def = "ClanShip_Lights_Beam", joint = "eff2" },
	},
}

Def.ClanShip_Yard_Stuff_Fed_ElementJ =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/bs_imper_element_f",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementF",
}

Def.ClanShip_Yard_Stuff_Fed_ElementK = 
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	model						= "mapskit/maps/models/bigship/bs_imper_element_i",
	uiName 						= "ElementI",
}

Def.ClanShip_Yard_Stuff_Jer_ElementA =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element1",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementA",
}

Def.ClanShip_Yard_Stuff_Jer_ElementA1 =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element1a",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementA",
}

Def.ClanShip_Yard_Stuff_Jer_ElementB =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element2",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementB",
}

Def.ClanShip_Yard_Stuff_Jer_ElementC =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element3",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementC",
}

Def.ClanShip_Yard_Stuff_Jer_ElementD =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element4",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementD",
	children = 
	{
		{ def = "ClanShip_Yard_Lightobject_CilinderVer", joint = "cilinders_connect" },
	},	
}

Def.ClanShip_Yard_Stuff_Jer_ElementE =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element5",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementE",
}

Def.ClanShip_Yard_Stuff_Jer_ElementF =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element6",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementF",
}

Def.ClanShip_Yard_Stuff_Jer_Beacon =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/jer/jer_bs_beacon",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementF",
}

Def.ClanShip_Yard_Stuff_ShieldGenerator =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "models/objects/vital_point/energy_station/generator/generator",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementE",
}

Def.ClanShip_Yard_Stuff_TurretPower =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/dreadnought_cooler_imp",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementF",
}

Def.ClanShip_Yard_TicketTower =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/dreadnought_control_cab_imp",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementF",
}

Def.ClanShip_Yard_FlakGun =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "models/turret/flak_gun/flak_gun",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
}

Def.ClanShip_Yard_RailGun =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "models/turret/round_railgun01/round_railgun01",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
}

Def.ClanShip_Yard_Lightobject_CilinderHor = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_cilinder_hor",
	in_editor       =   true,
}

Def.ClanShip_Yard_Lightobject_Rings = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_rings",
	in_editor       =   true,
}

Def.ClanShip_Yard_Lightobject_Tubes = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_tubes",
	in_editor       =   true,
}

Def.ClanShip_Yard_Lightobject_CilinderVer = 
{
	class			= "ScBaseEntity",
    model			= "mapskit/maps/models/bigship/jer/lo_cilinder_ver",
	in_editor       =   true,
}
-- маленькие обломки

Def.Asteroid_Wreck1 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_1",
    death_fade_time 	= 1.5,
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck2 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_2",	
    death_fade_time 	= 1.6,  
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck3 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_3",	
    death_fade_time 	= 1.7,    
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck4 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_4",	
    death_fade_time 	= 1.8,    
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck5 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_5",	
    death_fade_time 	= 1.9,    
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck6 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_6",	
    death_fade_time 	= 2.0,    
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck7 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_7",
	death_fade_time 	= 2.1,  
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck8 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_8",	
    death_fade_time 	= 2.2,
	uiName 				= "Asteroid_Wreck",    
}
Def.Asteroid_Wreck9 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_9",
	death_fade_time 	= 2.3,   
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck10 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_10",		
    death_fade_time 	= 2.4,    
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck11 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_11",	
    death_fade_time 	= 2.5,   
	uiName 				= "Asteroid_Wreck",
}
Def.Asteroid_Wreck12 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_12",	
    death_fade_time 	= 2.6,  
	uiName 				= "Asteroid_Wreck",
}

--Большие обломки

Def.Asteroid_Big_Wreck1 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_1_b",	
    death_fade_time = 1.5,    
}
Def.Asteroid_Big_Wreck2 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_2_b",	
    death_fade_time = 1.6,    
}
Def.Asteroid_Big_Wreck3 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_3_b",	
    death_fade_time = 1.7,    
}
Def.Asteroid_Big_Wreck4 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_4_b",	
    death_fade_time = 1.8,    
}
Def.Asteroid_Big_Wreck5 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_5_b",	
    death_fade_time = 1.9,    
}
Def.Asteroid_Big_Wreck6 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_6_b",	
    death_fade_time = 2.0,    
}
Def.Asteroid_Big_Wreck7 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_7_b",	
    death_fade_time = 2.1,    
}
Def.Asteroid_Big_Wreck8 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_8_b",	
    death_fade_time = 2.2,    
}
Def.Asteroid_Big_Wreck9 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_9_b",	
    death_fade_time = 2.3,    
}
Def.Asteroid_Big_Wreck10 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_10_b",	
    death_fade_time = 2.4,    
}
Def.Asteroid_Big_Wreck11 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_11_b",	
    death_fade_time = 2.5,    
}
Def.Asteroid_Big_Wreck12 =
{
	class				= "BaseEntity",
	in_editor			= false,
	damageable			= false,
	maxViewDist			= 5000,
	physics				= { solid_type = solid.model, dynamic = true, material = "Rock", mass = 100000, },
	model				= "mapskit/maps/models/asteroids_rocks/asteroid_12_b",	
    death_fade_time = 2.6,    
}

Def.ClanShip_Decoration_1 =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "mapskit/maps/models/bigship/jer/jer_bs_element6",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "ElementF",
}

Def.ClanShip_Decoration_2 =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "models/turret/torpedo_launcher/torpedo_launcher",
	physics						= { solid_type = solid.model, static = true, material = "Metal" },
	uiName 						= "ElementF",
}

Def.ClanShip_Effects_Smoke =
{
	class = "EffectEntity",
	effect = "particles/ships/dread_stuff_smoke_2",
	in_editor	= true,
}

Def.ClanShip_Monument_Scorp =
{
	class 						= "ScBaseEntity",
	in_editor					= true,
	model						= "models/modules/scorp/scorp",
	physics						= { solid_type = solid.compound_model, static = true, material = "Metal" },
	uiName 						= "Monument",
	use_team_skin 				= true,
}