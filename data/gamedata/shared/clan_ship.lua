-- kf для тестов можно делать вообще 0 делать вместо 0.1 для лайва с 1.4.4 ускоряем и удешевляем всё в 10 раз. #67206
function ClanShipKF(x)
	---return 10 --- test only
	return math.max(1, math.ceil(x * 0.1))
end

ClanShipConstants = {
	part_duration		= ClanShipKF(604800), -- live seconds

	mine_T3_price		= ClanShipKF(10000),
	mine_T3_duration	= ClanShipKF(3*24*60*60), -- live seconds

	mine_T4_price		= ClanShipKF(35000),
	mine_T4_duration	= ClanShipKF(14*24*60*60), -- live seconds

	mine_T5_price		= ClanShipKF(50000),
	mine_T5_duration	= ClanShipKF(21*24*60*60), -- live seconds
	
	turret_T3_price		= ClanShipKF(5000),
	turret_T3_duration	= ClanShipKF(2*24*60*60), -- live seconds

	turret_T4_price		= ClanShipKF(25000),
	turret_T4_duration	= ClanShipKF(7*24*60*60), -- live seconds

	turret_T5_price		= ClanShipKF(40000),
	turret_T5_duration	= ClanShipKF(14*24*60*60), -- live seconds
	
	additional_price	= ClanShipKF(15000),
	additional_duration	= ClanShipKF(3*24*60*60), -- live seconds
}

ClanShipParts = {
	Shipyard =
	{
		price = ClanShipKF(5000), --1200, --50000, -- clan tokens
		duration = ClanShipConstants.part_duration, -- seconds
	},
	Carcas = {
		price = ClanShipKF(15000), --60000,
		duration = ClanShipConstants.part_duration, -- seconds
	},
	Engine = {
		price = ClanShipKF(20000), --80000,
		duration = ClanShipConstants.part_duration, -- seconds
	},
	Weapon = {
		price = ClanShipKF(25000), --110000,
		duration = ClanShipConstants.part_duration, -- seconds
	},
--main
	ClanShip_ShieldGeneratorA ={
		price = 1, --110000,
		duration = 1, --1080000,
	},
	ClanShip_TurretPowerB ={
		price = 1, --110000,
		duration = 1, --1080000,
	},
	ClanShip_TicketTowerC ={
		price = 1, --110000,
		duration = 1, --1080000,
	},
--main 1
	ClanShip_ShieldGenerator_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_ShieldGenerator_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_ShieldGenerator_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},
--
	ClanShip_ShieldMultiphased_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_ShieldMultiphased_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_ShieldMultiphased_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},
--
	ClanShip_ShieldHard_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_ShieldHard_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_ShieldHard_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},

	ClanShip_FedShieldGeneratorA ={
		price = 1, --110000,
		duration = 1, --1080000,
	},
	
	ClanShip_FedShieldGenerator_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_FedShieldGenerator_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_FedShieldGenerator_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},
--
	ClanShip_FedShieldMultiphased_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_FedShieldMultiphased_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_FedShieldMultiphased_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},
--
	ClanShip_FedShieldHard_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_FedShieldHard_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_FedShieldHard_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},

	ClanShip_JerShieldGeneratorA ={
		price = 1, --110000,
		duration = 1, --1080000,
	},
	
	ClanShip_JerShieldGenerator_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_JerShieldGenerator_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_JerShieldGenerator_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},
--
	ClanShip_JerShieldMultiphased_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_JerShieldMultiphased_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_JerShieldMultiphased_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},
--
	ClanShip_JerShieldHard_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_JerShieldHard_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_JerShieldHard_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},
	
--main 2
	ClanShip_CannonControl_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_CannonControl_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_CannonControl_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},

	ClanShip_ArmorPenetration_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_ArmorPenetration_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_ArmorPenetration_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},

	ClanShip_ION_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_ION_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_ION_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},
