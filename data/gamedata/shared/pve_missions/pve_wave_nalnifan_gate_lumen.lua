--
PvE_Missions.nalnifan_lumen_waves_T1 = 
{
	levelName = "pve_wave_nalnifan_gate_lumen",
	scenario_description = { "wave_nalnifan_gate_lumen_str1", "wave_nalnifan_gate_lumen_str2", "wave_nalnifan_gate_lumen_str3" },
	need_spawn_warp = true,
	is_boss = true,
	waves_ui_hide = true,
	target_def = "Helpers_DistPoint",	
	HudDialogs = {},
	event_loot_attempts = 3,
	
	desc = "",
	resurrection_attempts = 5,
	item_lvl = 7, -- параметр для начисления награды.
	accountRank = 4,
	rank  = 1,  -- параметр для попадания в очередь. ---#58925
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.low[3],
	bot_difficulty = 1, -- параметр задающий сложность ботов.
	disabled = false,
	
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
					---{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 0, 0 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, 0, 20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 20, -20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( -20, -20, 0 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, -20, 20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, 20, 0 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( -20, 0, -20 ) },
					{ "Bot_Wave_Kamikaze_T1" , Vec3( 20, -20, -20 ) },
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
			win_loot_tables = { { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" }, { "autogen_pve" } },

			uiRoundDesc = "wave_nalnifan_gate_lumen_r1_rdesc", 
			start_sentence = "CMDR_WAVE_PVE_START_ROUND",

			modifiers =
			{
			},
			
			start_event = 
			{
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

				[ 2 ] =
					{
						start_sentence = "CMDR_PVE_WAVE_BOSS",
					},	
            },
		},	
	},
}


PvE_Missions.nalnifan_lumen_waves_T5 = 
{
	levelName = "pve_wave_nalnifan_gate_lumen",
	scenario_description = { "wave_nalnifan_gate_lumen_str1", "wave_nalnifan_gate_lumen_str2", "wave_nalnifan_gate_lumen_str3" },
	need_spawn_warp = true,
	is_boss = true,	
	waves_ui_hide = true,
	target_def = "Helpers_DistPoint",	
	HudDialogs = {},
	
	desc = "",
	resurrection_attempts = 2,
	item_lvl = 25, -- параметр для начисления награды.
	accountRank = 10,
	rank  = 6,  -- параметр для попадания в очередь.
	rank_max = PvE_breckets.hi[2], -- параметр для выбора миссии на карте галактики.
	bot_preset_name = PvE_breckets.hi[3],
	bot_difficulty = 3, -- параметр задающий сложность ботов.
	disabled = false,
	-- "все корабли почти равны"
	rank_scale_spells = BuffByRankPVE, --BuffByRank,  -- бафф усиляющий корабли низкого ранга против ботов  (ранг боя чит цваром cvars.sv_mmBattleRank =15 при загрузке миссии)
	
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
					{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 0, 0 ) },
					{ "Bot_Wave_Kamikaze_T5" , Vec3( 20, 0, 20 ) },
					{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 20, -20 ) },
					{ "Bot_Wave_Kamikaze_T5" , Vec3( -20, -20, 0 ) },
					{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, -20, 20 ) },
					{ "Bot_Wave_Kamikaze_T5" , Vec3( 20, 20, 0 ) },
					{ "Bot_Wave_Kamikaze_T5" , Vec3( -20, 0, -20 ) },
					{ "Bot_Wave_Kamikaze_T5" , Vec3( 20, -20, -20 ) },
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

			uiRoundDesc = "wave_nalnifan_gate_lumen_r1_rdesc", 
			start_sentence = "CMDR_WAVE_PVE_START_ROUND",

			modifiers =
			{
			},
			
			start_event = 
			{
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

				[ 2 ] =
					{
						start_sentence = "CMDR_PVE_WAVE_BOSS",
					},	
            },
		},	
	},
}


-----------------------------------------------------------------------------------------------------------

-- Общий контейнер
PvE_W = {
	nPhase = -2,	-- это необходимо для запуска настройки

	aPatrolFromPortal = {1,1,1,1, 1,1,2,2,1,1, 1,1,2,2,1, 1,1,1, 1,},	-- сколько патрулей вылетит из портала, спосок ботов берётся рандомно из указанных выриантов для портала
	
	aCargoShips = {},

	aCargoShips_T1 = {
		{ portal = 15, patrol = 1, cargoship =  "PvE_wave_HugeCargo_T1", path = "cargo_path", spell = "SmartBombFar_RW", },
	},
	aCargoShips_T5 = {
		{ portal = 15, patrol = 1, cargoship =  "PvE_wave_HugeCargo_T5", path = "cargo_path", spell = "SmartBombFar_RW", },
	},
	
	aSnipers = {
		{ portal = 9, patrol = 1, enemy_pack_radius = 1000, },
		{ portal = 10, patrol = 1, enemy_pack_radius = 1000, },
		{ portal = 19, patrol = 1, enemy_pack_radius = 1000, },
	},
	
	-- список порталов которые откроются, если всех ботов завалить, каждый вариант в отдельной строке регулируется nVariant
	aSequence = {
		{{1, 2, 3, 4}, {5, 6, 7, 8, 11, 12}, {9, 10, 13, 14, 19 }, {16, 17, 18,}, {15,}, }, 
	},
	nVariant = 1,

	aWarpGateSequence = {	-- ПОСЛЕ закрытия всех порталов в волне откроется варпгейт с этим номером 0-все уберутся, количество фаз должено совпадать с описанием в aSequence
		{0, 0, 0, 0, 0},
	},
	
	aStationSequence = {	-- вместе с волной включится станция поддержки с указанным номером, елси номер со знаком "-" то на этой волне будет раздаваться бонус от станции (если она ещё жива будет)
		{0, 0, 0, 0, 0},
	},
	nCurrentStation = 0, -- текущая живая станция, чтобы не включать снова её же
	
	nWait = 15, -- между волнами порталов ждать в сек.
	
	amembers = {},
	amembers_T1 = {},
	amembers_T5 = {},
	
	HudDialogs = 
	{
		{
			{ character = "general_soldier", text = "pve_wave_nalnifan_gate_lumen_start_1", },
		},	
		{
			{ character = "general_soldier", text = "pve_wave_nalnifan_gate_lumen_barza_1", },
		},			
	},		

	minloglevel = 0,	-- уровень обрезки логов (начиная с этого номера не будет логгирования, если поставить 0 - то логгирование вообще отключается)
	nkd = 0,	-- сколько попыток вывода лога пропускать по умолчанию
	akd = {},	-- массив для хранения попыток вывод логов с разными уровнями
	
	nWin = 0 -- % прохождения, для расчёта наград
}

