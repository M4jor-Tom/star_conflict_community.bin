-- пресеты паков кораблей для геймплеев
-- для игроков то на каком корабле они будут играть задается masterServer'ом перед стартом игры
-- для ботов выбирается рандомный пресет
-- для дебага, когда игрок подключается к игре не через мастер сервер, ему тоже выбирается случайный пресет как для ботов
--[[ PreparedVessels = 
{
	[ 1 ] = { "Ship_Debug1_S_T1", "Ship_Debug1_M_T1",  "Ship_Debug1_L_T1", },
	[ 2 ] = { "Ship_Debug2_S_T3", "Ship_Debug1_M_T2",  "Ship_Debug2_L_T3", },
	[ 3 ] = { "Ship_Debug1_S_T3", "Ship_Debug1_M_T3",  "Ship_Debug1_L_T1", },
	[ 4 ] = { "Ship_Debug1_S_T4", "Ship_Debug1_M_T4",  "Ship_Debug2_L_T3", },
	[ 5 ] = { "Ship_Debug1_S_T2", "Ship_Debug1_M_T3",  "Ship_Debug1_L_T1", },
	--для разнообразия чтобы забить видеопамять и разнообразнить действо
	[ 6 ] = { "Ship_Debug3_L_T1_F1", "Ship_Debug3_M_T1_F1",  "Ship_Debug3_S_T1_F1", },
	[ 7 ] = { "Ship_Debug3_L_T2_F2", "Ship_Debug3_M_T2_F2",  "Ship_Debug3_S_T2_F2", },
	[ 8 ] = { "Ship_Debug3_L_T3_P", "Ship_Debug3_M_T3_P",  "Ship_Debug3_S_T3_P", },
	[ 9 ] = { "Ship_Debug2_L_T1_F1", "Ship_Debug2_M_T1_F1",  "Ship_Debug2_S_T1_F1", },
	[ 10 ] = { "Ship_Debug2_L_T2_F2", "Ship_Debug2_M_T2_F2",  "Ship_Debug2_S_T2_F2", },
	[ 11 ] = { "Ship_Debug2_L_T4_P", "Ship_Debug2_M_T4_P",  "Ship_Debug2_S_T4_P", },
}
 ]]

 
PreparedVesselsAll = 
{
	{ "Ship_Preset_R1_S_T1", "Ship_Preset_R1_M_T1",  "Ship_Preset_R1_L_T1", },
	{ "Ship_Preset_R1_S_T2", "Ship_Preset_R1_M_T2",  "Ship_Preset_R1_L_T2", },
	{ "Ship_Preset_R1_S_T3", "Ship_Preset_R1_M_T3",  "Ship_Preset_R1_L_T3", },
	{ "Ship_Preset_R1_S_T4", "Ship_Preset_R1_M_T4",  "Ship_Preset_R1_L_T4", },
	{ "Ship_Preset_R1_S_T5", "Ship_Preset_R1_M_T5",  "Ship_Preset_R1_L_T5", },
	{ "Ship_Preset_R1_S_T1_Faction1", "Ship_Preset_R1_M_T1_Faction1",  "Ship_Preset_R1_L_T1_Faction1", },
	{ "Ship_Preset_R1_S_T2_Faction1", "Ship_Preset_R1_M_T2_Faction1",  "Ship_Preset_R1_L_T2_Faction1", },
	{ "Ship_Preset_R1_S_T3_Faction1", "Ship_Preset_R1_M_T3_Faction1",  "Ship_Preset_R1_L_T3_Faction1", },
	{ "Ship_Preset_R1_S_T4_Faction1", "Ship_Preset_R1_M_T4_Faction1",  "Ship_Preset_R1_L_T4_Faction1", },
	{ "Ship_Preset_R1_S_T5_Faction1", "Ship_Preset_R1_M_T5_Faction1",  "Ship_Preset_R1_L_T5_Faction1", },
	{ "Ship_Preset_R1_S_T1_Faction2", "Ship_Preset_R1_M_T1_Faction2",  "Ship_Preset_R1_L_T1_Faction2", },
	{ "Ship_Preset_R1_S_T2_Faction2", "Ship_Preset_R1_M_T2_Faction2",  "Ship_Preset_R1_L_T2_Faction2", },
	{ "Ship_Preset_R1_S_T3_Faction2", "Ship_Preset_R1_M_T3_Faction2",  "Ship_Preset_R1_L_T3_Faction2", },
	{ "Ship_Preset_R1_S_T4_Faction2", "Ship_Preset_R1_M_T4_Faction2",  "Ship_Preset_R1_L_T4_Faction2", },
	{ "Ship_Preset_R1_S_T5_Faction2", "Ship_Preset_R1_M_T5_Faction2",  "Ship_Preset_R1_L_T5_Faction2", },
	{ "Ship_Preset_R1_S_T1_Premium", "Ship_Preset_R1_M_T1_Premium",  "Ship_Preset_R1_L_T1_Premium", },
	{ "Ship_Preset_R1_S_T2_Premium", "Ship_Preset_R1_M_T2_Premium",  "Ship_Preset_R1_L_T2_Premium", },
	{ "Ship_Preset_R1_S_T3_Premium", "Ship_Preset_R1_M_T3_Premium",  "Ship_Preset_R1_L_T3_Premium", },
	{ "Ship_Preset_R1_S_T4_Premium", "Ship_Preset_R1_M_T4_Premium",  "Ship_Preset_R1_L_T4_Premium", },
	
	{ "Ship_Preset_R3_S_T1", "Ship_Preset_R3_M_T1",  "Ship_Preset_R3_L_T1", },
	{ "Ship_Preset_R3_S_T2", "Ship_Preset_R3_M_T2",  "Ship_Preset_R3_L_T2", },
	{ "Ship_Preset_R3_S_T3", "Ship_Preset_R3_M_T3",  "Ship_Preset_R3_L_T3", },
	{ "Ship_Preset_R3_S_T4", "Ship_Preset_R3_M_T4",  "Ship_Preset_R3_L_T4", },
	{ "Ship_Preset_R3_S_T5", "Ship_Preset_R3_M_T5",  "Ship_Preset_R3_L_T5", },
	{ "Ship_Preset_R3_S_T1_Faction1", "Ship_Preset_R3_M_T1_Faction1",  "Ship_Preset_R3_L_T1_Faction1", },
	{ "Ship_Preset_R3_S_T2_Faction1", "Ship_Preset_R3_M_T2_Faction1",  "Ship_Preset_R3_L_T2_Faction1", },
	{ "Ship_Preset_R3_S_T3_Faction1", "Ship_Preset_R3_M_T3_Faction1",  "Ship_Preset_R3_L_T3_Faction1", },
	{ "Ship_Preset_R3_S_T4_Faction1", "Ship_Preset_R3_M_T4_Faction1",  "Ship_Preset_R3_L_T4_Faction1", },
	{ "Ship_Preset_R3_S_T5_Faction1", "Ship_Preset_R3_M_T5_Faction1",  "Ship_Preset_R3_L_T5_Faction1", },
	{ "Ship_Preset_R3_S_T1_Faction2", "Ship_Preset_R3_M_T1_Faction2",  "Ship_Preset_R3_L_T1_Faction2", },
	{ "Ship_Preset_R3_S_T2_Faction2", "Ship_Preset_R3_M_T2_Faction2",  "Ship_Preset_R3_L_T2_Faction2", },
	{ "Ship_Preset_R3_S_T3_Faction2", "Ship_Preset_R3_M_T3_Faction2",  "Ship_Preset_R3_L_T3_Faction2", },
	{ "Ship_Preset_R3_S_T4_Faction2", "Ship_Preset_R3_M_T4_Faction2",  "Ship_Preset_R3_L_T4_Faction2", },
	{ "Ship_Preset_R3_S_T5_Faction2", "Ship_Preset_R3_M_T5_Faction2",  "Ship_Preset_R3_L_T5_Faction2", },
	{ "Ship_Preset_R3_S_T1_Premium", "Ship_Preset_R3_M_T1_Premium",  "Ship_Preset_R3_L_T1_Premium", },
	{ "Ship_Preset_R3_S_T2_Premium", "Ship_Preset_R3_M_T2_Premium",  "Ship_Preset_R3_L_T2_Premium", },
	{ "Ship_Preset_R3_S_T3_Premium", "Ship_Preset_R3_M_T3_Premium",  "Ship_Preset_R3_L_T3_Premium", },
	{ "Ship_Preset_R3_S_T4_Premium", "Ship_Preset_R3_M_T4_Premium",  "Ship_Preset_R3_L_T4_Premium", },
	

	{ "Ship_Preset_R2_S_T1", "Ship_Preset_R2_M_T1",  "Ship_Preset_R2_L_T1", },
	{ "Ship_Preset_R2_S_T2", "Ship_Preset_R2_M_T2",  "Ship_Preset_R2_L_T2", },
	{ "Ship_Preset_R2_S_T3", "Ship_Preset_R2_M_T3",  "Ship_Preset_R2_L_T3", },
	{ "Ship_Preset_R2_S_T4", "Ship_Preset_R2_M_T4",  "Ship_Preset_R2_L_T4", },
	{ "Ship_Preset_R2_S_T5", "Ship_Preset_R2_M_T5",  "Ship_Preset_R2_L_T5", },
	{ "Ship_Preset_R2_S_T1_Faction1", "Ship_Preset_R2_M_T1_Faction1",  "Ship_Preset_R2_L_T1_Faction1", },
	{ "Ship_Preset_R2_S_T2_Faction1", "Ship_Preset_R2_M_T2_Faction1",  "Ship_Preset_R2_L_T2_Faction1", },
	{ "Ship_Preset_R2_S_T3_Faction1", "Ship_Preset_R2_M_T3_Faction1",  "Ship_Preset_R2_L_T3_Faction1", },
	{ "Ship_Preset_R2_S_T4_Faction1", "Ship_Preset_R2_M_T4_Faction1",  "Ship_Preset_R2_L_T4_Faction1", },
	{ "Ship_Preset_R2_S_T5_Faction1", "Ship_Preset_R2_M_T5_Faction1",  "Ship_Preset_R2_L_T5_Faction1", },
	{ "Ship_Preset_R2_S_T1_Faction2", "Ship_Preset_R2_M_T1_Faction2",  "Ship_Preset_R2_L_T1_Faction2", },
	{ "Ship_Preset_R2_S_T2_Faction2", "Ship_Preset_R2_M_T2_Faction2",  "Ship_Preset_R2_L_T2_Faction2", },
	{ "Ship_Preset_R2_S_T3_Faction2", "Ship_Preset_R2_M_T3_Faction2",  "Ship_Preset_R2_L_T3_Faction2", },
	{ "Ship_Preset_R2_S_T4_Faction2", "Ship_Preset_R2_M_T4_Faction2",  "Ship_Preset_R2_L_T4_Faction2", },
	{ "Ship_Preset_R2_S_T5_Faction2", "Ship_Preset_R2_M_T5_Faction2",  "Ship_Preset_R2_L_T5_Faction2", },
	{ "Ship_Preset_R2_S_T1_Premium", "Ship_Preset_R2_M_T1_Premium",  "Ship_Preset_R2_L_T1_Premium", },
	{ "Ship_Preset_R2_S_T2_Premium", "Ship_Preset_R2_M_T2_Premium",  "Ship_Preset_R2_L_T2_Premium", },
	{ "Ship_Preset_R2_S_T3_Premium", "Ship_Preset_R2_M_T3_Premium",  "Ship_Preset_R2_L_T3_Premium", },
	{ "Ship_Preset_R2_S_T4_Premium", "Ship_Preset_R2_M_T4_Premium",  "Ship_Preset_R2_L_T4_Premium", },
}


-- специальный preset для туториалов, которые запускается через MasterServerServices_LaunchSinglePlayerPractice()
TutorialPlayerVessels =
{
	{ "Tutorial_Ship", "Tutorial_Ship", "Tutorial_Ship", }, -- 1 Империя, 2 Федерация, 3 Иерихон
	--basic_battle_system = { "Ship_Tutorial2_Race1_M_T3_Faction2", }, старый корабль для 1ого этапа: Ship_Tutorial_Race1_M_T3_Faction2, старый корабль для 2ого этапа: Ship_Tutorial2_Race1_M_T3_Faction2
	--single_practice = { "Ship_Tutorial2_Race1_M_T3_Faction2", },
}