--main 3
	ClanShip_Angar_t3 ={
		price	 = ClanShipConstants.mine_T3_price,
		duration = ClanShipConstants.mine_T3_duration,
	},
	ClanShip_Angar_t4 ={
		price	 = ClanShipConstants.mine_T4_price,
		duration = ClanShipConstants.mine_T4_duration,
	},
	ClanShip_Angar_t5 ={
		price	 = ClanShipConstants.mine_T5_price,
		duration = ClanShipConstants.mine_T5_duration,
	},

	
	
--additional
	ClanShip_SideTurret_t3 = {
		price	 = ClanShipConstants.turret_T3_price,
		duration = ClanShipConstants.turret_T3_duration,
	},
	ClanShip_SideTurret_t4 = {
		price	 = ClanShipConstants.turret_T4_price,
		duration = ClanShipConstants.turret_T4_duration,
	},
	ClanShip_SideTurret_t5 = {
		price	 = ClanShipConstants.turret_T5_price,
		duration = ClanShipConstants.turret_T5_duration,
	},

	ClanShip_SideRocketTurret_t3 = {
		price	 = ClanShipConstants.turret_T3_price,
		duration = ClanShipConstants.turret_T3_duration,
	},
	ClanShip_SideRocketTurret_t4 = {
		price	 = ClanShipConstants.turret_T4_price,
		duration = ClanShipConstants.turret_T4_duration,
	},
	ClanShip_SideRocketTurret_t5 = {
		price	 = ClanShipConstants.turret_T5_price,
		duration = ClanShipConstants.turret_T5_duration,
	},

	ClanShip_ThermalRocketTurret_t3 = {
		price	 = ClanShipConstants.turret_T3_price,
		duration = ClanShipConstants.turret_T3_duration,
	},
	ClanShip_ThermalRocketTurret_t4 = {
		price	 = ClanShipConstants.turret_T4_price,
		duration = ClanShipConstants.turret_T4_duration,
	},
	ClanShip_ThermalRocketTurret_t5 = {
		price	 = ClanShipConstants.turret_T5_price,
		duration = ClanShipConstants.turret_T5_duration,
	},

	ClanShip_Accelerator = {
		price	 = ClanShipConstants.additional_price,
		duration = ClanShipConstants.additional_duration,
	},
	
	ClanShip_TorpedoSource = {
		price	 = ClanShipConstants.additional_price,
		duration = ClanShipConstants.additional_duration,
	},
	
	ClanShip_BombDispenser = {
		price	 = ClanShipConstants.additional_price,
		duration = ClanShipConstants.additional_duration,
	},

	ClanShip_CritAura = {
		price	 = ClanShipConstants.additional_price,
		duration = ClanShipConstants.additional_duration,
	},
}



--
ClanShipDefs = {}


