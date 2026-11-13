ItemSets ={
	alien_hunter_t5 = {
		items = {	 -- тут хранить инфу о сете для интерфейса (какие вещи входят в сет)
				"ModulePassive_CoProcessor_T5_set1", 
				"Module_DamageSpeed_T5_set1",
				"Module_SafeBoost_T5_set1", 
		},
		bonus = { --В данном случае бонус дамага по аллиенам 10% работает если одето 2 вещи сета
				{},
				{ alien_damage_mul = 0.15, damage_mul = 100 }, -- значит если из сета есть 2 вещи, то бонусы [2] работают.
				{},
		}, 
	},
	
	command_t3_set = --сет командника Т3
	{
		items =
		{
			"Module_ExtendedCooler_T3_Set",
			"Module_CommandWeaknessAnalyzer_T3_Set",
			"Module_CommandShieldResist_T3_Set",
			"Module_CmplxBatt_T3_Set",
		},
		bonus =
		{
			{},
			{spell_command_param_mul = 0.1},
			{},
			{crit_chance_add = 0.06},
		}
	},
	
	recon_t3_set = --Сет диверсанта Т3
	{
		items =
		{
			"Module_Chameleon_T3_Set",
			"Module_AchillesTargetingUnit_T3_Set",
			"ModulePassive_WideTurboScanner_T3_Set",
			"ModulePassive_CollisionComp_T3_Set",
		},
		bonus =
		{
			{},
			{crit_damage_add = 0.1},
			{},
			{module_recon_cooldown_mul = -0.149},
		}
	},
	
	ecm_t3_set = --Сет РЭБа Т3
	{
		items =
		{
			"Module_InjectorOverloader_T3_Set",
			"Module_StasisGenerator_T3_Set",
			"Module_HackSystems_T3_Set",
			"ModulePassive_TurboBattleScanner_T3_Set",
		},
		bonus =
		{
			{},
			{rocket_cooldown_coef_mul = -0.111},
			{},
			{max_speed_mul = 0.07},
		}
	},
	
	scout_t3_set = --Сет разведа Т3
	{
		items = 
		{
			"ModulePassive_ScoutScanner_T3_Set",
			"Module_EngineGenerator_T3_Set",
			"Module_SpyBeacon_T3_Set",
			"Module_ShieldVampire_T3_Set",
		},
		bonus = 
		{
			{},
			{energy_regen_mul = 0.1},
			{},
			{module_emission_cooldown_mul = -0.149},
		}
	},
	
	tackler_t3_set = --Сет заграда Т3
	{
		items =
		{
			"Module_SubMatterShield_T3_Set",
			"Module_DoomBoost_T3_Set",
			"Module_WebPropulsion_T3_Set",
			"Module_TargetPainter_T3_Set",
		},
		bonus =
		{
			{},
			{plasma_projectile_speed_mul = 0.2, railgun_projectile_speed_mul = 0.2},
			{},
			{rot_speed_mul = 0.25},
		},
	},
	
	attack_t3_set = --Сет ударника Т3
	{
		items =
		{
			"ModulePassive_CoProcessor_T3_Set",
			"Module_InertialStabilizer_T3_Set",
			"Module_Afterburner_T3_Set",
			"Module_Eagleeye_T3_Set",
		},
		bonus =
		{
			{},
			{heat_add_mul = -0.125},
			{},
			{module_target_painter_cooldown_mul = -0.149},
		},
	},
	
	sniper_t3_set = --Сет снайпера Т3
	{
		items =
		{
			"Module_ChillDistributor_T3_Set",
			"Module_Flash_T3_Set",
			"Module_ReverseThruster_T3_Set",
			"ModulePassive_WideScanner_T3_SniperSet",
		},
		bonus =
		{
			{},
			{vision_radius_mul = 0.5},
			{},
			{crit_damage_add = 0.13},
		}
	},
	
	engineer_t3_set = --Сет инженера Т3
	{
		items =
		{
			"Module_ImprovedInjector_T3_Set",
			"ModulePassive_RangeMasterUnit_T3_Set",
			"Module_WarpGate_T3_Set",
			"Module_ShieldRay_l_T3_Set",
		},
		bonus =
		{
			{},
			{rot_speed_mul = 0.15},
			{},
			{energy_max_mul = 0.2, energy_regen_mul = 0.2},
		}
	},
	
	guard_t3_set = --Сет прикрытия Т3
	{
		items =
		{
			"Module_ExtShld_T3_Set",
			"Module_TemperedShield_T3_Set",
			"Module_SmartBomb_T3_Set",
			"Module_BoostJammerAOE_T3_Set",
		},
		bonus =
		{
			{},
			{hull_resist_add = 25},
			{},
			{module_guard_cooldown_mul = -0.176},
		},
	},
	-------------------------- СЕТЫ НОВЫЕ ---------------------------------
	test_set_1 = --Сет 2-4
	{
		items =
		{
			"Module_EngineSetTest",
			"Module_CapSetTest",
		},
		bonus =
		{
			{},
			{hull_resist_add = 25},
			{},
			{module_guard_cooldown_mul = -0.176},
		},
	},
	test_set_2 = --Сет 1-2
	{
		items =
		{
			"Module_EngineSetTest",
			"Module_CapSetTest",
		},
		bonus =
		{
			{hull_resist_add = 25},
			{module_guard_cooldown_mul = -0.176},
		},
	},
	test_set_3 = --Сет 1-2 spell
	{
		items =
		{
			"Module_EngineSetTest",
			"Module_CapSetTest",
		},
		bonus =
		{
			{hull_resist_add = 25},
			{"BombCarrier"},
		},
	},
}