-- Open space vessels
OpenSpacePlayerVessels =
{
	{ "Ship_Race1_H_T5" },
}

PracticeBotVessels =
{
	{ "Ship_Medium_Practice_bot", "Ship_Large_Practice_bot", "Ship_Small_Practice_bot",  },
}

-- ВНИМАНИЕ! Эту таблицу нельзя переименовывать/убирать, т.к. cpp код использует ее в качестве дефолтного набора пресетов ботов. -- оставил тут только т1 корабли, и чутка оптимизировал % одинаковых, убрал премиальные фрегаты
PreparedVessels = 
{
	{ "Ship_PresetE_R1_S_T1", "Ship_PresetE_R1_M_T1",  "Ship_PresetE_R3_M_T1", },	-- убрал снайперов, ваншотят нубов
	{ "Ship_PresetE_R1_S_T1_Faction1", "Ship_PresetE_R1_M_T1_Faction1",  "Ship_PresetE_R1_M_T1", },
	{ "Ship_PresetE_R1_S_T1_Premium", "Ship_PresetE_R2_M_T1_Faction2",  "Ship_PresetE_R3_M_T1", },
	
	{ "Ship_PresetE_R3_S_T1", "Ship_PresetE_R3_M_T1",  "Ship_PresetE_R3_L_T1", },
	{ "Ship_PresetE_R1_S_T1", "Ship_PresetE_R3_M_T1_Faction1",  "Ship_PresetE_R3_L_T1_Faction1", },
	{ "Ship_PresetE_R3_S_T1", "Ship_PresetE_R3_M_T1_Premium",  "Ship_PresetE_R2_M_T1", },

	{ "Ship_PresetE_R2_S_T1", "Ship_PresetE_R2_M_T1",  "Ship_PresetE_R2_L_T1", },
	{ "Ship_PresetE_R2_S_T1", "Ship_PresetE_R2_M_T1_Faction1",  "Ship_PresetE_R2_M_T1", },
	{ "Ship_PresetE_R2_S_T1_Premium", "Ship_PresetE_R2_M_T1_Premium",  "Ship_PresetE_R1_M_T1", },
}

PreparedVesselsT1 = -- дозачистил от т2 кораблей, сменил на премы т1
{
	{ "Ship_Preset_R1_S_T1", "Ship_Preset_R1_M_T1",  "Ship_Preset_R1_L_T1", },
	{ "Ship_Preset_R1_S_T1_Faction1", "Ship_Preset_R1_M_T1_Faction1",  "Ship_Preset_R1_L_T1_Premium", },
	--{ "Ship_Preset_R1_S_T1_Faction2", "Ship_Preset_R1_M_T1_Faction2",  "Ship_Preset_R1_L_T1_Faction2", },
	--{ "Ship_Preset_R1_S_T1_Premium", "Ship_Preset_R1_M_T1_Premium",  "Ship_Preset_R1_L_T1_Premium", },
	
	{ "Ship_Preset_R3_S_T1", "Ship_Preset_R3_M_T1",  "Ship_Preset_R3_L_T1", },
	{ "Ship_Preset_R3_S_T1_Premium", "Ship_Preset_R3_M_T1_Faction1",  "Ship_Preset_R3_L_T1_Faction1", },
	--{ "Ship_Preset_R3_S_T1_Faction2", "Ship_Preset_R3_M_T1_Faction2",  "Ship_Preset_R3_L_T1_Faction2", },
	--{ "Ship_Preset_R3_S_T1_Premium", "Ship_Preset_R3_M_T1_Premium",  "Ship_Preset_R3_L_T1_Premium", },

	{ "Ship_Preset_R2_S_T1", "Ship_Preset_R2_M_T1",  "Ship_Preset_R2_L_T1", },
	{ "Ship_Preset_R2_S_T1_Premium", "Ship_Preset_R2_M_T1_Faction1",  "Ship_Preset_R2_L_T1_Premium", },
	--{ "Ship_Preset_R2_S_T1_Faction2", "Ship_Preset_R2_M_T1_Faction2",  "Ship_Preset_R2_L_T1_Faction2", },
	--{ "Ship_Preset_R2_S_T1_Premium", "Ship_Preset_R2_M_T1_Premium",  "Ship_Preset_R2_L_T1_Premium", },
}

PreparedVesselsT2 = 
{
	{ "Ship_Preset_R1_S_T2", "Ship_Preset_R1_M_T2",  "Ship_Preset_R1_L_T2", },
	{ "Ship_Preset_R1_S_T2_Faction1", "Ship_Preset_R1_M_T2_Faction1",  "Ship_Preset_R1_L_T2_Faction1", },
	{ "Ship_Preset_R1_S_T2_Faction2", "Ship_Preset_R1_M_T2_Faction2",  "Ship_Preset_R1_L_T2_Faction2", },
	{ "Ship_Preset_R1_S_T2_Premium", "Ship_Preset_R1_M_T2_Premium",  "Ship_Preset_R1_L_T2_Premium", },
	
	{ "Ship_Preset_R3_S_T2", "Ship_Preset_R3_M_T2",  "Ship_Preset_R3_L_T2", },
	{ "Ship_Preset_R3_S_T2_Faction1", "Ship_Preset_R3_M_T2_Faction1",  "Ship_Preset_R3_L_T2_Faction1", },
	{ "Ship_Preset_R3_S_T2_Faction2", "Ship_Preset_R3_M_T2_Faction2",  "Ship_Preset_R3_L_T2_Faction2", },
	{ "Ship_Preset_R3_S_T2_Premium", "Ship_Preset_R3_M_T2_Premium",  "Ship_Preset_R3_L_T2_Premium", },

	{ "Ship_Preset_R2_S_T2", "Ship_Preset_R2_M_T2",  "Ship_Preset_R2_L_T2", },
	{ "Ship_Preset_R2_S_T2_Faction1", "Ship_Preset_R2_M_T2_Faction1",  "Ship_Preset_R2_L_T2_Faction1", },
	{ "Ship_Preset_R2_S_T2_Faction2", "Ship_Preset_R2_M_T2_Faction2",  "Ship_Preset_R2_L_T2_Faction2", },
	{ "Ship_Preset_R2_S_T2_Premium", "Ship_Preset_R2_M_T2_Premium",  "Ship_Preset_R2_L_T2_Premium", },
}

PreparedVesselsT3 = -- список ИИ-ботов входящий в пресет BotsT3 нужной очереди матчмейкера table.insert (в конфиге). для A25FOR30_13
{
	{ "Ship_Preset_R1_S_T3", "Ship_Preset_R1_M_T3",  "Ship_Preset_R1_L_T3", },
	{ "Ship_Preset_R1_S_T3_Faction1", "Ship_Preset_R1_M_T3_Faction1",  "Ship_Preset_R1_L_T3_Faction1", },
	{ "Ship_Preset_R1_S_T3_Faction2", "Ship_Preset_R1_M_T3_Faction2",  "Ship_Preset_R1_L_T3_Faction2", },
	{ "Ship_Preset_R1_S_T3_Premium", "Ship_Preset_R1_M_T3_Premium",  "Ship_Preset_R1_L_T3_Premium", },
	
	{ "Ship_Preset_R3_S_T3", "Ship_Preset_R3_M_T3",  "Ship_Preset_R3_L_T3", },
	{ "Ship_Preset_R3_S_T3_Faction1", "Ship_Preset_R3_M_T3_Faction1",  "Ship_Preset_R3_L_T3_Faction1", },
	{ "Ship_Preset_R3_S_T3_Faction2", "Ship_Preset_R3_M_T3_Faction2",  "Ship_Preset_R3_L_T3_Faction2", },
	{ "Ship_Preset_R3_S_T3_Premium", "Ship_Preset_R3_M_T3_Premium",  "Ship_Preset_R3_L_T3_Premium", },

	{ "Ship_Preset_R2_S_T3", "Ship_Preset_R2_M_T3",  "Ship_Preset_R2_L_T3", },
	{ "Ship_Preset_R2_S_T3_Faction1", "Ship_Preset_R2_M_T3_Faction1",  "Ship_Preset_R2_L_T3_Faction1", },
	{ "Ship_Preset_R2_S_T3_Faction2", "Ship_Preset_R2_M_T3_Faction2",  "Ship_Preset_R2_L_T3_Faction2", },
	{ "Ship_Preset_R2_S_T3_Premium", "Ship_Preset_R2_M_T3_Premium",  "Ship_Preset_R2_L_T3_Premium", },
}

PreparedVesselsT4 = 
{
	{ "Ship_Preset_R1_S_T4", "Ship_Preset_R1_M_T4",  "Ship_Preset_R1_L_T4", },
	{ "Ship_Preset_R1_S_T4_Faction1", "Ship_Preset_R1_M_T4_Faction1",  "Ship_Preset_R1_L_T4_Faction1", },
	{ "Ship_Preset_R1_S_T4_Faction2", "Ship_Preset_R1_M_T4_Faction2",  "Ship_Preset_R1_L_T4_Faction2", },
	{ "Ship_Preset_R1_S_T4_Premium", "Ship_Preset_R1_M_T4_Premium",  "Ship_Preset_R1_L_T4_Premium", },
	
	{ "Ship_Preset_R3_S_T4", "Ship_Preset_R3_M_T4",  "Ship_Preset_R3_L_T4", },
	{ "Ship_Preset_R3_S_T4_Faction1", "Ship_Preset_R3_M_T4_Faction1",  "Ship_Preset_R3_L_T4_Faction1", },
	{ "Ship_Preset_R3_S_T4_Faction2", "Ship_Preset_R3_M_T4_Faction2",  "Ship_Preset_R3_L_T4_Faction2", },
	{ "Ship_Preset_R3_S_T4_Premium", "Ship_Preset_R3_M_T4_Premium",  "Ship_Preset_R3_L_T4_Premium", },

	{ "Ship_Preset_R2_S_T4", "Ship_Preset_R2_M_T4",  "Ship_Preset_R2_L_T4", },
	{ "Ship_Preset_R2_S_T4_Faction1", "Ship_Preset_R2_M_T4_Faction1",  "Ship_Preset_R2_L_T4_Faction1", },
	{ "Ship_Preset_R2_S_T4_Faction2", "Ship_Preset_R2_M_T4_Faction2",  "Ship_Preset_R2_L_T4_Faction2", },
	{ "Ship_Preset_R2_S_T4_Premium", "Ship_Preset_R2_M_T4_Premium",  "Ship_Preset_R2_L_T4_Premium", },
}

PreparedVesselsT5 = 
{
	{ "Ship_Preset_R1_S_T5", "Ship_Preset_R1_M_T5",  "Ship_Preset_R1_L_T5", },
	{ "Ship_Preset_R1_S_T5_Faction1", "Ship_Preset_R1_M_T5_Faction1",  "Ship_Preset_R1_L_T5_Faction1", },
	{ "Ship_Preset_R1_S_T5_Faction2", "Ship_Preset_R1_M_T5_Faction2",  "Ship_Preset_R1_L_T5_Faction2", },
	{ "Ship_Preset_R1_S_T5_Premium", "Ship_Preset_R1_M_T5_Premium",  "Ship_Preset_R1_L_T5_Premium", },
	
	{ "Ship_Preset_R3_S_T5", "Ship_Preset_R3_M_T5",  "Ship_Preset_R3_L_T5", },
	{ "Ship_Preset_R3_S_T5_Faction1", "Ship_Preset_R3_M_T5_Faction1",  "Ship_Preset_R3_L_T5_Faction1", },
	{ "Ship_Preset_R3_S_T5_Faction2", "Ship_Preset_R3_M_T5_Faction2",  "Ship_Preset_R3_L_T5_Faction2", },
	{ "Ship_Preset_R3_S_T5_Premium", "Ship_Preset_R3_M_T5_Premium",  "Ship_Preset_R3_L_T5_Premium", },

	{ "Ship_Preset_R2_S_T5", "Ship_Preset_R2_M_T5",  "Ship_Preset_R2_L_T5", },
	{ "Ship_Preset_R2_S_T5_Faction1", "Ship_Preset_R2_M_T5_Faction1",  "Ship_Preset_R2_L_T5_Faction1", },
	{ "Ship_Preset_R2_S_T5_Faction2", "Ship_Preset_R2_M_T5_Faction2",  "Ship_Preset_R2_L_T5_Faction2", },
	{ "Ship_Preset_R2_S_T5_Premium", "Ship_Preset_R2_M_T5_Premium",  "Ship_Preset_R2_L_T5_Premium", },
}