ClanShipDefs.EmpireDesign = {
	station_race = ai.Race.EMPIRE,
	--bfs_sector_color = 0xffbbbb00, -- желтый
	
	--repair_price = 5000, --вырезали поломки.
	--repair_duration = 7200,

	ship_build_order = {
	-- ничего нет - арта нет пока
		"Shipyard",		-- арт есть 
		"Carcas", 		-- арт есть "начало строительства"
		"Engine",		-- арт есть "почти доделано"
		"Weapon"		-- добавляем объекты  "главный калибр"
	},

	part_to_map = {
		Shipyard_completed	= 103,
		Carcas				= 10410,
		Carcas_completed	= 10305,
		Engine				= 1030610,
		Engine_completed	= 10307,
		Weapon				= 1030811,
		Weapon_completed	= 10309,
		Away				= 112,
	},

	slots = {
		-- !!! в каждой линейке апгрейдов должны быть такие же кол-ва (по тирам), как и в других линейках
		--щит
		main_1 = {
			free 				= { "ClanShip_ShieldGenerator_t3", },
			autofit_line = 1,
			upgrade_lines 	= {
				{ "ClanShip_ShieldGenerator_t3", "ClanShip_ShieldGenerator_t4", "ClanShip_ShieldGenerator_t5" },
				{ "ClanShip_ShieldMultiphased_t3", "ClanShip_ShieldMultiphased_t4", "ClanShip_ShieldMultiphased_t5" },
				{ "ClanShip_ShieldHard_t3", "ClanShip_ShieldHard_t4", "ClanShip_ShieldHard_t5" },
			},
		},
		main_2 = {
			free 				= { "ClanShip_CannonControl_t3", },
			autofit_line = 1,
			upgrade_lines 	= {
				{ "ClanShip_CannonControl_t3", "ClanShip_CannonControl_t4", "ClanShip_CannonControl_t5" },
				{ "ClanShip_ArmorPenetration_t3", "ClanShip_ArmorPenetration_t4", "ClanShip_ArmorPenetration_t5" },
				---{ "ClanShip_ION_t3", "ClanShip_ION_t4", "ClanShip_ION_t5" },	---t5_test
			},
		},
		main_3 = {
			free 				= { "ClanShip_Angar_t3", },
			autofit_line = 1,
			upgrade_lines 	= {
				{ "ClanShip_Angar_t3", "ClanShip_Angar_t4", "ClanShip_Angar_t5" },
			},
		},
		
		turret_1		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		turret_2		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		turret_3		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		turret_4		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		additional_1	= {
			---upgrade_lines = { "ClanShip_TorpedoSource",	},
			upgrade_lines = { "ClanShip_Accelerator",		"ClanShip_TorpedoSource",		},
		},
		additional_2	= {
			upgrade_lines = { "ClanShip_BombDispenser",	},
			--upgrade_lines = { "ClanShip_BombDispenser",		"ClanShip_CritAura",		}, -- "ClanShip_Marinos"
		},
		decoration_1 = {
			visible = false,
			non_battle = true,
			upgrade_lines = {{ "Postament_EmpHologramShip2", },},
		},
		decoration_2 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_3 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_4 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_5 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_6 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_7 = {
			visible = false,
			upgrade_lines = {{ "ClanShip_Monument_Scorp", },},
		},		
	},
	
	slots_ui = {
		{ name="main_1", x = 340, y = 260 },
		{ name="main_2", x = 620, y = 295 },
		{ name="main_3", x = 200, y = 90 },
		{ name="turret_1", x = 547, y = 358 },
		{ name="turret_2", x = 340, y = 285 },
		{ name="turret_3", x = 250, y = 220 },
		{ name="turret_4", x = 160, y = 180 },
		{ name="additional_1", x = 515, y = 340 },
		{ name="additional_2", x = 560, y = 280 },
	},
	
--Эти параметры нужны чтобы дредноуты были "разными"
	NPC_squad_members = {{
		{ "Ship_Bot_ClanShipDroneBig_Empire" , Vec3( 0, 0, 15 ) },
	}},
--скорострельность главного калибра для настроек чтобы дредноуты были "разными"
--переносим сюда из геймплейсеттингс
-- теперь у нас кулдаун в прототипе пушки
--	volley_interval			= 14.61, -- посчитано чтобы абсолютно точно соответствовало +7.5к щита иерихона.
	
--переносим сюда из геймплейсеттингс
	clanship_shield			= 50,
	--синтетические параметры для интерфейса
	clanship_shield_regen				= 80 * 3 * 62, -- clan_ship_shield_heal * количество * секунды
	clanship_damage_per_minute			= math.floor( 1200 * 3 * 60 / 14.61 ), -- damage * количество * секунды / volley_interval
	--clanship_mainTurret = "ClanShip_MainTurret", -- реально пушка прописана в сцене, но здесь чтобы считать цифры ДПС для интерфейса
	clanship_mainTurret = "ClanShip_MainTurret_Empire", -- реально пушка прописана в сцене, но здесь чтобы считать цифры ДПС для интерфейса

--Регенерация щита через "маяк" должна настраиваться здесь для разных дредноутов
	---clan_ship_shield_heal	= 20, --  будем брать из прототипа щита
	
	startupParameters = {
		left = 2,
		right = 3,
	},
	
	clanship_bonuses		= {
		{ type = ai.ClanshipBonus.SHIELD_REGEN, activation = ai.ClansShipActivationType.ALWAYS, param = 0.6 },	--- 0.8 1.5 1.3 0.9
	},
}

