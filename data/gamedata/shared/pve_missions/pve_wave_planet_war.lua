--
PvE_Missions.planet_war_waves_T1 = 
{
	levelName = "pve_wave_planet_war",
	scenario_description = { "wave_planet_war_str1", "wave_planet_war_str2", "wave_planet_war_str3" },
	need_spawn_warp = true,
	is_boss = true,
	waves_ui_hide = true,
	target_def = "Helpers_DistPoint",	
	event_loot_attempts = 3,

	desc = "",
	resurrection_attempts = 5,
	item_lvl = 7, -- параметр для начисления награды.
	accountRank = 2,
	rank  = 1, --PvE_breckets.low[1],  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.low[3],
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	disabled = false,
	HudDialogs = {},

	turret_health_coef = 1.0,
	turret_damage_coef = 1.0,	
	
	difficulty = "easy",
	
	-- дополняются скриптом!!!
	squads = {
		{
			name = "MobileSpawn",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn",
			route = "3",
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			spawn_ignore_collision = true,
			first_spawn_delay = 15000,
			respawn_time = 10000,
			players_first = true,
			
			members = 
			{	
				{
					{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 0, 0, 0 ) },
					{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 15, 0, 15 ) },
					{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 0, 15, -15 ) },
					{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, -15, 0 ) },
					{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 0, -15, 15 ) },
					{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 15, 15, 0 ) },
				},
			},
		},
	},
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			exp_reward_portion = 3,
			cred_reward_portion = 3,
			loot_attempts_reward = 4,
			player_spawn_group = 0,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "wave_planet_war_r1_rdesc", 
			start_sentence = "CMDR_WAVE_PW_PVE_START_ROUND",
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			modifiers =
			{
			},
			
			start_event = 
			{
				{  target = "WarpGate1", action = "FullDeactivate", },
			},

			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 14,
				
					{	def = "Ship_Bot_TrueMeat_R3_S_T1", count = 1, spawn_group = 1, spawn_warp = true, delay = 9999, }, 
				},
			},
			phases = 
 			{
    			[ 1 ] = {},
				
				[ 2 ] = {},

				[ 3 ] =
					{
						start_sentence = "CMDR_WAVE_PW_PVE_BOSS",
					},	
            },
		},	
	},
}


PvE_Missions.planet_war_waves_T5 = 
{
	levelName = "pve_wave_planet_war",
	scenario_description = { "wave_planet_war_str1", "wave_planet_war_str2", "wave_planet_war_str3" },
	need_spawn_warp = true,
	is_boss = true,	
	waves_ui_hide = true,
	target_def = "Helpers_DistPoint",	
	
	desc = "",
	resurrection_attempts = 2,
	item_lvl = 25, -- параметр для начисления награды.
	accountRank = 9,
	rank  = 6,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	bot_difficulty = 3, -- параметр задающий сложность ботов.
	disabled = false,
	-- "все корабли почти равны"
	rank_scale_spells = BuffByRankPVE, --BuffByRank,  -- бафф усиляющий корабли низкого ранга против ботов  (ранг боя чит цваром cvars.sv_mmBattleRank =15 при загрузке миссии)
	HudDialogs = {},
	
	turret_health_coef = 4.0,
	turret_damage_coef = 4.0,	
	
	difficulty = "hard",
	
	-- дополняются скриптом!!!
	squads = {
		{
			name = "MobileSpawn",
	 		relationship_group = 2,
			spawn_spot = "mobile_spawn",
			route = "3",
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			spawn_ignore_collision = true,
			first_spawn_delay = 15000,
			respawn_time = 10000,
			players_first = true,
			
			members = 
			{	
				{
					{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 0, 0, 0 ) },
					{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 20, 0, 20 ) },
					{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 0, 20, -20 ) },
					{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -20, -20, 0 ) },
					{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 0, -20, 20 ) },
					{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 20, 20, 0 ) },
					{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -20, 0, -20 ) },
					{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 20, -20, -20 ) },
					{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -20, 20, 0 ) },
				},
			},
		},
	},
	
	rounds = 
	{
		[ 1 ] =
		
		{
			type = "SURVIVE",
			exp_reward_portion = 3,
			cred_reward_portion = 3,
			loot_attempts_reward = 3,
			player_spawn_group = 0,
			loot_tables = {{"PVE_T1_PassiveSet"}, {"PVE_T2_ActiveSet"}, {"PVE_T3_ActiveSet"}, {"PVE_T4_ActiveSet"}, {"PVE_T5_ActiveSet"}},

			uiRoundDesc = "wave_planet_war_r1_rdesc", 
			start_sentence = "CMDR_WAVE_PW_PVE_START_ROUND",

			modifiers =
			{
			},
			
			start_event = 
			{
				{  target = "WarpGate1", action = "FullDeactivate", },
			},

			waves =
			{
				[ 1 ] = --35
				{
					max_agents_at_same_time = 14,
				
					{	def = "Ship_Bot_TrueMeat_R3_S_T1", count = 1, spawn_group = 1, spawn_warp = true, delay = 9999, }, 
				},
			},
			phases = 
 			{
    			[ 1 ] = {},
				
				[ 2 ] = {},

				[ 3 ] =
					{
						start_sentence = "CMDR_WAVE_PW_PVE_BOSS",
					},	
            },
		},	
	},
}


-----------------------------------------------------------------------------------------------------------

-- Общий контейнер
PvE_WPW = {
	nPhase = -2,	-- это необходимо для запуска настройки

	aPatrolFromPortal = { 1,1,1, 1,1,1, 1,1,1,1,1,1,1,1,5, 1,1,1,1,1, 1, },	-- сколько патрулей вылетит из портала, спосок ботов берётся рандомно из указанных выриантов для портала
	
	aCargoShips = {},

	aCargoShips_T1 = {
		{ portal = 15, patrol = 1, cargoship =  "PvE_wave_HugeCargo_T1", path = "cargo_path", spell = "SmartBombFar_RW", },
	},
	aCargoShips_T5 = {
		{ portal = 15, patrol = 1, cargoship =  "PvE_wave_HugeCargo_T5", path = "cargo_path", spell = "SmartBombFar_RW", },
	},
	
	aSnipers = {
		{ portal = 7, patrol = 1, enemy_pack_radius = 300, },
		{ portal = 9, patrol = 1, enemy_pack_radius = 300, },
		{ portal = 10, patrol = 1, enemy_pack_radius = 300, },
		{ portal = 11, patrol = 1, enemy_pack_radius = 300, },
		{ portal = 12, patrol = 1, enemy_pack_radius = 300, },
		{ portal = 14, patrol = 1, enemy_pack_radius = 300, },
		{ portal = 16, patrol = 1, enemy_pack_radius = 300, },
		{ portal = 19, patrol = 1, enemy_pack_radius = 300, },
	},
	
	-- список порталов которые откроются, если всех ботов завалить, каждый вариант в отдельной строке регулируется nVariant
	aSequence = {
		{{3, 4, 10,}, {1, 2, 19,}, {6, 7, 11, 12, 16, 9, 14, 20, 21,}, {13, 17, 18, 8, 5,}, {15,},}, 
	},
	nVariant = 1,

	aWarpGateSequence = {	-- ПОСЛЕ закрытия всех порталов в волне откроется варпгейт с этим номером 0-все уберутся, количество фаз должено совпадать с описанием в aSequence
		{0, 0, 0, 0, 0},
	},

	-- не используемый функционал станции отключил и удалил сами станции с карты в целях экономии
	-- aStationSequence = {	-- вместе с волной включится станция поддержки с указанным номером, елси номер со знаком "-" то на этой волне будет раздаваться бонус от станции (если она ещё жива будет)
		-- {0, 0, 0, 0, 0},
	-- },
	--nCurrentStation = 0, -- текущая живая станция, чтобы не включать снова её же
	
	nWait = 15, -- между волнами порталов ждать в сек.
	nPortalsIgnore = 0, -- сколько порталов должно остаться для запуска следующей волны (защита от заплутавших ботов)
	
	amembers = {},
	amembers_T1 = {},
	amembers_T5 = {},
	
	
	HudDialogs = 
	{
		{
			 { character = "general_soldier", text = "pve_wave_planet_war_start_1", },
		},	
		{
			 { character = "general_soldier", text = "pve_wave_planet_war_inside_1", },
		},		
		{
			 { character = "general_soldier", text = "pve_wave_planet_war_barza_1", },
		},			
	},	
	
	minloglevel = 0,	-- уровень обрезки логов (начиная с этого номера не будет логгирования, если поставить 0 - то логгирование вообще отключается)
	nkd = 0,	-- сколько попыток вывода лога пропускать по умолчанию
	akd = {},	-- массив для хранения попыток вывод логов с разными уровнями	
	
	nWin = 0 -- % прохождения, для расчёта наград
}