PreparedVesselsTX = 
{
	{ "Ship_Preset_R1_S_T5_Faction1", "Ship_Preset_R1_M_T5_Faction1",  "Ship_Preset_R1_L_T5_Faction1", },
	{ "Ship_Preset_R1_S_T5_Faction2", "Ship_Preset_R1_M_T5_Faction2",  "Ship_Preset_R1_L_T5_Faction2", },
	{ "Ship_Preset_R1_S_T5_Premium", "Ship_Preset_R1_M_T5_Premium",  "Ship_Preset_R1_L_T5_Premium", },
	
	{ "Ship_Preset_R3_S_T5_Faction1", "Ship_Preset_R3_M_T5_Faction1",  "Ship_Preset_R3_L_T5_Faction1", },
	{ "Ship_Preset_R3_S_T5_Faction2", "Ship_Preset_R3_M_T5_Faction2",  "Ship_Preset_R3_L_T5_Faction2", },
	{ "Ship_Preset_R3_S_T5_Premium", "Ship_Preset_R3_M_T5_Premium",  "Ship_Preset_R3_L_T5_Premium", },

	{ "Ship_Preset_R2_S_T5_Faction1", "Ship_Preset_R2_M_T5_Faction1",  "Ship_Preset_R2_L_T5_Faction1", },
	{ "Ship_Preset_R2_S_T5_Faction2", "Ship_Preset_R2_M_T5_Faction2",  "Ship_Preset_R2_L_T5_Faction2", },
	{ "Ship_Preset_R2_S_T5_Premium", "Ship_Preset_R2_M_T5_Premium",  "Ship_Preset_R2_L_T5_Premium", },
}

PreparedVesselsT23 = 
{
	{ "Ship_Preset_R1_S_T2", "Ship_Preset_R1_M_T2",  "Ship_Preset_R1_L_T2", },
	{ "Ship_Preset_R1_S_T2_Faction1", "Ship_Preset_R1_M_T2_Faction1",  "Ship_Preset_R1_L_T2_Faction1", },
	{ "Ship_Preset_R1_S_T2_Faction2", "Ship_Preset_R1_M_T2_Faction2",  "Ship_Preset_R1_L_T2_Faction2", },
	{ "Ship_Preset_R1_S_T2_Premium", "Ship_Preset_R1_M_T2_Premium",  "Ship_Preset_R1_L_T2_Premium", },
	
	{ "Ship_Preset_R3_S_T2", "Ship_Preset_R3_M_T2",  "Ship_Preset_R3_L_T2", },
	{ "Ship_Preset_R3_S_T2_Faction1", "Ship_Preset_R3_M_T2_Faction1",  "Ship_Preset_R3_L_T2_Faction1", },
	{ "Ship_Preset_R3_S_T2_Faction2", "Ship_Preset_R3_M_T2_Faction2",  "Ship_Preset_R3_L_T2_Faction2", },
	{ "Ship_Preset_R3_S_T2_Premium", "Ship_Preset_R3_M_T2_Premium",  "Ship_Preset_R3_L_T2_Premium", },

	{ "Ship_Preset_R2_S_T2", "Ship_Preset_R2_M_T2",  "Ship_Preset_R2_L_T2", },
	{ "Ship_Preset_R2_S_T2_Faction1", "Ship_Preset_R2_M_T2_Faction1",  "Ship_Preset_R2_L_T2_Faction1", },
	{ "Ship_Preset_R2_S_T2_Faction2", "Ship_Preset_R2_M_T2_Faction2",  "Ship_Preset_R2_L_T2_Faction2", },
	{ "Ship_Preset_R2_S_T2_Premium", "Ship_Preset_R2_M_T2_Premium",  "Ship_Preset_R2_L_T2_Premium", },

	{ "Ship_Preset_R1_S_T3", "Ship_Preset_R1_M_T3",  "Ship_Preset_R1_L_T3", },
	{ "Ship_Preset_R1_S_T3_Faction1", "Ship_Preset_R1_M_T3_Faction1",  "Ship_Preset_R1_L_T3_Faction1", },
	{ "Ship_Preset_R1_S_T3_Faction2", "Ship_Preset_R1_M_T3_Faction2",  "Ship_Preset_R1_L_T3_Faction2", },
	{ "Ship_Preset_R1_S_T3_Premium", "Ship_Preset_R1_M_T3_Premium",  "Ship_Preset_R1_L_T3_Premium", },
	
	{ "Ship_Preset_R3_S_T3", "Ship_Preset_R3_M_T3",  "Ship_Preset_R3_L_T3", },
	{ "Ship_Preset_R3_S_T3_Faction1", "Ship_Preset_R3_M_T3_Faction1",  "Ship_Preset_R3_L_T3_Faction1", },
	{ "Ship_Preset_R3_S_T3_Faction2", "Ship_Preset_R3_M_T3_Faction2",  "Ship_Preset_R3_L_T3_Faction2", },
	{ "Ship_Preset_R3_S_T3_Premium", "Ship_Preset_R3_M_T3_Premium",  "Ship_Preset_R3_L_T3_Premium", },

	{ "Ship_Preset_R2_S_T3", "Ship_Preset_R2_M_T3",  "Ship_Preset_R2_L_T3", },
	{ "Ship_Preset_R2_S_T3_Faction1", "Ship_Preset_R2_M_T3_Faction1",  "Ship_Preset_R2_L_T3_Faction1", },
	{ "Ship_Preset_R2_S_T3_Faction2", "Ship_Preset_R2_M_T3_Faction2",  "Ship_Preset_R2_L_T3_Faction2", },
	{ "Ship_Preset_R2_S_T3_Premium", "Ship_Preset_R2_M_T3_Premium",  "Ship_Preset_R2_L_T3_Premium", },
}

PreparedVesselsT45 = 
{
	{ "Ship_Preset_R1_S_T4", "Ship_Preset_R1_M_T4",  "Ship_Preset_R1_L_T4", },
	{ "Ship_Preset_R1_S_T4_Faction1", "Ship_Preset_R1_M_T4_Faction1",  "Ship_Preset_R1_L_T4_Faction1", },
	{ "Ship_Preset_R1_S_T4_Faction2", "Ship_Preset_R1_M_T4_Faction2",  "Ship_Preset_R1_L_T4_Faction2", },
	{ "Ship_Preset_R1_S_T4_Premium", "Ship_Preset_R1_M_T4_Premium",  "Ship_Preset_R1_L_T4_Premium", },
	
	{ "Ship_Preset_R3_S_T4", "Ship_Preset_R3_M_T4",  "Ship_Preset_R3_L_T4", },
	{ "Ship_Preset_R3_S_T4_Faction1", "Ship_Preset_R3_M_T4_Faction1",  "Ship_Preset_R3_L_T4_Faction1", },
	{ "Ship_Preset_R3_S_T4_Faction2", "Ship_Preset_R3_M_T4_Faction2",  "Ship_Preset_R3_L_T4_Faction2", },
	{ "Ship_Preset_R3_S_T4_Premium", "Ship_Preset_R3_M_T4_Premium",  "Ship_Preset_R3_L_T4_Premium", },

	{ "Ship_Preset_R2_S_T4", "Ship_Preset_R2_M_T4",  "Ship_Preset_R2_L_T4", },
	{ "Ship_Preset_R2_S_T4_Faction1", "Ship_Preset_R2_M_T4_Faction1",  "Ship_Preset_R2_L_T4_Faction1", },
	{ "Ship_Preset_R2_S_T4_Faction2", "Ship_Preset_R2_M_T4_Faction2",  "Ship_Preset_R2_L_T4_Faction2", },
	{ "Ship_Preset_R2_S_T4_Premium", "Ship_Preset_R2_M_T4_Premium",  "Ship_Preset_R2_L_T4_Premium", },

	{ "Ship_Preset_R1_S_T5", "Ship_Preset_R1_M_T5",  "Ship_Preset_R1_L_T5", },
	{ "Ship_Preset_R1_S_T5_Faction1", "Ship_Preset_R1_M_T5_Faction1",  "Ship_Preset_R1_L_T5_Faction1", },
	{ "Ship_Preset_R1_S_T5_Faction2", "Ship_Preset_R1_M_T5_Faction2",  "Ship_Preset_R1_L_T5_Faction2", },
	{ "Ship_Preset_R1_S_T5_Premium", "Ship_Preset_R1_M_T5_Premium",  "Ship_Preset_R1_L_T5_Premium", },
	
	{ "Ship_Preset_R3_S_T5", "Ship_Preset_R3_M_T5",  "Ship_Preset_R3_L_T5", },
	{ "Ship_Preset_R3_S_T5_Faction1", "Ship_Preset_R3_M_T5_Faction1",  "Ship_Preset_R3_L_T5_Faction1", },
	{ "Ship_Preset_R3_S_T5_Faction2", "Ship_Preset_R3_M_T5_Faction2",  "Ship_Preset_R3_L_T5_Faction2", },
	{ "Ship_Preset_R3_S_T5_Premium", "Ship_Preset_R3_M_T5_Premium",  "Ship_Preset_R3_L_T5_Premium", },

	{ "Ship_Preset_R2_S_T5", "Ship_Preset_R2_M_T5",  "Ship_Preset_R2_L_T5", },
	{ "Ship_Preset_R2_S_T5_Faction1", "Ship_Preset_R2_M_T5_Faction1",  "Ship_Preset_R2_L_T5_Faction1", },
	{ "Ship_Preset_R2_S_T5_Faction2", "Ship_Preset_R2_M_T5_Faction2",  "Ship_Preset_R2_L_T5_Faction2", },
	{ "Ship_Preset_R2_S_T5_Premium", "Ship_Preset_R2_M_T5_Premium",  "Ship_Preset_R2_L_T5_Premium", },
}

PreparedVesselsT1E = 
{
	{ "Ship_PresetE_R1_S_T1", "Ship_PresetE_R1_M_T1",  "Ship_PresetE_R1_L_T1", },
	{ "Ship_PresetE_R1_S_T1_Faction1", "Ship_PresetE_R1_M_T1_Faction1",  "Ship_PresetE_R1_L_T1_Faction1", },
	{ "Ship_PresetE_R1_S_T1_Faction2", "Ship_PresetE_R1_M_T1_Faction2",  "Ship_PresetE_R1_L_T1_Faction2", },
	{ "Ship_PresetE_R1_S_T1_Premium", "Ship_PresetE_R1_M_T1_Premium",  "Ship_PresetE_R1_L_T1_Premium", },
	
	{ "Ship_PresetE_R3_S_T1", "Ship_PresetE_R3_M_T1",  "Ship_PresetE_R3_L_T1", },
	{ "Ship_PresetE_R3_S_T1_Faction1", "Ship_PresetE_R3_M_T1_Faction1",  "Ship_PresetE_R3_L_T1_Faction1", },
	{ "Ship_PresetE_R3_S_T1_Faction2", "Ship_PresetE_R3_M_T1_Faction2",  "Ship_PresetE_R3_L_T1_Faction2", },
	{ "Ship_PresetE_R3_S_T1_Premium", "Ship_PresetE_R3_M_T1_Premium",  "Ship_PresetE_R3_L_T1_Premium", },

	{ "Ship_PresetE_R2_S_T1", "Ship_PresetE_R2_M_T1",  "Ship_PresetE_R2_L_T1", },
	{ "Ship_PresetE_R2_S_T1_Faction1", "Ship_PresetE_R2_M_T1_Faction1",  "Ship_PresetE_R2_L_T1_Faction1", },
	{ "Ship_PresetE_R2_S_T1_Faction2", "Ship_PresetE_R2_M_T1_Faction2",  "Ship_PresetE_R2_L_T1_Faction2", },
	{ "Ship_PresetE_R2_S_T1_Premium", "Ship_PresetE_R2_M_T1_Premium",  "Ship_PresetE_R3_L_T1_Premium", },
}