--скрыть сетовые модули
Def.Module_SubMatterShield_T3_Set.hide_from_player=true
Def.Module_DoomBoost_T3_Set.hide_from_player=true
Def.Module_WebPropulsion_T3_Set.hide_from_player=true
Def.Module_TargetPainter_T3_Set.hide_from_player=true
Def.Module_ImprovedInjector_T3_Set.hide_from_player=true
Def.ModulePassive_RangeMasterUnit_T3_Set.hide_from_player=true
Def.Module_WarpGate_T3_Set.hide_from_player=true
Def.Module_ShieldRay_l_T3_Set.hide_from_player=true
Def.Module_ExtendedCooler_T3_Set.hide_from_player=true
Def.Module_CommandWeaknessAnalyzer_T3_Set.hide_from_player=true
Def.Module_CommandShieldResist_T3_Set.hide_from_player=true
Def.Module_CmplxBatt_T3_Set.hide_from_player=true
Def.ModulePassive_CoProcessor_T3_Set.hide_from_player=true
Def.Module_InertialStabilizer_T3_Set.hide_from_player=true
Def.Module_Afterburner_T3_Set.hide_from_player=true
Def.Module_Eagleeye_T3_Set.hide_from_player=true
Def.Module_ChillDistributor_T3_Set.hide_from_player=true
Def.Module_Flash_T3_Set.hide_from_player=true
Def.Module_ReverseThruster_T3_Set.hide_from_player=true
Def.ModulePassive_WideScanner_T3_SniperSet.hide_from_player=true
Def.Module_ExtShld_T3_Set.hide_from_player=true
Def.Module_TemperedShield_T3_Set.hide_from_player=true
Def.Module_SmartBomb_T3_Set.hide_from_player=true
Def.Module_BoostJammerAOE_T3_Set.hide_from_player=true
Def.ModulePassive_ScoutScanner_T3_Set.hide_from_player=true
Def.Module_EngineGenerator_T3_Set.hide_from_player=true
Def.Module_SpyBeacon_T3_Set.hide_from_player=true
Def.Module_ShieldVampire_T3_Set.hide_from_player=true
Def.Module_Chameleon_T3_Set.hide_from_player=true
Def.Module_AchillesTargetingUnit_T3_Set.hide_from_player=true
Def.ModulePassive_WideTurboScanner_T3_Set.hide_from_player=true
Def.ModulePassive_CollisionComp_T3_Set.hide_from_player=true
Def.Module_InjectorOverloader_T3_Set.hide_from_player=true
Def.Module_StasisGenerator_T3_Set.hide_from_player=true
Def.Module_HackSystems_T3_Set.hide_from_player=true
Def.ModulePassive_TurboBattleScanner_T3_Set.hide_from_player=true