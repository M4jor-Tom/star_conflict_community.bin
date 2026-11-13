--
VesselGradesProgression =
{																															  -- EHP DPS
	{ engine_grades = 0, capacitor_grades = 0, shield_grades = 0, armor_grades = 0, cpu_grades = 0 },  -- 1                      -- 0
	{ engine_grades = 0, capacitor_grades = 0, shield_grades = 1, armor_grades = 1, cpu_grades = 0 },  -- 2                      -- 3.4 
	{ engine_grades = 1, capacitor_grades = 0, shield_grades = 2, armor_grades = 2, cpu_grades = 1 },  -- 3                      -- 7.8 + 1
	{ engine_grades = 1, capacitor_grades = 1, shield_grades = 2, armor_grades = 2, cpu_grades = 1 },  -- 4                      -- 8.8 + 1
	{ engine_grades = 1, capacitor_grades = 2, shield_grades = 3, armor_grades = 3, cpu_grades = 2 },  -- 5                      -- 13.2 + 2
	{ engine_grades = 2, capacitor_grades = 3, shield_grades = 4, armor_grades = 4, cpu_grades = 2 },  -- 6                      -- 18.6 + 2
	{ engine_grades = 3, capacitor_grades = 3, shield_grades = 5, armor_grades = 6, cpu_grades = 3 },  -- 7                      -- 24.7 + 3
	{ engine_grades = 4, capacitor_grades = 3, shield_grades = 5, armor_grades = 6, cpu_grades = 4 },  -- 8                      -- 25.7 + 4
	{ engine_grades = 5, capacitor_grades = 4, shield_grades = 6, armor_grades = 7, cpu_grades = 4 },  -- 9                      -- 31.1 + 4
	{ engine_grades = 5, capacitor_grades = 5, shield_grades = 7, armor_grades = 7, cpu_grades = 5 },  -- 10                     -- 33.8 + 5

	{ engine_grades = 5, capacitor_grades = 5, shield_grades = 7, armor_grades = 7, cpu_grades = 5 },  -- 11 не используется
	{ engine_grades = 5, capacitor_grades = 5, shield_grades = 7, armor_grades = 7, cpu_grades = 5 },  -- 12 не используется
	{ engine_grades = 5, capacitor_grades = 5, shield_grades = 7, armor_grades = 7, cpu_grades = 5 },  -- 13 не используется
	-- +0.007 m_speed      +3%e_max +3%e_reg       +3% max                 + 3%                  10% vision_rad
	-- +0.5% eHP             + 0.5% EHP                 +1.7% EXP              +1.7% EXP             +1% DPS
}