ClanShipDefs.JerichoDesign = {
	station_race = ai.Race.JERICHO,
	--bfs_sector_color = 0xff83211d, -- красный
	
	ship_build_order = {
	-- ничего нет - арта нет пока
		"Shipyard",		-- арт есть 
		"Carcas", 		-- арт есть "начало строительства"
		"Engine",		-- арт есть "почти доделано"
		"Weapon"		-- добавляем объекты  "главный калибр"
	},

	part_to_map = {
		Shipyard_completed	= 103,
		Carcas				= 10410,
		Carcas_completed	= 10305,
		Engine				= 1030610,
		Engine_completed	= 10307,
		Weapon				= 1030811,
		Weapon_completed	= 10309,
		Away				= 112,
	},

	slots = {
		-- !!! в каждой линейке апгрейдов должны быть такие же кол-ва (по тирам), как и в других линейках
		--щит
		main_1 = {
			free 				= { "ClanShip_JerShieldGenerator_t3", },
			autofit_line = 1,
			upgrade_lines 	= {
				{ "ClanShip_JerShieldGenerator_t3", "ClanShip_JerShieldGenerator_t4", "ClanShip_JerShieldGenerator_t5" },
				{ "ClanShip_JerShieldMultiphased_t3", "ClanShip_JerShieldMultiphased_t4", "ClanShip_JerShieldMultiphased_t5" },
				{ "ClanShip_JerShieldHard_t3", "ClanShip_JerShieldHard_t4", "ClanShip_JerShieldHard_t5" },
			},
		},
		main_2 = {
			free 				= { "ClanShip_CannonControl_t3", },
			autofit_line = 1, 
			upgrade_lines 	= {
				{ "ClanShip_CannonControl_t3", "ClanShip_CannonControl_t4", "ClanShip_CannonControl_t5" },
				{ "ClanShip_ArmorPenetration_t3", "ClanShip_ArmorPenetration_t4", "ClanShip_ArmorPenetration_t5" },
				---{ "ClanShip_ION_t3", "ClanShip_ION_t4", "ClanShip_ION_t5" },	---t5_test
			},
		},
		main_3 = {
			free 				= { "ClanShip_Angar_t3", },
			autofit_line = 1,
			upgrade_lines 	= {
				{ "ClanShip_Angar_t3", "ClanShip_Angar_t4", "ClanShip_Angar_t5" },
			},
		}, 
		
		turret_1		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		turret_2		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		turret_3		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		turret_4		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		additional_1	= {
			---upgrade_lines = { "ClanShip_TorpedoSource",	},
			upgrade_lines = { "ClanShip_Accelerator",		"ClanShip_TorpedoSource",		},
		},
		additional_2	= {
			upgrade_lines = { "ClanShip_BombDispenser",	},
			--upgrade_lines = { "ClanShip_BombDispenser",		"ClanShip_CritAura",		},
			-- "ClanShip_Marinos"
		},
		decoration_1 = {
			visible = false,
			non_battle = true,
			upgrade_lines = {{ "Postament_JerHologramShip2", },},
		},
		decoration_2 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_3 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_4 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_5 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_6 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_7 = {
			visible = false,
			upgrade_lines = {{ "ClanShip_Monument_Scorp", },},
		},	
	},
	
	slots_ui = {
		{ name="main_1", x = 340, y = 180 },
		{ name="main_2", x = 610, y = 265 },
		{ name="main_3", x = 200, y = 85 },
		{ name="turret_1", x = 590, y = 300 },
		{ name="turret_2", x = 435, y = 250 },
		{ name="turret_3", x = 250, y = 185 },
		{ name="turret_4", x = 125, y = 155 },
		{ name="additional_1", x = 540, y = 235 },
		{ name="additional_2", x = 500, y = 235 },
	},
	
--Эти параметры нужны чтобы дредноуты были "разными"
	NPC_squad_members = {{
		{ "Ship_Bot_ClanShipDroneBig_Jericho" , Vec3( 0, 0, 15 ) },
	}},
--скорострельность главного калибра для настроек чтобы дредноуты были "разными"
--переносим сюда из геймплейсеттингс
	
--переносим сюда из геймплейсеттингс
	clanship_shield			= 66,
	
	--синтетические параметры для интерфейса
	clanship_shield_regen		= 100 * 3 * 62, -- 20 clan_ship_shield_heal * количество * секунды #81316
	clanship_damage_per_minute	= 1200 * 3 * 60 / 15, -- damage * количество * секунды / volley_interval
	clanship_mainTurret = "ClanShip_MainTurret", -- реально пушка прописана в сцене, но здесь чтобы считать цифры ДПС для интерфейса
--Регенерация щита через "маяк" должна настраиваться здесь для разных дредноутов
	---clan_ship_shield_heal	= 20, --  будем брать из прототипа щита
	

	startupParameters = {
		left = 6,
		right = 7,
	},
	
	clanship_bonuses		= {
		--{ type = ai.ClanshipBonus.INCREASE_TIKETS_ADD, activation = ai.ClansShipActivationType.ON_SPAWN, param = 220 },
		{ type = ai.ClanshipBonus.SHIELD_REGEN, activation = ai.ClansShipActivationType.ALWAYS, param = 0.85 },	--- 1.0 1.5 1.8 0.33 0.225 0.1  0.075 #65691 #80440
	},
}

