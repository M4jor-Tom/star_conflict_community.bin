SpellExtension = 
{

	DeimosFaceDamage = 
	{
		period_sound	= "sound/el_modules/aftershock_fire",
	},
	
	StunningSpurt = 
	{
		aura_sound 			= "sound/aura/stun",
	},

	Suicide = 
	{
		    aura_fx			= "particles/gadget/suicide_aura",
			aura_sound 			= "sound/aura/voidzone",
			screen_fx     ="particles/screen/radiation",
	},
	
	GuidedMissile = 
	{
			aura_fx			= "particles/gadget/suicide_aura",
			aura_sound 			= "sound/aura/voidzone",	
            nebula     ="Effects_GuidedRadiation",			
	},
		
	EcmJammer = 
	{
	},
	
	Cloaking = 
	{
		aura_end_sound = "sound/gadgets/stealth_off",
	},
	
	CloakingSingularity =
	{
		aura_end_sound = "sound/gadgets/stealth_off",
	},
	
	CloakingBoost = 
	{
		aura_end_sound = "sound/gadgets/stealth_off",
	},
	
	IonRay = 
	{
		aura_end_sound = "sound/gadgets/ion_ray_influence_end",
		aura_start_sound = "sound/gadgets/ion_ray_influence",
	},
	
	ShieldEmitter = 
	{
		aura_target_its_direction_fx = "particles/gadget/shield_heal",
	},
	SpaceMissile = 
	{
		Ion = 
		{
			aura_end_sound = "sound/gadgets/ion_ray_influence_end",
			aura_start_sound = "sound/gadgets/ion_ray_influence",
		},
		
		AAMSlow = 
		{	
			aura_sound 			= "sound/aura/voidzone",
		},
	},
	StasisGenerator = 
	{
	},
	
	
	TargetPainter = 
	{
---		aura_start_sound = "sound/gadgets/ecm_jammer_influence",
	},
	TimeBoost =
	{
		aura_end_sound	= "sound/gadgets/timeboost_end",
		aura_fx = "particles/gadget/overdrive",
	},
	PlasmaWeb =
	{
	  period_module_fx = "particles/gadget/plasma_web_module",
	  period_module_my_fx = "particles/gadget/plasma_web_module",
	},
	
	BlackoutGenerator =
	{
		aura_fx = "particles/gadget/blackout",
		
		Stun =
		{
			aura_fx = "",
			cast_fx			= "particles/gadget/blackout_burst",
		},
	},
	
	-- BlackoutGenerator_Stun = 
	-- {
		-- cast_fx			= "particles/gadget/blackout_burst",
	-- },
	
	-- BlackoutGenerator_Stun_Faction1 = 
	-- {
		-- cast_fx			= "particles/gadget/blackout_burst",
	-- },
	
	-- BlackoutGenerator_Stun_Faction2 = 
	-- {
		-- cast_fx			= "particles/gadget/blackout_burst",
	-- },
	
	SmartBomb = 
	{
		period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
		period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",
		
		period_fx			= "particles/gadget/pulsars/pulsar_hit_2",
		period_my_fx      = "particles/gadget/pulsars/pulsar_hit_2", 
		period_beam_fx 		= "particles/gadget/pulsars/pulsar_beam",
	},
	
	G2D2 = 
	{
		period_sound 		= "sound/gadgets/pulsar/pulsar_period", --звук попадания, играется на цели
		period_holder_sound = "sound/gadgets/pulsar/pulsar_fire",
		
		period_fx 			= "particles/gadget/pulsars/pulsar_g2d2_hit",
		period_my_fx      = "particles/gadget/pulsars/pulsar_g2d2_hit", 
		period_beam_fx 		= "particles/gadget/pulsars/pulsar_g2d2_beam",
	},
	
	Alien = 
	{
		Pulsar =
		{
			period_sound 		= "sound/gadgets/pulsar/alien_pulsar_period", --звук попадания, играется на цели
			period_holder_sound = "sound/gadgets/pulsar/alien_pulsar_fire",

			period_fx			= "particles/gadget/pulsars/pulsar_alien_hit",
			period_my_fx      = "particles/gadget/pulsars/pulsar_alien_hit", 
			period_beam_fx 		= "particles/gadget/pulsars/pulsar_alien_beam",
		},
	},
	
	AfterShock = 
	{

		period_fx			= "particles/gadget/pulsars/pulsar_alien_hit",
		period_my_fx		= "particles/gadget/pulsars/pulsar_alien_hit", 
		period_beam_fx 		= "particles/gadget/pulsars/pulsar_alien_beam",
	},

	SpyBeacon = 
	{
		aura_fx				= "particles/gadget/default_module_work_looped",
	},

	SpyDrone = 
	{
--		aura_start_sound 	= "sound/gadgets/ecm_jammer_influence",
	},

	CapSmartBomb = 
	{
		period_holder_sound	 = "sound/gadgets/BossBigSmartBomb_fire",
	},

	BossBigSmartBombT5 =
	{
		period_holder_sound	 = "sound/gadgets/BossBigSmartBomb_fire",
	},

	BossSmartBombT5 =
	{
		period_holder_sound	 = "sound/gadgets/BossBigSmartBomb_fire",
	},

	CommSmartBomb =
	{
		period_holder_sound	 = "sound/gadgets/BossBigSmartBomb_fire",
	},
	
	Pve = 
	{
		VoidZone =
		{
			aura_fx			= "particles/gadget/suicide_aura";
		},
	},
	
	SpaceMissile=
	{
		
		EnergyNullifierField = 
		{
			aura_target_its_direction_fx = "particles/gadget/burn_energy",
			aura_fx 			= "particles/weapons/staticrocket/rocket_spell_blue";
			aura_sound 			= "sound/aura/voidzone",
		},
		PropulsionJammField = 
		{
			aura_fx = "particles/weapons/staticrocket/rocket_spell_green",
			aura_sound 			= "sound/aura/voidzone",
			nebula = "Effects_Nebula_SlowSpeed700",
		},
		Nuke = 
		{
			aura_fx			= "particles/gadget/suicide_aura",
			aura_sound 			= "sound/aura/voidzone",
			nebula			= "Effects_Nebula_NukeVoidzone",
		},
	},
	
	GravitationAnalyzer = 
	{
		aura_apply_fx = "",
	},
	
	ShieldExplosion =
	{
		cast_fx = "particles/gadget/aura_blast",
	},
	
	HealBot =
	{
		aura_fx = "particles/gadget/shield_heal",
	},
	
	RepairRay =
	{
		aura_target_fx = "particles/gadget/hull_heal",
		period_beam_root_fx	= "particles/gadget/pulsars/drone_hull_ray_periodic",
	},
	
	ShieldRay =
	{
		aura_target_fx = "particles/gadget/shield_heal",
		period_beam_root_fx = "particles/gadget/pulsars/drone_shield_ray_periodic",
	},
	
	EnergyShieldCommander = 
	{
		aura_fx = "particles/gadget/energy_shield",
		
		--aura_fx = "particles/gadget/teleport_prepare",
		
		--aura_fx = "particles/gadget/debuff_immune",
		
		--aura_fx = "particles/gadget/slow_movement"
		
		-- Прозрачные
		
		--aura_fx = "particles/gadget/stealth_field",
		
		--aura_fx = "particles/gadget/speed_adaptation",
		
		--aura_fx = "particles/gadget/shield_heal",
		
		--CrystalRageMode дпс увеличивает на 35-50%
		--aura_fx = "particles/gadget/ragemode",
		
		--aura_fx = "particles/gadget/matter_absorber",
		
		--aura_fx = "matter_absorber_uncirculated",
			
		--Shell_GreenShield ещё один зеленый шелл на ???, шелл - как щит ???
		--aura_fx = "particles/gadget/alien_mass_shield_hit",
		
		--GreenGravyPush центр отталкивания
		--ReturnPoint_Weakness почему оно сдесь прописано ???? SLOW_MANEUVER
		--aura_fx = "particles/gadget/alien_gravypush_aura",
			
		--Шелл чужих
		--aura_fx = "particles/gadget/alien_emergency_shell",
				
		--aura_fx = "particles/gadget/invulnerability",
			
		--aura_fx = "particles/gadget/damage_thermal",
			
		--EmergencyTeleportHolder Как только стало меньше чем пол хп, на пол сек неуяз и тп, зачем отдельный эффект ?
		--aura_fx = "particles/gadget/emergency_teleport_aura",

		--ReturnPoint прописано но не играется!
		--aura_fx = "particles/gadget/greenship_retreat_idle",
			
		-- Шелл, может лучше рисовать сферу размером с щит но ярче
		--aura_fx = "particles/gadget/pshield_1",
			
		--Spell_ShelterField_friendlyPart Делает цель невидимой STEALTH, вроде не нужен эффект ?
		--aura_fx = "particles/gadget/shelter_shield",
			
		--ShieldandHullFortify 150% - 58% дамага, DeimosFaceHardener 75% - 40% дамага, Повышает ресисты, 
		--aura_fx = "particles/gadget/shield_fortify",
		
		--aura_fx = "particles/gadget/aura_wave",
		--aura_fx = "particles/gadget/aura_wave_code",
		--aura_fx = "particles/gadget/aura_wave_red",
		--aura_fx = "particles/gadget/aura_wave_green",
	},
	
	ShieldHavoc =
	{
		aura_fx 		= "particles/gadget/huge/shield_havoc",
		nebula			= "Effects_Nebula_ShieldHavoc",
		aura_sound 		= "sound/gadgets/ShieldHavoc_loop",
	},
	
	FrigateDrone =
	{
		cast_fx = "particles/gadget/aura_wave",
		--Нужен эффект +щита
		--aura_apply_fx = "particles/gadget/shield_boost",
		T5=
		{
			UniqRay=
			{
				work_beam_fx	 = "particles/gadget/healray_beam",
				cast_fx = "",
				work_beam_end_fx = "particles/gadget/healray_beam_end",
				nebula	= "Effects_Nebula_BrokkRay",
			},
		},
		T3=
		{
			LessShldHeal=
			{
				influence_fx = "particles/gadget/shield_boost",
				work_beam_fx = "particles/gadget/drone_beam",
			},
		},
	},
	GreenTimeBoost = 
	{
		Base = 
		{
			aura_end_sound	= "sound/el_modules/GreenTimeBoost_end",
		},
		N =
		{
		},
	},
	Camouflage = 
	{
		aura_fx = "StealthEffect",
	},
	Chameleon =
	{
		aura_fx = "StealthEffect",
	},
	ShieldRestoreSmall =
	{
		cast_fx="particles/gadget/shield_boost",
	},
	ShieldRestoreMedium =
	{
		cast_fx ="particles/gadget/shield_boost",
	},
	ShieldRestoreLarge =
	{
		cast_fx="particles/gadget/shield_boost",
	},
	ShieldHealByEnemyDeath =
	{
		cast_fx="particles/gadget/shield_boost",
	},
	CrystalRageMode = 
	{
		aura_fx="particles/gadget/ragemode",
	},
	WarpBan = 
	{
		aura_fx	= "particles/gadget/lightnings_debuff",
	},
	AdaptiveShieldBoost =
	{
		aura_fx	= "particles/gadget/shield_heal",
	},
	AdaptiveShieldBoostSpec =
	{
		aura_fx	= "particles/gadget/shield_heal",
	},
	GreenInvulnerability =
	{
		aura_fx = "particles/gadget/invulnerability",
	},
	GreenInvulnerability4 =
	{
		aura_fx = "particles/gadget/invulnerability",
	},
	GreenInvulnerability5 =
	{
		aura_fx = "particles/gadget/invulnerability",
	},
	EmergencyBarrier =
	{
		--aura_fx = "particles/gadget/invulnerability",
		aura_fx = "particles/gadget/barier",
	},
	StunningSpurt =
	{
		cast_fx	= "particles/gadget/blackout_burst",
	},
	EnergyVampire =
	{
		aura_fx = "particles/gadget/burn_energy",
	},
	
	-- GreenStation
	GreenPlatform =
	{
		AllyShieldEmitterField =
		{
			aura_target_fx =  "particles/gadget/shield_heal",
		},
		
		EnemySlowField =
		{
			aura_fx	= "particles/weapons/staticrocket/rocket_spell_green_big",
			nebula = "Effects_Nebula_SlowSpeed3000",
		},
		
		AllyEnergyEmitterField =
		{
			aura_target_fx =  "particles/gadget/add_energy",
		},
		
		AntiFocusField =
		{
			aura_target_fx = "particles/gadget/overdrive",
		},
		
		SelfShield_Shell =
		{
			aura_fx = "particles/gadget/pshield_1",
		},
		
		AllyRepairField =
		{
			aura_target_fx =  "particles/gadget/matter_absorber",
		},
	},
	--
	EnergyBurner =
	{
		aura_target_directed_fx = "particles/gadget/burn_energy",
		period_beam_root_fx = "particles/gadget/pulsars/energy_burner_beam",
	},
	DisableWeapon =
	{
		gun_spell_fx	= "particles/gadget/disable_weapon_gun",
	},
	--#0081004: Диверсант активка на корабль Swift Mk 3 (HardRadiation)
	HardRadiation =
	{
		period_module_fx = "particles/gadget/plasma_web_module",
		period_module_my_fx = "particles/gadget/plasma_web_module",
	},
	FocusedRay =
	{
		work_beam_fx = "particles/gadget/focused_ray_beam",
		--nebula 			= "Effects_Nebula_TachRay",
	},
	FocusedRay1 =
	{
		period_module_fx = "particles/gadget/focused_ray_module",
		period_module_my_fx = "particles/gadget/focused_ray_module",
	},
	SpikeOnSpeedLaser =
	{
		gun_spell_fx	= "particles/gadget/gun_buff",
		--aura_fx 		= "particles/gadget/damage_buff",
	},
	RadiationCloud = 
	{
		cast_position_fx = "particles/gadget/damage_emp_cone",
		period_module_fx = "particles/gadget/damage_emp_module",
		period_module_my_fx = "particles/gadget/damage_emp_module",
		nebula = "Effects_Nebula_RadiationCloud",
	},
	--#0081984: Развед пушка Наноботы-разрушители (CorrosiveGunScout)
	CorrosiveGunScout =
	{
		period_module_fx = "particles/gadget/damage_kinetic_module",
		period_module_my_fx = "particles/gadget/damage_kinetic_module",
	},
	CorrosiveGunScout_End =
	{	
		aura_target_fx 	= "particles/gadget/hull_heal",
	},
	--#0084380: Активный модуль на Инженер DivineStorm
	DivineStorm =
	{
		aura_target_fx = "particles/gadget/shield_boost",
		cast_position_fx = "particles/gadget/damage_emp_sphere",
	},
	DivineStorm1 =
	{
		period_module_fx = "particles/gadget/damage_emp_module",
		period_module_my_fx = "particles/gadget/damage_emp_module",
	},
	FuelEmissionsScoutCharge =
	{
		nebula			= "Effects_Nebula_Emissions",
		cast_position_fx	= "particles/gadget/fueldrop_sphere_big_emp",
	},
	FuelEmissionsScout =
	{
		aura_fx			= "particles/gadget/fueldrop_emp",
	},
	BlackBomb =
	{
		nebula			= "Effects_Nebula_BlackBomb",
	},
	--#0084386: Активный модуль на Инженер CalibrationGrenade
	CalibrationGrenade1 =
	{
		aura_target_fx 	= "particles/gadget/shield_heal",
		aura_fx 		= "particles/weapons/staticrocket/rocket_spell_shield",
	},
	CalibrationGrenade2 =
	{
		aura_fx			= "particles/gadget/healban_core",
		aura_target_fx 	= "particles/gadget/healban_aura",
	},
	ParticleExplosion =
	{
		aura_target_fx 	= "particles/gadget/shield_heal",
	},
	RepairDrones =
	{
		aura_target_fx 		= "particles/gadget/hull_heal",
	},
	MatterFlow =
	{
		aura_target_fx 		= "particles/gadget/hull_heal",
		work_beam_fx	= "particles/gadget/hull_heal_ray",
	},
	Jump2Dude =
	{
		aura_target_fx 		= "particles/gadget/hull_heal",
	},
	Primary2HullRestore1 =
	{
		aura_target_fx 		= "particles/gadget/hull_heal",
	},
	HealBanHaze = 
	{
		aura_fx			= "particles/gadget/healban_core",
		aura_target_fx 		= "particles/gadget/healban_aura",
	},
	HealEnergyBanHaze =
	{
		aura_fx			= "particles/gadget/healban_core",
		aura_target_fx 	= "particles/gadget/healban_aura",
	},
	HealEnergyBanHaze_Energy =
	{
		aura_target_fx 	= "particles/gadget/burn_energy",
	},
	DroneBuffer = 
	{
		aura_target_fx 		= "particles/gadget/drone_damage_buff",
	},
	EnlargeActiveCooldown_Self =
	{	
		aura_target_fx = "particles/gadget/debuff_immune",
	},
	ProtectiveFire =
	{
		cast_position_fx = "particles/gadget/aura_wave_red",
		gun_spell_fx	= "particles/gadget/gun_buff",
	},
	WeaknessDetector =
	{
		aura_target_directed_fx = "particles/gadget/scan_target",
	},


	NoiseSuppressor =
	{
		aura_target_fx 	= "particles/gadget/debuff_immune_2",
		aura_sound 	= "sound/aura/NoiseSuppressor",
	},
	FlameThrowerFire = 
	{
		period_module_fx = "particles/gadget/damage_emp_module",
		period_module_my_fx = "particles/gadget/damage_emp_module",
	},
	Flame = 
	{
		period_module_fx = "particles/gadget/damage_emp_module",
		period_module_my_fx = "particles/gadget/damage_emp_module",
	},
--[[ 	FastShootAxe =
	{
		gun_spell_fx	= "particles/gadget/gun_buff",
	}, ]]
	MacheteFury =
	{
		gun_spell_fx	= "particles/gadget/gun_buff",
	},
	Hook =
	{
		work_beam_target_root_fx = "particles/gadget/attraction_beam",
	},
	SpaceSqueezer1 =
	{
		work_beam_target_root_fx = "particles/gadget/attraction_beam",
	},
	SpaceSqueezer =
	{
		aura_target_fx = "particles/gadget/shield_fortify",
	},
}