-- every entry corresponds to a rank
VesselExpPerLevel = 
{
-- level:	2 - 16  в реальности работает  2-10.
	{ 1000, 1300, 1500, 2500,                              15500, 16500, 17500, 18500, 19500, 110500, 111500, 112500, 113500, 114500, 115500, }, -- rank 1  --5  --4000-7000 за бой (3-6 мин)
	{ 1200, 1300, 1500, 2750,                              18000, 19500, 111000, 112500, 114000, 115500, 117000, 118500, 120000, 121500, 123000, }, -- rank 2  --5
	{ 1200, 1300, 1500, 3000, 5000,                        122500, 127000, 131500, 136000, 140500, 145000, 149500, 154000, 158500, 163000, }, -- rank 3 --6 
	{ 1200, 1300, 1500, 3000, 5000, 10000,                 128500, 137500, 146500, 155500, 164500, 173500, 182500, 191500, 1100500, }, -- rank 4 --7 
	{ 1200, 1300, 1500, 3000, 5000, 10000, 12500,                157500, 172500, 187500, 1102500, 1117500, 1132500, 1147500, 1162500, }, -- rank 5   --8
	{ 1200, 1300, 1500,  3000,  5000,  12000, 14500,                 93000, 113000, 133000, 153000, 173000, 193000, 213000, 233000, }, -- rank 6  --8
	{ 5000, 8000, 12000, 24000, 30000, 40000, 50000, 70000,                147000, 187000, 227000, 267000, 307000, 347000, 387000, }, -- rank 7  --9
	{ 5000, 8000, 12000, 24000, 30000, 40000, 50000, 80000,                  256000, 341000, 426000, 511000, 596000, 681000, 766000, }, -- rank 8
	{ 10000,21000,32000, 43000, 54000, 65000, 85000, 100000,                150000, 267000, 347000, 427000, 507000, 587000, 667000, 747000, }, 
	-- rank 9  3 раза: 2-3к - слитый бой днищем 5-6к слитый бой средним игроком. 20кк победа с кучей ассистов(10минут ): 7к победа 8мин : 7к победа 5мин:
	{ 10000, 21000, 32000,  43000, 54000,   65000,  90000, 115000,                    205000, 295000, 385000, 475000, 565000, 655000, 745000, }, -- rank 10
	{ 15000, 27000, 39000,  51000, 63000,   75000,  95000, 115000, 225000,                 335000, 445000, 555000, 665000, 775000, 885000, }, -- rank 11
	{ 18000, 31000, 44000,  57000, 70000,   83000, 108000, 133000, 243000,                 353000, 463000, 573000, 683000, 793000, 903000, }, -- rank 12
	{ 20000, 37000, 54000,  71000, 88000,  105000, 145000, 185000, 345000,                 505000, 665000, 825000, 985000, 1145000, 1305000, }, -- rank 13
	{ 25000, 45000, 65000,  85000, 105000, 125000, 165000, 300000, 545000,                 585000, 625000, 765000, 905000, 1045000, 1185000, }, -- rank 14
	
	{ 30000, 62000, 94000, 126000, 158000, 200000, 250000, 400000, 700000,             1550000, 1690000, 1830000, 1970000, 11110000, 11250000, }, -- rank 15
	{ 30000, 62000, 94000, 126000, 158000, 250000, 350000, 550000, 850000,             1550000, 1690000, 1830000, 1970000, 11110000, 11250000, }, -- rank 16
	{ 30000, 62000, 100000,150000, 200000, 350000, 450000, 650000, 950000,             1550000, 1690000, 1830000, 1970000, 11110000, 11250000, }, -- rank 17
	{ 40000, 80000, 150000,200000, 250000, 400000, 500000, 700000, 999999,             1550000, 1690000, 1830000, 1970000, 11110000, 11250000, }, -- rank 18
}

-- до великого упрощения 08.02.2019
--[[ {
-- level:	2 - 16  в реальности работает  2-10.
	{ 3000, 4000, 5000, 8000,                              15500, 16500, 17500, 18500, 19500, 110500, 111500, 112500, 113500, 114500, 115500, }, -- rank 1  --5  --4000-7000 за бой (3-6 мин)
	{ 3500, 5000, 7000, 10000,                              18000, 19500, 111000, 112500, 114000, 115500, 117000, 118500, 120000, 121500, 123000, }, -- rank 2  --5
	{ 3500, 5000, 8000, 12000, 15000,                      122500, 127000, 131500, 136000, 140500, 145000, 149500, 154000, 158500, 163000, }, -- rank 3 --6 
	{ 3500, 5000, 10000, 12000, 15000, 20000,                 128500, 137500, 146500, 155500, 164500, 173500, 182500, 191500, 1100500, }, -- rank 4 --7 
	{ 5500, 8500, 11500, 14500, 17500, 27500, 42500,                157500, 172500, 187500, 1102500, 1117500, 1132500, 1147500, 1162500, }, -- rank 5   --8
	{ 7000, 13500, 20000, 26500, 33000, 53000, 73000,                 93000, 113000, 133000, 153000, 173000, 193000, 213000, 233000, }, -- rank 6  --8
	{ 10000, 18000, 26000, 34000, 42000, 52000, 67000, 107000,                147000, 187000, 227000, 267000, 307000, 347000, 387000, }, -- rank 7  --9
	{ 13000, 24000, 35000, 46000, 57000, 66000, 86000, 171000,                  256000, 341000, 426000, 511000, 596000, 681000, 766000, }, -- rank 8
	{ 15000, 28000, 41000, 54000, 67000, 87000, 107000, 187000,                   267000, 347000, 427000, 507000, 587000, 667000, 747000, }, 
	-- rank 9  3 раза: 2-3к - слитый бой днищем 5-6к слитый бой средним игроком. 20кк победа с кучей ассистов(10минут ): 7к победа 8мин : 7к победа 5мин:
	{ 10000, 21000, 32000,  43000, 54000,   65000,  90000, 115000,                    205000, 295000, 385000, 475000, 565000, 655000, 745000, }, -- rank 10
	{ 15000, 27000, 39000,  51000, 63000,   75000,  95000, 115000, 225000,                 335000, 445000, 555000, 665000, 775000, 885000, }, -- rank 11
	{ 18000, 31000, 44000,  57000, 70000,   83000, 108000, 133000, 243000,                 353000, 463000, 573000, 683000, 793000, 903000, }, -- rank 12
	{ 20000, 37000, 54000,  71000, 88000,  105000, 145000, 185000, 345000,                 505000, 665000, 825000, 985000, 1145000, 1305000, }, -- rank 13
	{ 25000, 45000, 65000,  85000, 105000, 125000, 165000, 300000, 545000,                 585000, 625000, 765000, 905000, 1045000, 1185000, }, -- rank 14
	
	{ 30000, 62000, 94000, 126000, 158000, 200000, 250000, 400000, 700000,             1550000, 1690000, 1830000, 1970000, 11110000, 11250000, }, -- rank 15
	{ 30000, 62000, 94000, 126000, 158000, 250000, 350000, 550000, 850000,             1550000, 1690000, 1830000, 1970000, 11110000, 11250000, }, -- rank 16
	{ 30000, 62000, 100000,150000, 200000, 350000, 450000, 650000, 950000,             1550000, 1690000, 1830000, 1970000, 11110000, 11250000, }, -- rank 17
	{ 40000, 80000, 150000,200000, 250000, 400000, 500000, 700000, 999999,             1550000, 1690000, 1830000, 1970000, 11110000, 11250000, }, -- rank 18
} ]]