-- многоуровневое логгирование, только текст, можно указанывать уровень (чем меньше число тем важнее сообщение), и периодичность в вызовах
function PvE_W:slog(stext, nlevel, nkd)
	if not nkd then nkd = PvE_W.nkd end -- если не указать таймер, то берём по умолчанию
	if not nlevel then nlevel = 0 end -- елси не указать уровень, то логгировать всегда
	if nlevel < PvE_W.minloglevel then
		b = true
		if nkd > 0 then
			b = false
			if not PvE_W.akd[nlevel] then
				PvE_W.akd[nlevel] = -1
			else
				PvE_W.akd[nlevel] = PvE_W.akd[nlevel] - 1
			end
			if PvE_W.akd[nlevel] < 0 then
				PvE_W.akd[nlevel] = nkd - 1
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

PvE_W.amembers_T1 = {
		{	
--1,1
			{		
				{ "Bot_Wave_Meat_Inter_M_T1" , Vec3( 0, 0, 0 ) },
			},		
			{			
				{ "Bot_Wave_Rocket_T1" , Vec3( 0, 0, 0 ) },	
			},				
		},	
--2,2	
		{
			{	
				{ "Bot_Wave_Meat_Inter_M_T1" , Vec3( 0, 0, 0 ) },		
			},		
			{			
				{ "Bot_Wave_Rocket_T1" , Vec3( 0, 0, 0 ) },	
			},				
		},
--1,3	
		{
			{
				{ "Bot_Wave_Meat_R1_M_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Meat_R1_M_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_Meat_R1_M_T1" , Vec3( 15, 15, 0 ) },				
			},	
		},	
--2,4
		{
			{
				{ "Bot_Wave_Meat_R1_M_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Meat_R1_M_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_Meat_R1_M_T1" , Vec3( 15, 15, 0 ) },				
			},		
		},
--1,5		
		{
			{
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
			},	
			{			
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },
			},				
		},	
--2,6		
		{
			{
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },	
			},
			{			
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },
			},				
		},		
--1,7		
		{
			{
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
			},	
			{			
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },	
			},				
		},	
--2,8		
		{
			{
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
			},		
			{			
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 15, 0, 0 ) },
			},				
		},
--1,9		
		{
			{	
				{ "Bot_Wave_Sniper_T1" , Vec3( 0, 15, 10 ) },		
				{ "Bot_Wave_Sniper_T1" , Vec3( -15, 0, 0 ) },
			},
		},
--2,10		
		{
			{	
				{ "Bot_Wave_Sniper_T1" , Vec3( 0, 15, 10 ) },		
				{ "Bot_Wave_Sniper_T1" , Vec3( -15, 0, 0 ) },
			},
		},
--1,11		
		{
			{			
				{ "Bot_Wave_Rocket_T1" , Vec3( 0, 0, 0 ) },	
			},	
			{	
				{ "Bot_Wave_Meat_Inter_M_T1" , Vec3( 0, 0, 0 ) },		
			},					
		},	
--2,12
		{
			{			
				{ "Bot_Wave_Rocket_T1" , Vec3( 0, 0, 0 ) },	
			},	
			{	
				{ "Bot_Wave_Meat_Inter_M_T1" , Vec3( 0, 0, 0 ) },		
			},					
		},		
--1,13		
		{
			{
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, -10 ) },	
				{ "Bot_Wave_EnergyHardShield_T1" , Vec3( 15, 0, 0 ) },
				-----{ "Bot_Wave_EnergyHardShield_T1" , Vec3( 15, 0, -10 ) },
				-----{ "Bot_Wave_EnergyHardShield_T1" , Vec3( 15, 15, 0 ) },		
			},	
			{
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_HardShield_T1" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_HardShield_T1" , Vec3( 15, 0, -10 ) },
				-----{ "Bot_Wave_HardShield_T1" , Vec3( 15, 15, 0 ) },
			},			
		},	
--2,14
		{
			{			
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T1" , Vec3( 0, 0, -10 ) },	
				{ "Bot_Wave_EnergyHardShield_T1" , Vec3( 15, 0, 0 ) },
				-----{ "Bot_Wave_EnergyHardShield_T1" , Vec3( 15, 0, -10 ) },
				-----{ "Bot_Wave_EnergyHardShield_T1" , Vec3( 15, 15, 0 ) },
			},	
			{
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T1" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_HardShield_T1" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_HardShield_T1" , Vec3( 15, 0, -10 ) },
				-----{ "Bot_Wave_HardShield_T1" , Vec3( 15, 15, 0 ) },					
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
				{ "Bot_Wave_Meat_R3_S_T1" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_Meat_R3_S_T1" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_Meat_R3_S_T1" , Vec3( 15, 15, 0 ) },				
			},	
		},	
--1,17		
		{
			{
				-----{ "Bot_Wave_HardShield_T1" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_HardShield_T1" , Vec3( 0, 0, 0 ) },
				-----{ "Bot_Wave_HardShield_T1" , Vec3( 15, 15, 0 ) },				
			},		
		},	
--2,18		
		{
			{	
				{ "Bot_Wave_Boss_R3_M_T1" , Vec3( 0, 0, 0 ) },
			},	
		},
--2,19		
		{
			{	
				{ "Bot_Wave_Sniper_T1" , Vec3( 0, 15, 10 ) },		
				{ "Bot_Wave_Sniper_T1" , Vec3( -15, 0, 0 ) },
			},
		},	
--2,20		
		{
			{
				-----{ "Bot_Wave_HardShield_T1" , Vec3( -15, 0, -0 ) },
				{ "Bot_Wave_HardShield_T1" , Vec3( 0, 0, 0 ) },
				-----{ "Bot_Wave_HardShield_T1" , Vec3( 15, 15, 0 ) },				
			},	
		},
--2,21		
		{
			{
				-----{ "Bot_Wave_HardShield_T1" , Vec3( -15, 0, -0 ) },
				{ "Bot_Wave_HardShield_T1" , Vec3( 0, 0, 0 ) },
				-----{ "Bot_Wave_HardShield_T1" , Vec3( 15, 15, 0 ) },				
			},	
		},			
	}
	