-- многоуровневое логгирование, только текст, можно указанывать уровень (чем меньше число тем важнее сообщение), и периодичность в вызовах
function PvE_WPW:slog(stext, nlevel, nkd)
	if not nkd then nkd = PvE_WPW.nkd end -- если не указать таймер, то берём по умолчанию
	if not nlevel then nlevel = 0 end -- елси не указать уровень, то логгировать всегда
	if nlevel < PvE_WPW.minloglevel then
		b = true
		if nkd > 0 then
			b = false
			if not PvE_WPW.akd[nlevel] then
				PvE_WPW.akd[nlevel] = -1
			else
				PvE_WPW.akd[nlevel] = PvE_WPW.akd[nlevel] - 1
			end
			if PvE_WPW.akd[nlevel] < 0 then
				PvE_WPW.akd[nlevel] = nkd - 1
				b = true
			end
		end
		if b then
			sys.log( stext )
		end
	end
end

-- формирование состава аддов в порталах
local iportal
local ipatrol


PvE_WPW.amembers_T1 = {
		{	
--1,1
			{		
				{ "Bot_Wave_PW_Meat_Inter_M_T1" , Vec3( 0, 0, 0 ) },
			},		
			{			
				{ "Bot_Wave_PW_Rocket_T1" , Vec3( 0, 0, 0 ) },	
			},				
		},	
--2,2	
		{
			{	
				{ "Bot_Wave_PW_Meat_Inter_M_T1" , Vec3( 0, 0, 0 ) },		
			},		
			{			
				{ "Bot_Wave_PW_Rocket_T1" , Vec3( 0, 0, 0 ) },	
			},				
		},
--1,3	
		{
			{
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 15, 15, 0 ) },				
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 0, -15, 15 ) },				
			},	
		},	
--2,4
		{
			{
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 15, 15, 0 ) },				
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 0, -15, 15 ) },				
			},		
		},
--1,5		
		{
			{
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 0, 0, 15 ) },					
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 0, 15, 0 ) },
			},	
			{			
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 0, 15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 15, 0 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 0, -15 ) },	
				---{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 15, 0, 15 ) },	
			},				
		},	
--2,6		
		{
			{
				----{ "Bot_Wave_PW_HardShield_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T1" , Vec3( 15, 15, 0 ) },	--#79539
			},				
		},		
--1,7		
		{
			{
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( -15, 0, 0 ) },	
			},				
		},	
--2,8		
		{
			{
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 0, 0, 15 ) },					
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 0, 15, 0 ) },
			},		
			{			
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 0, 15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 15, 0 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 0, -15 ) },	
				---{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 15, 0, 15 ) },	
			},				
		},
--1,9		
		{
			{	
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( -15, 0, 0 ) },
			},
		},
--2,15		
		{
			{	
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( -15, 0, 0 ) },
			},
		},
--1,11		
		{
			{			
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( -15, 0, 0 ) },	
			},					
		},	
--2,12
		{
			{			
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( -15, 0, 0 ) },	
			},					
		},		
--1,13		
		{
			{
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 0, 15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 15, 0 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 0, 0, -15 ) },	
				---{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },
				---{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T1" , Vec3( 15, 0, 15 ) },	
				{ "Bot_Wave_PW_EnergyHardShield_T1" , Vec3( 15, 0, 0 ) },
				-----{ "Bot_Wave_PW_EnergyHardShield_T1" , Vec3( 15, 0, -15 ) },
				{ "Bot_Wave_PW_EnergyHardShield_T1" , Vec3( 15, 15, 0 ) },	--#79539
			},	
			{
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 0, 0, 15 ) },					
				---{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T1" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_PW_HardShield_T1" , Vec3( 15, 0, 0 ) },
				-----{ "Bot_Wave_PW_HardShield_T1" , Vec3( 15, 0, -15 ) },
				{ "Bot_Wave_PW_HardShield_T1" , Vec3( 15, 15, 0 ) },	--#79539
			},			
		},	
--2,14
		{
			{			
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( -15, 0, 0 ) },
			},			
		},	
--1,15		
		{
			{			
			},	
		},	
--2,16
		{
			{
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( -15, 0, 0 ) },			
			},	
		},	
--1,17		
		{
			{
				-----{ "Bot_Wave_PW_HardShield_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T1" , Vec3( 15, 15, 0 ) },	--#79539
			},		
		},	
--2,18		
		{
			{	
				{ "Bot_Wave_PW_Boss_R3_M_T1" , Vec3( 0, 0, 0 ) },
			},	
		},
--2,19		
		{
			{	
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T1" , Vec3( -15, 0, 0 ) },
			},
		},	
--2,20		
		{
			{
				-----{ "Bot_Wave_PW_HardShield_T1" , Vec3( -15, 0, -0 ) },
				{ "Bot_Wave_PW_HardShield_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T1" , Vec3( 15, 15, 0 ) },	--#79539
			},	
		},
--2,21		
		{
			{
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 15, 15, 0 ) },					
			},	
			{
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 15, 15, 0 ) },					
			},	
			{
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 15, 15, 0 ) },					
			},	
			{
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 15, 15, 0 ) },					
			},	
			{
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T1" , Vec3( 15, 15, 0 ) },					
			},				
		},			
	}
	