PreparedVessels_PVE1 = 
{
	{ "Ship_PresetE_R1_L_T1_Faction1", "Ship_PresetE_R1_M_T1_Faction2",  "Ship_PresetE_R1_L_T1_Faction2", },
	{ "Ship_PresetE_R1_S_T1_Premium", "Ship_PresetE_R1_M_T1_Premium",  "Ship_PresetE_R1_L_T1_Premium", },
	
	{ "Ship_PresetE_R3_L_T1_Faction1", "Ship_PresetE_R3_M_T1_Faction2",  "Ship_PresetE_R3_L_T1_Faction2", },
	{ "Ship_PresetE_R3_S_T1_Premium", "Ship_PresetE_R3_M_T1_Premium",  "Ship_PresetE_R3_L_T1_Premium", },

	{ "Ship_PresetE_R2_L_T1_Faction1", "Ship_PresetE_R2_M_T1_Faction2",  "Ship_PresetE_R2_L_T1_Faction2", },
	{ "Ship_PresetE_R2_S_T1_Premium", "Ship_PresetE_R2_M_T1_Premium",  "Ship_PresetE_R1_L_T1_Premium", },
}

PreparedVessels_PVE23 = 
{
	{ "Ship_Race1_H_T3_5low", "Ship_Race2_H_T3_5low", "Ship_Race3_H_T3_5low", },

	{ "Ship_PresetE_R1_L_T2_Faction1", "Ship_PresetE_R1_M_T2_Faction2",  "Ship_PresetE_R1_L_T2_Faction2", },
	{ "Ship_PresetE_R1_S_T2_Premium", "Ship_PresetE_R1_M_T2_Premium",  "Ship_PresetE_R1_L_T2_Premium", },
	
	{ "Ship_PresetE_R3_L_T2_Faction1", "Ship_PresetE_R3_M_T2_Faction2",  "Ship_PresetE_R3_L_T2_Faction2", },
	{ "Ship_PresetE_R3_S_T2_Premium", "Ship_PresetE_R3_M_T2_Premium",  "Ship_PresetE_R3_L_T2_Premium", },

	{ "Ship_PresetE_R2_L_T2_Faction1", "Ship_PresetE_R2_M_T2_Faction2",  "Ship_PresetE_R2_L_T2_Faction2", },
	{ "Ship_PresetE_R2_S_T2_Premium", "Ship_PresetE_R2_M_T2_Premium",  "Ship_PresetE_R2_L_T2_Premium", },

	{ "Ship_PresetE_R1_L_T3_Faction1", "Ship_PresetE_R1_M_T3_Faction2",  "Ship_PresetE_R1_L_T3_Faction2", },
	{ "Ship_PresetE_R1_S_T3_Premium", "Ship_PresetE_R1_M_T3_Premium",  "Ship_PresetE_R1_L_T3_Premium", },
	
	{ "Ship_PresetE_R3_L_T3_Faction1", "Ship_PresetE_R3_M_T3_Faction2",  "Ship_PresetE_R3_L_T3_Faction2", },
	{ "Ship_PresetE_R3_S_T3_Premium", "Ship_PresetE_R3_M_T3_Premium",  "Ship_PresetE_R3_L_T3_Premium", },

	{ "Ship_PresetE_R2_L_T3_Faction1", "Ship_PresetE_R2_M_T3_Faction2",  "Ship_PresetE_R2_L_T3_Faction2", },
	{ "Ship_PresetE_R2_S_T3_Premium", "Ship_PresetE_R2_M_T3_Premium",  "Ship_PresetE_R2_L_T3_Premium", },
}

PreparedVessels_PVE45 = 
{
	{ "Ship_Race1_H_T3_5", "Ship_Race2_H_T3_5", "Ship_Race3_H_T3_5", },

	{ "Ship_PresetE_R1_L_T4_Faction1", "Ship_PresetE_R1_M_T4_Faction2",  "Ship_PresetE_R1_L_T4_Faction2", },
	{ "Ship_PresetE_R1_S_T4_Premium", "Ship_PresetE_R1_M_T4_Premium",  "Ship_PresetE_R1_L_T4_Premium", },
	
	{ "Ship_PresetE_R3_L_T4_Faction1", "Ship_PresetE_R3_M_T4_Faction2",  "Ship_PresetE_R3_L_T4_Faction2", },
	{ "Ship_PresetE_R3_S_T4_Premium", "Ship_PresetE_R3_M_T4_Premium",  "Ship_PresetE_R3_L_T4_Premium", },

	{ "Ship_PresetE_R2_L_T4_Faction1", "Ship_PresetE_R2_M_T4_Faction2",  "Ship_PresetE_R2_L_T4_Faction2", },
	{ "Ship_PresetE_R2_S_T4_Premium", "Ship_PresetE_R2_M_T4_Premium",  "Ship_PresetE_R2_L_T4_Premium", },

	{ "Ship_Race1_H_T4_5", "Ship_Race2_H_T4_5", "Ship_Race3_H_T4_5", },

	{ "Ship_PresetE_R1_L_T5_Faction1", "Ship_PresetE_R1_M_T5_Faction2",  "Ship_PresetE_R1_L_T5_Faction2", },
	{ "Ship_PresetE_R1_S_T5_Premium", "Ship_PresetE_R1_M_T5_Premium",  "Ship_PresetE_R1_L_T5_Premium", },
	
	{ "Ship_PresetE_R3_L_T5_Faction1", "Ship_PresetE_R3_M_T5_Faction2",  "Ship_PresetE_R3_L_T5_Faction2", },
	{ "Ship_PresetE_R3_S_T5_Premium", "Ship_PresetE_R3_M_T5_Premium",  "Ship_PresetE_R3_L_T5_Premium", },

	{ "Ship_PresetE_R2_L_T5_Faction1", "Ship_PresetE_R2_M_T5_Faction2",  "Ship_PresetE_R2_L_T5_Faction2", },
	{ "Ship_PresetE_R2_S_T5_Premium", "Ship_PresetE_R2_M_T5_Premium",  "Ship_PresetE_R2_L_T5_Premium", },
}

PreparedVesselsT2E = 
{
	{ "Ship_PresetE_R1_S_T2", "Ship_PresetE_R1_M_T2",  "Ship_PresetE_R1_L_T2", },
	{ "Ship_PresetE_R1_S_T2_Faction1", "Ship_PresetE_R1_M_T2_Faction1",  "Ship_PresetE_R1_L_T2_Faction1", },
	{ "Ship_PresetE_R1_S_T2_Faction2", "Ship_PresetE_R1_M_T2_Faction2",  "Ship_PresetE_R1_L_T2_Faction2", },
	{ "Ship_PresetE_R1_S_T2_Premium", "Ship_PresetE_R1_M_T2_Premium",  "Ship_PresetE_R1_L_T2_Premium", },
	
	{ "Ship_PresetE_R3_S_T2", "Ship_PresetE_R3_M_T2",  "Ship_PresetE_R3_L_T2", },
	{ "Ship_PresetE_R3_S_T2_Faction1", "Ship_PresetE_R3_M_T2_Faction1",  "Ship_PresetE_R3_L_T2_Faction1", },
	{ "Ship_PresetE_R3_S_T2_Faction2", "Ship_PresetE_R3_M_T2_Faction2",  "Ship_PresetE_R3_L_T2_Faction2", },
	{ "Ship_PresetE_R3_S_T2_Premium", "Ship_PresetE_R3_M_T2_Premium",  "Ship_PresetE_R3_L_T2_Premium", },

	{ "Ship_PresetE_R2_S_T2", "Ship_PresetE_R2_M_T2",  "Ship_PresetE_R2_L_T2", },
	{ "Ship_PresetE_R2_S_T2_Faction1", "Ship_PresetE_R2_M_T2_Faction1",  "Ship_PresetE_R2_L_T2_Faction1", },
	{ "Ship_PresetE_R2_S_T2_Faction2", "Ship_PresetE_R2_M_T2_Faction2",  "Ship_PresetE_R2_L_T2_Faction2", },
	{ "Ship_PresetE_R2_S_T2_Premium", "Ship_PresetE_R2_M_T2_Premium",  "Ship_PresetE_R2_L_T2_Premium", },
}

PreparedVesselsT2EE = 
{
	{ "Ship_Race1_H_T3_5low", "Ship_Race2_H_T3_5low", "Ship_Race3_H_T3_5low", },

	{ "Ship_PresetE_R1_S_T2", "Ship_PresetE_R1_M_T2",  "Ship_PresetE_R1_L_T2", },
	{ "Ship_PresetE_R1_S_T2_Faction1", "Ship_PresetE_R1_M_T2_Faction1",  "Ship_PresetE_R1_L_T2_Faction1", },
	{ "Ship_PresetE_R1_S_T2_Faction2", "Ship_PresetE_R1_M_T2_Faction2",  "Ship_PresetE_R1_L_T2_Faction2", },
	{ "Ship_PresetE_R1_S_T2_Premium", "Ship_PresetE_R1_M_T2_Premium",  "Ship_PresetE_R1_L_T2_Premium", },
	
	{ "Ship_PresetE_R3_S_T2", "Ship_PresetE_R3_M_T2",  "Ship_PresetE_R3_L_T2", },
	{ "Ship_PresetE_R3_S_T2_Faction1", "Ship_PresetE_R3_M_T2_Faction1",  "Ship_PresetE_R3_L_T2_Faction1", },
	{ "Ship_PresetE_R3_S_T2_Faction2", "Ship_PresetE_R3_M_T2_Faction2",  "Ship_PresetE_R3_L_T2_Faction2", },
	{ "Ship_PresetE_R3_S_T2_Premium", "Ship_PresetE_R3_M_T2_Premium",  "Ship_PresetE_R3_L_T2_Premium", },

	{ "Ship_PresetE_R2_S_T2", "Ship_PresetE_R2_M_T2",  "Ship_PresetE_R2_L_T2", },
	{ "Ship_PresetE_R2_S_T2_Faction1", "Ship_PresetE_R2_M_T2_Faction1",  "Ship_PresetE_R2_L_T2_Faction1", },
	{ "Ship_PresetE_R2_S_T2_Faction2", "Ship_PresetE_R2_M_T2_Faction2",  "Ship_PresetE_R2_L_T2_Faction2", },
	{ "Ship_PresetE_R2_S_T2_Premium", "Ship_PresetE_R2_M_T2_Premium",  "Ship_PresetE_R2_L_T2_Premium", },
}

PreparedVesselsT3E = 
{
	{ "Ship_Race1_H_T3_5low", "Ship_Race2_H_T3_5low", "Ship_Race3_H_T3_5low", },

	{ "Ship_PresetE_R1_S_T3_Faction1", "Ship_PresetE_R1_M_T3_Faction1",  "Ship_PresetE_R1_L_T3_Faction1", },
	{ "Ship_PresetE_R1_S_T3_Faction2", "Ship_PresetE_R1_M_T3_Faction2",  "Ship_PresetE_R1_L_T3_Faction2", },
	{ "Ship_PresetE_R1_S_T3_Premium", "Ship_PresetE_R1_M_T3_Premium",  "Ship_PresetE_R1_L_T3_Premium", },
	
	{ "Ship_PresetE_R3_S_T3_Faction1", "Ship_PresetE_R3_M_T3_Faction1",  "Ship_PresetE_R3_L_T3_Faction1", },
	{ "Ship_PresetE_R3_S_T3_Faction2", "Ship_PresetE_R3_M_T3_Faction2",  "Ship_PresetE_R3_L_T3_Faction2", },
	{ "Ship_PresetE_R3_S_T3_Premium", "Ship_PresetE_R3_M_T3_Premium",  "Ship_PresetE_R3_L_T3_Premium", },

	{ "Ship_PresetE_R2_S_T3_Faction1", "Ship_PresetE_R2_M_T3_Faction1",  "Ship_PresetE_R2_L_T3_Faction1", },
	{ "Ship_PresetE_R2_S_T3_Faction2", "Ship_PresetE_R2_M_T3_Faction2",  "Ship_PresetE_R2_L_T3_Faction2", },
	{ "Ship_PresetE_R2_S_T3_Premium", "Ship_PresetE_R2_M_T3_Premium",  "Ship_PresetE_R2_L_T3_Premium", },
}