PvE_W.amembers_T5 = {
		{	
--1,1
			{		
				{ "Bot_Wave_Meat_Inter_M_T5" , Vec3( 0, 0, 0 ) },
			},		
			{			
				{ "Bot_Wave_Rocket_T5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race1_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race2_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},	
--2,2	
		{
			{	
				{ "Bot_Wave_Meat_Inter_M_T5" , Vec3( 0, 0, 0 ) },		
			},		
			{			
				{ "Bot_Wave_Rocket_T5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race1_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race2_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},
--1,3	
		{
			{
				{ "Bot_Wave_Meat_R1_M_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Meat_R1_M_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_Meat_R1_M_T5" , Vec3( 15, 15, 0 ) },				
			},	
		},	
--2,4
		{
			{
				{ "Bot_Wave_Meat_R1_M_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Meat_R1_M_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_Meat_R1_M_T5" , Vec3( 15, 15, 0 ) },				
			},		
		},
--1,5		
		{
			{
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				----{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 10 ) },		
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, -10 ) },		
			},	
			{			
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 15, 0 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, -10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 10 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 0 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, -10 ) },	
			},				
		},	
--2,6		
		{
			{
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				----{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 10 ) },		
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, -10 ) },		
			},
			{			
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, -10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 10 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 0 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, -10 ) },	
			},				
		},		
--1,7		
		{
			{
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				----{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 10 ) },			
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, -10 ) },		
			},	
			{			
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, -10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 10 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 0 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, -10 ) },	
			},				
		},	
--2,8		
		{
			{
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				----{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 10 ) },		
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, -10 ) },		
			},		
			{			
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, -10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 10 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 0 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, -10 ) },	
			},				
		},
--1,9		
		{
			{	
				{ "Bot_Wave_Sniper_T5" , Vec3( 0, 15, 10 ) },		
				{ "Bot_Wave_Sniper_T5" , Vec3( -15, 0, 0 ) },
			},
		},
--2,10		
		{
			{	
				{ "Bot_Wave_Sniper_T5" , Vec3( 0, 15, 10 ) },		
				{ "Bot_Wave_Sniper_T5" , Vec3( -15, 0, 0 ) },
			},
		},
--1,11		
		{
			{			
				{ "Bot_Wave_Rocket_T5" , Vec3( 0, 0, 0 ) },	
			},	
			{	
				{ "Bot_Wave_Meat_Inter_M_T5" , Vec3( 0, 0, 0 ) },		
			},					
			{			
				{ "Ship_Race1_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race2_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},	
--2,12
		{
			{			
				{ "Bot_Wave_Rocket_T5" , Vec3( 0, 0, 0 ) },	
			},	
			{	
				{ "Bot_Wave_Meat_Inter_M_T5" , Vec3( 0, 0, 0 ) },		
			},					
			{			
				{ "Ship_Race1_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race2_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race3_H_T3_MiniBossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},		
--1,13		
		{
			{
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, -10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 10 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 0 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, -10 ) },	
				{ "Bot_Wave_EnergyHardShield_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_EnergyHardShield_T5" , Vec3( 15, 0, -10 ) },
				{ "Bot_Wave_EnergyHardShield_T5" , Vec3( 15, 15, 0 ) },			
			},	
			{
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				----{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 10 ) },		
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, 10 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, -10 ) },		
				{ "Bot_Wave_HardShield_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 15, 0, -10 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 15, 15, 0 ) },
			},			
		},	
--2,14
		{
			{			
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 0 ) },
				---{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 15, 0 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 0, 0, -10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( -15, 0, 10 ) },
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, 10 ) },	
				----{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 0 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 0, -10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, 10 ) },	
				{ "Bot_Wave_EnergyTaran_T5" , Vec3( 15, 15, -10 ) },	
				{ "Bot_Wave_EnergyHardShield_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_EnergyHardShield_T5" , Vec3( 15, 0, -10 ) },
				{ "Bot_Wave_EnergyHardShield_T5" , Vec3( 15, 15, 0 ) },
			},	
			{
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 0, 10 ) },					
				---{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 0, 0 ) },
				----{ "Bot_Wave_Kamikaze_T5" , Vec3( 0, 15, 0 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( -15, 15, 10 ) },		
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, 10 ) },
				{ "Bot_Wave_Kamikaze_T5" , Vec3( 15, 15, -10 ) },		
				{ "Bot_Wave_HardShield_T5" , Vec3( 15, 0, 0 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 15, 0, -10 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 15, 15, 0 ) },
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
				{ "Bot_Wave_Meat_R3_S_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_Meat_R3_S_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_Meat_R3_S_T5" , Vec3( 15, 15, 0 ) },				
			},	
		},	
--1,17		
		{
			{
				{ "Bot_Wave_HardShield_T5" , Vec3( -15, 0, 0 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 15, 15, 0 ) },				
			},		
		},	
--2,18		
		{
			{	
				{ "Bot_Wave_Boss_R3_M_T5" , Vec3( 0, 0, 0 ) },
			},	
			{			
				{ "Ship_Race1_H_T4_BossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race2_H_T4_BossT5" , Vec3( 0, 0, 0 ) },	
			},				
			{			
				{ "Ship_Race3_H_T4_BossT5" , Vec3( 0, 0, 0 ) },	
			},				
		},
--2,19		
		{
			{	
				{ "Bot_Wave_Sniper_T5" , Vec3( 0, 15, 10 ) },		
				{ "Bot_Wave_Sniper_T5" , Vec3( -15, 0, 0 ) },
			},
		},	
--2,20		
		{
			{
				{ "Bot_Wave_HardShield_T5" , Vec3( -15, 0, -0 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 15, 15, 0 ) },				
			},	
		},
--2,21		
		{
			{
				{ "Bot_Wave_HardShield_T5" , Vec3( -15, 0, -0 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 0, 0, 0 ) },
				{ "Bot_Wave_HardShield_T5" , Vec3( 15, 15, 0 ) },				
			},	
		},			
	}
	
for iportal = 1, 19 do
	for ipatrol = 1, #PvE_W.amembers_T1[iportal] do
		a = {
			name = "Alien_Patrol"..iportal.."_"..ipatrol,
			relationship_group = 2,
			spawn_spot = "alien_spawn_spot"..iportal,
			route = PvE_W.nVariant, --..iportal,
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			respawn_time = 12000,
			members = {},
		}
		for nCargoShip = 1, #PvE_W.aCargoShips_T1 do
			p = PvE_W.aCargoShips_T1[nCargoShip]
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
		for nSniper = 1, #PvE_W.aSnipers do
			p = PvE_W.aSnipers[nSniper]
			if p.portal == iportal and p.patrol == ipatrol then
				if p.enemy_pack_radius then
					a.enemy_pack_radius = p.enemy_pack_radius	
				end
			end
		end

		table.insert(a.members, PvE_W.amembers_T1[iportal][ipatrol])
		table.insert(PvE_Missions.nalnifan_lumen_waves_T1.squads, a)
	end
end