PvE_WPW.amembers_T5 = {
		{	
--1,1
			{		
				{ "Bot_Wave_PW_Meat_Inter_M_T5" , Vec3( 0, 0, 0 ) },
			},		
			{			
				{ "Bot_Wave_PW_Rocket_T5" , Vec3( 0, 0, 0 ) },	
			},				
			-- {			
				-- { "Ship_Race1_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			-- },				
			-- {			
				-- { "Ship_Race2_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			-- },				
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},	
--2,2	
		{
			{	
				{ "Bot_Wave_PW_Meat_Inter_M_T5" , Vec3( 0, 0, 0 ) },		
			},		
			{			
				{ "Bot_Wave_PW_Rocket_T5" , Vec3( 0, 0, 0 ) },	
			},				
			-- {			
				-- { "Ship_Race1_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			-- },				
			-- {			
				-- { "Ship_Race2_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			-- },				
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},
--1,3	
		{
			{
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 15, 15, 0 ) },				
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, -15, 15 ) },
				--#79539--{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, 15, -15 ) },
			},	
		},	
--2,4
		{
			{
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 15, 15, 0 ) },				
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, -15, 15 ) },
				--#79539--{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, 15, -15 ) },
			},		
		},
--1,5		
		{
			{
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 0, 0, 15 ) },					
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 15, 15 ) },		
				--#79539--{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 15, 15, 15 ) },		
			},	
			{			
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 0, 15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 15, 0 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 0, -15 ) },	
				---{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				--{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, 15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 15, 0 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, -15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 15, 15 ) },	
				--#79539--{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 15, -15 ) },	
			},				
		},	
--2,6		
		{
			{
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( 15, 15, 0 ) },
				--#79539--{ "Bot_Wave_PW_HardShield_T5" , Vec3( 0, -15, 15 ) },
			},				
		},		
--1,7		
		{
			{
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( -15, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},	
--2,8		
		{
			{
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 0, 0, 15 ) },					
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 15, 15 ) },		
				--#79539--{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 15, 15, 15 ) },	
			},		
			{			
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 0, 15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 15, 0 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 0, -15 ) },	
				---{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				--{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				---{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, 15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 15, 0 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, -15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 15, 15 ) },	
				--#79539--{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 15, -15 ) },	
			},				
		},
--1,9		
		{
			{	
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( -15, 0, 0 ) },
			},
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},
--2,15		
		{
			{	
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 0, -15, -15 ) },
			},
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
			-- {			
				-- { "Ship_Race2_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			-- },				
		},
--1,11		
		{
			{			
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( -15, 0, 0 ) },	
			},					
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},	
--2,12
		{
			{			
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( -15, 0, 0 ) },	
			},					
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},		
--1,13		
		{
			{
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 0, 15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 15, 0 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 0, 0, -15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				--{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				---{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, 15 ) },	
				---{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 15, 0 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 0, -15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 15, 15 ) },	
				{ "Bot_Wave_PW_EnergyTaran_T5" , Vec3( 15, 15, -15 ) },	
				{ "Bot_Wave_PW_EnergyHardShield_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_PW_EnergyHardShield_T5" , Vec3( 15, 0, -15 ) },
				--#79539--{ "Bot_Wave_PW_EnergyHardShield_T5" , Vec3( 15, 15, 0 ) },			
			},	
			{
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 0, 0, 15 ) },					
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( -15, 15, 15 ) },		
				{ "Bot_Wave_PW_Kamikaze_T5" , Vec3( 15, 15, 15 ) },
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( 15, 0, -15 ) },
				--#79539--{ "Bot_Wave_PW_HardShield_T5" , Vec3( 15, 15, 0 ) },		
			},			
		},	
--2,14
		{
			{			
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( -15, 0, 0 ) },
			},			
		},	
--1,15		
		{
			{			
			},	
		},	
--2,16
		{
			{
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( -15, 0, 0 ) },			
			},	
		},	
--1,17		
		{
			{
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( 15, 15, 0 ) },				
				--#79539--{ "Bot_Wave_PW_HardShield_T5" , Vec3( 0, -15, 15 ) },
			},		
		},	
--2,18		
		{
			{	
				{ "Bot_Wave_PW_Boss_R3_M_T5" , Vec3( 0, 0, 0 ) },
			},	
			{			
				{ "Ship_Race1_H_T4_BossT5" , Vec3( 0, 0, 0 ) },	
			},				
			-- {			
				-- { "Ship_Race2_H_T4_BossT5" , Vec3( 0, 0, 0 ) },	
			-- },				
			-- {			
				-- { "Ship_Race3_H_T4_BossT5" , Vec3( 0, 0, 0 ) },	
			-- },				
		},
--2,19		
		{
			{	
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 0, 15, 15 ) },		
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Sniper_T5" , Vec3( 15, -15, -15 ) },
			},
		},	
--2,20		
		{
			{
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( -15, 0, -0 ) },
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_HardShield_T5" , Vec3( 15, 15, 0 ) },				
				--#79539--{ "Bot_Wave_PW_HardShield_T5" , Vec3( 0, -15, 15 ) },
			},	
		},
--2,21	
	
		{
			{
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 15, 15, 0 ) },					
			},	
			{
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 15, 15, 0 ) },					
			},	
			{
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 15, 15, 0 ) },					
			},	
			{
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 15, 15, 0 ) },					
			},	
			{
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_PW_Meat_R1_M_T5" , Vec3( 15, 15, 0 ) },					
			},				
		},			
	}

for iportal = 1, 21 do
	for ipatrol = 1, #PvE_WPW.amembers_T1[iportal] do
		a = {
			name = "Alien_Patrol"..iportal.."_"..ipatrol,
			relationship_group = 2,
			spawn_spot = "alien_spawn_spot"..iportal,
			route = PvE_WPW.nVariant, --..iportal,
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			respawn_time = 12000,
			members = {},
		}
		for nCargoShip = 1, #PvE_WPW.aCargoShips_T1 do
			p = PvE_WPW.aCargoShips_T1[nCargoShip]
			if p.portal == iportal and p.patrol == ipatrol then
				if p.cargoship then
					a.squad_type = ai.AISquadType.CONVOY
					a.cargoship = p.cargoship	
					a.boss = true
					--a.spawn_ignore_collision = true
					a.collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN
				end
				a.route = p.path
			end
		end
		for nSniper = 1, #PvE_WPW.aSnipers do
			p = PvE_WPW.aSnipers[nSniper]
			if p.portal == iportal and p.patrol == ipatrol then
				if p.enemy_pack_radius then
					a.enemy_pack_radius = p.enemy_pack_radius	
				end
			end
		end

		table.insert(a.members, PvE_WPW.amembers_T1[iportal][ipatrol])
		table.insert(PvE_Missions.planet_war_waves_T1.squads, a)
	end
end

for iportal = 1, 21 do
	for ipatrol = 1, #PvE_WPW.amembers_T5[iportal] do
		a = {
			name = "Alien_Patrol"..iportal.."_"..ipatrol,
			relationship_group = 2,
			spawn_spot = "alien_spawn_spot"..iportal,
			route = PvE_WPW.nVariant, --..iportal,
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			respawn_time = 12000,
			members = {},
		}
		for nCargoShip = 1, #PvE_WPW.aCargoShips_T5 do
			p = PvE_WPW.aCargoShips_T5[nCargoShip]
			if p.portal == iportal and p.patrol == ipatrol then
				if p.cargoship then
					a.squad_type = ai.AISquadType.CONVOY
					a.cargoship = p.cargoship	
					a.boss = true
					--a.spawn_ignore_collision = true
					a.collision_handling = ai.AICargoCollisionHandling.MOVE_TO_SPAWN
				end
				a.route = p.path
			end
		end
		for nSniper = 1, #PvE_WPW.aSnipers do
			p = PvE_WPW.aSnipers[nSniper]
			if p.portal == iportal and p.patrol == ipatrol then
				if p.enemy_pack_radius then
					a.enemy_pack_radius = p.enemy_pack_radius	
				end
			end
		end

		table.insert(a.members, PvE_WPW.amembers_T5[iportal][ipatrol])
		table.insert(PvE_Missions.planet_war_waves_T5.squads, a)
	end