ClanShipDefs.FederationDesign = {
	station_race = ai.Race.FEDERATION,
	--bfs_sector_color = 0xff4aadff, -- синий

	repair_price = 5000,
	repair_duration = 7200,
	
	ship_build_order = {
	-- ничего нет - арта нет пока
		"Shipyard",		-- арт есть
		"Carcas", 		-- арт есть "начало строительства"
		"Engine",		-- арт есть "почти доделано"
		"Weapon"		-- добавляем объекты  "главный калибр"
	},

	part_to_map = {
		Shipyard_completed	= 103,
		Carcas				= 10410,
		Carcas_completed	= 10305,
		Engine				= 1030610,
		Engine_completed	= 10307,
		Weapon				= 1030811,
		Weapon_completed	= 10309,
		Away				= 112,
	},

	slots = {
		-- !!! в каждой линейке апгрейдов должны быть такие же кол-ва (по тирам), как и в других линейках
		--щит
		main_1 = {
			free 				= { "ClanShip_FedShieldGenerator_t3", },
			autofit_line = 1,
			upgrade_lines 	= {
				{ "ClanShip_FedShieldGenerator_t3", "ClanShip_FedShieldGenerator_t4", "ClanShip_FedShieldGenerator_t5" },
				{ "ClanShip_FedShieldMultiphased_t3", "ClanShip_FedShieldMultiphased_t4", "ClanShip_FedShieldMultiphased_t5" },
				{ "ClanShip_FedShieldHard_t3", "ClanShip_FedShieldHard_t4", "ClanShip_FedShieldHard_t5" },
			},
		}, 
		main_2 = {
			free 				= { "ClanShip_CannonControl_t3", },
			autofit_line = 1,
			upgrade_lines 	= {
				{ "ClanShip_CannonControl_t3", "ClanShip_CannonControl_t4", "ClanShip_CannonControl_t5" },
				{ "ClanShip_ArmorPenetration_t3", "ClanShip_ArmorPenetration_t4", "ClanShip_ArmorPenetration_t5" },
				---{ "ClanShip_ION_t3", "ClanShip_ION_t4", "ClanShip_ION_t5" },	---t5_test
			},
		},
		main_3 = {
			free 				= { "ClanShip_Angar_t3", },
			autofit_line = 1,
			upgrade_lines 	= {
				{ "ClanShip_Angar_t3", "ClanShip_Angar_t4", "ClanShip_Angar_t5" },
			},
		},
		
		turret_1		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		turret_2		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		turret_3		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		turret_4		= {
			upgrade_lines = {
				{ "ClanShip_SideTurret_t3", "ClanShip_SideTurret_t4", "ClanShip_SideTurret_t5" },
				{ "ClanShip_SideRocketTurret_t3", "ClanShip_SideRocketTurret_t4", "ClanShip_SideRocketTurret_t5" },
				{ "ClanShip_ThermalRocketTurret_t3", "ClanShip_ThermalRocketTurret_t4", "ClanShip_ThermalRocketTurret_t5" },
			},
		},
		additional_1	= {
			---upgrade_lines = { "ClanShip_TorpedoSource",	},
			upgrade_lines = { "ClanShip_Accelerator",		"ClanShip_TorpedoSource",		},
		},
		additional_2	= {
			upgrade_lines = { "ClanShip_BombDispenser",	},
			--upgrade_lines = { "ClanShip_BombDispenser",		"ClanShip_CritAura",		}, -- "ClanShip_Marinos"
		},
		decoration_1 = {
			visible = false,
			non_battle = true,
			upgrade_lines = {{ "Postament_FedHologramShip2", },},
		},
		decoration_2 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_3 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_4 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_5 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_6 = {
			visible = false,
			upgrade_lines = {{ },},
		},
		decoration_7 = {
			visible = false,
			upgrade_lines = {{ "ClanShip_Monument_Scorp", },},
		},
	},
	
	slots_ui = {
		{ name="main_1", x = 330, y = 230 },
		{ name="main_2", x = 640, y = 300 },
		{ name="main_3", x = 140, y = 135 },
		{ name="turret_1", x = 160, y = 180 },
		{ name="turret_2", x = 235, y = 275 },
		{ name="turret_3", x = 440, y = 340 },
		{ name="turret_4", x = 620, y = 400 },
		{ name="additional_1", x = 330, y = 290 },
		{ name="additional_2", x = 470, y = 270 },
	},
	
--Эти параметры нужны чтобы дредноуты были "разными"
	NPC_squad_members = {{
		{ "Ship_Bot_ClanShipDroneBig_Federation" , Vec3( 0, 0, -15 ) },
	}},

--скорострельность главного калибра для настроек чтобы дредноуты были "разными"
--переносим сюда из геймплейсеттингс
	
--переносим сюда из геймплейсеттингс
	clanship_shield			= 60,
	--синтетические параметры для интерфейса
	clanship_shield_regen		= 60 * 3 * 62, -- clan_ship_shield_heal * количество * секунды
	clanship_damage_per_minute	= 600 * 3 * 60 / 15, -- damage * количество * секунды / volley_interval
	clanship_mainTurret 		= "ClanShip_MainTurret", -- реально пушка прописана в сцене, но здесь чтобы считать цифры ДПС для интерфейса

--Регенерация щита через "маяк" должна настраиваться здесь для разных дредноутов
	---clan_ship_shield_heal	= 20, --  будем брать из прототипа щита
	

	startupParameters = {
		left = 4,
		right = 5,
	},
	
	clanship_bonuses		= {
		{ type = ai.ClanshipBonus.INCREASE_TIKETS_ADD, activation = ai.ClansShipActivationType.ON_SPAWN, param = 300 },	--500 200 #102573
		{ type = ai.ClanshipBonus.SHIELD_REGEN, activation = ai.ClansShipActivationType.ALWAYS, param = 0.5 },	--- 0.4 0.6 0.5 0.3 0.9
	},
}