for iportal = 1, 19 do
	for ipatrol = 1, #PvE_W.amembers_T5[iportal] do
		a = {
			name = "Alien_Patrol"..iportal.."_"..ipatrol,
			relationship_group = 2,
			spawn_spot = "alien_spawn_spot"..iportal,
			route = PvE_W.nVariant, --..iportal,
			squad_type = ai.AISquadType.PATROL,
			spawn_by_mission = true,
			respawn_time = 12000,
			members = {},
		}
		for nCargoShip = 1, #PvE_W.aCargoShips_T5 do
			p = PvE_W.aCargoShips_T5[nCargoShip]
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
		for nSniper = 1, #PvE_W.aSnipers do
			p = PvE_W.aSnipers[nSniper]
			if p.portal == iportal and p.patrol == ipatrol then
				if p.enemy_pack_radius then
					a.enemy_pack_radius = p.enemy_pack_radius	
				end
			end
		end

		table.insert(a.members, PvE_W.amembers_T5[iportal][ipatrol])
		table.insert(PvE_Missions.nalnifan_lumen_waves_T5.squads, a)
	end
end

for i=1, #PvE_W.HudDialogs do
	table.insert(PvE_Missions.nalnifan_lumen_waves_T1.HudDialogs, PvE_W.HudDialogs[i])
	table.insert(PvE_Missions.nalnifan_lumen_waves_T5.HudDialogs, PvE_W.HudDialogs[i])
end

function PvE_W:WavesSet(nTier)
	PvE_W:slog( "================PvE_W:WavesSet" )
	PvE_W.nSquadRespawn = 99930 -- принудительный спавн волны
	PvE_W.nAliveAliensToSpawnPortal = 0 -- сколько должно остаться живых ботов чтобы заспавнилась следующая волна
	--PvE_W.nSquadCountInPortal = 1 -- количество волн аддов из 1 портала
	PvE_W.nCurrentSequence = 0 -- номер текущего открытого портала	
	PvE_W.aWow = { "pve_Meat", "pve_Snipers", "pve_Kamikadze", "pve_Aliens", }
	PvE_W.nBonus = 0
	PvE_W.nDisthelp = 0
	PvE_W.bShowAlive = false
	
	PvE_W.nTier = nTier
	if nTier == 5 then
	PvE_W.amembers = PvE_W.amembers_T5	
	PvE_W.aCargoShips = PvE_W.aCargoShips_T5	
	elseif nTier == 1 then
	PvE_W.amembers = PvE_W.amembers_T1	
	PvE_W.aCargoShips = PvE_W.aCargoShips_T1		
	end
end