-- max vessel levels
VesselMaxLevel = 
{
	5,		-- rank 1
	5,		-- rank 2
	6,		-- rank 3
	7,		-- rank 4
	8,		-- rank 5
	8,		-- rank 6
	9,		-- rank 7
	9,		-- rank 8
	9,		-- rank 9
	10,		-- rank 10
	10,		-- rank 11
	10,		-- rank 12
	10,		-- rank 13
	10,		-- rank 14
	10,		-- rank 15
	10,		-- rank 16
	10,		-- rank 17
	10,		-- rank 18
}

ShipSpecBonus =
{
	PRIMARY_DAMAGE 		= { damage_mul 					= 0.1, },
	PRIMARY_CRIT		= { crit_chance_add 			= 0.1 },
	PRIMARY_CRIT_DAMAGE	= { crit_damage_add 			= 0.2 },
	PRIMARY_HEAT_SUB	= { heat_sub_mul 				= 0.5 },
	PRIMARY_HEAT_ADD	= { heat_add_mul  				= -0.25 },
	RAILGUN_BOOST		= { railgun_dispersion_mul  	= -0.50, railgun_projectile_speed_mul  = 0.35 },
	PLASMA_BOOST		= { plasma_dispersion_mul   	= -0.50, plasma_projectile_speed_mul   = 0.35 },
	RAILGUN_BOOST_PREMIUM		= { railgun_dispersion_mul  	= -0.5, railgun_projectile_speed_mul  = 0.35 },
	PLASMA_BOOST_PREMIUM		= { plasma_dispersion_mul   	= -0.5, plasma_projectile_speed_mul   = 0.35 },
	LASER_DAMGE 		= { laser_damage_mul 					= 0.1, },
	LASER_DAMAGE_GREEN		= { laser_damage_mul 					= 0.15, },
	
	ROCKET_COOLDOWN		= { rocket_cooldown_coef_mul	= -0.25 },
	VISION 				= { vision_radius_mul  			= 1, },
	ENERGY_REGEN		= { energy_regen_mul 			= 0.2 },
	ENERGY_MAX			= { energy_max_mul 				= 0.3 },
	BOOST_ENERGY		= { boost_energy_cost_per_second_mul	= -0.3333 },
	ROTATION_SPEED		= { rot_speed_mul  				= 0.25 },
	MANEUVER_SPEED_PREM	= { rot_speed_mul  				= 0.2, strafe_speed_mul   			= 0.25 },
	STRAFE_SPEED		= { strafe_speed_mul   			= 0.3 },
	SPEED				= { max_speed_mul  				= 0.1 },
	
	HULL_RESIST_THERMAL	= { hull_resist_thermal_add 	= 30, },
	HULL_RESIST_THERMAL_GREEN= { hull_resist_thermal_add 	= 45, },
	HULL_RESIST_KINETIC	= { hull_resist_kinetic_add 	= 27, },
	HULL_RESIST_EMP		= { hull_resist_emp_add			= 33, },
	HULL_RESIST_ALL		= { hull_resist_add 			= 10, },
	HULL_RESIST_ALL_GREEN = { hull_resist_add 			= 30, },	
	HULL_REGEN_ADD		= { hull_regen_add 			= 150, },	
	SHIELD_RESIST_THERMAL 	= { shield_resist_thermal_add  	= 30, },
	SHIELD_RESIST_KINETIC 	= { shield_resist_kinetic_add  	= 33, },
	SHIELD_RESIST_EMP 	= { shield_resist_emp_add 		= 27, },
	SHIELD_RESIST_ALL	= { shield_resist_add 			= 10, },	
	SHIELD_RESIST_UFO	= { shield_resist_add 			= 15, },
	SHIELD_RESIST_ALL_PREMIUM	= { shield_resist_add 			= 16, },	
	HP_ALL_PREMIUM		= { hull_health_mul				= 0.15, shield_max_mul 	= 0.15 },
	HP_ALL_GREEN		= { hull_health_mul				= 0.2, shield_max_mul 	= 0.2 },
	SHIELD_RESIST_ALL_GREEN	= { shield_resist_add 			= 25, },
	SHIELD_RESIST_GREEN_ENGINEER	= { shield_resist_add 			= 20, },
	ALL_RESIST_SATURN	= { shield_resist_add 			= 20, hull_resist_add 	= 20, },
	
	
	SCOUT_COOLDOWN		= { module_emission_cooldown_mul	= -0.25 },
		SCOUT_PARAM		= { spell_emission_param_mul 	= 0.3 },  --НЕ НАДО ИСПОЛЬЗОВАТЬ!
	SCOUT_RANGE			= { spell_emission_range_mul 	= 0.5 },

	ECM_RANGE	= { spell_ecm_range_mul 				= 0.5 },
	ECM_ENERGY	= { module_ecm_energy_cost_mul 			= -0.25 },
	ECM_DURATION	= { spell_ecm_duration_mul 			= 0.2 },
	ECM_RANGE_8	= { spell_ecm_range_mul 				= 0.5 },
	ECM_ENERGY_8	= { module_ecm_energy_cost_mul 			= -0.25 },
	
	RECON_COOLDOWN	= { module_recon_cooldown_mul 		= -0.25 },
	RECON_PARAM	= { spell_recon_param_mul 				= 0.2 },
	RECON_ENERGY	= { module_recon_energy_cost_mul	= -0.4286 },
	
	ATTACK_ENERGY	= { module_target_painter_energy_cost_mul = -0.25 },
	ATTACK_COOLDOWN	= { module_target_painter_cooldown_mul 	= -0.25 },
	ATTACK_COOLDOWN_PREMIUM= { module_target_painter_cooldown_mul 	= -0.33333 },
	ATTACK_DAMAGE 		= { damage_mul 					= 0.15, },
	
	COMMAND_PARAM	= { spell_command_param_mul  		= 0.2 },
	COMMAND_RANGE	= { spell_command_range_mul			= 0.5 },
	COMMAND_ENERGY	= { module_command_energy_cost_mul 	= -0.25 },
	COMMAND_COOLDOWN= { module_command_cooldown_mul 	= -0.15 },
	
	TACKLER_PARAM	= { spell_propulsion_jam_param_mul	= 0.25 },
	TACKLER_RANGE	= { spell_propulsion_jam_range_mul 	= 0.5 },
	TACKLER_RANGE_2	= { spell_propulsion_jam_range_mul 	= 0.35 },
	TACKLER_ENERGY	= { module_propulsion_jam_energy_cost_mul	= -0.25 },
	
	SNIPER_COOLDOWN = { module_logistic_cooldown_mul	= -0.25 },
	SNIPER_ENERGY 	= { module_logistic_energy_cost_mul = -0.25 },
	
	ENGINEER_ENTITY = { module_deploy_entity_health_mul	= 1 },
	ENGINEER_COOLDOWN = { module_deploy_cooldown_mul	= -0.25 },
	ENGINEER_ENERGY = { module_deploy_energy_cost_mul	= -0.25 },
	ENGINEER_PARAM = { spell_deploy_param_mul 			= 0.2 },
	
	GUARD_RANGE	= { spell_guard_range_mul 				= 0.50 },
	GUARD_COOLDOWN	= { module_guard_cooldown_mul		= -0.25 },
	GUARD_ENERGY	= { module_guard_energy_cost_mul	= -0.25 },
	
	OVERSEER_PARAM	= { spell_overseer_param_mul  		= 0.1 },
	OVERSEER_COOLDOWN= { spell_overseer_cooldown_mul			= -0.1765 },
	OVERSEER_ENERGY	= { module_overseer_energy_cost_mul 	= -0.3333},

	COMMAND_GRNT_4			= { module_command_cooldown_mul 	= -0.15 }, --Granite
	COMMAND_GRNT_8			= { energy_regen_mul 			= 0.2 }, --Granite
	SNIPER_ENERGY_PRJCT 	= { module_logistic_energy_cost_mul = -0.25 }, --Project 1011
	SNIPER_RESIST_THERMAL	= { hull_resist_thermal_add 	= 30, }, --Project 1011
	ATTACK_COOLDOWN_W		= { module_target_painter_cooldown_mul 	= -0.33333 }, --Wolfhound
	ATTACK_BOOST_ENERGY		= { boost_energy_cost_per_second_mul	= -0.3333 }, --Wolfhound
	TACKLER_SPEED			= { max_speed_mul  				= 0.1 }, --Singularity
	VISION_SALYUT 			= { vision_radius_mul  			= 0.8 }, --Salyut-ST

	
--ролевые бонусы 2-го уровня синергии
	ECM_BASE		= { heat_add_mul 	 				= -0.5 },
	RECON_BASE		= { crit_chance_add	 				= 0.3 },
	CUTTER_BASE		= { crit_chance_add	 				= 0.5 },
	SCOUT_BASE		= { crit_chance_add	 				= 0.15 },
	ATTACK_BASE		= { damage_mul 						= 0.08 },
	COMMAND_BASE	= { energy_regen_mul 				= 0.25 },
	TACKLER_BASE	= { boost_energy_cost_per_second_mul= -0.25 },
	ENGINEER_BASE 	= { max_speed_mul  					= 0.1 },
	GUARD_BASE		= { energy_max_mul 					= 0.2 },
	SNIPER_BASE 	= { crit_chance_add 				= 0.05 },
	DART_BASE		= { energy_regen_mul = 0.25, shield_resist_emp_add = 27,},
	
	RAILGUN_BOOST_		= { railgun_dispersion_mul  	= -0.50, railgun_projectile_speed_mul  = 0.35 },
	PLASMA_BOOST_		= { plasma_dispersion_mul   	= -0.50, plasma_projectile_speed_mul   = 0.35 },	
	RAILGUN_BOOST_4		= { railgun_dispersion_mul  	= -0.50, railgun_projectile_speed_mul  = 0.35 },
	PLASMA_BOOST_4		= { plasma_dispersion_mul   	= -0.50, plasma_projectile_speed_mul   = 0.35 },	
	HP_ALL_				= { hull_health_mul		= 0.075, shield_max_mul 	= 0.075 },
	PRIMARY_DAMAGE_4	= { damage_mul 					= 0.1, },
	PRIMARY_CRIT_4		= { crit_chance_add 			= 0.1 },
	PRIMARY_CRIT_8		= { crit_chance_add 			= 0.1 },
	PRIMARY_CRIT_DAMAGE_4	= { crit_damage_add 			= 0.2 },
	PRIMARY_HEAT_ADD_4	= { heat_add_mul  				= -0.25 },
	PRIMARY_HEAT_SUB_4	= { heat_sub_mul 				= 1 },
	
	SPECIAL_RECHARGE_MUL = { special_cooldown_mul = -0.25 }, -- -20%
	ROCKET_DAMAGE		= { rocket_damage_coef_mul = 0.4 },
	HULL_HEALTH_MEGA 	= { hull_health_mul = 0.35 },
	GREEN_ENGINEER_PROJECTILE = { projectile_speed_mul = 0.17 },
	GREEN_PROJECTILE_SPEED = { plasma_projectile_speed_mul  	= 0.15, railgun_projectile_speed_mul  = 0.15 },
	SWARM_DEFENCE	= { swarm_spell1_param_add = 30 }, -- + к ауре защиты зеленого эсминца от дронов в режиме обороны
	GREEN_DISPERSION = { dispersion_mul  	= -0.25 },
	GREEN_PLASMA = {plasma_damage_mul = 0.15},

	
	HULL_RESIST_EMP_THERM_4	= {hull_resist_thermal_add 	= 20, hull_resist_emp_add 	= 20,},
	LOKI_4				= { crit_chance_add 			= 0.1, spell_command_param_mul  		= 0.25 },
	--SAWTOOTH		= { rot_speed_mul  				= 0.25, spell_propulsion_jam_range_mul 	= 0.5 },
	SAWTOOTH		= { rot_speed_mul  				= 0.25, spell_propulsion_jam_range_mul 	= 0.35 },
	EMPEROR			= { lock_time_mul  				= -2, },
	EMPEROR_HULL_RESIST_ALL		= { hull_resist_add 			= 20, },	

	
	SET_WEAPONS		= { "PRIMARY_HEAT_ADD", "RAILGUN_BOOST_", "PLASMA_BOOST_" },  --8
	SET_WEAPONS_V1	= {  "RAILGUN_BOOST_", "PRIMARY_HEAT_ADD", "PLASMA_BOOST_" }, --8
	SET_WEAPONS_V2	= {  "PLASMA_BOOST_", "PRIMARY_HEAT_ADD", "RAILGUN_BOOST_" },  --8
	SET_WEAPONS2	= { "PRIMARY_DAMAGE", "PRIMARY_CRIT", "PRIMARY_CRIT_DAMAGE" }, --8
	SET_WEAPONS2_V1	= { "PRIMARY_CRIT_4", "PRIMARY_DAMAGE_4", "PRIMARY_CRIT_DAMAGE_4" }, --4
	SET_HAMMERHEAD_4	= { "PRIMARY_CRIT_4" },
	SET_RAVEN_4 	= { "ROTATION_SPEED" },
	--SET_WEAPONS3 	= { "PRIMARY_HEAT_SUB", "PRIMARY_HEAT_ADD", "ROCKET_COOLDOWN" }, -- 4
	--SET_WEAPONS_V3	= { "PRIMARY_CRIT_DAMAGE", "RAILGUN_BOOST_", "PLASMA_BOOST_" },
	SET_WEAPONS_V4	= { "PRIMARY_DAMAGE_4", "RAILGUN_BOOST_4", "PLASMA_BOOST_4" }, --4
	SET_WEAPONS_V5	= { "PRIMARY_HEAT_ADD_4", "RAILGUN_BOOST_4", "PLASMA_BOOST_4" }, --4
	SET_WEAPONS_V6	= { "PRIMARY_HEAT_SUB_4", "RAILGUN_BOOST_4", "PLASMA_BOOST_4" }, --4
	SET_WEAPONS_V7	= { "PRIMARY_DAMAGE_4", "RAILGUN_BOOST_4", "PRIMARY_CRIT_4" }, --4
	SET_SHIELD_RESIST = { "SHIELD_RESIST_KINETIC", "SHIELD_RESIST_THERMAL", "SHIELD_RESIST_EMP" },
	SET_HULL_RESIST = { "HULL_RESIST_THERMAL", "HULL_RESIST_EMP", "HULL_RESIST_KINETIC" }, --4
	SET_HULL_ADDITIONAL = { "VISION", "ENERGY_REGEN","ENERGY_MAX" }, -- 4 
	SET_AGILITY		= { "ROTATION_SPEED", "STRAFE_SPEED", "SPEED" },  --4
	SET_AGILITY2	= { "ROTATION_SPEED", "BOOST_ENERGY", "SPEED" },  --4
	SET_AGILITY_V1	= { "SPEED", "ROTATION_SPEED", "STRAFE_SPEED",  }, --4
	SET_DESTREMP_T5	= { "PRIMARY_DAMAGE_4", "ENERGY_REGEN", "EMPEROR_HULL_RESIST_ALL" }, --4
	
	SET_HP			= { "SHIELD_RESIST_ALL", "HULL_RESIST_ALL", "HP_ALL_" }, --8
	
	SET_SCOUT		= { "SCOUT_PARAM", "SCOUT_COOLDOWN", "PRIMARY_CRIT_8" },  --8
	SET_ECM			= { "", "", "" }, --8
	SET_RECON		= { "RECON_PARAM", "RECON_COOLDOWN", "RECON_ENERGY" }, --8
	
	SET_TACKLER 	= { "TACKLER_PARAM", "TACKLER_RANGE", "TACKLER_ENERGY" }, --8
	SET_COMMAND		= { "COMMAND_PARAM", "COMMAND_RANGE", "COMMAND_COOLDOWN" }, --8
	
	SET_ENGINEER	= { "ENGINEER_COOLDOWN", "ENGINEER_ENERGY", "ENGINEER_PARAM" }, --8
	SET_HAMMERHEAD_8	= { "ENGINEER_COOLDOWN" }, --8
	SET_RAVEN_8 	= { "SHIELD_RESIST_ALL" },
	SET_SCYLLA_4	= { "PRIMARY_DAMAGE_4" },
	SET_SCYLLA_8	= { "ENGINEER_PARAM" },
	SET_MOLE_8		= { "PRIMARY_HEAT_ADD",	},
	SET_SRHIKE_8		= { "GUARD_COOLDOWN", "GUARD_ENERGY", "GUARD_RANGE",	},
	SET_PILUM_4		= { "PRIMARY_HEAT_ADD_4", "PRIMARY_CRIT_4", "PRIMARY_HEAT_SUB",	},
	
	SET_OVERSEER	= { "OVERSEER_PARAM", "OVERSEER_COOLDOWN", "OVERSEER_ENERGY" }, --8
	
	GUARD_RANGE_4	= { spell_guard_range_mul 				= 0.50 },
	GUARD_ENERGY_4	= { module_guard_energy_cost_mul	= -0.25 },
	ROCKET_COOLDOWN_4		= { rocket_cooldown_coef_mul	= -0.25 },
	SET_GUARD_4	= { "GUARD_RANGE_4", "GUARD_ENERGY_4", "ROCKET_COOLDOWN_4"},
	
	SPEED_4				= { max_speed_mul  				= 0.1 },
	BOOST_ENERGY_4		= { boost_energy_cost_per_second_mul	= -0.538 },
	SET_ENGINEER_4		= {"SPEED_4", "PRIMARY_DAMAGE_4", "BOOST_ENERGY_4"},
	
	ENGINEER_PARAM_V2 = { spell_deploy_param_mul 			= 0.15 },
	ENGINEER_ENERGY_V2 = { module_deploy_energy_cost_mul	= -0.538 },
	SET_ENGINEER_8	= { "ENGINEER_COOLDOWN", "ENGINEER_ENERGY_V2", "ENGINEER_PARAM_V2" }, --8
	SET_PALOM_4 = {"PRIMARY_CRIT_4", "GUARD_ENERGY_4"},
	SET_EXORCIST_4 = {"PRIMARY_CRIT_4", "SNIPER_COOLDOWN"},
	SET_GRANITE_4 = {"COMMAND_GRNT_4"}, --Granite
	SET_GRANITE_8 = {"COMMAND_GRNT_8"}, --Granite
	SET_PRJCT_4 = {"SNIPER_ENERGY_PRJCT"}, --Project 1011
	SET_PRJCT_8 = {"SNIPER_RESIST_THERMAL"}, --Project 1011
	SET_WLFHND_4 = {"ATTACK_COOLDOWN_W"}, --Wolfhound
	SET_WLFHND_8 = {"ATTACK_BOOST_ENERGY"}, --Wolfhound
	SET_SPIKE_4	= {"STRAFE_SPEED", "SPEED" }, --Spike
	SET_SPIKE_8 = {"RECON_ENERGY", "PRIMARY_CRIT_DAMAGE" }, --Spike
	SET_SNGLRT_4 = {"TACKLER_SPEED"}, --Singularity
	SET_SNGLRT_8 = {"PRIMARY_CRIT_8"}, --Singularity
	SET_ZHEN_4 = {"TACKLER_SPEED"},--{ "SPEED" }, --Zhen
	SET_ZHEN_8 = {"PRIMARY_CRIT_8"},--{ "RAILGUN_BOOST_" },  --Zhen
	SET_CINQUEDEA_4 = {"STRAFE_SPEED", "SPEED", "ECM_ENERGY" },--{ "SPEED" }, --CINQUEDEA
	SET_CINQUEDEA_8 = {"ECM_ENERGY_8", "ECM_RANGE_8", "ECM_DURATION" },--{ "SPEED" }, --CINQUEDEA
	SET_HERALD4 = {"ECM_RANGE", "ECM_ENERGY", "SPEED"},
	SET_HERALD8 = {"PRIMARY_DAMAGE", "RAILGUN_BOOST_", "PLASMA_BOOST_"},
	SET_GNGNR_4 = {"SNIPER_COOLDOWN"}, --Gungnir
	SET_GNGNR_8 = {"SNIPER_RESIST_THERMAL"}, --Gungnir
	SET_TORNADO_4 = {"PRIMARY_DAMAGE_4"}, --Tornado
	SET_TORNADO_8 = { "HP_ALL_" }, --Tornado
	SET_RELIC_4 = {"ENERGY_REGEN", "VISION", "ROTATION_SPEED"}, --Relic
	SET_MOLE_4		= { "PRIMARY_CRIT_4", "ROTATION_SPEED", },
	SET_EMPEROR_4	= { "ENERGY_REGEN", "EMPEROR_HULL_RESIST_ALL", "ROTATION_SPEED", }, --Emperor
	SET_PROTOZAN_4 = {"SNIPER_COOLDOWN", "VISION", "ROTATION_SPEED"}, --Protozan
	SET_TYPHON_8	= { "PLASMA_BOOST_", "PRIMARY_CRIT", "RAILGUN_BOOST_" }, --8
	SET_CORVULNUS = {"ECM_RANGE_8", "ECM_DURATION", "ECM_ENERGY_8"},
	SET_HELIOS = {"ENERGY_REGEN", "VISION", "SNIPER_ENERGY"},
	SET_ACE_4 = {"SPEED_4", "ROTATION_SPEED", "ROCKET_DAMAGE"},
	SET_APEIRON_4	= {"ATTACK_COOLDOWN_W", "PRIMARY_HEAT_ADD_4", "PRIMARY_HEAT_SUB_4"},
	SET_CURLEGIBUS = {"SCOUT_RANGE", "RAILGUN_BOOST", "PLASMA_BOOST"},
}