PreparedVesselsT3EG = 
{
	{ "Ship_Race5_S_SCOUT_Rank9_5", "Ship_Race5_M_ATTACK_Rank9_5", "Ship_Race5_L_ENGINEER_Rank9_5" },

	{ "Ship_PresetE_R1_S_T3_Faction1", "Ship_PresetE_R1_M_T3_Faction1",  "Ship_PresetE_R1_L_T3_Faction1", },
	{ "Ship_PresetE_R1_S_T3_Faction2", "Ship_PresetE_R1_M_T3_Faction2",  "Ship_PresetE_R1_L_T3_Faction2", },
	{ "Ship_PresetE_R1_S_T3_Premium", "Ship_PresetE_R1_M_T3_Premium",  "Ship_PresetE_R1_L_T3_Premium", },
	
	{ "Ship_PresetE_R3_S_T3_Faction1", "Ship_PresetE_R3_M_T3_Faction1",  "Ship_PresetE_R3_L_T3_Faction1", },
	{ "Ship_PresetE_R3_S_T3_Faction2", "Ship_PresetE_R3_M_T3_Faction2",  "Ship_PresetE_R3_L_T3_Faction2", },
	{ "Ship_PresetE_R3_S_T3_Premium", "Ship_PresetE_R3_M_T3_Premium",  "Ship_PresetE_R3_L_T3_Premium", },

	{ "Ship_PresetE_R2_S_T3_Faction1", "Ship_PresetE_R2_M_T3_Faction1",  "Ship_PresetE_R2_L_T3_Faction1", },
	{ "Ship_PresetE_R2_S_T3_Faction2", "Ship_PresetE_R2_M_T3_Faction2",  "Ship_PresetE_R2_L_T3_Faction2", },
	{ "Ship_PresetE_R2_S_T3_Premium", "Ship_PresetE_R2_M_T3_Premium",  "Ship_PresetE_R2_L_T3_Premium", },
}

PreparedVesselsT4E = -- список ИИ-ботов входящий в пресет BotsT4E нужной очереди матчмейкера table.insert (в конфиге). для A25FOR30_13
{
	{ "Ship_Race1_H_T3_5", "Ship_Race2_H_T3_5", "Ship_Race3_H_T3_5", },
	{ "Ship_Race1_H_T3_5", "Ship_Race2_H_T3_5", "Ship_Race3_H_T3_5", },

	{ "Ship_PresetE_R1_S_T4", "Ship_PresetE_R1_M_T4",  "Ship_PresetE_R1_L_T4", },
	{ "Ship_PresetE_R1_S_T4_Faction1", "Ship_PresetE_R1_M_T4_Faction1",  "Ship_PresetE_R1_L_T4_Faction1", },
	{ "Ship_PresetE_R1_S_T4_Faction2", "Ship_PresetE_R1_M_T4_Faction2",  "Ship_PresetE_R1_L_T4_Faction2", },
	{ "Ship_PresetE_R1_S_T4_Premium", "Ship_PresetE_R1_M_T4_Premium",  "Ship_PresetE_R1_L_T4_Premium", },
	
	{ "Ship_PresetE_R3_S_T4", "Ship_PresetE_R3_M_T4",  "Ship_PresetE_R3_L_T4", },
	{ "Ship_PresetE_R3_S_T4_Faction1", "Ship_PresetE_R3_M_T4_Faction1",  "Ship_PresetE_R3_L_T4_Faction1", },
	{ "Ship_PresetE_R3_S_T4_Faction2", "Ship_PresetE_R3_M_T4_Faction2",  "Ship_PresetE_R3_L_T4_Faction2", },
	{ "Ship_PresetE_R3_S_T4_Premium", "Ship_PresetE_R3_M_T4_Premium",  "Ship_PresetE_R3_L_T4_Premium", },

	{ "Ship_PresetE_R2_S_T4", "Ship_PresetE_R2_M_T4",  "Ship_PresetE_R2_L_T4", },
	{ "Ship_PresetE_R2_S_T4_Faction1", "Ship_PresetE_R2_M_T4_Faction1",  "Ship_PresetE_R2_L_T4_Faction1", },
	{ "Ship_PresetE_R2_S_T4_Faction2", "Ship_PresetE_R2_M_T4_Faction2",  "Ship_PresetE_R2_L_T4_Faction2", },
	{ "Ship_PresetE_R2_S_T4_Premium", "Ship_PresetE_R2_M_T4_Premium",  "Ship_PresetE_R2_L_T4_Premium", },
}

PreparedVesselsT4EG = 
{
	{ "Ship_Race5_S_SCOUT_Rank12_5", "Ship_Race5_M_ATTACK_Rank12_5", "Ship_Race5_L_ENGINEER_Rank12_5" },
	{ "Ship_Race5_S_SCOUT_Rank12_5", "Ship_Race5_M_ATTACK_Rank12_5", "Ship_Race5_L_ENGINEER_Rank12_5" },

	{ "Ship_PresetE_R1_S_T4", "Ship_PresetE_R1_M_T4",  "Ship_PresetE_R1_L_T4", },
	{ "Ship_PresetE_R1_S_T4_Faction1", "Ship_PresetE_R1_M_T4_Faction1",  "Ship_PresetE_R1_L_T4_Faction1", },
	{ "Ship_PresetE_R1_S_T4_Faction2", "Ship_PresetE_R1_M_T4_Faction2",  "Ship_PresetE_R1_L_T4_Faction2", },
	{ "Ship_PresetE_R1_S_T4_Premium", "Ship_PresetE_R1_M_T4_Premium",  "Ship_PresetE_R1_L_T4_Premium", },
	
	{ "Ship_PresetE_R3_S_T4", "Ship_PresetE_R3_M_T4",  "Ship_PresetE_R3_L_T4", },
	{ "Ship_PresetE_R3_S_T4_Faction1", "Ship_PresetE_R3_M_T4_Faction1",  "Ship_PresetE_R3_L_T4_Faction1", },
	{ "Ship_PresetE_R3_S_T4_Faction2", "Ship_PresetE_R3_M_T4_Faction2",  "Ship_PresetE_R3_L_T4_Faction2", },
	{ "Ship_PresetE_R3_S_T4_Premium", "Ship_PresetE_R3_M_T4_Premium",  "Ship_PresetE_R3_L_T4_Premium", },

	{ "Ship_PresetE_R2_S_T4", "Ship_PresetE_R2_M_T4",  "Ship_PresetE_R2_L_T4", },
	{ "Ship_PresetE_R2_S_T4_Faction1", "Ship_PresetE_R2_M_T4_Faction1",  "Ship_PresetE_R2_L_T4_Faction1", },
	{ "Ship_PresetE_R2_S_T4_Faction2", "Ship_PresetE_R2_M_T4_Faction2",  "Ship_PresetE_R2_L_T4_Faction2", },
	{ "Ship_PresetE_R2_S_T4_Premium", "Ship_PresetE_R2_M_T4_Premium",  "Ship_PresetE_R2_L_T4_Premium", },
}

PreparedVesselsT5E = 
{
	{ "Ship_Race1_H_T4_5", "Ship_Race2_H_T4_5", "Ship_Race3_H_T4_5", },
	{ "Ship_Race1_H_T4_5", "Ship_Race2_H_T4_5", "Ship_Race3_H_T4_5", },

	{ "Ship_PresetE_R1_S_T5", "Ship_PresetE_R1_M_T5",  "Ship_PresetE_R1_L_T5", },
	{ "Ship_PresetE_R1_S_T5_Faction1", "Ship_PresetE_R1_M_T5_Faction1",  "Ship_PresetE_R1_L_T5_Faction1", },
	{ "Ship_PresetE_R1_S_T5_Faction2", "Ship_PresetE_R1_M_T5_Faction2",  "Ship_PresetE_R1_L_T5_Faction2", },
	{ "Ship_PresetE_R1_S_T5_Premium", "Ship_PresetE_R1_M_T5_Premium",  "Ship_PresetE_R1_L_T5_Premium", },
	
	{ "Ship_PresetE_R3_S_T5", "Ship_PresetE_R3_M_T5",  "Ship_PresetE_R3_L_T5", },
	{ "Ship_PresetE_R3_S_T5_Faction1", "Ship_PresetE_R3_M_T5_Faction1",  "Ship_PresetE_R3_L_T5_Faction1", },
	{ "Ship_PresetE_R3_S_T5_Faction2", "Ship_PresetE_R3_M_T5_Faction2",  "Ship_PresetE_R3_L_T5_Faction2", },
	{ "Ship_PresetE_R3_S_T5_Premium", "Ship_PresetE_R3_M_T5_Premium",  "Ship_PresetE_R3_L_T5_Premium", },

	{ "Ship_PresetE_R2_S_T5", "Ship_PresetE_R2_M_T5",  "Ship_PresetE_R2_L_T5", },
	{ "Ship_PresetE_R2_S_T5_Faction1", "Ship_PresetE_R2_M_T5_Faction1",  "Ship_PresetE_R2_L_T5_Faction1", },
	{ "Ship_PresetE_R2_S_T5_Faction2", "Ship_PresetE_R2_M_T5_Faction2",  "Ship_PresetE_R2_L_T5_Faction2", },
	{ "Ship_PresetE_R2_S_T5_Premium", "Ship_PresetE_R2_M_T5_Premium",  "Ship_PresetE_R2_L_T5_Premium", },
}

PreparedVesselsT5EG = 
{
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },

	{ "Ship_PresetE_R1_S_T5", "Ship_PresetE_R1_M_T5",  "Ship_PresetE_R1_L_T5", },
	{ "Ship_PresetE_R1_S_T5_Faction1", "Ship_PresetE_R1_M_T5_Faction1",  "Ship_PresetE_R1_L_T5_Faction1", },
	{ "Ship_PresetE_R1_S_T5_Faction2", "Ship_PresetE_R1_M_T5_Faction2",  "Ship_PresetE_R1_L_T5_Faction2", },
	{ "Ship_PresetE_R1_S_T5_Premium", "Ship_PresetE_R1_M_T5_Premium",  "Ship_PresetE_R1_L_T5_Premium", },
	
	{ "Ship_PresetE_R3_S_T5", "Ship_PresetE_R3_M_T5",  "Ship_PresetE_R3_L_T5", },
	{ "Ship_PresetE_R3_S_T5_Faction1", "Ship_PresetE_R3_M_T5_Faction1",  "Ship_PresetE_R3_L_T5_Faction1", },
	{ "Ship_PresetE_R3_S_T5_Faction2", "Ship_PresetE_R3_M_T5_Faction2",  "Ship_PresetE_R3_L_T5_Faction2", },
	{ "Ship_PresetE_R3_S_T5_Premium", "Ship_PresetE_R3_M_T5_Premium",  "Ship_PresetE_R3_L_T5_Premium", },

	{ "Ship_PresetE_R2_S_T5", "Ship_PresetE_R2_M_T5",  "Ship_PresetE_R2_L_T5", },
	{ "Ship_PresetE_R2_S_T5_Faction1", "Ship_PresetE_R2_M_T5_Faction1",  "Ship_PresetE_R2_L_T5_Faction1", },
	{ "Ship_PresetE_R2_S_T5_Faction2", "Ship_PresetE_R2_M_T5_Faction2",  "Ship_PresetE_R2_L_T5_Faction2", },
	{ "Ship_PresetE_R2_S_T5_Premium", "Ship_PresetE_R2_M_T5_Premium",  "Ship_PresetE_R2_L_T5_Premium", },
}

PreparedVesselsT2G = 
{
	{ "Ship_Race5_S_SCOUT_Rank6_5", "Ship_Race5_M_ATTACK_Rank6_5", "Ship_Race5_L_ENGINEER_Rank6_5" },
}

PreparedVesselsT3G = 
{
	{ "Ship_Race5_S_SCOUT_Rank9_5", "Ship_Race5_M_ATTACK_Rank9_5", "Ship_Race5_L_ENGINEER_Rank9_5" },
}

PreparedVesselsT4G = 
{
	{ "Ship_Race5_S_SCOUT_Rank12_5", "Ship_Race5_M_ATTACK_Rank12_5", "Ship_Race5_L_ENGINEER_Rank12_5" },
}

PreparedVesselsT5G = 
{
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },
}