function PvE_W:WavesInit()
	PvE_W.nPhase = -1

	PvE_W.nPortalState = 0
	
	PvE_W.nPortalCount = 19
	PvE_W.aPortal = {}
	PvE_W.aPortalTimer = {}
	PvE_W.aportalTimer2 = {} 
	PvE_W.aPortalTimerState = {}
	PvE_W.aPortalWaveCount = {}
	PvE_W.aPortalBotsCount = {}
	PvE_W.aSquadTimer = {}
	PvE_W.aSquadState = {}
	PvE_W.aPatrolState = {}
	PvE_W.aPortalState = {}

	PvE_W.aBots = {} -- список ботов для определения уничтожения волн
	
	PvE_W.aWarpGate = {}
	PvE_W.nWarpGateCount = 1
	
	PvE_W.aStation = {}	-- станции поддержки
	PvE_W.nStationCount = 2
	PvE_W.nBonusTimer = 0 -- таймер для запуска бонуса
	PvE_W.nBonusTimerSet = 10 -- Длительность работы бонуса (потом надо обновлять)

	local a = {}
	
	-- пробегаем по порталам
	for i, pid in pairs( GetEntitiesByClass( "VitalPoint" ) ) do
		p = Entities[pid]:GetName()
		a[p] = pid
	end

	for i=1, PvE_W.nPortalCount do
		PvE_W.aPortal[i] = a["alien_portal"..i] -- имена порталов должны быть только такие!
		PvE_W.aPortalTimer[i] = 0	-- для закрытия порталов по таймеру
		PvE_W.aPortalTimerState[i] = 0
		PvE_W.aSquadTimer[i] = -1
		PvE_W.aSquadState[i] = 0
		PvE_W.aPatrolState[i] = 0
		PvE_W.aPortalState[i] = false
		PvE_W.aPortalBotsCount[i] = -1
		PvE_W:slog( "portal "..i.." - "..PvE_W.aPortal[i], 9)
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
	
	for i=1, PvE_W.nWarpGateCount do
		PvE_W.aWarpGate[i] = a["WarpGate"..i] -- имена варпгейтов должны быть только такие!
		sys.log( "WarpGate %d - %d", i , PvE_W.aWarpGate[i])
	end

	for i=1, PvE_W.nStationCount do
		PvE_W.aStation[i] = a["Station"..i] -- имена станций поддержки должны быть только такие!
		sys.log( "Support Station %d - %d", i , PvE_W.aStation[i])
	end

	PvE_W.MobileSpawn = a["mobile_spawn"] -- это id перемещаемого спавна
	PvE_W.nMobileSpawnTimer = 5 -- после вылета баржи начнут спавниться камикадзе
	PvE_W.nMobileSpawnCooldown = 15 -- после уничтожения камикадзе опять вылезут (пока есть баржа)
	
	PvE_W.timer = 0 -- таймер для общих нужд (пока юзаю для ожидания анимации закрытия портала крейсера, и задержка проверки на появление самого крейсера)
	
	PvE_W.isAdditionalColorRemap = false

	PvE_W.posLastBot = false	-- позиция последнего живого бота (для постановки бонуса)
	PvE_W.posDistHelp = false	-- позиция последнего живого бота (для постановки бонуса)
	PvE_W.nPortalAlive = 0 -- число открытых порталов
	PvE_W.pInfo = false	-- тут инфа об игроках лежит, чтобы только 1 раз за кадр запрашивать её
	PvE_W.nDistTransport = 20	-- расстояние от конца пути транспорта, на котором спелл срабатывает
	PvE_W.testTimerMax	= 120 -- через это время начнём спамить в лог
	PvE_W.testTimerKill	= 180 -- через это время убьём живых ботов
	PvE_W.testTimer		= 0 
	PvE_W.BotMaxTimer	= 360 -- через 6 минут бот считается пропавшим без вести и не учитывается
	
	-- найдём точки окончания пути всех транспортов
	for nCargoShip = 1, #PvE_W.aCargoShips do
		for ii, id in pairs( GetEntitiesByClass( "PathObject" ) ) do
			p = Entities[id]
			s = p:GetName()
			if s == PvE_W.aCargoShips[nCargoShip].path then
				PvE_W.aCargoShips[nCargoShip].pos = p:GetPointAlong(1)
				sys.log( "================================ +++++++++++++ CargoShip %d - %s", id , s)
			end
		end
	end

	PvE_W.nVariant = math.random(#PvE_W.aSequence)
	
end

-- вызвать алиена с портала (елси надо активировать портал)
function PvE_W:WavesSpawnAISquad( nPortal )
			sys.log( "Table", #PvE_W.amembers )
	if (nPortal > 0) and (nPortal <= PvE_W.nPortalCount) then
		if PvE_W.aSquadTimer[nPortal] < 0 then
			sys.log( "----------------------- show portal %d", nPortal )
					if not PvE_W.HudInf1 then
						SV_Pve_ScriptedNotification( "PvE_Start" )
						PvE_W.HudInf1 = true
					end
			local portal = Entities[ PvE_W.aPortal[nPortal] ]
			PvE_W.aPortalTimer[nPortal] = 5 -- прятать портал после этого времени
			portal:FullActivate(true)
			portal:SV_SetActivity( "7", false )
		end
		-- пускаем следующий сквад
		if (PvE_W.aSquadState[nPortal] == 0) and (PvE_W.aPatrolFromPortal[nPortal] == 1) then	-- выбираем рандомно какой патруль будет вылетать из портала, если патруль из портала будет всего 1
			PvE_W.aPatrolState[nPortal] = math.random(#PvE_W.amembers[nPortal])
		else
			PvE_W.aPatrolState[nPortal] = PvE_W.aSquadState[nPortal] + 1 -- иначе пускаем патрули по порядку
		end
		PvE_W.aSquadState[nPortal] = PvE_W.aSquadState[nPortal] + 1
		
		--if PvE_W.aSquadState[nPortal] > #PvE_W.amembers[nPortal] then
			--PvE_W.aSquadState[nPortal] = 1	-- с начала не надо, убили всех и убили
		--end
		
		if PvE_W.aSquadState[nPortal] <= PvE_W.aPatrolFromPortal[nPortal] then	--#PvE_W.amembers[nPortal] -- номер патруля не больше, чем число патрулей с портала
			sys.log( "+++++++++++++++ init patrol %d", nPortal )
			SV_Pve_AISquadSpawn( "Alien_Patrol" .. nPortal .. "_" .. PvE_W.aPatrolState[nPortal]) --PvE_W.aSquadState[nPortal])
			if nPortal == 15 then
				SV_Pve_StartPhase( 2 )
			end
		else -- защита от переполнения ботами при анлиме порталов
			sys.log( "+++++++++++++++ no more patrol %d", nPortal )
		end

		PvE_W.aSquadTimer[nPortal] = 0 -- таймер в любом случае сбросить лучше, чтобы логи не забивать
	else
		sys.log( "!!! Invalid nPortal %d", nPortal )
	end
end

function PvE_W:BotStateUpdate(id, bTransport, dt)
	local bot, nPortal, nBest, nDist
	bot = Entities[id]
	if bot then
		if bot:GetRelationshipGroup() == 2 then
			if not bot:IsDead() then
				--sys.log( "BotName %s", bot:GetName() )
				if not PvE_W.aBots[id] then -- бот не описан, новенький, ищем - откуда вылез
					nPortal = 0 -- номер ближайшего к боту портала
					nBest = 99999 -- минимальное расстояние до портала
					for iPortal = 1, PvE_W.nPortalCount do
						if PvE_W.aSquadState[iPortal] > 0 then -- портал открыт или открывается
							nDist = #(Entities[ PvE_W.aPortal[iPortal] ]:GetPos() - bot:GetPos())
							if nDist < nBest then
								nBest = nDist
								nPortal = iPortal
							end
						end
					end
					
					PvE_W.aBots[id] = {nPortal, true, 0} -- Ближайший к боту портал, бот жив, время жизни
					--sys.log( "Bot %d приписан к порталу %d", id, nPortal)
				else
					PvE_W.aBots[id][2] = true -- бот жив (номер портала не меняем)
					PvE_W.aBots[id][3] = PvE_W.aBots[id][3] + dt -- считаем как долго живёт
					nPortal = PvE_W.aBots[id][1]
					if PvE_W.bShowAlive then
						PvE_W:slog( "Bot "..id.. "жив, портал "..nPortal, 1, 10) 
					end
				end
				if not bTransport then
					if PvE_W.aBots[id][3] > PvE_W.BotMaxTimer then
						nPortal = 0 -- бот слишком долго живёт, игнорим его и открываем следующий портал при необходимости
					end
				end
				if nPortal > 0 then -- если бот не долгоживущий
					PvE_W.aPortalBotsCount[nPortal] = PvE_W.aPortalBotsCount[nPortal] + 1 -- считаем сколько живых ещё ботов вылезло из портала
					PvE_W.posLastBot = bot:GetPos()	-- запоминаем позицию живого бота
					PvE_W.aPortalState[nPortal] = true	-- из портала кто-то да вылетал, можно будет проверять, что их всех убили
				end
				-- проверка долетел ли транспорт до конца пути
				if bTransport then
					local botpos = bot:GetPos()				
					for nCargoShip = 1, #PvE_W.aCargoShips do
						if PvE_W.aCargoShips[nCargoShip].portal == nPortal then
							if PvE_W.aCargoShips[nCargoShip].spell and not PvE_W.aCargoShips[nCargoShip].isSpellActivate then
								d = #(PvE_W.aCargoShips[nCargoShip].pos - botpos)
								if d < PvE_W.nDistTransport then -- транспорт доехал до места, надо ауру запустить
									sys.log( "+++ Transport BotName %d", id ) --bot:GetName()
									SV_Pve_CastSpell( PvE_W.aCargoShips[nCargoShip].spell, id, id, bot, botpos )
									PvE_W.aCargoShips[nCargoShip].isSpellActivate = true -- 1 раза на транспорт достаточно
									break -- перебирать остальные транспорты нет смысла, нашли
								end
							end
						end
					end
				end
				
				-- мониторинг долгоживущих
				-- if not PvE_W.aTest then
					-- PvE_W.aTest = {} -- список долгоживущих
				-- end
				
				-- if PvE_W.testTimer then
					-- if PvE_W.testTimer > PvE_W.testTimerMax then
						-- if PvE_W.aTest[id] then
							-- PvE_W.aTest[id] = PvE_W.aTest[id] + 1
							-- if PvE_W.aTest[id] > 100 then
								-- PvE_W.aTest[id] = false -- надо раз в 100 кадров показывать
							-- end
						-- else
							-- PvE_W:slog( "still alive "..id, 10, 100) 
							-- PvE_W.aTest[id] = 1
						-- end
					-- end
					-- if PvE_W.testTimer > PvE_W.testTimerKill and not bTransport and not PvE_W.botkill then
						-- sys.log( "killing Bot id %d", id)
						-- bot:DieAndBlow()	--#97024
						-- PvE_W.aTest[id] = false
						-- PvE_W.botkill = true -- убиваем ботов строго по одному в кадр - чтобы не было перегруза сервера
						-- PvE_W.testTimer = 0
					-- end
				-- else
					-- PvE_W.testTimer = 0
				-- end
			end
		end
	end
end


-- потдержка актуального состояния порталов
function PvE_W:WavesUpdate( dt )

	PvE_W.testTimer = PvE_W.testTimer + dt -- для мониторинга долгоживущих ботов

	-- считаем живых ботов, если их меньше минимума спавним следующую волну или следующий портал
	-- смотрим сколько осталось живых алиенов и если меньше нормы - запускаем крейсер
	for name, data in pairs( PvE_W.aBots ) do
		PvE_W.aBots[name][2] = false -- отмечаем всех известных ботов мёртвыми, далее будет цикл по живым ботам 
	end
	for iPortal = 0, PvE_W.nPortalCount do
		PvE_W.aPortalBotsCount[iPortal] = 0 -- обнуляем счётчик живых ботов
	end
	PvE_W.pInfo = GetAllPlayersInfo() -- это надо каждый кадр обновлять для того чтобы камикадзе отслеживать
	PvE_W.botkill = false -- это чтобы больше 1 бота за кадр не убивать оп таймайту и не перегружать сервер
	for ii, id in pairs( GetEntitiesByClass( "SpaceShip" ) ) do
		if PvE_W:BotStateUpdate(id, false, dt) then break end -- убиваем по одному за кадр
	end
	for ii, id in pairs( GetEntitiesByClass( "CargoShip" ) ) do
		PvE_W:BotStateUpdate(id, true, dt)
	end

	-- теперь порталы сами отслеживают свои волны
	PvE_W.nPortalAlive = 0

	for iPortal = 1, PvE_W.nPortalCount do
		if PvE_W.aSquadState[iPortal] > 0 then
			if PvE_W.aPortalTimer[iPortal] < 0 and PvE_W.aPortalTimer[iPortal] > -100 then
				if PvE_W.aPortalTimerState[iPortal] == 0 then
					sys.log( "----------------------- animation hide portal on timer %d", iPortal )
					Entities[ PvE_W.aPortal[iPortal] ]:SV_SetActivity( "8", false )
					PvE_W.aPortalTimerState[iPortal] = 1
					PvE_W.aPortalTimer[iPortal] = 0.38
				else
					sys.log( "----------------------- hide portal on timer %d", iPortal )
					Entities[ PvE_W.aPortal[iPortal] ]:FullActivate(false)
					PvE_W.aPortalTimerState[iPortal] = 0
					PvE_W.aPortalTimer[iPortal] = -100 -- чтобы больше не отключать
				end
			else
				PvE_W.aPortalTimer[iPortal] = PvE_W.aPortalTimer[iPortal] - dt
			end
			PvE_W.nPortalAlive = PvE_W.nPortalAlive + 1
			--sys.log( "-------------- portal %d botscount %d", iPortal, PvE_W.aPortalBotsCount[iPortal] )
			
			if PvE_W.aPortalState[iPortal] and PvE_W.aPortalBotsCount[iPortal] == 0 then -- кончилась волна
				PvE_W.aPortalState[iPortal] = false -- отрубаем возможность повторной сработки пока кто-нить не вылетит из портала
					if PvE_W.aSquadState[iPortal] < PvE_W.aPatrolFromPortal[iPortal] then --#PvE_W.amembers[iPortal]
						-- пускаем следующий сквад
						PvE_W.aSquadTimer[iPortal] = -1
						PvE_W:WavesSpawnAISquad( iPortal )
					else	-- закрываем портал
						PvE_W.aSquadTimer[iPortal] = -1
						PvE_W.aSquadState[iPortal] = 0
						sys.log( "----------------------- hide portal %d", iPortal )
						if PvE_W.aPortalTimer[iPortal] > -100 then	-- портал ещё не закрыт по таймеру
							Entities[ PvE_W.aPortal[iPortal] ]:FullActivate(false)
						end
						PvE_W.nPortalAlive = PvE_W.nPortalAlive - 1 -- не надо считать такой портал открытым
					end

					PvE_W:SpawnBonus() -- установка бонуса в позицию PvE_W.posLastBot
				--end
			else
				if not PvE_W.aPortalState[iPortal] then
					if not PvE_W.aportalTimer2[ iPortal ] then	-- отдельный таймер для этого дела использовать надо, не перемешивая со старым
						PvE_W.aportalTimer2[ iPortal ] = 0
					else
						PvE_W.aportalTimer2[ iPortal ] = PvE_W.aportalTimer2[ iPortal ] + dt
					end
					if PvE_W.aportalTimer2[ iPortal ] > 5 then
						PvE_W.aportalTimer2[ iPortal ] = nil -- на следующий раз приводим в исходное состояние
						PvE_W.aPortalState[ iPortal ] = true -- раз 5 секунд никто не вылетел, принудительно считаем, что портал открылся
					end
					--sys.log( "-------------- portal %d no spawn but activate", iPortal)
				end
			end
		end
	end
	
	if PvE_W.nPortalAlive==0 then -- закрылись все порталы (или первый запуск)
		if PvE_W.timer <= 0 then
			sys.log( "--- end off aSequence %d", PvE_W.nCurrentSequence )		
			if PvE_W.nCurrentSequence > 0 then
				for i = 1, PvE_W.nWarpGateCount do -- включаем варпгейты как положено
					w = Entities[PvE_W.aWarpGate[i]]
					if i == PvE_W.aWarpGateSequence[PvE_W.nVariant][PvE_W.nCurrentSequence] then
						w:FullActivate( true )
						SV_Pve_TCSMessage( w )
						sys.log( "WarpGate")
					else
					--	w:FullActivate( false )
						sys.log( "NonWarpGate")
					end
				end
			end
			
			PvE_W.nWin = PvE_W.nCurrentSequence * 0.1 -- % прохождения по 10% за волну которую прошли
			PvE_W.nCurrentSequence = PvE_W.nCurrentSequence + 1 -- теперь это номер в таблице aSequence

			-- надо двигать SpawnTeam1_1 на место SpawnTeam1_3 (SpawnSpot) после 3й волны
			if PvE_W.nCurrentSequence == 3 then
				sys.log( "--- Spawn move...")
				-- local as = {}
				-- local i, pid, p
				
				-- -- пробегаем по спавнам
				-- for i, pid in pairs( GetEntitiesByClass( "SpawnSpot" ) ) do
					-- p = Entities[pid]:GetName()
					-- as[p] = pid
					-- --sys.log( "--- Spawn:"..p)
				-- end
				
				-- if as["SpawnTeam1_1"] and as["SpawnTeam1_3"] then
					-- Entities[as["SpawnTeam1_1"]]:SetPos(Entities[as["SpawnTeam1_3"]]:GetPos())
					-- Entities[as["SpawnTeam1_1"]]:SetRot(Entities[as["SpawnTeam1_3"]]:GetRot())
					-- sys.log( "--- Spawn moved")
				-- else
					-- sys.log( "--- Spawn not found")
				-- end
				
				SV_Pve_SetSpawnGroup( 1 )
				
			end

			SV_Pve_ScriptedNotification( "pve_Meat")

			-- открываем порталы как прописано в aSequence
			sys.log( "nVariant"..PvE_W.nVariant)
			sys.log( "nCurrentSequence"..PvE_W.nCurrentSequence)
			for ii, iPortal in pairs( PvE_W.aSequence[PvE_W.nVariant][PvE_W.nCurrentSequence] ) do
				PvE_W:WavesSpawnAISquad( iPortal )
			end
			PvE_W.nPortalAlive = -1 -- пока порталы не открылись (боты вылетят и сбросят переменную)
			PvE_W.aBots = {} -- обнулим, ботов то нет ещё.

			for i = 1, PvE_W.nStationCount do -- включаем станции поддержки как положено
				s = Entities[PvE_W.aStation[i]]
				n = PvE_W.aStationSequence[PvE_W.nVariant][PvE_W.nCurrentSequence]
				if i == math.abs(n) then
					if not (i == PvE_W.nCurrentStation) then
						s:FullActivate( true )
						sys.log( "Station %d", n)
						PvE_W.nCurrentStation = i
					end
				else
					s:FullActivate( false )
				end
			end

			PvE_W.timer = PvE_W.nWait
			PvE_W.testTimer = 0	-- сбрасываем время для мониторинга долгоживущих ботов
			PvE_W.aTest = {} -- список долгоживущих
		else
			if PvE_W.timer == PvE_W.nWait then 
				SV_Pve_ScriptedNotification( "pve_EndMeat")
			end
			PvE_W.timer = PvE_W.timer - dt
			--sys.log( "--- timer %d", PvE_W.timer )
		end
	end
	
	-- бонусы от станций поддержки
	local n = PvE_W.aStationSequence[PvE_W.nVariant][PvE_W.nCurrentSequence]
	if n < 0 then
		s = Entities[PvE_W.aStation[math.abs(n)]]
		if s and not s:IsDead() then
			PvE_W.nBonusTimer = PvE_W.nBonusTimer - dt
			if PvE_W.nBonusTimer < 0 then
				PvE_W.nBonusTimer = PvE_W.nBonusTimerSet
				sys.log( "---------------------------------------------------------------------- set bonus")
				local id = s:GetId()
			--	SV_Pve_CastSpell( "Support_Bonus_Damage", id, id, s, s:GetPos() )
			end
		end
	end

	-- спецэффекты для боссов (транспортников)
	for ii, id in pairs( GetEntitiesByClass( "CargoShip" ) ) do
		c = Entities[id]
		if c and not c:IsDead() then
			if not SV_Pve_AISquadIsAlive("MobileSpawn") then
				PvE_W.nMobileSpawnTimer = PvE_W.nMobileSpawnTimer - dt
			end
			
			if PvE_W.nMobileSpawnTimer < 0 then
				sys.log( "+++++++++++++++ MobileSpawn")
				PvE_W.testTimer = 0 -- сброс таймера
				
				-- v = c:GetLinearVelocity()
				-- d = #v

				s = Entities[PvE_W.MobileSpawn]
				sys.log( "+++++++++++++++ MobileSpawn dist %d", d )
				
				-- if d > 0.5 then	-- защита от 0 (на разгоне)
				
					s:SetPos((c:GetBoneWorldPos("fx6") - c:GetPos())*1.5 + c:GetPos())
				--	s:SetPos(c:GetPos() + v * (160/d))	--220
					SV_Pve_AISquadSpawn( "MobileSpawn")
					PvE_W.nMobileSpawnTimer = PvE_W.nMobileSpawnCooldown
				-- end

				--[[
				sys.log( "+++++++++++++++ TorpedSpawn") -- пока не робит
				for i = 1, 1 do
					PvE_W:LaunchRocket( c, "Boss_Torpedo_W", 3 )
				end
				PvE_W.nMobileSpawnTimer = PvE_W.nMobileSpawnCooldown
				]]--
			end
			
			-- Pirate_Barge_Engine замедляем транспорт если нет такого дефа на карте
			local nEngine = 0
			for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do	---#66194 было ScBaseEntity 
				s = Entities[pid]:GetDefName()
				if (s == "Pirate_Barge_Engine_T1") or (s == "Pirate_Barge_Engine_T5") then
					local tur = Entities[pid]
					if tur and not tur:IsDead() then	-- #67167
						nEngine = nEngine + 1
					end
				end
			end
			
			if PvE_W.nBTimer then -- таймер на появление
				PvE_W.nBTimer = PvE_W.nBTimer + dt
			else
				PvE_W.nBTimer = 0
			end			
			
			if PvE_W.nBTimer < 0.5 then
				c:SetTargetSpeed( 700 ) -- максимально доступная скорость для баржи
			elseif PvE_W.nBTimer > 0.5 and PvE_W.nBTimer < 1.0 then
				    local stop_time = 0.5
					local x = ( PvE_W.nBTimer - 0.5) / stop_time
					local smooth_modifier = -2 * x * x * x + 3 * x * x;
					local startSpeed = 700
					local endSpeed = 2.1 + 0.3 * PvE_W.nTier + nEngine * (0.8 + 0.2 * PvE_W.nTier)
					local speed = startSpeed + (endSpeed - startSpeed) * smooth_modifier;
					c:SetTargetSpeed( speed )
			else
				c:SetTargetSpeed( 1.5 + nEngine * (0.3 + 0.2 * PvE_W.nTier) ) 
			end	
			
			-----c:SetTargetSpeed( 1.5 + nEngine * (0.7 + 0.1 * PvE_W.nTier) ) 
			--sys.log( "+++++++++++++++ speed %d", 2 + nEngine * 1.5 )

			-- перенёс сюда нотификацию на сбивание движков, ибо не фиг в 2х местах опрашивать движки
			if not PvE_W.nEngineAlive then
				PvE_W.nEngineAlive = nEngine
			end
			if nEngine < PvE_W.nEngineAlive then
				PvE_W.nEngineAlive = nEngine
				SV_Pve_ScriptedNotification("W_EngineDead")
				PvE_W.nWin = 0.75 - nEngine * 0.05	-- движки ключ к победе
			end			

		end
	end

end


-- пуск ракеты 0- под себя, 1 - ближние цели, 2- дальние цели, 3 -рандом, 4- аванпост, 5-аванпосты/игроки -1 - мегаядерку в конкретной точке заспавнить, -2 спелл
function PvE_W:LaunchRocket( owner, defName, nTargetType, vPos )
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
				--sys.log( "dist=%d mid=%d", adist[i], middist)
				
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
				--sys.log( "tagrget is %d", target)
				target = Entities[ atarget[target] ]
			end
		end
	end

	aimDir = target:GetPos() -- owner:GetPos() -- направление на цель
	if nTargetType >= 0 then
		vPos = owner:GetPos()
		--local dir = aimDir - vPos
		
		local v = owner:GetLinearVelocity()
		local d = #v

		if d > 0.5 then	-- защита от 0 (на разгоне)
			vPos = vPos + v * (160/d) -- вылет из ангара
		end
	end

	--sys.log( "+++++++++++++++++++++Launch! ")
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
function PvE_W:SpawnBonus()
	PvE_W.nBonus = PvE_W.nBonus + 1
	if PvE_W.posLastBot then
		for ii, id in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
			s = Entities[ id ]
			if s:GetName() == "Bonus"..PvE_W.nBonus then
				s:SetPos(PvE_W.posLastBot)	-- бонус сюда
			end
		end
	end
end


-- функция вызывается каждый кадр
function PvE_W:OnUpdateRound(self, dt, curPhase, nTier)

	if PvE_W.nPhase == -2 then
		PvE_W.nPhase = -1
		
		math.randomseed(  _G.GetLocalTimeOfDay() )
		sys.log( "initialize %d", _G.GetLocalTimeOfDay() )		
		
		PvE_W:WavesSet(nTier)	-- в зависимости от тира, будут разные настройки

		PvE_W:WavesInit()
		
	elseif curPhase == 2 then
	
		local barzha = false
		local ebarzha = false
		--найти баржу
		for ii, id in pairs( GetEntitiesByClass( "CargoShip" ) ) do
			barzha = true
			ebarzha = Entities[id]
			break
		end

		if (barzha and ebarzha and ebarzha:IsDead()) or (PvE_W.HudInf and not barzha) then
			return	-- если баржу убили, то дальше мониторить что-либо не нужно
		end
		
		if not PvE_W.HudInf then
			SV_Pve_ScriptedNotification( "PvE_Cruiser" )
			PvE_W.HudInf = true
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
				for i, pid in pairs( GetEntitiesByClass( "ScBaseEntity" ) ) do
					if Entities[pid]:GetDefName() == "PvE_wave_HugeCargo_Additional" or Entities[pid]:GetDefName() == "OpenWorld_ReiderJumpgate_XL" then
						CargoAdds=Entities[pid]
						CargoAdds:FullActivate(true)
					end
				end
				-- всё игроки проиграли, крейсер уничтожил станцию.	
				sys.log( "ldist %d", lDist)
				return 2, ai.WinReason.PVE_MISSION_COMPLETE
			else
				PvE_W:slog( "ldist "..lDist, 100, 10) 
			end	
		end
	end
	
	-- набирать таймер на пуск ракет/сквадов и следить не убили ли порталы (прятать тела)
	PvE_W:WavesUpdate( dt )
	
	-- отображение текущей фазы в лог (и wow сообщением)
	if not (PvE_W.nPhase == curPhase) then
		PvE_W.nPhase = curPhase
		sys.log( "================PvE_W:SV_OnUpdateRound( %d )", curPhase )
		if not lDist then lDist = -999999 end
		PvE_W:slog( "ldist "..lDist, 100, 10) 
	end
end



function PvE_W:SV_GetFinishRewardCoefs(self, nTier, roundsFinished)
	sys.log( "================PvE_W:SV_GetFinishRewardCoefs(self, nTier) nTier = %d, PvE_W.nWin = %d, roundsFinished = %d", nTier, PvE_W.nWin*100, roundsFinished )
	if roundsFinished > 0 then	-- победа, полная награда, иначе то что накопилось в процессе - максимум 75% (сбили все движки), 50% дошли до баржи... т.е. 10% за фазу
		PvE_W.nWin = 1
	end
	return PvE_W.nWin, PvE_W.nWin-- , PvE_W.nWin
end

function PvE_W:GetBaseLootAttempts(self, nTier, roundsFinished)
	sys.log( "================PvE_W:GetBaseLootAttempts(self, nTier) nTier = %d, PvE_W.nWin = %d, roundsFinished = %d", nTier, PvE_W.nWin*100, roundsFinished )
	
	if roundsFinished > 0 then
		return 3
	else
		return 0
	end
end




-----------------------------------------------------------------------------------------------------------
-- функция вызывается каждый кадр, пока миссия активна(когда геймплей активен, после финиша не вызывается).
PvE_Missions.nalnifan_lumen_waves_T1.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_W:OnUpdateRound(self, dt, curPhase, 1)
end

PvE_Missions.nalnifan_lumen_waves_T5.rounds[1].SV_OnUpdateRound = function (self, dt, curPhase)
	return PvE_W:OnUpdateRound(self, dt, curPhase, 5)
end


-- модификация награды #55051
--float, float, float SV_GetFinishRewardCoefs( int roundsFinished )
--int SV_GetBaseLootAttempts( int roundsFinished )
PvE_Missions.nalnifan_lumen_waves_T1.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_W:SV_GetFinishRewardCoefs(self, 1, roundsFinished)
end

PvE_Missions.nalnifan_lumen_waves_T5.rounds[1].SV_GetFinishRewardCoefs = function( self, roundsFinished )
    return PvE_W:SV_GetFinishRewardCoefs(self, 5, roundsFinished)
end


PvE_Missions.nalnifan_lumen_waves_T1.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_W:GetBaseLootAttempts(self, 1, roundsFinished)
end

PvE_Missions.nalnifan_lumen_waves_T5.rounds[1].SV_GetBaseLootAttempts = function( self, roundsFinished )
    return PvE_W:GetBaseLootAttempts(self, 5, roundsFinished)
end