--функция для подсчета параметров дредноута в окне интерфейса
function ClanShipGetParams( defName ) --="EmpireDesign"  "JerichoDesign" "FederationDesign"
	local k = 10 -- модификатор щитов и повреждений
	local fitTable = MasterServer_ClanShipGet( defName ) -- получаем фит
	local tickets = GameplayDef[ ai.Gameplay.CLANSHIP ].tdm_starting_points -- стартовые тикеты
	local DPS = Def[ ClanShipDefs[ defName ].clanship_mainTurret ].clan_ship_damage * 3  / Def[ ClanShipDefs[ defName ].clanship_mainTurret ].volley_interval * k
	local DPS_bonus = 0
	local shield = ClanShipDefs[ defName ].clanship_shield * k
	local shield_regen = 0

	--собираем цифры от текущего набора бонусов
	local function ParseBonuses( bonuses )
		for bonus_index, bonus in pairs( bonuses ) do -- пробегаемся по бонусам текущего модуля
			if bonus.type == ai.ClanshipBonus.INCREASE_TIKETS_ADD then
				tickets = tickets + bonus.param
			end
			if bonus.type == ai.ClanshipBonus.SHIELD_CAPACITY then
				shield = shield + bonus.param * k
			end
			if bonus.type == ai.ClanshipBonus.SHIELD_REGEN then
				shield_regen = shield_regen + bonus.param * k
			end
			if bonus.type == ai.ClanshipBonus.MAIN_TURRET_DAMAGE then
				DPS_bonus = DPS_bonus + bonus.param
			end
		end
	end
	
	
	-- Собираем бонусы вшитые прямо в дредноут
	if ClanShipDefs[ defName ] and ClanShipDefs[ defName ].clanship_bonuses then
		ParseBonuses( ClanShipDefs[ defName ].clanship_bonuses )
	end
	
	--Собираем бонусы с модулей
	if fitTable.moduleSlots then
		for i, v in pairs( fitTable.moduleSlots ) do  --пробегаемся по одетым модулям
			--dprint(v.fit) 
			if v.fit and Def[v.fit] and Def[v.fit].clanship_bonuses then
				ParseBonuses( Def[v.fit].clanship_bonuses )
			end
		end
	end
	DPS = DPS * ( 1 + DPS_bonus )
	
	return math.floor( tickets ), math.floor( shield ), math.floor( shield_regen ), math.floor( DPS * 100 + 0.5 ) / 100