PreparedVesselsT2_G = 
{
	{ "Ship_Race5_S_SCOUT_Rank6_5", "Ship_Race5_M_ATTACK_Rank6_5", "Ship_Race5_L_ENGINEER_Rank6_5" },
	{ "Ship_Race5_S_SCOUT_Rank6_5", "Ship_Race5_M_ATTACK_Rank6_5", "Ship_Race5_L_ENGINEER_Rank6_5" },
	{ "Ship_Race5_S_SCOUT_Rank6_5", "Ship_Race5_M_ATTACK_Rank6_5", "Ship_Race5_L_ENGINEER_Rank6_5" },
}

PreparedVesselsT3_G = 
{
	{ "Ship_Race5_S_SCOUT_Rank9_5", "Ship_Race5_M_ATTACK_Rank9_5", "Ship_Race5_L_ENGINEER_Rank9_5" },
	{ "Ship_Race5_S_SCOUT_Rank9_5", "Ship_Race5_M_ATTACK_Rank9_5", "Ship_Race5_L_ENGINEER_Rank9_5" },
	{ "Ship_Race5_S_SCOUT_Rank9_5", "Ship_Race5_M_ATTACK_Rank9_5", "Ship_Race5_L_ENGINEER_Rank9_5" },
}

PreparedVesselsT4_G = 
{
	{ "Ship_Race5_S_SCOUT_Rank12_5", "Ship_Race5_M_ATTACK_Rank12_5", "Ship_Race5_L_ENGINEER_Rank12_5" },
	{ "Ship_Race5_S_SCOUT_Rank12_5", "Ship_Race5_M_ATTACK_Rank12_5", "Ship_Race5_L_ENGINEER_Rank12_5" },
	{ "Ship_Race5_S_SCOUT_Rank12_5", "Ship_Race5_M_ATTACK_Rank12_5", "Ship_Race5_L_ENGINEER_Rank12_5" },
}

PreparedVesselsT5_G = 
{
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },
}

-- тематические наборы ботов #77370
PreparedVesselsT2_E = 
{
	{ "Ship_Preset_R1_S_T2", "Ship_Preset_R1_M_T2",  "Ship_Preset_R1_L_T2", },
	{ "Ship_Preset_R1_S_T2_Faction1", "Ship_Preset_R1_M_T2_Faction1",  "Ship_Preset_R1_L_T2_Faction1", },
	{ "Ship_Preset_R1_S_T2_Faction2", "Ship_Preset_R1_M_T2_Faction2",  "Ship_Preset_R1_L_T2_Faction2", },
	{ "Ship_Preset_R1_S_T2_Premium", "Ship_Preset_R1_M_T2_Premium",  "Ship_Preset_R1_L_T2_Premium", },
}
	
PreparedVesselsT2_F = 
{
	{ "Ship_Preset_R3_S_T2", "Ship_Preset_R3_M_T2",  "Ship_Preset_R3_L_T2", },
	{ "Ship_Preset_R3_S_T2_Faction1", "Ship_Preset_R3_M_T2_Faction1",  "Ship_Preset_R3_L_T2_Faction1", },
	{ "Ship_Preset_R3_S_T2_Faction2", "Ship_Preset_R3_M_T2_Faction2",  "Ship_Preset_R3_L_T2_Faction2", },
	{ "Ship_Preset_R3_S_T2_Premium", "Ship_Preset_R3_M_T2_Premium",  "Ship_Preset_R3_L_T2_Premium", },
}
	
PreparedVesselsT2_J = 
{
	{ "Ship_Preset_R2_S_T2", "Ship_Preset_R2_M_T2",  "Ship_Preset_R2_L_T2", },
	{ "Ship_Preset_R2_S_T2_Faction1", "Ship_Preset_R2_M_T2_Faction1",  "Ship_Preset_R2_L_T2_Faction1", },
	{ "Ship_Preset_R2_S_T2_Faction2", "Ship_Preset_R2_M_T2_Faction2",  "Ship_Preset_R2_L_T2_Faction2", },
	{ "Ship_Preset_R2_S_T2_Premium", "Ship_Preset_R2_M_T2_Premium",  "Ship_Preset_R2_L_T2_Premium", },
}

PreparedVesselsT2_S = 
{
	{ "Ship_Preset_R1_S_T2", "Ship_Preset_R1_S_T2_Faction1", "Ship_Preset_R1_S_T2_Faction2", "Ship_Preset_R1_S_T2_Premium" },
	{ "Ship_Preset_R3_S_T2", "Ship_Preset_R3_S_T2_Faction1", "Ship_Preset_R3_S_T2_Faction2", "Ship_Preset_R3_S_T2_Premium" },
	{ "Ship_Preset_R2_S_T2", "Ship_Preset_R2_S_T2_Faction1", "Ship_Preset_R2_S_T2_Faction2", "Ship_Preset_R2_S_T2_Premium" },
}

PreparedVesselsT2_M = 
{
	{ "Ship_Preset_R1_M_T2", "Ship_Preset_R1_M_T2_Faction1", "Ship_Preset_R1_M_T2_Faction2", "Ship_Preset_R1_M_T2_Premium" },
	{ "Ship_Preset_R3_M_T2", "Ship_Preset_R3_M_T2_Faction1", "Ship_Preset_R3_M_T2_Faction2", "Ship_Preset_R3_M_T2_Premium" },
	{ "Ship_Preset_R2_M_T2", "Ship_Preset_R2_M_T2_Faction1", "Ship_Preset_R2_M_T2_Faction2", "Ship_Preset_R2_M_T2_Premium" },
}

PreparedVesselsT2_L = 
{
	{ "Ship_Preset_R1_L_T2", "Ship_Preset_R1_L_T2_Faction1", "Ship_Preset_R1_L_T2_Faction2", "Ship_Preset_R1_L_T2_Premium" },
	{ "Ship_Preset_R3_L_T2", "Ship_Preset_R3_L_T2_Faction1", "Ship_Preset_R3_L_T2_Faction2", "Ship_Preset_R3_L_T2_Premium" },
	{ "Ship_Preset_R2_L_T2", "Ship_Preset_R2_L_T2_Faction1", "Ship_Preset_R2_L_T2_Faction2", "Ship_Preset_R2_L_T2_Premium" },
}

PreparedVesselsT2_H = --! эсминцы без модулей практически и ослаблены - для начального т2 самое то
{
	{ "Ship_Race1_H_T3_5low2", "Ship_Race2_H_T3_5low2", "Ship_Race3_H_T3_5low2", },
}

PreparedVesselsT2_P = 
{
	{ "Ship_Preset_R1_L_T2_Premium", "Ship_Preset_R3_L_T2_Premium", "Ship_Preset_R2_L_T2_Premium"}, -- пиратов не осталось на т2 поэтому премы
}


PreparedVesselsT3_E = 
{
	{ "Ship_PresetE_R1_S_T3", "Ship_PresetE_R1_M_T3",  "Ship_PresetE_R1_L_T3", },
	{ "Ship_PresetE_R1_S_T3_Faction1", "Ship_PresetE_R1_M_T3_Faction1",  "Ship_PresetE_R1_L_T3_Faction1", },
	{ "Ship_PresetE_R1_S_T3_Faction2", "Ship_PresetE_R1_M_T3_Faction2",  "Ship_PresetE_R1_L_T3_Faction2", },
	{ "Ship_PresetE_R1_S_T3_Premium", "Ship_PresetE_R1_M_T3_Premium",  "Ship_PresetE_R1_L_T3_Premium", },
}
	
PreparedVesselsT3_F = 
{
	{ "Ship_PresetE_R3_S_T3", "Ship_PresetE_R3_M_T3",  "Ship_PresetE_R3_L_T3", },
	{ "Ship_PresetE_R3_S_T3_Faction1", "Ship_PresetE_R3_M_T3_Faction1",  "Ship_PresetE_R3_L_T3_Faction1", },
	{ "Ship_PresetE_R3_S_T3_Faction2", "Ship_PresetE_R3_M_T3_Faction2",  "Ship_PresetE_R3_L_T3_Faction2", },
	{ "Ship_PresetE_R3_S_T3_Premium", "Ship_PresetE_R3_M_T3_Premium",  "Ship_PresetE_R3_L_T3_Premium", },
}
	
PreparedVesselsT3_J = 
{
	{ "Ship_PresetE_R2_S_T3", "Ship_PresetE_R2_M_T3",  "Ship_PresetE_R2_L_T3", },
	{ "Ship_PresetE_R2_S_T3_Faction1", "Ship_PresetE_R2_M_T3_Faction1",  "Ship_PresetE_R2_L_T3_Faction1", },
	{ "Ship_PresetE_R2_S_T3_Faction2", "Ship_PresetE_R2_M_T3_Faction2",  "Ship_PresetE_R2_L_T3_Faction2", },
	{ "Ship_PresetE_R2_S_T3_Premium", "Ship_PresetE_R2_M_T3_Premium",  "Ship_PresetE_R2_L_T3_Premium", },
}

PreparedVesselsT3_S = 
{
	{ "Ship_PresetE_R1_S_T3", "Ship_PresetE_R1_S_T3_Faction1", "Ship_PresetE_R1_S_T3_Faction2", "Ship_PresetE_R1_S_T3_Premium" },
	{ "Ship_PresetE_R3_S_T3", "Ship_PresetE_R3_S_T3_Faction1", "Ship_PresetE_R3_S_T3_Faction2", "Ship_PresetE_R3_S_T3_Premium" },
	{ "Ship_PresetE_R2_S_T3", "Ship_PresetE_R2_S_T3_Faction1", "Ship_PresetE_R2_S_T3_Faction2", "Ship_PresetE_R2_S_T3_Premium" },
}

PreparedVesselsT3_M = 
{
	{ "Ship_PresetE_R1_M_T3", "Ship_PresetE_R1_M_T3_Faction1", "Ship_PresetE_R1_M_T3_Faction2", "Ship_PresetE_R1_M_T3_Premium" },
	{ "Ship_PresetE_R3_M_T3", "Ship_PresetE_R3_M_T3_Faction1", "Ship_PresetE_R3_M_T3_Faction2", "Ship_PresetE_R3_M_T3_Premium" },
	{ "Ship_PresetE_R2_M_T3", "Ship_PresetE_R2_M_T3_Faction1", "Ship_PresetE_R2_M_T3_Faction2", "Ship_PresetE_R2_M_T3_Premium" },
}

PreparedVesselsT3_L = 
{
	{ "Ship_PresetE_R1_L_T3", "Ship_PresetE_R1_L_T3_Faction1", "Ship_PresetE_R1_L_T3_Faction2", "Ship_PresetE_R1_L_T3_Premium" },
	{ "Ship_PresetE_R3_L_T3", "Ship_PresetE_R3_L_T3_Faction1", "Ship_PresetE_R3_L_T3_Faction2", "Ship_PresetE_R3_L_T3_Premium" },
	{ "Ship_PresetE_R2_L_T3", "Ship_PresetE_R2_L_T3_Faction1", "Ship_PresetE_R2_L_T3_Faction2", "Ship_PresetE_R2_L_T3_Premium" },
}

PreparedVesselsT3_H = 
{
	{ "Ship_Race1_H_T3_5low", "Ship_Race2_H_T3_5low", "Ship_Race3_H_T3_5low", },
	{ "Ship_Race1_H_T3_5low", "Ship_Race2_H_T3_5low", "Ship_Race3_H_T3_5low", },
	{ "Ship_Race1_H_T3_5low", "Ship_Race2_H_T3_5low", "Ship_Race3_H_T3_5low", },
}

PreparedVesselsT3_P = 
{
	{ "Ship_PresetE_R1_S_T3_Pirate", "Ship_PresetE_R3_S_T3_Pirate"},
	{ "Ship_PresetE_R3_S_T3_Pirate", "Ship_PresetE_R2_S_T3_Pirate"},
	{ "Ship_PresetE_R2_S_T3_Pirate", "Ship_PresetE_R1_S_T3_Pirate"},
}


