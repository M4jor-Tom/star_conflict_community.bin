--[[
	Описание игровых зон.
	zone_id 			- уникальный идентификатор должен быть больше 0 и менрьше 256. этот Id записывается в базу данных, т.е. после того как он "ушел на Live", так просто удалять/менять его нельзя!
	link_zones 			- список зон присоединенных к этой зоне (связи могут быть односторонними)
	space_station		- имеет ли зона космическую станцию. в нее можно телепортироваться авто-пилотом
	station_race		- идентификатор расы, которой принадлежит станция (для рассового лидерборда секретных документов #35481)
	hangar_level_name	- имя уровня для ангара
	start_for_race		- идентификатор расы которая "начинает" в этой зоне
	secret_document_spawn_loot_crate - <bool> в этой зоне могут появиться секретные документы #35481
	secret_document_spawn_ai_squad - <bool> в этой зоне могут появиться секретные документы #48594
	pve_level_name 		- указывает на то, что на глобальной карте FreeSpace появится PVE-миссия(QZR)
	playlist			- имя плейлиста по умолчанию, который проигрывается в этой зоне
	
	для дебажного отображения космической карты можно воспользоваться чат-командой /spacemap
	
	для редактирования положения точек на глобальной карте нужно в консоли ввести: 
	UI.GameplayPveMapWnd.isDragAndropEnable = true
	ЛКМ - перемещает тултипы, ПКМ - перемещает точку
]]

-- guarantee global table exist
SpaceZone = {}

-- время доступности зоны в БЗС 2
-- В это время строится ладдер для этой точки  --GMT (мы -5) в минутах
bzs2times = {
	ru = 18 * 60 * 60 + 15,	-- добавил 15 секунд, а то 59 минут показывает при минимальном отклонении локальных часов
	eu = 20 * 60 * 60 + 15,
	us =  4 * 60 * 60 + 15,	--2
	asia =  13 * 60 * 60 + 15,	--5
	lig = 19 * 60 * 60 + 15,	-- для лиг
	lig21 = 18 * 60 * 60 + 15,	-- для лиг
	lig20 = 17 * 60 * 60 + 15,	-- для лиг
	lig19 = 16 * 60 * 60 + 15,	-- для лиг Мск19
	lig0 = 21 * 60 * 60 + 15,	-- для лиг Мск 0
}

bzs2rewardskf = {
	tokens = 3,
	credits = 1.5,
	gold = 1,
}

bfs_sector_colors = {
	n = 0xffbbbbbb, -- серый
	e = 0xffbbbb00, -- желтый
	f = 0xff4aadff, --0xff4444ff, -- синий
	j = 0xff83211d, --0xffff3300, -- красный 0xff7f180d
	g = 0xff44bb00, -- зелёный
}

sys.execscript( 'gamedata/def/ex/zones.lua' ) -- подгружаем карты от кампании

-- start zone. UI разрешает вылет в эту зону
-- #0091666: Свободный перелет в стартовую локацию. UI
START_ZONE_ID = SpaceZone.Precursor_Zona3.zone_id

--[[
SpaceZone.smallstation =
{
	zone_id = 232,
	pvp_level_name = "s1347_smallstation",
	level_name = "s1347_smallstation",
	min_ship_rank = 4,
	max_exp_rank = 18,	

	dbg_pos_x = 521,
	dbg_pos_y = 52,
}
--]]
-- перенесено из ui_properties.lua
FreeSpaceMap = 
{
	sizeX 			= 3326,
	sizeY 			= 1758,
}

FreeSpaceMap.SubRegions = 
{
	EmpireRegionFelony = 
	{
		posX = 1443,5, 
		posY = 563.5, 

		zones =	{ "Empire_IlayGateSirus3", "Empire_SirusDebrissite", "Empire_IlayGateSirus", "Empire_IlayGateSirus2", },
		conflict_time	= bzs2times.ru,
		tier	= 3, 
		next_subregion = "CloseRegionPandora",
		star_pic = "system_star_yellow",
	},
	
	EmpireRegionOntregos = 
	{
		posX = 1418,5, --71
		posY = 858.5, --71

		zones =	{ "Empire_IlayStation3", "Empire_HomeWorld", "Empire_IlayStation2", "Empire_IlayMiningsite", "Empire_IlayGateRex3", "Empire_IlayGateRex", "Empire_IlayGateRex2", "Empire_IlayClanbigship",},
		conflict_time	= bzs2times.ru,
		tier	= 3, 
		next_subregion = "RaceFrontierRegionEmp",
		star_pic = "system_star_yellow",
	},
	
	EmpireRegionPride = 
	{
		posX = 1336,5,
		posY = 968,5,

		zones =	{ "Empire_RexFallenScrapyard", "Empire_CaptureRepairbase", "ow_smallstation" },
		conflict_time	= bzs2times.ru,
		tier	= 3, 
		next_subregion = "EmpireRegionOntregos",
		star_pic = "system_star_blue",
	},
	
	FederationRegionErebus =
	{
		posX = 2011,5,
		posY = 895,5,

		zones =	{ "Federation_LumenConstructionsite", "Federation_LumenConstructionsite3", "Federation_LumenConstructionsite2", },
		conflict_time	= bzs2times.us,
		tier	= 5,	--#106951 
		next_subregion = "FederationRegionOlympus",
		star_pic = "system_star_yellow",
	},
	
	FederationRegionOlympus = 
	{
		posX = 1961,5,
		posY = 1003,5,

		zones =	{ "Federation_NalnifanGateLumen", "Federation_HomeWorld", "Federation_NalnifanShipyard2", "Federation_NalnifanShipyard", "Federation_NalnifanShipyard3", "Federation_NalnifanGateCarib", "Federation_NalnifanClanbigship", "Federation_AsteroidBuilding", "Federation_NalnifanClanbigship",},
		conflict_time	= bzs2times.us,
		tier	= 3, 
		next_subregion = "CloseRegionHaldon",
		star_pic = "system_star_yellow",
	},
	
	FederationRegionVelorum = 
	{
		posX = 1801,5,
		posY = 755,5,

		zones =	{ "Federation_CaribWaterharvest3", "Federation_CaribWaterharvest", "Federation_CaribWaterharvest2", "Federation_Geostation", "Federation_FrozenStation", },
		conflict_time	= bzs2times.asia,
		tier	= 3, 
		next_subregion = "RaceFrontierRegionFed",
		star_pic = "system_star_blue",
	},
	
	JerichoRegionPallas = 
	{
		posX = 1478,5,
		posY = 1218,5,

		zones =	{ "Jericho_IsidGasharvest", "Jericho_IsidStation2", "Jericho_HomeWorld", "Jericho_IsidMiningsite", "Jericho_IsidMiningsite2", "Jericho_IsidGateMaseera", "Jericho_IsidMiningsite3", "Jericho_IsidStation3", "Jericho_IsidClanbigship",},
		conflict_time	= bzs2times.eu,
		tier	= 3, 
		next_subregion = "CloseRegionProcssima",
		star_pic = "system_star_red",
	},
	
	JerichoRegionSolaris = 
	{
		posX = 1601,5,
		posY = 1287,5,

		zones =	{ "Jericho_MaseeraGateIsid", "Jericho_MaseeraGateIsid2", "Jericho_MaseeraGateIsid3", "Jericho_MaseeraTerramorphingsite", "Jericho_JerichoBase", },
		conflict_time	= bzs2times.eu,
		tier	= 5,	--#106951 
		next_subregion = "JerichoRegionPallas",
		star_pic = "system_star_orange",
	},
	
	RaceFrontierRegionEmp =
	{
		posX = 1480,5,
		posY = 740,5,

		zones =	{ "Empire_Frontier", },
		conflict_time	= bzs2times.ru,
		tier	= 5, 
		next_subregion = "EmpireRegionMenar",
		star_pic = "system_star_yellow",
	},
	
	RaceFrontierRegionFed = 
	{
		posX = 1850,5,
		posY = 849,5,

		zones =	{ "Federation_Frontier", "ow_terminal_d", },
		conflict_time	= bzs2times.us,
		tier	= 5, 
		next_subregion = "FederationRegionErebus",
		star_pic = "system_star_blue",
	},
	
	RaceFrontierRegionJer =
	{
		posX = 1309,5,
		posY = 1114,5,

		zones =	{ "Jericho_Frontier", },
		conflict_time	= bzs2times.eu,
		tier	= 5,
		star_pic = "system_star_red",
	},
	
	RaceFrontierRegionPir =
	{
		posX = 1643,5,
		posY = 883,5,

		zones =	{ "Jericho_PirateBay", },
		--conflict_time	= ,
		tier	= 5,
		star_pic = "system_star_orange",
	},
	
	CloseRegionProcssima = 
	{
		posX = 1231,5,
		posY = 1312,5,

		zones =	{ "ow_concourse", "ow_lavastone", "ow_threshold", "ow_barrierdebris", },
		conflict_time	= bzs2times.eu,
		tier	= 4, 
		next_subregion = "CloseRegionAntaress",
		star_pic = "system_star_blue",
	},
	
	CloseRegionAntaress = 
	{
		posX = 1153,5,
		posY = 1187,5,

		zones =	{ "ow_aliendebris13", "ow_ancientcomplex", "ow_desttown", "ow_alienruins", "ow_last_hope" },
		---conflict_time	= bzs2times.eu,
		---tier	= 4, 
		next_subregion = "RaceFrontierRegionJer",
		star_pic = "system_star_blue",
	},		
	
	CloseRegionNewCerera = 
	{
		posX = 1810,5,
		posY = 1203,5,

		zones =	{ "ow_northmsite", "ow_asteroidcity", },
		conflict_time	= bzs2times.us,
		tier	= 4, 
		next_subregion = "JerichoRegionSolaris",
		star_pic = "system_star_blue",
	},
	
	CloseRegionTroya = 
	{
		posX = 1761,5,
		posY = 596,5,

		zones =	{ "ow_gasgiant", "ow_transstance", "ow_asteroidsatellite" },
		---conflict_time	= bzs2times.ru,
		---tier	= 4, 
		next_subregion = "CloseRegionSheat",
		star_pic = "system_star_orange",
	},		

	CloseRegionPandora = 
	{
		posX = 1573,5,
		posY = 540,5,

		zones =	{ "ow_devilsjaw", "ow_anomaly", "ow_dreadnwreck", },
		conflict_time	= bzs2times.ru,
		tier	= 4, 
		next_subregion = "CloseRegionIdra",
		star_pic = "system_star_red",
	},
	
	CloseRegionKorsaTriama = 
	{
		posX = 1742,5,
		posY = 1113,5,

		zones =	{ "ow_aliendestsatation", },
		conflict_time	= bzs2times.asia,
		tier	= 4, 
		next_subregion = "CloseRegionNewCerera",
		star_pic = "system_star_yellow",
	},	
	
	CloseRegionHaldon = 
	{
		posX = 1815,5,
		posY = 1018,5,

		zones =	{ "ow_livestation", "ow_omega" },
		---conflict_time	= bzs2times.us,
		---tier	= 4, 
		next_subregion = "CloseRegionKorsaTriama",
		star_pic = "system_star_yellow",
	},	

	CloseRegionSheat = 
	{
		posX = 1896,5,
		posY = 636,5,

		zones =	{ "ow_da_prototype", },
		conflict_time	= bzs2times.ru,
		tier	= 4, 
		next_subregion = "FederationRegionVelorum",
		star_pic = "system_star_orange",
	},	

	CloseRegionIdra = 
	{
		posX = 1655,5,
		posY = 659,5,

		zones =	{ "ow_planet_war", "ow_planet_war_7",},
		conflict_time	= bzs2times.ru,
		tier	= 5,	--#106951
		next_subregion = "CloseRegionTroya",
		star_pic = "system_star_orange",
	},	

	EmpireRegionMenar = 
	{
		posX = 1375,5, 
		posY = 698,5, 

		zones =	{ "Empire_BigshipBuilding", },
		conflict_time	= bzs2times.ru,
		tier	= 4, 
		next_subregion = "EmpireRegionFelony",
		star_pic = "system_star_blue",
	},	

	EmpireRegionVior = 
	{
		posX = 2007,5, 
		posY = 1198,5, 
		
		zones =	{ "ow_bion", "ow_allidium_yard" },
		--conflict_time	= bzs2times.ru,
		--tier	= 3,
		next_subregion = { "CloseRegionNewCerera", "FederationRegionOlympus", },
		star_pic = "system_star_yellow",
	},

	EmpireRegionMorag = 
	{
		posX = 1783,5, 
		posY = 1339,5, 

		zones =	{ "ow_lunar", },
		--conflict_time	= bzs2times.ru,
		--tier	= 3,
		star_pic = "system_star_blue",
	},	

	EmpireRegionNith = 
	{
		posX = 2502,5, 
		posY = 1379,5, 

		zones =	{ "Precursor_Zona2", },
		--conflict_time	= bzs2times.ru,
		--tier	= 3,
		star_pic = "system_star_green",
	},	

	EmpireRegionShiningZone = 
	{
		posX = 796,5, 
		posY = 1321,5, 

		zones =	{ "Precursor_Zona1", "Portal_Zona1", "Portal_Zona2", "Portal_Zona3", "Portal_Zona4", "Portal_Zona5", "Portal_Zona6", "Portal_Zona7", "Portal_Zona8", "deathstar" },
		conflict_time	= bzs2times.lig,
		tier	= 5,
		star_pic = "system_star_green",
	},
	
	IllidiumLeviathan = 
	{
		posX = 1073,5, 
		posY = 988,5, 

		zones =	{ "Precursor_Zona3", },
		--conflict_time	= bzs2times.ru,
		--tier	= 1, 
		next_subregion = "EmpireRegionPride",
		star_pic = "system_star_blue",
	},
	
	RegionArtuga = 
	{
		posX = 1610, 
		posY = 770, 

		zones =	{ "ow_dreamland", "ow_captain_kidds_berth", "ow_foul_ground", "ow_northern_berth", "ow_skeleton_island", "ow_spyglass", "ow_the_fort" },
		--conflict_time	= bzs2times.ru,
		--tier	= 1,
		next_subregion = { "RaceFrontierRegionEmp", "CloseRegionIdra", "FederationRegionVelorum", "JerichoRegionPallas", },
		star_pic = "system_star_yellow",
	},
}

FreeSpaceMap.Regions = 
{
	EmpireRegion =
	{
		posX 		= 783,
		posY 		= 493,
		mapPosX		= 421,
		mapPosY 		= 214,
		mapSizeX 	= 10,
		mapSizeY 	= 100,
		
		zones 			= 
		{
			"Empire_IlayGateSirus3", "Empire_SirusDebrissite", "Empire_IlayGateSirus", "Empire_IlayGateSirus2", "Empire_IlayStation3", "Empire_HomeWorld", "Empire_IlayStation2", 
			"Empire_IlayMiningsite", "Empire_IlayGateRex3", "Empire_IlayGateRex", "Empire_IlayGateRex2", "Empire_RexFallenScrapyard", "Empire_BigshipBuilding", "Empire_CaptureRepairbase", "Empire_IlayClanbigship",
		},
		subRegions 			= 
		{
			"EmpireRegionFelony", "EmpireRegionOntregos", "EmpireRegionPride", "EmpireRegionMenar", 
		},
		
		owner 			= ai.Race.EMPIRE,
		link_regions	= { "FrontierRegion", "CloseRegion1", },		
	},

	FederationRegion = 
	{
		posX 		= 2540,
		posY 		= 734,
		mapPosX		= 2022,
		mapPosY		= 397,
		mapSizeX		= 220,
		mapSizeY		= 250,
		
		zones = 
		{
			"Federation_LumenConstructionsite", "Federation_LumenConstructionsite3", "Federation_LumenConstructionsite2", "Federation_NalnifanGateLumen", "Federation_HomeWorld", 
			"Federation_NalnifanShipyard2", "Federation_NalnifanShipyard", "Federation_NalnifanShipyard3", "Federation_NalnifanGateCarib", "Federation_CaribWaterharvest2",
			"Federation_CaribWaterharvest3", "Federation_CaribWaterharvest", "Federation_Geostation", "Federation_AsteroidBuilding", "Federation_FrozenStation", "Federation_NalnifanClanbigship", 
		},
		
		subRegions 	= 
		{
			"FederationRegionErebus", "FederationRegionOlympus", "FederationRegionVelorum",
		},
		
		link_regions	= { "FrontierRegion", "CloseRegion3",},
		owner 			= ai.Race.FEDERATION,
	},
	
	JerichoRegion = 
	{
		posX 		= 1296,
		posY 		= 1551,
		mapPosX		= 889,
		mapPosY		= 1264,
		mapSizeX		= 250,
		mapSizeY		= 200,
		
		zones = 
		{
			"Jericho_IsidGasharvest", "Jericho_IsidStation2", "Jericho_HomeWorld", "Jericho_IsidMiningsite", "Jericho_IsidMiningsite2", "Jericho_IsidGateMaseera", "Jericho_IsidMiningsite3",
			"Jericho_IsidStation3", "Jericho_MaseeraGateIsid", "Jericho_MaseeraGateIsid2", "Jericho_MaseeraGateIsid3", "Jericho_MaseeraTerramorphingsite", "Jericho_JerichoBase", "Jericho_IsidClanbigship",
		},
		
		subRegions 	= 
		{
			"JerichoRegionPallas", "JerichoRegionSolaris",
		},
		
		link_regions	= { "FrontierRegion", "CloseRegion2",},
		owner 			= ai.Race.JERICHO,
	},
	
	FrontierRegion = 
	{
		posX 		= 1686,
		posY 		= 799,
		mapPosX		= 1212,
		mapPosY		= 551,
		mapSizeX		= 400,
		mapSizeY		= 200,
		
		zones = 
		{
			"Empire_Frontier", "Federation_Frontier", "Jericho_Frontier", "Jericho_PirateBay",
		},
		
		subRegions 	= 
		{
			"RaceFrontierRegionEmp", "RaceFrontierRegionFed", "RaceFrontierRegionJer", "RaceFrontierRegionPir",
		},
		
		link_regions	= { "EmpireRegion", "FederationRegion", "JerichoRegion",  "CloseRegion1", "CloseRegion2", "CloseRegion3", },
	},
	
	CloseRegion1 = 
	{
		posX 		= 1550,
		posY 		= 133,
		mapPosX		= 1204,
		mapPosY		= 1,
		mapSizeX		= 400,
		mapSizeY		= 200,
		
		zones = 
		{
			"ow_gasgiant", "ow_dreadnwreck", "ow_anomaly", "ow_devilsjaw", "ow_da_prototype",
		},
		
		subRegions 	= 
		{
			"CloseRegionTroya", "CloseRegionPandora", "CloseRegionSheat", "CloseRegionIdra",
		},
		
		link_regions	= { "FrontierRegion", "EmpireRegion", },
	},	
	
	CloseRegion2 = 
	{
		posX 		= 1024,
		posY 		= 1095,
		mapPosX		= 694,
		mapPosY		= 915,
		mapSizeX		= 400,
		mapSizeY		= 200,
		
		zones = 
		{
			"ow_concourse", "ow_ancientcomplex", "ow_aliendebris13", "ow_lavastone", "ow_threshold", "ow_barrierdebris", "ow_alienruins",
		},
		
		subRegions 	= 
		{
			"CloseRegionProcssima", "CloseRegionAntaress",
		},
		
		link_regions	= { "FrontierRegion", "JerichoRegion", },
	},	

	CloseRegion3 = 
	{
		posX 		= 2343,
		posY 		= 1258,
		mapPosX		= 1895,
		mapPosY		= 902,
		mapSizeX		= 400,
		mapSizeY		= 200,
		
		zones = 
		{
			"ow_livestation", "ow_aliendestsatation", "ow_northmsite", "ow_asteroidcity",
		},
		
		subRegions 	= 
		{
			"CloseRegionHaldon", "CloseRegionKorsaTriama", "CloseRegionNewCerera",
		},
		
		link_regions	= { "FrontierRegion", "FederationRegion", },
	},	
}



-- для удобства сгенерируем таблицу для индексации по zone_id 
SpaceZoneById = {}

--
for name, desc in pairs( SpaceZone ) do
	
	-- addition simple error check
	if type( desc.zone_id ) ~= 'number' or desc.zone_id <= 0 then
		error( "SpaceZone." .. name .. " has wrong 'zone_id'" )
	end
	if SpaceZoneById[ desc.zone_id ] ~= nil then
		error( "SpaceZone." .. name .. " and SpaceZone." .. SpaceZoneById[ desc.zone_id ].zone_name .. " has same 'zone_id'=" .. tonumber( desc.zone_id ) )
	end
	
	desc.zone_name = name
	SpaceZoneById[ desc.zone_id ] = desc
	
end

-- для удобства сгенерируем таблицу со столицами по рассе (поле start_for_race)
SpaceCapitalByRace = {}

--
for name, desc in pairs( SpaceZone ) do
	
	if desc.start_for_race ~= nil then
		SpaceCapitalByRace[ desc.start_for_race ] = desc
	end
	
end

-- для удобства сгенерируем таблицу для получения айдишников по tier 
SpaceZoneByTier = {}
for name, desc in pairs( SpaceZone ) do
	if type( desc.zone_id ) ~= 'number' or desc.zone_id <= 0 then
		error( "SpaceZone." .. name .. " has wrong 'zone_id'" )
	end
	
	if desc.tier ~= nil and type( desc.tier ) == 'number' then
		if  SpaceZoneByTier[ desc.tier ] == nil then
			SpaceZoneByTier[ desc.tier ] = {}
		end
		
		table.insert( SpaceZoneByTier[ desc.tier ], desc.zone_id )
	end
end

--Заполнение наградами
--возможные награды владения
local zones_resource = { --12 - 24 \\ 150000 - 260000 \\ 4 -10
	{	type 		= GameStore.CreditsType.CT_GOLD, 
		amount 		= 6,
	},
	{	type 		= GameStore.CreditsType.CT_CREDITS, 
		amount 		= 60000,
	},
	{	type 		= GameStore.CreditsType.CT_TOKENS, 
		amount 		= 3,
	},
}
--- моификатор награды от ранга зоны
local zones_price_mod = {  
	2, 2, 2, 2.5,		-- 1-4
	2.5, 3, 3,  		-- 5-7
	3.5, 3.5, 4, 		-- 8-10
	4, 5, 5, 5, 5, 5-- 11-16
}

	
local d = 0
for name,desc in pairs( SpaceZone ) do
	if desc.reward_faction then
		--sys.log( "reward_amount %s - %d", name, desc.reward_amount)
		--string.len( desc.zone_name ) + desc.zone_id --совокупность для фиксированого числа рандомайза
		local res_number =  math.floor( math.fmod( string.len( desc.zone_name ) + desc.zone_id , 3 ) ) + 1 --1..3
		--sys.log( "1" )		
		local zone_rank = desc.rank or desc.min_ship_rank or 1
		if zone_rank > #zones_price_mod then
			zone_rank = #zones_price_mod
		elseif zone_rank < 1 then
			zone_rank = 1
		end

		--desc.ownage_reward_amount		= math.floor(zones_resource[ res_number ].amount * zones_price_mod[ zone_rank ] )
		--desc.ownage_reward_type		= zones_resource[ res_number ].type
	end
end


--- #59533 настройки ботов
for name,desc in pairs( SpaceZone ) do
	desc.npc_preset_name = "BotsOW"	-- перенёс чтобв и у зон не участвующих БЗС были настроены боты
	if desc.universe_zone then -- только для зон учавствующийх в БЗС
		
		--настройки наград #0059648: БЗС 2.5 : Новая система наград за владения
		if desc.tier and (not desc.min_ship_rank_coins ) then
			desc.min_ship_rank_coins = desc.tier * 3 - 2
		end
	end
	
	--- #62861 Эксперимент. зоны для пвп помечены отдельно, остальные теперь под защитой станции
	desc.civilian_zone = not desc.pvp

end

local n = 0
if  FreeSpaceMap and FreeSpaceMap.SubRegions then
	for name, system in pairs( FreeSpaceMap.SubRegions ) do
		n = n + 1
		if system.zones then
			for i, v in pairs( system.zones ) do
				if SpaceZone[ v ] then
					SpaceZone[ v ].stellar_system = n
				end
			end
		end
	end
end

--#0106283  Конвертируем старые награды в новые (временно)
-- for name, desc in pairs( SpaceZone ) do

	-- if desc.universe_zone then

		-- if desc.ownage_reward_type and desc.ownage_reward_type ~= GameStore.CreditsType.CT_INVALID then
			-- desc.reward_type = desc.ownage_reward_type
		-- else
			-- desc.reward_type = MasterServer.RewardType.RT_ITEM
			-- desc.reward_def = desc.ownage_reward_resource
		-- end

		-- desc.reward_value = desc.ownage_reward_amount
	-- end
-- end

--#0106283  Конвертируем новые награды в старые для UI (надеюсь временно, потом лучше переделать UI)
for name, desc in pairs( SpaceZone ) do

	if desc.universe_type == MasterServer.UniverseType.UT_BFS or desc.universe_type == MasterServer.UniverseType.UT_ARENA then

		desc.universe_zone = true -- для UI
	
		--if desc.universe_zone then
		--desc.conflictIntervalStart = "2019-04-01T18:00:00Z"
		--desc.conflictIntervalLong = 24 * 60 * 60
		--desc.universe_type = MasterServer.UniverseType.UT_BFS -- прописал нормально в рамках #106286

		if desc.reward_type == MasterServer.RewardType.RT_ITEM then
			desc.ownage_reward_type = GameStore.CreditsType.CT_INVALID
			desc.ownage_reward_resource = desc.reward_def
		elseif desc.reward_type == MasterServer.RewardType.RT_CREDITS then
			desc.ownage_reward_type = GameStore.CreditsType.CT_CREDITS
		elseif desc.reward_type == MasterServer.RewardType.RT_TOKEN_CREDITS then
			desc.ownage_reward_type = GameStore.CreditsType.CT_TOKENS
		elseif desc.reward_type == MasterServer.RewardType.RT_GOLD_CREDITS then
			desc.ownage_reward_type = GameStore.CreditsType.CT_GOLD
		end
		
		desc.ownage_reward_amount = desc.reward_value
	end
end