end

for i=1, #PvE_WPW.HudDialogs do
	table.insert(PvE_Missions.planet_war_waves_T1.HudDialogs, PvE_WPW.HudDialogs[i])
	table.insert(PvE_Missions.planet_war_waves_T5.HudDialogs, PvE_WPW.HudDialogs[i])
end

function PvE_WPW:WavesSet(nTier)
	PvE_WPW:slog( "================PvE_WPW:WavesSet" )
	PvE_WPW.nSquadRespawn = 99930 -- принудительный спавн волны
	PvE_WPW.nAliveAliensToSpawnPortal = 0 -- сколько должно остаться живых ботов чтобы заспавнилась следующая волна
	--PvE_WPW.nSquadCountInPortal = 1 -- количество волн аддов из 1 портала
	PvE_WPW.nCurrentSequence = 0 -- номер текущего открытого портала	
	PvE_WPW.aWow = { "pve_Meat", "pve_Snipers", "pve_Kamikadze", "pve_Aliens", }
	PvE_WPW.nBonus = 0
	PvE_WPW.nDisthelp = 0
	PvE_WPW.bShowAlive = false
	
	PvE_WPW.nTier = nTier
	if nTier == 5 then
		PvE_WPW.amembers = PvE_WPW.amembers_T5	
		PvE_WPW.aCargoShips = PvE_WPW.aCargoShips_T5	
	elseif nTier == 1 then
		PvE_WPW.amembers = PvE_WPW.amembers_T1	
		PvE_WPW.aCargoShips = PvE_WPW.aCargoShips_T1		
	end
end