PreparedVesselsT4_E = 
{
	{ "Ship_PresetE_R1_S_T4", "Ship_PresetE_R1_M_T4",  "Ship_PresetE_R1_L_T4", },
	{ "Ship_PresetE_R1_S_T4_Faction1", "Ship_PresetE_R1_M_T4_Faction1",  "Ship_PresetE_R1_L_T4_Faction1", },
	{ "Ship_PresetE_R1_S_T4_Faction2", "Ship_PresetE_R1_M_T4_Faction2",  "Ship_PresetE_R1_L_T4_Faction2", },
	{ "Ship_PresetE_R1_S_T4_Premium", "Ship_PresetE_R1_M_T4_Premium",  "Ship_PresetE_R1_L_T4_Premium", },
}
	
PreparedVesselsT4_F = 
{
	{ "Ship_PresetE_R3_S_T4", "Ship_PresetE_R3_M_T4",  "Ship_PresetE_R3_L_T4", },
	{ "Ship_PresetE_R3_S_T4_Faction1", "Ship_PresetE_R3_M_T4_Faction1",  "Ship_PresetE_R3_L_T4_Faction1", },
	{ "Ship_PresetE_R3_S_T4_Faction2", "Ship_PresetE_R3_M_T4_Faction2",  "Ship_PresetE_R3_L_T4_Faction2", },
	{ "Ship_PresetE_R3_S_T4_Premium", "Ship_PresetE_R3_M_T4_Premium",  "Ship_PresetE_R3_L_T4_Premium", },
}
	
PreparedVesselsT4_J = 
{
	{ "Ship_PresetE_R2_S_T4", "Ship_PresetE_R2_M_T4",  "Ship_PresetE_R2_L_T4", },
	{ "Ship_PresetE_R2_S_T4_Faction1", "Ship_PresetE_R2_M_T4_Faction1",  "Ship_PresetE_R2_L_T4_Faction1", },
	{ "Ship_PresetE_R2_S_T4_Faction2", "Ship_PresetE_R2_M_T4_Faction2",  "Ship_PresetE_R2_L_T4_Faction2", },
	{ "Ship_PresetE_R2_S_T4_Premium", "Ship_PresetE_R2_M_T4_Premium",  "Ship_PresetE_R2_L_T4_Premium", },
}

PreparedVesselsT4_S = 
{
	{ "Ship_PresetE_R1_S_T4", "Ship_PresetE_R1_S_T4_Faction1", "Ship_PresetE_R1_S_T4_Faction2", "Ship_PresetE_R1_S_T4_Premium" },
	{ "Ship_PresetE_R3_S_T4", "Ship_PresetE_R3_S_T4_Faction1", "Ship_PresetE_R3_S_T4_Faction2", "Ship_PresetE_R3_S_T4_Premium" },
	{ "Ship_PresetE_R2_S_T4", "Ship_PresetE_R2_S_T4_Faction1", "Ship_PresetE_R2_S_T4_Faction2", "Ship_PresetE_R2_S_T4_Premium" },
}

PreparedVesselsT4_M = 
{
	{ "Ship_PresetE_R1_M_T4", "Ship_PresetE_R1_M_T4_Faction1", "Ship_PresetE_R1_M_T4_Faction2", "Ship_PresetE_R1_M_T4_Premium" },
	{ "Ship_PresetE_R3_M_T4", "Ship_PresetE_R3_M_T4_Faction1", "Ship_PresetE_R3_M_T4_Faction2", "Ship_PresetE_R3_M_T4_Premium" },
	{ "Ship_PresetE_R2_M_T4", "Ship_PresetE_R2_M_T4_Faction1", "Ship_PresetE_R2_M_T4_Faction2", "Ship_PresetE_R2_M_T4_Premium" },
}

PreparedVesselsT4_L = 
{
	{ "Ship_PresetE_R1_L_T4", "Ship_PresetE_R1_L_T4_Faction1", "Ship_PresetE_R1_L_T4_Faction2", "Ship_PresetE_R1_L_T4_Premium" },
	{ "Ship_PresetE_R3_L_T4", "Ship_PresetE_R3_L_T4_Faction1", "Ship_PresetE_R3_L_T4_Faction2", "Ship_PresetE_R3_L_T4_Premium" },
	{ "Ship_PresetE_R2_L_T4", "Ship_PresetE_R2_L_T4_Faction1", "Ship_PresetE_R2_L_T4_Faction2", "Ship_PresetE_R2_L_T4_Premium" },
}

PreparedVesselsT4_H = 
{
	{ "Ship_Race1_H_T3_5", "Ship_Race2_H_T3_5", "Ship_Race3_H_T3_5", },
	{ "Ship_Race1_H_T3_5", "Ship_Race2_H_T3_5", "Ship_Race3_H_T3_5", },
	{ "Ship_Race1_H_T3_5", "Ship_Race2_H_T3_5", "Ship_Race3_H_T3_5", },
	{ "Ship_Race1_H_T3_5", "Ship_Race2_H_T3_5", "Ship_Race3_H_T3_5", },
}

PreparedVesselsT4_P = 
{
	{ "Ship_PresetE_R2_S_T4_Pirate", "Ship_PresetE_R2_M_T4_Pirate"},
	{ "Ship_PresetE_R2_S_T4_Pirate", "Ship_PresetE_R2_M_T4_Pirate"},
	{ "Ship_PresetE_R2_S_T4_Pirate", "Ship_PresetE_R2_M_T4_Pirate"},
}



PreparedVesselsT5_E = 
{
	{ "Ship_PresetE_R1_S_T5", "Ship_PresetE_R1_M_T5",  "Ship_PresetE_R1_L_T5", },
	{ "Ship_PresetE_R1_S_T5_Faction1", "Ship_PresetE_R1_M_T5_Faction1",  "Ship_PresetE_R1_L_T5_Faction1", },
	{ "Ship_PresetE_R1_S_T5_Faction2", "Ship_PresetE_R1_M_T5_Faction2",  "Ship_PresetE_R1_L_T5_Faction2", },
	{ "Ship_PresetE_R1_S_T5_Premium", "Ship_PresetE_R1_M_T5_Premium",  "Ship_PresetE_R1_L_T5_Premium", },
}
	
PreparedVesselsT5_F = 
{
	{ "Ship_PresetE_R3_S_T5", "Ship_PresetE_R3_M_T5",  "Ship_PresetE_R3_L_T5", },
	{ "Ship_PresetE_R3_S_T5_Faction1", "Ship_PresetE_R3_M_T5_Faction1",  "Ship_PresetE_R3_L_T5_Faction1", },
	{ "Ship_PresetE_R3_S_T5_Faction2", "Ship_PresetE_R3_M_T5_Faction2",  "Ship_PresetE_R3_L_T5_Faction2", },
	{ "Ship_PresetE_R3_S_T5_Premium", "Ship_PresetE_R3_M_T5_Premium",  "Ship_PresetE_R3_L_T5_Premium", },
}
	
PreparedVesselsT5_J = 
{
	{ "Ship_PresetE_R2_S_T5", "Ship_PresetE_R2_M_T5",  "Ship_PresetE_R2_L_T5", },
	{ "Ship_PresetE_R2_S_T5_Faction1", "Ship_PresetE_R2_M_T5_Faction1",  "Ship_PresetE_R2_L_T5_Faction1", },
	{ "Ship_PresetE_R2_S_T5_Faction2", "Ship_PresetE_R2_M_T5_Faction2",  "Ship_PresetE_R2_L_T5_Faction2", },
	{ "Ship_PresetE_R2_S_T5_Premium", "Ship_PresetE_R2_M_T5_Premium",  "Ship_PresetE_R2_L_T5_Premium", },
}

PreparedVesselsT5_S = 
{
	{ "Ship_PresetE_R1_S_T5", "Ship_PresetE_R1_S_T5_Faction1", "Ship_PresetE_R1_S_T5_Faction2", "Ship_PresetE_R1_S_T5_Premium" },
	{ "Ship_PresetE_R3_S_T5", "Ship_PresetE_R3_S_T5_Faction1", "Ship_PresetE_R3_S_T5_Faction2", "Ship_PresetE_R3_S_T5_Premium" },
	{ "Ship_PresetE_R2_S_T5", "Ship_PresetE_R2_S_T5_Faction1", "Ship_PresetE_R2_S_T5_Faction2", "Ship_PresetE_R2_S_T5_Premium" },
}

PreparedVesselsT5_M = 
{
	{ "Ship_PresetE_R1_M_T5", "Ship_PresetE_R1_M_T5_Faction1", "Ship_PresetE_R1_M_T5_Faction2", "Ship_PresetE_R1_M_T5_Premium" },
	{ "Ship_PresetE_R3_M_T5", "Ship_PresetE_R3_M_T5_Faction1", "Ship_PresetE_R3_M_T5_Faction2", "Ship_PresetE_R3_M_T5_Premium" },
	{ "Ship_PresetE_R2_M_T5", "Ship_PresetE_R2_M_T5_Faction1", "Ship_PresetE_R2_M_T5_Faction2", "Ship_PresetE_R2_M_T5_Premium" },
}

PreparedVesselsT5_L = 
{
	{ "Ship_PresetE_R1_L_T5", "Ship_PresetE_R1_L_T5_Faction1", "Ship_PresetE_R1_L_T5_Faction2", "Ship_PresetE_R1_L_T5_Premium" },
	{ "Ship_PresetE_R3_L_T5", "Ship_PresetE_R3_L_T5_Faction1", "Ship_PresetE_R3_L_T5_Faction2", "Ship_PresetE_R3_L_T5_Premium" },
	{ "Ship_PresetE_R2_L_T5", "Ship_PresetE_R2_L_T5_Faction1", "Ship_PresetE_R2_L_T5_Faction2", "Ship_PresetE_R2_L_T5_Premium" },
}

PreparedVesselsT5_H =
{
	{ "Ship_Race1_H_T4_5", "Ship_Race2_H_T4_5", "Ship_Race3_H_T4_5", },
	{ "Ship_Race1_H_T4_5", "Ship_Race2_H_T4_5", "Ship_Race3_H_T4_5", },
	{ "Ship_Race1_H_T4_5", "Ship_Race2_H_T4_5", "Ship_Race3_H_T4_5", },
	{ "Ship_Race1_H_T4_5", "Ship_Race2_H_T4_5", "Ship_Race3_H_T4_5", },
}

PreparedVesselsT5X_H =
{
	{ "Ship_Race1_H_T5_5", "Ship_Race2_H_T5_5", "Ship_Race3_H_T5_5", },
	{ "Ship_Race1_H_T5_5", "Ship_Race2_H_T5_5", "Ship_Race3_H_T5_5", },
	{ "Ship_Race1_H_T5_5", "Ship_Race2_H_T5_5", "Ship_Race3_H_T5_5", },
}

PreparedVesselsT5_P = --! ну нет пиратов на т5 поэтому сделал сборник премов и т4 пиратов
{
	{ "Ship_PresetE_R2_S_T4_Pirate", "Ship_PresetE_R2_M_T4_Pirate", "Ship_PresetE_R2_L_T5_Steam"},
	{ "Ship_PresetE_R2_S_T4_Pirate", "Ship_PresetE_R2_M_T4_Pirate", "Ship_PresetE_R2_L_T5_Steam"},
	{ "Ship_PresetE_R2_S_T4_Pirate", "Ship_PresetE_R2_M_T4_Pirate", "Ship_PresetE_R2_L_T5_Steam"},
	{ "Ship_PresetE_R1_S_T5_Premium", "Ship_PresetE_R3_S_T5_Premium", "Ship_PresetE_R2_S_T5_Premium" },
	{ "Ship_PresetE_R1_M_T5_Premium", "Ship_PresetE_R3_M_T5_Premium", "Ship_PresetE_R2_M_T5_Premium" },
	{ "Ship_PresetE_R1_L_T5_Premium", "Ship_PresetE_R3_L_T5_Premium", "Ship_PresetE_R2_L_T5_Premium" },
}

-- #83512 довесок т1
PreparedVesselsT1_E =
{
	{ "Ship_Preset_R1_S_T1", "Ship_Preset_R1_M_T1",  "Ship_Preset_R1_L_T1", },
	{ "Ship_Preset_R1_S_T1_Faction1", "Ship_Preset_R1_M_T1_Faction1",  "Ship_Preset_R1_L_T1_Premium", },
}

PreparedVesselsT1_F =
{
	{ "Ship_Preset_R3_S_T1", "Ship_Preset_R3_M_T1",  "Ship_Preset_R3_L_T1", },
	{ "Ship_Preset_R3_S_T1_Premium", "Ship_Preset_R3_M_T1_Faction1",  "Ship_Preset_R3_L_T1_Faction1", },
}

