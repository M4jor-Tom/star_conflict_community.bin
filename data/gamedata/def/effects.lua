---------------------------------------------------------------------
--                         Nebula  effetcs                         --
---------------------------------------------------------------------

Def.Effects_Nebula_GravyAnomaly =
{
	class = "Nebula",
	in_editor = true,
	inside_effect = "particles/areal/areal_gravyanomaly",
	int_radius = 175.0,
	ext_radius = 225.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_GravyAnomalyAlien =
{
	class = "Nebula",
	in_editor = true,
	inside_effect = "particles/areal/areal_gravyanomaly_alien",
	int_radius = 175.0,
	ext_radius = 225.0,
	maxViewDist = 999999,
}

Def.Effects_SuicideRadiation =
{
	class = "Nebula",
	in_editor = true,
	screen_effect = "particles/screen/radiation",
	int_radius = 10.0,
	ext_radius = 60.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula =
{
	class = "Nebula",
	in_editor = true,
	effect = "particles/areal/nebula_permanent",
	camera_effect = "particles/areal/areal_debris",
	int_radius = 50.0,
	ext_radius = 64.0,
	maxViewDist = 999999,
}

Def.Effects_DangerCloud =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/areal_debris_dng",
	int_radius = 230.0,
	ext_radius = 240.0,
	maxViewDist = 999999,
}

Def.Effects_DustCloud =
{
}

Def.Effects_AlienAnomaly =
{
	class = "Nebula",
	in_editor = true,
	--inside_effect = "particles/areal/areal_alien_anomaly",
	int_radius = 270.0,
	ext_radius = 280.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_HotWrecks =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/areal_debris_b",
	int_radius = 230.0,
	ext_radius = 240.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_Anomaly150 =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/areal_debris_b",
	int_radius = 140.0,
	ext_radius = 150.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_WreckShip600 =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/areal_wreck_ship",
	int_radius = 590.0,
	ext_radius = 600.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_WreckShip700 =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/areal_wreck_ship",
	int_radius = 690.0,
	ext_radius = 700.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_ArealLava =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/areal_lava",
	screen_effect = "particles/screen/heat",
	int_radius = 220.0,
	ext_radius = 240.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_ShieldHavoc =
{
	class = "Nebula",
	in_editor = true,
	screen_effect = "particles/screen/glitch",
	camera_effect = "particles/areal/area_lightnings",
	hit_shield_effect_interval = 0.15,
	nebula_shieldEffectIntencityFactor = 100.0,
	int_radius = 1.0,
	ext_radius = 110.0,
	maxViewDist = 999999,
	show_after = 3.0, --Дилей на появление
}

Def.Effects_Nebula_NukeVoidzone =
{
	class = "Nebula",
	in_editor = true,
	int_radius = 1.0,
	ext_radius = 40.0,
	maxViewDist = 999999,
	--screen_effect = "particles/screen/radiation",
}

Def.Effects_Nebula_FuelDrop =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/areal_haze",
	int_radius = 1.0,
	ext_radius = 55.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.15,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_Emissions =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/areal_haze",
	int_radius = 25.0,
	ext_radius = 50.0,
	maxViewDist = 999999,
	show_after = 1.75,
	hit_shield_effect_interval = 0.15,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_Snow =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/areal_spacesnow",
	int_radius = 33.0,
	ext_radius = 100.0,
	maxViewDist = 999999,
	show_after = 0.5,
}

Def.Effects_Nebula_GreenSphere =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/area_lightnings",
	int_radius = 75.0,
	ext_radius = 100.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.15,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_GreenCylinder =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/area_lightnings",
	int_radius = 30.0,
	ext_radius = 60.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.15,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_TachRay =
{
	class = "Nebula",
	in_editor = true,
	int_radius = 25.0,
	ext_radius = 50.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.15,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_BossRay =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/area_damageray",
	int_radius = 50.0,
	ext_radius = 60.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.15,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_BrokkRay =
{
	class = "Nebula",
	in_editor = true,
	--camera_effect = "particles/areal/area_brokkray",
	int_radius = 20.0,
	ext_radius = 25.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_Pushray =
{
	class = "Nebula",
	in_editor = true,
	--camera_effect = "particles/areal/area_brokkray",
	inside_effect = "particles/gadget/push_ray_nebula",
	int_radius = 1.0,
	AWext_radius = 250.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_GravyPush =
{
	class = "Nebula",
	in_editor = true,
	inside_effect = "particles/areal/areal_alien_gravypush",
	int_radius = 175.0,
	ext_radius = 225.0,
	maxViewDist = 999999,
}

Def.Effects_GuidedRadiation =
{
	class = "Nebula",
	in_editor = true,
	screen_effect = "particles/screen/radiation",
	int_radius = 10.0,
	ext_radius = 35.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_RadiationCloud =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/area_emp_damage",
	int_radius = 5.0,
	ext_radius = 10.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.15,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_DevastatorEndZone =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/area_emp_damage",
	int_radius = 600.0,
	ext_radius = 700.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.15,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_BlackBomb =
{
	class = "Nebula",
	in_editor = true,
	int_radius = 75.0,
	ext_radius = 100.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.05,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_HealBan_Sphere =
{
	class = "Nebula",
	in_editor = true,
	int_radius = 180.0,
	ext_radius = 260.0,
	maxViewDist = 999999,
	--hit_shield_effect_interval = 0.15,
	--nebula_shieldEffectIntencityFactor = 25.0,
}

Def.Effects_Nebula_ShieldSupressor =
{
	class = "Nebula",
	in_editor = true,
	int_radius = 75.0,
	ext_radius = 150.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.05,
	nebula_shieldEffectIntencityFactor = 100.0,
}

Def.Effects_Nebula_Spacedust =
{
	class = "Nebula",
	in_editor = true,
	effect = "particles/areal/spacedust_cloud",
	int_radius = 1.0,
	ext_radius = 85.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_Debris =
{
	class = "Nebula",
	in_editor = true,
	camera_effect = "particles/areal/area_debris",
	int_radius = 350.0,
	ext_radius = 400.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_HGZone =
{
	class = "Nebula",
	in_editor = false,
	outside = true,
	camera_effect = "particles/areal/area_hg_zone",
	int_radius = 99.0,
	ext_radius = 100.0,
	maxViewDist = 999999,
	hit_shield_effect_interval = 0.15,
}

Def.Effects_Nebula_SlowSpeed400 =
{
	class = "Nebula",
	in_editor = false,
	camera_effect = "particles/areal/areal_slowspeed",
	int_radius = 300.0,
	ext_radius = 400.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_SlowSpeed700 =
{
	class = "Nebula",
	in_editor = false,
	camera_effect = "particles/areal/areal_slowspeed",
	int_radius = 600.0,
	ext_radius = 700.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_SlowSpeed3500 =
{
	class = "Nebula",
	in_editor = false,
	camera_effect = "particles/areal/areal_slowspeed",
	int_radius = 3400.0,
	ext_radius = 3500.0,
	maxViewDist = 999999,
}

Def.Effects_Nebula_BossAttraction =
{
	class = "Nebula",
	in_editor = true,
	inside_effect = "particles/areal/areal_gravyanomaly",
	int_radius = 3900.0,
	ext_radius = 4000.0,
	maxViewDist = 999999,
}

---------------------------------------------------------------------

Def.Effects_Clouds = 
{
	--0065610
	--class = "EffectEntity",
	--effect = "particles/areal/cloud",
	--in_editor	= true,
	--maxViewDist		= 5000,
}

Def.Effects_CloudsMax = 
{
	--0065610
	--class = "EffectEntity",
	--effect = "particles/areal/cloud_max",
	--in_editor	= true,
	--maxViewDist		= 15000,
}
Def.Effects_CloudsMaxGreen = 
{
	--0065610
	--class = "EffectEntity",
	--effect = "particles/areal/cloud_max_green",
	--in_editor	= true,
	--maxViewDist		= 15000,
}
Def.Effects_Sparks = 
{
	class = "EffectEntity",
	effect = "particles/areal/sparks",
	in_editor	= true,
}
Def.Effects_Sparks2 = 
{
	class = "EffectEntity",
	effect = "particles/areal/sparks2",
	in_editor	= true,
}
Def.Lights_runway =
{
	class			= "BaseEntity",
	model			= "models/illumination/runway",
	shadowCaster	= false,
}
Def.Lights_gateshield =
{
	class			= "BaseEntity",
	model			= "models/shields/gate",
	shadowCaster	= false,
}
Def.Lights_PointLightFlickeringEngine = 
{
	class				=	'PointLight',
	flicker ='mmnnnooopppqqqrrrssvwxyzyxwvutsrqponmlzyxwvutsrqponmlkjihgfedcbhhoohohohhoo',
	fps = 15,
}
Def.Effect_DredgeWarp =
{
	class = "EffectEntity",
	in_editor	= false,
	effect = "particles/areal/space_dredge_warp",
}
Def.Effects_hng_Steam =
{
	class = "EffectEntity",
	effect = "particles/areal/hng_steam",
}
Def.Effects_hng_Fuzz =
{
	class = "EffectEntity",
	effect = "particles/areal/hng_fuzz",
}
Def.Effects_hng_Welding =
{
	class = "EffectEntity",
	effect = "particles/areal/hng_weld",
}
Def.Effects_hng_Welding_loop =
{
	class = "EffectEntity",
	effect = "particles/areal/hng_weld_loop",
}
Def.Effects_bodytrail =
{
	class = "EffectEntity",
	effect = "particles/explosions/bodytrail",
}
Def.Lights_rotrig =
{
	class			= "AnimatedEntity",
	model			= "models/illumination/rotrig",
	shadowCaster	= false;
}
Def.Lights_rotrig2 =
{
	class			= "ScBaseEntity",
	model			= "models/illumination/rotrig2",
	shadowCaster	= false,
	sync_animation = true,
	children = 
	{
		{ def = "Constructor_3_24Monitors", joint = "joint2" },
	},
}
Def.Lights_rotrig3 =
{
	class			= "ScBaseEntity",
	model			= "models/illumination/rotrig3",
	shadowCaster	= false,
	sync_animation = true,
	children = 
	{
		{ def = "Constructor_3_24Monitors", joint = "joint2" },
	},
}
Def.Effects_StarNova =
{
	class = "EffectEntity",
	effect = "particles/areal/anomaly_star",
	in_editor	= true,
}
Def.Effects_DrillBeam =
{
	class = "EffectEntity",
	effect = "particles/areal/drillbeam",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_DrillBeam_blob =
{
	class = "EffectEntity",
	effect = "particles/areal/drillbeam_blob",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_DrillBeam_small =
{
	class = "EffectEntity",
	effect = "particles/areal/drillbeam_small",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Superflare =
{
	class = "Flare",
	in_editor	= true,
	maxViewDist = 5000,
}
Def.Effects_DrillBeam_model =
{
	class			= "BaseEntity",
	model			= "models/illumination/drillbeam",
	shadowCaster	= false,
	maxViewDist = 999999,
}
Def.Effects_ShieldGenerator =
{
	class = "EffectEntity",
	effect = "particles/areal/shield_generator",
	in_editor	= true,
}
Def.Effects_ShieldGeneratorJer =
{
	class = "EffectEntity",
	effect = "particles/areal/shield_generator_jer",
	in_editor	= true,
}
Def.Effects_ShieldGenerator2 =
{
	class = "EffectEntity",
	effect = "particles/areal/shield_generator2",
	in_editor	= true,
}
Def.Effects_Lightnings =
{
	--class = "EffectEntity",
	--effect = "particles/areal/piratebay_lightnings",
	--in_editor	= true,
}
Def.Effects_Lightnings2 =
{
	class = "EffectEntity",
	effect = "particles/areal/piratebay_lightnings2",
	in_editor	= true,
}
Def.Effects_Lightnings3 =
{
	--class = "EffectEntity",
	--effect = "particles/areal/piratebay_lightnings3",
	--in_editor	= true,
}
Def.Effects_hng_JerichoShipHook =
{
	class = "EffectEntity",
	effect = "particles/areal/hng_jericho_ship_hook",
	in_editor	= true,
}
Def.Effects_hng_JerichoRamp =
{
	class = "EffectEntity",
	effect = "particles/areal/hng_jericho_ramp",
}
Def.Effects_Smoke =
{
	class = "EffectEntity",
	effect = "particles/areal/piratebay_smoke",
	in_editor	= true,
}
Def.Effects_Smoke_Blue =
{
	class = "EffectEntity",
	effect = "particles/areal/smoke_blue",
	in_editor	= true,
}
Def.Effects_Smoke_Dark =
{
	--Раньше был другой эффект, не удалять, исаользуется.
	class = "EffectEntity",
	effect = "particles/areal/smoke_dark",
	in_editor	= true,
}
Def.Effects_Smoke_Dark2 =
{
	--Раньше был другой эффект, не удалять, исаользуется.
	class = "EffectEntity",
	effect = "particles/areal/smoke_dark",
	in_editor	= true,
}
Def.Effects_Smoke_SmokeWithFire =
{
	--Раньше был другой эффект, не удалять, исаользуется.
	class = "EffectEntity",
	effect = "particles/areal/smoke_fire_v5",
	in_editor	= true,
}
Def.Effects_Smoke_SmokeWithFire2 =
{
	--Раньше был другой эффект, не удалять, исаользуется.
	class = "EffectEntity",
	effect = "particles/areal/smoke_fire_v5",
	in_editor	= true,
}
Def.Effects_Laser =
{
	class = "EffectEntity",
	effect = "particles/areal/piratebay_laser",
	in_editor	= true,
}
Def.Effects_IndustrialFx =
{
	class = "EffectEntity",
	effect = "particles/areal/piratebay_ad",
	in_editor	= true,
}
Def.Effects_IndustrialFx2 =
{
	class = "EffectEntity",
	effect = "particles/areal/piratebay_ad2",
	in_editor	= true,
}
Def.Effects_Industrial_Fx =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/industrial_fx",
	in_editor	= true,
}
Def.Effects_Industrial_Fx2 =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/industrial_fx2",
	in_editor	= true,
}
Def.Effects_Industrial_Fx2Red =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/industrial_fx2_red",
	in_editor	= true,
}
Def.Effects_Industrial_Fx3 =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/industrial_fx3",
	in_editor	= true,
}
Def.Effects_Industrial_Fx4 =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/industrial_fx4",
	in_editor	= true,
}
Def.Effects_Industrial_Fx5 =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/industrial_fx5",
	in_editor	= true,
}
Def.Effects_Industrial_Steam =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/industrial_steam",
	in_editor	= true,
}
Def.Effects_Industrial_Heat =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/industrial_heat",
	in_editor	= true,
}
Def.Effects_LavaSparks =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/lava_sparks",
	in_editor	= true,
}
Def.Effects_Ramp =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/ramp",
	in_editor	= true,
}
Def.Effects_DreadnoughtDeath =
{
	--0065610
	--class = "EffectEntity",
	--effect = "particles/explosions/dreadnought_death",
	--in_editor	= true,
}
Def.Effects_DreadnoughtDeath2 =
{
	--0065610
	--class = "EffectEntity",
	--effect = "particles/explosions/dreadnought_death2",
	--in_editor	= true,
}
Def.Effects_DreadnoughtDeath3 =
{
	--0065610
	--class = "EffectEntity",
	--effect = "particles/explosions/dreadnought_death3",
	--in_editor	= true,
}
Def.Effects_MiningstationSmoke =
{
	class = "EffectEntity",
	effect = "particles/areal/miningstation_smoke",
	in_editor	= true,
}
Def.Effects_MiningstationSmoke2 =
{
	class = "EffectEntity",
	effect = "particles/areal/miningstation_smoke2",
	in_editor	= true,
}
Def.Effects_RunwayJericho =
{
	class = "EffectEntity",
	effect = "particles/areal/runway_jericho",
	in_editor	= true,
}
Def.Effects_IceMining =
{
	class = "EffectEntity",
	effect = "particles/areal/ice_mining",
	in_editor	= true,
}
Def.Effects_WaterAnomaly =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/waterharvest_sphere_big",
	in_editor	= true,
}
Def.Effects_WaterAnomalyCore =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/waterharvest_sphere",
	in_editor	= true,
}
Def.Effects_Antenna =
{
	class = "EffectEntity",
	effect = "particles/areal/antenna",
	in_editor	= true,
}
Def.Effects_AntennaLight =
{
	class = "EffectEntity",
	effect = "particles/ships/blockpost_lights",
	in_editor	= true,
}
Def.Effects_AntennaLightOrange =
{
	class = "EffectEntity",
	effect = "particles/areal/antenna_light",
	in_editor	= true,
}
Def.Effects_AntennaLightBlue =
{
	class = "EffectEntity",
	effect = "particles/areal/antenna_light_blue",
	in_editor	= true,
}
Def.Effects_SmallStuff_DisplayRcs =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/display_rcs",
	in_editor	= true,
}
Def.Effects_SmallStuff_Stripes =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/stripes",
	in_editor	= true,
}
Def.Effects_SmallStuff_CargoshipLights =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/cargoship_lights",
	in_editor	= true,
}
Def.Effects_TerramorphingLaserTwirl =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/terramorphingsite_laser_twirl",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_TerramorphingLaserNode =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/terramorphingsite_laser_node",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_TerramorphingLaserLasers =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/terramorphingsite_laser_lasers",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_AncientComplexLasers =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/ancientcomplex_lasers",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_AncientComplexSphere =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/ancientcomplex_sphere",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_AncientComplexLights =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/ancientcomplex_lights",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_AncientComplexLights2 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/ancientcomplex_lights2",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_GasharvestRamp =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/gasharvest_ramp",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_ConcourseDrillbeam =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/concourse_drillbeam",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_ConcourseDrillbeamRed =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/concourse_drillbeam_red",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_RunwayJer =
{
	class = "EffectEntity",
	effect = "particles/areal/runway_jer",
	in_editor	= true,
	maxViewDist = 1000,
}
Def.Effects_Radiation =
{
	class = "EffectEntity",
	effect = "particles/areal/radiation",
	in_editor	= true,
	maxViewDist = 1000,
}
Def.Effects_EnvLaser =
{
	class = "EffectEntity",
	effect = "particles/areal/env_laser",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_hng_SparksBlast =
{
	class = "EffectEntity",
	effect = "particles/areal/hng_sparks_blast",
	in_editor	= true,
	maxViewDist = 1000,
}
Def.Effects_hng_Explosion =
{
	class = "EffectEntity",
	--effect = "particles/areal/hng_explosion",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_PrecursorsLasers =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/precursors_lasers",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_PrecursorsLasersBig =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/precursors_lasers_big",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_PrecursorsPlanetLasers =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/precursors_planet_lasers",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_PrecursorsPlanetLasersBig =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/precursors_planet_lasers_big",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Smoke_SmokeWithFireBig =
{
	--Раньше был другой эффект smoke_fire_big_v2, не удалять, исаользуется.
	class = "EffectEntity",
	effect = "particles/areal/smoke_fire_v5",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Dreadnought_EngineHeat =
{
	class = "EffectEntity",
	effect = "particles/other/dreadnought_engine_heat",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineHeatSmall =
{
	class = "EffectEntity",
	effect = "particles/other/dreadnought_engine_heat_small",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Smoke_SparksSmall =
{
	--Раньше был другой эффект, не удалять, исаользуется.
	class = "EffectEntity",
	effect = "particles/areal/smoke_fire_v5",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckHotDebris =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_hot_debris",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebris =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "1 1 1 100",
	in_editor	= true,
	maxViewDist = 999999,
}

---------------------------------------------------------------------
--                          Fire  effetcs                          --
---------------------------------------------------------------------

Def.Effects_Fire_FireHuge =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/dying_fire",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Fire_FireBig =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/brokenparts_fire_big",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Fire_FireSmall =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/brokenparts_fire",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Fire_FireTiny =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/brokenparts_fire_small",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Fire_Fireballs =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/brokenparts_fireballs",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Fire_FireballsBig =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/brokenparts_fireballs_big",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Fire_FireballsMapBig =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/map_fireballs_big",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Fire_FireballsMapMid =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/map_fireballs_mid",
	in_editor	= true,
	maxViewDist = 999999,
}

---------------------------------------------------------------------

Def.Effects_WreckShipDebrisWaterHarvest =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "2 2 2 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisShipYard =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "6 4 4 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisShipYardWhite =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "36 36 36 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisGateIsid =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "4 3 3 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisGateSirus =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "17 17 17 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisShipYardWhiteBig =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "17 17 17 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisMiningsite =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "4 3 2 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisGateSirusBig =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "17 17 17 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisAliendest =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "2 2 2 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Smoke_SmokeWithFireMiningsite =
{
	--Раньше был другой эффект, не удалять, исаользуется.
	class = "EffectEntity",
	effect = "particles/areal/smoke_fire_v5",
	in_editor	= true,
}
Def.Effects_WreckShipDebrisMiningsiteBoxes =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "5 5 5 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckHotDebrisMiningsite =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_hot_debris_miningsite",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckHotDebrisShipyard =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_hot_debris_shipyard",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_NavLightMid =
{
	class = "EffectEntity",
	effect = "particles/areal/nav_light",
	effect_color = "255 13 0 255",
	effect_user1 = 0.1,
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_SparksGateSirus =
{
	--class = "EffectEntity",
	--effect = "particles/areal/sparks_gate_sirus",
	--in_editor	= true,
	--maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisGateSirusMid =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "17 17 17 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_NavLightMid2 =
{
	class = "EffectEntity",
	effect = "particles/areal/nav_light_periodic",
	effect_color = "255 13 0 255",
	effect_user1 = 0.1,
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_RampGateSirus =
{
	class = "EffectEntity",
	effect = "particles/areal/small_stuff/ramp_gate_sirus",
	in_editor	= true,
}
Def.Effects_ShipStuff1 =
{
	--class = "EffectEntity",
	--in_editor	= true,
	--maxViewDist = 999999,
}
Def.Effects_ShipStuff2 =
{
	--class = "EffectEntity",
	--in_editor	= true,
	--maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlueBig =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_b_big",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlueMid =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_b_mid",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlueSmall =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_b_small",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_Asteroids01 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/dnbattle_asteroids_01",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_Asteroids02 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/dnbattle_asteroids_02",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlue1 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_1",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlue2 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_2",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlue3 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_3",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlue4 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_4",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlue5 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_5",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlue6 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_6",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlue7 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_7",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_DreadLightBlue =
{
	class = "EffectEntity",
	effect = "particles/ships/dread_light_blue",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_DreadLightBlue2 =
{
	class = "EffectEntity",
	effect = { s1 = "particles/ships/dread_light_blue", s2 = "particles/ships/dread_light_red", },
	in_editor = true,
	maxViewDist = 999999,
	use_team_skin = true,
}
Def.Effects_Dreadnought_DreadLightBlueSmall =
{
	class = "EffectEntity",
	effect = "particles/ships/dread_light_blue_small",
	in_editor = true,
	maxViewDist = 999999,
}
--[[Def.Effects_Dreadnought_DreadLightBlueProjector =
{
	class = "EffectEntity",
	effect = "particles/ships/dread_light_blue_projector", 
	in_editor = true,
	maxViewDist = 999999,
}]]
-- вариант со скинами
Def.Effects_Dreadnought_DreadLightBlueProjector =
{
	class = "EffectEntity",
	effect = { s1 = "particles/ships/dread_light_blue_projector", s2 = "particles/ships/dread_light_red_projector", },
	in_editor = true,
	maxViewDist = 999999,
    use_team_skin = true,
}

Def.Effects_Dreadnought_DreadLightRed =
{
	class = "EffectEntity",
	effect = "particles/ships/dread_light_red",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_BeaconFlareBlue =
{
	class = "EffectEntity",
	effect = { s1 = "particles/ships/ship_beacon_flare_blue", s2 = "particles/ships/ship_beacon_flare_red", },
	in_editor = true,
	maxViewDist = 999999,
    use_team_skin = true,
}
Def.Effects_Dreadnought_EngineRedC1 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_c_1",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_DreadLightWhiteProjector =
{
	class = "EffectEntity",
	effect = "particles/ships/dread_light_white_projector",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineRedC2 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_c_2",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineRedC3 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_c_3",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineRedC4 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_c_4",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlueASmall1 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_small_1",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlueASmall2 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_small_2",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_EngineBlueASmall2Mesh =
{
	class			= "BaseEntity",
	model			= "models/misc/dread_engine_side_small",
	shadowCaster	= false,
}
Def.Effects_Dreadnought_EngineBlueASmall4 =
{
	class = "EffectEntity",
	effect = { s1 = "particles/ships/engine_dread_a_small_2", s2 = "particles/ships/engine_dread_a_small_2_red", },
	in_editor = true,
	maxViewDist = 999999,
    use_team_skin = true,
}

Def.Effects_Dreadnought_DreadLightBlueSmallLight =
{
	class = "EffectEntity",
	effect = "particles/ships/dread_light_blue_small_light",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_DreadLightBlueSmallLightSkins =
{
	class = "EffectEntity",
	effect = { s1 = "particles/ships/dread_light_blue_small", s2 = "particles/ships/dread_light_red_small", },
	in_editor = true,
	maxViewDist = 999999,
    use_team_skin = true,
}
-- со скинами
Def.Effects_Dreadnought_DreadLightBlueSmallLight2 =
{
	class = "EffectEntity",
	effect = { s1 = "particles/ships/dread_light_blue_small2_light", s2 = "particles/ships/dread_light_red_small2_light", },
	in_editor = true,
	maxViewDist = 999999,
    use_team_skin = true,
}

Def.Effects_Dreadnought_DreadLightBlueSmallLightBlink2 =
{
	class = "EffectEntity",
	effect = { s1 = "particles/ships/dread_light_blue_small_light_blink", s2 = "particles/ships/dread_light_red_small_light_blink", },
	in_editor = true,
	maxViewDist = 999999,
	use_team_skin = true,
}

Def.Effects_Dreadnought_DreadLightBlueSmallLightBlink =
{
	class = "EffectEntity",
	effect = "particles/ships/dread_light_blue_small_light_blink",
	in_editor = true,
	maxViewDist = 999999,
}

Def.Effects_Dreadnought_EngineBlueASmall3 =
{
	class = "EffectEntity",
	effect = "particles/ships/engine_dread_a_small_3",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_FedDreadLights1 =
{
	class			= "BaseEntity",
	model			= "models/illumination/fed_dread_lights",
	shadowCaster	= false,
}
Def.Effects_Dreadnought_FedDreadLights2 =
{
	class			= "BaseEntity",
	model			= "models/illumination/fed_dread_lights_2",
	shadowCaster	= false,
}
Def.Effects_Dreadnought_FedDreadLights3 =
{
	class			= "BaseEntity",
	model			= "models/illumination/fed_dread_lights_3",
	shadowCaster	= false,
}
Def.Effects_Dreadnought_FedDreadLights4 =
{
	class			= "BaseEntity",
	model			= "models/illumination/fed_dread_lights_4",
	shadowCaster	= false,
}
Def.Effects_Dreadnought_FedDreadLights5 =
{
	class			= "BaseEntity",
	model			= "models/illumination/fed_dread_lights_5",
	shadowCaster	= false,
}
Def.Effects_Dreadnought_FedDreadLights6 =
{
	class			= "BaseEntity",
	model			= "models/illumination/fed_dread_lights_6",
	shadowCaster	= false,
}
Def.Effects_Smoke_SmokeWithFire2Big =
{
	--Раньше был другой эффект, не удалять, исаользуется.
	class = "EffectEntity",
	effect = "particles/areal/smoke_fire_v5",
	in_editor	= true,
}
Def.Effects_Dreadnought_Lamp =
{
	--class = "EffectEntity",
	--effect = "particles/ships/dread_light_yellow",
	--in_editor	= true,
}
Def.Effects_Dreadnought_ray2 =
{
	class = "EffectEntity",
	effect = "particles/ships/empire_ilay_ray",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_raysmall =
{
	class = "EffectEntity",
	effect = "particles/ships/empire_ilay_ray_small",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_AntennaLightPeriodic =
{
	class = "EffectEntity",
	effect = "particles/areal/antenna_light_periodic",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_illuminate_EmpireWhiteLamp =
{
	class = "EffectEntity",
	effect = "particles/objects/illuminate/empire_lamp_white",
	in_editor	= true,
}
Def.Effects_illuminate_AntennaBluePeriodic =
{
	class = "EffectEntity",
	effect = "particles/objects/illuminate/antenna_blue_periodic",
	in_editor	= true,
}
Def.Effects_Dreadnought_ShieldFederationSmall =
{
	class			= "BaseEntity",
	model			= "models/shields/gate_with_collision_federation",
	shadowCaster	= false,
}
Def.Effects_NavLightDesttown =
{
	class = "EffectEntity",
	effect = "particles/areal/nav_light",
	effect_color = "240 26 0 255",
	effect_user1 = 0.1,
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_ShieldFrozenStation =
{
	class			= "BaseEntity",
	model			= "models/shields/shield_frozen_station",
	shadowCaster	= false,
	maxViewDist = 999999,
}
Def.Effects_ShieldFrozenStation2 =
{
	class			= "BaseEntity",
	model			= "models/shields/shield_frozen_station_2",	
	physics			= { solid_type = solid.model, static = true, material = "Metal" },
	shadowCaster	= false,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisAsteroid =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "32 21 17 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_EngineCircleBlue1=
{
	class = "EffectEntity",
	effect = "particles/ships/engine_circle_blue_1",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisDebrisSite =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "69 37 12 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisScrapYard =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "4 4 4 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisFallenDread =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "5 5 5 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_EngineFedBlue1=
{
	class = "EffectEntity",
	effect = "particles/ships/engine_fed_blue_1",
	in_editor = true,
	maxViewDist = 999999,
}
Def.Effects_NavLightMid3 =
{
	class = "EffectEntity",
	effect = "particles/areal/nav_light",
	effect_color = "255 13 0 255",
	effect_user1 = 0.1,
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_WreckShipDebrisRex =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "5 5 5 100",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_LavaHot =
{
	class = "EffectEntity",
	effect = "particles/areal/lava_hot",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_LavaClouds =
{
	--class = "EffectEntity",
	--effect = "particles/areal/lava_clouds",
	--in_editor	= true,
	--maxViewDist = 400,
}
Def.Effects_RayBottomPart =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/ray_bottom_part",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_RayTopPart =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/ray_top_part",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_RozonEngineBig =
{
	class = "EffectEntity",
	effect = "particles/ships/rozon_engine_big",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_RozonEngineMid =
{
	class = "EffectEntity",
	effect = "particles/ships/rozon_engine_mid",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_RozonEngineSmall =
{
	class = "EffectEntity",
	effect = "particles/ships/rozon_engine_small",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Dreadnought_RozonLightnings =
{
	class = "EffectEntity",
	effect = "particles/ships/rozon_lightnings",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_RayBottomPartFar =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/ray_bottom_part_far",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_RayTopPartFar =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/ray_top_part_far",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_FanSnow =
{
	class = "EffectEntity",
	effect = "particles/areal/fan_snow",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_LightningsYellow =
{
	class = "EffectEntity",
	effect = "particles/areal/lightnings_yellow",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_PlanetWar_RadiationHaze =
{
	class = "EffectEntity",
	effect = "particles/areal/radiation_haze",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_NavLightBlue =
{
	class = "EffectEntity",
	effect = "particles/areal/nav_light_periodic",
	effect_color = "0 128 255 255",
	effect_user1 = 0.2,
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_NavLightBlueStable =
{
	class = "EffectEntity",
	effect = "particles/areal/nav_light",
	effect_color = "64 232 255 255",
	effect_user1 = 0.2,
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Sparks3 =
{
	class = "EffectEntity",
	effect = "particles/areal/sparks3",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Smoke_AddSmokeSmallBlue =
{
	class = "EffectEntity",
	effect = "particles/areal/addsmoke",
	effect_user1 = 0.36,
	effect_color = "0 128 255 255",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Smoke_AddSmokeBlue =
{
	class = "EffectEntity",
	effect = "particles/areal/addsmoke",
	effect_user1 = 0.5,
	effect_color = "0 128 255 255",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_PlanetWar_Smoke =
{
	class = "EffectEntity",
	effect = "particles/areal/smoke_planetwar",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_PlanetWar_Light =
{
	class = "EffectEntity",
	effect = "particles/areal/light_planetwar",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_PlanetWar_SmokeBig =
{
	class = "EffectEntity",
	effect = "particles/areal/smoke_planetwar_big",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Fed_FanFedRect =
{
	class = "EffectEntity",
	effect = "particles/areal/fan_fed_rect",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Fed_TSCircle =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/ts_circle",
	maxViewDist = 999999,
	children 	= {{ effect ="particles/areal/huge_stuff/ts_circle", joint = "root" },},
}
Def.Effects_Fed_Drillbot =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "mapskit/maps/models/drill/drill_bot",
	skin		= "blue",
	children 	= 	{
						{ effect ="particles/areal/drill_crystals", joint = "drill_fx" },
					},
	physics		= { solid_type = solid.compound_model, static = true, material = "Metal" },
	maxViewDist = 999999,
}
Def.Effects_DeathStar_AreaBlue =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/deathstar_area",
	effect_color = "0 255 128 255",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_DeathStar_AreaGreen =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/deathstar_area",
	effect_color = "0 128 255 255",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_DeathStar_Cyl =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/deathstar_cyl",
	skin		= "greed",
	maxViewDist = 999999,
}
Def.Effects_DeathStar_CylBlue =
{
	class 		= "ScBaseEntity",
	in_editor	= true,
	model		= "models/misc/deathstar_cyl",
	skin		= "blue",
	maxViewDist = 999999,
}
Def.Effects_DeathStar_WallBlue =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/deathstar_wall",
	effect_color = "0 128 255 255",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_DeathStar_WallBlueSmall =
{
	class = "EffectEntity",
	effect = "particles/areal/addsmoke",
	effect_color = "0 128 255 255",
	effect_user1 = 0.66,
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_DeathStar_Center =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/deathstar_center",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_DeathStar_CenterTentacles =
{
	class			= "ScBaseEntity",
	in_editor		= true,

	sync_animation	= true,
	
	model			= "models/misc/tentacles_center",
	physics			= { solid_type = solid.none, static = true },	
	
	children = 
	{
		{ def = "Effects_DeathStar_TentaclesCollision3", joint = "sm1" },
		{ def = "Effects_DeathStar_TentaclesCollision3", joint = "sm2" },
		{ def = "Effects_DeathStar_TentaclesCollision3", joint = "sm3" },
		{ def = "Effects_DeathStar_TentaclesCollision3", joint = "sm4" },
		{ def = "Effects_DeathStar_TentaclesCollision3", joint = "sm5" },
		{ def = "Effects_DeathStar_TentaclesCollision3", joint = "sm6" },
		{ def = "Effects_DeathStar_TentaclesCollision3", joint = "sm7" },
		{ def = "Effects_DeathStar_TentaclesCollision3", joint = "sm8" },
		
		{ def = "Effects_DeathStar_TentaclesCollision4", joint = "sm1_1" },
		{ def = "Effects_DeathStar_TentaclesCollision4", joint = "sm2_1" },
		{ def = "Effects_DeathStar_TentaclesCollision4", joint = "sm3_1" },
		{ def = "Effects_DeathStar_TentaclesCollision4", joint = "sm4_1" },
		{ def = "Effects_DeathStar_TentaclesCollision4", joint = "sm5_1" },
		{ def = "Effects_DeathStar_TentaclesCollision4", joint = "sm6_1" },
		{ def = "Effects_DeathStar_TentaclesCollision4", joint = "sm7_1" },
		{ def = "Effects_DeathStar_TentaclesCollision4", joint = "sm8_1" },
		
		{ def = "Effects_DeathStar_TentaclesCollision1", joint = "big1" },
		{ def = "Effects_DeathStar_TentaclesCollision1", joint = "big2" },
		{ def = "Effects_DeathStar_TentaclesCollision1", joint = "big3" },
		{ def = "Effects_DeathStar_TentaclesCollision1", joint = "big4" },
		{ def = "Effects_DeathStar_TentaclesCollision1", joint = "big5" },
		{ def = "Effects_DeathStar_TentaclesCollision1", joint = "big6" },
		{ def = "Effects_DeathStar_TentaclesCollision1", joint = "big7" },
		{ def = "Effects_DeathStar_TentaclesCollision1", joint = "big8" },
		
		{ def = "Effects_DeathStar_TentaclesCollision2", joint = "big1_1" },
		{ def = "Effects_DeathStar_TentaclesCollision2", joint = "big2_1" },
		{ def = "Effects_DeathStar_TentaclesCollision2", joint = "big3_1" },
		{ def = "Effects_DeathStar_TentaclesCollision2", joint = "big4_1" },
		{ def = "Effects_DeathStar_TentaclesCollision2", joint = "big5_1" },
		{ def = "Effects_DeathStar_TentaclesCollision2", joint = "big6_1" },
		{ def = "Effects_DeathStar_TentaclesCollision2", joint = "big7_1" },
		{ def = "Effects_DeathStar_TentaclesCollision2", joint = "big8_1" },

	},	
}
Def.Effects_DeathStar_TentaclesCollision1 =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/misc/tentacles_center_col_1", 
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
}
Def.Effects_DeathStar_TentaclesCollision2 =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/misc/tentacles_center_col_2", 
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
}
Def.Effects_DeathStar_TentaclesCollision3 =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/misc/tentacles_center_col_3", 
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
}
Def.Effects_DeathStar_TentaclesCollision4 =
{
	class			= "ScBaseEntity",
	in_editor		= false,
	model			= "models/misc/tentacles_center_col_4", 
	physics			= { solid_type = solid.compound_model, kinematic = true, material = "Metal", mass = 100000000, },
}
Def.Effects_DeathStar_WallGreen =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/deathstar_wall",
	effect_color = "0 255 128 255",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_DeathStar_WallGreenSmall =
{
	class = "EffectEntity",
	effect = "particles/areal/addsmoke",
	effect_color = "0 255 128 255",
	effect_user1 = 0.66,
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Mining_Target = 
{
	class = "EffectEntity",
	effect = "particles/ships/craft_r3_s_rcs",
}

Def.Effects_Mining_0 = 
{
	class = "EffectEntity",
	effect = "particles/ships/craft_r3_s_engine",
}

Def.Effects_Mining_1 = 
{
	class = "EffectEntity",
	effect = "particles/ships/craft_r1_l_rcs",
}

Def.Effects_Mining_2 = 
{
	class = "EffectEntity",
	effect = "particles/ships/craft_r1_l_engine",
}

Def.Effects_Mining_3 = 
{
	class = "EffectEntity",
	effect = "particles/ships/engine_l_r",
}

Def.Effects_Mining_4 = 
{
	class = "EffectEntity",
	effect = "particles/ships/engine_l_r", --!!!
}

Def.Effects_Mining_5 = 
{
	class = "EffectEntity",
	effect = "particles/ships/engine_l_r", --!!!
}

---------------------------------------------------------------------
--                       Race5 ships effetcs                       --
---------------------------------------------------------------------

Def.Effect_Race5_M_11_Engine =
{
	class			= "EffectEntity",
	effect 			= "particles/ships/ship_engine_effect_alien",
	effect_color 	= "0 32 0 255",
	effect_user1 	= 0.495,
}

Def.Effect_Race5_M_11_Boost =
{
	class			= "EffectEntity",
	effect 			= "particles/ships/ship_engine_effect_alien",
	effect_color 	= "0 32 0 255",
	effect_user1 	= 0.245,
}

Def.Effect_Race5_M_13_Engine =
{
	class			= "EffectEntity",
	effect 			= "particles/ships/ship_engine_effect_alien",
	--effect_color 	= "0 36 28 255",
	effect_color 	= "0 32 24 255",
	effect_user1 	= 0.495,
}

Def.Effect_Race5_M_13_Boost =
{
	class			= "EffectEntity",
	effect 			= "particles/ships/ship_engine_effect_alien",
	--effect_color 	= "0 36 28 255",
	effect_color 	= "0 32 24 255",
	effect_user1 	= 0.245,
}

Def.Effect_Race5_M_12_Engine =
{
	class			= "EffectEntity",
	effect 			= "particles/ships/ship_engine_effect_alien",
	--effect_color 	= "0 36 28 255",
	effect_color 	= "25 0 175 255",
	effect_user1 	= 0.49,
}

Def.Effect_Race5_M_12_Boost =
{
	class			= "EffectEntity",
	effect 			= "particles/ships/ship_engine_effect_alien",
	--effect_color 	= "0 36 28 255",
	effect_color 	= "25 0 175 255",
	effect_user1 	= 0.24,
}
Def.Effect_Race5_L_12_Engine =
{
	class			= "EffectEntity",
	effect 			= "particles/ships/ship_engine_effect_alien",
	--effect_color 	= "0 36 28 255",
	effect_color 	= "213 184 234 255",
	effect_user1 	= 0.72,
}

Def.Effect_Race5_L_12_Boost =
{
	class			= "EffectEntity",
	effect 			= "particles/ships/ship_engine_effect_alien",
	--effect_color 	= "0 36 28 255",
	effect_color 	= "213 184 234 125",
	effect_user1 	= 0.39,
}
---------------------------------------------------------------------
--                         Alidium Effects                         --
---------------------------------------------------------------------

Def.Alidium_Smoke =
{
	class = "EffectEntity",
	effect = "particles/areal/alidium_smoke",
	in_editor	= true,
}

Def.Alidium_Energy =
{
	class			= "EffectEntity",
	in_editor		= true,
	effect 			= "particles/areal/alidium_energy",
	effect_user1 	= 1.0,
}

Def.Alidium_EnergyFar =
{
	class			= "EffectEntity",
	in_editor		= true,
	effect 			= "particles/areal/alidium_energy",
	effect_user1 	= 0.25,
}

--Def.Alidium_Light_Orange =
--{
--	class			= "EffectEntity",
--	in_editor		= true,
	--effect 			= "particles/areal/light_rect",
--	effect_color 	= "255 186 136 10",
--	effect_user1 	= 0.025,
--	effect_user2 	= 0.8,
--}

---------------------------------------------------------------------
--                          Prec  Effects                          --
---------------------------------------------------------------------

Def.PrecRocketMid = 
{
	class = "EffectEntity",
	effect = "particles/weapons/missile/rocket_trail_alien_mid",
	effect_user1 = 0.5, -- scale X
	effect_user1 = 0.75, -- scale Y
	in_editor = false,
}

Def.PrecRocketSmall = 
{
	class = "EffectEntity",
	effect = "particles/weapons/missile/rocket_trail_alien_mid",
	effect_user1 = 0.25, -- scale X
	effect_user1 = 0.5, -- scale Y
	in_editor = false,
}

Def.PrecCruiserEngineEx = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_g4",
	effect_user1 = 1.0,
	effect_user2 = 1.0,
}

Def.PrecCruiserEngineExSmall = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_g4",
	effect_user1 = 0.35,
	effect_user2 = 0.35,
}

Def.PrecDroneEngine1 = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_g4",
	effect_user1 = 0.16,
	effect_user2 = 0.16,
}

Def.PrecDroneEngine2 = 
{
	class = "EffectEntity",
	effect = "particles/ships/ship_engine_g4",
	effect_user1 = 0.04,
	effect_user2 = 0.04,
}

Def.PrecCruiserEngine = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_engine",
	effect_user1 = 0.6,
}

Def.PrecCruiserEngineSmall = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_engine",
	effect_user1 = 0.225,
}

Def.PrecCruiserTrail =
{
	class = "EffectEntity",
	effect = "particles/ships/ship_trail",
	effect_user2 = 0.2,
	effect_color = "0 204 82 100",
}

Def.PrecCruiserGun = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_gun",
	effect_user1 = 0.6,
	effect_user2 = 1.00,
	
}

Def.PrecCruiserGunSmall = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_gun",
	effect_user1 = 0.6,
	effect_user2 = 1.00,
}

Def.AlienBeaconSmall = 
{
	class = "EffectEntity",
	effect = "particles/objects/alien_sphere_mid",
	effect_user1 = 0.1,
}

Def.AlienBigAnomaly = 
{
	class = "EffectEntity",
	effect = "particles/objects/alien_anomaly",
	in_editor	= true,
	maxViewDist = 9999999,
}

Def.AlienBeaconMid = 
{
	class = "EffectEntity",
	effect = "particles/objects/alien_sphere_mid",
	effect_user1 = 0.25,
}

Def.PrecInterceptorGun = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_gun",
	effect_user1 = 0.07,
	effect_user2 = 1.00,
}

Def.PrecInterceptorGunSmall = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_gun",
	effect_user1 = 0.04,
	effect_user2 = 0.50,
}

Def.PrecLargeFx = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_gun",
	effect_user1 = 0.04,
	effect_user2 = 0.50,
}

Def.PrecLargeEngine = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_ship",
	effect_user1 = 0.55,
}

Def.PrecPredatorEngine1 = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_ship",
	effect_user1 = 0.5,
}

Def.PrecPredatorEngine2 = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_ship",
	effect_user1 = 0.3,
}

Def.PrecInterceptorEngine = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_ship",
	effect_user1 = 0.39,
}

Def.PrecInterceptorEngineBig = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_engine",
	effect_user1 = 0.15,
}

Def.PrecBiomorphEngine = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_engine",
	effect_user1 = 0.036,
}

Def.PrecModuleBaseGun = 
{
	class = "EffectEntity",
	effect = "particles/objects/prec_gun",
	effect_user1 = 0.3,
	effect_user2 = 1.00,
}

Def.PrecBaseGun = 
{
	class = "EffectEntity",
	effect = "particles/objects/alien_sphere_mid",
	effect_user1 = 0.1,--scale
	effect_user2 = 0.25,--opacity
}

Def.PrecProjectorBig = 
{
	class = "EffectEntity",
	effect = "particles/other/jumpgate_projector_01",
	effect_user1 = 1.0,--scale
}

Def.PrecProjectorMid = 
{
	class = "EffectEntity",
	effect = "particles/other/jumpgate_projector_01",
	effect_user1 = 0.6,--scale
}

Def.PrecProjectorSmall = 
{
	class = "EffectEntity",
	effect = "particles/other/jumpgate_projector_01",
	effect_user1 = 0.33,--scale
}

---------------------------------------------------------------------


----------------------
-- Tutorial effects --
----------------------

Def.Effects_s1550Debris =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_tutorial",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Tutorial_Periodic1 =
{
	class = "EffectEntity",
	effect = "particles/areal/nav_light_periodic",
	effect_color = "255 0 0 255",
	effect_user1 = 0.1,
	in_editor	= true,
}

Def.Effects_Tutorial_Static1 =
{
	class = "EffectEntity",
	effect = "particles/areal/nav_light",
	effect_color = "255 0 0 255",
	effect_user1 = 0.18,
	in_editor	= true,
}

Def.Effects_Tutorial_Static1Small =
{
	class = "EffectEntity",
	effect = "particles/areal/nav_light",
	effect_color = "255 0 0 255",
	effect_user1 = 0.12,
	in_editor	= true,
}

Def.Effects_Tutorial_WreckShipDebrisBig =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_huge",
	effect_color = "36 36 36 100",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Tutorial_WreckShipDebris =
{
	class = "EffectEntity",
	effect = "particles/areal/wreck_ship_debris_dyndiff",
	effect_color = "36 36 36 100",
	in_editor	= true,
	maxViewDist = 999999,
}

---------------------------------------------------------------------

----------------------
-- Avatar effects --
----------------------

Def.Effects_Avatar_Waterfall =
{
	class = "EffectEntity",
	effect = "particles/areal/waterfall_mid",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Avatar_WaterfallBig =
{
	class = "EffectEntity",
	effect = "particles/areal/waterfall_big",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Avatar_WaterfallSmall =
{
	class = "EffectEntity",
	effect = "particles/areal/waterfall_small",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Avatar_WaterfallWide =
{
	class = "EffectEntity",
	effect = "particles/areal/waterfall_wide",
	in_editor	= true,
	maxViewDist = 999999,
}
---------------------------------------------------------------------

---------------------------------------------------------------------


--------------------------------
-- Precursor zona 5-6 effects --
--------------------------------

Def.Effects_Precursor_Explosion1 =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_explosion",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Precursor_Ray1 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_ray1",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Precursor_Ray2 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_ray2",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_Precursor_BiomExplosions1 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_biom_explosions1",
	in_editor	= true,
	maxViewDist = 999999,
}

-- Left Dread1 Front
Def.Effects_Precursor_DreadnoughtFire1 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.24, --velocity
	effect_user2 = 0.44, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire2 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.23, --velocity
	effect_user2 = 0.43, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire3 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.238, --velocity
	effect_user2 = 0.445, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire4 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.25, --velocity
	effect_user2 = 0.463, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire5 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.245, --velocity
	effect_user2 = 0.45, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
-- Left Dread2 Left
--Left
Def.Effects_Precursor_DreadnoughtFire6 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.295, --velocity
	effect_user2 = 0.543, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
--Right
Def.Effects_Precursor_DreadnoughtFire7 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.29, --velocity
	effect_user2 = 0.518, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
--Center
Def.Effects_Precursor_DreadnoughtFire8 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.29, --velocity
	effect_user2 = 0.525, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
-- Left Dread3 Back
--Left
Def.Effects_Precursor_DreadnoughtFire9 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.24, --velocity
	effect_user2 = 0.44, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
--Center
Def.Effects_Precursor_DreadnoughtFire10 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.23, --velocity
	effect_user2 = 0.433, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
--Right
Def.Effects_Precursor_DreadnoughtFire11 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit1",
	effect_user1 = 0.22, --velocity
	effect_user2 = 0.413, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
-- Right Dread1 Front
-- Right
Def.Effects_Precursor_DreadnoughtFire12 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.425, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
-- Left
Def.Effects_Precursor_DreadnoughtFire15 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.42, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire16 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.425, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire17 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.425, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire18 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.425, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire19 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.425, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire20 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.422, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire21 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.427, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
-- Right Dread2 Right
-- Right
Def.Effects_Precursor_DreadnoughtFire13 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.415, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
--Center
Def.Effects_Precursor_DreadnoughtFire22 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.132, --velocity
	effect_user2 = 0.407, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
--Left
Def.Effects_Precursor_DreadnoughtFire23 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.125, --velocity
	effect_user2 = 0.395, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
-- Right Dread3 Left
-- Left
Def.Effects_Precursor_DreadnoughtFire14 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.115, --velocity
	effect_user2 = 0.357, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire24 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.115, --velocity
	effect_user2 = 0.39, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire25 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit2",
	effect_user1 = 0.115, --velocity
	effect_user2 = 0.40, --hit pos
	in_editor	= true,
	maxViewDist = 999999,
}
-- zona 6
Def.Effects_Precursor_Debris =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_debris",
	in_editor	= true,
	maxViewDist = 999999,
}
Def.Effects_Precursor_DreadnoughtFire26 =
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/prec_dread_muzzle_projectile_hit3",
	effect_user1 = 0.09, --velocity
	in_editor	= true,
	maxViewDist = 999999,
}
---------------------------------------------------------------------
Def.Landing_light = 
{
	class = "EffectEntity",
	effect = "particles/other/projector_docking",
	in_editor	= true,
}

Def.Smoke_station = 
{
	class = "EffectEntity",
	effect = "particles/areal/smoke_sat_ado",
	in_editor	= true,
}

Def.ProjectorLight = 
{
	class = "EffectEntity",
	effect = "particles/other/projector_beam",
	in_editor	= true,
}

Def.BigCloud = 
{
	class = "EffectEntity",
	effect = "particles/areal/huge_stuff/clouds",
	in_editor	= true,
	maxViewDist = 999999,
}

Def.ExplosionBig2Emp = 
{
	class = "EffectEntity",
	effect = "particles/explosions/explosion_big2_emp",
}

Def.ExplosionDockingBay = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/docking_bay_explosion",
	in_editor	= true,
}

Def.FireDockingBay = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/docking_bay_fire",
	in_editor	= true,
}

---------------------------------------------------------------------
--                         Monster Effects                         --
---------------------------------------------------------------------

Def.MonsterShieldShpereExplosion = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_monster_sphere_explosion",
	in_editor	= false,
	maxViewDist = 999999,
}

Def.MonsterExplosion = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_monster_explosion",
	in_editor	= false,
	maxViewDist = 999999,
}

Def.MonsterExplosionFireballs = 
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/alien_monster_fireballs",
	in_editor	= false,
	maxViewDist = 999999,
}

Def.Effects_WreckFire =
{
	class = "EffectEntity",
	effect = "particles/explosions/objects/brokenparts_fire",
	in_editor	= true,
}

Def.Effects_StationGlow1 =
{
	class = "EffectEntity",
	effect = "particles/other/station_glow1",
	effect_user1 = 0.06,
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_StationGlow2 =
{
	class = "EffectEntity",
	effect = "particles/other/station_glow1",
	effect_user1 = 0.2,
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_StationGlow3 =
{
	class = "EffectEntity",
	effect = "particles/other/station_glow1",
	effect_user1 = 1.0,
	in_editor	= true,
	maxViewDist = 999999,
}

Def.Effects_PrecShipFlame =
{
	class = "EffectEntity",
	effect = "particles/objects/prec_ship_flame",
	maxViewDist = 999999,
}
