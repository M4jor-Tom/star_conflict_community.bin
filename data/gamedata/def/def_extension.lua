--[[
	EntityDefs Extension
	расширение прототипов энтити (переопределение некоторых полей)
	применяется после загрузки прототипов и применения их наследований (def inherit)
	работает по следующему принципу
	- например у нас есть прототипы
		Def.BlastWave_AAMu_Learn_Mk1 =
		{
			class = "BlastWave",
		}
		Def.BlastWave_AAMu_Learn_Mk2 =
		{
			class = "BlastWave",
		}
		Def.BlastWave_AAMu_Learn_Mk3 =
		{
			class = "BlastWave",
		}
		Def.BlastWave_AAMu_Military_Mk1 =
		{
			class = "BlastWave",
		}
		Def.BlastWave_Cruise_Learn_Mk1 =
		{
			class = "BlastWave",
		}
	- и есть следующее описание расширений
		DefExtension =
		{
			BlastWave =
			{
				AAMu =
				{
					Learn =
					{
						Mk3 =
						{
						}
						sound = "sound/null",
					}
					sound = "sound/weapons/rocket_explosion",
				},
				Cruise =
				{
					sound = "sound/weapons/torpedo_explosion",
				},
			},
		}
	- то в итоге получатся следующие прототипы
		Def.BlastWave_AAMu_Learn_Mk1 =
		{
			class = "BlastWave",
			sound = "sound/null",
		}
		Def.BlastWave_AAMu_Learn_Mk2 =
		{
			class = "BlastWave",
			sound = "sound/null",
		}
		Def.BlastWave_AAMu_Learn_Mk3 =
		{
			class = "BlastWave",
			sound = "sound/null",
		}
		Def.BlastWave_AAMu_Military_Mk1 =
		{
			class = "BlastWave",
			sound = "sound/weapons/rocket_explosion",
		}
		Def.BlastWave_Cruise_Learn_Mk1 =
		{
			class = "BlastWave",
			sound = "sound/weapons/torpedo_explosion",
		}
	т.е. для каждого прототипа строится иерархия вложенных таблиц на основе его имени.
	в качестве разделителя в иерархии всегда используется "_"
	а затем пробегается по ерархии DefExtension и копируются все поля.
]]
DefExtension =
{
	BlastWave =
	{
		SM = --SpaceMissile
		{
			Helloween =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 150 100 20",
				light_radius = 30,
				light_time = 1.1,	
				sound = "sound/explosion/rocket_expl",				
			},
			Volley =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 150",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/rocket_expl",
			},
			Barrage =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 100",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/small_rocket_expl",
			},
			AAMu =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 100",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/small_rocket_expl",
				Premium =  -- праздничная ракета на день космонавтики
				{
					funny =
					{
						effect = "particles/explosions/firework",
						sound = "sound/weapons/ny/ny_rocket_explosion",
					},
				},
				Christmas = -- рождественские ракеты
					{
						light_color = "255 100 0 200",
						light_radius = 40,
						light_time = 0.8,
						effect = "particles/explosions/firework",
						sound = "sound/weapons/ny/ny_rocket_explosion",
						T2 = {
							light_color = "0 100 255 200",
							effect = "particles/explosions/firework2",
						}
					},
			},
			NewYear = 
			{
				light_color = "255 100 0 200",
				light_radius = 40,
				light_time = 0.8,
				--effect = "particles/explosions/firework2",
				effect = "particles/explosions/firework",
				sound = "sound/weapons/ny/ny_rocket_explosion",
				
				-- SC-117184
				-- T2 = {
					-- light_color = "0 100 255 200",
					-- effect = "particles/explosions/firework2",
				-- },
				-- T3 = {
					-- light_color = "0 100 255 200",
					-- effect = "particles/explosions/firework3",
				-- },
			},
			April = 
			{
				light_color = "255 100 0 200",
				light_radius = 40,
				light_time = 0.8,
				effect = "particles/explosions/pizza_hit",
				sound = "sound/explosion/pizza_rocket_expl",
			},
			HealParts = 
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 150",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/rocket_expl",
			},
			ResistSub = 
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 150",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/rocket_expl",
			},
			ChildRockets = 
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 150",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/plasma_rocket_expl",
				Child =
				{
					sound = "sound/explosion/rocket_expl",
				},
			},
			ChainRockets = 
			{
				effect = "particles/weapons/vortex/explosion",
				light_color = "55 60 220 100",
				light_radius = 10,
				light_time = 0.5,
				sound = "sound/gadgets/Vortex/Vortex_explosion",
			},
			AAMEMP =
			{
				effect = "particles/explosions/expl_1_energy",
				light_color = "50 100 255 150",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/plasma_rocket_expl",
			},
			AAMKin =
			{
				effect = "particles/explosions/expl_2",
				light_color = "255 100 50 150",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/small_rocket_expl",
			},
			AAMSlow =
			{
				effect = "particles/explosions/expl_4_slow",
				light_color = "50 100 255 100",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/plasma_rocket_expl",
			},
			Cruise =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 100",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/big_rocket_expl",
			},
			DoomDay =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 100",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/big_rocket_expl",			
			},
			EMP =
			{
				effect = "particles/explosions/expl_1_energy",
				light_color = "50 100 255 150",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/plasma_rocket_expl",
			},
			Ion =
			{
				effect = "particles/explosions/expl_3_ion",
				light_color = "255 100 0 100",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/plasma_rocket_expl",
			},
			Kinetic =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 100",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/rocket_expl",
			},
			Nuke =
			{
				effect = "particles/weapons/nuke/explosion",
				light_color = "255 225 154 255",
				light_radius = 375,
				light_time = 2.0,
				sound = "sound/explosion/NukeBomb_expl",
			},
			-- Торпеда в битве дредноутов
			TorpedoLauncher =
			{
				effect = "particles/weapons/nuke/explosion",
				light_color = "255 225 154 255",
				light_radius = 375,
				light_time = 2.0,
				sound = "sound/explosion/NukeBomb_expl",
			},			
			Standart =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 150",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/rocket_expl",
			},
			Torpedo =
			{
				effect = "particles/explosions/explosion_big2_emp",
				light_color = "140 190 255 100",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/big_rocket_expl",
			},
			AnomalyRocket =
			{
				effect = "particles/explosions/explosion_big2_emp",
				light_color = "140 190 255 100",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/big_rocket_expl",
			},
			Fireworks =
			{
				light_color = "255 100 0 200",
				light_radius = 40,
				light_time = 0.8,
				effect = "particles/explosions/firework3",
				sound = "sound/weapons/ny/ny_rocket_explosion",
				T2 =
				{
					effect = "particles/explosions/firework3",
					light_color = "255 100 0 200",
					sound = "sound/weapons/ny/ny_rocket_explosion",
				},
				T4 =
				{
					effect = "particles/explosions/firework3",
					light_color = "255 100 0 200",
					sound = "sound/weapons/ny/ny_rocket_explosion",
				},
			},
			EnergyNullifierField =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 200",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/plasma_rocket_expl",
			},
			PropulsionJammField =
			{
				effect = "particles/explosions/big_fire_2",
				light_color = "255 100 0 200",
				light_radius = 20,
				light_time = 0.8,
				sound = "sound/explosion/plasma_rocket_expl",
			},
			MagnetMine =
			{
				effect = "particles/explosions/alien_nuke",
				light_color = "154 225 154 255",
				light_radius = 375,
				light_time = 2.0,
				sound = "sound/explosion/NukeBomb_expl",
			},
			ZM = 
			{
				Aliens =
				{
					effect = "particles/explosions/expl_2_alien",
				},
				Humans =
				{
					effect = "particles/explosions/expl_4_slow",
				},
			},
		},
		
	
		MineField =
		{
			effect = "particles/explosions/big_fire_2", --SE
			light_color = "255 100 0 255",
			light_radius = 30,
			light_time = "0.8",
			sound = "sound/explosion/mine_expl",
		},
		ProximityMine =
		{
			effect = "particles/explosions/big_fire_2", --SE
			light_color = "255 100 0 255",
			light_radius = 30,
			light_time = "0.8",
			sound = "sound/explosion/mine_expl",

		},
		ProximityMineGreen =
		{
			effect = "particles/explosions/timebomb_explosion", 
			light_color = "255 100 0 255",
			light_radius = 30,
			light_time = "0.8",
			sound = "sound/explosion/mine_expl",
		},
		DeathRay =
		{
			effect = "particles/explosions/explosion_big3_electric",
			light_color = "0 100 255 255",
			light_radius = 30,
			light_time = "0.8",
			sound = "sound/explosion/deathray_expl",
		},
		FakeShip =
		{
			sound = "sound/explosion/big_rocket_expl",
		}
	},
	
	
	Expendable =
	{
		BasicGuidedDron =
		{
			launch_sound = "sound/weapons/drone/BasicGuidedDron_launch",
		},
	},
	
	Module =
	{
		
		DeimosFace =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
		
		GreenTimeBoost = 
		{
			activate_sound = "sound/el_modules/GreenTimeBoost",
		},
		
		
		CrystalRageMode =
		{
			activate_sound = "sound/el_modules/ElCommonActivate",
		},
		
		MissileReload =
		{
			activate_sound = "sound/el_modules/ElCommonActivate",
		},
		
		RestoringIons = 
		{
			activate_sound = "sound/gadgets/RestoringIons/rest_ion_activation",
		},
	
		PairsShell =
		{
			activate_sound = "sound/gadgets/PairsShell/ps_activation",
		},
		
		ShieldLink =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
		TractorBeam =
		{
			activate_sound = "sound/gadgets/TractorBeam/tb_activation",
		},
		RestoringIons =
		{
			activate_sound = "sound/gadgets/rest_ions/rest_ions_activation",
		},
		
		TurretThermo = 
		{
			activate_sound = "sound/destroyer/turret_activation",	
			shot_once_sound = "sound/destroyer/TurretThermo_shot",
		},
		
		TurretPlasma = 
		{
			activate_sound = "sound/destroyer/turret_activation",
			shot_once_sound = "sound/destroyer/TurretPlasma_shot",			
		},
		
		AdaptiveBigShieldBoost = 
		{
			activate_sound = "sound/destroyer/turret_activation",
		},
		
		ShieldHavoc = 
		{
			activate_sound = "sound/gadgets/ShieldHavoc",	
		},
		
		Invulnerability = 
		{
			activate_sound = "sound/gadgets/Invulnerability",	
		},
		
		ShieldChargeLarge = 
		{
			activate_sound = "sound/gadgets/ShieldChargeLarge",	
		},
		
		ReverseThruster = 
		{
			activate_sound = "sound/gadgets/ReverseThruster_prepare",
		
		},
		
		G2D2 = 
		{
			activate_sound = "sound/gadgets/G2D2_activate",
		},
		
		ShieldRay =
		{
			activate_sound = "sound/gadgets/FrigateDrone/fd_launch",
			heal_sound		= "sound/gadgets/FrigateDrone/fd_heal",
		},
		RepairRay =
		{
			activate_sound = "sound/gadgets/FrigateDrone/fd_launch",
			heal_sound		= "sound/gadgets/FrigateDrone/fd_heal",
		},
		CommandArmorResist =
		{
			activate_effect = "particles/gadget/aura_wave_red",
			activate_sound = "sound/gadgets/common_activate",
		},
		Shift =
		{
			activate_sound = "sound/gadgets/shift_activate",
			deactivate_sound = "sound/gadgets/shift_off",
		},
		SniperFastShot =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
		
		ShieldExplosion =
		{
			activate_sound = "sound/gadgets/ShieldExplosion",
		},
		
		GravitationAnalyzer =
		{
			activate_effect = "particles/gadget/aura_wave",
			activate_sound = "sound/gadgets/common_activate",
		},
		
		GuidedDron =
		{
			activate_sound = "sound/gadgets/guidedDron_activation",
		},
		
		GuidedDronRL =
		{
			activate_sound = "sound/gadgets/guidedDron_activation",
		},
		
		HackSystems = 
		{
			activate_sound = "sound/gadgets/G2D2_activate",
			activate_effect = "particles/gadget/aura_wave_code",
		},
		
		FakeShips = 
		{
			activate_sound = "sound/el_modules/ElCommonActivate",
			
			Prec =
			{
				activate_sound = "sound/el_modules/ElCommonActivate",
			},
		},
		
		ShelterField =
		{
			activate_sound = "sound/gadgets/shelterField",
		},	
		
		EnergyLance =
		{
			activate_effect = "particles/gadget/spire",
			activate_sound = "sound/gadgets/EnergyLance/el_activation",
			Prec =
			{
				activate_effect	= "particles/gadget/spire_alien",
			},
		
			TimeBoost =
			{
				activate_effect = "",
				activate_sound = "sound/gadgets/timeboost_on",
			},
		},
		
		Flash =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
		
		Chameleon =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
		
		Camouflage =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
		
		SniperOverload =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
		
		Eagleeye =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
		
		Afterburner =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
		
		Screen =
		{
			activate_sound = "sound/gadgets/screen",
		},
		
		WarpGate =
		{
			activate_sound = "sound/gadgets/warpgate/wg_activate",
		},
		SpyBeacon =
		{
			activate_sound = "sound/gadgets/FrigateDrone/fd_launch",
		},
		BoostBan =
		{
			activate_sound = "sound/gadgets/ecm",
		},
		AOE =
		{
			activate_effect = "particles/gadget/aura_wave",
			activate_sound = "sound/gadgets/common_activate",
		},
		AchillesTargetingUnit =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
		},
		AdaptiveArmorBoost =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/adaptive_armor",
		},
		ArmorChargeLarge = 
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/adaptive_armor",
		},

		AdaptiveShieldBoost =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/shield_boost",
		},
		AdaptiveShieldBoostSpec =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/shield_boost",
		},
		BoostJammerAOE =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound 		= "sound/gadgets/common_activate",

		},
		CloakingDevice =
		{
			activate_sound = "sound/gadgets/stealth_on",
			deactivate_sound = "sound/gadgets/stealth_off",
		},
		CommandShieldResist =
		{
			activate_effect = "particles/gadget/aura_wave",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
		},
		CommandWeaknessAnalyzer =
		{
			activate_effect = "particles/gadget/aura_wave",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
		},
		Disintegrator =
		{
			activate_sound 		= "sound/gadgets/disintegrator/dis_activate",
			deactivate_sound	= "sound/gadgets/disintegrator/dis_deactivate",
			shot_once_sound		= "sound/gadgets/disintegrator/dis_fire",
			work_sound 			= "sound/gadgets/disintegrator/dis_work_loop_p",
			projectile			= "Projectile_Disintegrator",
		},
		EcmJammer =
		{
			activate_beam_fx = "particles/gadget/ecm_beam",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/ecm",
		},
		EnergyEmitter =
		{
			activate_effect = "particles/gadget/aura_wave_green",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/shield_emitter",
		},
		EnergyVampire =
		{
			work_beam_fx = "particles/gadget/exhaustion_beam_energy",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/nrg_vampire",
		},
		FocusedEMI =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
			work_beam_fx = "particles/gadget/focused_emi_beam",
		},
		FrigateDrone =
		{
			activate_sound		= "sound/gadgets/FrigateDrone/fd_launch",
			activate_drone_effect = "particles/gadget/drone_overcharge",
			activate_drone_beam_fx = "particles/gadget/drone_beam",
			T5 = 
			{
			UniqRay = 
				{
					activate_sound = "sound/gadgets/UniqRay/UniqRay_activate",
				},
			},
			LowRes = 
			{
				activate_sound = "sound/gadgets/common_activate",
			},
		},
		InfraredContermeasure =
		{
			activate_effect = "particles/gadget/heatflares",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/flares",
			Learning =
			{
				funny = -- праздничная ракета на день космонавтики
				{
					--activate_effect = "particles/gadget/confetti",
					activate_sound = "sound/weapons/ny/ny_rocket_launch",
				},
			},
		},
		IonRay =
		{
			activate_beam_fx = "particles/gadget/ecm_beam",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/ion_ray",
		},
		MicroWarp =
		{
			fail_sound = "sound/gadgets/warp_fail",
			stop_sound = "sound/gadgets/warp_stop",
		},
		MissileDefenceType1 =
		{
			--activate_effect = "particles/gadget/heatflares",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
		},
		RemoteRepairDrones =
		{
			activate_effect = "particles/gadget/aura_wave",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
		},
		RepairDrones =
		{
			--activate_effect = "particles/gadget/repair",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
		},
		ShieldEmitter =
		{
			activate_effect = "particles/gadget/aura_wave",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/shield_emitter",
			--work_effect = "particles/gadget/default_module_work_looped",
		},
		ShieldRestoreLarge =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/shield_boost",
		},
		ShieldRestoreMedium =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/shield_boost",
		},
		ShieldRestoreSmall =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/shield_boost",
		},
		SpyDrone =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/SpyDrone",
		},
		StasisGenerator =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
			work_beam_fx = "particles/gadget/default_beam",
		},
		Suicide =
		{
			light_color = "255 100 0 255",
			light_radius = 30,
			light_time = "0.8",
			sound = "sound/explosion/rocket_expl",
		},
		TargetPainter =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
			work_beam_fx = "particles/gadget/targetpainter_beam",
		},
		ShieldVampire =
		{
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
			work_beam_fx = "particles/gadget/exhaustion_beam",
		},
		EnhanceWeapon =
		{
			work_beam_fx = "particles/gadget/exhaustion_beam",
		},
		TurretModule =
		{
--			activate_sound = "sound/gadgets/turret_mode_on",
--			deactivate_sound = "sound/gadgets/turret_mode_off",
		},
		WebPropulsion =
		{
			work_beam_fx = "particles/gadget/propulsion_beam",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
		},
		BoostBan =
		{
			work_beam_fx = "particles/gadget/boostban_beam",
			activate_module_effect = "particles/gadget/default_module_work",
			activate_sound = "sound/gadgets/common_activate",
		},
		TimeBoost =
		{
			activate_sound = "sound/gadgets/timeboost_on",
		},
		PlasmaWeb =
		{
			activate_beam_fx = "particles/gadget/plasma_web_beam_once",
			activate_sound = "sound/gadgets/plasmaweb_shot",
			T5 = 
			{
				Charged =
				{
					activate_sound = "sound/gadgets2/ChargedPW_activate",
				}
			},
			Prec =
			{
				activate_beam_fx = "particles/gadget/alien_cast_beam",
			},
		},
		SmartBomb =
		{
			activate_sound = "sound/gadgets/common_activate",
		},
	},
	ModuleEngine =
	{
		Race1 =
		{
			engine_sound_left = "sound/engine/left_engine",
			engine_sound_right = "sound/engine/right_engine",
			engine_flare_color		= "255 224 178 0",
			boost_flare_color		= "255 224 178 0",
			engine_light_color		= "255 202 126 255",
			--engine_light_color		= "0 255 0 100", --light test
			trail_color = "121 36 1 100",
			boost_effect = "particles/ships/ship_engine_y3",
			engine_effect = "particles/ships/ship_engine_y3",
			engine_flame_acceleration_time_interval = 3.0,
			engine_glow_acceleration_time_interval = 1.0,
			engine_min_length_factor = 0.25,
			engine_min_width_factor = 0.5,
			engine_glow_intensity_min = 0.0001;
			engine_glow_intensity_max = 1.0;
			--S
			Small =
			{
				trail_size = 0.05,
				engine_length = 0.07,
				engine_width = 0.07,
				boost_length = 0.07,
				boost_width = 0.07,
				engine_flare_size = 0.1,
				boost_flare_size = 0.08,
				engine_flare_offset = -0.07,
				boost_flare_offset = -0.07,
				engine_light_radius = 8,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/small_start_loop",
				boost_stop_sound = "sound/boost/small_end",
				engine_sound = "sound/engine/small_loop",
				engine_glow_intensity_min = 0.00001;
				engine_glow_intensity_max = 1.00;
				engine_flare_color		= "255 224 178 0",
				boost_flare_color		= "255 224 178 0",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.75,
				engine_min_width_factor = 0.75,
				engine_glow_shutdown_time_interval = 0.8,
				engine_flame_shutdown_time_interval = 0.45,
				-- r1 s t1
				t1m2 =
				{
					boost_effect = "particles/ships/ship_engine_y1",
					engine_effect = "particles/ships/ship_engine_y1",
					engine_length = 0.08,
					engine_width = 0.06,
					boost_length = 0.0, -- NO BOOST
					boost_width = 0.0, -- NO BOOST
					engine_glow_intensity_min = 0.00003;
					engine_glow_intensity_max = 1.00;
					engine_min_length_factor = 0.0,
					engine_min_width_factor = 1.0,
					engine_flare_offset = -0.03,
					engine_flare_size = 0.10,
					engine_flare_color		= "255 224 178 0",
					boost_flare_color		= "255 224 178 0",
					engine_factor = 0.55,
				},
				--r1 s t5 craft
				Craft =
				{	
					boost_effect = "particles/ships/ship_engine_y1",
					engine_effect = "particles/ships/ship_engine_y1",
					engine_length = 0.20,
					engine_width = 0.13,
					engine1_length = 0.20,
					engine1_width = 0.13,
					boost_length = 0.0,
					boost_width = 0.0, 
					engine_flare_size = 0.12,
					boost_flare_size = 0.30,
					engine_light_radius = 10,
					engine_flare_offset = -0.1,
					engine_flare_color		= "182 95 27 0", 
					boost_flare_color		= "182 95 27 0", 
					boost_loop_sound = "sound/craft/small_boost",
					boost_stop_sound = "sound/craft/small_boost_end",
					engine_sound = "sound/craft/small_engine",
					engine_glow_intensity_min = 0.003;
					engine_glow_intensity_max = 1.00;
					engine_min_length_factor = 0.1,
					engine_min_width_factor = 0.5,
					engine_light_offset = -1.0,
					engine_factor = 0.55,
				},
				--Race1_L_T4_CraftUniq_small Мелкая спираль
				craftUniq =
				{
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					boost1_flare_size = 0.0,
					engine_flare_color		= "247 172 96 0",
					boost_flare_color		= "247 172 96 0",
					boost_effect = "particles/ships/ship_engine_y1",
					engine_effect = "particles/ships/ship_engine_y1",
					engine_length = 0.12,
					engine_width = 0.12,
					boost_length = 0.07,
					boost_width = 0.07,
					boost1_length = 0.07,
					boost1_width = 0.07,
					engine_min_width_factor = 1.0,
					engine_glow_intensity_min = 0.0;
				},
				-- Ship_Race1_S_T5_Herald
				Herald =
				{
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					boost1_flare_size = 0.0,
					engine_flare_color		= "247 172 96 0",
					boost_flare_color		= "247 172 96 0",
					boost_effect = "particles/ships/ship_engine_herald_boost",
					engine_effect = "particles/ships/ship_engine_herald_eng",
					engine_length = 0.12,
					engine_width = 0.12,
					engine1_length = 0.12,
					engine1_width = 0.12,
					boost_length = 0.14,
					boost_width = 0.12,
					boost1_length = 0.14,
					boost1_width = 0.12,
					engine_min_width_factor = 1.0,
					engine_glow_intensity_min = 0.00002,
					engine_min_length_factor = 0.5,
				},
				-- Ship_Race1_S_T5_Nordstorm
				Nordstorm = 
				{
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					engine_flare_offset = -0.15,
					boost_flare_offset = -0.05,
					engine_flare_color = "247 172 96 20",
					boost_flare_color = "247 172 96 20",
					boost_effect = "particles/ships/ship_engine_nordstorm_boost",
					engine_effect = "particles/ships/ship_engine_nordstorm_eng",
					engine_length = 0.55,
					engine_width = 1.0,
					engine1_length = 0.55,
					engine1_width = 1.0,
					boost_length = 0.375,
					boost_width = 1.0,
					boost1_length = 0.375,
					boost1_width = 1.0,
					engine_min_width_factor = 1.0,
					engine_min_length_factor = 0.33,
					engine_glow_intensity_min = 0.00002,
					boost_loop_sound = "sound/boost/small_t5_bootl_start_loop",
					boost_stop_sound = "sound/boost/salut_boost_end",
					engine_sound = "sound/craft/small_engine",
				},
				-- Ship_Race1_S_T5_Bootlegger
				Bootl = 
				{
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					engine_flare_offset = -0.25,
					boost_flare_offset = -0.25,
					engine_flare_color = "247 172 96 0",
					boost_flare_color = "247 172 96 0",
					boost_effect = "particles/ships/ship_engine_bootl_boost",
					engine_effect = "particles/ships/ship_engine_bootl_eng",
					engine_length = 0.61,
					engine_width = 1.0,
					boost_length = 0.45,
					boost_width = 1.0,
					boost1_length = 0.45,
					boost1_width = 1.0,
					engine_min_width_factor = 1.0,
					engine_min_length_factor = 0.33,
					engine_glow_intensity_min = 0.00002,
					engine_light_offset = -1.0,
					boost_loop_sound = "sound/boost/small_t5_bootl_start_loop",
					boost_stop_sound = "sound/boost/small_t5_craft_end",
					engine_sound = "sound/engine/Medium_T5_Typhoon_loop",
				},
				-- Ship_Race1_S_T5_CorVulnus
				corvulnus = 
				{
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					engine_flare_offset = -0.25,
					boost_flare_offset = -0.25,
					engine_flare_color = "190 10 48 100",
					boost_flare_color = "190 10 48 100",
					engine_light_color = "190 10 48 100",
					trail_color = "190 10 48 100",
					boost_effect = "particles/ships/ship_engine_r1_s_t5_boost",
					engine_effect = "particles/ships/ship_engine_r1_s_t5_eng",
					engine_length = 0.61,
					engine_width = 1.0,
					boost_length = 0.45,
					boost_width = 1.0,
					engine_min_width_factor = 1.0,
					engine_min_length_factor = 1.33,
					engine_glow_intensity_min = 0.00002,
					engine_light_offset = -1.0,
					boost_loop_sound = "sound/boost/small_t5_bootl_start_loop",
					boost_stop_sound = "sound/boost/small_t5_craft_end",
					engine_sound = "sound/engine/Medium_T5_Typhoon_loop",
					engine_factor = 0.5,
				},
				-- Ship_Race1_S_T5_Psiloi
				Psiloi = 
				{
					engine_light_color = "233 160 100 255",
					engine_light_radius = 3,
					trail_color = "190 10 48 100",
					boost_effect = "particles/ships/r1_s_t5_psiloi_boost",
					engine_effect = "particles/ships/r1_s_t5_psiloi_eng",
					engine_length = 0.61,
					engine_width = 1.0,
					boost_length = 0.6,
					boost_width = 1.0,
					engine_min_width_factor = 1.0,
					engine_min_length_factor = 1.33,
					engine_glow_intensity_min = 0.00002,
					engine_glow_intensity_max = 1.00,
					engine_glow_acceleration_time_interval = 1,
					engine_glow_shutdown_time_interval = 0.55,
					engine_light_offset = -1.0,
					boost_loop_sound = "sound/boost/small_t5_bootl_start_loop",
					boost_stop_sound = "sound/boost/small_t5_craft_end",
					engine_sound = "sound/engine/Medium_T5_Typhoon_loop",
					trail_effect = "particles/ships/ship_trail",
					trail_color = "233 160 100 155",
					trail_size = 0.08,
				},
			},
			Medium =
			{
				boost_effect = "particles/ships/ship_engine_y_m_boost",
				engine_effect = "particles/ships/ship_engine_y_m",
				trail_size = 0.07,
				engine_length = 0.375,
				engine_width = 0.25,
				boost_length = 0.5,
				boost_width = 0.25,
				engine_flare_size = 0.12,
				boost_flare_size = 0.10,
				engine_light_radius = 15,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/medium_start_loop",
				boost_stop_sound = "sound/boost/medium_end",
				engine_sound = "sound/engine/medium_loop",
				engine_glow_intensity_min = 0.00001;
				engine_glow_intensity_max = 0.70;
				engine_flare_color		= "255 224 178 0",
				boost_flare_color		= "255 224 178 0",
				engine_flare_offset = 0.05,
				boost_flare_offset = 0.05,
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.5,
				engine_min_width_factor = 0.75,
				engine_glow_shutdown_time_interval = 0.8,
				engine_flame_shutdown_time_interval = 0.45,
				-- r1 m t5 craft
				Craft =
				{	
					engine_length = 0.196,
					engine_width = 0.14,
					engine1_length = 0.154,
					engine1_width = 0.11,
					boost_length = 0.14,
					boost_width = 0.1,
					boost1_length = 0.14,
					boost1_width = 0.1,
					engine_flare_size = 0.09,
					boost_flare_size = 0.06,
					engine_flare_offset = 0.0,
					boost_flare_offset = 0.0,
					engine_flare_color = "255 224 178 0",
					boost_flare_color = "255 224 178 0",
					engine_sound = "sound/craft/medium_engine",
					boost_loop_sound = "sound/craft/medium_boost",
					boost_stop_sound = "sound/craft/medium_boost_end",
					engine_glow_intensity_min = 0.01;
					boost_effect = "particles/ships/ship_engine_y4",
					engine_effect = "particles/ships/ship_engine_y4",
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 0.25,
					engine_flame_acceleration_time_interval = 0.2,
					engine_glow_acceleration_time_interval = 0.2,
					engine_glow_shutdown_time_interval = 1.6,
					engine_flame_shutdown_time_interval = 1.4,
					engine_light_offset = -2.0,
				},
				--r1 m t4 Steam
				Loki =
				{
					engine_length = 0.14,
					engine_width = 0.14,
					boost_length = 0.12,
					boost_width = 0.12,
					engine_flare_size = 0.14,
					boost_flare_size = 0.12,
					engine_flare_color = "255 204 128 0",
					boost_flare_color = "255 204 128 0",
					engine_flare_offset = 0.0,
					boost_flare_offset = 0.0,
					engine_min_width_factor = 0.5,
					boost_effect = "particles/ships/ship_engine_y4",
					engine_effect = "particles/ships/ship_engine_y4",
				},
				--r1 m t2
				Deimos =
				{
					boost_effect = "particles/ships/ship_engine_y1",
					engine_effect = "particles/ships/ship_engine_y1",
					engine_length = 0.11,
					engine_width = 0.16,
					boost_length = 0.041,
					boost_width = 0.06,
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					engine_light_offset = -1.0,
				},
				--R1 M T1
				t1m2 =
				{
					boost_effect = "particles/ships/ship_engine_y_m_t1",
					engine_effect = "particles/ships/ship_engine_y_m_t1",
					engine_length = 0.10,
					engine_width = 0.10,
					boost_length = 0.07,
					boost_width = 0.07,
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					engine_min_width_factor = 1.0,
					engine_min_length_factor = 0.5,
					engine_glow_intensity_min = 0.00002;
					engine_light_offset = -2.0,
				},
				-- Ship_Race1_M_T5_Hadrian
				Hadrian = 
				{	
					engine_length = .7,
					engine_width = 0.6,
					boost_length = .5,
					boost_width = 0.6,
					engine_flare_size = 0.14,
					boost_flare_size = 0.12,
					engine_flare_color = "255 204 128 0",
					boost_flare_color = "255 204 128 0",
					engine_flare_offset = 0.0,
					boost_flare_offset = 0.0,
					engine_min_width_factor = 0.0,
					boost_effect = "particles/ships/race1_m_t5_hadrian_boost",
					engine_effect = "particles/ships/r1_m_t5_hadrian_eng",
				},
				CraftUniq =
				{
					Granite =
					{
						engine_glow_intensity_min = 0.00002;
						engine_glow_intensity_max = 1.0;
						engine_length = 0.11,
						engine_width = 0.09,
						engine1_length = 0.11,
						engine1_width = 0.09,
						boost_length = 0.10,
						boost_width = 0.09,
						boost1_length = 0.10,
						boost1_width = 0.09,
						boost_effect = "particles/ships/ship_engine_granite_boost",
						engine_effect = "particles/ships/ship_engine_granite_eng",
						engine_min_width_factor = 1.0,
						engine_min_length_factor = 0.5,
						engine_sound = "sound/craft/medium_engine",
						boost_loop_sound = "sound/craft/medium_boost",
						engine_light_offset = -6.0,
						engine_light_color		= "255 180 128 100",
					},
				},
				Dlc = 
				{
					boost_effect = "particles/ships/engine_thor_boost",
					engine_effect = "particles/ships/engine_thor_eng",
					engine_length = 0.4,
					engine_width = 1.0,
					boost_length = 0.08,
					boost_width = 0.08,
					boost1_length = 0.08,
					boost1_width = 0.08,
					engine_flare_size = 0.14,
					boost_flare_size = 0.12,
					engine_flare_offset = -0.07,
					boost_flare_offset = -0.05,
					engine_light_offset = -2.0,
					engine_light_radius = 15,
					engine_glow_intensity_min = 0.0000;
					engine_glow_intensity_max = 1.00;
					engine_flare_color		= "255 214 153 35",
					boost_flare_color		= "255 214 153 40",
					engine_flame_acceleration_time_interval = 0.5,
					engine_glow_acceleration_time_interval = 0.5,
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					boost_loop_sound = "sound/boost/medium_race1_t5_dlc_start_loop", 
					boost_stop_sound = "sound/boost/medium_race1_t5_dlc_end",
					engine_sound = "sound/craft/medium_engine",
				},
				-- Ship_Race1_M_T5_Typhon
				Typhon = 
				{
					engine_flare_color = "255 191 128 100",
					boost_flare_color = "255 191 128 40",
					engine_flare_offset = 0.0,
					boost_flare_offset = -0.25,
					engine_flare_size = 0.12,
					boost_flare_size = 0.12,
					engine_length = 0.22,
					engine_width = 1.0,
					engine1_length = 0.22,
					engine1_width = 1.0,
					boost_length = 0.165,
					boost_width = 0.16,
					engine_effect = "particles/ships/ship_engine_typhon_eng",
					boost_effect = "particles/ships/ship_engine_typhon_boost",
					engine_glow_intensity_min = 0.0001;
					engine_glow_intensity_max = 1.0;
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					engine_flame_acceleration_time_interval = 0.5,
					engine_glow_acceleration_time_interval = 0.3,
					engine_glow_shutdown_time_interval = 0.8,
					engine_sound = "sound/engine/Medium_T5_Typhoon_loop",
					boost_loop_sound = "sound/boost/medium_race1_t5_dlc_start_loop", 
					boost_stop_sound = "sound/boost/medium_race1_t5_dlc_end",
				},
				-- Race1_Medium_T5_Bark
				Bark = 
				{
					engine_flare_color = "255 191 128 25",
					boost_flare_color = "255 191 128 0",
					engine_flare_size = 0.08,
					engine_flare_offset = -0.05,
				    boost_flare_size = 0.01,
					engine_length = 0.4, -- передний правый
					engine_width = 0.6,
					engine1_length = 0.4, -- передний левый
					engine1_width = 0.6, 
					engine2_length = 0.4, -- задний левый
					engine2_width = 0.65,
					engine3_length = 0.4, -- задний правый
					engine3_width = 0.65,
					boost_length = 0.875,
					boost_width = 0.16,
					engine_effect = "particles/ships/ship_engine_r1_m_il2_eng",
					boost_effect = "particles/ships/ship_engine_r1_m_il2_boost",
					engine_glow_intensity_min = 0.001;
					engine_glow_intensity_max = 1.0;
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					engine_flame_acceleration_time_interval = 0.5,
					engine_glow_acceleration_time_interval = 0.3,
					engine_glow_shutdown_time_interval = 0.8,
					engine_sound = "sound/engine/Race1_M_T5_Bark_loop",
					boost_loop_sound = "sound/boost/medium_race1_t5_dlc_start_loop", 
					boost_stop_sound = "sound/boost/medium_race1_t5_dlc_end",
				},
				-- Race1_Medium_T5_Chaos
				chaos = 
				{
					engine_light_color	= "255 202 126 255",
					engine_light_radius = 5,
					engine_light_offset = -2.0,
					engine_flare_color = "255 220 150 6",
					boost_flare_color = "255 220 150 6",
					engine_flare_size = 0.18,
					engine_flare_offset = -0.16,
				    boost_flare_size = 0.18,
					boost_flare_offset = -0.12,
					boost1_flare_size = 0.18,
					boost1_flare_offset = -0.12,
					engine_length = 0.75,
					engine_width = 1.0,
					engine1_length = 0.75,
					engine1_width = 1.0, 
					boost_length = 0.6,
					boost_width = 1.0,
					boost_effect = "particles/ships/ship_stuka_boost",
					engine_effect = "particles/ships/ship_stuka_eng",
					engine_glow_intensity_min = 0.001;
					engine_glow_intensity_max = 0.25;
					engine_min_length_factor = 0.33,
					engine_min_width_factor = 1.0,
					engine_flame_acceleration_time_interval = 0.6,
					engine_flame_shutdown_time_interval = 0.6,
					engine_glow_acceleration_time_interval = 0.3,
					engine_glow_shutdown_time_interval = 0.7,
				},
			},
			Large =
			{
				boost_effect = "particles/ships/ship_engine_y_l",
				engine_effect = "particles/ships/ship_engine_y_l",
				trail_size = 0.1,
				engine_length = 0.22,
				engine_width = 0.22,
				engine1_length = 0.16,
				engine1_width = 0.16,
				engine2_length = 0.16,
				engine2_width = 0.16,
				engine3_length = 0.19,
				engine3_width = 0.19,
				engine4_length = 0.19,
				engine4_width = 0.19,
				boost_length = 0.19,
				boost_width = 0.19,
				boost1_length = 0.19,
				boost1_width = 0.19,
				engine_flare_size = 0.2,
				boost_flare_size = 0.15,
				engine_light_radius = 27,
				boost_loop_sound = "sound/boost/large_start_loop",
				boost_stop_sound = "sound/boost/large_end",
				engine_sound = "sound/engine/large_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.5,
				engine_min_width_factor = 0.75,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.75,
				engine_glow_intensity_min = 0.00001;
				engine_glow_intensity_max = 0.7;
				engine_flare_offset = -0.02,
				engine_light_offset = -1.0,

				--Ship_Race1_L_T5_Sniper
				Sniper =
				{
					boost_effect = "particles/ships/ship_engine_sniper_boost",
					engine_effect = "particles/ships/ship_engine_sniper_eng",
					boost_length = 0.45,
					boost_width = 1.00,
					boost1_length = 0.45,
					boost1_width = 1.00,
					engine2_length = 0.45,
					engine2_width = 1.00,
					engine1_length = 0.45,
					engine1_width = 1.00,
					engine_glow_intensity_min = 0.0;
					engine_glow_intensity_max = 1.0;
					boost_loop_sound = "sound/boost/large_T5_Sniper_start_loop",
					boost_stop_sound = "sound/boost/large_t5_craft_end",
					engine_sound = "sound/craft/L_T5_CraftSpec_engine",
				},

				--Race1 L T5 CraftSpec
				Scylla =
				{	
					boost_effect = "particles/ships/ship_engine_y4",
					engine_effect = "particles/ships/ship_engine_y4",
					engine_flare_color		= "255 224 178 30",
					boost_flare_color		= "255 224 178 30",
					engine_length = 0.50,
					engine_width = 0.50,
					engine1_length = 0.50,
					engine1_width = 0.50,
					boost_length = 0.28,
					boost_width = 0.28,
					engine_glow_intensity_max = 1.0;
					engine_light_radius = 20,
					boost_loop_sound = "sound/craft/L_T5_CraftSpec_start_loop",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/L_T5_CraftSpec_engine",
					engine_glow_intensity_min = 0.0005;	
					engine_flare_offset = -0.2,
					boost_flare_offset = -0.1,
					engine_flare_size = 0.5,
					boost_flare_size = 0.5,
					engine_light_offset = -2.0,
				},
				--Race1 L T1
				t1m2 =
				{
					engine_length = 0.20, -- в центре
					engine_width = 0.22,
					engine1_length = 0.16,
					engine1_width = 0.16,
					engine2_length = 0.16,
					engine2_width = 0.16,
					engine3_length = 0.16, --верхний
					engine3_width = 0.16,
					engine4_length = 0.16, --верхний
					engine4_width = 0.16,
					engine5_length = 0.16, --верхний бок
					engine5_width = 0.16,
					engine6_length = 0.16, --верхний
					engine6_width = 0.16,
					engine7_length = 0.16, --верхний бок
					engine7_width = 0.16,
					boost_length = 0.16,
					boost_width = 0.16,
					boost1_length = 0.16,
					boost1_width = 0.16,
					boost2_length = 0.16,
					boost2_width = 0.16,
					engine_glow_intensity_max = 0.6;
				},
				--Race1 L T5 Craft
				Craft =
				{	
					engine_flare_color		= "255 224 178 0",
					boost_flare_color		= "255 224 178 0",
					engine_length = 0.18,
					engine_width = 0.18,
					engine1_length = 0.18,
					engine1_width = 0.18,
					engine2_length = 0.18,
					engine2_width = 0.18,
					engine3_length = 0.18,
					engine3_width = 0.18,
					boost_length = 0.27,
					boost_width = 0.18,
					boost1_length = 0.27,
					boost1_width = 0.18,
					boost2_length = 0.27,
					boost2_width = 0.18,
					boost3_length = 0.27,
					boost3_width = 0.18,
					boost4_length = 0.27,
					boost4_width = 0.18,
					boost5_length = 0.27,
					boost5_width = 0.18,
					engine_glow_intensity_max = 1.0;
					engine_light_radius = 20,
					boost_loop_sound = "sound/craft/large_boost",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/large_engine",
					engine_glow_intensity_min = 0.0005;	
					engine_flare_offset = 0.05,
					boost_flare_offset = -0.05,
				},
				-- Race1 L t4 premUniq
				PremUniq =
				{
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					engine_flare_color		= "148 231 247 15",
					boost_flare_color		= "148 231 247 15",
					boost_effect = "particles/ships/ship_engine_cold",
					engine_effect = "particles/ships/ship_engine_cold",
					engine_length = 0.25,
					engine_width = 0.16,
					boost_length = 0.20,
					boost_width = 0.11,
					boost1_length = 0.133,
					boost1_width = 0.08,
					engine_min_width_factor = 1.0,
					engine_light_color	= "128 234 255 255",
				},
				t5 = 
				{
					-- Race1 l t5 premUniq Brokk
					PU =
					{
						engine_flare_size = 0.0, --0.25
						boost_flare_size = 0.0, --0.25
						engine_flare_color		= "247 191 127 20",
						boost_flare_color		= "247 191 127 20",
						boost_loop_sound = "sound/craft/large_boost",
						boost_stop_sound = "sound/craft/large_boost_end",
						engine_sound = "sound/craft/large_engine",
						boost_effect = "particles/ships/ship_engine_y1",
						engine_effect = "particles/ships/ship_engine_y1",
						engine_length = 0.25,
						engine_width = 0.3,
						engine1_length = 0.25,
						engine1_width = 0.3,
						boost_length = 0.25,
						boost_width = 0.3,
						engine_min_width_factor = 1.0,
						engine_glow_intensity_min = 0.00002;
						engine_glow_intensity_max = 0.5;
						engine_light_offset = -6.0,
						--
						April =
						{
							engine_flare_offset = -0.07,
							engine_flare_size = 0.0,--0.25
							boost_flare_size = 0.0, 
							engine_flare_color		= "247 173 102 20",
							boost_flare_color		= "247 191 127 20",
							boost_loop_sound = "sound/boost/large_T5_april_start_loop",
							boost_stop_sound = "sound/boost/medium_end",
							engine_sound = "sound/engine/large_t5_april",
							boost_effect = "particles/ships/ship_engine_y1_april",
							engine_effect = "particles/ships/ship_engine_y1_april",
							engine_length = 0.17,
							engine_width = 0.18,
							engine1_length = 0.17,
							engine1_width = 0.18,
							boost_length = 0.0,
							boost_width = 0.0,
							engine_min_width_factor = 1.0,
							engine_glow_intensity_min = 0.00002;
							engine_glow_intensity_max = 1.0;
						},
					},
					
				},
				-- Race1 L T4 CraftUniq Большая спираль
				craftUniq =
				{
					engine_flare_size = 0.0,
					engine1_flare_size = 0.0,
					boost_flare_size = 0.0,
					boost1_flare_size = 0.0,
					engine_flare_color		= "247 172 96 0",
					boost_flare_color		= "247 172 96 20",
					engine_sound = "sound/craft/large_engine",
					boost_effect = "particles/ships/ship_engine_y1",
					engine_effect = "particles/ships/ship_engine_y1",
					engine_length = 0.22,
					engine_width = 0.28,
					engine1_length = 0.22,
					engine1_width = 0.28,
					boost_length = 0.22,
					boost_width = 0.28,
					boost1_length = 0.22,
					boost1_width = 0.28,
					engine_min_width_factor = 1.0,
					engine_min_length_factor = 0.25,
					engine_glow_intensity_min = 0.00002;
					engine_glow_intensity_max = 0.5;
				},
				-- Race1 L T5 CraftUniq 1011
				ProjectSniper =
				{
					--eng flare
					engine_flare_offset = -0.12,
					engine_flare_size = 0.09, --0.09
					engine1_flare_size = 0.09,
					engine2_flare_size = 0.09,
					engine3_flare_size = 0.09,
					--boost flare
					boost_flare_offset = -0.08,
					boost1_flare_size = 0.05, --0.05
					boost2_flare_size = 0.05,
					boost7_flare_size = 0.05,
					boost3_flare_size = 0.03, --0.03
					boost4_flare_size = 0.03,
					boost5_flare_size = 0.03,
					boost6_flare_size = 0.03,
					engine_flare_color		= "247 198 148 0", --20
					boost_flare_color		= "247 198 148 0", --06
					boost_loop_sound = "sound/craft/large_boost",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/large_engine",
					boost_effect = "particles/ships/ship_engine_y1",
					engine_effect = "particles/ships/ship_engine_y1",
					--большие
					engine_length = 0.16,
					engine_width = 0.08,
					engine1_length = 0.16,
					engine1_width = 0.08,
					engine2_length = 0.16,
					engine2_width = 0.08,
					engine3_length = 0.16,
					engine3_width = 0.08,
					--средние
					boost_length = 0.11,
					boost_width = 0.055,
					boost1_length = 0.11,
					boost1_width = 0.055,
					boost7_length = 0.11,
					boost7_width = 0.055,
					boost2_length = 0.11,
					boost2_width = 0.055,
					--мелкие
					boost3_length = 0.06,
					boost3_width = 0.03,
					boost4_length = 0.06,
					boost4_width = 0.03,
					boost5_length = 0.06,
					boost5_width = 0.03,
					boost6_length = 0.06,
					boost6_width = 0.03,
					engine_min_width_factor = 1.0,
					engine_min_length_factor = 0.25,
					engine_glow_intensity_min = 0.00002;
					engine_glow_intensity_max = 1.0;
					engine_light_offset = -1.0,
				},
				-- Race1 L t4 premUniq
				Thrasher =
				{
					boost_loop_sound = "sound/boost/large_Race1_L_T5_Thrasher",
					boost_stop_sound = "sound/boost/huge_end",
					engine_sound = "sound/engine/large_T5_Thrasher_loop",
					engine_flare_size = 0.1,
					engine_flare_offset = -0.03,
					boost_flare_size = 0.1,
					boost_flare_offset = -0.03,
					engine_flare_color		= "191 96 143 18",
					boost_flare_color		= "191 96 143 18",
					boost_effect = "particles/ships/ship_engine_p1",
					engine_effect = "particles/ships/ship_engine_p1",
					engine_length = 0.40,
					engine_width = 0.20,
					engine1_length = 0.40,
					engine1_width = 0.20,
					engine2_length = 0.24,
					engine2_width = 0.12,
					engine3_length = 0.24,
					engine3_width = 0.12,
					engine4_length = 0.24,
					engine4_width = 0.12,
					engine5_length = 0.24,
					engine5_width = 0.12,
					boost_length = 0.33,
					boost_width = 0.18,
					boost1_length = 0.33,
					boost1_width = 0.18,
					engine_min_width_factor = 1.0,
					engine_light_color	= "255 128 191 255",
					engine_light_offset = -1.0,
					engine_light_radius = 10,
					trail_color = "185 21 41 100",
				},
			},  
            Huge =
			{
				engine_length = 0.35,
				engine_width = 0.35,
				boost_length = 0.25,
				boost_width = 0.25,
				trail_size = 0.15,
				boost_loop_sound = "sound/boost/huge_start_loop",
				boost_stop_sound = "sound/boost/huge_end",
				engine_sound = "sound/engine/huge_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 1.0,
				engine_glow_shutdown_time_interval = 2.0,
				engine_flame_shutdown_time_interval = 1.0,
				engine_light_radius = 35,
				engine_light_offset = 0.0,
				engine_flare_color		= "239 199 143 20",
				boost_flare_color		= "239 199 143 20",
				t3 =
				{
					engine_flare_size = 0.6,
					boost_flare_size = 0.15, 
					engine_length = 0.4,
					engine_width = 0.4,
					boost_length = 0.15,
					boost_width = 0.15,
					boost_effect = "particles/ships/engine_h_y_4",
					engine_effect = "particles/ships/engine_h_y_4",
					engine_flare_offset = -0.1,
					engine_flare_color		= "239 199 143 30",
					engine_glow_intensity_min = 0.000;
					engine_light_offset = -4.0,
				},
				t4 =
				{
					engine_length = 0.428,
					engine_width = 0.25,
					boost_length = 0.412,
					boost_width = 0.25,
					boost_effect = "particles/ships/engine_h_y_4",
					engine_effect = "particles/ships/engine_h_y_4",
					engine_flare_size = 0.3, 
					boost_flare_size = 0.3, 
					engine_flare_offset = -0.1,
					engine_flare_color		= "239 199 143 25",
					boost_flare_color		= "239 199 143 20",
					engine_glow_intensity_min = 0.000;
				},
				t5 =
				{
					engine_length = 0.4,
					engine1_length = 0.4,
					boost_length = 0.475,
					boost_effect = "particles/ships/engine_h_y_t5_boost1",
					engine_effect = "particles/ships/engine_h_y_t5_boost2",
					engine_flare_size = 0.0, --0.3
					boost_flare_size = 0.0,--0.1
					engine_flare_offset = -0.1,
					engine_flare_color		= "239 199 143 25",
					boost_flare_color		= "239 199 143 40",
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					engine_glow_intensity_min = 0.0;
					engine_light_offset = -4.0,
					ev =
					{
						boost_loop_sound = "sound/boost/huge_Race1_T5_start_loop",
						boost_stop_sound = "sound/boost/huge_end",
						boost_effect = "particles/ships/engine_halloween_boost",
						engine_effect = "particles/ships/engine_halloween_eng",
						engine_length = 0.6,
						engine_width = 1.0,
						boost_length = 0.3,
						boost_width = 1.0,
						boost1_length = 0.3,
						boost1_width = 1.0,
						engine_light_color	= "189 240 144 255",
						engine_flare_size = 0.9,
						boost_flare_size = 0.35,
						boost1_flare_size = 0.35,
						engine_flare_color = "189 240 144 25",
						boost_flare_color = "189 240 144 25",
						engine_flare_offset = -0.5,
						boost_flare_offset = -0.2,
						engine_light_radius = 35,
						trail_color = "30 64 0 100",
						engine_glow_shutdown_time_interval = 2.0,
						engine_flame_shutdown_time_interval = 2.0,
					},
					uniq =
					{
						boost_effect = "particles/ships/ship_engine_r1_h_t5_u_boost",
						engine_effect = "particles/ships/ship_engine_r1_h_t5_u_eng",
						boost_loop_sound = "sound/boost/huge_Race1_T5_start_loop",
						boost_stop_sound = "sound/boost/huge_Race1_T5_uniq_end",
						engine_length = 0.8,
						engine_width = 0.4,
						boost_length = 1.0,
						boost_width = 1.0,
						boost1_length = 1.0,
						boost1_width = 1.0,
						engine_flare_color = "240 180 120 50",
						boost_flare_color = "0 0 0 0",
						engine_flare_size = 0.6,
						boost_flare_size = 0.0,
						engine_flare_offset = -0.225,
						boost_flare_offset = -0.0,
					},
				},
			},
		},
		Race2 =
		{
			engine_sound_left = "sound/engine/left_engine",
			engine_sound_right = "sound/engine/right_engine",
			boost_effect = "particles/ships/ship_engine_r4",
			engine_effect = "particles/ships/ship_engine_r4", 
			trail_color = "100 0 0 100",
			engine_flare_color		= "240 157 144 0",
			boost_flare_color		= "240 157 144 0",
			engine_light_color		= "240 157 144 100",
			engine_glow_intensity_min = 0.0001;
			engine_glow_intensity_max = 1.00;
			Small =
			{
				engine_glow_intensity_max = 1.00;
				trail_size = 0.05,
				-- 1.75 1
				engine_length = 0.1575,
				engine_width = 0.09,
				boost_length = 0.14,
				boost_width = 0.08,
				engine_flare_size = 0.07,
				boost_flare_size = 0.07,
				engine_flare_offset = -0.05,
				boost_flare_offset = -0.05,
				engine_light_radius = 10,
				boost_loop_sound = "sound/boost/small_start_loop",
				boost_stop_sound = "sound/boost/small_end",
				engine_sound = "sound/engine/small_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.75,
				engine_min_width_factor = 0.75,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.45,
				engine_light_radius = 8,
				engine_light_offset = 0.0,
				-- r2 s t5 craft Caltrop
				Craft =
				{
					engine_effect = "particles/ships/r2_s_custom_eng_fx",
					boost_length = 0.0,
					boost_width = 0.0,
					engine_length = 1.0,
					engine_width = 1.0,
					boost_flare_size = 0.0,
					engine_flare_size = 0.0,
					engine_flare_color		= "152 46 30 18",
					boost_loop_sound = "sound/craft/small_boost",
					boost_stop_sound = "sound/craft/small_boost_end",
					engine_sound = "sound/craft/small_engine",
					crit_engine_effect = "particles/ships/r2_s_custom_eng_fx",
					dead_engine_effect = "particles/null",
					engine_min_length_factor = 1.0,
					engine_min_width_factor = 1.0,
					engine_flame_shutdown_time_interval = 0.0,
					engine_glow_intensity_min = 0.0005;
				},
				-- r2 s t3 pirate 
				T3pirate =
				{
					boost_effect = "particles/ships/ship_engine_p4",
					engine_effect = "particles/ships/ship_engine_p4",
					trail_color = "178 0 22 100",
					engine_flare_size = 0.14,
					boost_flare_size = 0.08,
					engine_light_radius = 10,
					engine_length = 0.08,
					engine_width = 0.08,
					boost_length = 0.05,
					boost_width = 0.05,
					engine_glow_intensity_min = 0.0002;
					engine_light_color = "254 161 180 100",
					engine_light_offset = -1.0,
				},
				-- r2 s t4 pirate 
				Tick =
				{
					boost_effect = "particles/ships/ship_engine_p4",
					engine_effect = "particles/ships/ship_engine_p4",
					engine_length = 0.17,
					engine_width = 0.17,
					boost_length = 0.08,
					boost_width = 0.08,
					trail_color = "185 21 41 100",
					engine_flare_size = 0.2,
					boost_flare_size = 0.1,
					engine_light_radius = 15,
					boost_loop_sound = "sound/boost/small_start_loop",
					boost_stop_sound = "sound/boost/small_end",
					engine_sound = "sound/engine/small_loop",
					engine_light_color = "254 161 180 100",
				},
				-- r2 s t5 CraftUniq
				r2 =
				{   
				    pilum =
				   {
					    engine_effect = "particles/ships/r2_s_pilum_eng",
						boost_effect = "particles/ships/r2_s_pilum_boost",
					    boost_length = 1.0,
					    boost_width = 1.0,
					    engine_length = 1.0,
					    engine_width = 1.0,
					    boost_flare_size = 0.0,
					    engine_flare_size = 0.0,
					    engine_flare_color		= "152 46 30 18",
					    boost_loop_sound = "sound/boost/small_t5_bootl_start_loop",
					    boost_stop_sound = "sound/boost/salut_boost_end",
					    engine_sound = "sound/craft/small_engine",
					    engine_flame_acceleration_time_interval = 3.0,
						engine_glow_acceleration_time_interval = 1.0,
						engine_min_length_factor = 0.4,
						engine_min_width_factor = 0.4,
						engine_glow_shutdown_time_interval = 1.0,
						engine_flame_shutdown_time_interval = 0.45,
						engine_light_color	= "240 157 144 100",
						trail_effect = "particles/ships/ship_trail",
						trail_color = "100 0 0 100",
						trail_size = 0.05,
				    },
					t3 =
					{
						zhen =
						{
						boost_effect = "particles/ships/ship_engine_r4",
						engine_effect = "particles/ships/ship_engine_r4",
						engine_length = 0.12,
						engine_width = 0.06,
						boost_length = 0.0,
						boost_width = 0.0,
						engine_flare_size = 0.0,
						boost_flare_size = 0.0,
						engine_flame_acceleration_time_interval = 3.0,
						engine_glow_acceleration_time_interval = 1.0,
						engine_min_length_factor = 0.4,
						engine_min_width_factor = 0.4,
						engine_glow_shutdown_time_interval = 1.0,
						engine_flame_shutdown_time_interval = 0.45,
						engine_light_color	= "240 157 144 100",
						boost_loop_sound = "sound/craft/small_boost",
						boost_stop_sound = "sound/craft/small_boost_end",
						engine_sound = "sound/craft/small_engine",
						},
					},
					t5 =
					{
						prem =
						{
							boost_effect = "particles/ships/ship_engine_r1",
							engine_effect = "particles/ships/ship_engine_r1",
							engine_length = 0.10,
							engine_width = 0.10,
							boost_length = 0.08,
							boost_width = 0.08,
							trail_color = "185 21 41 100",
							engine_flare_size = 0.2,
							boost_flare_size = 0.1,
							engine_light_radius = 15,
							boost_loop_sound = "sound/boost/small_start_loop",
							boost_stop_sound = "sound/boost/small_end",
							engine_sound = "sound/engine/small_loop",
							engine_light_color	= "254 134 134 100",
						},
						cinquedea =
						{
						engine_effect = "particles/ships/cinquedea_eng",
						boost_effect = "particles/ships/cinquedea_boost",
						engine_length = 1,
						boost1_length = 1,
						trail_color = "185 21 41 100",
						engine_flare_color = "239 143 159 28",
						engine_flare_size = 0.08,
						engine_flare_offset = -0.05,
						boost_flare_color = "239 143 159 28",
						boost_flare_size = 0.025,
						boost_flare_offset = -0.06,
						engine_light_radius = 15,
						boost_loop_sound = "sound/boost/small_start_loop",
						boost_stop_sound = "sound/boost/small_end",
						engine_sound = "sound/engine/small_loop",
						engine_light_color = "254 134 134 100",
						engine_light_radius = 9,
						engine_light_offset = -0.5,
						},
					},
				},
				-- Ship_Race2_S_T5_Doctor
				Doctor = 
				{
					boost_effect = "particles/ships/ship_doctor_boost",
					engine_effect = "particles/ships/ship_doctor_eng",
					engine_length = 0.27,
					engine_width = 0.18,
					boost1_length = 0.12,
					boost1_width = 0.08,
					boost_length = 0.16,
					boost_width = 0.08,
					boost2_length = 0.16,
					boost2_width = 0.08,
					boost3_length = 0.12,
					boost3_width = 0.08,
					trail_color = "185 21 41 100",
					engine_flare_color = "239 143 159 28",
					engine_flare_size = 0.08,
					engine_flare_offset = -0.05,
					boost_flare_color = "154 120 240 26",
					boost_flare_size = 0.025,
					boost_flare_offset = -0.06,
					engine_light_radius = 15,
					boost_loop_sound = "sound/boost/small_start_loop",
					boost_stop_sound = "sound/boost/small_end",
					engine_sound = "sound/engine/small_loop",
					engine_light_color = "254 134 134 100",
					engine_light_radius = 9,
					engine_light_offset = -0.5,
				},
				-- Ship_Race2_S_T5_Uniq
				Kusarigama = 
				{

					boost_loop_sound = "sound/craft/small_boost",
					boost_stop_sound = "sound/craft/small_boost_end",
					engine_sound = "sound/craft/small_engine",
					boost_effect = "particles/ships/ship_engine_r6",
					engine_effect = "particles/ships/ship_engine_r2_s_t5_u_eng",
					engine_length = 0.2666,
					engine_width = 0.1,
					boost_length = 0.186,
					boost_width = 0.07,
					boost1_length = 0.186,
					boost1_width = 0.07,
					engine_flare_color = "255 100 76 25",
					engine_flare_size = 0.12,
					engine_flare_offset = -0.15,
					boost_flare_color = "255 100 76 23",
					boost_flare_size = 0.03,
					boost_flare_offset = -0.03,
					engine_light_radius = 10,
					engine_light_offset = -2.0,
					engine_min_length_factor = 0.5,
					engine_min_width_factor = 1.0,
				},
				
			},
			Medium =
			{
				engine_glow_intensity_max = 0.50;
				trail_size = 0.07,
				engine_length = 0.22,
				engine_width = 0.11,
				boost_length = 0.16,
				boost_width = 0.08,
				engine_flare_size = 0.07,
				boost_flare_size = 0.07,
				engine_flare_offset = -0.05,
				boost_flare_offset = -0.05,
				engine_light_radius = 15,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/medium_start_loop",
				boost_stop_sound = "sound/boost/medium_end",
				engine_sound = "sound/engine/medium_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.75,
				engine_min_width_factor = 1.0,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.45,
				engine_glow_intensity_min = 0.00005;
				-- r2 m t5 Craft
				Craft =
				{	
					boost_effect = "particles/ships/craft_r2_m_boost",
					engine_effect = "particles/ships/craft_r2_m_engine",
					engine_flare_size = 0.05,
					boost_flare_size = 0.05,
					engine_length = 0.24,
					engine_width = 0.16,
					boost_length = 0.20,
					boost_width = 0.10,
					engine_sound = "sound/craft/medium_engine",
					boost_loop_sound = "sound/craft/medium_boost",
					boost_stop_sound = "sound/craft/medium_boost_end",
					engine_glow_intensity_min = 0.000;
					engine_light_offset = -1.5,
				},
				-- r2 m t4 pirate
				Mosquito =
				{
					boost_effect = "particles/ships/ship_engine_p4",
					engine_effect = "particles/ships/ship_engine_p4",
					engine_length = 0.22,
					engine_width = 0.22,
					boost_length = 0.14,
					boost_width = 0.14,
					trail_color = "185 21 41 100",
					engine_flare_size = 0.25,
					boost_flare_size = 0.2,
					engine_flare_color		= "247 96 96 15",
					boost_flare_color		= "247 96 96 15",
					boost_loop_sound = "sound/boost/medium_start_loop",
					boost_stop_sound = "sound/boost/medium_end",
					engine_sound = "sound/engine/medium_loop",
					engine_glow_intensity_min = 0.000;
					engine_light_color = "254 161 180 100",
				},
				--Race2 M T2 Steam
				Razer =
				{
					boost_effect = "particles/ships/ship_engine_r4",
					engine_effect = "particles/ships/ship_engine_r4",
					engine_length = 0.10,
					engine_width = 0.09,
					boost_length = 0.12,
					boost_width = 0.12,
					boost1_length = 0.18,
					boost1_width = 0.12,
					engine_flare_offset = -0.05,
					engine_flare_size = 0.1,
					boost_flare_size = 0.1,
				},
				--Race2 M T4 PremUniq Замороженный
				PremUniq =
				{
					boost_effect = "particles/ships/engine_m_t4_pu_boost_ny",
					engine_effect = "particles/ships/engine_m_t4_pu_ny",
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					engine_length = 0.24,
					engine_width = 0.12,
					boost_length = 0.12,
					boost_width = 0.06,
					engine_glow_acceleration_time_interval = 1.0,
					engine_light_color		= "143 218 255 100",
					engine_flare_color		= "143 218 255 0",
					boost_flare_color		= "143 218 255 0",
					engine_glow_intensity_min = 0.0001;
					engine_min_length_factor = 0.25,
					engine_light_offset = -2.0,
				},
				Singularity =
				{
					engine_glow_intensity_min = 0.0;
					engine_glow_intensity_max = 0.9;
					engine_flame_acceleration_time_interval = 3.0,
					engine_glow_acceleration_time_interval = 1.0,
					engine_min_length_factor = 0.5,
					engine_min_width_factor = 1.0,
					engine_glow_shutdown_time_interval = 1.0,
					engine_flame_shutdown_time_interval = 0.45,
					engine_effect = "particles/ships/ship_engine_singularity_eng",
					boost_effect = "particles/ships/ship_engine_singularity_boost",
					engine_length = 0.18,
					engine1_length = 0.18,
					--угловые
					boost1_length = 0.1,
					boost1_width = 0.05,
					boost5_length = 0.1,
					boost5_width = 0.05,
					--остальные
					boost_length = 0.12,
					boost_width = 0.05,
					boost2_length = 0.12,
					boost2_width = 0.05,
					boost3_length = 0.12,
					boost3_width = 0.05,
					boost4_length = 0.12,
					boost4_width = 0.05,
					boost_loop_sound = "sound/craft/medium_boost",
					boost_stop_sound = "sound/craft/medium_boost_end",
					engine_sound = "sound/craft/medium_engine",
					engine_light_offset = -1.0,
				},
				CraftSpec =
				{
					engine_glow_intensity_min = 0.0;
					engine_glow_intensity_max = 0.9;
					engine_flame_acceleration_time_interval = 3.0,
					engine_glow_acceleration_time_interval = 1.0,
					engine_min_length_factor = 0.5,
					engine_min_width_factor = 1.0,
					engine_glow_shutdown_time_interval = 1.0,
					engine_flame_shutdown_time_interval = 0.45,
					engine_effect = "particles/ships/ship_engine_r4",
					boost_effect = "particles/ships/ship_engine_r4",
					engine_length = 0.16,
					engine_width = 0.08,
					engine1_length = 0.22,
					engine1_width = 0.11,
					engine2_length = 0.22,
					engine2_width = 0.11,
					engine3_length = 0.16,
					engine3_width = 0.08,
					engine4_length = 0.08,
					engine4_width = 0.04,
					engine5_length = 0.08,
					engine5_width = 0.04,
					--
					boost1_length = 0.08,
					boost1_width = 0.04,
					boost5_length = 0.08,
					boost5_width = 0.04,
					boost_length = 0.08,
					boost_width = 0.04,
					boost2_length = 0.08,
					boost2_width = 0.04,
					boost3_length = 0.08,
					boost3_width = 0.04,
					boost4_length = 0.08,
					boost4_width = 0.04,
					boost_loop_sound = "sound/craft/medium_boost",
					boost_stop_sound = "sound/craft/medium_boost_end",
					engine_sound = "sound/craft/medium_engine",
				},
				ZM =
				{
					trail_effect = nil,
					rail_size = 0,
					trail_color = "0 0 0 0",
					
					Aliens =
					{
						engine_flare_color		= "45 182 129 16",
						engine_light_color		= "128 255 191 255",
						boost_flare_color		= "45 182 129 16",

						boost_effect = "particles/ships/ship_engine_g4",
						engine_effect = "particles/ships/ship_engine_g4",
						engine_length = 0.15,
						engine_width = 0.1,
						boost_length = 0.11,
						boost_width = 0.075,

						engine_flare_size = 0.2,
						engine_flare_offset = -0.2,
						boost_flare_offset = -0.2,
						boost_flare_size = 0.2,
						engine_light_radius = 15,
						
						engine_sound = "sound/engine/alien/small_loop",
	
						boost_loop_sound = "sound/boost/alien/small_start_loop",
						boost_stop_sound = "sound/boost/alien/small_end",
						engine_sound_right = "sound/engine/el_right_engine",
						engine_sound_left = "sound/engine/el_left_engine",	
					},
				},
				CraftUniq = 
				{
					boost_effect 			= "particles/ships/ship_engine_r4",
					engine_effect 			= "particles/ships/ship_engine_r4", 
					engine_length = 0.42,
					engine_width = 0.14,
					boost_length = 0.36,
					boost_width = 0.12,
					boost1_length = 0.36,
					boost1_width = 0.12,
					boost2_length = 0.36,
					boost2_width = 0.12,
					engine_flare_size = 0.21,
					boost_flare_size = 0.17,
					engine_flare_offset = -0.12,
					boost_flare_offset = -0.12,
					engine_flare_color		= "240 136 120 24",
					boost_flare_color		= "240 136 120 20",
					engine_light_radius = 15,
					engine_glow_intensity_min = 0.0;
					engine_glow_intensity_max = 1.00;
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 0.75,
					engine_sound = "sound/craft/small_engine",
					boost_loop_sound = "sound/craft/m_t5_cu_start_loop",
					boost_stop_sound = "sound/boost/alien/small_end",
				},
				--Race5_M_T5_Amber
				Amber =
				{
					engine_flare_offset = -0.83,
					boost_flare_offset = -0.83,
					engine_glow_intensity_min = 0.0;
					engine_glow_intensity_max = 0.6;
					engine_flame_acceleration_time_interval = 3.0,
					engine_glow_acceleration_time_interval = 1.0,
					engine_min_length_factor = 0.5,
					engine_min_width_factor = 1.0,
					engine_glow_shutdown_time_interval = 1.0,
					engine_flame_shutdown_time_interval = 0.45,
					engine_effect = "particles/ships/engine_amber",
					boost_effect = "particles/ships/boost_amber",
					
					engine_flare_color		= "255 40 10 10",
					boost_flare_color		= "235 140 10 10",
					engine_light_color	= "255 40 10 100",
					
				    engine_flare_size = 0.25,
					boost_flare_size = 0.05,
					engine_length = 0.25,
					engine_width = 0.16,
					boost_length = 0.15,
					boost_width = 0.05,
					engine_sound = "sound/craft/medium_engine",
					boost_loop_sound = "sound/craft/medium_boost",
					boost_stop_sound = "sound/craft/medium_boost_end",
					engine_light_offset = -1,
				},
				-- Ship_Race2_M_T5_Baphomet
				Baphomet = 
				{
					engine_glow_intensity_min = 0.0;
					engine_glow_intensity_max = 0.6;
					engine_flame_acceleration_time_interval = 3.0,
					engine_glow_acceleration_time_interval = 1.0,
					engine_min_length_factor = 0.5,
					engine_min_width_factor = 1.0,
					engine_glow_shutdown_time_interval = 1.0,
					engine_flame_shutdown_time_interval = 0.45,
					engine_effect = "particles/ships/r2_m_t5_baphomet_eng",
					boost_effect = "particles/ships/r2_m_t5_baphomet_boost",
				    engine_flare_size = 0.25,
					boost_flare_size = 0.05,
					engine_length = 0.25,
					engine_width = 0.16,
					boost_length = 0.15,
					boost_width = 0.05,
					engine_sound = "sound/craft/medium_engine",
					boost_loop_sound = "sound/craft/medium_boost",
					boost_stop_sound = "sound/craft/medium_boost_end",
					engine_light_offset = -1,
				},
			},
			Large =
			{
				engine_glow_intensity_max = 0.9;
				engine_length = 0.48,
				engine_width = 0.32,
				boost_length = 0.36,
				boost_width = 0.24,
				trail_size = 0.1,
				engine_flare_size = 0.45,
				boost_flare_size = 0.3,
				engine_light_radius = 25,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/large_start_loop",
				boost_stop_sound = "sound/boost/large_end",
				engine_sound = "sound/engine/large_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 0.5,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.6,
				engine_glow_intensity_min = 0.0005;
				-- r2 l t5 Craft
				Craft =
				{	
					boost_effect = "particles/ships/ship_engine_r4",
					engine_effect = "particles/ships/ship_engine_r4",
					boost_loop_sound = "sound/craft/large_boost",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/large_engine",
					engine_length = 0.4,
					engine_width = 0.2,
					engine1_length = 0.4,
					engine1_width = 0.2,
					boost_length = 0.28,
					boost_width = 0.16,
					engine_glow_intensity_min = 0.002;
					engine_flame_shutdown_time_interval = 1.0,
				},
				-- r2 l t5 Steam
				Pandorus =
				{	
					engine_glow_intensity_min = 0.0001;
					boost_effect = "particles/ships/ship_engine_r4",
					engine_effect = "particles/ships/ship_engine_r4",
					-- с верху вниз
					engine4_length = 0.26,
					engine4_width = 0.195,
					engine_length = 0.36,
					engine_width = 0.27,
					engine3_length = 0.26,
					engine3_width = 0.195,
					engine1_length = 0.22,
					engine1_width = 0.165,
					engine2_length = 0.18,
					engine2_width = 0.135,
					boost_length = 0.275,
					boost_width = 0.2,
				},
				-- r2 l t4 pirate
				Numbfish =
				{
					boost_effect = "particles/ships/ship_engine_p4",
					engine_effect = "particles/ships/ship_engine_p4",
					engine_length = 0.4,
					engine_width = 0.4,
					boost_length = 0.3,
					boost_width = 0.3,
					boost1_length = 0.2,
					boost1_width = 0.2,
					trail_color = "185 21 41 100",
					engine_flare_size = 0.55,
					boost_flare_size = 0.35,
					engine_light_radius = 20,
					engine_flare_color		= "247 96 96 20",
					boost_flare_color		= "247 96 96 20",
					boost_loop_sound = "sound/boost/medium_start_loop",
					boost_stop_sound = "sound/boost/medium_end",
					engine_sound = "sound/engine/medium_loop",
					engine_light_color = "254 160 180 100",
					engine_glow_intensity_min = 0.00005;
					engine_light_offset = -1.0,
				},
				--Ship_Race2_L_T5_Protozan
				Protazan =
				{
					engine_effect = "particles/ships/ship_engine_protazan_eng",
					boost_effect = "particles/ships/ship_engine_protazan_boost",
					engine_length = 0.9,
					engine_width = 1.0,
					engine1_length = 0.9,
					engine1_width = 1.0,
					boost_length = 0.9,
					boost_width = 1.0,
					boost1_length = 0.9,
					boost1_width = 1.0,
					engine_flare_color = "240 136 120 25",
					engine_flare_offset = -0.1,
					boost_flare_offset = -0.05,
					boost_flare_color = "240 136 120 25",
					engine_flare_size = 0.3,
					boost_flare_size = 0.1,
					boost_loop_sound = "sound/boost/large_T5_Sniper_start_loop",
					boost_stop_sound = "sound/boost/large_t5_craft_end",
					engine_sound = "sound/engine/large_t5_craft_loop",
					engine_light_offset = -3.0,
					engine_light_radius = 15,
				},
				--Ship_Race2_L_T5_Dino
				Confessor =
				{
					engine_effect = "particles/ships/ship_dino_eng",
					boost_effect = "particles/ships/ship_dino_boost",
					engine_length = 0.4,
					engine_width = 1.0,
					boost_length = 0.38,
					boost_width = 1.0,
					engine_flare_color = "240 136 120 0",
					engine_flare_offset = -0.1,
					engine_flare_size = 0.3,
					boost_flare_offset = -0.15,
					boost_flare_color = "240 136 120 0",
					boost_flare_size = 0.3,
					engine_light_offset = -3.0,
					engine_light_radius = 15,
					engine_min_length_factor = 0.75,
				},
				-- r2 l t5 franc
				r2 =
				{
					t5 =
					{
						franc =
						{	
							boost_effect = "particles/ships/ship_engine_r4",
							engine_effect = "particles/ships/ship_engine_r4",
							boost_loop_sound = "sound/craft/large_boost",
							boost_stop_sound = "sound/craft/large_boost_end",
							engine_sound = "sound/craft/large_engine",
							--
							engine_length = 0.26,
							engine_width = 0.13,
							engine1_length = 0.26,
							engine1_width = 0.13,
							--
							boost_length = 0.24,
							boost_width = 0.12,
							boost1_length = 0.24,
							boost1_width = 0.12,
							--
							boost2_length = 0.22,
							boost2_width = 0.11,
							boost3_length = 0.22,
							boost3_width = 0.11,
							--
							engine_glow_intensity_min = 0.002,
							engine_glow_intensity_max = 1.0,
							engine_light_offset = -3.0,
						},
						},
					},
					-- Ship_Race2_L_T5_CraftUniq
					CraftUniq =
					{
						boost_effect = "particles/ships/ship_engine_r2_l_t5_cu_boost",
						engine_effect = "particles/ships/ship_engine_r2_l_t5_cu_eng",
						boost_loop_sound = "sound/boost/large_t5_craft_start_loop",
						boost_stop_sound = "sound/craft/large_boost_end",
						engine_sound = "sound/engine/large_t5_craft_loop",
						engine_length = 0.45,
						engine_width = 0.0,
						engine1_length = 0.45,
						engine1_width = 0.0,
						boost_length = 0.32,
						boost_width = 0.0,
						boost1_length = 0.32,
						boost1_width = 0.0,
						engine_glow_intensity_min = 0.0;
						engine_glow_intensity_max = 1.0,
						engine_glow_shutdown_time_interval = 0.75,
						engine_flame_shutdown_time_interval = 0.45,
					},
					Naglfar =
					{	
						engine_effect = "particles/ships/ship_engine_naglfar_eng",
						boost_effect = "particles/ships/ship_engine_naglfar_boost",
						boost_loop_sound = "sound/boost/large_T5_Naglfar_start_loop",
						boost_stop_sound = "sound/boost/large_t5_craft_end",
						engine_sound = "sound/engine/large_t5_craft_loop",
						engine_length = 0.9,
						engine_width = 1.0,
						boost_length = 0.7,
						boost_width = 0.7,
						boost1_length = 0.7,
						boost1_width = 0.7,
						engine_flare_color = "208 240 120 20",
						engine_flare_offset = -0.15,
						boost_flare_color = "208 240 120 16",
						boost_flare_offset = -0.175,
						engine_flare_size = 0.45,
						boost_flare_size = 0.225,
						trail_color = "92 100 0 100",
						engine_light_radius = 20,
						engine_light_offset = -2.0,
						engine_light_color = "225 240 144 100",
					},
					--Ship_Race2_L_T5_carolingian
					carolingian =
					{	
						engine_effect = "particles/ships/drakkar_eng",
						boost_effect = "particles/ships/drakkar_boost",
						boost_loop_sound = "sound/boost/large_T5_Naglfar_start_loop",
						boost_stop_sound = "sound/boost/large_t5_craft_end",
						engine_sound = "sound/engine/large_t5_craft_loop",
						engine_length = 1.1,
						engine_width = 1.0,
						boost_length = 0.7,
						boost_width = 0.7,
						boost1_length = 0.7,
						boost1_width = 0.7,
						engine_flare_color = "208 240 120 20",
						engine_flare_offset = -0.15,
						boost_flare_color = "208 240 120 16",
						boost_flare_offset = -0.175,
						engine_flare_size = 0.0,
						boost_flare_size = 0.0,
						engine_light_radius = 20,
						engine_light_offset = -2.0,
						engine_light_color = "240 140 144 100",
						engine_flame_acceleration_time_interval = 3.0,
						engine_glow_acceleration_time_interval = 1.0,
						engine_min_length_factor = 0.4,
						engine_min_width_factor = 0.4,
						engine_glow_shutdown_time_interval = 0.5,
						engine_flame_shutdown_time_interval = 0.45,
						trail_color = "100 0 0 100",
					},
			},
            Huge =
			{
				engine_length = 0.35,
				engine_width = 0.35,
				boost_length = 0.25,
				boost_width = 0.25,
				trail_size = 0.15,
				engine_flare_color		= "239 151 143 25",
				boost_flare_color		= "239 151 143 25",
				engine_light_color		= "255 145 128 100",
				boost_loop_sound = "sound/boost/huge_start_loop",
				boost_stop_sound = "sound/boost/huge_end",
				engine_sound = "sound/engine/huge_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 1.0,
				engine_glow_shutdown_time_interval = 1.5,
				engine_flame_shutdown_time_interval = 1.0,
				engine_light_radius = 15,
				engine_light_offset = 0.0,
				t3 =
				{
					engine_flare_offset = -0.1,
					engine_length = 0.3,
					engine_width = 0.3,
					engine1_length = 0.3,
					engine1_width = 0.3,
					boost_length = 0.2,
					boost_width = 0.2,
					engine_flare_size = 0.25,
					boost_flare_size = 0.15,
					boost_effect = "particles/ships/r2_h_custom_eng_fx",
					engine_effect = "particles/ships/engine_h_r_t3_half",
					engine_light_radius = 40,
					engine_glow_intensity_min = 0.0;
					engine_light_offset = -5.0,
				},
				t4 =
				{
					engine_length = 0.4,
					engine1_length = 0.4,
					boost_length = 0.32,
					engine_flare_size = 0.3,
					boost_flare_size = 0.15,
					boost_effect = "particles/ships/r2_h_custom_eng_fx2",
					engine_effect = "particles/ships/engine_h_r",
					engine_light_radius = 40,
					engine_glow_intensity_min = 0.000;
					engine_flare_offset = -0.1,
					engine_flare_color		= "239 151 143 0",
					engine_light_offset = -7.0,
				},
				t5 =
				{
					engine_length = 0.33,
					engine_width = 0.2,
					engine1_length = 0.33,
					engine1_width = 0.2,
					boost_length = 0.18,
					boost_width = 0.12,
					engine_flare_size = 0.15,
					boost_flare_size = 0.30,
					engine_flare_color		= "239 151 143 20",
					boost_flare_color		= "239 151 143 15",
					boost_effect = "particles/ships/r2_h_custom_eng_fx3",
					engine_effect = "particles/ships/engine_h_r_t4_half",
					engine_light_radius = 40,
					engine_flare_offset = -0.1,
					engine_light_offset = -3.0,
				},
				t6 =
				{
					engine_length = 0.45,
					engine_width = 1.0,
					engine1_length = 0.45,
					engine1_width = 1.0,
					engine2_length = 0.45,
					engine2_width = 1.0,
					engine3_length = 0.45,
					engine3_width = 1.0,
					boost_length = 0.25,
					boost_width = 1.0,
					boost1_length = 0.25,
					boost1_width = 1.0,
					boost2_length = 0.25,
					boost2_width = 1.0,
					boost3_length = 0.25,
					boost3_width = 1.0,
					engine_flare_size = 0.3,
					boost_flare_size = 0.25,
					engine_flare_color = "239 171 132 25", --239 151 143 25
					boost_flare_color = "239 171 132 40", --239 179 143 25
					boost_effect = "particles/ships/r2_h_relic_boost_fx",
					engine_effect = "particles/ships/r2_h_relic_eng_fx",
					engine_light_radius = 40,
					engine_light_offset = -3.0,
					engine_flare_offset = -0.1,
					boost_flare_offset = -0.05,
					engine_min_length_factor = 0.0,
					engine_min_width_factor = 1.0,
				},
			},
		},
		Race3 =
		{
			engine_sound_left = "sound/engine/left_engine",
			engine_sound_right = "sound/engine/right_engine",
			boost_effect = "particles/ships/ship_engine_b1",
			engine_effect = "particles/ships/ship_engine_b1",
			trail_color = "5 17 197 100",
			engine_flare_color		= "153 204 255 17",
			engine_light_color		= "161 197 247 100",
			boost_flare_color		= "153 204 255 17",
			-- S
			Small =
			{
				trail_size = 0.05,
				engine_light_radius = 10,
				boost_loop_sound = "sound/boost/small_start_loop",
				boost_stop_sound = "sound/boost/small_end",
				engine_sound = "sound/engine/small_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 0.5,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.45,
				engine_glow_intensity_min = 0.0001;
				engine_glow_intensity_max = 1.0;
				trail_size = 0.05,
				boost_effect = "particles/ships/ship_engine_b_s_boost",
				engine_effect = "particles/ships/ship_engine_b_s",
				engine_length = 0.7,
				engine1_length = 0.7,
				boost_length = 0.6,
				boost_width = 0.6,
				boost1_length = 0.6,
				boost1_width = 0.6,
				engine_flare_color = "153 204 255 19",
				boost_flare_color = "153 204 255 19",
				engine_flare_offset = -0.05,
				boost_flare_offset = -0.02,
				engine_flare_size = 0.08,
				boost_flare_size = 0.08,
				engine_light_radius = 8,
				engine_light_offset = 0.0,
				-- Race3 S T5 Craft
				Craft =
				{	
					boost_loop_sound = "sound/craft/small_boost",
					boost_stop_sound = "sound/craft/small_boost_end",
					engine_sound = "sound/craft/small_engine",		
					engine_flare_size = 0.0875,
					boost_flare_size = 0.05,
					engine_flare_color		= "161 197 247 32",
					boost_flare_color		= "161 197 247 32",
					boost_effect = "particles/ships/ship_engine_b2",
					engine_effect = "particles/ships/ship_engine_b2",
					engine_length = 0.116,
					engine_width = 0.10,
					boost_length = 0.07,
					boost_width = 0.06,
					engine_min_width_factor = 1.0,
					engine_min_length_factor = 0.0,
					engine_glow_intensity_min = 0.00005;
					engine_glow_intensity_max = 1.0;					
				},
				-- Race3 S T4 PremUniq
				PremUniq =
				{
					engine_flare_color		= "161 197 247 20",
					boost_flare_color		= "161 197 247 20",
					engine_flare_size = 0.06,
					boost_flare_size = 0.05,
					boost_flare_offset = -0.01,
					boost_effect = "particles/ships/engine_s_t4_pu_boost",
					engine_effect = "particles/ships/ship_engine_b2",
					engine_length = 0.10,
					engine_width = 0.08,
					boost_length = 1.3,
					engine_min_width_factor = 1.0,
					engine_min_length_factor = 0.0,
					engine_glow_shutdown_time_interval = 1.0,
					engine_flame_shutdown_time_interval = 0.5,
					engine_glow_intensity_min = 0.0;
					engine_glow_intensity_max = 0.7;
				},
				--  Race3 S T5 CraftUniq
				wolverine = 
				{
					engine_flare_color		= "153 255 255 0",
					boost_flare_color		= "153 255 255 0",
					engine_flare_offset = -0.06,
					engine_flare_size = 0.05, 
					boost_flare_size = 0.0,
					boost_length = 1.0,
					engine_min_length_factor = 0.375,
					engine_min_width_factor = 0.5,
					engine_glow_intensity_min = 0.0;
					engine_glow_intensity_max = 1.0;
					boost_effect = "particles/ships/ship_s_wolv_boost",
					engine_effect = "particles/ships/ship_s_wolv_eng",
					engine_width = 0.04,
					engine_length = 0.12,
					boost_loop_sound = "sound/craft/small_boost",
					boost_stop_sound = "sound/craft/small_boost_end",
					engine_sound = "sound/craft/small_engine",
				},
				-- Ship_Race3_S_T5_CraftSpec
				CraftSpT5 = 
				{
					boost_effect = "particles/ships/ship_engine_b_s_boost",
					engine_effect = "particles/ships/ship_engine_b_s_boost",
					engine_length = 0.56,
					engine_width = 0.5,
					engine1_length = 0.56,
					engine1_width = 0.5,
					engine2_length = 0.62,
					engine2_width = 0.75,
					engine3_length = 0.62,
					engine3_width = 0.75,
					engine4_length = 0.62,
					engine4_width = 0.75,
					engine5_length = 0.62,
					engine5_width = 0.75,
					boost_length = 0.5,
					boost_width = 0.5,
					boost1_length = 0.5,
					boost1_width = 0.5,
					boost2_length = 0.5,
					boost2_width = 0.5,
					boost3_length = 0.5,
					boost3_width = 0.5,
					engine_flare_offset = -0.05,
					boost_flare_offset = -0.025,
					engine_flare_color	= "153 204 255 16",
					engine_light_color	= "161 197 247 100",
					boost_flare_color	= "153 204 255 18",
					engine_flare_size = 0.1, 
					boost_flare_size = 0.1,
					engine_glow_intensity_min = 0.001;
					engine_glow_intensity_max = 1.0;
					engine_glow_acceleration_time_interval = 0.5,
					engine_glow_shutdown_time_interval = 0.5,
					boost_loop_sound = "sound/boost/small_t5_craft_start_loop",
					boost_stop_sound = "sound/boost/small_t5_craft_end",
				},
			},
			Medium =
			{
				trail_size = 0.07,
				engine_light_radius = 15,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/medium_start_loop",
				boost_stop_sound = "sound/boost/medium_end",
				engine_sound = "sound/engine/medium_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 0.5,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.5,
				engine_glow_intensity_min = 0.0001;
				engine_glow_intensity_max = 0.8;
				boost_effect = "particles/ships/ship_engine_b_m_boost",
				engine_effect = "particles/ships/ship_engine_b_m",
				engine_length = 0.45,
				engine1_length = 0.45,
				boost_length = 0.45,
				boost1_length = 0.45,
				engine_flare_size = 0.22,
				boost_flare_size = 0.11,
				boost_flare_offset = 0.13,
				engine_flare_offset = 0.1,
				engine_flare_color = "153 204 255 15", --17
				boost_flare_color = "153 204 255 15",
				--
				Craft =
				{
					boost_length = 0.12,
					boost_width = 0.08,
					engine_length = 0.32,
					engine_width = 0.32,
					engine_flare_size = 0.175,
					boost_flare_size = 0.1,
					engine_light_radius = 15,
					engine_sound = "sound/craft/medium_engine",
					boost_loop_sound = "sound/craft/medium_boost",
					boost_stop_sound = "sound/craft/medium_boost_end",
					engine_light_color		= "96 153 247 48",
					engine_flare_color = "153 192 247 25",
					boost_flare_color = "153 192 247 25",
					engine_glow_shutdown_time_interval = 1.0,
					engine_flame_shutdown_time_interval = 1.0,
					boost_effect = "particles/ships/ship_engine_b1",
					engine_effect = "particles/ships/ship_engine_b1",
				},
				T4 =
				{
					PU =
					{
						-- r3 m t4 PU Archer
						engine_glow_intensity_min = 0.00005;
						engine_glow_intensity_max = 0.8;
						boost_effect = "particles/ships/engine_m_t4_pu_2_boost",
						engine_effect = "particles/ships/engine_m_t4_pu_2",
						engine_length = 0.34,
						boost_length = 0.22,
						engine_flare_size = 0.20, 
						boost_flare_size = 0.20, 
						engine_flare_offset = -0.15,
						boost_flare_offset = -0.1,
						engine_flare_color		= "153 204 255 0",
						boost_flare_color		= "153 204 255 0",
						engine_sound = "sound/craft/medium_engine",
						boost_loop_sound = "sound/craft/medium_boost",
						boost_stop_sound = "sound/craft/medium_boost_end",
					},
					wolfhound = 
					{
						engine_flame_acceleration_time_interval = 3.0,
						engine_glow_acceleration_time_interval = 0.5,
						engine_min_length_factor = 0.5,
						engine_min_width_factor = 1.0,
						engine_glow_shutdown_time_interval = 1.0,
						engine_flame_shutdown_time_interval = 0.5,
						engine_glow_intensity_min = 0.00005;
						engine_glow_intensity_max = 1.0;
						boost_effect = "particles/ships/ship_engine_b4",
						engine_effect = "particles/ships/ship_engine_b4",
						engine_length = 0.12,
						engine_width = 0.14,
						engine1_length = 0.12,
						engine1_width = 0.14,
						boost_length = 0.103,
						boost_width = 0.12,
						boost1_length = 0.103,
						boost1_width = 0.12,
						engine_flare_offset = -0.12,
						boost_flare_offset = -0.12,
						engine_flare_size = 0.1,
						boost_flare_size = 0.1,
						engine_flare_color = "153 204 255 15",
						boost_flare_color = "153 204 255 15",
						engine_sound    	= "sound/craft/medium_engine",
						boost_loop_sound	= "sound/craft/medium_boost",
					},
				},
				T3 =
				{
					-- Bear
					Steam =
					{
					},
				},
				T5 =
				{
					-- Ship_Race3_M_T5_CraftUniq
					CraftUniq =
					{
						engine_glow_acceleration_time_interval = 1.0,
						engine_min_length_factor = 0.25,
						engine_min_width_factor = 1.0,
						engine_glow_shutdown_time_interval = 1.0,
						engine_flame_shutdown_time_interval = 0.5,
						engine_glow_intensity_min = 0.0;
						engine_glow_intensity_max = 1.0;
						boost_effect = "particles/ships/ship_engine_b_uniq_boost",
						engine_effect = "particles/ships/ship_engine_b_uniq",
						engine_length = 0.5,
						engine_width = 1.0,
						boost_length = 0.5,
						boost_width = 1.0,
						boost1_length = 0.5,
						boost1_width = 1.0,
						engine_flare_color = "153 229 255 20",
						engine_flare_size = 0.16,
						engine_flare_offset = -0.05,
						boost_flare_color = "153 229 255 14",
						boost_flare_size = 0.08,
						boost_flare_offset = 0.0,
						engine_sound    	= "sound/craft/medium_engine",
						boost_loop_sound	= "sound/boost/el_medium_start_loop",
						boost_stop_sound 	= "sound/boost/el_medium_end",
					},
				},
				-- Ship_Race3_M_T5_Uniq
				Irbis =
				{
					engine_glow_acceleration_time_interval = 1.0,
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					engine_glow_shutdown_time_interval = 1.0,
					engine_flame_shutdown_time_interval = 0.5,
					engine_glow_intensity_min = 0.0;
					engine_glow_intensity_max = 1.0;
					boost_effect = "particles/ships/r3_m_t5_uniq_boost",
					engine_effect = "particles/ships/r3_m_t5_uniq_eng",
					engine_length = 0.55,
					engine_width = 1.0,
					engine1_length = 0.55,
					engine1_width = 1.0,
					boost_length = 0.6,
					boost_width = 1.0,
					boost1_length = 0.6,
					boost1_width = 1.0,
					engine_flare_color		= "153 155 255 17",
					engine_flare_size = 0.32,
					engine_flare_offset = -0.1,
					boost_flare_color		= "153 155 255 17",
					boost_flare_size = 0.20,
					boost_flare_offset = -0.05,
					engine_sound    	= "sound/craft/medium_engine",
					boost_loop_sound	= "sound/boost/el_medium_start_loop",
					boost_stop_sound 	= "sound/boost/el_medium_end",
				},
				-- Ship_Race3_M_T5_manul
					manul =
					{
						trail_effect = "particles/ships/ship_trail_manul",
						trail_size = 0.07,
						engine_glow_acceleration_time_interval = 1.0,
						engine_min_length_factor = 0.25,
						engine_min_width_factor = 1.0,
						engine_glow_shutdown_time_interval = 1.0,
						engine_flame_shutdown_time_interval = 0.5,
						engine_glow_intensity_min = 0.0;
						engine_glow_intensity_max = 10.0;
						boost_effect = "particles/ships/race3_m_t5_boost",
						engine_effect = "particles/ships/race3_m_t5_eng",
						engine_length = 0.5,
						engine_width = 1.0,
						engine_flare_color = "153 229 255 20",
						engine_flare_size = 0.16,
						engine_flare_offset = -0.05,
						boost_flare_color = "153 229 255 14",
						boost_flare_size = 0.08,
						boost_flare_offset = 0.0,
						engine_sound    	= "sound/craft/medium_engine",
						boost_loop_sound	= "sound/boost/el_medium_start_loop",
						boost_stop_sound 	= "sound/boost/el_medium_end",
					},
				-- Ship_Race3_M_T5_Persei 
					persei =
					{
						trail_size = 0.07,
						engine_glow_acceleration_time_interval = 1.0,
						engine_min_length_factor = 0.25,
						engine_min_width_factor = 1.0,
						engine_glow_shutdown_time_interval = 1.0,
						engine_flame_shutdown_time_interval = 0.5,
						engine_glow_intensity_min = 0.0;
						engine_glow_intensity_max = 10.0;
						boost_effect = "particles/ships/persei8_boost",
						engine_effect = "particles/ships/persei8_eng",
						engine_length = 1,
						engine_width = 1.0,
						engine_flare_color = "30 144 255 20",
						engine_flare_size = 0.1,
						engine_flare_offset = 0.08,
						boost_flare_color = "30 144 255 14",
						boost_flare_size = 0.19,
						boost_flare_offset = -0.1,
						engine_sound    	= "sound/engine/persei_loop",
						boost_loop_sound	= "sound/boost/persei_start_loop",
						boost_stop_sound 	= "sound/boost/el_medium_end",
						trail_color = "30 144 255 255",
					},
			},
			Large =
			{
				trail_size = 0.10,
				engine_length = 0.46,
				engine_width = 0.46,
				engine1_length = 0.225,
				engine1_width = 0.225,
				engine2_length = 0.225,
				engine2_width = 0.225,
				engine_flare_size = 0.18,
				boost_flare_size = 0.12,
				engine_light_radius = 28,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/large_start_loop",
				boost_stop_sound = "sound/boost/large_end",
				engine_sound = "sound/engine/large_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 0.5,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.75,
				engine_glow_intensity_min = 0.0001,
				engine_glow_intensity_max = 0.75,
				engine_flare_color		= "153 204 255 17",
				boost_flare_color		= "153 204 255 17",
				engine_flare_offset = 0.1,
				boost_length = 0.375,
				boost_width = 0.375,
				boost1_length = 0.375,
				boost1_width = 0.375,
				-- r3 l t5 Craft
				Craft =
				{
					engine_length = 0.45,
					engine_width = 0.3,
					engine1_length = 0.36,
					engine1_width = 0.27,
					engine2_length = 0.36,
					engine2_width = 0.27,
					engine3_length = 0.36,
					engine3_width = 0.27,
					boost_length = 0.24,
					boost_width = 0.16,
					boost_flare_size = 0.2,
					engine_flare_size = 0.2,
					boost1_length = 0.24,
					boost1_width = 0.16,
					engine_light_radius = 15,
					boost_loop_sound = "sound/craft/large_boost",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/large_engine",
					engine_glow_intensity_max = 0.9;
					engine_glow_intensity_min = 0.00005;
					boost_effect = "particles/ships/ship_engine_b3",
					engine_effect = "particles/ships/ship_engine_b3",
					engine_light_offset = -3.0,
				},
				--Shuttle
				craftUniq = 
				{
					engine_length = 0.32,
					engine_width = 0.32,		
					engine1_length = 0.32,
					engine1_width = 0.32,
					engine2_length = 0.4,
					engine2_width = 0.4,
					engine3_length = 0.4,
					engine3_width = 0.4,
					boost_length = 0.16,
					boost_width = 0.16,
					boost1_length = 0.16,
					boost1_width = 0.16,
					boost2_length = 0.16,
					boost2_width = 0.16,
					boost_flare_size = 0.12,
					engine_flare_size = 0.24,
					engine_light_radius = 15,
					boost_flare_offset = -0.1,
					engine_flare_offset = -0.1,
					boost_loop_sound = "sound/craft/large_boost",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/large_engine",
					engine_glow_intensity_max = 1.0;
					engine_light_offset = -1.0,
				},
				-- Ship_Race3_L_T5_CraftUniq
				CraftUniq = 
				{
					engine_length = 0.60,
					engine_width = 0.28,		
					engine1_length = 0.60,
					engine1_width = 0.28,
					engine2_length = 0.60,
					engine2_width = 0.28,
					engine3_length = 0.60,
					engine3_width = 0.28,
					boost_flare_size = 0.0,
					engine_flare_size = 0.0,
					engine_light_radius = 15,
					boost_flare_offset = 0.0,
					engine_flare_offset = 0.0,
					boost_loop_sound = "sound/boost/large_T5_CraftUniq_start_loop",
					boost_stop_sound = "sound/boost/large_t5_craft_end",
					engine_sound = "sound/craft/large_engine",
					engine_glow_intensity_max = 1.0;
					engine_glow_intensity_min = 0.002;
					engine_light_offset = -1.0,
				},
				--Archelon
				T3 = 
				{
					PU =
					{
						boost_effect = "particles/ships/engine_l_t3_pu_boost",
						engine_effect = "particles/ships/engine_l_t3_pu",
						engine_flare_size = 0.0,
						boost_flare_size = 0.0,
						engine_length = 1.0,
						boost_length = 1.0,
						engine_light_radius = 15,
						boost_loop_sound = "sound/craft/large_boost",
						boost_stop_sound = "sound/craft/large_boost_end",
						engine_sound = "sound/craft/large_engine",
						boost_loop_sound = "sound/craft/large_boost",
						boost_stop_sound = "sound/craft/large_boost_end",
						engine_sound = "sound/craft/large_engine",
						engine_glow_intensity_max = 1.0;
						engine_glow_intensity_min = 0.0001;
						engine_light_offset = -2.0,
					},
				},
				--r3 l T5 Comodo
				comodo =
				{
					boost_effect = "particles/ships/ship_engine_comodo_boost",
					engine_effect = "particles/ships/ship_engine_comodo_eng",
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					engine_length = 1.0,
					boost_length = 1.0,
					boost1_length = 1.0,
					engine_light_radius = 15,
					boost_loop_sound = "sound/craft/large_boost",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/large_engine",
					boost_loop_sound = "sound/craft/large_boost",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/large_engine",
					engine_glow_intensity_max = 1.0;
					engine_glow_intensity_min = 0.00005;
					engine_light_offset = -2.0,
				},
				--Ship_Race3_L_T5_CraftSpec
				T5 = 
				{
					Raven =
					{
						engine_length = 0.8,
						engine_width = 0.4,
						engine2_length = 0.8,
						engine2_width = 0.4,
						engine_flare_size = 0.25,
						engine_flare_offset = -0.5,
						boost_flare_size = 0.2,
						boost_flare_offset = -0.3,
						engine_light_radius = 28,
						engine_light_offset = 0.0,
						engine_flame_acceleration_time_interval = 3.0,
						engine_glow_acceleration_time_interval = 1.0,
						engine_min_length_factor = 0.25,
						engine_min_width_factor = 0.5,
						engine_glow_shutdown_time_interval = 1.0,
						engine_flame_shutdown_time_interval = 0.75,
						engine_glow_intensity_min = 0.0001,
						engine_glow_intensity_max = 1.0,
						engine_flare_color		= "153 204 255 30",
						boost_flare_color		= "153 204 255 20",
						boost_length = 0.6,
						boost_width = 0.3,
						boost1_length = 0.6,
						boost1_width = 0.3,
						boost_loop_sound = "sound/boost/large_T5_Sniper_start_loop",
						boost_stop_sound = "sound/boost/large_t5_craft_end",
						engine_sound = "sound/engine/large_t5_craft_loop",
						boost_effect = "particles/ships/ship_engine_b1",
						engine_effect = "particles/ships/ship_engine_b1",
					},
				},
				--Race3_Large_shrike
				srike =
				{
					boost_effect = "particles/ships/engine_r3_l_t5_shrike_boost",
					engine_effect = "particles/ships/engine_r3_l_t5_shrike",
					engine_flare_size = 0.0,
					boost_flare_size = 0.0,
					engine_length = 1.0,
					boost_length = 1.0,
					boost1_length = 1.0,
					engine_light_radius = 10,
					engine_flare_color = "230 150 20 100",
					boost_flare_color = "230 150 20 100",
					engine_light_color	= "230 120 40 100",
					boost_loop_sound = "sound/craft/large_boost",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/large_engine",
					boost_loop_sound = "sound/craft/large_boost",
					boost_stop_sound = "sound/craft/large_boost_end",
					engine_sound = "sound/craft/large_engine",
					engine_glow_intensity_max = 1.0;
					engine_glow_intensity_min = 0.00005;
					engine_factor = 0.6,
					engine_light_offset = -2.0,
					trail_effect = "particles/ships/ship_trail_shrike",
					trail_color = "210 124 90 10",
					trail_size = 0.15,
				},
				Polarbear = 
				{
					boost_effect = "particles/ships/ship_engine_frozen",
					engine_effect = "particles/ships/ship_engine_frozen",
					boost_length = 0.325,
					boost_width = 0.325,
					boost1_length = 0.325,
					boost1_width = 0.325,
					boost2_length = 0.325,
					boost2_width = 0.325,
					boost3_length = 0.325,
					boost3_width = 0.325,
					engine_length = 0.46,
					engine_width = 0.46,
					engine1_length = 0.225,
					engine1_width = 0.225,
					engine2_length = 0.225,
					engine2_width = 0.225,
					engine3_length = 0.46,
					engine3_width = 0.46,
					engine4_length = 0.225,
					engine4_width = 0.225,
					engine5_length = 0.225,
					engine5_width = 0.225,
					engine_flare_size = 0.18,
					boost_flare_size = 0.10,
					engine_light_radius = 28,
					engine_light_offset = 0.0,
					engine_flare_color		= "153 238 255 17",
					boost_flare_color		= "153 238 255 17",
				},
				Mole =
				{
					boost_effect = "particles/ships/ship_engine_mole_boost",
					engine_effect = "particles/ships/ship_engine_mole_eng",
					boost_loop_sound = "sound/boost/large_T5_mole_start_loop",
					boost_stop_sound = "sound/boost/small_t5_craft_end",
					engine_flare_color = "255 191 128 22", --23
					boost_flare_color = "255 191 128 24", --23
					engine_flare_size = 0.32, --0.4
					engine_flare_offset = -0.2,
					boost_flare_size = 0.15, --0.2
					boost_flare_offset = -0.16,
					engine_light_radius = 20,
					engine_light_offset = -2.0,
					engine_light_color = "255 202 126 255",
					engine_length = 0.65,
					engine_width = 1.0,
					engine1_length = 0.65,
					engine1_width = 1.0,
					engine2_length = 0.65,
					engine2_width = 1.0,
					engine3_length = 0.65,
					engine3_width = 1.0,
					boost_length = 0.4,
					boost_width = 1.0,
					boost1_length = 0.4,
					boost1_width = 1.0,
					boost2_length = 0.4,
					boost2_width = 1.0,
					boost3_length = 0.4,
					boost3_width = 1.0,
					engine_glow_intensity_min = 0.0001,
					engine_glow_intensity_max = 1.0,
				},
				--Race3_L_T5_Hellas
				hallas =
				{
				boost_effect = "particles/ships/boost_katalina",
				engine_effect = "particles/ships/engine_katalina",
				trail_size = 0.10,
				trail_color = "5 191 255 14",
				engine_length = 0.46,
				engine_width = 0.46,
				engine1_length = 0.225,
				engine1_width = 0.225,
				engine2_length = 0.225,
				engine2_width = 0.225,
				engine_flare_size = 0.18,
				boost_flare_size = 0.12,
				engine_light_radius = 28,
				engine_light_offset = 0.1,
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 0.5,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.75,
				engine_glow_intensity_min = 0.0001,
				engine_glow_intensity_max = 0.75,
				engine_flare_color		= "153 204 255 20",
				boost_flare_color		= "153 204 255 0",
				engine_flare_offset = 0.1,
				boost_length = 0.375,
				boost_width = 0.375,
				boost1_length = 0.375,
				boost1_width = 0.375,
				engine_factor = 0.5,
			    },
			},
            Huge =
			{
				trail_size = 0.15,
				boost_effect = "particles/ships/engine_h",
				engine_effect = "particles/ships/engine_h",
				engine_flare_size = 0.8,
				boost_flare_size = 0.6,
				engine_light_radius = 35,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/huge_start_loop",
				boost_stop_sound = "sound/boost/huge_end",
				engine_sound = "sound/engine/huge_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 1.0,
				engine_glow_shutdown_time_interval = 1.25,
				engine_flame_shutdown_time_interval = 1.0,
				t3 =
				{
					engine_length = 0.35,
					engine_width = 0.35,
					engine1_length = 0.35,
					engine1_width = 0.35,
					boost_length = 0.25,
					boost_width = 0.25,
					engine_flare_size       = 0.4,
					boost_flare_size 		= 0.4,
					engine_flare_color		= "120 212 255 0",
					boost_flare_color		= "120 212 255 0",
					boost_effect = "particles/ships/engine_h",
					engine_effect = "particles/ships/engine_h",
					engine_factor = 0.25,
					engine_glow_intensity_min = 0.0,
					engine_glow_intensity_max = 0.75,
					engine_light_offset = -2.0,
				},
				t4 =
				{
					engine_length = 0.4,
					engine_width = 0.3,
					engine1_length = 0.4,
					engine1_width = 0.3,
					boost_length = 0.32,
					boost_width = 0.25,
					boost1_length = 0.32,
					boost1_width = 0.25,
					engine_flare_size       = 0.4, 
					boost_flare_size 		= 0.4,
					engine_flare_color		= "124 175 247 25",
					boost_flare_color		= "124 175 247 25",
					boost_effect 			= "particles/ships/engine_h_t4",
					boost1_effect 			= "particles/ships/engine_h_t4",
					engine_effect           = "particles/ships/engine_h_t4",
					engine_glow_intensity_min = 0.00002,
					engine_min_length_factor = 0.375,
					engine_light_offset = -2.0,
				},
				t5 =
				{
					engine_length = 0.3,
					engine_width = 0.25,
					boost_length = 0.4,
					boost_width = 0.2,
					engine1_length = 0.3,
					engine1_width = 0.25,
					boost1_length = 0.4,
					boost1_width = 0.2,
					boost_flare_size 		= 0.3,
					engine_flare_size       = 0.3, 
					engine_flare_color		= "96 153 247 0",
					boost_flare_color		= "96 153 247 0",
					boost_effect 			= "particles/ships/engine_h_t5_boost",
					engine_effect           = "particles/ships/engine_h_t5",
					boost1_effect 			= "particles/empty",
					engine1_effect          = "particles/empty",
					engine_glow_intensity_min = 0.00004,
					engine_glow_intensity_max = 0.5,
					engine_light_offset = -2.5,
					engine_light_color	= "161 197 247 100",
				},
				Uniq =
				{
					boost_effect = "particles/ships/engine_h_b_uniq_boost",
					engine_effect = "particles/ships/engine_h_b_uniq_eng",
					boost_loop_sound = "sound/boost/huge_Race3_T5_start_loop",
					boost_stop_sound = "sound/boost/huge_end",
					engine_sound = "sound/engine/huge_loop",
					engine_length = 0.33,
					engine_width = 1.0,
					engine1_length = 0.33,
					engine1_width = 1.0,
					boost_length = 0.38,
					boost_width = 1.0,
					engine_flare_color		= "96 201 255 30",
					boost_flare_color		= "96 201 255 25",
					boost_flare_size = 0.5,
					engine_flare_size = 0.5, 
					engine_flare_offset = -0.225,
					boost_flare_offset = -0.31,
					engine_factor = 0.5,
					Small =
					{
						boost_effect = "particles/ships/engine_s_b_uniq_boost",
						engine_effect = "particles/ships/engine_s_b_uniq_eng",
						boost_loop_sound = "sound/boost/small_t5_craft_start_loop",
						boost_stop_sound = "sound/boost/small_t5_craft_end",
						engine_sound = "sound/engine/small_loop",
						engine_length = 0.3,
						engine_width = 0.13,
						boost_length = 0.9,
						boost_width = 1.0,
						boost1_length = 0.9,
						boost1_width = 1.0,
						engine_flare_color		= "96 201 255 25",
						boost_flare_color		= "96 201 255 25",
						boost_flare_size = 0.12,
						engine_flare_size = 0.16, 
						engine_flare_offset = -0.25,
						boost_flare_offset = -0.06,
					},
				},
			},
		},
		Race4 =
		{
			engine_sound_left = "sound/engine/left_engine",
			engine_sound_right = "sound/engine/right_engine",
			-- r2 s t3 pirate 
			-- r2 s t4 pirate
			-- r2 m t4 pirate
			-- r2 l t4 pirate			
			engine_flare_color		= "247 96 164 21",
			engine_light_color = "254 128 153 100",
			boost_flare_color		= "247 96 164 19",
			trail_color = "185 21 41 100",
			engine_flame_acceleration_time_interval = 3.0,
			engine_glow_acceleration_time_interval = 1.0,
			engine_min_length_factor = 0.25,
			engine_min_width_factor = 0.5,
			engine_glow_shutdown_time_interval = 1.0,
			engine_flame_shutdown_time_interval = 0.75,
			engine_glow_intensity_min = 0.001,
			engine_glow_intensity_max = 1.0,
			boost_effect = "particles/ships/ship_engine_p4",
			engine_effect = "particles/ships/ship_engine_p4",
			-- r1 s t3 pirate
			Grim =
			{
				trail_size = 0.05,
				engine_length = 0.11,
				engine_width = 0.09,
				boost_length = 0.09,
				boost_width = 0.08,
				engine_flare_size = 0.1,
				boost_flare_size = 0.1,
				engine_light_radius = 15,
				engine_flare_color		= "247 96 96 10",
				boost_flare_color		= "247 96 96 10",
				engine_light_color		= "254 148 116 75",
				boost_loop_sound = "sound/boost/small_start_loop",
				boost_stop_sound = "sound/boost/small_end",
				engine_sound = "sound/engine/small_loop",
				engine_glow_intensity_min = 0.0001;
				boost_effect = "particles/ships/ship_engine_r4",
				engine_effect = "particles/ships/ship_engine_r4",
				engine_light_radius = 8,
				engine_light_offset = 0.0,
			},
			-- r3 s t3 pirate
			Sai =
			{
				trail_size = 0.05,
				engine_flare_size = 0.0,
				boost_flare_size = 0.0,
				engine_light_radius = 15,
				engine_flare_color		= "148 57 49 23",
				boost_flare_color		= "148 57 49 19",
				boost_loop_sound = "sound/boost/small_start_loop",
				boost_stop_sound = "sound/boost/small_end",
				engine_sound = "sound/engine/small_loop",
				engine_length = 0.1,
				engine_width = 0.1,
				boost_length = 0.06,
				boost_width = 0.06,
				boost1_length = 0.06,
				boost1_width = 0.06,
				engine_glow_intensity_min = 0.0;
				engine_light_radius = 8,
				engine_light_offset = 0.0,
			},
			-- r3 m t2 pirate
			Jocker =
			{
				trail_size = 0.07,
				engine_length = 0.25,
				engine_width = 0.25,
				boost_length = 0.15,
				boost_width = 0.15,
				engine_flare_size = 0.0,
				boost_flare_size = 0.0,
				engine_flare_color		= "247 96 96 0",
				boost_flare_color		= "247 96 96 0",
				engine_light_radius = 15,
				engine_light_offset = -1.0,
				boost_loop_sound = "sound/boost/medium_start_loop",
				boost_stop_sound = "sound/boost/medium_end",
				engine_sound = "sound/engine/medium_loop",
				engine_glow_intensity_min = 0.0;
			},
			-- r1 m t2 pirate
			Shark =
			{
				trail_size = 0.07,
				engine_length = 0.12,
				engine_width = 0.12,
				boost_length = 0.10,
				boost_width = 0.10,
				engine_flare_size = 0.0,
				boost_flare_size = 0.0, 
				engine_light_radius = 15,
				engine_light_offset = -1.0,
				engine_flare_color		= "247 96 96 0",
				boost_flare_color		= "247 96 96 0",
				boost_loop_sound = "sound/boost/medium_start_loop",
				boost_stop_sound = "sound/boost/medium_end",
				engine_sound = "sound/engine/medium_loop",
				engine_glow_intensity_min = 0.0;
			},
			-- Phoenix r1 l t3 pirate, 
			Large =
			{
				trail_size = 0.1,
				engine_length = 0.30,
				engine_width = 0.30,
				engine1_length = 0.18,
				engine1_width = 0.18,
				engine2_length = 0.18,
				engine2_width = 0.18,
				boost_length = 0.12,
				boost_width = 0.12,
				engine_flare_size = 0.25,
				boost_flare_size = 0.07,
				engine_flare_color		= "247 96 96 0",
				boost_flare_color		= "247 96 96 0",
				engine_light_radius = 25,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/large_start_loop",
				boost_stop_sound = "sound/boost/large_end",
				engine_sound = "sound/engine/large_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 0.5,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.75,
				boost_effect = "particles/ships/ship_engine_r1",
				engine_effect = "particles/ships/ship_engine_r1",
				-- Reaper r3 l t3 pirate
				Reaper = 
				{
					boost_length = 0.18,
					boost_width = 0.18,
					boost1_length = 0.18,
					boost1_width = 0.18,
					engine_flare_size = 0.4,
					boost_flare_size = 0.25,
					engine_flare_color		= "247 96 96 0",
					boost_flare_color		= "247 96 96 0", 
					engine_light_radius = 30,
					boost_loop_sound = "sound/boost/large_start_loop",
					boost_stop_sound = "sound/boost/large_end",
					engine_sound = "sound/engine/large_loop",
					engine_light_radius = 25,
					engine_light_offset = -1.0,
				},
			},	
            huge =
			{
				trail_size = 0.15,
				engine_length = 0.13,
				engine_width = 0.12,
				boost_length = 0.11,
				boost_width = 0.12,
				engine_light_radius = 40,
				boost_loop_sound = "sound/boost/huge_start_loop",
				boost_stop_sound = "sound/boost/huge_end",
				engine_sound = "sound/engine/huge_loop",
				--Ship_OW_Boss_PirateEvent
				craftuniq = 
				{
					boss =
					{
						boost_effect = "particles/ships/ship_engine_r2_l_t5_cu_boost",
						engine_effect = "particles/ships/ship_engine_r2_l_t5_cu_eng",
						boost_loop_sound = "sound/boost/huge_start_loop",
						boost_stop_sound = "sound/boost/huge_end",
						engine_sound = "sound/engine/el_large_loop",
						engine_length = 1.0,
						engine_width = 0.0,
						engine1_length = 1.0,
						engine1_width = 0.0,
						engine2_length = 1.0,
						engine2_width = 0.0,
						engine3_length = 1.0,
						engine3_width = 0.0,
						engine4_length = 1.0,
						engine4_width = 0.0,
						engine5_length = 1.0,
						engine5_width = 0.0,
						boost_length = 0.75,
						boost_width = 0.0,
						boost1_length = 0.75,
						boost1_width = 0.0,
						engine_glow_intensity_min = 0.0;
						engine_glow_intensity_max = 1.0,
						engine_glow_shutdown_time_interval = 0.75,
						engine_flame_shutdown_time_interval = 0.45,
						engine_flare_size = 0.4,
						boost_flare_size = 0.25,
						engine_flare_offset = -0.2,
						boost_flare_offset = -0.2,
						engine_flare_color = "255 149 128 21",
						engine_light_color = "255 149 128 100",
						boost_flare_color  = "255 149 128 19",
					},
				},
			},
		},
		Race5 =
		{
			engine_sound_left = "sound/engine/left_engine",
			engine_sound_right = "sound/engine/right_engine",
			trail_color = "4 64 41 100",
			engine_flame_acceleration_time_interval = 3.0,
			engine_glow_acceleration_time_interval = 1.0,
			engine_min_length_factor = 0.25,
			engine_min_width_factor = 0.5,
			engine_glow_shutdown_time_interval = 1.0,
			engine_flame_shutdown_time_interval = 0.75,
			engine_glow_intensity_min = 0.0;
			engine_glow_intensity_max = 1.0;
			-- SCOUT
			Small =
			{
				trail_size = 0.05,
				engine_length = 0.2,
				engine_width = 0.2,
				boost_length = 0.14,
				boost_width = 0.14,
				boost1_length = 0.10,
				boost1_width = 0.10,
				boost2_length = 0.10,
				boost2_width = 0.10,
				engine_flare_size = 0.1,
				boost_flare_size = 0.05, 
				engine_light_radius = 8,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/el_medium_start_loop",
				boost_stop_sound = "sound/boost/el_medium_end",
				engine_sound = "sound/engine/el_medium_loop",
				engine_sound_right = "sound/engine/el_right_engine",
				engine_sound_left = "sound/engine/el_left_engine",				
				Ace =
				{
				boost_effect = "particles/ships/r5_s_ace_boost",
				engine_effect = "particles/ships/r5_s_ace_engine",
				engine_length = 0.3,
				engine_width = 1,
				boost_length = 0.3,
				boost_width = 0.1,
				engine_flare_size = 0.0,
				boost_flare_size = 0.0,
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.4,
				engine_min_width_factor = 0.4,
				engine_glow_shutdown_time_interval = 1.0,
				engine_flame_shutdown_time_interval = 0.45,
				engine_light_color	= "182 187 234 100",
				engine_light_radius = 3,
				engine_light_offset = -0.5,
				boost_loop_sound = "sound/craft/small_boost",
				boost_stop_sound = "sound/craft/small_boost_end",
				engine_sound = "sound/craft/small_engine",
				trail_color = "28 135 235 10",
				},
				R5 =
				{
					boost_effect = "particles/ships/ship_engine_alien_1",
					engine_effect = "particles/ships/ship_engine_alien_1",
					engine_length = 0.18,
					engine_width = 0.18,
					boost_length = 0.10,
					boost_width = 0.10,
					engine_glow_intensity_min = 0.005;
					engine_flare_offset = -0.1,
					boost_flare_offset = -0.1,
					engine_light_color		= "178 229 255 100",
					engine_flare_color		= "178 229 255 0",
					boost_flare_color		= "178 229 255 0",
				},
				R7 =
				{
					boost_effect = "particles/ships/ship_engine_alien_1",
					engine_effect = "particles/ships/ship_engine_alien_1",
					engine_light_color		= "150 210 255 128",
					engine_length = 0.18,
					engine_width = 0.18,
					boost_length = 0.10,
					boost_width = 0.10,
					engine_flare_offset = -0.13,
					boost_flare_offset = -0.13,
					engine_light_color		= "178 229 255 100",
					engine_flare_color		= "178 229 255 0",
					boost_flare_color		= "178 229 255 0",
				},
				R9 =
				{
					boost_effect = "particles/ships/ship_engine_alien_2",
					engine_effect = "particles/ships/ship_engine_alien_2",
					engine_length = 0.24,
					engine_width = 0.16,
					boost_length = 0.10,-- Right
					boost_width = 0.10,
					boost1_length = 0.06, -- Left
					boost1_width = 0.10,
					boost2_length = 0.10,--Center
					boost2_width = 0.10,
					engine_flare_offset = -0.15,
					boost_flare_offset = -0.15,
					engine_light_color		= "231 166 255 100",
					engine_flare_color		= "196 191 255 0",
					boost_flare_color		= "196 191 255 0",
				},
				R11 =
				{
					boost_effect = "particles/ships/ship_engine_alien_2",
					engine_effect = "particles/ships/ship_engine_alien_2",
					engine_length = 0.24,
					engine_width = 0.20,
					boost_length = 0.10,-- Right
					boost_width = 0.10,
					boost1_length = 0.06, -- Left
					boost1_width = 0.10,
					boost2_length = 0.10,--Center
					boost2_width = 0.10,
					engine_flare_offset = -0.13,
					boost_flare_offset = -0.13,
					engine_light_color		= "231 166 255 100",
					engine_flare_color		= "196 191 255 0",
					boost_flare_color		= "196 191 255 0",
				},
				R13 =
				{
					boost_effect = "particles/ships/ship_engine_alien_ball_2",
					engine_effect = "particles/ships/ship_engine_alien_ball_2",
					engine_length = 0.24,
					engine_width = 0.165,
					boost_length = 0.12,-- Right
					boost_width = 0.10,
					boost1_length = 0.06, -- Left
					boost1_width = 0.10,
					boost2_length = 0.12,--Center
					boost2_width = 0.10,
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					engine_flare_offset = -0.12,
					boost_flare_offset = -0.12,
					engine_light_color		= "231 166 255 100",
					engine_flare_color		= "196 191 255 0",
					boost_flare_color		= "196 191 255 0",
				},
				Recon =
				{
								R5 =
								{
									boost_effect = "particles/ships/ship_engine_alien_1",
									engine_effect = "particles/ships/ship_engine_alien_1",
									engine_length = 0.325,
									engine_width = 0.28,
									boost_length = 0.16,
									boost_width = 0.12,
									engine_glow_intensity_min = 0.005;
									engine_light_radius = 5,
									engine_light_offset = -2.5,
									engine_flare_offset = -0.1,
									boost_flare_offset = -0.1,
									engine_light_color		= "178 229 255 100",
									engine_flare_color		= "178 229 255 0",
									boost_flare_color		= "178 229 255 0",
								},
								R9 =
								{
									boost_effect = "particles/ships/ship_engine_alien_1",
									engine_effect = "particles/ships/ship_engine_alien_1",
									engine_length = 0.29,
									engine_width = 0.29,
									boost_length = 0.213,
									boost_width = 0.16,
									engine_glow_intensity_min = 0.005;
									engine_light_radius = 5,
									engine_light_offset = -2.5,
									engine_flare_offset = -0.1,
									boost_flare_offset = -0.1,
									engine_light_color		= "178 229 255 100",
									engine_flare_color		= "178 229 255 0",
									boost_flare_color		= "178 229 255 0",
								},
								R12 =
								{
									boost_effect = "particles/ships/ship_engine_alien_1",
									engine_effect = "particles/ships/ship_engine_alien_1",
									engine_length = 0.32,
									engine_width = 0.36,
									boost_length = 0.253,
									boost_width = 0.19,
									engine_glow_intensity_min = 0.005;
									engine_light_radius = 5,
									engine_light_offset = -2.5,
									engine_flare_offset = -0.1,
									boost_flare_offset = -0.1,
									engine_light_color		= "178 229 255 100",
									engine_flare_color		= "178 229 255 0",
									boost_flare_color		= "178 229 255 0",
								},
				},
				Salyut =
				{
					boost_effect = "particles/ships/ship_engine_salyut",
					engine_effect = "particles/ships/ship_engine_salyut",
					boost_loop_sound = "sound/boost/salut_start_loop",
					boost_stop_sound = "sound/boost/salut_boost_end",
					engine_sound = "sound/engine/salut_loop",
					engine_length = 0.1,
					engine_width = 0.05,
					engine1_length = 0.1,
					engine1_width = 0.05,
					engine2_length = 0.1,
					engine2_width = 0.05,
					engine3_length = 0.1,
					engine3_width = 0.05,
					boost_length = 0.08,
					boost_width = 0.04,
					boost1_length = 0.08,
					boost1_width = 0.04,
					boost2_length = 0.08,
					boost2_width = 0.04,
					boost3_length = 0.08,
					boost3_width = 0.04,
					boost4_length = 0.08,
					boost4_width = 0.04,
					boost5_length = 0.08,
					boost5_width = 0.04,
					boost6_length = 0.08,
					boost6_width = 0.045,
					boost7_length = 0.08,
					boost7_width = 0.04,
					engine_light_color 		= "255 202 126 255",
					engine_flare_color		= "255 178 102 30", 
					boost_flare_color		= "255 178 102 25",
					engine_flare_size = 0.1,
					boost_flare_size = 0.05,
					engine_flare_offset = -0.0,
					boost_flare_offset = -0.02,
					engine_light_radius = 8,
					engine_light_offset = 0.0,
					trail_color = "121 36 1 100",
				},				
			},
			-- ATTACK
			Medium =
			{
				trail_size = 0.07,
				engine_flare_size = 0.16,
				boost_flare_size = 0.08, 
				engine_light_radius = 10,
				boost_loop_sound = "sound/boost/el_medium_start_loop",
				boost_stop_sound = "sound/boost/el_medium_end",
				engine_sound = "sound/engine/el_medium_loop",
				engine_sound_right = "sound/engine/el_right_engine",
				engine_sound_left = "sound/engine/el_left_engine",
				engine_light_radius = 15,
				engine_light_offset = 0.0,
				R5 =
				{
					boost_effect = "particles/ships/ship_engine_alien_1",
					engine_effect = "particles/ships/ship_engine_alien_1",
					engine_length = 0.19,
					engine_width = 0.19,
					boost_length = 0.14,
					boost_width = 0.14,
					engine_glow_intensity_min = 0.005;
					engine_flare_offset = 0.01,
					boost_flare_offset = 0.02,
					engine_light_color		= "178 229 255 100",
					engine_flare_color		= "178 229 255 0",
					boost_flare_color		= "178 229 255 0",
					engine_light_offset = -1.0,
				},
				R7 =
				{
					boost_effect = "particles/ships/ship_engine_alien_1",
					engine_effect = "particles/ships/ship_engine_alien_1",
					engine_length = 0.22,
					engine_width = 0.22,
					boost_length = 0.15,
					boost_width = 0.15,
					engine_glow_intensity_min = 0.005;
					engine_flare_offset = -0.06,
					boost_flare_offset = -0.06,
					engine_light_color		= "178 229 255 100",
					engine_flare_color		= "178 229 255 0",
					boost_flare_color		= "178 229 255 0",
				},
				R9 =
				{
					boost_effect = "particles/ships/ship_engine_alien_2",
					engine_effect = "particles/ships/ship_engine_alien_2",	
					engine_length = 0.2,
					engine_width = 0.3,
					boost_length = 0.10,
					boost_width = 0.15,
					engine_flare_offset = -0.16,
					boost_flare_offset = -0.06,
					engine_light_color		= "168 163 255 100",
					engine_flare_color		= "196 191 255 0",
					boost_flare_color		= "196 191 255 0",
				},
				R11 =
				{
					boost_effect = "particles/ships/ship_engine_alien_ball_1",
					engine_effect = "particles/ships/ship_engine_alien_ball_1",
					engine_length = 0.26,
					engine_width = 0.26,
					boost_length = 0.12,
					boost_width = 0.12,
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					engine_flare_offset = -0.09,
					boost_flare_offset = -0.09,
					engine_light_color		= "163 255 194 100",
					engine_flare_color		= "140 255 178 0",
					boost_flare_color		= "140 255 178 0",
					engine_light_offset = -1.0,
				},
				R13 =
				{
					boost_effect = "particles/ships/ship_engine_alien_ball_2",
					engine_effect = "particles/ships/ship_engine_alien_ball_2",
					engine_length = 0.26,
					engine_width = 0.26,
					boost_length = 0.12,
					boost_width = 0.12,
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					engine_flare_offset = -0.1,
					engine_light_color		= "168 163 255 100",
					engine_flare_color		= "196 191 255 0",
					boost_flare_color		= "196 191 255 0",
				},
				COMMAND = 				
				{	
					engine_sound = "sound/engine/green_engine",
					boost_loop_sound = "sound/boost/greenboost1_loop",
					boost_stop_sound = "sound/boost/el_medium_end",
					R5 = 
					{	
					boost_effect = "particles/ships/ship_engine_alien_1",
					engine_effect = "particles/ships/ship_engine_alien_1",
					engine_sound_right = "nil",
					engine_sound_left = "nil",
					engine_length = 0.22,
					engine_width = 0.19,
					boost_length = 0.15,
					boost_width = 0.1,
					engine_glow_intensity_min = 0.075;
					engine_flare_offset = -0.06,
					boost_flare_offset = -0.06,
					engine_light_color		= "178 229 255 100",
					engine_flare_color		= "178 229 255 0",
					boost_flare_color		= "178 229 255 0",
					trail_effect = "particles/ships/ship_trail",
				    trail_size = 0.1,
					trail_color = "4 64 41 100",
					},
					R9 = 
					{
						boost_effect = "particles/ships/ship_engine_alien_1",
					engine_effect = "particles/ships/ship_engine_alien_2",
					engine_sound = "sound/engine/green_engine",
					engine_length = 0.2,
					engine_sound_right = "nil",
					engine_sound_left = "nil",
					engine_width = 0.15,
					boost_length = 0.125,
					boost_width = 0.075,
					engine_glow_intensity_min = 0.05;
					engine_flare_offset = -0.06,
					boost_flare_offset = -0.06,
					engine_light_color		= "178 229 255 100",
					engine_flare_color		= "178 229 255 0",
					boost_flare_color		= "178 229 255 0",
					trail_effect = "particles/ships/ship_trail",
				    trail_size = 0.1,
					trail_color = "4 64 41 100",
					},
					R12 = 
					{
						engine_sound = "sound/engine/green_engine",
						boost_effect = "particles/ships/ship_engine_alien_ball_3",
					engine_effect = "particles/ships/ship_engine_alien_ball_4",
					engine_length = 0.22,
					engine_sound_right = "nil",
					engine_sound_left = "nil",
					engine_width = 0.24,
					boost_length = 0.12,
					boost_width = 0.0975,
					engine_glow_intensity_min = .05;
					engine_flare_offset = -0.06,
					boost_flare_offset = -0.06,
					engine_light_color		= "178 229 255 100",
					engine_flare_color		= "178 229 255 0",
					boost_flare_color		= "178 229 255 0",
					trail_effect = "particles/ships/ship_trail",
				    trail_size = 0.1,
					trail_color = "4 64 41 100",
					},
				},
			},
			-- ENGENEER
			Large = 
			{
				boost_loop_sound = "sound/boost/el_large_start_loop",
				boost_stop_sound = "sound/boost/el_medium_end",
				engine_sound = "sound/engine/el_large_loop",
				engine_sound_left = "sound/engine/el_left_engine",
				engine_sound_right = "sound/engine/el_right_engine",
				trail_size = 0.07,
				engine_light_color		= "168 163 255 100",
				engine_flare_color		= "196 191 255 0",
				boost_flare_color		= "196 191 255 0",
				boost_effect = "particles/ships/ship_engine_alien_1",
				engine_effect = "particles/ships/ship_engine_alien_1",
				engine_length = 0.2,
				engine_width = 0.2,
				boost_length = 0.14,
				boost_width = 0.14,
				engine_flare_size = 0.3,
				boost_flare_size = 0.2, 
				engine_light_radius = 10,
				engine_glow_intensity_min = 0.001;
				engine_glow_intensity_max = 1.0;
				engine_light_radius = 25,
				engine_light_offset = 0.0,
				R5 =
				{
					boost_effect = "particles/ships/ship_engine_alien_1",
					engine_effect = "particles/ships/ship_engine_alien_1",
					engine_length = 0.315,
					engine_width = 0.42,
					boost_length = 0.195,
					boost_width = 0.26,
					engine_light_color		= "178 238 255 100",
					engine_flare_color		= "178 238 255 0",
					boost_flare_color		= "178 238 255 0",
					engine_flare_offset = 0.0,
					boost_flare_offset = -0.03,
					engine_light_offset = -1.0,
					engine_light_color		= "168 163 255 100",
				},
				GUARD=
				{
						R5 =
				   {
					boost_effect = "particles/ships/boost_r5_l_guard",
					engine_effect = "particles/ships/engine_r5_l_guard",
					engine_length = 0.315,
					engine_width = 0.42,
					boost_length = 0.195,
					boost_width = 0.26,
					engine_light_color		= "182 187 234 100",
					engine_flare_color		= "182 187 234 10",
					boost_flare_color		= "182 187 234 0",
					engine_flare_offset = -0.03,
					boost_flare_offset = -0.03,
					engine_light_offset = -1.0,
					trail_size = 0.07,
					engine_light_radius = 20,
					engine_light_color		= "182 187 234 100",
				   },
				   	    R9 =
				   {
					boost_effect = "particles/ships/boost_r9_l_guard",
					engine_effect = "particles/ships/engine_r9_l_guard",
					engine_length = 0.315,
					engine_width = 0.42,
					boost_length = 0.195,
					boost_width = 0.26,
					engine_light_color		= "182 187 234 100",
					engine_flare_color		= "182 187 234 10",
					boost_flare_color		= "182 187 234 0",
					engine_flare_offset = -0.03,
					boost_flare_offset = -0.03,
					engine_light_offset = -1.0,
					trail_size = 0.07,
					engine_light_radius = 20,
					engine_light_color		= "197 184 234 100",
				   },
				   	    R12 =
				   {
					boost_effect = "particles/ships/boost_r12_l_guard",
					engine_effect = "particles/ships/engine_r12_l_guard",
					engine_length = 0.415,
					engine_width = 0.62,
					boost_length = 0.215,
					boost_width = 0.46,
					engine_light_color		= "182 187 234 100",
					engine_flare_color		= "182 187 234 10",
					boost_flare_color		= "182 187 234 0",
					engine_flare_offset = -0.03,
					boost_flare_offset = -0.03,
					engine_light_offset = -1.0,
					trail_size = 0.08,
					engine_light_radius = 25,
					engine_light_color		= "213 184 234 100",
				   },
				},
				R7 =
				{
					boost_effect = "particles/ships/ship_engine_alien_2",
					engine_effect = "particles/ships/ship_engine_alien_2",
					engine_length = 0.315,
					engine_width = 0.42,
					boost_length = 0.18,
					boost_width = 0.28,
					engine_flare_offset = 0.02,
					boost_flare_offset = -0.01,
					engine_light_offset = -1.0,					
				},	
				R9 =
				{
					boost_effect = "particles/ships/ship_engine_alien_2",
					engine_effect = "particles/ships/ship_engine_alien_2",
					engine_length = 0.36,
					engine_width = 0.36,
					boost_length = 0.24,
					boost_width = 0.24,
					engine_flare_offset = -0.04,
					boost_flare_offset = -0.04,
					engine_light_offset = -1.0,
				},
				R11 =
				{
					boost_effect = "particles/ships/ship_engine_alien_2",
					engine_effect = "particles/ships/ship_engine_alien_2",
					engine_length = 0.42,
					engine_width = 0.42,
					boost_length = 0.24,
					boost_width = 0.24,
					engine_flare_offset = -0.14,
					boost_flare_offset = 0.09,
					engine_light_offset = -1.0,
				},
				R13 =
				{
					boost_effect = "particles/ships/ship_engine_alien_ball_2",
					engine_effect = "particles/ships/ship_engine_alien_ball_2",
					engine_length = 0.3375,
					engine_width = 0.45,
					boost_length = 0.225,
					boost_width = 0.30,
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					engine_flare_offset = -0.28,
					boost_flare_offset = -0.20,
					engine_light_offset = -1.0,
				},
				--Race_Large_salamander
				salamander =
				{
					boost_effect = "particles/ships/engine_h_chinese_frigate_boost",
					engine_effect = "particles/ships/engine_h_chinese_frigate",
					engine_length = 0.3375,
					engine_width = 0.45,
					boost_length = 0.225,
					boost_width = 0.30,
					engine_min_length_factor = 0.25,
					engine_min_width_factor = 1.0,
					engine_flare_offset = -0.28,
					boost_flare_offset = -0.20,
					engine_light_offset = -1.0,
					trail_color = "42 149 255 255",
				},
				helicon = 
				{
					frigate = 
					{
						boost_effect = "particles/ships/ship_helicon_boost",
						engine_effect = "particles/ships/ship_helicon_eng",
						boost_length = 0.75,
						boost_width = 0.17,
						trail_size = 0.05,
						engine_length = 1.0,
						engine_width = 1.0,
						engine_flare_size = 0.0,
						boost_flare_size = 0.25,
						boost_flare_offset = -0.425,
						engine_light_radius = 20,
						engine_light_offset = -2.0,
						engine_light_color		= "122 210 250 255",
						engine_glow_intensity_min = 0.00001;
						engine_glow_intensity_max = 1.00;
						engine_flare_color		= "255 224 178 0",
						boost_flare_color		= "122 210 250 30",
						engine_flame_acceleration_time_interval = 3.0,
						engine_glow_acceleration_time_interval = 1.0,
						engine_min_length_factor = 0.1,
						engine_min_width_factor = 1.0,
						engine_glow_shutdown_time_interval = 0.8,
						engine_flame_shutdown_time_interval = 0.45,
						trail_color = "42 149 255 155",
					},
				},
				helios = 
				{
					frigate = 
					{
						boost_effect = "particles/ships/r5_l_helios_boost",
						engine_effect = "particles/ships/r5_l_helios_eng",
						boost_length = 0.75,
						boost_width = 0.17,
						trail_size = 0.05,
						engine_length = 1.0,
						engine_width = 1.0,
						engine_flare_size = 0.0,
						boost_flare_size = 0.0,
						boost_flare_offset = -0.425,
						engine_light_radius = 20,
						engine_light_offset = -2.0,
						engine_light_color		= "233 160 100 255",
						engine_glow_intensity_min = 0.00001;
						engine_glow_intensity_max = 1.00;
						engine_flare_color		= "255 224 178 0",
						boost_flare_color		= "122 210 250 30",
						engine_flame_acceleration_time_interval = 3.0,
						engine_glow_acceleration_time_interval = 1.0,
						engine_min_length_factor = 0.1,
						engine_min_width_factor = 1.0,
						engine_glow_shutdown_time_interval = 0.8,
						engine_flame_shutdown_time_interval = 0.45,
						trail_effect = "particles/ships/ship_trail_helios",
						trail_color = "233 160 100 155",
						trail_size = 0.12,
					},
				},
			},
			Huge =
			{
				trail_size = 0.15,
				boost_effect = "particles/ships/engine_h",
				engine_effect = "particles/ships/engine_h",
				engine_flare_size = 0.8,
				boost_flare_size = 0.6,
				engine_light_radius = 35,
				engine_light_offset = 0.0,
				boost_loop_sound = "sound/boost/huge_alien_start_loop",
				boost_stop_sound = "sound/boost/huge_alien_end",
				engine_sound = "sound/engine/alien/huge_loop",
				engine_flame_acceleration_time_interval = 3.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_min_length_factor = 0.25,
				engine_min_width_factor = 1.0,
				engine_glow_shutdown_time_interval = 1.25,
				engine_flame_shutdown_time_interval = 1.0,
				R5 =
				{
					boost_effect = "particles/ships/ship_engine_alien_1",
					engine_effect = "particles/ships/ship_engine_alien_1",
					engine_length = 0.2,
					engine_width = 0.32,
					engine1_length = 0.2,
					engine1_width = 0.32,
					engine2_length = 0.2,
					engine2_width = 0.32,
					engine3_length = 0.2,
					engine3_width = 0.32,
					engine4_length = 0.2,
					engine4_width = 0.32,
					engine5_length = 0.2,
					engine5_width = 0.32,
					boost_length = 0.225,
					boost_width = 0.36,
					engine_flare_color		= "122 233 255 0",
					boost_flare_color		= "122 233 255 0",
					engine_flare_offset = 0.0,
					boost_flare_offset = 0.0,
					engine_flare_offset = -0.65,
					boost_flare_offset = -0.12,
					engine_light_offset = -3.0,
				},
				R11 =
				{
					boost_effect = "particles/ships/ship_engine_alien_1",
					engine_effect = "particles/ships/ship_engine_alien_1",
					engine_length = 0.281,
					engine_width = 0.45,
					engine1_length = 0.281,
					engine1_width = 0.45,
					engine2_length = 0.281,
					engine2_width = 0.45,
					engine3_length = 0.281,
					engine3_width = 0.45,
					engine4_length = 0.281,
					engine4_width = 0.45,
					engine5_length = 0.281,
					engine5_width = 0.45,
					boost_length = 0.225,
					boost_width = 0.36,
					engine_light_color		= "128 212 255 100",
					engine_flare_color		= "154 233 255 11",
					boost_flare_color		= "154 233 255 15",
					engine_flare_offset = -0.5,
					boost_flare_offset = -0.1,
					engine_flare_size = 0.3,
					boost_flare_size = 0.3,
					engine_light_offset = -3.0,
				},
				R13 =
				{
					boost_effect = "particles/ships/ship_engine_alien_ball_22",
					engine_effect = "particles/ships/ship_engine_alien_ball_22",
					engine_length = 0.66,
					engine_width = 0.66,
					engine1_length = 0.66,
					engine1_width = 0.66,
					boost_length = 0.32,
					boost_width = 0.32,
					engine_flare_size = 0.5,
					boost_flare_size = 0.25,
					engine_flare_offset = -0.6,
					boost_flare_offset = -0.3,
					engine_flare_color		= "207 178 255 20",
					boost_flare_color		= "207 178 255 17",
					engine_light_color		= "207 178 255 100",
					engine_light_offset = -4.0,
				},
				t5 =
				{
					Bashe =
					{
						boost_effect = "particles/ships/engine_h_t5_bashe_boost",
						engine_effect = "particles/ships/engine_h_t5_bashe",
						boost_loop_sound = "sound/boost/salut_start_loop",
						boost_stop_sound = "sound/boost/salut_boost_end",
						engine_sound = "sound/engine/salut_loop",
						engine_length = 0.1,
						engine_width = 0.05,
						boost_length = 0.08,
						boost_width = 0.04,
						engine_light_color 		= "255 230 147 255",
						engine_flare_color		= "255 178 102 30", 
						boost_flare_color		= "255 178 102 25",
						engine_flare_size = 0.0,
						boost_flare_size = 0.00,
						engine_flare_offset = -0.0,
						boost_flare_offset = -0.02,
						engine_light_radius = 2,
						engine_light_offset = -1.3,
						trail_color = "255 202 126 255",
					},
					saturn =
					{
						boost_effect = "particles/ships/ship_engine_saturn",
						boost1_effect = "particles/ships/ship_engine_saturn",
						engine_effect = "particles/ships/ship_engine_saturn",
						boost_loop_sound = "sound/boost/salut_start_loop",
						boost_stop_sound = "sound/boost/salut_boost_end",
						engine_sound = "sound/engine/salut_loop",
						engine_length = 0.484,
						engine_width = 0.484,
						engine_min_width_factor = 0.0,
						engine_min_length_factor = 0.0,
						engine_flame_acceleration_time_interval = 1.0,
						engine_flame_shutdown_time_interval = 1.0,
						engine_glow_acceleration_time_interval = 0.5,
						engine_glow_shutdown_time_interval = 1.0,
						boost_length = 0.33,
						boost_width = 0.33,
						boost1_length = 0.33,
						boost1_width = 0.33,
						engine_flare_color = "255 204 127 48",
						boost_flare_color = "255 204 127 48",
						engine_flare_size = 0.9,
						boost_flare_size = 0.5,
						engine_flare_offset = -0.4,
						boost_flare_offset = -0.4,
						trail_color = "255 230 147 255",
						engine_light_color = "255 235 169 192",
						engine_light_radius = 25,
						engine_light_offset = -3.0,
						engine_glow_intensity_min = 0.0001;
						engine_glow_intensity_max = 0.6;
						engine_factor = 1.0,
					},
					
				},
			},
			-- COMMAND
			Medium2 =
			{
				R5 =
				{
				},
			},
		},
		UFO =
		{
			Large = 
			{
				boost_loop_sound = "sound/boost/ufo_start_loop",
				boost_stop_sound = "sound/boost/ufo_end",
				engine_sound = "sound/engine/ufo_loop",
				
				engine_flare_color		= "255 224 178 0",
				boost_flare_color		= "255 224 178 0",
				engine_light_color		= "145 96 51 48",
				trail_color = "121 36 1 100",
				boost_effect = "",
				engine_effect = "particles/ships/engine_ufo2",
				engine_length = 1.0,
				engine_width = 1.0,
				engine_min_width_factor = 1.0,
				engine_min_length_factor = 0.0,
				engine_glow_acceleration_time_interval = 1.0,
				engine_glow_shutdown_time_interval = 1.0,
				engine_glow_intensity_min = 0.0001;
				engine_glow_intensity_max = 1.0;
			},
		},
		UFOBALL = 
		{
			trail_effect = "particles/ships/ship_trail_no_velocity",
			trail_color = "0 120 255 100",
			trail_size = 0.07,
			engine_light_radius = 20,
			engine_light_offset = 0.0,
			engine_light_color = "175 222 255 100",
			boost_loop_sound = "sound/boost/ufo_start_loop",
			boost_stop_sound = "sound/boost/ufo_end",
			engine_sound = "sound/engine/ufo_loop",	
			engine_glow_acceleration_time_interval = 0.8,
			engine_glow_shutdown_time_interval = 1.2,
			engine_flame_acceleration_time_interval = 3.0,
			engine_flame_shutdown_time_interval = 0.5,
			engine_glow_intensity_min = 0.0000;
			engine_glow_intensity_max = 0.7;
			engine_min_length_factor = 0.5,
			engine_min_width_factor = 1.0,
			boost_effect = "particles/null",
			engine_effect = "particles/ships/ship_engine_ufoball",
			engine_length = 0.5,
			engine_width = 1.0,
			engine_flare_size = 0.0,
			boost_flare_size = 0.0,
			engine_flare_color = "153 204 255 0",
			boost_flare_color = "153 204 255 0",
			Medium = 
			{
				trail_color = "0 120 255 100",
			},
			MediumR = 
			{
				trail_color = "255 0 0 100",
			},
			MediumG = 
			{
				trail_color = "0 255 0 100",
			},
			MediumB = 
			{
				trail_color = "0 100 255 100",
			},
			MediumY = 
			{
				trail_color = "255 215 0 100",
			},
		},
		alien =
		{
--			engine_sound_left = "sound/engine/left_engine",
--			engine_sound_right = "sound/engine/right_engine",
			trail_effect = "particles/ships/ship_trail",
			trail_color = "0 205 71 100",
			
			--ship large precursor Ship_Leviathan_H
			
			engine =
			{
				trail_size = 0.1,
				engine_flare_color		= "255 255 255 0",
				boost_flare_color		= "255 255 255 0",

				boost_effect = "particles/null",
				engine_effect = "particles/null",
				engine_length = 0.275,
				engine_width = 0.275,

				engine_flare_size = 0.1,
				boost_flare_size = 0.1,
				engine_light_color		= "128 255 191 255",
				engine_light_radius = 20,
				boost_loop_sound = "sound/boost/alien/huge_start_loop",
				boost_stop_sound = "sound/boost/alien/huge_end",
				engine_sound = "sound/engine/alien_loop",
				engine_sound_right = "sound/engine/el_right_engine",
				engine_sound_left = "sound/engine/el_left_engine",					
				
			},
			--Alien Scout pz1k
			purple =
			{
				trail_size = 0.1,
				trail_color = "30 1 64 100",
				engine_flare_color		= "255 255 255 0",
				engine_light_color		= "255 255 255 0",
				boost_flare_color		= "255 255 255 0",

				boost_effect = "particles/null",
				engine_effect = "particles/null",

				engine_flare_size = 0.1,
				boost_flare_size = 0.1,
				engine_light_radius = 1,
				boost_loop_sound = "sound/boost/alien_start_loop",
				boost_stop_sound = "sound/boost/alien_end",
				engine_sound = "sound/engine/alien_loop",		
				
			},
			--predator Ship_Leviathan_L
			predator = 
			{
				engine =
				{
					trail_size = 0.1,
					engine_light_color		= "128 255 191 255",
					engine_effect = "particles/ships/ship_engine_g4",
					boost_effect = "particles/ships/ship_engine_g4",
					engine_length = 0.3,
					engine_width = 0.3,
					engine_flare_color		= "45 182 129 44",
					engine_flare_size = 0.55,
					engine_flare_offset = -0.5,
					engine_glow_intensity_min = 0.1;
					engine_glow_intensity_max = 1.0;
					engine_light_radius = 20,
					engine_light_offset = -2,
					boost_flare_color		= "45 182 129 16",
					boost_flare_size = 0.16,
					boost_flare_offset = -0.1,
					boost_length = 0.06,
					boost_width = 0.06,
					boost1_length = 0.06,
					boost1_width = 0.06,
					boost2_length = 0.06,
					boost2_width = 0.06,
					boost3_length = 0.06,
					boost3_width = 0.06,
					boost4_length = 0.08,
					boost4_width = 0.08,
					
					boost_loop_sound = "sound/boost/alien/large_start_loop",
					boost_stop_sound = "sound/boost/alien/large_end",
					engine_sound = "sound/engine/alien_large_loop",		
					engine_sound_right = "sound/engine/el_right_engine",
					engine_sound_left = "sound/engine/el_left_engine",						
				},
			},
			--interceptor Ship_Leviathan_M
			interceptor = 
			{
				engine =
				{
					trail_size = 0.1,
					engine_flare_color		= "45 182 129 64",
					engine_flare_size = 0.5,
					engine_flare_offset = 0.0,
					engine_light_color		= "128 255 191 255",
					engine_light_radius = 20,
					engine_light_offset = -2,
					engine_effect = "particles/ships/ship_engine_g4",
					engine_length = 0.2,
					engine_width = 0.2,
					
					boost_loop_sound = "sound/boost/alien/medium_start_loop",
					boost_stop_sound = "sound/boost/alien/medium_end",
					engine_sound = "sound/engine/alien/medium_loop",
					engine_sound_right = "sound/engine/el_right_engine",
					engine_sound_left = "sound/engine/el_left_engine",	
					
					engine_glow_intensity_min = 1.0;
					engine_glow_intensity_max = 1.0;
				},
				
				big =
				{
					engine =
					{
						trail_size = 0.4,
						engine_flare_color		= "45 182 129 16",
						engine_light_color		= "255 255 255 0",
						boost_flare_color		= "45 182 129 16",

						engine_effect = "particles/ships/ship_engine_g4",
						engine_length = 0.8,
						engine_width = 0.5,

						engine_flare_size = 1.75,
						engine_light_radius = 1.5,
						boost_loop_sound = "sound/boost/huge_alien_start_loop",
						boost_stop_sound = "sound/boost/huge_alien_end",
						engine_sound = "sound/engine/alien/huge_loop",			
					},
				},
			},	
			--reaver Ship_Leviathan_S
			r2 = 
			{
				m =
				{
					engine =
					{
						trail_size = 0.05,
						engine_flare_color		= "45 182 129 16",
						engine_light_color		= "128 255 191 255",
						boost_flare_color		= "45 182 129 16",

						boost_effect = "particles/ships/ship_engine_g4",
						engine_effect = "particles/ships/ship_engine_g4",
						engine_length = 0.15,
						engine_width = 0.1,
						boost_length = 0.11,
						boost_width = 0.075,

						engine_flare_size = 0.2,
						engine_flare_offset = -0.2,
						boost_flare_offset = -0.2,
						boost_flare_size = 0.2,
						engine_light_radius = 15,
						
						engine_sound = "sound/engine/alien/small_loop",
	
						boost_loop_sound = "sound/boost/alien/small_start_loop",
						boost_stop_sound = "sound/boost/alien/small_end",
						engine_sound_right = "sound/engine/el_right_engine",
						engine_sound_left = "sound/engine/el_left_engine",	
					},
				},
			},
			--biomorph
			kiber =
			{
				engine =
				{
					trail_size = 0.1,
					engine_flare_color		= "45 182 129 16",
					engine_light_color		= "51 145 96 48",
					boost_flare_color		= "45 182 129 16",

					engine_effect = "particles/ships/ship_engine_g4",
					engine_length = 0.29,
					engine_width = 0.18,

					engine_flare_size = 1.0,
					engine_light_radius = 15,
					
					engine_sound = "sound/engine/large_loop",
					engine_sound_left = "sound/engine/left_engine",
					engine_sound_right = "sound/engine/right_engine",
						
					boost_loop_sound = "sound/boost/large_start_loop",
					boost_stop_sound = "sound/boost/large_end",
				},
			},			
		},
		engine_glow_intensity_min = 0.0;
		engine_glow_intensity_max = 1.0;
		engine_flare_offset = 0.0,
		boost_flare_offset = 0.0,
		boost_effect = "particles/ships/ship_engine_y3",
		engine_effect = "particles/ships/ship_engine_y3",
		dead_boost_effect = "particles/ships/ship_engine_dead",
		dead_engine_effect = "particles/ships/ship_engine_dead",
		boost_flare_angle = 100,
		boost_flare_color = "96 153 247 23",
		boost_flare_nebulosity = 0.6,
		engine_flare_angle = 90,
		engine_flare_color = "96 153 247 23",
		engine_flare_size = 0.85,
		engine_flare_nebulosity	= 0.6,
		engine_light_color = "96 153 247 255",
		engine_light_radius = 4,
		trail_effect = "particles/ships/ship_trail",
		trail_effect_bone = "exhaust",
		-- engine_sound_left = "sound/engine/left_engine", --убрал внутрь вложенных массивов #85471
		-- engine_sound_right = "sound/engine/right_engine", --убрал внутрь вложенных массивов #85471
		crit_boost_flare_color = "243 103 87 15", --247 111 99
		crit_engine_flare_color = "247 103 87 15",
		-- engine_length * engine_factor, engine_factor min = 0 max = 1
		engine_factor = 1.0,
		broken_time = 4.0,
	},
	Ship =
	{
		Bot =
		{
			death_sound = "sound/explosion/ship_meat_expl",
		},
		UFO =
		{
			rcs_color = "255 255 255 100",
			rcs_size = 0.04,
			rcs_effect = "particles/ships/rcs_ufo",
		},
		Race1 =
		{
			rcs_color = "255 164 128 100",
			H=
			{
				rcs_effect = "particles/ships/ship_rcs_huge",
				rcs_size = 0.16,
				T3 =
				{
					rcs_size = 0.1,
				},
				T4 =
				{
					rcs_size = 0.08,
					rcs_color = "255 153 102 100",
				},
				T5 =
				{
					rcs_color = "255 143 102 100",
					rcs_effect = "particles/ships/rcs_ion_huge_yellow_t5",
					Uniq = 
					{
						rcs_size = 0.08,
						rcs_color = "255 127 76 100",
						rcs_effect = "particles/ships/ship_rcs_huge",
						rcs_force_min = 0.035,
					},
				},
			},
			L =
			{
				rcs_size = 0.09,
				T2 =
				{
					rcs_size = 0.09,
				},
				T3 =
				{
					Pirate =
					{
						rcs_size = 0.07,
						rcs_color = "255 51 51 100",
					},
				},
				T4 =
				{
					rcs_size = 0.09,
					
					PremUniq =
					{
						rcs_color = "120 220 245 100",
						rcs_size = 0.05,
					},
					
					CraftUniq = 
					{
						rcs_color = "255 185 128 100",
						death_effect = "particles/explosions/explosion_big1",
						rcs_size = 0.06,
						
						-- S ship
						-- Race1_L_T4_CraftUniq_small
						-- Мелкая спираль
						small =
						{
							rcs_size = 0.02,
						},
						
					},
				},
				T5 =
				{
					Craft =
					{
						rcs_size = 0.05,
					},
					PremUniq =
					{
						rcs_color = "255 150 128 100",
						rcs_size = 0.09,
					},
					Sniper = 
					{
						rcs_color = "255 138 43 100",
						rcs_size = 0.05,
					},
					Thrasher = 
					{
						rcs_color = "191 48 84 100",
						rcs_size = 0.1,
					},
					Nordstorm =
					{
						rcs_color = "191 48 84 100",
						rcs_size = 0.1,
					},
					Psiloi =
					{
						rcs_color = "233 160 100 155",
						rcs_size = 0.045,
					},
				},
			},
			M =
			{
				rcs_size = 0.04,
				T1 =
				{
					rcs_size = 0.03,
					rcs_color = "255 183 153 100",
				},
				T2 =
				{
					Pirate =
					{
						rcs_color = "255 71 102 100",
						rcs_size = 0.03,
					},
				},
				T4 =
				{
					Steam =
					{
						rcs_size = 0.04,
						rcs_color = "255 178 115 100",
					},
				},
				T5 =
				{
					Craft =
					{
						rcs_size = 0.05,
						rcs_color = "236 97 30 100",
					},
					Granite =
					{
						rcs_size = 0.03,
						rcs_color = "255 109 87 100",
					},
					Dlc = 
					{
						rcs_size = 0.03,
						rcs_color = "255 203 128 100",
					},
					Typhon =
					{
						rcs_color = "153 84 15 100",
						rcs_size = 0.033,
					},
					Bark =
					{
						rcs_color = "255 143 64 100",
						rcs_size = 0.035,
						rcs_effect = "particles/ships/rcs_il2",
					},
					Chaos =
					{
						rcs_color = "255 203 98 100",
						rcs_size = 0.02,
					},
				},
			},
			S =
			{
				rcs_size = 0.02,
				T3 =
				{
					Pirate =
					{
						rcs_color = "228 69 69 100",
					},
				},
				T5 =
				{
					CorVulnus =
					{	
						rcs_size = 0.03,
						rcs_color = "255 121 188 100",
					},
					Craft =
					{	
						rcs_size = 0.02,
					},
					Nordstorm =
					{
						rcs_color = "255 160 64 100",
						rcs_size = 0.045,
					},
				},
			},
		},
		Race2 =
		{
			rcs_without_boost = 0.25,
			rcs_color = "255 85 76 100",
			H =
			{
				rcs_size = 0.12,
				rcs_effect = "particles/ships/ship_rcs_huge",
				T3 =
				{
					rcs_color = "255 100 89 100",
				},
				T4 =
				{
					rcs_color = "255 98 89 100",
				},
				T5 =
				{
					rcs_effect = "particles/ships/rcs_ion_huge_red_t5",
					rcs_color = "255 101 87 100",
					Relic =
					{
						rcs_color = "191 60 48 100",
						rcs_effect = "particles/ships/rcs_ion_huge_red_t5_relic",
						rcs1_effect = "particles/ships/ship_rcs_huge",
						rcs_size = 0.1,
					},
				},
			},
			L =
			{
				rcs_size = 0.08,
				T2 =
				{
					rcs_size = 0.06,
				},
				T5 =
				{
					Craft =
					{	
						rcs_size = 0.06,
						rcs_color = "227 51 45 100",
					},
					CraftUniq =
					{	
						rcs_size = 0.05,
						rcs_color = "128 36 26 100",
					},
					Protozan =
					{
						rcs_size = 0.05,
						rcs_color = "255 62 52 100",
					},
					Naglfar = 
					{
						rcs_size = 0.08,
						rcs_color = "51 64 13 100",
					},
					Dino =
					{
						rcs_size = 0.05,
						rcs_color = "255 64 26 100",
					},
					Carolingian =
					{
						rcs_size = 0.05,
						rcs_color = "255 64 26 100",
					},
				},
			},
			M =
			{
				rcs_size = 0.04,
				T1 =
				{
					rcs_size = 0.03,
				},
				T2 =
				{
					Steam =
					{
						rcs_size = 0.03,
					}
					
				},
				T5 =
				{
					Craft =
					{
						rcs_size = 0.06,
						rcs_color = "255 66 49 100",
					},
					CraftUniq =
					{
						rcs_size = 0.03,
					},
					Baphomet =
					{
					    rcs_effect = "particles/ships/ship_rcs_huge",
						rcs_size = 0.03,
						rcs_color = "255 66 49 100",
					},
				},	
				T4 =
				{
					PremUniq =
					{
						rcs_size = 0.03,
						rcs_color = "118 209 255 100",
					},
				},	
			},
			S =
			{
				rcs_size = 0.02,
				T5 =
				{
					Craft =
					{
						rcs_size = 0.04,
						rcs_color = "255 64 64 100",
					},
					Pilum =
					{
						rcs_size = 0.06,
						rcs_color = "255 64 64 100",
					},
				},
				T3 = 
				{
					Pirate =
					{
						rcs_size = 0.02,
						rcs_color = "255 71 102 100",
					},
				},
			},
		},
		Race3 =
		{
			rcs_without_boost = 0.2,
			rcs_color = "89 131 255 100",
			H =
			{
				rcs_effect = "particles/ships/ship_rcs_huge",
				rcs_without_boost = 0.15,
				rcs_size = 0.12,
				T5=
				{
					rcs_size = 0.11,
					rcs_color = "115 208 255 100",
					Uniq = 
					{
						rcs_effect = "particles/ships/ship_rcs",
						rcs_size = 0.09,
						rcs_color = "59 190 255 100",
						small =
						{
							rcs_size = 0.05,
						},
					},
				},
				T3 =
				{
					rcs_color = "128 217 255 100",
					rcs_effect = "particles/ships/rcs_ion_r3_t3",
					rcs1_effect = "particles/ships/rcs_ion_r3_t3_1",
					rcs2_effect = "particles/ships/rcs_ion_r3_t3_2",
					dead_rcs1_effect = "particles/ships/rcs_dead",
				},
				T4 =
				{
					rcs_without_boost = 0.1,
					rcs_color = "69 146 255 100",
					rcs_size = 0.14,
				},
			},
			L =
			{
				rcs_size = 0.08,
				T3 =
				{
					Pirate =
					{
						rcs_size = 0.06,
						rcs_color = "255 51 51 100",
					},
					PremUniq =
					{
						rcs_size = 0.12,
						rcs_color = "21 80 255 100",
					},
				},
				T4 =
				{
					-- Shuttle
					CraftUniq = 
					{
						rcs_size = 0.08,
					},
				},
				T5 =
				{
					CraftSpec = 
					{
						rcs_size = 0.08,
						rcs_color = "38 75 128 100",
					},
					Shrike =
					{
						rcs_size = 0.1,
						rcs_color = "230 120 40 100",
					},
				},
			},
			M =
			{
				rcs_size = 0.055,
				T2 =
				{
					Pirate =
					{
						rcs_color = "255 71 102 100",
					},
				},
				T4 =
				{
					PremUniq =
					{
						rcs_size = 0.05,
					},
				},
				T5 =
				{
					Manul = 
					{
						rcs_size = 0.07,
					},
					Wolfhound = 
					{
						rcs_size = 0.03,
					},
				},
			},
			S =
			{
				rcs_size = 0.04,
				T3 =
				{
					Pirate =
					{
						rcs_size = 0.03,
						rcs_color = "255 71 102 100",
					},
				},
				T4 = 
				{
					PremUniq =
					{
						rcs_size = 0.03,
					},
				},
				T5 =
				{
					--wolverine
					CraftUniq =
					{
						rcs_size = 0.025,
						rcs_color = "131 234 255 100",
					},
					CraftSpec = 
					{
						rcs_size = 0.025,
					}
				},
			},
		},
		Race5 =
		{
			rcs_color = "20 80 255 100",
			rcs_size = 0.08,
			S=
			{
				T5 =
				{
					Ace =
					{
						rcs_size = 0.05,
						rcs_color = "28 135 235 100",
						rcs_effect = "particles/ships/ship_rcs",
					},
				},
			},
			HUGE=
			{
				SATURN =
				{
					rcs_size = 0.2,
					rcs_color = "255 187 127 100",
					rcs_effect = "particles/ships/ship_rcs",
				},
			},
			H=
			{
				T5 =
				{
					Bashe =
					{
						rcs_size = 0.15,
						rcs_color = "233 160 100 155",
						rcs_effect = "particles/ships/ship_rcs",
					},
				},
			},
			L =
			{
				rcs_color = "20 170 255 100",
				rcs_size = 0.09,
		
				T5 =
				{
					Salamander =
					{
						rcs_size = 0.09,
					},
					Helios =
					{
						rcs_size = 0.09,
						rcs_color = "233 160 100 155",
					},
				},
			},
			M =
			{
				T5 =
				{
					Amber  =
					{
						rcs_size = 0.09,
						rcs_color = "233 60 30 100",
					},
					Apeiron = 
					{
						rcs_size = 0.0,
						--rcs_effect = "particles/ships/rcs_ball",
						--rcs1_effect = "particles/ships/rcs_ball",
					},
				},
			},
		},
		ZM =
		{
			Aliens =
			{
				spawn_warp_effect_end = "particles/empty",
			},
		},
		Salyut =
		{
			S =
			{
				ECM =
				{
					rcs_color = "191 138 76 100",
					rcs_size = 0.02,
					rcs_effect = "particles/ships/rcs_salyut",
				},
				
			},
		},
		Helicon =
		{
			L =
			{
				SNIPER =
				{
					rcs_color = "122 210 255 100",
					rcs_size = 0.08,
				},
			},
		},
		rcs_effect = "particles/ships/ship_rcs",
		rcs_without_boost = 0.15,
		dead_rcs_effect = "particles/ships/rcs_dead",
		agony_sound = "sound/game/agony",
		crash_screen_effect = "particles/screen/interference",
		incoming_rocket_sound = "sound/gadgets/incoming_rocket",
		lock_by_enemy_sound = "sound/gadgets/locked_by_enemy",
		lock_sound = "sound/gadgets/target_locked",
		locking_sound = "sound/gadgets/locking",
		silence_effect = "particles/ships/crit_modul_m",
		silence_sound = "sound/aura/stun",
		spawn_warp_effect_end = "particles/ships/warp_exit",
		spawn_warp_effect_loop = "particles/null",
		spawn_warp_sound_end = "sound/gadgets/spawn_warp_end",
		spawn_warp_sound_loop = "sound/gadgets/spawn_warp_start_loop",
	},

	GuidedMissile =
	{
		flare_angle = 180,
		flare_color = "255 100 100 10",
		flare_size = 0.1,
		flare_nebulosity = 0.2,
		effect = "particles/weapons/missile/rocket_trail_mid",
		
		rocket_direct_hit_sound = "sound/hit/rocket_direct_hit",
	},
	SpaceMissile =
	{
		flare_angle = 180,
		flare_color = "255 150 100 5",
		flare_size = 0.0,
		flare_nebulosity = 0.2,
		effect = "particles/weapons/missile/rocket_trail_mid",
		model = "models/weapons/bs_torpedo_mid",
		smooth_effect_param = true,
		
		rocket_direct_hit_sound = "sound/hit/rocket_direct_hit",
		-- for S ship
		EnergyNullifierField =
		{
			launch_sound = "sound/weapons/rockets/rocket_aamu_t5_launch",
			effect = "particles/weapons/missile/rocket_trail_small",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		-- for M ship
		PropulsionJammField =
		{
			launch_sound = "sound/weapons/rockets/kinetic_launch",
			sound = "sound/explosion/rocket_expl",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		AAMEMP =
		{
			work_sound = "sound/weapons/rockets/rocket_fly",
			launch_sound = "sound/weapons/rockets/rocket_aamu_t4_launch",
			effect = "particles/weapons/missile/rocket_trail_small",
			T2 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t2_launch",
			},
			T3 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t3_launch",
			},
			T4 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t4_launch",
			},
			T5 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t5_launch",
			},
		},
		AAMKin =
		{
			launch_sound = "sound/weapons/rockets/rocket_aamu_t5_launch",
			effect = "particles/weapons/missile/rocket_trail_small",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		AAMSlow =
		{
			launch_sound = "sound/weapons/rockets/rocket_nurs_launch",
			effect = "particles/weapons/missile/rocket_trail_small",
			work_sound = "sound/weapons/rockets/rocket_fly",
			T2 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t2_launch",
			},
			T3 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t3_launch",
			},
			T4 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t4_launch",
			},
			T5 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t5_launch",
			},
		},
		-- for L ship
		Volley =
		{
			launch_sound = "sound/weapons/rockets/volley_launch",
			effect = "particles/weapons/missile/rocket_trail_mid",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		-- for S ship
		Barrage =
		{
			launch_sound = "sound/weapons/rockets/barrage",
			effect = "particles/weapons/missile/rocket_trail_small",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		
		Helloween =
		{
			launch_sound = "sound/weapons/rockets/barrage",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},	
		-- for L ship		
		Cruise =
		{
			launch_sound = "sound/weapons/rockets/rocket_cruise_launch",
			flare_color = "255 150 100 15",
			work_sound = "sound/weapons/rockets/rocket_fly",
			
		},
		
		DoomDay =
		{
			launch_sound = "sound/weapons/rockets/rocket_cruise_launch",
			flare_color = "255 150 100 15",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		
		EMP =
		{
			launch_sound = "sound/weapons/rockets/rocket_EMP_launch",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		Ion =
		{
			launch_sound = "sound/weapons/rockets/rocket_ion_launch",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		Standart =
		{
			launch_sound = "sound/weapons/rockets/rocket_EMP_launch",
			work_sound = "sound/weapons/rockets/rocket_fly",
			
		},
		-- for L ship
		Torpedo =
		{
			launch_sound = "sound/weapons/rockets/rocket_torpedo_launch",
			effect = "particles/weapons/missile/destroyer_rocket_trail",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		AnomalyRocket =
		{
			launch_sound = "sound/weapons/rockets/rocket_torpedo_launch",
			effect = "particles/weapons/missile/destroyer_rocket_trail",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		AAMu =
		{
			effect = "particles/weapons/missile/rocket_trail_small",
			launch_sound = "sound/weapons/rockets/rocket_nurs_launch",
			work_sound = "sound/weapons/rockets/rocket_nurs_fly",
			T2 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t2_launch",
			},
			T3 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t3_launch",
			},
			T4 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t4_launch",
			},
			T5 =
			{
				launch_sound = "sound/weapons/rockets/rocket_aamu_t5_launch",
			},
			Premium =  -- праздничная ракета на день космонавтики
			{
				funny =
				{
					effect = "particles/weapons/firework_trail",
					launch_sound = "sound/weapons/ny/ny_rocket_launch",
				}
			},
			Christmas = -- рождественские ракеты
			{
				effect = "particles/weapons/firework_trail",
				launch_sound = "sound/weapons/ny/ny_rocket_launch",
				T2 = {
					flare_color = "100 150 255 15",
					effect = "particles/weapons/firework_trail2",
				}
			}
		},
		Kinetic =
		{
			launch_sound = "sound/weapons/rockets/kinetic_launch",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		DeathRay =
		{
			beam_effect = "particles/weapons/deathray/beam",
			hit_effect = "particles/weapons/deathray/charge",
			fail_sound = "sound/weapons/deathray/dr_fail",
			work_sound = "sound/weapons/deathray/dr_charging",
			model = "models/misc/invisible_model",
		},
		MineField =
		{
			work_effect_s1 = "particles/gadget/minefield_friendly",
			work_effect_s2 = "particles/gadget/minefield",			
			shot_effect_s1 = "particles/gadget/minefield_deploy_friendly",
			shot_effect_s2 = "particles/gadget/minefield_deploy",
			launch_sound = "sound/gadgets/FrigateDrone/fd_launch",
			model = "models/misc/invisible_model",
		},
		ProximityMine =
		{
			work_effect_s1 = "particles/gadget/mine_friendly",
			work_effect_s2 = "particles/gadget/mine",
			launch_sound = "sound/gadgets/FrigateDrone/fd_launch",
			model = "models/misc/invisible_model",
		},
		CageTrapMine =
		{
			flare_angle = 0,
			flare_size = 0,
			work_effect_s1 = "particles/gadget/mine_friendly",
			work_effect_s2 = "particles/gadget/mine",
			effect = "particles/null",
			launch_sound = "sound/gadgets/FrigateDrone/fd_launch",
			model = "models/turret/biglightninggun/h_mine",
		},
		Nuke =
		{
			flare_angle = 0,
			flare_size = 0,
			effect = "particles/weapons/nuke/workflare",
			launch_sound = "sound/weapons/nuke/NukeBomb_launch",
			work_sound = "sound/weapons/nuke/nuke_fly",
			model = "models/weapons/missile_torpedo2",
		},
		Fireworks =
		{
			launch_sound = "sound/weapons/ny/ny_rocket_launch",
			work_sound = "sound/weapons/ny/ny_rocket_fly",
			effect = "particles/weapons/firework_trail",
			T2 =
				{
					effect = "particles/weapons/firework_trail2",
				},
			T4 =
				{
					effect = "particles/weapons/firework_trail2",
				},
		},
		NewYear =
		{
			launch_sound = "sound/weapons/ny/ny_rocket_launch",
			work_sound = "sound/weapons/rockets/rocket_nurs_fly",
			effect = "particles/weapons/firework_trail",
		},
		April =
		{
			launch_sound = "sound/weapons/rockets/pizza_rocket_launch",
--			work_sound = "sound/weapons/rockets/pizza_fly",
			effect = "particles/weapons/missile/rocket_trail_april",
			model = "models/objects/gameplay/event/event_aprile_pizza_rocket/event_aprile_pizza_rocket"
		},
		HealParts =
		{
			launch_sound = "sound/weapons/rockets/rocket_EMP_launch",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		ResistSub =
		{
			launch_sound = "sound/weapons/rockets/rocket_EMP_launch",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		ChildRockets =
		{
			launch_sound = "sound/weapons/rockets/rocket_EMP_launch",
			work_sound = "sound/weapons/rockets/rocket_fly",
		},
		ChainRockets =
		{
			flare_angle = 0,
			flare_size = 0,
			launch_sound = "sound/gadgets/Vortex/Vortex_fire",
			work_sound = "sound/gadgets/Vortex/vortex_fly",
			effect = "particles/weapons/vortex/projectile",
			model = "models/misc/invisible_model",
		},
		MagnetMine =
		{
			flare_angle = 0,
			flare_size = 0,
			launch_sound = "sound/el_modules/ElCommonActivate",
			work_sound = "sound/el_modules/MagnetMine_idle",
			effect = "particles/weapons/nuke/alien_workflare",
			model = "particles/models/green_beacon",
		},
		ZM =
		{
			Humans =
			{
				effect = "particles/null",
				model = "models/weapons/missile_torpedo2",
			},
			Aliens =
			{
				effect = "particles/weapons/missile/green_rocket_trail_small",
			},
		},
		GravyBlock =
		{
			BRAWL =
			{
				effect = "particles/null",
				launch_sound = "sound/gadgets/FrigateDrone/fd_launch",
				model = "models/turret/biglightninggun/h_mine",
			},
		},
		
	},
	Weapon =
	{

				
		muzzleflash_radius = 20,
		
		
		CrystalBuckshotGun =
		
		{
			shot_once_sound = "sound/weapons/CrystalBuckshotGun/cbg_shot",
		},
		
		
		
		HeatingGun =
		{
			shot_once_sound = "sound/weapons/HeatingGun/hg_shot",
		},
		
		LaserBlaster = 
		{
			projectile		= "Projectile_Neutron",
			shot_once_sound = "sound/weapons/destroyer_lb/dlb_shot",
			shot_loop_sound = "sound/destroyer/minigun_start_loop",
			shot_effect 	= "particles/weapons/blaster/dturret_muzzle",
			_muzzleflash_color = { kinetic = "255 128 128 128", emp = "255 128 128 128", thermal = "255 128 128 128", },
		},
		
		LaserHeal =
		{
			beam_fx 		= "particles/weapons/laser/laser_heal_beam",
			fire_fx 		= "particles/weapons/laser/muzzle_heal",
			hit_fx = "particles/weapons/laser/hit_heal",
			shot_loop_sound	= "sound/weapons/laser/LaserHeal",
			impact_type 	= "laser",
			hit_loop_sound	= "sound/hit/laser_loop",
			heal_loop_sound = "sound/hit/laser_heal_loop",
			_muzzleflash_color = { kinetic = "255 100 100 0", emp = "255 100 100 0", thermal = "255 100 100 0", },
		},
		
		LaserMining =
		{
			beam_fx 		= "particles/weapons/laser/laser_heal_beam",
			fire_fx 		= "",
			shot_loop_sound	= "sound/weapons/laser/LaserHeal",
			impact_type 	= "laser",
			hit_loop_sound	= "sound/hit/laser_loop",
		},

		Laser =
		{
			Basic =
			{
				_damage_color = { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "225 51 51 255", },
				_muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 128 128 255", },
				beam_fx = "particles/weapons/laser/laser_basic_beam",
				fire_fx = "",
				hit_fx = "particles/weapons/laser/hit",
				shot_loop_sound = "sound/weapons/laser/basic",
				impact_type 	= "laser",
				T5 = 
				{
					
					Pirate = 
					{
						shot_once_sound = "sound/weapons/laser/Economic_T5_Pirate",
					},
					Tournament =
					{
						_damage_color = {},
						_muzzleflash_color = { kinetic = "255 255 255 255", emp = "255 255 255 255", thermal = "255 255 255 255", },
						beam_fx = "particles/weapons/laser/laser_black_basic_beam",
						fire_fx = "",
						hit_fx = "particles/weapons/laser/hit",
						light_radius 			= 12,
						light_time 				= 0.4,
					},
				},	
			},
			Economic =
			{
				_damage_color = { kinetic = "255 255 128 100", emp = "51 95 225 100", thermal = "225 51 51 255", },
				_muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 128 128 255", },
				projectile		= "Projectile_PlasmaBlaster",
				beam_fx = "particles/weapons/laser/laser_pulse_beam",
				fire_fx = "",
				hit_fx = "particles/weapons/laser/hit",
				shot_once_sound = "sound/weapons/laser/econ",
				T4 = 
				{
					Unique2 = 
					{
						_damage_color = { kinetic = "255 255 128 100", emp = "51 95 225 100", thermal = "231 88 141 100", },
						_muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 128 173 255", },
						beam_fx	= "particles/weapons/laser/laser_pulse_beam",
						fire_fx = "",
						hit_fx = "particles/weapons/laser/hit",
						light_radius 			= 12,
						light_time 				= 0.4,
					},
				},
				
				T5 = 
				{
					
					Pirate = 
					{
						shot_once_sound = "sound/weapons/laser/Economic_T5_Pirate",
					},


					Unique3 = 
					{
						_damage_color = { kinetic = "255 255 128 100", emp = "51 95 225 100", thermal = "228 108 69 100", },
						_muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 158 128 255", },
						beam_fx = "particles/weapons/laser/laser_pulse_beam",
						fire_fx = "",
						hit_fx = "particles/weapons/laser/hit",
						light_radius 			= 12,
						light_time 				= 0.4,
					},
					Pirate =
					{
						_damage_color = { kinetic = "255 255 128 100", emp = "51 95 225 100", thermal = "128 42 26 100", },
						_muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 130 76 255", },
					},
					Tournament =
					{
						_damage_color = {},
						_muzzleflash_color = { kinetic = "255 255 255 100", emp = "255 255 255 100", thermal = "255 255 255 100", },
						beam_fx = "particles/weapons/laser/laser_pulsar_black_beam",
						fire_fx = "",
						hit_fx = "particles/weapons/laser/hit",
						light_radius 			= 12,
						light_time 				= 0.4,
					},
				},
			},
			Heavy =
			{
				_damage_color = { kinetic = "255 255 128 255", emp = "51 95 225 255", thermal = "233 96 96 255", },
				_muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 158 128 255", },
				beam_fx = "particles/weapons/laser/laser_fusion_beam",
				hit_fx = "particles/weapons/laser/hit",
				fire_fx = "particles/weapons/laser/muzzle_heavy",
				shot_loop_sound = "sound/weapons/laser/heavy",
				T5 =
				{
					Pirate =
					{
						_damage_color = { kinetic = "255 255 128 100", emp = "51 95 225 100", thermal = "255 82 51 100", },
						_muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 130 76 255", },
					},
					Tournament =
					{
						_damage_color = {},
						_muzzleflash_color = { kinetic = "255 255 255 100", emp = "255 255 255 100", thermal = "255 255 255 100", },
						beam_fx = "particles/weapons/laser/laser_fusion_black_beam",
						fire_fx = "",
						hit_fx = "particles/weapons/laser/hit",
						light_radius 			= 12,
						light_time 				= 0.4,
					},
				},	
			},
			Sniper =
			{
				projectile		= "Projectile_LaserSniper",
				shot_effect = "particles/weapons/blaster/neutron_muzzle",
				shot_once_sound = "sound/weapons/laser/sniper",
				_muzzleflash_color = { kinetic = "255 100 100 128", emp = "255 100 100 128", thermal = "255 100 100 128", },
			},
			_damage_color = { kinetic = "255 213 128 255", emp = "51 95 225 255", thermal = "225 51 51 255", },
			_muzzleflash_color = { kinetic = "255 213 128 255", emp = "128 159 255 255", thermal = "255 128 128 255", },
			beam_fx = "particles/weapons/laser/laser_pulse_beam",
			hit_fx = "particles/weapons/laser/hit",
			impact_type = "laser", 
			hit_loop_sound = "sound/hit/laser_loop",
		},
		Plasmagun =
		{
			_muzzleflash_color = { kinetic = "57 118 255 128", emp = "57 118 255 128", thermal = "57 118 255 128", },
			shot_effect = "particles/weapons/plasma/muzzle",
			Autofire =
			{
				projectile		= "Projectile_AutoPlasma",
				shot_effect = "particles/weapons/plasma/muzzle_auto",
				shot_once_sound = "sound/weapons/plasmagun/auto",
			},
			Basic =
			{
				projectile		= "Projectile_BasicPlasma",
				shot_once_sound = "sound/weapons/plasmagun/basic",
			},
			Heavy =
			{
				projectile		= "Projectile_SingularityCannon",
				shot_effect = "",
				shot_once_sound = "sound/weapons/singularity/sg_shot",
			
				T5 =
				{
					Pirate =
					{
					projectile		= "Projectile_SingularityCannonPirate",
					shot_effect = "",
					shot_once_sound = "sound/weapons/singularity/sg_shot",
					},
					Tournament =
					{
					projectile		= "Projectile_SingularityCannonTournament",
					shot_effect = "",
					shot_once_sound = "sound/weapons/singularity/sg_shot",
					},
				},
			},
			Sniper =
			{
				projectile		= "Projectile_SniperPlasma",
				shot_effect = "particles/weapons/plasma/muzzle_sniper",
				shot_once_sound = "sound/weapons/plasmagun/sniper",
				T5 =
				{
					Pirate = 
					{
						projectile = "Projectile_Plasma_Light_Cooling",
					},
				},
			},
		},
		Railgun =
		{
			Autofire =
			{
				projectile		= "Projectile_BuckshotRailgun",
				shot_effect = "particles/weapons/railgun/muzzle_buckshot",
				shot_once_sound = "sound/weapons/railgun/auto",
				T5 =
				{
					Pirate = 
					{
						projectile = "Projectile_BuckshotRailgun_Freeze",
					},
				},
			},
			Basic =
			{
				projectile		= "Projectile_BasicRailgun",
				shot_effect = "particles/weapons/railgun/muzzle",
				shot_once_sound = "sound/weapons/railgun/basic",
				T5 =
				{
					Pirate =
					{
					projectile		= "Projectile_BasicRailgunPirate",
					shot_effect = "particles/weapons/railgun/muzzle",
					shot_once_sound = "sound/weapons/railgun/basic",
					},
				},
			},
			Heavy =
			{
				shot_effect 		= "particles/weapons/devostator_muzzle",
				shot_once_sound = "sound/weapons/railgun/heavy",
			},
			HeavyRaid =
			{
				shot_effect 		= "particles/weapons/devostator_muzzle",
				shot_once_sound = "sound/weapons/railgun/heavy",
			},
			Sniper =
			{
				projectile		= "Projectile_SniperRailgun",
				shot_effect = "particles/weapons/railgun/muzzle_axe",
				shot_once_sound = "sound/weapons/railgun/sniper",
				T5 =
				{
					Pirate = 
					{
						projectile = "Projectile_Nail_Iron_Damage",
					},
				},
			},
			_muzzleflash_color = { kinetic = "230 164 120 128", emp = "230 164 120 128", thermal = "230 164 120 128", },
			Huge =
			{
				projectile		= "Projectile_RailgunDestr",
				shot_effect = "particles/weapons/railgun/muzzle_destr",
				shot_once_sound = "sound/destroyer/RailgunDestr_shot",
				_muzzleflash_color = { kinetic = "255 220 150 128", emp = "255 220 150 128", thermal = "255 220 150 128", },
				muzzleflash_radius = 15,
				oriented_shot_effects = true,
			},
		},
		Minigun =
			{
				shot_effect = "particles/weapons/railgun/muzzle_yellow",
				--shot_effect = "particles/weapons/fireworks/newyear1_muzzle", --New Year
				shot_once_sound = "sound/weapons/minigun/minigun",
				_muzzleflash_color = { kinetic = "220 190 120 128", emp = "220 190 120 128", thermal = "220 190 120 128", },
				muzzleflash_radius = 15,
				projectile = "Projectile_Nail_Iron_Heavy",
				T5 = 
				{
					shot_effect = "particles/weapons/railgun/muzzle_yellow_2",
					projectile = "Projectile_Nail_Iron_Heavy_T5",
				},
				NY = 
				{
					projectile = "Projectile_Nail_Iron_Heavy_NY",
				},
			},
		RailgunDestr =
			{
				projectile		= "Projectile_RailgunDestr",
				shot_effect = "particles/weapons/railgun/muzzle_destr",
				shot_once_sound = "sound/destroyer/RailgunDestr_shot",
				_muzzleflash_color = { kinetic = "255 220 150 128", emp = "255 220 150 128", thermal = "255 220 150 128", },
				muzzleflash_radius = 15,
				oriented_shot_effects = true,
			},
		PirateRail = 
			{
				projectile		= "Projectile_Nail_Iron",
				shot_effect 	= "particles/weapons/railgun/muzzle_destr3",
				shot_once_sound = "sound/weapons/railgun/PirateRail",
				_muzzleflash_color = { kinetic = "230 156 92 128", emp = "230 156 92 128", thermal = "230 156 92 128", },
				muzzleflash_radius = 15,
			},
		SpyDroneRailgun = 
			{
				projectile		= "Projectile_SpyDroneRailgun",
				shot_effect 	= "particles/weapons/other/spy_muzzle",
				shot_once_sound = "sound/weapons/railgun/SpyDrone_rail",
				_muzzleflash_color = { kinetic = "230 124 115 128", emp = "230 124 115 128", thermal = "230 124 115 128", },
				muzzleflash_radius = 15,
			},
		RailVolcano = 
		{
			_muzzleflash_color = { kinetic = "255 228 196 128", emp = "255 228 196 128", thermal = "255 228 196 128", },
			shot_effect = "particles/weapons/railgun/volcano_muzzle",
		}
	},

	Projectile =
	{
	    RailVolcano = 
        {
		    hit_effect				= "particles/weapons/railgun/hit",
	        hit_ship_effect 		= "particles/weapons/railgun/volcano_ship_hit",
	        hit_shield_effect 		= "particles/weapons/railgun/volcano_shield_hit",
	        hit_crit_ship_effect 	= "particles/weapons/railgun/hit_crit",
	        hit_crit_shield_effect 	= "particles/weapons/railgun/hit_crit_shield",
	
	        effect = "particles/weapons/railgun/volcano_projectile",
        }
	},
}