PreparedVesselsT1_J =
{
	{ "Ship_Preset_R2_S_T1", "Ship_Preset_R2_M_T1",  "Ship_Preset_R2_L_T1", },
	{ "Ship_Preset_R2_S_T1_Premium", "Ship_Preset_R2_M_T1_Faction1",  "Ship_Preset_R2_L_T1_Premium", },
}

PreparedVesselsT1_S =
{
	{ "Ship_Preset_R1_S_T1", "Ship_Preset_R3_S_T1",  "Ship_Preset_R2_S_T1", },
	{ "Ship_Preset_R1_S_T1_Faction1", "Ship_Preset_R3_S_T1_Premium",  "Ship_Preset_R2_S_T1_Premium", },
}

PreparedVesselsT1_M =
{
	{ "Ship_Preset_R1_M_T1", "Ship_Preset_R3_M_T1",  "Ship_Preset_R2_M_T1", },
	{ "Ship_Preset_R1_M_T1_Faction1", "Ship_Preset_R3_M_T1_Faction1",  "Ship_Preset_R2_M_T1_Faction1", },
}

PreparedVesselsT1_L =
{
	{ "Ship_Preset_R1_L_T1", "Ship_Preset_R3_L_T1",  "Ship_Preset_R2_L_T1", },
	{ "Ship_Preset_R1_L_T1_Premium", "Ship_Preset_R3_L_T1_Faction1",  "Ship_Preset_R2_L_T1_Premium", },
}



-- псевдорандомное дополнение вариантов троек кораблей
function _AddRVariants (v, n)
	--sys.log( "---------- %d", #v)
	local p = {5,11,4,8,2,14,13,7,16,1,9,3,12,10,6,17,15}
	local nv = #v
	local np = #p
	local i,j,k
	local nn
	for nn = 1, n do
		i = p[(3*nn+11+n)%np +1]
		j = p[(5*nn+79+n)%np +1]
		k = p[(7*nn+34+n)%np +1]
		i = i%nv +1
		j = j%nv +1
		if j == i then j = (i+j)%nv +1 end
		k = k%nv +1
		if (k == i) or (k == j) then k = (i+j+k)%nv +1 end
		v[nv+nn] = {v[i][1],v[j][2],v[k][3]}
		--sys.log( "--- add %d = %d %d %d", nv+nn, i,j,k )
	end
end

x=_AddRVariants(PreparedVesselsT1,10)
x=_AddRVariants(PreparedVesselsT2,11)
x=_AddRVariants(PreparedVesselsT3,12)
x=_AddRVariants(PreparedVesselsT4,13)
x=_AddRVariants(PreparedVesselsT5,14)
x=_AddRVariants(PreparedVesselsTX,15)
x=_AddRVariants(PreparedVesselsT1E,16)
x=_AddRVariants(PreparedVesselsT2E,17)
x=_AddRVariants(PreparedVesselsT3E,18)
x=_AddRVariants(PreparedVesselsT4E,19)
x=_AddRVariants(PreparedVesselsT5E,20)
x=_AddRVariants(PreparedVesselsT23,8)
x=_AddRVariants(PreparedVesselsT45,9)
x=_AddRVariants(PreparedVesselsT2EE,10)


PreparedVesselsT5EX = 
{
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },

	{ "Ship_PresetE_R1_S_T5_Faction1", "Ship_PresetE_R1_M_T5_Faction1",  "Ship_PresetE_R1_L_T5_Faction1", },
	{ "Ship_PresetE_R1_S_T5_Faction2", "Ship_PresetE_R1_M_T5_Faction2",  "Ship_PresetE_R1_L_T5_Faction2", },
	{ "Ship_PresetE_R1_S_T5_Premium", "Ship_PresetE_R1_M_T5_Premium",  "Ship_PresetE_R1_L_T5_Premium", },
	
	{ "Ship_PresetE_R3_S_T5_Faction1", "Ship_PresetE_R3_M_T5_Faction1",  "Ship_PresetE_R3_L_T5_Faction1", },
	{ "Ship_PresetE_R3_S_T5_Faction2", "Ship_PresetE_R3_M_T5_Faction2",  "Ship_PresetE_R3_L_T5_Faction2", },
	{ "Ship_PresetE_R3_S_T5_Premium", "Ship_PresetE_R3_M_T5_Premium",  "Ship_PresetE_R3_L_T5_Premium", },

	{ "Ship_PresetE_R2_S_T5_Faction1", "Ship_PresetE_R2_M_T5_Faction1",  "Ship_PresetE_R2_L_T5_Faction1", },
	{ "Ship_PresetE_R2_S_T5_Faction2", "Ship_PresetE_R2_M_T5_Faction2",  "Ship_PresetE_R2_L_T5_Faction2", },
	{ "Ship_PresetE_R2_S_T5_Premium", "Ship_PresetE_R2_M_T5_Premium",  "Ship_PresetE_R2_L_T5_Premium", },
}

PreparedVesselsT5EXH =	-- особо злые боты для ст-шников в лобби #92765
{
	{ "Ship_Race1_H_T5_5", "Ship_Race2_H_T5_5", "Ship_Race3_H_T5_5", },
	{ "Ship_Race1_H_T5_5", "Ship_Race2_H_T5_5", "Ship_Race3_H_T5_5", },
	{ "Ship_Race1_H_T5_5", "Ship_Race2_H_T5_5", "Ship_Race3_H_T5_5", },

	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },
	{ "Ship_Race5_S_SCOUT_Rank15_5", "Ship_Race5_M_ATTACK_Rank15_5", "Ship_Race5_L_ENGINEER_Rank15_5" },

	{ "Ship_PresetE_R1_S_T5_Faction1", "Ship_PresetE_R1_M_T5_Faction1",  "Ship_PresetE_R1_L_T5_Faction1", },
	{ "Ship_PresetE_R1_S_T5_Faction2", "Ship_PresetE_R1_M_T5_Faction2",  "Ship_PresetE_R1_L_T5_Faction2", },
	{ "Ship_PresetE_R1_S_T5_Premium", "Ship_PresetE_R1_M_T5_Premium",  "Ship_PresetE_R1_L_T5_Premium", },
	
	{ "Ship_PresetE_R3_S_T5_Faction1", "Ship_PresetE_R3_M_T5_Faction1",  "Ship_PresetE_R3_L_T5_Faction1", },
	{ "Ship_PresetE_R3_S_T5_Faction2", "Ship_PresetE_R3_M_T5_Faction2",  "Ship_PresetE_R3_L_T5_Faction2", },
	{ "Ship_PresetE_R3_S_T5_Premium", "Ship_PresetE_R3_M_T5_Premium",  "Ship_PresetE_R3_L_T5_Premium", },

	{ "Ship_PresetE_R2_S_T5_Faction1", "Ship_PresetE_R2_M_T5_Faction1",  "Ship_PresetE_R2_L_T5_Faction1", },
	{ "Ship_PresetE_R2_S_T5_Faction2", "Ship_PresetE_R2_M_T5_Faction2",  "Ship_PresetE_R2_L_T5_Faction2", },
	{ "Ship_PresetE_R2_S_T5_Premium", "Ship_PresetE_R2_M_T5_Premium",  "Ship_PresetE_R2_L_T5_Premium", },
}

PreparedVesselsT5Portal = 
{
	{ "Ship_PresetE_R1_S_T5", "Ship_PresetE_R1_M_T5",  "Ship_PresetE_R1_L_T5", "Ship_PresetE_R3_S_T5_Faction2"},
	{ "Ship_PresetE_R1_S_T5_Faction1", "Ship_PresetE_R1_M_T5_Faction1",  "Ship_PresetE_R1_L_T5_Faction1", "Ship_PresetE_R2_S_T5_Faction2"},
	{ "Ship_PresetE_R1_S_T5_Faction2", "Ship_PresetE_R1_M_T5_Faction2",  "Ship_PresetE_R1_L_T5_Faction2", "Ship_PresetE_R2_M_T5_Faction2"},
	
	{ "Ship_PresetE_R3_S_T5", "Ship_PresetE_R3_M_T5",  "Ship_PresetE_R3_L_T5", "Ship_PresetE_R1_M_T5_Faction2"},
	{ "Ship_PresetE_R3_S_T5_Faction1", "Ship_PresetE_R3_M_T5_Faction1",  "Ship_PresetE_R3_L_T5_Faction1", "Ship_PresetE_R1_S_T5_Faction1"},
	{ "Ship_PresetE_R3_S_T5_Faction2", "Ship_PresetE_R3_M_T5_Faction2",  "Ship_PresetE_R3_L_T5_Faction2", "Ship_PresetE_R2_S_T5_Faction1"},

	{ "Ship_PresetE_R2_S_T5", "Ship_PresetE_R2_M_T5",  "Ship_PresetE_R2_L_T5", "Ship_PresetE_R1_M_T5_Faction2"},
	{ "Ship_PresetE_R2_S_T5_Faction1", "Ship_PresetE_R2_M_T5_Faction1",  "Ship_PresetE_R2_L_T5_Faction1", "Ship_PresetE_R1_M_T5_Faction1"},
	{ "Ship_PresetE_R2_S_T5_Faction2", "Ship_PresetE_R2_M_T5_Faction2",  "Ship_PresetE_R2_L_T5_Faction2", "Ship_PresetE_R3_M_T5_Faction2"},
}

--#100716 рандомные боты

function _Preset2List(r, a) -- делает одномерный массив из 2х-мерного и плюсует его к r
	--sys.log( "---------- %d", #a)
	local n = #r
	local na = #a
	local i,j
	for i = 1, na do
		for j = 1, #a[i] do
			n = n + 1
			r[n] = a[i][j]
		end
	end
end

rT = {}
cSym = {"E","F","J","S","M","L","H","P","G"}
p = {5,11,4,8,2,14,13,7,16,1,9,3,12,10,6,17,15}
np = #p

for nT = 2, 5 do
	rT[nT] = {}
	for n = 1, #cSym do
		_Preset2List( rT[nT], _G[ "PreparedVesselsT"..nT.."_"..cSym[n] ] ) -- слили все корабли из тематических наборов тека в одну линейку
	end
	if nT == 5 then -- добавим хардкора т5 эсмов в т5
		_Preset2List( rT[nT], _G[ "PreparedVesselsT"..nT.."X_H" ] ) -- слили все корабли из тематических наборов тека в одну линейку
	end

	_G[ "PreparedVesselsT"..nT.."_R" ] = {} -- заготовка для рандомного претета тека
	pr = _G[ "PreparedVesselsT"..nT.."_R" ]
	
	local g = rT[nT]
	local ng = #g
	for n = 1, 20 do -- делаем 20 наборов
		pr[n] = {}
		for j = 1, 4 do 
			i = (p[(3*nT+11*n+j)%np +1] * 123 + n*7 + j*3) % ng + 1 -- некий псевдорандомный номер из доступного списка кораблей
			--sys.log( "---------- %d", i)
			pr[n][j] = g[i] -- но тут могут быть повторы + нам надо разное количество кораблей!
		end
		-- поэтому тут проерживаем
		for j = 2, 4 do
			for i = 1, j-1 do
				if pr[n][j] == pr[n][i] then -- дубль
					pr[n][j] = nil
				end
			end
		end
	end	
	
end

--- а ещё надо общий набор т3-т5 но смешиваем теки только в у разных ботов
_G[ "PreparedVesselsT35_R" ] = {} -- заготовка для рандомного претета тека
pr = _G[ "PreparedVesselsT35_R" ]
for nT = 3, 5 do
	for n = 1 , 10 do
		pr[nT*10+n-30] = _G[ "PreparedVesselsT"..nT.."_R" ][n*2]
	end
end

--- для теста ботов на эсминцах - убрать "х"
xPreparedVessels = 
{
	{ "Ship_Race1_H_T3_5low", "Ship_Race2_H_T3_5low", "Ship_Race3_H_T3_5low", },
	{ "Ship_Race1_H_T3_5", "Ship_Race2_H_T3_5", "Ship_Race3_H_T3_5", },
	{ "Ship_Race1_H_T4_5", "Ship_Race2_H_T4_5", "Ship_Race3_H_T4_5", },
}