function PvE_WPW:WavesInit()

	PvE_WPW.nPhase = -1

	PvE_WPW.nPortalState = 0
	
	PvE_WPW.nPortalCount = 21
	PvE_WPW.aPortal = {}
	PvE_WPW.aPortalTimer = {}
	PvE_WPW.aportalTimer2 = {} -- отдельный таймер для аварийных ситуаций типа не дооткрывшегося портала или зятягивания времени
	PvE_WPW.aPortalTimerState = {}
	PvE_WPW.aPortalWaveCount = {}
	PvE_WPW.aPortalBotsCount = {}
	PvE_WPW.aSquadTimer = {}
	PvE_WPW.aSquadState = {}
	PvE_WPW.aPatrolState = {}
	PvE_WPW.aPortalState = {}

	PvE_WPW.aBots = {} -- список ботов для определения уничтожения волн
	
	PvE_WPW.aWarpGate = {}
	PvE_WPW.nWarpGateCount = 1
	
	--PvE_WPW.aStation = {}	-- станции поддержки
	--PvE_WPW.nStationCount = 2
	PvE_WPW.nBonusTimer = 0 -- таймер для запуска бонуса
	PvE_WPW.nBonusTimerSet = 10 -- Длительность работы бонуса (потом надо обновлять)

	local a = {}
	
	-- пробегаем по порталам
	for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
		p = Entities[pid]:GetName()
		a[p] = pid
	end

	for i=1, PvE_WPW.nPortalCount do
		PvE_WPW.aPortal[i] = a["alien_portal"..i] -- имена порталов должны быть только такие!
		PvE_WPW.aPortalTimer[i] = 0	-- для закрытия порталов по таймеру
		PvE_WPW.aPortalTimerState[i] = 0
		PvE_WPW.aSquadTimer[i] = -1
		PvE_WPW.aSquadState[i] = 0
		PvE_WPW.aPatrolState[i] = 0
		PvE_WPW.aPortalState[i] = false
		PvE_WPW.aPortalBotsCount[i] = -1
		PvE_WPW:slog( "portal "..i.." - "..PvE_WPW.aPortal[i], 9)
	end
	
	-- пробегаем по варпгейтам
	for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
		p = Entities[pid]:GetName()
		a[p] = pid
	end

	for i, pid in pairs( GetEntitiesByClass( "SpawnSpot" ) ) do -- для камикадзе у боссов
		p = Entities[pid]:GetName()
		a[p] = pid
	end
	
	for i=1, PvE_WPW.nWarpGateCount do
		PvE_WPW.aWarpGate[i] = a["WarpGate"..i] -- имена варпгейтов должны быть только такие!
		sys.log( "WarpGate %d - %d", i , PvE_WPW.aWarpGate[i])
	end

	-- for i=1, PvE_WPW.nStationCount do
		-- PvE_WPW.aStation[i] = a["Station"..i] -- имена станций поддержки должны быть только такие!
		-- sys.log( "Support Station %d - %d", i , PvE_WPW.aStation[i])
	-- end

	PvE_WPW.MobileSpawn = a["mobile_spawn"] -- это id перемещаемого спавна
	PvE_WPW.nMobileSpawnTimer = 5 -- после вылета баржи начнут спавниться камикадзе
	PvE_WPW.nMobileSpawnCooldown = 15 -- после уничтожения камикадзе опять вылезут (пока есть баржа)
	
	PvE_WPW.timer = 0 -- таймер для общих нужд (пока юзаю для ожидания анимации закрытия портала крейсера, и задержка проверки на появление самого крейсера)
	
	PvE_WPW.isAdditionalColorRemap = false

	PvE_WPW.posLastBot = false	-- позиция последнего живого бота (для постановки бонуса)
	PvE_WPW.posDistHelp = false	-- позиция последнего живого бота (для постановки бонуса)
	PvE_WPW.nPortalAlive = 0 -- число открытых порталов
	PvE_WPW.pInfo = false	-- тут инфа об игроках лежит, чтобы только 1 раз за кадр запрашивать её
	PvE_WPW.nDistTransport = 20	-- расстояние от конца пути транспорта, на котором спелл срабатывает
	PvE_WPW.testTimerMax	= 240 -- через это время начнём спамить в лог
	PvE_WPW.testTimerKill	= 300 -- через это время убьём живых ботов
	PvE_WPW.testTimer		= 0 
	PvE_WPW.portalTimer		= {}
	
	-- найдём точки окончания пути всех транспортов
	for nCargoShip = 1, #PvE_WPW.aCargoShips do
		for ii, id in pairs( GetEntitiesByClass( "PathObject" ) ) do
			p = Entities[id]
			s = p:GetName()
			if s == PvE_WPW.aCargoShips[nCargoShip].path then
				PvE_WPW.aCargoShips[nCargoShip].pos = p:GetPointAlong(1)
				sys.log( "================================ +++++++++++++ CargoShip %d - %s", id , s)
			end
		end
	end

	PvE_WPW.nVariant = math.random(#PvE_WPW.aSequence)
	
end

-- вызвать алиена с портала (елси надо активировать портал)
function PvE_WPW:WavesSpawnAISquad( nPortal )
			sys.log( "Table", #PvE_WPW.amembers )
	if (nPortal > 0) and (nPortal <= PvE_WPW.nPortalCount) then
		if PvE_WPW.aSquadTimer[nPortal] < 0 then
			sys.log( "----------------------- show portal %d", nPortal )
					 if not PvE_WPW.HudInf1 then
						 SV_Pve_ScriptedNotification( "PvE_Start" )
						 PvE_WPW.HudInf1 = true
					 end
			local portal = Entities[ PvE_WPW.aPortal[nPortal] ]
			PvE_WPW.aPortalTimer[nPortal] = 5 -- прятать портал после этого времени
			portal:FullActivate(true)
			portal:SV_SetActivity( "7", false )
		end
		-- пускаем следующий сквад
		if PvE_WPW.aSquadState[nPortal] == 0 then	-- инициализируем какой патруль будет вылетать из портала
			PvE_WPW.aPatrolState[nPortal] = math.random(#PvE_WPW.amembers[nPortal])
		end
		PvE_WPW.aSquadState[nPortal] = PvE_WPW.aSquadState[nPortal] + 1
		
		if PvE_WPW.aSquadState[nPortal] <= PvE_WPW.aPatrolFromPortal[nPortal] then	--#PvE_WPW.amembers[nPortal] -- номер патруля не больше, чем число патрулей с портала
			sys.log( "+++++++++++++++ init patrol %d", nPortal )
			SV_Pve_AISquadSpawn( "Alien_Patrol" .. nPortal .. "_" .. PvE_WPW.aPatrolState[nPortal]) --PvE_WPW.aSquadState[nPortal])
				if nPortal == 13 then
					SV_Pve_StartPhase( 2 )
					 if not PvE_WPW.HudInf2 then
						 SV_Pve_ScriptedNotification( "PvE_Inside" )
						 PvE_WPW.HudInf2 = true
					 end	
				end	
				if nPortal == 15 then
					SV_Pve_StartPhase( 3 )
				end
		else -- защита от переполнения ботами при анлиме порталов
			sys.log( "+++++++++++++++ no more patrol %d", nPortal )
		end

		PvE_WPW.aSquadTimer[nPortal] = 0 -- таймер в любом случае сбросить лучше, чтобы логи не забивать
	else
		sys.log( "!!! Invalid nPortal %d", nPortal )
	end
end

function PvE_WPW:BotStateUpdate(id, bTransport)
	local bot, nPortal, nBest, nDist
	bot = Entities[id]
	if bot then
		if bot:GetRelationshipGroup() == 2 then
			if not bot:IsDead() then
				--sys.log( "BotName %s", bot:GetName() )
				if not PvE_WPW.aBots[id] then -- бот не описан, новенький, ищем - откуда вылез
					nPortal = 0 -- номер ближайшего к боту портала
					nBest = 99999 -- минимальное расстояние до портала
					for iPortal = 1, PvE_WPW.nPortalCount do
						if PvE_WPW.aSquadState[iPortal] > 0 then -- портал открыт или открывается
							nDist = #(Entities[ PvE_WPW.aPortal[iPortal] ]:GetPos() - bot:GetPos())
							if nDist < nBest then
								nBest = nDist
								nPortal = iPortal
							end
						end
					end
					
					PvE_WPW.aBots[id] = {nPortal, true, bTransport} -- Ближайший к боту портал, бот жив (отдельно пометим транспорт)
				else
					PvE_WPW.aBots[id][2] = true -- бот жив (номер портала не меняем)
					nPortal = PvE_WPW.aBots[id][1]
					if PvE_WPW.bShowAlive then
						PvE_WPW:slog( "Bot "..id.. "жив, портал "..nPortal, 1, 10) 
					end
				end
				PvE_WPW.aPortalBotsCount[nPortal] = PvE_WPW.aPortalBotsCount[nPortal] + 1 -- считаем сколько живых ещё ботов вылезло из портала
				PvE_WPW.posLastBot = bot:GetPos()	-- запоминаем позицию живого бота
				PvE_WPW.aPortalState[nPortal] = true	-- из портала кто-то да вылетал, можно будет проверять, что их всех убили
				local botpos = bot:GetPos()				
				-- проверка долетел ли транспорт до конца пути
				if bTransport then
					for nCargoShip = 1, #PvE_WPW.aCargoShips do
						if PvE_WPW.aCargoShips[nCargoShip].portal == nPortal then
							if PvE_WPW.aCargoShips[nCargoShip].spell and not PvE_WPW.aCargoShips[nCargoShip].isSpellActivate then
								d = #(PvE_WPW.aCargoShips[nCargoShip].pos - botpos)
								if d < PvE_WPW.nDistTransport then -- транспорт доехал до места, надо ауру запустить
									sys.log( "+++ Transport BotName %d", id ) --bot:GetName()
									SV_Pve_CastSpell( PvE_WPW.aCargoShips[nCargoShip].spell, id, id, bot, botpos )
									PvE_WPW.aCargoShips[nCargoShip].isSpellActivate = true -- 1 раза на транспорт достаточно
									break -- перебирать остальные транспорты нет смысла, нашли
								end
							end
						end
					end
				end
				
				-- мониторинг долгоживущих
				-- if not PvE_WPW.aTest then
					-- PvE_WPW.aTest = {} -- список долгоживущих
				-- end
				
				-- if PvE_WPW.testTimer then
					-- if PvE_WPW.testTimer > PvE_WPW.testTimerMax then
						-- if PvE_WPW.aTest[id] then
							-- PvE_WPW.aTest[id] = PvE_WPW.aTest[id] + 1
							-- if PvE_WPW.aTest[id] > 100 then
								-- PvE_WPW.aTest[id] = false -- надо раз в 100 кадров показывать
							-- end
						-- else
							-- PvE_WPW:slog( "still alive "..id, 10, 100) 
							-- PvE_WPW.aTest[id] = 1
						-- end
					-- end
					-- if PvE_WPW.testTimer > PvE_WPW.testTimerKill and not bTransport and not PvE_WPW.botkill then
						-- sys.log( "killing Bot id %d", id)
						-- bot:DieAndBlow()	--#97024
						-- PvE_WPW.aTest[id] = false
						-- PvE_WPW.botkill = true -- убиваем ботов строго по одному в кадр - чтобы не было перегруза сервера
						-- PvE_W.testTimer = 0
					-- end
				-- else
					-- PvE_WPW.testTimer = 0
				-- end
			end
		end
	end
end


-- потдержка актуального состояния порталов
function PvE_WPW:WavesUpdate( dt )

	PvE_WPW.testTimer = PvE_WPW.testTimer + dt -- для мониторинга долгоживущих ботов

	-- считаем живых ботов, если их меньше минимума спавним следующую волну или следующий портал
	-- смотрим сколько осталось живых алиенов и если меньше нормы - запускаем крейсер
	for name, data in pairs( PvE_WPW.aBots ) do
		PvE_WPW.aBots[name][2] = false -- отмечаем всех известных ботов мёртвыми, далее будет цикл по живым ботам 
	end
	for iPortal = 0, PvE_WPW.nPortalCount do
		PvE_WPW.aPortalBotsCount[iPortal] = 0 -- обнуляем счётчик живых ботов
	end
	PvE_WPW.pInfo = GetAllPlayersInfo() -- это надо каждый кадр обновлять для того чтобы камикадзе отслеживать
	PvE_WPW.botkill = false -- это чтобы больше 1 бота за кадр не убивать оп таймайту и не перегружать сервер
	for ii, id in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		PvE_WPW:BotStateUpdate(id)
	end
	for ii, id in pairs( GetEntitiesByClass( "CargoShip" ) ) do
		PvE_WPW:BotStateUpdate(id, true)
	end

	-- теперь порталы сами отслеживают свои волны
	PvE_WPW.nPortalAlive = 0

	for iPortal = 1, PvE_WPW.nPortalCount do
		if PvE_WPW.aSquadState[iPortal] > 0 then
			if PvE_WPW.aPortalTimer[iPortal] < 0 and PvE_WPW.aPortalTimer[iPortal] > -100 then
				if PvE_WPW.aPortalTimerState[iPortal] == 0 then
					sys.log( "----------------------- animation hide portal on timer %d", iPortal )
					Entities[ PvE_WPW.aPortal[iPortal] ]:SV_SetActivity( "8", false )
					PvE_WPW.aPortalTimerState[iPortal] = 1
					PvE_WPW.aPortalTimer[iPortal] = 0.38
				else
					sys.log( "----------------------- hide portal on timer %d", iPortal )
					Entities[ PvE_WPW.aPortal[iPortal] ]:FullActivate(false)
					PvE_WPW.aPortalTimerState[iPortal] = 0
					PvE_WPW.aPortalTimer[iPortal] = -100 -- чтобы больше не отключать
				end
			else
				PvE_WPW.aPortalTimer[iPortal] = PvE_WPW.aPortalTimer[iPortal] - dt
			end
			PvE_WPW.nPortalAlive = PvE_WPW.nPortalAlive + 1
			
			if PvE_WPW.aPortalState[iPortal] and PvE_WPW.aPortalBotsCount[iPortal] == 0 then -- кончилась волна
				PvE_WPW.aPortalState[iPortal] = false -- отрубаем возможность повторной сработки пока кто-нить не вылетит из портала
				if PvE_WPW.aSquadState[iPortal] < PvE_WPW.aPatrolFromPortal[iPortal] then --#PvE_WPW.amembers[iPortal]
					-- пускаем следующий сквад
					PvE_WPW.aSquadTimer[iPortal] = -1
					PvE_WPW:WavesSpawnAISquad( iPortal )
				else	-- закрываем портал
					PvE_WPW.aSquadTimer[iPortal] = -1
					PvE_WPW.aSquadState[iPortal] = 0
					sys.log( "----------------------- hide portal %d", iPortal )
					if PvE_WPW.aPortalTimer[iPortal] > -100 then	-- портал ещё не закрыт по таймеру
						Entities[ PvE_WPW.aPortal[iPortal] ]:FullActivate(false)
					end
					PvE_WPW.nPortalAlive = PvE_WPW.nPortalAlive - 1 -- не надо считать такой портал открытым
				end
			else 
				if not PvE_WPW.aPortalState[ iPortal ] then -- сквад из портала должен был вылететь, но никого не зарегистрировано SC-112165
					if not PvE_WPW.aportalTimer2[ iPortal ] then	-- отдельный таймер для этого дела использовать надо, не перемешивая со старым
						PvE_WPW.aportalTimer2[ iPortal ] = 0
					else
						PvE_WPW.aportalTimer2[ iPortal ] = PvE_WPW.aportalTimer2[ iPortal ] + dt
					end
					if PvE_WPW.aportalTimer2[ iPortal ] > 30 then
						PvE_WPW.aportalTimer2[ iPortal ] = nil -- на следующий раз приводим в исходное состояние
						PvE_WPW.aPortalState[ iPortal ] = true -- раз 30 секунд никто не вылетел, принудительно считаем, что портал открылся
						--- PvE_WPW.aPortalBotsCount[ iPortal ] = 0 --не имеет смысла
						---PvE_WPW.aSquadState[ iPortal ] = PvE_WPW.aPatrolFromPortal[ iPortal ] -- не зачем менять волну

					end
					sys.log( "-------------- portal %d no spawn but activate", iPortal)
				else -- портал открылся, тут можно добавить логику принудительной отписки ботов от портала по истечении предельного времени (чтобы запустилась следующая волна)
					if not PvE_WPW.aportalTimer2[ iPortal ] then	-- отдельный таймер для этого дела использовать надо, не перемешивая со старым
						PvE_WPW.aportalTimer2[ iPortal ] = 0
					else
						PvE_WPW.aportalTimer2[ iPortal ] = PvE_WPW.aportalTimer2[ iPortal ] + dt
					end
					if PvE_WPW.aportalTimer2[ iPortal ] > 360 then	-- тут надо такое время, чтобы при нормальной игре точно успевали за него убить любую волну
						PvE_WPW.aportalTimer2[ iPortal ] = nil -- на следующий раз приводим в исходное состояние
						-- дополнительно пробежимся по ботам зависшего портала и снимаем их с портала, не убивая
						for id, bot in pairs(PvE_WPW.aBots) do
							if iPortal == bot[1] and not bot[3] then -- баржу можно бить и дольше
								PvE_WPW.aBots[id] = {0} -- теперь этот бот не принадлежит никакому порталу, Добби свободен
								sys.log( "-------------- portal %d free bot", iPortal)
							end
						end
					end
				end
			end
		end
	end
	
	if (PvE_WPW.nCurrentSequence < #PvE_WPW.aSequence[PvE_WPW.nVariant]) and (PvE_WPW.nPortalAlive <= PvE_WPW.nPortalsIgnore) then -- закрылись все порталы (или первый запуск)	-- добавлен хак на игнор некоторого количества не закрытых порталов
		if PvE_WPW.timer <= 0 then
			sys.log( "--- end off aSequence %d", PvE_WPW.nCurrentSequence )		
			if PvE_WPW.nCurrentSequence > 0 then
				for i = 1, PvE_WPW.nWarpGateCount do -- включаем варпгейты как положено
					w = Entities[PvE_WPW.aWarpGate[i]]
					if i == PvE_WPW.aWarpGateSequence[PvE_WPW.nVariant][PvE_WPW.nCurrentSequence] then
						w:FullActivate( true )
						SV_Pve_TCSMessage( w )
						sys.log( "WarpGate")
					else
						sys.log( "NonWarpGate")
					end
				end
			end
			
			PvE_WPW.nWin = PvE_WPW.nCurrentSequence * 0.1 -- % прохождения по 10% за волну которую прошли
			PvE_WPW.nCurrentSequence = PvE_WPW.nCurrentSequence + 1 -- теперь это номер в таблице aSequence
			
			-- надо двигать SpawnTeam1Ship1 на место Team1Group1 (SpawnSpot) после 3й волны
			if PvE_WPW.nCurrentSequence == 3 then
				sys.log( "--- Spawn move...")
				-- local as = {}
				-- local i, pid, p
				
				-- -- пробегаем по спавнам
				-- for i, pid in pairs( GetEntitiesByClass( "SpawnSpot" ) ) do
					-- p = Entities[pid]:GetName()
					-- as[p] = pid
					-- --sys.log( "--- Spawn:"..p)
				-- end
				
				-- if as["SpawnTeam1Ship1"] and as["Team1Group1"] then
					-- Entities[as["SpawnTeam1Ship1"]]:SetPos(Entities[as["Team1Group1"]]:GetPos())
					-- Entities[as["SpawnTeam1Ship1"]]:SetRot(Entities[as["Team1Group1"]]:GetRot())
					-- sys.log( "--- Spawn moved")
				-- else
					-- sys.log( "--- Spawn not found")
				-- end
				SV_Pve_SetSpawnGroup( 1 )
			end

			SV_Pve_ScriptedNotification( "pve_Meat")

			-- открываем порталы как прописано в aSequence
			sys.log( "nVariant"..PvE_WPW.nVariant)
			sys.log( "nCurrentSequence"..PvE_WPW.nCurrentSequence)
			for ii, iPortal in pairs( PvE_WPW.aSequence[PvE_WPW.nVariant][PvE_WPW.nCurrentSequence] ) do
				PvE_WPW:WavesSpawnAISquad( iPortal )
			end
			PvE_WPW.nPortalAlive = -1 -- пока порталы не открылись (боты вылетят и сбросят переменную)
			PvE_WPW.aBots = {} -- обнулим, ботов то нет ещё.

			-- for i = 1, PvE_WPW.nStationCount do -- включаем станции поддержки как положено
				-- s = Entities[PvE_WPW.aStation[i]]
				-- n = PvE_WPW.aStationSequence[PvE_WPW.nVariant][PvE_WPW.nCurrentSequence]
				-- if i == math.abs(n) then
					-- if not (i == PvE_WPW.nCurrentStation) then
						-- s:FullActivate( true )
						-- sys.log( "Station %d", n)
						-- PvE_WPW.nCurrentStation = i
					-- end
				-- else
					-- s:FullActivate( false )
				-- end
			-- end

			PvE_WPW.timer = PvE_WPW.nWait
			PvE_WPW.testTimer = 0	-- сбрасываем время для мониторинга долгоживущих ботов
			PvE_WPW.aTest = {} -- список долгоживущих
		else
			if PvE_WPW.timer == PvE_WPW.nWait then 
				if PvE_WPW.nPortalAlive == 0 then	-- для туториалки хак, там может кто-то остаться и запуститься новая волна
					SV_Pve_ScriptedNotification( "pve_EndMeat")
				end
			end
			PvE_WPW.timer = PvE_WPW.timer - dt
		end
	end
	
	-- бонусы от станций поддержки
	-- local n = PvE_WPW.aStationSequence[PvE_WPW.nVariant][PvE_WPW.nCurrentSequence]
	-- if n < 0 then
		-- s = Entities[PvE_WPW.aStation[math.abs(n)]]
		-- if s and not s:IsDead() then
			-- PvE_WPW.nBonusTimer = PvE_WPW.nBonusTimer - dt
			-- if PvE_WPW.nBonusTimer < 0 then
				-- PvE_WPW.nBonusTimer = PvE_WPW.nBonusTimerSet
				-- sys.log( "---------------------------------------------------------------------- set bonus")
				-- local id = s:GetId()
			-- end
		-- end
	-- end

	-- спецэффекты для боссов (транспортников)
	for ii, id in pairs( GetEntitiesByClass( "CargoShip" ) ) do
		c = Entities[id]
		if c and not c:IsDead() then
			if not SV_Pve_AISquadIsAlive("MobileSpawn") then
				PvE_WPW.nMobileSpawnTimer = PvE_WPW.nMobileSpawnTimer - dt
			end
			
			if PvE_WPW.nMobileSpawnTimer < 0 then
				sys.log( "+++++++++++++++ MobileSpawn")
				PvE_WPW.testTimer = 0 -- сброс таймера

				s = Entities[PvE_WPW.MobileSpawn]
				sys.log( "+++++++++++++++ MobileSpawn dist %d", d )
				
					s:SetPos((c:GetBoneWorldPos("fx6") - c:GetPos())*1.5 + c:GetPos())
					SV_Pve_AISquadSpawn( "MobileSpawn")
					PvE_WPW.nMobileSpawnTimer = PvE_WPW.nMobileSpawnCooldown
			end
			
			-- Pirate_Barge_Engine замедляем транспорт если нет такого дефа на карте
			local nEngine = 0
			for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do	---#66194
				s = Entities[pid]:GetDefName()
				if (s == "Pirate_Barge_Engine_T1") or (s == "Pirate_Barge_Engine_T5") then
					local tur = Entities[pid]
					if tur and not tur:IsDead() then	-- #67167
						nEngine = nEngine + 1
					end
				end
			end
			
			if PvE_WPW.nBTimer then -- таймер на появление
				PvE_WPW.nBTimer = PvE_WPW.nBTimer + dt
			else
				PvE_WPW.nBTimer = 0
			end
			
			if PvE_WPW.nBTimer < 0.7 then
				c:SetTargetSpeed( 700 ) -- максимально доступная скорость для баржи
			elseif PvE_WPW.nBTimer > 0.7 and PvE_WPW.nBTimer < 1.2 then
				    local stop_time = 0.5
					local x = ( PvE_WPW.nBTimer - 0.7) / stop_time
					local smooth_modifier = -2 * x * x * x + 3 * x * x;
					local startSpeed = 700
					local endSpeed = 2.1 + 0.3 * PvE_WPW.nTier + nEngine * (0.8 + 0.2 * PvE_WPW.nTier)
					local speed = startSpeed + (endSpeed - startSpeed) * smooth_modifier;
					c:SetTargetSpeed( speed )
			else
				c:SetTargetSpeed( 2.1 + 0.3 * PvE_WPW.nTier + nEngine * (0.8 + 0.2 * PvE_WPW.nTier) ) --#67347 на т1 замедляю баржу
			end			
			
			--c:SetTargetSpeed( 2 + nEngine * (0.8 + 0.25 * PvE_WPW.nTier) ) --#57816 поднял скорость на 10-20%
			--c:SetTargetSpeed( 3.3 + nEngine * (0.8 + 0.2 * PvE_WPW.nTier) ) --#64694 ещё ускоряю базу, усиливаю важность дамага, ослабляя скилл и важность сбивания движков до 50% на т1
			--c:SetTargetSpeed( 2.1 + 0.3 * PvE_WPW.nTier + nEngine * (0.8 + 0.2 * PvE_WPW.nTier) ) --#67347 на т1 замедляю баржу

			-- перенёс сюда нотификацию на сбивание движков, ибо не фиг в 2х местах опрашивать движки
			if not PvE_WPW.nEngineAlive then
				PvE_WPW.nEngineAlive = nEngine
			end
			if nEngine < PvE_WPW.nEngineAlive then
				PvE_WPW.nEngineAlive = nEngine
				SV_Pve_ScriptedNotification("W_EngineDead")
				PvE_WPW.nWin = 0.75 - nEngine * 0.05	-- движки ключ к победе
			end			
			
		end
	end
end


-- пуск ракеты 0- под себя, 1 - ближние цели, 2- дальние цели, 3 -рандом, 4- аванпост, 5-аванпосты/игроки -1 - мегаядерку в конкретной точке заспавнить, -2 спелл
function PvE_WPW:LaunchRocket( owner, defName, nTargetType, vPos )
	if defName then
		sys.log( "____________ prepear LaunchRocket "..defName )
	else
		sys.log( "____________ prepear LaunchRocket XXX")
	end

	local target
	local aimDir

	local ncount = 0
	local alive = {}
	local adist = {}
	local middist = 0
	
	if not owner or owner:IsDead() then
		sys.log( "!!!!!!!!!!!!!!!!!!!No owner found for launch")
		return false
	end
	
	target = owner -- по умолчанию цели нет
	if nTargetType > 0 then
		
		local a = GetAllPlayersInfo()
		local d
		for i, p in pairs( a ) do -- перебираем игроков
			local pid = p.entityId
			if pid > 0 then -- есть id корабля
				ncount = ncount + 1
				alive[ncount] = pid
				d = #(Entities[pid]:GetPos() - owner:GetPos())
				adist[ncount] = d
				middist = middist + d
			end
		end
	
		if ncount > 0 then 
			local atarget = {} -- список подходящих целей (собирается в зависимости от типа цели nTargetType)
			local ntarget = 0
			middist = middist / ncount -- среднее расстояние от крейсера до игроков
			
			for i = 1, ncount do
				
				if (nTargetType >= 3) or ((nTargetType == 1) and (adist[i] <= middist) ) or ((nTargetType == 2) and (adist[i] >= middist)) then
					ntarget = ntarget + 1
					atarget[ntarget] = alive[i]
				end
			end
			
			if ntarget > 0 then
				target = math.random(ntarget)
				if target > ntarget then
					target = ntarget
				end
				target = Entities[ atarget[target] ]
			end
		end
	end

	aimDir = target:GetPos() -- owner:GetPos() -- направление на цель
	if nTargetType >= 0 then
		vPos = owner:GetPos()
		
		local v = owner:GetLinearVelocity()
		local d = #v

		if d > 0.5 then	-- защита от 0 (на разгоне)
			vPos = vPos + v * (160/d) -- вылет из ангара
		end
	end

	if nTargetType > 0 then
		if target == owner then
			sys.log( "invalid target! ")
		else
			SV_Pve_LaunchRocket( defName, owner, target, aimDir)--, vPos )
		end
	elseif nTargetType >= -1 then
		SV_Pve_LaunchRocket( defName, owner, target, aimDir, vPos )
	else -- -2 спелл
		if not vPos then
			vPos = owner:GetPos()
		end
		local id = owner:GetId()
		SV_Pve_CastSpell( defName, id, id, target, vPos )
	end
end




-- бонусs должны быть на карте и называться BonusN, где N - порядковый номер (спрятан в статике дредноута в центре) и он перемещаетс на место последнего убитого бота
-- но 2й раз этот же бонус ставить нельзя (т.е. надо список бонусов и ставить каждый по 1 разу) + надо делать свои бонусы без респавна
function PvE_WPW:SpawnBonus()
	PvE_WPW.nBonus = PvE_WPW.nBonus + 1
	if PvE_WPW.posLastBot then
		for ii, id in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
			s = Entities[ id ]
			if s:GetName() == "Bonus"..PvE_WPW.nBonus then
				s:SetPos(PvE_WPW.posLastBot)	-- бонус сюда
			end
		end
	end
end


-- функция вызывается каждый кадр
function PvE_WPW:OnUpdateRound(self, dt, curPhase, nTier)

	if PvE_WPW.nPhase == -2 then
		PvE_WPW.nPhase = -1
		
		math.randomseed(  _G.GetLocalTimeOfDay() )
		sys.log( "initialize %d", _G.GetLocalTimeOfDay() )		
		
		PvE_WPW:WavesSet(nTier)	-- в зависимости от тира, будут разные настройки

		PvE_WPW:WavesInit()
		PvE_WPW.aEngine	= {}
		
	elseif curPhase == 3 then
	
		local barzha = false
		local ebarzha = false
		--найти баржу
		for ii, id in pairs( GetEntitiesByClass( "CargoShip" ) ) do
			barzha = true
			ebarzha = Entities[id]
			break
		end
		
		if (barzha and ebarzha:IsDead()) or (PvE_WPW.HudInf3 and not barzha) then
			return	-- если баржу убили, то дальше мониторить что-либо не нужно
		end
		
		if not PvE_WPW.HudInf3 then
			SV_Pve_ScriptedNotification( "PvE_PW_Cruiser" )
			PvE_WPW.HudInf3 = true
		end
		
		local endpoint
		for ii, id in pairs( GetEntitiesByClass( "TagPoint" ) ) do
			e = Entities[ id ]
			if e:GetName() == "Dist_Help" then
				endpoint = e	-- Тагпоинт сюда
				break
			end
		end			
		
		if ebarzha and endpoint then
			lDist = #(ebarzha:GetPos() - endpoint:GetPos())
			if lDist < 11 then
				sys.log( "game over 5c")
				-- закоментил ибо падает по лимиту энтити и геометрии, а тут 6 барж++!
				-- for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
					-- if Entities[pid]:GetDefName() == "PvE_Wave_HugeCargo_Additional" or Entities[pid]:GetDefName() == "OpenWorld_ReiderJumpgate_XL" then
						-- CargoAdds=Entities[pid]
						-- CargoAdds:FullActivate(true)
					-- end
				-- end
				-- всё игроки проиграли, крейсер уничтожил станцию.
				sys.log( "ldist %d", lDist)
				return 2, ai.WinReason.PVE_MISSION_COMPLETE
			else
				PvE_WPW:slog( "ldist "..lDist, 100, 10) 
			end	
		end
	end
	
	-- набирать таймер на пуск ракет/сквадов и следить не убили ли порталы (прятать тела)
	PvE_WPW:WavesUpdate( dt )
	
	-- отображение текущей фазы в лог (и wow сообщением)
	if not (PvE_WPW.nPhase == curPhase) then
		PvE_WPW.nPhase = curPhase
		sys.log( "================PvE_WPW:SV_OnUpdateRound( %d )", curPhase )
		if not lDist then lDist = -999999 end
		PvE_WPW:slog( "ldist "..lDist, 100, 10) 
	end
end


function PvE_WPW:SV_GetFinishRewardCoefs(self, nTier, roundsFinished)
	sys.log( "================PvE_WPW:SV_GetFinishRewardCoefs(self, nTier) nTier = %d, PvE_WPW.nWin = %d, roundsFinished = %d", nTier, PvE_WPW.nWin*100, roundsFinished )
	if roundsFinished > 0 then	-- победа, полная награда, иначе то что накопилось в процессе - максимум 75% (сбили все движки), 50% дошли до баржи... т.е. 10% за фазу
		PvE_WPW.nWin = 1
	end
	sys.log( "PvE_WPW.nWin = %d",PvE_WPW.nWin*100 )
	return PvE_WPW.nWin, PvE_WPW.nWin*0.75--, PvE_WPW.nWin
end

function PvE_WPW:GetBaseLootAttempts(self, nTier, roundsFinished)
	sys.log( "================PvE_WPW:GetBaseLootAttempts(self, nTier) nTier = %d, PvE_WPW.nWin = %d, roundsFinished = %d", nTier, PvE_WPW.nWin*100, roundsFinished )
	
	if roundsFinished > 0 then
		return 3
	else
		return 0
	end
end



-----------------------------------------------------------------------------------------------------------
-- функция вызывается каждый кадр, пока миссия активна(когда геймплей активен, после финиша не вызывается).
PvE_Missions.planet_war_waves_T1.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_WPW:OnUpdateRound(self, dt, curPhase, 1)
end

PvE_Missions.planet_war_waves_T5.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_WPW:OnUpdateRound(self, dt, curPhase, 5)
end

-- модификация награды #55051
--float, float, float SV_GetFinishRewardCoefs( int roundsFinished )
--int SV_GetBaseLootAttempts( int roundsFinished )
PvE_Missions.planet_war_waves_T1.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_WPW:SV_GetFinishRewardCoefs(self, 1, roundsFinished)
end

PvE_Missions.planet_war_waves_T5.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_WPW:SV_GetFinishRewardCoefs(self, 5, roundsFinished)
end



PvE_Missions.planet_war_waves_T1.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_WPW:GetBaseLootAttempts(self, 1, roundsFinished)
end

PvE_Missions.planet_war_waves_T5.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_WPW:GetBaseLootAttempts(self, 5, roundsFinished)
end