end



ClanShipDefs.EmpireDesign.default_fit = {
	main_1			= "ClanShip_ShieldGenerator_t3",
	main_2			= "ClanShip_CannonControl_t3",
	main_3			= "ClanShip_Angar_t3",
	turret_1		= "ClanShip_SideTurret_t3",
	turret_2		= "ClanShip_SideTurret_t3",
	turret_3		= "ClanShip_SideTurret_t3",
	turret_4		= "ClanShip_SideTurret_t3",
	additional_1	= "ClanShip_Accelerator",
	--additional_1	= "ClanShip_TorpedoSource",
	--[[additional_2	= "ClanShip_CritAura",]]
	additional_2	= "ClanShip_MineFieldDispenser",
}

ClanShipDefs.JerichoDesign.default_fit = {
	main_1			= "ClanShip_JerShieldMultiphased_t3",
	main_2			= "ClanShip_CannonControl_t3",
	main_3			= "ClanShip_Angar_t3",
	turret_1		= "ClanShip_SideTurret_t3",
	turret_2		= "ClanShip_SideTurret_t3",
	turret_3		= "ClanShip_SideTurret_t3",
	turret_4		= "ClanShip_SideTurret_t3",
	additional_1	= "ClanShip_Accelerator",
	additional_2	= "ClanShip_BombDispenser",
}

ClanShipDefs.FederationDesign.default_fit = {
	main_1			= "ClanShip_FedShieldGenerator_t3",
	main_2			= "ClanShip_CannonControl_t3",
	main_3			= "ClanShip_Angar_t3",
	turret_1		= "ClanShip_SideTurret_t3",
	turret_2		= "ClanShip_SideRocketTurret_t3",
	turret_3		= "ClanShip_SideRocketTurret_t3",
	turret_4		= "ClanShip_SideTurret_t3",
	additional_1	= "ClanShip_TorpedoSource",
	additional_2	= "ClanShip_BombDispenser",
}