--[[]]
VesselMaxExpPerBattle = 
{
	4000, -- rank 1
	5000, -- rank 2
	7000, -- rank 3
	8000, -- rank 4
	10000, -- rank 5
	11000, -- rank 6
	12000, -- rank 7
	14000, -- rank 8
	15000, -- rank 9
	16000, -- rank 10
	18000, -- rank 11
	20000, -- rank 12
	21000, -- rank 13
	23000, -- rank 14
	25000, -- rank 15
	25000, -- rank 16
	25000, -- rank 17
	25000, -- rank 18
}

VesselMaxExpPerFlight = 
{
	40000, -- rank 1
	41000, -- rank 2
	42000, -- rank 3
	43000, -- rank 4
	43000, -- rank 5
	46000, -- rank 6
	50000, -- rank 7
	60000, -- rank 8
	67000, -- rank 9
	78000, -- rank 10
	88000, -- rank 11
	94000, -- rank 12
	101000, -- rank 13
	104000, -- rank 14
	106000, -- rank 15
	106000, -- rank 16
	106000, -- rank 17
	106000, -- rank 18
}
--[[]]

--  настройки анлоков кораблей в новом дереве  #57557
LockRank = {
    [ai.Race.EMPIRE] = 		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5, 10, 10, 10 }, 
    [ai.Race.JERICHO] = 	{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5, 10, 10, 10 },  --{ 1, 1, 1, 4, 4, 4, 4, 8, 8, 8, 8, 12, 12, 12, 12, 16, 16, 16 },
    [ai.Race.FEDERATION] = 	{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5, 10, 10, 10 }, 
	[ai.Race.CRYSTAL] = 	{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5, 10, 10, 10 }, 
	[ai.Race.SPECIAL] = 	{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5, 10, 10, 10 }, 
--    [ai.Race.EMPIRE] = { 0, 1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 18, 20, 23, 28, 32, 35, 40 }, --{ 0, 0, 0, 0 , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
--    [ai.Race.JERICHO] = { 0, 1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 18, 20, 23, 28, 32, 35, 40 },
--    [ai.Race.FEDERATION] = { 0, 1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 18, 20, 23, 28, 32, 35, 40 },
}


